Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BF8CC26D
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727696.1132320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mLD-00056U-Gs; Wed, 22 May 2024 13:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727696.1132320; Wed, 22 May 2024 13:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mLD-00053J-DU; Wed, 22 May 2024 13:49:15 +0000
Received: by outflank-mailman (input) for mailman id 727696;
 Wed, 22 May 2024 13:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9mLC-00036q-NW
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:49:14 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e1da4d-1842-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:49:14 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6a077a861e7so37343446d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:49:14 -0700 (PDT)
Received: from [10.80.67.140] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1cd1d1sm133129086d6.90.2024.05.22.06.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:49:12 -0700 (PDT)
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
X-Inumbo-ID: 12e1da4d-1842-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716385753; x=1716990553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wIhu189B01nDbbjYkoJQBwtv69wN4Gpws0k4pLKdsVI=;
        b=a8tpKI4gYtzyNuJfh0HZoqZshyjpylRlrfil2IUrV2N4USsb0lCEil3eRbrWh4J8uf
         ChMKcdvlQuAvobBxEYMMkycEt5jEapGEaVkzDodWxgmMbxKU/LWjwHxfa11ZgFKrSDc2
         wuC6EbtH1GZXoRNcnUVrBhldpVfvTZ8FoYz04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716385753; x=1716990553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIhu189B01nDbbjYkoJQBwtv69wN4Gpws0k4pLKdsVI=;
        b=QMxwvjvZp9YCDuFOjCQPIywID9X3KLmM43oaIlma2lq9F91sBA5tWtdzbPW4UEqoU+
         vXTe+i1xTnsFSIsn4ihwk81xoC2EhQW8CXHnGaBCe1YiIn4Vmv5dOr9w7jZIrBBGcvSk
         Yoakh6DLEA+aPCyVCIMz65+5pYZIR2/rkARyq/f6PYjGXRWmxjoLTzorNyJLzLXF9j6h
         IaDChiZdMqEfkmcwC0HE19+YuaZ7jEkz28FIwvmc9XPXZNsQotenx+4GSA01nSlfTxK5
         RgKmqx/EvM9xQRdE2DbEVcabt18I1K4tatyddHYdnFbY6qzr+s4eXpY1duz/zXAMO0KN
         u02w==
X-Forwarded-Encrypted: i=1; AJvYcCUtt2MwEvBySlpujpNKaHWx554bZPOzSV3+hI/A5APzt4mRNPk8apeEo2zQBdrlFyZ+kPDdxcGHXYgobdpt6g7ZH57eTztc8772GMhsE+g=
X-Gm-Message-State: AOJu0YwJ27vsMGz52LKT1kK+19r/D/vROkLahorIOPMAnrx6+Qdb6hDN
	eWEemKlnk+jRtH5JhUREcY2Qa5KkX2DOA65IfZa1LM4xu8q96LHlsdhljVRW5n0m/KBu1VPbD5K
	jew4=
X-Google-Smtp-Source: AGHT+IFA0cSXGztNyHfP10CZCoe+4yNmjJtuJ6PmejheNzVxFkJOzSdzf4+KFdAc8eJS42q+dyNfJA==
X-Received: by 2002:a05:6214:2f11:b0:6ab:8bb0:4f05 with SMTP id 6a1803df08f44-6ab8bb05022mr4623436d6.34.1716385752988;
        Wed, 22 May 2024 06:49:12 -0700 (PDT)
Message-ID: <f8eb1c08-c168-4259-a221-4719c91afb3b@citrix.com>
Date: Wed, 22 May 2024 14:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <664dc165759df_5e9362b92d249399c762@prd-scan-dashboard-0.mail>
 <1b607d3b-429e-4841-a3b0-ed3a39e12ed7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1b607d3b-429e-4841-a3b0-ed3a39e12ed7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2024 11:05 am, Jan Beulich wrote:
> On 22.05.2024 11:56, scan-admin@coverity.com wrote:
>> ** CID 1598431:  Memory - corruptions  (OVERRUN)
>>
>>
>> ________________________________________________________________________________________________________
>> *** CID 1598431:  Memory - corruptions  (OVERRUN)
>> /xen/common/trace.c: 798 in trace()
>> 792         }
>> 793     
>> 794         if ( rec_size > bytes_to_wrap )
>> 795             insert_wrap_record(buf, rec_size);
>> 796     
>> 797         /* Write the original record */
>>>>>     CID 1598431:  Memory - corruptions  (OVERRUN)
>>>>>     Overrunning callee's array of size 28 by passing argument "extra" (which evaluates to 31) in call to "__insert_record".
>> 798         __insert_record(buf, event, extra, cycles, rec_size, extra_data);
>> 799     
>> 800     unlock:
>> 801         spin_unlock_irqrestore(&this_cpu(t_lock), flags);
>> 802     
>> 803         /* Notify trace buffer consumer that we've crossed the high water mark. */
> How does the tool conclude "extra" evaluating to 31, when at the top of
> the function it is clearly checked to be less than 28?

Which "top" ?

The reasoning is:

 2. Condition extra % 4UL /* sizeof (uint32_t) */, taking false branch.
 3. Condition extra / 4UL /* sizeof (uint32_t) */ > 7, taking false branch.
 4. cond_at_most: Checking extra / 4UL > 7UL implies that extra may be
up to 31 on the false branch.

which is where 31 comes from.

What Coverity hasn't done is equated "<31 && multiple of 4" to mean
"<28".  I don't think this is unreasonable; analysis has to prune the
reasoning somewhere...

This is (fundamentally) a dumb-ABI problem where we're passing a byte
count but only ever wanting to use it as a unit-of-uint32_t's count.

But it's also problem that we're passing both extra and rec_size into
__insert_record() when one is calculated from the other.

I had decided to leave this alone for now, but maybe it could do with
some improvements (simplifications) to the code.

~Andrew

