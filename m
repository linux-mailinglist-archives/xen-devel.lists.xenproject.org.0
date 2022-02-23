Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEC4C1817
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277531.474073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu86-0007Zw-J3; Wed, 23 Feb 2022 16:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277531.474073; Wed, 23 Feb 2022 16:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu86-0007Wq-Ex; Wed, 23 Feb 2022 16:04:38 +0000
Received: by outflank-mailman (input) for mailman id 277531;
 Wed, 23 Feb 2022 16:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu85-00064O-10
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:04:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bee537c-94c2-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:04:36 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-ST5p_GrHNC20dxGWWejDcQ-1; Wed, 23 Feb 2022 17:04:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3803.eurprd04.prod.outlook.com (2603:10a6:8:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 23 Feb
 2022 16:04:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:04:32 +0000
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
X-Inumbo-ID: 4bee537c-94c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0HTObp3YJHfE/uo6Cw54yUOSGjrcQcQ2DoP9QPbuT4=;
	b=MzfkmX9mSAA8fG2Kk7xA9vQkN+R+/1dd/a6dbeVWIocd11KNYQlfJv50+n6x2nGPB2iQaS
	BlWulrb7USHOhbe/6nuI6wFwJRTk/Cb2TEpZZJQ3IxW5Lbmw5EYJcab+UBnA//vc8vYMSz
	InFCN4BZ5+HaJSNI63ObtChHDphTA1s=
X-MC-Unique: ST5p_GrHNC20dxGWWejDcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnoGcvjpGOCw2/KNiC75fZjWsUL6EVBZdVidcg6OXrpMjR44lVZovtzTBYIKe8ghYoVnMmA3c7b1APMJlZNiFfv6LhSYwfjdVhcP61Kp++sTrHh4DG0EVQOrXX/8A3MSGl14wEknZeDrKXrEPahNOCHBLdUTRqBDYkQG+CAs5ejclkpwMn1J6Wc0DwiXBtieTxjLj1Q1cR0I2mcEx6+PD+7OiKcSexznqA0mVw0JQBZN0NQU+c3/uanwatWsqjw8OmBg1FZq3aRymjdH8naLBbgB8t1xif/BQ2OXXOCqvvWb5tAoxFTXDaQqNslXcu6s+kCRr/cPuCnFinGKmRplPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0HTObp3YJHfE/uo6Cw54yUOSGjrcQcQ2DoP9QPbuT4=;
 b=WrDHh2h4pIv+lDQzuL9521foq7aOShXKvDvQQ7k0Lke7Fb5dLEQEoUJvjc0ymn6z7riHpgeQrvabgZ0YbeocnDEuJLG5rday55b6oyAR+TvUQV9rlsMr2o8myEIPzRX2znj8jdh69mOnuozb0fdNTWxKiJvMdfWu48HRus+3AgsycY7SttjmBs5yQIqkVyeDRgDYYoN1BQGbxcZZzl3YtgiF3hwBbyOiz0uJXinUFi9TVHa1IvrDtH3gdkhunC5sSuAkEQpwJdpbwD1C/mJE4eiOBsn1AATIEvmHFuogM77Fmq4EwRgAeH3Iv7cwWGc61HT0HP+jcDmRtJoIYrRY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f103baf9-ee1b-e440-8fa9-f5009a56442c@suse.com>
Date: Wed, 23 Feb 2022 17:04:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 11/14] shr_pages field is MEM_SHARING-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e192341-4fe7-4004-4c74-08d9f6e62dec
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3803:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3803A973FA708019ADFBBC3BB33C9@DB3PR0402MB3803.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s6lpIxStBEmhwTnParHSK0fvUq/209veCbXgl6W7GoQzqCfpW7AHe/VqjoW++6twYKwiGnlO/8OThFbI1sCMj19BF+PVAMp0Cz4bpIrtxsp017m8cD4FlxJQa32yg3UWwbCy4O9/z4MsRDQjpyH06YJbHHSEN+35wRJAjur2GaoyALQTC+8OYmuUFHCkKPSGCoXtQANsMBNkrAmJYVJu43I5Aio/a1pJCUdLIn2qiwWl8EXt5rZgAbyjnoZSjivGxGSnn4FPDO5VdjNCoClG2wTLXWdAsYQMSkIQ2G1HKJtQDpwyh7X6UMGjErT/T1c7CMfJylF4K4Uycrclaux+lN2FAMhE1DQYsSODVWkN2zX0dVSFtihn7RyfD5Juj/YPvyDnQOjlZVjGseZ2fi59oiaEAwXr3Adrx2+oTZBLtQ5Uwq8Ols1mR5p0/u6/CBIMnXTS9U6LluenR6E0By9LyEz9YMvz1dbUaA4P29BRwt2Xh+PhfC97j33asvjiaKl+mtWnIOJx6iIthvfu6YXdkcoXNWS9+GCN5XoiwU1KUWXhGSuMIj3qPKXhGyz3hiv8r/eKhYwW/rcAeGarCHNjlKpUy4uKm/60yhlYkWqpeMWD4cItKaRWA/fqtTE26QVzLy1nrMIktf4xC3VyMFBB4cuzTTih8is6B7EdnuXOgXRLBxtW1GKnPEEvzXxRTOAW/90N1y8pRRC3kQwH9+/TzbFFD8nD/pMOQ7lTcB1eHF87hF1ObqhRUtmr8JdCzzMd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66476007)(8676002)(6916009)(6506007)(31686004)(86362001)(8936002)(31696002)(6486002)(316002)(66556008)(508600001)(66946007)(26005)(5660300002)(36756003)(83380400001)(4326008)(38100700002)(186003)(2906002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkR6K0M3WlRGYmZRdkVqVXB2TDZyRUNSQzNXMjRqelkwcURYZE40b242L2dS?=
 =?utf-8?B?allGc1VHdkd3MlRHWCtzMHppQW50ZlBuTVJPeUxKN01mWlpmczk1Z2hxdzVN?=
 =?utf-8?B?Vk94S2NWME16QUt4MjZhMDFqQ0tYOWcxeFpoSXlKZHN5dnJTOFVtb1J5MFda?=
 =?utf-8?B?eFBXZllIL09sT2NBVVF0THZPR2diNWJhRlB6ZENIMnhqZVBncHN2ZWR3emVR?=
 =?utf-8?B?aHFBaUt6bHNjbkVhdUdoL0N4TGtodXFFT2NhUHhpbXN6MEJ5ZmhVOXUrLzFu?=
 =?utf-8?B?c1F4QmtFakk5Yy9XYUJpN2g2UzlQQ1d5R3kwc3B0UUlIa0JhOE5JMjZGbFhO?=
 =?utf-8?B?RmhLTnUrYnM2RHJGYnFoNzltbExjd09SVzdjaGQrRDlsVWdFTURVeU01dytJ?=
 =?utf-8?B?WUY4eEtzdCswRTZrSG5tWjJ5Ry9McUM0Uk0rTXFocnVIcCs3S2FGUW5UalNi?=
 =?utf-8?B?Q0EzZWVidmFocXVHTTZ5M3hzNVpBOVFIQ2V4WDFNQUkrS1J6NWEvdldtTmhl?=
 =?utf-8?B?QzZkZUE2QUIxNFZaMEJpZXlvSWQrZ2dKNG5tMmdEMUpFNHQxUjdUbkVPZU00?=
 =?utf-8?B?aWVlWXFKZlBGL1h0VUF2b25ZNHFKLy9zMHFOVjdsZ1FGUWE3QWlIUkplL1ZZ?=
 =?utf-8?B?d0E3MXcvVWIxd25mOGNjTmtmb3RtYnplSCtlbU1UeXc5MHFhZFdudkQ0ODlp?=
 =?utf-8?B?amhNbmlVYkVmZngxY0lnMlJ0aUhOcjJ2dFZ3ZXNObE5LbGxKaDZXbUdYWnRP?=
 =?utf-8?B?TW1ROWxXS0s3UEtwMWdmZUNBSDZOclFjTlVIY0dDTVNnTUx3d1Y5MSt0WU1y?=
 =?utf-8?B?cU1JQjRaRnFyeUlYOG9VRTFFQnA0V1UxZTJPRXd4UW5TcGw0QnZVcysvZFFa?=
 =?utf-8?B?YTgyRS9zaEdENThwM1lmSHBmbEYxVVdhNkcvZzBnWnVCdENjOGpyRGd6aEdP?=
 =?utf-8?B?YTBDNkl2SzlwRFhMakVKVklPUEx0WXpNQ0JjUWUyRFhEYkZZYUtPTjdoRCtL?=
 =?utf-8?B?QmpNK0o1ZFVRcjl0VEtKa01TTThIYjlBSnJWMUFIUDBzNzJObmR4VklxOXZp?=
 =?utf-8?B?TnJMVXdVbjdRdFhnRUdURHpocWsvSnVmRTRYWXh1VzNIRFg0aUFqRXVXZUVP?=
 =?utf-8?B?QkZaTU9qZWsrMzluMitxQTJtK1dOc0JYK3NXUWFNdG5JOEswamRjcGlpaHBV?=
 =?utf-8?B?OGJXZ3MvMW5rR2NyQkJWVDhSN1QvT3JxTWhaMi9QOXdacW44MWNESjdKN3Fo?=
 =?utf-8?B?alFsYyt4YnNrQW40V2NDLzBtN1FFYkYxQmFiR3dOR1ZqbGNhK09GYVZEVGhZ?=
 =?utf-8?B?UGhScHN2TFB4eUdzOHdvN0FvK0FxQzFsNDQvWnd2TlVBSnV5TE1BOFd6VmJI?=
 =?utf-8?B?ZzlMUlZmNkcxRmRSQk5tWWtmZzI4U0NGRTBmRGg1TnVUcFlRbjUwSkpDOGNP?=
 =?utf-8?B?Q3kxYi9seFBzTmdjdlBDYlJ3cktORFFDbHFvYldLd3pCUTV3NHhGQi9BVzAx?=
 =?utf-8?B?WVl2aEMzUkpzVFhsYkgrLzNHc1JUNmxDbXZpQS9zTWFncnM3S2hKWkRFLzNk?=
 =?utf-8?B?M1Z4ZVRzT3ZVSE12eC84WFFqazR1em54Y2VFRXJudXZZdmhHRmxxSjN3TGUv?=
 =?utf-8?B?RjVJNFU2UzZ1cmNrbE5ncFBuZDY4UkxVYWJNcWo5dGNTN0htVHhOV2Vtbnp3?=
 =?utf-8?B?cklKN1pFT241M2tEVnVibU9MSThTTTZYVTJFdW84UUpBRlVDU0pFV0tlWjdN?=
 =?utf-8?B?U2c3M2JyWFhlM0xpa3pmbjc4SHB4R3p6dkUrRUlvSVZxU3N4SnNXN2p2VG5O?=
 =?utf-8?B?WnFOK01IK2tSb3ZmNXgxVnRvR0tqTmlwR3RERkx2OWtORllzTGZyL1U0QkRl?=
 =?utf-8?B?S0tqemVBYitaUEZjYWFUamthbVBqVDdxWTUzdE9KczlSbFFSWjY3NU94TU4z?=
 =?utf-8?B?V2hNRE1kSkZLZk5NVGpzV0pZYVJmeXRpZit5T2Zhc2hNVDdoU3JodlUwNVVa?=
 =?utf-8?B?bFV4MlVLZGFRYlZJL2p3bTdSbGJqakhYMlppR0pPRWxOeWc1c3VlM0MvYWdH?=
 =?utf-8?B?dTR0aFgreVhjdXk0TzA1U3lQTThOQit4VnNpdTdjcElQWXBtTkIwa2JwdWE4?=
 =?utf-8?B?aTQyeHFmSUNuR0FUZlMrYlVtWmxydVIxelZTNWMxOWhNZ2pIUTlmQUd5SDhw?=
 =?utf-8?Q?MQOpuodnSObfiXDRXIcGwyg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e192341-4fe7-4004-4c74-08d9f6e62dec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:04:32.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFyDBtjzEiPkhQH2+gxfHn/6ZS3qcSPMmWf/RP3QWkaND0RL/lodLlhzTxqsOG/uMfOC2bNjJ5JHhfrzYszpqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3803

Conditionalize it and its uses accordingly. The main goal though is to
demonstrate that x86's p2m_teardown() is now empty when !HVM, which in
particular means the last remaining use of p2m_lock() in this cases goes
away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
I was on the edge of introducing a helper for atomic_read(&d->shr_pages)
but decided against because of dump_domains() not being able to use it
sensibly (I really want to omit the output field altogether there when
!MEM_SHARING).

--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -159,7 +159,6 @@ void p2m_teardown(struct p2m_domain *p2m
 {
 #ifdef CONFIG_HVM
     struct page_info *pg;
-#endif
     struct domain *d;
 
     if ( !p2m )
@@ -169,16 +168,17 @@ void p2m_teardown(struct p2m_domain *p2m
 
     p2m_lock(p2m);
 
+#ifdef CONFIG_MEM_SHARING
     ASSERT(atomic_read(&d->shr_pages) == 0);
+#endif
 
-#ifdef CONFIG_HVM
     p2m->phys_table = pagetable_null();
 
     while ( (pg = page_list_remove_head(&p2m->pages)) )
         d->arch.paging.free_page(d, pg);
-#endif
 
     p2m_unlock(p2m);
+#endif
 }
 
 void p2m_final_teardown(struct domain *d)
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -109,7 +109,9 @@ void getdomaininfo(struct domain *d, str
     info->tot_pages         = domain_tot_pages(d);
     info->max_pages         = d->max_pages;
     info->outstanding_pages = d->outstanding_pages;
+#ifdef CONFIG_MEM_SHARING
     info->shr_pages         = atomic_read(&d->shr_pages);
+#endif
     info->paged_pages       = atomic_read(&d->paged_pages);
     info->shared_info_frame =
         gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -274,9 +274,16 @@ static void dump_domains(unsigned char k
         printk("    refcnt=%d dying=%d pause_count=%d\n",
                atomic_read(&d->refcnt), d->is_dying,
                atomic_read(&d->pause_count));
-        printk("    nr_pages=%d xenheap_pages=%d shared_pages=%u paged_pages=%u "
-               "dirty_cpus={%*pbl} max_pages=%u\n",
-               domain_tot_pages(d), d->xenheap_pages, atomic_read(&d->shr_pages),
+        printk("    nr_pages=%u xenheap_pages=%u"
+#ifdef CONFIG_MEM_SHARING
+               " shared_pages=%u"
+#endif
+               " paged_pages=%u"
+               " dirty_cpus={%*pbl} max_pages=%u\n",
+               domain_tot_pages(d), d->xenheap_pages,
+#ifdef CONFIG_MEM_SHARING
+               atomic_read(&d->shr_pages),
+#endif
                atomic_read(&d->paged_pages), CPUMASK_PR(d->dirty_cpumask),
                d->max_pages);
         printk("    handle=%02x%02x%02x%02x-%02x%02x-%02x%02x-"
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -385,7 +385,11 @@ struct domain
     unsigned int     outstanding_pages; /* pages claimed but not possessed */
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
+
+#ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
+#endif
+
     atomic_t         paged_pages;       /* paged-out pages */
 
     /* Scheduling. */


