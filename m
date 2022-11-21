Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD26321AE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446577.702212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5gZ-0001ZD-QC; Mon, 21 Nov 2022 12:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446577.702212; Mon, 21 Nov 2022 12:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5gZ-0001WA-Mr; Mon, 21 Nov 2022 12:14:03 +0000
Received: by outflank-mailman (input) for mailman id 446577;
 Mon, 21 Nov 2022 12:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox5gX-0001T8-Kg
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:14:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb00bee5-6995-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 13:14:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 12:13:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 12:13:58 +0000
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
X-Inumbo-ID: fb00bee5-6995-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUWmWmKnV+iBVAwjZMHG1XqSqRRB+qdBbn7pKSUs/SBOsmkV5GwXPF/v6nnEFksxQGMAhIHvvjcjYKJNMQiZqSJA3XYRZOlDUZ632sM/gxgVnzZx4Dv7v8jW7nvo/qHx68d3Ow+dVL87yt1vmdsrzVKIu8xsXO63/wVRb7kdcbbcnB4gBMF3QXM0xsGYaJ1FBR5IN2hBFlMwuv8ZkCp70wmV0/UygPi4ZeL6DGNw/y6Ldz8Cz8mDk0Nmc2MO7sXMqN14gEQHP7ztkjsqxKmSw0ZCN+6m+UTJUFovtAd3zam/L+4bK9n2MsWIKrkbm7Oekoa4av0KUIRqCNahPB7ljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfkW11X9pDByfM7tL7/0F2TK04AeoKyeauuXX07eoQI=;
 b=JAh37n2ZUEHxokUli2eKfVW1aaKUsv4rLIh8Z7bvk5lQUO6ynblszCOA4mm/bdlXGSW95CBUCI5V2D5/ZueomBpkz+0OoAlbxDYGtZ2oHxCQAoHk0Q5xGe1dGKalpI1Ilf96HW49+d6tGl1e9dTzrLoOsMZD2Y95OpbbbNdq5OmV9SuH4GNdl7NBvlfPH7IhMxmrw4twYzBZNkxzR6Wd5EFf7GKWGIPhhPbSdeYcNF2rmpgcK4UR0z+KeBRVPcw3kzcyJF3EQHjqkYPPLfbS8rP6nozKFUbGFhklYD4F/9hIo8nN2mya4UVW9oMcpFJbbHdG9DyQ3q7E0xiCZgwjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfkW11X9pDByfM7tL7/0F2TK04AeoKyeauuXX07eoQI=;
 b=BBXWIrA6ibhNu4L4A8so0gBcf0nj7VA079ICHPdBWWf04TQ5y8QYLXnnss8cgSWElehjvOW+jJU4DvPDBnFuTY6KG+6L6DbU4O+wwzwO0wfHIMutWTo0LRxcEgWacXhp791ZprG8SUpHlP/FTetxO8vSm56Nl59oWwynlbINmV0BsOZmRV+U4czBY3vBX0BsoHNZVoP/03B1tEGc6UByK+b7hf74V532HI3AUptKYQywrSt8WMVg2bf+3bfdEL6GqOT+DK+b6qa1TrX9jnGf9Ge5YSmhPJydlezW1v8WYLidbxXGM6icikDlhFNI+LfSxt6Fq4k7Uy0pOfO/tklX7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a098e0ac-72f7-20d3-df5d-05e50e75ea51@suse.com>
Date: Mon, 21 Nov 2022 13:13:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Viridian: don't mark IRQ vectors as pending when vLAPIC
 is disabled
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c151ad7-f28e-4979-7a5f-08dacbb9de70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Flt8IEoZuedTSYfEVt+anvEFbo5ofqqoEUHZN/ImWDmHZ5+jf7t/y7jGUErK5c97VL5PxnhX00JgfHZXHEYTUHvDqt45u8vJeVCUOC6ZXnUbaZE87dCABMcIt1k29Gkn/Up+sDT5eXdLiAynbO2tKVWW8S1XDo4pQvPbK5KUUWFo58jBqumxkdFHtvJXHI9i/fFAkDuwXi84XpO0mHw0IXtjytbuxCViKaelWW1pbwDOAQ5LdVG0+r5vQOASkQRjiOvc/hjPd0ZJ1iBtpGCfxMOqeKTl/wO2eavrE6FCNvesyRnMhlH/oKmFdHowjGNojk6d8q2/kf0I9yfSKwdI7AKZE5VTNRd5ynJ3GrGHyTVHIlAmzP8jo/fpo8iWlCSkIrIxbBjmGTYiRa5PL7H4QJmcxGDi5rvL8/5cNZtMmYN4crZcKSYU9kzanEC52apIEzSHLoUZdgQr8ZjzDL4fa5oOaiB3VU5G8EZ4vayxXWjCSWLyPOXNvdq0C/HWxn2Uu8VsfRjF08Eq4rtprXoJaxr71DGuFerspqoaRZ1GvxvwxYEOwKHjDTFEMRMV4A+tJbPHoo0WSDxh7p6d1A3KE5mUKnODVxPqblh8iel02HoTyu/mW46jsZnBHoWGV54BygbEmKoVGGVMHW/SSEJMib4gLi1rjuvPTjWwWHVg4u2yUp4bjL749nLk68G+5fP6tVQCcAsdJto3EfxyIHvZZvvmIyj7JS23YVyaUDOH23Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(31686004)(2906002)(2616005)(186003)(38100700002)(31696002)(26005)(478600001)(6506007)(66946007)(66556008)(6512007)(5660300002)(316002)(4326008)(8676002)(6916009)(66476007)(36756003)(8936002)(6486002)(83380400001)(86362001)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZjYkhYZ3pJOUt3azNFaU9JVEE3YkFHTFlMM3hsNEFHR0lOcjFaY2RlZk9q?=
 =?utf-8?B?ZmhWbDFqWnhVL003VHJabmlScFFzNjJ4Q3pqdnZ0M1pVUEcvckVsN2tuNkQ5?=
 =?utf-8?B?RkFVUGRtSFVrbzIvZC9WTjB1S0RjS3orUXJTMG9xdWJocXhzSWFLRGxoQVh0?=
 =?utf-8?B?ZHBJSHF1cldkdTJNL08rWW1OOC9uZW5mUVY2NlhaNDFwT3JzVVZpN0I0eVZM?=
 =?utf-8?B?aVdBU2VzbzB6c2tOTDBtZktXd1dCbkRtQVB3YlZMQXZmbkhja0RiWkd6N1hU?=
 =?utf-8?B?UGprVVh4bUpnL3g4ZFR5NTk1Q2FUQXpKM3dvQTRTMFBTd2hxbEszZW5UVzRv?=
 =?utf-8?B?ZzRPUEdXNHQ3emZYYW9xamkxcTJTaUt4a0FDdFpnZWU4UlNLRzkzaHVtajBk?=
 =?utf-8?B?SVZsQVdXd0Juc3prQ3FiTlVOZ1JrMnJteCtBNERROTZIY2FFN2tJWFBrM3E1?=
 =?utf-8?B?TThURkRYQWNTbUFJaFVueVJMbDloQ1JmY2dReTBmYWlrb3JRWHBxRFVaU2lw?=
 =?utf-8?B?ZXNEbXNjSzhoM3BwQkw2eEJnSzQzWTdMb3Eva1VFd25saEFuM01YR2lPNFBz?=
 =?utf-8?B?ckxZZFRYeUF6Q0VGaHFOd0NJMy9sOTlMMndoZjljbFVSZXdZK3c5dFBYMVBK?=
 =?utf-8?B?Mk4xendVTjZOWlc0OUZQVnk0MEYwWTc3RmFMVkw0VHZzd3BCK2E1UUMxNC9Z?=
 =?utf-8?B?NUwrbGllT1pzdGNMcHRENzc5dWNMdzJpMlNGaGhxcVNwVWtUeklJd0E1VmhR?=
 =?utf-8?B?NnZPZkRsY0VzOTljV1h0QjNYcHRFb2t5OElUMU9LNElNNkMxbzYvREYwMGZw?=
 =?utf-8?B?R3pJcFN6dkViSTFlYTRBRnRGMk9XZ3E0Q1NKNzVXaU5leFBGK004TTdUOUVw?=
 =?utf-8?B?NlNDNUt4bFd0cGlqSWxtbmxMUUw1QXR6ZGZEdWJyY1plcEg4T0xwOHF1TUVH?=
 =?utf-8?B?aEdDVTFSVXZJRHV4SEZicHV3NCs3UmI1eUlIUi9OL3BZM1M5VkVLcE1IUlZi?=
 =?utf-8?B?Mi95aGJSSnFmUU1KdVMzd1l3dkZQRlpiMi84TFhka01pUWZpeVlzNEI1RjFK?=
 =?utf-8?B?NElIZ1p6MFdCZFpLazJwc3pzV3k0SVJ1WCtFUUVDNk5ZRDVwMStYTUtzbFJ3?=
 =?utf-8?B?Q1N5ZVZyRDdZWFVMTXZueUJlaC9jMEJidTFZNkxQWWQ5VDlUM3hhNlNhUGl0?=
 =?utf-8?B?dm53RkNLOXp0WFhkVml0STRXS01USEtFcnNPS2JlVmxBbFhtWnQxS1ozZkNN?=
 =?utf-8?B?ODV0RU9mZnRaM1ZWbExXQkc0L2w3alBoaW9NQ3RYM2JvQ1U1TStCcjA0YnVk?=
 =?utf-8?B?TFdUMlQ0blYvL25iM2RqU0ExSWVGLytOS3dZdHFFYlRVS2VpTUViWkZTSjZC?=
 =?utf-8?B?L2ZaMjNveWQ2MGxYbEYxMjhnY0c0dnR3SjV0RUlVUzg0b1A5eWhGaWZaYlNm?=
 =?utf-8?B?Y3RlZGplNVU2c1FqMzh4NkRWeDNYT043SmdmOWpWcDN1K2haNzR1aEZZVzRB?=
 =?utf-8?B?ZnBwUDVBUElkUnpCYjVkTHBucnRQZnFCUVBYWFlwdzZDU3BTeG16RDFSR3dV?=
 =?utf-8?B?akxueTEzb2ovQXVWZldCK3VZUUxGSnFVQm5mK2NucjBZZmtkMWk3THE2ZWpr?=
 =?utf-8?B?ZUdPenBZSFNsWkZnWTljTE5BTWQ1WGNMN1laRzlkcFliT2l2UW5wUi9ONUJ1?=
 =?utf-8?B?bTA2TlI4OW91TmVBYWVrWWlLeC9wb0FSTVBWcjVGOVZKUzB6Nk52c29xRGo2?=
 =?utf-8?B?bC8xTkVuRmx1dXBRdjlIZ2tsWVNIbGxJbHYxeTVteW50VFdONXh3SkVEdlNh?=
 =?utf-8?B?S1grM051dTF0RlFkWDZ0MG1ubWJ5cHlYK3BDNzkzbzJPRFJzd1c1VFBRdktN?=
 =?utf-8?B?Rzh3RmxLejZSWkFIaEd1U2ZRZWFqRURNeHphS2hZRlhjZ2FUL3pqYUZVZXlL?=
 =?utf-8?B?d2FJWGlPcGlUcmVWb0ROMXFaa2l2WHdONk1jV09DUFdDWS91V3ZXWWh1RDl5?=
 =?utf-8?B?blJOajlyS090Q3JUMXcvV00rUUdPcTNQUlpDcWRjaWdOSWJ3cmxPbVRRRm1M?=
 =?utf-8?B?TFBWTkJSOWJETEllV0hHa1NWNkdNc1Z5TXhoWVpZZHpQVzZvV1UvN21qQjhZ?=
 =?utf-8?Q?f2ZenTv+f19H5fn6M5aIOH+Ma?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c151ad7-f28e-4979-7a5f-08dacbb9de70
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:13:58.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuGDiuVx42woSDwynum9KfVkiTp8bw2snao/LiF76iDbv5BPABcFx7QOtNF8GM/AvUPBgua7+BnMPiCfH6cyfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509

In software-disabled state an LAPIC does not accept any interrupt
requests and hence no IRR bit would newly become set while in this
state. As a result it is also wrong for us to mark Viridian IPI or timer
vectors as having a pending request when the vLAPIC is in this state.
Such interrupts are simply lost.

Introduce a local variable in send_ipi() to help readability.

Fixes: fda96b7382ea ("viridian: add implementation of the HvSendSyntheticClusterIpi hypercall")
Fixes: 26fba3c85571 ("viridian: add implementation of synthetic timers")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -359,7 +359,7 @@ bool viridian_synic_deliver_timer_msg(st
     BUILD_BUG_ON(sizeof(payload) > sizeof(msg->u.payload));
     memcpy(msg->u.payload, &payload, sizeof(payload));
 
-    if ( !vs->masked )
+    if ( !vs->masked && vlapic_enabled(vcpu_vlapic(v)) )
         vlapic_set_irq(vcpu_vlapic(v), vs->vector, 0);
 
     return true;
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -811,7 +811,12 @@ static void send_ipi(struct hypercall_vp
         cpu_raise_softirq_batch_begin();
 
     for_each_vp ( vpmask, vp )
-        vlapic_set_irq(vcpu_vlapic(currd->vcpu[vp]), vector, 0);
+    {
+        struct vlapic *vlapic = vcpu_vlapic(currd->vcpu[vp]);
+
+        if ( vlapic_enabled(vlapic) )
+            vlapic_set_irq(vlapic, vector, 0);
+    }
 
     if ( nr > 1 )
         cpu_raise_softirq_batch_finish();

