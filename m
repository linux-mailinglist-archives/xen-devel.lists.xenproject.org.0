Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D3518714
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 16:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319703.540040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltll-0004Kn-Dk; Tue, 03 May 2022 14:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319703.540040; Tue, 03 May 2022 14:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltll-0004IZ-Ak; Tue, 03 May 2022 14:44:53 +0000
Received: by outflank-mailman (input) for mailman id 319703;
 Tue, 03 May 2022 14:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nltlj-0004IS-5Z
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 14:44:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95a9d60b-caef-11ec-a406-831a346695d4;
 Tue, 03 May 2022 16:44:50 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-Jdbn8wKpNFyWWLoJrc2DLg-1; Tue, 03 May 2022 16:44:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5739.eurprd04.prod.outlook.com (2603:10a6:10:a5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:44:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:44:47 +0000
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
X-Inumbo-ID: 95a9d60b-caef-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651589089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUnAwZR1/Fpv+omSr3SxME1OxG/gQTSSN2T8IL2uOwo=;
	b=ZL0/34g0bA/l5giBpU6rdq1VlHo85CMvpA+9rHJSxvJJd9lU7yMfuEnfImg1G9uhZTyqmL
	TppSP+gNXbhYXCDKuUmgo0W47CNCbiDldkBzzT3fX7hgo+AJwOY/aFTnjYSW8cQ4U+keeN
	RwSM5wOjh60fBR0aBi/7abH0dA58m9Q=
X-MC-Unique: Jdbn8wKpNFyWWLoJrc2DLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3W9FB2Gk0qdDEIJ2/eH/gXOVUsxlGZsvZL1WnKoqLfNzFs7B6IRuk0oDekMy/wNwYDarXHAiOcGs7FCDuPnYltAJ00CT6n/zZAuWmvw1iC3JERL2+HkjOjv81ENpdBdrKPrpWIUvI19y4JvWN0Qz3NJNE0eB0RpQPvxNu0/H/naziG1gjfHgGT2Gi38g6k8vh96R8pqME1IRxFu0cZc7wQyiH/0JRnbsjsl1bhcCJFekEw+7wk7rYxSWnLsmCIDH0EQZAInXAG6cFKRyWmQ0BjwkOQJuJ5k63uXsEVYLbk+Srf3ufULqatLnTkYt9yz41JcnTCiuhXYOhvampaLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWmtKpqqxSlmL45fiyRgFSSmbCkQN2t/lZ1ysSR9HDk=;
 b=SvBE0TAkWNO0f7p3kRcK8s7F+cKPolEuiptkDIv7By5oawJhWZZ5STwn6Igs7LV81xL+WrCsADDsZfdcigoEsuczYQxa1TcF+ReuiDfBWuTNPtqRGI+UyUmh4uRvw2eaZa6ZajdnpimqB0irRzF0aLSXzLqg1nZTkvnxqE798rlKo5hywmHbZ1Z8wIglWctuimQYFUgGeUI3PrDWdXq/r5/IcTjzqoZL9c5nCez16Dhpmq0c5R9PIpDtFf6tgHoxIH4f7bWDiWSYOM088+GV86DlzNtWSOSrhsxiCtDiHCVVqjjsB6HH/v/+5YB2CmYGQTaPFyfHav1FGHFdz0ZNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03cf64c4-8ca8-3e13-a4d0-e8da9f309b38@suse.com>
Date: Tue, 3 May 2022 16:44:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 04/21] IOMMU: have iommu_{,un}map() split requests into
 largest possible chunks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <227d0bd1-c448-6024-7b98-220271d9bf63@suse.com>
 <YnEiJKezb9X4X3Dg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnEiJKezb9X4X3Dg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::47) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18dc14a0-a3a4-4f93-4db0-08da2d137817
X-MS-TrafficTypeDiagnostic: DB8PR04MB5739:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB5739F24C8C8C0818FBCFBE16B3C09@DB8PR04MB5739.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6sV2tQRcekJHknd5XpEwNvwFVq1+cLa1NPeCu6tKSoMclZOdTxAs3gcMnLK24WdOt8BN2D+6Xj4fuWCLQAJ2NQJ9U6FBlTGHrZtUx2bCpnc06+lCykaPm9rHe6qBjquN9RIjg5M9UD9F8eEEB8fCXakIViG9vpjqfBy9koU+8APwoAGBs2hCbDme0/zSo/tn3BQq6m7cE3EE/4wYkfIpnAhOG5leiR0bI+uauYwPEJDKH/Isz2tT25S26/0/DErYBaB8/nVXWrE3GhYs167X47TGyLEuWUFwUdcqaroqkW0vCfKYKQrJEld1rHq6vwqzKZkO9ZOTVxc+zmj+BKN9GNWVyuY0sngRUPheZqm1N6eJSqkiZWGKZ1Zv3OnXnjxdomYsgMabqM/kBuQHLfvXU2Z2vTQ9Fb7/XKN/i4893Bp6xhrp6dBCs370eoVnGo2etQW+7Vr2i8AHsGE1bmYrMsBCHf+s1EUGtcDMQ9LfR+x3+Aej8Fap6eVn6YY0fHXIYYt7tXZoCR1w3SjujMrpQeljwO8ki5hsb9DbLYXAUWybqxX2yV411ZKhzLlyUaarRko/ral3A8v92U57w6eDIsD4bfAx3a06uJcdGDL01FzZoPaNmw2UR/hl0jr4cJmY4D7+BKSiqX4gPTq2r43x5OYMyRPWEcpuCw0K068c536wY6XzfbSc4/6C9l7g3DjP5VeqiOWL5WSa4LDXrU5KvZyCvDbtPU2rZOTuXSDWB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(83380400001)(53546011)(316002)(6486002)(54906003)(31696002)(6916009)(6512007)(26005)(6506007)(86362001)(5660300002)(186003)(2616005)(36756003)(8936002)(38100700002)(31686004)(2906002)(8676002)(66556008)(66476007)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DXKzkzVcMkHp5B35NxZBn9XQWmAl1ubCnTklkzPT3dygWUREo3gakqBHsqBk?=
 =?us-ascii?Q?rdsFfiF29s+zVncWeVmA3+GsGBliBJFMQKQrFFCi3gi1e6z4mPpT7wjsT8Fw?=
 =?us-ascii?Q?+gcSa1FXl0k2L6GIHNLCGdcz9YlB4DgYrLNQCTeijQsyTrjGfPUwkVhxdQKv?=
 =?us-ascii?Q?pTy6VxBly+cvZ7bqkvKrS8MzA27He+6bor+JYb43HBMnBIvljmSfNiVKo7Ne?=
 =?us-ascii?Q?oG6kHWGhqwkWnTJH1xawctsCBgsthg+SXD1Wy4pFl31VYyUkpOJKILpER3OP?=
 =?us-ascii?Q?eYg+R8fKMaxcea0ow4dR9PnJkxZghhaTGwJ5GvvGfCmHJQ5CRJiL6X6XVD10?=
 =?us-ascii?Q?iGB1gGeh3t6ba14Ipuy/25AQgb/KV5B5B/54QVnxIOxrLCA5F/5P9R9xRFe0?=
 =?us-ascii?Q?aO4HBVD8aGmHYRfwdH2RnOeV+3UPx5KE3fJ+qS5wBRZkbSwE4Ffan6GKr73b?=
 =?us-ascii?Q?NFaJbR5pK57nUotc3N6ZRlBhfX8Kvl/G6Q6xKQncgMJyJRk2YbeiAN/s+itX?=
 =?us-ascii?Q?aagV9EUSwZvyjC3APJK0+Ob4VbSJ8fdE4bUkLWGy66zWttYTXBknRHUQa0ey?=
 =?us-ascii?Q?IulckTAThA+Ab+kZS3UU1OOpJN1aYJ0MtWDo/prwe8rwEs9JNp1goD+sTvZL?=
 =?us-ascii?Q?Fnx8NePTMHQ3b+TEayfDuWiMLwhVODTYzOok+NWtUE9dDXLe6tdvQjTXMYHV?=
 =?us-ascii?Q?TMuud7uAFswx+CS50ZPWYAyItOZUCELiYMqoeT/d8R9tME1YF84cIcR9s4We?=
 =?us-ascii?Q?JJLYwTA0Spt972nyZxOGFmUSwhLzFPVI81KogeiyE3SdlCkIFTJXsT4XYYke?=
 =?us-ascii?Q?MKevRE2tu/qLkG+8uzADKTQYIq8lEP7p6b5++j/klhga4ZBQdGPSe6I1ymqf?=
 =?us-ascii?Q?jS+d9bCzi9lNzdr5LQKPTnrD+omVUjZbHnlN8eckm7Dk5vDxDMDnnyH/Mvyx?=
 =?us-ascii?Q?Aa1WCL8rQtPK33ImeTOsa4QgL7JWe13dBPQu71oh35aUUjPaHO1/5+Lqf27A?=
 =?us-ascii?Q?+J3fAHPHL1HZ2IYHj863XiOffQDWHsWxhfMNcSgijiGpGnx+RD5NGoHE8jA9?=
 =?us-ascii?Q?n8PznacfGWXz292GjPcPRjSdUrl1kpfDhAQloQdvTMuBJu2I8b/WHRSPxaRW?=
 =?us-ascii?Q?LkwK8Ip/7QTfUC/3IlNNkvBIjf2DRNw8TuR6pJ/Ny4c7tBeIdY7jKU2IGuId?=
 =?us-ascii?Q?GFitiXQL8ANxWaUbY3CwopzzW34a8spakhhC4mICn94Mu8Ia5TvkUlEMyqiG?=
 =?us-ascii?Q?4j9BqVCk9utWmdateKApVaFsnUkUzqxW5nqJxsvdgHle5B2UPuBPysrlpGTi?=
 =?us-ascii?Q?j39ihvUCOScJaEC7gObuYKPmujrilYekMXMn/ECUVSzi+GO6UZhym1Y4yUpG?=
 =?us-ascii?Q?Epvm+Y3BM5JUcA2xFwwnV0BPjWgWXlWtupH7nMkRLcBH/Rz8myFztl4hfMbz?=
 =?us-ascii?Q?VVf9zdN1lP9vfIC8DA9U+DEBP3sEV/xVZZihJE+fVPkeMBJ1tFhV9K5qAGyP?=
 =?us-ascii?Q?lysJFiNtxMDOrzqrMW9ohmqIGtRnz0kCbN/sZzSENQ4iQ8DG0lZZSCIdKcg1?=
 =?us-ascii?Q?jFWUukGUGZQyx9c3TisG+bs+wQYdLPjl5i/gyrk07GR8RZjxH7+NZQOYt06+?=
 =?us-ascii?Q?2hU0+ndpfynhqQXNoI1VIBpNoXVNiOQqXyJf5gp5Gbszp+hDsbEG2E+CGWyo?=
 =?us-ascii?Q?whahNKeRWdeWDUCiP8AKY7LzPb4sfIQENfc/g41GCgSM7zGQT0L7QfZLyhm+?=
 =?us-ascii?Q?33Yo7n/SDQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dc14a0-a3a4-4f93-4db0-08da2d137817
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:44:47.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVfDQboR7bS5LyB3e4KketM4SZTji/ytd5LKL/ng4Y5U1+H+7QFs+k0er3obLqmgNkiZmurapVBSMSj6iuGjwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5739

On 03.05.2022 14:37, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:33:32AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -307,11 +338,10 @@ int iommu_map(struct domain *d, dfn_t df
>>          if ( !d->is_shutting_down && printk_ratelimit() )
>>              printk(XENLOG_ERR
>>                     "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn"=
 failed: %d\n",
>> -                   d->domain_id, dfn_x(dfn_add(dfn, i)),
>> -                   mfn_x(mfn_add(mfn, i)), rc);
>> +                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
>=20
> Since you are already adjusting the line, I wouldn't mind if you also
> switched to use %pd at once (and in the same adjustment done to
> iommu_unmap).

I did consider doing so, but decided against since this would lead
to also touching the format string (which right now is unaltered).

>> =20
>>          /* while statement to satisfy __must_check */
>> -        while ( iommu_unmap(d, dfn, i, flush_flags) )
>> +        while ( iommu_unmap(d, dfn0, i, flush_flags) )
>=20
> To match previous behavior you likely need to use i + (1UL << order),
> so pages covered by the map_page call above are also taken care in the
> unmap request?

I'm afraid I don't follow: Prior behavior was to unmap only what
was mapped on earlier iterations. This continues to be that way.

> With that fixed:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but I'll wait with applying this.

Jan


