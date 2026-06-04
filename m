Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qu/VKfbhIWq5QAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 22:37:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60F64367E
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 22:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="fLo776l/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328508.1592951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVEoD-00064r-RO; Thu, 04 Jun 2026 20:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328508.1592951; Thu, 04 Jun 2026 20:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVEoD-00062U-OM; Thu, 04 Jun 2026 20:36:57 +0000
Received: by outflank-mailman (input) for mailman id 1328508;
 Thu, 04 Jun 2026 20:36:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wVEoC-00062O-D5
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:36:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVEoB-005SZU-EE
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 22:36:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a21e19c-bab6-0a2a0a5309dd-0a2a4505eb04-26
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:36:50 +0200
Received: from [52.101.48.55]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a21e1e0-aaa8-0a2a45050019-346530378691-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:36:49 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6020.namprd03.prod.outlook.com (2603:10b6:610:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 4 Jun 2026
 20:36:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:36:44 +0000
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
 b=yK+fx7+JZ+UvFbQEvWnj9YJAYgeQMYTxJ25wWVeP6v9VzQI+PcefOp9h8khRuQWb5Xe9pWRCok0/arQRMdg5GqlwZ7up++IPljv2UmSZae3op2nahrU3dpizHJmoCXiAuaWASd+jCQZ63wxhJSnCMs/yDSmhcJGFqlDIu32FTCKZVXxTiXyajpJ4ZerrYh1tvGZDDy/nDBtiTZUHYAoj9UC52BTSaezJxih4+klFVlnhXemaJv/QuOsNG3iBTgzsKNPZ7gnX3iadctDc5bMAIe3D+SoZPEqUFlpwB370SVY2kcDXaZ57oM4WDYHN6H4kCtCv6K/ACdTheVSaF94BKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2Ggyc3aIEIZlS1TyWwH3yvJi6wwvZuW+jFgQ9AWNh4=;
 b=nDzoXCUo3yhSGD78L+MvweYcAdep6qQpHqhdW5DYs2QI8UX33dCPU4N+V5ED2OL50Auy7VFQmmeK9Jq11TqNexWeyMoHrzq7Q23fWVwJEr9T/ePxD2ZmTzg/FlZ/ji5U+OUU0ynA90V5lfjPwWZd4YSufkuJfmUrx7hf17imrGHuSqBsbPgqY1Wb1HULi6D5drkXeDixWK6NueLwHaPD0gdf2gqOYpskydIMIBmpATv2eRMbNqk7xDHOPRN7JKZ3AEL0u5AZgclpuNjMARWSvOaJ03W6Y+p69Cb04H+50pMWdEzJqa8nYK2GfHPMEqr45jGwfHiI7q4uEPo8gpcuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2Ggyc3aIEIZlS1TyWwH3yvJi6wwvZuW+jFgQ9AWNh4=;
 b=fLo776l/i+Up0/e6qWdwIdssK5mFVoqaPmJ1GPsqWY5jrg1BSYVGPUYA8y2MuFxwfA3+EgiDuQjK+3E23wzg+0SiqykFJuSrwUou7QZXiL/+IVwNv2+A31+kQBT1OPfPkIm8e5FBnw0Kh0ZAshAqqjZ9OP7xritXgy3ZM4iy0sQ=
Message-ID: <4202324c-5b5f-4529-93fc-90a4475708cf@citrix.com>
Date: Thu, 4 Jun 2026 21:36:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] x86/kexec: Implement crash kexec for Secure Boot
To: Kevin Lampis <kevin.lampis@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260602164911.2684471-1-kevin.lampis@citrix.com>
 <0ec4527f-ca97-477c-94ef-81f430e1e98c@citrix.com>
 <BY1PR03MB799686D01FC998376FDB3B9FF3102@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <BY1PR03MB799686D01FC998376FDB3B9FF3102@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0620.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d64ab22-f492-423d-c026-08dec278fdcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vja8CluzfdkkSbPt4HUuzlnmB3IZlgK8gP1+SkkqE5ZowEVwfHUNSl3VSUJbKPZOJU11bNk8e6MNoqcBo88FCSHCvkJRGMkfgW57hBK4O3ME4mPF9KAcp7SVDhMoHED9fqvsDtOK1gBysJHmpw2KkrftNLfU5rw/ey8JDgxbynHseBh4kmlCSRAhHoYsu0F9onYl+2fA/3frUhdjK5FJXVhq+CT6hLVvsdJ2pmvyiuP3TBhcI/iXs9Oujl6yUn4C7LLVtyWl97aU4s0GH0R26neumWaYzD/vJ4ZSXW43SYfkVtcTj3tm9dU+CkXvixgNAYqMKGTwTcVbP7tKDLBmfrkASSyXmByK4SqgEbOrvZp1obzTW0jAiTV+isTdVBhtVHjH9xtis6Xvku2+drmbl6nNM+WEkk8Km+IZnU7CBqZQnJHi9GFMLCQnCerOX9utM5pvjDnTRTwJcWTBTdfKQFCMmvec2ggqYiMzrNmr4pWRNHOZPr3pLVpHWgs6m4W+qOkj9CJKTK4BhSF8L7hTWyleAcp0Tn8WA2VflWt4ROHLCQflKtHc5bFfiz8w1iB1lzyiVbMzOZV0/RtBm8D0AhWwvPT/0gTJrHA844mA6DjOBWlkRFXZsr8noDFFk1n28JETSr4+VEqk5VBp2E7Qi4NUGTBRDd6oFEhgTMaiGh2S5CubD3ubJaKvc70cM4FB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU9Ld0hTdTlWWm1rY1J3VjdscFprdzk3YUxHbTFKRmtneXJXVUZsYVd0UEZC?=
 =?utf-8?B?N1p1ZHdHQ2pzTjNna2dnejhaNlREaGM1akZUMzdic3F1cGRhc3JKUW1jcVp1?=
 =?utf-8?B?KzBzL2h2NWwvcGZnM0JLTFVibHkrMjFYV3ArU0VLZyt6ZEtPVE9ib1NYcDY1?=
 =?utf-8?B?U2JML2hWeEUxVnVCZ3JpdjBsMHRhdnpqalhBUjcyMHN1dW9XWGw3VnRhTG1t?=
 =?utf-8?B?SXU3YzJWS3RrdC81OG1UL2NnOERnd05OVFl5bGJpblpCZ0VxYlkzZVZ4R2Iv?=
 =?utf-8?B?azRzZ293cEpyMyswSjVLeW1kOTg0Z0ZXL1dDYWxvWldBdG1aMTZLUG1BVjJk?=
 =?utf-8?B?QUhvalJiVWY3aFhEVHNBQ1NVZ0R5TXVUdU41YTRHcU1uNDJ3Nm1lN0FkblZr?=
 =?utf-8?B?Uno0bDZ2VjVRK3VOM0NCSlI3aEJuY3lMR1Q1VFUyUSt6bmpIVlRrVlE3bEJy?=
 =?utf-8?B?WVFFOGFLSEZObE16MTdOVUozNDE0N1VoTVVrZytFUkRaZ0lrdks1U0EwSWhH?=
 =?utf-8?B?UU1yTCs0Y0I0T3hGNmZVYzMwd3ZpbDd2blE1eXl6bC9JSTFjL2FCcHFGNWdK?=
 =?utf-8?B?WFhEWVpXOFExZjFRQmNkM2RVcjFlTlI1aTBrdmlOUDcvajB2MzJlN1pIeDMz?=
 =?utf-8?B?OG4zN2FGemcyS0xFVjdBcTJGRVV2SyticzV2Y0MvN29lZTdZRStVTzN5UGRh?=
 =?utf-8?B?N3RkM09XbFVLQ3V1V1RabVZUYUpuMW1xSkhmTDdwVktDclMySTZNWEFlUW5E?=
 =?utf-8?B?MGFKZXFZNUN5dlI2dzgvcGJkaFZUVlgvQ1A2VjNoZ2RJbS9FV1BlOVdsQnU5?=
 =?utf-8?B?T0JtK29hb3Z4YW1zS3V2ME1NNkQrYWpLUVJLRjg0b3BmeDlELzJocFQrK0sv?=
 =?utf-8?B?OEdYYTFaRU55TWU4SWJoTW1JUmZIWm1UOUY1MFQvTGtmZUZLN3cxSXBNaHh3?=
 =?utf-8?B?T2pCOTRPR09qRFI0TWdaRzZUMTl4QnZLejdYTGhHaC9mbnVQVXNqUkc3T1Uv?=
 =?utf-8?B?VWhyTGdaYTJkTmhhNTRYVXJwMWtrdm5oeElLM3BZK3ltYnJSNjcyUEk4UVVa?=
 =?utf-8?B?YmJReVRyVDUwaDZoY0s1c0hVOTJyZngvcVZwblMyVEtDNHFtR2Y3c2pHVFJC?=
 =?utf-8?B?YkVEVGlkZXR3dXNmRHM3UlR1bTgxM0RkS2x1KzFYR0J5QkpLSkpDQ2J0ZDY3?=
 =?utf-8?B?RVN0Z1NJT2pKbkFHTEZuclpYb1NSUkJkT2QrdHI5QS9QSUhIei9sZUtYU0sw?=
 =?utf-8?B?MDlwSGNaMEJEQnppUEpLM3g0YmFQWHcrK1BJRzRMaGh3clhDUFNoZzFwUGRP?=
 =?utf-8?B?QnFxL2dzSTNrLzY4VUlnYjlpMHJjeFBLcmdCMzBaVjhkdmNlYU5TV1RTanJ6?=
 =?utf-8?B?T1E5R3NaY2hoVWhwZnkzNG9ML1J5QTRQZ01Tc0kvRzUxc0g0dlhXTG1FVlpk?=
 =?utf-8?B?OHFjWHI5VWQxVTNCdUJkM0VTZnlzRFFSc0NqV3JYN0hDZElaVCtuZlJPMFow?=
 =?utf-8?B?YStyOTZ0RXp4NkNRVDlFLzYrQUVjcjRSYTFQdWI0UU10QXlsMXZVT2hjZjRL?=
 =?utf-8?B?N3diaUFLRis4VWRua0FPck5KVEE2VGxjSXlHbjcxY0diajB5RUJXMFIrNmZR?=
 =?utf-8?B?enNMcmM0S1JnS2dUTGNJN0RSa0p5U2dFaVREaXRRM2RXTndiYWtLamJyN1kz?=
 =?utf-8?B?RTJmQ0xMaHhpcXBTNFA4alhpUjFxbHdyTHBZLzJjUHFNN0RWK1NxUlA2eG9T?=
 =?utf-8?B?K3dPZ0Q1cmpEOEcrNEVENVRrWG9kcitVSDlDZm1xSEMxTWdLeTNoZU5ESXF2?=
 =?utf-8?B?UXdSSDdwaHorQlRUSmlvTHNUSU9zYXNwN1NxZ3Z5Z0x3eU1oRXV2KzRVbjRB?=
 =?utf-8?B?dmJ6MTdnbDJKODh1ZWtsNVlYUmFqNFJIR3FCN0J6WWRqZmlFc3pQNUhVR1hP?=
 =?utf-8?B?VHZYVXJ3eVAxMndqWFZ0aUUxRmtPVGo3ODJhTlZ4U09qTVZEZUdnZXp3amh1?=
 =?utf-8?B?NmdWSEl5UldadnBMK1ZYRkZwUGFMKzZkd2g3MnNvNEhsNjY1STdxYmZ3MThs?=
 =?utf-8?B?ZERlVDgvV1BwR3lodytYVU94YnFBcHBLeWo1N3MrWUxIN1pOcDFxV0kxYlB6?=
 =?utf-8?B?MFFGSGlETzNHKzI5cFFtYUxuVVczbGJ0QkpEcWZFV1JTVnJLTDV5N3R3U3Fn?=
 =?utf-8?B?Mk5yb1haeEtTU1lhc1dXSjFvdUNmRHBFUGpERHNuSjB4UlMvdDJNMjJ1amJ6?=
 =?utf-8?B?SXFhc2RSTTBkZGpScWxxK1VqM1BSNWVkSm84cmZBSU1ETlkxWDMwb3F5VG1m?=
 =?utf-8?B?UGJSU1l6TnlJMGUzQXVUZS9iUmxtOGZLUzdxa0l0VkJqa2x6WXNhekFQQUxj?=
 =?utf-8?Q?RIoet1Qi8d6O1O4U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d64ab22-f492-423d-c026-08dec278fdcd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 20:36:44.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6rdnMD06FcrQvPVQugxx0Te3kbooUUBxuCDH9k/2XGsl8iroNlR1S5PTKGG0+pvF+SbWXU9iw0FCUqIl8JemXB0HgTHPKxdhmlRE1nkPnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6020
X-purgate-ID: tlsNG-c201ff/1780605410-D937C443-E44AE49C/0/0
X-purgate-type: clean
X-purgate-size: 2082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED60F64367E

On 04/06/2026 8:46 pm, Kevin Lampis wrote:
>> You have identified that bzimage is x86 specific, and for that reason it
>> should not be included in common/kexec.c.
> I believe Ross moved the definition of setup_header out of kexec.c because
> kimage.c also needs to use it now.

Moving the definition is fine.  But it's still x86 specific and cannot
be in common code, because you'll break ARM, RISC-V and PPC by doing so.

>
>> We are going to need an
>> architecture specific way of figuring out the alignment, but looking at
>> kimage_find_kernel_entry_maddr(), why can't we just use the EFI header?
> "Going to need" like "it would be nice" or "we absolutely can't merge this"?

The latter.  But really it depends on "why can't we just use the EFI
header?"

The EFI header is common across architectures, so if we can use that,
its easy.  If we can't use the EFI header and are forced to inspect the
bzImage header, then getting the adequate alignment needs abstracting
properly for the common <-> arch split.

>> Why is it [digest checks] tied to
>> KEXEC_TYPE_CRASH_EFI?  It's applicable to all kexec types.  This ought
>> to be first first in the series so it's not tied to EFI.
> I can do KEXEC_TYPE_CRASH_EFI and KEXEC_TYPE_CRASH but there's an extra layer
> of complexity with normal kexec.
>
> kimage_load_normal_segment() copies the segments data into temporary,
> non-contiguous buffers and then sets up a relocation table which kexec_reloc.S
> uses to copy the segments data into the correct place before jumping to the new
> kernel. Calculating and verifying the digest for normal kexec would mean new
> code to walk the relocation table to find every temporary buffer.

Oh - we can calculate the digest easily when it's loaded, but we can't
check the digest easily at kexec time while we've still got the ability
to fail the action.

In which case lets do it only for the crash types in the short term. 
They're the important ones to check.

It's ok to "return 0; /* TODO, non-crash types */" or equivalent.

~Andrew

