Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKz0Jey9HmpNKQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:26:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED662D73D
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324774.1590278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNFt-0002Ho-2W; Tue, 02 Jun 2026 11:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324774.1590278; Tue, 02 Jun 2026 11:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNFs-0002F0-W3; Tue, 02 Jun 2026 11:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1324774;
 Tue, 02 Jun 2026 11:25:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wUNFq-0002Eq-Kg
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:25:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNFp-00ECv7-Tq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:25:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a1ebdb7-e002-0a2a0a5209dd-0a2a4504cda6-46
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:25:53 +0200
Received: from [103.168.172.147] (helo=fout-a4-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a1ebdc0-1dec-0a2a45040019-67a8ac9392f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:25:53 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id E2226EC0764;
 Tue,  2 Jun 2026 07:25:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 02 Jun 2026 07:25:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 07:25:48 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1780399551; x=1780485951; bh=K5sui5quYk
	rRkd/crywcgQCN50nIFLxYLm84oclFdRw=; b=ayNugKqSu3H3snCTRwekpay46H
	/q1KvZ6xA3Sc0Ok9mjJnIlm3LGYCaFCPYzGQXzxWA0JmMbGYq9wkfx4qXgvmx+BW
	9co94M/FQgYm9t5GVzBvHvqw8V4Vo1zNtqMtac9fLd+GCO6Kyh8n0utmzd9/hvJ1
	g49JGS19GB24NhJo4UuQkahq5tFtN+j9+cgDKJ+/rYbQi53pH6O7IxgP5FtHpOib
	99nQsE62fOCEmchxAEdwPYb+hqiNzSn6HSRmH0N3yH6eYMbcGqBP1833AKM6+4bh
	Cjg6iF28uNAwnxEdsAX+cfkodwd3XuvjUWkxeZ2bMRPmDhgQ2o0KqBFWQeBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780399551; x=
	1780485951; bh=K5sui5quYkrRkd/crywcgQCN50nIFLxYLm84oclFdRw=; b=P
	dOv8OtP3bG2IXkSY5ITZLu6isRE0ymidKso858/RSm0wNL44N47JW3cfVmqfwKA8
	UH3t8fi79XoWtmWezuT8JirYrGQ5QBKEIQeDixqS+fnclA/oMnhbI8VXGy275S8L
	08CAPeKzRtMc14pw/5yZUziFFq8JQ9WTnnVzF0tP0Xh91atQxeX7FDi815O7zw1l
	CEuuNRgtziQTClnnfJzQYWsYmsj34DAZFSEIOTk5HMnspsnGy3uFxoqx8+bTwn+6
	3XtZqSkpgceGB2QlqD2mqj8rvlOguVsNyGWU8S2sUCW4QnkV7SbQ1nNFSeTD/dzH
	/VCoSdgS8uuUqUK7dwVIA==
X-ME-Sender: <xms:v70eanrc_RurIv_zYRnwkbZtNYfCNDuzGMBw_C7rzNfqv2QIEMrIvg>
    <xme:v70eaoD6Dl7hhTLOEZZ26Zy4SBdtx4bwSWr-iqTOL4-FwzYGrWSLCC91zhBZh4eK0
    TvahEW-kWOVsvmkaQuVru9jGYMBcLzB5SA8CukO6DZZ7Jd-gfw>
X-ME-Received: <xmr:v70eagfKX-zyPu_dV91cetiRD6Ktdg7H-EQJyYkVAeMyAVPSH55TZlNB_k0vAAB9DDpD5A>
X-ME-Proxy-Cause: dmFkZTFtxdGGjPsqUdjVyWik1pHfoBY6CAXMMEMyjtwsgmaKKj1sYm2TMs+yt/0KtV5Rtn
    UQbWtAmI2tpmr+pdLqAH1UN9Xo7veEO3EnW6icGRlT6IKTQXeRl9jEIXwIoWzUazxL+3wQ
    4KgxStVJq37j6XGrAs+++gy74YbcQ0CaLi4aL+eMokbFU4+l5+1LfdLFN5yKd2QBDl5IhG
    Va1tbOrUrrzOMMQKJX+q9g8zPQboz5REFZ9WUC+9BBsRJcF9RgvPousyw1v648cTOSh2a/
    hhy6dAu6tx3oghXa6ObldzboslI0QE/acHqK5TEhIprtUiI2uroPGhFKbmtSLWfwq/wQan
    DeHGgYeQ+Zz5RuseGnxMgDg8kihDRl9rBzb7IM4uN4nO5J5DNTtSib9aP3YsPmXXSGXhiE
    4+LFpF1qYtYAUuEwskYHXW3eWbZMmHVusJazAeVYrx3CqixeM4l8oissT1RkgiXGWiIP/7
    /NIipuYVkHiXlV/pNVkPNgS35/IQZ+Wjg3QZAV/QNm2jIrbzHv5G/CgSxBYoiL2c5lq4m1
    UUDahPqi6oWa3lL3IJeH3qlKKAJvtdDYw/SGzl7Cl0eyIqEWKVvb1kFraSCExaaWgPWETV
    5hWrZsCjbb/U6AR2PsZErCUWv5mMZt+bSTP1CtMOxCzdUU0Y3kITK3+CZuXA
X-ME-Proxy: <xmx:v70eaovuLGoUykVR8R0wr_GPBbRg8LOwuCRJBo_RTKUzcFEmkHuscg>
    <xmx:v70eavh9gJ7Vz6nwLwDmzBdesGqsF_MJHjNt3teLh9TWIjlVzCHjzQ>
    <xmx:v70eaou-LCxF7WoRDn3usf7PlJDh4gEK_gLxQDAt7ziQrtmKj180fQ>
    <xmx:v70eai_mT667FA2nxYxPvXxomOluMe7wJM0q4FHdLkL05ruHPQwzPw>
    <xmx:v70eatnmN3nVPi32oZmKdzLGiVakToL7MAb9xkPTq2fb3ztjVqk6v8eH>
Feedback-ID: i792e4853:Fastmail
Message-ID: <2a8ec9b9-7dd0-444a-9a5c-60d979940b62@invisiblethingslab.com>
Date: Tue, 2 Jun 2026 13:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file
 system
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
 <a456446d-3dc2-414d-bc33-b5c50c088741@suse.com>
Content-Language: en-US
From: =?UTF-8?Q?Szymon_Aceda=C5=84ski_=28accek=29?=
 <accek@invisiblethingslab.com>
Autocrypt: addr=accek@invisiblethingslab.com;
 keydata= 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
 3KnQZYrxAo+nbJoTkTBL3mACY9bPjKbYCJS5kE4=
In-Reply-To: <a456446d-3dc2-414d-bc33-b5c50c088741@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780399553-2A37F3FF-12859637/0/0
X-purgate-type: clean
X-purgate-size: 441
X-Rspamd-Queue-Id: 00ED662D73D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

On 6/2/26 12:04, Jan Beulich wrote:
> Hmm, did either/both of you try out what happens if you use BUG() or BUG_ON()
> in pre-ExitBootServices() code? Xen's exception handling isn't hooked up yet.
> The crash will likely be rather hard to analyze this way.

Well, that's a good question. Just tested and indeed BUG() so early
results in a hang with no useful output.

I'll replace BUG_ON() with blexit() in v4 in a moment.

Szymon

