Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 26FSGS8khmlSKAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 18:26:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83EF100EBA
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 18:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223692.1531144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voPaL-0000ri-LU; Fri, 06 Feb 2026 17:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223692.1531144; Fri, 06 Feb 2026 17:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voPaL-0000p1-Hz; Fri, 06 Feb 2026 17:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1223692;
 Fri, 06 Feb 2026 17:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1voPaJ-0000ov-U6
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 17:25:36 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d54202e6-0380-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 18:25:30 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7089.namprd03.prod.outlook.com (2603:10b6:510:2be::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 17:25:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 17:25:24 +0000
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
X-Inumbo-ID: d54202e6-0380-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGueE9H0FCvSvztRFa+pBiJzLGEXlwNB78n0Rg2JmmfzJRsS1D+PFchNSxD9ITXgP+q+SS2uRQUhRnmofvAsEB0BHtY+pInU0D4WqyIjP3XOv4BfgIZ724xZ4IZ8bT2l0x6rMCbng5cTZDrPvNpCejNKzczYoBMe+ZWPXQ4ZiIa3JYwCVXeDBUJZHLSJlk6KzA/GrrI8l5qYJbjrH/OXpFxTKswXGeycPGNQhFOVdy9z7/kZSATZAHaQELlgbHNp9C6EVsUzRbk7v6wdGQMQZF82/Fpw33IttsQs2sn8uy/biWxVysLFWymBlsoJ3xgXFRj0HqtygWwwazIUyTVqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8yVKOREDqy9T21MoTAdzSRdS+jRroDbGTxS5xDp5Uw=;
 b=TO0RGVB0+xUgsS+jUuS8CwwNAx6Dq/tuok/lQiycHDr8i00vvv7/G2ttF8iWRqUzJL6FGjmv3HRHGuJKMTnkH8IOjigemY6u3D5+iCanDiWsgCU1U/C+S+Kyp3ZZ3lbB+hdBLyKQ8JMEpbmlvyMFObiuM5LXtoi/y8aZhNJ87v6uAtdzPT/XtWlefZadRELAbxHbA2L6KfDgYVT6ieAKY974RGF5QLO1Yw/wdDEIwCSKHtHEfMQDeDW1gCdVrJBvcSmdr0DxBdtqd8+hJZzAKiCTi3njETHafrEOHzUbUjNiK8G8YCVAgAvCH42mrjZZ/iIYHcSwrdl7iXLv0oXmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8yVKOREDqy9T21MoTAdzSRdS+jRroDbGTxS5xDp5Uw=;
 b=GhATLbaEM+/r1LVqx+BVjQ8fPfnBGgF+OTsmkVOANsTS6Ax+mAqZScIYsK2LLTlWIvQwNEobkvowt9NkAIq9HkAxGoApy6s89bYntzUBdL9O2BRfhWf2BezywItMYU9ZLctTIItRUCvIDB8v4NtR8xajE+0CAE+okEreMV25pBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Feb 2026 18:25:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Message-ID: <aYYkAvGQygf2eNI7@Mac.lan>
References: <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: MA3P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdac1aa-e012-417f-42ed-08de65a4b6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2h6RUhBUkhTWUlSOFlvN29lTjl5eUZGdmcwNEVNVTl0L1VaN05vVlpNQWtq?=
 =?utf-8?B?MlU0d0RITkx2aFg5Tzh0T0pmRnpMb2QwTXljM3NYYXpraVl2UFRZYVZ4emhy?=
 =?utf-8?B?WkJkbXBBVkk0TTN2R2MrVWMxTnlNN3lBTmpRNHBFNEV2VlRSVFVqbm9LdVlI?=
 =?utf-8?B?bEM0Y0NqK0lHeUNJQTBDcUZoUEpFRm1ueVNURFV6bFBHbDRnOGgweVBOcW96?=
 =?utf-8?B?U3BFYTBCN2tVNm9PZnI5My9pVGU5QUxLNTZEd1lCbTNGN05Qcjdud2MwVUx1?=
 =?utf-8?B?WDZ3YWxLaVFvK3VXOFZXa0lLUmJ5bnNMMC9Tc2xqa2xRSStFS0hES1N1d0NI?=
 =?utf-8?B?QWdQV0d0eHdUUFdyeW1Sa3VISEV6MzY5TStPVmdaSHFvSVlTVEdtb2lvcGJF?=
 =?utf-8?B?RTVadkFIS3hMUDZhbWtuK1I3MHdvR0xUL0FkTmFJOW1TTlQyV3psaEZvTU5k?=
 =?utf-8?B?VllhMDh5U0MzNWxWbXFTR3ZvMENYYkFPVjJhR3M1eHVtSjRMRm9YTEpSK3g3?=
 =?utf-8?B?RUcwczc2cmhVOFJaV291YitVZGNYbSs0QTJvL3FhdTJGUjlLSVVYTE1zazYy?=
 =?utf-8?B?NUpzc2NXU00raUZQYkhUVDhsaFpZeXM3OGJPS0N5TDZmbDZLcGozV1FWRVYz?=
 =?utf-8?B?alZCcjBBL096K0Vhb0hBVGdlS2ZqTmRBblVHOGZEUGdFZzlENmV4N1AzS09S?=
 =?utf-8?B?TTJReXVOQ0dGU3pEWHlHd1RXc2tlb29SZExyRDJmczMzd3hHNWpaKzB3SGh0?=
 =?utf-8?B?SGVVSm5XK01RcDlzU1B6Qmc5VUVmTE9sMll1Rmx3Y0Ntc0laZEdNNkovNDJu?=
 =?utf-8?B?b0xuSXJORnRzVWdVQ3NnNVlkWXlYY2xVZkhha0ZGRGsxVGlxYTl0c0ZFbURk?=
 =?utf-8?B?NGRaT0o3Q0lFYjZIZmpVenRNRVpBQWFjRkl2MnQzQmZXZE1CeHFWY2JGbmly?=
 =?utf-8?B?UmtFeVlVYXR4UjhCVGwzREhvY1hNTlZSL2E3amNFdEpWYlJhd1pNOHE5M0JS?=
 =?utf-8?B?U2Z0c3I0QXc2NXkxbEtrVVlieEpTSWZHWldCWC9wOGN2TFN5K3dZUEFoUjhy?=
 =?utf-8?B?YUFlWlludDI4YkgrU2tJdHJXSWtOMTZWQjlxSWsxbUZZZ2ZHZG5seVJ4MHhQ?=
 =?utf-8?B?UHFZRlcrYTlnT0grOWZtYmtVSzFDbUpDVUNaMjRmcWE2YUV3Rm9uNlJQaGlG?=
 =?utf-8?B?ZzkweWtxb0xybytUdEdnYlRPdTZOcUVxU05QWUs2N0JmUGZ5ekpuWG40U083?=
 =?utf-8?B?WDFFcVdzK1ZSRk9LWlVwbGNrczRVZko1Z3Q5aWxoWWRFVVFHNXphTHNMdmtP?=
 =?utf-8?B?cWZldGVBZWtTOUx4ajNXemZtYStXSVA5dDBZRHoyUnpRZTBOTnc1dXhEWFlR?=
 =?utf-8?B?YjRrdVhyYWM5Qk81RjJ6UGo3MTlOWXk3Rk9Dci9RSHlLV2JuYnZta092MERi?=
 =?utf-8?B?STE2NEpIZU5jOWZ5emJBRUZyUmV6VHY2ZTlVVWFLZFZCMUVqY21kL0lPWXow?=
 =?utf-8?B?L0ZZT28rTlJMaFAwZFJNQmg2am91YXVFZnJSajg4VWlISHUzeWFSVmg0emZF?=
 =?utf-8?B?VXdXSlhrcU9zMXVJbFhXcWo5NEcvd3doQjZsL295TmdoRGlBeExPMlU0b0JN?=
 =?utf-8?B?cXVuTmg2T2JLZjM3eml0R3Myc0lFUjZYVzBiODZnQ3NLV08vMWNJa043K1pr?=
 =?utf-8?B?YlljMzY3OEMxNE13YWJ3b0oreCszai9KTlZsYnhSL01Lck1wWlVPc1ZXd0po?=
 =?utf-8?B?d1FJTHpzVVVZV0JKZlJIT1pyeU5iTGdBS1BYYVNyR0FydEFjdU4xWUtubGNx?=
 =?utf-8?B?L250emg4ZkpoMVVweVBuSk9Wa3BSdCt6cG1MMGZuZUdlU25aekZja21ndGxC?=
 =?utf-8?B?cTRLSmV3NnJ4eXNwYy95TkRycFgvcHEzSm1mVUxUMS8vSFpQU3huSXNoODc0?=
 =?utf-8?B?SDJ3dzFOLzd5bjNVemM1Q3dsajVjUTBycGR0ckNzY1RucDJ3clNybjhaalpF?=
 =?utf-8?B?bVB3NWpweWc5dkhscTU1OFBFMitHc3hNcFlrYXQxVjhybE9keEgvV21UaFpk?=
 =?utf-8?B?RHh6TnJFVXNSL3hUS3NlcnRYQkVYRTRwbThGQThqSmFhWlZaRHY4czNoaGQx?=
 =?utf-8?Q?60yE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHIxeFhjdUNuVStJeEhTWjJ4VDJKNU1RWmFDRmdFSU5lSytianRTdmEvcG53?=
 =?utf-8?B?ZlpCNkl4MjNRZTdNVm9yK0hGSmJCNmwyZ0Y5dDdEK2djR3dCMXF2MVlFUHJU?=
 =?utf-8?B?OUtJWTczaTZMRG00RUx0Z0hjRU51NkNxUk9zMk1CTlNiQVJleWw1RWJaeUVQ?=
 =?utf-8?B?RWpZeGRBVUh3RG9sWlpsK3QxRmRtZUdFUVVDRkRMbjM4TWg3L2FxWFpLdTVS?=
 =?utf-8?B?QVFXVUFUWjBXV1hSZlE0cngrOUhERWpveGhLcFRlM3l3THh2Vm9KTXZpbGll?=
 =?utf-8?B?bXloL29xR3IxN1I0NTRqQTB3Qm5ZVjlXeFVvTmRMMGhjSEhJZEdDSVpucDVq?=
 =?utf-8?B?SjBpYmdScDNmNWFTSlVsdUJHMGM0NG9MZTZ3bVBBK3ZDdVdSRlFvd2tIOUsx?=
 =?utf-8?B?bVVQUVdwcThMaXBKVUVhSGdyYUNLZVdyVDNENWxUOTBQbWI0TEVSNU1jUHgx?=
 =?utf-8?B?RTFJOWs5S21EcmRaZ3VMSTUyYW9EUDZBTjg1dnRROFZYVGRLMTFwQzMxUEU1?=
 =?utf-8?B?WDVldzBjV3U5SmZ5Nk1RM054NWdGTVhOZm4yUnR4TjNKRW9vQ2Q3R0JvcjRr?=
 =?utf-8?B?UUJBOWY1MEhySWlFZ1psdWVWVEt3cnFjNzFBVXd2TFRLSWlQL3VMcUZuVGth?=
 =?utf-8?B?cVBiUGQ2eWxISVl2VU1aOXhWZDFETW1EZGlpSGgyZlRhbzFEaWNyTm9BZjZF?=
 =?utf-8?B?NDA5QTZaSTRTY016MERVQ3RkQTYvUGY5ZUlBWlZqWGswQzdYZDZBSUlOTitC?=
 =?utf-8?B?NEJmMnhuR3lJOGNnVnVsV0taUWltVlcyWSt3R0hpNC9qdTBZVmJOSnpMZjB4?=
 =?utf-8?B?UG1EZlh3dXlOOEhYa0MvbnpnTmw3aE9xK3pLUk9yeEZSSzQ0SGJzbnFRV2Zy?=
 =?utf-8?B?cDZLODRDNzlSVFJhU2xMbEFJay9laCtyTkhrSGE0Qit4S3pSbFczMEV4dVkr?=
 =?utf-8?B?T0dId0tJai9mSkNWTGNRcVIvNTIxa2FEQmFEb0NpZHZSbUNxWnpxTVVibzk1?=
 =?utf-8?B?ekx2WnR2VndoL2sxZ3Y5OEFoM3M0TjFPVWlqMDIrWWZrLzFyUFl2cWI4ek10?=
 =?utf-8?B?dnVjU0Q0MjNRSmZCUXV6Qm1tNG9Hb3pQb3dod2s2Q0ZFcDAxb0Y2QlFIYVdj?=
 =?utf-8?B?QVY2TWV0RFJvY3FRTmhFZVc2a1NlTEJFc3hERnMrOFB2R3U4VUhjUHhjT2xq?=
 =?utf-8?B?NW5NQWg3ZTdPQXBjNDhWVGNFcGxmU0lobTV2REZERlRMOXhIM1A0K0ZHMDVW?=
 =?utf-8?B?eXJZSW0xVnQ4eFdjeEkrQXBwVmZLT0xqNFYzd2VZRURrVmNTUEF1b0tGclJz?=
 =?utf-8?B?OE5KMUdyRVI3QVJxR1VnZDRaaTRNcjNMdS8rOTJHM1hUTzNDaHR1WUtNMWt3?=
 =?utf-8?B?UjdobEhrcXgwMXgyU0pyQlZESVI2SmJia0J4VWRXYnczTGdvOEgvYUNoTFEy?=
 =?utf-8?B?SndSYWltSU5VQVZyRzNkVy81aVlML2EvRFdUaDF5YnpVZnVLRmVmckRnUHht?=
 =?utf-8?B?bllaMDBGZmVPZUVxZkFzUHFyWEJaZVJYY0tOSFdNL3BPM1ExVzhDZDdqYmpa?=
 =?utf-8?B?dEdDOW13a3RtdlVMMWxQN3JxQUJLd3VNTzJlVTRYYXQzT3V1MUs1L3UyS0Ft?=
 =?utf-8?B?OUtlaG5PSUZHS0JNVmNZdTZER2F6M2pQY2Vyc0hQOVNUaWk5c1JJaytYbW5T?=
 =?utf-8?B?R1hxMm9JMDRteGIxOXFrcld2NGh0OVMrdHBsVGJvWStOeUs3RlVicEUya0FO?=
 =?utf-8?B?aS80MzBSMENEMmgyV0N5aHV3bi9hVHAyeC8rb3pXNnl4ZkhWcHVnZzFCU0I5?=
 =?utf-8?B?cTBpdXBRSlFEZUxWSm1OcXhnV2ZFb28vVVJLWUZLZldEdVRZYzdXQ0gzUGha?=
 =?utf-8?B?ZitBOFczcGtVU05PeE9SeVovQkM3SW9YVmZDS0I1NndmTE1ncFNEa016MldX?=
 =?utf-8?B?NzRLVWpOSW9JR3AxOGVhOFh5MG5wZWJjeVdEQTdvdjlORGdsd1F3QUNJVXFh?=
 =?utf-8?B?c1dtZVM2MWVmc2JjbGpmN1JRVUJiRmpRNGxhcVFJbmRMTFRDSFdCVlBnaW9Q?=
 =?utf-8?B?c2FNa1ZNVHRFRGl2dVpiUkhZUnhyQ3pCbkVBWmt2MVQ1Rk1jZ0R0Y2kyb0RJ?=
 =?utf-8?B?dzhuaUJzdndXVTMzUkdKUUEzb2FSQnJCRXIwdXRIZGVoRmJkbzZxUTY1WmFP?=
 =?utf-8?B?UVhsaXBaQ3prNzArS085Q3RKMitJWnIvVUx4b01ObElyMnN2a0ZYQnJxK3RG?=
 =?utf-8?B?MHR6OWdNV0R5eDd3SysyNDI5MStWSURPT0FKenowcnFMOU50R0J0ekYzYmZG?=
 =?utf-8?B?OHNGcTNlUjMzZDdoMUdxMlZVcDdNb3ZibnhTWjljNnpsR2k4cFpYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdac1aa-e012-417f-42ed-08de65a4b6a0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:25:24.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okJK4dafBMrWo4Y4+EZpzq3yFDB6ynQVk0glK2n+G7/zpskO1VQFVL7TqrlYteeZJGcU1+pRcgxcFJ6XaZt2SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A83EF100EBA
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:21:44PM +0100, Bertrand Marquis wrote:
> Xen does not provide a Darwin build configuration for selecting
> GNU tool definitions. On macOS, the tools we use are either GNU
> compatible or we only rely on features supported by Mac OS, so
> using the GNU tool definitions is appropriate.
> 
> Add config/Darwin.mk to include StdGNU.mk and force
> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
> the cross-compile path as we depend on the Linux ABI so compiling
> on Mac OS is always a cross compilation case.
> 
> An example of how to build the hypervisor for arm64 on Mac OS
> (tools cannot be build for now) using a toolchain from brew:
> - brew install aarch64-elf-gcc aarch64-elf-binutils
> - cd xen
> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang

Instead of `cd xen` I would use `make xen ...`.

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.

> ---
> Changes since v3:
> - set XEN_COMPILE_ARCH to unknown instead of Darwin
> - list binutils as a dependency to install in brew in commit message
> 
> Changes since v2:
> - Subject was "xen: Add macOS hypervisor build configuration"
> - Update Darwin.mk comments to more accurate versions (Jan)
> - Remove the build-on-macos help as we have no dependency on anything
>   coming from brew anymore and the toolchain can be retrieved by lots of
>   other solutions than brew on mac os. Switch to a simple doc in the
>   commit message instead
> ---
>  config/Darwin.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 config/Darwin.mk
> 
> diff --git a/config/Darwin.mk b/config/Darwin.mk
> new file mode 100644
> index 000000000000..176b27eac676
> --- /dev/null
> +++ b/config/Darwin.mk
> @@ -0,0 +1,7 @@
> +# Use GNU tool definitions as the tools we are using are either GNU compatible
> +# or we only use features which are supported on Mac OS.
> +include $(XEN_ROOT)/config/StdGNU.mk
> +
> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.

Hm, is this actually fully true?  What's the Linux ABI exactly here?

FreeBSD builds Xen natively, and it's not using the Linux ABI.
FreeBSD uses no specific -target to the compiler invocations, and the
linker emulation is set to elf_x86_64_fbsd.

I think the point here is that the toolchain must support building ELF
objects / images, because that's the binary format supported by Xen.
Whether it's Linux ELF or FreeBSD ELF doesn't make a difference for
standalone environments like the Xen kernel.

Thanks, Roger.

