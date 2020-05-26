Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791B1E29A4
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 20:07:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jddy6-00040d-11; Tue, 26 May 2020 18:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgeY=7I=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jddy4-00040Y-7K
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 18:06:24 +0000
X-Inumbo-ID: 9bae6968-9f7b-11ea-a690-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bae6968-9f7b-11ea-a690-12813bfff9fa;
 Tue, 26 May 2020 18:06:23 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:57706
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jddy0-000RQN-MI (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 26 May 2020 19:06:21 +0100
Subject: Re: [PATCH 03/16] x86/traps: Factor out exception_fixup() and make
 printing consistent
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-4-andrew.cooper3@citrix.com>
 <f7cb696a-5c2c-4aa6-d379-ed77772b7c35@suse.com>
 <a397dd69-2384-a4af-d127-9189a730a554@citrix.com>
 <afd75bde-9adf-d8cf-f8cf-24cb1b753253@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9c939815-a4f9-75d7-3b6b-b8921de6cdb9@citrix.com>
Date: Tue, 26 May 2020 19:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <afd75bde-9adf-d8cf-f8cf-24cb1b753253@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 14:05, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 11.05.2020 17:14, Andrew Cooper wrote:
>> On 04/05/2020 14:20, Jan Beulich wrote:
>>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/traps.c
>>>> +++ b/xen/arch/x86/traps.c
>>>> @@ -774,10 +774,27 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>>>            trapnr, vec_name(trapnr), regs->error_code);
>>>>  }
>>>>  
>>>> +static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>>>> +{
>>>> +    unsigned long fixup = search_exception_table(regs);
>>>> +
>>>> +    if ( unlikely(fixup == 0) )
>>>> +        return false;
>>>> +
>>>> +    /* Can currently be triggered by guests.  Make sure we ratelimit. */
>>>> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )
>>> I didn't think we consider dprintk()-s a possible security issue.
>>> Why would we consider so a printk() hidden behind
>>> IS_ENABLED(CONFIG_DEBUG)? IOW I think one of XENLOG_GUEST and
>>> IS_ENABLED(CONFIG_DEBUG) wants dropping.
>> Who said anything about a security issue?
> The need to rate limit is (among other aspects) to prevent a
> (logspam) security issue, isn't it?

Rate limiting (from a security aspect) is a stopgap solution to relieve
incidental pressure on the various global spinlocks involved.

It specifically does not prevent a guest from trivially filling the
console ring with junk, or for that junk to be written to
/var/log/xen/hypervisor.log at an alarming rate, both of which are
issues in production setups, but not security issues.

Technical solutions to these problems do exist, such as deleting the
offending printk(), or maintaining per-guest console rings, but both
come with downsides in terms of usability, which similarly impacts
production setups.


What ratelimiting even in debug builds gets you is a quick spate of
printks() (e.g. any new sshd connection on an AMD system where the
MSR_VIRT_SPEC_CTRL patch is still uncommitted, and the default WRMSR
behaviour breaking wrmsr_safe() logic in Linux) not wasting an
unreasonable quantity of space in the console ring.

~Andrew

