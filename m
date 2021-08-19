Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928253F1B49
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168847.308329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGijs-0005sK-9A; Thu, 19 Aug 2021 14:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168847.308329; Thu, 19 Aug 2021 14:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGijs-0005qX-5b; Thu, 19 Aug 2021 14:09:48 +0000
Received: by outflank-mailman (input) for mailman id 168847;
 Thu, 19 Aug 2021 14:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGijq-0005qR-4s
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:09:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89893ef2-01db-4357-8a46-37c7881625ef;
 Thu, 19 Aug 2021 14:09:45 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-NCENcGizMk-zCIf1oY7UOg-1; Thu, 19 Aug 2021 16:09:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 14:09:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 14:09:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 14:09:40 +0000
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
X-Inumbo-ID: 89893ef2-01db-4357-8a46-37c7881625ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629382184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGu7DKlvwxRpP226AGwTWWbu50CFyIs2SldBfi3CJ2M=;
	b=WHsZS48XkZsKyyCEnjshRBIQfJo88I1Drg7ZX5anGmVF7ZwWKErvhhTbkPGzd81BjvPQ49
	wZ8q6lbkIvoHUix3F4oA5qJcRghv2KkbUoKQnmLxtx5TyOQFoxbvQV/ogKOPM2i0kyuY2E
	JQ/gzyCyJJZSF7Ca2JOJDPeS/gXKEl8=
X-MC-Unique: NCENcGizMk-zCIf1oY7UOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwiUiJ4WG9cGzHKPhmYxi+aekZ0UWSWG8CM88NQfV6VzIf7xPGWclHfejm/+wNi4ciMGL6RgHicJjdg98DsXVsfSGtJW7pzBvVLdw3iBg+dQAGhTj+Mv7rIHObNBa1daAgoTVRiX4WT0ehbNWP8PvtWAnQWBDBImKx20ZhX5IXB9am9T7J7T30TCt9F5/K6XmumGND13bWwqED76Dr4mcKFEgoEgBzM/rL1NjF0m7s8Xtj/QS/OJ+S02b3u3iTY3eMnVlVVKF6Zq28E9tNydNdWiXrGUPHmQNXGj4/KiX+iCnGg2tG4/4478CFBF5pmEy2onU8dtlMWiHmdmurt1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGu7DKlvwxRpP226AGwTWWbu50CFyIs2SldBfi3CJ2M=;
 b=Cr5s0FvbtNPhx1/iKJFhja8BuyyaPuXlKDBzJr0mTmWCogm2u19Y5L1oJvfgnNIlQT3txpRdWQxq3xThbUA4jE/WUI0LaYG+H08K4N/G0zkIcSpZR/ANtnc4MBoX9RoLNg03mat5pOBiePjfdH065F5yxn48+mS0mC6UDXnrPqI1WKTDYW77/Q/A7pmVkw7CGRylmeE1AQAzji892EMUYw6LWpO7dGX6645LxIUEsVieEJRGKBwjLtQSYye0uR8Wqeggw92nNie8C1Z32q/l28SztBoU+ZZPeWcZt9n0CGhGG9PVqDxbchnO93I/cSFb4DJK65vNrG2YgyyE/HwbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: "failed to free memory for the domain" from "xl create"
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <f0cb59af-383b-62fc-d627-a4e3bee48874@suse.com>
Date: Thu, 19 Aug 2021 16:09:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 798e4f55-01a5-49ff-7b0c-08d9631afcac
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484840C6809BB3982899CFF0B3C09@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RxxtMoG+rMMTrliqQtRQjwx6joywJwfc+eE0qAx+zo/+zgHOhY9yv/gxNsIdEYf8twVrTn52Chx/DLz2sOVtavFtuLLvRywuU4SpVLU0itu04psMrlllQcJ/4g0lhd7Qn6JD1Rzkhk2lz493XVg0aERYoDU5RHAy5HsPCxJVCAh/6ql8lqGTH7Qo8BeZckytzGJ4vpVYUVxYJYZXBif6EVN39Ru+5UFV5zzu3Ja3d3spaurNETJrEuOq25uJR2IY14b7Vc5e6K3fzW68eNptq8VNtfcQx3hIYDPJpPl4tnrxZkb/LbsMIFUs7xcoxEcP7nxVqMEYJ881whRk0oxbs1+uWhOokEzIItOkisliFre615qfTf4EitdsqUeFdiQtB9i5SonJjThFPlMnZ+QNSi6MyR69hnxqpZm4bTz711P75z1lpCjptnLpRzH6pLcdz1OAnn9fPG53qZrv6vwJqqf2WS0JNQly+aVBTuGVX3Bcb+nDilxemHJMQ506foFANb4u69jtfdExHx//9rakeBs8Zw4fqYsy2g0mo8+GaRxJkoFbUT+Arl6BGqs/6hhb8kjsWm2b/1cymb4IJtz4zKBZDGf1siFWZd8ZoQzV2Ht/NR72raKI6KF+0UDoOdwIrPzUOEB/dr+ftYNyrQvOIQs75gymvaLHB9s9E8YJ1sFwOx69Wj4uBjuEGARgfVgG3mAJeUrf4AhxzwLztKWidfZFHPZkbCYGxjDMjfTUOxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(396003)(136003)(39860400002)(36756003)(186003)(2616005)(4744005)(110136005)(31696002)(38100700002)(4326008)(16576012)(316002)(6486002)(2906002)(26005)(5660300002)(956004)(478600001)(6666004)(8936002)(8676002)(31686004)(66556008)(66476007)(86362001)(83380400001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDBIaHRFYklFYkdQNTVTYlljNkozdFhXYUtod0ttUm1QR0JsaUJMRlB0SlNZ?=
 =?utf-8?B?WTZYNmlQT3NzRWoyUWlWSkpoUlJjdHZuOFZwM2JsM2VmaVNPclIxY2luRHFa?=
 =?utf-8?B?NHgyY0FNL2VhYVhrbkZlQ0tYZmxTM2lyazd5RjZodkRWTDV2Yng3RVpkdHU4?=
 =?utf-8?B?UnlNY3BYRGxGUXlyNG1Tbys0dHRXWlNsNFdZSjQyYjluMFlMajVZTDQ2ZStO?=
 =?utf-8?B?UklZcUtHbHhFNC94RDQyWUZhWitLUk9qRE1iQ09aTU13WWZhZW5jY1Z6bUt6?=
 =?utf-8?B?NUFNcmhZQXprOW5tZlhhekFWMFc3MDBMUHZoS01PMjhtT2lOeFQ1bXFZMTg0?=
 =?utf-8?B?cW5jK2pxaXM1SXNaQ3pLUW5oT0szOTRrV0hFQW9hU2ZaRTd3UXZybmVsekg1?=
 =?utf-8?B?UHVzVzk0MXNqU3QrVmI1Z2IvUjgxbGs5NlN1dVI5NUlYM1JqSFNEbHFaV0FY?=
 =?utf-8?B?RnhReWlHUE5LL1pnZFFBdjcyQzRWK01JTDNPck4veDZGOEcvUDkvUFNFQUZv?=
 =?utf-8?B?SGdWc2NRK1lqM285SndIbzVWdmZ2WXY0d0RPM2U3cWtFSTJTc3AreXVxMWI1?=
 =?utf-8?B?QVJKbDNEQ0FxQXNaZkxNMk1mY1dGTkl6bGZtQmVHUURoWHY2U2ZPakpCSUhK?=
 =?utf-8?B?MndSdmFBaGN4ejY5QmI3eGhYQVQ1Z1F2TEZmeXdHQW9zNjNZMW02UDQ1Wlp4?=
 =?utf-8?B?V0JhaVd5OFpRSWUweEcxb1dZaENBa0MvTG9QMVpieTNnVWs4VHRaUWhXb0dj?=
 =?utf-8?B?ODRUYmpvckZ3UWhkMGxIWWdFNDdGckY3dXJoRlc5RG9Zd1VPOEthb1hSeVV6?=
 =?utf-8?B?TnVCVy9CUVRmNlJqOWc1bHgyZjdLcVNjYlM0SUhlcGJaQm1EUDRORHo2RmRF?=
 =?utf-8?B?bXM3bUV1SHFiQnZzTER2b3dwL2J6d1Eyc3M2OURydjZTeGhvZlhtczZNVGJz?=
 =?utf-8?B?Zkc5amNRZnFIc05hS0NjUXNvR2tPVElnNW9tQUtKQUhlMk9HaWFtWGhUL1RN?=
 =?utf-8?B?bkNFWmJXUVpWSHJlZmhxUndjb3Z4UEwrQkllZEdhdG45b3g0TXN1RlFRTVhs?=
 =?utf-8?B?NXpTRjdrWUF1cjdIZ3Z0S0Q2ZDkzcmpVSkNtcTBqN3pFazVsR3NnSjN5S1Vq?=
 =?utf-8?B?OTZLY1ZiRFMrdURaUFkrYXVISCtkbWhIcnBadTlmWlROUThEclgyaU10aXB6?=
 =?utf-8?B?SHhFc0RNc09rS2dYeVhDc0NHaXMvaWdpWUtaQWVjTEFucVcrcG9TQW9oaFlj?=
 =?utf-8?B?dFE5Rk9FcW5vQnFWT3Q1WG1JTjI0Z3EzeVozVGtHRmlRb3NCd2w3TENSOUFC?=
 =?utf-8?B?ZEw2Ui9rSUhWUVRiTnRJYlNUUFlzT1BFQnptMjE2OU12cjhtMTA5QUF2Z3RV?=
 =?utf-8?B?VkZ5cW1mOVB2SlNHMUE4M1VJOTZOQ0xhckJYOXk5K3NwNzI4VFdaL0VnVlRw?=
 =?utf-8?B?VTRoWUg4QnpUdVVVQWJSM1craU50SkY5SVZOOTMxb1pyd3hONTZmR21idlI3?=
 =?utf-8?B?RWRDOU40cHM3ZEN1NnZYVzlYdGkwV2tiR0hjTDFRTmYwWmNoS3F6Mms5RWFF?=
 =?utf-8?B?R25YSGFhNm1mdXFpd2lpM0szZWNlaXI0aWZTYW1oVk9LL0JUcVFvSjJCK1dJ?=
 =?utf-8?B?aDJCMThpUFB3b1FsTGZoajhOT0h4SUV4RHJBOU8rc0hxZWFOdlFEZzRtMnpM?=
 =?utf-8?B?bEdEMUd1bkNDZXJiM1ZjSEpVSmtPRExsMlNzVjFudlgrZUFRTGxtSzJQME41?=
 =?utf-8?Q?x93thv8+ojmjzt5DB8bTj05f+N81AWb5c9Nof4U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798e4f55-01a5-49ff-7b0c-08d9631afcac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:09:41.0366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PezWooYQWH8TeuGqGLs9sPJ9VyF8gZRkmmlNYV3VFr7GHDYb98WjRT4cftXqTNrjsRdnnObJrAEzf4gQy+ad9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

Hello,

besides there not having been any indication what has gone wrong
(if anything in the first place), I wonder in how far the operation
of freemem() / libxl_wait_for_memory_target() is fully suitable for
all possible scenarios. I did create the guest in question on a
Dom0 running in strict mode on large IOMMU page mappings (as far as
they didn't get shattered by that point). If we consider the case
of Dom0 ballooning out a page that was mapped by a 1G mapping, then
the shattering of the 1G page as well as one of the resulting 2M
pages would result in _one less_ free pages in the end: The
ballooned out page was freed at the price of the allocation of two
pages to become page table ones. This looks to undermine the
"forward progress" determination, which I consider fragile anyway
as long as other parallel operations potentially consuming memory
aren't locked out.

Does one of you have thoughts towards possible improvements here?

Thanks, Jan


