Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9614C716A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 17:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280680.478714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOicy-0007aY-9C; Mon, 28 Feb 2022 16:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280680.478714; Mon, 28 Feb 2022 16:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOicy-0007YN-5u; Mon, 28 Feb 2022 16:12:00 +0000
Received: by outflank-mailman (input) for mailman id 280680;
 Mon, 28 Feb 2022 16:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOicx-0007YH-0u
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 16:11:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26c9b2e7-98b1-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 17:11:57 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-3EmJ1TVfPHmw579lCpig-g-1; Mon, 28 Feb 2022 17:11:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5013.eurprd04.prod.outlook.com (2603:10a6:20b:3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 16:11:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 16:11:53 +0000
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
X-Inumbo-ID: 26c9b2e7-98b1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646064716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=usePhEfemX5hy7zllvdwphaC1o+xYGJFNEu6k5DquK4=;
	b=ms5R7eRqQbF5s4LaMeMjjhl6G8pNPW4Cla87ED5P5ssKShkqnITtM99zsASLsR+QBDYXK2
	AG7e22SyBal/tybZoK4lw8IEkwFYFFeXqCQAk/hvblpIusUfudwUACy2hUCeOH5qrJaI1q
	QpgUym3KQYsVK3LJ5aqYY15955Kbqts=
X-MC-Unique: 3EmJ1TVfPHmw579lCpig-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGGTb4WyNt1LVViqmFMuN3VPf25AB/13s3qIpoOKqEAQawqkRC6XO+0Rd6BI2XIL2VwuaKp3y2bBeozqZNx40169Q67hQg3twJHODcXA6rjcP8lUGVR/7/ozKCJwRmBb0QGvAuFC2FdM67ZKFUsDcPKjaYUbtcxdeaTTcFec6hB4aKMF1bsRIqnqCpQoDwmQ0VHjgFKlHH29L0FamoIuK/HU9RjLoLwiN3ITShRViXE0M+6LgnNeAtnYP2lODLFuwrPK/D6WDGP8Lh8HThWNzLmOlPt7o7OiLE70whqUwkVv3mO600xpZnxInOZb1utp6qZEdGrrD/UAHoNxWsEROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usePhEfemX5hy7zllvdwphaC1o+xYGJFNEu6k5DquK4=;
 b=T+hxd5k/H6Ylp+vdXw13J6PDyZb9ew+Il7afiKBWKCwJWIxLzEVQywEhDgrRUdBjnrprRLirYXBTTPuJ3tQS7jvSRsbVX2EWtHaNCO6flJ/r304zVViWTlkogx+z3PDs8yrIFy6m0IAEeZ4cxVXqJz6gIiUPOBJndfBoRfhXU8i/jafhEpCkvLlvtgnQUZ3y/5KevWhc0Yuc3xAFziH3BFgUNGUlDBJfpnCManalN/uhsiXAv9zc3HLeq5fUkk8c720HfUr0W1KFZ6vBFwxmFPBhiMn4a7n8KcgJ9y6WFohTyumj08iECsUNZtR2mndbadGGPp9ZUyHXFsu+7DmRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff363631-bf5c-83a8-ccc4-15ddd1eb1d3c@suse.com>
Date: Mon, 28 Feb 2022 17:11:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: export potentially overridden tool chain components
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0046.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbac6bf2-6acb-4c42-85d1-08d9fad5090d
X-MS-TrafficTypeDiagnostic: AM6PR04MB5013:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5013E4D4FF5C42055B2D7569B3019@AM6PR04MB5013.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W08jzayvsGHQEl2cFmN2RZ6zYjufmIr3JGqNNchEB5NkEUTTlfzFGeRnmsrSGRLHIx86TIlqYmHpctD7KExWY99KZtLtIaVbabVhs0hFdfka4qkZBPo9M57nhQpGQTXv2Bqmmm1U4xGeyyROUonG5l2u0Dp8xlWu+9aqvwpPiyzU2htTmT2rYjqpugf0uMvL1h+7/P+Eub7OPaKoX24SbTsXl2AXu7r7J/2iinoeg7kl8bR9gW8o93RbMyLGPAiFkIglMpaXAnhlgETiBdBGcwv32AZ7AFMervrXGY5XzAuE7YngOIkbTGE+0FjXG6B4kToXQHIMgltXq0bOTQrkJ5iuVTKcJy6wVFSomz1N145DnSJ8aXIyimHxJ6dTUYt17vTxU5Y0xE27a45lmu25i3nqR+UPC+XRWdQ7X3W70zVx0yCMyab1XvZuBllKBL1lKEqfOUYboapF3wAOkhEBQJy83E6mBIo8LT1lbqfBKfM2lOwdWsl+4Ig3C2sLE3SUSdO+kx3xxxwsq8me7191RLfAvELvXbhNLxoyBjxlpGGRVgBkaVVtqci2z/FphT7qe/Tmuwg6MsySruBzhLICR/6ZditWh9lzsb3a82HYBv5/0o1fTYtFXBtuXT+gc+cFtb2pa/XK/xtavsJulcfjTh8FKA16HRJTAsR0rKlEh+WRj+iGs4X01U+0ouLRTtDmDIxa/4uXt3PPpfYoUrxZm8wv7ZXUksg+vwRwYMebfvw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6512007)(6506007)(36756003)(6486002)(508600001)(8676002)(31696002)(2906002)(5660300002)(66556008)(66476007)(83380400001)(4744005)(8936002)(31686004)(66946007)(38100700002)(186003)(54906003)(26005)(2616005)(6916009)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1B0Rmd0WDYxNmlXV1BOaE5jcTV6WGJRbi9kazYyRnM0bHZIczlJazlwVVZG?=
 =?utf-8?B?Mm9KTmxObDR4RlhOclA0Z0w5R05OdjFEMXJZbGdaeTZlNWIzV3BSL1BXLy8v?=
 =?utf-8?B?eFRwMTN3Vmdtdm1HUS8ra2JZZGY3S085aFliZ2hvV1NEb3lFUThtenh3VUQ0?=
 =?utf-8?B?aW5oSm9MTEphdXNoUERHSFJaRFFmRnlzbitjbFFYV0VVVnI3dys0M0E1Z0JV?=
 =?utf-8?B?TEdSMjh6blBRMzJLdzg5V3hqejBBaFJBblBiRXUwSjg1RUpTU0wrVEdVNms5?=
 =?utf-8?B?Rm9xTWxGQlZaMWFTY1pnZFFsQXNvaWZ1SThFZVZiZWZQMXdGWXpoOE8welNu?=
 =?utf-8?B?SG1sRGYvNUVlNlBaUTZIWHhQNXlKb1FHajJvRXNrS2JmS01nelZqa3l5bndW?=
 =?utf-8?B?VTVTWEIyU29BbkY4RHBwZFcyUyt3cEhTY1M5c2s3V0R4OXhxSFR3SnNqSERj?=
 =?utf-8?B?ZG53RlkybHl3Sk5QWWEzNzBlWTJ5K3dvVS95ZVR2eUN5bURWQVRWMDBTY1lQ?=
 =?utf-8?B?enBiNGxqNmdNNW50QmZFMHFpbE1OcXBlYVloODI4Vk9UZHp5Z2ZwVXhMNXpm?=
 =?utf-8?B?S1paREl6akc2Y09odEp5MU9pVTB6dnFOTFV6djNPc2t5OHhvTUtOWW85bndS?=
 =?utf-8?B?ZklzRWNKMHFqTThCdEE0NWRyY3dwNU9tdHZPNWFQWllwSUlleHBtS0JibEpC?=
 =?utf-8?B?clduRlF0VVZNWEZGS21RRVc5cU1uMnYybUlUZVcxd1g2RFZqcWRiY1pzM1kw?=
 =?utf-8?B?dWRISUdhdncwM1hrb0ZiSmhFRkcvTi93S3E2azFFeFVkak5mek9UT1VTR3hZ?=
 =?utf-8?B?eWNZQVJPNDAxM2JqVGlHRXJ6TmdFcUQ5UGx1U1VzWUROMUJuY29INzNEbWth?=
 =?utf-8?B?d2ZYVlFmZjBIVkRvZU9aMlI5M01kVE05eEw0cGxsWHQxaHY0UEN3NkxwZERK?=
 =?utf-8?B?L09BcmJtcHdUeWRzVFB6MkRLRVJMb1E4R1dlcUdyeG1EQnUrVkhSWmtLMG5F?=
 =?utf-8?B?a1RvV243VEpObytoVmJjSUNEOWt5aWEwTjJ4U0ZIUFdZVWFqaFkrdUhlUXdm?=
 =?utf-8?B?ZktqZVpQc28vRTJCeUZLS2plTHhCN1FmUGx5WW9lOG95N3VjaE5FMk5iNDBS?=
 =?utf-8?B?a1NxdDV4K1I1amFCeklhcjJ3ZjJPWUFYUFZnREp5UFpOTXdRbDNRWWtKMnIv?=
 =?utf-8?B?TjU0MWVNcGhMS0hSU2Q2R3VELzdzVHFRR0piMGcwK1gzaUpWckdYK1p2MCtU?=
 =?utf-8?B?SldaYVZvZlIwWHlRNGFWejdJWUIvYWlKTnVWL2VpMXJWRlU3V2RidlBZRENK?=
 =?utf-8?B?UVVkYlRWNnF3aHZpZVFGTXBWdzRrajFxSnpuTktxeDNDOGJGQkhva0lIeEdk?=
 =?utf-8?B?dDJxbFhCb2tyN25nL2NGMXB0djQyVXl0eW1yRS9paWZUN2tLYWZWVGZCKzhv?=
 =?utf-8?B?a0o1R2RxM0c2dzgwbzdxbHQ0aE1ES2krNFVJcWxXb0Z0bktVNWFFZ2lXcDNL?=
 =?utf-8?B?RG1idmdMZlNsbUlSdjJibTdPQlAxSEFHcTdMWVdObklkcWd4RzNRUjk2NDZG?=
 =?utf-8?B?RVJoK0pOKytLUGJWZHlPYjQvQ3RYQlVOWEdqY1IySjZEeDhkVnJrai9nSHZa?=
 =?utf-8?B?Vnh5aEtpYjVKYk1YQTFDTm91K0s4NjRDcFF6dG5BWGRlejRZY20vLzBEM0RF?=
 =?utf-8?B?T09KVCthbVFvVkhYcHBnazFxa3B4MjJXZE0yUVNoYnZQN0l4TXVOS1Bja0ZW?=
 =?utf-8?B?SW1idmpvelFBbzlUZVJiSjgzNDgrMkhoRmI2T1Bja1VSTWF6cTNZWk9aNkxH?=
 =?utf-8?B?ek5PK1VIYmQwVmtjam1MOEFMRThrbENxQmRtMHAyNmM3V2s1N2dqWkVMNWZ6?=
 =?utf-8?B?ZHo3Si83NktjbUtHN1pyd0IzcXJ5VGoxdk9WSTVSUzBwQk1kU0x2NlhxaEtS?=
 =?utf-8?B?REkzeDZLVWlCZ3RRV2MzTDFkOS8xQXB3d2t4M09QbEVkTk1BWW91QlJseWZF?=
 =?utf-8?B?VUxSYWFyN0RhMGdxS0pDZC9idVZ2OEZMODh3WlRzcGxZM28vb2V2Y2NpNjVx?=
 =?utf-8?B?M1dremo2MHpkbUFXZzI4MVFmOWtHUnNHQmpzNU9ONk5DVFdaTE5SR3dhSUwx?=
 =?utf-8?B?eFhSZWdmSVhuM0MzWWUwOXA2OEpXOHgxSWhhcjM0Q3NUb3dDM3JwMmhjN0J0?=
 =?utf-8?Q?MM9BdK7G08GDYc4GeahOwKk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbac6bf2-6acb-4c42-85d1-08d9fad5090d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 16:11:53.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kB9QL4Ysf+q2x0kNWMrWdKkwMhSJtHXz+cuGYbW3dEvrfM22br5GIObioRj/n7uilWdTOhd3z6oZt2/EOwZETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5013

When overriding the tool chain via CROSS_COMPILE, the resulting
components need to be made available to, in particular (but not limited
to) the check-endbr.sh script. Note that we don't allow overriding
ADDR2LINE yet; this would first require additions to some config/*.mk
before it would make sense to export the resulting variable as well.

The lack of NM exporting was apparently not a problem so far, but add it
at this occasion as well - we're using the tool, after all.

Fixes: 4d037425dccf ("x86: Build check for embedded endbr64 instructions")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -55,7 +55,7 @@ export TARGET_ARCH     := $(shell echo $
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
-export CC CXX LD
+export CC CXX LD NM OBJCOPY OBJDUMP
 
 export TARGET := xen
 


