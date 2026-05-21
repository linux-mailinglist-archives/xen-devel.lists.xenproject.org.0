Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ld2ETQlD2paGgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:31:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7105A860F
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315427.1585251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5MF-0001Gq-3Y; Thu, 21 May 2026 15:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315427.1585251; Thu, 21 May 2026 15:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5MF-0001EA-0B; Thu, 21 May 2026 15:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1315427;
 Thu, 21 May 2026 15:30:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ5ME-0001Dk-Cj
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5MD-00BMfi-Oo
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:30:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f251b-e002-0a2a0a5209dd-0a2a4506b186-18
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:30:45 +0200
Received: from [52.101.61.33]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f2524-7371-0a2a45060019-34653d21f0d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:30:45 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7310.namprd03.prod.outlook.com (2603:10b6:a03:52c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 15:30:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 15:30:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gf71ehuu1QADiZ4w+d6WAL3lZy1764YgmsK0B0CM6BK/EOcGSDRz3AhY3kOv+T7BsKLLWC9U116IP8fAuK4dED89uyHCsLbEF0yfmItPeM0UzRi8ETE7t1YYNruEKvuoFOTNfk56TPIKuU114SF6ZfMih72shtfL2iZpdF0eRsKCSsA8xv4M7b1t2/NpMToafLr1EdyK092/sNy4ag80wdlFe75h0+nN0mMSdKVqdP62nuJqv9fSIbFxh4S6TVFsEN1fEgjRdaWl+QUJ3CeaBV79YvhfSK3krXEf6mQyxSXCVd5X2Jw+f2lS29JufDfNP4C2W9cuptWdemrzbARTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FKR/++izjAJV7+dGLgHPPZgbI3gFgfQjtLQbfr2t4g=;
 b=KIMywvSIWlfB1gjc/KMhfpsTd7SSpa0tYWOHSsH4SXODSoX3l//Og4ncAL2kThmujBudT2lkvoPMBEAnx3zgMfA2AsX3bDYUD/LJhEfi+9TtBQ4kwEun06mXgBBx0knFR0x+lofJEm798c+3KExJbu7HAD47Ffrr1EZVZvcLuBzTvVTaeIwdxQr8DZb7o2GoHwCVb6H0/WReKyQKAfPPG/qTQcGePTFncfXtbnnL1VyXS47G2JHOolHWdx7ue0DBbLrpr8TX/VX3MUL+Aip8Rl3EQpXzUc1J+cKetzfYofQC0j6SrpBrRbPk66PzmKQ6/8cw2KYeazk/LP/wmnhnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FKR/++izjAJV7+dGLgHPPZgbI3gFgfQjtLQbfr2t4g=;
 b=oVS1psdMp9p0xmGrXx2o3xQ61en9e8QvBLMhJx9sKXs1CU9tS+pKdRjFOPEEQeNGUtbc6mns/yu0VPkGGo5b1vAi8E35GuHVIIzZbMC4/HKEWPlR/WjKzmSv9pMVOKvP2/WcaBsPd3PbL7Eh0ZxwR3eo87XD573ev+ufYzMzV/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a2e00bf-64e9-410c-b0df-6f6832389525@citrix.com>
Date: Thu, 21 May 2026 16:30:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 3/4] x86/P2M: split a read_atomic() invocation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
 <80d2e824-e6ae-47c4-ba92-e023129ff209@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <80d2e824-e6ae-47c4-ba92-e023129ff209@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d31dfb-35e5-4436-e068-08deb74de858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Pz50WKhABcMEPTNbWz6+4S3PyojgJ1obvcxw4hf3dWYsSX0RdUlMWrDy26qfudkao3AW4/pfb73sVNQuzgkKtuxuP6i8uPrdk3btcGTU7WvKI9wKJ5D7YjCf5dHUX220vqRitUnMbkJ1qjZ72OIFhtaw+USLN7UXIGPZ4CyaP3kECVYibSWwU4T9bsfk1dCtGUPecSmaXeep1COjdPpMr6fMVvekw6l6HVA6Kv6qtoMnmg7A5BgzZ9gRcGEm8SfZyocjagMfaJPbR7NBbPfNGElWZOeQuLA1Huqj78hgHgxj060ThHJ30Fmefa5Ah3VUh2Nb44Mk3BeQPK2pqdT9I9sYHRx8KYMYZvqE4/KlCP9TlYM2CsB8dQA3fQoxg9mEh/Zw8S5j16GW7p1Wb5RCB9VSYTJeGthFHvVZOLx+NSWr8ej8iL4rbK1ZoyDzxKIQoP3WJFpFBuv1zjPuf8gn93hUIJmBZnAYU2uSZtE9DqOgZZ0r/X9AnV1u8+Ob+546W8NZuDBiiI13lKbCEWwthXWTOx1gd3RA06HHGJIqkykpTJtikPTNcGEDPtWx9okU6YeHbKmxpGYmLegxxoK5+PusrCQFHqhgoqvDgFaE/8qylczBZ4yMdNGgG6OPWKatabrqQov3xeQEwqiGmGoQs1QTBc0JrQljWqy7CRKXJ7RTFs29ACiToRLESwYIL8dQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkFxNmhkaXlpVEd4NXladVZTWUN4WElqMzdzcHR5UjFYS0VMNzBXZGtkRmgr?=
 =?utf-8?B?UTB4bm1HMlZSamdQdTVtRGNNdWdya24rZFRJK2FsM0w0WE5CbGtOb1JHT01k?=
 =?utf-8?B?K0x5QnNsdTZCb3FxbldsRUFmNHE4SkVtblRVUFp4dlZIQSs3M0FvSnBtYUhX?=
 =?utf-8?B?bWt3WHYwcVZLNFlJVjRsL2lqYk5ETHlvZTNtRXl3dWdlb0UvamFNdHlZelpV?=
 =?utf-8?B?VUJXUkJhTnR1RUUxRTdGY2pRVUdxZGtEMXg2YmM2VDdFTS9vZXZaWVp4MG1k?=
 =?utf-8?B?Z3RESzhGK3JjeXRXRzgxUTA2MGIvcytraENmSEFic3JMT0dJbnliUzVoM3Rz?=
 =?utf-8?B?OXBaNkZHTWdpeWxXQzlINnEvUWR5WGxiZmNsK1FyMDdmMGJsV01CamtPOXhJ?=
 =?utf-8?B?NCtlWDBOSEdhaGozZHJIUllSM3JYVVpRL2dSYkdMOS9xY29CcFl1NzdqV3dv?=
 =?utf-8?B?eThreFZTejBjaGY1THV0Y08wS2ZVL1lUMjF1NlUrMjV2WnJuWU9XMUpxRXZB?=
 =?utf-8?B?WDFtYUhEelliNnpjZ3ExanhLaWhNY3JBbXNESzFZNHZwd2NGalA2MHM4RHFl?=
 =?utf-8?B?cDNnQjBmcVZKcmxZNTVNUXBQVGNWZGV2SDF6L3F2WlBLeFpTQVpLbFIzL2Vk?=
 =?utf-8?B?ZFlUOGNKUnJuZE02ckRJbkQvVFFkeCtiZ01CY0YzT1hpU0xqMUpSSWRkQXpN?=
 =?utf-8?B?ZGo5Sm52VDRpc0owVms5UXhoWHBna3BqRWo5K1QrRWRsekNadmRXT3hQcFhM?=
 =?utf-8?B?QXZrdHBxdmxCUXhqUWwzQmdXN0J4UDdoZElWQ004R3RPSWRuSVQ0WXFEVlpq?=
 =?utf-8?B?YjNyYjBUdVlHRVk5anI3ZGRzYWxMUUtUTTBUajRkU2x2MDVoY3c0MkdVZWNB?=
 =?utf-8?B?OVF1eFh2c3dPUlBCb1hOL1VEcElBaXYyTmVYbFpNeGk1Z1A0VUFNOGRXSm1I?=
 =?utf-8?B?MUN6bzV6dk0wL0ZkWkptVVFWY0FHS29wb05qMktWWkxmQjVUZExiRTJGUmhQ?=
 =?utf-8?B?NEovOGFkZVJsekNuQktMaCtwNFRFZUI1UHRVVERRRHdLcXY5cGFMNHhpRDYv?=
 =?utf-8?B?cWxjVWx0eS90WS9Gby9OTlNNbHJURmVIUFVPdjIxTVFENk1LMk84R0NwcHZW?=
 =?utf-8?B?MWNhU2RjZHBRdDNNaGxXVnJ4SERGdkFEMzdLdWpGTStlTVo3K1oxOXEyZi9r?=
 =?utf-8?B?NjNxUXY4ekZBbklvYlB2MmoxdkpWWVNBZTRsTk5oak9URE9NRENEWEpaVVJY?=
 =?utf-8?B?R2pZN2hiNFJMMzhkczVYTUJOZndTYTlWdE9nbmxzYlZuZmt0bzh3U0tEK1pz?=
 =?utf-8?B?WDdOZFpBU0pKbUlyaDZmZHpBcE51N2JWcUppZ3hhSWtIK1lBcW9KNW5QNmpB?=
 =?utf-8?B?ajBXdDcvUEZvTlA2dzRkZjcrV05zaHpQRFRiL21yNUpHNDVoSEN3aTYwcWM0?=
 =?utf-8?B?ZS85U3pYZ0sxaFh0bFlzSmV3Znd1NnVrU1d4aCt3bzR4NHZIaEJtcGVSUjdw?=
 =?utf-8?B?bndIdlo4MlpzSmxXVnFKSVJIZk9pSHduY1NaQnhiNWhVdVlKck9hZXFPMmV6?=
 =?utf-8?B?a0o4OFJ1UUk4UWNnR1NNUHM0bkljeWdWYWdKVVA4NGZhdlAySmszc3J4d1lZ?=
 =?utf-8?B?MkhaT2ErUlNoaW5UQ1JzRnRvSTlmRTdJM2FmalViZTcrZUgvVU5CK1V0NVZ4?=
 =?utf-8?B?U25yNzdCamJxMW5INDJLL3V6VHZUVE53UWhLM0pXa1A3UURQVGllZFlnT0xt?=
 =?utf-8?B?Y1FyVTBRYXh1b2J2SENmNHlIaUNlNERiMmtKMlpBU0IvcUpiR2VWbGt4VFdm?=
 =?utf-8?B?S1NSOUhhZjdlN1hRcEw2cktHQnhzV3F2QndGajVzNHg0d2FIcy8vYStVYkxJ?=
 =?utf-8?B?TUU1Nk5QNkdKaW5iY2xQTzFEUTU5dWpYN0V3UzZYL1NieG5NaS9OendNdlFm?=
 =?utf-8?B?WE1VYzVnWHdzWHgyRmgyUUVZNlNuTmVTTVNKU0t2clppNkxCV1hSV0MvTlRI?=
 =?utf-8?B?Nnh1L3lYSmNIa0Faa3kwdTNWK05Ud2hRL3JZV0U0ZngzZ3lOVGRXMUh3Z012?=
 =?utf-8?B?Z2NXMUpDZjkwTU41ZzN2bVJFck45alpHQm04Qkord3ZlOUFwM29WNXhSUVVx?=
 =?utf-8?B?cUExZTNSYkVOVFc4M3FEbk1mOUhRS3lEdUVVL1BDVVJjQzd2VGVYd2ZQUC84?=
 =?utf-8?B?Y3pXa21GTlpvdGhoMnhIamdUTXhQMjJJUytUTzBta0ZmYTZodk45dnM5Skpr?=
 =?utf-8?B?Nk9DMVoyQVl0emd3T2NJZnZ0U0p1N3NqL0dVODUzMHBDMG53am5ILzQ2blRq?=
 =?utf-8?B?Vm02VU1rcG45MEExQ0h6TGJweUMrekc0N2xPcFRDQnN0dzVPckZ0amo3TG16?=
 =?utf-8?Q?778Yy+fI4mmLIwOk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d31dfb-35e5-4436-e068-08deb74de858
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:30:37.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igAXssGbN24HOoePTOfN9DP+Y3ZaUc74tLOSauujiUdLgbSpBJpgVF84WbIyu9bMIS7iolRNozlaK0H/HBtRqHECu83pGqnWaBI4u8TGHPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7310
X-purgate-ID: tlsNG-16d1c6/1779377445-8EF89D75-D5BFE43F/0/0
X-purgate-type: clean
X-purgate-size: 408
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE7105A860F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:16 pm, Jan Beulich wrote:
> Misra C:2012 rule 13.6 takes issue with pfn_to_pdx() and mfn_x() uses
> (deep) inside sizeof(), as used by read_atomic(). Break out the MFN ->
> struct page_info * translation.
>
> No difference in generated code, except for a line number change.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

