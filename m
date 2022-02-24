Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC44C3125
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278474.475741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGth-0004Us-4i; Thu, 24 Feb 2022 16:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278474.475741; Thu, 24 Feb 2022 16:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGth-0004SH-1M; Thu, 24 Feb 2022 16:23:17 +0000
Received: by outflank-mailman (input) for mailman id 278474;
 Thu, 24 Feb 2022 16:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNGtg-0004SB-7Q
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:23:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10e5a219-958e-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 17:23:14 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-GmTHLCgrO2GXkkB4hDyIfw-1; Thu, 24 Feb 2022 17:23:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB8058.eurprd04.prod.outlook.com (2603:10a6:10:1e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 16:23:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 16:23:11 +0000
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
X-Inumbo-ID: 10e5a219-958e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645719794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeRz2cvuqd2++ZLhwlWnNIrggwqyR2u29a5qNOTVmSE=;
	b=bQaCwDvoM1qQaSLdhyN9TciEveOr9Z3KLgS2SA7dGSS2cMsYATVZn1wShMkap+TqhGrDds
	d1SPACvbz1fo8JTrNKkNlyTzb4yQfO5ubYVgFMXQyI7TlrrtAb2dwL2mIZtrmgi6aUyaQA
	mTe37/QCGFbpzVHAITMlxgNvSWJNWmk=
X-MC-Unique: GmTHLCgrO2GXkkB4hDyIfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ajsgex7F9uLbUSLe1uONHuR2fLymo4LFc4IF9pH8VgGp99PN6VYuNq+yF07CGhv0BKZD91TClhguNdayY/dvMh1wdOChtwUSjcjBGtfQTL5+QAquutlt/Z+MfaevIkABO1FMsS6Vy8bekLnIOcKd4bg0mVnTuoGHsKKQ5lGxLUKH0dGV5fm8ock8e0wMOoLah+F//vvcUbh9433df7PL5w+gso5UMPY7wSZxLGfnmQuFxjJgJUJH1SQSw2WM/ysVZ9uyNKNqloV4VxEO/zL8K9v8WCWqpmx4HuMlFAEaXp3XyN+yd7hOsO0sFXnp3c2WQZx0P9YUw9FooTUqNaaaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeRz2cvuqd2++ZLhwlWnNIrggwqyR2u29a5qNOTVmSE=;
 b=JmbRp8kHNfSWSU0WEG+FI3R5yQBnhf6X6PZVeN+5zdHi7aclh52zyrTVn10PS6INFd2pCKxAP5wz3gDpioXSnESTfnKeUOpLFaxxN+6qF6jiL+EqJyx+R2p2UqdnEvU3QUvocEF1Huf4VZDT2OWzaBtEmoR/XrJSKNnmqPLbGedTIoylKl2KvLrN5jFBumpG9ao6AcOfCLpuA8AqcElLfaqFbuC+lc1YMt56b4zW8V+NA7jgdELn0X3hlrz7gC+KUy0Aj/p0aPqqbn/jEryXU/QAjWhrrMNSk5lb4Qw5ox35WeLLLRq/EzG/8vMl3FGW4nuw+pofmC/vIEd4NVBgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b90636c-2890-2ed5-1315-51f80b2d2d78@suse.com>
Date: Thu, 24 Feb 2022 17:23:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] xen/public: add comment to struct
 xen_mem_acquire_resource
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220224152414.27948-1-jgross@suse.com>
 <9972f96c-d0cc-d9a8-3566-74dbaf7e9e33@suse.com>
 <93d49d5f-29d5-72d1-c00c-ad14fb08b9c4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93d49d5f-29d5-72d1-c00c-ad14fb08b9c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0013.eurprd04.prod.outlook.com
 (2603:10a6:203:90::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914df0a5-26e1-46c3-067a-08d9f7b1f36e
X-MS-TrafficTypeDiagnostic: DBBPR04MB8058:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB8058EFD0192B6741A1F1AD03B33D9@DBBPR04MB8058.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qdX1BUa3Iy4zgzzwMaDlrhGJqkUyRsR6uAF60M0bLAwcI7SrFi3/8slgLr9TEMNrgTGM8X26sm+CyPWz5tVmCuUU4c/kcTszPkM4KnXMR5NO7rGIAM963FsfSH54JWtYgaOwQXK88LxVhwblbexPADuF6DcFJVerYoSQG9BGG1OYNIOqsvUWrW/NS4au8EtPd3gYsviL5hrJ1S831h9aQGkmc4W+MeqknAFFMxzslbI6HNdcy0FiAPOtzhj6F14IDcdkmGCEmaau9GJrK2qSk3cp9EGcQkOX50ivAyRJohZCQlElOM6kLy/NCtBg7W1SPYEpW4GH9Xy8fIUrssZkyqipNxuVfbporgJYc8HFGu6DbHeppp3c5FiuKyHkFkmenk/s9yotaX36rc5gEbJNu1OyMYzqhbcMDFRlYQRv2adHZLe1upUiQoPt3jKDTc2iAI9Pg+QWzx5aFjh2UToMXKv68//rcZklCNYDh9TnerNHQv8HDmWlcepwwSxD3L9icqaxyud5I9sJ7vUk7BwQM12rLraWVd4lIFrJ7JB0df87vkOXcvT373Oa2JtiIKDIMlMevcS9Npm7mw9FCoDQrkrBLNEvYmZ5aOnidvmz1j+IKgj7jWBnvViby7FCMmZEz4/BaGupNX+WS5LaVXyHd8esLZvUOy2iB2TIbnjr7UOVV66FoUab5BMXMLY2whpYBqhkCIwdzYbq9BAucH3iM3vvdSGJjGGENPaHhZzbx6zq0QAybG8igskTxRg5k7qP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(6636002)(54906003)(53546011)(508600001)(6506007)(66476007)(66556008)(37006003)(316002)(8936002)(5660300002)(31686004)(6486002)(36756003)(66946007)(4326008)(6862004)(186003)(26005)(8676002)(2616005)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGh2THljSDNVK0ovblo2cnZYMmxEbythS1JnODltUzE5ZUNjanI2bFMrWlNX?=
 =?utf-8?B?MTlhMVVybGRvZTBXUlV1YlA1MFpLTFN4elJyZVZYVFRYQzRIa3dSRS9OaWxV?=
 =?utf-8?B?RllFQnpXMkJvMkk1NUVZOUdSL3UyV3NDK2Y4TXFpSzJab3ZUVElVdCtYbVhX?=
 =?utf-8?B?cm8vVytPaFZESHBuWm5hbHpOZVl2d0pMSmtubUowTXZZYmx2R01rUEFuMXo0?=
 =?utf-8?B?MW5uYWtaZDZUcGFIcFpXMk1pUHZZTzZLL0ZXM09KR2QzQUVQWERHa29rL05N?=
 =?utf-8?B?Zm9SZGRaUXNlanpVdGN1NE81Uk9xaWlFWFNUdmhRWUZPbTF0cTNrQ2dIM3BO?=
 =?utf-8?B?MVYrWHVPQjV0RnhhUGpsU2pyTzhoNStONDZIZ0gzTjF6eEx2TDIwRUVPLzZ5?=
 =?utf-8?B?aUNNV0ExMytNa2txZXBhMklxNjFGeUhoWXA0RmJ2TGZQdm5PSm4zTHB3MUZK?=
 =?utf-8?B?V0lyYkFyUHl5SFY4YkFjVm8zVDl4cXFTSjdXRHFteXlrWDVpeEc2KytWWVc4?=
 =?utf-8?B?OStrYmg2cWFLV0ZNTHlHVHNneTVSZ1Vvc3N1YkZPMXNZcU1jQm9sY3RhL1Zp?=
 =?utf-8?B?NW4rVTdWQTBxdUY1bGFkQ2RMZHVCSHZOVVVLb0ZGR2k5djVQajVSeWlldzl0?=
 =?utf-8?B?ZVkzc2UvUk9kanFXSWhMZUNHM2htemx0YUVFeVJNUWltbXZRTzI1MzBFWUd6?=
 =?utf-8?B?VjdxenN2ZnowaUE2dFRsSDFFN0xtSzZ2V0FYbmZ6aHBtdWpKR3FhdU9USmNz?=
 =?utf-8?B?cG4zcFNQbjdDWVVPY2Rvd0YxYmNzQThFUjhRNVhzNlAyYVljaVREVU5FZDd1?=
 =?utf-8?B?eXROa0VQMGxCTGJ0eDhTdGlEMDNDaGJ2U2NRVXBJN1gvWUVOTE9USmhoTWxz?=
 =?utf-8?B?SnlwZUdNSXZFaDV3T1Z5TCtqSmR2ODh1L09QbEMrOXZLSGZ0NkVsRHpYTHRB?=
 =?utf-8?B?alIwQjhPa29mZ1g2akJpNHFuRUVCZ28rcTRPTHNFY0NxYXhCU3Z2UnFRbnN6?=
 =?utf-8?B?WGdSZlNuOGhLY3I2TTdUUWVHSUUwaHl0TWZuZGN4VVZobEtjUVpBakxhTlRk?=
 =?utf-8?B?bnpGZTloQ2pDSzEwRFhhbFgvMnFWU3Qzb3NCWlBDY3dYb0xESzFNaHNCU1lt?=
 =?utf-8?B?bTN0dVFTWnR0eWZhd0RFSmtYTXcrZzFxWkZIVldDblZPaGY1WjVmS2wyQlVs?=
 =?utf-8?B?a0V0TGRqVGJCMzNBZi8rS1A5OXlqUXhDaVdhTG9ieFNSRlRkajAvWlIzWWt0?=
 =?utf-8?B?a0g1Z0tIdlc4MnBJQ2Y0RGpnaVNNZE56R1BsdWE1ZFh6THBaSGg3STR1VXlU?=
 =?utf-8?B?VmNocGFUbnhNb0tNVExhOUlNS0V2czIyMWY0djI3ZUZQNUhJajYxMnBhclBX?=
 =?utf-8?B?WDY5bHZ3empBRjR2QmdCMW8zaFRScHZMbldYbG9oOERiVll0ODhnM0RZZWxG?=
 =?utf-8?B?Y3NTb1VvS21DWmxjT2ZyL3FuVlhNb2tjdlFoZS9OTVMvanlUY1gzZWdrcm5D?=
 =?utf-8?B?aWpMY1ZuWVFXZ052VXZmS1BOMG0xZVpvOGxZU0lCWmk3dHBzR2k0TTFRYVBY?=
 =?utf-8?B?YkJBYlZ0WDdzSEg3dlNOVWRaV2NLNVJ3RGNqTEw5ODhaeXUvSnA4QkptalRz?=
 =?utf-8?B?VVFLVzkzbTVhaDBOYmZzMWVGSjdrWWR2YmZNUVlHMFlqakNJSjU1ZGUzU2pt?=
 =?utf-8?B?NE9Ua1V3OXUwUnh6VlNEL2cyMlJ0MWFUUFhZNThFTzRMQnlJMmc2NGV0Wjdz?=
 =?utf-8?B?RnRvcTByZDBHWFlnRHFNOTk2Zmgzd2RaVzExemdrcHBIZjdxT2d4N0VHKy9n?=
 =?utf-8?B?RnZ0VTVEeE1vamdVSGtyVldBdHRUc2tzNmNyQ2hkMURrSXczaWtJNnNCbVBi?=
 =?utf-8?B?ajNIbTlHWDBPS2tuU1FFVXZXQmkwY3JDUURFV1JaaVpBRVE5ODMvU0VINHlI?=
 =?utf-8?B?NmZGZ09QbTVBYUJmVWk4M3ZCcEFIN1gzdG5KV09XSlJUK0w2RlNWZ01iZHkx?=
 =?utf-8?B?WDRsc3lnQ2JjUDNDbGgzSHh5QlFXNXdSZG1aYk9PcVJiNWZDZmFuL0lLblhq?=
 =?utf-8?B?eTRmSWxFR2w3bFY0ZmpzdUxySTY0aDF3MU0xdjZlbkpBNmRYa2FsMUJkd1lD?=
 =?utf-8?B?Nm9FRlJ2RDhMclV6M1B4dWNLSXQwZDY3bkJkSDdvMFhjdmNWRUpuQXEzcE9r?=
 =?utf-8?Q?w8ZJavYU2UE4YbRZ5sJqI6k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914df0a5-26e1-46c3-067a-08d9f7b1f36e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:23:11.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t2V8mLfuI9O1ErtZ3AsPqjtyoQt+aYkWgmsMRAI8WfnbU3+qw2waatO/qbyEPCu1Nra/geuW3vqdu5LCoipcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8058

On 24.02.2022 16:41, Juergen Gross wrote:
> On 24.02.22 16:37, Jan Beulich wrote:
>> On 24.02.2022 16:24, Juergen Gross wrote:
>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -662,6 +662,13 @@ struct xen_mem_acquire_resource {
>>>        * two calls.
>>>        */
>>>       uint32_t nr_frames;
>>> +    /*
>>> +     * Padding field, must be zero on input.
>>> +     * In a previous version this was an output field with the lowest
>>> +     * bit named XENMEM_rsrc_acq_caller_owned. Future versions of this
>>> +     * interface will not reuse this bit with the field being zero on
>>> +     * input.
>>> +     */
>>>       uint32_t pad;
>>
>> Did you mean "... being non-zero ..." and "bit" and "field" changing
>> positions?
> 
> No, why? The current Linux kernel will set pad (the "field") to zero
> when doing the hypercall, and it expects the bit to be set or not on
> return. This means that the bit is reserved for the case that pad
> was zero on input.

Hmm, maybe I got confused (but only in part by the wording). The bit is
fine to use as input. This will mean the field is not zero on input, but
the way this is worded is somewhat confusing. How about making things
explicit: "... will not reuse this bit as an output with the field being
zero on input"? Then
Acked-by: Jan Beulich <jbeulich@suse.com>
and I'd be fine making the adjustment while committing.

Jan


