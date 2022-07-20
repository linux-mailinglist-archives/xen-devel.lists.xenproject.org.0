Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E686157B7DE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371856.603720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEA4h-000591-8a; Wed, 20 Jul 2022 13:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371856.603720; Wed, 20 Jul 2022 13:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEA4h-00055d-5G; Wed, 20 Jul 2022 13:49:15 +0000
Received: by outflank-mailman (input) for mailman id 371856;
 Wed, 20 Jul 2022 13:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oEA1P-0002uf-SO
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:45:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00089.outbound.protection.outlook.com [40.107.0.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4451eb4c-0832-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 15:45:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4431.eurprd04.prod.outlook.com (2603:10a6:803:6f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 13:45:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:45:49 +0000
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
X-Inumbo-ID: 4451eb4c-0832-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0JfG3Q75Q9RDZAidxW0xAAAIITouCF+AlX/kI6cY38kpuiXZXJi1jMw1A/1lmhTz3GVYY1wXtxVh25LGp94l5Gu0oS4nlWlyXewKVOtE5hHfs2TOjOVE0vN1fOLtmQs+m7ZgTsvdWLM9yTEQEZV+CkUHvNp7Klm0wdtbF1cYGxXPI/RVCU/xvMMPtIjf5DjeyEw8EZvcaGe9OePWsrvxdjhCOGfRxyDHr+lbWd231Nd4jkMChRXlKUbTBhsLIrlqNIcM2XsAJoMQDNSzdmmghi3OMJmZrWErVXKJHpkgswMehALLTlOsf4ZqQyURUY4lafPZ7lWC334C+WlAFC3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS/yKL4oIKTxMLrQEBaAASlunp0O/VzrpFcEz+o5dEA=;
 b=TwjmC9pryJZ3mpFKnzQpw2DYp5syvY/5psZkeJmp1qrnVWJKughySEeE6lGlhufqXkxmDTo5pDVWPbv+V8Od9UNexC1jnKURRBFJPlkqGC1FRe0EKa5/bLgf6mfWFQ4c/zdXodMJEoT87nt6mnVve+6obYoeSBSks6ZbBFs3dOFBw+aL2/s+9Qx9ap95mB8DBODV4KFl14x+JfqnU8XxKrJPrPDCJKTeeb1MryDe/Ym1ygaVBqPh1twCELo2I5mbF5FkFB0fH2HcggPRe+AgaGTCogG5sF5FHJOgA/VsFL/nXc1yjgGSPDcB80hBHlfidOUK4paupxkK0ZD/xyWGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS/yKL4oIKTxMLrQEBaAASlunp0O/VzrpFcEz+o5dEA=;
 b=20Q0HHJQlqWYof6fbs76SXlTyS61VB1Rj/s1a+8ttJxeHhpwJEA+5wcrV84IM8TsMmcXsh6VL5nQowoKE+FDVMYFJUJdfQ6T5ks89ZrMUjMn6Q1OfivFOlM9QuIFfEYntz4OSk5UfhT7iahoA7JZLbdLlz07dS9b1FGJ0VIOOL7aPg3pOgbkGIMAx1Xc39B9J8IByHDp/xmVoktCAnCUcePp9sqsA0QU5wcucjNiEP1ljDbUkXCK5MsoMFX9931O2NwMpe9LeNqRMkp8bBwO6L9Uljs7wKVRN88+T8ATemcOAHbWdFFiYV257uAHlYZ8No2gKsz1Qy+RfhimtBnvEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b6bed07-a500-4683-3b0a-0c82dde1c1cd@suse.com>
Date: Wed, 20 Jul 2022 15:45:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Content-Language: en-US
To: ChrisD <chris@dalessio.org>
Cc: Michael Young <m.a.young@durham.ac.uk>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d911e9-4c09-40a7-94aa-08da6a56278f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4431:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rbcUtvPBo3lla9R2fl4CjxkOk+Y9dk8tUl2mFGDaljLDXYv8Wlxpi760p5j+uolTO+Em8cQWyX0rqmIkYQkG6bnAPn7LZufY/Z67tVd093BYWHe4JB3QF+b3F7iefHYY4rasysb501wczkZ5b/fNX1Vjs5gsV5+R+1sugrioyNuocyGeOM+MjZlcoGdwxTd0fmmgO4dnfPamHSLNzlRWxAY/nKsuaN9rcOPRCwObNWAYQODcnST+/fKB/VxhEKYNbUYwyAKIleifMEzQxWRODe3TYfxWrmSaQtEnmcxc/5Rnu+2u7IcfbJUTt7rdMJuJ+Xj2iI4A+24mP7UcyNfRbYOv9hgBAFH8KiLkJ4S/PMh0xgfXbpxQ3NY5YC0oeINlJCwPY0IQ1CpgewbNSeaSka8yRJRdFDHarp+XHOBju9ABrceTG4/LIHwjvGsIUDV9IXSU+GvCqBqYwlt6fhPxFLT1nH0xlfNWjw/t9GqpovohXL83t9HihyPtd6JYnJ+z74FKhBFAxaADlSJ6ihohCOnAmfZu9SOXhkwqXYbV/4BYb3mEDZok4SYtttXv3/16tmBULE3avdjJ+lE7xMyvl4ecwKZ61gZdwtUqTn5SuzpAE8jNQy4U+Wl4CN8pJKoeP85dpNEcKCosthZaDeWHyNsplSEswZGEUniUlalNWfGlktU5y56HjSP21IhS+TuNNY0MTNN7EInYW6FrTInnZM+uedxSbVBZdueFgb4i5A/yX+yrL7n44mjAOOmxjyr7ZUTZg6sd19tk4cSnotlqDExOB2Wl6io5/LJ5GFmj5OvezMVSIx8Z8Fjq0qTiDjumZMsqIVcIKn8sv+z+2yeyiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(39860400002)(376002)(4326008)(6512007)(478600001)(53546011)(6486002)(86362001)(2616005)(26005)(186003)(38100700002)(6506007)(41300700001)(66946007)(31696002)(6916009)(558084003)(8676002)(31686004)(36756003)(5660300002)(8936002)(2906002)(54906003)(66476007)(316002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjROd3lFc3p3bzY3ZXZZUWM3Q0dMd2hKaWYySzRoUGhqdFl0cE43VUhDVnlh?=
 =?utf-8?B?K2lEcXo0RlNxY2tMTzBnZW84MnNobDkrbjRSVmRzcDJqQWloNmt2Q0tsMDZD?=
 =?utf-8?B?eEh0WUxxdnFmMmlHcmEwS21MQmwrem15aVpEUVNJMmhHZXVBbDNsWCt4Q0Z1?=
 =?utf-8?B?dXVqSzJTK1NSa3A0TVFwTFpQc1cxT1QyOHd2OWE4cForbWU1anZvUjlCd0w3?=
 =?utf-8?B?TVVBQXVzdHJsMjI4azJ6VE11M1M3QWxKWGVkdWw2MktxaUVjQjZhb1dzNnU3?=
 =?utf-8?B?Nnk2TVAvQWxJODNTbmJJMEoyVTM2MS9aR3N6MDdKbmRwcktldnVFMWV5MEJR?=
 =?utf-8?B?cDJqeFE4blJNN1ZmUVN2MTROb3NIUGlZM29qc0lsSTRWbThYRUg1T0JIS2xD?=
 =?utf-8?B?dDdKVkU3Tjlmb2FHVXdBcGZnbWh0Z2N2NXlUVy9VVTd5NGNGdjZhS2s2SUN4?=
 =?utf-8?B?WVNucWJzZ0RtT1NyeUhkMGppU0c0ai9RL3lkWEk3VGRDejc1aitmajJOVXdH?=
 =?utf-8?B?eGFSYW5pcEh5YVlyUUxyaWsvSndzbDhyc1N0ZmRiaFpFS1Vtc3MzTkxndTRm?=
 =?utf-8?B?emVFL3IrbU02cVpPTkhKU1l3OWEvVExReDMxTFIxWExXUW1MeHZpRS9vQ2VD?=
 =?utf-8?B?U2tJakJIT0JEZW9vcVllQ3p5UlhtOHh6akJlUTc2em9JMjV2WU9LZVZYOTRk?=
 =?utf-8?B?YXhVdE9KdVN3VkpvVzlGWTdlVEczWFlqVTBIbFl4MzJqMlNidURJWGErQ3Bj?=
 =?utf-8?B?V0FyUnF4dXRJTDRlS0RxN1pFbUgyUGxzYmloQU5kbU43OERIZUxUSEhTSnM3?=
 =?utf-8?B?dFZlaUREcmN5MXZQL2oyVWJIak1mcDZXcmtaOHVkMm83S3lvREJrbjdSQUN0?=
 =?utf-8?B?SndoTmVSdkVDREdPaFBIaFFaUndWMmkvYUtYL3grY1VOaTF2eHV2cGxac0V5?=
 =?utf-8?B?anFQOTV4UVRqbm9tZUFoQkM1UXlIMVNBVVV5YmJackNWUURSaW1uUHk2aW56?=
 =?utf-8?B?andUbXZKL0tFZUhhdFd1dEp4MlZQUkNDVktaTWUzTmxxNmtuTEZvMlFXSnhV?=
 =?utf-8?B?amMyQnlyRk1qMFlsVXRhU3d3QjZRVDBkanFjbjQ1OHo3Q0hwNS83SmhpRFBh?=
 =?utf-8?B?MHVxT0ptTmpUWFpmL3pMN0szUDdCU2xPZndNM1ltSzUzTUpwWFNDeWYySjFy?=
 =?utf-8?B?MEVDL0hPUDZRUFlxSGQyY2NrYnU2MjlSSE94R1ZXbVVEd3RFRjNnRFl0WURz?=
 =?utf-8?B?c1VtUGV0Q1VSLytWWE9OMWdoUklsdEhGU2lJZVdRODg4VlVIR3JpR2V2eEpF?=
 =?utf-8?B?MnZFLzcvV3lXVURxbFVGbTh6Rkh2Z1R6TEVBc3d1WDFIYzBGeXZSd09XMTZv?=
 =?utf-8?B?N0duT3pwMEdsVkZjcVJKa0FERGZ0ODI5NEREejhqK0tmSyttdWROVGh1NGhF?=
 =?utf-8?B?cFJrZUtoNzZuYUcwc2FxRmJxdkxUckZKdUtQMGp4QmFNa0NkWjdUQnhsOTJ6?=
 =?utf-8?B?MXRVeWlkY1EyQ202V0V2VjFhTldMS1RGWFhPVjZKZUZjWmhXOG9QbjNGeGVp?=
 =?utf-8?B?am9KejlzTG1UcVdGUUs5QW5nNEFTSzZ3azNmNUF3MVZDTlllSHA4R29XdnZR?=
 =?utf-8?B?WlUrNjBENVNZbjRKNXBLSVFUWS8xVVJDd1Z2TFAyZW1qbEhIRDF4Q3pyUHhW?=
 =?utf-8?B?WTlpeWZHYVpKSzhNRTBUTW5Zc3JCQkErdG5jcGtmZjk4dUFWRmhwcHdyc1Zz?=
 =?utf-8?B?MDdpRTJaelcyeTdtQlF2ZFZ1Tm84YVpFRzVsZW9FRTl2MDR2cFgydHhIY05T?=
 =?utf-8?B?cU9sL0w5UnpQTFE1VkFGZUNDZnVSZmFlRnFzWFpkcUgvMDFLekVKOG1YUlds?=
 =?utf-8?B?STBYOVZYQ0JDQ0F4VTFRUkVMMTFnSmJJbkNkbUJNMHlIbzlpZ3JGdStJa2dj?=
 =?utf-8?B?bjFnNFJURHFZSUQyOUhCQ1ZuVFRvamhoMkVSQmc0TWhQN3E0blJVMFpNRTV6?=
 =?utf-8?B?MTVsRDBhWWYzMjBhNi93b2FSUHN1NDUvVlpXMDg5RzM0UU9yMHRZWnBVcVpQ?=
 =?utf-8?B?WGRrVjkrckY4emZjbEJPeDFjbytrQnBPYWhmdVdOaHJiOXJYbUNlSnJtQ0ps?=
 =?utf-8?Q?l9P1WwFuFYc6fVuXP3c/Pj64d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d911e9-4c09-40a7-94aa-08da6a56278f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:45:49.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu0DiMOCad7TO7hRIRRvSJR9MwHgOXBsxtXyiZL5DAXiww6wHA3svx48oSNBYFxRvAQJgYGS5aTvRy3/TZoQoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4431

On 20.07.2022 06:48, ChrisD wrote:
> So, you think it's a problem with fc36?

Just to also state it here - it turns out we need to tell the compiler
to avoid MMX insns. A patch for this was already sent and ack-ed.

Jan

