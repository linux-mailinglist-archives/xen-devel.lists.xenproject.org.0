Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A7402837
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180934.327825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZsH-00070L-MV; Tue, 07 Sep 2021 12:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180934.327825; Tue, 07 Sep 2021 12:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZsH-0006xR-Ig; Tue, 07 Sep 2021 12:06:49 +0000
Received: by outflank-mailman (input) for mailman id 180934;
 Tue, 07 Sep 2021 12:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZsF-0006wJ-Nn
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:06:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f8a6625-0fd4-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:06:42 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-Gwi4fgkDP9eCN2J82GTPhw-1; Tue, 07 Sep 2021 14:06:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 12:06:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:06:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0018.eurprd01.prod.exchangelabs.com (2603:10a6:102::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 12:06:38 +0000
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
X-Inumbo-ID: 0f8a6625-0fd4-11ec-b0eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMBMI5yUqKk+WNG37WLHu6TzQ77qqIKUpYH+tOuAlHI=;
	b=LnltSzSpfkqB1ibig/iG80wXL18RO73FeO25lVZsLxex56VSyOmH4QOhOCVtUDNH6ScK+W
	SQyvcRT21WXI+N4QkR1CfJsqAa9Gfeo/mpZpB93u/WcGvxLrAe1/WVw07zH01AlTGkc7Ma
	MeCTxdk/dHUFpg6kdaO30u2aQPj2dIY=
X-MC-Unique: Gwi4fgkDP9eCN2J82GTPhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5vf+Dc/6u6YP3qATr/SVEHIz9bTHZ3VENpfiCtFFWXEH8JhbC3SvAzFgo2AsPHCnSqewi4aCG0TsaossKwDSp4vcwkPZiED6I60CRCdCnz8xe2+9fTkd9FGszqFOno38UG7/3kg5Po47bKu0MzzbDJk1nO+HTBbCYybDfPb8xwOdq1jsX+b2MBCgsMHvCDZH+izbK5C0wBzUshPCtqTlbONfFdfFslSVP++oOywbU8wga++rYbtRgHbVeKFNsR6S+tRH+FBsStCjK2glfGyPOUp7tlJd3ncF3jzDn6pvv5M8lKHYukNiMnPUaDZjg67Bb1+HaGB+4hUjNPW8DM0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YMBMI5yUqKk+WNG37WLHu6TzQ77qqIKUpYH+tOuAlHI=;
 b=Da6k5Ye+k2Vi9VLypqWRuZSkQeyMNC+cSSE39zUAiLRkduFYRJ3Bx5HXYpzuxn6z/Tk7Gnf/UK4K2r9WKArxDnvYrRrqoMfgPGrPsTvDoRcchKHZCaphgXPD0w+fXVBrx/fgw2JQDHbp0MW5OY87SxLN5sFoiroofFTW7R1E0Vm8KrvWpfbyzjmRXGi2smY9IEx1eE3dDobPr75vbuDhKPLLDN3K1ehhTyeytv/IWfTFIcsnu0TKeDRWia52VdW7I5R8beUl4Tyc/+AucGSR3VPHqVio0yMVJEqMEnzSv7HD2CFLKfI+LCi9w5374GCATCSnxc71nuf/1v0RU2ifdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 06/12] swiotlb-xen: limit init retries
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <984fa426-2b7b-4b77-5ce8-766619575b7f@suse.com>
Date: Tue, 7 Sep 2021 14:06:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e87e0e46-93b6-442d-684d-08d971f7f265
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233587B1C1670D1B539CC167B3D39@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6p+jxvZNvlchQnDd2qOjDZwFxL66V8vytE1+ZIOz6IgenMe4qgcjUe2VdKNwxqWWpLmxNEO5itjH8OxfIp8DFLXER0IjypKgRhABvRwDn8jh42qUTzm1R+jdDvtBezSvx07I8YMpvzR3kXvZ5VLOu0QfEGNa21xb9gd8Y6brn7Kz1P5EKPdnj2xtXXvF35oHvaWdQV1iy2G94lY8JfW+PIGvRddoJqYS8LHMu+W50VF+IGO+CFdt4bkua/aDTBtnCYoiVrptQR6f8nBqnEP/xgL4ZyXPe2gQ6YaGvb+jhb5ha5eSH+3M9ctVX2ppJ+9twQGNwtEwSPFpWkl/1PDLmcT+ndTFg9Rp4osmZXpd0pF3SQbdp83JFPNST9s8Ik4Tr6xh+YktesFbg6qZNqrec9yBPDqT8PqTByhVzvko9xDAAEhzGtoW+uItXp1fiI6QKxMAaTC9x8C1WhA2DvRew+fNCR04p845+JOSXgpZDB+NmM4aBaKMuHH5lf1vLCkQom3BVDZNn/A3CoXiRLxIjEOQD1ctXk35BEBu2PeIpUxKp5fGXvJe2iw+zLl9DI360OHCsOI8EuubFxDe5bESM9RLe+1EC6xYEgROXhIW64IIcm0VxcfcoJq05iFOt7JSRAyS0GVoWxz+zyaAYe3M/wVcfkmhi6bMYMhxHOofggi0Ej/aKfwNi8cl1eunZJWXFAW4JXx/YSAd+7sxKdz6Kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(2616005)(8676002)(5660300002)(38100700002)(54906003)(110136005)(83380400001)(956004)(66476007)(66556008)(66946007)(4744005)(26005)(316002)(6486002)(31686004)(8936002)(16576012)(36756003)(4326008)(2906002)(478600001)(186003)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVR3TXNZeUpyTWZVWGIzdUhYM1E2aUNtTUFSeHdLVy9WMEd5REdBcVM0bkRp?=
 =?utf-8?B?dW4wc2crNU1xTUFhOVIvcHgwdnJwMWVJSk1sTUJFTW5mY2NMUmZlUWxrYWh2?=
 =?utf-8?B?SHZtZzFqQndVcjRVWFlLOWY2MGtMUHRFTG05cGF5QTNlekR4U1drT3JycUtL?=
 =?utf-8?B?WW5ZMXEzekkrK09PNkRaWUZrdTFEb2NVaXR4emhlanV5TFBGYTUzWStuUnFv?=
 =?utf-8?B?RzgycExKUmgyZ01pZ1N1dW41VDlEQkN6UFlncUFXR3R5U1lkbEw1TThMRmc5?=
 =?utf-8?B?cGZRMEE3YzdjOGRyQ1VoMWxTQXR1VGtKckJra2dEKzdRNDNtOFJnTUJHTnZv?=
 =?utf-8?B?M0hBTldBRmdkNUVmbmNGRFZDZlpQQWoyOXR2SldLLytTVmd1WmVBYTRLYTdq?=
 =?utf-8?B?ZTdkYzhwOWQyOFQraEptdlpVcUNON1cwNFBYcDBXNXR2dGc4V3d5ckwrUDNE?=
 =?utf-8?B?cksyY040TFAyMnB0cm9BSllvVjl2bFNTVlg2cmx5bUxDUUwrYzAwQ1V6M0xq?=
 =?utf-8?B?cUVGdXdGS095d2hMUWtCazZJZGJIdWl6V1A1dHc3czBZTkpDb2p2MEVLdHhU?=
 =?utf-8?B?dndxcndZN1dKTjlnc2k0Vm1vOGFObzBld3BXR3phUDFzMFZzMk1lV1VaRllV?=
 =?utf-8?B?MmE2L2k5YitjRUNVSnFGc1paRTkwdVZERVQ5a200bzc0dmR4R2pTT3VBTkFn?=
 =?utf-8?B?K094MStTWjc0TGNUNS8rek5JL3JPdnAvSk1xaHhidHYyNjdQWW9LZ3M5dFRp?=
 =?utf-8?B?NDU1c3Jzb04zVk9Ud3ZneFZFUWpvdzRvZng3dE9tWVdXd0E3UENRVkFPVmdp?=
 =?utf-8?B?S0Jqam9zWnYxRUY1Y0hpU2p1THBOTmNKRWc0eHB1Z29NeFVKOWNsY2dieXl5?=
 =?utf-8?B?cDk0UVF4em9sZks2VGFZZ3pnZDE4bmVHM1o5VDY1b1FEdzMwUkI4VXp1TUhL?=
 =?utf-8?B?ejJOOUJ6QW9DNUYwSDF3VTNHNnBIcm1wbXlCbXQyQktqRkltZ3I2U0sxTHJT?=
 =?utf-8?B?aDZkTHVsVFpnMGl3eDhQTFhIS0ZqOHpuZm1TY0xuZDRxdEwxOCs4ZlN0Tkx5?=
 =?utf-8?B?NjBrSUtzc1h5eWQwSkpXbE5GZHZtekhhajNzWjhWeGFVSGN5emY0Z0tBMlNE?=
 =?utf-8?B?ZnNOSFVvS3hUdm1wZC9GOWV0MlFVU3dQcThWZ1YwTzVWOEdMWGRqS1BBQVRF?=
 =?utf-8?B?QzBYRUsxSzZpbERPQkZHdFptSjRWTFlsQ2JDRzdWNkZqZ2UvVllnZEtxbUY2?=
 =?utf-8?B?UTR1ZGs1RnlwL0FPeUJjeXA4L2ZMN0hoeTc4VFFjcDZ2clIvRHgvUHd1WmdS?=
 =?utf-8?B?Q1pIMStKRldZRFk0NHM0VHhta2R1R3hrNG1NUHlJbjhYRm9HaGFGczV3OE1T?=
 =?utf-8?B?UmhLQW1RN2wxeTdFV0VSZmJVNytBZFVTZjlNeVlSYktQWXNvbkFsVENtNzl4?=
 =?utf-8?B?cXB5NnVaRmJ0aU9lQlJtRUdoQlRYcTlualQ0YmpFVi9KSHhteU10Z040TVo4?=
 =?utf-8?B?d21PT3duWmp0cUtRUzZvQk95RG1jYmZ3VzZqcUExSjJzNjV4dFY4Qk94K0tt?=
 =?utf-8?B?T2FoQUQ5c3JjVTh1SWkrcWR2MWdjcFd6NUU5VUdWRW1xZWhjT1N2VFJWWGVN?=
 =?utf-8?B?MUJlVUxYaURCbUZJajV6SW5tTStLVE1BQ051aDBlSS96Yy9WeXVNN1BBZktq?=
 =?utf-8?B?Vm1zMEhJbnZqbVd3dCtxZjgyMlkxM2RQTmo1NmtucWJXSzYwUU9iNmQxOFd2?=
 =?utf-8?Q?ADFcBANdJhD8VY3lNsPOeRWZU7k3yVq0sCVDFF6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e0e46-93b6-442d-684d-08d971f7f265
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:06:38.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ph2AurSgsXAZiupuP2pvXbNulkvCbwBmtN+9q0Zh1ffPH8Wymh+4lbKcDL4jZkQDrkFawmyk3YKAt4Eu+kBM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

Due to the use of max(1024, ...) there's no point retrying (and issuing
bogus log messages) when the number of slabs is already no larger than
this minimum value.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -207,7 +207,7 @@ retry:
 	swiotlb_set_max_segment(PAGE_SIZE);
 	return 0;
 error:
-	if (repeat--) {
+	if (nslabs > 1024 && repeat--) {
 		/* Min is 2MB */
 		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 		bytes = nslabs << IO_TLB_SHIFT;
@@ -243,7 +243,7 @@ retry:
 	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		memblock_free(__pa(start), PAGE_ALIGN(bytes));
-		if (repeat--) {
+		if (nslabs > 1024 && repeat--) {
 			/* Min is 2MB */
 			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 			bytes = nslabs << IO_TLB_SHIFT;


