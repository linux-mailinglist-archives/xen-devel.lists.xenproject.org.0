Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEGFCc0j6mnKuwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 15:51:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5AC45345F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 15:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292121.1570696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFuSH-0002ro-EJ; Thu, 23 Apr 2026 13:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292121.1570696; Thu, 23 Apr 2026 13:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFuSH-0002pF-B4; Thu, 23 Apr 2026 13:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1292121;
 Thu, 23 Apr 2026 13:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFuSG-0002p9-8z
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 13:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFuSF-00BPby-Lr
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 15:50:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ea23b3-2eae-0a2a0a5409dd-0a2a4502bfee-22
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 15:50:55 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ea23bf-af86-0a2a45020019-d155d0a9b9b8-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 15:50:55 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38e7b8e3f38so55808571fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 06:50:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3905419b4f2sm19914961fa.6.2026.04.23.06.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776952255; x=1777557055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+xDF5Q/j7k749bHsNpY+XuPQYXix7H4Zz8qtwPDibU=;
        b=HSBjy3WoCqwCWKGWcftbK3hnYQhx47WMZHlb1XLk0+62Nvs4R2PCdzn/PyDorh1zfO
         /jLr4uLH8nqL3AtLnfNvkdL56/s/svhKlyEhQR+puStsQhVwdtSyalJ2J7htHXeDeKeP
         d6VwGY5FEgGx7UTlLcQamRYeSt8mQ2mZWvOK/hfcMce9vBpKfh6XwSaRp5G8EUKQQ8Fu
         zjqY2IqZBig6EJgVlddm5XHMgpEkXxiB9OchwBW7/vCLETFLcDsWn+abBalthRXRlfoZ
         fEHaBl5PrQYAMjNgWgHK9cdhkkO8pHDv/STYgJIywhfOZjfH+ko3CqogZlEyeLNIhR58
         NHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952255; x=1777557055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+xDF5Q/j7k749bHsNpY+XuPQYXix7H4Zz8qtwPDibU=;
        b=Jnbfzt3xB1ejT5Lxe51dj60tRUfJJYvtW/Hpz7AZbHRUNAObV1RLI1UALceOy77Awk
         BNfs062sceca/+HgCtkCfNwY5OJJJDgDND5toDDR7JrcPTsYcTtCUhUUr+A+exY5nJ5Q
         VM3OwrkhAw6k1pqSsidJJix31hPeWsNSl9KBXzU1FBPXh8netL/2avxcj67MUIlZJJq6
         f7aXQEXxhqk6BvMTPOlxfF36ABxwDgANnttYqWIHhPHWdSLOiC/Vmw5wTN1yu1z/G90K
         ivATXCj0rMvXeuvPdZPtCfpHSSvclqIyYQeZVEFkvqUe0I0+PR41kRtKyidoK1MWaRuR
         uchg==
X-Forwarded-Encrypted: i=1; AFNElJ/O+5gkOJnBeyB82rJiB8zNQg9N4MTMT5VI67sekUG0xscbb57AViSF8zL9G/ZuJAdWPF2edu2sYL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywb+oVv1kVmEJym0IlxZ5cpVHhLJ9X5GHekUNsjuAM0tRN2u1I0
	zAc9kAGySVx6BpkkHp/b8zVu8sttQFdvb2zOPvURkEFXmDh91WgOv9PQ
X-Gm-Gg: AeBDievN3p+iZlePfDXHgyfEBlvIgENyhpNd8S0TMmY0OcgDgE2IuE8Z28jU8/NqblW
	WOdT1YopHXIu7DTT+8tz5gI3DTBCQQjt4jvAsfs1yKI/cupdM1l2ts1VpAvk2YisxctmlY5/TXY
	Vo0hY0ZluyBQzmc+3Vmsw7kJMGT9boLsf0vW4eKUIOXwj7fZuD/XZzyUOMUUt4Gvg5+b9HaMoyU
	TkHHYIzNVhNgG5ByChE4q2+FjviQ8lPxUkDkAqcRsE5C5qEG6XMbK0ajo//LS2WXEGQrLsPzbnv
	wFMkauN2Q75KukvwRbSDD4SwJ/wdnphhOsBA6tzp1Q8JRtxZkwCFwxjW4kgYQbvcGEk5fdfDksL
	N+uJx9jkw9ejZ+MdzGOX8bj2LioJYdsI6zrlbICIfI0PJiuU6lm1csRvKgiCh0vj2ab2W2w5Ni/
	VXv4b6YPGbvJjEi8Bkh05Cky7I0F0cvqCbrcE87dQFKJNcQJOcR0zwahQ1ksLQ9KRk4gJ4vHO2C
	q+DCyXDUyWCjA==
X-Received: by 2002:a05:651c:b10:b0:38e:7c63:57b with SMTP id 38308e7fff4ca-38ec7b4f659mr84741791fa.32.1776952254649;
        Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
Message-ID: <d24ac333-2d09-4a07-89c6-e9c6a642f4ec@gmail.com>
Date: Thu, 23 Apr 2026 15:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] xen/riscv: add definition of guest RAM banks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <8280fe1a5effacd595d3dd69b2b11e06226411b2.1775836193.git.oleksii.kurochko@gmail.com>
 <a6d09913-3de1-463f-8143-69911af0150e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a6d09913-3de1-463f-8143-69911af0150e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776952255-8117D161-884621ED/10/73395122804
X-purgate-type: spam
X-purgate-size: 1514
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 8B5AC45345F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 12:24 PM, Jan Beulich wrote:
> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>> The dom0less solution uses defined RAM banks as compile-time constants,
>> so introduce macros to describe guest RAM banks.
>>
>> The reason for 2 banks is that there is typically always a use case for
>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>> there are other things under 4 GB it can conflict with (interrupt
>> controller, PCI BARs, etc.). So a second bank is added above that MMIO
>> region (starting at 8 GiB) to provide the remaining RAM; the gap between
>> the two banks also exercises code paths handling discontiguous memory.
>> For Sv32 guests (34-bit GPA, 16 GiB addressable), bank0 provides 2 GB
>> (2–4 GB) and the first 8 GB of bank1 (8–16 GB) is accessible.
>>
>> Extended regions are useful for RISC-V: they could be used to provide a
>> "space" for Linux to map grant mappings.
>>
>> Despite the fact that for every guest MMU mode the GPA could be up
>> to 56 bits wide (except Sv32 whose GPA is 34 bits), the combined size
>> of both banks is limited to 1018 GB as it is more than enough for most
>> use cases.
>>
>> Add inclusion of asm/guest-layout.h to asm/domain.h to make dom0less
>> common code build happy.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Again pretty hesitantly:

I suppose beucase of hard-coded layout, right?

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

