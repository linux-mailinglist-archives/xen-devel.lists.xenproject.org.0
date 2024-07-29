Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A393F3A4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766595.1177093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYODP-00024m-IA; Mon, 29 Jul 2024 11:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766595.1177093; Mon, 29 Jul 2024 11:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYODP-00020B-FK; Mon, 29 Jul 2024 11:06:55 +0000
Received: by outflank-mailman (input) for mailman id 766595;
 Mon, 29 Jul 2024 11:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYODO-0001zn-Nu
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:06:54 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9805e2b-4d9a-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 13:06:53 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so4891688e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:06:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590d76sm5658722a12.24.2024.07.29.04.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:06:52 -0700 (PDT)
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
X-Inumbo-ID: a9805e2b-4d9a-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722251213; x=1722856013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jdcyUW8YkGgSGPTmCXDLuGHXhlnx4+qvAzXEI3OMnMk=;
        b=dMEbq7bUtvVF5lhlw/ZsjiL6OYy2YtEL+2ZXmQ3Eswbt8ZoCsOo5a+VA3AzrYTCec2
         7hI3RvnhrnNoS4IKnc/WmfVMBp48iOD0Ul2ZKDMgbT9UlPkah6StVeOJcIv8hTKsq/J3
         MkhLyyeUwWCeztP7rHv+qEVVQhEGwHZW+r1qDwWEw42mUj8FKCzVIw5LATCnuHoFxPQo
         0kcHn9c01ofSMS0KfJ+YLfXgu7erFC3ZIq2+ErXmnpQar6LrSZzGJnd7GIMrEokiRxM5
         kTUrrz5DMOIcJDTJknet2LOLu/YKM2fn62ePoyphSoWLUBKvu1D0WlQ1JNJOwf7QX8DS
         rabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251213; x=1722856013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdcyUW8YkGgSGPTmCXDLuGHXhlnx4+qvAzXEI3OMnMk=;
        b=J2uzzxl2UCzkpuMSRY8bqSkUocu3jZ5NyJWV68ewPuZxzHiZ/6elg8TH/oBTfaOACc
         v0Sl7fsk4WDFdkWLaGCymzSOHBjq3Kxpe4pgpNJmFxNPLsv7XAhk8X64tzxP4bjB8yCm
         HQOZ9GGY2sB1U2EGcJ1ieMYWZoBL6hGFrd7FWSn0Ct+1KsV1Urikzuoa633NkNtn2gbC
         KFNlEe/VPlPJBn/TvtlT5gMfpZxiZPPWqjxVTDv8WyuGsQmTeTOE1nEGtEpKXJppVr/m
         tLJoBDCm9Rdjq8nUF0ovdGHT29XGhj5yD2bta7oUMc3d6mag5HJpcFLk/NtkqxKbDoFZ
         u+tg==
X-Forwarded-Encrypted: i=1; AJvYcCUTBX2fR1Ylkm/wM2p9KFLY4Q7BNqrHnbYkV/oZdi3ZPoBpvyjb5f2yLjNK6W7nUe/HX+055f9dCP8BRuX4lF7g2Sh9gyxXTq41zhVCGiY=
X-Gm-Message-State: AOJu0YxZUY5ERXibXBTjXgG95Y4/CF+YTQQZ3gkw0Hzrq8JjA0LnS1xm
	7sE0DaacON9Uu2mpEtVXDG/Gkyxc2HZtta5VUG1EhJnbiSXKrG0qnw7ihqNJig==
X-Google-Smtp-Source: AGHT+IHvQxFlL3Gm7GgP5OLe7Oc8FqXKxi4KPs0sPlPbXjAAkMRRS+cwG5L+oA/hMi7Pg7wSeBPmdw==
X-Received: by 2002:ac2:48a5:0:b0:52c:f2e0:db23 with SMTP id 2adb3069b0e04-5309b2c2ab8mr4354849e87.40.1722251212908;
        Mon, 29 Jul 2024 04:06:52 -0700 (PDT)
Message-ID: <9a91fed1-64eb-4f52-9134-131c556e9244@suse.com>
Date: Mon, 29 Jul 2024 13:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 6/8] x86/hvm: add defensive statements in
 unreachable program points
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
 <a686f70406c33d689b040af5d4e14878cde8a36c.1722239813.git.federico.serafini@bugseng.com>
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
In-Reply-To: <a686f70406c33d689b040af5d4e14878cde8a36c.1722239813.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 11:00, Federico Serafini wrote:
> As a defensive measure, make sure to signal an error to the caller
> if an unreachable program point is reached.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


