Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939888D20B7
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731230.1136626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBz2Q-0006Uv-OC; Tue, 28 May 2024 15:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731230.1136626; Tue, 28 May 2024 15:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBz2Q-0006TO-Km; Tue, 28 May 2024 15:46:58 +0000
Received: by outflank-mailman (input) for mailman id 731230;
 Tue, 28 May 2024 15:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfFg=M7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBz2P-0006TD-BZ
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:46:57 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82bc74ab-1d09-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 17:46:55 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45cso1196019a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:46:55 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578523d2507sm7383833a12.40.2024.05.28.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:46:54 -0700 (PDT)
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
X-Inumbo-ID: 82bc74ab-1d09-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716911215; x=1717516015; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=36xqcj3D3x7SY2kxbtaQtK/GYAFT3HqUVPcpqPSdoRw=;
        b=hIFznWZp4TvEiABZ2LHMoFL8XFppZgVNUj9Odv/0iVwZ2cMPFosuectSeLBlEoQHpg
         VilUoyDEb2hzlA/OE8aI8QzzGi7s1A3pF2w38uK14r974pquvqSItgPyGNq907h0JyGr
         /BfFIpfPCYTUCB2/JG3buapt+PW8SpllD71IcyyBGPiyikPQAgL2pEjNJo9CPJ6SJaA+
         jDk8RsaPh5zceTjCKfg2+1CC8i34RrL7y66oEW/h3JAeegORL/K31SiAZFM8o8qqwMH+
         5Sy1IEb0EzmckJUbX9wRCoHWTZjFwUJWbhyFxDOCFL7YB5izMq5INaWEVdmMP4O9b4MS
         emhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716911215; x=1717516015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36xqcj3D3x7SY2kxbtaQtK/GYAFT3HqUVPcpqPSdoRw=;
        b=OND9dom4eJVFIGuZOGqdmTssR2IxjczNEM9lnXhfWnD7Ye66xp57AgJyxjN/v2ky/t
         pVYWJTT2jYA4l9XU1lnYZBoyktd5+0sEvJVgszFYrXl1stG+JCuGGaBFqcajhnErRHZG
         +z3dLq1DR5A3POR+crjx52NnTocKC/zIeTLBu22rfAuSR+RdyXxAhk36+lAX+wF54hOS
         4P053MN4uPRjVSobZfmyNOLvz3zPNiKE/KiKF04eKjgZr56aiIkTDlOrMloKHKZ6BPdA
         NO8lkhHyrbIc2gHG0PCfFvIpcla6qaR6XkotR9VCLR996p1CBRjrX1irmcxMbe/oM/Nu
         lr4w==
X-Forwarded-Encrypted: i=1; AJvYcCXRjoAno2u0+KZqSukFdIXP6OZf6PARzEli+10ZfUbkq8GgiEcX5eSRwZmy2dfNsvGTW8L6FIi4Aof7rVQ8PwBoGUomwhUIpnyzFum6vmQ=
X-Gm-Message-State: AOJu0Yxg3+AIwqodgqp6lJMMyC/VRv5BG0h25beQTIv2QCbgUXcVslyG
	Oc8XtGijFZ+aBZRpNEhLnhdoiuvPIrV64yp8h6hYE6GMM6plOnzI
X-Google-Smtp-Source: AGHT+IHaMaBKbolltDWHTNB/Tsp7JkK2hgDFSv2Zd2C71IoyCoOZQu9FAlZhjZOjzxVXehFiop2Igg==
X-Received: by 2002:a50:9f8f:0:b0:579:d23d:c6d8 with SMTP id 4fb4d7f45d1cf-579d9ff4d77mr3069533a12.18.1716911214996;
        Tue, 28 May 2024 08:46:54 -0700 (PDT)
Message-ID: <8de7d95c331ca5887b42743192bae2351c7c741e.camel@gmail.com>
Subject: Re: [PATCH] x86/svm: Rework VMCB_ACCESSORS() to use a plain type
 name
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Date: Tue, 28 May 2024 17:46:54 +0200
In-Reply-To: <b05a744d-cbc3-4de2-b138-5591c54d01e3@suse.com>
References: <20240528153204.1350919-1-andrew.cooper3@citrix.com>
	 <b05a744d-cbc3-4de2-b138-5591c54d01e3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-28 at 17:37 +0200, Jan Beulich wrote:
> On 28.05.2024 17:32, Andrew Cooper wrote:
> > This avoids having a function call in a typeof() expression.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

