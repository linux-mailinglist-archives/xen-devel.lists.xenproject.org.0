Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31096D4B30
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517478.802842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLbW-0005di-Mf; Mon, 03 Apr 2023 14:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517478.802842; Mon, 03 Apr 2023 14:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLbW-0005bL-Ja; Mon, 03 Apr 2023 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 517478;
 Mon, 03 Apr 2023 14:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLbV-0005bE-7T
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:56:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe02::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aebab964-d22f-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:56:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8969.eurprd04.prod.outlook.com (2603:10a6:20b:408::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:56:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:56:13 +0000
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
X-Inumbo-ID: aebab964-d22f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hezAqPL86OnmI4MejXQqvnV4J4QmjgUxuIoLbrPRLyFIyRfycMRuJCCjiKWmTVgDyQQPrE/JJRedDSTwy2IUxYnd/KH2zPQ4PredvVwxtkENfr3eUb8IiYDhwY5GI9DSBrnR14ABkc6vsPHlZZve7CfRLuf0Pp5vf8j+Cy6UxgSdmZ/ub24N9Uw6qS0VreDxzqtizqIXFkY90fhHz3rECpB03wLX9BpSBebf2xowzEtYL2CsQ0qgUoWJj9sOrPVH1g/mdlxxqQtG0ATxfqU+7y5vb2Lr+xueOU4VmOSxJFgGshLhVwB1luBXbR5L1nQX89fqMuqdceMnrwhKzu6ttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCUUEF17r9XW3dkx0a5vTv5SWd+1bdYAn0PcErwXMKY=;
 b=ARuvEzmApDObq3RFi38OlrGxxfnWI8BdYeD5W/UIbHSg9xPVIpO7Ct63yq75wBeuEX4J0cszOAQCdfrdbhJZQbaVCU+SyBcExF5Rj6DiQ45HYBQ6rbMJbDhsAGwIgzB9Uq8lQF2b8zQYPAQYx5p/5ldGSSZ8E03AcYxk0kmc6bvhB9Z5uhd4Oid4gzLSnPFfuWDupgy7mD6JKHqEOh55DpPdRpPmu41COtQPgn9nUf1qnLh+1eszdCRYdWXZNEOmKL/m1P4eBZydaCXuiad/66BHHD2SQi5QoGjW0hZkAPCThhai8Zs/x8gdskJLUvLbDyKwp6WF3heTa9gxQQUpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCUUEF17r9XW3dkx0a5vTv5SWd+1bdYAn0PcErwXMKY=;
 b=I+o87UIhGCP86CGyaG1lc2Z1IOCm8JK8RXLiLirKaZhVdkvrpMpj0Hh3szau9P0zr6RXBhNL4NBI70vRYwREL412WjBqVj2vgUFkNGEcEYVJtYtYI5uXFYS00MJFrzWu53lHoZl8ynQqdSPy4fmQPDq5kTTlW4n+s3oZ/GfVud3dIrKqIpaJ2pYogeui7FyUp6Xw42QffMYJZML2e+KmFB9hUORA7Vkyv8QzEPHFe/GrRPoZJ82ySzWwnIki/BvE9ZsPv4l8mf345CZDZTA7kLkBBYyDGDmbJewqJ8Cyxigk7XDd/QqKjxiE2GzS9ugSjP9NYN/evP2f2r1E/g2Iww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Date: Mon, 3 Apr 2023 16:56:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/10] x86: support AVX512-FP16
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 176e682b-0784-4677-f35f-08db3453918c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D4BIcZoFTnb9PMSpaJgwTxnXlRpmMDWzlVmpcg/lhsjMf73i4N2R7a0iiYuFkUvm+uI2RZiMT8pGX12JA6lAN41OOFP5FonqrWNcRqwjt5JExD/nmZOjhT0oyQNCcxGIdsZOWQIuwzyzHiELQq+CI0noEK7lOPmCNLaUqlIuIKOQdAc4k/uom/kI/Y/rfXOeZ+RUrpYH92tJ3E8Gu8Ukowpk2B6Jr+Z4SurQ0W4gq1zBbzMRwM9T0tvc+Y3+MOKH2kGiwgH9K/EK3wkcGw3fz9Sx5a+jaBIt1ykdYivsVR1XAIQghb+BgJDzu+6SoaAbz99gcjEDmt/oV+M0C64sdTJhAgVsnAiM6Af2SQueQVvVETcLpkpekvg1UNRp+1dpw6IAQ+t1B2sZPijdFEVl7HVrJwuFRR+rTD6to/jkRqBwgsvjauZ5ppgf1FeKbjlEcnnF5eG+cYnq1853uRbhISgBiZt8yZoJ51URYKL+LozI2wqMAQJ8wYaVTwGO5qT7vbVx0QErFx4G8OAn+qEA03jrpTl2oPH5OIQB+/amQPYLVkU5BrYZ9z5Fk9hA29ZhVMNPR2VQ+x+cUQ0231cf+SIlhUMeoSR19kWjrkl9hVrFCFE9Tej/mGqhkvcplmAbKW64b3HP8MokX5AX/QDBdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(6486002)(186003)(83380400001)(6512007)(26005)(6506007)(6916009)(8676002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(54906003)(316002)(478600001)(4744005)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y25kUFdLZEhVaWdsRDR4akE4a3RRVVpRTzdWbEdzSGdTYVBZR09HS3BRZUFu?=
 =?utf-8?B?SkhEKzF2TVZoaTRKWVNIczlPTXkrS3pvSkQya2Y3Zy9XU0d0a1VUcGhKeUR5?=
 =?utf-8?B?dlRBWG5pcnlsVXNScUUrZ2xZeFd2WWpHM1kySEV1Sm0wTVZhbnFQVEFQSlhV?=
 =?utf-8?B?YTVlbEprd1A5ZVdUaFpEaGh1R1JLL3ltaDFKQ1plalVPV1NZdVR3V1JkUC96?=
 =?utf-8?B?M25mNDIxc0p2bVJCTEovZlUzWmRDOW1ETm82Q1I0WTJiU1psTGVhTVVxbnFT?=
 =?utf-8?B?TmlWYXVGMGVlODg4VmNLYlZDYkluU09tTktucU1ZdG8ybHptWXlnNGRpSFpy?=
 =?utf-8?B?ZHJuNVZ0MkZBbitHWmhJdnpPWVh2WEhqQ0wrR0FhK1h0NVdZRE53eHNZU3F1?=
 =?utf-8?B?SEU1VmF3Z1FoZ0UzRkJ1YUNtSWp2Rk1Ya0VwOVdNWG1iVTZrNWpaaGdwSUVE?=
 =?utf-8?B?cGFUQUFRMkpvSzBhc09WMVRsdjJBWHIrT3V2MU8xcjcrYTd0dzdjVUl2KzRt?=
 =?utf-8?B?a3F0SGRseHdSN2tRYjhadlgzMWVJUDlTeVNMTGhLSklta1ZyYWNmZjdMVDRr?=
 =?utf-8?B?Q2R1R0xMYmdVM29CaXRQRWxaQ2ZjRVcrbXpIWTNibUR1UDN4bEhGQlAvTmp6?=
 =?utf-8?B?ZWtOM2FBdXQwWHJIYzVqenYyZ0NDTXBZeXFhM3BtN2MxUjlKN0NBZlRaZ1g3?=
 =?utf-8?B?bFRhUmsveWdreFVVNmRhdVFnNlllTk1LUEhCR01BWE54aE96MG5xc3BOUDhu?=
 =?utf-8?B?ZVkwSnpvejdEa0l3ZWJZNnNXdjA2RCtQaHMrNTRGNU5Ia1V6RDYyQVZDWVBO?=
 =?utf-8?B?Z2pRL3NkQytMNjNkMk5LUVEySGhTYURLTEsrNENDOTFvbFZmbVU3SXBQdVFP?=
 =?utf-8?B?MHdybHZiR1pzYVNlS2NZR1FFVi8ybDdDdVpvTGlZVmpOQWZzWHAzL1RLNmJU?=
 =?utf-8?B?bml3Z0MyUW1MUjVuZlpLNWZzOFJnTjBZVkFZa1d0cHBnMDd2TWRIUkdwZVNq?=
 =?utf-8?B?bTlkZWw3WG15cE5RQTZMaTRzcFlpYVlLSGVFbjd1ZnlDNXZVcUxQNlUrZU9J?=
 =?utf-8?B?dVRYVGJRcTdMeldoRml0aWRqMzFIbUNncTYvTHB0MUVKZlVaR3pUYTFTUi9F?=
 =?utf-8?B?eEMvVkZUTmhubHhTeWxHUnEranpoaWVUT1l1aDRUY3djRGNZRkdiUnM2OHc5?=
 =?utf-8?B?YXo3N2V1ZWV1eW5Gd2xoWTdoVnJjOU5VdzdTWlNqR3hSUmlyYTBUaFZNSnkr?=
 =?utf-8?B?aWRCbnphY083aVRSTllwbmpJOU84SktnK2hCaW4ybTVVMU5JdVdkZUpucG81?=
 =?utf-8?B?akkyU1g3VG11Unc2RTIzNjFqeUs4dWh0b0dUS0tGL0pzZWlUZ2JiZFRROWdQ?=
 =?utf-8?B?S3VwVndsaXp0bXVwRzE5MXpDYWoxQzNJbWdFMm9FYXRtQTkwQTN0d2xsRnI0?=
 =?utf-8?B?NEtBTTJLcVBNbmFEcmMrSHpldE1LZ0o4czZVRUlZSTcraW1GNExGeGVJOGJ6?=
 =?utf-8?B?cWdmbFVXQzMzaDZaZVN5bXRMbDE1NmZiOWhUSDlTSE5IOVAzUjEyMHp2L0lt?=
 =?utf-8?B?bkpodWZsd01XYXNpRHVlRzV2dGZnTWRWem1SbExRa1hyZ0JwOXZ1RU15TTBW?=
 =?utf-8?B?Z3llMzByenZFc3VIbjBxaEprczdhWm53MHNPbnVBNS9nYWF1SWI5VmxHUHcr?=
 =?utf-8?B?ZG1CZ3c3RnIxQitlWCtQUVZ0OTRUTUpDNXpjb0F2UjZZdW5oeVl4anRYUXJ3?=
 =?utf-8?B?aEhJUTBldFRVeGMrRkk1NzlMOVdSY1FMQ0YxdVd0c2d5eThTb1VXK2pMYXRI?=
 =?utf-8?B?eEVBK0xoZDJPYkdiN0UxWWl5d3VnaUhDeVkzMWp4eTk5NlZMTXZWWk9qd2Z3?=
 =?utf-8?B?RTFZMDZSQWJmdzgzdWc4c0JxZ0pyRFBVaUJDbVE1QXRpMzhkSllZVEphREsw?=
 =?utf-8?B?RkdOd044a0R6S1czYWVBWGVINmQzVHREZnZpYXdlVTJGUEFrQTJwVFdXZW5n?=
 =?utf-8?B?ZFd1aUI0VTVwVllKdndUcDBJaWhhYlExaGtCN1czU3NsVVRHaTZIeVBJRDBS?=
 =?utf-8?B?MW83ci82dmxuUzJUQWRKTW1rWE8wSG9NMWRSdzlIaVNVYUlsUW9NVXZaL0Fm?=
 =?utf-8?Q?ekxAlKqKnkdN7mHZbikQGnm9w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176e682b-0784-4677-f35f-08db3453918c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:56:13.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajySwkRM0E9DQaQy721e9SfyfqDo48EUlpawqs2qMG9cmXiwyzmEhBAxbKSN5HoijtvZ9LaTP48TSnFNC+MyIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8969

While I (quite obviously) don't have any suitable hardware, Intel's
SDE allows testing the implementation. And since there's no new
state (registers) associated with this ISA extension, this should
suffice for integration.

01: handle AVX512-FP16 insns encoded in 0f3a opcode map
02: handle AVX512-FP16 Map5 arithmetic insns
03: handle AVX512-FP16 move insns
04: handle AVX512-FP16 fma-like insns
05: handle AVX512-FP16 Map6 misc insns
06: handle AVX512-FP16 complex multiplication insns
07: handle AVX512-FP16 conversion to/from (packed) int16 insns
08: handle AVX512-FP16 floating point conversion insns
09: handle AVX512-FP16 conversion to/from (packed) int{32,64} insns
10: AVX512-FP16 testing

I've re-based this ahead of the also pending AMX series (and,
obviously, ahead of the not even submitted yet KeyLocker one), in
the hope that this may find its way in sooner than that other series.

Jan

