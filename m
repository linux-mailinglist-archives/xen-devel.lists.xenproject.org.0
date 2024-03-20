Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1809880C6E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695768.1085832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqnI-0003Hz-DA; Wed, 20 Mar 2024 07:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695768.1085832; Wed, 20 Mar 2024 07:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqnI-0003FH-9X; Wed, 20 Mar 2024 07:55:28 +0000
Received: by outflank-mailman (input) for mailman id 695768;
 Wed, 20 Mar 2024 07:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmqnG-0003FB-PR
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:55:26 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 353f1931-e68f-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 08:55:24 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso10959953e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 00:55:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 my10-20020a1709065a4a00b00a46268fce59sm6974727ejc.165.2024.03.20.00.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:55:24 -0700 (PDT)
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
X-Inumbo-ID: 353f1931-e68f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710921324; x=1711526124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnC7FoDC6JS3mHBc5RDFcwLKNNOSMD1dWsTZHLrcoZ0=;
        b=AhHomp98LynDzlv8N9xer/Hq/NrnDqs2dONJ1F7q6Y1jotAGtoA3+4YgKY16zyuB4b
         pLLmoi8/u1V3OcrDO8dJfivV+id9xMWbd+604G0V72pceMtd1HQjz8eV2PKgmtsxrtXC
         beriPyfJX6E6sbh9wSE9GH/HGr7SCoI03bWp89GDuMjkXDuDtdu97je9A17hJrK85AMZ
         j5IIGQX+3M4tTa5TjZXP8h9IIYyMRxlXQ/vje6Xdja4NIE/V0gGtRjyVkt29Oc+FTS0P
         b3m6PZAPKuXSnJ4RAQuKnRTjbWVsWEvQ6NRulb1KPQuz21urWtz6N03XF0Ym09Rilqtx
         jgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710921324; x=1711526124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnC7FoDC6JS3mHBc5RDFcwLKNNOSMD1dWsTZHLrcoZ0=;
        b=tNbxr2JLI1zxH+OKlb4h9TsfWWTVPoPROA8dshAF7yIzWp/vouJqS6y/dOL7Ns/1hH
         ZUwkoATk5rn42Sv7HGKf/g4J/X11h2bl8/Jy0RUJ8tLC1cRJ52EWk3V5h2G3TYMqPDot
         MFC09Gn28F++/+Vcpz3gMo8jQyEERrIwkk8iIDlAUq9jBalphr7lvFE2ZHUoxISOz0Eb
         a1zeempS33oi1TY7qJNKPO53YBLDuHgDNZLA6IA/0zhL2Ky4e2/BKjlAmYF8U7CZF5ur
         140e9awoFmTOb4o+6fsYSmnZulXl1iUI2KvuAyqbwOvlEm6UW5R8eacuCfbEfp1Mxg68
         nYpg==
X-Forwarded-Encrypted: i=1; AJvYcCXFandsltQDSLT0iotXGZmfnk4UGXmnhwCCk4/T4/kmC+5+KO7KT3m1dVZgbSdSSS1wuZ6fXpoqbiW9Bh5bxn2gHRjyDcYuLtiZikEBkEo=
X-Gm-Message-State: AOJu0YySWsPj2/KfdWAq/z9Dg8j7d7+zNvrnPTnBkl7UTKAUWQqsmpIr
	7hvNAYD+SG4DvNmo6xo0ufmfwamwf0caiREXoEmEWwqT2GGnx3JDyBIxyXVBQwmdEbKijAAS7A8
	=
X-Google-Smtp-Source: AGHT+IFGbZ5KbTk8kfo5oTW2S2PsRAzV+aFOmreCnx2mtnvtMVXbF60bUQvwMkUsPivLOwq0rfHJ7Q==
X-Received: by 2002:a19:3852:0:b0:513:cc7e:9919 with SMTP id d18-20020a193852000000b00513cc7e9919mr9121657lfj.7.1710921324319;
        Wed, 20 Mar 2024 00:55:24 -0700 (PDT)
Message-ID: <fafea1a7-c5f0-4e9f-bf49-3d0e6ad26ffc@suse.com>
Date: Wed, 20 Mar 2024 08:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable to xencommons
Content-Language: en-US
To: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <DU0P192MB1700AD4C3E33FF8F5D6E90F0E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
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
In-Reply-To: <DU0P192MB1700AD4C3E33FF8F5D6E90F0E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 08:48, Rafaël Kooi wrote:
> V2: Now without test emails ending up on the mailing list. And with the
> correct title prefix.
> 
> I noticed that the systemd services referenced the XENCONSOLED_ARGS
> variable, but it was missing from xencommons.
> I actually ran into this when experimenting with a Qubes patch where I
> thought I needed to modify this variable. It turned out to not be the
> case, but I figure it's good to include this for sake of completeness.
> 
> Rafaël Kooi (1):
>   tools: init scripts: Add missing XENCONSOLED_ARGS variable
> 
>  tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Two further remarks: Patch series want to have the patches sent "in reply to"
the cover letter, such that the whole thing appears as a single mail thread.
For singular patches, generally no cover letter is required (thus avoiding
the question of threading).

Jan

