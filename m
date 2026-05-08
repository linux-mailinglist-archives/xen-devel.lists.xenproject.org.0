Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDpUJfO6/Wm4hwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:29:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527A4F507A
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303428.1576838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLIRb-0004jt-TE; Fri, 08 May 2026 10:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303428.1576838; Fri, 08 May 2026 10:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLIRb-0004he-QV; Fri, 08 May 2026 10:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1303428;
 Fri, 08 May 2026 10:28:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wLIRZ-0004hX-WF
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:28:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLIRX-00E5Hr-RG
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 12:28:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fdbabd-2eae-0a2a0a5409dd-0a2a4505ccb8-32
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:28:29 +0200
Received: from [52.101.193.64]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fdbacb-aaa8-0a2a45050019-3465c1401bee-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:28:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7911.namprd03.prod.outlook.com (2603:10b6:610:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 10:28:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 10:28:25 +0000
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
 b=pFMFP1+9nXmTGE7gbf23P/UoI1+Rbo2Byz6vcVDd4aFRYcubInLScBOBMFXJMDMr7iTwVhdF8vmHcRgeXkDzAXlnIf1kac6ZEbz9Q31kTgwlcNEQ/OBppvFxSUVrR1Oo+qXNrLAlO6WkdeTjA01kJsMakf/v385l4sEhk/ZIVTaQNDuMrPwSOGrpXtW7ouEE96c4/nDVIiXCHfkNi/Yn6FQdIPuC2VkAWDoJFL2um5xOVwR/WYo9aGKv1uRWCsLh6fUmi7KFgkhrSl7W6vJ1pJZEo6oE3xVg+eemESBOl3/6e11djs0+rLdoErt+dpODOS7fPJCxz6yysJ62UiJ0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V48m4L42VS4xbszVUHsA8cxurEWR078XX2Jt5QIHzI=;
 b=Gl/utOxmG4DK7EHG2c9+6DIXrxxZuEuDosHHzOQNhBh8u2VO43lWRiR8RRfLq8DVyLzx57lwLNKWnEtyLPEeB3hrH/8inRZHVQIad75A4hB5729bOVxzDw6BBRB1CqRVjqqeYZr51+gMbuviiRQbtO5S4gpPwNy5HCRENBPJbneSJgjwZEGnlf9IsL+2ox86gKyDZYTrzkpIWO+HevsysNxkwX+JKR0hfcPboamm3RSaBvAHGDxO1jwdltrupqDzDCH/PWTdMpyyLHSvsb6aBTMduNVTNbFCKpX/ra8jkVFgcdKQ1mfpuLVfLgIFuDF1V9c5mMhpp3whUg3aiuJgmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V48m4L42VS4xbszVUHsA8cxurEWR078XX2Jt5QIHzI=;
 b=l9svk+yRZq98hcDCC9WjXssU5dilghSRJCkSCrwABb/h72K4XkWMV302PMYfagcmMJ0oDrLcZt0ZyUbi/USe9aZ2o3J17rOX778IZJ457jJv+fAOt7Om/6mRS9surGU/KaAAY2IkFfkzySuvhp6O8ErRL6lOLPvfzz3rb5Ujafs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9c46a08-4343-4f33-ba7e-5466f8522acf@citrix.com>
Date: Fri, 8 May 2026 11:28:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
 <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
 <15645d19-f19d-4955-8315-0188aa834eb6@suse.com>
 <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>
 <be5b5e70-a61e-4803-9f40-873ce5381328@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <be5b5e70-a61e-4803-9f40-873ce5381328@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bcd42c-966e-47f2-88e0-08deacec8975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xL8sMIw9NVTkdS1hDOvBYDyNdr2G4/YfVUdXulutSxni/9LWZcOIacOf02GOBmPYS5tKy0+Spe2YBuZN9Eq9Kn2yxuJvKF6J2fxsS0cPFU2H8Cea4OvHFdtfXm+TNUiqKZ+DRGke/jIiJCViFIS3T/7kh6jlUX9UdBHkiJe/mpW+5Udga4QuU9OkJfRHJVhhDPvj1KKddG+FjDw4FV8Vzq8q6fAukeUT484KxFwPgm4ugkfAkGoNiJIq6muDNHYAoI/cinlVTgQK4WoUgvLO2dbdKkpdkJ78r2icIpewIoevCo9ebz4OCNDf4amiGr2DxMgxJhUZgAa7SHBaHpGQJsm38m3H9xa/11GjX/ix7+7uotHCFUi7QstOQkAJAxXFDhog2mrzOqAtkyCoIswc1UxNnpIV9b+Iatk07RitxoeFDhGrqDLsFEC6GqaXSZ57ZPtGPIPWerxFyRT9kO2HWmM4J5YQ6e+Pd6X5eAsLISbKNFh2Mza1ppjwlYVfWRqlemBuKQuxnwqUyq96Y4n5lobJ+SqhBpP1t6HPICE34Uy9SIRQjGpILcXRrCm8Mh0FhyU7xUWE+P1gwwhu9TEv5NcV7ans9X2jnsWjzh0ksIxzCbO2h0wirv5oRZs+LbVqE+kS3fXxPOubz46KFUCd7WrEcczOre67SF70eLtMbSK5MixF0m8DJJU9e7W7l4fw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWtGRDgwcnQwcHIyNS9TVGhJZWxZaUFVMkdKMTdjclN5WklGZDlwUWtoSWlu?=
 =?utf-8?B?WXcxaXl1YlorVmlTSGdxVnB2MTVuTnNUY1kzbDN6RHlWOUttMTEyVEhGb2Na?=
 =?utf-8?B?UDV4SXRFSXFlQWlGaGpLMFh6a2UrYmswQ0IrdktreXJkalhkQUdDd3RqWmh0?=
 =?utf-8?B?QXRtVmxtanBkdTJnVnpSUFJhbG52OU1EeHdrdXVLUmdHSTVBRDRtS0ZKMFpU?=
 =?utf-8?B?d2tldUQzOStUVGdLV2NUUXpFNUh1T0NsYVNPZlRWNXFHK2xqdDZkYUZIUExL?=
 =?utf-8?B?R3RPNzVNVEtDUnhoanZRZXpEWUpHT01udkd1bGJuSVNmZWd3dndDb0pDbjNz?=
 =?utf-8?B?NG9ITjBONWM4dzJ4bDl1V05HTDdCSFB2MGlSdmZZZEsyQ0wwNDY1WFJwYTJD?=
 =?utf-8?B?N0t4czVZQXFSUzdTYzhKMmxVTzRFdFBhc3NGWHgvbHpMcUF2bVNtRVo2TEJ3?=
 =?utf-8?B?SURhckxsSUVJM2s2UXRFNzlKdXZkdFNVcEZlMnBiU2NKM01QczdGTEVRRDYy?=
 =?utf-8?B?VzZ0TXJ5bHVoeUNUR25CTkl1QWtxcWFNZGtOUDBJajRhN1RXbUxkRCtRNjNs?=
 =?utf-8?B?N0FlY3BWcXRNMUpSd3N6elVFM2M1NHFKNk5kSnhVOExQUWdraXBWemxSSk9P?=
 =?utf-8?B?cnl1YWJlMFppWWplT1AxZVh5RDR5V3lzUGROV2RnOG1TVEdpV1pVaFNBSmNw?=
 =?utf-8?B?MlR4TGlsbWg1VW1raUJqS3ZnWmcrbjUrRU5ralo3bU5kcUJjQ2Vkb2lGWFQz?=
 =?utf-8?B?NHVQcDZXakVBRnVmdzFnN3JWNEF5WXdNbTJpSFIxak1YQ244eXIyVTN4UHAv?=
 =?utf-8?B?R0hEWEEwbWx3MkNTdUFXR0txSHJEbzl2aFJvQXJUOE9oSDVJQlZuK2R0eVNG?=
 =?utf-8?B?WlNvNTR1NUZmdGZDOExicWxnYWlwaFMvM05xMjRZSnJOMmZtMlhpWW92dlpj?=
 =?utf-8?B?RFpZdU5CWlA4aW5VenhhNnpJclYyWUtRcThKTktDSzFOMm5KUUVuZkhnNms2?=
 =?utf-8?B?N2lpSXJyUkpBZlFnaHpJSFMvMk5UN2E5NDBJSVJwM0p6Tmk2UHVYaHRDc2wr?=
 =?utf-8?B?UmYvSkJKYnI0QzNUVW1KUUluNForVGp2aElKeFh3cDhpaUJuZnpBVWlUTitJ?=
 =?utf-8?B?MzB6dC9pOHMycVptcGQ4WUpqQ2dGQ3VzWmZlemxKSm1tU3pxbmdnaWZLU3c1?=
 =?utf-8?B?eWlabW56RDhIWC9NbnpLU2pvZkJhbXBvZUl2dzZwS0NBdjVQdVpmS0RrUC8r?=
 =?utf-8?B?V3YvWGxWL3Q4VkZUWDR4MnBmUVNiYS9Ka3A0TEtzOGQzVmppaWViZjcveHpG?=
 =?utf-8?B?YkQ4SFdBamFqNGk1U3ltVVZZRHJ4MXBnb2RLNnFHcFJ4SjJVc0dYSDlQR1Fy?=
 =?utf-8?B?bUJ2Q1lub3B4T0Exb2FhYTYrVWx4d2s1YytNL3NlTmdpSWwrUERZUTMzRXhl?=
 =?utf-8?B?YnVkUzFOTytCNTJOL0x4WXNvTHlWdHpHTWdwM2NVZElJRlNZbnNiVHh5MElH?=
 =?utf-8?B?VHBNTDRPM1hFakFXb0I0ZFltZFhPK0RkU2M3N210ejdhZnJOa3Z6bEhGVFda?=
 =?utf-8?B?LzFJaWt0djB6Nkh3MnZlSzFxT0xIODJsRzE3SEFIc1A5TVd3dkZUc012TkVa?=
 =?utf-8?B?eWE0ZHM5R1huNURMUEI4YmpJdHF4eVU0QmlqTEJLWGlMMzd4YTRPL3JiWDVi?=
 =?utf-8?B?NFR2WjBMMmZQTmIxVHVHcVNLRWp1NGpQejN5S0Q4M0lGbU81Z3l4Q0paSCt0?=
 =?utf-8?B?dGsrRDZVT3R0UHI1ZVBqS0twaEkvSEp2RmNTWmFmUDcyRm0wdytGcHBoTEFu?=
 =?utf-8?B?NWlMOWdYWEhnSzd5Ull4dlJlZDJ0YjhFeDM5cEZ2QkdaMjU3NnRqUWViUlFm?=
 =?utf-8?B?VWxDOWNIZHVyL2tWUVhCT2tRTFUvUjF5RWZad3pyVWJHNkhmL2ZwWlZWV1ds?=
 =?utf-8?B?d09PZlJXOENhNGI2SmFHN1NpVkNvZVlUWlBuZlQwMTU1MDE4SlJZcXJJa2pY?=
 =?utf-8?B?ZjNGcFVyTUNXNEM5NXgxdEFxcHo4TEJpWUpMOVAvZyswOUFIK0tHajhMK3dm?=
 =?utf-8?B?RU5XZEZxckZ3bTR6NkVKUi9ESkRzaEF4TW5EaVI4SjdBK2ZyRWtsV2tYSlVq?=
 =?utf-8?B?cUxaRkF1ZDF1TDhYaXR5WCtaOHI4MU4rdDJKTTdRN1ZtUUR3eUFIU3VSVHBH?=
 =?utf-8?B?Yk92eXdoVkphVWRRbnc2anJIR3FIMHl5ajdadWdzcWhqK1lMbGxXNXpGcHZm?=
 =?utf-8?B?NEtiZlQ1K2lIZTI0OFkxQzZ1MWRMQmRROWdmN1FvMlQ3b0IwNW8vdktrKzRU?=
 =?utf-8?B?OWYyRmFZNmJmVHAzZkZHQkZ0cjdxMVpOVUhQSmZsZkdYTWkrUG93a3dlaVJR?=
 =?utf-8?Q?3vRfg21zWATioFic=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bcd42c-966e-47f2-88e0-08deacec8975
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:28:25.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DrzB7uGQtTLIerf15LfX8kVyjMS7egcsG4rCTmmpI+kjvp/ZyVbts+KBv/ggNDsHqH4oiTW5qFEpyvRj3MhxHDPk+iV0AlnSfKZSV/Pots=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7911
X-purgate-ID: tlsNG-c201ff/1778236109-DA969443-23C5C4AF/0/0
X-purgate-type: clean
X-purgate-size: 3784
X-Rspamd-Queue-Id: 9527A4F507A
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:jgross@suse.com,m:kevin.brodsky@arm.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08/05/2026 11:09 am, Jürgen Groß wrote:
> On 08.05.26 11:54, Kevin Brodsky wrote:
>> On 08/05/2026 10:53, Juergen Gross wrote:
>>> [...]
>>>
>>> But now I think I have found the real culprit in
>>> lazy_mmu_mode_enable():
>>>
>>> static inline void lazy_mmu_mode_enable(void)
>>> {
>>>          struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>
>>>          if (in_interrupt() || state->pause_count > 0)
>>>                  return;
>>>
>>>          VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
>>>
>>>          if (state->enable_count++ == 0)
>>>                  arch_enter_lazy_mmu_mode();
>>> }
>>>
>>> Consider a preemption just before calling
>>> arch_enter_lazy_mmu_mode(). The
>>> enable_count will be 1 now, but there was no switch to lazy mode yet.
>>>
>>> When the task becomes active again, context switch handling will see
>>> lazy
>>> mode enabled (enable_count > 0), so it will call
>>> arch_enter_lazy_mmu_mode().
>>> And then the task resumes and is calling arch_enter_lazy_mmu_mode()
>>> another
>>> time.
>>
>> Agreed, this must be the problem. I did wonder whether the lack of
>> atomicity would cause trouble...
>>
>> arm64 isn't impacted because it tracks related state in task_struct
>> only. powerpc and sparc do use percpu variables but that shouldn't
>> matter as they disable preemption in the entire lazy MMU section.
>>
>>>
>>> The only chance I'm seeing to avoid that would be to disable preemption
>>> around all instances of testing a condition and then enabling or
>>> disabling
>>> lazy mmu mode.
>>
>> I don't immediately see why we would need such a big hammer. If we
>> revert commit 291b3abed657 ("x86/xen: use lazy_mmu_state when
>> context-switching"), then arch_{start,end}_context_switch() should once
>> again do the right thing for Xen since the TIF_LAZY_MMU_UPDATES flag is
>> separate from lazy_mmu_state. I think it looks like this:
>>
>> lazy_mmu_mode_enable()
>>      state->enable_count++
>>      <PREEMPT>
>>          arch_start_context_switch()
>>              xen_lazy_mode == XEN_LAZY_NONE -> do nothing
>>                   <other task runs; this task is scheduled again>
>>
>>          arch_end_context_switch()
>>              TIF_LAZY_MMU_UPDATES not set -> do nothing
>>
>>          <exception return>
>>      enter_lazy(XEN_LAZY_MMU)
>>
>> Nothing else should be checking lazy MMU state during the context
>> switch.
>>
>> Does that make sense?
>
> This would work, yes.
>
> OTOH I don't like the multiple conditions used for testing
> (state->enable_count,
> TIF_LAZY_MMU_UPDATES, xen_lazy_mode).
>
> Another variant would be to just let the Xen specific code tolerate
> the double
> calls by disabling preemption in the Xen code and checking via
> __task_lazy_mmu_mode_active() if anything needs to be done.
>
> I'd really like to get rid of xen_lazy_mode completely.

Without wishing to interrupt the flow too much.

In XenServer, work on migration performance[1] has demonstrated that a
very large number of multicalls issued by Linux are single-op multicalls.

(I blindly assert) these must be coming from the lazy_mode logic, and
they're even less efficient than making the hypercall normally, owing to
the need to marshal it through the multicall ABI.

There's a possibility that you can simply delete lazy mode and stuff
gets faster.  (Although it's far more likely that the difference is in
the noise).

~Andrew

[1] The dominating perf problem for migration is ptwr emulation and
Linux not using a hypercall, which IIRC accounts for 40% of wallclock
time during live migration.

