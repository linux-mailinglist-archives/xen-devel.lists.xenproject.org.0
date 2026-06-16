Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9hVONB6oMWppowUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 21:46:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD44695000
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 21:46:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=wqSHpXiV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1339617.1600812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZZj1-0003QO-68; Tue, 16 Jun 2026 19:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339617.1600812; Tue, 16 Jun 2026 19:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZZj1-0003Om-1L; Tue, 16 Jun 2026 19:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1339617;
 Tue, 16 Jun 2026 19:45:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wZZiz-0003OZ-7K
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:45:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZZiy-00CmOO-2b;
 Tue, 16 Jun 2026 19:45:28 +0000
Received: from [2a02:8012:3a1:0:adbb:f4c5:7acb:2fe1]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZZix-00FWx6-2r;
 Tue, 16 Jun 2026 19:45:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=NYubC972DuQAHvEqmffR5xPihPKjG6dYLSM8vLNRVfA=; b=wqSHpXiV5Y9nSr+CVezmWDATx9
	fx0KPm6QWYIJwMZO2BBMhWEEtQ+2FOBaGTH073M0ZurEAqOc56vjZUlrtlAQ367Vk6dSUgfJnFHwu
	siWZAde6mtk+LZHbf91M6MPh3fdzHUZMEneWgygtPsKsulNXOeuQKwVZzTwVeAlNERvo=;
Message-ID: <ce107cd6-3d2d-45eb-bbe5-f700d5a25827@xen.org>
Date: Tue, 16 Jun 2026 20:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
 <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
 <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
 <f258e2e5-f7ba-4183-8b33-c3a169dc1d7c@epam.com>
 <bd0588e3-2824-4c2a-a1cc-6ff62fed7f62@xen.org>
 <21F24A06-115C-4384-89AF-B6A04029F356@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <21F24A06-115C-4384-89AF-B6A04029F356@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FD44695000

Hi Bertrand,

On 11/06/2026 07:12, Bertrand Marquis wrote:
>>> This primarily targets systems where the SMMU does not support Stage-2 translation.
>>> If we decide to keep this code, I will address the associated security considerations and document the corresponding AoU in the design. Otherwise, we can fall back to supporting only the "nested" translation case.
>>
>> Thanks for the feedback. I think for such setup, I would consider whether we can use the stage-1 in Xen to protect the device. AFAIK, this what Linux will do.
>>
>> I would be interested to hear what the other maintainers think.
> 
> Giving access to the smmu to a guest means giving it a solution to access whatever he wants through a DMA engine.
> This is not less secure than no SMMU at all but I would definitely think that in such a case SMMU should be reserved for
> Xen to use it to protect from accessing other guests memory using DMA.
> 
> Now i know that in some setups there are cases where a specific device cannot be used without an SMMU (mostly GPUs
> but there might be others). In that case, the device cannot be used easily if the kernel cannot use the SMMU to remap the
> memory at a convenient place for the device.
> 
> We should not disallow such cases completely but we should give strong recommandations when such a setup is used.

Thanks for the feedback! I think before allowing S1 without S2 we need 
to make sure it works and I am not convinced this is the case today.

Cheers,

-- 
Julien Grall


