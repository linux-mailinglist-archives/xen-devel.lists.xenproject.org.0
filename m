Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B629CAE07B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 19:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181101.1504203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgND-00057i-Rq; Mon, 08 Dec 2025 18:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181101.1504203; Mon, 08 Dec 2025 18:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgND-00055O-Ow; Mon, 08 Dec 2025 18:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1181101;
 Mon, 08 Dec 2025 18:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKnm=6O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSgNC-00055I-04
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 18:54:14 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b5ced8-d467-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 19:54:11 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by VI0PR03MB10282.eurprd03.prod.outlook.com (2603:10a6:800:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Mon, 8 Dec
 2025 18:54:09 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 18:54:09 +0000
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
X-Inumbo-ID: 48b5ced8-d467-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgx0YVnvi5mBfxs4/zgYafjNUZmg/vdNrGrll/8X3eUspNgTuOilzKtn4XFD+rS9S6VOLNghmaZzLBhUZkhWJF/ldtQZZKjuHCYEA43BPfTgGlW1o+PVCgPwGejGP5FXjAEJfXc6sb6xk8WLl8kV4LvmMOU/1eAio53bQaSbk/0Rc5rBZgyrSCuz/14pRGHIIHPbNs4chTkzKC2DbI1W12K2i0jmCvTGXLDXffYg893NTjjljlyfOl8fqpPKH3NjHyQM8IqHcfVfCTHgy3J+lqP5+l+e/JZGaFUC+KebT9i4GWjU+J6lp0oKHn8+udHIerUnbaSTQqWhHQLJPH4NyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSICRRDqnpMRDRNL1T+UmHwGkBlgOBZJSJ0Sca27Tmg=;
 b=EXhtNdp9oD2soFCfIdL5mwUCBKbEg36+KCURU0vTXx6LsNE3SEhixx+Hf/NtTcxsbXThUyW642FPdmvvZbdz1otQ5/LLz1XhmEvESnkUMj2IFrZxTqVuAgyfaNTYlOe6hByRn6j+Dz75ZX8oRPheM71gfFZXRYBdyBwEDEgbQLazNd5XFWV3oAy7a5SawEEx6kpQ5Yz7amXzjqgCyImRIKfJhxAQ/bxXzPOJp0NaZTTkqRoudST17U2FofTMD2R2Bu77ekEdzc1/dezwXePKHYkU3R5cFsRsjksxuVDkQgocmUI8nOC0oZqqrZbHsnUgMEKgNSn6QsLatDWYwUwj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSICRRDqnpMRDRNL1T+UmHwGkBlgOBZJSJ0Sca27Tmg=;
 b=G0psR1Gq7544PzItaniq9KX34PB2GhBTXpbWfcDCqDfsK1tbK8T/AhQl7Bwb1yoLSnmpaxf39gAeeAJ3qKakyoD64K1V5jZeL8uQ8YbYxqvil+w0Ci1eTBoFTQMXG3Habajf/Z24xJdjl6zcCgkF2D7QPGs8spCbtZ1wojNWr+om3c0jIvuxAZFvEqx3JBrBFfIZe+I6ls8sW1dX36Eq9BcwXX5lZpDL62i+A8zjABMAa9ymoEgcr9AXwvrb1PRIOCxbFSTKmcFRVmRvjJNUkaWbgXnY5fqOxZXprLShBa5nOgpkTVQXunpnKrlHexgXHpnlakf05ntzQIu6w5/J8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7020e1fe-5f11-480b-bd72-311a93903030@epam.com>
Date: Mon, 8 Dec 2025 20:54:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <bd53bc18-f2b5-4857-b06c-2674c799ff0f@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <bd53bc18-f2b5-4857-b06c-2674c799ff0f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|VI0PR03MB10282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc7c2c1-a2cc-4180-699c-08de368b2b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVQ3RHVENFdUa1RjN0I4blNySHVIU2hmaG9BK2JjSW02WTc0U29qNmZpWFdj?=
 =?utf-8?B?OElUMUlla0M4SkRsMGhjMEYvZlFiZmNWUVZHVkVEQ3o5TFgyVW8rNm40NTk5?=
 =?utf-8?B?RTIvSWQ3REhjVEFvR1FKZUF5MkhIQVNEQmpFdm5VSjFpR0x1ZE5XQ2hKcEZJ?=
 =?utf-8?B?REs5UGNMUVJwUXV0c0svaGRmNFpxZERVN1k1a0VBVFJyVDNrcy82YnloMzQx?=
 =?utf-8?B?VzBqL3VQVllUY0h2aXN2ZzhLam1HazNHaGlJUXVOU0J4ck55b0JZZS9GcTNk?=
 =?utf-8?B?cHNIZ05TMGEzUHRaeFZJRFV1cUhjaDNLMldWWE1BMlNhSEdQRGtRNVhjNytx?=
 =?utf-8?B?V1F4MStHKzJPNjNxVngvUkh2N2tXeUFFdm1nMTRBU3pTQk16K3FqQ04vVzQ0?=
 =?utf-8?B?aGd4N2ptWVg0UWpSbUtNNzMzTVp3Z1VGV2Q4NkZFZUdvc2JpL0Q4ek91VFcr?=
 =?utf-8?B?TWFjUHcza21ySFBLd013ZXIxRHVZK0NZVDZnMU1JYTk3YWpLUHd5TU5FQmZB?=
 =?utf-8?B?Q3BEMXhmVVpnamNSOXh6d3dGQW91V1RJYnduaTJTQUNZSGRRNUhEY1Ewd2lI?=
 =?utf-8?B?YWgvL1hjdk42TjJkS3lKTXdvRHpsUVlTcldkQ2dvSnJBNnMxNlJDZnp1c011?=
 =?utf-8?B?OFFyMElyazA1Q3crNFRXUE5yTmZTZndhL3VqMmxZTDdPdWJ1K0llUlV0d3Jx?=
 =?utf-8?B?aDZkM0Rablo4SDJrNjEwS0plcHp4dGJxeThuUFVXNzZsRFg3Nlo3UC9VUFN0?=
 =?utf-8?B?WXg4c2w0VXJjK2NoazR6MUZJMG5NVnVGSHlhU09wcFdLcUNwT0tMdzZFQjRR?=
 =?utf-8?B?YXoyZ3hOTUZjSnVUNUhXYUNSSzJOdzRpSUxKRDBVcUs4bjBSZnlqUjYxV01L?=
 =?utf-8?B?OEM1Q2plYmVmV0tuQVUxcVdtR2ZpYWNJUzRZbFdndWNjeFQzMFcwcmxGRWtQ?=
 =?utf-8?B?cTgycGRlbEdvbDE3SUd0VHVKeGtyMVpIRXVxY04ybEVmNkV6MU0yRnIyNWRt?=
 =?utf-8?B?aGRuT0hOZ1FScjlVOGVFV2UvWW5qeWcwR3YxV3NPR0FyNE40R2pFVU9zNXdW?=
 =?utf-8?B?L0pJY0xGM1pIbGo1ZUtteVN4cFpFcHZxcVVOYml3aWc4eExUYmlxQUMxdGdT?=
 =?utf-8?B?S0o1S0t0VHdRMjFSWGpmclBmVTdoK0FVaEg1VHlsZ1JodHBqUnIvdnp6UFFC?=
 =?utf-8?B?aGxpZXQ3ZFlHWk53b20rRDRDdjA0c0NhU3hiM3haUzFFQ094QzFDRDR3UTRB?=
 =?utf-8?B?VUx5bnI2TmdVUW5saXpUcjBwcnYvUUxXSENSVzBCSklHMUp2M2JySnA1MWNt?=
 =?utf-8?B?VTNwcmNWK3prU05Nc0R2aDF1TGRhalQwbFN3VGNQQzlaZFk2YXJmSFhGZ21o?=
 =?utf-8?B?NTdmSzdzMW9WMGZMMHl2bHVsUEs5dGtFS1ZybXVoQ2svVWtKRXcvWE9zK2Rl?=
 =?utf-8?B?SW5ITElVZXFTOGRSSUphQkdtYlZBTy9ocXdyWE9IanJJNlBibEhLdGVTV29s?=
 =?utf-8?B?WW5Hc3F1OGllUENFUXU5OWFKS3VLN1dWenF4MlY2RDVBNHQrS2tQSEJRU0Nz?=
 =?utf-8?B?a2FtVmx1Rk1RdEtZWDBJR2V2K3ZtTGd4dlAvZC9aU3FjcHJBUWI5R1o4WGxD?=
 =?utf-8?B?c3RpelVOQ0k3S1lPUXZNa1ViRXBiWUJXWXplQ0VvS05HVXcxL3dETkErS3lo?=
 =?utf-8?B?Zk5STmVFL291QmpuYmxLSUtBamZXaGsyQ3VhZ216c2lSTGRYNTlNeWN5UzNP?=
 =?utf-8?B?ZWt2eEdnN082Z3FYN2kybHNBbElYVVY5aEozSUJWbFVMVWs0RTlaSXd1OXVz?=
 =?utf-8?B?OEQvKzg3VFZEajZrb2VFWEprY2xVam5scnBsOFJkQVdVdEtKSTJOVkVqalMr?=
 =?utf-8?B?RXJJWXpHbEdmd2JjRjg3VGh2WGNJeUt3NTF1L05pWUxCeThOUU5qbkZqMUdF?=
 =?utf-8?Q?F+vzFEhr/hbeeGALv+aeWM0tU6gGchRS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WENxSlBaTG9tdlBpbWNEYlNqMys4c09QQkkvbkJMb2FvZzBKSzA3VHEzRU9y?=
 =?utf-8?B?cWliVE1vOGYzZ2c5Q1R6bTI2NzJuQmkrWi9PQ2JBQURRMjE5U2dSRWJNTHlC?=
 =?utf-8?B?L3NIYkhneVFlNVMyYkg2S0ZqZFB0YWRtRXBIMHEwbFZNNmsyNStUekZsQUFX?=
 =?utf-8?B?OXBqeEYyalNMVy91bWtjc0RsWnc2bTlKaXhqZXo1TThUV1NWdjNaZkc2TTZG?=
 =?utf-8?B?MllBSndobnc2dXR5Q25xUVNFRmtmOE5tbURBSUVFVFdwSnc0NlpTdHIyVGZv?=
 =?utf-8?B?Mk14bnRWTHFoZ3lXRHFxdDJiK2tCWGhDdTdUZlNIWE5aNTd1bk90bGlRZFZH?=
 =?utf-8?B?NFVtY2VQQ2MyalFsd2N6TG1STFNFdVY4YkNmeGNlenNCVVZMcG5jdHdjSkg5?=
 =?utf-8?B?cnhSZUxGT0JSZEd1eUtzNXJMQ2JEaXRvdVdpUTRFRjVncnlCNnFtQW5LcG1u?=
 =?utf-8?B?M0xiYlplaUU3SVJBY0laTWExcTNVems0RkliclhNU29zaGpxcUFRZktTMENh?=
 =?utf-8?B?aW0vZnBEdnN2d3JuNjhKc2dDVHNoeUF6QlhZUEVnZEVTZ1p4N2lzRXFBWlpI?=
 =?utf-8?B?UVg2K1RPQzQ2bHZ1RzQxcE41VTY1VUpScUd5SFpxMlROcHJ4S3lkbFZyekVV?=
 =?utf-8?B?M3hrLzJxNThBSXd2Mk9UMHNDYjEycUVrcGpkd2RTMmh4ZS9YVEEwdnE5WVFy?=
 =?utf-8?B?MWUvdHcrTkFsU1BhcUVHSWR0ckI0V1BCTWViS2hEZ01VQ1hVc3JLT21Cb3Yy?=
 =?utf-8?B?dmo3T1NQUTJ4SDUrWmRYL0l5R0NJSXRsbEllWWhybFl3QnB3S3NGdE5UWDBX?=
 =?utf-8?B?N3kwYjF4WTFHeVhzZ0xyeklsbDgvRFZ2YXlOcVNUTjgxenl0NkNmakRveTRN?=
 =?utf-8?B?Y3RQUFB5ZmZDcXMxeXpPN1V6elJQaWd3REhtSS93WXN3aHVRMTR4QjV2Y0o5?=
 =?utf-8?B?Um1ObkQwSDVYYVpsSWI2Q1ZYLzJ4L1pkNmgzT2ZBWnp2MldqZno3ajdJcGxn?=
 =?utf-8?B?ZitBYkhJMS9UbzJMdVVpUitleHpIUkVzMHVLcGFaUCt1S2xXU3RydC8wcDdk?=
 =?utf-8?B?YTZJbmswa0psK0pTQUhTQnY5eVpkTUJxT3c1UFltcE1LRVovVnBXbUpaaWY3?=
 =?utf-8?B?OUlURU85bmVJU3ZPTVo1bi9IWHdMeUcwZDBIVXgyZ3BtcTFWK0NoeUZUVllW?=
 =?utf-8?B?RmZWK1cwUkRtdmxnQXg3djdHR0VsU3JSK2oySDczNjEzQm85a2dIRndOU1Jx?=
 =?utf-8?B?OURrd2c3QkhwbkpzOTQ1ZWxqZ2NiTXRmcG42UzI2NGN5VURMZW9wMFI3T3RU?=
 =?utf-8?B?OUpTYU9JdlorZDJybmVlVG1kNzZDSUJ4cW04RzFZUjZTRjNvWGFlZ0tCUHdD?=
 =?utf-8?B?OVZySkdqaGRQQWpQYkN4a0lwc3RjUXcwVGsreStWeWNTWmd0RlhYYlV2cFM1?=
 =?utf-8?B?Q3ZIaGVFUjlnaDdrYXFpRGYwWWl3RzhIYjBhbUFsaENaOUp1RTA3ckkrQkdh?=
 =?utf-8?B?d2kyeUpKTlJFRG1pdDIvZUJtM1dHT2dLajczVTRzZXNnYUwvZGtFeThzUEJR?=
 =?utf-8?B?dlBRa1Q5L093eFZvRlNPOEM4S1pMcjZ0bnhzdUFWYlgyVGJ5WUtWd09qYnVV?=
 =?utf-8?B?YTBFaDBLYkhkVUh0VnMxUGZpRHZLaFUvNmd2MmpCMXV0T0k1cDlNMnllNEx1?=
 =?utf-8?B?NURTVStIR0hFY0IrdVMrb3JOUzNST3Vjd25jQjZwZGZwd21NYkxBUStWZkNJ?=
 =?utf-8?B?bWxINHZQRUl2SEhZUnBEWTNaemhYODY5M2dtdmsvMllINzdDSFdVckk5MzRq?=
 =?utf-8?B?N1RTVlh4ZkVQeDd2cnRMS2tITGYwNWJhNEkxRlJldll2a3VKVDZlTnR1cVN1?=
 =?utf-8?B?YTJOT0I3c1hnMU43eWhjMTRnS3BzUXNJS2xIY2Z1V1c0Y1picWp1VXp2eS9a?=
 =?utf-8?B?RXVaTzlxRmx4Nms1MjJWZzJCeXJyclY2UWhwOWd5VExUUmpJZERoOEFZUW9Y?=
 =?utf-8?B?RVJhRjMwR0trTXA3Z2tyVWVWNG4yNnVSUktBcmhXa2tQQ2F4NmZnNnczU2U0?=
 =?utf-8?B?RlhNd29ZY2Mrd1Y5RmpsZUh4ajB4L3FNZURiaXJZV1BBMndScVR3WGxiSVNM?=
 =?utf-8?B?ZERoWERzWFRPbURPUUNQRmg5NkgwK0crUC9leFM2VFMyaEZIUDNkaGUyQUkx?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc7c2c1-a2cc-4180-699c-08de368b2b69
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 18:54:09.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp7+B7DSr0x1eSXvTi3/KIdgbe2aoK7PtC2+QJr25oIOlCn3+kdXmZ5BrD6qAl0Pu/L/WQqWJ1JkLHwwEWDFCHBDCkiRhwm+wVZXX3JKOdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10282



On 08.12.25 10:35, Jan Beulich wrote:
> On 05.12.2025 20:34, Grygorii Strashko wrote:
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -39,11 +39,23 @@ config COVERAGE
>>   	bool "Code coverage support"
>>   	depends on SYSCTL && !LIVEPATCH
>>   	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
>> +	select RELAX_INIT_CHECK
>> +	select DO_NOT_FREE_INIT_MEMORY
>>   	help
>>   	  Enable code coverage support.
>>   
>>   	  If unsure, say N here.
>>   
>> +config RELAX_INIT_CHECK
>> +    bool
>> +    help
>> +      Relax strict check for .init sections only in %.init.o files.
>> +
>> +config DO_NOT_FREE_INIT_MEMORY
>> +    bool
>> +    help
>> +      Prevent freeing of .init sections at the end of Xen boot.
>> +
>>   config CONDITION_COVERAGE
>>   	bool "Condition coverage support"
>>   	depends on COVERAGE && CC_HAS_MCDC
> 
> Please obey to the somewhat special indentation rules for Kconfig files.

ok.

> 
>> @@ -259,6 +259,7 @@ $(obj)/%.o: $(src)/%.S FORCE
>>   
>>   
>>   quiet_cmd_obj_init_o = INIT_O  $@
>> +ifneq ($(CONFIG_RELAX_INIT_CHECK),y)
>>   define cmd_obj_init_o
>>       $(OBJDUMP) -h $< | while read idx name sz rest; do \
>>           case "$$name" in \
>> @@ -271,6 +272,11 @@ define cmd_obj_init_o
>>       done || exit $$?; \
>>       $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>>   endef
>> +else
>> +define cmd_obj_init_o
>> +    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>> +endef
>> +endif
> 
> If the objcopy indeed needs suppressing altogether (as Andrew suggests), the
> unwanted redundancy here would go away anyway. Otherwise my (recurring)
> request to avoid such duplication.

Could you suggest the best way to avoid duplication, please?
if/else/endif is not working inside "Custom commands" make file commands.
May be split it on two - cmd_obj_init_check and obj_init_objcopy?

>> --- a/xen/common/libfdt/Makefile
>> +++ b/xen/common/libfdt/Makefile
>> @@ -5,7 +5,6 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>   # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
>>   ifneq ($(CONFIG_OVERLAY_DTB),y)
>>   OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>> -nocov-y += libfdt.o
>>   endif
>>   
>>   obj-y += libfdt.o
> 
> Is this sufficient? Don't you first need to replace the custom objcopy use?

It works just fine if .init memory is not freed, as it doesn't matter where sections are placed.


-- 
Best regards,
-grygorii


