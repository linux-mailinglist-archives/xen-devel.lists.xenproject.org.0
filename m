Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE1C71964
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 01:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166499.1493018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLsmQ-0005Ey-6O; Thu, 20 Nov 2025 00:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166499.1493018; Thu, 20 Nov 2025 00:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLsmQ-0005DW-3V; Thu, 20 Nov 2025 00:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1166499;
 Thu, 20 Nov 2025 00:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLsmO-0005DQ-BT
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 00:44:08 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 037df58b-c5aa-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 01:44:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5084.namprd03.prod.outlook.com (2603:10b6:5:1ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Thu, 20 Nov
 2025 00:44:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 00:44:00 +0000
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
X-Inumbo-ID: 037df58b-c5aa-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhe6HUwHyx1UoPCCmiVvIwOtfxKz/+6zrut1EiWU+Z6v1pGQ5pBQ+B74gpAB7BLll7iZm1iEUaVn/JK70N0NV824+jQ1nUmg9HiMiXj2j0h2gy5zGjIDSR49vn9Th/nLkI80bRuTlg657hbqPX3m0wCygHGlmEq/xeJ7QmIBPr4eRRZ/w5ZFUarFKf2AJh5eD2mvjm07WOnOBbVgJU+Svq/WWITYl3Zua8q7ADP6C5Q9tl8Iys6ez9wVIAHGlgs0JmDbKgMdT0AW474lJ7lwS/baFota3ibzO7G/eMl0XIp/LDqo5pIatd9CziC7R4dIDTQr3pNEc9oE0tpQLOUfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBPIfW6iK6zy4J8PunQCqJZKDVGEefEGQ/IaJIui6e0=;
 b=ra5lc/kdPVV8NKgXykxzFwH2G/7R3flUax59rRqX4qtdwLviOH93n9BdswGFPH4Pwmelcwt/Fq6PRNcV+ASiS+eIk1JGgt/TBCGubIbAVE1NHwLWnFGJQP4Aa68eN4YJlK5S8Vo+ijw2BVxya+zKwGkYK5/HEuDByNZsJc3rX0f3Al7maWMAoDesSkeEJPVOp3nYTRU/9g18RvvdFS2pdumpOn0dmcGZKcbcveHMiTvRN0YN77/ZdRkdzQjMUWLwiI8sJpklDR+cOolPBBCxnT82bjOx7GVlzG2RaqfOk97/2Sh8Utpn3Wv+D+FLYSPoL92Rp9fY5ffYuWFtQu/GcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBPIfW6iK6zy4J8PunQCqJZKDVGEefEGQ/IaJIui6e0=;
 b=jfDHwomxgiLFe7TnXZhPHZJsV2LPoQh1I3vXZvau/yHe8AD8mYg5+AatbR3VpVPIljQWcqyquf5sOeicGDBySfB2UYoZNS0Xse8W9iH81Sp5Zb5n8VoGjlwjQ1CAXj67sG03DSCKV4H+OprDc6gysauSHBhLj0dkZ4cZvZIMiH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ded843d3-465b-419a-9342-cb3a35a2d880@citrix.com>
Date: Thu, 20 Nov 2025 00:43:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix EFI buildid alignment
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251119191235.863187-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251119191235.863187-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eca5da9-4b6c-40b0-c15b-08de27cde578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmJmYzIzNFM2T0FiM1o3YU5iTTUzbGpmSXExdUZUaHY2R1FPWTBTb1BVdUow?=
 =?utf-8?B?QTZMdXBpNEJpWmVuZFllMmpBZlM1RCtVb1B6dzRmZnJHOEJCeXNPRHM5Vk8z?=
 =?utf-8?B?MEdtQUZWNnBGRU13UFVySmNOTVZRdXI4OStwYUQvYjNnZEtKS25pQ0FpWkQ1?=
 =?utf-8?B?ZVc4MUNIS0F4azFFbmRHb0wzSitLT1FEc2RSMmk4RDZVdTZURW1PY1JHQ2ZM?=
 =?utf-8?B?aktacjVlZ3pOWWRTOHByOUxzZTNBT2lNNkZUN1lYR0duVStCRUpmWWFTV1g3?=
 =?utf-8?B?Z0ZKTkNzcW1idmd4SUdvb1I4MnpielhiRHpDYmZkbkRZRkh6VEoxakM4QUZ3?=
 =?utf-8?B?Qmd3T3ZiUWMya2puRXdVak9MaHc4N0x1WTBnR3lnWm01cjA4d3ppekpzNDV4?=
 =?utf-8?B?UlFBZVhxNkRuekQ3RC81T0piWmcydkJPdVdleCtFK0dZUytuSVIwSk1mS2Ft?=
 =?utf-8?B?d0dqNDV3aTlUeVhVUzZFQnRCc3YyRHlmS2x2VXpCSDl5VGtIcmlkMjdqOHdm?=
 =?utf-8?B?blFmcDJvQ2RrTFhzU28wM2J6Z015YmZkVTZnZmJqRTNLQ3VJb0VEKytvcm5r?=
 =?utf-8?B?ZW1ydHZsQVhYNDhCZEpiMXZsWWR1VUx1MkdRY2FFdXUyTnFKV0tTaGJuTklQ?=
 =?utf-8?B?TzBrL1dqNnJMeUN0SzlpVkpud1ZiclhZTDNwcUl4Q2lvMUVEb0l5Q29RZzB6?=
 =?utf-8?B?dEtIcmwvTFYwRWVpais5ZzFOTGJpMlkrcXNXUDdYZUdDRHhpSmI2TmpkaTJq?=
 =?utf-8?B?NDF6L1VoOURKQ3kxUmRieW92enI4R0RBY1RpNFMxdkJpRkloS3RqcUg5M3hw?=
 =?utf-8?B?SW9rbVc5enBKS1VzVThQc0ZnWG9ZTlMyTkg4VTR6Z0xYNGIyblVzRkJyM3Ft?=
 =?utf-8?B?YXRmRStZNUw0L2pDWWVvMW9zVW1ha3BnMG1Wa2hsMlIyNTBaSnY5K0RCMDBn?=
 =?utf-8?B?VFNRcmZXN1RKcW53YkNnODFLVGhqTHM5Z1FhaUlXRng2RWpUdlIyYzBEV2JD?=
 =?utf-8?B?V3dSVVlmbzBSSHcrZnl2ZjBuUnp0dE1GalhnZnFtVVFKbG5XSS80enJudVk3?=
 =?utf-8?B?Rjg0SmprRnQ5Z3N4NHFKUStDeUdCbmlsV1BITFAwOXBsdzZwcmlNTW54eHR4?=
 =?utf-8?B?WllaNE90cGlPZmRPdHhMMjNyZGROU3hsSDlzcUlzQStuanhhN3k5TlNWR2M1?=
 =?utf-8?B?YitlYXNjajdTT1B3VnQ5djc5aEFuZEJibUVibEZRRDR4ekk3TUd0ekdLTHRJ?=
 =?utf-8?B?WXhhY2dKYkt5ZlFLeVU1N0drY1JSMUhsdFpGcWQ0b0VEeU51d3E0aWhXM0Fk?=
 =?utf-8?B?RXF3SjJNcmJCS0t5SG5nakExbHBOdXhDYUhodTROc3JVaHpQQ0hVTXZKdHFC?=
 =?utf-8?B?S2dsbFY5TzFabWF2aUtWZEhzSlQ1Q0l3SyszU24vU3hoRzdMT0NCS2lZRS9S?=
 =?utf-8?B?elFjMVRmVlVZWGRWRFUvdVZtRkRuY2kxQzZLWktZbmlRMm4rU2NTNTNhMDkz?=
 =?utf-8?B?UHdnOTF2TDlYZmkycWhwWjltWUo0N2RVZk5nRDRZbDQ3Rkpac01ybmhCUzJa?=
 =?utf-8?B?UkQrMThaWjl6QUVuMWhTVUNlOEVMa0N4b2JTMW9vbkptcEtPNWJybHpKNXZX?=
 =?utf-8?B?Q1RjK2F0ZnlnbEk3RnUxRkl5N09hNFhRQi9RcHZQSHlpRGdqWXBJZURUWG5p?=
 =?utf-8?B?Zzd5dEtWekJkV3dHOTU2aVB1VkwwK2pWSzN3UGk0OWNBbVdDbGg0VzJhalNX?=
 =?utf-8?B?MUV4Ykd4RFJIb3ptTkkwaFVicjRYYmlFZ0FabXNvRE5OWGl3OXNQZjFPSWcy?=
 =?utf-8?B?VGRtanp1RUNkWEVDN29xaStWaUJZVkYvTmhkWTlENzcvSE5YdVNsenN5RXk4?=
 =?utf-8?B?S3Q1Qm54QjVBSWNxWUp6RXA5dnJnK0FUMlNwWHBMM1lKVFUrMGRqUENoZDh2?=
 =?utf-8?B?Q1pVWmdJcGpoMkZzTWdtSWlsR0xaL3FWcGVCeVM3SGxMUk8xSys3ek5NK3dS?=
 =?utf-8?B?dGJOK0JETm9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGt6MS9oZ3dzQjBTbEpKUnhSeGlvVGs5QzlrYndxcjUvMldiNC9ObjdxWDRP?=
 =?utf-8?B?Rk5vdXpBNk5aMjV6SmdzNUp3eXAvQzgyVFpud3RldVhwUFg3enB6cERwYmJB?=
 =?utf-8?B?ZU53U0F0eER0R2Q1S0xIT29RanRxWTlkL3M4THJPZFI5a21RemRJTno5Q0xX?=
 =?utf-8?B?K2RJTG5kQ0NOM0FONjFKN05vSzBoWWJjS0xudjRBcjNmOGc4bnZWVzM1QTVk?=
 =?utf-8?B?L1o1eExTazB4UjlGL0FVY01pUDREeVY3U0FSaUhjenZCd1ZLN05UVzB1d2xL?=
 =?utf-8?B?RDFiMVNxV051K3N4eDQ0R0NqRzg2TXh3KzhpekFLcjc3VU0vMzl3OXo2V3No?=
 =?utf-8?B?Uy84emdlTm5vMTlJR1l5UnB3K0ZpWnF3bHhRaVVHV0YwaWJ4YWxkckFrWTl3?=
 =?utf-8?B?T3J5V2FsbEQyNk1nQmszdWZGdFVmNERXZHUzeEJSSWFFZFhIbjhuc2RnbDhl?=
 =?utf-8?B?NlVvUkxZNUJhWjRmNzEzUGFJNnl4VkxETVh4andMVFZFQXBkZndYWXBBdHov?=
 =?utf-8?B?RFhVOUV4ZXBGUloxbk5VTUZ5ZVNoQUtYM0EzMkNBV2JaUEg4SWVTTHJXenF6?=
 =?utf-8?B?ck96RG0zczdBSVpNN1VmZDJhemlKNGl5WFVWbGlVT0Y3VE96bEpUa2JzVncz?=
 =?utf-8?B?VnNnbHNmeWVTbHUrNng3N0NYaDRKcms0WU5mK2dhQ2VGWjJ6NmlKYTNXQkNQ?=
 =?utf-8?B?S0RVQkVPOTBTNDV4d0cwZ1V6WE1paEUvRk5qenJ4VWduVmZQYlJWWFhUT29t?=
 =?utf-8?B?czBNUzVkNW1MVTI3VFRsQzhXMS8zRUxQMUpKOEUydi9lclBWVVByQmdpd0g0?=
 =?utf-8?B?NDdlWmtUUjJxaklzU09BU0pQMFdmQU1jNnJIMU1DTlJ2WUtsakFyOCt6K1pI?=
 =?utf-8?B?Zm1UZm1pOW9pUFRuZVQ3N3ZML2FQMUxXcW9tUHcxcnNYam1JaU1wOE56anJz?=
 =?utf-8?B?RkxidXJQOGp1NzcxVXhjZjZvc1Z3cjk3NWx2VDJtVFhKV1Zna3ltN3lGcGhT?=
 =?utf-8?B?Y1RUV3VlN05LMWoxTWF2K1o4NFlaZHh2RVd6aC9zRy8zQW81WWNQU3pWWXgx?=
 =?utf-8?B?eml1MUlwZUNKYlFuVTJlaG5ycjdJZzFQQXNpUnd0MTFIbHJrNEc5VG8ydnQ0?=
 =?utf-8?B?UmQ3Q0dNa1MrcmRMZWxmYTBwQSs5Mnk0SXFzK1pJa25pMEdJYm52UE9HZkt4?=
 =?utf-8?B?eXhFOHhscmRwYW1uWGtQSGdKakZ5U0cyUXBxVC9ndXFncXRic2E5WURKMEts?=
 =?utf-8?B?MkM2anpRSGcyYjBpNEs2QllEcGpyT3FKTVpMR21XTDZVczc5dnNZL0d4YzVK?=
 =?utf-8?B?TjR5bWNOZG52MUpiRmpDMUJmUE9SazlDQk1zNko4VzZ6eXRrZGxMNlVkVTFl?=
 =?utf-8?B?bUZPY0R2R3UzVWhSOU5ianZSVmVXSytvRkpTQkU2dktJcHlseVFqUGc1N2xm?=
 =?utf-8?B?YmtkSyt6dE9ka1Jyb25JQ3pHOGplbkEzWlFNTEhFS1d6QWdkVTdnNWt2cGVO?=
 =?utf-8?B?M1R2VkZYNWJ4TFN5QlZ6L2lQOEpNOWxBdjVUbFUyaFczZlBLNG9aQ0xUdmlD?=
 =?utf-8?B?RnAyWktNbTY2UXYvVGJQRGt6c2VTRGlLaTdsMEs4WWF6dkRIR1dMaWtyaDRS?=
 =?utf-8?B?b0pQUm5BWUZjRTkxbFY4bVRyazNSZ1JoeGRiTDhLWnA4TUhleEV2b1BtbmhX?=
 =?utf-8?B?UnlkdEtjdmhkQUpQd1k2NjArU0xxWllsY053cXp2M0pwWmtZak1aTm82K01s?=
 =?utf-8?B?c0ViQ3hSM3pWNTI3ekN3OGNFU215aTFNTHo5dVdTN04ySDl6L0JGYXhKUEVC?=
 =?utf-8?B?L3hRL3FUUjF3dk15S2JLZGNPOE5mQzAva2wrTzlocXQ5VWJ3dTQ1ajlyNWdz?=
 =?utf-8?B?NVRGMS9ET29jenlxY0I4dzd1RlJDUGlhc2Nkcnh1TXNyTnN3Y0oyWkxiek1G?=
 =?utf-8?B?NmxrdDRJYTY2N1NhU1pHcEI5ZEdCOHozeVg5ZDlpdmZmZ0thOVJaWWhmRFpj?=
 =?utf-8?B?bEN5WWx2VXYyM09rMWJWL1JVVTZFZ2pFVnZzRXQrMlZNVFN5YTdrVWdJQ2h3?=
 =?utf-8?B?OCtjMEczTFdvVzVjY3FUK0liTGowdVdZZlN6TDdpMGpUb254UVFyemU4b0VX?=
 =?utf-8?B?eVlrbisyK2RHMWx0YnVObk1pKzJuNU50aThPRzhrdmE0cHlvODNpU296Nlk0?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eca5da9-4b6c-40b0-c15b-08de27cde578
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 00:44:00.6550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VT+0ujPD8MtrtFHcXw8oTUd3VbUbpmCGh8eiA8klovoc7QEF5v6bZcrTJWim4ak2wjjmNm3IotV+rwVBzg+JoS9zsR6y5Ntklabvbh8yDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084

On 19/11/2025 7:12 pm, Marek Marczykowski-Górecki wrote:
> Old binutils get confused about .buildid overlapping (in VA space) with
> earlier section. That confusion results in weird errors down the road,
> like this one:
>
>     objcopy: xen.efi: Data Directory size (1c) exceeds space left in section (8)
>
> While the bug is fixed in later binutils version, force alignment of the
> buildid to avoid overlapping and make it work with older versions too.
> This can be reverted once toolchain base is raised at or above binutils
> 2.36.
>
> Details at:
> https://lore.kernel.org/all/3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net/
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Fixes: eee5909e9d1e ("x86/EFI: use less crude a way of generating the build ID")

We typically put these tags in the other order.  I can fix on commit.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

> ---
> While the actual bug apparently is in binutils, the commit mentioned in
> Fixes: tag introduced part that triggers that bug.
> ---
>  xen/arch/x86/xen.lds.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 5d02f83a409c..967f9167f757 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -171,6 +171,8 @@ SECTIONS
>         __note_gnu_build_id_end = .;
>    } PHDR(note) PHDR(text)
>  #elif defined(BUILD_ID_EFI)
> +  /* Workaround bug in binutils < 2.38 */

... this says 2.38, but the commit message says 2.36.  Which one is it?

~Andrew

> +  . = ALIGN(32);
>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start = .;
>         *(.buildid)


