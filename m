Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175A140DD8D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188542.337737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQsxH-0006hJ-Bd; Thu, 16 Sep 2021 15:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188542.337737; Thu, 16 Sep 2021 15:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQsxH-0006fA-8J; Thu, 16 Sep 2021 15:05:39 +0000
Received: by outflank-mailman (input) for mailman id 188542;
 Thu, 16 Sep 2021 15:05:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQsxG-0006f0-Hb
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:05:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c61f284-16ff-11ec-b60b-12813bfff9fa;
 Thu, 16 Sep 2021 15:05:37 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-sTps91zyMpWuwZIP37Keqw-2; Thu, 16 Sep 2021 17:05:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 15:05:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:05:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 15:05:31 +0000
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
X-Inumbo-ID: 8c61f284-16ff-11ec-b60b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631804736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IP9Nv0cIrdlrBoAnJCxni7bp4ywqxfkmNM9UrWGzWYA=;
	b=WLxIgR2s+41eIX9orcyQ6LxBDz+yXQpe5B8FKKQqpVSb50cZFuB+92X0ADX2xpm4xJEkKG
	8ELVnKMhVrrGcT56GqQVunY7SEBuy4re/jjYJsfpdlC1NoHx+s+O9MDP/+JjowP0wZQacL
	fCTaX0nx+usa3P20iAsrfXNTFE9pLGk=
X-MC-Unique: sTps91zyMpWuwZIP37Keqw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns8PIUH4HBPYN8nG/aNG+hoF+00HD2FvBYj04W+wLoQOLj3EPWr5pupwDtfkcdAavvCQVPOYb7jE2NX7iHDL6vbpVvhhOdHilnCQs+CtHQdckCmt345stSHVYCpjdaUhCayz2Ozkj+rRmd9PDVOdL6Iq0E9kKHNwFhuyQrKzFiiZxaJbU8FAgQ0HwydrJYlUUquEzU17i/bGehJlgN70eMEphMLsjlrsDqWFFIacDSFNZQl49m40vq+qVAT9QdBsvQSnEdd6yqqiPw3xyGopeAcj6SBFF5wi43WSb7FNcekqylm2obOJu74alV2Q6Ql24ud4mPBnoMLQkny1oZQHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IP9Nv0cIrdlrBoAnJCxni7bp4ywqxfkmNM9UrWGzWYA=;
 b=C8flN417nCodQ2W3sFYV88/LHD78fPsNqZnE264MVif5zbV744T0LWwe+KsPa0b/WwmYiCsEF6iMfUOQFkoX4V7PSgMuYdToNrUGMZft2zM6jqBd84UNJkE1dQ/0Wt4MqFCOfFj7u8E2bniTRE8xs82JhSfdn5Iclk21IEcgUmyEx75jo2gQyUcbhZKLZ/4FaANJKZZpjooKMJinH5qn+8tnIGnsWit4S9s7wz16gY2i2gKqUkpDloTGKrKBT6T3Z16M6hrT3zpS1cnYPMGcKlVOBUp6au5+b9+RLGPZl/8vq72jbJiSivN8oYuioY/GlC57CIo+V4b1/12Pjt58CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/x86: drop redundant zeroing from cpu_initialize_context()
Message-ID: <14881835-a48e-29fa-0870-e177b10fcf65@suse.com>
Date: Thu, 16 Sep 2021 17:05:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d05d157-bfbf-459e-c8bf-08d979236d7f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33912E40E85F83CA726EB613B3DC9@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	626dTTzEhrXcrterC0Mzfw5SNpDHveJqKy6BuH4I3wv9m0pqsqwQBHOkHizgtrVXqnvXy/C8iFJIPE1XCE1UG4VpFo/iEeO7w6eIkore8FXzPKrnOtom5QCyfYd6O7uLZ4KjKBUo3Ggs1rBJUZmDLwuG8smFl2QVacYXl3wErLYZkG3JgC9Nn7Uozf03BPF7yGYs7D7L5rcdQ208NMO2U5KRWyscVA6jm/lkZii5qIicSfslol+nkIJEM+DpmNsQJm75wEdhYdaqtbIPaocNThJyDGoJF+CD1uVq0spfPeURUyHZqt0/KJHygVagP/F04sXMLw+nOg61tLNZK8XnuriUfYEqhGcdNHe0PSNLv9aXdKIuwVLbQC0Zt8EQ2qoSk5A13Xjffz7NfL1JEEVcTjEc2XpexDLdjsagEo53p0+qTSvqdyP9vGbQfLDSd6FmlWYHxPaLVepYMBwIx6u/uGTU5GTSHTUH/ltxMyWwKJwAjP28uZIX6zL8pZ5H41/bTqpc7xDMm5bptzOEHeCItnowPORvCxRwPbZkGr29Badtl31Wr54uSAgYJ7V/REVp9iddGXt2fjLV4Qx1xnR6wHnFY4EH4mlXY9WLyXpsqQxR2fb91MTCIPVHd70EzTruitOhTrtO37qoAkpPe+jtDU3rZN9yHrf2sHrRuzr0L+8/15ZyUN+57u/RjYY3b/RxEBFrdUw55CPwzQwiBCoXmRmOYgCJbEIty92GxDdRzco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(4326008)(36756003)(66556008)(26005)(54906003)(2906002)(66946007)(66476007)(2616005)(31686004)(8936002)(16576012)(508600001)(38100700002)(186003)(86362001)(4744005)(110136005)(316002)(5660300002)(31696002)(8676002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE9rdGRYNGdyWG96WTlqZHVacVB4N3I1cFNIaW5KRWVIQUdtaUhRMmlPT3Qw?=
 =?utf-8?B?c3l3ZTNKRlBWTGk2SFlFMWlqeFp0L2Z6QVFVZGpEM3d3NHcrWmNIYU9qR2hv?=
 =?utf-8?B?dnE2bDVoT0hUZ0pXNzhsbmVpZkJaZFg1TmVNUmdyWk1vMXM0VWg5MFZxcVFC?=
 =?utf-8?B?akozTURtNkg5aXM2bVYyVm05clg2UHB2NFBBUXdyS1NhZ0NrNEhOZ0lXMWNM?=
 =?utf-8?B?eUt2Z1JEUEJsdkZzek5LTVo0dVRpT2dFTUdJMkZVQVcrRHNQUGc5RnFHTitJ?=
 =?utf-8?B?MnZncWNOd3NXZTY5Q0hNaTJ4b1BOYVp5M1JPc2I4THM2ZEdBQWhLWGhDNUti?=
 =?utf-8?B?Q0FBdmRLa3RINVE3SG91TGlOY09GdXJSSzdGVmVZY2dpNzdvNG02VFJmaXVq?=
 =?utf-8?B?ZXEwSlpHdGZvMGk4UXVsU2FNK0NCNUVTbXJNdExCN0RRaEt2dVR1MFBnczB4?=
 =?utf-8?B?UHVMZkpXV0hJVDZEK2NPY25ndVNoS2tLclJPL01Tc3hFS0FiaFFuYzBKKzJT?=
 =?utf-8?B?UGt0Qm9mSm5FTjJHcWhoTWNLc1ZWK1ZyT2FyV1NmUnhPc2IrRytZa3dXZDJU?=
 =?utf-8?B?SVRqdHROaDRWY0thRWp6R1FOYXk0bUp6d3pzU25GQ1VSNzVxTXpHdE14K011?=
 =?utf-8?B?VzdkOTVVM1Jqb1p0dXhWMnErVzQxUE1RWlo0TXpxaWJBK3NkUnFvdCs5aHQy?=
 =?utf-8?B?aTVUT2tXNTQ3RnUzMmM2aGRNNlc4K3p2QVppSUFyV2N2Q3F4TzZiNFV1bTNj?=
 =?utf-8?B?TkZGRDZ3UWF5dWFzOFMzdzRtaGtaN0dIKzJOemE0blZRSWtDVE5SK1NVcFJz?=
 =?utf-8?B?NUprb09iTk02c0RueGx3RzB0azF2Um9raXZWYXZJZWlSb04yNG5YZ1BRdm5t?=
 =?utf-8?B?SGMxMGY2ZFZzbHpIcXdKNUIwTjNFU0FMRW9XeUJVVU41am1Odm9uNFJCRmNT?=
 =?utf-8?B?WkdEbmJFUktRc0U5UTRXemtXcnVjSEk5VjlPVHlCaVBqaUpEK3FhWDE2NTVm?=
 =?utf-8?B?Um5lOWhrS1RqMFpST3F4Wm9JVitiSDB1WDVxZHZFR3FhaG5JeC9abWJLcksw?=
 =?utf-8?B?aWltUytrRWwrRjNxbDZmUTI0ekFTRGowaEZjZXpaYmdDU2IyekZUWTdnN21R?=
 =?utf-8?B?UHM3a0NWN3BzVzFDK3owUTBxQkNOTFIzRnZseHBHYkVUcUsrUyt4dTdzQjhx?=
 =?utf-8?B?akk0d3N3OUh5TmVJOExIWVBsZ0JiUEQ2L01EcWpLS1hFOVhobVFETW5ISHRG?=
 =?utf-8?B?a1hIT2tUQXhaeGlGL0JBSTNaRHJqM0VhSDFwZVArS3Z2d0hveXdFczJoY3Vj?=
 =?utf-8?B?Zy9Fd2IwYktKWFBSOEQwRU9VU285TXNaQ21lYjFITDd3MDRYT1ZZSlJuQitC?=
 =?utf-8?B?MU5EUDBaMkovRCs1SUlZMlNZV3oram42RW5XaEJ6aFZYSjROQjdXV1JFUHFr?=
 =?utf-8?B?VHVhOFNBWVBpaW1vY1VzQ0NhanNoUUl5bjhiYm00RTRxak9OSkpqYndyRHFY?=
 =?utf-8?B?MkNsOUE5OTIvbmVSM1VsSytwUlVzK3o1S1JyTTJUR3Z5NmlZTjROYTlwZXgw?=
 =?utf-8?B?MEdGTnJEaURQSThLY1dMZTRld3Z1S2tMc0J1UUxQUE1CTzNYeGYwQjVRMzlu?=
 =?utf-8?B?V2E3bXBVZlZnMzJuUHV3aUJMNmg1TzdqalZwSG1odHlzZCt2VmNLUkRQQTk3?=
 =?utf-8?B?TGEyOHFCL1VCSUx2OUZnME1mdHV4WlFsaEtoMHNFdmNGdklSTW15L3FNYlJD?=
 =?utf-8?Q?xagxOGHF87mcWg/M0176/MiXG7YujzI0E0zrxAu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d05d157-bfbf-459e-c8bf-08d979236d7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:05:31.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md2NeniJOpnnxW+2giAAEG2h9qgoEcLURlpj3saEUuEUFQn5fZGFYQcAYOphC7yMENC4hi/iwMBUz1PRQzjLVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

Just after having obtained the pointer from kzalloc() there's no reason
at all to set part of the area to all zero yet another time. Similarly
there's no point explicitly clearing "ldt_ents".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -290,8 +290,6 @@ cpu_initialize_context(unsigned int cpu,
 
 	gdt = get_cpu_gdt_rw(cpu);
 
-	memset(&ctxt->fpu_ctxt, 0, sizeof(ctxt->fpu_ctxt));
-
 	/*
 	 * Bring up the CPU in cpu_bringup_and_idle() with the stack
 	 * pointing just below where pt_regs would be if it were a normal
@@ -308,8 +306,6 @@ cpu_initialize_context(unsigned int cpu,
 
 	xen_copy_trap_info(ctxt->trap_ctxt);
 
-	ctxt->ldt_ents = 0;
-
 	BUG_ON((unsigned long)gdt & ~PAGE_MASK);
 
 	gdt_mfn = arbitrary_virt_to_mfn(gdt);


