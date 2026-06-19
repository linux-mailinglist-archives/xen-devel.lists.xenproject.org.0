Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SgGK3YJNWosmQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:18:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027486A4ECB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:18:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="yBJ/rO+S";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341951.1602245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVMA-0002SN-Ny; Fri, 19 Jun 2026 09:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341951.1602245; Fri, 19 Jun 2026 09:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVMA-0002Pb-Ks; Fri, 19 Jun 2026 09:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1341951;
 Fri, 19 Jun 2026 09:17:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waVM8-0002PV-V7
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:17:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVM8-00C8zz-8e
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:17:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350930-5cb7-0a2a0a5109dd-0a2a450acdd0-26
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:17:44 +0200
Received: from [52.101.61.31]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350936-93a5-0a2a450a0019-34653d1f0a2e-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:17:43 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7172.namprd03.prod.outlook.com (2603:10b6:510:243::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 09:17:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:17:39 +0000
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
 b=NBJjAsK0jidhI1dEcM0eWzD3aBqXfjyXWAIva7jeFyQdfpk22ZmJiWkVtOB4pFCcAKFP/2gI+UqCX0T42YLDuRED0hXa12XUmXoFSJJTmaBEavCtE3B4HbH476kmqIv4sVQFDVk7kuGoTcJLFpE3zMeyFMVsX6Um48c+EQn7pUurppmxDo0suhAa6yQmo1tZCvoCWVrNZHIzMHJGjkhDNYA3+QTYT3LsiVLuIIexnY6MkaEe17HSqnym81D8o+4rtjYesYqoPQ3qKECWoTuOdmWjMVP2yMD78yGsc1ZrNVr99q+crTRkTUi9N3QmsGtNk2JQitBI0agKqY2AP18hrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZemEauOI77TDW8u2NgQd9cLF91NkOl8752hGMCW6q3A=;
 b=CF1sExTIGtDnacVkBgYMGRD78HNArrLeOXg5h9yI6OPpvQ02DyfjPaXHhasPRGeus9M1/lyK5jO1zyj0/QD8ShOUZmKSQf43qDHyaRrmYFv4hLyGKlHdifr7sz/gKz8cp6qRMIz4/waNXVbgedaz9A8nSBDdgt0yS1Ag5ltoeKbb7ONyglOjwk5AuG0BWm1VFnFjGkbXfM7Y8p6gw0MmzOsS5pNXYHB1uSLw6a7c2TuRH/n5xU7X/pIxyk5renH7FpXsFD1kkmNxj6XUJq7uuESla+Mvc1KJ19ta028IUPRkhKh/mAMvwhj9CIvmP6rL71crkJS9DaC1zSvCQaSXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZemEauOI77TDW8u2NgQd9cLF91NkOl8752hGMCW6q3A=;
 b=yBJ/rO+SlilICBQs1ZVAnnoMKBXJhQXFm5PoUeQ/K0Pfpa/jF9pXy/RFPlS3z6K6rjEkxxH8UFiZ4Q5BuZMooF6+eusECVHli3Ro9tWvZRyLd3k4zORXQr7cYHqbmd/BbZ6SI4f5S5XoWE2pNWhp9L+31ZQvLYO4AbqKQ6/BD6U=
Message-ID: <ecb9c38e-6375-4f49-b413-631d583a7afc@citrix.com>
Date: Fri, 19 Jun 2026 10:17:35 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
 <b7e19be5-5326-475d-8c58-68673ea159f6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b7e19be5-5326-475d-8c58-68673ea159f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b95a08-8fe1-4f2b-f0a4-08decde39c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	78qmGJwVH66bMN1TuSjuuU3dmN6DqZwezEP9ASklILEYJGW7GVSoupDIaeOLZp86uyHP0afSEPLOHvbO7fJ6fMI4f+yOsh7lFJi3ZdF5tCCK6v3hpXZ3Az6Ed53Ozq04kFSQGzFvJT1wU6KMxtsk+heXS/sGl/l15cFuijD1JP2AbHp4k0sxEUxhD7tSrym0bBXKGBHJ2SlaYaFdWxT6rMo1g0ikV3/Dt+0nebv0E8wnxFyMtcRQBhX5hhqFgbwji5/wUivuRRzqlW5UZYB8N0X2keTmpDlMaCcKLfV7QFDq3pV+6FzA4hqC9nIIzZy6YEx/Qhn6sBBgNigUtavGUxkLqKFNjvJfFQpVV2KBre7/4eI6xUNEk3lvIGCo4hvtM7/K4LnBQzsHrNTdMhTV9JvTXvovItlp1tJq2QKBrblyBM7hMwJuEPtVKY/CFwjxisOwZsHpvPPX11wjdyemhz8IFd9t2+7CReBmnaVQ4Hmusp2vAtQrBxBcy2PrD+yeVIP4oW8bDaoO7X4ydqMF1YFb1ILQH7sbg8XCBnuiT1XgwUBBSDCzN+iCZ4UloAFB+ngSuln/98mseB24mDkqAaIsuIQTQpXprUjeAfiPxy5ACw/6XqP4oQHod9A+PIXAMnCF7tIV22RFZXALKj29h64vNMv4XrBS+wUxt3ogd2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0dycUFKUWQzWUI1b3AvMW1WUU45UU11ZmZDMldvcWJhWDFlNEFoN1l4Rkg5?=
 =?utf-8?B?QWIyK0pOeWNYU3d3WkVYRm1hTXVleEUyVXhoc1N2VEd3ZFpjaVZtT0tnd0xm?=
 =?utf-8?B?RTFoS2pGWEhPYUljSDgvSWRIdVhkUHFmTzA0cEM0c0FnUWN2RjNiY2tWdGFG?=
 =?utf-8?B?T2dJZFZWcFNPdVlaRWxVVks1emtZc2c2R2NJZE9sclJEazFCOTVkTXFlVkFr?=
 =?utf-8?B?Q0NmcTc5WGVpYUVxUnNMdUdiamcxNEpPTGUyaUdGTWZ3NXIrUHM2cmt0V0M0?=
 =?utf-8?B?cGI4ckFaVFVWazAvWWViZ1pZWlN6dXUzY3lkMzBxK1cvVE9acU05YUVSNzJa?=
 =?utf-8?B?aVEvcXZUMzA3SVdxK1ZGclBiM1ltbllWSkswYzJPZ0ExZFJPZWEwaGZCSzBO?=
 =?utf-8?B?SDBBRnFRQ1hXak43TnR0YmNOVGFIMkpPWjNaMzNLUkpicTAvc3VRU0wzUjRi?=
 =?utf-8?B?TFB3Q0lPem1sM010VzBZWnpnNUNteTRLd3lIUm9US2RsZm5qOUd2S1d5akha?=
 =?utf-8?B?NzRjNkNTNTc1aVZmNTd0UEJxQVQvdTk2YmN4SGY1OVZDOWMwdWx2YlRTU01l?=
 =?utf-8?B?V3J6RG1kU1FQYnFCb3ZrM05IY3FwYStOelJ2Tnk1TFVJZ3oyK2pkNUs0VHVG?=
 =?utf-8?B?TVYvbUZiU3hTTGxtdUdmR0JnSG1UWk5DaGZXWkw2Ykp6WmRvVGkyWkpwQnhE?=
 =?utf-8?B?blB0VUpaUHBWai9FQWYwVU1FQzZpQnk2QngyRzZOQWdFMmZUWTZUVHhUOEs0?=
 =?utf-8?B?Tno2dFpVYzY4b3hReTJXZU9aSEtmWmE1a1BZMGJQU2dNcjBHZzBTZTF2T0kr?=
 =?utf-8?B?bTBOYzR3a09iaE9paUJRMGR1cThmenhxSkdKNFBNWGZmNXg1amNiRHArYmM2?=
 =?utf-8?B?aENWelAvcGNzWktlTmo0STNva2wzNm9tVlZPV1VHNVM1b0J1ME0zZ0tEKy9P?=
 =?utf-8?B?Y2VGMi9nVTFiNUFRK0t0SUFZVHJQR3VMdUtHOE5rNVhNbTNKbWRPdTJ6Yjl2?=
 =?utf-8?B?MUFKTU9scUNObFFSVDRIeEhCTzloV1p3azl1K3hVNEFJbFZrQkNHdGV2YnFM?=
 =?utf-8?B?aGpyalB6UDZTeUNIa25DOXNuQlcvd1F1aFNFUDdmN01tOEdpZFNPU3hzc3Bk?=
 =?utf-8?B?Nkw3MTk2ZUZvYXl4WHFHU0ozU2luSHpnaUVWRVJWZ3pvaU5BSkM5TVJUQ1Jk?=
 =?utf-8?B?akh6OHVmMUNlUDlPTjZtbzZRTDZKUHA2cUcrRFhDZnNxOHQ0cFNGWCs5QmRt?=
 =?utf-8?B?aTNWL1k1eE5pRmRHMDBHZU9ZcS8zdlVtN290eXNsaURPK2JSTkhTdnhpcjd6?=
 =?utf-8?B?MExxaktIa1BUQ1F6aE9Tdnk5dkZ2bmF2OGYvcGJNVTl6VUdhWUdQNWJlRDEw?=
 =?utf-8?B?bGplU3NaTEVjRzVlVEVaZ1dBSi9GemhvWkl1UUJzT294VjNzSmJWeFpWSkVv?=
 =?utf-8?B?RHNaaHFHSmVGL28wcTFLdkNmdVM1cHBlUDdKT1NWUlFWbEZJZnV2Y0dwUGJX?=
 =?utf-8?B?d05aeHZCNDlqQTZhMlRXVHN3WjNKNk5BYm02L1p6YWRYUjF1QVlWdU11bTF6?=
 =?utf-8?B?Y09rS0dhUHNxdHNUSkJUd3FjdHBYQ2U2dzlOakNsV1QyZ2JhV2VzUWIvVTZL?=
 =?utf-8?B?ZFViQzliYXFod3N5SFVjUit1UlJuK3pGbGc1b2hRdkYxS1ZGdzU2VmJkbFZa?=
 =?utf-8?B?QVBwSTRVSzlnNUp2NTE1NUkrQVFGUHpucFVMSEV3aGVJbnJpVk11am9JTllI?=
 =?utf-8?B?TU15elNQZUxjc3oxMXRzdlV5REVuZVVhL0Y2TlhUS0xoMGV1MGFjc0lMVW1L?=
 =?utf-8?B?aDQ5cC9vTDBDVGtXK2hZM0x1L0tycVp3ZG5NSERSZXBqalRqNFZrdlV0RWJX?=
 =?utf-8?B?Mjg3K2VMQjczSTlDYlNGSHNpSG5NUjRDbXB0MUFMaVVRY1Jja05oc3VGMjdq?=
 =?utf-8?B?OFNkMjhqTHhQVGR3RXJFSUNEdXRPcmQ1bmFQbDhDSk5kSmpkV2J0MUZKR2RK?=
 =?utf-8?B?bGg3allQcEI1ZWZISnZDMExPNm45RWFxa3dwcUUyQTFpQ2ltSFBTQVYyQmZs?=
 =?utf-8?B?a2NjK09JRlZscUoyWmVoMVEyMDFDM2RLeitORWtRSDRPRmFEUjBWNjRzWTVZ?=
 =?utf-8?B?N2Zsd2F3TiszdUNuaC9DSUs2OVNxWWpOVUJaUWhTSnVhYzZ0Zm1nbEVTVE91?=
 =?utf-8?B?bWR5Q3RDNURycVpVSXhzcXU0Yk9IcDJReTFMcmN0K0UwTHluR3A0Z0wyd1Ux?=
 =?utf-8?B?NWQ5bzZvR1pEcWU1bTVQR1FLTXE1alBrRzJ4NThKSENLT3llMEdRWmUwNyto?=
 =?utf-8?B?MWZGZklXUFJXWks4M1RkMnBzRUZlWURTWWduU1FSQll0Ulo1Qm1NeDkxRmFk?=
 =?utf-8?Q?1skjSXUl7QVC9ldw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b95a08-8fe1-4f2b-f0a4-08decde39c25
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:17:39.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMMH3CvDuETdLtAhcVx9iDIUPRWBI4rSgHmzzPA4KnEudX2+jYYNQo2IgbX71l/XQxPEG+G4+EBPzQDk6bVZ4IeNO5eG3NrGBFhxSDEiWTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7172
X-purgate-ID: tlsNG-4011c0/1781860664-B2FEDDB8-5110B149/0/0
X-purgate-type: clean
X-purgate-size: 1025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: 027486A4ECB

On 19/06/2026 7:14 am, Jan Beulich wrote:
> On 18.06.2026 16:50, Teddy Astie wrote:
>> In many places, we're parsing a PCI string into individual
>> parts (seg, bus, dev, fn) and then transform it into a pci_sbdf_t
>> using PCI_SBDF macro. Rather than converting from parts to pci_sbdf_t
>> and vice versa, introduce a new function that parses a PCI string
>> into a pci_sbdf_t structure directly.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> You introduce two functions without callers, hence two new violations of
> Misra rule 2.1. I understand there will be callers by the end of the series,
> but I think we want to remain Misra-unregressed at every patch boundary.
> Even for rules which aren't marked as clean (and hence blocking) yet.

I'm going to firmly object to this request.

2.1 is not checked and has no viable plan to be.

This patch series is nicely structured for easy review, and I'm not
happy forcing it to be worse just to satisfy a check that is firmly off.

~Andrew

