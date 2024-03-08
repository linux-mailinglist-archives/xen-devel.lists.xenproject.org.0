Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD958769FF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 18:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690370.1076295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rie7q-0006GT-AM; Fri, 08 Mar 2024 17:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690370.1076295; Fri, 08 Mar 2024 17:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rie7q-0006E6-7O; Fri, 08 Mar 2024 17:35:18 +0000
Received: by outflank-mailman (input) for mailman id 690370;
 Fri, 08 Mar 2024 17:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2yz0=KO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rie7p-0006Dz-An
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 17:35:17 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3940fe07-dd72-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 18:35:16 +0100 (CET)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5a17a739935so1320168eaf.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 09:35:16 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05683020c500b006e12266433csm2248064otq.27.2024.03.08.09.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 09:35:14 -0800 (PST)
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
X-Inumbo-ID: 3940fe07-dd72-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709919314; x=1710524114; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
        b=FgsYw5pQ1bzlE8obkLOtIg0GLrJ8DKrUJOPcHKo6bfrVTyVAwXti3hPV6rZDMGfC0O
         54aXCBKs8x9F/5ZOeLHLSEBQ/Io6c7il9Do+aA25WYWZX1pqrwcptOZYaYLy7XvBIwcw
         1xwihDKE4+lODR13gx8avxEnYuQlliYlKiKCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709919314; x=1710524114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
        b=VY6npIeBk+nmWgEGGyS5nT1mRC8/rPx7yzEuG4rTWOiSTjvrVQtc0GrtmkdyxPUOoE
         xaRQt3Rp9b+rOltTR9WFNT6B7lXKvmlc5riMASX6pe2i09YXY0mBlRoKwZ6W0t7GVkk6
         gYvybbObvZoLnNqIKWVoxPOccIvscs2QCcEvKp0NJuq2Wl65ZmpK5gsWmYOgzv2E/jLB
         MYwCblK0/msNTRCDh67WOuBGluSdF+cfLxRs6NZWO8UtAQJjf+z6l5scCJHBfiR4dMoY
         m/bYZ9oPi6h1vGHb2WoERhECcQjAlfDfmixfXs8xwQ5vWfEyREJ4tHePYnE6D8hb7X00
         eBmw==
X-Forwarded-Encrypted: i=1; AJvYcCUztK4UOQPVtbXE7zlgewecj5UNLV6wy/fiBN4mPXbGcpNqI1mVNav9T+fYN4fRrgNhlYAROZ39Jcmzak11laoEIYs0lXtMEVAPexbwxwI=
X-Gm-Message-State: AOJu0Yx5f2z2iWiDkvCGWakphMz3VikC8EFF6dUlkSdKnrKYVowWYjqM
	u6oyZnljPY8ydSeQSgDDJs97xtztS14sxBJaHocxXZ7ztKYgSKZ0l5P46cTvUoA=
X-Google-Smtp-Source: AGHT+IFP+iIn7ziPACo/W5ywuwt3jU9vKOJI+Md4melHw3m+IPRBayOOv3MnfyWInvHuBqQD34WXQg==
X-Received: by 2002:a05:6820:2227:b0:5a1:34cf:400c with SMTP id cj39-20020a056820222700b005a134cf400cmr12525786oob.9.1709919314653;
        Fri, 08 Mar 2024 09:35:14 -0800 (PST)
Date: Fri, 8 Mar 2024 17:35:08 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?iso-8859-1?Q?Fr=E9d=E9ric?= Barrat <fbarrat@linux.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, mzamazal@redhat.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/29] bulk: Access existing variables initialized to
 &S->F when available
Message-ID: <a495a2c8-0259-4a44-8ac4-9cb6052074b6@perard>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129164514.73104-2-philmd@linaro.org>

On Mon, Jan 29, 2024 at 05:44:43PM +0100, Philippe Mathieu-Daudé wrote:
> When a variable is initialized to &struct->field, use it
> in place. Rationale: while this makes the code more concise,
> this also helps static analyzers.
> 
> Mechanical change using the following Coccinelle spatch script:
> 
>  @@
>  type S, F;
>  identifier s, m, v;
>  @@
>       S *s;
>       ...
>       F *v = &s->m;
>       <+...
>  -    &s->m
>  +    v
>       ...+>
> 
> Inspired-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 36e6f93c37..10ddf6bc91 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -710,7 +710,7 @@ static void xen_pt_destroy(PCIDevice *d) {
>      uint8_t intx;
>      int rc;
>  
> -    if (machine_irq && !xen_host_pci_device_closed(&s->real_device)) {
> +    if (machine_irq && !xen_host_pci_device_closed(host_dev)) {
>          intx = xen_pt_pci_intx(s);
>          rc = xc_domain_unbind_pt_irq(xen_xc, xen_domid, machine_irq,
>                                       PT_IRQ_TYPE_PCI,
> @@ -759,8 +759,8 @@ static void xen_pt_destroy(PCIDevice *d) {
>          memory_listener_unregister(&s->io_listener);
>          s->listener_set = false;
>      }
> -    if (!xen_host_pci_device_closed(&s->real_device)) {
> -        xen_host_pci_device_put(&s->real_device);
> +    if (!xen_host_pci_device_closed(host_dev)) {
> +        xen_host_pci_device_put(host_dev);

For the Xen part:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

