Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D56ABD35F3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 16:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142385.1476576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8JJh-0006Qx-Qz; Mon, 13 Oct 2025 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142385.1476576; Mon, 13 Oct 2025 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8JJh-0006Oa-O2; Mon, 13 Oct 2025 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1142385;
 Mon, 13 Oct 2025 14:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nG5L=4W=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v8JJg-0006OU-26
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 14:14:24 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e67f6bb3-a83e-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 16:14:15 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso22762535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 07:14:15 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm125262305e9.11.2025.10.13.07.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 07:14:14 -0700 (PDT)
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
X-Inumbo-ID: e67f6bb3-a83e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760364855; x=1760969655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qv7yKUSp1keAvGeIJTgsLzzM2Dd2vNSw3IfagjYR6Ak=;
        b=AE9O9Grv9XHx802Ki5qC6oHAJCeFIPWGnU4psPsJXGdieTemtshHIRcrKKKB9lgcBq
         3OB1HOVOygwhPcD9NR1YxpbvIMOQ6PkQCSkGmdGRCUnV2W94v2ggucdwXZkJzJ5a/4xB
         4d+laS5xuaW5/6U8dbrM65Xss3WFlwOekIAq5cu368XhXT8mwn0Fq9Ie7VqpQa/saNaB
         S/uKrkziwCmRyLJQRlUvDByOhGAF5FtNk0yttfhevATc+1GdEgCDdldAFa9Hn2wjlCDv
         QImgn0oYYccUgbPX8bDHMeMuNFtTM3yRM1LCimwXwGcdqsMunItNNnIoANWF5Sf4xSGC
         MOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364855; x=1760969655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qv7yKUSp1keAvGeIJTgsLzzM2Dd2vNSw3IfagjYR6Ak=;
        b=RZsQVUZ9BPY8qb/m9dSW0d4iGKGylFsLqOVW/qG3SF/lqURZx2GPYADK3hqrMH0ThG
         bwmdLVnkJ0BnT2ywYJqAvy/zDEpEgjlWYDe8DC0HyTZFkBHmuNrZw4o6iBg0dr1D2F6A
         6fW08dnBJAoflgV/NT3XQBmy8ki6i327zP3DKBLy9LJ9EMTDUoj1ByAUU4rZ5K9VAJBE
         MVyaW6pPpcVgwPvmIVSR8SGUvRRt00qF0eCBzT9az03yfCRPIb7YixYXBHauKByJu+5w
         7HZ+kdwejKizR0B5O0BQsB9f2C+ve8KezvDEY+69NDTNXIi4sz/qutB5D8lI6VpH3Rmf
         ZN4w==
X-Forwarded-Encrypted: i=1; AJvYcCVUSOpYuf0BlzHiF9OhfK3qITxkdROke1k+V8LljJUuHW86rMt8qBqCPKIWtHxLjkcpCmcUkWhMD+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1xJeKtaRyfzLRXufQKtPUhfoo8Vx5OVQL4mmoODPe9JGFxnek
	ank1OXBzDlkKAdWwwq44uvmAFarMETsbq2rbrGEUyU/XoHsu3l74NHBEIkqDs1R6TY4=
X-Gm-Gg: ASbGncvvX02ieBfyVm1SFRSiSxGMwtqWMOuXKowfrxw1KnbIUfv92R768ySmrBQ590L
	bUPPQYNHo31ox26vvJE0b2pwTFcxWtGBQIXq9wEsJ4Jte6IdlTI2oRyri6gyXJfvWrKp7nooq54
	BcW55FLT+d0pW5fLvzyB3zUzFNKuKDuU6FhhDGUy0b2qGjVf3aJ+nqr+Bch2MiFtJFXJIZX+zTG
	nkYwnYQ4myS+/8CG+gbhLeykynvnIEMcTlP8rbCxqoZvJtHfbcQFAXlGAw1V5z+PsvaezgPAMfj
	4H0lzhx4VLtvEHv231B3foIjWYHyC3BpAy2AL4bTXK1i65NkO2ehSpbWAqv2a04JejQIYM+GDWm
	C9GkLwZ6MgaU6oAh6skJNSUsiZunsNWC4ewnh97dL7A5p3Bpf0DJnVPNedjudQbbhAa+UuvcjYu
	6jJ73vxO59po8y
X-Google-Smtp-Source: AGHT+IFpD7B4YpSeDObYU3xiNzf797WnP8ClM3/cdXiW5NpKO9VzUYIyFMpffvprfsk6KbSgYLlZIQ==
X-Received: by 2002:a05:600c:1f93:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-46fa9a8ca9fmr151711385e9.7.1760364855227;
        Mon, 13 Oct 2025 07:14:15 -0700 (PDT)
Message-ID: <ba4ca63b-6d46-4df9-8d30-fc0537736adf@linaro.org>
Date: Mon, 13 Oct 2025 16:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
 <877bwz6oqy.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <877bwz6oqy.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/10/25 13:10, Markus Armbruster wrote:
> Ping?
> 
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> xenfb_mouse_event() has a switch statement whose controlling
>> expression move->axis is an enum InputAxis.  The enum values are
>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>> case for both axes.  In addition, it has an unreachable default label.
>> This convinces Coverity that move->axis can be greater than 1.  It
>> duly reports a buffer overrun when it is used to subscript an array
>> with two elements.
>>
>> Replace the unreachable code by abort().
>>
>> Resolves: Coverity CID 1613906
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/display/xenfb.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued with g_assert_not_reached(), thanks!

