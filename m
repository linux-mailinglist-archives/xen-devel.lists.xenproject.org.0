Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDtjOyWWeGnmrAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:40:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5492F27
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214217.1524584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgUl-000198-G4; Tue, 27 Jan 2026 10:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214217.1524584; Tue, 27 Jan 2026 10:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgUl-00017i-Ce; Tue, 27 Jan 2026 10:40:27 +0000
Received: by outflank-mailman (input) for mailman id 1214217;
 Tue, 27 Jan 2026 10:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vkgUk-00017c-Ck
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:40:26 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95ad7f77-fb6c-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 11:40:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8406.namprd03.prod.outlook.com (2603:10b6:208:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 10:40:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 10:40:20 +0000
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
X-Inumbo-ID: 95ad7f77-fb6c-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9JAx/vsze2bFbi2jfCX1E0wLL/eHUCXfwEnd0n5e0bQKdJvBq0gAz+6zI3tLdARG7VhUNmI3AXlIAFCbCEZqKkOX6FVTPppLgB5zsksTrrbnfX21Xd7RAcPR7zLBWZj8I/piq5qALLOPPtZCrs+ysXMQuBNrclJiyBbu/HETGTsk+5Lx3H/fAHXUtfwUo3tKGKVEjdpC+zvx6jnRzJj3pEYODNM7xoHq7dSOdsox2dUiSa6v/mD2AsG7Re5BT5/AJIHzTNfpCycPFDUgZsTM9hX8DK4eQz6bS55O3gyaP9iQiXAlmu/A3rgGjzwAK+KdJDghshW1vxbS9JscKgCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZb43UkEFKzAf/y+8zfWgxfPyxcC3AZodvlckXgGG/M=;
 b=g4FL6iU4Vwl4KFq/icwgTkZ1zuFquw4Wmnd+xavKD6vA4zF/4E15LbC9AYcYCEFCqukzMvT9JdysB9/tivFJxHcC15ZYIQSnMBWRHlf/hUntS/RqQx6OEhdYm9BgFerYaP7wmVqiO/88m6PQjmwP1kJRB41m5Cmw6Rc6J3N33rhyr9fujMgRjxTGtyTVBtveoZzSoPppwsAM2bozFylQP47gBh+kuycbaZuz3G3OrmzLEV7M/ZO1R4TwRz9sxUxCuWSrPt54g+/aa4XgTUqro7T1EI0fVcX2Vu6UMxcTsU5SO2sXNk0FyXRBeEIuqpzqO0ijqkP4FavwXILq6UHoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZb43UkEFKzAf/y+8zfWgxfPyxcC3AZodvlckXgGG/M=;
 b=S2FNvWkBlCuciWjz4BpRJw/3lA1lEB1WkXj0IOy+15nO+o8P7svaH6DHoZCLS8tNAqMBgis3XCAZT0Gtv0spnCO0Ak2rPhVp9OWZZKMAds+AiZmgz5J7KcJPY7NvMuVNstH+YdTmtu442LSBAKsrHF6T4zG0iDy8HTf3+sTaLIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Jan 2026 11:40:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXiVeAQFUMQkIK1_@Mac.lan>
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-3-roger.pau@citrix.com>
 <69a64a89-af3f-47fe-8998-a3ff76e9484e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69a64a89-af3f-47fe-8998-a3ff76e9484e@suse.com>
X-ClientProxiedBy: MA3P292CA0010.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa83150-7bea-4a59-08c2-08de5d907815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUlyMTlIQ2tlQWVyc1dscWE5R0VEeEhUQi9nN3RhS2VPeEZ5WHRBM0hxeUdt?=
 =?utf-8?B?V0NFblJjK29ZVlBqamkxWmZDMnFOMUZZOFdxWnBjUTd1MG5xbjl2YzFVY2h6?=
 =?utf-8?B?YitiQlpnOUZxbTdERXlmOUlkNmNUa3oxb1kyVmh2dUtDRzFBUDE4QjdLckZ1?=
 =?utf-8?B?UzE1TEpyZ3hRVlp5QjVuckQrWmR1dnJEd2UrbE1ONlVrL2p0ZmpPMkw5S2Rl?=
 =?utf-8?B?UUlETkZZbS8wdDBwYnNpVVNRc0EzcDRpTWdOb3FuN0NkS2FYeFlnc0FNM2RY?=
 =?utf-8?B?NkVLQm82Yk9vVElwMmVDUm1xMXF2b3ZybjNkS3pIOXRKNE8zY3AxN1EwR2JK?=
 =?utf-8?B?ZlNLRWpzbzVSTWtua0VnY1FnMVI1ZkRPOEhnSlVtMFFZK283ak5kZ0xsZGNE?=
 =?utf-8?B?RUVEREdob2p6aUFnbU9lbTRWOVZlQzQ3YW5LTVU0dU5RYUJGU0FjeWV1am1G?=
 =?utf-8?B?ZDhKZ0RteEVaaFRFcUgwdjdKN0d1ekZadENTQ1VvQXJUUDhqcmNyWWIySHJQ?=
 =?utf-8?B?KzZaQ0JaNDI1cFRqQjZsdDlheWhPb0NFMk0wNVVXVSt3blJERC9IOXRvWU94?=
 =?utf-8?B?NGdEL2lnZklkU21wNTQzaDI0UE55b0MycEpqT2tDMk5oR2E1YnREMld6ai9J?=
 =?utf-8?B?NDZ2Z3ZyY0J2OU1zMzI4WXp5SEZKaUg3dFk4QTFhTmhRS1djWnFXcmhoSHdG?=
 =?utf-8?B?cUxuWlkzeDlsYXI1V1ZORnpQT1hqUk9oeHVrdG9tZnBsci9iNmxjaHYwYm9p?=
 =?utf-8?B?c2tNR01TbTdKc2w4Rk5GNWc4N3RGSkM3Y0w1M04xNmg1SmxHRitHeG5XWit1?=
 =?utf-8?B?a0IyVVU2bDFtL3RYSnpaZkUrWGc5U1JheWt0ZVFkYzVLUURCdEVUZ2kySXVZ?=
 =?utf-8?B?YlIyMDYyZmR0WGpOM2UxUjUxUGlocm9KVXJpRzJNTFdFVDVzRmF4a1puY1Nl?=
 =?utf-8?B?VjFZWkdmdUpGcm5lNStRZ3dBQ0FFTDZyRkZVbEpaZHc4OHplUlRCN2tnN2RM?=
 =?utf-8?B?OTJoN09rN2NUUmQ0TVA1VWFldkxGMnU1TTR3azFLNVFWZ1RkaXhMT1F5bVFh?=
 =?utf-8?B?ZjBxUU9NSEJVYjA5SDFEbngrUk5DUXhONFRqUCt2OHA4Smw0RDJtaVBScWht?=
 =?utf-8?B?VUp2WktXdWNtYXY1cXVWbVNTMjhFdnUxRVZiVjh1RmFjaElUK0VXSCtnV1VF?=
 =?utf-8?B?YlBKUjk4SWFZQm9PODlrYTlaMzJjdko3U2dzcHRZWkU4MUx3Z3lKUXVjc3lL?=
 =?utf-8?B?RktjOFdJc0kyRkJFY2xLaGVQMEF3WDdMb3FDM3d1L3pmbUwzT21HTUFvaGNm?=
 =?utf-8?B?QitoYmdWQlpZbnBHUXFtK3lLS05pbGJDL1p5cXFhQmRuaEp3RXpOeE8vQlVT?=
 =?utf-8?B?ZXhDdUtuNzc0eFlTbi91MUxDK3phcXNDbms5QTFjVlg4cEEvK01MeWtXU2pl?=
 =?utf-8?B?NklYLzNZYUFvVUE2MHpnckNTdXFLZ09PQ1V4R0pjMlJQVytnWTlNRlhFajla?=
 =?utf-8?B?ZFZIOTZFRlUzZEZIU0NJVGx2MldrVTZsOWFkY1l4aDBHcnRGR1E5djdZa0xr?=
 =?utf-8?B?aVM4QkptdEFTdTM1SVd1dHR6R1krT3VQZmtVWnNHNk1ScFFUajdnTk9EQVZs?=
 =?utf-8?B?ckNqNk12cG9zMDExVGtMdTVFMUlBQnB5RE00Qzk3VHBCVzNqMXk0UmFCdWxX?=
 =?utf-8?B?a3l5alZ4OHVoWE85ZHpkRmFjU1VJQzk5a1R2VjFodFJ2d0hrcmVtRlVGcE53?=
 =?utf-8?B?SFU0Y3pOTXZYWldvcWlaVVRCVmRaL0xJWTNWaDYzbXVscXRYd0FYZnRtZ05W?=
 =?utf-8?B?K3dVM3JDbkIxcXAxQmlPa0dmR3FZQVdwUGlucEpVMjN5ejhFbkg5eVJMYWwv?=
 =?utf-8?B?eC96NytsaWdybXl3TWdGMWhRbDNNT0N6T3ErVERFVGRhVnF4THptTXlrcXE2?=
 =?utf-8?B?Q2p1cWNKZGxaZE5qVTNycmFsNFMrRE0xQ0lzeFZ5MVB2SWEyNHViM2lSRm9m?=
 =?utf-8?B?K0ZaT05OdXJoOE5lanpsS1kwQlU2S3I3ZkpVSFU3VlFqMG9vYUUrUmZqSkp0?=
 =?utf-8?B?Z1FlMnJTbEpteXVGQ09IUHZXTXVwazR1Q1NQbVNEYnZQaXljaVFCTUdFZ0pi?=
 =?utf-8?Q?iQIc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1VZQTJ5WTA4d1J0RFZ4ckRPVzR6WnA5d1RHY2FHMjYvSEw0Qnc5V3daSEM1?=
 =?utf-8?B?YURhQ3g1WE5xU2lyMDl0RzArTmNxY29FRlFsaUo5QlJVMnc2Tk1sbUJHem5W?=
 =?utf-8?B?UDk1NDhrK2ljUGVldWpJUjNESk9PYld2RURaaTUwNGplM2p2a0JZOEI0aW9u?=
 =?utf-8?B?VFdHMXpVRWpsUnZ3K2kyNHNhc2MxVFJVZ0VMWkphQ2htbmMvT3NEYUxNRWQx?=
 =?utf-8?B?bjRwSU0wbWYvcy9HdmsvM2NnWmltcW0yaWcxaVBDbGUxTHBtWi82WlhudVpR?=
 =?utf-8?B?OVQ2enY1dlN1bHN6WTdDbjFPdmh4MFE2anBab083d2pEbnBRaUswZzk1TDVE?=
 =?utf-8?B?Zks2YUYrTTc5Q2JucWp2S0RsRTlnSngrOVBhUDNIMXFndUsraDJWQkcvZlJW?=
 =?utf-8?B?cmFtWkdJeEt6WDdKb3RHSDRyYTkzZ29TTXRMb3c3K2JKaXVFemo0VG40d3pH?=
 =?utf-8?B?Q3M3MlF3UTE5Z3pOQzQrYjhjL0cyN1FJMm1US3RvZGRxaDA4VHg3QzZMMVd2?=
 =?utf-8?B?N2FNendqMHR2L3NVWUIrbkFWY1I1VW5UYUU5N0twbzFoTklFTkZ0SVZocEs2?=
 =?utf-8?B?REwxdzNPUVN1Y0NTb1IvdFlLOHVCQXFNVDhOcDR4bEhlOWJ2ZjBSMXZVT1Rh?=
 =?utf-8?B?djVHOWtQTEpuVkFrNFFtcnFJT2RhUTErb3hMQWRNNXpQcWN5blRxTThtaHgy?=
 =?utf-8?B?THBzOVJGNWxkUy9OcmZOa3hPZjFFRjd2QWdzM2xmZ2oyUlprRzF4YzdGRkMv?=
 =?utf-8?B?MTZ5RDErSkNRTnlnY2JPblNmdm8vRnFkeXkrR2FqVDVVbk0zOHhMem9tbVJ0?=
 =?utf-8?B?VWtHbE1pRWM0OEFSZzYrZkMzR01IUFRsOWxpcm5GdG5HNXBocTFCQW9iMWZ6?=
 =?utf-8?B?MkkyOTVDckN3QVJ5TEJ1VXRkTW90NjdlWUQzL2ltN3FwZ1ZZWTlWdmo1UERT?=
 =?utf-8?B?Tnd2THI1TUN2dk1tb2Ywbkd3bzJrSFhORWJnWWFEZGhzRnRBVDVVaHlrNVN1?=
 =?utf-8?B?Q1NuNTl2OHd6TW9wSE9BMEpKK3llVHZGVzZXdWxkc3NuZERuUWQvNjU2NGNz?=
 =?utf-8?B?UzlCYlhzckoxbTJVdE5TN0llcHRoMk5ic3lzbmh6M0RidS9ZdGw4WElPMnY5?=
 =?utf-8?B?ZWxRV0l1Rlg1eE80VGgvY1REOXU3aE1vb0RGSXRJcHZpRmFNVnpwbWN4dzgx?=
 =?utf-8?B?RzZhc25lc3FZQ1U5Q08rd0xvdjJBaVV1OThDSDladFFkNUluVHBvdnA5MDB4?=
 =?utf-8?B?RWtjMDVDUlNuWE9zVmtBTWpyL3dOUjVZTXlud3cvQU9UUUpIQVZwVUtsZUl1?=
 =?utf-8?B?M0hIaFE3UDZ6UytybFpnNGhxaElOcFpON2V4ZkN5VWppcUR0WE1KVkJaR0U3?=
 =?utf-8?B?UFNXZnNPNUNjUk9wWjlNaXY0YXZBOENIdGVQV05UeUZTVXg1T1hkZWc0REc2?=
 =?utf-8?B?ZDNnMUZ3eDdxWUlNWU84aUIvKzhUa1ZyWk9Ca2ZScGU4RmRpQUhoMElFWHdv?=
 =?utf-8?B?b3h2TFl2cWZSTGIzRm53NU5rOXd5SGpQOEJiQkU5UmVpZXBkYzJNTXFZRUtC?=
 =?utf-8?B?L1NUL2ZTK24xeWtoYTJpbmhYSWczMWxsRUxRZy9CeHAzSTVIbzdaZWhySTZC?=
 =?utf-8?B?ZWViNHlIU2RnNEFkMnoyTWUzQmJNdkRvZnhjRHhINXYreEJBNEp2UjRzSmFM?=
 =?utf-8?B?d0RIT3JVSmQvNmZNYUF4MTh1dE12MUtCdzFJQ1VOakVyTk9kQkx4OWlSSVVC?=
 =?utf-8?B?dWdWanBLNktPT1U4aDN6OUdGTGdRdjJjMURHQ1BHUk5aeVk1YXZlUFRJTnpa?=
 =?utf-8?B?WDlGc0M0Y0N4SDAreDFNQmM1RGtQZi9EeVpQblArb3Vrd3pvTmlGbHNrdVhm?=
 =?utf-8?B?Kzg5QURTQ1VYRkVzWU9qS1RReVd1K0s0bVAvRWxpdU1mZTFFUUVFREk2dkt3?=
 =?utf-8?B?Wml6dnFjZTAwZVAyalFJSjhrdEx3eEVtSFBqc1NLUEs3VFVKZlRaTE1kRENn?=
 =?utf-8?B?ZnV4WGM3bnpkZGdRY2sxVGsrcnNDTzIzQUJ6QXpITktteHRHeC9UaXhvWXlz?=
 =?utf-8?B?UWxFcThDZ29RaUpyUGtrMnpCMFZqcXdzL1F2RWhRZ2NUTHp5V2dVeWpjUUtv?=
 =?utf-8?B?UEl5WDJ3S29POElLUVBtdFZrUHUxa3A0WHJGVTVEKzRMQ284UjVFUDQvdWMz?=
 =?utf-8?B?a1czTzY5UTJuOEEwYytkb25IVkdPSElUSHMwclJyU3BpOGZwaXBEbFk5WXNZ?=
 =?utf-8?B?U0wvM1lOZlFrOTViZUdzdm52c1RDaEdtVHJrbTg1RTI2STlMOFRINXIrY3lN?=
 =?utf-8?B?SEVPMEZ3aUplc25jQnUxU1kvMUNVV2lmNHlBMTR5QlNuYW5HdWZaUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa83150-7bea-4a59-08c2-08de5d907815
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:40:20.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQK/lD5cDhHTrjqEeRO+3GYIQ8dvq/tSlh92NGERJyMUHSj1DrUFGqrpbjJuZv1ejiV0Iz29HZvVUvAzqpbjXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8406
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 2CC5492F27
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:14:35PM +0100, Jan Beulich wrote:
> On 22.01.2026 18:38, Roger Pau Monne wrote:
> > Physmap population has the need to use pages as big as possible to reduce
> > p2m shattering.  However that triggers issues when big enough pages are not
> > yet scrubbed, and so scrubbing must be done at allocation time.  On some
> > scenarios with added contention the watchdog can trigger:
> > 
> > Watchdog timer detects that CPU55 is stuck!
> > ----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
> > CPU:    55
> > RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
> > RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
> > [...]
> > Xen call trace:
> >    [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
> >    [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
> >    [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
> >    [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
> >    [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
> >    [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970
> > 
> > Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
> > relies on stashing the dirty page in the domain struct temporarily to
> > preempt to guest context, so the scrubbing can resume when the domain
> > re-enters the hypercall.  The added deferral mechanism will only be used for
> > domain construction, and is designed to be used with a single threaded
> > domain builder.  If the toolstack makes concurrent calls to
> > XENMEM_populate_physmap for the same target domain it will trash stashed
> > pages, resulting in slow domain physmap population.
> > 
> > Note a similar issue is present in increase reservation.  However that
> > hypercall is likely to only be used once the domain is already running and
> > the known implementations use 4K pages. It will be deal with in a separate
> > patch using a different approach, that will also take care of the
> > allocation in populate_physmap() once the domain is running.
> > 
> > Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Introduce FREE_DOMHEAP_PAGE{,S}().
> >  - Remove j local counter.
> >  - Free page pending scrub in domain_kill() also.
> 
> Yet still not right in domain_unpause_by_systemcontroller() as well. I.e. a
> toolstack action is still needed after the crash to make the memory usable
> again. If you made ...

Oh, I've misread your previous reply and it seemed to me your
preference was to do it in domain_kill().

> > @@ -1286,6 +1293,19 @@ int domain_kill(struct domain *d)
> >          rspin_barrier(&d->domain_lock);
> >          argo_destroy(d);
> >          vnuma_destroy(d->vnuma);
> > +        /*
> > +         * Attempt to free any pages pending scrub early.  Toolstack can still
> > +         * trigger populate_physmap() operations at this point, and hence a
> > +         * final cleanup must be done in _domain_destroy().
> > +         */
> > +        rspin_lock(&d->page_alloc_lock);
> > +        if ( d->pending_scrub )
> > +        {
> > +            FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
> > +            d->pending_scrub_order = 0;
> > +            d->pending_scrub_index = 0;
> > +        }
> > +        rspin_unlock(&d->page_alloc_lock);
> 
> ... this into a small helper function (usable even from _domain_destroy(),
> as locking being used doesn't matter there), it would have negligible
> footprint there.
> 
> As to the comment, not being a native speaker it still feels to me as if
> moving "early" earlier (after "free") might help parsing of the 1st sentence.

I could also drop "early" completely from the sentence.  I've moved
the comment at the top of the newly introduced helper and reworded it
as:

/*
 * Called multiple times during domain destruction, to attempt to early free
 * any stashed pages to be scrubbed.  The call from _domain_destroy() is done
 * when the toolstack can no longer stash any pages.
 */

Let me know if that's OK.

> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -159,6 +159,66 @@ static void increase_reservation(struct memop_args *a)
> >      a->nr_done = i;
> >  }
> >  
> > +/*
> > + * Temporary storage for a domain assigned page that's not been fully scrubbed.
> > + * Stored pages must be domheap ones.
> > + *
> > + * The stashed page can be freed at any time by Xen, the caller must pass the
> > + * order and NUMA node requirement to the fetch function to ensure the
> > + * currently stashed page matches it's requirements.
> > + */
> > +static void stash_allocation(struct domain *d, struct page_info *page,
> > +                             unsigned int order, unsigned int scrub_index)
> > +{
> > +    rspin_lock(&d->page_alloc_lock);
> > +
> > +    /*
> > +     * Drop any stashed allocation to accommodated the current one.  This
> > +     * interface is designed to be used for single-threaded domain creation.
> > +     */
> > +    if ( d->pending_scrub )
> > +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> 
> Didn't you indicate you'd move the freeing ...
> 
> > +    d->pending_scrub_index = scrub_index;
> > +    d->pending_scrub_order = order;
> > +    d->pending_scrub = page;
> > +
> > +    rspin_unlock(&d->page_alloc_lock);
> > +}
> > +
> > +static struct page_info *get_stashed_allocation(struct domain *d,
> > +                                                unsigned int order,
> > +                                                nodeid_t node,
> > +                                                unsigned int *scrub_index)
> > +{
> 
> ... into this function?

I could add freeing to get_stashed_allocation(), but it seems
pointless, because the freeing in stash_allocation() will have to stay
to deal with concurrent callers.  Even if a context frees the stashed
page in get_stashed_allocation() there's no guarantee the field will
still be free when stash_allocation() is called, as another concurrent
thread might have stashed a page in the meantime.

I think it's best to consistently do it only in stash_allocation(), as
that's clearer.

Thanks, Roger.

