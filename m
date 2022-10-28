Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF708610D59
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 11:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431845.684461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLju-00007y-BE; Fri, 28 Oct 2022 09:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431845.684461; Fri, 28 Oct 2022 09:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLju-00005v-7a; Fri, 28 Oct 2022 09:33:22 +0000
Received: by outflank-mailman (input) for mailman id 431845;
 Fri, 28 Oct 2022 09:33:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtyv=25=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ooLjs-00005p-9W
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 09:33:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2075.outbound.protection.outlook.com [40.107.105.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e7bb6bd-56a3-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 11:33:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 09:33:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 09:33:17 +0000
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
X-Inumbo-ID: 8e7bb6bd-56a3-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jjw7B0UNGB0W1xzjMR7IFOB5o8KhgI4iG5V7M6NVBzUi1Pbl5K6xjMPA1n6GdFkT5IozLSvu2OOAUSP4eee4zAXaRi30Z2zQCv/dqSQdA4z0MsH1ws5Ghhv0wizmiOt7Zx0oEnBWdkPQd+3/nDyCPOLv5Gac+c3lyK4P9CaVR486YcxfO3NvIFMoQ0drnAcv/EAS5y8dEYqM6Pr+gQD6UafBpPAKxOfeu0o7AmlJEkN19/hLnM40joIyW47FSVEktWtQvBiuiBp9RbrIDI6pyqNCISiT12fi08gUTSAqqCT08S5q0HW4lZtc3Inl4OPg8LsKJtjZJUCJf0vyhmmBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQqwifjrRX2J6HNw2QwhDfDl/0nuZREDzWmJGvuyZM4=;
 b=gm7S4vGKZB+cCgUzEHiKEN/N1tuKClJdbtyRwtSWWxg9/PJAxZDAxXuncswcbUi55sy1qOFkbjXtWehS+W415zsRSVKL1Xhbbky0GXHUwEWvuPEzOcANPvfekH2bp4g3rJZGzHu1mvoeJBUE+NOEWsqT7jKu3OGvogzF0oT9DlExiFAaccWL+2u4psLo12wXy6ZHx9hqlGmKZ32OH2fJrlLrEaMRdNJxfuOhTaQOfQDcCtn/EgGdJYiEcmuDHvNIiM8QtmhFCRbjrwT4i1QxpLNEQseMGbtFppRr+Vtb9H6k4I54UiKq/nJRR53ioL2L58IsRxbie+lxv+I+8ZGfvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQqwifjrRX2J6HNw2QwhDfDl/0nuZREDzWmJGvuyZM4=;
 b=2EhK4R9Rf+rPtKCJBQkJC5odfnAwkIc47HxASCq+/kHHuipUTKEs6Yx9+x6TFe4OZrl1OytiBIn8BVDMZEq+9RkGibO/2Rs7jrrOMIZe5DfyfAYb+8Hz/kx812tVOBVKf2cGj6P10XgV4/ospYGwZnKTx1spdwRLDZJntixAR8EgVZ4avSOoGcmFWlJfbzmapfXE4xeMQoK3pGyCP7H78/2TKZbwcPOZ1SCcgv3bvtVoPpwi9RGN9JmNQ1OOu0rmPLAqr8pDt/ZZ9+tHr9fpebrvMPxQTkfVgKebaxtbA4haHXOyNJFcz4Rq9rw4dtSJ2TrZENHEq0ByTTpAC8vSGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19b1f3e0-6851-eacf-0efe-4d82293f29c4@suse.com>
Date: Fri, 28 Oct 2022 11:33:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare the
 underlying page
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
 <Y1gD7GmclguLZCM8@Air-de-Roger>
 <b9c190ee-f916-b03d-e56f-0a54d93ba948@suse.com>
 <AS8PR08MB7991C7034FE22A68AE77A39A92309@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <77793987-d638-deaa-f3a5-4a9aba3d2a30@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <77793987-d638-deaa-f3a5-4a9aba3d2a30@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0a89e3-0d0f-4a07-bc26-08dab8c7716d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DbiMNpqmolbeXkrvuD7EbSBAY0ShtVFbZLv+l3b/EmbKQyIIaY4g0TrBSaBcwEDcju49dMTH8DhZggsKeNCX1rJCLP2H/W0w7tMS7OT6sGIykA9fZacuYwXvow7GAXeQfnUuvzOLWlz7/tnZ8wGoTfCPdyzS0zk3wJjoTnAi9sZn+gZ0oZ2aN8C2QT6rJIpSTdUHLkAWLoGEaYObMBVkrDi8mqith31I/cYv/5+JImg7oOOEQ9S052EM7ABTTIb14OaQSUKAaDMkpezvXtjs9TQmcOi8G7IgjGmL76FKStEp8QKG68CaCk2smZNtZyj3m1R/hHnpJhhi/IQnDCEWJmyMR2oLRUQZ8k/KwcCnTR1+9vXrtoTDHgeKhyrXNgtTa2199Fz7NhoevCtXz90oB0QPvY0MQUK0Z83Yiijc75WbEeH1Q0mD1IOiHpcSFFSkL9e5Hmalf5/mpejZfp3y/f41mFkTATlI8LZCHu/NwtiXdM2bQBN9DHAjUnSzfaVRC7anHFlPB/f+o/RAlvq7pScfFsivDxKa2YB8Cny6ekZNGlOWtJGPCIxVWDdAuOsBqROR+ZRKbHnwmQFA5r+/e95+MbmTtehflC/4wsiAbgu+phFE1P1t6AqdAUnHFvOdht15ctWqBHSNKtVg1aGHAJp0d06T7aQErqfxe4o3R3tv/q8SDdGJXFBYLA+vkYObvTGM6VCR/xM4pFlY23Az3UOGIoZoc0Y2w7+YLZPUaP7t/4Ye94WKiMoL8LelQBrZIZ2E6ciVLkO4lKl0el/uiknajo2fOeP4UP50S2gJSv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199015)(2616005)(53546011)(6506007)(478600001)(26005)(6512007)(83380400001)(186003)(2906002)(316002)(54906003)(8676002)(110136005)(6486002)(8936002)(5660300002)(4326008)(66476007)(66556008)(66946007)(41300700001)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0RDWGwrR3lVbGs2TXc3QXJQeFhXVE5UNnJid2Z3YkZYSUl2cE1VdFYrOVJN?=
 =?utf-8?B?WHhwUXdPRE10U2drcU4zc0pQWVdNeUpjNWdqTHlJYWxHbjdBaDBWU3F6dzZV?=
 =?utf-8?B?U1BHcVlhaWt6eXI3Z3o3RmZUNjd0c0duWmxJcGNZNHdOUE11V0pxT3VLdWd0?=
 =?utf-8?B?cUJrNzZBek5IR1diNEVtdzlwVnNGOVdNdFRROHAyZnd1SElWaHVUSlk1dzN6?=
 =?utf-8?B?T3BQUWphZDB3QW14SUxhemE5by9YSTNKT0J3eDF4Z2NQNUh2dHJnUzJmVEw4?=
 =?utf-8?B?WjJvdGpMcGFVY2dWZlVHTFVOZnhyVU1hQUlhZVQ1MXU1ZHlVNlhMSXlTajc3?=
 =?utf-8?B?aXhGWERDUDM0MzUzdXZTd3NURyszbENySXJsOFQ3UDJNTk1OWlVITlVHYTht?=
 =?utf-8?B?VUxBRUF1eEVpYnYzOURmMlpHMHpob1U4TFdhcXdUUjN2Z2hZNUFsdUdhVEI5?=
 =?utf-8?B?c3lRaXFVWmJLTW9aRGt5bW9vTWhIWXlIcXRqSUU4NWZKbEIzdjI0czVZYTJs?=
 =?utf-8?B?KzAyQTByNlhQQTRYMjVUTkJDTnM4WDl5NzRtWFJ3S29SSG1kZGxpQTZRZDI1?=
 =?utf-8?B?L0hXSXBOWGFlUUNaYXAvNzZxN3JPR2FaRlNoYkxYU3NUOUo5NkNhNWdWYXlY?=
 =?utf-8?B?ampXc1h6TFZCOXJCcjJ1L2tlQ2FWZ0lGRVZRb2FiQzZLV2V6b3NvYzJOaDhs?=
 =?utf-8?B?bVUvSzF4RFhvZjNPRTVLTWMyMlRTTDUyOThxN1lxSVQ5N1prb1Q3US9CbERJ?=
 =?utf-8?B?L2wxakJaVEZyMVlUWWxpcDFzWldHTHdPUlp3ZFhsU0VkSlZTdnRwQnZueCtC?=
 =?utf-8?B?R2dMVnVWc1VGMHJVQm9tLzlhL1NWYWRPMXFneElwSThrUml3cVpTeHkwSnB2?=
 =?utf-8?B?ZWRhalVJc0dUTVByQk1GM28wREpndjBBYTMrMGM0VjVMYWdwQ3JKMVZNMER3?=
 =?utf-8?B?UnBvZmRVM2pBelRKYUFFTVphMjZocU5Tc1pmUnUzaDRNMzlyVkw2ekhkUFF3?=
 =?utf-8?B?WXd4SGVuN0k3dWtqSEFpU0svK1ZNelhpY2FhR3ZOQ1VqSTVXSWhsTkYrOEti?=
 =?utf-8?B?RkI3T24yR0pQL1AvU21Cb083dXFxZ01NMHc5QXJPQjlieGp5OTNMeEV6QzVO?=
 =?utf-8?B?VXAwTWdadU90M05yVVkwRCt3eXdBdnc2ZU44SGVweGdwTFQ3MzZFYXlxb2Rv?=
 =?utf-8?B?RHFQNWNOMzN4KzZRUktqSjBXWWUrMnlSUWFlM1duYnZzd1VOSWZhQ1lkb2Ri?=
 =?utf-8?B?NFhsaXcxWGI1WUNtd3ZseHYyNVFGUjNWQ0NHdGs5TXZteFRmeHpiRFZUTElC?=
 =?utf-8?B?c0FZTkNCNkIvT29YZ1lFYjR2ZUJzeWljcW5tbG4zUlpNdFM3RktzZjc2SHpW?=
 =?utf-8?B?SS94aE9tdTdYWW1BQXBxQUJGRlAxbG84SDUveWYwQ1gxZmZSZ012bklHSFcr?=
 =?utf-8?B?V1hpRDVZSzBvUWlzWXFHd1dDRnl6ejkyVUtHRzFyVWkwSEh5aWFRRkh6SHBs?=
 =?utf-8?B?NjZUelFtRU1nYS9kMjRLOXhaMGhTREFYWEVWbi9Ud3FxRXk3MVo0ZnprbG9F?=
 =?utf-8?B?NE1Nakt3K3owL08rRUVqZnE1QklGaXVET01VZ3pFU2xTcXVrTStHKzZwd3Rp?=
 =?utf-8?B?aWUxbnFVVmcrQmFUdDU1NTZlNnJ6bXEwREhpQmV6M1YwNENMbSsrdmtqYXoz?=
 =?utf-8?B?ek5YQWpsbENuU3dSK3hEWHoyTVFMR3hBR3BjL0dhckkwU3Z2bEgvejU2YnRu?=
 =?utf-8?B?SlQ5L1pJckJKbnF3cVVvb2ZOVFNSMER6RFRuOUJ2VFhQVEJtaHQ3c2kxSWVM?=
 =?utf-8?B?bUtveGZoejkzM213Y0JaUDVuTmpoMjdkS3RBV1pZdzFXSFpueWR0WlA3SWNs?=
 =?utf-8?B?bFJqTHM3eWZxNkFET3FRbGZmSUFzYXV0U2xOSGtuMVRCcEU5alJjbkFsd0g4?=
 =?utf-8?B?WjBhSnV3UmlYYTNuNHdxcjk3R1NjMzQvVFdFa2VnZnNiMGpBYXMzQjRvQ21R?=
 =?utf-8?B?M2ljaG9kdzdxOEprRkQvY0pjZXV2M2lLVGowc3RSWEtCNW8wL1dBOUVpY2tZ?=
 =?utf-8?B?c3NZNkRJRTY0MWp0V2dmY1Z0Rm80YzJJUTMxNGNMZ0VYUit0V3RKa2VjT1dO?=
 =?utf-8?Q?idrDRwZcIkixKVVmpP5edYb3J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0a89e3-0d0f-4a07-bc26-08dab8c7716d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 09:33:16.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXlRwtBOjb/HE55+7j36nN8sLJt0Q2p+A40WIY5TR8fmZ/KNtT7k5HdTgI4QyOj7eGGNo3c8rbgfhzdxl243GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331

On 27.10.2022 14:22, Julien Grall wrote:
> On 26/10/2022 03:03, Henry Wang wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Wednesday, October 26, 2022 12:07 AM
>>> To: Henry Wang <Henry.Wang@arm.com>
>>> Cc: xen-devel@lists.xenproject.org; Andrew Cooper
>>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>;
>>> Wei Liu <wl@xen.org>; Roger Pau Monné <roger.pau@citrix.com>
>>> Subject: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare
>>> the underlying page
>>>
>>> On 25.10.2022 17:42, Roger Pau Monné wrote:
>>>> On Tue, Oct 11, 2022 at 10:48:38AM +0200, Jan Beulich wrote:
>>>>> Not passing P2M_UNSHARE to get_page_from_gfn() means there won't
>>> even be
>>>>> an attempt to unshare the referenced page, without any indication to the
>>>>> caller (e.g. -EAGAIN). Note that guests have no direct control over
>>>>> which of their pages are shared (or paged out), and hence they have no
>>>>> way to make sure all on their own that the subsequent obtaining of a
>>>>> writable type reference can actually succeed.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> I didn't Cc you on the initial submission because mem-sharing isn't a
>>> supported feature, but upon reconsideration I thought I'd at least ask
>>> whether you would want to give this a release-ack. I don't really see
>>> any risk associated with it.
>>
>> By looking at the patch itself, this change seems ok to me, so I think
>> I will not block it, but I think Arm maintainers' approval might be needed
>> because of the discussion in [1], so I added them for their information.
>> If Arm maintainers do not object the change, you can have my release-ack.

I'll take the liberty then to translate this into an actual tag, with ...

> The P2M query type is so far ignored on Arm as we neither support 
> populate-on-demand nor memsharing.
> 
> I am assuming that if we ever introduce any those of features, we would 
> follow the same behavior as x86. So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

... this now in place (thanks Julien).

Jan

