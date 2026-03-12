Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJkOAbUps2ksSwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 22:01:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCC279AF5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 22:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253078.1549472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0n9j-0004o8-C8; Thu, 12 Mar 2026 21:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253078.1549472; Thu, 12 Mar 2026 21:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0n9j-0004lM-8Y; Thu, 12 Mar 2026 21:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1253078;
 Thu, 12 Mar 2026 21:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0n9h-0004jg-O6
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 21:01:17 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c361664-1e56-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 22:01:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5879.namprd03.prod.outlook.com (2603:10b6:510:35::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Thu, 12 Mar
 2026 21:01:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 21:01:10 +0000
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
X-Inumbo-ID: 9c361664-1e56-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQi54E4rNaAlR9LFArbSco/aTdj+hlGGnWa2pnBOQvXA/eLr5E2eWZMG2JgizIUgc/lpQZSWr1I0G79+2+ylekk+9XCUCNyT4b0a2c7GD9ZNLPqmNEm4SAwNs2p5tWyn1sV0qZ1NTuqyzH6rlwDKwV95NQ1jAbgUHykQ4C8W4XcSg8R42qrqpQ4uh8A9D4MMS85SnejRvk0E+NGwQL+GNS18xHYAMx2qUnTlin73jZPAQLeKF6t7eqjrhl7+b3RxD9Q/QDlRPp/QolGOG9CWKalE+RTgaDrEAMIHkEIutvGT0kqR36bciHAwpCJR8xlRS2DRoEAMHfVGdLmN5uKYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfT1ETw5Og2ImKkH6+AgTkKWLROrF18UPYPwKSrpohQ=;
 b=Lzo+2olsIBcIWmQFNw4odbf0S5p0MiJ1c2TmU6RmoiuUCoX8zUgMrvlbs2dBDe4aBnIo+72tHxXAnxv4SUyLgN3+Fej9Bw7quOiRGmwoNS4Y4nZaKKNCO0O4ElqyN7ulVUOlmP7Ac7bvYS9jgS1o9VuzNiXii2zsK0aXNb+PbWWEZE8kgAZgLrvF47JwYa+0F2FlHfoeNN4UjBVrHaQ8K2HZxxkXReDFEgvE44inuR6S+D+kF5qb5qREwf/11y9obhrt57UMfiufvHYhBRBJWPW1iWHnYKtP01kHgCgqyeuo1Fwkb38O9+mrqxelx0R6nWx7kRVnoKztJj3viz0XoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfT1ETw5Og2ImKkH6+AgTkKWLROrF18UPYPwKSrpohQ=;
 b=iGsXMIih8WtuDsWX3MaRvdUV3dd/LaGX/u3zE5j0vr7qjWSz8QTf5MbEFNy8B9SM5/WxO+e3vzZ+XnyilZkzNNlJ8ZO2IKxcOc9Ae/K75GQW+l1N362RZ2Ilh0No+QMfPZkQGj+P20zZdKahVCpWWw+f8FgSrihyIlMnyZ04smo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <92d21438-9573-45ce-a589-d292d1c31ecf@citrix.com>
Date: Thu, 12 Mar 2026 21:01:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v5 1/5] x86: Reject CPU policies with vendors other than
 the host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312112116.22563-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312112116.22563-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f28f894-cc0f-4d81-b3a2-08de807a7d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	xGvqGz1+QxqFUFFkUOBtIuFfDqVZxSs4om5pGBsE4kxyWGoyGCwjWmO9J/AYwVXq9w6kLOj9mGYhBkV1vQhwQ2aQxtQNqTJj8+0hZspjXH5MDwRsO3ZVPzYqEaZ5LHuA8Cj+LWdfLKX0tyWJOO+CSv3DxEpJndB/hCdxdKj8GvObvkHF60CW0ssJHDs20byFE6ooifU3/GcHjr7JthJVGXnzyYuW3VqJSl/yiWLlZQxvQs2sG6uerQRogZu4Vzp7KyasmO0hIBZmqQZtNYn5ePWxkcuzbeRhb3n3maSdXzEMWVAqRU/BdgXWDNG969zMv2o7fkY5jpHY0pch4nCtkkxbAPImM8c0Swq2Hp/w+gbzGTitkbCqOkg33Hlj+iWrQ9meVzNMhjR6nEXZTHh0paF93hTbawAlQYZ5SfIxAYaeS6UuVxe+nkIUnH0F9WfxGgtKzL5YI791bKfUs2CKYHDA/C14FCt7RMOjVldD+ZwC/WbafcoPkKu1QvmXYv8SggmzJXGDjfHZ7BNsm6dV+MU0vhKS0It1B8DRTCtjEo8S30FjnFmrIljHy6EhCJ6t87oNUBNsS/pF56/oHWWhMyobp8OYQah5tnkvNXscyubyC1Dn/YUuuEJqnMtkSx3A5UESJMCNaln7ZYAg/SNxU6QMEt4LG99WSUW/Dt+VN2aiof0uKa4OnaNLZbBVeFFE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFZkc2ZhcU9sRkJKcit5OXlOMG96ZS9FSEJ2SkcrQWEveC9MTjJFU01ESFRV?=
 =?utf-8?B?RFA4RUtNYVN0ek9uenpaVHFUelo5Z3lvY1N1cElDTmV5cEYvM2lMek9BU2t6?=
 =?utf-8?B?cVZyTnBCV1JmQ3pnSG85V1JOeXIwWHh5aFZTUERoYmpxSHErL1FNc09NZjc0?=
 =?utf-8?B?aWpSblprRzNKNUlQYUlmdzh6dVFNNWszRzZPSXY1dU1RbVhWaEJodmRwK1Jh?=
 =?utf-8?B?Z2NGMkJsVWhqUEJ2TlM1bHVkSFlnU2FDaU9NNENqL1dwb0U2OTd1a1g5Wkx4?=
 =?utf-8?B?cWsxQkFOWkJUZ1k0UThCY2hPMHZ3MHVTWlU1MVFUQWFoYW9RSlg1UDNhRFFY?=
 =?utf-8?B?R2txZEZpdjJXT2gycTkxaDRXOHBKMzBId3o4Y1A3ZFAzQlZFMmR4QTE3NFA1?=
 =?utf-8?B?cFVpczhDSndNY040MU1xdDNQZ01oeXRsWVpyTnk3b0pOUlhPU0t2c3lCY21a?=
 =?utf-8?B?Y3pFL0dXU3FFU0IzN0x3dEFzc3I4dm5vc3NRUmUzVEt6OHIrTFpGcEExVlF2?=
 =?utf-8?B?bkl1T3hjN2pWMWFlVXNSRUFPZ0loSGJJMWppVGh4c0o4T3F1ZVdxeHFlSWxY?=
 =?utf-8?B?emtWdDkrdTlxY0QyT2N0aVhHK3dhZzlmK0h3NXg0Mi96OWNoK1BHVkFPU01n?=
 =?utf-8?B?TnQ5SG9yNzJpaG5Eek1YNXpGd0M5c3I5K1JURDg1ajJodnA0SUZRbWx3b3dI?=
 =?utf-8?B?QXNzNFNKNU1rdkNNNjl0bHpnL0tuczFtaStiWFdWNXRnaGdyWUJOZVlhNHRX?=
 =?utf-8?B?SXBJOXNBRC9UcWZrbUo0bk4yQnp4bGZBMVRBMTFxTVZCZktKcFI1WmlMNnBs?=
 =?utf-8?B?dEVTMnloQS9UYlhZczBzc25jT3VOYmY1YzQzY2NrakdFRFBsUmhPSXRmVFVt?=
 =?utf-8?B?ekdjclAvQzFyZVRUOTg3Z0NENkFFL05mOU9CTTZ3d1BWSmh1eWtxL3RQdkRQ?=
 =?utf-8?B?bEJIckxZTnFxWmVJZFNUTzd1MzFzdVQreE9iSFM5Rjh0Mk1pekIrMG91U1VT?=
 =?utf-8?B?VytvOXRGWXlwRnJjOXpPUC9ZQVlHQS8vU05PWUdVMHZ2L2tpOTRrcVZiWmEz?=
 =?utf-8?B?M2ZuM0FYYWFxNlZESmpQQ1hRQzlDMDJBbWJRVE5sZ0RweExOcXdXZGoxamxL?=
 =?utf-8?B?WTQ5TTdra1hLbnpXYTJWN2dXSktlYXJWcnNUQ2xDVkVGTVRydXJtQjBHNkpU?=
 =?utf-8?B?cXYxaUJnNDJVazk3d3VTVUM2aVp2Mk12OU0wT2F0YkM1OFIwR2lpdWlLNTly?=
 =?utf-8?B?TXQ4VUZueWJoRjZZbnpRcGRiOWJIanhDbnZ5bU1wN0d2VWNUOWJ0SS9MdHY0?=
 =?utf-8?B?V21DdzEvOXM5emJYMnlXU3lna0hISDUrS0ovZzF1eGRjblNCZlRNRy9veUJn?=
 =?utf-8?B?eTFtNUtSeCtjdUluSVl2emF4bUhGVndORTVJdG1pZ094T2MzaThTdkhFRFNI?=
 =?utf-8?B?SFVhRFAyQ081ZFhEb0tqYlBaQ1dOUHRHNWdLamtaOTNTUmFHVXRmZDNoaVBt?=
 =?utf-8?B?cDdJcTVQZ3Z3VWk5VXZVak53ZDBnT2w5eXRsdWcvRmdjaW9HZ1pwQkpYaVZn?=
 =?utf-8?B?WGphUWJMTlFKeDR1MlUxZTdHU0NaYzVSa3orTGVVeVZINUlheW1hU01Eb0py?=
 =?utf-8?B?dHZjZ0hhaHNmZmtvUzdpbUQwS2lwYnJUUkF1bm5MN1JmV3JwR0Ztckk5V2pT?=
 =?utf-8?B?empoRWtQTkhZSFdBTkNyN1F1UjIrNTFlcVZPeGh2RGgzSWFNSHhvOXg4MVlh?=
 =?utf-8?B?eCtGOUltQjM0eFhOWXpYOWhFNjZpTUNyR3RIb0xLVGQ3R2ZFWnJ3Mjk1U3Vh?=
 =?utf-8?B?Zi8xUGZ6anN1ZUd6RTZzRmxvaDhMNGFTWm4vaHk3NmQ1SlNmMERNQ3pQaisv?=
 =?utf-8?B?VnlpRHRVQzZXeTZEaUU2dnZmSzY2UHVodkdDMWU5M01rT256RTYrVDU3c0Y0?=
 =?utf-8?B?WitJVzVMTE5Xd2tRNWVPM0JZc242UmdIZmkxME9RNjNjTGRWVGJKU2wzMGha?=
 =?utf-8?B?K05TK2tiWkNGVEcvZnZ1Y0R5TkQ3MTVpNTJORUp2WkVtcGFPK1hLYzNVV0hz?=
 =?utf-8?B?d0lRZ3E3dDM1OU1qVVJtN2FZeVovLzhqcUY5eGsrQWs2NjhzdFFQaE1EaE16?=
 =?utf-8?B?SDlqZlpLZzRoV1hPenFLVi9WYjNTQkUzWmowU2cxRWZGQk9GV2p3ZDRHbEI0?=
 =?utf-8?B?eW93bWhNUDRQdWVGZlFnT2J1ZFFIK1dITm56Tm1EUTdOUERZcDQzaWR6Wjd5?=
 =?utf-8?B?MWZ0ZDh3LzQrY3RjQzJ4Qm5JSllWRWtIa2dJQUFrOXhLVEFZazVxMDJBWDFw?=
 =?utf-8?B?dkVMbTJURzhRMVQ5TUh0QlkrV2RFRGtBZFhDVkFFYmttcXdLeWgvci9NNEJ2?=
 =?utf-8?Q?u9f+cQZshqPpiaVM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f28f894-cc0f-4d81-b3a2-08de807a7d23
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 21:01:10.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lo1lkd9v9wRrf6D28LphEsbXKtG2dSreA2pAuSVmGR1qn7xLKU3XJhAe4pT5aNCo0APOkATA9k7AgZbiRZ4leKOJPW1yasOulE9CHgTXWZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5879
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org,suse.com,vates.tech];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url,citrix.com:dkim,citrix.com:mid,keepachangelog.com:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 67CCC279AF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 11:21 am, Alejandro Vallejo wrote:
> While in principle it's possible to have a vendor virtualising another,
> this is fairly tricky in practice and comes with the world's supply of
> security issues.
>
> Reject any CPU policy with vendors not matching the host's.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
>  CHANGELOG.md                             |  5 +++++
>  tools/tests/cpu-policy/test-cpu-policy.c | 27 ++++++++++++++++++++++++
>  xen/arch/x86/lib/cpu-policy/policy.c     |  5 ++++-
>  3 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c191e504aba..90ba5da69e4 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,6 +23,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>       prior to the version 1.0 release, and there has been no development since
>       before then in Xen.
> +   - Domains can no longer run on a system with CPUs of a vendor different from
> +     the one they were initially launched on. This affects live migrations and
> +     save/restore workflows across mixed-vendor hosts. Cross-vendor emulation
> +     has always been unreliable, but since 2017 with the advent of speculation
> +     security it became unsustainably so.

c/s 0f1cb96e9785294f149ab3c7feb90c0eb9daeede was when it got added to Xen.

I'm certain there's a whitepaper somewhere from AMD about this, but I
can't locate it.  It was partly marketing about how you could buy AMD
hardware (which was cheaper) and live-migrate your Intel VMs without
interruption.  It would have been nice to find for posterity.

For the changelog, can I suggest this:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c191e504aba9..377711d40953 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.
+   - Cross-vendor support; guests can now only be configured as the same
+     vendor as the host CPU.  When added back in 2009, with enough trickery
+     Intel and AMD CPUs could be made to be compatible enough to live migrate
+     a guest, but the vendors have been diverging since then in ways that Xen
+     cannot compensate for, and the advent of speculative security issues has
+     put to rest any possibility of this being a viable option.
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.


which is closer to the style of the surrounding bullet points.  Also
s/domain/guest/ which is a subtle but important distinction made by the
Security Team when discussing configurations.

~Andrew

