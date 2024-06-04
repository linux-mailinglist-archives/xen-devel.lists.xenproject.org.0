Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4118FADCA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 10:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735221.1141400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEPl4-0003C8-PD; Tue, 04 Jun 2024 08:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735221.1141400; Tue, 04 Jun 2024 08:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEPl4-00039d-Mc; Tue, 04 Jun 2024 08:43:06 +0000
Received: by outflank-mailman (input) for mailman id 735221;
 Tue, 04 Jun 2024 08:43:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dlb7=NG=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sEPl3-00039X-BY
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 08:43:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74c0d093-224e-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 10:43:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57a7dc13aabso810088a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jun 2024 01:43:03 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be52b5sm7016308a12.49.2024.06.04.01.43.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2024 01:43:02 -0700 (PDT)
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
X-Inumbo-ID: 74c0d093-224e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717490583; x=1718095383; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9Tets7h3NsZMAsapgrVGAo8127mGFlmmAtlnR/KiUg=;
        b=Qbeza96NwH7nhGpY22h/4ntkJzkiMQEvpSh46eybWfVS8RBoRaSnzzNUljRqmOS4RL
         usqKAF83V6j2L+eNHKDfk+w0zOa18y3pXTe5wA9pvhs/kcAxepf5anWz22cipMyOs9l/
         u8fIadXWknoS0fVxwf6hS9o/rzvUlCxxqUdAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717490583; x=1718095383;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9Tets7h3NsZMAsapgrVGAo8127mGFlmmAtlnR/KiUg=;
        b=lJ0CgWc2z6BMoLlLvvIsiyP6o33k91F7UOa2za2B6V6C45napaROm04DgHkcjiy9uI
         pUdbfrVF0A9k3wX2zX29mfwr4M6DEegA0TlRG5EEHwVNKb21z7riSoiRIW1Sp0ohm6oa
         pZolacFuRN2dUg4lWoI3U5H3xdBZHIHEsAZFUg9N6hT2Nl28paGDS9f9ldmJxwiW4L7M
         0Pke+0TIFnTy4OdA6sNNQLR2yTI0NSxHflQ22gnKdoN1qDAYxPvMV4Qi3S7uEq7IQDZk
         n+yzC3uUKZwYiHr01RTDPFCyVbLArn/J+2+TvJP62Y5tVhm1vhlzT00Q9Rzl5qwIQ8Pd
         U+kQ==
X-Gm-Message-State: AOJu0YzrfCxbhoCwe6He2a48vWDYykewpz4OGDes6xdDm4DjMFbIRBaw
	XqXew5iT+ODXlttMC8H+y8P+nd8c3mMIxMYhRnjK775nkBbDhOkrbCCd67Ea8+w=
X-Google-Smtp-Source: AGHT+IG7vFWFEePmBQtNy0TcRKWm61hZ2HhdXLsuZ+EBew5aK50/X3qWBsJ1Mj9PSSO1JvbKGooMiA==
X-Received: by 2002:a50:bb6f:0:b0:57a:4ff8:2f11 with SMTP id 4fb4d7f45d1cf-57a4ff82f64mr5424060a12.5.1717490582831;
        Tue, 04 Jun 2024 01:43:02 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH for-4.19? v5 00/10] x86: Make MAX_ALTP2M configurable
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
Date: Tue, 4 Jun 2024 09:42:51 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CDBC752-7870-4C61-A027-69FBF5854AF4@cloud.com>
References: <cover.1717356829.git.w1benny@gmail.com>
To: =?utf-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 2 Jun 2024, at 21:04, Petr Bene=C5=A1 <w1benny@gmail.com> wrote:
>=20
> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---

Acked-by: Christian Lindig <christian.lindig@cloud.com>


