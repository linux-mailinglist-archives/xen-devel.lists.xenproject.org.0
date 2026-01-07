Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57447CFF4AA
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 19:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197123.1514770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXx1-0004pm-P4; Wed, 07 Jan 2026 18:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197123.1514770; Wed, 07 Jan 2026 18:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXx1-0004nn-ME; Wed, 07 Jan 2026 18:08:07 +0000
Received: by outflank-mailman (input) for mailman id 1197123;
 Wed, 07 Jan 2026 18:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGs=7M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdXx0-0004nR-Jt
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 18:08:06 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d00d5d43-ebf3-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 19:08:05 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8400.namprd03.prod.outlook.com (2603:10b6:8:32a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 18:08:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:08:00 +0000
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
X-Inumbo-ID: d00d5d43-ebf3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxaZB/LiURLxp4fFfcMp/6C2db8ozNwC6f8BfuAH0/mS5VSOl+HJH9QM2fpX8Ftx71aP8A1iovIhzx9CBbFfZwC1TbaubX8cKz10HWdbKlrJWSBc+YJKDq8NmuethxJUANtSzwyj0mDJJYyR/lZ5ulprSH3Ns6PoVqdlspACB8wolYxts2tvFqJsIuTd+gy/yUMCB0w44/EjEJLr3ucvYafGzr+3cEm626xWkX1TUeU+aKWdG9g02lrIson95eksmhwweZLY9Tb2yFXVGc+Qi9Lf2QctKdPlkCyx2Ej3vNpOGcgUBzUITMI2ZAzKvqA9a2rqN/vH0DXGJJ2ZpLD0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUniAz9j09liMw8KdzdGqULjOflNM1Bt11OQ/cpWik0=;
 b=voCeBUYXk/D9wapRf1BdzD08vT6W4C4Y+oprf0CB9knRyA3fZPczKOrbsRvbytLXDY7MCea+fMus2lkQkv7Gjs/O1ZuIaTzctwBol49UbQLPlP02k5wl9koRZVPTBXC/+Gn/y3iPPhEJmM7xbV6td/tGIuGwXpSiDnL+v95qsUhBXWZPSzCrm0fpEquAvpf7skLnAeEEhF/5n/GmT1l4yXhtCUS5xq6V5rKtlc1Npp6Cc6wgo3BdUGIBLmH5yCp/IC0gSHI4ZLaRxBIQjNBVHU2Q16e2Lyddpk04t8WkwC3J6Kllee2mWWZ8+iHQ65s+iRP1DQD9OT19Rp3pnp8VZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUniAz9j09liMw8KdzdGqULjOflNM1Bt11OQ/cpWik0=;
 b=0pxY5t7bFxrgmmNpqoeIsbQbK7xicnxtEVkx0imeiLvaYh1B2BAOUpw3fOznTILpAL3KpliVNJCG1D2jKBxNhgY82bKDRSJ1MP4JMvLbjzkXaawJP9u93t9rD7FHqN1lXr53osnfLPGinmovQGtMbfjxOkE5CgjBrdyx592UQAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <61ca5e49-787f-4d99-b2cc-5e95d8160c39@citrix.com>
Date: Wed, 7 Jan 2026 18:07:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v1 0/2] x86/pci: MMCFG improvements and always use it if
 available
To: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1767804090.git.teddy.astie@vates.tech>
 <aV6WPQlni-gkRCVo@Mac.lan> <104d15d0-9f58-403b-ac61-dc02f4a2e097@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <104d15d0-9f58-403b-ac61-dc02f4a2e097@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 797d7a03-5e6a-4911-337f-08de4e17b12c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXhUdFdKUklwNHA3SlBhQkw2QVkwUGZzNTJuSkhuRTVnSzlqT0ptNzltMFh2?=
 =?utf-8?B?Vlp6Y1RDTkFqd1FxTWxuK00xRy9aekJRbTBrYkZtT1lmTGIzb3pub2NvNnlL?=
 =?utf-8?B?a0RpYm5PSHpWcjBSODYvQnQ2MU51QVYrR0VVVHFpMDhqZmRGV0YySlRjR3Uz?=
 =?utf-8?B?dlVXWWR0Ym9SZG9OQ0lZd2hKei8xeUFDQ2pGN1hMZTJGVUV0TXdxcm1SSHJx?=
 =?utf-8?B?WTR5RzUwS1BkVS9xQ2RjOENNcEFXWFlLbjViUUhDOWlHbGd0empDQlE5UXNS?=
 =?utf-8?B?UTdRdjhWaFU4MXU2and0RVRTZjhYa3NMWVk2YW1qMk85SXhTbFFFVGZuWUQ3?=
 =?utf-8?B?ckQrcncxZEZ4M2YvYVRyMURSNC9XRFFyWWlSZitEREdlQ1JHeUNZSjZUeko3?=
 =?utf-8?B?dGRWUWYzd0dWNS9od3p2ODJuaStMZk5oMGsrRXIwZDlMRDNGOUhCRU8zWDd1?=
 =?utf-8?B?QitLNlFCVWEwNjdweGNhN3ptTVhPNS9pRERsNWNQclhORGhZd0oxWDJtM2h6?=
 =?utf-8?B?Y20yZFRLVzQyOS9sMGEvQmpHOXgzTGl1Tm8xbFdsSlFnQWRhR1ZZTlQ1dkQ5?=
 =?utf-8?B?NldrRTZBRk5haXYvTjJZWFJOWElwQzk5Vm9RTmd6MjhySWpzOVZvNWVMQXRY?=
 =?utf-8?B?U2ZQZ1NEQWJpbnQ0N3ljc0NqU2dkOW1tc3Y5aE1GL3cxaEhvTHZMaEswcHNQ?=
 =?utf-8?B?N1dGRVBoSjYvNSswSWxCRVQ4VDFhdnhHRVN4QlZ5VStGYzV0dnM3a2h6bm90?=
 =?utf-8?B?ekV5THNDSlhyaHd2S0VUUEhyNFVKMGk2OE1mMUhDTnBhTk02SHJFMVNyckZR?=
 =?utf-8?B?d0ljakJEd1dqUTlUYitHQ3A5bldtSnd0RVVvdWNTNVdpM0NiLzV5ZXRJbzRG?=
 =?utf-8?B?SENwT096bFFqQ25Sam42T0xuUGJlWDNHTEorbE1mQ2RkQkpHRE5FejJDYnBp?=
 =?utf-8?B?VWJlak5hNUZ2RmJLU1R4cVYzWE4zdjBkN0xqc1IrMFR2MldCby9LalJtYXpN?=
 =?utf-8?B?RUt2MGlKUzUxeExWc2hlR2NYSW9seVl2a0ZiOGhSUEdyQlN2dTlMd3U5VFpq?=
 =?utf-8?B?V2FQU1NqajJrQVk4RmdmNWphZnNvWDAyNloyTGZvUDdxNnRVd3plOFEzeVNh?=
 =?utf-8?B?czlLUmtPaERhWWgrWERONWpRSnk4blo4NWRwWXhlVGUxMlh5R3pZSC96WHJm?=
 =?utf-8?B?R3YwVW1ZZzNnTzFlSGg0SGhiT3kveGlrUjhPSm5pS3MvNFBBM2RjTmgwU2xR?=
 =?utf-8?B?KzkwRUZTSmJQL2hEQ3pheVNEdGFzOWlJNGpDdEVyb2REUmJQT1lMMlNSWnZC?=
 =?utf-8?B?ZWU2SzljbHI5WTR1OEUxNDN0M0t3ZXhMWmI4VE1qRklxc1FqeHlmdTkxSU1M?=
 =?utf-8?B?WUpTNFNnRGJvbXhJY0taVEVwb1VjQys4dTBVTEZkY3Bhcit3MlpiYmd2R0VC?=
 =?utf-8?B?WEIxbEVNOFR4anN5OGpKRWU5eXh4a01YckQ3QmlPYjROZ0Z0Uk1kRXZaRDFa?=
 =?utf-8?B?MjFZQUd1ZFZkK3d2Z2ZsMkIveUU2b05hS2QrN2Vja29pcFdDVUJMSklqcXRG?=
 =?utf-8?B?bHgzSXBzRlA5aHJWbHN4K0R4cVJOaTNrZ01sV1prTndBYlV5Y0cvVGRxY256?=
 =?utf-8?B?SzVHa0I0ZjBVdmE2K3pSK2NJek9yalNveWNqTldHUTc3MzB4b2p4bGd6S05z?=
 =?utf-8?B?SkEwTG9vSmppRGh6T3JRZ0ZPeVJRSlI3RnQ5Y2VzQ01md1ZQNmRhUWdDNHNJ?=
 =?utf-8?B?Z3dnZ1lnRnhJcDgzbjBWbVQvU2hnaUZ6OVlzTWRzNEVjZUtDcHhWYW92QUpX?=
 =?utf-8?B?SjM2VG5mU0tCKytMNEpqWG9McG1DR2RXNWRjVVhYMFhTWVNQeWtFVjl6c2Uy?=
 =?utf-8?B?OGlHZjRSVzVMQ2s0SVBPUDVQZ1NqTmlVRkJOUDVTbXlubzNYMGVMaEVvU1M4?=
 =?utf-8?B?ZDZsdGZWMlgvRitQdStNaXFmbG80aHZhZGJSVnQwTWNUb3ZvdTVZc040M3ZF?=
 =?utf-8?B?eUcwdDZyQzBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FwYyttZVVHbGcxLzNZWDZiY0JCeHFuMDB6S3RaRlZDOW9KYmNyUE1iVmRj?=
 =?utf-8?B?T1YwdlBoMkhxOVN0cVp3ZXBrZk9vT2xTcXhPOTB3WXpWbEF4Qlg1Zjc3MzZ3?=
 =?utf-8?B?WHVpWFY0R1R0djV6bVllanNCazR6UDJpZkNmdTNZUXR5VitVMHBETlYrTDNJ?=
 =?utf-8?B?VmkwL05rRlhtQ3l1TTIySG10bWdQdTZIcFNJZXZidC85Y0N0aGhTb0FwWTdN?=
 =?utf-8?B?aDZPRDBFMDBJckpuMTFxNUhRakwvWVhhZk5GMTk3bjRMN2NoK0didlBuM1h3?=
 =?utf-8?B?MFZka2x0ZWdxR1JoNjFscklLb3VxbmRQbEpjeTR4bmtGN1U2YlJrMG1nUVlk?=
 =?utf-8?B?SXNwMG1CMVFVbWVPWnkzMGZCNThETVVSM2c4TVBGdm9FMVdpc1JDVEhLWXp3?=
 =?utf-8?B?ZXZPY25SQjVsNUxrZnRZdFVCR01Nclk1SlJqMkgzZFhYUmhuL3lxN05vVTMr?=
 =?utf-8?B?Mmx3SWhSblJtdEJUaisrTGZ1OERVWm9qVzJITFFzNlplMjRDMFJNODU0Z2ZB?=
 =?utf-8?B?b1AvaTBCUStjTitsdU5jazloTW83UWowbTVMclBjcUZyODJzUGlwd2oxWDFE?=
 =?utf-8?B?ZEcvUU41cWdPdkp1SEpJQ2lXWXJNU1MrTXdxN2VhYW55Z0h3RVI2Zjk4RnNp?=
 =?utf-8?B?Z244eGpsV0tjTjY4WWVONGNIMHNZbjBrTW4wNEJReDVnUFAzL1Y0RVk0cTl4?=
 =?utf-8?B?dmZZWE1jekFpSjRRenFISW5TQytJRGlrZWtneWJycWNCNWwwZmlZRjAzTWxi?=
 =?utf-8?B?ckp6dHdCeTZac1AwNmd3elNnQXZMTTljNXRBbDVabjlBUEpYcE0vbGlUNFZ0?=
 =?utf-8?B?SHFpL3ZwT2M0VWNENWJmelQrR2hwZGtmZDVoWlBId25SMU1uQ0F1NkNsNDBG?=
 =?utf-8?B?QjZaMFplZTFQcUp1WDJqRS9rYkh5T1pzdlVIMjZiQkVFQnJDekx2bXBKcjMy?=
 =?utf-8?B?SFdKb3pkVHpCUy9XeTFXOVpWb1VZOGZwZGJMakZtbUx1YzR5Y3N1RE1zMEgy?=
 =?utf-8?B?VXpWb09rYVlNcFdBZWlGRTNKbXBlRjlvc0tMRkR4Wm5rOUc4OHEyRWNXM3dS?=
 =?utf-8?B?cHRIMUNaSDB0QUUrZ3J0NThaVS9hSjE5aTN4ME5vZTlzMHJSVkE0MzRrQkZH?=
 =?utf-8?B?YlREd1BGQStEalNSM1daSjdiUWQxQlordUtXN1VTb3NqdlFBb0JPY3VVbnNY?=
 =?utf-8?B?SjduUEtzVkJvbDNnS2tvcHV6RmtBT1pJeDBTVkcxb2NzanBza3QxdnlPSG9D?=
 =?utf-8?B?THYzQlJTTllZcTU0bHZkeWNTamRtTFlmRWQ4WVlaUDM5MFkrb2FFUWg4S1JZ?=
 =?utf-8?B?bWZSZFYwUGxGS252Nk93VGpZVGFKVDM1L0dwWGFZSUUxVFptT05mamFNbkNH?=
 =?utf-8?B?WjVtdDcxRlpuYmhxNjE1U0VCWitncytMelRyWjJOVXFQd3pLdjdmU0NmakNp?=
 =?utf-8?B?blhhWnhsZDd4cFhrS3pCcTYvZ2g1L2hTeDYxbHlSUGJPa0VjZ0NIZWVrRGJL?=
 =?utf-8?B?Y1IwQXl5Wi94TnJXY0lFMzI1SlRGem9vTTl4Qm0rY0diS3FhcEpnT0szN2E5?=
 =?utf-8?B?d2dXempSUXpwMHlodGQzUnhvaEFROTc1Vm10N2JyZDJPUUo2VjYyQ3ZBVVFS?=
 =?utf-8?B?eXhscFhVMzE3dUJLTWQ1Yk1zWXY4TlF4WTFsekREeXFhTWlzZmEzYjkvNlBU?=
 =?utf-8?B?SHpyRDVUak81QVVuaFRzUDY1czBuN3YvdVBsYjJ1ZnkwY1ZRU08rejVVZ2Fj?=
 =?utf-8?B?MzdubEpBQjRuRlIvdzh1c3NhRmRqRHdkNnZYRDZnbW43cXF5bUhENHhKU2ln?=
 =?utf-8?B?OTNRc0VsaEE0RzFHamFpS1BpOGw0VXJRbytSK2Ftbjk0NHRQek9OZnArcGpu?=
 =?utf-8?B?RlJXLytrQXQ5WXRyWC9STkZWQmpaeVh5QXk3SDZ1L08wZVc1NFZ5L1htazA2?=
 =?utf-8?B?bUxFaHg1aW1pNmtNTnRXaW5VVEw1bXJrWm5xdGtJN1RaRUpTWjlneDZhMWVj?=
 =?utf-8?B?dE9mZk5PcWY1VXFBRFNzYmtZWXY1VVJ3VzVOSFYzOFlpQ3QrUi9NUWlwVk5K?=
 =?utf-8?B?MysyNnR6YjI4aVZLeGs2UXkyZ3krNXBmNUNoa0loTFdMSEtmK1FreXJFM25O?=
 =?utf-8?B?YVBFall2NjdWQTFxWEhXTFlMbnh4UkpFcFNVZlMrL1A2bU9QLzZZeFRjcFho?=
 =?utf-8?B?ODh0aERNdXh1clo2OEkxL0wxTytLdzhMcnFGcU5IbVNaWktXaFBwaVlxc2pm?=
 =?utf-8?B?eW5tS1dSdzhrdFBUbDFGTVJrSDJ5ZWdhaHllWXFzbmFiNjE0QW5TK3AvRnU0?=
 =?utf-8?B?b0RJUXh0cWRwYUc5eVJOU1M2dUkycUlkdXA0OVh4cHc4Ly9hQVJUZlN3VGor?=
 =?utf-8?Q?1MIrm/HtwN2TXwjc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797d7a03-5e6a-4911-337f-08de4e17b12c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:08:00.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hfZ1F1Js/IldCLotuUY89UNUo/wATPXLioWhCcsR5Jr+W5QvpRwV4T1zkCrtPJRCn8pMi7sSHAjSOi/f3SfWDh4jIcAzI6nHg5Am2br01g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8400

On 07/01/2026 5:58 pm, Teddy Astie wrote:
> Le 07/01/2026 à 18:25, Roger Pau Monné a écrit :
>> On Wed, Jan 07, 2026 at 04:54:55PM +0000, Teddy Astie wrote:
>>> Currently, Xen uses legacy method to access the configuration space unless the
>>> access cannot be made with it, where Xen fallbacks to MMCFG. This is not really
>>> great, as MMCFG is more flexible and doesn't require a dedicated lock, so it would
>>> be preferable to use it whenever possible.
>>>
>>> Teddy Astie (2):
>>>    x86/pci: Improve pci_mmcfg_{read,write} error handling
>>>    x86/pci: Prefer using mmcfg for accessing configuration space
>> AFAICT Linux is using the same approach as Xen to perform PCI
>> accesses.

I think you mean "Xen inherited it's PCI code from Linux". :)

>>   Registers below 256 on segment 0 are accessed using the
>> legacy method (IO ports), while the extended space is accessed using
>> MMCFG.  Do you know the reason for this?  I fear there might be
>> legacy devices/bridges (or root complexes?) where MMCFG is not
>> working as expected?
>>
> There is apparently a errata on some K8 chipset according to FreeBSD 
> code that uses MMCFG whenever possible.
>
> https://github.com/freebsd/freebsd-src/blob/main/sys/amd64/pci/pci_cfgreg.c#L261-L277

Using MMCFG is *far* more efficient than IO ports, not least because we
can avoid serialising accesses across the system.

If it really is only some K8's which were the problem then lets go the
FreeBSD way.  Both Linux and Xen both talk about AMD Fam10h issues,
which is the fact that early AMD CPUs only allow MMCFG accesses for
MOV-EAX instructions.

There's also loads of code improvements to be had.  The current APIs are
inefficient to use, and I did some cleanup for them for Trenchboot where
there is a 64k limit.  (But this can strictly come later).

~Andrew

