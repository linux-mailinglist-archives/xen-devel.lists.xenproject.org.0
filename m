Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gADSObKHymn09gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:24:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380935CC32
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267710.1557163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DXh-0006qZ-AZ; Mon, 30 Mar 2026 14:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267710.1557163; Mon, 30 Mar 2026 14:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DXh-0006nz-6m; Mon, 30 Mar 2026 14:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1267710;
 Mon, 30 Mar 2026 14:24:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w7DXg-0006np-8O
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:24:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7DXf-00Fkms-K6
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:24:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca879d-bab6-0a2a0a5309dd-0a2a4507d07e-16
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:24:35 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca87a3-fd74-0a2a45070019-d155d02eb800-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:24:35 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-66c1d0f2b2bso477582a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 07:24:35 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66beb39e725sm1347328a12.0.2026.03.30.07.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 07:24:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774880675; x=1775485475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=llF0PfPj1ZVfl5h1xnqGfZXBub4oIKkESisjLyDj+Tk=;
        b=ik2IRTOmlFqZHT4d9BziLmQhQIEW97fld24ijNl0vDMW6pPqSbvWFX/HLIiLRt9Wkf
         AF43lYWIW4zVQvyQ/YeGuj+4t50Um1+7gufrlY2bdhZNKptDcgWVU10zeeioJBd/K8y1
         jy23j8t3zG9kOvKFVsCOgXmRbID5cVgQTorTec8vFTKTfiMuRSRmoaMZa3va0I09Ux10
         LP6sx6tZZPhXLfGkUraeJ5Otf7G4AEKI0b6DEj8RVn/Xrlg6ixf+aaTsyEVX8xQir91w
         znnmZ4dNjyJW2QnTBQGuqZ2Gd5f9vkke0hK1WpsMpdKZ0JxLnP24r7EOm0/g/pn46Thr
         HPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880675; x=1775485475;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llF0PfPj1ZVfl5h1xnqGfZXBub4oIKkESisjLyDj+Tk=;
        b=qf9D2Ldtu9T0txfmmpGhdAPTlJ4T7ZOQQU+5l+kpYCyIAniD5qchPaGqrCl4po4Geo
         jIuqMMW7FxMcxl6lKHhmZxHvHIerveYVlNlQsYGpGqXoOjq7H66wY3ais9TXd8IuTCKs
         P2tS7Za7SE+HuBiofoI1VYeaONuJwHCjNUuNz+UQI5bqUQ68udk6uECmD7e/7AZaWYGq
         YqZEEC/+mP95akgKbytqWpKpw5q+fY6lb0MN6Q6INXrPhnHf2wzTTLUnBN9GJda6bz7z
         bVFmaibrSdjDiww31QxbZqBdIs87L/Ir3rKEehVQf4vUefCtD7yGQGqxWFW6vbSMcWgR
         yqjw==
X-Forwarded-Encrypted: i=1; AJvYcCVeK2oQxcDyNHOiLHF1ZlfOdF0RvKdXqKPK3ZLcxa+ZmecEBIeEIjapXeButQCtsOoPSO2/yWjSjvY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4BoJLuP8wMiNwapLlhmbQOPow751NntIHsQI1CzqGYBzQDQme
	NEpf5beUeAZfWNh7cfISI+YjkzjwEd/9cf5xDNBdIism7lXTn4OmP1Sg6ylt4w==
X-Gm-Gg: ATEYQzzkhKJVpioCWHqMVzgY7R9iJMCDcvzSc1dTAp9oNDDcf8798H1ovhkf6GT4d5o
	m6FLa3yIID4VBswOuyW5pR2BJCDdBGDNzWOrX9Zo/UsWcNUii8+3J9f3i+22GRsIHpJM+M6PcJ/
	M47hKU0kbDv9mDI7Z6g6cpOUTEZkfX34m//uhqgZTnCq7WGwhj1KWQzq3mNcD/F0+ONwXgdJ9/q
	2LkfhjvLlQNO6OaYVbmgigM2vWG8cYs4eb+P0TGEV/htN7PK3GeOHEuUifxEDjl3jWrIr6LQ1im
	2R3iGdgnT36epvVBOVeXlYOUjXHdIzjji6469t7fCNsCvNL1itWD8v2g47oDi7ZJl5SiUmz5Hsc
	4b5V/L1FcR0J5MTB+vHpPyaRuOwOHJty4hkhA4DT7IBxemhdvHz2QKr/5IwroBCk7w7H9C4pK6r
	Y8lMtIPSfhCuvuQuDKFSZEnj0wxW4nWBE0tlwILi+k5/n35GscemidacaDPHr+qqIN5UDNBtM41
	XA=
X-Received: by 2002:a05:6402:50cb:b0:66c:582:9c00 with SMTP id 4fb4d7f45d1cf-66c0582a423mr1255376a12.25.1774880674822;
        Mon, 30 Mar 2026 07:24:34 -0700 (PDT)
Message-ID: <6fa82fcc-d21d-476d-b020-fc40a645a74c@gmail.com>
Date: Mon, 30 Mar 2026 16:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] make ioremap_wc() x86 only (for the time being)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
 <3bf90b33-c028-4f45-bda0-9d1bd5386c02@gmail.com>
Content-Language: en-US
In-Reply-To: <3bf90b33-c028-4f45-bda0-9d1bd5386c02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774880675-4F6A7303-17E36D51/0/0
X-purgate-type: clean
X-purgate-size: 1124
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: 9380935CC32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/26 4:22 PM, Oleksii Kurochko wrote:
> 
> 
> On 2/19/26 4:53 PM, Jan Beulich wrote:
>> Its use in domain building is questionable: Already at the point both 
>> uses
>> were introduced, ioremap_cache() existed. I can't see why kernel and
>> initrd would need mapping WC, when at the same time other similar 
>> mappings
>> (in common/device-tree/) are done WB.
>>
>> With those uses replaced, neither Arm nor RISC-V have a need for the
>> function anymore.
>>
> 
> It is okay for RISC-V, but for Arm, IIRC, likely it was done because 
> guest might start with cache disabled and PAGE_HYPERVISOR_WC on Arm uses 
> "Normal Non-cacheable" what could lead to that guest won't see some part 
> of kernel and/or initrd as it could be in a cache and won't be flushed 
> to RAM.
> 
> But probably I misremembered something and 
> clean_and_invalidate_dcache_va_range() or something similar should be 
> called before guest is laucned.

okay, so for this case copy_to_guest_phys_flush_dcache() is called after 
initrd and kernel are loaded.

Then it looks okay to me for Arm too.

~ Oleksii

