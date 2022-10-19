Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55058603AD5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425552.673450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3hS-0004PV-5S; Wed, 19 Oct 2022 07:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425552.673450; Wed, 19 Oct 2022 07:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3hS-0004N2-2e; Wed, 19 Oct 2022 07:41:14 +0000
Received: by outflank-mailman (input) for mailman id 425552;
 Wed, 19 Oct 2022 07:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3hQ-0003Zj-K9
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:41:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6722243f-4f81-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:41:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:41:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:41:10 +0000
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
X-Inumbo-ID: 6722243f-4f81-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIhE9zIa89SFf+cHOPBHECxdOiSLaHPWte+PjRZnwk0OnvNSjNAM/wcZx/zjeeDAxy2KwIli+Lvhlc7M411qV03BuI8oJEwr8a/bKX/AK27UAfXviO/mfTEinDq5lKg9FrWti5Qd7sVwoooqcxzifGX/38Ekl/5J72BZG87xVcfc3UvPLToYfuyORdPI4CtIxA9DDm5E16lwytETBOZGEbZtKpBO5NUJYyyEjAGph+uMdJ/erxuJSGmWnimfREAk+y0Mjpf3wKTpVuehRcwJVDJCJyHIlc777plKqkMSAjMp5dtCNp+mYpGTOoH5lVWs/OtepFwauMGyoz99UMX4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZp+A6KIECj3TCy69kUkEPmXjjjlHR2l+u9nS0q8m9M=;
 b=D6e323yIvK2fQFHtHf0x9IEnEkO3KsKQMDnw0OR8NVsyLXHfHVQVGbSIe7f/YCEyQ8AZbTXp3ik73QEG2bv5GLGIjtEZY3AJBXZJ0po3HYC/kjxyo/D2BH5w7r1tN6OJN83hUpIXegF56ZLtljL0EbxfLCDsSxi6kcnQD1MFpI+DAWezchTeCZTHP9iC4uj7ilWUOQzuZtcX2fubr6pC4aSsce/5PZiXcbHPdIsJapidUS/neMMQYbox5LsyIp2qcK0+QEkLCi/VenDKJfUJKjPc/neFcG8/6bweU4QF/fLlJG60j4CeGKDzJ/nYUpAo68bSzHPBK5q4xuRNHyOYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZp+A6KIECj3TCy69kUkEPmXjjjlHR2l+u9nS0q8m9M=;
 b=mrUuh7e4haF3QCUhjMHMxDkuvI7nuiPgfindF1O1/ASDAXtg3Kwb8AVV7Dh+3FCa4urRm8o8TpQXf1koepNVbwpRmLMxcEglgntnR+Fg2hdY+YsmFs6r9j/kX4HwyVlou2hqGLrlX3+fEJFGdFBafDLL9nbnGM8pOdgpaUA862EHTsuNYPyXhwcYEqaNb9vq6tvuyzuDKJcfgfq31ZCKsSx+LrQZuvXAuIl3g/hhSmvZMPsxmm0zqeZvnQePiXCs5dpHmhrwn4x8HByzXo8DUc4L6u3KdV0ctvRNWosSshdK8KfU9WPI+XUdI7T/1susOnvRU7h5qPDu2FYZrM12Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
Date: Wed, 19 Oct 2022 09:41:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0098.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 519bc538-f9d8-498d-a15c-08dab1a54a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6kJZBBSRNjt6kprI8vd27PyXX0MSuyL1D00cmStSZtOSJUhioZTLvKU7suAPiehczis8uJ6dd41fL8ctbQhCMghoXQKnPUnhdEg0zyhWE7k6qM7ZpvXkuEMmrpM/8qZ9ILyD5HVfRBZnMVCPj7+RTHdLO8aO3hQjAhkJWRXfUiJzCs57OCBUEun9V80H4G8PCD14SY8/3v06pC1LMPNYQ10rTNuSJQQidrDyC25FYedUMhBS58b5nAtYgAagUggSFrS1rrk/Jf2TtvXGKk4GQOa9lNTFKseSmJ7e/NO4e+BZXtg1uV5+/kCRsUwImDz3wGRrSAnzdsv837DlOyx20EJYtVVGxX7is1memkH60YjI9J6vNXaOkq32GTnjQY5n8pBiM16/L52Tr10R/L+IE3ml37t16mGifyeeqf8NcdDewGo8oJaOZdWRp7iEuTN86wDBizMeDOiIG9toEQRhuhNsaM6d7DRBFbkoOgqX+95WQbTzBXTKoUJvclQQsMmstwFUrcV/y/pZizNu3F1ML1Xmt2pbbeaW/LTuZNOft+dCyJa/xDQJlkFVlb8NC4/pBcrpHrR3w0romaT9a2BPvPu6tymTKChcP87caZtsz8sa1DNd26DAh+Zs1XcoxRsMsPOj2QgZ4EE9XtcZwhGiEbujuysgb4jPT3D2gU/NgXOKT1BM2iDJZlXbNXuf+nj5qpvyvJitmFWwot7oRpCH4XD9cvfYCTusaPpWWRZYdNvEVIKpTcn+f+df01Qh32zUEGRNF/fjslNUqM5sU4frlAUMLWmN8EpHyBnkcKmOcy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(15650500001)(41300700001)(2906002)(5660300002)(31686004)(8936002)(316002)(6916009)(54906003)(6506007)(478600001)(66476007)(66946007)(6486002)(4326008)(8676002)(36756003)(66556008)(38100700002)(31696002)(86362001)(26005)(83380400001)(6512007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3dFY0Myc3JGRURlbWkxRmxNSW9mMmE2cFZGdTZKT0J4aEhVUGVGajhvYSt6?=
 =?utf-8?B?c1JNbm5iZnpsNWM2ZnAyYVRYS3R6cmVWWFgycWN0dHpJc2FvSmllR0xTS0hO?=
 =?utf-8?B?a3p1WXVKS1NwTjMwc2xRSEk2ZllkVFpFUitQQTVWNjhXSEN5QTBCdEZkWFZN?=
 =?utf-8?B?a1ZqanBXci95cXpHRElUbHo4VWl2NnZZcVlUN3RzK0NzSmtiM1ZHTmtXU0kx?=
 =?utf-8?B?WlZMZEt0K3BYRmF2TCt2Y2xDa3JuaTU2SXBwRnlzczJhdnplM0s2ZXVydS9h?=
 =?utf-8?B?UGZVMFZFWUJ1Si9BejNXeC95Q05QbHNUMVdxWmZxRmdsc0gwRndXSmIyWm40?=
 =?utf-8?B?TVdxZGRRWmZrY2ozcHlsMkJwUlh0NEZHb2E1aGhZYjVsU3VaK0VHS09zbjJV?=
 =?utf-8?B?ZnVldE1OaXNYaVRjREZFYVR0alVkNUhuTFA0RGlJR2dSYUExczhGQ3VhQlFI?=
 =?utf-8?B?d0NwZW1uYVJOamF0YnI4SDh0dmR2Vm5XbFZQSkxQQnFXZ29kTmlXZ2tYQ0li?=
 =?utf-8?B?Uk0wdGRKN0hNYkI1cW1aMldYTlhBZGZVc0xsQitwSEdKLytKRVhNWDhKR2Vo?=
 =?utf-8?B?U0htbTU0alh5MmpkUkVta1lDRGJJK2VzOURFTVBtVVViaVhQN1VzWm4xNjZV?=
 =?utf-8?B?YUJnWjVOMXRLTFBFR1E4UUpSNi9QQU5YZUFEU3U0b2tadVFhTWxYUjN3T0Yy?=
 =?utf-8?B?QkFaMWdZZUFqNzJYT3RtMzRzMDVXQ3duZTVsNUt0elIxRnduc0RtVStCQjRB?=
 =?utf-8?B?bUNjamdoVnB5dEgzMTlNL1VIcXFleXZUTFF1VnpqTWYrazJpMW5NTWNwTVhr?=
 =?utf-8?B?anlKMUhBZVpXMDRjSUI5YkIzUHJkUm0wcDI2Tm5ucjNxYUQ1WW5YaWhsNlJ6?=
 =?utf-8?B?cEF3R0F6Zk1LbXltd2t0L1VMbDEzNFZ1Z29vUEcya2ZhRlB2cG1reElVLzlP?=
 =?utf-8?B?WUNLblJiMjdYLy9zUW5qRTZjU2kvTWF4cWk1eFFBMWkyQWYwQUNpOFhhTDND?=
 =?utf-8?B?K21FQ2gzbWVFay92QUNpRDRmSDZnUXhUdUlkM0NBQURIejlYSTZUdXJNK1pi?=
 =?utf-8?B?d3RQU1RTSy9GREdNdm5BcGFlbGE5dFgyU2hlR2FPT3ExMUJZQk9TVlluWmpp?=
 =?utf-8?B?YUJKRHZCQWFyRzZ5ZitkZFhGK1F6RXB0TEl1SnV3MFk2dE1UR0hOcHZkYjRQ?=
 =?utf-8?B?YmFUY0R6T3FTU21TMDJaMWdENzdTcjY0NS9uREgreUFuaDRXbk8yNjg1MzJT?=
 =?utf-8?B?d3Avdy9LNjJ5Q0wxZTZqOU4rSFhtYmpNYzlib0xRK2xZSW1HaVM0bmxSNWhJ?=
 =?utf-8?B?Qjh2ZEkwQ2hBZVM5N1BjQUV6Rm5HNDRIZ1FiOVNxZXNCWVRvWisvMWYvdnYv?=
 =?utf-8?B?VGxVMEZzeDE2SDVvd2NGajc1WHl5enU3R3FsNUR5N0x2WEpLaWw4L0hsbjJN?=
 =?utf-8?B?eFdtc0krTlpKRVpueFdsU1lkak0zblhXYlI0SE9ZUFpnbCtBL1JQWjcwaHJU?=
 =?utf-8?B?eXloSk5ra1N3MU9PcitSdnJIYlVOV0tpeGRFQnd2K0FvSFJKeDBWZGNSOFlF?=
 =?utf-8?B?SlBGYkdiMTZmdktzL3FWTTZnZUZnNW41ekxRdGtoSGs4N1lBRldJdlg1N3Fq?=
 =?utf-8?B?V0J4VDg5YU9ZVGRxQTRjKyt2TVpUalRyczVPTFU0TWQ0S1ZZT2hpUTVZeWl4?=
 =?utf-8?B?Y2tDOTVmdUl2V2hVQnlIWnpuV0p5cnJoUUI1U09QTlk3NURtZ3kzbERaNE9s?=
 =?utf-8?B?NFlGa2pTbjVhSzUzM1pSc2xNRDZlekN5SHVZWkYraThFNVoyVzRWY1hvbXZT?=
 =?utf-8?B?ZTVQcUNBbSs5STRQYXpUdENMWVF6WUJHNFJ5UXVDc1Z1RkNLS24wdHZLMllw?=
 =?utf-8?B?R044VldxNzM1YVBkT3NlaW1wU2twWi9NQjZYdnA4Y2lDTEw5Z1hqZWpWcXNO?=
 =?utf-8?B?aGIxcnBWSWhQWGV1bTRaSGdVeUxpd2QxemxPMkhDRVVKMXdydkJONU5xcnIv?=
 =?utf-8?B?eEc2bXpZUFExTytFaDdOOVgzSjh6Q1dUNjZuMlZqa1NtaHFiMStBbUhtUThM?=
 =?utf-8?B?Q3cwbTQ5VUxodlZWUzlrL2szSEVpUFA0TVY4NDFoNjJpaUwzTjdYaDJqV3VZ?=
 =?utf-8?Q?QnvGE1NJxNTHJQ6F7XmyY2WdT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519bc538-f9d8-498d-a15c-08dab1a54a7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:41:10.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrDuOGT569USg1YIsWPmbErc/tzLJy1A0eNgBCd+joJDfNF5nbDlWxn9h7eNufDbkpIXnPDEWNI4D4xR09/R8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7053

Before adding a new vCPU operation to register the runstate area by
guest-physical address, add code to actually keep such areas up-to-date.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Pages aren't marked dirty when written to (matching the handling of
     space mapped by map_vcpu_info() afaict), on the basis that the
     registrations are lost anyway across migration. Plus the contents
     of the areas in question have to be deemed volatile in the first
     place (so saving a "most recent" value is pretty meaningless even
     for e.g. snapshotting).

RFC: Can we perhaps avoid the VM-assist conditionals, assuming the more
     modern behavior to apply uniformly for gaddr-based registrations?

RFC: HVM guests (on x86) can change bitness and hence layout (and size!
     and alignment) of the runstate area. I don't think it is an option
     to require 32-bit code to pass a range such that even the 64-bit
     layout wouldn't cross a page boundary (and be suitably aligned). I
     also don't see any other good solution, so for now a crude approach
     with an extra boolean is used (using has_32bit_shinfo() isn't race
     free and could hence lead to overrunning the mapped space).

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1599,14 +1599,55 @@ bool update_runstate_area(struct vcpu *v
     struct guest_memory_policy policy = { };
     void __user *guest_handle = NULL;
     struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info *map = v->runstate_guest_area.map;
+
+    memcpy(&runstate, &v->runstate, sizeof(runstate));
+
+    if ( map )
+    {
+        uint64_t *pset = NULL;
+#ifdef CONFIG_COMPAT
+        struct compat_vcpu_runstate_info *cmap = NULL;
+
+        if ( v->runstate_guest_area_compat )
+            cmap = (void *)map;
+#endif
+
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+#ifdef CONFIG_COMPAT
+            if ( cmap )
+                pset = &cmap->state_entry_time;
+            else
+#endif
+                pset = &map->state_entry_time;
+            runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+            write_atomic(pset, runstate.state_entry_time);
+            smp_wmb();
+        }
+
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            XLAT_vcpu_runstate_info(cmap, &runstate);
+        else
+#endif
+            *map = runstate;
+
+        if ( pset )
+        {
+            smp_wmb();
+            runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+            write_atomic(pset, runstate.state_entry_time);
+        }
+
+        return true;
+    }
 
     if ( guest_handle_is_null(runstate_guest(v)) )
         return true;
 
     update_guest_memory_policy(v, &policy);
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
-
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
 #ifdef CONFIG_COMPAT
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -231,6 +231,8 @@ struct vcpu
 #ifdef CONFIG_COMPAT
     /* A hypercall is using the compat ABI? */
     bool             hcall_compat;
+    /* Physical runstate area registered via compat ABI? */
+    bool             runstate_guest_area_compat;
 #endif
 
 #ifdef CONFIG_IOREQ_SERVER


