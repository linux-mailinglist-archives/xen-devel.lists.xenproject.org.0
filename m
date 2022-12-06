Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B16443CC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454832.712384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XYR-0003fm-1A; Tue, 06 Dec 2022 13:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454832.712384; Tue, 06 Dec 2022 13:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XYQ-0003d5-US; Tue, 06 Dec 2022 13:00:10 +0000
Received: by outflank-mailman (input) for mailman id 454832;
 Tue, 06 Dec 2022 13:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2XYP-0003cz-Jb
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:00:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0380403-7565-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 13:59:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 13:00:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:00:05 +0000
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
X-Inumbo-ID: e0380403-7565-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPsoZGiqjMT/WL/tNk9X914l0ikxfyNR4rCwaG3Oqch+OcdzUoz7CAZd/BwC19y02mktArfIwoDhNDYIkGtlaBjqb/Rgs/zAY7AQkwo1V8Qrqot4OzQOSYtgl5d0Ym++QezNwPSyzPQrWEOs7sZTwIAMRdUIStgm+AJP8KGX6eWBYoYZt81lJZu0Nc2HU9DY/lYgpxK35kM8/O9KphOraGSLkYE1SGh3y7+5de3y86YR9lkvWQMK5LVqrnPUIeyh7s8EUdQD56CehqCX0blenaPXhNlOqugZFJPtx2bx4Bc+BlU5gBTbklqQdWCbSlTHvefvQG//WlcOH72CRktJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uo1HI2wxCeGOb4dkJghuzUxBu03Az2/vKx/ZOpRpwB4=;
 b=Z+Gs+8qg59/QhPH4GJja6VBGY04IlZ7hIqIcOaoiCDt9jOvNIEo28gRRvk8S5Rual4NN69QKkecvckjs65sfuSdR+E9Xd4O51SmTgvb+3dnSNrvaJQ1qmCvsVHZC4rRCdcGaINmwTPOBxUgefJ+aBSc9GJP0wX2J72jWH1s7hw4f5x2tK1zJW6Kr3TjRB3qV9xAr1kCjgStH1BRWop2Wkc/jAqizH7kFOKCFDp6/PGC/pAIcA7YytZ9mxjNismSXyloQwcyP6ZQe7BDGB99JIt/CXjLpeVsqUm+M4zLvSpaK7R58mytTbnz1i9fqzVhFBxxmaBC5fGFSspf1Jqfc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo1HI2wxCeGOb4dkJghuzUxBu03Az2/vKx/ZOpRpwB4=;
 b=SgS4RAPl/NZh1F1LTWTCz6SlFbZ+HwCNIscG1sQbncHj47Yip/n50aERyfNH8qd3jcholx5moH4kmP+jLrcmuyY82J11GwuySVEmE84ilu084JckuwV5vx13NmybxCwPXyJ2PyS7UaXCSdqlb0641saq4obOi1OtHbmGDps5R8fBNj8VGnsl2p3mNF8d3PX/kWkQULZup/siKFJF3IaP8k2xdjzHvoX0NeoZwSS1B5HQ1z1juQNdcm/Lt69AeX070pDWjPNlwWy72AAG+HdB0fb7u3NhVkFElF6OdAGCftaw7EuDnTypHnvbefujXfgBKTrxvutw8ca35yiBUo/9Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8462a401-17db-1b34-de7c-d0407ffd92e1@suse.com>
Date: Tue, 6 Dec 2022 14:00:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/HVM: drop stale check from hvm_load_cpu_msrs()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b71944-7f73-48fb-a447-08dad789cbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PJR5xsBM14HFCAZH1T5UhlDbFCquWXcj2zNK3QczjoANSZ/Ks3L91vdAwzvn1/PcwgqO81RRgDlkXTMN2LehDeZzQu4ErZLvxuYcvkFuQvvYkPsGkHZOXqA6YqSCsFZ9f0CIWD6Qg+UFErXIp6F3ybIpO2hI+nAFVFRhu13A+377Cc+qIUIXOHkBp19F6E3vulwTLOoGpE7ZlYmK6HM+XlMqNLniQwoFXVAFRQkZovjJNBsUC9DJwLutF7xRbMTi/ljTu8PtDAra1KeZCfXw3nC4tOH8CBocWpGlXhl0H2mWu5soRkGxTJbDwDdOfZxxI/qxwYQgJ/2+bpyFKubWD7n9IjSCP++cYMj0aGwMP0kUHlx84t0+0bBVRY2OqUt4uZrs+6NWfVpZJdr0M7NgZFouijhnbusJWU8+NnglRtAweP/1geMTPfyaEx5ELkUApCLtW4q8VeUSRpepAHFSX4CfaU9JmA7U2h0JGGJiTgO4iRbVqbTCgWElCkYTgZOeFLFayWaZUTKluWoz9wSYr0yx2CiamLGnOPQMXdyNXgGT/jf0wPUSjyZFQDD+JRVHE3MMHP2NnB4E1J6FstH8Gyv3qFhVi6fUyK4iD1xv6znwhAB0Ead0UpsP2itimTRCF5OuqPwnl9mFP3GQRHhDRUx7f6gr+NOm9uGJJKeIUWezqLbjIpfUtQo8IwZ6cfBAdRXqnOKamQ4qF6RUcCcsDt5ypDvMLp4FV5FIQmwFL4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(86362001)(41300700001)(31686004)(31696002)(38100700002)(5660300002)(4326008)(8936002)(2906002)(8676002)(6506007)(186003)(26005)(6512007)(6916009)(54906003)(66556008)(2616005)(6486002)(66476007)(478600001)(66946007)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTAvUU9ROTZ6NUlFTlRRajE2Y1BBYndFQ0dUT2tUQjZiM3VUY3ViRllZdEZu?=
 =?utf-8?B?WGh6UWVta0xCVmxuMnBWZUVxblByaEdoMVRBQ1c0dWpwSkRFeTd0emp4WjZp?=
 =?utf-8?B?NFdQc0F2YlZyRFJyM2g5Y0p0SjZOcm1wT1ZFM21ia0VDdCt6S0p3Ym1qVFNj?=
 =?utf-8?B?Zk5xY2tSQnQ3Qm1NandqQkQvM2Qyc3VOeUxGeEQ4enBFQmlsbzZnbmQwY01j?=
 =?utf-8?B?MEdnS3hzZ2Q5eWVHTHN5aE9Hb0Y3Y0JhRW16REEzVnJWZXBlcVVZUnR6c1BV?=
 =?utf-8?B?dWJWakNCS2FMVnJOMThzL0FwK1ZZWVV3bDFIaUdMTk9wZlVXTWplSkkrejNX?=
 =?utf-8?B?WUNUdkJHUnU4dU1aVno2VFRmZXo5S3RiS0E4U3JvK1BpejFYUXpKME96NVd0?=
 =?utf-8?B?VG9KaVRjeGdZWmRPb09iMHZYaDJ3OEkvZUJNZVlFN0hsUm15UStIMFlTdjh1?=
 =?utf-8?B?Y3AxdmtIellCMFk3UXVGcVYrSjNpTHRWYkJLMmpKeE03SldML1ZrM0ptbEJs?=
 =?utf-8?B?MU1kSnBpNTdPZ3h1ejBnWEplS1Yva2pUOUF1clZjcitqclhsZXRoZElWT1Z1?=
 =?utf-8?B?RktKRUpWVTBmYjZ4V2Mrd3lGa1k3NTZxTFc5K3BzTTRVUEZGVTA0YWI0QTd5?=
 =?utf-8?B?Qk53VXFkb2V4bmltclZzQ09qd2F1YkM0U21KQ3d2T2xhcUJKeHNKRVpoL0U3?=
 =?utf-8?B?elJtaXRlVDYybjJrb0VaSks2NWlvYjROSi91VXVHL1hNTnl5dVREbUdlK1N4?=
 =?utf-8?B?VVdTVDF6TWh2ZFAxTTk1dUV5bitWOWRYRVBZUDJiZVJ1RlM2aDNFcG91WHFH?=
 =?utf-8?B?cW02Y2ZJcjJmQWl3N05qM3B5SE5va0Y5YXFab2R0WC8rTnN4RUFrRk91bE0r?=
 =?utf-8?B?OHlEQ01CQk9WdlF6Z1FRVmxraFRSdHNsbkJkVmI0QUVtZ0NPaXFpOEt2K1Mx?=
 =?utf-8?B?SDJwQUY3MkgxdDJISUw2RTh1UU1qMkEreENQZkxBMTVqN2M5U2htcGREVTZV?=
 =?utf-8?B?MVVCQVdHaEpOM3hsOTgvWFpQZFUwc1lsekdkdTY0MDVZaVM1UDhLSWdvNW1E?=
 =?utf-8?B?Ykg0aTdDdWVWc004T3Q1dGMvMUo5OWRzZmY2NzZhWkpxMEl0ZHNSa0VRWUN0?=
 =?utf-8?B?MlFBWXJWRlp4RE5UcTF0MCtKL3h3bC8xYnZMVEZBVFBhMUprUjFRSlk3eEJj?=
 =?utf-8?B?bjNiNTdTZ0M5aDFYT0xKL0lzVEV2c3dFbFU2Q1RyZjUrN2NMbjE5ZVpuSkMw?=
 =?utf-8?B?cHlZbUQ5Qlc4dU9UK1UwNWNQSHNWcFV1TmdvOEFraEIxNTkyajNBakI3MGNC?=
 =?utf-8?B?eFlucnkyUjBHZHlUb2tkai9aU2lWZXpIaDM2RDhWVkREangwQnVsY3Rwd3N4?=
 =?utf-8?B?RUFnU09reVl1dUl3YkpPZE9IZFQwcmhiYXF1NWEzZEtvWTBXTS9wT1QxaXp5?=
 =?utf-8?B?ZjQ3Nk1naHFNdkd1djVCNUpCZFVWTFJLWU13QVJQKzVCQkNUL1ZVcjRMV2Nj?=
 =?utf-8?B?c3FVN2FLWmh4WENaQ2JDQUdkNmJmd1IzQ0NoNG5RVUVFdmlic1k3czV3VUZN?=
 =?utf-8?B?RjgySlBJMUxDWUFIbEZKSlI5Y0RCaEN2NVJRWjlSWUxneU9qdnFkZ2ttTU9s?=
 =?utf-8?B?dVFDa3dWRHZ1cFF4bXIxS01Rc2grSzd5TE5TNGJrNmVqZUZQbUUyc0dzL2pB?=
 =?utf-8?B?M1JzdEJzVGZUTlpFYmZvMXU1ZGc1d3k3RTgzQXB1NUNLQVNOY29QTUFWYisz?=
 =?utf-8?B?SkpubnBuN2VVWFpuZDhodGZBUlB3RHhXeG1HTjNBN0hmRUlFVzRYZzNyM2Fn?=
 =?utf-8?B?ekcvcm91ekZkeDJaQXI5dWUzVTRnMkFZMEx2WUxvMnlleGd3dXBoQmVJYVI2?=
 =?utf-8?B?T2FVbFFpb2RSQlpaVE1TeGg1dkhnS3Rza2FCYWVsUjRhbGFnS2IrRUNpMEwr?=
 =?utf-8?B?c3RjdUI0b0VqZEtkdjVxRzkzOHU2NHI3ZUNoV3FMbGxGNlMraW1vUUFXaE1W?=
 =?utf-8?B?cGhaekN5bmFKNFRqeHRaYnJ3b2R3YkYxbUI5dDEwcUVxYi9rMVpST1J3MEJQ?=
 =?utf-8?B?MUI4bUViMFF5cW1Bb3R4SEI4TFM1d3pmSjYzdC8zdzFJNjljNlpCQ1lMTFU5?=
 =?utf-8?Q?4yaOAL6GTHwnzJ1UjMPMjWFyk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b71944-7f73-48fb-a447-08dad789cbe3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:00:05.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyuPCdJZKQPvY5CjE9ppyCXozTCh/xJ3aZx5PeoTaoEgsVhz2cs3E40GOn1SoxabZGBOUIkGDMAIQ/AZ8Y7Fcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

Up until f61685a66903 ("x86: remove defunct init/load/save_msr()
hvm_funcs") the check of the _rsvd field served as an error check for
the earlier hvm_funcs.save_msr() invocation. With that invocation gone
the check makes no sense anymore: It is effectively dead code due to the
checking of the field in the earlier loop.

While dropping the conditional also eliminate the "err" local variable
(using a non-standard name anyway), replaced by suitable new/adjusted
"return" statements.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Remove "err". Amend description.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1428,7 +1428,6 @@ static int cf_check hvm_load_cpu_msrs(st
     struct vcpu *v;
     const struct hvm_save_descriptor *desc;
     struct hvm_msr *ctxt;
-    int err = 0;
 
     if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
     {
@@ -1479,7 +1478,7 @@ static int cf_check hvm_load_cpu_msrs(st
             return -EOPNOTSUPP;
     /* Checking finished */
 
-    for ( i = 0; !err && i < ctxt->count; ++i )
+    for ( i = 0; i < ctxt->count; ++i )
     {
         switch ( ctxt->msr[i].index )
         {
@@ -1495,17 +1494,15 @@ static int cf_check hvm_load_cpu_msrs(st
             rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
 
             if ( rc != X86EMUL_OKAY )
-                err = -ENXIO;
+                return -ENXIO;
             break;
 
         default:
-            if ( !ctxt->msr[i]._rsvd )
-                err = -ENXIO;
-            break;
+            return -ENXIO;
         }
     }
 
-    return err;
+    return 0;
 }
 
 /* We need variable length data chunks for XSAVE area and MSRs, hence

