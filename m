Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B1C95394
	for <lists+xen-devel@lfdr.de>; Sun, 30 Nov 2025 20:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175466.1500118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPmeY-00007B-4Q; Sun, 30 Nov 2025 19:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175466.1500118; Sun, 30 Nov 2025 19:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPmeY-0008WM-1c; Sun, 30 Nov 2025 19:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1175466;
 Sun, 30 Nov 2025 19:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn08=6G=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vPmeW-0008Qa-AZ
 for xen-devel@lists.xenproject.org; Sun, 30 Nov 2025 19:00:08 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ece837-ce1e-11f0-980a-7dc792cee155;
 Sun, 30 Nov 2025 19:59:53 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AM7PR03MB6213.eurprd03.prod.outlook.com (2603:10a6:20b:133::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 18:59:50 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 18:59:50 +0000
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
X-Inumbo-ID: c0ece837-ce1e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV4ihCMp79wAxjMTMgjIf2ZxFknoXFZyDMye8NXie4VkqR0XngUeI3Z+Hz1YY9yvc35Q3WFSyv6unSX4kHeoCVTNOwpgu54UnYLFBTip2wytYc1mCgZBJ3PyoSkOSRjP0EAR73cH9IHYAqtkZHWGol0w6VBUKFdidJbxKs7O8vFmd/NQVxu5LB2do5cBtgwKzt+CMROulGUNSET/sMZnoEHyEAfFxm+hKqSGZbjm80IIfe0/UVfYtbpMXv55JmRGUk7zuM/S2Y3hFFPGgshF40/7hkmUzLwlgRYwsR4ECgRyYLm7SrJSxD08TT59td7cQaVVvezDBw6KaATHU3j3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj5HD5KKpcIV3Wi7aCVq8nsNuy9Mq64in2Ip0S9bIgw=;
 b=vtMMpbHSSgV9rhQ6UL0fwsgUkwycymBBOB3Mw34NYgANmELMF75JNyriIHYp1trNAgF+JHgySIo/7kjh8vOZ8F3EjxvlVS7auSfJR9nO3UVDI/MZ2RCnMNTapv+z3dHZyjqCMjSryamw68x2h2EXuSwzrR4lCLX9vNO3Mdqp9TeziONdZOBfGs7XRVpEJL70UAeuF1zJsJSkqB9aAtoEy8BTADOsDf7fToVIvAknkdFHSv0sGxwR+UE5uOOC/+loRMftCnG3ps9sfELCzYBSE3bJ0ilV2nqrqbR6T+niQk9Dz66iXffIlTvxrskJZTmj083VhNe2nXnyIcqiBICftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj5HD5KKpcIV3Wi7aCVq8nsNuy9Mq64in2Ip0S9bIgw=;
 b=Lh0P2kHXhwCOgK9x3h82uoezHgk7SH40CVD5drbsVkTDTPT0QPCsjj4bMGMNJGOo3+yH/IN1Q4KgErdZG+L2AyGQfnX+SwQx6Zx1CFJ2qH/UU7tNg2RaJy3v6w9/G1t8h0HdXuPceT4bMxL6qr4FKSQERZ0h2KhUwaoeOXMuyyKPNasZpmcNf5wlWIMPmcNPStoaHlVksgBiw9Lz7FC568sXYIqCEzYQ3vUAoCx5FdqBxEuO9AQyBHM3pYLplbJWDcuyuxBreVp3fH8yD+Fk+E2ARqks8EuxT+FCw1sQOqAyrIQd0mKrW6/GGtkK/lcjsif7OqKLycALJ3djggYzwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <28d5bae7-e993-4a92-8b6a-659a3e9795a5@epam.com>
Date: Sun, 30 Nov 2025 20:59:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [4.21] REGRESSION: [PATCH] xen/credit2: factor in previous active
 unit's credit in csched2_runtime()
To: Koichiro Den <den@valinux.co.jp>, Grygorii S <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, dfaggioli@suse.com, jgross@suse.com,
 gwd@xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 Julien Grall <julien@xen.org>
References: <20250621141411.890250-1-den@valinux.co.jp>
 <3dfd6d2d-fb56-4ecd-a86b-8c6068b2e470@gmail.com>
 <uwoaj27nf7qk7z4ki3d6nbvut6yhfn3e2bdhmggqajwpicsng4@yrylm22q57fd>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <uwoaj27nf7qk7z4ki3d6nbvut6yhfn3e2bdhmggqajwpicsng4@yrylm22q57fd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AM7PR03MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fecdfe0-b8ac-47c6-f2f0-08de3042a31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjN6cTNFOXZIYkJrQzArWitBVEhVWVJlYVNUbXd5VElmdVE2cTI5L0ZDTjFo?=
 =?utf-8?B?VVhzWTE2NDRjNGJXQ2JKV0FubGdJblJVcExLK25WbHJ1ci9icGNFaXZoNFZy?=
 =?utf-8?B?SlpTSFF5bVV4MzZ4QWdEOGN2d1NCdTQyQ2pVZi9RUnhOWjQ1YUJXckVub2Za?=
 =?utf-8?B?U1NXSUUxaGI5ZW92UnVGbU5KS3pXTG9aS2RVR2pzek0wZ1RiQ3dXR3VsNWw2?=
 =?utf-8?B?SmgveURtVGZaWDhRVlV1VGRKTzVUU2RQUnVPcmRaazFMbEltenl2aStoSjFE?=
 =?utf-8?B?WmgwMkRDZlYvd2Zkb3pvYnFEcExSdWNNNmIyVkVDdHdRc3BqMlFRVWQzTTBJ?=
 =?utf-8?B?RFZ4cmprbDlCZ05maGVheXQxd1NKcU1CR2l6OSt4eU1DMlNWeWZOSWJxaDEx?=
 =?utf-8?B?c0F3SVJJN3ZhL0l2WVhrQVp6VGVpUXNDVzFQYXozUUdsOXZaaU1EUk85SG1W?=
 =?utf-8?B?OW5CTGdrT0ZueTd3a0lPaUEyVUR6aWpteWozWmozNmpsNTZXcm9NdlhGdHY2?=
 =?utf-8?B?MU5nc01aQW1TQUdCSDVmSGVmNzJQYTViL0R5ZzVCelJ6dnV1OWM0TlJzRzJP?=
 =?utf-8?B?YTZTaFFWKzRmV2t3T0w5MVdXa1lVQnZHc1JIOFJkQWdncEFDSTBDNUo5R3dM?=
 =?utf-8?B?aSs5dFNzU1dTZW1BMWFENkpwR05TZjlsUkFGRXVVeEloTFhaME9nMnJySitS?=
 =?utf-8?B?dHNseENrSGNJbmZaK1ZVMkRlWW1WbTFuRVlwcjhkbFdIRnU0NkQ1b0Vmb1Ir?=
 =?utf-8?B?ZXZHRGZBYVUyOVBvalNWcEpncnFtK3hiRlZHTVprdDhiZTIwV2xod1lFeXAv?=
 =?utf-8?B?YVhHK3lOMW82NUErU1RyYml1NTlsb0dhYWpaemZDblJCdmVaMFpyNFZIclNx?=
 =?utf-8?B?S2Y4RnpPZUdWVExNaGF4RFZYL2Y0cWtaMDZmVmlheFI2S3lGS3JYVUJ3Ri80?=
 =?utf-8?B?dk1tdDBBWGxIVVJ6U2R4dForRzl1dGJZbVcxQnc1Mkl4MnMvTythZS84d2J6?=
 =?utf-8?B?TW9lQmtHUGVlSzJNcFMxbDlndUZMUGw1bXRMOWpMamtxeTkzYjR1eG9lZXo2?=
 =?utf-8?B?RThGb1RqVmNXWmRJeTVZaHFEaHFhWmxvT3l3Z1BOV1VJQ0ZOanBwM0xWUGJu?=
 =?utf-8?B?TlVsZERlN21icEcwMUpvbURrYnFIam9KRmFjYjBTQVlySENKZ3ZYMFFCN21M?=
 =?utf-8?B?VzhxbjAyS1ZJU3U5WEJzcUMwSFBUcEc2elkwK0t4YVpjVTNkRVNTalcrclVY?=
 =?utf-8?B?dWtmWTNHUUpOV2w5WGZVbnl1K2toeVlEVFFOT0tzRy9tMjZ2cEh1OWZWUjF6?=
 =?utf-8?B?SzgxOVREcHRhd09QbkdMWTRIWGVOMnBDdnRnTFhSdmF5RDIrcm1CMTFsSVkv?=
 =?utf-8?B?QmlHK2F5T0ZXWkhqTXQ1dkdLRGpxL1EzSk1pS3czbWVRUmpGNVZDcmt2TUxF?=
 =?utf-8?B?Y2hKMFhvSVc0aEpNYTU1T2x6RFJVZjZFc2ZSeGkxRldyYzV2TCtpU0xLTkVD?=
 =?utf-8?B?VnZqeHd3Ui85OVZEWUxWK3g3T094RmVlMGc3dU1VT3d4MXIzcFVMRGtVTTdL?=
 =?utf-8?B?eUpPdTF0bW9IbjZnVGFIMzR1UEYweG00TmJ5SlFLNS90dHhPVHkzbzNmNm1w?=
 =?utf-8?B?eVJ6M1NUNGlWU01vN1o2UXd0Yk5mUksrTS9CTG1JWEJrMWxGSXBNUW0wSTVz?=
 =?utf-8?B?aGVZV0xRSDZwYVEyZVZMSmRkV01zaEpnM3BEdHdqV1ZaazBZV3pxbGFFdkZT?=
 =?utf-8?B?TTFVdDNkYVNxRWN2WHRjUUFlRlhwRG5ZZVJHSWlzMVA4WENibmZJeUt0WUZO?=
 =?utf-8?B?U1RSeE9sa2tUUWhVMTBIYmkzT3kxTDRINDNzRzZHcld5enhlZTJsT1VvUlJy?=
 =?utf-8?B?NEsrMUtvLy9sTEZ3aE9kMzFvdEplZ2ZUdUEzNVBJaWIwZlh5T2VUc3RCdmFi?=
 =?utf-8?Q?cZ2lOnPIfff+sfx4cV1XKL/mCOeF0EYC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmUwY2RqYVdKekhXU3k5Tm5RTFJXc0JJOW5TMm9pelMwbEZZQVp6NEt3Ykht?=
 =?utf-8?B?TWkyVWx5c3h5NDE5VzIyUENWdERwMVNrYW93OTI5WXNtd2dCZ3ZpWTZjK3pZ?=
 =?utf-8?B?UlVvRjc3bGtnRnd6VHZlZzd5OU5OUTQyc083Y3hEcXRYNkNrSEs4MkpzMTFm?=
 =?utf-8?B?UWNHemQrblMrdmZISkgzUE5GUzh2TTVBQm0zcTZZMWp1dlhZWmNldTdHb1ZQ?=
 =?utf-8?B?TWM2MHlWTi9XZmUvR2txOFdxWHpiVjJFS3czTFZQUCtteFFSd2J6eW14L3R0?=
 =?utf-8?B?d3BqeFdxUkIxdUcvbzhPSU5icEVMa21NT2ZNb05DYUtEKzFqZHVMNnA4dGNZ?=
 =?utf-8?B?d3RWNnVPUkRwWFkwYkdLZjhGdWYwVEhDUWoxU0x1YnFEZTlndFZXd1FsWU5W?=
 =?utf-8?B?eGFEWW5uZzVONEx6VzdBVlJleGZpdFI0cXBIb0dHcmJnWXBKanUxeVhKcDlR?=
 =?utf-8?B?bVMyUnl6UGE3OUNZTVV4a3YwZytUNTlhajRHK2Y4bHhnVTRzNVBxcHFnOWc1?=
 =?utf-8?B?QW1PYzdPVklmV082djlyM0lHdXhZcGZFaDBBWlRzWkhrLzMzSGRjRUdDcnVH?=
 =?utf-8?B?OFVxYVMzci85bE1CdTlPOHdOUjhRaThiV3RBbEpmNFR0M0l4Sks2WXIyS3Np?=
 =?utf-8?B?ZjZ6eDZIYnZjUUtoZDlYWjlubUpkUjd5cmZIMnhvcUhvejNpNmNsQzdlVWNS?=
 =?utf-8?B?NmlSTkgyVkdONm1zdnBBVUg5bFRtNFdUa1FCZW1XbDVlMTlpV05VSUY4MEli?=
 =?utf-8?B?b0hFTGtybGdwN3YyZHFCM3ZqL1d2T3VBb3JLQzh0SGJZempXVlZnZWcwYUtV?=
 =?utf-8?B?czJIWlFSdWkvWk1BRmFFd2gzYmhJRFpnRUVYUWxjSEVUQzU2c3k3K3pkdlhY?=
 =?utf-8?B?ak1iaGR5QWVNQ1JlSmJ0WTNOa2tjcmU4M1A1Z01OdVNSa3dJS3kwbTY5SFhM?=
 =?utf-8?B?dkdCYUpLeVJ4UjZRWFc2K2gyQy9aZWZMcUlSNnNRdWNJcFN0cEREemt5eWxY?=
 =?utf-8?B?QnFEb2dING56QnY1dFlyK1VjdlJNa3FkWmpHNUJoNEVWVm13UURGcGFTTjU2?=
 =?utf-8?B?Q1BIdTh1ZHQ3N0w2OXJvUFJjZnNVSG5VY2JrekRUZXoyNUY1UFRrbTM5RHNZ?=
 =?utf-8?B?R3c5VXFGaFc3RVR0b0lHL0RXejFGei9MM0pOc05lUTZBakZiUElNMllycy8z?=
 =?utf-8?B?VmNjQzdPMER5RGtMaXNBWWs1T2lZcVR6cHhES1ZyZGx0amFZdThYeDZmbDRX?=
 =?utf-8?B?SHZGN1ZMKzRtaUJDMzZEc0J5bG50YWg5Z2l0REZ1TWpvbDRvSElIWmhiakEw?=
 =?utf-8?B?M1dDeHJoUVFwNHJUY2dmeXFGa2FmQW1McXZCcU9ySUc1K095RHM5S3hZT3Js?=
 =?utf-8?B?bFRTc2NqRkV0Zjdrbmx6VFJvaDdLOEY4ZWZEMFFla1FySjF6eGFjTFBDSDdw?=
 =?utf-8?B?aXJFbStadXhUdEZ3amd6VEtoYnFTQkUxdkZFQXFVM2NmdjhkUGdtb3hxZjQ5?=
 =?utf-8?B?NkFoa1RjWlZKQ0lSMlBKSVREaWRrekV4RjArck5xZmF2TW02UnBieVdvQ3BH?=
 =?utf-8?B?TFhBbkFVOVpRY0tuS204a2dqYkowRVVsc2hIVEJlUzNlVkZXVC9LUE14NXhV?=
 =?utf-8?B?UWFSeVFRYVlRZlpjdFgwNDNadkVORkhBaExrMldQeG4wZEF6cmt1ZDRtZVU5?=
 =?utf-8?B?YkRmN1pSV2ZPb1dCSFIyUkRHdG5DUFo2U2E3TlVzNEZpQ1VLeisyK05tU0tl?=
 =?utf-8?B?NkFYZFBSKzhmVEhDeXo4NnFwSU5qb1IzQklKS0txVUJiZjB6dDlBWFhvWG14?=
 =?utf-8?B?cFlRUVI5UENiUHJ6KzNtZHFRM0YzQlQ0MC90THJ3SW1LZDlwMmV2Yi9mVVd0?=
 =?utf-8?B?aUpOTnJlUU9QSlhtbktjZUtXaXJKNzArdDRYTXFFamFHM3ROcnNubURsM042?=
 =?utf-8?B?MU52eWlYb24zUDFKdm1yUEl5a3A2RjczVG96QkpJM3J0QkpsS3VxMStnQm12?=
 =?utf-8?B?ZnJZamF3QzlCbUhsL09jcUhxNnFFdUFyb1N6ZmhlOHpNSWpodmhaQnQ4OHlV?=
 =?utf-8?B?T0lVeENHaDVlck84YUNsS1hnd1JXdXJQdmc2UzdCbWp4aFpvU2tLK1lKanRw?=
 =?utf-8?B?Zm5sRGxhbnA5ZXhzVS9pNkFLNXlPc1JWT09leExRZjRyOTE0cVM3ZmNmb0pi?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fecdfe0-b8ac-47c6-f2f0-08de3042a31b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 18:59:49.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4+7f7XqQ/PFVfcq2mi5KZkIUi7oAvs0j2dwT1pO9YnIwld+LItsz3ZXDFE22u1Tgpb4CsrNGCwtDqNwW14xxU+MvqFaxTtL/CFpSYF5c40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6213

Hi Koichiro,

On 30.11.25 16:30, Koichiro Den wrote:
> On Thu, Nov 27, 2025 at 04:55:17PM +0200, Grygorii S wrote:
>> Hi All,
>>
>> On 21.06.25 17:14, Koichiro Den wrote:
>>> When a running unit is about to be scheduled out due to a competing unit
>>> with the highest remaining credit, the residual credit of the previous
>>> unit is currently ignored in csched2_runtime() because it hasn't yet
>>> been reinserted into the runqueue.
>>>
>>> As a result, two equally weighted, busy units can often each be granted
>>> almost the maximum possible runtime (i.e. consuming CSCHED2_CREDIT_INIT
>>> in one shot) when only those two are active. In broad strokes two units
>>> switch back and forth every 10ms (CSCHED2_MAX_TIMER). In contrast, when
>>> more than two busy units are competing, such coarse runtime allocations
>>> are rarely seen, since at least one active unit remains in the runqueue.
>>>
>>> To ensure consistent behavior, have csched2_runtime() take into account
>>> the previous unit's latest credit when it still can/wants to run.
>>>
>>> Signed-off-by: Koichiro Den <den@valinux.co.jp>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>    xen/common/sched/credit2.c | 28 +++++++++++++++++++++-------
>>>    1 file changed, 21 insertions(+), 7 deletions(-)
>>>
>>
>> We observe regression on ARM64 with this patch.
>> commit ae648e9f8013 ("xen/credit2: factor in previous active unit's credit in csched2_runtime()")
>>
>> general observation:
>>   This commit causes Linux guest boot time increase  >5 times for some of our the credit2
>>   specific tests.
>>   Reverting it makes issue gone.
>>
>>   - normal log
>>     (XEN) DOM1: [    6.496166] io scheduler bfq registered
>>     ...
>>     (XEN) DOM1: [    9.845108] Freeing unused kernel memory: 9216K
>>     (XEN) DOM1: [    9.874792] Run /init as init process
>>     (XEN) sched_smt_power_savings: disabled
>>     (XEN) NOW=16800131328
>>
>>   - failed log
>>     (XEN) DOM1: [   37.281776] io scheduler bfq registered
>>     (XEN) DOM1: [   61.856512] EINJ: ACPI disabled.
>>     test: timed out
>>
>> Run Details:
>>   Platform: ARM64 (Device Tree)
>>   Execution platform: qemu 6.0 (2 pCPU, 2G)
>>   Boot: dom0less, 1 domain (2 vCPU)
>>   Command line: "console=dtuart guest_loglvl=debug conswitch=ax"
>>
>>   Dom0less cfg:
>>      chosen {
>>          xen,xen-bootargs = "console=dtuart guest_loglvl=debug conswitch=ax";
>>          #size-cells = <0x00000002>;
>>          #address-cells = <0x00000002>;
>>          stdout-path = "/pl011@9000000";
>>          kaslr-seed = <0x5a7b5649 0x9122e194>;
>>          cpupool_0 {
>>              cpupool-sched = "credit2";
>>              cpupool-cpus = <0x00008001>;
>>              compatible = "xen,cpupool";
>>              phandle = <0xfffffffe>;
>>          };
>>          domU0 {
>>              domain-cpupool = <0xfffffffe>;
>>              vpl011;
>>              cpus = <0x00000002>;
>>              memory = <0x00000000 0x00040000>;
>>              #size-cells = <0x00000002>;
>>              #address-cells = <0x00000002>;
>>              compatible = "xen,domain";
>>              module@42E00000 {
>>                  reg = <0x00000000 0x42e00000 0x00000000 0x000f1160>;
>>                  compatible = "multiboot,ramdisk", "multiboot,module";
>>              };
>>              module@40400000 {
>>                  bootargs = "console=ttyAMA0";
>>                  reg = <0x00000000 0x40400000 0x00000000 0x02920000>;
>>                  compatible = "multiboot,kernel", "multiboot,module";
>>              };
>>          };
>>      };
>>
>> Investigation:
>>   It was narrowed down to a specific configuration with cpupool assigned to the domain (100% reproducible):
>>   Host has 2 pCPU
>>   Domain has 2 vCPU
>>   cpupool_0 has 1 pCPU (cpu@1 credit2)
>>   domain <- cpupool_0
>>
>>   if Domain is assigned 1 vCPU - no issues.
>>   if cpupool_0 is assigned 2 pCPU -  no issues (seems slower a bit, but it is on a error  margin level)
>>
>> I'd be appreciated for any help with this (or revert :().
>>
> 
> Thank you for the detailed report. Could you please try increasing the
> ratelimit_us (the -r/--ratelimit_us option), for example to 5000 or 10000
> microseconds, and see whether the long boot time issue disappears?
> That would help determine whether the previous behaviour (before the patch) had
> simply masked the effect of the default 1ms rate limit in your setup. 

I've tried it. Boot time is improved, but it's still slower.

(XEN) Command line: console=dtuart guest_loglvl=debug conswitch=ax sched_ratelimit_us=5000

(XEN) DOM1: [   37.903192] Freeing unused kernel memory: 9216K
(XEN) DOM1: [   37.970645] Run /init as init process

I've attached dump_runq below FYI.

Note. This is dom0less boot, cpupools/domains are created at boot time.
The toolstack is not used.
And I've not tried (and it will be hard for me to try) if the issue reproducible
when cpupools/domains are created by toolstack with above cfg.

I can try run with debug changes if you have any.

> In other words, after the patch merged, you may need to set -r/--ratelimit_us
> explicitly to some appropriate value, which is larger than 1ms.

Unfortunately, "after the patch merged, may need to set -r/--ratelimit_us explicitly"
is not going to work :( (at least not as long term solution) as this is safety test suit,
so any deviations from default Xen settings which are not part of particular Test case
need to be justified.


> 
> That said, this change touches long-standing credit2 behaviour, and we
> probably should've discussed backward-compatibility more carefully. I'm
> completely fine with reverting it if maintainers think that is the best
> choice for now. (To be honest, I hadn't even realised that this had been
> merged until receiving your email, since it only had a single Reviewed-by.)


-- 
Best regards,
-grygorii

==== dump_runq() "r" =========
(XEN) DOM1: [   37.970645] Run /init as init process
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=46147558848
(XEN) Online Cpus: 0-1
(XEN) Cpupool 0:
(XEN) Cpus: 0
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 1
(XEN) 	default-weight     = 256
(XEN) Runqueue 0:
(XEN) 	ncpus              = 1
(XEN) 	cpus               = 0
(XEN) 	max_weight         = 1
(XEN) 	pick_bias          = 0
(XEN) 	instload           = 0
(XEN) 	aveload            = 0 (~0%)
(XEN) 	idlers: 0
(XEN) 	tickled: 0
(XEN) 	fully idle cores: 0
(XEN) Domain info:
(XEN) Runqueue 0:
(XEN) CPU[00] runq=0, sibling={0}, core={0-1}
(XEN) RUNQ:
(XEN) CPUs info:
(XEN) CPU[00] current=d[IDLE]v0, curr=d[IDLE]v0, prev=NULL
(XEN) Cpupool 1:
(XEN) Cpus: 1
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 1
(XEN) 	default-weight     = 256
(XEN) Runqueue 0:
(XEN) 	ncpus              = 1
(XEN) 	cpus               = 1
(XEN) 	max_weight         = 256
(XEN) 	pick_bias          = 1
(XEN) 	instload           = 1
(XEN) 	aveload            = 413852 (~157%)
(XEN) 	idlers: 0
(XEN) 	tickled: 0
(XEN) 	fully idle cores: 0
(XEN) Domain info:
(XEN) 	Domain: 1 w 256 c 0 v 2
(XEN) 	  1: [1.0] flags=2 cpu=1 credit=6994336 [w=256] load=238475 (~90%)
(XEN) 	  2: [1.1] flags=2 cpu=1 credit=4766960 [w=256] load=176230 (~67%)
(XEN) Runqueue 0:
(XEN) CPU[01] runq=0, sibling={1}, core={0-1}
(XEN) 	run: [1.1] flags=2 cpu=1 credit=4766960 [w=256] load=176230 (~67%)
(XEN) RUNQ:
(XEN) 	  0: [1.0] flags=0 cpu=1 credit=18096 [w=256] load=238475 (~90%)
(XEN) CPUs info:
(XEN) CPU[01] current=d1v0, curr=d1v0, prev=NULL


