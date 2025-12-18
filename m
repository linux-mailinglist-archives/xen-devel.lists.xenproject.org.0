Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D278DCCCB4A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 17:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189912.1510637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGk4-0000D8-3O; Thu, 18 Dec 2025 16:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189912.1510637; Thu, 18 Dec 2025 16:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGk4-0000B8-0J; Thu, 18 Dec 2025 16:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1189912;
 Thu, 18 Dec 2025 16:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ars1=6Y=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vWGk2-0008DO-KH
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 16:20:38 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a66b26f-dc2d-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 17:20:33 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by VI0PR03MB10250.eurprd03.prod.outlook.com (2603:10a6:800:20d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 16:20:30 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 16:20:30 +0000
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
X-Inumbo-ID: 7a66b26f-dc2d-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynosVvYMuzmwWQ+7A7e7bG+//wVbik6ZkCzV8LDjZSHAZfupknLkgxIkuUychow+lVHzewNn+q2cBytOGN3dwdGdogTD8C5XS9/XizGwF2vRzsCtDh7zsUmyU8uFuml+M4mxU4pGzbAICnFFuCSVk/GXHeG/ptod/+WsQSBgUM2fcTRQaZMRQzdbNjXjf67+BEPaJ15asJEqXhElTqmWpT7pf0fTaJijamKjaN1LWVIHe2ryK9zeF09zFNqtr0wl+ToMAYJXgBoWPiOkuBnpn4h0MjyVKi6SPTFTHqhZfO7cClQxcVO46OEe9YfBKiDlUblktJlKPB+dHifsmP97Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mU+n96SrXtJXz77KEd5uU3Rpb30fbUbKR/2UQQkKB0=;
 b=kIx2llwA8i0VD77i25AIgOwBDeZbie6lPeq8LG+qWMPxBgcyAvtpcD5yTBbkuOs8wJTuRPCs6BM8LDgaqMRW03H/2sXwj9OSiSbH4PT4pMNwpdEkKbrMHsZez8Jq+SivFwj9CZGoHzFc0NOngeVcGFWfQvUU20YZ/66KqpNOrwFBKXB8N17juuYuOYWwiXsnAIrFvHc7/VWcMsXr96Qi4FB45ho/F0fW29GubAYCnXnfZuAkYipwYlk1hTlf3Eh8g5kyYazVCb/TUUVxViYjkIusEYXLvKm5KbdPAqCTagLDy1xQ3T57a9n/xbJiyDZt9uusJoS3Z/iR6tSkF8/a2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mU+n96SrXtJXz77KEd5uU3Rpb30fbUbKR/2UQQkKB0=;
 b=AwL2f2IgMlYefgSrB/AXGuOKzIz7FBw6Tme74gaAAjOrcChOlxJ7bwGnNerzA11yN6AeXFUxE1Hv55YFWz/HNmoQoWRdfI39BmUnQFUDf+CrqC6qujmKZwAo/DTVmEB1XdyMFHeT5S4srfWhZ5SG0dz+zhM5NhPlkeOdw2iGWmvDQkTxRlmWZX1ydOhnCRi+w2syL6nQ4ku5/NeRNXajfyI8OZJxlI0Ts42AQ1YN5N0LQeb9tCnkb74741EWRNqwrFmJ3ShqS4XNPwgms6QBgDsuG8pDK1Ny2o6VTxsEgEiH68HatAifJAM6IeCaKghcG/4zOk6Fqpsk56q0hzLGkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a4646368-2c91-4d57-846f-e7de51395627@epam.com>
Date: Thu, 18 Dec 2025 18:20:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 0/4] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|VI0PR03MB10250:EE_
X-MS-Office365-Filtering-Correlation-Id: 055195f7-db9b-4270-e7a8-08de3e515cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2kvVGx5RnJQbWh3enM3UWFwNWRGWDI2eDh5bmppS3BoaWE0SEtEcDFablJJ?=
 =?utf-8?B?QlRoVFdQT2VrL2luTFo2aEpFdDVRMWJtY3hhbTFhVFF3blh2UXVaTnFzTmZi?=
 =?utf-8?B?ZExiSUZzYTlBM25vaVdOakRIVkMxQU5LVnJTODVRNzQ1TGsvUnZuU3hRV3dj?=
 =?utf-8?B?ek5ETWRROWVHODFYbng5a1JLaUJwR2VDeDhvTlovaHhPc0VtLzJLM3BZL1k3?=
 =?utf-8?B?NGJnSEQ3MWFISDRCREtsSWlMVktlK2hBTmpubmhHbUg3UUR4c2R3aWg0Tkw5?=
 =?utf-8?B?S0tTbGpZSmVtM0xxMTFNSldhRG9ocXJKMVFFMVBtdnZZcXFLWmNRbEVicEpv?=
 =?utf-8?B?RFZuNEZ3VFB6QWxrK2M3cjRLZWRkMFRWZjRFR3NvWmxLTUxRQ3VNSEFDS05a?=
 =?utf-8?B?ZjZSZ2E3TU1iYlhYMDFZUzhpQ0NraUpESjZBRm8ySHUvNHFEU2ZRZWxaOUk2?=
 =?utf-8?B?ak5Nak9DNnUzVmlRVmtTVFhiQmNXTTVaRHEzYlVxTFdLMXZjcTJOVnRxUGNh?=
 =?utf-8?B?Y3RZTEE2ejdLVElGUnRQSjZ5U1M5bVQyZ09oWCtpdkFBZStoMUhIYnFWbGlC?=
 =?utf-8?B?QjZ1cFA5YjhOVk53UTBkbGxqTHNqeW9WY0FDdkRLdzVwL1NUVk1lVUZNUmtX?=
 =?utf-8?B?OXBNWmhXYml4b0taVHZuTElpa1dtNG9FZ2JDaUNSaHBhZmlzR1VOQ2IybTg3?=
 =?utf-8?B?MktBWnFHTmh1WEd6TEhkR1FMU0xacFlQbWROUFdzeUtOdHd4OXZuM090YVln?=
 =?utf-8?B?eGg5MEVwUmx6YnZ2R2NKZ3FHOEFvQk9zM3NrcXJMbjQrSXk1WkkybnV2bXgy?=
 =?utf-8?B?bHRyL0lmQTR5OSsxY1BWTmZEV1Nxc1JDcC9GZ3BGK21lcm0ydTQvV3lZbGFs?=
 =?utf-8?B?MHloaHpDcCt1SmJNUHZDS0VuWmg3R2w1K3NSdEdYdW1ZMzJJUDVTNmY1VmFo?=
 =?utf-8?B?WWtlSld6ZzEzb0diLy81OFBRdDNlQkVGNlBCUzhud2s2SG9DYzAwOXRCNThi?=
 =?utf-8?B?YVJUYWE2T3Y2bVlMR1dvUjZWNlB1OXdkRk15ZmJBUmwyc2ZKaXI5MDBLMlpn?=
 =?utf-8?B?SGFMYk9Ha1UvVHJSRC9jdStSckRENDdkdFFpTmZyQzdMNjJmK3RiRU44OExF?=
 =?utf-8?B?aVh2UnB2M1pHUENGT1poL2t4NGpCSVlscUVJaHlCL1d4cmFuK3VnMWZhdWVt?=
 =?utf-8?B?T1B3aE4vV1BKOExsemN4Ull5SlN1cVJtUERJWmVjdHpzZ0thWmJZVHRXRjhR?=
 =?utf-8?B?RzRTdjBlR1hBeC9xVmsyZnRCbnBSNnpVWGVNTXJnQmhjRjlSditGNk5JeWJk?=
 =?utf-8?B?WjJtUm1tQnBtYVAwb1hEQkhqY0VzSm83UmpNem5mY01CNFd6ZVlBVXl1K1Bm?=
 =?utf-8?B?Nk11UVR2ZEJubUdrbmxSeEpCODBGbC9UaXkrbXl4Qk9xUVZ1VERmNEwvTmE3?=
 =?utf-8?B?Yys2eEI1RXBCcXp1TXcydGVCdFV5TFVMZmVhbEF5UE51c1VUenM0aHdpb0Jk?=
 =?utf-8?B?RFA0ZDEyVmpWaHBjeGFEajZnVmFrNm5oSjdOYWh6MWR4MlRZOThMVk5jUXVV?=
 =?utf-8?B?eEZZOW1JQUF6TUp5Z3NOc0ZwdnNGUFE1UU4vaXFyVm5XSHZHWjFsN0VhL3Na?=
 =?utf-8?B?N0Rkb2E5SS9xdjZmN0V4SmNxbDRpYW5oUDNUaTZoWnB1Mmh2MnhrWUVjWXJu?=
 =?utf-8?B?QWpTRmdDbDVZdVZGS3J6aDNqd0ZycDhUSzZwZUFWaHEzeis1ZHRyT1VjMldh?=
 =?utf-8?B?WGNQeTY4U2RTb2tFZ1E0Y0g1a1p0dG0rNDVCMFl0L3hxZHRvWnVQSGpybitU?=
 =?utf-8?B?Uk9BZzUyRGUwOWx6eXMwS29ncWRDdlRpVVh6czlZd2JQc2dPNHpyZXNZK21p?=
 =?utf-8?B?ZHFRRDF0N08velQ0Y2EreWJicHZHVFI4NFJvdHRWdERIOENjellnUVB0bEpJ?=
 =?utf-8?B?ZE8xVFVvbENLcE1lbEN3c0loSXpmeUl0ZUk0WDVaUk5BYmlHVi9oWTFqMUxO?=
 =?utf-8?B?OGRDRkUycXRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzVheVVITEorWEtKMHRIQWtpS0NXTnJCbmVnZmJkcVJsV1NlbW94R2lzL1c1?=
 =?utf-8?B?SVAyRWpKRGxObEx4Y3VNZzVSRlhhQ0NSMHhCRzdOdWV5MDkzb0lZMHk0dlA2?=
 =?utf-8?B?QXJ4eDgrRUlVdU5hUnVnRGpCK2s4bjF6QlMwa1ZnVFpuSkp0Q3BwQVpGdjhm?=
 =?utf-8?B?RVdOZEZ5b1BjNHhxOW9OaWdnOHVmNU5LV1NMcXJPQTFQWEZyQ2h6NEhJRlpR?=
 =?utf-8?B?TWdKZnNqY3NhMm9KWEhjc0VsQjNwb3NpSS9xNGRucFRndUJPUlJ5LzBSNkNH?=
 =?utf-8?B?QmNCemZKNnlNMzNBb09HTXF6b1VPWVlHTU1uR3VpZVlQOUl5Sm9nWG5yN3dZ?=
 =?utf-8?B?U2dpOHEwNmEwd3JpcTREbGF5M3drSlExQjhFYjBJVEU3SW95b2V0VGwrWU9B?=
 =?utf-8?B?TEhkQysvQVVkblpJNFY2MS9JV2o2VHFEV2p1aFgrN005QlVxaEZIUVlFRHQv?=
 =?utf-8?B?YitXQ3ZEc3dueURhd3VSNFNvQ1JQVVhMU0dQNS9vNFd1QW5KMEZUcXZtbCts?=
 =?utf-8?B?eENQWUFzWjFRTGNLS3hQWUFVN0NQQXJ2dXZaZDdjUy83VTRvbjJiVVpSRDVk?=
 =?utf-8?B?T09BLytHN2RaSCtqa3cxNVNtZUpYM0YyRTkxVDNHZGUzUHFpZTR0R1JkYVh4?=
 =?utf-8?B?dExHZWJvYVYzdUpCRUxsSGJkRExwWXFpWk1ac2tGQTVnV3hxZlg3V1VXUXE4?=
 =?utf-8?B?VFJUeEhiVWFGU0ZEM2hVTzdTVmxkeEVncndmM1BZZElvQ3o3a1ByQUM0WjJj?=
 =?utf-8?B?WlpKS08yMTNYQmJLMFpLOUlLMGFIMTA3WjNMcDViSFVyZFhTN3JiWUYzWVF0?=
 =?utf-8?B?ek5tOTF1K0VPR0hYSnJNMndrRk1wVWRDeEZzT0F2Uk5FVDAwcXFKSE56WDVP?=
 =?utf-8?B?cUR4dERDUXVMNHhsMFlRRFhaSUdCQ3NVQUZiRlBXUUZNeVBaNDRjMXVTOHVN?=
 =?utf-8?B?TWRqaHdMREtCUFdLcFhiZjc0RDZSL21kYWRMYnFaR2NnT1Exekdzd2FveGpG?=
 =?utf-8?B?QkszUDNjcUNkVnptbDJ1WERBRVlqWmRSR1VXdDRCU1VuM2VYMkYrS21xNk9i?=
 =?utf-8?B?MmRYa0dSd2s2citNQmhtcUFsVUJxcUVxMVBaTysyWUYweTJTUzh3enNXZHZa?=
 =?utf-8?B?T3lnK2E1c0I3WGJiQlZ3c0ZoQmhCLzBmdVJMejcyY3BKRE1TRjR2YkxORXZH?=
 =?utf-8?B?eWcrNDNlWnJPc044YlkyZFJORnZqMFArb3dQMU9OVjJqK2x3MkZSNlh4clFG?=
 =?utf-8?B?Z2NLVjJueG5rdDNvQzNuTEJuVG1rM2ZJZ0hTZkJmclJlMTBqYkR1MVZpdURi?=
 =?utf-8?B?NWw2Uzl0V1BudS9VM0xXZ0E3QXZlYUhPenRGWDBWbHBKNzR2RkEzZWdPS3M5?=
 =?utf-8?B?bXZHZk9VTG1zbzJlUm04Q1BvdlZESE16eXd6KzJLeDBiS1lVRThhKzdiTzFV?=
 =?utf-8?B?VE42YU5Ca0ZHQk1RbWloclFOa0xDSzJlVVRIMXovR0RNZjFicElic2Y4dFpH?=
 =?utf-8?B?U3g3ZUYvcDBvTVRTa3RoeEJpTHkwTVZ3U1hyY2RaZGk4TGNiaVBnZzdjMTZG?=
 =?utf-8?B?NkdjNVNMdVVNY29OQjZseEpTVExYSVp3dWhtcUlDVlVUcjRUS0JWYXBwN21v?=
 =?utf-8?B?ekVTclk3YVUyL3g1dXJKNEtBajZxYmRHdzIySGl2S3J2MFVQeWlNY3BKTENK?=
 =?utf-8?B?Y2I2STNybFRHRUU2dXRmaDNQWjBNdDczMm5Ob3M2VXpxdkpINVpiU2hMQzNE?=
 =?utf-8?B?RW5nN3JBS0N1MW9rWHpOc3E0SHhCbks5ZDFqL3F5Rnl6SEdqRElTRlhWS2Q0?=
 =?utf-8?B?eXNuNE04ck03U1ZLUkp6K3gyWmpYcmpEOERFTlp1d3RvQk1iTDZWckYrODFR?=
 =?utf-8?B?SnJDcytCbjhET0dFUllBdDVkdzdxWXF4TjVyb0ZRMklJWndjQnUzSUYzU2Fl?=
 =?utf-8?B?UG1IUkszd1A1WUcrUjk2QUV0M3RjekJiRzNUNjEvbUJpVFJoeVlMVkVJRUVD?=
 =?utf-8?B?aEJuaFpBZ0tkeVA0d2xaN1REUmdFSjZtSHFVSjZkbE1jMDJrd3BUazlEWW9Q?=
 =?utf-8?B?aUN3L2Z3Zm15Qm4wQWdWeWkxQWptQ2NtaGFKdmJ2bU85Nk5sKy9JdDRpcmJi?=
 =?utf-8?B?bnl3R3EwVXgwc3dCcGJIU3JSY0Z1dUJ4eTFlT0NVUnM1RTdGMGUxM09lZlBE?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055195f7-db9b-4270-e7a8-08de3e515cd1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 16:20:30.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXZj9Ij8hEoRd8l/W2R3n3U3ibvKntAMSi3p1b1f/64wbWeD7aknLYJJEhpdgpFirVu3IFU0m5JOSYfvrfGqNUEfCF7ccsHWuDQIoE+BIMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10250

Hi All,

I'm planning to send v3 - so would be appreciated for any other comments.

On 19.11.25 21:30, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Hi
> 
> This series introduces possibility to disable 32-bit (COMPAT) interface support
> in the following case:
>        - Only PVH domains are used
>        - Guests (OS) are started by using direct Direct Kernel Boot
>        - Guests (OS) are 64-bit and Guest early boot code, which is running not
>          in 64-bit mode, does not access Xen interfaces
>          (hypercalls, shared_info, ..)
> 
> If above criterias are met the COMPAT HVM interface become unreachable and can be disabled.
> Coverage reports analyze and adding guard (debug) exceptions in hvm_hypercall/hvm_do_multicall_call
> and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for safety use-case.
> 
> Changes in v2 described in each patch:
> - patch "x86: constify has_32bit_shinfo() if !CONFIG_COMPAT" squashed in patch 2.
> 
> v1:
>   https://patchwork.kernel.org/project/xen-devel/cover/20251111175413.3540690-1-grygorii_strashko@epam.com/
> 
> Grygorii Strashko (4):
>    x86: hvm: dm: factor out compat code under ifdefs
>    x86: hvm: compat: introduce is_hcall_compat() helper
>    x86: hvm: factor out COMPAT code under ifdefs
>    x86: pvh: allow to disable 32-bit interface support
> 
>   xen/arch/x86/hvm/Kconfig          | 19 ++++++++++++++++++-
>   xen/arch/x86/hvm/dm.c             |  2 ++
>   xen/arch/x86/hvm/hvm.c            | 24 ++++++++++++++++++++----
>   xen/arch/x86/hvm/hypercall.c      | 22 +++++++++++++++++-----
>   xen/arch/x86/hypercall.c          |  6 +-----
>   xen/arch/x86/include/asm/domain.h |  9 +++++++--
>   xen/common/kernel.c               |  2 +-
>   xen/include/hypercall-defs.c      |  9 +++++++--
>   xen/include/xen/sched.h           |  9 +++++++++
>   9 files changed, 82 insertions(+), 20 deletions(-)
> 

-- 
Best regards,
-grygorii


