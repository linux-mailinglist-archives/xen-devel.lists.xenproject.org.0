Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A79A65133
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916892.1321901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAba-00049L-Av; Mon, 17 Mar 2025 13:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916892.1321901; Mon, 17 Mar 2025 13:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAba-00046u-8G; Mon, 17 Mar 2025 13:34:10 +0000
Received: by outflank-mailman (input) for mailman id 916892;
 Mon, 17 Mar 2025 13:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuAbZ-00046o-9h
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:34:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80202f53-0334-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 14:34:07 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3996af42857so68295f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 06:34:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm15215081f8f.31.2025.03.17.06.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:34:06 -0700 (PDT)
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
X-Inumbo-ID: 80202f53-0334-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742218447; x=1742823247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5u+PQ7Wy1rSWKvAKqXkJ9a+LjL+Cz/yG5Dbo6siKkag=;
        b=g7otuO2KoODS1r1L9txjdxbOSLyvAA3iaacaLnC4bno7AySFqLMMUt50Go+q+azG1a
         PMKguJrP9vSi+uIAc8J4Pn5Ikp0dhCDlsoVuV1kfVFK3l1XUq6jvZE3cEBovLkMq/v4a
         Qho47amXxPk1XvowPzSTk9soLn7GzRKd/ddwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218447; x=1742823247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u+PQ7Wy1rSWKvAKqXkJ9a+LjL+Cz/yG5Dbo6siKkag=;
        b=piDrSUQdEpQPdFz8yH5KLSbp32A/rGPzVOL91Zxj9VDRnvktwKAd3mBZvr25Hn1RA0
         9ZuD7P3siwIHlxyyqr90oUohtHVaK8l+RFk61rXOyfel/MSnFFkwmnNVhlVJ2rg+PHgj
         SoXEEOTBPbk90t+zO+KEYEOGeKtDJqHwGWRwp45OoAYjHt++2U2mQPvZALMDUCaDLRFX
         ZxCk/2OEuniOr+Sgk/YP2ANCG0X2yKxDoZJQ2kpq85DNFP/W8veECktTZba0OFG/hk2r
         9ApyWSCZKf+FAwbucq2/efNQUTaznun2LGt78F8+N0ghjIUkt2jqIVVuKUvYxcitvJlg
         yEzg==
X-Forwarded-Encrypted: i=1; AJvYcCVRt7NdsxOFuOnmmbJITff+M0tL2nU+hUGJKCKr4oEWvGqnibxbtsUmuHWkN8Mhcu7NN1xRqwbhXlg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbKu913z43FLKm0HVqP7nVFvXwh9kFgjG9lMg/o5rN5Zhdx8WO
	8IVPTYiwuBcoYmn7KxG5BKffUnlXvWAMzLbKpA/qSI40M9YZhfmYhUZUEBmaeZk=
X-Gm-Gg: ASbGnctwVqJ2GAn0OLBStbAYKa/lVaXa6dShzHx6MqUEh4incq5UqBdj7mwo5NRKRUE
	Gp0DULWeGqt5UisUUpkTBimhl/OOUrwiXlmR6N116z7b1/ISwXZQ822Sst9VR/uaHF07W8pMyWq
	TqamlPkdCPd+jCyBhj2ZRdPT2FNXG3WTT/slLyX8DZUUNUUSaIBX/CICfUBwO+/qzqDpDPDQ2tr
	GnV16E4ZaK+ptIEpL+VU44m16JRYd9foXr7HXmkTrsn0GnazeszwdyDHDrl3Lv7ycbXJgjm06Ez
	VIfEJ3mQyReH7pfzSd1C5xL7LKYDGdImk1rcpVPEDnDCD0ZZFyEfgi6XW9g5iZwa17ZAqCUiXIL
	XeiUhnLUw
X-Google-Smtp-Source: AGHT+IHIhhiu++HMEBnwawbD0hyqkPqyirrvrN2VJLdElAnchAKa0Hp/IzGe+56hyFsyjtoS0tNVXQ==
X-Received: by 2002:a05:6000:186d:b0:390:f9e0:f0d0 with SMTP id ffacd0b85a97d-3971b9f6811mr14890513f8f.6.1742218446710;
        Mon, 17 Mar 2025 06:34:06 -0700 (PDT)
Message-ID: <6f0aa9e8-4176-4360-8031-625d99096452@citrix.com>
Date: Mon, 17 Mar 2025 13:34:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314204920.118065-1-andrew.cooper3@citrix.com>
 <781a020c-351d-4211-ae51-8057646c28e2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <781a020c-351d-4211-ae51-8057646c28e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 9:09 am, Jan Beulich wrote:
> On 14.03.2025 21:49, Andrew Cooper wrote:
>> ... which is more consise than the opencoded form, and more efficient when
>> compiled.
>>
>> For production VMs, ~100% of emulations are simple MOVs, so it is likely that
>> there are no segments to write back.
>>
>> Furthermore, now that find_{first,next}_bit() are no longer in use, the
>> seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
>> they do need to remain unsigned int because of __set_bit() elsewhere.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> I still can't persuade GCC to do the early exit prior to establishing the
>> stack frame, and unlike do_livepatch_work(), it's not critical enough to
>> require noinline games.
> Then is ...
>
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -3022,18 +3022,16 @@ void hvm_emulate_init_per_insn(
>>  void hvm_emulate_writeback(
>>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>>  {
>> -    enum x86_segment seg;
>> +    struct vcpu *curr;
>> +    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
>>  
>> -    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
>> -                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
>> +    if ( likely(!dirty) )
>> +        return;
> ... this worthwhile at all? I'm surprised anyway that I see you use likely()
> here, when generally you argue against its use.

No, it's not worth it.  In fact, simplifying makes the function smaller.

void hvm_emulate_writeback(
    struct hvm_emulate_ctxt *hvmemul_ctxt)
{
    struct vcpu *curr = current;
    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;

    for_each_set_bit ( seg, dirty )
        hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
}

gets a bloat-o-meter score of 131 down to 72 (-59).

Are you happy for your R-by to stand, given this adjustment?

~Andrew

