Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB4A50499
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902514.1310506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprWX-0000vd-T9; Wed, 05 Mar 2025 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902514.1310506; Wed, 05 Mar 2025 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprWX-0000te-Qa; Wed, 05 Mar 2025 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 902514;
 Wed, 05 Mar 2025 16:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tprWW-0000tY-Lr
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:23:08 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f29d43e-f9de-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 17:23:07 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3bcso8184708f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:23:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6739sm21148300f8f.22.2025.03.05.08.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:23:06 -0800 (PST)
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
X-Inumbo-ID: 1f29d43e-f9de-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741191787; x=1741796587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xmQ2uXwnwCPFL9VcpCV6zl850dSaaYB8tziagdOR39I=;
        b=BTXxYPYg/fL2MubEDZ4hk/WSO/IXLE5PyUQJ4+54nFyQENN+6FstQAbvuii0obeaSg
         ++ovQTPXbg7yMh1QDwV1X/rAxYU/vJSbiTE1reilZBV7xzGz6t5OkhnXLcchPcCFi1/v
         K0vC326fV7Il7bQETW3XMvE6CBS4fqiBFVup6D32WpmjAkAlceuk6v/fNZwXyNj2HYgC
         nxVVazyUHMZ/gOnDhLKXehHvDTGFbOIqB5Rs6N96sB589dRm/igd28zsrMTPmGLYnZvk
         0N24jm15w6EX8BCWf77t+1F/+aiW8mPk1FX94RFyV9BFC03/v75y97y2OCNS9Rw0jF6J
         ibjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191787; x=1741796587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmQ2uXwnwCPFL9VcpCV6zl850dSaaYB8tziagdOR39I=;
        b=u0sEnqK/4j88P3MAqsqfQm//EBWOOTqf9RRS2yaWD5FhsD1EM7W8+L1pC+S5m9r4NX
         BiLxfcwO1cypF2QaonUHed9LUzdZ9GRSUd0peuSXLK6lgfTw2IM+hg/Bm8Zpr6IQKEzq
         0cMs2EIkXH2sxGZmKfgwwE2pY63loUO1L4M93wA8KMy2TQ+/tzxSLv5aeNqPXGFc+8a/
         7J6nLUnmca8RolkfpAKtqRM/IPI5fY4UJ/J2YcVBZVDcgm3vMRbb5rfw5jnPz9MLiqdV
         qXRlCW0apsXOmzuF43MfvpIoCFM0Udiprnw4qT9UDZLzT+1NFJn7jcR99rLahVpG4WSy
         FP0g==
X-Gm-Message-State: AOJu0Yx0nhywIep1Jp7r/Wr1Uy65pet92dbFMvd1D+LcImRsyU0N/17L
	EyT+zIvPeR4gh9Fr2LyrxcDBK8JVS7gF0uMNLBz2iklJ1qLraOcL67bqgiimrA==
X-Gm-Gg: ASbGncvwRz4YzA7lruKgS7h2diQS5SG/w4sz4As8NJoS9DuNJxcpCIGy8yfKvPbLvP3
	3DB9TlHcOxzkO9CJlg8NrPAdG6iVMr2JMKPpJD/2YuVceMI6z5giJJYegl/2IE5u7Agz1JTXoKd
	eE3ofCATYytSQJGJ0+XfSaznkuyn8fT1GliALv+Wk2EROgFHDHBxrrXV31UqBw+aRPGJe18WIt5
	oXkv0I7+W2Neuyj8XTxCwOiZQ3dK0ZSWya11qDOAOv4FTIgu0ody3lECA1dldKPvW2zpcDNPed3
	eRcC70KXobdqttKJ1VwsW55o9tTLNhYNKk/slXcgqpO0pVx+dWTQx1l1TWQhR3QTDV0Y63C7F7I
	WghiuGacQB/uvIQm/cTf9O7XBPgb4/A==
X-Google-Smtp-Source: AGHT+IEwX6p8SNrCRykZMB6Q6caPftDOgljfPyuT4TcGiWhR5gMb7XHHzDIvCLWXty65EuczvVjIhA==
X-Received: by 2002:a5d:6d0e:0:b0:390:e9b5:d69c with SMTP id ffacd0b85a97d-3911f756966mr4003755f8f.25.1741191786870;
        Wed, 05 Mar 2025 08:23:06 -0800 (PST)
Message-ID: <0d298a29-91f6-4e3f-abac-c14fcbfbccf5@suse.com>
Date: Wed, 5 Mar 2025 17:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
 <Z8hkLjMAQfhBR2Cm@macbook.local>
 <5978ed8d-ecef-41f7-adde-bc52312b483c@suse.com>
 <Z8hwTL8bsgjU3fJi@macbook.local>
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
In-Reply-To: <Z8hwTL8bsgjU3fJi@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 16:39, Roger Pau Monné wrote:
> On Wed, Mar 05, 2025 at 04:02:51PM +0100, Jan Beulich wrote:
>> On 05.03.2025 15:48, Roger Pau Monné wrote:
>>> On Tue, Feb 25, 2025 at 12:37:00PM +0100, Jan Beulich wrote:
>>>> __init{const,data}_cf_clobber can have an effect only for pointers
>>>> actually populated in the respective tables. While not the case for SVM
>>>> right now, VMX installs a number of pointers only under certain
>>>> conditions. Hence the respective functions would have their ENDBR purged
>>>> only when those conditions are met. Invoke "pruning" functions after
>>>> having copied the respective tables, for them to install any "missing"
>>>> pointers.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> However I find this filling slightly ugly, and prone to be forgotten
>>> when further hooks are added.
>>
>> Indeed. Luckily, while undesirable, that wouldn't be an outright bug.
>>
>>> Would it make sense to delay enabling of IBT until after alternatives
>>> have been applied, and thus simply not use the cf_clobber attribute on
>>> functions that are patched to not be indirectly called?

Hmm, wait - how would that work? cf_clobber is used on function pointer
tables; any function indirectly callable prior to patching still needs
marking with cf_check, for build-time analysis to not throw errors (with
the specially patched gcc that Andrew prepared with a patch of H.J.'s).

>>> We could still enable IBT before starting the APs.
>>
>> I'd prefer if Andrew answered this. It looks like it might be an option,
>> but it also feels as if this would (if only a little) complicate logic
>> overall.
> 
> It would indeed move the enabling a bit later, but overall (if
> possible) it would IMO seem simpler than all this patching and filling
> of tables.

As per above, I think the patching is going to be needed anyway. And
hence I fear the table filling will continue to be needed, too.

Jan

