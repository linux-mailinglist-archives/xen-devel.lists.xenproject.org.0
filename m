Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPF7HYODFWoSWQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 13:26:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6015D4D9D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 13:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319795.1587251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRpv4-0002ty-2D; Tue, 26 May 2026 11:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319795.1587251; Tue, 26 May 2026 11:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRpv3-0002sV-VN; Tue, 26 May 2026 11:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1319795;
 Tue, 26 May 2026 11:25:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRpv2-0002sL-8A
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:25:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRpv0-000ZGh-TW
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 13:25:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a15833e-e002-0a2a0a5209dd-0a2a45029d6e-16
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 13:25:54 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a158342-af86-0a2a45020019-d155dd30b018-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 13:25:54 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so6360483f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 04:25:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4741bsm36242088f8f.22.2026.05.26.04.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 04:25:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779794754; x=1780399554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eEi+juF+pJ3q/uC5HEr+cFkSFHLKHyVQnXsMKOFgej8=;
        b=rZDJoWW7tQJ5xlj0VGCRkY6Owh1BX0v5FtDf05+9nQki1yYPkE+XcOVNMk6J2uSWpQ
         7LjAyK/YDhpfGYoXH+qB0gQTiWJHrUnyU4HV7AnQ2qXi2M36w6FDLMjuCyacHN76JiIM
         qhFp6LsH2BbXFTk1UWJmW2Fqc10UP4BIYEb0RxE20zwc52K2ZJxCbBzW1EL6uTaXMEwd
         qCJP35qVltPIVx3afOjq+CUB4vi1naKMqm7TRbiTHMnBpOc7Knw7pZPKw8NRA9kFA2G5
         E+Wexo53qKvz2H0cQEgxvfgNz5pCsAQGmsOuje3+MaWS98gbxDUqy+vnXyqyE58pTO2X
         XnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794754; x=1780399554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEi+juF+pJ3q/uC5HEr+cFkSFHLKHyVQnXsMKOFgej8=;
        b=kcXCrDir7FPMoqu+XN49wuZ1gjvK7k8MMyxeqde/CZgCFteZekY62yyuOjYinqI5yf
         BgqVEC015LeyT/LVkYKL/ozO1SsHpdMnEMb8xKYdw3Psm2cfkyln81Mxf1Wcsi006iWL
         0Ee6pPfgr1EglZzh8RlZ8BeeiX49KRCjRYD8PtueoXy+tAu2z/h4fmfAHdzB6mdlKeOU
         gxHKqrXPq/54H7aHzRiUXr0WWafvzzAl0hhTFKhKkQwK7sCjbZ8YF0hXFBXyzg+6xvTQ
         e7Ij47J10VrSTGfgbM24cJgDzcOyY0aSekHWv1VRGtO2w2Lal/rH0C49omfmQrimIq+v
         LBjw==
X-Gm-Message-State: AOJu0Yz6SEnUXDv5rKGfGcHou+QxFqeRoh3NKm4NOVIbDZ4TXLeeuy9z
	Pxh0EN7Gd9TWbOMD/CEtKcAR+ctOBh5ycVVto9/UxrKr11558OpU81pa
X-Gm-Gg: Acq92OG4iTZjCi4Ifxu43TBuIGySZofnlnAyihQay0GfzYe1iiOXeyzNCfb3m67mrXE
	hgHBsFVYavGEQB445ecpllxVsjs/g6jNfK8fxNH4p0vGgFjS3rbmX7+64bKODV13BvM9/vQsTN0
	TmmB93fppycNULcUAj7ymMYPmDcBBroArPzS9tX70ZNuBMdJcxPTNS0cV0QZjNQPQR3DO6TxawO
	qm0UzMyNTzQkk5spaMf2ZW9Dd6HpGs81cZq3M1r6GR16QCQ5R4WBr+USdx2gHzSvFkK5hZzTG7X
	oH/lMfeEWVtGrOFfkobUH0AMHRAl0iafySR3sIShOKqcIO5T1j980BpZuTgGkVZtZ/vB8UQsLwZ
	ymS0sbn5gCrWUrY0gKvAR06sznsCb/pc6TgCfUMKhEAJ/kLx0SkfhaIjsx+UEm/H4Oz2BPY29Mg
	b++sToRQXBLMoSsl8bebne+XBPoLqT9pSRfag6619aCtG7+zgM3oWapTnOzfGTB3EUFwO+Ro6kU
	Ok=
X-Received: by 2002:a05:6000:2384:b0:441:3144:efc5 with SMTP id ffacd0b85a97d-45eb38e4fd0mr31160108f8f.42.1779794754032;
        Tue, 26 May 2026 04:25:54 -0700 (PDT)
Message-ID: <6837fb94-97e3-4119-a330-a000706a8c92@gmail.com>
Date: Tue, 26 May 2026 13:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <agxoiG_JLs_84rY5@mail-itl> <e06a61c8-c2b3-4eb1-a118-41e1a70db77e@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e06a61c8-c2b3-4eb1-a118-41e1a70db77e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1779794754-80D7F161-4DF437B5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1794
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:accek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CD6015D4D9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 3:45 PM, Andrew Cooper wrote:
> On 19/05/2026 2:41 pm, Marek Marczykowski-Górecki wrote:
>> On Tue, May 19, 2026 at 03:06:57PM +0200, Szymon Acedański wrote:
>>> When netbooting a unified Xen kernel image (via GRUB chainloader),
>>> the resulting loaded_image->DeviceHandle does not support
>>> SIMPLE_FILE_SYSTEM_PROTOCOL.
>>>
>>> Instead of crashing via noreturn PrintErrMesg(), print a message
>>> via PrintStr() and return NULL from get_parent_handle().
>> It's worth noting this isn't the first instance of returning NULL from
>> get_parent_handle(). The return value is used only as an argument
>> to read_file() (sometimes indirectly), and if it gets to be called with
>> NULL, read_file() will terminate execution via PrintErrMesg(). But with
>> unified Xen image, the intention is to not call read_file() at all, only
>> read_section(), so tolerating get_parent_handle() failure in this case
>> is desired. Keeping the message in place will ease debugging if
>> read_file() will actually be called later.
>>
>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> As a side note, a slightly better approach would be to call
>> get_parent_handle() lazily (on the first call to read_file()?). But it's
>> a bigger change that I feel may be too late for in Xen 4.22.
>>
>> Also, adding cc: Oleksii for release ack.
> 
> Bugfixes are still fine to go in.
> 
> Personally, I think moving the call to get_parent_handle() is a better
> fix, and fine for 4.22 even at this juncture.  ARM already does
> something along these lines in allocate_module_file().

I agree that we could consider suggested better approach and I am okay 
with having this patch (or its new version) as part of 4.22.

Thanks.

~ Oleksii

