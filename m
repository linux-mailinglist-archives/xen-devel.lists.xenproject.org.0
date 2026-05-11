Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEqrD6TcAWptlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:41:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9C50F266
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306195.1578259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQtD-0002FD-5s; Mon, 11 May 2026 13:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306195.1578259; Mon, 11 May 2026 13:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQtD-0002Cw-2d; Mon, 11 May 2026 13:41:43 +0000
Received: by outflank-mailman (input) for mailman id 1306195;
 Mon, 11 May 2026 13:41:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMQtC-0002Cq-4R
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:41:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQtB-00B4U0-3G
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:41:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01dc8a-e002-0a2a0a5209dd-0a2a450997be-34
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:41:40 +0200
Received: from [40.107.208.2]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01dc93-2497-0a2a45090019-286bd002d708-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:41:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5441.namprd03.prod.outlook.com (2603:10b6:208:29d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:41:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:41:35 +0000
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
 b=rhf8o3I49HcQmNNxuJNJ7ySyEh/EyVgm3RrNVMjl+Nr3vb0IbytcRFUfp8k+A/XJ0ugLaMkmcvrZjTxNmQdHxqmHQJRCLMy4f9gc/np9JUJClUnGMeE28j0aStun20iEBzk4+x4n+DLukUp8Aj0JJ+Rit/6f6nBA6BN0FlPD7Rtl435ZcJsGfUtQxhYQU9fF7OOFNFwu5b+eoTiwuBIURdxw0WU8VMr/Et91iB3OhFpH+5MzvZ2PIQNzWte/ZAvRAsyAKI6ngrTqHfku1RfxzS5jiBmhUgD6RPxaDDcHHD+gmp92+vbyMqePms1LUfZV/ylxhFqMB472PclIHfhljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvYRzyODOAZBVzhtd5gsDvMERNy1XWvNqPwJaW0Dh2M=;
 b=j99m1gSNsy/NGPOP6N31YCW24KAk+hYIkTm61AaQ1tbtI2ErLEpYdtXz4pf2Uhx4U/S6xGkiV4dOIjemrTztSqX3Vwpyu8aN8tcSK1UBYCkIyGv4EuoskrwIT5D7KSCfbaUBp61YNEnA3jd2CFUqv2KG4kAgRWsAS7mxAs1vFJSGj60h9DPCDnhfXbW1LZJCQYeLmWXh0Pl6FOnpCZFQbn18wu9RqiYX4MIo3g6wiEROTClg5ttlmFwLYKKK0/Te8jOnOEiBEA4Nuj1sEsIAfOYIrEIwEXhAdslbXEt+hySILem75YycumGtQgnaAeCJDqGGJei4zU4s/zdXRC6gtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvYRzyODOAZBVzhtd5gsDvMERNy1XWvNqPwJaW0Dh2M=;
 b=IsLkbhh5NfHvk/pHqP5G7os3D73XTQogzgsQzN1qWKmbu57Ud4gIDXnwNA4P7u7YSkalEtOpmwHvPE4r2eUou1FLkBil4y081mwNey5zEdSX+ueUYuz7mneHTDDaQ/4WFyxpx7P4LqGezWOr/Xg9slxDVr57duYlhqVJcg2NBZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <da3020e0-cfa8-425c-95a4-1dfe8394000a@citrix.com>
Date: Mon, 11 May 2026 14:41:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] symbols: explicitly specify source file name for symtab
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a62ed0-24d4-428f-ffd1-08deaf6304af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YdU/FDotC6JIgfh5Rhl7IKMHQPgES6ZkQrXFx6Ut60Nv8paKNg/7c2ALlAbqx8+nnoE5jy9kR/A1hd33I/W1Ij6DmZTFQ2XQ8FSwroOf62QdI7X2mRluwgiWsD47MFcICbA6jy3jyXmgyD3xIxunJbZ3fmdCZ/ylXUT9iU1GsZkZmHP0cMtyAVQNTMM5LgnAczkf8JMwAt4J+hrYcGBa2mzQIWUY68FhRWa/rLtArQZJI3dluLJPqeqDJ/F9l+/waHWCVl7Wlw/oM9I5482YpuaSe2JDxpXXqltBBcuPXrHWpRIzzaoH32MY4zfN+3Mn8xA3St5EHf9daPiYIklRpfyGNP03a9v/KRU5cAyeHblGKHwQHtOkfDGOHmN5yTlwQqejE/O0aseVHMsX8iq6ha0cKVBSgPYC/V2e5I7ZFbo1/BwurvClpd4H3FMcw5/CWdptBr3WEi0uJfKQOBaGfBpqnaN8Qoz/hpurUxcMK3qLsf5ZuBybqj6Eu8jgBpmTuCNTVceBR3UMHQRYbwg2pYDOS3RjSICv8qYnXwEtBihHri5v1Cf6kBjNie8asCrRoGMs05UKI9hI/25yIGdaDmqmbWUE8UhnPOvHtr6gQ1s8tlqbo5h7YYHLM0eVKhB7Y6FiowxvC6W+LKanHTLJ/WMGaQwSGwFnjrOC0YWQWQIVJgYL3G1Jyx+EbdEThLNo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2R4WUdaYmp4VGYybG1yazU1MWNHVnFZK0JuM2tuam9LdVBqdFduWlIrL2w3?=
 =?utf-8?B?bHJGc25UMUVxdWl5SWtzVkdDZjg0ek1ya2J5SFV1aXJFdkdYS0lMUTRTSjlk?=
 =?utf-8?B?L3YzNysydGZJQnJTcmRaMUJ6L0dVQzAyYWlnZzNrVVZuK2g4Q3BWUDcwazkw?=
 =?utf-8?B?a0FXVVY4RmFEUnA1NkhWSUpDQmhLUmdncDY2Tnp4SFRma3hCdVM1WHlIOHlW?=
 =?utf-8?B?YXNBRHFlcFluQ2ozek9sKzhCTm1MSStRTHFRSUIyb0xEUW1idjkwTjhPdkxB?=
 =?utf-8?B?a3hSVEEzcmRhSDhRZXdaYUZhRGNSU2pKMkE1YW9YQ2NqaWI0YzB2QVh4RGUz?=
 =?utf-8?B?UGlzRTNSV1NmTlVIeWJRdjZsQ1pOWkovQlNyT1AzbUpUc1MvS3k2WlRmcy9r?=
 =?utf-8?B?SitnYWh0NXNscEpWcEsxdzJRS1VOazdIaUJlUlJ2Y3RRRjJhbDFsQ1VCV3dx?=
 =?utf-8?B?bHlXQUE4RUxRSlY0SlR1YlR4UnpzWWhWU3FOZW82dUt3VnRKQ0RGNWFJNVhB?=
 =?utf-8?B?TFc5WW0xc3FCeXBSc01KNGo2Z0JqcnhCRDhEaTZsZEpmMVZtbFUxaG9qMU92?=
 =?utf-8?B?WERwYnArb3dQRUJDT3o2dlJxVG9CM3gwWlpwWnZ3cVZmUzJhUkNqc3dJZHN4?=
 =?utf-8?B?S2NSampRN2dMMncyS2pKV29wWVNvbVZrTTllczNyTFkveTd1NE5aSHFYUkVE?=
 =?utf-8?B?SFNjam9ud0xXZUtYNmQ3dnZWYXpzdjVZQjBOb2JIWWx6WDJnOVNjTlljUFF5?=
 =?utf-8?B?UkN1d2ZJT3VObnVZbHFLR01id3UrS3VJRkRFTVU2dHV2U2hiYnB6QngyeXhY?=
 =?utf-8?B?RzQra0dxNGpOT2FaeFlSUldONGQzQS9WaHFTMVNYSWR6eldXVENPbjZWcENL?=
 =?utf-8?B?dDgxME9JTkt3OXk1akFxNzVna25iQWlKY0I2Mm9sT2JUM0RVUlVaTkEwVzNI?=
 =?utf-8?B?SVJNNm9PeURaT04vaml5MXdhdGc2VDM1Mmg1Q3pBZ2crcE1BeE0weVM0TUVT?=
 =?utf-8?B?S21PeDVLaDlITEk2MEw0UTlLVnpXU0syZ2lNSGxTU3NqRTljZHB2bDArVzFo?=
 =?utf-8?B?dUovQUhpWDNJL0ZKMGlFeXR1WDdsRHFqazRXOE9Ub1J4TlhEcERGblZMSXhZ?=
 =?utf-8?B?WHNhbHY5VzhGZFRHdzNGNlRTVEVMNjBrZWdYSnE4ZVB3RmltNlo3dkVkek4y?=
 =?utf-8?B?eU9vUWxjU3Rqc3BHdnFEbmRsOGhhSmpHOHJBc0xhWTF0blVUTDhqSnd5VUNE?=
 =?utf-8?B?NnJ1cXB4ODVQU3hKdkVDS25pZlhiVEJMS2xhME4yck04QkdMVlhEWHJ4OWdk?=
 =?utf-8?B?dDJDL2xnN004aEpLUkcrek5ka0trV3FLeHN5ZzFCc0NUdGRaZ3Bkd01qM2Q5?=
 =?utf-8?B?Wkg1TmpkbTNKNlE3SXlzVEJnZVZraGlzaE5vVlhPb3VmRnpBMGorUFR5a0Fo?=
 =?utf-8?B?bktpU3dzR0I1NFo0S3Vxais5bGFSS3ZERTFSNnBRbXpqRGl6T2NXUTlOYXlI?=
 =?utf-8?B?NXZ4WkVWLzY2YnoyOW9SL3VsVytIanUvSDdNZFRidEpXenBEVmh4TXZmL2lD?=
 =?utf-8?B?ZzE2SEVjRDB6VmY0R2lhenY1QVpOUzRZOHNmb1k1Q2gvcVo0YnRUSlhxTGgw?=
 =?utf-8?B?TGozVnRlL0RCSWZXTXU4U0hsdXh1K0J0eENUcGlsUVJBQmxDM05WNHl4UDlZ?=
 =?utf-8?B?NUhIeEJHSUxPbXNLbGlGRk8rOWlna3JzNzZuSW9TTVZCTGJtQVEvbGZQbVg5?=
 =?utf-8?B?YVRGazNSUjhIMysybzh3VHVTVnZweU5rNDZwQXNpWWZtUXhBSnhFazkwL2c2?=
 =?utf-8?B?Nk1ReVdlcTREaFZldEVJOHdrejUyVVB1VDNOQXBFdDlTaldvYUF5aS9ncDAz?=
 =?utf-8?B?MDF4dldpY0ZtQ2NzQ0dJQkgzTGtBaitITG15MTQwN2docmdDUUI1cjkyb0x2?=
 =?utf-8?B?MUxaSGFCKzFiZGdNaDdIN3htNWpFbndxNjRXM3hKcFpwRTk2WUJUenplZFpF?=
 =?utf-8?B?WnZXWjlITTlSazRJV0JOWk9JNlFRQy9lcXpsc2RxNk5zMGRvdU1UY2dHUWY2?=
 =?utf-8?B?RHFWbjVRWHVIcnZuQ3dpbVNRT2RTVllpa1p2c1FQUnZ2ajBacElpd3pnZnZn?=
 =?utf-8?B?Yjk4WU1DbXhPVXJnS3N0YkZGb0ZrNkdFQjc0a0ZwT1p4T1dMZ2JmNUViVHJU?=
 =?utf-8?B?dW5WN2ZwM25ENG9ZWmd0azlIY2xhc0NNdk10UytUd3ZiZ1pEZ1ZmSHVBV2V3?=
 =?utf-8?B?Q1crMmRBMkhsNVI2MStYczJnbk9UV1dTY2lzRm1xZDJDamtsbDVDNGdteDdz?=
 =?utf-8?B?WWxsTm95OWI5emdtZGxRV2t5Q1NsVDRsemQrTWZnU3hJN3Q0TFVQeGJqSzFR?=
 =?utf-8?Q?Y9NijKjlb1Wid9zY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a62ed0-24d4-428f-ffd1-08deaf6304af
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:41:35.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Apqum5fLgWuQzyuj0b++d7J4VFbnplHIcFc144tp1Id8V3fAemlc0BTtl+uD2wMAXgDhtHWs+v7GZz0r+/hLyst3hGegbFsdoAky6vntw7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5441
X-purgate-ID: tlsNG-bad1c0/1778506900-40B60A53-19EC44AF/10/73395122804
X-purgate-type: spam
X-purgate-size: 3672
X-Rspamd-Queue-Id: 81F9C50F266
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11/05/2026 11:00 am, Jan Beulich wrote:
> If there are any local symbols in an object file, GNU ld will create an
> STT_FILE symbol derived from the object file name if there is none in the
> incoming symbol table. The object file name, however, varies between
> linking passes. As a result, symbol name compression can yield different
> results if any of those local symbols need retaining (Arm [and RISC-V]
> mapping symbols are omitted, for example). If that difference in
> compression would yield a difference in the sizes of symbol_names[] or
> symbols_token_table[], the compare-symbol-tables sanity check will fail.
>
> Fixes: d37d63d4b548 ("symbols: prefix static symbols with their source file names")
> Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The observed problem was with a stub generated as Arm64 erratum 843419
> workaround. Such stubs' symbols (imo wrongly) are associated with the last
> input object, rather than the input object they belong to. Also for other
> kinds of stubs, afaict. See
> https://sourceware.org/bugzilla/show_bug.cgi?id=34140.
>
> As per the above, having a Fixes: tag here is questionable.
>
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -200,7 +200,8 @@ $(TARGET).efi: $(objtree)/prelink.o $(no
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
>  endif
> -	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0s.S
> +	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
> +		> $(dot-target).0s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).0s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
> @@ -210,6 +211,7 @@ endif
>  		> $(dot-target).1r.S
>  	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +                  --source-name=$(@F).S \
>  		> $(dot-target).1s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
> @@ -220,6 +222,7 @@ endif
>  		> $(dot-target).2r.S
>  	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +                  --source-name=$(@F).S \
>  		> $(dot-target).2s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
>  	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -66,6 +66,7 @@ int token_profit[0x10000];
>  unsigned char best_table[256][2];
>  unsigned char best_table_len[256];
>  
> +static const char *srcname = "xen-syms.S";
>  
>  static void usage(void)
>  {
> @@ -356,6 +357,7 @@ static void write_src(void)
>  	printf("#define ALGN 4\n");
>  	printf("#endif\n");
>  
> +	printf("\t.file \"%s\"\n", srcname);
>  	printf("\t.section .rodata, \"a\"\n");
>  
>  	printf("#ifndef SYMBOLS_ORIGIN\n");
> @@ -679,6 +681,8 @@ int main(int argc, char **argv)
>  				unsorted = true;
>  			else if (strcmp(argv[i], "--sort-by-name") == 0)
>  				sort_by_name = 1;
> +			else if (strncmp(argv[i], "--source-name=", 14) == 0)
> +				srcname = argv[i] + 14;
>  			else if (strcmp(argv[i], "--warn-dup") == 0)
>  				warn_dup = true;
>  			else if (strcmp(argv[i], "--error-dup") == 0)

Why does x86 need to plumb the source name in, but the other
architectures don't?

xen-syms.S suffices for both x86 builds AFAICT, so can't it just be
unconditional?

~Andrew

