Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED58C7A14
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723517.1128446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7deC-0001Zz-3e; Thu, 16 May 2024 16:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723517.1128446; Thu, 16 May 2024 16:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7deC-0001Wt-0f; Thu, 16 May 2024 16:08:00 +0000
Received: by outflank-mailman (input) for mailman id 723517;
 Thu, 16 May 2024 16:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7deA-0001Wn-EF
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:07:58 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75440604-139e-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 18:07:56 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so10796761fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:07:56 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e6f834e5eesm5463791fa.131.2024.05.16.09.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 09:07:55 -0700 (PDT)
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
X-Inumbo-ID: 75440604-139e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715875676; x=1716480476; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W68Q7qb73jEOcW2eXjc2JWV11ah8c1Z6pjSN1W3UmTw=;
        b=gGcdRueuMqJVHnM9qC74Fxw45QBrSEjsB3IsIO80no2isQOXqhhfY0rcI70jleG8RZ
         zxS5kzB2gySDDocjNdTL7k4Hs8J+yPK1O7dSeL+Z8q/D7RDQ/XIBslnHN/LjYX8sb2qA
         Vd1Rc5njw0wy5teOdy+L3Pt7JiWi8/3pGKZNgQallOnfleMFnzMvOC08208tLRXuqvPt
         8Y9rWnx62fXGbtr8Q46+RynbcrNII1uBgWgn2ZCE2mw3+vRMPMoGfdPnBr08bKTbkoMZ
         19bkO8LO+WRM14A383QZB75uWdFTyjTqMVD4nugjVgeCRkWAcusSKqqFIMyBBKNB1Y4+
         YJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875676; x=1716480476;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W68Q7qb73jEOcW2eXjc2JWV11ah8c1Z6pjSN1W3UmTw=;
        b=nhdsWX2lbZv5a+zQohaNjotswwJhcfnO3gytDbN7n5ruhAjRUMuij/4UMBgwOM0HIw
         m1zyV5n8U2UAVdlnVR4pMKAmt4ATbRlb/I38cMrMZu6hlKKX1Gel2EBBvQxBcetpYtoG
         wLGts/YF+EgO8IbHlqiLntmZyFazE9NVXo+7rq/SzcMr5GBsxQtOBRMvpwLy2+vqixF0
         2D/JoRdD2BKnNs0NKK37/UM7DTlB5BJVg3czbP+EJ6urm1NfeZKCShyXOu3L1oYknLiO
         3pIsSQ5jmIYFZEhKy4viyjrylSRvL3nukIEiZKT9qdnKYqoaKnYtdKFD2s+D4s2QL0i1
         3IXA==
X-Forwarded-Encrypted: i=1; AJvYcCUTQB8vQhjPU9bSMMkWuvDLhDkLI0PpnUdq872SHHrM2EhRZC0fzdNBKk7EQuG09Suh7ZNCiKg+T3VzbcxPb0NQDIpbwVz6hz8DIFiB9E8=
X-Gm-Message-State: AOJu0Ywt9vgULLO8YcSFzxr8K2KTKe2FxIN4EBaS2auCOPOlv+Ig3mBv
	Lxd57Zlid6uVFmXHaqsx9m5J6g860zfYKFMA3UYmWTCu74tLw3ek
X-Google-Smtp-Source: AGHT+IGtLjKN1a+5Kp/Vgxso5pZpz9M6Hgb4/VVOwbEQR7Yi7CDWKProidWD2KkSIlpUTBw0cmXMqg==
X-Received: by 2002:a2e:a555:0:b0:2e1:a8db:2bca with SMTP id 38308e7fff4ca-2e5205e2972mr154874781fa.48.1715875675776;
        Thu, 16 May 2024 09:07:55 -0700 (PDT)
Message-ID: <0bb2becc5b5d327f6b3b878b876da78034bcebd6.camel@gmail.com>
Subject: Re: [XEN PATCH v7 1/5] xen/vpci: Clear all vpci status of device
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>, 
	xen-devel@lists.xenproject.org, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, Huang Rui <Ray.Huang@amd.com>
Date: Thu, 16 May 2024 18:07:54 +0200
In-Reply-To: <4eab3820-d357-42cb-a367-a7a0966e7e3b@amd.com>
References: <20240419035340.608833-1-Jiqian.Chen@amd.com>
	 <20240419035340.608833-2-Jiqian.Chen@amd.com>
	 <4eab3820-d357-42cb-a367-a7a0966e7e3b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 10:27 -0400, Stewart Hildebrand wrote:
> On 4/18/24 23:53, Jiqian Chen wrote:
> > When a device has been reset on dom0 side, the vpci on Xen
> > side won't get notification, so the cached state in vpci is
> > all out of date compare with the real device state.
> > To solve that problem, add a new hypercall to clear all vpci
> > device state. When the state of device is reset on dom0 side,
> > dom0 can call this hypercall to notify vpci.
> >=20
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Could we consider this patch for 4.19? It's independent of the rest
> of
> this series, and it fixes a real issue observed on both Arm and x86.
> The
> Linux counterpart has already been merged in linux-next [0].
>=20
> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?h=3Dnext-20240515&id=3Db272722511d5e8ae580f01830687b8a6b2717f01

Sure! Fixes should be merged.

Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


