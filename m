Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOurM3zY+WmbEgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 13:46:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7DB4CCE53
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 13:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300582.1575113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEDF-0007ON-K4; Tue, 05 May 2026 11:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300582.1575113; Tue, 05 May 2026 11:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEDF-0007Mk-Fu; Tue, 05 May 2026 11:45:17 +0000
Received: by outflank-mailman (input) for mailman id 1300582;
 Tue, 05 May 2026 11:45:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKEDE-0007Md-4W
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:45:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKEDD-004rNG-HL
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:45:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f9d83c-bab6-0a2a0a5309dd-0a2a4503ccc8-40
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:45:15 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f9d84b-672d-0a2a45030019-d155d0b5cd45-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:45:15 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-38def541b0bso49207291fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 04:45:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1777981515; cv=none;
        d=google.com; s=arc-20240605;
        b=WvP2+1gDFVPHfD0ibEyxdevfi4lpQ9MqbJaIcfi5zpJNgdismJvVzTPSrGTY0YfVLs
         mLQvgc/w9hk9oyGdSoayC4sYeSlaF1H6Jjlh6yzjvrD9hZ0K2t9Vi5DFW4vqn/u/9Vlm
         y0VIJmd25LPevbfIs58CvkfiVrsp7cpqR0NaVgo1sf122DygOF0q3BYYhuuxdPvYeHlB
         9+JU3AnwjH4oHUr+5y1Q+zcJIBq4BeeIW4vvpuqCTKPwhwZlKagnRoU0IBYUtenx29ls
         ZagnJmP852TdX+ak7eYxHGxhrCcV+30Mv5APXDvbYkaf+yVgwJ734ySn8KgGr6ustXfr
         cYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6zEpHfFqvUI3K5cIq5lmaqZoX68nLN2ySftFfomzcAc=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=f66sOzkDcYbZZx76iQSaKYdtDwkzK/BejluqSJ6zm1JAxkAiqG4e/+HZwSBz9MRgTX
         STbrlLHMQfrnoO7XTaYsGVOs+PcRDQv2t31y5HKgtnARdZoYumyCB/BQuiAEjy6z2voM
         77xMApO72PxIG+q+Y4F9A1DhsRZrWs1BWQ9fhj581zUcyqE9AwOZh6Ypf+ZvBuQ8Mum4
         u5M9M8pTeIBl8KEFbTuI5oO2s+kMl9hGKzvIaw+2wFdcFgcGnkOfEDtSSViJEAEMT5Fs
         Wpw5sP3wWj1Aso0S4KzW76+QJhlfaIwJW+gvo7epotGSZxRRZJffM+SX34SXSrFh7At/
         pBOQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777981515; x=1778586315; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zEpHfFqvUI3K5cIq5lmaqZoX68nLN2ySftFfomzcAc=;
        b=TbvS1Ulvag5uhqykis3F6VgiWAsvpHjvwVVe81DIZyYM5j213RPqVjNH6XJP+fPe9i
         ABMdN+GQJ4YFlVvq5MbgZrx8XIPG9BaBp3wvxzby53LlSjZnSXx1sA5oOOSzhz0PCdGo
         oUAO0ZEf1J78NlhI2J4vS/hwJHT85qYzJDEJS6Ule3gMuNroRCiArX1j3wXjvN63eeT1
         b10zCcVyJcaPwAWa36nEsroZpqXagiy0URzASm1PvL/zvKQ6nwP20ZnJMouQJSAZBuqA
         2WZkVaXtyByxbs3df607shTtBc68FsvD6nEA7mArjlSIXofHK1swsTULKuY4ZBKFMxbY
         IZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777981515; x=1778586315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zEpHfFqvUI3K5cIq5lmaqZoX68nLN2ySftFfomzcAc=;
        b=jvYkuiBv9pto670s7kWkTOxp4O00YkpG2NnMoKwSF0QTNSLSLT1uw+oGsn8VMMx51s
         BZYvx0CXZZtm0N1ZU24PFa8U28W94kTsrCBpcFnBmAYn72IoKUfgquWShA4R/58jyu1h
         +l4lq57cq/ZHX/2M5lwu6ces9yjzY4XE+lNT33Wx0Ew9nu1JajAHf49ua0esvJ+c0Y5g
         jEzufqaiyj10DA2THsJXV3qTkx6fXIIwbRAi+oBArwWXzafoSGbe9ibvRlXCI7IriwHD
         VyX/AJ5FkO0BfXYRJr7koCxCp66eoLC9qYuwukHotVhRQcpC+tcAB9j7oHiNQPVN0gTy
         FI7A==
X-Gm-Message-State: AOJu0YyP7fEodNDvOr3SoShgcso2k9N5qgQoV0LihNW7tnWJ5Wkq+ElC
	ozzvnbu3HnogVMKqA61WFfiVYLHlev2dkYzzN+Vtw9MeRyCTBjRfXSBio0fdTqYYLl06f52P64z
	QXaF4TBiBp3IlzWHWf0LeimQ5mhsQug4=
X-Gm-Gg: AeBDies4RC5rz7TO18qYNZY5XHKdCSrGtV5jB9dhP2m7HGNd+PK2jGxF3lS3PZSYk0y
	KvUYv7HRK+dk0lRAs2gTqNrE0Ywa3ip2pg6R85fDD8HC4se0bnNs8DvnQdyWnWWWjZ+2c4KKS41
	yEP+jHW1FoiUZv4aFLRWC3YZhzCHDxRx03IGLd5x8owfkaVUMopFp4XwSt6BxVYFIT+kidpcqLw
	dxDDiMKy4lghnUya6z4Pmzh7cryv/gDHUEwSBD/8OKzllVWGqWE0GZw1KVRvwC5B1XM7DmSsgty
	sxbgvTll7KC3CjOK
X-Received: by 2002:a2e:8a95:0:b0:38e:97b2:4b03 with SMTP id
 38308e7fff4ca-393b4d50fd8mr11285061fa.31.1777981514434; Tue, 05 May 2026
 04:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <63b219c3cae5201c5db804f69c3b88ac41c9bdf6.1775125380.git.mykola_kvach@epam.com>
 <55B2462D-41E5-42CB-9525-39CF4843E95E@arm.com>
In-Reply-To: <55B2462D-41E5-42CB-9525-39CF4843E95E@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 14:45:03 +0300
X-Gm-Features: AVHnY4Iiroi7TYFgBdAn9YTSTkXYar6w48U2NFr6DOYwy4ITjdNgysHBdDQJoHw
Message-ID: <CAGeoDV_htcXQ=rsWBbHGcbvwL7E5RKGDy2+p5pRio27dB6J6KA@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1777981515-28776938-3E2D35FC/0/0
X-purgate-type: clean
X-purgate-size: 2991
X-Rspamd-Queue-Id: 2F7DB4CCE53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Luca,

Thank you for the review.

On Fri, Apr 24, 2026 at 4:36=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > Store and restore active context and micro-TLB registers.
> >
> > Tested on R-Car H3 Starter Kit.
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V7:
> > - moved suspend context allocation before pci stuff
> > ---
> > xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 ++++++++++++++++++++++-
> > 1 file changed, 298 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/pas=
sthrough/arm/ipmmu-vmsa.c
> > index ea9fa9ddf3..6765bd3083 100644
> > --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > @@ -71,6 +71,8 @@
> > })
> > #endif
> >
> > +#define dev_dbg(dev, fmt, ...)    \
> > +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
> > #define dev_info(dev, fmt, ...)    \
> >     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> > #define dev_warn(dev, fmt, ...)    \
> > @@ -130,6 +132,24 @@ struct ipmmu_features {
> >     unsigned int imuctr_ttsel_mask;
> > };
> >
>
>
> > [=E2=80=A6]
>
>
> >
> > @@ -1340,10 +1608,11 @@ static int ipmmu_add_device(u8 devfn, struct de=
vice *dev)
> >     struct iommu_fwspec *fwspec;
> >
> > #ifdef CONFIG_HAS_PCI
> > +    int ret;
> > +
> >     if ( dev_is_pci(dev) )
> >     {
> >         struct pci_dev *pdev =3D dev_to_pci(dev);
> > -        int ret;
> >
> >         if ( devfn !=3D pdev->devfn )
> >             return 0;
> > @@ -1371,6 +1640,15 @@ static int ipmmu_add_device(u8 devfn, struct dev=
ice *dev)
> >         /* Let Xen know that the master device is protected by an IOMMU=
. */
> >         dt_device_set_protected(dev_to_dt(dev));
> >     }
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( ipmmu_alloc_ctx_suspend(dev) )
> > +    {
> > +        dev_err(dev, "Failed to allocate context for suspend\n");
> > +        return -ENOMEM;
> > +    }
> > +#endif
>
> If this fails the device will remain protected, I suggest we move this on=
e before `if ( !dev_is_pci(dev) ) { =E2=80=A6 }`
> block

Good point, thanks.

Yes, this should be fixed. In the original ordering, a failure in
ipmmu_alloc_ctx_suspend() could leave a non-PCI DT device marked as
protected even though ipmmu_add_device() returned an error.

I'll reorder the code so dt_device_set_protected() is done only
after ipmmu_alloc_ctx_suspend() succeeds. This keeps the successful path
unchanged and avoids leaving stale protected state on failure.

Best regards,
Mykola

>
> The rest looks ok to me, but I=E2=80=99m not an expert of this part.
>
> Cheers,
> Luca
>

