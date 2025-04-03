Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C627EA7A4A0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 16:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936855.1337992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0LES-0008DS-V5; Thu, 03 Apr 2025 14:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936855.1337992; Thu, 03 Apr 2025 14:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0LES-0008Bf-SF; Thu, 03 Apr 2025 14:07:48 +0000
Received: by outflank-mailman (input) for mailman id 936855;
 Thu, 03 Apr 2025 14:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zd6c=WV=bounce.vates.tech=bounce-md_30504962.67ee962e.v1-593e12f073a34b31910b4c080aa294d0@srs-se1.protection.inumbo.net>)
 id 1u0LEQ-0008BZ-Ox
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 14:07:46 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02d48c1b-1095-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 16:07:44 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZT3Tp3k9yz705bPd
 for <xen-devel@lists.xenproject.org>; Thu,  3 Apr 2025 14:07:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 593e12f073a34b31910b4c080aa294d0; Thu, 03 Apr 2025 14:07:42 +0000
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
X-Inumbo-ID: 02d48c1b-1095-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743689262; x=1743959262;
	bh=dnyqZmyapdPA7XEuGH6HxDM6nIlOwjs8gSceVqZ4MgI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Szdtc6/+z54mk+sVh7iE8m7KJuC3c9FHMA49OT0mjFDrsASmmAd92KAJ0Dafe/COv
	 6JA9c4IxegNUZqhED3vm1qynVDRqbULiKeO+ODOjAAABxWH2kiopVGq2B3InGRBRPI
	 9Em+JP+rNCUGR4q4pHjtJSJzb0lMx4fFBtX4606diLvpOCXFLVdb1xcjvJoknpFKiw
	 29Y6FraSnZiz5HVwyjt9lDTMBCZxpBF/COmEto+Ntos+afnEs8Xnl5ewv25XGw4aup
	 LRF5u+JVqJg4pkKGvww+MIUwyQuaOpVHtLduDgT1AADfGzCqbIdwF2jzDVJVVsv5Fz
	 5t7mSX+E2g1Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743689262; x=1743949762; i=anthony.perard@vates.tech;
	bh=dnyqZmyapdPA7XEuGH6HxDM6nIlOwjs8gSceVqZ4MgI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M4oNS69eZDdqx1OOjRRKlMdsPa2XD/GMlBpsheJ71lnzi6xEMRV82MGsJrjH6TqlA
	 uNuJbns0PYCjDcNxUNBmb5u9oNftF8yZ6rDCMU8sP8oXVbXsfcNAj0FKRxBm8z89qN
	 5ljWCtPsdj+8AUI4YrxHA4oSKNXymzsxcqL77l05aRK6k0fkOuNyqwZ4o6YO4h4vpJ
	 Jg+f6AOh8wIxoNcJc7jtTYpdaqGYJYdxcSj3Xor9Q45LLqW1XGU/QBAaLufQC0+aY/
	 yq2mOu5hjsCH5bvXqCUGzomIdNjEtHZzM0Qh3CZ3FUkS/Ulcbsg7n9caZjWawutIxu
	 p9QEbv7N4SGrQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/arch:=20Simplify=20$(TARGET)-syms=20rule?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743689260286
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z-6WKwyXil0O_AAK@l14>
References: <20250401144703.961836-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250401144703.961836-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.593e12f073a34b31910b4c080aa294d0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250403:md
Date: Thu, 03 Apr 2025 14:07:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Apr 01, 2025 at 03:47:03PM +0100, Andrew Cooper wrote:
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 129a109d6ec5..811adf3567c4 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -96,21 +96,19 @@ ifeq ($(CONFIG_ARM_64),y)
>  	ln -sf $(@F) $@.efi
>  endif
>  
> +$(TARGET)-syms: XEN_LDFLAGS += -T $(obj)/xen.lds

I would advise againts this change. Target-specific variables values
tend to apply to prerequist as well, so XEN_LDFLAGS will also be
modified when building prelink.o and xen.lds. It's might be ok in this
case because xen.lds doesn't use it, and prelink.o happen to be linked
in a different Makefile, but that's kind of setting a trap for someone
to fall into.

There's a keyword to keep the variable change strictly to $(TARGET)-syms
but that requires a more recent version of GNU make. That would be
"private" if we could use it. Looks like we need GNU make 3.82 to use
"private":
    "GNU make 3.82 is now available"
    https://lists.gnu.org/archive/html/info-gnu/2010-07/msg00023.html

>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> -	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> +	$(LD) $(XEN_LDFLAGS) $< $(objtree)/common/symbols-dummy.o -o $(dot-target).0

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

