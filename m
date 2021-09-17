Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A240F663
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 12:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189282.338877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBaA-0005jQ-3b; Fri, 17 Sep 2021 10:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189282.338877; Fri, 17 Sep 2021 10:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBaA-0005hW-0U; Fri, 17 Sep 2021 10:59:02 +0000
Received: by outflank-mailman (input) for mailman id 189282;
 Fri, 17 Sep 2021 10:59:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRBa8-0005hA-Jn
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 10:59:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4288b3da-17a6-11ec-b681-12813bfff9fa;
 Fri, 17 Sep 2021 10:58:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-wjH2GhXON1qsyv1BXMb0cA-1; Fri, 17 Sep 2021 12:58:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 10:58:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 10:58:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 10:58:55 +0000
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
X-Inumbo-ID: 4288b3da-17a6-11ec-b681-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631876338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=91FfNUcKzgqj/Jsl8Hee2KoGJn6BnknKpEFuuxiLugs=;
	b=VYdITvkpyOqBMmGknv5ljfBmc7ZTAKr3zH863+O8ORoO+zri34CC+rZJPqF7/y2yOFu/H4
	TXo4VPAwxpPtrgkAC4XkImwAOuBMTHA+mehwLaGkO5rUKmL+BwxsI60bfNLtozRNsIPnY5
	EpVu2tuS/32lUuXbzZULFa417UEA5fA=
X-MC-Unique: wjH2GhXON1qsyv1BXMb0cA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFvLwyJn/QgUJTCF35Ll0Sgx1skte8PUiu+ZAMtVk8XRSaeno8dhW5HEIF7c+2XOhaDpPfWMs7Tdh5Wp3DvkzaP7GG+eTdeFYqXPrNetTbiYujGcX/1v45hAbcgtOgwuiVoZgawNmcxmyCuyRrweK433gcOHC37IEEUwli7xKwQqiegsglo5Wpe7ctmsbQK/1yoeXF0ejQ2p9H/avawei9tHMvobNbUW6/FEqeqt4he+76kYQhAwBBS4xQ9C9qd6h3ew2al+tRJIyscnANXXJgeKYjbKd0spMlQKlWGk8w7sXwxXWx/6htwx1XAlE1VIJZbCXUDeeJLvcoRrBnSaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=91FfNUcKzgqj/Jsl8Hee2KoGJn6BnknKpEFuuxiLugs=;
 b=SGCY1art8DgoyF7FNhYRM4rrPGP6Z9Vdk0+o2XX7w/bj9c0Ufk4EfvA5z1ZkMPSCFbMrV9FveP7CQVWyzaSAWv09IouAi8ed0Zw+tlEbEpk3AXvygnf8GguWAMBppfjYsDfyJdxOqv3kLBQOqahihaG6dQsGbPxMY7+9Cu33U400U+fRzRZgdvQl5It+nNRK9tBSsQGEkLpaZBGNhhnSx1qZt6Txxc6f+TqSLnAh5anQeyrejtNIsfaTc92dDfLJYR+Fc0EHXM8byr2Tf6rfuKyps4oZwW90R+5hZfuRACSQZBWKJ1tm4IYz8K0V4dxKztDEuDNu4zsjerQ16z3VGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] IOMMU/PCI: respect device specifics
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Date: Fri, 17 Sep 2021 12:58:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d392e66-c0fb-4eab-25e1-08d979ca2489
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270345D62A753F9212F9ED17B3DD9@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0qyeurjT4P8/pDYal3z7NoYobwcayWdnl/YbZhzx11TBV5JYaX4n9OOTItsOGrvsGFk1ZP+efHaCnFqxRBGRqebIc2pxJXmQOZ/b48pUyhzNMJSdovEeITe5uc35Y/BxCKq4zZaX66PF5Z4vivQTxe9Wklkk5kZ2dKm9oGoDt64JmX/kTkXXYR8O0be1+dKXA9PETeK2Dm814tgLTeU6dwtkFSziMJ0w27+02GXQy2CYrCvJJ1Ny+8XQWimRxmZLwYOyeCeLatLb+aXnGwTPD3mupzAWqGUxto5loaNCE8tKZpsE8/ADL6DOIg9dwqAFbBjQzadjVTpDnDKeYi9OI1hxGEA6kECzRp3Pz29W++a/A5s5/siOCYZfXpTeW+qpTyBi3TmoWOFUR6dM76HyYefc/AwhBSIyc/C4f0g37fQ38JwhCgT0KLCAqQRMl3uP5C2JYFPlFfGRrA1+ccjehqHEdzUmjq+nb9nql/eVDq30c3fRQ8/XPV6kpLwom5mXxjjg/BkMXbzCLNCqdZWJlbrmfxEmnIC8Z1SuH8qX9PxMAEOkSInU98YuNA2Ly+6d4pxKNnpPEc8UNgEvv3p/qhTVFmq/AXXc8D+UZr7WDOm1ysEpfPH8VSA1YuuSWkO1UtAfxLRikuV+pECqlvg2dvTb3/CGGe22hoKYwljBOLToFnUbwiDTSKXhkp1/Ty4oKydG+zMfkztOLIlDCGU1JrIgn8FQEhwZH+gJ3QQL9gw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(2906002)(186003)(316002)(4326008)(16576012)(31686004)(956004)(2616005)(6666004)(26005)(8676002)(8936002)(31696002)(6916009)(83380400001)(6486002)(38100700002)(66476007)(86362001)(66946007)(66556008)(36756003)(5660300002)(54906003)(4744005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZHRURua2oxbmt3WGozSUY4Q085a1E2UzlRR3FwdlNQRUl2VjM0TkNacVRK?=
 =?utf-8?B?TDJnTzRmTXdWTFRFTlNVNVMxZlgxMmtuOGlJeDg0S1laTEsrUVZ4NkVqdUhs?=
 =?utf-8?B?VHp1Vy9sSGgrQWFGOWMraTdIcGpKVjh1ekEvSmJMN3BMUEdjV2FQampIM0Q1?=
 =?utf-8?B?ZTEwSitMZE5yUVVxVFh0d1FWaHdYRHF2eklUVDZXdDFiWUE0NldnbWIveGVR?=
 =?utf-8?B?YXA5VDJJTy9OSURkTGhVZ1NqUVV6R1NCN1g5Q3ptR0hjbkhtTjNVdnNsazNY?=
 =?utf-8?B?NmdFT1JRZktCT2hKYjd5eXVzSlhiVUJLOWl5cklhMXNGUzRhWWVMZndqYitB?=
 =?utf-8?B?bFlSZ245bjNzVFYydk1sM0JVZWM4VEZ2YTJZd2hTN3FDN2JDZG8xNVJyRG1U?=
 =?utf-8?B?Q0RjTTYycy8rU0ZrV2RWV0pXUEltOGlqT2tzdUpjMklLa2xHYTRMVFlVa3Bp?=
 =?utf-8?B?NTBCT05rZk8wa3RsekNXa3pScXlRVEloWk14a051TmpTRjAxVVdvNVI3dDk0?=
 =?utf-8?B?NFFrVVZKMm9aZUFEaC9LdXd6ak1XeG02a2hUbkpCRlc1WnZ2N3JwMTNJZlNU?=
 =?utf-8?B?VkRQSCtmZWxJWitOckxkSWFEZkVDSW5aMWVLREppYys1c2JXbmYxTWdFYzFH?=
 =?utf-8?B?SXhxTTY4MU1PMHRFMWxHSHk3K2RxYUJPZmZEenZqYzRSN25KQXZBNzBiVHFq?=
 =?utf-8?B?MTl0WUdrTS9TaG5pbWo5a2tQWjNpNFVsaEQxd3BZZWdFOXViUytvaUdSQWNS?=
 =?utf-8?B?VUdkanVRUVpsTjR1eVRjSjBid1M2RGk2bVV5S3cwRCtOTGJpcEVuODg3UVB4?=
 =?utf-8?B?ZGtFWUc1ckpLaGNOR2VIMXpma3JmWUFFaGFNa3VqSE9STDRscVkzTVFCM20v?=
 =?utf-8?B?emcrU0c3eEVGSTlDUG1PMHcyb0J2WTlSdnEzeG9QdFo1VVpreFYvOE1XdmhW?=
 =?utf-8?B?NUZIcjR0Z2xtdUIyZUVCRCswQzA4TTlNdVN4SFNQY3RTYXFZL3M5MlRuUlhO?=
 =?utf-8?B?Zk5qbkV1RXlUcEYyd3NEemZkTmY2ZjdvU00xeFg3MUl1TGR4akVJVkt0MWg2?=
 =?utf-8?B?MFA4c3FOMXZjU3d6SmRWRFBkdEZkZDRacm9RZUZFRE1MTU1OVUtyL0l2aHkz?=
 =?utf-8?B?dWJNQ1hRY1lNclN2dlVqTGN3NWRqb3VBTUZxbVNiQnh1S2dvMnNCaytrenlF?=
 =?utf-8?B?NmhwSzdva0lpOEplemtmL28vM1VaU2NUb1VXYnZrN3lDY2RMeFllMi9iczFQ?=
 =?utf-8?B?MmszK2RRVHdtNFE1VUJUZWF6WlBBWGEreWJpQkMyWkREQlJCNEVhWEtEVm9I?=
 =?utf-8?B?T1RiWGNNWnhRa3lFR283MVY1WWZzNmhJd1RoK1hXZjI0bkxjYUtXNS9CRjNR?=
 =?utf-8?B?VFBQNHpZNjY5V0U1MS9QcVdCQTczY1RKTXJQdERKQjZiWi9RbEZHdXpXSHQ3?=
 =?utf-8?B?ZlFFTkgyZVhnRFA3RXlHN1NROXZmUEo2VjJHOFFoMFViZmRJM0QwdmpGVVZW?=
 =?utf-8?B?YjlIbHBrV1NtSXYwMy9DR09haHhQSEtsa3I3OHgwUGlRYkVuS3BXY0xiL3Va?=
 =?utf-8?B?S3VKdFRDZ20zUlk4dmF0MVc2TlNjaHJ4bE5WQU4rM3lMUmpDSFR0OXV2M0R4?=
 =?utf-8?B?RTBMeGNpWENEakttYTJLZ2FCaE51eTlVdVJHNlNrUWErVWNaMks1SS9iczBO?=
 =?utf-8?B?YWZtVTRPRnVQZEg1VHBnMTc4Q0RsQWJERFNuTXp4dERkTEpkRWNjaWYxeEhN?=
 =?utf-8?Q?8GMY+tBj3tZS1N/XUXSuJAi/FA0hKvF0zWSpu4J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d392e66-c0fb-4eab-25e1-08d979ca2489
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 10:58:55.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wP0IOP4RwPgVHDnEPOn5VZncpHQkV+EjM0DSIz1kOO19anIDAHsQ5uEbl9/4q/erJAKCFfIFUuQnnCL2xxePuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

It has occurred to me that the recent vPCI-related discussion about
hidden devices has some relevance also elsewhere. In the course of
addressing review comments of what is now patch 1 I then came to
notice yet another quirk.

1: VT-d: consider hidden devices when unmapping
2: VT-d: PCI segments are up to 16 bits wide
3: AMD/IOMMU: consider hidden devices when flushing device I/O TLBs

Jan


