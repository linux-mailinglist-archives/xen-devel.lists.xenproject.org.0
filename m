Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4hQEDvD5MGpxZwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:23:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE868CCFF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G0p9Ar+b;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338725.1599768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZO8J-0003V9-9p; Tue, 16 Jun 2026 07:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338725.1599768; Tue, 16 Jun 2026 07:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZO8J-0003SQ-7K; Tue, 16 Jun 2026 07:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1338725;
 Tue, 16 Jun 2026 07:22:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZO8I-0003SK-El
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:22:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZO8H-008Wfo-OB
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:22:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f9c4-2eae-0a2a0a5409dd-0a2a450bbd3e-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:22:49 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f9c9-212f-0a2a450b0019-d1558031b58c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:22:49 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so41677615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:22:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa9f2c0sm65589865e9.15.2026.06.16.00.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:22:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781594569; x=1782199369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWhuxszkX2FvAo4yqppz9zsn0IUjl7bh60RfgSaOJxQ=;
        b=G0p9Ar+bw3T5Aany0dwl510xFnK1W8tqEl+MAtOI/GwDVCoCoK2eS6BoN+pyvuxm1f
         xKR316SN+HuJrRgdpQj7zO+LNTXwXS2SWmi93QVM0RFZrJInWBP1YHX+aAZey9cnJuVW
         fVJbLR9NJg2Cy2n08mo3mjVGU38tIwPj0NLK2x76xYJjcBz3GYZmJ10Tl6952QysEX/3
         PGUWWqcaKxQwi3CWoRuUfxkARkAOG5OOKiMqx7cXwz9K0NmhXBP+Wq1rliynVevdD2Ft
         DcEFAamXHprS3HtNVzNwu8w9qfNvCikfVKENetf2YfESaRV3B+ztZbi/3vFCsgpRtg2N
         4BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594569; x=1782199369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWhuxszkX2FvAo4yqppz9zsn0IUjl7bh60RfgSaOJxQ=;
        b=SGbgMW9VRZ552QQYIKxy0pa6UWqIT0wx52o9rUrLYldc8TDShN/8P5DVVHTedWaKTy
         yVtmrEsf67zK0R1ZfrCQX72gVrvcu964hTKYy69JGYVAhziS094frpPP1TtQA5pnin8w
         w9Umj8h4vuKV2A/kdyHLjSpFBtlggJlvTsyyDWndfq9LeOrgVocx/KngqYo1Xg0wnN+Z
         XUtrF/0yi1iYYxPk/6lBmxkT06aA7PD9tp1faLnGQGcX1b2xrF/121Bs03FCFsUpF0G3
         iitCexCL5LSQMxnq4O0ZZmWG+NHGZKnIOO6z3vTKl/0RDWws3gzBU31o5Kl/ejxTw5fJ
         76uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v7hgkK7Odji3Wwes7rmi326XtFyJwYmP6oyNohKA9fz4u4KSl36hyPHkMWuxX31et8ginCTxK/Pc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4CdaMFohoQp6Nq5rLOsY6ckkeCqIuLloBjeFsU/qKmxNG/rWp
	nKvkH0vgUT5iiF8M6HjnIjhdmeeGvC59Ky72sFzHESBZn04NMqNfN4rB
X-Gm-Gg: Acq92OGU0lFE7BFsD2Wu8qUFbJu+2DlOmlw7/WFTi4xr2HPYyT0DBLI1EmpxfTsZshI
	WE32lOQYLRWkgm54WWoJAc+slBfhfp10n32bKDzPZw5q4EUuHLGmV31Vu08XcDuhRvOeMiNCFQ6
	fLAVBGSoVrafsOIth1UzLh25Jp9uq8qNFKQnfl4vqx3Ew4TUcxxiAcIs93CZ0hOuuf55JJcU6zD
	6GhCMQCKTLlMiuCde9a7iOfaO6kd1oq/nMSM7RtL0DwoCk6BYSyGm57HTGh6d/zviB/FWwirODg
	w3zcPaeshwjeh/e+QhNt5YIiwkacWnBNrPyE2375JGwv5onm+LNvLdNrVHGukfpwBIWCOCYkIPt
	6wuK5NGbsljAGNf/qkLTbdowEC5C11Dt0jdAWExfiBNOpfuhEcaW2pOKWEXn7I0kXGrhErnr3Tx
	WvSru7b4cxSn6PC+rKLw4PaiRRJkgrfjLAXvLU+Vc2XwX+OFUDltomu7wtX+WrAnI0t6IBUlaAb
	ZQBkUOUXMVM2FP9
X-Received: by 2002:a05:600c:4743:b0:492:1e36:bafd with SMTP id 5b1f17b1804b1-4921e36bb83mr206227365e9.37.1781594569045;
        Tue, 16 Jun 2026 00:22:49 -0700 (PDT)
Message-ID: <e0d6f8a1-749a-4e23-bd09-1665be6e431d@gmail.com>
Date: Tue, 16 Jun 2026 09:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 2/9] domctl: move XEN_DOMCTL_irq_permission
 handling to x86 code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <96a089dc-a0dd-4f40-b1e4-5573202bf532@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <96a089dc-a0dd-4f40-b1e4-5573202bf532@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781594569-1BD7FF3B-864B7D1F/10/73395122804
X-purgate-type: spam
X-purgate-size: 472
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6DE868CCFF



On 6/15/26 4:12 PM, Jan Beulich wrote:
> HAS_PIRQ is selected by x86 only, and that's expected to remain that way.
> Avoid the #ifdef needed by moving the logic to arch_do_domctl(). Leverage
> "currd" being available as a local variable there while doing so.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

