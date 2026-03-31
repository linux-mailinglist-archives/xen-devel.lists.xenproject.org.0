Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCNiMLHZy2kaMAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:26:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9336AEEC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268995.1558161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7a2r-0007MJ-7s; Tue, 31 Mar 2026 14:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268995.1558161; Tue, 31 Mar 2026 14:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7a2r-0007JD-4A; Tue, 31 Mar 2026 14:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1268995;
 Tue, 31 Mar 2026 14:26:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w7a2o-0007J7-VY
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7a2o-003MXc-7S
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:26:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cbd977-5cb7-0a2a0a5109dd-0a2a4502dd1e-22
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:26:14 +0200
Received: from [40.107.130.105]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cbd985-63bb-0a2a45020019-286b8269f35f-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:26:14 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DU4PR03MB10768.eurprd03.prod.outlook.com (2603:10a6:10:586::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 14:26:12 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 14:26:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coNpm1XGlqV6/Mx2EkC2n3wpvCtPuFQrhM88y5BfZYDwwLMJaNIVUqXK4sujwpQCWjqm4NkaZHsGQKI72L0UD7N9XJI0R2g7Asb1dkLeT2plTbIYroXaecC+nZkyJci/jcLe5AzbQ4ge+zWhtgenTJ/WjfmBp/vrbm4Kf1dXBBEay/EvRAUSr7kv22HA8grCDVFeXF1j+aYdEoZ6ojcmSSyK1V+S4uS7k0bXngLQR7f7RlrMLQj5W8EgIjEJ6nhl+KWOqv414rt58miWbQkAnRYIAlmcAl2CgtKwyLD1cFDkCj3Wn7TDgsy/YVbXEJzgB+AtPL+C47OSfAA/C8Qfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auX/H+5seOgdVHUx8+R81Sw6la45rzIhpNlEQUvT/1Q=;
 b=Ub/yuJcRUXHPbEZfaY9y5k45H2izHyUoYYZi6lqe9SpHZuOwvVVbbRTWXOSSEneWbUywlh6NVd0z/J/pEe5WAz7BDbXrX4g+hTQoQT6bFCS2LdQVWnOo/Az0wluxdj0VNOUPb3ukTC3q13pUgrdB29MWQivLbPpimcurbxDK1L/pMC2gLcEavRkYu3N6d0WXZnWEiTNiqHk2AnVX9NAxAN7mxYWDTWUMlfXjyYLpFhhSiaV+5Wv6WB+b42fzicqXhw6UZQHkv1sr0eiRrAfBOu2VaL7+RqpiuKtd68fUQoTCK1lo6aZ3IMFUtwWEt5k0S7QfCFmy6ZaxgBIYbo99sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auX/H+5seOgdVHUx8+R81Sw6la45rzIhpNlEQUvT/1Q=;
 b=F3Wac0uwrfa0G77aPLg8IvyXXusPi1/u2sbpbCujbFUkE3yzFUrN5Kd7GwCQ90rTBq87ULjfnwLsrrZfxmRSrnSoc2GfWTziBo9G7PshfPlth5qivhC8F3I8Zh8b0H4KI3k0OZzpxXNKpkmtO7Dipl+ckYuk4uY0lTCrgCFnINqyyfXO+73N1JJlPqjrFD2YVfB+QdPn/6m1L1ei/rxcyobMknEEttrKq/yyOym7ispl7EPUjWGD0RFwVUHdPFzZ+JLMObMFgbvNsOKisgZIkHarRCHB9rkoUq2vqc6a5YtI+axqRMFstfPeWRcyjkgL2DPtXypWqBFSEMkGi6lnMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2a987dfe-9702-445a-a7cf-7c426f348908@epam.com>
Date: Tue, 31 Mar 2026 17:26:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
 <eeeabd5c-083f-4275-bf3c-846e01b4a5ea@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <eeeabd5c-083f-4275-bf3c-846e01b4a5ea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::9) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|DU4PR03MB10768:EE_
X-MS-Office365-Filtering-Correlation-Id: a026b31d-51e2-4539-060c-08de8f31756c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cg0bImIKqbIy4T3MNNUNnT8RhqSrpAGgrEbF2ZMamT3jEEfro+eGLLy1qlU32gB2R4YqeY0wHGYGjMPPmHJTGu2qeJCJWb2BAJevjwN8ZubYx5ApErrCDSirZBQAhGdR4SSKnHZMQa3x63mysNNQVkRUL6qyMQXi/WVTuFEFECE8Wn7pUyslViiJcHO8msLCj46cC7Nq5uqyudat5jS0YVSCvbcJDHpJBAk5PWp/jiat6TVrmmOwpnPwX8Qa/30Y54/pJnsbA6Q4OECL3uZ9/F4j7iTI0XJNYVuGZJPIarFZHFNamybB+Po5c/LAZU4lO0gZMVDjZ8ZJhEfbjV/Nw2yXQEv7rPLSSXM8vhvAEM3vyrpvPqe/1Y7u5Rz8K5GeCPIxMBzYGTyT1PLSrwRWEXfXhFYQzFsn6G4NeBwrj/eAzB2od6twNK1fCMz4nWk1BXVkiwqzV5z/EJ+ZNzeMe4QgCDk5aVr4nfNQkIykGLyqUmWz+cmLAHbRSPyAs0YRoSaNC/s4KrHK5gO5VRDOpF9vzGGWRrW+Ta1LCz3T2Gi8KDK3Q6NiMw9U7CP7IdKp2YsLjykNBsa4U/aU8DLMBxCqAbph2z2UFXddmy844NszjqoWcpJZK/PJdTmtE+LdkCZPHs5CC9O7uLB4I03W4iHarO1eoac5f9LKhDHqoE6VTTwEvUfWiCjiGuk+DquLUMjICqQjm1U8g6MbmABPTi1g//ElzcRXCRNdSm4bgOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGEwdmFSZHY3ZXk1SVB0eHBndE90b2FUWE5zcEdLTmVWSS8zVDJ0bWU2Q0U1?=
 =?utf-8?B?aHIzUDFVT3REVGhIMEROS3JVZmlYMTluaHZYQXZPa21zMWNmQXhwOHA1V3VB?=
 =?utf-8?B?RXNhY3BUTVV3eVFUR2QwNmltU1ZnNWZ1ejMzelYxdWhXY3FuNmE2QzdJU3lx?=
 =?utf-8?B?YXBjWUVzWGRWaldWazJ6ZmdGcm5vdXdVQkUxVzNZa0s1QmJ1dkViMEJKV3hK?=
 =?utf-8?B?SE50UEF4eUUwSFhJRURiVm41azZ1MGxLcis2Q0VUQ0h5cXVFUjdtVXVVeE95?=
 =?utf-8?B?dnNCaEN3TGxVeExYQmJhRk4yVmtSMnhETkVKMWhYd3JsNUdQZHNlcDAzRzdF?=
 =?utf-8?B?cjRGaVVpdVZYdmJacHZ2M1gvWGpoazBpY040dDUvTEpJVXYvYkJQMkRtYlRk?=
 =?utf-8?B?Y1NLdWhOSThiWG5mdDU5cGFGOUluQlVDa2QyYW9XcTRPc0RFSlZNeEtLUU5J?=
 =?utf-8?B?cWs5NFJLMXVpckFGM3QvS3pBNjNhRlZEWDdCZHNzNzlFN0JFT1JqbE53M3cx?=
 =?utf-8?B?TjhGYllsSTU4WmozdFQ1YkFLZ1JmK25Za1p3a2pDcjUvTVpQUzFBVHRNNm4z?=
 =?utf-8?B?NFFLcWN2aUQzTllKYmgvZjMyN3hmUGlobElNSHQvWGhOcjNSTEZGTitSVVdi?=
 =?utf-8?B?cWRiQ3ZoVEZwaGRTMjJvQjJYWTFodnFrbzllK3B5a3l5L3RYT1BIRVRLUHgw?=
 =?utf-8?B?MEh4SzVlUzJrRGVEdi9PUkJRejFHWERneFZvMWs0YWR4QzQzZFovWllNNXdG?=
 =?utf-8?B?SzE5R010UEdKSFUzdHV0RDFEUXhtNTF5TCtCdys5bFdud1FjRHNCT0lNQ2Uy?=
 =?utf-8?B?T2xYUHJwUk1QbjM4bUIrd1FzclYrS2pUSDlzSFpmMnFFK2FBTGtNaGNyS3ZG?=
 =?utf-8?B?YUVsS1NZNUtUNWVxWEpQdEpMQnp2dGxrMlp3dzloWW1hVlo0cVYzcFJnQlZn?=
 =?utf-8?B?TmtiQmNEdnFQaWNBbXhQTXNjTUVJZGhjdG4rdWxkcTlHWVJ0ZUVrS2RUM3E0?=
 =?utf-8?B?T2wxNnIzamhYenNrWWVMbHVocHppY21BYnZtS256WVB6N3VuUFlDOURPZmtu?=
 =?utf-8?B?WGx1NVlRNGc0YmZIdUNEbnZlOXJ2Y3VFaHR6ekZTaktwbFptT3pSbTN2eG8x?=
 =?utf-8?B?REE3a2toRzAyYnJKRzFscE5OVjFRUk5aSTFIbDltNXhuMEhFT21DWSttb2V0?=
 =?utf-8?B?dG00elZyeldPQVhkMThCV0ZMbDhWNnQ0ZmNYUytUZ0cvL2dkakkrWitoeDk4?=
 =?utf-8?B?Zi8vYzk1NFhuMEpvdktRVUYwaitINVkxNGpKMTI1YU5LUjNRRlRCejAvbjBE?=
 =?utf-8?B?dk1JRzJNMlhNYnVBYVFuZjQ1OHBrcDE0MWppTEUvTmpvM3NqazFaOTF1KzdT?=
 =?utf-8?B?SWxtMWszL25UdU9pTTQ2Z0dyMDZRclVmdXdnbmRXQ3VyWW04c0RscS9NYTBB?=
 =?utf-8?B?L3JwdUtaeHprN1ViWG5KQjd2TkU5R3RCU1ovbUU0aUs5V3V1T0RobGdNS3dK?=
 =?utf-8?B?dy9UaVZqSXFDSVNCamxYYmU1a0ZBZDJGeXJzcW9zY0oyYWhNNmlUYUFETlZp?=
 =?utf-8?B?ZS9DdmM0RFdnYzE1cGhUWmhaMjNPcTg2QUNBVGFOam9pcFJGWUlzaWNRU0FO?=
 =?utf-8?B?OEJRdit6VGVrTTExSERIdDBVek5iRDgzd0tKWWNxUHlOcG0xSml4NlJZKzIy?=
 =?utf-8?B?bG5sNnl1WisvdXk0NWJZRlR6ZXRuaUxvckNJd2RYdjBsMFF4Z3FwRmxGNW5x?=
 =?utf-8?B?WWIwRGozZHRJYTlCUDA2eVVYZEYwZkR6NW5pc3lWa2N2N3RlT0dsTjV6djN5?=
 =?utf-8?B?NjhhSkx0YU9lUVJ6UHVKRndQcVo4ZmhWN3JUODBmTDhidWFocTBIQ1ZZZ3d3?=
 =?utf-8?B?eE9hbmh0aDQ1S2Y4QzdXWCtWVGZwbGZWbGlWZ25ZS08vd203MFhXV1d4dGNK?=
 =?utf-8?B?RmxURHRhZkIzWTA2aGNwTi9mY08zeS9HNFZxVEdnVC9oSjdsQWx3V2d5ODg5?=
 =?utf-8?B?b0kzbUZKVFNOaFhXbkE3NkQwUTlpTDdRcWN3dXV0MVppU0w1UVRVYnd5TGFZ?=
 =?utf-8?B?aEFzT2JrUEx4SkpoV0hpWEhDSnIzQ0hIUHMzQ3VmRDBFenArY1U2Y0VKaUxB?=
 =?utf-8?B?bVVFaDhLcWxmM3J5YzZnc0tteDlXa2lRRzVTUkFiTWdCVkJFMEZWaDJLWkMw?=
 =?utf-8?B?c1A1M3FmeWNqQ3N4TmdwQStOZ3FJWHMzdUY4Z2lvR0NZdk5UeDlTUUlTODdO?=
 =?utf-8?B?U044bmM5UW1lbEVqcDAyK0x5bHYwTyszRmQzN1hzRGIzYVhsL1V6Mkhwc3Y1?=
 =?utf-8?B?bGJUMDRoUGRTTGowd05acWVsa2RQR3YrU3FZUXJkQjZZVmdUMlJkZHhxZ3ZB?=
 =?utf-8?Q?JQrOp3ju7uagmkNg=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a026b31d-51e2-4539-060c-08de8f31756c
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:26:12.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+pTIjVHKEpTFAZ58IVDYkcSf2ZLmGMxAA/t3I+NR3EqixqFpipaoLB6HpQXRR8HidpcaUayBJ5dxpP0HHT3jAWQcqLX3EJ8K+vvK8lMYzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10768
X-purgate-ID: tlsNG-720697/1774967174-4149FDB8-BEA8973B/0/0
X-purgate-type: clean
X-purgate-size: 2695
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 31E9336AEEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 31/03/2026 11:23, Jürgen Groß wrote:
> On 31.03.26 09:54, Oleksii Moisieiev wrote:
>> In RTDS, burn_budget() increments priority_level for extratime units
>> whenever cur_budget is exhausted. As priority_level is unsigned and was
>> unbounded, it could eventually overflow to 0.
>>
>> A wrapped value of 0 is the highest RTDS priority, so an extratime unit
>> could unexpectedly regain top priority and preempt units with active
>> real-time reservations, violating EDF intent.
>>
>> Fix this by saturating priority_level at RTDS_MAX_PRIORITY_LEVEL instead
>> of incrementing unconditionally. Budget refill semantics are unchanged.
>>
>> Normal behavior is unchanged. Once saturated, priority_level remains at
>> the lowest priority until the next period update resets it.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
> with one note: overflowing priority_level would require extremely long
> scheduling periods (probably at least several days), so this bug is
> more a theoretical one. Anyone configuring the rtds scheduler in such
> a way would probably deserve to experience the fallout from this bug. :-)
>
>
> Juergen
>
Hi Juergen,

Thank you for the review and R-b.

I understand that this bug is more theoretical but it still needs to be 
fixed for the certification.

--

Oleksii

>> ---
>>
>>   xen/common/sched/rt.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index 7b1f64a779..9c1027c388 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -110,6 +110,12 @@
>>    */
>>   #define RTDS_MIN_BUDGET     (MICROSECS(10))
>>   +/*
>> + * Maximum extratime demotion level. Saturating at this value avoids
>> + * unsigned wraparound back to 0 (highest scheduling priority).
>> + */
>> +#define RTDS_MAX_PRIORITY_LEVEL (~0U)
>> +
>>   /*
>>    * UPDATE_LIMIT_SHIFT: a constant used in rt_update_deadline(). 
>> When finding
>>    * the next deadline, performing addition could be faster if the 
>> difference
>> @@ -976,7 +982,9 @@ burn_budget(const struct scheduler *ops, struct 
>> rt_unit *svc, s_time_t now)
>>       {
>>           if ( has_extratime(svc) )
>>           {
>> -            svc->priority_level++;
>> +            if ( svc->priority_level < RTDS_MAX_PRIORITY_LEVEL )
>> +                svc->priority_level++;
>> +
>>               svc->cur_budget = svc->budget;
>>           }
>>           else
>

