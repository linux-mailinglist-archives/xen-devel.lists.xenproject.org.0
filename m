Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G5VHPh5g2nyngMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:55:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6449EA9A0
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221044.1529432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vng9l-0003Qr-FP; Wed, 04 Feb 2026 16:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221044.1529432; Wed, 04 Feb 2026 16:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vng9l-0003Nn-C7; Wed, 04 Feb 2026 16:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1221044;
 Wed, 04 Feb 2026 16:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vng9k-0003Nh-3v
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:55:08 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41aa6456-01ea-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 17:55:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6007.namprd03.prod.outlook.com (2603:10b6:208:31a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Wed, 4 Feb
 2026 16:55:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 16:55:03 +0000
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
X-Inumbo-ID: 41aa6456-01ea-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC3+cq1ZdbSrGfuFEHiNTnuiTJHB6lrKRNEe5YU8lhBj4pSC9lvhLP6zl4PYssZYcEKN1ZvrP4Rt0sdkpBV7tIGZ5MxNCH3S642lc4SoKH0R6uBmwdpo+l9LgWLbqaakNXBZr4WS24XWn0ZXeZlSTucGh/t0DwiaX15iBtlbsN8VOUxftOZNeBQKb+bbuujJDF6gVAYWSNfMI87yqjBZUGFQDRYBsQzhvmdARSv/x/i3CS/FvpFFzsjR7TUfVCNnFoZjALI2nu0TNTIhXdmk8VW1zjq28X8n5qx2AbHbzN/WaXh6np7Bi1UnM511+JqE2/NLZuYf78t3gk6ZGeWd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPs1UsyYwqrcOYex/6CBegJGgSPDcAjpSGEErJFK69E=;
 b=YervUzv90KqdiJnIVqBf7tO71yYWTztHKQEqJlzHHiqleyfIgMrzv+75/AEIVmQrFgYsHBjtWqMIDiH+dDTg4XnKbiAuJjK8Y+xHzo9RyXkVya6iEqHagCrH1OPKAP8FrSCEkq9H/aCj4j4N/cHfKnb8cIIZW9/pJNo41NzWAuob5HIBi/VVbZQxSIYPTrgq1z6RX/qAVBoF0/WIBPidX5uFiMc5R13akKsh/4R5DFyJ1D8bJnJ+vczqtpWF6jvCsHIMFj9p54DwKvMe9VMMcXc5xkzk1S1pIrKwBcvJ2rD2c24JyAYPaAksO6ruu2Tt/hsza2F0Bklmlr4drPsEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPs1UsyYwqrcOYex/6CBegJGgSPDcAjpSGEErJFK69E=;
 b=Q6j1JxiQ4c+g1A2xugBgUXc7MKB44vhz+d0VeNb2ylCh8UDvrz+daF0MZH9NOkpSPCiRFn/Nl9lLpSnUgmdTWoGtdE0W+S7l0WlI62NpRvF2BRsVIGY3vyI2or+JFRNybaGB/C1znfD/Xo1tyXs7+0QXVJ5qPvkWkGUaKDoy60w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 17:54:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYN54n8b1gYXYiTq@Mac.lan>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
 <aYNfVDgSgKCYd929@Mac.lan>
 <764e6a9f-8def-4f6e-8311-ef91b6c3886e@citrix.com>
 <a7ba4cfd-d452-48f4-99c8-a7c283facfd2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7ba4cfd-d452-48f4-99c8-a7c283facfd2@suse.com>
X-ClientProxiedBy: MR1P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc452ea-9817-4a6f-e87f-08de640e23a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjFGWXU4WENaMjJIMXEva2JBekVHelc4cVl5Y01ZNVRvK0dnQjBOYlpyNHV2?=
 =?utf-8?B?UEhaVXJsYXhHVGRIS283aXhPeEdaZ28wdW15VE1Mb1hjTDNqSHhKdEJQVnhq?=
 =?utf-8?B?aVpBcDB4OURPeHZrelhyTTNwVHZ3RjhpWXkrcVdvNWE3R0FPVGNWUndzd1Y3?=
 =?utf-8?B?U0lwVlk3a1VXZzhCd3NKRE1KWlVOQVplMUhEcitQMVN4OTRTOCtacjNUQktD?=
 =?utf-8?B?R3R6ZEcxYm1Sczd4b1BSK0hoaUVpRHFPQk9NeDBrQmVmTCtSdTdRWjI4OVF1?=
 =?utf-8?B?eGo2NG51eGZpN1FGei9xZ1N5OUoySkNxREFFV2JCRmFJckI1ZnlONC83UTN3?=
 =?utf-8?B?c2hSUzVNRjhlNzFZTXFscXhKcnhsQVFETDJHVU5mTEdNdEVkN3RCaUYxdU9X?=
 =?utf-8?B?a3RMOFA2M3FEMVlicGVJR3VncEJjWTEvSWluT3Q0UkEwY2krV0I0MVB1NWJr?=
 =?utf-8?B?dmoxT29rWHhVTGxmUFdnajdvc0JCS1pPS1RsMG5aVzNnOXAzSkRHSGVMcE1Q?=
 =?utf-8?B?Mld1R1lWbi9LZ3hSdjJvYzN3VWVMUHhpU3liZm1LTU56dTcrcjFrSEZKR2Vm?=
 =?utf-8?B?bmE0b05iNExIZ3BSYkdsSFRPZnhBclJkd1crM2wxMU8raGJlQTgyWWt5bEtC?=
 =?utf-8?B?MEdYYjJ3ZmR6cnVzai9DNmFlRENUY2s4L0UzZFE1UTF0QmZZVVpRUE9FWEdy?=
 =?utf-8?B?Zkh3aFlvM1hKRWJpenZVb3ZyRXUzMXRJV2tnYldSOU14NHZiNEI5Zzk2RXox?=
 =?utf-8?B?cGRHK3J1VExUeXJXalNCNzEyN0V0R0JCVUswWkVLZ1dsT29NdzFjVkVhdjB3?=
 =?utf-8?B?ckFUZXZTcEt3U1laWWtTWG5zTkNmaXpkNVR5am0xQTl6OE51aTE3dXBFR01Q?=
 =?utf-8?B?dVdtTmw2UlVvRFhRVnZYSG0rQldGSDMwZzdFS3JTY0dveVRpNEF0blVQU1o1?=
 =?utf-8?B?dENQSGYzSmpndTNHRGZiYlloaTMwSmIrWUNlUlBVWWY5dXkzT0xiaUpuOGNp?=
 =?utf-8?B?di9aeXJHMEM2SURibjhNaThPaGx2TXpnRTdIMkRpU09DSFBWMmQ4SEszU1Va?=
 =?utf-8?B?UGlzOXBWVm56U3VDTjM3K0ZrMkNRSjhZTVVEa0dwUy9WbDZSOVFYeWhtVEpx?=
 =?utf-8?B?SVkreU95SkE2QW5EdTNUM1BjWGI3SVRLb0lkQ3l5YmtadC9BUUozbUJpZEJu?=
 =?utf-8?B?V01rYklHaGw0VWgrQ3QrUGZLQ2RsM3VRdVIwUzJMZ3Vhckt6TXJzREs1MTJw?=
 =?utf-8?B?dzA3Q3VMRFErL29scWlLSjVDaFpGS1k1a090U2d0eGJtRWU0WjdyNC9FSHJL?=
 =?utf-8?B?bUZ2MzN5UjI1dDdCNUdiZW1PL0pZbU0yLy9PYldETm8rMFFXdzF3YkRHalVr?=
 =?utf-8?B?SGhkVUNZbnhiL2V2K1M4R1ZTZkZVVDJuNlJoL0RPRWJOaE5tZTBkaWVud1VC?=
 =?utf-8?B?OG5vbkNyYS9Vek5EQWRLdDV6L3J6dDhFK1Z0SW9ZOHlQNXVWZVdFMUVNcUtx?=
 =?utf-8?B?cVV5S29GWmhiMDlFQ1hBTFlIMExuWXVXL1M1ZHpUeFgyeGgvcDZkT0dWaEUy?=
 =?utf-8?B?Tmx3cjdzMEJ5SlkrOGtRSkswcmJuT1dTb1R1djB0dFlXWWJ1VVEvcDFsSCtm?=
 =?utf-8?B?VU9DM09ya2IwTjZVeEZaZzU3R0JSYmIreXJTUy9wYnNWSjVjSUxCdnI5cW1u?=
 =?utf-8?B?aXBEQi9YNE00Y0NUay81NUZnYzJnOWJ4YktVUWVkWTA1bDgrcnNqQ21Ycyti?=
 =?utf-8?B?SVM5aTloWTFuWmM4MXZiTGYrUWl4S2pjdjNDaDVodTlxL2ZDLytCOUVONUk2?=
 =?utf-8?B?Nk85STMyRVBtRU0wdDM3cHEzNkUrS3NTYnlVaGpTUkcrYUVQdHVlWitKY1lJ?=
 =?utf-8?B?c3ZzQWpwL0dmQzdkOGVBUmJwenpzWlVkQTN5N0hTNXBCTzRCMkZmRExjWkZu?=
 =?utf-8?B?WnFJY2R4bXBRUllnak5LRFlUWlFkTjZ2b1oxT2M1cmhPMjVQUlllc0Qvb0dP?=
 =?utf-8?B?VU43UzNEbEpaME5iUEVaWHVCVG9HcHBCeWozZW5oalFYK25ydmhBVWp4QUEx?=
 =?utf-8?B?dGlIUWp5S2NMc3BNcHZFdUF1alNaSlBxZGEzb1d0WThubWhyRXllNFBaWWw3?=
 =?utf-8?Q?SSUs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2dZNUhxMDdkaE0yUkVVMG4vTGhIdVZYbk83R3VMS0dWWFZVZEFYWG5QUTVy?=
 =?utf-8?B?TmIwQU8xZ1lYOXc5LzZrUVJjb0lwRXJKc1QxVmdqS2pxdUIrTFI1NmZUQ3FW?=
 =?utf-8?B?UTNNeUFpWGZ5bFpHRkRkS1lyRGxXRFF4S1NCMTNwNExZQnRwOGV0WDI1bEJt?=
 =?utf-8?B?MHFEemRXbTN5a0lhYm9adVVzSUJSTithLzhrQWloTVpYS1l0R3V4UUdxNll1?=
 =?utf-8?B?K0RtN05GSGY1TmpIRElxWTdramYvRkZLMEwvV2dwL2h1b1NOazk3T0VrWEF5?=
 =?utf-8?B?ZFhXR3BHOHBqT3Y4NEtVdmJtMlpWcWNjNVBCSU9MRXRiTkJRN25qZnBkSHh3?=
 =?utf-8?B?UUZ5Qk96aHFFbUNKMkIveVFDSVVSeUMrczQ3aWsvcDdiZ2JQc1pzZlBBOFB5?=
 =?utf-8?B?WTc3cU1CK3J6VGZsZWxTUXpOeDlRVjRBWnhTbjloOERxZmpTMkt4Y3Nzd2Zh?=
 =?utf-8?B?eFpVYlNDRC9FcWd6TGFJdzRKUHBOcUNhUERRQjZRTS9PL3FqcWg1bGl1alFs?=
 =?utf-8?B?Q1NUd3VqdHBhUllheW9WbHRremxXMERqQWUxdkJWaCtLY0JVeEYxemwxVGxY?=
 =?utf-8?B?MWI1VTArZmFvcE96UU1RUTg4TFZWdXJLTndjc0xVVDdWV0pWV2pPb3RaUEIv?=
 =?utf-8?B?Y2IrcFVXUTJFMkZjY0YzL2RGL3BQRDBQSStFMFR5dElBNlR3aU9haHFtV3Nj?=
 =?utf-8?B?OFhrREs1RkEvQkxVYWdFNCs2R2RCeDZZb0JxdytYMlpTNTgycDN2bzRxUC9K?=
 =?utf-8?B?c1VvUDM0RWpZTVJlOTBnMzErTHF2b1BVRWhpZHF1Z1picUgwdmdpeVdKVmlV?=
 =?utf-8?B?WlhVTW9iODU0cXlwWFlFN25VK1BGa1IrNWl6NGF0Z1d4b29wU0ErVC9Ld2ZS?=
 =?utf-8?B?bG9Pc25YNjBocmNXTkVZMi85MFF2V1RUTzFuQ1IwdjNRd0FxUFJCR2thYUda?=
 =?utf-8?B?TlZaME1saTBCZmZWT21MakRRUjZTRVRjRE8yS2FKMXh4NlpkQUlvdC9JS2gv?=
 =?utf-8?B?TDFJeUEyMmFVTjhKWHo1eDEwOFhPSnZuR2RsYWNsYWxRUE1TNVZuRGh2SWNx?=
 =?utf-8?B?OVV6RVVDa2VLeTlsNUUweVhyd1VndU9nZGFxUEZDWEZySW1YUGhNNERGd1RN?=
 =?utf-8?B?c1dJZTJpZ0hFcWl3ZTIxU21MOThMcWxqamdiQUVEaFNVRE1MYTUwa2c4Z3RB?=
 =?utf-8?B?bjhXbVlzSml0RXJvazYvYTBLdnlHbzdlZHBRejJjMktCUDRCc2ZVaHdrdDNU?=
 =?utf-8?B?dlJwcmEwWGRpTnBQUklTYjBTSEtURVAyT2tlVmVucXB2Q3pqMXdtSFZZbytF?=
 =?utf-8?B?a1lsK3dkcjltK0ZqZ1F0aytmYjNiK2x1QUFOa0lXenhhTzk5MUsxRGRFZ21E?=
 =?utf-8?B?U1RBMXd2c2MwdHJaZ1FtU09VNWkwZStrdllYZHFMeUo3ZEFDYXMvRm5kdFli?=
 =?utf-8?B?ZmRuUEczU2pVbkI5MmYxdE1mQ0I1YVRZMEhTYXRmV1gwMi9malBGN0pGelo5?=
 =?utf-8?B?bzVxU3RQV1JCc05raGx5WThWcmpxTUdyYm13NGpLcGFLUkd1R2F0K29xVlB5?=
 =?utf-8?B?K3pHaW5aczcwQm94TWFEVEltUElLMSs2UlRqNWMxSWU0U0toTW9EZmxaaGNS?=
 =?utf-8?B?WmZ5VWlVVGtXQTdlV21PRVlvMHBsRVYxbWQ0WnIvSVoyNmVieW5pRkI3Q0Rs?=
 =?utf-8?B?YmNCcERWU3VKeU1VTmJUVjZhd1hnZjRQS3pXRXBVMzZZY2lLMkV6Mmt5Ly9F?=
 =?utf-8?B?R1pvVlZCTFU5QVkxMWU1STNCT2dId1lZMndmMkpBYUdHYmRrRDFDUXUrRkJp?=
 =?utf-8?B?WDZndkRWSURibFBsZ3E3R210ckxwWVVQcEdBWFNmVnR6TjhESTVoQXJHdmVV?=
 =?utf-8?B?WUVEQktxUkdzdVpQdEZzbFFEZmcrV3NsTTFXMWovcGYwUllQVlhoZ3hqaFFH?=
 =?utf-8?B?T2MvaHZOOE9iNThNUHAvRHhGaC9XZFB0NWtGWXVyc2JNN2xFS0UvOU9FK2Jr?=
 =?utf-8?B?RHN6ZHJFaXN2bklucUZORm5DSlBmTTJjRENvUkwxcjBiWm52NllFNlI5WXM0?=
 =?utf-8?B?eHJHcTV2RFd1cG5wWXAzMkk0Q05HdDhyQTdYKzJUU3grak0rN1FCK3A0RDg0?=
 =?utf-8?B?dDZUK0tjOE0yVHczb3pNbmNwRW5rbnVTTnBxRDlNdk9nVTBneEVMYTFPTWdT?=
 =?utf-8?B?RHRyaThQSm1Sd2JmYUlwb29OYWNZL2xmamw5bnJEdWxuaG95NW9NbEVXVWlX?=
 =?utf-8?B?eGc1TDdUZVZqdTJVT3lET0R6Y2F3RDhTRFU4b3B1VzM0Z29qT2ZZMGFNeXp6?=
 =?utf-8?B?WWw1NlA5cDRXQlQrUUhXbGkva09CM1c4M1JEcXNuYzJRQ3lWa1ZIdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc452ea-9817-4a6f-e87f-08de640e23a5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:55:03.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyMeaOTkpDs30NjEIC7lBZ7jtzu6zsHaK0ajxwI5QguL+jVG3CCna01aq3n2EaWLuR2bKyJhTVQNpR0z0AtjUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D6449EA9A0
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:32:25PM +0100, Jan Beulich wrote:
> On 04.02.2026 16:12, Andrew Cooper wrote:
> > On 04/02/2026 3:01 pm, Roger Pau Monné wrote:
> >>>> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> >>>> +        /* Ensure all references to the old shared_info page are dropped. */
> >>>> +        for_each_vcpu( d, v )
> >>>> +            vcpu_info_reset(v);
> >>> switch_compat() can only occur on a domain with no memory.  How can we
> >>> have outstanding references?
> >> As Jan pointed out, it's not references, but stashed pointers to the
> >> previous shared_info page.  I've used the wrong wording here.
> > 
> > Yes, I saw that thread, but my question still stands.
> > 
> > How can there be any this early in the domain's lifecycle?
> 
> Can't (aren't) vCPU-s added ahead of adding memory?

At least on x86 when using xl/libxl the call to
XEN_DOMCTL_set_address_size happens after the call to
XEN_DOMCTL_max_vcpus, and the later calls vcpu_create() which sets the
pointer into the shared_info page for legacy (< 32) vCPUs.

Even if we could invert those two calls, it's impossible to know what
other toolstacks might do.  I think we need to keep the
vcpu_info_reset() call.

Thanks, Roger.

