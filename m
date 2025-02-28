Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA4A4A08D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 18:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899080.1307526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to4Fm-0005OO-D8; Fri, 28 Feb 2025 17:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899080.1307526; Fri, 28 Feb 2025 17:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to4Fm-0005LQ-9p; Fri, 28 Feb 2025 17:34:26 +0000
Received: by outflank-mailman (input) for mailman id 899080;
 Fri, 28 Feb 2025 17:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kVR1=VT=bounce.vates.tech=bounce-md_30504962.67c1f399.v1-55596eccef154d698c55302b3babed8b@srs-se1.protection.inumbo.net>)
 id 1to4Fk-0005KY-IA
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 17:34:24 +0000
Received: from mail145-26.atl61.mandrillapp.com
 (mail145-26.atl61.mandrillapp.com [198.2.145.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cdec4d3-f5fa-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 18:34:19 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-26.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4Z4Fgs3x03zJKF44L
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 17:34:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 55596eccef154d698c55302b3babed8b; Fri, 28 Feb 2025 17:34:17 +0000
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
X-Inumbo-ID: 3cdec4d3-f5fa-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1740764057; x=1741034057;
	bh=NzQzaoDAqc1wvDc9DO/YoNB663bbLyTqvLG09zlZbRQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CfICmzdWXZMgTy9eHSIn7rOFXlGVnEpCIfykTrck6mvdMO3emvxdCH0z8IcndLzml
	 qeC/3kvDLpyJs+0DypYYIXmL6WgVKBQSO/RabphNkdOUPtv0vMWzXRDfLLzn89B8pV
	 YDCJYDXRfARervPQVfC4Vt3GdvfRxcr3Br6/CkfXVxjSntNH2V6jRzb1Bsjz3tzhGe
	 BtI8UyFKFlVEK2tH3nkeW7dMtLO0Ve72m/a4a1NQIngSHOX2ZHb5WEbWYcsWncWC+Q
	 Z52Al7HyUIQ1eDW9KBAxHpG8N13X2RMI/JTIOFAzRSdGWsJ36Mo0pR/6o8CfDxkbyQ
	 hTbWeLQOC7Nhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1740764057; x=1741024557; i=anthony.perard@vates.tech;
	bh=NzQzaoDAqc1wvDc9DO/YoNB663bbLyTqvLG09zlZbRQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BttqohXwG+f7q/udBLfbXg/Dzab2S61YAcxyTGIlZlkWiNqgZwZ8akpFD00roRcFL
	 Gd2Jzd8veoxKE7gxFM1JcOd1bvD6SUL+JC1L1uVaOCP7UrR9H4UpmDTYrY2KVZaSUy
	 ca7rCnK3IGjc8O5bQavQu2gtpygvg1E5S5ahCooBcA5/pReGsHZ3bW0biiCiVPRenO
	 EKvJKaRmn3+oP93kc9YuZoyLOi4mNiAXMSJLQZWr0gdPJpj7Xl7180ay4RtACd5vtW
	 ZEzN2XYjTERP3dVLOwGTpwqOHRJXD/NZvfQbmmXiXtkNUy2ByD13jfv0poMfqJfXge
	 5+raWBXC/EJpA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20tools/xl:=20fix=20channel=20configuration=20setting?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1740764056559
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z8HzmC4evOxa6yPs@l14>
References: <20250225073033.20972-1-jgross@suse.com> <Z785WyG39EGCRM1y@l14> <e49861d8-2f8f-4747-8d26-59b6defce7c1@suse.com>
In-Reply-To: <e49861d8-2f8f-4747-8d26-59b6defce7c1@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.55596eccef154d698c55302b3babed8b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250228:md
Date: Fri, 28 Feb 2025 17:34:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 04:10:25PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.02.25 16:55, Anthony PERARD wrote:
> > On Tue, Feb 25, 2025 at 08:30:33AM +0100, Juergen Gross wrote:
> > > Channels work differently than other device types: their devid should
> > > be -1 initially in order to distinguish them from the primary console
> > > which has the devid of 0.
> > > 
> > > So when parsing the channel configuration, use
> > > ARRAY_EXTEND_INIT_NODEVID() in order to avoid overwriting the devid
> > > set by libxl_device_channel_init().
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > This might want a:
> >      Fixes: 3a6679634766 ("libxl: set channel devid when not provided b=
y application")
> > 
> > Before that, the devid set by `xl` was probably ignored. I think before=
,
> > the console devid would be taken from libxl__init_console_from_channel(=
)
> > parametters, so the first devnum would be `0+1`, so never 0.
> > 
> > Do you agree?
> 
> I'm not sure I do. The use of ARRAY_EXTEND_INIT() in xl_parse.c predates
> commit 3a6679634766, so there is certainly more than one potential Fixes:
> candidate.

Of course, this was my first candidate as well, but that's part of the
original introduction of channel to the source code, so it didn't really
make sense to that the feature was commited with devid=3D0, surely it
would already been an issue at the time. This is why I start looking
in libxl on how devid was used.

> So at least for the xl case commit 3a6679634766 isn't relevant, and my pa=
tch
> is fixing the xl case only.

Last time I check, `xl` is using libxl, so any change to libxl can
impact xl.

Before 3a6679634766, channel#0 would be connected to console#1 because
libxl__init_console_from_channel() was called with dev_num=3D`channel#+1`,
and $dev_num was used to set console.devid.

After 3a6679634766, we have console.devid=3Dchannel.devid=3Ddev_num if
channel.devid is -1, or console.devid=3Dchannel.devid.

Without 3a6679634766, having more than one channel with devid=3D-1 would
result in failing to start due to having more than one channel with the
same devid.

So the only good candidate is:
Fixes: 3a6679634766 ("libxl: set channel devid when not provided by applica=
tion")


Also, I'm not sure channels are going to work properly if there's more
than one console, lots of code seems to assume
console.devid=3Dchannel.devid+1, and there's probably other issues.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


