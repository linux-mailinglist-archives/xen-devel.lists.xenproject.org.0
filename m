Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15E6FF481
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533422.830074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7Ne-0002XL-Nh; Thu, 11 May 2023 14:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533422.830074; Thu, 11 May 2023 14:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7Ne-0002V6-KK; Thu, 11 May 2023 14:34:54 +0000
Received: by outflank-mailman (input) for mailman id 533422;
 Thu, 11 May 2023 14:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px7Nd-0002UE-6d
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:34:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc673756-f008-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 16:34:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7769.eurprd04.prod.outlook.com (2603:10a6:10:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 14:34:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:34:48 +0000
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
X-Inumbo-ID: fc673756-f008-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKJWdoDEgCnkmh1XElHZreqgXaJBhQkBmAaBqD9ZpiUrSJxQ24/PiMeVLbWT95whs68Z/OvYY38JqUo8BKtM9uAPgmltajYdE87/sfPnob7HJqWtweGWZbPYoIpu3Goia67/IOssmkFA/iw8zQXuJ0ICYtNgUlOzWEmd+La1s4gAHPvdigrjzropQw4tl4k/f1k39xImsFgpLo8Iz/Nr3lCuoQZrwWsauNea9kNiXNILAtGqejqgNxmKTrEFJbwYpSU1tAsu9zRJz7bkpDYBrQnfLWWO64ZbSN7h1WFYV8CRipLc0nVP0OFBnUnLSR5dSbNks8FWbxlp2lXkEtE50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZtfQKxifRk6kmgzpC/rH44iign0BqEwrPFys6tO/Ug=;
 b=norvQMP1yau8l4GrzUlCmqyBTuqmBiYro2VVuzoxXnpZx/AbULYRRWz9oLHrIrYJfdMR6dg1nilZ3krkgIVfZZn+UoduCDmDawJmZcuuAJWuQjjMlUBA+4SpamoukHCxupbCLDij0Oe+fPbNCLWQjwuGtAE04xpG7U2sn0SWsfjqTLKOhCKLBXQdsn29cRw//KHeJ1idGvMxqWj3ltP2gIiGj1zLsrSqBfF9Rp+b3PgYnII7Rq+pAqnJdA2KOt4PYHFIyyr70TzDIWLTEaUyFxLLZbgfERgJ5qBlAAkHx7HGMIJDUQTjemwIrrw2X8wJzLPUyR+hw0msxcnNS/7ikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZtfQKxifRk6kmgzpC/rH44iign0BqEwrPFys6tO/Ug=;
 b=GmxCDxjbKfzwVcca7kMFUaqQhoQpfyTLSx5DWoz8ZR8qFFlICBNt3gD69bZIZHI/AVU3RJVtbF39z6e2L89y5mZnna0XWNVKlceiuce9Yx185eKtoHNpjRdWxaaGAuSWlvNizENhvf6hYAZEL4C/lT25uAIcpAoAw9yo2XL0Ks0PUWJZ10QGgnPVG4mxi5lJ+kFB/sTu8VfF+wCFeGhXdJvd9Zuj2Y0chLkg5xJY5/yx4wtw4x1QCNYELYlASZ2uybbLA4Apg0qIpp3+PycqgRUad4qjaF1GqESTBzig5y/DC0L1siCEfIX9NTAXD+pEvrWdU4wRfsnaKI6DB5FmIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82c8ce93-a9a7-9309-2b04-8092ca84e7d6@suse.com>
Date: Thu, 11 May 2023 16:34:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] SUPPORT.md: explicitly mention EFI (secure) boot status
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: f454d98c-6d97-4b22-d505-08db522cdf06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EF8Dh6P/frSamtkFen6aIG0SPJ53woQGIuqfB1jiS6cDa6Ns6UnXGmjmA4u6FPE1lFZ41qomx/9HYMiX48WUXJN5r3pyF72AJ6zWKYrVDRhXVtqwrvgQabid3kUP9w2tLjrObB9AHY/sVbW1U19EBKNKLm4QWzUcQrAvIkV4UrFNcIR9kyHiAASX9mt1FG7eNG0NwVqvegYceThgnzWbdjdpS1vC6A4gAHLgXktPXbd9Odw9nvRZKiKac7H/PHIVBV1Fo1/VU4CmuAu1WxM+hLiava5AE0OxOdtOozHwCUE8r82Z5AGoJgzUxrekc0oOL2Ny3eMOsMvUlqD+uhSo7fAqSUN73HwK55QiqhogNXurwuIm2bYaNVEYkC6YPlGVVy9rrI8b9n0AtM7/s5YFJnWIqbOEjECNCvLwCSsbUwXAZES5ilLVR4AkatjtssIsoxw6zfs6CQq0K8Xz5MbhR8HCf9ilH3x5263NxZnF3HMU2TZpbNYCRoVyCsCZ4SH8IGvQLWS6quaI7YUoQ/WhdYrMtRsm8blYNusZgY2fu6t4NpGFLw58R1jKd4XoOwLjxms/zCvOMicMxDtSJLnUIae7TlWwxZ2l67yy1hErWSfeuk4OIifr6VU5EwddzUFLUdaQyxZNLY2Nb9yBuglIFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(41300700001)(26005)(186003)(2906002)(4744005)(6512007)(6506007)(5660300002)(38100700002)(8936002)(31686004)(6916009)(316002)(54906003)(478600001)(83380400001)(2616005)(8676002)(36756003)(6486002)(86362001)(6666004)(66476007)(66556008)(66946007)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWRrUWxNZTlaS21EOWRyMjJPM0JpdzNLYUx5L242bHluOTkxU2kxZzJhYk9v?=
 =?utf-8?B?dFl1ZmlFUUxkbGdvVnV1YkNyMWJRNlF4MWI1L0ZWRHhxTXBKUnA2RDRyQ1B0?=
 =?utf-8?B?VkNCYmZTbGNHaDJOMkJMcGdBeEZlR3dxUStzcVRCbkJleUxtcU9ySGM3d21F?=
 =?utf-8?B?dGkzY3F2RitmVjNYM2lyNm4xbGMzSDdNZG5NVHAyRmxPREllR0oxUGJKSU85?=
 =?utf-8?B?dWk5OW1qT3diR25HeDdrWW5MUXA3NkZxT1NNcW16bE1zRXl4NnNDRVlRRTN3?=
 =?utf-8?B?Q3drMDh4bGlUbVpKSmdjRDN1VFNpMmtBYVZMU05COWo2Q0Z5djQzZVd2a29M?=
 =?utf-8?B?UTdzS050U3dNVCtRQllveUZLY3ZrNEI5bWxZSjBQMFFwUEdZYTF1bVVsNkM2?=
 =?utf-8?B?cThHZmU5RmFEYzIzc3lDOU1uSnRNdDAxeVY0TnQwZmdQMm01dVFDellZRlh0?=
 =?utf-8?B?VFJreGppRmVyY0d0RVpEM0JibXVoeVpqU1lnRXJKSXFZTE5kY0Q4NnNyTVN4?=
 =?utf-8?B?WHFIQlJLdGFSeDhSWkMxeE5LLzgrcGVPVUJNZW0wdEFwSWgrVkc1bXdONEZr?=
 =?utf-8?B?S2hNMjhCdUQwa2xySXJuSEtPNTdzZmJkL3hTeThWK3dqTGs4S1gxdHVwT21V?=
 =?utf-8?B?ZFVEb3VSSWJndE5tNkk2VUdPZEVva2JWK1VGaHd3OTlTdHptYUlzd2U5TDda?=
 =?utf-8?B?NnVuay9IL1dSWUl0d1pic2FlWGd0NTdpbTB6TThIZWhrdVZTejA4ZVBQVjFr?=
 =?utf-8?B?Z3B0RXZWc0hmUzNxS29wSjRYVXVTU29vUEN3Mm02K3NTSFhUakZBQ2gxdlRC?=
 =?utf-8?B?Q25VQlJ1dmlkMTlXbFI5UDFJOVp4K2JScU5oMnBMc2VhUTF4bkJFeWp6blQ1?=
 =?utf-8?B?RWp5eFJUNHpxMnNaSUIxcUFCTVB0Q1R3REptamRTVTlIaS9JbThFNnVxTlFU?=
 =?utf-8?B?S25HNXAzdGh5RVp6YUV0MUdJd1l3SXZvamZEQW5WQzkzWTVPR2J5clJnVXpn?=
 =?utf-8?B?VzhuOXdIT3lMSCtRdjFjRVcrQTFwS0xLTEdNMC8wT2NMNmYreUtuTXhXZ0g2?=
 =?utf-8?B?aFpxSDg5ejN6eTFXOUQwcy8vTW9CNTVaelpUaURER1ZONTBpYndBN0plbEIv?=
 =?utf-8?B?bTRtNkdYdmRVK1RBbGk5OE9PdE9VT0RRM1g1aSs1bUJ4Y3NJa0RqTXRMbDJa?=
 =?utf-8?B?UTRHbzV6c3VZaERpY0tDY1Vobm9ZOVlJdnQveHNhR3QxRTJRRDdjdnh2NHZG?=
 =?utf-8?B?RlFuNkZTRjJKZmZuQnl6VzJTZUk5NlBGVlovZ2hpemp6NlBRL3FxTDZWNENT?=
 =?utf-8?B?KytLSmEwR3U4YnRFUHBXdXNKU0E5K2xIUjA2blZHSDBLcjRMMytOYVBtWis1?=
 =?utf-8?B?V21xek5zZVJwbDVqclJhUlFKY3dpT3RiREdWZ1BFZlIxTjNrTE1KRnZCVzJS?=
 =?utf-8?B?WHo0YWh2SHlua1Z2NGU4dzR5SUVNNzBFRDJzSFplWmRzeG9IdmQrZUJneTE0?=
 =?utf-8?B?cUp5dTY5NWU4cmVVaHFlTjhrWDVNcy93RjBNYWdCU1BxMWovSHJUeExjcUJi?=
 =?utf-8?B?VVdteENXVHV1RkJGaXl6c3ppb25sUmdCRXZiK3ZwYWdEekErbWFyU1Q5OXlq?=
 =?utf-8?B?ZElIVk05bGRienA3WUEyb0ozVzhSK2huazRPVWxycHh4N0ZUZWxXcEk4NkFT?=
 =?utf-8?B?Q3ZmRHVDUnllUHFrTGdpMitkZUJQa09pUjJRQXlPVkxrYXk3T2pqdStUSXZm?=
 =?utf-8?B?Y2xtd3NYU2NwVS9YSUZURy9kdWFqWjdRdVFBdzFTeWdZNmhqNjdVK1NHNFVF?=
 =?utf-8?B?WGo4SjRMa2tMVThBTGo0SDJKbFRwaEJFcm1UMmlOSHkrVk1YckpEYU81QVlJ?=
 =?utf-8?B?VUN1MUVLQWs2U29QSjNiekJJaHNuS1N3YUpHYkFsc2pQQ1dYbFNhZmdhWlJC?=
 =?utf-8?B?dFcwUWJ6cThPbTVEWTI4UWxPMFgxZGdNaGFCRzEzRFo0OXFSaVBidkJUMUp4?=
 =?utf-8?B?aURlZWJHOEwydFI5VkhHSTdPY0pPMy9JR2tYYVdOQ3ZwWU9XMVA1b0ZaSEI4?=
 =?utf-8?B?QzJOdHNVWHRUSlVhbFZFUCtEMXFtU285ZDJtQmQvZU5NdlMvWjRqOElwVlJ4?=
 =?utf-8?Q?GFNeXMMb8l8k3wG87jqUAgzVe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f454d98c-6d97-4b22-d505-08db522cdf06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:34:47.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fnwyy5RIPi9NRhny8qQW3QUuwphZJI5e2qbvFs1dyBlCDJHYQVRm7ox9xoQoRGCojaEDMYzniOJ4BTam4KEWuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7769

While normal booting is properly supported on both x86 and Arm64, secure
boot reportedly requires quite a bit more work to be actually usable
(and providing the intended guarantees). The mere use of the shim
protocol for verifying the Dom0 kernel image isn't enough.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -63,6 +63,16 @@ For the Cortex A57 r0p0 - r1p1, see Erra
     Status, x86 PV: Supported
     Status, ARM: Experimental
 
+### Host EFI Boot
+
+    Status, x86: Supported
+    Status, Arm64: Supported
+
+### Host EFI Secure Boot
+
+    Status, x86: Experimental
+    Status, Arm64: Experimental
+
 ### x86/Intel Platform QoS Technologies
 
     Status: Tech Preview

