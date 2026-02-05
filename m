Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LY9NEldbhGmn2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:56:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC04AF0234
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221636.1529819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvA4-0006q6-V8; Thu, 05 Feb 2026 08:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221636.1529819; Thu, 05 Feb 2026 08:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvA4-0006o7-Ry; Thu, 05 Feb 2026 08:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1221636;
 Thu, 05 Feb 2026 08:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2u=AJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnvA2-0006o1-Sr
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:56:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d35f34a-0270-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 09:56:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so4059125e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:56:25 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831d0b5b31sm14514165e9.4.2026.02.05.00.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:56:24 -0800 (PST)
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
X-Inumbo-ID: 8d35f34a-0270-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770281785; x=1770886585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IX5G5FK8ZKsLCPCdcCYVvvPMN5D61IxxVz3Nkm5eZw=;
        b=LUo1hPAmzRIz0l/DecXUvaQ7WnMRf2oQpFdvKO2ngY6ixadb/o83/UNChnnxjWa+vW
         OtlLhlKMG+plRjw+75nbq8Qfz7imqbzA9k5Up/WA5YM+/MowE+d21lI+JMumjKsuMcDt
         SAKqrjzaxzEw6TVn2ieJGn+nK0MFeM8v8rlcx/u+cxK6T+DdLgug57bpARgGIXeKjP7I
         ZD5OGwaa8QUDQx/J4lD8lfi2i3XFKO8rPbuQ11hrQ/586a/YN+/cr8IC9X56j1dnw/af
         HJ1xAIce+Q0kud1qqYJZDMoYu3fVuB12Hv1Z99mKjiD8qzW7s+x1NyEyC2pSnV5t2hMn
         7PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281785; x=1770886585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IX5G5FK8ZKsLCPCdcCYVvvPMN5D61IxxVz3Nkm5eZw=;
        b=EKlp4vMMaWdyuxPudNqeFzAs64yd+Mx9Qtikx+OugAedPU0TZLa8t82w6Hw7w/RCn5
         P8audwC5uqAcOyrzPv5wh3zSZlmjNRtZKBDVCSyyS5fiL0+pgRr9yOsEMqeQQydF1Q8n
         YODPe9tEbf5zLm33ckLzzrnKhKU2X/PNSBnQW7/bKuT0Kj8KMTY+NUnSajCcvUp09ac1
         yKbUkGcY5BelGeiWonn6k+oHsZ8MVUaXgrGuWFqTCmcq6KoKX/l55LM4dCmDt2yjxIZF
         5ciG2H731Cthw0UPPAp3Vi3mhII1skHdOAwZpd62zRmVEq+MPpN2NpCtzjbCGc+IW6bm
         SzFA==
X-Forwarded-Encrypted: i=1; AJvYcCXR+XmNZLLkr0zToGrCTPbXgb9mwr2FOwlfMWN4SzQwv6DzXrZcrhy/CC4c/Rf6NKrSVqfmhkQtpBk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyuc8vKSSqfGLb3kRnelcxZeD7JCd5WZ/lwc37t+7SGkNcmqAt4
	ae/G+DzGs3cj71YiWeiPoPPltgSUsraLU0Qu1EGi3uLatY1Ncep0ueMZ
X-Gm-Gg: AZuq6aKBQKa2UK8T78CQMl/VlKwvUgn8tdaLtcnwOqHEmemesIg9wtD90oCzIZNpZOE
	6G1FMAej6e1id/b320NnMYCypoAJkoPXzl6u29DYEMu2BLV6lfHDOUBiV7C2berumRWyxqTiEXV
	/F4hARXb1KWXrmDX8PAqzcipWTJbR8rmnK/SIeJIYYCnTJJvr1ZaxcmhxJ7YhR5kjthBe1ZGgLM
	PH1AITs4pQJDspGqDpxFmg9Yn+TX3+TI1yL0BWVqRaNkv+CWWscuf+0sNXcd4y4mp+IMWMiG6vT
	fvUvzDwESe1suvw5hy2K/BRTsz+MCvJDz3zpAsa4wDXMSfx3FzZn8y8vOho9gI2k+OmNPutjt07
	WNIOBH4j/fn+zWF9XCR1MhRF310rLplQlNnTT9K0b1u3fvf+ct/vInKOR/N2pEMc1SL4MR0I8Yu
	09zoiB4a6vSV/BaSEdd8PACIpRMsWNR+mt5lZncgkDfFGY3p2ozfaTnAA+Oyr9aWs=
X-Received: by 2002:a05:600c:1e02:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4830e948cf0mr81176205e9.10.1770281784769;
        Thu, 05 Feb 2026 00:56:24 -0800 (PST)
Message-ID: <060f4338-d6ac-41a1-8036-ab506cd54bf4@gmail.com>
Date: Thu, 5 Feb 2026 09:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add support for local guest TLB flush
 using HFENCE.VVMA
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <89f50ab2c1a1c79abea4db3a53393f974bb9a473.1770036584.git.oleksii.kurochko@gmail.com>
 <309e4e0d-c2a3-4f56-ab6f-f648da313bb6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <309e4e0d-c2a3-4f56-ab6f-f648da313bb6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EC04AF0234
X-Rspamd-Action: no action


On 2/4/26 12:09 PM, Jan Beulich wrote:
> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>> @@ -14,6 +15,12 @@ static inline void local_hfence_gvma_all(void)
>>       asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
>>   }
>>   
>> +/* Flush VS-stage TLB for current hart. */
>> +static inline void flush_tlb_guest_local(void)
>> +{
>> +    HFENCE_VVMA(0, 0);
> For this use, ...
>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/insn-defs.h
>> @@ -0,0 +1,10 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef ASM_RISCV_INSN_DEFS_H
>> +#define ASM_RISCV_INSN_DEFS_H
>> +
>> +#define HFENCE_VVMA(vaddr, asid) \
>> +    asm volatile ("hfence.vvma %0, %1" \
>> +                  :: "r"(vaddr), "r"(asid) : "memory")
> ... don't you want to use "rJ" as the constraints here?

Even without "rJ" it is using x0 when argument 0 is passed. Just to be on a
safe side I don't mind to add "J".

~ Oleksii


