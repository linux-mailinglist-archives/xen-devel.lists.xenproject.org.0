Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B890DB45
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 20:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743280.1150161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJdD3-0007x4-QL; Tue, 18 Jun 2024 18:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743280.1150161; Tue, 18 Jun 2024 18:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJdD3-0007v5-Nj; Tue, 18 Jun 2024 18:05:33 +0000
Received: by outflank-mailman (input) for mailman id 743280;
 Tue, 18 Jun 2024 18:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Kzm=NU=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1sJdD2-0007uz-5e
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 18:05:32 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5845ba12-2d9d-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 20:05:30 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so65091071fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 11:05:28 -0700 (PDT)
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
X-Inumbo-ID: 5845ba12-2d9d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718733928; x=1719338728; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZzHD8q6NG2XTuCLsc1kImC2M7CKDyg/5o6KXtlMNfw=;
        b=q6sQoVA30xYOrdxJHOM/dgl/3a3IUW8orZFiclceUSBGxObDRljPfmg5fm0UFnSGWa
         6i/BE6qskFvQM32YmW4XCMvcSm3rnuMmE3+enU+1rLfRkX7/GXBqHZdYjt8L598V+u9R
         PzdWDkzNc6S6BenqUGcsQFYXMnKyW2CYYZPr9Xu9y2xiYG4Q4d7CulB1iZ7pCzjmBEOl
         kDOBGvkhZaGqAtSbdYmuyzPorjA+MR1EMsuBvkqokqQgQj5iNpo1c7EXqNQZJO3X9wCX
         2N4wLI9JucjE8Fw9CNF8kOFwpRCMqiyOXTjRNgXbNwp7KiyY8vq6C4xB9AkEZWd32klF
         9MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733928; x=1719338728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZzHD8q6NG2XTuCLsc1kImC2M7CKDyg/5o6KXtlMNfw=;
        b=odvc5bjcwzEar9Ox6Z8K8efCTM41LHa2hcz/0R8H/UWLzKjtzltlFL3EWRe74ELZxO
         jyB7KEtfr29WeZ/zvZqj0ZLp/ZBSCScvkB6cPg/JTRJyuEFGVKN/bPevXNbrq2ZAwbfG
         HZ+WTNKOeAlCzQAHhLHpl+zQZhgaiqyEnK4dcBGVB5H1qTEctnpiIN8pXx2NrwoyFRfE
         ze3h97yNI0ng1O3vuujujmyLa5V60jyHXmXw4j7A1whVUQw5bt9kaK1k98XUOozDi2K6
         cC+YSYeGMtcpFQbuXYxNVQbXzir/HTsMxAOEhaSpD+y8VXZIHwtayreS07uxFoXBbP7Z
         EYmg==
X-Gm-Message-State: AOJu0YzuZVI53tcAoRr91bO/OkqwqtRJGPeKUobeY4DHJDDFC2FBxxPO
	NJp4N1fVSLnKil3nnSV1p9B1xwyjC2E2XDHN1Db8OP929ENuD4G8TGNuFH83iCkmLAzQ5xnFuUV
	SUZZgkO97Tyu2NGTPMGYt01JIxosDrPHdgAyzMQ==
X-Google-Smtp-Source: AGHT+IHk5dbPZ8iZrA/+lMaJQGdCAunIqeOItEfvxohsFWwWQYvVpFVhPrhMHd8O46kTWLrogwJWnliwwzfdg+oYwBM=
X-Received: by 2002:a2e:b0c9:0:b0:2eb:68d0:f1cc with SMTP id
 38308e7fff4ca-2ec3cfe125emr3746561fa.43.1718733928140; Tue, 18 Jun 2024
 11:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
 <334b5a46e31dbf3e8114e9ea8bafd92cf060f2af.1712837961.git.manos.pitsidianakis@linaro.org>
 <86e7327e-0a3c-4e50-bd62-720e986efdaa@perard>
In-Reply-To: <86e7327e-0a3c-4e50-bd62-720e986efdaa@perard>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 18 Jun 2024 21:05:15 +0300
Message-ID: <CAAjaMXYX9x5U1Anyk03__VRMvBYLUimAx=mHoKojmgz6SEhkRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] libs/light: add device model start timeout env var
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000403b33061b2dedcf"

--000000000000403b33061b2dedcf
Content-Type: text/plain; charset="UTF-8"

Hello Anthony, thank you very much for your review comments! They are very
thorough and knowledgeable.

I unfortunately only just saw them, I don't know why I missed them back in
April but doesn't matter. I am not going to continue work on these patches
due to circumstances changing for me, if the community deems them useful
with your corrections applied I hope someone else picks them up in the
future.

Thanks again,
--
Manos Pitsidianakis, Virtualization Engineer at Linaro

--000000000000403b33061b2dedcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello=C2=A0Anthony, thank you very much for your review c=
omments! They are very thorough and knowledgeable.<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I unfortunately only just saw them, I don&#39;t know w=
hy I missed them back in April but doesn&#39;t matter. I am not going to co=
ntinue work on these patches due to circumstances changing for me, if the c=
ommunity deems them useful with your corrections applied I hope someone els=
e picks them up in the future.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks again,</div><div dir=3D"auto">--</div><div dir=3D"auto">Manos=
 Pitsidianakis, Virtualization Engineer at Linaro</div><div dir=3D"auto"><b=
r></div></div>

--000000000000403b33061b2dedcf--

