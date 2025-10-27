Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F6C0C8A2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 10:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151467.1482001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDJC6-0005yN-Bt; Mon, 27 Oct 2025 09:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151467.1482001; Mon, 27 Oct 2025 09:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDJC6-0005vd-8M; Mon, 27 Oct 2025 09:07:14 +0000
Received: by outflank-mailman (input) for mailman id 1151467;
 Mon, 27 Oct 2025 09:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDJC4-0005vX-LE
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 09:07:12 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fafdbab-b314-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 10:07:06 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so31971505e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 02:07:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm13502196f8f.44.2025.10.27.02.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 02:07:04 -0700 (PDT)
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
X-Inumbo-ID: 4fafdbab-b314-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761556026; x=1762160826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MXvldelJJBjyzboKFUC2bviJUHAK4JHmQrjcZbjMQ50=;
        b=ZVegaPDcVYQqBMwBxcpnu3M3tomGBoAYkNUDVkL4W/nt6R4ARKH2HGYwWcUtysajpK
         LJVHotfZZJfFVNYBQLQVDzFyScf+IqubHaPWMwkxKQoW7tw9E47ORUMJP1cpHXJY5fau
         fehpWcXOkM9sswbv4cgUUnR0mqKJF9c8TL1jp/rqDzWyMFPx5gbJJ42ZLmZaTT7Wce1F
         686D/uq2GcKzvNscI1Gnlx8m8utUb6GYDaaCQZKe/zZTSbAcq0Wf8LhS8LMadupfQ4sA
         WPImBIiWuqV4Ej9uxj314chpEGE9jBgT+oXmKIWs/88Vs6tQVZa14X7r03anWdDty0+M
         8Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556026; x=1762160826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXvldelJJBjyzboKFUC2bviJUHAK4JHmQrjcZbjMQ50=;
        b=lUMMc3BmMQ0fpjd1ufJ9QHFSgqhCbXXwG/ud+I8HjN+8KES4H5fIdHujme1HqncN9f
         gv5/sppjRrpvoPhE8SoSjsQrobQYN2Zk83BeXYCXS6ma8Z62wbhv7eNSuRbOCtkiFbNs
         7kbbuCL0R0isJSV6bvJ1wbC36cTiueNOwfAre5zXL/1QvRZdpNfEoPrCjcOOSq97DqTg
         QtInFo0tmaLO8Q6VpI1kFA80EsQjGOa6v3KsSKZwLOHaVX/OIML07PFZWKj2DBccJoAm
         SJFh9un56VRYAJbI264I65xf4r7/QaZwIob5JpGgt0tTgm6iRVXJMGK1331/UHHBeC2R
         QS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEu77rvhqwpAKHKITR+4A8fWnM8cS5drR5JHlGE3TxNkt2AbUJ/pdkpdMdDidAxM/Ruv0YY+HLhVA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5JJ3pLq+qQsohOaBjNxESelZsWtDjekxESPxF+hlEUoib1wNY
	musO+e9DIWFdti1eEp3XzByuc5MHraupbB/+GQkh0mNQsWOrFLe38TDPgTvzqul6dQ==
X-Gm-Gg: ASbGncupmbvaVmMNSfW6YyiUKZGRitwrxw0Zx4SM8t1tP7+aTA3k9m8zBoh1RL4HTSL
	RX93XJzwlBd60FrEmnsLQTmwzZCPqbGUXk9QldA4c00X6CwzWsThQhvx2rgCS2XPOxeimjcpWTO
	QudOp2XN7iYTc513xX3mJe8bNz3zxHahXomv533z6Pn6Zu23p3h6lmNsxd1cyewg/XSfckbcpuO
	5WmqV8UpK2Qt/acw4/m/nTlCHxqTW+7bK8RqarO5DhpLONE32E8ChfpYeYAo3YaycuFm8bdoBFU
	+NoBcbd2lpIMZJlzjuLZJdNOnWPzxCLPdk7FowT/lE9zF0exTHKkrUeHFo8IvJ2wdP2GYnvTVHq
	VAPfRVtG2WTxUHggl23M5z6qq4DjSA8z9nkN1ylQomlyQ4dhkGvG+aaIC3QAnbjqX8KrPQ8qEWx
	PXUx/+NXG1qd5E2hsoJw2zo8f2iSc2OGotGfD4TNmreJKPkqMrpiVWjs/RgSJe
X-Google-Smtp-Source: AGHT+IFp2UzDiCyMs2Fw71pzOZmkFi32mx+H0yPYwWfB0F9smPinwPMGf1r/+9qG7T4tyo8CpCQKbg==
X-Received: by 2002:a05:6000:420c:b0:429:8a71:d63 with SMTP id ffacd0b85a97d-4298a711381mr9193419f8f.37.1761556026059;
        Mon, 27 Oct 2025 02:07:06 -0700 (PDT)
Message-ID: <c06a70c8-747d-422a-8fb8-431608631f84@suse.com>
Date: Mon, 27 Oct 2025 10:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21?] xen/pci: prevent infinite loop for faulty
 SR-IOV cards
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <CAHt6W4e1XOoqO-W0O1mEU4UCr_ik=J9bRGQQPeNL3YLQSyV7_w@mail.gmail.com>
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
In-Reply-To: <CAHt6W4e1XOoqO-W0O1mEU4UCr_ik=J9bRGQQPeNL3YLQSyV7_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2025 22:09, Frediano Ziglio wrote:
> If a SR-IOV card presents an I/O space inside a BAR the
> code will continue to loop on the same card.
> This is due to the missing increment of the cycle variable.
> 
> Fixes: a1a6d59862f4 ("pci: split code to size BARs from pci_add_device")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I have to admit though that "faulty" to me suggests more like active misbehavior
than the presenting of a bogus BAR. But maybe that's just me ...

Oleksii, thoughts towards 4.21?

Jan

