Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3DA5F959
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912459.1318705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskGY-00013W-7i; Thu, 13 Mar 2025 15:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912459.1318705; Thu, 13 Mar 2025 15:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskGY-00011T-5A; Thu, 13 Mar 2025 15:14:34 +0000
Received: by outflank-mailman (input) for mailman id 912459;
 Thu, 13 Mar 2025 15:14:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tskGW-00011I-UT
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:14:32 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3dfaf3-001d-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:14:31 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so957393f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:14:31 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5d04sm59050935e9.27.2025.03.13.08.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:14:30 -0700 (PDT)
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
X-Inumbo-ID: dd3dfaf3-001d-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741878871; x=1742483671; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO0QriGb73abMdge3Lw944L0uK4ZRHzpf7qlrKSncAA=;
        b=OF8qq5/QfRFJ7sv9wMJ9m+WU+BumBcPOddNXzu9Bv37/XbSD5GmBTflRn2WLn1fsd1
         Ez0Z0MVQrd0Myc6XfPKOCfa5A+gDVrxBa8DnKWbMRIcEYACCVUuzLdGCSduZCIH2kqhy
         BWnLa6EiCjembsaE25M5yFd1bprZcSbHdufds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878871; x=1742483671;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kO0QriGb73abMdge3Lw944L0uK4ZRHzpf7qlrKSncAA=;
        b=BOWaufgQMtCrpiU9t9FViINtAwHK84tOPo7I56E+UVmeR63NuuXhTEivym04Z7/sxU
         OtbL0Df3Yqv61luvg6Qj4wI6Gg0V2kFv/B9Xp8EPHWalKTLxHltDvmSdMa44v1Xco9B3
         0F9stVpLZtFQz7zxLmOs05XBDNC5EikkrW/ny2AJXxEnenhhTji5/O2hlEc4D+vYrZKy
         4Zdoe1QvR04ZT0qF2ANvMa1tkDJWRIdoMCvcz6t4lBOMz3MsJRtP6ujou4yXIR00dWRw
         F89piuan7PiZMjh5qnA8K2hojLVbF74rlJJTrJKh5GqWBq2tILyRZu1ifgJddUGcUIBp
         pXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtDl2Pq4umrK7yiwo+UFOEgYcd+PqRGzbCewKxUNy7UEDSegg0sgvKzaPGjNftNQBmkpQNtj/yllg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxe64+SmRHN+CE812OiYVtM4q1n7IElgRCSGswXAyRAjusaSwFH
	Qf/4GjFghLNb78bvdarwALAHBYKHn5tOOkczKJaNzk2rnhhPjlZtcTC+Yrs70gI=
X-Gm-Gg: ASbGncuQOCE0j5WNJPmR3j8ySYm5pjSyiN1OriTWT16Jgwg/Fr3HcNprU6zftyhbsx6
	R4/eMvvY98RV5TPzavaszjTLE34wWMUGGXMV9Ws3Vy4K+DZtn8cLQiS2kC7vRWLubTofkaBfev+
	jp40F53SzsZcrdmzO13o7hjtXdStoR3VQHg+rlimPOOIraFG50Pjju1BaLKQoPSpaYIHlDBxb0G
	iNxEet6DL0S6WTvCCDK0+Cq354l8QmkTtKQAH44Bqsol/Xs6K/sFfN69R/x6KEChsZMI1xSgQ4K
	Qq33VpognutqEIJ5NfN5XqzKGWREm2h1jyv4ZMO21kLvrSk6Ieo=
X-Google-Smtp-Source: AGHT+IGg5ls3u5Oi43WsW2IvI2eeXO9PLgzXoW+G9b3Y2cmuLAATCevEI4byaIB0c94EK9nvdRTpHw==
X-Received: by 2002:a5d:6d83:0:b0:390:e9b5:d69c with SMTP id ffacd0b85a97d-39132d5670bmr27081374f8f.25.1741878870942;
        Thu, 13 Mar 2025 08:14:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 15:14:26 +0000
Message-Id: <D8F8IW559J11.2G40MDQH23I44@cloud.com>
To: "Stewart Hildebrand" <stewart.hildebrand@amd.com>,
 <xen-devel@lists.xenproject.org>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
In-Reply-To: <20250312195019.382926-1-stewart.hildebrand@amd.com>

On Wed Mar 12, 2025 at 7:50 PM GMT, Stewart Hildebrand wrote:
> Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If firmware
> initialized the BAR to a bad address, Linux will try to write a new
> address to the BAR without disabling memory decoding. Allow the write
> by updating p2m right away in the vPCI BAR write handler.
>
> Resolves: https://gitlab.com/xen-project/xen/-/issues/197
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> RFC: Currently the deferred mapping machinery supports only map or
>      unmap, not both. It might be better to rework the mapping machinery
>      to support unmap-then-map operations, but please let me know your
>      thoughts.
> RFC: This patch has not yet made an attempt to distinguish between
>      32-bit and 64-bit writes. It probably should.
> ---
>  xen/drivers/vpci/header.c | 65 +++++++++++++++++++++++++++++++--------
>  1 file changed, 53 insertions(+), 12 deletions(-)
>
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ef6c965c081c..66adb2183cfe 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -173,7 +173,7 @@ static void modify_decoding(const struct pci_dev *pde=
v, uint16_t cmd,
>          ASSERT_UNREACHABLE();
>  }
> =20
> -bool vpci_process_pending(struct vcpu *v)
> +static bool process_pending(struct vcpu *v, bool need_lock)
>  {
>      struct pci_dev *pdev =3D v->vpci.pdev;
>      struct vpci_header *header =3D NULL;
> @@ -182,12 +182,14 @@ bool vpci_process_pending(struct vcpu *v)
>      if ( !pdev )
>          return false;
> =20
> -    read_lock(&v->domain->pci_lock);
> +    if ( need_lock )
> +        read_lock(&v->domain->pci_lock);
> =20
>      if ( !pdev->vpci || (v->domain !=3D pdev->domain) )
>      {
>          v->vpci.pdev =3D NULL;
> -        read_unlock(&v->domain->pci_lock);
> +        if ( need_lock )
> +            read_unlock(&v->domain->pci_lock);
>          return false;
>      }
> =20
> @@ -209,17 +211,20 @@ bool vpci_process_pending(struct vcpu *v)
> =20
>          if ( rc =3D=3D -ERESTART )
>          {
> -            read_unlock(&v->domain->pci_lock);
> +            if ( need_lock )
> +                read_unlock(&v->domain->pci_lock);
>              return true;
>          }
> =20
>          if ( rc )
>          {
> -            spin_lock(&pdev->vpci->lock);
> +            if ( need_lock )
> +                spin_lock(&pdev->vpci->lock);
>              /* Disable memory decoding unconditionally on failure. */
>              modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>                              false);
> -            spin_unlock(&pdev->vpci->lock);
> +            if ( need_lock )
> +                spin_unlock(&pdev->vpci->lock);
> =20
>              /* Clean all the rangesets */
>              for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
> @@ -228,7 +233,8 @@ bool vpci_process_pending(struct vcpu *v)
> =20
>              v->vpci.pdev =3D NULL;
> =20
> -            read_unlock(&v->domain->pci_lock);
> +            if ( need_lock )
> +                read_unlock(&v->domain->pci_lock);
> =20
>              if ( !is_hardware_domain(v->domain) )
>                  domain_crash(v->domain);
> @@ -238,15 +244,23 @@ bool vpci_process_pending(struct vcpu *v)
>      }
>      v->vpci.pdev =3D NULL;
> =20
> -    spin_lock(&pdev->vpci->lock);
> +    if ( need_lock )
> +        spin_lock(&pdev->vpci->lock);
>      modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> -    spin_unlock(&pdev->vpci->lock);
> +    if ( need_lock )
> +        spin_unlock(&pdev->vpci->lock);
> =20
> -    read_unlock(&v->domain->pci_lock);
> +    if ( need_lock )
> +        read_unlock(&v->domain->pci_lock);
> =20
>      return false;
>  }
> =20
> +bool vpci_process_pending(struct vcpu *v)
> +{
> +    return process_pending(v, true);
> +}
> +
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev=
,
>                              uint16_t cmd)
>  {
> @@ -565,6 +579,8 @@ static void cf_check bar_write(
>  {
>      struct vpci_bar *bar =3D data;
>      bool hi =3D false;
> +    bool reenable =3D false;
> +    uint32_t cmd =3D 0;
> =20
>      ASSERT(is_hardware_domain(pdev->domain));
> =20
> @@ -585,10 +601,31 @@ static void cf_check bar_write(
>      {
>          /* If the value written is the current one avoid printing a warn=
ing. */
>          if ( val !=3D (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> +        {
>              gprintk(XENLOG_WARNING,
> -                    "%pp: ignored BAR %zu write while mapped\n",
> +                    "%pp: allowing BAR %zu write while mapped\n",
>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> -        return;
> +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +            ASSERT(spin_is_locked(&pdev->vpci->lock));
> +            reenable =3D true;
> +            cmd =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +            /*
> +             * Write-while-mapped: unmap the old BAR in p2m. We want thi=
s to
> +             * finish right away since the deferral machinery only suppo=
rts
> +             * unmap OR map, not unmap-then-remap. Ultimately, it probab=
ly would
> +             * be better to defer the write-while-mapped case just like =
regular
> +             * BAR writes (but still only allow it for 32-bit BAR writes=
).
> +             */
> +            /* Disable memory decoding */
> +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
> +            /* Call process pending here to ensure P2M operations are do=
ne */
> +            while ( process_pending(current, false) )
> +            {
> +                /* Pre-empted, try again */

This seems a tad dangerous. There may be a non-negligible amount of work qu=
eued
up. I also wonder whether the guest can induce spinning by increasing
contention on the p2m (e.g: via ballooning) or by induces work being queued=
 up.

I don't quite understand the logic, but I suspect you could
raise_softirq(SCHEDULE_SOFTIRQ), decrease the IP so the instruction is
replayed, release the locks, and simply exit the hypervisor. The system oug=
ht
to naturally split the operation in several continuations each of which doe=
s
either unmapping or mapping if it couldn't be done in a single one. Replayi=
ng
the instruction after decoding is disabled ought to be benign.

I haven't tried any of what I just wrote, so take it with with several tons=
 of
salt though.

Do you know if Linux intentionally skips disabling decode? Or is it a bug?

> +            }
> +        }
> +        else
> +            return;
>      }
> =20
> =20
> @@ -610,6 +647,10 @@ static void cf_check bar_write(
>      }
> =20
>      pci_conf_write32(pdev->sbdf, reg, val);
> +
> +    if ( reenable )
> +        /* Write-while-mapped: map the new BAR in p2m. OK to defer. */
> +        modify_bars(pdev, cmd, false);
>  }
> =20
>  static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>
> base-commit: 8e60d47cf0112c145b6b0e454d102b04c857db8c

Cheers,
Alejandro

