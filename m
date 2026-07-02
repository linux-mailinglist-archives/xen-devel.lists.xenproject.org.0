Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6jQH190RmraVQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 16:23:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D987C6F8D6D
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 16:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=peF3VejK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351958.1608945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfIJn-0005pD-Pq; Thu, 02 Jul 2026 14:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351958.1608945; Thu, 02 Jul 2026 14:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfIJn-0005nT-Mq; Thu, 02 Jul 2026 14:23:07 +0000
Received: by outflank-mailman (input) for mailman id 1351958;
 Thu, 02 Jul 2026 14:23:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wfIJl-0005nM-MT
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:23:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfIJk-00Eyp6-H0
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:23:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a46743b-2eae-0a2a0a5409dd-0a2a4508cff2-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:23:04 +0200
Received: from [40.93.194.27]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a467446-edec-0a2a45080019-285dc21bdff9-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:23:04 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS0PR03MB7558.namprd03.prod.outlook.com (2603:10b6:8:203::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 14:22:59 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 14:22:59 +0000
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
 b=QK3VF73qJLtEvryp6s06xag9QBgNy8PGyzUp1w3/6Hnx9rKsRnUHnInCkmdW8UxJvuqoxO2oQLf4RnKtm6AN1VtLHNNsErGPT/I9zlD4ywetx/HI0ouZNo2TTYv78cZnbcEijowypP1cI2mFrIWoEVFz6FBx+AKOroCmsdGlWbIO07cJDNVVlXbtlXx9NgJ0LtQpI2DRHK+OQwR7ClPAbCOqApU52iW0XGB3gE0hOHFWKzkeff156b+fYyvh65LPrc+OKJWEoEWw9l3wAyhQRsNEWolxCUzWwkK6UrtVqTra3j8pC7N9twnCklNHOpDHpsjkChuFycyxcI+7XKLMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8NEVJSLpQfT2iBI8syE2cnaLKWdctWENKasfgbWPwc=;
 b=OoE9iuUnuibJHhBlFs5ev1muMQr1x+o5jPPTzX3zY6s/jKtMXkv/3TC+kEauf4pNhvn8a5/NFFig2TtcDNuWMbF3DRP09Uj5Pfa94GG8AGrdj+zHQwOzd1E8K6nAlvkMtM6OL3E4nWQ8UeYwq9UHuhMZHCsPohcpfIXkg/jLTsQH+YV29C/KR4RjrfEeN3MShdUGMg0Sa/XdHQPGyKYA+hRotkHi1tiXTstM7U2/07ZnqMNFJkL9qJ6Djk9R7a+qBXcNF4q6G/yML5B68Nq7F52hut2gTl5S5k3lfpjNA7T39gqZp9FXBQU80ZiV1kqWH2ZOoltw9wDY9s+RbKTT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8NEVJSLpQfT2iBI8syE2cnaLKWdctWENKasfgbWPwc=;
 b=peF3VejK4AJo+P7RRKNGOYQ9kdGO42g111jstOOdrXIq+/SBPLzOoLPUNcQLQL6T7ZLj5o5Fem+xD8hELRWSD6rLC4hErYNAnkKkuxj5Jh1ZlRVPq88Dh+IfrEejD6fvM8ldnj/FhMBX1c8SmWJhtvBN9ZFWBB5863jrDHlIf00=
Message-ID: <7fb4624a-02dd-472d-b981-cb7e0c1fce54@citrix.com>
Date: Thu, 2 Jul 2026 15:22:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 3/4] x86/traps: use entry_ssp in
 fixup_exception_return()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
 <8af61c08-71f9-4d18-ba9c-952b7894c44d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8af61c08-71f9-4d18-ba9c-952b7894c44d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::13) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS0PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd5c016-8b09-4c70-9ac0-08ded8456b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kepSCAho0K3UIqRwtnYCWTh8PgnB0QLqMFCSUssf7oZ2yr2EJ7dxBssC0MlfMPsoPAGgyVgFJRFjjA7VbSAS9F0PBpkFOk7QjFenFTIbZmsxlXLlVSTq5JW66fYyKc3U+dOLf5cYac8xZuzyXnLGjXEA+6PODjigBDqHRJl8+rVvlzqiD0HbTva/OUrtSrSS4FfzBRRSj/fA/X8tCHwsRJtLfSvANItL9S5CJLk7kZoA4CFuCr+sXRYnFU2XhNG/8HhZWO4RIWd0HRpxboZ2bMTkOeDbsJ58iVZZJ8Btjb7mxSomZbxByd5jwbU5GVVrWRF00z44IMV78qrtFLqfKF6lN08sQ1bFcXVwMr/qjcWgLgiD5Jlt7bYxkOtOR5NgW0cpl9ZNSXcQ0ezgEBCjeL5ZSGAn9pBE/zbqcAU/xai/uoCIMo1h6OoEH95de3/JWMaQOUueNIG1cKaxib1SKtUA/7KvMq1HMEBmFupLzhGl89Z/BJbx8x2SKgiWy4tUwA0bfAFpRxHQv7ccUMRnBUtJL6UgdUXGdXbDxdBxajW2yzpthS7KrLxRMvwoJBmgNuOEKemSOVfO0Wa+DIdJzRYT9EPdZZ1xbpHS8c0bD34TONnFtlNpkMA+fViWfglnB6Tj0yz43lAWqNGTKvIsM08L0FswHQjBSszQomcO9ro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2lQUTd0N2lUM3Z4Vzd5SDFQaDEyWXZ4cCsvZTFyaTBidnJkUFJsaS93QXcv?=
 =?utf-8?B?ZC9hTDN6VExjVmQrbENwOWpseXhBWnhCc0hkTTlWTWRSbnp5UkZqcDNjL2JG?=
 =?utf-8?B?U0JMRlF5RDUzQnk3ZHhwZEo5bEQvRjVtaUNvbmpkQ0d3eTEwd28zSnQ2UFNt?=
 =?utf-8?B?bVZ1QzducktaMWs3dEc5N3FXdkFPTUNkMXB2dEJySFpTL1IyaGJvU2c2QTQ1?=
 =?utf-8?B?cWdQalVyZDdOOHI0elBnRnRoQzNLTFkzb1RNY0FjVitCTWpjWE5Lb0tWTC9D?=
 =?utf-8?B?UU9WZjc5TWhselM2V3d4dVUvK2VPY2RWVldIakhYOG9HM2x1T3YwanBCZGth?=
 =?utf-8?B?aW44RVdZZVdwUXpyQW9DM0dhVGt0NkZuUjBKYjFnZW0rSzZrVkxRUkhYaUts?=
 =?utf-8?B?eDd2YXhPR0pFNE9hdjIyQ2pqVy93TFNTMVZSVHdGVGdzVFpWM2kxeTBMT3Jm?=
 =?utf-8?B?VVFqcHRhUHFYT2lZL2RFdDlpbVV6QTIvWjZ4VTBBVFZieTA5YmRUM3hDWXYv?=
 =?utf-8?B?c29IbzA0WTc3c21MRUlwcHpjR0xiUU4vWlF1QmJWNFNjSkdOakRnTEdPcU5S?=
 =?utf-8?B?NW0vMlNnWElPT3VEMXdaQkVlNFRrcC9zMVcwcWNjSWNwKzE4UVpYNWEya3E0?=
 =?utf-8?B?RG1wMGZ1azM5d2RkZFNtSU4zdmdZOUZuWC9aWVNtckZrdFN4VG4vcDNsMklJ?=
 =?utf-8?B?ZjROeksyZDhXVi8wUmorOUJndVRyclhrWkg1bEFwYnovdGlES3NHWTBWd3Zx?=
 =?utf-8?B?Wkd0dGFCLzVTWGdpWCtaTERZcDVPeHZVaXBodi9NbTRGVVM0SDAxTUMxNDZL?=
 =?utf-8?B?dXJoTENORXg4UGVuazdDQjdIeEQyMmpEcWE4TVNxMGhXcVppcEF6VUQ5YTRi?=
 =?utf-8?B?OWt0OXhxWnhQanVMeE0ydEdmZVV3aVRWYk5FREFMelFxTCtraERBNDhrWnFz?=
 =?utf-8?B?ckxsc3FlaVJEczRrNFFxQkZzeDUvV1dSNDJ5ZStTRFVnQVh3VEwvWE5IbzYv?=
 =?utf-8?B?K1R4czVya0UxL0ZhZjlrdGsyZHpSZEZMbVJEWVQ4bUhiSHUySjFjbGwwamRl?=
 =?utf-8?B?QWVZdi9uYTI2ZUswUjJWaEVFSDZTMUZKZE1jTWdwa0FwWEZJV2ZmQmROSVR0?=
 =?utf-8?B?ZFkwNG9jUDhHNE1OaXVEYnlXVlNCVFdSNlJLeFRLckJEamdXQ2l0YjhYdHA0?=
 =?utf-8?B?cjlpR0htSlZ0dXF0T1RuVHhObWpvdVhLYXlBNHRmejNiYVU4WWJsVUh6UjZp?=
 =?utf-8?B?RUdFZjlXbEtQSllpOXFvQm5GNXc3aGNKS25iYTQwRUtFOVJZb0YvSDdDbmZQ?=
 =?utf-8?B?S2VSb0V4Slk1dnY2STZ2L01TaFRTRHFCUkdOVTBFSE1LRGk0aDlvWno3TmJL?=
 =?utf-8?B?NzFsRjJDSzU0Z2pWZmY0TkVpaWtPS2FPQ0FBRGJEUWRCbjRXeHloWkRzQzlr?=
 =?utf-8?B?Z09HUW55WWFWbE1NVWdwUGhITEV5eTFkZjF5a0hqQmlBSS9FeXRKYnFCeU1E?=
 =?utf-8?B?ZFBTTGJqRmxFWEZLTVR2QVRoTnZLRE9hbWU2bHloZ21ZQ2tucjRyNVB4QW5N?=
 =?utf-8?B?N3JWSFlBTkVmaksvNXFCb2c2c3BiVGJGdjgzRzR1UmpLdVpBay9tZUNSRzVl?=
 =?utf-8?B?RGo4dTh4MlR2N293MndzVWp1ajRsZHEyY0tEckg1UzhmUis0MTMzV1YwWEsz?=
 =?utf-8?B?L01QenY1TlNQYkpmVnRxUW9CRGhJTTVCcTZmdUI0Vk5OYnlrZkZQWC9xTGp5?=
 =?utf-8?B?S3QxdU91c2RLaTVjT0pFdCs1elhRTnk3Y3IzV2dYVU9tdmdFRGE1emdMOG9q?=
 =?utf-8?B?b0hHWVVLMWdrMnRWSzdxTjdnZkZ0Mmt0c3d3RnByK21KSHhTUzRaSG5vbkM4?=
 =?utf-8?B?VW1uTm0yM05IRDQ0NC9lVFhEbzNIRlRUaTh6aGZ6dDFYcE1jd1N0UityVXJO?=
 =?utf-8?B?MFU5Z252SFpVZDQyc2d4ZEZ2MTNMNWxzSGJzNzZFdXJHTDRFUzhqY0xOMlYv?=
 =?utf-8?B?VG9lWm5ZT3BlTzNqeDd1Vm1odVFCNmthVWlhUS9JckdHZDRvVTlJR0lhTFI5?=
 =?utf-8?B?WE1yQkFFQklZUUJKTEJYTjFENlhka1N5QkdWRUY5cWtZK3IrVkF0b0taelEv?=
 =?utf-8?B?ZUN1Vi84R3d1QU41eWdJVkxQSWE1ZnhEVGd5M3NrRk9hSVU1TXYyNldvMzVZ?=
 =?utf-8?B?YWxVSWRGeDlvS25CZUVGMm9CUVZyREFlL2lyNTYvQ05Qdk91Y2JxVS9tMFl3?=
 =?utf-8?B?Qm8zcitjUXZpTWlRaVZwNHJUazRLYW1ESDZPWVFRdHlWbzhSbzZVM1BMekZK?=
 =?utf-8?B?TE85dm9RdmcxeGt5UnJBMHpCdU9iS1BLTjV4UENYQWUzQWNyYkF2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd5c016-8b09-4c70-9ac0-08ded8456b20
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:22:59.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDntkHta52xt01JH29Q1rtCNf/rFx6qQ0vS82+WP7IxiIE86uhLeT8Wf4EbKIcz/0bkZ5/d56drkbNI0L8W+Z50kK3gqgflbF745mCVtUhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7558
X-purgate-ID: tlsNG-c1860d/1783002184-A2F3A3FC-22AC30E2/0/0
X-purgate-type: clean
X-purgate-size: 870
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: D987C6F8D6D

On 02/07/2026 11:55 am, Jan Beulich wrote:
> With the value recorded on entry there's no need anymore to go hunt for
> the respective exception frame on the shadow stack. By deriving "ptr"
> from that field (without any offset), it then ends up pointing one slot
> lower than before. Therefore all array indexes need incrementing, nicely
> doing away with all the negative ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The diff isn't easy going, but the end result nicer.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Indentation of the prior inner (but not innermost) if()'s body is
> deliberately left untouched, to aid review. It'll be adjusted in a
> separate follow-on patch.

There are two indentations needing removing.  Deferring to another patch
is fine, but it would be nice to be in this series.

~Andrew

