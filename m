Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B13AC8C0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144426.265829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBgT-00087V-Ob; Fri, 18 Jun 2021 10:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144426.265829; Fri, 18 Jun 2021 10:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBgT-00085B-Kp; Fri, 18 Jun 2021 10:25:09 +0000
Received: by outflank-mailman (input) for mailman id 144426;
 Fri, 18 Jun 2021 10:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luBgS-00081V-15
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:25:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 930bef26-6136-461b-853f-b92fa8eea898;
 Fri, 18 Jun 2021 10:25:02 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-fK_H9dFENZW21h_foU7MHA-2; Fri, 18 Jun 2021 12:25:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 10:24:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 10:24:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 10:24:55 +0000
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
X-Inumbo-ID: 930bef26-6136-461b-853f-b92fa8eea898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624011901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahDWmzB3GHWA1eTFvFk5kHSbaoQEbqF3qXL5cCuWzy4=;
	b=ZmdinxGEnh5mxLbExbRIztNIXxaPPs088bxlYtDJR26uOXjcf8Zeaip4CS84Fm7Kvt/bQ3
	3aVBlhCsuH7FXQFc7o/7ESTd1ya6MaoY+3/axfGfj8zqsb0G3NGjJrhuM45LKoF3K09pmo
	n20KUQ/H3qvVllyH40qvVGt6vd+RK/I=
X-MC-Unique: fK_H9dFENZW21h_foU7MHA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwN9k1IQlhorXBmnqvEonzgHr8ttkInSEKDlGnEoX7jASWG5vlrCEL+76a7qGtaq4YkZL72mOArF41U4jp7ZX4+zCe+OTlSpEJQyfd4N5jnU5DZP0ttpuluUKt8c6Bpq/GQtAIKHuztE1VTebXJD/YT0HqZAB5caJ+0iozBw/kIKpWODHRRwJtiENqjFqKfCMBW4095y+t0gshPf+L836y40mSrYemp4U3ZgU8W/3NQGK12aGRjxzv+o1kAaKQdUXIzZF5yahgC6gOfE7+lEbciE1ZPKq+WeF3RvQ7d7sCN3RNFKvodxM/g+7F7llosFvquTL4gGxgNqJdaOOaUwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx3gFp3n9BvdQf1GHZ3mn0AwjS8nAcB86a1HzYSQ+Co=;
 b=HI1FX13ZU4VJXeQin2rnRvR2+LSbEv1hpWWtbuw/z5bSECE4nFxhMjxMCoRrlIYQCtKZSh7JSsoFsP7AuqbtobVRUIAq73JOyj9177tRBE9gp2a2FSatEu1PdFGPzhDBG8aDWnBilmk0mcaW3mrx236FfMd2dwlPWvDpV/BVx1xi64EGu6RQQiPRkwJwZYH6o3In598dxVdjewVXHYcVsauYJVq1KxNpjzqRhFVuPyrOlBxpciHoglurQdreDY8fb+P+0w+2pGVwUPGRc++jt9fBDi7Z5ja6VkDtdR/Z5vHlNHRA+nBd7b/BmqHm2WlYhoOAMPcqiiCUNowkmcb12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/5] libxc: use multicall for memory-op on Linux (and Solaris)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Message-ID: <8a5284e3-a029-27c8-103c-cbc12642d24d@suse.com>
Date: Fri, 18 Jun 2021 12:24:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 736da1bd-c16a-4f12-fe3d-08d932435185
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617397373A4F22C480BAAB7CB30D9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6pZxLIzV6Vuoz523a/gYs4k5h1qbEC4FoLbAc9kc80Y4GoUfTKpf0U30bQZPb0lKLeaNx40KSaXj7Hf6+xSNB3TBaE/0UXR1EEdUXzaBS+C1dXQLlRYi6KqTdBlsNUcdhrQ+TNgFn7komXx7jFqc1vsrgj/qkMPCche/iI68KRYsqF4H3jS6VZt6LYDMtlOZWAnEMd6siyzo6GX8RyyBEygl/jD+zy/TVWrQzXkVt8ujwjBFVt2LO4q/EByOFYazOxAN1Cs/kxrEQiQ7mGI69xhKGy3ZSGlFjdJd36eF8v2PRN4hvZtL2xN0RXY7D/ggViIjDIsTxwTQZ9LJqavDOCIn9vO9tCn0n6B2AVTDLGDQq5deHoyIT0MhuUoaFfC9UBDNY+ZCSnuhsIDHwzEMVubh5fwHLD63GfIuZTi0fezRITX3lgcDrTVTTT14kTyQWD3EZZiPhX13xVvy2feGgjnb5KsgC6O6LMdKgHrl/3F4/Xna5b48Dpucsdarx52ly03CHbVf0ute3khPfc5hRBlzUr2gdwj/coj46IqkSAjNJo11usmtTOH5AdUxUqFw17eLDo/8RJuZiLce8aL97PndypPcb6g5a6ZwiC3+jXnWNCbWUbM4osqNNnVr3yCvbsSuXFYSG2BRUGsaF1UxGzjdq4df0CLvCfGFTs1iMpPoGDDYFIGse9maZSZuD0Ma
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(366004)(346002)(136003)(107886003)(66556008)(66476007)(54906003)(2906002)(316002)(4326008)(31696002)(31686004)(66946007)(26005)(86362001)(6486002)(956004)(16576012)(38100700002)(83380400001)(8936002)(2616005)(5660300002)(6916009)(8676002)(186003)(16526019)(66574015)(36756003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Q8XbxW4PS36on+LUx6VhYq9jPhcbwrN/PYVJvKLHxex2oElc/z5KRXd/v+N?=
 =?us-ascii?Q?nvqWgT0KstneQByiVyJUAza7+1dIF624lCDUXhS14ND4oJjtMQA011tEgBbx?=
 =?us-ascii?Q?RRmmtBOUSOAQ1Zc9thBVaJKTTfJNek13F5O+VPiYhCQ7YefVX7zaAgfPpq14?=
 =?us-ascii?Q?VnyM1Mmyd+av668x1SiFQDBlGMW8WE7wDBKAexG0qh2hePOxsbo7pbg0c/2c?=
 =?us-ascii?Q?PWmlrOSOCv335Jz1JCehEKY20Y4VNTKTR/jgcm2Y0bz1h6azZctMDhUvSemM?=
 =?us-ascii?Q?6FBV87T+bu+GyF9sZEwrWRdPtaNNBn9L+PAawevZUHcAXtwPIBtCbex1nxXo?=
 =?us-ascii?Q?hphb9NE4c6Y1SjZYUSWmpLWprSpDwo1k5htGb4+pFIVcgNDooXcucTxbxa03?=
 =?us-ascii?Q?TJtSeXTpnrNjjXuGSf6IUA838XBD1fUNGmCxVP0R+3HOFjIrKzm51iXZc7zx?=
 =?us-ascii?Q?AShi9QiYtyNYyPbJ/fb17L0FX5szCbMDZHX21CW+PjMRmCX/MQUMqDnfkaC8?=
 =?us-ascii?Q?yGr1RCEFmFufI8ChH1h8y6wxbWL0vUkCpkh/E+TVinsQnAaqEGQE2sE/M+v1?=
 =?us-ascii?Q?Ed1FjLFZ6ITjkxu3iQafrXbUVnhSorvWlDUpSRVL4JTddyYUIBcuZ/Mo1GYR?=
 =?us-ascii?Q?Xpp2O0SLGRisVqVP3QHpBsiCJ3XC8CvN2/4h7NkbNzx81OrKiUaLpikjZ/Zw?=
 =?us-ascii?Q?t3BdqjE08+HZuILqS+LENLlnP6OLX8yuMftYdjFpU25QR7mQOtWEWd1hGzJg?=
 =?us-ascii?Q?4arFhLD2apJ8Jxc4Eoz8hNWLmEZBi1pGsjjS3vUOApZK/UtEVjqoKVPQPriP?=
 =?us-ascii?Q?6CFmqY53oaIQbIvUqtm8s2lRY3HSekeJMr9UchcuhKMBNXFbVZ89T0fufcUF?=
 =?us-ascii?Q?513aHtMUb8+ZszONeURU8CPAZHBOznxqioJmw8+YBCLUbbXWWZXitiJu8tr4?=
 =?us-ascii?Q?Vecocw3yVW5/1Qgl77DPLq0KVShSGSSurn+x6nRmGW0J0k8UcJ6yqOESRx7A?=
 =?us-ascii?Q?pGJ7PzHmP7CU+VE+zWUC7pcbROL3R59PwhVUgYk1KCIsiiCXUCuwHxp6v6x3?=
 =?us-ascii?Q?ylBwGztSS3ocIGgA5Cz3ZX0wfv4T3pI/l3sjOqnWAZfkHjBp/utAPKHvrB9p?=
 =?us-ascii?Q?Sk+szvs891iK2DoQ6BdC6KQCEWRxEHsLMgucxAprGbOEqq0YKHO7S14clJvi?=
 =?us-ascii?Q?Ip1PwHAEaObzl83d7aV9a5QR97yNwvcCxpGaQyyeijuVMnv0dGCi1w/Tsc7y?=
 =?us-ascii?Q?w8drMHHJ7DYX/5ZFZSJ0sVoTeO7BQUxnctE0rCcD9CS7JJ2I41nIpP8SNFla?=
 =?us-ascii?Q?dBjNiwJPZZEG3Pe7Z3tI0jI7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736da1bd-c16a-4f12-fe3d-08d932435185
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:24:56.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11THcK2FNmIqLW51evaorMDbsPAXYv51a+Qkl83oXr8Vjt+Hqg5kndklP8Fk9V79HCyxBsFcv4RJX2fDkGEaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

Some sub-functions, XENMEM_maximum_gpfn in particular, can return values
requiring more than 31 bits to represent. Hence we cannot issue the
hypercall directly when the return value of ioctl() is used to propagate
this value (note that this is not the case for the BSDs, and MiniOS
already wraps all hypercalls in a multicall).

Suggested-by: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

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


