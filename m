Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C/gjOlP+RGrB4goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:47:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557E6ECF5B
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:47:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=XsFlseGo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349855.1607494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetPW-000140-Rj; Wed, 01 Jul 2026 11:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349855.1607494; Wed, 01 Jul 2026 11:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetPW-00012Z-OU; Wed, 01 Jul 2026 11:47:22 +0000
Received: by outflank-mailman (input) for mailman id 1349855;
 Wed, 01 Jul 2026 11:47:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wetPV-00012P-47
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:47:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetPU-00Amoy-HG
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:47:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a44fe42-5cb7-0a2a0a5109dd-0a2a4508de3a-34
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:47:20 +0200
Received: from [40.93.201.38]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a44fe46-edec-0a2a45080019-285dc926ec90-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:47:20 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH7PR03MB7046.namprd03.prod.outlook.com (2603:10b6:510:2b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 1 Jul
 2026 11:47:16 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 11:47:16 +0000
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
 b=ZnZuBgRKmk9wnAttSHvXEUNc/Zw+81XGTOoIuFiW+rnV9nx7cpb/wtvL26u/P+thGr/Rr9zyPr4f5ZMHHe/k04Bf4cz2sn4+IUcXwNV0VitcRg8GbO0G/rITzmjWlkQCwK8MYVnVRbJzYrzIoRAsqMU20tMH5qkPxSH+1ZbZcJd/afIJFxUEeO62iaOnMc9bA1NvYOJBlIRB7SMdFbWxW+BX7YhenPMzSdu0bZygE8ZUR6rd32k3bDU774u1aH+Mm08OVNNZ8b9AZnzDByBg0dvqeVohTz2D8kw6WoTEqrvivCukhwD+3ykWE1mcTA7wKu5r6UgI/YxWJfIQf5ESeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXjQ95t2lfcDtpe47bRxVISFPg4U+DnFnDalVW391eQ=;
 b=bQ6AESssJ0o61uZdXia/cNatm88u4pk8CtRx9o5V9F6Otlll9iym4RTBRKrtR4SxaDeE8IQyLow/8dWBvgwPXBLruhpTfApXXVfC6Qi+v20WDIQGfRZi9i3U967fMsVparXNhvA8nZmTti2T8GI0gmps/FlsuoUPGy484rt8CP2NED/e8ZiAHe5xdsN19/DFV8kjPMUG/rvbubQVGl1GIOTdjYorn6q9FOKOq3IdPFEv3l4kLFjk8nLVZ64fgL01DVyVvR0SVl7p+VEbbzBbY4Jc+ZTaxSETrTfIjpl7HYwVXbkdJgf3IAOLN03k042C12g9LaXyFC8W3+cK6JPRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXjQ95t2lfcDtpe47bRxVISFPg4U+DnFnDalVW391eQ=;
 b=XsFlseGop5aJpFTpu9uxHrjoDPFJpDmgWsfMD0katQwSKn0SicBBL86WfAUKypWqvkCTZk41ra8DlBj9/iSBpZzp5/mIqtnej3qEnIBcbrDQg/Ikuvly2U68az5iUAyC9r3vPavKTZOdDjzkziyZRUg82Y4U1i9U8oZLOknnZ1M=
Message-ID: <7ae3b2d9-3455-49e3-ac37-cb85d1e043da@citrix.com>
Date: Wed, 1 Jul 2026 12:47:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 08/16] libs/guest: fill directly iov structure
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-9-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-9-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0611.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::10) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH7PR03MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd3e53d-c311-4d72-eaa9-08ded7667fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eUz/Syqc54wr7COrUFVDM2qadCLMAGzQbJl4GGlGwb88p2Gfr28V0ebBBCZOwkDdZAWcQj38uJ++lzxSwDg5LBFCuSZ/1yxIhR5n62BorGQ0YcPFmtWkLqzzqQaxhAasMgDcN6tnv0kg8bsqjRL0RMNshcYxqLoGvSinQJ27ce4PDGmZgCXGhT17EO8TzkuictLkLFb42l1I5QL18WBArjq0UgFa6GUSZYc9qALac2Cq1k2XV2Z8TzGVOx3y9SFoXOBGmxW3WIM3FEei3371Z9op7jTPLq0KgGHxii8eMJzI8t0qEFdyn5QgjGiBK2RlutTEWvPzIfIdoQYh9kPrvsAi1weCeVWijF6fSN/FOD33H4BKKJhietk1x1We7wbVWhiG2qJZuMDDkmP0c8oSJUXGxtH0SRJtaxARUvPGffobEOj3AVdMtqVBaaA4flC2y2SUIOBP+LiWBmJBqNRaW2MViqSpjoooCTyzYxUWbIC0TUn9xlZZ171X8U5g9F8tEGtIw+lK+NpEc5ZIDn1pg4sRWZakQjTjOWGQaUqx8ocdYdjWvtWUvfZfWuZTxvjvrpc1C+rtRYsvgTvEkHYQmjW+ZjYt3cmWKoMxfXigdxh2G2SWYTNBmwd9XSUZkLNv0T+6/ha6jHKDR59u3GZ9Fm9pl2f40mAsUXmgT3vNY5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWh1aGNRMVh4Z1Y5YmNqNlBvdlpRVTY4NTVTS3l3RldzVm9iWFNIMDFCNTF4?=
 =?utf-8?B?b1FETERqcm54TWhTTmh1bVVaZFlESGRMdnpjamhxdm5SQlE1d01ZWVZVbXNP?=
 =?utf-8?B?b0dqWnM5VWM2aDdaUmRFNERzU000SjdSa0tsbUpiWHREdWI4VGlNaXEvTUts?=
 =?utf-8?B?T3NEOWlwNkJSazNTZ2JmWkVMMWhoaUFkdWh6cUVJZjQ0cFhIaVpReTl6bDJm?=
 =?utf-8?B?Qi8vUllzQUd4VjhyRVUrdFlHaXFFWWVoemJ5RTV5emRvQlk2K2FkcDdXN1FI?=
 =?utf-8?B?VU1tN2M5aGNRV3doRitMa2xTRDB1ZDh1UHBHR1FFVnFBcXBBQS9lZCsxTTAy?=
 =?utf-8?B?cHdQRmlFajN3TTFlZWRyeGE4bnU0amQ0bjZscEViVEtsRTR6QW1Jc1VTL1BW?=
 =?utf-8?B?WmRSdXlDVDFKTk8zNUZ5VlVaNFk4REg0alRCNktqMFBqdTQ3L2w0RFlUT2RZ?=
 =?utf-8?B?d05EbWdObFExUk50WUpuNlJnanBLODc2ZXB5UmZtN3VPNHE2akVkNU83WS9x?=
 =?utf-8?B?L3Z0VHRnOHp4Z082N1ExS3NCUzFHMTRxMnc4Z0lCcmROY2N5OUNybjE2dGo1?=
 =?utf-8?B?U2NrenJMQndidi9sempLQVNjQnE0OXgyc1o3NHgzZGRKRjZSdXN2eHo2eTlp?=
 =?utf-8?B?bC8xalcvazlyR0Rsbm1GQnFxQzgyRkpLK0t0dzBPSmVlVk5xU1VDSkRncVp0?=
 =?utf-8?B?eEhkaFhNbzF5VThGNENFWW14cXMvcWFVM0RWa0hEaUljRTJXSExTRGdjT0Zi?=
 =?utf-8?B?V3BPQmx3aW1sNnFJVW9qT3NBUDQ1ODdYL21rYVFZWmhGVEZOdHJTY0lpYWZx?=
 =?utf-8?B?czM4TFBkOG1uMG1wdkNJVGszRlZrWEtqUlpXU0hLa21jTDlPcmR6ZDRPMmJ6?=
 =?utf-8?B?ZEF2WlBtRXI2RjJzNWFyckNpVS9yWE5veEU2STQvcE9yVXZDSHNYekVxRTlt?=
 =?utf-8?B?K2lLMndDRW82cTNVUlNvSW1FcmRMT0ZNUDd5V3N3MGRQSjNoTmhSS1k0TWkz?=
 =?utf-8?B?K1E0SmpLNFRhQXhVaFZiK2hrVXhRVFRMdHBLOTc0ejBXMEFGcjJsdGlKVmVk?=
 =?utf-8?B?UDRncm82Y1JOKzRpYTY0SDVicnBnZi9SL1VkS2NocTNtWGVBckRVSDJEQ0xp?=
 =?utf-8?B?QXE0aklEUUJqdlF6QWFVYlRaVmdPcGtMWTZnRlF4Zm1UcThOWFY5WVNKclUr?=
 =?utf-8?B?b0l4elhOZ2N4UHBFV2JDdmp2eldKWXRRNWsyTm0wKzgreFgvbHN0c242eFRz?=
 =?utf-8?B?QTRPQnZ4RjZKMnBvTHpjczBvOEdpbEdOeFZnQXZ5Z3lEK1ZIWDU1bkZvU0xr?=
 =?utf-8?B?QmRrWm1rYUtLTE5jTVJOTXh6UWVMTklXN0NTS2JCcDV1alFqUFoxNllJZzh4?=
 =?utf-8?B?TXlFcm5NOXRLVGFhcXBIUW1CcEdYdGNvYXgrYm1YUkNiam1HQVhaZk1WbGM2?=
 =?utf-8?B?N2R5UUhHS3ltdGxmQ053NXV4ZGVqd2JOWWN3OHZkemQ3UHk3U1kvUGcra3hR?=
 =?utf-8?B?eXoycE9Nc21mM2liOFFMMGlrOFIvN1liMS9vWS9XelJOMjUySFpZekowSnVi?=
 =?utf-8?B?U2Rad2NaQXNPYVpidHZqMURWNCtDZGJRMmhiQ21GK2VTMkNqaWFRTENIYTFo?=
 =?utf-8?B?OXo3V3R5cmV3dnpCZkxXZlI0TGhGMXBSSFplZGFkRDRGbDZ6UUs1OTJwbjRZ?=
 =?utf-8?B?L04vOUo0OWlxaWF0WHFiekx0Vm9KQ1BWOEltRUEyOTNPOGhCNXpUajN2R2RL?=
 =?utf-8?B?c2ZXNldSVXkzdFpGZ3lwWlBMZCtBdy92OEp6eVBXR29aWE94YUt6REd3MXRy?=
 =?utf-8?B?ditnWnpGV1FMS1ZXZUwyMk5sdlZTR0ZWOUZBRnBIVnNYZDlUWUJNa2l3OVRz?=
 =?utf-8?B?UjYyV2lrTmVRNkY0WDZYZkk3ZEJBekpUTEFWYjZQVjNycUNrc2huSGltVUNj?=
 =?utf-8?B?T3J6enVPSm1FMmlHaVJGbmg1aWY5Q0pwd1o5ZTdzbktzNVV4azNidldNWEFl?=
 =?utf-8?B?bWVXelZjQmc5clpKUSswcnJQVWVyRlV0SkJnTURMbWFLc2hKMllNR1Rkc0d3?=
 =?utf-8?B?U2d0ZG1xRE9LT2xKVzRWYWhac0tqeWpvWXBBbGQzaVY4WDNJN3hzWHRDT0Ja?=
 =?utf-8?B?VWUvSVlqbStQM2hiQVI0V3lBTnZia1BWUzJVSjB1L1lYaGs0blo0V2R0MVJ2?=
 =?utf-8?B?NE1LZVZ5NWhxRmxZRW0zQXNScFh0c0hXYTBHVHRZUEFRdlQvTWdrbEhwWWVk?=
 =?utf-8?B?N3g3b0JVMUlsNGY3YzU5bXBJS3QxRktDNGMwa2hBWUJ2SDlpTFgvL2I3WFR5?=
 =?utf-8?B?TWJwcG9WU1pnT0dxUDlmS3BYMFFyOTJoWWkzTWw2WDNLSjdFQnZKZ1ZUZ3h5?=
 =?utf-8?Q?VdpiU3zpRgGRQ24A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd3e53d-c311-4d72-eaa9-08ded7667fad
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 11:47:16.2531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpewHvgBiRSXcsbKUqSdW8PyrTVVr26rEpj4Qh/gFI0Wsv+6y7zFJPLgAdFIdu3GBKaxE64oJDk2j7OjrOg8L4CY3M13TO9a8M5X+oSiNAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7046
X-purgate-ID: tlsNG-c1860d/1782906440-A3F323FC-4720F598/0/0
X-purgate-type: clean
X-purgate-size: 5189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2557E6ECF5B

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> Instead of storing page pointers into an array and lately adding to
> iov vector add the pages directly to iov to avoid "guest_data"
> array.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> ---
>  tools/libs/guest/xg_sr_common.h |  1 -
>  tools/libs/guest/xg_sr_save.c   | 64 ++++++++++++---------------------
>  2 files changed, 23 insertions(+), 42 deletions(-)
>
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index 95b0564e5c..b2c441b644 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -214,7 +214,6 @@ struct xc_sr_context_save_buffers
>      xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
>      xen_pfn_t mfns[MAX_BATCH_SIZE];
>      xen_pfn_t types[MAX_BATCH_SIZE];
> -    void *guest_data[MAX_BATCH_SIZE];
>      void *local_pages[MAX_BATCH_SIZE];
>      struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
>      uint64_t rec_pfns[MAX_BATCH_SIZE];
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 4988d8040b..8a22267fdf 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -88,7 +88,6 @@ static int write_batch(struct xc_sr_context *ctx)
>      xc_interface *xch = ctx->xch;
>      xen_pfn_t *mfns, *types;
>      void *guest_mapping = NULL;
> -    void **guest_data;
>      void **local_pages;
>      int *errors, rc = -1;
>      unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
> @@ -113,9 +112,6 @@ static int write_batch(struct xc_sr_context *ctx)
>      types = ctx->save.buffers->types;
>      /* Errors from attempting to map the gfns. */
>      errors = ctx->save.buffers->errors;
> -    /* Pointers to page data to send.  Mapped gfns or local allocations. */
> -    guest_data = ctx->save.buffers->guest_data;
> -    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
>      /* Pointers to locally allocated pages.  Need freeing. */
>      local_pages = ctx->save.buffers->local_pages;
>      memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
> @@ -158,6 +154,19 @@ static int write_batch(struct xc_sr_context *ctx)
>          mfns[nr_pages++] = mfns[i];
>      }
>  
> +    hdrs.rec.length = sizeof(hdrs.page_data);
> +    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
> +
> +    hdrs.page_data.count = nr_pfns;
> +
> +    iov[0].iov_base = &hdrs;
> +    iov[0].iov_len = sizeof(hdrs);
> +
> +    iov[1].iov_base = rec_pfns;
> +    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
> +
> +    iovcnt = 2;
> +
>      if ( nr_pages > 0 )
>      {
>          guest_mapping = xenforeignmemory_map(
> @@ -199,61 +208,34 @@ static int write_batch(struct xc_sr_context *ctx)
>                  else
>                      goto err;
>              }
> +            else if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
> +                      page )
> +            {
> +                iov[iovcnt].iov_base = page;
> +                iov[iovcnt].iov_len = PAGE_SIZE;
> +                iovcnt++;
> +            }
>              else
> -                guest_data[i] = page;
> +            {
> +                iov[iovcnt - 1].iov_len += PAGE_SIZE;
> +            }
>  
>              rc = -1;
>              ++p;
>          }
>      }
>  
> -    hdrs.rec.length = sizeof(hdrs.page_data);
> -    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
>      hdrs.rec.length += nr_pages * PAGE_SIZE;
>  
> -    hdrs.page_data.count = nr_pfns;
> -
>      for ( i = 0; i < nr_pfns; ++i )
>          rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
>  
> -    iov[0].iov_base = &hdrs;
> -    iov[0].iov_len = sizeof(hdrs);
> -
> -    iov[1].iov_base = rec_pfns;
> -    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
> -
> -    iovcnt = 2;
> -
> -    if ( nr_pages )
> -    {
> -        for ( i = 0; i < nr_pfns; ++i )
> -        {
> -            if ( !guest_data[i] )
> -                continue;
> -
> -            if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
> -                 guest_data[i] )
> -            {
> -                iov[iovcnt].iov_base = guest_data[i];
> -                iov[iovcnt].iov_len = PAGE_SIZE;
> -                iovcnt++;
> -            }
> -            else
> -            {
> -                iov[iovcnt - 1].iov_len += PAGE_SIZE;
> -            }
> -            --nr_pages;
> -        }
> -    }
> -
>      if ( writev_exact(ctx->fd, iov, iovcnt) )
>      {
>          PERROR("Failed to write page data to stream");
>          goto err;
>      }
>  
> -    /* Sanity check we have sent all the pages we expected to. */
> -    assert(nr_pages == 0);
>      rc = ctx->save.nr_batch_pfns = 0;
>  
>   err:

Looking at this patch, I think it wants merging with patch 3 and
bringing ahead of patch 5.

You're undoing/redoing work in both of those patches, where I think it
would be simpler to drop guest_data rather than convert it then drop.

Moving hdrs.rec.* can be done in patch 1 (which will probably simplify
it's diff too).

~Andrew

