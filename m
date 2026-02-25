Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP4mNd7wnmnoXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 13:53:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00128197A96
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 13:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240717.1541997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvEOB-0005tv-C6; Wed, 25 Feb 2026 12:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240717.1541997; Wed, 25 Feb 2026 12:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvEOB-0005r9-97; Wed, 25 Feb 2026 12:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1240717;
 Wed, 25 Feb 2026 12:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9A=A5=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvEO9-0005r3-Tp
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 12:53:14 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1071b95-1248-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 13:53:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6985.namprd03.prod.outlook.com (2603:10b6:a03:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 12:53:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 12:53:07 +0000
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
X-Inumbo-ID: f1071b95-1248-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnK/h3jNEL9IrKBO2lAykbaHq42eFBGHLGckt+JkxmPNhvtGBKwlX6LpKpGGDW0OYWo4xGbBVg47cjcccg7IDP8l9bxk6EJUFPpapCPDoZzmE0heorVtdWVLxRYCbs+jUreZg7PhDIHe9w7DkhWfClUPZmH6K3dOxQvMWgUdjA5kl551NrBjLTz0MqTf6oEeZND3z8G3x9Oc906wINhEuKxWlV7dB9y8aVB6RrQCTaP9IwNtgZP+v9rPEFbxfhqFHApMBdxHerQST/BSi4wDJ3cMoY4DLed70phYPsxOWqIlvYxnaRQU170VqwjDKSwEjsXbwynIGtG6XLDyKCcmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAWosXe15ohU5tfzB4UY/2tLcZYGffUxvyx11m/su6o=;
 b=GSqEKAN3zukUTjPO5ImyN5uzY0vsqCSeWss93wzVWGGRIhS5Q93q9zMZ6FzAAqrpfBjKo7rTPiJVl2y6DYm5rvtnnCS5rqMj6mhecz5b6tfiWwAw+iCqkM/yeVfmT3mTqB1Xfmj1Z6Bv7nCm8ivT5tRHDK3dBEEqZpF7lTwH1XhOr1BEpMfllvwSa1OCRToPlKx+zhgXOWzqTH5X/rvcsWnsIziefMNq4hlogNea8lT7sZ2JW7uckavO6dqyJ/LaDkPmthcCiQUuxL372Lku2uuXBztLnepUF91FpgLpL3HEQaQjmEzd0zgdLcqtNBuvNM1IcFIswJKwP15+EeQZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAWosXe15ohU5tfzB4UY/2tLcZYGffUxvyx11m/su6o=;
 b=C4OgoUPrQy9kvqRD+TXj+gQHMvZC1WyQAX3dUYhKhzsbjTmCKW1OD0YEql2O6WnxdMaaw1QP9e+SxeOiw+GTpuvDgToMv5I1Tk8Tshke/6JkLV2kgCTkB80v6zVHvC4dyIsU+ybFoZMftg8N4mbABBn4Vv8nDEvc2SuHCJObY4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c73f3627-73e0-4f36-9085-6c85951c2b0a@citrix.com>
Date: Wed, 25 Feb 2026 12:53:03 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 09/12] x86/shadow: Rework write_atomic() call in
 shadow_write_entries()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-10-andrew.cooper3@citrix.com>
 <0148ea9f-6486-44a1-b4dd-47af7c978351@bugseng.com>
 <278f711d-7c61-4a47-868e-ab05b9426e40@citrix.com>
 <678f1a67603d4b37d717dc84565db044@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <678f1a67603d4b37d717dc84565db044@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5d15e5-aca5-420b-a4da-08de746cd2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	F87Zf8RCQAftdUtWeXOwCDRATTdkSe4uOIjQtatXHHI6T2JYWd4Ybb5fNBU81Dm0GxcTJnVeWmIVk10kyxmF++geYMUev/JeStAK8z8NxfK4MwtEVEvtRQXBteDTO5TIS173nuOQb8xOf3l0HPVcOPsQWbX3kiLsjY0LZYGA4yaDHDRNC3rS6PoDFoi7jpLQKe+oTccBBQvKtfGSJsQ2Y97QcmIjAtiQqAOtragJNdQJT1GWGVlaFvrs3ZbiZ8awDHnnAiuqX7vkXZhuq76+xVsCJrAeD8WlaEuFk2cAfE+b2dF8rt8F/qr9nwAvX5Xp3/ru/nk+Pbop/u6j5tyOaeXlOvv8ZkBGqveKmOr5ogGrdcr3YMgxJZzacv5ivHBVGMlRUfxOqLu15gLK1ATAiKjbryYXrtiJiGgpsd9D5zZpKiPLzUwkjiGqqnoqs4ksuWQVpD/2eo6NNua8N3eKFTfDDwJ2Bo+igKQ4rE7q0XAfeWjSocy1ky9V2hTya85Pg43ztITirAq7ERtDmJodmol16CAFo8KFv9dIKEEpHBQejSJk4AarvLzrFdvaU52GYf4H1L9ayJAFaENVZeMSxz4RvozCy4MRcnPDgT5BvxcggTkhwyEGu2Oii8cLtYgEuf65lVuBjOmIa6vQJHV4Pn7wGM23XZ69JZvXI8ORn97FcVNqK8wphwQ6jeQSDd+pwxrDnyJ0GL5i0E2eoXGll7tZvQnT91XBW3reAN4N8Fk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWU0MmtsbTVYOXd4ajQvRkFHNVRkczdZUUFqVEJvcGJIRGJDVE16YVp0NG45?=
 =?utf-8?B?SzQrTklxNG5NTjhWQTM5OWVBd3B5Y001ZjArcGc3eDZDZ1gyRnJvVjFNUlRC?=
 =?utf-8?B?Z2RXV1htUExORXlBNHQ0Y2V0YTRBV0xkWWE5NW5PWlUwZGtSdnFYUmRDTkFC?=
 =?utf-8?B?UEdvY0toOE5GWVNxZVJpN1kvaEs1SHl1U1Avd2lSSG40N1BvVDBEQmJRZ2xv?=
 =?utf-8?B?d1pUWUYvVTJTNmgrQ2pTNEV4eFpWVkVjWFZLL09GTjNaVkRzWWJ5Y3k1SjNO?=
 =?utf-8?B?UzEwR1dvN25UL3o4ZlY3ZFVmMlNSNXM2Wmtqb2hXZmMvQmpSZGhyQ0ZZZG9Z?=
 =?utf-8?B?M2FqdXV1L013bjJBVVI1eXlOelpVMWN3ZXJkN1N4d2RIM3RpSDEzdmVSaVI0?=
 =?utf-8?B?MThhUUVLVEhJbnJmZHc5cnQvOEJqeXFaeGFHbGJ0V1pCWjNuTlhOVzR1d3Z2?=
 =?utf-8?B?czA0TVZ1eEdtYW9PQWxuU1pFNU9mMEl1akVNakRkR1BVWk5LL08xbk1EdGpP?=
 =?utf-8?B?UWVrdHNtV1N1UytHVVBvMEV0UWNYWnNwQmg4N1A3dGltVlN1VGNKS00yZGlF?=
 =?utf-8?B?ZE5wSmphT05WVm15cjNGR0FwTmY4MlRmZVdFWG1YUHJjM01SaXBNL2VOKzBW?=
 =?utf-8?B?L1hoNGhSWHZHL09SenhaRk93dW5IRkhXeDRMWm1VTTlHUHh0ekNhbjc3ZnlD?=
 =?utf-8?B?MlhBOEpYQXU3NG5lYXhKWUZjZVdKUUR2THlrRVFWNFNWZDV0RWNKeFF1d0JE?=
 =?utf-8?B?aDRIY1VtY2kyT2RoUE9DVEdXOE9lRzNzVGZCMlA3UW96VEZEU3ZPQjU1TDVJ?=
 =?utf-8?B?MmN6azNnRHpsZUt2UExXUDVWOTJQeHdBT1FaL3Jvbnl5QmtwQksxS3cxa2Uw?=
 =?utf-8?B?SnE3bGVoY1NBUjdyN1J0b0E4dExLUHh3NGMycGJES2Myb002WlFCT3VhSjho?=
 =?utf-8?B?dE1GUVk5YXNnZ2phVTlpSTU5bXF3dU1lL3NFY05XU2x2ODZOMm52SmdwN21k?=
 =?utf-8?B?V2RzWG9CdFZ4akVETHJOSkllVDR1VGduZFBPSEJaZ2lzUUh6T0pWNGNVUGxm?=
 =?utf-8?B?Y1lUd1poUHRhc1BBeWUwaTh2c21seHRicy9rbmRWOXZ0RDJsKzRzWlFZQXo3?=
 =?utf-8?B?bWV3a1JJTkl6OTVQNVFzZUxDcXYxM2IrWkRrVWRadlJPT2tnQUtHYVNPYWJp?=
 =?utf-8?B?VVZzOVE2dkMxWmVQQmRuZUloZU1DTEM3cHNMdEFJOTRJWnF3bU5EODNBR2c1?=
 =?utf-8?B?eGgzRHhFS0lvanBxcUJHSnhUc3JlQTZJeHJsZGp0WDBUYlRZVG51UUlUVDdx?=
 =?utf-8?B?TjczT3Z0Wm53WjRoZm1hMkxBZit2d1dQeFNTTTFYOGduNkR5M0ZWaCtQUDdW?=
 =?utf-8?B?SFAwbDhGc01JODdTSitsSklXamZ5bGRzQWNIVDNkR0hBeXVSYXEwL3M0SGhq?=
 =?utf-8?B?V0txY0pVYTBhb0hzUG9aK2ZYb2pYYy82c0wxNWM1akRlMDBZbDk4c2crR09u?=
 =?utf-8?B?R3FXY0xGdkljSmRBS1A0MDFmYks4TnRzSTh3blRBVjJDRXhET2VidG5IQkg3?=
 =?utf-8?B?R25ueXprbmhmS0FJYUdjWVREbTVoeFFFL3lYZVEzaWlPSms5NFgwc3RqQzhx?=
 =?utf-8?B?aHk1MjhrSVV0b2RRa0lQYVVOQlExVnFZWDBqM0ZkcENqUDNIbmZpUzhoYStF?=
 =?utf-8?B?T3VQeHlkaWk3b0tPZFdYSm9BeE4xZWhYeHRSOE81QXQwb2UzcVFmM210Lzl6?=
 =?utf-8?B?YVVVcStyZU8xNlhKc3JYWHRTTmNRUlgrbFJtWkRYTWsxVHl5YXB4VkxFQURa?=
 =?utf-8?B?dDczYUZOZ2pYYzVhVnpVTGZ3eDVZNlR3RGJCN1BqeWljbVFubWUrZnlGUktF?=
 =?utf-8?B?czUvZm5zYXRkMXh1azJNOXpMOVdsNElMU2ZDem9PTkpkNVpFaHUxeDVwZDdU?=
 =?utf-8?B?Q1FBZit3Q0xTZW8rcWpqcXoyRVQ5RjU4bHowMldRVVpCTXFubnk0VVRac25G?=
 =?utf-8?B?MUo0K3FsNlFWNTMxeXlENmxkQ0dxWUVlai84UUFxRkhMRGtuR3JtczVpUjlu?=
 =?utf-8?B?bU5KUEd2bjFUSU5UMjJQREZuWDFYWGVJSy9SdnNBemd3bk81a0M3OGFLKzJV?=
 =?utf-8?B?L3VSWUxQUnptVmxQd1N4elE3YU43WHF2b0l0RDkzN1hqR2xseG5UbzVYbExw?=
 =?utf-8?B?UmRTT09YS3l1YnBNdFJDZGJ6b2pnZkJXVlhkYlk1L1BYTlBoTXovN1dsc21V?=
 =?utf-8?B?bXdGSHBkd1kya3hFdVFlK05mblRBSkQveStDNmRiZHcvYmVmak9CbUc5R3VM?=
 =?utf-8?B?YktBT1A5cWxBVEFXZWtYQkdTTUtJejNjRVdVWDUvM0hOOUxFSExRVFB6cmhn?=
 =?utf-8?Q?VcbRlnSoHzv1YWug=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5d15e5-aca5-420b-a4da-08de746cd2b8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 12:53:07.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je/47JWu12bDFnGPpyPy9zPhnjRAbDTYiS6iyqoHCxdRZUgBvZJ8NcNVOq7I8fPMy1+yoOs4aXD8SsEBtaWug3cJwPuGQjKSaYcUDgL+e6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6985
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roberto.bagnara@bugseng.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 00128197A96
X-Rspamd-Action: no action

On 25/02/2026 12:35 pm, Nicola Vetrini wrote:
> On 2026-02-25 13:14, Andrew Cooper wrote:
>> On 23/02/2026 7:26 am, Roberto Bagnara wrote: 
>>>
>>> Note that in recent versions of MISRA C that rule is no longer
>>> mandatory.  More generally, note also that, IMHO, switching to
>>> a more modern version of MISRA C would simplify compliance.
>>
>> Ok.  Making things simpler for compliance sounds like a good thing. 
>> What would this entail?
>>
>> Presumably we've got to adapt to all changes in this newer revision of
>> MISRA C.
>>
>> ~Andrew
>
> Most likely new violations on new non-clean guidelines, generally
> rules for features that were standardized in C11/C18 and were
> previously widely available extensions (e.g. _Noreturn, _Alignof,
> threads, ...), 

We use noreturn a lot, and alignof() a little.  No threading at all
(well - not as C understands it).

> alongside some minor changes in existing ones, such as the
> classification change mentioned by Roberto. The exact impact depends
> on the target MISRA revision, however. Making an experiment should be
> only a matter of s/MC3A2/MC4/ (or whichever MISRA revision is chosen:
> MC4 in ECLAIR refers to the latest published MISRA revision, that is,
> MISRA C:2025. Perhaps also a few regressions (as in newly introduced
> violations) on clean ones, but I do not expect the results to be
> radically different.
>
> Side note here: are the efforts to make Xen compile with
> -stc=c11/gnu11 still ongoing? I say this because any MISRA revision
> other than the one currently used by Xen by default is based on C11,
> as it introduces guidelines for C11/C18 features. Not that this would
> matter a whole lot for Xen, but it is something to consider in the
> broader picture.
>

Funny you should ask.  I had a paragraph about it in my reply but
dropped it, thinking it was getting off track.

https://gitlab.com/xen-project/xen/-/issues/201

I've just updated it to note that we did start using auto, by way of the
__auto_type language extension.

From the Xen side, switching to gnu11 is a one-line change.  However
"ongoing" is really just me in my copious free time, and I'm not able to
do the ECLAIR/MISRA config side of the work.

It sounds to me like we want a dedicated work item switch to gnu11 and
some newer MISRA revision, but I will have to defer to you on how large
a task this is.

I suppose we should start with an experiment to see what shows up in the
*-amd target builds, and go from there?

~Andrew

