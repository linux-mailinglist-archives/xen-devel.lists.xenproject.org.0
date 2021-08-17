Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97333EEE85
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167900.306536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG05n-0004Oj-Vk; Tue, 17 Aug 2021 14:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167900.306536; Tue, 17 Aug 2021 14:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG05n-0004M3-SU; Tue, 17 Aug 2021 14:29:27 +0000
Received: by outflank-mailman (input) for mailman id 167900;
 Tue, 17 Aug 2021 14:29:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mG05m-0004Lx-D2
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:29:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 852de31a-ff67-11eb-a4c8-12813bfff9fa;
 Tue, 17 Aug 2021 14:29:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-77LiwdNEMrWsvMcgvbxZYQ-1;
 Tue, 17 Aug 2021 16:29:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 14:29:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 14:29:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 17 Aug 2021 14:29:21 +0000
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
X-Inumbo-ID: 852de31a-ff67-11eb-a4c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629210564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RMC/WPWQmSMgom0Dy/h+kiqrFEVC1Yp73t9dr6QPkDs=;
	b=idx3jGIYXyqoQQXSUEdZNsKHJIt5eKOgWsyumajQXvGDxytbSMEwLT5dMKS30zP625nUpn
	xOR6dQxUrwQoCb2yGGZ2ST7V2vBuPp2uR4LYifO8ll7yiyrEXC9fKjkNaQcpPB0exAEWvL
	7xI5d7bYOFhIfb+HT39wMJgorazm738=
X-MC-Unique: 77LiwdNEMrWsvMcgvbxZYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jrjk8Wl8zMsu7yd4KmqlZsxaekF4f72kS5hTY7GbjfFCpZEkb3GQa7o5t/ViffvSlqU58s3i2EutSMC6gfB8iPIgXP7GPWxH0Z2ogtbVMeQKLRaQrEr7RyJq9Cx1xpHfcyNz3qzGfUmXPpcrU95SLdJLj/I7BLR/MZ94zG8FnQc77RzFkM7wjJTQYkODUk7CTSnL0JYowCeb8U39alybsEsXkXTTjn7LwGSQA7AVeaCoXenPylHAkcGjYPf46qr6uHjSKDYAVNMIZvBYkb7W5JJQDePy023IB7b/Q3dL5k20JZ6LxZNDd2L4woPL3rHYdC84RIKHezYCkMzBpb/9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMC/WPWQmSMgom0Dy/h+kiqrFEVC1Yp73t9dr6QPkDs=;
 b=dwO32HatWJzVB5UYsOF9HnTGwI4OaZRGNPo+ZYhZeNeogwgNuVKAus19FSgXAdjLP5gp59GBeffvAPTR8pCDXJ2o7XqZhEQnBCO2yU3Vl58UzBaDw+iu4v3//L8zpT1+sx8Ea/2Lc8GrMYrn/rA485ooKgi0bgFXYexEmhvu04oztqXeKdgxh1Dh5oFuj48I/BdnvZiGdNqnp53Oj7SG3XPOx+24oZ0XR+X7AXsRt0iU2hgwVg/hhuT+kPQbr/0s7EJdQmFN/7PHu/ByzN3oKFEZ1ipdiZjrZjlvOI+w8o7P5Jo0oFk0//x/Fn0V00BPLyXfkuZSx5/pfR075Lwaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <929e4299-c9b3-0714-3c0a-3c3d1c0c14de@suse.com>
Date: Tue, 17 Aug 2021 16:29:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15643c55-91a9-43db-e097-08d9618b67f9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2701BF8E7D30A5786F6AB541B3FE9@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oCrCAlaSiU0/WXCOqKjPKx9ceH69Cf7gjaT3lsEsVpp70HCVp8gAZ1JKwKkWVS13GS8v1FENwcje6y+yct3s8Z7LzEoJe9hXyCk63Rb7JJ5Pr2O1jpG4G63PvOS4E67V4tkCcN3K6CgMWjXsx0QwDvslcc4gH4nqgYHRZqUt+XK6x1Qn/vcm2AzfMw0+l0GuLS6qX/Uj9RqUeUEyROM11zOhuqjaS1J0bXubx2c6yh0+RNCY0Ymz5Gd0Bsm0DRBdPnZ0kZgtD5hElRODmrfATSuJ3gT0RQkaBM4/rQVAG9ACte0GhkeMqFVuHvniTaG39PmvtDpmbfhkKwyJosnlplhRPpr+5f+kucD7/+z1NoG2cCnY89ioeJKhwrDByRSmTfFeZDze9u4yshFCZzaoIeb3ZwoBHspkYLM4I3AtATamLLqadm1aNOdxrPSq6e/bl1P4VVtEjabOwVcf0c8uA1q5dp2KP/1UqWhEAafyU9CSUNIO/ssEsXLBugdwz+/kp2HNKIriB4YCLK7DBnCVEoZ5fVGkcwGq8Xnqz5cXVn6XzArj+Ru38cIiOPITT4zRgiyFP+Nl6livQQdqZDUWwa8ZcFtz1EiFD0lFxxPcJbFSdACqNTSoNgwLeAv/v6XgsJNpmREvFEKa3XBoYHKSo93kv/dK9xn9XcK8Mj1Vg9LMHCT9fmkzsHmJm71KuhGK3AK8WQJTLF75N+69LEdsnidOBakz01mBOH/bsoah5e+FjiFENVzYieimbxx5UMgDIMdgx4i+TQJMUr5aedVYGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39860400002)(346002)(376002)(31686004)(26005)(186003)(16576012)(54906003)(6916009)(2616005)(2906002)(316002)(4326008)(5660300002)(83380400001)(956004)(66556008)(66476007)(6486002)(38100700002)(8936002)(86362001)(36756003)(8676002)(31696002)(66946007)(478600001)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2N6WTJaWTR3RWdFNk0rbDVIWXJzU3dEbWlKb1I2VEpyOVl3ZVZBMUxnS2h0?=
 =?utf-8?B?T0VDditIYzlzZng1UzRuNlQ5N3FWNXFOU09xS3prMi9VRUlLOENmVkdHU0ZD?=
 =?utf-8?B?UDRPUXo1TEpNa2I3WlI3OG12R3d3cXU1L0M0UkRURnArZlZ5VnRFemNPd3h5?=
 =?utf-8?B?NFM5VWFNendPTlp3QTJ1dUp2M25qdnVCWjBtNmxObko3K0ZaQ3o2bkQwMW1p?=
 =?utf-8?B?SnduSXB4SlNYSkJ4ZEV4Um84TGtPdjhNalAzQ09TNG9zNFJBVmQ5cUhWVkY4?=
 =?utf-8?B?azdYL3ZxY213aWthSGl3NWFYcmJFd3FzYUdNR2o0UTVsdjBvaDd0anU3dDJr?=
 =?utf-8?B?WVdjU2tNeDVpUFZkbDZTQkN2YUFBdVR1Q1B4dTdQZDdRaVVYTEJaVUZuaTVY?=
 =?utf-8?B?emRLMmhnWjZEN1RHdUYrWnJTRkxmTVhKdDBUMi9PV0Y5c2d5QTlCQnBFWWRy?=
 =?utf-8?B?ZkJMd3dMSytKR0Q1UWI4dGRIM0w1NVFKQnJoN29yNmhmZjdnWTlmMUhmVnhS?=
 =?utf-8?B?VGZCS1dHcWxEQVpJSUNkdEphazQ4Vkd5QnFVSGMzWG4wSHJXS1BZQ2hodUl1?=
 =?utf-8?B?ak5SMm1CVkhYNzlxSGxRdVFSTG9WeDNVUDB3eitWMGNRV2UvU1V4RUhJS1BT?=
 =?utf-8?B?NzJnL1Z1dXRQTFZ6aW5RK21KU3BIOFI2WUNkbXUwVURjSnluRG1BMmJaWnda?=
 =?utf-8?B?VjhPTWlEcmVudWVqUEhzMExTcFNzdys2VFRwTVNrOTc5M0dBdkZkS3I3SC9w?=
 =?utf-8?B?U1huRGRqYVZNWHgrM09GOWlRd0g3Sm5sL3NFeU50dXZ2Vm1IQkFxaklPcjBP?=
 =?utf-8?B?NG5DNnROTE9aVUlqQzM1T291Zzl0UHpJR0NMb2hmNWFWV3AyQXlPemRCc1RI?=
 =?utf-8?B?b3dtYm4xMEF4WitOT1JuV2dUYmFLM1JJeHhuVFNocVEveFVKRW9tbWVWVUR1?=
 =?utf-8?B?UnVpdFI2VUVwSXFpYkZBOTFBWmplakdKSjNzK1FMTlBRM0pjWDdzRUhVWjk3?=
 =?utf-8?B?clBKc2xPNWwrK0lHODIxYXpySlRmS3NHdFlNTmJ5d0lVZ3M5S05JbnJIam1n?=
 =?utf-8?B?ank2QnhoSUs3azFNcUcxMGY0NGxXNmc0ai9LaG9BRngvVTY5UmRmM285L0tr?=
 =?utf-8?B?MS9Bbys3czQ4akY0a0NjR2k2U05SWDdTTTk5NEdqb2FTd0w0WmRidDNHMnQw?=
 =?utf-8?B?OTQ4Rm9aNFlHK2FGaGV2TXhoUnJ2bG1GaG9IUkREdVdwb3BPeTdhZWJrMjRm?=
 =?utf-8?B?WkhhNzl3OUVtYmp4RGJUZ05xRllZY2dRalBPa054ODBQVU1tamJGTDJWTlJp?=
 =?utf-8?B?NVQ1UWtZaGJCVm83SmVlZWpmMm5kSWtSRnh1UkNDV0ttbW9VVk5nN1E5d28x?=
 =?utf-8?B?ZDMwS0FlbWVleGgxUTZJdlBrWVdGQ1FINUxpaGVrWVI4RkQ5YjVmWExtWlBs?=
 =?utf-8?B?Q2RhYlo5UnNFazRVYUJrZkNFNWp2cnBSRVJWMWZQR3ljWjVaM1gxZnQ3OHA2?=
 =?utf-8?B?S2ptTXdCZGxzcldSdVVvWHA0Ky9vdURCMTQ0YkpEUFV5ejdGWmp1U3dWS1ND?=
 =?utf-8?B?RHk3VU1jTFlGQlptTHE3V3VVYUl5TE9EVGN4SEllSkJUWTV1cyt3MmNhb3py?=
 =?utf-8?B?bVpFZmZMaFR5aVhuRm4vTWxlaWdjM1gzZGMwZFV6OHVybjJTUEY2WmlrcUFF?=
 =?utf-8?B?clBYeXM3RXFWak1mRWRRMmlySjRyZDM4bW9vb3Zvb1hYTEt3V0hhZEx2b0hO?=
 =?utf-8?Q?WKgy6gB9bNQLuQQK3XmyqFp1M2EAQIfzgfJpZ4U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15643c55-91a9-43db-e097-08d9618b67f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 14:29:22.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eO7aS+SePI1oV7DDrsRqzwshSHTckZFZ39urvvCSdWK4h2ZwlgwsHuVRLdITaK3EQ9pHfcrd3XBiB2umB+nvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

About every time I look at dom0_construct_pv()'s "calculation" of
nr_pt_pages I question (myself) whether the result is precise or merely
an upper bound. I think it is meant to be precise, but I think we would
be better off having some checking in place. Hence add ASSERT()s to
verify that
- all pages have a valid L1...Ln (currently L4) page table type and
- no other bits are set, in particular the type refcount is still zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Refine an expression. Add comment.
---
There are (at least) two factors supporting my uncertainty about the
"calculation" being precise: The loop starting from 2 (which clearly is
too small for a possible result) and an apparently wrong comment stating
that not only v_end but also v_start would be superpage aligned (in fact
v_end is 4MiB aligned, which is the superpage size only on long
abandoned [by us] non-PAE x86-32).

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -59,6 +59,16 @@ static __init void mark_pv_pt_pages_rdon
         l1e_remove_flags(*pl1e, _PAGE_RW);
         page = mfn_to_page(l1e_get_mfn(*pl1e));
 
+        /*
+         * Verify that
+         * - all pages have a valid L1...Ln page table type and
+         * - no other bits are set, in particular the type refcount is still
+         *   zero.
+         */
+        ASSERT((page->u.inuse.type_info & PGT_type_mask) >= PGT_l1_page_table);
+        ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
+        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
+
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;
         page->u.inuse.type_info |= PGT_validated | 1;


