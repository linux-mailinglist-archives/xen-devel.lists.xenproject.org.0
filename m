Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A7wOvd9lWl8RwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:53:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C2154534
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235364.1538348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsdIV-0006ip-SH; Wed, 18 Feb 2026 08:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235364.1538348; Wed, 18 Feb 2026 08:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsdIV-0006gm-Pb; Wed, 18 Feb 2026 08:52:39 +0000
Received: by outflank-mailman (input) for mailman id 1235364;
 Wed, 18 Feb 2026 08:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsdIU-0006gg-Rv
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 08:52:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cc4f526-0ca7-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 09:52:37 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso3933183f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 00:52:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74918sm40343660f8f.17.2026.02.18.00.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 00:52:36 -0800 (PST)
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
X-Inumbo-ID: 2cc4f526-0ca7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771404757; x=1772009557; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LefX0n61n1KVAFxb03ZPorKU4FbTRVy6uFlcWjZSidc=;
        b=WbTd2EyDGnUFqllMbuxyDUmfWOffuhaRLjJ3Feq0OcYCPqPceeD/p3+h79ecwvRKiq
         TXyx+RiYjUX/E/WcRVwBOxkdLqzPZec+zG3VNVZD4nsCKQKmscaUtHdZWs0v4JI99sBW
         jIDHJhCeP8IwS+4ckAhHAf8ez1MlZzEGZwWNKI/Tz72j9pNlpEp8L5khEYNJFkFSz1gA
         70UBtBda/sf2QKx5tNV3isoPEs3ny8oO9tc1m+UopDUiEFHnYLu5Ys4cGKcHGfrMtX8V
         dsha6Yl54JozPkY0oFUYe8Lmp6fYnwLtUwlR718RAQyLl0Kj8DjIWa0U9ii9i0lXG99x
         MmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404757; x=1772009557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LefX0n61n1KVAFxb03ZPorKU4FbTRVy6uFlcWjZSidc=;
        b=m88M2L7CG3iNlttSalGBSrgQg9jutLwnLOq12dSUaibXA+kU2rzCj/to5X9dU52Era
         qJpC4Lz+DRNpSu6tkZBOmXHtr+CF2usRLjRNg+dQ9ss/1hIUAvhNPUFZyYAeluh8cSv4
         3l7jadnpcvku2mCKhVHlrQ4KlDrNVTgZjQfDr2v6cy1nhUMkBfXj0sAoJScTa67/xW6O
         IZSzgpT1/BhiXbko6EGF5xvvCRRz3v5+gfN4oeedxFgAK+TuEOjTAdmfL+2UaLVjQsn/
         qmR0rOPf7sePsQSUwLXH6B2GXGbersGyPBG78R2VR/pky2whDnveuPN4fRJQi0pSNsgd
         slqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxBYdnlQi8QRePOGMcBjRvukVHsr6gXynbSdGPerW4+orm/ESH0O6QmaOjVxQgOQjXh1qdDhhor4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzubijTyTACiZiPTOrYsFedLhvAIbRTOA5qH4MNcUl/84if7vW0
	wjvyyyA28BP9j4JYRX8BM0Vvggij/vsNmTmrCoQ2tvbMBqa5TdvVjwdlHSGdvqwgLQ==
X-Gm-Gg: AZuq6aKbqqfdf5xyBK0EzRW7F7c8FKUok4w7eOXanc5ZRm3c5P9XE99JaOQtmPL8etk
	bUrmMBPn2DtPUDEeM8Px58Op2/9uPnsGDiNAQdCa7diQTr6PVbdtx7ZevnSpFD4hokMpqzIFR2+
	eChkIxMy+4iCrAeeYUr1tuICiNZNPD/t4BmjCfaL3hmc3yuKuC64cQyCW7SjQfz0uFSU4k4+Pya
	5QR7Z0O49//Fa8S/giWG74NDSOjy8MUFZNIZlf1jPSvfUcvnToen9wou1G3P3osowipj0JERcF6
	9Vz+kZKdh/nJE9m+Kz0TH/aMs/8mNtMyhlx/av9KrztigpBkbzPidnXtn1hjailrqp9HbNCuA9r
	dp+qt6HIVL2n0cHaUeiAo/UuUitAMJa6/kCuVrAZxYlEtLLppchKJbv0pSYZXQdBDvzLu+yvTVl
	kgy70ikdssB/pKFH8+IFJwRBv40PtoQ0xJDY2pFzg7+i1qqL6IZbzNaIA73uNE7acTM0gVKcxwo
	CNBkBSKDMek33Y=
X-Received: by 2002:a05:6000:2001:b0:435:96ec:679e with SMTP id ffacd0b85a97d-4379db61cccmr25836875f8f.23.1771404756802;
        Wed, 18 Feb 2026 00:52:36 -0800 (PST)
Message-ID: <00aa15b0-b1bf-47cb-ab67-bc32d68f56e4@suse.com>
Date: Wed, 18 Feb 2026 09:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] vPCI: introduce private header
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
 <3bbe1fc7-ed6e-43ee-bcee-17502ba56539@amd.com>
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
In-Reply-To: <3bbe1fc7-ed6e-43ee-bcee-17502ba56539@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5E2C2154534
X-Rspamd-Action: no action

On 17.02.2026 23:04, Stewart Hildebrand wrote:
> On 2/10/26 05:53, Jan Beulich wrote:
>> Before adding more private stuff to xen/vpci.h, split it up. In order to
>> be able to include the private header first in a CU, the per-arch struct
>> decls also need to move (to new asm/vpci.h files).
>>
>> While adjusting the test harness'es Makefile, also switch the pre-existing
>> header symlink-ing rule to a pattern one.
>>
>> Apart from in the test harness code, things only move; no functional
>> change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Subsequently, at least on x86 more stuff may want moving into asm/vpci.h.
>> ---
>> v4: New.
>>
>> --- a/tools/tests/vpci/Makefile
>> +++ b/tools/tests/vpci/Makefile
>> @@ -14,8 +14,8 @@ else
>>  	$(warning HOSTCC != CC, will not run test)
>>  endif
>>  
>> -$(TARGET): vpci.c vpci.h list.h main.c emul.h
>> -	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>> +$(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
>> +	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
>>  
>>  .PHONY: clean
>>  clean:
> 
> Can you please add the generated private.h to be removed upon "make clean"?
> 
> Also, can you please add tools/tests/vpci/private.h to .gitignore?

Oops, yes, of course.

>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/vpci.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef ARM_VPCI_H
>> +#define ARM_VPCI_H
>> +
>> +/* Arch-specific MSI data for vPCI. */
>> +struct vpci_arch_msi {
>> +};
>> +
>> +/* Arch-specific MSI-X entry data for vPCI. */
>> +struct vpci_arch_msix_entry {
>> +};
>> +
>> +#endif /* ARM_VPCI_H */
> 
> Out of curiosity (not asking for any changes), why did you include an emacs
> footer on the x86 header but not here?
> 
> Otherwise, the rest of the patch looks good to me.

Well - I copied the original files and then reduced them to just what I
wanted to move here.

Jan

