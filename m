Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE759916097
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747395.1154790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM19M-00020Q-Kb; Tue, 25 Jun 2024 08:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747395.1154790; Tue, 25 Jun 2024 08:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM19M-0001yN-HQ; Tue, 25 Jun 2024 08:03:36 +0000
Received: by outflank-mailman (input) for mailman id 747395;
 Tue, 25 Jun 2024 08:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM19K-0001yF-Ug
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:03:34 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aa5ece3-32c9-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 10:03:33 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so69783931fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:03:33 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7253195bfbsm198248466b.128.2024.06.25.01.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:03:31 -0700 (PDT)
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
X-Inumbo-ID: 6aa5ece3-32c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719302612; x=1719907412; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UE26bUNQZ4s49DkvPqDFpIp7MAin/t3uFfjZWihoang=;
        b=C1ps1PJm1V6WkWMy9eYD1DyPlazwuHlZX+s7q1i6bUObfSw4ZyA+6xSZ7WpNulKsAx
         ZOdgFkhbTY2GeMMyClzuFQlNoZQzIZu+T4/SEiaxRstckLVsaOY6i20myqCLoLHrdMcr
         IPGtv3Ar5BecxV7fw5f1oUugvaj+OhHEJupjCNJTDH+jZRJvXXgAru21rXyPDjDj8VXP
         ePLtS62i574AIb+2NUiTv9tTbLPOJG3YDGdkx3tVYtcy5XD9/cyCE81vO6UT+Hp7L/jg
         sZ5C3963pHiCk1sABqDf0hHP6kreCiioEdMnS/QX2zKQo6hYxsb9w6BlijH/Vv8pqti2
         qEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302612; x=1719907412;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UE26bUNQZ4s49DkvPqDFpIp7MAin/t3uFfjZWihoang=;
        b=kjWsCIZIZf6PAagpjrGADqrrXZhHxn8Hrc2s5lsBf0dpCqryqqUeYc5VLYNlF30Cb2
         cK9HQlXovkN6TGd0lFKFzgmXmdkrLMJC1YLE8sKrXLhnr7TidRa8wcYP57IEFLpwCAZj
         bhEts7ceIPbz1Y/bjgsfj7wVmixOoBi8/XlU14IP3wdj7qhTyHoyN2DqPmNTWiqDKuak
         4BrrrKtiIVrdmoDg+AGq/BhYsCezIlAvZaYfWM6/HsFiDTpM+cj91chPibyar/eLjC8K
         eaLKGunjndqhjpKyRRXRBMRJqW0/xaARZ9fbw9HE3LIAUvnIV064g/esGOh/yCd4nPN4
         8SUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7Goka8rj5M8fyR4xrnKmHePqg436vQAlcfz15Pc6d7OCVkimVhbJVudj5sXOqIzy88Ecc1XnxkJ3nP0PuPJZX1FURXyQFUlVyyOAlWA=
X-Gm-Message-State: AOJu0Yzd5Jz1W3bXD0Zbn9avDipnF1oaq5QCKav3fNQRV8jW3VVlLV/t
	3GAYB+a+McXQOvcX6I8wvCiQAP3CiecyF8bMbJCcxVZ9E7fsicKc
X-Google-Smtp-Source: AGHT+IHnP/xMOSoM3NjvnelkZbTACYYGW+NscCv+dWQ4fpxHThlQeduxfRxmOQ3o+H2KYx6WQAOa6g==
X-Received: by 2002:a2e:3518:0:b0:2ec:57b4:1c6f with SMTP id 38308e7fff4ca-2ec5b31d1a2mr46079541fa.34.1719302612214;
        Tue, 25 Jun 2024 01:03:32 -0700 (PDT)
Message-ID: <2c15171ad14122ad78df9aef408c6a41fc32e8c9.camel@gmail.com>
Subject: Re: [PATCH for-4.19] xen: re-add type checking to
 {,__}copy_from_guest_offset()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 25 Jun 2024 10:03:31 +0200
In-Reply-To: <83743273-54ba-4f8b-9548-30dbd763887e@citrix.com>
References: <6fc55df2-5d92-4f3f-8eb3-69bd89bfea4e@suse.com>
	 <83743273-54ba-4f8b-9548-30dbd763887e@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 14:20 +0100, Andrew Cooper wrote:
> On 24/06/2024 1:26 pm, Jan Beulich wrote:
> > When re-working them to avoid UB on guest address calculations, I
> > failed
> > to add explicit type checks in exchange for the implicit ones that
> > until
> > then had happened in assignments that were there anyway.
> >=20
> > Fixes: 43d5c5d5f70b ("xen: avoid UB in guest handle arithmetic")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


