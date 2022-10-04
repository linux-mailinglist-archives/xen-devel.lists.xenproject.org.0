Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33245F409E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415352.659908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofew3-0001NF-5v; Tue, 04 Oct 2022 10:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415352.659908; Tue, 04 Oct 2022 10:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofew3-0001Jm-2A; Tue, 04 Oct 2022 10:13:59 +0000
Received: by outflank-mailman (input) for mailman id 415352;
 Tue, 04 Oct 2022 10:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofew1-0001Jg-68
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:13:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40e48b8b-43cd-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 12:13:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 10:13:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:13:50 +0000
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
X-Inumbo-ID: 40e48b8b-43cd-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjflINUVDFitznvAQD23KnY6sS2pM6DUq7TY0TVZKeqF53+aGkIJNLtUvbqlu3Cc56QQq16NUNw16z5IjQSaQQtfNenaHkcW5pbxcOFIUyCTui4burJydzMbJkxUJtJSvVD8O6Aoxs/N+Hd74UB/sOFyzEZFU96aJs4vb/19lunkPaI6Lm+05MFWN9QvqS2lT0maBWGENYOBBEI/L0lpQBhxYsY9nwke7r/aP730G19VX2ZKAy0yb6pRxhtYv5iScGpuvzKWFKNYhrA3ZvTxIkMpqu7u/SViXr0iUqSFigG0JYos2NMe00s2qcpnItaWWAVS6FOfFQyB/8gFnI2PQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW3dUW2PhLY9fHD9lB+xnYzINvkpKb/gaU4i2IiPwHY=;
 b=TY/lJuYkwgejo5p0OX1TVRh6FCD/dZtKokRRcT8i3QP/t8KMr+a0BiOtAIj2Ab/f/sySFag7s7leX/uWhFuuqoFASYCcIzVeHDPCXk3cmWdEdSlIrTP7xEo0eaB1liW5BYneuE7Fv9wwO2nYjbSqhk84F1hax0cokO84NLvZrCmixMwMjp4lqpAKjVO5YvUW7M698ry20xk3D8A5oWPVQc3zpQIzSyc+tum9/pY8xZXMtSC4TYOOUlUzMHqUOifGfhow/Tn7SMxPsbKAh/PEkMPJ1m+lQcbHme1p/19vfyk1ir4oSIzho46T+NZjn9U4jf03EUXPLTuolGB/LaROUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW3dUW2PhLY9fHD9lB+xnYzINvkpKb/gaU4i2IiPwHY=;
 b=G8D/c5vJsLsmXOC00E7seoEPCOc5N5qjg5+vLFupBi73JZToCkKDwLLFvKb5Dag6XEkgFcCjpsU6wCbx+J3q53D5mJosZJsMAr6fmEBUrY8aK8EuZocj3oLH0KilsVjEdae0yWpZXIGlnjOC0jHvo4Wr+heZ04o5lXnoCAN6/EwT/uDc0VaqLoqZYpeE9GnYy0P/TJm7z0P+FDmgiPU4XX4wzrum9E8NIclkrlDk+CKOafhFSbCzk17mXKDTKDlH9ziExHQMu/vqKCCi5s1BSllBESTpAOBKFSf/ty/jJ9h33y37ZhbQfFBx22Bb0e76gsoAFuHZYlfbA10V/aldOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
Date: Tue, 4 Oct 2022 12:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17] x86/NUMA: correct off-by-1 in node map population
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: aaac695d-8e3c-4db9-bb43-08daa5f12214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XtAA9fGK4ormyZILJM0DXvg1x3WgUBmqG9vSnCwUQ4aVK3FP2Syi1uLVlh8yBYzAZeALXFKVY4dEo05C1wIPf53lKW/AXggU3xjCt/R72GcSsqyo1tWOp1ggC3GMBaTP664ZByNTcdneJTvZZ2sISwWwnICy/VscSI3/4orNTAWogZgo/9QQJQFuw83FH0I+XhcGKe9dZHuPH6d4Nzn2lsmZdJCTYO71Z3ktwKCgXBPT6bEUze9wgJh6HwiYS8wf7PGKIkaCDdfJSi5M53AEDT7VCfYYplYu9ICR01Dt2FhRsthcygSRjkc1orTXS8VkC2cJtPWPaWCgOZfPlDsjJ1H6q/EF7MLQnoGJsUUzlaUPi4H0M8BkorTJ6u5t3xuGtgPOLo0WsWRndd3spY0ABDl2rPpg1+RbuAq7at7n1n8Fiy4QnQXsWYoe6/ZqjFNdOwm14P/q4IJsj+MO/VuvqwhIw32FkKIWmONjzpXy5bIlFaWjBRZLcLgO6rs+x9CIUD76qaLRWhKCp5RAkYIemx9ldCbFkEON/231w15Uxk8kymupF3lDLGZiw2B0hFrba6Z3D31Oa3RSn8K5pTlnQ9M+13kyrfDM4Xw4mvLQ4BYHwrR+T4wESQGFd5YsZcaz+duWIebNYRj25sgTrb/Bgp2whQEWqHtNJePUvvFUTzIyFkLcgFSnegU2S8b2pcXGZlBhTwmj4P4l63eBCvTcfH8c8TFniibU6jkrKeV/VtoYLFLtvsfEbneG9yD+N627doD+RfQSoDjAvRAiUN+zkp489pBz1lHLNpR4ESlz7Wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(39850400004)(136003)(346002)(396003)(451199015)(6916009)(6486002)(316002)(31686004)(478600001)(54906003)(38100700002)(66476007)(186003)(4326008)(41300700001)(66946007)(66556008)(8676002)(8936002)(36756003)(6506007)(31696002)(5660300002)(86362001)(26005)(2616005)(6512007)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkZSajZDUmUyK2Q5SG1BcnRPYW9PSDRvOGtGa1Z0ZlRFU3phbWp0ZHZjaE5C?=
 =?utf-8?B?WnpaTTRJVTZVcVBRVFJRd3pGN29JMWtOOC9hQllZRm1SRWYzbk5xdVJvK2Np?=
 =?utf-8?B?andSOVRab2RzUlVyblRvYStsMzl0dk8yTkhGSFNuQVpyelBjb04xWGJXSlhW?=
 =?utf-8?B?YlAzeFVkSlhPOUJZVWFBcnpsV0J5cVd5eU0zT0NvcU5LREllV3ZRTXFzTXdI?=
 =?utf-8?B?VFp5dmdZdHRRaEVDR3gxeFdQTkdrL3ZrNThEaXVVRDhBdEN6dnVXbjh0LzNZ?=
 =?utf-8?B?aEthWnplaStkclgyajgybHNlZjJKbk5zUmwvSVBTNVp2dVRFRG1uRTBZZXJ3?=
 =?utf-8?B?amkwb2Rta09YVEQyWGZ2STBNQW1LZm51aWdSaWZiV05uNFZyQXJOczRLcXFF?=
 =?utf-8?B?Zk9EMVEvOE8rL3dSQ3R6QmxPdHBwVnlmU3BjRzhvU3c5L1pPWjRhYUFsQW9T?=
 =?utf-8?B?ZWk3VjRIZCt0SG9RTlI5eVAvQlZkRXhXOHlrbE85UVNvSGlXMWJTSXlIekN5?=
 =?utf-8?B?eXJHaGZjMHFTdm5RVkJpajdMTXVMNTRXZ056VWE0VHd5aFZIRyttNHliNHh5?=
 =?utf-8?B?UXRMUWw2U0NqOG5saWRXeXlERitxSHpVWWF4dytNYmsrWFB0Y2VxaFJsR1g4?=
 =?utf-8?B?NXExMERNTTRBY2ovZTlkc2FoTENIMk9iZ2F5cFFiZE51QmpLVll6YkFTRGVW?=
 =?utf-8?B?Wm9MR2JMdDlPWGZMZzBDaFY1ZWp3Q29EVktMSW13ekc0eWF4OTVmaml6RmZG?=
 =?utf-8?B?RjZ2R0lWNlhaNWQrdklxdzV1WjRZdEhqemdic1JRQkhKSDJxd053MzRpNDZP?=
 =?utf-8?B?R3BGVFpJUkl5bGJ0R2Zna0MzOU5xdWl6REZBMnZaNEV4LzVQUWIrTzRwOTNZ?=
 =?utf-8?B?YVFqR2VZaUYzWjdnWjJReTloVndrcjRqbnNqWWVqenN3ZnFxVXVlQlM1L2x0?=
 =?utf-8?B?QXJxbUZWN3RoREFPWS9aakFpMVVpMm92UXNQVFZTMDRZUGFjUWR1ODNTOEFT?=
 =?utf-8?B?cU1xekhZSmdaM1JJNHgzUGErb0VObFc1RzVpRjNvNnYrRzNtanNuem9IV285?=
 =?utf-8?B?UmxUb1JGMUx6OUo0Z2NZSWVWelNaZGo1c1VGWlF5d2ZHSzdZbU54TmkxbHpr?=
 =?utf-8?B?cUZBN1V3cU9NWnNRZnJlWVl2SWgyM0VvZVpyWDlXeHpHaFpjRzBCOXhVNmRi?=
 =?utf-8?B?U1d4TVRVdHVhZVFzOVBIZnJveGtsMUl1RHhPS3dTMThjMHB4Vks3WGk1bnBW?=
 =?utf-8?B?eXZnM2thK0xIY0IwOXpaZGpKZ1RibnN1d0k5eDRKRVBvK2JZM0JGcEh0SktM?=
 =?utf-8?B?VmozekQzckYzaEUvZk50anFLOXRXYTNCWmphb1MvdTBkY3doRTl3bkh2ZUp5?=
 =?utf-8?B?djdHbzVnMktEZTJUcmhEYUFOZHlNalZ1UDJ1MkRiRnZnRVNOZUtCdzdVdDlM?=
 =?utf-8?B?WTZCKzlqc290djZXVHNyd3ZxZ2swb0ZjK3ZPSkJkbUgrZUswTklqRUZRaFF2?=
 =?utf-8?B?Znp0aDY3S3d6cC92Y28zRE9pci9pdlFKZ0d4VGdPemc3a3E1TkkydzdOdEdJ?=
 =?utf-8?B?cDlrVU5pWTRKeHhBYjFRL1pZd1ZlL3UxclRzaCtJMzhlSUhOL0x2c3lLcFJ3?=
 =?utf-8?B?MGRINWZBNEIydWhsZG1RL3QwMzJ5aE1XYVhBNGliL1dWNVllam9jREtCTXVu?=
 =?utf-8?B?SjU2M2Z0emtNaU1KblJPaVhWT1RIR1hMUldqVU5GcGQ4cDI4NHVkeElablVX?=
 =?utf-8?B?cDl2YmNrMXVHRDZ1V0xId0doRnVZRHBaWXRzcVUzd3M1V1FLUTl2TFhScndU?=
 =?utf-8?B?MWVRYit4RVI2aDJLbE1zakdURUpxK2U4MnU1RWFKTUE3NkhxTmtBdmNDN3ZM?=
 =?utf-8?B?bEFhbXllV1FvSVNsaEdoKzlhMnJBSGxuamNvc1FPZERZTEcyR1ZXdUxXYVVJ?=
 =?utf-8?B?OGp5bWJUcTFnVW5CVExYMWNCbHg1S2F0MStBUksvL3ZDU0JwVXJ6eXFtK1Vu?=
 =?utf-8?B?VEdFODZrU1o5K0RMeFBTVFAzQndpNDBoMlBwc0FGNGFFOGhQeXo0WTAyRTlw?=
 =?utf-8?B?U0ZXeDg1emU0K3BEN2NJYmtlTGlPbENiVWN3ZHozaXd6dkRGREhTUWdOQ3Fr?=
 =?utf-8?Q?MaWRbV0QM1j7u2uAWv1SgGsWd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaac695d-8e3c-4db9-bb43-08daa5f12214
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:13:50.5081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVsLdljVVbAfJee74ZipLNEqr5Ok4CyW/1BOX6eBPzdnblktTzyGVlobYU18BhR8ocoSA4q5CEubQtOFK+D76g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214

As it turns out populate_memnodemap() so far "relied" on
extract_lsb_from_nodes() setting memnodemapsize one too high in edge
cases. Correct the issue there as well, by changing "epdx" to be an
inclusive PDX and adjusting the respective relational operators.

While there also limit the scope of both related variables.

Fixes: b1f4b45d02ca ("x86/NUMA: correct off-by-1 in node map size calculation")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For symmetry it might be helpful to change "epdx" to be inclusive in
extract_lsb_from_nodes() as well. I actually had it that way first in
the earlier change, but then thought the smaller diff would be better.

--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -65,15 +65,15 @@ int srat_disabled(void)
 static int __init populate_memnodemap(const struct node *nodes,
                                       int numnodes, int shift, nodeid_t *nodeids)
 {
-    unsigned long spdx, epdx;
     int i, res = -1;
 
     memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
     for ( i = 0; i < numnodes; i++ )
     {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
+        unsigned long spdx = paddr_to_pdx(nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
+
+        if ( spdx > epdx )
             continue;
         if ( (epdx >> shift) >= memnodemapsize )
             return 0;
@@ -88,7 +88,7 @@ static int __init populate_memnodemap(co
                 memnodemap[spdx >> shift] = nodeids[i];
 
             spdx += (1UL << shift);
-        } while ( spdx < epdx );
+        } while ( spdx <= epdx );
         res = 1;
     }
 

