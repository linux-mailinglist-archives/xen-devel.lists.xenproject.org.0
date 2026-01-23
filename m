Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DStCFW9c2kmyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:26:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC587998C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212465.1523577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjLrA-0006kw-5F; Fri, 23 Jan 2026 18:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212465.1523577; Fri, 23 Jan 2026 18:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjLrA-0006in-2a; Fri, 23 Jan 2026 18:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1212465;
 Fri, 23 Jan 2026 18:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sxq=74=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjLr8-0006ih-Il
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 18:26:02 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63c2186-f888-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 19:25:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:25:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 18:25:54 +0000
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
X-Inumbo-ID: f63c2186-f888-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1H5l70A+M/ioRj0Bw45SyxwRx1BDm9okm689c9osNUWgs1hY+MKDPOAqO5dW5mGVAPToNo+y7fyqvYFiWeKRzMvsCkUL6CBYpV0b2sdKOL0nq8W8EZlp32KoSkkbmh0oVjkZ5Ekde+m1kISAg/otmnkUQM1m5TBmP3ephRtecDpeE/W/FawLwHzEgY+wIJlBpiNpK+6CUcpHnrAJyiUlqTa+hsWog+O0q0I29bZfINbRlENTTr87kpIs5spdYieuabhLkuCNj4yIhg2s9Qu/LLCM36f1sU+8l5xDcNoEDFtsZuH6Hm31A5rCo4DemyBZQqt9ww3QE3K7ekzv02IJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLSEGJiWvqcs7gnsaOk3s6ZxapnLQNEoM2a+VgNoFf0=;
 b=NarvaF7wIFQD6hU86hcxe743/o9HhxHTb0Xg4Rq9fytvWFTHJfRQRkDTiROaQdu57zdlePXOZjSgQBw6MLQBjhXg8V5fblyMFVwDqSUs8d1xgm3BR/3TGa8G4v8+4C1ivEU2eQBjnQnvBRPPRmDu9ic+RaktbV/VihaPwUp8OFC7mAa6S43gsFhsmlj1qdavm1rxwG8mxKEDkCOufqGX+T77nMKVD+DZWZ9PD1WNzSQZ/xOc5Ir0+YVhx26FVMKHHGKCU+yKAbKtmYptBAOWOedASPlPM8v9Url81VhGxPBDMrU3AfxyVgAqyT5Z6r5YxJBjbLgDuzmXvGCBFFHIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLSEGJiWvqcs7gnsaOk3s6ZxapnLQNEoM2a+VgNoFf0=;
 b=tYXMpsTdswdSt+Axr+Vbw9JKtXWykJuOLNFQ+jCOWgHtyJK6tXhSDnOivQsLuG/VpvuGDMSbqy5EUcsT2fq4d5kuRwFTub1Ph61hLT7WJw9W/jMkGo7fFjCYNYJJvqouzpvcn2f9P6tFpthA8sr+RKcdIyofU1BsH48bb7fBt/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4a883054-4b3d-4de4-9a56-8427ecfd623f@citrix.com>
Date: Fri, 23 Jan 2026 18:25:50 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
 <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
 <26c416ea-1c4b-464a-bcb9-d34f0600eaac@vates.tech>
 <DFVYHZSG5YAX.3U4HA3MGMT19C@amd.com>
 <c7b98309-849f-4a8f-8898-7e7c0dfd04a5@suse.com>
 <DFW330TRCH3U.3K3D0V9R25IK8@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFW330TRCH3U.3K3D0V9R25IK8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b870bae-8e42-4364-6ebf-08de5aacd801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjI0Z3RhVjJoMHZhQTlmSkxIMkg5dGU4bnJ3Q01Ub3ZuTjB6VXZnNk01OEFo?=
 =?utf-8?B?ZVczYmt4TEZNVnZURmNlQk9QUThPS1lud01mcDBTckZkM1lEanFrMTFzM3gy?=
 =?utf-8?B?WlF5b3RWTVY4WEVCVzhFcXJPMUx2Z3ZsaUtnNnhTQUZWTGZCbWFiRGo5K0ZK?=
 =?utf-8?B?TGpsQWRReTQ5Q3p6OHVCSzI0cTQvNSt0OHZRZFNBajU2QWFyVWdYY0tXeUJL?=
 =?utf-8?B?NW1ZZ01pdGJ1WFlsbm52aDFSVlZjN1pkaHQzdDBsSFg4NEw3QW10eFlZSFpV?=
 =?utf-8?B?VG1SeFRrUllJM3pmRFNiUUpjRk5VVEdqMEdrNmdrMXNKQWp3amZmay9BekJh?=
 =?utf-8?B?ZVlTVnNlNVdUbVVWZjVFY2hUSFU1aTlaWmV0ZEZTVUhtNkwyRGxOTm1hTUF0?=
 =?utf-8?B?cXRDSXV6YU1HdWR2UUNQbUhlNk5XazQ3TEZxai9MZXBNQ1Zid0RzTVVGVjcx?=
 =?utf-8?B?SW9kMzFOekpZc3IxejZNa3lYL1NpdGF5dGZyaStLbWd6Z1Q2ci9LUGZLcGhH?=
 =?utf-8?B?N1V6djFhclVuN0RocXQ3amVSYXA3eVdsZ3A1RzhNdGxvTnJpZ1ErMzRBTDAv?=
 =?utf-8?B?SGJvZy9PMkZrOUZqemRUQzlYV3IraTFSQ0lLV0t4SWVwRWdYb0VOU09hajUv?=
 =?utf-8?B?OG9FNzU5NXI1TWgyUjZxOUZGWElnUFVsWmRDTW9HeTZMdjhFSFcvVWR1bzVY?=
 =?utf-8?B?Mmx4VU1CVnNtV2wwOFBIYTAxZk1wYmpldHNhOHVseGNyZ21wUmlCM2JOa3Jv?=
 =?utf-8?B?Vnp1NW5QSS9qSVFSWlRYUmlwQ3pXWE54eU16TnlQSWk3amFHRUplTjlFem1s?=
 =?utf-8?B?Z2pjMjIwVW9FT2pBVkNFNVNvUFVjNDJlakU2YUh3bldtanptVGEwbzNPT2Iw?=
 =?utf-8?B?aXdPbkUrRXdaRXVLeDIxRFdhTTU5SDJTbEM2RDlWTDlHVC9jOVpVeVlTMCsr?=
 =?utf-8?B?K1BNdUk5UHFzR1RldFVabmhWQnRFQjlFSURLSTFHVVhDenUraTR2RU11OEg2?=
 =?utf-8?B?eFVLaUF4eW0vNG9reURDcU1YcGR4bFg3RjI5Ym5CL2RBUFdoL2dvcFkyM2R0?=
 =?utf-8?B?b0grdU9aZ25jaFFMc2VTYW5pS2Z6c0txVGRlYU41akdBRUJYSjk2TllIbHJU?=
 =?utf-8?B?N2tRb2xkTVoyenYrdFRiR0xydFJUUDdtSzAzRmV0Rmp2a3RhZzFzVy9Sci9o?=
 =?utf-8?B?SjltTnc5eTAySlJnUCt5TnJqdUxyL29DNXRNUDJRUDhpZG5nQ0RPK0NCUnFk?=
 =?utf-8?B?R3ZjM3hySkhZNE10TkNBdHY2bVhmODRGK0hBN1JDMGF1Nk1xUGN2dnQ4UFMv?=
 =?utf-8?B?cS9XVGxRTEVjZUl6Tm9UM2xYRjRSTVJRNnRpQ0M5bno3dzVUTXdiWXlBQnlm?=
 =?utf-8?B?b1ZOVkQzaDNoZWZIc0xEQ3BxTk5HcFA1WW8xcnRUcTFkeSswQ0lXTnVRc3pa?=
 =?utf-8?B?VVNRMzYzakdKWTdvZVJNT3dRYjFjNkxuZFVncmlnc242MzcyaENLN1Rrd0FJ?=
 =?utf-8?B?UWttTzdNd3VuSCtPMmdIMm45SnNwQTg3djZVb0IxcVZ6K2VIclRwc1NWSjl3?=
 =?utf-8?B?RnliY2lPV05FUEsySG5WUi9ucmZEYkZnTm9VQ0dKVVF3L251ekJRdnFxTnhj?=
 =?utf-8?B?cTJST0pYWEJ5bkd4US9KcGpzaVNrSFp5TXUxVTIvN1g4Qi9Jc0pPdnd3ZVJz?=
 =?utf-8?B?Q3ZselFhYmJvNThyR0tiVGJsRFNqOUZUMzFMd0JBZ2pJSjNkRlRnMTQxNmVO?=
 =?utf-8?B?Q05ZazFsT2lOeDBjY1FIdnpHYXRvMUl5WW5ibWJ3TC94QThxZVVSa2p1bmhF?=
 =?utf-8?B?cmFsK1ArOE9HVzdJWTdObnpmUTAzR3VoOW42UlNMbXVnVEhXbjZWUzlCQjR2?=
 =?utf-8?B?NGh2ODZ0WWppZmNzZDNvZHlFcDM4OU0zbTBzbXlGSnNjTzBFeXloVE1SSmcw?=
 =?utf-8?B?R0dhSXRJWUdJa0hXbW9mdmlwaUtVaFVaUy95UkxINGtvYUliQW9GcHFUaEtU?=
 =?utf-8?B?UkVaSjljelk4ditpV1BIdVZWSHZoOVd0eDdnUWMzb3NMNmJnT3h1eGR5M1VG?=
 =?utf-8?B?dGJhR0NGUHlxNkhjbFlsZGF3RXZNUUNqTVFsaXJiWDNOZkVEdy8xeXUyMU53?=
 =?utf-8?Q?yQF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtGeElFNGUxRWQrN0lPNWtkV3NpQVdKaHNmakpEUGpZL3R6TDJvQTNJM0J3?=
 =?utf-8?B?eDhwK202RmlCdldTb0hZQmVicnJBVHVDdXhOdHZtNS9JOWtNUnF6eXZTdmI1?=
 =?utf-8?B?YnY0Sm1kZnRxdkZ3S2xiK1poYnVtTndyZXdFSHpqU0ZvN1o1ZWt3eE5mcnlK?=
 =?utf-8?B?ZGVaZnFEbmtlWWQ0S3Q0bGZHMTFhczlZOTF3MjAyNVgzSk9CVEgzTHFUc1lw?=
 =?utf-8?B?Q3JXVHc2WHZkckdlczl0TmtqT0hicm4wODdZY3J3OHRNMW5JeTdtbE5FQzdD?=
 =?utf-8?B?ai9iSUUxQkJ5V2t5anl3WHIwdXQzbngvTE5Yam1ZNmMrS2doWGE3OE1GZjE5?=
 =?utf-8?B?UkZ3a29QSTZBdCtGWlRzQkpLYWdrY1BzajJqSVFnMlIzMnNuclNsUTBkSXRT?=
 =?utf-8?B?VmhkYmk1dGJqQzNIYTBScGNWME1CY3FSaXI2K21uTjdPWlMwUHlNZk1IdWFM?=
 =?utf-8?B?NTFPMG9LYVcxdlQ1R09TL2VocXAvMVcyWXc2OU5kOG5lRkg4N3VtRHZ6czYy?=
 =?utf-8?B?VVdXSFdIMzBhcldsbFp2STRKcEMwM0hiVEhKZkNzeHAvUVUzVjlQLy8xUkRM?=
 =?utf-8?B?NWFGeDlYYlh5ZjFJdGNkMmVjd01qZTZubUJSWktYU1NYV0VVSDFWdGk0WmRD?=
 =?utf-8?B?cHMrSHV2bERjUHlKcmhqYlBEQWVsOGRsQURURWhzRXBWcWcvUC9hYmNQWGI2?=
 =?utf-8?B?ZnJDV0Z3ZGJwbjhuWGdoS2pmLyswcG52M1JhUHFLbVdnNW5BSEFuOU5rcjVs?=
 =?utf-8?B?cUhzSmt5bUE3U3I1UEJJY1lKU0VEMmtJUlZZWlJ0bmorU01TNEk0aEQ0RFI2?=
 =?utf-8?B?MjJJZWVsbElaVEtqY1A5amlQa3hOSmsraHNvRk80eHZraGVrTGhuRVpUYzZp?=
 =?utf-8?B?WEJXcEhmZUFTYjNCbDRjNkNML2VOaFhtd0VHVitZaTZKRDRLWDlmUjVoUGQx?=
 =?utf-8?B?cnZvYjBTUjFrVjNXWHJjWDhBWXkvSzc0WjJ1c2pjd1NLR0daUzl5SnJwakd4?=
 =?utf-8?B?OC81VFlWNGFtdEVnZndmZHAvbUM1MVVWd21sdllVZHpIWmx1eSsxT1lZcXJt?=
 =?utf-8?B?dWlxb2NwdlRTRXVKZUpGalBESDJ6Vm5GVG5hNnJvbnZuY3RKTFYrVU9CNjRG?=
 =?utf-8?B?SDMyTlhCdVp0UTNvdThwY0Z2bzJXU1Vnbk5sZFVXY3AwQ3MxVTFQWDJyaUpy?=
 =?utf-8?B?cGFuU0FqT3FWOEFJdFdGL0dWYnpvc2xVa1R1WHNhdWxqQjRpalRjVldidER0?=
 =?utf-8?B?TzkzVlJBNVc1bmd5RCtZYnJjVFUxZFVjbVJaelhURWgzNG94a1VlUmRldTJ1?=
 =?utf-8?B?ODNIeEQ0NXZlTTdWNXVWVWtYWFVkeFo0dmRDcm5jUU83WWxBenVDY09ybTVx?=
 =?utf-8?B?cWtkTjZ6elFKOGtCMmUvVkk0REwwLzNTN0xSWTFSNjB4eVZCM1RveHlBekdQ?=
 =?utf-8?B?TWEySHh2Y2ZjamdDMXRURmgzNUJNMlMwcTFkUUk2dWsrb09DcmU4VXFLOTgx?=
 =?utf-8?B?QTd4WmhkZG43QXFYNTIrV0NqOStzbWtVTnA1RXpTOVhpZXA3R2s1bXc1MFJu?=
 =?utf-8?B?bDJZc1ZRbWZMQVc4d3FldS83TFhKR3M2VVlMVTN2OCtnbkZXeDEzYlhpQ3Vx?=
 =?utf-8?B?b1YyZVYwcUxwUmVYQXNEM1BJblJMZ1ZrdnIwd3hmU2JaS2JzVzBNVFpaVnJ4?=
 =?utf-8?B?SVBpR3FVNGdOQTZmdE1lSFJBS3BYR2JieUpIZWgyTCszNUtRTHFIbm9xaHY2?=
 =?utf-8?B?UFFKcm1lS0I2S00wY1FiSEszcHZGelgxSWlJWmJzdHJ1TW9wRyt4cERHU1Vz?=
 =?utf-8?B?bExSNDNMT0dlbUJvejFYb1NSeEJiZk5ucnBvZVVydURTWHB6TVY0REtjeit6?=
 =?utf-8?B?dUptSU1nMWZrR2hLWEdES3hDS20vUzR6dkRDaGpKS2NRZkVTVS9ETWdZc3R2?=
 =?utf-8?B?QnkvRWVuSFNTZ25CWXFjbXdwcU9TZUFtVUpGcFdRR0E3STQzSkV3djd6REkw?=
 =?utf-8?B?WS9scFhkbXZNSjU5YzlnTXhQU1lFKzhjYWpiMzQwZXh4OVd5TEZLMTlXU0NU?=
 =?utf-8?B?aVF3WVdHWlpkRVhucHh3T0tELytlUFo1WWkxOVZnNk5RM1NUUTNCWDNVQlMx?=
 =?utf-8?B?WnAyYkw0OW02aC8rRE1SOXRqNUdlV1BzWGw2UUdNUmN1OXdUMVRhUWozcUt6?=
 =?utf-8?B?b3YzV0hpZnBQbzJOek1QRFJyZlZsUmFzUzBpZ1hwVzg3bGVFbTFwcjRlVjNr?=
 =?utf-8?B?R0UzOVhERjVGTTRzTVl5bW1uMUwyaHp2d3llODB1MTVYZmF6YTkvQU9RQmtm?=
 =?utf-8?B?UFNvYXZvV2xQMkpiTkFpa1FpYlk2OWxhdFdCcmtQMHpHK1Q1TVFpd1BCZWto?=
 =?utf-8?Q?vj2LyX+HMyVFOszQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b870bae-8e42-4364-6ebf-08de5aacd801
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:25:53.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42uooxFd8yiTC6AGFHsVTw5wFYOYwAw7HwFE3mA75kzMVWG3g9mRzGJoTMnIUfSeZPt9gT1FhQSZUnYMgqN8uDkiv2zLelMSCpNoE3qIME0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org,amd.com,vates.tech,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.367];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6BC587998C
X-Rspamd-Action: no action

On 23/01/2026 3:45 pm, Alejandro Vallejo wrote:
> On Fri Jan 23, 2026 at 3:05 PM CET, Jan Beulich wrote:
>> On 23.01.2026 13:10, Alejandro Vallejo wrote:
>>> On Thu Jan 22, 2026 at 7:16 PM CET, Teddy Astie wrote:
>>>> Le 22/01/2026 à 18:44, Alejandro Vallejo a écrit :
>>>>> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>>>>>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>>>>>> Open question unrelated to the series: Does it make sense to conditionalise the
>>>>>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>>>>>> I'm not quite sure what you're asking here.
>>>>>>
>>>>>> ~Andrew
>>>>> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP as far
>>>>> as I can tell. The question I'm asking is whether there is another code path
>>>>> that might invoke MSR handlers for non-intercepted MSRs. I can't see it, but
>>>>> I'm not sure.
>>>>>
>>>>> If there isn't I'm considering (conditionally) getting rid of them.
>>>>>
>>>> I think you can enter this path by making the guest execute directly or 
>>>> indirectly a rdmsr in a emulated path (there are some cases like certain 
>>>> cases of real mode or maybe vm introspection). I don't think that FEP is 
>>>> the only way to do that.
>>> For the emulation path, I think HVM_FEP is the only means to trigger it, as
>>> neither {rd,wr}msr access memory. VMI (as you mention) and nSVM (as Andrew did)
>>> do make sense, but I don't see any others. I don't see how real mode could cause
>>> anything (I'm fuzzy on VMX, but I _think_ instructions do execute, just in
>>> a weird paging-on mode akin to v8086).
>> Iirc there's still the situation where for PAE shadow code tries to emulate up
>> to 4 insns in a row, in the hope to find the other half of a full PTE update.
>>
>> Jan
> That's a rather obscure optimisation, thanks for bringing it up.
> multi.c:sh_page_fault() is rather... opaque to just look at it and expect to
> find anything.

Shadow's hvm_shadow_emulator_ops doesn't fill in the MSR hooks, so
should at least abort when encountering this case.

But there are a lot of instructions which can fit in the restriction to
simple read/write/cmpxchg.

~Andrew

