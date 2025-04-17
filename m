Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A612A9174C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 11:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957228.1350394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LDO-0007jp-KP; Thu, 17 Apr 2025 09:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957228.1350394; Thu, 17 Apr 2025 09:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LDO-0007iG-HK; Thu, 17 Apr 2025 09:07:22 +0000
Received: by outflank-mailman (input) for mailman id 957228;
 Thu, 17 Apr 2025 09:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5LDN-0007i6-4D
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 09:07:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dfe9fe0-1b6b-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 11:07:20 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so12230595e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 02:07:20 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440609c94fesm28565515e9.40.2025.04.17.02.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 02:07:18 -0700 (PDT)
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
X-Inumbo-ID: 5dfe9fe0-1b6b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744880840; x=1745485640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xs1K+a1qqRMKOXmuqpHg+jKUFOxcfarBKMr7TQqs48=;
        b=q7oY2+ihRSaEBDJii64ds/nb1bpbVsaLDFfPVfeNi7P5VvFbhcU6iCn9VTElXBWXQY
         3Ajd4pJKz/k/HzscAbzORW3zXK2S/7IAnWVp/czMZR2Q7ML6lyashK57ijtaohOhSNH+
         HSs/KLIfVgihGpi+8Mptn2lRyChbHUrsUmtM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880840; x=1745485640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Xs1K+a1qqRMKOXmuqpHg+jKUFOxcfarBKMr7TQqs48=;
        b=cTRPDljevPbPmsJm7b3yImL+9iOTENi6vugyYZdMCCV1w03DUIuKPQsAciaoOpyGjV
         fw1v71z4YHi73EXgW3AnwbumemI/w5+EkCw1oB34VC9prnWr9R6Do7knrAGQEYCfFGUT
         OfEVBaebJnySEIZ6WbK/uwgoevn+eMZMILuA/9W21nfOM5/rifUVMyNpejxgpiMDCI+g
         MW3bOpyY4zJjRkvUzUe0jOSBaYTT5nWJkqIg2kVDcyNCS4CXtEfEg4Mu9jjmSYpg2iI9
         zdNrcEtyZwHTz86BqPJ6wWK5pzpVJWuzUV6cafE85TrM5I7ZB1lKBRpHuKbE2+AkqVXf
         V3rg==
X-Forwarded-Encrypted: i=1; AJvYcCXk8ZzrIVeLeLEU/LU7VzkzKjGeWFjASJjThd7tLyICwmJG9QMb863epFbC2fekwLH4rdl7Gi4E464=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj6FtTF4u/JI+lKMiSiAF7Jsgr7B12xMDze8cGQBo193qGTJlu
	7RbYukjxX+Cjc+zmnKoYrz09izp3Tl9XjH9kulK80JAkil7WIzMFw9q0JNEJWUg=
X-Gm-Gg: ASbGncs2/IrXi/hBHO+TusNZFJ3B8BzjB1IhVX/2BDUNnC1HHBWw13z/mc767gZIKj9
	WizE6z5PtmN/9JWcuw/fHYXgEJElBmFcMxX5VOO2GiG3TLpqMPYijejdd48jL5ijZXLPeC6HDSI
	McJhTsmwt/OmYT4brYAVF1KvtStNC+EkcfW7RfVrV+RjVKMTnARnMoDYurLgmNKdnFtqFhUz63c
	j0knNa+2x7t0RRnFycpqp0W+BOjlsCGhLxMfpSwQMKz1ufC4DFogJHyWHyKHfLC5CzeRgAqodVi
	VASFeJdSgqgTbNF7tk2TB01xK29+MLA+KrUnt6UONw7SfoyMVsnelz38lOlKfwmU5KXoDiMqanL
	o3CyuzQ==
X-Google-Smtp-Source: AGHT+IHHHI1jK0OcpCsNP8z3KjGyw9TE4kJaeE13cIZVYaFyCq/nWl3pV21tJU0xwI9K7VzHTrgNKw==
X-Received: by 2002:a05:600c:3505:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-44063674350mr13259215e9.5.1744880839624;
        Thu, 17 Apr 2025 02:07:19 -0700 (PDT)
Message-ID: <82f7ddcd-3f9a-4bbf-9c65-4ad90259c321@citrix.com>
Date: Thu, 17 Apr 2025 10:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: also clip repetition count for STOS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Fabian Specht <f.specht@tum.de>, Manuel Andreas <manuel.andreas@tum.de>
References: <ebf8e47a-8cad-4ee6-9bea-61c8201364de@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ebf8e47a-8cad-4ee6-9bea-61c8201364de@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 10:05 am, Jan Beulich wrote:
> Like MOVS, INS, and OUTS, STOS also has a special purpose hook, where
> the hook function may legitimately have the same expectation as to the
> request not straddling address space start/end.
>
> Fixes: 5dfe4aa4eeb6 ("x86_emulate: Do not request emulation of REP instructions beyond the")
> Reported-by: Fabian Specht <f.specht@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

