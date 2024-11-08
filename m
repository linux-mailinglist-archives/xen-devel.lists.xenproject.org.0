Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE59C1A5C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 11:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832443.1247745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9MAC-00044C-6l; Fri, 08 Nov 2024 10:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832443.1247745; Fri, 08 Nov 2024 10:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9MAC-00041d-43; Fri, 08 Nov 2024 10:24:24 +0000
Received: by outflank-mailman (input) for mailman id 832443;
 Fri, 08 Nov 2024 10:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t9MAA-00041T-NH
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 10:24:22 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d50cd7e-9dbb-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 11:24:19 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so1777717f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 02:24:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e44807sm27077685ad.155.2024.11.08.02.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 02:24:18 -0800 (PST)
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
X-Inumbo-ID: 9d50cd7e-9dbb-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkNTBjZDdlLTlkYmItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDYxNDU5LjgwMDkwMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731061459; x=1731666259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l4zJdsjhnxmsuocdefZBnF/ea3uvn7P7N8euQA9hJp4=;
        b=gWKAptLa+HNjBAVWlFb3PjPeBqwFbgqAQxk6SrbmO1fm2qPdX3txWTMDT7b2epcKr7
         2iFTDR+ro7T4wfRajkLdWPKRCfHh3uWPeWqX1XHO9QW+N+NWpWOCDie/N7Q9C2ZodXze
         NN8Uo+sE1E4OL+dvggXk3xG21XZDCQpV3dCpO6Q1h+H4E9EisHvo4ERdqKe1NtTwyZrz
         Jf2SGEI8W49F0TSCqFNWigviQc+8Crz7W3FVa/X6QodztRyjcOtaMtsulkZM98hnRPzB
         sGmG5BzopnY2S7KmNZrOLh+GBA8SG+6uOUFgDHle9Vmcy3CTu+uZVez+okkdtRrgeIyU
         Ob8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731061459; x=1731666259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4zJdsjhnxmsuocdefZBnF/ea3uvn7P7N8euQA9hJp4=;
        b=OCYhb7XFRVND3P0l1b+Tpxh5ih86LUXgpGbRrZo0mD6pcqX7FBIHtt77JA+6FGku/Q
         Xyp/7is5CBacAIBEEJt5pdNZSaOZYmF+kBOJYgjCfm1KyRPHiRDOgzEFLNJQTh+ljT3G
         +Y8PC74bAGiRXjR2auP+FlHrPEvfV+mRwHedEYmGYdYLV2H4gFBemFYWBhk/Q+9PNTdB
         Lujq4reJDKRGDBY/I9UDVu5TvBky++gr4pqNpGfgjjd8ytkhNjI4v98OOmIk5NTjmFcG
         CD/J6XWKb1H1P+b3jZx/gEwoWl+cnMLqJe6lj6YsO2Xdb2FWLO0ka5nJq27pWn0uXeUk
         9nZw==
X-Forwarded-Encrypted: i=1; AJvYcCUQZ7fZZ08zY0ianJlmazW8cet4m0CfqQNe2+wwmlfJGYYEyZbWq4/0rdH+StfGCSq5Z9i/x8HFF8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZlq6MXbokQ3Z49qHgnfrjpPT/CeWwYWhV8KwueD/nYkGbNXU3
	YiFyJVNaQnZbOr0+ipUM+v5w3BpHFUyZ1MPbqEdvQRzf22dQwB27FRl1+SAn6Q==
X-Google-Smtp-Source: AGHT+IENyWP8tNOlZTUe+IBdLzvNKNz31OyxwxJQpzrB4QN3IW8cZ0dVlHlpyKy42QT5Uk/7yZLTKw==
X-Received: by 2002:a05:6000:2a5:b0:37c:cce8:4acc with SMTP id ffacd0b85a97d-381f0f5dcebmr2352333f8f.13.1731061459081;
        Fri, 08 Nov 2024 02:24:19 -0800 (PST)
Message-ID: <9eb957bb-93a4-4b53-a8bd-20c62b2fe9ff@suse.com>
Date: Fri, 8 Nov 2024 11:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/Kconfig: livepatch-build-tools requires debug
 information
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241108101025.82228-1-roger.pau@citrix.com>
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
In-Reply-To: <20241108101025.82228-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.11.2024 11:10, Roger Pau Monne wrote:
> The tools infrastructure used to build livepatches for Xen
> (livepatch-build-tools) consumes some DWARF debug information present in
> xen-syms to generate a livepatch (see livepatch-build script usage of readelf
> -wi).
> 
> The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
> on release builds, thus providing a default Kconfig selection that's not
> suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
> because it's missing the DWARF debug section.
> 
> Fix by selecting DEBUG_INFO by default if LIVEPATCH is enabled.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Yet I wonder whether this now faces Andrew's opposition.

Jan

