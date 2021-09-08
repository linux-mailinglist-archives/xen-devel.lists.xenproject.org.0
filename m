Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E663403C9F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182257.329748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzdm-000877-4e; Wed, 08 Sep 2021 15:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182257.329748; Wed, 08 Sep 2021 15:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzdm-00084a-1E; Wed, 08 Sep 2021 15:37:34 +0000
Received: by outflank-mailman (input) for mailman id 182257;
 Wed, 08 Sep 2021 15:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNzdk-00084U-QJ
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:37:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad887fd2-10ba-11ec-b168-12813bfff9fa;
 Wed, 08 Sep 2021 15:37:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-sFYyAxDZN2KxqbFpHhxKpQ-1; Wed, 08 Sep 2021 17:37:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 15:37:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 15:37:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 15:37:26 +0000
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
X-Inumbo-ID: ad887fd2-10ba-11ec-b168-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631115450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DukexvpXsqgxZHDUYNhgpzEDBnXDoedSFIcVjon77Aw=;
	b=XjmyGvQOJZhXKfQtdOLoVhPifQD3BGhNhhkAwp74vkKc6b7hyJGg2h8AjOgcKIgirEL83Y
	84HCBpynexmrqQu2xGxz8Q1WRgPDGFhKuquUWE5dRxiiONsHXdBZotI1LliqCckGAS4qvS
	7DisL9jOfMdr8/Tq/fkHPzMqJfm4jAk=
X-MC-Unique: sFYyAxDZN2KxqbFpHhxKpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+ggfs0XmjxwOcUSC+vyhA58Smp+zTzpEsuzkx9HeDIef73P6S6598eBDjncXaZdM2Lq0/cOWbWoK1mA+Iw+upll4attGjpKHJuxyk6l+Qc756vyGDMCVJSM08pzMIm3xCny8gNWgnmeSN94rl6zUlqZN1dkeSY7U4e8xm/YmPIQMjMXbuhzrwnMtPPiI+mIRgKAf9p0hfIRtQ0AjN0I2Jp7VQypx3VwyRQ2UQ4V8ccpJXi1bKNKdYnIrBvmSEaxsTQWsjHz/BEJw8koo1muTpOEf6EstCrWOBZ4R/VC1c/9nF9nIdWxIR3QPlffEaIBfALnVh6ekNjcZVoYrq6fkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DukexvpXsqgxZHDUYNhgpzEDBnXDoedSFIcVjon77Aw=;
 b=cVZdtev/k3tydGRL9RmhAQKTK38ys3MWgEB0A7Z+1rUp1ShGeI/+/9b0EvoRfdXG+aoJLo2T4zvgv6VlweDVXSXCH3QMYd7MJZ9+tcDPWR3naUCSulytDi0jfGXsv3tX0gXM8nIF2Y7GuRSV8x8R6d1SWveYdqaYuNEtsXeOagsn+A4jdXGZ+pakZoZ0x93buFPhOWYVFK/8SgAjOw2sNZ0phEfwsksPDvYUwn+j7uiOPbEqsfE8XLMXsw0Ev6sWuTVgAvc/c7/snBCTOkQxNxuba8tPZMjyisoQo8EEMDMNIFd1PS4XcZQRV9h7TthXeYdutreSikiq+BQvcxbWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH for-4.13] x86/PVH: Fix build following XSA-378 bugfix
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908151754.9593-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b9c4130-4115-a08a-4c25-2014d021a2b9@suse.com>
Date: Wed, 8 Sep 2021 17:37:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908151754.9593-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce1b94b-a057-47f3-7a89-08d972de8ff6
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384831F28AADF0F60C0D0AFB3D49@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	einaST4aclNrGQMTOhIEzXgSwfYGspo/M5yZ4i9O5B43S+fpfnIsHZEbj3yB7hk2PulnxlS2m/AmEu4CqHuOFwMDLvOSU48xNOVcQkKz9TDH+qjMA0HWGNE9nQLVQz9qTKSDqcRaoqm5nD6P6UobQNvYMcB9OfiyySNTwlnhK+ArMLmXrFRGBNdoKQgyAWqSTZQy2XKglkurPwUcR3w/zu4ixM/CUgYaEvlGkerXtGVGwQd4xVTFLTEZXd95oWNQSgek5K49AvdE/ewLE4Cm8ZGGkny5fUuMxoVwMV0DgFg+SvcKCj97KDOaFyzkiC60814BQ/tXkq/EHBnuOMzOU4Gea6oh7PjzSJ4uDolgwqvlDw0waXhD5Q+39e6fzTtG0F8kKLkyMK4SQ2z1lNDtnH80QEoOty3V2ut6yp4hhnDAj11BA1Kx2D+/rN5YBKcXBf+xQLmb6E2COLl6rQnQHax7JNLRGKm/EHKpcYRmAOSJHKrCtos3u9OVrgNt/Mo1lJu7NdLmnuqjYO2oDTfvbOyeqBjPYz7jlgTPIb2CGnsvE0iCKtmoylU2rGcXO2Ye3uhMLepgms7jwdx9g/tqoecWcOgRcsIdr1ffbTM8o69jTNfIehZo/oGWV2j+8hxSu/ubwviMGyoleoRl7MHLXKVUo66DF+SQfWNsTsthUu3JJkmRV4vADcZDdIEY4olNtLMEFFbYfuqrVu7kxOBIF+6LNWRjil4mGeSYA5IvSWgZl4F6ZomHseF0VBBn+OSW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(366004)(136003)(376002)(16576012)(53546011)(6916009)(558084003)(36756003)(8676002)(956004)(186003)(8936002)(38100700002)(478600001)(5660300002)(86362001)(316002)(6486002)(4326008)(31696002)(54906003)(66946007)(66556008)(66476007)(2906002)(2616005)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlYxRm1BQkFNRzlWZWJVUk9kdXVFRThsSEc0OWVSS2VhRXFPamhvVHlHSUUw?=
 =?utf-8?B?RkMvVlJxdGRvTnY3bTNjc3I5RWtqTXI2aTJhcHFkMzYwRzJoN3FLTTNaSnhJ?=
 =?utf-8?B?WUQ4eGxwRWNrenVUN0J0b0NKL3FJVTZ3Yjl3emUzMlRUSWpwSGo4cU1BZ1Jy?=
 =?utf-8?B?V2pzS29ISUMxb2lQUUUxYUN3NzI2cmxYK2sxZGpuMUhhMU41Q1FRWVpBYVdu?=
 =?utf-8?B?OFJBQSthTHRIdi9Helo5NWF1Ry9nT1FkL0djd09WTzJLN1NsR2VBd0g1OWRS?=
 =?utf-8?B?U0FGUzlPUFN1bGgwMVRvL0tFajR0ZFRIZHFWTkNDSENLMWlHS2VmV0w3dlp1?=
 =?utf-8?B?NUlzb2U0KzF0My9qWVQ1OTYyK0k3ZGozUHBNMEdYb2FkWUtEbWs5WkVzSS9x?=
 =?utf-8?B?enhDU0wveFYvV0dSRW4ydkxPVVBkbloxcjh5S2NUMlh6eVNTd0pFazNjeDh0?=
 =?utf-8?B?elRDUDdURzdFeEJWNlQvQVVHY0lvelRrRS93RkFIKzRuN2Nqdk9iKzMzb3p4?=
 =?utf-8?B?eFRuMUtEU3BNV1NJMURJM1haenNCd3JWYlB1V3VzaHYveUxDNi9idENTYmoz?=
 =?utf-8?B?bXhVazRIMHJSem5FOE1pWXhtYzBUcWJ2VTF3aDQzc3BybG03YWppMTdwdUtG?=
 =?utf-8?B?T3gxeVVHSC9XZ2xwc1hjZkV3OGhNQTZxVVhFelBRb2hhcmt1RGxqc3lMWm1n?=
 =?utf-8?B?Ymkxa1drY055TzlKdE9ISFRtb2hML2NpT1RLT2ZDcCtjbnM4eHJpcWo4Y0NJ?=
 =?utf-8?B?Q0h0N0NDVzQ2YUMxTStqajIzc0Rnb0Zxa2hLbjJodzJIVFJvUW43R0JJM3gr?=
 =?utf-8?B?RmxDRTBmZmd5aDdoWUZ6NFNjcWRYeGZJOU1Db2NRd0ZPMGU0ZVdjQm12WURO?=
 =?utf-8?B?UW5LTWo0WnVqSEJOSGxMT3gwdjNGV2pHK1dHTDFmTXFxeEJYTHJtWGFnOC84?=
 =?utf-8?B?bW56dSt1R2o5SlNva1JBVkNZZmsrSGtjZ25TVnBYSHpJVHZqYTlPMk1TNXlC?=
 =?utf-8?B?NElPSFBjMDJzNUtJUXFtYzZiZVRqVlJ4ZVlWb3pYclk0QzVkMzdHUTNPRU9E?=
 =?utf-8?B?ckREL0dRc0RvYytsekttWVNFZzU4Vm9LbXBHcWQ3U1lnMWUvSFoydVpCdjl1?=
 =?utf-8?B?em5mUTRNTjcwOHdDVWZpZXFRVDZlNnFwVDRlS0NvektqeTBPQWVKeWk4TEd0?=
 =?utf-8?B?cm1aSElMZ0Y0dTFIZmc2Z3A1QlkyeEovbHIrWGJlU0p4SzdLZDhubXZtVXpL?=
 =?utf-8?B?U0J6U3ovQVhwZjdQL3FrdnRMbUcxcG85YXd4VnVkTVRZYmNJdThBczNzVmRV?=
 =?utf-8?B?bk1kR0dxQVdjU1NtVGlmaWtMTm1nQ2tUUGNwVUNEVk0zcXNFbDVXejlrR05W?=
 =?utf-8?B?YnNwYmVwV2FDSXh6M29GZHVxY29RRkNBc1pZMGtINUlneGlNTkRRdzJSMEE3?=
 =?utf-8?B?U2ViNnFEY2psSjF2aHVHNHNtTWFQUXZWQ2hST2o1MW5GQlliSXFPQUUybFh5?=
 =?utf-8?B?amhqUWZrSGF1MmtVSVpuZGxwNWc4dzRlb0xsMVFSQzEyeUsvK1VqSGxOM3dx?=
 =?utf-8?B?bHlMNWVSRFN3NjZ4Q3Niayt1OTNsdTVIQzB4VGtPcG9MS0o1elNnbVZnZ3gr?=
 =?utf-8?B?Z25KRExSQzlZZ0lOUHM1OFl0SjlGUGxuSGN1UmVtT0lBTlFjNi90ak9maTR0?=
 =?utf-8?B?eXp2MzVsalY1ZW5JSmV4QzNvSS8wcXo4MTdZbDFUd3htdFZvWEVydi9XSDI2?=
 =?utf-8?Q?pHQ0VIcAFXwL4oEqU59t+XIrZ7uvvxEpJYCoq8a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce1b94b-a057-47f3-7a89-08d972de8ff6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 15:37:27.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0mrMWVi13H9tXoSUS06GOMp7ml3iCazm6hTL5la7U/HXVgUS7hEY3lWL/1lNn1ZMegnOhbS/n5rsB9J53Padw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 08.09.2021 17:17, Andrew Cooper wrote:
> Fixes: 8d8b4bde3e1c ("x86/PVH: de-duplicate mappings for first Mb of Dom0 memory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

And in it goes.

Jan


