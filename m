Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450AF4295B8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206413.361975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzBK-0000Qc-BP; Mon, 11 Oct 2021 17:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206413.361975; Mon, 11 Oct 2021 17:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzBK-0000Nx-7l; Mon, 11 Oct 2021 17:33:46 +0000
Received: by outflank-mailman (input) for mailman id 206413;
 Mon, 11 Oct 2021 17:33:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mZzBI-0000Nr-QR
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:33:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61793dde-2ab9-11ec-80ee-12813bfff9fa;
 Mon, 11 Oct 2021 17:33:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCF5260E78;
 Mon, 11 Oct 2021 17:33:42 +0000 (UTC)
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
X-Inumbo-ID: 61793dde-2ab9-11ec-80ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633973623;
	bh=T3dE3duvaT7dDvFbb1WavfcABhCpP4MuROJ7Q1FBVT0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oUZOAwktmCaKkUBrdnU0Wv3tskdNazpgGuLWGugLkvV9gaSsX/C5dnE5K5PYvs2nN
	 y5JqgbG5iI4vIc1sFFZcnsQ+9Ey69fxJnjP1I3t8BLh0bnAI8pYDjxCa0SQKx58skT
	 XhTXWMvFHvm/6QV44xMUNE4P/YTcdl9fyicxe6NGbceDytZidiqQ1XlO43fJOdYuy7
	 yL/Jgq5NBhPakCRd/5CKmmkR4BrCH9PzGYNbrGpK+tNjUYzYf1UqZm8C2oNScIY1zS
	 EeDgogbPfzSa5KhsBljQ5RVRhfh/iVbpYYb33C2VM0r784+WSLNlIIDo0QdnNvVqke
	 Q7JMH/oao8wWw==
Date: Mon, 11 Oct 2021 10:33:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/efi: Fix null pointer dereference
In-Reply-To: <3608432D-0D55-4373-B262-328A096C1388@arm.com>
Message-ID: <alpine.DEB.2.21.2110111033340.25528@sstabellini-ThinkPad-T480s>
References: <20211011075638.23785-1-luca.fancellu@arm.com> <3608432D-0D55-4373-B262-328A096C1388@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Bertrand Marquis wrote:
> Hi Luca,
> 
> > On 11 Oct 2021, at 08:56, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> > 
> > Fix for commit 60649d443dc395243e74d2b3e05594ac0c43cfe3
> > that introduces a null pointer dereference when the
> > fdt_node_offset_by_compatible is called with "fdt"
> > argument null.
> > 
> > Reported-by: Julien Grall <julien@xen.org>
> > Fixes: 60649d443d ("arm/efi: Introduce xen,uefi-cfg-load DT property")
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > xen/arch/arm/efi/efi-boot.h | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index a3e46453d4..e63dafac26 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -593,7 +593,8 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >     dtbfile.ptr = fdt;
> >     dtbfile.need_to_free = false; /* Config table memory can't be freed. */
> > 
> > -    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
> > +    if ( fdt &&
> > +         (fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0) )
> >     {
> >         /* Locate chosen node */
> >         int node = fdt_subnode_offset(fdt, 0, "chosen");
> > -- 
> > 2.17.1
> > 
> 

