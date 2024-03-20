Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23049880BDA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695738.1085739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqB3-00084Y-Hl; Wed, 20 Mar 2024 07:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695738.1085739; Wed, 20 Mar 2024 07:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqB3-00082A-DL; Wed, 20 Mar 2024 07:15:57 +0000
Received: by outflank-mailman (input) for mailman id 695738;
 Wed, 20 Mar 2024 07:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqB2-00081u-A8
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:15:56 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20800.outbound.protection.outlook.com
 [2a01:111:f403:2e06::800])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0f87e7f-e689-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:15:55 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 DB9P192MB1803.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.26; Wed, 20 Mar 2024 07:15:53 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:15:53 +0000
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
X-Inumbo-ID: b0f87e7f-e689-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeWUvx8IAv88gUAy2Gn/HkU+61H9Bnu2XWuF/9wd2+RX7A7DOtFxqsdpWqlcEk4ZzV4ENrK1NmDZ0gLt76j1/f6YQQFS7uV2GVhUli43rnRlIxVe38mdad3Znk/pL5E1dT1mveBXlEvCOHKvyKci9Q6WJvcAK5HOyDjmMzoAalpoyfeQb3vdK7ku10xixIyO9HyRyY058q0IqYeeRUIPvmJojYEnRkxZ73OTUd67K+k+JjbBFVkeeNVQ2FJtSpAuCCRbA140rqVwDi8GXVg62QvE9MA3AfsJWzifgHvQw6hJsaLRM3RTb/a4mpNxsLKNJjT6CC2ByFIjh57RYY6y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3JTWayvp2zlA02kxwKIhXk56tn7xdGc9Ij7EIftKEw=;
 b=NvgSNjupjgTZyHPQ7zubG8MZvqscCJGWQ+EYPRgMevESnap5tTQ1/H11yd7tEzZfqU618G50qNaJmMRTLi1QEgeL2/3focXf044zojAd0eg0thhQI/QSJiyaDz0Klop9Lbp/EOZCenALyGhEAzE6/Qok5XL2BbQZJeN/EhDfVWPajePl/yAcubRXMsYNQiJAnzuDmGLOepiW3FYe5iC8f8pT3LcANshQSvJGKbcrwfLDo2EdiVg2rCZnB4B683Pl36tjhb/0qIENEQnn8h8mn0p1NOMmj9A03EKc+sGiFffolQ1aKRGad6rHamjsOA87DcO5jSa7mjZ3XVcuFDO8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3JTWayvp2zlA02kxwKIhXk56tn7xdGc9Ij7EIftKEw=;
 b=PFaztCKy9uO6S8OZO0T5S59i/P60GbbMUrYbkeCFOIjNRWULWLu6Z/szmoYFJrJMj/p3LqN10cxaJ46Y5w4dCDPWtrXZhbri4KOXUSPmlzY/Jb1yEbFQ6CLSxai1u7X5OoB6YuCpmMg/HqzRzyXQz95PeXTBye3pCmx3z1BKC8TBkcheKcoTbX2v2Owxaq7g8AYBF4t+aMB8vruzD+Qx8TLhUOuOIjDVukIIAbPBD47ve+BGVRgi+gunxlN3rJIjMSJYvlj8Q3+/5lQ7Kg0Rc8Mt1gPUu4wVwc46Qti6SaTOjdH0kNyS0jbdkDTjponKxnyKjKoBmNq+5K7Xg22AXA==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: dragoon@waifu-technologies.moe,
	xen-devel@lists.xenproject.org
Subject: [XEN PATCH 0/1] tools/xenstore: Add missing XENCONSOLED_ARGS
Date: Wed, 20 Mar 2024 08:15:45 +0100
Message-ID:
 <DU0P192MB17004F56DE9EB04D3F4D8D8EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [9BxNsNyN9ENCBg4Qhf9Or4LXtetWuoha6zAsSETpHbKddzyVVntSTih2op4xpgg7]
X-ClientProxiedBy: FR4P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::20) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <cover.1710892585.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|DB9P192MB1803:EE_
X-MS-Office365-Filtering-Correlation-Id: b6205030-9c99-456c-ee1a-08dc48ad93d3
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBsDoBs/oZrXuoWrSByezst7rX08iiK853llmEJoS9YRreFq0n4imtr+opg6nQNU6Lkx1mf19wQDOYrJ9nRrSzI84Y1XnZS/rEW9QmPQk6HiaZbTMGozsPUqEDuzzTqQ3/TF7r3YQoesyZZ26+OSExf1c5SMyfKrPQ9E+iUIFokxjOxXanjdcvPVMBlQVFdJqEIlYGq0lHq84V4ptX2FO+ou5rxjD68xW/+0tTHCHKTOKsHPzcGjYSCZ6xSJ4vAgGYKxPS/3alJqAnFnJlRKCwYk+Z8qXAm01eW+RM7PK9bvMpmj6bZMhuW3hlDtzdaidBnuOa+5Q/o/OAEWFu1qOlJ9UKNhq+ibtsq+FSQEdOvpXGX4oo+s9e611HEya1rGxt6HUvaBj1wqnlsOykcAXkhOJdQFSZuIK71sZL9/pQbmmXco/26QK1lqtG/WWAsFhVH93SyUC3K1Bh0inkyeEcRGwOo7FME9c4TnGkiiJF+7eyslKv3oH+WlAmrId052o2ZINy7wLuwD/vg6Nl/Zn7Q1QcH+GJfgq+ryHyyEVrlvayCBfVh7+ZWd3DhIiWpkzcevUvILEcHO93WQJth9I2f/zZ/n4EZmZyD3X5mkhYcq0lRVgC/XEw5lkHfUhEgR4MdA10XrCR6BTQRR13WLF8xwFH0dML745GEA0ehvO5lUhh71Z/6sg/sy7+LXcUOtJs0y2/SPiz2nknXH5HjTNk0/aImJuofW6fJqGD4K+O0xXA143tFY/pMFgfOAvp3hRg9HqgNa6WdVhoIl5vCpNsiH
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZIb8U3fmmGA/OQf+LNw/LAJXKeEAw4N7v8gvwSX/dPBFB1TYw3o90YOjVac0ALmGs+amzxMxLHxKNnsufJYoiQqTpap2dlwhQMPAfFfY/+lCtn96W315gaqG2jIRQYSc0yYqvxMViGjV/ADC5OTWOJRKGqT9dp/aybkC/D6sbA4iBTbaGIO2HjkvIdG1KSsVsKmJhyVGUDZFXbTs7B5xNF2DaoLd06kqby0ym8UOopPNQ2M7Fw+tFYIciEcAuDwo0DVbub6FWhSFKmtTkrGQLu/JCTled04+eAZWdngEeQxspTN4T8RiweWFPLo2xEJt6H1+HgELlsnyU4vzxVKzJrSLCZ+rzPNC734LkytH0nwIt0tfdlNhMOGViStk+8lsjnrYQ4WpyPNa39kea5NCokBq2VoPdLnXugwSecpqeUCniaPALcQv2AhNkLP12/yQnfNcZj9BvdpvhaFBXfu2XHnoWHJBXSJFgsAybEhIC/We3l2y0zVo72wVEXe5NjeBaBtplQfRjRNGI1P4ZibeaWqTwZbbQo8g7s3Rx/EP1Cl8uW7vKd9sdqi2UjIHW3pc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T21nYis5ZVhtMms4WXRMTVdXUGNpbHk0ZW42OXFJVzcwWERNQkRpTUFMMXZP?=
 =?utf-8?B?OXBJaUwxbU1RN0o5OVkwTTEyTk5zT1lnbmhVM283b3owS0ZFcWZEZFFzcXow?=
 =?utf-8?B?bUJ0d214VmdwTFRiWC9vcDcwUnZUT3BEK1dRVHo1VlpBUDd6SERDcmtNQWNO?=
 =?utf-8?B?anJhL0RGTkxUenNuMXFhcG93bXNWRk13SldqRFRGVHZqRlBCc2JFWUlscXQ0?=
 =?utf-8?B?QjNHVFRhMlllWnlLZlBWZDlKRFhhcXZrZFk1T1ZMSFViRElxQXlxdGljUitt?=
 =?utf-8?B?bUJ0cFdtU2xEMldCbVdoNXQvb2VONE10SXlDNVRqZ2RZZ3NpM2tjYUZpZzN0?=
 =?utf-8?B?MyswM3BvbWtaMkprT0RqMjBpcFlGUXZKdzlua1lDZWdwWFBKRDYrZTZCN2hD?=
 =?utf-8?B?K0RTMmxvM3lINnk1RmZFSWFYNWg0cEpFNmQ0NDMxWDNPNy8vSzRzeXJuT2lC?=
 =?utf-8?B?bkZCdUErUVRLQ0dDZ0o5bDJkTHZnSjR3RDZSNUFWK2RvRFI5NEZoTkFJL2lG?=
 =?utf-8?B?TTJaTi91cGM0YmsvQ2Exajk1OURTam81dlRiQk9ZS1pHUDQ2b3pEdUg0Yjda?=
 =?utf-8?B?QXNna0NrbkZ6L2xXcVpFWUMvamxwSWNxWk5rYWF3L0lmQVZ6QzFmb0ZudjI3?=
 =?utf-8?B?ek52dndqRkdSNmNhdmczMDcxcERxc1NxdTdpRHVOV0EyemcxODViem1XSzlS?=
 =?utf-8?B?ZGFtUnhlY0NVWi9wbDFyeHljb3AyVHQ3ZHVGUE1Xa3oxdkVDWkRzSUZzVmNH?=
 =?utf-8?B?OEYvMVQ0ZGE4Y3NwZklNZitmOGErWGJqTTdBT2haMlJYeFNsQnNVYmw0cDh4?=
 =?utf-8?B?UEhvT3NvdnZsZjlRbHRWUW9wSFZwZGt4czZGdEZ3dUNLeGFOYjNJbzhwcTdp?=
 =?utf-8?B?R3IzeXVGeWg1NDdDWkZzQnhZVzJkdkVORngyUWRIT0NuaGJ5ZUNSVCtNcG83?=
 =?utf-8?B?bUdKdy9aSVc2MTZtMFFsWi95R1FVVWdya0Yzckx5RUgrVHg3allHbmEzTTMr?=
 =?utf-8?B?czBiVXhENk9Pc1dkbCs4RkNZcFJLRUo3R2pZOUVjcG9jUWZEMDZkYk9ldzBU?=
 =?utf-8?B?Z1Q3eGN4OW9aaXduRlhnRGVCVmFXZ1pVRGNKNUpWMGVhTkRQNDlIeWZ2QWN0?=
 =?utf-8?B?eTVWQVluZ054eThMamwraWZUbTAra04yYWJ5clRCYTVyMVZYcmtRb2QvVEgx?=
 =?utf-8?B?cTAzeWxJZWc3YnZ5aEk4VUl5dnVKbytnbndLRmtxN0orRXJxclNrNy83MDVn?=
 =?utf-8?B?b0plL2FKempIa1AxOG12ejFmNVptVGZ2WnM3VDdMbk5vWkxHQS9Vc2U0T0Fp?=
 =?utf-8?B?aVhsK1FwcXZxbW4zeHB5ZHFTaFRiN1ZXUHZudVF6dzl1cjRRVVEya2IyaDFr?=
 =?utf-8?B?dFNnVmNrcUV0cm5KZmhnb280VzZMdEovUWV5a2xRMDJRMUV0UWNsNENEYy82?=
 =?utf-8?B?UnpvZDE2cndjZEltU2tyeEREaEo4U0p5Z05nRnRBVjgxQTR2NHMvSTM2RVdj?=
 =?utf-8?B?djl0S0dOWnJ3a2pzQlU3RzIyTjF0K0JEbmtFMnBFdkdzaHRuNXIyQ3lUUFpU?=
 =?utf-8?B?a0RGdzZwY21xZTV4WU0zMnNibUdFNHpMSFZKdlgvUldxZmFPNzZqc1FMWUly?=
 =?utf-8?B?RjhTUFV2RXdrK28vRXBxOTZnMlFSZWlFUDZRWVJPRXR0byt3bC9HSjYxR1ov?=
 =?utf-8?B?Z0NPZG5TYlBjRmorNVAySCtKM2RWM3Q5WmxwOTROcTVDMmtSWUQvVDVCVi9n?=
 =?utf-8?Q?XTAXLslzURpyElWnf+v2b3sdbUccJM7EZimjMG1?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b6205030-9c99-456c-ee1a-08dc48ad93d3
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:15:53.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1803

I noticed that the systemd services referenced the XENCONSOLED_ARGS
variable, but it was missing from xencommons.
I actually ran into this when experimenting with a Qubes patch where I
thought I needed to modify this variable. It turned out to not be the
case, but I figure it's good to include this for sake of completeness.

Rafaël Kooi (1):
  tools/xenstore: Add missing XENCONSOLED_ARGS variable

 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.44.0


