Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2983F18D1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168702.307996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgri-00030b-Kq; Thu, 19 Aug 2021 12:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168702.307996; Thu, 19 Aug 2021 12:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgri-0002xd-Gm; Thu, 19 Aug 2021 12:09:46 +0000
Received: by outflank-mailman (input) for mailman id 168702;
 Thu, 19 Aug 2021 12:09:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGgrg-0002wr-Gj
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:09:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c08967ba-5601-471f-9922-21399b039af6;
 Thu, 19 Aug 2021 12:09:43 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-TBtlnpu9O76yWjmTpikz4w-1; Thu, 19 Aug 2021 14:09:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 12:09:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 12:09:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.18 via Frontend Transport; Thu, 19 Aug 2021 12:09:38 +0000
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
X-Inumbo-ID: c08967ba-5601-471f-9922-21399b039af6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629374982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8jyJIc4q1MroqvD8dSa4R4o1Z/tRCrMChyeoXFMFpg=;
	b=eb3NFsZ4E8ZPP0yctSz4Xf8nPbm7+jMegYi9//oQlqON7Embsc8eYHSCSVJ6SiHErW8omZ
	eRWPN6zWF0XrrjXnLOmloCJZ0h9Pse+CVd+1GBT6qarDBDUx58JWcEecmmfeoqGY0hpBZD
	l83yXB9E0bOSXaragx27c6ACJNyX6G0=
X-MC-Unique: TBtlnpu9O76yWjmTpikz4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1U1NimLeMcsWqG15soDQkEAbDaROMgiovsMIFJLDpYFmv8nOZsnbQAdTqi0rccN6BVtXZbNv5BAqArbS+9Xx5y+nwR+iSOpBVQTHmZegDC5RuOJvI1I3e/TS7uh7jMTrnS9uv/SfHR+IWybarWMYkhr7TFBletbpVQY44OeFFWKOIb4K0Q7GkcJrA52GBbY4tXuSa8/wwsGtNBiAiMRbb79tLwldtBUL/ct+k1J+HbfeGJX6HzuwJ/P15g2f1Rq4V+5t6uch4uiFPx5UvgeCoZFhi2SvrUdD+RuQo340KeyyIY9G/KmCgfMEm9CQmGqZN+dfZxGbDKEHDBJz11Qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8jyJIc4q1MroqvD8dSa4R4o1Z/tRCrMChyeoXFMFpg=;
 b=VRZfTmwAEYYif5ay8kWLrDFiQ9kxd450KSBJKen4nx1+u3GgGhW3nJgais8Er05s5C1WdprfgYEF00qL1513Mo0hm35Su+3eHCF6J7cAXh9HDA0/txwEEB4W4p0D1icBHjdD5zgc/MvqWzc1jvnGAAfrlD+A2U79xxiOrtd3F4NdTwccADFLSoWgCSsSKui5+uhKxWdghQaLSFFsdHDszSEogisOIR8YnFO0tnQD3G4bfRggoudwXtneZRax3fcAPvrWDKfKD8xjHOlH6yIK374ycfq9mKxk7y/TpXFSSaYzxjetvHnDaVexy6Zvxp/lFhzUEVwSZRZuG38qA7PiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4631a7cd-5f82-8a04-1aa5-bba8bf5bd625@suse.com>
Date: Thu, 19 Aug 2021 14:09:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f91d0c7e-0ea1-4151-23ef-08d9630a381b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190835CFB19DC6A0D63956DB3C09@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lFSY+EIkoXRnI7tSgTRq+A87pkA53/cYKo1CXcw6NRxXQLaPmpivtghlPeCZsDJFO26EGKDwhpC2mqccdVIRQOaZ7v/dPZsHadQ+jF4RNkx8tar1N7l9rWHOw49o9uTtpPksTuvq6PWbVWLKi69QKFUzjay12gCUCoPxW58aMFKvYNSKv+NT/TwWli9dMgC1LPdwn91MJoLhb+d0XpgFJi3pTSVx9IRntHBsvf8Ksrwlj6pfcRSyoas5fGhOiS+iPYPtBNultG8mxqBkIan+EavtqLpHje1iRtYQQNC3+jm5hsWNFguiLDacAX1w18D4Q3e4kXPyZWhS4aRDiliqmCmqFvfU8WDewdX+oRqqsPOXO4RXt/GgVfPUOloQID87BYoz49kJmdX05bmyDx5r4COVtvFIae2L94ntdDwVM8JaRvpZAni+TT9nccebZyMgF5LHr9AQtHm60q8gWmwrmMx2jsTIJcnVX8ZeR5MmKG/SVILOAAJBHkYigHtEmRJ11BABHhXF3KAUBOE6xPxsTgemQOVskb09e2CIt5DG+xzXaZnbWN+VG2EiCmY7EWotsXcU77G8ZnXOoseCrFxCbBLN0hJfMwNLlwhqg4h4UERpPcF8D7Snj9uPlgabHOrSH5hb9M9gPNEmkApRGNYeB+9KG5gStcLLRBOO4TrRbBEKcCnmALhzewAi+5q3waxfpd1dp+Y/0zUnDETsy1luVKTumSykeDXUH8u6iIhyFy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(366004)(396003)(346002)(86362001)(66476007)(66556008)(2906002)(31686004)(2616005)(956004)(16576012)(316002)(31696002)(5660300002)(54906003)(38100700002)(8676002)(478600001)(6486002)(66946007)(8936002)(4326008)(6916009)(36756003)(186003)(26005)(4744005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDVQcW9hWnVvbGlvL3lkbWJCWG5jam0waDNyOFp3ZDF0WHIrWU5yb2NaZ2Js?=
 =?utf-8?B?cXprZi83blFQVEhGOXZZQ3ZGTE1sUXpUN1lKRkpYdmgwSmxXdFRSdHJma3Jz?=
 =?utf-8?B?MGNCRkJhaG5rNGZMWUpiZHlTZkVJazNaaFlyRGdjODRBMVhXVXpJR1IvNWRM?=
 =?utf-8?B?R0Myd3JjOHpUeEswenNJNUFqMTVTMzZ2VU9WVWFrdWxQaXQ4Wi90cVFPOVox?=
 =?utf-8?B?MnBuOERGZ0o2ODJzelpXTVBiUUU5ZXNIajRSQmZrdlhGZm5tdlhtS3VUa2p1?=
 =?utf-8?B?ZzIrQk9ERkQxYTZJcDRaNGdoRVFFNC9SeTNPTUM4V2tuZ1Z5eitoS0Q4NmhU?=
 =?utf-8?B?MWhvS0d2ME11NDdlbVRUbzEzdlhoTVdQMEFiWHJtY2J3R1N3aXRya3l2V24z?=
 =?utf-8?B?MzJCMWMxSDRvZlV3VVJ3bVNmRi9La1RSdTVITWREaFVtRWVKV1c3QWtzdkc2?=
 =?utf-8?B?QmhuTFVweHk4a0pWZ1FBazA2TWR2SDJ4M0xRS0pGVnZuMzJSajhJVEJIUElu?=
 =?utf-8?B?L0dISGd4V0N1VzlpcXNpMi95NFFsWnpIU1luS2RoRExBb3liS2pDcFdLdUE3?=
 =?utf-8?B?Yk5Na3FVRnR4d09HRHVDb3h1emdrSDFvSW5kUVJMUE1aMy83UEZVdzJrRHV2?=
 =?utf-8?B?emt4c09BZkdjS1JiRThoZnd5VWJWN3NjK2N6NXJQZWRURjhFSmlBL1BHRkNT?=
 =?utf-8?B?TUlTb1JabW5yMXN1c1liREdpV2ZOcmJrR2U4b2liR0xvbGVTL1FXUTdhRW56?=
 =?utf-8?B?V2tpNzNiM0VNTDNKVmZkcWpUWVp5OTlSQkRSSTRtejZrRnprRUlaaHdiNFor?=
 =?utf-8?B?S0grbkJhK215SlptNFdoUVVBNnRadEZDTU9jZFloWW9XVHlOQnN1MXNwK1pQ?=
 =?utf-8?B?bXVUZm45K0hSZjJnT1FzR25OcUlUUmF2dXFUU2dCTXhJc2R3YWpsOHB2NEht?=
 =?utf-8?B?RzQwK3J0aTVBc0QxZmVCM3JhVUFUR2p3bVoxcjAwdU5GaDcwQk13SjlxMEtT?=
 =?utf-8?B?YzFHenQwdnVOVitTYk5rYlNqRS9Nc3ZQSENrK09LWWRnVjQvK3FRejFmMXZO?=
 =?utf-8?B?LzF1a3FxWXZhYnU0bXgyVnhuNWxoSzRRVUV3VE0ra2xYRHZYazZCZE9wRmU2?=
 =?utf-8?B?THFwOTNJNEVLOUhhMFpyZU96QThSNUswMlNhTEdQbm40TlVnZTRCVVNFeWU0?=
 =?utf-8?B?bUJSV0JvWmFOMStLcDd0V3ZwOTB5cXNSZzA2WmFGV05YMDJ5d1RPVFpEUjhw?=
 =?utf-8?B?UXl1NURuV0hseU9iRUVFcjA3QnI3dDhWbVJ5bXpMNVd4b1FxakFBNWprS0xw?=
 =?utf-8?B?UENGb1VCbHlBRU0rV3BrOUVBZ1F1eFp5eEdDaW1kei9wbWw5K3RpckpWeU5C?=
 =?utf-8?B?aEdGd3lzRTlFRmlwMkR2ZWZBQTFJUHZtV29wc1o0Mjk5dnhRbEE0LzR0QXVW?=
 =?utf-8?B?TDR1MmtOaVQ5QTRVaWFwYjlTbVNBeGhqWGZ5QUthcDA4dWIwa0ozbjdrR2tU?=
 =?utf-8?B?VkIwSEpqbTgwcXJuRGlmaXVlenBIb2pDK2JwVFR5dk1NMnQ5YnMxYjNpY0J6?=
 =?utf-8?B?T09KRXczcVBRb05OcG1NOFd5Qnh0MUJtdlU2OFR1OXk0U1JsOGlDdU4vNUFm?=
 =?utf-8?B?bmF4bjZpUmJGQ2tUcm9VT1pLZzlMdTd5QkQ4WUJIOXE3QlFOdWtSQnl0TDZ2?=
 =?utf-8?B?MCtCUGFSQ1poa0tBMy84NXpKTWtKT3lIT1dZbGRlV2RqQjBXQmxtQjl3YUQ2?=
 =?utf-8?Q?njj+IWwkwlgFrkFtA3BzNEA65ua3ajn++Zp91uw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91d0c7e-0ea1-4151-23ef-08d9630a381b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 12:09:39.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22z2ncE+AvAJLKl6oZoJ4D9Sa22ggnJl/ii0OEdxYrsGcUwKyyozWvPoQIAd8kNfM68jnqNtgiRISOcU6+E6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 19.08.2021 14:02, Rahul Singh wrote:
> Add cmdline boot option "pci=on" to enable/disable the PCI init during
> boot.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/pci/pci.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Any addition or change of a command line option should be accompanied
by an adjustment to docs/misc/xen-command-line.pandoc, please.

Jan


