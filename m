Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C748FB141
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 13:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735372.1141559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESVz-0002Ne-QT; Tue, 04 Jun 2024 11:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735372.1141559; Tue, 04 Jun 2024 11:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESVz-0002KT-NG; Tue, 04 Jun 2024 11:39:43 +0000
Received: by outflank-mailman (input) for mailman id 735372;
 Tue, 04 Jun 2024 11:39:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vDb=NG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sESVy-0002KN-D4
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 11:39:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20abdc14-2267-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 13:39:40 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42120fc8d1dso9192215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jun 2024 04:39:40 -0700 (PDT)
Received: from [172.20.145.106] ([62.28.225.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b85c61dsm151920515e9.28.2024.06.04.04.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 04:39:38 -0700 (PDT)
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
X-Inumbo-ID: 20abdc14-2267-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717501179; x=1718105979; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgtLEos4uAfwwSo2tCVc3OwFikzrORRRSStXJy+JwN0=;
        b=e/b4ZOgERdMVNlydoOjv6iso0ici+A9UEtKrUdVZJ/diLw1gTcv5swwdSrGoCcNTs0
         /WUSsYwcFBEAdLeKYcK0Kmj4+dVlEsxtD+2Zqvu3g0APgYT4u/sasIJLXHx7l/KXvHKR
         9D0aQZu/8YIX+fMdIwF9kDozXd6DCwXZqSrIi1fGg75s+AJoCNo0ip0h/0F3vZy9y5+K
         utgyI6UMGuLRTpqdQOxSYNHE9OOVsWdvkcdS6dzWb19/dLh8DL6OVXoJ5vZmpU9/ujsa
         ceS3nsUkMFbYoWbF9uAOz98+SP8ZNZQwHX+oY2IoUxtcsOE2+QTCD2UVLBbZqT9e5WnL
         HHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717501179; x=1718105979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgtLEos4uAfwwSo2tCVc3OwFikzrORRRSStXJy+JwN0=;
        b=tO64sToBNIUD/jy+D72mTj3ubXAM+gba04xPnQ50uDYOHEkrhhoGtwhSqRnbEKMSlI
         dLJN4X3fce5O9nNZ5M+QW6Wt2mIF/TwBhDj9QshErlcF/tNIfMMb+K02My/KcKqwKQCX
         Ee6WzimrOjs/7EiXR6y8TINdWZbDJ67tnsTGBeF2zWp8mo3D3JU/Ew4IXRmj8ifefjZy
         A1NmhL5Xk93XL+ftxcZ7JLNUEJlSrW5U3VdnVgbXAXrccyolzOaBqGZXO3sUN4KyI+/R
         R5HNLoX9ZdBUD5ZgxKNQDyoEzqeUtYa1D5Di4L5TE/jc+cWXRm/8LfW8KFIrbJvHgwgC
         XSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc1h9j9twj8tBbFCGI7x22kW9rcXN6uAgZNDb2iEMtdMWknekYIoYzGdNr99ttKjLsw/ehASAP3lY5KMeGBR6yn2Hj+PIz6/JBb4p2KD8=
X-Gm-Message-State: AOJu0Yz1XqjNTz5jFUaVnnvDydHRz0ncp9DTtRYRhu3gGkhN659XQb4B
	ySKtwgtVFlEsO1WHKvwsVbqgyhLmIgrmvNSoqakWWi5//mAcuipf
X-Google-Smtp-Source: AGHT+IHy7N9eiJ8xHfY/T/O4qdxVg4oXFj5c+db+yJjT66WYC2oCZQ7trNAZuskip/r+cUbrD+G1wA==
X-Received: by 2002:a05:600c:4e91:b0:421:4fbe:7daf with SMTP id 5b1f17b1804b1-4214fbe7f0bmr11019305e9.11.1717501178921;
        Tue, 04 Jun 2024 04:39:38 -0700 (PDT)
Message-ID: <11c999212a75ea0f043e90128d5321b41a79c305.camel@gmail.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: add more clean MISRA
 guidelines
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com, 
	ayan.kumar.halder@amd.com, consulting@bugseng.com, Simone Ballarin
	 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Tue, 04 Jun 2024 13:39:37 +0200
In-Reply-To: <3af20044d2906a6f873aac1b6dd2b41c5b9e0507.1717269049.git.nicola.vetrini@bugseng.com>
References: 
	<3af20044d2906a6f873aac1b6dd2b41c5b9e0507.1717269049.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Sat, 2024-06-01 at 21:13 +0200, Nicola Vetrini wrote:
> Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they are
> added
> to the list of clean guidelines.
>=20
> Some guidelines listed in the additional clean section for ARM are
> also
> clean on x86, so they can be removed from there.
>=20
> No functional change.
>=20
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> +Cc Oleksii for an opinion on the inclusion for 4.19
>=20
> This is a follow-up to series
> https://lore.kernel.org/xen-devel/cover.1717236930.git.nicola.vetrini@bug=
seng.com/
> and depends on it (otherwise the gitlab MISRA analysis would fail on
> violations of Rule 20.12).
> If it is decided that the dependent series should go in for 4.19,
> then
> my suggestion is to include this as well, to the gating on more
> guidelines.
> ---
I just want to clarify if I understand you correctly. Do you mean taht
the current one patch will be merged without dependent series that
gitlab MISRA analysis would fail? IIUUC then I am not sure that we have
an option to have this patch without the dependent patch series.

~ Oleksii
> =C2=A0automation/eclair_analysis/ECLAIR/tagging.ecl | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl
> b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index a354ff322e03..b829655ca0bc 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -60,6 +60,7 @@ MC3R1.R11.7||
> =C2=A0MC3R1.R11.9||
> =C2=A0MC3R1.R12.5||
> =C2=A0MC3R1.R14.1||
> +MC3R1.R14.4||
> =C2=A0MC3R1.R16.7||
> =C2=A0MC3R1.R17.1||
> =C2=A0MC3R1.R17.3||
> @@ -73,6 +74,7 @@ MC3R1.R20.4||
> =C2=A0MC3R1.R20.6||
> =C2=A0MC3R1.R20.9||
> =C2=A0MC3R1.R20.11||
> +MC3R1.R20.12||
> =C2=A0MC3R1.R20.13||
> =C2=A0MC3R1.R20.14||
> =C2=A0MC3R1.R21.3||
> @@ -105,7 +107,7 @@ if(string_equal(target,"x86_64"),
> =C2=A0)
> =C2=A0
> =C2=A0if(string_equal(target,"arm64"),
> -=C2=A0=C2=A0=C2=A0
> service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R
> 16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||M
> C3R1.R8.6||MC3R1.R9.3"})
> +=C2=A0=C2=A0=C2=A0
> service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3R1.R
> 2.1||MC3R1.R5.3||MC3R1.R7.3"})
> =C2=A0)
> =C2=A0
> =C2=A0-
> reports+=3D{clean:added,"service(clean_guidelines_common||additional_cl
> ean_guidelines)"}


