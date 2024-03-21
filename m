Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40D885632
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696261.1087027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEOg-00053m-9Q; Thu, 21 Mar 2024 09:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696261.1087027; Thu, 21 Mar 2024 09:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEOg-000517-6l; Thu, 21 Mar 2024 09:07:38 +0000
Received: by outflank-mailman (input) for mailman id 696261;
 Thu, 21 Mar 2024 09:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvWl=K3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rnEOe-00050u-Bh
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:07:36 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73eda7fa-e762-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 10:07:33 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so98033366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 02:07:33 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 di9-20020a170906730900b00a462e166b9bsm8168704ejc.112.2024.03.21.02.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 02:07:32 -0700 (PDT)
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
X-Inumbo-ID: 73eda7fa-e762-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711012053; x=1711616853; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eq9syIN272CbfFhniy4a+7MTtRGsuH0LlUnyFxg3v8M=;
        b=Fpc9vDtFn6+MDr/nAoBrKLTKHlPDhcqq467EejDpCUSWReZsXPbJrLgNmwzx7ZUqe2
         0lcPDDeOzPs4FllfVXh1A4qj4fP44ZK0UcO2WTuEN+gaC8r5Yb3+cVTFGarjwiaPHvI9
         1gTUS3kvV3A+qzMDtrbwJgtB8ZCPK0u1yGQoJLV1SwoLwq9Q9pBj31MLqPj8Iej6Ixx/
         4BzAwDDaJ5QP7lWVoVZJymY/pTN0/spHcA6L4r80s/K5HgsSVJR5Tx4sNEIwwQZPLJh4
         Mqki3Rb8THGho1EqqyFdItPQm2tVQFwFs0BVjMSnq06M8G4vlX9QxSLyFLXS97hDy3NX
         MwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711012053; x=1711616853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eq9syIN272CbfFhniy4a+7MTtRGsuH0LlUnyFxg3v8M=;
        b=UX2vetG6nivyV3LQn4P001awXqhfdrTjSHHWgnBoiXFH+IDvfLT7b3+5kv/lwGYNe+
         0MAFU6MA4MuQotpEqGceHbfJd3T2vCtc2e958OcTvRIym9sEaYZ77JgMZRNIVjrwX8lO
         9Fvr8VPU6D2YbczwRz7/ck/29uVvRjenfPsVKbXnkFYVlGnWZve5oAB/PNwe+Aa0WPjU
         6Df5rf+A+cZcew23N20PB0jz4gPyf4fey2vZYMQqqTlZXA2vlCL3zcPLTgLv6EYRjM5x
         K+5eHgE8n4vK1qqtazAePcSBXZsOiZE+hFU82S2BDvs78knT+A8M1gi6t7eD8DuGbkbP
         37ng==
X-Forwarded-Encrypted: i=1; AJvYcCUpzgZVAfxTk4LiKh5Y8YOSLjClIbJG+Xu95pgHD5UMIgZ0zPxNfza94/ImE2ttd8QiMX5dwCuLsoI49J8390O0jCKyU3UjBf0nNBHOMSc=
X-Gm-Message-State: AOJu0YxtCkEGoIQeunsrgjlqdJy7PFC0t/pZmcQbR8vZmptVvSLetwNw
	Pj/iekVjXqmyTQmEWMuQgHk/8UdR73Ozb4qSGBSJhWG4SFMxyxvKm1p02ly2yM0=
X-Google-Smtp-Source: AGHT+IFQ/NoqzPWooCFIYldznHaeO/OeD24p2EweEMAYM+IrycJaNLLdD03/xclGMDpOx1VZroyaWw==
X-Received: by 2002:a17:906:19d6:b0:a46:d2eb:1792 with SMTP id h22-20020a17090619d600b00a46d2eb1792mr5760190ejd.65.1711012052617;
        Thu, 21 Mar 2024 02:07:32 -0700 (PDT)
Message-ID: <0f91f4c773f7001f8b25cd18b08704a8884b8b19.camel@gmail.com>
Subject: Re: [PATCH v6 03/20] xen/riscv: introduce extenstion support check
 by compiler
From: Oleksii <oleksii.kurochko@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Thu, 21 Mar 2024 10:07:25 +0100
In-Reply-To: <20240320-oak-uprising-db787f501695@spud>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
	 <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
	 <04c1424cec1342dcfb849d361f5eb9f3e7f34734.camel@gmail.com>
	 <20240320-oak-uprising-db787f501695@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-20 at 19:44 +0000, Conor Dooley wrote:
> IIRC this only "works" because the OpenSBI devs assume that there are
> no
> non-normative behaviours and all CSRs have their ~God~ RVI defined
> meanings. Reading a CSR to see if it traps is not behaviour you can
> really
> rely on unless the platform claims to support Sstrict - but Sstrict
> you'd
> have to detect from the DT so chicken and egg for you! It's one of
> these
> new "extensions" from the profiles spec, so it doesn't even have
> support
> in Linux's dt-bindings yet. Up to Xen devs if you guys want to make
> the
> same assumptions as OpenSBI. Linux doesn't and when we discussed this
> not too long ago on the U-Boot ML in the context of the rng CSR it
> was
> also decided not to do make the assumption there either.
>=20
> Personally I wonder if you can just apply the same policy here as you
> did with Zbb in the other thread and assume that something with H
> will
> have Zihintpause and leave implementing a "fake" pause as an exercise
> for someone that introduces such a system?

If i understand you correctly, then it is done in this way now. Only
build time check is done, but it would be nice also have some runtime
check, and for now, for runtime the "check" is only exists in
booting.txt where it mentioned that Xen expects from CPU to support
some extenstions; otherwise "please implement the following functions".

Anyway, at the moment, the best one runtime check which we can provide
is detect availability of extensions from DT and what I mentioned in
commit message.

~ Oleksii

