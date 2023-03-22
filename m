Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF66C4490
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513152.793736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petQn-000467-EJ; Wed, 22 Mar 2023 08:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513152.793736; Wed, 22 Mar 2023 08:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petQn-00043S-BA; Wed, 22 Mar 2023 08:02:49 +0000
Received: by outflank-mailman (input) for mailman id 513152;
 Wed, 22 Mar 2023 08:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1petQm-00043L-6x
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:02:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed580cd7-c887-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 09:02:46 +0100 (CET)
Received: from MW4PR03CA0260.namprd03.prod.outlook.com (2603:10b6:303:b4::25)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:02:41 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::f7) by MW4PR03CA0260.outlook.office365.com
 (2603:10b6:303:b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 08:02:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 08:02:41 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 03:02:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 01:02:27 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 22 Mar 2023 03:02:26 -0500
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
X-Inumbo-ID: ed580cd7-c887-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip1FXwsz7u5S6x0SX/8t3yALnj3Mpy/JdY57KKA9vMxafsXaV9hZiI+DjGW8F/JPHklvUvySZvE5dUhqUNDCtWe3h0y1l4SUUFfUpHoRa7SAFID3kzsYV+3TQq5Q2NCTY1egUK/3Q/5pb/P4OTFXN/KTyGq5yYOuLXlCiaulnpebINVN0pqcivUgKDQR8g6vcbRtIwW/eICsPQxfng01z8DE2019uOJHF+aiAuFSn1CBNhWg23ugS75NsFNyed4LZAGeqMsHNMEzdOzrFkj0sA+y9lQHAOmuhzLpHiFh8CtR0oQcRMLt1r+z56yMIbi2n70vsfsZbVaPsB2Zxeo2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqAYsU3xAMp2oyVH7h8cB3+yNLdTVgONH9c5FbS3M2E=;
 b=NfxPA2Jncc7gNd58/6P+Py/Nv9GQ2d6TLJ+RD7uWmyDwi2E8fGbc2YTTzRQdqg3QdPmPBWoQzvXG/9apytOnKrYlVbUXa5yIxoDlmffmli44cRAwL5gGHRasFbhddtJVod0lFaSm4COCUW7/fuQWJfCR4XTUmJq5QW0nH6riCIQXDj0f8nunAI1CLuuXLkoyWKxTCAc+2bAwPGspXqM5q6SbcWw/m7xnbbcuX3gySargftpoUe5lcLq1irOUS+BBRbKPy9uVPfMSoQ3SoBuSmnG1ymxWECWvtxRaWDGJG638kklofPQJix00SqZOVVHXwvBCUz9cRfIZwBkk9CKtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqAYsU3xAMp2oyVH7h8cB3+yNLdTVgONH9c5FbS3M2E=;
 b=yXINFmprWqBFo3tsq8QG2SfFIfzKrXWGzWQ4Y6qdQ9IrU5RT6rTYAMQoCgoCjDvzsqQBpYXDwTegTbz6VbdeMhLgVWrPfPuPiCGn/vy4nBZbPtwsloq7N9TL34YojksLjpx5grJg++TM54SCbOaoFQ5lXifTCLZBlKRlHX+qdPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e3f3bc32-ab6e-cf8b-b3ae-e6922981d839@amd.com>
Date: Wed, 22 Mar 2023 09:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-5-Henry.Wang@arm.com>
 <a2287b5b-40b1-aeab-8f07-413853d2484d@xen.org>
 <AS8PR08MB7991321C63BE43F1C54D21E092869@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991321C63BE43F1C54D21E092869@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d3ee6a-97e9-49da-5547-08db2aabcfae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MhLejSaDT8b75N2muEN229ToFTg24oX7t3Qw9eAGtVDOINvZxtkyLI5YzZGzUi3+9JQIiurNlACeUYz+GAtA279azA6YSYrLOpQY9PXyGv+iuSt1IJdfXTrWgVPxKTtsK3pfUuVxvnPY/ql+NBQyutmEaM386c3CSABzMuNau5ew0LVEGu01lv6ShSp7Frz0ubiHQDT/dgTMlQq1pCMZBaRNsXnzkuxfj3MKw0Uwu1dAbMXTCm0HxQ0BSDs5tSVvdVhkPAYP6iKIBo5M9FbaT74s0FZw1ahqdGQL0nUzziIvT5OT7CW4RT/GfXayxKHBBvArpgcNy5EctyiewKuJe1rZpjzlB7vv1/kKg4FgIFHCC1H58fjHan8WLWWZm+Uo+s5M3Wz8aV4WDBUbxBdyEFGuTBElt0xCQW/ZXGRAuZhPA2hUR169TnYf7bPOR/Iso3SE3/jFq2NC9y4aZiehFtZolRztNnXjlI/CwDHKX3L/etnd5++yEzFjKw57QecqAaN9C9+JjyR39fPwq5ecg+PDCwiqwEBfeLB9XsjS+Gr8M1TBdgWL7ffI0EbQcYsaM0Cm0WSd43hkekiClSM1ruuV3rR2dFR64IGdRShEUGBlPozXswampe1o2ZlbRyFAFC88lBfuZKjPU12YkSb8t0nPBUqb8KJJ9GskxAuKzT1aiy353eAqwn+kD/euMTw0duzhJ6LjzFAeRyv1ORscDhRkVZIw50ErYMbPCKhDUCopO5QEE2zFzApKmwK8orIvpKpg4nYN2UB8TH/I+Xdvqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199018)(36840700001)(46966006)(40470700004)(336012)(40460700003)(5660300002)(53546011)(356005)(8936002)(54906003)(426003)(47076005)(41300700001)(31696002)(86362001)(316002)(16576012)(110136005)(36756003)(82310400005)(70206006)(8676002)(478600001)(70586007)(83380400001)(4326008)(40480700001)(26005)(31686004)(186003)(44832011)(81166007)(2906002)(2616005)(82740400003)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:02:41.3733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d3ee6a-97e9-49da-5547-08db2aabcfae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867

Hi Henry,

On 22/03/2023 03:21, Henry Wang wrote:
> 
> 
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
>> p2m_final_teardown()
>>
>> Hi Henry,
>>
>>> ---
>>> I am not entirely sure if I should also drop the "TODO" on top of
>>> the p2m_set_entry(). Because although we are sure there is no
>>> p2m pages populated in domain_create() stage now, but we are not
>>> sure if anyone will add more in the future...Any comments?
>>
>> I would keep it.
> 
> Sure.
> 
>>
>>> @@ -200,10 +200,6 @@ int p2m_init(struct domain *d);
>>>    *  - p2m_final_teardown() will be called when domain struct is been
>>>    *    freed. This *cannot* be preempted and therefore one small
>>
>> NIT: As you are touching the comment, would you mind to fix the typo
>> s/one/only/.
> 
> I would be more than happy to fix it. Thanks for noticing this :)
> 
>>
>>> -    BUG_ON(p2m_teardown(d, false));
>>
>> With this change, I think we can also drop the second parameter of
>> p2m_teardown(). Preferably with this change in the patch:
> 
> Yes indeed, I was also thinking of this when writing this patch but in
> the end decided to do minimal change..
> 
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks! I am not 100% comfortable to take this tag because I made
> some extra code change, below is the diff to drop the second param
> of p2m_teardown():
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> @@ -1030,7 +1030,7 @@ int domain_relinquish_resources(struct domain *d)
>          p2m_clear_root_pages(&d->arch.p2m);
> 
>      PROGRESS(p2m):
> -        ret = p2m_teardown(d, true);
> +        ret = p2m_teardown(d);
>          if ( ret )
>              return ret;
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> @@ -201,7 +201,7 @@ int p2m_init(struct domain *d);
>   *    freed. This *cannot* be preempted and therefore only small
>   *    resources should be freed here.
>   */
> -int p2m_teardown(struct domain *d, bool allow_preemption);
> +int p2m_teardown(struct domain *d);
>  void p2m_final_teardown(struct domain *d);
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> -int p2m_teardown(struct domain *d, bool allow_preemption)
> +int p2m_teardown(struct domain *d)
>  {
> [...]
>          /* Arbitrarily preempt every 512 iterations */
> -        if ( allow_preemption && !(count % 512) && hypercall_preempt_check() )
> +        if ( !(count % 512) && hypercall_preempt_check() )
> 
> If you are happy, I will take this acked-by. Same question to Michal for his
> Reviewed-by.
The diff looks good to me and surely you can keep my tag.
However, we might want to modify the comment on top of p2m_teardown() prototype as
it assumes presence of preemptive/non-preemptive p2m_teardown() call (at least this
is how I understand this).

~Michal

