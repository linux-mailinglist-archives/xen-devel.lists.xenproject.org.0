Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E19E968F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851341.1265428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdkc-00030z-BG; Mon, 09 Dec 2024 13:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851341.1265428; Mon, 09 Dec 2024 13:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdkc-0002yY-8e; Mon, 09 Dec 2024 13:24:38 +0000
Received: by outflank-mailman (input) for mailman id 851341;
 Mon, 09 Dec 2024 13:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKdkb-0002yS-AZ
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:24:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeb2fd38-b630-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 14:24:35 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a2033562so41825035e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:24:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2efc4230217sm1120711a91.8.2024.12.09.05.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 05:24:34 -0800 (PST)
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
X-Inumbo-ID: eeb2fd38-b630-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733750675; x=1734355475; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UabuauDlkqNJkT3tmMjByYaQcBGgy3Zfs3x9N9+um9I=;
        b=UInkd5euMqbGHyrstPcSiHaEw0MxvM/EfHj4YjA03BmrGDQ6cGAevrjC5Mg4QB6+AC
         yS0q145T0uxOyuVr4eWZUuboeQxDTaz/YBFYgmaRSz6AF8L2s/UKV/U50ZrT9IaqgqRT
         XzqAyomJ6Aw4aaQbw+RKIdoaiaTiqppp5ZYD/kajbw5mQxg1pDXE04ei57hAyavn8xGv
         EiBOX+ILq1nkzYz6ycK8r932GR9Vhpz681qfbcw3O9iINyAuJU03wmzD13pI2KsADC8f
         nO/+nNRofHXK+J4KVnLmDjgtv43VfJPvijVEATaG7KfIecx1R04e1SqHNcRql9fGPGzl
         e2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750675; x=1734355475;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UabuauDlkqNJkT3tmMjByYaQcBGgy3Zfs3x9N9+um9I=;
        b=Y+m1BLu3aTE6IQkPUFWgr8paal8NvNQHXJP2LSJhpm/T9XTmnnZ9W8xYoZR4QQCRyv
         a77avfUOMiYycmXYLbkOepsPlI5jsfjWta5tppMSJaW2eicdjSe4dXMLyrpL1xi542T7
         cbDZjW4HY1g1YG3pq/umUkdFMBb1Tt7f/2hV5QI2QB8+OKDvqxNkDlCoUUWCLRbLUFJh
         LZHEf6puQx30UMxVx+OSGzzfAcTm4FyY/PuQlxyD5KSeUjgliQF0Xod4zLnNN+QJYahy
         vydVk7HVjcVx7+kI0Gcqk/v0Csppn23HIyE5xsSo0V3ZwaAupuLHtA9A+NDJZVgT2l0u
         pHyw==
X-Gm-Message-State: AOJu0YzYOuC+ejzzgXrYS7v9Yg30htFv4wynlr1YH1mEKpb5ujwZVzhk
	lvHRSBaVOoa83bXCCOViU2OjEMCPIOA9R1jolu47YgPT/OiFYWyHHsUozmQWzbzdPnNlU6izgqw
	=
X-Gm-Gg: ASbGncuubofkMApwjsRil5+ktMkR9boq/MQrRJfncZYLCqY//3PBJXHnKlM7X+N08Cm
	XlFZi/49noE+LQDBjvwVh+2xShabGw9dH4pHlFd9yU3Ub1nadQdp9UnGJfSXsD7pfXD/kpYtcOV
	zzOdMzvmv5/DTXW9niw3Jw3iOFTBqnFQwNt3k7/xQDqtyT1l9yfF8uWRBIcWOtyEY0yinFHc9MA
	hL8owy0ebTfSxF22KHFzVwxbugWHxrZK0rJWB7/6H9sS1ywcIcjZAz/dgebMnpd0E8UXJz8zYZf
	RTflj6liJs1tVFNIast2SJLvbaDiqJPqeNw=
X-Google-Smtp-Source: AGHT+IGewJsUbgN85FRV9cm8gLBwkQRwj30ksA46/pwbpbAmKTvfnWP5LnoPDBBp/j9xiBeNDpDEpA==
X-Received: by 2002:a05:6000:186b:b0:385:e170:d5b8 with SMTP id ffacd0b85a97d-3862b3ceaf7mr9832232f8f.42.1733750674654;
        Mon, 09 Dec 2024 05:24:34 -0800 (PST)
Message-ID: <40186a29-406e-4380-b5a0-994ed3e77cc4@suse.com>
Date: Mon, 9 Dec 2024 14:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.19.1 and 4.16.7 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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

All,

we're pleased to announce the release of two bug fixing Xen versions.

Xen 4.19.1 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.19
(tag RELEASE-4.19.1) or (eventually) from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.19 stable series to update to this
initial point release.

Xen 4.16.7 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.16
(tag RELEASE-4.16.7) or (eventually) from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.16 stable series to update to this
final point release; the branch is being closed.

Regards, Jan

