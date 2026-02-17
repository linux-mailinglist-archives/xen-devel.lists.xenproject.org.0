Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHbzGVuglGknGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 18:07:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA514E864
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 18:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235231.1538267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsOXj-0005ls-6F; Tue, 17 Feb 2026 17:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235231.1538267; Tue, 17 Feb 2026 17:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsOXj-0005je-3Y; Tue, 17 Feb 2026 17:07:23 +0000
Received: by outflank-mailman (input) for mailman id 1235231;
 Tue, 17 Feb 2026 17:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsOXh-0005jG-KK
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 17:07:21 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ed1ab98-0c23-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 18:07:20 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so39279865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 09:07:20 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d78cfsm776352385e9.1.2026.02.17.09.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 09:07:19 -0800 (PST)
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
X-Inumbo-ID: 1ed1ab98-0c23-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771348040; x=1771952840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8hBEerhUTDz0784f8ywQeDBOMxSN8X6elgEa2a5s6M=;
        b=ajnDmZ1l+FuTWcAi0FZkaaeve8RolZpRHYL3NPIUdvojI7bg4gF1uo4RHJtmYkEKzb
         fNCf6SFcSMMMrbfpz0uCqVPj3yaRCcXMv5qGoLtk46GrywddRaprzJkykaKdd9u+c0qb
         2SJAUlDg7sT0PeHjbswI4r3KUMw2TDrbWeyjcYo81Vry427k5nW9WA2LxZxFl894LT1G
         tIfuSaMOS7vblsdVXvI/3wqAM4TS773zpnC36fYVJXqA657k0ooL05vCZA/XHUODd2LY
         Plvt1vRWjbCeby0bDn8zri+Lj1zR9YmYtfoj0XHvMpWnCNVed8pj1svfZJH1r8AcrmUH
         2hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771348040; x=1771952840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8hBEerhUTDz0784f8ywQeDBOMxSN8X6elgEa2a5s6M=;
        b=Yo+OrwjQ5PWYxdtgD94NlSjk2CnyKIeE3WRQK8eLdr2b5sUBMc+sru+pXnzbvHvB1p
         NpcdkpFLbGjxDYp0eyGABWSkAOsNwIrCY8j9A/ax3mSS2eh0NIYR/ciC6Ni7oFDVITO1
         Yql+DBFw0NuhPptVaAOkMNxmlUDWDhPJhmgkr/ARc5z/TaeVpo48LzJk/q2OeRyk6Zk6
         HsmZZAHQjgiSw8eZM6azbK9b0yDtY95sRK8omyd5Q0dkClz6Es9bIjwtEses1FoT3fxz
         cT6CWKkvopU6afGsPHpWKOAS44YhEQKA2z27GT/EdpZeGeGhgWmj770FXAJJtVXr4+76
         +VdA==
X-Forwarded-Encrypted: i=1; AJvYcCVX04OFCEm7549c4UH9aVy4xQEfkJydC6UvClgtDj+wug5KP/Od3mDC0kDLcRQi5afvvba/ARYD35I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnhH6ieCarRC6uagFlace0gQbzfL341cp9oVMTolm47Z40iysq
	eKFCMUuFXFllfjb2bw7WrSFaLp3NaVWWrtrMEJKdX/FzR8qyrx60Ew2V
X-Gm-Gg: AZuq6aLQxclJ5VItuv7ywbxH2RExXHm5zLlnWqUq/vthXUH3M2oGj8WVp8UzZN8wNxx
	qBGipT9RmbIRUrFcLtBS2LEbh0nj8chXSoW4o7QLwtdiFepfLfqjPdRmsKWGhH8DQlhG3GY1+/c
	B6w3kuwWZx+142gVTmzg/ccwOtsF6XrDzS81syJ5Ek4/I6QGte31N4Motg73eE8grXGTWF4tfi2
	ZDlIoh6LTLmg2iQcWRz69jzLukVWYd8YDA786H9rqkZSdkcZ/7jUcxuSVFXuH0C6cRqsPoP5+1Y
	hnNVoz1iqCFPyn4MpEnyF3+bd6Ksp6aV/AV/Nd/fx44iwGoX89goD+Bg5qodcIK2NLxr3Q4rqrv
	uYdeY2Id9dC9sj9Ot+V+jcqitJnKhoUEwoy6NgRbXiW0FygdbLDeI8C/NXQk77wMgEhu0snyco2
	X49hK5xeSfPJL90WQ18Sb3BhyaYAdf+/aTtFNl4wtw1WYboHfxu0Vf+Bo6c2h2FM6n9dv29zTly
	pvmJrkyw09eiLbLSw==
X-Received: by 2002:a05:600c:37c6:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483710960dcmr250488735e9.34.1771348040037;
        Tue, 17 Feb 2026 09:07:20 -0800 (PST)
Message-ID: <e94e7bac-aa37-4460-a866-ae34f4bb98e9@gmail.com>
Date: Tue, 17 Feb 2026 18:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] xen/riscv: introduce sbi_set_timer()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <6d811ceefa3bfc4e6bd5d11b0a4d4eef886bc693.1770999383.git.oleksii.kurochko@gmail.com>
 <f45864a7-452b-401d-9e44-b6283b38eec0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f45864a7-452b-401d-9e44-b6283b38eec0@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: BDBA514E864
X-Rspamd-Action: no action


On 2/17/26 4:42 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
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
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes in v4:
>>   - Add "stime_value is in absolute time" to the comment above declaration
>>     of sbi_set_timer() function pointer.
> Yet it still ...
>
>> @@ -134,6 +138,23 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>>   int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>>                                   size_t size, unsigned long vmid);
>>   
>> +/*
>> + * Programs the clock for next event after stime_value time. stime_value is in
>> + * absolute time. This function must clear the pending timer interrupt bit as
>> + * well.
> ... says "after" when, as per my understanding, it's "at or after". At which
> point the final "time" in the sentence becomes bogus (says me as a non-
> native speaker). Which in turn is what my v3 comment was triggered by, as
> "after stime_value time" to me suggests something relative ("this amount of
> time needs to pass"), when that's not what is meant, as the added sentence
> now tries to clarify.

I will rephrase then the first sentence in the following way:
   Programs the clock for next event at (or after) stime_value. ...

~ Oleksii


