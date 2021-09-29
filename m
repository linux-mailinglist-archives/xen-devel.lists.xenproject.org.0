Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B547741C1D6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198961.352731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW7E-0003vd-BK; Wed, 29 Sep 2021 09:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198961.352731; Wed, 29 Sep 2021 09:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW7E-0003sm-6B; Wed, 29 Sep 2021 09:43:04 +0000
Received: by outflank-mailman (input) for mailman id 198961;
 Wed, 29 Sep 2021 09:43:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVW7C-0003rE-Kp
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:43:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2af4adc-2109-11ec-bce0-12813bfff9fa;
 Wed, 29 Sep 2021 09:43:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-lanrSw__Njytv9-yh5Do4w-1; Wed, 29 Sep 2021 11:42:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 09:42:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 09:42:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 09:42:55 +0000
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
X-Inumbo-ID: a2af4adc-2109-11ec-bce0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632908580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7ccXA22nntJPvmIaAdNM7vs28zhnf2Wqchn+7jd8mY=;
	b=ljjRPDW5u1dQbR7uDFYL1RCts44lqVduLvAjgef2gI0xpi9M+bAqgtmcxigtB8PUBqaece
	jlyWMdUKJ8yGu4EyC0Tykk77sJCRsaxnezL4Kqd6jjZt8suxjkXeHiRp8lfU0uTL9tXNpc
	tR6pvJLnknZVfJ7995U+qlRmGW+QlkY=
X-MC-Unique: lanrSw__Njytv9-yh5Do4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRtGTDVearZ/+MjEozVlI3PIqqe/quFylaWisaQiEz3rndBeaWcB7aVPNH/1wkSu70g5Z/7sB+OCGmHzrubNQIUovpAKnLOQMRh/4Je0rjppDwZja7ibGwN2RP9xByASS3axQGej+LubUdZ+Kv5dYpSZnVEVo0YcdWyoF9a/9A3RKnFbfmP9zIZXdmGXzFjHM1pRvgxQIJjR9pztdL+9tyXnjpy8Vxs4Jv+cmpkSEtkTn9zgtk/yMDlJ1h69ihRYEqk1NWclPc7CvRKZfShZUdI10Ca0l28hW1AYJtmBKwQiWtPOMPaTm6dHL/rW7UQH/2Pdqh50/V1bIzgAUGCLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Y7ccXA22nntJPvmIaAdNM7vs28zhnf2Wqchn+7jd8mY=;
 b=cOzLO5BBOgxZ1teDP8yhZNedntYQ7d/3BOlwhf4rXpPa0tHXdlCPtD/dw682wyAtOaMl+/6matDsiSZX7jTfdml/l6vmpPtOihkAtYRT9pJGVwiZccMhQ2iRL8P+0f4OyMjFCSEkBGjStsyTsOuL/6iO5NHEVScsvvayGZegFXt11waLJro1ALZnQoLKRuixDa29UsRGCFqTzEHHqb8eGxlISpftKVp6UIG/Pdo9qYW+yrv1S0K/wJiiKbocgOFi139s3173K7pJQbsfLEMvzkJnvlwyK7rCUWQWNe/BKsWNLO6OjvAz8cAl+m53i3C9asSDJ1hmr8Bsli++FIPPHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/3] x86/PV: replace assertions in '0' debug key stack dumping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Message-ID: <5ab88195-660e-5d73-cc34-67734ae161fa@suse.com>
Date: Wed, 29 Sep 2021 11:42:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 937547cd-7f96-4ba6-6399-08d9832d8403
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB312093A598E6C3C4236E87C0B3A99@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SVN65TBD2eDwJXpIDni64FCxegQrh/xmGe/7zCh/Zm0+HuXGgb2FOO5DYFPfJF3+tq/RL/K4NaFuEhdrjpxUA02KBSA/leFz1iwl0yRRwGj0MoQoLzddFL4pOlGDux0Jq+KHmaQEPCRvqHIvdsmQ6UNMlNk/xmo5blZpWU7nMHixW8xDAIr4O62VrgbLA/scX4pyYjXWyIAPCy4yFTwEuk+qxGWBi+1PzPzB80QQaNsrFEKQTgS0TTh8NS/IfXyRZbBa0z0fDG0Z6/UQLQvnzDnmNzPAzav3/iRcrYEbIe4+ypu4R9UIT+L71udk3CL2zUNiru4e+gXeQzqJF8nysgaKsAhK0blRhLttd0PM72pvxjaE6empy8NP7lbvwanqsIDD5rLsmdrP4sYWgsx9YPE5AM0QSqLEbzfL2hmtwtbRNF7RUw3UH/7TS7wnKus6Oez8kcffbZAze5U5Nz6C62w9xOgmNHO/bMbU0tNaO4kKZfW5qMBJfPhBBFprdp8F8BusREI2cjkv3qyX5JJ6GsSK2rXijZv1/ivrbmWCICw16wtGhAnpgaRCV1tUOchnWO1lSXhuP+kehYbv5EtMnn/4Bb0Cyxdv+7Ib+v3hhqZOdAoEydVjBl8RQO7eoOCUB6LtUofFJYQmZu43qRL8hB+h0eF8nQb9K7n8NBWuEcPJPav7FwwXWODVPAOLxdTlx5p4LAu2Uj9jHRRu0Ut0pcd8uzTn48ewpqesdi9PXGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(16576012)(6916009)(54906003)(86362001)(2906002)(4326008)(31696002)(956004)(2616005)(36756003)(83380400001)(66476007)(316002)(26005)(8676002)(8936002)(6486002)(5660300002)(38100700002)(186003)(508600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3lCYjZyUHlPMlRER0hTdUJlZjRNTVJnN1dGOCtwSjd1dkxOVHN2TkZoVlJ1?=
 =?utf-8?B?bGw3Nkt3b1h0YUY4U2Z4WmZFU1NIMjBUNEt1ejhrcjhPUUNOb0NwSm82QjY5?=
 =?utf-8?B?NGJldncrZ1Jmajl4djlvU2l6a2RxM1NlNmQ3MnpqTGU3aWdkais2VVpyS0Nl?=
 =?utf-8?B?YW05bFFienp4Rk43YWF0Tk95Y0ZwUUtUckkySys3VHo3bm8vL0hvQ3J3c0Vy?=
 =?utf-8?B?c3ptVUIrYm4ySUR3SmFUZzkvaDZ2R2tRcW8raGU2M0RiSXdweU40bnVtc1lw?=
 =?utf-8?B?YXBpTXhrTkl0OE5URXBseEtUcVU1am50cXplbngxbHM5d2tqblFmbEJFVkNo?=
 =?utf-8?B?T1hOSHRnTGR3b3BFeTcyUFV3RytjSm9YYUp5MlFEU3R6eUJ3M05jQzI4T2xi?=
 =?utf-8?B?aENLVlJqWUpscm5YTzRJZURLRmtLNzVkWU9FclFKdkhkNzNpdGNCY0hlekNG?=
 =?utf-8?B?akNNclhjTTNMcm4yMTcwelBHSSt6RnVZQXI1OHJDUEU0eDE3VVIwTVczejUz?=
 =?utf-8?B?QzZxY3YrcGdmelEzdmR2bG16bnB1WUkxeGFCUkJlbVhuNGs2UGJGdUFoUXg0?=
 =?utf-8?B?TUNCY1Q3NzFpR2xNOFFOVnNwRE9XU0tjclJaanJVaTJVKzhxZG5YeVRkbncz?=
 =?utf-8?B?eWMwYTNqQkpwQXFLWFNUMThHd2pHUHpjMXp6R0hLSlo1YWM4OHBPcEd3WFBn?=
 =?utf-8?B?RlVzL0hoeEpwY3B6NFYySWhQNHYxTlBQdW9qSVhDdE9GMFJjQktoemFKVVVS?=
 =?utf-8?B?ZVprZ2RvZStJV3Nic00waWduc3VCWitISEYzeWlyNkZqUmppMVAvWDYwNllQ?=
 =?utf-8?B?Vm9KaWh6UkFRNVpiK1R6ZHY4NzhDTVVMTVZGN2NMemlGSUhyTVMxWHh6K0E2?=
 =?utf-8?B?T0t2dGZMbUk1RWtrS3RONHdDNzJ3OVd5czZhZkhMSG1sVUtsU3kwUUo1bWhy?=
 =?utf-8?B?aWV3VzIxbmQ0WlREajQyVjJ2aDhOK0hiYkd3UGNPT2lydUNRMm0rY1BOb21N?=
 =?utf-8?B?QmU0RFVvLzA2cEtYRmdHZk53WXg5eTVkMG4xTmVBcVptcW1uZ2tPNUw3aXRL?=
 =?utf-8?B?TUNxTkZPc095dUpCZENFcnRvc2JHS09xTTJQOHdwZnc3M3FKd3NYbFhKd09w?=
 =?utf-8?B?ejVpanVCMEpVMlNKTjdoUUVIbHd5RW5mbmRNNVBlM1RWbURKbzhTaG11eFBJ?=
 =?utf-8?B?T1JLa2g1TU5XZThDU3JoZy9VSi9vZldkK0N1Nkd6dkVPRG9wMEp3L0MxbmlJ?=
 =?utf-8?B?T3B0MithQUZsNVlMeVFuUDMyL0VwdlZJMlgyVnhhdVpiYWEyVUtrSEdLQ3RQ?=
 =?utf-8?B?NjhzZzdNYnRZbnU3MlplV1M3cHJrOXBpOTFDL2ROUHZBSDJKTzRoUTh1aUFt?=
 =?utf-8?B?b0IzTGs1cXBVdHVXektHRVF3cmYvTTdYaCtVZko5ZklUT2I3K052aHQ1cVpx?=
 =?utf-8?B?RU54aHRJa0JEMTNDUFlBa0V1dlcwdjM2V3lBcUR2azkvSVMrV2FnbnVPd2sv?=
 =?utf-8?B?Z1FZM0hrTjV4ZmNtYWRSR3NHVmpENUxCU3BMenAyd2JEZFIySFNmZzhCem5l?=
 =?utf-8?B?cUVwV3pESkY1V0laU0pOOUtDb01VSU9DREJtSWlnMzcwdjNnTGlidVZ5bEtG?=
 =?utf-8?B?MUFrTXNSMERSZ0FCUXdrMEY2cFFLaTlSTEUrQ1dMemN6bmJyWndmc0pOMEtw?=
 =?utf-8?B?NWd5NlJIQ1VCdzhFMGR1R2VtQnZsL1FqSDZVaW04ZXg1dWtpbFpVMy9kRjFW?=
 =?utf-8?Q?WZySqqyMsHTfyvoV5iw3gy7+USaMJXpI43aLTm7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937547cd-7f96-4ba6-6399-08d9832d8403
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:42:56.1807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4KUhHJMOq4vR5HFvK8DLn/FfFoqRaT/9MyLvBxQpEEdojunTwg80kZan0fyli44pN1RO4TYLt6hyU55C5orSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

While it was me to add them, I'm afraid I don't see justification for
the assertions: A vCPU may very well have got preempted while in user
mode. Limit compat guest user mode stack dumps to the containing page
(like is done when using do_page_walk()), and suppress their dumping
altogether for 64-bit Dom0.

Fixes: cc0de53a903c ("x86: improve output resulting from sending '0' over serial")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative to suppressing the dump for 64-bit would be to make
do_page_fault() guest-user-mode aware.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -254,7 +254,6 @@ static void compat_show_guest_stack(stru
         struct vcpu *vcpu;
         unsigned long mfn;
 
-        ASSERT(guest_kernel_mode(v, regs));
         mfn = read_cr3() >> PAGE_SHIFT;
         for_each_vcpu( v->domain, vcpu )
             if ( pagetable_get_pfn(vcpu->arch.guest_table) == mfn )
@@ -269,6 +268,8 @@ static void compat_show_guest_stack(stru
             }
             mask = PAGE_SIZE;
         }
+        else if ( !guest_kernel_mode(v, regs) )
+            mask = PAGE_SIZE;
     }
 
     for ( i = 0; i < debug_stack_lines * 8; i++ )
@@ -328,7 +329,12 @@ static void show_guest_stack(struct vcpu
     {
         struct vcpu *vcpu;
 
-        ASSERT(guest_kernel_mode(v, regs));
+        if ( !guest_kernel_mode(v, regs) )
+        {
+            printk("User mode stack\n");
+            return;
+        }
+
         vcpu = maddr_get_owner(read_cr3()) == v->domain ? v : NULL;
         if ( !vcpu )
         {


