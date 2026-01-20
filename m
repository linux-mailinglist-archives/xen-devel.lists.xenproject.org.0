Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN+9Bzm0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78764828A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208888.1521018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBcx-0003Lx-Jw; Tue, 20 Jan 2026 13:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208888.1521018; Tue, 20 Jan 2026 13:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBcx-0003Jm-Gr; Tue, 20 Jan 2026 13:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1208888;
 Tue, 20 Jan 2026 13:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viBcv-0003Jg-RK
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:18:33 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8309331e-f602-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:18:31 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5678.namprd03.prod.outlook.com (2603:10b6:a03:2d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 13:18:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:18:26 +0000
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
X-Inumbo-ID: 8309331e-f602-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z88yJQQ0IJDQCCo6H/Nm3Q3UZniZm9Hh5isNbNoGLOzMSNR8eD6q/ODj2jky3p71b+fnFb5fsp9fBbm7J0C2S3yGNJGHj86li8LmkRZKfq7pALafTaT/nX3SeAVkQkgNa7pWxgy75V6hYf/WQgE7DxdZpmL7/mFzgsH6CMhy7OnxPwj/TPXyZ8eeMzZZ42uzV1Tx9oHD2cDzLobjMc3S+uI2/nQs4tM+sDtjcc1scW0+BVmp3IGkaTLKAEC4iPEy2cGwLOJmYHER+9twMs2gOyu84xbF0h++xuqi8UE0p5e79W27+yTWH04XVF72UwlDK7D5VCcup8Z0/8vz1Ps59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCIrhLfAYPh3ncIVmSj2a6/5TuraJFCtzQLNfB+5OlI=;
 b=QnLGMwqsAvvIkjVdIrl1rUQuNRZYh9Hxe5GPnqhO6F8Ge/qa5z5MP2twTZMmYxIEKYtK6cdLiGKcQNRARlNWJIWsjt6F7rQ89AoRB+2tTTl9H/iy0JY+UszbEeXWnIgQVEWjoxO2CmNGWekNiNfeFXngH1LCUaJacbcnYCeBGj9XlgL5QmhjtDE0djxuO6zbZZHSZxBBvG/qqh7adnGQRIIW736671zJhajdE8v/DjqC9c3V8XZbfN5LO9H4jkR/19+rjsBFyU5MI5OctK+FxTFPWZR6sosbCNTkWrdXgQBp+MY8Eglnr5GNc2VkRov6XSvhy2ink+X3wRIMHEa+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCIrhLfAYPh3ncIVmSj2a6/5TuraJFCtzQLNfB+5OlI=;
 b=nFXJxDwVvy09JFjfEsik4ex7iGeU0uTYMWd0MrrE/RC1xcbBpaY4WQx+g+dvrxLFBiij8hXIZpUW0OIt/GpObCNFv/avmgadQ2F3QoeUx+N973vyWtzFsYD1UkJ+ijAq7hr82Js7V/8ltfCp6zhulkMJ/WPvLP+lThm97pVyjiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
Date: Tue, 20 Jan 2026 13:18:23 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: e59a3415-7372-448c-4a29-08de58266560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmlQMXVpRDNxalhkdld0OHNXeVNIOUJaZnQwbnlSRk5XWWVaUlhRSmFNL0Zv?=
 =?utf-8?B?YlFIM3I5QzF2U1RGUTFvTmhpV3FNRHRxL1Ewb1Frakh0dk9rNDhHL2lzbEJP?=
 =?utf-8?B?dFFBZGF0NWFGK3JXUHVxS3VaU1NuZmtZblhoUGpiNGRKT2dRNnArcGRKbWNC?=
 =?utf-8?B?T3FzTEdKVnNtZ2FNSVlvWkxqUlM4N1ZvTUFORm5hZFgwUWxucEUzM0V6Y0cy?=
 =?utf-8?B?dDNuSm1yUzR0bC9NUElrQUlIQ2QwdXdaSndXRml4TTF3N2kwdGpzc0V2TkdV?=
 =?utf-8?B?eEZaeUZqT1NuMk1pS2J0bXR2SXpIRmpvYVp4NzZBWkdHYUlySnJiSHhzbEx1?=
 =?utf-8?B?bGZPa2J4czR2cTRpQVVXVzRsT2pJdWIrbHh2a2l0RnN4WHhWaHYzV0ZHV2h6?=
 =?utf-8?B?cTFQUWYrRkcvR3VlVVBsNHVpcjhVbnVaOXVXelVDODdWU2Q0Nm0rUFhkNHhh?=
 =?utf-8?B?eXJUZXFXcTdMZzJZSzNaUWhzVmgwc0p1aCtqY3EvZ0g5Y1lGNnVRWDZhbnhD?=
 =?utf-8?B?WWRhNks5amZsQmVLNGxhK00wU1FVVGtNTGpwVHFjM3Axb3lhbzJuOW5oSUFp?=
 =?utf-8?B?ZzZDTktvcm8vSllmOUYvVnpleWd6MzdtTVdwYXJ3R09PTnhHdGhUamQ1ZmJv?=
 =?utf-8?B?QW95QnV6cVVneGlhdUkyZFJQSTYrRHZWWC9XbjZqSngvN2RCWUhwbW1oRS9D?=
 =?utf-8?B?RlFuRFkvb1BsblJ2ZVk3ckhGZGZSeHJ1cktRa0Z1YVdJM1lGOGhrV1ByNkp3?=
 =?utf-8?B?TWtPNytCS2RlV2NHczVzM25pNTRSOEhHeHNIVk1vR3hQSjRwZ3o2WUo2MXRZ?=
 =?utf-8?B?NFQ0WkN5UHhsd2dESy9OckZYMk11NGIwbjlkamMrVWZ5UnNsNVpuRDdLZUlu?=
 =?utf-8?B?NGp0YTdrNG11aDNpbzRaV2hsRGNZdmIzMThYc1haWTdyMlVuT0piVmFmRDY5?=
 =?utf-8?B?cFdXRzIwNWFnNnBnV0JQdmxlZXZGMTVHWjNscTJDM2QzL0ZQenYzTmpDL0JF?=
 =?utf-8?B?Mk1xWCtoYmZSUkgvb0pnNFJQOWFxQzMwTnhCejBSY3ZndHY3U2g0OWJYWFd6?=
 =?utf-8?B?bGdzVzJzS2dIYmZacnh0c3B0aDgwcExkWVJHdi9hVWcxaXlRdnZ3NzI1SDhX?=
 =?utf-8?B?Yksrci9FZGlXYUxLOStDczQwVTlkU0tkRDBSZThDOTFhTEpab2E5VVNrQUxS?=
 =?utf-8?B?blFlSUNhZ1Q2OHFZSmQyV05kWFhWMGd0R3dSUzVjUmtQYXUveGFtbml1cXI2?=
 =?utf-8?B?cWJhY0NHRjA4bjVSa2RJWWxRV3lvdXZ6UnEvSkxqUG5HMFZaczlEWHdwc1VF?=
 =?utf-8?B?emFRLzQ0dEkzNzh2Mk5wMHhoMFVVeGw4dUVxUWlmTTBRMFJxcHQ0bm9MZFox?=
 =?utf-8?B?Vi95RkdkWE5tMnZDT2toQ1c3UjM5cGd2TmtHUjdIVGRrMk9RL3FMZDRHeHd2?=
 =?utf-8?B?ZWY2R1FyWEF1ejJQYjVRaDhUbW0zaGhiQklMRk1IaGJqZllDTjQ4aStZdzl5?=
 =?utf-8?B?M01tSU92bjFobGE1M2c3bTdXU2J0c1lEYW5lK2ZDckNSK2lyaHp3SXovakx6?=
 =?utf-8?B?VnpoYzA1eDdRa0RrN0hyeEErNS9VN0JPRkVWQXhrU3dkQVk0ZzFuVEFjY2lD?=
 =?utf-8?B?Rmh0bU9PT2Fydm9NUTd2MWtWTDFKK3ZTakFBSFNCbTFMc29VTWZnYlU0cEtP?=
 =?utf-8?B?KzZmZUY4MWJPSnd5c2hYZDRNQmxjM3hPaGVjYTdTUGNsY25vZi9KZC9WQWRO?=
 =?utf-8?B?Q2ZROXhjZFlkOWZWMzNuTUh4bDI3aU5hdTFSYnhYcFFVY0lvZ2padjFzbGRy?=
 =?utf-8?B?NFlxMmp3TEQ5eXp5N0dNaUpXWWh1VkJ1Qy9DVTBPaWcreDFjSXRYWWk0WHpz?=
 =?utf-8?B?dHQ4SGlNNk4rdWZUWERSVHhMaktucHluYU9kZFJ3aWJCNWZ4Tnc1MTdVNnJF?=
 =?utf-8?B?Ynp1UmJrK2V5c3pxNnZyNW9qY01kQzFiSklnNmFGN2dXRE5YVUtjWGN1STdF?=
 =?utf-8?B?bWRFQ2VtVC9hcjJQYUlVd3ExZkpVZ3VJNTJSY0x4SUt1RERvV0R6SDZtU2R3?=
 =?utf-8?B?N0pVNXRFUC81WUZMdUxXN3FHVnBLcTZucUhaQmJUc3MwekFGSzRZOTVsS05O?=
 =?utf-8?Q?Lkkg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVpmSSs2SjJ3RVhvWWMzN3VucGpYM2RLMWEvOFlSdGlUWmVhQldETkVuR1k3?=
 =?utf-8?B?cnFiVVptSnl2TVB0WVVFSXNtdXdWQVNZeTF4N1M1TlV6NEM1Ym1DK3A4amJ5?=
 =?utf-8?B?TVhrYitiWVRSSFVqdldOZG1ubloyNDZ1SzJpWVpjQ0dMTWxZNnFVelE2S0M5?=
 =?utf-8?B?R2twM3h2dnF1TmowcUdEcHdHa25rV1dyem12cjRsaWJ2ZXV2TUc3b29KVjJs?=
 =?utf-8?B?cnc2ZEtHUUhLY04rVDhGR0VhdHVabmhDMUtuOFE0MmZ6cXkvanNwUTd6aERF?=
 =?utf-8?B?REZhRGpVcXpNbVVxWVhlSmE1OGFsblZlOVliUFFjSGhZQ1BlS3NickpTNllt?=
 =?utf-8?B?ckNpZ1hZbnZPQVZOQjR0TnFHc2R4akg4Z2d4cXV0WEx2OEcvYU14elFrcWQ0?=
 =?utf-8?B?V1hSSUVHdXZ4ZGpWLzVmMG1JODV1SVNzNTRBR25xYk9TZE1zVEt3N1hKVmY3?=
 =?utf-8?B?bDh6NFpXSzNvdGw4dXZ1ZndGRjlHcmN0bFBjY1NzVjdsS0M3cm5MdWZnTlhG?=
 =?utf-8?B?TDJMT1orell6V25JREg5WURBSHk5SzdCelRNVUN2RWRmVXpZQWhKRWY5R2Jp?=
 =?utf-8?B?aGIvYU5Eb2FoVlBGM3VKcGN3M0dZNHVoYXFpQTNqLzY0cUk2ZW9zdTZTLzFF?=
 =?utf-8?B?QTU2T1ZRQjZlN1JHcis5bGN6bGdjZXFzd2FVYTczTE40ZEVlU0xFYjgwdnpR?=
 =?utf-8?B?SEEzWXpxb016SFovelZ1c2dTdU5JQUxVSEZnRmlzNCtESUs5YkNFUVVteFJT?=
 =?utf-8?B?aDBvckljYWc1U1VYVW50WFYxRXVIWDZVSWpFWWZDdlBjRmdPRktDdVFZellj?=
 =?utf-8?B?K05WSnRhdnZ1NGhDYXR5QkhiUVdTRDlIZzk5aTEyWm5VZmVvRUV4ankxekpa?=
 =?utf-8?B?ekM5NlNRdzVXMVJPeVNDdEhNS0FNT0F2Lzg5RDFzakhmNjJNT1BrMHFWbE5Q?=
 =?utf-8?B?dWNtU1Y0ekVEelRSRW9EMWhsRDdTZDhzeXFleFBqODVQUEttcytSUS9kU2M1?=
 =?utf-8?B?RzZzWjB6cXB1VUpvL1hYUEVkODJuRis4dGg3U1A3NFlUdngrRUpCN2dKeE9l?=
 =?utf-8?B?NmpERlFrd3V5N2xSZFVnZCszTEFxbEorcUw4eHRwUXFyRFlPSEVRWU9TWGZn?=
 =?utf-8?B?aDV4aUY0NkowYVVvZ2FlU2hXWlFaWGFxckdYWXdnWVVWYjMrOFU1c2g0SGpp?=
 =?utf-8?B?Q09TYXB2L3NzN2ZwV2VFditqU1BUelVLV05TZjZ6VHd3RVZBcGJVYWRyUkwx?=
 =?utf-8?B?aG9reWJyUjgzQXd5TnhDaEE5VTlhOXQ3amdqb3Jmbkx1WUMzSXpLZm1wVWQ0?=
 =?utf-8?B?SlFxdDdDRUtidlJPRlBkM3hqZ3VrZE5CVWlUNmxJSTl2Q2IyZG13RXVBU25V?=
 =?utf-8?B?TFcrMlhSODJKODgvQlM0dEY1MTNmM0l1WDY0eTZnZTI4SWhkdTVINmhzTFBY?=
 =?utf-8?B?R2krdnhoQ0p5YlN1NEt4dG8wdnpJckxzTzYrT29UQU9SS1NkZzRpeWJ5N3Q5?=
 =?utf-8?B?RVgwUWFUeHh3NDBSYm5oVVB2R1c0aThTTmk2d3ZkdWdaelBwUkVSTVRobE1C?=
 =?utf-8?B?WG1EdWRWZXRnYlQ1WlZlTXh1ZVI2ZHZZeWZ4Vm8zTjRteW5hMWs0QTR6S2VF?=
 =?utf-8?B?L3Jrb2NwSTJGcklLVjFBeFcxR2hnL3gwOHorNFVSSEw1S3ZVTUNyL0oxSnAz?=
 =?utf-8?B?MGk5dU43YzJkME0yWU1ISXAzS1ZhZkV0OGlrSGk3WWk3RkgweGQrK2JudUd0?=
 =?utf-8?B?aE9NUUxlOEMvNWdQVmpxQzhWSXkwTDJVZk5CSWhUdFNTdTlJME9IWHp2M3Vo?=
 =?utf-8?B?WnByU2dFUkN2TVBUVGJGdWoxUW1xRFBRbVVxQlVaSVh6T2UzMjNVV2YrMkF4?=
 =?utf-8?B?bDgwSXFzbXZPazhUU0lMSXV4eHUzOVhIbGtYNno2VktRbU41Z0I5T3JpaG9w?=
 =?utf-8?B?ZnBENCtLZGNUS0pBdHVyUGxFN2dLd3BSMmlzekxrSThBNFE2SGovS3lXNTdJ?=
 =?utf-8?B?WXZTdEZac21rVnk4ZXU5VDRkS3pVYmo3TmV2amxKRDc1bHB2WjZ4cDA1WGoz?=
 =?utf-8?B?UHN4VTZldS9xQXNEUE9KM1lRRGYrQTB2VXNod09VQllkMlBZd3ZFdUcvcVZE?=
 =?utf-8?B?aFJoZWl4eFdNV3dYak0zMWk5NGExb2gyeG5qc1Z2WU5ycERja1czc2Q2SHQx?=
 =?utf-8?B?WW55WnpaMmVVT21NZ0xxSDk3TzRnajV1NE5iM1JCbDNnaWdJbkxIQkp2N3h2?=
 =?utf-8?B?RjlJMlJET3NmTS83VWZpbi9YMWkrTHhOeDJjVkhPU2hoUDlWVG90Nko3T1Ri?=
 =?utf-8?B?Ty93VkhqRzh1ZkFBUCtGYyttQXYyUWNvaUdpWGpCZk9xZk1VanNTWkdva2xv?=
 =?utf-8?Q?+3/HfPOJu/KkjaRw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59a3415-7372-448c-4a29-08de58266560
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:18:26.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JER1sKyLRBHZgqgM9K/fyASV1M7h4jP4eVZLc80NRXlksCSGqzExgJpd7FtDCA8uuRQmjyy6FIafmF0qD8U2jtlHvk4Q58GSf8Am7xZh740=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5678
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C78764828A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
> With the threshold initialised to 1 the guest exits at the first
> buslock. Initialising as zero is invalid and causes an immediate exit.

What do you mean by this?  A VMRUN failure, or a livelock?

>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c  | 4 ++++
>  xen/arch/x86/hvm/svm/vmcb.c | 6 ++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 9748df87d8..dbb7f99d5e 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -3087,6 +3087,10 @@ void asmlinkage svm_vmexit_handler(void)
>          hvm_descriptor_access_intercept(0, 0, desc, write);
>          break;
>      }

Blank line.

> +    case VMEXIT_BUSLOCK:
> +        perfc_incr(buslock);
> +        vmcb->bus_lock_thresh = 1;
> +        break;
>  
>      default:
>      unexpected_exit_type:
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index cbee10d046..7a19b1ab61 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>          GENERAL2_INTERCEPT_RDPRU;
>  
> +    if ( cpu_has_bus_lock_thresh )
> +    {
> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;

|=

> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */

Really?  The APM states:

On processors that support Bus Lock Threshold (indicated by CPUID
Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
VMRUN, this value is loaded into an internal count register. Before the
processor executes a bus lock in the guest, it checks the value of this
register. If the value is greater than 0, the processor executes the bus
lock successfully and decrements the count. If the value is 0, the bus
lock is not executed and a #VMEXIT to the VMM is taken.

So according to the APM, setting the count to 1 will permit one bus lock
then exit (fault style) immediately before the next.  This also says
that a count of 0 is a legal state.

~Andrew

