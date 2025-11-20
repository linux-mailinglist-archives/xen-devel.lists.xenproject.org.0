Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95354C7357C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166701.1493168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RB-0002h6-7O; Thu, 20 Nov 2025 09:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166701.1493168; Thu, 20 Nov 2025 09:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RB-0002en-3z; Thu, 20 Nov 2025 09:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1166701;
 Thu, 20 Nov 2025 09:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1R9-0002R9-LU
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:58:47 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80f85a0f-c5f7-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 10:58:47 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:58:44 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:58:44 +0000
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
X-Inumbo-ID: 80f85a0f-c5f7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqMhh844RdtmUu5fOweq58Qb3kdj+fWULaQ3h0RMDJa5D0JAVWveOsLP7trJXysIVxln/GNyzLrO8UpwxkghG5vkXfIhIj4BCg+91y5HyhLGN4ZdQiJKya6kxGmjKG0aaRcbk7hw/JIV5dNdl/HXJq6VOMrGNWmM2k34wdaDYQMMHZ03Ym6OpzUullpEv04YRjHTKqQCvfT2iPZ0yvxLJ1rv8PQRzLJPabBGQNdq24p3xlP24KN6SI/PAbsH02jctMh7U088wPrSQLbk8SqFkbFcb/8VKP6wFdmJwlIK9GInLCDpnag6J3Tf8Hg3CuZLhfyTSGRELLutMeybkSdnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xklGVyUP9Zbd32cAuMG1njcB45nfMfGCMSsOi+HLzMI=;
 b=a+MSR4QgI2Jyhm7IjQGnX6DEM5KIO7u0KFC1Qb/RDiboehjD6ZzYB02Y+H0w53OcM/lIOwA6Hk5DeewWXLkmrifgCZdEK6C9cASrpu87ZmUmjYZTMy43Fnf+umUyScOcRHOoPFlKr+YCsH4cqdRZ4tNtQy2I7B9oG41Sz/QmE/50YWXOl6K8DiaN8HL+y+6NqYk1yux3kHV8B5N0ChsyxwZIC31gJcn9y8VYpxslQakCcNVUd2NL+IJW3cuxVio6CjDEZ2FjhZVpcMN+B3Sn7TDxNh29uEvB4T3SX9syFRIf9eox4WQOIOL3xx5zVYahbK2/2xIE7ZiZRz2Qo4NJzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xklGVyUP9Zbd32cAuMG1njcB45nfMfGCMSsOi+HLzMI=;
 b=sAdkNYqdGDdz8HDNFm6MIXmim/phShMHtc8O92MFugxjuh6yP779he6Patnow9nwOxjioXJHirITniydTqLodnaGjIBzWvtqFSigFs+nq+f14fQQpQueOBylPlzx1o/QetXqFeBfJ3B9FCaSeaCOZ37bj2KnNU6wJTBVTrV0wa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 07/12] x86/io-apic: fix usage of setup_ioapic_dest()
Date: Thu, 20 Nov 2025 10:58:21 +0100
Message-ID: <20251120095826.25782-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b34615-fd56-4112-adcc-08de281b6461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWwyWWRRU1kzaWIvNjB4TWNzVDA1azRJQkovSExKM0ZSYStJcHl1TllLYTNt?=
 =?utf-8?B?U29zOVdWR3huRnhrWWp4S3lLOHo0MFRVOUVVZUVvN0FhNDJIK3VRNzR5TExD?=
 =?utf-8?B?dHhMUEdGVkFjclhPOEFPTkFwTmV5MENxNXUvdGhVblA5c2lRZXNNWlg1M0pO?=
 =?utf-8?B?Sk82a0JtSmpFc0EwSTR5d3hNWTdmKzcrU293YWZSblBCS1NUWXF2S1ZlNk16?=
 =?utf-8?B?K0h2K2xhelFSOEE2N2tqcDhHK2hHbGVCb2VqU2dSc2ZDRzBXWk1PN3RZcVph?=
 =?utf-8?B?VlpINUs2V2g0NmVzdnQrMmhkeEtPZGVNbmwvTUtPK2lBYTQybTRnQm9sTHNl?=
 =?utf-8?B?a0V3Y1Iyc1UyWFBTMkExb0w2UjFDYWVqcEU5U0p6S1BNOG9TVHZpOUJqbWZ5?=
 =?utf-8?B?RmNjREVRNnRGME5KM21hY3Jac2ZoQ1NPVzhiOWxhRi81ZUQyOEZtb0tXOEZk?=
 =?utf-8?B?YnhGcFI3Ly8vKzlZNFo3MTVaM1RtVFpnYVdKS1ZsckNIZUV1ODFBR3VtYjBr?=
 =?utf-8?B?VmRvU3JTTDNvZzFReHU3dzRnUGxIeFJVZzZCNFNmWUtXZ2lCcUlXcGpRQUNa?=
 =?utf-8?B?OHNiU0FFV2JvU0tWOS9kL25kY3VKVE43d3NrZVZwODluV05vUHdIZmNTR3Jl?=
 =?utf-8?B?bHA0akI5Zk1qaG9UU2JoTzZaRXFveW1wOXptZnBOVkdPOHNEZ0NvR1kwVmtC?=
 =?utf-8?B?Z21BeVpBdFpZQzlIM0szMm96aTFZZldjM1RYdHVxQWpLZ1A2YmtIeEVmMU85?=
 =?utf-8?B?ZjJnbTBVR0V0Ukcrc3lVYldyUUR3clI1QzlsRThIYk85YnZvdndVUFgrenJT?=
 =?utf-8?B?SHdaRzBVcS83VWFIMDN3dWRnYVk1b24weHJvdVhvcW16eTdxYnBCekhnUDZB?=
 =?utf-8?B?VkV6VCt0VzBKcDNuVlM0b0M4YjlUWnV6cmRyV0hlR1NlLytDWi9wZEYxL2Fa?=
 =?utf-8?B?NzhRNE9lQ1pZbG56ZVU0STBIa21tQTJWbWE3MzV2VVlJS1B0d3c1NUFyNmtF?=
 =?utf-8?B?ZW4rSm51eWFLSjJadDdTVXY5d2lVMFdPVjlqMC9wUmh1a0swY1RzQjIyMGF0?=
 =?utf-8?B?d0hXMlY3Wko1QTI5eEh5NXl1RDJkWitRbFhuWHlwQThvVW1UaTNKUmhQbjJo?=
 =?utf-8?B?TGtETmZzVUJhNkRZcEhXdkpodEtIN09vMldCVXdGc05JbkdvMDdqMzNKb2RR?=
 =?utf-8?B?ZHJGVmFRcERUWW5DTXlDbEJiYnZFRm5SdlYvWVhtTnNXVDhyWVhIRDFuaFRy?=
 =?utf-8?B?NXlCY1NmeXptemMzYWxyM20xdzZQd2NBcWVxbUp3TXJyK0kzTW5UMVZlZm1k?=
 =?utf-8?B?NG5YOHlkOFMrclZEM2FQYzBYZ05oTmpjMEQxOFIzaG84a1krVmFDajZYVlJE?=
 =?utf-8?B?QkxQcFp0SXR4Yy9UZ0xjZDJUMFUvRVV1MEdFK0hLQklEcGFka1BUYWo5RTly?=
 =?utf-8?B?VFJrWGZCVFkwdHJneGQrbDBCTElpNy93aU1aUDNoOUNrMDZHU2p1K2h3WUZs?=
 =?utf-8?B?c2VpYU8va05ESGYyMzVtYjZscnE4WWsyMjdod0oxS1ZCU3g3Y2lkSTA1ODJl?=
 =?utf-8?B?TXlnSTN1bnI4a2JZcENJb2syaWJtUE54SE52dTNac2toNXRxMzV2c0VaajV3?=
 =?utf-8?B?Z1hCa2hRQjdFbDJaa2wyTDlKYkxPOURQQVBDTHRvOU1UTHlmSnNQenNUckxQ?=
 =?utf-8?B?RDdNTFBGZkNaS0pNMTBJZFRMdVBSWlFpZzVidHR0ekxZWG02Z0RDNEk1SFc0?=
 =?utf-8?B?MDRhVmdnNTZ0ZnduRjdKZW9wYmZ4Q0g2ZkpwR3ZWaGwwRG94eXRkenUyM3hS?=
 =?utf-8?B?OHdOUHpEQTZSNFFMTDNCWC8rT2Y0SzVvU3lvWXlmNUpUcE9OYmxMVWdFVzNK?=
 =?utf-8?B?MExBSHpjeS9uREpZMVFDRzhHajdOd0lLTU54b2xhbkp1V3dQWXp2ajl2MTdZ?=
 =?utf-8?Q?1XPbIHxPzwWxJnVnY1LQXSIKZJ2a3+5C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhnZ0w2TGt0UmEwam5TV3R3SExSTFZ1YUVFalgrbFh0SGxheG9IMlk2enRR?=
 =?utf-8?B?OGJFNVk2Zmk2MlNrVUIzM1FMNDc0eDBJQmJ2b244ekNMQXIrakNEcVhoTzBF?=
 =?utf-8?B?dEs2bXNNSXQ2enBoaGFVQ3NVRWdqa0dTOWJTNFZnR1ZrN1JGQlFMaHBVa0Zp?=
 =?utf-8?B?RXRkNlJzb0h2VHdZTEhBaUs4ckRxalJRbTdxVkNxcjN6MWRqNEt2L2dsUGgw?=
 =?utf-8?B?dGY3MG96OXJsN2QwYnNaM0JSYkdSMFU5Q0ZqWEtoSUVMMDYrYXRPMDJPNWJx?=
 =?utf-8?B?SExTc1JIUmtaUS9oWEg1ZDZyNUNyWnhvaXo5T3JMQkxPdTc2c0JqNnBWRVZU?=
 =?utf-8?B?N1NuOHJva3pBc0pJY0M0SWhXUldTRHppbWVjVWxZL3lLRy9QUS9nbmRhVDZ0?=
 =?utf-8?B?SjBSV1RSVzBVV3hmSDNaNUxBemhPTFN2RzFqM20vTGx6ZjRlSlN6M2dQdHcr?=
 =?utf-8?B?K0F1Ykd3dEkrU3grTVg0TlZ6VUFPdDZZSHF0eThEak9jWWs3ZTlBYXJLUFc2?=
 =?utf-8?B?SngrZ0hyZytpdjJhbUN3YXZTUTdMOS82Q2hDQkxoczlmdS94M2pBWktYbEVJ?=
 =?utf-8?B?QkhqdlBGcElNbC9YVldGNXRid2MxdEtmOFl6TXZXTWlnVTB0WjgrWFdZUU4r?=
 =?utf-8?B?UndHVkJkVkYwNnYyREhBYU9sVFY4aS9NRmlqTkpWeE9UMTU1V2tDK0xKV245?=
 =?utf-8?B?Y01WNVJoMG84YnVuUGZGaVZxc0FJVU9nN0ZqNndEb0lEeFNvUHpxTG9aUzE4?=
 =?utf-8?B?VUhLVWNVNGZYYzdQVmxoNFVPWDNTUU9FYkR1ZUdtZERBdU1wVmlLbUo5bklH?=
 =?utf-8?B?OWhzNU5pL2dMOVVYYkJOaEh6U1B2TTVhM2s0MmkyaGczM3MvVk5mKzRUcHVE?=
 =?utf-8?B?cDB3YjgyS0g3U0Q4ckkrd09JdTQyakVHajJ3RGIrMjFncGNJd2VMc2RzSUo4?=
 =?utf-8?B?QUFlUWF5YVZzRDEySkRhK1dmaUZGakJybGpUd1ExbEZnN2ttbWRnZTQ0ZER5?=
 =?utf-8?B?S2szTGRPU2tINm1ycVdDcVRFdTVLVXU3Rkt2ZHVxQ01kTDBRU2tsZEFDemNM?=
 =?utf-8?B?TWJZWnp4UjJZK0xCSnB5SXRuQTJVQmgvZFdSUGp5clVreHFVcWRSdUkydWtJ?=
 =?utf-8?B?NU1QdlZ1U2huSjFpM3ZGdmxXMnp4TEhrSVE1Nisxci9uMXU2S3plZ3hmYW5t?=
 =?utf-8?B?MW9NVVFJZHNUdzVVbEJBdDB4NXhFYzhIeU1SeVF3bVNkZFFwQXRTeS94cm5U?=
 =?utf-8?B?M3IrUzZVU2xUMy9KbUoveVVweW9DbGNKN1NldnVESENoSHNiQzNNTUJIVFZi?=
 =?utf-8?B?aGMvM0x6TWJYUVBTc2ZERitFTURNWGV4SEYyYUE2VnlMWmNVdXFDTEdWaS9p?=
 =?utf-8?B?d0pQUkJuNk5pb0pMYWRNMzFWWkNBMDdxcTVMekpaVEJRUk00Vk10clV3bHhr?=
 =?utf-8?B?NncyWW40bU1UMzM5bE5qTnNGVlVLYmlnZmtwMmV5Y2RnZDk4VW5GamtsZW8y?=
 =?utf-8?B?dU0wb3Jnc3RpUEczdFhiVUJwdlQ0bW9aRytRSy9yVzBETm5ETnpVK05LQTdJ?=
 =?utf-8?B?NmQxcWpNdnhyVWJRek51YjlET0pUYkpWSFlmMEhuSEFQcEJXL0dBSW9JY0Ez?=
 =?utf-8?B?QmdnVkVKcjlmV1hiVXRjOUU1OE1sRW5GaVN1VndvQjIzZW9senZYVXFVcnlX?=
 =?utf-8?B?U1kySWNkNlI4RmhOUnJuejZscjRrcGFmSGUwekVUbUtuZkI0T0dVMFU5eG5r?=
 =?utf-8?B?OWh0U3c3bkoxK1NyUHZwcTJPb29DZ2p0M2Y3Y2xLYnV3Kzk3MEE3NDdRS3pX?=
 =?utf-8?B?bjBTNVFSVGd2TGxRNUNMdUdHTVZDWXByMTdyN2ZCSG9KMHhSQm5DdGJ0R2o0?=
 =?utf-8?B?ZU1Wb05RTlg5TnNMTDF5RDBpZEU1QjBnTndyZ3VHUDc1VXI5QStkam9uVitu?=
 =?utf-8?B?anNPUDE5ZXM3aGozN011NW1RUUVyeW1WQkRybXZ4OHJhZzQ3eGxFcUhEMHdI?=
 =?utf-8?B?dC9jdGE2aitoaUJsNzJqSSt4VlNSTkRtUGFYc3R2MWtibVVleU1ZNGIxODNt?=
 =?utf-8?B?VWI3NytQTHhZa3NsS2kzdzZkMlNyT1FCRDdVUDlmVkUwY0hqRFVtc0wreWVG?=
 =?utf-8?Q?7p/HHwMkkh8F5Ve/QV5NieQ+j?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b34615-fd56-4112-adcc-08de281b6461
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:58:44.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6R1i3bhCXDKTIGQUTZ4/ISUctpxO/LE4owl1kpgzcMCZ2RJcLiv4mzYPEDeMfRsl9pWUrq4/B9zWxmiBc2ofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

Attempt to clarify the purpose of setup_ioapic_dest(), as the comment ahead
of it is outdated, and looks to be a verbatim copy from Linux from one of
the code imports.

The function serves two purposes: shuffling the interrupts across CPUs
after SMP bringup or re-assigning all interrupts to CPU#0 if no IRQ
balancing is set at run time.  However the function won't perform any of
those functions correctly, as it was unconditionally using
desc->arch.cpu_mask as the target CPU mask for interrupts (which is the
current target anyway).

Fix by adding a new `shuffle` parameter that's used to signal whether the
function is intended to balance interrupts across CPUs, or to re-assign all
interrupts to the BSP.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I couldn't find a specific Fixes tag to use here, I think this has been
broken all along.
---
 xen/arch/x86/include/asm/irq.h    |  2 +-
 xen/arch/x86/io_apic.c            | 13 +++++++------
 xen/arch/x86/platform_hypercall.c |  2 +-
 xen/arch/x86/smpboot.c            |  3 ++-
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 7315150b66b4..df7b48c8653e 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -137,7 +137,7 @@ int i8259A_resume(void);
 void enable_IO_APIC(void);
 void setup_IO_APIC(void);
 void disable_IO_APIC(void);
-void setup_ioapic_dest(void);
+void setup_ioapic_dest(bool shuffle);
 vmask_t *io_apic_get_used_vector_map(unsigned int irq);
 
 extern unsigned int io_apic_irqs;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 3c59bf0e15da..19960d291c47 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -717,12 +717,14 @@ static int __init find_isa_irq_apic(int irq, int type)
 static int pin_2_irq(int idx, int apic, int pin);
 
 /*
- * This function currently is only a helper for the i386 smp boot process where 
- * we need to reprogram the ioredtbls to cater for the cpus which have come online
- * so mask in all cases should simply be TARGET_CPUS
+ * This function serves two different purposes: shuffling the IO-APIC
+ * interrupts across CPUs after SMP bringup, or re-assigning all interrupts to
+ * the BSP if IRQ balancing is disabled at runtime.  Such functional
+ * distinction is signaled by the `shuffle` parameter.
  */
-void /*__init*/ setup_ioapic_dest(void)
+void setup_ioapic_dest(bool shuffle)
 {
+    const cpumask_t *mask = shuffle ? TARGET_CPUS : cpumask_of(0);
     int pin, ioapic, irq, irq_entry;
 
     if (skip_ioapic_setup)
@@ -740,8 +742,7 @@ void /*__init*/ setup_ioapic_dest(void)
             desc = irq_to_desc(irq);
 
             spin_lock_irqsave(&desc->lock, flags);
-            BUG_ON(!cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map));
-            set_ioapic_affinity_irq(desc, desc->arch.cpu_mask);
+            set_ioapic_affinity_irq(desc, mask);
             spin_unlock_irqrestore(&desc->lock, flags);
         }
     }
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b602..22fd65a6aa7e 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -337,7 +337,7 @@ ret_t do_platform_op(
         case QUIRK_NOIRQBALANCING:
             printk("Platform quirk -- Disabling IRQ balancing/affinity.\n");
             opt_noirqbalance = 1;
-            setup_ioapic_dest();
+            setup_ioapic_dest(false);
             break;
         case QUIRK_IOAPIC_BAD_REGSEL:
             dprintk(XENLOG_WARNING,
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 69cc9bbc6e2c..55ea62d7d67f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1433,7 +1433,8 @@ void __init smp_cpus_done(void)
         check_nmi_watchdog();
     }
 
-    setup_ioapic_dest();
+    if ( !opt_noirqbalance )
+        setup_ioapic_dest(true);
 
     mtrr_save_state();
     mtrr_aps_sync_end();
-- 
2.51.0


