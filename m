Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB4D7C5599
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 15:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615515.956800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqZRJ-00032m-9C; Wed, 11 Oct 2023 13:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615515.956800; Wed, 11 Oct 2023 13:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqZRJ-000300-5u; Wed, 11 Oct 2023 13:39:53 +0000
Received: by outflank-mailman (input) for mailman id 615515;
 Wed, 11 Oct 2023 13:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH0+=FZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqZRH-0002qx-FS
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 13:39:51 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a701973a-683b-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 15:39:51 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so8361933e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 06:39:51 -0700 (PDT)
Received: from [0.0.0.0] ([2001:41d0:8:52b7::])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a0ce30d000000b0063d038df3f3sm5695728qvl.52.2023.10.11.06.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 06:39:50 -0700 (PDT)
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
X-Inumbo-ID: a701973a-683b-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697031590; x=1697636390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfpurETULtVfAqI3559s+GjLE0vHRUSyFH46jt1MhRI=;
        b=Ijrm2pBURsdoFQwMg0ocVKNkrh/uegWektu5OodmTDw8RB8GQpw3W8TdPP4jFrusyA
         8bE/44sFr3e2tamSd7XYOp5GH8l44Tz6h0GbgjZoUH3rULP/UqU/Jo84Lbzgm1BjRJWN
         XvSUXI+pRG5z1JcEPXUFgXB4AD9x4W7nOlmsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697031590; x=1697636390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfpurETULtVfAqI3559s+GjLE0vHRUSyFH46jt1MhRI=;
        b=kd8oo14mwBFVfW2PkCeXqK5DzdnqsImvFLol4jgpAeM+B2TJl8VaolnwHNiZmAI68b
         CYos7TyVOtFnDC3XdqFDelM9g54RCblpUGa4mblYn0d3Bl73aKZ39VmDVAmSSmb8R2mU
         ApuRez7hAs43JM8esYqFBkID+w0A4LlXf7LQsY+Jd9ywICg0t4ql5paccvCkx/wuAA2S
         RBb3T4LWVdenWD8pMVPRStsdSbgSEzOKrExXn5zzk0mSeiRUOsfQThFA9Z6Gjp7iE4E3
         c+UnFxA9ijKw4AeFveNgxKdmtIsq2Zl5iB/uLXzNjvL77GR4uWXtNWgOdoAZAiSsrId8
         m8Gw==
X-Gm-Message-State: AOJu0YyQANKCkNmLTCs05NtDFD9pY1+jfcPHDFlTXlDBrNw/RJhskV6k
	aBmMNh03E8MkfCt0GA7mtIwOiw==
X-Google-Smtp-Source: AGHT+IFMAWLAI/5SaZKd+Suf83SeLDl5rliwWddpYWgNR2jrG4tY91i5+rLbgIa9/ZUI0qlolHUxTg==
X-Received: by 2002:a19:6705:0:b0:503:eae:4896 with SMTP id b5-20020a196705000000b005030eae4896mr16183278lfc.39.1697031590714;
        Wed, 11 Oct 2023 06:39:50 -0700 (PDT)
Message-ID: <d5507808-fb01-43b8-9393-ba287fcbb240@citrix.com>
Date: Wed, 11 Oct 2023 21:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] tools/pygrub: Fix pygrub's --entry flag for
 python3
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231011122520.1826-1-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231011122520.1826-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2023 8:25 pm, Alejandro Vallejo wrote:
> string.atoi() has been deprecated since Python 2.0, has a big scary warning
> in the python2.7 docs and is absent from python3 altogether. int() does the
> same thing and is compatible with both.
>
> See https://docs.python.org/2/library/string.html#string.atoi:
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/pygrub/src/pygrub | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
> index dcdfc04ff0..541e562327 100755
> --- a/tools/pygrub/src/pygrub
> +++ b/tools/pygrub/src/pygrub
> @@ -731,7 +731,7 @@ class Grub:
>  def get_entry_idx(cf, entry):
>      # first, see if the given entry is numeric
>      try:
> -        idx = string.atoi(entry)
> +        idx = int(entry)
>          return idx
>      except ValueError:
>          pass

CC Henry for 4.18.  This was discovered late in the XSA-443 work and is
one small extra bit of Python3 work.

Thanks,

~Andrew

