Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DjcFX1V6GkcJQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 06:58:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA914420A6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 06:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289844.1569537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFPeS-00039l-8R; Wed, 22 Apr 2026 04:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289844.1569537; Wed, 22 Apr 2026 04:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFPeS-00037L-5Q; Wed, 22 Apr 2026 04:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1289844;
 Wed, 22 Apr 2026 04:57:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <thuth@redhat.com>) id 1wFPeQ-0002xO-IM
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 04:57:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFPeP-00GXAT-HE
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 06:57:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <thuth@redhat.com>)
 id 69e854eb-e002-0a2a0a5209dd-0a2a45018bf4-38
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:57:25 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <thuth@redhat.com>)
 id 69e85534-c1f2-0a2a45010019-aa0a817cb619-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:57:25 +0200
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-EgWwrnf3O-K-Uz6AmhK_Wg-1; Wed, 22 Apr 2026 00:57:22 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48a5952c635so5213055e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 21:57:22 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c318636sm217434155e9.7.2026.04.21.21.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 21:57:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Autocrypt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776833843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0L9goOndJ0ZNAN3NWrENW0DDl37Vxtxj2sxDGwaEk+o=;
	b=IRU5dhbfT9CD9bdgcpJxiyw3JcL9+YOsBS9L/4AHMLqk53tyNoD04eAKvXnHFn/Dx1eYmr
	rTosr6xM8wN8LKbcW3oMyPsiWtW8Qi1vvelw0e/eTI6CPKLjaK3wVlmh/s0NtT+a32F+F/
	I1yU7GRQaDW42PsUQ5RKXjFM5xUORBc=
X-MC-Unique: EgWwrnf3O-K-Uz6AmhK_Wg-1
X-Mimecast-MFC-AGG-ID: EgWwrnf3O-K-Uz6AmhK_Wg_1776833841
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776833841; x=1777438641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L9goOndJ0ZNAN3NWrENW0DDl37Vxtxj2sxDGwaEk+o=;
        b=n3MkAE1MGwmgb7PtVsNu+yWIrXX/H6k9Ej1a7EdSHly5ghI5M1dJOP2a8CN2jUKt6W
         +ndS/DGMXCLyTD8eA96ytg/Daiq+SpKxNVxSmuWHULdxJAVGAGG10zAkdL9fG0PnWQdE
         6rp/yKwN+XBwEvm7qgAqy3dxlAj29sSkWzNkgBxEPYQo6TE1hUyQrXUxhceJ8TIAze7e
         gl0wY9A6Ec9a3yzqRWlBeBfjBjJ9LwCWU0Ep70Q09Dg4l888+10aohRl7rNQWCjeqmYK
         8OJES7J67a0SctcYdc7pvSLRudJ2OvFEa0NC3w/sm6Mj8Ftttkq7cORFuHXBWP3FdhUj
         /t1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ueBgHyVWWGhnnln8sKK6zLQxQlXro9PvFGSZFZBb+UMyVaA7wXOFwntb13FiqxK0TGUJzmia1ypg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLUSkS2cPFO+7wTO8p6VBGB7AdJyWLRcRP/Iu7G4q1gMeKeT1a
	nFBf0ifzl5U7fulHbiCFYnuXtrZJeTG7GIGtAvgTkozUUb19P1bxMtQ0JvJSSNGA/vFoNSA0lIY
	gDd64nJCwJTX56XEAql2SmTUWXnhHl0zblpOVkh2DfE710F8NixbkYAfS70slGP2AgkN0
X-Gm-Gg: AeBDiesWl2vTjyc5UIQN8eN4IBpjn2o12nyyx/HztX41bkG1tJDx+pvOVCy10WS5POY
	DI1/mP1IIV6IpgmAVnDTx+rzme+w1kfbCc3vnqkzIB/eT9uKiJA+dgo7OVcAHobLRf3n03wAnNh
	dS+gyhQM0zjkCEBWEWV2/4qT0kI83OPfRENyAQaQAP4TmfIQjG1/RUoAF4gBFOVWnUex9YGuk6f
	CsYcVtGPzpE96m55bsPBYRqDawCcTnKLi/QjvFUex27ykHKs9gSk9v4OIFPyRocgY+4IC6f4vsL
	/ecxZqpfmmjJDl4L88pMhuCd033Ri726FVEeP2T3gLnYS4zt1oCfBuZHZ5bFnlEaKYB+4HzUXX2
	qQKTvfpxuis6Nf4Gxi9k8EhjoNfpazQ==
X-Received: by 2002:a05:600c:48a1:b0:489:a4:e58a with SMTP id 5b1f17b1804b1-48900a4e881mr160289915e9.19.1776833841093;
        Tue, 21 Apr 2026 21:57:21 -0700 (PDT)
X-Received: by 2002:a05:600c:48a1:b0:489:a4:e58a with SMTP id 5b1f17b1804b1-48900a4e881mr160289815e9.19.1776833840649;
        Tue, 21 Apr 2026 21:57:20 -0700 (PDT)
Message-ID: <68b36ad0-2233-49d0-a3a6-bce053686bf1@redhat.com>
Date: Wed, 22 Apr 2026 06:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 interface.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260421142701.548978-1-thuth@redhat.com>
 <alpine.DEB.2.22.394.2604211513030.2712345@ubuntu-linux-20-04-desktop>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <alpine.DEB.2.22.394.2604211513030.2712345@ubuntu-linux-20-04-desktop>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rs0CzFgOnuZPdlIH1-_sPVSL185A7T9HGqq04vD-m7I_1776833841
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776833845-BC016FF4-4917173E/0/0
X-purgate-type: clean
X-purgate-size: 1443
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:jgross@suse.com,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[thuth@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thuth@redhat.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 8DA914420A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 00.15, Stefano Stabellini wrote:
> On Tue, 21 Apr 2026, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembly code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
>> This can be very confusing when switching between userspace
>> and kernelspace coding, or when dealing with uapi headers that
>> rather should use __ASSEMBLER__ instead. So let's standardize now
>> on the __ASSEMBLER__ macro that is provided by the compilers.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I haven't been closely following the __ASSEMBLER__ vs __ASSEMBLY__
> discussion. If there is general agreement to use __ASSEMBLER__ in
> headers, I am happy to go along with that. Currently, I see more than
> 140 uses of __ASSEMBLY__ compared to fewer than 20 uses of
> __ASSEMBLER__, but I'll defer to your judgment if the project is moving
> in that direction.

I assume you only counted the occurrences in the main include/ folder?
Please also take the arch/*/include/ folders into account:

thuth:~/devel/linux$ grep -r __ASSEMBLER__ arch/*/include/ | wc -l
1492
thuth:~/devel/linux$ grep -r __ASSEMBLY__ arch/*/include/ | wc -l
120

So most spots have been converted already. It would be great if you could 
help with the xen header!

  Thanks,
   Thomas


