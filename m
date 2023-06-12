Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67872C36C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547080.854284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g39-0001h3-Sn; Mon, 12 Jun 2023 11:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547080.854284; Mon, 12 Jun 2023 11:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g39-0001en-PT; Mon, 12 Jun 2023 11:49:31 +0000
Received: by outflank-mailman (input) for mailman id 547080;
 Mon, 12 Jun 2023 11:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8g1Z-0008F8-Ps
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:47:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6d36afd-0916-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:47:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 11:47:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:47:52 +0000
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
X-Inumbo-ID: f6d36afd-0916-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvLXPY/UuRVEiZdNmc2i9Bd1VhMS8sZM+1rwYaMMAXyFErAUi5kxH+Bc9firnll8L4Pc+2ZKZr7gJ4CpL2QiCdDNyPuncoX7VJ944aEnltfOw4v1PjH/jYldcIEb916qLJo1seoLzFUWRw8llPHCNVBW4l9kSgrvrmc3VgEHwaZ4fsqkCFmLH7CZm+jBMnRvxaRincOjjJT9QhMBLGQa6uom0ns3PufLPgwG40aqdHqCuy4UUaokf8O9dVi/ztn8ePn4d3yPiUWMr9Gn+aNeEF52aLGw6bCb4pDvL8eZYG75gURFqFzfhGEaJZDHK+w1srwqEi/TVWMWugA7HT+/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnyjzGqpglbOicW2phJjjVaeWkQi3azKxAQ6SvQhGCQ=;
 b=kTV4tS7pn9l4+Jsr73aeYLmCk1/kTmWRsmZEnyTLrAs/u1H1Jrb6BAZnYDu8MtclYFudKcMMkD/DuKhmP+l6Oxm7KlzzpK/WuXgA/GNoR/JIw+sj/BqLOcO3VK4KZSAC5SW6DpdywAldU5gL3OzkmRd0+IQR1GCLNq3tCFLNEgJbpeMERwTpBQuqb3Cy8WOV31CcgG+MQdu7XvTOjBfQ+3aXoRVk9ypFYtvuHg2V9veMPM5XVtpLU/qZd3UQhwRzOVGLtxV1chnUeP/n58JtM/wI5ki2cOdp5VpkNDaVNFT5Qh2n6DcdIQ7FxP1g9jfQF1Y9xpwZdHWO610MaCvoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnyjzGqpglbOicW2phJjjVaeWkQi3azKxAQ6SvQhGCQ=;
 b=WH0jUf9kVTjOvv5FGCnlBxFMSfGJh+32U90cokiWZwEx0vFb1n3Ua7TtZ5carbTOR9IlonlDeRoMTG0L0LZSGOz5MZhLiV/8RoCc59J44xdRrkMNWFnylMxH0+QvcyehVa6e+mOEVWRD+6+GwHC6sk8bkKVYCPhrus7xCk1UKQRIy7Vfyul9QClTkXgQ8tthMkRqL/gt1aNc6LbkHKXLji93H8+Y1RnwAKAmonjY7HIhV9jbmH8NBTd/wjkTyiS3oURiLyJ7a5CoOh5lkIGIgeB3NygHl3wbjOk/C9oS/Fpobv3vXNcHhdiEO/3ok0ToBR2DO0JBegVKB6GbbvxTXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fcbe916-890a-1dfc-86a8-eef2bafb2801@suse.com>
Date: Mon, 12 Jun 2023 13:47:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 5/5] libxl: drop dead assignment to transaction variable from
 libxl__domain_make()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
In-Reply-To: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e28055-3421-461a-ab8c-08db6b3ada76
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ebyXXuCzQdQa1HMgNpnvehe90sh/TgzZAZiHEjSmyG78toWYH8CvL554PN1tF8SfB6jeFvmXbIcvi9dQgaFUBTgM9NbqIwWqP0v6bOZHFmlC55jnvdvYd/VYy3xRkSHh+A02iiswwZ5GjQqqbUQGC6b6MwcPPvcPmRAQBpfIcaAS0ezOHiTbh8jbePHVlKg722r05uHUMX9fzWWfbXFVHvTigPUUbSfvo3a7dvXHbeRSJONsRxB//IkVHHBxNdvJQmcdsO5Qkd+CVHDD8lXieJoOwMolrT0rjrxLODvvlnDvx1ufzD5k51Dqp2t74EMdl0c1ATTVHqy86gw8T9cAn4YHnNujeI3PhDejHhso5Y36cNw2jTodxdDYIeKK3V5km1SZavl+0+34vXD7qDDvpu4psPj9olpPqu2vV63G5r9tASMYMl7+MpN47WB8ZUFaXAORfnuTBDsOhvZaV98ak4K5CX6bNq/N7leU3yjB1EOosftTMFDzna0DBsxwp/+FIvfKSYYc3vtHV3N4NRLp4Wek+l+0lGykOFABaoq7cPhxo+oPMJ1pIDPHz8g1lX7zl0F17EViPNWcBhh68CvxCKu+zF1cnM07P2nwralJRXOeVLsZQe//cTHJzHjw21imWwND7VW8OrK/EtuVZfbD1IjsVkwtsLlORonBuEijSQw3G/Iuq975bHGmGTPAUMDO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(478600001)(8936002)(107886003)(8676002)(54906003)(6506007)(5660300002)(41300700001)(316002)(6486002)(66556008)(6916009)(26005)(186003)(31686004)(4326008)(6512007)(66476007)(66946007)(2616005)(4744005)(2906002)(38100700002)(86362001)(36756003)(31696002)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNaR1JTY0QycGJ2cy9Yb2FmM3hnQ0FrOWhVaTduRHlmcWkremt5T1M5V0hv?=
 =?utf-8?B?aDhoNEFqZG84V2h1cWYwVzVSVG1KeGJvUGpXK0dNUzhZOFhXdElYcW1QQ3h6?=
 =?utf-8?B?SDlKb2tQVlhVUGU5Z0gxNkdabXd1TzRRYnErTzRTUjdvcEI4ZjRxbUhUd3VY?=
 =?utf-8?B?V0JPdTZnaVhZdVZ6T1I3QnBnUm9TYmdBQk9QME1tT00yM21wRmR4Vmc1ZWpa?=
 =?utf-8?B?YkxmUUdGV2txbG9qOGNyWFA1NEw3Qkl0S05rZ2xQZWp2V0pMWm8vOWhQNzF1?=
 =?utf-8?B?Tmd6WDROSWJ4OE1hODlHbkYvM21LaFp2dkFCVThrdzluSmRvdXozNWk0ZEVV?=
 =?utf-8?B?MkVlbGZ1SHJYcWZPRXJMMHhaVThTRTRlVzN0d0ZtcjFBNTdGcjNjdGNBVFdr?=
 =?utf-8?B?Zy9PSXZWb3c3aHhuK0xyblZWZjdYaEpxQk05NDROWTh1cXNhdFA0VG15OFpY?=
 =?utf-8?B?amNmNDB5TEkySDFMV1F0dWh4UnpMbHFSU0ZtQzNERFJxdkpldHVVRkdBT1lz?=
 =?utf-8?B?YnFLTGxmWThuN0JhOE44VWFjK3MwSHhoOVlneE5pUnh1dWEyUGtBUzVSSXk1?=
 =?utf-8?B?eklicXpuN2E0NHNuWUNUKzNDdUNmaWpucC9aY2szelRHUWRHeTY1dUJCL1Jz?=
 =?utf-8?B?cG4zYkQwS1hpOU9nUnd0SEd3RHYwSXhUSlo4YVVSQ0xCK2gvc2FKVFp0YjhT?=
 =?utf-8?B?cXNySnZ0a0FoS0FJblluQWNpUmRxS2FUZFU2Vk5ZWGVHSzZldGQvd3BhTFVQ?=
 =?utf-8?B?VnRrT2tiQjNnTnVFSmdMdWtCSDlHOWJtNEFxOEJtY3NwNURrQUdXLzh3V1g3?=
 =?utf-8?B?S1dSUW1GaG0xMndSM056VzlQa3ZxdlU5ZXpoYWNQOHV1THZESEF6U2hYMmwr?=
 =?utf-8?B?RitTZ1dWR2ZZY2p4ZTV5a0kyOWNGY1hkcU1EdDdRSktVYnJvdnBtNUczU3hF?=
 =?utf-8?B?U0NiZXpEM2xaT3VTNmpKN1hUdDVWT2JxUkdYMnBDT0FGRzdRdWtQcU42MmpH?=
 =?utf-8?B?S2pGL0pzNnJuRFl6L1B0Zk1PM1cwcXZBRk42dHhOWHR2ZTJjbHFsY2tuOFQ0?=
 =?utf-8?B?SVlIT3ZSWmx2S0VHdE5oUkY1aW14dHRQbkdoYURRRGlSdFFSaFVqNEdtNWY0?=
 =?utf-8?B?aHIxbS9QQ2tMZWtPSW41cXBOS2cvUWpacE5VaGFzMWFUZTRNUm5FeGZtSFhD?=
 =?utf-8?B?bFNtT0ZQYnZ3Ymp6OTdCN3lMbmNKcnFJcVk3RTZHOGt1bkljYXNySW9aNkYz?=
 =?utf-8?B?VkRhVlovYVhSclQyRDhJUnZMMy9QcWZGQ1RJUE9idkw5Q1VYWUc1N0V4S1ZV?=
 =?utf-8?B?L3B3ZEJUdk42QlE2amRBNUxEMGcvR1VCL2FrTEFQV1YwSE54RFdXQkFmNjJr?=
 =?utf-8?B?SVFQcDMzbFBBWkwrUzZ6dmduc01aTElLSFdiZlZvNUJ4UmgzeE5wM3IwSFlW?=
 =?utf-8?B?TElYaXF2Z1Jvb0FzM0xvYXFaTlcvWGw5R3IvT0FKZEpKenY5WUZEb2F2eVl0?=
 =?utf-8?B?dHQ1T3ErY1dnT00yRUZQTnZ3M01DeDNncCs4UXN5bFZGcXdUTmFoNnBuU2NI?=
 =?utf-8?B?c0dxcnBZU213M3M5L3hkSzNocG0rR1h5RVYwb2ZNV3hiTFlSWTBVY3dXN3JY?=
 =?utf-8?B?TU1pVkJtcFdrUmRISUlJaGhuVFdQSEFiSUF1b0taR2RYSDlVc3NYUHRURjYx?=
 =?utf-8?B?dkdLVll4djMvcEl2OFpKMmZ1NjNCUGIwSDU3SEhrWUwvRlc0bEZoU0hXRkgr?=
 =?utf-8?B?MUxJWGFESU4xSEZ3b2pud2VzUWlwWkkwRFRhTllEZE51cjFjVU8ybmU3a0NS?=
 =?utf-8?B?VnVueGdKWThFdUk1S3lQMDNrRmppQUdNcTAzMUhUOEZ2VWZ4eEUrTGc5R0Va?=
 =?utf-8?B?ejhtK2M1MEloYWpUWU5oczVWMFpZVGhKTGVwTHJYT1dnbVJvRjNmbCtNamlS?=
 =?utf-8?B?WU1meER3TkU1UHB0REFrd1d6SlpncUJ6akV0RU1RY0NudytJWUVzc1dvSE55?=
 =?utf-8?B?dVVpUHd1R0RmMnhXWkVVeTMvaGo0UGNlTWJwcXlIRXRBZjBhdTdsa3o3M0px?=
 =?utf-8?B?UnUvSUhDQXJNOWtQMG96cWhzdnlWRHo3Z0hZZEw2Q29ZYmRRRFB5QlRCdHRC?=
 =?utf-8?Q?Oer77vO44GL9Tm1Pk8jDT8pyC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e28055-3421-461a-ab8c-08db6b3ada76
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:47:52.1725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LFB5LatvAzoi92dNzBAzRQlOmd+sBQwVlqHq8s2NXFREY+h+P24OGSRwchp1NAQP+OrxcVfnlrMPspsPxsiRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

"t" is written first thing at the "retry_transaction" label.

Coverity ID: 1532321
Fixes: 1057300109ea ("libxl: fix error handling (xenstore transaction leak) in libxl__domain_make")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -909,10 +909,8 @@ retry_transaction:
              strlen(dom_type));
 
     if (!xs_transaction_end(ctx->xsh, t, 0)) {
-        if (errno == EAGAIN) {
-            t = 0;
+        if (errno == EAGAIN)
             goto retry_transaction;
-        }
         LOGED(ERROR, *domid, "domain creation ""xenstore transaction commit failed");
         rc = ERROR_FAIL;
         goto out;


