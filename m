Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE0C8B15D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173249.1498315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOInp-0007y1-Qk; Wed, 26 Nov 2025 16:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173249.1498315; Wed, 26 Nov 2025 16:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOInp-0007uw-Ni; Wed, 26 Nov 2025 16:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1173249;
 Wed, 26 Nov 2025 16:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOInn-0007un-SR
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:55:35 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8704e99-cae8-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:55:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6380.namprd03.prod.outlook.com (2603:10b6:303:11f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:55:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 16:55:30 +0000
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
X-Inumbo-ID: b8704e99-cae8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flxrcXx8QeLxumjQpHsKGqp/fptFV/SoWGAcuhSRwBg2YJFiuLP6ODR5p1VL8PgZPnBX6c99AtRIK4DE0CXljtjL8llW6EwmuX9BKUOMXiURT+4p+/3hfbnIoo5h9pWO2ll83jtHoZXOTJGgi9L3QHBMUZYR9I9kM7dgwFLO7DeWqqHMcNDEdM6Wl7sfDOEWdr6AwFiquG45yuTCGyrjLFEwlSFOniCFHewLQ2DEV4lTWIUZLMXJ1ijiT5pGD2QA6YhUUzVrU4MmpiCOezFxB4m0Z8Rsg8f0X4lMUX+MUas7CRt1Du4jjlQG9vH4OkKavYrrKUdUq6Gqod+Rb54CUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvZ9o7GTMcczZ38FxwOL/fBSyXS+XI9S/DZJOzyjs6g=;
 b=VEgZvrmOmyBtPmqF1TY1USUuuQzoMMrM6imVNs6pat5XJVXnPdNCgfdKDPqb2nOt7aa8wZa01noGlhtRFK2cLvoC8luPaDVxpQz3x4x2agmqFpwfREWhCjloUs6PPn1on2J2l26rK66SpQBdrtsdAi8hSFeDSwxb/EDJUK0XaQXr0CdX2JQ0qA8fLkno+TcuE7MxV8l+/8in+DzJcPiXXRjhsYi3NRz7sxQNFFF6fPiHbD8UbOkwfF7q3k2y9bzi/neisMU95hgIbjHzCP2KzsVFhjKmpuM37MLzGVK9aeEXB4ZxgijaNyLhQBNTQP5DjxMkG4z2k+iF+1EDybN7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvZ9o7GTMcczZ38FxwOL/fBSyXS+XI9S/DZJOzyjs6g=;
 b=bbIc1h59Vj7oWJXOujlmLWW3dYnL/Wf5TZYfozJ05cwL/WePUv/pqUBy7VMfcJJplswbDLhjMTuVrffB3PLNv074sYkmtJk0dchNI57JA1VUTRxdCpobkc+6eswXj9FjseDQDzd3RUuuOtnoTpb87+aKb7KMjFgsZ2RZnafPeys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f2101ed6-470c-4d6a-88dc-d2776010c346@citrix.com>
Date: Wed, 26 Nov 2025 16:55:27 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/amd: Fix race editing DE_CFG
To: Jan Beulich <jbeulich@suse.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-4-andrew.cooper3@citrix.com>
 <52fd793f-5bb1-4e14-a64c-b431b0ae83a6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <52fd793f-5bb1-4e14-a64c-b431b0ae83a6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8a9d5f-6627-4eb6-f3d5-08de2d0c9b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlhiV3pZWnk5Ym9NR2pxajV1d1J4WjZsMG8xSFpkWDFqYlFMdVFDZ0pGMW5M?=
 =?utf-8?B?OFJYMmtCS2pqMjIzWUtWNVBScmoyUDF2YitHMXkyZDZvcUY3VFdKT0VhOFNZ?=
 =?utf-8?B?dHlWc0xqN3ZmSE9KODF1a25yTndxNkllY29wUXpnY2ZsaWdNSG5jMDVPYUpP?=
 =?utf-8?B?enZwVWEzZTN0NEhRcGtKZ1cxRkxYR1JaWUQ4M3VrUVJOWll0YVRvNnZVUzNG?=
 =?utf-8?B?VDRZdzQ1dGQrVGVoUmhQZFdTaXViUVdXdlp2YVAvSzh4SDBtY2laQnJXU2VD?=
 =?utf-8?B?N3VyQXdBRzA1N1hGSU1BVWpIaXgrRU11TTlnbXA2NEZJVWdMeXRFV1BvMmhP?=
 =?utf-8?B?UE90dzRoWGxYZzBLcFdsTmZSRmJic2ROalh4eFE3OVh5RlVWY1FkYjl2aXlt?=
 =?utf-8?B?Q3c4TVF6TVJ3d3A1VjlMdmVPVlBTRDFEYlpuKzYvTS9BRmhJV0dZamRkUWR4?=
 =?utf-8?B?MTRRd1IxK2lSVDgwZXEwZmluMUQyckJyU2xLQkFhKytnSGN2dHMrQ1FPdWV3?=
 =?utf-8?B?ekdPZ0MxVCtRZFhOZFBkZ01OcGFTWTJIS3JUdGFIbkQyVUJweU5qWEVFcnZU?=
 =?utf-8?B?VmU4bk5wNGhJSVd0YjlhZzhhSzhudnpNU1pZMkVNMFhKeXByWkg5Q3BBYmg1?=
 =?utf-8?B?MWhLMFBOV3gwQmZNUFA0N3hkOUIwSVB5N2xtNWIzMTFhREY0dHloNHp4VTM2?=
 =?utf-8?B?RTJiQTFpWW82MjRKZlBybWpjOWpSM2MyanZuWWw1S2RMWEUzWGkrQmFHTUp0?=
 =?utf-8?B?V09GTnJQTnVObWd1akpoc0ZoU2ZveFE1TnlXSHBtMmlZK1o3ZkVtckt0MUtp?=
 =?utf-8?B?c2pkSGVKY1VrZTY3SFRuOXRXM3I0Tnd1VG4wajRyaDYzckExcEZ2MzNSWDVm?=
 =?utf-8?B?dG0ydjlGa3YwNnIvVEFFTnN0SUZlcXlCaHB0U1ovUk53NVlveSs3V01WNThM?=
 =?utf-8?B?WU5DT2V3eEtSdkNvOW5NV2w3L3hiMjdBZ3g2eXJjSFo3bC9XQU9TU2NVWWN1?=
 =?utf-8?B?eHFCa2FJZVNrZGlSTGlpY1owYXlxM2hjZEtLcG9UbjVUUG1zdk9aZTA3OWM4?=
 =?utf-8?B?UXRDNWdPUjZrNStvMW5JWEorbEFpMWdDNUdweTNRM0ZidnB0d2N6SnMwNTcr?=
 =?utf-8?B?c2ZSa00rcVFESndHMXJDK2QzME9MK3YrK3VPUE5ST2hoWU1RKythL2dtRXdN?=
 =?utf-8?B?TnYvWE9vQkdiazY1YTFERXhXZjcrMVBvS0pRd0NHemIxRmNxazZhY09XMExj?=
 =?utf-8?B?T01weFhXZkxjM2dKaTlJeU1XcStFNDJLSWI1dmJ0ZUNzQnAwTDR0bWR1MzBP?=
 =?utf-8?B?eUhVYmd6QUI2TGdtb1lZVlVuUmVoMGRiZDliRzk4azVnZVROK1Q1NEdWek9H?=
 =?utf-8?B?Nm1IV2NUay9ZMzI4Q0FJeE92c25NdFFPQjFBWmp4SUlOcGwzam5ucFVWMTFG?=
 =?utf-8?B?aGJUUlNwSFlCclVrREx0VFZLd0s0TWJnUnVWem1KcGx3ZmlHK2ZyM2lUd29r?=
 =?utf-8?B?WkJvaGUxdXJWVFhhdEp3cE14RFpYSXR1OXJzZkdMS3U0SjJPajZZYXEvbm5C?=
 =?utf-8?B?U3FKL3UxblNSVWRWMUxXNlpuODVCeUlEY01RalBNdTRIdldhSTZlanBqb2dT?=
 =?utf-8?B?WURRN2JEeFNPT2lka2E4M09PQnU4dU5RTDA1Y3RMc1QvVmdrVE5IU2IxSUpr?=
 =?utf-8?B?SThzWFEvSW1iQllVUTlMZ3phZ3M2ODRHM3hVZk5Ic01yRTQxMHNSbERmc1kv?=
 =?utf-8?B?b25BLzJXYnVKU3UrL0FkVGZMbVg1Tk11SzZxa3ZKc2hKeUh4b0NWMnp6eEl3?=
 =?utf-8?B?L3JWYlpXK1ZKK0JQZkQ2SklXK0N6dVkvU3ZRQzYreE50Zm50WTRoMzhVSU1V?=
 =?utf-8?B?OHlYdk5kR0wxV3I1S2lRQVpTTDZCNWs1cnlNd3B3Q0dmUXlWYVl4VGpVMFdG?=
 =?utf-8?Q?7hyXxSGiZgb3i/5/0NpV2LYQNdq5Ye4s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlgyL0xpcXVTU3dEN0hYeTVsMTQ0WkIrYXdDSkRqaEtMdCtPVGZlc3RTU0dU?=
 =?utf-8?B?NWprcXZtUGUrN2xXcVNHRGxkbzdPTXA1KzdZRkt3bElGd1Bnd1ppVzJmYjc4?=
 =?utf-8?B?cVJQS2xzRDJGT2xEUHFIQ0J3V2ZxN0FacmhaM0VVNFlpQlhoek1JckdKK2E2?=
 =?utf-8?B?SG1pQ2xQTStRODA0TUd3SzgwdlNNaVNIejNZU01vQlY1TzNmN3JRSzluelVw?=
 =?utf-8?B?ZDFGZUpKRW1ZSUNpeFhEcVcrY1c4THFGUTB4aTl6TktHS0Irb0VGeGxCd2Fn?=
 =?utf-8?B?M1R3TjhoNXBVbjV3TkVwSnQxVDZqZXNtQzBPbTNqTDhsVFNjMDV5alNDS2Q4?=
 =?utf-8?B?RmNNdWU4MUFkTGN2eXgyamJ0dk9PMHk5bVV1aXgvRVYwdjE2MGtYRTU4UUpt?=
 =?utf-8?B?M1dIZHAvSmlrem5IenkrM2p0anMvSStOL3UrQ0tMcFpCZjdXN05TV1pyWmR6?=
 =?utf-8?B?cDlrbWhZYXRxMFFxbFN1TnBTUVdCNEpPNVUrNFYvWnVXSUFLMjlNS1I2bDU2?=
 =?utf-8?B?cGorSVJvNDdKMWpjczYvY3BhVTB2dmYxS0I4R1hWNWNMTkIyR3kvZ1p4R1px?=
 =?utf-8?B?cTFxSXp0c1crNHQyY1FEaEJhN3YrQythME1YY3Q4cndwSUp2LzUxQ1RobnhN?=
 =?utf-8?B?ODNVTlFSVGpUZlZCU3pIeTZNNnZiUERaRSttbHM1cWdLNTczZkFPK1V6d0Rk?=
 =?utf-8?B?TVhiLzc2Wkp4ZjYxWjkyOWZ5Rk5pV1p6eGpIejJEeEVZamsrbnBXemFtc1RZ?=
 =?utf-8?B?M0VYUUFLNnVYczBJdUJmaHE0dThzT3k0czhVVjk5TCtEbnFUL0RYcVppOGxQ?=
 =?utf-8?B?NmcwTm9vMUZsenBJU090NmhTR3dWYzNQTkdpK2wyYitMbWRJa2t1b3JkSDBS?=
 =?utf-8?B?RlRUZHU3QlpRVUFvMm5tSXRmTlUyUm01VXcvd010RWZOVlY0RU03QzIzMXdv?=
 =?utf-8?B?cUhKS3ZNK1VEdlhEVUpzYjVaQkM1aXBVYk45aktVOXVkZWFEbE9xRjFzbWVo?=
 =?utf-8?B?TDRPRGZ6cDZKRVV4OHUzQ2g3WlZ2a0NFS1RvcWJzUDhQQ3p5NVJPQlBSZ0hL?=
 =?utf-8?B?UVFqZEZaYU1nc2V2MW8zYTFpZHdOeUJFdU1SMXJlVTlpRTRmL0F5L1R3bXh6?=
 =?utf-8?B?Wkl1aWduZDhZODZNNzcyTDFWWEZEMXR6SXFRUysvUnR1YnQwbElaY1RCaDJj?=
 =?utf-8?B?OWZwU0U3VDBpV2QwSHVJbUhOOWlVQ21mb1NkclhBNHF6V05rK2d6REliZitj?=
 =?utf-8?B?c2kvaXlMTVJLQ3didDQ5MkdJT0hNd3ZROHMzT1o4MWYybUtrd2pzQzVucGMw?=
 =?utf-8?B?WG5rQ3Y4K3RCczlXMVpvM3poT3Zya3lKYWVhWkZFZ1hLK0RPZFM2eFloMXhr?=
 =?utf-8?B?SUxVRGQzNTB1aFNXV3hPM3JsMUdVdHlTb0Fmd051cDByMmdZL2o0L1VzU1RQ?=
 =?utf-8?B?RU8zbmU0SUUweFJBQjR2UVZVTVFxbVdvTFlTcjNtV1R3T01qcGJWVWtJQW5P?=
 =?utf-8?B?V2RSZm1mWER1WWxBUWkzS1JhRVpCT1ZnMWQ3WlBtZ3duaXRwNFJQQXJZZzZy?=
 =?utf-8?B?RHpvWHlNR2xXQkpXUjB1V2dJY3hCV1hZSzh3SjNyc2hhODlKTS9ML2xDSno4?=
 =?utf-8?B?eVNwekE5ZmZjMlRlSmdvWE41MnpIbHZjTmh2OVVmTHRWQmVSaE5sSFZDc1pD?=
 =?utf-8?B?UHl3TlpKYkhFMVNRaFRaWElvamw0ZHFvNFFNOWEvUmJBR1RqS2JOWkV2RXlx?=
 =?utf-8?B?b0hOSDhSNUNhdWRScDdLL3Nnek9qcVpZMFduQkYvcU9nSEE0eFpJalpIKys4?=
 =?utf-8?B?WVJEL1VTQ3JiNFp4aVZZTS96VFRMVWk3dzBQVDNOeXFIOWRDdlQxcnpzdHZn?=
 =?utf-8?B?MVUxd1B2dDdGUlVYZTlYQjVXWGNBOEhNS0xIZDBrYllzQ1hoYjZScTVZTTRt?=
 =?utf-8?B?VXVDVGVJa0JUU3dlTTA5WmRJTUdtcVExVmZNSjlFeVJQbHNuTzhSS2k5TkR1?=
 =?utf-8?B?VXovKzBJeU5qb3dnZXk5bVRmRXMwRDAxYllBOGdERHdrUGoxdUlWTW56dFBr?=
 =?utf-8?B?aERudWE0cVF4dEhrbTNld1p1b1dxWXRJR3JYb2JkRkwvbGZ2WWJUcVAvTkts?=
 =?utf-8?B?ZG9tZ3FTb1duK2ZYMnpOdW9HeG42MFN4dHJaVGtXTWVVc1U0UnIzYXpkY2tw?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8a9d5f-6627-4eb6-f3d5-08de2d0c9b25
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:55:29.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aTgHoZonwJw0OyICbUaGP5DKbW4MdRtxZIndWJgxH/JmO4/D2bPnRQnsExZw4jUDb421tN0QJWJxmPckVxXcDYBS0qSatt0a0WDzaXAnsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6380

On 26/11/2025 3:07 pm, Jan Beulich wrote:
> On 26.11.2025 14:22, Andrew Cooper wrote:
>> @@ -1075,6 +966,112 @@ static void cf_check fam17_disable_c6(void *arg)
>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>  }
>>  
>> +static bool zenbleed_use_chickenbit(void)
>> +{
>> +    unsigned int curr_rev;
>> +    uint8_t fixed_rev;
>> +
>> +    /*
>> +     * If we're virtualised, we can't do family/model checks safely, and
>> +     * we likely wouldn't have access to DE_CFG even if we could see a
>> +     * microcode revision.
>> +     *
>> +     * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
>> +     * position to care either way.  An admin doesn't want to be disabling
>> +     * AVX as a mitigation on any build of Xen with this logic present.
>> +     */
>> +    if ( cpu_has_hypervisor || boot_cpu_data.family != 0x17 )
>> +        return false;
>> +
>> +    curr_rev = this_cpu(cpu_sig).rev;
>> +    switch ( curr_rev >> 8 )
>> +    {
>> +    case 0x083010: fixed_rev = 0x7a; break;
>> +    case 0x086001: fixed_rev = 0x0b; break;
>> +    case 0x086081: fixed_rev = 0x05; break;
>> +    case 0x087010: fixed_rev = 0x32; break;
>> +    case 0x08a000: fixed_rev = 0x08; break;
>> +    default:
>> +        /*
>> +         * With the Fam17h check above, most parts getting here are Zen1.
>> +         * They're not affected.  Assume Zen2 ones making it here are affected
>> +         * regardless of microcode version.
>> +         */
>> +        return is_zen2_uarch();
>> +    }
>> +
>> +    return (uint8_t)curr_rev >= fixed_rev;
>> +}
>> +
>> +void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>> +{
>> +    uint64_t val, new = 0;
>> +
>> +    /* The MSR doesn't exist on Fam 0xf/0x11. */
>> +    if ( c->family != 0xf && c->family != 0x11 )
>> +        return;
> Comment and code don't match. Did you mean
>
>     if ( c->family == 0xf || c->family == 0x11 )
>         return;
>
> (along the lines of what you have in amd_init_lfence_dispatch())?

Oh - that was a last minute refactor which I didn't do quite correctly. 
Yes, it should match amd_init_lfence_dispatch().

>
>> +    /*
>> +     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
>> +     * serialising, and is enumerated in CPUID.  Hypervisors may also
>> +     * enumerate it when the setting is in place and MSR_AMD64_DE_CFG isn't
>> +     * available.
>> +     */
>> +    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
>> +        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
>> +
>> +    /*
>> +     * If vulnerable to Zenbleed and not mitigated in microcode, use the
>> +     * bigger hammer.
>> +     */
>> +    if ( zenbleed_use_chickenbit() )
>> +        new |= (1 << 9);
>> +
>> +    if ( !new )
>> +        return;
>> +
>> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) ||
>> +         (val & new) == new )
>> +        return;
>> +
>> +    /*
>> +     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
>> +     * threads calculate the new value from state which expected to be
>> +     * consistent across CPUs and unrelated to the old value, so the result
>> +     * should be consistent.
>> +     */
>> +    wrmsr_safe(MSR_AMD64_DE_CFG, val | new);
> Either of the bits may be the cause of #GP. In that case we wouldn't set the
> other bit, even if it may be possible to set it.

This MSR does not #GP on real hardware.

Also, both of these bits come from instructions AMD have provided,
saying "set $X in case $Y", which we have honoured as part of the
conditions for setting up new, which I consider to be a reasonable
guarantee that no #GP will ensue.

This wrmsr_safe() is covering the virt case, because older Xen and
Byhive used to disallow writes to it, and OpenBSD would explode as a
consequence.  Xen's fix was 4175fd3ccd17.

I toyed with the idea of having a tristate de_cfg_writeable, but that
got very ugly very quickly

The other option would be to ignore DE_CFG entirely under virt.  That's
what we do for BP_CFG already, and no hypervisor is going to really let
us have access to it, and it would downgrade to non-safe variants.

>> +}
>> +
>> +void __init amd_init_lfence_dispatch(void)
>> +{
>> +    struct cpuinfo_x86 *c = &boot_cpu_data;
>> +    uint64_t val;
>> +
>> +    if ( test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
>> +        /* LFENCE is forced dispatch serialising and we can't control it. */
>> +        return;
>> +
>> +    if ( c->family == 0xf || c->family == 0x11 )
>> +        /* MSR doesn't exist.  LFENCE is dispatch serialising on this hardare. */
>> +        goto set;
>> +
>> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) )
>> +        /* Unable to read.  Assume the safer default. */
>> +        goto clear;
>> +
>> +    if ( val & AMD64_DE_CFG_LFENCE_SERIALISE )
>> +        /* Already dispatch serialising. */
>> +        goto set;
> Why "already", when this is now after we did the adjustment?

The old logic read it back to see if the write had stuck.  Again that
was the virt case.

With the new logic, I can probably just drop this particular comment. 
It's not terribly useful given the new layout.

~Andrew

