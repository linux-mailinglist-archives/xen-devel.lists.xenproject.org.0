Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9560A4BBBE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900095.1308018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2o5-0007KQ-DD; Mon, 03 Mar 2025 10:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900095.1308018; Mon, 03 Mar 2025 10:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2o5-0007HI-AI; Mon, 03 Mar 2025 10:13:53 +0000
Received: by outflank-mailman (input) for mailman id 900095;
 Mon, 03 Mar 2025 10:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp2o3-0007Fn-01
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:13:51 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2407::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 322870b2-f818-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 11:13:48 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Mon, 3 Mar
 2025 10:13:45 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 10:13:45 +0000
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
X-Inumbo-ID: 322870b2-f818-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCE4rvbA5rbKo+G5x2EFPFmdZVRqJ/qlfb/F44nI98AMurNOq6QDvfmbidauw3AU9OkH3uc1MjOzOiWpCoHi/2rcssR4wK0ntBa0QAxr0Lz/jecuMEiphtmbKOtDZ60XHl4CW4/JQbqkT9oYOKVCi/sHAt4yc71Pqv7Ca0qZz6aGir8VZzA/ShPiEzVn0nv8T8wEYRj9LcMPDjZKY9a2yZ0wSLWDx2iDHwVJxiVw10WYs8lUnUuqzxwkGL+To8hOTfC+9zzVC9FEj7Al3cUooRhrZ2DjbAaxoW1cMU5REAUGbYs04YqIkyFKuW74odDPAiAJCU+mF7f8Ne2IxRhlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tI+GWHjQEm0xV2VMnKBjH49S4VCnf/d/i53rHzMg10o=;
 b=qzmAEShAZ1zJ9wQ03BGIMSHAD9GvPbscb6/M0EashRxDYuRi92d9NWdJlQGZDKlSLOtlOitJoHi1Wadyxm0OKqaWXgl3A9Ye/bTmwKKvyot6dPUtSkrl7rkWi6/yjq/076SzNdcKBEM2z8seOGM9QJoOB3cRRorET18tKxgLuC6PAqUTDdRe8DqZ+1G030XsjQW8tiGGEC01aO0XmaOQL8/lBcBL/fRMKjTSQ95dJmnJwia0/cc0Mps9rziNrWMMX8H1CJObUm7lgEovxeenChOIdAKt1ZIMontZj1eRFW1eU/Denb7UCN0Mypf3v4/3y7GBltMrLF0/eOEmAROkuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tI+GWHjQEm0xV2VMnKBjH49S4VCnf/d/i53rHzMg10o=;
 b=veaKSTF5Ng3+KkiM8LrU6owo5rfK354/l2l7dUaw1LYLF0K+yH24a92sa33B0PnaN0yLkTNu9nYXutoGIM8IS/bG3orxpJgApOHI0DWE4qJNix7lauvioYYgEyhluu/q4nHHBlHMQ6uOgJafGklnq/bFXkUU2LvEKFhNhNFMJ4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <91efefb1-11e3-41d2-a098-3124cef6578e@amd.com>
Date: Mon, 3 Mar 2025 11:13:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix platforms Kconfig indent
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <449a9f85d07aca65f607944c4bdab850760c9445.1740996436.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <449a9f85d07aca65f607944c4bdab850760c9445.1740996436.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a97095-f743-4403-71b4-08dd5a3c14d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjdJQUo4SzJCMU1rWExqWXREYUZMd3lEVGxvUll2RkRMR09Mbzk5TmFjTWs3?=
 =?utf-8?B?MGdqNWE0enhldmpDK0RXSE1SckNuSmhkUzRnOVQrbEJ3dTkyZkdBaXZ4dWFy?=
 =?utf-8?B?RmdxaTZnK0NlNUxmUTcxMFYwRGZhbUZSUDdUTkE3WEZabmxhbUdOTW1jVVdH?=
 =?utf-8?B?ZzUwTENHclJFNDhTZHp4MWZLM1lzbER3cVNUMWhCK1dtTnJ4ME11Z3paVmY1?=
 =?utf-8?B?U3gvRHJWYWppU3VUWkVHbGpJQXpkalRBSW1tVGUreTZ4U1cwcy9sam5yWnli?=
 =?utf-8?B?a0UrZGk4RkQ4VHZUbWVhZDV0c0c0UzdnZVJzejJKQmxMSDlhS0VkTE4zQXlH?=
 =?utf-8?B?RUN0MWFuWjJ3RVpnNDIvNzVLTDUyejFsdFVNaktjNWtqV2EwZzRSOVJLcEVZ?=
 =?utf-8?B?a3h3N3FQRlZBUUlLY3orVG9MMGg0OUhBZWlSNy9VZHZubld2MlBPOWdNTHpS?=
 =?utf-8?B?ZXhCc3JVTlVZZkVHWmM5U0ltR1dXUlBhMWxNanFSMk5mSEErOGZudVJyUG9h?=
 =?utf-8?B?OFNBUVZsWExEVEJGK2k4QmFucm5XeXIxK3JjNFlPQUlwcktZQXB0QUVSMUpa?=
 =?utf-8?B?d2dCTmN1Q2ZHbnB4VHh2aE42NXhrUWRBclRQdEUvUzBXa3RGd2NaRkwwRzhS?=
 =?utf-8?B?b0FJb0tET01MZDArKzJpVVpsQWxSTG9MZHlXZTVSRGtSS3hQZTk5L0hsZTVL?=
 =?utf-8?B?QytQS01yRXlRVEpZS0M2aGVaWVBaM1QyNjlOOW1jbjlwNUZ2Wkt6d3BQOFo1?=
 =?utf-8?B?QWtHTFQ5ck1rUFdrK1F6ZWRocHgyRVJDZ0NxNUE5NjNBVDcrUWhUY256cUE0?=
 =?utf-8?B?OWw4L2VPd2FrNEJSZHh0WVhIaENvalVTdmRFM2VlMVFxandKYjBrUysycU41?=
 =?utf-8?B?b3dHYUZVWmVhb2FvTG5lRHdxaDllSWhUc1QzaXZKRWFjUkx3VTFRVlNvYkxI?=
 =?utf-8?B?WnRHdkRNejdLbFBhMjdjc0wvV3lVdW04eVBxcmtTdndHcHVWWm9kbEI2eXll?=
 =?utf-8?B?U3lxK0hrT3hid3hVQ3M4ZnZTeVRSN0RrNUwxRkFvdy91NXp1d2xlYjlreE5x?=
 =?utf-8?B?MEZ3M1JuWkdheCtUWEVHMzhLbkpqZldJUzVXeUJtUGdYR1BRaG5UcnlRYzgz?=
 =?utf-8?B?WGZkNlZLRjdScmYxcjNXcllIOE5mY21OMjdGVHVIVWdoK3BJT1g1UDFrbTJ3?=
 =?utf-8?B?aUhic1lhdFU0YWFjOStJNEVFZDFET28raTFvcmo0aTkyM3RNM0JPd3FFRGph?=
 =?utf-8?B?WjNKV0xSSUdnNzhodHZzdkh0SDQ0NndIVG1mZzVOcXUxYnUwTStCTWxXVGNU?=
 =?utf-8?B?ZXZucVdHT0ZWOGQwRmlkVDF2M0p6QnpOWHJSSURkTDNBREMvUWxZbWxBcERU?=
 =?utf-8?B?YXc4RkhVOEFPaVBHS09hRzJqdytVNG12RllETDI1V3ZnaklvbldKWklPQWNp?=
 =?utf-8?B?UVI1ajVnR05BUS93SGRXTGRabWwrOUdqQkxlU3pUWXlocmlmNXpyU1NSTWlo?=
 =?utf-8?B?UVZ3YUpTRzFzZHlJR2I0UDllZ1o5WTBiUEN2Q0UzK0xXbStFVWN6UTZleFN2?=
 =?utf-8?B?c21Za0tYTXJCUkdhZDB0Mk1BdnpCTGVaY3RqcVlxY2s2UGt2RDhiYUdVOTR0?=
 =?utf-8?B?TEFGU2pwV2tjNUl2VEpkUzZVMTd0WU5sVFRsSTIzQytBcTdISDFTZnZCSGxE?=
 =?utf-8?B?KzVmTTJvRFdwSlNaN290QThNRVJFbHpkMWJHdXYyYlpFdVh0TVNCNWRqY0Fu?=
 =?utf-8?B?dVE0ZUk4QXJtcmtlM0I2RFJZdWUxVDl1OFJhNHNjZlV4NldFMXk2emZLUWk2?=
 =?utf-8?B?bjhzNjZ5TlhIQXQ0L0IvdDFpbEh5WkJ6VjVKa3UvaU5BYWJIZ2hPcDZSUVZi?=
 =?utf-8?Q?ok9ACPEUl7suJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zjk3ZVhvTUd6cFV6MXB0Q05WVmFpQzZWbmR3SEFKdk9kY2NUbzkvVlA3L25y?=
 =?utf-8?B?TjRTb0lFVHMyNGhQZ0MwaVlISkJpWXhibjV0Mk1BTHNUU1JmRkI1TzJITi8y?=
 =?utf-8?B?OEE3bUlrRDNKTVp4SG5UNmRxS3FWaTJxSUhaT2JsTEVJTEd1VTczVEVvcGlt?=
 =?utf-8?B?WElOSGwwNVlsN2srS1I4VDVVdXNNSmxNYVlJZ0luRzgwNjd2bEdMcllpM0Zi?=
 =?utf-8?B?Z0VNNHZXWEcrTnRjbnpkR2JTdnZRS0VJRUhQWlNXYkRjT0RYSUtiZGJybkRQ?=
 =?utf-8?B?c2ZselZqdFA0SmNpbmFiOXVSZDlkK080aEErZW9MMUFLeUVSV0VVdUwrS0dl?=
 =?utf-8?B?M2pucEtrR09nL29zd3RZNFZUeDFnR0t2NndzOGxTdEw1NFAwYW44aG5DNHNG?=
 =?utf-8?B?OUhJR1RwYUVXcm51MW9maHdNUkRBVGJFeTJTRlc2RkRJazNqQzBERmpvM2Fs?=
 =?utf-8?B?bFRvWVZ5a3o4UjZpYmJ2NW5nVDAyaTd1UzJseWZubEduSU0ybnRNdURBYk91?=
 =?utf-8?B?VkdManY0cHBHMlhOWDVJT2c2NFRDV1ZiY1dCZm9sL3FCNEVUbkZOUVJNeXJx?=
 =?utf-8?B?S2JFb295cFpZWXV5eW5rTXZZeTQ1OEVpMFNkMWROcTcwOWVwbkJEeGk4S2dX?=
 =?utf-8?B?VUVNR1hhSldWUjhvY3E3cElRRk5zTGJSc2R6Q0V0Y1ZNWUM0UlhuV1Vjc0or?=
 =?utf-8?B?YXFuc3lTTk91WkJPTmxPcUtSUVFvQk0zYWlDRWJMNjZ3TEh6TTZxRXRSU2gy?=
 =?utf-8?B?Y2VsamdkdGRRdmo5WTZDZzFiOE9IWGlRUzNrUWpMcitSUStWYkpYKzk0M3dq?=
 =?utf-8?B?LytET2dKejZ2bDZvUG50L3Q4SC9HcVdydlZsWU9STkVrbmhINlBHWHV4dVJT?=
 =?utf-8?B?YW1KNi8xUlRxTG8xek1hUHpvWDNyZ25hQ2pXdFNMN1hQQ2oyU004d1paZFhD?=
 =?utf-8?B?SU0yclFEbW1YbXlHU25CdHFUancyWk1iY1lUckNraFpQTUgvQlladkZFWXJM?=
 =?utf-8?B?MmN2Um9ub0JQcmdRK3M3RTFRNWpxS1VJS0hYZWwvWmJGalluRDhEanZYSkw1?=
 =?utf-8?B?byt2YXk0YVhibngrNEZOaWFmYUtDL09FWmJjNC94SnE2M01nSWVRWW02QXht?=
 =?utf-8?B?L3dTdXVIK1ExdnBzVmFUNmoyVXBxUVZMbmlsdythZEZYMkJHb1ZsTkpvWUN5?=
 =?utf-8?B?ckpoREhVZXAwTEVtUjRyY1hTanhDZzc3bGRFYUg2V2dyRVlhQ3huRS9LbTJ0?=
 =?utf-8?B?NWdwVUduSnpZQ21FZ040MWExR2dlQzNpU0MvckpMNWtQbkdQc0llK0pxKzY3?=
 =?utf-8?B?MHFVSDlwUlNzK1V1NVIrbHIxeG1VYVVBdmJmc2M0MVFtWlZTWW9KYjNoTFZ2?=
 =?utf-8?B?YjlnODA0TE1lTEdlbmtXVjVYazI4Nk5xd0VGbGF1VzZ4dG0yek4vOGk2dTJO?=
 =?utf-8?B?UXBTdDVhRkxrUUJXb2crY1pSOTFDN0NZRUc3KzVRK29YRlZycm9hY25NK3F5?=
 =?utf-8?B?NzE4aEQwSHlSajQwOWJOQzQ5NEtpT0JSZy9hR0pDdWhHTE1ZN2xHNEQvcjRS?=
 =?utf-8?B?Z3ZGZzJzN3dZcHJrRXZ2a0NHeExEcXBJLzRteURyZ21PU0pSa3YxdnNTR1Jw?=
 =?utf-8?B?VnN6LzJ3UU5qb2I2bWFsejhmMWt6M21mNjJhN2RwZjVteVdzejBPek5tU2o5?=
 =?utf-8?B?eDRGMWNCeTJKY0xKcUNPa2R3YlUvZDVPTjVPM3d6bkQyOCtGL3hLS2JXSVBX?=
 =?utf-8?B?WnpXamZySTV2cTNNRk9PYTljcDd5SzFUc3Z0MW0yMmc2WW5vK2owVEd0RFg4?=
 =?utf-8?B?UlBGTGlqU0dtMzBHK2tERSs2aEx2WHZLdUJlOGhPc091eUVaOFBPWTc4RTdO?=
 =?utf-8?B?bnlGNXRKV05pNW56SmMvSXlyU1B6bUJsQzlQVGdnZk9yai91ZXlJT2tKR0VQ?=
 =?utf-8?B?UW1PVVVsbmFjWkdKL3lsNXc2Y3BzY3c0dmlGQzJZTWVEK0dIMmxJUFFwLzdj?=
 =?utf-8?B?T0RWWmkxZ1RpL0Vrc2lpQ1BjVVNGVHhpelY3TmtQUDFPaWFHZEdUOEEwMkZi?=
 =?utf-8?B?UC9HNUVvMWlUenFzK2RxTSs3WmVMWkk3cUVVU1pBOG1VaUhiRDhwTnhNbVM4?=
 =?utf-8?Q?EbWw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a97095-f743-4403-71b4-08dd5a3c14d7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 10:13:45.3278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jndi94w0XfxSIWqEcrngFOHW6OS71+COjLVzVHMcKXDhllow+7QikmvV5/aKTMWP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461



On 03/03/2025 11:08, Bertrand Marquis wrote:
> 
> 
> Fix platforms/Kconfig help indent to respect the standard (tab + 2
> spaces).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Do you plan to fix also arch/arm/Kconfig.debug? You could squeeze it in this
patch as well :)

~Michal


