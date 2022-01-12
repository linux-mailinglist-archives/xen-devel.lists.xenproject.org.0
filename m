Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD348C05D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:53:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256387.439921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZNh-0006lw-E9; Wed, 12 Jan 2022 08:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256387.439921; Wed, 12 Jan 2022 08:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZNh-0006jT-Ah; Wed, 12 Jan 2022 08:53:21 +0000
Received: by outflank-mailman (input) for mailman id 256387;
 Wed, 12 Jan 2022 08:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7ZNf-0006jM-Tp
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:53:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 165f8ec5-7385-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 09:53:18 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-MnSwxJa2Msq6SxmCFmzSyA-1; Wed, 12 Jan 2022 09:53:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 08:53:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:53:16 +0000
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
X-Inumbo-ID: 165f8ec5-7385-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641977598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N75xGj0F6kP2cIQX/7aIQCQX5Rekzh56qainzDvfUU8=;
	b=Hc2e+/kcIHslJ8bQ+LfAc3liIu9MrdYwSulVX9Lhlb+bBH86HhA+9wegUac6r9r7ChjI6u
	F6rQMGCPiLP60xE6Y1O3MwW7TUMg+QXdmwupsUPvW/4+MwHxmusXIwQKwysw2T21Lwn1fX
	iObiPmj7uYePHdFt0gd+n7fc7JxghSk=
X-MC-Unique: MnSwxJa2Msq6SxmCFmzSyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFDK4wrZdMa6aQemNUR4Oz2xDBirrfVbobE0LboPX+YhnGumoVtpICpMlTYAUp2QF1Ff34uKBAw8p6Jg8eXAfi/c9BLP6MlmxysEnpzlfioZ72FQyS5m9818MIAV8zaise34W3JO0Hw5JLUsGulYQDfQXviZZYnrmDgv7d7ZO3wLy7aBeJhAeymcWZESoTjfimK2iIw+8heT+k6dP8CGaqWEMTCQ8/i0J7m6n2GxvRV6+j+0MFzQuWg5VoHeiThJzZychu1xfIlcxrA928e0M8So18uQTlmauMnTtAEXinpBajZkoXmYdJ/1yon3c44TUDSWSHFo08HxZDWEJgpW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N75xGj0F6kP2cIQX/7aIQCQX5Rekzh56qainzDvfUU8=;
 b=PDgvwXO0qkfbIU7iuXW/yYTsPRZu7jwURGy9rL7OS+m+OKlYA8Z9PK1ZajUQKoHH5jXsUEglC/yCdvf3x54IsCeZNL0hysncKQFnC2aw3pqI6pi72Rg68kv0tKwDDN6EYJxh6Yyz/WM6qsih8iwidJqZbJFc8pPhj/Wmp6h01lDZY3DiocxyqdxjTRtOCRw6gY0tZBnI8ieBnXwOqWWJRwFkb9TJOpxBipFFUHYldZIDANPnqD6Xp+oPmFlVLO/F5i3hH9/mjcwe7TlwRSs/C6uTABw9uanbKPc/h1zWTzhaF/Ce1f+kWKbKqMFwYsdBKcV1ir5DqLUS0bS9QQsWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
Date: Wed, 12 Jan 2022 09:53:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/time: TSC calibration improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0092.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d295c1d-42df-4bef-6b3b-08d9d5a8f8eb
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024AE7AA8891168AB69DC04B3529@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1LD/90DuBcFPk7AnkXJAl9Av2Nhx7CBAN5g6vIBmkkpheZaBIwjD6Qp+Dgn9ZBx7TocSeQ/6MSwu+L4t6DA/uRWq+4KJCWibAZCjPaDaUyJ42DWfCyhi3k187Wr8Q7/zm0ivhommRft+82NYOo/r1MReR6WpoHS6pJiHPEshFA/LwPKzwWOiaj9HFYl4CrRqLybNBJalNuMh77+2uyRqsCQfafsvZSY1v+XVKzzdyhl4dV9N+ct6f+L89jQwsAPMpcyWw3HiQ7t9a9gVq8yYI0fQOSZ09JTZd+0KSj6s/GCkbmJ75Pn8V6PQaGLA3QsXu2bQM1fy/vWYxm1iKh+LabRICCFgAsDqzh3KzKQGsuteDEe3BHHoorSzjROWDkbT66H03LVO5NUDKc1KNze2H7pO8rtUBrCyXiejxGIg3GWWjDBXRDLlkF4J4hIwGex3oB0t6j2KUp9VMpIZ/TzMGrB4tHA3f2KeYnoEWhnxA7iDmZlDVYpEXS6BVp15ZujYYNgoZNpguAqBQbAZGMFIaX8nvGoDZArCsNh2Y0KXOZtne+k7n3Pg2eOJ9roCyGB4HnDDIKrMc1TEWbEYs8r54wtbmAJ+HFvWBS+T2kC8GcFXw0xum66voF+GX4Pj5B0RBe7KcagMAUC4KtARHwIPKYkN/79Li0oitzeuRw6SKdGfSwBhfBT0buFJjLQBqhQO4gQWmJTS61hHHYwGecCerUQ1cbvCIhG6jwYCMfMUuMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(86362001)(4744005)(5660300002)(316002)(66946007)(66476007)(66556008)(8676002)(6486002)(508600001)(6512007)(6916009)(8936002)(31696002)(36756003)(2906002)(2616005)(31686004)(6506007)(54906003)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MytETElBSEhYQ0JUNEd1ck9Tai9QSzJ0QUpjU2tTekZJakpLRjJ3TGJyRkJK?=
 =?utf-8?B?SXBmOUplNmJIRHRmM29IYWdyakNDdzZYVEtCaVlHQm9ERDFoVFVvYXltSFhm?=
 =?utf-8?B?UVZZN3FlU201NW1VR3F2Yk1tdDh3NERxeTB3ZjB0OHJ4U3pvWWRrN2pGSDBH?=
 =?utf-8?B?aUk4bjRGZ1VVNG1wRVFJZ3oyNyszbVJJQU5OR0VqUmg4RHFCOGdZanBVRWhj?=
 =?utf-8?B?K1pnS3JDZjN6bG85cWRIdk9RRlpvelZXSVJrakRPMUd2eEtMdGNQN25FMnZD?=
 =?utf-8?B?NnB0WEVwREw4YUZNcGF1QVQ2S1NaRXNEcE9VbTMxMmt5UEU2Z2s4c0VrcDBQ?=
 =?utf-8?B?S2RMMHpGUXNBYVBEMnA2TzY0VVkzNlowc3VoQ0kwd2N0OVJJTE9lbFA5V0xl?=
 =?utf-8?B?YjNKekFEMWJDUnRyczFIZXNOQyt2MVU3Wk5OTU5JT1FUbkl1QzhrNTFzUUd2?=
 =?utf-8?B?ankxeE81WGFmTlpIYkx5NlFHMk93anF4TStzcUVVVjFoNldhZHBmaTdER2ZH?=
 =?utf-8?B?SGRHeDVLTXVPaFp3YVN3V3hvT2c4MldmNCtwdkhLSG5VUWloQXRVNER1M09v?=
 =?utf-8?B?TDM3OGdDeGpkUk1sTWxRZVd4c1g4dFkxQ0JmVUZZelk5WmZYbytqdTdJbVJI?=
 =?utf-8?B?NGpUOUhjWW54Lzl1SGZlOXBrY0x2S2VUZkNsZWd0VjVZWTdscHEzYUpiNWlW?=
 =?utf-8?B?aTNBeHNaMXFSajFLcXdOaG5PVkppZFFCNVdEYzdPc0NYY0ZnSTcvUzd0Q200?=
 =?utf-8?B?d056RDFUaVJidFR0VmVKSnJ3bEc0V0NBbHBxV1hHMzgraDlRbXdTNEtGek9x?=
 =?utf-8?B?clZ2RXNXNDdUcm5zUmxOSGNxNGZqSkJWbkNkSVFFQTVUM1E0MEVJcU9IZjBt?=
 =?utf-8?B?bmhnODdNMFAxM0YwWkhBWHJBMFBXc3p3VFVpTER2WEpwdTJRbFliOTljL1lt?=
 =?utf-8?B?RWd1TzNuTDdPb0xkcXlnNVVWKzVkQWtXTU8xZ2VMY0RVTy9TNnJjM1Z2Z0xx?=
 =?utf-8?B?UG5tODNkVTgvQUpVN1FMbGlLSmV6dDZ3Vk9wTEViaWxVZ3pwVDRZenV6OWhn?=
 =?utf-8?B?eGtsVWR5QloxeGZoWXAvaUFzR3d1R2lmaTQwcHVvcFdUaHRVWWNuTjlJcnVW?=
 =?utf-8?B?TUF2SXRhL2tXbmU0dmZCVWZ0dFBSMmxZWHpxaGhiZERIazVNOXdGQ3dPS004?=
 =?utf-8?B?MExhN0lxcnFtMGxCTXo0SzlNWDdNdkEwTVMzVG9RYm91WDR3b1QrUFBPSFRX?=
 =?utf-8?B?UzBqRmYrVUxGWUlGUWJHYkFqRFZ1SHFyRzE5ZjNGUVB0YTFkR0RtRkpZYW50?=
 =?utf-8?B?YWJFRktTSmw1YnJoNUdZbndlamFpNnUzZFN0OVZCemRGM0F5bGR6U0pHUzVx?=
 =?utf-8?B?bVZYQ0JVcm0vT1dBWXNBWjhGMFRoM0VOTjg3VUN4WFcvL2lDMEtBamtONnVM?=
 =?utf-8?B?Lzh3OWRQZ0FJUnF5MWx3NllKb0VEOUdwK3ErcmgwY0YvaHlCYkU1T0VQeGoz?=
 =?utf-8?B?M083WjdxSmJpY1JVc1UxRUEwNU1JbUVqMzhQTjgvMitXUTFjQUNmZTJHZjBu?=
 =?utf-8?B?ZWx0eVAzUHlSdWhZUXQ0SDcxNHhNcGtJNmNtaEVTbFhmakx0RWttQi9abTNx?=
 =?utf-8?B?ajA3d3paSDkyTGtoTk9lcnY3OEtyWEN6Nk16RC9PV3d3djdOZkhubHJ1SHFw?=
 =?utf-8?B?OWFlcHkwbkFWZmRUREQ4OXZJRVg3ZENrMGcxMWIwd0tyYjdNY01nc1plQTVt?=
 =?utf-8?B?alJqWTdqQ212YWVhVXZjUVFTUHVybDlxSTlSSmJVOEl2ZTYvN2N1MnNOQXRW?=
 =?utf-8?B?RlFxMnpOcVRRYWNkZ0tBcms4dWdBbEJXVTU3eVF5SXJsREJ5U3V6MkNtZU1i?=
 =?utf-8?B?MUx4aEZHNDVQS05DU1djYWNMeXFHdTVxbFd0WFFEQnNZSjZVVWZWTjR5VFFQ?=
 =?utf-8?B?SC8zNmRzc1dYcmNOUjVDNTJlS20rMWF3QmJQNGFLZEF5R29FdzM3NnlnQ2lz?=
 =?utf-8?B?Tk5Pb1RwVWdTZlVITkE5RmhmWlBwNERkQUoxRnpaeHp3Z3c5Mk8vQk81cExo?=
 =?utf-8?B?KzIxL0tCbFhVaXV0cUpmSzJkVEFBTTRWRzN6MkM0bVhsZ1o4cUFGM05uUjBV?=
 =?utf-8?B?LzN5a1ZxRmF4eCtLS1ZZeEk1dFZHdERsWXRQeWQxQm9pWExXOFp4ZjhkU1hl?=
 =?utf-8?Q?Cc6r1wyT9XjV2szsyq2+qrY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d295c1d-42df-4bef-6b3b-08d9d5a8f8eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:53:15.8984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2AblN0FX+hbVTip9skMftLuqBVEX0Vc41oLbSMJ/I6Je6NgPdLoSg0wxX9jpHrx2FNrqvhmaveYIBmOuSZ4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

While it'll take some time to know whether presumably the 2nd these
changes will help with the originally reported issue, there are
immediate positive effects even beyond that issue, which is why I
didn't want to wait with the submission. There's at least one more
issue to take care of (see the respective remark in patch 2), but
that's still under discussion / consideration.

1: use relative counts in calibration loops
2: improve TSC / CPU freq calibration accuracy

Jan


