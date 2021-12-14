Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FB47462F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246839.425697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Xy-0007Tw-W3; Tue, 14 Dec 2021 15:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246839.425697; Tue, 14 Dec 2021 15:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Xy-0007R5-Sl; Tue, 14 Dec 2021 15:16:54 +0000
Received: by outflank-mailman (input) for mailman id 246839;
 Tue, 14 Dec 2021 15:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx9Xx-0007PH-8Y
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:16:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d77140a5-5cf0-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:16:46 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-lXl44aIyPhuVVAuuritTmA-1; Tue, 14 Dec 2021 16:16:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 15:16:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:16:39 +0000
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
X-Inumbo-ID: d77140a5-5cf0-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639495001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oTnYpNOrpXU+v29cmdfEITKc/+oXUuEoOqhKM6iPyRE=;
	b=iDAf1wHVKQxVbwZ0HkvoYOpjSOra8YZ23AiUHHssr8z+kxGlEfQ7RckYeqM5/ISaAZjkGP
	xTPMF0XmNJQ9QudaAO0Y1fZhtko0gwLxFz16jdOEG5Wgbpix7h9OeH2HBn2rMIYgs26AgZ
	uuoqHUsrVTOHvg8SZ5aNOnEDfZqwmcI=
X-MC-Unique: lXl44aIyPhuVVAuuritTmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjG/1+wVmpKxXqPexuZfT5R64old9KNjOvdn6M9S6FlCDnyi3di5F1PFR97UQ1wWs/QSPovXDJPZZpFkrEs3xgVAZdvvADgjzHmGYCNlN4eR/nfeXHBpz+4lCwqStigXpqpjoKy562fRs3bcjwWWEKb/8JTvJcmzFTH4wkR4TQgP+M1owf9DSXce+SGuEId/iGGuNZld4QJzABwFp14hqbbddGHMZdR3Tkm8G7oRE+J2dRr6uRNtStFNgNlqGpWCngECuL8SwdVYPjI3LEYchs1yMb3+VFjtQgVdpDee/GSUXJwsR2HqxrTSVu3QPcanr74mfYTBB++/6kOa/h8ciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTnYpNOrpXU+v29cmdfEITKc/+oXUuEoOqhKM6iPyRE=;
 b=QvfGve+/BTam1dExcpk7a+h2My5kcrCipKEamuEN0L7zSuoDERhdiFqPlKfvioj7McYP9p5ZhIEns19QezyMqmcjznuDHMKif7Q7Eg89cM6i13GXcap9xck0iQFptp/gOJhdhGP02RL3uoQkxOcQqEpBQg82NyI+Tug/iAo9MqyQtpZ8AGmnQxEBBg+6+CZo3evgmvpr/N4TM7Jogm4ETYui310Yb+5rXg1TbFUPeZ9KF+o215rghZ2P9mBUxWM/aNkX4nPMkoO8HGJJiQJdtG3A97lrFL0bI/ADMFn9H/A/thJTaRq/EfDXy8yNAMfxqbLc2Ms5Kvb5xj0shzSQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11f9f2e5-102a-247b-368b-29021f5e7a84@suse.com>
Date: Tue, 14 Dec 2021 16:16:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: drop memguard_{,un}guard_range() stubs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0077.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bef7ce7-bdc3-4ee4-7e46-08d9bf14ba36
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6384CE2A4391891E49C0E25AB3759@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aBBIajij/Ebw+0XlnMbceOImrxEK6ft0PSXN0sMzwlhfYIXTOjFEKz5X58H2vgAYk965tpsIxjKKjBFCTmYfyKkna+RVPfgOPCOqPnuHt4AeWJ0zljettH61FrpNgksNrbfyJ+hSWO0SCK2FedxW3bTZG6UcUQthG65U9RWCiNgJlKt4yhx+8sUo9SBJ5J97H21Uzl19grTDnWnOF4HNS+e1wp3ZDFYv+k2XD8HZEbxw1swZ50AQ9nkOL6mKSY6XMfflDEhkEqzH7GKo6Fwu06PjAMT8v7hnuz1McGXHlgbhxn11LXwwDFKmwPCOEcColZl5hNG03dRWPmKFC4lNIa0Zo2cOHiHJYh5q8ixyZixab9C8ypX6H0hLNS4yuzBT2lnjGOuwQAZu3AtIlkpYjADe2zEjb1lBLX1Fw1QD/u/7KlG4ZztPSuyJ/PorZ66eQfkCOQUjFA0ld3bHs+092AkCZFAb9rbhwgVNOUlyU+p/E8CoNm7YZZ7RT8We9y31NQrAdjn/W9/7XlAL1B5+o2OmwMgf1kv4IljEfu40qPhtnXinpTsW5HgldSWXfKw4IFsoqj9PxMnILKijRTux+S7yAVoyPodKu2MMK87JAZKk5u64MJFvVKcC9F7Jp9FuJgYfmqoDpFLN1/CdS748XxNDZeGwyz/gEKytaxioBBueeHKjX83+1grHOAk+7nCH5/VGhdF9MjDu9x8VB1Q57Ws1ANDJnVthykRPK4PNURUQrpOgv1JpobSQMEwRz4h6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38100700002)(86362001)(4326008)(6916009)(2906002)(66476007)(66556008)(66946007)(83380400001)(6486002)(508600001)(316002)(8676002)(54906003)(5660300002)(31696002)(6512007)(36756003)(8936002)(31686004)(6506007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVFSK0VTR2lEU0ViOGY0ZVJ1dFEySW1GMWhPb2hhclhwaWhIdFZjSEJFQmV0?=
 =?utf-8?B?ZlNMY0RjZXlVMDczV1I1SWs3NStMSWdjZy9LQlpaU0lOMlJsMWFxZmJZK2lz?=
 =?utf-8?B?NlJEK1dsU3VVRUNveDgxWG12Ull5RjVqM2NvaTBSZmc4dy9aUk5xeWNGMktq?=
 =?utf-8?B?N2FKZURpb3VNRGRQY3FRL2lLRUlIU0ttcDhJQmpuMWZPM2xCNWJOZlFGblQw?=
 =?utf-8?B?cDh3a1pjb0UxN0VzRXF3bTRPWENXZE43cERMeGhqWGI2VmhDM0Z6eEJkbzQ4?=
 =?utf-8?B?WkcrYmN5ZE03N3dSWTBwMzdVbmRtS0V6ZzMvMnlobWlSTHdGY0dGL0JSQ3pp?=
 =?utf-8?B?RGFMOWF1ZnMwcXUxUk13c2laQ3pVcW9NcEZSdjNBcEFlTHNZZUpreFZwY3ZS?=
 =?utf-8?B?SUNkcWpWczRKMklTS3FLbkt1WktZeGhuOFd3Z3czMjgrRFYwV2hXSjdVd056?=
 =?utf-8?B?RmorbUlqNTA2NEl0N1cvRHc1cFdidmZoaS9lOFlDRytjdTJvb2hxZHo0a3Ay?=
 =?utf-8?B?cFVubDhyblNKMUFxRmlKWUhNWHQrRUFSTGVjSm9tbStxdlpnd3N5aWUzWlhU?=
 =?utf-8?B?bnpWMTBzaFVCUW9vT0RQZ3ZnaXAzT3NwL2ROdjA0TEcwMHZ6UjcwSDJSSWNL?=
 =?utf-8?B?MUQyRTNIdXc2YlFmYXQwQlRNMXdQMGtkeW5Fb2ZrQU9wcXZlRzJQbFBhZ0Rr?=
 =?utf-8?B?WkNMeDk3ZnFFZkVVaVo3L3RrUlJ0TzgyeUw2V2o3UG5VRjByZzBFL2NlZVU0?=
 =?utf-8?B?Si9IbmZJLy80Rm5tTUlLU1p4dmlTdGxhT0t2dS9zcFN4Vk5wYlhaNzZUb2dE?=
 =?utf-8?B?ZkdqZUVHTUFsUlRvQm1QZ1VZb09mcVBleW91aTQ4UGRSZ3czUWZ6RlBhbE10?=
 =?utf-8?B?VUNiNDQwQXNUN0lRZUhXVTZIY2hrRVJsWVJFWmZ5Vi81c2w2bG1kNm5Zblpl?=
 =?utf-8?B?QVZJVEFpaW5tR3dwek0zNXYrVHhweUJ2eG5sOEdUR3FYQ0pxQ2VEMWpBMW82?=
 =?utf-8?B?d0xadFo5OXV5OHpkajNHRUZBN3pTUDc0a1ptSWJ4R0pXSXZmekE0cVQ1MVh5?=
 =?utf-8?B?a3dJaUpQZ3ZNZGxiWlRlMkhMczdONGZ1d05wcjN1UmtmRmNDaE9TRFYzN2Zw?=
 =?utf-8?B?blU1akpXNEtXdFVrekhsd0lZc0xMeVhYakxHbWx0N3BGYjdWaG5Kb0FYeFpD?=
 =?utf-8?B?UE9XM296aC91R2lBdTcrVlhaaVlrNmNyam40bjdxbnpnV0pmc216WURNWmhH?=
 =?utf-8?B?M3pvbzZqYWF1RVJORjViaW5mUE1pUUF6MVl1RUtNWGZQQ21SUzdjQzZaTllP?=
 =?utf-8?B?QVVhVVFYZ0NxeDh3WWo0VURnQk8wdDF2NXJOd09IMHJQMm5FeDBNcFpIOVlN?=
 =?utf-8?B?THVVU0U5M3pkVkJiVVpFZXRDZTNNWlNYbkJkbEhVN3czZzRYdmpKR1JuOWVO?=
 =?utf-8?B?UVZ6RGNHUlh6SGptSk9XNG05cU5GNkc2YTVpNHhlZzNWTkFnMnFKTFh6Mzhn?=
 =?utf-8?B?NDhZL0U3NkxJb2RzQnU1SlJsZXJKS0F2bDVsY1ZJMnJVSURRV3ZpKzl5WHhy?=
 =?utf-8?B?UUs1Yk9wL2ZocU53VnlKaUxGUVNHVHVCU09xUjlXMmY0QndWRXVkL0VkZjls?=
 =?utf-8?B?TjVSeVZMV0tRNmdnbG1yYlFOM3FyeERRYzkxVi9pMDZRZnVrUVhjcE0wQmtw?=
 =?utf-8?B?SmVPVi9CdDQyRFpSQ2dSY3QyTWxidFpxcVNGdFJaOHFoWTByeUhNc3J3UnJs?=
 =?utf-8?B?bENGR0J5OFMrSUI0ZnZPSmZRL1hBYU9kVjgrSzQ0V3NHUTVwelhpN0pid1BF?=
 =?utf-8?B?NDZObmcwSGVRMjMvTTZ0NThKcUEzdTZlVzBCWGlHMWdzc252WHRnNlJqa00v?=
 =?utf-8?B?VGVGQ0JRbU1tQzJSbWdxRjJaWWxRY0Vlc1dlY05PUERoN3hvQTV3MmZsL1FC?=
 =?utf-8?B?R210dnA4c3VvMWxKQklHdDlmMU1GOEVHSkJVbGNVNVR4RDRRUWp0MnlNTEhC?=
 =?utf-8?B?VUVQQ3hmOWpuZEVvaXpIQ1pyR0U3QVFUK3R1b3FhdnFNUGtXTklHaGc4L3Er?=
 =?utf-8?B?dnY5US9MM0xnb0JOUWw3YVFxL0NsSWYzL29paHpyNnRkWEtWeEZhcTh4ZVU5?=
 =?utf-8?B?Q1ROeEExMXpYdmZUNCtiVTY4UjNqZHlXcDN1bEtzMlREYm5JMjllTXFkTG9O?=
 =?utf-8?Q?5v3VODfIoNRpNE+qa2cLdto=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bef7ce7-bdc3-4ee4-7e46-08d9bf14ba36
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:16:39.4879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hueLzPLe+CO3Bz7f49rVve7wP4xN44157G+R0WFqW6B87Auwgrro4qsPf2UMMBlTCM2+SL/ipSxwHNBzYGYmzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

These exist for no reason: The code using them is only ever built for
Arm32. And memguard_guard_stack() has no use outside of x86-specific
code at all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2152,8 +2152,6 @@ void init_xenheap_pages(paddr_t ps, padd
     if ( !is_xen_heap_mfn(maddr_to_mfn(pe)) )
         pe -= PAGE_SIZE;
 
-    memguard_guard_range(maddr_to_virt(ps), pe - ps);
-
     init_heap_pages(maddr_to_page(ps), (pe - ps) >> PAGE_SHIFT);
 }
 
@@ -2169,8 +2167,6 @@ void *alloc_xenheap_pages(unsigned int o
     if ( unlikely(pg == NULL) )
         return NULL;
 
-    memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));
-
     return page_to_virt(pg);
 }
 
@@ -2182,8 +2178,6 @@ void free_xenheap_pages(void *v, unsigne
     if ( v == NULL )
         return;
 
-    memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
-
     free_heap_pages(virt_to_page(v), order, false);
 }
 
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -341,10 +341,6 @@ long arch_memory_op(int op, XEN_GUEST_HA
 
 unsigned long domain_get_maximum_gpfn(struct domain *d);
 
-#define memguard_guard_stack(_p)       ((void)0)
-#define memguard_guard_range(_p,_l)    ((void)0)
-#define memguard_unguard_range(_p,_l)  ((void)0)
-
 /* Release all __init and __initdata ranges to be reused */
 void free_init_memory(void);
 


