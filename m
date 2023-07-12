Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B735B750855
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562448.879109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ0w-0002PK-RB; Wed, 12 Jul 2023 12:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562448.879109; Wed, 12 Jul 2023 12:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ0w-0002MN-Nq; Wed, 12 Jul 2023 12:32:14 +0000
Received: by outflank-mailman (input) for mailman id 562448;
 Wed, 12 Jul 2023 12:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJZ0v-0002MH-B8
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:32:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fe6a2ac-20b0-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 14:32:12 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8848.eurprd04.prod.outlook.com (2603:10a6:102:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 12 Jul
 2023 12:32:09 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 12:32:09 +0000
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
X-Inumbo-ID: 1fe6a2ac-20b0-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONhJwhL9dCkCnRMlY/btBnkQrbuAkoddENqX9ZgLiHqAHC4+483bbpC+pTNIj11fQ/A+4jDs74yl1VVu6rc2ekWFDdyfQpwFCK4zK94aFfyqHhr8fOFVcNbEjyMIUApOHS4IpT09q5vcDkioqSzKlH7m3r0WdhYgKSQCgWbvhJ6QhNGLG6R/btr58Eq5ZbWFn3r6YfDuVsW8PrUDBUazwah2QpGrljgE1HL+A1T5YVx0CbkhtcKr80dvRAF+87cBjgvrVML893MG093/VBpXOkAqVny3rF+0rnZVqEeUySrooXo30gfb0XAwGYgrxMdfdxhaR/gkkZNGj1h6+NWAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gDz/iYeLcDEfRNYreqo79Imh9dwbgKwZGlvuvvTroo=;
 b=Yo5mLaV6t4j/bhyBTcQlQqWa4C4+JGoYqd89ca5KDY6N3oVqzj0v5B6QrnG2so8FKd64ui4757fQVXmP895xuTt/ic6uuD/Rw916sw7xa3Z6iyJN+UYWIpa/69etisS8QrnL9Gu+OFytaR9/jnf+gVDQ7KfISYBuYMUUUBNJgNwBUk9frB8kx8R3vPdGz4WCamU3UH5FMDrb0XENApDeAa6CJZqLfMQu7AZ/gzkyiB5KCskQ5gW58V+kjW/t9uJb6whyD0h4qKa9jaTvkeoCtGyfgjc1FdqrDvUwUgfCSsimfDAE5AuHAYlsa2IjLR5GsPJqhxOQEtzI2c+w+BMHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gDz/iYeLcDEfRNYreqo79Imh9dwbgKwZGlvuvvTroo=;
 b=Z3KZqd2re/3bvsgOW6AVD8iv6a8gvxgE/jt/k1pRonAzzPaGzreLpTIFlzLbcefiVOBsn0YhBvzhY7wJoSeUjlklA6sClcDsUHSB4f32Ds4/O3cWhmXMaejFF4zPbug3taRNVaxGVDIh4BEDLLWKW6jy0yhvMa/tnZhmub6UIAs1vs5OdWPpS499Yj93uq/mOzJE3z5ZRXGPeYQSvf86scsLgWx3/LK/PzpW1HSWbIDEDcS7eunYeQDd2C+hSpadhj4Nbug5qU01BUPJxihqJhMWiAB2rdU3udBVuqKXKyOJqOBz1X5zmA/s5LpA9HsOZF7VuiOaWHCHbZ5adunXrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Date: Wed, 12 Jul 2023 14:32:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: allow Kconfig control over psABI level
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e9eaf1-4e0f-431a-7e82-08db82d40276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OMMT7gKQvfJ7IBwpLdb0kTXWviGbc8Hv6soWzH2jg3KCmx95Mc3nfTxSN6ZK66FP6lgAgNBMJgXMfEUo9/Hs0oukfwgPuBZBs1Euymvv73kjdDvDZ8DfSIUk1CvpwHFMjycapPVEzX3anbs+YDdevpogD23g/D8QJlqW87EuPdmLmDPAccvQcAc/5Z5O3x9NcuFo7SEwPUarmPoClGs5uvwzL+IDpDN1n8qrp1M3c+pJztJ0NCdp5bMMmXvqmFEBXNN4UhD3GgIDCOc3kVgr+M6L162/Li9LLb+LjU2y+pFGLyDV27S9joM8TMkMQG4eXdztx2p5wjwS/5FC934huccRdMHN2Pmyox0/r27X3t1sJaU0AOs5Fa05L1x0dxEZMjs0+2gSRgwqYfT0mp+IPEn/swn+spxAgKleAw5G9fa+P2bZq6l3KHr+mPXX4yCYrz6pPyu/m6Md4KrlnaqFNFLytp7xmtHgYeXL21mgROx473Jyr9w9nAdTLXy5c6YmX7tPyHdIIx9KtUyCdheVrMqqBU1ewKMeNma948dXe72fU3/n8rGwdLVoNP+OSAMnkcVBQ99LbXI0DkpS87TtgPAjPRyaUAqidi6vU6xaQloL34SVlis7SSbCeIM5Lunn53V5aVuT/KVIWF6LNk5/HA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(2616005)(26005)(6512007)(6506007)(186003)(36756003)(558084003)(38100700002)(54906003)(478600001)(6486002)(66556008)(66946007)(66476007)(31686004)(86362001)(31696002)(8676002)(8936002)(5660300002)(6916009)(2906002)(41300700001)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGxJZjNlbHpwS0ZEaElHUXFYcktyMHBLUzJ2cUV4WlFwbE1qOUYyWVBzUXRi?=
 =?utf-8?B?K0JsSTBVZXdsejZsR1M2WXROL3QrZW0venZqZzlqdGpBNHJJdzFQT1I1TkNi?=
 =?utf-8?B?QmN0WTdiTVhtNDFGeE9CRGppL1dPQ1FhOVk2VXlPc21CaFA4VUExWmZBS3Vu?=
 =?utf-8?B?WHNKemhYbHN4V1FwQmRoT3lQbUd3MlBSUW8yME1GMFFXUkp3V2lRSmVvMU1x?=
 =?utf-8?B?YTA4bHNLUjdsdy9zYm9mRDdEMTIzQUxlQlVFYjNidS9RYlhwWkJBSzhZaGJH?=
 =?utf-8?B?ZlZqa3dDbkhUcE1Ib3d6TWoyaTN0cWE2TVBDVnE1VHpXQ2dqTFBTSTZ3UDNT?=
 =?utf-8?B?VnZJTWlTRkVQTGliYWpyQi9KRyt5NnpxRzJhblBQNEk1OTRjcEp1dnB2Z0tr?=
 =?utf-8?B?MTRaMEIrY2NST1lUWXJoNUpLS1ZRVUVKVWx0aW45R0ZVaS8vWk1lcSs0WjNl?=
 =?utf-8?B?KzlPM2lHOGZXNkV2NHZOaXh4OU1GWituODgxcVJuOFJOcFZsMHhIVmM3WXc2?=
 =?utf-8?B?SUppd0hlVnFCMkc3WUtuV0hmMk9KQkp3M1RKOHZWeTd6eXRHZkJLbTJjVzdn?=
 =?utf-8?B?QVlZbUxpVVZvSU5MaFVUVWpLQ0t6Z0Z3eHR6NFhINklZdHloT2d4UXJ2eklP?=
 =?utf-8?B?bU0vaFFEVHVEbXpDUFdYY2tPcWd0cHgwRUtnNjlrL1BPbHlvd2VnbXRWU0F3?=
 =?utf-8?B?TUd6SitsWFBnN2k2VERDNjNYcFpsOTJ3R1VYbE1xcE5jWjEzTUViQ1NxMkVu?=
 =?utf-8?B?ZURndEJpVUdDT2JTcDlhR3hvZVhrd3pLQVpCdnZTaFNYQkZVZTdKcjVmOGN1?=
 =?utf-8?B?R0w3MjUxMlVnUE5IT2g1NGh4V1NDQlNrQ3l2MlNSb2RqdEpBOFB4cm0wYnBQ?=
 =?utf-8?B?WVB3dE05bHo3QUtQTDRzOVRHSktvZ0luMlpuZ012QUZTY1dSTTlrWUY4SFlm?=
 =?utf-8?B?Z0NKS2tLbVE3aytGVDBvNVFMRUlqWlhsL0M0ZmhNUElTQmNONFU1U29jYWYx?=
 =?utf-8?B?UEZQdk5lRklGdnd3UVQ2bytlNHhkdTF6S2s0RUNNOHVxQk5sVmFwUEoxVU1i?=
 =?utf-8?B?cnY5emJmVGRjV1BmcFNpWmtCSGpvWmVmbTlXbklCdnRuWDBmTkhwUy9FYzBR?=
 =?utf-8?B?UUxWald3WDdBZk5SWnF2bk5MVEg0T2pxSnVJQ0s3WmdFQnMzM2RtWWQyUzB3?=
 =?utf-8?B?Q0R3OW4xRUhaU3JvNFlqcU8yTUZwM0Vmelp0ck1ITjZaYzcyYm5EalpBc0dH?=
 =?utf-8?B?ZHpzYXB0VzMraHcxTFFwc1ltNlczTlJSQzV3dE5QWlk2R0dYam93S0lEN241?=
 =?utf-8?B?TG9OenlKeGdGUHhtcTZZY2NWekdEZS9uL203NFc1K3JzNDJwNEhUS2YrNFNG?=
 =?utf-8?B?RFFvdHFIUzhrZitJKzFseVd4aGo4WXFJUFF5d21GUlVLR2V5SFNGUjN1ZDRB?=
 =?utf-8?B?VWYxd2NhcTBoRFc3cjBVZGlmVC85K3k3RUZNajNLVlNrb1RNRk1td2hzVGZG?=
 =?utf-8?B?bndrMzkwUmlXTWlMZVl2bjBOOExQY3VDRE9hTjVWUzIrRjZlOEtLNFdVWUIr?=
 =?utf-8?B?UER4ZDZlY0sra3FwQ2c4b0pjWXJIaDBGMk8wUkQ3R1UzYkpCV2tMSGswODla?=
 =?utf-8?B?VEx4RGwzK1FOdjZuN1FxSzZObVU1NzFSUTFGNUZMcW1La1BWQ2RjSjJOYzJ4?=
 =?utf-8?B?M1Bndkp0YlRJMVVTS2t3VDRIY2p2czlzN2JWcXlTMHllVmVwSFBXSktjbG9J?=
 =?utf-8?B?RUl5STRLZVRCelNoNnRwazBlNXZjTEJ0aUh6TDEralJWOWRsaXlMRFZFNFhM?=
 =?utf-8?B?WHNUSjJGQm0yQUdjNmFKMUM2NkRTRWVUcW41ODNEcTdVOG1hUlpSS2ZPWFdV?=
 =?utf-8?B?bDlVNTR6bklheUpESkV1cnN6bkdWT3lZZGMzSXh2czVGaHM0S2htRERpZ3VS?=
 =?utf-8?B?YnJSVDVoWHRBcExuSmdobUdqdFBPUFlUTGYwZ1R0L1N0djFneGNTNm5Yd3Bn?=
 =?utf-8?B?ZTRPWnB0dVN4bnl2N3poUGZ1YTJaYUtvT2tVazVzR2UyalFGY0FzWUxXdVU5?=
 =?utf-8?B?TGg0ZW91M3pwRXRjOGNtemhRRXE0TzFDTTlKZ3ZjUDc3WEhiZWZ5L1FZblov?=
 =?utf-8?Q?S5F51vA/mffBUpouJ0sYaXSb3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e9eaf1-4e0f-431a-7e82-08db82d40276
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:32:09.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M02m53ge0YFP6wm8ChOusy3qT6kCWdqI++wl6ANL7fzSXkf5jd+J/jWg395BrdqH6q6DlTctB76Y9xm2S497ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8848

As discussed in Prague, with some minor add-ons (patch 2 replacing a much
older patch under the same title).

1: allow Kconfig control over psABI level
2: use POPCNT for hweight<N>() when available
3: short-circuit certain cpu_has_* when x86-64-v{2,3} are in effect

Jan

