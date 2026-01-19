Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F09D3ACC2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 15:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208173.1520412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqZv-00033u-PA; Mon, 19 Jan 2026 14:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208173.1520412; Mon, 19 Jan 2026 14:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqZv-00030J-LJ; Mon, 19 Jan 2026 14:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1208173;
 Mon, 19 Jan 2026 14:50:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhqZu-0002nZ-Tw
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 14:50:02 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2223a6ec-f546-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 15:50:01 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso2431348f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 06:50:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992211dsm23708041f8f.7.2026.01.19.06.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:50:00 -0800 (PST)
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
X-Inumbo-ID: 2223a6ec-f546-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768834201; x=1769439001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S/pRPN4mA6rQjbWVU7QO8eHswIF88XWsdDte4GY6FaQ=;
        b=F2lWB4eYlh54wbyX8ulIlTiAF3dedm8Zw37306c3dG4gC7MP54G36C3mcoaXjUhKgV
         vQUY8Y7wpMPuq9oJOG/FFWgn8BHv+juvG+5/AfGzRum1MVyA396OSNr72EwFmH78O2N0
         CBKjJ1VAmR85i5aguMcA13ygR4vPoqpomTMQzaiDMEotD0F995VOOVLuoxiHbOY8ebFU
         lPhUBsCAO5mq6TF5s5Z359el+fu36it2Qr9j2pfkbowMc0r0E6PjZWH5ECcmrBYbz4Md
         EvTfsryOLbZc8JrGfuhuHyhcNA9wQOfun30Qu7bAVGZcF3FU3wHbDF20tEmdlZRaxgKL
         X03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768834201; x=1769439001;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/pRPN4mA6rQjbWVU7QO8eHswIF88XWsdDte4GY6FaQ=;
        b=nYkeuuDbNQFydPIU5qMphguMWIDmomOILreixdzx00feSclQDPTdbpQjGfze92WC8C
         0TCxUJ3URlBDGYVNoZoAyZC1UMgopxKAYA+7UjqxFT3E87O66D7BaSzviGLcyLEQN8NE
         PkKnNpafBrF1wDGpfIhB9fN/C7FBubhCPtfJmTVlbtAfqHfVG1T7C6lIKnGjx3rb7tyi
         bj7S4dNPQJclB8eZFjlW7IXrXXrbCKYD9YoBed4czowUmRtEbz5ZCAsa0osnaZtNWkWS
         36t/TuguaQVMnqHPFEHZ4ZNtujI6VzMpvrQic3Jr21ly+NKvxM4m5Dr3etXsrqzMLhdw
         Wu1Q==
X-Gm-Message-State: AOJu0YxsjPSjL0z44Mu/0N1//Kd+77tzqqFV6sI/qOLufhibg4NppMaM
	Hcro+Hlu7UtUT9vqz7WiWKWuGw82xx4yudDDDePVI7/NA5hj5khol3JxJqxaoSU0jCPuYtHHLRp
	IdOM=
X-Gm-Gg: AZuq6aIfYjvIRS9ThCZLAZHpxa1U0iCEkqP51vUy+TCnuyt5Iul9CLqVJ2sOhERD/fo
	gJbi6OrJToNegZ11YSeuuzyQzXbhbj6m+7IUzMGOmbo3AmDFkjgBB1P5vttCgknX10S0GxTnjA+
	6k9OfbczL+ln6hO0svgJB23VBJoMk6cnoWkNTxEH4ztmxBBaT9EUEIoPHHprcXG48uYVQ3H6ob7
	UnquFllRGx173UEozPkE11N1j1z2LDIid136ISVA/Pv6CPgl7iXXhFWaEpGN1HeIhZEC3EnV/I4
	JTEKTSNw8qTeJ5+0O3oa8PdymNbDFerTaVPG6KuDXsnU/RShJXQbbkpZ/IpJ1PPsd4E/OLTqw+M
	1h2eRAInBNbbzjZi/eeK0jg1bnAdaicH8YfDxtc0LQNGftgdQlsD6geUcxL1PKkjj5re58+wVCB
	UpTJpK/d+OryakQ3OU7HqK2+Ce9oTBQPLxo63kFSk70K7b6rluna9hAi/h2UyiKGXR7rjR9bnJX
	zM=
X-Received: by 2002:a05:6000:26c7:b0:432:86dd:ef31 with SMTP id ffacd0b85a97d-43569bd46demr16527522f8f.56.1768834201282;
        Mon, 19 Jan 2026 06:50:01 -0800 (PST)
Message-ID: <0e188989-9190-4f3b-9c45-f4e3d460daca@suse.com>
Date: Mon, 19 Jan 2026 15:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] flask: fix gcov build with gcc14+
From: Jan Beulich <jbeulich@suse.com>
To: Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <875df90d-1d3a-416b-a958-3d3a31144f85@suse.com>
Content-Language: en-US
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
In-Reply-To: <875df90d-1d3a-416b-a958-3d3a31144f85@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Daniel,

On 08.01.2026 10:18, Jan Beulich wrote:
> Gcc's "threading" of conditionals can lead to undue warnings, as reported
> in e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116519 (no matter
> that the overall situation is different there). While my gcc15 complains
> ("buf[2] may be used uninitialized in this function") about only two of
> the three instances (not about the one in type_read()), adjust all three
> to be on the safe side.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

any chance of an ack (or otherwise)?

Thanks, Jan

> ---
> While auditing uses of next_entry(), I noticed POLICYDB_VERSION_ROLETRANS
> dependent ones in policydb_read(): How come the 4th slot isn't used at all
> there (not even checked for being e.g. zero, i.e. holding no useful data)?
> Then again other instances can be found where data is read but outright
> ignored.
> 
> --- a/xen/xsm/flask/ss/policydb.c
> +++ b/xen/xsm/flask/ss/policydb.c
> @@ -1271,7 +1271,10 @@ static int cf_check role_read(struct pol
>      if ( ver >= POLICYDB_VERSION_BOUNDARY )
>          rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
>      else
> +    {
>          rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
> +        buf[2] = cpu_to_le32(0); /* gcc14 onwards */
> +    }
>  
>      if ( rc < 0 )
>          goto bad;
> @@ -1342,7 +1345,10 @@ static int cf_check type_read(struct pol
>      if ( ver >= POLICYDB_VERSION_BOUNDARY )
>          rc = next_entry(buf, fp, sizeof(buf[0]) * 4);
>      else
> +    {
>          rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
> +        buf[3] = cpu_to_le32(0); /* gcc14 onwards */
> +    }
>  
>      if ( rc < 0 )
>          goto bad;
> @@ -1436,7 +1442,10 @@ static int cf_check user_read(struct pol
>      if ( ver >= POLICYDB_VERSION_BOUNDARY )
>          rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
>      else
> +    {
>          rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
> +        buf[2] = cpu_to_le32(0); /* gcc14 onwards */
> +    }
>  
>      if ( rc < 0 )
>          goto bad;


