Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EX3GNMcMMWpbawUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:43:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1368D42B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:43:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=lw0NizRh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338797.1599849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPOX-0000ZH-01; Tue, 16 Jun 2026 08:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338797.1599849; Tue, 16 Jun 2026 08:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPOW-0000XY-Tf; Tue, 16 Jun 2026 08:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1338797;
 Tue, 16 Jun 2026 08:43:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZPOV-0000XQ-Ux
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:43:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPOV-008pfE-6m
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:43:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a310cb3-bab6-0a2a0a5309dd-0a2a4506a014-34
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:43:39 +0200
Received: from [40.93.198.37]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a310cb9-7371-0a2a45060019-285dc625cfe9-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:43:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6033.namprd03.prod.outlook.com (2603:10b6:610:bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:43:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:43:36 +0000
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
 b=ETZxOO/y/gMeOqdOI1sGi4mGUVE7cgYOmPDmIH+BC+fA1XS30Nx9ADIrpci67b8blIsz7fn95oi9STt0BIBNA4Cqj+HyWXqhf/t4QDS2tuoNK2p40aAB+dFNqcZ5sMSBQrHCTgvSWAm7UfQkFqRs4ExbmmZmBoK3ro4tQnt5o8yts8gk8CsckCE8Tkb/v4jvfGG3PX/kvp8T9nuFNrzJltu+xHtUMVsUnUVX7Yh7b7wTUgXEjatZQT/L+1loC93DUGXVhcVQQaHPnjcJ5QAgIHW6nrnTddlHdy3/hkSwPUAGPMVc9YBA2MonlsGWxZiqPWtM0FjX0KTVTV9L40YxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kGtT7L5W5sXd6OqUOVtJ02CEdxyi8TClkSbRoIMv2E=;
 b=uKjrwIE2mvXmFeVvr7k4c2zhMy7/Hnef6V03qyzM6F5dm3CXY/071+HNWtLPCINjn5Ms/4p8JYPU03oh4skL0JVQs+pis8H8/7xvYuuVH93BhqFF+a2CpKyYdpKhDWNO3RijcfHc6qfYbMM0mpdoJd44A8pTvRqKHOyJrRMUDYbiaL4ywQXQY7aIkGRLnm33HUhvd/0GXZTgQNFm963athkbA+zKSF80kfTubFjMTSRuI5HmLHSjdXXERHacaBMr6FHZfQjHjvnmUgi/lghtm47A14hPtZnzx6+5AuClKuCyX3ofu+1ANyrUViUxoHSlCPCwRn+v2x9V14JDlOztTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kGtT7L5W5sXd6OqUOVtJ02CEdxyi8TClkSbRoIMv2E=;
 b=lw0NizRhe5ThUcSNG2dSqQMFwrYoMDpmProLl2v9Rn4/jeEtJd3pDQ0NbW+UALjTXiuTaPqC+9MeYzSfQy2UTfxmdzMOpxkTXJkhNc5GF6UFZAUYox2ftp95KonbIqlZOfaMetQdxERzzNs/WtYIoEDwDC+nhXGeiNbneaUAp8I=
Date: Tue, 16 Jun 2026 10:43:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22? 3/9] domctl: rename a label
Message-ID: <ajEMtMD8ss98kG9D@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <afd71b98-7f25-48af-97ca-4f772551f73e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afd71b98-7f25-48af-97ca-4f772551f73e@suse.com>
X-ClientProxiedBy: MA3P292CA0017.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a21caf-02ef-4114-5848-08decb835ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rAammO5qfTyyw6IFbevngnpFejZ8yOQWvG7a8nMPM02TPjyakPiMfEcnPO9Z4LDAJ5ZvKNWTaQVsZNUvxe8jjHYaI0oqGUuHLSqkPtZZ/Ip+lQwz9ONxEWoQdz7ShW67ZJR9CoIuay13mOBCNBKrdMq+MmfBkEa95pg+u2Z6syUvPqhBXYKUfWScyxNcZ6pl6U0cGZ2duLIF+G8fANHxwSHhvwsyzc1XaIh8RoD+IBwoWAMquj1Jzy+JUSybG2g/1EFD2gI50phfvd6HO8ziQKw6DncQMeYHQdxlDd6C9BeyKYlLEuC/sfFZxugYAHJRQ+skXq5IbJ+pq/D9Omf+pmXeEmdCjH6w9O0y59LRcq3o+K7ODhanCg+KhRf9IVpjRLjCFguSWZZGS9JIw1atOrk6AyqgY2CSjV3loiGTMf2JxIZp1EFrfrcfmy8hn9ECoKiXrFt2a/u9ClPzZtOFgX9iROCZEJMzVBgPXimW5HgU4ozuiE1p1C7rPSds4NP2edairfNy+lv+ct74/ejnZotlcBk5qV4u1JZbLbBoGFvDXOOESelaFCyxSIlvHJCwPi59eLh/eliJWJHAU9eLIi+5jby0oE/D+4qiO2iHatmr52zwwuC0CC/cIXtsZSX0C2G4mxtj8csvomRR42+iS07AFRiyRpNCposC343SwIYvd13+HB2Ar/n267zwUjhR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3dwb1cwMnR1YW5lQkdTTkdhazkwWVJuM29PQ1NyTlZmRjdyVk9ucTlvd3cr?=
 =?utf-8?B?OFpTYW5EQjAyd25paWloWThFVlIyTXRiU3dKcURVNWdLMmxTMmRoNnppSVdS?=
 =?utf-8?B?MnU5b0RMVEZFR2VRQThVT29zaGp5cUNUdHJ1eE1sd3dyY2YrcnVjTU1ieGkv?=
 =?utf-8?B?dWFwZnRCVW52TjJrSkdGNVc2SXhPWGtwNEdYM0ljM0E3blVaS3Z0QzdzM2N6?=
 =?utf-8?B?eFJLK2lWVnZJaVg4V1Q0Z0dGVURoaklwYTVsU29jZGhxYUI0ZXVuMnZBb21q?=
 =?utf-8?B?WVpvT2U2NmRTcFFzVnl1aURpNTBkSHJsakc1WFh5a1FNK2U2MVUzSmxVR0M3?=
 =?utf-8?B?RHg2R0piVHNRa0taZkJoVk9obXhwOTRRK3FrUHBTV3g2dmxoNlNCWXVhdnhi?=
 =?utf-8?B?c3YzT0FIZU81WUFOTG03MWROR09pc3VDa3R1YUo5TjJOQzFlZ1NXQm9RRXM2?=
 =?utf-8?B?M1dFOTNlT2RaeGl1R1ZYdHp2YS9ockNoVVJrUmJUOGlHd1lIV29haVJvZVNk?=
 =?utf-8?B?RVU4NTJ5eXF4OEV1MDBHeVJEN3dBT1JCVStSRnhCWUZhcWZkRmtCN1ZzR2Zn?=
 =?utf-8?B?aVM5VGJMcUhDckdQSVFlOXlvWEhzc3Rkd0dJWEpUdnhiWVBFdlQrUEtlMm1k?=
 =?utf-8?B?U0VTK2hSMEJPVTJva25UZ2haU01sREpqa0sycldSMHNtcWJrZnpqTDJPNUhP?=
 =?utf-8?B?clQvSkZzSmdoLzdFM1UwNUIwa3U3TkFpd1NLdUZoN2dUWmJBSHVSSllsY3RM?=
 =?utf-8?B?dUhKaVd6azVZVGYvS2E1Vzh2V1NPSzBQc2cyS281K21ZRFVaTmFpc1grM01v?=
 =?utf-8?B?NG5iVENBK2tKcnBJN1ZocWhOU01BelNMclRPM2xDYk0wS3Z5aW5BQldpYmRK?=
 =?utf-8?B?dXhYbmhtdFRtcjlPcGp5MjBEd2NpMlF5QkRiWkkvSG1nUjJkeGRWVnI4S0N6?=
 =?utf-8?B?ZWNGelBsR0tQUFVEd0VoNFlJcWZzdFVpM1NPb0V5ajFwY2FQcVB2QVJJdXh6?=
 =?utf-8?B?Sm5iVzMzMWcrbnc4ZHlBUmp1Zm5tRjdJOUxscEEzU25EQmF2L3RTV1VvT0xO?=
 =?utf-8?B?U3g0bWpYQ3YwVmdwN1ZxMXVlc0pKWHNVY2tzNkdzNmRnQUJoNWlIOXVXTGUr?=
 =?utf-8?B?ZWZtVmw5VndxT1pObVIvWi9Pc3hGdVR2dm41dHBpTmhLcDd4SHRiMkdwYlhI?=
 =?utf-8?B?SmtteWRFUGNPYXY0Rjk3ZG9rVGk0Um1Db1FLR0ZJZGhKajVmRHBMVFlwU0JM?=
 =?utf-8?B?dTFKUG01M2RnSjAxRk5xWDd2R2hrclNEOEtrWE9ObVlRclJmN05VZnh5NnRo?=
 =?utf-8?B?aDcwbkdxdlVSbmVrTVJPSHVhYlVJTjJtK2FKSEdWVU4zWFRZTWJ6OXlzWE5W?=
 =?utf-8?B?RFNtZ0N3QmNyMGxBcEV3ZXJMbkJLWDhkQTBsdWJMSnNkTFZaTi9tbmI3bFRk?=
 =?utf-8?B?bUxOeW05OFJDSVdGbGMzakovTHZKdWkwQ2dTOGlVSVl2OWNvUkpmNml1VDlt?=
 =?utf-8?B?cDRIK0RSU051S0pKdTRlN2ZlMG15bE5XUzgra1BnMEpPc3lvcFNKR2hvZDc1?=
 =?utf-8?B?UHcwWkdyKzB5QTRoSk9DSUgyS3BWK2hocDNHR1NwaG1LS1A5akpuNitielZx?=
 =?utf-8?B?WkxSZDlLeFZCZzNTSDJabHlMWUZIYStaY240OHlPUCs1UWg3ai9FMlA2M1RE?=
 =?utf-8?B?cUM4bzZ0TjJXK0IzVXhudjhLNXowc3FsTWNlK2UxRi90anR0Z0U2dzBOY1BO?=
 =?utf-8?B?SDhSWURjSXpOWFE1Z1dGd2JVaXhxalRtV2tPcEpqYUFhZUdVbTJqSCtDak96?=
 =?utf-8?B?aE1WYzAxVWI1VWtjQ1FCTDVpR2FqbWd6Zy9RNm4xZy9IL2RXZlQrYURSTm0v?=
 =?utf-8?B?MVVUUzYxQzF1d3BjeWFVOWJBampZeExhZ1Npb01RaGxtNGZBVXEzSHlVemlC?=
 =?utf-8?B?UzRKUm4xcDVNWHRqdHBXTVBvNUxMcFoyQ1htV3U1a3pPSkdsRmdzVjFMWWlv?=
 =?utf-8?B?dDM5NzBaOGN1T2c0TVVSYjFHSkZlTURnZW04OWFjRXpNcDF3K3FibnVHZUdo?=
 =?utf-8?B?dXJ0cmJUcGJBZkRYSnY0T1M2cGdxWHhjU0hyYjJVYmY0cTlQR1RFUG5qK1VM?=
 =?utf-8?B?U1pSUDV3MjYrdXc2QmlHVlZ1b3ZIVGtmbGNFcEV4STdDOVF1RE9hWUErTm9S?=
 =?utf-8?B?YjU0bmJFakxVNUFEQzlubWxpdDdyako2UU9scVVFWU01V3J4S0NEaFNJUC9R?=
 =?utf-8?B?TzgyM3E3NUVZdmNZZ3pZMmowdXFjeCtiZk1xQVg3UWhlM2xiZGo3Ri9tV2xZ?=
 =?utf-8?B?RFN4TzhZZVZDSHBTQkRaTmJ6TFhPaXJtQkVCRkcxajN6T09hcndjdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a21caf-02ef-4114-5848-08decb835ad4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:43:36.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zndH3083R2zoKTsq9T71YlmgUCXiH5RfI/t2jXN1zHlxYE2IuBqqeAvEcd4VtwrHgyW/dsdyQ8QPHT4FmHKoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6033
X-purgate-ID: tlsNG-16d1c6/1781599419-87D7AD75-A4457CF9/0/0
X-purgate-type: clean
X-purgate-size: 334
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,citrix.com:email,citrix.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EF1368D42B

On Mon, Jun 15, 2026 at 04:13:01PM +0200, Jan Beulich wrote:
> There's no real domain unlocking here, it's merely RCU which is being
> "unlocked".
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

