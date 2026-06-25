Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mHWYAL0SPWqWwggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:36:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E116C52A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:36:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FDhDjrub;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345534.1604384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciNY-0005x6-Dq; Thu, 25 Jun 2026 11:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345534.1604384; Thu, 25 Jun 2026 11:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciNY-0005vk-AT; Thu, 25 Jun 2026 11:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1345534;
 Thu, 25 Jun 2026 11:36:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wciNX-0005vc-Of
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:36:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wciNW-002pM9-7o
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:36:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d12b1-bab6-0a2a0a5309dd-0a2a450ad1a8-6
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:36:18 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d12b1-e40e-0a2a450a0019-d1558035d0c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:36:18 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso23238605e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:36:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492660b62e5sm55323335e9.8.2026.06.25.04.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:36:17 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782387377; x=1782992177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEz2ZCL63hyDQGUxZ7c36yOze4ZLcJF1uZkk0Mm7bVc=;
        b=FDhDjrub6OiRGZNO+jRKvxm/gs8XYC694O96atY6oNvhGtR1+Dl64XfV8fL2O9JVvm
         cLUTyL4zu8CpnP62ai+7sKe9d1z3YW3P6l+mUmBa6uMmDfIjfgeTghsB+S9vUA77RlDy
         OQguLZXfDX+m9vjBNVu/XsIIAZOuHl7adiQ/BXlkICU7+iIoegNTtB4uLrjhVmeh+fui
         dLwVWpYC3e2msK/sgbcP4hODvnNKdBK1ANqjAC612bBDw2V1nH9yySzCWNzyi624mhYG
         sAT+SBUdc2FDdhynJF3+C/VLTDrVs5qnazAFjCVFdESCNLGQkyrdn+oZpzgN9za8AjAs
         b/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387377; x=1782992177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEz2ZCL63hyDQGUxZ7c36yOze4ZLcJF1uZkk0Mm7bVc=;
        b=AhvuiIK2PuE6DgFJlZ5hUbbEImTus5JpWzqljYL2lbQlGiFgjWXrt+ohJBBx6OULEZ
         Fc2bcpYG9lpksQ3QsELe8FaRVvIfE/F0wHRMc3zjsqJDglfvpV9uxvhOICQKyEdH14Qn
         diMRaSZ8t4HiOSTKjKvSAPRPlVmOhRSZK50s0bWKoyaVcn27HBkcgFAwXRwAbNm5kbjQ
         IRrN7d5LPOmeGOwODGonXDunN6FnjYk7eNkasMYsxXuLTj49k4yQPY33qawDLta8qmoK
         +xZnc4xYtKYaUA0WxrDZWdJ9MCDApLDDGgcvAkizub0tWyIQwp1cSkQ/1RHpaiKm1CWY
         1NkA==
X-Forwarded-Encrypted: i=1; AFNElJ/8bgWLGRthCGxMkIQsBokr3TpB4fDoqGd8g0X17ZmRn4fgKkn/vhFBe1lXWaAkW7RiKbWmsI1oP0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdEnSEwYBd3MJGrJHu990Cb4E2tNZ8ccuAsWXOb9N24zo3FsRC
	V1DdUmJ2fEmr8l5n0S1g0MZ9G0Eu0Vat7HKDh5Ic6Pt7pSC/vsN+oX07HtSZ/Q==
X-Gm-Gg: AfdE7ckhKP1WC/0+bpgIUTinifJOruCE2AfXemC4s1yL9smuqBJbyYfUqCSTlL5FPDC
	CKytHDEQrOPAByP+iD/wC5xaCVXV8bObL3ypYi8OuNwRO3lLa5pqoEsrSE2ICYCODVdePMRmV+0
	jLL/I5LDoJiIXcmEdohpXt4vZD04YqEpsWRKyiy9UB2cyejMNRpSfSTHYyeVrfJJ6JZJuO1ZCUv
	mRMnzT1GdbnQuNOKrXFuqVg6rSGSF2XAIvemYW5E6nmWPqtbigYKmjp3l3UyusxmILXEw5YVcnI
	V/W/npF0Kj2DEOe9kUKVccDIDRVkFWzuwvVONBa5CH9Yj5q1ZttLZU9RKcE3hO+QSsvSN2F9BAD
	Xp/XWJfI2ft24YWx5b4rbIHVLyDGgjuKt+NTa+Ja6CZLwqtrhrzbFYvJg8+6PjTZ7cJQGz8hueg
	XWHe24rsdT8ns06XO8T0EX/0gtw8Wc7MhrdSesAs0twKJCYZH0EKNPiLEpOdTDahQKUtY=
X-Received: by 2002:a05:600c:c491:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-492668833b2mr28912605e9.27.1782387377488;
        Thu, 25 Jun 2026 04:36:17 -0700 (PDT)
Message-ID: <ccf1f58f-68f2-4136-8759-5df043381329@gmail.com>
Date: Thu, 25 Jun 2026 13:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <910ed097-10d8-41a2-9035-a3f10d60c214@gmail.com>
 <73452348-466c-462d-884e-f181fe12b293@suse.com>
 <e8fa36f3-e8ae-47a9-9f75-0b8f9a306a02@gmail.com>
 <c0f66758-f0e8-4a29-bb7f-f43e14ecb976@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c0f66758-f0e8-4a29-bb7f-f43e14ecb976@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782387378-D7935DDE-D3D66498/10/73395122804
X-purgate-type: spam
X-purgate-size: 1854
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57E116C52A7



On 6/25/26 1:23 PM, Jan Beulich wrote:
> On 25.06.2026 13:19, Oleksii Kurochko wrote:
>>
>>
>> On 6/25/26 1:04 PM, Jan Beulich wrote:
>>> On 25.06.2026 12:50, Oleksii Kurochko wrote:
>>>> On 6/17/26 3:26 PM, Jan Beulich wrote:
>>>>>> +#define shared_info(d, field) \
>>>>>> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
>>>>> How about the simpler
>>>>>
>>>>> extern struct shared_info *shared_info_absent;
>>>>> #define shared_info(d, field) (shared_info_absent->field)
>>>>>
>>>>> ?
>>>>
>>>> This could lead to compilation error:
>>>>
>>>> common/domain.c: In function 'vcpu_info_reset':
>>>> common/domain.c:316:20: error: unused variable 'd' [-Werror=unused-variable]
>>>>      316 |     struct domain *d = v->domain;
>>>>          |                    ^
>>>> cc1: all warnings being treated as errors
>>>
>>> #define shared_info(d, field) ((void)(d), shared_info_absent->field)
>>>
>>> Which it should have been anyway, to make sure the first argument is evaluated.
>>
>> I expected that as shared_info() is used as an lvalue whose address is
>> taken (&shared_info(d, vcpu_info[...])). To "consume" d we can't just
>> prepend a comma expression as &(comma_expr) is illegal since a comma
>> result isn't an lvalue.
>>
>> Trying what you suggested leads to:
>> common/domain.c: In function 'vcpu_info_reset':
>> common/domain.c:320:26: error: lvalue required as unary '&' operand
>>     320 |         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> 
> Ah yes.
> 
>> Thereby this option:
>>     #define shared_info(d, field) (*((void)(d), &shared_info_absent->field))
>> will be better.
> 
> Or maybe
> 
> #define shared_info(d, field) (((void)(d), shared_info_absent)->field)
> 
> ?

This option looks better. Ill apply it.

Thanks.

~ Oleksii

