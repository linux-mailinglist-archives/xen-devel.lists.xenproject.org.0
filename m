Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B99ABDD26
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990835.1374757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHO2b-0008H4-LT; Tue, 20 May 2025 14:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990835.1374757; Tue, 20 May 2025 14:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHO2b-0008FP-Ib; Tue, 20 May 2025 14:34:01 +0000
Received: by outflank-mailman (input) for mailman id 990835;
 Tue, 20 May 2025 14:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djEL=YE=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uHO2a-0008FJ-H5
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:34:00 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7671bd44-3587-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:33:58 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-231f6af929eso41442575ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:33:58 -0700 (PDT)
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
X-Inumbo-ID: 7671bd44-3587-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747751636; x=1748356436; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QitXDd875rVowBGx5A/RVuvufVa2CmaSg/+/XeeoSqY=;
        b=Fd8CgE9faPNE0tBoNn85Mg+9CBIOTg/321Cu6Q0eXbDw8CY15e0TvR20CqOiBbLM3+
         F1RO0H9PLeYDrA74xtqkMiwzCg7xLiDiN68nX6RoYDdCqT+0dg1lE8khbFQtwg97n+Vq
         3sYIa5m8fIaq4cJwmryYvML+Bixrikns1FaIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751636; x=1748356436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QitXDd875rVowBGx5A/RVuvufVa2CmaSg/+/XeeoSqY=;
        b=mVhmQMo26MftB4Ljdpfffqjmqfhsd/Ll4bKN2bj8207p/WroqJKDmieqaUt1MN7GBj
         75m9QC99IUzE8tDiBFMBPrSjJUG+//pBf/pqTeb6FFvbJaqPGXV/X0mt58nEFL2JphNP
         GF86C+V8uBKyWSnqCSAALRtCK09O5GB+DrGGJ0Az+ywhwbr9eMkNsuuZUkQO7o7iTeMW
         qQviqrp9pY1f4mMFDKGaTkX+5/cWJW5jSkCY3+0FGFJomfscSayrV8EuvkpHN6t4kbKY
         igaZQozemK2oxW/6MjMiNFxJr5wCc1t6pjIiCbIvU7VGWjKmseUEbAB3FUKDpHsF9coH
         KmVw==
X-Forwarded-Encrypted: i=1; AJvYcCUccP4KUTK4/WdzMfBREvcpSE/CDvVvsjaYW/OT2ZTeRlLq0jQin5VDzjCZzQ7+XmOgyzerUPkYH+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpSKOq7G55tKHpt2kTz+o87i6nEsv2MEQDJXwTef21XENeosCp
	MEU6whPGc6ZH2i4/P6oF2JyQb5G3kenjjR+he8jb84scJVX89vH021p3neEyGmEqpjj4bfVgNmj
	A4wEcHD6EtguGa+hRy99sRPNvDqPfGf+GhCqbV6nj3w==
X-Gm-Gg: ASbGncsUHff5pTwjc4LjJr34OYTTHK9TFT3j0evdscg13qxZQG98GdNM9aV64E6EkJB
	nRCsS0NPNtpnUOviLXz/ob2Ek80RNdDcuZvtaJKLxhMf93ocGdkuJyIOmfwB1hxQFb3gD85c5K3
	zxb10c2rI8ERdepNH8O6arwADJz5HknAo=
X-Google-Smtp-Source: AGHT+IEbMpcXEzAi8BIR9pKqFrhOm+e3uQPvwKTv2Z++644DHk8zGCgDQ79qmsgCZi/L+ku7k8CeedhRsaWYc4AHupU=
X-Received: by 2002:a17:902:cf12:b0:224:2717:7993 with SMTP id
 d9443c01a7336-231d454dcaamr245702275ad.45.1747751636582; Tue, 20 May 2025
 07:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250512195628.1728455-3-kevin.lampis@cloud.com>
 <20250520115716.706100-1-kevin.lampis@cloud.com> <726c5069-2136-403a-910b-de003129b198@suse.com>
In-Reply-To: <726c5069-2136-403a-910b-de003129b198@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 20 May 2025 15:33:44 +0100
X-Gm-Features: AX0GCFtieeZ1z235CWoJnFAeC_11lkAsW6vr2yfXuOPs4dLfgWQPhzjcl8g3R2Q
Message-ID: <CAHaoHxYaEtifpAskWCj28g-aHtGwo0S9JoT8ent4_ZcbJqucZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:23=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> No comments on the patch itself (yet), just a formal remark: I was puzzle=
d
> by having only v2 2/3 and 3/3 in my inbox. Looks like you sent each as
> reply on the v1 sub-threads. Very occasionally for a larger series it may
> be okay to send just a single update that way. Here, however, please re-
> send as a full, standalone v2 series.

Sorry I will do that in future.

