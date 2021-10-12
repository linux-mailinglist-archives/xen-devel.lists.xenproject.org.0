Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309F429E93
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 09:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206786.362458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maC9y-0007Qm-33; Tue, 12 Oct 2021 07:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206786.362458; Tue, 12 Oct 2021 07:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maC9x-0007O5-Vq; Tue, 12 Oct 2021 07:25:13 +0000
Received: by outflank-mailman (input) for mailman id 206786;
 Tue, 12 Oct 2021 07:25:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpIn=PA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1maC9w-0006nC-8Y
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 07:25:12 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 868517b2-bba8-459c-9b97-a04f479051a4;
 Tue, 12 Oct 2021 07:25:04 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C6q3TT017592; 
 Tue, 12 Oct 2021 07:24:50 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmtmk3tpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:24:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C7F6wu153005;
 Tue, 12 Oct 2021 07:24:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3030.oracle.com with ESMTP id 3bkyv8damt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:24:49 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 07:24:47 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:24:47 +0000
Received: from localhost.localdomain (138.3.200.16) by
 SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 07:24:45 +0000
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
X-Inumbo-ID: 868517b2-bba8-459c-9b97-a04f479051a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=nwfSvPTOo4gh2UoyMUD98r2uUx7xcXV8jueIuef2qVw=;
 b=ibe3RxerHT+rZejVK3+lHdo16cjxOoS3be+ubMLTgkJsku5r7xndtNgoG8GET6RCFal2
 sycVx3TVH7WsYlfZ/F1SKFBDd3cmoDgEHeh/mSo9kV726rPFplu0CE35/rf/k31tC5A3
 WsH9fzR7BmvN9Nu/kMA5t/MQH038x9CSMlvGCRlpBgbZUmOWHonj8+1/r6N/BMLkiiP9
 evKwGAPB1Fxmg63MFcQz2kX8Zx/CQc5vwTUna0fuK+RXD6qQmBNXQdTlhJLdo2tc0xm2
 jwdyODTAZEbI+LCIYfCvJT22gV248Nh2S2nxHwdbvyjwfqMRTWhbB6ltzr0PQ8lr0l3v HQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMYA/XFHuyNgEJOnzAegmXCNGbowR6VuOxgSZe8ivQVEX+sYNtLCAXbFTlbgATxTJFrQUJzrsn6H88R+sBAZ3Pxo11u7lgepPxCI/6npONOcNigsJjZFIuBVLy6+EmEsN06P/tEdcvIZVOg4rqLWp5hKLFuN1exkVkl3rJHBPCyON5NmRHIrIAMtfpoe1POOZSm94AWLvCGZ8AuaIgbzQURUj7bEoOAnb/9Uzs/m8ydx8WfOrJ/49Z3xdMZT8RgnX1uFxSLr83hdyxzlmg5f+3qVz5LjvqXS7CFdEBgf46lPbN9sZh1ZT+aJjLzAv9OiyA/meyltVCZijZpeBBpH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwfSvPTOo4gh2UoyMUD98r2uUx7xcXV8jueIuef2qVw=;
 b=KxxWQlt9XcMFVbq7SkJx7ZOdNq2A21+OMazZ/GnlQcd8HugnrKcXYYaTKZfaANQFl2o6vJkhR2ElNmXQ6oxY1JGOsHe9NgQFTyViBaDqAFUovXRhzhQg93dj9wNidxaA6OUL78rqBNHHRRTfeZ9cwl21VG7xo5iSMFIWO9N0XBsKL2VsjEA/1iz+bSo33KmiT9JWafxBxy/KGYdaeWIx9t+Yfl05/QoHl0L92EEgiLWqhYXHhZU9U5yvVB5O0Xm3yJD2jNmPVob/RolAAzr4mbhtgpdoxoUzA4vWllzfFFES7OCXYIx9cV4aFL4xxZvmSQojHjmWD5ozmNGlMY8wbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwfSvPTOo4gh2UoyMUD98r2uUx7xcXV8jueIuef2qVw=;
 b=QP3zsNXK8+vTr+uiWKEwrN4R3dGXc5UhJxok5aiX6yZdvEPdUzhQwSTkjpo/3UXsqrxSa9Dp9V6Tq6RXy/V052ExTEdkLZ2FggqsAllod32d6jB077YBlzfTJ8xaG32we2Z6EYgORlqeW79uK26pWtCUcpA70EW2b6HChx3PgwE=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
        jgross@suse.com, sstabellini@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        andrew.cooper3@citrix.com, george.dunlap@citrix.com,
        iwj@xenproject.org, jbeulich@suse.com, julien@xen.org, wl@xen.org,
        joe.jin@oracle.com
Subject: [PATCH linux 1/2] xen: delay xen_hvm_init_time_ops() if kdump is boot on vcpu>=32
Date: Tue, 12 Oct 2021 00:24:27 -0700
Message-Id: <20211012072428.2569-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012072428.2569-1-dongli.zhang@oracle.com>
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::34) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43bfdb0d-812b-4605-73c6-08d98d515ead
X-MS-TrafficTypeDiagnostic: BYAPR10MB3592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB359206A16758AB39541D2009F0B69@BYAPR10MB3592.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dA5GBJeElMS5CFENyOt/h49wxBvO4Du/6CePcCtyPgT5Qwqrh23BtAGl8CYQ8lGTJQqemenAeqxFWSXqvqD+NNzOu6k1pdgUUwmPme9WI0LnW+wJzRRmjXkb+QlU5c227PgKVPxpcmkMU2AAiyLN0JzlHx79/dwEnv82USqnPtumElozwTt+chn8e0fCrSeC2RupqbOs2HFPHCvykjkMXovXMr6AXSxe5RPCB8tNAM8b3t5O8IyXosab+nYPZVepWFiKpGeaTf5fnVQwm4oYHXHAZ7JaUgwqG2/0yqpCDxfdpYI9dvtxQ8+ZH8YOk1DF/LJBHvOLVLeKSaVYSFv/fx+fpcwLLTwyXeLwAYpeWL9WpS0dL5a4NWaP8A8ILIbxOy1+tD/Hm8j/Q7stXws9/3L1jVm4DrojAOLppCmIM/RvYLhzCfzT4QV5H54zmEzxTyexP6ndRjYIAx009dkyZKXJPP15w2pqMoig/OVPKODMjp+oRNV30E5n5TcRaAtj+oREcu4VRt6ecs2aArhpFLTJ64ZeO10Ru1KL0t+7xrkVI10hkSZwGy1mQkXOFNwknHUtPGKBiYl9OjrvHhNrWXKJ88LEGuZWemgPJe792V07bjIS31Dp8oVkT1vLbSbRJehmcUCWYYlkzVKGDPZHUTvq/TxV1LKGDPi2tvZsHDKbRKgHTtJJvymzB5A9LRTnZRE8stYx09XyvdXY8z8w1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(44832011)(186003)(86362001)(6506007)(508600001)(8936002)(5660300002)(4326008)(36756003)(26005)(956004)(2616005)(52116002)(6916009)(316002)(6666004)(8676002)(66476007)(6512007)(83380400001)(66556008)(38350700002)(38100700002)(1076003)(2906002)(107886003)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mw7W1gKsL2WbnbLI3QPsfOTzt0p6TOX/ADkczBbshZ9d+6S84K63KTKL5w/6?=
 =?us-ascii?Q?fFQ6lnOSABpucXYqh54LszatBLDzmllh+7vu6pFnfyPByQUi3cOw0j/bYkCT?=
 =?us-ascii?Q?h3jLPHHUWp7RLQ7+v4NEF2yRvHgtnRA1tAqTY7Dn7U5iheHi+uXs1RFQGJil?=
 =?us-ascii?Q?1uqpwJa3I/jnVOVvQ+X4ge8g155a5zo1NyifG8zPAXGBtOFiZPu2GPvAZxep?=
 =?us-ascii?Q?x77ShlQG5FrQe7LWAiK6kilPsKiYHNICtHDprxywgGz6Wq8vYR7yPtscfb3o?=
 =?us-ascii?Q?FDAZ4dQFMiLY9AzHm1EVrrVNYurwl0421ltgb0Rf75y6+2KuwlgUCOifI7Ze?=
 =?us-ascii?Q?fs+0F1hFitFafrJ3N82t41PxCjU9qaZLAAVfddsfvvp7VkRXuskxXoezdUzv?=
 =?us-ascii?Q?btk9lmgd4zNH9/iVzXzQRTFoTKnXfqYjTin8AztGqRtqQ1mrOhciHZiZuAnW?=
 =?us-ascii?Q?vzMqdkb+xuKZ3Xpc67ZiRalI3xC6OcGEACaAP0Wc9oxRE+5DOa6QMNmpFyiY?=
 =?us-ascii?Q?cy8D77+9gW4dwACO76l9ZepIdo05wGfAQP46W1G56FQ6WBggy6FHCKjdEuE9?=
 =?us-ascii?Q?O/CFp0ZfQxwcLihnK8+3Fu/xUWAXf4gMGrAtAvlJ2z1QF+sOMHXLpmsrQI+p?=
 =?us-ascii?Q?vwVvjkFj4J1ba9Ke1KRykQNSaVBVq7eokQfwzzWA/v+3mq6pfaK0cLT+KxjT?=
 =?us-ascii?Q?ZXHuLdxn5vjGCAVvue47v1s4H4euujdRq6qA5rZ462EgrJCD+kwWYHojvztu?=
 =?us-ascii?Q?LGplqo9xXntpbSM4BYr14vYWc8RnE5OMfDLACRd2k/R5Zz2W3Ks8SRrYU1fE?=
 =?us-ascii?Q?rYuoVXLUGZcmzT7zW+65VVYNcucyGix28RvMurmtXJXxGXgksGPH3DgQOn6O?=
 =?us-ascii?Q?GbNHKSjkLtn/hqIsuRIhd9Dcsd9uN2gcraBFwbe+wG6mtSU3CQHMTzlmF/T5?=
 =?us-ascii?Q?4ece+fU+M1veRC85q7tldEQtLtrjXswdca5+cT2Z+kmAKBBt8kfGm77v4Iju?=
 =?us-ascii?Q?3FECtezZmgDnzUcFRxlcNVEtDXmWxkrNt1+htMLxFz2p+nQrZHWCdqBY3WL5?=
 =?us-ascii?Q?maWMhIHGQNMeoUstgGaOgMKf2WN9paA0ktWgsP1qe9Q8zEzNj77ii+znyX8G?=
 =?us-ascii?Q?BoYChOBx3I/Iey1YEAA4bOZZY9oXty4qvgvlIK//hBBkF26Az8gtyCjJ0LX4?=
 =?us-ascii?Q?3Ucjd2yVNIZ+oHQHnaPr60fIwIcsg5m7bvvCMknUE0A2tQu6JMpWwIW1C5Vk?=
 =?us-ascii?Q?WnqNpmXEoxzAiTYAaNjHtY6cOm9DN7/h+wq6HgWat5ecjaRIwKohaZPTnZye?=
 =?us-ascii?Q?1ScdECBT0qaSDariK9lY4PD5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bfdb0d-812b-4605-73c6-08d98d515ead
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:24:47.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cg0tjFXPw4wRcc/5RZQV7PwDfUbjHIFWCIni6pJdMjiW+5A3pjkBvudDo59ROlcXzt9rWDEnrk0n0Fdr/z07Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3592
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120040
X-Proofpoint-GUID: epHvCdqTYPpBXldlhYPNKkjXr_QRcds0
X-Proofpoint-ORIG-GUID: epHvCdqTYPpBXldlhYPNKkjXr_QRcds0

The sched_clock() can be used very early since upstream
commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
with upstream commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock
time from 0"), kdump kernel in Xen HVM guest may panic at very early stage
when accessing &__this_cpu_read(xen_vcpu)->time as in below:

setup_arch()
 -> init_hypervisor_platform()
     -> x86_init.hyper.init_platform = xen_hvm_guest_init()
         -> xen_hvm_init_time_ops()
             -> xen_clocksource_read()
                 -> src = &__this_cpu_read(xen_vcpu)->time;

This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.

However, when Xen HVM guest panic on vcpu >= 32, since
xen_vcpu_info_reset(0) would set per_cpu(xen_vcpu, cpu) = NULL when
vcpu >= 32, xen_clocksource_read() on vcpu >= 32 would panic.

This patch delays xen_hvm_init_time_ops() to later in
xen_hvm_smp_prepare_boot_cpu() after the 'vcpu_info' for boot vcpu is
registered when the boot vcpu is >= 32.

This issue can be reproduced on purpose via below command at the guest
side when kdump/kexec is enabled:

"taskset -c 33 echo c > /proc/sysrq-trigger"

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/x86/xen/enlighten_hvm.c | 20 +++++++++++++++++++-
 arch/x86/xen/smp_hvm.c       |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index e68ea5f4ad1c..152279416d9a 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -216,7 +216,25 @@ static void __init xen_hvm_guest_init(void)
 	WARN_ON(xen_cpuhp_setup(xen_cpu_up_prepare_hvm, xen_cpu_dead_hvm));
 	xen_unplug_emulated_devices();
 	x86_init.irqs.intr_init = xen_init_IRQ;
-	xen_hvm_init_time_ops();
+
+	/*
+	 * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
+	 * and the VM would use them until xen_vcpu_setup() is used to
+	 * allocate/relocate them at arbitrary address.
+	 *
+	 * However, when Xen HVM guest panic on vcpu >= MAX_VIRT_CPUS,
+	 * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
+	 * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
+	 *
+	 * Therefore we delay xen_hvm_init_time_ops() to
+	 * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >= MAX_VIRT_CPUS.
+	 */
+	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
+		pr_info("Delay xen_hvm_init_time_ops() as kernel is running on vcpu=%d\n",
+			xen_vcpu_nr(0));
+	else
+		xen_hvm_init_time_ops();
+
 	xen_hvm_init_mmu_ops();
 
 #ifdef CONFIG_KEXEC_CORE
diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index 6ff3c887e0b9..60cd4fafd188 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -19,6 +19,9 @@ static void __init xen_hvm_smp_prepare_boot_cpu(void)
 	 */
 	xen_vcpu_setup(0);
 
+	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
+		xen_hvm_init_time_ops();
+
 	/*
 	 * The alternative logic (which patches the unlock/lock) runs before
 	 * the smp bootup up code is activated. Hence we need to set this up
-- 
2.17.1


