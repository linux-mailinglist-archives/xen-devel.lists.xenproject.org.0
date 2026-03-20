Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GICPI28avWnG6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:59:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C5E2D8636
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257947.1552180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Wce-0007z3-JW; Fri, 20 Mar 2026 09:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257947.1552180; Fri, 20 Mar 2026 09:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Wce-0007xA-Gx; Fri, 20 Mar 2026 09:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1257947;
 Fri, 20 Mar 2026 09:58:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X43w=BU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w3Wcd-0007x2-CC
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:58:27 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5686eafc-2443-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 10:58:26 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6653b589a78so2698236a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 02:58:26 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-146-121.play-internet.pl.
 [109.243.146.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-668d2a4bc14sm1206727a12.29.2026.03.20.02.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 02:58:24 -0700 (PDT)
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
X-Inumbo-ID: 5686eafc-2443-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774000705; x=1774605505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKUl9zWfsIZ6cetJ3tRWyxLoMGMzBF/VsV5E1QgCDb8=;
        b=WsVNER4ienLqdzYujarb/07tohcrBuPmc/xyTPv99GuY3k7qt1JS9wCvdsvh74fwFN
         eejCcZ2YwoNTm1sWqaHN5cjfOj9qqnhKuE1ApwZIawV2Ic/fWRjKyTEin1g0hCEnU5I8
         xyMdIO6s/a1aRJqOArYEYE8VuZ88Ox6GYXgkTw89MgMrkTFjuDdBKXfKgrIWKffIYBwc
         DXSzsJclSOMdi7mH77uFsGl3G1K5ea8HyFWu8DiQ1aYF/5OIkFCaX5k8dFezgPRUjFyS
         9MHiFGL7+EGmUXjMkKmyIRE7lm9qVLgCDlA/YpnnpiCLHZAT9RSW5wsoPQ6ANFt1qTbR
         /fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000705; x=1774605505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKUl9zWfsIZ6cetJ3tRWyxLoMGMzBF/VsV5E1QgCDb8=;
        b=KaKOqoBL2V/t4Wxh1pJdf0X5c6a1aoI9tklbRRp1QYk69gBX3FeX+uRHXmzW+hvKNX
         U+4pCtdu1XouOWUWIJuiLv1fqLSGwcnRFSlrayWlEWRu/BfM+PvktRyJCudID7aSNdhD
         h2kWHNcfQZvjbqq0lnkegVHqMZry8q6zrwMnDS9Lq75Lzksmz1IsQKQA7SpX+zNE2KC3
         vZBJxlbaCwz11w9yMrpDQ3yhvsnLXlBH3Q9p//Um/1uRuHkevpVaIvm/D1HZm5NYE9WM
         /6W4q91gVue1D7SyTTVmN6zJj2wC8n/ByR54a6+DeHlu+kOS3SvUQj1jUjvTWQNumGov
         Qabw==
X-Forwarded-Encrypted: i=1; AJvYcCVF2OpPOUnPGdq0vniBJip2sKowla0bsjxZWvNwx0ss/wwNv3jfCWlpjub2WiKqUdIlwbzfHvYXgcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1pm+ibg3cOR1WBBU/+mILMfxTAfAlSiQUcu/Brs+C2mUC/yRZ
	tkulW3iiPZuxntyPUSaM9fNJpygWbLGtxoyaO0jd8TPtwqOA2zZSEkV1
X-Gm-Gg: ATEYQzwJaLIqzejZo5jOvszei6TXCAQ//I6KBXkpkurab2cGOg5nxbBVrMW4mTr3gya
	LZ7ecScSXJchqWr7m9DZU/Q3Whz2BKcpujMIUoWm11UUvTp07BVRfrtbdZ1peTH8ExAqLJ+GnRS
	f5p/xLIEuateMTjncvXTgzfcfhgywgEDHgMWvdKNjXCOKv/+2GZ1kykDgmIDpMadm1/veTVd5VI
	nU01fnDLD3QePACxoewsQo3SLqHN+TIUi9MM2xsqOAHKc/TD2D4heeaL5SZkq+hyEp5izq3zCXD
	QQJUTDAGQdtzEcT149MIBxXBi1KmjvOdrQrFbg6DddGUy4Pp00U6lxlMFEuWFzMXIpRQ7de8aDg
	u66Y5KnDuqykBwLioLsjmhYkHfa1AvityzBXFNNj5qkrln6Iq6OliHmGsLVWWINGxqTtLd4FGbc
	ZpOvVXTMxuYoQUmNfKOVNcHxJJVOywvlx6GZhTFmnj30gG46O0yfb0WtEWsXKIOBZdVQqgk4goX
	njCww==
X-Received: by 2002:a05:6402:378d:b0:661:d0a4:ad45 with SMTP id 4fb4d7f45d1cf-668c90fda88mr1591649a12.10.1774000705005;
        Fri, 20 Mar 2026 02:58:25 -0700 (PDT)
Message-ID: <a8e3b6fe-d1cc-44d5-b286-b59b65e25320@gmail.com>
Date: Fri, 20 Mar 2026 10:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
 <ad59c5ea-ae8c-4e6e-8b49-dcd0eefc3197@gmail.com>
 <1efcb5eb-1b59-4def-a527-254a31efe2b7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1efcb5eb-1b59-4def-a527-254a31efe2b7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: F3C5E2D8636
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/19/26 8:58 AM, Jan Beulich wrote:
> On 17.03.2026 13:49, Oleksii Kurochko wrote:
>> On 2/13/26 2:11 PM, Jan Beulich wrote:
>>>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>>>> +
>>>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>> (cut)
>>
>>> If all you want are 2Gb guests, why would such guests be 64-bit? And with
>>> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
>>> even a 32-bit hypervisor would suffice?
>> Btw, shouldn't we look at VPN width?
>>
>> My understanding is that we should take GUEST_RAM0_BASE as sgfn address
>> and then map it to mfn's page (allocated by alloc_domheap_pages())? And then
>> repeat this process until we won't map GUEST_RAM0_SIZE.
>>
>> In this case for RV32 VPN (which is GFN in the current context) is 32-bit
>> wide as RV32 supports only Sv32, what is 2^32 - 1, what is almost 4gb.
> ??? (IOW - I fear I'm confused enough by the question that I don't know how
> to respond.)

You mentioned above that:
   "... And with (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide) ..."

I wanted to clarify why you use PPN here in the context of GUEST_RAM0_BASE definition.
(and maybe I just misinterpreted incorrectly your original message)
GUEST_RAM0_BASE is the address at which the guest believes RAM starts in its physical
address space, i.e. it is a GPA, which is then translated to an MPA.

 From the MMU's perspective, the GPA looks like:
   VPN[1] | VPN[0] | page_offset   (in Sv32x4 mode)

In Sv32x4, the GPA is 34 bits wide (or 22 bits wide in terms of GFNs), and the MPA is
also 32 bits wide (or 22 bits wide in terms of PPN).

The distinction is not significant in Sv32x4, since PPN width equals VPN width, but
in other modes VPN < PPN (in terms of bit width).
So when we want to run a guest in Sv39x4 mode and want to give the guest the full
Sv39x4 address space, setting GUEST_RAM0_SIZE to the maximum possible value for
Sv39x4, shouldn't we look at the VPN width rather than the PPN width?
In other words, GUEST_RAM0_SIZE should be (2^41 - 1) rather than (2^56 - 1)
for Sv39x4.

~ Oleksii


