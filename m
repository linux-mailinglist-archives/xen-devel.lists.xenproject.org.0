Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K+m0Hj+fO2rtaQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:11:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14606BCD62
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:11:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="galOa/0T";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344690.1603733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJdP-000614-E1; Wed, 24 Jun 2026 09:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344690.1603733; Wed, 24 Jun 2026 09:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJdP-0005yl-Aq; Wed, 24 Jun 2026 09:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1344690;
 Wed, 24 Jun 2026 09:11:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcJdO-0005yf-9P
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:11:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcJdN-004Fcm-FQ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:11:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3b9f1f-e002-0a2a0a5209dd-0a2a4506c19c-16
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:11:01 +0200
Received: from [52.101.56.55]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3b9f23-b690-0a2a45060019-3465383738fc-4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:11:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7747.namprd03.prod.outlook.com (2603:10b6:610:23a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 09:10:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:10:57 +0000
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
 b=xZkpRPB+yGcwEmt8NFFV2GuqBYL8AJn7pbnyqU39X7GL3IaboRJkc1YDXSqv1ECoADSRlqyssGckTcRFuLoZWYUJZMuE51/TV7LreGPQD1aSPzevBaukKFDWnIyfy82vg71qHBYcWBH3iH2plXliFnx3FRyKyVtAt1UArnAOWNlMgKZifz/g1R+VnmroAWY2Q5zDRisLhNEM9H4oQx7VGP/Qbu1eRs+Dgq6khvRAJU6JeqNPiG1kD9c5BfnKrCERAhtXHSLGu2TGP52xjJLY0C20ETXtVq3b1pH6b4CCgMbylt12iqZnndgZ0Ox8/0FA+Wpj9182VbNOidzVZIKxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTE6DFJVmAk3Jxn2eFhEFtRkPEc/FwHdvb9x2xAylWQ=;
 b=cDf1WxrNadoyHU24hcZ4YT8khTkq+hA9IdrpXL3VCAUCRQjSIZUV0637QK0sL33cpxjvwp6irXYunO/+uJo13fYnW1doCQ22/ufV0L0hXKj00uFBgjLSf6BzhmecnF5BGxXlaci8lNYDfmGI6UNvp/ksskUAX6oPpe8sMEcafdnZ+Yk0sxgxk0h0XIyVg+gGxLMW28wuZeMj/RhNw9oyfXfx7q9lh3ya/0BJ1EO0A1K7DtqbaePeKetOvoNl/0KpuRM0QWf6nOUmLNfSQUNOJ93X5M9GodVT9W+3UECm6ex76kJoTHWp6Mbf0VA5ZicJ0Iey+ADLCK3KYJpacDDCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTE6DFJVmAk3Jxn2eFhEFtRkPEc/FwHdvb9x2xAylWQ=;
 b=galOa/0Tel8iDZ9zZ7Djvd2XmI++Vn7geoFv5UhaoBcEv49xvjoT/0hfRwKqdsIW5oWM94XYKq8FDvHeqb4BrNdDHwe8VtDg1Tn+nppwD7ceFxCaE/uXxDKByIG/4+HpK8rA45KL7e5do/BGXHuD/uu6OoVOwAKJ3e+l9xHQW0U=
Message-ID: <1e3b36a6-1970-4376-97fa-621899ae2ad4@citrix.com>
Date: Wed, 24 Jun 2026 10:10:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: sort obj-<...> list of main Makefile
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0012.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: c14178d1-ca5c-433d-7c2c-08ded1d08093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	nB3O7MXzN+bC5P/Q8To3q+Q6KqFnaM0sCRWDXHVHdrmrX0iNyqTbwE97Noubzyc5gF//qS+OC20ZAKazvMSV/HIvA775mtO0dXkf+tYypsPSaheNPBTUa+wkfQKYnvK0FhsgDTO2Z6ykJGZhSTjcQ64He/bz8rxMHzDFGvkXNPico916EUsPHwGR8noq7g6yj+KQ1z7PzYtzXRZ6L8IFj9n/RmjzBPiHhIZzYXRq9DOUU0G3ZSHxUkylwXdhJ8IDuLBWmIsY/ChPXanr5JQFXKodvdz+ac87TPwUt5R8oICAc5FrRo8kvpGh/eh2axxCoEU/U4+Yh7ACTsjjy8FnEBPICZnBvaaS361kU1aWWZKy5uBfrBCkIX85Rp+q+tbfy/a8gnpYbDo2XsoGC9fLALAH8dGXvoB02way5uA6gcpus0vP2BB4ElYL5i+4at5YMa1UPU1dXv9c1b7Q84X/WXz3wOlN9suHj39LeYROfZ63Y4qBe1GlhiPlYgFk07Js0BV5Xp19vbApwgd2Qc38oSkdtIk+PoJJhPMADrOclfovvDkPvNgcHKf6UydDNrg3uC5dRUXp1ygCCzuzWHK6clXzk22bOANk/YgBqT4YKymoJ8Bl75QxgzzQEJLxpWzbo8eSUt3I0PQJG0tRj1EOgbXAMqK4pC/sH1qB8gO43ZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmxQTFg2ZXF2Zk5QMmZzWkpLRkdSamV4ZitPeE94YVYyaEcvYlFVYWpONjBI?=
 =?utf-8?B?SDJaSlJ2dW5lZGRvdWtOc01vNnhCWS82TGt2Z2J6OUo3djVDU2g5TmRJdzVa?=
 =?utf-8?B?TGNXak5SR3liSTlRa25oeUNTSUcvT2JoL3EzZ1dJYXZURWFrTGlkTlYxZy9V?=
 =?utf-8?B?WHBYb1NFMkNpajQ1SFg0dkhKc3J4TnllSElhRzVBa2NnOU81eVVvWTFsUy9V?=
 =?utf-8?B?Wk04MjN5bG1LY0YxVHFXUWhaSjE2U0U4c1hsOWhzR2prN09UR1BnZmJ4djgy?=
 =?utf-8?B?LzE1Q3hGYTdiZEs4NkRGNlJTUlNwcTJ4MHVGNWZTZ3Bib0ZpakZVVnFXY3hK?=
 =?utf-8?B?QlVRZHhwaFY1VktTZTZUcjh1UjhIWHZpbUowdFVsazdMU3IyZkY5ZnNKSnZQ?=
 =?utf-8?B?QUJBN1FZRmdPRWYyNlNWbWVGNUxIS0hTWTh2c2tvQVVPVFBwWDhxMFFlL0l0?=
 =?utf-8?B?cnBXV3dYWUt5TEtMQTRvd3FmTGhVajJnNVNBaVZZaytKQUx0eFQ3S2svbjdC?=
 =?utf-8?B?NVFZVWwxTWwybEdBQ3Z4MkdtYjYxWkYyaVpsbGliZk5Hb3N5NDFGRGlJWk5p?=
 =?utf-8?B?NmpKczRvOVU0NzR4Sjd6TFJaVit0RTNiK081c0J5YkxYUm9NbXJEc0RBYkVr?=
 =?utf-8?B?L1UrRjVHS1VXenpJYml6ZGxVVnVlTUlLV3M4cW1aOU41OGFBWTVGZ0txWVJx?=
 =?utf-8?B?Qk9Fb0VPREhhMDBVc0cwWmlXZ0JvbWlFNkJ4SEdHTnE4TEM5Z2RSdHFIdEpQ?=
 =?utf-8?B?OHBnd2tWcWZ1Q0ZaajdUZStJNWlwY1hHSG56dFI1RnZYZU1seGh6N0Q4dWF2?=
 =?utf-8?B?WDBCZUhHUlEwRldUWndOQ2h5LzMzMHVJVHdpcFVaUzByRzJSelNQaXF0MUdi?=
 =?utf-8?B?N2ZRV0Z2ZjRJN1UvS0MxRE9OcHNHOE82RklDeXcvdHp2Z2d0dXBZcG02TFRo?=
 =?utf-8?B?ak81U3g1NlpjTnBLempjNEpxc3FFRWNPRjdLbGxoSUgxTldKNE1KZWt6aEdD?=
 =?utf-8?B?VzUwK0NORFdmc2VDZE1XS3JaS0c3S2NrMXFXbTJ4SVY4dklMcGpDS1A4andP?=
 =?utf-8?B?T0g3am9IVEVPeGpPNmV3VVJzTGxRcUE2aU1aL1ErclJJcWdUazVJSThJSTU1?=
 =?utf-8?B?WnFtTjFVblgrbTVXY29DNTRHZTRjTHFBQnE1cWpLQVc3SXJXVkdlVFJ4cUFi?=
 =?utf-8?B?R1NpV1c2Sm9FYlRXSUUrUDJMZmZIcyt0OWJyWS9VQUw3YVF3S3pFeUZEVklV?=
 =?utf-8?B?c0ViTXJTSkZZU1NKTUZGcUNtcitxb210a0pibHl2R0dOL1NMcW5BLzFJWGNY?=
 =?utf-8?B?RE1keXhQTW1GbCtaTjZKSWo3NVFnRjRsWEJYWUpmMXY2eXBobXpocS9KcEZ6?=
 =?utf-8?B?L3hCRFNrTmdMdGZnV25TSmxnSmFGM0ppOVRVcHAwQzJaMkxhamFHOTBYcm1Y?=
 =?utf-8?B?MDd4ODB2VUlrbkFIaXlBUTdCNGphaE9QdkErZG1VRDZpZE1YbkZRQjJwcGg5?=
 =?utf-8?B?Wml0SFY2dGZ2ZHhLektZNHREQ3ZvYkgwWk9ZTllLVkY1cXB5TWZrZkVqZ1VL?=
 =?utf-8?B?a0lhclBOS1c5UnZSaHRidW1oTjdSMUZsQ2NLbldnMkl1cng4M2Z1WkRDejcr?=
 =?utf-8?B?L1VJYTVCNzRHK3U2cGxXcjZRbmNvS0xYSGRadko4eVJEeUlOdnBBSmRzTlR4?=
 =?utf-8?B?YnNhYmtDVENKbUExVXltMGsxRVMyUTFiSTVBTnJLOEJEaWNnVW1PQTM2eHRO?=
 =?utf-8?B?S0laakVjUEI3bWljZHNzanQ2SUNiWnd4RHFJeHgzWWFYOXdRTTNRVGh3R2tZ?=
 =?utf-8?B?VzNLeW5taXlmdUEvcFd3UndlSzFQOTdld2JHbzZYVzBDT251ejg4cGNnM01D?=
 =?utf-8?B?U0svK0grTEh0eEFBaTB1dnBoM2J4UEZJaDR6bkFJYTlxTTlvY2RNaGZGOHds?=
 =?utf-8?B?eVIxcXo4MlNmTlBDVzZSVnJKek91Z2o0SDY4bk53Nk1RM1g2M0d4OWlGNG9w?=
 =?utf-8?B?bWxzVUMrVkVBa0FQc1JvMi9tb3hQVW91bVIrbFpkR2VybGJKczRDN1d3WHky?=
 =?utf-8?B?MmtiRHVQUFdJc1BMbUVYeTA3b1ppZ1czT1Z1MitWNFBkRkZNOWJiUE8zSzlq?=
 =?utf-8?B?aGNQQ1l6aXdsaWRhN2I4QmJqMjZ4V2Zja0JCUGEvR0pHaGJTWkJSbU9vOUlt?=
 =?utf-8?B?U2ZMTndwam43Q3hOZ0NaWUVYbDFTaHpUNmdQeUlLOVFkdWZGb2dtempwMzBj?=
 =?utf-8?B?em42dDFudURaV1NsUkRBbkRRa3BpM2FSNENXVzN1S1JmbXl5Rm5KYmhjbnRj?=
 =?utf-8?B?RTRaZS9KdmRlN0ExTmpld29jaW1FMW9EdXpiZDhyY2F4MnJpZ3ZJb2FTYWsv?=
 =?utf-8?Q?cCcL41RwoYXJCYqU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14178d1-ca5c-433d-7c2c-08ded1d08093
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:10:57.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1g7AuF5OvG6O2DZ3XaGsXcEMDxh3KrblhUx0Or8dEO3grFXz34dn8oxgT5rWKZ1Q5LGDZQeMv0w7RBOUXsBYVs+oOEPmZ7QOFlk3ZxUfJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7747
X-purgate-ID: tlsNG-16d1c6/1782292261-399F0853-A85FD2DC/0/0
X-purgate-type: clean
X-purgate-size: 1349
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
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
X-Rspamd-Queue-Id: C14606BCD62

On 24/06/2026 8:50 am, Jan Beulich wrote:
> It is mostly sorted, but there are anomalies. Eliminating them gives
> people fewer excuses to (blindly) add to the end of the list.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Do you want me to pull this into for-next?  I'll (hopefully) be queuing
the series which caused you to notice it into for-next in due course.

> ---
> Of course sorting with underscores or dashes in filenames is always going
> to be ambiguous: Some may prefer C locale sorting, some may prefer sorting
> as if non-alphanumeric characters simply weren't there, and some may
> prefer yet different criteria. But those corner cases probably aren't even
> worth formally settling on a particular model.

That's not a relevant consideration in this patch is it?  I see no
ambiguity.

Also, if in doubt, surely always C locale?  Pretending that _- aren't
present is definitely a bad sorting algorithm.

> x86_emulate.o coming rather late in the list may want considering to make
> an exception for: It takes comparably long to build, and hence it may be
> best if it got scheduled as early as possible in a parallel make.

Move it to the front with a comment saying "Really a subdir, but not
expressed in that way" or something?

~Andrew

