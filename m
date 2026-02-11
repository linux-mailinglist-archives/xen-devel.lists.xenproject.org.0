Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NwORE8JBjGm/kAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:45:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB08A1225C3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227088.1533421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5qt-0008Gj-P6; Wed, 11 Feb 2026 08:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227088.1533421; Wed, 11 Feb 2026 08:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5qt-0008FI-MQ; Wed, 11 Feb 2026 08:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1227088;
 Wed, 11 Feb 2026 08:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vq5qs-0008FC-QQ
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:45:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08f20b59-0726-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 09:45:36 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-480706554beso53413865e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:45:36 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm131629455e9.0.2026.02.11.00.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 00:45:35 -0800 (PST)
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
X-Inumbo-ID: 08f20b59-0726-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770799536; x=1771404336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRZ3bJGCiGlj1zLoCw8NzW/TaLoGKdE8ol+Ywwjo9iE=;
        b=FyzxnGjSmrbn7ch+GT+q0kVbrvLK0ee4Z20cHPMH/n0WaVPu3xAq0UqWlbhlO0UbGo
         yVLW8VsJUi0ruI4vRnHDUBtY22iGhof0ZR95bVvflxjb6BmYIHzfvst4db/eyr2S4I7k
         8RGMHxt01DutvofMOzOaLws08EEQNfVYWGQ4HjE8mUVy0gTbu6vPJYvbgHz+INT/EeJp
         BPDf8JYRIrG1YFMqtFDaeZUCdwa3xdEpRmi8CQwISwsbmt3I/PEgwWZSQZ3p6D5jedDW
         TNVC7M0SJWYcUTSXJSjhYMM/ULgPxVltdQVw4ouJhAaX/fD4VB29cQb6Uvx2/MDdiMbQ
         yMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770799536; x=1771404336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRZ3bJGCiGlj1zLoCw8NzW/TaLoGKdE8ol+Ywwjo9iE=;
        b=c5eHiCm6T2G3ZW4KgGuw8gx8M7vyX9X/Mg+S37h3/oxaJEUoz8OCrlrvRPZen8zuhj
         0pnRkGR3FLeJRYrIUDhKH3i84FR1EMUpQ+M7zC8iVBoQeWzrUuXDJOzUHJG1IjDrU4WI
         N7CmuUnm5m95BN0nsHB4eIHYzPZlwFJS+D8GcDtOcyawZwqEl4ATgSqMs/ZoFaalRkWi
         riyEWUPXLY2byXf7wHVMiuv4inBIwp9dlCaVl0stfzDkMvRbm3K9u6euSsoC5owYBk9e
         b24CZ+xlrHFvEb4afGSHYNx9UVsnYPnEnQxNcV5V7znMM5qD/63mlqc6oslBn2JYlVC0
         MYIA==
X-Forwarded-Encrypted: i=1; AJvYcCUxsGK8DYMoyOupitbIiUYSduy2LklXXetXLtzlwuz1T7Lqse0nJTAq/aWUJj+I5VTcIR58+Bvk90s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+SAz72lT2bfgvVMHA/Sye6j8oNbFHLCAl0sGaTlDXIo6m2AmC
	jgJvGVnEcSAFKPUONXvJC1njTkp8FaX4GKuWkzUHJFZcIchhRM6nMVG9
X-Gm-Gg: AZuq6aIQ4S6ZszR9oob4eQCayRiG2kiGR0l9RWpSatPZSOETmJbXqJwLmbgeVrADgvO
	zaVCyRDbbDR6y2yw+kLToYBhkNvM7x/U1xSqgfNJxGEZg0bRBQih/GtmdQBlJ12Q7rTu5FrArFK
	BnUaB1u6pxHl59dU2HXd+P8qZN8EGgA4xRPf9YqMVzGMg0YiPEfXXwnB2Oc+f2GS9+5ymHxaUAu
	8n/g/u91zQxUXA+mgLRlOZssif9yCRLj/Mzz7uNrtC8SIG1V4Pt6iK2wc38S3rgECf6d3/AKXFt
	50QCn2d5RxelEF/EMJijq3ZhnV1nw92en3fW2/SIhXv47PiYsF5mGlmnjK6TVL/dapqAE0+WI1F
	O0kJiN3BOEuZCWsL2Ib3CvMwhw9BVjs4iQ4OvRcAH9kiNplOPrKbvD1lSW7Z2gts7SMpkLKJhYp
	haBosNVZkCTwapImGcvs9uF223KIQk3QHx5QLT+26SLUERXQFz9TY7vbtMxWCS/ZGDz+TpQ1lAq
	naSPogsKzx/RQ==
X-Received: by 2002:a05:600c:83c4:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-4835b965805mr24659425e9.26.1770799535901;
        Wed, 11 Feb 2026 00:45:35 -0800 (PST)
Message-ID: <69653793-d8b4-4ddc-bd7b-4f3c41449789@gmail.com>
Date: Wed, 11 Feb 2026 09:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] xen/riscv: avoid reading hstateen0 when
 Smstateen is not implemented
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
 <d26b9103def3ff86524e1306c63cd84e217c8f11.1770650552.git.oleksii.kurochko@gmail.com>
 <e115459b-8f4b-4211-8259-7807765d8fec@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e115459b-8f4b-4211-8259-7807765d8fec@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: EB08A1225C3
X-Rspamd-Action: no action


On 2/11/26 8:22 AM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> If the Smstateen extension is not implemented, the hstateen0 CSR is
>> considered non-existent. Any attempt to access it will raise an
>> illegal-instruction exception.
>>
>> Guard the hstateen0 dump with a runtime check for Smstateen support to
>> avoid triggering traps when dumping CSRs on systems that do not
>> implement this extension.
>>
>> Fixes: 3babc8d2e546 ("xen/riscv: dump GPRs and CSRs on unexpected traps")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> It is, aiui, independent of patch 1 and hence can go in right away.

Yes, it is independent.

>
>> @@ -144,7 +145,12 @@ static void dump_csrs(const char *ctx)
>>         (v & HSTATUS_SPV)  ? " SPV"  : "",
>>         (v & HSTATUS_GVA)  ? " GVA"  : "");
>>       X(hgatp, CSR_HGATP, "\n");
>> -    X(hstateen0, CSR_HSTATEEN0, "\n");
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        X(hstateen0, CSR_HSTATEEN0, "\n");
>> +    }
> I was going to ask for the braces to be dropped, but I notice they are
> required as long as X() isn't properly adjusted. This is why even for
> local use macros we should take a little more care when introducing
> them, so they can be used without having to pay too close attention to
> their actual implementation.

It would be better to have do {...} while(0) in the definition of X macros.

I will add do {...} while(0) to one of the next patches where I have the same
case.

I don't mind to update X() in dump_csrs() in the next patch version to:
#define X(name, csr, fmt, ...) do { \
     v = csr_read(csr); \
     printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__); \
while(0)

~ Oleksii


