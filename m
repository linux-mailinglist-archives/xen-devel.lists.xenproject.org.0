Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNJUDhpsEGqgXAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 16:45:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966395B66A7
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 16:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316944.1586278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQR82-0004o0-FO; Fri, 22 May 2026 14:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316944.1586278; Fri, 22 May 2026 14:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQR82-0004lh-C1; Fri, 22 May 2026 14:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1316944;
 Fri, 22 May 2026 14:45:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQR80-0004lZ-HV
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQR7z-00BJsz-Pf
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:45:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a106bfc-bab6-0a2a0a5309dd-0a2a450ce602-18
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:45:31 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a106c0b-62f1-0a2a450c0019-d155dd35a91c-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:45:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43d75312379so6260020f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 07:45:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d64eb1sm5793435f8f.32.2026.05.22.07.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 07:45:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779461131; x=1780065931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STyaRvKhTozXqoLfkbrDQqduof+yyqqxlgDvec/2U9Q=;
        b=PGc4wgsSKcfVlicLoKeP158FhA1cclHuGoL0sK0mTWgJH7GBOjXLY97FgpTBZDpc7E
         m2gc6GaLPhfLTPsynQh38qYc0KCYtLqUhpGECk7r0SH9ZFWB0RT6FAaAHNTuqxL6IspO
         srv/xun8odTMh/DsWCBqg/tz6LLFPKmIbNZSvkYBasUPFr9ivZWscvoYEflKftz8KXA+
         Lbf+fapatsYwaYS9aVKzbxmdXHFWIfvFJU8HuVvhBrPpFHxjAvnHU7DRd//TvYXhFnKy
         m0/YJ6sLq7MpTXcM32Yz1btObKwctt56PwS0OLOMGpDH/DcqHf9PTXa9ikB+M3dxKIOd
         Fpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461131; x=1780065931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STyaRvKhTozXqoLfkbrDQqduof+yyqqxlgDvec/2U9Q=;
        b=eAedslAT2rsNsH22HbJhu9IRdMiApIt+d1oV4R+qNcD7S1FdQjQHfqY16r8xwAJta4
         ucFY9uhR+UQoKEzPTXGn5lXSxRGcb3i/5jEHrAdeHAwMzZMIsiaxRsRs2QpjGlFiGG8g
         A6+/IKX08KrrDdRyag/6FAhm6KyRqLBONr6hAnBviYaUvTLe9onkvYQ9jNNOK0U9VlDN
         RAv4jxcEfleN//RTuDoYo4Ydp0bhPbtgQlAOQTdPgg0e+MJ2UsVES2TjTncdmpHGvo8V
         SaseJg0ZPea1Avdnr5uIOy/m/YZH5RfO4oIXQxzvfzXcAKiU5oXXpWrwaYwNiIp+Is+7
         +/Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/uquasgDV1FEkM/dzaWjFbgWsLoG2IYZmowY7AYMRXxS4roEWJG/AStqu2gA2XmNNI5PYQP6FBKOE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXANwMnBFTzOTJs1KDZct5iarc2jxlaNV9IgZRPVLIlc330DS7
	o5wS8HFVwwS5x3T3qLzRFxpnra3C3ynJVHlXsgrY4zQ/z8/TLJBH2YUi
X-Gm-Gg: Acq92OE6w6iAVt23Wdkjp/2tP1zXrYjyWZ3LyUhi5DQ6UTCAjDlkZDFiIOiDTanfxlX
	4nwQhMsINGSdyv47l7k5S+FsxJBh3UiQOflHMNtv4hA3KnzwrtJ6LiXpIZD1BA5YTf1hv/816/+
	9bG6Ru7mGyeRoWBtfomA/lrc8Ql77oYSsNwedIy5rLCp08PH2fzqrJFQYOeC5vjyRMgAJCoq76y
	YtoEC5QZpxBesBuiAr8Ph0zcXe7XOVywwvlbSRM3DSO7gIOkeud8TEa/Pq8sNadaYEDWKZrKso8
	oUelqf35ONIDhg8BaDFqCkNZMHcBOcj7jEyba6NeyAxjbQ1PZGrRvDmw81zvw5OrZbgF/ropKIT
	v4+PKSrurtpMGghNp3LrgJ9UVaS02uTtw3dkSelHcC2/0mMgz87RwGzl6KWVQWB8Yr3L5pPetzK
	LCmlddiNUmOczwv3RuuBOiMvW3/ud+BfpMBQhx5MEQx3aoYtlgSL6hWk2RdlmnpIrZtmsHdKwB0
	e6D7cxuQe/of5t4sLVccDKT
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr12730258f8f.27.1779461130745;
        Fri, 22 May 2026 07:45:30 -0700 (PDT)
Message-ID: <7e341326-0d58-4796-9b0b-5901805ae09f@gmail.com>
Date: Fri, 22 May 2026 16:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/26] xen/riscv: implement make_intc_domU_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <425157c3414ca95665288fa3788430e96a99e3cd.1778250616.git.oleksii.kurochko@gmail.com>
 <ea7d6009-8494-4510-a5eb-b07fa6b8d6cc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ea7d6009-8494-4510-a5eb-b07fa6b8d6cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779461131-E2776CF5-59B1749C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1527
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 966395B66A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 3:30 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> @@ -46,6 +45,15 @@ struct intc_hw_init_ops {
>>       int (*init)(void);
>>   };
>>   
>> +struct vintc_init_ops {
>> +    /* Create interrupt controller node for domain */
>> +    int (*make_domu_dt_node)(struct kernel_info *kinfo);
>> +};
>> +
>> +struct vintc {
>> +    struct vintc_init_ops *init_ops;
> 
> Pointer-to-const?
> 
>> @@ -73,3 +74,13 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>       intc_set_irq_type(desc, desc->arch.type);
>>       intc_set_irq_priority(desc, priority);
>>   }
>> +
>> +int __init make_intc_domU_node(struct kernel_info *kinfo)
>> +{
>> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;
>> +
>> +    if ( intc_hw_ops && vintc->init_ops && vintc->init_ops->make_domu_dt_node )
> 
> Why the intc_hw_ops check? The variable isn't otherwise used here.
> 
> As to the other two checks: Is it plausible for either of the two pointers
> to be NULL? If not, merely ASSERT() or even build upon ...
> 
>> +        return vintc->init_ops->make_domu_dt_node(kinfo);
> 
> ... NULL derefs to fault anyway?

Specifically this pointers can't be NULL.

Generally it would be okay to just have have NULL derefs in runtime but 
there isn't guarantee that some register which will be useful to debug 
where NULL deref happens will be properly filled. I faced that several 
times so I prefer to have here ASSERT().

Thanks.

~ Oleksii

