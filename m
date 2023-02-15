Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE8697F2A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496045.766570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJQb-0004fB-R1; Wed, 15 Feb 2023 15:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496045.766570; Wed, 15 Feb 2023 15:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJQb-0004cX-NT; Wed, 15 Feb 2023 15:10:37 +0000
Received: by outflank-mailman (input) for mailman id 496045;
 Wed, 15 Feb 2023 15:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSJQa-0004cR-QY
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:10:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f301af-ad42-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 16:10:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 15:10:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 15:10:34 +0000
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
X-Inumbo-ID: e5f301af-ad42-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HN9ImcLX8EccO0/mhj/fF3yySVnmRxNcfoAEpyw42OYtmRtk58r6Duc3U5LYAOPMzKIPiwHp/mctP52UEYZwbRT9QFX/xAoP73cXZnzUpMPBHRapz77VkB+2qVJvKN3Jf92+1j+ytqcWgpNCURmh73Sxz/uAbSFf2C+XCrPOb2W4tR1QXMAIiLu8yFdUWw6vUmkPJQBGkUv6ZWjNYh2MZckbsxeQPIAvUUFl5oMc1XAH9OFj4I5QH8F3WR18NEww0Ei3c/YtBlH0Ba4Xml+B+7G7X2BfByfBtR+C4l8z0/iEErfCmv6iFW8Mmwx1ueTIRu5Lur6vQUiOveNejBxwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6by/01wQhc29qxO37JY8k+FM1lQfm499S2Toxg3O0o=;
 b=ey3Dv09UOpYEswUTzuVTGWc5WKRv1MM342mFekVOqN+6S0SU2kqBnYgLi3HzpL7ghISHmwp1zp5giUsrCRCOlFnTHBmQjw2LPFSRqJN8f7kZ+jri7bz+19g0PLyrsvdbxouUbRtAGa5a0L84w8jC7oFsfZYI9U4EWX9hvrRvFIjaTpySGl5RL5+UpM8QHDWwerCxH+fT8tu2vfVFwFt+sI7cUhPeEECLLQvR4aERLq/yXE0h2fYbNqHn/ZOz4JhQrOajOAd7LVZJDWmp+ZLqJfQRvwBfFWKWJobTQFLR5464OZiSkBkv2w3HN3055dO9vtrfSQwJupw4kr1KEzUrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6by/01wQhc29qxO37JY8k+FM1lQfm499S2Toxg3O0o=;
 b=nKrGtzvB0BnvzOoL474ww8klEpBdJpoCTILuP9Y3PQ5DQZsb+dLwSzB7XZjs6f019gI3M03T7DN2zeEZEbqUkcl1cW4XKOvcLxspnBa7UXhCct/Ws/3viAogfLtXI0dIpKVQExQMfd7VGwoyxO6/wcA/ruyTq5bbIIB9ZlYy7wKFWSLqXX+xkBT/9TrTlTFUvdOFzm9bRzITgj9box8cZXbduhUI9cvnOp9C8vXeUxmXTQ+CGWnvtmI42fAHRoZOa19dFt+6l1nEHRZzjeNU9oP/PxJIWoPkuFYFpooFBe60sxd3sDcLnyjTVW7KPnEWynGzMCKqVIwWa2cYlYOA6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5458448-10fe-9c04-f25e-b69704c5f3eb@suse.com>
Date: Wed, 15 Feb 2023 16:10:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: ignore PAE_MODE ELF note for 64-bit Dom0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d6513a-0fb1-470f-b2ef-08db0f66c963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3tGGW/iUjuor6XnlNTP9tbJH4RE2OVU3gFN94VFZYGJhDfpm6nt0VZeZsCWxdlobB0i4413ASseWpykalggXCqfevSOqC9jKUAn03rorLEQjUvuX1KsnOkEL3EEMjXh17ky1wVdXsnp0epI3i9ct6ZqAs0gOH/jth8f9F3RPijOhI3IVCfP0VpendVQMY7fxhUCfzQqjs8HgqnJY5ArEJ1xb4KNq8S8vUrxYGypIRMPDKZdRVIxn0qR6LNv7e6tM56KPVzBvWFz7KfI862/CbEO1poWASnX7A4LHFAwwYGq0imz4dG2eFZKiaS/PoXduDb9iqfTU6JOf/S5Vn5fpeRkgjLZio66Bz6Vy2s62qdN1Buf36kXL0EGqxc81WEzQD2lEvgGxOpnNGAhUcyzuqOLNgMkpUOyrYbaH7JEshrIEcJlqCioj1OamfDlhgSYMWQdcgKt7EABYuTyCsfk/lju1QI4pUaDKllVqsrnWwtUPenzT8VkYoFGPxsk2RPf4gKjp13OOP/xjI8X7X3UR+LOrNjZ8TdJ3LaPHkwc1/HeHI2RtSKCgb0Jc9HzYhWR+EC4ssgB/GOu89O2pYKf/WxupBnnVqBxr3CQ+M5X08GyvtTTdWRF4tKyTD0sX+zxNiU/MuaIPWPfMmjXpzMKNnBt6SC4umPCQBSqdw8GL/ya/4LZ+wo3b7icgNF5RY4etyEla96Q3NIb5MguzeRYpQIiCS+tZdcjJhRAJcFp7jCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199018)(31696002)(6486002)(36756003)(316002)(54906003)(6916009)(66556008)(8676002)(66476007)(66946007)(4326008)(2906002)(8936002)(41300700001)(5660300002)(38100700002)(26005)(6512007)(186003)(6506007)(83380400001)(2616005)(478600001)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUN6Nnc4RXEwVUdPM0huTXJSUnMyeUplbjgwb0FYL2RMYXdkeks3cVhEc3Fw?=
 =?utf-8?B?ODQ1QlZ3K2lXMnFCRDhyU3drUE5OeXBhelR0c3AyekhITDduRTc1UmFuNGhv?=
 =?utf-8?B?dXZIaEVNdTZKZ29xeFZPWXJJVE81RDFsQ0ZqNE9UY0RHcjB0dXR1YkJJTlpC?=
 =?utf-8?B?ZE9vRjZMazdjL0tkTjNRUzQ2QUxQcWJDQk0rcncvbXZhZFhva2tBeFY4K2Vx?=
 =?utf-8?B?Q0h4M0RFdDR3bUp6eEVNZnRnb0dYMDg1OUlEalNPaHFueXNkTTJ2cU0rWUlv?=
 =?utf-8?B?TnZrRitaNGptMXpxaUo2SFJSMjRKZzRaV2s3VVVTTFcyVU5pdi9RdnhVcU16?=
 =?utf-8?B?aHJPcXFPUzdqU25vbGdHN1pvN0dDZ2hUaGFCK0RhTlRlMmlLWW9ZNXY2UnV1?=
 =?utf-8?B?U0FRa2xlbW1yd3d3dUZVcFc1UFlXaXBTcXVrRHRyaVo1Tm9PdmIydmhpTkQ0?=
 =?utf-8?B?aVFpeXA3LzRFT1lnWThQN0JULy9uNGFUVC91UGUxa2liOTllQmk3N1dqUHhX?=
 =?utf-8?B?d2lpaE43UVg2dEZ2WStTSDR4alE2VmVtZFJ0ZFRMdjVCaWM0RUVjbHFkN0NU?=
 =?utf-8?B?Zjl3WjNmYUx6OUR1KzRIRFM2REhlb0lQdGxTWVVqSEM1SlU3SXQ1cE5Jb2Fj?=
 =?utf-8?B?QmdUR0VDeThGS3hrL0dBenJDSXhXOHkyQU95Zm1RSkM2SU9YbjlQR2lMVFVJ?=
 =?utf-8?B?Z21mamhoUldzb0Urc3ZtNWVzakRDWm9FUStxbmhQK0w2QStvS2RrZjRvaGs2?=
 =?utf-8?B?WTZYZWlrek1wdDN5OGJqcXliYVQyZ2tjbk1KT2w2S3VVaXhxVUViMnZGbWEw?=
 =?utf-8?B?UkxQMTFhSnI2MGwreE5ybmcwYldIUWU4dnN0T1dXUndxbElqYmZ0R0FsaFRY?=
 =?utf-8?B?MGZOcTZ5NTJrMG1OZ0FSQ0hDdVpsVE53akpGY0tKTTY4OVp1M2ZHNE5SYkgw?=
 =?utf-8?B?dmhsbC8wQU50TFViR3d1d3JJQ090TjFVTUJwTHpCMmtoOWtsZXEwMWRRN2tG?=
 =?utf-8?B?UUhzenIzZ3p4RER1M3RLejJZbXZjbWppWDljbEZ5RXY4b1lyMmR5VG04TGs2?=
 =?utf-8?B?dWNlcG93TkFnTmFxNXFxYVFWeUhnOEorajNNeDhMZWpxN3FGUURxTFlWeFcz?=
 =?utf-8?B?alJWWlZDZTV6ZkJ3clhTZGhUNnZ2aG9VSTBTb2JZQWtUeklUc2l4dkZ5V3FU?=
 =?utf-8?B?QmY2ZDN1ZExqcFFjeE1NZ0ovbzMrUVNWSDhQOG8wZDZobklwUlFUWEM1bVps?=
 =?utf-8?B?MmxPOUQ3SURIZXR6QkxYQTVNeE1HN3hBL2trN0RBcFhiUytHWk5jK2MzL1FW?=
 =?utf-8?B?Y3pHZ2VINHJyOG5RM3JuWkVVMVRybTVHRVVVRlpBdHVIM1doSjA2WFlEd0w5?=
 =?utf-8?B?eG04RnFGV1RhbGhqQTNacDNya0dxUWpqY0VZM250SXBsa3YxbUk1Rnh4UDdM?=
 =?utf-8?B?bmJoeXdlNExJSUtDcWlFTHlqaVFyMFdZTkxDZG1kNG9DT3R2WlgyZWtUd1JZ?=
 =?utf-8?B?NHphaG96NzkrZk90U1hCdWlhenpVNWdDejB6U1IrTjNMWnJ5WmlGWDdMRWdB?=
 =?utf-8?B?VXpZZVQ5RHNxdUZ5R3ZGSExJNHNFSW1kTjk0anl3VDExb0l1QnRlWHhxYkhz?=
 =?utf-8?B?ZWxaclRubGFRdU43amNjRHRheVU4WXlUQytYWkk4MFhoNktqQ1hyZHdmc0pu?=
 =?utf-8?B?bmVSbXFiODA4Z3hoN2ZNQk9UVFRKU1lQZFV4dERoZ3hiYkRtNHp1WXpLTnZl?=
 =?utf-8?B?cytHSm1aQ2hObHhheHN1ckYzdkdZMlRYQnJUbmFTTmtQTHpJUEpaVkpYdVdt?=
 =?utf-8?B?UzFOK21Zb2ZqNnVvUVBIUHd5bC9acVhxYk1uYWJLbVpZUjlRV2lIdG9BSlZ1?=
 =?utf-8?B?Y2NrdEpiYkYvUU5MQXc2REFEVGNkZmNjN0VKYU5BTUtIcEdHTzM0ZlhNQXIw?=
 =?utf-8?B?SW9jTURNbUFMK09EYlVqcFZvZDU5ZnJ0TVZwdFc3akpRSlFwOFAxTVR5Yjhk?=
 =?utf-8?B?Vzg1QzdlOGhqTjg1cVQrblJxQytNK2FpYnZ4QlllTjExTVc0RlU1N09rRWRQ?=
 =?utf-8?B?VFh6bCtoWmEranJ4Y3ZnNFplWHptc0RQUTBRRXhMZjJvVFlNN3JrQ2hXRHB3?=
 =?utf-8?Q?v+ejLY8JqjIv8PL45VfoffYVt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d6513a-0fb1-470f-b2ef-08db0f66c963
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:10:34.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO7UWvoACaWYe0UW4yIncLDpNVnCErR9Dhzv1K6oWa0EpRsBKuiA3e3S12GTzyxrN9Aq9mVBwyAFsitB/ChRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317

Besides a printk() the main effect is slight corruption of the start
info magic: While that's meant to be xen-3.0-x86_64, it wrongly ended
up as xen-3.0-x86_64p.

Fixes: 460060f83d41 ("libelf: use for x86 dom0 builder")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: While Linux works fine with the adjustment, I'm not entirely
     certain of external tools (kexec?) having grown a dependency. It
     may be worth noting that XenoLinux and its forward ports never had
     this ELF note in 64-bit kernels, so in principle it may be
     reasonable to expect that no such dependency exists anywhere.

Prior to "x86/PV32: restore PAE-extended-CR3 logic" that (meaningless
for 64-bit domains) VM-assist could also be enabled, based on the ELF
note's value. I expect that change to go in first, at which point the
description here is going to be correct.

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -459,8 +459,13 @@ int __init dom0_construct_pv(struct doma
     compat = is_pv_32bit_domain(d);
 
     if ( elf_64bit(&elf) && machine == EM_X86_64 )
+    {
         compatible = true;
 
+        /* Zap meaningless setting which kernels may carry by mistake. */
+        parms.pae = 0;
+    }
+
     if ( elf_msb(&elf) )
         compatible = false;
 

