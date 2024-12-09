Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034189E9B6C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851652.1265695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgTf-00031e-IK; Mon, 09 Dec 2024 16:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851652.1265695; Mon, 09 Dec 2024 16:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgTf-0002yf-Fa; Mon, 09 Dec 2024 16:19:19 +0000
Received: by outflank-mailman (input) for mailman id 851652;
 Mon, 09 Dec 2024 16:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgTe-0001zq-Cm
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:19:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5633689a-b649-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 17:19:16 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso1298219f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:19:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2166fc21dd6sm99795ad.123.2024.12.09.08.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:19:15 -0800 (PST)
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
X-Inumbo-ID: 5633689a-b649-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733761156; x=1734365956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4KNYZ7a2I2dbgKZ1H8TKiU7KiDZpr7dlCDtIM0BRtjQ=;
        b=Bu3EIIQA4M7h5mkTTI0Mnow4dRg5mdsb7nbFAf37RqshyYflt/s62qx5RPOu5D69YK
         gdA2EH7stBCUcBKBfIooaHl7URrDTt1wtHI7m7dn1AaKInW8S9zy8Z+4xWDs+uDjf0tB
         gvq0CmcC0Ylu2XgSdod2ET+vOcS3ACZWDDSPgXMVLRKtukvP2AEEPBdmHd7jLfWoApdk
         OBYrAgsRAHbP895kyUbdSNzyd1QiFydn9EiZe6T9EusKRumIp08efwNDsbXrdccnCyRw
         AdhBenhmBCeiR6839goqXPGSpxL8Zi1VEcLGp99coXpoG1PzKX0etZl9252Hkoo4iFbP
         X6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761156; x=1734365956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KNYZ7a2I2dbgKZ1H8TKiU7KiDZpr7dlCDtIM0BRtjQ=;
        b=HH01aHdm3zbmOBs6vpGmKbkZ2NWqny9MeGn9VfrKUN+4piXRfA5b8H5aThC4ZXlmgx
         xmYRKUtVVsV7Rw3bMHvkLPAOymSiylpRj7C+8XD4yH862/J0behrBdYjOTMte/mqmMSo
         YWLTzFQaDUPbctPeMDBEBbVQjscT5bla55Lf8k/Py93AK3kFUGwRqtiEF/U7Y239d/Gn
         mQyhkn/PhmicuiChp1SaI2DfJik0ps4SyhuZiINisUkFEjSymm4x+9MrinTkzBhaneGa
         ahwz4l0saFcO1Ok2eJsnJ7e1hMlbC8XlHb39SQEHsdyky1pktMbvwbFAbKnaoSh0tNOa
         Q/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXxv8mOnjBx1NVdikVsmCR1t834Pxrd0UIAYftVBFw+SfFLnaHegxoE19T3o8kN0RIkEpL/2kP6UTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4PurD0vUu2Ae7miwbp1aIyGgpxdSCPSiSZPXNljj/7dHt7Agx
	AKDvOwcwh1HipkioMf8H2+S1H88VchiNGb5v5+BOWxCjlZHqHYd/BSHOSy/ysw==
X-Gm-Gg: ASbGnctrck5KpP5JyVEslYwXX37cpIL/H6kFLjVt8HkqqQFg8imj0EmvGR5/QFQ/jvj
	IEpuDKd8kpZGN00jpSIGTwnLP/vaKuDEEo8EnalQWnjvmOMLfldG6RNLJThVHrg+pylfTLKneWI
	xNN/w6JXm4elS6Il8aN7H5Hckw0yfb9zCyKVZQCbV0styLXQp2dBWy8IenFmb9Zhru+HX9I+7gW
	9oocK3n3HJR6mv9oqLxWP7PvgNqYv+tpt0eF/Y8qgVQEZlxMN/QQ3Md43roIZqiVFu2/PpSBTbn
	bZgWN3iYcvjODa/SowMxv6T/9C/bxGXaeZE=
X-Google-Smtp-Source: AGHT+IGHMC4PKrvmzierTpddzeWgX52jejqoxBwCbjTRX+3W4XaBPR77wH+bO106j33S39p0Cc4pHA==
X-Received: by 2002:a5d:59ab:0:b0:386:3f3e:ab11 with SMTP id ffacd0b85a97d-386453eaaffmr916333f8f.34.1733761156304;
        Mon, 09 Dec 2024 08:19:16 -0800 (PST)
Message-ID: <b3ca2982-3ff2-4712-81cb-10832c100e59@suse.com>
Date: Mon, 9 Dec 2024 17:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] x86/domctl: Map/unmap xsave area in
 arch_get_info_guest()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-8-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-8-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



