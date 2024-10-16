Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5569A077E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819939.1233425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11Mf-0008JX-1E; Wed, 16 Oct 2024 10:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819939.1233425; Wed, 16 Oct 2024 10:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11Me-0008GV-Tb; Wed, 16 Oct 2024 10:34:48 +0000
Received: by outflank-mailman (input) for mailman id 819939;
 Wed, 16 Oct 2024 10:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaV7=RM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t11Mc-0008Fd-Ki
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:34:46 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 427a011d-8baa-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 12:34:44 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0f198d38so508185966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:34:44 -0700 (PDT)
Received: from localhost ([5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a298443aesm166469066b.166.2024.10.16.03.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:34:43 -0700 (PDT)
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
X-Inumbo-ID: 427a011d-8baa-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729074884; x=1729679684; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJrQquUHoWnrPRU1jmSiFO2YF7b7zMs5StMwKmSfiLU=;
        b=efLRmuBPSilT+Zo/brSt3MTl8IOOy9w0w95H0EJR5QsPhiaKPJeQjMkGRHB/nO/m9L
         qhVYffKFGlkbp7DVNCzivoKj/FlLTJtWSjS1FR6mMlAThjS2hrFffaqZ1BTvH3oAQX88
         uU0F7ETPonDmhE/rgUQvD7ywxRxtQi1CFll9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074884; x=1729679684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJrQquUHoWnrPRU1jmSiFO2YF7b7zMs5StMwKmSfiLU=;
        b=nYcNDpARJIPIA5y0CcFywMU/P8swjjUYDXKhSgNRHRQrNP+KqMNEgs+JWKp9b8gTY1
         VfZEM2/NbXzneLIJny3kvDU0//tCLzuuax5VW1gIYri4AmOVDZO12avgN7hhNYJu/1vp
         mvBX9GPZ86Xpa5lmX37ZRGzfySBMubzaQ7S7SoRMso9Di2PUdfeNSBuzs1joFJALee/z
         d0SBzyuTz8+AmN1uo6eP7+4yCmE3WzMIC7Cai2R3Ez9twRLKETMB5VAK/Qc37aUmr8ct
         K4HuU+A8Q3YvQQC9ouA+a3IRomqZ00GAWdoj9565/TJ/cDd2thpbhawtrA34ag5kjYVa
         C+jg==
X-Forwarded-Encrypted: i=1; AJvYcCXQKMydpex37XpnvcnfN5VTTqJEOa3BL7Q4MlmCs1yTGdjPg+NB5rh+w6wpSSUnOWGIdZrIfFA/mQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn0h1FyOOkc2JPDm9o67IZuY46dFgdS63Id47yKC0ABB1deExO
	0wxl85aizWSMwwGMXbbFnSkZhD8Eh6m8cB6ZQ+7J9/2Se9yfkQrVCiuR5DhaboA=
X-Google-Smtp-Source: AGHT+IG+JuWI72bFzgC2HNRWbvQolkptpUoBt7E4u9ddPzUkkZKEedBgz/hoNf4bHzs+41vnAtFOMg==
X-Received: by 2002:a17:907:986:b0:a99:89bd:d84a with SMTP id a640c23a62f3a-a99e3b6db69mr1461505866b.25.1729074884000;
        Wed, 16 Oct 2024 03:34:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 11:34:35 +0100
Message-Id: <D4X5VZZWZJII.271VYW2L8Y0PG@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul/test: drop Xeon Phi S/G prefetch special case
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <a2dae57f-d166-4c99-8edd-11784abdecab@suse.com>
In-Reply-To: <a2dae57f-d166-4c99-8edd-11784abdecab@suse.com>

On Wed Oct 16, 2024 at 8:46 AM BST, Jan Beulich wrote:
> Another leftover from the dropping of Xeon Phi support.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note: I'm deliberately not switching to use of the conditional operator,
> as the form as is resulting now is what we'll want for APX (which is
> where I noticed this small piece of dead logic).
>
> --- a/tools/tests/x86_emulator/evex-disp8.c
> +++ b/tools/tests/x86_emulator/evex-disp8.c
> @@ -911,10 +911,8 @@ static void test_one(const struct test *
>      n =3D test->scale =3D=3D SC_vl ? vsz : esz;
>      if ( !sg )
>          n +=3D vsz;
> -    else if ( !strstr(test->mnemonic, "pf") )
> -        n +=3D esz;
>      else
> -        ++n;
> +        n +=3D esz;

Just making sure. This is leftover from 85191cf32180("x86: drop Xeon Phi
support"), right? Dead code after the removal of the avx512pf group.

If so, that sounds good. But (not having looking at the general logic), how
come we go from ++n to "n +=3D esz". It's all quite cryptic.

> =20
>      for ( ; i < n; ++i )
>           if ( accessed[i] !=3D (sg ? (vsz / esz) >> (test->opc & 1 & !ev=
ex.w)

Cheers,
Alejandro

