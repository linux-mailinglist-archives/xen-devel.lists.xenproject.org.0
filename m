Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPz9MqYUDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:43:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081A579510
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312502.1582600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF6r-00080x-Bh; Tue, 19 May 2026 07:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312502.1582600; Tue, 19 May 2026 07:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF6r-0007yU-8W; Tue, 19 May 2026 07:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1312502;
 Tue, 19 May 2026 07:43:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPF6q-0007yL-Fg
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:43:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPF6p-00BRVh-Rm
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:43:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c148f-5cb7-0a2a0a5109dd-0a2a45078b64-18
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:43:23 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c149b-229c-0a2a45070019-d155d02ccd14-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:43:23 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67c1e0229acso5338770a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:43:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4e21235sm665912566b.43.2026.05.19.00.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 00:43:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779176603; x=1779781403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U67Y+WBfxsx3bNgtn4VyTq7TZtw0qP5joQfLchg05Dg=;
        b=kNOS7giwfrS9xd/axhcT4eF5MHTiGxWTj8w75lIWQekdl6Mo0urzdY89CxIR1DkCbi
         eCygLfa4pntxxycZTyPIbpEUVlq9cXUnhaLrV8QeBREu6XKgkU6cKZ8zkNHYmlbPCvtM
         j4NsZDkRg9WiSBtriRxMrrBR4BqRcReBZwSVnYSCKbz6C+kTwid3wv+ufgiPl8RTpYQW
         TXXUV99Kpxq7xsILr1J1puQiTIvfM5x9V6snVqcifSVWiDvhnVH9lbf9Q2hqpwxcMdzV
         sgcOgEVPpbQPGQLqmqokRLGqNUVyo1bPt7TBy6bFAcxUUelkGtNlxqBt5twNyZ2zUq2V
         kRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176603; x=1779781403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U67Y+WBfxsx3bNgtn4VyTq7TZtw0qP5joQfLchg05Dg=;
        b=bInAQ/tKDUPV3ZhLL9QWuKat1rGT7g/l2lvsd8ltxaxR+BWunarg2N4ZlbsJ4W0Fil
         V1jA0OH7++iPXnACnHYVOPvD/z2E+OF/QXSW+taJ8B5FHfKkJU33SRrNshiBnlf9jhcm
         FdqfL1eVYSTSKtfUA4qnhZhwGIoAwt7b5M80Dlhyx5CvhZIerus98ReTds0LEfRgGojC
         GzIOfDmld1wP9wdCKg3Q7vGEo95QIy3cBJ3xTzjwu0Fev3SDAsrdhKDI/DE6halOzXtH
         /ZVkeag6rZFgjerFKGDQTs5qHw4E3svowIR2VeDVy1z0j3KWgvL/X1l/xDTxqpYgzvIf
         P4wQ==
X-Forwarded-Encrypted: i=1; AFNElJ84WVXc0ASJYhYa3xGUoiDNMpJblnZTfAzC69ury4WRMm/Sz4rUDf1Ai1iu5fVHAHuiP7yXB97/R7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbe7iF8kEBs3p94N+7UUb7/oU+bXuEO1AB9IPpcvy3U/ejyUW2
	zWzlA/3BahjANoPCGYLSqVWcAeVHCt3Lw4rWcCJjkxtOf7jQY9pDCDpb
X-Gm-Gg: Acq92OE4v3mXJjaJxiLUUsbk9Us3+w1CQDmWxeghIn6K42+7wumhUXxQ07rRzWP2axc
	aV5kKj1O9elub0Pc7EVPiOkirqH5FCoc7jlqKaUT3tAmCYcB9UhU1g+uFO5rVkn/9Hc/rThcExK
	wWuEr3DeUigls3ZqJngbM8hsdSG4JjNnd36w+HADLTslzLzpbkoTTUTdNphBBbMmgnG8XnAk9vg
	92WO7Xdejst3z21RamDC3agJMGyNzb0pFS4hpXvrcRz/ifbC/vWLwaYnwx38KY7WtEOwc7PsWSy
	sc0V7r+FaubqwEbSxQx/ch9CMX/ELrmmwz3HPAd2c10OPhEkrczG2XanaECSjypuDS9VR9q6BuK
	NVEldYQUMDC75cPwjE/7seOHl3ctbBYTV8PbBL1ocQ3dYqX6APys2ubYj7NBfHGC3fDRc7hDSEN
	hk0XCg1lO9txKxwrpONfgT29dGn9F4w4veiBG+dYw1YfcKNMDYk8JrYGcadDdo9LktwnXYq+hd1
	EI=
X-Received: by 2002:a17:907:8325:b0:bd8:f4bf:76e2 with SMTP id a640c23a62f3a-bd8f4cec6fbmr174028066b.48.1779176603045;
        Tue, 19 May 2026 00:43:23 -0700 (PDT)
Message-ID: <79b48043-baf2-4c42-aabe-062b40b3057d@gmail.com>
Date: Tue, 19 May 2026 09:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Wait for redistributor RWP using the
 right bit
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Mykola Kvach <xakep.amatop@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <mykola_kvach@epam.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com>
 <EDF5B3D9-F532-4D8E-B156-172649433AE9@arm.com>
 <alpine.DEB.2.22.394.2605151436280.52999@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2605151436280.52999@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779176603-09364C48-4939A2F1/10/73395122804
X-purgate-type: spam
X-purgate-size: 1430
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:Luca.Fancellu@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,epam.com,xen.org,arm.com,amd.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4081A579510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/15/26 11:36 PM, Stefano Stabellini wrote:
> Oleksii, can we have a release ack for this fix?

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> 
> On Fri, 15 May 2026, Luca Fancellu wrote:
>> Hi Mykola,
>>
>>> On 14 May 2026, at 10:08, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> gicv3_do_wait_for_rwp() is used for both distributor and
>>> redistributor writes. The CTLR register is at offset 0 for both,
>>> but the RWP bit is not in the same position.
>>>
>>> For GICD_CTLR, RWP is bit 31. For GICR_CTLR, bit 31 is UWP,
>>> while RWP is bit 3. The redistributor wait path was therefore
>>> polling UWP instead of RWP.
>>>
>>> UWP covers upstream writes, including Generate SGI packets, and is
>>> not a substitute for redistributor register write completion. The
>>> existing redistributor callers need RWP semantics for redistributor
>>> register writes such as GICR_ICENABLER0 and GICR_CTLR updates.
>>>
>>> Add GICR_CTLR_RWP and pass the expected RWP bit to the shared
>>> helper.
>>>
>>> Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
>>> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>
>> This looks ok to me
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> Cheers,
>> Luca
>>


