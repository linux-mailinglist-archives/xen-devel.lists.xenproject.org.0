Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E8483F4D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253097.434133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gKD-0001wR-Dz; Tue, 04 Jan 2022 09:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253097.434133; Tue, 04 Jan 2022 09:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gKD-0001uV-AP; Tue, 04 Jan 2022 09:41:49 +0000
Received: by outflank-mailman (input) for mailman id 253097;
 Tue, 04 Jan 2022 09:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gKC-0001SI-57
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:41:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88dbecb3-6d42-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 10:41:47 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-_8vXeKlTNFOA1ysRh5MaKw-1; Tue, 04 Jan 2022 10:41:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 4 Jan
 2022 09:41:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:41:45 +0000
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
X-Inumbo-ID: 88dbecb3-6d42-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aeDXmUgr7Jm5ejsZq/eCve7xIAm3hniBKsi3UcJSYpA=;
	b=PeOqVZaPWmZlHylDn+mlLmqr/U+iKJxNnCktl1M0khP44xPUM9DEVPvQvgo9aadwJmsNZc
	oxCkbO9U2JeZERttguBt4MVEFp1PE9GXcBgMa+u8SdMyacjhPzAduSEE0xYF5b0qN73Lic
	IeS/RfGdHqNKgJpCYCN8GT9QjMK3ppw=
X-MC-Unique: _8vXeKlTNFOA1ysRh5MaKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSpDjzDLCjEf94FDKhPgW7btVfwOp9yYGf3yvNu/GvjtSC4C/9CF4ZKMexPUnWBqwsrrBmjG+rWY1qgp/K62i4bmIL5BeKyzGe10WWUxLZwrmDvFN01wYB+In3dhUISoBaTJclssXGRHlqNzjJz7Px18LukWLQhv50Uld/V7Q/lAlQZFBKogVxt8N9AafZdBHvE2eE97ilySOmZx0gQgSxT4iLEfNDjPkrscl/kMao4pilGpISejL0YHrJAfh3nFCq2B5z6pmAg1tDGfEI8wWS3cPvGaaqwy6X9mwz36gKEJTdw/3xHoyZKqOuzkve894CGBdxURJbmSABqDzOXGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeDXmUgr7Jm5ejsZq/eCve7xIAm3hniBKsi3UcJSYpA=;
 b=aX57rMtB6Q7tD9IZ+y1OcLzjroveQlY6gdAzcWgl05HAK72CM742ZzKGWGUeflfnXSFEDC0N3DoIlLxaSvLxLirYAnVSt0qJrHHUoVXgNsKAq2aafmgy3oomwtwgQAqRpcue/jFQ4Is5/edj/pfBS1JbuyqX8FGxEqHSroE28Poep3WSGoBDshtPaNmu2W34QARsK0B3JV/4TnTarh0ckAxk+lFC1L2KoKnbq1VkVixRbXGWpaA5P/SfgoWs+VdR5WhkD6NAn7CN4EnSOHGbS2XFh8TvS30gLmqN4nCOWLiDtPI+JQtLeM3gK7fCRnmnrVRwyuvc8noQNcWtHxlQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
Date: Tue, 4 Jan 2022 10:41:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
In-Reply-To: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 389d091f-2e5f-45d2-a2da-08d9cf666bf0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390554B171D43192F63E5CEB34A9@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nnvN0VuRCwtsIzMQdPJJXsdLfkJcQmWxsspB/VTu4n+rhQf5uTiSA0wh6lDAiWKvwGZGMT6jBBixGTJRlYuvuuSa5Gb10UAU0JQvgx4g1f492LvtApDnYZ9e59uAMlw59/WUzd9nLPNHvWgbPCIJmnzO3u6pBQEP0UufmZAOzan2igzpVPpNp4lYHYCDkBj1FNCOWfRm7L47macf8mwg2ojHOI4AB+qoj0SIea0vdMZ0Jjr6RQ+3mcTOUZSvNi7Q0/AXsVo7gpKMk8lwbFXYdNH2p7fUiFVBD9+DRJ6UTgKx6/MG/uR4F34uW7Z3N/gN3nM2o8kRJWhEhgguoBZEZAg55Q8TCB304NJUvILjDJ8UQsgqrK32btSLtbW7ffMuelokzSAYIVJjklaBoSMn7aN2QZBAOS3VtC2dLSgwjS+Y2HqRlWLQzvLKAXhnlcKt71yEX4WCCfPomsy+32yGjb0yhS8PbipgysHm/ansVYxuD8KRUR/Tfz8esmNGGN3VdgzsrVWUGBPVQkYDxr0FLmWbVMuiwyWhENXf4W+/kjawfIRio1CT5R66E+ob1uj9RTF1K61JAa4a8kXtI4Uo5sAUsGTs9C6ntSTTr1t5f1xl6r8mR0Stx8sS+xXHEW4+qxjOKwmtAA7lQAjHTbkMdicrNXjdCdx7mVeYOkYRNwE+30o3whb17C35X99HANK/IlrLbiNDthRNzGJ8JwPlhZSIL6jcxJFvD1wsqORFt+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(6666004)(31696002)(86362001)(66556008)(54906003)(38100700002)(8676002)(31686004)(26005)(6486002)(6916009)(66946007)(6512007)(4326008)(2906002)(316002)(508600001)(66476007)(6506007)(5660300002)(8936002)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTdHdU9WT2hyS0lydUVOdHJQYTQ4R09Wd3ZkUHFnWnVNZVJnSVl4MklBSEtF?=
 =?utf-8?B?d1h4SkdVZmJ5Qm9BMTBtVW84cDI1ME9La0dKZzJaeVpFd2NzNFRLaEM5UXgw?=
 =?utf-8?B?YXl6dGc2WEsvZGFDVUhNRmZKbjlEVDMwUVdMM1FYZWRZUzBMdHlsK3hRdnVU?=
 =?utf-8?B?MXhqUnJGbGIvZ3h3ZDQxY0JESjBQYk11WFdoNTQxU3c1cDNvUE9Zb3R1QWhq?=
 =?utf-8?B?TVh1MHU0cE4vMForR2VuNkRiMjlUb2FKaXlHTVVoc2l4eDlDaktjUzk0VG9j?=
 =?utf-8?B?ejg2azE3MTliSUhjZU9GZTQwQ1pZODJRdm5mMThxbXFkRXVaQmY1ZjRZeGVV?=
 =?utf-8?B?cnFZbGVPV01oQkJsZGUwSVEyT3YwNlJkR2c1bU9YaCs0V1JLUFk2c01xNVFK?=
 =?utf-8?B?RHgxdWJuZjBaTWVXa0RhNTRLYWVLVXd0UDJuc0xNdWcwQ3ozUWZMWTJkeGRM?=
 =?utf-8?B?Z3UrdXdkalRJYTlyNGQ3WEUwRUpZdHAwUjkxbEZVd0tkeEVxR2xEZVhhSWE3?=
 =?utf-8?B?YmJFVWNYUzQ1LytEMWxUZ3RBZjRJckl5WWtvbXJlZUpXWVN5L1lNaktFVFoz?=
 =?utf-8?B?U0VEdkZrSDdRU2pWTUFzMVlPZ1dzU3g4OCtHcmpJemJkdkRlc3NRN2RYazZy?=
 =?utf-8?B?ZTFqMlk5cjNUbVlYRDhhZlpITVQ2Z09uNnZ5b2xLVXo3UENiemFqSzBieDhP?=
 =?utf-8?B?U2NCWWpNMUcwdzJ2bTE3U1pMT09YUU9MaUxvQ3BLbDhoNjJJRnFqMjBCUnNO?=
 =?utf-8?B?OEI5dDdPbXUwbEh4ZHpEa3E5clZlakZRTFlrcTdheWoxeXFWajhNVjNrWXdP?=
 =?utf-8?B?djR1UUQrQ3lvYWZaVXpuTThhaWJMYjlJdmNnTEVDU0N3Q0VheGkyUERRa3g1?=
 =?utf-8?B?dWdOL2NLaWwvL2RqZ08xTFArMUZJVnZKRitSeTRFbkdmMC8yRXRsVGpVTWlJ?=
 =?utf-8?B?bmRVSHdhMEQweGJDTnIrM0dQMWt1M1ROR3pIRGtlcEd2ZHFabmJwNnc2UURO?=
 =?utf-8?B?Q3FRMGJNTXZ5YU8xeHVDKzRGdnNiTzJKQkh5YnpHU1UyUy8wTWdTd05WdWRm?=
 =?utf-8?B?S241Z3lJaElGT3Jubll0USt1TUVVWmZoczRaVWUvVGMwNmtwNnZkVVAweEFw?=
 =?utf-8?B?SlN1UGYxbXlTUjJEdm9HRFVFYjhadzM1TWhuajVMZXhPM0xtMy92ZlRJMXhO?=
 =?utf-8?B?cExyNUVJbDJlVGMvcDU3L0FURGtmNnZpSzlGbVN0dzdEVkRHWXc4ZFlmQTZs?=
 =?utf-8?B?dExFOW9KRC9CWWJjcXRDelJpakZhQUpvNkxKZU45YlZwbzRTUGV4MCtyYllo?=
 =?utf-8?B?MmFoclhGMFZBQXhyRjBkWkRRbXdyaXRBZ2NVd3Z4S0MwWGdoclhuVXBETFBr?=
 =?utf-8?B?NlBUQjh2VS9saTY5aGhTNUowaFhIeGFQb2FNVVJxd0t5Q0hIYWU2cU1iK0Zo?=
 =?utf-8?B?RDNBSnlEeVJ2RGFBbld4bGZMaVU4ZXYzVHdKRnBPczJDTnVUSTkxdWkvR0No?=
 =?utf-8?B?dXlLWndnMlhSUVFTQnp4cThJcVNrcEQxdDJiVUp4eGtXVkxQcUQ2NTdtNnRI?=
 =?utf-8?B?bjk3Q2ZRMWlhbStOR2NZcW11YTMwZGhDVEJkSXE2M0lScVAxM1ROZThYekln?=
 =?utf-8?B?bnJHTlk5RlVOY0tzNkd5VEdRdWQ1Y1RTa21WdTVHWnZNWGFESGs5Z2lTd005?=
 =?utf-8?B?dXc5cDZmK3NjTDFjdEEvMHU3Kzh2ME1oYUhtREcrdVorcHV1QVlXTjFLN0Rs?=
 =?utf-8?B?aVdGODBOOVU2L21TRzRjM202M2liOWk3b2N2aWFGTFg2d3BnZFdHN0lrZTBY?=
 =?utf-8?B?TDB5NWtwb0M3ZmQvT0dRdUZ4WlVGUkpWek5zSE5nNDI2V2FKckZ1QXFTZ1dw?=
 =?utf-8?B?eEE5RmRROWFCR3RuSzA1cWtVTWloSThDbDNDWXlhdzVtUFcwZVUydWRhRHBC?=
 =?utf-8?B?cmJlM0t5eTZCV1k5eWpRc2lYaERpeko4ZHdRZ3o3QzladWpmYmRMaUVLT25V?=
 =?utf-8?B?WTZLNVFpWkZrOHJKMjhiSkJtdGJheUlzWWJBanVHanptY05qRjVYZWhzNGpL?=
 =?utf-8?B?VWpEUlhoTktqNlNMOTlOMTlWNEpGNER6RjZQV2dtbFZBNWFLSEZDdTBqWkty?=
 =?utf-8?B?Z0JZdG8ybWcyTDF0b1B6ZmI1c04vaDJad1MzUlgvT09Jd010UUFPb3NyWEZO?=
 =?utf-8?Q?bjpdtO7w3vX2eFemIUNk6AY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389d091f-2e5f-45d2-a2da-08d9cf666bf0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:41:45.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiUoZNLA9etRgBCM0NAuIpVJldOQuu3uMZU3Mfzyy/y5Xms+h8V0YTOrfF4nV94BOI0ufk6GSsSuQweaiuxR/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

Do away with the "pod_target_out_unlock" label. In particular by folding
if()-s, the logic can be expressed with less code (and no goto-s) this
way.

Limit scope of "p2m", constifying it at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over new earlier patch.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4789,23 +4789,17 @@ long arch_memory_op(unsigned long cmd, X
         if ( !is_hvm_domain(d) )
             rc = -EINVAL;
         else if ( cmd == XENMEM_set_pod_target )
-            rc = xsm_set_pod_target(XSM_PRIV, d);
-        else
-            rc = xsm_get_pod_target(XSM_PRIV, d);
-
-        if ( rc != 0 )
-            goto pod_target_out_unlock;
-
-        if ( cmd == XENMEM_set_pod_target )
         {
-            if ( target.target_pages > d->max_pages )
-            {
+            rc = xsm_set_pod_target(XSM_PRIV, d);
+            if ( rc )
+                ASSERT(rc < 0);
+            else if ( target.target_pages > d->max_pages )
                 rc = -EINVAL;
-                goto pod_target_out_unlock;
-            }
-
-            rc = p2m_pod_set_mem_target(d, target.target_pages);
+            else
+                rc = p2m_pod_set_mem_target(d, target.target_pages);
         }
+        else
+            rc = xsm_get_pod_target(XSM_PRIV, d);
 
         if ( rc == -ERESTART )
         {
@@ -4817,13 +4811,9 @@ long arch_memory_op(unsigned long cmd, X
             p2m_pod_get_mem_target(d, &target);
 
             if ( __copy_to_guest(arg, &target, 1) )
-            {
-                rc= -EFAULT;
-                goto pod_target_out_unlock;
-            }
+                rc = -EFAULT;
         }
 
-    pod_target_out_unlock:
         rcu_unlock_domain(d);
         return rc;
     }


