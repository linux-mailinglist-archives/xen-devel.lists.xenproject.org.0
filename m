Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA12CF8037
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 12:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196034.1513902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd57L-0002yt-8S; Tue, 06 Jan 2026 11:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196034.1513902; Tue, 06 Jan 2026 11:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd57L-0002wF-5M; Tue, 06 Jan 2026 11:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1196034;
 Tue, 06 Jan 2026 11:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vd57J-0002w9-S3
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 11:20:49 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c06a8b24-eaf1-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 12:20:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7170.namprd03.prod.outlook.com (2603:10b6:510:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 11:20:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 11:20:44 +0000
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
X-Inumbo-ID: c06a8b24-eaf1-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRH/HI/RPr2TqTWNGnAxijXlnaX9/CJbpWy24JvSpNcH7IePiiim26G/NlbXFqRFWS4ptcyeQsyGmOnOOLgmdp1BwcFlvZvxTK8o1oJTUd2ojUuUA/R+0s4CtOYL2xAl9Swc+rPatTkGCh/BfW/WdCInsZjaZpj8w4ZyrKITj8Rsj2N67/aD9pN7XFP2fLxrcCYJrQP2S0zS0GPAtIeGrElMhjwxvriu9oWiPs3u6f5Vw2kA0GsaEmnuoKUtraHCMPk2SeUDaEbYcf0mHZCKyEZ1ZTtVNUL5ufphJGFpyPtIu8BdOjqIFuHV+mj4Bv+633usZvXuId81n/Vwx8CCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IqqzMDdNweW6Nsta7d74ip5tAchem585cBEU5q0NRU=;
 b=weMSEnZdUDI8Jc+Wag0QZ+xqqONYE9Md9ZUA75MAwVfbdK84VF4skgrkqIF4EjiHNAVgL+QQ7avwYHaHfiA5vlfDDRhWlzqQSypM+TgWB4gQWuNR6KC6GQZK7x/+522ngqe6s+aMeehRiPvdlCHbqtCiF9639WqL6vVOxfcNqiF3NoS2H97zuFgCuBbe0GZSXAIpzsgBwRqDJagKkn+iiQKi8iPgIP7aUQOrcpgy44gV/vnVm54GTMbbW1/+O+gUwvfbHccscwL2m4irWBdsNNPMlhu3xGRLEhbh2qjSY24d2qCGfSLrQ6cYotvR7pErXJNYBq9POHsk0l1HEx0ooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IqqzMDdNweW6Nsta7d74ip5tAchem585cBEU5q0NRU=;
 b=NWsjsbe2Hw9aSCKKvw3anu5V4DSf8ywvhlcM70q54gbUT86w7dqxy0rSCGyggUzNN3SPlD/XT3TgactCrwLGou2fm5sXzoNQwrplRAP7v89cg8nBQQ+26IxYYaMBhHeAHimsGQ9mvrPbJMOd3NIoft32NSuEmD7TGtnvvljCmY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0e1e877a-a8fa-42aa-8546-ee66f9287e18@citrix.com>
Date: Tue, 6 Jan 2026 11:20:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
 <DBA9942D-FF7E-4ECB-BE2B-3C8814A4B4A6@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DBA9942D-FF7E-4ECB-BE2B-3C8814A4B4A6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 33772b5c-269f-41fc-57ed-08de4d15a233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUZaR094RzRsV2VsaDA5QlBJaml4d2Z1b1c4OFpZNUtlTkZUZjBjVHVnYVZB?=
 =?utf-8?B?R2RYZUxacVhhOUI2YXh1NTB4RW83MVJDWXoxaGhWOWRwTUpLTkZoL0N6Mnh4?=
 =?utf-8?B?eFJYbkNNNGZPbXRpUEtvVWV1Y0FneVFrbzlrU29teVVDdkNEcGlVK1RnUGFF?=
 =?utf-8?B?VEduK1BVaXhRRlZ6TmVPTVkzczlOams0WVVjNlBhUkRvYTBZUHR3QXlWajMz?=
 =?utf-8?B?K2RpRWNCTnFpb1NzK0oxd2RpdGt3L1lHbytmUE0yQStjWE9rQ3BpRXNzbVhx?=
 =?utf-8?B?bGNtVFpYa24relVMT1dXWERIa0oxVkNvaURSQnNzc0tCOXBJWXJBK2ZHalp1?=
 =?utf-8?B?bm5pOWF2cTVGWWVHNk5GKzliSlhOY2pBWng4dzVvYWFpWG1rQU01LytwS0h3?=
 =?utf-8?B?dURPWXJWSk1EV1JhMnBUVlVMU3RMT202MWdlUFViQ2tNbTRnR0hXZC9CL1VF?=
 =?utf-8?B?dThOQmM4aTZoeCtiZmZQSjBuREpOZ1NrSWFhZTh2ZjdQRUlBekg2UlpncDRw?=
 =?utf-8?B?Z2JuSFZZV09NaDkzc3BMa2ZXRG4yMkxrblVFdTJPNWsxZGI3T3hhQWQ5V3Fr?=
 =?utf-8?B?VEFaVHpGTWEzWTdhRktWSE1lUnJSVjY0Y1NyV1gvVnBuZDdzUHR2b2N1NmU2?=
 =?utf-8?B?NUtQVkp5QzMveE42K1ErWlhicjZuWXVTMm1nN1gwZUFOTlBmNDRLOEp6NHo2?=
 =?utf-8?B?WElrL2lwLzVYSEMyNmNRRitqekpmZnlvL211RW5VK0lEb0FFY29sZklvZXp4?=
 =?utf-8?B?TFdtOU1jcHBvaTFnc3NhTlduMzRRbVdXYjZjMXBkZ0tNWmptYnFUWklEOWNh?=
 =?utf-8?B?YnFFcDQyUzljUy9GaXlUQnVZUjd4TzNsVzAxZWFSeGVHYjM1UW52SXFXNG9D?=
 =?utf-8?B?NThlT25GcFVmSHNEeGk2cE84RWFlSTBsOVNkeUFINlJiaWdkMHY5VGxHdkRJ?=
 =?utf-8?B?VDRTd2pYRU9TRG5qTmhiZnZ5eDVOZzB4a0p6OXg5ZzhMQkg3L05RdjgzSXlB?=
 =?utf-8?B?aXB5QnlLd2tqOXlzKzI1U1Y2YUE2cFhpdDFhWWNNM2hUS2h1OWtJR1VGL0Nk?=
 =?utf-8?B?SStZT3p2SGUraXNYUXhSUXVTUTVUWld0K0FRdnh1aEJ6M1ptN1RxdXhJUHVS?=
 =?utf-8?B?YUZ5OVJCMWdtYkgrRVRKYzFVUjBuN1RaZG0yajkwZWkvSHFZTi9rOWg0c3M3?=
 =?utf-8?B?Q3JxWTF3WHpSSkdxbklRTm1URytxRUtFSUNIbi9HRHAvSHltbEgwRklqaE1G?=
 =?utf-8?B?dlJoRi9WM1FKYXRGK0JQWkhqazlRcXc1TzNhOEU1TTdkZEkzQlNaRmU5TWVM?=
 =?utf-8?B?eHh5R1VvamhOQ3IrS2d5NFpDbGxhQlErV0U5bUZyRC9GOVcydlpQa0pyakdB?=
 =?utf-8?B?ZWkyWG1QU2pQYXpzblFUNmNBb21YSUd3SldodDlwWGE1aEhPTHo5OWxBcDVo?=
 =?utf-8?B?ZEtDSjlzUi9sYnNoektSU3Q0OHNBYlBKYW5xSlhwL1hmbzVRbGY0NGxLQ21z?=
 =?utf-8?B?dE0yOHJ1VzYyNUswS3h2ZFZmTnI1eUxNYXdsaS8zUGRYeTBNNk1sV0RtNW0z?=
 =?utf-8?B?a0pMOHZXRTVvOU93Zy9CZC9laWFrT245ZnRCcDljYmF3OFdqamdESk1YVlB1?=
 =?utf-8?B?bEhjeXhZSUo4VUdOb2F5OGRsbFZhem1tL0NaNHkrWVpGT3hyL3NxYkw4cXVW?=
 =?utf-8?B?ZmNUaW9JWE1OM1RGVld6SUVzUk5yTDVnRmdBdGxNWGxxWDNnblhwa2h4c05M?=
 =?utf-8?B?UWxGMW5hMEZxTVphQXdIcnpwd2RuT2NUcHl6RCtId09rRkpXczR3YW9HcFFP?=
 =?utf-8?B?aUQvcFFjQTR0M1N6eWtvUjVWU1ZydHZQV2h3MkdTN2w2WmdiVkkwWDZhMWFB?=
 =?utf-8?B?M1lteUYzWVJsaVlGVHVQZGRiMFM1bzVhcVA5VUxja0FRRDlvS1R3VEoyM2JR?=
 =?utf-8?B?SnI3MzFUaVBwVHVFZUtXREJsdklIZTZGVEdSS3dmQ1VSQ2Nmd2Z0T010Zm1G?=
 =?utf-8?B?anhIZVRIV2Z3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alN6aXRCaG82SzVVVXNsU3djTEo5UjRCY0o2eGtvTlZTMXRmUW5NbVpIRGlE?=
 =?utf-8?B?Q1c4MUNqNSt6MlpNUHRDcTdiSTB3bzQzZ1pNaDhxVGZMMGh0M3JQYXFmRjlL?=
 =?utf-8?B?Vmo3aFdOcUpqY0htc2ZBeHRiZGxLYVdoSlcycHJUbXk0MkY2WXhlYmFPa3lv?=
 =?utf-8?B?STVNZ2dIcTlYUGVBRjdIQll0bVhFQVVkSVdxLzZtQjRzb1MrMkJoaWNrV0w5?=
 =?utf-8?B?Z2VHeFhCWkw2MlZJMDRkS1I5SjIwMkNTOXgybXVhNVdvaklVdFZyTGI5aXFQ?=
 =?utf-8?B?MDVFRDRKUDhqdmVTcllkdzdzZGdzVGZyVVBSTklmZUFXWExMRk5DKzBYOE1t?=
 =?utf-8?B?cmJiajdGYU9BNkNIaU1Vc0k0TzBpQnY1L2tmN1ZHZEs2QTZ0TkcwWllyemtz?=
 =?utf-8?B?N1k5M0JBaTFnWUNTY0lHU3pYRVNwYmNFOExqUGwwS2g4dGplMlF5TFpiWUJN?=
 =?utf-8?B?aEFNMmhPQ1htbTNXYUswMTZOMGRIOTFLVXdXK1FuRlFTZndvc1o5SGJxTTJw?=
 =?utf-8?B?U3JESllVNE5CZUUxcENud1RaMjRMQXhKTHZTZlFkY1ZmV2VVS0dFRmFsNmtw?=
 =?utf-8?B?N1ZhSFdCK2hFVlMvUUNjalhWcEhRSHlsSHhLME5OYm1rSmdreU1Rd0JRMWUv?=
 =?utf-8?B?SnljSUk4Q3VZQVRIdmQzTktIZ21uemM4RzV6YS92U25zNEpxcjNscG5ZMnc1?=
 =?utf-8?B?SzB1djJzcWFHQ3pTWjBuSG1zRUpENVZPVVdwZXUySG9VbGFWaXpWSTJHQ0hD?=
 =?utf-8?B?cUZiMzFFOVN4T2xqMU55Nm5wMFo4TGZTdU53UGRlRmZTak9OQmFBSTRxME4r?=
 =?utf-8?B?U0VFeEJNc0l2NThqT3BIOE4wVXRiZVRUaENjY3QxZHZSN1lhaU1oZkYzampB?=
 =?utf-8?B?cS90dFhGK1Ayd1pqNUJia2plaWhDb053enllWUNZOHI1ekVBbDd5czNqSVFv?=
 =?utf-8?B?dTdaMkJVb00zU1hxOUNRZCt4dWFydU5kdHNNaDg5Y1NIQ1VpektSbXF1V00y?=
 =?utf-8?B?L0lxU0xmdTBiU05MR3ZFbjFwUDNVeHJxdEtYMXZvR21SeEt2OWYvRnZvSnRz?=
 =?utf-8?B?K2pTOTEyL29rZG9SY2srSUJBdExERjdqeEpQSXJiSDMyRXVkRjlaMllvdUQy?=
 =?utf-8?B?RXJJVGlVaC9lYmYvcnFBd0pEUDhqcDhzNklud3lIL0ZtS1RrZDBaMVB1SzdG?=
 =?utf-8?B?QzBuNlcrTlFFNlo0d1hoS0x2Zmx6R0hKUmNuSjF6SlZXQ1k4SXlpVXB0RnF3?=
 =?utf-8?B?NEFWQ3ZQZ3YyaGwvU3NlOENneTEvSjFVTmlDTHlmYWFqeWh2STAzNnpUdndm?=
 =?utf-8?B?OElsYVZWUERFQ2lyZnR6eVFmWlJnblcrbnB3Y09yL3Bja0NUQTRCUzJnVGlu?=
 =?utf-8?B?a2p3R2JFZmNWclUrRGd6dmI1akhneFE4SGhHSWw3MEZ4ckl1V2NhR3hiMFVh?=
 =?utf-8?B?bG81endid3E0K3lEMnBOODJoTXNiclhjbnhIV1M4VVlyS2JqNzZ3dDRtdVNY?=
 =?utf-8?B?dVVETEx0VFZ6R0NEeHh3ZStVWTRNdndHS3FrUHRwWWhtTXVVNTJybHgxdHdG?=
 =?utf-8?B?WlFLenJZTnN3VmdCYldYcGhyTTZPNHFqeTJXTUM0MWhST29Ha29DV1phTzZl?=
 =?utf-8?B?amVWbFJISGZuN2J3UFBiWTZkdFZZV1FDZmxFdVY0NmlFZ01UZUtWTlBrUXUy?=
 =?utf-8?B?ZjJlWUs1eVFJazdocTJEL3lNdUdZUEN0S2UxR0E0U2orS0pHRVVyOTlKOUg5?=
 =?utf-8?B?OFlqMVM0dElHQnhnWDNGWmpVVGRRNHBXdGQ5NExRTThVakN3aTRHd0hUS1Ra?=
 =?utf-8?B?Sy9VYkY1SkFFVEpJOWRaNkpINzliOTc2UitHWTc5ak5BSmVYK1VwckhyMCtH?=
 =?utf-8?B?V1paYU5hT3lzTUhYTzh0ZEFyWFRkUnRyWjhwbWd0QnFISHpDYWtqc3NYbjBm?=
 =?utf-8?B?T0VxU3RoVXhmeTRyRGZJRG5Nc3kwUVVPK2J0OUpGRkdMUUpLb1phVXhFejh3?=
 =?utf-8?B?a1luWjdVZk9vSFh4MjhiZU0renVTNjRiTVlNS28xY21xQ0tzM25OOG9QY1gx?=
 =?utf-8?B?YlhIbFJ6R0ZrZzhXQ2xHOU9yQzNaUk81UDQwTmRRenROeGF4eEppVjJtcksr?=
 =?utf-8?B?Y1ZXNGowRFZya0lpdlhnak5yS3RtY29FMWZVQjhwN2kzNWlnYUYyK0FDVU96?=
 =?utf-8?B?dXQrOUZFeXpNMXNwUWo4OTM5dFRFRGdDVEZIOS95SWZkT1ovYUdwUXpxMFJz?=
 =?utf-8?B?VjNuaVR2RGVqQkFyNkRHVm81QTV6SzZkdWZqZFVqc0dvVVYxKzNPYTg3b2w1?=
 =?utf-8?B?dU1oaGhPWk5GSTQzVXErTk5EeURNQmw1OFJ0N21aT1hscDY2YSszSDRZQU5o?=
 =?utf-8?Q?PIF8xVjMxMIEdLWM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33772b5c-269f-41fc-57ed-08de4d15a233
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:20:44.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ1owL2BG7tH0SA8Csk9FmcwPnn83hrlulg93zzysXbg2f46gsEjYr9fE1JzudXoK5cTtzZV+FWLbDZB1Tp3h38aFxNXE84j04d1Td7PavU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7170

On 06/01/2026 7:37 am, Bertrand Marquis wrote:
>
>> On 6 Jan 2026, at 08:33, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Andrew,
>>
>>> On 5 Jan 2026, at 19:14, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>
>>> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>>>> eclair-x86_64-testing:
>>>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>>>    LOGFILE: "eclair-ARM64.log"
>>>>    VARIANT: "ARM64"
>>>>    RULESET: "monitored"
>>>> +    EXTRA_XEN_CONFIG: |
>>>> +      CONFIG_ACPI=y
>>>> +      CONFIG_ARGO=y
>>>> +      CONFIG_ARM64_SVE=y
>>>> +      CONFIG_ARM_SMMU_V3=y
>>>> +      CONFIG_BOOT_TIME_CPUPOOLS=y
>>>> +      CONFIG_DEBUG_LOCK_PROFILE=y
>>>> +      CONFIG_DEBUG_TRACE=y
>>>> +      CONFIG_DEVICE_TREE_DEBUG=y
>>>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
>>>> +      CONFIG_EXPERT=y
>>>> +      CONFIG_FFA=y
>>>> +      CONFIG_FFA_VM_TO_VM=y
>>>> +      CONFIG_GICV3_ESPI=y
>>>> +      CONFIG_HAS_ITS=y
>>>> +      CONFIG_IOREQ_SERVER=y
>>>> +      CONFIG_IPMMU_VMSA=y
>>>> +      CONFIG_LIVEPATCH=y
>>>> +      CONFIG_LLC_COLORING=y
>>>> +      CONFIG_OPTEE=y
>>>> +      CONFIG_OVERLAY_DTB=y
>>>> +      CONFIG_PCI_PASSTHROUGH=y
>>>> +      CONFIG_PERF_ARRAYS=y
>>>> +      CONFIG_PERF_COUNTERS=y
>>>> +      CONFIG_STACK_PROTECTOR=y
>>>> +      CONFIG_UNSUPPORTED=y
>>>> +      CONFIG_VM_EVENT=y
>>>>  allow_failure: true
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
>>> shows 122 failures in otherwise-clean guidelines.  Some observations:
>>>
>>> llc-colouring.c uses binary literals.  These are safe to use now since
>>> 4.21 with the updated toolchain baseline, but the Eclair config wants
>>> updating to allow this language extension.
>>>
>>> ipmmu-vmsa.c has a git:// url inside a block comment, which is
>>> considered to be a Rule 3.1 violation.  In principle this ought to fix it:
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 7dee4a488d45..8f5fc6c93bc5 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is negligible."
>>>
>>> -doc_begin="Comments starting with '/*' and containing hyperlinks are safe as
>>> they are not instances of commented-out code."
>>> --config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
>>> +-config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*(https?|git)://.*$))"}
>>> -doc_end
>>>
>>> #
>>>
>>>
>>> but I've not tried it yet.
>>>
>>> There's a R8.4 violation against __stack_chk_guard.  I think this wants
>>> deviating locally, because it's a fairly magic construct.
>>>
>>> Other than that, there's a smattering of violations.  Some will be fixed
>>> by some work I've got pending for the x86 side of things, but most are
>>> specific to arch/arm/.
>>>
>> They are quite a lot of violations coming from ffa.
>> I have a pending serie on FF-A waiting to be reviewed/committed.
>> I can push something to fix the findings after it, if that is ok for you ?
>>
>> I will retrigger the CI from the branch corresponding to my serie and work
>> from there.
>>
>> In any case, very good thing to activate all those and check with the CI, thanks a lot :-)
> There are also a bunch of optee ones that i can handle in a patch.

These failures are non-blocking in Gitlab CI right now.  Therefore,
fixes can come independently of this patch.

Once all the code is being actively scanned, I'd like to see about
creating a new blocking ruleset so the rules we've cleaned fully across
the codebase are enforced.


One point that was only in the cover letter of the original email and
needs discussing.

In ARM, MPU and MMU are mutually exclusive, as are VGIC and NEW_VGIC, so
I can't find a way of getting ARM64-allcode to really match up with its
name.

I strongly recommend deleting NEW_VGIC.  It's had 0 development on it
since it's introduction in 2018, is causing problems that Oleksii has
had to work around to improve domain/vcpu allocation in common code
(done now, series pending), and it has corruption problems when
destroying domains (noticed during the review of Oleksii's series).

MMU vs MPU is harder.  I'm not sure if it's even feasible to make a
build that contains both.

~Andrew

