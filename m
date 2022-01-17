Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12434905FC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 11:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258097.444088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PLH-0000cP-0s; Mon, 17 Jan 2022 10:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258097.444088; Mon, 17 Jan 2022 10:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PLG-0000Zl-TM; Mon, 17 Jan 2022 10:34:26 +0000
Received: by outflank-mailman (input) for mailman id 258097;
 Mon, 17 Jan 2022 10:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9PLF-0000XT-Hl
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 10:34:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c93f5f-7781-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 11:34:24 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-6avXrmREOu2alFMh27Eu1g-1; Mon, 17 Jan 2022 11:34:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4760.eurprd04.prod.outlook.com (2603:10a6:20b:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 10:34:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:34:21 +0000
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
X-Inumbo-ID: 09c93f5f-7781-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642415664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sh5YJYp37wihM/w9WZNYSGnjr8sjGtViGutUnR7nldE=;
	b=jl2PxnFSf1xI2uhNxXJrKhTUNFPJXsvtU3Ua6E3ZIXPNgGYXUFyv3YYSvC9lsAL/hjNMLt
	ybHibWKl3VK/T/84SczNtDvR/bUChaEcmy+i8LzCdU0cjn27w1OyXg3tXnEC56xJxJeJN+
	RFYIiUSoPEwMnXWZ6SnWWsNPWMKeC7A=
X-MC-Unique: 6avXrmREOu2alFMh27Eu1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljV4wPghNcPPHba/SQIWw4I/7j7J5Fiuw7B41GEacfC3r1pcJfpwylaByq6TebtiPIWQIfLtclU5NiGKhlBzho1TZrvn82I1yn12CUF3I+GQOOlplse12NxaKXb5zXq+zRSDyJnJYCq6JTlQPc3Ki5MQZz0u9MRvYNr30K4knuZDrlTXRl9fH4nqWap994QGUF23UVHhgxROD7oTGxs/HUJMaLyMyXjgvWqJs6p3Qhv6OWGzQeUI5gFqgErxDCBHPMXhUrF/01Yc31viYYHc4vSf4xyGibjn0ebx1PBQ5Xv2gjKOTgwklzktUvv+b4ulOcxWy/lQvekT64hQCJya8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh5YJYp37wihM/w9WZNYSGnjr8sjGtViGutUnR7nldE=;
 b=WFk0a0Es1hHYWctodJIemdWPUUHiwiP7bcBOn1d9UWL7Bj8UGalhvBJB0zCmJLVyZ2D4hv6Rza2nkA51NxnytjEetdMHcupJdbGpO6eP0PB0EcteILG+xLowIqqplgur9SiNnS8NobdvXinTypmnJGOWMxPNizDIpp8RlAeSRv5St2s/UXx3lHoieAQiBROHKV50deZQNeL2XjScS8s4prLI1DuzIIClW0fDCDGNOX1+4CMmmVT1Uu+3WJHqURn64qrl0EfTMVxczULR/CwwD5pLc79fWUgx3kGzU0hf/WjKD95sDbXCDNKRRNkII3Sfp1TBRdTL7AHmBpIWdbkLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <476e1c65-8883-16a2-996e-53d7c42638ed@suse.com>
Date: Mon, 17 Jan 2022 11:34:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: mark wait_tick_pvh() __init
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0112.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 098cc1e6-4e83-4df3-965c-08d9d9a4ec92
X-MS-TrafficTypeDiagnostic: AM6PR04MB4760:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB47600F0A1F5B45862AED8E2EB3579@AM6PR04MB4760.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ExsNQJf4FjL8JvK6FFQytVrGsrTPz2iJwfr92CcvqqxH0OeOxx+mlu0L0zbh13e/X4S42Qaah4+0NWtDjlCSFHKQUvyVPoQna2hVrB2l2JUwqbq1k1VVa1S7XyoXcVYXDwFMyfVtz53Ya0P0IONCioW6szjn4vjTJMHYzfU8Ak70zTf7XWnw1wPzriD/T2WqFo2Xcr6iCq1bi7Wn4Ybt2JY4yeNzHsOX2IalR8X5zmej7osm4RbnO9kZx/BpoKr/uCDaQMdfNGanlRcG2SlP/TsMOR7Fh2nq8QZ3KE10wetatf/pei7eMjCv8I+BijVmLTGqxCqGhhpil22ahkOI1npUe7MiffWQmeZmCOZQK/qNOFMyQT0I1GTmDf8bVh1Bi9MO/FRJFJfnpBnVwMYUgTvocW1deAKAQc299IHMZs8Dp1t1qgo0PEAmqywtFjCLw33SnnfMI8UuwY7pt4VV274wnVSdRWwEnwN3b10T2R6NVj6bZ8TeJTQZ7a/x7m76+T4cixfg2LSt67pooT/dW7XgLw4D3oWmcPVkb/xhr5UlemCiKKKQLr0KPVj96m7/K7aCAQGwSeWYRMTbnUgLH/9MxZMIxwRp0dOd3XB1c84Nh03zojjK3Kt6f1BoWiYjMRz1DnsW0R/YauyRmHc1ItxBgDvapAtBMUkHS3yGTFXf6IOWwU2jty6MTzMJjIzIfIR8uzwGfaINt5VPSpDFqz0Hr1Ew6seIKfqD3iQAtG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(26005)(31686004)(186003)(6486002)(6506007)(5660300002)(4744005)(6512007)(31696002)(66476007)(66946007)(66556008)(316002)(2616005)(8936002)(38100700002)(2906002)(83380400001)(4326008)(36756003)(54906003)(8676002)(6916009)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWRoYTNkY1ZNaWIvRDczVUJneXZTckdnRzNDZGNCSkhzaE9IWkNXZzFZd2hY?=
 =?utf-8?B?aENFRjJDNy9YVGxWT3FWV29QUmp0ZkZnSVhpZ3h1OWRtRUgwTFlNL2xBZFFr?=
 =?utf-8?B?Rmx5aW9lMnpLRkd2WTZnS0VJbE5VT2NJLzlPVVVxVElSSkEwb1dodU1SZzEy?=
 =?utf-8?B?NXdIdjRxTVQ1dWhXektNS0ltbGMxRkZzbm14aFZFa0o4My9wWjF0SnNPTVBH?=
 =?utf-8?B?TnQyS0V5TVU1NVZ5QzcrUmsyMDYwMzNaclU2ZG4zYnB0aEtVdEtpcmJUSkVW?=
 =?utf-8?B?d09YTS80b051TGMyZ2hmOW5KR0xTWjFBTmVEZDEwOXEvUUN3SVpsTEVpeVlH?=
 =?utf-8?B?a1V1V201UXNrd1B3eTZpZHJid1lEd0NXQ1h4Q3VtL1JJR0VucHFycFZoeFI3?=
 =?utf-8?B?UkFLbUlsNXVqN3RBNXlqbG1DSWl6TXZwd3RpYTNEZ0RQN2huTEFqbGphUEJo?=
 =?utf-8?B?OTVWOU11RlhSTmxPY2c5Q2RGRE4vd1BjL2JhS3EvK3RtZm9WelozU01oeHI5?=
 =?utf-8?B?ejZ2VERUQTIrYjAxSlpTKzFUaEVxQWNXT2pTbFROczR4cTE4M21JbSt3SHFW?=
 =?utf-8?B?ZGl3WkN0TzFDVHRvT3VNOFFsM2NTenJlNGpLTm1wanhUM1VISVJML1BrOTJH?=
 =?utf-8?B?SDlxcjFzcFdReGxReGVnSXRZWloxMjl2SUJpVGQvYkoyWTMyUGdFYS9RaDBH?=
 =?utf-8?B?dlVOYlpmUElJLy9wK0s2SnYwbmhEUThNZm1CTnJiVHJYUzFVU041NlpHODcx?=
 =?utf-8?B?SlpVdEVmbjRpT3FOdnY5VWlrZnp2Y054U3Zocmo3T3lFaU1MblJxUnQzNkJj?=
 =?utf-8?B?cHNzZ2xpQUt1WmFsOFBhN3pVN2JFbFNaNlBjd1NOMVZ2Q1Z1c2xiZm5LejRa?=
 =?utf-8?B?bjZBQ1VhK0g1REpGNUxnblFCaUZrVWRqbEdOeGwyOVJkeVZIbThSdGlabG96?=
 =?utf-8?B?R3JnZm1ZSkNBcFVEZ21xd3JpZ3ltRldnVWVRdW5ic2gvdjdJYThncEpaVVhP?=
 =?utf-8?B?ZWRxT2hXN2NUTHFxUFVHN0RCWElNM0NmdHNxM09wVEhCSnlMZ1lrNUtmTHdV?=
 =?utf-8?B?anBXQUcxRkI3VzRtYnpTKzUxZEJBcDNGSXlyU0JBL0h0NFR5S1cxNmpLV1FE?=
 =?utf-8?B?Rk9GN1ptSWYxUUxUSm5XVUM5TUVpcG0wcFVINTJpK2NVeWM1Y2MxL0ZHZlM3?=
 =?utf-8?B?L2NCYUJIVEI2SldLcldLUHlJeUlJaitlOTJnYXJRQmEvZUF2eThLWHE1NDcr?=
 =?utf-8?B?RnNuWGlnL2NmSHhnbWVPdzhYQzhCT05KSDFWb05FTkFjNkFPU1lOS0tFQzNJ?=
 =?utf-8?B?czlhMlFTdW5BU2I5Q09vUmpJdlVmYmhtamw4akhMUnNRWndCeEVQdFBvMWw4?=
 =?utf-8?B?S1M1UlhFT1pQSjA2emhhRW5QeUVlWFRrZ25iT2QwZGx5RWdDd0hzbVVTYTFF?=
 =?utf-8?B?bWRTdHNlMkp6R3dwL29ZUmExWlpYSFRxb1V3U1NEaENPTldrM3JMQ0FodUpk?=
 =?utf-8?B?RzdKdVB1QTMvS1QvNHNuNVBzeDlnWnBVV28zRDgwU0ZVMUtJUDlDTjZDU0U4?=
 =?utf-8?B?Vkx1NWhRdTA2Rnh5cFZ0Mng5dkY3UzROb1FuNDF5dVRNVnQ4NnFoeUEzeWlG?=
 =?utf-8?B?ejJna0NLaFl6VTBBQmsyNjJ0ajlRU24xaFlhZ3Uwb0NSclJIODYzSjBnYzNI?=
 =?utf-8?B?U1N5Q1RWYXVrak5tY2tiVnlUNEVjTU1xTHY4ZyszL0wrM2pldWRNOGFMdS8r?=
 =?utf-8?B?ZzlBR1psUTlZRjFRUWtSdnJUdElzUXh5N0lkT01BVi8rUmVGeGs3N2hKZEtp?=
 =?utf-8?B?MEN0Z0dBNGZPRTR4QjhnVGZDbkpPT2M1eCt4UDlMN2xRaGY1SVcxdm5pbi93?=
 =?utf-8?B?R2ZWb293QUxIdTlzZDBPeVJiWkNHSXJ4VXhlMmhjcG53NG1tUFliSTVKaTc3?=
 =?utf-8?B?ODNIempvNWQ1SGdBM1RDS1I5MXNnbmRTVVF4NEJKMEtqeUJIZkpVNVpnRkNH?=
 =?utf-8?B?b2xqalg0d0NrNFRxVzViS2ZaM3VzVFprWUdsOUxGc1Z1L0w1UDdRZDJWWllq?=
 =?utf-8?B?ZUprUURmQzRrY1ZpSHJ3bk5uOTVkQUtjenVXSEJ4MkY0M1lpUlpwTVdRcTJB?=
 =?utf-8?B?SkJ5b21CUktQR1h5SDRacXkyRVd2ek5hVmhYMHUvYnZHVlNDalhmVVkyZ2Jq?=
 =?utf-8?Q?37xk9eOxaCKHSKoC4LXrfFo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098cc1e6-4e83-4df3-965c-08d9d9a4ec92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 10:34:21.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MinucoqY3I/q3wQt3R/LHZIr9tFtIbFI7udPhE+T2O6AbfazYQUXuwpaklJTpznPEhZrkORlUrAtSP03ndamQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4760

It should have been that way right from its introduction by 02e0de011555
("x86: APIC timer calibration when running as a guest").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1190,7 +1190,7 @@ static void __init check_deadline_errata
            "please update microcode to version %#x (or later)\n", rev);
 }
 
-static void wait_tick_pvh(void)
+static void __init wait_tick_pvh(void)
 {
     u64 lapse_ns = 1000000000ULL / HZ;
     s_time_t start, curr_time;


