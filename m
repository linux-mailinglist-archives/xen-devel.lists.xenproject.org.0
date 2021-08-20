Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18063F293D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169370.309377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0tf-0000Ar-JM; Fri, 20 Aug 2021 09:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169370.309377; Fri, 20 Aug 2021 09:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0tf-00008F-Fm; Fri, 20 Aug 2021 09:33:07 +0000
Received: by outflank-mailman (input) for mailman id 169370;
 Fri, 20 Aug 2021 09:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH0td-00006F-ST
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:33:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd0a445b-700d-4174-a022-5082d97c8a5a;
 Fri, 20 Aug 2021 09:33:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-ZvQo84tZOg2KqyDrExXbLg-1;
 Fri, 20 Aug 2021 11:33:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 09:33:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 09:33:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.8 via Frontend Transport; Fri, 20 Aug 2021 09:33:01 +0000
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
X-Inumbo-ID: dd0a445b-700d-4174-a022-5082d97c8a5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629451984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X59e0mJqxVEuvjXukbl552wx329qsWJw13VdK4933r4=;
	b=elRCazqSvAgwidPr30e+vRvyIGliZDWHzII9oElB7Qo4te7HDFTrRmtUUiwNpMNzJQM33V
	XsbpcXlnRdlq4ptgDAjdRRhPr9g0lhfzGQ4tG8opZdLA/4XGtK/6V1WMYRrQBihiA70EAC
	65bfnzrycMft05lzgLS3a8xiiEdC5Is=
X-MC-Unique: ZvQo84tZOg2KqyDrExXbLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwMteZEuBc7WnloyNl/Ivp/4hL6fJckfGhSPTTTKHONnzck36GCCxuCtiEWB/E9/Ts6KLC0qwhnSHEpZenDahWSp2mPeCHMH2eNLlhrDsM0gXcUJkZMP8e3oZ1BcqVe+3KoE4MhDraMBTcmExWojibhccFHGEmdnpelUOxl6g2qQjws6HWSg/GkNoNBI6LlueIE7k6nEByxhdg9URylp3jv9eBaaHJ0oXgf1mvDYWmotOyaQJQ9gIfKQS5mokXhOdpUvo4ixIxMQwJO7a3NeZUhbLAoI5KN/U5wOQOycISu973Pmu7iYveTtSj3rdRKkKqKwgdXX1VRw6iHgsSbUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X59e0mJqxVEuvjXukbl552wx329qsWJw13VdK4933r4=;
 b=NKq7pqaZjOg2eESNyO0bgf5PfB+x7BMvVo5VR6sM9DmbU9BxAotAqhheYx8pvEn7gp+b3mA+EHipvQaeGxKIo5BG+GR9o4VCDYmsnDnsNFpDl8gzJAKpmLNgKGw+E2xS53hLGuz7Q7f5NjQC0KBOGXzgvzGobMxJ0yasLk3f/mEf2BDd7Srp7ttsQM3h7zyrBhATi6U9NY1KZV7407Q21wRFK9vPa8oHLbRBYtjmCxDLYZoDIwmEvDnk3VvgNhBrYtj8TXQMBgaypgXQgMf2kw7Z3H/DgzvWRKAykQKqzX8C0u23aKYagKmMF8BwTTBsi9jo23/dd42TY0FE6OuCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: account for 32-bit Dom0 in
 mark_pv_pt_pages_rdonly()'s ASSERT()s
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <486bcdc5-8b61-3ecb-6a18-6ad361e42cdf@suse.com>
Date: Fri, 20 Aug 2021 11:32:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9e858b0-2a27-451f-755e-08d963bd8122
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547283A6CBD1366004D825DCB3C19@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xz/QOTK0HTaICGzZqr6HrqkdgJjtiPq7CI3XYfJbV3RucrETw1qFoF2pHRB3x9ZWJGOVWH2X8mX73ziZFjZd5l0bE9mDLIG0KpnNwIPrWB7HO5WS+zPa6IJmp9plobS4ig7Cby1c8ppgInGa5v7OcyM0cqBJbX0VcUJD2Dli1KFt97NW4R9A9Z7uwuO571woZLrBUh6+lew+scgqbWPz5aNeHQZZEVyJUgdcbiLSUsl+hq5Bb8yvzYCtgtU4Zhw7xaxXbZE4rgHEyzCwaOlee+V7fMyxJYwf7duoYSg5aXfeUqCru6fvKofnfp/aCTjD1XeDBA/5p4xuqMIYVJ1PPIVruiAc9MpZgMAQsV+BflpiraMms8nLhgwp7wZBPl+MmeLsZmFJIu6BjoR634bdRE84UN8AQHL4MkOse299Ej3vLWJDhmBf9To0JuF5qZc16JVTpzFXI3/EZMv5m+3+g+lbz6NbLNHY7jsgwnWZvyPZhqMPnCA+dmPLk1FOeRRISxz13PS3+PPN9r0xiIIh1ksDC974zlt1OqyzINQQVhp+/UG39+W2jWn2EY3mihOBEt9vHuuAGHGrhvJ51Ge9wfqo61FsbjRHIOllCgVZGxw0sXyDBF4LUXoDo0DlTVSbCcyqxCMFSxcaMV0mYMilc5RNwr1zZ0zuf5FjVRPqouXNl7RoH48lZ9fecY2k7tgdLkILCh/N3IyKqbnYcpWElUgo9jn6yNDAXUqktKFItKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(26005)(478600001)(2616005)(66946007)(956004)(66476007)(31686004)(16576012)(8676002)(54906003)(66556008)(38100700002)(2906002)(86362001)(6486002)(4326008)(15650500001)(36756003)(6916009)(83380400001)(31696002)(8936002)(186003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW9Zbzd5TDlZV3ZUcUdsTHgrL21lZkJzcFFULzQxc1hmaTk1SDYxYUMxVStH?=
 =?utf-8?B?TEdyUTd4SlNXdnArTDN4QmRKWkhTMzNBbWRIdVdWVUxSczVXWU0vUVRMLzFi?=
 =?utf-8?B?VVlZaVNTUE02ZGJ3cEgwQUZTMnlSWWFaL1lNcStsUzAreWViMHBCeW81bEpY?=
 =?utf-8?B?bUFSVTVKRW53RWF1cDFXTDFXUmk2TU44YW1weklMSUx1YlpySGhnREJmWnA1?=
 =?utf-8?B?TDNBZVl4MG9HK2NvUEE1UTQ0cnNhN3BPZGRzdDFWbllxdmFqODM5ZkxFRUp1?=
 =?utf-8?B?eElEYnFKMUMxMG1DTUlXTjJldXVsb25VNUJTLzBpUEp5VVVKZVpNbmtKMGFl?=
 =?utf-8?B?d0xBQjlBaE43akNZcjUxb3hYMGljOEtMaW5PRFIyTkxCSC9IbnEyOXo0SCtN?=
 =?utf-8?B?UkRwQUZFY0t6blNvR0djb2Y5RGNVdExnK2h5VkdLc1ZjUG1SdFhQOUFpc2xj?=
 =?utf-8?B?WnBOcmsvZTFoV3NsRmJ6TFFTZ2tRL0NIR0dudTY4aFVyTFNXUWxvNEF4ME1H?=
 =?utf-8?B?N1czK0ZCNVlSb2VtTTZFQzJZTXJmbWFYYnBJVDIwRndWSTJWMStFNms0cVZS?=
 =?utf-8?B?VGNJUDJlVC9KQ2hhYzQ4S0FwZUJiTkpVR0t5ZUxGRXpYUFlDeGU0eUQ0djRy?=
 =?utf-8?B?d240dS91aThRaTdET1lidHp6WHByWnQvaWw1UFFnb3dnbnVMMnF2NTJoN2NG?=
 =?utf-8?B?dGovTVY1VEpyOVVYeWliTnpvMmJqMWJXU25TWFFETFdRM0FlUW5oV2pVWUly?=
 =?utf-8?B?cSsreVcwVlo4bUJTQUZ5akFlNUVRSm8zZkg5d0c5dURmM21jRlpFcUNWbGNS?=
 =?utf-8?B?a0E2dEVDb3JqTjFhNTk0TzV3eVNFdjNiZThmRUNpV0NTcVhoUi9TYk5UL2Zx?=
 =?utf-8?B?RzJ3OHQzRmdmOUhQVExxNGJmRmNFc1ZTckV0K0o0VWFTeWorZ1pRQmxja3Fk?=
 =?utf-8?B?TFlEUWxtSm9oSkMzVFMwYVBOcHZTL0FxZUk0alE2OEwrd1huU1R2cW90YzNo?=
 =?utf-8?B?aW00VWtLOXNGZzlvOFdIc25ma2liUTBZS0hTZGo3UWpnM0JKVWpKc3FWQUE1?=
 =?utf-8?B?QjBwbjgxQUZXelBQakQrN0hDdnJlUkV5ZEtvbnR3RmZGYlgzQ3ZSMlE4Mm5m?=
 =?utf-8?B?UDhQaVBIWHovNGNMaHlnMUFQd0E3aTBiVDhDVFl2VzEzV1U5a1R6MnF5TDUz?=
 =?utf-8?B?bkpxV2IwZ2llVEhiNHVqZmdCWW13dy80bzZ5OWdaMCsyK2grN1NnSGNpN25O?=
 =?utf-8?B?QjBzY3dpZS9yaVltRzA3RDdMRlBVd0t4ODFBTkZOSUo3RWFuMlc2UCtZMFpQ?=
 =?utf-8?B?WUtYWEdhZGJFdGk2UThhY1dTendydUwvSzFlK1hueGlpdmJzS3FzenR0Q0ZD?=
 =?utf-8?B?Mk55V0ZjTnFFR2NtRGVlcmhQSHp5SmlUbExTUWVNUjlMSWoxWkhzV09tRkdm?=
 =?utf-8?B?VXc3cTByRUVETlFZQTFlYS9wNjRXdXIzR2Q0c0owdVR2UWlqSVpNMDZIWHhX?=
 =?utf-8?B?bHducVNycHR2YW9mWmMzeGk4Z2FEOWNqa21JdElBeEhGdk0wUDhEanpUUTdJ?=
 =?utf-8?B?d0tUalpEL2tBbVRCNXFWQTdsaURwYTEzZytwMzhiMHo5N09mUGE1ZUdHQXlo?=
 =?utf-8?B?UUtDcjM3bFF5anpBQUo3TUhvKzkrang2V0puT0hqUGxzY1ZUNkNqQ0YrS09r?=
 =?utf-8?B?ZC9GRUozaFRTcnlWZjIwcDdSeGV3SWVhdDdFMnVHT08yS0lRY3grVmNzc2d4?=
 =?utf-8?Q?1b/+4rQqxvSbts39KWrx6BtDdZEmy791Y4c2Tob?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e858b0-2a27-451f-755e-08d963bd8122
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:33:01.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Upx8HEXHOfLgskc8DX4IFl8c4gKmpngHBsTp9Bb15DGNqylopibnnjuFrLxAOxc4phSxl65FPdZ5nw9fH4aMKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

Clearly I neglected the special needs here, and also failed to test the
change with a debug build of Xen.

Fixes: 6b1ca51b1a91 ("x86/PV: assert page state in mark_pv_pt_pages_rdonly()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also adjust respective comment.

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -61,13 +61,14 @@ static __init void mark_pv_pt_pages_rdon
 
         /*
          * Verify that
-         * - all pages have a valid L1...Ln page table type and
+         * - all pages have a valid L1...Ln page table type (including the PAE
+         *   sub-flavor of L2) and
          * - no other bits are set, in particular the type refcount is still
          *   zero.
          */
         ASSERT((page->u.inuse.type_info & PGT_type_mask) >= PGT_l1_page_table);
         ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
-        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
+        ASSERT(!(page->u.inuse.type_info & ~(PGT_type_mask | PGT_pae_xen_l2)));
 
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;


