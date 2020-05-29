Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C81E7A0C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:07:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebuk-0005pN-RP; Fri, 29 May 2020 10:06:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jebuj-0005pI-Jh
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:06:57 +0000
X-Inumbo-ID: 2022cf76-a194-11ea-a885-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2022cf76-a194-11ea-a885-12813bfff9fa;
 Fri, 29 May 2020 10:06:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 665E5ABE2;
 Fri, 29 May 2020 10:06:54 +0000 (UTC)
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: George Dunlap <George.Dunlap@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <757d53a0-ec8f-62f1-ca20-72eaf9e1c84d@suse.com>
 <9A98D1CA-83E5-4E03-8ED6-E353653338CB@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <92986869-678c-572f-89f4-ccf84039022a@suse.com>
Date: Fri, 29 May 2020 12:06:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9A98D1CA-83E5-4E03-8ED6-E353653338CB@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 11:55, George Dunlap wrote:
> 
> 
>> On May 29, 2020, at 9:52 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.05.2020 18:08, George Dunlap wrote:
>>>> On May 27, 2020, at 4:41 PM, Ian Jackson <ian.jackson@citrix.com> wrote:
>>>> 2. Xen should disable the XSM policy build when FLASK is disabled.
>>>> This is unfortunately not so simple because the XSM policy build is a
>>>> tools option and FLASK is a Xen option and the configuration systems
>>>> are disjoint.  But at the very least a default build, which has no XSM
>>>> support, should not build an XSM policy file either.
>>>
>>> A simple thing to do here would be to have the flask policy controlled by a configure --flask option.  If neither --flask nor --no-flask is specified, we could maybe have configure also check the contents of xen/.config to see if CONFIG_XSM_FLASK is enabled?
>>
>> But that's creating a chicken-and-egg problem: There's no ordering
>> between the tools/ and xen/ builds. xen/ may not be built at all,
>> and this is going to become increasingly likely once the xen/ part
>> of the tree supports out-of-tree builds (at least I'll switch most
>> of my build trees to that model as soon as it's available).
> 
> Do out-of-tree builds put the .config out of tree as well?  If so, yes, that would definitely limit the usefulness of this idea.

Yes, all output files go into the build tree, to keep the source tree
clean. And .config is effectively an output file, despite it possibly
getting pre-populated into the build tree.

> My suggestion was based on the idea that a “typical” build *which might enable XSM* would look like this:
> 
> 1. Run ‘make menuconfig’ (or something like it) in xen/
> 
> 2. Run ./configure at the toplevel
> 
> 3. Do the full build.
> 
> But looking back at it, there’s no particular reason that someone coming to build Xen might expect to do things in that order rather than #1.
> 
> It might make sense to simply declare that the tools depend on the xen config, and modifying ./configure to represent that:
> 
> 1. Add a `—xen-config=` option to configure telling it where to look for the xen config; if that’s not specified, look for a specific shell variable saying where the Xen tree is; if that’s not available, looking in the current tree.
> 
> 2. Have ./configure fail by default if it can’t find a .config, unless —no-xen-config is specified.

Hmm, yes, that's certainly an option. The intended behavior with
--no-xen-config would be of interest though: Just what it is
now, i.e. controlled by yet another configure option?

>> Do we perhaps need to resort to a make command line option, usable
>> at the top level as well as for major subtree builds, and being
>> honored (as long as set either way, falling back to current
>> behavior if unset) by both ./configure and the hypervisor's
>> Kconfig?
> 
> What kind of command-line option did you have in mind?

Something like "XSM_FLASK=y".

Jan

