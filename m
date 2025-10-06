Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C6BBF1AB
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 21:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138411.1474126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qxR-0000RV-Th; Mon, 06 Oct 2025 19:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138411.1474126; Mon, 06 Oct 2025 19:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qxR-0000ON-Qb; Mon, 06 Oct 2025 19:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1138411;
 Mon, 06 Oct 2025 19:33:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v5qxP-0000OC-Hi
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 19:33:15 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c3beb2b-a2eb-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 21:33:13 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BLAPR03MB5539.namprd03.prod.outlook.com (2603:10b6:208:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:33:06 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:33:06 +0000
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
X-Inumbo-ID: 4c3beb2b-a2eb-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4M17cW/77dGz9vhjuzXz3/2iHFyfd8NAzvVVvi8ci3ryDJc3XG9B6lN0pImRcD+w2eGmK0cg5bCtauJFrNZBdKklyPgXARYlZdlDTbUNjJZ+r65YppNsmYnOigeNnsl7rcZNfJ6chuVAyuyPV8xotGny6RuwFAQPMotEZ2IShHtNMVP2PQe2R5VSJz4Z2yw9ky9E5zKiA53vVEmDw/DIZ+9Cpeji6jL2eNlbpWHdTSDR1Mrnq48PZ7U8bLUcy0js2S8Io1XMTTSxgkm8WdINhFTtqxlMDkKCK2yvt2K/ijF+NzIkmVxOunEkPGDFKr6b+NYRXV6n4bQrCLSneULqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wApexrYwoN8U4BPygY8yHCXIi4IIane9YEs90KmBZkQ=;
 b=WCAhnO2KGGE38ChBjhbVMdzl+/7RSC6QJZc9KIjoaLcAF2ggetMUL5A9ChP6fKE3fdq272dlw14Hc2qK1oNdoI+RrO+a/QJiOBKB9fFZQBQ3ogCuR4UnXNSV7HeZ+j1w1l9K1lh7H1pbS6AY6rsMcRySbEHVsPhT1lYdb60PHV30NaFeGFgGKfIlSlN1hxKu14d6w/LTuAcqLBOMBJh0JOfL/jCO1GkX/+McZYqcBNkSowwttwRtCx6JDzMiVoMisUVySnTNbRXZHb7WmV2AZO8tdG2V6K9ZoIzEMj/BuBGPG8cqdP/luuRAN/7n7MVEdzoZRLHHrUpcoBWW3tUYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wApexrYwoN8U4BPygY8yHCXIi4IIane9YEs90KmBZkQ=;
 b=AO8ydnMZ+GpcdIffVvPx0um/Fy1h4ko3G0ey0Xw0pOCdXmNUMlWmfAE9HwEWfugnV1lcjUZHhLZyTWGfGyoLRp4xu97EeMvjhzmfwhbt3xrQtnLtwS2fP6XMPrZSaSzj8jTKj/bxB6PSJNuPAeDwK6yYKrf5pQRri6G+0UuyaYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 6 Oct 2025 21:33:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.21 1/2] cirrus-ci: install libinotify for FreeBSD
Message-ID: <aOQZbaFDLUQxS5NK@Mac.lan>
References: <20251006190757.72757-1-roger.pau@citrix.com>
 <20251006190757.72757-2-roger.pau@citrix.com>
 <258f5150-59b5-4371-b18b-26ed33ffd0fa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <258f5150-59b5-4371-b18b-26ed33ffd0fa@citrix.com>
X-ClientProxiedBy: MA2P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BLAPR03MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: bb29233b-cb0c-485a-8f75-08de050f2c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2ViK1NGVXJjWHNWYnhiR3pZRVNxaGdJQUwwc1ZPWnlRTld3M2doRzhFdW9v?=
 =?utf-8?B?Wms3Ylp1bFowWVFOMGFZb1lzSnZqbDl2Wk10VmY0TG5XOXV5bVllSFk5RXFY?=
 =?utf-8?B?Wk12bkswNHEzTWlXQ05kamhpS3NxQXlXbFlROUZLWHpPYlIrMExYUmdLZFFn?=
 =?utf-8?B?elpURVNOdzRHd1dBWm9CVEFVUEV6SjhsaXdUa1drTkxpYk1reWt1STJPZGV3?=
 =?utf-8?B?MnVFUXViK2R1WGFiRHNjNkpLUUJIY0w3OFBYcndEb1EvLzNrWEFJN1NLZ0xs?=
 =?utf-8?B?a0xuYno4V1lVbUd6QVhUeEV5V2xRb0NBVFdVTVlLcFQ1dTJOczJVVXpHclpq?=
 =?utf-8?B?eWRsaG9SczdtZURBcWIvZWVSUWVYc241MGwyNTRsSFJQd0tobWp2dkVNNFo0?=
 =?utf-8?B?S3l4c2h2c1pTTEM5WVFnRi9PSVBkNGNVdjhSUjBmRllCSnpIUEJlbzFEYnpr?=
 =?utf-8?B?aCtNNTJ3cW9sYmxLeTYwckRrejJQNTJTam9qSTRQZTBLZjgxaGtaY2Z1Qkxp?=
 =?utf-8?B?dFREWDE2VlhmWmhnTXB5YlRYQlZZKzFPdWRrMFRkNzBqSGZKTXNMbHZvUy91?=
 =?utf-8?B?Y2lBQ2RkOElHTlNTaFNmaCtGaWNiY1JFZEV5NUhaeDZCVVk4azB1U0V4KzJR?=
 =?utf-8?B?cWRuZXhkbEtseXkyV2IxdEplamY5MDllT2ZnZW1QMGdwMkdzOVpHNlRxc1Na?=
 =?utf-8?B?Wm9Dd3Jtcm5vc3pkemRXZy9DeUwwMU5weWlSVlpNb09aVnlTcGpIYmd2SGpQ?=
 =?utf-8?B?V2MvK1IxQ3R2WjhPYUhiT2hzMWw3MGlpQzNtbG5mUWtKZ09WM3dCUEJCTFU2?=
 =?utf-8?B?OHlMd3o3anVTNTVHVHFnQUk3NlB3eC80cWJpNWwwc1pRanRKazBZYXZJOXpr?=
 =?utf-8?B?cFlkMGxEbUZJaStmMHA4OEpaS3EwNVl4WTEzaGhsc2JBRGt0eWdETnRFMVZX?=
 =?utf-8?B?WFk0c0VXaUY4RXZ4QU5qR29xSndSUUxCOXMycXZUQ2ptbysxMHBzRHNCZXMx?=
 =?utf-8?B?SHVKWTlXT0wrN1YvNHNiWExhd3RoNGs1RXROMUNFdGZUdHAzKzJTQTUraGF4?=
 =?utf-8?B?K2dtN0U2b1ZSV2pNUVMwQUxpNFpFNmh0Q04yMTNJMjZ4c0lFTnBsbnRWdHdj?=
 =?utf-8?B?TzRZOVBaSEFwL0hRcXIzbzUzQW83bmJGUGpRRGNBZkMraDd4bldXOW04ZU03?=
 =?utf-8?B?WStFVzJoUGdCQkwyUzJXYTZ3dnFVOHBKMzViOEZkSmZiOW9Zc0xmaFBYeWVQ?=
 =?utf-8?B?K3NxUnBZc3k1a0c2QWlnVk9pSkV0RW1WRXJla1JkZ0V6MEltUkVqQThQRndG?=
 =?utf-8?B?RjhEN2xlTE5MaW1QdzdnN0tTbDNZRHRsVmpTS1hFMDZ1SjdLY2RLdVorcm1D?=
 =?utf-8?B?Rm5YWnRpdFdOZlZobk1QTUtqYTZJcDErNnprRVpXTHF2TUkvazE3UTJoZmtn?=
 =?utf-8?B?QUtiOXQyNGM5Z3AzdXg3V3RxcFA0OFVudk9iY01LNWZkNUtkdDk0V05TV2dO?=
 =?utf-8?B?YzhTSG53cWFsSGlTc0JVMHBrMUxjTURkV0IydEp4Q2dMdGREclExbkwreE1v?=
 =?utf-8?B?VXp1MVZpeXpTUVRHUGhqc1VZMjNzRnc3dkJzaXRGVDNyWWZiSmJCb05ES3NO?=
 =?utf-8?B?TldwSk9QaUxFVThyWWpEejd5RnJEQ1NpN0JnWU4yd3Nha0ZhUVpZU2d3NFFm?=
 =?utf-8?B?MkZzMWFWc3ByMWx3cEppRzBZRktLOW92TW1FL281clR0ankybE0xMDBxSHUv?=
 =?utf-8?B?RmRXQitKVXhzZmFHZ240cTJFbmJ0ZFpPVDNyc3BRcVZCdnNWMUdhNzB6L1ZV?=
 =?utf-8?B?U1NDUXdST1dnQzNwakVBOUZSa2diQTFySXIyQ3B0NXJJOFFPNXdmNFFaZ203?=
 =?utf-8?B?ZzBaTC9rdmpGN1ZnVnVIWVZ0U0VMQ25DdnkvcDhVaUFqVkJ3bUhzYjRweXNx?=
 =?utf-8?Q?RlttDG11gjKQXw75crC0kJ/cSLaQbg41?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldJR0cvSzdxbHo5RWJUcDFtVGlJa0xYb3YxZnIyaitvemtzQUVMbk1Sempi?=
 =?utf-8?B?UjZEMCtxV09ncGdaeEloQ01SN3E2dDR0YUgydlNPeXpVRWhhMmNDLzRLdDEr?=
 =?utf-8?B?VEZnRFRYNWVmVllIdGx2MWgwS2VMWk1pNTlhUWhLZlQ0djNRYmtZR1pyREFK?=
 =?utf-8?B?M2pqM0pkNUxvSDBwT1B1d1dJL1JFQm9kZkhMMlUzUjIxODFGYmtvbDVTMHVk?=
 =?utf-8?B?MGJPOXQ5R0pCS0IxdElaOFErbEZsRFJPUldnRXV2N1hVUlBUNTNIbFZ3RkhS?=
 =?utf-8?B?UU5hNWorRk9uNGZxcFRzUStiWWZpdWQyTlAxVjZFeFpnbmVnclRUMWJqOEhR?=
 =?utf-8?B?bjFOeDlrRmp5eXo1OW04b01haHhNdDhCdEhaMmF3QXdkNEdDdGxQN1k0N09j?=
 =?utf-8?B?bDV6RG9LUUxGMUxaMW44b1JFWndOV20zd2Q3czVUR0s0dDE3VVQ4QmN6QUox?=
 =?utf-8?B?RU1qWjk4NGVuSkNQY3lNYXJDTEdXTVhnTmR0UFpNMzNZS1JpYjFaOHFqVXJJ?=
 =?utf-8?B?N2d4NENwWFpuZkM5WkpYZS93Sjhack5Qbld5dHJDOG01bVduWDZlbEEwMDVX?=
 =?utf-8?B?Nm1kK3hGdlllOFU0c3I1OXRmM2FKclVnTzVsZjhZUkZQOUpTTnZ3QldXeHZx?=
 =?utf-8?B?Wi93VlBoRldJY1duWmEwNnphVW1Ia0k5N3Yvd0tDSDZwcDNEV1RGMndNb2Fx?=
 =?utf-8?B?aE9KYU1sdUxpZnowUFp3WlNJazVtMWdMeGZ2bUxzM2NVMjBMNVhJNG94SXMy?=
 =?utf-8?B?SnNkakUxQ0lKSG0vazNYbHltYnYycHU5cG8zb2hVOFVHSGpJYStpaFRBRU5Q?=
 =?utf-8?B?ZExxWk9IZ0dzVDJBSExyNThidFlZa0t0OUZ0aDdSU01EeloyRm1pZUt0ZHJN?=
 =?utf-8?B?TXMwZmpPa2R3QmtyT2RIbkdpNDU3WHBWOFk2YUFTVWljZlM4alRZWUNRVkxp?=
 =?utf-8?B?UTRVNmZ1QlBoY1FDZ2RTcmJuQVp0V253T1Nwa051Vjk0ek5VZlBKWm8vK2h2?=
 =?utf-8?B?a3l2TG5pdi8xUi83NnhNNkJrN0pWMkJZYzllR3NTZnRYVVRYbSthYkVkcDMx?=
 =?utf-8?B?R2dZeFR3YWFsY0FSR1djU2xyZnlXVS9HaHRoQi9wVHRqZmg1WGxKeEtGcGR6?=
 =?utf-8?B?S1ZURkZuNDNMR0RSbm5JeTNqcTkxM0FTUU93WWR0TXVZVFJnUmVRZ2lkaHlk?=
 =?utf-8?B?RmVnS081b1k1YVRiZ0xvMUlkbkpxZitkWGdmNmQ0TWNUcjhQb1gyQ0VXdFRz?=
 =?utf-8?B?c2lvU1Q1MUU1VHJuSENXVlJlNHJlbE5yZUovRWpibFZQdDVJVEFqMWJ4c1Uv?=
 =?utf-8?B?U0YxMTVpeXFkVWJEVjFWVkhPWVFsZi9TQXdqNzN0bTJaVGtobGdMQXBuNkx1?=
 =?utf-8?B?QThPSjFrSzYwZkJ4Z2pzS3RnaXZsaGlsVFV6YmNWUGhvNWFHdDVWS041YzZG?=
 =?utf-8?B?eXF2MG9wTG4zeCtFSSt4Q1IyemlaN2p6SVBaWXZqaXU5Q2Q5NlZZSDhTUnlu?=
 =?utf-8?B?RzBic0VKMnhZanZhRWhPa1ZOMWtkeDcrbm9Lamo3ZjRWY2ZHbnV5SU9WZnlo?=
 =?utf-8?B?WXVMU0hGRzhtbmFHdXFKSlZoMW13Q0tWcEhjUmRCeGdndThwa2p4ZXpiMHZ5?=
 =?utf-8?B?cGZjVC9WcEJkMDVIczdybkhGVGNDdWdlZDVvTXNhY2xKaDFnMWxJWE9oMTYz?=
 =?utf-8?B?TUpneTRaa2hwemRCcHN2UHlPelBVNFpNNUFZb2w2dlNaRjNLN284bGJzSndl?=
 =?utf-8?B?UC8vbEZleitmOGdVZ1VkTTZtcVBFa1l1S0ZCWVRkVTgrOER0Y3l5NzlmVGZM?=
 =?utf-8?B?N0ZGVEI3ZFdoUjRUaVVVMzFlU3k1VzFCY1BZVklzT1JmSlJLNW1pRk9hcVdI?=
 =?utf-8?B?bFlWMzAxQVpTY1hKQVJrVzhpSXpjWnNmMWJoYmgrcHZEcTBNRzNUNFZtdTJS?=
 =?utf-8?B?Y1owTEVsc2l3TkZXTDh4MVFzSWQ2Y2pjOE1ibUFjRTRLd1J6OE5UalZPNjFl?=
 =?utf-8?B?WUFBV3RlT1g3SW5OcEUvZDZMbGZDQUVyeE1yRzFPZmlsM0lmLzVva3Z3TmpD?=
 =?utf-8?B?ZmRXTWtVaWMvQk5DN0ZtMzU5WXEwUEZkUTFhQ3kvNWpDRVU4dHpMQTJSNms4?=
 =?utf-8?Q?zjaIU03ow8Nec4ZDks6i5wl9A?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb29233b-cb0c-485a-8f75-08de050f2c16
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:33:05.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxPPDKRp/Clw6PGr+PmVpIDpl6CiX6CxF3G6o2WEOql/mv56v3b0i3b4iKyQ7tTGF2VUEc4cAKeqhG2iP63QrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5539

On Mon, Oct 06, 2025 at 08:15:36PM +0100, Andrew Cooper wrote:
> On 06/10/2025 8:07 pm, Roger Pau Monne wrote:
> > FreeBSD QEMU build requires libinotify, otherwise the build fails with:
> >
> > ./qemu-xen-dir-remote/meson.build:2535:15: ERROR: C shared or static library 'inotify' not found
> >
> > Install the package and add the /usr/local include and libs paths
> > explicitly as QEMU configure options.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > ---
> >  .cirrus.yml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/.cirrus.yml b/.cirrus.yml
> > index f295c8cb0a02..55dc9b39092a 100644
> > --- a/.cirrus.yml
> > +++ b/.cirrus.yml
> > @@ -11,6 +11,8 @@ freebsd_template: &FREEBSD_ENV
> >    environment:
> >      APPEND_LIB: /usr/local/lib
> >      APPEND_INCLUDES: /usr/local/include
> > +    CONFIG_QEMUU_EXTRA_ARGS: --extra-ldflags=-L${APPEND_LIB}
> > +                             --extra-cflags=-I${APPEND_INCLUDES}
> >      CIRRUS_CLONE_DEPTH: 1
> >      CIRRUS_LOG_TIMESTAMP: true
> >  
> > @@ -51,11 +53,12 @@ task:
> >    install_script: pkg install -y seabios gmake ninja bash
> >                                   pkgconf bison perl5
> >                                   yajl lzo2 pixman argp-standalone
> > -                                 libxml2 glib git python3
> > +                                 libxml2 glib git python3 libinotify
> 
> I presume this is good on FreeBSD 13 and later ?

The ports makefile doesn't limit libinotify to specific FreeBSD
releases, but given 13.5 is the oldest supported version I would think
so.

> >  
> >    configure_script:
> >      - cc --version
> >      - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
> > +                  --with-extra-qemuu-configure-args="--extra-ldflags=-L${APPEND_LIB} --extra-cflags=-I${APPEND_INCLUDES}"
> >      - gmake -j`sysctl -n hw.ncpu` -C xen clang=y defconfig
> >  
> >    << : *FREEBSD_CONFIGURE_ARTIFACTS
> 
> Do we really need both the ENV variable and the --configure parts?

Bah, no, the ENV was my first attempt, which doesn't work, and then I
forgot to clean it up.  That chunk above needs to disappear.

Thanks, Roger.

