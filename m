Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AEB406843
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 10:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184152.332721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOblX-0004fe-FW; Fri, 10 Sep 2021 08:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184152.332721; Fri, 10 Sep 2021 08:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOblX-0004ck-C4; Fri, 10 Sep 2021 08:20:07 +0000
Received: by outflank-mailman (input) for mailman id 184152;
 Fri, 10 Sep 2021 08:20:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOblV-0004Yg-Sk
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 08:20:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b12492b0-d69d-45f8-8cb9-d8391c012ffd;
 Fri, 10 Sep 2021 08:20:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-j6w8s61OO0e764bxutmWmQ-1;
 Fri, 10 Sep 2021 10:20:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 08:20:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:20:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:102:b7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 08:20:00 +0000
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
X-Inumbo-ID: b12492b0-d69d-45f8-8cb9-d8391c012ffd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631262004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2X3bXUxHHTgI4mmQ1aDzuY4bYr7VKDx8vAHGZJEbFQ=;
	b=TAM2HsFZQCunS0mRjGPUgkMypCcAuZZu1oTwsWvVwrvU/tdh0yp3FJ1uTVG7Kuam+R3VBo
	LU1/jeNeRC85IBOIIqUlRQbf0TfJLQLpIjWV9Q4+5WPQLzxearwuvF4fzQOsbqCo4xqKGc
	32pXVfGrmmsOkmvpvLPB53UvXqTxacE=
X-MC-Unique: j6w8s61OO0e764bxutmWmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnwBOsXM2KRsYVKEt6xjgNk/krZltEBkQo8J4CkrLcttkjN6CWR/ROQkjDZBi7kMi+8snFUqELuB+lYt+7yWtIHRO2EeVIy+DdocaWA86c2/m3lO0TrY6cPGrUQKpIli8o6gTX6MlUhDySRpzUcBbRMGfzFGj2DVN5LVpLPqHHnKXxAcAyFd2IvzH/LZ3PT8KbO1RU3bCr90cTTM0orsJCnS89XtEMB8/da52vauaItE21MjpLKXWi37kALZo0r3JN9UXvW2V/VjOCrn4Is8wF5BdO08GRACs9Hoogg1dBCVF2oFdA/W9056Ps71DWTknI7oO5WhkebIZJJCh6I+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=H2X3bXUxHHTgI4mmQ1aDzuY4bYr7VKDx8vAHGZJEbFQ=;
 b=AC5BghWwKQolaLgRHV0O3cVsCtTPlL/E3/tBFIaXV8o6h+Kh7qfSK9nZ1cazAuXfCECG9U+kIhDsz9gb5eTrtYCNKGV/m293aJVoOXuCDYv2NiYjB/j70rtjH9QZS/B2KCth2aSQqF+O2Iayetz8mKM2Ket3at7oXR9mMWMqZFIfHS2LcDzAkvoPbjoi83t3Vty4U12INZibzZHFudsRmd7NhtoFd+A9SRFi6G2ZMtWQFu+Upv7obu5JEOFPTKBkB1tSBTVIuy9RWgd3zN7KmZdToWeNdTGN3S/1NjAyxqy4c2TBLDznHA68trcOhPNRA/RrRe9cs/yk9ZdztaLpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/3] tools/libxl: Correctly aligned buffer for ACPI tables
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
 <20210909163441.44418-3-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <affca979-4082-e825-dede-b27b5574631b@suse.com>
Date: Fri, 10 Sep 2021 10:19:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210909163441.44418-3-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 589d8c83-f580-4f7d-dc51-08d97433c8ab
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB338971B0A20662CE0CC5EA83B3D69@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NaH+Hs+gsQDqu5aQ1bsVu3cPOgY+CHOca+q9whMi65NmGZMs4F0HT6Jq+bL+M3GfXRtu6DWnuBzUMx1rWeWvRTCb+HTqvGI0QNzb2oefHUcHbthJ6Aj5M05o0+S1c48DI8blyZMoPwmKaa0frxBTWmvxNM76t76he+IgrVsLzhQ9xoTsGhjQJOuRZVNBsSPstRqNGuBlSaZtpDSqxURXLkicLN81F4+AZPHEu4TRmPNmnaKAYqJ95kBpGy3ZW4RBcevn9FzwVig4Lzp2JBHzNBlE1b5NEGE5mw3eqhezU+FVGN5WsGmsCel9a00EytVCxWP5MpYhA7SXlm58A2j/n2YOZ7fiuW9O5erWwp5a8J7Zi0JF7APyzUjhIe/6A1nkGgqlIWdvclrhj8/xoI8meCQ2Q557iTnWK8G0K+FvCOH3SlMK438J7W1+9eFnssMLMGCA+J5s3u6g07icclnxWcYK75Bwn8iuIJ0EG3E977n41hdFeQ4nNldO+oFLs0hmFM5o4UF6LDDD2a8372hZh6mWAU4TkXifxrBXjeHIS6Kia+gzSHV0+SZiPoNwcxIsys2rMqa7baXOHlA1BAh1srVjmLXmabS+xbCOcrFAgeOqSzbc4o/uSu/aBK7jfQSLlGxTKgI9uF8xVJPAI+3qg9ZejmSGp1wAP2bIwiFtN3gPRU9wJTxVyB5tCopqFOlHklw+uDGrqhT0pt3YhnDRXzU/nx0xKAPVMKH6JKmszQsWACW9+1MaRU4omqjTKHip
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(186003)(6916009)(26005)(2616005)(956004)(5660300002)(4326008)(38100700002)(31696002)(508600001)(8936002)(31686004)(54906003)(53546011)(6486002)(36756003)(16576012)(8676002)(2906002)(83380400001)(316002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG4zRTRobjZoTEJ3Rk4yWklqdXQwUWM0clZneUMyUmQ5UlBOVkJHRkhSbWUz?=
 =?utf-8?B?YmhnNzR3bXBONjhua0ZJOGVxYXk4N1JIR2lDSE1aMFFPR2hjZUNPUDE1YUF5?=
 =?utf-8?B?OFFPQU9SSlY3Si9aRWd0Z2xJdlNGRmplZTJuc3A5cFZ1ZVowZWFsL2o1b3Ni?=
 =?utf-8?B?WlYwM211ZnQwNVFYa2hVZXVOdU0rczViUmtLRmhkS3o5RlNjZytmdHhOOHkr?=
 =?utf-8?B?QTk4MVZwY0lFVFcyV0NwSHdvZjd3MVZsOExTOVFtSXo5aFcyZlRzTDdGUHZN?=
 =?utf-8?B?M3lseEM3M0ZKWWYzZ3U4YTd4bUZlRWxLb3VEbFZsempsU1FjMFBjUVBFQit0?=
 =?utf-8?B?ZithZk56OCtQYVdZU1Bjbm9BSXMxUzNNcWhRMFB0WGV0WlZPWDhOZk1MUUZt?=
 =?utf-8?B?em5oTWVvSEtJZml3UmdqT0tveGxkQk1vK2hjU3JzQk1mSlRUMUhjMUh4TlhV?=
 =?utf-8?B?aHVIVk9HM2xBc2pyellLWUtueWowSXZYRXVkcVFBa2t3MDcyRlk3QS8vVmZX?=
 =?utf-8?B?WEtJZ2lUZXB1ZmFYMklBTDV2allFek9rTE13blBXK3h2bFlCOE43WUVjUG9k?=
 =?utf-8?B?ZzlqakVRQTZqNU10ZUF4VkszcC9tSEY1WFE5MXZiMWZVWGpQQytvdUZLL2NQ?=
 =?utf-8?B?VzZsL2VRaVkxcEpNZHg3Y3IxaWxpWmF2TlFJb0oxUHJZMnk2VWxucXhpTGNK?=
 =?utf-8?B?eStpc3U5R2VINVJQYmR1SjN3MzVnblh3WGZYZThVVlRlVFdQVjBFaDljUjBV?=
 =?utf-8?B?OXJHZUMwSU5tZXJzbTRIRDl0MXdQTVBwc0dMNU8vWGZRbnZONVNvTWp2VHYw?=
 =?utf-8?B?MXhDK0pkUktFOGY4cCtMU2FMVjRDZkMxWGpQc1VUaDlrMjdBMS8rc2dERThE?=
 =?utf-8?B?Q1A3clk3OE1QSU5EazNHQ1ZHYUNncmpsQlFscEh5dFNLOEZOL2QwOGRyek1T?=
 =?utf-8?B?UHQ5Ti8vbW5XRDBzVGRIeURpT21USm93NVpBTkNiQzU0SU9xL2pQVTB4ZHRH?=
 =?utf-8?B?aCtnY212R25PNUhIS0ZkQ1l3enpzYXByQ24zbW1JdU51clpZZEZvMVpKRGtC?=
 =?utf-8?B?YUFkbWFieHpPZHhFYm5rUXdvdEJSUWxQZUhzQThwZHhzRUw0VU9HdXlRckQ4?=
 =?utf-8?B?T1JoU3Uxbkh6U0FDempiUEFGeXRycFdNRkExOUZvY2tWZXNCa05uU0pFbmRE?=
 =?utf-8?B?ZUx0ak0zVk5BK3ZDTjFIblpOSmJZdHVIT0lFK1ZtNDhKeXF2d3IzVUdNVEdI?=
 =?utf-8?B?T0h2aFhOZ2xHZDlLNkFuUWh5OXhaSGJtVkVFdWoyV20xU0FvNXZkdzc5TURU?=
 =?utf-8?B?aVh0OERQbjA1RC9qL1BMRzZ4NTBZQjhrcHd6Ujl4WnI1WHBoZkJDbmd0ZHMr?=
 =?utf-8?B?YlluSS9DaWdISSt6c1JGbHhvMjlYdlFydHBKZjlVUzZvbEFhejJPbWFlaFRm?=
 =?utf-8?B?TTg4QTd6aXpiS3lSZFM0K0JXclgwSlVDeVdYWjFvNE9sVUc3UHFEdHNTYnZT?=
 =?utf-8?B?S0pZSHBtSko3Z05yZjlXQm55VGNQRkJJOHJtZzVzTFVseE1TSWVYZXVDaS9v?=
 =?utf-8?B?d1Q2eFVSaHN1MmN0Z0g0TmJyN1cyWEtwZ1ZEREUya0YvS1JHMVFBN2tObzFm?=
 =?utf-8?B?MFlwcms1RllsRzNRbWRzYWlaUnZJTk54QzZiTmtBNG85bGdPK1Q5VHpDaGZH?=
 =?utf-8?B?cEU1ZG1IM3U5a3ltNUk3akN4Y0pwU2xsWUprZFc5OTE3NHU1WTY5NkI5NXlk?=
 =?utf-8?Q?bJRi9t+cQX+Hqvrd4k8jHVyBnWw05G3S+6SbxJR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589d8c83-f580-4f7d-dc51-08d97433c8ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:20:00.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy/E9wapMELC4uYn71iozfiPOZBKhEPu88cewvaGR+HSfY+hlgz6do1m42QkN5RrS6PUaWVIkZFMNTnKbVql6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 09.09.2021 18:34, Kevin Stefanov wrote:
> The pointer resulting from libxl__malloc() has no explicit alignment.
> As an implementation detail, it has 16-byte alignment.

But the buffers obtained via libxl__malloc() have no association with
guest address space layout (or at least they aren't supposed to have).
That's solely determined by mem_alloc(). I think it is a bug of
mem_alloc() to determine padding from alloc_currp; it should
rather/also maintain a current address in guest address space (e.g.
by having separate alloc_currp and alloc_currv). Not doing so leaves
us prone to encountering the same issue again down the road. For
example if higher than page alignment was requested from somewhere in
libacpi.

> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -193,6 +193,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>       * Set up allocator memory.
>       * Start next to acpi_info page to avoid fracturing e820.
>       */
> +    acpi_pages = (void *)ROUNDUP((unsigned long)acpi_pages, libxl_ctxt.page_shift);
>      libxl_ctxt.alloc_base_paddr = ACPI_INFO_PHYSICAL_ADDRESS +
>          libxl_ctxt.page_size;
>      libxl_ctxt.alloc_base_vaddr = libxl_ctxt.alloc_currp =

Below from here there's also a suspicious use of 4096. From surrounding
code I would conclude libxl_ctxt.page_size is meant instead. Could you
consider taking care of this as well at this occasion (possibly in yet
another tiny patch), while playing in this area?

Jan


