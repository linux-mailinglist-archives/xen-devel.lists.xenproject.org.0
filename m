Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K2BXO5owRWrF8QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:22:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B976EF338
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:22:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=oiI7wOum;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1350116.1607684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewkV-0001eR-FN; Wed, 01 Jul 2026 15:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350116.1607684; Wed, 01 Jul 2026 15:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewkV-0001cB-CK; Wed, 01 Jul 2026 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 1350116;
 Wed, 01 Jul 2026 15:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wewkT-0001az-KC
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewkS-004tRH-T0
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 17:21:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a453058-bab6-0a2a0a5309dd-0a2a450988c8-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:21:12 +0200
Received: from [40.107.209.18]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a453067-97e6-0a2a45090019-286bd1127110-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:21:12 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH9PR03MB767167.namprd03.prod.outlook.com (2603:10b6:510:3e8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 15:21:09 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 15:21:09 +0000
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
 b=VQKCFizZRfdDmZcfUKJXOAg6ApNqkrpTVNn1FRMZFKFSXX4SDXN5EV08heIOa+O3dGIEhTg50VWYXMgg2sm/EF8hmEqiE7yABv0F1juQUrgiEkLwFMPE9IF+CTJEljcFT4O8hKdrNjDHBlEL2eHeAhs/3FbpmZv73mx8Ilsvt1S0o7OExpIpPWTxyU6UoQlrQpmqHJi1VcWJ9jWj0XhQsPF4BxW+Y24YLqEt9shIVMJdaP45w4yTfRNNFVj+LWgyobDpoqS+PiIm6kDPqBw3iMqbQjwba4xJzP9cxKq8AL6pWqEoc+9szYEjwTqAhXViHryDTHh7qPwI+S4WdJMpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAzW1JgJSGu5uCsBpSgF0sIhfKeZU1U9S6FwoWB2HCE=;
 b=xs2FgaDIVGba/3rngiI1BZk/HAWUXCwtQZ8xTdOHKEUr9l28fUYssLYSa/EOlEQJYubKS/1Ad5S3pWJDW9LUPXQ1IF6mTPP4WjeaE1mor60afkALHs3UrxRn96HdFufbngmGSWfc9Ficiwu7m2YUEAma+3f+oUUPnNm3cjzqJ+Mli6ky6bfBHiCnQk9N+atVHmaf57s0GlBlPgDwVUB5Qszxdt4yo/7Ay6wXhg26xNBXJI9buhekCjpUaubnhlaCP9RV+zUOy6KSM0dvEXEOQyPMXLP7+EEtfUFPgg0hBdZmePvhjJNiUEtGrKUl50+XfML5TG82dkr7+nGGlFYbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAzW1JgJSGu5uCsBpSgF0sIhfKeZU1U9S6FwoWB2HCE=;
 b=oiI7wOumGxq404/1nQRFf9wlYPtW/omRoa8/4VZzuVlS1MVZ+0XS/EPqZIcKssB/UYnzVbjeHjGyWFQe9VqNmycwGtzBPvvIYJYOaAGA+nKUtxZLoPoGOJdK94JymT0di9kK2m8WiPpVWXeQIT872K3q7kFXH9pYbKFI37AHjos=
Message-ID: <53018bb5-0ad4-449e-adda-6b2d94a0935e@citrix.com>
Date: Wed, 1 Jul 2026 16:21:06 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/cpu-policy: set up host policy earlier
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH9PR03MB767167:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcfc8b2-4edc-4ab5-f82f-08ded7846099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gydi3p13ADVaFomIlvVoLfgtM3t8qrf9VkQGJrhIRk+YC+cI9loRkjZEisujRwXETct5ra6+Xkq6FndTyt+eL5wAw1oM6bj5InOCTuMt1spyO2PF4FlUDPXwzQfRMvCIgTy0rrw9C7hj3/gRu2ttZmDRwPnsVyhm5WTv0MuIwFQanGtvVBNHFGcKrD0KLRdqZapiNniWXoyEAxlsmfOFWCNC1GQOM8OphzI3FD2SZNJSV2HCiFfEOg8HeweU+Xymw3d009qnEtQI0Gc9BYeXhTBH3CCVGlJwBOZlEDG37AQMAnuYfR/GxJm1PO7jw85uuC+dJ/W0BammZd1J6FpdE+sN8PmQiN6EkWF+9zFirrRraIkptqEDadjSOfp1zhW8oxouyL7pwrYe51D0ELu1RLp8J2wwbZTDTQr5RUAOFt4+11C6sAc9rjuNZDKW7V+SK72vi0phBLzGl7A4dH688185XxOQhk67kdw1c4EtmtyjkdvoquhMxgZzVDHDZ9wXrSaQWziqmmCpPdISAOrpjnUJ7199M1SBnIIw7X4mXJFuGvyRZDMNz227oH5ZQ5uvWYgJ9NPbwJ98WWUHREM9JC+Aq//iLrZL/VT6yr3K7YRUB+f4Ghg1RDakt+72T7Bve1QarSU31HaZwQeootmsX6rbiDEF1Pagb0c+pYeB+do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhWVlpzbzQ4Wmhjcm02MStCUUgrVDRtbFd2NEhsNkgyVVlZRWNNNWE2Q2xy?=
 =?utf-8?B?eTQ3WGVDb1VicThVODgwaU9OTnVUbU1lNlgzd29SNlJPc0lVaWxFMGM0Vnp1?=
 =?utf-8?B?ZndGTE8zNEsxM3NVdmMrWU1kZWV2cWlMUStBcVJ3djNKKzZ3eTZxZ3RCRzlx?=
 =?utf-8?B?VTJBYnRrYm1CR2ViSFVDMUhicXdDdmxJR01ZTEl5bkUxbzZhZTFzdk5kU2Zj?=
 =?utf-8?B?ajZ4bTZybDR5TFg5b3M4VGwweHQ2NXdNZjRhZzN3bmprYUpXVlJjSEdWSEZ2?=
 =?utf-8?B?VncxMjlrU3NmT3VVSXVIOUQ4QUw4dEgycStKODgrMTAxeTJ2MXhQQmFrSzdI?=
 =?utf-8?B?eWVVOTdKN3M3ZEZQdko4RXNnYnNNMXl5TVE0VXVuOEJudEVBNkxlNSsvdHJP?=
 =?utf-8?B?bmNmRHpORFFHa2xBYWVvMzgreUliQlhtMlJodlZ5QTNzVzBBbUhMcnR5eERW?=
 =?utf-8?B?OFdDSUhubk1YdWh0U1l0Tm5kVktPSU0ydEtmOWdoZHhxbVdVRmp1ajhaMmxR?=
 =?utf-8?B?TEVveTZMMVhlbU42b3ZGL0x5M082WmsrUC9FWUVMNEhRak0wYWJwemFiYVNn?=
 =?utf-8?B?Vm03TjltS3BoNWZ5ak1rd285S1RRaVZWcDkwamxncittUVF4Wkw3N3RaWlBh?=
 =?utf-8?B?OWhTRkpKeGFzdGdVZGZPelNPRmxyTUZCSllXelVSVFc2QThQTWxkTlhOR00w?=
 =?utf-8?B?UGI1cmtEdlRxNUJkNitzWi9kSjhBbEJ6OWw1MW1ZSEZIVEVVRzNoQlNTL3Vr?=
 =?utf-8?B?TXlCL05Ua2E1TUZMK1pRS24xOXJMRk9YTVNkVjdpQkRGZjFpQW1OZUdFWHZN?=
 =?utf-8?B?NnZ4WkJDZ1RDY0VvQlhtN1Y3b1JMcThIRWsxR1dseGRTYmpqVE11NnFGR29D?=
 =?utf-8?B?S2lNYlg3YnhIYTNKdW5oNzlNYmxPRTZlY3N2YzFXRkd6alk5SzRuN1ZycEdT?=
 =?utf-8?B?ZWl2RU1nVVlaS1NJK25sRkMyeS9oSktLZmZraFFXZUhNMmJnQTZ2ZVB2eVNT?=
 =?utf-8?B?d2ZreVdHSjgzRFhSMzhFZjhIa0pzWTF0T1lTNUl3NlNzWXY0ZFdlWndGR2dQ?=
 =?utf-8?B?OEplT2pKK0R3c0JnaTlZUFUwSmUrRFROSGJTRDRYOTU1VW9SQWZmSlhlSFVl?=
 =?utf-8?B?RWU1aEdTcy9vRnNYSTBSQ1kzdnU4MFZYVENWUXc3cktGektzaFA1V1JDKzFs?=
 =?utf-8?B?NWtsRjJSWDcwbFQ1WDlHNUhOYTJOSVJValBMWGNyU3d1SlZXVUlscGJvSG91?=
 =?utf-8?B?ZXpsQlNFMjB5c3gvMlc2Uy9ETWJ0eG1XVCtxYUcwaDl2VSttZllkUXQ5Vi9Q?=
 =?utf-8?B?VG9ka2RuYXNwMnVUR0h2SEhUdzhBcUVxR09uYzBSWXBUK21Cbi9PR25CaFlG?=
 =?utf-8?B?T1hsZVdFeU1ST3hqSEVySXlmampyekw2QVJRdTZVc2JXLzl1QW1CaXBIQWxR?=
 =?utf-8?B?U1ZnaThCb2tYazJDY0QwMTBoMnVwQmdVODgzbmNQR1QvSWlkTHlpK2VHYnlx?=
 =?utf-8?B?dTBVUlpGYUVEcmlpNUMwSmhnTXBHMGRyZ3JLaG80M3N3YVBiT29ET005NEd3?=
 =?utf-8?B?R0NOYm5QeklTTThkVzY5bkhibWpGTkxMOXdCZUxhZ2RFbmdxNGVITzA2QzV5?=
 =?utf-8?B?WFowRStJSWFBUWViNFZzRm1Sb1VBM3pGSVMwVE5RNlJUS2M3VXlQb1JEU2V4?=
 =?utf-8?B?eU1uQkdtdVdEYUFZOFdocmdUZ0x3dGFsSmY2alJ0cE1sQnBRYUVmZS9JWGZ1?=
 =?utf-8?B?anp6QjB6WDNaUk1oelY2MmsyTlNMamVDK2wwTGljbTN5d1BnSi9uNUR2UXZZ?=
 =?utf-8?B?T0RaWWIzM2d3V0lxTXB6QlprN0hCT0YyYjdKWk5tZitaUk1RaXNxK2NjTFFi?=
 =?utf-8?B?ZnlubFhUaXNnNndEVXo2Mk1uSkY1RUlwY052Q1ZpRElURjBnN2JHUUlVSHhS?=
 =?utf-8?B?Ui91YTJzdmlIYVc2Uk01T0dRSVZYRmxwdksxR2QzdkJPZFJ5Wkh6LzFvUVVi?=
 =?utf-8?B?VENmaWZSejZzeGRlQzFaMDdsU2U2TE84YXNsYmhqeENKVE42c1BEd0dFb0sx?=
 =?utf-8?B?RmlCMHg2eHM3cDZrazBjZ0FoZFVJNEpVbkJOdUtDREd3SW1PcDE3UEduNi9n?=
 =?utf-8?B?M2ZJb3VCRzZtQW9vMVdRM3hDbGRndWdNRG9tN3pGTWxCMVNpcXZiQ0JtRUd1?=
 =?utf-8?B?OFVxN3Ztd093ZXd5a01tejhJcXcxZkI1Ymw0ekNWNXFNU2VPSFAxUEdjL01X?=
 =?utf-8?B?cm9QUUorbUdzd3cvN3FLV0Q5TmY5ckJ3cHlFRUdIK3NLQ0dzMEtaMWtPa0FW?=
 =?utf-8?B?dU1SZ1Jqa3lKUnBGdko5aS9qZ2JWeWNPVEMxdEdZZlcwNXE4aDNkTzNmYndQ?=
 =?utf-8?Q?upw22urUBHGtPvXU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcfc8b2-4edc-4ab5-f82f-08ded7846099
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:21:09.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vd6Q1GVGAHf1ORCKVSetd87NwrCLE67HS/vO1nvif+5SUJWEyroMAnCy3mVlgByx3h7urjN8v5I3KuEWvZXt3sumTCyQIOVYuO9072S0FU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB767167
X-purgate-ID: tlsNG-bad1c0/1782919272-4693A986-4B85F7DD/0/0
X-purgate-type: clean
X-purgate-size: 2755
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
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
X-Rspamd-Queue-Id: 47B976EF338

On 07/04/2026 7:46 am, Jan Beulich wrote:
> In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
> needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
> that towards the end of identify_cpu().
>
> Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In the longer run we may need to (also) update the host policy from
> setup_{force,clear}_cpu_cap().
>
> This really was part of one of the XSTATE cleanup patches at the head of
> the AMX series. This explains the specific placement ahead of the call to
> xstate_init()). Likely anything from there downwards shouldn't really
> live in identify_cpu() anyway.
>
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -586,6 +586,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	}
>  
>  	/* Now the feature flags better reflect actual CPU features! */
> +	if (c == &boot_cpu_data)
> +		calculate_host_policy();

calculate_host_cpu_policy() now it's not local to cpu-policy.c

>  
>  	xstate_init(c);
>  
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -359,7 +359,7 @@ void calculate_raw_cpu_policy(void)
>      /* Was already added by probe_cpuid_faulting() */
>  }
>  
> -static void __init calculate_host_policy(void)
> +void __init calculate_host_policy(void)
>  {
>      struct cpu_policy *p = &host_cpu_policy;
>      unsigned int max_extd_leaf;
> @@ -904,6 +904,7 @@ static void __init calculate_hvm_def_pol
>  
>  void __init init_guest_cpu_policies(void)
>  {
> +    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
>      calculate_host_policy();

I'm sorry, but no.  The cleanup work to CPUID handling is in an attempt
to purge this antipattern.

Double-initialising data structures *is* the entire reason we have
order-of-boot problems in the first place.  Having a structure which is
initialised but wrong is itself wrong.

Really, I should insist on a revert of switching cpu_has_* to use
host_policy.  It was not adequately tested and is not compatible with
how Xen starts up.

But as I expect you're going to object to that feedback, I'll tolerate
setup_*_cpu_cap() keeping the host policy correct as they're called. 
The easy option is to call x86_cpu_featureset_to_policy() each time. 
The lower overhead option would be to have a table similar to
cpu_user_regs_gpr_offsets[] and use that to locate the feature word in a
policy object as it's being edited, although it's yet another thing to
remember to keep in sync when adding new words.

~Andrew

