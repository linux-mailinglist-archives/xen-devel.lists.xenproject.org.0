Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMBFG5Ci3mkeGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E333FE550
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282079.1564750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJD-00051G-O0; Tue, 14 Apr 2026 20:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282079.1564750; Tue, 14 Apr 2026 20:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJD-0004z6-LO; Tue, 14 Apr 2026 20:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1282079;
 Tue, 14 Apr 2026 20:24:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJB-0004z0-SP
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJB-001nSu-0Z;
 Tue, 14 Apr 2026 20:24:29 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJA-0036wi-36;
 Tue, 14 Apr 2026 20:24:29 +0000
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
	bh=JVdik3zfubZEJqj2xS+6s9d1Kw5jWMMJH4KgQvL21Oc=; b=YAcauW58vGNSbNj9xQqUAK1Z3q
	LBQn16esHGukWatzeK1GO5mLpcW6f6PO7lNyqhkNKoK2OB6xO0/EF10kaCknxL6x/X80dGVNS3koe
	1BFMeHqpKygjAu4eJ8nfF8gQjNFvzgjVo9BGTIqt0XNsou4PGPCzgR+ue0mrwxiLulDo=;
Message-ID: <f92207ec-0f7a-464e-93a9-e0e9ee3a2cfa@xen.org>
Date: Tue, 14 Apr 2026 15:06:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] xen/arm: smmuv3: Alloc io_domain for each device
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <78e4f2e2c68cdb75aa1c0dd7e8b456c03aa2fe6f.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <78e4f2e2c68cdb75aa1c0dd7e8b456c03aa2fe6f.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06E333FE550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> In current implementation io_domain is allocated once for each xen
> domain as Stage2 translation is common for all devices in same xen
> domain.
> 
> Nested stage supports S1 and S2 configuration at the same time. Stage1
> translation will be different for each device as linux kernel will
> allocate page-table for each device.
> 
> Alloc io_domain for each device so that each device can have different
> Stage-1 and Stage-2 configuration structure.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index f9c6837919..19e55b6c9b 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2809,11 +2809,13 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
>   static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>   				struct device *dev)
>   {
> +	unsigned long flags;

In Xen, we are trying to limit the scope of local variables. AFAICT, 
this is only used within the loop below. So this can be defined later. 
Same ...

>   	struct iommu_domain *io_domain;
>   	struct arm_smmu_domain *smmu_domain;
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>   	struct arm_smmu_device *smmu = arm_smmu_get_by_dev(fwspec->iommu_dev);
> +	struct arm_smmu_master *master;

... here. Also, AFAICT, ``master`` is not meant ot be modified. So 
shouldn't this be 'const'?

Cheers,

-- 
Julien Grall


