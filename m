Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30CE4C181F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277548.474095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu9j-0000M4-7M; Wed, 23 Feb 2022 16:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277548.474095; Wed, 23 Feb 2022 16:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu9j-0000IS-2n; Wed, 23 Feb 2022 16:06:19 +0000
Received: by outflank-mailman (input) for mailman id 277548;
 Wed, 23 Feb 2022 16:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu9i-0008Dl-2g
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:06:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 883359fc-94c2-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:06:17 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-isKHM8ZCMuaq6KkTn66bwg-1; Wed, 23 Feb 2022 17:06:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3803.eurprd04.prod.outlook.com (2603:10a6:8:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 23 Feb
 2022 16:06:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:06:14 +0000
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
X-Inumbo-ID: 883359fc-94c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/iLJGRiDWz9znYj5kxZFXueDDoLEYeNTD/fTL9rUek=;
	b=MjbbkCOAdbaRuyKRPfDEAhvFYWcOseXFKUFoT5CdyaiXoFAOKhEsm6IRuuL907oveLsDoS
	NvdZ7LRg2ORKjFMXT/SZOZi+lv5jOuVNdDk3wgml9X3VS+ORQD+redyt464Im/LPMul+33
	yVKUwhXOgfZlYdR+h0LIZm+PG4rdN5Y=
X-MC-Unique: isKHM8ZCMuaq6KkTn66bwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOSpUC6ycuWhrZeTCAM7GqfkxSruI5Z7cFNBmtA6couBH9+M+3ldPF4I+QD2gbMdGJP0bQEROnnWrD1a0RCyx6zqjqr+ub6dhSfSt/Xg9gAUfTBzsX0lXnBww5spe1xqy1cjBK2O5ZFhMC/JoxXnqZtefErTRUpaCK43yM2ogTRvE0Uq8j9xP5ECDeczyP0AiK0F4Yo7HXI1V4Eqm52RK5BZAXnyWg9BAR936EMWHURzBtln4rNE5NdA+yM72+i8juokuYsdrYcOPO/qXbt653hQ52gWehZJXcJ6WRbed7OiTvVWTFsXoHfNkSrZENS6HkiIMQTFS4KJL0lURtLEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/iLJGRiDWz9znYj5kxZFXueDDoLEYeNTD/fTL9rUek=;
 b=E82CXA6ZD+NvavlLzI+1qr1hsNCBVe7yucN3osD9m4l6ZaUhHMu6NNb9fZ1v4m9bfldc58juFdinlOsboZSonbimRXz3wc1yflP2Kuu30z6BIJ+oXYbytA8NRev89j4oHP2QyATJPnRqMUGA/XSECCaj5WbFOjpqbl7t+UEwVbpkdZhf8BLm+P+MgN1ZO9tLMp0FO6JbxqeCqN+Jz7HoFpBz9qNyzi+AC5kXtgAtqX9pDqMR0P/YdQrmYjyNh69dN18OeETtXP4OACZ2cFQtB1jaU2cZURPgmLBQ+OLgfLv8M/2wgS93igyCYC7r1YZ+4Oa2FJ/MqYZHttAiwZAG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3908bf69-f560-6a71-1a66-74ba1f9f3696@suse.com>
Date: Wed, 23 Feb 2022 17:06:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 13/14] x86/P2M: p2m.c is HVM-only
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
X-ClientProxiedBy: AS9PR06CA0260.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9614b131-30b4-41d0-2bb0-08d9f6e66a91
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3803:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3803DBD9EF0DB44A9F366656B33C9@DB3PR0402MB3803.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZPw6vMM43BJb4v8ZSNENfUizhR1HWNR/L/6O8FaxJpu9QZ0BlZNr2KOv/t1iZ4+o72tbQxf7WJigmifrAAw3NPqpPkkrgTMPK2aDNqBqFxNmIqP05vO1i4Pdix85GbW+DET5HAP5N/dcCp8q1GpvnePRlAIucULdBnaJgKyolKUBUKajsW3DmvCXHln+dUoZi/fP1shT+0G+RHcgJJs1rFGa1KOpOzPz3HjCFcxbbJ2baC3itagg2y0f12RyRTqFKOZ4cSYdGyrY9qx7ZkqoFL2fHvYq3gJlYZyk74Nq5I0rmDMNr7ts9sTAtz87wFGqKSIdxRgULoh5y+fup+7A0wrjTQcvkSOXJOahTeSYDVuslLNrqUGQE8ejwwcnVm+jq9hY00Fd71fBI6tedOI2nJhxb7T7CFfj3OIO8p+NLA8m/9F2HimHNMVS+2BsSqSN3baox4xxp6tJSdMoTwcGBDlGWK9DBRXQcPBn2L9bKFXPiUqHV3DIVyLwi/om7vqrU4GAiFXXUz8ZMeQ43QODO83TV2Zvim5oLnq1/pdI1IS2DyUS57I206rdXkQS3a539y16xqSiItMJSczNUomtbHVw3FOhU1hw7M7JVSaQIn/3flZPiHDV8RXoBOZFw3tdrTGR/Ann/Fgsk4Y/bKnJW8+dzBjdYC6fNOBhbHzKj3jRmrYO50BQ+Gj/YlNSgdQxDB8s3NCd7cX853ZrbUD2VtQNS8vZIcS0ocGg5ffF2sk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66476007)(8676002)(6916009)(6506007)(31686004)(86362001)(8936002)(31696002)(6486002)(316002)(66556008)(508600001)(66946007)(26005)(5660300002)(36756003)(83380400001)(4326008)(38100700002)(186003)(2906002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3VKWHM3RkMyTzFENnVYeUFMd3hFeTVrZGovYWRoRStJeXV3OTI0SFp0eUNI?=
 =?utf-8?B?SWN1ZlRYZGg4L3I1WlJ4a0orTzF5UUZKUTEwb2MvdmdGRldCNjF2VjRZNGpx?=
 =?utf-8?B?NUZPcGdRNW9hdHZ6ckZhMExkb1VibHZRSzAwOE9mVXE0cHlMSHRJTUNnQWd4?=
 =?utf-8?B?OUQ4dmVLVndDa3B2TE5KWVRld3R2K3p1Mm0ycmxVcE0yL3hZanRoRnVWOURo?=
 =?utf-8?B?Z3ZZbG9aNUpNM0gyeEltdUtnditmTXFuTFRHSEx2RmVmWHZhTW4wY2pYUk12?=
 =?utf-8?B?NkR1ZStXT0lNbk9wSUZtMjVJdkpkdEdzTWQ4VEVpNzhwZjM2Zk14QTlWSDd0?=
 =?utf-8?B?QlVrV3ZwTlRWSlR1SExFR0R1ZHBqczVNUTcvWDQzYU1ueEd5WklUZTcwakU1?=
 =?utf-8?B?eUpFZG13QWNkaFFtTlZpUVZndG9XdXlNSTJPL1N6eWVSc3FTKzUxb01JbkJm?=
 =?utf-8?B?V3pzM2xnRTdKVjI1ekh6aHJYT0hldTAraUh3aG5ZR2l1cnlrNTZZbE9zK1B3?=
 =?utf-8?B?TUZKblBuU3B1Q1RTdWZkRm1qbExwa2o3Q2hJeS9iblpZbVVaOGMvVkpxZVhh?=
 =?utf-8?B?dnc1cWo2NTNmUTdmVURPR1R4RWFnOU9OSFpVZGhEeSt6d2lkUGpMcWUzYTA0?=
 =?utf-8?B?eWN5c2xYb1JaNkEwZDR3aTJwR3lMdWoyYmF4dTJybWJ2YW5yVkYvZDdzMFV2?=
 =?utf-8?B?Qkp4OHhpekJzNEFoU1JKbVpYNHNGd0RqNlpLMzhSbVoxOXlMMTVwUDVMMVNa?=
 =?utf-8?B?R3hHaFRhS3I2SXEzRWFZT0t4QVYrK1lGUnUrbCtGVjZHeDlyRmdrNmRYK2VV?=
 =?utf-8?B?UFV0ZXRzdnR0YXVnbEZjaXBMZGhiamIxeGJYYUdXalRtazIrRmVyMFFtYWpu?=
 =?utf-8?B?Rjc4V2xjeVV4eUxvSjNGSVFkaXRVNEtLekZlZVFDcG9nRVZoVHJxKzFzMWc0?=
 =?utf-8?B?SFkyOE1KZjAwQURiMzhyQ1g4RGZGVGd2WGRoaHN1eVFBYVRQVFBXZkhRQ3hz?=
 =?utf-8?B?VmxFUVQ3WE1XQUJCclFsSjEzazNUdDhIMWtOQ3M3QU5ZTHNoNDFUTzJBQTBv?=
 =?utf-8?B?WHNtR1o1V0VldGdFejFUUldxODVJYXVaNWdFeDZXMllVYmVGYzdqZ0R4Syt6?=
 =?utf-8?B?THBCZksvR1BUZThiTTB1SER5T0RxOTY1eFJld0s0TjVJcE81YVFNOGpVMVgw?=
 =?utf-8?B?dU1sUk0rcTV6bFZ1a0FwVUg2RVo2Z0tPbFhQL1VXd05McCtHVS9kZXc0M0xT?=
 =?utf-8?B?cjdvN2N2M1dQUEtXTEJUUDdwaFg4aFo2MjQwM2szYUU2Q1JCRmxueWJUVFFq?=
 =?utf-8?B?YXJFa29FcW9FajRQa20vUi9YaDBHOFd4NXltK0tQeTJGbEdtS2liWmR2WXF0?=
 =?utf-8?B?b3BHVnF3TXlQVU5VNWtISldIVHdBMTFZWW5pMDk1bjNQSkVGMGZBRWMrY2Q1?=
 =?utf-8?B?bVVySlQ1akJwZ2ZBSWwwd1Y5RW5rbVg4SDVBSCt6Ymp2UlovcWlzL1NEN04y?=
 =?utf-8?B?cTRzcTRzYmNiNWhpYU80RDVKRmhIRnNoSno1THVkSlRqL3BWKzJiNUxPdXFS?=
 =?utf-8?B?NGQwQWFERktyZ1ZQZlBNNnZ0MnpTMFg1UmltVzh4ODAxdkM5c2hLd09mVGpk?=
 =?utf-8?B?bXp0TXhKd0dubkNpSUJBeC83TU1lcnlURDBiNkw1aWYvUzIvZ1pPMVRmeTgx?=
 =?utf-8?B?NGxnZEx6Q21kcncwY0d5d3RwZnR4Y2tkU3E3bUN3MS90MnlGTXFoazA5S2FK?=
 =?utf-8?B?SHZZYUVFdlFLWHhuSXFDTFdYYW82NUozR2FpQy8xL3FxK0hOaFBWYWc3NnEw?=
 =?utf-8?B?QXB1bHdBUjBsTmh3K2RNU1pUK3lVU3Y2dk02WkY0TkxoQzRBZDZTQlZTdG13?=
 =?utf-8?B?NVRNcStCZGZvVjhnZzQ4eDdESWl1UW5LMll0MU1KKytMY2VvaFRqVmJQOGVB?=
 =?utf-8?B?RTBNUUlKVlZtYlpucGNMODRWZkhvK0pBZCt2Yy9BdHUvQTlmL3FlbTRiWFEv?=
 =?utf-8?B?VFZ2SUQ4WmlKNEd4RnJlN2VlcWJ1b2txNzlpT2UyV0tKRjIvZVk4ZitqaWw4?=
 =?utf-8?B?a2hhYmZaWU9mWlRKcWhXMTEvNVpabE9sdExrNHdWTEZ3dkZMTGJxRjRKZFBM?=
 =?utf-8?B?dWgrdXpGcURDL0pIaDJDUjFZUUZRV2dRVkdFbzdBRHBTeDN0TExxNjgwUU91?=
 =?utf-8?Q?aVDjN2vk4IGpXWzNDbiPkxk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9614b131-30b4-41d0-2bb0-08d9f6e66a91
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:06:14.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9GciQwZqb1/k288cPFOl36/iS+JvWvdw2kpN4NmqtfmxuLYGCZ7blQ+FOGNmxjtnumY+/WIAbeS4MhA/39tEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3803

This only requires moving p2m_percpu_rwlock elsewhere (ultimately I
think all P2M locking should go away as well when !HVM, but this looks
to require further code juggling). The two other unguarded functions are
already unneeded (by virtue of DCE) when !HVM.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-$(CONFIG_HVM) += nested.o
-obj-y += p2m.o
+obj-$(CONFIG_HVM) += p2m.o
 obj-y += p2m-basic.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -53,10 +53,6 @@ bool_t __initdata opt_hap_1gb = 1, __ini
 boolean_param("hap_1gb", opt_hap_1gb);
 boolean_param("hap_2mb", opt_hap_2mb);
 
-DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
-
-#ifdef CONFIG_HVM
-
 int p2m_init_logdirty(struct p2m_domain *p2m)
 {
     if ( p2m->logdirty_ranges )
@@ -258,8 +254,6 @@ void p2m_flush_hardware_cached_dirty(str
     }
 }
 
-#endif /* CONFIG_HVM */
-
 /*
  * Force a synchronous P2M TLB flush if a deferred flush is pending.
  *
@@ -286,8 +280,6 @@ void p2m_unlock_and_tlb_flush(struct p2m
         mm_write_unlock(&p2m->lock);
 }
 
-#ifdef CONFIG_HVM
-
 mfn_t p2m_get_gfn_type_access(struct p2m_domain *p2m, gfn_t gfn,
                               p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
                               unsigned int *page_order, bool_t locked)
@@ -2718,8 +2710,6 @@ int p2m_set_altp2m_view_visibility(struc
     return rc;
 }
 
-#endif /* CONFIG_HVM */
-
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -28,6 +28,8 @@
 #include "mm-locks.h"
 #include "p2m.h"
 
+DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
+
 /* Init the datastructures for later use by the p2m code */
 static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 {


