Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E838BE315
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718094.1120635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KYy-0001tL-67; Tue, 07 May 2024 13:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718094.1120635; Tue, 07 May 2024 13:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KYy-0001qC-3V; Tue, 07 May 2024 13:08:56 +0000
Received: by outflank-mailman (input) for mailman id 718094;
 Tue, 07 May 2024 13:08:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4KYw-0001ow-Nx
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:08:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4KYq-0006bB-MT; Tue, 07 May 2024 13:08:48 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4KYq-0000VR-F9; Tue, 07 May 2024 13:08:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=s5G8FN5uL7yRNPiJ3fk4NTa+OOMfgP91t9ubDbT1ESc=; b=a/TT4LtV86K3vMf5loeQRpKREX
	/dIOWDOTaxK40ER0DFfIg34tWMUZmaNEWfxqA7Ul8NrYc4I2dnHKY0hkljOM0I00qRexwQbMOz/qD
	61BKFI/ZNbT/PtR8r0S5yyg7BOEoEXFLxSTs/6XLQ/Ol2ko0kXa187/gKO8+/S3Qe7Mw=;
Message-ID: <0eff541b-51c9-4764-b8c2-b686d5e602ce@xen.org>
Date: Tue, 7 May 2024 14:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
 <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
 <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
 <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
 <29296e11-8d21-4867-9d31-fc94af828214@suse.com>
 <146fbd43-d8b8-4d73-8650-c60024498324@xen.org>
 <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop>
 <b3299df2-e726-49eb-a893-cbc547b2419c@xen.org>
 <alpine.DEB.2.22.394.2405031159240.1151289@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2405031159240.1151289@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 03/05/2024 20:07, Stefano Stabellini wrote:
> On Fri, 3 May 2024, Julien Grall wrote:

[...]

>> So are you saying that from Xen point of view, you are expecting no difference
>> between 256 and 512. And therefore you would be happy if to backport patches
>> if someone find differences (or even security issues) when using > 256 pCPUs?
> 
> It is difficult to be sure about anything that it is not regularly
> tested. I am pretty sure someone in the community got Xen running on an
> Ampere, so like you said 192 is a good number. However, that is not
> regularly tested, so we don't have any regression checks in gitlab-ci or
> OSSTest for it.
> 
> One approach would be to only support things regularly tested either by
> OSSTest, Gitlab-ci, or also Xen community members. I am not sure what
> would be the highest number with this way of thinking but likely no
> more than 192, probably less. I don't know the CPU core count of the
> biggest ARM machine in OSSTest.

This would be rochester* (Cavium Thunder-X). They have 96 pCPUs which, 
IIRC, are split across two numa nodes.

> 
> Another approach is to support a "sensible" number: not something tested
> but something we believe it should work. No regular testing. (In safety,
> they only believe in things that are actually tested, so this would not
> be OK. But this is security, not safety, just FYI.) With this approach,
> we could round up the number to a limit we think it won't break. If 192
> works, 256/512 should work? I don't know but couldn't think of something
> that would break going from 192 to 256.

It depends what you mean by work/break. Strictly speaking, Xen should 
run (i.e. not crash). However, it is unclear how well as if you increase 
the number of physical CPUs, you will increase contention and may find 
some bottleneck.

I haven't done any performance testing with that many CPUs and I haven't 
seen any so far with Xen. But I have some areas of concerns.

* Xenstored: At least the C version is single-threaded. Technically the 
limit here is not based on the number of pCPUs, but as you increase it, 
you indirectly increase the number of domains that can run. I doubt it 
will behave well if you have 4096 domains running (I am thinking about 
the x86 limit...).

* Locking
   * How Xen use the locks: I don't think we have many places where we 
have global locks (one is the memory subsystem). If a lock is already 
taken, the others will spin. It is unclear if we could high contending.
   * How Xen implements the locks: At the moment, we are using LL/SC. My 
take of XSA-295 is there is a lack of fairness with them. I am not sure 
what would happen if they get contented (as we support more pCPUs). It 
is also probably time to finally implement LSE atomics.

* TLB flush: The TLB flush are broadcasted. There are some suggestions 
on the Linux ML [1] that they don't perform well on some processors. The 
discussion seems to have gone nowhere in Linux. But I think it is 
propably worth to take into account when we decide to update the limit 
we (security) support.

> 
> It depends on how strict we want to be on testing requirements.
 From above, I am rather worry about claiming that Xen can supports up 
to 256 (and TBH even 192) without any proper testing. This could end up 
to backfire as we may need to do (in a rush) and backport some rather 
large work (unless we decide to remove support after the fact).

I think I would prefer if we have a low number until someone can do some 
testing (including potentially malicious guest). If we want for a 
power-of-two, I would go with 128 because this is closer to the HW we 
have in testing. If in the future someone can show some data on other 
platforms (e.g. Ampere), then we can up the limit.

 > I am not
 > sure what approach was taken by x86 so far.

It is unclear to me. I don't see how we can claim to support up to 4096 
CPUs. But that's for the x86 folks to decide.

Cheers,

[1] 
https://lore.kernel.org/linux-arm-kernel/20190617143255.10462-1-indou.takao@jp.fujitsu.com/

-- 
Julien Grall

