Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76D53B70A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341047.566223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi2t-0006WC-D1; Thu, 02 Jun 2022 10:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341047.566223; Thu, 02 Jun 2022 10:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi2t-0006Tk-A7; Thu, 02 Jun 2022 10:27:15 +0000
Received: by outflank-mailman (input) for mailman id 341047;
 Thu, 02 Jun 2022 10:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwi2r-0006HN-CH
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:27:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90af019b-e25e-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 12:27:12 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-oIC2fnhPPcW5spW_FB5hGg-2; Thu, 02 Jun 2022 12:27:11 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4377.eurprd04.prod.outlook.com (2603:10a6:5:37::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 10:27:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 10:27:08 +0000
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
X-Inumbo-ID: 90af019b-e25e-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654165632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cv9/eEIQFiQhF6WMq0SwpnIoh/ieH+NQocSL68cRVwM=;
	b=Yb6JvANjEWlhW0++iUkL1R8pUQS18ENbgoZ4Ypq5cWN+3u3vKT538r0linhI1ao+FV9BG/
	WQWpYenSAphY/J7B/tjdp8P5v2ebmwdYtF0qvE5VxyCDU3fPWLfSPyX7U3TNNskRbOsM5+
	AChv4w0w1U7n7XzntAgPkXb3q6pCdGc=
X-MC-Unique: oIC2fnhPPcW5spW_FB5hGg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB87gY55xfno4q7V9873D5mGVVn8NPC4TTkDayZsQZWuW198JNtndCAJYSbbD8T3rRmUZaBmdSUwetJDzX4s1SzyErmUpnxU7dgydd8rpTQIHEHKRSnMj29BKyx19EH152eHL2WnpCmVHEzdU0pXLpwx5gn3sjbhNz2UHXUIvQGYjnsEqAABUjNM8lFdQ0d0ALHRT5w105crZqP+oUhwAIVcAwOHZaApsIa0aCbrZXKFCfK20fXX7zZTy3Ka5UWNOWTFtrM4xEvCpLwR5hRtvlmWLRFKqoT/uVyD5AcJY/TxMlrfd5RDNoG+/rdJTWhW6qq7QLlfa+ptu1t6/Rjy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOkAYeO56s7DN3Ugv7AOWjHMw56rkbVwFSJU6mwMhW8=;
 b=crdzozB4sXO0+TAH3Yg1CWbQMaYLiVo1Z1y+/G/WObSjZFMuBAptCtnf5Hxzu/mA1hrJDtTac7bGK3JRdzjNEA2B56cl3o06GH3AgvflyjZdqNpT+sYVAP8HYmPk8l1nOfaNiOXWsv6N/H2AajLsDJqF+s169YL+HQxSyi73BLdQlkolOWG+vxB80yu4v+b8HJdyXNWpUKQBGjRGFqaSwmorRkYlhJQqjmZa3KuyuyXMg8xJ0DtFWX5hGuCKgCbs9mNeN1cP6xsthtEkr4Bdlbiw0AVYYxiz6c07Ds5TAAqESAgcch/86G2ArSatb1dl3vlhZTGpicBoxwBjQTeKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <525b2d31-4218-b4d4-3000-a3a045ae7f59@suse.com>
Date: Thu, 2 Jun 2022 12:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 2/2] x86/mwait-idle: add core C6 optimization for SPR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
In-Reply-To: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de202ba3-6516-4e0a-3153-08da448272b0
X-MS-TrafficTypeDiagnostic: DB7PR04MB4377:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB43771A6149096F1E98457D0CB3DE9@DB7PR04MB4377.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zflh8+zr6wYbBBtvW7lIgoK3jAayhSLbn1je0cjQToSG1M6+d4HjrgDPlGj/bk4cWsP9p0SEVuA65as9pdM/CjeWikqgVKFd61IWBJmVfuGUaMPS+OZykb6ERj1qIiuctJ1viPn62d6BrzCS9Vmp5F3hZJD8D1XWDqbsbBahrzX3vpOqmTiLWav5oHYqg1BB8mScy1G69AGgUE31VDPwlnmcx1f9ONY+/08tXQ4OrHOwLIaR1MHQM2hU74YLF4mhSTALEjvh+cpPWOBfzDbBhwsN3oFM/eKHsMEapY2XyRV80K2+MuR5aDpkTK23GXbp5R8NthMxQKAhrG3Y75ij52XS58D/OYNlG5N3hPQpIK/gYfNH6W4eIfCtrI8vLgHaSY53Hyp6+I2oO03D+jZzlKG+9GV00JLmHJ9WDLcNuOCp7Om/T6ko8yVQ4YkwzEODesP276QGSzfheYXv4hXy5ZXO+IpjSzeDjYl01QhPEvuTPMwaTPS/KO0xDfkGGcKi4vnXGXhtV00we+D82qdbcw2fdDISWqPpSz4Gi9fYrMskTTSWT5sc2//B0TVlPF5pGCmtUZQVrLVClkKnXXfcc3u4lkKOgahfLBs89CmxpPSipuw8bGh6X5gKzzSwMjyyeUyl2eC0ZkkuVjnv1suNo/5gCJms6MV08opP3DCCNIKyCMN4vdDg3wgLoN9DWqk7DMnWxTy4HcXrDnTpDU8P6TJUu6ghVo7vmBUl+FSCIdJzgMSAoORfckBb6Fp7E9L2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(8676002)(4326008)(66946007)(8936002)(66556008)(66476007)(31696002)(86362001)(5660300002)(6486002)(83380400001)(2906002)(54906003)(316002)(36756003)(508600001)(38100700002)(2616005)(6506007)(6512007)(26005)(186003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hzcLJbIfKJRfoosf6FOcNvpIPhFaTa4KAMUuw/be1A3j4lI8ELu7JK7+kjSZ?=
 =?us-ascii?Q?om5Vh6lDt5ez7PpLKhyPGpZBVOWXE2Y2g3NP4SAGzku6MpJFX+51trKFiObD?=
 =?us-ascii?Q?WFBa3i/p12zPSQeHKlA0wNmvK5ui3xJ54lUH9dv/isiTH/veZS3yHaXzGeEX?=
 =?us-ascii?Q?Da6fauJ437p9cdKknDJ7w95Y3KBKOf87KFfokerHomuYzBrhUz/c/mRrm/5j?=
 =?us-ascii?Q?WFcNW52HzsELaeP/gaj3kkJKBbDl9d9g5ChFX65M9dpIX2N0dtgKGDLg2lQW?=
 =?us-ascii?Q?mOzYJ9eaUYaEPq03mIk39UmqiDT95ofvDL4ekwZRvfplFBON8lLQnjy/lItY?=
 =?us-ascii?Q?8K13QaqSUnD8OHJm+gPD0skoGvjSjrZHDEHij87P2zGaneRPPNFQT6Ovmwhj?=
 =?us-ascii?Q?it1Xb4MNlhf3zXON2ZXjQ3nh2adFGLZMNbgrfsTiJN8cy3tuvqMZJToVE8PR?=
 =?us-ascii?Q?LwhkqeehrJS3VX9p8i6n2QK9vInnF47mD3lv/yy8gtBhWPB0iwJpymPwmIDh?=
 =?us-ascii?Q?IJTmVVYKnRiT/ZC2taOp3OhFkhp6bLUstyH15nS9K/r7ojLo6NLdpwh1IqtS?=
 =?us-ascii?Q?QNzxCuQa7BooLKDgVNoduS6AgW6HkS9gVtOloC1WJX0z2qkccBpKlRUCAgiO?=
 =?us-ascii?Q?pCu2mjCGwqNAbY5HmEzhjrEfIq0FjzHIvFWdHQ59Vf4hoR/oDDd3sQS9zvFx?=
 =?us-ascii?Q?OlB7cAVMOyTakEiEmYpO7ULmVcLIuOtjsJPRrxSyH+/VUpfqVw9uCHND1Nac?=
 =?us-ascii?Q?Qk9u+yrwr5UW6OtrziMF4pQMPwJrrOSHDMPnGvUiCVaeGfU29fd2dC91/9wI?=
 =?us-ascii?Q?LDERxoltAk/lBvFQ9WVkNGdkGkgq44f660kWlf1LRL2qCzVC+DcGhAIt43hA?=
 =?us-ascii?Q?LJuStwyZ8S4S2WZcfIBXuEw05/BiGW3O44tg5xHwQLsYf04hecQHB+x5aDlE?=
 =?us-ascii?Q?Zsn0CFgZH5VSoV137WPry0BBdwmnU8GjiOc65hNb3TNSQl1gOTCniXpwP00U?=
 =?us-ascii?Q?CUvqHRKJjdLQy8uTSBFtHKOmpGPv5a7zituClt4oOOLR4xoaca8qSw/O4c79?=
 =?us-ascii?Q?GxnyfC1F3DTL/ATcssn5TuWNeJCXcJ9tdNEuB7RoHh0ZZfvmh0ihqUbOlIfg?=
 =?us-ascii?Q?UCXg+EIbPUMMjpItkRIGxSPXu7G70W14MdNZEp5U1oOaHUoM/8Qp48qV6gxw?=
 =?us-ascii?Q?mRhkc4t/6zM7ner4oHUDof3Fw9lfNEqPKpOErlppbY52dSonZ1u63RdH70sp?=
 =?us-ascii?Q?7U3mmSJ/FsTF+a19K6MZ4389s1aa8c25kJnYduIU/ajTANdspBiKZKn+nPsy?=
 =?us-ascii?Q?YwAQBA/O+063a01wI8aHWQg+GPpD3To8denqKLndg+n+piKromyt0nquBaRN?=
 =?us-ascii?Q?Z1gLFG1CF2MhTyH2LD+OQ8W5mRHpDtWHgYpVTKr4pYuLtHm147BcawMQ7nIW?=
 =?us-ascii?Q?KYuqp1u5ao39ZzGrFEYf2vpNOpFOcO5Mr1Lj2ifvz85XI8J9knnrXmIsUEBE?=
 =?us-ascii?Q?kJn8dVp4DPIIWU+2TOkMaON8076WYnGfZckpbs8kjmo9N6o0DHZu4K20S3X2?=
 =?us-ascii?Q?GWCh9MNT2Qnvujlq/OXDRHvZfhFkUhBK8kzjkpDRoMOmtYz+3CetAK4JJmyb?=
 =?us-ascii?Q?BAubLuqeFERK7WrpfdxDBtgwwMf/Btk4K3iUYi+pNFG66d61zZVvV1BTnHVH?=
 =?us-ascii?Q?mV2KYncik5oZdpvuABVg67y1iT8pqagB8N1wWMc99h6+/nfG8GFfzclBZ6U5?=
 =?us-ascii?Q?o1TZnM4xmQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de202ba3-6516-4e0a-3153-08da448272b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:27:08.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgJPgBaQ8wCvSvjl55lU/HJ+oCET2mqmiC3kiQBAHiAfcVGWm0wA+sLAGWOgQtC+Spn2Sd/UmQS2ZvimNPDNzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4377

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add a Sapphire Rapids Xeon C6 optimization, similar to what we have for Sky=
 Lake
Xeon: if package C6 is disabled, adjust C6 exit latency and target residenc=
y to
match core C6 values, instead of using the default package C6 values.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3a=
9cf77b60dc

Make sure a contradictory "preferred-cstates" wouldn't cause bypassing
of the added logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v2: Sync with the Linux side fix to the noticed issue. Re-base over
    change to earlier patch.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1273,18 +1273,31 @@ static void __init skx_idle_state_table_
  */
 static void __init spr_idle_state_table_update(void)
 {
-	/* Check if user prefers C1E over C1. */
-	if (preferred_states_mask & BIT(2, U)) {
-		if (preferred_states_mask & BIT(1, U))
-			/* Both can't be enabled, stick to the defaults. */
-			return;
+	uint64_t msr;
=20
+	/* Check if user prefers C1E over C1. */
+	if (preferred_states_mask & BIT(2, U) &&
+	    !(preferred_states_mask & BIT(1, U))) {
+		/* Disable C1 and enable C1E. */
 		spr_cstates[0].flags |=3D CPUIDLE_FLAG_DISABLED;
 		spr_cstates[1].flags &=3D ~CPUIDLE_FLAG_DISABLED;
=20
 		/* Request enabling C1E using the "C1E promotion" bit. */
 		idle_cpu_spr.c1e_promotion =3D C1E_PROMOTION_ENABLE;
 	}
+
+	/*
+	 * By default, the C6 state assumes the worst-case scenario of package
+	 * C6. However, if PC6 is disabled, we update the numbers to match
+	 * core C6.
+	 */
+	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
+
+	/* Limit value 2 and above allow for PC6. */
+	if ((msr & 0x7) < 2) {
+		spr_cstates[2].exit_latency =3D 190;
+		spr_cstates[2].target_residency =3D 600;
+	}
 }
=20
 /*


