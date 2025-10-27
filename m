Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76BFC112AC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 20:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151764.1482303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDT2k-0004FK-Kv; Mon, 27 Oct 2025 19:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151764.1482303; Mon, 27 Oct 2025 19:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDT2k-0004CY-Hc; Mon, 27 Oct 2025 19:38:14 +0000
Received: by outflank-mailman (input) for mailman id 1151764;
 Mon, 27 Oct 2025 19:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JYa4=5E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDT2i-0004CS-Ah
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 19:38:12 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7778443e-b36c-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 20:38:10 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ2PR03MB7140.namprd03.prod.outlook.com (2603:10b6:a03:4f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:38:07 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 19:38:06 +0000
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
X-Inumbo-ID: 7778443e-b36c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AH8tQheWQ2oAxyQsZadDfAgaZj2vTwS2kpZMHYsXf6RNtj0vDbfgqMHIz/y2gZX63zO0pJzUlespmlmtnZlduGddfNeNqNSDfa662hn/2uEUeCLeL8Hfjwr70OzUsrUCfjfu0MZFucuSrb6f+r516CDTIrgnAXIzoJa3T/FNy/C0Yb8eHsmBEMtI0nv5nlZdn0fRnZEBSLN6gs7li+5QdlMDLsHqcI7h2hOzV+lILTHgSdVyt26d5o4a9T0PbCy70Q5bskFhf1kmgjnmXBYuyLKsPjMY0DVjQ4/b4b20VLwUTPniiKYZMgEPOzhYsLqHLCHCRt1zR6YVhwXua6rqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnHKvsfdcH9jYQssrwlJXPo2iLs37/NgP4O/Q2+PlFU=;
 b=BuUJSAduOVsYgC16k732I6D0dstCb7RWqjIGE8QtPbXPFR0V7T1XVeqZyvBZaI31LaXOaL2DJ6SfplSOmXZiOQcADlNQ2+QDcIW2+LpKxfBOcIxSE61a2Pqw4VIc7bVbUz/6mUrY9DuRXnM08zzUmRj8/ZVbrek1JUAsa9NavF3Y4hqhbr08Y6E4bV4jqeRa/QfiWRleJXSojOF4SCEbBwDBpTYaDuMcE9AvXIZaUYkhsZ5b1Cz/lKQbE2iZ01usNQ7XpKuzb6haSF1wJ3ixEVbyUXK+2HP/ABG506moKQiKWw6Ls2Uw3yngVJH9PgUf09RnDTSzknp9N4+Ro/fmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnHKvsfdcH9jYQssrwlJXPo2iLs37/NgP4O/Q2+PlFU=;
 b=jW4g80qp1q7/Sbwxw4oyrs/VMsBKSC1yS9FMXw9gjSsp9UcBrXNXswaf4ZnevXjmIxesPzf+lCfchLZYp/N1JK1Cgk5TFYPLSjxwzHrviJE1vB+1dUbw5kP/4KrJduo3bACcnDacHS1Pl67RvHulUXgw9EFblzVjG3wSJelnuTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <83712d12-08ec-46a4-b215-18f7ea1c1069@citrix.com>
Date: Mon, 27 Oct 2025 19:38:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 1/2] x86/platform: Expose DTS sensors MSR
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1761585640.git.teddy.astie@vates.tech>
 <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ2PR03MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: afc25c97-91f1-4aeb-ecc2-08de15905a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3RPZWZtSVNIK2ZhYk9Mby9LcWNlL3k5WHB1VzF2b0c2dk42bVNvNFkzbmtm?=
 =?utf-8?B?cEI0VEI4aE02SEl4eXNid1kvNkdUWS9IWUtOOW9WMG9EaEF4dGdWSlNhV1Q0?=
 =?utf-8?B?Zks2RGNRS0JKY1o4dHpMQlU4bGhPRkw3N1c1cndGVjdHQXlFUHhkVXpvU2hL?=
 =?utf-8?B?U25IblFaeWRYaGxSTm9FSVNRdDNCb3pIb2Z6elRJS0dQZ2hyS1hIUVh4VGNw?=
 =?utf-8?B?NmJMRE51UVREREg5MU5TSnFCY2UwQlZ1Y0R6N3EzT2lsNmlyWFliUnVoalZG?=
 =?utf-8?B?QU1NRWZoekpDeTVHYTdrZHBNYjN4OVIwc2M3N3FoL0xQSVFNUUpUVS9UUG1O?=
 =?utf-8?B?dzBwbi9DbWIyRkV5NW45bEJ4NGtGay9uUFN6dTMyelF6QjhxSlZhNW9mT254?=
 =?utf-8?B?bGt3WENzV2pkcDNnWURVa1ZRTGJSTzlUY3ZnU3BpNXhraE1SdytoTlZkOVo0?=
 =?utf-8?B?eHYweWpjZzFIanVjMS9US2JCOENSV2Q1amVwL2xOR2dYemVLR2Q5d2ZoUmxh?=
 =?utf-8?B?bHNBN1ZjbzVjTlYyM2hybW8vQ1dXVHFUdXB6d0J2OFJIVi9YdnpQOU9rR2lk?=
 =?utf-8?B?Z2EvUGt5VFdycWthWXRLK3BjSXdtaWVlV1hYM2U0UWxNYThPR1dVWWdZUytx?=
 =?utf-8?B?dHMzNjhNN1pQK0RUb3h4OG9ETUNUM3lWUmJhOXJ4c0ZvSmJHQU1TTE5LVDJC?=
 =?utf-8?B?V0s2aS9yQzJtWnlJaFc5WGlob0IySHJpMjYzZk9yb3Q5Uk1uKzlrUFYyS2Fr?=
 =?utf-8?B?QVBvQ3NqVXViSTcwZUp0QVFkd3E3VEdBTVl0Q1IvbkVTT0J2c0tkSEFpUWtw?=
 =?utf-8?B?TDVyNXlnY0RneldJYVpzTmtqZzE4YlZRYnhQalZxZ2ZQUmpHRHR1SnI1YWFr?=
 =?utf-8?B?YlpkU280c2lRQkVTQllnWFUyZk81UFIwY2ErcmRlejRSTXhxeEJxUFl6S2lh?=
 =?utf-8?B?VnRmQlNzU2hwZkxIR3IvdTluOVYyTVZ2VTlLSFZ6Qms0TGhscGg4WkxtaXpG?=
 =?utf-8?B?UDBFZWpYV241SEI2ekxKalVtMkV4Q0NiOWM5a1AwRjFNaXZLNDdKc0dMYU9Q?=
 =?utf-8?B?c0xKL2UvVjRvdmY4cWFPaTYxdmtGdlQwYW0yZWxiQkdoTlVPM2NMa09vdjFV?=
 =?utf-8?B?Ynk4TU81SVJIamVtbGhEOEpZVlQ4TlArak9LSng0Y0dJemtlL3M5SmR2MGxD?=
 =?utf-8?B?K2JFRC9ZOFJ2VDF3ZDRoQ2MzSmZUN0o1Ym1aMFFlYVNWaWNLZHJMQlFLUjJL?=
 =?utf-8?B?VEdFbWQxUjN3NUo2V2pXY1o2eXNLRUx3SDE5ditrUmxkV0gxYm52WGNxT0ov?=
 =?utf-8?B?TDhZdk0wR3h0UlFaMnN1U0EzVHk5ZGdLaFE5c3pSQW9qWE9mbG5COTd5cVFR?=
 =?utf-8?B?RWs1QmI5NmtKQVBmaCtPQ1NIY1RrYStnKzdXbVMzQnVLTTRCeG9mdHZpSjV1?=
 =?utf-8?B?RmdEQTY1WVNuR2VwdXZqc3dCS0VYZFphVzUwenl5V2MyTzRXcU9kN0plaE1T?=
 =?utf-8?B?WXlLLytvb2lxT3I0b252dDF1M2NkSWRjaVpJdHZxUzdWanVsUUI4WWZScnVt?=
 =?utf-8?B?eTgyWjhLRWQvYW1vSEI5cmFucHlaZHBxekt6ZXRibkdtSExxS1ZBWjRrL3dE?=
 =?utf-8?B?RWlzTExlZk4reXFrS1NnOSsreWtOVi8wQWRpd01sL1lPbzRRMEt2ejBIQVlV?=
 =?utf-8?B?djAzN0tDOGkzNE52UEsyOVpGSWgzVVVtOVVwK1dVSjc5SE9UVmprTGN1R1ps?=
 =?utf-8?B?bzNCVC9OQW83WmppeldPNkhMVmN0WXU1TEpvVms0OWc1WHdQWUhhL2dEWHFz?=
 =?utf-8?B?N3FXS2h5blFYeUl2ejZJQmhGaWRIa1dnK2lBK1E5QTZ5SEpQd1FpZVQ4bFdJ?=
 =?utf-8?B?a1pQZ0hHUWNCMEE2eVVPdWgyZmZyYU5RRDdsazdYcHlRUTJ5QURXOGtBbW9M?=
 =?utf-8?Q?uG00mt8F2zifAROttSWm7YGn1ZzGi+Jz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdPU2toL0ttV2N4cmNhWGxzLzRHOTM0bjhORDl5anUxOWZTRVZ2LzFNc3BE?=
 =?utf-8?B?bkxRa29TREQ0ZzZaYS9GLzVMTHFuOWlMdVV4eEV5eis3YWN6alhmRGhMY3lk?=
 =?utf-8?B?S1FxZzM0OFMzQ2RJeEprdUx4dm91eWlMKzhaSzJJc2oxWXUzTUZlSnB0Qy95?=
 =?utf-8?B?U1ZqV2lwSVZkQ1IvVXh6bDJQNW95Mng5WGtabityNlRQaGtzbWlwWXFLSWt1?=
 =?utf-8?B?TGNXK1BLMTNPc3VKdElqWkNwalpJa05mWFVVNjVXM0tQYVFJcHBCdTBUWGdv?=
 =?utf-8?B?dWRwMWI5QWVacGE4Qzh4VVZKeDh4VXE2YStTTjhMNi92R2NGdUtBdVFXdnZ5?=
 =?utf-8?B?QkhWeEtub2JXWUxLSXVqQ3dxRkgvdStEbnJpT1NLamhXaUtMWGkyeG9HWHpp?=
 =?utf-8?B?ZlkwVm8yUnVldmNzY1VMSk5za1U2NU84UGpUS245MHpELzZIRU13RVhLTklZ?=
 =?utf-8?B?OXBrSklvdTM1cVJSeFVEdGJURzZqVUVKNVcyb2J2TFN4b0hwUXh4M2lodWxv?=
 =?utf-8?B?OEVTNmd4VWhGVTlCRVBFODhEaEcyM2xVRi9McmZPcHpmUXZnM1pPVkFENHFh?=
 =?utf-8?B?MVc5NDJmQytQZUcvY20wbnk3WHpLakE0K3VIMkVKWllOVWVzaU9pRmZjQjJk?=
 =?utf-8?B?UzNhc0JVaC9pMlpTSDJtRVA0NXBpb2tYQ0EwUHVqcUZXNUJxQ1R1LzljNFhz?=
 =?utf-8?B?ZG9PUy9jeDBNdjZGUXBhOFFGMXllQXNTNndmQkhBdnRwU0FRVW5Jd09MVjJh?=
 =?utf-8?B?ZDQ3UDVjQ2pPakxoTk85cmRMVC9RNXd0QlJuMkZ6ZzVva0ZyMFZNUnZCMlBO?=
 =?utf-8?B?cmY5MW1Wd0hrK1YwdTlqZ1VRb1JHQnNqSmNKdmxOK3BOVUUvUE9WOGFZQysv?=
 =?utf-8?B?eUp0NjFKSkV5LzUvSkkwL0w4V2dFeGlYZ0NCNVJYays2T2VZbkRzS2hJNjgr?=
 =?utf-8?B?UG10aHRaak5OQVNSZVJkTGY0RnVrd3d1K203cG5sV3JiTTNtelR1V1hFa3hR?=
 =?utf-8?B?R0pNNlhRczQzMnkrMVRoSlE0QjZKQWszbGN6VjFmQXdEZC9CQnFlQVp1aVJj?=
 =?utf-8?B?NGorbmlIc0JhZGNHNDZ6bThPajFKWXZ1Rms5OCtXLzVDWHlUNUhrVk5VVkNH?=
 =?utf-8?B?aHljMDNpbEFSTXdwUGJRTVpBc21jc1FWcFVzZkRsOEMxVDB5RDRFY2pZRm5D?=
 =?utf-8?B?WjNrblNsLzZlTW9pY1VwVzhmdHJjVkg2dHZ4KzB6U055TW1SQ3VvR3V4aWk4?=
 =?utf-8?B?UXRvMUliNGtjalF0Z2xsR0VLMTYvaVloRnA2blNSREthZ0wyU1Z3UVRSNUI5?=
 =?utf-8?B?aTRWRi84UmxtakNHWDljVkdlNWlyYnVqc2pMNWJkeUNMZ05uSHdLaGZEd3pW?=
 =?utf-8?B?aGdwNnF6S2p6ODFESHVVWG1LY095K3k4ZlhKVk45WDFOOFk2QnV4TGQ5WWc1?=
 =?utf-8?B?VE9CQnMwY0ViT2Fwb2tUM1RUTzFWZmtDSktkUHdrbWlvRjZMNEFSRmdMOFVR?=
 =?utf-8?B?RUJ2MmExVXpnUXNrNDVjK2VQUGc1OW9ja2Y1MDIzY0tMYVJ1bEFwRW9pZVRK?=
 =?utf-8?B?eTdoRlFVN09aaEVxTW91Y1pVRzVnWmNpMmNNRndRUjg3L1FlaWtwQjk3aTl2?=
 =?utf-8?B?WHlPQWZTR3hzcUduVlRvUmQyL2IyaTk3d3Eybnpma3R5VTZrS3gzRkFuWlRX?=
 =?utf-8?B?bUdTTlY2U042NDBqV2UzZXFOZFN3ZkZWVDF6MVNuQkFWL3U0MFRkL3pYcERO?=
 =?utf-8?B?WTUwQUJHd0N6Vm52Qi9aaVpHWGlrR3d4Y0Mwc29RQmxCMEdubHRtV2hFM1NZ?=
 =?utf-8?B?K2kxUzY5bXdNMCtoUVNNMFNOa1BnRmZZamFUWk5laWlyRVBSTUFCWEhsTHhp?=
 =?utf-8?B?M21LeU5PZTFWbERQRjBJV1I3aFBzMjNZazM2TUlBdWpMRlFha2FVL1RWRVpi?=
 =?utf-8?B?OTB6RG96aDA0VEh6NG5RZFRWekEzaVdrQkxnU0xJVUtuSnV4QnBLR1N5bGkx?=
 =?utf-8?B?Qk5MbjZ3Zy93aWhTTkg1Y0YvUHlpb1NEam9LaFY2a1o0Yk5RSDhxSjdaWHVm?=
 =?utf-8?B?UzZJSzZoelFUOHVpWnFITXI3K2NoZkU3UWdFM1FheGRHWkYyK05qcFVyUUZt?=
 =?utf-8?B?V2hLSlNwVHJtcUFiY256M010VGlySGtRMG1iQUN1b2JibG5oZWpudlRGWXVn?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc25c97-91f1-4aeb-ecc2-08de15905a2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:38:06.8188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKsrv+KGRs+nkHVCZF9TPbbVcxhCckA6BteSczFyl6LJ8HG5nP8u0bQvtcvWxDsU6DKaNV8a51nAbIBrKwQ/CatlGmxgm9zCzXZ09zM6rq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7140

On 27/10/2025 5:26 pm, Teddy Astie wrote:
> I'm not a fan of doing a inline cpuid check here, but I don't have a
> better approach in mind.

I'm not sure if there's enough information in leaf 6 to justify putting
it fully into the CPUID infrastructure.

But, if you do something like this:

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f94f23e159d2..d02fe4d22151 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -121,7 +121,13 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Thermal and Perf. */
+            struct {
+                bool /* a */ dts:1;
+                uint32_t /* b */:32, /* c */:32, /* d */:32;
+            };
+
             uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
             uint64_t :64, :64; /* Leaf 0x8 - rsvd */
             uint64_t :64, :64; /* Leaf 0x9 - DCA */


then ...

> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index 79bb99e0b6..3190803cc2 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -86,6 +86,12 @@ static bool msr_read_allowed(unsigned int msr)
>  
>      case MSR_MCU_OPT_CTRL:
>          return cpu_has_srbds_ctrl;
> +    

You've added trailing whitespace here.

> +    case MSR_IA32_TEMPERATURE_TARGET:
> +    case MSR_IA32_THERM_STATUS:
> +    case MSR_IA32_PACKAGE_THERM_STATUS:
> +        return boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
> +            (cpuid_eax(0x6) & 0x1); /* Digital temperature sensor */

... you ought to be able to use host_policy.basic.dts here.  In
principle the Intel check can be dropped too.

~Andrew

