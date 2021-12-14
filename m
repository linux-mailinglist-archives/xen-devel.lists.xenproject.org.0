Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0603473E2A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 09:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246424.424965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx33x-00031Y-Vp; Tue, 14 Dec 2021 08:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246424.424965; Tue, 14 Dec 2021 08:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx33x-0002zP-Sb; Tue, 14 Dec 2021 08:21:29 +0000
Received: by outflank-mailman (input) for mailman id 246424;
 Tue, 14 Dec 2021 08:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx33w-0002zJ-G0
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 08:21:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f644c2-5cb6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 09:21:27 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-iMTbWgI3OWy0jZRzN9p6kg-1; Tue, 14 Dec 2021 09:21:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 08:21:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 08:21:24 +0000
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
X-Inumbo-ID: d4f644c2-5cb6-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639470086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0t/AQ7k5EF/1vmQtiavEWRj7cd1SzdmnnGJDbmiyFCA=;
	b=AVtRDXPZjzSp6JWHDZ6si5ykOEbqa1X5S1lJyO/wjxyjIS4P2AtzWCTdbw3ijVexGrM6jl
	UVCEgPE0aqAQoH14JZC9GLbm4GuoD61b8puBTYGyJ6YiKX7D3kxZXryFDlE3tp5b3cKyJT
	zeAR5ZFL6zsXo+/evVnL//gUgIse7A4=
X-MC-Unique: iMTbWgI3OWy0jZRzN9p6kg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq8aTeYdR9F0/YWEhjyD2tEeB4DvnOQ20diVCeaArMP9GtHqg+kU5qCNyqUNbDC7/MZKJXkx6Q2nL9GC+hN0uvVkzpqc5eO9CM0WXNmy8tTku2Xq+l82IDJejMb3YhoMY6j070jA+M3q8XOyBDVrBs1qMYxXjlQe/oYSTODfUXJZ12mh6OzG9HWmhYGk+3bhDR/p1VLlMci+t7b1KddO32UgSoJsDpKmDb6qMXOXa+K201YU4mJGkbZkuymP+sSWvuAX3VRKvuXmDjO7c6qMZ8apt4arj/p26sIhuPaESYwn3RK0rBPUMP6PAGrojQ8qoeLHgUtYtj2JUt+7BSv17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t/AQ7k5EF/1vmQtiavEWRj7cd1SzdmnnGJDbmiyFCA=;
 b=hBL8l6bKmpdyUaVh2rtODVxqZg57XUWwJaH0UMWVQ5XoKBeYFf4il6pfTexN1wWv8NCf+S7CX0erng0NxGaw/MwottDI1XsyX2a8/Zgesk/Y/nmrnrDhUqhzwLETT1gDWt3wKuTizru/5FQGapnKkZ9x4nmHohkgvGV41UQBvqqoOm5CYQ9eJjvThMMLGLlhpQEoDB2Abs4eXojQuIwZPZWUy980kMaoQgxGGvWG9q+LyhfBuhNJM53lYKZSZTEJk9CB5I43Nb12ftb4dbcKLWrgINFl+Ha64LEB8ukbXWw84ogdd9qPM8sZ6tse/p8yQ66B/qKHf0dPwLecjxBDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
Date: Tue, 14 Dec 2021 09:21:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] revert "hvmloader: PA range 0xfc000000-0xffffffff should be
 UC"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0122.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 206316f0-98aa-49cc-37d8-08d9bedab75b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775D5627DE236D6AFE3F31CB3759@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSL7+JtS3rzXtQmeP2DCT2HGECqKs+u3FVxZx8qccZzlVUZLDYLiioTSfuPoQGzyqfqfPFly9KVBXdg6TzZOSNgGugLQhamcemLg73auXL4R6CRPZ4n3PRxSVS37RuNzU+eTT1pfRqANKSyQJ9UIiRFgHGJNJWINDclawtIB6aT151uhAL3QoJklCgPZoLWm+rrtTVbRnPUoVdyfc9uEIqQlDMN26esTkMruHaQG4zH1jzvGhWPQz2lq69vSPoW53r+53NSYdWDliK9aLxzwf8nDH/iXeuJSEMVUbtW9E5/NuwNQ7Y2VFdwGUv0xanKG6DoCM3Jk/ADE8kv6DJiyMQLxHG4ZdYqS+3XsL2u13c9oQYmuSng+Hi436tzYsg+ubAI6JaLnulBsOSuXwqy5gNTBsQ8nls3+dxoVGkIkVb45pLO1hougx+3xTgiyBpgFeqA7gouHAc/akxDZDYDBMI21by7dXloYT60Uw5N7bnjj4UYgwWaWNqY4IOoBr/FuWfzUdlsN7T4tG8Sv8clM1BD2AlldBVi03Un0k8Xn4xc13NSj2rzmkMrcDS7T1fkUAIV2Le1HeXT4gLjs6DZcB2Fx0Tk4km3nkKNr1Doeji9PyNk5Ar+qveJ4veN9CAzaS5wcs/KUI+pjFJJ2w9zc69vLw5CoWu9otrf78v+go/QR9KMmxbRZpGBTl6odBrQOR77YFzJz/PWJ5NyJfPQHAQO5Ykoy4/MJwnFSAHrG5rfzSlTT9Snag+e5FnTr/+Z9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(508600001)(66556008)(38100700002)(31696002)(4326008)(6512007)(66476007)(6506007)(8936002)(31686004)(26005)(86362001)(6486002)(8676002)(316002)(5660300002)(6916009)(2616005)(2906002)(186003)(36756003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZ2ZVhDK3k5MFU5dEhkN1VGTlF2UVU3b3pySFZQeHorV0tQbFlzM0hxcmVz?=
 =?utf-8?B?bHNZUUVIUVFuaytpeHN2Qmhla1UvZU05cHM4VGQ4Q1k2eXhMZzR2VW1BT2Rp?=
 =?utf-8?B?Nyt4NnlGZEJjQWIzbFJlcTdydm85NFAwUE9PakduemtDUGR2S2hJbjNiSVNI?=
 =?utf-8?B?cDZJQnJUUGVwRVFHL0x5d0JOVlNVRXl3SnpVVFJmNEthMGJrS3R2elJDTVls?=
 =?utf-8?B?V21GRlRLK1VzcnY5TDN0Tmh2Rk9GMTFEREhtSTROV1NGWEtWakFCZXVEbzFk?=
 =?utf-8?B?dVNOSm55c0l3aHBHSERQZFY2dWpqVTFMMlZVWmFUaDNha2FNOHJaQTRDNTRS?=
 =?utf-8?B?WG5tTG1qWko4V1NOWmR0c3E2VnBuVjlEM3VGRjBYM3B5OVhaOW1ZM0daOHRU?=
 =?utf-8?B?ZUlMRVBtQ3hQRG9HVURxMXZ3b1VMaU9ud1RldzNRNzR5QW1BNzlKalRLQjRQ?=
 =?utf-8?B?bmRmdEdVcDhkZ3hhaHBKTmNGdUg0ZHp1L2orOVpkN2RCSk1CdysvbEVubWIy?=
 =?utf-8?B?NGUyNDd3dGQrM0hWN1Y1TmxQZUpZalkzK0hGdEEyNnVPZHRZMTl6c2VJSU13?=
 =?utf-8?B?MTFQRFIvcXBIbmI4NFNoS1BaYlBGUkkwam8xVHQwSDFmUm5oWENLR05yUnJG?=
 =?utf-8?B?c2JNNGNTRmlHNThYNHdaNEpQOFRFaHMxME82c2NmTElJRlhCNmU4dVh3S2pD?=
 =?utf-8?B?V3EzbGM1QUhxVGJGclIvc3IxZU14T2tjbjlNSmtzdTIzRzNyRFNETCtWRDBl?=
 =?utf-8?B?Q0dKMy9vL1Q5ZHJEWHdqb050a1VDOFE3OGpUUUJLU2Z2bVRtMFpSZTQ0RlVu?=
 =?utf-8?B?NjVkYjdZZHFhSTc4cjYzdnZFUklHQmlWSXJCSGYrQ3JTUGVYTXVmVTBzRmR6?=
 =?utf-8?B?NlZQSkowSDFYcjJERDg1d3kzMmlQcHlHZ0xVSkt1VHloUUx2YzdyVms0MkZ3?=
 =?utf-8?B?QUV3NlROQjlicnU0UHdxRFBmdUhYOEdqZmp6bk9oRHIxd0xKZ1ByTXdrVy9v?=
 =?utf-8?B?c2EzdWs4M0Z4NnQ5NUFsMlZuZFNKSndvQ053VUhZcHFBdkt2bTFsZ0RkQ05R?=
 =?utf-8?B?THA2dTB6bHZtc2JZc2NDYkhjbkpobGhGSFRuUXRuRXhobmhTVVZrZm1Jc0px?=
 =?utf-8?B?SDc4Z1hWRkNReEx3ZnNkRERPb01IOWlJMDlsZzFmU0tPY2ZDb29GdjJaaCto?=
 =?utf-8?B?ODJOR0RMSWhQdlpWY2NtWTd4cTA4NFBMbXAvby9NMTlOY05La0ZwdzZtVkx0?=
 =?utf-8?B?M2FLeE9PUlhwK29tcXNmVU1WeVN0R0JDaXVEZkMvNzdiRlpDSWdDSWlTUytW?=
 =?utf-8?B?UDhKK1VnTHF3bUJVM2Z1eTJ6Z1VjdkpUSWZTdy9GVEY5M2dtWG55WVMyUUl4?=
 =?utf-8?B?dlNnZ3hHZ1pKTDBOeG1nV3JLbXppV3NIZmduY0psR0dmV1lKeXdyQ3R6YUQy?=
 =?utf-8?B?M3dJcHFEOE9zNS9RRDFOVTRiYTJBQm96ZkQ0dFZKV210V1JhODBYZnE5T1Qw?=
 =?utf-8?B?UHNGdFBXL0dBSkFCb2F4OHpYRGlZV1dFODdLZE1seldtaWIvYTEwci9saHZv?=
 =?utf-8?B?RWkweFlqdWcvYVlpd1dPRmxneVVUK3BmcFIvMThydm82ZUJrOVZWZ1FPQjlo?=
 =?utf-8?B?SjR0R09sV21yazUxTkc4VWQ3THlSTm9BTld5ZUtScDR3MUZkSXkyQ1pXZFda?=
 =?utf-8?B?K0Y5UGVDUjdNbUxNME5FMzM3WVVMckxjMFc0UjBKclFSMXdmK2cxU0VrREhz?=
 =?utf-8?B?SUUxS0p4YkZWb3UxejJtZ0Y1Ni8zZEtjd0JyMnE3KzdUaVd0dFV6NXZEVldJ?=
 =?utf-8?B?bUd2b3lGUDdqY0FSUkxYeTEwL1pKQW1TRm9aUXJ3empmak5CWGpYTEJaZjh3?=
 =?utf-8?B?eE8wcUF1b0QvYXdGNi9PTlRKTUo1WWw3cHI5bHcwT0plQlBCdkMzT0pwM3ZY?=
 =?utf-8?B?ckdpSjJ3Ymdkck40MFB1cWtXZFlKUFIxOEtQTFIyWm5EQmFtOFFycG9ySkJV?=
 =?utf-8?B?YkJuZ2JJZEk1UWsyODJYMnVFeXVzZk5NVUpZNXd1a0hLWXgzV3YvRzBKVXF2?=
 =?utf-8?B?ZE81YndkVHpJMlozbS9UY0dURnhjTnp4TUpWa3pLbXR1My9sNVd5QS9EZUxD?=
 =?utf-8?B?VjN0UEVudnVJTTJGUEJNMVlHQkVvU3JvdHg5UTdOaHJyWTU4VlVzakhWS0Vq?=
 =?utf-8?Q?8iduayal3pRgqRFL+f+SEbY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206316f0-98aa-49cc-37d8-08d9bedab75b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:21:23.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuK6QMpP07rg1AlVJJYHiOp0GfKRz6CfY9S2v+bPmT4CgJX6jxHWa7pxSSxpd8OMviaZIhG9b7+X+zHC8YrgOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

This reverts commit c22bd567ce22f6ad9bd93318ad0d7fd1c2eadb0d.

While its description is correct from an abstract or real hardware pov,
the range is special inside HVM guests. The range being UC in particular
gets in the way of OVMF, which places itself at [FFE00000,FFFFFFFF].
While this is benign to epte_get_entry_emt() as long as the IOMMU isn't
enabled for a guest, it becomes a very noticable problem otherwise: It
takes about half a minute for OVMF to decompress itself into its
designated address range.

And even beyond OVMF there's no reason to have e.g. the ACPI memory
range marked UC.

Fixes: c22bd567ce22 ("hvmloader: PA range 0xfc000000-0xffffffff should be UC")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/firmware/hvmloader/cacheattr.c
+++ b/tools/firmware/hvmloader/cacheattr.c
@@ -98,12 +98,12 @@ void cacheattr_init(void)
     {
         uint64_t base = pci_mem_start, size;
 
-        for ( i = 0; !(base >> 32) && (i < nr_var_ranges); i++ )
+        for ( i = 0; (base != pci_mem_end) && (i < nr_var_ranges); i++ )
         {
             size = PAGE_SIZE;
             while ( !(base & size) )
                 size <<= 1;
-            while ( ((base + size) < base) || ((base + size - 1) >> 32) )
+            while ( ((base + size) < base) || ((base + size) > pci_mem_end) )
                 size >>= 1;
 
             wrmsr(MSR_MTRRphysBase(i), base);


