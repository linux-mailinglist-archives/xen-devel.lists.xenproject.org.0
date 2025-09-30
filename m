Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3CBACEAD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 14:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134248.1472216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZkY-0000kZ-Da; Tue, 30 Sep 2025 12:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134248.1472216; Tue, 30 Sep 2025 12:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZkY-0000iW-Ak; Tue, 30 Sep 2025 12:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1134248;
 Tue, 30 Sep 2025 12:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v3ZkX-0000iQ-5J
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 12:46:33 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c2eb421-9dfb-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 14:46:30 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BY1PR03MB7899.namprd03.prod.outlook.com (2603:10b6:a03:5b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 12:46:27 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.013; Tue, 30 Sep 2025
 12:46:27 +0000
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
X-Inumbo-ID: 7c2eb421-9dfb-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNh5Dd3QIaDxaTyrQRCaRDENMgnQ1HnVA9YECJKT9Uv7nbAhoL83EkzCNRKKK1v/AHwxymjBuxjC7V6TDXNRP/tKYZ5w0UlE4/p/THVo/NiBBs2CzVGSUmhyg0FjCGkAnHgB5F3gNTO6/ynm+L7vPH+gtLBqSWgDTh4xqhUFPgNbAjnHq+sOOIaTio+nq6pLFgdBPFjswgmbTX4ymugttDWrMUx+kTxjQlGsf9/t3Rzv6TEjoIw6IFOao4B8bMnZpov7SuAZTjOJ9Gd2l4VydNxlnVUyD/H4kkoNQSQUkw/eo+E226GBk4d/R8Gt60pU0PQky2WQgJ5yho4LlBmV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wkdnTpNqw2KP2OXyslMwiuzgi1mnibIijhJNskeqd4=;
 b=MtHvUlUIoHGJxHKDmAxuHzmwfo3lOHEUpuM3FOEmJjSP8NIFSaUweUxPMLnROOkSLYUWi/n/oCv627zdLfGN0acWAIsNGmlZHIiAvBudyzhUTigFJbaR4AGx3J7uxGFw1YKcwJCekhPF0f0gz0SfqY47UU0tcWn0ZgMlkfQJZQ+lq19aWWykNmblU6t4ctQrLzFK0SvJBXhMEJFASB7+MaV1pOGk+H7NtZxSYIBuXJAU7SQd9ddyP/UcTf7y14/7XLGX/XmAp20RnDyDxgoYlOIE/2dxThOPEEcyhHzaqdjnrdz1QFJJa3yq2jd129blIvieldYDGjA8H9dScLECHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wkdnTpNqw2KP2OXyslMwiuzgi1mnibIijhJNskeqd4=;
 b=SHHJmM8mIEYhPnH/6r2x4k91eMeaJZFf4nUg1HBj8EqMeJyx3mA0bZnUzukUJ8Hzz5Hs8FmjtF+OQp8YMkBq+zGb88OQw3FgIJOeYgrtUAl63hsRlScgbCSYdpXP6DfBiCQDOcyprx4EVwFFkianeIC6VHJMKHT54GKGiuXBFFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 Sep 2025 14:46:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
Message-ID: <aNvRH-MWRMJuX9w5@Mac.lan>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <dfd39bbb-cefb-4d6a-b4cb-b3a787411fb8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfd39bbb-cefb-4d6a-b4cb-b3a787411fb8@gmail.com>
X-ClientProxiedBy: MA2P292CA0030.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::7)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BY1PR03MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: c010cef2-f598-40c0-c46b-08de001f5f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEwrQXNzYzliN21KK2dLMkZXTmpZT3lkYWovVU5yYVFwRE9GUmxZQVIyWUVX?=
 =?utf-8?B?NjBLK29CYW5zNXl0WUdCbkpDdDR5KzVEenVkbmxDVFhkYWE2a2czZUgzM3A2?=
 =?utf-8?B?dDF6d1ZRclFxeWJ3b2lOeUZoTXp5OWFvTkpTUzBUTmVqQ1EwZkVtUjZGdWlm?=
 =?utf-8?B?N1dLRC85UVU0VHdDM1FWSTZwd3lLZVpOTEFxalRHSk96L0ZzZDMxVjdyZk9K?=
 =?utf-8?B?eTR3dXVRclBXN3hpd0VhckZGUjM2OGRwTlBZczRkRHVoS2RITjNabFhlTkJK?=
 =?utf-8?B?VG9uTlFidmJsK3d6K2dLV2l4dVhWRHBQVDN5d2ZYVnFmMWdLblcwZG5scW5P?=
 =?utf-8?B?ajNRNU1Ob1Fra0lMc1pZalg3Y2I1Z1BHNnN4UnFDWUpGQW9YNG0vMmNjNW51?=
 =?utf-8?B?Y0RneTBRWmRzcjNLOFFlZ2lWYlpmV1Vxdmdva3p1bWc5dXBMN01PcW14RDhI?=
 =?utf-8?B?dysva3pIVUoyb3Q0K3RKUWNLOVZzb21BMHV2N0RkdThhSkZvaEcrb2hPM29R?=
 =?utf-8?B?RG5kRkVraDFqY1dpcnd5YkhmT0s0dk4yNThvdkd6MUk3eThDQWFPcTdyVEVQ?=
 =?utf-8?B?UjUyV3R1RXp3TFdocEtmNW90aHdnOEVaQmdGM2tzdVVWZHdWQ2FDNFVLSC9s?=
 =?utf-8?B?dkRTWHVoOHV4Uk45S3BLVkQwdWp4YnpUYVB4TTFlMTJCZFFQUDR1VmNqQWpE?=
 =?utf-8?B?TUJjUy81UTZXNy9Od0JwMDAwRG5xQjRIZ1F2MnAwTGljSk5kd1p6cHhtdndX?=
 =?utf-8?B?OUh6a242VEJZaThPeXVEUDNTWFEweVM4OEtQbzNTQ2xVSEZOZFNZeVBnaTFm?=
 =?utf-8?B?TmRDVzQyYmhuNmxkNVdSNnNqNmRJZDRqdUkxa3ZiRXkrVWdob2UzRkhoMEo2?=
 =?utf-8?B?UzZPNU4xTTNVZzJyYy81OVVOMWNxbUNWc1I4YjdHYW8vQzNWd2s3MVZuV0xT?=
 =?utf-8?B?Yy91QnlQUzZ1bXJQYUc1VnFFK2JEN3ZLV3kvRDJPak1QeUh1d3YvM2k3U0ZU?=
 =?utf-8?B?am9CdVFJQ3lPc3dOUC9pTWxuWDZvdzN2WEFzbGo3NzZFWlczQlQ1RDNCZkdv?=
 =?utf-8?B?WGlNeDVWM0xZVTFONitlWWRZRDljQXQvNXlCTlA1QTRlbDhqYXltMzZYUVR3?=
 =?utf-8?B?TEpwTjF1RSs2bzYvQ1R0aWhadXh6MU9PTG91c2JzL3NMR3dBSUVWOUdMVjJm?=
 =?utf-8?B?SEk0YkY3OFNreGJuWWRUc2VPNDFrajR2a0dJWE8xaDJSZ0xaMUh6QTc4WlFv?=
 =?utf-8?B?UGdkZzhFNlE2RWwyb25XTU0wdjFrS0c1V3FqVHZqYUdLTjFjMys1b0ptQUVK?=
 =?utf-8?B?NCtFMzNDTWpzMFBuVWVkYW5QcVh5blBpbFhVNzFNdkxCMmd2WUdwN2lNdkJv?=
 =?utf-8?B?SkRZblY4U3lEZC9UNE9SSERLbXpaL0FOVk9tdlcvQXpVTGhWRGtWN1FCOWxT?=
 =?utf-8?B?QVlDTHVIU0NXdWZjNUNrV1E1VnNKcmYyalNCUVJFYnlQY08rdWJDY2QvWWpM?=
 =?utf-8?B?ZzQ4WVhqcFdoSHVqLzJodHpKN3VFRldLcGZ3dE9Iay9nTGxJdEo3YW90SmZT?=
 =?utf-8?B?dDJUQ2dsUWlqbFljY1hVYXYzcEsvSVk1eGpqRW9oZDArTWduVnFvNk8vL1R5?=
 =?utf-8?B?bi9UMExvWjBmNHpvWEw3bUdrTU5VYTU5d00zZy92eE9CVlAwVDAzRGwwSGs2?=
 =?utf-8?B?U2dWSVBQc25lRmpoRUY4QzFHRmtWVzZIR01kRlRlVnZGWVFpeDJSWDhIWExR?=
 =?utf-8?B?dzRuL0d0TDY1ekNIRjF3ODQxZC9JY0FJWTNUZEFFUXZPUFF2MTVYWlo1SHVy?=
 =?utf-8?B?WHptOFF3OExhd3JIekZ2Zk9VS0JHSGtOaGpoTWhtQzlqbFVUemlTRnd6U0li?=
 =?utf-8?B?eVpGckhnYnNJSExRcGgzSm9JYThrVlRKbFFaN3ZtelRTVG1vbFhKd3lXWTI5?=
 =?utf-8?Q?EiNGy2hsugQ6L/ZsiHsnSM1V/qpjErvn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWQyNy9SVnhCcERta0NFR3dHOXhNTWRaTEtQd2tjRDZjTk85N2w0bWdOVG5H?=
 =?utf-8?B?WnFpMVB5NStVN1NqdWIzQ1gvUzRMUWJvTFhNaGVxUUhOT01hdks1UDIvdWNp?=
 =?utf-8?B?Ri9qRUMrTWl6d3pQNUVYRm5tclVNaWN0Z2V4VGJPMDRwZ3l3Z2t4cVNxNG5i?=
 =?utf-8?B?TjZreERiS2EzT3pSek40aVExUlRpZitkT0NLREhCODlhQjJtSzFYQTZmaTlG?=
 =?utf-8?B?UzNKTXhsY0dRS3E0SnE0bkRDMy9Pc0trL1hENWVCeDluV1dsTGh6REFqK1Ew?=
 =?utf-8?B?VlVlS1o0bUVYblVaUlNTUXRDc3BzRDlQc216ZDBSQmgwQlFCQWVtekVLSTUr?=
 =?utf-8?B?RkVqeDRsSTlkRy9qaTBKandOQ2NjK2xPTWRoWjZrSWtOL0tUMzlvZ21takdo?=
 =?utf-8?B?VnZIdkYzVkwwY0txaWg4RXA3SUpGUTg2QTVvblBuSjFhWExSbDg5RDNUY2Fl?=
 =?utf-8?B?U2c2enNCbUx3Qk9sUUNtQnBIbnZVc2hlZ0YwcS9NRnZnQTh0WFJyZm5YdGw0?=
 =?utf-8?B?Szg2SVFFNzZIa0VYODV3RDZUeVBoSWtZOGlnQ2htTlZRMGtyUGtvb2VhdEVE?=
 =?utf-8?B?R3VEMkVjZmFXOXFaYjRpc2M1Zi9HTFVVdENvT2puanpyeW1RYlVFM1BkYW9p?=
 =?utf-8?B?L004M3NUdkJDa2xxaW45eUJqQ3YxRGlERzgwVzZJMStWODhldElXbDdmQld0?=
 =?utf-8?B?eHdhSmJ2OUtSNlhPdUpxOUt4TEw3aVNBaHVFbU5zVWw2UU85bGgxZitGdmRJ?=
 =?utf-8?B?NzJXUmpWZnhHbXltYlJBdFd5dFAvbmkweVNMdjhqU0tuSWk2Q01Xd1Q1T1BX?=
 =?utf-8?B?K2pUMkJ2L2hiOWFHaU9HZStsTGxFdUE5S0hpTjNjNE1QWjJEcUJaZmVtUXVU?=
 =?utf-8?B?bjRCcCtuZ1pRaW9CZVZneWo3VDRld0dJQkNLWmpGSGpIMFV0bklEV2lvdVg2?=
 =?utf-8?B?ZHBOdVMrVUMrdFZvZmlXbkxrUWVwMXhma3gycTE1Tnhsd3NIbDVOZmpJWmRy?=
 =?utf-8?B?MU8wZXZndk1KOEM5WjVQRlZoQ2d1c0d6NldvTlJyQnhOQ01yVDlNQmdSbkF2?=
 =?utf-8?B?VVRmMWhOOHM2OC95K1NpRGVSM3dockxsRmFqak1VSU84bEl4a2E5WXlBRUl1?=
 =?utf-8?B?K0tzclFnbHg4bUFNSm1FR2htY29aQ254Smw0bHhPdjkyNEk2bU4yRjhnZzFO?=
 =?utf-8?B?VFM3U0RZSkxPaGkrZ2FTMVlHdElBNkRBV2xSVjhDUTRZUlBqMERjYU9kUHQ5?=
 =?utf-8?B?aXgvaGRYdCtObmZaS2JmUzR4b1pzbVB2K3BHYWxOaUFsV3c5VkFmZDRtNHNX?=
 =?utf-8?B?T1J1SDhuTSsvdlFMb0hlV3NWbGs2UzlPM1U3VG5NS3VyUFh2OVAwWlpRc1My?=
 =?utf-8?B?Vm1CR3l3djFEeStua3ZUM0ZUbUpKdUFWMW1EU0lyT1NHRzNPTHpnamU0NnJz?=
 =?utf-8?B?YWYrMUtialBlVGdSZmpaVjd4RHRuaGhheFh5VjMvaFFuWFBzQW1aRVJ2alQr?=
 =?utf-8?B?Z2ZsdGtRL0g0akZqVG9BeGZOaXpscnMxa0lPaTJFOS9zM05HYVRUUktaV25z?=
 =?utf-8?B?RlNtOXdKZm9NS2Z5eWpGMDYxbnV3c3hsN0xHbG54cEQxUERZTy8rVENHYm9Y?=
 =?utf-8?B?Zmw3TzB4TTRaUXFMZFdpMlhaeEtnQ1lpY3BvZ1ZubDdKU2k5OGNscnRMZjF1?=
 =?utf-8?B?empXbU5XeC9OVUkrUG8rYml4TVZyL0pGZ0lqdU55dGdGVTk1cktKZ0trWGJN?=
 =?utf-8?B?eThvYVJFRURBZE5zcUIreUY3SWVkVlN0TXhDZEI4WVpvZXVQYTMwbndaSEhu?=
 =?utf-8?B?VjhSbi9RZXNUYmsrblhXbXpjdldBWFIvOEtBMDMxTERzc3Byci9UT0VYdXhH?=
 =?utf-8?B?RzE5b1pwU2RDaHp6SG82Vk1YYkxCVDhGVFhXbktReUJRb2dEdm1vL1lLUUt0?=
 =?utf-8?B?dW9QeG9lS3ZDa29hdFA2ZHRvSFE0K0tTTTFkQWFqK2JabUhyZTVYM2N4TmFV?=
 =?utf-8?B?VG9MdTBUSEV0S045eUVxSHljR21NSTBQbGcyVVVtcFB3Q0EzbUR6VW1MSGVp?=
 =?utf-8?B?R2xRS3Y3eWRLdVFBRkZadE1obnh5U1FCNUNCZ3FGY1kyV25iSEtrYng3RGhh?=
 =?utf-8?Q?WSaduE7vES+RlWYFE9bHw0ANA?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c010cef2-f598-40c0-c46b-08de001f5f01
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:46:27.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEc38emNt+C4xcBefF5T+JUnR34D8CUVWU4dwGxJdVA2v/r/Hj+n3UoCW4/j+AwoIpuFaFu0toJHyE/t92vnrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7899

On Mon, Sep 29, 2025 at 05:59:00PM +0200, Oleksii Kurochko wrote:
> 
> On 9/29/25 10:41 AM, Roger Pau Monne wrote:
> > I've had the luck to come across a PCI card that exposes a MSI-X capability
> > where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> > 
> > This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> > still use the address of such empty BAR (0) and attempt to crave a hole in
> > the p2m.  This leads to errors like the one below being reported by Xen:
> > 
> > d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> > 
> > And the device left unable to enable memory decoding due to the failure
> > reported by vpci_make_msix_hole().
> > 
> > Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> > tables are usable.  This requires checking that the BIR points to a
> > non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> > target BAR.
> > 
> > This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> > EPYC 9965 processors.  The broken device is:
> > 
> > 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> > 
> > There are multiple of those integrated controllers in the system, all
> > broken in the same way.
> > 
> > Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> > ---
> > Cc: Stewart Hildebrand<stewart.hildebrand@amd.com>
> > Cc: Jan Beulich<jbeulich@suse.com>
> > Cc: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> > 
> > While not strictly a bugfix, I consider this a worthy improvement so that
> > PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> > capabilities.
> 
> Based on your commit description it looks like a bug as without it, for example,
> SATA controller can't be used, right?
> 
> >   Hence I think this change should be considered for inclusion
> > into 4.21.  There a risk of regressing on hardware that was already working
> > with PVH, but given enough testing that should be minimal.
> 
> We have some PVH tests in Xen’s GitLab CI, but I assume that isn’t enough?

It's a very specific controller, which we don't seem to have any
examples of in the lab.  The model is in the commit message.  Without
this fix the device doesn't work as expected when used in PVH dom0
mode.

Regards, Roger.

