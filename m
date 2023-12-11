Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612E80D00D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652337.1018118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiWl-0000qY-OZ; Mon, 11 Dec 2023 15:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652337.1018118; Mon, 11 Dec 2023 15:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiWl-0000nU-Kp; Mon, 11 Dec 2023 15:49:03 +0000
Received: by outflank-mailman (input) for mailman id 652337;
 Mon, 11 Dec 2023 15:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCiWk-0000nO-Ol
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:49:02 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6ae18e-983c-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 16:49:00 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33330a5617fso4871193f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 07:49:00 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm15578677wms.33.2023.12.11.07.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:49:00 -0800 (PST)
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
X-Inumbo-ID: cd6ae18e-983c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702309740; x=1702914540; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/IiFikvBYbX5EVpOUvn7fhrb8PIjvnvQX6xdMwm4lp0=;
        b=j9rrhB07167BHTEwwxa0kFugKVyzBbMb89a5o6YJoOUvAAo6QYxA6GNFWOJV3P7UMj
         6AQbGqsPCCaDCizR9AS4sQeORSPOFNfys6o/goxsfDHUfotOmlLgo1xRwBBTpEukUpnj
         Z489S/p0z2sMsdbitTqwMmnoRqDE+Uvr1N0vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309740; x=1702914540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IiFikvBYbX5EVpOUvn7fhrb8PIjvnvQX6xdMwm4lp0=;
        b=tO6CqCcb4M7ELLidDalJhSZAQn/fxMoiQGjK8FGKOazU4Wrl5XH1RDO4Gj8bx+cFv6
         ZLZ4JLejeeN6m4mIDLp4B2LcAF3W058jJdPtxVwxU3VzMirlQy2eb422pk5gqyYf9A12
         VEMa/1X2zyFVES44miGMiD9yZtFujZcysHBpmk5eTYBsNdZXFjy8E7cRjz/RQRikrGka
         OzPUfFTJlY16Zkfm6z3t3Ze7tjC20UlnoDNc9VVd+NdL/sV/g7jwsl28VnsASwH/jWqI
         ZgJDgxu+xCUhtZAx5e3Wq5lF8P/x9uaNQJ/7GyHKQJjvvfPh2ZgtaRH+ewQ2uyjdGfyt
         3o7Q==
X-Gm-Message-State: AOJu0YzzX7xT/ubXkP8p+VZ9v2SQcyRUkX0fUnldoRXry+mSSH9ZuqU+
	XO7tgW3HI6C4hCcgg3CwAZyadQ==
X-Google-Smtp-Source: AGHT+IEiVYyNaGA+6c0OUkNMqRA5piPFDoSE4zQqN0ZjNemmGlA/JBG4wDVsbhQrnOGoceOT5lZEMA==
X-Received: by 2002:a05:600c:4591:b0:40b:5e1d:83a6 with SMTP id r17-20020a05600c459100b0040b5e1d83a6mr2613598wmo.58.1702309740258;
        Mon, 11 Dec 2023 07:49:00 -0800 (PST)
Date: Mon, 11 Dec 2023 16:48:59 +0100
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
Subject: Re: [RFC XEN PATCH v3 3/3] libxl: Use gsi instead of irq for mapping
 pirq
Message-ID: <ZXcvazeJlsfPsq0h@macbook>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231210164009.1551147-4-Jiqian.Chen@amd.com>

On Mon, Dec 11, 2023 at 12:40:09AM +0800, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi
> 28, that causes the irq number is not equal with the gsi
> number. And when passthrough a device, xl wants to use
> gsi to map pirq, see pci_add_dm_done->xc_physdev_map_pirq,
> but the gsi number is got from file
> /sys/bus/pci/devices/<sbdf>/irq in current code, so it
> will fail when mapping.
> 
> So, use real gsi number read from gsi sysfs.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  tools/libs/light/libxl_pci.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da079..9e75f0c263 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1416,7 +1416,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>      char *sysfs_path;
>      FILE *f;
>      unsigned long long start, end, flags, size;
> -    int irq, i;
> +    int gsi, i;
>      int r;
>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>      uint32_t domainid = domid;
> @@ -1439,7 +1439,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>                             pci->bus, pci->dev, pci->func);
>      f = fopen(sysfs_path, "r");
>      start = end = flags = size = 0;
> -    irq = 0;
> +    gsi = 0;

unsigned int (so it matches the fscanf format), and initialized at
definition.

>  
>      if (f == NULL) {
>          LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
> @@ -1478,26 +1478,26 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
>                                  pci->bus, pci->dev, pci->func);

You need to keep the fallback mechanism of reading the irq node, or
else xl would stop working on any kernel that doesn't expose this
sysfs node, you would break passthrough on all current Linux versions.

Thanks, Roger.

