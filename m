Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PiVArAqDGq0XwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:17:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1857B11D
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312623.1582699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGZP-00015p-Pc; Tue, 19 May 2026 09:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312623.1582699; Tue, 19 May 2026 09:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGZP-00013Q-Mi; Tue, 19 May 2026 09:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1312623;
 Tue, 19 May 2026 09:16:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPGZO-00013K-AV
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:16:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGZN-0063tq-M8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:16:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2a81-5cb7-0a2a0a5109dd-0a2a4508a894-26
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:16:57 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2a89-63b5-0a2a45080019-d155da34a5d4-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:16:57 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-bd2e8931915so827525166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:16:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4dec855sm683729866b.37.2026.05.19.02.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:16:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779182217; x=1779787017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVuPvFrLuDHqFHmDaVdTRVjv70FyWOxPoTdW5TtPJ+Q=;
        b=fn+MjLTOkDyBsRpR03KlWHMqr6qlMdqzpJTAqBCRHJ7xSRNa2SXS4QxzDASVmIaCFP
         YIRYizuvft2PYdvuEdTDb8oawFlNqPpvkLf2dMBONQXXUX00FBKKI/nqKMiPzG2xsV2J
         ui5Ul+Pfl7NZd8Oco4Wr4QgVeodGWX+75XcTthk81vUhn42OE/tFBtiXUU4o72DaKuRV
         JYYid3yP12owX5B17QyLZI102jl3x35F47wTWMh9y1ojEtL36eLf0Qo1hPJc1K5h99m/
         yawbZcIeBX9RTup8FKZcb0lLP9RhPCd8rnRohB7UgJnaoaqFtHSHfHORw/rlBJw1lnpn
         ES+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182217; x=1779787017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVuPvFrLuDHqFHmDaVdTRVjv70FyWOxPoTdW5TtPJ+Q=;
        b=IfT2MabJgArTik8y6qRmluaof7Q947+JOXPzTtWu6uKxF7+iETEyGBGE/NNTGOL8PI
         HNpvpLYG7xGvIX5NAwkglpy1w6OP7/JH1q7TxCAidbJdwGCz9ezFY8a0rA7p2h2QtGhF
         tG5fdbW+v+MXhnBo/KUgsRf5wa7uFJtE+NSlPUyBqki4MrYreN2rG3ouMmChouyLY8lm
         algDyGbobjn6EDscgTwIJwdoZUojWQY7+B3DjOzvUQkX3Sjbwlaikaiqc7aHYyOeWhvo
         PC2BBafraifnTLhJitZzypdIByZj8LO1S9m7adX32e15Gmv9bydnSc23vEeCCRpD4Ord
         ZahA==
X-Forwarded-Encrypted: i=1; AFNElJ9Eg50WsQetRtr6pRPUwUmDmUDsrpZLiSrKydvEQm2fV42q2DdHLB/r8KD0huFPA4vlgD1Dwxygj4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqemZkTfTHDo5ryMtebjHRVbppqFEJPr68/GqNPKi4F+hPeHw0
	vEi1Zw7cqx/SezQ+M5C1Ad2dEH0D85n7Nvp/iaN63/9hRcRTSbTDXJxn
X-Gm-Gg: Acq92OEK8yTo90DxO/CdghOul2OUhJiRT2jor6RrhmiICMK2nQG5seVzS9lIBC40XAx
	UZZW7C1C5RsjQswM5qN6Lyd94I+xDOvBJYaUj70fSPNqI4jkAeigQq+mJOBEwd+ZvSaZbj3tgqW
	SIwWkjodzU2qpbqZw0mcpOT1nm3YRstt5/87vrsYJwbaxBs7bp1GMNXm66DpefiS3fKbideZzav
	gg4mhzR57BMjfuommUx/KZXI4PnEpEnT9AeVOeZbPuU/+ZnzO2aWyEJChyLOemI5P4DwFXYlv4c
	x0qtNvPQMCnNw7n16qcLsOTozs6twFNndzL/7XdHgrTJpwA5uYLJXWd084MypPlC64sf0JXhYeq
	zz3fs6V69cm1j9dtbeoNnYFpKkNz5uUPU3yW6qU0IwA28VUko5sS6kQiHb1l6/2LX+Z+GmqTz3E
	6Vqg9lu0LCM3TgQDobPI2txnDXExNf+3U5ocOsBpFiqQn6mIbUJOi8NCknfdoVqcZLimwJmyoI5
	Bk=
X-Received: by 2002:a17:906:fc10:b0:ba7:41d0:5efd with SMTP id a640c23a62f3a-bd4f34bd0afmr892027966b.28.1779182216989;
        Tue, 19 May 2026 02:16:56 -0700 (PDT)
Message-ID: <e943765c-45f6-4802-bef6-e2fffd49149e@gmail.com>
Date: Tue, 19 May 2026 11:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/libfdt: fix UBSAN null pointer in
 fdt_property()
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
 <ca61a607-2f55-47b6-93f2-c25079dfd88b@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ca61a607-2f55-47b6-93f2-c25079dfd88b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779182217-C487BDB1-D3960650/10/73395122804
X-purgate-type: spam
X-purgate-size: 2387
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50F1857B11D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

On 5/19/26 10:49 AM, Orzel, Michal wrote:
> Hi Oleksii,
> 
> We treat libfdt as external library and we don't accept any edits here prior to
> first sending a fix to libfdt and then cherry-picking a patch (in fact, afacit
> we then do the libfdt version update).

Thanks for clarifying that.

Just to be sure I don't confuse something.
According to the commit ...:

commit ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7
Author: Vikram Garhwal <fnu.vikram@xilinx.com>
Date:   Thu Nov 11 23:27:20 2021 -0800

     Update libfdt to v1.6.1

     Update libfdt to v1.6.1 of libfdt taken from 
git://github.com/dgibson/dtc.
     This update is done to support device tree overlays.

... I have to send this patch to git://github.com/dgibson/dtc, right?

~ Oleksii
> On 19-May-26 10:39, Oleksii Kurochko wrote:
>> fdt_property() unconditionally calls memcpy(ptr, val, len) even when
>> len is zero and val is NULL.  This is a legitimate calling convention
>> for adding empty FDT properties such as "interrupt-controller", which
>> carry no payload.
>>
>> In Xen, memcpy() maps to __builtin_memcpy(). The compiler treats
>> __builtin_memcpy as nonnull on its pointer arguments, so UBSAN fires
>> before it can observe that len is zero:
>>    UBSAN: Undefined behaviour in common/libfdt/fdt_sw.c:333:2
>>           null pointer passed as argument 2, declared with nonnull
>>           attribute
>>
>> Guard the memcpy() with a check on len so it is skipped entirely when
>> there is no payload to copy, bringing the code in line with the
>> nonnull contract.
>>
>> Fixes: f0ea06558068 ("libfdt: add version 1.3.0")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>>   xen/common/libfdt/fdt_sw.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/libfdt/fdt_sw.c b/xen/common/libfdt/fdt_sw.c
>> index 4c569ee7eb0d..96d4cf571319 100644
>> --- a/xen/common/libfdt/fdt_sw.c
>> +++ b/xen/common/libfdt/fdt_sw.c
>> @@ -330,7 +330,8 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
>>   	ret = fdt_property_placeholder(fdt, name, len, &ptr);
>>   	if (ret)
>>   		return ret;
>> -	memcpy(ptr, val, len);
>> +	if (len)
>> +		memcpy(ptr, val, len);
>>   	return 0;
>>   }
>>   
> 


