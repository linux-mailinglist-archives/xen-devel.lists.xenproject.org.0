Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE541B2AC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 17:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198073.351385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEm8-0002X8-F4; Tue, 28 Sep 2021 15:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198073.351385; Tue, 28 Sep 2021 15:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEm8-0002UK-B8; Tue, 28 Sep 2021 15:12:08 +0000
Received: by outflank-mailman (input) for mailman id 198073;
 Tue, 28 Sep 2021 15:12:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVEm6-0002UE-P5
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:12:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b0b02ad-fadc-46c8-8aa5-2b6f5c6fe21f;
 Tue, 28 Sep 2021 15:12:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-j3b2l-9wM42InGZLzIRJlQ-1; Tue, 28 Sep 2021 17:12:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 15:12:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 15:12:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Tue, 28 Sep 2021 15:12:01 +0000
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
X-Inumbo-ID: 5b0b02ad-fadc-46c8-8aa5-2b6f5c6fe21f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632841924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjsjJx6G5ArgzBcZBGnwnFpbdO/W90V41M1wnE6Ykb8=;
	b=Cr5Zo6gT5T/NwQOAZyCK2DKx0Cc9zaM9LOC1GPb6SGBNS/TyfyzAiSsePi5bC1H3HrIpF8
	ZbMiFT/D1s6NCjp2XVwZIQ6yS1Q1Ydt62CvGJLOdEazpWszZhdhgZWQDA9UlZhqpjNQk0x
	j2hS2KW7UA4H3EHIgl4jeFZgK56AO0I=
X-MC-Unique: j3b2l-9wM42InGZLzIRJlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUjHOOIXUNESJr03BwmXnDrvPHqTtXDLAUP9vejS6i1xUg9y857r9XhXF+xJIsYpWzboKwRabtaBV8zq/vgfwPNUuMFDMfwA3dOcLtLDRGeF3c4wj6JnhuxRDnq4MhCAaThJF62eiFJcClCIMR4jqxKDPHyR9jJ/Um6EBtSuvEG7VYThl4vp59fYMIDb+yfPMIs0GXbR62Mbq57wfIAe1I649VJZAdDSSG/oaNR0CW7XBtTiQBMxywinlpsybpjht3irx08WSOo2vdLE83AzYPONo+1dbB3c9RJJlAw1t8v9gKztp/GOnvpjWy1Ds0/hvySCGldPidJ6edGxYs1Obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XjsjJx6G5ArgzBcZBGnwnFpbdO/W90V41M1wnE6Ykb8=;
 b=jTOHT8RiuL2M+XPlm93O8hjU5xpeyo+6JylWBpO25WcArA1rnPOhAwLbBLojG+uL0U+uc3OS9hDzvVksIZQYBdI7XQh4iuzYGcnHWoOs1XVssB/gxXxoNVGOTseYs8zRrSmmb9gn3g76IP1DCKqDuBARPSvsOvuNDIV18/y+ePZkxzuObLy/ggiiIKAps/OhOkvDGgSEWw14DKNVY8m+24jcyT7RwsEJ58WYB2VY7d2J/PKq4uN7/UbIhuDFwVvFtDZz0BicxaGlb9Wt2bsVFU9UyoB1q/CD3SgR+8CSONFSKB/6wcEKImSRJXP46v/YHk+amuk4sSz/KWcC/8CXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v5] xen: rework `checkpolicy` detection when using
 "randconfig"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210928150451.786582-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <667a6a25-c25d-2452-18a7-003a4bc4a0e3@suse.com>
Date: Tue, 28 Sep 2021 17:12:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210928150451.786582-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe158f76-427a-454d-d7ec-08d98292533f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304DBFE7C946043B549C5D0B3A89@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y5qzum92qvGNq1S0WrnxVy7G9OyGK74P0O+RNlJ5E9VF4pb0Z8rkQC3/jiUjf3hpShnQ8ZA2PMgdP5rSYOuwZJmfBWd8YtoeJjc8XqLJkAp4FTZiX3Rr+smqnHEFPcWUbavIqxISHlmeAV1PrSIUksUq6jue4+gsEZG/0MpZgXM53yNS/GLg9XV3zKTL0JlAAIuq95QgP0JRDyHITZ1gqic+YHYEd/JdYClN71xcFbTJIfDICqSjFrsb7xYJXRKr8SMCaWuAtd79UMvfDLWhko+RawPRnbzkjD3hJkKG3P+pjifSKg4IaJklVOSTTFUGMcTi128lWx58pJizQaCSwRXMDxyPYt4bHH8qOHvmmPI4KNV3hLA2UoZa2/RUgUQBcknEbIc1BWXqKDf3tHGARh+x34c+0f5U35kyp+BxGyw9UybADf/WZK4sVYFfPrLKC0BI5ySTRc9ZibTmxfTriiYu3yF4tp7e9b2goJs3YDF/ihLS0spyi6Xlx3eLpfBQYk04aHNzwdgKhCpxzffkDAT8ju8ChMEwPseh9Qcna1AGUpoaSoh3Fj0LwwsC/2r6YsTj0qpkKWL00ubu0Q8LDBgrI4oRB/GO91xFOl4EYgGPGPtTD9IeJvzwKZcpU0rswO8T3kom9C3/tzAQudvX4s8Kon2D9lkdNs8+vKoNRr3JU30gkxS5lSj1ZwgM1cAjxONABclR0sGNNp1j8aOfFmSoH7odhU8l3yplEwjexGqRVOL8IoGdPBmBzJDj0Vuo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(31686004)(956004)(2616005)(6916009)(36756003)(8936002)(53546011)(2906002)(31696002)(83380400001)(316002)(66556008)(5660300002)(186003)(66946007)(26005)(86362001)(8676002)(66476007)(508600001)(6486002)(38100700002)(54906003)(4326008)(81973001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjlFSGI2d1lGaW4wcTRTZGowTUVndjZRN2FLTG5KZnpZNTFmd1h0VEdGMm9a?=
 =?utf-8?B?Y2pUNHNwYTdWMTltVjh0ZUZRRzZGUGliRzhSRWViMmQraFVzanI1MXJ1Lzl1?=
 =?utf-8?B?VStHREhjOHdOT2ZPSGxoNVhHMzBLRERMYzYvZCt3bEhVVTdUU0I5TTJFMHJ0?=
 =?utf-8?B?OXNtRUFDVmJJczZrSDZDb1pDQzFwTXBncmt5bDFPNklOZWFZOUFMZWoxbGxa?=
 =?utf-8?B?YjZTOUNmV0JKZDcwWU4wUG8zZFJRekJOQzFyaDdEZXMyM2tLYkI4Sks2TjF3?=
 =?utf-8?B?akhWUSswRVlVdm9uNjUyNjRJK3IxNDNCWE5NdUgwNnFJTjU1OGxXR0c5TmhP?=
 =?utf-8?B?ODhWd3lIN0JqeFJweFJSTVAwc0UxNzNBc0ErZ0VOZ29vVjFRMUQ3QkEzNHI5?=
 =?utf-8?B?NDFEVHN3Rk8wTjBQVFlsSjh1RW9POXdHVk1haE1vR0g0WlBPeU5ObnlCaFBl?=
 =?utf-8?B?Rk5nZGQvUFJYWEFtdS9ONUVKNjJOSXNobjI1THZXYXU0dFJQZ0pvMnZBVDR6?=
 =?utf-8?B?TEppcVFINzlreWlkeTEwRmRNRG9NTkJWalM4a0o0M2txMGZNZGcrd0NHbVJS?=
 =?utf-8?B?cmY5M2tRRDdrb1A3MXdxVnF4eFJYVTA4cEtud3BHOHdBeVRuWnY1aVJLaTVy?=
 =?utf-8?B?N0JMVFhZSVdXb0EySFdlYjVFMXVDd0ZXejAyUmIrbXJCb0ZoR1lZZzBIcm16?=
 =?utf-8?B?bWMvQUE4NVpQd0xCUDNmMFRuejlxWEpUUkZmRDRMaEQvRnpVejhLYzVHaDFr?=
 =?utf-8?B?Rkk1NFNEelEwbmJBRXFEbnlSWnpsb0ZYTlBxYW5ScXBPeE10eGJQUkJzQ2pz?=
 =?utf-8?B?Qmh0UUhnMktiQWM5blVCZi8wLzJUK1VKd0d3MFJiWjJ0S05sVWNIY0tvNGw1?=
 =?utf-8?B?VlptK25jaXg4ZmZBVFI1Q1ppQzhOSzRGNE9YN0c3dE14YW5aRytzUlNWY0FH?=
 =?utf-8?B?Skh2SGZPQ05ZMURwYmRCT3kvT2JvcXQ4Q0IwVkpLTFJVVExPTnpTM0hXNi9p?=
 =?utf-8?B?RDVUcjVtUlpSZkpvcStQd2Y4ZCtqK0RTV29DNy9adXppbDhWMTBWa29Yekxs?=
 =?utf-8?B?UjB5SVdNWUFNOUkwdzdEQmVJZ2I1dkJFUCtDMWZnNGlkN3EwYTM0ZHFXaC9a?=
 =?utf-8?B?Lzg0OFIxTXpEWkt0VitGWEMrQTFoYmZ5dnFxanRUVkNqVGVzSHlBYkp2cVU2?=
 =?utf-8?B?Wm9Oek5IMnUzZVR4YXZNUlZVRDM2U2F5dnpsWm90dWt4UktpV3JUUXluVjB0?=
 =?utf-8?B?ZnNUTUoyanVTVC9QZm5Hd0l4RW4rSFFXcm5pRnVEWFBmRlozaTBHc3BtWHRL?=
 =?utf-8?B?ZlBnWS8xZkdvK3B5dnBJeGR5WkZGbFdFM0QwRytMNFpHN2ViZ1lIZHh2c3JZ?=
 =?utf-8?B?VzFESUZkZ0g4TWQxSFFJc1FQdU12T1lURlJkS0labGROdEVkTU5ZZm9qdEhP?=
 =?utf-8?B?OUozTVc4a2ErS2F2YVhrMnZaQVUxZE9zajIvR3lpNnFRQ3g5Q0t2aWhWdnVu?=
 =?utf-8?B?aHV6bjN5MzU4RlU0Tm1JSDcwbVQ3clZrY0ltbW1HaXNseEZ4dUJGenhyQU1Q?=
 =?utf-8?B?YWdGYU5EbGpBZWZVbjRPRkpxUHd6SlQ3Z1VhUFZzYXBhY2NEM1o2L1gyb3Ay?=
 =?utf-8?B?UVcrUzl1TVZyR2g4NTBjQ1BaZVZCZEJUKzJ6amJBYmp0bEFXdldrTjJWRGx0?=
 =?utf-8?B?VitzRlBnRXF6YkIyYVFudkErbHZobHJJMG9ma3BVNGlrU1pwYlNJc1RPTEMy?=
 =?utf-8?Q?rc6H0Rz8wXAk2RBckZC7E8kP007RBYLEgrn9xGI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe158f76-427a-454d-d7ec-08d98292533f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 15:12:02.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOu5pbDhEzGwpgjIu7HRkDyKzNy+6JQwC7Iy6MFbIUbDEyTFqNXDwIS+yxR85udKiQQYL+aqXIsZN+WhblrWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 28.09.2021 17:04, Anthony PERARD wrote:
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available when doing "randconfig" jobs.
> 
> To prevent "randconfig" from selecting XSM_FLASK_POLICY when
> `checkpolicy` isn't available, we will actually override the config
> output with the use of KCONFIG_ALLCONFIG.
> 
> Doing this way still allow a user/developer to set XSM_FLASK_POLICY
> even when "checkpolicy" isn't available. It also prevent the build
> system from reset the config when "checkpolicy" isn't available
> anymore. And XSM_FLASK_POLICY is still selected automatically when
> `checkpolicy` is available.
> But this also work well for "randconfig", as it will not select
> XSM_FLASK_POLICY when "checkpolicy" is missing.
> 
> This patch allows to easily add more override which depends on the
> environment.
> 
> Also, move the check out of Config.mk and into xen/ build system.
> Nothing in tools/ is using that information as it's done by
> ./configure.
> 
> We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
> via .gitignore.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


