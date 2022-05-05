Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8A51BDEA
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 13:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322012.543199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZWv-0003Pb-So; Thu, 05 May 2022 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322012.543199; Thu, 05 May 2022 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZWv-0003N1-PB; Thu, 05 May 2022 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 322012;
 Thu, 05 May 2022 11:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmZWu-0003Mv-Et
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 11:20:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55920b4b-cc65-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 13:20:14 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-7IYbrM9aNxaI2lO3217H7Q-1; Thu, 05 May 2022 13:20:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3399.eurprd04.prod.outlook.com (2603:10a6:209:7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Thu, 5 May
 2022 11:20:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 11:20:14 +0000
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
X-Inumbo-ID: 55920b4b-cc65-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651749617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mVTX3TkakSlTqqRukpP5/yEJBJhUFNk6zXYPPW9fKE=;
	b=n3EFAGNjinVbDQd0MXonmoBlPFBDl0/uvEgILhO8omi9BREcGzNSDVnFiJ9AMrGP12LLmX
	Wc6pRe8Xb91kisgq9we80ySCD5mB13g9YwYZNb8W4hqmRGE3H3Cv42xU/k9EfMdPW5tb18
	UfDSp/9iuBRaPeG6xHefVILf87CtP2w=
X-MC-Unique: 7IYbrM9aNxaI2lO3217H7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnC+eK0SLCMjMPWLs7PW8hRsag69oI12Yf0HzonGH1MA+bGqovQgopPZ1qXEx9i8mO2CDXxL8DeeSz939rfTOsSXRaeeLVKg1gE+NF/Y+CvGFQ7VvRNnVzYnNoXE5Py4+MY6FsW4J3LbNq0qqZHAcHsC+ZyOh1V8IdAj0exNBa6PF5jSxhQCslc/XNiOb+tF/FIEOgV5/okleRP6Tl4SmAI79FYXMOEhcJeVpTTsQfhWTk2uFvqVv2Ur2MlK1tIlrnbulEle9GoqZKkYJ2XJjcRWECfZfkpU4ZsBbNc7Zw9pPkDItiEtDaMljZ7d6Bjv/8JYOwPQ2xiOsBNLawJKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mVTX3TkakSlTqqRukpP5/yEJBJhUFNk6zXYPPW9fKE=;
 b=Y+36MiB4u1aHNK9DezaJLJStXRqOn0WUWtPkDCDms5Ya5oJK3j1eBa+lQcYucq5mx4uZ+prQ71spfXP0o6dtzbNoPkke9j4lxgx4JiuFKWMe33AVg/SIKvWc5Xe0lavNWk91mreF2cP5w2wPz5+aCvVP8WJlbGDSPuENc0wWBoZNVMENjkqd3C8jh/E9K5pBHEzztmZ7Ee11D8W4Kjwq6WRYPOq+VbHiBYs1e7QJoOeaE4HZX0xzHpFtROgDIMgwYbojL2hYCmTUcOacT1OxRCAMBkTZtqBzTLZtSfLSd1arLD9BIDAHBMa8Oo2dEb35osGrzobxsRUXyWJ4ZLaKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bf31f91-9a05-ac91-a258-d28d6ad9084d@suse.com>
Date: Thu, 5 May 2022 13:20:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-3-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505103601.322110-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2ff6db-7543-4b78-b62a-08da2e8939f4
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3399:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3399B6FAECB388CF23215A99B3C29@AM6PR0402MB3399.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gl3c535e77Rv31bvpWwXchbQYdnCuYbSjk6ypm1NyFI63Oz2YJRJ1/KmV065fyhrokd4686lx1BsOEQArl5RjHf4xJezRNpqzb1k0jLiIEl8vROSIzokT1al2oKg2cIn0pKSseSqBLaZVEYnsjfZGmB/C1p6fOUbZIecQ6J6elA+WZps+yTjqRI22Jz7LJBlh9H+eHjwFqpN9jfHtvbcxoCuS4UsFCJ35jFVLZpKDrdhCvwoshweCuTTCQFRPhZziebF7aslyEOO9I74vtP8+Qct5HZ2Z/qXsnEh/LrvUx/MbX8pj6B/5/edc4ou2Voa0n62nFrSs/vgR1ywqSxMM/JtLcvYVfYKEryCMZeazxTsqzXi2+3L4eN6WZFiEKwWXAdb+d4xqxM0A1MczxyK+49tNWujmOQN/BksrPw9tYN/1SwSQonKpcdWu15b4OLm+ArEbOlyX+gkY+pIbDhzRCiqdoxzDNhNwLc4KFUFIGnWRDsG6Xab986wOgxBkUxlTwfiRN4UaJEr4Mc8pdVhdkIBXmsHuhPpDwsoBK4e2zcXIL3yY+A3uNM+dNF3eWRIRIcZnq1Qt7RmpWnb+TYH5ZX7HO94KR3RU5uuZo3Ez43ch77p+PUl+EC2i+PR+d2MBpiWYlZNDeLqvGPLsoJnRB3aNw7EMnwMrIDjlVhocTWncZ3R3UlAuMItXJt8dpBk8AaDrVC9Ll7M4PHRPVawZEK3muXVfc3doZrJ8mc5n+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66946007)(4326008)(66476007)(66556008)(8676002)(6486002)(508600001)(6512007)(186003)(316002)(36756003)(2616005)(86362001)(4744005)(53546011)(38100700002)(31696002)(2906002)(31686004)(6916009)(5660300002)(54906003)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlFWVFB0SlNZTWYzVEJneHFIb21IdWJVMCsrUkxPSEJUc1pqc3dNQm4yT2pG?=
 =?utf-8?B?YThDQmJoOThkektaenFua1F2UzZSeEZwTXp0bWpTSGhpMDg1Ni9ndzQ1dUF4?=
 =?utf-8?B?OGZNaTJjbTlNZ2VjMVJXdlRveDFUYU14RVkvTWR4aUIyZ3JocUJoMFVoYVV2?=
 =?utf-8?B?dFQ3N1ArVE95L2J2Z2NjYXBpb2l4bUtPMWx3aHFEY1Z5NFpMYjNhV2craXIx?=
 =?utf-8?B?dG8vM3lMSzRvUDRobUx0dUZOOExDZTYrWGx5dUIrKzI0a0pNOFRQMGFoWFov?=
 =?utf-8?B?bk5kWFR3L1FheUh1SUhpUjBFMUlHbHdrVkIzK0tSRC9RS1B0YjhreXVQMVhi?=
 =?utf-8?B?YkJFUVRURFFJaUNreXNXaHJHdEkwT2ZxbXNJa09RUmtMY0V4Z3VSUHcyUFlp?=
 =?utf-8?B?c21zaFR1VVplSEwyYjJmMEkwZ2pTdFI5aVIzQTIyekJ3WUdCOGtrQS9aMG85?=
 =?utf-8?B?amMyUkhLcVA0MnhJQUJqY3plL2J6eldqNnJtRkNlb1JoTTlSQlgwcjF0N1d3?=
 =?utf-8?B?RlRRaVREcXBkOUg4V2JaaXkyMHlscGZ2cHlzaENSVXNhTUdDS0FoVjJVMko0?=
 =?utf-8?B?ZldPZmJtVTRGaU16eFF1UlEyc3dpc2hjYmRsT2ZZWHhyT1BuQkxyaEk3RHF4?=
 =?utf-8?B?Q092aFNVWE5oaWQyMllMTVZNWklnUllIRFp3aTVZdzkrL1IvaW9ZVkJEb09j?=
 =?utf-8?B?S3kxcnlkcXFmSDZQOW9XeTdOK1hraEhuVlVBdThKQ2w1bjF3K0crcFBHNWt1?=
 =?utf-8?B?cXlqdUlOOTFVaDVaU0kvUlc4c2pDUUZSQWYzRlR2SGRpc3JZSzcyQWxNMTRn?=
 =?utf-8?B?aERTMXJrTC9BY3pDc0FsWkpCMVJuQTcvNHd3OWVFY3ZicWVHT0FMNm1OVG9M?=
 =?utf-8?B?WHdJS2pyMU1OeFhwSFZ5bFY4VmRsVndXU2lqdWUxUDhYUXpuTmMxUUY3TTMy?=
 =?utf-8?B?RlBRam85blYrakZkUmlXaERBU05jTnJYQkRrRi9VNnZ5aE1BRkpPYkVFVUYz?=
 =?utf-8?B?OTZ4aHpYUVZyT1ptb1J2c3hvZUF6QURJakpGdlJRT1RlanVocExXbTl2MzFq?=
 =?utf-8?B?Ni9vTHZ2cjdaTmo4WGFVamVNcm1MUXRYU3BCNFpkWGRVS2xCYnBSbWNodTJP?=
 =?utf-8?B?RE9NZ3RHaEozWVQrZk1WaDBEZ3I0SzVZYXQzcmtoM1hqbG45cWR2SUVhYmVK?=
 =?utf-8?B?OWROQ0NENzRLR2llMGZENXpRT2FVc0pObUZmSDlaVDViM1pZaDZSd2ZvZlAr?=
 =?utf-8?B?Zkk1WVNsaktRd2xlY29BNVU2eUZiaElBeXVzSjMrejNQOXFkVkFsaEpRRVRk?=
 =?utf-8?B?aXBBK0RTTGJJNkJkdWlERlpWN0hqc2ZFeDNoQjUyVGpjcVI4S0lRei9UNVlJ?=
 =?utf-8?B?SksvRDhJdXJxWUZjUGdRdllGWkJERXd3aWo3QWJCdmEzT1ZoQmdwU0J0MUY5?=
 =?utf-8?B?WUFaeUVMbERIa3ZOVE1QSldRN25tMzI2VzVLbUlhUVVwbzJIQUVQQUJWdFow?=
 =?utf-8?B?Z1ZyQ0tOZlZQWkNwNExuSkljemtyT3h1TUdyY1VVclEyczBGYk9iSFJ3VU9s?=
 =?utf-8?B?QllLSDQ3ZXUyZEFXK0FobnlidEN0QjFydHQvUDdWZWxrSnAvNTZPQkRtNis2?=
 =?utf-8?B?QTdzK2g2M0oxL1pueVFPcmI2UWplVmZkWDUzekRFWmsrOW5pK05ONmxVYUU2?=
 =?utf-8?B?UFZXVmJ3dzByUFMrUThLSnA4OThDV3JpZ3FrVmw1bHluR1lnOTZwcFBHUzRy?=
 =?utf-8?B?M2Y0MkEzSDIyTmhhZWNiZitGUTFSOC9PcXF6ZHU1bHBiNDUrekhzMStxY01O?=
 =?utf-8?B?S0pkUzBKK0JCWG92T3VWa3kzZnlNaXhFb2J3eHN3OFhaempmQkNpRWYyem1F?=
 =?utf-8?B?TVF4Y1JxNDQ0OTk2T21oOXpZZFdybU02RkM1ZHZJQnRFa2tLRE54TFFRQ09q?=
 =?utf-8?B?ZjU5Q2h1ZExCRk04V0h1Z1hYeHR2aHErbFlGbDh2OFhIWnVmNVkvWFMrTFR0?=
 =?utf-8?B?OEhTY1ZFSkthajh5UWVuSGZrdVZyOStVaTIxNWJEd2p5LzVUcVNJajNSM01u?=
 =?utf-8?B?M2JPRDZBZm9lYnRDOUNFNE0wVytKRitVdWc5ci9OVW1VeWZJUTZ3OUNaMHIz?=
 =?utf-8?B?ODZXcEo1c29GanpsYk5PVVE1QTg5QmdjZlVGWThHZVY3SmltNHM2Wnd5WnFj?=
 =?utf-8?B?QlllSU1MTS9zK2N5S0N5QXhnMkwyMHVSR0hneTNiOUhRZWhCZHp5M3REYVkr?=
 =?utf-8?B?Nlo3U1VNTjVkNnpSMGphRk1Bdmd0eWloWlgvZnlka2k2Ymd6cUVncGtlT2Nu?=
 =?utf-8?B?WFJYUDNQc2hXQlpFWGpVc2ZmcXhMQnVIMzZRdDVhR2R0OFovTzlDdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2ff6db-7543-4b78-b62a-08da2e8939f4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 11:20:14.5488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tO/AUAeQiS+0fXqt70t8Tf68jjTEZlypNLImNeLf26t529mSNObnkzBjt5ubk890NPNvRPG4NX0kEuGqBIA1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3399

On 05.05.2022 12:36, Michal Orzel wrote:
> Modify macros to evaluate all the arguments and make sure the arguments
> are evaluated only once. While doing so, use typeof for basic types
> and use const qualifier when applicable.

Why only for basic types? To take an example, passing void * into
gnttab_need_iommu_mapping() would imo also better not work.

> @@ -98,13 +104,36 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>  })
>  
>  #define gnttab_shared_gfn(d, t, i)                                       \
> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> +    ({                                                                   \
> +        const struct domain *d_ = (d);                                   \
> +        const struct grant_table *t_ = (t);                              \
> +        const typeof(i) i_ = (i);                                        \
> +                                                                         \
> +        if ( d_ != NULL )                                                \
> +            ASSERT(d_->grant_table == t_);                               \

I'm puzzled by this NULL check (and the similar instance further down):
Are you suggesting NULL can legitimately come into here? If not, maybe
better ASSERT(d_ && d_->grant_table == t_)?

Jan


