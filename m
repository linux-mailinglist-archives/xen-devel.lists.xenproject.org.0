Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AB414C26
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192857.343550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3LY-0001KU-OC; Wed, 22 Sep 2021 14:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192857.343550; Wed, 22 Sep 2021 14:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3LY-0001Hi-L2; Wed, 22 Sep 2021 14:35:40 +0000
Received: by outflank-mailman (input) for mailman id 192857;
 Wed, 22 Sep 2021 14:35:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3LX-0001Hc-Hs
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:35:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77d6846e-d7bf-4955-ad5c-c07b5b98755a;
 Wed, 22 Sep 2021 14:35:38 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-neNgteJyPzmPOnkWvFKIxw-1;
 Wed, 22 Sep 2021 16:35:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:35:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:35:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Wed, 22 Sep 2021 14:35:33 +0000
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
X-Inumbo-ID: 77d6846e-d7bf-4955-ad5c-c07b5b98755a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PUIBynGRaD4WhYXwQk0I8TmQPV2fkMGcbu5cWr+n9H8=;
	b=G0u5zGv87eEYW+1AzVeR2yPxeEzvtddA1wKQIZcPNb4jQKr3pYz+txSs2d+Pxvi9wqUAkj
	nleKVYbn6tezB1LJ8NPoQwN3ErH8M0jaUcQWzpOxA+ncALguGwkY7IjvZbBY+4UEfJoSqh
	tj5ljrMI10pEbRnwM8oIfzoOi+J2Q5Q=
X-MC-Unique: neNgteJyPzmPOnkWvFKIxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9wKV06h+UOk80WmcgiNf44dt9xbVtplMA+/hl0US7J+YOsk47JIQNYLekUTA5GdCZCtEW7AjYZme0ky07fW5iJES4RzsjOp1t1FXmFThP6/XKd9HfXHxELaMfePVvgyQxVciFN1FCbf596wz0kkFqIJzEbMLyXElkmzRYShPZk1kc30S/v2IlRJ6bclOs2EbQ5v2b1GKbD+RQzE90+/OEN2FyF1bz+0Qzqpt1wAdIoOtAWODm+GkXL15SRmYaPOA3IiPBbtJUexUh3kyfrG0kC4oCnbnTUNCtoeNLGz5HqN8ROPGUjy0ZGD2QX1jsUWgKzgkqJ2X1RosisQj9aEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PUIBynGRaD4WhYXwQk0I8TmQPV2fkMGcbu5cWr+n9H8=;
 b=C0BIODhmbNDA7u4wM44W4HQlRQBKlOjtdto5vrRz/9fDjB12G6zZX+481dbojdNeauKDhjWfdgDMUYlzZBO7XCA0ocFEKtdIOJRA0566G6V/ihdt8hiEN0wmQBZMRx4EgxcOhHvyJskkxRqgb93bbfDTweJwDT427dhD6FxsAKv1oXcxQ9bO08mxwMmwLz1pjxbgs/jiVAyk9E3rM0XhYG97/xgGOatD6cWIm4OAe4YZbO4LWNHsnMbkS7Mi4s+BkLkeGRltxJ4+r2X21e5knmIgdAVmGo+ZAui9hRVAqmKrQHTe6hjzmWNWVYsbhIn+aCIpgzbJz0m5XlJM0GwugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 0/6] AMD/IOMMU: further work split from XSA-378
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Message-ID: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Date: Wed, 22 Sep 2021 16:35:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ac2364a-d34f-4556-8d04-08d97dd63c6c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445CD4C4ECF6FAC3C441ACCB3A29@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QnzWUsKlyHHklouxXlcIHYPAViwWIvCMIzrItz0CRDgc5iK3dfH7FjWxYM8liozol2es4AGUAL8kWyjvZWJab3x6LMxt4iUk5uyX1+0N+hzmTzWc7dIvquPqrifh1g8xCKB+nS3jIdBu+WswKt5si01dTXHMW2Ap0UmnWHiBlkCm2R7u4HtxtS0VOl9za5CrVQoiBpYtG5sD5npvU42gdQIvSpjFi1LCOLRi7OLqZmxd/pXqnElk727DwtNeY2ZZKxLNWqa7o62wLWQzN9C2NDfsSiEN4z3FvSeKvwq7/6zRLhaplBQ/7rLF6abyrRZVlrVJuaYdrxh73X8av/Cp/8af8srqJ4HXJpYDh1RCZSLOizOEsDLM5OkkvHE/mH/HP+e+BD2fong5PCM7UOtPz8yMGeOAZkLVw3ngElZVu+jsCq6xgocw4ZZ4JkCeFRXBfmTa+giFZ0O95Mhp1U7j+a+t6c7erHVf1NyvLFOx0qoD2tCDk5us+ch5XJ+R2yq2fXifpGckUPYc29fwMg2LqaSjGTPE6ia2+B2tbl5foc4TFcVKXraCxT2ZYtIxyT5CVnnAWkdRa8NVxmMxNz4RtHL10tfQM0dIiQmlqIf2h3y2Alm38OqxU2GFFLKgQl2sdK1cHrZHbIcDAvJ7anZ1sUmNVA1w3yIRVA9ZqtLBQD+vy+DbDwFVeiqg25M3tqSFn6WjLZjrkHDCRu7B7MznBL4iBsjIormJ6t7cPSElMy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(5660300002)(4744005)(66476007)(2906002)(38100700002)(4326008)(6486002)(83380400001)(2616005)(956004)(26005)(66556008)(8936002)(31696002)(86362001)(6916009)(186003)(508600001)(8676002)(54906003)(16576012)(316002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdDM0pPcCs4UHZmS0drSGRqMVFYc1M5VlVpZXVldnIyak9BdlFTRFZ3amtM?=
 =?utf-8?B?YWZGdkw5c1hQcWE4djZERzJvN2lTYlZnTlFvTUhQTGQvbktQTXVRa3YvV3hM?=
 =?utf-8?B?OFlXRXo0a2RjKzlmRktFOUFVU2hBMlQ2RDdEOXNFUlJiN0VzaXZiamJ3dWRv?=
 =?utf-8?B?WWt5N2FORlZKMEphYUwrV0VPWU1vclREZHljREVURFNoQ3JROTc5MWZqM1cr?=
 =?utf-8?B?c2hCakhmU2hNMlhoVWFlVElZVFFCNUJpWXZVYy9aeUlpMGhiSmVDeTFCK3Jv?=
 =?utf-8?B?M0pRdEpUREFaYVJNOHRDRmFXczNSSlZXVkZWeUxwS0k3YlB3KzRpc2lIdGJY?=
 =?utf-8?B?U0orc0Q5cGN3bmlvcnFtOHA1ZjJVeUY2WVBWVkcvYUVxeVAvZmJuaXFLWGY3?=
 =?utf-8?B?cFNDQk02QzF5QXdzSVI5Mk56T05tV0c4ZXpHS0dFUC8xOGpXZW9ESVhJNVpF?=
 =?utf-8?B?bHo4UG9TWkFlNzZLeUJmWjFFZWJjeVNnVllkS0NIeVkvVHMxMXNFUlFUejla?=
 =?utf-8?B?ZUhqMW9wb2VFSlV0SDYyZEdEYkUvVjFqZVlJdUFuUU9WTm8rQ1FBZGkzdGov?=
 =?utf-8?B?SmhGUXdqbCt3bndQeGZ2TGx1UzZ1MmpnaEZ5bGpmSEZERkdWb0JjcjRUTXZC?=
 =?utf-8?B?bG52VWp1dEE2Z1FpTTNyaEcyZWR0b1gzWFVhOS85SkRMSzJrdTBpa2w4T0E5?=
 =?utf-8?B?dStyT0JmRmwwYWZGVnRRQVRyV1Y0bWQrSWkzenBNdVBHVEtnRUhaV1BBQm4y?=
 =?utf-8?B?dFM3TG9xK0FFYUhDbHlJV0pvWnR5a2ppNHA2N2RzT2V5dkZ2U3RpaDJSR29Y?=
 =?utf-8?B?cSswVnUzY3kycVlsNEs3WGpMbDFXekhHRmc0N3h3c2NZbHNsODlPVm9TNC9j?=
 =?utf-8?B?NlFOeU1xZjFhUXd6bUV1WXVYNzhJRTJWbGVnaWtQaTQrWEY2eGx0Z3hPdUU2?=
 =?utf-8?B?UVF5d2tsYnByQ3Q5UjBLa1JVS1pYWExGN2ZwdlNkM254SlNOR29SQU1Pajk0?=
 =?utf-8?B?L08rdldYcWNqRktxbW9Cdkw2MEN4SWJUQmpHNWVWSkhDQlRKb1RuUVdtWmpz?=
 =?utf-8?B?WGx2TnhCU1AvU1ZETzg2QlVUZW50SEFOSlpZSmNOYWNrRlNmVE1VeUpDbDlB?=
 =?utf-8?B?MGdwQWRDaThyclpLUy93SlgxNXFQOHpRRlZONkQyWFhwamVaUERLK2xWb3RB?=
 =?utf-8?B?VlJwTmxsY09FOWpSN0JsSTJJV3pueHorUVdOZW1LbXZONGs1UEV2UWpnSmY1?=
 =?utf-8?B?Y3dRWGhuaktPSDFaMFVCWExud3BjMjBZeXBMZ1lnQW8xdDFqMmJHZjlQYXl3?=
 =?utf-8?B?UTk3b0h4bU5zZEdOakc1ZTdkTHFDTjhHaTAyTkdxS0VPVGFmNkVNeHd5MFZw?=
 =?utf-8?B?alZHTjZnZUM2U0h2TWFhNjA2UGZKa2hId3YvRmlycGp3czdrd2hwQ0RpSGZM?=
 =?utf-8?B?OWxHblk2UWRVUTY4d1lweXo5QXA3K1I1cWRPbFRid3doZzREanNTeGNENUZM?=
 =?utf-8?B?a0JuTWkwSnM1aTdFR3BqUHFKb21PSTkyc0krYlJ6L0tZVUo5VTVBeXFLdUJJ?=
 =?utf-8?B?cXNCYUR1OTNiekcwRHNPSnVhNnJXenFXdFoyQTNtbVkvVkdWVXpoYkhoUi81?=
 =?utf-8?B?VzdyZ2xTNmM0ME5xRzNtWndqcy9saDgrbWhUYkFzSHBuY3ZjQmF1ei9CVHhn?=
 =?utf-8?B?bit0YVNrTGZIRjdqaVN0Y0FNRzlvMGJOd2pHRW9SNWI4ejdBNHlFbWxkMnhs?=
 =?utf-8?Q?QTKcvV5n69nFWk28k3kCeLaIbHffgFHYmgErlW+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac2364a-d34f-4556-8d04-08d97dd63c6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:35:34.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FUthgMTT64/fIViH7IG2Oybv/qoj+a1Yz11f11QY1gG4XBnu2XOq40aSU7zSOPWAs2D0osUUesg3D1M8FHflQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

Along the pieces that were determined to have security relevance
there are quite a few more fixes / improvements (or so I hope)
which were decided to not become part of the XSA itself.

1: obtain IVHD type to use earlier
2: improve (extended) feature detection
3: check IVMD ranges against host implementation limits
4: respect AtsDisabled device flag
5: pull ATS disabling earlier
6: expose errors and warnings unconditionally

Jan


