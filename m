Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A984087A2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 10:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185547.334239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhjn-0006jg-6f; Mon, 13 Sep 2021 08:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185547.334239; Mon, 13 Sep 2021 08:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhjn-0006gG-3I; Mon, 13 Sep 2021 08:54:51 +0000
Received: by outflank-mailman (input) for mailman id 185547;
 Mon, 13 Sep 2021 08:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPhjl-0006fy-4z
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 08:54:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b18ff7ad-259f-4181-b762-41b59b90148b;
 Mon, 13 Sep 2021 08:54:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-MMJXTS9qNGGWN5_2ObqwnQ-1; Mon, 13 Sep 2021 10:54:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 08:54:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:54:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 08:54:43 +0000
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
X-Inumbo-ID: b18ff7ad-259f-4181-b762-41b59b90148b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631523287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jo8bPyvtaH5xAEf64N9SfjM0M/xdcPBEVhdBoKC14/8=;
	b=FIQ347EG7S7gYFtXeS/TOhwKgUINmysVsbr1IBHL6SeLdEbjEcdFYhHtEqDnWDZq1wlzKJ
	W/b27Qe5nIMJXMbsHFPzyEZlE1rBhEqBU517hyYoRKIxI1AYmkpgdVONh3WwVubtfqOyaf
	X2ZH8jlKTRAjBuaq0rpr+g3zNvpbY5Q=
X-MC-Unique: MMJXTS9qNGGWN5_2ObqwnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSSAl6ffjBSou5yA57i1XjPffkOEI7u22DmOif7SKyYez3DlwqJ0vtbdO3wi3xcQGfORK1h7AUMvHo6ADAORfHSiASxviK67TiqItw/L58kmiWV7jsCJ1+1Tcnzbym86JIqdyGvxNPEPUofhtIpzbgb/BNlCP+Q1uF996sKZzrTYZnYsWJ4JN6bnjSXYZ7nsjQOLR8zgNgaJxKZdYWMTOHf1MC4Ec16+BUU+dlAwi5acN1uL8Vy0oFpX8HJFUF/xQ2rZnYMCn5huaBzP7X2t1//FQeQPWzDQ2AXQAkgOGgrZTl4NdeO8QQWBHL0Sg6S6osGY1gbskdx07g7ciKeBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Jo8bPyvtaH5xAEf64N9SfjM0M/xdcPBEVhdBoKC14/8=;
 b=JZ3SNtuADJq5bN5mFseYKVb7hDcDHDCNTqQ+Y8VFqOyTCbSmhIb/nYRGndZJZvXDYNtk3KUKvlE/+53X+pnUjCHr9+WGsLIEB4nP+b3OORi32TV3lx19Md7Zgcb71dya/owQD4Lhp/B5mdAxIeNrAA5OxdiliXy74Pynb5myzAfUTMS72N5XLR36LbqQFT84kI8FfGwG22FQbkSGe7ar2HgqNAs1y1g+ix8UsFV5G/zXFIX5Ozvzt8/r+eDN5eHrr2ucrauhmyuFBO7e5H640U32iLQFDttYhFC3tvbkCvj7hhI2HVUNoKJkV4I0M3owvbjFohN16gfL9E35Koedjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] x86/mm: XENMEM_{get,set}_pod_target are restricted to HVM
 domains
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ff324215-ccad-bb05-e36e-d711ff7c960f@suse.com>
Message-ID: <70da93bf-b337-f275-bb7d-ed4ab86fda08@suse.com>
Date: Mon, 13 Sep 2021 10:54:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ff324215-ccad-bb05-e36e-d711ff7c960f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dbe64f6-b9cb-4094-5e4e-08d976942155
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63831A11799EE674402E0DD8B3D99@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJWyzHGMEw2ynrZGI7bi0ZgJ+lOIUJBW/qnsBq9goSva2somCyMKHEwtkZyk2uX5EepzAfyvYIWW3ctoKnrfWxAoO5b8mZ3hACPm05v6Vb+v4ZtMtLDtr7gO0cBKWw1y5+twrn7GqltHib2ILzKzGZJ0+PHFEl1pKdgYrHPClY8nzki4j179Qn0RUX7DgNXGf1wwiF7zsTvmV/ej5c9b1VvbakelQLRmfVqCdGQdg/m/5/TwqgD09SvIbVaK4SeQan/vjpL3d3diAZWdVA7vU6tNqKn82Xojt8DiNAIJXQ7glRRTi7MoC9bTzMnpvbZDiZXlrNfrE80+VeSfmZSRioSuN6TlyAq6jGBibFCKY2sBWtiOEuNOpng6cdfTuXHOd3e47F3uj6wGofvM2m5J+IUapkUGEsSnt/Meqit+Zu6lWP9w3PtDG3gngUSTCUXcE0DDDQZaWNLG4xkK1gw2PeOP5CH5j0trmtKulJuyGyD/dOEc453J9yVHlACwVpGXKmTbEUg+FY4cv/fd03fMr23xpmXhsjCz0dlJ9UCjERPs+9PNsQXzD6t4ajZ/ZFLMXp2AnG3zGCm4TX4FuDJTmzBIwWajwsu0S5rELOhWTNPWN3uBshECSVIdwAuWPpQLOMaI3nk255GQssidf8xJZlkZZ4d12OXQ4d2hhe2mocVo/OPkBU/TpqafVJNTsF7jGvNlITaZQLJg1HCpk7/+kJ0F+W9T/wJ4v5aYtgbP1lODUvc9iYnbpIZPY6gzOSB5+6jbQWlh9KtC9dWDrWzoivobI9VLmVgU0qZYfsEwlWhmHK0uZvdMmvHvkFAZOxHmMQI/Xc8eiUrFYyj5Sgskh6bxnoLzTrtM0Ffo82G7RIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(366004)(39860400002)(8676002)(5660300002)(8936002)(26005)(83380400001)(186003)(86362001)(478600001)(966005)(31696002)(16576012)(316002)(4326008)(6916009)(31686004)(54906003)(38100700002)(956004)(2616005)(2906002)(66946007)(66476007)(36756003)(6486002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnAzOGEzY21EUDcydmtTQ25ZcVp2djJxSkU5NWxZMGwvMHNuMXFaRXgrdUxR?=
 =?utf-8?B?ZXloYnRiZ1kyNHk2eEsvbVZmS3dTWlIwcXR2Y3BJLzhUajRlMTVrWStDelRD?=
 =?utf-8?B?MHZlUEdlejhmU1NtQXA5SE9zRzdUK0p1dUx2Q3lTTmphS0MvVU03V3BFUFBE?=
 =?utf-8?B?Q3F0dHRua1d6Zk5iZktUTFVPclhCREMvN01DSHVqaTkzZldWczdBMkVmelly?=
 =?utf-8?B?a0FLSkN2N1BVQlIxV2FvRGNqbHpBNTVLdUtVaVNjTXY4RG0xOGtMd3ZFWnl6?=
 =?utf-8?B?ZEl6MlJDREdqMStSZVhRd21FWENxcmc0RXp2NGFaQXdHenpaN2FzV2pCOUdW?=
 =?utf-8?B?TVNSTDdUeTkwbkJUUzhWQ2psckYrVzdRTHhqQytiQWJsamZqWjQwU3ExaW9J?=
 =?utf-8?B?d2VXL2VSNnI2dnFDNHFPcEtFQ0dreGo2djN1QzgxTmRHcnB3bTV3MG9GN2Rv?=
 =?utf-8?B?UC9LVnRXTklGWnJ5YzF5SnVYbjRwUWtkdDJMVEtubmszZnVPWnZPZWs5MHFw?=
 =?utf-8?B?SFErN1NXeml4M2loN3VZWHJHK1JsTUNkRGxxU2xXUm9XOVg5WndVWGxHb3dk?=
 =?utf-8?B?clJ1WW9nS0MrMVBhQXlkUDZFS1BSSVFBbEZpQXQ5VmZOOGcxSkxBSUpMVW5n?=
 =?utf-8?B?aU1Uc2Y2WEpza2dhWWxNRjhObHVzTmRzUXhlVFVFTnhPR1FIY21VZFM0MGtU?=
 =?utf-8?B?WkZYZDF4eGx4NE1qZitLRTlXcnpBT053RFZHQkdUaUpQN2dyWHJySnpPVDJo?=
 =?utf-8?B?R2hWZWxZdnRZano0NDZGV1pod0FmVm1LZjAxdjFBYUIybGMvS1V3bG9BOEZS?=
 =?utf-8?B?ZVQwWW9hcUs1S3Y5bkpMdVdxV1JBOHB4a0RSZjA5UTdWbm9LeDExemN4Um0y?=
 =?utf-8?B?MFREb3JYSUdVdmtyc3E0b2prUHNuclhsOTFOaWFzWmYzRkxNT3dOYnMycXIz?=
 =?utf-8?B?bDd2N3E3N1hPdEwxenJzemRRQ0NmOGtua2dZaXF0UU9WMDJYbzBDM04wZVlj?=
 =?utf-8?B?bnJsY3NmREw5aCtiWlZCN2ZOSnpRSFBQcWFHaWZTR3ErU1U1ZVNMdHVvc3V3?=
 =?utf-8?B?cXYwbzUweHNJbTcva2hmbG0reG5KS1doUEVvbE5KN2FoQWlGSFpoS2ZOdVR6?=
 =?utf-8?B?YUhMSzhFWUQzRmxaUHBrakcxR0lJVDMxbTRrWkl0T0g1dnFjQkxhNUZYTndi?=
 =?utf-8?B?eEdtV202cSsxdm4yZnd3NVMyak5pZGo0aTcvUHRBZUVVT3RML1FaUXlNUnZa?=
 =?utf-8?B?d3drL1lSNTlCV1p1SmovbGZpTkZFZ3NsenM4aStwcytkRytaOThFbEh5NlNm?=
 =?utf-8?B?RGQ5ZU9DbGM2U216eE9xR0d0RTZJUjdzUVJRQXBSRjc4eDZFYkkrY25kYy9u?=
 =?utf-8?B?UFFocTJGbGthQkhRWWpSZGhMZG9Jd3JPR1hNK1lsd0J2cVZMMVFqMW9aNFBr?=
 =?utf-8?B?K1phTnRqLzJvbXNJOVZ1eC9iWU9GS2diZ3FBMTU0VEFVcVo1bFluc1dYRUtn?=
 =?utf-8?B?SGFNelNLSGhWZW12ekd2eFpPSWpKb2RhMHpmaEV1Znh6c1g5NEJvUnFhRlIv?=
 =?utf-8?B?ZnRsSUdXUlkvSFZJYXdBNFpsTUlxSGVXS0hFb2x3MHNBQWNaYVRORUs5eXht?=
 =?utf-8?B?TE1LYXRyY1MxMmpXYW5nbU4xT05DTFpDUUlIcG5HdU1VR2wxU1BKOEdYZ2pS?=
 =?utf-8?B?TzRRUHNSYTd4Z01xQ0JiTmtvQ2VLdElUYUlEbkovci9iZHd3UVJFS2h6WGU3?=
 =?utf-8?Q?gbTwyuX1wv3gpfcz8ZTX8hLJtJvqV3j0Skl5ZVi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbe64f6-b9cb-4094-5e4e-08d976942155
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:54:43.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM6u3W/8W0SfDrV7MYtnktZoyZx49x6DsGeRwLH5kg6aFvvcMhVlDgmgYiH26Ca0LbY6fzimBqju5ETHu4cFSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

While for now PV domains have a host P2M associated with them and hence
using XENMEM_get_pod_target on such may not be a real problem, calling
p2m_pod_set_mem_target() for a PV domain is surely wrong, even if benign
at present.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the output of the two subfunctions is stale by the time the caller
accesses it, I wonder in how far it is helpful to provide potentially
inconsistent values, due to the lack of any respective locking. It just
so happens that "get" has no in-tree caller at all (years ago I did
propose it to be exposed to guests themselves, with no real decision
taken either way), while of the two "set" callers neither cares about
the output.

https://lists.xenproject.org/archives/html/xen-devel/2014-01/msg01524.html
https://lists.xenproject.org/archives/html/xen-devel/2014-02/msg02154.html

Furthermore for "set" I also find it concerning that page-alloc-lock
protected data is being accessed without holding that lock. Both
d->max_pages and the result of domain_tot_pages() can change in
parallel. Then again I wonder whether "set" shouldn't be restricted to
before the guest gets actually started.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4786,7 +4786,9 @@ long arch_memory_op(unsigned long cmd, X
         if ( d == NULL )
             return -ESRCH;
 
-        if ( cmd == XENMEM_set_pod_target )
+        if ( !is_hvm_domain(d) )
+            rc = -EINVAL;
+        else if ( cmd == XENMEM_set_pod_target )
             rc = xsm_set_pod_target(XSM_PRIV, d);
         else
             rc = xsm_get_pod_target(XSM_PRIV, d);


