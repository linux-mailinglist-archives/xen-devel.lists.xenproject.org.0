Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB8XCHAKcmmOagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:30:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FE66045
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210832.1522440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visti-0007jT-Cg; Thu, 22 Jan 2026 11:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210832.1522440; Thu, 22 Jan 2026 11:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visti-0007h5-A5; Thu, 22 Jan 2026 11:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1210832;
 Thu, 22 Jan 2026 11:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vistg-0007gx-Cg
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 11:30:44 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d5827c-f785-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 12:30:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DSWPR03MB989131.namprd03.prod.outlook.com (2603:10b6:8:35e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:30:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 11:30:39 +0000
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
X-Inumbo-ID: c8d5827c-f785-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgZIUBd04z37zCkRc3G0RwFJrcCmk9jiqQVY3FwqI0jkeL87q7wmNd87gdrsp6Lj+xlqNx+M0MeldzmSHyRfXeZIJXdY1jZEQtcF9a+QEgV/Xv1THEHS/pMF836pNt47xVdPKI6dLEYdwRxJR+gSATY02XX24CsXXvzojogLtcOuFYij47yhToOCopW2D3u6l7bmsXF8QoqR8MHp1KD21LLDgenpkNLHFMNxmydwBgy5XWxfI6gIrum6fVCnE0n88jQ34J2YlzNWOzYm3xwWMxwws4Jzjro3lJlDaU7Dyiak/gpSioL+G5W+PvW+s/DXg+L9EUrofyWg5rIkbyXRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JteJpugi06cOlCuufZCG6soSAeIsxv7YIA30SgVlhzA=;
 b=qPQ178azSxxUgUJsjUD5z9ylXJSfGn0VK5XdyQcTF62RUuI5d73zRkszquoMcyPbS4cGJl1u5qkttFjwMLflcv0iRWgTHgnXuB72gScdMaydIIqPnp86d3wYFNHTvLCr7+GfwriFmeIos7U/+MQDLNyvUyGUBs+voaJypIB66a8Ibkoqd+OxaDhgIVVcRSrVtB982ZlhTeEL/RnJio8pxk18QsVg81Z+q9dYHHnH1TAkPlEsd0odr06mqrUm4NbN5/nb8eTFT1pqtBL18QJLknudtfnbti1OzK3qypKMiaL6E1M+9WObHvheKw033DT7R+I31YzpqVOEsm569VW5Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JteJpugi06cOlCuufZCG6soSAeIsxv7YIA30SgVlhzA=;
 b=VyOgZ8b7WlEhjV2OvUusIAHv0eap1H8+VbyRfJw8/5PaGO6C6iiTj0so8HV932x5rlD9GK2t38R/kOZjZqU64DRvVUdU93TzjUIDBCbxxI8ycegykLn5IESSQTMRPLogrSAnbABOm/jGxlVz3EUxwaStTndea4Mvo3vdusVATZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 12:30:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 6/8] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
Message-ID: <aXIKWwYYXf9UgplM@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com>
 <aXHrgwifS3PDzdfa@Mac.lan>
 <f87d523c-def4-408f-9626-a268c636e582@suse.com>
 <aXH3nocF6a8z3ZHn@Mac.lan>
 <73daede9-d7ac-44bf-a018-b76d39b3eeb4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73daede9-d7ac-44bf-a018-b76d39b3eeb4@suse.com>
X-ClientProxiedBy: PA7P264CA0528.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DSWPR03MB989131:EE_
X-MS-Office365-Filtering-Correlation-Id: 873eb92b-073e-4965-fbe0-08de59a9ab7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUxGdjJJVmFWSklLRGU0U3RTZ05QM2dtMURha1R0SHdZSGtUaENmc0V0MmdJ?=
 =?utf-8?B?Z2ZHdVJBbE8xUEE1V1JjdHRTcE80VDRLamlLbVdpaW1xbXFDUFdOb2V0a3pa?=
 =?utf-8?B?bHhENnhCUzUzMk9tOGpsVnk3dHUxK3pCOEJXSnN0eWk2TWUzV1dJa00rM1Ni?=
 =?utf-8?B?dG1lTzdjSWRSUHhDNGIzVHZHZ0N3UGJVT1dsbjZGVmZrd2N5RFM5L3NWeDlK?=
 =?utf-8?B?anE4MWRCL2pDYkhpalQ0bGpBMXpDVU54ZFp4ZHg4d1Z4M3dJdXBicFp2bXBL?=
 =?utf-8?B?cnNDQVZnU2VGaDJqcHZqblNpSW9SQlRJS3VvbzVCYkYweUIycnNpMExSQ3Ar?=
 =?utf-8?B?SmRVN1FIcGczc2hqVkZWWGJZT3BQM2NCdmV4bGdIdWgwcjlxa1I3ZXNTTFk3?=
 =?utf-8?B?dFRhTXpVWDArQ3c1MFZIRUhyVWhFVkJrRUo0eGpkU3pXZEJucVNCYk13WXJk?=
 =?utf-8?B?SUlBNXRGR1pqWFBiN2I4NWROOFhhNkQxQjR5T2tGTlNvS2l1aSt6R21VRU5M?=
 =?utf-8?B?dENsV1IzOWxYNmFkdFFNT1VWZUpnSVZqd3locVpVZWRyMjJjTzE1Z3ZFL3Q1?=
 =?utf-8?B?dDRCYXozK0luVWdLVENIa1MzRlpnR1E0dU4zNjhCdmlQUEp4TkR5cWd4RjhL?=
 =?utf-8?B?aU1SNWxKTVBYTkI1WHRnd2JWS2FObndCRHdXS2VvN0hmZ1hRZDJUTyt1VW1w?=
 =?utf-8?B?VVp1QXk1N2Y5YkZOS0NCYUFoMEw1Qlp1QklEK2J1L1hpaHRrSWJpTzd6d3RO?=
 =?utf-8?B?SlZDSkZGWFgvNVVITXJianFqa2RKbjRaajZtMzNjbEt4blNmUHZYdHlCbjA5?=
 =?utf-8?B?ZjRqK3F1V1lQMEZ6Y3VYMkpCNG5rdDlCemlPU09qVlBTMzlNaXU2ZS82OUtW?=
 =?utf-8?B?S2xqNTNSUnAzWm52QnpROVBGNCtYRDRDeGRCSHJxeFJuOXlLVWxJYmJjQ0Rk?=
 =?utf-8?B?WndCSUVoUEF5NmVOc3NNZng0aGlYZ1VMOThHVHZZak1YU3ZhM0ZDSjREN0hH?=
 =?utf-8?B?SmZ0ekNaUkRtSkNvSGR1VlR1VXhpTVhrNjdCbW5kSVVvMWU3VXNINlo4cGdq?=
 =?utf-8?B?MytzaTA5RXoyU2lPWkZJQWtFaXVwTW5xY3JLY3ZGYkVHekVCZ0FPQ0lwb1JY?=
 =?utf-8?B?Mzk1ZVdvNldCZ1M3RjZLeStraDVsNUtnblZzOWJyZFQxSU5ETElBWEhVc29S?=
 =?utf-8?B?UEgrdHA5bDAralN0RUJCMEJMeWZ0TGM3Mk9KWFR0S2ZHbmZKQ1hSc1FLc0xQ?=
 =?utf-8?B?TEVweFNMMGRFaDlRdzYrL3pCbDVSbmVvNUxOTVlkWHpIRFpRaURSSEFCU0ZU?=
 =?utf-8?B?Y0swa2E1STBUdVpsbmJHdm5WdEsrNzBzSHppNEowT28yU1FDM0UwdFBhelpK?=
 =?utf-8?B?OTBubDZOTlpubmlGTkVqaS9JV253Q2RQeWR4b2tMa0xmdm1maVk3TTM2QnRG?=
 =?utf-8?B?WlJUMW5SbjhUdHprZkpZQzV4Z2RINFRSN1hrMDczVXFPRVgzQm1XYTVqekpJ?=
 =?utf-8?B?cFd6VGZKeGIrVUtraEg5U1FETWJNTnp2YlZyVGM2Um5Feld1RHlQYk5Za0Ru?=
 =?utf-8?B?bDRvZ1dZT0QwbnVLQ0EyejdlZ09VeVBUUURTeDduNTRCeHIrblBQWlo4Y1JH?=
 =?utf-8?B?RWpTMUNrYk9vNEZ6cUJheHN2bnR5S1NMd3NXaHpuUllWRjNTM05vVytqVzRq?=
 =?utf-8?B?ckQxT1Y2aVBxdm1pZzc3eTJQOFZ4a1hPTWcrNnV0M1Rad2NjYk9ZTzhXc090?=
 =?utf-8?B?TWVaa2Fkc3dOazF4QXFodHFJTlZTMkxGMlBTVUZrZUtqNVNtdUVETGlMN3JQ?=
 =?utf-8?B?WXd4SzZ0TCthUVo0ajBTUkl1VmMzcy8wVWw5RGM1NHpwRWpNL09tTlNCclJ5?=
 =?utf-8?B?L1ZNbVcyellKRy9Pc0J6N25BSDRWL243Z2NKM29zZXlBb1IxUFY1d0NzbWFS?=
 =?utf-8?B?d0FuOVNsNmFRVXdFeEQ1Y3VUbmtiYmxReUZVMEN1cjM1RjlSajV4M0IrYVhB?=
 =?utf-8?B?NkcxVnFvZHdIVFZzMTFGTGJsb0xKci9ldmd0dEVoZDRxS1k4OFRNTEtmWlRT?=
 =?utf-8?B?RWZjZFM0TXltUk5sWkRoR1VwV2dTYUUweTZjenljVUdkeUYvL2JOTTI4NjJj?=
 =?utf-8?Q?EllY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am05MFh3ckMyQm1yL0RSSExqV0JJcEJVcnFwYWE2dS9IcC9vK0xJOGR6SCtl?=
 =?utf-8?B?aDdjNkpLUjZqdFlUdmViQzhaMWRVWGtaaUNyb2s2Z0dBQmNCTkp0SU5QVUhy?=
 =?utf-8?B?YlQ1a2FTQWJWOHphS3Z1KytHdWRURlV1UTNvd3FscE8wczZvL2FOU0RIblJJ?=
 =?utf-8?B?TTFUUldEM2d6ZjY4YUQ4ZDJ4cHNTd0tTcFd4eGFtdUNaVGpEbXJJMUptVGhF?=
 =?utf-8?B?ZVBKUlVWWkhXMEcrYzBYbmFJeUtBMS9kWXlLemlaZU8rSCt6aWhuRHB0VXV2?=
 =?utf-8?B?dlFvemg0M2xMQnhOYWR2MFBKR01UaWQrMXluOWYySEhKaUhqNm9ITVBCa2Rx?=
 =?utf-8?B?VVRjWjJUZnJ3WkZQOTZKdy9YN1BxV0t0WWF0YjBjNWdrK0lIaU8wMFZRS3hQ?=
 =?utf-8?B?SmNta1QzSTNjK3g3anR4a3V1NU1jWnFtY1E3ZlVzbHFrWWdrSXVHak56T1h6?=
 =?utf-8?B?cWd4dnJ1QmZoNUNUcHUxWTVpQjhFcjRJM0paODFQY0xiZUtxd1BjeFA0endH?=
 =?utf-8?B?RjNYTmpCN2w1RXBZVjBpZVpUQzRhVEp0cDJaSDk3aVI5dUZ4WEw2c2xwRldK?=
 =?utf-8?B?K3V2eHdLV1RpNTQ1V1JlNk1ua2ZiOENMT3dOOHhxdnEzc25JMGx5cEpkb2FB?=
 =?utf-8?B?bERMMzB3cVdKT0xTZVM3K3FSeDhOVEkrRS9pankrRUlpbXlhcVljNlhwNUJa?=
 =?utf-8?B?eU1tNlIvVmVnTDVabU55dllxY2c0eVl6Rkc5T0FGbzRka2M2Vmk2alFyQk5V?=
 =?utf-8?B?YS9SdmxpbjhwVlQ3QTVuZmlHWEJpSytzNkpmVGFPeXNZYzN3K01CdVlPRCsx?=
 =?utf-8?B?dlpzRHp6VDA3cVdHNXo2eEc3TWsvdC95SWUwdVg4R2lVa0tubFQreDNENjZm?=
 =?utf-8?B?bkFZRDZNK0xGZWFOMmdpMkZMVEorakJvdExTYXI3cHBBQVlhQW04OTNtVnNv?=
 =?utf-8?B?ZzhLSlZRaENCM1BydldGOWRSNnBUM3ZEY1l3eWpJRldhY0FYVFNLVkkxZmJP?=
 =?utf-8?B?L3kwS3AwcDA2b1psdXFHU08xekRmbHJlRmNaNnYydXpYMXVZM2U3NXI5ekZz?=
 =?utf-8?B?RlpMbE05V09mL0hDUkpnM1hTN3pseC9LbDJlcUQyeWVqdlJPTDFoelNhU3Z1?=
 =?utf-8?B?TW5XeWZVaVlMejZ6THZXSmlLV1kzdE1yd0RndWNTbG1vaDRpaHVVaXcxNEdQ?=
 =?utf-8?B?WC9Lem1KYWVNRWxPN2lHNnZpVVJVWGxYQVRoVndTUUJBUG8veWt5c2V0NFJQ?=
 =?utf-8?B?aU95aXlzOW80NkR0SmFyczRXWEpJejk5b2QyTVBZSmVCRWVQVjVVbU5zR1Ax?=
 =?utf-8?B?RWF1WDM3UmRtQ1U3VkgyM0NJQ3RQanFNSnlMa09EWE1Nd0xGZzNRNmlTbHlo?=
 =?utf-8?B?ajlVc2dGaTJ6Y09FcUx1Z25ZYmRlcE01ZUNLNXdrUERhckRNUTZOc0ZQdmZC?=
 =?utf-8?B?SG9CRlBHTEJmeTFWZTFhYlhSRSsvSlVQNW5UUHRFcEFCS3dGMFBoYlNFYVBm?=
 =?utf-8?B?dEFjNFdlY1RPZlI3NGNqQzR3UmorUXUyMEVwUnlsdldXeVpWZDYvV0tlaTNa?=
 =?utf-8?B?d1UzdDlqZnBlTEIvQ1RXVllNcmQyMTVOTkxxSlg3TE16RVl0eEpTYVdwMENn?=
 =?utf-8?B?RTdBWVRFTUNqQUhPbDZmZnJTK2NXaGlqV0NkMlg3RG1MeTNYbEs0LzhwYmN1?=
 =?utf-8?B?eDVxeDB4V0o5NHJVQ0w3T1ZlMU9UcWxaR3J3UnNhcGx3QWFhNGFOcnBnVEFS?=
 =?utf-8?B?SmpERyt0bXVZU3ROblk1R1RxblR0MFV4MWxycXVwQzJLazRzUi9nL240a2pn?=
 =?utf-8?B?cHlTVjRFSitGRUZkL1BFU0t4NUtaZkVOUXpwa3NuQURrQ2lTeXo3bExPYVRW?=
 =?utf-8?B?SG5LZ3c2RldYUXM4MWhrblRHVDM5NEFlTWoxdnFXY0lZYlJoblBsdlBxRlJO?=
 =?utf-8?B?V016MHlKdVFsd3BnYUhwSlEzNXloSHBGWUxLdExhZ0hWR3ZzSndHaEF4cjYy?=
 =?utf-8?B?SURUSk5lc3JIY2I5UW9JWnRDeGNXeGNBK1kxMjl4VDNqdlY1VUdtc3ZaTkNt?=
 =?utf-8?B?N3FoWlBOeW1nckx5d0NSTnAwV2plakQzSUhFQk9RcEgzSVJ6VGJlYkcrM0ph?=
 =?utf-8?B?bDVveWo5SSs1MjRtMnFENHBLRWF0RmxnMUxPUm01M2JKYk1DR0FVVEFwaVY5?=
 =?utf-8?B?RGhJa2syK2NXR1E3cENYejQzOHc1SXR4MXpROUNtZVp0UnJoZ0ZvcGw5cEtq?=
 =?utf-8?B?ck4yeWVLak9xNlZkMnFYSmovVS9rRXFZQjRNZDZ0dHJtZktzN1BPakN0YVEv?=
 =?utf-8?B?eUMwL3ZJTGtCOEpFK1JOZlNqaW1tRERYQjVpbXpDNEdhUGFqN0hoQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873eb92b-073e-4965-fbe0-08de59a9ab7d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:30:39.6592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QosyKAJu0GhLL8hbMFRVkxMhCR6OsoepQTdf/2J11wwgjdcxTUNKm8JGxHXipA3axpjnVI9Ujk+n+ETH9yptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 852FE66045
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:15:49AM +0100, Jan Beulich wrote:
> On 22.01.2026 11:10, Roger Pau Monné wrote:
> > On Thu, Jan 22, 2026 at 10:28:51AM +0100, Jan Beulich wrote:
> >> On 22.01.2026 10:18, Roger Pau Monné wrote:
> >>> On Mon, Nov 17, 2025 at 03:39:30PM +0100, Jan Beulich wrote:
> >>>> When this was added, the log message was updated correctly, but the zero
> >>>> case was needlessly checked separately: hpet_broadcast_enter() had a zero
> >>>> check added at the same time, while handle_hpet_broadcast() can't possibly
> >>>> pass 0 here anyway.
> >>>>
> >>>> Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Thanks.
> >>
> >>> Similar to the previous commit, I wonder whether it would make sense
> >>> to add an ASSERT_UNREACHABLE() if that error path is not reachable
> >>> given the logic in the callers.
> >>
> >> That would mean
> >>
> >>     if ( unlikely(expire < 0) )
> >>     {
> >>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
> >>         return -ETIME;
> >>     }
> >>
> >>     if ( unlikely(expire == 0) )
> >>     {
> >>         ASSERT_UNREACHABLE();
> >>         return -ETIME;
> >>     }
> >>
> >> which I fear I don't like (for going too far). Even
> >>
> >>     if ( unlikely(expire <= 0) )
> >>     {
> >>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
> >>         ASSERT(expire);
> >>         return -ETIME;
> >>     }
> >>
> >> I'd be uncertain about, as that needlessly gives 0 a meaning that isn't
> >> required anymore in this function.
> > 
> > Hm, OK, I was under the impression that both < 0 and 0 should never be
> > passed by the callers.  If expire == 0 is a possible input then I
> > don't think the ASSERT() is that helpful.
> 
> Oh, so you were after
> 
>     if ( unlikely(expire <= 0) )
>     {
>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
>         ASSERT_UNREACHABLE();
>         return -ETIME;
>     }
> 
> (perhaps even with the printk() dropped)? That I could buy off on, as NOW()
> is expected to only ever return valid (positive) s_time_t values.

Yes, that's what I was thinking off, but your previous reply made me
think there are possible cases where expire < 0 gets passed to the
function?

If that's not the case, adding the ASSERT_UNREACHABLE() would be my
preference.

Thanks, Roger.

