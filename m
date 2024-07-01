Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FDB91DA23
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751367.1159299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCa3-0003we-4W; Mon, 01 Jul 2024 08:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751367.1159299; Mon, 01 Jul 2024 08:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCa3-0003uN-20; Mon, 01 Jul 2024 08:40:11 +0000
Received: by outflank-mailman (input) for mailman id 751367;
 Mon, 01 Jul 2024 08:40:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCa2-0003uH-5P
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:40:10 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8561053e-3785-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:40:08 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec50a5e230so26999221fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:40:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708043b7100sm6106809b3a.142.2024.07.01.01.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:40:06 -0700 (PDT)
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
X-Inumbo-ID: 8561053e-3785-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719823207; x=1720428007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T02acu+fGaoZC0noiV85EPLSUSsf1TLhR67ONqWJsMw=;
        b=fdFQ8njRgoT6jGCQyJGKXXmF6mYuQjG/m35zGy7OKjMJXt+O8CLO5kZz7BQ9P80HTW
         p+f9woSoDZ9+7+W8YfMeosooKfWkvoTvmqbcQleUR7uI7HsoPYe2hGHnna29jc5EFsRS
         03lE3pGUxELgjka49ih9Fj2RE0Zv+4BGxU22HynHGZVBSGpzVLOxwPXXCCvqfXjRvtYw
         lHhhRDzJucBznj0sJqc7/n4gsrGW+8zZ7pXUBMMjQFatTHZm/QoeD/GmkbzURVPYLEni
         8ck+5ZfZJh00E3qe9QIHh3bJV8vQoNgMkPZGXLGDs3uSxYSd66DhL+97QqKdTN5MKZ2w
         H7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823207; x=1720428007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T02acu+fGaoZC0noiV85EPLSUSsf1TLhR67ONqWJsMw=;
        b=rcCp1Uh/TZqb6RQQcg6LtoH2qw+lcSQA4+fjpkIbLHPFbtsZHJqhG9d87/19tBLuZ5
         3+pebKVLpkmdHoJ5EwdMariwLs7Lr1GpfRx1fRlq/nmDHftvVnFiXcEwRTXH9KDeJaYA
         LktEt1QMp6mPOjxrfKNLi0vjGThuCHbc5cWWfD6NSBl06+sCtpodkMR4QcbBzA46Tkcf
         23z4yHQAfsfLyx5gnZK49I1vmEQrwV6usINnUQqTRqStcwLq0O/GtturWky1WRlnZIoE
         0bOKU3ZrJ1SYVeTYaWwc9dlLF7Tn4CeN5xGQfgkd/aHqTYXhI3LMawENo+bag14p6X05
         5Biw==
X-Forwarded-Encrypted: i=1; AJvYcCUdhym/Z21CAKyAwTfPL18dfdR9BeaZX/XAgUE4kjAyTr6tDKc4omm4WcPV9XYFXPsPUeK2a62qRyy5n5rR+5KYwAdUmbzVBZfphx3ABHg=
X-Gm-Message-State: AOJu0YzHq0eerT3+gtwbEvQO5WSN0pGjiVX2V87W3rVcnY0hN/TB8CX/
	AavDy/adEmSQl8NA4rSAPj7/DeYmyvBcP4CnpYr5ybS5bpxAD1F0HOMtpOF+4g==
X-Google-Smtp-Source: AGHT+IHj4SyNwMPatOYxONxiSH4xMYA0AxL9VGX8nw14dBHz8ab6fUc4d7hDZ5E9xiHWhl6ZUzEmeQ==
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ee5e6bc6f7mr38313781fa.41.1719823207503;
        Mon, 01 Jul 2024 01:40:07 -0700 (PDT)
Message-ID: <ab694645-1c38-43a6-8f4e-1c7a8470b0e7@suse.com>
Date: Mon, 1 Jul 2024 10:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 04/12] x86/vpmu: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <b42004216d547e24f6537450a1c98176a821f704.1719383180.git.federico.serafini@bugseng.com>
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
In-Reply-To: <b42004216d547e24f6537450a1c98176a821f704.1719383180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 11:27, Federico Serafini wrote:
> Add missing break statements to address violations of MISRA C Rule
> 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



