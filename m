Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF55AB5375
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 13:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982735.1369071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEnUB-00057H-Qw; Tue, 13 May 2025 11:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982735.1369071; Tue, 13 May 2025 11:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEnUB-000557-Nu; Tue, 13 May 2025 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 982735;
 Tue, 13 May 2025 11:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJrs=X5=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEnUA-000551-5i
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 11:07:46 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e9f7fde-2fea-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 13:07:45 +0200 (CEST)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b239763eeddso3521858a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 04:07:45 -0700 (PDT)
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
X-Inumbo-ID: 7e9f7fde-2fea-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747134463; x=1747739263; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OJRMkSte2lQXICBlz24HAnM77CapoFNdueqwQS1R+k=;
        b=kLlQwF7f2nQ6Xvbp3CdEiMesFOxxFUVuXyg9qUmAyo0xz8wInpIZHkrWDNaq6pHxmF
         zUlVvmsaaco/SQlm3uHuh+Togbsb/L5MtmMJ7gcQ1/vwVSNjqAcnzhxOTawbNud6C/SU
         MFBmp1tdU3SpIhE1BHP889gu7qE5rLdcP7loQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134463; x=1747739263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OJRMkSte2lQXICBlz24HAnM77CapoFNdueqwQS1R+k=;
        b=bJ+6RM2GdcrZQm5ba+MVD0ZV4SfOv4rz3Cv6OxoSWqoGu7Qxlg4scWsbiZhjIQ/34f
         eQP98U7uDq0NeJBN+kQKsQdCrYZzo1gYlJj1VlvQxp4d7U/ktiU+/LVFv83IAQSmuEbF
         vIvyiN2Idc3hrN0I1WcrqKVPK6lKoxFF/EaItksZEZbEYe1ePGytb5+HY0hBbWSD7aNN
         ZdumbALLtM5Q/WL0VVaWaHwvUGi7r81seOaGzEcTZkaYW9qVCtY+n/g2vHJb7ooD0Hs8
         aTX1f3dl/3/R9xAeKpTbCGLLCOHyfXMhn+faSyEybrJ86gW0Dm6gaZgRGs299YCu9HAt
         6IPA==
X-Forwarded-Encrypted: i=1; AJvYcCVooEmzrl+h8pA6lCjm/nlxXxQoMUCUDM5efi9I00bBm4L/52nBe5t3TAmXXgZ0kOJKUKul9EaS+LY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqnczbsHV84tgnbkmcBaX2+gGFRpspB29McgAuSbF75dvus6h3
	cYnNYGxVKSBlrFJPvARmrzDChTAMIk9P8stQ8D8gue7XooLJyHRkmO49tMFzpXkg/v+nmip8Qu9
	CNO1eXfw8RPGigtEd9545bvf1loAWr6y+RqLhBQ==
X-Gm-Gg: ASbGncsf642wyHhFwxYFZZ+ZVywx3GCN9X7tuO/Gxl58lPbJ3eLXRFtFDrNYZ9Bfsc7
	K2dSfMmV53MO8ZdRBXKyJ9uIoZvN99f2lqjbGzn4LZ3yFgBcRzDqQpxYpqhe5qphp+l1ZC8SQzY
	rHxj7RhI0DyNLVjYI1Ot2rFi1eqCRCNtD0lcOyjG7DTw==
X-Google-Smtp-Source: AGHT+IFiEMjFQpPF6YAz2RNXUU9emD9FXRiNlgWuTon7HRmyGT3j3/82Nj17lHUhHtcEb0bWM/rkj473a7Ojx0En4uc=
X-Received: by 2002:a17:902:e84d:b0:22e:62cf:498f with SMTP id
 d9443c01a7336-22fc8e961a1mr264923465ad.38.1747134463477; Tue, 13 May 2025
 04:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com> <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
 <504f0be0-91fd-4847-8fcd-505771674814@suse.com>
In-Reply-To: <504f0be0-91fd-4847-8fcd-505771674814@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 13 May 2025 12:07:31 +0100
X-Gm-Features: AX0GCFtVeRZJFoCVVCSmO8daUXfv5BX_UfOVDjoaMrytCIZRZZMJQOBBV7eDAS8
Message-ID: <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Well, there is an alternative: Require the lockdown argument to be absolu=
tely
> first. (There are further alternatives, but likely less usable.)

Is this your recommendation?

