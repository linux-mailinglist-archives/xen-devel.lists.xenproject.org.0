Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDBxBVuijGlhrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:38:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF3125BE7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227855.1534259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCHm-0005kC-DA; Wed, 11 Feb 2026 15:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227855.1534259; Wed, 11 Feb 2026 15:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCHm-0005il-96; Wed, 11 Feb 2026 15:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1227855;
 Wed, 11 Feb 2026 15:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqCHl-0005if-64
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:37:49 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cfdb26b-075f-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 16:37:46 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8f86167d39so34139966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:37:46 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6e9e98ecsm72435266b.30.2026.02.11.07.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:37:45 -0800 (PST)
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
X-Inumbo-ID: 9cfdb26b-075f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770824266; x=1771429066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsWZxXDSoP0HHGKwmgpCs7TKIsCvDM/g8wB8y6XNHsk=;
        b=hny4bBgsIZII8I1gNUpZ87nnIbuEC3yWqE/2kuqWqqyS/2dIIGD6nooxcjxUYKe3ba
         pHQC2yy2j/LCDj2+Cz0jgSPykxwjk4LV0PpQr40vCVy2lqGqT+to+XC0l+f89mYbqjzK
         NGv5icSF3YK9rEQh3gEZsXLlgfP1NxNjyPThUE09jwt4IWXQtgfZo/t185ic6nwCcSgJ
         1ve4UVbkdSbF3n5txuOXKmwfrXMpX200M7MSkAFYTl97mf6lrwNTh1lYpoqUtOgXc5MA
         Ra6DDno4SUI771zFyZ7GQ9ZI3i9rXKTpZYlSBRBg7BX+12BrlkDTp5PIHxnQVClJyoSO
         Iw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824266; x=1771429066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsWZxXDSoP0HHGKwmgpCs7TKIsCvDM/g8wB8y6XNHsk=;
        b=FVq/f7MP512F4T3O+0h/1Paz9zHuJJnwRQml8dvqbSpjtK3Y7l9EHDf0tFM6TJBSyX
         VLWKrxlihHHtzFY+Lett7wi+txHbfi9w1zXjKTKaCVrPxXtoigkUftLfqZIfEvYdJ4wM
         ecuqNdc4AqDKLLvtFDzVZav8fhxiqQqGe4ZWsTY/6viThRWnhsFbEseIthA8RHDYUenY
         315mKP0Zvbxj2rySBEPNKZmOjihRA8Ao/bHssp/4HMsYnWhUMiCAnYgeDoFkLllfRCz1
         EulI5orgUlFz3Zv2QJVItxZPsO4FnrQLhK/KC92fiDyfQfzcQxvA3Qy66qyNL4HYkMP7
         TipA==
X-Forwarded-Encrypted: i=1; AJvYcCUW9pznzle91Iegq/nK0kTIUkw0gvIsP7dO32HzsTIpxb1cxTmzoIDyEM+ub7teD2E9izlPRw49Uy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2v5SYoeS5qlL3ykWPvb6QM87e82LoVTq4b2JkuAQsElDdFblr
	/F5NMvbzYOytdlZF3n7oHXHUPYexEqLOzooeq5liPGUNqFaPDpPXhBmD
X-Gm-Gg: AZuq6aLrpQDyikeXyaIwa+dWtj9E0PCJe8Pe0qS7Kwl1np95tP2gZHDZwAB0L0Y8CEQ
	9v8pHjYE+8mUe5uqE3Tau/FtfidxzAT9mADi4NMkHzvGh1FTZZCSy6LSMWT1fiolfzWEdOyB7xG
	UKvaKi5oYBPQDBeDm0mc+33YJDThumJDjKjc3OOBm7z2OtsEF5/a0+0V8i6JbcNk8jPyUDsXBIc
	CYCgiH7EBLmjbwgNGu0gLAh1Bms2PUhyyIdYycPCo0O1b3V3od1cDkzJspDkPUJk9L5KaX9uDsk
	0Wn6V3T7Wq2ZkCgCxevBSbLLjTkhRov2AZtkdl8fF9Ueb+sETOBtr3CkjPBCXcmbv5ntNHnX8+L
	vzyRlsEubfAUAsVBkdDW1y6L0s1spPVA3Iz9J1ylkQWxMGG2tXHkH7BVaqACic/cACCyW6hAf/7
	Tt3WaSmBKhMXr9geppzXAFk5uxLp1RXv6+s4VlM9ZbTWv0zR7GIN2yQl698I92IxUrKOBN8RBer
	BRKVUGUjCW72w==
X-Received: by 2002:a17:907:1b17:b0:b87:d722:f824 with SMTP id a640c23a62f3a-b8edf460ee7mr1182437866b.63.1770824265457;
        Wed, 11 Feb 2026 07:37:45 -0800 (PST)
Message-ID: <c60a3908-660c-4fa2-af7b-2a24b6dc3e1a@gmail.com>
Date: Wed, 11 Feb 2026 16:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] xen/riscv: introduce sbi_set_timer()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <3b102fd2267c629e8505631277efc2eeae5a1a6a.1770650552.git.oleksii.kurochko@gmail.com>
 <4304e4a5-c820-4673-8ff7-bbfdea54edf6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4304e4a5-c820-4673-8ff7-bbfdea54edf6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 79EF3125BE7
X-Rspamd-Action: no action


On 2/11/26 4:03 PM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> Introduce a function pointer for sbi_set_timer(), since different OpenSBI
>> versions may implement the TIME extension with different extension IDs
>> and/or function IDs.
>>
>> If the TIME extension is not available, fall back to the legacy timer
>> mechanism. This is useful when Xen runs as a guest under another Xen,
>> because the TIME extension is not currently virtualised and therefore
>> will not appear as available.
>> Despite of the fact that sbi_set_timer_v01 is introduced and used as
>> fall back, SBI v0.1 still isn't fully supported (with the current SBI
>> calls usage, sbi_rfence_v01 should be introduced too), so panic()
>> in sbi_init() isn't removed.
>>
>> The sbi_set_timer() pointer will be used by reprogram_timer() to program
>> Xen’s physical timer as without SSTC extension there is no any other
>> option except SBI call to do that as only M-timer is available for us.
>>
>> Use dprintk() for all the cases to print that a speicifc SBI extension
>> is available as it isn't really necessary in case of release builds.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one further request:
>
>> @@ -134,6 +138,20 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>>   int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>>                                   size_t size, unsigned long vmid);
>>   
>> +/*
>> + * Programs the clock for next event after stime_value time. This function also
>> + * clears the pending timer interrupt bit.
> "after stime_value time" reads as if this was a relative input, stime_value units
> of time need to pass until the event. Iirc values passed are absolute, though.
> Furthermore it was my understanding that the interrupt being raised is dependent
> upon clock >= value, not clock > value (where the latter is what "after" means
> when taken to apply to an absolute value).

Interesting that sbi_set_timer() has different description for OpenSBI v0.1 and v0.2.
What you see in the comment it is what v0.1 tells, but v0.2 tells that:
   
   "Programs the clock for next event after stime_value time.*stime_value is in absolute time.* This function must clear the pending timer interrupt bit as well."

"stime_value is in absolute time" has been added in v0.2. I'll update the comment for
a clarity.

Thanks.

~ Oleksii


