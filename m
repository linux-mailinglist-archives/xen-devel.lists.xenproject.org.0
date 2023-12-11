Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9380CF94
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652312.1018086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiG4-0004Py-Mg; Mon, 11 Dec 2023 15:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652312.1018086; Mon, 11 Dec 2023 15:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiG4-0004OJ-Jy; Mon, 11 Dec 2023 15:31:48 +0000
Received: by outflank-mailman (input) for mailman id 652312;
 Mon, 11 Dec 2023 15:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCiG2-0004OD-Mq
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:31:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63dcd07f-983a-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 16:31:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c3f68b79aso23337955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 07:31:44 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c384d00b004030e8ff964sm15655127wmr.34.2023.12.11.07.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:31:43 -0800 (PST)
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
X-Inumbo-ID: 63dcd07f-983a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702308704; x=1702913504; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoVETgNFX5dbjCtWkXK2y+UMGiFvRDq5hF7Lgkb0udQ=;
        b=V8JaVCWtIHd9YP4uX9sW0HqVAosXBsNE+13YmEd73L+vE2JCPlRVl0xenHSdCRN+2Q
         8dUE6RWsNLS3nAe5lfudsI5ziUOYdh9zX5BNwXtif7PsvCnfWcsWAfJiHibwTiGLBYYS
         0JfGejndUB+yXD/u4kqhJQGEeXUFRuDi4fXUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308704; x=1702913504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoVETgNFX5dbjCtWkXK2y+UMGiFvRDq5hF7Lgkb0udQ=;
        b=EXpuGAXJRVsgDzVJvAH22XiZ0IcPGcNiq/ww/Jdz0jDRwU7H4ilMLm53HG4UvFW0Ag
         HIBV7I+4DADCjnEYqPJlSkrDS+QSG2B8sUCGJhhBDO5DyS7KtZ6AQuDyyZtH5RwyXw+l
         m0Jf4flsxRlcTBNTFgNp0zlIrh4Mz2h1IX1qsYbu99m4kcmNILVSYEg3VyOlDHE3q7C3
         KoxpnW+Z7Hr6TTJ+m7kY0QKov9wgPrYQ82WHMsUdzvOPx3SgVAEbzl8szj/bRc7Z9ZQd
         1jWzpZvvp0Ef6Uc7w5iIljjGU5eanpunJECHqhQ7U2ACcr5TqNy5mQpFPhLCen8PGyd6
         2v0Q==
X-Gm-Message-State: AOJu0Yxdb/I8CCIigabnRlKpltG1ktdInOqqp8QVhSQtT67hX4/a7ydP
	NZK3PslNokdysOkhUB12Vf7XvQ==
X-Google-Smtp-Source: AGHT+IEY7lFTgRaW9W0YfNXCZfwdbMe7XBu9Ej61JboHDB0+6OOS5MllJ9JAXS5//EQ1vADAnmqoiw==
X-Received: by 2002:a1c:6a0e:0:b0:40c:1612:1bd6 with SMTP id f14-20020a1c6a0e000000b0040c16121bd6mr2658362wmc.56.1702308704161;
        Mon, 11 Dec 2023 07:31:44 -0800 (PST)
Date: Mon, 11 Dec 2023 16:31:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Message-ID: <ZXcrX44ceUjzjtDh@macbook>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231210164009.1551147-3-Jiqian.Chen@amd.com>

On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see
> xen_pt_realize->xc_physdev_map_pirq and
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> So, allow PHYSDEVOP_map_pirq when currd is dom0 no matter if
> dom0 has X86_EMU_USE_PIRQ flag and also allow
> PHYSDEVOP_unmap_pirq for the failed path to unmap pirq.
> 
> What's more, in PVH dom0, the gsis don't get registered, but
> the gsi of a passthrough device must be configured for it to
> be able to be mapped into a hvm domU.
> So, add PHYSDEVOP_setup_gsi for PVH dom0, because PVH dom0
> will setup gsi during assigning a device to passthrough.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 6ad5b4d5f1..621d789bd3 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>      switch ( cmd )
>      {
> +    case PHYSDEVOP_setup_gsi:

I think given the new approach on the Linux side patches, where
pciback will configure the interrupt, there's no need to expose
setup_gsi anymore?

>      case PHYSDEVOP_map_pirq:
>      case PHYSDEVOP_unmap_pirq:
> +        if ( is_hardware_domain(currd) )
> +            break;

Also Jan already pointed this out in v2: this hypercall needs to be
limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
the hypercall if DOMID_SELF or the passed domid matches the current
domain domid.

Thanks, Roger.

