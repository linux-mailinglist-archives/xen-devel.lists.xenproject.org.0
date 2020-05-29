Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321B1E86BE
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 20:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jejs5-0002i2-9A; Fri, 29 May 2020 18:36:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jejs3-0002hx-W2
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 18:36:44 +0000
X-Inumbo-ID: 56077277-a1db-11ea-a904-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56077277-a1db-11ea-a904-12813bfff9fa;
 Fri, 29 May 2020 18:36:42 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40022
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jejry-0011li-KS (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 19:36:38 +0100
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f6ec0a0e-c7d0-22b5-b633-458a7fe2375f@citrix.com>
Date: Fri, 29 May 2020 19:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 12:59, Jan Beulich wrote:
> On 28.05.2020 20:10, Andrew Cooper wrote:
>> On 28/05/2020 11:25, Jan Beulich wrote:
>>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -34,6 +34,10 @@ config ARCH_DEFCONFIG
>>>>  config INDIRECT_THUNK
>>>>  	def_bool $(cc-option,-mindirect-branch-register)
>>>>  
>>>> +config HAS_AS_CET
>>>> +	# binutils >= 2.29 and LLVM >= 7
>>>> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
>>> So you put me in a really awkward position: I'd really like to see
>>> this series go in for 4.14, yet I've previously indicated I want the
>>> underlying concept to first be agreed upon, before any uses get
>>> introduced.
>> There are already users.  One of them is even in context.
> Hmm, indeed. I clearly didn't notice this aspect when reviewing
> Anthony's series.
>
>> I don't see that there is anything open for dispute in the first place. 
>> Being able to do exactly this was a one key driving factor to a newer
>> Kconfig, because it is superior mechanism to the ad-hoc mess we had
>> previously (not to mention, a vast detriment to build time).
> This "key driving factor" was presumably from your perspective.
> Could you point me to a discussion (and resulting decision) that
> this is an explicit goal of that work? I don't recall any, and
> hence I also don't recall having been given a chance in influence
> the direction, decision, and overall outcome.

It took up a large chunk of the build system design session in Chicago.

>
> In the interest of getting this series in for 4.14, and on the
> assumption that you're willing to have a discussion on the
> direction wrt storing tool chain capabilities in .config before
> any further uses get added (and with the potential need to undo
> the ones we have / gain here)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

