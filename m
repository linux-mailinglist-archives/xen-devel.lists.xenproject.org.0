Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB864335F8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213121.371240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoEy-0004B2-It; Tue, 19 Oct 2021 12:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213121.371240; Tue, 19 Oct 2021 12:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoEy-00048v-FX; Tue, 19 Oct 2021 12:29:12 +0000
Received: by outflank-mailman (input) for mailman id 213121;
 Tue, 19 Oct 2021 12:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcoEw-00048n-Tk
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:29:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd0656e-c831-442b-b01c-9588a476533a;
 Tue, 19 Oct 2021 12:29:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-EoBUWbC7Nkuqpf2_yIJZqg-1; Tue, 19 Oct 2021 14:29:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 12:29:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:29:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0124.eurprd04.prod.outlook.com (2603:10a6:20b:127::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 12:29:05 +0000
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
X-Inumbo-ID: 6bd0656e-c831-442b-b01c-9588a476533a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634646548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GomsQYhB9niBvPCzJFh9+N2L5TTVA9yHOWBNKFQVnq0=;
	b=gMwIjKgiek0vcvSGnaP0p5XaRKRZS9hR5DGu9AO5kS1z6ILbQsU6vFS1yuunxBxmtYxVZK
	E3m82QdZ40YlPIsqtHcPGiGeuwmBoYuvDlCq9i68RgMygpWEN7EW1q5Kzl+NfpLa0hfVO9
	OKU6EFBcKjemOkGHVzd0Kg4iSt6fOTg=
X-MC-Unique: EoBUWbC7Nkuqpf2_yIJZqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIQWSyHsnWXezHx6blFmeD9dlFyvgOCdo3nGv3aQPgFghJkNDuk0oUak8bxnBCXU4y1hJU/qEOMA0B/WxUxN8sNSbMofi1k4l2QYBoW87pudsxudRXbxdWQiXCadE5WxWUY19XTuGVC4k9a7Hqu2/OT7HMrwh7sRWhUe2vYM+DIAgQmuVy0eIP6Bt8hGAZGOMpqQz/iq4v7n8sDuEbQD0RS73crvNTan9tXQ7679mM8N3ZrYZ0zPXUkmwPtPKW42kvldcISwxNn328Ynsf3WYNqauU2Z/Z0KEVgPfYuuPDVOv8l1+goAuPbw3HEbdsawxFHlD2dYK+p32AY3ZojZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GomsQYhB9niBvPCzJFh9+N2L5TTVA9yHOWBNKFQVnq0=;
 b=KH4/WtaxsLfz6p1SLLtu1IlDg3Sq2U/gu8xLOkQCps1w2Ar4LrJZv7EcN4LyJ7H+6FLeaF2gJMDM+qRtB7ATlXM6+B2ubG5Mmje1B//HzAR3n0yZCVYl66MP6Ueoc600e3UZREihL6CNKVTn7inK0V+SIrQ1Sk6rkrcDdKCqPG9IA7UAakbcHIY/uxgf15WatYFeZPVRuDrhgt9WltogXx1VED1QSmOp5AGJtNn8ivwtOxYwAP8z2MwwsyyDLole45VXA4Z+r0PUFYprE3rAFVW0e1bTvaKxAU1MQybFwkfhr+UmsGIPZSkh5JA9qfviQy0rBkox6tStdRQR8jhfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/3] xen/arm: call vpci_add_handlers on x86
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: iwj@xenproject.org, sstabellini@kernel.org,
 Oleksandr_Andrushchenko@epam.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <24f88973257b7038511a0ca49a992d38b295c26f.1634639117.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00829182-6055-ea88-27c1-44e1d3c7e8fd@suse.com>
Date: Tue, 19 Oct 2021 14:29:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24f88973257b7038511a0ca49a992d38b295c26f.1634639117.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0124.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce547d4-f0df-4186-afa8-08d992fc0a8a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393606DE1C2F87624573D2E4B3BD9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OATuE2e9qL7W5T8rXfy6QGWwAp1+x/awROt+1OVWOKAaGlW+LbscXkYSsBjEWau/qFZXRPVO7kRL9UtTAn41wSMupF25ESswNSXFyLy+nfTllT9ftRl4IqV422aj+y59iI1DzKx+QO6W+vPZg2vaJLPpFb1jZINs4JMWb11hv3+yJtHJpJQjIj8USh/nPQb1E3sUcqwbHVvcDRFg9s7aWKYAlzFHPaoVPeA4+M+aJv5y4HW+kJ/7/hZdxYpmBgm0ertR81WRVCNUGtsuLiE4nU2MlZUnEF8DQ5ikyA6w1I5g0dPU/8Xm2HfdmCswjTzPIiEQFSbPU2W04WtYdOpzJBssgd1l6xDhDyRsOLziGhTPwa6lPo5xuurzg2h2pAvKWjw2wUy2HPNzLnZJX9UmJ6zGdgNmI3gB/gUukvBnfGf9fZZ3mYfVah+qNB+QB8wZTV74pPUjYs/Kl77bfjGKIb2BJqD+JiAQtVc3nBLTrDmk3mrV3R0wNofU5TaPbxWNe6qHFiJZqGOBo+KgrvhGLwZB5ujZAjzvgP7HaUQzOt5VOYVtITAmJZ2TGFNlfcfLtF5jP7JJqUjmRtqOLCzZ3GEWpX3Lol2fl216VSwN8m/ONvK+n7fcCVs8t5Ms6EDPtBIKaLSq2z2bbdfJoW8ZlQxUKFOhF99Fpnlt1pQeVDzBf4XOevkgA8PO4TlcsFNssWXsaQc9cX38ZFYDY+EsuwzVhGd24g40ZEj3MzCcacc6mehSNPS7pejF38Zgw35G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6916009)(16576012)(316002)(8936002)(8676002)(38100700002)(86362001)(31696002)(26005)(2906002)(6486002)(4744005)(53546011)(5660300002)(31686004)(186003)(956004)(508600001)(66556008)(2616005)(66476007)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MloyNE11azRFRGZmTHNpU3U5RTZtR3FNS05ZYlhiNDZzdkI4UjM4dE10M2RV?=
 =?utf-8?B?eGFiNVpVV01lVkZkOXFqWE1qSVpuRUlTblFhY3ZEd29wclBZb1NXR3U2REtO?=
 =?utf-8?B?T2FtMFNGYy9tbThhWHB0OG1Qb3NyR2hMN0MwMnAzVzJuc3BOSXRHWEsrZWQv?=
 =?utf-8?B?dVJ5T2NDVUxYZ2JZUjhCRDkvM1I4Ukp1aUFYWkh6UU9jWUhOUUZiV1lYbGtJ?=
 =?utf-8?B?bzRXMUNJTHpJZTZqdTgycWxtZi9ZRW9DMmEyeG1PbnphRmhiSVFWSHRZcFdv?=
 =?utf-8?B?UlhMejFjejJZSWhvTTQ0OTQ3ZklsUlExRjhNbCtPZU5tTk8yV3FseTdCcnlu?=
 =?utf-8?B?UVlNeEhHZlg0SFdWTnlSR1J6ejNVNmptb1NWMXFJaDRzUmMvRFFJUTg3LzdO?=
 =?utf-8?B?Q3l5eDdVbGJ4NjVsOE5xNkhyaUhVVy82MkdkTlR3ZVdhMkhnejIwd3AvWStK?=
 =?utf-8?B?YWx6Ui9aNEptWitFVzg3UEZNaXphS1BlWTdsblZpQnVpZ2pmNUFtYStycm1D?=
 =?utf-8?B?bE83TUtsVmRBRGlodUZxNWI4YTBUQ2ZPeGxGRkRmakFtQkNrY2ljRFhMbXNm?=
 =?utf-8?B?aHU1M3ZRcDdzSytOV2pHQWx0SmpNWmhDTURiQ3JFY2xyOHZ2NE0ySFpteWQy?=
 =?utf-8?B?KzJoQkVmbDNVZVpya2w4R2xMMEFRU1U1N2Y5M0FDR0Yxd3UrRFVQeElKZXph?=
 =?utf-8?B?WDlJVDZwd3lYKzdvbGpVa0ZLSkpicGVjUHZkc1NvVVBEWWFkYndwWVBoUVIy?=
 =?utf-8?B?bkE2SVROY04zUWxNTUFqODRCcEE1aEVQS0MveHVyQVY2OHdWRGU2M0hYYU9s?=
 =?utf-8?B?cjJWNzZrTVFkMzVmcFdFUHJ5eExRS1lMdFNLR0NCbmZwYzFTSmJVMHVvNjlm?=
 =?utf-8?B?OWg2blhSTzZCN0xzSkQ0eVQrcHhFc1J6OGRRYmVtV2k4MSs2RzQxZlFlV3Zu?=
 =?utf-8?B?aHducnBaODN2MEhJZmRja3I3VzVWYVM0YWJBQm9pN0lUSUZ2WEljRS9hUEJS?=
 =?utf-8?B?eVZjNXZ1bXUycTdTVHFuZmJNRXdHY2Fkd2VFVWh6TkloRXlQemcxbmtJalFk?=
 =?utf-8?B?bWkxUGErTnl3TnBKVzVBNG5EK21EcmMwYlp6YmpMVjZ2SkNLSXVzcXJQZXVm?=
 =?utf-8?B?aHptV3YrOEkxQ3BVdmw4cjk3NFZFamUxVWNRa1hHczFRZ1VCRm1JY1AwVGVF?=
 =?utf-8?B?Ukg1RlV0SHMzckQxc3FLeDVDOURocmxIakt3N2R0a0RxRTBHQ2tnYXNLWXRw?=
 =?utf-8?B?Qk1VSzVEZHNPUEFPNTYxQmpTVkJJTE5GVTRSZnlhcGpRaVdUYjhPRWVLQS9m?=
 =?utf-8?B?dHhQdk1iMGU5Smw2dEVtMS96OXk4UjAvQUJsa015ck5oTDB3b1hxY2ZmTnAx?=
 =?utf-8?B?NVR5anVYRnZZN2Y5YXJqVFZoaFZjUmtCRm9teEF1QjdCdzYvc092d1dQK0dB?=
 =?utf-8?B?aXU0SEo1SzRYNm9jMjkyaEFFTUIzcTVZRlU5Ky8yeG5MMmZwclFiWUJPa0Nv?=
 =?utf-8?B?L2ptL2VjK1kvTnphbzBkeWd4OHQvMis5Z0tpcnlRME1oaHE2aVkxa3diL1Bp?=
 =?utf-8?B?TWlZM3ZzcFhzcHE0UGw3ZHhIdFZKRWxVZnhtaFhaWFpoZFREZHk2UTAyYUtm?=
 =?utf-8?B?dW55WUVZaHJnQTVYL2NMWS8reXB0M3JIVU9JUmxNQWcvaCsvK1lNdklsc2RZ?=
 =?utf-8?B?N1NFTm14SkhOUWR5UHpKTEV4QnRCNzJvRjAweDcvaFQ2Uit0TUhISnRDTFVs?=
 =?utf-8?Q?E8VO7t3qQL0HZ9WE8wgJf+nbQuJZFo1WjZ5ol7G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce547d4-f0df-4186-afa8-08d992fc0a8a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:29:05.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG57is82RD/NoIEErHryz3PFLq9xiTC8OPr43tvJbnkyMsRLP8dRJ/EXycWi/YeR0fQEXAvK/L7znPQx026gYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 19.10.2021 12:40, Bertrand Marquis wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,11 +756,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> -#ifdef CONFIG_ARM
> -        /*
> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> -         */
>          ret = vpci_add_handlers(pdev);

I think it wouldn't hurt to retain a (re-worded) comment here, maybe
along the lines of "For devices not discovered by Xen during boot,
add vPCI handlers when Dom0 first informs Xen about such devices."

Jan


