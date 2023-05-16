Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2E7046AC
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535001.832567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypJ5-0000qd-VM; Tue, 16 May 2023 07:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535001.832567; Tue, 16 May 2023 07:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypJ5-0000nz-Rf; Tue, 16 May 2023 07:41:15 +0000
Received: by outflank-mailman (input) for mailman id 535001;
 Tue, 16 May 2023 07:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypJ3-0000ks-S2
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:41:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07e1bfd7-f3bd-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:41:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:41:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:41:11 +0000
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
X-Inumbo-ID: 07e1bfd7-f3bd-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAgr2drEjkyUIiw7JOxAEKj0NBHR7FCPysbM2YGXYIzwvB4ONBdKWpY1dODvU45BR1wqB8NjMQIwvjhtMU1NMbE7mdGwQOBMPisoTQvsVURvCEHW0cLMgIwqkGNToUINyonOgDPaGwRDOqNK9q/YaF+DrY/jqXAetpFb6COvUyubLvfXUpMI1yvM+CaHvcTJwYp5U84dS/kLlppOi0pi+M+ffeWf6SUwwL5qT7wEKuLEs4Yzi8UGClIqiP2kGR2hNUY+dZXQXXZmUix+NF9xv0ftm23VVYczwLpS+IkULZb7Q0md9zM4GC1vSlvp+5SBgX55ul0FCeOL/KAvSFV8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5NXxvDRQXD0WHTV28k08tC6LtvezCvIIN1lLE6iH/8=;
 b=IQdVFRQGPSg/8liKRqJZuGoaziYlooUgIPUi4VNU0pBCMdW+Z/Q4hzRQ9eHWc0bhYe+/VDxUW5VEzadPyeKX/I4h3+ptHX8shUodzq1I9eb2TWz5Cavs+GTn2aPjTqveO5Jpb8sAMf4N3iIUxh/GXRv2tc0X30YhQEdkv+JcxDGTu05gtFAn0p9iu+LmG8WJypcaO1lwzU/VvF4s8ix4CkMpr5KMdCO6tJfYcyeOvD/RY+DWytVztc8+XrBLtivSZKVcnycCw/lLjm843CeIBvkzQcap2++qJsazzrdRT0nr8Ezej9Ogn+FVuP2aipd71FOo6PQhgEgmOHmX1m672w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5NXxvDRQXD0WHTV28k08tC6LtvezCvIIN1lLE6iH/8=;
 b=13v2vaeZsUBg1ICCqZNPmIG5o7bpRSAEgCob9EWqyq/6kwduTbVwBmVjj+BLQUaJe/dLA//c2QRYLpyAVpCLvXa4dT+QEKEcMFkKIOVEQoKRxxOMlDmReXJ8CUaaSYXBm4ulKWbrQCMEdfTmLxxP+gZeeftAHs+R4TXFC2Rm4nuxh5G5pzSEMFgEkODnT8ay+Fh05WPDf5F90tZ4VTYfYkjBf3rjLJ+XE6MFwe5ULf651xAR/dead6220icpFQ51lQ8y7Qrq8QilgQHCqeCHgAfu79ftVNfDSWdmdhKmn/oD2HutH3iwPcOGRP5rDQ1yQR7Ww+nSQGI/KSs3Nm86nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce0dc192-7d42-fc71-2c68-2b67933c5912@suse.com>
Date: Tue, 16 May 2023 09:41:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 08/12] x86/shadow: sh_rm_write_access_from_sl1p() is
 HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ad2052-9393-46c3-e628-08db55e0eb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Eov954o4miSyvxE9UQie6Q+eEJpkKJMGeqVClJ5F3ch1ndk1YbKVUGfpoew2E0LCFUFjHT57hDUi/RcM8eajBG8rqqwtFiHnw1Pg+UIr4sTKuwVyoKVRlbezgNW4QWHes3DesRrAfvX3KnfuXZ2B4Ic+ij5G6tYWs0kW8XdNTHHeO2cdrECU1B3Rn/RHcxMzSk1MBG+ZBSloPc3dWT/d3wKJeIYb+DBrVg458xHFAJew2HrzX0RDArmGWNiIlb8FigFGKMqHuvikkrphtMPjittV3k569GGD08Rp/b0eaz+r3jt4J//6VSasUE83N6xTglNMofizpwq0Z8wcSOSSCtYgGQyyAH5ngiJAqfJ4BSW5rAxGeDMGLt6BaniM7bj7u8J4ovEE7+rkDJXUwCCjrULjZrnjndD9jmEZZ+oIHdcGJ4nR13FzMY7FAaJ0ZGK/efeQ6ORFOljeE6Pb0sf3pKvMmRjp7gPmdH7zoamczJaM47I3SogKjIvDRejSuXt/rsxWMydnoIJU4hQXJnq8dsuLaX1p+Ke4jArHueDg+0ygfvND3CNCjbr8GX2NSHCiKF04kCF75B8WXYpIODo9SKoXLQFl8BOELgGjV3jdp/kESu8CibNuH/gnhct1jUh6V2/ySiLF4WE3+0G0/kJLIWurid3L6YmE7V2X6eVcQpBK7rLls830Qq5xUSNGsl6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(66556008)(66476007)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzhhcjN6Q2puN0ZZY0k4TUlsZUpaNTdMc3owc0RXcFE3Skw1OE5venJPNXIv?=
 =?utf-8?B?cWY3MGFYTnB4ZEZPTEZCTFFuZzVob2FsV1MwVEg2MGVxUDdwU29oY3RMS242?=
 =?utf-8?B?RkZvYlVCaExFNnpGZ1B6Q3lsUTdIWmVCODBjZzJoRmR3QVc1M0hxYmM3U0VP?=
 =?utf-8?B?cFUyKzZ5bFpBS214U0lVU0krZGV3V2RhalJpMWR0TEVFdzZUc2szYWo5TVVW?=
 =?utf-8?B?UUFJRXMxTXB1aVMwTUx2aHZkSXV2MXJXaXRCaU5qUEozdXlnK1FrRkhaN0Qv?=
 =?utf-8?B?YkIvbmxjZ0ZHZG9UbDlPVEdOMFp3QXp0OWV6NHBWVVczRXpIUFVlVVZoVXBK?=
 =?utf-8?B?MDdJaUFacENSK1Bici85VkU0azV6MVdwNU9CdmJDbVB4QnlwOHVnL1U3UGRP?=
 =?utf-8?B?dC8vZXRhMXAzcWsyZlg3cXBmbDUrZkV1bkhtTXFuQzRmeXV5L2NTQS90QVVB?=
 =?utf-8?B?TXBDWW9QeGdqT2c0aHgvZVBlZmp0cWQwTmNWN3NqV1NNMlk3TGFvUWx3UWZZ?=
 =?utf-8?B?YWRUcXNiZVRqUFJuZllDcFdIdkpjOHdCWnA1V0REZ1lFN3F1eWpqY1poUy9Y?=
 =?utf-8?B?Uk1jNE9zenpQYlhpeGtXWjRmOUpRQTdRUWNnWnBBVzkydlVQRHU4UExCb1Bw?=
 =?utf-8?B?Ky8wbmZhOG44b1NxY3ZSRmNudE5GMFgxMU5qQkVrazVhZzluYUVJbkZxSlU3?=
 =?utf-8?B?RzJmOHJtNzhTZ0haMlRrelh0TGJENnFBeUZJOHViRnRDSVJQSEpIRm1jcm9I?=
 =?utf-8?B?aFV1SFhqcVBTZ0dyK2ZBT1R0TVhjOHZ5SkZUQVB1cW1iVVJ2MFdIOStTeldr?=
 =?utf-8?B?cnh1TEVSOWRTeW1wNWJwelRJWkJGVDRacnFoOWl5QzU5cGJEcVFnanFpeWJ3?=
 =?utf-8?B?bnc1OFYzd040NTdXQkpJanVzOU5PUWM4VXZxYllNb21MeDlPSC9yK0hmbVp6?=
 =?utf-8?B?bis4YlJ0SUdpZXg3TGJHZk9kbGhSNTlSaEJYVzV5MlhzZzdETjhVdjhyZVhK?=
 =?utf-8?B?dytSODFVeU5jQUZQVU82M1ptTmkwcFdTY2lRWkUrM25tYnNTOXpJQ3BRazVL?=
 =?utf-8?B?SnlUaVlKV0dwV1BhYjlySXZ0ZGVlcUJSVU1PaDB4bzd3RnV2cWZaZlJ4V3JV?=
 =?utf-8?B?YVpLZ0twYVFZbXNkWTVtWEE4eVgzaVBYeUZEWk0yZVEwWFlRVjg0QWxZNEFT?=
 =?utf-8?B?aENGY29jblhyVlpYbE9DMVJibFB3N3hGdE9RcU1QZlhaNnhYRXJ1cGNMbjc2?=
 =?utf-8?B?V21FOWRxV24zWHJwWnl2WThOTzBXVUVUUjVmS0FDays1NWhHd1RFNDhOSVJx?=
 =?utf-8?B?TEVLbWU5cHBRekwxL0U0K1ZGU200cm5NcU54bGp5eUgyNGRTYm9kUmpnaHV2?=
 =?utf-8?B?R1BodmtnVDRWRTU5TklwZFhMYk9HMVVnRnpIbjNFUjkvUGwxbnZpc28waXA2?=
 =?utf-8?B?S1BJczdqUnJuaElYbXk2cnRWTm94Z0JjVDBJME1CUlVzM3IzZEtNa3ZpdUhH?=
 =?utf-8?B?aThpT2R3cjNaMFNQSkozekc5c0xGOVlURkpWb054bytHMmVDR2F6dm14NGtG?=
 =?utf-8?B?TDdydDlpSkJ5aDZybzluSms0aG9YMlZsaElwaTNSVmZFZ3ZJSGpTUTNUTTRN?=
 =?utf-8?B?cEl3V1gyQzlaQlE3aTVXZ1hnZWxvS3ZFbnBHcE9wOW1jVFh2bUQ5eUdVTUhP?=
 =?utf-8?B?b2xYYTFiRmo0MkVGYkQ0ZzJTYUZTdit3UmRKMVZkTlQ3VWZUMDlXTElCT25W?=
 =?utf-8?B?YUpub0lCL21jZXFlc1pibHJBT1ZqZks2R25hK1dqeGczbVBVZjhoRkVtVzFC?=
 =?utf-8?B?T0UzaTVxWVp0VzhxSHBvdW5VRW9saTJDYXpIQXVlR2UrZWlEMmRJRlVnNDIy?=
 =?utf-8?B?RTFjMDdXS2tiUWdFQWVYaGtDdHE1WDVZSUY0SHB5MUxTcUl0WWJWby8rckdE?=
 =?utf-8?B?aFhtbE13UFR0eThBT2RDZXdxN0w2NG0xaXd0aU85UXUrUWVCYnA2N082Ry96?=
 =?utf-8?B?a2FoYVlGUDF3bjVQaUE2ZG54RjcwSXhSNkNISkVBeHFoSnQvU2xhZTZWZmM2?=
 =?utf-8?B?blpRTmVuZ2JrdmNwSVcxZFJ6blZyRW5pZUt6RkR6OFd1cFQ2Y1lLVHJCWEZo?=
 =?utf-8?Q?qeXcKQUKcNOojFkpca4iRqFZ0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ad2052-9393-46c3-e628-08db55e0eb95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:41:11.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l72wAz+IDvMH1hb0F4xlpCg9k8azFnPdsPTp7tJ1rf5A45MjghWemYTS1EzbRZbg1UCFtg9lG/P1f/x1BuYASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

The function is used from (HVM-only) OOS code only - replace the
respective #ifdef inside the function to make this more obvious. (Note
that SHOPT_OUT_OF_SYNC won't be set when !HVM, so the #ifdef surrounding
the function is already sufficient.)

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3417,9 +3417,7 @@ static void cf_check sh_update_cr3(struc
 int sh_rm_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
                                  mfn_t smfn, unsigned long off)
 {
-#ifdef CONFIG_HVM
     struct vcpu *curr = current;
-#endif
     int r;
     shadow_l1e_t *sl1p, sl1e;
     struct page_info *sp;
@@ -3427,12 +3425,10 @@ int sh_rm_write_access_from_sl1p(struct
     ASSERT(mfn_valid(gmfn));
     ASSERT(mfn_valid(smfn));
 
-#ifdef CONFIG_HVM
     /* Remember if we've been told that this process is being torn down */
     if ( curr->domain == d && is_hvm_domain(d) )
         curr->arch.paging.shadow.pagetable_dying
             = mfn_to_page(gmfn)->pagetable_dying;
-#endif
 
     sp = mfn_to_page(smfn);
 


