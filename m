Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D4401BD7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 14:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179807.326194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNECo-0003wr-Cd; Mon, 06 Sep 2021 12:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179807.326194; Mon, 06 Sep 2021 12:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNECo-0003uu-8q; Mon, 06 Sep 2021 12:58:34 +0000
Received: by outflank-mailman (input) for mailman id 179807;
 Mon, 06 Sep 2021 12:58:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNECm-0003uo-Nq
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 12:58:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1394b0de-52ea-462d-b2b3-68937a13ce89;
 Mon, 06 Sep 2021 12:58:31 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-GtL87o-fNGGo4nSSiBoaVQ-1; Mon, 06 Sep 2021 14:58:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 12:58:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 12:58:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 12:58:12 +0000
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
X-Inumbo-ID: 1394b0de-52ea-462d-b2b3-68937a13ce89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630933110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hK3ZJrK7cB1H1je6taAi+GVM+bdxDIHytD92JlsUDMg=;
	b=Z95Gn8QSa9CEPVo3/8jqxEwwYaQzrCJJbuLSrOd5uRtGO/2RlzAmybNPQrmVGymbVFCyju
	Z8ZLIuJ5cPtOGJ4HD3aEkW4C+iGyAk7B4/1nWveqlJS5bN2T4Pvz+IxINqI1DiIMUr3aVk
	H1atRdaf3JsG1+A0r9f+M8pJ+/dpn5Y=
X-MC-Unique: GtL87o-fNGGo4nSSiBoaVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRV38NCOiS6jDyL4h1pGek9xAztpaUckuOPeRr0/1hGFEgqKGBEY8BG7aaLw7ngQZS1cg/UgTwrLcH1L8KQTlFKm+e+Rc2YAcKeoHZRKnJq5o1rvYZqm0yP40VlMmloJW2Gv/vOoBt4KAxEc7enxBu8g/t/PphBNUxylQxwn3ZEhPhgzdXHWulx/SoyQPUs46Kagu2fX0JWkonykNBlPpIp8HcWQyOSe+O2BC2GC8MmX1Pi+09LV2sZCaOWqFAlGEepSGsConMUnJvOVFEuHJyhw5M2h6cD0HXSTeSWLC/CH1y5yuj/0faLi8UEvESIgjV6ExTo6PQOwxEcai2Uz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hK3ZJrK7cB1H1je6taAi+GVM+bdxDIHytD92JlsUDMg=;
 b=KNMe2wfs7S1Ji68YWSY5fjhqcgx3LbrHmr7TTGmfmCckBac2bR9wCeSVly1JNn/4B9td+3VQ8pB4rhw/Pnb0JXjeQE5aVLYtbqGRiraYnqZxIoKnf3tMP/FoYA0MzG/wKT8j3nzcdqC2/xqDDlEOBGO6DKSfBsvQaHYsgTdcHx9LHrvwMiCPEbtvNXGlR09NWC4HCT6fl7kpA9stkTzdp5VtrBAy0XjoSIabIIPnm4gG7OgNj/niSNkP30YvMdWYwPpE6aAR+kUK4oxhbew4DzJpaUe5DcxhNSxO7qC/vdcxT2isjAa5RWP1WT72OD3o+QpBF4xOTMg9qcQJif/2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86/mwait-idle: updates from Linux
Message-ID: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Date: Mon, 6 Sep 2021 14:58:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc0d966-9c8d-4ca9-c26e-08d97135fc71
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574288122EDF0B7591241D0BB3D29@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HdR13lwz7wB4w/KpVQmi6z17nnkObvE0lCxl9+lm4ZC+5dip+3B4NB1j2P2ItzPeVF3dhH3Rzz3Bz+wQw+TJxZFk7Xcokuc5fCH+PkgZaIT+rc7xywc96So+gCbMtF4YpR2gTT6DUvl63b6slzA0cC1YEfHovsnf6//as4bB3VRnUiJ9d1eyPzDBpSZ+aRPShSS2zRYHfh0cP/VYeeUMKKq21V+dFnJ/W2/GyjS8qiGLY/vfCaJ/lg1K00sfZhMq9/7IB3ruMpL8sWbZ+bbUN7qMAk2+KxxxlR1CiQY9C8PuWi83MmkaGB1f8U1iaLoFIWfKSc9q33cpdj5MFM8YyrmEhkadO8uzgUHQhn1KlcIMmEZk5UB5Ia9Jd37jGL382cNC1JqQj1+6DztJf1Ru2Azsi3I3Go8YPmOps4EKfDIu7bjFZMgnu+o2+E7VPZuGyueRe9djedIQ9pL3mrwnzahm680DRbbS+S7NTsxYLz4VHvSEbnNFEU1D09PK2frSraABEJmFLJZGqTd3o6FhPjPV8oSCvAscOssgpZiqoBHT7f82fOSujUScI8VNsyD5Akq1RIB2msjk8dOvQrXRHkjdxda4Txj04bb9r2AKr4U0VoCzFW6kn53Iy4lHPtzkASO5qD9h0/R1DrUo6NIwo1Gf1/mNYX+uDiubISEoVVCSHj6/N3OTxHYzoShfuOEk5FlZwCs+y/FLKQu+gpUD5xoUz6a4RrYe9SLJY3Ao1Ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(366004)(376002)(31686004)(186003)(36756003)(478600001)(16576012)(8676002)(316002)(66556008)(26005)(86362001)(54906003)(6486002)(31696002)(6916009)(2616005)(5660300002)(956004)(38100700002)(15650500001)(4744005)(66476007)(2906002)(8936002)(83380400001)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUZobEt3Mi8xSkpwcTM3aE5aazMxTW9PbU5tcFYyeUFIS2ZQSStpOGw0SE90?=
 =?utf-8?B?RTFubFl5UlpFRjIxTFBxZjRMeXJOUlBTYTJIb0tUM3htaDR0M3dMa3pBdy9O?=
 =?utf-8?B?cDFqdk03OWFBRC9WbGpyZ05MWUhJbm44aHgyVEtybGN2a0hiV0V1anBFa241?=
 =?utf-8?B?dDRuVTN5VGk0UzRubXVVZ2hrY1I4T2pRT1VRNDNIdDhLeW5hQTcvalRGdk9y?=
 =?utf-8?B?N00xV1VhRmR1akJ6R0dLbWk3MlRRZ1BRclVTTkZ1K1VWdW93K3dGc1VCUU9J?=
 =?utf-8?B?VDc0NFExajZIcjZlRWx1cno1U0hOYjc0bHJtRzZ0YTVDMSsxQXFIRXIyTGdy?=
 =?utf-8?B?RkthS3NvUzA2Z3hyUzkwWm9hODVjejFidFZHUzVtbXVER05FaWp5RitubDVy?=
 =?utf-8?B?N1lHTERKMnBSTDgvOHU4bGZ6bWk1ZCtmZHlXUmZEaTZDM1J1N3R5dHZqMkpW?=
 =?utf-8?B?Q1BPNTQ5NDRMcWg2Z21rTGlsSVJUZDBOT1NiUmdBNGxCR3gwS1FWdm5jSTBr?=
 =?utf-8?B?NHZSWkx2NCtPYXNDRUtpbEQ4MXBTQ0NKRlRkTlFmMHc2UlJzNXF4SWE1NXR2?=
 =?utf-8?B?QnQwMmFqK3dsak5Nc3ZyaEpDRXp4R2l3eFg0cFhJN3NnZjNDZ09RelZuWE5j?=
 =?utf-8?B?Uzl5dlRqb3Z3SFdwL201M0duVzdNMGRNcjdqdnFEM0YvdUpMOWFJdEUrNXgz?=
 =?utf-8?B?R2o0MUZmRnB1a2NKMVU1cGg2a2xlSFl1SldxdUVZNm92ckt1dU54ZE44SG1y?=
 =?utf-8?B?NERPWExOeEdTNlprbkN3YW4wUm1VSHhoYTc1TkxBZnpHb05PTUswNmNvd0NL?=
 =?utf-8?B?UnM2WjdwbFdMVFVwRWFQbThUR0FOZWVkS3N0MWpNS29XMk5CcnRSUmEzSmcr?=
 =?utf-8?B?eWVIN2tQdW54UUlVV1IxajdqOTRFUjQ5R2VlbU1DYUJnSVorb3MyRUVBODhD?=
 =?utf-8?B?LzVua0FKdXJnNm1RdmRvdnl0MTRyQUJ3bjVxeHlBM29IcmJrZUkybjMyUFlL?=
 =?utf-8?B?R3ZDUHRuOENBRkNoblVYTXF4V1hHRWRGZHR2d2U3d1FLVFdrbWNwa3RTZmp2?=
 =?utf-8?B?cVB3YnpGazhrL21ma2N2TWVQeDg1cEVNWlcxQ3ZkS2ltY00zbnBneHQwWGdE?=
 =?utf-8?B?UE5MVkxPM2Rpdm96NUV4ajlhcDh1Z05sY2JlZXl2VWJGUVdCM3RhUG9wQmJx?=
 =?utf-8?B?cmRRdWxEWngyV0tpQk5ZcVdySDZFQ1B5S3ZqdFYwMWhVbmJLNElvQ2QzSzI1?=
 =?utf-8?B?YUtsWEJ3cjV2NU12L0doeVhGV2R3Uk94eFE3NE5wREplTUhwMzVxNktqa3JY?=
 =?utf-8?B?ejJ0RGM1a2kxdjBWTmhVUDMvUEhIanYzNWJTU2pOazVMUjlTWVVLeDVmRGxl?=
 =?utf-8?B?K0E3bEtOMjNPNEl5ZHFYL3Myc1ZOOS9La2tSUktPMDRzT3Ava29OT0NKTUdo?=
 =?utf-8?B?bjladVp6N1ZTaDFpRkFQaUs2bktNajB4MXRRWCtDbXRpV0F6QTRvV2JsZGtw?=
 =?utf-8?B?N0xremMxRjhlZHpkeThhb2loZFZxekJualZ0UHJ1U3NjdEZrNE1ydGhXYVBo?=
 =?utf-8?B?MjVROSt3RktvOFNiS3Fqb2JIMzBuSS82Q1hyanFCalE4Ujg5TCsrVnlkQURK?=
 =?utf-8?B?VktpVWM0aVBaNWVmNEFkSkdudXorM1lrU2QwUDc0aDNFbkFndG9TVGY0RU5p?=
 =?utf-8?B?TWcxK1ZzdmE0UkNVbnQ0SFhkVkNiVnpSN0VqL0NWK0Nxbmh2bnVLMEFNNWNu?=
 =?utf-8?Q?fVhroLwt4cHSoJkgY3uGcQwafYSscrXtZuwAr0m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc0d966-9c8d-4ca9-c26e-08d97135fc71
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 12:58:25.2466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rsOOt/AiOE88BWUcPA+vKPIyaKTvuvfAL/GSuEKbiE4WNGqfOi3PR3efc1o/fuOUAs8P9vmMOIqmvN7gxwcCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

Before the code freeze I thought I'd check the original driver again,
and indeed there were a few changes we want to inherit.

1: mention assumption that WBINVD is not needed
2: add SnowRidge C-state table
3: update ICX C6 data
4: add Icelake-D support
5: adjust the SKX C6 parameters if PC6 is disabled

Jan


