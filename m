Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOiLE9bZ8WmLkwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 12:13:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C0492B32
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 12:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297173.1573292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1v5-0004ks-8x; Wed, 29 Apr 2026 10:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297173.1573292; Wed, 29 Apr 2026 10:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1v5-0004iw-5y; Wed, 29 Apr 2026 10:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1297173;
 Wed, 29 Apr 2026 10:13:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wI1v4-0004iq-6Y
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:13:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI1v3-0051zp-7y
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:13:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1d9bd-bab6-0a2a0a5309dd-0a2a4502d12e-16
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:13:25 +0200
Received: from [40.93.196.50]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1d9c3-af86-0a2a45020019-285dc432177b-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:13:24 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7195.namprd03.prod.outlook.com (2603:10b6:510:244::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.27; Wed, 29 Apr
 2026 10:13:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 10:13:18 +0000
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
 b=pH24UTzWbLJblT8PDPrtYGFT43xhN6FJpWkBtRxnky9f7wvJjKPpNJ6gdh2zDV7W1YRHRtVnEgpzGch20fNVFENegzZhAAzJjqCrw5IiUJSWxr0HJy8aDe0FDTCeEyGsYzMEcPk26zgTx9mPfjG29z4tohtQqMXSfRbo4IuhQX7iBOAu8er+5vN7tULoOsYXTk60RuF2lH/e3DPv+hbMnKlnSd8NvsbXVML8+qOAKPpKZ2VobPaNm0Oa7SGWhq+kIuJrZdbNGdjzJWt33hX5y5c1Y2E1G1HLVY0Eulpz8dAZc1y0WrNEaxSu3P4YodjTwDUIX1ufroEmKonZw+iNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLhzOF7supAJ3qPCXfKOoAbySdrH7P6vKIlc01aPPqQ=;
 b=JBhYIOKE8viu7PFF3RxPKafCc7QWyiiPzvFgpZ/UGSjyau/39hPJz5BcimFYEhuvkgYcp3rMby4wQXGZBQD5od7g4JuiOGXqaYc5073LwoNQGhqtYYv/Ik4V2zjqJCdHWeZRBE5yCMBd9/m99z4yNHjoTL+2c8w7PIZiEvEQ3lqE7K5BD5j1OWGTkApUXwb2LTmXcYp0fX7Xvh3ely148CSOC/4emtZHaqGW6LVdUGCQe3osOa3jwmbjxfeA62n/EEuUU63xQdMSvcH6xFVIMcyDUr/BAV6KvlGIpnfUwUbfFuTnMf9396HamCP5vYQPQpoOGd5bnw4CPmZJKod6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLhzOF7supAJ3qPCXfKOoAbySdrH7P6vKIlc01aPPqQ=;
 b=HtDSF6iuHQTtjvB8ojLcBzXR0JCdxhp8IJU+Qy+YFkfKDTQioOWFxUY0lCv1fC35o6rnNCG0cYbuEQvQkTI9/3nDOorH4zyvKl3oPVO0+KovUlVkx4gE7LM/Da89PuI6fixRFMwgihQTfojbXHVzOjfun3xgmpSlzkS5RpppjSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Apr 2026 12:13:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 14/17] libacpi: build ACPI MCFG table if requested
Message-ID: <afHZutWoJGHoKemZ@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-15-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-15-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::26) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: f2960f6d-f0b6-413e-8dae-08dea5d7ef5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bCpVlpOhHnE+ZRdKb3mNu2Hwa4cl5NlF1EYQYOO73iE06Khq7hA4xboqJwwOydAfCGc6PNK5SCfBzu8/9ikFSYr6bFZshkdVraoKyWr3pVdYIrJq6lbctjhztLGlwH8y/PHTRSsm7CUCLx7OEEABhdA8FXlbvNJalsE0vHAifvrAGKDJiYkOXOUm+Al2KiRt9RXRpEnHZC8BNesj8SAhoPVb4EUWu2Y4kSqnctNTBZS2lRsxnpNBdlqio1ZNmVBclTGjf2NW6fQTVdpYigxzopHGSRgwGgiUgaADykDNrKc82h6l+t+AVUGRAbNzsNBG3f+n9fMtUdk5RvQH/ylzrElaX7fVZKMvneZcPJ8Gq9mPcU1uunyDIukcH+S2coglyDivrcvWjg57JwF+h4dXwoXZb3/VOTSndWYfsc1CFA1Wrx8KW2RWUMEam/dgSFPu0XVm8cDkMqe2yITpZCcorEWMl5uJ8E/rYWZmA95byJJd3J/mNWyrUOPESlSPzMhOA0cvwr/y8VIR92auR0BriO/4PLtweSdc7uWqKUv0PbYErOf9fQvWw4GZV1HKSe8pNlCrCANc7ubwvRPhocCVXb8Sj7alqMbnPHPvUOK0GiGsyzWKW6i76cjjrmquYD78nDsmed1bpgAz8/71LI3WnIBT42V1FM7WSb65DeyBCOzddJ+z0JPCtU27+P3WRSc9F05rpHs7O/RwI52b5eA+ToTa+57jf/VWADgMOxk9C0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFlPb3dxL0dodjhrdHdaYVlqS09COFgzNGQ4K3VhdlV0WWFjenNXUm41VFE5?=
 =?utf-8?B?RithbU5jN1Y5NEIyTWFqd3NHeFA4dWFxK1RjTzlWWUQweXcyWUtoKzk0amtC?=
 =?utf-8?B?OVNqTUFJSFJBbFNKQ2FkNjB2djBkbnBSN0l0aUlkbGVzU0d6eVVibTJ0c3Zv?=
 =?utf-8?B?eFBFcGo3ZWVGUTdvYVFybTc2WUNqa0k2NGdHckNTQjNvK0R0OHZCRGJXQUNN?=
 =?utf-8?B?TE5BYkEycEEvbVpDYWJiZEs1MlViTG9QSEU1NXNRUEFONHZiSy9Cdml5WXhh?=
 =?utf-8?B?ck01OEZkRUs3Mmd4VkdnSWRmWndiZ2d3Z09Eb042WWhwbVFRZGFVcS9DRVJo?=
 =?utf-8?B?KzdpK1JNQWhNMmF5STJUYTByYUhERkF5dW1icjg5SmZTVEdPNTVkbmg5dk9m?=
 =?utf-8?B?Q0ZyZ0RFc0plMW9PcVJiU2FwOGNFeklNZ2NHY2J3dlNURkpBTkFxdjJWOU92?=
 =?utf-8?B?MTVoTUlBaTBKSGQwa2IwV3dqSlpTUjJTWENPeUx5aVpqaTBIeWpTWnNsV2NG?=
 =?utf-8?B?T1JpM1piK2hUUTU5c1NpVTZkNlAyNUcrVS9hUW1RYk11a1FxOHhtb3E4REZn?=
 =?utf-8?B?eGN4Nnp3SFV5NGZoNklxVm8reUlMcTU0V00zcktoRU4zSWhvUlY3UFBNcEUv?=
 =?utf-8?B?L3BIYTVBcFdOU3Q4a1JFaklzZllwcnl6ZWk3cjJHMGM4YVZyaGlPTTJ4S0wz?=
 =?utf-8?B?MWRlMk5WbVI0UWV1L2FOZzdyaURJNnF1aHo4cVhBZGI0M0s1dVdpRlJiN0dt?=
 =?utf-8?B?bS94bHBYbVNMb3pOOVY5dExNUWRudjB5dG1rQmo1K1VKeUpDMm9WMnk3bS9P?=
 =?utf-8?B?WEtpSnJZNUdua0RVUzk2NzZNV2YzQWxIRnFuendieWM0NFlQaEZyQlZQN3dJ?=
 =?utf-8?B?ZUF6YzRCS013YjRtQmVWSTZXYlluRkl5TkRxVzR0TTBaRFBmeHpzb2w4RlRy?=
 =?utf-8?B?Z0NzU09FbmdvejZiOGFuTDhkUHZIb2FYc0g5S1lwMGhJYmU1d3pLUUVlZXh3?=
 =?utf-8?B?T1FvZGN1RkZxQVBLU0RRNEMrRnlEd1FkcjBTN0NtRUNMQ1U4Z01iTDFXUXlF?=
 =?utf-8?B?ZzVva1NsZlhobk1ObTBVSVExbkxMSlJ3ZktlRmd1cWxJa3B2ZGdYUHNHcVRQ?=
 =?utf-8?B?RUhmdHZjbzBBYy83dWdvVm8zRmJJNm9iZXU2L2tDNyt2NlhZVEoyNXg4ZUNr?=
 =?utf-8?B?Y1N4bGRVSDJkdEpYOCtVY05INDFTU2hIdkl1Q2E1aTgveFlEeHpiaGhCTzla?=
 =?utf-8?B?MVVtRkRHMkRHSVZ6MDVJQ01ibnRMT28xUFNWekxGclVlZERCek9NVkZjWVdF?=
 =?utf-8?B?QWhONzVjN1dvMmxMb0tEU2ZZRlNyWHBHTHI1T3FBUHUydVk2ejFIR0xQN3M5?=
 =?utf-8?B?MU9zd1Rlby9iSjlvSjYycjc1dEVlNHFRU1IxYTN2YUpzWExBc2orYTU0VVVO?=
 =?utf-8?B?UnZhUDFQL2pHRFY1MWo4ZE5aNTluWWpHbVlqVDJYK0ZZY1ZBN0VzcFZJMnBt?=
 =?utf-8?B?cGNheWdINUVQa3E4MUhKQUt4UmNBWmE2QkxqMTJJNW9HT042aGZwZ0wxWkFZ?=
 =?utf-8?B?R0dLM2V1OVZPdDY1WGoyNFIvYnJjMmdHS00zUDJmdUJMZU5qSnBQQkVIMFd5?=
 =?utf-8?B?N29tSHlGOTlCbUtzanVTamtyT2hRSlMzOUlIdm5zWDREcGZieVJhbi9XbDBM?=
 =?utf-8?B?UFd5SVB0ckg1N0NFZ1pKcnVaZ1gxc2tpb3NyYk1CWW5JSTRjbFJnSDUxNzVB?=
 =?utf-8?B?VmYraE5jTG02NTVrUEMzdkVwZjdCa0lPOERwVjgxSW9UQ2srN3AzMUo1M1VS?=
 =?utf-8?B?OU1sV0Y4dUs3RUNKSjN2VEViTm51L3J4eWY0SmVyOTRsZm1yZmNxUkRzVm1v?=
 =?utf-8?B?NFFYUlZUWVZkSE9wVXBDZ2xldFl0MlVxTDhWLzJaL1VWS1o4b0dqcDdnelZx?=
 =?utf-8?B?bjg2cHdKVHZjcWxMRGpaNkJhVDRnSWVtVXdidHh2ZEJTYzJrOFpmS2tWYzds?=
 =?utf-8?B?dEl0alV5MncrY1FLM2QrUVRvNDA3V2dqSmM5TEtsM3c1VklGUUhIVEZzRDVo?=
 =?utf-8?B?MnZJUFB0SnFuNWlKZStRSlpYUjVxZHh4TWc5V2NUcUNnN3U4YTJCRjVnODgz?=
 =?utf-8?B?N1ExWEhqS3RhMVJITEpmanJickI1UlpoRmNhUy9LZ2JlRk9Tb3kxQ1JCYUNK?=
 =?utf-8?B?U3RobTVrMXRGSHdCeGVRbjBZZkkzZ2g1MGhpRy9kVXRHVVVIY2Q1TDVIbW5u?=
 =?utf-8?B?d21hMTYrWGdLNzBISWdmRVhoZ1plaG8wK0JFRFRsSmVFYXlXZzFBbXdveWQ1?=
 =?utf-8?B?ZlpjMEE5KzFtcTk3Zk9yYk9nRThxa21uUU9ZWTQ2Mkp2S0daM1RWQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2960f6d-f0b6-413e-8dae-08dea5d7ef5e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:13:18.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb6OFUb/PrGV5a3QfFYNOjauBI4CwpJRHVukv7E5N3RKCVJ1+pm3LOsvLnZZoXTkR20uCb0hHwAZMNZsLpJNvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7195
X-purgate-ID: tlsNG-720697/1777457605-81772161-4A83587E/0/0
X-purgate-type: clean
X-purgate-size: 3816
X-Rspamd-Queue-Id: 4B9C0492B32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> This adds construct_mcfg() function to libacpi which allows to build MCFG
> table for a given mmconfig_addr/mmconfig_len pair if the ACPI_HAS_MCFG
> flag was specified in acpi_config struct.
> 
> The maximum bus number is calculated from mmconfig_size using
> MCFG_SIZE_TO_NUM_BUSES macro (1MByte of MMIO space per bus).
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/libacpi/acpi2_0.h | 17 ++++++++++++++++
>  tools/libacpi/build.c   | 43 +++++++++++++++++++++++++++++++++++++++++
>  tools/libacpi/libacpi.h |  6 ++++++
>  3 files changed, 66 insertions(+)
> 
> diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
> index 51623e2a8a..2b16bd636a 100644
> --- a/tools/libacpi/acpi2_0.h
> +++ b/tools/libacpi/acpi2_0.h
> @@ -442,6 +442,21 @@ struct acpi_20_slit {
>      uint8_t entry[0];
>  };
>  
> +/*
> + * PCI Express Memory Mapped Configuration Description Table
> + */
> +struct acpi_10_mcfg {
> +    struct acpi_header header;
> +    uint8_t reserved[8];
> +    struct {
> +        uint64_t base_address;
> +        uint16_t pci_segment;
> +        uint8_t  start_pci_bus_num;
> +        uint8_t  end_pci_bus_num;
> +        uint32_t reserved;
> +    } entries[1];
> +};
> +
>  /*
>   * Table Signatures.
>   */
> @@ -457,6 +472,7 @@ struct acpi_20_slit {
>  #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
>  #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
>  #define ACPI_2_0_SLIT_SIGNATURE ASCII32('S','L','I','T')
> +#define ACPI_MCFG_SIGNATURE     ASCII32('M','C','F','G')
>  
>  /*
>   * Table revision numbers.
> @@ -472,6 +488,7 @@ struct acpi_20_slit {
>  #define ACPI_1_0_FADT_REVISION 0x01
>  #define ACPI_2_0_SRAT_REVISION 0x01
>  #define ACPI_2_0_SLIT_REVISION 0x01
> +#define ACPI_1_0_MCFG_REVISION 0x01
>  
>  #pragma pack ()
>  
> diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
> index 95188e217e..90080c76c4 100644
> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -295,6 +295,37 @@ static struct acpi_20_slit *construct_slit(struct acpi_ctxt *ctxt,
>      return slit;
>  }
>  
> +static struct acpi_10_mcfg *construct_mcfg(struct acpi_ctxt *ctxt,
> +                                        const struct acpi_config *config)
> +{
> +    struct acpi_10_mcfg *mcfg;
> +
> +    /* Warning: this code expects that we have only one PCI segment */

Not only one PCI segment, but just one ECAM region.  You could in
theory have multiple ECAM regions within a single PCI segment.

> +    mcfg = ctxt->mem_ops.alloc(ctxt, sizeof(*mcfg), 16);
> +    if ( !mcfg )
> +        return NULL;
> +
> +    memset(mcfg, 0, sizeof(*mcfg));
> +    mcfg->header.signature        = ACPI_MCFG_SIGNATURE;
> +    mcfg->header.revision         = ACPI_1_0_MCFG_REVISION;
> +    mcfg->header.creator_id       = ACPI_CREATOR_ID;
> +    mcfg->header.creator_revision = ACPI_CREATOR_REVISION;
> +    mcfg->header.length           = sizeof(*mcfg);
> +    mcfg->header.oem_revision     = ACPI_OEM_REVISION;
> +    fixed_strcpy(mcfg->header.oem_id, ACPI_OEM_ID);
> +    fixed_strcpy(mcfg->header.oem_table_id, ACPI_OEM_TABLE_ID);
> +
> +    mcfg->entries[0].base_address      = config->mmconfig_addr;
> +    mcfg->entries[0].pci_segment       = 0;
> +    mcfg->entries[0].start_pci_bus_num = 0;
> +    mcfg->entries[0].end_pci_bus_num   =
> +        MCFG_SIZE_TO_NUM_BUSES(config->mmconfig_size) - 1;


You might want to check that mmconfig_addr and mmconfig_size are set
ahead of using them?  Just in case some bogus toolstack/hvmloader sets
ACPI_HAS_MCFG without correctly populating the fields?

Thanks, Roger.

