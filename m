Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407603FB83F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 16:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175148.319158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKiFu-000885-Hj; Mon, 30 Aug 2021 14:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175148.319158; Mon, 30 Aug 2021 14:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKiFu-00084u-Cz; Mon, 30 Aug 2021 14:27:22 +0000
Received: by outflank-mailman (input) for mailman id 175148;
 Mon, 30 Aug 2021 14:27:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKiFt-00084o-69
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 14:27:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 850a85d8-ba40-4c72-a91e-4023bc491f43;
 Mon, 30 Aug 2021 14:27:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-olELDEKgMtyRxKXvM5ZS0Q-1; Mon, 30 Aug 2021 16:27:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 14:27:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 14:27:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.10 via Frontend Transport; Mon, 30 Aug 2021 14:27:16 +0000
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
X-Inumbo-ID: 850a85d8-ba40-4c72-a91e-4023bc491f43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630333639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yC+0CivQwFaVmzF0Rucm+NRWZ6WjJbQt2jxwUZYJH8Y=;
	b=aGmGd6NT9Z3Mtynrz7vGm5ain/0Dcj/dL+/F5f6insRCEU2BsyK2uoinLY4h4014r4/Acx
	QPsyL6L1FrvhIhAqECzerg59hsyquUv10obHMlFPP6utKAAuiR79PrfHp1W3bqgRPH6C1v
	gPMUFRk7GhOSvbgJdgT4KqJXkYUHl4g=
X-MC-Unique: olELDEKgMtyRxKXvM5ZS0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=je7tNffUUyve0ecoeTBjrQRFeTYQRov/cPJq92j0BNbk5R3aUo20sGOa5DJqzjKp5hhj6s9yFXvjHD1WnHul/MpO1/pLTpju2HTnoto2NUU5dyFnYlEfgVUrHSqAGaPAq9WSwtXpLNNkDhqe3SHWtsRtRFu7brsK7bzZ0Z3AWLI4CUmFhL309bAz3cNwkxo4j2aq0A9m7/HxMmcTotiW+WhCbGKlVi/qX+0mQolbCdC5/WWyIoVs8ob2G6vAR/6cmKdYfuy1KxvN2Kmpy7/Ys7yiz+FYFS8lt1hPeza/AJddwKyrlcCVTsj5C4ABZBuCGrB/o3iukQN/TdPbNY6Ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC+0CivQwFaVmzF0Rucm+NRWZ6WjJbQt2jxwUZYJH8Y=;
 b=e2gBS51SVY2XbVwht8PyhDfAp5ZvjA2r4jIYAF1QwgP8tIOKj27bj/5OyCJFZrNYDo8Zx1QZSpxtBy9VXNbKn8BW8ZC0To71mMxr2I7prA8s4lC5owB7RNlS2nZLBjH7p1xZwf8skMEPKbTb+L3ytZ2ftG6qJ7ho1nK6lhrJU40kwdIu3uyIKbuOX5BoxYyirnuEPwY7AV1k2RyjcCbZ5hPCts+MC6Q4Z0LXjBGZLxp5IakbRovDp0aGNBFkF9QrnXGXHhrxlIuVOSHC2Dt2nB8B+MikqZ09KKOW4VEZ2+OvvokEiHEqSmw+pEFGzRBVL6rVs8kyOR9AzkZhXk6DJQ==
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
Subject: [PATCH] gnttab: maptrack handle shortage is not IOMMU related
Message-ID: <e28eea8c-fd54-c3a7-a10a-5eeac2c7a8a1@suse.com>
Date: Mon, 30 Aug 2021 16:27:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b1e4abd-8e30-49ea-a6bb-08d96bc244b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191316459D92FD358F84A15B3CB9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bmcjIKdzUlVs5VeZHb3/lW+9PNfjU5+ZhpHRKY+5zz+2615O3B6T0P3zmgMIYQ4IcbtjJQqY5kEzBU8Cv0O9dbDKiu1NOW6e1c8CmpeH92UxQ9oyJAr5QH7KZSScSVJ1f1cCaD+E7tPGpCadVtlNbFyJXkE5J2Rr5L8kCCgdJQP0JTkr0kb35q0QVusFqT0IAA2mOdnwzxXiFbGfuDfyZJAEEE+TLfh6+5jJPdo7nNwN2YLb6MMqwHxZ/G+ieNBdmNbvImzeXZT1hnUflhIy1ZB2TN9pCuQGAX2pfYcy+A61vCTQsOdwzJRcpYu2NKyZ5R02/Pc4NP0pgNd+GPVf8NY9395LSESMpgJzm0FK8/K48oqo90Q+cPxwt0J6ybyJXKtS6NFegkMmJf6GmFlHmLvpM0qMtju833TnR9ot7/k14bjYvma8RVm1AZ7F9Dt+7LEbvT6Nr8aH3ohIoPyCbL4BVeflXD4hwhOx0HT4ood08YlITsryji91l4013/Vs9UdXS+NfwK1gzSraG4VUF7y+KJzM+E+27Ff9AuWSgv1AI3SQoy+6Pt+3+Nj5LVFMXX14xNJKyXC85v+hwGGiBWDtCiETwzSU0rFhYVxOtZGvxUoMpEMonu/iUhaCJ6rryGmgg7myvZPBspqiWXTuIOyskDxwzq4ZC3z14EQohjI3AtF+7elMrW3OrDKRTYwiRS4A1gAxumWUwAwrFWJa0kZI5vNjE/brufrsQUyKDPF57WAPxQnbtnnz9/FRHx44
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(6916009)(316002)(36756003)(2616005)(31686004)(4326008)(26005)(186003)(16576012)(54906003)(38100700002)(508600001)(2906002)(5660300002)(83380400001)(66556008)(66476007)(8936002)(956004)(8676002)(66946007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VllaS1dCVlJFL2RpUXRpdkxTcldodUcyR09YcXpCaXBnOWhRMFpUZjQ3dEtk?=
 =?utf-8?B?TmhjcFhHSHU5OWdlekhmSVhLaHNPMUNoa2FBY04yWnIrMkFXSGhkVlV0dUxO?=
 =?utf-8?B?OENBOVU5WVlPSzdweHB3dHQvdlliNEhVeGRtOXprem1nbEliaEpZS3lneTlu?=
 =?utf-8?B?VGFLdHoyVnVsWUtEUFlFQVU2bk81c0J0bVZjK3JmdmM4QjVTWTF1UXBUNHpW?=
 =?utf-8?B?TDhvTnNVdmt5MnY0NTRiU2Q4MXFFRmFVU1RiYS9qUUc0WlVtVkRHSWJBQk5N?=
 =?utf-8?B?NnNWNUtDaEhDTnRFOS85OTA0YWhHUUE2Mmp1VzZTVnpDMGtEREdNQ0xVVWpF?=
 =?utf-8?B?azJZM2xYK1FjWDR2Z1FCWG9XanlIeklnbTRDT29pZEQwb2VCMHVkN3FRZnd3?=
 =?utf-8?B?L2FLeVpmdnhRVjZPTVgrdDdFUU9XQmJiWHI4R0d1dklZVG5mMThJVHhhb0Zr?=
 =?utf-8?B?Tnc3K0x4aW1QZUxlY2pLZW1YRk15QXJJL0wxcy9EV05rdFBoNnBFM1ZqeFlj?=
 =?utf-8?B?YnoreGNyb2swMG14MzlBc01tSDJ0Q1J2NDdMcHNocTNvclFqTkx0TDhzdDFK?=
 =?utf-8?B?bVNBVHFHUTQ1czVFcmN2RU1jRnRWQnd6QzM2N3EwOHI5SmttRWVNa2xBZDlv?=
 =?utf-8?B?L3BMSXdtSWZ6cXZTalpxbWNhOGcxRlVwZEtyOU1WOXoxaGR0OS94bDNjY0x6?=
 =?utf-8?B?LytwNjlYdFlDK0JvcXF1eTVkcTVwa044eGRxNUN2QmU0TVRsWnhzdDRtaUFw?=
 =?utf-8?B?Znd3c1JpMkFhcWVEYzIxYm9wcWhxS2pyV3hTR3YvTmhkUGdoam94bDd6clI2?=
 =?utf-8?B?RDFheS9qaWNWcDB4WUtZVGxXOHRHb1dyQ2tOc0U3UFpOWEhkNm9QQlkvRkhP?=
 =?utf-8?B?aGdZUEVuK3A1R3BQc1pUOHNncjdwc3dlVnJuaGxYMUxwYWlidWxySG9NV0c4?=
 =?utf-8?B?WVNTcHI5S2R0TGJOL2V0bTNtNVdzaWpMUld3ZUdvSzJkYXRBMERBNTFrL3lX?=
 =?utf-8?B?Rm1Yd0hPaWtxR3NPc1hseVc4WDlPamtqZGpjQzRJQXRqNG5NSW5ZUVFBV042?=
 =?utf-8?B?L2FLeWd6UHNOQ01SZ01KaG40MGhnd3lpQ0NiUk1EbmNhU2JQT25zSXIxcm5Q?=
 =?utf-8?B?cFE1WUFDUk94YlpkamI5L3laMlBUdUJQUHFUVHBIQms2YWNYRytXdHRqUVRJ?=
 =?utf-8?B?Q1VxZlMxWnVOdXV0blVJWExZQjA0NXAxMnhkTzJkdUNvSmdBMVM0R2krWXIy?=
 =?utf-8?B?SDFWZHVad3o0ZDVXTi9CQ1EycUFTVnFTSWhDcVB0eDNqY25paVZ5U1I1L2ts?=
 =?utf-8?B?LzVSNHozOXhwSUNINW1BU1RYek9wdFcvNjZIc1Z0RzJ2N0didldVWUM4c3pL?=
 =?utf-8?B?dThTYVlzYWloVWxQOGMxQzhqMnpqRG9rK1E0U0Rxd1VscURqLzUxV1lTc0Nr?=
 =?utf-8?B?blhldzlVbjkzSTJhazFqcWtIOEVnQXRpakt1UFZoamxSakx6WU5SRkJlL3lF?=
 =?utf-8?B?dkRxcFBXKzMraHhwZDF1TExScjUySjRBQkJDUFMwQVlpZkxhejQ3bzZQekVX?=
 =?utf-8?B?aThzNlZzTDUrQzBxT3V0RFUvUUw0Tzl5QWg4S3NQbm9KdWd6NCs0TUdYeWpr?=
 =?utf-8?B?b0oveW9oWFRXeGROZXFDQkg2ajZBdkdyekZLb1BZejgrckhNWGNRd0tZQnQz?=
 =?utf-8?B?cHJuVm85UHZrWTdMUHgzdFlTUDRnK2E0QmR5L1BkeXRzNDVieEJvN2NRYUlB?=
 =?utf-8?Q?ESOnaMPhgHELtReN4Z1Buj7KqMI11d3zX8lwV34?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1e4abd-8e30-49ea-a6bb-08d96bc244b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 14:27:17.0570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgAE1QixdAuoAw8QUnRDkDlabBU7fWiaKNGG2FsjYGqD0+fYSdDWMOeY3WyuKBoOLGb9RSTP8cHvzFhY4k3e9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

Both comment and message string associated with GNTST_no_device_space
suggest a connection to the IOMMU. A lack of maptrack handles has
nothing to do with that; it's unclear to me why commit 6213b696ba65
("Grant-table interface redone") introduced it this way. Introduce a
new error indicator.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Or should this be a more specific one, e.g. GNTST_no_mt_handle? If not,
I would intend to also use GNTST_no_space for -ENOMEM like situations.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1027,7 +1027,7 @@ map_grant_ref(
     {
         rcu_unlock_domain(rd);
         gdprintk(XENLOG_INFO, "Failed to obtain maptrack handle\n");
-        op->status = GNTST_no_device_space;
+        op->status = GNTST_no_space;
         return;
     }
 
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -652,6 +652,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flu
 #define GNTST_bad_copy_arg    (-10) /* copy arguments cross page boundary.   */
 #define GNTST_address_too_big (-11) /* transfer page address too large.      */
 #define GNTST_eagain          (-12) /* Operation not done; try again.        */
+#define GNTST_no_space        (-13) /* Out of space (handles etc).           */
 /* ` } */
 
 #define GNTTABOP_error_msgs {                   \
@@ -667,7 +668,8 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flu
     "bad page",                                 \
     "copy arguments cross page boundary",       \
     "page address size too large",              \
-    "operation not done; try again"             \
+    "operation not done; try again",            \
+    "out of space",                             \
 }
 
 #endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */


