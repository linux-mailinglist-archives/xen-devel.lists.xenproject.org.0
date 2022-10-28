Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60B610B35
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 09:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431436.684341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJhK-0002lj-4F; Fri, 28 Oct 2022 07:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431436.684341; Fri, 28 Oct 2022 07:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJhK-0002iF-11; Fri, 28 Oct 2022 07:22:34 +0000
Received: by outflank-mailman (input) for mailman id 431436;
 Fri, 28 Oct 2022 07:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtyv=25=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ooJhI-0002i0-Lh
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 07:22:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2089.outbound.protection.outlook.com [40.107.104.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4902870b-5691-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 09:22:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 07:22:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 07:22:30 +0000
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
X-Inumbo-ID: 4902870b-5691-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSAw//2uDBvNDvCJ4BvfD2gDBZuxtf8ZJuYTaPp/ic7C6qCZgNlZQmcxTaKCuEvQ/1qNOnTKWarTVJ5z25G+zrhhE7TIyiL4iPrk1m66ERRhwPrHqiI5lKW0XyuknNVg4UrbUMytxUn+XWcE1Y1qX96MqK3knqSZFL3yP/2xW5MyjZ1B7qnhR+aaszO1EOGDu+qKHliq3eM/kgv1xzNqeG0jdEOWE3+dojI22tmb91vrRzh7v+5/3vzeB5/hV4awsbHFWuaz10ovgrCwXuNNkTH2WT4Moo5Me6OuAVOLHBrlvH3DNsxG+F1pkf6fFLyexlvWLXrDxLROWUc5k2Ck0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+zkDWf3de9+bRGdDawZnuvAUtR92dpvUXja9wCTUW8=;
 b=Sv74S8fykyVhVcgrsoWjdX3KKe1qoEs8wwyGGZPURZVlRBeTlgjKymayqL1Ii7zNdYdOYm5Ck7Wyy02bzm7XC0v/D0kN+7y2u8uthHeytlX9eej/D/WQLlUSaiJi/UQIrTIporFS9R+GVYbhDXTrnWUIlFYZW3YQ/ch5+wU6sZjaeTstQ7y0fvvs5vPsJ5+tWYhvBdQYVpHiHmTJxF/qa8SsGtOQHKPo2ectnqn6RWZOkOYGYVYV89VHsX62qSA6MNCcxlWEhk6REvMK3cHej9R60vABkF2SpUe1A3NN18vzQuuQGQh/11k6goDbVP63eysAvbp/GSXtHpykHIVIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+zkDWf3de9+bRGdDawZnuvAUtR92dpvUXja9wCTUW8=;
 b=H3clkn4Ehg5x8XmUIcvkp4R7no48XoBv7qXbtB9g1miVWEWOb2gSgf84q6Dd5JjilQP4CUczMBnTStrLiTDdteu4ys2+YNNRsF434C9hFXCgmWk90AqGOQURmDmG/UNKhA/s3VwX3dUSCRMosDgrmI2gNsmgUSq+rfYw+VVR3AaiYrLE4hixelSxymqdXcu+1ECzst6lTz8GK6pg2gx//DTkhhqJFvfWVMhRe1r3wn2bamc1xXfnXHqX3NKkgVzX0PbSd7fI+7se3bEaBO4c3EqBeoNkDw3b38fZ6jjIcEGraw6TlMy3kTBPL8NX4pNkzgzfjI06El2QccsB93/U6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07ecca86-97e3-555b-78fa-d9cda765805d@suse.com>
Date: Fri, 28 Oct 2022 09:22:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH 2/3][4.17?] x86/pv-shim: correct ballooning up for compat
 guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
In-Reply-To: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3dcbc5-1abf-4607-b990-08dab8b52c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a/KueU2czSe9Ewp7R27kEH0LqYxxXuKwcub+w+dTvp8tImgbGyqCFLvPLOFCKK1X/4mL73DRBSpOB2qr92TxFxrlCSjiRquzzG9RoX8nrjfRFl/3S9qKHkovKQIAH/2l6Rhaq1Sy4/TI+x3pc47V4cgN3rL8PJL9YAbImiTaUhN6BVFw+hwOSbiJ7CxSOPzCh483aOgnr125O8hjJoKs6Rl975sLRiE3u4U7VkLr3Ej4pQiDAoXGV/Ho+usMTsEo+J1HBo3GxjEzI7nxdY2ZYvjYTPOoWbgxi0Txl16TIxujYaZWt/wXK3eteqppBuR9Cohh0kFq5xf8LPlz6/GeS0pqGI8+np6XOq/Zd/pb3xqxnOdgjIgRS9Qc+rzVVvdTFvbz3qHWQXxt85X7uqcRzJXmVk+0DB5yt3T/doeBe92ZP09peGz+ctvd280pgroXIRmi5v4ErPuqchIyQnKSakGHTWj9RjNhieI/CzRmtwwxkTIL2lSVIXtErHnGXvcNbxVOLw/uUkbMhqzQrmheShwIFW7zBVH4OVbwfbJbKvRRGXktsL5dCerI834YobsdTDpt1uQuGtLdddHnpWE2bcUn0HGx70IWFcYRObYPauHXW+n+E+cVBwqA1tWlvNFT4hAFhZsdOeXc6wgHufZ84V/X6W0ozBcFcapZzOEN1gqXyVOD0g7Xc9EzPbDcHq4wLpX8an50+l4SxB1giHIlorAELbb3d+1W55pxAXgnLFrKHlmMdw8uJ2Yg+VkJeMQcKBY0Dep8v7VeMa8P40TjiKO10+dNaUmw9qtuw/pfqLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(316002)(54906003)(6916009)(8936002)(5660300002)(2616005)(186003)(4326008)(36756003)(8676002)(6506007)(66476007)(66946007)(66556008)(26005)(6512007)(41300700001)(2906002)(83380400001)(86362001)(31696002)(38100700002)(6486002)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1NzU3hGYXlrZnNwOURrWmFZQUNlQXk5S0Vlb3V6RlJKdGNaenBTMTRwRHpZ?=
 =?utf-8?B?azZRN3FvendVU1VVNUVUTXRSeWZmUG9SWW8rNG5kZFNnUWNEZWFFSWNoelNZ?=
 =?utf-8?B?TVd5enBQMHhpa292Ni9nZUxHaXFVcW9OZWs4ZXlDSk11RHVkbWFEK3hsWWJq?=
 =?utf-8?B?cWcxb0d0TE8vNkNPT1Fqc29ON1I4bXErMGhGU010TWNDeG9PSlJaaWhHcmJX?=
 =?utf-8?B?Qm5GenkrUlhNZUdUZFpBNG9JMW5UMHp1QTdoU1lqZk16Z2pWaUdsdDhNVmQz?=
 =?utf-8?B?WGxoSXpESVFqMFdoaE5zSGlWUEg4YXBBN0NvWERsSDc3SzVkZElmbE9kbTEz?=
 =?utf-8?B?WVFnVm0yMFBoY0dsd0JQUC9sSUp1UFJ4ME1ZdGMyQVJkMUxKdXpKS2hKZ3RI?=
 =?utf-8?B?THAvU2NCRDBLeFAxOURuZ0ZWN3RMc2JpOGRvbVV3b1Fyd3ZMZTlDZ0Y3N3dn?=
 =?utf-8?B?TlV1TDIwSndMeWhkblorWXEyNEtCbGtVempZZytmcEhBaEIwQk1Zayt1Sko3?=
 =?utf-8?B?eTBvUFVRRzVkelpocGsvMk9YdDJkRFJqZlZEeUZhbWFuMmkxNHdReGhaOHFl?=
 =?utf-8?B?SzRyTlhRSUkwYWo1MWZ4QUZjVUNHUFhOeHJ5eXN3SW0rczhGbWJtS2hBbytW?=
 =?utf-8?B?b3VXS2U5RzU4TmtDbHQzMlA5dFBydGNaV29MK0w3d2gyc05kWFpkS0lMdnVF?=
 =?utf-8?B?Z2NjdWU5UWhwRm5YZlJ3NGpXb0s3UXUza2FhYVNOeFk1N3FhdzYzUHhQMW5x?=
 =?utf-8?B?YkgzN2liMytHQVd4dVh5cnZXNnpRZmVoWWwrbEkzMWpMNDdLOVBxeWovWlYy?=
 =?utf-8?B?KzJBSW9LRW5Pc1gwSDhnakhzVHRKR2l1WkVvMDErZFc4WFRuWHZaMThySlNZ?=
 =?utf-8?B?U1NLTWdtZFZkK0JuVExjbDE2dVRseDI0TjFLekU1Wlo5Tk1oa3ppTWl1ZTRI?=
 =?utf-8?B?SS9vcHFJejU2NDR5OWRsN1ljN2VWK2ZwYlZ3OVhPWGZ6QjJnRU5Zblpvbk1R?=
 =?utf-8?B?eXpNVWMxb1J0VnluVXNpa2RpNjNnbURmaVJnYmJtYWNyQWFEZXJqd05nbzZX?=
 =?utf-8?B?aUhTWWFuVVJXZThDL2dYSEcxSHUzb1E4WldRcUpIQzNuVEQ5Nnh6ZzJaNTBS?=
 =?utf-8?B?d3FjWkxNVU4vUWhZcWZBcGkwdm94NndVd2NiaGF4SzhmemU1dC9ITFdFK1Bs?=
 =?utf-8?B?TW1ZWmFoQVFGTE11a21wdWthdmE3RnNRdEhaRkdhMml6TE9ER3RDRjBlVi9T?=
 =?utf-8?B?Vng5VXlGY1pzVUdYR1hVSkhGSEhpTk1talFENCtSZlBMajh1NlQ2ajBOa21w?=
 =?utf-8?B?ZXNOODdramd4Ynh2S1FabEhiTDd6VkErSitOa3NtL1NNSjNPMi9ySkxmeEp6?=
 =?utf-8?B?NzBIQmcxQ3JOamVhWTFtTTY3S0FTSWp4cmNBclFoN2NoaXpaNU5pWjMyQngx?=
 =?utf-8?B?eDRPZGVwdzg0djdSSGFhYnlTTnpFM0Jnc1FsTEV0UzN2L3Jjall3UHBndVFq?=
 =?utf-8?B?bHVxZDBsMGJIZDJ2ZEhCTXd1LzJaVnBhamlDMnlSdmdHMS9RMy9KY3FZMHN3?=
 =?utf-8?B?MkZleWpnc0dOMkNmSWpzaUU1VGlqQ2lPbjhsdXBrc1pwRGluTVB2ZDYzRVJa?=
 =?utf-8?B?a2d4dyt2N3lWeGE1REVvNG9LRjhPTmdDeUlDZlFBemF6MzVUL3RxSVFLS2dI?=
 =?utf-8?B?c05CSHIyMEhPVFhDMkVockZnczN1cnIrcXU0NDdudFVRNHVZM1BQT2NKNnda?=
 =?utf-8?B?U1dZRyt4cmJnaWlTYmFEQ0tocWNUNi9MUmZ4Mmd0emVYWmRLQ3RhOGJvVjJ5?=
 =?utf-8?B?T0YxWWJFUFpKU1p5YmRldzJhbjNyODQyWWgzMng0Q3N4SzQrR1oxaUdGNXFC?=
 =?utf-8?B?SzlkT1FUN1JtdjZHbzF0cWE0RE5seTAwQUtuL0tERFg2dmRhUU82RkxZNnRO?=
 =?utf-8?B?QmlkOVYrUEdyWVBaS2t1TWRwd012RVdiOE9sRElKaE8xWm1XSk8yU0xHUTdj?=
 =?utf-8?B?aUI1RHlWK2lNeXRuM2o0Uy9temZmd2JmeFJCa2xJQ1pBNG5jSDZmNGRFZlFH?=
 =?utf-8?B?MWZLMUJlWTRrV0JNNFljbXVIQmRkbWp0cEloN3VSV3ZRK1crQVlWcGMveG5q?=
 =?utf-8?Q?EegZWPXcizJIBd47nuHbfGAWg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3dcbc5-1abf-4607-b990-08dab8b52c61
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 07:22:30.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1837UEFakiNuzQJsfLSQ4m+V+KTvb9jC3T0Kw8wrTHbJ2UndCmOsZj/NfdUJW4WgmDFqw2AXJaKYAeeQqriFbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Igor Druzhinin <igor.druzhinin@citrix.com>

The compat layer for multi-extent memory ops may need to split incoming
requests. Since the guest handles in the interface structures may not be
altered, it does so by leveraging do_memory_op()'s continuation
handling: It hands on non-initial requests with a non-zero start extent,
with the (native) handle suitably adjusted down. As a result
do_memory_op() sees only the first of potentially several requests with
start extent being zero. It's only that case when the function would
issue a call to pv_shim_online_memory(), yet the range then covers only
the first sub-range that results from the split.

Address that breakage by making a complementary call to
pv_shim_online_memory() in compat layer.

Fixes: b2245acc60c3 ("xen/pvshim: memory hotplug")
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -7,6 +7,7 @@ EMIT_FILE;
 #include <xen/event.h>
 #include <xen/mem_access.h>
 #include <asm/current.h>
+#include <asm/guest.h>
 #include <compat/memory.h>
 
 #define xen_domid_t domid_t
@@ -146,7 +147,10 @@ int compat_memory_op(unsigned int cmd, X
                 nat.rsrv->nr_extents = end_extent;
                 ++split;
             }
-
+           /* Avoid calling pv_shim_online_memory() when in a continuation. */
+           if ( pv_shim && op != XENMEM_decrease_reservation && !start_extent )
+               pv_shim_online_memory(cmp.rsrv.nr_extents - nat.rsrv->nr_extents,
+                                     cmp.rsrv.extent_order);
             break;
 
         case XENMEM_exchange:


