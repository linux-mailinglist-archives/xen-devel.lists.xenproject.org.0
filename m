Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8041C556
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199093.352941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZQp-0002hX-Vy; Wed, 29 Sep 2021 13:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199093.352941; Wed, 29 Sep 2021 13:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZQp-0002eq-SV; Wed, 29 Sep 2021 13:15:31 +0000
Received: by outflank-mailman (input) for mailman id 199093;
 Wed, 29 Sep 2021 13:15:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZQo-0002eb-3s
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:15:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a1860cd-3f21-4fe4-8e07-12f36a17a590;
 Wed, 29 Sep 2021 13:15:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-TzB_t_pHM_m-6GiNITrmCQ-1;
 Wed, 29 Sep 2021 15:15:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:15:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:15:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:20b:465::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 29 Sep 2021 13:15:25 +0000
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
X-Inumbo-ID: 2a1860cd-3f21-4fe4-8e07-12f36a17a590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLGJUBAqG8d0gm/NqmHESrd2ZgrMqEgXRIhq0Lc+mj8=;
	b=FDK/RSjbJRAJhbIuXuSllpUsmXOJUmPXP534atJyfu43EKE07FaUsAZIrndp70mrBJAXIZ
	CmTBsfHtZ4zCSN0s6W1Gp1mkmNnwuT2gmMYoGYumZl7u4AjByYRESc1csI4KyGzRmq4Jjg
	opEqQIS20cAJYkXUcEni76UM0qgd9ow=
X-MC-Unique: TzB_t_pHM_m-6GiNITrmCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyPyY0X3CdbrApH4GlNlmy7go66YHNLd1U/FZwWghNZe8U+E5pHT85SoMBQwQwyKOkCyn4V0ErC1KmB++r6Chehn3GDorgYnT+gzfc3EGTqYpGiOqfTurwWXAF9qr0+hSh2Ed49iBGfQZ9uRWjebj7lg9Jw1yjW5kuBTirY1Xjy6H8G2N4alnIodBsNXcu2v9e7UNUag32KPnArIgfDsXivQVOx/dBm0BY4AXorhaoHKFLDjZkNlpVmTY18+S4G7+ku8Cx/vyruvjt8j+5HSfzjBHXgUHYknZfMXOiqJWGexggQD6vv9p8IrDV8/Xpp9TxAa1YYz/nrGgrAGGhb65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/SsiSshy4JYyNEDKdw1hBdETYO6OhRZqVzfvWAITRUY=;
 b=Lhkk3xVRweitjsrTY7AFdUvT0e1wTNFpMEbBlr9Qs6v+O91JhfpWFFYN9gK5p4OdbEcjbzmKadK+T15GtVyIbcSfIPyWqe7LruY17HvXj7J2mzsnuICoqiCSfzX5/VPFUaj40Al6v7HaYwOcCRKmlTrOK9hx2ReDgvssQBSR98UVzxHBTt4m7PjPZjFy7KRGFm+3PQmJf7ruFT/knuso6c+6I+DXZOrUg14fSnKKCrNJ6sqH1wwcefs+Xje2LL3Uk84F8Dyxm4GmH7oQHFxDRKf2Zu2E98q85e7QEbCHowuA8SoNv9H0HAHP4FaqbfWkrMLOljBEheKgykYsspT5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v4 5/6] x86/HVM: skip offline vCPU-s when dumping VMCBs/VMCSes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Message-ID: <4df38415-4154-e696-aca5-fa9498d1c318@suse.com>
Date: Wed, 29 Sep 2021 15:15:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af689673-9a1d-4cc4-3b4b-08d9834b3356
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150D9C687F5FF2A4B2B015BB3A99@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cc28zFlhsXgLqQ0kwEthlvWtdnBbsNFE+ZFlpy8t0jvpWxt+vOTnaSRkpSIKO9kreyCijupeM9Bda+bdibXZ/3RbhyXfAN+LXh6S2JJy05Wp9AvHeQUiq63PWyY/l4nctMnbWPxnaTAFVz9Dzk3HsbW9pDdvhP5c2NbmXcV2UXXnHzKhAEForL6/sMa1Zp9kycvH/JtJrT1ox5kZuFmL6NQ8ErR5tCZ0eMFAeRbNUZ2DV8Oj2VFUalopZ7f2F0hBQAUxmhI6B3QRWhv2Us2uGE4m5SHZPMHclneKvDkXFZH/spJgcKn2C1x9ENi8rdE2FCjDh76hpF2BS2qB2pKLLJAMVLzfe3F51tsv1MhFjpknoL+6psGSaHqmem0XP2vGswhBXshvyNXrnW4bWD82/zbxZl+qCM0WqkiwIY1T4S4mtpfKuzCfMEDq3Es9CTmRuTS9BxOMU587fUsqVeiKTH/HgXA6o0aF3XVlWKIrRRH4kog8k1uygN0OmeIVAUsK6uK6x3YlfyfShrmJvWPzjrbGIxUYJod8unLqeimNkr2oggXQntAYM6IZqNZDo3p+uyrM1D7mNAl7j8c2UCzAcFneG9Ii/Dpak0vhZ3fHzhGfo+bf5I1yvL+r/KVInbirDADyxL7fJnVFebxqgVQLrOU9RpJsSJI5uWRYXSlfsqafalBYJJ4HmjhXNdDLxYfjR6tEPFPjZl0vbjh6CMGPKJTgKta2vnMwaRy2TeX5zoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66556008)(186003)(2906002)(16576012)(316002)(5660300002)(26005)(66946007)(8936002)(31686004)(8676002)(54906003)(66476007)(6486002)(86362001)(508600001)(36756003)(6916009)(956004)(4326008)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YA7aZMWKlUbXXCt2rRTnxx83JNH0m5vRdTrTvhQrchcaMQb9vrHKGP6cccTV?=
 =?us-ascii?Q?gLko0+LhaAhr6iJHsd4H+PlzUx893594MzBlKzqZcCTPRI+4M9qTynWiGA8q?=
 =?us-ascii?Q?opgn3aHFkD7pVlvRJZ5Dg/eMe1g6bFcnBv1lqbU6tTPB9hzkGXB3xpRUrNYY?=
 =?us-ascii?Q?sCOj5kAV/d9SarNAiJzqQMzXHMGA0VJg7HmDikEdEsm+7bSeOhrftb+heygG?=
 =?us-ascii?Q?9lnLiA265gDiFa0ZmUr2fCxi5QeHRUeMDrVnSjcQmLqr1Ju2flQnsFq5rfgP?=
 =?us-ascii?Q?3WFh0iwZfEskoPM+CV1tP/WibDK0rzDCYfeCJj+cJAH2UxvCTP9/T38MWF6r?=
 =?us-ascii?Q?FZNDRAicTzMrXxa5KYlClsKmLShrZW7XPAr+JV3h8aj3yeZDu7t4P/9jo22n?=
 =?us-ascii?Q?7yd9q4POW7XFPVqQnP/rSlQFTvmY4MFCXCPP7OnGJKU8Ih1aKqlF0r1Dih4b?=
 =?us-ascii?Q?DJ6pEWousoibz6Q+dhY14YvdcUV4t8XQjGAHBmhAesIKR6Gjzze0j/dQCP5g?=
 =?us-ascii?Q?RGh2rmej+P5Rq9OiORZ4gHJ6ajstYq4YbRyY+6V80zIdyKa957z4uQ4NmKB1?=
 =?us-ascii?Q?FE3GYtjryj1F4ipObklOJ+Nh8H2F1PElbZNgQ5cTZSI7+nYpMdUnKVYPqfO2?=
 =?us-ascii?Q?E2zcvlQ/DZvRp4LEjurXODgx4MTMMPUrYOhQ7LNG9mxTUhjVVPyjfy6YP0Fd?=
 =?us-ascii?Q?GAtY7eIPeudmi8YX09VQvU039H6XpJDU+5BCTSZfof3BWAZL9XBPLUQ4GvYR?=
 =?us-ascii?Q?WIOK6SKtlq9ZxcbbRbi9VAtbfTWkkBLHp6L5XnQZF+/5Vgps2BEamQdMg0cR?=
 =?us-ascii?Q?g1ewePpXuU0bLNGSqr/iEDvfEJRton6knK7mwsHohdtLUy8s56NF2Q7osgqS?=
 =?us-ascii?Q?jnbidlRLOSvHbKlHA6X+297H2Y+0iPhm9xYFTmgWogEWMnogi6MU3tQlemEc?=
 =?us-ascii?Q?rJOhGLXrX3ORIwkRGWNfUGWNikYXhIP7icdJ5rsmsFvc0RyOjnjb3togSS4w?=
 =?us-ascii?Q?iKCL6ZTZOMwyqjy6nm1RZKMXhK9R+KczrShIaRlxqSnoVELrvJA33ckGuCxE?=
 =?us-ascii?Q?/a3G9rhzwXZ12kMA/nNna0M2r+aNv5zJ3bkFp+wV7Q8aGugCNDMeGVKLgJle?=
 =?us-ascii?Q?GchdShc+rqVU7087YvTp/PYJ6X9xIGXThML3ULZ4CR49R3CBt4ftXXIN1Py9?=
 =?us-ascii?Q?+jqkjhiyXlndZzstZxf858Y4PWGtNslCLaCdZRhN4MwL3b6GB+mS90iWBrj8?=
 =?us-ascii?Q?hxXCEwHAr3YKvh8sez/VbThEEppML3LsVThBmXe5tp3kX0PFYDT/pu47sEkf?=
 =?us-ascii?Q?nZs7J2kI5Ze2wm+6J8rUi9OY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af689673-9a1d-4cc4-3b4b-08d9834b3356
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:15:25.7280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwfY+YHvq24ey5gN3wokohBnbVGPQG1mVzl+v5YMfmCLCOHipZZ07vuN7qR82XMMxxEhi+F34ZTv7goRtOi+Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

There's not really any register state associated with vCPU-s that
haven't been initialized yet, so avoid spamming the log with largely
useless information while still leaving an indication of the fact.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v4: Key off of v->is_initialised.
v2: New.

--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -242,6 +242,11 @@ static void vmcb_dump(unsigned char ch)
         printk("\n>>> Domain %d <<<\n", d->domain_id);
         for_each_vcpu ( d, v )
         {
+            if ( !v->is_initialised )
+            {
+                printk("\tVCPU %u: not initialized\n", v->vcpu_id);
+                continue;
+            }
             printk("\tVCPU %d\n", v->vcpu_id);
             svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
         }
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2133,6 +2133,11 @@ static void vmcs_dump(unsigned char ch)
         printk("\n>>> Domain %d <<<\n", d->domain_id);
         for_each_vcpu ( d, v )
         {
+            if ( !v->is_initialised )
+            {
+                printk("\tVCPU %u: not initialized\n", v->vcpu_id);
+                continue;
+            }
             printk("\tVCPU %d\n", v->vcpu_id);
             vmcs_dump_vcpu(v);
         }


