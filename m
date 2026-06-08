Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cZfMBv87J2oTtwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 00:02:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FE65ADBD
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 00:02:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=yEyhLfpb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332109.1594751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWi2u-0007bZ-2x; Mon, 08 Jun 2026 22:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332109.1594751; Mon, 08 Jun 2026 22:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWi2t-0007ZW-Ue; Mon, 08 Jun 2026 22:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1332109;
 Mon, 08 Jun 2026 22:02:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWi2s-0007ZQ-8c
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWi2r-005Ppl-2I
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 00:02:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a273bdb-bab6-0a2a0a5309dd-0a2a4503e42c-8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:02:08 +0200
Received: from [52.101.57.54]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a273bdf-672d-0a2a45030019-346539365935-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:02:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8266.namprd03.prod.outlook.com (2603:10b6:8:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 22:02:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:02:06 +0000
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
 b=niuruQ8LUxpv0PThPAu45x6kbkbFmKXg/hr3XYAURUJi3WvI5SJtU0I35nJxrsCjRtKYuNIdrK2IrQNQkkxCftHAHzvcT/UCm5Cl5E38iRij7Ywd0+zhT26LQUVPpdiu0uoDgWvepRzSgG+EUew1lanZ6hEoKoClFxyUAbJZ4dOCkV/1xhLoIjVIZgYVsd6XrYs8OZhRrTnKQT3eOF5ktuNu7ocNcbkYvj68O0yx1dXNSj01iVG2D91n2f1qNRWp9XgXvrUSIlg7eJ9H6wxWMCVlU6Lnsp3tx52Ofq52h6cjP0MuuEy8Acaven9M+2ny98SbqDP2czpaxnslZVHwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc57vMYzN4lL8qAdC3swSPYQ7ccO/b5jzrRx7tuXJmo=;
 b=LHpFloR+uMficZWwpf+rWScefYi88vfDCsctLuAnyp8Bk1dDncVTw2pyIYsLhgRf4lABjCkb5XV5LshpqTQIKgaSBADhQKb1hk8qwky3iu1e+bU76t9azBDeHkbihjZ0nSuscUjcmg6wda0qBH3J9bWQA2i5gWs4eV1hdyn5BaUuUASzTmlwHn6CTJakMeOGXDOwfGvsnOvNZ/QHGVePJZKb5ZusCImcb10CJL4NPhhGJDPQjjR0hXE/LEzNNgM/cWXV0uDGA5QH4Vs8YRio6PqpNNf5Tp9HTpCCYoJp6nclAu8JdICC1v/DXwvnr1cRyvD99CDtLoeiTqptk2K1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc57vMYzN4lL8qAdC3swSPYQ7ccO/b5jzrRx7tuXJmo=;
 b=yEyhLfpb4YV2zqVfzgnDl6RKxZ4GHWGAA7dNDMhAWBUc447KqzUDGTIXf3jVOSIbwNw5WPW+macRLppMo/PI6rH94bZRHe/fhhNxBfYwWOsH6ScWnDqL8cD3ialO/CKPkISnPh5Qt4x43RjZ6XjFNKCUYjW7mOoXGf9tM/ADgL0=
Message-ID: <52e24613-9fa9-4a17-936b-acdaf76f3bb1@citrix.com>
Date: Mon, 8 Jun 2026 23:02:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, anthony.perard@vates.tech,
 jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>
Subject: Re: [PATCH v6 0/6] argo: few log fixes
To: Christopher Clark <christopher.w.clark@gmail.com>, dmukhin@ford.com
References: <20260604214926.1735194-1-dmukhin@ford.com>
 <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 8318f061-9ade-4dcf-6792-08dec5a99428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FaZrmIB1IvKgXlBTun4VC2rCi7Rr8nSuGE8iikSuvdq3cnMvOVIDZlLI1+NF7nvQuulDUwkXLLJDfAwtAxEbGPs7zSbDAXLk8JUH3dpgjIsJE9j+ZQS2uuL0jC6R4msWj156mcJ9Z8nXKZN3VGNU3ak6eYEmmM44392GQLyGC/93iHnEaAkTjngjA+avGYGf05gNcj3xs97oGh6+BDLrUGqImFLSobfiVcUYd6WHhPfMvnpcUGu+FhtXgeCE5VxMtrBo7ffM9S4K4YHAxXLYWCJ58SzNDcXQnDsii3Hk3n1yupF7BjYYyD5Wr35KeC5KGBtcUeJWgGb7VTMyW2pDHLLxWdhUgUZAKrCU2Se1pZkzULM2xAX9dbKlNzZ/pQRHY8aKKR9ErNa1KXgpifkQb7E94f1nmICI4gpZgxUphzwMervSGkzwuJwskwo1SIDn8z9XrEJDHcwvmtUDHQ3DvYiwLHgpeCT9d0dsWAxTgxPGEw4TKYYJXsoZaRUcdGWv9MEJAQD2dvhlaB16lHtsyPYz4zVXKx+2aUO7AH3r2zvVy2TUBOBxILuFW0pGSPBegcFRIW89hv4kOW+SAdGd0ap+Z5ryhUG0kTNLqRa+3NcRrhwNxeliM2ngsXdYH+8MH6H8YxLiGlj6wG3uYxnmrhqs7gWHli0R/SFhBYH3gyXVpUvdXPFphXLv5Zck4p9t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlFndVhqaHBNMXozK0k2dTVZcEZBa3NBcHI4eEJnSjVYVk96cm9OSmkxbWln?=
 =?utf-8?B?cnpQMnFJZmxkUjVLN3R1a0NCalYydnpoSjVqZXgxb0NDZTd2czJGWUpXbzYr?=
 =?utf-8?B?YmdlblNQSkIwbGRGb0tkVnduMzN4VUR3TkwyVERXY1lURmppZVMxSTF5L2sv?=
 =?utf-8?B?ai9SRU9wME9KUm45NGRrS0NLMk02NWxFdGhnaVZrYkR2a1dJVTFZelVqUVVS?=
 =?utf-8?B?UmlVWGtZOFdzSDZNdTlKcStKWkJkWkQxdXlBUnF0RmxFWjZ3dVlKMnlnMmRD?=
 =?utf-8?B?U1JhWGxkNGtwd0tpTjJibjdPSUpPT1ZtbFhwNVFJL1lPODdoY1ZNZGlGaWx5?=
 =?utf-8?B?Ni9Pa3Q4akYwdmlQTzVsMERISW9yVUdrUjgvYXRnSkVvNk5XV1F1dDVSVzdk?=
 =?utf-8?B?ZFhlMlFReGtNc3Vab3R1d21YblJ5MXUzL01PaDQ2YkdKQWlMTXBPRjVMeURi?=
 =?utf-8?B?Y2lIQ2JteUpNbUNIR2d1OFZUeFVjMDVsQ29mbkpiYVIxZTB4dm1xdnVFVWNz?=
 =?utf-8?B?aWlVOTdnSnVRelpYNDVyUVZrbFk2RkZFWGh2alM2V2FWTnlCa3lieWpPTFAw?=
 =?utf-8?B?U2Z0UjBReURPWFN2YXFmUjdPQXhiZlRZY21ndllxQmRPUkdWUGM5ZG0rTUxJ?=
 =?utf-8?B?NnAxN2JYdHIzOGs3YUFLWlNtY2pwclNoTW1KcDNvZTZsb21YbHRraU9qblBj?=
 =?utf-8?B?dFUwVWhsRW1xTis2ckpxNVQxeGw4QWtKRWt0ckVrUUtSdGlBcGZDM0k1Mmpp?=
 =?utf-8?B?YXVBSnZSSlJNNDd5WHlIbWZ6QXJxZnM0SFNLK2pFZmo1VnpuS29rOS9Dd20v?=
 =?utf-8?B?cnhFcFBWODErdlRIeXF3NnM3SFIwMDlVelJLNkt1NllpNjdSeEVGUzhMZGRw?=
 =?utf-8?B?UDhUY0k0dmVhN3dLTWVmbDJUK0tNMG8rRlgyc0JoUGRDbUNVMFpIc2thNXUr?=
 =?utf-8?B?Q0JwbVp5b0lhbXBESGtxdGdqaTRhRC9MYmFwRlhzbGpmSG04bnNkcDlpSGxX?=
 =?utf-8?B?Vm9ReldxdUVwZCtlWjM1NEpiUHNNcHhUUFR1cnI0Q0o1LzZRUXAzSEQwU1dL?=
 =?utf-8?B?ZWdhZmN5WWZWSVQydUwvVGxWdzFsRVNyNytIeWJvNXdGUmJBdGJlM21jVmxw?=
 =?utf-8?B?dkVNUENEY01TbW8vdEVPWXBSSkdBSGFlTjJRY01oVktzbisrR2VQb2F2ay9n?=
 =?utf-8?B?Q3pKeHJXQkRsaWVpYyszTnp3YklhZ01ySXlVM01Dc3R2UUdCeHd0RHRXQVFH?=
 =?utf-8?B?Tlk1UkM5dlVLbG9GL2JWeW1CYnpsWW1oV3oyOENoWXAwS3RsdzAwZjNwZ1FO?=
 =?utf-8?B?cERidHZac0VjR3F0L1BqVjRVUzNzcm9VbHpXNUZlSHZmZ3EzUDQ2Nko1alZ6?=
 =?utf-8?B?anAyeVRyVGVCY3d2L011ZGYzdHFpU0lCVEY5eXQ1a2Q5Q1hwSlRkbTVGSTFw?=
 =?utf-8?B?c2VUWkJudlFtcGoyL1ZEek9kNWFoaDJwN0c5SzFWcjA5dWZ4Rm5sNHpUbFE0?=
 =?utf-8?B?d1U5bnJTak9qSEk4cnE5QkVjY3JtSlVpZmVrSHZJbmhBRG9sY1Q3Z2h6Qlla?=
 =?utf-8?B?MUZ6UGk1WW9BZHdOcnJoeXhxd2ZwQnFHQUN6d2JDemxtMEVHTVNmWXdJZks1?=
 =?utf-8?B?a1BaSXFRWmsrT1Rpd1ZpL3F6bTQ5ek5JaDNtZmFJTmNJL2hvbVA1dVczOThH?=
 =?utf-8?B?a0ZkSDl3bjJPTDJ6YlN3NUxEZ3NEZXFWV2pMR2R6ZGtRbkpCNnordDVYT2tF?=
 =?utf-8?B?ZG9KanJrRnJpVWIyVktqL3N0c21qNjczTHp4U00ybzdyWVoxSmhHcFNtQUpX?=
 =?utf-8?B?YWVlNk1UdnFjN1lWemlCTWVOOGpxOC9lSzZpL2NsNWZZSkR3a3NQL1NHWEtu?=
 =?utf-8?B?WEp4a3hteTlpUkdFak5ia3o2MHFhV3c5VHpTeE5SR2d1YXNsNm44QlcyZ0RL?=
 =?utf-8?B?SjgyMTNtOXo1bnlkckNWNDhXV0F1eGZrWDFQZjg4eDFFV0Qzd0RJRjJWYWxk?=
 =?utf-8?B?dmlLSDNGcWQwOWZBbURGWno3QlJ6UnRkVUxjanQvejBYdW1TbU9UeW8yeUJx?=
 =?utf-8?B?MytyR0ZTV3VXN0pxalY2SEd2UStFZ0hJMjdwWE9sR3RCVnZDTjA0elQvR2Rn?=
 =?utf-8?B?dm93QjVqb3hFZndlRVZWODE4VUxrNU80ZlorWmVqY3UrdC9QN2UwUHkvYnRY?=
 =?utf-8?B?eGx5SEIrWVA5dmFVdDkyNWMrczQ0VkRNUlphVys2VktPdlZ2Rkg2bEtTNkRy?=
 =?utf-8?B?QzRSZnJYRFVYY0phbFBTUi8vREs5YkQreVArbExta3FMMWRCWDJGYTZUZWRJ?=
 =?utf-8?B?Y0tCTmNtek00eTRwRFJDZmx0aFRRQU9SL0ZNcE13Vm9FK2FBQ0JSR2hZM0Fv?=
 =?utf-8?Q?EPb0zyXbUXL7pI5c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8318f061-9ade-4dcf-6792-08dec5a99428
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:02:05.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PafBlHAgNtaTJfnDoy6ECkCMj+ZOn2GMoSVWH4UdA03VTKsr1xaG/H8ipcu+qk0QueMPa2IsiEKORVsoQYZIVQlW1CepKM+JnyVVnjB7T1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8266
X-purgate-ID: tlsNG-33051d/1780956128-38B74938-DC6287EC/0/0
X-purgate-type: clean
X-purgate-size: 440
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:Jason.Andryuk@amd.com,m:christopher.w.clark@gmail.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,ford.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
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
X-Rspamd-Queue-Id: 752FE65ADBD

On 08/06/2026 10:49 pm, Christopher Clark wrote:
> On Thu, Jun 4, 2026 at 10:49 PM <dmukhin@ford.com> wrote:
>> This series corrects Argo module tracing.
> This series has been committed to staging.
>
> The maintainers were not CC'd on the series, and did not provide an ack.
>
> Patch 1 is rejected as an inappropriate change.
>
> Therefore it needs reverting.

Hmm yes, that was committed in violation of policy.

~Andrew

