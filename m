Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BDD30393
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 12:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206459.1520017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vghp4-0008Rw-OP; Fri, 16 Jan 2026 11:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206459.1520017; Fri, 16 Jan 2026 11:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vghp4-0008Op-LX; Fri, 16 Jan 2026 11:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1206459;
 Fri, 16 Jan 2026 11:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWCt=7V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vghp3-0008Oc-67
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 11:16:57 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcdd5312-f2cc-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 12:16:55 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5841.namprd03.prod.outlook.com (2603:10b6:303:9f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 16 Jan
 2026 11:16:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 11:16:51 +0000
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
X-Inumbo-ID: dcdd5312-f2cc-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiBSgz7pRuSLF1cyxWYeSG6G8LRGU2xDjmnj2PWHBA8nE9w4ZKvTF1HUEZdtK6c96BqZGA1mMO1BPTcBHEcpU3zDF5yLFbzgCgZO/4dceDQFHbTYW+No7DH3nTmmL/uxvirHtdjKNu7LoKRStK5OdeADZdfBmf5PayUQK2npMnI6aR2YC6l7EGOd+yGpAcrfe0s4cFO1sAubm6qF0KfA5glK51lrDXhboD9WjigGmzplRsvIFKt6u/b59UxtYFMnreRPyprafSIxEo8H4OljWxMtLga9AR/n6mmlxAUPVGSwMixHf42jMgdVtoOmNjvvGjdA7hK58UW++Byr67BEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3jZvyi1+TRpa1wtyNUJlSDD43ttt2aBdW8nrRsEy7Y=;
 b=UZofZb8CBuw0KShjxrH1EWPcqtDUjrLhumzNBSRSRcT8jaDJHTiQTrpETsmDBdsv3aJiY62SguhF1KsgH4C73UW0yEfvQ0Q9fSzeTcxa9S9oYrwD9o4QWvJPiSLGP9pKWvndnlmc7vtj1Y41tUnhx1VBSQLJxK88VpkL4Rhbn9Yu+GwLZyTbTL5ru++8f48TIPWUkqpgVbdmofJm3wlIUBH3dUDjnDbGWbS3MIglUvygBTQPKxyjVaMMvN7A8hlsRyNC+pUccarQ1f3F6H5/CgPl9ydGIIph3nDao6Dt/W+M7D6QvrsGWm2uPRn1CsVIiaj4d2o6NPERmlGHTMOPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3jZvyi1+TRpa1wtyNUJlSDD43ttt2aBdW8nrRsEy7Y=;
 b=cqy8GW+nW7d4e+h10hw0aylqGdOexs0XUspiUJgcXVQj2gF3AEE7rFlxl7rFG52B6//kW4ekdH06/9WzVw4sg4JzNp1nSHEoGCfjakOGT7KjGxL/aFhYUrMmc7SNYQmLZNxeb/QLC4qMtbUkAJVHWI0fVWyHNwaPC5DgexQrIAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cfad266d-5818-4609-9e4c-29a64724adfa@citrix.com>
Date: Fri, 16 Jan 2026 11:16:46 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
Subject: Re: [PATCH] build/non-x86: fix symbol lookup in presence of build-id
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0160.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 676c3136-f273-42a3-e361-08de54f0bf64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akFKRU5sTE9uZjBkRC9aVmcwQXJNQU5xMGV3eHp0Q3pGdi9GOCs1OWN1SWFL?=
 =?utf-8?B?cnErZGFWU1dmU0JlanlaelgyL2VEZWxMQS82ZWNtdzhQc3RIZkJYS0dLcXdl?=
 =?utf-8?B?WmttYXRkUmEwbFAxUkJDZEFLZk5kM2xGSWdDNjA0NnRsNXBIMGZUaVFnVHU1?=
 =?utf-8?B?WlpPTzAvL2NLTmhCd1oxV28wUnpmOFh3TFUwMHlFLzhQT2d2R1hLNkQ2RjVj?=
 =?utf-8?B?aURwbXVJNVN2M0s0MGh2ZUhQYVJXL0FwbEM5bHdBNVg1TzdKRDVMbmNOenFC?=
 =?utf-8?B?N1JVSk4wb0NaSHhFUldGcFRHK2lzZVhkQm5UOWpEY29yK0Z4YnBPZlhOTGU2?=
 =?utf-8?B?akZDN052Sys3KzBHbjYyV013bXFnK2JSSVhON3NMZ0pSRVZUUlUyNU9Balls?=
 =?utf-8?B?bURSaVgzZ2RiaXk4dzlxNUZxbEhFNnF4Vng3T1VSaUpJa0tLVm5adFp5SHN3?=
 =?utf-8?B?UUdaM1BpWjJRZE5oY2ZZSXBpSkFSWTBYZXA0b0VTazhwUkhYbVBQTUhMbEkw?=
 =?utf-8?B?NC9ZYndRZm1aRHBiN2R1Q2N5MVA1Yy8xT2VZd2Q2VG9QeVZmQit4bjJJOEd5?=
 =?utf-8?B?aGNudzBDL0JHS1RET1FSSmY4TVFKMEpGQUNTNDN6SHNiM2pxVVNQcGRYQk1j?=
 =?utf-8?B?NHFSc0tmajVQTVJHWEdxQXQ0blJuUnVUMzdEUSszQ016OWFJREhtaHpVY0sr?=
 =?utf-8?B?ZHQzZ1V5TTl2V0t3R21JL29nSmQ5dDc5V1ZsYjlPellENElINEVHeENhMFIy?=
 =?utf-8?B?b0pzWk02SzNzbElCdkpzMDUvZWhLT0owT0N1VjJHeittNjRFZEpUVG1VeC85?=
 =?utf-8?B?Nll0WUhVYXp0Y2pabnVONEw1M1p2UThQTlBSbzNSTGd6QlZ1cktBWnVhbWZD?=
 =?utf-8?B?dTRvdGd2ekxBMkU4YklEbkhSWHBLUEZpcVozeFFtZkRFUzYwc3hDbG5JS1Yy?=
 =?utf-8?B?d1dVZnZFUDZ5WnpZbXZQU1pPUTZGY2l6cXZEN0VPaTV3ZG05dGF1NDI2LzN6?=
 =?utf-8?B?L0RYM0RxWHM5VWJsZlJQRGpXR044WWVmakpuL1BGRmpWelJLRjNPOFhualds?=
 =?utf-8?B?QU05QWZ1czJ5SkQ1TWNndFZHM1YyQitLRjJjekRwenVoT3hwV3JpSFI3UWlk?=
 =?utf-8?B?QXpiL0xwdlV5MFBWa0haNTNWRUhoTGtXYnFkWXlRUG55S2l4Ny90OCtMR0RP?=
 =?utf-8?B?aWVTT1JkVkczVzJSb1RvNkpQMDNTQWdUMUNrZXJkNmFlYVJ1QjVlTFZHMUkr?=
 =?utf-8?B?NkNEYWMxM2xDMEEvL2pRSXlKdWFjWEZ0UnA2bnZibUl5anZjczY4Q1R4N0RC?=
 =?utf-8?B?QXJoL2dpRThCTGVBYU1NdWw3RExLTHdPa2kxV1p6bGgxVlRna1NpSHV2ajBm?=
 =?utf-8?B?cFhOV2g2dDBZbmFXaUp3Q2NwSjIxQStEbjUxSEhVejhzL3VRcTlJYm5TdUlZ?=
 =?utf-8?B?VExpeTVDZlNoQlVwTTFTdXI4WStSNWlhN2xpYkZWcGV5enhPMWF3Q09sOHFs?=
 =?utf-8?B?a2FYbnFNZmNvUVRTMWJZSVN1RGc0RFgvOTVVdGYvdVdDQmZaQStLQ0p1N2FX?=
 =?utf-8?B?aUFoZHdZZnh0TWRmYmk2azhvNzFwb2F4NzdRTWtXVGpjNnNDdWZ4VDBXRnZo?=
 =?utf-8?B?ckJDVDMzRHJ2VkxqR1F4RHlWY1lWYTVGSVFyUWNzT0hZOHNiK2h2clR3UlBV?=
 =?utf-8?B?YlNqT0hWTFlveGp4eThZYnFZU21aamRsVmpqamc4ZXV5M0psZzQ0dGFjRzhH?=
 =?utf-8?B?Rm8wbnR0LzRrMTlyaUYyM1NPYmVGaTRucUtSakxwVkk1RkVpQUwyUDVzNzRt?=
 =?utf-8?B?WjJHMGxnZlFUb1pnLytNL3pEcEFTVGZLdzdPemFzWUdZMjdhSDBTT2tteU1Y?=
 =?utf-8?B?TTAveTNqTzVRbEFVU3pCWmFYZ2J3NnkwaVhkOUgyWjUyUmNwOFprUk1kcmRW?=
 =?utf-8?B?UStNL1lhajBtUnY1ODBYY1k5N2M4L3NhUFBNa281VHJjWDdKdkd6WW8zLy9Y?=
 =?utf-8?B?YUZUbHN2T3UzZURKLzlpRUVrb3hWVnJpN3p1QlRMYXdTSVF0UTNmaUxaczR1?=
 =?utf-8?B?aFpGMEszYkNCSE9KTm43QjkzY2lLY2NEL0Q4NTcrMzRlWDU3UlVJV1FoME5T?=
 =?utf-8?Q?rxc0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmlia2tUTGsrODdTb0s3T2g5bVB4cmJjUVV5SVNsTEtMdEd0S1ZnTEJTOWtx?=
 =?utf-8?B?S0cwa3pyd2swUEFHOC93VW4vUnpMN3lpdFFPNkJTRzArNkxHS2U1OWpDVGtv?=
 =?utf-8?B?UW5RSEt4YVdhZUNzK0Q3WE0vMWV3VGMwZHRpaDNXWHpXK1VySnllMjJXMVJw?=
 =?utf-8?B?VUMzRU53MDhqVmFublBYaUM0MlZCTDM2QTlDZTVZK0tXQzlvZHJhQWM0Uzc5?=
 =?utf-8?B?VVB4VnhPeWtGMjVqMXpIUmNFRHZaK1U4bWQ2VG9xakNEeEh0T0lFcmJaQzB0?=
 =?utf-8?B?dVh6M0VDa1pjb0ZUdHhhTGNKa2F3RDBCYWRZekg1ejJINHpmSGl0d3RpdWxo?=
 =?utf-8?B?MFFoZzB3Mm1BempMZWFPTnFIMVlUeEFCUUIwNGowMEtJKzhLd04wTE4vZ25M?=
 =?utf-8?B?WmZERnVualh5U1Jub3FldnptbndwelgrdmJFditzd1NqUWtVYjhxcFArM0Nw?=
 =?utf-8?B?YUtLZCtDMFNzOUdzMW9qL2JaQmRTeFF4dURJTlk3Ri92bXZBZmhBcFdPRzcy?=
 =?utf-8?B?NU5rWnlRUXpYWnBJR1RyYis4S2RuaDVodHcrOVdPazZiV2tWOWFJQk0ya0xx?=
 =?utf-8?B?NGRVVnVBanBUcElKejhQRktvTVVBNHN1WDczYVQ5SUx6RTBCZUw1M0FycWRB?=
 =?utf-8?B?K3FEU1ZQbVhOV1hXV3BNMVNMMlRlR3ZFVklOV1ExaGVndmVnVVBEQTZLSkth?=
 =?utf-8?B?TkJIVVV3RGtLNjRnZ2dWRmczTTdyNkttVVNzZVR4QjZoQnFya0tnNUhhclVM?=
 =?utf-8?B?Y0RYdHNPK0VpVURlTmtTa0pXenJHa0luWktJeDBISSs4R2R0dTR6WWRLZ0py?=
 =?utf-8?B?Q3NZRTF4QnRJbXc5b0JNR1J0YUtsayt6am1uc3ZXazYyYk0vbnI0cHQxcXdW?=
 =?utf-8?B?OGpIUVVPNjQ2N2hHcUNQOEg3Zmpoajk4dUZ0aVE5TEQzWCtHL3JjNzQ1Q0tz?=
 =?utf-8?B?RXU3NnhMK0JPbWNVQWF3VG5Yd2I1Yi9jeHpLb1pQWmd5UGp4aDJJS2xGM25u?=
 =?utf-8?B?Nzh0TzNDajhobTVhbkJ6c243K1p5Qm40OHlIZFU2dkR6NjhIa1c0bEZUb0cx?=
 =?utf-8?B?cWMyZ0Z5UkJiUkxkRWFvY01nMjRDNDM1K2loTXdYOHhPYXc2Y2p3amRHc0Fj?=
 =?utf-8?B?VzhvR3A3aWFIWi9HSmxoYS9ZMWErd1UrT2syclF4YTJ0NHIxbThVQmFuZHIw?=
 =?utf-8?B?NVFLaXN3cGZDcm5VcUdRT2Rvd2ljNDJDR1BlRTVIc01DTVBJTitKLzQyWWxp?=
 =?utf-8?B?S2h2VVpmNjgwY0l3bjhIM1g0bkVHYXBLS0JGVC9BWmt0VnpqRmd1TldOdVB6?=
 =?utf-8?B?Nkd6SjcxMnpzTHhJQU9xb3lZQ0NzMTIxRUtSUEY4bzZWMlM2T0M2cFZaVy9W?=
 =?utf-8?B?OUNvbnlQQmpzVGozeWhwdVZrNm5JQ1Voc001R3hvb1A3SWtnWSttV1kzOG94?=
 =?utf-8?B?RDA1Q1hhUVV4Y0VwZndLYVdveEk3N2tuU3B5bExxVHdRRklMZWw2bUIzN3RL?=
 =?utf-8?B?cDNTWmZuZFU2aEJ1ano4a2pNd3RFR3k5VzRwejB2bXNHakJQUUVjZEVzak5E?=
 =?utf-8?B?cTlGUDdINkNKOFV0MDFLYXRFUWt1YlpGdjZORkhhRWdWWFJhbzM4R05JVEdq?=
 =?utf-8?B?UVFJVnRJTkNSbFRpMDZEcCs5bWt2WHk2TmpMU1Qwb2p6VzJpNCtneENwcWps?=
 =?utf-8?B?bnBJWklBYmFtWHJwZDE4Vkp0cXdKWUlWWXJ6cDlXaThmbkFMVlN6WmwzR2c2?=
 =?utf-8?B?VFgxczAyaGlNMkplRSt4U2tOVVdoVVdqejZoNG5OVHZYa0hyVzBwbTQxV2tI?=
 =?utf-8?B?SGN3WnNTajdCNTZGNlYrVnBiRXR0YlBwRkppUFY1dFFud2RsbStVUTRnNUtN?=
 =?utf-8?B?amxLV0o1SXJTTlYra2V3cG1jWVhWT2ZORGtvdzdiTHppVFRkRW1RaENyS0tU?=
 =?utf-8?B?MFFkVC9FZEM0Y08rUHJDQm5NOHNoZkgzbmF1ZWZ5OVU4UDNYZndJVGFLRzdJ?=
 =?utf-8?B?NnJqVDZsV204RGpYUjVMZjkyTlE0SFF4aGdvejlSVkhoSlBBcFk2cDQ2anEz?=
 =?utf-8?B?a2dnTUlrNXJ5S2svMWdKZjBEeFZ0c2VGZS9LU0E3UHBDcmR5NHIzT0FxSU1E?=
 =?utf-8?B?TnorUjRZVXExcG5kUnoyMmN3NytLV2dWVXV4Rk80R0tKL3lHVTlnYXdMM21o?=
 =?utf-8?B?RGdmVko4MzJqc1lDeStPYTNxdEduQXd5RDFTVEVUREc5bmVQN2FqWWFwa3Zq?=
 =?utf-8?B?aG9KalUyWmhqc0ZidGptREc0UVJJV1N5ckFBenBPSWc2Yms5NXE5bGpWbnh6?=
 =?utf-8?B?dXZOTHRVVE5POVc5d1VxaCtsL1BDak5kU1VGN2RtZitxQzh3R3ZWZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676c3136-f273-42a3-e361-08de54f0bf64
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:16:51.4830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDWfEGr5ctZab/7zPXWC1JM38bxYdsQpJoIg+4fEyVjwKR8Vv3lVqsVVAJJ3ili92oUIkfXQIUKsBWr/Nt4tVbvGCIAelqFZbqqIY8pN1mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5841

On 16/01/2026 10:52 am, Jan Beulich wrote:
> It's not clear why only x86 had $(build_id_linker) applied to all three
> linking passes. Not doing so will alter symbol offsets between the 2nd
> and 3rd passes for, potentially, all of the symbols at higher addresses
> (intermediate alignment padding may mask this effect, though, so it will
> look as if problems appeared randomly).
>
> Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
> Reported-by: Mykola Kvach <xakep.amatop@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

We really need to make this step common between architectures.  It's
entirely magic, but mostly common.

~Andrew

