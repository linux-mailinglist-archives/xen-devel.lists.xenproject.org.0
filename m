Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61391BC9BCA
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 17:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140740.1475530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6sSO-0002Dp-Kw; Thu, 09 Oct 2025 15:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140740.1475530; Thu, 09 Oct 2025 15:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6sSO-0002BA-Hs; Thu, 09 Oct 2025 15:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1140740;
 Thu, 09 Oct 2025 15:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6sSM-0002B4-JM
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 15:21:26 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e5c210c-a523-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 17:21:25 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9006.eurprd03.prod.outlook.com (2603:10a6:10:47c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 9 Oct
 2025 15:21:22 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 15:21:22 +0000
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
X-Inumbo-ID: 9e5c210c-a523-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHiq5x/qavxRGiSJqHYMbxJBpV35ggnbR2gHBRA+YUaoRRdWqPRQVhPhtMDeTEAXFLWETzXt1Ayr7pzCetJXufsyQ+9Pxh/qXtSZKc+UsDuuvyFPHM7M4vcdG9Ec39OryWeqToFYc5Lt0iouukMyeT5xQKVzVxQfmFhj5SF5DMhQ9Nbx6w6I74ofqTQ/o0oI1cKZrCCgfsThna3lKdQbYIOKjfS+3HMkHkPjluPIdoE7yOFpq6UR9wWjoV3hgT21pj2wmMPcGsKXyEzWWe2Mui7WnTSsknPS5fyeEYip7DDMvd27AjnJmnP8PSFKlMBmral2MLL5EnL/fk2IOWbYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdDy8jsC70QrUES5frGDpRuKUOU90x3l6nrHViWL/fU=;
 b=tmv/WgLobA9Kp6qSBPAG8VQAwafZcd8YuOs8jROgee8UqS7uNEjg0fBfPV1ETz1CsDfx+xlQIhRxV/UA2hkgwMH/wy0yCVA8ESiWjqMhuQ6EkUgL1ySW2JxUJsFqwu1+yMxEBaTt8mQvaB8NVyf3HpDrAUkKfUQ4gzx1L1Su3+2qtjmlzDkEEAs+bVs25vO0zPjulaIagvuVL6OCm6QvCNf2X2mPA8RgnDO+ZHkWDR/SjNC8ISfhPfN88SVQPNXUPmCUWAQID59ynfR3gIN3Qs8ShOFJwRIEqmWJj/k9vm3eEBY8Pv5Q2XW0o7HqjSUkOhwf/fiV6lLBEPOrJXI2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdDy8jsC70QrUES5frGDpRuKUOU90x3l6nrHViWL/fU=;
 b=kxFERzsDIprClir3Fpe8U4HMl0ToQa7mlEEBMRopZXzQ5DqGSLoJCxBrWC13hIjIjOuaAfFpwznj2wUCntiFCQUVwO8fCfXRPa5UDv9h8hPBpbfThtmPt/2lyWs12PN4ZJkDZFGduyyaF/Au1JRTL6oO6gTkApt5GMmgH3znRNLH4K8HTT8oA8+LV4rZfD2yOofoQ1UH+qtlucOh7/s2ArpnG8V/6UdpcPHNASPXUTII+/6I/bYlCGQbxDQFCrBgvkWzr2r6Bip8nGJAzP84HcPCCD9QNkN6ham5X8jf1N2s5uooidzfAiigDAYvPcKXsxwl8xq2DXd2lfLOSkTStQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <16727e5c-4a0e-4c2e-91c5-bccaaf9a3205@epam.com>
Date: Thu, 9 Oct 2025 18:21:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86: hvm: vlapic: rework WR/rsvdz masks for LVTx
 regs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251009114249.1964387-1-grygorii_strashko@epam.com>
 <693b0730-b541-4d24-a83e-64f9b09705c1@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <693b0730-b541-4d24-a83e-64f9b09705c1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b775ed5-fe34-48dd-ba53-08de0747813f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXFsWm1BRE50SGdEYWt5K2tMNXBtZDdrM1hRVlkrSzV2WGVWSWw4V3dWa2Rw?=
 =?utf-8?B?NlFweFdsUTlqZ1QveTc1a3hRZVFZK2dTQnVQd3ByelNWampweU1WcHNNOGM0?=
 =?utf-8?B?V1dLaUcyT01hbzl2bCtoVzZXT3poenNsanozMmNnU2NPUTlCUkVtM0ZlYnNN?=
 =?utf-8?B?aW1JeU5WU0JtOUsrdjMwU1JWb1ZmY2NhNXBLZmRkWW5JcVAvOVEwZ0JjYjdq?=
 =?utf-8?B?cmNDNVlrcys1RXN2Y0tUK3czcitiMGNIaDhkRGQzd1Fxb1pxUkszZ0VYRUZM?=
 =?utf-8?B?WlV4ZXd5T1I4L3g2OTVMQ01aK25PNTJ4UlplNjF2UW5uUWsvUXVCVWJwWWhI?=
 =?utf-8?B?NGVYYVRiZUYxMm4xNDY4RXNrb0svT2RWWEVSMUxXbk5ZVkxGR29QaXlJTDRZ?=
 =?utf-8?B?cnVzNys4WC9tMWdlNUl5MDVIeUsvT2dnVDNpSTE0WHh4R2Jrd0habnBHbXpi?=
 =?utf-8?B?aDN0eHFpbWZGMXh3MWVSeTcxLzh0NWFXRGxqeTRJZjExUm8zbnhMMDZSUXJE?=
 =?utf-8?B?eFZRU2xPVlM5dWZOSlJyQVdDcU96WTZJY0JqVEMzN0RkdTdNQXRGbHVjbk1G?=
 =?utf-8?B?S3g2Rlloak40ZlJINzM4NFIrWEVPdFozRmovc0VIZXpzM2Y5MzZiUWJlTU9r?=
 =?utf-8?B?c0piK3dZNmJFMW9Ba1BkTjhiK2I5cUxIemphSGZWZkdML2Z2dmdrRkRyZXpv?=
 =?utf-8?B?Z21Vb0Fic2RTYlBXOXVwSjFKUXNuUHNXM0MrcWljWUEvMVhrQ2ZZTjlIcEV6?=
 =?utf-8?B?U1ZISzFuTTdWM2JLdUpTTTZFRDJqVksvTzRRVTlpemdTaVlLQkJ4M2dxWG1X?=
 =?utf-8?B?aDRFUzN3THBSbURhRm9QMkgzVTZDVGlKMjBubWp6TnFJVVNTeVBlOUlKZlpR?=
 =?utf-8?B?ejFXZFd0MUtKVzFjaXhqLzcvc1E3amJZVDFPLzVFQVdqYTFYZ0xtQ2hReVM1?=
 =?utf-8?B?SjBPRTIrVDlRN2R0MlBDZ2lub1NmL1lxTHNHZktDZFdiVnNnNHVja1BaUjNk?=
 =?utf-8?B?d2VWRjlOeTJFRzZxQ3FGR2Qrb1BIdUNUOUNmUEFBYUFhNUdSZWg4VUNNNGpr?=
 =?utf-8?B?K0cxM0s4WDBSckFqdWZGQ25ZbkdVNldacndjMW5zclRTdS9rSTFucGxaelJx?=
 =?utf-8?B?V0l0UU5wMGFneXB1cnlIazlFS1ZlTnREODZKeDhZUG5pcEhNWWFwMk1ISXps?=
 =?utf-8?B?V2k1MmtGaURZYko3SlcrM1pVQS9zbjNJMVhQVHA4eVh2RHlyZXlndklWaWsr?=
 =?utf-8?B?eUNEaGhSQnkrT2tpcGRVYmd5bSs1M2dibUZwajhYemhlZEk3ZHhXaFl5czNr?=
 =?utf-8?B?ZzBjVHd1TXdyU1JRRlhOODVTamZRcFMrdlFJd0JadjlHbnQwekRCYTN6S0Zt?=
 =?utf-8?B?RUxha0lQQlhLUUxSQStNWmJPcmlKeW00WWVMdGdOL2kwR0d3NHRJVE4zS1c2?=
 =?utf-8?B?MDBVOUh0ZWhJN3o4TWZBL0QzblhaWkJSVnVSTVVFeElGUzl0dUVaU081Q1ZM?=
 =?utf-8?B?Y2ZScHBDZ3RoY2pxV0grRllQeXFja2RDbUNJbnp1QUphOHF3UW80WGJ3UENw?=
 =?utf-8?B?WDB3Z1lDbXpPM0lsdTFIQW9XTU92emNra2lhdGRoQnRhTTVnNS9CNnF0dHpa?=
 =?utf-8?B?anNidmRRSzViSlNhZUpVQmQ3OC8vVTN5QWFyb0E1UEtjMlAvVy9EU2gra3VY?=
 =?utf-8?B?NWJxeHJVRGNBOTRPSVQ4ZUFLYTFNK1RBY29WQWVwcHN6dUp6SFl0ckFmSGR4?=
 =?utf-8?B?U2x1Q2o0TXhOUFlZSk1VU3kwTEp2SlZETE9FeENLdlgwc0JyY3lwUmpKclQ4?=
 =?utf-8?B?R1pKUXJKbXJoYjJWWGdUM2lSVFoxblFYUVlhUmpYVHFYNC9ySXFaNEJkSWlW?=
 =?utf-8?B?K2JhSUVtSXBZbm05K3U0VlV6WSs3clB1Q0FpaEVLYWY2cWEzTzRSMmkxQSs4?=
 =?utf-8?Q?m9wzpk9xzKCpLif+qcIStCge9gDs7QhM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2QzK1daaTN2VzVDZzcvbVZ1TVplYWRhaFM2aXEyVHllVWJMVlVkWEtvV05L?=
 =?utf-8?B?dXdRVFhIK1BUT0pKd0t3NkZibzV4LzhEdlF5NVhuc0JQMXJuR1h6aTNETE1S?=
 =?utf-8?B?aHBmRkxGTkt6WkY2VnpCTjdCNGswOVFzNUF4b3dWdnJZMTJiNXFjS21IMHRn?=
 =?utf-8?B?cFRMcXAyQ0hIM1hrVlB0QTJuQkIwNUdPaWpvek9kT0xlNnhNZFhkbERFTHIx?=
 =?utf-8?B?UUxCdVBCMUVzSWZyUjM1TGd3eU5uUEc1bDJOVVIyZW94SHVkNGpjZ2l4UTll?=
 =?utf-8?B?K0lQN0ZpbWMzMVROa1NIampBcTJiVWFlRnYxc0pZWWVuRHFCbUJmOE5wSkRs?=
 =?utf-8?B?b3N6YmxQVTR1QTZFZDFuKzR6U1IrWFpjQnExemlrcUNOOWhaekxzTGhicmt0?=
 =?utf-8?B?R3hLZ3pCbXU3dVkxMnBVRTA3SVB0ZjhTWmxNT1NDVHE0WjloK1FXVCsyVnha?=
 =?utf-8?B?ZDNEN0Z2Z2k3MFhwa0pKYkpaQlZERDc0aFFPTm04ZmtvdnROc3M5OWhYU1BC?=
 =?utf-8?B?Y1NrVjZCTGh5RTRnSjdkYU5IQ2lPc082OEkzQWk2aDZZS2pROEV3NERnYVR3?=
 =?utf-8?B?RmpIN0pSK3FYNzNGMk1kU1dQVFRtZ292NTY5czh0VnBhNnhOalg1Q25QMlNN?=
 =?utf-8?B?aG9rMTZ0ZG5LeUxja25hMDBQQ2I2TW5HVTBEaC95RmsyUXJBSm0wQVU0RGRu?=
 =?utf-8?B?dE1Dc1JxazM2czZoSGJ1RWF5aXZ6QnIrY09SY2g2d0lnVjBsTFR0OEd4Ykdq?=
 =?utf-8?B?VXEyZHNUdmVuaVVTSERiMGVTNjZkdTNPTVNrSndxa2o2Rm5jeFd4YnhyUE5z?=
 =?utf-8?B?ejAzSTZBS2YvUDR0Nm9mQ2svbzBmNS9GcXRPUGNBRlhZUjUvaHVseWoxVk5X?=
 =?utf-8?B?WUZienFwM05Wa25YZ1UzVEsrak4wUEpXRXB4clF4M05NUHB2MW1DaXpiY0xo?=
 =?utf-8?B?c0k5RTV1S3ZPWkJXSFpqSmY2YzB4M3FDQ2FLVTlKS2FrQkNjOEliUkVnYnEy?=
 =?utf-8?B?dnk1YmNCNUl0aXVvY2tjaDN6dlBjRUd6blRhb3pJVEIvR0VjV0IrRXNRZ0Jh?=
 =?utf-8?B?TktHbEZHeWQ4d3cxeE5UUzJ4blZnZEdHOW81TUIyOXFFcTdMa3F3UW00RmhZ?=
 =?utf-8?B?VlJBUDlqbU56MEp1OFE4TWw3Rm5VcEU3UHc1TzRYdTcyK2ZsNnNFSVphTEQw?=
 =?utf-8?B?eU1uUk5LU0V6MHJVc0xHQ0lTTW5QOFU0dnhHSHVuYWFIVzdSTUhkdHorN1ls?=
 =?utf-8?B?Tjl5dmdvY0ZKT1c4S3FiNDZ3R2tmVTRPQnQ4Z0NXaEZ0TWxZYzRwUDJFeFk4?=
 =?utf-8?B?ejAvbzNnbTl5eVJjQ1lkK3lEejNxL1A2NXd5NnlDU3cvMGtnNjJLYnlFWkt0?=
 =?utf-8?B?ZkZVTTBaRW9mK2dDdEpGUHRIOTEwOXlEVTMxWEhCQzc5K3VLK3Jaelk3Wm0r?=
 =?utf-8?B?QndTNDlSQldVRThQdTNJR3gzOGxkMVhrSFR3M1dsbmMwZkVpckRaeHMrWWJt?=
 =?utf-8?B?WlNlajM0L1luTU1DNnlYU3NYTFpQT2FBd3JmWlQ5SlJkRG56bmVsRUFQVXFF?=
 =?utf-8?B?N3puNVdpdzJWd09FNFBISU42TlN6WmJTNmhnZ1dxdWN2Q0lvS21Ga2dWaFRa?=
 =?utf-8?B?bi9QZGNROUt5bVBXNHVBRU1uZTFHVXJtUkZhaWZQN2ZQMWNhbXZYMmhyMmJS?=
 =?utf-8?B?cmZlbHVFK1NucklaZm5sUXF3U0ErQUMzaHBFRjlUSTg3anREUGVtSGdPd2p0?=
 =?utf-8?B?aTluZXBIQVdvOVNEQkhZZzJUb3Jack9nNk1mVUtMTWRDZFM1amxsN2xHTFZN?=
 =?utf-8?B?MW8wVXhrR1lYYUFIbThEUU9mT1FBSjR6czVvUHRjWG1xQmd3cWkwVlpFUHpU?=
 =?utf-8?B?bndPM3licnBLYzFidUJFdmJ2L05xZ0tCV0xTQnpoL3dURkZiam5jQk1sN3pp?=
 =?utf-8?B?Qk85MzRHRlM5RkxTSE1RbWc4aGR0SURLUnBiVWVtanF6cmZHM2V3YlJXVXhi?=
 =?utf-8?B?OXB2dEtxaDRPd3BmNUF4aUk3OEtyaEp0LytZZjU1S214TmxoZ0c4WER3b3o5?=
 =?utf-8?B?ZENUMDFYaWtTRkRtN3lMWjZrL3QreHNOMEVPakh3ZEFmRXgya1ZpY0VvcjJS?=
 =?utf-8?B?NTUvYlRiS0F0VEZidnZteEVuT09KcFdYWE56VVVRMG1yTzRrQmQ1Y010Ykdq?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b775ed5-fe34-48dd-ba53-08de0747813f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:21:22.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ky3zY7gzqWtTBXjFR/Q44ZCHcUstu52v9Dr+SoZjjcydJsZZKEY6Mc8adOUF4t/SW10ppVxTeRqqA590BYTQPJumQx06Khzp1KP4KP0KWJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9006

Hi Jan,

On 09.10.25 15:01, Jan Beulich wrote:
> On 09.10.2025 13:42, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Rework LVTx registers masks usage in MMIO/WRMSR write emulation code:
>>
>> - do LVTx masks renaming and rearranging to x_WR_MASK/x_RO_MASK
>>
>> - rename "vlapic_lvt_mask[]" to "lvt_wr_masks[]" to indicate they define
>> writable LVTx regs bits
>>
>> - add lvt_rsvdz_masks[] and use it in guest_wrmsr_x2apic() for "Reserved"
>> bits checking (RsvdZ, Non-zero writes to reserved bits should cause #GP
>> exception)
> 
> Didn't we agree that this may better be done in two steps?

Huh, sorry for misunderstanding.

> 
>> - add LVT_REG_IDX() macro to avoid open coding calculation of LVTx regs
>> indexes for lvt_wr_masks[]/lvt_rsvdz_masks[] in many places
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> Hi
>>
>> Patch created according to discussion [1] and based on [1].
>>
>> I've seen patches from Jan [2] a bit late, so sending
>> it as is for now.
> 
> Just wanted to ask, not the least because I'm increasingly of the opinion
> that putting your fix on top of that series might end up being better.
> For example, the special treatment of APIC_CMCI then shouldn't be needed
> anymore.

not sure what to answer here

> 
>> @@ -881,7 +898,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
>>       case APIC_LVTERR:       /* LVT Error Reg */
>>           if ( vlapic_sw_disabled(vlapic) )
>>               val |= APIC_LVT_MASKED;
>> -        val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
>> +        val &= array_access_nospec(lvt_wr_masks, LVT_REG_IDX(reg));
> 
> Just like it's here, ...
> 
>> @@ -1013,26 +1030,18 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
>>               return X86EMUL_EXCEPTION;
>>           break;
>>   
>> -    case APIC_LVTT:
>> -        if ( val & ~(LVT_MASK | APIC_TIMER_MODE_MASK) )
>> +    case APIC_CMCI:
>> +        if ( val & ~(LVT_WR_MASK | LVT_RO_MASK | APIC_DM_MASK) )
>>               return X86EMUL_EXCEPTION;
>>           break;
>>   
>> +    case APIC_LVTT:
>>       case APIC_LVTTHMR:
>>       case APIC_LVTPC:
>> -    case APIC_CMCI:
>> -        if ( val & ~(LVT_MASK | APIC_DM_MASK) )
>> -            return X86EMUL_EXCEPTION;
>> -        break;
>> -
>>       case APIC_LVT0:
>>       case APIC_LVT1:
>> -        if ( val & ~LINT_MASK )
>> -            return X86EMUL_EXCEPTION;
>> -        break;
>> -
>>       case APIC_LVTERR:
>> -        if ( val & ~LVT_MASK )
>> +        if ( val & lvt_rsvdz_masks[LVT_REG_IDX(offset)] )
> 
> ... array_access_nospec() also needs using here.

ok


-- 
Best regards,
-grygorii


