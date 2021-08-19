Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67613F14C3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 10:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168418.307488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd1i-0003wU-Ua; Thu, 19 Aug 2021 08:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168418.307488; Thu, 19 Aug 2021 08:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd1i-0003tx-RM; Thu, 19 Aug 2021 08:03:50 +0000
Received: by outflank-mailman (input) for mailman id 168418;
 Thu, 19 Aug 2021 08:03:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGd1h-0003tr-5V
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 08:03:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35de9a45-1f79-42e4-8a84-1b4400548e04;
 Thu, 19 Aug 2021 08:03:48 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-bI1m8SIhMK-cITQ9NWBlcg-1;
 Thu, 19 Aug 2021 10:03:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Thu, 19 Aug
 2021 08:03:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 08:03:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 08:03:43 +0000
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
X-Inumbo-ID: 35de9a45-1f79-42e4-8a84-1b4400548e04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629360227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xCCpoNqhblmLpk0P7zYov9YQAq2XJomF6+kzvqV+EAA=;
	b=GL5mRaHRMErMrqae1dSPbZPwmNlF6EWv2JGsvCVMigBpPGzTSeGZjXKkyifBUgnngEfJB4
	CWYbcsKwBhToYg3/Kv3INVq8gInNYzM393r4+olwhDzp8ZOsdgfu20dDWrnl+8OOZWF56r
	AgYckny32gt2J99YXPflQMqEgtl5HmA=
X-MC-Unique: bI1m8SIhMK-cITQ9NWBlcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrpKyplUGLwW4IGb+qCgpP12qf3oSDpQC9t3QpU1RcifQUzxVlxeqDxUne1w2DM2aZlB2uBxK6WFj5ay07sqVVkVqe0bBYlHyvPm3NXzjZQJ+TE+o0d07s0Ybw09xpSfXy+F2A3K2YriEGrhvCLma5DlgvmZOHY7/1E4oeAVfbPQGuYz1crIYGADv7jaoGNPLAoehf6KQROMtIp2ueGm4wnrlhTJcXMIHnQtWxfbcrepkGdOYWs9ZuXn63RvogyXrQliSSv0xZFPbgFRafg6dkS3krvH2gvJQi/Lef41VGdkB4adKp5Oi4NNknACTQDKp6ZJqgA4KQBgcEbSDwqDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCCpoNqhblmLpk0P7zYov9YQAq2XJomF6+kzvqV+EAA=;
 b=HqVilDbFu1zKbSHQ3LqzsTsy9tu3csndVTtp6Clf2t5oJK6IlYQzU16XwdAKBlEJdEEvmQrWwICK6p8kBaMYQj+CfL6WmYVekuq1MvsONElk4IXpi+HoGvthJ7xbyb7uqKmCyI9V2MrwKYhrCZOFwTkSuYnX+dvIWaYog9W+q8fiNDsKztJxMYeNjczHw2d+NdYrVD/PEM+Qo+UUxls25YxZPTdzMQtutEVgBgzyuhW48LnmYzWBO3tV5jANEy7qyiOv6ZSMJ3tfJgEWNYfGjwi3cRi7Dg8vXte9NbxdfIzDcpwhfvxwYeMgtEHDotOkzI/MyzPJkCKR1tGbwXzfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: don't leave page table mapped when unmapping ...
Message-ID: <dfc83bb9-66f4-e8da-20c6-e4730e0fecde@suse.com>
Date: Thu, 19 Aug 2021 10:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c024e9-3636-40e2-7028-08d962e7dd48
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335EEE2369412E3B7C6D629B3C09@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OxZr8tdSu2N1yi8JJsGLQQLi8pc5+EpD9fa96fDaPxXdzZpRVgjDH+I9ln3YO8j9ohbtvEXNdBxR93yrd17ROsb5GA2sbe2MzDnMDuTEMK6n487a0pJUyQ5FZlFCsJgRoq0AUdJp9IVlsnMOnr5EezNXFMw0TVc14NbmLWVTztgTqU+KyHbRX81hO6GXSdWrm2vxXvbwCkw5kgxcmH/lOhk99Imrb+/ke71IonjKX22b7ZNLsUFsjSfFZKjnG6zYlmY7dKdLNMznOnnr23AnIMk1r3Ie2ysQjI3NeEo2hDHO8ZvzWRA59WC28+cWzp7P7nWlR5Heci1AHWKPfgnpb0FvjoqQmv3NENRdSMVgZAJdmnxXp4Fz6FkFb8rrDeOiaeGIXKI/L5dX4hJGt7AYIH8/EYj9dpPlvxHBdNl8VBFeSBNvbCDqg+Ev6aQMGZmcG+kXDSfkIPtBMm2zmeNp/sxQQIcSwpQSgWQ+fZ/5mqUs9Mz+dabdngXFtgGdhDgCsjQRFnxQbgaul/x1C91OcMQjAQnsczwpB8Sn4g2wL7Bz8k9DLVRHxIokTm97/cDfGnhybx/na/skbBdMiEO6FhOwXnrIvSeeonbQCZmJHS5IidQH0g4tCDN8zXHMWt7LRtzmbwL87iM6ovWJ3s76eLyoi+1b6qmvDFxxIVpOzkwpWV8nJPjQAzFLjOBe2L7c9CBTulWftoDwB01eJvl2NAReM8fbyQbFLX/+9tmTyR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39850400004)(346002)(396003)(376002)(16576012)(66946007)(38100700002)(26005)(8676002)(66556008)(31686004)(66476007)(8936002)(478600001)(5660300002)(316002)(186003)(6486002)(4326008)(86362001)(6916009)(31696002)(956004)(2616005)(54906003)(36756003)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpKMjRYSHZ3TlFkdTQ4cktucEpYTFZkcHpRSml5ZzZIcXpSaGhTbHlPQlQ5?=
 =?utf-8?B?M3R3SnpEZlBFU3JyODM3K2J2MHNGbXVienJjandqT1kzdkRqYkJCb3hXa3I0?=
 =?utf-8?B?VlpRcVk4ZGNtNWNJMWhYZ1hVSkk0bmxKVDFDZ1R4ZXdmNHI0bndrcnc2THYr?=
 =?utf-8?B?SHVUNUJCQWNCdUZsYlRRWHBOWEUzWUd3ZXJLQzc0V2kxVmh2bVQyQzJIWWxL?=
 =?utf-8?B?dDFXZmwrZEhnVllYbFpKZ0htS1dHbGM3bjlFa1RIMkVQZUIyMGZMRnJmcEhI?=
 =?utf-8?B?NGVqSXFLTWdmeFJGNWtyVVF0OThHWmMxQ0RQOEdsWUdQZjl2REp3R2lEK1ZN?=
 =?utf-8?B?bzROcWwvM3g4cC9mOHVaNUVWSnQzeGxGdUQ1QjFoU0FIRXc3WTAvK2RxNVAy?=
 =?utf-8?B?TUlMSlM2eHdOTEltdGlCVDJJMkdGZ2ZOSVR2OC9GMEw1Rk5JYTNXc1JjcW5l?=
 =?utf-8?B?UXpFb0RHSmZRSWdwRFpzZUljLzBEYXcvSFMzSWJlRkVDWHNUT0V1a25oL0JG?=
 =?utf-8?B?NjBNMXRRaTlsMHVZOHBOUXNmQ0Y0czlYcUFQenhmR3paUGU3ZE5KMjZ4L0da?=
 =?utf-8?B?QVpEYjdWWDdtTE91ZE1IMTB0NG5aWTFUUnI4VWdJT0FYUld2cDlWUzdSc3FY?=
 =?utf-8?B?Nnh6YmtTbVRxeTR2TE1NQmpnbUNYeEdCWUdsZXBDTDI4TnlSdTVsZmdvU3Yy?=
 =?utf-8?B?cnNXZVRxUCtxQTh2R2IxOFFOUUxXNUl0ZE1MeWNjRDlRLythQ0IyYkZrMExy?=
 =?utf-8?B?SUxZWGFxeGR2d2xjTWdJekVoUzUwRzFsYnM3UHoxeGtPcC9GRmQyME1MendZ?=
 =?utf-8?B?dVJ1S05TQTRSMzZra0hlVFpOeWs3ZjNyYS9uVGg3M094ZENPeC9rbFNHaDRo?=
 =?utf-8?B?ODFndkV3dFZrN0gvemZ6clgyZUtSRm9KSjdhSldCcHZ4cnN2ZG14ZHZMU2lG?=
 =?utf-8?B?MEVjcXRvUUwwRzNyY2JLRzdXK1dQeXljekdvUDV1bDVFRGhFbS81Q0lqVmdE?=
 =?utf-8?B?L2tSU3EwcGlSNjJqK0tvaEtBSmNUeVZXb21XT3RIMGd3enhaTURGc1hNQUp4?=
 =?utf-8?B?WU9GS3ZpVnBLSEpVazQ2M250RW1EQTNhQjhwR0ZicFluY0d2WHBPaG9mS0Fq?=
 =?utf-8?B?cFdJcGxYZi9zL1FsdVZkOHg5UWVadytYZzlMMzJ4UXdTd2NTTkZDU1hsVElj?=
 =?utf-8?B?ODdzd1MrR0QxMmM0L1dyWDZvTFVBbEsrYjl6QjlNZVkwUFpSdzhteWhSbUhC?=
 =?utf-8?B?aHdFTklXajVUQVlCc1B0dzlZSDIxSHNEWnpFM2pXUnJDYjRqc0hxVENjN1M5?=
 =?utf-8?B?R0JkajFpZkdzRkxPN3c1eTYxS29ySjFWcGU4VW9ybHNXVU1tOUZ1cENzTTNw?=
 =?utf-8?B?VURZdlFETG1DR045YzBhV1BGeVB1aXl6dUJ1Y1Z2d2xZeHh4VStQR05Qai8r?=
 =?utf-8?B?UU1MaWxrSDNOUDkrRWJUYStSb0EydmdGMFFLd1M0eHZaRUhpZVg0N0lYandG?=
 =?utf-8?B?VXgrSVBrc3JNRHR0eHRuZU1uZ1c0aE13azl1bGdiNW55VFAvcXdOczRCcGx6?=
 =?utf-8?B?WDZqcDBOeFRGMkNxMUsrbUxQUEhDWjdENk0rVngrem5DNENPMUkrUUxZMUdk?=
 =?utf-8?B?dm94ZlVlTUtVd3BRRXk5Rkl4bkIrNHhmK3dtcUlqaW9tVy9QSllGTjloUXU4?=
 =?utf-8?B?NFB1dmluMmNpeWVOdzhzZkRIT2VCdkROd2p1SFB2OUFJOTloTkJ0aXBOSG9Y?=
 =?utf-8?Q?43nckYPykLxFPa+mchR4djpyVvlYumCRdDGLNHb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c024e9-3636-40e2-7028-08d962e7dd48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 08:03:44.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnpXdDEvqa4ivyLASxyNrn95r/KNj2FJPAFquPOTAnhaO+XNDDZQpv1YlUn9Muaud4jffd/tYqhP+PtWIYeoWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

... an already not mapped page. With all other exit paths doing the
unmap, I have no idea how I managed to miss that aspect at the time.

Fixes: ad591454f069 ("AMD/IOMMU: don't needlessly trigger errors/crashes when unmapping a page")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c	2021-07-22 08:07:12.501229386 +0200
+++ b/xen/drivers/passthrough/amd/iommu_map.c	2021-07-22 08:08:02.360893418 +0200
@@ -243,7 +243,10 @@ static int iommu_pde_from_dfn(struct dom
         else if ( !pde->pr )
         {
             if ( !map )
+            {
+                unmap_domain_page(next_table_vaddr);
                 return 0;
+            }
 
             if ( next_table_mfn == 0 )
             {


