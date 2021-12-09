Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E322346EC48
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 16:52:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243147.420522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLhu-0008RX-CL; Thu, 09 Dec 2021 15:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243147.420522; Thu, 09 Dec 2021 15:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLhu-0008P4-94; Thu, 09 Dec 2021 15:51:42 +0000
Received: by outflank-mailman (input) for mailman id 243147;
 Thu, 09 Dec 2021 15:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvLht-0008Ox-79
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 15:51:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e591289b-5907-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 16:51:39 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-vsF7qsYYPTWTouqCZdg8-w-1; Thu, 09 Dec 2021 16:51:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 15:51:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:51:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:20b:312::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 15:51:35 +0000
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
X-Inumbo-ID: e591289b-5907-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639065099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RNM/UWLc/l5RbGVn/70qsROA1FTMSZM+SGN6JaPN9MQ=;
	b=LVJln3x+Ovmiq78Hg6oNXgZyZ0810uBhZmlNOo2RWp5f43+Cc1+SWCaH2emmknElPngz7t
	GmAy/1z5ceydBP5I/KJJsswfn+DZEBP1emeGwEvZY26QUD6SZntDSe2CoxRGGzoP2SA2Ht
	+DI7l5S3/0AQekMevUbUyPdGxvAgWZ4=
X-MC-Unique: vsF7qsYYPTWTouqCZdg8-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZVMIK+hMljVL3AjCg4m8GHQEiNChipARSZV1lcldyi2oysxH6Q1Fw98hG8cs1ITfMy0e9nhq17W6P39RF4J1/k0fNdU5icXcv48Z0i1Tm0Wb9iLrWdXeOfDV0uAiMbx9+w78wQXgw3nLYVESLPjwCQDvLF/S3ebLMUsVePvTmOoJYiz7VTE83jKBQ7pFUyiHAQmAmtCTIT6N7peRpYPpuf1cp5GQOjK2vEGwvHaAfYvXxX2p/FzSpfErzKpFn10KCCiBtYsFTMJvbnhcSu9MPaHEX6xsiPLJDtaCMsy2mHkYICw0AiscSA/GErQIk4OW/FBTjn5eIx3L7ACjMZipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNM/UWLc/l5RbGVn/70qsROA1FTMSZM+SGN6JaPN9MQ=;
 b=cL2+O9ykeYI98itnKThZney1fCY6/7xx31/2dtQt63YlhlIvzHjhHxT8mdMnGakUGP5eF/QSIdHMwIQCCJo6WkAPnP93kO3m6e6H9uY9FMPTwP/f2S8INPMYqv/52ZV+1VJi3OqPpdG/3cal8U+KSwWe/q0FAcyoBaH2Kv0K2r16E2yScFBoq6mX+/CYVSB73cc2/jC55rDkV87vi7MAFy2Xj6twtC9loUrArf/zCEUnWaTmy1W2x/XtyKKG0dVdr91sZ4j3tChDPikIwJasuuOAsxucxrd6Dvjq49jtL890NdcDEZXkv6MMaiU8KeDahab4AMfS5X6zVTExDeZj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
Date: Thu, 9 Dec 2021 16:51:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] VT-d: macro definition / use tidying
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04f058b7-2ed2-4844-eb02-08d9bb2bc7c1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445C2B572FA684529439F5BB3709@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OpMRWiPwQ+5Iv5oMUyinPSQk2vWtJRI4CZLzt2CA3tHmN98ir212UXOrm+F0cCph0KGj7uZRWwvKupmFfmiCXNPzGXPmnl0YW1+znpW++on1//BNCayNGzJq58cMS1KYSwkkShWFis/iPf97C1GktNSCYxRI+IwaotAiC2/RO2WhtJU/04RZUqOC+0tm8EVjDf+XLQqIvKHAaGjiwJm1quNkkX0GGgP3xdBDnY/Q8gHYO64Et9wvP22FRUon4VjQS1f8bQJw3pQTffcUWKH4oNh540dJEs52Acg1cQCmJQqwionI7ToUyWJXpx566w0H5LZfqUDkXgDq3YGoN6mnpxM6+U6CQjxhtq2PVMToXGyG9ZNQjfP7nh3NZ2eUKbPLx5d83txVJ+oKRlKUukCJneIPjWs1fHT6JUZOR/OwYTPTn7NfevYNkUl+xCrCTH6RvUdV63PqxA1V28H/nSHowwYeQnKxlKxTEUpK1QsoEryl3klph4NN7lWDohOUIdHDu7F9CHj2BL2EIIZxWMOp1BBdXAxe1RCOO9iQeJU+Rrj6+Ir1v33FL/xX6KuBdlXEpn95Z6gevkYKeOl7KAAsX4+7Ikao/b99e9JpbGteKf6Zn++Iy1iAdYNDJVxeUAs/fJHgNHiKEgd+o95r1avSliw4qm26OGC2nYv2WJLkrFeC1Fn9WQUsonidlDuzcO/L9WoEUzWU2vfaVAZNpVINTVeFXeG6cBEl1RQRsVSD8AE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66556008)(86362001)(66476007)(6486002)(8936002)(38100700002)(66946007)(8676002)(508600001)(5660300002)(316002)(956004)(31696002)(83380400001)(4326008)(36756003)(2616005)(2906002)(6916009)(186003)(26005)(16576012)(558084003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExDRHJUNUhQbEczTjU3RGtZbklOZlBNR05xV0FiaHd2VkQ5NkRrSGhPQXJL?=
 =?utf-8?B?Y21GdTJ2UUEzSWdYSHkxVEV6SmlkQnpTMlZFckZwN1RYeFo5U080ZGMxOVRM?=
 =?utf-8?B?elREYmtXajRFYU5yL0FnQzJGOUlidW1zK1RXOXA1aE5HZE8vem1oUEd5MXMx?=
 =?utf-8?B?eHN5WEZxL0g2T3RudlErcEMvMC9yWTc3bU1vRnpSWHVBRTdFRVdVZEQ1d3NW?=
 =?utf-8?B?WDE5VTNtSHNZQlcwYzFpMFV4WFlQWFB0eUNNSXROZFpMajQwY1RCUDA1YU5k?=
 =?utf-8?B?WHhvY2QyWDdja21tdHFRSjRrTTRHRmdEZ1pvKy9COXlaYUNTUFRUSUFJZVZu?=
 =?utf-8?B?aXRFYnIrSXduRmVFSFcwTk56OVpkRHRvd21ZcTJodThSbkE2RzdwaTg5ZGJa?=
 =?utf-8?B?UVlPVlhNeHlXQ2lsNEdXWGJHZCtqYzlsUlg3TnpLRmpFQUZSNGFRSWx5NFl6?=
 =?utf-8?B?OHJSWWxCdHpaZzV4R0VwS000M2tvaURWSFFJVVhFZDBXWHdYQWxiaEhYeEFj?=
 =?utf-8?B?dmpVVnVDSzNsOUVJYUFWalhBdG0rNUxHc2JyVFFVSk9aMHN1azZDQkY5VGlD?=
 =?utf-8?B?T3RDY09pVTZXcnRISWk2YWVOSEUwNnNoREhlQXFaaytScStUSVRmakl0QnJx?=
 =?utf-8?B?cng3elZSMTJCVFpyQmF4UFZmVWc4czEwazRqZW8yUldBcmlEYTlYVDZRT3lL?=
 =?utf-8?B?aUFaZTBDSTVxODlLUllYdXliNHFCRW1VUERIQVYzV2xmbnF4VFpaNXhoMG9G?=
 =?utf-8?B?NVA1Wm5QcWFIRnNNbml0aXpZVXF5YUlUemVhNDFScElXZUtTVm4rVkEzUm4y?=
 =?utf-8?B?amNIcnVOWS8vL012MGFjYVdOZWdHRWRJMVNESXhoK1M2eXE4Ry9leDZjUmRj?=
 =?utf-8?B?c3FzbytuTll1M3EyM0QvZW40S2IzOGJQWTZORzhHcSt1WVV0SHBuMU9RN0tY?=
 =?utf-8?B?Z3dGLzhkWFlETlVwdTUzTHg3MWpYK2szNTVzbUVXZzNveUl0QW5TOVNZdnlW?=
 =?utf-8?B?Mmc5QytpaXJabnR1T1Nwc2V2WHNVU2xrbHRFVUt6Z2hVRjhrb3IzMEg5bHdE?=
 =?utf-8?B?bzk5dHI2S3RxN01HSmJQTmdyaFFQMlhjaDFqamZUOFYzYXN2WVc3YXF5KzRJ?=
 =?utf-8?B?UzE5R2draitwT3JsbXBUSDU5WkxHbzJjVFQwb203N1Jqa3J6THJLQ0ZGOUl6?=
 =?utf-8?B?TG5tck1LMUxXZTlUcW1CUnhqekZoZTZVTWNDbGVWeTJmb09PQldJbXZobnJN?=
 =?utf-8?B?NkhnSUJSN05PZmFqWlpRaU12dUlzbTY5TklUZTBNaXZ2WnRkL2pBQ2dwKzZ6?=
 =?utf-8?B?VGFvZUM1dkRDZGFjRGNnR0IzcHBNQkdFSWphQUFqdkd6SW0rL0lxQUE4Tllx?=
 =?utf-8?B?TldObVVvN1o5bTFObGhjcitvUC8wOTBBcGNySjlMYmtTTW9ZKzRMeThJdVVN?=
 =?utf-8?B?SUNKYWNsNDlzdGtvNkhwdjhEQWswd1lIU29IMysyR0tOd2xaUkJXaXF1SmVQ?=
 =?utf-8?B?aFFiVWNzSGNFWjFROXNOdklkSmhwY2xDTmY2N2t6NUpxWnZzd01JRGx3UEQ1?=
 =?utf-8?B?SFIyUWFuN0kvWVFHRGhhSGFwdjNERmQrbEVUZmVaY2NlWG80L3Y4VGNsQ3BV?=
 =?utf-8?B?dEhFNTR6QVc5ZkcwR21uQmhSMzkyV1FENUhSTEVQRU00Rk1ZSTJ6QmlHWWFB?=
 =?utf-8?B?czVlMjZEVHBjby9obm1TTmR4VW9mTDliVUNmS0luUkRyQ3lXeXRCMk9OWThR?=
 =?utf-8?B?TDR3K0s0QS9kL0g1ZHZZcXE3Y1o5RUpqdVhhYU9aazBtampOVE1yenZzT2FX?=
 =?utf-8?B?Q2xOejJqUkJEUTlxamNNcXorcnpYdXdKN0lRbmk0WW1Ka20vckVsK0pjc1Zr?=
 =?utf-8?B?V1VzMFd3Nk1DeFFXZEk5UE94TGJBUHQxejlyR292dmlQbHI4YVhWNk9JUjJx?=
 =?utf-8?B?M3lHMWoyT01wbHdWWUsvZjV1Y01OaGJtdHppK3JoREpaNlV1dGNyVXBFdW1W?=
 =?utf-8?B?akpLcmFlOWdBSUpDamdGVUIxQVM4WXBFM1NDV1RSM3NwWFFBUmFYc0RtdXFs?=
 =?utf-8?B?eUtyaCtTaVdkMnVSVFFVdk5JdFgvbXN2cWdmR1lIdEVYY0dqT0xxRGdjZG1v?=
 =?utf-8?B?M3VUL25hWHN3ZW1hcy93NlJ6OVRoNjNhdEszbTBxMllWMVhFUmo3dnNvWjc1?=
 =?utf-8?Q?2Ih3IR9vcW4UDvyalbR9liU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f058b7-2ed2-4844-eb02-08d9bb2bc7c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:51:36.1147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uunjh58odMLFHUSB7nE4ZtBwbuGAG9x9p1iXHojw7MbxPGxpnRBudVPrT2gPoaIuu93fILRePd7TQANtZRHTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

While putting together patch 1, I've noticed two further aspects to
clean up a little.

1: properly parenthesize a number of macros
2: use DMA_TLB_IVA_ADDR()
3: shorten vtd_flush_{context,iotlb}_reg()

Jan


