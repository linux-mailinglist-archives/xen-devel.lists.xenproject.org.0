Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEobHmJ9ymlo9QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:40:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19635C288
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267654.1557109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Cr5-0007L2-3v; Mon, 30 Mar 2026 13:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267654.1557109; Mon, 30 Mar 2026 13:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Cr5-0007In-17; Mon, 30 Mar 2026 13:40:35 +0000
Received: by outflank-mailman (input) for mailman id 1267654;
 Mon, 30 Mar 2026 13:40:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w7Cr4-0007IO-9z
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:40:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Cr3-00D0we-IF
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:40:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca7d4d-5cb7-0a2a0a5109dd-0a2a4506b600-26
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:40:33 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca7d51-3034-0a2a45060019-d1558030c90a-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:40:33 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so44779505e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 06:40:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270ea4bdsm141846615e9.6.2026.03.30.06.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 06:40:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774878033; x=1775482833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hicmc3h5Xh0i+iO2B/3pYhiTPqSbqVQJT/VWCPOgds4=;
        b=DY6nojE2xrBJMRGbSbVcIsezbfbKYXDHIyfZhHRU3ka3+DltgCMo63C8EmHflyAK3B
         IXl9ibI4KsbKryvdMGbMHQ15gRsDw7H7s0FBSt2T0z1LyQ8HDiapiTVg/UA7Ca67uT8u
         v7YpVySKEgywDM1tArdN6Of4P8KsQsethxjJQa/LakVJrQ2kqsSrDn9H0liAEyzr7X3t
         PtRuFXRMCZNWHenP7/acmeIiRcGBzCFBdgfusIuQr+3w2TAe/hvJKxzAT2s1BQtzET8/
         nre21KOIZLKCc5gkDGeCJ3QpN/aIRznr5I0g4SsrcB7yw/SKTFLsKL5Kj1GXrGfNzEQ8
         58oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878033; x=1775482833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hicmc3h5Xh0i+iO2B/3pYhiTPqSbqVQJT/VWCPOgds4=;
        b=imBqxVyBDf7hkeXJecWmnB4C7YrUdIwwotYvT0jfHcA1vHVHh8CB45kaJdScQ1FgR3
         9hd4Ji7zLS3FPwCt1EvSCNsTlECvJnymFrp3LdMOmaMtS7AilatvScbW4hI+exhjy5aR
         EZ04n4qSvDzMrSV74j7SBCERwtKSOQ80ooVZkGPkff6IeDWZGWN+wrmbUTxtOXYhvKyZ
         jDpsYkAlVMIASCfdZ4efFuSdRPnOEEcprGfu/YSHcV8IEppXloKZd4OE3ViziTExno1O
         gycM5+JcOoUCzmr+wZW+aszDGmY0IRXpa1BGwsPWcyYrrTPyAy5+i+1kGLne+Wq96+zT
         Pt/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqiFB8RpesFMyf2X+nheoUshFaJWue9/iOp0L/ciiClGfdVaZPGV0jYgZXwkqizYj7o/95JsPt7I4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhE7ApQa7mJv0CJAIvKoovXqwDGBdY5ae++ViPsPosu6N3PBCx
	ULVZ4IhZfMSGz1ueTOFeuSB0BLdavedOOiQECFdRziKBRYLy4lB29nda
X-Gm-Gg: ATEYQzziZ8kRUnTuIHqAZolWFr/n2RqS66r+hDXTD5GbDUkt0g+N3DUEfmp00W63RFb
	WzeX8MklRgCq0/RLHtqt7ToYobzoDQDUUM2hXDV2FW7cCF/6Trsy5LrfsWnBFdZ22wJy8OwbMTe
	xlMRuOiKLtnf2ORIEn4CJnsNq0a1DxuKqR0XpBVHZy6CkHoQY7gV1QmdD9AGxwvhXzLJJX2bbDI
	Au4pEq9XQditKxcPXrYPRAIlk7MzSIR+VwcwUtg3etkivGS6kGOwDHk4hozo0+FZhZ1rNgdqUzs
	CLWPJSpKm6uRXarH2daRcP6Cdj5taxufVyfCQe4qnuzMiWroG6g0rahkyzJrRy3cR38pKcbXjJ5
	3E7YMJJ+J8eJhaKKbcxVfEpFtkM+uiNoS2ORC1u+q34mzCuK4R38S2q5vlm1KrTSwKwPgPwPsby
	8Rtpz5Zw9VCHd6lGwcQHDrhgV19Ba0K96Mn9oUAGTJL6k5erheTzZbrRXKh4fromAqJG7VYYoX8
	gI=
X-Received: by 2002:a05:600c:3504:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-48727f0b109mr180427075e9.28.1774878032262;
        Mon, 30 Mar 2026 06:40:32 -0700 (PDT)
Message-ID: <437b0d3c-916d-4513-9159-ee4e4c904bf4@gmail.com>
Date: Mon, 30 Mar 2026 15:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] xen/riscv: implement get_page_from_gfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <ba0ea599c4ced7fca0b8f5dd66bb7ffb277f3a4f.1774281309.git.oleksii.kurochko@gmail.com>
 <ef4eac20-d136-4c9a-82be-72259c088537@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ef4eac20-d136-4c9a-82be-72259c088537@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774878033-829971C2-44D61C6A/0/0
X-purgate-type: clean
X-purgate-size: 2481
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DE19635C288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/26 2:50 PM, Jan Beulich wrote:
> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1534,3 +1534,32 @@ void p2m_handle_vmenter(void)
>>        * won't be reused until need_flush is set to true.
>>        */
>>   }
>> +
>> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>> +                                    p2m_type_t *t, p2m_query_t q)
>> +{
>> +    struct page_info *page;
>> +    p2m_type_t p2mt;
>> +
>> +    /* Special case for DOMID_XEN as it isn't "normal" domain */
>> +    if ( likely(d != dom_xen) )
>> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
> 
> Comments usually apply to immediately following code. When that's not
> the case (as it is here), the comment either wants moving or wording
> accordingly.

I will move it after if-() statement.

> 
>> +    if ( !t )
>> +        t = &p2mt;
>> +
>> +    *t = p2m_invalid;
>> +
>> +    /* DOMID_XEN sees 1-1 RAM. The p2m_type is based on the type of the page */
> 
> As before - I don't think implying any kind of translation (even 1:1) is
> correct for system domains.

I will rephrase that to:
  "DOM_XEN has no stage-2 translation at all, so the gfn argument is 
treated directly as an mfn"

> 
>> +    page = mfn_to_page(_mfn(gfn));
> 
> This, strictly speaking, is UB until ...
> 
>> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
> 
> ... the mfn_valid() check succeeded. Yes, Arm code has it like this, but
> I can only repeat that you want to carefully inspect any code you copy.
> 
>> +        return NULL;
>> +
>> +    if ( page->u.inuse.type_info & PGT_writable_page )
>> +        *t = p2m_ram_rw;
>> +    else
>> +        BUG_ON("unimplemented. p2m_ram_ro hasn't been introduced yet");
>> +
>> +    return page;
>> +}
> 
> Finally, what doesn't become clear at all is why dom_xen needs special
> casing. ISTR that when looking at the Arm code in the context of reviewing
> v1, I spotted why Arm has this special case. Maybe I'm misremembering, as
> now I can't spot it again / anymore. Yet whatever the reason there may not
> apply at all to RISC-V.

IIUC, then Arm having this special case for DOMID_XEN as it is used to 
share pages beloging to the hypervisor, for example, trace buffers and 
considering that trace buffers are part of common code it will be also 
true for RISC-V.

~ Oleksii


