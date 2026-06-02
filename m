Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j4KNOJvDHmpeUwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:50:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6D62DB6E
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:50:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=x6RRRpkk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1324803.1590314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNda-0008E4-MM; Tue, 02 Jun 2026 11:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324803.1590314; Tue, 02 Jun 2026 11:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNda-0008CZ-Hy; Tue, 02 Jun 2026 11:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1324803;
 Tue, 02 Jun 2026 11:50:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUNdY-0008CD-W5
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:50:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNdX-00B0vb-VC
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:50:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ec374-bab6-0a2a0a5309dd-0a2a450ca1be-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:50:23 +0200
Received: from [52.101.46.10]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ec37d-62f1-0a2a450c0019-34652e0a4f19-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:50:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 11:50:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 11:50:18 +0000
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
 b=I1qrROp2SNV8xoivTYVZSbTFEc2aS9WrqAkCTxBEWUk92SWyGQ87QLat/yiub9HGKlyl/QM1zGM/QnBqpvzgCoIkpVbAep8qcm+qlPZMGkGFwof2BM3twFmk6DkD75mMLeta9LIyWTJftDjxYWqY7YNot4inRmpSkPFwqf+BNF6b2141EsveMJdIKhwDcW+NurZMJbbLBMv6ju0lS7kawP8hXHh3dodlQaAMmUikG/Vc0IIMaLeKpYRNPFpamkmEMwJDGhus34FLRMMrmyOrnJ3kxtCbexU9SYD2qWqZABOZVXeVimQpTcTf5rZvXf+hAJetiFoZw8YY7mZyzikFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRqbdq0Zn+S8pdsrq9xKGsTfGSl4CDKQGEuadVHjx5I=;
 b=K9OuvK8kRavdr3vK+7MMp4S1OCNHH+cMv9TlnKeSsM6hpPzko9hXE5pIz6x6pvoZq9kZOdCCT+txLfAAJIhcC1k3fxXqj6jEUjJIOtIknejaZHJX+DHUoyjQjYmXUm+AdeNO3R+195a48+0IjEQNNefcdvOC1lDOYB78niajsklTw8XnmHKe/82432EPy3+QRmKFYpPvj6W7a8rY/p6k1zqWWZPa0SmgixKDauhcSjIfOTng59r5iq/Wj+U/6oOffQXbJPB/FlK0I9ho7U4uOD1Lu6H2J/yW7gBEOfkHI6OuX2BoqWDoar5BrEUM/vcPwAfeuakNsy+HGKyRSjJeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRqbdq0Zn+S8pdsrq9xKGsTfGSl4CDKQGEuadVHjx5I=;
 b=x6RRRpkktkc6CpRfqzvHMDBWPznjky9IP9ct+xdxLtGtMTDEIoS7zq5WU1xmLlay3HIBxEXxgKMhqjx6zFtHDjYTF+39ExWSP1emCBKrsm1xDiJDx7WisLS8ghluPvIBVFI4l/XzkEsFxT2wg1SQyaCN+x8nDvNVSyTz0FzxvPc=
Message-ID: <d8c488a3-c29a-4afd-869e-fff8d1d2d370@citrix.com>
Date: Tue, 2 Jun 2026 12:50:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 1/9] libs/guest: Reduce number of parts in
 write_split_record
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
 <20260526094324.12286-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260526094324.12286-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4a9bf2-cf1f-4a7a-2016-08dec09d1e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ll9X9PbY/GYJ7TRj2C7yoCBEeExEVWNvPHlaCVmSU/PeUJP8NV4XAR72v39xTglsAn/fKgKAC65xaUl6h1W5aivz4FPJz71sXpKzsM4GsuwV1KkNUhG7DlhsgTqBZso4y4P+ddXNjmlAb4yLLRbL7oDVOWjxEA68GQKc30UIuT8ZBpwMQWiBBPT+52AnkKsAAtM2MKPPc3YZYvmo9qFg+EEaAhClLTRd7OEcETd8nvQ3Y56CLRSelgzU7+w9Ab3dEz+LhKhBtqLKmHBWJyHMla7kSKyIBQXxwKizb8pkxzFVIY8eTnKdMjoo7oGaPTu5bo536lANPv8Sd466jfiCLbTvQm3HeW6wxB/YVaHI6ZJE+Mu5ccGPjv0j7wOyZ5ROaPMNwd6k50ixr52ZNIhNm28lTexmhTFAKIUsEwRrVYCRMtLrotgi0hm0ANJsQidpem+ixD/PU2vj7tVWWcntq6A1VOIAIwN0IfUOSnAaXWgK6GebfPgDDGBv6IAqsLpbrUYUIyMVv6xFwI4MptxSx1cdp2buUPBPdRUBlWr2IKCrPRpK9T1KILz9QG0Ge7XkFslc//v6H+1fKB03A/hjDkBshRpY9OWkukrUXaDBTiz5JU5mIDX6+EqfRODMkRp/V4EGVB2QDLShT7KxYliJGYMajAeF7/FxWf0OY0ryQznjkUG7Zfj0/KnKv7/KVqVE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUtBTDcrYXk5VVA1NXk4QnJ6SjJoYjFLS0FHcEF5UVI5QU9BVVh3K09nVWlJ?=
 =?utf-8?B?QjkyTnR3aDh5ZjBwYTFVQXdzWldZUStCTGNLNWZGZGVNVy9EQVdXaDk1WGNV?=
 =?utf-8?B?TU9kKzFjazRKT1p3dERwcFZnMTFaQlNQQlFsQVRyMUxvWEhRNGwyTjRjVVYx?=
 =?utf-8?B?ODVEMEhhcVh1TVVwYmU5QTVTZ3Z6bStIMklZMW53aGtDdDI4UkVlZHBIZGY4?=
 =?utf-8?B?QUM5RVFqYTlJNVJERWhUNGlrR2oyNEIxczYrUnZIdUV0V0NUbU5iN1laTit2?=
 =?utf-8?B?UFZhcFRSdldjSE9YYTRrZUZ2SlQzQkwyaU5TNWhmYkhMRHM4QkNKaTZCMzBM?=
 =?utf-8?B?QnliUU9ZNHN0Znl3N1h5TWxJNXZqaEpCbG9NNjhMSjNMTEQvVVJUcnZuRmdD?=
 =?utf-8?B?TlpjT3ZXVjFDVVNPdzc2RGpqbFhLMG9rME1uN29PRE9wZk1VRTQ5U004YWk5?=
 =?utf-8?B?WXN3ZytISndFTGs0TGNTTTJnWkd2WEgvNVJIY0k1QzYyL1RmRlJFTGJkeTJl?=
 =?utf-8?B?R3V2Qkh2bDZBRHZWN1JoTTBqOXdTSEJwNDBiLzZaaFpIeWpVTlF6d3pMc1V2?=
 =?utf-8?B?SHdPNHNMZUVhcXNGcnVObnppTTJ4TWFBMWViM3M5a3EyOGZCSjlGWXVMRkFD?=
 =?utf-8?B?V29YY0pNc2thMklkMzh6a1lmK0I0bXE4Z1hrWGF5dFdEemVYNW8wdGpYUlAz?=
 =?utf-8?B?dmNOVjN0Z29iVXBSMWFjdGZXUnRGL0EweFZoV2gyWlMyRWxUaUhpYmQ1azYr?=
 =?utf-8?B?bHBDMjY0bUZjZE96ZUpsU3lwWGVEL3E0NGxBVWdWWVBxTzVVaGtGVHVKRWlB?=
 =?utf-8?B?WUtTK1FLWDgxS2YzYVRNQk5wd3k0MVRGR2tkWHhIN0YzS2YyRm9OeWJ4MTJE?=
 =?utf-8?B?bGZ0WVVBOEhLV1JVcXBjdGp2NWQ3UUJYdTJiVGhDT0N0REZRRmRoN05la2wx?=
 =?utf-8?B?NTc0enQ0K2pBZ1Y1S2Y1eEl3bzVJNU1vWVp5Y0gwZFJoa1g2bGszZHY0MFBn?=
 =?utf-8?B?TFh0L3hNMCtFMUpxWDN5aWJKYTNlemhvMTdUTWhEeHN1NEVIaUhDWHZBMFIz?=
 =?utf-8?B?SW01Z0tuUlg0bmxwSkNlYTVZbWFEaUdPQi9ZY2Q0bjR3T0dJTWkyZGV4NlBD?=
 =?utf-8?B?S1RKYmo4NEVpRDVtelh3RWtMUFlxMHRoSHRTU1pIam5lYnhqS2JSRHQ5Ni8w?=
 =?utf-8?B?SFJqVDU2V3RPUHFsZ1pvNzA2bTdPeUVYek4yY0xoWStJc25ZbjFBWWEvOGpT?=
 =?utf-8?B?dkpnRDNud3U5WlBzbDEzZDJtTkNTaG5BaGR5U1N3aERUL0NCZmRDM1k0N3Rw?=
 =?utf-8?B?YmhDZ2MyVHhISVBRMnEyL0U2dlZjcVhUUW1LdjJDR2hlNEVtVXgxWnUzQzBS?=
 =?utf-8?B?M0JEQUJoMldNeWlaeWFEcGcyelBSZVFVd0drL01IZ0FwNXliNm93MHoxeFFE?=
 =?utf-8?B?VGVvQ2JiRWhqQktRSWEvVzlOOTFPOXBmeWllUjgrcVhpclJnQjdqdGdiVjIy?=
 =?utf-8?B?Q1VCdGsyZk5pY21ab1VkREtLYlpLYmF4WVdtNVIwR1poNmlBOGdBaGxISk9m?=
 =?utf-8?B?WVV4c2Fuem1uM0ZsRFJWNXhsR2dTbnh4TkxzNW02c1crQk4wWHZ2ZmppMUxO?=
 =?utf-8?B?a3JMT1dudCs4cGdkWHk5WEIreCtObGxnc1UrN1Y4NXRkTE0yWElpWUx5cWdV?=
 =?utf-8?B?bkJWMHRaVlcvUG80dWYwMWl5ZkUraldCQ1JtNlZGU0Vmazk5bDM2L09HbzND?=
 =?utf-8?B?b0xiRkpBM0xud3hOYVBHZGwvNCtnaWF5QzRjVHVxV3FwVDRLYll2VTNzb1dp?=
 =?utf-8?B?eElpZjRIZ01GNUcvQUNSSHdnLzhCdjYwR1dVMkE0a05XM0Qwcm9LMm1icklJ?=
 =?utf-8?B?Q2cyVlFiS1VRVlhsSEdOVmRTQVZ1bnlPK2FXUDAzU1JLa2RVcTFkMkJmc1dr?=
 =?utf-8?B?L09nRjFUWGhjcnZ3L0N5K1JHYzluTDNOKzQ3UEV1Z2JoMXhDamoycmc5QmVL?=
 =?utf-8?B?TWxYSSszNU43eEwzSzBHYlBrdk85U3pmeTVpdXFabHRmaUNVdm5QbnN2QXBR?=
 =?utf-8?B?eDZhM243aXFQVnFqQU4zNGVzNDg0MlE4NHF2dlV6SWRrdnRkZkdCQkdVaWhJ?=
 =?utf-8?B?WnJ4amFpUEsvUEY5NndqdTlaZzEwNFJadXlJRkhaTDVFZE5abDFvSkJJRG5n?=
 =?utf-8?B?bEpxUVhWUFY4elZMbFZ6Nm9CblcvU2RLZS9tdDZBandRM0d2aExEMWxHdkRN?=
 =?utf-8?B?SzBXVlJYNUVrNVZCL0JtSmhZV0FCUGdCUCtKQ0hySEtvVFptSE90TEREcnNw?=
 =?utf-8?B?Ty9XdS9ZZnQ3OUFlcmxXK0xKdXlYWFBCdW05MnBZK1JmN2tndlEwbjNOekNW?=
 =?utf-8?Q?pJ7iuA4rjwo4uLCo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4a9bf2-cf1f-4a7a-2016-08dec09d1e24
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:50:18.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydss0sU/mDK/CP/cKJPhTGKBiVGyeY9QpDr5QMNUmeCZOCI81/3n5TuQ15fRgkgmuILWLIkVPD7XhDbKUZc24gJd7Fj/RRwu0w5TefoOahQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267
X-purgate-ID: tlsNG-d25034/1780401023-F5386CF5-5FCC1604/0/0
X-purgate-type: clean
X-purgate-size: 778
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 3CE6D62DB6E

On 26/05/2026 10:43 am, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> Small optimization.
> There's no much sense to split the header in 2 pieces, it will
> just take more time and space to reassemble them in the final
> buffer.

This part is fine.

> This also avoids truncating combined_length to 32 bit in case of
> 64 bit machines potentially avoiding following record_length check.
> The function become more coherent with following read_record
> function.

This isn't.  The truncation just happens in a different place now, when
constructing rhdr.  The length is strictly 32 bits.

I'd just drop this paragraph.  The largest record is marginally over 4M,
and callers won't be passing in anything larger.

~Andrew

