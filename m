Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE9C5767D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161216.1489214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWRX-0003Oo-F9; Thu, 13 Nov 2025 12:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161216.1489214; Thu, 13 Nov 2025 12:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWRX-0003N4-C9; Thu, 13 Nov 2025 12:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1161216;
 Thu, 13 Nov 2025 12:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJWRV-0003Mx-Km
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:28:49 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d55db66-c08c-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 13:28:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7044.namprd03.prod.outlook.com (2603:10b6:a03:4f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 12:28:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:28:45 +0000
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
X-Inumbo-ID: 4d55db66-c08c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5v8t+t4nqMd7QfCcPUEaGl9p7CuahKdpi/Ub8qL5rSG46kEXDHzPYmF1VlF3CT8O228oiYfMbfOxJLgDZvgp8EMMH3coMhStuzdupsz/FVU0y28O9hqVJIwUnX2J0PcPxIdx2/AQzkM7zKi3gSzbNgVPxM1MCIr9+hA5yVft45mR3VXPscPWQNidfzuRuU99p4Q0gtw8o+t5nnUZv5JkyfFKUFvu15NyHjofaF6G+FA67xUqJVZ7S9QBc3bqxUR7u2FOSt1JEWj97NaPiHUId4o/FBkfDddcuhuhlkPGJX6fVK2JrVTwq9+mEKnC7b9fbnpeskDh1xlawMp3mxXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6JMsOPLIjr6xz8D3n0yDew57Ft76aEJyICVQOew04E=;
 b=rkN7kXok3j3OvxqMr0IdIwi6W4ULRbEMQUTKQR5B88lWiL32Ag8c2+pjWbjm8W6LVs5im3a8yFecBXaygzYJiPDRhVXZ402I4xWuE9BDpiYW/UrSsY1ePNtmdC0+KA0JvHkJtBwJSSRH4rbRysVIqucI5MtZlra9FvcjAU6PIqVcX8ezHtYpRaUrfnUADpfAVGJEFj8T0BqqTgXFJOHRk4yNNywSP3LXMVrbamtWlaZ3BGVtVF39C6kasWgIlhhEF33eurm0jkF63ZbrPLtoorkCYYat43T+5TbhPolci5fy0T1MUfMhyAYH4RdjB1yebCVp5FSkXjJwONeARgyyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6JMsOPLIjr6xz8D3n0yDew57Ft76aEJyICVQOew04E=;
 b=IMH246BbdgeLAybk1QN7/ds9TYO6nnDMb6ZclEfQVy3v1SMNHNbiIHi07Z7ZNoRSK3Me/nUqRK0S0P+IA+qDet1T+V9l3CO/fuedy1Z15q3NEu8BD32K9G1U1nO5J/0tnxYNxBSKcmg+CG7FljVqoCo5iLPSBCxdzZnKsxd7CxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <88523cc6-d069-4384-a5c2-e4399e389a41@citrix.com>
Date: Thu, 13 Nov 2025 12:28:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Rewrite the Tagging and Branching checklist
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251112185402.209485-1-andrew.cooper3@citrix.com>
 <9a949edb-8eb8-4984-adf0-4ab8b82e64db@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <9a949edb-8eb8-4984-adf0-4ab8b82e64db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 639dccfd-8634-40f3-92f5-08de22b0300a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkRYdGtvODlndXdvcThqL0lMYzR1SzUzZ0dxRzlNcWtPbXd1VS9pVlB6SXFo?=
 =?utf-8?B?WjlIUWJmVzk5bzdsQytpUjVVR1JzWUpHa0hqTnRrYi9LaDFzOEs3V2JqV0VS?=
 =?utf-8?B?UnZwTFd4QUdvcVIrUk1xQUJXN1ZId1MyTjhLNGNNZGlNOGxtV3ZTaGJvbnJU?=
 =?utf-8?B?d1FsUnNVdnJBZzgxd25RZmo0MWFYclRXaGJOZW9KUk12Y3lmNjZQTmVpZG82?=
 =?utf-8?B?aGhDVnlpL0hMNXBnTWsvNXN1eEs3Mk5JbzBjYi9qMVZBa2tScnhUckZuWGIy?=
 =?utf-8?B?ZXRWYjgvMEx2eTZFWTNaV0VTZDBIQjhMNEF2OGE2TGdTd3Q4a3JNRVgwL2la?=
 =?utf-8?B?aGwyODE2cFpURE5GN2JiL0VFS2lsVmswWmhiZUNzeGNGZGRYOC9tNlZCUUIz?=
 =?utf-8?B?UExOZWxmai8wNHpJVUtmT3AyY2JidFFnMWg0bzdQWStJd1Z1YzNOd2tvRTZ5?=
 =?utf-8?B?dm9rTi9qbE5UdERxMjdGWjFaQVhQTnNlOFhzK25mVHN2RVVqOUwrT2FUbU84?=
 =?utf-8?B?ekFjTmtnS1pjTVgxMVp2OEhsd1FjQXpRVGJUdktBY2sybnJJWUZSWW5adE0r?=
 =?utf-8?B?cjBHWnVuZHFQZ3dLNUIrU1FMTkdVZkdpNHJZNGFidVlXM05xZ0FVR1lxczJ3?=
 =?utf-8?B?eWlITWhoSW1NcVgwSEJyL0FQVjVYRkRXVUFPd2pWUjY3bWF1ak51NmRldDZy?=
 =?utf-8?B?MWxVQWxhajUwQkljREpORHVwUHF3TEsvbFE5NTBpcHppbXQ2U2owZWNtN2FU?=
 =?utf-8?B?dzRZZ2xNU1dUYVhRUU9hUjF1STVBTGpxSXdyZVU3MTBiVTlvRklnZm5aaFkx?=
 =?utf-8?B?YmJzcE1hZ3QvVG1PdzlRWDdrWEFTZWRSWHN2UFRQVThMdHdoMWlMZGNrRUR4?=
 =?utf-8?B?eUFyU3NlTEtQOEszRVpsQVZkczgvSDJUUWpITUNxRlpxT3MrQ000RWxXREMw?=
 =?utf-8?B?b2psN01RaXRTczVBYVB2cVBmWEdCNmdjZkN5MTh1Q1RwV3FtQTRvMDlsdVpN?=
 =?utf-8?B?dGV4VUV5aDFIcDlCbWpHY09pVTc1VEU4YVJzS21tL2g0OG13SDlucyt5dWE3?=
 =?utf-8?B?TEZyaGVSVDZLUndCWlhZS2o2TzNMbC9pdTM4aVpZVDk4c1dDWVArVThaY2Uz?=
 =?utf-8?B?RlRqWWxuNDdTZ2NRbTMwYXV3KzJ2akIzaTFJZ2dEWXNPWkgySGVJM05CRmQy?=
 =?utf-8?B?ZnRBUkxTN0JXelpSSi9DWUVRQnA2aVVwamF1T3crYTFtQk9yQnpvM1plbnM4?=
 =?utf-8?B?N2JhM3UxU1MvZUlvMGpXT1d3Rm1rL2V5SDY0V3Vhcm5LOTMvZGZxRWhJOW9D?=
 =?utf-8?B?Qm5HM0hoZ3M0K3hhSzZlbjhaWCs3YXFhYTNxWndoMlV2NkRqY0h6eGUwbFV2?=
 =?utf-8?B?bTVSb1pwQUowQ0NiVWI5VGpKanVJWDRCbUpjNXNDRkhLbHh0dDZZamNvcUtr?=
 =?utf-8?B?cXd6TnpDTmV4a2EwNmIwcElTZW9EcU1tKzM0TFhvWlhYT1RUbnZNQzJaUUdp?=
 =?utf-8?B?MmxkM3MxbmlCUjdQaERSaXQ0VEQxRUVWYVJmR0hFQldOWFp6OVBTK1VjT2Jp?=
 =?utf-8?B?ME44S2J1YytqMTIzYThrUU9Jc0cvVE9pUUNaaWRVT2FqV0o3Yy84Y1YvSlVF?=
 =?utf-8?B?Szg4N3diWHkzK2NPV2VJVUtKczNkSFB1QnZPQUNSOS82UWNTYXJRdkMvNHQ0?=
 =?utf-8?B?dExWaWdHYkRQT0Q2MFNqMjk2TkJPaVJsT1VickdMcWYwT1dRTDhYbEsraDg1?=
 =?utf-8?B?cHR5SFZTazdQdjNaNjFBOXhORjJpMUxvVlNRTzRSczIwdmJCdTJrNUNEYm42?=
 =?utf-8?B?TEVXMFhVbG9MTWhqZ1I4dHJXMTAwcUNHcnJ0RVVTZGZIVU5CVDBmbU4vV0d2?=
 =?utf-8?B?OGVNNnNWQ1ZiSVdRSmgzQWcwcnpZUXZDSTZMMWgrMjV4aDhJNjB5Nzh6NzdX?=
 =?utf-8?Q?X2RoqpIk7Pjocz7vM436aim1QRkIljdn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjhxY25Sc0ZNRTlFbVNLNTU0ckR3SEIwMFBkWmltT0NrNlNwVVpYODlWWHp0?=
 =?utf-8?B?QkhIc1N2ejBQcUR5RmtkcmRZQm9PVE1pNkZaMDhBT3liTHFMZG9HZnhBa0tk?=
 =?utf-8?B?Yjg5M1pOMGJWZU9mM3N4MUl3Skk5YitpNkx1OFBEeml4aVMvUjk3TFlMbW0r?=
 =?utf-8?B?cHB5NTVoeVlXNE10L0hZN0hMY2J4cmdqVDJZMnlySGwzQkRIbG5QKzVIeW0v?=
 =?utf-8?B?eVlCM0tTcDA2dHljUFZlMXNVN3JyWHlSVi8zd0syZndQL2pHd1EwRzV0bGdp?=
 =?utf-8?B?czhJdUk4d2duVFkrRGV2TFAveUhWNVZqM0V5REtpTUNaVHR5c1Jna0dtaTVO?=
 =?utf-8?B?b0VUUHo1WnNDTFUvc0p5bTZVYnIwNVJSNW4vT2JQVUJ6Mm9JbWNWMm03SWZK?=
 =?utf-8?B?VkNtT3ZOU2ladVk2M0xVV01nZGVOQW52cjdPeTMwWlJqQi9ERDdGOTlScmJr?=
 =?utf-8?B?ck1DcjNoRVZJZVlPZWhvTExVUzU4YmRlRmE3NFdaVXRkNlhud090cGM4R1Qw?=
 =?utf-8?B?QTAyT05SRXlOZ0t2MGdQQURGMGlvL3RWSndMUmpUQXhMbWd3TlF0S0oybjA3?=
 =?utf-8?B?YWgzb2J3aG45US9reFVkQmJnTHp3YmNPWkJ6R2ZFdEdVczZXOVV0L25JSllX?=
 =?utf-8?B?MFcwZ1ExYWgvbjQ5TERiMG1KbzZ3T1BwOWlCWjVpL0tJSkxlWHFoWUx4WGNM?=
 =?utf-8?B?YlVIOGV6VHdFK1ByY3dLMGFqUlNlOXA4VG53UmxBSFZkWEhIdkZXU2hYOHF2?=
 =?utf-8?B?VVdOaGpxTjUyb2xIRTNBamtWc0oxSTI4Q3VmUGoybkthVHE2TlFJZ3hCZDl4?=
 =?utf-8?B?U0gxOUR5TnUzN0tDeGFMRXVabm12ZGlhNmdoMitRT09EQWpPbHZ1ZTREOW5m?=
 =?utf-8?B?bnFJWWJRK2F3NStvaDRXdjJnZXZGZjMycU4vV1JibEhxUms3bzdqUnhnZUdQ?=
 =?utf-8?B?OEZWYnJneGQ5Uk9GK0ZoSW80ajg2QUJKVUFHYkM4OVBVUVVxcnpudFVEVFpD?=
 =?utf-8?B?a1V4QzhoSE5kbzNjYUIxVGZGZEdsZ2ZMUGUxUk0yQ1FKU2w1Mmg0cmtzVWU4?=
 =?utf-8?B?Y1NYYlJHejhHQ1gwaDhqb0FNQjVDVjBlOWh3RDd0cnloZ1dlcWgyQXVVWURR?=
 =?utf-8?B?N1hNOFdOWHMrTENqczN5Mi9saUdaUVMyQlpwUklKUC9nS2swNlRZOXdvMEZG?=
 =?utf-8?B?OG1GdTkxTVc0NDkvc1Z2Zk9BRmtqa2FRM1NTM0JpOWJMeEhmMEtYazJwSWZL?=
 =?utf-8?B?WDBVb0UrQTFFR1B3WmhSZDNDL3ovNXhKQjYyWWFpRnYzTkhDMTFRUlRKdWo1?=
 =?utf-8?B?ZzhvT2ZjTEtZekdGdmJlZDBOQ3cxM2ViZVFoczk5c1RDVklYMHRmMVFIU3JK?=
 =?utf-8?B?VkdPT1Q5S083L1g0WVFqSDJWRmxoYk11N2NaVkMremFLK2JRajRoTk5paS85?=
 =?utf-8?B?bEJNT2ZhbFVXZDJqZW4xZmpSeGNPNDFucHlqU1JlYlhOaUhSRkFET3VzZy92?=
 =?utf-8?B?VVByVUxXcCtTdFh4YkZYaFdXbmszS3pURm5kV2N0b0FoZnp6eDA2YmNzMnUx?=
 =?utf-8?B?QUFWejh3OFNxRGdmVTZTSW9KcEFlWjY5Wk90RE1oSjl2VnVVZWErR25jaVhJ?=
 =?utf-8?B?VXlSOWh6Q2ZHOVhUSXdXTThUM29NaHhzbXNqelVyWEc2aFBzT3B0Zm5TUDF0?=
 =?utf-8?B?ckFaR1JHMGFCMzBJNVNFSXR2R09ub0dXd2FSQ2lMaUZEK0o4UjBGRENTZEo5?=
 =?utf-8?B?ZlZEQ1VscjFPV29CbWtuM3Nndmpkb1R3THhFK0Fkd0ZJdVh4bWd5Y3E2T3RU?=
 =?utf-8?B?cThSV1o5QjVNWVVHWnFJV01jdkRrOFgwRTJuZU50d05YNDlwTjN6NGdKaEY4?=
 =?utf-8?B?emtQWmVBRUxtMlE2SEFFNnZLalR2S2I4L2JjakV0MFZ1dUsvZXl5VnpEaGRj?=
 =?utf-8?B?dS9RSVd4eGxlV1R0R1BoTm1sa2tYOVBIVkxBYThUL2dYQVh1c2xVd0JjSGJw?=
 =?utf-8?B?SFo2WnZ2MUlGVVNYbVM2YnQ4YVBYMnZVMVJ4aWF2b0t6SU5zWlR0MkkyUlZS?=
 =?utf-8?B?aVUzTUZZY1NPbW5ZR2RrREw2OTVxR3BXTzExeVhvQzFOVjFNbzgwSHVXWkg5?=
 =?utf-8?B?MTF5YXU1SmM3NldjRlhVQzkyRlRPTTBqdzM3NjJNK1I0UVVVbXlJMWw2TENV?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639dccfd-8634-40f3-92f5-08de22b0300a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:28:45.0790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXFF/jqxSq/whaCq23LWJvnxzgiGOMQAVrwvKQmmBVt+LAF3KvpiUNp4t22wUa4uWm6NGKWTqArx27x4JenoQNEsE7j9XVBEdRoi6Ascd4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7044

On 13/11/2025 7:54 am, Jan Beulich wrote:
> On 12.11.2025 19:54, Andrew Cooper wrote:
>> There's a lot of stale information in the current checklists.  Merge the
>> documents and present the information in chronological order.  Provide real
>> examples from the tree rather than trying to be too prescriptive.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Hardly anything is being said about stable releases - is this intentional?

Is there anything you think I'm missing?

I suppose the releasing section is slightly specific to new releases,
but for the stable release, it really is just bump extraversion, commit
and tag, and where usually tag is the only action after you've prepared
the tree.

>
> A few comments below, but ultimately I think it will need to be Julien to
> ack.
>
>> --- /dev/null
>> +++ b/docs/process/tagging-branching.rst
>> @@ -0,0 +1,194 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +===============================
>> +Tagging and Branching Checklist
>> +===============================
>> +
>> +Before starting
>> +===============
>> +
>> + * Review this checklist for changes during the development window.
>> + * Access to the following necessary:
>> +
>> +   * The 'xen tree' signing key.
>> +   * The xen and xendocs users on xenbits.xen.org
>> +   * The downloads-cvs user on mail.xenproject.org
>> +   * A checkout of the xen.org CVS repository
>> +
>> +::
>> +
>> +  cvs -d downloads-cvs@mail.xenproject.org:/home/downloads-cvs/cvs-repos checkout xen.org
>> +
>> +
>> +For RC1
>> +=======
>> +
>> + * Pin ``QEMU_UPSTREAM_REVISION`` to an exact SHA.  Commit.
>> +
>> + * Update ``XEN_EXTRAVERSION`` from ``-unstable`` to ``.0-rc1``.  For
>> +   ``README`` and ``SUPPORT.md``, use the slightly more generic ``-rc`` so
>> +   they doesn't need to change during subsequent RCs.  Commit.
> Nit: don't
>
>> + * Tag.  Produce tarballs.
>> +
>> +e.g. from Xen 4.21, ``ffd25d717a74^..d1478321eacb``::
>> +
>> +  * d1478321eacb - (tag: 4.21.0-rc1) Update Xen version to 4.21.0-rc1
>> +  * ffd25d717a74 - Config.mk: Pin QEMU_UPSTREAM_REVISION
>> +
>> +
>> +For subsequent RCs
>> +==================
>> +
>> + * Update ``XEN_EXTRAVERSION`` to the next RC number.  Commit.  Tag.
>> +
>> +e.g. from Xen 4.21, ``eff32008be0d`` and ``9632ce6fe5b2``::
>> +
>> +  * 9632ce6fe5b2 - (tag: 4.21.0-rc3) Update Xen version to 4.21.0-rc3
>> +  * eff32008be0d - (tag: 4.21.0-rc2) Update Xen version to 4.21.0-rc2
>> +
>> +
>> +Branching
>> +=========
>> +
>> +On xenbits:
>> +
>> + * Create new staging and stable branches in xen.git.
>> +
>> + * Add the new branches to patchbot.  In ``~xen/HG/patchbot`` copy the exsting
>> +   master and staging reported heads, update the ``versions`` file, and commit
>> +   the result.
>> +
>> + * Add the new stable branch to the docs cronjob.  In ``~xendocs/cronjobs``
>> +   edit ``xenbits-docs-all.sh`` and commit the result.  e.g.:
>> +
>> +::
>> +
>> +  ssh xenbits.xen.org
>> +
>> +  cd ~xen/git/xen.git
>> +  git branch staging-$v staging
>> +  git branch stable-$v master
>> +
>> +  cd ~xen/HG/patchbot
>> +  cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
>> +  cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
>> +  $EDITOR versions
>> +  git commit -am "Branch for $v"
>> +
>> +  cd ~xendocs/cronjobs
>> +  $EDITOR xenbits-docs-all.sh
>> +  git commit -am "Branch for $v"
>> +
>> +
>> +On the new branch:
>> +
>> + * Switch to release builds by default.  Commit.
>> +
>> +On staging:
>> +
>> + * Update ``XEN_SUBVERSION`` to the next version.  Update
>> +   ``XEN_EXTRAVERSION``, ``README`` and ``SUPPORT.md`` back to ``-unstable``.
>> +   Commit.  Tag the start of the new development window.
>> +
>> + * Rerun ``./autogen.sh`` to refresh the configure scripts.  Commit.
>> +
>> + * Switch ``QEMU_UPSTREAM_REVISION`` back to ``master``.  Commit.
>> +
>> + * Create a new section in ``CHANGELOG.md``.  Commit.
> Should this really be four separate commits?

It is and has been for a while.

Folding autogen into the version update might be sensible.  Everywhere
else needing an autogen does so in the same patch.

But, I don't see it being sensible to fold the remaining thee patches.

This also begs the question of how we indicate a planned change from the
example given.  Maybe "Note, example is from prior to deciding to $X",
which gets removed when the example gets updated?

If we're going to do that, I'd want to make it a separate change to the
main rewrite.

>
>> +e.g. from Xen 4.21, ``d510f9c1430c^..62d0a92057ca`` and ``d510f9c1430c^..b0255656d121``::
>> +
>> +  * 62d0a92057ca - CHANGELOG.md: Start a new 4.22 section
>> +  * 7b88e463f999 - Config.mk: Switch QEMU back to master
>> +  * d954e8c5c8de - Rerun ./autogen.sh for 4.22
>> +  * 85768c28b705 - (tag: 4.22-dev) Update Xen to 4.22
>> +  | * b0255656d121 - (staging-4.21) Switch to release builds by default
>> +  |/
>> +  * d510f9c1430c - doc/man: Align list of viridian default enlightenments with libxl
>> +
>> +
>> +Releasing
>> +=========
>> +
>> + * Finalise the release dates in ``CHANGELOG.md`` (backported from staging)
>> +   and ``SUPPORT.md`` (only in the release branch).
>> +
>> + * Tag the release in relevant external repos, and update ``Config.mk`` to
>> +   refer to the tag.
>> +
>> + * Update ``XEN_EXTRAVERSION`` to drop the ``-rc`` suffix, and update
> Since further up it's now rc<N>, imo it would be better to also say it that way
> here.

One thing I found very problematic with the older checklists was the
excessive use of variables.  In this doc, I've got it down to two, and
using the examples to clear up any ambiguity.

Would "to drop the RC suffix" work?  This is supposed to be clear that
it means rc and whatever number we've got to, but rc<N> (especially
rendered as a literal) doesn't help IMO.

>
>> +   ``README`` to match.  Commit.
> The latest here QEMU_UPSTREAM_REVISION and MINIOS_UPSTREAM_REVISION also need
> adjusting to reference version tags, aiui. Taking tag creation in the respective
> leaf trees as prereq.

That's the previous bullet point.  I should probably make it clearer
saying ``*_UPSTREAM_REVISION`` but naming more specifically like that is
going to bitrot.

>
>> + * Tag.  Produce tarballs.
> Link to the respective section further down?

I considered that.  The linking syntax detracts from the readability as
a text file, while on the rendered version it's clear from the
navigation panel that there are relevant sections.

~Andrew

