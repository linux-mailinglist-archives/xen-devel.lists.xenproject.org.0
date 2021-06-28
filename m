Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AD3B5D65
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147808.272827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpoK-0004PL-Lp; Mon, 28 Jun 2021 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147808.272827; Mon, 28 Jun 2021 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpoK-0004N6-I7; Mon, 28 Jun 2021 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 147808;
 Mon, 28 Jun 2021 11:52:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpoI-0004N0-TV
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:52:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c22e417a-69b3-4ca2-a235-bda77b76f7e3;
 Mon, 28 Jun 2021 11:52:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-AUxQb9RCMoi7JTkVoUwOuA-1; Mon, 28 Jun 2021 13:52:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 11:52:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:52:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P193CA0005.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 11:52:11 +0000
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
X-Inumbo-ID: c22e417a-69b3-4ca2-a235-bda77b76f7e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624881136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JXQVnE3/S6cW3qT/GvlZw27Abkt7kt8h+dybYejTGi8=;
	b=ClH6tF60JNR0E9CPgeWTQEC+9cKSXEoQXIiNJBVgRbVSsze8GCSgab8n9A1qzRyqJU6b7E
	jSuCBGAc2zsCxO33/m5HtDb7ui3MF7loOGgSy5b48oyksUh8KkmZ2UHl6pS7GenIHZ+xCg
	rTtkOIvxtygC4lN2+E7MZaxO6m5vWNw=
X-MC-Unique: AUxQb9RCMoi7JTkVoUwOuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyJkSxNL3nUyeb6Cl7ji7JtbVR51kNQAwDFsVe/KXQmwfEmJ9ZnIzQqLO64dNG21mdDUOlDUTJduC8f65BWeI26ltTMt9I9Yun6ta5VydGp4omrcoVAPnxKlx3usvIXcTmsnFZ48rpAwNcrIppztKWH3znnmYfwMotD7cSyYj9TiE7XmemWLYIW0aBybBEmLbSJ2+9N+O78cIM83gQ6/ro9REqJUoMB9SKYzljYGUfodMa0q8LM91hBTg4gSvxxKXiopd82TTi+dCJhCRVLd0duFrbbrkPe7OyRxVWde4u7U4sd7Y5+WCp7xKSf1eMqecfxddg1s25LHE383loeynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXQVnE3/S6cW3qT/GvlZw27Abkt7kt8h+dybYejTGi8=;
 b=nH82IUdjTgaUHAWPVwhydZvbEWJLmxrD9NCSh8/e8TIjmnsPJHjEARn1Zqx1nizR3IzGeChetIEKUErLJ4eoFG5w23nRa3jlHffNh0AYk4yE/xN5TusNFalMpAoYMvmababEpM60QPITzPW2TmFT41ttSU9u813nLHuxK2ZH/1frAHUIGMDfs5G7M9GODwJs/UpxoixwbosqouWUCD1V7FZVICA3Xn+z4vhEa+7FZt7rBYV3QEKeSh+3PzKxU+w0yXg2IbtsC2+MJK2ERd9xqMkhCR27jNCt8GXqGuJ4ftVd+Rw4ThH67UCSs/oG2OFZ0vZcVMkIh4Wqx59uichh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] fully replace mfn_to_gmfn()
Message-ID: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
Date: Mon, 28 Jun 2021 13:52:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P193CA0005.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccc01185-fd9d-4300-f3cb-08d93a2b2aaf
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150ACBDF59ACD7FFE76D7E2B3039@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ljZP9IvWftxqJq/gsL6Erw04GgY33l1YoDQkRA61eI1l3IJmsP/KoYZmlIzXybde0pblzGwrXq3BMx7VZ70OJ6N8g0ik4qDZxeSq3r0LX/ZSF6zHdo8NrgjvZXd+Ln2U7gyTBkGp06ihsCsvd7C8+0lx9aj1uuq8SuQnC8aM/T7ZJWNVy+xMHg4bEVHkJXLhy2Pm6132ZhSkySIjs1ervGIus+1jS2dwTxy3phVuRCHgJvvoaeSEJP0+4SCuoTsIvQadzFEfOMiQEfkCB0i+wg73plqImaJHz1CmMQmLHZETdPF1HQNfaDLBnj6Rrtm6stp8Y7gji9uZHM4JWMFx6bigoqRgYIYXAj95AnZQOaS8iHVwOAKQSBCXqZEEgJqgFH0JoQPPXt8rzHo3SM/GqsLIE4DPYY1KHnZJd+FD59inM5YWOoRDaaUqq+H0wmKcJ/7eveTDkWp2A+Upa2tBB5tS58G/5L8ugnQBLZnpWjMTvqijinNb5NFArZeLB1HK5aAg8UWsU9v8UX4z5ycpO5xAT9yeFC2VfuB8rJocpupgO96FlvZ5FXuzvHP+5QsljVqoevBxp7Ge1DuzRvcOXK2v3hQ5yfdrNeysw782L4Aoph09TiJ3lBug78dmk6xZ0SVpA98PtVBYlLy7FGJq0ZQbJmaXsmyUI/wanRybq6aRg3b4Hd9yELp764fS45AbcRHUc2b5TSp3onC0uUDtYJYryVYcvJ4zIixH1nmatgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(39860400002)(366004)(136003)(2906002)(36756003)(26005)(16526019)(186003)(2616005)(16576012)(66946007)(86362001)(31686004)(5660300002)(316002)(8676002)(956004)(66556008)(38100700002)(478600001)(66476007)(54906003)(31696002)(6486002)(6916009)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wlo3aWxiV3pGUjJIY1ZwWUVNSU5zRmFKSEZMTXdvd2N3VXc5YUJzVzVETi9n?=
 =?utf-8?B?L25BSURRMDA0WEZkK2FnZ0NlbGxVS0FqWHdXNW1vU1dHdHU3RzhpWis2d2VE?=
 =?utf-8?B?WVpsWkFUeTE4WGllK2doZ2xlSXgwUzNPUUtPVTlWZkhoM1NuM0RQdlBTRVZZ?=
 =?utf-8?B?dXhrRUZGQkh3Z0FlRTU4UEVIcjlSZTBNRWgxZ3hqSXRiUTJWejU3ZXMxQ1hi?=
 =?utf-8?B?REN2eDdOTnpmZGVFeGhjQ0JmcmJCcDJ3VDhJN3Q3VXd2Q3RSSmFnMWdYVHNr?=
 =?utf-8?B?R0M3ZTBhZWJOelhYUmR4dHVzZm5JbGxHRENGRVRrRlNiLzQ3Mld0Y3ViQnVN?=
 =?utf-8?B?SXkrOTgyd3FPRFRJYmRmY2RxVHQzaTRib2hkYUFiOXhsenQ5R29rZTVSazI2?=
 =?utf-8?B?bVltVitCNUcwdUVuTTU4N09rU042TkxIRTZzRnRveTFwWDkrNUR3OWZ6SWlm?=
 =?utf-8?B?bCtZR2hlSWo5SjkvLytCSmtrTWlScXp4RXpITmpKb1pNbTlKNElXVUt2Kytr?=
 =?utf-8?B?RmpVSndIZStDUzAvSGErN1hNOGlDcTV4SVR5enVMdzZlTkRYaHJtU0poK3g1?=
 =?utf-8?B?Ukl1VjJKYktHaFp2QW9UbTIyUWZpWTJvYUtLdUk0SWYveFVuZ0xTNFIya0J0?=
 =?utf-8?B?WUlleGZxRm5rbTFSRUNDUEplcVBETlJkYlUySC9wb3FBcjE3T2NpcnZJd0x1?=
 =?utf-8?B?MDNPU010ajhVVWVFVVRNZmpqbUIwS05IT2dZeVRMOGpLdm1rNGpraGtSOW5E?=
 =?utf-8?B?eWFWVUVheSsweVBlaGlLTlhuTkFMbnYyMTB2dng0d2JwRjFWU0E3QS85dFo5?=
 =?utf-8?B?bktkMlUyRHBhbFFOaGR4alloNWZ6OFFWN0QzRStBY0d4V3ZOcEpMdGlSM3Vi?=
 =?utf-8?B?ZGhZWXh6dUQxaEsvVzdYVm40cUovTkhwWURTdmh6b25ycVZGRG4wUEZXN3Zj?=
 =?utf-8?B?M29xYkcwOFNxL1hpc1NvaWN4SThMVTR0dzZTYlNLMmpJNnZZM2RUaE42cnFr?=
 =?utf-8?B?TmxBTnhDSHZlY2czbGxPTklhcXFQZEFqUVBZVjhCY2lmOVpQUStrMXYyaFFY?=
 =?utf-8?B?VVZkN3FmUi9lcEFudFJ1NlNRR0FnV2lCbzU1dThUdVdMMDQ3T3FpbVJsUTRu?=
 =?utf-8?B?elNQSGQ4U3FJV2NpL3pBcXNOSUVnbk0xN24wQ3RTRzNvaHQyL0gyalVJM09w?=
 =?utf-8?B?NjJxNVlib09UbjJ1cStvaFhSVTlUQ3hxTmlWNVR3K1k0SVZqaWQ4Y3A1bjRm?=
 =?utf-8?B?MU5wR016MnJHUGtRd1ZlTEt2RytieGU1TzhqcHdFWkovUXdyVG1vcC85NWtw?=
 =?utf-8?B?VzBXYVYvbDBoRU9aNVliWk9GcG04SnJycnBSUDBTdkJVbFltWC85dU1YdWhX?=
 =?utf-8?B?NEFtejNIcGREc2ZKMU1IbDFmRkQ2Zm1QUHJEUzlqMXV1Lzl4WmJKQnBoQlZs?=
 =?utf-8?B?eVRpN0ZqaHZRZDllQndKTnZuS2JXNktyUWxoZjhHZWp6emhWZjVxazI2ZDVX?=
 =?utf-8?B?KzRaQmYvYkhva2w4UDBJN05ndWRmRzZudmFMWDlXZUFUc2twaWtCNXpQSFRL?=
 =?utf-8?B?cEZFSmNWbGhPcG5pcm5KNDEyOVZTdEVIMk9WT3hzQWNHeWtveEtnTjJpUzZV?=
 =?utf-8?B?UEZvSDZwa1JXNnlVQmlMVWp5UU9ST0hwUFFpeGNMbDNiQ0wyOUtiVGRWWkZI?=
 =?utf-8?B?cDByNUQxN05QVWcvY1k0SXZMZUZMemh3MzFkeHFEZTNhSE1hVzJjcC9ieXk4?=
 =?utf-8?Q?qcMa6r6ELFjKTfj/4fYoUSjP/XQKheEun7lIYL7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc01185-fd9d-4300-f3cb-08d93a2b2aaf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:52:12.4804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5anGUx2lckY3ynYWScYXwMU34OAjhBY/Qye1BFOKiVHzAq7Kj6xW99mFCgdVRmMV6K18manhucvvYUmagEUMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

Convert the two remaining uses as well as Arm's stub to the properly
named and type-safe mfn_to_gfn(), dropping x86's definition (where we
already have mfn_to_gfn()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -111,7 +111,8 @@ void getdomaininfo(struct domain *d, str
     info->outstanding_pages = d->outstanding_pages;
     info->shr_pages         = atomic_read(&d->shr_pages);
     info->paged_pages       = atomic_read(&d->paged_pages);
-    info->shared_info_frame = mfn_to_gmfn(d, virt_to_mfn(d->shared_info));
+    info->shared_info_frame =
+        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
     BUG_ON(SHARED_M2P(info->shared_info_frame));
 
     info->cpupool = cpupool_get_id(d);
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -714,13 +714,13 @@ static long memory_exchange(XEN_GUEST_HA
          */
         while ( (page = page_list_remove_head(&in_chunk_list)) )
         {
-            unsigned long gfn;
+            gfn_t gfn;
 
             mfn = page_to_mfn(page);
-            gfn = mfn_to_gmfn(d, mfn_x(mfn));
+            gfn = mfn_to_gfn(d, mfn);
             /* Pages were unshared above */
-            BUG_ON(SHARED_M2P(gfn));
-            if ( guest_physmap_remove_page(d, _gfn(gfn), mfn, 0) )
+            BUG_ON(SHARED_M2P(gfn_x(gfn)));
+            if ( guest_physmap_remove_page(d, gfn, mfn, 0) )
                 domain_crash(d);
             free_domheap_page(page);
         }
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -328,8 +328,7 @@ struct page_info *get_page_from_gva(stru
 
 /* Xen always owns P2M on ARM */
 #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-#define mfn_to_gmfn(_d, mfn)  (mfn)
-
+#define mfn_to_gfn(d, mfn) _gfn(mfn_x(mfn))
 
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -527,11 +527,6 @@ extern struct rangeset *mmio_ro_ranges;
 
 #define get_gpfn_from_mfn(mfn)      (machine_to_phys_mapping[(mfn)])
 
-#define mfn_to_gmfn(_d, mfn)                            \
-    ( (paging_mode_translate(_d))                       \
-      ? get_gpfn_from_mfn(mfn)                          \
-      : (mfn) )
-
 #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
 #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
 


