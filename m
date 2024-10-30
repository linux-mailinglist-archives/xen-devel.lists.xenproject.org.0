Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D109B5E2A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 09:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827917.1242682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64KR-00017q-Oo; Wed, 30 Oct 2024 08:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827917.1242682; Wed, 30 Oct 2024 08:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64KR-00015P-Ld; Wed, 30 Oct 2024 08:45:23 +0000
Received: by outflank-mailman (input) for mailman id 827917;
 Wed, 30 Oct 2024 08:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCp=R2=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1t64KP-00015J-UT
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 08:45:22 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 484604c7-969b-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 09:45:14 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-539f2b95775so7278325e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 01:45:14 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dec818bsm557506666b.17.2024.10.30.01.45.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2024 01:45:13 -0700 (PDT)
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
X-Inumbo-ID: 484604c7-969b-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzEiLCJoZWxvIjoibWFpbC1sZjEteDEzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ4NDYwNGM3LTk2OWItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjc3OTE0LjkxMTMxLCJzZW5kZXIiOiJjaHJpc3RpYW4ubGluZGlnQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730277914; x=1730882714; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya9siQaff7yrs6VkC2sMft2PPhKGAsqT/t4iJJBvyBs=;
        b=RQ3ynDPV8Ti0VB9a9UAPARusD0MrVSebZN67YiDQ/469KdBMGgEcaNtpo1gh7iLz6t
         vhMqZRIynphUQat/Z0frY82ctU0EXPFTeUEjk+pxyGQhKjmnDdqhgfiM14gNANKigFnR
         dlD27bRIV6C4N9jyvhFpGwLoi2HF4kNcwsz2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730277914; x=1730882714;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ya9siQaff7yrs6VkC2sMft2PPhKGAsqT/t4iJJBvyBs=;
        b=L4lzp6nkHm/AXc8wbyb05CcZU/n01lUtNagHhVz/WrmYQm8Hu0gnkSi4FfoS49A14L
         WeU7QSyDZ5KnOC74oXcRbddDitiIPr4qfuwKoC4Uhayy4eu0vXuuxPyPvIbCPZQm7YOn
         HICk/5WEq3KPQw0QTe9OqdyC1fZ6oa3BBxLZXQERwRreynYU2CHywT60tDzCtk6nrXU2
         wpC1yAi9OHdSx+9rhySni1s3zoc6+sKH1fzxs7gYOrginhhfuq1oHJs/HMt+EyjdXtBV
         joAgmG1WyerMbAxZWvattIbPi71XcNDQQKeup4e/jXf7T11h1faVJNHTsEO4SSsjCzT2
         Gckw==
X-Gm-Message-State: AOJu0Ywl6gazs4lNIyQfLRbuvhpHP398tCW+Um8R5dxAx0RBEzO7Dl3X
	oTzzZCylISifGOBQ0fIEwzBrB8L6ZDEHZGaqAlWxDVNpB182GupmHjLujmHQURo=
X-Google-Smtp-Source: AGHT+IHH5vfdUbKdl4OijcycyqkYsKiP+5hhbqtQ2CuHYNyXjTyq4MYLhWC7cf27g1ji8Gj5TgrYyg==
X-Received: by 2002:a05:6512:1285:b0:539:9ee4:baab with SMTP id 2adb3069b0e04-53b348daf62mr12360026e87.30.1730277913850;
        Wed, 30 Oct 2024 01:45:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive types
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
Date: Wed, 30 Oct 2024 08:45:01 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9462785-D2AF-4354-8B07-69413E952B88@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 29 Oct 2024, at 18:16, Alejandro Vallejo =
<alejandro.vallejo@cloud.com> wrote:
>=20
>=20
> The invariant I'd like to (slowly) introduce and discuss is that =
fields may
> have bitflags (e.g: a packed array of booleans indexed by some =
enumerated
> type), but not be mixed with wider fields in the same primitive type. =
This
> ensures any field containing an integer of any kind can be referred by =
pointer
> and treated the same way as any other with regards to sizeof() and the =
like.

Acked-by: Christian Lindig <christian.lindig@cloud.com>


Fine with me but the OCaml part is not very exposed to this.

=E2=80=94 C=

