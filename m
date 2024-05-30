Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6458D48D6
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 11:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732609.1138609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcL6-0006fg-FB; Thu, 30 May 2024 09:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732609.1138609; Thu, 30 May 2024 09:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcL6-0006cv-CR; Thu, 30 May 2024 09:44:52 +0000
Received: by outflank-mailman (input) for mailman id 732609;
 Thu, 30 May 2024 09:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCcL4-0006co-C9
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 09:44:50 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 415ad686-1e69-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 11:44:49 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7948b50225bso50019085a.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 02:44:49 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd0666fsm544506885a.79.2024.05.30.02.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 02:44:48 -0700 (PDT)
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
X-Inumbo-ID: 415ad686-1e69-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717062288; x=1717667088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PTf+B5WtwnWHAd6RGmeFdfVlo8mS5DXfB1OSZeEIUzE=;
        b=orkPFcVC1KYU797FVh1FoX+zzoOROSlLzBgAHhkpUN1U5Hn2Q/cacZAkuJJ5qCl0k5
         S0FN3E89CF2IIeA2tUKXIBW/WrlpRUFpRZuELIlbtEZWpIVBxRz/9DT4/AJkRokjBlkI
         4Ohh7uj0N1caq9scYGK6ksrSEyUYvycRMX3LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717062288; x=1717667088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTf+B5WtwnWHAd6RGmeFdfVlo8mS5DXfB1OSZeEIUzE=;
        b=ROuDxOtzMXnlaPuU8NYtdedyDV5n1GtIuT1WSI5KXk645HTs6I3AQuBqfNPWdSPvvs
         s1aAutTfUEKMOos28Q7RYn53z5vBWFARXVPpzV/r5D7GXJdJgd2wK1xv7SvUeQKsfYAN
         cCsgEcqbCs3UdbztpoE++XdgAsYf+iOQ0FZc8JcanlPCmpnkQw3Yp7Bvv08dP6Vi/tQ/
         pAZMYMV/zNtptjUlSGD78mD+/PmIMZxmgB21pKWn4ZnQZkAgwmxWApJSrOqM9swlVI7S
         ZXFQ+kEq4jHwdilOgAJt+To+DYOag0xjB3vHGeRUIYuYq2NB8zmTriXx0pVQw7XJeqKr
         +m7w==
X-Forwarded-Encrypted: i=1; AJvYcCWLIfpRIZd4FL3/pv4ugnWViqKmEP28nyAawX08WxxkheiyPmVQqc5oVoHWuO1YtR5I7IW/+uvG0+ziRJB+wL4SwlEkoOWS4ZYdRK+cGtA=
X-Gm-Message-State: AOJu0Yw2PmLbzR/VB1uChoPzN2N3XTUiEgOqD3hRJ4wFlOlSEM0c25VN
	NOAn1cSoaqssdnlSEGuC4SPqy130//5By2EbfHU+I8qYvX46mAOrrK4PiS1MJ4sTcJgeJzxPSy9
	KeZk=
X-Google-Smtp-Source: AGHT+IEy1b/Y7Ab1MtP0QK53j9OkEj9PZXSOZySLWo2g3NjIvDhD9sfSJsddFwzV1uIfLyASjkIzww==
X-Received: by 2002:a05:620a:1088:b0:792:e88e:f7b1 with SMTP id af79cd13be357-794e9e181d9mr151742585a.51.1717062288403;
        Thu, 30 May 2024 02:44:48 -0700 (PDT)
Message-ID: <19e240ca-6606-482c-9c0b-3c0a6c2c4e89@citrix.com>
Date: Thu, 30 May 2024 10:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Clean the policy manipulation path in domain
 creation
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1716992707.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1716992707.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2024 3:30 pm, Alejandro Vallejo wrote:
> Alejandro Vallejo (2):
>   tools/xg: Streamline cpu policy serialise/deserialise calls
>   tools/xg: Clean up xend-style overrides for CPU policies

Oleksii: Please consider for 4.19.

This is internal clean-up to CPUID handling which has been trying (one
way or another) to land for more than 3 years now.

~Andrew

