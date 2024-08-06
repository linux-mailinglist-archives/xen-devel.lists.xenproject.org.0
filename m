Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F8948BD5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772572.1183014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbG33-00005V-Ai; Tue, 06 Aug 2024 09:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772572.1183014; Tue, 06 Aug 2024 09:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbG33-0008VG-7f; Tue, 06 Aug 2024 09:00:05 +0000
Received: by outflank-mailman (input) for mailman id 772572;
 Tue, 06 Aug 2024 09:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbG32-0008Cu-00
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:00:04 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 435ec9e7-53d2-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 11:00:01 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso46156766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 02:00:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc4230sm530019166b.32.2024.08.06.02.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 02:00:00 -0700 (PDT)
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
X-Inumbo-ID: 435ec9e7-53d2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722934801; x=1723539601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nOW7CBVDpL6vf5ChcaCrkQX6d4lPmpje+mFf5nrIlNA=;
        b=D0N+HLeoifibumug5IXABHnDbsx1vWoEK6RA5nMzHawx5IaAkBQr2GhcsGQmlBRNRX
         A5FG2dk/SzehnSNSxOVZOjcD+eNnjEMhXTlzkBtQac9cK1DFPSsQYosy9KBcsNDhIn99
         dMKJaKq7n0vMLSu1h/2HG17rnCKlF55jVHKO0LU75MHqaHKC+QutqBfQd6Wv9/V5MoDm
         vYxl3amgVwRqfvZUMJq2oeN5F5k5USnlarDDNpCsN5ww1XOwcMwCUQ9QKh5jbjTvxE/H
         bcVGHjYKXKDnlDEAkMmklNH8HokeJz+kALen/rT5zkvUEkDbct2U/yh7gImnVkxODdWY
         14sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722934801; x=1723539601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOW7CBVDpL6vf5ChcaCrkQX6d4lPmpje+mFf5nrIlNA=;
        b=wk7n4JpgEE7wIHwGVNJl1GnS7vRy547NEORKLZO9JB42GLzb5APE38/elupi+TBt8r
         hk+GYFzuQ3iHFejlqjX6AMCLED4Ojm7Y3YgapsVWlYh8qng6J6KT4kr9IqhSbDplgdzd
         v501jk3EbA5mu9KMV6ETkYOsVcwnSJh4RFtWY8oVC5B0IhnJNWAd1bWAJI1EsNPms1ks
         FYhUoxRpcXoopGkw08nGGIdltJJ1W3GdTjMPVLNVHv4pFs8ZO1lUAc8Z+G+I41kiBDgj
         Fc90e8Q9EDW3HQ3VuDjEPH3+82roZ/aK0HCOfLG+iFPvolDvCQQPybyVoOUTLUkr+u4/
         bpbA==
X-Gm-Message-State: AOJu0Yz4glta7ocwZ9oprvEVEAkgexs4toySVJPUdp/iCmUUuSfQRG+2
	7yYmYKiov3b6R+AzMEI0n1tn6cY1kIZy675J7HVDemTrJ0zNOCQxqNer+yTcqQ==
X-Google-Smtp-Source: AGHT+IFG8UaTIEZCWmBTtTwkQapdTMPO/I099QIM5lUODmdRGc7aJMgRvcqXfomZCJa81oXjCcpgWg==
X-Received: by 2002:a17:907:e87:b0:a7a:a7b8:ada3 with SMTP id a640c23a62f3a-a7dc4d8f7f4mr1136308166b.3.1722934800739;
        Tue, 06 Aug 2024 02:00:00 -0700 (PDT)
Message-ID: <c4dac0ae-a8f4-4121-ad2e-f7cd61b6e3a8@suse.com>
Date: Tue, 6 Aug 2024 11:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
 <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com>
 <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr>
 <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com>
 <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com>
 <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr>
 <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com>
 <674914344.15937452.1722929654769.JavaMail.zimbra@inria.fr>
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
In-Reply-To: <674914344.15937452.1722929654769.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2024 09:34, Fonyuy-Asheri Caleb wrote:
>> If what you say in the earlier paragraph was the case with upstream Xen and
>> without you restricting what the guest being migrated was able to see on the
>> source host, then I think that would indicate a bug somewhere. Yet you don't
>> provide enough details to be certain.
> 
> Sorry for not specifying. I am still in the same context as stated previously. 
> I haven't made any modifications to xen and no restrictions on what the guest can see. 

Wasn't it the case that previously you observed AVX disabled, because of
GDS? With AVX disabled, AVX512 would be implicitly disabled, too. Then
migrating from an AVX512-capable host to an AVX512-incapable one would
of course work. Yet of course this is only an example, because I don't
know whether AVX512 is what your new inquiry would have been about. As
indicated - please provide sufficient detail so we actually know what
you're doing and what you observe.

Jan

