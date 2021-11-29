Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7CC4610D4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234350.406720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrceP-0007tv-QO; Mon, 29 Nov 2021 09:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234350.406720; Mon, 29 Nov 2021 09:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrceP-0007qv-Lm; Mon, 29 Nov 2021 09:08:41 +0000
Received: by outflank-mailman (input) for mailman id 234350;
 Mon, 29 Nov 2021 09:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrceN-0007qp-JI
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:08:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f094ea7c-50f3-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:08:38 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-YIAlUmYePE2WFC_oVZz7aQ-1; Mon, 29 Nov 2021 10:08:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 09:08:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:08:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0033.eurprd03.prod.outlook.com (2603:10a6:206:14::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Mon, 29 Nov 2021 09:08:35 +0000
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
X-Inumbo-ID: f094ea7c-50f3-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638176918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YSB+a2Bm8+MSU2NHAkHPoh58Y86krjJ/bifP8U6f9JU=;
	b=d4C6JQ7WuzLbCwiaBxRMbpV7L1Q2AV8ezVqdZ4hmb4QBgxUf42f7/xW0o71vVVUCvQtKLG
	nqefFx/6+y3fl28mP3WrIjLOTG5Lu6Ju8HCVHs9LX6i9Xm1YE/lGvSUsqY1EdQ1aTQDAKi
	rqeuMbjlGUrQmJ3aOgWNvfPKOYlswIg=
X-MC-Unique: YIAlUmYePE2WFC_oVZz7aQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFNTd6K5HPBuLJfHpH+i9nlhsOHMRLLnDH8CoebzcN9yQINIA3dSosDQLjzu1nIfKwKz19UgrcqOU8Pozrtalu6nw+hF+ZmRbSleZ9xGKVESwVTtu2O5yo+GhF+KcunSKCsz6AxsmKWXNhDFni2xVtx1ZJCYX0xr2xw+8CIzsAHwhkAFH8DsGOlPClngwxgXKENzgkNQOwOA9u9JQwaACP3+RfahpiTCwfzyNYKH2mqDREcNpGjZ20LYwm90Ziy7HIcFRd3jrMecO5yy7qNbPH207eSzixgufa/7iZrkE+Ylk/p9vTSTqlS/OS/PRTIfN0KeeNlADkZcjLB0GKdd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSB+a2Bm8+MSU2NHAkHPoh58Y86krjJ/bifP8U6f9JU=;
 b=npRyfVDvRbmj3h22vGqthiIMRN12Ly7U1xXgvXtP+pziH3r8iCo4Wjs5R2NXyHHZ4I0C6sH6QAJTGa6Rz3PcLG8JDJAyoANXZfy+YOySjoXZNUwKgwjsYqyTt6DzTS/uts26mVPpquLiKkvcypNvx3GSY2TVtQsKXQiqhDIcE7fnCcsqhFxvZsBDOhoq1ZxNo9Glw+WH1mmRc3/izBVTLt4aIxfgIOOH0/2tp1PK/1uGciE7YOXEzTF93C0co9oMopMEPWigHreYYIUmPZ4PCJyb6CfFvfwSLMYN7J+yfSYbRXulnr8HMZd0AZLJdaV9USBosrBSvTL40fmHHwJhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
Date: Mon, 29 Nov 2021 10:08:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/vPMU: adjustements to vendor hooks treatment
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0033.eurprd03.prod.outlook.com
 (2603:10a6:206:14::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304351b8-3ee1-4a25-fd1c-08d9b317d33b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB546973EB5F86E6EEBF4C95D1B3669@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n6QufKEp2z5XJuWGqBDRmABExbf/BeWCyTGMgT8PFCOQIFRd49j9sbdQSTZu6tmAzmgu7RxDNkZlGs1qxZsGV3AGxFSR74Z9R2yCnF1S52Me5T0W38ZMcN1a/jKrbX7aHvd6Wd7pnvAtWKeH0Ywlx4YS5m5xYjf6CHwNmuWTXDtzzu1/PeDgEL2J7Ht+8U1Xodzn/BxeJTK0esWQ4YJKNOu/JsxLRR6E5ifEZAIAPORw5EZEVGg8cTNvk/TDi61A6AsS3pIG13d505R0V6wjPYVH2x37nYXzhn3Q3+IQNLcltBCV+Op0Re/4LN7y921cFU0P4rjLzkF4I8JzVeOHLL4dQgpA0poDQe4B2QQC5dsFS208ESPNc5pYXAyDzmYG07yMNZ8KUxRQv2rUbmvTVDSoweQjP0i+vXtB465AJve2Gc8jYfOkEVqX96mVKdhKq68LrKlelDD+7viJByvWK9452zyO3aJZXOVvuDQwc+NAFChKQMnWamHkXww7jObLl92LUcVkJe3CJP0tvPb+Hx8PAF+NLLn8dRWdzCsWwyIsD5NAkWbptuX8y2/beICu86ISrEndJKfT7+5m3Nxq8XQEX2EWXgyH9+v1k2OKRKZm273/XcOPv/nAl6+Yum6GMawwRBASfL+HMVMlVPvPd+euQXkek5QAMeQA3HAEBQ6SdhCkVdt0V+cvB+mllyxnTggBv4nNFJfcOmxwfUEXUFmbrkTckjiTVwZVi/0T7oB53yCyd4g5THgyFm294brjZa+EjeQhb918jjGhJExgFK8jpTWGbN0rAgaQ6aCoSLIm54HwgbTGZzKGsQa+DK4NRYC+7n7T2hwrpppaTlU4tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(5660300002)(31696002)(956004)(2616005)(2906002)(186003)(316002)(36756003)(54906003)(16576012)(26005)(4744005)(31686004)(8936002)(6486002)(38100700002)(508600001)(4326008)(66556008)(66946007)(66476007)(86362001)(966005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2lHa3JrWWpreWhkYVF4cFk1WTJQMzdwKzEyR3VjcnVEQnYyNXZ2eVJNQkN4?=
 =?utf-8?B?R0tSUW1Rc0FpY0ZFT0hOR2djd1RHYlVpaVY0OGYrQ2x6aUFnNXNXUllMa0FU?=
 =?utf-8?B?Vi8zMWI5R1pPT1gyRGRYNTBZc0s4eXdDT2JoazcyREZLOHBkaDhKYVRHMUpG?=
 =?utf-8?B?VnNwZWN4Q1M5QmYvcUFsbTNScXhYVnd5dFRMQlMzMHBVVWJKbGZ5N0ZDU0Fu?=
 =?utf-8?B?MnJVcElaeXgveXhjVlg4T2hDR1oyOGJpbWpNeHJRY0JrbXpERE9HdVVGLzQ4?=
 =?utf-8?B?dktvMUgwNG9VU3FrMmhySUJKeUZ2QWQ0YkxGODltS0xkYk8wQWp6NVVqS2VE?=
 =?utf-8?B?a1hXVG5RYWRYWGhBKzhORUJFOUs4UVBnMmZyc01KRmJOc1dhOThhck00bXRw?=
 =?utf-8?B?TGxtdjdKdXZCN2Y2ekxpeFhrcWpBK0I3ZUl5UTFjR2tsczdpNndnNXRmNHkx?=
 =?utf-8?B?Z3R4SytITE42OXA3VnlUZWwxcFRXL2Z5WnNQS0kxZmhBVEJiODY1dFpyZ1U3?=
 =?utf-8?B?Sm5Ud2tuQ0VmbXpHcUZhelZuN2JVTzNKNW1YN2h4NFYwVk85SDlXWUlTQTMx?=
 =?utf-8?B?RzZsRkx6blRXbC8yVGxYaFdlYXkrNldhTjFieFZWNlpCcmovNmpLeVpSSG9K?=
 =?utf-8?B?TWd4RkVNL2hUMUU3bjFuSnUwZHRqNXNBRFhheUVDQjFvckpRL3Zvc2xKdUxL?=
 =?utf-8?B?OXFjbVJUcUxOK1pRNUp6YTJkRUk1b3BGdkVJSWU4cEJPOWRrelBaYklTZ2tY?=
 =?utf-8?B?cVV3NUlCYU9JQmtqNi9pWTZDLzJNOXFpT084Tk9iNFAzRndvOFR6a3hnNEI1?=
 =?utf-8?B?SnViNE8zcUw1WG5rcDcyZDVqUnNYK3VtekpGcW05M2hEWEpMb0FnV1ByeFph?=
 =?utf-8?B?TXV6Znpudi9nbDRFcEQ2OXArSm92RWdxRGpUMTZQNmY0b3kvT3lRZlhBVHpu?=
 =?utf-8?B?dEZkY2xnbS8wVks4QzdpRk5lL1VhU1ZxbHRJZlhnQmRDRnROOEVXamZsWGk4?=
 =?utf-8?B?bmtsQW9Wb3diRkVtQ1F1dmp4SkZJZzMrS1FlcUdQdkVuQktRNE1CbU5yT1Ev?=
 =?utf-8?B?TXVMalNLQzFTNm40UzhrVWZNOC83VktxS2Mxb3Zkc2Ntc3BEL2RSdENXeHRB?=
 =?utf-8?B?Q2FQWDJCNktEbTd4YmRCYndHQ0p6QVA2MFBGbE9ueFhyejRwVXpZOU1iS0NE?=
 =?utf-8?B?b0o1b0FhcEw1dUcxZ3RtQXR2QW1vclprb0cybE9qU1J5RlVOWUZEM1BUWm8z?=
 =?utf-8?B?dnlLbnQ0UWRCVEwvK2ZpRXRxU1VmM3V4RlQ3WG8reVBjaVZPaXVwMkgycE9h?=
 =?utf-8?B?aGNscWhjSTNPS2RaYjZEVFQ3YTkvOEVVU29ZcFRUQnE2ZmF5OHpKWmFnd0x0?=
 =?utf-8?B?V2hlc1pyR0h0ZXFZMkp3Tks5VnU2T2lQcXlvcEk0SkMyV05QTER4d2VIZVZQ?=
 =?utf-8?B?K2tkdXdJOCttUW83YmZiQTM4QVJ5ZExUY1NDdGZscVJUZnMwRWRDOEV6Mm9p?=
 =?utf-8?B?M0JSZnI5b0xEY2tVV1JTMlJuMkowcnZZYjliWEVGRkVmN3JpOUcrTk9yVUM3?=
 =?utf-8?B?VWJVRExZQTZHWDBCVVlXUWpBNXRERVpSYjJSL1IrNVVNY1hzalZKYVYyb2I5?=
 =?utf-8?B?YTJKbzMrME9QZXBRcVhTdEJvNEFsVmtiMElldkYrbHB4eSt0bWNYVEw4cE14?=
 =?utf-8?B?cmFBaXNNS0lQRnVkWk1ndTdBejZ3WVRxQm4zUnVBT2tWS3NjQU9MMzVLc2JO?=
 =?utf-8?B?ckowUVJVQm5iajd6V1F2bGhyd0FoWGpUTW5BaC93bG1DeVNaU093TzJwRS8y?=
 =?utf-8?B?R2pjemhTNmZnQVlONGgrbFdUdWlZcGhnc2VrNHMxaE42N3p5aHdja09MeTlK?=
 =?utf-8?B?OXV0QVNqS2hqZ1NOaDE3M0NlWHc4L0dxVEd4a0JFc0ZFQVBrbFYzaEF4cDdr?=
 =?utf-8?B?Wk95aDB2WWtRSzltSkZXNDdkODVxS3lhZ1VlUGxoOG80dWVXTC9TYzVrUkpr?=
 =?utf-8?B?Y2ppSFIxQlhmZlRjY0FOMGVkSG1OWklIYXlqOHZ4VW42cVhOU1l6RFFsUGhr?=
 =?utf-8?B?TXF2VUF4VXY5ZjIvM1FWSGpYT3hOR1hwZDcxUVBhVCtPbnhzcTgwcTlLWU9x?=
 =?utf-8?B?MWhhekdmajBCNjVpdWZIRERsNnN6UGpHbmMrK0JVVUdYVUkyOEducDlyR1Ry?=
 =?utf-8?Q?hIBUIL8+OUVyUv5uCkDBoe0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304351b8-3ee1-4a25-fd1c-08d9b317d33b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:08:36.0808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbvomHsN2CbkYAyBUJxPXZVISIn3guuGPOOKF1I7hquLERdRDOGNa7yIazv+PtDAYRttrF4/1XxIn1TPBMYBBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

In the context of [1] the 1st patch will be of interest, whereas the
other changes are a result of observations while doing that conversion.

1: convert vendor hook invocations to altcall
2: invoke <vendor>_vpmu_initialise() through a hook as well
3: move vpmu_ops to .init.data

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html


