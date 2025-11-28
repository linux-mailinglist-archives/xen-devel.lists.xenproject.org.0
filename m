Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B3C91BBD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 11:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174722.1499671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOw8A-0002MK-1T; Fri, 28 Nov 2025 10:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174722.1499671; Fri, 28 Nov 2025 10:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOw89-0002J1-T4; Fri, 28 Nov 2025 10:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1174722;
 Fri, 28 Nov 2025 10:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOw87-0002IX-Kd
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 10:55:11 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b47a576e-cc48-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 11:55:09 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB8424.eurprd03.prod.outlook.com (2603:10a6:10:39b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 10:55:05 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 10:55:05 +0000
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
X-Inumbo-ID: b47a576e-cc48-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jItfuZ/xaS7Og0/EEoDGGQS7wtuGxt4f57rBd4MBLWKijEkGoJABBfFm6AFon9kd5wqaMaupMTZbk3LqEsL78IwjOn0bV/qD8/inmI0BfyhIytug7Z8jdIDTUSqT8kqPXLIbaFF5hn0e7LXQjNAR09ZoksEJipJTGIKu1Y1HIcJLTmq9kvZpT7ch5pLV2LwwhUul/aaCLk8pN5Q1o0eoIzIRGQro49Mg1gzcbungnWijamug1YBIyfeYNascgto782LuhK3jfC4oIrwq1HWnhAbpdN6TrHz77X3N9mYVW1+1h6Bk/NUrM+yMCTxVGUGzEhY4DsY75DoV5P6Y/roC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugUuk/wTPzQsWK6I5v+nndFJwQI3kwbGhToTMsjT3x8=;
 b=JLTuJ4DJ4YheGY7VWrmmwBMS3sdB2YS9NfMNBnVB7Dz81L4eCrvtvcJvNI1iCXRvH/OBwbKWLNeoHC1ry3tsnnH/mUjxThgzhFPpOd3ltGM3wuDw2F1RvVjnWvrxq2Sx8k6A2IXVy9LhvAmLgyNf6j6E1zyYks0Kq3JFKFiRaaFJ1Lhj69e95NW8ZdAngujsC19zbjrKpKDufh0AoHmSzVpSn/+t52T39/SxXwL6Jls+lwfdJd9BVCiIP/+UoMAh0rAscj45lwHOeJXx7BAzByBvy8M/JDmslP9ocL4PA/2A0B2UFJn3HhRu31W1fdtFQXSg1mblZD/Mw2z1mVdZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugUuk/wTPzQsWK6I5v+nndFJwQI3kwbGhToTMsjT3x8=;
 b=d/DynRnTByOm1fPJK98t3zLd9LaS6scDf5WlyAvz9yj6vXqvW3PzcuCePebmAQ23f7jnWzG1jSLXTXZXBJGi5zkhGiWb2aL/pIilu5QDXLGNskJMAyLQF+bIQdpB/GmQhh+fKRksKgtlz5LRb7I52pyDpG/s4ciooabM8Ri1bpS7iuqQsmlsyLvMgScBnSX1VpAQ038X+3FUsikkcLQyn353fto6rELfYQzXtjrJA9v/8gVM8LPbZCPbn83p+yIfEs+AuMRmZorycPFo+/AbLC3vR9Zfs/dQYrhVZ3M8IKvneiojtlSWZt8mPnDrOqxffa7yUFrmJNjtth32xiFRVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <cf047bc3-dc78-453f-87f5-dd468d0a385c@epam.com>
Date: Fri, 28 Nov 2025 12:55:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
 <802d2971-4cc0-46c1-bc24-4ec15c712118@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <802d2971-4cc0-46c1-bc24-4ec15c712118@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB9PR03MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a4fb64-f1b1-46e5-2fd5-08de2e6c96db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkJYN3JxenpvbEJkdHZaY0NXSS91bmNTVHJjSGFHREtqMHBhSi9DS1R0cnhr?=
 =?utf-8?B?MUhrRlMyNTYyRmxYTjJmcjF0aUZlSVdlYkR0UGFoVmhwU1dQZmhjSVZWai9t?=
 =?utf-8?B?eGpWWitsSnVqYVUzeW03MFJyRXJuendqd2NyM2hPVzBDZUZFMVVhb0Y1QjV6?=
 =?utf-8?B?TVpnZFJ3RFlYT1V2dmEzRmU4OW9rQm4zNFI1Y0EzTjNrLytOVjNobXZYTmNt?=
 =?utf-8?B?YUFrZEhVVFBzVVRSdUYzdzQzQ21EM2V5VFBHRjJPWW5pamhObm5ETk1mWm9p?=
 =?utf-8?B?aGpEOEoxZnNKT2todzhWWDZ2UWtHeG5WMVd5R0ozWldXTVo5SzZzWnhHcnJ5?=
 =?utf-8?B?VENmdDM5Ri9Gc0dNcVY4QlZtN25vWExteWE1MndGUEJuUmlPaTZrVnNWczl4?=
 =?utf-8?B?eTVMZThtQnVvaGx4YTFoVys5NzhTdms5YnF1bGttdnZ4SFJ5bGtNaEhsU1dW?=
 =?utf-8?B?dlU2TkJLUHVYRnJpSCtna0RzMnBsYXhpWXJaK2gxM0oxc0lZbEQzKzZ2ZmY2?=
 =?utf-8?B?UzEzRUJ3WmVXRUJUbkR4NWt3Y2wrOUdHbVhSZEVCR2l2c1d3WFJTYTJHVzZ0?=
 =?utf-8?B?M3FZV2tLVmdSWS9LLzBnMnBuWStDbVNkMG01Y1B2R1c2amVKWU01MThTWGRR?=
 =?utf-8?B?b3N4emdQa3ducW9HOWxCb2VjMlVrOS9rZVFqckF4TjlIS0wvUk5YUEJod1Nx?=
 =?utf-8?B?YThOM0xpNDFQSXZpcEE4bjYrNHR6aXpsREcvSnJweG9JZjBwdUx4elRpVVkv?=
 =?utf-8?B?STYwemZqSjFGQVZpL0IrS2o1MHZ1aS9obTZHSXVhanp4QjFZT2dVbzJMK2pz?=
 =?utf-8?B?akp3VEJNS1UzVGJ5OFRyamFHbnpiOGl6ZG81RVRGbE5INEk2Nlg4dDdhcDZj?=
 =?utf-8?B?UGR0dG5MOTEreFJ4SWcvTC9TN1h5QUdPRlI4dlpBQnE0WFdpaFVxOFVKZXFa?=
 =?utf-8?B?M1FTbGRlTlRqWDNzRFZac29aSW5uLzJJOVBpUUhNcEJiZWcwWkFEdVBHNkpW?=
 =?utf-8?B?V1RQMVJ2b3pvQVo4RTg4TlBib0piVENSRm9uQ2xkcVVOa1BsNmx6Z3lxKzhh?=
 =?utf-8?B?dFBlUnBZNnMrc3g3emVZWTgzYjhzR1JDN0RqQ0NOV0Q5Q0cxN3VXb1FPTFdF?=
 =?utf-8?B?SlYwaVJDSWI2NnN1dDVCdDkwVjVZZW9udmlzM3ZseTFNZ1BLT2VWNm40MVJv?=
 =?utf-8?B?aThaTUs2RVJRaXU4eTAxdTJ4c3Yvc0xJdElHNWpaSkhWaVlaQ1NWZzlNblJw?=
 =?utf-8?B?azF2Z0FGN0ZzU29OS3c4SG1oZmJPVURhZ2w4T0I5d2hDZWgxU0dlRG5LK3JN?=
 =?utf-8?B?UVloZE1zSVpRZVlMczBFU2JsVlU0Q1dHRnl2M3dmdWJWSnFETGRNOWtxWlpC?=
 =?utf-8?B?RDdGR2ZuQjlZUVU3THZiYW90NGRzSjJub3dsVjlRRlhvb21OdDR2ZjlwNTdS?=
 =?utf-8?B?RTZ0ZmptNDJzYiswWFVyc0tzVjM2MmhNYzUrd0RqcWs5YlNBQ2pyVUFMN1Ba?=
 =?utf-8?B?WUFiMGZsbFpTclYxZ0JVRmh5eSs3QTROUUZpcXVhUEtCS3UwcVNFZS9Tanhj?=
 =?utf-8?B?U2tLaEtaUjZIUTEyMzBMdzEycW1hdHpvYmx2T29LR1lYUGE4aXJ1ZHZnblpG?=
 =?utf-8?B?UEpJY0FQUkRGVFRIdWRxbjI5REVZR2Fjemkxd09GWnpIZjB0bmNjVGdqMnFP?=
 =?utf-8?B?NE5QbmgyNDhGbFNUYTVwNXl5Z0gvOGlTVjM4V3NyZ202amdXNTlocXhWTENz?=
 =?utf-8?B?dTdhUXdWSkZSY1BrZ3RjRHJjT3I0dklSeXdZOU5Fc280ck54Wlc5QXFvWkVG?=
 =?utf-8?B?WU5HRzFpVjVDUVY5dW9nVHlDbk50YzJKdTN0QzJCeXNxT2ozMUVkMGRHQ3FW?=
 =?utf-8?B?enlCRzJET1lQaGp1VDFMVVlkUW9FQVVVTHBKUVM0R2xuUlRkeGVoUlhkNFFa?=
 =?utf-8?Q?TKBvCbZYuS1aP+IZxRUpLTZy2LX6r23Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejN3bThEd3EySDFVNTdDT3BWVWdHUHNYZGJxQjI1U3ltN0V2VW9MSE5HRFF5?=
 =?utf-8?B?Uk5GT1d3TWlnZVJvbndXMmFpcmYwNTVqcjgwMjE0Wjkvb2dnSUZkYzAwM0Q0?=
 =?utf-8?B?YnJJRjYrdTJFNDVEWUlvd0F2RTBneC9SUVE0bms5STAzZ0JrS3dEMXN2N0lX?=
 =?utf-8?B?L2NzODBvK3o2akxFZ1JtMjNSdmJZcWFzYVVSUU5iMDVQd2Vsdm9kYVdOblFu?=
 =?utf-8?B?SUFVaXNZc3psMmtWOVoyWS9zMTRUZUZiMkF4WDFwc2pJQldXL0NGK1pVRkkr?=
 =?utf-8?B?UmYzZi90eVFsSXZpKzlVQXg1TUU1THQ4b0hLRXVVME9ZT05sTXBwODdmQzBy?=
 =?utf-8?B?Z3ZHeHM5bFNhdi8xaE1PaW55NW00aGFuemNVSEUvL1RzWVBKM2JtY2xYTzBG?=
 =?utf-8?B?aGhpeGhuV2NoRW5aeHM0Z21udHYrYlNJK0lyZ0VVNlRrNkgrcXJnRXpCZk9O?=
 =?utf-8?B?YjVBSTY2RndpVnlxUHhVcThZTmVNNFJ1aXArR09WcTd2NHNtS1ExLzdoRmtS?=
 =?utf-8?B?dTlVbVZYaUJCYVRvQzRody9xT3hVN01iQ01hTXd2Z0VqSzlVYzdZQmdqZVNt?=
 =?utf-8?B?TVNZcFJCQkp5TnppeG1TYkFUZU1NcGQ0aS9FV1YvcGJQTjZPOWZZTlBac2hZ?=
 =?utf-8?B?LzFJYU4zczNOdVVGdG9EMEJFYUR1S1YvTE9BbCsxanNEWEI5N3NUMU9GTW93?=
 =?utf-8?B?SGNvQjA5b2hMY2hXZmxxSlIvOWJnUk81YWh2S0kvV0xXM2lGMU9qenpVMm1R?=
 =?utf-8?B?VlptdlNnZVZPUE1kTGowcnBqaCthblZvOFVJdjhyYnlsVHREMFQxUEZiMG9Y?=
 =?utf-8?B?K3ZHK3k4dlhtbDkzWjF6cFNXTklwTjVLT3lzVEVIaEwxNk1rckpzWUg2NmJz?=
 =?utf-8?B?UnpKalFtZE9ycVN3VkJYNjNwMWN1V0Vha1BDWXNBQXdkbWo3RVdoMlJ1SmRo?=
 =?utf-8?B?NXpTVUFmNDg3U2RJMkkwamtPaFoyV3QrVVYrWSs4UStPUVFoMUVUUVUyZFZs?=
 =?utf-8?B?NzhuU2RLbGcwei9QNllhdHY1WTM2cTFHR0NVR2pyK3IraXNFandxMFgzaFZh?=
 =?utf-8?B?RkZ4SklQZTg5am5kazhES1dCODdIZzNXV3J1bFVrL0I5a3lFNkQ4clZ0RENG?=
 =?utf-8?B?VjN6aEoyZ2gyUER0cTFFL2dpcDQyZll1cEpzSE1PVG1nYUlLY1BFQXlkMEFQ?=
 =?utf-8?B?L1NzWWtiMXlmMERWOGRuQW91NWt2endXemZFZjg3MUNPK1NvbXhYa2MzSEx5?=
 =?utf-8?B?L1VtL2o2dFBTRFljUjBPVDFhTnlmQXYxZXkxYnRLci9CSzRwSHBJSytBUWll?=
 =?utf-8?B?WHExVGZEQzVSbkhuMklqQXNkWkRGS2lHbTAwQ1BKT3FMT25JTEx5dWpEaVpq?=
 =?utf-8?B?TlhsQjVpZi9Kc1d2WnJxck9nY1RFWDdpRGZ3dERDeFdxYTBnRStPZlpQakpk?=
 =?utf-8?B?ZFREa1lJQU9LMnZ2cWd5Smc0dEx4bDMzaUlSUVVhTTQ0cnFsV045MHlPRXR4?=
 =?utf-8?B?Wk5OYlBqL25xcnN3ZXl3VEV1S0pGcFl3MVFyd3YxRkdMNjIvQVVUT3Y5aGcr?=
 =?utf-8?B?bWxSWldKZExVQjNsWUFxU0RLbENsbU5HaFNzejhxMDlsWUNpcUhUaG9oWnBa?=
 =?utf-8?B?cENUR2tkblNJRWt2a0VYZEg4THVva3JYaHRSVG5ncmoxYlVObUc0bEZwVURo?=
 =?utf-8?B?Z2ttZjJEaDBPMjE5d241c0lOWTFNWVl4dkZrc0l6TmdON0pJM3N3K3Bydk16?=
 =?utf-8?B?djF2Mk40elIraVNoemxJRG5Qd29IcFJ4MmZ5Mkx4L2Z4dW5GRk1udmF6UnZi?=
 =?utf-8?B?LzZFUmkzZnlIUCtVa2sraEdyaUxEN0szSXhqMHdCN1J2eG5HN0V1UUNUYVlw?=
 =?utf-8?B?NG5saHQ0SXkwNjFwQWxsaGZWSmwrYlRHaEFVaEJDK2ZHd2YvazIyaDZNdjdo?=
 =?utf-8?B?aFprTVhzeVQ1QnpaanFBcFhlRVpHSDJlRVA1dGkwS0xWZk9sbDM4Sjd1RmVN?=
 =?utf-8?B?UWpuVVU2Ymd4S092TzIzVTlJL3NlcEJyNjBJUVZXVFV6eWtIOS9qQjYyWmta?=
 =?utf-8?B?bVU0ZFAvNThzTG5Wc21JK3ZoQU9qSmhNMGJuMTlDMjhXL3QzV2dSMnNGSE1V?=
 =?utf-8?B?eWV1dTVUcHlQT2EzTEdHZC81dUZZMHN5WVoxVE45ZktpLzJ5N2xzUFUzS0RT?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a4fb64-f1b1-46e5-2fd5-08de2e6c96db
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:55:05.6402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oy7vLzTQqDnztVGQAgSGDYvFsOWXjfQ4krtyP53rt11SJi5xxbalosfsWI6udZhc3+BHvg01AUt/PTrKuo8GC2UzFDsqqKnptY0mzYlT+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8424



On 28.11.25 00:24, Andrew Cooper wrote:
> On 27/11/2025 10:12 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> 1) arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
>> 2) add generic domain_clamp_alloc_bitsize() macro and clean up !x86 arches
>> 3) move d->arch.physaddr_bitsize field handling to pv32 code
>>
>> changes in v2:
>> - split on 3 patches
>> - move physaddr_bitsize in struct pv_domain
>> - make minimal style adjustments as requested
>>
>> Grygorii Strashko (3):
>>    arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
>>    xen/mm: add generic domain_clamp_alloc_bitsize() macro
> 
> These two should be merged.  You also need to CC the ARM/PPC/RISC-V
> maintainers.

Omg. missed to drop supress-cc=all :( will resend with patch 3 updated.

-- 
Best regards,
-grygorii


