Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524169F2C4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 11:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499347.770447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmTQ-00034T-4o; Wed, 22 Feb 2023 10:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499347.770447; Wed, 22 Feb 2023 10:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmTQ-00032U-1A; Wed, 22 Feb 2023 10:35:44 +0000
Received: by outflank-mailman (input) for mailman id 499347;
 Wed, 22 Feb 2023 10:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUmTP-00032O-3l
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 10:35:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7179f4d-b29c-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 11:35:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8144.eurprd04.prod.outlook.com (2603:10a6:102:1cc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 10:35:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:35:39 +0000
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
X-Inumbo-ID: a7179f4d-b29c-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAC0ESwZS6TtArQ6xWJxMV3XzIIT0TJUXBJbrOKGaateULlXv/1xrtL1ZpIO46qp/aMUniPXD5Fwpuha7a3Jvad3BhzeumOf2qTAR/rzap4G8UAYDk1kcwmjYcEPpr3cmpoPClavfvpIqz3fzoz8bAfdSmWUVXUHYz5GtZmER3SRKjmwtArlCLEbozNnhmTBKMELYOpBMxe+h6HfPTmPNaScVIh6h4vmrp9aPdtOe5uPuJ6x5+xZz0LACxYySNT/I/PeaUDmgdHoNrxFBW0g/H1uKw9OkmoDy3yXfBx6jHsFO810ZbuYuwMqB7tsDCL1c+UXcJ6MgU9+cvtEsHqB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5etHIMqI3C7arm6Ep3GLTy1uNN/G7VrBq+eM8Xi+RqM=;
 b=ISsYA47byBFrO/YT95QVECKqBYYnSqQV4r+vbmR3wL4KhJKrRIzkSst4Aw3vTHHkWQ1CNmEeMdQjdYbvYzlOmFPRTXqO+MvMZdqWhDBuRTbXvKbIb+MIlUQQ/vqFE4ffJuXRhzJdZ64YzSP0XchOWT7v6WckekmcRwYCPdwNGFM1M0XfH2cTRlX6YbF/1OugROvPoy9NVyEjhkVOaqL627MpfXu8Wvwrg6U7zxpQvzKfMpvKz4Ectu1x70L35CLcSs1blEdGYhkbNN87X5K1Uio6NbmvpKeknPTObdyN+72bMCj58uwL7KNsZB55SX5JokWYtvj4fkQJg4wbCOFOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5etHIMqI3C7arm6Ep3GLTy1uNN/G7VrBq+eM8Xi+RqM=;
 b=xuWtiYvzuPjKuggTnUBuf1jJDWE3pL1viKttAmmWkW8Y+iVgt4Vit3tNIEi81c0irRGvlhBtWZTpqDKNcOa3lpBgxxK0+P39s7eS1XWKDeqNLelHemQmFb60sKE04x4nGYUYX2XLmTEkBegG1DO1z3+n3zh6RjGr+hEwcfPvgTYOwWdwi+NZB9twalE3VYQLaJKNqX3lgA4FCVFhDm6mPChiYDcnaeSi7KgmMMSnDlcy8cZLg86YaGTfEw2i64r1u7eoXIC8SELmY0zmex9QhL61UcLuziVThWQiBDog5wiDkVgOa3WlDfkEoJ/0ku7KjsdB+jkk+IwOfaP/4e1ehg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c362963-e6c0-f610-3bae-9465dc91a73b@suse.com>
Date: Wed, 22 Feb 2023 11:35:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MSI: drop "packed" attribute from message data/address
 structures
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 855cfe64-e62a-44fd-dd33-08db14c08a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yXUAabAXhU9k2ai7dY7YxmoST9sOPbN81Z8aBZjjKwV5hntl6/jjShyM8NjDmQVV9KBm5zSrumEGD6FkKNcfx5OYjUyjdCtBEHgf8D3P4Mc6lLBNwe05IpQkPnSz8ATv8XZkb8ThPOYzHb2ulQ33tPavnEq9hC9qW0lsqmof6dn+9jVMA4O9LI6j/+datLffidMtM9iQcidYMrCh9cqPaKGAAL9Fyn7MKeiwM38Ttux24g3FQa62wINmp8hZTgCxMcqmg9tO2bAgcAHDaapWbqvHMWQ5Bi+LugklFsa8+GjAizLVijb2fCfHVlAHadKYGEsRBM91qEkqDJKImSh4ykoL0Zfue8xm8pRDNfeF/0TbwetZM7JQmdRU6nZhfXOpyLrCcia3WrdLywro8/eylTA7XOKp+pIaCyCFnyYIudlUgqGD9CevdQ9fDM8JaHW8S4b8LlfomBoAcelqgduSvjBqgq2NNr5CAbfzWNoIoE+dNCZ9WmGDgT5d+oAAq6U26KpAhhPHuRxyYGiOvEFnFkuqS60dZtRykkyQ0n0EX7ZW89JnQiKDI9vLlPVAe+DpBqojoJmhTv+wzLOAZIG7uInkAABDToN3sqx93uhxxef2+a/uu94T8mrSLv68+y+ZjWFBuU2jdZ6QLhGbDXDkLxoZ7yTjAosx56p0c3t2+nWGVZnZDQLfhGRgyvQMIgEsZpSV2d3oBk2jTj04Iho7OPG9K8N4XIJY4yTFhdHlat8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(83380400001)(38100700002)(31696002)(36756003)(86362001)(2906002)(4744005)(41300700001)(5660300002)(186003)(26005)(316002)(6506007)(6512007)(2616005)(4326008)(8936002)(54906003)(66476007)(6486002)(8676002)(66556008)(478600001)(6916009)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjRBUUxXQ1pGdXNWZkQxTWxyY2duQXJ2a3BIV1RiQzZORkxGYzE4MktZNy9J?=
 =?utf-8?B?Zktydy85WW01UjR3TVhxR1cvN1N1MmFjeWdFSTV2UDlnQ3lySEtzditmWjRU?=
 =?utf-8?B?bjFKRmgxS3llZlJvelVVVXBJT2ZxZUEydVZGcUFWREJEQVRGNW9nWWwzRUdj?=
 =?utf-8?B?WWc3TkZqTHdZdUo0cjVRK2JaWkYxUWUxU0NOQUg5bnlWdU5JMFIra3FsejB1?=
 =?utf-8?B?Y0ZzdUVkc210MCtSVTUwb3ZqUWxxL0EwMkh3NGFIc3FvYlo3SVdFK3dKZGU0?=
 =?utf-8?B?SG9sOVQ3VURGSFFpRnJrUHZsR1UxUE9OWjYwZHRVMnBGbXMrcit0VDlNMGVE?=
 =?utf-8?B?TzNqRzA3SW92R2hRWU1IOE5BRjQySnowTDg0VVpON0ZUdWFFZ3lYT2V1Y0Vp?=
 =?utf-8?B?UU1QVVoxNno5dy94cmJMS0JibXBzU0kxKzhUN3k1dXpzKzhGVjNLQmVBbkR4?=
 =?utf-8?B?VlRtRnppUmNlUTVPNytyV0NzbEJpYzFPa3dtVzV5Z042cXpUcFRIVU5WMDdq?=
 =?utf-8?B?ZVg1bGFoQTBDUk03K2ZQMXRZVm1jakVSR01CZXJJRGdOV0J0TTJYaTJjOXVV?=
 =?utf-8?B?clZsWnBqUDNMUVVZcEtVNW5HQkNraEUyY0w0Tmd4b1k5WklaNjdtQ3ZaS0Z5?=
 =?utf-8?B?eGQwekhVWlI5ZlZJK0g1ZDR5RUt6U0J0NE9Ua21abHhnWE9DcVRWVTh3czJC?=
 =?utf-8?B?eHVzQ2FWa09nOVd0NktlSEJ3Y09wWm5tMVlRWmxWT0lGVHY3Vk10UlE0REVy?=
 =?utf-8?B?czdMZkJ2ZFBsdjRFc2hFQkdnUGF3VU5pQUp6TnpZQVBXSnlyMnV5M0kzSXRK?=
 =?utf-8?B?cnZVOGdpWFczWG9ka0hYaG9jTFlLcWJXYVR2OWxaVk9OdHVab1A5WE9sVTVU?=
 =?utf-8?B?MkMxcFBlRlBTa1JuWGhHNU1McmhuczAvY0orc3Z1QXY0RDZMRWRlTFRENUFW?=
 =?utf-8?B?TUlFQVIvSVNFYUl0eFlscEMzUGR1aU4rbTZJb1VVOEdhaDhLcjlqV3ZHdzNr?=
 =?utf-8?B?VFo0d1RmYVBhM0VrWFNXblVTZjFoblpEL0hSK1ozblZZc2RyNUd0WUNMb2pV?=
 =?utf-8?B?MkJnQVFubW5SZ3lkUTl6bUhoS20yWG5XVVp1dTZPczVhK29jcVZRWCthejl5?=
 =?utf-8?B?Zkp2KzlkS0JDQnZnelliYllEUXJCNExQQlVwc0Q2cit1SHY5Y2REUlcvRFdy?=
 =?utf-8?B?ekUrMitGaWhkMjhmMWxGK28xeWhVbHpoQ0tDa0o0THluWEVDUEtqQUEwdkNI?=
 =?utf-8?B?VE9ycnptQlEramlFRXU2SDM5QVFBQmJXQ0pwWXpZR2RFUENYUERLM0NFZFFJ?=
 =?utf-8?B?QW05akhrOHhzdXJtSzRjLzV2L1hUOWtEZytNTS9Ja0d1U3BvWFNIL2pMeVd4?=
 =?utf-8?B?STBvS3hIai9jUXVDZzZWbGdMck1CT0R0aTMyQ2JMYzgwdmVNNFpBZ05EV051?=
 =?utf-8?B?ZFJIQVFHOGhRaW4zaUo1SExYVkprblFXOUVPQktnN2lkdnorNEZyRXZqOWhx?=
 =?utf-8?B?VzJUOWNxSmY0eEdtQnJmY1pzUGYzWGd2TEFHWVlHT1JYK2FWaGdNNFBrK0hs?=
 =?utf-8?B?V0tMaVhiS2xNaENTRnRBUEJGOUNkSHlrRHhQLzhKZzJrL1RqWGtNNis5VFFX?=
 =?utf-8?B?Vyt0Ky93K2RTSE1lZzg5YitiMm43aXFGVlUra3Zva1RreEZNWjVOMFhyazRk?=
 =?utf-8?B?Z0l5NjBwVWsyOXU0OXpqMkhlRk45dGg3Y2VPVzFxUUJJV0xoc0l3Nkl5YlFu?=
 =?utf-8?B?MVg1VFhnYlhxQSs0bE44Z1E4MDdHb042UGR1Z1QrTzl5cEcwVHZKZGY2Zzlu?=
 =?utf-8?B?N01NRFB2am45VEFqVXliTUEwSDFpTWJXOHNPMTdoamRVeFNvUjdad1VML2V2?=
 =?utf-8?B?d2s4dklSMXJ1ZnV1VGpMeFdacXdCVE5NRFFjMVoyRFVUaGFWdXUyUmMzamJi?=
 =?utf-8?B?emZtNzBsVzMySXF6Slg4K1dHZDlqdzhhamo5RHBWamN3d2pwcS83cncrc1pq?=
 =?utf-8?B?NW02Q0tzaFllYTYyRHZLMU9ERGtzM3ZNWEordDdabmJ2U25KaWlRME51WlF4?=
 =?utf-8?B?NGNRdElMOGJ2NEViVUd0aWkxNGxJT2paSkZZUEhRSUU0WTA1c2I4VXZyYmFW?=
 =?utf-8?Q?oyad8hIRDfFx1f2n1DdQfZF/8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855cfe64-e62a-44fd-dd33-08db14c08a74
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:35:39.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7fCLw/l6BKDS4G3gfvmScl24vArzrHnYbF7zlRyTRLoksVa9blByQYWfT6yTWh6FmLOcLcRlTb/Iu9Sv84yuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8144

The attribute has no purpose here and, in the worst case, could lead to
the compiler generating worse code. In practice, however: No change to
generated code (surprisingly not even to generated debug info), at least
with gcc12 and the .config-s I've tried.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -178,7 +178,7 @@ int msi_free_irq(struct msi_desc *entry)
  * MSI Defined Data Structures
  */
 
-struct __packed msg_data {
+struct msg_data {
     uint32_t vector        :  8;
     uint32_t delivery_mode :  3;    /* 000b: FIXED | 001b: lowest prior */
     uint32_t               :  3;
@@ -187,7 +187,7 @@ struct __packed msg_data {
     uint32_t               : 16;
 };
 
-struct __packed msg_address {
+struct msg_address {
     union {
         struct {
             uint32_t              :  2;

