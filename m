Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ahtEJX+VOmobAwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:17:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCB6B7CC6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:17:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=cjf1qS+5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344313.1603406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1vV-0007iH-Ux; Tue, 23 Jun 2026 14:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344313.1603406; Tue, 23 Jun 2026 14:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1vV-0007gt-SG; Tue, 23 Jun 2026 14:16:33 +0000
Received: by outflank-mailman (input) for mailman id 1344313;
 Tue, 23 Jun 2026 14:16:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wc1vU-0007gn-CQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 14:16:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc1vS-00AV0b-29
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:16:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3a9533-2eae-0a2a0a5409dd-0a2a4501d7de-32
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:16:30 +0200
Received: from [40.93.196.24]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3a953c-e031-0a2a45010019-285dc418ef60-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:16:29 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7852.namprd03.prod.outlook.com (2603:10b6:a03:5b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 14:16:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 14:16:25 +0000
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
 b=MpYtDc1toK6hNApqX4mcIj8cYsPdJz+OlHNH9Ya79KB/OdQ5pWXARGgGapC4/iNccBWMa1FWWLTxfovLGJWm7iPhFlr4VsmLj311rEw600C+ii9e0TvGQ2m/UxwP1hjXWI3hgrHy9uet1oP9IKAgxy62k5nIna4mH3PElYFXZ8O4JLPhT3pLofsUPYEadfLzUiDDcUpxkgQ0+/nkKJ88vs/Z/5SPTeY/U0vphZWKYNLFstN5oYFvwdJfKPJMyUb8jXJcuszLxWtcISKn03w3i+Udtup8FxnrgGxLpkvE2l5/MOiRG7tDHN3osN6AU9p9A0GE1rMYt4QiqbZrcTWm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRi9DCMsIiy3yIO/O4lNqm+ACu7ArUxeBjhIO/OnPhk=;
 b=QQNG7KznCA1/96yKJQNs7TKiD3clX93006zeVLUTZxhCPJhzdD2nd1Tywks9rRaHmKrphLG7WMSoa4Qi5jQP7XT9WhEp7olP96i1nf4Cl/a5+EJCa8jO4cq1JN8JcFQVtuXx91Y9WvucLjyFhOZhslSpPlC7RORoxIM+kBRDGqk+Y8pVGZEpa61uib5n/uwEPDHQ5Ymvj7FPF5Qb69JhMlKJedCTUHWwDODabOSbVX6y3oFj1CmjZ5U4jWMYzB0CSVXfQTlHE1qJ2d/hT4bcIJW9jaqRCkOl2+DSYAZQRDctFxxRUbNbeDvD9enSk+9P2NIJd1IPaF/GqvzOGhAylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRi9DCMsIiy3yIO/O4lNqm+ACu7ArUxeBjhIO/OnPhk=;
 b=cjf1qS+5Q96QBnDgK6tyK4qs6J9mZrvZDg/w5y4lJ0HcCC53hmd8t8nw0U27M6Y3Mu1TPt0uwFumsT5O7aLrU/ibCYauvxixr7WjJ0O68ZequcdOZp4kubaGiLgpfzMqKdTwnid+JPJZM1OLUIniUUOxSQjlYrEojV0t31ZbAjc=
Date: Tue, 23 Jun 2026 16:16:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
Message-ID: <ajqVNtt02XMUGk-X@macbook.local>
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
X-ClientProxiedBy: BN9PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:408:fb::34) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ac4d81-b50f-4f3a-c040-08ded132025a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	deilDXGaab8VIdXi7iUx2tO/SVFFWqvs3g0K7Irgn2dfcAE4AddHr8ZtNIM5+yqTsCelK4iwhpQTeImbXwpSuGd27gXKDPJRYOCHhtF+MqEETQfYi8ABgbjCvaCO2Rwp+sBEiiXndEi4NZ1Dm9zOKTN59fyKV6K0b+gsV22BnNLS0W8Afc2pAmzj/eBGxczah69pypy+2p0DZyl1peqM5C3FT878Ad9RSW+OCI4aKFwbcG7k51Vo2RaVNJjr9bv0jggAAuYyveUSQre6THX1s5Oq167PiE5tyvSriXiGd1RmSrvDCsk4XaUK2C1SUrphAdcWo6PXHaq50X9/canUlCs2RcfLWWYk41n44T5swC1+M8LlpEPdceKwi2o4pxeXiIQu3ywS8o0AWc6AmS1gMd+M5757skLxqcfy8suDOO88pyLLIKJF2x4MyXWkAtS0teasTOpakk4JASPN0lm5IAauhosxecIbGeR5nu4mTBXOQ7fFalP7HbRdyUqgaX3YKXBKGzWMhyzzHlsiW24qpLNobhHr5MdSAXO2YOyQznEXYkqJrztTJl8rue5xuD4W1k3e7bZmRCWzkyahp3XdD3WBuwca1IdTSIfvTsQModoLPxIf06lJunbdmmHwHuKQ9SVtLMtKWoRqtou9agU9Pbf/ufb/dkQoBLe0+wgLxJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFh4ZWVTejAzajVKYVZLOUJRTWtKTUhTUDdxTjRLWXREaGxFRXB6UU5VbFlp?=
 =?utf-8?B?VVZURmNzSFEzckVzUDlodnRSZDJvNWNqOHVKaHUrbVdLL0t2eWJRTE1YbC9K?=
 =?utf-8?B?QlZ6dloyT0l1RmllVGJIZHlTVUtkUExRcmEvT1NDLzZCMkthT2dqUnJXZ00y?=
 =?utf-8?B?WDEwQ3huUkpwRlEzeHFHTVN0NjM3TlpHMGNiVUxSU0Ird0VlbXJranZmUHpm?=
 =?utf-8?B?VnBDUHFwbExQOFJzaFhPbmNuTnF5MStYeVdyY0ZkMGhMcE5VZlI2MUIrWWVO?=
 =?utf-8?B?ZVc5UEJwWThqc3R0Qlp0d0htS09nL0NpK2t3dTY0Ui9UUTVSQ3VteDkwVy9J?=
 =?utf-8?B?eGQzRlRSTTNHMXkwWUhCV1VRSVlnZFo2aDBjYlhrWURQNkFLQW9aN3YvSGxL?=
 =?utf-8?B?NEJuT0pINXRKS3k5ZzgyRnUwZ0YxL1UxSnM1dFh3SzMrOVZjVllaanBJODVG?=
 =?utf-8?B?ZnhyWUxRaWwyYnUxejVyN1hXQ25vcVdQRnZSUm1LdGoxOFZ4YWhFTTBCbmt5?=
 =?utf-8?B?U1BCbkcyVnQwc0RRTE5hREZnbng3WTRzN2lhTjQvSlJ0aG9OSThtQnlmSWhr?=
 =?utf-8?B?ZUlDeDd1eEplWnZMdHNpL3RsYTVaY0QvWkhUVGh2QThYNTNLRjNyRThra2Yz?=
 =?utf-8?B?aFBqVE9aaHYzZnQyOVVIdFFCYjJwT2huN2Z6YklNVTdMb2QxOFB1YWNTaGNZ?=
 =?utf-8?B?ZGk2M3pjZHZyK01UNW1sWUliOVk0VlpyaXNNU1FGM1ZJNHZtdDh5MnhRZURl?=
 =?utf-8?B?L1BPa213T09xTWRnbFA2REJGTHVhSUJ6Q2FOYUlxS1ZsRGZkSnIxRzlDSzBt?=
 =?utf-8?B?WWdOZ05Kd0dGL0JVQmdQS21vLzR3aExUenN4czNCK3UxN0krN2ExODcyRkJU?=
 =?utf-8?B?dFl2cHZUTGtSN09zREptQTV4bXdscE5WeFJldjNrMHE5Uk9WRE90azR6dnM2?=
 =?utf-8?B?b3prQ1ZrQmtDNFd0RFpNRFZCcm4rT1NEN0YxMTV4ams5YkpOY1pJK1h0T2dh?=
 =?utf-8?B?RmVnTW5icXAyS3cvNW5oQ01sWHhIWUFxSFcxUWdFRVoyVGVOOENVaGxaMWxw?=
 =?utf-8?B?aHk2MmVsT0tYNTJLY0lpU3V1dWhqTWs2aFNFbW5INE9rV3hvOG9zMThvYXJr?=
 =?utf-8?B?Y3FveDR3NE14QS9GSmJUU3JmMFFIenNFU2xpNUNCNmJqWVJRRFJEem02YnhF?=
 =?utf-8?B?WW05L3RVQVViR3M5Q202YWx1UU9IYjBiaC9hRy9RVGJOTzZJbG1jcUtyZVE3?=
 =?utf-8?B?NERWclpPdDFRckFGMUZKSkhRZWtZcEgwVTdYS2pPVW81cDVkeXcvZi8rdHJC?=
 =?utf-8?B?WUhua1ZWUEpmTDRaWEVZVzlTRjB1TzNLbzV5RG1PcS9nSURPNjloM3ZFUjZJ?=
 =?utf-8?B?RmpuelQveDF0RXFHckgxVHgzN3FvV1ZVdEgxYTZ3UGZ5R0RpQnR2RDFLMHRl?=
 =?utf-8?B?TUwyZXZ1REcveDFqU0xuTzFvcnIrbUU2YzBHRlUvNmF0ZGpDOEFjc0N1Njk2?=
 =?utf-8?B?T2J5cm1VUmVpSXFwNHNFaWtaazRadEswN1ZLS0RnSlg2Snl0Um9iM1puSG4w?=
 =?utf-8?B?SXprbVF4MkFNUnVUbThvcXlwdmIyQml2ditJYWxGMWRMOVNUNzB3YkNxZ2Vm?=
 =?utf-8?B?MDlQaEtBUnVvcXFDMEZDYmZJRjhZTG1ybkRGZ0tlVjExU1NxVXlpa2VLOVo0?=
 =?utf-8?B?WXIzUUU0aWN5ODF2UHlRaWRUYnBIZUtScW1IY2J1Z0duU3NXOXpHcWVZUGFh?=
 =?utf-8?B?OFdZU2R4TFlSdFJaYWx2ZXAxMkQ5aE1CN24zSW40WTlya0M1cGpJNDFSbzV2?=
 =?utf-8?B?S1h3aklVUG00NU1nODcyQTBpaU9QcTZwa0dmNlZXVnpKVUthSXFsMFA5SEpw?=
 =?utf-8?B?c0dqbFBLR1hVQS9RU2pSZDlwOVZpZm1ZdjNDWGg2WncxWGJHVWFjUTQ5OFRz?=
 =?utf-8?B?dG9LVUF0MGoxb0JFQi8rUTJXRTR3QWkwQ0NQeThrQ3hqeWlma0F5cW52dDJC?=
 =?utf-8?B?K2IxNGFEc0pEVVFxYVlCMStmcWlSK0M2YVVBRnFVMFNFSmFndGtDQXlPNUds?=
 =?utf-8?B?ZWRYeG9Fb0dLK08vaDUzOFYvZk4zdGhISDRvSEdxWlkraGQ5VVQ0dDZxaFg2?=
 =?utf-8?B?T21DaVZhaUlTMnZQdkJCK1EwZ3pDcE54SjAwdUdLdkk1TlZ5MmJzUU9YbExO?=
 =?utf-8?B?d0l1UURqZU16MkxzV2p5T2hKTVdDbmN4K1dvWmlwSkxrcEZ0OFhCUng4Sjdy?=
 =?utf-8?B?L0VScDRaOEljaW05dDNxMGZ6ZzdGVHROY29LbzhCY3p2bk1tMmNBZmMrQnJQ?=
 =?utf-8?B?eVBXTExsWUpoa3U1WUNleWRxamNjaWJJOWlNSlFHdWVuYzZUUlE1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ac4d81-b50f-4f3a-c040-08ded132025a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:16:25.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfBSndf4wv1LY3HHH3KrAxA/k8Q+wcyh882qoyD8K2VWVmSFYaKe7fR29Uh1dgR1mtsH/adJLpJZlIXtTmElXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7852
X-purgate-ID: tlsNG-d62444/1782224189-4A5AFE30-FDF8A64E/0/0
X-purgate-type: clean
X-purgate-size: 4810
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDDCB6B7CC6

On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
> On 23.06.2026 12:31, Roger Pau Monne wrote:
> > The current logic in ns16550_interrupt() will loop until the device sets
> > the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
> > control of the serial-over-lan emulated UART seems to be broken, as it
> > doesn't set the NOINT bit consistently.  The Transmitter Holding Register
> > Empty in LSR also seems to not be properly signaled, as even with it set
> > writes to the transmit register take ~6ms.  This leads to the watchdog
> > triggering very easily on such system.
> > 
> > Introduce an upper bound on the execution time of ns16550_interrupt(), this
> > is currently set as 4x the polling interval, which is calculated as the
> > time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
> > Once the timeout triggers the interrupt is disabled and the uart is
> > switched to polling mode.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > There's a possible alternative approach to solve this by moving the actual
> > interrupt processing to a softirq tasklet and disabling the interrupt
> > source until the processing is done, likely unifying the logic with the
> > timer task.  However that's a bigger change, and too risky for 4.22 at this
> > point.
> 
> +1
> 
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -62,6 +62,7 @@ static struct ns16550 {
> >  #endif
> >      unsigned int timeout_ms;
> >      bool intr_works;
> > +    bool force_polling;
> >      bool dw_usr_bsy;
> >  #ifdef NS16550_PCI
> >      /* PCI card parameters. */
> > @@ -190,12 +191,41 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
> >  {
> >      struct serial_port *port = dev_id;
> >      struct ns16550 *uart = port->uart;
> > +    /* Set quite arbitrarily as 4x the time to drain the TX or fill RX FIFOs. */
> 
> Nit: I'd drop the latter of the two "the".
> 
> > +    const s_time_t timeout = NOW() + min(MILLISECS(uart->timeout_ms * 4),
> > +                                         MILLISECS(5));
> 
> MILLISECS(min(uart->timeout_ms * 4, 5U)) ?

Bah, yes, sorry, I've added the min() later and clearly didn't apply
much brainpower about it's position.

> 
> > +    if ( uart->force_polling )
> > +        return;
> 
> As the IRQ was disabled, is this even possible? I.e. should this be some
> kind of assertion or alike?

Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
here.

> >      uart->intr_works = 1;
> >  
> >      while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
> >      {
> >          u8 lsr = ns_read_reg(uart, UART_LSR);
> > +        s_time_t now = NOW();
> > +
> > +        /* Break out of the loop if spending too much time. */
> > +        if ( now > timeout )
> > +        {
> > +            struct irq_desc *desc = irq_to_desc(irq);
> > +
> > +            /* Disable the interrupt source - it's never shared. */
> > +            spin_lock_irq(&desc->lock);
> 
> This needs to be spin_lock_irqsave() - we may not rely on IRQs being on
> when we make it here. However, ...

I was relying on do_IRQ() unconditionally enabling IRQs before calling
the handler, but it's safer to use the _irqsave() variant.

> > +            desc->status |= IRQ_DISABLED;
> > +            if ( desc->handler->disable )
> > +                desc->handler->disable(desc);
> > +            spin_unlock_irq(&desc->lock);
> 
> ... all of this open-coding is quite bad anyway. We should probably add
> a helper for this in IRQ handling code.

Can add, no problem.

> > +            /* Disable interrupt generation on the device and arm the timer. */
> > +            uart->force_polling = true;
> > +            ns_write_reg(uart, UART_IER, 0);
> > +            set_timer(&uart->timer, now + MILLISECS(uart->timeout_ms));
> > +            printk(XENLOG_WARNING
> > +                   "uart interrupt taking too long, switched to polling\n");
> 
> Probably it is indeed best to keep this simple, but: A single instance of
> this taking e.g. just over 5ms (perhaps with a low baud rate) may not be
> indicative of an actual issue.

It's all fiddly, yes, I could add a counter and maybe only disable if
we have a certain amount of executions of ns16550_interrupt()
exceeding the timeout, yet I wanted to keep this simple.

> To alleviate this as least some, perhaps
> besides capping at 5ms we should also make sure that the timeout used isn't
> below ->timeout_ms?

OK, let me see what I can do.

Thanks, Roger.

