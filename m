Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOvhDxzHeGmltAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:09:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D7955E0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214825.1525064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjkp-0005fZ-Bt; Tue, 27 Jan 2026 14:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214825.1525064; Tue, 27 Jan 2026 14:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjkp-0005dq-7u; Tue, 27 Jan 2026 14:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1214825;
 Tue, 27 Jan 2026 14:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkjkn-0005dk-Vn
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:09:13 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f97f89-fb89-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:09:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7892.namprd03.prod.outlook.com (2603:10b6:303:272::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:09:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 14:09:09 +0000
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
X-Inumbo-ID: c0f97f89-fb89-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKT2lYtKOUqOQ825r5OJrWQMXu5B73vQbnpLZSjCFMEPb0X/vafNurJd8S6kZJ4QWUfzrNmpPEP32g9bBeOtuKJ1OoIxfd56cj8elWL2lVZUA0eUXhY7ORXtdMBGTdGegb0esF4yLBT+zckkeoOKBUR+o+cBzjZzq0k20aGBsEhD1BBt0lIDPLeLkiwRoZGWbNAs/QE4J1GHjiT9PVwDkcwBLDGpVvuUJTVKRAsBwjCf3rmT0Yt5RqS1d2qqruy/MI6Sv+8AfUJuD7AAugpAQirPInqiwSmbWTPw6HuBlskPnaAoAD8K72jbhD/vnjZuVT7h79536CulXdElyswGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ6YXstgqKr0MaI+J2nsW0kDl/JbWFaXcHrORCE6uFM=;
 b=iFDq/EJQS48j2tohzEoCzbYcx4KjxyOlYZetK5biSKwJ6NnhLe5371k/v/HPfyVn1xgecfGAjMEaUA9qhHhddwoeFrYOk5MiolVYrXiws2e+YGozhC2Z2nrgbjjRmZQfF7VKMwH2jEjPbMoyanlTpjkQUcx5ddlilqvvHPjIhtFoZ2lBpGznf86VqqNt6r7ffagbcXizLGcbQpFGmFD/KItHmlj2C1RTpPLBU30E+e6RJxVjAS+rPBboJuOQpT0bFsRirIOsDpozgEhOyK7GFG5b77BI0phRqDeKats70oJmyqA8Nwzn/kbiruZN2UD8QkFrnYhHEYUYLs71w/zfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ6YXstgqKr0MaI+J2nsW0kDl/JbWFaXcHrORCE6uFM=;
 b=A0iQufw68mE9+wvWsZJ+81LlVgEtD6VzV524M8GK6+8Y8lzOsAs61fbzcerYNh9WLw5i1YgsVrY4LgpuahwoVk5lTA7k111PLX7UPJDc/RHd8s4583UOD0f0ykOe6JwUknvaV7ZHmzYofoGJyKNx6LgbET+Enzm3IfhJmrS7sgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <15df4e48-1e96-465e-b845-a7b82b630a0b@citrix.com>
Date: Tue, 27 Jan 2026 14:09:05 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/16] x86/cpu: Rework the vendor early_init() hooks to be
 __init
To: Jan Beulich <jbeulich@suse.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-7-andrew.cooper3@citrix.com>
 <810d31df-f69d-49ad-bb1a-ece5f3e75049@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <810d31df-f69d-49ad-bb1a-ece5f3e75049@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0203.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: e44db18f-ec1c-40f2-4e61-08de5dada3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cU1KOThkaU9MSk9JYmcvTFA2Zjl0SmgxTjdXNGlhRTVHTnlZWi9sVFUwMFNL?=
 =?utf-8?B?aDFpZ1dhMkprQll6Q0pyeUlVaVBTQ0s4bVBWT0F3Y1ZvU0tOQ3ljbEF4b1VB?=
 =?utf-8?B?WUxNaXdtYnVLVHpXc1cvQzU4c08vVk1FYU5GOWphUGl1bllOL3FrV1BMRmtk?=
 =?utf-8?B?TkpEYUNuWllWWHgrSXpOd0ZqU1RIRzAyKzR5NUNaWDhHMFhTYlhUdTUycGFS?=
 =?utf-8?B?ZUpWL3hHdTZxZUVHQjdWUnBZNm5zaVU0bDBJTVFiTGl1MVcxb0JpUjhnY2o4?=
 =?utf-8?B?V3EyNUg0dk55S0l4NitFL1JBTkFMSVZUWDlUY2wvZTVqVEYxczhFbWxJTzdi?=
 =?utf-8?B?L3dVejNUaUx5eTNIRXFBaHFJY3BpN3lOSmZQR203SjJSTktyT2ZzRkh1MjVD?=
 =?utf-8?B?MG5xMDFyOStMcXhLQUptLytkb1BQZ3FQTzgrYWlFM21ycitMNUIwZWFzRTVF?=
 =?utf-8?B?Zysvb1RldVRJK2d3dkdoTjIxRmJCa3k1clV5amJ1YnkrWU5xZSsyWWJuSVdZ?=
 =?utf-8?B?bDNwaWpaM0RndVoyN2dJUHY2SnVJd3IveTBTc04rdUFUUkNhY0YxZktNMnRU?=
 =?utf-8?B?RlJqRXdyVTdIZ1FXUjBwaldac21iYUdKL3M0bkZsa2lWTnhXM3poSXN3ZlEr?=
 =?utf-8?B?b1JXOWxLK0VzSXBNYVRpeFduL21WU2IyZ3RURXBRbnFJbVRuN3BBVU9MaU1u?=
 =?utf-8?B?MDRmcVNtVXgvbzJCM0hNaDEvd1FyT3YreC8xUW9oZXI4ajRlVkZ2NXVoWmtk?=
 =?utf-8?B?ZHlDYklYazl4eWtCZUZiMGorcmV6QXZPbFZZZTdtcmRGUFhRSXhxbGJwUUZ5?=
 =?utf-8?B?Z2xKaVdIOVJnR3lQdmR5SWVZNVcwTmx4L3gyTSs1SUFjS3JURmhFSnZSTTBV?=
 =?utf-8?B?ZklraWJ4NVVyTE1ETzJGeGtGSGExSDUzd2N1YWREakU3enFrQmQyWXRlU1Jm?=
 =?utf-8?B?RDBDaWdNaXNqdWttQTIyQXo5SW9DeVZRN2dib082M1JUR2U3VzRZOEpjOXFL?=
 =?utf-8?B?aTg2WFV2NXJHZUUwalh4TG1OQzgzaFVBZnY5dkVJL3lqSnJTbEZWNVlOTzNx?=
 =?utf-8?B?Mnd2YWtQZS9VOGtEUmVlRkMvaTMrSTI2Lyttbit0dXF6THdiWkE2alNaMlJT?=
 =?utf-8?B?bytnbnNRR2E0dGJWTmtzZ1RPMXMvUE9QN1FYUFFwTCtHVU84ajJKUjV3NWw0?=
 =?utf-8?B?VmtqSzFNM2M3MVh1WU5JZGJZbGhTNG9pMXZENlZmY2NVNTBkcHhqcWdIMWpm?=
 =?utf-8?B?bGdqZjBPYXJ3MkxoY0dCZytCMFRBUm05WjhZaVczb21qbzQwM1JDUXpDYU83?=
 =?utf-8?B?eHUyNzdJVGFlMkVrdFFrTTk5eURxVFZ6Zy8wWEhNMlFtMFlMb1p1Y1NYTGM5?=
 =?utf-8?B?R3cxdlVHYVRnWEZyakRxekJDUTVqU2p1b2ZTY0ZxRlk2dzVCdExqTzlpZUJq?=
 =?utf-8?B?c3cvM3JGWEowenNabWoxTDFiS3hSSy9va1RhaEw1bHkyUVhxYUFVMXpjdmFV?=
 =?utf-8?B?YjdWcTUrbGhvS09UNXZyYlBDK1MwZUlScFNJbWNwcXJIMFZzaUtsL0Vtc0Q3?=
 =?utf-8?B?YUlYazBaa25pN2YzSnVJNnpyVm9ZU24zV1VCSWhFRTM4SHBSZFAyYytZTnVz?=
 =?utf-8?B?TGsvdk5nVnlpL3lFZ2JHaTVPK0tUejh5V3BFTHA3S0ltZmxqdFpXdkZPbmtG?=
 =?utf-8?B?c1VMT3J2L0E1WE1ua3Q4ZXp1M1REYnEvNllVUDcrOEx1dEFNMXZmS0s4VnBV?=
 =?utf-8?B?SVR4ZkNCOXRXRTBOTGFjaUFoL1VBNm9RNWJuUnJCUjhadDRpQXhGcTh1UWRK?=
 =?utf-8?B?T0ZQV2R0WkNMN1gzaS9aNmRER1hoUUxucXRvN2RFbWo3ZzRhQjVIandnSk1n?=
 =?utf-8?B?UE0rbmIxUWVpaWFYUGRySEpab1JEbWpOUFA3NkJCblM2REZBNEVrWGh5S2x1?=
 =?utf-8?B?dUdQYnQvaXRWdCtlSDh3djVXazJHMnI2R3hrSzkxN1VuZlBKVGRwWHVneHNE?=
 =?utf-8?B?NVNrZTVkWUxYWC91US9jaHB1MDZ3ZXN5OVZwZ1g5T1M2S0lUUytvUkVsT3By?=
 =?utf-8?B?S25hTnZ1R05oNEozdmRJbk9VOUU5WVdRUTQ3R0piVW1lNXNSK1IvelEraUJ4?=
 =?utf-8?Q?VVEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3ZYeWlEdVJ3K2EwNk1OVDlhZTVseGdqb25zangrbm5DU2F3MkpXMksrVTdm?=
 =?utf-8?B?L2pCTFVwQURwOXhRcDZSN3dDb0p4akg2S0FISjZxRFZyT2NFekJxcjBlQWVD?=
 =?utf-8?B?L3I0Z0VzSUgyQ0NpaVlkMnErTEgyTVFHbW54OVpQdnFwT1VTL2NsUHUvOXBL?=
 =?utf-8?B?b0FJaTZjcTIreHVia0pLeWhlNUZHS2dXL2hrYkMvV1hCYnR1eW42ZnBseS9F?=
 =?utf-8?B?dktmc3RkUldRVVU3aHAzTkk1RTZRNzBqejNwTU1Db0RneXgwNWxXTEs2SW1G?=
 =?utf-8?B?c2tBM2Z3MnF3ZDBGUXd2QXVOdERDZE5iL1l6bVBqRXRBK0tIdU52ZzR3Vk9O?=
 =?utf-8?B?SVI4U05sK1R6RHFuM3dsc2xFOTdCa1BxRTJIZjMrd3Q0SkpkSmZVYVdBeDZH?=
 =?utf-8?B?Sm9BcVN4eWZQNjRRMjdpcFFRZ3hXWTFrUGYzWTdhZUswdjhyaCszQWNqbVhq?=
 =?utf-8?B?TVMydU5HVCtmVlU1VllPRWdmV0NHdjEyM0NzcVd2UDJ5OWJFdWVjL1VtSjBO?=
 =?utf-8?B?clV0akgwNExqdUwzbTlsemltc2U3M0UxendvNTAxclM0UkhncXFtTmxrNldt?=
 =?utf-8?B?ejd0aUlVeS9IdWpHbGxTVUVUR0pUVDM4TVowOWFCYjdRV1ZrV0VYcmQ0R1BT?=
 =?utf-8?B?ZVpvTW53a2EyNG5mMU1xK2JPTzc3UHBZYjNITHVZY1ZzeTR5UlNyUFRkMWtB?=
 =?utf-8?B?dytKTDNvRjQraWMrYm51ZnpTOUU0UEJxOUxiblMzdUdEWmdkQU1VK0hra1VK?=
 =?utf-8?B?V0lRSkE4eTQ3ZEovbjBUQy9HbU8yQjREOXlCY3V0SFErWlV2UFZNMnNncTZq?=
 =?utf-8?B?OHA4dUk3Qy96TzUzb2JjR29aSlduVjRaRWNYOFlCcG1KbjZWVEtRdnFTSTRX?=
 =?utf-8?B?QWR5c0RrTzhZMWVxdEFrNFNtZEt6U0RJaE5yazI5Q21DcitDK1pjejJZN3pK?=
 =?utf-8?B?d3owN3RyY002SGU3eFNqVis3REMySndhRElxU0JTYkRuaWc0eHl4dzg3UDRE?=
 =?utf-8?B?UjBoUlIyTmRGbW5HL1grdHdrekxKZWlBend0cHBvNzNhQUVWaWpGZkp4ZWhh?=
 =?utf-8?B?RXF5MDZlYml3VEZYK1ZrQWoxYlFrVUJWZnFQMEtFSkdUZmo1anV4S2txOU5M?=
 =?utf-8?B?Z3FOSzNxREkzd1UxZ0hHYWlYeDlENXBGWTlEKzlOamdScG5GREo1VGVaTVN1?=
 =?utf-8?B?ZDJlVGo0dkZMSDRya0NyZUdSUnQybXdtR0pUYzF5NzVrWFJRcjJCSFNPK0xM?=
 =?utf-8?B?Ri9QZFR2bW5nUk0xK1JxSDFuN3dCLzBmVlVDUFlwOWZRQ3p6WitmY2xsM3Rl?=
 =?utf-8?B?ZDNtZ2Mva25Rb1ZRc3hVZ2dMbzhxWHBqQXJIeld4ai9lWVlldWNjZzhiWDVr?=
 =?utf-8?B?UGMxMkZXU1o0VGJHeDFxWFAwYThuMTFaUkNLQTdacDc4KzhwREdVaDlaQ0lN?=
 =?utf-8?B?MXpPUUw5R2R5L1o1QWRKK3hXUDNwdHkvYjQzVTc4S0lnNGsrVTV5ejMwc1pF?=
 =?utf-8?B?VXo4T3pxMmh1SjNjTWU0bFFYSG50RG1jVjZqVFY0emI1RGg2VFBjMmRzRU1E?=
 =?utf-8?B?VzMzREFFUHdtcHE3UXlkTDJTQlQ3UVR4YnlnclhtQ1RnWTZBcURRKzB4R25u?=
 =?utf-8?B?NzQ0WWdqbktIZEx5SG92MnFmR2RPVzByZEpiMGhCWm9LSjlza2w2a3M5Qlpr?=
 =?utf-8?B?YkJ2SW1uZ25wMmJYMTdjZmtBLzJwaFl2RktKZHM3dzkxMHZ4bzArdFBxQVkv?=
 =?utf-8?B?Z2hGY2JTaStoS3QyOHJnUyszVUxXbzdUNllUVXhOeWt4S1ZrbDVuWjl2Y29a?=
 =?utf-8?B?ZjhTekZqcjZCczltNnZlWWp3QlNZdkI2bnh6cDNNQmJ2WUtwVzB5RFFxL0xZ?=
 =?utf-8?B?dTBRQjh1OVJrUXFxTDI2WEIxaDJCQVQ3UktQeE1kRCtBRTdqNWsvdnJoYnFh?=
 =?utf-8?B?aVJoZjRQcERyM0tIWlgydExrYXN5ZzlEOGE5N2h1Zk1GQTEvWTQvY0N0NkM5?=
 =?utf-8?B?bFFINjdJa3NVRGc3RTg2bjB0NFRSWTZEbFY3My91NUdWTWErMmQwSXBNNzZU?=
 =?utf-8?B?YWIxTnZhWnBOYzN2S09LRzlJUm9zd1hoVVRvR3RwaGFCWFNjb1NiRFFrR3JT?=
 =?utf-8?B?eURiM0hxU1pSTHc2RXlkTFg2ZjdHa0ZwZ1Q3Mm43U0R2d0hLWmhibElVVmV4?=
 =?utf-8?B?YXY4SFRJOEFCcm45NGJoQTFJSjN5S2J1RDVlTzFuQUdwdTdqZ0l3QnE1T1hM?=
 =?utf-8?B?ekdxdTlFUkd5TjhKZEk5eE0weThtREwwREJtbWNpK3RNZWRJeEYvVXZMdTBG?=
 =?utf-8?B?NzVJTktuMXBuczVJVkJkU3BhOHRaMFBqcnNPby9IV1pHaC85K3l3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44db18f-ec1c-40f2-4e61-08de5dada3c0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:09:09.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Skfwbim2HJRVngjMT8SET+wPGCdlxnD1+mk1fvy6WxGsl0fjtxbFeAuIvOZPFLtRMvJL7FUxcyEmV7gksJZLGptq+7YAq56LAlZZCG8cfug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7892
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A64D7955E0
X-Rspamd-Action: no action

On 27/01/2026 2:05 pm, Jan Beulich wrote:
> On 26.01.2026 18:53, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -503,8 +503,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>>  	if (c->extended_cpuid_level >= 0x80000021)
>>  		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
>>  
>> -	if (actual_cpu.c_early_init)
>> -		alternative_vcall(actual_cpu.c_early_init, c);
>> +	if (c == &boot_cpu_data && actual_cpu.c_early_init)
>> +		alternative_vcall(actual_cpu.c_early_init);
> Using alternative_vcall() then doesn't make any sense anymore, does it?

It is still needed here, because this is .text and is a Spectre v1 into
v2 gadget otherwise.

I've dropped alternative_vcall() in patch 7 where it becomes safe to do so.

~Andrew

> With it replaced by an ordinary call:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Jan


