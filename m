Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6104853EB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 14:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253608.434807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56ny-0003t0-9U; Wed, 05 Jan 2022 13:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253608.434807; Wed, 05 Jan 2022 13:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56ny-0003qC-51; Wed, 05 Jan 2022 13:58:18 +0000
Received: by outflank-mailman (input) for mailman id 253608;
 Wed, 05 Jan 2022 13:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n56nw-0003oZ-Ih
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 13:58:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8782c489-6e2f-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 14:58:15 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28--hAy7QPeNRWkXJ_HvB9LDA-1; Wed, 05 Jan 2022 14:58:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 13:58:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 13:58:13 +0000
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
X-Inumbo-ID: 8782c489-6e2f-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641391095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SqkPX7FWlaMH1FnPGqWT6XCdFCtT6FzcXUuscARTGtE=;
	b=A3N8XfXceGB6oQcAgqNVhVvtr5N0bxiabfwaTe+exVMa7NmEoj8Ia4j5p2sb3ekR9ufNgO
	6ggcQFE0iPAhRYmj3DqrwdXbIPME/4kX/InCg1RlgLYCz7F/wTS2UuqtlqG0X/Yf5TT0nq
	JKxp+Aw/wBu5AJc+HURE7nh51jKN4vg=
X-MC-Unique: -hAy7QPeNRWkXJ_HvB9LDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEIB9rQEhl9p4nCS0lm6BaTvDaMfs+ZnD2IDakzAQRczWQh4kif0eerd/RipUXWQzMGGrD95cKsu3aQADPMPCLXhRohuiUg5EOy1DVPtAkES2gtegQ093W0kaVduGrQ+M/eMFOx9m7TR6un3Ryv+mpRMbayuAkjCRBZaTSkXWtqtMgJPO5PFAxL+f8JAy683U+aYPexVOptF8Ks2wm4kt1/e49sjeUshVAnHQjhVbDI7kfjfq9OB/xYD+hsw0IY8eSbHWr34ZWT65rccs8mzbnWRlxIo/0J57cOg3AD7w34SrfPawzHH408jaBPVrhYSHwx2eaq0CSMRU88nW7pNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqkPX7FWlaMH1FnPGqWT6XCdFCtT6FzcXUuscARTGtE=;
 b=Nf2W0JjnrWDZPSop/fovTwHH0Kpsi/St3yVYju4H1CW1+DDllu2gJ4dtdgFsN+/v6sx7ZX4s015v89OMRQP46VOudvL/wytjR4nbNUB0Zig2OBt0ro9Mi18XrKYxAqj6iduEzk8zobAWN5u6nqv1cy0VUzip3fl/byN7UOFgB6p3NABU6tjMr7jT51VI21k05L2+6ye3X0FBW4LvYmwneZ6SvkSOgWZt1t2Mcydfw/KdfyclmE1jQ7Wq+uDbtu5GF0gNKEZD120+twiUnvFi5iZdiR9TOttY4G9EoTzh/9iDLv7lh8TMfnR8JxGlGCftBV7Cc9+yjCcSppmlNnu4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00a9007c-62ef-8bad-5a92-67d0b880fda6@suse.com>
Date: Wed, 5 Jan 2022 14:58:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v2 2/3] SVM: sync VM-exit perf counters with known VM-exit
 reasons
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
In-Reply-To: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0008.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 151456b1-bc22-417a-d8cf-08d9d0536a14
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301F1C9A6CEAC44670B0621B34B9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xGFmIx09MhnwdSFoxiJC6ecOyU+dr+PkzltC8TR00D2SOHCj6Ajh++ynngNdr3berCeo5CDTIPW75G5vZ3gTCPw+gnXD6eTRpVvzMS8JAaBa+pwfsmzGTb1K1OxCeUOaVyt4S/LXNKzwXfB7rQUTBu2Z2gVrTNEBTfph205CaKYfegd0CqwyUJkocRlcXTE6sFdf6NIfx/AsEhN7ruf2EwvyYG+cyQi3U+V3GYV1Q8V9R/ZjYuVAI7MWNL4oRe/A3q4Rr7S/BB3uplo6P6maM/FAryaJVTblBPu7iaYMIIgngJ+kWlW8VtIiuW2xCZuOWoZAmuvtNXWQU6e88jHN73YrHSqE6UbSZtBCRhW2YanvMSy0W+RAsPk07pfeMJSdo/F/k4yyPnomuKdBtaG6h0a6Cs2hCMWf55/sTPvxzGCA2cjka6ybZrXbaWhmc1GS8enne+sc+wdD1509/bW81z+QjF5Rmx6tk2uKLadP7WO9NowWEibo9fi8D/8qsTrX6HNwOv6s1cukYIapnepPsDrHLjZP8LeucEWn3pPYcHqxhKfVXPNLDsDpYLW6yOLFsXghHQkVLYTLWImA5GdLkAK/56IN0VwSYztSr/J0K0O3YaSH0sBjzio39KMbND7KOz+fflZcsMMMy9D5NYjw+xQ4caDv6zk+LBeTsCDZaYgcuKx/MFPuekDzP9HBKY7k3gzUCWJPXEN1iPQLKzGtYdTksFJAJU5BY3T/TLlR1MCKOnsp9kWKxwDUow2lKZc/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(54906003)(66556008)(6916009)(8676002)(508600001)(6486002)(38100700002)(83380400001)(66476007)(316002)(66946007)(86362001)(2616005)(36756003)(6506007)(4326008)(5660300002)(31686004)(6512007)(2906002)(8936002)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXV0WlJSVTY4d1N6b1dyZkROeFplVGJ1anJubFAzK1Y5U21ocWlvbHh6UFJF?=
 =?utf-8?B?QnZjeGI4ZXA4TkdNOGt4SHJveXBIZzU0dnlGV0h0SGZONkQ1YjBxNmxGZ1Z4?=
 =?utf-8?B?bkZ6RGVER3lzR2lIeTJpMkJkVUM4VS9nL01iYTRCeFNHUzZBTThKdzEyNUtr?=
 =?utf-8?B?Q3NOa05GbkFLK3hsVTVxZWd5TXZ0Ymcra1pUMlNIMTZwQkFoM3F0T0djWlUw?=
 =?utf-8?B?SDEzUFEwekZvZisraWk2ODgrTkVnSkpyZStYRnFuSUJ5QUd4OTkzN0R5d3pJ?=
 =?utf-8?B?WGRiWFV5aldYNFdOVkp4eFRsWjNFalVkdUpwVE02M3VPWmhSWklQS2RTdEs5?=
 =?utf-8?B?QTJSMS94MDJrU0pnTTU2eE5TQm1nY0ZyNnp2bVY3QnMrZ2VZRzdBNm04S0Fi?=
 =?utf-8?B?Q0tiTnNaL3NmOEVWQzhEemFEbmRKVk5iLzFkbDBGbUpkTDZPc0NUb3NOcVhQ?=
 =?utf-8?B?L0hwTFNrZzNhQVFDcGxmeEpCWGIrL2VzQTNuRnBDN3I5aDVIam9NRlBYeTk5?=
 =?utf-8?B?NW1Jc0tINUZ3TzdnNnN3TE9ZTEhGbWVKZTc3WTZFNlB1YXNRUmIxb1FkcUJn?=
 =?utf-8?B?TGhpNzVTSm5kbGltbm5aamxxR0NYOEFGVTRFR3NaZ0t0Mlh4eHZNa1dmdzEw?=
 =?utf-8?B?aktQR3pwYmgyS1hjRmJzR2QxbXZpUndyQzc0UVdGRFJLM0M4Y014Skd2azBj?=
 =?utf-8?B?ekFXWXlEbDIxYkZaeUoxVFpabW9tWk55RFdqdmZrZXl1aU1GcDdxZ1NQdU8w?=
 =?utf-8?B?ZVhlaXRVck1IUEw1OWxrZWdsa2ZOMVJvcTdSWm42M0ZYaFNNMkJLcHhDVEk1?=
 =?utf-8?B?RG9PS2JCTzhpNFBxWWNiUXBuQmFTb1Bpb3gzR1BCZENPWUhNSW9ZU2NvdkVN?=
 =?utf-8?B?MTEwd2IwRFBKQUJNb0d1MmczSE8zMWV3UnNOMzFOQzBIZ1Z4cUJsQVdneVFr?=
 =?utf-8?B?bnhNTUh3NUJ1MWpINDAxOFhwSVo4dkE3M2ZKN1VpcitsSXNhenEzTEdaN3B1?=
 =?utf-8?B?bnVUOTV0QUYzc2lBWFBUL3lGckpYbXZWK1B2ekJCYzlKa1MvN0kvVWhRQkhi?=
 =?utf-8?B?TlRNa0RIeWpCTDE3cjNGK2o3VUxaTVRoL2EwU3dNbmN3RGZubUpHVHJkZXYw?=
 =?utf-8?B?Q3lkN2xxQ2lWSlVsclVjV3lQQkVwaFl3YUlDM1BGakhteEhUbG1ES2xYM2hS?=
 =?utf-8?B?VVRaVkh5MmpSU3U4RU1iSGJvOVpNMWRabElPOE9WOXFCdXh4dTZTV3RETGdN?=
 =?utf-8?B?VVZ4b1RMemN6bWpnUS8reEt0Q2hZcXZjQk5GeFptbGtGN09tOTBGUCs1Z2RQ?=
 =?utf-8?B?L1VNdlcxOTNyVjZMdG1qWnlPdU00WFZhTi9Ba1Uwc3BPSFN5Tmdyc2RqTUhQ?=
 =?utf-8?B?aWJIbXdsNEVnNGVyTWdtdUpOS0FUbHpyU2RXNlVhaWsweTFNR3dTVllkSnlQ?=
 =?utf-8?B?alNPUTBTZyswek1sUmhtSkdTOVNlRE9QVWxmYlFSVk5SZkpFdWNkN0FIYVRH?=
 =?utf-8?B?QWptMkR3akpFRlBVdE5jakpQRklwS0pQN1hNaUZFOFd3OHA3VHpjbWtRNisw?=
 =?utf-8?B?OTRaK3JhQmRnWHQ0T3VLOTJINlMyU2tncG5HdlZ2RHFVRkhhZHdnN3BxUVRq?=
 =?utf-8?B?ME9CUXR1OEQrWVRjNUhGZlJGOUlLZHBERUtOOFF2elA5Z3FyVlk1VWM1bHpG?=
 =?utf-8?B?VGN6b2JYWVRXTExkODAyNTYycG9hZm1LdGE2NjQ0OXhNb0VvZUFKQ2g4WlVG?=
 =?utf-8?B?d2Z5R2FSYnNWWG1iM1IzQlprQWQxVE1zNUNEMmJZQnprblptQ0thaE56cTBr?=
 =?utf-8?B?UnBvZFM3UE1wTHFHdGFsS0o1aGNjdFF3WjJZSksyQlhmTm1tUnZtOThMNHVw?=
 =?utf-8?B?WVFSZ2lrcWhzOEI3VlBES3R2NFRWQXFvcDBqNDlRYjJoZk9tMW9RYkp2dXRS?=
 =?utf-8?B?cFg2c3ZTK2NJbHJzN1VBTitXNjEyK1BwUE0xZWVsQ2djRXhYTGEyd0pUMTA3?=
 =?utf-8?B?QldGcnNDMzc1UEtaR3hQRzB5SEZ4MGk3enJOOURHelZIZWlpdlN1UHhDTEx5?=
 =?utf-8?B?b0ZMQ3h1N2ZMYlhaRDN2aldkWU1RTHM5MVp6Nk44aUtDRHk4UVVZZmllYWEz?=
 =?utf-8?B?UTFYdWl6d3NFRVRoYkJlcjArQmhCUURPV29tcjJlQkZpZ05FTmN4bkIyWDVL?=
 =?utf-8?Q?h3OkxETxffePnEixp2W4+G0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151456b1-bc22-417a-d8cf-08d9d0536a14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:58:13.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MvkFt24JBFNTZakkjajOlLc4ujNxbC5phkD1Z/89rdEX6r0xx+pvtuvHHQPbyRkWwNbQo2LWTaYNDd3MgO8hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

This has gone out of sync over time, resulting in NPF and XSETBV exits
incrementing the same counter. Introduce a simplistic mechanism to
hopefully keep things in better sync going forward.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use sentinel comments only.

--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -302,7 +302,9 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
     VMEXIT_RDPRU            = 142, /* 0x8e */
+    /* Remember to also update VMEXIT_NPF_PERFC! */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
+    /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
     VMEXIT_INVALID          =  -1
 };
 
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -11,8 +11,8 @@ PERFCOUNTER_ARRAY(exceptions,
 PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
 PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)
 
-#define VMEXIT_NPF_PERFC 141
-#define SVM_PERF_EXIT_REASON_SIZE (1+141)
+#define VMEXIT_NPF_PERFC 143
+#define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(svmexits,             "SVMexits", SVM_PERF_EXIT_REASON_SIZE)
 
 #endif /* CONFIG_HVM */


