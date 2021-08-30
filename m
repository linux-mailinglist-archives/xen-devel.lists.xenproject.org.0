Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9B73FB7EE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 16:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175143.319147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKiEy-0007X2-6j; Mon, 30 Aug 2021 14:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175143.319147; Mon, 30 Aug 2021 14:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKiEy-0007Tx-2P; Mon, 30 Aug 2021 14:26:24 +0000
Received: by outflank-mailman (input) for mailman id 175143;
 Mon, 30 Aug 2021 14:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKiEx-0007Tr-5L
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 14:26:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55e8a829-e61c-4f48-800a-1b3fc29de1f8;
 Mon, 30 Aug 2021 14:26:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-FfWI02BeMCuy5pqABFhIDg-1; Mon, 30 Aug 2021 16:26:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 14:26:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 14:26:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.8 via Frontend Transport; Mon, 30 Aug 2021 14:26:17 +0000
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
X-Inumbo-ID: 55e8a829-e61c-4f48-800a-1b3fc29de1f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630333581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=on6IJ8bcIQNSiQqVavMkbCsM+NjUYh7qd2eyG4FO7co=;
	b=AeF3ZkIZVmqV2bY26rF2a5EOkJLnO73f0xil5ClGDqKoZw72FM+346c17+XeNGu2vcEbu7
	l5J5UKm/DcESflJCisO3knqC6/Zt2msvdqniFmv+0U3ANlIwZl3Z22ridInDzasisQhtE4
	iZl4YHIY5+4cvx2dsQOzuh9HJ2FyAIk=
X-MC-Unique: FfWI02BeMCuy5pqABFhIDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT7SIZiGZp/qk7p5m/QCz77RygU8lJ9NMlSiYL+94P/RAKh9LpB80s2JPeR2I2MgbSSrQeUVOMT9G32QIc1H9IiGapz2S5fZgYVvnCer7Ii1yUWJnVVihRefKCnz2Qdfww8ekl+y6mARHGG59zCh5E8Bcj9czJLhPBRw6zkISCLOfIyuVZEPz+n1D6gub4OxOGVXmKmibV5ALnSgpJydlwnwZnzKiGblgGUwKX/oaF52mwtMDJbUyJQ5L3oyo45u3kOH4mx28H5pSYM42VqX8soWk7rT7BstNkSmhBmBOy4jEx175Y1cBHEO81gDXHSi1REj75LMP0gToau28btd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on6IJ8bcIQNSiQqVavMkbCsM+NjUYh7qd2eyG4FO7co=;
 b=GAOHM/FYcLIH0vkE1PpuGXEK2LsZKTQ4j4SmkRCw62VVQ4INCv3QFQgtdLD0JCJp8wW7su0Sf19zySJGl6eU+OiYNIWn0pa+mDUnrsQX6KgkmMG0UEycg7M/GcpE40/Vl9RMNUsHSIN2JZVoPVBg649Z3WNt7yImR9NVkRw/uYfA9Cham+JJnTlV8SiYG42pNBQuS6cvsumvDLjK4w5XHlakW2UFkNaoan0C3aOtOTPz/7o2nRaDVZ4ddliTwJyRCkph+1dMsRuOQI4oeQ9rGQ8JvToEDHXpmjD+7IUgp81wB3iwz6LVLJLFPxbDGs8zAyLkD12Q5Cvbwhe2rD7I+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gnttab: adjust unmap checking of dev_bus_addr
Message-ID: <1d2d28ac-bcf2-2a96-a6dd-8282fc59a16c@suse.com>
Date: Mon, 30 Aug 2021 16:26:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50341d06-832b-44fc-f225-08d96bc22137
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB419120AB0AFF94AFC33B4392B3CB9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YbCf+vIPkKDUjQaUQhjcuQmiXlwiqWBrMyqbUb9icg549bzyf5j2A8R/hObee/zZNB6xdtatF/TlJ5nDf6Wa3Hwc7ri2NiL9zG+VR0gdOPe4lp3uTMgGBCvhfiyJ6dvWZ/8+/QlWBR0D12dUFqlBCA4SFYrYdHsf49+xiLtabjMFXlTIop8BObs79TISrXoVYFGLcB5onvoqpmszmk6rlj7UfyAhixnjcrlM/5LyDXfy+LkESjU1HevrsfjxqPV6rXK7piIzPP4Bya4/AazjVDkKu5KLIoZRyqBUZmDWgA0z4ebm9W+RIPuUIJuVsHhG5XiLCnhzXbFAgaS3+TadJcflenmFdnHHSFWH1rXirFkg+UQAp0U+YNIKRMXci1pzHbLdHZzdFFmqgAqhUD0Kmidc/LEje+0s3lG07CM1uwbuTfZpRJTU0Z2vu+ctaVBxkG3IeXKU8x45vR+jygCc0LRNWRaJ0cYztn+1jNV8TPNzm+YgM0Gu0LPZLyxzQILwIdVY05GPzOKelOgAcp5uYFo5AjFuOX8tP1NI1Nae0Z1BZl3iMxaT2SNRK77KdwM00lEb7oMAIzlaOTWO+3g3gNj755VVs0gzuLJruV6K7FIsOeT8FlCADpWwON0Sq+MnC3UD12R5jWFMv0A7d0gvq3+YJGfcMTiZvuPIGSDg1LFjl8vP4ZyG2Nlo/PtgwrsDzuiW6QfWg0A4WJlOzQVgEL/dz9kf9I1UgthRcRAx6SeVW1lUqHxv0r6AMjx4zOwr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(6916009)(316002)(36756003)(4744005)(2616005)(31686004)(4326008)(26005)(186003)(16576012)(54906003)(38100700002)(508600001)(2906002)(5660300002)(66556008)(66476007)(8936002)(956004)(8676002)(66946007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHpjUjlBUjN0a01EbEk4ZXJsSlN2UHFidG4xcW5la0VCMGlxQUpCSHlxSVkr?=
 =?utf-8?B?aCszUU9YNS9SVVlwVlM3Rm11SUREVXRKWUtacmhYTGwzVFVSTlZibkFjdDJz?=
 =?utf-8?B?RkZsQkVoQjEwU0VOa2tyQkJnMWJFTGp5Wmt5NXlXRnJLKysrcG5kaElINjB6?=
 =?utf-8?B?TkdsTzdTaGVGRzdobUQxbkg1Nmw1c3hwWFhxR2RDSW9oRGdLcjJYM2IrVkJO?=
 =?utf-8?B?YkZ5VDRQT3MxeHdvbW45WDNYSm9ZcTFiUzJkWVlFbXRtVzN0Um9aeTA2SnlJ?=
 =?utf-8?B?SVNVd1JzZEIybTYrdVlkd3cvd082YmZaZDNpYkFZYzJKZDF4amYxeElUVFdG?=
 =?utf-8?B?akpLVVNudXFKckl2azFmSHNIQVlrZHJWTy81MmZJaitiUWZDZWV0VDFVcnRx?=
 =?utf-8?B?M1NJc3pSN1RnNkJvakErMkErWW1UZW9lVU9FQjc3dDl3VS9oQ0tTRnoxNWU5?=
 =?utf-8?B?VXFoZklwS00rVFJ3ZzhnUWhxNk03NkNPcEV2by9oQ2R5S3hieVBReVBHWWpJ?=
 =?utf-8?B?MFZhMGNyZzNseUg3U0FkWGoyb1JWY2YzS0RGK3VmdnBJZW5DNDNmVU40bjAz?=
 =?utf-8?B?RU0vb1I1eVVxeXN3cndBUngxeGFnWmJPaTVWUHBMUXIxOWRwUDk4dHdwbTZj?=
 =?utf-8?B?R0N5STJQODBrYStZSE1tRlh5SXFha3NxakhwdENwQUZGN2dsc0hhdDVrMU1R?=
 =?utf-8?B?OHdRQ0hhTHlrZkk0VGtYOHpEbFdJZVkwdzM0dThSNEpMMzJlUWdITGtiMDdY?=
 =?utf-8?B?U053eTg4cUdya1FFdlZjMjhhWnlvKy91WWt3bGQ2L3liUXZaQmlnYWxKa2kr?=
 =?utf-8?B?Mjl5VDk0dU1iZUhMbDBUaU1KSm5oS2xXeGZpZjEzSXBUZTRDbmMyMUxEc1cz?=
 =?utf-8?B?ZCsxaFIra2pBYUZMZ2Y3TnhCNWgwTzJnVHZ1RmdidEttd1NpTyswS0dMV1dx?=
 =?utf-8?B?TG1Sd1YwWHRDOFllVk9WaE5ZcTVhRDF0M3U0SXJnaVZuRndZL053akdqaTdD?=
 =?utf-8?B?b1BidUZoUXhyK0FnOG03TlhDZWpodjkrTEh6ZVhzZ05Id0pXYlNtelhaUjZi?=
 =?utf-8?B?S0U3VHlTMUdadlA3SjRVYm5zUHlIbnBmbjdCcUFZYkt6Y0grSXVua1RnakRh?=
 =?utf-8?B?aW42dDkzZ0ZCK1NqRVBOMnJqRkFrWUJoZEpHSGVleGtYdE94Q0NyK0FxZUcx?=
 =?utf-8?B?YjlDQXI1ZnIyaWloWnYvRHI3RlpVK1JDd3RHMWZ6U05Kek5hK0pqSXZWeWcy?=
 =?utf-8?B?Umc1K3RXT3lpZ1J0WTRSUlRmNjY2TjhydnZMQjZHMzdOcjhwYTNGYXA0TEho?=
 =?utf-8?B?Sm9XdGZVSWtwSkNublRFdEpybDBwZmprREVRSHIyOURzN3lRSmRIczBlb0dy?=
 =?utf-8?B?ZjVSYmphS3h1MFNJTm8yZUF3TmIwQUN5LytNdjZMczF3NlZ6Y0h6S3Ywd1pi?=
 =?utf-8?B?VCtRUXpIUVRFZ24yV3dRWUhZeHRoOUNhcUhhNytXY21BV0pseXFyazVuQTN3?=
 =?utf-8?B?NW1VMm9BQjVMd0JHL2dXQ0JFaGJYeW5SUk1ZYnMxbkJ0MGU5NXk4UHZNZWdo?=
 =?utf-8?B?eklUcGhvUWc2Nm55Szg2RTBMekpHZVByUkhZLy9kblAwVFhRSGZMZnZpVFBQ?=
 =?utf-8?B?dHVEM3FyZlZEZ2I3K09kMFh1YjIrbG5mcVRheEZ0SzNIaUc0enFHSGZ5cnJi?=
 =?utf-8?B?SGdic0Zab0JnamZuM2lMQ0ZzRDNrVlN0YXhDM3hHWmZyeFdPS29ydEVmai96?=
 =?utf-8?Q?5ovVONLOKOa7KM1K1CNtrrabvA2ryT1y/4aAdFU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50341d06-832b-44fc-f225-08d96bc22137
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 14:26:17.5757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyO32mIgD7XprzgwV7KsISdT6htjJpRDxA8TIcdf8wvS5HkoxO7WX5HtSVIqwuy3EwFADzimJY9Ud3kBhzhnXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

There's no point checking ->dev_bus_addr when GNTMAP_device_map isn't
set (and hence the field isn't going to be consumed). And if there is a
mismatch, use the so far unused GNTST_bad_dev_addr error indicator - if
not here, where else would this (so far unused) value be used?

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1450,9 +1450,9 @@ unmap_common(
 
     op->mfn = act->mfn;
 
-    if ( op->dev_bus_addr &&
+    if ( op->dev_bus_addr && (flags & GNTMAP_device_map) &&
          unlikely(op->dev_bus_addr != mfn_to_maddr(act->mfn)) )
-        PIN_FAIL(act_release_out, GNTST_general_error,
+        PIN_FAIL(act_release_out, GNTST_bad_dev_addr,
                  "Bus address doesn't match gntref (%"PRIx64" != %"PRIpaddr")\n",
                  op->dev_bus_addr, mfn_to_maddr(act->mfn));
 


