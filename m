Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CZONJPd6GnOQwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:39:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E8844757A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290720.1570246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYj9-0004jS-5h; Wed, 22 Apr 2026 14:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290720.1570246; Wed, 22 Apr 2026 14:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYj9-0004h6-35; Wed, 22 Apr 2026 14:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1290720;
 Wed, 22 Apr 2026 14:38:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFYj7-0004gy-SF
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYj7-003f2T-9E
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:38:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8dd6c-2eae-0a2a0a5409dd-0a2a4502dfa2-20
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:38:53 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8dd7c-af86-0a2a45020019-d155a72eac0d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:38:53 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a0faa0d15cso5424868e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:38:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ebf2asm4493897e87.80.2026.04.22.07.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 07:38:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776868732; x=1777473532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQRMRHTjpS2tKlDulaUwvlqdBl8ZjW8ncPDYcuyZIlc=;
        b=MGH6x7jTJ/hNDhD7CByfgwZIYsK4hpXc0J2417+BmcmgKCoGq5r6cipTM4nqSDCiGR
         vfgWjA+ds/veLwZG1x3wGVbyhWvUGYQmMWSCnQLn6gTqPosmmB1It6Z5FbMM+2PGRmHK
         lEgRlQlDQBegx3L8a9D3DeMfESF4o2mTos7GTc39lqj6wl+H9ncfRu2QtHoKXt5VPITg
         mxeB87DWEPU9nzTzs0oXpmrpM8UU03rsjriC87+qXS9xH+8f8cVBOuZXAEpQExr5vgYc
         ELhyGJm48PUyZitBizMkJKWAjEDLYDuyY13jVd+rjf9RfEBOkCvdtKVrCxjOo9KJ/kq+
         HsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776868732; x=1777473532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQRMRHTjpS2tKlDulaUwvlqdBl8ZjW8ncPDYcuyZIlc=;
        b=kVMFYrNwVG1jRPjWKAKvn8eai1ZLmHKdKUi3KS4zYF8/wie0IOSwg39bdBx9EH2p+r
         GgPJcOi4aLwDb5p/QFD2DXZi00GVysPTYikN0ZdWILYPWDjoOldkOtWGFB4AXL/KxIhP
         ov0cCL/sb/5VMCT0RE6K+uWXUv7WminUSlrZaZsqj2ozkNXkFbKtROIJF85Fgnu9JXeE
         j+v/6kZ+dVSJJr7LF3sQJ2jLlGCLXjEgNizZB9SvX61VZQJEP95KNNyNGINKn8GNkHHo
         zc0AadDJk/OncJPT+ernD3PRlGiD4353Wr6ZxuhlvRUb5ZUB1NaMD3DZvK9Ys7thUNrY
         +TMw==
X-Forwarded-Encrypted: i=1; AFNElJ8WDMVLRiIgRz3ZIbNRZLZlooN4bO5Yz8YiACY7IUSrUG7bMbnvkFDEjNqeIBFd8RQx5mazAYaxbGI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2RxUQ1BQNOpo186PqnL/H1AIijPCinTRb2qB6zZt1xMMt5OQy
	kcy/g3ewtUE83VChy/N3pN1Dm72z0L7PRWLEXlUyjLtjlKLWofUiKE5f
X-Gm-Gg: AeBDieuKR7a57lC7JCXZ3uNwQKRbcUx85Kpg4NvRCahxRGHCBK0+CIpH0IWMXUwBUdT
	fIQ1GLI9KNARdR2P+UNaOebkOytW2T9QbX6XHg7LqMF3B6pX5fZxi7KHfMomDNluGe3b6Rt7jGx
	mmJ2O01KovfTJBjqis4Ndm5itDwQx5E0+fBugQMbz7tlWopkqDu7AvsmWgc+UMo5wWZXZeGT2Zn
	iOfVvULcH6B6E/YB6zH+RMGYrSMWMksOkpyMTm6CiDNNlYPp74cyJ8et3+lB6IDvndadla6K+vC
	UTIjdhrKa0HzR9fmf/g7ifEJo1DnvfNpON8cIfPcDO6FYUDHJQNXTqzj1VJy3AyDG/JsLXq1mkb
	DRZyKMKFvWXAErtePD0Sm6lVAm/er8Us8zVjOUNFY750RZGYSpRDFjmwmWHvzPuAIhGIZ+ZXkL/
	bUvEfWIkWfqTPEUvPaG3FjqpZjNck2nJVs5NfL5CbZymJOydYUbXB6XhppuGepaYHvewsfpD1P0
	uwnAxWcn5pk7g==
X-Received: by 2002:a05:6512:692:b0:5a4:2bf:28b9 with SMTP id 2adb3069b0e04-5a4172ea032mr9070160e87.43.1776868732241;
        Wed, 22 Apr 2026 07:38:52 -0700 (PDT)
Message-ID: <37332fde-7996-4370-b126-9faa62e39ac5@gmail.com>
Date: Wed, 22 Apr 2026 16:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] xen: introduce domain-layout.h with common
 domain_use_host_layout()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <2057380b431df202adedf852ad492dd0f156f863.1775836193.git.oleksii.kurochko@gmail.com>
 <702045f6-a342-4662-9eaa-76f7be1df8fa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <702045f6-a342-4662-9eaa-76f7be1df8fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776868733-80F7E161-1A6DC50D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1908
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 42E8844757A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 11:20 AM, Jan Beulich wrote:
> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/domain-layout.h
>> @@ -0,0 +1,28 @@
>> +#ifndef __XEN_DOMAIN_LAYOUT_H__
>> +#define __XEN_DOMAIN_LAYOUT_H__
>> +
>> +#include <xen/domain.h>
>> +#include <xen/paging.h>
>> +#include <xen/sched.h>
>> +
>> +/*
>> + * Is a domain using the host memory layout?
>> + *
>> + * domain_use_host_layout() is always False for PV guests.
>> + *
>> + * Direct-mapped domains (autotranslated domains with memory allocated
>> + * contiguously and mapped 1:1 so that GFN == MFN) are always using the
>> + * host memory layout to avoid address clashes.
> 
> What is "to avoid address clashes" about? If GFN == MFN, how could there
> be clashes?
> 
>> + * The hardware domain will use the host layout (regardless of
>> + * direct-mapped) because some OS may rely on specific address ranges
>> + * for the devices. PV Dom0, like any other PV guests, has
>> + * domain_use_host_layout() returning False.
> 
> This last sentence is somewhat redundant and somewhat in conflict with
> what is said further up. If you did s/guests/domains (including Dom0)/
> there, imo this sentence would best be dropped from down here.

I will change the comment to:

/*
  * Is a domain using the host memory layout?
  *
  * domain_use_host_layout() is always False for PV domains (including 
Dom0).
  *
  * Direct-mapped domains (autotranslated domains with memory allocated
  * contiguously and mapped 1:1 so that GFN == MFN) must use the host
  * memory layout since GFN == MFN by definition.
  *
  * The hardware domain will use the host layout (regardless of
  * direct-mapped) because some OS may rely on specific address ranges
  * for the devices.
  */

> 
> With these adjustments:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

