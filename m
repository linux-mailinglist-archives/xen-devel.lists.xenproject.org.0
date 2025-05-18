Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A2ABB283
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 01:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989412.1373515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGnUD-0005cf-Op; Sun, 18 May 2025 23:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989412.1373515; Sun, 18 May 2025 23:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGnUD-0005ZV-Kn; Sun, 18 May 2025 23:32:05 +0000
Received: by outflank-mailman (input) for mailman id 989412;
 Sun, 18 May 2025 23:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SjJd=YC=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1uGnUC-0005ZP-Aw
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 23:32:04 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c842819-3440-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 01:32:02 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7c546334bdeso337756285a.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 16:32:02 -0700 (PDT)
Received: from smtpclient.apple (216-131-77-234.ord.as62651.net.
 [216.131.77.234]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd468b844bsm487918085a.87.2025.05.18.16.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 16:32:00 -0700 (PDT)
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
X-Inumbo-ID: 4c842819-3440-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747611121; x=1748215921; darn=lists.xenproject.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVouPoVCWIgL3YKIWZAl2pIL0gHViCv3WFsDhQh73eo=;
        b=kaau6G1C0/5kFLLocD8m8ktRbRt2euvIQKHFGetETDl4JaeBKyZPZWXFxx+6EaS9Hs
         fOVIxf57D+cDzmCSURs5XijVaNQcvnWMdTp23v8z8bqpKEUZSUDfM5dQnxhmL1+Csjc5
         u4MTChRHuFTyrqCIiilpuJAjMKaZqbop8cxxpu6KZouQJWi92OC0fboku4Za5K+d9rbh
         VrNeFcAZhbmZvgW44GSlZ4PchzjQr3Mcx3Eek0+CU9pt+M/P5tYxY+KX6NvvrKc541i2
         SO0kwBmh2GaAKdx9cULJkJEwbgYYOpB38ylj4C1+l0K4GUB6AHqnIr8b0qiAGR9p/XXT
         /CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747611121; x=1748215921;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVouPoVCWIgL3YKIWZAl2pIL0gHViCv3WFsDhQh73eo=;
        b=xTI6eg4DmEOEzMn6+Bp0AENnH7UVY0ZR5sbTaJOHb3W70f5zhxXxOJ89/UVe1VAOxy
         KEgHDxvLgba6Lu4svGKQhfbjL5CTiZx3vFQUDPFGVWqBNsvIrUO2iP6ek927iW275wuz
         QiaZp2lTen0k6i9DlH+e9LH+9RlxpTwQC0tElJUR9Ik9PfKx0fag9T/MbmIiEhDXotoT
         i9U9RZICO6ccewOI9cDCZE0PS6S1vNhKPbqo6DLtTTn90v0wWUx2zGt9npCRDoFDY+lF
         i51BLKEReh1OtTdSKUiyvoGaHMcXJ8VVhMyRzsPFZ237s9/vmNFiceml0KNndIADjz5r
         sTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmoLlYgV0zChxX+NCXCWXP5sKVOJpShur9CznD0bIvTXcJ9QqCHzqgXLHdCUMdKM7wZ1LpKb3kzlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxB4oGf9Dd316+ssmYgxFJkdDkuf7pesDU48RXYhcrZqXMOx2N
	VOS15ZepEMPga4qnN4RrepqT6XeBV3olCniOV0OG4eoiz3j9oE+pdE9j
X-Gm-Gg: ASbGnctwh3l+w4Kd8B+Gb6GvKQemTPthXNJrEMyW5rl/EWodajJzEaOd6JIkdZZZ9Bd
	M4EzNw3N6oAATkjg3GNTPJcD8Pwymyub/2IQMecmFJP2ne89EyJKk00whwYKoE0Fal6LB/OLeVb
	jvJ0xCXAf3MIUcWAd6YAvelpTUzla8jykQXO//80eBKXGaaz/Y9FPxTnZ9WoUUl/RskO5VBL5Nu
	qmkuGckQRkb1etwILAUbt9/QlonQVGNLNdslVmqQEk9wfBXvgPvmCWmrtjXtD9szTRu2EZeczRH
	jeULVqziyv+T1QsKg3vPP+tedhZmuIFm+XgwQN/79RNNXXn0X+QMSL621/JIvbwWRciKTzPY4RH
	ok3DJ+QCKG1OftutxhUiykZ23nEdWS/Yp
X-Google-Smtp-Source: AGHT+IEN1+/whpIzxDGTifxx7HEV0Q4r+xbA6FlW2T5q6F11x1tdGppjMi9iLHBf+OspG/yIDKJE1Q==
X-Received: by 2002:a05:620a:454d:b0:7ce:bd76:e36e with SMTP id af79cd13be357-7cebd76e3c6mr280472385a.46.1747611120746;
        Sun, 18 May 2025 16:32:00 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and accessors for TXT registers and heap
Date: Sun, 18 May 2025 19:31:49 -0400
Message-Id: <29FDCB46-CA92-4A30-B96C-3851414902EF@gmail.com>
References: <aCoohV1Ue0NBKmSL@MjU3Nj>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?utf-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 trenchboot-devel@googlegroups.com
In-Reply-To: <aCoohV1Ue0NBKmSL@MjU3Nj>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
X-Mailer: iPad Mail (22F76)

On May 18, 2025, at 2:36=E2=80=AFPM, Sergii Dmytruk <sergii.dmytruk@3mdeb.co=
m> wrote:
>=20
> =EF=BB=BFOn Wed, May 14, 2025 at 03:55:51PM +0100, Andrew Cooper wrote:
>> Please have at least a one-liner introduction to what TXT is.  Is there
>> a stable URL for the TXT spec?  (I can't spot an obvious one, googling
>> around)
>=20
> In addition to a short definition I'll add:
> * https://www.intel.com/content/www/us/en/support/articles/000025873/proce=
ssors.html
> * unversioned link to Software Development Guide
> * link to that unofficial archive (marked as such) mentioned by Krystian

If there's no stable URL for the TXT spec, can we mirror the relevant doc(s)=
 somewhere in the Xen docs tree? A trusted archive of the spec for trusted e=
xecution.

Rich=

