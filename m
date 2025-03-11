Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC35A5BC8E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907595.1314805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwBf-0005WS-5q; Tue, 11 Mar 2025 09:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907595.1314805; Tue, 11 Mar 2025 09:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwBf-0005Uu-35; Tue, 11 Mar 2025 09:46:11 +0000
Received: by outflank-mailman (input) for mailman id 907595;
 Tue, 11 Mar 2025 09:46:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QaIb=V6=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1trwBd-0005Uo-FP
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:46:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87ab140-fe5d-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 10:46:08 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso60766466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:46:08 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2a40aa5fcsm280012466b.139.2025.03.11.02.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 02:46:07 -0700 (PDT)
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
X-Inumbo-ID: a87ab140-fe5d-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741686368; x=1742291168; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBpczGnIrPBghAyOv0JflLum7lPmsd1GkdA7F43wOCE=;
        b=Mv9jgMgR4cBE3rctVqWaqVLveI/UP5xGMrPFYCYWSBju9pQmT3F3+/bEqEKxSYVJll
         s8yAwLHPRM1BdjPXuzf31ZGVS4ienPKueKDWKAs+xQR1/4syiforrqF5A+Uv/rR0Z6Aw
         7Vjt87oL69k1FAZ5zk3H9cNIvqFBXlp2k5bAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686368; x=1742291168;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBpczGnIrPBghAyOv0JflLum7lPmsd1GkdA7F43wOCE=;
        b=mNLRkL1SEsimBA8twODvtrnq53NU6zEHxGtwBRjlaRqRhHzbN0+dCsRxzSYrBLPmMF
         uja+GyE0fAHu/t3/qKvyAL5KACO5ChT0fHeWP81HmcgmnZbaSmxegQ9ce0tZ/KorJEzn
         o882ypyx5F8MKCcO9jKvPqhUrkx8LGxjImfJ0dOtufjutn5JVh65pSeb41zwvDbZDhFg
         BsUC1IcHYni33xOAxVVLsOy+ajTQZt/wMc9omXhYUvS06hmLyMWcmttTR7f85GP9kHU3
         7RfHqBIESP7Iy388CbkisROREeUZHytZN/pZr1MTB7+9JXYnEBAF/19ts8x8w2blt43J
         xAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkfNBs8EY7IAeFKwbE+adjj2H9HCGtUx8Fu8JiKhkTL/r02wIUgmSA2u2JdAPcUZIFe5eYsT3OW1Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ0pPMFQSYwTbjf06M2SXMGA45L2PQZuBQgv/h5xH7W8z5HgxL
	cMWXLiF9BjeItLpR8HbytV8IxU25WJyQXbx2kZy5cb0nmD27+OPnYzr1B6Cm5R4=
X-Gm-Gg: ASbGncuLJ3eIsC5dfQhGMuE9xAlbJcM8PEI6qk/rIaxLW/uN5BvLZ0R/AOtCI+VPvMJ
	REHVIzKRiMyPARBT0j1oQhYdPbFgt6pdElXvFRtJJU+NZo2ceE81U0X5PEtHWFK4M1G+IZeRVWQ
	PFxyTaR5GcvaqM0pyH3hXJchcpTvXaoq8KccjPlUd8b0IzX771GYrKQ5yNbv5RN5zBFRjFHlEgJ
	+xMO+ZI8d4fpcYqiAw1SI3+MwF6WSQKtXIOGWYta05ZTYhqeG4zAcaCK8x6c4xzmm3JKe0T10j5
	34w735mZE4PoVRexRfbslNR6FthUvZ+PFnJD6f5v/axs53nmVMA=
X-Google-Smtp-Source: AGHT+IGmNQQ/dfLjXs2gIZTKGfHTObzobnN9ImQNkKkML9ItsIhU0mwP975JB3Vlb+ia+A7rLbfuXg==
X-Received: by 2002:a17:907:720a:b0:ac1:e881:89aa with SMTP id a640c23a62f3a-ac2525b9c95mr2033700666b.5.1741686367930;
        Tue, 11 Mar 2025 02:46:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 09:46:06 +0000
Message-Id: <D8DCAEVQKQFE.2W7VAZ1VZ9LZW@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
 <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
 <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
 <f50d8ee7-a00f-4f4f-99f6-4313af7a4fdc@suse.com>
 <D88D5732H4EQ.3770M7EIO3TW1@cloud.com>
 <6070a7b3-4d1d-4db9-a812-5887de129aa1@suse.com>
In-Reply-To: <6070a7b3-4d1d-4db9-a812-5887de129aa1@suse.com>

On Wed Mar 5, 2025 at 1:39 PM GMT, Jan Beulich wrote:
> > It's all quite perverse. Fortunately, looking at adjacent claims-relate=
d code
> > xl seems to default to making a claim prior to populating the physmap a=
nd
> > cancelling the claim at the end of the meminit() hook so this is never =
a real
> > problem.
> >=20
> > This tells me that the logic intent is to force early failure of
> > populate_physmap and nothing else. It's never active by the time balloo=
ning or
> > memory exchange matter at all.
>
> Ah yes, this I find more convincing. (Oddly enough this is all x86-only c=
ode.)

Should I take this as an "ack" to the general plan of early returning on pa=
ges
<=3D0? I have a series pending that relies on it (the v2 of this[1]). And w=
ould
rather defer its sending until this one get some form of nod. Otherwise I'l=
l
integrate it in the other series so I can at least reduce remove dependenci=
es
between things in-flight.

Cheers,
Alejandro

[1] https://lore.kernel.org/xen-devel/20250304111000.9252-1-alejandro.valle=
jo@cloud.com/

