Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH0CDctZzmkxnAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:58:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A6388AD0
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271755.1559803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Gff-00068Q-T7; Thu, 02 Apr 2026 11:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271755.1559803; Thu, 02 Apr 2026 11:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Gff-00065N-Pl; Thu, 02 Apr 2026 11:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1271755;
 Thu, 02 Apr 2026 11:57:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w8Gfd-00065H-VH
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:57:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Gfc-00FSdj-Te
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:57:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ce598f-5cb7-0a2a0a5109dd-0a2a450bb9aa-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:57:08 +0200
Received: from [52.101.201.28]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ce5992-bca8-0a2a450b0019-3465c91c3563-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:57:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8261.namprd03.prod.outlook.com (2603:10b6:208:5b0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 11:57:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 11:57:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmEWLLEf31rgIxCWd1Vsg1xGywKhwuEHS75pmuj+2ROtkiSPVGjf7G3hweX6v/+qvUbf/618N5PKxTuBdOUgRWGwcBg1VYaiXlF4Yc+MoUkvUDjifcezIq2DbBNNe7TmKWssBimLfHO1NWUz62iSzvJRzK8nNU/Sm5gA2AbLp8bdiqDqWaYP+9ADC7cx7g6kE+5R6wR5oOxSkeU2KlYGoe/Y2gdrLgLTmL0C3SOUgbp8PxOFy5t5v1+VYCieV5BMpwVPASkBl5S77MLCSx57XmWH3sL5kG+xcCKSFdL/MQCDKZqG0DpbBGpb5PFhmTOI7NsKEhDw1+DL1JgndWarKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27LXP7OPrzIQPYurdOksMR/ZzTLa2Avh0F8HbvZb1TA=;
 b=jyJRK80FxpJdVJZ1g6Z/sKX3VuZBjlDuRU9GGSNMRtJFYykTQxGBzj70QyTFZHLnzY1xFWmeQ3UkugID/OwM/VXiW7glBIe9x+zRDZ2bNMKT135Enkdo69iEmEvmyvm50mgUc9k50LRLWJ3XMWyKatIs3gYdJfDuZQpFai0P7hryArhAdIOIiuB/5+oHY+F5/6P2me+aeMeLPRIeSEnU2uQjtx5KQ2NkiuElaM91qLc8Kt3HYlV+UxXk6v4uRFP4oVTO8ggHfjUMyG6DFR26xpgYwB8CNofWexcol1Byd9pEE5pRZ/zxOK9aHKkpnQ5jKF42/0TIoaEJsOIxbcS5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27LXP7OPrzIQPYurdOksMR/ZzTLa2Avh0F8HbvZb1TA=;
 b=Nu2Qpwu00sKDYfcwd5ypiSZwqweJFFbyfoHDEaAVHezAQ8jruh5XkJuHWUk72fVQ19Nq5dQUohsqKNZFwk1S1rZED+zGniRRs4KM1r/n00jqs5Q+zJrnxGz2XBkK3viNFS+UzzBTofQc2L2djDISTNJsailLN5Qu6bteyhKVdtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8b754178-94c8-448f-9ec2-26b6a23565b8@citrix.com>
Date: Thu, 2 Apr 2026 13:57:00 +0200
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 0/3] Lockless SMP function call and TLB flushing
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
 <17c4e7b4-297a-4bf9-9160-659723d15e48@citrix.com>
 <b0f721a9-42ba-4e71-8250-83fcfcec2313@suse.com>
 <834d60b8-fec5-42ce-a6ab-a26ea9452ed2@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <834d60b8-fec5-42ce-a6ab-a26ea9452ed2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 141e1db2-b319-4217-0a3d-08de90aef585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4mSIRKiwTA8zajXbzEqWB9EyogDbyrbobXFb4tAm/ZH7KoFmf6Gwd7OtrcIeQm7xbuW9K/SLs8MWBqQHcTpJvKwIwt3g3dYf/o3lOrZ+MaJJiOqDY8geBug3Yk/B+SryESWEH17M44Bo0t73b3bTHXy5Alilow2FDX/HvtFpsi8rLFSvgMFNVdnEsk6GjC8qiMcEty/0pNT1mCHX05d5GSUazr2IWCzZIljHKewjtSfep4kjbxtoEd0YmG8A/GePvf2PU+myYZbLojvdjiRIA+WChvpQ6kACDetW4lNk48fLhgzcY6ckC4560jOEPxgz5rrL6rNFQ+2wcTJoVCFRDXG/pnhUa5qyLS3/fNf8XrL4RJML2ppleqn4qa3yd478VTT0hWa/u9IiLRuWAmV4WkqOZlJiIqrnomn7ongmoU1q/I8WVSWld7JFaMwd+z8+ecyWHSC+DITLa16Xg6HG9k4Ew6pc6qdk35O7keJIMOXNqF5aVq7RgfEAp++yNFHGLKimTEAxhCo1spULMrR5PK4CwN86c/y+CauVc3ec7GaVfDcInF7i+DCbllR66vgu4ZgM6cG8CDoDnhtVxFjBm4sKj4WNgMcJpe2bABdk2CcnlVrM5pQfc6XQEpGvWiQksKUnOPgQBs5DlikMo21P246+8dWbEyZIXBc+z4fzwQyP12hZb8HFxGXuNoVzkDG1qEPuIcPGtsL2YHaQTJooJc6vOrSawqfAGOwB78NC3WQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjlQVWpzcVRmblZEVG9NNHA2LzQwZTlZYndIck1uQSsxQ2FKVEtWOVY0UGR2?=
 =?utf-8?B?bmVVV1NOSmRwV2JDeWo2Slp2SG0yTEROcVFCYkNVb3E5d3R2ck1heDVseU5X?=
 =?utf-8?B?aGZETm93RHB4LzZPaHBFWjk4L1c3Q09pY2FZWExmZEtRcnpwQUxXcUVWMmV1?=
 =?utf-8?B?cWtOQzZ5cU42akNxcUtWc0RnZGg0WExtSUN5d3ZqY3pkMlBXQkdkYW9aWnJk?=
 =?utf-8?B?Q2RhS2tDM1huREgvL3hFSnd2U09hZWRaVEZtb2dHQitOUG8wR09nWkk4ZTc3?=
 =?utf-8?B?dlc5UG5abWRZUjQvWnExQ1ZIOVNUbUs3Y0s3Z0RXcHhxR1NVVVV6eVFlbm5j?=
 =?utf-8?B?dkdZZ0JyOVBPTWtFOGR3di9yZEMxUy9VZ2xGd2h1UE1nK2F6SHJZMW0xNmRR?=
 =?utf-8?B?ZUtJbTBCYVdlbno4RlZkN1ZqRm45OHlacmd1Vm5tb1ZJc25tS3lOWjRNT2tj?=
 =?utf-8?B?Z2k0NmJkTkRwUnB3b2xUajNSeFhKbG9sOTBYQkhRQVI5aDlOMlBzVFlMK0dr?=
 =?utf-8?B?MFprV094ejgyMTlPdFN6ZWRlZmJYUWljSExuVm9ObnJEdk5DcTNZM1BrY3NU?=
 =?utf-8?B?MDc5TFU1dUZZaTVJbzFqeG1pNE5TVlp6WUVjMHFIS0VGZkhlUUYwdUMxY2xh?=
 =?utf-8?B?OUIybFJxZHhsaEFkZXE0d1JobXdZemo5SENXZzlxSkU4VTZaV0ZGQ20vVG5j?=
 =?utf-8?B?U2t5ZUJaL0R5RnUzNjlsaTRFYTFrOVlubkMyWHFqTHN6YzJJcUFvU1hJOW9m?=
 =?utf-8?B?MEhMVURkNHJESG4rN09jR0M1SUZ0VHRvb3AzdWZqTm9nN3l6NVJOeTlwVmhr?=
 =?utf-8?B?WHpFWDQrT1NtcS8yWnJKb0QzZy85Y1RaL1Q0MU1aMmhhSzRuazNOZXV2TnVW?=
 =?utf-8?B?a1R1VklDUWpZZDZWb2NDNWw1SEpNSTFvdU5qQmhmOWdXdU1sRzY2Z1ZiVXJ2?=
 =?utf-8?B?RERydEpXeGdDYWU5d21JVytFRWpRdHhWNll3KzFncWVBM3IwbGZnNUhHLzV4?=
 =?utf-8?B?VThuM0F4NWR5SE0vQnhDK3Z6Sk1Zbm5WRzBXOXovamJBZ1NpaW02YTRRVHRR?=
 =?utf-8?B?bm1GS0dnZTZSeWZ2Y01zQytyU2ZLYlZkSEZGbC9TSUxBNjBHLzRxL05GTVZt?=
 =?utf-8?B?MXVHT1hXaDhuK2dnTGJmS2FlSzhGNTZYSTJ4eDErWnlMSER1TmxTZjdybDVv?=
 =?utf-8?B?UlpiSHhPRytyTDIyWXQrL3JveVFOZGxSRXo5V1NmbHVkR1ZwanR5cXVFdHd5?=
 =?utf-8?B?eWZCcjZlWVRQMVdHV0xGOUtGeDBOVFQ0dFhNbWpYaDJkZWpOYlFRcm9HNjhM?=
 =?utf-8?B?Zlc0YUx5cjRhK2tBRzdUaGdQR1ZiMklJQllBbEVuSDV4NzRDRVhnSmM1K044?=
 =?utf-8?B?NllIRWZiaThTVFJBb3AxaFRKWDlaS3hKZHA2VGFsbmxNMUR4TUhVYVJoemFl?=
 =?utf-8?B?dVlYcnM1NnVEZG9US2hZOGZNSjlXbXFsQUZCbVFnWGtXb0Z1bHlacCticXVm?=
 =?utf-8?B?MWdkN2F5Nm91K2NHeXNUWWI5dDVHMXY2eUU0eFByMEhObUdJL1VFdldlT1RD?=
 =?utf-8?B?aGRYNkhzdHFzWlBYelhiZWNZOFdKYTR2dXl1bFdkclNGdUFvRzRneCs5UWs4?=
 =?utf-8?B?WUMzSTdWaklzSXgyRXFKcklOcXNOVEVSN1RHY2p5YnZ5N2ZYMHRQQXZtVU14?=
 =?utf-8?B?NGdVaW5GWGljTnFoY3hJR2htWmluRkp2QS9wNGxFelJQdk0rUWtTT2xodzNz?=
 =?utf-8?B?c0ZXdGo4aGlkVFYyZ0E0RTIzMlpVSWQrZVQrNWVMRk5CcGxFekprZG5LUmNB?=
 =?utf-8?B?T25LNldEbHJXTnBPSUFvQjkxWm1MTGtsQ0Qzc3l1QlNtUURtQ09vRktsamZa?=
 =?utf-8?B?dEdoZ1B4dWsydUN5UzRNeHo0RjNUQ3RrRktNQlkzT3daTytJV0JRSWgzNm50?=
 =?utf-8?B?VnVvQjVHQnRsWHk0c1NBT290TjFRcDBwL3cyd2tnOHZRY3JuQXZ5UDUvTWxC?=
 =?utf-8?B?UUsrRGtxc2dTUENDeStML0hsVzc5YUhnWlpOeTNyQ0lEdzlqSnErOVVFaWc4?=
 =?utf-8?B?aGVTQ2hkN2ttTGFDaGZsbDhnQW1xbGg5UlNJa2lPYVR4enJJQk1xaHpZVlBj?=
 =?utf-8?B?SXJEckpJRlM1MUVhNzNNejd0U1E4SkNXN0NzM2dxZFVlRXBpWTN5N2I5djRQ?=
 =?utf-8?B?Wm9yOCtHSkNPNkU5YjZSM1hKbnE1MW5PSVZ2Z2FLZTdaR2FMRFR2aWdFKzdl?=
 =?utf-8?B?RGRpSThaZ1NrUkc2aHdyaW1WemVCQk5pa0pIWmlQdnd5VkdKNERmVHYvTnFj?=
 =?utf-8?B?OFRwaisxRzJXWUxFRnd3ZWdoWVRUWm03VURrbnFEd0VWQmlyS2x5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141e1db2-b319-4217-0a3d-08de90aef585
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:57:05.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6/nmex6Sk6C9nZ1V2ci1Wsyu2AoCMtuMa7occyRt/2EvPqym6zTfSXdtLugpETkd/JNeEc92V9J3Yul5IWlfM3Uku+LG6HCyjuxRJ2hqIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8261
X-purgate-ID: tlsNG-42698a/1775131028-EE9492A1-A4BB5A9B/0/0
X-purgate-type: clean
X-purgate-size: 4298
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8D6A6388AD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02/04/2026 12:57 pm, Ross Lagerwall wrote:
> On 4/2/26 9:49 AM, Jan Beulich wrote:
>> On 02.04.2026 10:40, Ross Lagerwall wrote:
>>> On 4/2/26 7:09 AM, Jan Beulich wrote:
>>>> On 01.04.2026 18:35, Ross Lagerwall wrote:
>>>>> We have observed that the TLB flush lock can be a point of
>>>>> contention for
>>>>> certain workloads, e.g. migrating 10 VMs off a host during a host
>>>>> evacuation.
>>>>>
>>>>> Performance numbers:
>>>>>
>>>>> I wrote a synthetic benchmark to measure the performance. The
>>>>> benchmark has one
>>>>> or more CPUs in Xen calling on_selected_cpus() with between 1 and
>>>>> 64 CPUs in
>>>>> the selected mask. The executed function simply delays for 500
>>>>> microseconds.
>>>>>
>>>>> The table below shows the % change in execution time of
>>>>> on_selected_cpus():
>>>>>
>>>>>                     1 thread   2 threads    4 threads
>>>>> 1 CPU in mask     0.02       -35.23       -51.18
>>>>> 2 CPUs in mask    0.01       -47.20       -69.27
>>>>> 4 CPUs in mask    -0.02      -42.40       -66.55
>>>>> 8 CPUs in mask    -0.03      -47.82       -68.39
>>>>> 16 CPUs in mask   0.12       -41.95       -58.26
>>>>> 32 CPUs in mask   0.02       -25.43       -39.35
>>>>> 64 CPUs in mask   0.00       -24.70       -37.83
>>>>>
>>>>> With 1 thread (i.e. no contention), there is no regression in
>>>>> execution time.
>>>>> With multiple threads, as expected there is a significant
>>>>> improvement in
>>>>> execution time.
>>>>>
>>>>> As a more practical benchmark to simulate host evacuation, I
>>>>> measured the
>>>>> memory dirtying rate across 10 VMs after enabling log dirty (on an
>>>>> AMD system,
>>>>> so without PML). The rate increased by 16% with this patch series,
>>>>> even
>>>>> after the recent deferred TLB flush changes.
>>>>
>>>> Is this a positive thing though? In the context of some related
>>>> work something
>>>> similar was mentioned iirc, accompanied by stating that this is
>>>> actually
>>>> problematic. A guest in log-dirty mode generally wants to be making
>>>> progress,
>>>> but also wants to be throttled enough to limit re-dirtying, such that
>>>> subsequent iterations (in particular the final one) of page contents
>>>> migration won't have to process overly many pages a 2nd time.
>>>
>>> In the context of a real migration, both the process copying the pages
>>> out of the guest and the guest itself will be hitting the TLB flush
>>> lock
>>> so reducing that bottleneck may increase throughput on both sides.
>>> Whether or not the overall migration time increases or decreases
>>> depends
>>> on many factors (number of migrations in parallel, the rate the
>>> guest is
>>> dirtying memory, the line speed of the NIC, whether PML is used, ...)
>>> which is why I measured a more controlled scenario to demonstrate the
>>> change.
>>>
>>> IMO throttling of a guest during a migration should be something
>>> intentional and controlled by userspace policy rather than a side
>>> effect
>>> of some internal global locks.
>>
>> I definitely agree here, but side effects going away may make it
>> necessary to
>> add such explicit throttling.
>>
>
> Explicit throttling is much more important for the already existing
> case of Intel systems with PML. With log dirty enabled, a VM on an Intel
> system can dirty memory an order of magnitude faster than an AMD system
> without PML.
>
> As an aside, for the same test an Intel machine without PML is still a
> lot faster than AMD so there is probably something to improve in this
> area for AMD machines. 

AMD have PML on the way. 
https://docs.amd.com/v/u/en-US/69208_1.00_AMD64_PML_PUB

There is a mis-step with how support for Intel's PML is done, meaning
that draining the vCPU's PML buffers is extraordinarily expensive even
when there's no action to take.  (Specifically, the remote VMCS acquire)

A better option is this:  When logdirty is active, any VMExit will drain
the PML buffer into the logdirty bitmap before processing the main exit
reason.  This way, you drain all the PML buffers by just IPI-ing the
domain dirty mask.

~Andrew

