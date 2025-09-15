Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D668FB587E5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 00:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124467.1466803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyI8f-0007nc-5P; Mon, 15 Sep 2025 22:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124467.1466803; Mon, 15 Sep 2025 22:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyI8f-0007lk-23; Mon, 15 Sep 2025 22:57:37 +0000
Received: by outflank-mailman (input) for mailman id 1124467;
 Mon, 15 Sep 2025 22:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=70H4=32=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uyI8d-0007ld-HP
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 22:57:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da38ac8-9287-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 00:57:34 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45f2b062b86so12974735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 15:57:34 -0700 (PDT)
Received: from smtpclient.apple (public-gprs232241.centertel.pl.
 [31.60.54.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037186e5sm196923275e9.5.2025.09.15.15.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 15:57:32 -0700 (PDT)
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
X-Inumbo-ID: 5da38ac8-9287-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757977053; x=1758581853; darn=lists.xenproject.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnYhUQzKzPFnbfPJig1Dv6FPRHTgQ6d8LY4Eo419aR8=;
        b=g1BxkWklR4I4FXn4KUecmVzocgkZssdRQmOiCgMptEP0227t+izRFJCXu5KVYaAUVq
         6gO9ilLoyKT3pkI+PNJdsGxhkYn6qnB4Oq8u+0JAgKnO0SG8QRzVCWoViN3Z0nyka1a1
         V9G67uZcMfPHpvfIbAdgwKCUHGb1srK/MW3aySU1TOimf5FthWL0QcOkFb3REWmtISsu
         HPXZkNB2PzGlNE3DGi78sjoIX043LFBf6yeth3iJlbXljsXiFgkM9P+3BAgMoWQHuhL8
         P8Ud9W4YYkPIFQWQH4YV2S5xuTQgNizO2CJxICwRIxti4VhSbtzzvqPvZuFglIKKLLcy
         Ekaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757977053; x=1758581853;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnYhUQzKzPFnbfPJig1Dv6FPRHTgQ6d8LY4Eo419aR8=;
        b=k5sdjn5+LK9bxVG1laWrdrY5ir/p+Jc2q2xheHkSnustDOVZNX6iP1fkWK0h/TXuCA
         lSuGzMdOwRyTNZHbjed2RUuquk8Vyxzj70Upahj1KT559pNoDDGxowRPpngf+1SKhRuT
         4mJ33JrPNyMNgqBHAXCEitHsz1ia4G8dgEUfiqqnQnwhpdVZNZ+/Ygjk68l77+7+xgd9
         2SqvR49bCeucxb9PDk0iZXh0dMMTL0bUj7IR3Exy96Dnnq8lToz3TtC/YZteiIzy8r8Z
         XyAopatPJtZTcZfEaWWfqaeb/9ktJrTIgV8QC9VvGqwfZw+Ms2A6iPAAHDmCDH/0Ynu/
         54WA==
X-Forwarded-Encrypted: i=1; AJvYcCXoJgtH1BPqDBQoOToWJKGoZk0gWvwf1wGtkO2TKvTl/vDcrpQHtdXVHOuiwiH2dMcphY04UFYOMn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywo3v2d3wXLgDIY2P/fpvwmFuzDvJWnjdmUei/MLKlw6XycGSES
	KX+nXYmsw0S8D0dCX+iY8Q219PjaWynU/uKcP08HPi9XpLLpk1XIqkXO
X-Gm-Gg: ASbGncsmDpsm51Esibqx06ZYsihMi5GGqG1gLIBi6vn6bqgFblXIaVLiUxn1uLWeb5n
	4Kb7+/vVV9Y8BIIIoo+0ywTc8N+EU07fNqb/lKKpunCvfP7fVAkSFbE9WAz+IHHrihp3u0gjV5g
	Lk7sXHxrdTO2+/IF0G9ZLD4ULb2Shd5DbfNgaQdXn9tqxEd818RV5IikB47X+RqffnEMy9UxAbx
	fWClH3wJO4C6WEfiskr1OolpZMMSnSqv/vigoh6OeO52zXCgP8IcFllpxP/Tju5FMAitNM44Dr6
	gf1Ih9kIuqOuEUVL1b/M6vd69Rn18SbiCILqfn69654yA4JnjQZNGHEFUg6ooRVTJu0Q84X99+p
	mk4yzetui29WL3qojfJL0LmUbW6HroZ89nkZ3kpBAwVP/cVj5ePmAP+Pi8+YT8xrgxRFpFhZD+D
	lJIA==
X-Google-Smtp-Source: AGHT+IHe21Bb6U/hH+aoudD0UnxR50zXP8AXLSlZ2b+vP9vkVNg8jFmKP+8aOgNvxs+gXBVp3sMe1A==
X-Received: by 2002:a05:600c:1c98:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-45f2cf9c54bmr49262505e9.0.1757977053078;
        Mon, 15 Sep 2025 15:57:33 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] releases: use newer compression methods for tarballs
Date: Mon, 15 Sep 2025 15:57:19 -0700
Message-Id: <63F3548C-5DD5-4A0E-B7BA-C480ABF60CB4@gmail.com>
References: <a01e2f6d-9bf4-4635-b1d1-9826494177bd@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>
In-Reply-To: <a01e2f6d-9bf4-4635-b1d1-9826494177bd@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: iPhone Mail (22G100)



> On 14 Sep 2025, at 10:57, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> =EF=BB=BFOn 14.09.2025 18:59, Oleksii Kurochko wrote:
>>=20
>>> On 9/14/25 3:43 PM, Jan Beulich wrote:
>>> On 12.09.2025 23:23, Julien Grall wrote:
>>>> On 11/09/2025 09:14, Jan Beulich wrote:
>>>>> Other projects have long switched to xz and/or lzip.
>>>>>=20
>>>>> Tidy things some as well: With the removal of qemu from the tarball,
>>>>> intermediately extracting the tarball again has become wasteful. Drop
>>>>> that. Invoke compressors using asynchronous lists, to reduce overall
>>>>> latency. Drop the -v option from the (previously implicit) gzip
>>>>> invocation.
>>>>>=20
>>>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>>>> I have tested manually the steps and the correct tarballs have been
>>>> produced. I will update my scripts to copy & sign all the tarballs once=

>>>> this is merged.
>>>>=20
>>>> Acked-by: Julien Grall<jgrall@amazon.com>
>>>> Tested-by: Julien Grall<jgrall@amazon.com>
>>> Thanks.
>>>=20
>>>> Is this intended for Xen 4.21?
>>=20
>> IMO, it would be nice to have that in Xen 4.21.
>=20
> May I translate this to a release-ack then?
Yes.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
>>> So far it was, but I'm increasingly unsure, seeing that it still hasn't
>>> gone in. Cc-ing Oleksii too now. Andrew had voiced concern towards the
>>> rm use, but hasn't come back as to his argument towards the uncompressed=

>>> tarball previously not having been removed (when I can't see that one
>>> would have been created in the first place), hence why I couldn't make
>>> use of his (conditional) R-b.
>>=20
>> There is not too much sense in the uncompressed tarball. I prefer to not
>> generate it at all.
>=20
> Generating is helpful, to do it only once (instead of once per compressed
> tarball).
>=20
>> Also I have regarding .gz. If other projects switched to xz and/or
>> lzip (as it is mentioned in the commit message) what is the purpose of
>> having .gz tarball then?
>=20
> At the very least to help people presently assuming they'll find a .gz.
>=20
> Jan

