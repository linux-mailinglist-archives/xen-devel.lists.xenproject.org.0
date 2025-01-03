Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA6DA00A9E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 15:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864588.1275800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTimC-0000I0-S5; Fri, 03 Jan 2025 14:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864588.1275800; Fri, 03 Jan 2025 14:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTimC-0000G1-P1; Fri, 03 Jan 2025 14:35:48 +0000
Received: by outflank-mailman (input) for mailman id 864588;
 Fri, 03 Jan 2025 14:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/LDK=T3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTimB-0000Fv-RK
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 14:35:47 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 044d1d15-c9e0-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 15:35:45 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso5656472f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2025 06:35:45 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1cesm40194122f8f.64.2025.01.03.06.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 06:35:44 -0800 (PST)
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
X-Inumbo-ID: 044d1d15-c9e0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735914945; x=1736519745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AESKNlhnzuZs4LmrZTXcE21Egr7lFwXw0Psiio56vM8=;
        b=QqNox/NO/X4+ftmU5J4hkJ3WxfyWFNGhFMBg+kwQkQ9sN7tkxdnuJtFSoV9SQUQ+tu
         J9d4wZtJvh76xFDF698qabmhRyjmOcyOySlIWoq8GZpXvD0dZqX7rYpGF22zf/aqIFdU
         XSfhFXHGfrCKJH5ZjpjPC5VM870K4IU2EvmiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735914945; x=1736519745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AESKNlhnzuZs4LmrZTXcE21Egr7lFwXw0Psiio56vM8=;
        b=L1W12GKzpbjEbUwwbMa5QOSBtY9Qi7yB4Bfv07kLRtuZpjxqH68JdcLoZlWmOHSFGN
         YnmziNyIYO3IsXfZbwqC8ZqmcfjZsd87ogKzog+JJ9bq2VLtH78cx09xZXh9lSMAuVe9
         tsdzOtHPkQb0scFMF/CQHaUuft/87ALgk68+S2phXskF+YkGxDnmDvncZJ3Bk4ReoHav
         0O6AFyyXMILcXK0GIzykpajCYJhdn637LIqaexJ8dxGkqxWUomVs26jBJn8zsirh4y7b
         El2Nhzcvk5IaBpGD1RqkH/fE/FC/5UrULS2CI0sSTi3sEmaxgTzyG+YxptYHFOS4t+PM
         ibjA==
X-Forwarded-Encrypted: i=1; AJvYcCV5oGmx0E/EGlAXxvfBbFGNvb0sVs0fNX9AiyDgiLnQkLNLDD69xwxilEDbaNGik+Nl6K73HOLTSd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQrJA7cLbBWvNSGVOCtMamqYkRtwl1pnf2SvOHyS169LfDd5P6
	L8h7caP9MFOwfgPUP3EXoHKCiXz6kGpq4g9VUM/7iaYxXXp1Kqll5tYBpoHIzsw=
X-Gm-Gg: ASbGncthtXsH7PT+C4DyJlhZdD4J1sWvkwNUM3a2bNARaSLRXEiDWhOCrdkz/I2kOIa
	ML+nOV2wkXzh2cks+ZRw8c6M0vxHTm7yrZ+6pDF9s5lmiDdYGMP9tI5wi2YUTHSVmxMXIuBDVIX
	KC+OxrSArwZPf9cygNMclYrF9DVEbCJXBe7RqrWfvk154XGTdSz2Yfly0Zcnx5rTRWXW/dS6tGk
	4jtd3wugpwHK2G2vMuUm+zVvHohN8AKdx8RtFj8qRs4Dlr/4QHGcwJhdWVB16VdgQ7pkD+1Zc75
	qAoRfA/TyNWTHniZtMwo
X-Google-Smtp-Source: AGHT+IF9qgjnG6Kldw5MGD8jbzpXY7807DEMYQfQW/zRCl3P1sZOw22sEHsiDKxQIvTLPFL8/5lmXQ==
X-Received: by 2002:adf:ab0a:0:b0:38a:50fa:d582 with SMTP id ffacd0b85a97d-38a50faf3cemr14748653f8f.59.1735914944918;
        Fri, 03 Jan 2025 06:35:44 -0800 (PST)
Message-ID: <41b0f409-6bb3-4338-86b5-0d91dc82294e@citrix.com>
Date: Fri, 3 Jan 2025 14:35:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help With Identifying CPUID faulting logic in Xen code
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
References: <944938302.6053932.1735914346495.JavaMail.zimbra@inria.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <944938302.6053932.1735914346495.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/01/2025 2:25 pm, Fonyuy-Asheri Caleb wrote:
> Hello,
>
> I am interested in finding understanding how xen handles CPUID
> faulting and 
> VM exits in general. Please can someone indicate to me the concerned
> files? 
>
> I want to know how xen detects the execution of the CPUID instruction and 
> ensures a guest only gets the features defined in cpuid-autogen.h file 
> depending on the guest type. 
>
> I started looking at the file xen/arch/x86/cpuid.c but don't really
> know which other 
> files to check next.

https://xenbits.xen.org/docs/unstable/features/feature-levelling.html

has a reasonable introduction.  Being nearly a decade old, it's slightly
stale.  AMD now have CPUID Faulting capability too, new in Zen4 CPUs IIRC.

LCAP_faulting specifically is the constant you're looking for, in the
Xen code.

~Andrew

