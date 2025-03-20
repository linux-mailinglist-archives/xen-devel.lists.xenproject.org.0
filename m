Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5ADA6A7C5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922100.1325972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGR8-0007y3-2F; Thu, 20 Mar 2025 13:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922100.1325972; Thu, 20 Mar 2025 13:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGR7-0007wq-V5; Thu, 20 Mar 2025 13:59:53 +0000
Received: by outflank-mailman (input) for mailman id 922100;
 Thu, 20 Mar 2025 13:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvGR7-0007lm-81
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 13:59:53 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97bf23ef-0593-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 14:59:51 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so5678115e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 06:59:51 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ea16csm23675965f8f.82.2025.03.20.06.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 06:59:50 -0700 (PDT)
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
X-Inumbo-ID: 97bf23ef-0593-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742479191; x=1743083991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r7QScskPgEdmFRMXRMkKUin3iczg9dvUfYGDH9vbckg=;
        b=wBBrcGMCIT4j8r/no+8bg8ffHVGnWZAHmKWkVRfeDGjBulQi3rdglZkKeneV2JfzlW
         Ii6Sntv0QPjqgc+pflQ4/MoziS2vlDSBwnqdjY/L1YftvaASPFAziHY45qUW7+YqP5us
         AiqnPWHNqc/p3tPa5FnHpf0e8mAvi3Ql4aAAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479191; x=1743083991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7QScskPgEdmFRMXRMkKUin3iczg9dvUfYGDH9vbckg=;
        b=qmfUXV8F0k3jYaEOeHJWxlaRll54NlkYrE3tjjWFFdxI5N7Ja3eCcgtyLO2rQtn9fQ
         uri3hE3OmZPBLxegtZPEBdpxw6eU2+IgITvTfvO75WFYFhJcALTuH3Zg7xUGF4hDR/wA
         iu85bc1IuxDCe4c+hN1rDFyOCIPIgRGEFTzyOlD1hjQzBCUfq7mODN7gLl3FGpSrgQVC
         4E/6I3ii1LiD8dxvyU+ppSTIVk5NsVg5YaTYy2Lw/UnZAZLL+3yjnhJumxAyl2ix4VGa
         hDFyj9yQEvjQ169g25T6PpnivuCU+Q6hIiS2C3yieLQbqX8u0BJXOMYc1gyrVEIeK0lE
         ByKQ==
X-Gm-Message-State: AOJu0YxpdOIWVnR7O836WuVWvi5bSa77NCLtSItwBu5d431Zcd66nNR2
	ngHGhi7oyC8JgFSJ8CcxlMuTydHFBH+VyyCsF1lVCos2rOTYHE19ATtAZOBf2sQ=
X-Gm-Gg: ASbGnctU40EAAq2dkDAAkhSDZb2ys4+Lb11ijno7YYAkyKqU6j2KOATwnNOO2P5ukrW
	tPSqIE0SK6LkEn4ZIo2z6jVSgAhuTy4PHOMgFjMYUOtIEKzbMPTy7w/jSA4Qvs91drcYwx0CUyC
	YCY7dWYiX/7Iy1JCfuLjGoYIIhSfBFe+NSG5bYTLz2BG/7lwnaMJriW2WaNZSJeYwr58ZtePMUY
	ETwM4NcSNapTEIUdam5C8bcEJc4drEfADl02EqfnqmJFpG5HyCb66bWI7qgrNbnQjv1z9EPL8xq
	t9Tw2YzM0OtLsa2PVfjA8m8tvmgiRShBz6dIZpI7uodARoy4mpASVOaLfCjFBvu8W2Qu0PvBby2
	pryQyPs71Rg==
X-Google-Smtp-Source: AGHT+IGN5CLxGsStdGeMOABiASLQ3h2UKAt0JNkTlg/toA0NEFNzN67GSsFmnAQEChxMqKHNzn59EQ==
X-Received: by 2002:a05:600c:4e47:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-43d4384226dmr64697115e9.23.1742479190765;
        Thu, 20 Mar 2025 06:59:50 -0700 (PDT)
Message-ID: <f924256c-c4df-4856-8e3e-8c0293b1358d@citrix.com>
Date: Thu, 20 Mar 2025 13:59:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Untangle the trampoline copying/entry logic
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20250318173547.59475-5-roger.pau@citrix.com>
 <20250318201033.60634-1-andrew.cooper3@citrix.com>
 <Z9qI3cnE3BcuqAPE@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9qI3cnE3BcuqAPE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 9:05 am, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 08:10:33PM +0000, Andrew Cooper wrote:
>> The LRET is detached from the PUSHes which set it up, and this is about to get
>> worse with the changes to trampoline relocation.  For the sake of one variable
>> read, the complexity is not worth it.
>>
>> Reorder the logic to copy the trampoline into place, then switch stack and
>> enter the trampoline.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Roger: I'd like this to be a prerequisite to your "[PATCH 4/7] x86/boot: apply
>> trampoline relocations at destination position" to avoid the movement of
>> reloc_trampoline32() making things worse.
> I think you could commit this now-ish, and I can rebase on top?

CI said no, and the bug is hiding in plain sight.  The setup for the rep
movs:

    lea     sym_esi(trampoline_start), %esi
    mov     sym_esi(trampoline_phys), %edi

is buggy.  I'll try and find a nicer way to do this.

~Andrew

