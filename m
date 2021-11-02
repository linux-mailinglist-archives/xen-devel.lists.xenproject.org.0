Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC34439DA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 00:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220518.381811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi3Ky-00034T-K2; Tue, 02 Nov 2021 23:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220518.381811; Tue, 02 Nov 2021 23:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi3Ky-00032k-Gy; Tue, 02 Nov 2021 23:37:04 +0000
Received: by outflank-mailman (input) for mailman id 220518;
 Tue, 02 Nov 2021 23:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8t6=PV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mi3Kw-00032e-Sn
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 23:37:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 203fec70-bb72-409c-92b3-99114d68da03;
 Tue, 02 Nov 2021 23:37:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 424D860FC2;
 Tue,  2 Nov 2021 23:37:00 +0000 (UTC)
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
X-Inumbo-ID: 203fec70-bb72-409c-92b3-99114d68da03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635896221;
	bh=h6JpkxWa8uAscXT7x9lmGWbqIpwacAP58HzNhh6Fkdk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ktIkdlT/UCODVMRyuKB/vX0ybNy+EWqfb+Ml1H6JfkzBAVNKbircJtPcqZL70QAOZ
	 6q4Sh6eUhPGecJAX4nkxPGGfSK0JweV+gK64tESGOgyekQywka0ZMzEuSvvjMm05zx
	 8shDxbJYO0gNHNul1TLCvon8pj1ywraXEGHyYZ3R/l12XMWHNNRBL3FxpCLoUuHT7z
	 6qCtAb9aXv0Y2FZVoYdXTYLJOhWlg71FnHWriQ3jr2KAVnQf1kq+udyITl2nwH8QI5
	 vgzDp+XKNEzN71v8zlUjqr74xPXqQYAgR9lviAlSSy/k82ZD/Ul4XPZfxBLXBRHr2C
	 eq9fKvvrzEXng==
Date: Tue, 2 Nov 2021 16:36:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, wei.chen@arm.com
Subject: Re: Arm EFI boot issue for Dom0 module listed inside subnode of
 chosen
In-Reply-To: <8A60FA62-2BAA-400B-BB53-AB3E8CCA67F1@arm.com>
Message-ID: <alpine.DEB.2.21.2111021625160.18170@sstabellini-ThinkPad-T480s>
References: <8A60FA62-2BAA-400B-BB53-AB3E8CCA67F1@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1102840733-1635896221=:18170"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1102840733-1635896221=:18170
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 2 Nov 2021, Luca Fancellu wrote:
> Hi all,
> 
> We recently discovered that there is a way to list Dom0 modules that is not supported by the EFI boot,
> It’s happened browsing some Wiki pages like this one:
> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Lager
> 
> In that page the Dom0 modules are listed inside a subnode of the /chosen node:
> 
> chosen {
> 
>     modules {
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
>         module@0x72000000 {
>             compatible = "multiboot,kernel", "multiboot,module";
>             reg = <0x72000000 0x2fd158>;
>         };
> 
>         module@0x74000000 {
>             compatible = "xen,xsm-policy", "multiboot,module";
>             reg = <0x74000000 0x2559>;
>         };
>     };
> };
> 
> Instead for how it is implemented now in the EFI code and described in:
> 1) https://xenbits.xen.org/docs/unstable/misc/arm/device-tree/booting.txt
> 2) https://xenbits.xen.org/docs/unstable/misc/efi.html
> 
> Only the following approach is supported, so Dom0 modules must be a direct child of /chosen:
> 
> chosen {
>     #address-cells = <1>;
>     #size-cells = <1>;
> 
>     module@0x72000000 {
>         compatible = "multiboot,kernel", "multiboot,module";
>         reg = <0x72000000 0x2fd158>;
>     };
> 
>     module@0x74000000 {
>         compatible = "xen,xsm-policy", "multiboot,module";
>         reg = <0x74000000 0x2559>;
>     };
> };
> 
> Is this a problem that needs a fix?


Let me start by saying that I don't feel strongly either way, so I am
happy to go with other people's opinion on this one.

In this kind of situations I usually look at two things:
- what the specification says
- what the existing code actually does

In general, I try to follow the specification unless obviously
production code relies on something that contradicts the spec, in which
case I'd say to update the spec.

In this case, although it is true that "modules" could be nice to have,
it is missing a compatible string, it is not described in
arm/device-tree/booting.txt, and it is only rarely used.

For these reasons, I don't think it is a problem that we need to fix.
Especially considering that the EFI case is the only case not working
and it was never supported until now.

If we want to add support for "modules", that could be fine, but I think
we should describe it in arm/device-tree/booting.txt and also add a
compatible string for it. For 4.16 I'd just update the wikipage.
--8323329-1102840733-1635896221=:18170--

