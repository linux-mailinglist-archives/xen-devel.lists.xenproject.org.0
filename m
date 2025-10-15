Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09025BDEE17
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 16:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143686.1477344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v922P-0007Hn-FJ; Wed, 15 Oct 2025 13:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143686.1477344; Wed, 15 Oct 2025 13:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v922P-0007FH-BR; Wed, 15 Oct 2025 13:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1143686;
 Wed, 15 Oct 2025 13:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/G8=4Y=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v922N-0007F9-HK
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:59:31 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e27a80-a9cf-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 15:59:27 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so1009064f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 06:59:27 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb48a5bf9sm296482385e9.18.2025.10.15.06.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 06:59:26 -0700 (PDT)
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
X-Inumbo-ID: 29e27a80-a9cf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760536767; x=1761141567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+PH4y+eNkhJTovtzOPF/QYMMSJRUYgu/2RfpagRYjw=;
        b=BQ5UUM9OolI1Ez+844ny5YRa0OdlbQ9Gwsg4bMVx7ILcetJp5IdBJpWa8F24H0Pw78
         UR3IXdlLOYdLR+ZmBQhCCLCQ0RVLMOheDW5AMkUuFGf6cyqbNyFSYHnKUG1o/NagMkqw
         h6IX74NMiGlJadoZFrTRSYIoKbfRISdjL7r5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760536767; x=1761141567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+PH4y+eNkhJTovtzOPF/QYMMSJRUYgu/2RfpagRYjw=;
        b=TMpqIEbUH/gmBqEQnBOFSQLI2hAKuuFqSRBLTIfSP2WqV+FeVuSat12RLKUA1xKyfd
         VktJMyeX19UDYKvOQE8GAuX1xlqXCzTeqM4e8K1ttK385Q7XdT5+AozG1Q7HmV09qylP
         LpfZQA5C/yC5NO04E9ZODijLXMCDEJ74ZfzlXW1s/zec68xzF7KCbnZ1MNSyYxwyCnx+
         p+zomxdIhIKegCBXiCefDS3eV0ZDY0/Euu/dkJwLxw/l+2Yyix1LD+tzEq6y2vyDsj4X
         1THmrJBOUE+r7BWOM0fXzn3t5vu9wE7pOIF3barki4bDrAKOm+RYjQR0IxEjRUn0KiSQ
         dFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5z6i1LBIbNB9/jWMNhKz91ZVFlwgWSUSjf2X+4BBA+gYNvIboExJN4v8+1V3BZnGjAKaRtbAmVpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyBgdtn9Bw492hXde3hfQDkpiIC+jQdGrhvDg9+mQRcp6Z48s0
	NFpSvUAKk8cJ8n6xveNG1wOSL9fLq/Jdk0l2NrNXF3iHJ87kA2B9kJN+TA3zw/JC2H0=
X-Gm-Gg: ASbGncuzYkvujum0wUAN4GmuaBOv0+lQz6ZYtWyNlnUPQsMXghZuq9TXtmpWAK0S8Nn
	MgbJAXGJ3sryaSh+PC7mJQ8ZIqmKHFMr5Q3Yvav9FZOE8uPsLRQlT2o2+BHTdxkAdAR/euOYl8e
	ZgqFtJVe+03jnUIsFWF7koNVvuPYQ33wAha2axJban4jWC/74np5fRCvXyhSSZbVwNgcMXcguS3
	h+qcVGx6teQkzgCB+mExu9WjapvKBwVqFHbPTgs+frOkCdmPC6bOM29l6IEgS7lODA1JuP6BSej
	B9kLFF0mzjHlPYqvmEPakOSRpR6MxSSu/P7jUb3LHmcIFwzq5L8ABxspdwq0PQtUqWD1mCG3jd5
	Vkz/Xj3jGby9NxDZQBQqkrnpnE9hYxsS7qu04vuIMjltZ/+Nkq1R1sMK1Qv9U6x4//3I86vcrc0
	qNm1c01FXw9I0mVA==
X-Google-Smtp-Source: AGHT+IEa8wdEkKX5ljQcWCELas38Z4iP2U8gKNkbKP2nHgkd8mXDA3mT5sQ+p9IS92TBetz1q8NG8Q==
X-Received: by 2002:a05:6000:607:b0:425:81f8:2d11 with SMTP id ffacd0b85a97d-4266e7df972mr19632521f8f.29.1760536766956;
        Wed, 15 Oct 2025 06:59:26 -0700 (PDT)
Message-ID: <096f8bea-f8aa-46cb-9d05-2d222d517fad@citrix.com>
Date: Wed, 15 Oct 2025 14:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/6] tools/{lib,}xl: fix usage of error return
 from json_tokener_parse_verbose()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251015134043.72316-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/10/2025 2:40 pm, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
> index c76ae9f64a9d..a9e06b06932d 100644
> --- a/tools/libs/light/libxl_json.c
> +++ b/tools/libs/light/libxl_json.c
> @@ -1366,11 +1366,13 @@ libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
>      libxl__json_object *o = NULL;
>  #ifdef USE_LIBJSONC_PARSER
>      json_object *jso;
> -    enum json_tokener_error error;
> +    enum json_tokener_error error = json_tokener_success;

Looking at the options available, I'd suggest initialising to:

    json_tokener_error_parse_unexpected

and dropping the rest of the hunk.  I wouldn't assume that success
cannot be passed here.

~Andrew

>  
>      jso = json_tokener_parse_verbose(s, &error);
>      if (!jso) {
> -        LOG(ERROR, "json-c parse error: %s", json_tokener_error_desc(error));
> +        LOG(ERROR, "json-c parse error: %s",
> +            error != json_tokener_success ? json_tokener_error_desc(error)
> +                                          : "unspecified error");
>          goto out;
>      }
>  #endif


