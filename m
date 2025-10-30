Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D2C20026
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153610.1483914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERld-00030Z-Rm; Thu, 30 Oct 2025 12:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153610.1483914; Thu, 30 Oct 2025 12:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERld-0002xv-OC; Thu, 30 Oct 2025 12:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1153610;
 Thu, 30 Oct 2025 12:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5IGd=5H=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vERlc-0002xn-JH
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:28:36 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3959449-b58b-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 13:28:34 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PR3PR03MB6587.eurprd03.prod.outlook.com (2603:10a6:102:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 12:28:32 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 12:28:32 +0000
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
X-Inumbo-ID: f3959449-b58b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuFog7yvIjV6Dy7baf+7rLtEjGSmEazA9URt0ZC1BYfY+ZeDgCWayxAjd05nLRwZLYvu6dPhDu008blGNLRW1qyfkXJHJQOBN3Ob45EqEcS4r/jdfRnR0v7YWALsMOf/Epv9MU575Aorf+H33X4VKIhoynVb3JUb0sIy3gjDRXqgtUnb/we7TitOzP36HLWCHLis3J1dwY0KBF14CtMs0mTR1Osx7+fSBd7yWG30J7ei87MWgShdHc3oEQ3Js9hk5GYHCEdQo3KbLcYi/r5LWkghrTbTTMgPDm94RPoBi7CN7reH2FG5taRjMLUHkkHCdF9PaSziYVvtMeAE6AoMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc8Wds2UavOFdVdE+qJU60sLRP7PXe8BQQSfiXJGjHw=;
 b=I6UVFuQj8CjFsStVs12hhaLKC18AlfAYKqmkRSWn/pofZxjXGTmPWwYNOEn06ys8kbrQ3GAOCV5h6zA5Lxfl8LqglNlBasc16cmyvGOi4Sp1nMhFSUoaUSt11QHm8xqN8RmO7KPAgEFgGlN0SwUJjoXa6fXxo46tL7KcST8s0ZRfdQCEszsFGCBzK2dOKEjKdcna/KstPW/8BxKssgu2IgzKa/CgrqpijXRgVVzDMmiwwequxtJ9xlns9CMTXmgmWoaAQ2DV8NPZU0FwYwUan8nufvP9/7Ac9e7wkENLGRGgXB2bqTjgZAJIw1t0ylC9AhdUZ9XICQaFWIxGjbhiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc8Wds2UavOFdVdE+qJU60sLRP7PXe8BQQSfiXJGjHw=;
 b=jYBbraVQy8y9p6pW8Zo54tWjgCE3QX83tgo5HJbB4yr4jFtcu7DVLnW54zpPF3Gn1QjHMbqk2BbRldAk51Yz6T8C0/sGQUxFDyJ8dB/kD+jJYQxfZmzCbguufWZ6k7EJQwBfudrjvDbFysXEDcrxdr4jOrt+RF9LQ36nFRx0NmrdKCo6sQU/MuPtznkfgVwH6YFRHLEX1QcZgBIMQhL1bNdq+pCOiQFJq1PIT7cEbC/6oG23bIkBd/rkoZF+k88UUVZKhYe4mH2mtXxsWyBdlkaIl7UZPMfFPDEsJpLZR7Cv/FKnKIQtYBnsuaKQOcZ/MUtC3h7R6tl1CnmttG0QUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6373016f-9558-4d73-918e-4251d16643ef@epam.com>
Date: Thu, 30 Oct 2025 14:28:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/3] x86/hvm: move hvm_shadow_handle_cd() in vmx code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-2-grygorii_strashko@epam.com>
 <308ecf14-e831-47f4-8c64-4005bb4dc857@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <308ecf14-e831-47f4-8c64-4005bb4dc857@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::18) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PR3PR03MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 769ee19b-ac5c-493e-269f-08de17afd67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S083dm1Mc2FGc0lsZ2JVTHpCaHZOSEpDUktEV0p4TTBtYVQvUHQyZWpKd3Fa?=
 =?utf-8?B?TFJCMTJ4NjFFaXFCTHpuM2FzcGJwRENpeTVPVFpxazJROTU3a3orTVhkVkpB?=
 =?utf-8?B?eUZLWWUrOWFIQ0cyYjhGb3dWUlQvTlpFR2lpcUhucDQxeGhFOTRNb2VaMzky?=
 =?utf-8?B?YWduNTB3TDZLS01DYTVBakZROUlvRmliMm5YKzdnU3h2dzNIWngyT3lIbkpq?=
 =?utf-8?B?THE0THZ5TkMxazVrRW1yakFUZTB3MTM4dlhnb1dxcFkrK1RRYWd4eHdFeUo3?=
 =?utf-8?B?WlYyZjF3NVQ1cWVpanpROWdTNEJSYURVNUFoekw3WElUM2FOZUhOK3JYbkcy?=
 =?utf-8?B?UFRlZWJPRlQ0cmk1RnhmSklSNVo3NUVTNG1kYmpKdTdubzNrd215Mlp5MXNN?=
 =?utf-8?B?UkgxMzBKak1xT0F3SVJ5YmlvTUZraFdIV0p5UU83dVNlS3hHUVZ5YXpITUY4?=
 =?utf-8?B?Z2xTaGxRWUd5dnpKNUZ1bWZJeGJPY2xlem95MnhWNndUNFMzMDlKYjBNeDdv?=
 =?utf-8?B?R1RGQ2NrSTFYSDlUUnFhUkM2RkpuTWZRZjZqOXp5MGhnRE85a0hiUzBraFZY?=
 =?utf-8?B?Um5Gb2N2bnozMWdjQ1dLcFhZeXVUKzdUZ3RlL00ybTdXTGZQQkluTFZJYXU1?=
 =?utf-8?B?RVFjTVZOcXNjT3JmdjBjQnhHR3FNWlNrR0RQNFl2OGsxdzRhWGZaNG1oQzRF?=
 =?utf-8?B?ZURwcVFDQTRxMVhaR29STjVheDdLSHFldVJUam85bkNHVDlMQ2IrcXNzMUF0?=
 =?utf-8?B?aUVnNmlhTEI5Sm5KZHJabG0yR2hjU3BMTFhWZndJSVVhUlhycnd5emtHelVR?=
 =?utf-8?B?Zk5haEZDS1hoNThmQVRjV0JEdWM5Yk1iMjlENVIzVittUHJCZTkrektZdkhH?=
 =?utf-8?B?M1UrZ3lzSEJwV0xXNmszZmZGL01CQnc2OE5FalIyMnpwQmY0ZlFMVTlJMFY1?=
 =?utf-8?B?TE5nQUltL25EN1MzZFFDeks4c21FVnJZODZZRmM3RE9xRlNUcDhhWHlqS1ZW?=
 =?utf-8?B?LzBqR2N3aUgrYlZpbW5UREJpZmdzUDk2dmo5aVJ0WTU0K2FodDlYQVkvb3Nm?=
 =?utf-8?B?eXFURG54NTZIdHE1aUFERDNmQzZ4b252cDVGMzlhbmxCNzVLVlNHR1lLelg4?=
 =?utf-8?B?djArMlFQQWM0Y0xidmo3aTBrNTYwRG53VmNaQmxENHhFN3RzczdyTXQvVjNB?=
 =?utf-8?B?VlNtYW91UFJ1R2ZNZXI2bVQ3a1ZJbllGRkFqMjg3UmVzWTcydGVQTmI0VDBk?=
 =?utf-8?B?Yk9NWnNjdGV6aXFINkRRMXZyVDYrZncwTk0zeFdZNlNxRUpXUEd6UWVoYUNk?=
 =?utf-8?B?SEtWSGoyWlh1dkxnUTJ0eEZnc3ZoVmZRY2xFcDVvb1NVTXI0TXJDd2o5Z25o?=
 =?utf-8?B?bjBVUkV2ekR2L2M3OXRHWUtpRjY0eHRocThFNXd6eVBNTzlwbE0xMXpvWFNR?=
 =?utf-8?B?VFBHTGowRXhaZkwxNDFXUmpnZGtOVXVMME4zY1EzSFRrTkM2eTc5VWJ2NEhY?=
 =?utf-8?B?SDJOY1N6MHliczdmbTN6U2E1NUVkTzd4R2hIQlFVZzhhTGdveWtDd0JlVER1?=
 =?utf-8?B?QStoejM3SFdROWltdUEwTVlmNGhHZWtvbGkyMGNHSnpzMlY5VzRROFYxK1Uw?=
 =?utf-8?B?YUV2UURYWVNqM2dIL2pvUkRERTFKWlBqN2hBbW5HTVROVU5TSEQyRlpLY0ZE?=
 =?utf-8?B?NnBualJFWi9SbVhYdHVadkF1VE5RU3V1aEtXbDhZR2pnQ2N5dWFuNVpqSjd6?=
 =?utf-8?B?b1JGQVg4MzUvckF4ZTZlRmJia21QSUh4UEx4OCtYZUZuOUxPTUVIc1BrdHBl?=
 =?utf-8?B?Q1NyU1ZEb0FwZUN6ZnFEMWhUTG5mTVYvUmR6VXh2YnMrOG40NzFkYVpJbEJU?=
 =?utf-8?B?Z0FISm9oZFQ2bDJ2RCt3Wk9iYnpxenRRbERyY0xRcFFEUG5HWmRtdVEvWURm?=
 =?utf-8?Q?BwkvWbEXyUgz+66NUtQU7OSA0d7qtCwO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkxnZmpoeGYvWm5hZkdtcC9lVUtWWFJ4WVlKbEQ0UlZ0MDUxN25tQ1FNTFB2?=
 =?utf-8?B?TmtJS3cvR1lsSFhVT0tTNGtJdFBKUkZ4aHZWUGxlelliNzlDcllldGlHaUNO?=
 =?utf-8?B?Ylg5U0xiNmd5MG96MmVxOHlCdmNzanJYNlNabVlEWkR3QytMTzJWejFFZWlO?=
 =?utf-8?B?VENqWmtHc2hIQytpazNVYnZCMEJJempsOExFVU1kaEQyOGNhcmF2T0haOGZV?=
 =?utf-8?B?aGp2MFRlWmMxOWl5YUIvVUVhYXlmM2dqNWlFcWRwWEdLNEZkS1kvR2NtSCt6?=
 =?utf-8?B?RjcvcWhGbzN3K0JKWlhHWDVWUWlkV2NSeHptNUxURWhqTzRkZFNaemlOei9G?=
 =?utf-8?B?ZE4xdEQvMkJiaGp0ZUZQWVhiVjh3YXNtNjN3Tm4xVWluMG9seW1MazM1d2V4?=
 =?utf-8?B?eStkM2pKd1FnVXJFQnBnQXRiajZJdVZlZzAwSC9GQ3VGY0NQMmJIS3pVNVlD?=
 =?utf-8?B?NmxTUUJ5eTZEdkNSN3RjdW40VzVDQUVrU0FReC9hYXB5bnFleVk0YzZoSjRy?=
 =?utf-8?B?QjRDNTAxQUdmbVNMUUZNSWZMVUxpTFgrNU5pQk1uTlhHRy9sNmVUT1MvNEdC?=
 =?utf-8?B?ZTI4MnZzUXFjVHd4TXVsZFYvVWxiYWpaak9qU2w0SVVnMkdpSDdHTjlRZ2du?=
 =?utf-8?B?Vk1YaTExMVZENE9HRnRsWVhuSUdPWm1ORFJjSmpuSFZyWUZORnlOMWxqK3di?=
 =?utf-8?B?eHZ5NmF5alp0YXk4UmdkcFRzM1Q0NGRYWDV0N1RDdGdJakpwd0RMSTBXSUNW?=
 =?utf-8?B?bDYycjR1akt5Zm5WZ05qZzZ1aUlaOVV3QWFpZnJ3S3kxSFkwRHlJUEdNUG9w?=
 =?utf-8?B?eUZKMWFhQ29lamVlOVl5TDdJYmp3RVRaOGhKUGNGcW9TeGNsT0FFbUxRUWpL?=
 =?utf-8?B?RFo5WFQycDRtdFNxaTM2SDZsYmd3bjY3bGpDQi8xUkN4aW5MMXhKTTl2QmU4?=
 =?utf-8?B?WGZWL01SbjN4bXBWQWw0b0ZQbGl1dkUzbkdDR01BU2VCODUwdWNJeWVSQm03?=
 =?utf-8?B?aXg5cE5nKzFFNGpYR2JGZk4zcTVRanQ0RzJiZUVpZE9IRFZZWGk0YmRsd01P?=
 =?utf-8?B?dUxmWTdhdTRmUnBaaWxzL2NJU2tDV2ZiOHhhZmYvNTNMRzhsK0dEZVlmQU5H?=
 =?utf-8?B?MzlodUhBdkEwdXFrZVcrdHlVS0diUFFVYU9ZUnMrV2VrK0I2QlRoSFhFV3dr?=
 =?utf-8?B?ZmhUTDRPSHFOYXcwME1VekFueit5ZEhXcXBQY3RZOG95REZUZEFCM0M0anJ3?=
 =?utf-8?B?bWdVMUNNM1Y0SnZTaElWZFl5R0tZWnZOMVIveWpkTGgzWE5WU285eGR3UDlN?=
 =?utf-8?B?QTdERFovM2ZGWEVSaGV6MS9HQU93QkV1cG9iUGhoMXFSOWQ1SnJKOGtnYmt3?=
 =?utf-8?B?dVZ2VkQxUm9SZUtGMnNFM3loS1FZMWEvN1QyNDB6VFdodDlnajRFRzlaWkNx?=
 =?utf-8?B?VnZpY2hPazN6d2xCenkwNHZaSzFJeUswMEN0bXFTSnVaQ0Q2UVp4R25KWlU0?=
 =?utf-8?B?bzlCWC9Sbk94K0x2VmJoWDU3RVFiU0tYYTRyTnFkN0sycHNUL1N6Y0Zyc3BQ?=
 =?utf-8?B?bGJJQWIydjFXcVBvNTQ0QUNVVndyK1ZkRmJ5Sm8zQmZReHRoNXlYaTFiWldO?=
 =?utf-8?B?KzA0VGE1SlJ3Z2Zsdk1NY0lxTXUxN2xITjFEVGt1R1FTeklLdFF1OU1YajJQ?=
 =?utf-8?B?OWY2UFZPZ2FscEFPTlNjTWcwdFdHOEZiRE9YblZOUDRLTWZNZ0x5RUJXMStY?=
 =?utf-8?B?YkRzY3Z6d2tiakRkU2Fkem5QY0lQdE1rVUhnNnZGakFqcXRlVmdmQkNxdjJn?=
 =?utf-8?B?cVl0R2xUcnZNb3JHcG1aQmZ3ZnlTajBxTnYxdW5uNGlNWGlGNkV0U0NXNmJG?=
 =?utf-8?B?TXVISVVSYVJGSUExWnR6OFVSRnh3cUJmVWtmakJWcVdzdHpLWitMdTQ5SWll?=
 =?utf-8?B?RlZuWWptS2V1cVo1bWdBY2JBUkFna09YZUN5Z1RmRWR6eUhBZVRwZmF3R1Za?=
 =?utf-8?B?K0dhcy9yRURUSy8yQUJkUUpqdDVSMkFsRUVqc1J2ckpMM3Z5MHp5Nm85dmdw?=
 =?utf-8?B?K2ZRUjlsRno0MlZXSENNcVdSMUwwdnNXUTV3VGg0Qms0Tk5lTXdldE53WHRX?=
 =?utf-8?B?T0JmNEhqdjVNSzFsaVZFS0JkR0paekxYa0VTS1lnUDUxRWV5MjJCa0Rtczc4?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769ee19b-ac5c-493e-269f-08de17afd67d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:28:32.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/ZaH/c6kYO2k2qSAs7SEAycXHEgIDwGqAqmgee6+eE9gYUhbZb11zM4rLATR3NIcCZLRnb1+dMsSWtpkqOXsnCOaUyi6Nx1/EnaUc26ehg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6587

Hi Jan,

On 30.10.25 13:08, Jan Beulich wrote:
> On 30.10.2025 00:54, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Functions:
>>   hvm_shadow_handle_cd()
>>   hvm_set_uc_mode()
>>   domain_exit_uc_mode()
>> are used only by Intel VMX code, so move them in VMX code.
> 
> Nit: I think both in the title and here you mean "to" or "into".
> 
>> While here:
>> - minor format change in domain_exit_uc_mode()
>> - s/(0/1)/(false/true) for bool types
>>
>> No functional changes.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> You did read Andrew's request to also move the involved structure field(s),
> didn't you? Oh, wait - maybe that's going to be the subject of patch 3. 

yes. it is patch 3 - It is not small.
And I really wanted this patch to contain as less modifications as possible on
top of code moving.



>While
> often splitting steps helps, I'm not sure that's very useful here. You're
> touching again immediately what you just have moved, all to reach a single
> goal.
> 
>> @@ -1421,6 +1422,64 @@ static void cf_check vmx_set_segment_register(
>>       vmx_vmcs_exit(v);
>>   }
>>   
>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>> +static bool domain_exit_uc_mode(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct vcpu *vs;
>> +
>> +    for_each_vcpu(d, vs)
>> +    {
>> +        if ( (vs == v) || !vs->is_initialised )
>> +            continue;
>> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
>> +             mtrr_pat_not_equal(vs, v) )
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
>> +{
>> +    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
>> +    shadow_blow_tables_per_domain(v->domain);
>> +}
> 
> Similarly I wonder whether this function wouldn't better change to taking
> struct domain * right away. "v" itself is only ever used to get hold of
> its domain. At the call sites this will then make obvious that this is a
> domain-wide operation.

Agree. but..
In this patch I wanted to minimize changes and do modifications step by step.

I can add additional patch such as "rework struct domain access in cache disable mode code".
Will it work?

> 
>> +static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>> +{
>> +    if ( value & X86_CR0_CD )
>> +    {
>> +        /* Entering no fill cache mode. */
>> +        spin_lock(&v->domain->arch.hvm.uc_lock);
>> +        v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
>> +
>> +        if ( !v->domain->arch.hvm.is_in_uc_mode )
>> +        {
>> +            domain_pause_nosync(v->domain);
>> +
>> +            /* Flush physical caches. */
>> +            flush_all(FLUSH_CACHE_EVICT);
>> +            hvm_set_uc_mode(v, true);
>> +
>> +            domain_unpause(v->domain);
>> +        }
>> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
>> +    }
>> +    else if ( !(value & X86_CR0_CD) &&
>> +              (v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
>> +    {
>> +        /* Exit from no fill cache mode. */
>> +        spin_lock(&v->domain->arch.hvm.uc_lock);
>> +        v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
>> +
>> +        if ( domain_exit_uc_mode(v) )
>> +            hvm_set_uc_mode(v, false);
>> +
>> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
>> +    }
>> +}
> 
> This function, in turn, could do with a local struct domain *d.
> 
>>   static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
>>   {
>>       if ( !paging_mode_hap(v->domain) ||
> 
> Why did you put the code above this function? It's solely a helper of
> vmx_handle_cd(), so would imo best be placed immediately ahead of that one.

Right. Hence vmx_x_guest_pat() are also used by vmx_handle_cd() I decided to put before them.

> 
> Bottom line: The change could go in as is, but imo it would be nice if it
> was tidied some while moving.

I'd be very much appreciated if this could happen.

-- 
Best regards,
-grygorii


