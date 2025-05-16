Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2DABA68A
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987746.1372992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4Ov-0000o4-CE; Fri, 16 May 2025 23:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987746.1372992; Fri, 16 May 2025 23:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4Ov-0000lf-9W; Fri, 16 May 2025 23:23:37 +0000
Received: by outflank-mailman (input) for mailman id 987746;
 Fri, 16 May 2025 23:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG4Ou-0000lN-7w
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:23:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a9e27b-32ac-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:23:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a0ebf39427so2453305f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 16:23:35 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8896dsm4253699f8f.73.2025.05.16.16.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 16:23:33 -0700 (PDT)
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
X-Inumbo-ID: c9a9e27b-32ac-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747437814; x=1748042614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gs+W4avg9rzloGEWyeULyfi7kt4lquxj3Poh2XAH+qU=;
        b=ndcSkwlza+BkLjPzraksXR5TPxzRI65r7djdQrRGN5gvzjN+uSPFztxp26YEfoG/e1
         oCtS/EfIxP+0VzqxnOYm12IjP/C29U4EIBkaMAnigI5Atf6c1leYsx8yJ2mUREZs2YLT
         sEDRjZzWw1bH2W9nVVaChQwU9o83QdxnjZNOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747437814; x=1748042614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gs+W4avg9rzloGEWyeULyfi7kt4lquxj3Poh2XAH+qU=;
        b=ZLYui1FtlsjlqoFJc44Sqzh9YwmpUGnQZ8jtXgel+2gbtwGfX5Y5qUcCUi78QyPlqC
         YbjeLL/0W0A8yqQnbXvmwXSIPdxzIt6gPBr0eekyDBPDeOS1xJjsZz00ZDyb4kP0tcN4
         zGA74Be78muwKQveu8N+Uy5FRnt2bo0QlQd34QySdXdQDOuEEw/e9XWq13Zcan552bjH
         kykixuJbL40icPLv6umE+CT2SnsVoZTJ77XjxpzmCRSsQLPj26RjcH/zkLgHFM5ULMIG
         nwXptblCUgIaOCkOEHON8GGC6aewWUzbGvaA8om4uLne/HaOgBjb+d1fO7J+HohpLaDN
         zwEw==
X-Forwarded-Encrypted: i=1; AJvYcCXLQzg9ozPqCVRx05j67Y9aX9JIeENeIhAaTM/OowKuLTqhe0lDCpLPuZ0ivMUVWKmvTKvgRQQ5K8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygEEa/hP0MzWZ9M6IQENreidJFFy562tcTPIxRN4Cb14SA0xcY
	68cSv741JkPwqhxg20qrKY7oW0qeGoP6xRb+ADwJn1432QSJzdMKbkzXBBHHIm+FQZU=
X-Gm-Gg: ASbGncv+aQmqFogeL/3hqfZxWV0QFZoYJ6Au8/ZKJq10LFFxR3tYKn0hcPE41DCtyC/
	M5N9TSnljcm9tQH8QpDEDa3/+n7ALS/wZDbr95rgGiB0+etVnU0xDMVtV1vURiiF1eeFmrZ9W06
	ZfEdIaL1YA0WYMowoFBG7Jm/N+PeFflxVc409RF1g3wsxm4IJ2v1nmlDUHgvTfrQno95vP/LoFz
	o79biM9cE4Wtzj9AyslbzXmilwTicMrZH7HhsIOrKKB8N3jHHmkFSwIdda7p9U0xEyeXI76Vtu0
	bbW3eKAZiiGCc+K573xUfePXxlFzCgh0iKrswksj98rxki+cJUll2UPOncstMRb81BJmsiuQKP5
	lgA/JNq1ctzDn8iCY
X-Google-Smtp-Source: AGHT+IF+mUzai3UTwDS9H8t3sz7tnZUqHgkDTGKruOuuwscFaaCgX5DJ64pd1BttB+aDf/1jYScAnA==
X-Received: by 2002:a05:6000:1884:b0:3a3:4bac:1421 with SMTP id ffacd0b85a97d-3a35c825ac2mr5770558f8f.22.1747437814319;
        Fri, 16 May 2025 16:23:34 -0700 (PDT)
Message-ID: <e7b4368b-53e9-48c8-b0e0-8e8e89710540@citrix.com>
Date: Sat, 17 May 2025 00:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/arm: add inclusion guards
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250516232130.835779-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2025 12:21 am, Stefano Stabellini wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
>
> MISRA C Directive 4.10 states that:
> "Precautions shall be taken in order to prevent the contents of a
> header file being included more than once".
>
> Add inclusion guards where missing to address violations of the
> guideline.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

