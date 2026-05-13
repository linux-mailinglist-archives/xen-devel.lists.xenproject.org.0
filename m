Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI7HG+TTBGr0PQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 21:41:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4D53A21F
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 21:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308425.1579864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNFRo-00020G-VU; Wed, 13 May 2026 19:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308425.1579864; Wed, 13 May 2026 19:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNFRo-0001xo-SB; Wed, 13 May 2026 19:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1308425;
 Wed, 13 May 2026 19:40:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNFRn-0001xi-43
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 19:40:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNFRm-001ZkT-HH
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 21:40:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04d3a1-bab6-0a2a0a5309dd-0a2a450880d2-20
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 21:40:46 +0200
Received: from [40.107.208.16]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04d3bc-63b5-0a2a45080019-286bd01053a2-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 21:40:46 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5483.namprd03.prod.outlook.com (2603:10b6:806:c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 19:40:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 19:40:41 +0000
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
 b=iTUe2wUe1zGa7tE4IOQX/wPBhvMb6/qHOK/YBnEWlZTGVyFriUPtfIlxHDswco3mSXA8e/XVjFazlfqP4nQV9luZBmQm7Qzee7E/tTYwXHROCV8sO27xDo6EVlFlhc45iY8UH6w040ONFE2pHV378AXDSbTW/xCOOgaC3vKOfNH13HjIR+YcbylS2ahvUfxh2P1dMyAYy1d3ktEXoVTYmX7SGJV0SZTxb3EzM0ETiM3P6/iq7lGCIQ+Dxi8nbVpQ2JwNhHeDfN3zNlREbj9HMTZoQ8QUaJP7iKzJCfiVL6UBKzVOW0TK6iCZBj9V+ewx54qwtk5OVD1iB9w7guVtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1nerSrzRJqrPfkCEiNpI2oIyUx2VoHuheIDrVf7BJA=;
 b=ABvKDxx2f/x7FvTzd2KyoB0V3nbUiSIOvvm9mR1RIdlqVJjrgyaDqvSi7GvDw5yRRcz0hcco6joK1qWsr4OomhHh+V5zWlkejR3QzTWMBOrW0RtwXgP6FzJ64TbSZNscfZ/glgV2ZYU9dn5mcEBbYm2aF1RftpcBjVZHSSsOA2u5LG6xPygMqN7gVX09cQcuDmOOmaJuj3GVX3PpcPLNh6OIr8fcfvc+vgoFsYVetQf9FUm1Btwpc9AJDMfvp6b9HpaKRbBiRopyVT7sCgk7vh1a0LtCvB8HRk4ZzsLqRNIMMtD8pPBfXgyboIpQi5a1GbdRK5ipWmesIzdz27y24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1nerSrzRJqrPfkCEiNpI2oIyUx2VoHuheIDrVf7BJA=;
 b=nVmHgqlwJbE8uoUPqDPqEy8sYDR9f7wi5PDlv04nHl3+09UEJ6H/6YmLrwPZWbdnzGvgrIoOvbUGk9RhCk0wSbn15mPlaiI810MpKLhdMjvb6/dUTngKMqywDSr6MIJ8qke5NsAER+ndMJdLEo05A2J+C/PUFQlMlYY3pJ6M808=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 21:40:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 3/5] x86/vRTC: support century field
Message-ID: <agTTtrSm1tBnBGK9@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
 <agSJlh8KQ9orL6wC@macbook.local>
 <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
 <agSVa3uPHSZrszjz@macbook.local>
 <439d03f4-4ebb-4bbf-a1ea-324156bff9f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <439d03f4-4ebb-4bbf-a1ea-324156bff9f0@suse.com>
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5483:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcca115-057c-47bf-d86b-08deb127842d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|56012099003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	UwZY6Pe+MzuG+5b4VjPweWBjLzA1or2QoMudEUxZfUcq9ofcHYfBSvIYw+KgfThx1MQWd4YaoCPZKN3r98HBLnSnFNINJiVe30G0Z7+MhJBaHKPE61VHLa3x5hTbTHn+MisM+D79torHbGH8HR7zWJ3w3p5a1l5mN6cvS78mOdt0ocNkwJ+IR8/x8exyFNmT1788h6xpqs1pK0nLxCqaLdtZyl3aj+s0cZuxBlw5vx2CeAFkFmI4TT9aQ3PW/qKcgYs4Fz3Q0jVsJE/FLCHJkiWcQe76v1h9ciqV0wF0JRD96gh8yg3NmuWaVuWKSEA4xe1xaZ7KceVmlEYjl5KE0/a6sqw+Nz+mq9Qnp1WQpV+JOBHS4/bwxNf1cFI/RInvKavsd65y/H4UwhjLH4u8vIr5KdwKzc6RPtgR+bD/hbMpUYfGG3BCH73KrjLYoHX9SuQIxFmI4qeKLSHPkiuR+YAMH7M0R50cLH4XnCdpBvvqJe19Xk5qXLd+oUilLeo2sMgPwZdmLyfBzfxRPqc1thSPhrkw3VDd97AdUmCZrauU4Eqa+i+MV/CGD6gJRjAOIniCqesAYGrZNXXwBUwbd89bfi0HPLOK8U25X//7ZolBYfbDs+TREHUwtjx4neF9UWtYjPE/7HYQzrh0VrRNAYPD7U54ur46azeyDnkcUN74SyWgQ1LwGrcNDl+jh1+P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0lmdkFqakJYOEVjTTBGS3dzbHdRZDNWL0VsbVF2bklnMHpOd09DdEYzTmR1?=
 =?utf-8?B?Vk5ZTjZ4NUlDQ1BFODN4MVlIR2o3Y29CVEg0Rk45eDlBVjFTNSsyQTk3UWow?=
 =?utf-8?B?NldWeXQ4dVZWUVo2QTBjZnNmeFFpTlBDdDdRNEpES1B0VWEzV1lvemsvbk4w?=
 =?utf-8?B?VG5BWUZBdXZoUjdXOXR2Ty9vMVJNUk02dXpwcjlvRkJ1OE84Z2FaZTJxWjRq?=
 =?utf-8?B?aE5SdjBHeFN1dXNQZzBSd05QaTRrL0NxdERuZE13c0lmUUtLT1VXQWFqRERS?=
 =?utf-8?B?czcvbHEyanBPWVFSS2g2eFdmQjYyK3hBVC9la3lSeVJjWWtPV1NLZkEzTlhD?=
 =?utf-8?B?enZhbmZlc0pVZnlNYkN6Y3B3M3d6UjAzd1ErTGpwc2x4ODI2Mit0eDh1ZFpv?=
 =?utf-8?B?WjZwTGtuUHV3QlRsS2prWU90T20vZkFWSU5yN25RMVFUV0EvbHlPdkRPV0Ja?=
 =?utf-8?B?VWltN0pZcXRSVFRUYXpiNWJUQzRnQmU2RnRyNDlzT2VuZFJVVzlaV3AzaTlt?=
 =?utf-8?B?SjI0d2s2ZlZ1QU5ueVJNZmx4ZDJVZyt3bzcybHd4N3h3KzlUQm1yY1BVVGZZ?=
 =?utf-8?B?T1VVV2RGMlFsa29xRWhwVGNlNStmeWhibnUxS1h5bjlqU3ovY0FQZm9PdGg0?=
 =?utf-8?B?MVcralV1ZTNnMXEzaktuSUo1WDBrbU90UmFOeFUxMlFIZ0VLc1ZGYXhob0Vu?=
 =?utf-8?B?bWpRYXN1NG05b3JoeWVKZXdIanBRa0hwSGVHa2dmc3ZJeHlNaE9EbEpleUlZ?=
 =?utf-8?B?Q3FETmRtWnoraTJjQ0I0aTNlRVRwNUlpWERjRHNXZy9WWTFYV0ljMWgwNVRZ?=
 =?utf-8?B?b3FMcjhoMk5UdnNSYXhjb1cyVDRTQm1GTE5ZeTVWeWk1ZE5JVmpZNi95TFdw?=
 =?utf-8?B?akZBMDIyM09qaUltL0lISUY3ZGlKME1tNURhUkhjZ0c1djFIWVlvbTU2b0Np?=
 =?utf-8?B?TFpEU3ZXUmZkUlBneFlvWFRtOTRjSGlqVjVUUTI2MkJDY0xPM0x6WDU3U0dN?=
 =?utf-8?B?WHlEQmlvMUl5VURNU0lCaVhXdmh3K3ZKa0d1eWRZVEduV3B4emg5YWtMVEVP?=
 =?utf-8?B?ZGZ2ZVplcVpZYUpIb216OFFqMTVsTmJPQm92S0lkaXY0cEluSUt3VVpHblhy?=
 =?utf-8?B?d2pIZ1phY0Vmd2RTUkNwa0VwR1M4TE1ySTM1NEpvWlNzalBsMlZmMTFnTnp0?=
 =?utf-8?B?a0lRaWVmMDlqbUFuZit4bllneWo5TVEzMjdqeGRWclZTRmoxNTVNSm00Yi9y?=
 =?utf-8?B?QVA4UFlEZHVtRXVWYlVwVGJXLzJxUFNPZGtDcUswZWFnNmpxbGRIaWZzL3Nu?=
 =?utf-8?B?aXgva1dWaW4wY0c2eGpTQTd3VkxOTVhBeTNRSXpxcmVxM011bDFObkE2V204?=
 =?utf-8?B?b3FWaERRVGZ5WFEwTlRZM1lqWEx6TG5zMG4vMm04YXFxWDhmN0liRkYrU2U4?=
 =?utf-8?B?WG9sdGNVZHBvRmVDb2NCQkRqN0dUNHFhcW4xckNwdzNhdEZXZEZIZ3NURnZt?=
 =?utf-8?B?dkdreE56a0o0TGlRc2FrQ1EzV3pDTHQzNEFZYkNISkdmSVVKTmZWVnA4YVkz?=
 =?utf-8?B?NDZHMEpKVURhZHhWZnk3a0JHWkdIcmRRd3JiVWd6WTQ3WG9zVG1Qcko5N2tv?=
 =?utf-8?B?UHBma0lwTksweTd1ZWZHdlBIbk0wbkh0WndoaS84enZ4eThaUkFxNXpJc3N0?=
 =?utf-8?B?QitER2FrTnN1L0lQekZYczJpNFRMVFVmK3YyTHRWdVNNeGdncW1RVEpFOElP?=
 =?utf-8?B?bUlmMWdFc3orRWNZdTNUdmU3WERYTWNjbnF2OVFPL3llaS8yTkd6Q2cxSk9S?=
 =?utf-8?B?SVlqY2tlQ1ZFcEZET1k3S1NuV0V5Mm5ScUtEQmJ0cW4ydWJiZ0VGTnpNaXJW?=
 =?utf-8?B?RVJKU3JBRWRVSXc0N3U1ejRhZEtEL1pLdFBsZTlSRXlqUnBFQnlKTWZqTDg0?=
 =?utf-8?B?Z0dOZmphR1hMby9RTFhLMmdBZHFJc3RxMnkwWXFoUTZkcjU1eW1xU1FVSExu?=
 =?utf-8?B?cmxHMXkxRW5ZY3VkNUFxNnhKZXJEM2FCWmhJbHMvTEZsc3Zmb3VCZW4yQnR2?=
 =?utf-8?B?R09tVERTK3JiaEgrYVBQL29ZWm1rL1lVdm5sVnY4TldhRjkydTNWTUNuYjVO?=
 =?utf-8?B?aFNnbFVoVFJzT1BESnpKNDEzUE5XWnlud0x4SVNRaXhwQmtXSCtzVUNESS9h?=
 =?utf-8?B?NVdZazdnS1FxVjZaY0tQSzhYTW1CWWFacDczdEhQSW9OMmhsMTg5djJiWTNh?=
 =?utf-8?B?U3VCVytWTldnMlloNmUyQVF4Y3BIUUdNcVJWUFdnOUYrNDUveHVyeTNhZXJY?=
 =?utf-8?B?dVpUdStsQ052TWxqS0ZycUNXSHJpS1l4QTBCOWs1Sk9rSFV3L0V3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcca115-057c-47bf-d86b-08deb127842d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 19:40:41.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yhm082lgsFDUNtGAC9U27F4Ukneo0xdaxDfNRg8fPLT3YAGrr71xBdDho0LT+ymLjxh4e4cbcIDwAPG1W7IQ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5483
X-purgate-ID: tlsNG-c1860d/1778701246-BEB74DB1-CEB39F76/0/0
X-purgate-type: clean
X-purgate-size: 6119
X-Rspamd-Queue-Id: B6E4D53A21F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:24:13PM +0200, Jan Beulich wrote:
> On 13.05.2026 17:14, Roger Pau Monné wrote:
> > On Wed, May 13, 2026 at 04:58:57PM +0200, Jan Beulich wrote:
> >> On 13.05.2026 16:24, Roger Pau Monné wrote:
> >>> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
> >>>> --- a/tools/libacpi/static_tables.c
> >>>> +++ b/tools/libacpi/static_tables.c
> >>>> @@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
> >>>>  #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
> >>>>  #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
> >>>>  
> >>>> +#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */
> >>>
> >>> IMO this define (together with the RTC_CENTURY one below) need to be
> >>> in a public header so it can be consumed by both the hypervisor and
> >>> the toolstack.  Having two separate defines, one for the hypervisor,
> >>> and another for the toolstack will just create confusion.
> >>
> >> I first thought I'd do it like this, but (a) this isn't a value Xen
> >> defines (hence the comments in both places) and (b) I'm not entirely
> >> happy with such a(n) (ab)use of the public headers (yes, we have other
> >> such examples there, which I also don't really like).
> > 
> > Yeah, it's not great, but it's better than having the same value
> > defined in two different files, and having to keep them in-sync for
> > the CMOS century field to work correctly?
> 
> As the values come from the outside, they necessarily need to stay the
> way they are (and hence implicitly in sync). If we meant to announce
> another value to guests in the FADT we produce (breaking non-ACPI
> guests), we then couldn't use RTC_CENTURY in hvm/rtc.c anyway. Instead
> we'd have to track and migrate the index to use.

Hm, OK, so the value is well-known enough to be considered part of the
standard CMOS index layout, I guess that's fair enough.

> >>>> --- a/xen/arch/x86/hvm/rtc.c
> >>>> +++ b/xen/arch/x86/hvm/rtc.c
> >>>> @@ -47,6 +47,12 @@
> >>>>  #define epoch_year     1900
> >>>>  #define get_year(x)    ((x) + epoch_year)
> >>>>  
> >>>> +static inline bool is_century(unsigned int x)
> >>>> +{
> >>>> +    /* Constant below should match epoch_year above, just as BCD value. */
> >>>> +    return x >= 0x19 && (x & 0xf) < 10 && (x >> 4) < 10;
> >>>> +}
> >>>> +
> >>>>  enum rtc_mode {
> >>>>     rtc_mode_no_ack,
> >>>>     rtc_mode_strict
> >>>> @@ -482,16 +488,32 @@ static int rtc_ioport_write(void *opaque
> >>>>          data &= 0x7f;
> >>>>          s->hw.cmos_index = data;
> >>>>          spin_unlock(&s->lock);
> >>>> +        /* RTC_CENTURY always forwarded to DM. */
> >>>>          return (data < RTC_CMOS_SIZE);
> >>>>      }
> >>>>  
> >>>> -    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
> >>>> +    switch ( s->hw.cmos_index )
> >>>>      {
> >>>> +    case 0 ... RTC_CMOS_SIZE - 1:
> >>>> +        orig = s->hw.cmos_data[s->hw.cmos_index];
> >>>> +        break;
> >>>> +
> >>>> +    case RTC_CENTURY:
> >>>> +        orig = s->hw.century;
> >>>> +        if ( !is_century(orig) || !is_century(data) )
> >>>
> >>> Is a real RTC strict in such a way, ie: will it refuse to set the
> >>> century value to < 19 (0x19)?  For example QEMU seems to be way more
> >>> relaxed, and allow any century value.
> >>
> >> I can switch to rejecting merely 0. Unlike centuries in the future, it
> >> didn't look very useful to me to permit anything below 19. Please clarify
> >> which way you prefer it.
> > 
> > QEMU seems to tolerate everything, so I lean towards tolerating
> > everything that's not 0.  That's solely based on what QEMU does, which
> > I think it's likely to be (quite) widely tested.
> 
> Will do.

We need to keep 0 as the sentinel invalid value, because that's the
content of the pad field in the structure when not supported.
Otherwise we could just use 0xff (or any other invalid) BCD value.

> >>>> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
> >>>>              /* Fetch the current time and update just this field. */
> >>>>              s->current_tm = gmtime(get_localtime(d));
> >>>>              rtc_copy_date(s);
> >>>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
> >>>> +            if ( s->hw.cmos_index != RTC_CENTURY )
> >>>> +                s->hw.cmos_data[s->hw.cmos_index] = data;
> >>>> +            else
> >>>> +                s->hw.century = data;
> >>>>              rtc_set_time(s);
> >>>>          }
> >>>>          alarm_timer_update(s);
> >>>
> >>> Don't you need to adjust the tail return of rtc_ioport_write() (below
> >>> the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
> >>> the set value is also propagated to the DM, and not only the index?
> >>
> >> I don't think so. The case of us not handling RTC_CENTURY is dealt with
> >> earlier in the function. Whereas when we handle the field, we don't want
> >> to forward (like for all the other RTC fields).
> > 
> > Right, so then you also want to adjust the top part of
> > rtc_ioport_write() to not propagate the write to the 0x70 IO port when
> > data is RTC_CENTURY?  Otherwise you propagate the write to port 0x70,
> > but not the read/write to port 0x71?
> 
> I can't, as whether to forward depends on the data subsequently written.
> Propagating the index "just in case" is the only workable model that I
> can think of. And as guests can do any number of successive port 70
> writes, the DM needs to cope with this anyway.

Hm, I see, the newly written value to port 0x71 is taken into account
to decide whether to forward to the DM or not.

I wonder: would it be simpler to extend the size of the hvm_hw_rtc
structure so that Xen can detect whether the incoming VM has support
for the century field, and then avoid having to play heuristics
with the value itself?  We would know ahead of starting the guest
whether RTC_CENTURY is supposed to be handled by Xen or forwarded to
the DM, and we won't be limited to use 0 as the sentinel value for not
exposing RTC_CENTURY.

Thanks, Roger.

