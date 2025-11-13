Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B86C59EAB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 21:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162118.1489897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJdh1-0001UD-Cm; Thu, 13 Nov 2025 20:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162118.1489897; Thu, 13 Nov 2025 20:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJdh1-0001Rt-9l; Thu, 13 Nov 2025 20:13:19 +0000
Received: by outflank-mailman (input) for mailman id 1162118;
 Thu, 13 Nov 2025 20:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJdgz-0001Rn-V5
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 20:13:18 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e07650c-c0cd-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 21:13:12 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB9649.eurprd03.prod.outlook.com (2603:10a6:20b:5ef::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 20:13:10 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:13:08 +0000
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
X-Inumbo-ID: 2e07650c-c0cd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/8VDQxDsVK3+qnbewVxDKWL0M5sukQGZ/WBxYu8sFaerjr69uifO4P2BeJDHQZJGoas7DHJ2Ebh6fUa+dCieUkgevYQ+94GZ+Zf1Q3otfMTEhLlbYQJAD6PQUYtuqRK7Su5dlsfLx5lS4sdQT7OBiJl90GMISSl4Trrh/IbsEr0dGPtSA6VZNnLufqpwoDfdYGn0BBK1jtIW4RwtrUBNSOVcBhox/Ere9f2TDMdqJ1JRAeH/16Hh2CXtmcbHuRti4gvckzKXue+TlQuxT/CzL/4+rSoR0YcSIAF3X8WuSRGirH0xiukThgtgt+PrjOLiznAN65xaJ/sBIAGS8J51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ9qvdx8FI9MEXD02roVqO6Gk9Vi+y1qOy8t0DJn5fQ=;
 b=KMAt/KEMalXaqvVOqpKqiPK46CQV/p5EuK2KRuqoAJhEKCsxZlA3iycw+zcXhXWJv9L9Y/FKJclLgai8wz7k1YTi+F1Fq9xRyN2o309Pk4ycqCq7OIJxO1w4I/o2WWtjVNrWfvf79JNyjG8O4kOtD3OZMluqGyAwY+rJnp7hXTj/BIS0TeKw6bH/bOOV9eLMAv6p4d02hJOVVwswf6cEYt+jV7mLph1+KanKuMsmI6GJ6+YMUxvbLHu3tNDbDPcfdQgX31DDaEE4d2ukh16W5TjRpQxXvcvmBcsbN0wTVO+JRQSqmR7Dbio5FIZdfN8QaQAflrVo/GJ8CfBwMuEhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ9qvdx8FI9MEXD02roVqO6Gk9Vi+y1qOy8t0DJn5fQ=;
 b=PqcM2KcFwWWjG4no47+FzR91YcLIVoo7ctjU1moLvBAwvjO2+rE3KuyGIo3pO0Kron+ZZ5LTN+5jLSfOySPpgEvUKOoG7CK28oe6vNrNw8PPZSQxEm55jdtheUAkiVSjlycsvNntmhp+UGojoh1fstMcry8XRTK49GmHi7AmyYWlRc5rW70aka/awNYZnwXWa4VimYV0l+XBTZssumCz+F77iJvKXfUlfikLXc5kSVShxnnsG5pwlf2jci3lqoFe4xKi56uIH35B0AfdrmAZBT1MZxHDR8xVJTf1oK3IdLmQCJwGMAchCcd+f74IR3PQl7mKZRP6DatdxCJKGuW11w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <364eca04-63d0-4ceb-b6c8-84fa6efc3aeb@epam.com>
Date: Thu, 13 Nov 2025 22:13:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Xen DomU Bootloader Experiences
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e89648-2a54-4f73-fd26-08de22f11006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXhQaTdCcnlXSVJiSE83K2tqaE9DNndlemFlbXQ3QzhwZ2hkTVVCNFA2WDdm?=
 =?utf-8?B?ZnJRbUV0SUNOV3NrbEQ3TFBLaGlIWDdsY25zbDZ2N21ONUZBN3R1N1U3YVBY?=
 =?utf-8?B?VTdGSlBieXUzM1VTbVVOMHR6cWx1a29iMmNqRDU3QzBQOHZodDNIaDRhZlox?=
 =?utf-8?B?eWc1SFY5VFJDdHVhdXg4Qm9FQXhCdW9ibkc1enRWb2tDa0xVMjVMbHdiTEFu?=
 =?utf-8?B?K0NreERMT1ZSOWpCdERHbHIwbXFTOU9MeDZ2Smh2VExWd1JNUWp2MVhTTHRh?=
 =?utf-8?B?L2JHUXpXOUxJVjZqaWhqTGsvWVJaYkRNeUxkWG5IUFBOS1ZQQkFDaHpFcHox?=
 =?utf-8?B?c2ZnY1JKTnJYOU0xRFVwOEttRjNlZjFhUVJhNlNFUzBQak95VUgxYktDRHpM?=
 =?utf-8?B?OUtTV1BXMEJSOGtjaEdxUVF0U1RsN291YW9FY3RHNVIzamVWNm1tamFtb1dy?=
 =?utf-8?B?UzZDdWtZRmhzZzB5aGgzWlZzSDhwa21NMWJOS2dHM3p3TDNZU1VDWTAzSUsw?=
 =?utf-8?B?U2JSaE9UQ2g5RzduNGhsSVAra1ZNUS83dG9xRGxMTnFhTVhYQ0xCZGo2ZVRM?=
 =?utf-8?B?dUZFcmZPUUVDWE9WWmQ0aHFrcTQvbVdaYmViNEtZR3hJQkVZdXhQVkVHYjBh?=
 =?utf-8?B?bTNyK25GcC9pR0xnMURteWUxWEtmL21mVmRDN1U4dXp6NHBFSFp4Vk1hSHB0?=
 =?utf-8?B?L3JOKzhZN25vczhxaTEwV0hhemJrdHpzZVZkcjBLTXU3aGd3ekc2VEVtRmpa?=
 =?utf-8?B?VkZRQ3dBR2FNbENQQjZrK041ZTQwUElzZnNucHpaRWFzOEV1WnlXTWJKbFQ3?=
 =?utf-8?B?UFBTME0yRmtMcGlhbXFZSU5ZWjlrNC80cENHNG5hY1o2cVZZekhtL1l1WWZV?=
 =?utf-8?B?MWNrZ2pjUnVwKzFyeW85UVNZa1UycHRBSnBLaVBwQmVPQUZVNTFwejF2Mzl0?=
 =?utf-8?B?M295K0dpYUJhWlZ0ay92M1Q3KzExWktua29EZGVKZ1lJK0lTbnR5YW9LYnl5?=
 =?utf-8?B?UC9qWEJjT3lVRFFaSzhiYUgxNUtyRWtjcWh0WmFiVXA5QzRSVUtPclV5MEY4?=
 =?utf-8?B?NXFpSjhDQWJCRU5Zenc1enlPa1B0SHdPeFp5VUZVOWRZdVZKKys0S1dOdmhU?=
 =?utf-8?B?TW8vZHNtdkgzb1VZZ1BqTU03cFQrbENHQU03Y0JMaG5GSWZSaFRZcFlCMEQ3?=
 =?utf-8?B?U0RYTVdmNWNMQTBWQndjM2pkYUFXNE5vOFZGU3krdVFvVFVOWmNLWU8zcURD?=
 =?utf-8?B?OEt1bXBMc0hEVzFvaHdySGpFNnJXcjQvYUtQb2JPeGpLT0luS1JQOWJBQThV?=
 =?utf-8?B?b0Jwem9IU2cyU1N6OE1kN1M5Y3JMMUI5bUdaM243TzhxK3h2U3RCQWlGYTVS?=
 =?utf-8?B?empoQmZuckxjZkpEZE1jN1JCSmFaMlRaaS8zQmR2RXlZMFZGZzJENXB3WURZ?=
 =?utf-8?B?aURlSEtBTlpKcERqemlGUzZ0Nkd4WDQyMzdCYkdrazkxdUVHblV6eG8xMk5N?=
 =?utf-8?B?b2JZa1hHUU9SeEdpcVJyamgwRkJ1b1dja1ovaVZsWjhFc0ppYVZRbTJ0Wk5v?=
 =?utf-8?B?aENpUkduaElUNTZLWERXeEhEODhBQy9OclhCbmpWaGJSaWhwRFNzdlhmS1pY?=
 =?utf-8?B?c3N2c3hJUzNiMTVEaEZiUVFhZ1VmMWRCNzlDTHJxenpjYmNLOWJXT05aM0cw?=
 =?utf-8?B?UW1POGxUcE9CdklUTGZ6VmZzUE56My9mQldJOS9oRFMwakdzQlc5d3U4SUtZ?=
 =?utf-8?B?bm9hdzN4dlBMTnRsWmt5UnFvV3F6Sm9NVi90L2pqNjAwdG5XWjh6UDJ6T1VK?=
 =?utf-8?B?K0hDK2JHK00zSjNFTVEzQ0VCcEF2M3FRakVFNGxKU1dmUmRVUUlxZFZ6Q0Fw?=
 =?utf-8?B?RXBOcnVvTFcxTENWOGJoL0FQdURGMCtSbmN3RDNReUIvU1FNV1czR0ZIeGQv?=
 =?utf-8?Q?dDU7H41K50lw0pYDbvenSmIDSrMILQKg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZjbHVYdGk3cHczK29iM3p4OXNUaUJyOStrVW5iemwxbWlqOG1OUGJKOHVV?=
 =?utf-8?B?WUt1N2dRaEswZFQvdm0vTWlhSW5SNStHL0FWUU9PSCtrUW40SXF5R3haZ2hx?=
 =?utf-8?B?QWhnMWRBKzIwNk9wMlJDWUNjUkFpWEdUc3VUVmphcFR0dW56eE5YS25KZUdU?=
 =?utf-8?B?REIrcFVIYkRqOHl2a3pHcDBCQzdmUWtxTWhRSGlFZFMrQUsrQytOeG84QlN1?=
 =?utf-8?B?R0JwZGdKa242dkF2V3VWQVNWT0FtbGc4dG5iUUdpbk1FcUhGZ1RpQWtqVUps?=
 =?utf-8?B?UWpNYTI1VHRNMlA4aE9OY2J1cnRpR09neHBkN3FNQnNwTUkzMXEydml1WnhV?=
 =?utf-8?B?M09VM3gwRWdIWjJES05qU1lxQ0MxenhNY1lSblR4bmhER1EyRGw2M2J3OEFt?=
 =?utf-8?B?UVY0cU1kZlVLamhZN1Qrdy9HcmdKT0xmVEdXbVJ1L3lOenh2dkFCTlpTaWFw?=
 =?utf-8?B?ZjdOdjRUbTUxNnhlZ1VLN0E1eW9xRHFqL0tRUFhHM2xrQ29QSGZoUzc0UTky?=
 =?utf-8?B?Q291V2h6MzlGY0Jzd2NnSGs0NVNlcjNzK2ZxV0IrYmRWUm1jUUVSWlI0TmRW?=
 =?utf-8?B?UjV4bWNwUXovYWVIM3FUYnVGV3VFcjFTdSsrQ2ZHUGJNR3Z6Y1k4ZGdZM3M0?=
 =?utf-8?B?bUJYVk9tMTdDOVBIVHhtT0NrdjhzMTBheWtkeVpXTlBFUFlpWkk2djlRckk0?=
 =?utf-8?B?S0VYM0ZPRDhQNi9kbkVITytzMStJSWNmN1NJaHB4QlhzQ0VPSjJUQWZidmZZ?=
 =?utf-8?B?bkhjUVQ4SmRhbjV5c0pnWFNrMzdISDJWenlYaCtnaC9haHp3WGc2VDhVeXhP?=
 =?utf-8?B?WmhZUDRJUUZxVUM3OFNBYVNQTC9NL1NTMWx0NWo4MDVkeU9vTUliZ28rMVVi?=
 =?utf-8?B?cHdQdHNidTJTblA2WTdtRHRyNEsrMEdnSXUyL3pCTy83akhWZG8wM1VWd3VB?=
 =?utf-8?B?WlN0UGFzSWd0aGxKT3VpZWU1V2JGRUNTL2hUQlFoSHFNb2tTYlNzKzcxZHNB?=
 =?utf-8?B?VDFzd2w4ZEdLbS81dUVEMXM0UGM5VUV6anNvZVd0dm1VdkV1eDNEbXVuZUF3?=
 =?utf-8?B?NFNQY0YwR1N5RkV6bTNTUDlxWmVpSXVhRHcybmlFWFNaZy9zQnY1U0NYVk00?=
 =?utf-8?B?a3VsS2htMDdabjNRM2g1WGVtRVVHVDNLazVKbU1PTzRRUEh4OGpaZndJak9i?=
 =?utf-8?B?a0ZtOW9QQ2NTbjJLUFlUZ0w0aUdCRFQ3ODREQW1iUnBwMDAxR0RnZDlMVy8z?=
 =?utf-8?B?bzgvaWU0YWRucFVNd0RhQUcrcTBsZDZrMDhHQUM0YitGUk5UWndoM1FJSGM4?=
 =?utf-8?B?NVF1MXVZMXlySmtTZGIvbkUzRVZKTmE4MXNZUTRaWHluc1A2aUFKQ2pHYk9x?=
 =?utf-8?B?NlMzaG5LWFhYRmlRVCtLVTNyTlc5bnB3US9BWHNwa1Z5UGEzSHFjbmJKekYy?=
 =?utf-8?B?d0tPNlBGaE1iM21XTmovVEtaVzJxdGdRTmR0cVhSaGhEZXlTR3R1M0RZUXla?=
 =?utf-8?B?MFoxOGJYWlRDRDVZUW1ocmpLSlBRempHcmk3YTU5SkpHei9jQzJQOWRvNWFO?=
 =?utf-8?B?T1NqS2pWMysvaTk4NTBzUU9PV1lSM056OXh6ZDlXUGhlVHNYRVl0cGZVUVhR?=
 =?utf-8?B?bENLTVRRUEsxaGdVd2hpR0huQ3phREZ2cG5QRU9ncUNHRVdxYU9DeTNMOGxY?=
 =?utf-8?B?VzhvMHN5NHYybm0wUW8ramFkazJ1WWszM0NGeFNKYUhLeERWZWtUL09pUWlE?=
 =?utf-8?B?VHp6NEpWTkZSWlU0a2VlMmVKeTNJOHNIWDJRMEpDTDRmMmpTYnJlV0RwWndm?=
 =?utf-8?B?TVpNRE4zK3dyU3dSckxIenY0Z01Tc292NStHMDFiMytUOHFZenBBc05CQkJo?=
 =?utf-8?B?Vmx0MkVZcFhxVDFwbmJjWjdkcHB3SzM0RUxXWTFmUjM0cWMraFd3QUFJWjRF?=
 =?utf-8?B?RTlXQ1ZkbUFzczBmZTVCQmNLVmZ0ZERKT0tIbHlZV1R2UVBSaUZ6cEEvd3lz?=
 =?utf-8?B?STdta1FGZnltTmNoMG9sbkE3Ry84aWJIUVJpUXc2dVplbEw4K2ZmZlZDWU9t?=
 =?utf-8?B?SVBhaWhWSi9PbWJkaWtFMHk4VG5OcWZhSmYyVzIrMXQxK29jVW5XcmNSTGtH?=
 =?utf-8?B?SW5DNHc3eUhoUHgrOFFDc3hURE9ESzB1OVFoZGwyVU4yMGxpZ1R2STJHaUtE?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e89648-2a54-4f73-fd26-08de22f11006
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:13:08.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFMDHX5BMhMasDyCiQHsMBRiu5SNaDW4xhlh034bMajP2iTpeDDlYnZicGnXMVpR1i4R/Rl3WpyM5GvyJWlUaL8HkFJPIgxgq2l9INEt3+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9649



On 12.11.25 23:13, Elliott Mitchell wrote:
> A few times there have been mentions of a need to choose between boot
> methods for DomUs.  There is a need to decide on ones to recommend and
> put effort into supportting.  I may not have tried that many nor done
> particularly great amounts of experimentation, but I do have some
> experience with multiple User Domain bootloaders.
> 
> PyGRUB
> Xen's bootloader.  PyGRUB is quite functional within its limits.  In
> particular it simulates the domain's environment in Domain 0.  This means
> the security exposure is problematic.  Another big concern is that it
> only does GRUB v1 syntax.  For a long while Debian had a package for
> generating those files on a modern system, but that package was dropped.
> 
> Yet PyGRUB does avoid needing to use external tools to retrieve the
> kernel.  If the kernel is updated inside the domain, this does get the
> new kernel.  Further being architecture-independent this works on x86,
> ARM*, RISC-V and PowerPC.
> 
> As it is the only GRUB-flavor loader available on ARM*, that is the only
> place where I've used PyGRUB.
> 
> 
> PvGRUB
> I'm sure nearly everyone knows about PvGRUB.  By being a proper port of
> GRUB to run directly on Xen, it overcomes PyGRUB's disadvantages.  The
> one disadvantage is needing to get patches into an external project for
> changes in Xen.
> 
> Two changes to Xen urgently need propogation to PvGRUB.  I'm unsure
> whether PvGRUB unmaps its mapping of vcpu_info data.  The second is
> needing to work on ARM*, RISC-V and PowerPC.  The latter is the one and
> only way in which PvGRUB is inferior to PyGRUB.
> 
> As PvGRUB is only available for x86, that is the only place I've used
> PvGRUB.
> 
> 
> EDK2/Tianocore
> Quite well-known for being the basis of most x86 firmwares, plus being
> part of a typical Qemu setup.  Not nearly as well known for being a Xen
> DomU bootloader.
> 
> When it was working you would build their ArmVirtXen.dsc file and get
> XEN_EFI.fd as output.  You would then use XEN_EFI.fd for the domain's
> kernel.  If you looked at the console you saw something which looked and
> acted pretty similar to a UEFI firmware on x86 machines.  This was
> extremely functional for OSes which didn't particularly like GRUB.
> Notably I've read of it being able to load a Redmond OS and it was quite
> functional for booting an ARM64 port of FreeBSD.
> 
> Sometime after November 16th, 2022 or commit fff6d81270.  The built
> images stopped functioning.  This is actually rather concerning since it
> may also effects firmwares built for x86 HVM domains.  I don't presently
> know whether there are multiple bugs, or a single one effecting all Xen
> builds.
> 
> There is also an urgent need to get EDK2/Tianocore updated to match
> Xen/ARM's disallowing mapping the shared information page multiple times.
> As I did not wish to become deeply involved with EDK2/Tianocore I sent a
> patch to xen-devel close to 1.5 years ago.  Lack of action suggests there
> is an urgent need for a liason.
> 
> 
> 
> Recommendations:
> PyGRUB is functional within its limits.  Problems are GRUBv1 syntax and
> running within Domain 0.  Given this I feel the Xen Project should be
> heading towards deprecating PyGRUB.  Since PvGRUB works for x86 now, I
> would default to neither building nor installing PyGRUB on x86.  For
> other architectures PyGRUB is still useful.
> 
> The Xen Project should formally ask the GRUB Project to port PvGRUB to
> ARM, RISC-V and PowerPC.  The need for PvGRUB on ARM seems rather urgent.
> Without a proper bootloader VMs aren't too useful.
> 
> 
> The Xen Project needs people to work with EDK2/Tianocore.  The oldest
> report I've seen of the EDK2/Tianocore issue dates to mid-2023.  Now two
> years later the bug is still present.
> 
> The ability to configure XEN_EFI.fd as a domain kernel is a feature
> highly worthy of being ported to x86.  For OSes which don't particularly
> like GRUB, but do have PV drivers this is an ideal boot method.
> 

Just curious, you did not mention u-boot which is widely used on ARM,
for example Android guests boot using it.

-- 
Best regards,
-grygorii


