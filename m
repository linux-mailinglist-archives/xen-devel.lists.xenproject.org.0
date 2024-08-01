Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54962944BC7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 14:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769703.1180601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVKE-0000i5-9b; Thu, 01 Aug 2024 12:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769703.1180601; Thu, 01 Aug 2024 12:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVKE-0000fM-6L; Thu, 01 Aug 2024 12:54:34 +0000
Received: by outflank-mailman (input) for mailman id 769703;
 Thu, 01 Aug 2024 12:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZVKB-0000fG-V3
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 12:54:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d75d3a-5005-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 14:54:29 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34431so5335391a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 05:54:29 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b052bsm10047324a12.15.2024.08.01.05.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 05:54:23 -0700 (PDT)
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
X-Inumbo-ID: 30d75d3a-5005-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722516869; x=1723121669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mh8A47PsI4VQmNtBW2mJEQqASpxD2OfMpLLHDUb6OHc=;
        b=fMej53EdujlLDX2x+IIv7Rj5e6n4Dv8LpmqY3HDOcuCtlR+0D+y1jiubY05IpWoAnQ
         pUuCRX439baQ8HAHA5JdPdL/6TU0rujrbnoiSMe7GcM0SMxMMLST6NYRLwZPckEM2BxT
         mj0W1B97LQ7cDsNh1ZimHf7bNPFhHW9/darjfNyC30tKaRh53VS5cHpKa8omAOSXrd4+
         B3wS5CLtTggF94SxwREUjtS9qEB56R20BkNg2lMinXflq98MqBR2WHvKB4Di+Tt/KsoT
         HYXheZtR/yFCIM9jGQfOO1//i7xEBsIFGZJ4y6m37b6+PIKcC/04dZ0bCVZJhbWO+TUW
         5nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516869; x=1723121669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh8A47PsI4VQmNtBW2mJEQqASpxD2OfMpLLHDUb6OHc=;
        b=ZncbTp+Qk1Pm1dycdvgJcrdADbqX1hMr3WEFeawhzuQxR6A9MdZJ/En8uzR1mH4z+c
         5uCoksvDUGMCv3mKVtqJe73cgIuatEEfuYYu9v3T48Q0ivYb+787xJBVfhSlt4OcmVwt
         20BFA23HzcaE8Xkl97fW1qYtlTxT6kgkF/U5K43CqH5DIv9iYb8Z9G2+pTsg3nSpdGf/
         abAtWoZYyePZUM/Tr1MqaBRyfrn9ROM94dwfjPcvWWyd/wINICQKyjtqizLhyAr+4z5+
         H0hxe6+me5UlTBRd1dWWRR8JfrxMrlf0sz86yHDi5BG2XQaseteOpPBrmQHjL8a+N1hl
         IiBA==
X-Forwarded-Encrypted: i=1; AJvYcCWxVh11cT7NNxbceweJq1t7lGjw5bb0qh9ToZ3s/Ug4ShfDqFrvoEV0ZyfUBbjuAio7ggR8MvewQRxY1yyJWV91e7USAejhZpUp4OIh0To=
X-Gm-Message-State: AOJu0YzHUS7Sx+8oqxFvQwWQtQ930TnV34OOBLn4q52ZmIv3pT2fSgk+
	JCwZe8BSHWLINFlvGX61ZUMMgfXiuygzSv/jH5IFLMeF2AP6lMy8WjxSW5sKtx8=
X-Google-Smtp-Source: AGHT+IHZaAB374oAPyz1CEp6XdY3yh7ysO4fEU+puI2Ieja3pSFIzdsGRU3iJaMAiG/ztVcwwm9dRw==
X-Received: by 2002:a05:6402:549:b0:5a2:2b56:e06e with SMTP id 4fb4d7f45d1cf-5b7f56fc8bbmr105681a12.36.1722516864142;
        Thu, 01 Aug 2024 05:54:24 -0700 (PDT)
Message-ID: <5b9486b0-9af9-4032-b117-b345781da9a0@suse.com>
Date: Thu, 1 Aug 2024 14:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] 9pfsd: fix release build with old gcc
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <29b28ab7-a642-429c-80aa-d09d422ba6cc@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <29b28ab7-a642-429c-80aa-d09d422ba6cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.08.24 14:47, Jan Beulich wrote:
> Being able to recognize that "par" is reliably initialized on the 1st
> loop iteration requires not overly old compilers.
> 
> Fixes: 7809132b1a1d ("tools/xen-9pfsd: add 9pfs response generation support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


