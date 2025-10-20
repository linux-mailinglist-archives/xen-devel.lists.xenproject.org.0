Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEF2BF0D11
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146181.1478647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo0E-0006CJ-It; Mon, 20 Oct 2025 11:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146181.1478647; Mon, 20 Oct 2025 11:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo0E-0006AZ-Ft; Mon, 20 Oct 2025 11:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1146181;
 Mon, 20 Oct 2025 11:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAo0D-0005zY-VL
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:24:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c92d08a-ada7-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:24:37 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so32962125e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:24:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710e8037aasm116190085e9.2.2025.10.20.04.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:24:36 -0700 (PDT)
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
X-Inumbo-ID: 5c92d08a-ada7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959477; x=1761564277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z7lDet0ueS3QIWpFGzrj7YZUGOkgcoCn65sGx8bPK1U=;
        b=B2KuE+wH07nUylMuWfVghE9pwlK5F84rYMV5ALktfZ6fsP7tv+zgmYqzlqnxAVyQYe
         2/w44obk1YEhI5lW2V5Eq51k8TJaVuOh0Z5rexbeZaNOyFe7z8TjGDdEwtYt33DRB+Wm
         IiU1DUFTeN9NTsJScRBzRBOeMkMPaNzbsF2A2uDxFk3xXk5dgkgbV6+cFNDFE6GMIgCT
         5jSAEPMBCDUyS4MtxCtg+GPLWaTeFqiaNKMIWpWT9kJA8K8R2lA9IiNc8FHBeQynZz4a
         K/VpCzuyMC6QT7oerF1P8oW1d/uDPpqEKDsFvUQlgHdl4epMx3megTRlJE7NOFaXl53e
         1SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959477; x=1761564277;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7lDet0ueS3QIWpFGzrj7YZUGOkgcoCn65sGx8bPK1U=;
        b=iaaqfkULLDPvYsGUen+rRKLvoR6qD6VZPNbcnmSsJ6LGu6T2TOocD6x28/DDoZtzpS
         1WgorQ2+lxMhg78hmuBdgbxRlAetWbnUQw5QHiC+95DiXrVbVVviQz7hIpW0Pc2p9f+x
         aBjAaBU7k2o897RZkCmZiDnv0a29rCT7qp2DJ3j4KMmNsdgdh6pLNheiC/4poa3JHCDB
         A3r6QHALn199t4/244joRtOjCqcMIHe1SkPYvzObZ0KTO+DFI25W11Vb840PqJRm6AHA
         funMXmq8sjXM6YUxcTfcaIPCacnPReFb2DVpeG3rwOtUjxjKD0un1GcVH/1iLLzNKYcf
         uxCA==
X-Gm-Message-State: AOJu0Ywb/FVT5dY8wDcSJf26nW0QyssyGQYJ8l+3/71YOTEdhcyt5ORn
	P5xH1rq4UA4rfx0bN8xCm0mYQLawRH30t6RmS1guDRZ4ExE7hCH6BQmtq18Nx/BZLQOEJG1ekZf
	tIQM=
X-Gm-Gg: ASbGncuieJxXh/00z7i/W81hvnJ0EH/uXllBzaM8SDoQyfrqjU06vTvJZTSROHSdaCd
	ZXJKGtT4tHXxAbJMsK38mInVe0r7XhLhk01hd6j8t37mq6kVTJjqso3u51NvoL+sjttVgO3CCRl
	xfrxq32YzPZ5+Koki3LaVt1Ue4PYZjT+kgFrD+/UMS2DiRDozVZ0iHmaAqEG0B5hr37Ellx/pKO
	XYtfVzBhMudmuBSqJ28MFnX+8KzusNdr7M8xb1oK7/mCzTAJmd2NtrnedV4OShySwAsYB6r207s
	g3IdJ3QlEuKgEvcVf4scmc28/y6XZLiq8ic7YfX6hrPFtrXa7+iiAlSf/6QQqMOAHwu3EtK31X2
	dw054Yq25wwMn3uMDy/SiB7xGCj7oHYU6VNoCq9mZll5TDl+qEjfd2lqzxtaCE3e0HZ0LOxAB6h
	ELyoc1vEyH4SD0U5jeLqjjpakeukbePUuNbbNPNY0IS4lYQ7ggc18JTzHUabZVfKCDjuvpvdU=
X-Google-Smtp-Source: AGHT+IFcAyomxZU7B8r5cZ9r+rLSxn8Y0aspcTwDeY4dt3ZL7oRazLUe6WHmqYagBWC7USPEfa1CSw==
X-Received: by 2002:a05:600c:3b03:b0:46e:42fa:ffce with SMTP id 5b1f17b1804b1-471178747f6mr104142365e9.2.1760959476825;
        Mon, 20 Oct 2025 04:24:36 -0700 (PDT)
Message-ID: <de07fd27-db68-47f1-9baa-c262333366c4@suse.com>
Date: Mon, 20 Oct 2025 13:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 8/9] x86/HPET: don't use hardcoded 0 for "long
 timeout"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <2e140536-6e24-4de7-a5f6-0c0e19951f13@suse.com>
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
In-Reply-To: <2e140536-6e24-4de7-a5f6-0c0e19951f13@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 13:21, Jan Beulich wrote:
> With 32-bit counters, writing 0 means on average half the wrapping period
> until an interrupt would be raised. Yet of course in extreme cases an
> interrupt would be raised almost right away. Write the present counter
> value instead, to make the timeout predicatbly a full wrapping period.
> 
> Fixes: e862b83e8433 ("CPUIDLE: Avoid remnant HPET intr while force hpetbroadcast")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Whereas here I'm sorry: I screwed up and left the 4.21 tag in place.

Jan

