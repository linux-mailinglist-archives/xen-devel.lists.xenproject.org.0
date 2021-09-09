Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842A404730
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182790.330556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFfg-0005t3-46; Thu, 09 Sep 2021 08:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182790.330556; Thu, 09 Sep 2021 08:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFfg-0005ql-0q; Thu, 09 Sep 2021 08:44:36 +0000
Received: by outflank-mailman (input) for mailman id 182790;
 Thu, 09 Sep 2021 08:44:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOFfe-0005qd-St
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:44:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27a6a387-114a-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:44:34 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-Qjzmz6lLOMefy1tmOGCJiQ-1; Thu, 09 Sep 2021 10:44:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 9 Sep
 2021 08:44:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 08:44:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 08:44:29 +0000
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
X-Inumbo-ID: 27a6a387-114a-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631177073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJsEPTI7iAhv1VfCdSFgbNeaxTnEKnCS7Sh+KJxfHyo=;
	b=P52SJynOvqkMPsAN75S0nL10W5GJ1V66gOA9y+MV/x3OD++pZc/o5yIKDHJ02ekkawMB4c
	h1eM1LCkJ7KotmVzfIQ++uTj9sw+upRN7+r+SKE8Kh2rPGY/kS+DGvXBxPoc39zuimlpT/
	ZoAvvUo51gXvEgsX3UdIYtUYJK9rFmM=
X-MC-Unique: Qjzmz6lLOMefy1tmOGCJiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLApFy64OC6qbj+9Bd9/INk7JrUPO6TssvC4O9+xb84VapVH9ATkU/17r6805byqMVdvCd2OxSN+6MpPcDhkd6VULM8yQkE0XjAg4WCkwCTVhTMiDNUoVi4K5gLsrPXX+JVCxtFXJGA8h3p0V5QvgJe0VlUGRJ9AQPu8n6mUJRfb1UwBHEA06T5aDi4b/CDRMw2b95PJrRiUw66SJ0W52QXJbdusaft1c5FBJFIakD8tXLudvaAE1R6EaYDRyXKNzKFfMyZyozsIVD6Ajz/vzNgfHKs/6P7ke4vx/6UmTy5RoH/kkcUnxc946duOTCGUTpLOiJ4q28qWf9wKPEMblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hJsEPTI7iAhv1VfCdSFgbNeaxTnEKnCS7Sh+KJxfHyo=;
 b=L4pM4KFKcF2WWtcF4UixT49QhBEiERiQ3JiRQgZJrIT3EXHNUTP2iLo/z2afSIQTLpAeEqiO+A4Im9Zq6KZ0QUtWlvWyMzvWaGkyBwovoZ6xz8OfW/AFd0sLlMRief+C0EMDF9zH/of1lNh7pbFIQfBSUrBe9fg0r98favmEvlLD3ckC8WZIZdVelprERVNYpPkDxo+rIWVSaO3RubaK+ZQW+R7X+rFhF2QUjJEKYD7uTUqwuOCFcRP53DuwjlzbfLC7NWH25HTtqKAz71FRNuYSrpVzrp6XCW8ID5/Y1S7O1nS1xJGiY+sBO8WtBD/H1vPioGrOQ8t7PNpm3lUJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/2] stubdom: disable building of pv-grub per default
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20210909082705.9434-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1004466-5d12-efd6-8729-27e72ad6f7d8@suse.com>
Date: Thu, 9 Sep 2021 10:44:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210909082705.9434-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::32)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d30fef9-2e5b-4102-5196-08d9736e09e9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23346D5E7B7F10EF5F4426FCB3D59@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HZEZIxvgbXHsfcitgKS2b1bFQvFsrrGlZ1Pv0fc0LNWpo0LcJMfUwXL93f1vz/O+piLZExSlxG39Pogypg31sfZz2fV2EDUIJCtvk0I9jeAKT1m8wYEwy8ZG1WglKpJd8yve/vSukugVta368GrRV/U7jXe6jOzc0FfZkL0FVKj5L8Ex47a7Yval9xbEtjj7+rNsX7CZ/j6IV5RyUWD2uAtcfzOywZzMjlQ+Q79kSTxwM/+s5RlrQUk691R8QXY72WstlquYsy1ZVCP5mcKjZPB6w4OGUJZRIVJCjsAre4UFHOkHIzEWzSJlspqSw4nlQ0A4rm6uk5WhDCm7IOHoCtajIeiw7YpH6Mvtj2ddDCkWkAUpL1GafxCcXIo26noG5WlSyJiTz+vWHh8AqJNd84h2S7CD14aapLmdNHg9NlybP+WPdQnxn/FmCutwgm4TQacp56PnqvjpaQfSqLfApR6nfPgfsaeRwk194JWykR1p0lXAvqAdk2NupEyDTD9lDlCs5qna/eL7dvCT9H5TNoOZDfad8Dc8cz4WvxBIakiJmBJk+aGHj1NqXBN+9i0B78DdF2UgLPVtEbsDPIA1LRVuEPM0QiCb3Kqd6mNcVxD5sveXmZQfqLOEE2yGGU+UEVhW4ZRJdSx/HfqMLmvbja9qLvPEw8r9TNeeYhMRU/xHXQolt4gGGmgOAZdAoAHmsPA6sLBpW7Bz4GXPq35XhF4VWRqQ2HMCwsVuMx8RKGJhp/JNIehrbErJ2kYlLa5y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(366004)(346002)(396003)(26005)(186003)(66946007)(31696002)(37006003)(2906002)(53546011)(54906003)(66556008)(66476007)(478600001)(5660300002)(8676002)(31686004)(8936002)(558084003)(2616005)(956004)(38100700002)(316002)(16576012)(6486002)(86362001)(36756003)(6862004)(6636002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2lEVkcycThKTU5tMWhXNS8rZG1nNzk5NHgwS1lOSFNuRkRBV1RWUzgrNnpK?=
 =?utf-8?B?RFZoTkJ4aHpZa0sxdUFtYkFYQURueHBOMUMyelhxN2F2WkUralVxVlhVOTFP?=
 =?utf-8?B?bjlHN3dkVnpuWFpiaXhWZVVDQTZody8rRnBMaVBaQjRzOXBTUEUveGJTSk5U?=
 =?utf-8?B?Y29JdTlSb2lVYTN5Y0tGa3JQSkt3M0tiK3o1ZDFJQ0ZFSEExcEIvQTlOam9Q?=
 =?utf-8?B?dzltbXcrZERyNGY4eHF2LzJWdi9jVndBRUdvamh3UkRDelFZVWhGWkV1Ykha?=
 =?utf-8?B?dlcyUEJoZHFFZDJIU0xiVFlLK3Q3d3NHN1EvYnZTZG0xbWEwWm1rY3lIWS9P?=
 =?utf-8?B?clNodnY1OGwrMG16L0wwMEcyVlFDanl3RnBxUW1WWHdKRFZ0V3RqQ2xkSk1D?=
 =?utf-8?B?OTlWTnRkZEdjMmxwbFlCWS9yamdnclh6akxYVGhKcCtCdTFRcmlsQ0FxVEo4?=
 =?utf-8?B?TENNejROMkZBQVVmc2xwakZsa2tFMWY1M1RLZDU2eG5mc0xzNTNRQkVCUVhw?=
 =?utf-8?B?bi9VUFlFdWl3MlhQZGowMkFHQzFiUjV0WWt5R2Z4YmFGM2pxbWN0M2ZncnpM?=
 =?utf-8?B?Z0RKYXN2VzNHOGdlYUxETUNHaHdMc1lYS0h2U1RYd0hPWjdsUlBkLzRaT2Yz?=
 =?utf-8?B?MDJvZmsxUjZ6VC9nSkRXTlh6UXRsL2RtSS81NW1HWUE3TkJFcFZDMVhuR2Zu?=
 =?utf-8?B?VVVmaENlRWJpb1JZQzM1eWhaYVdYQjd6MWhuQVNuQjEwb0J4dkFCR0JET25u?=
 =?utf-8?B?TGF6WWFwaGlldDl5dURieWY1SVBibjQxQ05DSXZSbWFUcVNKSkxsN1VTckRq?=
 =?utf-8?B?eE9ZdHg2N3pocmJ3WS9JQkVIcldpQ3M0bVZFbm5aYmtwS0RkaXpiV1JHY2lS?=
 =?utf-8?B?blZUdjZ5bnJKUE1SZFlqREpWanZPUzN4eGplOThLc3didHNqOHF3UVRjTDQ3?=
 =?utf-8?B?STF5dWp5bmpzelBjUk43cnM2THZMMGE1dlVxcXRndng2Ly9kRWYzdDRsTERz?=
 =?utf-8?B?UHhRSXRHd1dWZWJwUHRhWXVwRll3cFhjUmdSTm1kb0VESGk2WlBDZHROY3VQ?=
 =?utf-8?B?K1FKYVBZUXY3ekpmbXlSTTIyVFdtMWJBZWpTT0s4SU1UWWIyYUtUM251dThm?=
 =?utf-8?B?amlLUW8yenpTaTZRWVBGQlRLRmc2aWJqMjdsa3EyR0VLbk1ocEQ1RzJObXcx?=
 =?utf-8?B?dE02L3RvWVQxZkZyRTA2TzFaODAwQkhBNzFCdUEzNVVNeUM4Smc1NTVGY3lG?=
 =?utf-8?B?Mzl0N3g3S1haaUd6cUZMK1ZUVER4RXIzVmExRFVaWnNyTHlnOVFLdDBzdTNz?=
 =?utf-8?B?LzljbEFQQldVeTZFZmV0eXIxUnEzUzJjTXYybXNLSE9pWjFVSUZFejNQRXE1?=
 =?utf-8?B?a2dZdVNEYUlNbThDNnNBb0N5Wks5bGE5Q3gvUENYdFYwdFJ6b0ZsNEdjSW1Q?=
 =?utf-8?B?eGd2blFJQnV4OC9rTk1xYXZSU2lhcjhSZG5IYU5LU1JGaVBiWHgxblBiMFQz?=
 =?utf-8?B?WWkyQytQL2tYUlZEcTEwL1NIbkpiTnNzaDVWR3VKRHNXcXFVU3hKOU9UTGM2?=
 =?utf-8?B?NTVpQlU0ZlFGM1d2T3dxbDlGVHcxMU8xMjJYcG5BQmRCc21JYmFOcUQ5Wm1P?=
 =?utf-8?B?cGx3S2w5U1JCbmVLbkc1WXhVejRJZGxsR3J3amFXbmdNay9CQ3RkSmVjeDNm?=
 =?utf-8?B?RkNkZUNzbW0rS1VIbTJlZndGOGdNeHJvbWF3b1czQlFwZW9iaTZFc00rS2xi?=
 =?utf-8?Q?5wjzGrCgkD8RZMsyQyInrIvy+Gx3bEn/J8b9xJ4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d30fef9-2e5b-4102-5196-08d9736e09e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 08:44:30.0567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncnAQwe2OCF/G1f/+8nl4JZSA2ZCY6h21VV7q16XUvhlpBc3aGoibR4yvdmhZNKw9khLz7PI4v//DgO4IBN6xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 09.09.2021 10:27, Juergen Gross wrote:
> This is a first step of deprecating pv-grub. Switch the default to not
> building it.
> 
> NOTE: This should be mentioned in the release notes!

And/or perhaps in ./CHANGELOG.md?

Jan


