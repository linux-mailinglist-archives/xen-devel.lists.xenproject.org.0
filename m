Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B841F9428
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 12:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jklv5-0002RG-78; Mon, 15 Jun 2020 10:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jklv3-0002Qz-40
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 10:00:45 +0000
X-Inumbo-ID: 11c752ea-aeef-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11c752ea-aeef-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 10:00:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so16456666wrp.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=7FVvavwJRrtYZHpZPbhx3fXJrJ5Jws1zwwFYj2fs8rE=;
 b=dAhhjC9D6bGt5slqmC3gXs2TN8dkXW25+0L8bgrlyYwW5wA4gHFJsxIOWJChZAwbvo
 OMHmkTglUlxYxL6WTv4JFdJJ3GcgjIZXTOwSeXf+sl8WyyZvDgBwv4z0IGX19wR3CZTu
 fc6PqsleJcmpt4+Mjo+51VWIlwkpJVVy0jivAZ4sla6CX0OkffK/7BHzrQayl9AroqUg
 JQBn4ICBtEp2Bb05CSu3OQ9bqHvkSYXItNY3vhfczLSzBL2p9Nlzg8pM8bFPaPgfVpPl
 vJg1YAGREELtyddzd2DQYtlDWayDh5yxiFObfk8acvtl5HUN8S7M/+Pv1V4lKr0DUwdt
 SVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=7FVvavwJRrtYZHpZPbhx3fXJrJ5Jws1zwwFYj2fs8rE=;
 b=GYjAAu2j8N/5CShgRijOlud+yj+r07cvKbRcgmz7KnUcycr+e4ljjE4+zGpJdjlOwT
 +B5vWt/vrN08R22Y9YtoxVwJMdeqW3y2R4S/OwPTYeMo3zF0/1nQbWLiJVPcQFUVf6JH
 0Jva5O90J9+Jpp61ODH8WxlZuiXzxG2kRwf0TdS9duzdzhAw5aFHOXObsQHL1v9NBZ4m
 tZE/B9Qx8h5NlCFYbPxhiJq3W4ApNmMUcVosIjAzC0KtMkyaZwu4PTnGWGePTtLII1+w
 HT4kcGL+WpAMq4Du8O9uffdziuqX8Zuva+nNxuuyyAZJLrf6KZwNtil7rCJVDYt83DxZ
 qYNw==
X-Gm-Message-State: AOAM533p8AW4XUmpsdzkRhPubJ5FWLsS4sbs3YJVovhJ/Sg+4kHKMxn4
 5oVkfNDp26CdugI9OcJRiYo=
X-Google-Smtp-Source: ABdhPJyFQ7nwu3Ca07xeA2Cv4O5oQ+DCZ/cJ0nIAe5qJTU/51EgphOOqRkHgMvGE05W9dNmpNdPPNQ==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr29908456wru.124.1592215240328; 
 Mon, 15 Jun 2020 03:00:40 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id c206sm24337775wmf.36.2020.06.15.03.00.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 03:00:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-2-roger.pau@citrix.com>
In-Reply-To: <20200612155640.4101-2-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 1/8] x86/hvm: fix vIO-APIC build without
 IRQ0_SPECIAL_ROUTING
Date: Mon, 15 Jun 2020 11:00:38 +0100
Message-ID: <002b01d642fb$d2e229b0$78a67d10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIx2gY8gI577+TutNP+VjieYU4/XgB3+NohqB6DL3A=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 12 June 2020 16:57
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14 1/8] x86/hvm: fix vIO-APIC build without =
IRQ0_SPECIAL_ROUTING
>=20
> pit_channel0_enabled needs to be guarded with IRQ0_SPECIAL_ROUTING
> since it's only used when the special handling of ISA IRQ 0 is =
enabled.
>=20
> No functional change.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/vioapic.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index b87facb0e0..bd41036137 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -391,10 +391,12 @@ static void ioapic_inj_irq(
>      vlapic_set_irq(target, vector, trig_mode);
>  }
>=20
> +#ifdef IRQ0_SPECIAL_ROUTING
>  static inline int pit_channel0_enabled(void)
>  {
>      return pt_active(&current->domain->arch.vpit.pt0);
>  }
> +#endif

It's only called in two places. How about just manually inlining?

  Paul

>=20
>  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int =
pin)
>  {
> --
> 2.26.2



