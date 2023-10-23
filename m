Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1AA7D2CDA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621074.967111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqQs-00017f-Ez; Mon, 23 Oct 2023 08:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621074.967111; Mon, 23 Oct 2023 08:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqQs-000160-BV; Mon, 23 Oct 2023 08:37:06 +0000
Received: by outflank-mailman (input) for mailman id 621074;
 Mon, 23 Oct 2023 08:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1quqQq-00015Q-7X
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:37:04 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57738c33-717f-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 10:37:03 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c51682fddeso45707731fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 01:37:03 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a2e8397000000b002bfddd7f0b8sm1479086ljg.101.2023.10.23.01.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 01:37:02 -0700 (PDT)
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
X-Inumbo-ID: 57738c33-717f-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698050223; x=1698655023; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4D4+zgt9InQRXtbLsqRPASUY4oBFtCcmLlG6qQUF8ag=;
        b=QgxiCpfOqlQY751E4c0yIpQbzxqSlIoYxgRvBHQA4y0P2Je7JraKFUvTQIY5NzYZ3j
         VtgjiMHm1Hcow8rWs/TNMo3T0j+bokXXvqUrQU+CT/eb8dyCtgAVqV+Pswnh4i7Ufq+n
         Sv29i2J82K387G8s+LK/7XIU+5Z4AR5zpETxjHKKpzMZ5t2fMby7OqZnK52KrdXssBQl
         R28ln6YTx+WlimA+j/2HpV6yC2G3KLJmioguWCPskXfO8ebMtQgddL/EHfr5X2wBvt/f
         UvISsBsYpWdtfPdCUQZywmGSeYmdJT3hr47wncrNmsrRQpt71tOhJB18k0qOOwnRZfBW
         vQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698050223; x=1698655023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4D4+zgt9InQRXtbLsqRPASUY4oBFtCcmLlG6qQUF8ag=;
        b=iCqewPCTfkflBn3nf2FNeKG8sY0eiyNsRnQa70LlvceJrCT6LxaqwLlRSdnASlYX60
         ROlQTsyTW6g55+eS+d9v62W2uDvYERbrlyzts88WMc0klCILAIFwP7kLNR/GKyA6vwYi
         dqS8lGUpkJ+w3zvVFQru/3qIx8T31TXfSgTHqTHD8cxrpkHeZUwdtT+NJ+eksVAsp/y3
         80FyWpKJfNoKSdms052/YfOYcu5TqBpaOOaa7Vd2729cuUdPJysCqS2vJeIPItF/y2rF
         LbiIgDRQuOUSZTrdfktSJt+CEMUIs98bvSLVARdSUbhvb9gHyKaxgLTNRY3qroSJsXR2
         tOUQ==
X-Gm-Message-State: AOJu0Yw1T249myVU/oO2jK3crw6xUwydaPHrsmVD/402+PdO/xD5kDKI
	w5zbmcYWiWMAWXml7Q/7z38=
X-Google-Smtp-Source: AGHT+IGb7oJAj6MNb5MqTYDXx+pMulRGLpMEb3AkpnwAU506GF4SpfayXoiYZashxMDjDkbuTnSp7g==
X-Received: by 2002:a2e:9490:0:b0:2c5:985:2484 with SMTP id c16-20020a2e9490000000b002c509852484mr3899042ljh.4.1698050222870;
        Mon, 23 Oct 2023 01:37:02 -0700 (PDT)
Message-ID: <7391626b0d14ba34b1267310619d812f89da172a.camel@gmail.com>
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 JulienGrall <julien@xen.org>
Date: Mon, 23 Oct 2023 11:37:01 +0300
In-Reply-To: <8e9ab120-11a3-40fb-fe3b-165b3b2ef1b3@suse.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
	 <059882ea-3e42-f74d-83e6-2f809d0993cb@suse.com>
	 <ae6b419eac6eaefd65aab36b69e8926032983110.camel@gmail.com>
	 <8e9ab120-11a3-40fb-fe3b-165b3b2ef1b3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-10-20 at 15:53 +0200, Jan Beulich wrote:
> On 20.10.2023 15:52, Oleksii wrote:
> > On Thu, 2023-10-19 at 12:32 +0200, Jan Beulich wrote:
> > > On 08.08.2023 17:14, Oleksii Kurochko wrote:
> > > > Oleksii Kurochko (2):
> > > > =C2=A0 xen/riscv: introduce function for physical offset calculatio=
n
> > > > =C2=A0 xen/riscv: introduce identity mapping
> > >=20
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > Thanks for Ack.
> >=20
> > Should be the patch series re-send with Ack after the end of code
> > freeze?
>=20
> If what was sent still applies, I don't think there's a need.
I pulled staging and rebased the identity mapping patch series. All is
still applied and worked.

~ Oleksii

