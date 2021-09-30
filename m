Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A980741D9AE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199848.354146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv3z-0008Mg-EA; Thu, 30 Sep 2021 12:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199848.354146; Thu, 30 Sep 2021 12:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv3z-0008Ju-Aw; Thu, 30 Sep 2021 12:21:23 +0000
Received: by outflank-mailman (input) for mailman id 199848;
 Thu, 30 Sep 2021 12:21:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv3x-0008Ji-M0
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:21:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb3c4875-2fc5-4628-bd66-b96927cc7f2a;
 Thu, 30 Sep 2021 12:21:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-R1EdHtdwPb-ypfUNmqcC8A-2;
 Thu, 30 Sep 2021 14:21:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 30 Sep
 2021 12:21:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:21:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:20b:c0::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:21:15 +0000
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
X-Inumbo-ID: eb3c4875-2fc5-4628-bd66-b96927cc7f2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OR7SHokyJQPfRnNpqW3y2s0XYRmL/qDbA1LJNDMXcA=;
	b=gCbkq4xI+Hq+dWhq+bM4Zi2UdyK14TEW9bE4QBCgfFq3AuFnRDH1l+E4c1LSH9adohP1U5
	yjq84A5x5eUYMB0xce7jK/hiF+19+Zkg8eNa2MZ0laCdzEgwyMRZL9MtqD3h2WsNdo8sMG
	9g6dFZiKkSCJidlaMaCSdr/nJbSFb5M=
X-MC-Unique: R1EdHtdwPb-ypfUNmqcC8A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpUYlH/GwjqQxxAyph4HQ61KdVBWuzcE+U3pVdILhNNcYHrkzJx5DJlzsPSCVYJ3Kh7OkjJ44gJ9hv6n5GzNj22jtcQVn2l6trPzXEGmJ52U9AJNlGuvafswwfTbyDI3RwzWq9Ko42xFSvmtYduqIkOGlTa1jHOIzxMUx5hxkEQ0owBJ4Ykg/qTzq3u/EQwYE7dRCX2XOMXv5OC+r0kif3Gy/bJhFxW0rssnzhFOTU+qPe5hQd96bDPnZNMSZ/KIgCMoteGZ5wNKsA/x66xJhvB8VHLOR9rt9dkLKI9rnYNkEPo7ctZ207q2CIaZISstn9DhU5tMn/K84f2WYG44tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ditd68ADMvga99ZSd2S+JMyE109ILHuWeFBMIRmBXp8=;
 b=CV37N+srVIulJ63nHpN171ukDgxMSgk/z84ghwN0bFrTnsWhEF7Rm3SLwPGJNuzCoHCyoZUriWzTw1d0lwFm/ciVd5q5YfdW9Y/J1pC41vTCYic1SfuRHv0NodvVAvuYvTW5qlG6+aJVHz8nnAsWAlNf2z/i8uGjTtCSU2BfHFBzStmOfS5IjXCI0EJQdxKa2OqndNogxm8cfxWLLbusnR7Hcf8jkgfUZrqVWH8HCVyiZkYCdgCSonCkhSl8tc44owzkp3y4PF2ujmo846e9jeZUpTOJ29U8uH952N8F8s7b+v6oKdggM+koOL4y/o4fke6tp8UOl4nvLd+Rj9Zrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 9/9] xen/x86: adjust data placement
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <8155ed26-5a1d-c06f-42d8-596d26e75849@suse.com>
Date: Thu, 30 Sep 2021 14:21:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0044.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aa12f35-be2e-4f20-45a2-08d9840cccae
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038253A0D7CCCBF98226E29B3AA9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zsmmEdYh/SJGGSnvOAJE/uiDUt5nXS1I1q0ORdV8qO67IOcTSAbp7B7tWsiBgcfLiSJ+TuyYsUvoyzwk30aXUsLFkwgPBHsMP2VQ+Hyl307pNlP0jz0a4oRXK9wdGOTiB9mNVod5DcPjMvSImBrUSu3Wcmm2cfqiUfuJzofkpL5FnU6A2Qq4QVQqPAXdzb+rGcH8G84sn6K3jG9NdOB0FlML8Qma4fWVu1CWk4rxcyOWH/TT0liEnKdRkJfCfWArPdiPokFSQlW5UYQHa7LOUxGmv02dt4fm9veTX+pWbRdqx649VxzsfxSpLJgk44ioiTPOJe0tWMtReQyqhqRKUv6jHMmVTH9fW3iCTdUwpyLIPXjX3KWrHUSz2G82753x4A+qsYAX6W+PwGjfitu9mUa4dyivC3Wyyv1AnryPG955clJfKvhudhRjfC45a/9R3br/N6IKAomxQ6d3EfXJipGtNo1y4Fzc296Lr5YUwhVR9Mt3vbYJpGb3eIKY5lw9gUeRwe4rZzZ7ikP3cXRNudYFGKUjcQ7apMnF5l2xkRDFT7NLDx+DKfP3DjG75Kk0pNRtmYJtikREzHdndIYj2VpbAQQyrI1Bo0lZsofdct/3l3fX2RueJEOAphQTVn/pFqbH5RVdS7TTNcAu0OIVLVVo04zKZZpbYFl/tlbjkyXLslyfBEtp2aU/K0UFtVASsUho6ch41w8VRgDH8xpOTjRWeMV37uVjjt+nLWrgbpACYa6ldPna7LiTNhC6nTCm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6486002)(54906003)(66946007)(86362001)(16576012)(508600001)(36756003)(66556008)(66476007)(8676002)(31696002)(5660300002)(8936002)(31686004)(110136005)(2906002)(956004)(2616005)(26005)(38100700002)(316002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n3v2wC5ga7QHVRb8OQ9O8FqR4sL5QZNRpApXIrP6j1D8BQlDxdiAmJO2y8sv?=
 =?us-ascii?Q?Ovr9V8EKikUP2virTtcCHm0R/jI6CnrYPhbchgFd3AKjuLKBgjKlR1AkzxiG?=
 =?us-ascii?Q?zB0x80WYEfIOevUqv2ZKfyObzWFr+ZMsCc9CfXXQ8rsAHsEzaP9N6RFaCNIH?=
 =?us-ascii?Q?HVQKJqfB9YYREx/NoV0BL471Fvz5HPxRbDrO9Xd0Zo51a6XNfqEZKUCHCKig?=
 =?us-ascii?Q?fv1ESpAQXkCAv1daFO3V+dST2sodgCUng5U6Q9Hgn+h+qihw4EZ6PjPEa2RR?=
 =?us-ascii?Q?WL/KpNa9StH/zH8KCyvEirT8Q74ankMr60ur9OLSIhP/FA8aRaO7P+kun5oX?=
 =?us-ascii?Q?aqDgdA10YLG252aBZz0mfq+pwptnMWAgm1c3n+SwvAF61yVAKpuZ2D9vM37Z?=
 =?us-ascii?Q?9oiNIBIcm3M3zM6vz83byONCttCAk/u7FY29WUnpLhEwsfWuUt1pAQ1Seoqy?=
 =?us-ascii?Q?DGywVgIOsSTGCy76a4cpOS83ODyYzGM6pMJUuT3lIsWLJz2ucjap5LP44SWK?=
 =?us-ascii?Q?Y1ZYVS6006SsldVSaPuCMSi3qHDYV4aiJOzZ++Yg4q0/5Q+geSbjDExUZz5v?=
 =?us-ascii?Q?BDafk7fmHzzb6G9y06sj0pCSqx367vDyVBGsLTm/LQduELx/wfINUdruUz5s?=
 =?us-ascii?Q?7xeI0k9qM5TuacIxzRDVc4/eZk5G2lIba7j2IhbSfZbDmqMWBa+4uL+E0uJI?=
 =?us-ascii?Q?Eqot2JPVh848Qy3/ryufn3Gx+lGHtDTCBPTnp5NhdBA4dfw/HksAliw+FFLl?=
 =?us-ascii?Q?0bVEjvDc6yXoY8n98dhfqVqz9Wgx9SsGKkPKaN+DVxYDbwLzpE9xBN1AKuor?=
 =?us-ascii?Q?upOlJa66fwZRTZNzXWS5sONbYhwvJ8GgGAuVK3hBgP4iaBd6y1qEoXarQ5/7?=
 =?us-ascii?Q?pmSAlRZVL7Da0shrQsQt9515M/rgdscmjsgj/GQcL53T3IS21pu6vUWd86+T?=
 =?us-ascii?Q?GcLfvTgAy/KiCK6ox7ls7YyRpTsx6sEzDGoUzO8ulisBoTjMbkqEjf+3aoLl?=
 =?us-ascii?Q?XXHxA4Knd2rcZ5cNbSKy4zvxK/CVX/3yg0mvl0d5jwC6G23nqDP+Iv/QfaJ2?=
 =?us-ascii?Q?QCmKHF9njCVemqBnxI82LJnZtOt3MXlrzk7rNf2T4gBsEu7FvHZpdE3T+scb?=
 =?us-ascii?Q?9txd1aG10c8XElBbt8J+zE/yUl1UIvZuWm9XMyvI5gzpr4peQSLjukzMEH99?=
 =?us-ascii?Q?nJGjvRg719HQdxBVFc4Spgimj9tzI07BFEzRt683yv0hFBAU8n20mbXwUHmm?=
 =?us-ascii?Q?nHwy8Hl7av2rc7iqzOF7K6MkR4COiRF9mdLUwbMhkf/SFF8IPEH5xXV799xG?=
 =?us-ascii?Q?d+qZzfweJ4CSpxNZ7wVY4GAB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa12f35-be2e-4f20-45a2-08d9840cccae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:21:15.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 954wTYkxX9m5rOjLoyvleCp5N6DGDbZG1BjyA40SVZduq+MykI2PgMgKYRFbVzCt5vOo7bS2PLhXCApvTzY0nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

Both xen_pvh and xen_start_flags get written just once early during
init. Using the respective annotation then allows the open-coded placing
in .data to go away.

Additionally the former, like the latter, wants exporting, or else
xen_pvh_domain() can't be used from modules.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that it is completely unclear to me which form of
exporting I should have used: xen_domain_type is GPL-only while
xen_start_flags is not, yet both are used in similar ways, extending to
xen_pvh. Picking the GPL version was suggested by J=C3=BCrgen.
---
v2: Use EXPORT_SYMBOL_GPL().

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -75,7 +75,7 @@ EXPORT_SYMBOL_GPL(xen_have_vector_callba
  */
 enum xen_domain_type __ro_after_init xen_domain_type =3D XEN_NATIVE;
 EXPORT_SYMBOL_GPL(xen_domain_type);
-uint32_t xen_start_flags __section(".data") =3D 0;
+uint32_t __ro_after_init xen_start_flags;
 EXPORT_SYMBOL(xen_start_flags);
=20
 /*
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
+#include <linux/export.h>
=20
 #include <xen/hvc-console.h>
=20
@@ -18,10 +19,11 @@
 /*
  * PVH variables.
  *
- * The variable xen_pvh needs to live in the data segment since it is used
+ * The variable xen_pvh needs to live in a data segment since it is used
  * after startup_{32|64} is invoked, which will clear the .bss segment.
  */
-bool xen_pvh __section(".data") =3D 0;
+bool __ro_after_init xen_pvh;
+EXPORT_SYMBOL_GPL(xen_pvh);
=20
 void __init xen_pvh_init(struct boot_params *boot_params)
 {


