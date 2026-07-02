Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jrIyABtxRmqYVAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 16:09:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489206F8B74
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 16:09:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=yyLLAy9u;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351930.1608927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfI68-0002D1-D5; Thu, 02 Jul 2026 14:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351930.1608927; Thu, 02 Jul 2026 14:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfI68-0002Ar-9X; Thu, 02 Jul 2026 14:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1351930;
 Thu, 02 Jul 2026 14:08:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wfI66-0002Al-Pw
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:08:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfI66-00EvtM-0T
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:08:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4670f6-e002-0a2a0a5209dd-0a2a45059590-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:08:57 +0200
Received: from [52.101.43.32]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4670f7-3cb2-0a2a45050019-34652b205362-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:08:57 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH3PR03MB7508.namprd03.prod.outlook.com (2603:10b6:610:19c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:08:49 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 14:08:49 +0000
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
 b=mY86+0PeAFLHOpNwnQRFu5CYuTNmSOfF3u+9/uCH+QTVZLbpODfVjfC5vffcf80RDD5xBeLZwp6cLJUmpIIuPVboOyu0MM3O51k23reyPBRP5xnMqdhimdlTvPsUljzpeepfg+P1rYEc13umvOOXs9RF59CXPSZoWE3bheA1o83wgKONUu82q33wV4K9ZpWAcesr6Uag6aziYuijpzIyikyL+DL2TNkTqwuCkmG+/wnZI6OKyfWYTLFijQYt1Y2GKYs0Vw19VkBmUsi4j+05cVzvVoVQwmXpnvFmIp41mL753/zQ70m30UsZOSFmaDqzG2uSNF6/SO+B8/VSzkMiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofN1ll3EDoK8dYwj/6OEn+2jPQWTZas/sO08x1VmQLY=;
 b=hHfvaShjYm0HMSG/3OsGBTeZ4UUirYcjJ7FyzQBonL5BB20MG29bV+vAtJyJLMYCqgIKQXygwGwCiFBjl9Zs/IqjZxfOrugsusvwk5zjOto2QEKB2ANozvlJ33JYnfXiQNEcMADvZ2WkKD/NcH6N6Rui/3u6ninIBe8bF72CvL6C5mGnOFJuYNAEckJQKsdB7V32EW2LmfAqczdB59WEXeYZhGJ5upvXwhLAff+apSR5NCI86Hk86sHhtvGT0oKUSa2iS5orvWVlStHWpBwDL9NLbDlYSlaJFT9YGxtOivtVzluKjJ2txg8lXE9mgjS89VKcvcCHWjj2SNJwVBhm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofN1ll3EDoK8dYwj/6OEn+2jPQWTZas/sO08x1VmQLY=;
 b=yyLLAy9uj/hgOTxpJ+VlFGV518V1A/OlhQiSdlmOool1EPpLpHVP60NSyhrKOq1EQlD28Lc5RDRTU3G2L/JwEelnsGUL3LlfgvYHYzFiAW06okNK08FJNlbCcSMMIG/6beGx0iG/l6ERDQcmj738tIlJFpgLqz1ygYKHkKWKmzY=
Message-ID: <012d7d69-39c6-4e46-a817-83d57169f323@citrix.com>
Date: Thu, 2 Jul 2026 15:08:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/4] x86/HVM: don't (almost) open-code POP_GPRS
To: Jan Beulich <jbeulich@suse.com>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
 <a89951cb-43c0-45bd-aba1-273cd053deae@suse.com>
 <6065311f-15b3-403e-b39c-f9652f0513ff@citrix.com>
 <20836109-fadf-4ad4-ad9e-9fa44883716a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20836109-fadf-4ad4-ad9e-9fa44883716a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH3PR03MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a29e7da-cd13-4e55-8eed-08ded8437041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6jRGnI3c1N3XNNJcqRxIQoXenReal/+d2tK6D8QyVZLkqZ8OyXZvCOyphfXE2Sx8ZPHtL9GbVj5y8Ek6dAsAlKwK3EBmpi38dv6fAuNXCTQDKtuSVXw2WWR6XVBCrH35vBnfC40vl0hwhuEBg/0BHBaIZWjpE9uOkC2s/cHOI2IzlCTRs9a42EJVn7m4+KRG7htURkYe8bzVsWZn7s984cLtUUuIm7Ng+OZHojxD8F9KTgMONyNNUNpWrfrNlrw6yNnULPmgP69rXW7cilGhNiwbiPBT0aKXko+nClzbk6d2upOzocLkppA1xOmG+Dzjw3tf0jP+YtmI+zhYx15p1cHIaC22nZlsvEfyjNDx1glCmobrNSxFS7MAA+lokonnA3eAkryG2HtgJ+oCf33qrccalyT5JbkQW0Ll9PdbRJSKEg5CWcZ01yukBCo63fKQ1dCu4CQ+vvsFn+k+/Og4KF5RpBZWR+BoTeTNtftHGMeA8ijlidc9G5FuZwKqFFofcIpPG4zuxGSPSlwCRXa61lVsprR6ylvYke08IoGdtnIkkXACTN/DaVTTiiZOxnVvqeGn8l73lCrB/A0TZDnAFt6hb1ZJtm0TeJVj/DA87LjUeVar9vyTAmsJ6a0vEKa0ElMmBiGLdnu9f7Lid60H1flOcZTcjOzMxjpFm1BIP7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTRrdFpWajFQNWp2R3Nuc0hnOUhVVVNCdFhZU25LOExiMDdWV1RvNGo0cTVi?=
 =?utf-8?B?bEk2WWVqaFpqcW1PNHNLcjgrQ2w0VE1vdkNIMEQ5WVJLL2hjbS9RR1gvNGl3?=
 =?utf-8?B?L256Mm5MYkJMcjBGTFY1RklpcTU4YVgzQVk0YjVJSkR1ajY2dEQ0TmsxclF3?=
 =?utf-8?B?RU9YSjE2QjVZQUZqek40VytkYjF1TDdZTWZoMHY4TmFEVTRkQlhlNUZDTC9n?=
 =?utf-8?B?VkJ1a05FaGIyRjF4NUFBR3Jqd1Azb0VCV2g1eU11VTAwM0doWklxc1ZOcTgx?=
 =?utf-8?B?M0lNWWhveUJzZUFaa3BOejF6VnhRTVdrYndkSkt6bFNjTXR1TDIyanhhb3Qv?=
 =?utf-8?B?OS8yUENYb0hERSsxL3M0ZkhZTEN4Wm55NDBGK2Y3S29HN01NUFUwZFFTQllB?=
 =?utf-8?B?SUZGNWRhTGFYWTlXdzljUG1PekEzczY2VU9KcGtTVWJQK2JuZXNZT3NaN0xJ?=
 =?utf-8?B?UjZRemFxMTkrb0lPcXR4WEJFT25yY28zK3FlL2p2Qm14M1J5ZCtQWERxSG5W?=
 =?utf-8?B?TDJRSm5qTVNiekJIVncwakJuZVNuRVRtZ3JVOVF3Vk9rejgwL1AvNUMyc0xa?=
 =?utf-8?B?MzZNenpqSEU1ZmVaVnpUNVhCZGFmNWY5aXIweVJ4Y05sZ0dhU2Z1VGd1V1pM?=
 =?utf-8?B?eDV4RVMxSFc4N1N5cEFTaXFKTnVPN3o5TGFlOFlsbkFxQWVJOFNGcWJoZnhx?=
 =?utf-8?B?VGF0dmJVS2dVc2YzVTBXakpQRzNZYzNXbnh1SStVL1VYeVkzcThrc1JaZ1J4?=
 =?utf-8?B?Q29nR09zd1gvaG95eEcyVWsvNEFYb1JhbnF4bHFYZ2pTNzh1N3hmTzJTSXBU?=
 =?utf-8?B?WU5YcUk3WG10YkFyMEVuV3RFVDdodjIySXFHcFAyZEJ5WEt3ZTVHRGgyZGM0?=
 =?utf-8?B?OHBjdVNqQ1JVYzFQMGZBbTdvaWdJQUluSlNMY0JmWm02amFoZmprODY4MHpt?=
 =?utf-8?B?R2NycGtlZ29YWXpmU29qNFJrMUs4SVNRb0l1SDRxWTZXNmlQME10YkZzUys5?=
 =?utf-8?B?dk9RVFFVcXRhNTRCaVV0QWtnMi9mWE1vNDlML3N3VU02Wm0ybk5nbEhvVkdB?=
 =?utf-8?B?VG5hemdSVXU0T0NVbzBCTmxaTlI5SmxGRVRrYTV3eWJPQVo5M29yTGZMR0lX?=
 =?utf-8?B?T3ZyazRMUGF2TzB5S0Y5ZGZ2TVQzMHZrMEMrYVQzdXBnM2hPOE50RDg2anBv?=
 =?utf-8?B?ZFdOZ3MrWlp3UHpsdzZEbEVPSDJsdHlMemtjOXA5RGFnTmZvNDhISC8rMWxo?=
 =?utf-8?B?cjFoYmdiWEcxSHNOV0c2Uk5UM05mNDRUYWY0RTZXWVVDSDJRRlNURno0MXE1?=
 =?utf-8?B?aDBMTUp6cWcxamJWYVZ4TFdJUW5hRVRGMnExRkxadk94c08zRE96U1F4emxI?=
 =?utf-8?B?QmJ1eUhmY2Rsb1Qzb3UrYVI5WHAyL1ZDSkQyNi9TaUxCQVNtMlRrQ3dzbkph?=
 =?utf-8?B?VXJYVmFidy9Za3NYcVY3cU5RckxZMXltSktKR2RVTzJzQVBGTkhXZStoNDA5?=
 =?utf-8?B?ZlJKWVNkUG1DMGI2MkNnMm5BL2Y3SGh2Y0laVUtuRVdYYU80VU1saktVZ2Ry?=
 =?utf-8?B?eVdXTEk1elV4TjlsM09KVThzNDBxTGZDekZaZWMrY2Q4REhhUVdPMjdtVDMr?=
 =?utf-8?B?Wm10dDNKVTEwUWR4MnkwWDJNclkyS0VtT1QxdmV5VG5YWTBvems5NTNqOXpr?=
 =?utf-8?B?dDBBZDNMRzFXMGdjVDB3b0M2b09GWWt4L2taVDQ1RzhGNVNyVHBXTFl2UDNz?=
 =?utf-8?B?TzhGSm9oQlVqejhoeDNRQWxlOURCaGxFZUtLYnZoWGpZY2hJcFpSTjlFSEt2?=
 =?utf-8?B?QnRLYmtFMGhidCt4OXlxREoyUzBkSXhlNy9QcC9ycCtxajZtdVgyOGFEUUt1?=
 =?utf-8?B?VzVzTmJlcjRER2tDYjcrMWhLZE9pNHVDODZrb3JiMHh6ZU9iMGxNQjZZSUZ0?=
 =?utf-8?B?RHRhSmt3VXJoOFlvc1FROEE0dzdyRm9TNGpKTGhnUWJsSFFCWXJCVnBTTEF3?=
 =?utf-8?B?aCsrOTY0MDJHMlI5ZXlveVBQRytTV0tKbjlwS0JreVF4VjJKZUJRbCs4cFBK?=
 =?utf-8?B?eXRnRzVydHB1RitOczh0S0xaNElTZG4vanZyLzRSVGZZYlZGcCswZnRnYUtT?=
 =?utf-8?B?VUV4c3YxaUhkY3hmN0x1U0R6N0dxM084TzlHQ2dOUjRPZllYY3JqK1NaVFdR?=
 =?utf-8?B?VjVsakwzK25YSXRlamZtRW9MNFdRWnBNK2tuaS9CRGJUamlLc2R5UjdybWwz?=
 =?utf-8?B?aVpzZDRaVDgwVjNXNXUxUGtQRXNoTy9sOHRsYzVMTVZZbCtaaGlBRExMOFJo?=
 =?utf-8?B?UHQ2ZWJTM1BxV0daZ3RDOFBYQlRrcEptaVVvZGl0di9tMjZCMW9Idz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a29e7da-cd13-4e55-8eed-08ded8437041
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:08:49.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vC5euabcpXtDB/XJ4XiVgO78RaKsdv+VofFfE3tvLJwdKSReJZf87gBWCTFkpl8qv6YvjMoaOHIir0l0ER6SAkaim5Zhl4lh4uPDcOGhU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7508
X-purgate-ID: tlsNG-c201ff/1783001337-0DD0E2B8-2014AD2A/0/0
X-purgate-type: clean
X-purgate-size: 1453
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 489206F8B74

On 02/07/2026 2:18 pm, Jan Beulich wrote:
> On 02.07.2026 13:31, Andrew Cooper wrote:
>> On 02/07/2026 11:55 am, Jan Beulich wrote:
>>> It can be used as-is for VMX. For SVM the special treatment of %rax needs
>>> accounting for.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> This is the minimum required as a prereq to the next patch (to avoid the
>>> need for custom adjustments in the two places). We could go further and
>>> switch to using PUSH_AND_CLEAR_GPRS at the same time.
>> I've got several part-series that result in purging SAVE_ALL/RESTORE_ALL.
>>
>> If you want to put this patch in, then Acked-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
> Thanks. Yes, I think I'll put it in as one small piece in the move.
>
>> but I firmly want to finish my series before
>> patch 2 adds yet-more complexity to macros which I'm wanting to remove
>> for being too complicated already.
> Well, if you make this a strict prereq, then I might as well make one or
> more patches myself to replace at least the SAVE_ALL the next patch needs
> to fiddle with. Or else I'd like to understand when you expect your work
> to arrive, as this series imo is one of those which have already been
> blocked for far too long.

Get this patch committed, which will resolve the skip_rax issue holding
up my last attempt to make progress here.

I'll then rebase and try to collect everything together.

~Andrew

