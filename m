Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E5A61766
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914841.1320462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8i5-0001bn-VY; Fri, 14 Mar 2025 17:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914841.1320462; Fri, 14 Mar 2025 17:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8i5-0001aL-SM; Fri, 14 Mar 2025 17:20:37 +0000
Received: by outflank-mailman (input) for mailman id 914841;
 Fri, 14 Mar 2025 17:20:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8i4-0001U1-Pd
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:20:36 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23fc19f-00f8-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:20:33 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ff797f8f1bso4105819a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:20:33 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301539d40a1sm1393009a91.1.2025.03.14.10.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 10:20:31 -0700 (PDT)
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
X-Inumbo-ID: a23fc19f-00f8-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741972832; x=1742577632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Z8Ejyf5gVIQB49egYugEEvIlbhLo/s2/9aU/7U8kVY=;
        b=GUM8C0fhwINq0ab/NnjV6XkkHUc+Mq3SdbviqJk8i8taKGhfeEmhGmoiDFNivzmQ3x
         KUqqxYwxVLRlB5y8C18ljNNUjJbPh6lStaTONH0AFfM19ttGjDcHBnXiKBsPylrENfhT
         fx6fMSgjhFAuNuZCQ/ibhkupOiBrPm8mMs8/cVESiwBF6pIbHzYs3JITcbWfj/9+Ve/D
         yFgBJGOBi35+YOTDErJUh5Oc8g/LrsJmUkQ8sOx35b318iSWOPNsraBxBTCtMNTOHiSJ
         ypEcZ30H1rE86v9P7owZkKhkkSDWff2QlHTgFhkJA84qcNfACr6uWO84HVl7QtV343BN
         8tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741972832; x=1742577632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z8Ejyf5gVIQB49egYugEEvIlbhLo/s2/9aU/7U8kVY=;
        b=hVqOlD86pIWC220H1q2pJIdHcul7cDWuiIPFYsRZsNE6FHAEzVMHSPd4vdCaqUNGfr
         Z/o+yI6S/b65n2bHWuye04p+WTYBgHOB2VZXFR69TFBYw3jh0x9KSXk3PMqSih9pR5UV
         eYkQk49zIJ401Y/XV8mAzTXBE72dF4ooDrIFgt9Dv7KCo7Qwi/QauwNNVJKCBGgUSF2y
         OdOzDxqKVMo9Yon7pFJvQLXOo/3ccx+K+qISk2A40g7wYpKOt8wOrTtqXWVtR578EfIR
         D5A+jaLbX9OPVRxSJEt+CqKpLIWdMtUCJjMu9TISbZqi+ZAHVFGgJ2uit2K7CqFpXoz5
         YkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDWkgJX1BFbkaCMSt/FJVhDCQ8x7bKxT9ap9l9cSOGi4g3kIDkXBtj3DhP8zFeOirX1J7JBd7Rwks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWSioeM89mJ8u2toCRDB5cLsCqBb9EHLDRZrlcojItIGqaKvNy
	xGdOPAoKP6vfMkUKyXeNMcajff8blIxg3XEelWCyfqsv/1xc/GekIv/LUgtu6OQ=
X-Gm-Gg: ASbGncv9ABH6vgzHjXuqR35QAgpWFRFMa1S1RBBPqPmuUjtvuqw48As+mNIz2ojeaxu
	zm2cOaFzNZA/RC5vVMoAHJCBMGVtG4I7sgvGLsZctpT/q8Y/+w+SEOH0Etf1suV8llmLV81qTMf
	x+q24fowb2zEvSaSNY5fG59HDBIFEcvdJJzt+ShtteW3nE9Gt84Ecy8id27EapobNet6rFlDl/C
	K9ipG/INYU5RG87FjTORr1kbdL1NFPKR3GG7iB4WT8JRpeWU7oTEWKPnqtm/OdF8zdRo/bb+ZKO
	y56H6sYTm/8SF1ehdJtfHUSE7e1Avl0zE+FvZ+7l3EboFwvbL9tIi7wtSfAJUHWgYgjY
X-Google-Smtp-Source: AGHT+IH14/vkNdOBVlHqTbsYx0wGv8KV3ghiAEvAGkec1UsA+oGhZP9+b0le8JVQuRL27/WBey/Lyg==
X-Received: by 2002:a17:90a:da87:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-30151d9d4d8mr119507a91.24.1741972831743;
        Fri, 14 Mar 2025 10:20:31 -0700 (PDT)
Message-ID: <a04d4b3e-c2d6-4193-a95b-b8f61645dc27@linaro.org>
Date: Fri, 14 Mar 2025 10:20:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/17] hw/xen: add stubs for various functions
Content-Language: en-US
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
 <20250313163903.1738581-13-pierrick.bouvier@linaro.org>
 <Z9Qwg4PC_1bEaOLK@l14>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <Z9Qwg4PC_1bEaOLK@l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 06:35, Anthony PERARD wrote:
> On Thu, Mar 13, 2025 at 09:38:58AM -0700, Pierrick Bouvier wrote:
>> Those functions are used by system/physmem.c, and are called only if
>> xen is enabled (which happens only if CONFIG_XEN is not set).
> 
> You mean, 's/is not set/is set/'?

Right, I'll update the comment.

>>
>> So we can crash in case those are called.
>>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>> diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
>> new file mode 100644
>> index 00000000000..19cee84bbb4
>> --- /dev/null
>> +++ b/hw/xen/xen_stubs.c
>> +
>> +void xen_invalidate_map_cache(void)
>> +{
> 
> Is this stub actually necessary? xen_invalidate_map_cache() doesn't
> seems to be used outside of xen's code.
>

You're right again, I added it by mistake.

> In anycase:
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Thanks,
> 


