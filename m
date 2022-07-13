Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B14572E72
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 08:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366223.596916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBWDI-0007Qr-2e; Wed, 13 Jul 2022 06:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366223.596916; Wed, 13 Jul 2022 06:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBWDH-0007Ok-W2; Wed, 13 Jul 2022 06:51:11 +0000
Received: by outflank-mailman (input) for mailman id 366223;
 Wed, 13 Jul 2022 06:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBWDG-0007Oe-O3
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 06:51:10 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30063.outbound.protection.outlook.com [40.107.3.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29eb5a86-0278-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 08:51:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 06:51:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 06:51:02 +0000
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
X-Inumbo-ID: 29eb5a86-0278-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX6C48tJt5wmRyuSr4zF1nCAXCDwEGozJe8BOWTuyicX5jOU7r2gLjp0n2u0zXdfotUEH74Hvng9CdMnJbhxKSXfZoFVIxvWZ/2rugP0zHRFJcggGs3SP/qKe+4fo28vxwqi3SjaQ5s0jkdLDQ+oCC3PsdjQvP3rthTUOVnZvrhtY1u0NaQ1gQMUngmjInrUork/zNVSN8xVK0gaqNK4rOD1/NQlW7ZT3eIvgWhPwOtDrLMEjTKnZa/IA60Ua9I5WOgFBA7ZxOYzDZScD7l9cLvGaSmr34Qe/u96XfbaJPxcsY60vuLwCiiXyk78o8vmNGP+GBWyhtSiCOPcDy4weQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NJRqb33foRIlRzv8CIxbgSgEp7TIiD2HG98JRKZKjU=;
 b=dPf0/si6A36CS/EK32Vzw6DLIjIgqz9aoTGMS097NUZu4I0H9Sn+fc3XDgFkKTvK/NmEQvc2QrueBCTdY51uH0pwjziBQMYQK9kOezuCMObhwnaj67Wfx2w7s8HDEsopF1XqjxOs1eR5Auq56b1kOU55qP1Rwf51vFBGQj3w8d9F+/ky0/Ccs6upnvPVIJrRqli9f8wqELJvitSbm9FVfkNtIKO2MVmy8lJUd3mlcLm+eM1fi6mrYFPwDAHlYRqFUi1JQNtLwDea5CuWbL1jE9B0e+LTqW53vTfrI3oERO4n4sd9B0RxmkXUIsuALngRwDy/QTcMQ32K3Qha6y66dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NJRqb33foRIlRzv8CIxbgSgEp7TIiD2HG98JRKZKjU=;
 b=3giUHwTPBLJ4zm8F05VJFR4OyuE/qFR7d5FFHPbtWme0zgIX+lziXKbqmi586ZCENWkoQVNCx5V0HfOXlThuJOr/I808ZTH5CuG4W4nN2VlrD8B3otRFM5aUDhxXzNSQAxz4RmsahSHWEyJCbpS5u0kycgz3TIplSSBXeIh/pdNe+Dctq+x6fUgAfh99eM7OrKA+KoG6yHNmMD7NmI63zhYDoVcToD3pjlekNKlAvonoPXfN25ue3m975zrTzZW2I/0F6sLci7fj73mNLOSX/VLDLQvUZkGJpwNx5KqkcMjuAP5QkvZ5Kfnzkhy5Q9x9HJRZiIhJe6x1QGmDRgCfOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b8c5d7c-ee0c-dad6-8659-5b4b339c2358@suse.com>
Date: Wed, 13 Jul 2022 08:51:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: log non-responding CPUs in fatal_trap()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b62455f5-f214-4f44-2a2d-08da649c0cc8
X-MS-TrafficTypeDiagnostic: AM0PR04MB7073:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZY8wOEhsthNuh8M/h8hekKJ3kBxp3iLYb1V1LpU7vBuvmI/BGN+ZSL97vR5W4oCKGEyRlHxFa4Umn/V7i8RNBkK/J3/C95SllG/0W6oA/mTeAwW4u4hF6MPYuxzxCrwMXQ2bZ+3UMZgohhCbsuW4C93Jg1ym3dKKxsOPgj7JV+Qt8sYuacgFvCHqsa44qCg2i9nph/Jy7wWWCNa31Nvxm4VGdb5Gju3AsEXwYXOppFxK7/6R4sm/B8rLAkvaa0iWdQf6f3LKuJbuKqxTok81q1HY8R3pbSwUPZfUpRpT3mvkU94/nP23kkQdFQj2b+zRroVNVMoH+a5GPW0H2ewq8yT/WIYkyz9M2MuRMRPXjxkRE7RZHwO5blC/R/1f1NpGI/dJqcRG/KNjR62DIfX8ebWRpQbFFveytITdnFdGJy12qkScXDnA1L5i2ZXjh2i9CABo0yuX7XZKpkwsQuRhd0O0XmPLT+jlCxQSew/F5oSfLbc3XogsnDTzbhj1H6/WhVhIUy7TX8AfxwFWE+1aogyWB6ikDp4G36EzvS2SWfVTTrqnL/YrOltED7VKAFxjvBZQcen2BjN1R/zRE6Td4S67SZwzMsQA3yUgWSsxpEQtMhqZqTX+B08kDX2Qa5hWM3E+I15ZKu3XBz/iVJlK79Q8M8J0kkMVgnBuUf/H7+R1+wTP1DqF1Yr8tJnbIbKTX5dGEtY6kvQvHWgLkMdK33MUNDiLcK1j33+WI9BDj6q9ycw9c/YFyaFand9Y3vrRXpXZpqquxK1seCN5xMFkKo2isngYtY8YLYVIrlf4KH+3m1cg7f1A//xFYg6RV64sbVdOYvyql553fv4kbOZuQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(346002)(136003)(376002)(38100700002)(2616005)(5660300002)(31686004)(186003)(8936002)(4744005)(478600001)(6486002)(2906002)(66476007)(8676002)(66556008)(41300700001)(54906003)(4326008)(6506007)(86362001)(36756003)(6512007)(66946007)(26005)(6916009)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGRsU3UxNVh6U1k1b0YrYUNxeEQ4T05qR2E2S09PVDZZRzJlNXVhTGdSZ0pV?=
 =?utf-8?B?MmNBMkI2T2ZSWjRCZUZ3UElyWXBmc25BRjBQbGlOMHVsT1o1MDdiTm5velB3?=
 =?utf-8?B?MCtxYU1kZUt0TWVlK3pkaW1iRHk1dWNUSmxPajVOODBvNUQ2ejZxSEl5amFU?=
 =?utf-8?B?M0RqY0djRmUyZUdLeGxLZUlxcmN2cU5oeVRtQ2RycFpHMmFKc0pRd3dmOXN3?=
 =?utf-8?B?QTI4bEtTb3Z2N1JCdG5sdnFSVk9FRHp5U1ZtWHdzd2ptenNqbWtpa0cwaEt1?=
 =?utf-8?B?QU9OUEtBQjkydWlleXBkdnhyS0JiSmNPc2NBT21uMjl2a2htRU9iblFhOWtx?=
 =?utf-8?B?L0gzN05IZGNNL2FlN3Mxa1RnakNXeElJUEZyS2xaZXRWajFHZUNNR1B1MU80?=
 =?utf-8?B?a2I2aFUvaDNvVlpXdk9wSkh2WDVacTd2UG5nZHAvTU5YeUxaVlhvazVEd0Fr?=
 =?utf-8?B?d0YyRlAvOXV4dUhpN0piUlhRaGhGcVdGdWRaVjA1am1uSGlEeUVteUNTem1p?=
 =?utf-8?B?RzI1M21halgrbjVtSkxoM05oWll0WUFRWGFzTUxSNXdVMXlDdk96OU0zdjZC?=
 =?utf-8?B?SG1QaWwvdEZHOHJGV2NZRTIrMmY3T2FKMzlneU11NXMyV0RFckJoNHNIdUox?=
 =?utf-8?B?eHYrNVl5K2ZFeldkK2lUd0t5a3prRStyeVduMkZ6bzBrVFNMWTlPdzVHeXJF?=
 =?utf-8?B?YXlkMm04TGFJSTlLUTd1OWxqL0lMSzFZc00razVnM1JnWVhNVE1BVkR5TVhC?=
 =?utf-8?B?eVkzeEVJMUdyOHo1WW5odjBLSkJjbmtiVVpqbUVDQndhYVRFT2ZjcjEvQXls?=
 =?utf-8?B?RVVsV2V3QkJFSmpJbElBazYxZFlGWUJVZGZIdkRoZjhLOWs2cmtxSkxFNDlr?=
 =?utf-8?B?bmJTekVqY3JpSUNoUzVkOUVYNm52R2F3NE1WWFBJZldVNDRLOEVEekg1TlFL?=
 =?utf-8?B?QVVmTHlwSEQ0V00wNDZ2N21US292VkdJdUZZVnRqSGVFYWd0R1dpQ1BLWFJp?=
 =?utf-8?B?eHRqTEVHYTk3U21Rc1pHb3FWNHpQNVVKd0gvWmdLVjBPMSsyVHdwbGI5QVM3?=
 =?utf-8?B?SDFXSGJFMVFKVUVLbVV2Nkdsb1k2Z0pNczRkQmN6dVNuS0JxUjYvcHpLMmFo?=
 =?utf-8?B?Y3hKMWJSaTg2YU9NODFueXZuc296U3ZLOGM4ei9nSXp5WDRzSzViOUVudlVK?=
 =?utf-8?B?NEljdVdHcWRRdjA5b0NKeHNPNHI3S1AzdkNhSFo5Y2xIRG5relpOL0xDbTlU?=
 =?utf-8?B?UktneEJTVVBld0xlVTNBakhwaFlHU2k3NGRxalR2a25LaHB2VFhZU2RucEFV?=
 =?utf-8?B?d1J0UVNzOUY0MWlwVkN1aG5aem9KaE5DM2pZMEZwbE4zcjl3Vm5jZ0dnNDZw?=
 =?utf-8?B?c2xQc2JnRzhhNFZLV1ZnR1E0aVd4M3RMSE1ZQzJxNEdQWVY4QUhFb3dLQ2tw?=
 =?utf-8?B?QjNraktaRDN0QWVpTHkzSUNDOFA2T0xVVW92dUlMMnBjMjQ3RWlPUmdmMEhH?=
 =?utf-8?B?bUllb3Zzc3MrTzkyUDNUL0xuT1M4dGh5K3ZmMCt4akRjdmlVYzU2aTg4OW4z?=
 =?utf-8?B?c0xhOGRHTEdWeFVLNXk5SC9XVTdJaHBvaklpZUI1LzlndVVqNjl3Ync2L2Z0?=
 =?utf-8?B?M0g0cHF6MkdZcGQ0dytTRFY3WldPNTlVSjJndjBtZVpwU3NaTGlyNmpTNU9W?=
 =?utf-8?B?ZjJCaEs4dGlqWkdDcncvR0I4eExPV2VJSFdMZWZMVUtDaThxQlZ0SWpzTE1w?=
 =?utf-8?B?OG40SVB5QnIvNzl3dDZoaWhTOGloMEEvYmZ5VmxFeWRxWGZLL3lsbzVJbUpV?=
 =?utf-8?B?RHBCd2hoWTRCVE1QLzNxMjBSL3ZRUWNSejNuNlNvZmprU1hOWkpRR2FQS3hL?=
 =?utf-8?B?UjZpM3U1VWEyNHd4ZFlaME1OTDZldHl2SDVPdkNVRTBFOHIvVjI3NUN1YzVa?=
 =?utf-8?B?YXRoSzFzVUMzdDlWQ0NHdytET0JDSnhkMGZyQTFvSXdySTRZR1d1OUNvODQv?=
 =?utf-8?B?ZkVVUm1IdWlMTWg4RkhNMFRKWk9MckV1UFlXK29sYXJRTzhONFFJNEpwazc3?=
 =?utf-8?B?bUVCcENJMk4wajV6dkhJRUFsbzh5eUNuMDZabldzRzM5TGVJbzFqb3MvZ2ky?=
 =?utf-8?Q?d30VZFqtk9U3F6uXAaXfql4K9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62455f5-f214-4f44-2a2d-08da649c0cc8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 06:51:02.0185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0rwEPftJjXTSLHZUu6Rpkjb8TLss1reJMdmfrU0M2mZe9mRVlTrqVfDh1g6muBkTUa8Azg/y9HTuCkE1Ns3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

This eases recognizing that something odd is going on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -845,6 +845,9 @@ void fatal_trap(const struct cpu_user_re
                     msecs = 10;
                 }
             }
+            if ( pending )
+                printk("Non-responding CPUs: %*pbl\n",
+                       CPUMASK_PR(&show_state_mask));
         }
     }
 

