Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1E80E894
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 11:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652907.1019039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzd9-0004vX-DU; Tue, 12 Dec 2023 10:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652907.1019039; Tue, 12 Dec 2023 10:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzd9-0004so-Ar; Tue, 12 Dec 2023 10:04:47 +0000
Received: by outflank-mailman (input) for mailman id 652907;
 Tue, 12 Dec 2023 10:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCzd8-0004si-1l
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 10:04:46 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df3bc1d2-98d5-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 11:04:43 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c517d0de5so4006005e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 02:04:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fj5-20020a05600c0c8500b0040b2976eb02sm16134474wmb.10.2023.12.12.02.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 02:04:43 -0800 (PST)
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
X-Inumbo-ID: df3bc1d2-98d5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702375483; x=1702980283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iIzOjm9ApykVxZkRgQSI/av936JIaW2QggLwYdtFEDc=;
        b=ScFSQxmDODNPqA2u5jbumsyKtTTygpjmm5iXTzBHMUXkQ4uqns1IV32nQDOTHLG73x
         5iNdH4p6Bb40cxVscalv5tgP3q7QmmSrTUpjZV8n2E5BHe/xWvEq71SRoYUYANXv2V0Y
         LWq5eFIIJBkfSjR2oNfJbskKLJH8BDxeH++oyEOKPUzTxGeDhlJziWOycmb8K01o0HsC
         3th44uD4HhnzOMJP36CYxlQeCGLITLbLTaVu8SLSBKWvkyS6bSXNKDWRGZ4vYh/1H6PI
         aBC4Uc3zH5Ae7O75QqHGdBEblDwOwRDtZs5KqOVH2wfOrAjNB/OPKbSnxbVBwnmjB7Iv
         khWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375483; x=1702980283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIzOjm9ApykVxZkRgQSI/av936JIaW2QggLwYdtFEDc=;
        b=U1S21OyK5fa0fHGDkPjwq5pR5NXGRve8JCPyXy5DrxF2m5fvAureGGXhQ002/2v130
         gQ1BPNkaZHz9uLFJ/unma2aszneZzxOXYs6gyeDzQHlIGPnsYuV3KSCBgpo1dAahz7Wu
         tJR0vtE/Z1UOpnHmhJ4dCbW2SqDUNrH+BCY7qbjGgsFbv97ry3qkcmRE81oeoK2/GsRb
         pAkl9HaW6yadaY/bgquJR2IznjF2nf7mpEhBdecSxdNs2p/Q9rqt6kHpFoXDzg6rASLq
         wpNoFifQTRfxy/LWV0xObu8ZTrumgzUqVPTSAYLdvJRA90kEzGUTdw/SkB1DNJweAsZ4
         YkuA==
X-Gm-Message-State: AOJu0YzEu8x0IZHo3YdgJy8sbUWqJa7F5iuY0bXQdYS0DV+jQH97cKu6
	8o5uIA7DAiVTgHTXIuSFoTHQ
X-Google-Smtp-Source: AGHT+IF5coiw+z+7qlWtI9EUwFsYbvAiBmfx86Dj35gpmpp3GYZ8SYjanguUwcsSlKV0Xqh46RIUmQ==
X-Received: by 2002:a05:600c:331b:b0:40b:5e59:da79 with SMTP id q27-20020a05600c331b00b0040b5e59da79mr3067338wmp.140.1702375483245;
        Tue, 12 Dec 2023 02:04:43 -0800 (PST)
Message-ID: <1d05baf2-e262-4151-b5a3-308f0ffa1e97@suse.com>
Date: Tue, 12 Dec 2023 11:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] x86/xstate: move BUILD_BUG_ON to address MISRA
 C:2012 Rule 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 11:30, Nicola Vetrini wrote:
> The string literal inside the expansion of BUILD_BUG_ON is considered
> unreachable code; however, such statement can be moved earlier
> with no functional change.

First: Why is this deemed dead code in its present position, but okay when
moved? Second: While moving is indeed no functional change (really
BUILD_BUG_ON() can be moved about anywhere, for not producing any code in
the final binary), it removes the connection between it and the respective
asm() (where %z would have been nice to use).

Jan

