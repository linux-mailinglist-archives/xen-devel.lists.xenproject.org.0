Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61CA4C8A43
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 12:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281229.479480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0JO-000513-KR; Tue, 01 Mar 2022 11:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281229.479480; Tue, 01 Mar 2022 11:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0JO-0004yq-GN; Tue, 01 Mar 2022 11:04:58 +0000
Received: by outflank-mailman (input) for mailman id 281229;
 Tue, 01 Mar 2022 11:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP0JM-0004xb-EC
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 11:04:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce38020-994f-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 12:04:55 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-Kxb7z4QqOLeCEz0IxItOeA-1; Tue, 01 Mar 2022 12:04:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8095.eurprd04.prod.outlook.com (2603:10a6:102:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 11:04:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:04:52 +0000
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
X-Inumbo-ID: 6ce38020-994f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646132694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XRCBJrGYHuXcM+y+uvLEjkirCD2EFtAu6W00DFjZ3Qk=;
	b=TUbTPjzQd7DSgQvC4VjOaDkIsxeZbpW4/ckXiAm0Hs2s5B0pEwdWrwXJaMj/WxTDMBMoAy
	KkRsI/wBvWtkOh8GRUDVP9JrQyc3pKjU6HdKeS/KsD4b75nPpSOBs3u0urZeCNF8Oq5yUs
	4DbzspLVnwJjJ6yGH8vLiTR0l8sq82A=
X-MC-Unique: Kxb7z4QqOLeCEz0IxItOeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQivutYdrsDao/cXCJYj0xzU9uqphpwdvzyw7Rk580tP4/Lwjae1DOrvZ6lbrW39d/kah1JOgzBDdFNlXn+xByUMjzAEdArysqqs4j8jR14aG7X5PLoVVa9qgF4J3IAsmGe0EzOe7Ztcq9kPeuj8+gYc25jM8rPTamkbg595a9/BK2osRWgArNbod64V/oLnk7+di7kcpY9AgyINNuXs7p5yoD+l6+o5k/ZSovcwnct4dyZ2hxjpdhjrq2VR2a6KqgBMx9mYMdMCY3tThV7zl6HKOtydg2ZcpZRaPpaoNVXZOl7ErUdu6ZpcRsMEuZ3/IIJscx5+w7zInNQVCTvqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRCBJrGYHuXcM+y+uvLEjkirCD2EFtAu6W00DFjZ3Qk=;
 b=aFNelPHfz6BeSv/p1DGkw4NFzILwu9mlJZL66i4iZvUt5h1VWRGZAM+6TLOeRiB4PWVeO0K+k/6HUn65egh1VtOheAwXylT6S8mOBQm+gcEAjXMPJDHlgCIc0GAv/kNfZMJCTvmxpVejSOuywoKxGPW6YnPa1jvbc/4JRcSu2BgXuINNKWiZLtrQV8PxsXvAw0T/vyZQXjcLRYD/mTBFmH+Ot4rhjYLPdW9WkX05eBpFi3da7ddHi0D7bTV71LSQ39PyUX7dVLvowUgZjKg4299Dqe1TdLAFO8sowC792+0129F3MRNBgSl3kURYb8qP5bnejioRcTj+55CZHmuPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
Date: Tue, 1 Mar 2022 12:04:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/time: CF-clobber annotations
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0276.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6b32ab1-00d8-4c09-c005-08d9fb734f70
X-MS-TrafficTypeDiagnostic: PAXPR04MB8095:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB80959D4B1A63F0BDD2C4CA0CB3029@PAXPR04MB8095.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2NoCMf2xXxtjKYlqWNIOQHGERGuU17ecqpjOHPtKFvQ+9vQEoN1kCKSjHj0FJr3OpxOAqkzcDxIDRil8U1v/B5a6Bj9HKgvJ1wlQAQEWcRt2ii896aZVwl5uQW3XI4TlRwKm5wcV9i4LlQXhbvksQCXd8Y0z9URQniORwYzP0wdHWHZHEADphcTaJyolWdumURYqzV+qKv8EhK5k7W2DXtkrQsOCXPOCVLd83O8RluhGbMgW6bNNHvlClFrrGQ4JvaVY3IPammSXudtDsz6qIJgihm2MArwC5mizfQ9bKJX/2kV1LsF0a4MwaYhlxQe6IMFFBoISK4EO/RWhgg9huLJQbEbiDJKGCIdEkaELWaHuPJ5vYi8cW8cw0S0kwvSrvuRQ+KaYHwlF33qMqHn7soH+3h0Sfu9GuBNcQCO9siCvGIb4ynbM/zENA6oPR6NOmjLqj0iLh92vC+C8xDWo3kfhOMq2X2ptDJeUpHRga+H2bmD/2T/gJiVavrSdFFi1a64EAvguH8z9dbvuocgAo8o9s8sr9dic9FTiHKHoFSoqnxbPo/xny2uSI3zmp23QQIlbbItryuTHOriY2pukh5cgv8Oi42xtZCwAHhXydfq8pAthMf+7iBrCEKqke9WHQATPMjb9r/S7npq7aFXS7OW7maYasFIan5fhPElocFk/5vIUeqko8NQWjDFEHwKlWY8M9Jef+gHXjA1lvcAyVaR5i09lVQ7R8rNNboJyTUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(558084003)(31696002)(86362001)(6512007)(66476007)(66556008)(8936002)(316002)(38100700002)(4326008)(6916009)(54906003)(66946007)(508600001)(6486002)(8676002)(2906002)(2616005)(186003)(31686004)(26005)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE8xZXY2SEZGYnRQclhkblUzeGJjbVJhYlRnczljdDRtV0JQUHRlbHVURzRW?=
 =?utf-8?B?UnRNR1Vkc3hEVVVYSVhmcDhmS241elVqQ3B5ZmRzdlYrYUlORWJCRFJIRTV0?=
 =?utf-8?B?Z3Q5UHp6Kzl0SkVGc3phakVCMFRaMVhXdStNU0tQemh2ME9UVDhjdStOc3lY?=
 =?utf-8?B?S1JkV2lIU0ZKUC9RTzc3QjBWUUZPNWlsajVxc3lZQmJZd2p0bWZ5d21YZ213?=
 =?utf-8?B?bzI0ZmtwQ1FtekhNTXRpOExSYm9qdVNDUDh3cjVXK3BaUVdOSVc3S3lXQ2Z0?=
 =?utf-8?B?NDR6WjFPT3J3aUpNenhuZGpaNEZKU3RWWmNSa08rR3I2MHdUUmJVWjEyZWEy?=
 =?utf-8?B?OUZISFpzUTlWU2pEcHk0MFV3SkcxWkxhQm8zOGRoVUFSeTJkRUtIYlJ3V2hF?=
 =?utf-8?B?ZG9DK0pHM2diWWVibmczUnRYU2wrY0xBaXdoN0ZuSEtMenFsWGRTa3ErREsy?=
 =?utf-8?B?RXd5QTk3d25PSis5U1pLRHNuMEVGL1pEK1h3TVo1S0c0RXdBUzVrNHBGZXc2?=
 =?utf-8?B?QXBVTkVKT1ZxQklIOC9mVk1ORHc2dGVtaW5KSHpoTUlIN202ZlczWTNkeE9U?=
 =?utf-8?B?dUhkTG9XRlAzOUZxVzFqZjYrakhzL2FMNzdvbm9YWmtEUmw1dkUrdlp0eGgz?=
 =?utf-8?B?OVZoRDZyN1dlcVRVMlhIZ21TUlFFZ3I3SHFYLy85RFBObDhUbkpwT0Q5K1Ro?=
 =?utf-8?B?c2NLRDdjYlNvbG9samMrdjZTYlZ2UzhMWXllZ3gxYzhaTWZXbmxzN1NCb2Y5?=
 =?utf-8?B?a1pLc1liNDVhKzNma1VYZnFZWTNNeWk3S0NzVklDY1oxQSsxbU5kYzRTYzYx?=
 =?utf-8?B?WklDc1ZEbWxiLzBTT1krd0lMRTN1NEc5TlRBdVlnZFlSTG0xakQ2Q0lOc2lX?=
 =?utf-8?B?cG5PNkFPVzdHVGNycnQvenp2N0xyZ001dGVrYUVsUG5zaWh6cnBJVG5HNUN5?=
 =?utf-8?B?VHJWSzFFNmRuV1lYWU9yakxVQk1FVG45VXlFdnlLVUxsUkJYMU5nL2JRdXhQ?=
 =?utf-8?B?VXF5SWllQkxQQmNrSHlzNCtWN2lyUWpGN1g5YXBhdFk0Mi9CdmV2dGRVMFZO?=
 =?utf-8?B?TUxLWkFDenhsSnFZak85Wk9qdG1qZ09IVDg5ZENPSC9UcW1YZ2gvUzhidEhu?=
 =?utf-8?B?SHVyVkJWdDZuY2gxTXptb3FCYWRSRFE0MG95aHVjTFFML0JXS0ZRZlRMSFRL?=
 =?utf-8?B?L0cycnZCMFR2aGdlRFIveWVaRlhJWkg4Rzk5K1Z6NkMrSkh4cHI4aU4xR1ZO?=
 =?utf-8?B?TGpQNnBCOTBmL3hXRmdzM2c2R01CaGVkemxnRmtDMCt5eEdlZW5YSXV3Zlpn?=
 =?utf-8?B?b1VoYlRCTWplNFlWa0thQXdzOUZwdUtBSkNjWGcrUmpQSEFmbTRpRXRyUzRF?=
 =?utf-8?B?a1hYODR4N3VXZ1lINzA0WUp0TEhzRTUwMWFrRmJjNVQ5YS9BWnBnQnVPZmly?=
 =?utf-8?B?bTZHMFQ1UmdlVlRFNlJ3MEdjMk5wNDZSK1dOQjZOcFZDbksyNmttRDFFdVBr?=
 =?utf-8?B?bkU0enI2SUtnTzFmazBPY3gzcG1jTlYrNnJDZmtPRVRlOUY2ZnFEQU5oQktv?=
 =?utf-8?B?MUdzQXNzNnJhOWwzUjJJSE12enZabEFjSUJRdFlkNGc4Zngwc2dTcktzYitB?=
 =?utf-8?B?YjRjUzJCUmMrMVNiZjg0NHp0b0Vwa3R1NVZrby9QUXpjK2Z5QiszTXJOMGV2?=
 =?utf-8?B?VjA2cW5kbXJybk1sTjFQNjBsWDRNUkdmeDhOTHdrL0NHenlRejFwTGJ0dWl6?=
 =?utf-8?B?NGlPM29jVTl4UEw0YW5UblFzeTYrLytzQ1lsSGd3UzJFN2U0cWNLK1l5VWlE?=
 =?utf-8?B?SXgybll3T0ZkSm1tcFJoaktxbGVlSDBtMm9QaW5wTzJaeGcyQlVpUm90b0cr?=
 =?utf-8?B?SlUyZEN2ZmFmNVR3UXJJZWt0L01aeTFRVUxxM0JXa1dmRnE4Q3h5NUNqdWRp?=
 =?utf-8?B?cHdsT1ZJeXhoZ2xnWmJadE80Z3E4NmhKQjN5M2pKY1ltcHk4V3AvTWdNYTlm?=
 =?utf-8?B?WlU0eXI4Z0p3L3pFM3lNc1gxdE5hOUFjdFBITk1XcVkwajFZTUllTFVhRDRl?=
 =?utf-8?B?WXgwWDBIUzIzY1FKK1pjWkwvNkdmbUltVWdVeFdxUWs1M3N0eXF2Y21uTG92?=
 =?utf-8?B?ekVnbnRDMzJ5eFFHWGtGNkJNY0FHNWQzZ0RpdGo3UXRsMVg4cWF3cUhKa1lZ?=
 =?utf-8?Q?Rkkhlld0OAgxpajQzAr9KDU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b32ab1-00d8-4c09-c005-08d9fb734f70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 11:04:52.4892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfgawCdk0TC29Bl55RYH0qom8y6sjTBBT7af1oDgCSDusigary3dW/+8VQtEzTdCON0F1MJ29/YPsQlqqBYGcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8095

1: use fake read_tsc()
2: add CF-clobber annotations

Jan


