Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5583A938C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 09:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142728.263276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPjS-0004H6-Sz; Wed, 16 Jun 2021 07:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142728.263276; Wed, 16 Jun 2021 07:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPjS-0004EC-Pw; Wed, 16 Jun 2021 07:13:02 +0000
Received: by outflank-mailman (input) for mailman id 142728;
 Wed, 16 Jun 2021 07:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltPjQ-0004Dp-N6
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 07:13:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd96ad3a-f0a3-4e4a-a50a-1b93ac9ffc58;
 Wed, 16 Jun 2021 07:12:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-ZsQq0u88PeSZP-64LMqb2A-1; Wed, 16 Jun 2021 09:12:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 16 Jun
 2021 07:12:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 07:12:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0130.eurprd06.prod.outlook.com (2603:10a6:208:ab::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Wed, 16 Jun 2021 07:12:54 +0000
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
X-Inumbo-ID: bd96ad3a-f0a3-4e4a-a50a-1b93ac9ffc58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623827578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uu42hhXTJxWfqXPKGA+KoO/ktXYcsraGGukZ2r/IfFg=;
	b=NckYuRFquKo5BTbyATZoCvPxNOgzoAiR8dKsmqSo5ZKXRgLOo+6X8apd5nN1ijVwwlO+3+
	9+EIiNk/rXD/+v13zaWUf+/TuhewipzGH/z06k1JVgBSwu6DIxLbyS5SBaassjjiA5eP9v
	UFl/+ABMOkxL55cdgBI/tMoKI7kd4lU=
X-MC-Unique: ZsQq0u88PeSZP-64LMqb2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD1eCrFCrrsE/E9OE34ujfnP1myPgIGLGGNiZfQgdqYgcKjWXTuL9FBTODY/3NI7yrwM8EJdn1A0rAvfK1QuphTGWFFizIDVzYVzInh717PfbmmdshnekTcH+lHWAeRLTVudE/C7LQqrYWesnvYwIHuyRXQ604KzojFREvU9sigG+rhif66RgTJEMvx/ZMwiatuYeGpXidFNCGPQUBz+FJz6MILtzhgswEfY+OH6AFChBM7s6UbK1xUyC/4IyI++BnYt+13FVNvIqc0XB82FNLTCRAmJTri9Rbe6/N7Eq5CBjaoASxKNgbdX+tfs9+w8iohC5jrDCEqrCjntaSdvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu42hhXTJxWfqXPKGA+KoO/ktXYcsraGGukZ2r/IfFg=;
 b=dASd4WUtD/2FZI/j9HTMQS2wBckXuJsrNszuEtw+mAGxa3iIW0YH25Xs6BN53M0m5R/ocv/9oVBKxauM2Em+BGzva+jxSZLnwChwFtjn+LdShlhfcRwRiQGVYYZDt5FbY326yYQp+4/iE2WI14Z04a45bv07Co2Sq/ieuiPjT+02zJIoU15Rj9DFNPvnbvoj6ENUWpSVQ6UKs6fUlcFHeeHV95699S78eWXlSyDxKBD+Pr/5+rM5oazmPm9rytCCls7KgjJvUxOw9ZcGydAWlbbcH3mdM3akjx8m0OKtUUroViFK8zi4/72lMzXvFdyGP1OP8M5KggPstFMzOBcTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 162845: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <osstest-162845-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com>
Date: Wed, 16 Jun 2021 09:12:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <osstest-162845-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR06CA0130.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99ee267e-458a-4e36-f51e-08d9309629a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32937E05AF12496CE2B0DABDB30F9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YEHBy52hxA0ybpDvhGMVl1r7wQ62zWKe01ROfj2/tRx0iMp/V6Rh0gxRDx4Rtr1F9ffQ6AnOrm9bpLp8o7SwemdLjVy5uoeMtUZ/NgSNuZ2ZR78mujE35XVLRq5IzXLNy534nT5J0TbVVAQB8tZaNdQo0wYEaic3wZTUFMHF/wGrkcUOyfUbtpuP5VrRkEHxeqWbhTeysFyBtZ3lGJ4TL4VdGBvkR9zuunvtCKS59kuxyBIJ7wEJAM5lvbyeI2Q+5rESR4VnOL0eMy5T4SJZ2pkt2QlF/7wqZNEE2ITbi+HJtO9kAdxYG1jj+Xs7mLYu1Em691vqzsE2bGjizNfxPFXKZa5QNCUuDoHGca6taHRA/TSX3HyJfEK7aso1OeWCMe2EUnD8tf65rumF1sWJsbwuCgnKNrCA8FNEuVjH6N9L/T974XIjqF2RkQOlFzESdSxChhLSaZhyNcdfF3NcMD4YNz958cEq/LKrnzaIi3tVcnAf2IPkAh7MKuhkXi0hr5EIWNn7mBlDI41nCH6+Ep9APL9y0lIzz/7nKcjJzVqxKYUBNhtEcbQp0e1cNx65jDwn8t3KhSsy3L6Q3sPc/1ewiuHSmgHyXYKSBhkJuusgqQ2vp3ZWr6vAkQYx65Uiz1f4qRBboRjcUoe8pyXF/xi4481u9r/hja/iOiaKP87yzgFOtG+7/gL3/5ZI1jvgcNprwNrv/AGetnne3/T/tMvkSjIOk054li3iSe+t67MC9pDW2A3TYdv8VWRpzHfjvllB5U6ieIkBkVbrE88XneMzLR/YFSBsg5SHpol5o3ZXAUW5Jmae7/3DH2kNHS6k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(66556008)(36756003)(66946007)(966005)(16576012)(53546011)(186003)(16526019)(66476007)(86362001)(2906002)(316002)(956004)(31696002)(2616005)(4744005)(5660300002)(4326008)(26005)(110136005)(8676002)(478600001)(6486002)(31686004)(38100700002)(83380400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjA4OVptdGpkZkNjL20rSm1Iek5GeHUyMC9WcmVkWTl0enBZVVY1eGhHSW90?=
 =?utf-8?B?cTI1M1ZWMGw4UXRwem5uYVc1UTFBcjZodFZweTc1ZVM3SzR3MWYrUHc5ZENi?=
 =?utf-8?B?TzRUVWFFOEQyZUFXelh5eURNb050ZHNxTU9WbG52MGdnVFFQajMrZzdYQVFD?=
 =?utf-8?B?YTNOckJQaGpYMEppL2FMNzdTWTR3YTRwdnI4MVIxdldYblplRVpua05BN1c0?=
 =?utf-8?B?Z1VjWVBqOEhwVWg5R0p0WGZUV294ZTBpT0EvSS9RaS9BU2lxRHRObk5iYjQ4?=
 =?utf-8?B?ZzZGRmk3MlVzUnBhRWxaYStOeGZZZTNRMXIrdEZrb3VqR1J4bWJiNlpMRGNX?=
 =?utf-8?B?UFI1cmtsUWRybzNlUVM4RUVLaEZDRkNzYmdCSGdpbUxrbU8yeENZMVFTYXhB?=
 =?utf-8?B?L29ucWdRUTFvZmd0MnlkUW1BS0kxU2R4RmYrVURCQXkycVh6ZjY0cHU1ZGZp?=
 =?utf-8?B?UjBpUUF5WWdYY3hVT2JXbGxpd09VekdSamhvNGF0eE1HOEVHNVZDMVdid0RM?=
 =?utf-8?B?NGVzazFvVDJjMFozUEJJZ1JJeEdnWmJ2VUVHK3pQV3l3L1pYQ3daaU9wN25C?=
 =?utf-8?B?UU81WTJ3M3FvV0FaRHN0bkFXL3dHeUZScW14NzNLRk0waGN3azlya29YUjRr?=
 =?utf-8?B?NjNxbGorUTQ5MEhkc3FWcnJtcmYzMkVMRlNRV0FPQS9wOXh2VDlEWnhUOXRG?=
 =?utf-8?B?U1RuY3UrdkE5Q2dGOVcyaEducHA5aDFXckFGRkJ0aGtpZnNTNmhtcVpUVjdQ?=
 =?utf-8?B?QTRrSjY5dW82eUxPZzUwVWQydUN0V09NZHRKbFZUMmtBWDZsUW1JUkZjL1B6?=
 =?utf-8?B?WWlVSVNaNEkvMm96REgxRWdzT2hKcFJOYlpBeUl2UGhsbSswK1NtMXYzNlV3?=
 =?utf-8?B?Z2M0UytsNVdvODNFNHhGREFLK2NkL2xxckJ1NmxmTENUSXlFejZUU2E2NDhQ?=
 =?utf-8?B?c2dJcVVNVGtDQmRMMFNpR1ptUUJWa0tXaE9UOGwxbUl4b2R4b2ZXTy9QSkF1?=
 =?utf-8?B?T1BVMWNlNjg5VUxRSjQwRzRHZG53VDBNZjlnenRMVmVwakJlNmluM2lYR1RW?=
 =?utf-8?B?aXRKTTJ1dFZ6cDgvUHo1RDBhSkpYd2lWVnpFWm1XemlvSW04MXYrU3p1SDh6?=
 =?utf-8?B?NlY3K1JCVm1pVzA3anR2bE54NGtValhZeERvTkV0QTE0Ny9XSjhobGR3Z1o1?=
 =?utf-8?B?Q3lJaFRldkRXWmRXd2tkNWF2UnFQSmdmQXAxWnd6MHREMWlNdzFhTFdYc2FQ?=
 =?utf-8?B?bEZZVGdyU3BZYUF3SzUyRjdpc0FGWFFHRFg5bGxKWDBOQlNZSEkrbjE3TGw5?=
 =?utf-8?B?ZERLYUdvd0Yxc2haa05LNys2WVUwQ2xxVitwWXJQVERveHVwaGRWZXpRdWlB?=
 =?utf-8?B?cWRia2VzTUswaEZHZGE3U0NUV1YrSk1HVktDTFZPQlg5N28xd1VQWkN6Z3JO?=
 =?utf-8?B?anNaVGtycUg2RUJTS3VOMkQvU2hWM21kOEhtRFhCL1c5U0xqZ1NmWGxUZmI1?=
 =?utf-8?B?RTFnRWs5TTlQR2gxOHdxL1JwTGU3RHFjaXNDKzZXdXFmVnJ4eHJ0a3MvVkli?=
 =?utf-8?B?RlhlcnZYSHRxZ2kyVzlhQTdCbUxLSHNucFpvRzU5U2dHcUxkaGxOZFBCQW5h?=
 =?utf-8?B?cUdnalJ6OXVlYW4rNkZXdCtCc0tnTWxhYW9FWmY1d3VSUFhONjUrTkQ4VjIw?=
 =?utf-8?B?Z3JqVmUxOEVkMC83OGNqZXJRZEVDODZNKzlSS29mVmpDUE9CakxaUFBWcjlv?=
 =?utf-8?Q?C2QIkqn1t707jEvvWTUs8lzv75L5DjWxsXkkHql?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ee267e-458a-4e36-f51e-08d9309629a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 07:12:55.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JebKgzJWdKdfh1i+YUo5g5bYj4gcYvWod7l+CL97v5YDzFJTRj02wMwewuW5cjrNWCsTnFpOY+M8/bI+VNPElg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 16.06.2021 08:54, osstest service owner wrote:
> flight 162845 xen-unstable real [real]
> flight 162853 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/162845/
> http://logs.test-lab.xenproject.org/osstest/logs/162853/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 162533
>  test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 162533

There looks to still be an issue with the ovmf version used. I'm
puzzled to find this flight reporting

built_revision_ovmf	e1999b264f1f9d7230edf2448f757c73da567832

which isn't what the tree recently was rewound to, but about two
dozen commits older. I hope one of you has a clue at what is going
on here.

Jan


