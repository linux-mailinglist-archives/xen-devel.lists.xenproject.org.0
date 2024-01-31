Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F0843E21
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673938.1048542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8bC-0006WQ-N9; Wed, 31 Jan 2024 11:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673938.1048542; Wed, 31 Jan 2024 11:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8bC-0006S1-KA; Wed, 31 Jan 2024 11:17:46 +0000
Received: by outflank-mailman (input) for mailman id 673938;
 Wed, 31 Jan 2024 11:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UyAi=JJ=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1rV8bB-0006Rs-5V
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:17:45 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d950f9-c02a-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 12:17:42 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-510faac8c57so785233e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 03:17:42 -0800 (PST)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 f30-20020a19381e000000b0050e741c0c29sm1823697lfa.156.2024.01.31.03.17.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jan 2024 03:17:41 -0800 (PST)
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
X-Inumbo-ID: 59d950f9-c02a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706699862; x=1707304662; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFtUHxjmtJZ/bhnH4zOEE9wKHR9JTKkbMIyhjgPXS3k=;
        b=MNcjqsNPVLiZy4xm78SmPbMj+mBE7YJjsTdr7t3uGP4nOqu8Zd7+lR8cpSWmmWsxQG
         qJxbAKIzxXolMK9ZERKz4Tcs+7hvMNobqEadPdCCYuY/WW+WeEtWrntBqihRxWCoEN8F
         Smu2UYP5ZiAucE3967EzjX/9tR0V5zHfxyELg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706699862; x=1707304662;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFtUHxjmtJZ/bhnH4zOEE9wKHR9JTKkbMIyhjgPXS3k=;
        b=s5c5Q1h8q6EmSZSIyyqlnb8RFpI0lnyVuxd7KVbQTeizYGkCZESggSEASMzWvmgFqz
         rMV6FgXlmS4WDFUqVlWRuWF/xTZ10o7Xt5I2N7KCocASxKQKm6Q/uxLc57IzRCd16wcd
         w/rC93yZq3JBCz8vOtMftKVdyxIQpf/aFiLNC9Lji78/dUa541os30ag/qA1i4A9h98v
         iYCFeU8wNciR56XRnPQTTI33n6JUZWR+Cwed8XVeYtehy9ooRO6KKVjAr0guwxCitYnc
         +KGqIwHTG7RqRkVZ+CVvepUtk/rPMR0/KebyI3ASPxMmPkn0hT78xmacDNqS2e6BoKO4
         3G5w==
X-Gm-Message-State: AOJu0YzQHFiHxEm7gXur7ZPvdTmqMaetF7P0MtQOe755YZTnNJU09rP8
	oetxmXGKGmq5xqEv/Qd2O+A/A1gerOfLf8SL3XWH5qzFs0H/OxWE6AJdznyeQAM=
X-Google-Smtp-Source: AGHT+IEEvM5AwuM4ibqXh8G3YaRY03V1guAtmI7lZ6zPyE11ncPgccTL9i/eQxw/CZLuMY8585Bf9w==
X-Received: by 2002:a05:6512:447:b0:510:15e3:1cb1 with SMTP id y7-20020a056512044700b0051015e31cb1mr1509772lfk.9.1706699862000;
        Wed, 31 Jan 2024 03:17:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v1 2/2] oxenstored: make Quota.t pure
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <f98edc633527b6d9a6855af0aff4fb77970454cc.1706697858.git.edwin.torok@cloud.com>
Date: Wed, 31 Jan 2024 11:17:30 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5879EE8F-6FAB-4026-BEDB-1AEEA7BF23DB@cloud.com>
References: <cover.1706697858.git.edwin.torok@cloud.com>
 <f98edc633527b6d9a6855af0aff4fb77970454cc.1706697858.git.edwin.torok@cloud.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> On 31 Jan 2024, at 10:52, Edwin T=C3=B6r=C3=B6k =
<edwin.torok@cloud.com> wrote:
>=20
> Now that we no longer have a hashtable inside we can make Quota.t =
pure,
> and push the mutable update to its callers.
> Store.t already had a mutable Quota.t field.
>=20
> No functional change.

Acked-by: Christian Lindig <christian.lindig@cloud.com>

This is shifting copying working to GC work, at least potentially. I =
would agree that this is a good trade-off and the code looks correct to =
me. But I think we should see more testing and benchmarking before =
merging this unless we are fine merging speculative improvements.

=E2=80=94 C



