Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142BC8994E5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701090.1095190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rscj2-00059s-Bx; Fri, 05 Apr 2024 06:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701090.1095190; Fri, 05 Apr 2024 06:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rscj2-00058I-8u; Fri, 05 Apr 2024 06:06:56 +0000
Received: by outflank-mailman (input) for mailman id 701090;
 Fri, 05 Apr 2024 06:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rscj0-00058A-CR
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:06:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2dce911-f312-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 08:06:53 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4162e8210b6so2921185e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 23:06:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b004156c501e24sm5129829wms.12.2024.04.04.23.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 23:06:52 -0700 (PDT)
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
X-Inumbo-ID: b2dce911-f312-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712297213; x=1712902013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUg8RonrjMW+d+m7XH+FkJg4NQB3wS/Jf5Y3+gGfsKI=;
        b=QZ/JSnZVXPruINDbtCT781zkbEBySi4nfkXy0AhxvVpbx4ToAyV3iSQnvPBR3EdDRF
         M+hz38o8HIpbcwY5IwI24abYIbJjjzng8UoGXDtj2270tbbNm9wpUsZEkjgHCfbg4RBA
         y2Y94QYWKwyUDft1WZrrhTUUhTPgK89QrIdl4u4YoE0muY1g6whqXJq95Jqy8G7SrWdZ
         a/NWQUTx0aIQQzJhcUcVVQwY1JaQ/anGg9Ba8uT0OgSBXLEbpIHVDz4nr/k/2wYREji6
         w6QTDyUhGW1jKforPMEgttpguWp+rKMp5brb8rR9ThfaUFIXxF+SVjlIbMK0aquPEvQU
         +hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712297213; x=1712902013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUg8RonrjMW+d+m7XH+FkJg4NQB3wS/Jf5Y3+gGfsKI=;
        b=i2G6HpPtyRNgdL89NsLTC5oH5pmD1hjS8lKDpoDcnTDsNGOvJurE1rPUlEbS5q0idW
         9lOLMuR+nJpYFwgBimORf5Znk2/k1FMc2SJ8ftb936fOrABXduHbbxQg7PehI0ooaZfN
         T25jR97HX+O6S2U+Qg6PwjnvrU04AM6DSkXJsW9ZIwEJObcypGnEmSukG7BMZm605TcQ
         cqXBuT9jFOjGaY2ah3qqvhrBytFZ2EhcfF/whzvNrUh3p0+/SkjSytE60MSxIZvHtBVU
         k4QabC9h4p7vxHtsIoxSuaRjU94b3qfBuOqEsGTTQiEfZH4hXy3i/0kmr1Ovj09eKBcl
         tmEg==
X-Forwarded-Encrypted: i=1; AJvYcCUExhI0GQMQ7Dl+PIZLfkqPAlSHCBuptiB5TAZteUV0k5p9d0V1PCoprHwMIcJPYhDmK+WzeeTjvOWkUSdMMte12quzBX8eYXrm+GvM16w=
X-Gm-Message-State: AOJu0YyPtwm+1qw9r71iEtFUkmdXU1AvwAKa6DUUJRItB303SerLfrDP
	1HGdNpScabpL6FFbShleN6xR3sjRQOhtQgNnCTnv3zkSb+JN2dJ8E01ofoAmBA==
X-Google-Smtp-Source: AGHT+IFGY+z2a5K9TX/1f+wtKnWN8x7tKCVO2sqHhnDmVpSRrVpjoBlw/JIS8p4HpuySXHUMqldDXQ==
X-Received: by 2002:a05:600c:3b0f:b0:415:4824:3686 with SMTP id m15-20020a05600c3b0f00b0041548243686mr313645wms.25.1712297212893;
        Thu, 04 Apr 2024 23:06:52 -0700 (PDT)
Message-ID: <f4a9f196-1cc0-46fd-8655-5230bade1a8b@suse.com>
Date: Fri, 5 Apr 2024 08:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automaton/eclair: add deviations for MISRA C:2012
 Rule 13.6
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com>
 <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
 <alpine.DEB.2.22.394.2404041701530.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404041701530.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 02:04, Stefano Stabellini wrote:
> On Thu, 4 Apr 2024, Jan Beulich wrote:
>> Further, according to the discussion on the matter: alternative_call() is
>> quite similar in this regard, just that it uses typeof(). Imo it should be
>> deviated here as well right away, no matter whether Eclair can actually be
>> configured to also check typeof() and alignof().
> 
> On this specific point regarding typeof, I agree but it should be done
> as a separate rule (not 13.6), to make sure it matches the scanner
> results. It looks like the new rule will be called B.MISLEFF. 

Fine with me, as long as things stay together (i.e. in a single commit).

Jan

