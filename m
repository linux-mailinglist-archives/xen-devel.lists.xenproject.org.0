Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6740C2CB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187406.336256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRFx-00045l-6M; Wed, 15 Sep 2021 09:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187406.336256; Wed, 15 Sep 2021 09:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRFx-00043x-36; Wed, 15 Sep 2021 09:31:05 +0000
Received: by outflank-mailman (input) for mailman id 187406;
 Wed, 15 Sep 2021 09:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQRFw-00043r-Fw
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:31:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a49aedae-1607-11ec-b4ef-12813bfff9fa;
 Wed, 15 Sep 2021 09:31:03 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-JSC065HkMgeJSIW6PzTGHw-1; Wed, 15 Sep 2021 11:31:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 09:30:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:30:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 09:30:58 +0000
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
X-Inumbo-ID: a49aedae-1607-11ec-b4ef-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631698262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mzhn0mvrPIwJZv0btGOpnNToczTHAHpNNtCJ5kQjZk=;
	b=XiT3Z3uKDnokYZSs1+xRmjBLQxIPwj4y+Fekv8Qg2V6wmsC/eVKcbqWqYuri216mC5eiBq
	2TIf7sVXaqTuGFXJ/o3zYlnewcv+zAseku/4EbzKK5ZsZuIACN1W4aKWIjy4lAu/q9KjMu
	H0dMQ3+lpVHc6rdCSm40preqjIO5f+w=
X-MC-Unique: JSC065HkMgeJSIW6PzTGHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpzmGlMzE/tm+YiQjUNksTO4HTTEowf5CViqdMkeYrC0Btp0Z8PmkwjEknVXmZRVKR94KUeFqgVGOOQ2EVBE6kzSA2tgt9OQzdXZ7onX9tZ2iXtbkdh1pSmEV0ZCmpYN9ag6gSKo5NKuG0739MPWUKMbkoX3hIJa3Mvq0Fo2Iw9BqD/dxEoxwpSBp0/d+lEt3DWFw8PlVnkQhx+9ZsCmGWGi/J5DaI78JfDUc1Rpx1+F0uKxWyDN4bD1muxvwNHBPFvAHxu8CPo7QIQ7M/IXf/zmVKUyPlSyuFRnb+IA28lD3tpZymwF9Nx01fZdabxpK5KzwNSnuusW6/wH7AJsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2mzhn0mvrPIwJZv0btGOpnNToczTHAHpNNtCJ5kQjZk=;
 b=Ol0YpJf/1hOG2JSDOIyqDx6F4rWw6SKQ33NP3+tnPvqF2K+wkVq+QwGGUVccUnBrbTBJ/w5PMMKDO+0qkHR1yD72HfBd3D6Y901fkVsJMmzx/vVWk9hR//KW0a/VvlD3dVd0EVj74o+TXTTAeyEGVBmZIfceyada0COYliJ76y46DfjHN9oaHxLLMcWmSTCBIrk3xGWVIw+tbTk7GQVT0UFTpm7/bQZTKboy4bTJVz5vkAxHdq7cTSQT7Kk/LVbT/QEOCWu3vwrx6UaU2umP3EktsqsRFK7awzeJrZp1llKkF/WY4vBF3o4dzVnEICA08TwBKjMn2NaOSZnPNo8LOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] tools/libxl: Correctly align the ACPI tables
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210914164323.14904-1-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5a68380-16f1-5383-5cfa-85a9e02ccf8d@suse.com>
Date: Wed, 15 Sep 2021 11:30:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914164323.14904-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b69ef38-e56e-4407-a105-08d9782b86b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5902AC064D74CD65267D06C7B3DB9@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r6MPjQH2WsguQRqN9ES+0Y2NZj+dbl+RlUXi9k8WWJbse4z9+YQDXJ5DK1dmN4a9sfIgqFllYijHrAI2spYanpcinZ3CIpQNl7CWaP3ES/4gvaw0BGuGfChPvKk2IXLBiVBcqbRG9n/2TnCZQ08jkBp3hMkPjmksPLagpt7XK5QFkEmEzWIbccxVVmcPPuoDDC3A0fbiXX/dMz1uxqiVlxw1wNbKVJpoKPV/jUDtVsGiicZaR1jn+Wttc9HtttoUfx+1yg9FS++IRNv40l684uyPbb3kt4LeFLwo7q5bMyAX8DG7Z0GefGbv3CyTV8aXNzLp8RayxoNDO7cwo9qdiI5SELho1wgIaD6f8ezcYOgBU9y074mFDVxyZsFhwKgOR57jzGjGQoKTRpNqfpzWRP73rhAIcun2X6el7a0O5LnSTLekKeCozOfMbSlDSyHarZfEbxQtFM6wEUyHFEB9jBBrZkn19pK8zuccHu482Bflgs4KW+NhzvJDuwMuShXxAcsiuZGmHxth8zwA+WmQumMa7H8IbdpJv6Y5u0ZRm24NYPfmSSZ1zYumXz+j2UZZ8Fap6VFQfECsr8E2/KbMROl5gI0xxIEvKvSqCvpDXL8ziG8qBVjkwdwcY+0f2eUP2szAhkA0a3bx66nCHiPYeJUkzmqwJzDZBM0v7ah9wstkYEB20gD0emnmgrSE1H1HgH1hSvoQj0y3rQO7VY9DpdvENVvyPvA/n1utqz7z1I9ZQLdYZ7OvuDiqp27lTKiP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(136003)(366004)(346002)(478600001)(16576012)(36756003)(26005)(5660300002)(66946007)(4744005)(316002)(66476007)(66556008)(6916009)(2906002)(31686004)(186003)(8936002)(53546011)(54906003)(31696002)(4326008)(6486002)(2616005)(8676002)(956004)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzBmWlBwdFI2QnovTHRlRC9UbWlTbnR5Q1FWejJoTG9RbkQ1VzJFWGNiZGdW?=
 =?utf-8?B?NW5YMTk2K01wMnZaY0JSQkQrdWJLNFpaS1FDcy9Ja1dxWmg3R01GUFVabjMw?=
 =?utf-8?B?VE94RXVHR2VCOWgzK3VwK2htUUdYUHZjZWRiaFVyQ3hZUC9mNWNNelZFTEVT?=
 =?utf-8?B?K1c2aXlBYUN0dm10NVNVOE0rbzBndDlHaFUybDJteFY3dFBUSGpyNzQxSHBz?=
 =?utf-8?B?RVkvaHZ5U2RYeGpDbXpXcGI0V2dXRm9ZeEpQbnNHLzNEeWtXcE9ldHZEQ0Ez?=
 =?utf-8?B?bGtweXZPL2hTWEczNmpHbS9PbXVNM0FtRjJxS2ZiYnlVRTZHMlBDQ2lkeDJz?=
 =?utf-8?B?VkxoU0NBL3dGSDB5YlRZZWlSdU55akQ0a3FXdEpXWWIzZmRoajBOcmRnSExD?=
 =?utf-8?B?UTJzUUczSDhJR2JOUXNGMkloWWdMMDgvV2dnU0E3SkhJbEtEQURHcUZFY1c3?=
 =?utf-8?B?cmJWUjZXcVZMSVJDR1kzeHBoSGY0aW5WZk1QK09CRFBFc3RjZnJOTk5JcDRE?=
 =?utf-8?B?dGlzc0p0TEp1Ri8wUzBOODQ2OURLcWlhOFkrVy80azJhblpZOEovTis0UXJ6?=
 =?utf-8?B?Y2lwMUlES00rQ1BHUHFSblVOYStVM01CWHBOVjlEN1IycEZzTUdIMXo0cG5L?=
 =?utf-8?B?VDhlQVBDRVE1eWFuTWZ6QnF1cGdlNTNNMm5mbjRLYUl4SCs5djJBVFFDYjFt?=
 =?utf-8?B?MjFQbGVBcm5iQm1mOWx4endDRXA2OFdjSERrOERSTituZFhmdnBTVkJVMk80?=
 =?utf-8?B?cFJZK0k1TExiSU81VzFtbmRPdmJieHBQbWVnZng2M0FVTVZzT0RMUzRQUFo3?=
 =?utf-8?B?RmZGcnNTb3JYWmwzT3lNNndwNEdBMldvWkNpL1FwcjNIa1lnNUY4eFkxdTcr?=
 =?utf-8?B?QkZhYjI1SGhrL3dnS0tNL3pkazU5SlUxVzQxSUdQSW93aFB6QXhlZno1VUNJ?=
 =?utf-8?B?NWd2cnVNQ3BTb3pCS0JPV2ZPajVjcVlMQTlrQU5iM1FVNk9EUnFXcHNtSUJ4?=
 =?utf-8?B?SlNaSlMzQ096bVVVTmxxeTF6TjhScmtDRjFqZStIQWQwNmJwQzdvY0c3SkV0?=
 =?utf-8?B?SUNDZ1VkeWFXckEvS2FOUlBIZzB1T1lDWDk1a01jSzdrM3cxYlhHWmRZL09q?=
 =?utf-8?B?Vi9jRklTdUIxc0FTUkt1ZnJSb0JhaEJaK2lzSytFdVNncitmL0VIODJ6ZWhO?=
 =?utf-8?B?aFlSOVRJcG5TaFp4MkVjUE5FK3dtK09QYzVKNEEwRE9aQjY2bkt4QW4wRkJQ?=
 =?utf-8?B?NkllQ29XVDJ3TW02MkpJSk9sMTdVVk5hL0szMTJXWjBYMnM0WENlSC9pVGJU?=
 =?utf-8?B?a2RiMXVtZStVakQ0SGJVekRGbGFPVkpjTkMvTFhVM0JPUENDQnkwMzR6THVW?=
 =?utf-8?B?ZktBOWZZTkdPeGRQd2Z4TXZEamxta0ZRQmVRM040WnJLUTMxR1d5RUs3R080?=
 =?utf-8?B?bXVBU0cyZHZkeWxpRzNnOFBmRjFpN0dTeGJua2JiMC9yWEdWZHV2Rndwb0Zw?=
 =?utf-8?B?L1VqSkdqM1RRcHZ4aWdmVU1xdTAwc1cvUi9uaGZuZnVxb1ZhS1I1NXgxUmNw?=
 =?utf-8?B?Nm53UzQzaTJsU3hBc0JQSXZ4UnNSRUFqUjVHUHFkRDlPVGVxSVE2TzY2RHly?=
 =?utf-8?B?UnVPMEpZODJ5eW9ha05rcUwwRnBEOTFBOFIrdVZKTHlMS2xvNlNKbzFHaHY5?=
 =?utf-8?B?dk1GVVQ1S1RqcmZiL0lZc2tLOUxDemlCWnlTbDBzeEV4QVdhMEhLV0tNVHo3?=
 =?utf-8?Q?KtytnNewQrfK1acn260tui2XYe6mPtHhfG8iklW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b69ef38-e56e-4407-a105-08d9782b86b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:30:58.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61d64PImSLQYSzVFqlyT+3o3Kdg+MJ43iQsSQfcGyrLHWFB4vflsJvV3K6V2LnWc6Byh+iAK09I770QOuZGJpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 14.09.2021 18:43, Kevin Stefanov wrote:
> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -20,6 +20,7 @@
>  
>   /* Number of pages holding ACPI tables */
>  #define NUM_ACPI_PAGES 16
> +#define ALIGN(p, a) (((p) + ((a) - 1)) & ~((a) - 1))

Wouldn't this better live in xen-tools/libs.h?

> @@ -163,7 +159,6 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>      struct acpi_config config = {0};
>      struct libxl_acpi_ctxt libxl_ctxt;
>      int rc = 0, acpi_pages_num;
> -    void *acpi_pages;
>      unsigned long page_mask;

With, as pointed out by Andrew, this now dead variable also removed
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


