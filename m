Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E33BBEBB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150345.278004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QJl-0006Jr-ER; Mon, 05 Jul 2021 15:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150345.278004; Mon, 05 Jul 2021 15:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QJl-0006I0-Aw; Mon, 05 Jul 2021 15:15:29 +0000
Received: by outflank-mailman (input) for mailman id 150345;
 Mon, 05 Jul 2021 15:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QJi-0006Ff-VJ
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:15:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2e00952-dda3-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:15:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-flsoQ6lIPeWjLOunUkVgEg-1; Mon, 05 Jul 2021 17:15:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:15:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:15:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 15:15:22 +0000
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
X-Inumbo-ID: d2e00952-dda3-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CH+Vf0mOEcNpv8wC1iMww0i4+CIzDv1HfwE6AQaKUlM=;
	b=OiqANUkQbOdiIHmuM9gKa1QyMCBgYdPEYyf8LRlB+UTDFZNE0lxDe5mus1Mb+72c/FEnlA
	VQi/nkFozMF1N7iQjEe6KB7rC8Lb/7f4uFMVxFeKx9POy5uoxI3ihAT5PRik6PWhP1eZcl
	v+2h2/RGUGaoAt40XLWNE5zoBuhWi2A=
X-MC-Unique: flsoQ6lIPeWjLOunUkVgEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+X9X469BWmqonNoftMG0qjNl92QLYKGScOC5CzdOqslCYtkfc7X3VsiPaBUYALQJ5BZyegXlgnKvB5jm4tA+Z6yCBwVmopd5T6DMuBYvX+8phnRtNaeeefutLPU0BXXKK2Rcx3/lLCO+tb3JIQ0NvGfrqqljpDNBrulc0ZLH64gTNlzuR4E/NNRMmQL6BXsO9HdI81YnQOe6Oh0qxTl2yc4KFkGxblZ+q02a6lGlgdsD2ze4IgbTY3AmzCYCf0f2eKS+iDPfcep0IyIe03KJztssJnjZZgTBGZ8MA8InIesOkcVbtPV8Y/wXO6cegv9cf0Eq8IdWSvIlFTZezg4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CH+Vf0mOEcNpv8wC1iMww0i4+CIzDv1HfwE6AQaKUlM=;
 b=Z7D5VTzHQlg8KoaEEOq9sTaRRFaglMGjeEOIwRq4+dX1haM9xxNCX3UtKLvnl3N5a5T2ZfmhKKdrD+8LIzYq7WzvtsPj3YUz3TfGBL6EpJaOxeX2YcluTbxuike8UCgOh6NrzYQow+/jB7rb5HkkOtss1pHIYM4JfzGZr0Lv08uhKpdr58M5zlzF/GYProBHrM1B9Iq+B/9r7mhM7K4Cx4WnCOx3qJnkiMHBH02/nKArQwKWJsL3mW4QgWuxgPll1jSW1CZBr41nmbmoJl1e9CratXGiQmHSVa3Nm5H2WWg7BSnq+pp/YodM/h/UQZfFFGxsPxaJXUnS2IuVCVAK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 08/13] libxenguest: fix off-by-1 in colo-secondary-bitmap
 merging
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <cf5b7875-0441-78dc-6e1e-0738d93641dd@suse.com>
Date: Mon, 5 Jul 2021 17:15:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb0532b2-d5c8-48f8-58d1-08d93fc7b5a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743F80FED240E92782E5012B31C9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cSjV3EjNDZv/R50ZleaVGlLUOYOznj4iUk4PNgp/LZPauw84d2GJajC6vMHNKm77/m8lnmhADKXGzhQL3xynZf5qAuRquRhUu8o5HrxEYXlMbHrrm24RCM4Jo5SMVn0CgYrnKzIyfpMQfZquOgpyd2WvslM7Qzm7iwoCRrj1jO0MBmpaoOz3HfWbFkw61QXgj8EBHQELx0GmBcuO+Yd7b7RUcyBHYMeJuszDaL1oTXsV/39c6p9hHc9sPruZHwMAz66HboTh5kaJ4c3z0t+JwEWD833t2lf6LjSApkMkZcGjGYuu4T5vwM7OqB8xfaQ/SuiTjskeUUNTBNBt9x3flqyNzuIu7R4KR4DUUO2EJlphQHSNZOmFpGjdAJvQrwhPq22aHYXZpBNToRc322w2SA/owj3J9M2cX5mnxLxfB8ViRm/4lorXZ4uD+RwcEXqydAHcKz3QxVyu5V4HiMxX/kkaf44+T/0OXzhA1AQSCrd9vk5EPGy+f1rrUqrRukubRSVYpLHPK5dUNpzB+QihPwnU2dwLvx/3yF+RVmlbKfgw4uub+NhTqapJXfu53Hdh7HXGlzM21pUqUTuc20Q/bhn3s+CLXxOo+9+QGS31rHvKXDThsUI9CCSWGXRrk87k3iuEqEGk2Jb4PUsQZpdYtt6XBi3tPqzEGY257G09Dzvy4SeRhyY4KqmWxTyke+aMojhc4FDpjtHIKUONkPZxMrMTJpI6wqWC4W6uj6Hs5cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(376002)(366004)(346002)(16576012)(6486002)(16526019)(6916009)(4326008)(8936002)(8676002)(186003)(36756003)(478600001)(316002)(38100700002)(26005)(86362001)(31696002)(2906002)(66946007)(4744005)(5660300002)(31686004)(66556008)(54906003)(66476007)(2616005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm9LcGd3ZWRod05qY2dCcnp4d2MrcGpMSWRyd2hweDlTeWx1VWdsaGlzYU1j?=
 =?utf-8?B?SDdmWXFSTFhXbkdPTUI5Y1AwS281SmhUeGlOdEU0OTlyQW5aOWprK295dk5z?=
 =?utf-8?B?QWJ3U2l1ME1VWVpFdm0vekZsQzJLUVRLQWgxdW81UjdDOEFtaTZHckc2S3pC?=
 =?utf-8?B?dCtvU1dzNnpXMlpqNXh4VzgzRW9VOUJ2bTQwRHFJVThpQkg5bkxBeWovTEFq?=
 =?utf-8?B?TUlVWlZSMjNNQU9LRlJJS2QraEx6WEx2R0d3U2t6bjluL0JsSkRCTStEQ3Jn?=
 =?utf-8?B?Qys4aVNxUVEvZzJmMTNlbHlLUElhbG5NV1BiSitIYTRHQmhrNUpiNllyYlM0?=
 =?utf-8?B?dWpEVkFmdk9vNnZWRTJoRGJYMEdlQ3dvaWt3dStPK2NrR0JGTWl1WHE5UmZ5?=
 =?utf-8?B?aWd6K3hUNjN2MjFlSDlBaGFEcGlBMC9qL2UrUE1ZS1oxVXA4VHFUWnBLdjlB?=
 =?utf-8?B?dzNLVUNwY0pFMVpuWEp6ZHo1dzZmZi9TTjJKZ2JDUTkxQml3STNULzB5eGo1?=
 =?utf-8?B?NHpGSEFiejBaeUJCRFM4TjZqTmwzN2dIOWhuaGlGVzdCemZBV24zaE9MSG5W?=
 =?utf-8?B?TFYvL2FBd3JYM1JRR3dRaWgrdVpQZW5HQXVCQXFFdE1ramhqdTI5Q2JrcXJu?=
 =?utf-8?B?dzc3R01DODFoOTlZQW01cDhNYUNiek41bzAwSTVmMkY3QWRFWmt1d3NBK3RY?=
 =?utf-8?B?a1d1SmdNTTJvYW9ESVRyUzZ0NmROZjhsTzBremQzM3M5ejdkUjd3d1Y5S09W?=
 =?utf-8?B?NXBwRFZsM2x6Y3RHMlJpQU1WTW53QzVKbFh2aFFHcjJCb2taRktZZVhIUlZn?=
 =?utf-8?B?bXpKaUpqUFFNcVdJUyt3V3NaWGt4eDdEcHF5OE56SFQxS2lkQzdURnYyYmRY?=
 =?utf-8?B?N1dsN1VLYTFMN2pja2ZOTEppcDBXVnRyVmhPWnUxL1pIbW9qRTZnUzVsVXlW?=
 =?utf-8?B?YkpLS1grdXh4a3NERzBUZ2VsYWR6Z1V5cU5jVzFRWlB1NTVHN0pRelc0U0wr?=
 =?utf-8?B?UXh6N21JNi83V3NsY3pDYjBMOTNGTVFGZUd5Y0owYlg5MW4wQ0oyT1VTbU14?=
 =?utf-8?B?akhFdDd1RkJEekpIU1p3ZkVKTmZ2TC8zSUdRY0RLVDRzT1M0bFBTL2F5bTVN?=
 =?utf-8?B?cWExcWhCbXBYUzUwd2lYTUZtUXNIM3RnY2g0bFVyZ2l3WHAxSzJtZU5aYmdm?=
 =?utf-8?B?bWJPMkRiRDF4NjRnWEpoMTB0L2lta0dTd2VSMWlqSXZyOFZWVUFRVVFaLzJ1?=
 =?utf-8?B?aGJmaC9rZ25VMmpqSTVmUitNb0tiY3ZnN3dHQzJqSU01aW5IMDFLcUgzR3Mx?=
 =?utf-8?B?MzhPa2VTNlhPZmNjUk16ZTJnTHdvSDdVeEo3cFpKRnZ4YXBHb2M2OWxyaHZI?=
 =?utf-8?B?cUlQRWhGMVZYMGR5am1NUXRJZXVtcWxzRW1hUVVSRE52cEViYjFJRHl6cUEz?=
 =?utf-8?B?SGpTZWxpOGRnWWloZWNMTnNvR1hIZVdQSTE5TUJSUC9KbnVQeGpzY0hnRGZJ?=
 =?utf-8?B?V3V4aGRHNkduRFl4bTNwKzY5bkJYcjd2ZlZySWJPMmZEWjM0T2R0MnA4UmhN?=
 =?utf-8?B?SEZRU2o4KzlGNElWN0p0NVpBbHR1aGZUSHl1UmExVTZUaHVYV2YvbWZzTG5k?=
 =?utf-8?B?MlFFS1FnOWVBdFZPV1F1ZDVwdHgwS2phNDlESG9FUDRMam1LRUZXUnFRN3dq?=
 =?utf-8?B?cTJqK1I3cVRjMUNwNWIvb0pHTWNxU2lyclpxVkwzS3ZiYmhxcTNTdy9FTlR2?=
 =?utf-8?Q?U12JPzja6vFeAZIDzD1yPwvM4KWx1XYVP2FTm7S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0532b2-d5c8-48f8-58d1-08d93fc7b5a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:15:22.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KejSGj012vB2z1QD0fHT2W2Lui7oEhhWRx8fwcAbNxGCVlM5K+lpzqcMaJcuJZyLEMNFaJLCLDEukPu7uWWWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

Valid GFNs (having a representation in the dirty bitmap) need to be
strictly below p2m_size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -614,7 +614,7 @@ static int colo_merge_secondary_dirty_bi
     for ( i = 0; i < count; i++ )
     {
         pfn = pfns[i];
-        if ( pfn > ctx->save.p2m_size )
+        if ( pfn >= ctx->save.p2m_size )
         {
             PERROR("Invalid pfn 0x%" PRIx64, pfn);
             rc = -1;


