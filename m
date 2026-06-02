Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDWfBXyBHmo3kAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:08:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54D6295DA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324486.1590030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJEk-00041E-Vp; Tue, 02 Jun 2026 07:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324486.1590030; Tue, 02 Jun 2026 07:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJEk-0003z6-S0; Tue, 02 Jun 2026 07:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1324486;
 Tue, 02 Jun 2026 07:08:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUJEi-0003z0-EK
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:08:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUJEh-00Arcs-NZ
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:08:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e816b-bab6-0a2a0a5309dd-0a2a450ce46a-2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:08:27 +0200
Received: from [52.101.62.33]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e8169-62f1-0a2a450c0019-34653e21ee88-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:08:27 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6522.namprd03.prod.outlook.com (2603:10b6:303:125::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Tue, 2 Jun 2026
 07:08:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 07:08:22 +0000
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
 b=NBvWprghvrz6ZdsnCoEh+x9fHFuAmbtpvvZtVPSPnuYKczpq/w0TvIq5jAYd8dW4bAtNMN6UnwAuZkvlSN+h1MS9uhJAiSODwCKaR2D2WqqKlrarQ3Gaxc+JIwv7scA+eWOEwUA5uEjJGUfIZEacyeOT+tEShDAlzIa+oyTPX1WPND99CrVT19srZk1oKCtrDOrC3tFb8eM5WGK0eQ5IpJptcG+VQBSPUFp+4+R36Z1h8Ae6aBA97dqSWmQIgbMMptXwcrQCPjPw1UZCenpEmvvC2F07pjJjddvId21xBGQijcNNo3ZYy46LDMQFv5g2ty5Vtw/MWj81NAlP7mKDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az2Mydg8Ou0LqfHDi3zI+N2hh0CsCH1l8vu/gmMRCtI=;
 b=cms5tElIvlMulMxFjzMeuurFRmJ2ibS0Q/18UX4Tp/XliSy88FYkQf7DC2Db+gr8nDyNAc6tsGLPL/+RMVxtIXAVkoK/0EjZWCdJKI7MuzLqH2kSmbh7IYMsJdfdqOfry+i2zBMOAEuNaEsF5jCm8c/oGSE6DItRLx6kQnj6wYbVcV00a9dG2iJBupyO04nT0uzEO3ACIr+9/AwMT06NJLToOhJsZFLxL8fxtuH8Lx3vzCC63FsYfbsLn35ywHe9dll0FcOKrbfLTJfU6g2z7AjZHLd0dkYhAyfJ4FHyGCkUShJJ4+WQjMIDW7l+73+YC+MuT5MDeFr1WOhUcJQttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Az2Mydg8Ou0LqfHDi3zI+N2hh0CsCH1l8vu/gmMRCtI=;
 b=K/UbJXCVNoeHMRQdjgtGoCudvhf4hsHCKr94ePdLqVNvPfOgl+xVbfJNevNx2y2ZcSC9vfoaqWOUuGMfOBohAdprltfFQL/npNhWvIFntIVohmKDCbeRvp5o3/HtNJURqwJgfwWbIcAxEHo52tLFPL4pc6C7UzY3IXcBFK+AeBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 Jun 2026 09:08:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v4 1/2] ns16550: add support for WCH CH382 serial adapters
Message-ID: <ah6BY8gNUlPZ8PQp@macbook.local>
References: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
 <20260602053421.773149-2-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602053421.773149-2-Zhao.Jiaqing@amd.com>
X-ClientProxiedBy: BN9PR03CA0577.namprd03.prod.outlook.com
 (2603:10b6:408:10d::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ccc524-0246-4c93-6c4e-08dec075bb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	sM2NXBYw94LxqZ12kceOWoHKobIV/79E+PD4Ct+6b3/rPpuwPhJ2VudMpYfV3zSRd/0cdXKwN5kmgcvcCZzFRLKjUNaRfsP+9JBZrDzCugO7ELheWPBX47bftuiBz3MCjIgHwkc88A3UEBG6tiHZQxAHyWcdMBvFtdGJavHrDRoXqCDpfMVlDYC3LUNNlFSyqYZE/F6NwrS/sweUrvk/+zMDd6PwbiXR+NgToouRiL9Lz3xY7ngOMXqptc8+IWEifDHoDmu4dEBNoRV05GitvfmKlsD03+d5bu6kkDI3dTblP6M72OT8mH4iBT+JzwbEO0d5YIy7dWFHuGlvDd6RIvubz1Avj0XcnvagW1i5i+5Dksahpx+nCBp4MppXZCbqZQh3AYAruXpAlSo6WkEG0bIeBWQ5U16tsFxtaaxDASOWuk4MvNPqMLeVJOrls2NplivrjTdHdnVsY/Tf5sABv/A0YhhPh2qAwTWq6JvJ9vgqVsdbfWatkBG7PmY0sLsMJWgtSWIY7ku925r/urdjJ73P2BwYFVSGfTMSgp3Y7utIRwgB6QezhN98mYeVGGth7GV2/2r2FgyMGDgWZfjuOuC93HLaOqdB53H76fWVVNX2yNtbmh87SSaN5zwIIZ6nkguZ3fXvUXrvGOTR1KoTY6rfIC5dw0cJsqxN0xxzD9gOtVc+eAB6HW01f/UtHV+0/JTD2ejKyHTuiVeOPi4uug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmdrQmhwZmRocENFZFVhTEhRQXF1blNHdWdMOEovUjFkK3FaMGZyYWZvQWp4?=
 =?utf-8?B?bHdNem9YSkJzaEpIdjhvd05ocmg4UnNpZ2FueFFrZzM4S1ZPU2xlcmQvVTRE?=
 =?utf-8?B?eC82OFhtMnRPZlJIR3U4cHc5K0xIcXp5YVVLdlpDaDNRK1RMZS91RXVydlJl?=
 =?utf-8?B?ZW55aHJhWTBxZDJGUVZ5NS9SMUxJUnRaazM0bGRSeG4rN3RoaUM2dktleHgr?=
 =?utf-8?B?VU9LK1hWd2J3VGl3UFp3dmRRZTFMVmpnRXZIYTZXejRCdUhZMDY2b3Nod1Ft?=
 =?utf-8?B?S1p3bjNISnRDVXNhRkVUdVI4QlZDZUpVVVo5TUpnQktKSHE4d09RN0tia1p3?=
 =?utf-8?B?L1ZKTXB0UUMwUTdaanVaZXdTZDNjUVhiWWQ0VnVHYjZlYk5BOVUwTCtYS3Qv?=
 =?utf-8?B?RDRzWDlLcXFyUTNveUllZ3k0MUNDOEdNdVhjYmJTOUpRZjdBWGRnYk1zdWQv?=
 =?utf-8?B?bG5HQ0NKc0x5c0VVZjJVaXRkakYreFFDeE96MWE5VnpOeEhYRWVWT3RVSmYz?=
 =?utf-8?B?bXZQcW1GOWlGNlpibC92OHoyaTlPNndiRVNVZEZXcHdrd2h3QTBwT2pqeHho?=
 =?utf-8?B?bWt2bWpRYk9uVXNHZExYVitUNnhNWWxsMjJlcW81UktSWEhyZHQzZ0F6ZXJz?=
 =?utf-8?B?ejJveGJEZEJ2ZDk5WnptZnYrdEhKUCtzNDNuSzAyV1UzeFIrVjIxb2t5cnpa?=
 =?utf-8?B?dFc0WE5wc0JtK0V1N2tpZFJiWjJ6b0djalVqUzJVQUhtWWp5OStldzhxRHlW?=
 =?utf-8?B?cXlZbWxlc0Q3VjBLcldZalhWMDF4UC90TXA2QVJSc28xUU9JRzdpb3B1cjY4?=
 =?utf-8?B?UEw1d2VrZEFsUlphUXd0SXBZa1RrWkp6ME1OTkZwTVVhZFhLZkoraHA0Y3ho?=
 =?utf-8?B?TTVqWGozam8weEZWSFN2b0E1MGJ3NG1RUVBPZjRqVldhdnRSQnZwTlpFSnVM?=
 =?utf-8?B?aThQTUFkSzE3SXpUTXlwYm5FSlJUSXlLM1VQMjIxWjlGN0RJMjlpbmozVis4?=
 =?utf-8?B?L1lqYm1DQWRnYXBhcElFeG93QUw2T25wOUNSRmdFdGFPYkRIdUFXTzRTT1Ft?=
 =?utf-8?B?WHlIcmd1aEtPc3RtUUgzcGEwRHhaRFpBQTQ2eElNdzgyNFJSUVowcXRYWUx4?=
 =?utf-8?B?WmdNOU5RWmw5TmRseTdzY3krOS9tYXc4QmZRNWRXOVIxSzBTajRSUzBBV3o4?=
 =?utf-8?B?cjlkTFRGN3NGWEtpai9CRTR5Rzl6ci9EeVhYeUlpK2FHbGcycVU5d1dhbExO?=
 =?utf-8?B?NEhCNE9Fb25Ddm81aEZiYWluTnFyNCsyZllnb0tyTUt1amVpNkt4ODVXckI3?=
 =?utf-8?B?UkhWWTVaWWFTbCtGTnlaYytQbmplSHBVRE01U0FOT1M3dDdKdnRRY3J0NmpY?=
 =?utf-8?B?MHlueGJkdGZLMDFzL1ZycmFQUENNWkFTMXVzbDNaUStiUlNnMHJUeEdaaklu?=
 =?utf-8?B?R3A1VEFUeWxCOEZDcGVmTVhpck8wOUhmSDlkTFhCTlQxNkFLbXBYWnp1d0dt?=
 =?utf-8?B?b1Nmb3k4c2R1Tk1QeFVVd2pmUFNQSmw3SUFBTVdXS0F0TW12Q0w4L1VZVy8z?=
 =?utf-8?B?bU1iOWFHa08wODMzcm1SdTFGOFFNaTZqTHFmR1BMUkc3WkhMVUhjeGFFU2E5?=
 =?utf-8?B?eE5Td21KbmhWYi9INWwzR01udFlsM3BrdW4xaGZ0YjQxVm5DamJ1OFBqSlJN?=
 =?utf-8?B?cHZOenVJd3h5MytsTk9yZjVVYXZXRk9RRytWVmZGcVY2elRXTzRJUDFuS0Rl?=
 =?utf-8?B?Y24yb1RqVDMxKzBpVzVSV3pTSVRhKzlEYzRJL1lzRWk4Tzl6eXl4aXN6dkUw?=
 =?utf-8?B?Vjd4QXgzYUxXTFVKTW9sQnptTERtQ1I5L21HbXlsVDhQdTJFcFFOQ1JnNDZl?=
 =?utf-8?B?b044d2tVcjgrLzFQOUlEWW5qVmErQjdLV2V1YTVaeDcrTSs3V1MxdEh2Skx0?=
 =?utf-8?B?QU4rM1UwWFdyL0M5QUVXVlFhNjJVTFJnMk84YnN1VkxnMFpVYWx6SDlaakdW?=
 =?utf-8?B?SjZCWHFPSzNXc2QzZ1Rnb0pMNFNEVlpVdzhWdHlkOFlicWNiWGhsR0xBa09t?=
 =?utf-8?B?TnBXUVZpVSthUHVlV0svR2FOdFMyb0VEQ3l4VkJPc0pEVlRzbGZZOUo2b3FI?=
 =?utf-8?B?dGcrbncrMzNMM1d4UHhVQkl5OHlIVG9meXp4WFlLSi83ZERTeXhkK0tyazlm?=
 =?utf-8?B?MlhGUVVXOEw3TVNQZXZ6SVZSZE5COU5seHlwOUlGUjVPRzM5bWl6aWdPbnpF?=
 =?utf-8?B?eXdGWXErWktCcGVFUEpObXFtUnY0WWVFM0RMRG00KzA1TGkvQTJDbHdsdjFQ?=
 =?utf-8?B?bWhGQkI5MTgzVTJKbjZrODdtVWpQN0lSNmUvT0cxb3V3Z3E5OWcrdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ccc524-0246-4c93-6c4e-08dec075bb6d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:08:22.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAphGR3JiwGMo2sWwQ4zzCBrx8ahcp4PFxpIbgq79Zc2BAweHpN1Zma+ZH6WWKRKI24QhlnumrgqJvX4VqhrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6522
X-purgate-ID: tlsNG-d25034/1780384107-E377ECF5-C82FA947/0/0
X-purgate-type: clean
X-purgate-size: 1785
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,macbook.local:mid,wch-ic.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E54D6295DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jun 02, 2026 at 01:34:20PM +0800, Jiaqing Zhao wrote:
> Add support for the WCH (Nanjing Qinheng Microelectronics Co., Ltd.)
> CH382 PCIe dual port serial adapter. The CH382 is available in two
> variants:
>  - CH382 2S   [1c00:3253]: 2 serial ports
>  - CH382 2S1P [1c00:3250]: 2 serial ports + 1 parallel port
> 
> This chip uses IO BAR0, base baud rate 115200, ports starting at offset
> 0xc0 and spaced 8 bytes apart, and a 256-byte FIFO. [1]
> 
> [1] https://www.wch-ic.com/downloads/CH382DS1_PDF.html
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/drivers/char/ns16550.c | 23 +++++++++++++++++++++++
>  xen/include/xen/pci_ids.h  |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 878da27f2e..cf10a06a3d 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -95,6 +95,7 @@ struct ns16550_config {
>          param_exar_xr17v354,
>          param_exar_xr17v358,
>          param_intel_lpss,
> +        param_wch_ch382,
>      } param;
>  };
>  
> @@ -861,6 +862,16 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .mmio = 1,
>          .max_ports = 1,
>      },
> +    [param_wch_ch382] = {
> +        .base_baud = 115200,
> +        .first_offset = 0xc0,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 256,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,

.bar0 field is a boolean, and hence this should be "true", not "1".

The rest LGTM:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

