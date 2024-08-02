Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA06945811
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770188.1181123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZlqj-0000wj-Tp; Fri, 02 Aug 2024 06:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770188.1181123; Fri, 02 Aug 2024 06:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZlqj-0000tl-Qb; Fri, 02 Aug 2024 06:33:13 +0000
Received: by outflank-mailman (input) for mailman id 770188;
 Fri, 02 Aug 2024 06:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZlqi-0000te-Cx
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:33:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16b5e820-5099-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 08:33:11 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-59f9f59b827so11336485a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 23:33:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83c22db71sm658241a12.94.2024.08.01.23.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 23:33:10 -0700 (PDT)
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
X-Inumbo-ID: 16b5e820-5099-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722580391; x=1723185191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cCH0OmhfowYSiBOTZGUEyukD5vkf0pEdf7IQQQvXU5A=;
        b=RGORpsqV+3t8/O87vu2R0vAnYs4Vlbuqgw7lKKNRzySUAqODRJZ6nRaBN1cqWN/BIU
         dpyJlZ2SGNmuiR6BzPndc4XAP4IW0qcTA+R4p55W03pbhYHCI77UCU1BrUuZLSwsYzB9
         28DXp2LuH07EKynMibz6MUbErxksc5CQBXXsXQbmJQWDpvgkItS+2Id4G8nSFWebbPvx
         ubj2begQOFAO7MPaQomMXQtwdzrBvzoeLLkW2LhfljkF30OqWml+JejIJ+/5WeLeXJgJ
         f9xxsyuDGk4TWZWhHfUoAzDE/4Z6+1pCi7PAszh7P+XjPxtZJ6AWHCZAWiBG8b6gtiVh
         wXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722580391; x=1723185191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCH0OmhfowYSiBOTZGUEyukD5vkf0pEdf7IQQQvXU5A=;
        b=NgDEVFPnztqXbbvHyKarGmqErVtZYRsg3l2mgacH8+giU4Q+Xmwk8+oOtrjoVcIb+f
         psiCyy1b9qJwVdAfJm38PTFS/VV6sPXuBCT8wAGxyEwnGIm0zPK06d8+5ohbg9mSPSK1
         D5mJfV7TOW1erfKmu3Ivs/gX3zphPWHm+ljX2dtiLKIstJyt9tLLsgSBziZJ/xlg3mib
         +Jzhi9QQ3mXJwayBuG63Mn2Im92CYc/iT1B05YIZXGMchIwPItcEXJLGIxNl+uProHK7
         zfuckE6vcFMC/Z/YX9xLQyBKbb+sC9OGkoYGFW34bDiFmf+LYsHpvOKY+bYy8x9sOZ7N
         E2Mg==
X-Gm-Message-State: AOJu0YyrimH60mUTTq/OXna1ZFO2+aThkBOgWtPDWE8G0R4ZEer0TsSn
	8f35n4kMDBb+UaGSoz++A4SiDqT8gxqlueGeCuHSJTC2fmaWtx03X80arubfkkBtgb9zihE1c3o
	=
X-Google-Smtp-Source: AGHT+IGaPOZNWP8vTiJrW8RFlr39QlqHjv5TQ6x2kujomI7n/sdBTXQ30XK1YU2AEnrglB72JLFupQ==
X-Received: by 2002:a05:6402:a50:b0:578:60a6:7c69 with SMTP id 4fb4d7f45d1cf-5b7f5413b46mr1607861a12.30.1722580390719;
        Thu, 01 Aug 2024 23:33:10 -0700 (PDT)
Message-ID: <73902a85-2750-4684-b6f5-33dd67c72172@suse.com>
Date: Fri, 2 Aug 2024 08:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-4.19-testing test] 187097: regressions - FAIL
To: xen-devel@lists.xenproject.org
References: <osstest-187097-mainreport@xen.org>
Content-Language: en-US
Cc: osstest service owner <osstest-admin@xenproject.org>
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
In-Reply-To: <osstest-187097-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 23:38, osstest service owner wrote:
> flight 187097 xen-4.19-testing real [real]
> flight 187112 xen-4.19-testing real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/187097/
> http://logs.test-lab.xenproject.org/osstest/logs/187112/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop       fail REGR. vs. 187044

Hmm, this is now pretty persistent in failing. Yet none of the changes
under test should have affected behavior in any way. Ideas, anyone?

Jan

