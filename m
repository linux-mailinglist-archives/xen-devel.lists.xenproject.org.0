Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCcPMliL62lBNwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:25:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F64460C00
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293734.1571259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIOP-0007EL-1J; Fri, 24 Apr 2026 15:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293734.1571259; Fri, 24 Apr 2026 15:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIOO-0007CD-U6; Fri, 24 Apr 2026 15:24:32 +0000
Received: by outflank-mailman (input) for mailman id 1293734;
 Fri, 24 Apr 2026 15:24:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGION-0007C7-Fb
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:24:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGIOM-005vki-SX
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 17:24:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8b27-e002-0a2a0a5209dd-0a2a45078176-18
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:24:30 +0200
Received: from [52.101.57.2]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8b2d-229c-0a2a45070019-34653902d5ef-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:24:30 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7606.namprd03.prod.outlook.com (2603:10b6:8:1fb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Fri, 24 Apr
 2026 15:24:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 15:24:25 +0000
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
 b=me/RWdotcxTGx6nbrG0UwCPqcwvvv7f7An/LfTp7dQyfz6pswcobNjKRpUqS5kVrPQXNQl52K6uPnU95pZ5ZnqipW5QWGsNcsmcdvZvEAjnkTbQO+oBbZR5b0rNKViDjyHZX5Dt00N0r5Mux6348Tia6x/H1HqetJXpd6WC3FlavzSNrvIlSgkemSMST4V1zeeKOXOLQq0yS2f+B8H/l1ZNodRminOBxe+gWCQb+40M8XCVDzbhF2t1XYU27o9xMuKxruAe+ZxBVhlW1dU9OL5lVbcbihUB2Eq7WYwI2VJ2alWZMcxSNAcbgiq9290GgNXgajxAFMIBDtU0efcV98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNhK+c2VMNzcotRRllhYcuFNuh12pdskKP083Umo5d0=;
 b=C4S/JiaVysDyPl4U0cK9lqzHUMc/9iuXCpHMjmbZ7suipAo2fL0qBeJ15o3PbdlWA98mv3J4cr6ou7y9mnd4/w1IpvFpaLNfMZbkyzrdEgdrDt58MD0X6yDUlSBwn81tICwkaJoMb84r2H0fYsvLsD3UBPeoNJosgMwioPmuNq5Qzx0zKjjZ20mayXN0tyZxMGUDp3ytcKrmO/KUl4Z6suf+pwTINayPHrSBynU6kJBxdRACCTvGzfj4Nl4FkYzD+2RYn7M4WnxqoJ+K+eg8fswmFxQvAB7IC3/Gumr0RacKiRIChuT9q2sZBK20rkUFF48dsKjo1qyH66AVNy0dkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNhK+c2VMNzcotRRllhYcuFNuh12pdskKP083Umo5d0=;
 b=oo+EAoOGaVAet09lBCb9fk3Q2AVpUkjDMI8TwiwzgMnJV70EdSxsE+iv5KO4OFUfErKIfxIq3mp7IDhXHXWcVG0bhDF0HhyoqN0QnXczDG97i535fl4d7L4uT95v0p/zTvRf/YVip3i5H7vPekjVVAjOxIRIYQUg3jxZEoDjKZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 17:24:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/9] x86/mwait-idle: latch struct idle_cpu contents
Message-ID: <aeuLJTAb9SBr1VlG@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <5d12d537-7c6b-4730-b963-a4a9e13a7413@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d12d537-7c6b-4730-b963-a4a9e13a7413@suse.com>
X-ClientProxiedBy: MR1P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: f06c946f-9b88-4765-d47c-08dea21591cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r9AN2UDIAItJVAk15Ep0/dvZouz8cDbYm6v+Ui1HEXCRGoC4zowmUQKp8LRckSWNvTi8qmR6zYnkGohiydoDBgVfsMWeyLBgqhVqTwu9cTMdzSRdALqtL/5btLidQvFqyXbNxgZhQAsFQlKLhtk5T+0peg7kLVKduM9BN4GYi6hRn/WsPsOqoIqIp8/5vrtNy5h88ofWQ6bn3A+iXHk2tSXcAI8UBGBM8S3aUmhsWt/rWtCbHu9guhKJjr7GkzJhBVl2cVPUQItFSEDBPIoo0cPy2qYdH76azOIn4/6SmbBR8r27rERyNFpPn7Mtk9xlbL+Pw/T7bNp0vBbnA/AbeHepEtquTcOb02WNC69MjhaoIeExuIC39+bJuseIxExqnXTNK0eEG5cdEiuMBi7UAdZQWfeCn6p4/++UdodF3+jrfb48SfAozWo7Qy9wRnK4JDJmZmYkUspBLbX5VntfJRXpX8WDhHP3PmJv6eHoMbA0inzyYZqiqWKGBqsKNjOFVUg5GkJwkiLK5WDzhUxoOP9aOigKHjO1txnu8S6eW7MNW7GT2QWkwDSu6rNbcmVdS+VW3z3Brk3M4eFJWz2aBjqvp7k4oA0sKNuxD4z1YZS0NI1qlfJl9rBCz/6ARRIg7TLeC43kH/fbDOrbkNXd8gLRTJLZan8b2c2VaWSZkDRTANPoKG8R8yfIpSD6UeTT01KXXflAv3F/LTryzeF/iqsQWfRX9uWG1SO6wYokVhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEpjN2xoVFIzQjhWSU1MWDZDeEJrRHM2Z0ExaXlyUGdCemxOUFpieURUdFJx?=
 =?utf-8?B?ZGVKdzFaK0NhcERXNXgyRFRlcTArbTB2emptMTZxMmVMdFF1Z1pjdXZUSzJ3?=
 =?utf-8?B?WUZrS2xBaTlhN1pCUmEwYVBycThSaTNiRXh1WnJUc1dvVjZqVUJQc2FXRmVp?=
 =?utf-8?B?VCtwYkkvZElVbmdTa1NNd0YwWE1FMjROTEhUUXNuT2lSS25keWwrclczTjVO?=
 =?utf-8?B?MEZUOUJycnBQc3REZnFyU1NlejNpcFRyYkhCeHpidUlRcE5sc0VZQVdXUlBv?=
 =?utf-8?B?V0RyeHBlNndSRFErK2pETnlvRHdvbGhaYXBlMzB5VzhYb1h1QVA4cnFYQWNH?=
 =?utf-8?B?b1FSeGVFNnBLS2VYK3BqOGJkcDhKUmJkbDZhckRIdm1aVXBiL05JcldoVHp1?=
 =?utf-8?B?SVk4UmxGWjdod2dDM0s2ZmkvT1c5Rk9VZDRCRUhleEQ2NEVxVU9VOU5HZjgw?=
 =?utf-8?B?NmRNdDdMR2N3ZWJnNlhFUHMxenR4dW1ScVlqOG1UWkJmZWdzYmM2azJGcEJQ?=
 =?utf-8?B?S0I3RVFuU1FBTk52TWptVTlvaXVaU3ViT3IwZGZocGtkZ1RWMzJ5ZXNLdUU5?=
 =?utf-8?B?QWZ0N1hvaTBUMnYvL1NnbjVyTFlSbFo4VWVhYmNHYm1DK2dYM205Y09DNUJC?=
 =?utf-8?B?cVFwZDVHL3JVQWdhcnBUVlR0UUVCeUxrWWg1K1JUcFNIUnY4NXVoUlF3bHdI?=
 =?utf-8?B?YzBEKzNCQ2NONlBDOW13VjNnc2pQSDFhOGxUWXJuT0NJVjlvRjNNSVA5VHpa?=
 =?utf-8?B?byt5NWpodzNVQ0tDL0tDVnZyMXBuZGFOVzl5Q2Y2NXF6azNhUUtZU1lwYU9R?=
 =?utf-8?B?YThCNmsyVDF3VEN1dXNURkx0Tm5OZHF3SjBBV3FwbkpDbXR1SUVrOXAzYlIy?=
 =?utf-8?B?Y280ZFRvbWQyclgyTzBZWlJ3d3ZUdVlDa2d2VnBOL0V6NVJ0RldveXhXNVFQ?=
 =?utf-8?B?dW1jYkZDNHBvQlNtRHh4UjNhTDBTNEk0SlF2dW9WODJtTXY5TjNUb0t0MHU4?=
 =?utf-8?B?bGtKTzdvekFuR1R3RWNibDg5N2dBWURLWi9kQS9sYkg1OTBnZVg0MkNlUWpX?=
 =?utf-8?B?VllUVmFPeDQwVlRJMmFRT2FOL3JQRFluclg5Q21pRjQ5OGIybTdhWE9wVW1z?=
 =?utf-8?B?VUNhVWRhaTM2MTIxcXk1cCtsRnlEUVVUaDJZVEZEdURvM0oxSTdlNzBJNUQx?=
 =?utf-8?B?RS9IUHJDS1Y5aDRSSkIzckJtRzdWaTRtbkUvZnRFVnYzSkRGbWhSeFRnZmRs?=
 =?utf-8?B?VERlOHY1QnJTdmkvajAvc01nVW41MUs4RzE2Z3lxZm5ydmkrVW53aW1nSUl4?=
 =?utf-8?B?WWYrYVNuSUV5b1NqaVVwZ084REtmb0RaTVNrNkVXNk1DQWl0M1ljTDFJdyt3?=
 =?utf-8?B?cHZWbzZyTGZNL01NQ1FZV2toWCtJdGx5UC9kZkl2bVFwT0NIUUN1T1Nxc29v?=
 =?utf-8?B?bGpIUXhZODZTd01iTkUwdlgrOXZmZFordDZJRDhXRitwODBIWWZoUHlqcTNM?=
 =?utf-8?B?N2k5RnlvSEtVdThDTXFjY3NUUXRlUVB5bFBYTjhkQlVycVlLSHZxaVRLVW1K?=
 =?utf-8?B?dU1BRFR6bkJJcG04SVlpcU9CbWdzVEM2U3dDRFFRa3RBRzBvczVyNnRSeUNL?=
 =?utf-8?B?WGg5V2RVMCsyU0F6RFgxMU5aci9Kb1FMVEJLR1J4M0QzUWlOQVZITDZYNk5W?=
 =?utf-8?B?UzY1MC9URzhEdzVNN1FJbmRHVCtqUHNjbmNGVU5NNlZCb0l6czliVDJnS3hZ?=
 =?utf-8?B?UW5ZVXBDMSt5NmNpaFhBMENiL0FTb21Xb2grZTA2MjQwUitUUmtvaW5udkNR?=
 =?utf-8?B?ZHMzM3QwWTRYUHlsR1ZXRytoREh0ZFl6Sy85ajhFbjVVV0NaNGNDT1RvK2h5?=
 =?utf-8?B?cmJFNytHeWJidXpxQStGM3ZBMkw0M3hYWjlMbTNZdnZmRE9tdHFNUVpaSFY1?=
 =?utf-8?B?ZDVXRHkwVUk3QWQ3enFzS2pGRWtVaHNpK285c1Nlbm1UVXVIdlBubnFKdnpx?=
 =?utf-8?B?WGs5dEh1NmplODJTTFVSQmVrdVZpNEgzc2pYcURBM3BHOGpsNDlEV3E4MlBN?=
 =?utf-8?B?cGpDS1ZoZ1BqMk8rSjQ2YVhjOFFBSVhlTjRFbTBqYXpKeVFCTS8vOTU0R1Az?=
 =?utf-8?B?TUl2cWhXU3RXZVEvWmhUTmd2aWp5eVVjVTRRSEtaR2pFTnBaZC9oMVJyNHow?=
 =?utf-8?B?Zit5RXhnTHNReDBkVkdPVE9qVHZVbW5oTDBPRy81Mm9FSTBidXNIcFdvbmZL?=
 =?utf-8?B?VEZpeVUwYzJQZm1nWG1QM3NOMWRhY1lRUGtLUXdaZGZ3aWZLcndFZTBaM3Jy?=
 =?utf-8?B?cUFLOVFMVWVMTTYrd3dxbjlkSTVCUklXVlFxQTlGUUR1bFoxMUxndz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06c946f-9b88-4765-d47c-08dea21591cd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:24:25.9065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /B5ARbt7MB2SVoAQw+uZgX595qUh68T5mnbl/ddcM/G+SrK1HCutoQ59MslinrcDeGZdZQ5HP8rP8Ie39O4Olg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7606
X-purgate-ID: tlsNG-ef75cf/1777044270-AFF7EC48-6F0990BD/0/0
X-purgate-type: clean
X-purgate-size: 912
X-Rspamd-Queue-Id: 20F64460C00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:55:22PM +0100, Jan Beulich wrote:
> Rather than storing a pointer (and needing to keep all struct instances in
> memory post-init), and rather than (like the Linux counterpart has it)
> keeping individual variables, simply copy the respective structure
> instance. By implication, subsequent updates now need doing to the copy.

Shouldn't the aim here be to move the myriad of per-arch cpuidle_state
arrays to the init section, so we can get rid of them after boot?

Overall I wonder whether we would rather attempt to sya in-sync with
what Linux does, simply because it's then easier to pick updates fro
Linux, and less likely to introduce bugs as part of the modification
needs to adapt the Linux code into our fork.

Not saying the change is bad, just wondering whether in general we
would better try to keep the code bases as similar as feasible.

Thanks, Roger.

