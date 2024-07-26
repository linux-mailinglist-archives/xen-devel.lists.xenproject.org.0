Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C856093D4FF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 16:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765425.1176010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXLoT-0001N9-Rc; Fri, 26 Jul 2024 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765425.1176010; Fri, 26 Jul 2024 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXLoT-0001LE-OP; Fri, 26 Jul 2024 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 765425;
 Fri, 26 Jul 2024 14:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNFL=O2=bounce.vates.tech=bounce-md_30504962.66a3b0c0.v1-6d452fc3fec049d6a27e65e0eab297e1@srs-se1.protection.inumbo.net>)
 id 1sXLoS-0001L5-0F
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 14:20:52 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41be024f-4b5a-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 16:20:50 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WVqfm5pb4zCfBXGD
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 14:20:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6d452fc3fec049d6a27e65e0eab297e1; Fri, 26 Jul 2024 14:20:48 +0000
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
X-Inumbo-ID: 41be024f-4b5a-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722003648; x=1722264148;
	bh=w1ILTJam9PX/r2+TOHHi9ELKTuYeghDtEIiQI/vRMhk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=esn95cffTlQxMbiyQrWYIgGmLdgYD1APvmrEcntCT7amGqevqnZ5ITx4bsxzYDtI6
	 B/w8e9AoLobBicUJOjmZFu18f6dYWAwlPF+73J2bxJAh1cjsvxXrJmgSQVQnRqVZ2e
	 KBwbd6GfqmmWEqK3gFHxFKbs45ioZcGVCt7/n9DOVYivNoZoahqTAmYchopNpLUEyJ
	 eqwc1aTUHlvzEaJvc0NiofTkBXKDHoMVCfFHw9tRnRR31wQ8Zt345tvp3ocLrk1eef
	 IBRKVZtyvrwiWTzxUcZcjtICGWYR7eWr5PYwkvAqsYlmPB5UJlBpCQzm1sB8cdRWG3
	 JbdTKgadTMuhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722003648; x=1722264148; i=anthony.perard@vates.tech;
	bh=w1ILTJam9PX/r2+TOHHi9ELKTuYeghDtEIiQI/vRMhk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pJz8POrqh3jZevEHUDkyqDyDqUAu8jBO4AS8xUT7zjs2IupOCiG6VVsaBhm1l/dD6
	 d2xmnvR1L1VVdodSw4A9xttZZbWbkStqxfYSvTwmUb4l0LZz5938qan5wQrPTM75WK
	 OGhsqjN6l9hMRarOpuN5NIFbqjt0z0v3SWrdXPpOtkzVQYqBAtM8Neig4Eqf41KHDJ
	 GZLVZJMyK/xzjUfaGtBzs1n3kOY3dr3OsND3GkWGujkQsHpwKTxi8lzVRt9lERau3t
	 nzgH+fqiS/OouTcvhlkDpZGNbu2Aza/lu+byC59/UVDSIIOV9caViSex3wyYQ6qyEg
	 uSbis/fCpFKmA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2007/12]=20libxl:=20Allow=20stubdomain=20to=20control=20interupts=20of=20PCI=20device?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722003648134
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <ZqOwv6j6Xh+RfITd@l14>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <aeba05a5ec7a0657217933f165ee0ac7e86e1b1b.1715867907.git-series.marmarek@invisiblethingslab.com> <ZqJby/TBLQOmzQPH@l14> <ZqJeRpv0leu3vWuf@mail-itl>
In-Reply-To: <ZqJeRpv0leu3vWuf@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6d452fc3fec049d6a27e65e0eab297e1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240726:md
Date: Fri, 26 Jul 2024 14:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 04:16:37PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jul 25, 2024 at 02:06:04PM +0000, Anthony PERARD wrote:
> > On Thu, May 16, 2024 at 03:58:28PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Especially allow it to control MSI/MSI-X enabling bits. This part onl=
y
> > > writes a flag to a sysfs, the actual implementation is on the kernel
> > > side.
> > >
> > > This requires Linux >=3D 5.10 in dom0 (or relevant patch backported).
> > 
> > Does it not work before 5.10? Because the
> > Documentation/ABI/testing/sysfs-driver-pciback in linux tree say that
> > allow_interrupt_control is in 5.6.
> 
> For MSI-X to work at least with Linux it needs a fixup
> 2c269f42d0f382743ab230308b836ffe5ae9b2ae, which was backported to
> 5.10.201, but not further. 
> 
> > > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pc=
i.c
> > > index 96cb4da0794e..6f357b70b815 100644
> > > --- a/tools/libs/light/libxl_pci.c
> > > +++ b/tools/libs/light/libxl_pci.c
> > > @@ -1513,6 +1513,14 @@ static void pci_add_dm_done(libxl__egc *egc,
> > >              rc =3D ERROR_FAIL;
> > >              goto out;
> > >          }
> > > +    } else if (libxl_is_stubdom(ctx, domid, NULL)) {
> > > +        /* Allow acces to MSI enable flag in PCI config space for th=
e stubdom */
> > 
> > s/acces/access/
> > 
> > > +        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/allow_interru=
pt_control",
> > > +                             pci) < 0 ) {
> > > +            LOGD(ERROR, domainid, "Setting allow_interrupt_control f=
or device");
> > > +            rc =3D ERROR_FAIL;
> > > +            goto out;
> > 
> > Is it possible to make this non-fatal for cases where the kernel is
> > older than the introduction of the new setting? Or does pci passthrough
> > doesn't work at all with a stubdom before the change in the kernel?
> 
> MSI/MSI-X will not work. And if QEMU wouldn't hide MSI/MSI-X (upstream
> one doesn't), Linux won't fallback to INTx, so the device won't work at
> all.

Ok

I guess this patch is fine then:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


