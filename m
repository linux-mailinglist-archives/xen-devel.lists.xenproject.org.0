Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB43BB888
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149863.277177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JYF-0001Yp-3a; Mon, 05 Jul 2021 08:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149863.277177; Mon, 05 Jul 2021 08:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JYF-0001Wy-0C; Mon, 05 Jul 2021 08:01:59 +0000
Received: by outflank-mailman (input) for mailman id 149863;
 Mon, 05 Jul 2021 08:01:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0JYD-0001Wo-62
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:01:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c7ca93-bd35-409a-a1e5-06daf2cf20fc;
 Mon, 05 Jul 2021 08:01:56 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-OfGckfCGNp6ZLuaYdH6WKA-1; Mon, 05 Jul 2021 10:01:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 08:01:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:01:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0208.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 08:01:52 +0000
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
X-Inumbo-ID: 80c7ca93-bd35-409a-a1e5-06daf2cf20fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625472115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOFJxj8avjEiD9E0J0VJqC4QnGcKRQ3TOuePJrJC76g=;
	b=SEMVfs9QrA/u53JSWsMJPOdSP9TsRSkNN1LR2vw29IhaRwSpzvim65O11ElVzNfNTuFnXI
	n1vhHUFnYx33MI5Agn5mXdS0KyuPH9sVL6heNQEHzP0chmMrMN4zgphXldgOcFg5nmoTtw
	/4s8J5Z2Abqj8YQ5tnBjOGL2Y8u4iZg=
X-MC-Unique: OfGckfCGNp6ZLuaYdH6WKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gP3dY94oL876o9YnWUUZ4ls7V7Wvd4vpaCx+dvEVWRmLcY1E0flOrNx5Fbn18JwjEc1ri5iJmhRWkAyN9s7iZ4FhFbF2NCD0AMvMd4WDqjGp5RW3xRxONt1NogMa98HXzqlbywvx7/XGXND3Dz3dR5hceu01wnZ0/veo124oGOu8IUKRv0HXb3/TYopPMhJkG2Kvnb5/g4ZdI3uKZWG+Ck7JPTpwawhuCQyVumS5MoCIBCKBG7u6nfazKSAaQTAfpmnLweXp/R/g152u4Ge1gRh5r2QLKCweqgN3wCHIkOZEjNoiTa8snjtryLI1AA3QUn1JnXyxCxHfJfIXSwPmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOFJxj8avjEiD9E0J0VJqC4QnGcKRQ3TOuePJrJC76g=;
 b=KaYxCvg/cNzyQ2qa7rjA678zQmZGDo5QzDvFu34daVjqYO72Bl7FQJXqUHQO/YIDEHZ3VPPSs4NUv8gii5ETxbNzk1+yZ7dEclb4P+QEHUBb3e9ArHqBxf3L+UVMQJr7Syiq0n4Ofo09lfhRnSa7sSM1pSKtQErXf4GbCaYIJTtTf4gjF4jWO8N/gb/8Ma8PO+c9/WZm4G5k1vq5VHVxkIirI7hyruYp0buLsioJxAmgJJcdmrSNfbQHEBKLg0kN91irc+a08Ew/FwuqLZU9GQ3UPp8237FifFwa9N7R6jgIvegooCpvhxuZqho/JkeaZANTXmc+sfqHeJAvyMamlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxenguest: Fix max_extd_leaf calculation for
 legacy restore
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210702190334.31271-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5de9c8cf-de15-ac50-16c5-7c786e8963c3@suse.com>
Date: Mon, 5 Jul 2021 10:01:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210702190334.31271-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58c98bf4-083c-4f9d-e913-08d93f8b269d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445A17899FA57FC545B2B74B31C9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RlLJpJ3lnEidsYPUeFCs6NPV3t3SvNcl1OI/8JU3IC/rppjg3GqL+VF4chHrlhcyKBuLvrwvYcP29UhdTraVPxrgsxq2FDShRWFB9xkZCcuUCR6xQIyVCX9ewp91MN3ZO2+BvHy4r+IQoJZ2nUcq3IDB+AhziS9YbXe6v3RLmcC7DhdgvXe6sOOwUzOyc5Yl1dM88NsNUtTJ3kFAfADe38nmsR8ehr7/vdh0WU3cvT6JTblSXFQbovtVcB3eh7jPncdyiqWyRRYTIz/9NQiy3Gc58/Tat571PrG2i1sQWQp1a3M5yVJbT9zwRjf7B29lf1mAhdhOq946TTBkl96R5xbta0si+zGwd1hBHQeW3r8uSQ/5WAY5ToISNzYw9lDQbIu+0fyDBlmOmgFgPeaUkwhlSH6Hm0RRB+2xxDk6jhWd5CSsBk2Ukq2Q0ZVEjzzfSNE3x70fd9HO7IOzWf6vkj9auWKyMkJ7N0ISfv3Vtczm4XBuacmSwmjh8yf7w3QaTeqMLwzUHWSSKHXf3SsFtsGi12A1CQrKBYtAdLQ+skQyNY/qgYhzW7rQgVQs4Wvcc9IwBTDfDthbGBDA6GeiK+KV9ISNjvTPszYs1Vn2GNUlfwCvDIXdgV0tOtDfv2/vN2+mE323yd8IlTKzXsHvzvNqzyOeKMv+KCQJvWVzBd/vX+DU6Bo3ZPycyaCcjWH5KnkHWQnNBwBn480MHm6AtUCHgVk4RxenB+FpzN+R6zYusCUM3MjwsKtQySCSqQGd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(136003)(366004)(4744005)(31686004)(8936002)(36756003)(83380400001)(66946007)(478600001)(66556008)(66476007)(6916009)(6486002)(86362001)(26005)(8676002)(53546011)(5660300002)(316002)(2906002)(38100700002)(31696002)(2616005)(16576012)(956004)(54906003)(4326008)(186003)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlBuc0IvdDIrcWlzZ2MyUjlNWmFXQ3pWbVRkRWVLVTBZK1Ivb09BMEt4eHMx?=
 =?utf-8?B?dFdhMDhCdkxVTzBJMlp0OEc5QUk3TVhrNXVqNitsVXZZdjlGQkRzQ1h4MEVL?=
 =?utf-8?B?UmZqQ003cWRuTmZQTGE3RzlRb2FSK3psUTVxWTVlTXRKZGU2ZmNOc1pVS2lm?=
 =?utf-8?B?VXEvUG1La09RV1ZncW95WklldExjVTlHY01ZbjJKWCtVUjltZTdrWnNhalBa?=
 =?utf-8?B?M21HUHJvb0gxNDVBbVhUbHFYakRiMGFMS05QSjJSdnlIUXArSVhjeGV0S3N5?=
 =?utf-8?B?WExUaVYrV2VNQVd2c21ZOHFpdk12YnlOaStJYXlVYk92Q3N6amVpNElFTkhj?=
 =?utf-8?B?UU1vVHpDOGxQM2Q0aVJmQnBsejRwa1RiaGc3aldsb0E5cDdrcHRaOWNPTExz?=
 =?utf-8?B?aFR2dXQrUVp0Sjl1TkswOVRtcEdGVmV3bVFCRmorR2JXcmdyQmVRNzl4aFNk?=
 =?utf-8?B?Vm9qQTFhemFCNm54ZVpvbmxabTNKS3JFUmFBeWRUaTlTNVpBbTV3S29WRmV0?=
 =?utf-8?B?dGtjdlV4WmRkQ3NpY1M1Q29MR2pRaXFYWHNDeHYvS3hrdHgwb1BKdzlYM2h2?=
 =?utf-8?B?WGdDZk5iNEZvd3Z3RWZZQ1lDK1Bac2dCRW1kSm4wbWNncDdsdmFVRjBWMjI4?=
 =?utf-8?B?NW4xZmFUcUJ1RHBUdGF0WTdNUklOOFVWTm9aMmFOVTIxWm9keE1adlBnZEZR?=
 =?utf-8?B?bEloZEtZUlBQbnNUNFBwVVpyL0krdmFFSTNXckRwQkNhNUd5OE5BZVBiU21U?=
 =?utf-8?B?dlRTQWs3R2dDZEtlaE9WcndSN0xHakVEMGQ5MzRITlc1Tkd3QlRWKzlPSnlK?=
 =?utf-8?B?aStaNzNwQ3MwcVhKMEgzTmIwbjJ5NXcrTVRxbFFuNVdxZ2g4VGpWOUU3V3la?=
 =?utf-8?B?MjBGTGRKK3lwQTVXb3N5UHJsV0hNRWI2RVVkZitaNmpNbjY1MVcvT0VIcU9v?=
 =?utf-8?B?TVgrdldtdjFlcHRmVkE0WDVDWE83aG84TGhweU1uQStwUkxKcGhqWHJYNWV0?=
 =?utf-8?B?ZjNmQzYzR2NMK2xndC84ZlJWMlBwYWFoMnMwS3UrQXZSMlRZSTBnakVDZ2pF?=
 =?utf-8?B?VzkyT1BMTVBsbEpBbVpUYVlueFFSTGh4ZVJhVldMeTM4TFhDQS9vUXRTQUp5?=
 =?utf-8?B?MmhSekR3WERMVGk0emxlMHhJWDB6bkt1WjVCcjliMVpRSTVTK2RNbW9NVXVo?=
 =?utf-8?B?TjIraUdueGxWb1lGYnZpZlZiOHpaWTk3Y2VCWWxIS0U4OWplcExUVXF5S2or?=
 =?utf-8?B?cU9EdXE5U1NacTVCLzMyMitxWTkrT0pZMUF3RjRpamRXc3lOZ1FTYVlDdGRp?=
 =?utf-8?B?R3lCenBpeWhLNW1XbTJCcTUrQ081a1RwQTIxRkp3OURqK3NEdzlVMkNkNXdW?=
 =?utf-8?B?UVZZd2ZwcmhzSVlSQnJJcm1XMGl3MXllV0VhRi9hYU51U29RYnYvQU1aWU5X?=
 =?utf-8?B?bVR0Tis0bit2SG51b1hyOGZ3eU1XUlpDYXNDY3hvM2hOYXFyeDduY3dPZkZE?=
 =?utf-8?B?WGVhdG1uMW5YTnEwUVEvTE55SWQ2bGhzaEZNQWFldjdPM0k1K0dpcEdZSlN0?=
 =?utf-8?B?VXI5aCszM0JLcTJMc3hEN3NLSFJBbWJPMDNiSmtRa3V5dFpmbFVlTWZ1aC82?=
 =?utf-8?B?bFBRM0hqdmEwc0p0Zko1cGNwdmxsNmxxVTdON3UrdXZXaHRuOVE4dC9QNkFU?=
 =?utf-8?B?eS92dmpxOVRjMHIxdUVUbUxuTTVDdmVuT1NySWxSMkl3RW4vRmkzVWRnbjBm?=
 =?utf-8?Q?UNRCqThJxOwoJ38slR8EwmOOte8LIDL3d4HXPyQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c98bf4-083c-4f9d-e913-08d93f8b269d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:01:53.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuOpot4j9hnLohGPagNV7gBUuvEBVeRQ+CzLji+2pAzltrxD1gOniCPBGGxRxklvMrgNdOtc54BgVehK1gTk6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 02.07.2021 21:03, Andrew Cooper wrote:
> 0x1c is lower than any value which will actually be observed in
> p->extd.max_leaf, but higher than the logical 9 leaves worth of extended data
> on Intel systems, causing x86_cpuid_copy_to_buffer() to fail with -ENOBUFS.
> 
> Correct the calculation.
> 
> The problem was first noticed in c/s 34990446ca9 "libxl: don't ignore the
> return value from xc_cpuid_apply_policy" but introduced earlier.
> 
> Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_apply_policy")
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
perhaps with, as suggested by Olaf, the Fixes: line changed.

Jan


