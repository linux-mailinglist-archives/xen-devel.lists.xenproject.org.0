Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122CA9086D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 18:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956446.1349864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u55Lh-0006VX-N7; Wed, 16 Apr 2025 16:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956446.1349864; Wed, 16 Apr 2025 16:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u55Lh-0006SP-K3; Wed, 16 Apr 2025 16:10:53 +0000
Received: by outflank-mailman (input) for mailman id 956446;
 Wed, 16 Apr 2025 16:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsD+=XC=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u55Lf-0006SE-Kk
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 16:10:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2606::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cf7a611-1add-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 18:10:49 +0200 (CEST)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AS8PR03MB7937.eurprd03.prod.outlook.com
 (2603:10a6:20b:424::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 16:10:46 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:10:45 +0000
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
X-Inumbo-ID: 5cf7a611-1add-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjZcgQNAi/gq9SRsqgsLKT/12IaVoxZPx24pbNAo02RrgwWSPmx4ioOEN4MYtbQnWJtnIipkQfPMmnni746YXo+FPVaDLUqqECpiJds98lz5byJSkmjtYJVq6I3Ybk0wrab+zt+ZAc4gtaKhmGB2pQAgHHOGmbEgUknqTKYnPlNO16z3LZgkbkzypzvuwcUgPN/SvXLaxXLmK6fCumQsKmZv1RE1kl/wwT/N+iqUm8S9N4TqzQ997chiQai0v3Kf/K6vucihtnYoXumFQVJE2Y/akR18tahGGzpP76c6jmKXphanlpodp+pJ2fZB15HTNAl8FfgGFWZRuBR+1O3aHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53o3St1ec3DU+qcceFQiTWCqqM4QOi3wbhMgOhCOgDg=;
 b=L5EMFLKrkMhU1pEIXozd5N7XChpkvQ27csINpWXS8ZrMG9AapK5N16G8bPdwGZxKZO0s4o2Z0kiIsyqBrZKC/Hkb7ZENzjsrLi4EW6WUuvhjeACnPm7wLYiCqAjJlipQCpVPjWKSobiJvhbk3Wm4tQY7nAGjD8VkIeFBJLVLdddq0iNMjKZAXLNG8nFLUEtrOEVsewpsrN2HLiPyy3bTViN0CVGe+vv24akIrI1aFotsDhzULBeywZq0Wer3OvNErDkgrmYKF11KKWjItLF09mrlFO/nEwywktAIK8smRkCMkXSiMgk34hRNlH4iP670AbZsesgZKIE19nCmenVI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53o3St1ec3DU+qcceFQiTWCqqM4QOi3wbhMgOhCOgDg=;
 b=A5XlAtY5A6pe0W2YBPS+wwtwCz7lYoNjyaKtHeAPQsYUfFQI5ckS2U4J16LDABchtFk6b4fb+S3nftFBOJZqm24GOtoG6SOYZIKwOaq7P6oza/niB7V1hwphWc0unAFvaNiw8OVlRP/OjG6YK0DIzWIDJSk6YoDS6smKkqI0Mfmw+2HTPuCq3OEI69a8D0SrbZpSUA+5slnZi61hSDXW2WhGIjLGjOy8Ytbk12fExrK5w4bZN3fAYBc9NGErthYqs5t+OyEeaLlU4vU6dyHiIRwACnF8jE7q9rJxBKXUWwSpOO8gKX/L2KhEd5ER/2r4gzPE4QDHDW2AvabRJW8BEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b874731f-55c5-4783-995e-4da916e305a9@epam.com>
Date: Wed, 16 Apr 2025 19:10:43 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] uboot-script-gen: fix arm64 xen u-boot image
 generation
To: Alejandro Vallejo <agarciav@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20250414081223.1763630-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2504151758170.8008@ubuntu-linux-20-04-desktop>
 <c0a5ca22-fc42-47fc-b1b0-358992014454@epam.com>
 <D984SS1H2QX3.3G4ZR015V2U3P@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <D984SS1H2QX3.3G4ZR015V2U3P@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::8) To DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB8919:EE_|AS8PR03MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: af97e6cb-c455-4017-711f-08dd7d013ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVZQVWFJWEF0ZG5DaHB4UnFadFdUZjNRZEt2SjZreEl2MExHdkQweUdiRGFM?=
 =?utf-8?B?blZUL0lHeEF0azE3WFV4UlZFSU0zbzhBZTkzNkRhVkszNVc4TGszVUVpZU9G?=
 =?utf-8?B?SEcyWmJ2T0RUUG1ra3ZMUzlncEdFVUdLVUxSL1hIVTdSakVuek56d1NQYWhY?=
 =?utf-8?B?M2Z4ODNHc2hGY2RtN0U3TVZoR3h1Z21yQy94d0RGZ0szMjgzWWhSTGYvNjQw?=
 =?utf-8?B?UjR6RGlmS3BLV0ZBMy9pakQwVFNhNG8yeTVHMTRJSjdLZTFWUTVIRk1WOHIx?=
 =?utf-8?B?bzJicFJmN05ZVDcvUmttYlFmQjVVYXJFa2pJdFEwM1A4STlLeVhlNjRycVkr?=
 =?utf-8?B?R2xIdjFibVlyd2J6SHpqT1Q3YWZmWm1aaXJoZ0cwYXFLUVYxOFNsK2hGRkdZ?=
 =?utf-8?B?WldMTFVFVGEvZ0RzbFQ0STJ2d2NlRUJmMk93NUJ5ZXdIZzBBZjAxbTVLQU9X?=
 =?utf-8?B?N2Q1cVB1Nm40NHhsVUM5eTFtZFQyNUNTSXkxekI2N2JsOTV3NDUvMC91Rjhw?=
 =?utf-8?B?Uk44Y3ZQTHNxd2o0ck9rSGxrV2RWUlJYMkIrTWpiT2h5STNMTW1DZVp4U0Yy?=
 =?utf-8?B?LzZtS2Q2MDkxMS8ycnBaNFdFQXRuQW5rZGF2clZzVWpWeWFHWHA5ekwxWkhm?=
 =?utf-8?B?aE1aYk1vNmVzbktPRWFSTmo2RUJRN055eVZLdzhzUDRscnJVc25uUzRaaUdN?=
 =?utf-8?B?UjBkeC9leEN4NjRVYU5FMDkrN2FjTVNhaWhZdWJIV0EraUhmeWZNUXEzZDA0?=
 =?utf-8?B?ODBWcUJNdFdiS1pRS3NWM3hlMmVKaUdLa2RaZkhtTGhjMkY3TmNmSWtaQlBV?=
 =?utf-8?B?djQ4RmptcjU5cFJZQldhdnF4Tjdvd0taU0FoTzdVajJBYkhsSnQ4Um0vZmdv?=
 =?utf-8?B?TGFYT3YyY0lQeG1xY1JQTzdYWS9ZZmtoenRwM3VLQkhzek1xQ3NLQUxOb3Ri?=
 =?utf-8?B?Tk44STJybTdhMk9mWGE4dTlvRUdvRHFxM3VZaFJFWnI4YUlzZTJ6TDMybHk4?=
 =?utf-8?B?Zk1DdzVYdUp2TkxRUEplSDVsenY0NkhkWW4xcmRQazBtM0dHQjJFVXlCdVFy?=
 =?utf-8?B?Nm9Rcm9xYjVQWXpxVGNRazBmVTBLTWhuTm9oSW02ME0ybnJBQUxvT3hzZ2lG?=
 =?utf-8?B?QVowaHlCSDNNVlBuMU5SdGxhOE83clFJWmJML09ZNXVPUTJJWFZRdGRka2tS?=
 =?utf-8?B?aHYxYWlsKzVJOWpwWTR3WmRoUG9tZFo3cjlsOFh0VGhPamZDU0p3SGF0SklN?=
 =?utf-8?B?WEZLNlc2UzUza1U5VSt6ZjI4eThTSTVwYi9SWXlFalNtSkM1TXAwL3JQbnRV?=
 =?utf-8?B?TllvbHJEaVFDN00rQkZ2cUlnVDN0ZUxheXZKUG1CR2ZtVjczOStIRUc0bkF0?=
 =?utf-8?B?Y0k4M3QwWHdSQVJ5aGZLaUw2VDFGZTJkaWxFYmRXbTNNMmJWTVA3bDR6WWlm?=
 =?utf-8?B?ZmtHSDJHWlJiMnJVS3pvUHQ3dWpPWnNseXN1RExjQUkybDRERVdlTHV4bkt3?=
 =?utf-8?B?d2R1ditzcXQ4SGpYQSt0bXA5ZkVIazl3QzUxMDJod2MrUmlnRGZoNllIRHBI?=
 =?utf-8?B?Q1ZFMTYrblI5UEhmU2plL1BpcGVGRW0vRGd4cmZUZ2U0ek9tZkZEakdxM25n?=
 =?utf-8?B?QWFuTzZnbzlzYTN5SE5tLzlwZVlmZUFwd1NqclBuVTViZzV4RGl2RE9FdElC?=
 =?utf-8?B?Z0ZWRmQ5YzFUZ1htc3dhVzdid2lZem95K0taNmIwOTNpalVjWXpVc2FXd0Ez?=
 =?utf-8?B?K2xIc3NnV1BoK0dYRHlpQmJZUnZvRmUyT2lvbTNRUnNjbkRHRmQ1Mi9sV2s3?=
 =?utf-8?B?MkdaR0ZXbkl0eXdlMkNPR3lwck8vbHkxUUU4QXlBSkxGaVhvdkZBY3hmc0Rl?=
 =?utf-8?B?UnpXWW11Rlk3OC9xQ2pKMjZmUjMyOFZLUXRLTGRrc25lVXBQNHA1UWgzeU5z?=
 =?utf-8?Q?ci/ZWRUcFt0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlJWUndrem5lU3hMcnlLTnpHYktFaUpGRFIxTTJqUEgrcVdrcDUxZmN6V3pS?=
 =?utf-8?B?cEk2UFI5cTNDSG8yMWlhS0tXQnBPRmh3L29BdGNubHhNUklPOHNOR3dPT0pX?=
 =?utf-8?B?MW1EWkVXN0tTdTNnbFNoTStyNWRCUkg0dnJmRUNIN2dLMTRuWk01c0JHR0Fh?=
 =?utf-8?B?RU5Bb3ZBb1ZYb3cxdFVDbHpKUlBrekFlYlJaVElIbHlvVzZ3c2FHUnlxMEdR?=
 =?utf-8?B?bXRhdUF1KzM2QkJnakJieVNjb2sybnJST29UalVZWVV2L3JWYzZuR2tqVU8v?=
 =?utf-8?B?emd3MFdybEdqZnlpQWM3eFNwR1ZCVHBHUmxHU3AyOWNqaU1YeVp3NkJZSVlL?=
 =?utf-8?B?czh4eElzT2E4TGc0aVJuamkrMkYyNVVleERTeDBaNkJTZ0xieGk0REYzL1hQ?=
 =?utf-8?B?Mm4yME12Mm8xeVlsNzBtM052ZlFveXVlYlU1SXZENkVTRTAvWnFuNFFweXdV?=
 =?utf-8?B?UXNwYUZ6Qkk0S3pqRVVVUm8xVFo1UWFrbkFwbE5nTS83ZUh2WkErZW9zTVNt?=
 =?utf-8?B?NDh0SU1DYUJ4ZnB6Z0sxR3d3VVoxMXEwZXFkcG1rbWFBOVlBY3krUlN1UmY5?=
 =?utf-8?B?cWV2bjlrNzR1cWIrbk9oVzRVQ3BzdEVQM2xyUnR0OUVxNFhaTXRDSUpBbUpH?=
 =?utf-8?B?L05TWFpva0k3Yzh5NDBnRWpKUG8xMWdDL2p1ZGxBTXpWQWRqenI2YTgwVE5u?=
 =?utf-8?B?KyttaFlRNzdxcGNEZDNYTDV4VE1wOHcrUmVQTi9lYkVDdGhib3crbldsWCtw?=
 =?utf-8?B?V3ZSN2djRXhvMW1EMzNVc3lGekJUOVlOZjNHaFV2TEJzQTY4RXhpQTY0UFB6?=
 =?utf-8?B?RkE3Yk9Ha3IwL1RxbmhqWitEeS9lbnQ0MzR2N1NncFo2dXc1UVFEMzNIb3VE?=
 =?utf-8?B?dFBYdlltNndYSiswMFFMQzdxZzIwUDBaaXNmVW5GcjhzY1FSbXZhR3FtZ3VL?=
 =?utf-8?B?MUR6MGd2eWpRelVsUXZuTTdITWpyRndjRlJrRlNRR2dLNEZ5VUNhS05Bb0xu?=
 =?utf-8?B?VW5YYTM3c3U0cDdzZ1cwVUpxb2N3c0VMenpKUmo5dTl6bG84S3ZyZ1JMRVIz?=
 =?utf-8?B?YkMxdUt1eU00bVJKdDZKTS8xZVpicEV1c0Y1aFdyb1BRR0UyUXZTZlpUZTNP?=
 =?utf-8?B?T1F3ZmYyVURCLy91c0JqUnFKclh1RlVOSVZYM2F0UTNKeGlpQ1VhMkNRUGor?=
 =?utf-8?B?MkhCU1NTS3pTV2ZpNHpYT1dzcDJQai9EZm9VYTV4ajBXSjdhN2NiaERMZGxL?=
 =?utf-8?B?LzcvZC9kTTBtM1FrTVJTMzk5bjlKZERTK1J6TzNWaS9xKy9tdUU3QTIxNW5x?=
 =?utf-8?B?TWdQeUM4YVVjSHJIaEVRVW1waEp3MkVzYzVJT21WbWhnNUMrNGtwaUJsTHE0?=
 =?utf-8?B?R0I5ZGJ0VTRKQkFZK2dBdStNUEJXN3NsMWdUcDhkd2lTZDd4eXc3M1FEa013?=
 =?utf-8?B?WC9QVENjQXk5c1lDRFBlU2tVaUdqYWc5Uk5QejIva1VkSXFTd21COFpjTUlJ?=
 =?utf-8?B?QkhFaFZ2aTN2WHJ4N2FLL0pqRVJGWWp2SXpBZ1NJYko2QmFtY0doWDZOT2xs?=
 =?utf-8?B?MDJSdnRSUW1QNXEyWlZYRlJPbCtpVDdjMkNwSnVHcXgvaVRrZ25TdUlQeFRr?=
 =?utf-8?B?dTdqaGVxdHZyd1llQ2tlQmN6c0ljWlN1ZytaWjU2dXdPbktMbTVXMmpjc2cr?=
 =?utf-8?B?bkdwOWlZekVBUHpXWGFtQVdFVi9JV29CSE5GT2ZuRzgxSUJVWmVyVFNCcWhQ?=
 =?utf-8?B?eGxzcUlEcU9hOWV6WllPUHV2VHY4RndrZkxScjUvWmVwaTZTZmpZU1UyenZ2?=
 =?utf-8?B?YkxKekJmZ1NkWWxEbTlRYVNLUWdUVGxjT0lkODAwUDEzUGlSWktVVjhJTlhU?=
 =?utf-8?B?N3J3VGNxQlVVcGhxTk5KYWZ0SnBaQURUOERTaDZZK2xySzJQR3NCZlMwRFFi?=
 =?utf-8?B?SnFaOFdKY3g2VkhYdktjZlpoQSt2VEk5bEdEOCtkOFhrSnd6YlFrNCtaZXVo?=
 =?utf-8?B?RTVwRTJBTHY4Q1gxSHhSc21kMFFSSW15WlZZbXNaOTJadmFweWltWnJONjhz?=
 =?utf-8?B?ZXFkdS9RY0phVlVoVjNVbitQb09abnN0MTdKUjc4RUsyZEt4WVVyVW92a0gx?=
 =?utf-8?B?ZDhkVFdBemJwUmRFSUloNzA1ckNOM3lhR1JMdzB4WHFSU1BxWUo1Mkh5MEds?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af97e6cb-c455-4017-711f-08dd7d013ea8
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:10:45.7561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiyA23LgrjmFKq/huy5MwFliyawSbEUijOEOTV8XD90eLbf8/jeJ6Zqeulnk+Vd2iU/BWVFIwFwS5X0B6+hvx+jZ3OG0y1nXBiIzHSssmRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7937



On 16.04.25 17:26, Alejandro Vallejo wrote:
> On Wed Apr 16, 2025 at 11:44 AM BST, Grygorii Strashko wrote:
>>
>>
>> On 16.04.25 04:03, Stefano Stabellini wrote:
>>> On Mon, 14 Apr 2025, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> The current code in generate_uboot_images() does not detect arm64 properly
>>>> and always generates ARM u-boot image. This causes Xen boot issues.
>>>>
>>>> Fix it by searching for "ARM64" for AArch64 binary detection.
>>>>
>>>> - mkimage -l xen.ub
>>>> Before:
>>>> Image Type:   ARM Linux Kernel Image (uncompressed)
>>>>
>>>> After:
>>>> Image Type:   AArch64 Linux Kernel Image (uncompressed)
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>>    scripts/uboot-script-gen | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>>> index a9f698f00fd1..c4d26caf5e0e 100755
>>>> --- a/scripts/uboot-script-gen
>>>> +++ b/scripts/uboot-script-gen
>>>> @@ -815,13 +815,13 @@ function linux_config()
>>>>    
>>>>    generate_uboot_images()
>>>>    {
>>>> -    local arch=$(file -L $XEN | grep "ARM")
>>>> +    local arch=$(file -L $XEN | grep -o "ARM64")
>>>
>>> My file -L gives:
>>>
>>> for arm32: ARM OpenFirmware [...]
>>> for arm64: Aarch64
>>>
>>> So the ARM64 grep wouldn't work as intended. Is the version of `file'
>>> that you are using really printing ARM64?
>>
>> Hm, yes.
>>
>> 	file -L xen
>> 	xen: Linux kernel ARM64 boot executable Image, little-endian, 4K pages
>>
>> 	file -v
>> 	file-5.41
>>
>> u-boot boot command:
>> 	 bootm 0x4EA00000 - 0x4EE00000
>>
>>
>>    If so, we can do:
>>>
>>>     file -L $XEN | grep -E 'ARM64|Aarch64'
>>
>> sure. I'll update.
> 
> Missing escape? I think it's needed even with single quotes.
> 
>    file -L $XEN | grep -E 'ARM64\|Aarch64'

No. It's extended regular expressions ("-E") no need for escape.
Also it works with both '' and "".



-- 
Best regards,
-grygorii

