Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B1918DF1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 20:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749404.1157488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMX53-00014h-GR; Wed, 26 Jun 2024 18:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749404.1157488; Wed, 26 Jun 2024 18:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMX53-000123-DG; Wed, 26 Jun 2024 18:09:17 +0000
Received: by outflank-mailman (input) for mailman id 749404;
 Wed, 26 Jun 2024 18:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3iT=N4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMX52-00011x-57
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 18:09:16 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31881f4b-33e7-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 20:09:14 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-79c076c0e1aso127932085a.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 11:09:13 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444c3b4b42asm68146491cf.91.2024.06.26.11.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 11:09:11 -0700 (PDT)
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
X-Inumbo-ID: 31881f4b-33e7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719425353; x=1720030153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i0Ws4kno2igXMBztBT5g7Ty4bOdbR1FWjl0bz6N8TrI=;
        b=kZ4zAzkgST3ACLIU8yce8s2rzYbDa8PNKGF7SEdKT5Wh3KmZAa61rCE2dot+QKcZOJ
         UeSnnSZwxtWVCOSKl5bWvffBe4DijnCTVBQU80xoPEKB/wv257gziL2SqAWJ+3OmJ+PY
         7KltmXl9y6OK3WWZfY8aJoQg39dosruinCNWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719425353; x=1720030153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0Ws4kno2igXMBztBT5g7Ty4bOdbR1FWjl0bz6N8TrI=;
        b=vkPOyfqMoG8aEbM6fCUUbG3HVd2L2uKI9QBvG8LdC6b+EqcYZ4Ru/tYtZJWv4MjI4W
         HFf0XZDqdkJwajX88F4+clFm64Z+w09HT0xRhOwobxDn+crKIrRc9+UrvBMN2GhyINgq
         MTF/g65upK9s3EdnsLI8WRwLNq43aF97to+jxRO7eTKlSozvBuG0BLQqaK5fk+SVKJTd
         6u+FNuJSAj1N/mr8+d2lJzBg8kTkR/GSC0CVj+AV3kUNNeuhbmv3GnGB7eTodu4wuRNr
         v1pq+5o0fArnEGv+7glOWR4n+vkOX29PzZS05iUjZax8xsm+U/8aw70pR9EMo0MezTwl
         8L+g==
X-Forwarded-Encrypted: i=1; AJvYcCUjXQFdtT0N4XJ8WX2K++Ygp+mMW+ZDhB1rZj27wo8FlMCW7lUQsTmcYGjN87K7WHlccdGFsu+GqLv7VJdd3tcamA1SCohpR93wwqgph2M=
X-Gm-Message-State: AOJu0Yz883lujBN3UFVzopYOOVYS6JkqVUyuL4SLQsKGapuCqLSK7Fhd
	mHUX4nhD8ffumktgmHsP0K7q2ozUZHFOGU/Vyaro155VSrkq8rtcGXHJWccCXZA=
X-Google-Smtp-Source: AGHT+IFRuV7zbROsCLEV/iXFDOPhUqCxBzYO52ZuBsuYWUgjnFyeyCNHxh9mF1XCSG9RWFcDDAQ6IA==
X-Received: by 2002:a05:622a:11d1:b0:446:3b38:345f with SMTP id d75a77b69052e-4463b384243mr14031121cf.10.1719425352659;
        Wed, 26 Jun 2024 11:09:12 -0700 (PDT)
Message-ID: <961f5371-3616-4476-ae12-e1d91cc56345@citrix.com>
Date: Wed, 26 Jun 2024 19:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/xstate: Switch back to for_each_set_bit()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-7-andrew.cooper3@citrix.com>
 <59201cf5-9d86-4976-a331-2a7f8bb9635a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <59201cf5-9d86-4976-a331-2a7f8bb9635a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 11:24 am, Jan Beulich wrote:
> On 25.06.2024 21:07, Andrew Cooper wrote:
>> In all 3 examples, we're iterating over a scaler.  No caller can pass the
>> COMPRESSED flag in, so the upper bound of 63, as opposed to 64, doesn't
>> matter.
> Not sure, maybe more a language question (for my education): Is "can"
> really appropriate here?

It's not the greatest choice, but it's not objectively wrong either.

>  In recalculate_xstate() we calculate the
> value ourselves, but in the two other cases the value is incoming to
> the functions. Architecturally those value should not have bit 63 set,
> but that's weaker than "can" according to my understanding. I'd be
> fine with "may", for example.

There's an ASSERT() in xstate_uncompressed_size() which covers the
property, but most if the justification comes from the fact that the
callers pass in values which are really loaded into hardware registers.

But it is certainly more accurate to say that callers don't pass the
flag in.

There isn't an ASSERT() in xstate_compressed_size(), but I suppose I
could fold this in:

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 88dbfbeafacd..f72f14626b7d 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -623,6 +623,8 @@ unsigned int xstate_compressed_size(uint64_t xstates)
 {
     unsigned int size = XSTATE_AREA_MIN_SIZE;
 
+    ASSERT((xstates & ~(X86_XCR0_STATES | X86_XSS_STATES)) == 0);
+
     if ( xstates == 0 )
         return 0;
 

which brings it more in line with xstate_uncompressed_size(), and has a
side effect of confirming the absence of the COMPRESSED bit.

Thoughts?

>> This alone produces:
>>
>>   add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-161 (-161)
>>   Function                                     old     new   delta
>>   compress_xsave_states                         66      58      -8
>>   xstate_uncompressed_size                     119      71     -48
>>   xstate_compressed_size                       124      76     -48
>>   recalculate_xstate                           347     290     -57
>>
>> where xstate_{un,}compressed_size() have practically halved in size despite
>> being small before.
>>
>> The change in compress_xsave_states() is unexpected.  The function is almost
>> entirely dead code, and within what remains there's a smaller stack frame.  I
>> suspect it's leftovers that the optimiser couldn't fully discard.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Other than the above:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

