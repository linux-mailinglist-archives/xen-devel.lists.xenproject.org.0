Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF68M3tpDGo8hQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:45:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0F57FEE0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313062.1583278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKl9-0002dP-Lq; Tue, 19 May 2026 13:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313062.1583278; Tue, 19 May 2026 13:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKl9-0002ag-It; Tue, 19 May 2026 13:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1313062;
 Tue, 19 May 2026 13:45:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPKl8-0002aS-2i
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:45:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKl7-00CpEq-Eb
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:45:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c6963-2eae-0a2a0a5409dd-0a2a4502ae54-34
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:45:21 +0200
Received: from [52.101.46.0]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c696f-af86-0a2a45020019-34652e004f35-4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:45:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5224.namprd03.prod.outlook.com (2603:10b6:610:93::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 13:45:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 13:45:16 +0000
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
 b=uworPqCH1fp3E6kXgPkmFO4ltjKQsU6Yju8Me8brrzHzil2b6M/JqmK2deHONKBdniN6VNe6RJMMPj8DqoIC3R2pNxGyXA/lN4yQv8HdPhvOwTxIhb4wkdH+BWxHcoNsl1VpH7YmBljfcvr/RpvVo10Gs0XgMQO5oppXFw580Xj0udWsrIhrvVXTx/yHNLjvJtt/hZrapGWra8K/v5b8GRVIhUIkEmDucGDsaVm9r8KCr+iXtEFUa7Uae27ncM2bIIrAzXZXuUIPIiTGMSmmvzewo84tWhWTSbdZtWo+XpcLlPHAX+/L6LwJ3EIncDCwJUbiBJzbWDbxZ3tIn5l8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtEmnQOTQ6ssUy1qlvVRdBUL3UyHxDpmyqpMB5vejdc=;
 b=Yxakn81WEugvSMdVrtIXJ7zI37cqZd9NNBIgoVqxAEG0Zqr+NvQ6FKCe0OT1llQZsCbtDNjEjrGbdkboHHezqOiWoVcYARGs8U7vla3Q06A/quw9iCPNfqxJB42VbAgpGOCraXaJfOcRkMHx5ZqhSrvxzl4DxDed/ZwaaH5GczpXFQyPODz1bE3kVJttv6HCxXX2AUUtR+tdRZApHeXYpPzx5fL6s4563kYCbnKwAiTmHYP0vrBOL24xbm7kprpDYhG3vz3Wlz39DPQMT4adOhv9vYou+JrWknsfe1v05n7+DYvkCzFR6zHyHFwVUdiEmC/BmY6bHCn130o8JMq+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtEmnQOTQ6ssUy1qlvVRdBUL3UyHxDpmyqpMB5vejdc=;
 b=T/GzB5okw+OP80MGEnlN/kqVxMR4rZIrkzhk0GSWXzYAz6in0LhyfXMkpId2C3CjEiSSJUqgzyfE82pRNU95sZBcGwZilCFBvyjK5b+5GZ+TEeDn3i5VeBkYFVe7aiFUrnO1PamUHn+0UniGeW2PatjahUsCiQgTBCFtbsYnfTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e06a61c8-c2b3-4eb1-a118-41e1a70db77e@citrix.com>
Date: Tue, 19 May 2026 14:45:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <agxoiG_JLs_84rY5@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <agxoiG_JLs_84rY5@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: e75206bd-15ac-4c3c-5449-08deb5acdc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799003|4143699003|11063799006|56012099003|18002099003|22082099003|17002099007;
X-Microsoft-Antispam-Message-Info:
	Nby+IKRBBqFu+g5pVB5Qx84lAyv3RfsH+g228g5keUKps2kVz9T4nvqlCaI/JFY0ZfRahsHvasWq2uSiRv2mcKC/7LhuhOf+vX3QLAegTwF7eZuER+ruem6knPTdzCrD5drR6z1ep5Fb3kbWZbXKUC1RVYI8b3/JhbzLmM3bJX74DFC6wPodPL0bRJvZ+ASsb6aQfuivTJPDoXmM2cOz2U+vdmjavZkBvlX0QNKXXTDTIw7WVWvmxBvt0wUdxnc59J3YZORTFiNpAlHdzanq+qki6T1z9M7ycrSekSuhd7S76LvIQWix/BJPpKwwsuKo6cQF/rM92racvriC9Jd7o8F6bWRY5mbGavj0DdcMvI7gnbWmd5o3ASFAyX0Ni8v60PHOVpHTL3jGfYdnT7R2dhGtybVB/9bfFKd9xYHxf416UqwlXHQy0ApgvWfxqrtwvEQQEP+Yu2LkK7X+paJCMPum9EX7yBnwFNg9lIOuPXcrsqPlBbGJwWZ7itcEeu+kBwJNezZiMY+wNJ5Yn3rEe5xzTA7Wji1h055+LpIZBxVjAd915KZI0cZc6B0UWSYEyiqq0q7IZJNmlHroQ1Qxhkxm5rFxH4XI2IKnYqbPXgpD5+ydWN6TvYlkdMA0oLpDIxxd5pqr+yEtlliZblT+6Rce8mG9JleSXTOTbKFkbBxHuwJizsyhYMPRCxfte/ut
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(4143699003)(11063799006)(56012099003)(18002099003)(22082099003)(17002099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTFXWG0rUmZFQjlOc1hxSlJ2SXZVSTJQSCswSTJ0UGdmZjNkdVc0T3ZYYVlW?=
 =?utf-8?B?eFJYeUxNV1Q2QlQ5R2RvYXk1ODdZNGphZ2ZBWm0rbDFTcEIraG9KUWEvSnpn?=
 =?utf-8?B?K0xFQ2E0TjZIdmxweFhFWER1L3lGUlBISk9Ud3Nnd2dQNGlCeVJKUVdxQnZk?=
 =?utf-8?B?eSt5SE8waGZkOFhyYWdydmdaRzJpQnhCcXpZbUJLdlhFdUdZTktHNEh4V2dO?=
 =?utf-8?B?Z1ROL0xmMVNSWkNXN2FHQXRhUHpHa1BtcVNRcEtzT24rWWc0Zkk4RFY5aGRh?=
 =?utf-8?B?Y1pxaDdBMjBYMjhhK1FhNCtBWEZTdktpM003d1pra2JXM3VNRzlmbmJyVHBL?=
 =?utf-8?B?Vms3UVFOeWJaRkVTUXpONllSbjJwaWtjN2s2ZVR0NVFzRUlkWmU3MTJ6VkpP?=
 =?utf-8?B?OVd3MlNVNXJ1TWZtQVpGSVVJQlFMOGw3QUlMYWkzRUZ4Uk5kSjFlaFFPOGtw?=
 =?utf-8?B?dHEzUGRsbHZ0Y2tnS05KS0FpMGdETWdidm5iNk9VUWQxNXJhM2liZjNnRkdt?=
 =?utf-8?B?WDZqN3JESEdhTFJkQUdwM2RpL2xKNkQrUVAwdUxKYW1ROGN3a3M3bCtrMi9s?=
 =?utf-8?B?ZjRPd1RkeU84MmlFb2UrOGluSzVYaUZZeCt2aTBNRzQ5b2VnaFpScmpEZWZx?=
 =?utf-8?B?R1QrMFpJZVNmSVdoLzg2NmtzdllsK3VlOTBKR2VkendqL3J0Ui9KQVRZcnVI?=
 =?utf-8?B?Q1FNTG1rdnBpU1hudkFmL2FOVjVVdzVmeDhsMUJ3am8wTXNBUGdWTWpkK2xh?=
 =?utf-8?B?V1d1d1NET2VZM1prejlIaDFsa0NFSVc3RnVMSEcvTHhOOS8rbFNkVkNmZjR3?=
 =?utf-8?B?emRIZWZmaGE5NkJ5SWM5WUMxb0lYVE9KS3hXbVhNZ3I4RDhkRGFwMkkvaHRP?=
 =?utf-8?B?encxcE5SdTJlclZ4MmxlcUZzNk1yNVNOYnJLb1JuS3pvQ3h3d01CQXduejQ2?=
 =?utf-8?B?WEE2MU5xQ0p2RjE1ZXdleU5kODRqdEhFV2c1azlUNTFPNnQxaU95cFhpS2xk?=
 =?utf-8?B?MU13a0JiTGJhRlBFWkE3L2hSdHlyT1ZBeWE1U0g1RDh0WWgzdTRVVXhPK29N?=
 =?utf-8?B?RFhjRnBQUC9QZCtjNEIvaVByNU9CU1dmNDRBQ1haMm1OckVUOFFNQURnYXZt?=
 =?utf-8?B?K0RkNmV6cWwyT01INkl5ejFyWnlEanZXNk5RWHFHU3h3TWJHblVmVzdEUHp4?=
 =?utf-8?B?c2k3ZVhqdE0xRStyOFNmNmo0YkJaV0ZEK2NEajUrRFRkK090UHJIWDNnRHhF?=
 =?utf-8?B?TWxmUWk5SzNqRXFjSkFDb2lReFNSMmoxY3plRHdjdFdLNXNaVTY5RTV1UjhQ?=
 =?utf-8?B?MnZZZllwTVF4TFV3YWpMQVpCQUFLVjVUNjVCcC9RWXZIanRBS1prb3hIYTda?=
 =?utf-8?B?bUY0NS9NeDNJYVJFV21lK09ZcDI5ajFKeCt2TVdIV0NRQndKWERhelJxb1k4?=
 =?utf-8?B?S0t6NTl5OFFPdjNVeWQ3SlEvTytxQkhqa1FQV3JoVmczeUtMaTYvQlVYVkky?=
 =?utf-8?B?RHBrQ0tkRTlNa3hpS25udDFHcUhERUdMaW9QcW1LaDkrMzBKQUprNllIT1Jt?=
 =?utf-8?B?b1Z5NnhlRFg2SWdmNDIyaFhyQldkZjJON2JiVDBlU3JkNnNZWXhFNmdEZEdJ?=
 =?utf-8?B?clhhUTJ2WEltRXJYV2VxV2FBcCtVQyt4d3piWHpUa1ZkbHhETEYyaGlPZVNR?=
 =?utf-8?B?N2pkbXd5eHRHOW5WZ2dOOGFMTEthcGcxeHUwK2lncXg5ZlVpaUFPRHRpdHBQ?=
 =?utf-8?B?ZzFPYmt6QkNwV1ZDWlJtN0grUTlka0RxWk5qRENiYmtnMVZKcGRkSkRUQ3FU?=
 =?utf-8?B?d3pHN091SXE3dVU0dEM2alUxb05iR0tXSE5jZEhrVFJuNEswUm9CVnJZZzNi?=
 =?utf-8?B?cWpseFkvOG4va0drSWlZNHBSWERzQ2lrRmx4SzNLdHFNQ2lxYUs1bUUrZERl?=
 =?utf-8?B?TmlCcXVVZ0tqV0xvcHVURHVOcGIvWGFuRVZsMWlBK1A4RGd0b0tMaTEwam5Y?=
 =?utf-8?B?WGcrU0pvWm5VL0g1M0tiTTQwUGVJVFdlK2NsL01iQnU3ajJPRnNPTzlOLzV6?=
 =?utf-8?B?MWgvcnN0dE1ncUsvZnl0M2RidU1PSkhuTTVOTTdTYVAxV1M5NExrb0lHemhL?=
 =?utf-8?B?ZHhta3doNlduOHVWYmdyWTZIZXoxcXB6QmIvYXF3MlNhN1RIQjRiYm10RXFs?=
 =?utf-8?B?RWlDdVBlcUhsd1hqa2k3RXl1UUU0YmJZYUNzZ1ZGb3pZc2NoUld6QU5SK3l6?=
 =?utf-8?B?cGpzazgyTG8vTTd5SnIwVW1DRWFMZSthbERCbGIyek81dllmTWZCNHBQLzNV?=
 =?utf-8?B?SmtrYkRWN1VMdk1udnBhSEpYaEM4cDZlZ3Exc29zKzdrc1lrSjZGUEdST0Q2?=
 =?utf-8?Q?bypE75RZfpyCwV+I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75206bd-15ac-4c3c-5449-08deb5acdc07
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:45:16.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUShl3Q0cJHYFMNccpWcPOUetctlVNndnTwWsqkaBn8jidiJZPHO84a4kHUYMs+ZC2Z6xlGLFQ5P4wnScItibTcy1bfngK2C24N7LVAhNN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5224
X-purgate-ID: tlsNG-720697/1779198321-A937C161-D06B9B7A/0/0
X-purgate-type: clean
X-purgate-size: 1561
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:accek@invisiblethingslab.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,apertussolutions.com,suse.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 42D0F57FEE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 2:41 pm, Marek Marczykowski-Górecki wrote:
> On Tue, May 19, 2026 at 03:06:57PM +0200, Szymon Acedański wrote:
>> When netbooting a unified Xen kernel image (via GRUB chainloader),
>> the resulting loaded_image->DeviceHandle does not support
>> SIMPLE_FILE_SYSTEM_PROTOCOL.
>>
>> Instead of crashing via noreturn PrintErrMesg(), print a message
>> via PrintStr() and return NULL from get_parent_handle().
> It's worth noting this isn't the first instance of returning NULL from
> get_parent_handle(). The return value is used only as an argument
> to read_file() (sometimes indirectly), and if it gets to be called with
> NULL, read_file() will terminate execution via PrintErrMesg(). But with
> unified Xen image, the intention is to not call read_file() at all, only
> read_section(), so tolerating get_parent_handle() failure in this case
> is desired. Keeping the message in place will ease debugging if
> read_file() will actually be called later.
>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>
> As a side note, a slightly better approach would be to call
> get_parent_handle() lazily (on the first call to read_file()?). But it's
> a bigger change that I feel may be too late for in Xen 4.22.
>
> Also, adding cc: Oleksii for release ack.

Bugfixes are still fine to go in.

Personally, I think moving the call to get_parent_handle() is a better
fix, and fine for 4.22 even at this juncture.  ARM already does
something along these lines in allocate_module_file().

~Andrew

