Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97395473036
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 16:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246178.424604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwn0g-00022a-QI; Mon, 13 Dec 2021 15:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246178.424604; Mon, 13 Dec 2021 15:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwn0g-00020d-MH; Mon, 13 Dec 2021 15:13:02 +0000
Received: by outflank-mailman (input) for mailman id 246178;
 Mon, 13 Dec 2021 15:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwn0f-00020X-8i
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 15:13:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28bf7db9-5c27-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 16:13:00 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-hrdgCM3hP9q8_Ww6dRPQcw-1; Mon, 13 Dec 2021 16:12:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 15:12:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:12:57 +0000
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
X-Inumbo-ID: 28bf7db9-5c27-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639408379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NepYqSw68L1IRVa08bjwitG1A/t4bjNDpTEkt8BFYlw=;
	b=hXhNpt+Yo2rL4q9b1pt1oc/sOfyh6+BUtOxmiWaqCX7rK0WI1500vVF5vy/qVNWoIAthO4
	poO50caJ52kFnVIEmqfK/WjcIehoDryL1f9BWST8WZjPFJj47Seb6jOBzfUr5yaVe/dsNz
	4i9DnhHvdpSLPw31snMoo+ZZmRXvoHI=
X-MC-Unique: hrdgCM3hP9q8_Ww6dRPQcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0LTYVJnXGmRcet1cRVBdWO6PWLuKw2pnI/vau6kvr4VH5yf4CaWvKWB0F1hYjcKHc4fVqwzia0DHjciOb8kU8kP3XJKSbgiqF2kXcxNt1rYaP3X/i2zvKGfg65BfskqYlBavX/yaPrBkvqF9+ITYChGNDxMY5ZUEi7LvtpvOQyi2mp87M86gmQM8AlAXV/vK79PjtQd8Mm+YiRO21QMRKMOuAggYXua3/z0WG+keLjUT/tj0JzB99DG1X379L5AmD//ljC7rWWj7xfW0whyy9dCOHikl5RoKqiUYRR9oOdj+MEigCkW1inUYFhElLVxKNta8JYq7IEwWTvpC+RWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NepYqSw68L1IRVa08bjwitG1A/t4bjNDpTEkt8BFYlw=;
 b=LtkRbHp9Qd1pyp7K1ZV43bXmBbSvS8VF2nfuTDRE88zNhPXhS5xhvAML2JH7O5K4C3zUfbX9lC6e0QbPPXdb4MZx8M5PYdTPvgWMlLOHxsTlZ0VYLnYCyYwXj09bEIe7fQqhSKYes9MwbpowFHVGxUc+rVgfec20RViwzYCl00ppEl7SRDaiAWysNVTbugeMVVpGU0adguB9jO7io59GWY3RKnhU3AzK2M+J6zMb6aryUIXtm7G3FnuwhXr7GZa0YwuiPdDSqjnJU+tKCCHCHO5rwS+/ZlfA6QXfAovRbKAZ0uzyMLFsKgtyy/rdJiwGGgihXRM+q5xZRwY/9oaGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
Date: Mon, 13 Dec 2021 16:12:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: enable interrupts around dump_execstate()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0016.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc250497-9812-44c4-f8bb-08d9be4b0b54
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606910BEAA333F618930649B3749@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IW939SZDP/7KMuQTi51FLcr72QQB1nn3iHyZXgwNodX8rOAHjnohTZr+fqpvEkpV9oboJPHNw5E8B7EG9gAnCdTaLi9p51EBwj82jjfoMfZDOHT6o2AEsUk7lkqJi9gnY96db3BUOvER8bSM37MgIy2rItdmg7NGzJC3ATUgq2QcBEbVtPWIjto0oeMiknrwUg3Oevmh6kAR8sMNCTfulCSFViMcLSjbaIXV5oHhv73jJ5DQ1UHVkYx5c1wSd0nyGGU9PBltUbulEvwRele4g4wJJJDCMy8Tsrop5I7u7TlaXjcLRBZPDrwB3Ell8ZHCLnRvtUIBmn2nB16GptWg3EegqD8m+i9b+6L+wba3ufEFWLOs+gA4ShLmUCNxmubEzWp88BNytZcE+ObH65FEVAoTm3QsDSmLUl5ndrXGK7jfMj5G/NvyYrHDsP/9b3V9oyxDZkKoUKF3LlIg/C/MHylxdu1euzeP5R3/nCPZbjZM6ks++aNop2/6mW8keOTmR2BnFUGvGIZkSozXvLasV3Y+RXIcURw0SCXDY0ZASyRgv8Vt1dMX2YRAr6wF5zlizoh/XeRODuGEbpM2CyptDQmxICZ8m11qNoKhDRFrIR0Ge5pz/tk38BUQNGtsFmVoUAoC3RUrLLUKf9ywN+F8gaUdnk4CIvF3nvKgPlQZgRpqKRE+e3idGfmfB2zZxrWdJFAMGesGr7vtonyJXcoq9jZ2cduqKeLnVV1/+js3iIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(38100700002)(31696002)(5660300002)(4326008)(8676002)(31686004)(6486002)(6512007)(186003)(83380400001)(508600001)(66556008)(66946007)(66476007)(316002)(86362001)(8936002)(26005)(54906003)(6916009)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjExZXZXWkRETUg1U1F0T1ZLdVdnd1hvMzVWSU50Um9OeWFjQ0NwUDRJTERN?=
 =?utf-8?B?TGlWamF1UGdId0FVK2ZqTmh4TmZjZnFRTUQ2enRoZDFwc0s1Zi91Y0JJUWtU?=
 =?utf-8?B?dkZiejJub2YxblBiYmxuamRQNE8rMC92eS9FSEVsNndTMjQ5Ymx6eGxEUVFp?=
 =?utf-8?B?TkxHY3FLaDh6UFV5ZFdadUhJMWdkNGJMZzNsYVZGK2FLV1loWFlBMldpN2FM?=
 =?utf-8?B?VlgrMjdQeGgwSHVCdXd4TURDYVFBczl0Q0RkVnRERWcrd1Q4UzZZeUc5RDJl?=
 =?utf-8?B?WHc2WlFTR1B5VnN4cFhkeWI5WjFmYjBucDhrMlF2K0UrTlRnditkSnRGMENu?=
 =?utf-8?B?a3lJSzkrcUtiWHhIZjdsM3lsdHFIQXhrelB6QlE1Mys1NjQ3OHY0WlFDWmF3?=
 =?utf-8?B?dVlGenFYZnd5RGxYRGNjODlacloybjh6YjJqNXBnNUluendNenNSTVlaK1Y4?=
 =?utf-8?B?bkZmQkl2OWJSUittZUhTSU5Zand5b3p2cGxnQmVkYTZJdlB4U2M5NHhRRk1q?=
 =?utf-8?B?d3A3YXNtenZ3VW9mbk0xVDBkUnJsTGlpWDR6MkQwVFdKZ2tXUFBxVDdmVngz?=
 =?utf-8?B?d0VMRmw4ZFhDTE5wRFhIMDlkVXFlVkl3STNDLzNyekRXM1pYSDZOZjJ0NzJX?=
 =?utf-8?B?eFBackxtNGRaZUM5eW9wT2Y3ZU5mSmw1Unh0NzBCdnNlTEJQYW1SRmtvZ21y?=
 =?utf-8?B?cWgvblNzSmlNQk5sZHBBakNNWlZaQmRWVjYwMlJ5MTlOenhYM1J6OURIT3lQ?=
 =?utf-8?B?QytYbXpZaE9oTWZFN2F5NVJhMWR1YTVrazJGRVgxdFpiM1c0c2ZLaXdnUjZ1?=
 =?utf-8?B?b003dU1Xb011b2Z6em9lOTE4TEhuSWViaGtWd2htN2EranZ2c1dHSW1MOGRX?=
 =?utf-8?B?d09GSGNQbzhkZFpNUnhMSFZxQWhYdXU2OTZqT3ZYbW1ackZWeFJhNTBrVHdY?=
 =?utf-8?B?dEg1MjFIV3FZb2pwMFlrblRiNTJoMFk5dFM3Mlo1V2NkN3ZEanNKd1dxSS9C?=
 =?utf-8?B?RWJQNVdXazJmNmFHTGJadWdNRWVuQWtpcGNKdVA5MStPSkVPN1FNb0pwMWdX?=
 =?utf-8?B?N1NBa3hRZnRnQzRZTEZEcmZ0R3RwczQ3NG51OEtuQlFuT05zU2swYUxSZFBQ?=
 =?utf-8?B?OU9XaWwrSjNXRGs1dkZHNnhvMFhRaHE3bGY4US94aCt6ZklEbkhSVDdHdkNi?=
 =?utf-8?B?UytlMnBjbVhrNDN4OGl6NlA1Z01KcHNvN1RQako1V0xPZGdiUkgvUlpUZXB3?=
 =?utf-8?B?M2VlYW5aWkZZdnZQc1BVRTE1c053VjgrWGMzaDZhQXFiNXFFdE5uVGFWNitG?=
 =?utf-8?B?bEwwSmJHQTlabWV3MzNjSGYxcWFCNlBZQWVkbmhmYjFLM3MyZ1Jvakp3S3dq?=
 =?utf-8?B?N3d2NnJXdTdKd29hRE43WVVBM25VOEZ1eUhaUkJ4Q0JMNHBFMVRNK2JMbkRn?=
 =?utf-8?B?TWUveVpuQURSQXdDc2hhOTBMS1pLdjNPZGl6c01yM0JkNFMvUmJnV2EzVzFB?=
 =?utf-8?B?TStKZ0JTZ095azNEU3EwSmVFMCtYVHc4c3JxRE9lazV2ZzFIUWVGamNHMW5T?=
 =?utf-8?B?YVYvc3VJVmowWkNwT1hMUGUrOUNETW14QXBMSUthNnhTUHNKVUdMdkttKzVt?=
 =?utf-8?B?aTIweFVxTGJrSjBRb2dZeEFDWDd5QjJDNFZIUzhCUUNTVmdIOThIWDlMekgx?=
 =?utf-8?B?L3JjQzZuMWJEVzhzNkZnRGtpbStOTVVnNGN5SlZsbkd2NlFCd05oSUFQMlN4?=
 =?utf-8?B?TjFtUzk1YjFQY0RCNCt4aGJUWE1hd2J5cW1zNm5rZ0VvU1dtTU0rY1NGY0Za?=
 =?utf-8?B?ODZuRGR2SmxkQkNOQitTeVJxZmVjTHlBU1ZQVVp2VlFZZ2JTNTR6Szg0YW1t?=
 =?utf-8?B?R2MrMzBKVUtvazBrQWRlbWtsZ3lGZnExaEdaOGZZQUxaTVJLbEhvY3Y5ZktF?=
 =?utf-8?B?MHdnODErdTNQRGlzOFFqU1ZBL2FXOGZDNC9XNGZCai8xYU9iMm1hMndvRnVw?=
 =?utf-8?B?SlY0aDZ6UVRBck52eDNDOUNRSFJybEI1MjFUbHFWNUlodmpTZWJjUk5sbHIr?=
 =?utf-8?B?OUlMMW5FNEsxUS82OUtPZmJpQ2NwdVFyVmRvZlRSS3ZtR0ZJKzV0ZzZyZ0Ix?=
 =?utf-8?B?ZjdrMXo1bStycW1WbHlaaTZPNElZdnJiUnFwbWZ0SFlWUGdScWFSbklScGc0?=
 =?utf-8?Q?YfsF9CVB4Ld/QgGtvqn2Zv4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc250497-9812-44c4-f8bb-08d9be4b0b54
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:12:57.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUsF/Hte8v+e+7FS28ZkCjmYH2ByRBV0UuSLdfRVNroVvPQ30DPQINjr8kvOaMiXfn9PaNkRhpsT7cLLda8fpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

show_hvm_stack() requires interrupts to be enabled to avoids triggering
the consistency check in check_lock() for the p2m lock. To do so in
spurious_interrupt() requires adding reentrancy protection / handling
there.

Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_state()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The obvious (but imo undesirable) alternative is to suppress the call to
show_hvm_stack() when interrupts are disabled.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1386,22 +1386,40 @@ void smp_send_state_dump(unsigned int cp
  */
 void spurious_interrupt(struct cpu_user_regs *regs)
 {
+    static DEFINE_PER_CPU(unsigned int, recursed);
+    unsigned int cpu = smp_processor_id();
+
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
      * a request to dump local CPU state or to continue NMI handling).
      * Vectored interrupts are ACKed; spurious interrupts are not.
      */
-    if (apic_isr_read(SPURIOUS_APIC_VECTOR)) {
+    while ( apic_isr_read(SPURIOUS_APIC_VECTOR) )
+    {
         bool is_spurious;
 
+        if ( per_cpu(recursed, cpu)++ )
+            return;
+
         ack_APIC_irq();
         is_spurious = !nmi_check_continuation();
-        if (this_cpu(state_dump_pending)) {
-            this_cpu(state_dump_pending) = false;
+
+        if ( per_cpu(state_dump_pending, cpu) )
+        {
+            per_cpu(state_dump_pending, cpu) = false;
+
+            local_irq_enable();
+
             dump_execstate(regs);
-            is_spurious = false;
+
+            local_irq_disable();
+
+            /* (Ab)use is_spurious to arrange for loop continuation. */
+            is_spurious = per_cpu(recursed, cpu) > 1;
         }
 
+        per_cpu(recursed, cpu) = 0;
+
         if ( !is_spurious )
             return;
     }


