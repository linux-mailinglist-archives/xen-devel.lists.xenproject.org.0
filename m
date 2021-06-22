Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198B3B0895
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145909.268396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviBF-0000cW-Mx; Tue, 22 Jun 2021 15:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145909.268396; Tue, 22 Jun 2021 15:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviBF-0000a2-Ir; Tue, 22 Jun 2021 15:19:13 +0000
Received: by outflank-mailman (input) for mailman id 145909;
 Tue, 22 Jun 2021 15:19:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviBD-0000XJ-Mc
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:19:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 998ae3e5-60d6-4031-abb0-03934d01a185;
 Tue, 22 Jun 2021 15:19:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-6zrQ2TaTMkqiTtvGoEOE0w-2; Tue, 22 Jun 2021 17:19:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 15:19:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:19:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 15:19:05 +0000
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
X-Inumbo-ID: 998ae3e5-60d6-4031-abb0-03934d01a185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624375149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7aZ9aamUBA9PBvkAH24rsLpHVK608muDDgeGAckfnI=;
	b=aS8BNci371L7vMIMzl9srivjh3hBVrl5HwhCcaPU3npBsfVWE5AtbkBK8RvjbiKAywvrkx
	HSrep8NFvAOdU/izWN6zfYs5L+uYezUYbcvA9MgSBju2daG//PSlApG4aPNQ+vSJKe19h0
	cv66Xt5JkUSQspcyyWWmhh28e+6VNCs=
X-MC-Unique: 6zrQ2TaTMkqiTtvGoEOE0w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoF6GGcQ0TodynqEUwR3HXb+4LvimWVBOX/LWgojfN4MABHmlIwTimmPclQeJB6KFsM8RV/Acxr35rJJTsr84zgTSvDpTEeHFYLVA/EIdN701YpzshuR3ZBweWPlfNDo+gl3O67h8omnrRo0MfU2RlFeFOfdrYYywOmr6ilM/vUjhS+m5jmTxS7cotbD8vsk1BNNl6rIqNdAiCCSbK3GSwM3CfpHMgkklyIw2CkU0YlLxjOUGuQdtSbxzyy6w8RwHkTeHX8k0Q8y64+cIUST3pRiOgaAVmwSVfqzdjGT3tOTWKEkm2UH822obVXs8l35i4wshaPX8jfR19pvl3xkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwPksR3zOXlIg4DjGCbrhutFiluGq2C63mB3WLwPcfg=;
 b=a8mBeyHUwTDt1boieaUJo9i4xWpV30HOBBCh4Kb3FT2DhvMKpbrpGw7gmKqyYcF3SIHZF+n3GnrJjm+AGcStdIv1a4dvFiwUPrZ8+HnIcrhJ4JXoJll+OOFYtU1ZDIeIdTanE6CadO/XeBB0HncyP0/LBe+w2c4bCL2O3EsDCQX/SsfpFjsG5EcbtlP/HCPRdsVoVWqmc9yfpTc/Q5jIOFJl8JP7/59H+McreytCRCpA+cGnc07dXu+9cX3FZh0h+5ARqey6bHVA4P82vGIrdZ3VrzXAxUkboGAxI5A80QAG+GTnZIXzGeMxiECpfUcYZspfoq1lbGh2C79J8dJWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 4/6] libxc: use multicall for memory-op on Linux (and
 Solaris)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Message-ID: <f56ceeaf-745b-9064-e6c1-83bdb0d04360@suse.com>
Date: Tue, 22 Jun 2021 17:19:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af4d3b3-c47e-4da7-2ee7-08d93591136e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64784B0C4D8C7755C44C2839B3099@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kPZVrueqmqCyMIXqHap0u4FjWA5I14tDUujkboLal9DQ3naUECJGVN+qvodZMGyDM0FWsiOYBiXeUyqLkLVVadwQrCcEuGCf87+KT+IPoQCGTHNYbEToA6f53sANC1BrfWCwJ0R+wN5Q0YWdskgOqEXVG8SL69gmRkQ/oBxxNLc9kEpwhaBYpQE4YOJreRi1ot+Fvi1czjt35cEbrwRVUFJ/MPcd3jUZ5iYLOSq4OAVffSubYb742FI+by98GD0N2Rv475YMiP1hqta+vCYrPWfM162tUT0NGop5ReK9y6sZ9pyog1X4a+3dtbhAIMWAHgKjtWHUutLTLgzXpARNnPWB5dG9IUeyC2pRr3duPTuOuhrlQ/14opze5Hll+J67ojrMG6HzsOmNcXTm6V8yXKy/gC9Nbk8RmR4cshdsBDwyu74aTSUo5kl5YeKrJ4FN0YX2kHdAGtFKbR9QsJBxZP9omtcXaAYC0VAi5UrewgLnA5qpSRpt5p9jjp0KCTQrNo1E+dx8P+1fm2QlhDSI01uCkp+zbBFbpaxWS+IlkoRVw6i3jjIGcsPlkGPifnQ1OswGav9y4r/Tj6mUFOavF1y8kJQO31RBMmk1XwShd0WHc/qMqC0d/opQ0jcDZor90UIeiuVdqsP8HhtMOnvAgmVwITPOXGh2jjZvibutvqJWdyScRpAdp+6BzBlQlPGU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(376002)(396003)(366004)(26005)(186003)(5660300002)(4326008)(16526019)(36756003)(38100700002)(2616005)(107886003)(316002)(956004)(54906003)(16576012)(2906002)(66574015)(31696002)(66946007)(8936002)(86362001)(83380400001)(6916009)(478600001)(6486002)(8676002)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RUpPJBFxRdYJawBxj1vTgUDdSTCvXM1/Vhfa7cO1LhXJEtB2xGAntV9uJMJm?=
 =?us-ascii?Q?ZaLm1WYDdqTRZsv+hSauZaTBJwIxZimiXT414vnBGTcRdtZTVYMhIRWYbqX5?=
 =?us-ascii?Q?9mjbvmSPqybCHpfkCOupvIV2K5BvEOZzQYtJmix2NMJQeKxSliDgZRI3c2UR?=
 =?us-ascii?Q?6GdDNgV0JfiqIIVVGbz/Oowb0EZkB134Zdo+KlyT9BOhQIuRuBultgUiMP2Z?=
 =?us-ascii?Q?seyR4zGhiY4WLHBNc+nr7K8xCi9/1YdYSe/wHVQi2LKUaG14R6PlOGW6SacQ?=
 =?us-ascii?Q?wk9he1QaIu54Phogtf6GueoTouQMpvuXwPhhW0GNTrpazfTNRbJdVatJ8yXf?=
 =?us-ascii?Q?iUU53po5xGb9mA/VV2I/3YScXm4XmR36dAyrwhCIZ5AKpnH23Ha1XyzxZ3c5?=
 =?us-ascii?Q?fPt2Jiucre6rHHmMicxULto/+gk9rKM+dhf0m7X3u7dw1NdCcEzs0WBEbQ9t?=
 =?us-ascii?Q?QkOhmKjoje6OEaFsLST7q74O4wGoJdmX4a6ZbbNG1LAV0PLy7iUuPXQaDBKK?=
 =?us-ascii?Q?WIEZBLN4AenYy9deoRMQEbru8HO41s0lO7LgiUIGsGhwKJBh4Svfv6dz30DF?=
 =?us-ascii?Q?deBEYEcVOHfJbwNkwPg2WY7tgR/j+H39VffMnYYzWqqEepcASAGFJQO9juHu?=
 =?us-ascii?Q?3y9YGOjQuViZjPm64AzHZVCyOp53MUpDB0YspOAa2t0IDlJOdSEX/whCNYAY?=
 =?us-ascii?Q?8+2uMyYvOUBsgtHPrdEDRfxF4O8dvody3JQCKfm+EBM+bpGBHhsWnQyqYWrH?=
 =?us-ascii?Q?kEzNenmr1OZZB00d/wRbPgT/5XgtUmH7cZkvzduDjYGYMmqBsmOeuMIHy1hE?=
 =?us-ascii?Q?6W7qzEbLgk7PsXNVRxVpCIxsPxc+AWd/UwR84BdKk+rOUp14YpLvhpplSejU?=
 =?us-ascii?Q?H0qtAPXXXZz94vNv5E8ondBvdKqyJjGVyC8j1hpjcofnNFkmew1WXUrlgFZI?=
 =?us-ascii?Q?Bw1sWHV0p9QsoHizErpwwxZOiOgmmhjJMaLi3fz77S7iaRSrs2nSncIK0sQo?=
 =?us-ascii?Q?01W+jr8ys+Sg5HzkQkow61v98K2WjaPuYjpssNuyMHqInKQd7udImahjHjWD?=
 =?us-ascii?Q?xrlGF2z43CpFkPwf96iW+s8CCAuI0OOCDX8FYSo2USWlP/d9curQQ2AKTiyR?=
 =?us-ascii?Q?hdew/VXRk3A1g79YjsBCqhVUPiCk0AeON1KLOKX3T56C6JaborLD8kKi+WbW?=
 =?us-ascii?Q?G1VHL1hwiL6kmWe4leX7I+j5KLY/1sAzqiff/mGS48h2PyCc2QdYRnWefkEF?=
 =?us-ascii?Q?nFNMHtALK08pXBkNM9ZWYf48ldUytIrSZm0asNN4r7aB1vrxbReIBbWdXFhV?=
 =?us-ascii?Q?g18ar28YAch0PetxwgOBV4yQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af4d3b3-c47e-4da7-2ee7-08d93591136e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:19:06.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnohVVCWTz4H60C68EKvgp7ZWF9n498W8LboSspQaRwNDfAwxdMr6/eD6939Kw4yxlJNrhX5yyrzvfZR8WPeUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

Some sub-functions, XENMEM_maximum_gpfn and XENMEM_maximum_ram_page in
particular, can return values requiring more than 31 bits to represent.
Hence we cannot issue the hypercall directly when the return value of
ioctl() is used to propagate this value (note that this is not the case
for the BSDs, and MiniOS already wraps all hypercalls in a multicall).

Suggested-by: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Ian Jackson <iwj@xenproject.org>

--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -337,8 +337,47 @@ long do_memory_op(xc_interface *xch, int
         goto out1;
     }
=20
-    ret =3D xencall2(xch->xcall, __HYPERVISOR_memory_op,
-                   cmd, HYPERCALL_BUFFER_AS_ARG(arg));
+#if defined(__linux__) || defined(__sun__)
+    /*
+     * Some sub-ops return values which don't fit in "int". On platforms
+     * without a specific hypercall return value field in the privcmd
+     * interface structure, issue the request as a single-element multical=
l,
+     * to be able to capture the full return value.
+     */
+    if ( sizeof(long) > sizeof(int) )
+    {
+        multicall_entry_t multicall =3D {
+            .op =3D __HYPERVISOR_memory_op,
+            .args[0] =3D cmd,
+            .args[1] =3D HYPERCALL_BUFFER_AS_ARG(arg),
+        }, *call =3D &multicall;
+        DECLARE_HYPERCALL_BOUNCE(call, sizeof(*call),
+                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+
+        if ( xc_hypercall_bounce_pre(xch, call) )
+        {
+            PERROR("Could not bounce buffer for memory_op hypercall");
+            goto out1;
+        }
+
+        ret =3D do_multicall_op(xch, HYPERCALL_BUFFER(call), 1);
+
+        xc_hypercall_bounce_post(xch, call);
+
+        if ( !ret )
+        {
+            ret =3D multicall.result;
+            if ( multicall.result > ~0xfffUL )
+            {
+                errno =3D -ret;
+                ret =3D -1;
+            }
+        }
+    }
+    else
+#endif
+        ret =3D xencall2L(xch->xcall, __HYPERVISOR_memory_op,
+                        cmd, HYPERCALL_BUFFER_AS_ARG(arg));
=20
     xc_hypercall_bounce_post(xch, arg);
  out1:


