Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA982A9E6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 09:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666015.1036405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqsk-0002pl-Ir; Thu, 11 Jan 2024 08:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666015.1036405; Thu, 11 Jan 2024 08:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqsk-0002oC-Fm; Thu, 11 Jan 2024 08:57:46 +0000
Received: by outflank-mailman (input) for mailman id 666015;
 Thu, 11 Jan 2024 08:57:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqsj-0002o3-Rg
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 08:57:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac8bb0c-b05f-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 09:57:43 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-336c9acec03so4430031f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 00:57:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b00337478efa4fsm632929wro.60.2024.01.11.00.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 00:57:41 -0800 (PST)
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
X-Inumbo-ID: 7ac8bb0c-b05f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704963462; x=1705568262; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEjp0lUxWg0eDA0qewml4+FtoJClOnbeXChKiBoeOOE=;
        b=azuX5KXq8RRbvnCXuwyiZdIqVzdGQOM5gB76AAy6ENFpwAFxjm8A7lcpHBdINy94al
         qyS33v6i1hdQXw/BMEgnMnDKf/2vXHkEZI64Q0QdTxYOLLYCMwS85ls3OEIePybUfLZn
         ysxzdK9AOgJWprGdDbcxMoeJuYoPW8AbQk4X6GbLNfPQaEEVH4CV3EFZhXogUEAdc05r
         UMH9ahMFLzAHAkdJfNO3Zj3BE7SJpkBsLBZjnUG0OkZcrZnrnvLzNjRcYqJdXCy3zD8A
         xF/tyCIUstcOGCKfnGfJbZiZvBH+IFBzPXJmDNbELnb3TpoXleGUfvOhIfN/nazDlU2S
         IaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963462; x=1705568262;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEjp0lUxWg0eDA0qewml4+FtoJClOnbeXChKiBoeOOE=;
        b=lSu3lB22x8+jEbl0IykqDGlVULhYB/psWfXePtkXje6dApCyQfQ6h1GCK6PrEDbFeu
         DUh8K8Cre1B4tnKe3iJMNlDlcU3LqOfBdaz/jnZvrjzI0t/2RtWWYLcFyj2FqRLZ2g4Z
         1OvBjXY60BxXxfQr8qTqe0fYzVEWrEoFhcg8KXlaG461Gc6qT4SxytLgv4ZJyB8dHCc2
         3PD+HM/qELextjwB9E+jMz/H5dqskMt2DYERwau7EOIud08fggK/67UdxCvuOPIcvdQv
         fCIdXQ0w+Kt3m8xSOj3ShY1NSYYaIrp9R1rcKL5wGcTsHQ905kC7eKdA0UxrXsjXR173
         pgQQ==
X-Gm-Message-State: AOJu0YycBxOOsBILoyj0rAC8lq87DepqM2PsMV1M1SVpIFQBV2jdlGWw
	EnESU9dCbwI3DQZ/h7kmYivJk9x4/fBiUZjhrOERPXL+NA==
X-Google-Smtp-Source: AGHT+IHG7IhHxy1+Dw3aMjaT+D4AhEbfTQeMAP/iS7/yZsqDWjMuDsJmfrZSp6ocQ7jisTh36DZkDA==
X-Received: by 2002:adf:e742:0:b0:336:873b:6b21 with SMTP id c2-20020adfe742000000b00336873b6b21mr427264wrn.33.1704963461980;
        Thu, 11 Jan 2024 00:57:41 -0800 (PST)
Message-ID: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
Date: Thu, 11 Jan 2024 09:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/8] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: x86emul: support LKGS
2: x86emul: support CMPccXADD
3: VMX: tertiary execution control infrastructure
4: x86emul+VMX: support {RD,WR}MSRLIST
5: x86: introduce x86_seg_sys
6: x86emul: support USER_MSR instructions
7: x86/cpu-policy: re-arrange no-VMX logic
8: VMX: support USER_MSR

Jan


