Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DCAC39D55
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 10:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156609.1485645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwNw-0003EH-AC; Thu, 06 Nov 2025 09:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156609.1485645; Thu, 06 Nov 2025 09:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwNw-0003CL-6x; Thu, 06 Nov 2025 09:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1156609;
 Thu, 06 Nov 2025 09:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGwNv-0003CF-4n
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 09:34:27 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8686eb1-baf3-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 10:34:25 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so1270337a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 01:34:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f8142b9sm1362021a12.12.2025.11.06.01.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 01:34:24 -0800 (PST)
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
X-Inumbo-ID: c8686eb1-baf3-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762421664; x=1763026464; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HRku5kxTqCfdPu2epoIOa9dP21KVQvMo2Ua/2CHnOqo=;
        b=CaFEejlXPG20Yl9DDEhwX/76NhjoaK87u28hUTUv0iZEsegPm7d31daUVjL0JaBRbd
         7mV+z7v3rsrqP9hq7Z5vxBALhp9IUmUQrd6+0r3EJ2OHuToqATRgC9NBE48qJ+CkgbkX
         hG0bDsD/RCDL0BNGLQWXHMT0sr7ZLtDHjXss9d1b9LCwSQNetX3or8h9AjnWS2LOEWH1
         HKmScxhSXH/LvWoH+sCuLOrieZwUl29q+OAjPz2h0qg+OKCM7X5fRDqUzRgOIvIhclkv
         sDyOar6VOdb/c9gsdi39zgITVFphn02fHI4kyC4KQqkLndhw55OZNTCXKV1Zcii7V8/o
         64lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762421664; x=1763026464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRku5kxTqCfdPu2epoIOa9dP21KVQvMo2Ua/2CHnOqo=;
        b=TsxQNNkcCmpveXJQJaEfsvO2lSq7fwK56/3mgH9R7yjknsqwysPmE6tB6eslJMNQ9B
         jsmM+XV68Phz5ijabh9AirCJO+VLQQjGrMrZIzVTipgJrZeOqkbUz2+edFOLAO/xAWJm
         ElkM3JhlDe/vVfK+qJzNrm7f89SN5nOq32M7Cu0we/LxF7gZ+Az8iR6zPknsjlDqArJl
         gCugyCRworxRzLW819lojjTli0ETds3NvXPbNQjyhQGui5jbygCD7K2w/eLO2M9DTKpR
         cOV2tQ1E+XA0T3kJbBtI95WJeD9xo1WRm62xH5pmzXnLpjPwVJlNlCMQyyx6a7SXo8AE
         xXcw==
X-Forwarded-Encrypted: i=1; AJvYcCXtgoo5HQiBVCrT1I3mziOjh/fpv1UhDPP6arHbE5VUg9LtfPaXLHInZZPVRVGRjcInn3g0L2uc+iM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT0hQCPtIB3m3dot1KeCGQQUsQ0cKJFL0yteSMwL7F7uMW/OUJ
	sKy1X/dPd18n6ewtn0TQPufuvlXInZxIkv9WbL0ChjnFnzY7MqbZJatXSsXCw/nR6dKk6ieD9ng
	MdTU=
X-Gm-Gg: ASbGncscJxHoC7k1VL04ix5Hwvdlza2RFSl9yRNaxXa0lwlZNBjixdA8kMCKrGa+AtZ
	rm0n74bKMHv2wuNYDRT7MVGcko1pzByBrlSUBVXW+hL0lZMc0bgOYufQX8opF73goNDoyrEeM9F
	X+s1WBWa0dYAPuE/1TlCqrWbF7CnHNmgz3ZPflHPAoL5le5rD7+5imUC0i0G8vuoOuRZh/WYLm7
	vXpvMGG7J27mjghqCJg4ssSDKPOzMKOfZTBrKAITUvQ7kycj6wU55uzQzjRSuNWCMWYlB14BPSX
	m7VauYFVQdSVpoaSSrs6p8oq+IwxKfSg/BuId2lPfgzEts8v4UGk7GTTLm5xyDhODEnc3vCHxrz
	k1UZI8U70vDEmKwAj5j9oFRUs3zPUGlbODavt5kMWFgXQsebmPISekJWM1UQZe4DpF8smpGgwQH
	N4OK2f4Hix8Y43qDmBk5by4837Cn0uW+HGj1rLyFd03QCmSBmL4nBcsUDd5C9yn6VdQczW3FE=
X-Google-Smtp-Source: AGHT+IFiijEE517eLvAx/jwOXoZmfgDDlbLnTw0CndgxskzvOl4GTDku4xkI8T7lEpSX6ksOQbeF+g==
X-Received: by 2002:a05:6402:1472:b0:63e:7149:5155 with SMTP id 4fb4d7f45d1cf-6410588c724mr5561919a12.2.1762421664604;
        Thu, 06 Nov 2025 01:34:24 -0800 (PST)
Message-ID: <e894c734-90ab-4cbe-af1c-f699c5497b22@suse.com>
Date: Thu, 6 Nov 2025 10:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e53aaf80d9f51a93885b1ff0d2cbb848468f7f08.1761916782.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
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
In-Reply-To: <e53aaf80d9f51a93885b1ff0d2cbb848468f7f08.1761916782.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 14:24, Dmytro Prokopchuk1 wrote:
> These files 'docs/misc/kconfig{,-language}.txt' were deleted, but
> references are still present in Xen. Remove them to clean-up.
> 
> Fixes: 044503f61c95 ("docs: Delete kconfig docs to fix licensing violation")
> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


