Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31C93ACDF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 08:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763777.1174101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVxW-0007Yd-Rj; Wed, 24 Jul 2024 06:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763777.1174101; Wed, 24 Jul 2024 06:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVxW-0007WQ-OF; Wed, 24 Jul 2024 06:58:46 +0000
Received: by outflank-mailman (input) for mailman id 763777;
 Wed, 24 Jul 2024 06:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWVxV-0007VT-9F
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 06:58:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29fb2941-498a-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 08:58:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so142200266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 23:58:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa49cc729sm97668366b.90.2024.07.23.23.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 23:58:42 -0700 (PDT)
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
X-Inumbo-ID: 29fb2941-498a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721804322; x=1722409122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lgopAtM9TO4VTu1/8JIsoOM9ZJVxIuu3eLuvKuFSkNI=;
        b=I4BLEUnRhV+stZXU7guoaHCXxaMBNChiftVwxr9NJbUrz6KO9DZuOjFbLKURf+wALV
         CzcXBQp43AKDBgpSeVl8rYHZ0TxFe8n8AKuYN/5m3tBn2PC5cjpSwxm5WIQFkSg217sN
         ogl+3v+WetjbVrwhg9lJBZT2jxEJ9K9UOYRfodem9eQ4yxdYn+s6LXsLjRnbbm13QpEy
         qoe84Usl4mk6IoC2K7pqd0oGC4tAIWIYFuX5hRyLSXMTBFUDJuofjaS6GVTULo8UmYW8
         VCRwWuGjuIMS+YuFIv2K5oXOAjzqpzFoFjnQoKvaYoevvdn18GrJ+9cU8krxDbZh8dZm
         7U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721804322; x=1722409122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgopAtM9TO4VTu1/8JIsoOM9ZJVxIuu3eLuvKuFSkNI=;
        b=t+P0Qzqs/Nc95B2q7GyML4D+5u20XsITjtRfaFBL2mMxOp6KFyPPVe9VW0AgwiPNvK
         0buJIV8Z7wSdqS5DXHuJ98UKaUnoYwfvWIWYu1DSxcMV9NnshG5MLbpjhkep7Vl48vq7
         RFCWHMwPt98Oggn7cYo1inctCCJ/BsryupMHuF+zILzUEjmL707yoqTw+SPUG4mRUTMn
         iY2o/7dqTWylwa1NWGBZdT67fUgYGSZiHbKtiexby0Q8+6TRIk7CTaALQ7Ud2p/IIsKe
         4EKrEIU33WivupcnRNQo824uQLTAfJWcwVRuFpFHDwmZ5DjZv7iyOk9PwB6y2/GxTQIu
         UzZg==
X-Gm-Message-State: AOJu0YzQsWtua07fMDrC0qPkS+M3iIhw6LIRjW4qFSP5aPSE9NrDykOG
	Ci+uZK/8DG16TzuRwOy4c7yLqGKeQYBSKaHblyvRPPNIOCY4J5NfZXBXv0XW8w==
X-Google-Smtp-Source: AGHT+IEEj0JZYDEWLb8XvsIdUJbcViHecK891TEjACPvTLMlg72DhDYXuCVAIlm+A0Amw9qFn9vNOQ==
X-Received: by 2002:a17:906:2dd5:b0:a7a:9d70:82b9 with SMTP id a640c23a62f3a-a7ab0e809bdmr59834366b.17.1721804322509;
        Tue, 23 Jul 2024 23:58:42 -0700 (PDT)
Message-ID: <4758a806-712f-4ec2-97e8-a31b493b2c31@suse.com>
Date: Wed, 24 Jul 2024 08:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tools/libxs: Fix SIGPIPE handling issues
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2024 18:48, Andrew Cooper wrote:
> While the purpose of this series is patch 6, it has a side effect of reducing
> the number of system calls substantally.
> 
> Using a strace of test-xenstore as an example, we go from this:
> 
>   rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, 8) = 0
>   write(3, "\v\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", 16) = 16
>   write(3, "xenstore-test/502673/a\0", 23) = 23
>   write(3, "a", 1)                        = 1
>   read(3, "\v\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0", 16) = 16
>   read(3, "OK\0", 3)                      = 3
>   rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, NULL, 8) = 0
> 
> down to this:
> 
>   sendmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\v\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", iov_len=16}, {iov_base="xenstore-test/504021/a\0", iov_len=23}, {iov_base="a", iov_len=1}], msg_iovlen=3, msg_controllen=0, msg_flags=0}, MSG_NOSIGNAL) = 40
>   read(3, "\v\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0", 16) = 16
>   read(3, "OK\0", 3)                      = 3
> 
> 
> I.e., it removes 2x rt_sigaction(), and turns all write()'s into a single
> writev() or sendmsg().
> 
> 
> Reads are a little more problematic to deal with.  Xenstored will produce a
> full package basically in one go, but libxenstore's reading is horrbly
> complicated by virtue of it being completely different depending on whether
> xs_watch() has created a secondary read thread or not.
> 
> Andrew Cooper (6):
>   tools/libxs: Fix length check in xs_talkv()
>   tools/libxs: Rework xs_talkv() to take xsd_sockmsg within the iovec
>   tools/libxs: Rationalise the definition of struct xs_handle
>   tools/libxs: Track whether we're using a socket or file
>   tools/libxs: Use writev()/sendmsg() instead of write()
>   tools/libxs: Stop playing with SIGPIPE

The title of the entire series containing "Fix" vs there being no single
Fixes: tag throughout, afaics, leave unclear to me whether any or all of
this work wants/needs backporting. Please clarify.

Jan

