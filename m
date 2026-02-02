Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Du1A3rKgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:02:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB517CE965
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218757.1527619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwMx-0005sB-Dt; Mon, 02 Feb 2026 16:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218757.1527619; Mon, 02 Feb 2026 16:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwMx-0005q7-9t; Mon, 02 Feb 2026 16:01:43 +0000
Received: by outflank-mailman (input) for mailman id 1218757;
 Mon, 02 Feb 2026 16:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6EL=AG=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vmwMv-0005cR-LG
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:01:41 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c8791d-0050-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 17:01:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7893.namprd03.prod.outlook.com (2603:10b6:8:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:01:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:01:35 +0000
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
X-Inumbo-ID: 75c8791d-0050-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWHbFxOySekXKRHWNhqxF4gQdSltzWdDIH4RXcz+D9Id+gcGNrdfqZcO+4/c6cGx0FKGwXUHBj2NuaDX1HluhXFezaSc4JLYmaCuLCUYehEr8qZvQx1pnB/R+6thDoPr96fMuz0CeduhleU6Xtbly0HSt5whZByNMr1c8ih3dfeptRx32TjQG6NPqHUsvleicX9GAfL7UIFYgq+cWt7eJkAaiYjn6VBXXqcJK/dse1pgUbsU2mo3Pag2R0yy3jw0f8klFbKtUIdFGxghkvWhL44Mo6WSaDBZNzNkdBAODUOf7WH6yrzSG3XJA1MGWwZwPksbE01wQvsJJN341hTc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=968dbr1XUuSyPSRG6x/faQDLjnkW3VzCzRi361l1uek=;
 b=Fv20PyMl+5IpVghS1tUfVtqtK7aB8bMD94mg+I9Uj21cM5ZuBnTvGnHlSn/JGBynzAZOT2Zkf06pW21CqzFT/eM1iRkLlvD4NdEyP1ggPhvT5EDiatNYJB0VRNzMwFTPfPTXMqDFQWm0lvnM/NfqnwzbG1rxGkJJbFMuSXKxyMG3lZgqEOufw5vDQleTwLTdA6riwNsLDOypU3AVlgBykFPukIQ92u8JutGzp30m1e19abL/D4OuO2Gg8La/RHJr1fmTHh8rGhAchQu782/n7wkay+ehcMGPca8ZpheYUfMk14zh4JEUhW2f0i/CDnb6itm000YWYaa7CzcVOaRUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=968dbr1XUuSyPSRG6x/faQDLjnkW3VzCzRi361l1uek=;
 b=cz+SY3JX/A6FGx4qKGs8xw3k7LNOcUaz2xFw1j2nfMDjFH56WwgI/OCy5IVYU5f+nuzqb67hmX1CDsPbEBDVhTeQXiLhbrisSdg0WONZrh3tcFoHq2B/qkUewESp0ouzda6axERsd6zXDibb1XhBMDESQgjbT5HWRZijX0OP3TQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5f42ae1e-7f3f-4e95-a6c3-5a7f39623971@citrix.com>
Date: Mon, 2 Feb 2026 15:56:41 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: calculate number of synthetic feature and bug
 enumerators
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70fe3986-ad89-4b42-b158-7e7b2b24ec1e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <70fe3986-ad89-4b42-b158-7e7b2b24ec1e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e950f9-72d0-4f4c-c327-08de62745770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmRDQWVSZDBmbmRTeXY5WTFzYmhNWGg5cHBKU200SW1nR25VNU81eVhPTEIy?=
 =?utf-8?B?UmU0MndrUzV0eElDK0dLa0Ftb1RYQUQ0TjJvUkNqMEhiRTk5RTgvT3J5amNM?=
 =?utf-8?B?NDE2QzAvbDJCVG9HSUtMV21WZlZzWTNRdThVNTRaanpsMGdUVjNVaVhtYk9S?=
 =?utf-8?B?ZjhUVFl2LzF3ejZVb01CMjJncGNGTTNST3BjTlYybmZ1UE1BZmZhVEd1eEVi?=
 =?utf-8?B?MXcyUzF2Qzh6alc2cmx3UFcrQkJvMjE1ZEd3ODVvTUV0dzg4SG1vd2tHYTg5?=
 =?utf-8?B?WnAwNU9kWjYyQURsenpIN2cvWHh3ei9mbTZvTHB4VTFjdlZMazNYR0JqZUZ1?=
 =?utf-8?B?aEQ1R05obEFiN1R6em1MMDAreEtPTzhOa1k3a2gzbVdFL3RuWmFwcSsxaFpp?=
 =?utf-8?B?dzZNT2t2SW9kczJVSW9BZ3MrN1lFU0ZkNVVIdjZ4akpmMncwVExpM1hBMkhV?=
 =?utf-8?B?ZU1DMTRUaWJOakFYb3lzRWc4WkpiODVYRHNqVHVPeDNLYzhyWG5hQlNHMUVT?=
 =?utf-8?B?WTB6czdxNzhmU1J6dElWbHRYZjVmazRZMWVIcFVFMFhXemliT1dVY1VRckFS?=
 =?utf-8?B?ME5SblBvVXlOVkl0Zjd6eDlyOVpLMzVBU0RpY1ZnbVc3a3kxTU55NFd3aC9w?=
 =?utf-8?B?L2IyVUdWSURUMzgwTnpBSFpWUVNOUUE3dnFDY1lDSmlMNFQydHorMnpUaHZv?=
 =?utf-8?B?c3RBYzZVa3NsSVQ2NFNuQ3g3bDlpeWJ6RC9qcVNsU0FMTGlrdElpYStDTTFN?=
 =?utf-8?B?dlh4MFhkNGsyZ2pPWklZUHdEZTlJa1h6dEMyNnJJSCtHWXJ0MEtSNjRtbk0r?=
 =?utf-8?B?UFlUTndiTjdWUG1FYWMrSXdEN1VRbXRrUW9aY25vcVN4alN6VlRLQjRzeDV4?=
 =?utf-8?B?S09ta2l3aTlha3V6eEdBMEcrZGw3dVdyMmhtT0Jaa1Q0MVM3ZnFESDBrUVFi?=
 =?utf-8?B?bkhabE9ZWk5VaEx1Wm5ibUc3TUdVeUczMHM3ZlI1Mk10MER5YmRWSUtLWnB0?=
 =?utf-8?B?OWxVWTdiTVIzbEduWDBXeSsxeUIxUWtIVy9IN0lyek5ab0V5Q0F5b25Ud3Fo?=
 =?utf-8?B?YXh6SUJXcVZiTDN4S1FvMkZDNUxlTFdzQjBRcDZwTkVXbmZKRElhTjN4YUVw?=
 =?utf-8?B?YUJxaXVsVGVjWmJiaFZVakZVR3k4YjMxWnBsVUs1Unk4Snloc1NMU3dVWWli?=
 =?utf-8?B?czNsdEFadUw2bXRPSG51ZnhFU09zUDBBNS9VSDM2MVNLREpIeHpwY3Bxbnpa?=
 =?utf-8?B?eGpLdXFBZ0xCVzZvTlBiVytVdjZ1Rzk5T0NuaEdxYjBwSnZHcHdtcDlLbDhz?=
 =?utf-8?B?SnFZRDl4anhFYlRML1BhUnI0T3N6TVRoamFFbG9tNGcrVmtoNW5SVGFMU1R4?=
 =?utf-8?B?REErUkpvTVpEb0llYWlUNVZ2ak4wcGFJRmZpcHdPRFhiUXJBcWhOLzJFRWNr?=
 =?utf-8?B?QWZZdmV4c3kwYU9MNWpCREVKcXJnOUVBUWc1eGo0SVNyUWNaRjVxSGkyLzE1?=
 =?utf-8?B?VWpTQVhJUnRwWktKeGtKUXE1NDhjM1ROQnJ4WjNlUC9NdTBHeHFRM1VIQVNI?=
 =?utf-8?B?TE1VTXRDRnVGSzdienJhQjlvdFZhRm1BNlA1cERwWHJVSVd2bUJsS25WUk50?=
 =?utf-8?B?TFQrc3d4ZW5uNElJQy92S3VSWFNWSWxIdXEydEpQMnRqZ0tRVVVRVEZ6cnNa?=
 =?utf-8?B?WVVaOCtxd0VlODg5YUxIYVM4elVIUlpJUmc1YnRuaHJJVTBQTWhLcytmdmov?=
 =?utf-8?B?dDZuQitkcjB3dDZVNGQ3Vmd1Ly9uM2hSUmZjaUdCdFZLYjY3ZXQ3MnRCMEJX?=
 =?utf-8?B?SklGc2hUYlFsZUlZM1k5dEwyQ2tiVW5yN0lmVXRNRlB3eksvOXQ1ODVVMWE4?=
 =?utf-8?B?aWhkRnFOcVZNc0hRMU9IeFN2ZVY0M21UNHdiUys2RURCbVJvTFdRbXBvMTgw?=
 =?utf-8?B?VHlSSkVuU1hFc21FZXFjTjZpd3FiSDFzUXUxSEFKaG5zYUtWSFd2aGhkdy82?=
 =?utf-8?B?ZlNXU1hMQTZxNXdWWUlLc2VWY3lmT1pVdVlySjJTdmpIRnFBMjRsOXdjait4?=
 =?utf-8?B?dlk0U3Btek05d1RuN1dESTNyZUpZK25Rem5vaXUzenM0blhDdHFETkVOT3hS?=
 =?utf-8?Q?nIjI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3FEYlZ3ZUdmSVp4bGJOQUROcHhVaHhEOVdQVUxqTG9HWTI0aS82QW9ZWG1p?=
 =?utf-8?B?eCtCdDVJbWhJV1AvYkQ3Z3huNFQ1RUZQSHMzMDFSVFd3VWVVVU0zSEpKaHR3?=
 =?utf-8?B?dUQ3cC84bnZBa2w5U3BVZUsyRkxuRnVFZTBsRjNaWC9uQklNcGFSaUNIdGln?=
 =?utf-8?B?c3V3aWw5cE91WEZ6WFNtZks4MG8zQ0QrVFpPL0NWUTh2VnpVUVdnK01pM3Rq?=
 =?utf-8?B?RkkrMWtvMnltdEFQNmREUlJzUVNBeUE3NjhWb2x6N1ovcnEwaDVhMjNob1U5?=
 =?utf-8?B?VC94NkVOZXBRZjEzWEZMSjc3K2FlR1pKQnhjOWd0K2lNMVlLd3BmbEMvWWor?=
 =?utf-8?B?aVdyc2VTaUVKbHkxYmpQbFhQc2dudmhTL05Oc3lmYnVMMDkybGJBb2I1ZXFn?=
 =?utf-8?B?dVFoY2FyL3lLZ0RBeXkwSmlQSDllc3B1c01BbW1IbTFrU3NlTDROdmVwTk1y?=
 =?utf-8?B?L0cvNkR3TGpsK3dMekFtTTNVRG9pVExYdDdtdmVOUkNXeXU4czRGeEhoY3px?=
 =?utf-8?B?RVRIQkdyUzgvL0lTNUdIUk5QT1VRQXZ4MngxREpacWE4a3NKOTZnckFNdU9a?=
 =?utf-8?B?RGx0NlNNNTlocC9KSG1tVTlZNlJIODZjREg5QVFpWXR4T3VIYTA5M1dTTzFL?=
 =?utf-8?B?dzZmU1hWeE8zd3N6YzhBd0tnMU5lT3ZROERHTit4NEJOUDh4ZDF4eWpWOVJH?=
 =?utf-8?B?c0tOU25OZnJaZEtRdVM3cm5zOExhc0plUFp2bFluRXlnaFhVSVBldTk3NGZz?=
 =?utf-8?B?OHB2RTdxYXRBQk5hYks3MUVvQ1NnM2RHcFpLWEM5K0JPU2p1UkY2UGNKRjU1?=
 =?utf-8?B?bFE4ZjBNektnQWNQd2FzdzVjN01QUGw5ZDI4RHRROHk0QkhCdytRcTExUDcz?=
 =?utf-8?B?MkhjYXNhOE9TdnFwNFJDWGovRERvbmZ0aFZsb3k2MjkwMlU5UUFpTHRPdFdL?=
 =?utf-8?B?dUJ2WlNPbFVITWNhTEUxbDlNU0Z6eFdmalVCV3F5TERrY1VubHg1MlRTTnpq?=
 =?utf-8?B?cTV3ampUZjVIc0g3T2NJY3JWbEJmWGxDeFV1SWIrTk9sZnM0TVhFb1U4aG9Z?=
 =?utf-8?B?NjJCZUpqZjNSYk5NSDM4V2ZENDdSWjVsVjlodTU3VWZSOTBFVWs3VTZaWXlH?=
 =?utf-8?B?czBDdlVxeFlIdnlOcHF4VjB4dnp5VC82ZkkyRVdLMDE0Rk5UN1lNV25QbGFU?=
 =?utf-8?B?QnptZklZTThqUGdyR3BURDhNYVNuZVBkMmtiZXN2NlU0V3lxQjlLdldyU1B3?=
 =?utf-8?B?eTY0bU9vVXJvSEcwNEJ6T3NjT3R2cmFtdzRjbW5KNWEvN25USlU1RitnRkJ4?=
 =?utf-8?B?OWQwRUU1bGxLVTB5aVJrcFVmTHZGSDk3SU1VeC9iN25TWGZla1pSSDA4Vm1y?=
 =?utf-8?B?YktTUlhjaWZrR3QxWEc5enlQdTVBbFZMaSt5SW5xWDdmOHk4RmJaZWJFRFQz?=
 =?utf-8?B?dzhCYWJTc1d5VlJaNENiTWV4aWQxaWVLNHJxRHpOUEVSaWJSeWl1K25HREc3?=
 =?utf-8?B?MVg2WXFndlczWVNGQWpNNnJWM2FkcmxrVmpCVHFKVkt6TUluQkhoMk5nYWR1?=
 =?utf-8?B?MEJneFphbVZvWTZXZWVpME9vamJOaHJrSmRGVXlkZHRPVTBoTWM2VFU3NGRq?=
 =?utf-8?B?bmgvSlgyU3NmZTRhK3ppNGVhdXdpVFc0eTVJck5WTVllTnFOb3JOZmZ5eTdo?=
 =?utf-8?B?eXVrdXFKY3c1aHh0azNHRnRWbXIxb0VLSjArQThNdXVEdHlxYkxtemZ5dENF?=
 =?utf-8?B?M2FXcUpLZGozdXVVZld0K25YNm5jY3JYdUtPdkRZak5jbGdDM1g0b2tSMlR5?=
 =?utf-8?B?cVNUSHdCbXhURFRNdllMRnhBUkU1TnBvcS96M2syZmZuRWQ1WnpMREplZnc1?=
 =?utf-8?B?RFFRcnFreU9MTjAwYlhVc3hqOEx3aDJ2NUZwTEZYYzFUYVVINFpjZ3hndURm?=
 =?utf-8?B?TzdleG5qNHA3d1FMcCtpcHdtVHFWcjFqdCtBa1J1aXpTMm8yM2lXYnRjeUNr?=
 =?utf-8?B?QVBvd1lvTEMxbW92YTJlbzlGZHdNMDNkKzFsZGltUWxKSEJUUTIzRlcwVzZj?=
 =?utf-8?B?d2IraVo3aXp4clQ3aWlRdGF2aWk0VDdodEE3ZXBoQ3dBWkh1bGlqUkhTcUJx?=
 =?utf-8?B?QzJLUmNwNnhaQXI0UXg2T1ZqQ3RNTjF2K1dTbU1nV0lQSjN6dWY2S2gxc2hN?=
 =?utf-8?B?b0dUQ2J4bVZGYkdKWTFnQkQrTnppMXoyYWMwMXFsd2gxdkVLbHE2ckh0dXA2?=
 =?utf-8?B?YWh1U3RmRGJpTjhNOUlOQUJnM0g1bnZjSGdVUDdvYTFINWJaVW94b3FaS1VJ?=
 =?utf-8?B?NCsxL2h5TG1RbkJVLzZyQlc0bkxoeUwveWRCb1hwQVg3KytZb3p5SEhTdmZ4?=
 =?utf-8?Q?wuIJXICMUj3q6d8M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e950f9-72d0-4f4c-c327-08de62745770
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:01:35.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0NiMROtWPQ75kHvlHIpxLVv7NcZi4DIJKFPH02xMsF9RcJ6nuDp+ap6A+MgI6Dv2bQ2oU9H0wtnfruAdf2F/O1bzlqraIBi4OSZ2DcO4zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7893
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out,suse.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BB517CE965
X-Rspamd-Action: no action

On 19/01/2026 3:30 pm, Jan Beulich wrote:
> Rather than spelling out their amounts (requiring updates when multiples
> of 32 are crossed), introduce a sentinel each and calculate the two
> numbers from those.
>
> No difference in generated code, albeit debug info size grows quite a bit.

Presumably because of the substantial increase in preprocessed output?

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an alternative to "x86: guard synthetic feature and bug
> enumerators", bulding upon the expectation that when adding to the end of
> either list people will notice the sentinel and not forget to update it.

The extra preprocessing overhead is not ideal, but it's certainly
preferable to the first version.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

