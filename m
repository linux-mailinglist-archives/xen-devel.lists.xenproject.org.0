Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGheLi/l2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:55:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2852C3D66D8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278847.1563563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBARq-0003fH-PL; Fri, 10 Apr 2026 11:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278847.1563563; Fri, 10 Apr 2026 11:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBARq-0003dO-Mn; Fri, 10 Apr 2026 11:54:54 +0000
Received: by outflank-mailman (input) for mailman id 1278847;
 Fri, 10 Apr 2026 11:54:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBARo-0003dI-T2
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:54:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBARo-00ENUK-8u
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:54:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8e505-5cb7-0a2a0a5109dd-0a2a4505b938-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:54:52 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8e50c-3760-0a2a45050019-d155dd33d81b-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:54:52 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so1220313f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 04:54:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e469ddsm6902713f8f.17.2026.04.10.04.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 04:54:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775822092; x=1776426892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kh6qrRMUEM2PKK9p9IRkh+u5YayQn9+4KQxesXCq4ho=;
        b=WPPBDhPGtvpTegKdsm8h6oGkjZWPlwHixAbxY3Lfy1ezP65lmmoam/fIt665PbAhhk
         100ZPDQ7rdwnwDJcOSO12+QhtqFpASG7f31PEcg39O0qoWiKSA7CllI4u2KfvOE6gPjZ
         EIYPJ0fgybBAtoIC65nHiWrIrlCQP47xg4Fwz64vCZhC67KcnNMG/kMKjR5yGRLScGBn
         zmU6CLmqxOnyTGTbxCCLh9b3WVdw0ed1HqjzSlgz8K3ykVTo5DZK0EHQ1z21TneM8yN2
         o86DtH9wVRAtYn1lW6zMImSGMpUSgMAnXkbEIWMh34Sj9BBWgL17NrJG9a9vlssI2LG3
         /RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775822092; x=1776426892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kh6qrRMUEM2PKK9p9IRkh+u5YayQn9+4KQxesXCq4ho=;
        b=S4JvRfQCPxBcXbvjl/70/x2e6ZvDwp7TmYR7+DVS/4gqJoHLsIcmvoQIhpDtiYoybz
         uWj8SarUDMW7NQW9hio8wIFmSopU5glSlO8V56FADcHCnmATSc+OQDzWPl0kEQkUUUIY
         szzqLbmM5jrK0vk7zhWeDv/AajKSTDV+vKphQs5MswhUrDMszt9N/mITDmMNNZJQEiDF
         mEL7pDdKZWi8loqqM2VFYhCPfd7uyIJYgYIwBT8M7KdfiK7fZ2Xjv5VcHJhc0jWEpPTW
         3PQ3ebgiHjoLN+L3aGANsPzipyCmsb0BW1M+xN5ls8P0Cezog+096Uhb8qg8EBtXaL6L
         t9QA==
X-Forwarded-Encrypted: i=1; AJvYcCUy9cIPjBSdc+BFu3P63BPXnBxbEWWVeArQY5L2B4S1L8xE89GQL6VwBZ3hi/pytEAB1dGaF6jQ3ig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM6v8GjjQ2y5bq/DeLKFg8B62ZLRq4tP27P71GMbjqZk9xV8a6
	L44VRdDvOrgHYhc2fZMlheg7and3nKhMWZ3nMtRLjdbVdnYkB6mfwk2w
X-Gm-Gg: AeBDiet9ii9IuMVUuz2wuNWXsUeUiXmanJJeICfSrGv62IxhV8JRZB9i+Y9OUkr7t2z
	J9YUyxrB3z16ffqZxG5Qezx4ZCFx5SVxSAqf0Bgn815kaABsl4ySyq1suG6chl8RF2pJxNP4ITj
	bFymUwhFjLsGw6lPFP43n6rha9J6OAYO97C8jh7Kb+85kRPNFXJUehRN2/Wa+yRlC1Sx0YyUQna
	A2pvj/AW8QbyWtEpcZ4W4uVRKrR25KDXIDKCbC7vZKmRiMSWUvi8K9Ckg4YtEC5Q8ZPdDftd6At
	jlK894ojSoN3L69vWU5x946Hnnb4NAoDqqIJGZNYTn3f8rHbeTa2TETtD69eS/jy4+ZK8Iz/liH
	S1BMHBEWBs4OEPtBb6GNgOV0eY2c96yMaUFp4pRzV2qlan4k2j1Mrzzm47eyipkEDBnLAqT/AXh
	l30n/V+Ex6JcUqumoEluUwibuNHBbcN+r8ePKBfxDPiNAxccL0q3QfnR45hziLJUWreeHwIeDE9
	6A=
X-Received: by 2002:a05:6000:186e:b0:43b:8f38:3b88 with SMTP id ffacd0b85a97d-43d642a989bmr4442598f8f.25.1775822091473;
        Fri, 10 Apr 2026 04:54:51 -0700 (PDT)
Message-ID: <b46e8b04-f5b7-447c-ab54-c653db0ee223@gmail.com>
Date: Fri, 10 Apr 2026 13:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/27] xen/riscv: implement make_timer_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <f1b759f4fa43f3a01ede0f99f21c3ac59b61f438.1773157782.git.oleksii.kurochko@gmail.com>
 <7a491f02-e9bf-4eae-8962-cc2ecd264d96@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7a491f02-e9bf-4eae-8962-cc2ecd264d96@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775822092-30D3796F-DACAFF79/10/73395122804
X-purgate-type: spam
X-purgate-size: 1773
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 2852C3D66D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 4:24 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> The make_timer_node() function is implemented to return 0,
>> as RISC-V does not require the creation of a timer node.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Yet: Why is this needed then in the first place? If this node may not
> be required, why would the function need providing? Shouldn't the call
> site be conditional then?

Generally, in DT for RISC-V there is a document which describes timer 
node (riscv,timer.yaml or sifive,clint.yaml), but the driver 
(drivers/clocksource/timer-riscv.c:244) is declared with 
TIMER_OF_DECLARE(riscv_timer, "riscv", ...). It matches the CPU node 
(compatible "riscv"), not the timer node itself. It then does 
of_find_compatible_node(NULL, NULL, "riscv,timer") only to read the 
optional riscv,timer-cannot-wake-cpu flag. But I don't see too much 
sense at the moment to enable timer-cannot-wake-cpu option.

Regarding, sifive,clint.yaml basically it has almost the same as 
riscv,timer node but also additionally provide some MMIO which are 
acessible only in M-mode (what isn't the case for virtualization as 
guest isn't ran in M-mode, otherwise emulation of M-mode register will 
be needed).

So potentially some will want to  add riscv,timer node to enable 
timer-cannot-wake-cpu option, so then some changes additionally should 
be done in this function.

Considering that it isn't needed now and timebase-frequency property is 
always part of cpu node not a timer one, I think we can go with an empty 
implementation of make_timer_node().
I can add some extra information to commit message.

~ Oleksii






