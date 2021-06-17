Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B7D3AB691
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 16:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144019.265170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttQG-0001v9-Tj; Thu, 17 Jun 2021 14:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144019.265170; Thu, 17 Jun 2021 14:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttQG-0001rd-PS; Thu, 17 Jun 2021 14:55:12 +0000
Received: by outflank-mailman (input) for mailman id 144019;
 Thu, 17 Jun 2021 14:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lttQF-0001rX-4I
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 14:55:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c32c430-9034-42ee-a962-585cd50db3f8;
 Thu, 17 Jun 2021 14:55:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-jfqm2rRFO0aPyJlxgz_f5Q-1; Thu, 17 Jun 2021 16:55:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 14:55:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 14:55:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0084.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 14:55:05 +0000
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
X-Inumbo-ID: 6c32c430-9034-42ee-a962-585cd50db3f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623941709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snjY5iWzuh79S0osSNQIhjAsOfAQ8PUKzjU2uTifn20=;
	b=hON/hy2gU0xEZK+j8Ut549LsT8T5072rHT0DLb0GDMUXvBBzqASKOOzC1D9x5FvehLjORi
	0xGxlFDnj1kupsA9OuHFzTMnzh3LQUkilRyvfKcjMs0JQnXYKT4zykZ2sMkfctZuhqHXvW
	KuGLwEE9gSdOFurd1iR3YCPyo8nWLhY=
X-MC-Unique: jfqm2rRFO0aPyJlxgz_f5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8huagoByWlKxedsteWAmN4ibuRYtzuqqmmt5/Jd92bGwgyPjcESP1kBmudD+WLXvwkopONnZhKV/zzYD5g6FJyebrN38/xhgV9nM0e9obhY8FiHgSNnFM3p/CkbIWuGNa1XjaMUGCB6kmuJmKC52LjyjMJ0MMPCx7KKw+RU+HCEVh/QMlR5MubCR1ksBMpfXouxRK4B9jVBZgNJFJjAcwk2bSMTeIjzHFdR8CnHGXYj8M/5Ed5qwa1huzXmrbkUvmeIoR3uXz76AUoO8tDpx+fQNKnUZwQ2OTnn4EoZSY1BI5GOfQprBaoyEx5vy/59/Mg3490VaPRgwLlS5IkuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snjY5iWzuh79S0osSNQIhjAsOfAQ8PUKzjU2uTifn20=;
 b=d6varVBsflxLNoP3KLF8rDKD2Xu5poAuBOvFmIkCx/3i8RGo3cZulU86/2NIUOj3q1PtFy7gPv2oCJbhvmfY0hcCnqO0iNLG8h1FBhLrzxyvDRLJw58ERqaPvKXGc8Vev5ekJMWzHv/bAomNTqcc+mqzcd0Mb8EgLp7pWAVWYiptqmcy1GJHOgv7ErIggfgCjx5ggkBleDhUgLsZ1j/F3sGZbhg38/B32cNa+EB4u9O6+JrlrzKSflxHIHAEmLXAM9fvk9CT915KrX2BNsRA8xbG9c/DZEO1CMKK/cB3MD6fPdhWpvy6eYEF57RmKur4kbdOyxWiaeidVlZIpyUI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "committers@xenproject.org"
 <committers@xenproject.org>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
 <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
 <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
 <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
 <24779.18584.523983.904660@mariner.uk.xensource.com>
 <5537bc9b-0a71-60f0-efce-d0d33301fe45@suse.com>
 <24779.24810.167567.520077@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da901c8c-cef0-e4e6-bd27-dbc21cb25523@suse.com>
Date: Thu, 17 Jun 2021 16:55:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <24779.24810.167567.520077@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b08e7c7f-3b38-456c-738e-08d9319fe510
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190E2F31F611EBA69DF9F8EB30E9@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nTwELHIw8uT/6BchEFeIPiZq0x64pah25chOiI24efq0KiBARzkNutIROuqd0mZgIys4g1PV7/S8optty/64sztjyA1U/1n5YD9zPlbW0Ulfsq2b4YnuLw0tBIekf0HeaNQxpGfao8hW8bvr+Pi56kbXzVkEYGVH7F/Ld4xXTlPMUJ0tG4iFRC/lYU7Qy/HExpBtf6xz8AE53zmkP+VL0mzkaCDneHm1Qbj8b+KVxXyqqQ7XJiuvHXGK0shVaIjz6aZOEorcRoVMjKGVx8aYWQ84uQrIG6XmVrUNc/0+/GbplEnBGS3cmt5j1biMNv6v6eInVOg1uzLp83y+k6ILmpIYIpoJn236rQfMmIq49K6nQQuUw/IpWLs0McBFRqXy9XS1MBCo/Oi9fxibxzzswYA57wpwt6e+JhIwKlVQVhYZOlzSsetRzNdq0497jmSIh3ah5jm/e46xIJUXdSayc0P1PfP5q4F0MK6qgC0EHtp5O7wqixLth7S+vz8FLxGeJtrQFZuIZ1CCYbyo+hcms9PshYnA2hvnzjR43l4KmFXH84VaT+f1vMI66e7HBT7gfKJFJu0EuX41Nd/5CoEoiBtUHr9d+odLddk0vd6qVnZSjEDZjsdlAPe+59RPdJL28+UHIkvM82HVLyg6BPf0zJtK05ZdhYCj3tbOlJLM8fIsFshwFtmmhPhPFv7941aR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(39860400002)(376002)(38100700002)(956004)(66476007)(66946007)(86362001)(316002)(2616005)(186003)(16526019)(31686004)(66556008)(6486002)(478600001)(8936002)(53546011)(16576012)(6916009)(2906002)(54906003)(5660300002)(4744005)(36756003)(8676002)(31696002)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2FQdWhzSElTWWFjbUx6YTZMNU5RRm1hNFliWDJoUWk4TFA3Wlk0MGJXZHVV?=
 =?utf-8?B?RUlqUVIxdzlBNWpjOHRrNmFmSUE0L1FjbjMrd3RJaWtic0RLS0RLME9hU2Uy?=
 =?utf-8?B?QXFrVXg2OTl4Z2c1bGFoSjJvM0dJa1RRRnBDQ3FMTHJ4azVlZlVjUDNJV3ow?=
 =?utf-8?B?dzd4RTd5YzF2RTQ5OWdLWTM1T3BseE9nOVBwaHV4TDdBa3ZIeEgxam8rUitQ?=
 =?utf-8?B?NG1WSGdZb2RsbHZ6akdtcmU3OUloSU1ES0pKbmthWXZxS21QMjNsOHA1NjF2?=
 =?utf-8?B?Q083UFVIWmFmOE1JaC9YSUZBMjV0L3NLZ0RZVG5OR0FORTRvdjBlT0xVcDdx?=
 =?utf-8?B?L1V1QnFuY2FnV0YxYXlKZzNhMUZ4Sjd3RjlGY3luZnZuUzNEaTd3QmxaVmZ3?=
 =?utf-8?B?TGNibEJocEgvOFpqYXZoN2d0RURwc2NObkU3aFpLTUg5SzNleTZzZnhITFp4?=
 =?utf-8?B?VG1vOXR2bjJqSmx1cjJzZ0VKSGZCTEdmbmNDZmRYQStXZGQxdzV6OTJXY3VL?=
 =?utf-8?B?TWZONjVTU29venEraSs3bDZDemN4TmdoZ2E0cmw5TDYzelRlREFMTVpTYTB0?=
 =?utf-8?B?RTF4aDBzK3cxdDlOdU96NC9Yd3JZNEFBQVJVVHZjY2pSczFWQkdRU04vQnJo?=
 =?utf-8?B?OWVnNEluQjdGcnQrWVdwV2xQYXdMOVY3bFFIVDFnOTlqeTIvOEtERGRrdG0y?=
 =?utf-8?B?SFhEMjdDYVlJZFRKa3RqNEVTbitEbHRmVHdxcTBWbXIzSnpiMStISnVGdlhF?=
 =?utf-8?B?N0gra3NZaEROREx2Tlh2SzZlbmpLUDRQQTFkWE9kMHlIZ1EwT2NqRXZTZlNM?=
 =?utf-8?B?S0l6OXg3VU9CS2xrT3A0MmFxU25pL0xXTnFFU1BVSjRzdEdicEp3eHFTaVN1?=
 =?utf-8?B?UmxyRFJFT3NRSkI5VjJyRmZiR1lSNEVMcWlHT0p3QUJhajdXTGtLQUZZbWZ3?=
 =?utf-8?B?YnFBSmNLa2FhdzI2b0tKbkxDU2tVbjJRRVNEcjBiSlpSNnJWTWRjclg5Vk4w?=
 =?utf-8?B?TVdXNk4yK29WV0g3YTI5YzVaemVhWnJBN01GYzhmYUpXN3VCUk1zOFJsOElB?=
 =?utf-8?B?SXltOHpnMlBDa0ZJZmJVZ2R4RUJGSjRoUWVPa0ErMDhyYURudkNSZ01xTFdk?=
 =?utf-8?B?ZWJ2UGV3VDQ4MTBKN2NYZWdGNit6UW1WdWVjNmEyZS91Sml4Rkx0dkhqU0ZN?=
 =?utf-8?B?ZjRQSFd0dysyZHZYN2V6UWVyNFBmZ09IdXA0eCtnRTczVDR5TGlOQVBjRUVH?=
 =?utf-8?B?QloxdlhtR2s0ZXFPT2l1bnduR2lVcTJsVklMdjlhRCtNeWhZaTNkdEhCa01M?=
 =?utf-8?B?cEdGc0FYRGhXa1doWnN6Rjh0QUFLamRKaUk4TlBLLzNqbDc5ZFVMYm9NYm5Q?=
 =?utf-8?B?T0FuVnV1T04yVDhKRXhaUVNpcnNOVmpvVU5udGJIeFhObUtVMm5tSGJHOXc5?=
 =?utf-8?B?V091Skc3ZzVjWGNFTXB3VkpPMnViNmNLVm5xSlphRmlYWU5PSEV4c1J0SHBw?=
 =?utf-8?B?aW5Eem54dFdwTFBnUnl6Z3BUY3FScitQNjJhNHFZRDhIZmtCVWFtaGdickxW?=
 =?utf-8?B?N3NTZlBkY0RGaWxLQmpaVFVXRTdkYmZWa3ZVVUNDNWE2L3VVVXZPeEFkVE9X?=
 =?utf-8?B?NVZoOGVKTGs3TzFDeENSaVdhditTRWlPd0NuMmxXWVdJdjdqUTd6VEtsbDNl?=
 =?utf-8?B?NTZxTmJ3SjJDOVRrU2xyTjNRTnRiVGFCQmloU0dhRGsrdVJ5Q1FpM0JiYlh3?=
 =?utf-8?Q?MCT14d6CmQZrx2IncaMDVEOrnbu9uCwlo+i3DxC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08e7c7f-3b38-456c-738e-08d9319fe510
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 14:55:06.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwYsI+8avKvYRVV2TrnYPtC9q44Dl3p6fPCvd93MWrr0hOn9/h8etMTVlNIZh2RL2W5/pNOSAR6aanuYtM1y5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 17.06.2021 16:49, Ian Jackson wrote:
> Jan Beulich writes ("Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions - FAIL"):
>> If any OS made such an assumption, then I don't think it would be
>> a vulnerability either. It would simply be a guest kernel bug then.
> 
> For the avoidance of doubt:
> 
> I think you are saying that if any OS did make the assumption, the
> resulting bug *would not be exploitable* (by an unprivileged guest
> process, or by a PV backend it was speaking to, or, somehow, by
> another guest).

Not exactly: Whether such a kernel bug would also be a vulnerability
cannot be told without knowing how exactly the kernel screwed up.
But it's definitely not Xen to compensate for this, imo. But anyway,
this it largely moot, as there isn't - afaict - any OS making any
such assumption.

Jan


