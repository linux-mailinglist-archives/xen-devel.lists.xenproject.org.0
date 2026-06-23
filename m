Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aRzJOmWIOmr0/AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:21:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A206B76B4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BZ4WtYkG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344252.1603352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc14C-0006Xo-Mq; Tue, 23 Jun 2026 13:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344252.1603352; Tue, 23 Jun 2026 13:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc14C-0006WR-K1; Tue, 23 Jun 2026 13:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1344252;
 Tue, 23 Jun 2026 13:21:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wc14B-0006WL-BE
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:21:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc14A-007hEd-HM
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:21:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3a8853-bab6-0a2a0a5309dd-0a2a4502b422-24
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:21:26 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3a8856-fdf1-0a2a45020019-d155dd31b0d3-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:21:26 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4633193af19so3918993f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:21:26 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c57b8asm36499152f8f.26.2026.06.23.06.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 06:21:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782220886; x=1782825686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09TYmMSnjI1vD2LB05o63iGc16L7DgRs/bjBtwd1m5Q=;
        b=BZ4WtYkGh6a+zpxe5YUvfE3h/aKku+gjjzkZS1gdJwX0qD3RGiFcHVahOT7yDCM7BD
         ssEhqOi0w7taQi+caHizKO3sB0NXUzYALWoOi5DfrftMDRb5XWC4nvAPlL0yKlIn77wt
         2egDZOzUQrteMoibJMMBuKZfTKD4OShK0mWEjcdgA/oU0bl80Lc3lJpSRvwc8ODAQCCv
         dxsbE/RQCg+SeYxug7GY39ecUli+mvQ0MfHcnxlVYGypgfgw0kqyP0zebE1FcoEkttE8
         YIGYwRFaNnW5tfhYP2ujROh4ellxgDHMPJmo1soEmkcxI8hWkB84ZjXrkuRhrxb4Wg/F
         +YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220886; x=1782825686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09TYmMSnjI1vD2LB05o63iGc16L7DgRs/bjBtwd1m5Q=;
        b=KpS5+RVOKf8B4F4OjGAquotGnZKMr3QXqz9HSXotpiw3G4+RhFJuUxBs8P6UeY4XJp
         8p1QNHawr06NUUiflSVz0HenYxybkz2FE358/XnOniu+wWLyEFiMgC6/hVKH9xsIUxAc
         Tvo0hz0FejYgXsGfPqdT5V00ez7JhLpEJnZMtcO5wohNI5TnsftfhFqWswBKu2L4g441
         hPQuvBhmto/uZiVom1/Ql4KJg5JMa88m2Jz2rL0YUe9Dxin6icojHlFMrZMg8yr4kNVn
         NpZbQBCN7JiF8oHKa6VWC2A6XoyaMC1zWCcIHai/LpnHCxC7KQEwKmVxITMm1FaILZo+
         iPzA==
X-Forwarded-Encrypted: i=1; AHgh+RqXuH4ze4a3QsyHMKCimY6w4JlfAG2Y13+B+bW2I9GLSFCp9rvvklcd+34iVrlG5n2aqgyAVJp0iX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxowZi+v4+qzplo3XnpKQwXQDw8bol2OrHHAAhs9IL5Wx6999fk
	C0JYHtKBXyJWiCnVGJqWXrPBI9H+EQCDyq+iOvulV3gJ2yYpQHjNNUPF
X-Gm-Gg: AfdE7cn+NfGJDXPs5zV8NGpmdBY729PWUACiv+LkByPWS3IGW/oeJrSfJgFrVJLpa7v
	Taqp4at5ymTJAf2E0QVAr87cPi0mA3jk51LfQ/3Mcye8DuGwgJmEaYYFev4lLV0H25L3b7ieWTn
	Kyu7zUnwonanb0FaG2AYMBEdC12JWJOa7pZZ5ZQAqD+T6US5D862clSJI+lYXxDNa7yBk0OcuX/
	IpdZnUZ7iFpOfA0u8nPvTlz1lvqXIlEX/nBLCcbWW/RPBWeKHe0ixrOJOqMGpEJ8AhQEoNYBKR0
	p4GU0wQxlGEohCIfWsxogs9zJR0em0lklWKlwLl2Q+2xirqsbw+iehgLjEirEidvqxjb9mM/EJR
	JIwTnhawIY4B8JurItulelH3r1/CIoA2GE0bwzKKQzXeXZZz+gnImiYFSVRtKd6MHmusy1UQQgl
	i8rnwrw3K6CNHXgIWaOKi8OlDXNsdPqbrS6vSFqqLKPZwWTzKivkHEyB+jfBVgtdPlY3k=
X-Received: by 2002:a05:6000:2508:b0:46a:1f35:1133 with SMTP id ffacd0b85a97d-46a1f351353mr9085663f8f.25.1782220885748;
        Tue, 23 Jun 2026 06:21:25 -0700 (PDT)
Message-ID: <3081ebbe-f0f8-48aa-b015-4b15335bc53a@gmail.com>
Date: Tue, 23 Jun 2026 15:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/4] x86/kexec: Improvements for FRED
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <80b43806-7be5-4310-9568-c2df4887c52a@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <80b43806-7be5-4310-9568-c2df4887c52a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782220886-4DE673F3-EF26B253/10/73395122804
X-purgate-type: spam
X-purgate-size: 1226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88A206B76B4



On 6/22/26 7:26 PM, Andrew Cooper wrote:
> On 19/03/2026 12:25 pm, Andrew Cooper wrote:
>> Kexec with FRED happens to already function.
>>
>> Looking at the logic, several unsafe actions are occuring.  Fix the worst of
>> them.

How critical are the remaining actions?

>>
>> Andrew Cooper (4):
>>    x86/kexec: Stop hooking NMIs with trap_nop()
>>    x86/kexec: Fix and expands comments for kexec_reloc()
>>    x86/kexec: Invalidate the IDT earlier in kexec_reloc()
>>    x86/kexec: Disable FRED earlier in kexec_reloc()
>>
>>   xen/arch/x86/crash.c              | 20 +++++-----
>>   xen/arch/x86/x86_64/kexec_reloc.S | 62 ++++++++++++++++++++++---------
>>   2 files changed, 55 insertions(+), 27 deletions(-)
>>
> 
> This is fully reviewed/acked but fell through the cracks an I didn't get
> it committed in time.  Sorry.
> 
> Please could I request a release ack?
> 
> Now that FRED is active by default on AMD hardware in 4.22, a poorly
> timed NMI will break transitioning into the crash environment.  i.e.
> it's fixing a corner-case bug in a new feature for 4.22.

Sounds reasonable to me:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

