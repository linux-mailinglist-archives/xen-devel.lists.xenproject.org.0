Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1458D058E
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730838.1136083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBc1k-0002ce-8b; Mon, 27 May 2024 15:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730838.1136083; Mon, 27 May 2024 15:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBc1k-0002aA-5w; Mon, 27 May 2024 15:12:44 +0000
Received: by outflank-mailman (input) for mailman id 730838;
 Mon, 27 May 2024 15:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBc1i-00026J-KM
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:12:42 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90263c40-1c3b-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 17:12:41 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e724bc46c4so90426741fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:12:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579c2026406sm3047825a12.37.2024.05.27.08.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:12:41 -0700 (PDT)
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
X-Inumbo-ID: 90263c40-1c3b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716822761; x=1717427561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7Jh/8RdqOL74XKYE/SJmV4ggngj0/VZwa7qcHlFTbw=;
        b=gRldI3ufelrr55TEE4cxVerhxnlAFa0dOrX9HaDNM3ZNFcIYBlQou8ymC+oQQphMSH
         Tco3gje52AfwSWn2NXAhyEPr69Td1I6dXnzta0i20tRhfhyJfv4KBKggVw/AznKN03og
         Oi3i8m75AExPjZY3fLBToCA6ACqra/1BZCy6zALhLCq3ozQbtCQXH59jR3O+66McTL/I
         Dc2VheYtmLkFHEqmCy1yenuis/ylPpesOV/Z5z1dMn/VVWh+BLBTzUqlHCYt5fJauny3
         rmtD+y1u4qz7icQKSRNkHKmfsFv2D8139xsqQkkd4V79xnKeRkedEFd53BWtwFlywDD/
         Znww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716822761; x=1717427561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7Jh/8RdqOL74XKYE/SJmV4ggngj0/VZwa7qcHlFTbw=;
        b=rwH9W+6d7oIkjVPYkLxKe1KijDSrpQwihTdLTB39m3X+yiVKRZSGzPfyOEZ+hUJAmx
         Qzg7wcmDuw/hKb8lA6+Uepw2iJT1vZsQmsiYcwVh9+CxN85i0I+Do24SzRHsLnOODaKl
         IVneGhK5Kyfq2KGd7qXyeeRKBaDeuTsEh3EaBJFL+bCb/fK64teNbh7SIsf3m6FP+Z4C
         BkMec9wwfmxy9Adw1zhpWNVU9hH9l9pA+RuznAZ6mJ9Ypk+WeTaJ7Z0dN2HNETdLleZe
         uajo/wKYOcM4kp/FgAI3hQJfSFJyAp4GTetcjIPPDcFjPGBGxQK50qFukmtYpCkBBNVt
         +x+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVc3DS3nyBikrDS0BlAfa6LaiRveM480nQabMabofjmmGJIfXqw5josVs1BB15p5UjgpaKpy8kkiaAmVuYOh2T3zLW0mvUbwitthavlVcM=
X-Gm-Message-State: AOJu0YzbVMiXz/lmAw2FM099aZ4mcw6qv3BaoPRPPjtcQzbPzFm4JWNp
	1L3UTm28l9Iya+P5KSMrlduqIoKTGQLaEHJjwQL6go1VGy+5LWRGnpi6WUZYng==
X-Google-Smtp-Source: AGHT+IGc+OVBxYrQlplVJwO4XOrS+Wk+NMzdMI/oNmtoW1i03lV/kEhbp83lB93lobjbNu2VZ39jbg==
X-Received: by 2002:a2e:a265:0:b0:2e6:f4c1:31e5 with SMTP id 38308e7fff4ca-2e95b209930mr61950551fa.23.1716822761469;
        Mon, 27 May 2024 08:12:41 -0700 (PDT)
Message-ID: <b2aa5bc0-8566-40f2-88b9-523b9b8fef3f@suse.com>
Date: Mon, 27 May 2024 17:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] docs/misra: exclude gdbsx from MISRA compliance
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
 <83d89e6fa141bb91d7716cf33f086edf9a6d7ae1.1716814609.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <83d89e6fa141bb91d7716cf33f086edf9a6d7ae1.1716814609.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 16:53, Nicola Vetrini wrote:
> These files are used when debugging Xen, and are not meant to comply
> with MISRA rules at the moment.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



