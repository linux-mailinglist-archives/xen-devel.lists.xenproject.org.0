Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8E654938
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 00:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468751.727942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Us4-0003kT-AL; Thu, 22 Dec 2022 23:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468751.727942; Thu, 22 Dec 2022 23:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Us4-0003i0-73; Thu, 22 Dec 2022 23:21:04 +0000
Received: by outflank-mailman (input) for mailman id 468751;
 Thu, 22 Dec 2022 23:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8Us3-0003hs-8q
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 23:21:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bf6ae07-824f-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 00:21:01 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D4FD61D9F;
 Thu, 22 Dec 2022 23:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0520C433D2;
 Thu, 22 Dec 2022 23:20:58 +0000 (UTC)
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
X-Inumbo-ID: 4bf6ae07-824f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671751259;
	bh=oD+2N+jdsoivCuS/+DRIwP80/xnVfRrOBr7Jd4x977g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MnEnlGKw/HvpxATku5JKjfkORqr71BrhB0gP/Se468/9bL2MxNMzwcSl4EBgTsD47
	 3P077XJnNrbrlUnbHs9ubORhkhBVCn3VLIW1D6dgHyGn26TZq7UyOw/Unl4DIfImud
	 aIdaEGvOe/vaTXYQLwXwX7GLA9hCFSWdPNdbkLClrk9O27jf9yNjrVy1xKRhow3NOj
	 aYCDMIHlOtdSPDdpkDZUZL8iiGPhM4NfNVlzThEpS1EBk2dwqfwYh1zpLxe948qRKZ
	 QUtHHUPa5LsXbIMXGP7wLudB1w6T7Xg1I90HL0lyGpxYBBhUtb7g1amum0lJ/HCmsH
	 WXyTsprGEjofA==
Date: Thu, 22 Dec 2022 15:20:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for
 the translation between u64 and paddr_t
In-Reply-To: <74786a57-d99a-6cfe-f475-df11c0d93afa@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212221520020.4079@ubuntu-linux-20-04-desktop>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com> <20221215193245.48314-3-ayan.kumar.halder@amd.com> <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org> <alpine.DEB.2.22.394.2212161643400.315094@ubuntu-linux-20-04-desktop>
 <74786a57-d99a-6cfe-f475-df11c0d93afa@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Dec 2022, Julien Grall wrote:
> On 17/12/2022 00:46, Stefano Stabellini wrote:
> > On Fri, 16 Dec 2022, Julien Grall wrote:
> > > Hi Ayan,
> > > 
> > > On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> > > > paddr_t may be u64 or u32 depending of the type of architecture.
> > > > Thus, while translating between u64 and paddr_t, one should check that
> > > > the
> > > > truncated bits are 0. If not, then raise an appropriate error.
> > > 
> > > I am not entirely convinced this extra helper is worth it. If the user
> > > can't
> > > provide 32-bit address in the DT, then there are also a lot of other part
> > > that
> > > can go wrong.
> > > 
> > > Bertrand, Stefano, what do you think?
> > 
> > In general, it is not Xen's job to protect itself against bugs in device
> > tree. However, if Xen spots a problem in DT and prints a helpful message
> > that is better than just crashing because it gives a hint to the
> > developer about what the problem is.
> 
> I agree with the principle. In practice this needs to be weight out with the
> long-term maintenance.
> 
> > 
> > In this case, I think a BUG_ON would be sufficient.
> 
> BUG_ON() is the same as panic(). They both should be used only when there are
> no way to recover (see CODING_STYLE).
> 
> If we parse the device-tree at boot, then BUG_ON() is ok. However, if we need
> to parse it after boot (e.g. the DT overlay from Vikram), then we should
> definitely not call BUG_ON() for checking DT input.

yeah, I wasn't thinking of that series


> The correct way is like Ayan did by checking returning an error and let
> the caller deciding what to do.
> 
> My concern with his approach is the extra amount of code in each caller to
> check it (even with a new helper).
> 
> I am not fully convinced that checking the addresses in the DT is that useful.

I am also happy not to do it to be honest


> However, if you both want to do it, then I think it would be best to introduce
> wrappers over the Device-Tree ones that will check the truncation.
> 
> For example, we could introduce dt_device_get_address_checked()
> that will call dt_device_get_address() and then check for 32-bit truncation.
> 
> For the function device_tree_get_reg(), this helper was aimed to deal with
> just Physical address 'reg' very early. So we can modify the prototype and
> update the function to check for 32-bit truncation.
> 
> Note that I am suggesting a different approach for the two helpers because the
> former is generic and it is not clear to me whether this could be used in
> another context than physical address.


