Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22DBA66F67
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918718.1323364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSza-0000dP-Mi; Tue, 18 Mar 2025 09:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918718.1323364; Tue, 18 Mar 2025 09:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSza-0000be-J0; Tue, 18 Mar 2025 09:12:10 +0000
Received: by outflank-mailman (input) for mailman id 918718;
 Tue, 18 Mar 2025 09:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdr/=WF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tuSzZ-0000bW-At
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:12:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2418::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1052dd14-03d9-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:12:07 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:12:03 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:12:02 +0000
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
X-Inumbo-ID: 1052dd14-03d9-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvVgILuZgWzzd4iqBdg7dA+hh8855jpKkFOw4cYlWuHZb+R+O9GtUbtGk43rio/tH1kD/HkC8KbPz5gG4KTnqHiOOOFdMYSytJMEtzhe0njhmPJF+BUBW7CsIp7PzeDjqlci/sbdDzOUcMxcJ5tAk4LqxXhLEO9yxzT4TzBYLf7J6e/58dLvRZOVTauSFkyiRXWC5v3XRa1sFzColB7louLefkVz6J5uIb5xxYLdTD35E6oC35fUMM/0/kNJCWRD7N/VvMAWUHPlYrAo8d7JSkDak2UO5vjDD7NpyuLrCmMVFWTbLT7ixoWGU89xALWuw9+lGn2GIc1fuJ1JwR2yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLPPgGTK9HylPVrOwJYuBNxEb/0iuNwnUEvckPcU/ns=;
 b=WqorycOOuMPJC7kJNIww7dSoNyC+ZJ5qMHSby+lXQfq/tW11cSovQU1okTzHBKj/pJvtsLrdsDLboZOhma4bNATVZJa4tuRHkanoWsAS+60bw3mJh+EoTJ8ERJIf0BNzwg8Aeu6yMEMfg6JIt6CSIjcS834bTw/LXYUx2SXkyn55nizfiRcTSGIqttk5IIgrT3TOMhbs7sPknkg1aLuF/+eheaiDr7X425QOY8hnw8pMiZNaNKe4ATsYNYHjW5OduKu7/ofNRKsPGH2JCp8wpnp3dlDhNBtkhIu7gvovVLRZSlatC7lRSXP5XEXk11LopqvmAfsdOjQOsUpLbsDypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLPPgGTK9HylPVrOwJYuBNxEb/0iuNwnUEvckPcU/ns=;
 b=0W/TuzETukpTyFSC0CNOAhc+VQcjVVYqUmwYhbN+TB5WOvqo02syQ+KaEqdueK0pi8MRbW2StqhrjynnzJmFyFk9hOfNAHQgc4J7oddiYjxVgAtkJ2OshzoDtCytMcUZpkPW/35SsU3kKYUdtMSDsUaWy37YYoemD3Ink78l9sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7e1e34cd-1582-4308-8fa6-260150b88967@amd.com>
Date: Tue, 18 Mar 2025 10:11:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Wei Chen <wei.chen@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250317200727.798696-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdd7216-e24e-42e4-94fb-08dd65fcf239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGR0SForS3ZsNGZkcTZ1S0dmMHV2OVRBTlprUmJ5Rk15bTd2VlZTdlNQRWwr?=
 =?utf-8?B?QlhSTG9rOFpZZU10UHRiUk5iQW1HQmN5ZUlUbU80TW9OQTByL0NEZWEwcW1N?=
 =?utf-8?B?TDVaZllaYWl3Kzc0ZUlCeXZsSFVtQzZKaWlIZVIrckpnSjNxOTJKQVZ2NzRy?=
 =?utf-8?B?aHhyY0tSZTFSVzVtQ05BME8rcjl2Y1crWEhGcHZFdGdFWFF5RXNUVHRGY29W?=
 =?utf-8?B?b0FzWERBMEpSd1JLWDVKeVFjbWZZSFE2MW1hZnY0UkxjbjB0YWJva3E5blFp?=
 =?utf-8?B?NlEzYi9vYzlwc0FXZ2pmMkZjbkJBMlFMMHhkWFpOYUdKQmZMNk9SQjBmZjJQ?=
 =?utf-8?B?bHQ2S3ExQWFmTXYzT0ZuT21TWGowaGUwVlNNYnlCUmx6UDcwdDU2bHZReS9a?=
 =?utf-8?B?Z0pyRERSSjBWVHdJQmpJNnQ3ZlBGN3IybUpVak9CMFptdFUzY2dkV1VSYnlJ?=
 =?utf-8?B?U3hDcFRwdzBKMUhZNkppOGZWaVJlRldQbFl6eExuT25QemJUNW0rU0hpV0dJ?=
 =?utf-8?B?dlNBU2hBeXNQTkFDOVN6UVJsbytLMXF0a0YxV0dZSmtRTVVHazdvQng2NGpo?=
 =?utf-8?B?MVJWMjN2TWpjaVI3K21KVmg5bWROWDhtSzNaMnFFblR3VFMvMWs5WVU1UWhY?=
 =?utf-8?B?K3VBcGdyK0dwU1hZb0NxcTZGVWVHTzcwWFVWVFBDOENJUE5ncTE3TXFCQlZT?=
 =?utf-8?B?c3o4UnIwVWhQTXVJTWN1SUNWMzFRYjI5MENscHIwM0VWN3JMcXFSM2s5aFhh?=
 =?utf-8?B?dU40MHdua01HRy9xcUNHS3doVHlYQXlpUVl2bkpXVGhOcndoaEpoaGc2NXF6?=
 =?utf-8?B?SWdJbEtvOHBLaXZ0SkpsMFpRMUYvRjE4cU9udGtNM1phTGMxUzl0UDB0b2pD?=
 =?utf-8?B?YmlFTkRwQ29LcGdlMWo2TEhlWktYVXRveDJJcFZ1ZVFQQy9WMGNXY25ESWhE?=
 =?utf-8?B?U1VkUGpPWStXTzF0MjlLYkh1TzErZW1uQVZrU21ueVF5c0hIVy9ieDJybHEr?=
 =?utf-8?B?d1U4Ry8zVlAwSitzZmhlanYrK2RBYzNmUGZudFFyOCtrd2E3VGhjemZQbEo3?=
 =?utf-8?B?dU1Md2hOdTd0bXM1WXIxazB2b1hUbG9TWlVvbmsvMXhzLzhNSGZ4UnZvSjds?=
 =?utf-8?B?OFlqOVNsMERLNGIyQXRlT3kyVjZBb0ZMdERwc05vZ2ZrbjNoRmVoSmdrME51?=
 =?utf-8?B?V0U0T3JBTlZnQ0ZBeDVkUVB2amJhNUROVGozbG43cHIrS2VBNHk2bGlPdkVL?=
 =?utf-8?B?VWVNdmdVTmZGL3FJSkswd3JCeFdZVXJnYVlWeUhUM1dXSU9zT3dYQU82MGVC?=
 =?utf-8?B?QzAwUXdRa2lrZUZBTysxMkFzaHVINDVNckc1R09sOFdRUXdOY25KVjAyOWNX?=
 =?utf-8?B?V0JVcG5YcHNIRTFsMzRqTE9VY01CejZ0by9lZkNya3JWbC9vWmc0SS9TWlVr?=
 =?utf-8?B?cWpMUnBCSkFzMlAxWUovUjZzY3p5VGZMUkQrOXYwTFpha3grcTVGelJxRGEw?=
 =?utf-8?B?eEwzRUlJY2JkZGw0QnNyQzJTSVlaSlAzNndrSGFLQzcwTzNvR3l5MkVPVHpW?=
 =?utf-8?B?cVVMRUNHdU1DMWVVaGl1bVZ1TXBQK0tnb3hBUGQ0SlhSZ3FHVEt5a0svZDJr?=
 =?utf-8?B?ZFJESFp5bkhYdEFHdjVsY3M3VXlObzl2b2w1bjBBVE5jZGhBeHBOcnBDNUJo?=
 =?utf-8?B?WDE2NHNPaDU0Y3gvV3QyZXpMb3VrbUIybHZSczZmc0xTcXpyTGF4YmRSNDZH?=
 =?utf-8?B?d2E2eUEvc1JFQUVuZzg0ZHRiOTRyYStkTS9ZNDhWdkExNUY3SmhFank1YmdC?=
 =?utf-8?B?cExaUHZqbGE3bE4vbU02a3hMdHprWEgzZUduaWloNitEQkVJdXArYWdwQ0h2?=
 =?utf-8?Q?j1+37SVISqhJJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emVMWXhFaERRQ1dUd21NUHgvYUFmaldjREwxeWdpRHdIc2lVNUJnVFJzWE1t?=
 =?utf-8?B?ckppcEoyK25Wa0M4cDdNVm5LMmRXYnEyYStZREQzc2dFSVhEa3JibVdoaWJr?=
 =?utf-8?B?S3dDNmUzZWFoaTVRTElLWWhQeU1jTGNQV1BITkhZOHpseDd0aDlBY2lic3FZ?=
 =?utf-8?B?eGVqU3d1YzN0VktJM1RmNmhHaE9MNnAvT25JeHZlakc3Tmg4T1VsRllTbDEw?=
 =?utf-8?B?aXU0ajliYWRodkdTU0xaZDEzYmNUUlp3S0t2azlHWlFTOTJpNGw3NlA3VERX?=
 =?utf-8?B?VmdwWE11T0dLUjROdUM2K2VTeC9XSzdzL2V3dUtXSDUyclR0OGx6OEhyekMv?=
 =?utf-8?B?S2lHQTZGQS9DLzhFVUxaQVVOTnpGUXhqRUdiOGVrRWNMc3JLOFg5QmRqRXI4?=
 =?utf-8?B?VEVlSndRQzhISGhuNm1FWjBkQ1h5M3I3VVFqVWxpUFdiWm5IMDNjL1NBOW5t?=
 =?utf-8?B?ZTViclFCWXZRV0ZseGMrOFprY0J3S2EremQ4MHp5bGg5QlQxRndGM1BCU1dY?=
 =?utf-8?B?dzkzZ21LOGF6Q01FVzJEVUJPb2FCampCOGhUMjFyMnA0b09RcWhOS1ZaaTVD?=
 =?utf-8?B?cFNvMWdoR0pTSFp5UFpGT1d0QVh0cW1jbjVia1ZYQjh1SGphT2xVa2dWeCtw?=
 =?utf-8?B?SGpjb1l0bW9ibHhCb1hkMDdLMGVYY3JKN3N4cEZMb3o5SjhVOHBtRnZTQldi?=
 =?utf-8?B?NTZMWjB5RkxGN2xQcWRoeHhjWnZjMlRaMVMrWmpsNXFEWkc2cUYwVy9BSS9t?=
 =?utf-8?B?RTJOalhScG5RT2gzY0lEaVVaTjlwTzdZaWY1RFJPNEY2T0FRTEtWWFFmaFZI?=
 =?utf-8?B?eVNENGlFQjVFSDFmOTB1OVBiL2ZTdjk2bE0rcHRVVGxXcXdxZlcySnE1Vlkz?=
 =?utf-8?B?UWJaaFZaNEdjWWtqaHdEcm00ZitsMitod0FJa0xKU3hveWhQS25HdDVIS3Rh?=
 =?utf-8?B?NmdYc0d1S253cXV4WGF6dlRFSk8rSC9VUEFBWllCVUxCOU9vd0hBcVFEVXph?=
 =?utf-8?B?WkpSY1RkaFJyRnRLdkJDRDIyZmhWRk4vTU9kTjVGYlBqYUxWek1qTTc3bTRn?=
 =?utf-8?B?dHFGSWhoK3llNkNQQUIyZ0pzZVZubU03T1FENmpqU1ZSR1ZRMDJOVE9EM01u?=
 =?utf-8?B?N2lpSG50ZHFBWEVMekFzc1hia1g0a3NxelF0emQwOWZHcFlteWJrTUhxc1E2?=
 =?utf-8?B?VXBDRm9WZkFla1JzYU5LQm1UazA4cVc3MWp6STNYYmZ4aVRSYURuSy9ndEt6?=
 =?utf-8?B?NWdtMWNDVDVMNVpldFZIOGVNK0dGNENZTnFWSHJGOE00WnNRRXFkZjdGalBv?=
 =?utf-8?B?L0xiaGNZWnJ3L2VCWldzZGtaMUhFZWhHMXJ5VzlodmpsZnVJTmNneXovZUdm?=
 =?utf-8?B?MDc2dmI0b0x5UjQ2UEUzYThyNFFNQ2dpbFNrdllZMkhOV0NEVTY0T3RYUmNo?=
 =?utf-8?B?ZGdyQnE5N29GQThnd0xDbXh1OTlHa3hKYy9IN2s2Z2dCSmIyY1Z4ckE3N2Z2?=
 =?utf-8?B?ZlRNVUNFT25IMWpmV1NJenp2ZnpJN203c3Z1bVFsVEY1ZGp3cjhhamxvZGg3?=
 =?utf-8?B?eUE5RXRmdFNhMmZwOHFyM0lvRGhFMUo3bDhmcFo1Rk0wL2lLOHA5Ym1TNndo?=
 =?utf-8?B?MG53Y3gzQ3llY3hLVGhqZnY4SlBlTUNISm9nOWljWHo5aURTYjNHTkcwQ05J?=
 =?utf-8?B?bmJEbDlGbkt2bWtaeG9nenZzMFRwMXZSVUVOVEhyYm1WcTlBTkt5Sk1QRTVF?=
 =?utf-8?B?UmtOdVJYeUFHMFJzaVcrNFFVRkZtRVRHS05KSVlROWpSb21HN3ZwWThFN3Nw?=
 =?utf-8?B?WWFFNWxGL2QzbEViVnhZb0c5VnFOYWdqV3A5aStxSFdZemdsN2Y2VVV0cHR1?=
 =?utf-8?B?emx4d3FpUjNQL2JVOXEyRnpGS2FjeGxwdFpDSGlYK1ZNL0Vud1JzTFhaNllx?=
 =?utf-8?B?YmVZZWNHNmM0d3VFWFdmMWxRSnR2WUJrQjJFYUJvL2xYRDZiZjVsd1JWb2M3?=
 =?utf-8?B?ekE1cXBLUGxBV1pYd25PbjBTVHNmK3pJRVdLcjBrWEV0SVFKallkUnp0Wmdz?=
 =?utf-8?B?UVR3dHQvNllRdXNRNS9WUWVxMHVTbGFUczZpQ2tWcGIwZnJtM0NpSER4cEFk?=
 =?utf-8?Q?5oSNcET7BKZOXySNcBveP0XZ2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdd7216-e24e-42e4-94fb-08dd65fcf239
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 09:12:02.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujeBTIdeM/qiT+A+E5T714qlQS96q/qJSwTL9uhHkYHWs6y7Kyz7Vy/VWXTku8ao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791



On 17/03/2025 21:07, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> ARM MPU system doesn't need to use paging memory pool, as MPU memory
> mapping table at most takes only one 4KB page, which is enough to
> manage the maximum 255 MPU memory regions, for all EL2 stage 1
> translation and EL1 stage 2 translation.
> 
> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
> MMU systems, x86 and RISC-V.
> 
> Wrap the code inside 'construct_domU' that deal with p2m paging
> allocation in a new function 'domain_p2m_set_allocation', protected
> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
> the former function with #ifdefs and improve readability
> 
> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
> with !ARCH_PAGING_MEMPOOL.
> 
> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
> field is not required.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v3 changes:
>  - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
> v2 changes:
>  - make Kconfig HAS_PAGING_MEMPOOL common
>  - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>  - do not define p2m_teardown{_allocation} in this patch
>  - change commit message
> ---
>  xen/arch/arm/Kconfig              |  1 +
>  xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>  xen/arch/arm/include/asm/domain.h |  2 +
>  xen/arch/riscv/Kconfig            |  1 +
>  xen/arch/x86/Kconfig              |  1 +
>  xen/common/Kconfig                |  3 ++
>  xen/include/xen/domain.h          | 17 +++++++
>  7 files changed, 73 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5ac6ec0212d2..a4af0b85f158 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -75,6 +75,7 @@ choice
> 
>  config MMU
>         bool "MMU"
> +       select ARCH_PAGING_MEMPOOL
>         select HAS_LLC_COLORING if !NUMA && ARM_64
>         select HAS_PMAP
>         select HAS_VMAP
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 573b0d25ae41..6eef6ba91444 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -673,21 +673,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      return -EINVAL;
>  }
> 
> -static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
> -                                             unsigned int smp_cpus)
> -{
> -    /*
> -     * Keep in sync with libxl__get_required_paging_memory().
> -     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
> -     * plus 128 pages to cover extended regions.
> -     */
> -    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
> -
> -    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> -
> -    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
> -}
> -
>  static int __init alloc_xenstore_evtchn(struct domain *d)
>  {
>      evtchn_alloc_unbound_t alloc;
> @@ -841,6 +826,53 @@ static void __init domain_vcpu_affinity(struct domain *d,
>      }
>  }
> 
> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
> +
NIT: here and elsewhere. We don't usually separate code from #idef/#else/#endif
with empty lines.

For Arm:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

