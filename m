Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C527AF5A27
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031171.1404914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxsq-0002oS-07; Wed, 02 Jul 2025 13:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031171.1404914; Wed, 02 Jul 2025 13:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxsp-0002lN-TM; Wed, 02 Jul 2025 13:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1031171;
 Wed, 02 Jul 2025 13:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUhb=ZP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uWxso-0002l8-2s
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:52:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2413::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c25cec8c-574b-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 15:52:15 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:52:12 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 13:52:12 +0000
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
X-Inumbo-ID: c25cec8c-574b-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3ZRPZp7GcPrZ8k3kHFmjt6mk9TfVjcV31nTWa/u9XbYiRaHQZSKMe/cE55eSp6DgD876A4V9PrGCoCQdHwE11zJM/XZ/U9bp9TxSEHS+rniIaXlRU4aNPUJw70IRFM3izthmTGo5NDcsRscRpTLqJWbCRxZInPzGfjuS1y9e/TVlI91Eh31vC2nPJ1a0lEfHPBj0JZVEWqL/xFsYPz9tlbsjppFkeLXFgRK2GMyFxfvnI8PLCl8T0QdZAQxDInHHHhamZ2K8+P/m2C3ENxr680yDgVnlkwXGho9OaNJ0IOx6oOjEGwii87feALjyL01SaxnC0qBIpfu6lMmj52mLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3X7V4uPt132YBZKzTZCgQ2Ywj+gUzxC0g11pC6lU3E=;
 b=Hl+sAWARiE/8NBwmrw9/3oNubSYR7AN6kH5+1Nij3jqYY+Hp6i+Gny+Od+1nuX2GPVo3exzZKsv872vMyFBMZUuEoo+IggF1ck2CcfqUgi7JiYVCnY084rnRQa5jwzCSab0BSSdpQOF15+VwtmXSL3Z9KlOqigiQXKEI9SIn25nYNaPU4MY9DqQm9T9+YHnx9GWJV6YSGZblTL1q53Ry9rp51JODgxnCb5ROtJ0J68HPjrfNTBSEIF1F2jtLCWp66hX5BednPdL5UVQG21fsl9EwAS7EWV5ISX3S85jp+xFhpmFqeu+tGPCaDTvRfNjtpOeBt7BpK5C5ueqZZngpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3X7V4uPt132YBZKzTZCgQ2Ywj+gUzxC0g11pC6lU3E=;
 b=f/D9C0tqrHd4bZuPLBb4dUyx+n1i+PGFp9CFWWpVv+mtVhFpC/xsBsPqHjohQqLDrVZh8mECSuz4yyLvBfOz4stnJERA+ye92f7wv1YL3H3N/gDeOZ1XfwclRle2AdKAKCY4nhBvaoHzrKhpc9pB4KjKqyM7P12bry6dI/aeJVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <33c081bb-3af5-4eb7-9109-75c0bb77a6f6@amd.com>
Date: Wed, 2 Jul 2025 14:52:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Hari Limaye <Hari.Limaye@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <95cc28af74339ea617081f3935123e38a53cc657.1750411205.git.hari.limaye@arm.com>
 <e3d28537-b531-4cc5-b875-4afa0437ece5@amd.com>
 <AS2PR08MB874501E9A5853A529FE6BA11E241A@AS2PR08MB8745.eurprd08.prod.outlook.com>
 <e0b7e7ad-f7bd-48fc-81a8-739d49ae806e@amd.com>
 <5CA72490-EDED-4D7E-B875-F7E8096AD1EC@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5CA72490-EDED-4D7E-B875-F7E8096AD1EC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:10:234::29) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2a7ed9-c8e8-4026-8d19-08ddb96fa542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eklVcm5BbEVBMzFvZ1R0b1lINVVwcXkyN1lnMytPMUhNWitmZ0FGaHJDOWtU?=
 =?utf-8?B?N0dweHU1Skh1eUszdk5sUmdDM0Z3djc1N01LdE9RVFZNbGM1Szk4bFZZY0pt?=
 =?utf-8?B?ZUtiSVN0Q1FCeTBPOVdrRk1yb0dOZjdEZ2FSdFZ0Rk10a0l2OEg2RFhGaDMy?=
 =?utf-8?B?cmtDZHlldXRBeVEwU0hsRU5vZnFQUVhGVURPdmc2NmRyaWEwNmZBbWhvVG9T?=
 =?utf-8?B?L3hDOHRzR0JCd0EyTjVnQnV0VzFQRkNmbFh1cUNUQ2Mvc0FuMVlkNmVUaTI1?=
 =?utf-8?B?TUg1SGxvUk5RaUNaZjhDR2VTQVBzMXFGanNCTllNK2dsTUhQVFkwT05ZZTRF?=
 =?utf-8?B?NnNBQW5md2ZxQmVmUU1iMzk0WWZNQmZhbTBJYWd4YVJua0VVSDBMVXgyV3Vi?=
 =?utf-8?B?NTZRODhjbk9ieFIrdGlldHp5UVk3Qmcxb0F6UHVDRW1wWGlUeDJEenFueDZx?=
 =?utf-8?B?ZjVNdDc1TU5oR1ZRNkNQbisvL0xmOFIxS2l4eGtRVExkZW1ZOFNNcGVHMHg3?=
 =?utf-8?B?WHUvaTR0YnNBVHVRa3BaKzE1SHZYU25ZNklhU1FXMGZZenRzTVFvUndUVlhG?=
 =?utf-8?B?ZFJ5NmpaWktUTkdOUk9pUXpHQU13bnVwOXlTOVZGNXZxWGZrVHFDQVBORitF?=
 =?utf-8?B?Vmg3WTZEOEhXZ2Q1bUlzRnNWS2hZaHJRVHpmTGFnVGFFSUpZcFhsaXlqSVJ6?=
 =?utf-8?B?d0ZvK0N1N3FNWlpXaVFxc3FLRzQ2UFhnUjNJbEJyMmZ4VlkwOGVRNFF0UjVp?=
 =?utf-8?B?L2k1QUNEUkxuQy9OOUEyaG1qdjFrUDdyWk5zbDdPNlVrNTlWb1IzNHBEVVVi?=
 =?utf-8?B?MlRGTUF5MVhJZGRIUVRHZm5INGZDTzI0MUpwM3dFWEZoMlJBRmRYK2puKzB1?=
 =?utf-8?B?YXo1Mmt5WkNCejg2MUJzOHhRWHNPN1JRR0RzeS9JVVliOUZ4MENCa0JmTnBo?=
 =?utf-8?B?YmxRUmFrV0IzY2c3OHZIYXdyQkJFZTFrRXFxd2ZiU21RdjNWZkJuSHU5U0N4?=
 =?utf-8?B?SjhMK1Ewb0Q3TjdHYW1FcjhzdlkrWEZUTk4rTC9tWk1hK3RTZ0hDUjFkZ3RO?=
 =?utf-8?B?a3FtUkZzNHZHQ0Z1YVlIcDcxcjF5L1ovK25ld1VOWnhRTWlaMjJiaVplYklQ?=
 =?utf-8?B?Sy9qR1A5YnB5azlSRlpoU1NIUG1pcEZkZjk0WEthSUM5Rk1NQ1I5YzZqeUdl?=
 =?utf-8?B?NkxjRXFzc0UzbWM2b1dhNHl6NzJnOCt1ankwMVpYVWowUndaZkYvOTM3ZUp1?=
 =?utf-8?B?Z2FDTnJXYTREZmFYM3ZXeXFrb0ZVZ05TVnJXVThId1JrTVpvZ3VwNXBSNGVN?=
 =?utf-8?B?dUN4UTJoMzBrYi9lZXV5S3hVM25HQ1gvbWlNTEh6WlY5enlvTnROaG85cHVK?=
 =?utf-8?B?by9BOTMwK2RkRWhMNGdIbWRNcDRpRlY1dTRFbEQzd21SMU1SdTkvQi9Vb2oy?=
 =?utf-8?B?eG5IVnBvRllNaXdLL01SdWROblEyT0Z3dU5ubnJmeThwY2N1RjJsQWQvQWJN?=
 =?utf-8?B?TllYdzVidzlkbjZiTUZCY1IzSFRMWGpSd255c3hEb05HMmd3ZVIrQmdndUZh?=
 =?utf-8?B?cFdrM0xDYXlTUld6S2hGU3lnb1ZtV211OFBDcy9CSzhYVkpsRkoxZlFrWmNn?=
 =?utf-8?B?R2grcVpGSE1CNGZoL0RNV0E1amwrWmRuWDM5UmJYYUlqVjR4V3pyVXgvTEVX?=
 =?utf-8?B?YWdDT3V0aFR0R2NKWnJ6R3J0dEYxcmFjSGxxRGxHQjB1Vk4zWStNQXhvNDVM?=
 =?utf-8?B?RmJVbFlhZmpYT2NJNnZoWGpmbmFxTzNMQUxNTVV6OGMvVzk0R1NkSENBcDZN?=
 =?utf-8?B?M1pDNG9CTzZmUlpxSUxMakpYRnVqOWI3bjh3MmZVSkVuaDNyWlh6RWtjMWRX?=
 =?utf-8?B?T3I3anpXUUJnQlJQQlNrVE1ZU21WdFdSZkdZdXVIOStmT3Ivdi96MnpGZWFB?=
 =?utf-8?Q?DZKM/jzv1nE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWVmeXF5clhWSUhmQytvdG9abWw4NHhGQU90cTA5ZEFMTGoybDIyVzVQWjJB?=
 =?utf-8?B?WHp1cmtRdG5VbW5nd1pONjlIOXE1bXJaRkFyK1FzN2JEYStXZTMxZU80OEIw?=
 =?utf-8?B?NTlTLzdJQmEweEVPNnU0cWhRRHhWbmV0d0YwS2Q3cWF1VlRUblhCZDByUFB4?=
 =?utf-8?B?Ym1kTklweWg4M3JOSVA3cGVJMDQrWitZeWNNRS96SUV3WTlSaE1HRWhGOGEz?=
 =?utf-8?B?amZyYldLRkVibExrdVpMeEZER2czUzFYUWVITStuU0hsamxQQW5VVm9ZZEVu?=
 =?utf-8?B?d2JZZU8wYWF0b3psSk44ZkpzZC9SZ3BralBhSCtGdWNST0JUakZ2MExudDlp?=
 =?utf-8?B?WHVDa0NzUlZCK0poeCs1ZzN2TCtoOFlhY0FQdTdVTE5DRU0yc09MUm1WUDJH?=
 =?utf-8?B?RnZqZGNreGtaWVcvWkRPdnhMQlhnbzFkY3VMall5RUluaE5JYWlYS3IrRG9Z?=
 =?utf-8?B?MmpoNnhKbkg4TVhBZFBSbXNRejgwVmVtaVVNRUV0cXJVQmdpT1VtVHczcjRZ?=
 =?utf-8?B?SkFHUHNaN3EvNVpPWmMyMVliS2hRb2hyWjEvdjVxSndWNzFYVnZ5TVo4cllU?=
 =?utf-8?B?Znd0cGpETzF3Ylg5a3JtYXJsZ1JjZjZ6bjBFL0xrcVVzSVVaQ29TbEpDdW16?=
 =?utf-8?B?R3paSzllSlFwT2ZsVWVGdGVNQ2tGL3NYb1pRS2VpdHhrTmJuNGZ6cUlLcXNu?=
 =?utf-8?B?aFkwdUY1VEYzR3ZyeGNZc1J4QmRuQnNIbmxQanpta012WUcyUm1pYkd5TTVF?=
 =?utf-8?B?ZUVScEVkYUNGRTZJWlVjekJmNWp6cS9xWVZIOEFtYnRhQnp3R0VldU8rSFpu?=
 =?utf-8?B?U0pwU1JnaWdLOWpuZ1Y3d2pEZ21lRTJJcFNGNml4a3RHSG9vMnN4a1VFNC8z?=
 =?utf-8?B?dDlLZnlYWllMUFVlWWtEV1FOTmFvTS92NXFrR2dIZGluQWRSbjRyYjlLS29z?=
 =?utf-8?B?SnBxMmlGR2Q2T29ESXJKNkdxL0lXcGlkQlNsOUY2Z2Z2RXpsMVIzT2JpQXB6?=
 =?utf-8?B?K2cxRTJlOHpMa2lEQlVLK09lUXNzKzNySG5sQk9LUDdsNjNSblRPd0dDS1Uy?=
 =?utf-8?B?OEZodzlqNm5xRkV5OTFRODlSSnFMZDhZY2pVVXN0a2NjUFpGMnZwK3BDcFN3?=
 =?utf-8?B?K1RaWk1FSXNTTStoRG54eGRyUG5ONkV5VnZzQVJSa20rZkZNTzRaekNIQUx5?=
 =?utf-8?B?M3dWUGVjaUZjdmJ3QWV5QkcxTVg4cWh4U3g1TVNMSTEvdHlsaEMxQlBFSGY2?=
 =?utf-8?B?MmtkRDBvTzFMVnA5VG1nTUM4YTAyL0hGbGg2cFVEQzNyTERLdjBxbHZ6V0hz?=
 =?utf-8?B?QzVkNk5vSVN5Y3RhMlNNSzRTZlFjWGZXdEd6eThxczdPNExvbDAwWHJIdnVu?=
 =?utf-8?B?VTlnMGJ6TDR5Y3Jnc3hyUkhPTk05NDUyblBvYVNncUpTeGczUG9aVnRtOENs?=
 =?utf-8?B?eEc3dzYwTWtSZW9UWE4rRms4b0xSSC84ZUo5NVQ3Nm5Gb1Q2NitXUXh6OEdZ?=
 =?utf-8?B?ei9Kdk5xaTdYSURFUlF5V2UreE1wU2UvNi9jS1E5aXAxOVhONjl1NndnTDNp?=
 =?utf-8?B?ekhZUER6RFFSSGVuQmJGZlN0SStiamwwWlpPMGRMRFZ4cDVUODd3bTJPOGJZ?=
 =?utf-8?B?dnhaQUl0eXlVeVdvMzRLVHA0QmQ1TzF3dFkxQ08yQXhycTFReHFnaVNHRU4z?=
 =?utf-8?B?ZzRUNGR0WDZ6NEFYRlJPUGFFcFhEdExPbGFFdDl2VHMxY3pwU3JYODYvTDhD?=
 =?utf-8?B?ZDU3VXNNbW9ZMjMxR3RmRkU1LzZwSXlSNC9iRlJKVElQaXRicDNzOC9pcWhD?=
 =?utf-8?B?VG1PRXhwOHdFVWVCbDBiZWFjMG9KalVYWUljdzlVS2FOUzNGemFNSUZKL0xL?=
 =?utf-8?B?UlNtMUlqUWp1ZGJUcSsvTS9jaWxsRE9xNFJ1OGU0MEl4aGs4dk80a0VEZCtw?=
 =?utf-8?B?YXJxclczdStVcytWY21PYzV5Vlc3cDNPamIwdXQ4b1pYc3lNZ1BsMmJBb2pj?=
 =?utf-8?B?V3ppRDRTcnh5bDRkZWltVGVkU3lCYzhRK01jOGFTYXhLeGlOdzFqZEN5TGRM?=
 =?utf-8?B?MlJqYzZrRjRWSXJhZE1MUUlTaEdVay9sVmJDK1M4Wis4RnVnc0dvdWFPOWNa?=
 =?utf-8?Q?EAMZEVq/FrQQpZw6g0etDibyG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2a7ed9-c8e8-4026-8d19-08ddb96fa542
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:52:12.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCk+pVye0LmC99c7AGxzxwydgcaZoJMlgSmJfXUMJ7hx2L6z5rKj2nkZo8eq6FASbDPjXcuwscyZdcWzEWMPrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087


On 02/07/2025 14:44, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 2 Jul 2025, at 14:11, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 01/07/2025 15:56, Hari Limaye wrote:
>>> Hi Ayan,
>>>
>> Hi Hari,
>>> Thank you for the review. I have just a couple of clarifications before I
>>>
>>> re-spin the series to address all the comments:
>>>
>>>>> -    if ( flags & _PAGE_PRESENT )
>>>>> +    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )
>>>> Same question in this patch , why do we need to check for _PAGE_PRESENT.
>>>> Can't we just rely on MPUMAP_REGION_XXX ?
>>> The _PAGE_PRESENTflag indicates intent - whether the caller intends to create
>>>
>>> or remove a region.
>>>
>> If so, then I misunderstood the code. However, looking at xen_pt_check_entry(), it seems _PAGE_PRESENTindicates if the page table entry exists. If so, using _PAGE_PRESENTis not making sense  to me atleast. May be others can chime in.
> But it seems to me that _PAGE_PRESENT is used in the MPU code in the same way as the MMU code, to check
> if the caller has intention to add/modify a region if it’s set, otherwise to delete it.

I had a discussion with Michal and yes, Hari is correct. Please 
disregard my comments.

Sorry for the noise.

- Ayan


