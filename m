Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9877A6F440
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926376.1329221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2Ym-00081k-Df; Tue, 25 Mar 2025 11:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926376.1329221; Tue, 25 Mar 2025 11:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2Ym-0007zA-B7; Tue, 25 Mar 2025 11:35:08 +0000
Received: by outflank-mailman (input) for mailman id 926376;
 Tue, 25 Mar 2025 11:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlsK=WM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tx2Yl-0007z4-8j
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:35:07 +0000
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [2607:f8b0:4864:20::d29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e1c93b-096d-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 12:35:04 +0100 (CET)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-85dd470597fso159217539f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:35:04 -0700 (PDT)
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
X-Inumbo-ID: 31e1c93b-096d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742902503; x=1743507303; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=58MPaY2Nf3iEmvHNObZjeJQX1QDxcioBJCo8Cm8eKU4=;
        b=bIQTuJ7DhAw8LqcEjSbAPZF//MSMmBCBOyCsJva7wJXmeney948+m4VPdd+fw6kYnR
         GJ66iKr3vJtN4t11pgkoqNS7iktpziiHQNisIXIRJyfsKHdmSLJut1xw4zlXj+2RaMzu
         cMusGrGvBGgfIgidh2h80KMtDp7syackzk8Fc4NbIto9lO3bSA35HbDpiVJCYkf4VFzD
         xki3cRXGu8XiquGhRoRc4xBiOlqBfVO8mfKAoUcZdPU1k0fz6bwB1jYL6q3thgZhbp+S
         4e6nbS3aME+QaLUktmHS3TlpzdoC+ZQZpcs+QtQ+nBxrqmFyBR8jWW7q++JT9u8cqwuP
         XSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902503; x=1743507303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58MPaY2Nf3iEmvHNObZjeJQX1QDxcioBJCo8Cm8eKU4=;
        b=B4RnSOlMA1UaEj2I2kSNYJh7XjDXE24pQf7gMqXtVUB4iTUokLUaS7Gh7rvWwKTmBJ
         VlVp9S0nN0qF0UEtLnYfIGVQ/YY64Bf2aE9MJxcP+LTNouv7NKgVKGQ++XNlalyhpp1C
         Puj5PMMcswmxy6rSUKo41cjnWpOJXFDdG3cCr35WGnb2vXX5Lhdg6SvOKnbkmq2djZ5a
         UTaw5doHxLN9i7/BoumDNkVCGFm3hsqKiMo2WkJzJUy5eSXw1x/kC+qW6Q/K4XSIj7O/
         rnkMTNlYPQYRmcU2ySXtl9r748QIj1fOBFxZqrtMVXZxWg7ggNdMptGtV7oh4vUgannk
         zBLw==
X-Gm-Message-State: AOJu0YwLqfRccKdv2ZwBb8U7pNY9iXQg3vVHmNq+am4ZkGr+K+bHXw6m
	WWDISfvQcWLqySKRLxQ3csQmh4uAIezpgKKjJGR/bLH6DWFFZP6ytOBMUBKaw+UW8ca0sg/EOvn
	twDfcJPPGLztW9enBxwXUNlxtWp9Ipg==
X-Gm-Gg: ASbGncvw7cWyER6TVZ5GFSWphSaYaFVEVICmGmvQmjiIn22NBRlNeh2hqJOnahTqfeK
	P8GGiaWYBR7ZR3m46rqsSRs8iywsUudQHNJFq9QCMuklcSmAnPPco7djDPXT5kTZTDDQAxP0YDc
	bLIXhNVzUcKM62A4EaJn9R+9w6aw==
X-Google-Smtp-Source: AGHT+IEk+Tza1v+6Hx2OGbqtZsWqMgBdkC7lmG1ezv92CrYhrQJ5A4jnjdHIvkPJdDCANYEfMTz+LRR8zBcjW6dRMg8=
X-Received: by 2002:a05:6e02:3047:b0:3d2:b154:49dc with SMTP id
 e9e14a558f8ab-3d5960cd132mr173744455ab.5.1742902503170; Tue, 25 Mar 2025
 04:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250325113014.1945518-1-oleksandr_tyshchenko@epam.com>
In-Reply-To: <20250325113014.1945518-1-oleksandr_tyshchenko@epam.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 25 Mar 2025 13:34:52 +0200
X-Gm-Features: AQ5f1JpNPHN-pl8lSvf7hjhojEIg0CBR_DBZvHbsOMJgDh0lRXgRxRzwXedfW_0
Message-ID: <CAPD2p-n9GGX3_n5O60YTdHE3q-sAoR6M+wkKdUhwnMPs9ZCMhQ@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/device-tree: Switch back to dt_unreserved_regions()
 in boot allocator
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: multipart/alternative; boundary="0000000000009470430631291cf5"

--0000000000009470430631291cf5
Content-Type: text/plain; charset="UTF-8"

Hello all.

Please, ignore this second email, it was sent by mistake.

-- 
Regards,

Oleksandr Tyshchenko

--0000000000009470430631291cf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hello all.</div><div><br></div><div>Pl=
ease, ignore this second email, it was sent by mistake.</div><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr"><b=
r></div></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><fon=
t size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-seri=
f">Regards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr"><div><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2">Oleksandr Tyshchenko</font></span></div></div></div></div></div></di=
v></div></div>

--0000000000009470430631291cf5--

