Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64708467705
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237504.411922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7KQ-0004uO-16; Fri, 03 Dec 2021 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237504.411922; Fri, 03 Dec 2021 12:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7KP-0004rd-TV; Fri, 03 Dec 2021 12:06:13 +0000
Received: by outflank-mailman (input) for mailman id 237504;
 Fri, 03 Dec 2021 12:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7KO-0004Rn-Of
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:06:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66b24870-5431-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:06:09 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-4QVetuCsOQ22W_Mt-roe_w-1; Fri, 03 Dec 2021 13:06:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 12:06:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:06:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0083.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 12:06:05 +0000
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
X-Inumbo-ID: 66b24870-5431-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638533169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrCpsxf//rC38Yu1bAGmHgfd83NmkO7BJIS+XBF2CsI=;
	b=iUGyGd39fQx7XAt1YrDWM7G8y8erEwX9u97Wu+wYDj6RKbkTd+55IXBMKkgJqSy7mUyiuE
	DFiORNFOxFqEMXZQmn3zSzJgyPEJrMTpAVmrOYFTTEwJahctlqRN0yhqXoMfCHayLFkggR
	r25O9jR1szwRIzDY9QxJVk16SNRNEu4=
X-MC-Unique: 4QVetuCsOQ22W_Mt-roe_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1fVguAM5V8rx83t9IR/psERW/1mMT7Ma0P50Va4QH+bxVshLAa9wWHPvCyGdkBByN8DWEyuWNfyfROhdptYIb44Ne+QojjsdP/vZBf/t325IB2btsiUfnZBY9KHUoGo08Zk8c7lU0rerd292jWihxi3lh6lVyoLXoseyS2KIKV9MyEGzmZlPOt7LP+XMIY8r7rT5TXiR01xZwY8bwMWLbegSq8fOIBqtzMwqZJfm39ufinaCeopU9zLTJbLXoYRx1I2jnIYE+tASUQWi6AdHhkyPBCXCNp0cm+DhEZLiTlo/P7bvGmcOudbWrE2cqouRiSwGeQ6w5W/F96cIfKdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrCpsxf//rC38Yu1bAGmHgfd83NmkO7BJIS+XBF2CsI=;
 b=EIFiabaRuSdJ74uTdAWIrYqUwXOZWC9oHIhJuF1lF/evV0wdthMDVXr8m8DTVn5cAcNbjocO00BPhQayQhTeDqiYqDPEG6Izx1qRwloQv3jgm7rwVx/F6nl3FxFuFMq+DsySsQ2kMBdpibXU8npDpzqs8fKnfbj7ME6H2RjhQ9EklyJK1TEdY7DgJQ6ZWEe7ldaHuFtJx5WxXYjkiIqBUCdcaa8xXJYWBuyn/V+NuNOnEBQsDlhsLNf4jO8ajM02v8ZB/8L6eo5h2hR28P5FzzR/pZ5CS7upQfBlrjqdgn5pc+NvzLyW+yKMlnAOoWF/fmjSm0wGZ45omgvW7nrQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c94bc336-fdee-43af-540e-06e0904d8db7@suse.com>
Date: Fri, 3 Dec 2021 13:06:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 4/5] SVM: sync VM-exit perf counters with known VM-exit
 reasons
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
In-Reply-To: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0083.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 084287df-8497-4aca-636c-08d9b65548ee
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41913D6110B9C0C220D4E449B36A9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CBdYD8brSmj+sXlIdI1900fIoJ4ZXlTSOX0qxa6umyea1KrNEqDF8cO7v+GC0exJ6I/rSfKld5ZmeFfBoVsfrzqTAlyZZ0K2sxIE2IeFrKokNnNgd19sX1TsWdQ0X7VF5pjI5YO6gICPq1sGaCFkZq1DJ+v+pJjMbAnQVo17jBnN8DdUHMk1DbKMhcKBZUnZaLVJGppkYqXToZf1r16lLK1MEqYV+zCE0pVfl7j0MT+e+LOtkJUue1CcU5R3IiocHhFOQI/qQc3NdTDa/LX9iEF4gW+CyiX7fD+dDYXQvC0opOsqHm+nqMl704iVu/nCbKI8k3k/pylEV6gifv0SuJ7JiD0BrNkYP7+K98+tXp+UmHHUBZzVIcg0xxQJSfQBuhyjCLkyQ9nc7dZRNYkeC9k803SXdmlFJIqYI0LR3+wf9fr8U06qZRWJwqw21u9yIQr7XNm90nbXsdjyTSd+Ul28ZLgwZDcXDT15wt1bJC0EhkYM8Qq5XiXxpaXnL2KLdxHVYkeIYU6vEb/Cj/g5xeULscNViV2Hkmxo2/fVU1CY56lmikd4xzOyf+URfQ7Mdqk7FqukWKjpYXg0+9t8K0Q6q+QU1KPLl3TvHC8kkCmqWWvfSf41cbsRNTpsU7pwOS9Y//FKtMRTEZkwPI4uj55rmc8kKrhot9pEfg9YiuicDk34rMoOH4AFzBjXvfN/wYHVtRZV0xkYz9xk/LnpYh10sB1JSHhyCFBvsbOsVmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(86362001)(8936002)(5660300002)(2906002)(4326008)(8676002)(83380400001)(508600001)(54906003)(6486002)(956004)(36756003)(2616005)(186003)(38100700002)(26005)(31696002)(66946007)(31686004)(66476007)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndkOWlpTDBHcWQ4ei9vRXNSMVJ1UEZGU0tJOXM3eklVZUJjYjJ5eG04V0FH?=
 =?utf-8?B?anlTa0hLNjFRSUdncUtLY3REeDZQbFJPY0EyeGN3eUQ2RXJHZTJSVWtXS0Zr?=
 =?utf-8?B?K1dXNUNDV2crdExsaTFtcjRuNjJTbWxKK1pEZytIaEQwOE1xVytYKzlaYUNz?=
 =?utf-8?B?VUViOUtYUTJpaDBPU2JBeUtYMmRFTFdjRTl1WUdsOXJZa1g2aFZNSytKRW1t?=
 =?utf-8?B?Snp2UnJFa25ZMjhpWkNTWG5GbmRmNjRNczNuNEhFa3MvSXRuVzR0QXh4Mnhx?=
 =?utf-8?B?ZFhOOUNld2pveVRKQjNpMmoyOGQ5R1BZSC9JUmdVZHRReWdvSjFPK1Roanov?=
 =?utf-8?B?dy9kWCtrME1aZDBFNDBBWWpyOFVuRWc0dkNCRzBSNm91MU1pQnpLSDFGL3Iv?=
 =?utf-8?B?cUlMUkc1V1h0Z3VTd0JWSWdOLzFTSlUzNVhnWW1xVjBWall3dHdnQWF5WGRQ?=
 =?utf-8?B?UC9xdDFpTDR5ZVZXSUFDZGFlcHdIZ1NtdzZWSmt1L01WYVZ2em9jUi96dUFT?=
 =?utf-8?B?SmFCb1V5SysxRGpXMGdlaWlraEd3SXZYb2orOTRwUFlvWEN3TEQwVkFKVjVz?=
 =?utf-8?B?a0lFT1ZXdXNxWHRpKzVjSUEva0hLVXJQR3pBaEI3RVlpcm1USUZWTU1ITVlU?=
 =?utf-8?B?TVhQZU5CdzFYeXJhT1dFRUhEWHFMKzhvY3NjK1dxL1RhbHd2cThpMWJxRlNy?=
 =?utf-8?B?dnBmazBDMDM5QkZ0Ulhmb3Yvc3QzODNMU2l6ajBpalkwZ0ZEOUpkckhUTzF6?=
 =?utf-8?B?VlFFS1VkU09qM281b3pBUXVFeGdBdXppZk5CakNWeHBldnRhQWFmVnJtRDdp?=
 =?utf-8?B?VWc2UDdPZ1RoWDVOd1pPRjFqanc4bU1HK0FpK00yNTF4TXI1SVA1OXhJeUFK?=
 =?utf-8?B?OEFFdnBac3hOMHBlL2lMVE5DcEpBdVBtTDFiK3VmZHJMdkdCYy8wMDJocGZw?=
 =?utf-8?B?RWp2Vm8rVGhlK3h4THlQcHJWdkNsOHFwbi9TSTBZQXpWME1Jc3pwdkJtekI2?=
 =?utf-8?B?aStVTGhhZnVyWFpUbWtoQVRLTUpHbzhheGE3NVJDRnYyOEM3dW56eDZWSXNC?=
 =?utf-8?B?WkZQWEJ4ZTkzV0pETnVOVGtrMGlBWDFrdUhhbkFYYkZXaEFHTlBJcmVuWDFP?=
 =?utf-8?B?RkVBeGtiZWJVSmRpRXdZOVBneDNoSGJQbmNkcHlDeFVKd0MvTWpGUlVsWXkr?=
 =?utf-8?B?T0pJZncvNmhhNUkyRWJLcEt0eU5sZ2x5bWlHWkhIVC8xeUFsQ0JNZHYxcUJn?=
 =?utf-8?B?MmhqRWpkL2pCeFdLQ0gvY3dTbjBDRGh1SytsUFg2dFcrWm5EZllJSDR3bWlG?=
 =?utf-8?B?czF6YVhQOTEyYU8rNSs2S3FubEpnVnJoclo2VWxpNTVrT1plQ0NKa2xsUEkx?=
 =?utf-8?B?S20wSFNlUUNCZUZ6K3pWSjNlcHBvZnA2T0VVbVlPdk53eFJ0R0lQN1NuR3Ew?=
 =?utf-8?B?amk3dWR1NC9Sak1hc1hpamZDTXlVdGdnSGY4MTA2YUF6SjZtYU5qd2M1V01I?=
 =?utf-8?B?dllxQ0VRNkQ1TjA3Yjd4Y1V3RjQ3Uk9PcUxFM0JTN01pYkRCN2F1clRyaGJ6?=
 =?utf-8?B?M2JxUTg3OTNQMjhKL29yWlhISXZjbGw1UnhaYWVHMUtmUDVHV3VBL0t1elNY?=
 =?utf-8?B?aWI4MkpkaDJneG1CSFpuRENMVzIwOHFNYVNJcjFlVlFTTXNzY2MxYlMybDV6?=
 =?utf-8?B?UHo5c3JxRERCVmY5ajBwMWc1c3hZaDM2NmkrZkdiNklrQ3NqSys4bjJzWEhi?=
 =?utf-8?B?bUVndmdTd0FNNmNmSzJOQ2l0Z3MxaGxpU2o4K2Q1Y1F4Ly82NnNJN2tHOGVp?=
 =?utf-8?B?d21JUEZqRDZ3NGwwL0JzRlExR0ltdmlKQjdVOG8xMXhRL1U2cFRTSUx6V2RD?=
 =?utf-8?B?ZjFRNi9WRlY2UTVsUy94UkRSSmFhZ1BHNlFNRUcvN3BrRFVneEhkODRQLzQy?=
 =?utf-8?B?OUt6dVNFS3VaWGVMM1FpaloyRXgzaHhUZzJvUjBQSVZSV0plYU11d1IwU2RR?=
 =?utf-8?B?QU9CVk9EMGhFVkxZUkJYZHJqWjRNQ2FTamNtY0Zhc21mVkVMbm5JVk8zdzFu?=
 =?utf-8?B?Y0NlaHl2Qy95SVlDb3krYnMyTmdnK292bWtCbzhYSkxXYXlFaGwrbW9rOTh1?=
 =?utf-8?B?dEtFNFhmK3BIOVpESG04YUFTTHVpV0FUcDM4cDFlenFEYXFhNDZBQUNPUDdM?=
 =?utf-8?Q?1WJF4g4dYWct2Cikf9mdi6A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084287df-8497-4aca-636c-08d9b65548ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:06:06.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9AYsZLSo+4t/iINfivrIxR5brrFFY01/R1rBmftFceYwH7kn4f3dPEEVwdS4HZaQigYTxB025JykEm0yqDpXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

This has gone out of sync over time, resulting in NPF and XSETBV exits
incrementing the same counter. Introduce a simplistic mechanism to
hopefully keep things in better sync going forward.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Given their large (and growing) number, I wonder whether we shouldn't
fold "SVMexits" and "vmexits". They can't both be active at the same
time.

I wasn't sure about the #ifdef: Using CONFIG_PERF_COUNTERS there would
seem slightly odd next to a construct which specifically abstracts away
this aspect.

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2644,6 +2644,10 @@ void svm_vmexit_handler(struct cpu_user_
         goto out;
     }
 
+    /* Note: "+2" to account for VMEXIT_NPF_PERFC. */
+#ifdef SVM_PERF_EXIT_REASON_SIZE
+    BUILD_BUG_ON(SVM_PERF_EXIT_REASON_SIZE != VMEXIT_LAST + 2);
+#endif
     perfc_incra(svmexits, exit_reason);
 
     hvm_maybe_deassert_evtchn_irq();
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -302,6 +302,7 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
     VMEXIT_RDPRU            = 142, /* 0x8e */
+#define VMEXIT_LAST VMEXIT_RDPRU
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     VMEXIT_INVALID          =  -1
 };
--- a/xen/include/asm-x86/perfc_defn.h
+++ b/xen/include/asm-x86/perfc_defn.h
@@ -11,8 +11,8 @@ PERFCOUNTER_ARRAY(exceptions,
 PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
 PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)
 
-#define VMEXIT_NPF_PERFC 141
-#define SVM_PERF_EXIT_REASON_SIZE (1+141)
+#define VMEXIT_NPF_PERFC 143
+#define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(svmexits,             "SVMexits", SVM_PERF_EXIT_REASON_SIZE)
 
 #endif /* CONFIG_HVM */


