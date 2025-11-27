Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5FC90458
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 23:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174409.1499365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkDP-00027r-4B; Thu, 27 Nov 2025 22:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174409.1499365; Thu, 27 Nov 2025 22:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkDP-00025O-16; Thu, 27 Nov 2025 22:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1174409;
 Thu, 27 Nov 2025 22:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOkDN-00025I-Pm
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 22:11:49 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1028444c-cbde-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 23:11:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8397.namprd03.prod.outlook.com (2603:10b6:8:328::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 22:11:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 22:11:43 +0000
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
X-Inumbo-ID: 1028444c-cbde-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKSEuYZD2Q0kyuiDxsJx2wt+XjIhgDZ6kykg/pBcSn4UKIaGRj/qst9TxIOipUlUVHvE6sbWeXwAIexUUPBhKaZlx4FcCrDv3ilbf6zK2Q4qVMA26+v5Mm3PziMjY1aJQ2PNp/IdTPV+fU63fl4pWwBPcT/VhEX7Dz1Ox8Y1VoCrVkkytjvdDyjMo1zZ3muV3z7BoNHUjV+XKb02VXpYJ8Y+NKndaXQqCaYzckH6Qv2MsnrgUa4rl5Fm0zKMtAuwzKXA52tCebrelNunA9b37MRSmdwPYlPczZLr5Lz7Rz8Y17uoDuUphVNKONDXeqBPVASEnfOl1tcBN/1GWWYyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYDziWmpfg6jFIDyJg8fnIrPQbB102iQI0Syc2VeWWs=;
 b=x6MJvAkex3B3ic/DunkGsZW4E8If2PZyez++HazeLl/2iKqHOOqfZIudqTi7E1jBSeyenuDg4K4Ci6b5H78KC7PZT5Gmx2cH+BNKbwmygTfE8roTrWw9TzV+LcbxlmV1AWXfm7R2GAI4T2XvMhwrnH9jfI/A5ER5CK/AHNuXOfdAVba4CVKJtK3dSDACWDE7r9nky1cTSudsvB8DRvQGipTnYoIMK42mwQgyxiSBmCwRqUhhaoXzMc7lprS3XMBahUcQdHWL38b/qIpGkavJrOd6ZJ3gnn1HewyYGYc5ssWw5G8HK6T2WegPZTMsnSObuLq8vAepdcYj2odBK/QLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYDziWmpfg6jFIDyJg8fnIrPQbB102iQI0Syc2VeWWs=;
 b=L+v4x2KtFbwFoYkq7sPtwSQFprUPFw7Da3dXVzOKb9zS8YUS3BfSTcdmr7Plo1wTChG51ybi+Fqlpojv/oBiya9Mm6ZWAcMUACiJ92GQlV0lIx3LtWnaT8CU5Tdj8X0B5k2U4X8yEZHnZS78ro5byafnZ9YfdFTpgJ5fbUtqvx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d27c3599-ecea-432a-b244-13b92b274c14@citrix.com>
Date: Thu, 27 Nov 2025 22:11:39 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 00/11] x86 vendor check optimisations
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 58967871-2670-4319-1ab6-08de2e01f2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUdSaGVNOUdPK0pmQXZwZ2JnNk5FMkhsVm04OFV3U25vZERjS21UZVZhbWgv?=
 =?utf-8?B?QTBZRXI0VnJ1bWNSWWdGN3NYMGwvNGROcDZ1bWUzVWZMZStOY2ZKNkRSYzds?=
 =?utf-8?B?YjVsQnA1SXllMXRqNGg5aEl5NkVHZEVCZUNrdFd0amJySmRoNmtDSVA5bmhr?=
 =?utf-8?B?M3pidThndC9rWFBJb0RaM3B0bXF4K3NSbmpCNFgycEdzRDlxcCtBWmtYeGVF?=
 =?utf-8?B?SXJHdzlXOWp1RjhjejJ3NFEwVEdqenB1UmJ1dUVvTElWRVJKMjVjdUp0eExw?=
 =?utf-8?B?Y2NPRnh5ekZqTHROeWFocFB1TkgxS2ZKY0lxVEg2bU5Ea0craEgxV0xUQ3cx?=
 =?utf-8?B?SndOT09UOGlvamxyZ2RVL1JVU0RjYWFMQWJWeUp2NDl6U2dDNityVEV1bC9W?=
 =?utf-8?B?bWV5YmVtQ2NiN0JVYjlReEZFUTB0UkMxeTVVdWRpbTNCSmxQZDJNR045V1Bz?=
 =?utf-8?B?WXYzQ1BzcHltUEhwTmdubVpCL2VWSmtsbk1iT21rTS96OTZZMkdiVnhTN1J5?=
 =?utf-8?B?TzVQTldIbnNXWlZScEx6eUxMZ1hyd0tEZnNzbFYrMFU5M2R5UlBNazhWQVVK?=
 =?utf-8?B?MlVVWWtlZE4rZmpldUc2Y1RLQUU3SHhLNmxOVUJQN2p3S0xOSnU0UVcwb0Nx?=
 =?utf-8?B?d2xKbXUrK2VmTDRkZ04vN0k3WnVUQ0ZwdmlZaFdwYklpTDl3dFFnejJHZWxN?=
 =?utf-8?B?U3cycHpibVRNbWdTTVdrNVUxTloxRjR4MWJQN0Y2VUJvZFI5MGNqNy9vbVZS?=
 =?utf-8?B?a1VNV3E4dXhrSy84a1FuTHpvZjR3by9QdWs0TU9SektHZzN6THF6MXVDWUcz?=
 =?utf-8?B?ZFBpdlJoQkRpSk51b1VlMW9lVlZCaWlaN3o5cWlHbXBYWlBZWHpFc0l3NnFJ?=
 =?utf-8?B?ZWpRa3FsZjVpRVFpMytJQ3BWUkl4clR1aVVUZ0tRbGhsQ3RUTzRsclFCaERr?=
 =?utf-8?B?S2xQZXdQM3NTWnFxTFZTZi9rZGN5SWFTeThUUU9nRjllMmhhaGNqOEdJbEd4?=
 =?utf-8?B?cmVIcmZHTGdLSW5DaDY4SmZtOEo2VzhKWllTWnNQVHdjd1N2cU5KbW84UWln?=
 =?utf-8?B?bWlwUmJoNHdzYzg2SThuczZGN29OOWJMRlpraG9MNnFzSDdlYjlJL2VVS3U4?=
 =?utf-8?B?YSs5cEVMZURjRVF6NUxkV1o5SXl5MS9ud3lWNEF0TCswdUQ0eDdRRnNsT2Q1?=
 =?utf-8?B?TStVRjVjcmNLQjlJZWZONjF3N1lCZjBRZEtiNjNVV3ZZVCt5dEpRUjVKWGRZ?=
 =?utf-8?B?WXAxTEtSbS9BQlhGbFBMT1JIR2JvelZocFFSTzR4M202Q0lnRGYwdmRzaE1i?=
 =?utf-8?B?VG5wUW9tY1BqTCtORFIvbkhJcUJ5VEJFM3g5Z29kNjJlVGRGWWV5RnpVelo5?=
 =?utf-8?B?QTRlWFVESys4bXZRNm1iOFRjTEkxVzI2YzB3OHIzUW91MHo1cEN6MkkwYjRO?=
 =?utf-8?B?OS9IVGNYSE1OQ1FGVlFOb05MeWRhZUpzM3BiMGNKMG9JSUJURjFpNUE5WXFl?=
 =?utf-8?B?Unc3Y3hiaFlOYjByT3Z0UUN5RUR1WlZBVVFCVzhtUW9FQ212b0pxY2J1Mzdl?=
 =?utf-8?B?RlM0dEZmY1cwVUJoMzlGbjd5OGEwWnJzSU56dVVoL2YxMXZJS3NNQzBTckFX?=
 =?utf-8?B?OWpjbmY3c1NmR3FUR0k1aVBCZEp5bnRNbzFNWmdUbWtQY3ppeEhiMDNYY3BT?=
 =?utf-8?B?U3QzK0gxbUozNUtFeGZUZXpRQ21lZlBheFpPM1BNektsbG1iOXJqSUJQVnpF?=
 =?utf-8?B?cnI1Zm8vekpuTi9mOHJHMVcwYnJaNmNGaFdweTIvTnVCamFSalh6dUl0enNH?=
 =?utf-8?B?TWU4Z0pMbWpSSzIzb3hjMHBpUUZwYkFwRmV1eUd6R25pVml6WGR1QitwVWtw?=
 =?utf-8?B?aGlSZThaZWREeTN3WExFbUI4R05BYm9rcExMcVAyY0E3eFFsM1ErZEo0dWI5?=
 =?utf-8?Q?NzErOINA1AmngwIhNIbRZqUiw+rdjkgO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THlVeldnV0FNK3BKTFQ5bXk3dllRRW9FWG90UE00eGVHem5lNHVZKzNFTkl1?=
 =?utf-8?B?RmcrRGszTi81eHpmQWtXSTZoVEQzZEVHOHUyNWRxU1Y1eGtyVks2S3UrdVBq?=
 =?utf-8?B?dE1NN1hTNVJ0ejNCSUYzV0Fxb2lFeEp2SEZIL1R6RGRhYzhQS1JWTE00andP?=
 =?utf-8?B?TzJTcWtOYlROMWVtSlJSNHNCL3dqelFvYWMzQ0dWMHFIdHFXRmVVak1ndWJS?=
 =?utf-8?B?Ym92b0tOTkZRV3BmeStYSi9XZ2lOSm1mVWk5N1NLS0xVU3RVTUJDZ0k1am5o?=
 =?utf-8?B?VlNjd1hZRXhTcXNMMmlwazhFSE8zL0d2dmpoMTJJTlEzaDN2YlhLVkNETFRl?=
 =?utf-8?B?T1FBbGJiUjk0a1FWSWRLbDJWNEZsNEpzalJZYkdtaFBpdHZLVjBtN0xnZG1I?=
 =?utf-8?B?TVZpdDNpQmpjUk9PZjlPcjZsYk5ZVitSbkNQN1hldmxiZEFyNVcvSGRGM010?=
 =?utf-8?B?R1NmRTdPc1REUTd0M0o0bzZwcFIxOTdEVThTaU1peTBKblBKMTZJK0M2dEZT?=
 =?utf-8?B?UUhoMFY2S2o2NS9DeU1yTXpjcktlbEMwTW42Rko4V0NDYWo1OUw1LzUweFZR?=
 =?utf-8?B?aVpJYVhiV3ROQVNhSEFzd2hsclEvaUJnWnd1SWFWejByYXdmenFiMXJxUTlB?=
 =?utf-8?B?dmFwS0xVMlVjRUJ6V0lPU3dtSUFUT1JlSGs1eER5QXF6VzFjNUNOQkJ3eWlX?=
 =?utf-8?B?QVRLcE5PZHo0WXZQQzFJZmtjVzhYcWZ0RjE5NFV6a3F3OHNoNkljaVRDKzlm?=
 =?utf-8?B?MVY4VzBnYkw4Mll3VmZtb1NDcU9RazNMTkptYjQ1U21KWC9KQU5ZMmlWMWxq?=
 =?utf-8?B?U2dEWHFJQlAvV1ptTWE5ZDhFN2puR0I2aVlVTjlNRG9HOEl4eDF4OE5pcnR1?=
 =?utf-8?B?RnYzaEJqVlFXWEtydytGVEZIZ3dXMURkdGlHdFlnRExza0dORk51UC9Hc2NF?=
 =?utf-8?B?MmQ2Q2t3UExSWE52eGo5dm5TMjJwbVNOb2lZY0Y2OXJSdlhFQjMwTG5xcUx2?=
 =?utf-8?B?WTdlaUtKdE1BK1d5YmtLMVo2dmk2L3Z1WVFJZVVQMDZUWXVlYXFNb3pwWXJr?=
 =?utf-8?B?NTQ1UldRNW05ODFzdEhYektGYmN3TlNwRjNaSlMwN1ErMUpRUXcrdEUxQ1ZN?=
 =?utf-8?B?azI4K09xUHIvK3BuMitGVmRzUzdDT3VxUHBsVkI4YUFCV2dObDZ6NlFtbHAw?=
 =?utf-8?B?aFJtNGRZbGt4bndQOWE2dXJZak9aQTVEN1dYQXR0K1FGdHBYWUw4YVF6dWJQ?=
 =?utf-8?B?T3JYdTBNZjRZMzlxYlB4N1pxTDFmSkNKcS83K0lUbldmSmdTK0toalc0NW13?=
 =?utf-8?B?V3VNVUNiVjl2RjhUMWJtVmdHVzY2ZlJESVhQZVFPOXF4ZlFFcGRGY0RGcGo0?=
 =?utf-8?B?dnNPeWUxOXFPYlYxeE1RSUR1MUpLVXBrbVZLQ0w0WTRlVWJmUitGTFc3eElU?=
 =?utf-8?B?cDVUcC96ODdwYlF3L1JzU2tOVUI1LzNNRUNmNGtvdmh6bksxZ3J5K1Fldm16?=
 =?utf-8?B?Z0JsUEdaZ0NsRFYrcHo3ZnIyR3c0QmNOMHBVUndBYjJNTTZBVVphN3VEcGpo?=
 =?utf-8?B?ZGx0TkdxYnJYQzNDTndYUW9UOVlZcXpmZER2L1Uzd3ovWFE4MjB5bHR4TGlN?=
 =?utf-8?B?UDBiaFE4U1k4YU9rYmZJSlRnQzNWSUhWRENhL1hVVzdJb1pLNkU3eU1wSlpw?=
 =?utf-8?B?ZXBlNDkxUnN1NXVnTEc1aVMxQ1hPQkxaMWZnUkppS3JkSUtBSmQ1ZzRrenU5?=
 =?utf-8?B?elB6TEZGeW0vSjRsZEdXSHFVSXZWbDFlSFBmdG5GZVpFTUd4eWMvZnoreG5u?=
 =?utf-8?B?aGt1OUhmb2FqRnljMUZXVGkyc29ta1NCK2lsaWtKMlJxaXFpbWZtanNEQUNY?=
 =?utf-8?B?QlZFRXZhVVA2VzJFRUVNMzQwWjFaSmdHdjFSZEJWWGszQmh4V1NrdmVYNHYv?=
 =?utf-8?B?NTBDT1F5bEtUYnFScytwTkU3ek1ZN3dYdFpzZmk4b1FvbFpMNlhXSm5jWUtF?=
 =?utf-8?B?MnFZdFJaTy82bXgxdHhnMUJJYmxlcUJtbzBXc290dDJySHpMYmVxUVg0VVFq?=
 =?utf-8?B?YjFiTlo3TUJtU2pZMGFVcE1xV2dqZXV1enVXQkZPZU8wSzRjaFJia21zQnFr?=
 =?utf-8?B?R1hheHExYjg4ZDdXdmN1RjV3VkRCOWYyUC9LM3FOUE9RWG9lc3JHcWFhNUdF?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58967871-2670-4319-1ab6-08de2e01f2c9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 22:11:43.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k08QnH5HnyPmHU7HcG5kbMrpknO2HD+AdJLxsZ9sjUAswn78G5g5UeQz4t2yAxaFCdZXR/lchJRPpJaUUmF2Ti4QCSIA2uu2vdXBPrfP/UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8397

On 26/11/2025 4:44 pm, Alejandro Vallejo wrote:
> Just knowing x86_vendor_is() is "good to have" is good enough as it enables our
> downstream to customise it with whatever optimisations we need.
>
> I also suspect other areas of the hypervisor could benefit from this meld of
> runtime+compiletime sort of checking, allowing transparent code removal.
>
> I'm thinking DOM0LESS_BOOT vs DOM0_BOOT vs PVSHIM_BOOT, or AMD_SVM vs INTEL_VMX
> in HVM-only builds, or family checks to have (i.e) a explicit "older-than-zen"
> Kconfig option with a similar approach on a family range check.
>
> This is maybe one of several such uses.
>
> So... thoughts? I'm definitely fond of the single-vendor bloat-o-meter output.

Having looked through the whole series, I'm not a massive fan of
converting the switch() statements, but it's the only way to do the
DCE.  So be it.

I think x86_vendor_is(var, MASK) wants to become boot_vendor(MASK).

Most cases want the boot vendor, and those that appear to want something
else don't actually.  When you disable the cross-vendor case (patch 2
pulled out ahead), then cp->vendor == boot_vendor and then you don't
need a variable to pass in.

This also reduces the verbosity of the new lines which is an improvement.


That said, this series also collides substantially with the Intel Fam
18/19 work, which is more urgent and needs backporting to 4.21.  More
specifically, there are a bunch of changes which interfere with VFM
conversion, and for which I can't see an obvious DCE reason to have, so
I'm wondering if they were just part of "convert everything".

~Andrew

