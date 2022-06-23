Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F74557560
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354581.581794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9b-0006le-Gr; Thu, 23 Jun 2022 08:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354581.581794; Thu, 23 Jun 2022 08:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9b-0006il-CE; Thu, 23 Jun 2022 08:25:31 +0000
Received: by outflank-mailman (input) for mailman id 354581;
 Thu, 23 Jun 2022 08:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9Y-0005Uq-VK
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0918ba58-f2ce-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:25:27 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:25 +0000
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
X-Inumbo-ID: 0918ba58-f2ce-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hWcVLNaotcKVHvD2Y7Nh3KgfaTFcIeIe5XDhmeBgrpo=;
  b=KnifK4c21ygIHcdUE97aCDu7cKVlxALqsrw/Mka4UgBtUjZO1kBbQRBZ
   OGNYWgq56WipSdeH1CFqHNF3LstMNr5wapQV9LbZszHuwtM25y2nrQWmY
   6CqE7jPk0+4Ghw0hnQyjChBxdtVBYMX6p2/U6DgOvn/TqG11u4u6rCN6V
   A=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 74257084
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2jM0Mq5O7mFisw188LihdgxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mQZWDjXMqyMYmL9eN8nbI3jpBtS7JbVx9I2QVM4+Sg9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWVvR0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS2UDt3Do3+kt8heDQFPiNxMbFco7v+dC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YHg1/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IE8g/K/fpri4TV5CBOiei8FerHRvuhf8pHmmaTn
 13h0nusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFDpZMoV564kxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:VnTGCa31+BmutAKtSTJEWQqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8O3WBxB8bYYOCCggeVxe5ZnO/fKlHbexEWs9QtrJ
 uIEJIOd+EYc2IK6voSiTPQe7hA/DDEytHRuQ639QYQcegAUdAE0+4WMHf5LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+FZgNYtvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74257084"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2ehmWVdJvUw66ElPaZ1bc19Zq7K1yj0i7CAiHcaEr/3kCdTz/QPJtNzD+/1nyWEBm7S3AMKfOJ+aHM+u7oHeL5d5UkjxbujUhfG47ZmmtBAQ4hJv+R1B5qyNq4UcTwr7x2O7qydx/6vfsbvtkL7edaLwM3DDVFhvjYJlC8fZhwUcbaNZehBFAYhHOJRx4VkEpuXX3V7N/zjn87B7TfamWvstNeih4G2icH35SKp/MU7Juu7IZ+EKuELut+MssYnHNpz6c0qThe6Dc/7apen6eHu+Gq7ZJCsdLsYPlSKFVUCe/Ng3S9Td4dN8Q/j/I/IX6CN60iyxdWBIUFQG8MqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVzwTq/xdU/s19XtAghAqqOGblBvPwgi6X4ZhhHGtpI=;
 b=g7RSb/YUYYNlt3ZhUA0b1/22kE1b6SSCn5l0lN2fUejFprizKx577XrWZenhcdB9ets4zwv9JKD8YF3lbvdxe2s7xD5Mi1XuRvWt79f3jm5zRV8hUOTPXdZcWmJBzuSad0uSep5tatE1d4+05tPIlvDj0+YMrhxRNii9CCzblAg5uurzGjgH1y+iItuetMWKLf24vODoFn8/IyChQol/4XHXlwoCHFfzZEGg09QRBtMLD4mSsxF9ZmRuubV13TmqS4SjyPoDyyw7lQsVIMvivkLM31a2U5znfJmZik0mGYs3Wzblnd4DMEUhRo1DPV/jIlBxcD0w1Ct9tbtoV5E50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVzwTq/xdU/s19XtAghAqqOGblBvPwgi6X4ZhhHGtpI=;
 b=IhBmCe2429XqK9TvVOS9uiLWniekxZvd/+7dZhYLEY0oVG1vYR/aOJVwJ0NayspBl7xF3G3pS9EJgwGyfm85MaHuULuaHMJNEOxa8T+o+OZ9nrSentBkqyjX6p5P3GE30Gl0UOprhHJdoFp/AghU03670BV/ivykpR//FssOyOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/6] x86/irq: fix setting irq limits
Date: Thu, 23 Jun 2022 10:24:26 +0200
Message-Id: <20220623082428.28038-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623082428.28038-1-roger.pau@citrix.com>
References: <20220623082428.28038-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d776e669-7b2d-4ea3-d4d3-08da54f1ec01
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB500848845E4BD965836E07C48FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DGdaAAQBwwtYWoBcbDQ/PRYDEKWwmjSixRheUY4bUdtzg9hHge6pQNHXLpHkBE3HsQ9D6D2ZhPVrkABRYl/agzM/fpkOeNgJot+aXrdJD5FL4SGnSIidHL1WtrmYLJzQ18iTt7J7rel9qAmrKM6PNd2qYAupWWag9zGxrWrzhNjkKhkEeffnoOc7BvZp60JMWY6+PXMWfGA8nadO3VgJmLLWgdqqr/00YnIkwXc21oFhJFZ2FuPwCVRxAOyu9knxUdZaRNvQa793aHHZe51cv85R1irr3Nz7ZZBp+CBVETBeR74Af0UgKkMMDxjFIFcScBM8WXmM1mu/0nYvPIKTTwWOBkfx+4127jl7DIBdB6jVBgVIawEQqHIBUrEg0Bfkx5e+psYkJdBG8XPNkhGtSAMnb9OLeHt77MjbQzmHGnQvA9oL6oS6dkH8tiA0j87LE3ptEJI8yZkNzjqOuU+0q768/UoaQWdVsrD4zvqn8ZvAgasURZWreXet89eoh2jRxQHNhQMDm9VbWuVT1xVW8fVEsEu/OXMxD5w0X0150WdHQpSZp4w9U49PrmKRiAxyXW4momOzyKkIQPutKM+Qdn1x+D4Vk3qvEqLzs1YZNW55iV3HGB+MjpV6e+lHai7e3Edh57d2nLXTPSTFUnFFjwF0ONCXEcTBkgO4ii9ozOR9cjng0d0y8jjHDzfL7yNetN7d+BRlV1n7D8t6VGYT0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWgvak16WUNtYkRYVWxidVovT1JmTG9MNXJjVUhPcjFUaEtEdUx1WEIwdTM2?=
 =?utf-8?B?RnE2NUI3WFJKTWhhL0NWMVVFZldPRFFnd2ZVdjh3T3NUdDNxYkRqYkZNVEtp?=
 =?utf-8?B?Vnd4VHQ2K3BWSHNlOWhhbjBmdXJHUXkxeVJ5Y0hMTUorUCtHQk4yUmVNb3Rv?=
 =?utf-8?B?N0Z4QllqekErR3VXWllVVlFyTmkzcS9SRHdzK1BHekVybWRUa09LMUdPSkxk?=
 =?utf-8?B?ODk0TDRmajUxTFhUUG5JWDExa3Y0OGs1WE5HbXlsODZGVjM3NW9pT0grWU5w?=
 =?utf-8?B?RGFjQVZab3JCL1l4L293STRDeTNPaktZaHFJZzVDaGtUOW11SVN1ZmxRdmh0?=
 =?utf-8?B?UGFzUHlIOWpjN1R0QlExaFZlU040anlJUmNWdmJGWFgyYUk3SlQ1SUZVOWxv?=
 =?utf-8?B?b05sTnI1andXMnl6bVNrMnFNbVJzUUg2b2hiM0VzVHFNUGl2YmRiRVZLdWVD?=
 =?utf-8?B?WGJyZnptaTBpTnhPUUh0VGlqZlZKUm0vR09OVzl3VTNRRnBFNWViQ2FGYTQw?=
 =?utf-8?B?eXQ2UlZhZzJxQURrTU1hQjl2RnI5QXdNREZYREFTK2FSeTBsM0VpUjFZSVFp?=
 =?utf-8?B?RUthTWx6THB3Uk1ZcndVZnFiQkUzQm03NHBBNytybCtTVG4wZnlReTJjYU5L?=
 =?utf-8?B?dW81VWZrd1RkRnJHaExmanREVmttd3FPVXV5N29mRnhaUVh0SEpaZUpCd2VH?=
 =?utf-8?B?c0tOeVBNVm81cVhVTzZnc0VNUlBMbFFZNHRvT2gzM3BQN21kSkpnK09XUDlu?=
 =?utf-8?B?U2FYVUFCR0RJZEpjZG4xdkhWTkxHN0RyOXFOTGpwTkRMb1F6a28vUlArbXZm?=
 =?utf-8?B?cVVLdVNFR0hSLzlaak4rTGpJUW1lRDBhMmlVN0Nxa2FxdDd0VXpPaXRaUXFz?=
 =?utf-8?B?cTBGenRSNm5QdEIzU2hudHR6dGFDWE1wbW82RmZ0UGlGd2FtRTJESUNRVXJn?=
 =?utf-8?B?ME9JNzg4bVBXR20yZnJFYTVxVTlDRmpsTUVTeUY0ejdlK0tCTStLaXUxaEtN?=
 =?utf-8?B?ZTNydndMWXNJVVZyZkxadWdxRGE3Z1dDTER3THdEUmxNVXpURWtJWTNFR1lI?=
 =?utf-8?B?Zyt3SGVMVWFBMGk4TTYyelJIOUpNSkRWN2tueDRNWUNHWTZqbHNVUUZWc3B5?=
 =?utf-8?B?VlA2ZHBGU21TYytyVVZQMkZRZFN6YWR3R0JXVUdLR3laaWF6eDhEdDA0VnVE?=
 =?utf-8?B?bU1aQUY5QmwxMkJyYmFIRFBPOElubkVOU1p1RFk0aG5WMGhzdHRGTTNiVFdE?=
 =?utf-8?B?WVgvcEladmhoWHI5b0dyZlJrTEhaVTBOSFM5WU1HaWcvU2ErM1daQml6RVpt?=
 =?utf-8?B?ME9ydFFzSEc2bXc1ZWoxYm9XVjhGdGFiNWVYU0RwVy9SMnhNWHptSW5zYUtG?=
 =?utf-8?B?dCtteCs1K0hxaWxtbEV5V3l5S2s4b1ZITE5TTU9RbnJJdmtQZlB5TEVTMVp6?=
 =?utf-8?B?WkpIelVZSXhxOU9UOVptNXErL2pRNFZOdzdxblpqOU1obmhZUjUyeHBQeEVr?=
 =?utf-8?B?L2x6WlpFdkpYcURpaFRQRTFENW9BK2xHZ2k0N0dsbmY3d24vVlBMSzh2NFla?=
 =?utf-8?B?SHVrUVd2N0k2bGR3NHFOQXRqVDBSM21FYWl5cUFnb1RFYWdGaEdYMmw0NzNI?=
 =?utf-8?B?Vllack83N1dHZTZGeFhsb2JGMDhKSWZKWE5GMkY0WldQWDJOT20vd0FjM0Z2?=
 =?utf-8?B?R2pUb21aSzRCNXNrZzlzczdGenBiaW5pc05QWEYvZDNJdnROZGdiZDhkN21r?=
 =?utf-8?B?Vmp2QVY0T3pNRzdKaGd4em5ycCtWZ2lwejdGVW5hc1R6eWxEa1VrNjJYTzJi?=
 =?utf-8?B?U2t5bi9vVVY0T2wwbTR6QVpONjdINWZBRzBLeVZkUHo2VVkwM1pEZmNiNTBF?=
 =?utf-8?B?alZORjkzcGY1cThtTEE1YlNjSzB0U1BrQzNiOXQ4eEtZUEsxUFF3UjBsY2RF?=
 =?utf-8?B?ZlNMeXBxNUNGOVBTRVFkN1g1UVA2K0VUUUIzN2s3TkJYR2N5Y3FaMmNKOE9u?=
 =?utf-8?B?R0RORlpOUkhtS0N2T0RFdk9sYWdaVlQ5VmJSVG4vODIvMnBEU0I4RDRWcG91?=
 =?utf-8?B?dGw4VjRnZDFCeEVwMzZhcUxpOXF3QmpiVndpc2hpbXd1YkVmaFlXUGRGZnAy?=
 =?utf-8?Q?LFTrvsTFEmeuQvmvIvdbXlEay?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d776e669-7b2d-4ea3-d4d3-08da54f1ec01
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:25.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D481zu6kv/HZs6btEfI6qh+lPwliaTf+EWPNjcDaRSJbL/Qjy73kFSO6Z6GycIwZZhDHpVk9Vv4mw7xEGNn8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

Current code to calculate nr_irqs assumes the APIC destination mode to
be physical, so all vectors on each possible CPU is available for use
by a different interrupt source. This is not true when using Logical
(Cluster) destination mode, where CPUs in the same cluster share the
vector space.

Fix by calculating the maximum Cluster ID and use it to derive the
number of clusters in the system. Note the code assumes Cluster IDs to
be contiguous, or else we will set nr_irqs to a number higher than the
real amount of vectors (still not fatal).

The number of clusters is then used instead of the number of present
CPUs when calculating the value of nr_irqs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/genapic/x2apic.c   |  2 +-
 xen/arch/x86/include/asm/apic.h |  2 ++
 xen/arch/x86/irq.c              | 10 ++++++++--
 xen/arch/x86/mpparse.c          |  5 +++++
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 4b9bbe2f3e..cd1f55cad8 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -228,7 +228,7 @@ static struct notifier_block x2apic_cpu_nfb = {
    .notifier_call = update_clusterinfo
 };
 
-static int8_t __initdata x2apic_phys = -1;
+int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
 const struct genapic *__init apic_x2apic_probe(void)
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 7625c0ecd6..6060628836 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -27,6 +27,8 @@ enum apic_mode {
 extern bool iommu_x2apic_enabled;
 extern u8 apic_verbosity;
 extern bool directed_eoi_enabled;
+extern uint16_t x2apic_max_cluster_id;
+extern int8_t x2apic_phys;
 
 void check_x2apic_preenabled(void);
 void x2apic_bsp_setup(void);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index b51e25f696..b64d18c450 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -421,9 +421,15 @@ int __init init_irq_data(void)
     int irq, vector;
 
     if ( nr_irqs == 0 )
-        nr_irqs = cpu_has_apic ? max(0U + num_present_cpus() *
-                                     NR_DYNAMIC_VECTORS, 8 * nr_irqs_gsi)
+    {
+        unsigned int vec_spaces =
+            (x2apic_enabled && !x2apic_phys) ? x2apic_max_cluster_id + 1
+                                             : num_present_cpus();
+
+        nr_irqs = cpu_has_apic ? max(vec_spaces * NR_DYNAMIC_VECTORS,
+                                     8 * nr_irqs_gsi)
                                : nr_irqs_gsi;
+    }
     else if ( nr_irqs < 16 )
         nr_irqs = 16;
 
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449..dc112bffc7 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -131,6 +131,8 @@ static int __init mpf_checksum(unsigned char *mp, int len)
 	return sum & 0xFF;
 }
 
+uint16_t __initdata x2apic_max_cluster_id;
+
 /* Return xen's logical cpu_id of the new added cpu or <0 if error */
 static int MP_processor_info_x(struct mpc_config_processor *m,
 			       u32 apicid, bool hotplug)
@@ -199,6 +201,9 @@ static int MP_processor_info_x(struct mpc_config_processor *m,
 		def_to_bigsmp = true;
 	}
 
+	x2apic_max_cluster_id = max(x2apic_max_cluster_id,
+				    (uint16_t)(apicid >> 4));
+
 	return cpu;
 }
 
-- 
2.36.1


