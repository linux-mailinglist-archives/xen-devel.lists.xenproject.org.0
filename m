Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CjtHrQwxGkAxQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 20:00:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56B432AEBE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 20:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262962.1555234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5TSI-0002r3-Ca; Wed, 25 Mar 2026 18:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262962.1555234; Wed, 25 Mar 2026 18:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5TSI-0002or-9U; Wed, 25 Mar 2026 18:59:50 +0000
Received: by outflank-mailman (input) for mailman id 1262962;
 Wed, 25 Mar 2026 18:59:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5TSG-0002ol-Rx
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:59:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5TSE-00Dl8m-Bo
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 19:59:47 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c43081-2eae-0a2a0a5409dd-0a2a45089c3e-38
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 19:59:47 +0100
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c430a3-1950-0a2a45080019-d155da34f1f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 19:59:47 +0100
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b9825ba7e8dso22545266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:59:47 -0700 (PDT)
Received: from [192.168.50.2] ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66ad6c56b55sm109782a12.31.2026.03.25.11.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 11:59:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774465187; x=1775069987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esmbZU2btHIqRpTS2Duxt2q456pim/XTgYgC0Cgzg0o=;
        b=Rbpb2I5k3BcHEg0d3mkvPEYqsZ6UNpKf0bxU2F1jQkLtyHLhw6//zilUEBLWO+uy9X
         2QLfPFA6j+z8IPYOXt+h+YURSPM52r2sQMOd5YHYnICgb/ho96GQNk8pbbUJ5arRsrEt
         LQL3Cx/KKHfVD9hMj/lIh97RCORwy6xOkCoIX6zE3MhwI9vdA0uxopWhEdvvo8CSxItR
         VKGQdJVExWZgjd53abHaRLHcajFWOSIBhnv2uYTTY4FE04vQo9Y6hryj2tC+JfxaFOrN
         IPqFOiVgzTJwBYnrqQzGQmOvEGSOmUCWTovc0qvShvLyo3W9nBgwXZ4VgQUiyYgMWF3+
         VtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465187; x=1775069987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esmbZU2btHIqRpTS2Duxt2q456pim/XTgYgC0Cgzg0o=;
        b=tQSA6faSzdrhJiNf+46X5avPYCw5mHYSAPkNWeqSnlOb5MxSIZoX5H+174UtfT7zoH
         hEo3qYueKKV9NkNQ7UaFOCkG/bi78AzDAmdVPXj1yx1lZcn1tkqeIXNKtFracaqOn45a
         cavzA3Jfms78pIYx5zmw7PDo5xmDwZRnqNFFIUmESUUiWAr7FVvBMnFAokp14+6UEqpA
         jdcHrVTSZ/NIXwZV4Oca6imREl1eM8nr4/EKfz7puv5msTrANVWCtA7tINvR8Ec0Its6
         qRo7sJidaw/OZI7MFZYkLE8LRXqjNHJEm5Q6gfr8ZUZKFe6+dHpaPvdddk5IGa5JINW3
         kOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZrLFZBFq+tvWg0s/icqcSIiOdaL7qGngm/KkCb7E7+wjzv8i7pIfW+Eh4977L3Gte7nr8i9ohgsg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/HtYftg8xptQu/YAOva8RHKOuZmPHZKzXzJmIbxo2zjbpMrgS
	HwxNUoLwxbNI2trldyKFPiu4KxawJh3FjG2Pnu6+Nw2DvKbbfOCfXf4V
X-Gm-Gg: ATEYQzz0HQWrWU2MpN8kao24hSwuXw6P8LS0r6TSf2k6QRw/akbr1SEmMY6c5nOx3C9
	Lvu5O+c7BSJnW2QUedultiJMMkvpOiIgWYIYASfFvJmOFICRopp+0peBH2qG00uKFRuR6tHGi2V
	7gSTueTnhRyhVtnoNbPfbBa/TKpUm0+Os0PSLUsSdV73NrD5Dz9MBQcTKch8YPb3/BUkE+Js/Ex
	l2FjX8aLF5VGlUv8eYEv0u5ktbTxKzxSsX6LwvXrBbjcUfJLAnmKNgabeFlAHIpHZRhWLxr9pKo
	5rAoNDxuTf0jtY7DUQUdiVYGk2+KNPE625i88dXq2nguhCcKcCGC0AsjeJ5wzijV9v91nCP0R0H
	lC/BNH7JI6qC7kQvOP1bMJVx9ZCk4VeERvLEcL2Owy+0QY9Ms7sWfXmcg+SagJwG11Gq5rdweQA
	0d1YMlkzbVyRmkkLI6CmYzoQ90HA==
X-Received: by 2002:a17:907:1ca3:b0:b9b:183a:7346 with SMTP id a640c23a62f3a-b9b183acecemr173427866b.12.1774465187032;
        Wed, 25 Mar 2026 11:59:47 -0700 (PDT)
Message-ID: <89f644a3-9d91-4971-8fb9-6b2b5cca5b29@gmail.com>
Date: Wed, 25 Mar 2026 20:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] xen/arm: smmuv3: Maintain a SID->device
 structure
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <jroedel@suse.de>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <1621f3abdcaac0e941df7474dfaaa035fb819b4c.1774305918.git.milan_djokic@epam.com>
Content-Language: en-US
From: Mykola Kvach <xakep.amatop@gmail.com>
In-Reply-To: <1621f3abdcaac0e941df7474dfaaa035fb819b4c.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774465187-E8E85726-A98D719B/0/0
X-purgate-type: clean
X-purgate-size: 8087
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:jean-philippe@linaro.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Jonathan.Cameron@huawei.com,m:eric.auger@redhat.com,m:zhukeqian1@huawei.com,m:will@kernel.org,m:jroedel@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C56B432AEBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 24/03/2026 00:51, Milan Djokic wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Backport Linux commit cdf315f907d4. This is the clean backport without
> any changes.
> 
> When handling faults from the event or PRI queue, we need to find the
> struct device associated with a SID. Add a rb_tree to keep track of
> SIDs.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Acked-by: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linaro.org
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cdf315f907d4
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Your Signed-off-by is missing:
Signed-off-by: Milan Djokic <milan_djokic@epam.com>

> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++++++++-----
>   xen/drivers/passthrough/arm/smmu-v3.h |  13 ++-
>   2 files changed, 118 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf153227db..73cc4ef08f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -809,6 +809,27 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>   	return 0;
>   }
>   
> +__maybe_unused
> +static struct arm_smmu_master *
> +arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
> +{
> +	struct rb_node *node;
> +	struct arm_smmu_stream *stream;
> +
> +	node = smmu->streams.rb_node;
> +	while (node) {
> +		stream = rb_entry(node, struct arm_smmu_stream, node);
> +		if (stream->id < sid)
> +			node = node->rb_right;
> +		else if (stream->id > sid)
> +			node = node->rb_left;
> +		else
> +			return stream->master;
> +	}
> +
> +	return NULL;
> +}
> +
>   /* IRQ and event handlers */
>   static void arm_smmu_evtq_tasklet(void *dev)
>   {
> @@ -1042,8 +1063,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
>   	if (!master->ats_enabled)
>   		return 0;
>   
> -	for (i = 0; i < master->num_sids; i++) {
> -		cmd->atc.sid = master->sids[i];
> +	for (i = 0; i < master->num_streams; i++) {
> +		cmd->atc.sid = master->streams[i].id;
>   		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
>   	}
>   
> @@ -1271,13 +1292,13 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
>   	int i, j;
>   	struct arm_smmu_device *smmu = master->smmu;
>   
> -	for (i = 0; i < master->num_sids; ++i) {
> -		u32 sid = master->sids[i];
> +    for (i = 0; i < master->num_streams; ++i) {
> +		u32 sid = master->streams[i].id;
>   		__le64 *step = arm_smmu_get_step_for_sid(smmu, sid);
>   
>   		/* Bridged PCI devices may end up with duplicated IDs */
>   		for (j = 0; j < i; j++)
> -			if (master->sids[j] == sid)
> +			if (master->streams[j].id == sid)
>   				break;
>   		if (j < i)
>   			continue;
> @@ -1486,6 +1507,80 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>   
>   	return sid < limit;
>   }
> +
> +static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
> +				  struct arm_smmu_master *master)
> +{
> +	int i;
> +	int ret = 0;
> +	struct arm_smmu_stream *new_stream, *cur_stream;
> +	struct rb_node **new_node, *parent_node = NULL;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
> +
> +	master->streams = _xzalloc_array(sizeof(*master->streams), sizeof(void *),
> +					fwspec->num_ids);
> +	if (!master->streams)
> +		return -ENOMEM;
> +	master->num_streams = fwspec->num_ids;
> +
> +	mutex_lock(&smmu->streams_mutex);
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		u32 sid = fwspec->ids[i];
> +
> +		new_stream = &master->streams[i];
> +		new_stream->id = sid;
> +		new_stream->master = master;
> +
> +		/*
> +		 * Check the SIDs are in range of the SMMU and our stream table
> +		 */
> +		if (!arm_smmu_sid_in_range(smmu, sid)) {
> +			ret = -ERANGE;
> +			break;
> +		}
> +
> +		/* Ensure l2 strtab is initialised */
> +		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
> +			ret = arm_smmu_init_l2_strtab(smmu, sid);
> +			if (ret)
> +				break;
> +		}
> +
> +		/* Insert into SID tree */
> +		new_node = &(smmu->streams.rb_node);
> +		while (*new_node) {
> +			cur_stream = rb_entry(*new_node, struct arm_smmu_stream,
> +					      node);
> +			parent_node = *new_node;
> +			if (cur_stream->id > new_stream->id) {
> +				new_node = &((*new_node)->rb_left);
> +			} else if (cur_stream->id < new_stream->id) {
> +				new_node = &((*new_node)->rb_right);
> +			} else {
> +				dev_warn(master->dev,
> +					 "stream %u already in tree\n",
> +					 cur_stream->id);
> +				ret = -EINVAL;
> +				break;
> +			}
> +		}
> +		if (ret)
> +			break;
> +
> +		rb_link_node(&new_stream->node, parent_node, new_node);
> +		rb_insert_color(&new_stream->node, &smmu->streams);
> +	}
> +
> +	if (ret) {
> +		for (i--; i >= 0; i--)
> +			rb_erase(&master->streams[i].node, &smmu->streams);
> +		xfree(master->streams);
> +	}
> +	mutex_unlock(&smmu->streams_mutex);
> +
> +	return ret;
> +}
> +
>   /* Forward declaration */
>   static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev);
>   static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
> @@ -1495,7 +1590,7 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
>   
>   static int arm_smmu_add_device(u8 devfn, struct device *dev)
>   {
> -	int i, ret;
> +	int ret;
>   	struct arm_smmu_device *smmu;
>   	struct arm_smmu_master *master;
>   	struct iommu_fwspec *fwspec;
> @@ -1532,26 +1627,11 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
>   
>   	master->dev = dev;
>   	master->smmu = smmu;
> -	master->sids = fwspec->ids;
> -	master->num_sids = fwspec->num_ids;
>   	dev_iommu_priv_set(dev, master);
>   
> -	/* Check the SIDs are in range of the SMMU and our stream table */
> -	for (i = 0; i < master->num_sids; i++) {
> -		u32 sid = master->sids[i];
> -
> -		if (!arm_smmu_sid_in_range(smmu, sid)) {
> -			ret = -ERANGE;
> -			goto err_free_master;
> -		}
> -
> -		/* Ensure l2 strtab is initialised */
> -		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
> -			ret = arm_smmu_init_l2_strtab(smmu, sid);
> -			if (ret)
> -				goto err_free_master;
> -		}
> -	}
> +	ret = arm_smmu_insert_master(smmu, master);
> +	if (ret)
> +		goto err_free_master;
>   
>   	/*
>   	 * Note that PASID must be enabled before, and disabled after ATS:
> @@ -1796,6 +1876,9 @@ static int __init arm_smmu_init_structures(struct arm_smmu_device *smmu)
>   {
>   	int ret;
>   
> +	mutex_init(&smmu->streams_mutex);
> +	smmu->streams = RB_ROOT;
> +
>   	ret = arm_smmu_init_queues(smmu);
>   	if (ret)
>   		return ret;
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index ab07366294..ab1f29f6c7 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -639,6 +639,15 @@ struct arm_smmu_device {
>   	struct tasklet		evtq_irq_tasklet;
>   	struct tasklet		priq_irq_tasklet;
>   	struct tasklet		combined_irq_tasklet;
> +
> +	struct rb_root		streams;
> +	struct mutex		streams_mutex;
> +};
> +
> +struct arm_smmu_stream {
> +	u32							id;
> +	struct arm_smmu_master		*master;
> +	struct rb_node				node;
>   };
>   
>   /* SMMU private data for each master */
> @@ -647,8 +656,8 @@ struct arm_smmu_master {
>   	struct device			*dev;
>   	struct arm_smmu_domain		*domain;
>   	struct list_head		domain_head;
> -	u32				*sids;
> -	unsigned int			num_sids;
> +	struct arm_smmu_stream		*streams;
> +	unsigned int				num_streams;
>   	bool				ats_enabled;
>   };
>   


