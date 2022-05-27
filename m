Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8D535E6F
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 12:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337914.562622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXLU-0002AB-Ak; Fri, 27 May 2022 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337914.562622; Fri, 27 May 2022 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXLU-00026z-6K; Fri, 27 May 2022 10:37:28 +0000
Received: by outflank-mailman (input) for mailman id 337914;
 Fri, 27 May 2022 10:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXLR-00026t-Ng
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 10:37:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe9b9cac-dda8-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 12:37:24 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-Pi2FyFHRORK2MLdp7yIvMA-1; Fri, 27 May 2022 12:37:22 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7241.eurprd04.prod.outlook.com (2603:10a6:102:92::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 10:37:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 10:37:21 +0000
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
X-Inumbo-ID: fe9b9cac-dda8-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653647843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8+5igBLA9ZoMo2HNVasHs47ydOx4rNXZyhVpZWkZAM4=;
	b=KRgyD/YmmdwKQQtPhgF/EILbrL+0ruTNOll3vDT3PbwaT6WLs/rRy4S/U4omMciRZWfpfp
	8iujP5MWYE40pwVbfEI1WUfywVTs0rBEkB6Gvfzrk7lkcnL78E7FuPqQZyMNL0QDcR/4UA
	bjh+vkG9hUqEpWgAmAsxk4cjc4uQW4U=
X-MC-Unique: Pi2FyFHRORK2MLdp7yIvMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=na8FeBdEJWBJhR5bfiTxgFfGrmLoMD2fsJMFuTtPKn7S+vG9FlOfeLU6Q6QLFZfWHb9O0daiftmBYc+rBdoF5fmVHovpoJOoCRGU9KI/he4CyuXXKvbswEccgvdGvJY6EO5F2JTC4sPv/+XnBYYMJs8BB8kmintYm7CaLujlhXN/3mT/8uRHQB64uTKkqiODDqreWT3dIhAU3u6HYn0looQ/umyvDDOdjmkM8JAPevAIagD8d+nge55pneHIzKDW9Wcc7hppp6AbkiGfh37gY5unz6hl6S0bMF7Dk9U7zzoFKIOphpqdiptpVgKtCqRwInmbG6yEzrcyQ58/iRv1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+5igBLA9ZoMo2HNVasHs47ydOx4rNXZyhVpZWkZAM4=;
 b=HmjESJPIIvf+lPw7Wuy0f8BjEfPBs1f/vDKtB5sMIITheQAap8t6n1n4p9jLmN05M06RS7yXL0Sm/6nRVYbLei38Nl1TaKLIpLIwijYjsIzROyERr2ddazNQfWwNYvi7kThR04/gi0+8mSz7INgc80nAs0fn1ZHPKPBVEMVbnYVZTNf3wBV5bv3Pk+s4J0yOyNwyKTDK13m5nScTiBUBJNnY18ajkWOf/iuZ4tt6D1eCasvKN4Qn+3lXqsSYT1iTpIx+Qlnr4a1tqmnHJyMDk9ikRyYz+a4NIgE85Fry8WYZjsj21raZTk14MEe2FGabSfwIND9pO6wZ6Zs0wLOyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52090c8d-fa21-6f53-c33b-776c12338f62@suse.com>
Date: Fri, 27 May 2022 12:37:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU/x86: work around bogus gcc12 warning in hvm_gsi_eoi()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f831479-cbe5-41b1-334f-08da3fcce11b
X-MS-TrafficTypeDiagnostic: PR3PR04MB7241:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB724180E70F26CA7A46BFDCDCB3D89@PR3PR04MB7241.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oZru3mudzt5GPMd/07mUMW70CNsGAXHAHGdIP7bgHXQyoeJF7nWr7tr9tHzN4xIZ5++IOaKI6/1O+9/mf0lvd3AQkzI6K1rHqcmNHV+5ruerajZSwq9SXz4odBdaBbGr0U3Fx2IxYkTKzdzrj4dBSaHZCJWYhf3w2VYzhnh6w+V5MFp51Jbsyf4YjFlEagceSH8hvuW2OObCAamR6ekROGRLGRK26xccj1TnPZLxc4gQJ+AaLU3MK3D5qu/UEyn+1r6DP9Ysp2I6TiyvGCPe1O9Qf7mwafzrXb/eFUHhKyGYB+sSsVg6ACgoufVNxI6d8PZMj2t/lnZzls8M0QhJL3Wxb3bACZQmjGofCK+I14JhIL05EFxx2hhnTvEj//ajVe+w537WrJ8qqZPiuA3NGlgCPus1v8Itn/lucLKtVKDSKX/JyP53pTwOZoRNHVpbb9l0GEQM4Js0+bX/ji1phaFXmxIVJss3NnM8FqS8gdB3L1fBedine6HFOg87KJ+hhoZ0EtZBslQOa9P4xNh4blOpOZQUNmi23tnzC31tgnJOVlR1LpPu70XYfKYUIgxh5HXy9kYoUxemgj90CkKvAmHet3km5wpCuETos063eoDzHXH9HKkmpsdfTYpSZJ30qPXvcq6ZhkXbKS57FzYYuirbVdilpWf4M2LHQijot3A+h5YEGppRwtqmGCmZnuyPJhYTw1iUcnavsiUp1C9VffDgBXrBmXbnrEmH3t9ZZmwJpScYHpOdCrZ+lvSTXR4zilSBlmtFvO++y5Eaj+ZaUkYdcUaL/pykm6XkXyJgE9ptsnrQR6Wd1+pyOkz5/K8XAXK1gMYVO2AdG4HUapSFGnP/IqeZ62S4Ju38eAmRQsH6QiJtoRr/YkdEEvYMaPS3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(966005)(316002)(54906003)(508600001)(6916009)(36756003)(4326008)(6486002)(66476007)(66946007)(66556008)(38100700002)(8936002)(6506007)(26005)(6512007)(83380400001)(31686004)(2616005)(86362001)(31696002)(186003)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2s5dnoya0ZTaWVXKzhlZm9oMEg0anBPVFRaNXNiNEtQQlR5bXh0NnVSVHpR?=
 =?utf-8?B?SnQvRGRTdDRhSlMyR1c5MnlJRk53ZnRWSG9OdDlSTHVObXFWN2dwQ1dWdElF?=
 =?utf-8?B?RHZmcXNUQlNTSHlrOGZnRlV3SnRwV2dqRk5IMEZkMFJzaVdpdkR4eWNIb3hO?=
 =?utf-8?B?ZE5qSVQvRmFuZDBjaVl3L1lWVHBydjdiVFZTaDh4Z2R3a3Frd21QbThFR0pX?=
 =?utf-8?B?aTJZeGYzSE54MGtDU3NKWE12YWovc2hBT3dYTWJUd1NDZEJ3OXB5MVArcnhJ?=
 =?utf-8?B?VldwMmtIenY4TW43UDJwK29WUjBrd2FBc3d4Mm4vVnJ4dFlKcXhTUktHelVJ?=
 =?utf-8?B?d2hSd1EvdFVVV2dhcHVMMFVKN1ZxeGQ3UE52WU1WUm55Tjc0UFJ5ZWVzODNQ?=
 =?utf-8?B?NERsM1Ixc1BxbjdQRnRKWSs5TEd6b2x3UFZKOHVrbnpKd0JQbEY1bkw2dEpK?=
 =?utf-8?B?NmhWUnRUR2k3enhlN0xEVU9wMkpnbSt6Z1RwVnpRNnRleFU5MDdHcUYxYVJK?=
 =?utf-8?B?ZTVtVFdqUjFyYWVlUWZEd0hDS3dueHdHRGdXK1BoTDZsRjJvb09ocDJLQ0ZH?=
 =?utf-8?B?cmlOa1g3Zi9IQWUrbmlOK3NHQjZCYnhzUy9IOXlEam9CcDNzQkYyMUZnNDFI?=
 =?utf-8?B?SVRwOVVaY0xid0V2c1lxNWZiWlB0UWZCcmdnTEowSXh0TGZyV1FlcHYvMFcz?=
 =?utf-8?B?L1BTa2JnU1BxWCt4akYwRnhNcnNPaHBYZEEyM0R3WFUrTzlBYnRXMGRVR2o1?=
 =?utf-8?B?eitUL1BWZEZWM3hiR256K3pJSkNncVRIS1kxeU5vcDRRVTZYeVVkODVVUC9k?=
 =?utf-8?B?WTRQR2kxQ3JPVXhadEw4OFk0SDlsMWpuWGs0dnI2N1ZUSXphanJFcmdyZlVh?=
 =?utf-8?B?aElaVm5HaHRaTzNZMzhhdnVGakk5S0MxY253V05EZ0d1NTZzaEU5Y1hwdGM1?=
 =?utf-8?B?MW9hR05mTnQ2Smc5cldIVGNZayttektDN1pVZzQ0dkNDUVFHakx4UkhMSXpP?=
 =?utf-8?B?OWV1MXJ6TWxVZUpBU292Ymc4M1ViTmNGcmdrNFRTNFJTVkpUaE10UlBNclZn?=
 =?utf-8?B?Mk8wT0pmTHE4bWk0Y01sSmFQMVRJZXYyWWF6QXE1M1p1NWhNb2JlcnVWZm81?=
 =?utf-8?B?bEFFK1lSQnRid1BRc0xIemlhUjJ2MUJQTEQwTDMrTjJVeVYrdlhzbWdTNDdu?=
 =?utf-8?B?Y2JRakZWSkI4RWJpczJUV1VkS3BtU0R1TlNOcEZCZmlQQlM2dGNTRnlKVnkz?=
 =?utf-8?B?cEZOYW1XaElzbW1tc2NlaFhIR2M1ck5pWVpZbDRBVHVVWXdkaWJzK0V0ZGc2?=
 =?utf-8?B?bGhKci9TUkhkcHdxS1VkcHRXb2FOSzVMWTZpUUM4NSt3blRma2ljVnY3dTdQ?=
 =?utf-8?B?MzZNSjA0SjJzUmtPTWZTbE50dVBWd1NkQWNsYkdGNmxDRW05NGUwZEtJNnNV?=
 =?utf-8?B?ZGdvb1hObFJhREk5VDVNNVFFbmFNVHJBQ3NjOXpHRlJCNDdIWDREc2NacW9t?=
 =?utf-8?B?cFFoUW1udWNJSVFtNlNLVE9mWGc2VGNoZEFLTjJZZ1dsK3NlN21zYlFnRUt3?=
 =?utf-8?B?TWVEaXBJalpIelBxYjdEUnUxSmFsb00zQURoeElSNTZvT2dUWGNhcXlwbEx6?=
 =?utf-8?B?bk84V254MEwrelMvVGlySXNzWC9tNnE2NExTaFQyTVVrRmV5S3FpY29MTzk1?=
 =?utf-8?B?N0tRTlVXOEZMM09yaVFIL2s2MjBma3VIdTdyWXB1NlNEN1d1TVpoZ0d0STBr?=
 =?utf-8?B?c3VGK3ZNNXA5NVhOV3UzYllGb094ejRTVzQrbTNLY1RnYWtQdnlmTlRjNzJp?=
 =?utf-8?B?MTNwRzlOenMvZ3BiWWZYZFB2N1h1RC9CaDRVUXNhZVBRUFRUN01VUk1adGRn?=
 =?utf-8?B?STBrSUNVYWxnMUh0UkE4NVVEUFowS3hFc1hjdnIvRFVPMnJNOEJra0JWeHZl?=
 =?utf-8?B?YTluVERLVjVicmFtNnBlNkc2dXM2MnZaOXY2MHV5aDgxdWNlZkM5VTE1YTVF?=
 =?utf-8?B?QkVYS0dzZHM1alNnY29oc1UyZHFnZ3Y3c0dRQURqTEFvd3Vqc1RIV25MYm8x?=
 =?utf-8?B?ZVlXTUJQMUljREYwL3JhVE1CNG54RnZtcnVSQ28xSE1GUE9MdlZmZDIxZ3hX?=
 =?utf-8?B?ZmdQbkp0eDZod3FIREU1c2Y0cVFMRnQxc3dJcDcrcDQ4MTlNTURURlNOa1Vj?=
 =?utf-8?B?VGxFRWhIMzhnS21BTG9OVGhtWHFoZjE0Vmh1bnFvQ2VzMFNwNGEwQ29uR2JT?=
 =?utf-8?B?bSttUENOS21HTXNnd3Q0aVpKbThVT0FVSDZDc25mbXVmZzdiblFjWTQ2Q3Q0?=
 =?utf-8?B?bFQzMTBBZTRuQUFPRmtBWnJHOTA1N0wrMVhNdWhzK3dpa1dMeVBXdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f831479-cbe5-41b1-334f-08da3fcce11b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 10:37:21.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0n04QOmjtWDpeAQayXM1cuXKC/SUcA8DmnLYmhg2DNLcq++4BNoIY+HoSzuljQBv2g+A8K7rhETEhimkKmKtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7241

As per [1] the expansion of the pirq_dpci() macro causes a -Waddress
controlled warning (enabled implicitly in our builds, if not by default)
tying the middle part of the involved conditional expression to the
surrounding boolean context. Work around this by introducing a local
inline function in the affected source file.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967
---
This is intended to replace an earlier patch by Andrew [2], open-coding
and then simplifying the macro in the one problematic place.

Note that, with pirq_dpci() presently used solely in the one file being
changed here, we could in principle also remove the #define and use just
an inline(?) function in this file. But then the macro would need
reinstating as soon as a use elsewhere would become necessary.

As to the inline - I think it's warranted here, but it goes against our
general policy of using inline only in header files. Hence I'd be okay
to drop it to avoid controversy.

[2] https://lists.xen.org/archives/html/xen-devel/2021-10/msg01635.html

--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -25,6 +25,18 @@
 #include <asm/hvm/support.h>
 #include <asm/io_apic.h>
 
+/*
+ * Gcc12 takes issue with pirq_dpci() being used in boolean context (see gcc
+ * bug 102967). While we can't replace the macro definition in the header by an
+ * inline function, we can do so here.
+ */
+static inline struct hvm_pirq_dpci *_pirq_dpci(struct pirq *pirq)
+{
+    return pirq_dpci(pirq);
+}
+#undef pirq_dpci
+#define pirq_dpci(pirq) _pirq_dpci(pirq)
+
 static DEFINE_PER_CPU(struct list_head, dpci_list);
 
 /*


