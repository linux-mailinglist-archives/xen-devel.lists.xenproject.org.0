Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yUc8DGnVHmp/VgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:06:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9062E487
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:06:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="h/03H1mV";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1324996.1590503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOp7-0004EV-W0; Tue, 02 Jun 2026 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324996.1590503; Tue, 02 Jun 2026 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOp7-0004Bl-TL; Tue, 02 Jun 2026 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1324996;
 Tue, 02 Jun 2026 13:06:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUOp7-0004Bf-1f
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:06:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOp5-008Dt0-Ux
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:06:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed549-5cb7-0a2a0a5109dd-0a2a4506ecf4-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:06:23 +0200
Received: from [40.93.201.1]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed54d-7371-0a2a45060019-285dc901783a-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:06:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SAWPR03MB989599.namprd03.prod.outlook.com (2603:10b6:806:55c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:06:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:06:19 +0000
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
 b=cBYNtUaMunOHqqAW6Jx3zKeJz2nichyl5Mcc0Y34d8lT38unh9m+5Ee8bMbGT/rlLdi1vlhTTCBsHDv+o0QCGlHlnuWR5wkuwy4BK0h9l/Hn2nBVKVKEJPfZGx5CDFVOs4/UrADKRMHKiTd42dr+m3qAqfXj2dPmIuUlfba4GRTVASCOcCLKMyaY/9w26J4NFHPbDL8bmx92dZuERH8wtB0iCllXNG1dsRmZXNzg4wZoG82D6gL+JGjQ8PoaT3huXMN4cTH4tqewl2mBMgcPpKfGOvl0opNpcIZSpkYLFS/uAy5IH0UcmUjQ4jtn8sZ0WSvVyzs1kZeaR7+kJ78ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQkH6EqJm6iBjypWUAMhyG9C9X92tpv4B1o7763BuJc=;
 b=GaHhhaJlTvhBA1ivQCXSI6hiZNizgqOIVwiIdflNu+IDfmyYYE9PQZ0N1svTbHSA2JHmw2kDcBVzD6Pqvxqi6IlD2AY0bWsIkmEtNOcdFQJE5wV8GjsuUoe1t5VNBh4hoQpGxCzNLWGdk/Gx6RQh8ITQ6sBQ6sDcRxbxZt+C53lfvJlfElojGMEhwIpn+PZACluMvwMDJ++lFozLswJQYCrOcI/r3TXsdHWzSVXcQjIL32iLsVh9WlDw7pIABRqfP0x/RDKat+assNcymWEjsEq1tm/XwfTroOAFWd/rjG2/sSHtUsv8sU8shJNBjmk9bTB4tsvBxYJmhArq1lYamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQkH6EqJm6iBjypWUAMhyG9C9X92tpv4B1o7763BuJc=;
 b=h/03H1mVK9FfggcCkZ4zgH7ZIZwm6tSWwIHFnKh04PbdOdDpLZJqp04ArZbAwEJh0+nuiUnsk06SPPGIfIOJQ+P5g/mlx+9eRCUS9tWvTfl5vXjrE/cCTuQY4sRP2Up5eYWSEBCCdJ9d8R/W2LA2QeQSzWS4LbvNyHSriZ7mhmA=
Message-ID: <60be371c-29f8-4e0f-917b-6c8d72b2a014@citrix.com>
Date: Tue, 2 Jun 2026 14:06:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com>
 <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SAWPR03MB989599:EE_
X-MS-Office365-Filtering-Correlation-Id: f84018d6-4018-47b7-ad66-08dec0a7bcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QmZ4NLUbcIzvPvw711wzb1HwliLqr90Mt/WjdwpB4eZf25y9aOumgaStOO5vtsorMIb58qk26IMZ79iAon/Ef1IPGUuPDNa9REE+pKvUHkA6kFdoujFt/v/9WtZe92qwTtHu0a6EMu3l+N6ouLjvdd1qxK2v9wNjmc2jmrcfZF28uy8YWafnZYLtM7FDd7XiyI9LjPYWbA+/0Xbg5fTsTdUZDXouTQ/ozUpqRonU2yq/cE4mOF2KAo5HQo1jUXAKZyl3b7pzT5eQp0Mm5ATnS1aN4E3EpOTmuQE2NZeWNDwK8e2IDlBPtBBPboT+If4UA9id063n512MFyxmg0JBrt4EE2h5xpVfUMCzycVRslScziSpgGbbkQKEVAB6jb/bkt0/U7Jm4d2GulmAV20PXK9+G+ZnmpScXhmBsBZpFUlxYUiH7CixPxbvpAQK4gEXNkzhy497aApt/2vrLNinxg9Tby5T258bvIK7DabxMmuseXnPmwLbCHvLIh77v5O4467aHG7EkdZk3g8dHMohSOMNckQekErJLohK7Y1/4kXhKS9SfDRU3MZ9VV/chrZFV9H7BTPGSx3tKupnL1l6btiFGFjp0SumV8xE1mwacFwa+8C+Rau739EpOvCqrxepdjNQAtIbhejfG3cKoVAK4Lr5PgecLFcOyPGC3FD6QImZ6WzSxix2U20y8LN+KQLL68R+OXBge10/Wtm3QmnNcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0Y2TUQ4ZFNwVm9pSU1nZkxDMnI3NDluWUNTMkgxNFEwQ1dVdEtjZDkvekor?=
 =?utf-8?B?OFpYZG9UT3RDcmpWNHBWOGJKMWsvYUE3T3Q1WlREVk90cHA5QVFvazh2TWIz?=
 =?utf-8?B?WHJCYzMrTGFNQ2JRT09YOFpZL25xQ1pGTjh5L3Arc0VScU1nUjJ0VEw2b3Ja?=
 =?utf-8?B?VGs0bkZ2L2ZxdmhZcmQxZ1UvTFdVMlo1YXpyVjZkcVZLOEV6VWE2amQwdHp6?=
 =?utf-8?B?MmlITERBcStKd3c2WWVHclRWK2twM1preEttNVpOSFNNMXlkUXR1U0Y2RkpM?=
 =?utf-8?B?SGtwbnMrUlhaM1R4Slk0d21WS1ZGZHdtaGszekNZSlZnQWdieldzSlo2MklO?=
 =?utf-8?B?UUY3OVJ1MWl0MGtvQm5MdTY5ZTVxM05VTkVPWjI2N0hPSVhWUDd2U0plOURC?=
 =?utf-8?B?cDVpRzUxRlNqS0JSRHFuOVhmM2pKTUV6b1R1eEpXcUc4QmFLTHp0UitVUGZj?=
 =?utf-8?B?bWdXSHlXcStMalBUUHlNZ21CRGFMN1E5L0FIWURDTTFJYW9LWHYyL2trZUV1?=
 =?utf-8?B?MDZ6OE5jSDlBcFF4VklXZEZ6YjBjRmdSVktmcGpnSU1LNUtnYm5lSGVGRUl6?=
 =?utf-8?B?dUFKMDJqUTVRM1pNWHpPQzNWNE9iSGxPUGxtYWNXQnkybW5qaHhvWHorUCts?=
 =?utf-8?B?dGRqRHpiSmFwcS9IK2hoRTlrLzFzOThaY0U3ZzNiNG5xL2hFdFkvaDNPbERE?=
 =?utf-8?B?UURwTTIwK0wrZ3FFRWtPci9DOTdzS1k3OHhWLzE3a2ZXNCtoV05aQ0M2NDNi?=
 =?utf-8?B?eHQzMC9uemhObXpDOHpqb0h3akxQdUJqZWRHaEhscGtRY2F4RmNrWnArNUVN?=
 =?utf-8?B?VlVvQTVSZGdEbnhaTHNCQ3lXMHhLeWo2SFFGWEJ4YW9ybFRuMFdOMmZ5M1Ru?=
 =?utf-8?B?S0YrMGw5S2RnQVp5cWdBR2xuZEtzTjZKbDE0Q1RJeW1LOG9VTEMvN3ZtSTBu?=
 =?utf-8?B?dWtXZ2dvNnVDa29RM1B5cjl0TllCQS9YU2tUdFN6TVlOYlo2eEpaZjdEcFI0?=
 =?utf-8?B?N2JrRC90YkJIL2hySWlLVXA5bTY2elhYdCtNVm1GWmFPVG14eGM4T2txM05C?=
 =?utf-8?B?Qks1RytubUZYekFLVkR6Y3VFSFdRdEdHT3p1TC9uSzkwRVJINTA3Q093WC9K?=
 =?utf-8?B?ZzZmaXZEL2puSmJwWm1ETExKRmlIajhPbVovRTU0T0NiNEdwRzR4L3RGWkVi?=
 =?utf-8?B?SFdyS3dIRDg0WnlYUFV5NUlIaExrOVZiV0JXWVdxQmQycnNLNXM5Wi9mU1hV?=
 =?utf-8?B?NTNyTkkwbXJwSEtaR0V4TjhLb3JUSVcxZEVaVVlSeEJrNkZZcWpMYXAwY2Yx?=
 =?utf-8?B?Z2poM01tTlhoNzJCckNSYWxrV29IK25BWHc3bmV6ZDMvT2d2bUFqUUhZVXdu?=
 =?utf-8?B?SXlpRnpDc2taMFlhcUIzbXlVRVZNUW5Qb1RGTk1CL2YweHp4ZWdXNHNkZ0tu?=
 =?utf-8?B?WEowYTkzcFl0dk1zN1lnZHh1ZldCODlmR0hQNGtYYWZRUGMwM2hLWSt6Vit5?=
 =?utf-8?B?bXlBd3djWTVhcmh6N1kvaGptak5NVXltdDBvRGxadTFhMlBKcGo4ejIzVG95?=
 =?utf-8?B?N1pCRXBEaVRPSlBDa2ZGc3NjTGliRzRXaXdsbENSVG1iVlJyT3oyKzdtTUhz?=
 =?utf-8?B?ek4zZnBJSmFSS0liK1dvY054dndvam44K2UxQlh2ZllFNUt3L0g5MGxwelhQ?=
 =?utf-8?B?UTdrRzUzeEN5cWxFcXlEN3I1TnlLRUVOT1BOUnAxbnFERjJDOGI0azdPeE1G?=
 =?utf-8?B?QU1nUXBJMGRnR0FjSmNOb2E2ZUF3UVp4L2lFSHR0MFNyV1FrWWFZaXBoc2s4?=
 =?utf-8?B?WXppdXdSZ3ZSeHNDbmxFRFhpNHcwUGNFckMxV1YxYnA2eGZhcHJob0lxWlpF?=
 =?utf-8?B?akFETEU4eW9nWFVLZkdGeldhVmoyZHRFMkE2bCtQTzh6eHJRR2h3WWVOdFBW?=
 =?utf-8?B?UCswcEFQTUhNQXZpVEQvWFh3VXVxRCtYVnI0VU1vRHFkb3dLUVZQdThIRFcz?=
 =?utf-8?B?dWdueksrYlR4Y29OQk5pM2t6L0VQVVV4OUlpN3VCc3lmTUhLYVBzNi9yNmhC?=
 =?utf-8?B?UmF4Qmw4MWxEQlFqN2U4blRZUE96RVkydXVhVDlTMTdtYzV4U2oxZU9sL2FK?=
 =?utf-8?B?d0tUZ3BIYjV0dmJwZkt3NG5yTWZkUEo1VTJONTcwVzBDQnZRa0t6OUZLSEtQ?=
 =?utf-8?B?WlVPNUZsK01yM0xoNnFORnlpQWVzNUNhNDZzWkhGWWpuTkxRbW9aYU4ybGRl?=
 =?utf-8?B?bkp4MzlEdHRKLzQ2dTd5Z3lYSkZ2Snc4RjEzaGNqWEZXL2RkeTVjWVI3bmY4?=
 =?utf-8?B?Z2VGS2QxRlI0UmJoSDlaTDdmeVJvN1dlZVk5ZDhmYmpNOTlaUE9iSFJpSWhP?=
 =?utf-8?Q?5ORdG3UcmWd9w0EQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84018d6-4018-47b7-ad66-08dec0a7bcb0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:06:19.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPhqQ89Fy551A+IuQOej4K+DpLK3ZrXPFA32iq7omiSCdSMBo2rnSmuLth84eHEsKsS1SV8RsqxbaCvhP/OBqSptK3FoV9XwwrWkWgJG9yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR03MB989599
X-purgate-ID: tlsNG-16d1c6/1780405583-8556ED75-0A6F76C4/0/0
X-purgate-type: clean
X-purgate-size: 775
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6D9062E487

On 02/06/2026 1:09 pm, Jan Beulich wrote:
> On 29.05.2026 17:35, Frediano Ziglio wrote:
>> Required by UEFI CA memory mitigation.
> Imo this isn't enough for a description: At the very least you want to
> point at where that requirement is spelled out.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

The discussed exception is (AFAICT) only for re-signing an
previously-accepted blobs, and is not usable for new downstream products
(which is what Xen is in this context).

~Andrew

