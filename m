Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id upebKFpAUWokBQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 20:56:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5C73D756
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 20:56:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="EHE7R/P4";
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359794.1613180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiGNh-00014s-Vt; Fri, 10 Jul 2026 18:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359794.1613180; Fri, 10 Jul 2026 18:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiGNh-00013U-Sp; Fri, 10 Jul 2026 18:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1359794;
 Fri, 10 Jul 2026 18:55:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wiGNg-00013O-Vj
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:55:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiGNg-00FePb-CQ
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 20:55:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a513ff0-bab6-0a2a0a5309dd-0a2a4502ca3c-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 20:55:24 +0200
Received: from [52.101.56.53]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a51401a-64c6-0a2a45020019-346538350fd9-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 20:55:24 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 18:55:20 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Fri, 10 Jul 2026
 18:55:20 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQ+HuRzqy/YSyea5Yw/SXc+oGPLX86B0HXeniCpgVtX1etawL3Xey6tBnw9n/p3qHkIGpijfw8htw6eGayu1kBwE/ftc1kqJWk6LWaSAGTZKOAwriQRg3cFx0uoMJB0F9PqHDbdPYh0xhcLHPa1diE8w67gwCB5CpGcqm7GMQc/8RAK6ryp6au8iAsMw7jer6RY7jIw8uoCccPbCHsP0+dq4p+MvZ2vrat9E2AsuL51hTMljjXCmfnv/Ikxt8GmyYQ27cRUhuwgNtWo3rqbeITU/VOTF17HOKO98KpkKa2VjyA9qwyRhTLJnPyI2zsLM71ESWtkxRjcKtFACaMUrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UsILuRLojQAjxWgzSJMfs8PYTa2UEB636AO3eoiYBk=;
 b=o3bHpU7Vd/A+b0HHOw73CX7xhfrrZy5s/T1BMsVkYnNdbdJNSS0Zn4a+/ejOisxgOJkKSxo7jzTZBElWZQASS6Sai9d5Zd4Zgh+PsCzr7+oVccl1TNn9tmxnbEtZnb/AUz9iIwTC4Cia3WXsmlcOr1GS9A5Qv5tF04mqpfFvb0psxzwSsc39YQCSiIBxnUIc6cofLwnLTjuttvrYio90dVDDOYVcehUb0Hj9NkyNFEF8/P3esxo+DB2FURHAEJWaQA602I05y8zeu63pAgIEe2VRMRZGBqWkFbvUbGTWWrDJbIXt/XKZezZQlOGXSmsq9l3c+hwsprvkJ7soJ3JFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UsILuRLojQAjxWgzSJMfs8PYTa2UEB636AO3eoiYBk=;
 b=EHE7R/P4e/+46pafgMgwSWgrfh49CaM4vRrT4m9SPD0Xeu3O9/tghtgfzwpU8AD0jixC0fnyDeXsUkF/LIm4GIVRHofFMUnn8UuOAIBUvjhKRZV0Q8DBGKIaOQx4BeJXxMOweknsATMwnCvyaYPkhG3z/Rlx6gYV/q+tO2Amxqk=
Message-ID: <8dcce50e-a4f3-4177-b2f6-06257c2607b3@citrix.com>
Date: Fri, 10 Jul 2026 19:55:16 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/6] xen/arm: choose GIC version explicitly instead of
 GIC_NATIVE
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
 <1783691842.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1783691842.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0070.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::21) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dcd6e7-97ad-4828-3025-08dedeb4ca39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	R5DJFbit1CUg4xBMC+KKnLKA/hIiqxGxBXQsFsVkJ7r8cVJzSvrjhj3bIoZJzr4cl7KmCCfrbVX5PvIwRCBCB8sY45PG/r4EVQLoQegz/2vtdqpg6guyZXT32X+3A1h6gZGfAS7QtmmFKtO3uAmMgBNrs1XXdtobAfVyDugG4UCqPzXRYtfJFrYL0x9KSNqpQwshgyLIjpqS0WRhqrQXk1g9GyFxFpXPOL7lq1bj8n1VH0CcnKg5dZH66Vcu/Fpteb3vIOfOifhpwcVjN8mVYtxhjCFbcc9P6GWL6OwEg9ATvqWgWvcGHHjtz+v/4UFTuDOLdwlCQ89VUjnE4sqiFjclykP4LIJryREq2/7bSOfbpD42eZYNWF8B6QYvdWGxextyO2Pde7oNhxNWaG6RPcyQBrsNufV959F3+KGiIiqMIJMybwqbnywHWYr96GWJJzNVUwkoJpBRsFpbBNdOBtnbGWvPYlu8b/5n4OaE86yfrm7J7qTvp9CtUljXgzd0qbLIWCzgM3qX0X5aQ7D+HMeJLGONS8EhWyoEPxJx/+rp7pQJNdIYYCdLZztO0KeXSXfnRYchObjRo+6Wkmb2CU0BU7T4FRFuwGWQFpCvaC6g+Jl3Yg8KOI5egUF0NstgnyoT5zVHWagYikS1GOdxEIONjBXbaKXI8nRehYzx4w4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlVYRVhLRXY4TkVlRHRjeisrYXA4SHJoVXJGU0VKeUEzeHJwTGRHZ1JpU0ZR?=
 =?utf-8?B?M1phODYwS0I3NHJkc3lJd3ZjeHlVRjBBTDE4MDNONGxoSmZwQ2o0RkFpZ21m?=
 =?utf-8?B?a3E0U3NQV1E0b3R0Kys1Yjkxb2t0TXVUUDBzRTVVWmFzeCt0cm9NUDlXK25H?=
 =?utf-8?B?YXNwdHgrSEt0MFJzNE03ODhjUG5NaGcwNlVIekw4d1JBb05rVk91M2JKNmV1?=
 =?utf-8?B?ZFhJQzEyaTY4Tm9SMzUwSXhmU1M3SmVrZ1l6VXJETVBEVUZNNWZlWWtoUGJv?=
 =?utf-8?B?N0psWFVhSENrSW1QNlFaZFIzTDRXaXdsT2pQZERVeDd5cysySFpxb0hGZzVQ?=
 =?utf-8?B?azFLTEtEQ2ZPNEdJNGNEY2JaYlhSdHZlRzNhSXJVMkRnSWV0dzBqcEZvM0Ja?=
 =?utf-8?B?ZXlNYU9maHkxMUhzUmhUcERMMENPOTFzZjB4K3MwUGFSeTIyRUV3MEhwNldT?=
 =?utf-8?B?Sk1BRDdLN2ZiTGYySytlUmRlWFpOTEdQQVJMOXU4ejVEdTJtK054a3BMbVM2?=
 =?utf-8?B?Q2RUWmJwUnZ6bFoyeWhlNFcvaVkvb3Z4Wk9sR2FPNE9mMGMydGhUQWRUbVVM?=
 =?utf-8?B?dU9SUnM3bVBjSkYrc3RPSEJzU1BIek10dnFxVFNsN1VhcGhrdndYRkUzaHdH?=
 =?utf-8?B?UnQ1Z1oxd0lOMVNSQnNFbjNaOVZmR0JaQWszd1U0QVgwaU0vMzN1eTJUM3dp?=
 =?utf-8?B?Z2p0SkpKNHBrdkoyaEVwbG5zYmVHU3NIaG83cm1RQmZWcjJNU1NmR0YyV21k?=
 =?utf-8?B?VmtYN0hpYzhnS1dkRTRySUswaTRKT1hMVDZxMlJMaVI5L0ZyUncwMm1BMWRu?=
 =?utf-8?B?OWZGMmg0SkU5TFhsYlJVTkM2SWdJMkI1MEN4QUpScUJIZWpGcTZ2d2JUZkRK?=
 =?utf-8?B?aG9GVkFsSEpraUkxakY1TE1hR1MyMXIvV0JrWXg4WFpXZWN6SzV5QUc2R1R0?=
 =?utf-8?B?bTJJaEd2bWRKL0F3WmNMYWRQSkRvZFFQd1JQZHdGaFVqaGl4aVBLaWdOSG9L?=
 =?utf-8?B?eWxpd2FhOExxaGQ0S1R6OC9qOFpLU3gvTFBTRlhTbDVYK0hsR0pRQWVLUGlF?=
 =?utf-8?B?TTRkNUdhYURORGxaL2FsRUxpYm9mb2U2S0R4eWh5QWpKYysxd1U4Nmo1djFs?=
 =?utf-8?B?U3M4YThBK2VGbUZqcU1vN1RIRzlEeVlxSHdHK09XZnN5bVZ6cGVHQ0R6dDNp?=
 =?utf-8?B?SDBpV2drRUJsZUJuWEVBTlJ5NWFBN2ZBZEorRDJkR1ZaTHVPNXdsZnEvWnQ0?=
 =?utf-8?B?U1p4MVNrbDltcEdBOHVQZy9JMHdkblpLTk9sS0gvOEdZeUJ5aytxQllmNUFo?=
 =?utf-8?B?L1NoVThBZ2VLaUlMUm5aemJWR25MYzNlMXBQeFNHcW1EZVhNby9lZU90WTFn?=
 =?utf-8?B?S3RHdExEWHRsbHk0MWxMMHlacHkwaWhrZkJZaCtQZ01NSmJ2cnpQSEF1NnBD?=
 =?utf-8?B?d2llVDhIRUVoSnA2V2ZTc1ZTbkgrZXU1VHg5empqMjRmK3BYb2VLRFNneHg5?=
 =?utf-8?B?M09pYktURlZJNnQ2ajZwTG5LU3cxVDg4amV2bHY3N0o4V1JQOEFnSEZ5bmx3?=
 =?utf-8?B?VkZ1UlF0amo4c3E2LzNuR3pRSmhlWDMyb0FTc09XNFdZQXdOdXZXMjRvWTN6?=
 =?utf-8?B?Uk1xd2lhT0dJL0t4czFYSXFKYjRTNXFUZEVsTEtjNVhidVVRVllsT0ZtSnZy?=
 =?utf-8?B?My9MaFNQUlRFMnFVaVl1NnpGcGlWRk0vQjFaYlFrdFVIWGQ0VFRhQStUdkZt?=
 =?utf-8?B?Ni85WHNBVnBkZUtHTTFDdlFPdzNKZkRVVFF6SVd2ODhiWkQyajd5U1JuNDNN?=
 =?utf-8?B?T0MwdUZOMkxNdnNYYUM3U2tmVjFFOHJTYlFIVzEzMW95eWhYUzE5SDFaQ1ZZ?=
 =?utf-8?B?U3kxSzdqTnRKS2VWNmd0WVZVS1ZZaEpJbWpOUUpjYmZDQzFhY1dXTWsxK204?=
 =?utf-8?B?OUo0b2NFOHVFMXpCeE5TbXhROEt2N20yUUtUWW14dit5WG11WXBad29jR0J6?=
 =?utf-8?B?cktNSGJob0hXS1lTbTBrSjBrekVnTTgwZU11MFA1K2w4Uyt3M3VTQ1BRSktj?=
 =?utf-8?B?MHV3bWRoZ05QVHhQcWJUMUhUUjlXNUdrb3Mya1Q2OHVpc1VqYlR5ODVsS0Fl?=
 =?utf-8?B?SWlheEo2ZDc5OEpMVWRjVWU2emxKeWJ3Y1U5cHBTTzhsSmlxYitiR1RIeU5U?=
 =?utf-8?B?L2xZT3Z5QjhWU29PSTBhYjZ6MDBFWHhwQWlyWjJ1RkpzODZxM2FXeWlOUWdE?=
 =?utf-8?B?MTg4elNjMlhuMndBRTJ2SllxclY0U3NzOHVidlVxVVIvTk5qdGxMRTBzV1F6?=
 =?utf-8?B?VHRhNkZVay9leHZpck8rSHhwcW56VEpLVGd4WEFGUFZYcVJCdUhpdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dcd6e7-97ad-4828-3025-08dedeb4ca39
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 18:55:20.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO1yMaWZB9zXZ0mt/Jt2b5T89+F7MmJH21n4yfj6MuQ9rIuGxSxtaEsdz3IJVYb5D6I4pwAldAnj3vbaALqbrJF9B7mPrnhxHezSGONiDrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-purgate-ID: tlsNG-720697/1783709724-3E944A87-88D1B0E7/0/0
X-purgate-type: clean
X-purgate-size: 4154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFD5C73D756

On 10/07/2026 2:57 pm, Julian Vetter wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
>
> XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
> resolve the domain's GIC version to whatever the host hardware has. Xen
> then writes the resolved value back into the same in/out
> xen_arch_domainconfig the toolstack used as input, which is the kind of
> API abuse we're trying to get rid of. The struct passed to createdomain
> should only be an input parameter.
>
> Move the "pick the best available GIC version" decision to the
> toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
> already exposed via XEN_SYSCTL_physinfo:
>
>  * libxl__arch_domain_build_info_setdefault() resolves
>    LIBXL_GIC_VERSION_DEFAULT to v3 if available, else v2, else fails,
>    before the config is built.
>  * The Python xc.domain_create() binding does the same via a call to
>    xc_physinfo().
>  * libxl__arch_domain_prepare_config() therefore only ever sees a
>    concrete v2/v3 request and just validates it.
>
> On the Xen side, arch_sanitise_domain_config() and the two in-Xen domain
> builders (create_dom0() and arch_parse_dom0less_node(), which always
> want a vGIC that exactly matches the hardware) no longer resolve
> GIC_NATIVE either. A new gic_domctl_version() helper returns the
> XEN_DOMCTL_CONFIG_GIC_* value matching the host's gic_hw_version(), used
> by all three. arch_sanitise_domain_config() now only validates that the
> requested version is compatible with the hardware, rather than changing
> config->arch.gic_version in place.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Ah - my test branch didn't have a SoB line, but you need one from me if
you want to keep me as author.

However, my version didn't even compile, and you've done almost all the
work in this patch, so just take full ownership and solve the problem
that way.

> ---
> Changes in v2:
> - New patch
> ---
>  .../include/xen-tools/arm-arch-capabilities.h | 21 ++++++++++++++++
>  tools/libs/light/libxl_arm.c                  | 15 ++++++++---
>  tools/python/xen/lowlevel/xc/xc.c             | 18 ++++++++++++-
>  xen/arch/arm/dom0less-build.c                 |  3 ++-
>  xen/arch/arm/domain.c                         | 25 +++++++------------
>  xen/arch/arm/domain_build.c                   |  3 ++-
>  xen/arch/arm/gic.c                            | 16 ++++++++++++
>  xen/arch/arm/include/asm/gic.h                |  6 +++++
>  8 files changed, 85 insertions(+), 22 deletions(-)

Also, I think you want to split this patch in two, and merge half into
the subsequent patch.

In this patch, deal only with the tools side of things guaranteeing not
to produce XEN_DOMCTL_CONFIG_GIC_NATIVE.

Then in the subsequent patch, delete XEN_DOMCTL_CONFIG_GIC_NATIVE and
disallow it from being consumed by Xen.  That way, you've got one clean
tools patch and one clean Xen patch.


>
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> index 4aa4c6c34a..21e3c73bd1 100644
> --- a/tools/include/xen-tools/arm-arch-capabilities.h
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -6,6 +6,7 @@
>  #ifndef ARM_ARCH_CAPABILITIES_H
>  #define ARM_ARCH_CAPABILITIES_H
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  #include <xen/sysctl.h>
>  
> @@ -25,4 +26,24 @@ unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
>  #endif
>  }
>  
> +static inline
> +bool arch_capabilities_arm_gic_v2(unsigned int arch_capabilities)
> +{
> +#if defined(__arm__) || defined(__aarch64__)
> +    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V2);
> +#else
> +    return false;
> +#endif
> +}
> +
> +static inline
> +bool arch_capabilities_arm_gic_v3(unsigned int arch_capabilities)
> +{
> +#if defined(__arm__) || defined(__aarch64__)
> +    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V3);
> +#else
> +    return false;
> +#endif
> +}

This is truly awful, but seems to be the prevailing pattern.

~Andrew

