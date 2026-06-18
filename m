Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IuaMNH0jNGooPgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 18:57:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA06A1B52
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 18:57:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=VjGgAiTs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341483.1601903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waG3J-00068i-PI; Thu, 18 Jun 2026 16:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341483.1601903; Thu, 18 Jun 2026 16:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waG3J-000674-M8; Thu, 18 Jun 2026 16:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1341483;
 Thu, 18 Jun 2026 16:57:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waG3H-00066s-TH
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:57:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waG3H-00DoV8-9x
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 18:57:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a342353-2eae-0a2a0a5409dd-0a2a45048e7e-30
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 18:57:15 +0200
Received: from [52.101.201.3]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a342369-5f9f-0a2a45040019-3465c90335e8-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 18:57:14 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6602.namprd03.prod.outlook.com (2603:10b6:303:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 16:57:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 16:57:06 +0000
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
 b=smyfj/dEhF3/9cHXH2Txzbl0mi7irR1Pn04UHpgtNFJ43KE+11qGZsm8nhbAPyyiM8CE8m2dNfiiC9yVEyGeNzuDKE6e2toCoQj3rc+BzuAN9xTjcEg7yEohaAjhyBLsbUn8sks8CqcxjMYuzvgWhsnF5ZBSBwszA0kl+5h7uQzscixRR9A1/YXR45MTnXrrK7k+FlX9UoennFJMJYTIeXRQyR6gQmjc1e8F68zsqCRk1i8eAPv8XYoNoZA0f+EBmNOpl+G/5aS6obAh+4Uc5OVIzgVD14sYf2UegtP7APc/CyYa1XRhQn5tUphq6PMFRhTQguXlgDJ0tONolVsQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz/m0Hf5cSWnce+v/sTi1x64MZiT5HaqCgJaYZfa0yY=;
 b=x+YAQp3BErvrQDm+8r+ipz706amyM6EoiFM67s/iG+LmI/4Kq8bO6Ia/ZyR2DhWpODUFbBeLA0AQ6i70IHVx7prwqZJ17Q2HF+Q23iryJwIue+cqJAnD7P5GmkqoVcVZhkT9YXEhflxjHOi8sHx7vwxm+wNsmTcna6RWRY/8XNiyVfKjXgZH9sddqR6wAGSLG9qtDciDxbLKCf2JfamRTQezx1+t3iNA7QtX7cVxrcJqaaevk1UZtSoZI59tvV3+g+fFXW7nYMR6NaRZS8KYQm9kFar8nWHfruXGkhoIDx/vd8jTBcedLK+x9fjfh+bCXpMMaM06t9yafZ5+N25Xzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz/m0Hf5cSWnce+v/sTi1x64MZiT5HaqCgJaYZfa0yY=;
 b=VjGgAiTsziRUIdAbv1IDZrv/ED5zHZnDRqHTuCcG9qEv/7wOTs35UJ3yjd7lAg+tr0SxczTtGca8WcCY84Cr5/bqQ/VGslYX04/PAO3XIJMTh2+sfjikba+QNXRpZNhyLr+SrUUoQFSrQ28CRCIGImY4RfU6se+TEZIss+7swrU=
Message-ID: <c6d4df78-2be1-490f-8cad-ed508710d587@citrix.com>
Date: Thu, 18 Jun 2026 17:57:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
 <401ae47c-b55e-4ca8-b764-9e6fd17444ec@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <401ae47c-b55e-4ca8-b764-9e6fd17444ec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eaa269c-4366-49f2-4c37-08decd5aa0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MdaZbsVoYmMPgdKoUwN24Rsfz3CEDxjYCU4okKFhKC1NZkn1vF1JcFX8ddCrFRad4IEV7TWHh1i7M+WYinpwzJ1POZZzUyTTcRSCHDoHb9mHD6AWs+IGOl0RA6oIoWo4FgCoEf1ya3VYnNCJXKHa/roGbGxUP1E+LbprxgtIlJVEucLoT4g8tpxTreqa6X/Az9GqmgRETZ4bKQaYTk3A5MGKFPhQ4+L04kn/ibIOyHGQqawzDRjmRV5fXZc4mcSPD+LbJtnQsxrEfB5mQ3CiC4BIljuw1qQPNWqK7FTeXzGWpYZl1x25OX33RNKCYvzN63J/K/PX8xsXSxA104SYa4Mv4mLORhlGpr2a3u83KoiK4a0/46AWE9hSRXUWBqbbaNCI5XKChf9K4eUO9zR+piCKy6ZcpWBDAMuEtTxpMvQgbu/9zm+BehgtI5HLiAiP5puIAi6jBFUudrEsR40iSPP11A4XDAOipS/6J+X+sUS2BoW1/1ujHmibRcjDvm5i/EmFKhebrkCgEVzGN7x+6ZJQjZd90u2MFuZqNxUqEyo6D/rT3YO3cYAprzKlPMLXr5f1Z8/ZP6SLFQa0jpP4OeDdzR32+CgwAluTL3pYCUQnlXVz8A0s2b1U8EDk9aX0jAwv3nS9Z/W7tsjOcVGUfk0i4LAG1kWDo3dHzrV6NpkULU7roc+u9PRd9ACKzKOu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTQ1WjFRdFBaMlpIbGxXaTdzZnB6ZERLTy9SUHpOWElRNml0c1RTV1Z4MnlK?=
 =?utf-8?B?MDdqbUU5LzkxRkNPNTE5S0xWeWJlYU5iTHFFN0lIUXZ3YXZDSzNKNW1ROGRX?=
 =?utf-8?B?Zkh3MG1CeTZDVytHY2RXRVIyeCtHY2tNMzYyNC9JOTdwRWF5UDYxc0JzMks4?=
 =?utf-8?B?Mk9jTlluOUJhOTB1aW5MMVpiWlBLTE9qbFRoRFBuWHhBZjFSOHU0U2MrZVB3?=
 =?utf-8?B?Nk9WOEJ1djE0TTNWN2dwVkYwRG5ta0dnT016V1RISnNocWtEK3Qwck5td0x4?=
 =?utf-8?B?bEQ3c1cza0lVUnUyYnlKZEY3NmptVEJISzFTRWU2OElHWDFjeVAvOG4zdnFQ?=
 =?utf-8?B?R0t0N01xdnhxRmFaUTdUdEhoMUZBeFluUnU3TEZKeXhndVN6MWFGM1lSR3c3?=
 =?utf-8?B?eXZIdWd6a2R5ckdSVityOVI3OEZhT3U3WllMem1tZjQ0SHg5b0JkQXpRVmF3?=
 =?utf-8?B?VURaaFlTWTBJS1U2bi9YQkduemt3UXVOME1VQjJaaVorTFdhVVJVbjB2bEtw?=
 =?utf-8?B?Z2VQc2Ird2owZUpyVXRlVmZEVWJRNWgzcHNFcklyQVlzbVpYWTJwYlduQ3dG?=
 =?utf-8?B?SVI5RGpjRG9vVVNWdTRHNnRFZ1dMc29zZ2NJVWlhNW1wSlU2MFNVWmF2MjZ3?=
 =?utf-8?B?MUYva2VCZEF5OXc4NHo0ZUUvNWZ2a2dSLytLMy80dFpNNThocHpZUmhFUlZQ?=
 =?utf-8?B?WUZTTERoRTJRRXZCeUp1OUNNWktVMWtmc1lJYWVSQ3k3czRpK1VDd09tM29H?=
 =?utf-8?B?ZWN4QUZTbW81Um11S0FTcURQVmppNlhMWlRqVXl1a1lmSFluaFlqTm5OTEtE?=
 =?utf-8?B?OVp1SXJ1TDdOdVZkWU5sU1BxelZyaXFqR0dXVmNVbDVacFFvbnJrcVdwSmFO?=
 =?utf-8?B?ejJUZzhZa2JIeWJMSU13aDFzYnQ2WUpxT2tpYWJzZ2lWYVFrblpVa3hQTjlB?=
 =?utf-8?B?MkY1WGhubGl4dFBXRHVwZSsxY29GeGhrTUhHZjRycUNvYTA3TlBpUkxJTU13?=
 =?utf-8?B?V2xqUlB4cFF5ZnVGODR6UFgzTnFaMGwzZXRkZkJEWkNITGVmUWZ4ell6N0dM?=
 =?utf-8?B?WUt1OThRZnovd2xpNlpIaUxUK2FLWmJaOExmMHRBcnJhTExYV015NWZkRFd6?=
 =?utf-8?B?ZnIrd2tnakVvcmdYZTJyNE5DRUtHTGtGWC9XNE1kRnJGNDJGSS9NQ29WWlpK?=
 =?utf-8?B?T0UyMVdWN3ZPQ2YvQ0wrT2R2OTlveHppWWI1Zi9iM1dFckh2VkxVSlVQWmJa?=
 =?utf-8?B?K3lkeXRJNzFwaVNNbFRNcS9mZzM5eWRnOGI4NWVXaEt1MnBhTm9PcXRsbVUy?=
 =?utf-8?B?aUxwb3o2VU41azJnTWFKcFVPLzY4QVNkMVRIUUZhRU5YRE1FcE85L2cyb2x6?=
 =?utf-8?B?eVhoc3pYUEVIbzhReHNGemNCVkxkSFloZ09sV2hJZGhlTWU3Q2h6NWJjbHNj?=
 =?utf-8?B?dWRpN2lReWpmUGs5VU52UFh1bzRWbEErcXJ5cEJSVjFmV1JNVVhjZXRFZWxs?=
 =?utf-8?B?Yll1REE4d3JjREdFQWJtT0dwRlVkdGl4R3hPMjBMRkJMNnBTdHhadTN6OHgw?=
 =?utf-8?B?T2dFYlhYQTVYMjVWL2VQekhzSnhXVmF6SDNLM0N0WU1pQURpTTMxVXJJY3ZW?=
 =?utf-8?B?bVVFTE1FUm0xd0IrZFZsNWN1MWhtVXVXV3FPRGxkbDkyV1gvK09iODZucnc3?=
 =?utf-8?B?TWU3ZkRONlg2MVpLVE8wZFY1ak5mUjFhMnlvT1pmUjI4c1ZuSEJHbjlYd3Zy?=
 =?utf-8?B?dWwxRmJKQXVYQXRtam9OYTN3SGc2MVM4WmtLc0Z5bkpsZnhBYjgvRjhGazc0?=
 =?utf-8?B?M2RxbEtSblZFVEdsSURWaU4yaXMxSFhpYStnVmlyWFMxN0VqYjM2STZhR0Fu?=
 =?utf-8?B?MWVPYmlBZ2Q0cWJEWFB1UTQyUGRERmVKZEJDdHhMU1JNa1M2bjVUVGdGOEhM?=
 =?utf-8?B?NU42b1RNYkJUWVg5OHhiZUFvV0h1U3ZjbEE5di9nSk1RN2NLNjVIbkhJYUY0?=
 =?utf-8?B?Z1lRWFFja2w5dmMvbU1VbHZEbFZuMEVMRzNYdWhXbHZpU2wvNnJ0VUxISnJC?=
 =?utf-8?B?MnRpa0VBRUtzTytudUR0ZTNUbmJDa2NZWmZrRXQ1YndQa3UxdE5OLzFUMU9m?=
 =?utf-8?B?c3VacTFLTnpYdnJRTGhGL1BLY1g0RVJUYlovMkExT0tBVGZMRHNwMTVldndS?=
 =?utf-8?B?Mk5YOTVhTHMxWWJubGdYdUVwSGdxc0R4YmtIM09NOTQwaWpsYlVGMzF5elM4?=
 =?utf-8?B?T3BReUJ0V0ZJTU05ZWZoamRVYXdocldPRGNkZXlvVnRqdS95TGE3SUwyejU0?=
 =?utf-8?B?cHFYVmpYMjhZUW5MU2lyQ1dRYm9nd1Q1V1Z5RFh0R3F4L0VFRVFxb09YbHR6?=
 =?utf-8?Q?1yhaU2s4l3LbMRtE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eaa269c-4366-49f2-4c37-08decd5aa0e5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 16:57:06.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8hjZ4OEnwa4Cc01FvdRMOZA3MQ8cJ/DFQmfyd/HPXSKwU1U8OK9qUqRobKu4+QlMju7W4o2l8+8LFzmBmBpCNeqZkXieK4IJIDXIuI1eYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6602
X-purgate-ID: tlsNG-ebf023/1781801835-44BC7141-A9A94CFB/0/0
X-purgate-type: clean
X-purgate-size: 2811
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 23DA06A1B52

On 18/06/2026 5:50 pm, Andrew Cooper wrote:
> On 18/06/2026 3:50 pm, Teddy Astie wrote:
>> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
>> index 084be3880c..1d06cb035b 100644
>> --- a/xen/drivers/pci/pci.c
>> +++ b/xen/drivers/pci/pci.c
>> @@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
>>  
>>      return s;
>>  }
>> +
>> +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
>> +{
>> +    unsigned int seg, bus, dev, func;
>> +    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
>> +
>> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
>> +    return out;
>> +}
>> +
>> +const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
>> +{
>> +    unsigned int seg, bus, dev, func;
>> +    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
>> +
>> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
>> +    return out;
>> +}
> You correct it later in patch 13, but these want to be __init from this
> patch.
>
> Also, if you introduce these functions ahead of parse_pci{,_seg}()
> respectively, then the diff in patch 13 becomes far more simple.
>
> With that, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

P.S. this is what patch 13 looks like with the suggested change:

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index 19f24e8fda8c..80b65bfe77d7 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -152,17 +152,6 @@ void pci_intx(const struct pci_dev *pdev, bool enable)
 }
 
 const char *__init parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
-{
-    unsigned int seg, bus, dev, func;
-    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
-
-    *sbdf = PCI_SBDF(seg, bus, dev, func);
-    return out;
-}
-
-const char *__init parse_pci(const char *s, unsigned int *seg_p,
-                             unsigned int *bus_p, unsigned int *dev_p,
-                             unsigned int *func_p)
 {
     bool def_seg;
 
@@ -170,17 +159,6 @@ const char *__init parse_pci(const char *s, unsigned int *seg_p,
 }
 
 const char *__init parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
-{
-    unsigned int seg, bus, dev, func;
-    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
-
-    *sbdf = PCI_SBDF(seg, bus, dev, func);
-    return out;
-}
-
-const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
-                                 unsigned int *bus_p, unsigned int *dev_p,
-                                 unsigned int *func_p, bool *def_seg)
 {
     unsigned long seg = simple_strtoul(s, &s, 16), bus, dev, func;
 

~Andrew

