Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A114C4003
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278808.476195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVuB-0001cp-11; Fri, 25 Feb 2022 08:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278808.476195; Fri, 25 Feb 2022 08:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVuA-0001aJ-Td; Fri, 25 Feb 2022 08:24:46 +0000
Received: by outflank-mailman (input) for mailman id 278808;
 Fri, 25 Feb 2022 08:24:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNVu9-0001aD-6Y
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:24:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624d6b87-9614-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 09:24:43 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-bO_Xvlv8OFCwXQt4o19khQ-1; Fri, 25 Feb 2022 09:24:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2313.eurprd04.prod.outlook.com (2603:10a6:3:22::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 25 Feb
 2022 08:24:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 08:24:40 +0000
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
X-Inumbo-ID: 624d6b87-9614-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645777483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYGTJnML6h9d+Pm5Co7dP/w8whbD+gt2kiCOAepd1NU=;
	b=A+L+nLcvJgE+PHXWGBuKIfRshtGIlkyGBatbeUzWt1lcfWw3UYnGXxt0LFgbadU6J9/KTa
	I1Riu7LIty1L18hK+Ba5YPwMZsnoi2EzoWH6RsxQFppuls5BozwdZ1ZZUL92URWcXFxgVh
	NXtspPDbmzZmw+tqAMawCXhKNbb2gE0=
X-MC-Unique: bO_Xvlv8OFCwXQt4o19khQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXjzgozWzh+RG7m6N+rLxvmkUasypGGTLXeaOFwy4yCZo0VmM70JiC2GgTJRJb5OVMzLCTq8/2buqleJBw5XXXbwAlGTirlGQQZ57X2tMDlCQfuIw/ZoygTn/VLNolYKWce1oP9mryD4JEKP7nU7S9zncPifZOLFDVqOb+XG5BViptc/ic/zb47HKRby3lBs4UTi6sdhY8l5Wr9tzlDpRVVBrk8Dq/6Q8S6aj+w6vln0FZcovGrDxLZKPZtZMFtBp6E0dj/151y2d46+1GxC5J8TNRF9TqlBh6geDzuA01YpFpYST7Dq9JGoo+2lmU+JrI/VRyu8/SJhIlmqNgSLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYGTJnML6h9d+Pm5Co7dP/w8whbD+gt2kiCOAepd1NU=;
 b=TkI3owUYThu61jDfolHL2yXYdKBcS59rrHS3Hc90LhUn+mUVNTGVfgfKcTQUVj5yMblag2JTtqsuQD5KlXr1EzRhetw2IUxBArHN+oixwvY0fhRLU9iHdMetz6xD6lMaTnzSizAhfq7yCfebym9jdrcTvN5bCyp8cLIlLZHTEKU6bc5pyFdxVOsQG5Uxoopx9YufAee/Py05U4AskA+PTEu/1LUwIHpb0Rm8fuPcFDYp9Aj9QZ+h4wFWyoGHel5yU3paCgZZIzLb1FindrolKtuOjjCkPtBjULE5WWWj9pCkEODlWdZzG4xAl4mc3+5IlqMKRUEqyKySPMm7K26hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
Date: Fri, 25 Feb 2022 09:24:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222114711.19209-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0197.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f017d4a-fc9f-40af-02f8-08d9f83844be
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2313:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2313E9F8476518319AA288F3B33E9@HE1PR0401MB2313.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xFRjUd/TTLOjNy/JkNQbS3AigAfU/TjijTOzyrNNsEQxlZIeA0h8qsowelR6rl2QgT5ckigPuyzb7vIHJ1SUYiEQUPw8ickbnXYIV4SX+pMOldBtEG9UkGSPMXZRloRgnuqqjs6zV0xIRKfLprg3OfvDT7iII9kWHCuqZ05GYfQuVXzKGQxQD/imkVseGQ3nNTsh8hrAkf0Pu/k2mnZw/VC0fR6SbFrgOVLoSlAVsemBThSf3PDqqLxOu/qZaJSNKYvjsjcsgvGorbv8X286c6L0edG37WHYEfN/6vy5SfoT+CH6grXhei6epIeWXhHPDT7KqI+zPQTbdNUb0mfPF7jnShCEiskIt5akHKfD3R+WmtgfBw7ymL72NglHAbSBoYl2jpjnL4QJioJ3kJq7wDM06BXvduFaKIheVEc3aLk0w9ZXyubOhZJez7LXAsNeJ3YsUo8t6K73uS+Mqa3l4EFAIOce26lk02JD24wnNkIYIjvpJ/ZCY4QUfgrE2SwNq82PCIa9I6Z7Tx6RFVL/wUQwziZrrYPaKRjTkjhxU+6VDjG7FGedb4lfLH23gP+vboEYh70MAnr/9W/VaY30adXNC/Pmil3lHigirQESZuZQmw1MhaF6rnLXHpa4mV23Z8Do/hWHQDMA7fTw1ClfMP1Mai2dvK7aGOwGBeo5rKA+FYHZT/6Jo6PbTC2jJ+9CqzrOjV5Nvh2elpcrjoWUvPJKIf57C4uYufElufrYqJrJbvT2pimZl2hlK0GhuN0L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(508600001)(6916009)(36756003)(5660300002)(6486002)(86362001)(31686004)(8936002)(54906003)(31696002)(8676002)(2906002)(26005)(2616005)(38100700002)(53546011)(66946007)(66476007)(4326008)(6512007)(66556008)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q09zcm9Qc2JyWmxUeUM3L2V6eGZjcjJOaTM4aEdYMnRXWHdyaUZxUHJqZzdG?=
 =?utf-8?B?R0NpSFRGY0o0bzVJWXAyU0JlL2hHaUJHOFJrdys2WjM0L1pabFFaR2JvbjIw?=
 =?utf-8?B?ZWtCWVZPMVZoZGdOMUI1OWVuVGthcmVxTmY2bjdNMGlUZ3hyR3J4KzVKc0ln?=
 =?utf-8?B?bGVUYkNoZjNGOWtaSkZUenI5bHFNWjRKMk8zTC9CdmpGd0dxZHd5Rmo4cVU4?=
 =?utf-8?B?bEZqNTlsUEdiRHVUakZCNUt3Nzd0L0o4ZEZCT1g2ejZHMTVLWnZGWXZQNENX?=
 =?utf-8?B?M2dOcnRCSmNvQW55Wi81VHlhVFhBam82dTUzaWhQZkRpREdBUUtnRTF4STNO?=
 =?utf-8?B?YlBrZ3FjV3c2dWliZWdIMW85VVV6NUJTTlVqMGUyakVya0RremRZL1hMbVFE?=
 =?utf-8?B?VDdUWXFhL3ZyMzFPZ0Jxa3EzcjNnVjI0OXZjQzQvcEdVeW9BallMZXkrNitO?=
 =?utf-8?B?azRUdUVOR3JQTE50TDdrc0ZPaFVYQjQvS1o4NzM1Y1RXdXBjbmNQQTZNQUVV?=
 =?utf-8?B?emErRmtOVVlyYnQ4SzJQOE5EamdNMEh6MWk3Mnc3RFk1S0QxMWdxdXBKbTYv?=
 =?utf-8?B?QXFJbTVHQ0hiN0NEUWwvbVpnVURJWm4xVDZ1TE5uTUdjdHRmdVY4SFFoR0xr?=
 =?utf-8?B?cUNMeGZLWGNoZmRyampWZ1Mzd0ZPZkw2OGZBNFdobEhuK3JScTIwREd6NHBE?=
 =?utf-8?B?UThpU0NsMnJicHFCb0JselRpc2Rra2dEMG9HV0ZnL3BFQzFVSFdGOFRxS1Nj?=
 =?utf-8?B?YVVqQU9zaCt0RE1NRnlnL1MzeVBLMFNMbWZsb01Hd1lLcXBhTnBOSk96OEdF?=
 =?utf-8?B?S0ZGYUhwQjE4ekJWU21QdWtqL1preEdqQ0R0Y1JCN0I0eGxISTRTL1NLVHln?=
 =?utf-8?B?blhwTmFlTm1FeFRwNUdKaVFVNWlxUDNvdTcxZDlhc0ZFNHVsVTVEbE5wWWI5?=
 =?utf-8?B?eW5jb0ZvQVl0TzJZN2xTNU00QVJCQUdDbVQrMWc0WFRqRnpIT2Y5SjVEcWFU?=
 =?utf-8?B?eFl0VGt2QWh0MTlhYXNZakRoLzNPTFM5VHlBOFBKTGwrYitZQ2g4OXVjYmZM?=
 =?utf-8?B?amRCaWRWdlJEWDVHb0piQ3h4emxjL2x1c3NSd1p6Z0xFZUJlSFBlRy9PMFJG?=
 =?utf-8?B?bVZjRnJGKzdtWmQwWEJzYnZEclVRSXlsYTNEVnZhOGo5TUlJVFMxNkNYMzVi?=
 =?utf-8?B?S29nRkN2ZTdJWG9PVVByYlBaZ2c3MzNqSTVyWVk1ZmlFNEE4a3pLOGJiZkRL?=
 =?utf-8?B?U2t3ci9rSDM5UlJUeHp0blB2ejl5bHJCYUgycEtQUGRuUGFTdWYwQXRUcEMz?=
 =?utf-8?B?REJ5aDE1c2NaVTl2KzZvYVhQdjBpbGRuMnR0SkhmRmdXcWFtRVcxckx5VFo1?=
 =?utf-8?B?YlBuN2V4YVdUbnNoZ0hwbmo0MGlKWnlnL2EyZ0tjZ0VweGJ6TVdVcWZ3Ymha?=
 =?utf-8?B?Y1gvODV3SGtLeUJNKy8vb2RGVkJ2RExKbzJudDF0NFZhV0FuK201bnJxd1c3?=
 =?utf-8?B?YnZKMVRCbGM4WVpXNnpJVGJVTEcrc0E2SVgzeStLYlJ5OW1kSERHSWVyREFk?=
 =?utf-8?B?UG9vT20yTk9obmd5aXVDdWJwSHRQNlRrL2MwandQMGc4UEJNQUpxNG5JMk5I?=
 =?utf-8?B?dDNaQm51TVNkbzhFbWwzV1VHbldzVVh0SGx4ZlpSTTlIRDNPcFdMSjJna0U5?=
 =?utf-8?B?MEo5cTBoNzFYT09SL3dRaW1xWlhXS0VCLzZRc29XM3Z2UGR1RjFwbktKbllC?=
 =?utf-8?B?Y0F3L2pEY2hjdU1rQjZSZ1JZeURGbTFqdzZrZkliUkcxN1JVaGI5cDVOeW15?=
 =?utf-8?B?UXpFZzlEdlJub2FNcjI5S3ZlYURTOHYrZHZ3d1FNdWduczFMWlg5TmtHZjFQ?=
 =?utf-8?B?UW5GcUpKbWZpOHQyQU1CK3VIUmx0cTl4VGdCMVN2YnRPYldGQXBQYUVCcjg5?=
 =?utf-8?B?dm5SN0RLekM4RVpNRlJYWVc0YjFwSFR2bWFvWVp1SHJwTkNNNUVPTk8rcmxs?=
 =?utf-8?B?eFlVSVNmc3J5YzdjRDFBVzgrbjdEZmhMb3FSa2NhOEZJOFpTc1J6cXlBQVM5?=
 =?utf-8?B?dDU4WWZzWmV0a0JzT2VSSVdiTDZjUHZWa0JLQ2FFeVhBV3FhNmI3bFlZc1BV?=
 =?utf-8?B?Q2JRQm16cFFTajJJTzhza01tRlBqdzZnRmwrYVM3YUxyQmd0UXU4eXpGelRJ?=
 =?utf-8?Q?IuD/bhlfUS54IwonEOwpwu8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f017d4a-fc9f-40af-02f8-08d9f83844be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:24:40.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CujFPPwuU2rU9+i3nULRy50uy9mMXHsXS7O3Ee+KT0RguP9fMLbPl2MDTGyinV6MStzLxS6LRDbuzSlvopubTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2313

On 22.02.2022 12:47, Andrew Cooper wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -628,7 +628,7 @@ static void cf_check amd_dump_page_tables(struct domain *d)
>                                hd->arch.amd.paging_mode, 0, 0);
>  }
>  
> -static const struct iommu_ops __initconstrel _iommu_ops = {
> +static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {

Following my initcall related remark on x86'es time.c I'm afraid I don't
see how this and ...

> @@ -2794,7 +2793,7 @@ static int __init cf_check intel_iommu_quarantine_init(struct domain *d)
>      return rc;
>  }
>  
> -static struct iommu_ops __initdata vtd_ops = {
> +static const struct iommu_ops __initconst_cf_clobber vtd_ops = {

... this actually works. But I guess I must be overlooking something, as
I'm sure that you did test the change.

Both ops structures reference a function, through .adjust_irq_affinities,
which isn't __init but which is used (besides here) for an initcall. With
the ENDBR removed by the time initcalls are run, these should cause #CP.

Jan


