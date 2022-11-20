Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C5C63138F
	for <lists+xen-devel@lfdr.de>; Sun, 20 Nov 2022 12:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446274.701824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owiBZ-00080A-NM; Sun, 20 Nov 2022 11:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446274.701824; Sun, 20 Nov 2022 11:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owiBZ-0007xn-Ic; Sun, 20 Nov 2022 11:08:29 +0000
Received: by outflank-mailman (input) for mailman id 446274;
 Sun, 20 Nov 2022 11:08:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31yl=3U=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1owiBX-0007xd-DP
 for xen-devel@lists.xenproject.org; Sun, 20 Nov 2022 11:08:27 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4aa87df-68c3-11ed-91b6-6bf2151ebd3b;
 Sun, 20 Nov 2022 12:08:25 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1668942496767420.7787927416391;
 Sun, 20 Nov 2022 03:08:16 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a4aa87df-68c3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; t=1668942497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kEw47x2QrPTksyBHc/8JvHHX4rF+TZgUCdoprA3fI3Qy/3xbBjjnVNdc852kKvnPip7lZVxjZ1gysNE8fLeIqCMBHYmPpSdqFqWLfy2maOfEMT3jTFsK0Xj4WVIZJz4yHUDHTHc8ItmdKS6yki/62rz7RUw5oddD4irtTnv/T0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1668942497; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=10Dq8n20jXc8W6amE2OsE6o/Jj6s5bwGfjdY3iz1oU4=; 
	b=YNEWL6I6Wi0gt1rmFwwdXPDuRt9bmkexrg95VAHHO3Oat0fRp1GrnkewA9UOqkWGsHQJfew138YFYqxR8FApNpZ6aRPYc9N0T4bGK+XmQwz85RtkpDHdLdmHnmKm5Q+zeZ2UybbxkDuWCpWd13yKWpEh+R1JN5G2MhU3y0rZMQ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1668942497;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=10Dq8n20jXc8W6amE2OsE6o/Jj6s5bwGfjdY3iz1oU4=;
	b=YGfQ9kT36WTVML9VpAsdwbMaJmTd5Iq/+hgATQDmMHCuD/sQY8/BBX8UtjvyA7la
	Jl9Iqqe8Ku5273TIr+XtIsS0PdnegBxLqEi0U7IM6pCqY0Qx+IesedyZEm+o9q+m1SD
	VhCED9bVRKg399NOJscmd9XxPsVf9FlxhIaZsVrQ=
Message-ID: <d367e187-015b-5aca-92eb-ccb8fead208d@apertussolutions.com>
Date: Sun, 20 Nov 2022 06:08:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <osstest-174809-mainreport@xen.org>
 <Y3eZOcmOYkNLdeGe@Air-de-Roger>
 <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
 <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/18/22 16:10, Jason Andryuk wrote:
> On Fri, Nov 18, 2022 at 12:22 PM Andrew Cooper
> <Andrew.Cooper3@citrix.com> wrote:
>>
>> On 18/11/2022 14:39, Roger Pau Monne wrote:
>>> Nov 18 01:55:11.753936 (XEN) arch/x86/mm/hap/hap.c:304: d1 failed to allocate from HAP pool
>>> Nov 18 01:55:18.633799 (XEN) Failed to shatter gfn 7ed37: -12
>>> Nov 18 01:55:18.633866 (XEN) d1v0 EPT violation 0x19c (--x/rw-) gpa 0x0000007ed373a1 mfn 0x33ed37 type 0
>>> Nov 18 01:55:18.645790 (XEN) d1v0 Walking EPT tables for GFN 7ed37:
>>> Nov 18 01:55:18.645850 (XEN) d1v0  epte 9c0000047eba3107
>>> Nov 18 01:55:18.645893 (XEN) d1v0  epte 9c000003000003f3
>>> Nov 18 01:55:18.645935 (XEN) d1v0  --- GLA 0x7ed373a1
>>> Nov 18 01:55:18.657783 (XEN) domain_crash called from arch/x86/hvm/vmx/vmx.c:3758
>>> Nov 18 01:55:18.657844 (XEN) Domain 1 (vcpu#0) crashed on cpu#8:
>>> Nov 18 01:55:18.669781 (XEN) ----[ Xen-4.17-rc  x86_64  debug=y  Not tainted ]----
>>> Nov 18 01:55:18.669843 (XEN) CPU:    8
>>> Nov 18 01:55:18.669884 (XEN) RIP:    0020:[<000000007ed373a1>]
>>> Nov 18 01:55:18.681711 (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d1v0)
>>> Nov 18 01:55:18.681772 (XEN) rax: 000000007ed373a1   rbx: 000000007ed3726c   rcx: 0000000000000000
>>> Nov 18 01:55:18.693713 (XEN) rdx: 000000007ed2e610   rsi: 0000000000008e38   rdi: 000000007ed37448
>>> Nov 18 01:55:18.693775 (XEN) rbp: 0000000001b410a0   rsp: 0000000000320880   r8:  0000000000000000
>>> Nov 18 01:55:18.705725 (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>>> Nov 18 01:55:18.717733 (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
>>> Nov 18 01:55:18.717794 (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
>>> Nov 18 01:55:18.729713 (XEN) cr3: 0000000000400000   cr2: 0000000000000000
>>> Nov 18 01:55:18.729771 (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000002
>>> Nov 18 01:55:18.741711 (XEN) ds: 0028   es: 0028   fs: 0000   gs: 0000   ss: 0028   cs: 0020
>>>
>>> It seems to be related to the paging pool adding Andrew and Henry so
>>> that he is aware.
>>
>> Summary of what I've just given on IRC/Matrix.
>>
>> This crash is caused by two things.  First
>>
>>    (XEN) FLASK: Denying unknown domctl: 86.
>>
>> because I completely forgot to wire up Flask for the new hypercalls.
>> But so did the original XSA-409 fix (as SECCLASS_SHADOW is behind
>> CONFIG_X86), so I don't feel quite as bad about this.
> 
> Broken for ARM, but not for x86, right?
> 
> I think SECCLASS_SHADOW is available in the policy bits - it's just
> whether or not the hook functions are available?
> 
>> And second because libxl ignores the error it gets back, and blindly
>> continues onward.  Anthony has posted "libs/light: Propagate
>> libxl__arch_domain_create() return code" to fix the libxl half of the
>> bug, and I posted a second libxl bugfix to fix an error message.  Both
>> are very simple.
>>
>>
>> For Flask, we need new access vectors because this is a common
>> hypercall, but I'm unsure how to interlink it with x86's shadow
>> control.  This will require a bit of pondering, but it is probably
>> easier to just leave them unlinked.
> 
> It sort of seems like it could go under domain2 since domain/domain2
> have most of the memory stuff, but it is non-PV.  shadow has its own
> set of hooks.  It could go in hvm which already has some memory stuff.

Since the new hypercall is for managing a memory pool for any domain, 
though HVM is the only one supported today, imho it belongs under 
domain/domain2.

Something to consider is that there is another guest memory pool that is 
managed, the PoD pool, which has a dedicated privilege for it. This 
leads me to the question of whether access to manage the PoD pool and 
the paging pool size should be separate accesses or whether they should 
be under the same access. IMHO I believe it should be the latter as I 
can see no benefit in disaggregating access to the PoD pool and the 
paging pool. In fact I find myself thinking in terms of should the 
managing domain have control over the size of any backing memory pools 
for the target domain. I am not seeing any benefit to discriminating 
between which backing memory pool a managing domain should be able to 
manage. With that said, I am open to being convinced otherwise.

Since this is an XSA fix that will be backported, moving get/set PoD 
hypercalls under a new permission would be too disruptive. I would 
recommend introducing the permission set/getmempools under the domain 
access vector, which will only control access to the paging pool. Then 
planning can occur for 4.18 to look at transitioning get/set PoD target 
to being controlled via get/setmempools.

>> Flask is listed as experimental which means it doesn't technically
>> matter if we break it, but it is used by OpenXT so not fixing it for
>> 4.17 would be rather rude.
> 
> It's definitely nicer to have functional Flask in the release.  OpenXT
> can use a backport if necessary, so it doesn't need to be a release
> blocker.  Having said that, Flask is a nice feature of Xen, so it
> would be good to have it functioning in 4.17.

As maintainer I would really prefer not to see 4.17 go out with any part 
of XSM broken. While it is considered experimental, which I hope to 
rectify, it is a long standing feature that has been kept stable, and 
for which there is a sizeable user base. IMHO I think it deserves a 
proper fix before release.

V/r,
Daniel P. Smith

