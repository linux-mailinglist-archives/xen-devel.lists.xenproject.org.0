Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RDmpDftSOWpvqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:21:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF1A6B0AB6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=lewXFjdx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343953.1603170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgSg-0001Td-23; Mon, 22 Jun 2026 15:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343953.1603170; Mon, 22 Jun 2026 15:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgSf-0001RC-VA; Mon, 22 Jun 2026 15:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1343953;
 Mon, 22 Jun 2026 15:21:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wbgSf-0001R6-8N
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:21:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgSe-00E7qi-LP
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:21:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3952e9-bab6-0a2a0a5309dd-0a2a4501dade-10
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:21:20 +0200
Received: from [40.93.196.55]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3952ef-e031-0a2a45010019-285dc43713a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:21:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6500.namprd03.prod.outlook.com (2603:10b6:806:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:21:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:21:16 +0000
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
 b=oLgJ84ScltkgHlhEASHEUiVBb/214GXwW0XuRxPyDHoWtHzRs6C4AbdHu3I5XB8V3oZbo+kTMZ5Vijcx3G4ePglxL8B2N6dv9YvrOzzuKbPm8/gVJjONSm3/M4+RHdpyohpc/D/jFlHVH6/j/e0MaPNV1MsM3VIhrlYI4R+EE9sVdDPE6gy+KAO51WKCAoSFBt1BlTSw6sIkGDHy/9OROUC2O2pEuYN6jSzvI/FRl9a+szvBcuGs1FUJlOeGjk6ANBJwHpyPjRr0LmlqLZpYeMyExwb5boJoE5NwrjfZ981OFZ5+IVBi5l9/7kFCCxwd7x/u0n89Vi9gvYj/f2oLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DVWaAnm6kXSTuP2y2h4Erd9Rljf2odc40GyVgb60uw=;
 b=FNN476Ri3ZEz8/BU8oQeG5+lbTwPjuPppmyzjKAdcy6WG2RfyEGmjkirDx/H2ydPQCQiv4oyjU9n8EUj2l0oq+RbJhIHK1DeESuHQ57ft/QpXYzAuSe0+o2LleQFwfX0Qh853C1TV1cmRgH2iroktbdntdZ5RVuWKKLeJ7e0YZSk3msNySJLhwKCKrEURXwkM+krYesDdyVe0ZYy0c4AbnEM05QeG12MkIjVmvf87QuNqTgaCI5Sg2Y45qDcku4BUMuwS9QN+BTQFPenIOFbDEewNd9EdzokhNFg0vOh4tnMi12nEHirWSaTJMY+DdPl++f51QWmvV8eZP4EWAeBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DVWaAnm6kXSTuP2y2h4Erd9Rljf2odc40GyVgb60uw=;
 b=lewXFjdx1bRbfPB+HWP+yDDlWw6GDAUtIr6SikDIPx95T/UUVZvdp1GQ3Q3SvQVO19pOVrWArIhHlqKXS/clPqp8MtbowCCTGQwNdh5ssJPXbujl+Ogiv5+DUIXI58zowDQ27g4vDWwAY9RrWZmriUsuJJCb+3g3GrKZY5/iwsI=
Message-ID: <7882a841-db39-41f4-b3df-fa61d89ab1ca@citrix.com>
Date: Mon, 22 Jun 2026 16:21:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 13/15] pci: Drop parse_pci{_seg}()
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@vates.tech>
 <2d2164f0-9edc-41d5-9d88-b0a5e3fdbc06@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2d2164f0-9edc-41d5-9d88-b0a5e3fdbc06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: 521c2372-01aa-44ca-2bee-08ded071e739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u7UKJRpUkLnkb9wMuPBSHkt8lzemA/MkjF7C3irEklU2Ko21KUvr6OxB8hl4+WB1e+m4vjov3R0UMU0L41WjEnesg4Rax0SUeX/cpeVMtWKU7ilfg1FEJL++KyeCG065DJilhJ/ZRycSyN1TJn41O1Dppvm3Qmew+xs1yJ41x+w/FE4j8nlPYsGYP2J611D6JjMS14eY56uXJ9/eV9IcujWJNs2jGOl8pBnk3XmuhOBO8287E68nrZuHWN8NQCV4lDtUZOhEUBNLyxftX5Tp3xeBdi0n7nqLd6D/FngoslqUMnkC2EpJLx0KS624XWntsZrUcXAHAvqgxwuuYRufh/H3k0qN/28F+nkcid6sVwuPAJH/INDyVQR+UVPZ2gwsbmoXct4WIzA0ryqYokexuIyyB0fVaYXubNlN/mizpWw+WmcXg0++R4Hup/DPyE43ISLglXmUybB2Cdmgc1yUV1W3tJ2nvKDyJZaJQeBeEKjZS+0guUvyp1d9MJQL04w0NVcdmgUw9w0Lap0kEACZD2UWdW8EI1OAAoR+wm9VNxWuRComKi85erldGQs0xdP02ZEiSmnEBivU9y6hhK6EwR1ypBWUmdWTDjo+XeJTLhKCu5B8OhdYyHluuST6bzX6Qt9TFkzMJbNielVFVW5R+xNddZbziJROwL2u+efbF5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk90UkxiemlxVzA0bnhIcTFrZEcwMzN6YmVIWmRqdmg0cVJxK1ZZQmgxVGJr?=
 =?utf-8?B?dHd6OGJUQVFMcUdncnJvVS9DVFBqeFFPZG1QWmF6Um9TcU1TVWJCUjN4amVv?=
 =?utf-8?B?MUxSZFd3eWZoR3NEWTdmb3VQTFJKdjVzZ1JYb3VaejhybGJjdld1aEcyMEZq?=
 =?utf-8?B?Um93TlBRejZETmxYaTFpZGUwR0owMEVwQ3NSMHUvSHFkZ1RhZkU4b2ljWG9O?=
 =?utf-8?B?Y2QreDJxaVlOREVqTEtOL2tEemE0WUFUVkIwUmkrTlBNVk55UkVEdGFRQzlk?=
 =?utf-8?B?S1JSUUJTbGxwRXhzbFFpelZCQXdORXlhMWJJTHl0dVE4OHc1bjN5Z3RSbG90?=
 =?utf-8?B?OWhudExNT2kvTWZPVXlrSG9UTTZDdmdJUW5NMFRQQUtHeHhvVzRVcC9aOWs5?=
 =?utf-8?B?SUJmRDFCT2FIV0pxeDVwUnh6VXprS1NHcmdyaWl6cG4wQWpCdk5abEJXQlNr?=
 =?utf-8?B?KzZ2WUxJdFFWTURHVjlWc1NVM29IQXVuSHAvTXFjRmh1N3czRENtOWFIWDMz?=
 =?utf-8?B?REpGYklZbVRNQ3JKeHlocFlLZy9NNEEreTJ3YW5LblA0VWU5amNsdzBkcVpx?=
 =?utf-8?B?RDllT2ROWlFDS3ZGL0NuYm9DK0Y1a2tZMXZHRktZci9NbkVjZFlXbHBsY2oz?=
 =?utf-8?B?Z2dhbVZDaHRnZDl0T2JVTEg5Nk50dFdYbTFUaE5YZk1hVVo4SnR4S0FHWkJL?=
 =?utf-8?B?c1V0eTE4alF6M1F4SGdNL21QbUpORVJFYTQ2K3NPS2Vkd01nek8veVhHZ2NM?=
 =?utf-8?B?bnV5YnNpVGdDQzlPRkxORk1mUGtFMVFjTXRCQ004YkpWUkVjWFNIZ3pVR29N?=
 =?utf-8?B?ZVJ3OHk2RS9WdmxSYVhCWEZUTU5BTDFPL0JwUCtCUGNIV2pFb29YbStuVzYw?=
 =?utf-8?B?aWJJdm9CckFVL2JFQ01pMXVLQU1ybkJCaitkaEFWb1h6bSt0bXVsMVJicWsz?=
 =?utf-8?B?T2lJdVREbWZ2WldjZlB4bUkxMWtnbWJRSDJrVHhOZkZJc1BFSHg5eVhBT0F1?=
 =?utf-8?B?bWVDd0pGWFZ5VTgrNDY4OGxMZTY0VjBra25UMXhqd3dncFpTTnhvcUFoZHpw?=
 =?utf-8?B?UkZzUmU4VExyN25zUkFYdVc4dHRtMG1jUXJxK0JCWk04U3hRZU5XeUpIcU5G?=
 =?utf-8?B?d3ZXalZtZ2x4NUJqNFQxVWthcHFmV1JudG50LzZUbEVORVloMVhaRmVGdGRJ?=
 =?utf-8?B?RWlZbjNmKzNPODAwUXZzVFJOZUp1NVB4WFNSN1RMOFFOK25xT21xUnd1Vno4?=
 =?utf-8?B?TTg3YVhzaXRmMUpDVDZSVXFmL3VyM3lLZlNCSmVyNkhIK2FhY1JqZjNFUFV4?=
 =?utf-8?B?RUlwQkNWREEvUisyRzJad3BNVEpaTmxlTW5TbEEyOUJ6MVY4UEtXK0o5aWdx?=
 =?utf-8?B?WmdQS0lLUzh5T09vQUwwRVNEQjNEZTZjVjNwN3FoSU4xcEMxdUxKNmlVZjg5?=
 =?utf-8?B?aFprT3ZPRXdOZjFhL3NSQW1qR29wMDM4MG82OGVlU2FheWIwd3N6cGszZVBD?=
 =?utf-8?B?aGhWaDRjYXZOQkF2bDlXV0dxelAxTGFtY0tOR0ZSaThSQWQ1UHNxY2JZK1Bn?=
 =?utf-8?B?UlJ5Tkh3Y3dSbjNBVjljUVNMZ3NIRU90d3BURWNnV0VWaGFDSUNzN3lJMWxP?=
 =?utf-8?B?U1BjWEx3aWlaWGFMVWp6Tm1NbEQ2QnNRcGFXd3pKZmltSEdWSlhDRUY4NjA3?=
 =?utf-8?B?VFJLUFU1RVh4K3BNWHpFV29yQWJrL2FWWTFveXI2VUpheDEycUgvazhoUGQ5?=
 =?utf-8?B?UEZnWERQbXhZdGNuOVl1KzhKRlFQWlhYOWFhUVhDa3ltTWlURjIrdVF6eldk?=
 =?utf-8?B?RWJJcmhUK1E2NlVuU2Y2VWRobFhIK25VeStSZHNjck1hbHhxTjJJdjc4c3M2?=
 =?utf-8?B?SG83WGpJdzNFYjNqRHdPa3NLUjYzVFZXMnd5cndWU094UVBGZnN5SmFMQ1g5?=
 =?utf-8?B?RTJPWEpQbis0c0FMdklpZURYMFdiOFJNUW5DSGFXRHdHakNiazlwZ01qSytB?=
 =?utf-8?B?aG1wRmpvMk15RGEzYndveXpka3JJcHhJczJqTldOQzhhTmlKM2FISk5JMmFZ?=
 =?utf-8?B?N1p6TGlRR1RFbG44d1FsQWRWU1hhUHBEK01hcXNjSlZqTytJeHU5a0ZnMG4w?=
 =?utf-8?B?YlI5eWV3b3E2NjU1UEZZU1ArLzlXUmlienFHWXM3cjNhQmRyaUpvZFpwQlAx?=
 =?utf-8?B?SVN4Z3o2YXVtUm1HZ0t5R29FMmppeGtES0tTbk55S0tlTll5dzgzMzgrdUkz?=
 =?utf-8?B?ZjhLczVJdHloMU9pdTBOVGY3ZGUwN29LaXllMktBLzVTcDB4WXJ3ZFJlc2h1?=
 =?utf-8?B?MTFpb0dGakJtRU5wYnhWalJuamNLbjVjZkNkc2tKSSsrWGFmWnlzUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521c2372-01aa-44ca-2bee-08ded071e739
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:21:16.3630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bubiU62FIFiK4gpPEuk4uZvhEWO21TmcyLYD9ogW6FxLXnZmHJpHQ3fypF1DSZkeBKc8USft7j0n9m0d6Hzol0+tUM+eouBTyk9uMrUPc88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6500
X-purgate-ID: tlsNG-d62444/1782141680-489BDE30-EF3310AF/0/0
X-purgate-type: clean
X-purgate-size: 3683
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DF1A6B0AB6

On 22/06/2026 12:38 pm, Jan Beulich wrote:
> On 18.06.2026 16:50, Teddy Astie wrote:
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -273,12 +273,6 @@ unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
>>  unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
>>                                            unsigned int start,
>>                                            unsigned int cap);
>> -const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
>> -                      unsigned int *dev_p, unsigned int *func_p);
>> -const char *parse_pci_seg(const char *s, unsigned int *seg_p,
>> -                          unsigned int *bus_p, unsigned int *dev_p,
>> -                          unsigned int *func_p, bool *def_seg);
>> -
>>  const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
>>  const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg);
> Could I talk you into adding yet another cleanup patch on top, to drop the
> _sbdf again from these new functions? They really only serve an intermediate
> purpose.

I was wondering about doing the same.

This is superficially ugly, but it avoids needing to rename the callers:

diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index d816dcad0519..28d1fe111ae4 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -274,15 +274,28 @@ unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
 unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
                                           unsigned int start,
                                           unsigned int cap);
-const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
+const char *parse_pci_split(const char *s, unsigned int *seg_p, unsigned int *bus_p,
                       unsigned int *dev_p, unsigned int *func_p);
-const char *parse_pci_seg(const char *s, unsigned int *seg_p,
+const char *parse_pci_split_seg(const char *s, unsigned int *seg_p,
                           unsigned int *bus_p, unsigned int *dev_p,
                           unsigned int *func_p, bool *def_seg);
 
 const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
 const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg);
 
+#define _parse_pci_split(a, b, c, d, e, ...) parse_pci_split(a, b, c, d, e)
+#define _parse_pci_split_seg(a, b, c, d, e, f, ...) parse_pci_split_seg(a, b, c, d, e, f)
+
+#define parse_pci(a, b, ...)                                            \
+    (count_args(__VA_ARGS__) > 0                                        \
+     ? _parse_pci_split(a, (void *)b, ##__VA_ARGS__, NULL, NULL, NULL)  \
+     :  parse_pci_sbdf(a, (void *)b))
+
+#define parse_pci_seg(a, b, c, ...)                                     \
+    (count_args(__VA_ARGS__) > 0                                        \
+     ? _parse_pci_split_seg(a, (void *)b, (void *)c, __VA_ARGS__, NULL, NULL, NULL, NULL) \
+     :  parse_pci_sbdf_seg(a, (void *)b, (void *)c))
+
 #define PCI_BAR_VF      (1u << 0)
 #define PCI_BAR_LAST    (1u << 1)
 #define PCI_BAR_ROM     (1u << 2)


You can add this after introducing the *_sbdf() functions, and then
delete it after the final caller is converted.

The void casts are unavoidable because both sides fragments of the
ternary are typechecked, but we regain typesafety at the end.

~Andrew

