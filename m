Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF94C17E6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277457.473963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu1h-0000AP-4B; Wed, 23 Feb 2022 15:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277457.473963; Wed, 23 Feb 2022 15:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu1g-000089-Vr; Wed, 23 Feb 2022 15:58:00 +0000
Received: by outflank-mailman (input) for mailman id 277457;
 Wed, 23 Feb 2022 15:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu1g-000083-0k
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:58:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f3ad3c3-94c1-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:57:59 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-SQzgJmp3NryWrBBt5thgAw-1; Wed, 23 Feb 2022 16:57:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3770.eurprd04.prod.outlook.com (2603:10a6:8:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.28; Wed, 23 Feb
 2022 15:57:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:57:56 +0000
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
X-Inumbo-ID: 5f3ad3c3-94c1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645631878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aFyYLBG+wsL1hFDXE2XB3gg/hIZf4QnUWxpT0OEYsQ=;
	b=lHBmmS6P6PH3J3TOR17keKx2dAwglPwF4UEa0cCTOHpXOHDAdzggDSE8zvSc1H9Pg2XapF
	EQBZIv2n3a6XyxF4qLikjuvILXtM1s+FQesgkOK/341HjJh/kOJLzT9zjBWaiONs/06FxR
	NUVIoDmyMx/fU9ZjaYxL8rh3HNnD4mA=
X-MC-Unique: SQzgJmp3NryWrBBt5thgAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPm1eBKfko+0msEY4Srou/jjGn3g1iQ2VfaGtWZDCwZ8OoGd03wpWzyoRwdCAjk3xi1ij8+OMJonAfsg58NrpqMiPheKXIn6XQFmg6vUhuDpPp/yzrIOuXhJdalQqAZvbNbt302Z5S7qYyMelCvuF5JHNNyBHnvctQQ/XGkIeWVgfitxWwZlTeKFrmJBj7ngWIKpLsg6QiRn8i5HzIvNRkqzBJiNUOEnuJGXKArR1jgWiI7wZeNSr6QIfFg0ftEBs5RddEvGF5T4ExH7QotGcgdxys6PXLLJMS9w72zs6n6wPblbdJYtS/NJs43xhamHaYydDaaB2WxB5MA+FgGGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aFyYLBG+wsL1hFDXE2XB3gg/hIZf4QnUWxpT0OEYsQ=;
 b=mS97rn069Ede95/TcGHwN8fy7CC446CWe4n7tl+YDPUS9oHiPpqbqLdtsmMGRhvN02RGNJI9s8ZZyyujHuzmTpUfcBTSwk9HWOpeRZ+NmW5oIkXYCu54K/B7Y7vsM+UXFzapCe5+PKP+CRhpmy7iQ01fdJ/BMhlTIvMkLmKfrq/40VoKQUDhdVk+KnjKc9OKfZ4m7vwzsIGvvJ/9AmP+/CAO5S5+J6/5525U6sMi9abYnQ+ERd8e8f9qY/8QUr4nJxTtbQotzqxdu78Jl8a8cvU5NdpYdBybEWyAREJAQqU1T38J0mbMvPdB2C2LSrQR/OtoZf+XPJXEJqdPjoWfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2353ed37-e62a-4e34-7442-0638bb92dc2c@suse.com>
Date: Wed, 23 Feb 2022 16:57:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 01/14] x86/P2M: rename p2m_remove_page()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0103.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f9a0e0e-c011-4b7e-c8c2-08d9f6e541c5
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3770:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3770F4E152C552B7FF72A646B33C9@DB3PR0402MB3770.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7G/HNfygm3MNpj2kD5dxbOsbERLa9Y/VF2MB8MqzFwu6msYEnUReAXXg6dAUy24BrVwcc9uE/IhATLpWJcSYc/ixgIouTZmV5/9F09sN3Ps8PMxjniBD49jGi4ZpCg0jecc0MvbR3MzhreH3BZNTkL37kQ8fvhVYWtxC/fE+VAkQp4h2b5KJau0bDt8vqGAP//D6ALTQlAVojjP63oUub581AD1UUPnsOyPqfEfJEjpxG/1An0JyoG/MAwxYJCgiIWExnR9Hj/l6zxBsYQoQiR8eZSvmhtfjudVsbljeVwve3BSLZoshBsE47tL/yx1NCrCdNPH0E1HUUjLStwtSFadI14TVEtg82jK/oI+3opcuskeevCcCV+FMg++sIn2xI0fv9K7auQugxKWonZacPEc4o3AsJ8i4AFRVTAykhNJS7Zwq3C4kh/AoVMSeRsC4h1Iehh7gujIE4mrMZmpxiqq/HRbW1+1gzXY1gXYb1rdJJHHliNAD7vuXqkXJFskKBFOlQJxBiDeERJmEkUEr2F125JMM5DKumS2rtzHRIy19jR3XaVfPv8NjyWtnxzefzwO09KcWNB3gWv2/S55yGjdeBxQX40i3cjaOAfx6YfnpaBEaJrw2F38WA4s1R6aY4OS3oFiEJDPYyDVcG73APKKru8NEYwIXkWS4Tq2hteqfJdIh1LGvXx3SkT27uPfFEexzXzWKn55BJqjD9uVjp5tut80SNuv5H/K66xP99rbX12zttcTO3dzCOQwykogq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(36756003)(6506007)(31686004)(6512007)(316002)(6486002)(5660300002)(6916009)(54906003)(31696002)(6666004)(508600001)(86362001)(2906002)(2616005)(83380400001)(26005)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldwZUxFaGJTeDRJQkdpZlYyLzJkWkNZbEc0RlFLaU9MVnUwSUlIRW1jZ2Nn?=
 =?utf-8?B?NWRzczhIUGZiVUJHeVZRd0JSakNuTWt4RXlWVng5VmJmSlRuLy9BZ0N6aTRD?=
 =?utf-8?B?NHBYWmh3elZmRG1uTER6YmZNZ3FJVEVRYmk1NTdFSlJ0VCtZNmZrdXhxNE8z?=
 =?utf-8?B?Tkc2TmMrQWEvVlpibmswUEF1VkpUQjQwYWxkeC9CQUNnM3hmRlVTRDhQTExy?=
 =?utf-8?B?K1JuTGlHZFFQS3l4d2tHU1ZqYTBZQ0RPdmowNElQZG1Ed3VmWlNNeC93OFpa?=
 =?utf-8?B?cDNPb2ZFc25yaGRyejZiNWt2VS9CS2pYL2FKa0tLMENzNThiWEJ3Z0VFNWx5?=
 =?utf-8?B?M0hYVHp0WE41ZHd1KzYxeVVJMjFxWEFqSnJKaGRVdVpPVVBWNnNLd2hneWUv?=
 =?utf-8?B?aEM4NmhmTmMyTTNOVEVqQklVV2Nwcy9ma2ZnZm15N3h5djd2VmRQZXJ3QmVs?=
 =?utf-8?B?c1VJenRpOFl5RVJwaHlEVzBrNFhWSkhxK0ZNRGg1KzI3S2lvUlFUT1hNZXI5?=
 =?utf-8?B?dmRTVnM4TGtMUUtVMjlFd2NGaHJvVmJ4SG0yM2dzUnhYMm1xdnFibVE1dHFx?=
 =?utf-8?B?dnZwWVF4WHdSVE9sRjNHTU5qN2kzK1FDc1VUTTVnaDVUVmJMK055TGtva0Jh?=
 =?utf-8?B?bTJUeGhUTFpvU01jQ1lFSnA3c01ybWMyR0RFL3ZpQ1JOS0p4MzdhdDdCUWgy?=
 =?utf-8?B?R2lrUDJobUhEcUNOb2lMcWtGQ1Jza2NOdUJobmtLcFhoa0RhdjNhcUYzS05u?=
 =?utf-8?B?ZlFyWmZET2VqMnA2eXlPNnVMQklab1pxZnk3YTFBNVdSQUpYMGZtanBUU3FZ?=
 =?utf-8?B?a0lTdGhCa1hNVEZlYURKTFpxUWNFKzNvNjc3S0lwWnIzWTJXTldHOFJoVUhK?=
 =?utf-8?B?dGxteUc0Z082Um9wQ1VBR2Z3WDQvVjBvVXN1SC8vRVJ1TUo3RDJGT2pTY3Vx?=
 =?utf-8?B?cXN6dWVSM1VqcHRZNkwxc0JXT0dVMHNCazEvUG5jS21WZmtBbURSQklqZDdq?=
 =?utf-8?B?UXRoWUZvRXk3TDFneTVyamVTNDBZSlZGWEIxVWVZRWpmSTlmNjlZcmZpblFr?=
 =?utf-8?B?V1NLMHFXNG9VeTdqRUptZ1A1TGhYVnNUVWh4SnZDeXdsS1RYU0JzUTZLRUlx?=
 =?utf-8?B?UFE2MzhrZUlTQk4xOHliYVBCNExGaFl4Z2lROXdqWGQrcFBHbm9JR0VSR3RT?=
 =?utf-8?B?ZkVxVHR3UFVoTEZTeUp1VXYwTEhoMUNlNkcrSHNGNkVtUGVzaVQ0MTRtSnhw?=
 =?utf-8?B?K0tIVmVzb1A0Z1d1c20yOXZqQ2NpNXdjZTRlRThRMFVlNEx0NDRlREZMK2J5?=
 =?utf-8?B?L0tKZUY4ZVpyeG1IV2huVFdwdDQxZFBtdk8rWHQ3QXJrOFNlalNiR05MTmhE?=
 =?utf-8?B?am9nMzl4SkJySVN6VmM2b215OHdrNks4VXppTGsvbGJBKzhwbE1ISkhNWnhr?=
 =?utf-8?B?b08rK2VRN1ZqQW9MbDhTR0ErUWZ2ME5GWVo2ejc2WXZUMzQxSUhXZW1Qa1ph?=
 =?utf-8?B?K0pkWnFRZ2ZnTDcwSEF6bVBkK0doa2dqVzlkYXZvcUZHVFlsZFk5U3d4QnlC?=
 =?utf-8?B?TE1zUExJMjBBNmdSOGlYeThmZmx4Z3ZXYXI0T0orVEp6aUhzQVJOSzYvVXlr?=
 =?utf-8?B?ZExUd0FYV1k1MWFJUWtvc2hWbEJFOGxnMjZoOUcwUVVJUFplZzdGRXdMSjkw?=
 =?utf-8?B?QW1IbExJZ1ZPVlByT1o4S21peXpnQ2RqYWV5cnpVUU9zWGJaQ2lITG9sbnFM?=
 =?utf-8?B?N1RTVjgvZm1lZ2RyM08wMHgwYW5kMjZibk5RR2pGajBNdDM0RktOTWV2VTNl?=
 =?utf-8?B?UnpwNWNWN3ByS2o4UVBzZjlHdURaTEVjdUdWamRWOFJlMGtwRzduQlA3YXV3?=
 =?utf-8?B?ZzhIRFBvY2dkYmFzMVAzWVZoOCs0TkhoZEQwWXBQQzFzYm9aOGJMdldld2xu?=
 =?utf-8?B?UDY1Y004alV1Zm1iTDlOdkpZeTY4UFE0ZlBPd3FwUDU3blN5OTlaSnRqY3Iz?=
 =?utf-8?B?SXpCK2hwRTlVQURaODFwVHpjSGNLalJ1SmpzQzUzazcyd2s2MEJwc1lTcWxZ?=
 =?utf-8?B?QWsyeHFIdm9ZRVYvWlVPaDZhSHFBM0RXbmlHd1NkL3hnM2MrcWFGK3RUSEh3?=
 =?utf-8?B?RS9ET09KOWhzbENUVW5tMy9BMks3dmRqSEErci9VZmpSWGtWR0pUdVQxcHJD?=
 =?utf-8?Q?Y8N08vJMOnRYKlKpN/ug//o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9a0e0e-c011-4b7e-c8c2-08d9f6e541c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:57:56.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66J6X4yg94OJC5Sx0LWHMCdwjgOUe/FMe+ZfB2cL5yAt7c3LPuni4lZvViKy2ZOvRSl/rU3lBjMzwl4jUQg24w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3770

This is in preparation to re-using the original name.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -788,8 +788,8 @@ void p2m_final_teardown(struct domain *d
 #ifdef CONFIG_HVM
 
 static int __must_check
-p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
-                unsigned int page_order)
+p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
+                 unsigned int page_order)
 {
     unsigned long i;
     p2m_type_t t;
@@ -861,7 +861,7 @@ guest_physmap_remove_page(struct domain
         return 0;
 
     gfn_lock(p2m, gfn, page_order);
-    rc = p2m_remove_page(p2m, gfn, mfn, page_order);
+    rc = p2m_remove_entry(p2m, gfn, mfn, page_order);
     gfn_unlock(p2m, gfn, page_order);
 
     return rc;
@@ -1034,7 +1034,7 @@ guest_physmap_add_entry(struct domain *d
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
                           gfn_x(ogfn) , mfn_x(omfn));
                 if ( mfn_eq(omfn, mfn_add(mfn, i)) &&
-                     (rc = p2m_remove_page(p2m, ogfn, omfn, 0)) )
+                     (rc = p2m_remove_entry(p2m, ogfn, omfn, 0)) )
                     goto out;
             }
         }
@@ -2444,7 +2444,7 @@ int p2m_change_altp2m_gfn(struct domain
     {
         mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
         rc = mfn_valid(mfn)
-             ? p2m_remove_page(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
+             ? p2m_remove_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
              : 0;
         goto out;
     }


