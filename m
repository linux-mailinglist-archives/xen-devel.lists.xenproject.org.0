Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FE4B7018
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273410.468587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0em-0005u9-VZ; Tue, 15 Feb 2022 16:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273410.468587; Tue, 15 Feb 2022 16:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0em-0005ri-SI; Tue, 15 Feb 2022 16:26:24 +0000
Received: by outflank-mailman (input) for mailman id 273410;
 Tue, 15 Feb 2022 16:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nK0el-0005rJ-U0
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:26:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 038460a6-8e7c-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 17:26:22 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-8-W6kcDFO8aOSVdNv3RMdg-1; Tue, 15 Feb 2022 17:26:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6781.eurprd04.prod.outlook.com (2603:10a6:803:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 16:26:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 16:26:19 +0000
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
X-Inumbo-ID: 038460a6-8e7c-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644942382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zGc6lomqXVQqe4hZn5voJRbGLdcElvRtfDbDBIQRUk=;
	b=fut90U8bxvWcCIg4f/zXDZaSANHDC0QY5BQZ9IO/2//Bmz5NnX7stLzteDbkiO7UeNzECT
	MizxqEM9QgLc7fzxUcd0koKY8JBcTkGijW94w0ZpkLsmOfbULmUJ/NiX72HLuzx8uTeoGE
	ES7xrgARNckB/LMQi2ilf6Wp/XAvLPM=
X-MC-Unique: 8-W6kcDFO8aOSVdNv3RMdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWTczykSh8C+cZ0V/+MoqOXhnWuRxe7OBZ8uLZXBP0V7TffAzXheND4m/Tq1VmLNdO3h6Ac33iW9Blq/DFotxfPRQlWpXc9UV7Qgb+iAN2qVZkSDovl+GfQYpoxO65cCA2sI6zzXcK/GQ9AizDT+bZDtdbs202ehgAhfaa69yRm6Nb9Oe6Grg1p+LIGpReJ/y/SUL6JC3AX5dbLnMWtbp4y//dRTwepsHs8A9lPJOMpcoJ9Q9ozf/8CBoDpQcEZPasM9Q/8PEp7SVhBKJr1vn9i5sm1hR5sVRWP2i2NRetSj7o7nHU/0214LSvORRfZxJU/r0iFSUwH0AL+IjinbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ14uvQIH2tniGvqaJVWY+ZYrk/pOz7yPpFUjPkXGSM=;
 b=TKb6I8xlC9U4hUiA10/lPdRudEM2LlD/lTKOtIQQWdd0c2XwXimQExOWeY2W5iA2p9SbXiwK0yd4qmH/cvvzf0Mbf4nGd72XfWpWlohFE0lGfHKFXOvoOcS3lw3JCtHVKMhI8VRDE4zrhzsLolt09KeUsL5LWk2oLSzVTN8Db1UBoVwwcj92I6pjyFa+hAOGjtj5hxcPz+9KHUoUJHo4AkUVC/MBRz5elCe4lQSMHP40rToyRBG1FMVS0W8kXZ+TkX8jN5vtfQZWaqmH1LLOEJAuGy+MyJeblV3PKlwqIaIGQU6DpwSx8jHbdn1mKnN+le/KNNPDBqUVd6eyTaOpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2734ca9b-44dc-60a1-7027-924881c376aa@suse.com>
Date: Tue, 15 Feb 2022 17:26:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 60/70] x86: Use control flow typechecking where
 possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-61-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-61-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f7eab21-a7d2-4b6e-1add-08d9f09fe5cd
X-MS-TrafficTypeDiagnostic: VI1PR04MB6781:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6781F0855F8060C6F6FE0235B3349@VI1PR04MB6781.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x+tcA/5UGvlIsGointZIBvm4khIq5/+8PenrXvAQC/WuhJq25lwJQ0ipO4Dm09vEjwrW0moNr5veKEtRCDPjANVBvoom5jNJtzufFvn6kexy2zukyfm5R2+g8seth+/EJb6J1TmwU8w9uoZEwK5Pu7clkvuJ+EyqMH/4YX/00U1LTtgr6sGtgv5t9P21tNlDdpq4uuIE+UFLV4zSqWN2IVEnFeOdsZr6u7X8vb+s5PM1E46a4IXtu6ZSPIrzDALZsMHPTOlYtrEjp5FtOORHNULf95AuwAGCL2G1DCFDCwQxdVi1xZ+GvKJdJzrEXp2aoDEhSCTsmHiQwdPsVRjqkuGg5Fhbk6rUNRcKMrXGGqzIow416uxZF4JFhXUadnx4Gpxq0JXvh4ZdB8jlDqvcNjQ+x5I4m3da0Dl0Bo7fVToNS/q7a1WIybMl9kmufRquZZcfbwtWrMcPBvOPP/1utgUywOyKuXR3hgWgZV4nRnmEVBFj7uDv4XV8h557BlEFOrmsyQ9qjeXYAYbQ58PJWwjydPZ/faNhMIBMNfDe3hbnSL83kEWSoQ+eplEa47I69j0wDrHeKBTO5l7i6NohWoWEAA1Oo0EAMb/RekZe/4a/6gY1g4ZOH/mg/tbE0mc5jucE8CvW5kniV4jIUqqFtC+vn8bqQkyuZxxk84WI2CvbhbNwILkZqF1LKtJEY34ykXspdMTrKjFP+jhmnrWIb4uuTMy/38Uch58qP7BkMAy2kZ1pIdlvgcOw4BCSgSrrNakv4ELIq5DTYodxvxIdPo2HJjjISHHOUUHuDqzXIjGB+lXZ4VaBu5XSjsquRwTQXoerGpopP7x2z51wSg4Fiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(508600001)(66946007)(66556008)(8676002)(2906002)(6512007)(2616005)(31686004)(186003)(4744005)(5660300002)(53546011)(86362001)(83380400001)(6506007)(6916009)(54906003)(26005)(8936002)(31696002)(316002)(36756003)(966005)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M8AIKVv7tzFPn3Wt8HjCVNVBWPXRS0hUfzozdDieyFmDkQfZcjZD/qzPJDjt?=
 =?us-ascii?Q?ugaCb/joq9i2xwd8cd+o/VeBexRK4ciBh/fskGM6AYsjEejt5V4AZP/P8pnv?=
 =?us-ascii?Q?DprZ9rik5RdyBb+Myc3qYQEWo02BjWb+82jZf6eA6sMoh3rLlFpFv4BCa7bF?=
 =?us-ascii?Q?jVHw8RDDDgQkJhHQUfp53zQMU/GcGFvEABPWuUiiJADtZYpTpKnFKO545X3n?=
 =?us-ascii?Q?B0Ij0tH6dhmi65pVm0HuHb8f98g73vpjTmcV+RcxN5hE3G79+DqURDlLj2ff?=
 =?us-ascii?Q?l+SsOfFRm5wM/oqXUBvSwkdK5TS3fJmwTv10iCdWJhgl0S41B8pQRqHrejnZ?=
 =?us-ascii?Q?13U2WwS1iAC54oEOvQkI/JOHZzEKdd0XQyWmR9xL9cg1Wm/t+4KipDfoAnqB?=
 =?us-ascii?Q?vX38eTMi4QSlBAy8WTOiyXEPBF4wQLZK+Yq6qme7x6QgOicPRKVSHLq4djnK?=
 =?us-ascii?Q?S/aTritJEjNftT35zBrPzUxZvlLvNFchKnpPjIqgfigs+//4kzApM22lLmb5?=
 =?us-ascii?Q?7HFbt+Ac8eGRvOD9lhjTopOkDV+AAyzlPlC+88iwgCDUku50zcue2CoGBzee?=
 =?us-ascii?Q?3Q+umWNgnMcUJLybUZg1BkT028V+LLsujzG6+Pu0jsVIqNQSyRJO8cWQDfwT?=
 =?us-ascii?Q?3sD7dK+UelJ97hbuRm+kPnMK85NzRQT806enENsG2nYcAlT03XE3ueCDyQzd?=
 =?us-ascii?Q?RY+BAY4vLheFIWPFaTnXehhbiOLTZy+2DhAP6LH5nKr2Fb77Z0QhrDZEVrir?=
 =?us-ascii?Q?QbxS0LlAteVj3dCCHuY4qrZbd8syPFGFJJWk856dC9hhbHq52qRyGnbhJOKT?=
 =?us-ascii?Q?v7/+kWZycWc9tuPonkwGG1s5bQ2FLFnb1YUfWFJLGNj4Fov70HKay3++2VVx?=
 =?us-ascii?Q?DDCayRTDAZjmBP3sstQKyQOzkGOR6+XrdWpjzkGTrn2FmXgudUYmTun3wEdb?=
 =?us-ascii?Q?ad5gFjWITEqLuty1jCFrvWCjj5L1nO6kwtoMe+JTEUEQHrFZRW7nxp5BFVlF?=
 =?us-ascii?Q?amepoP16KeRaGI0IqrfFcyxgFWojmowgVhoLYRyYXcKJqz6EeDhVvFHeOPvN?=
 =?us-ascii?Q?m3UldMVHAiG51bf20WX6OmafqCTSJn07eTlekw3DpTY/OyCr32lAZX1PEaGo?=
 =?us-ascii?Q?5SnEaqdsxrCYdWW4XyWTIGWte1T7hrHGo2HrQhn/BK+bJcnXsGoYSecmxftT?=
 =?us-ascii?Q?4UxahxVB18GzulRADRuAN8w6/3ANGTPw/CeMrbracg3Xtcy7zemexMtX8yln?=
 =?us-ascii?Q?ojdtXk1Z+7slvprvTi4uYLb15soFRHVIoBkuQqiJiLxCBGUxnR1YIlO6cuiq?=
 =?us-ascii?Q?ct87X6u75sv/nygxIkZezHAknLnxrGqUPe9M8ur0z3N00s9TND7/KRkAhbKq?=
 =?us-ascii?Q?lXy1Z0+qa1yyWfnw7PFRxOb55ZlKA9j258WSrE20M2/s0bi44gpStdL8T06v?=
 =?us-ascii?Q?YO4j3VTXseZyeBcI5Ep911HocURZXKSEGlCQseCawzwXoW2X/wXXL8VAZJEE?=
 =?us-ascii?Q?Dz3ANOag/FJacd7noHXUjUTsRG2ZHIT7g4aESP+Yaf4Sr9TgAD3IxyqAij+e?=
 =?us-ascii?Q?U3qjMxENUMuhk/wC/v8lGjGEepPHleDFZdbnknDcuiAPCWPP3zGMRbfoO+4H?=
 =?us-ascii?Q?j2brkMeCnnz8bAji3CIcKzY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7eab21-a7d2-4b6e-1add-08d9f09fe5cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:26:19.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsClXqFHQp+zyhdHb/O4IvgT+2sQlitvhzZGGIvJ49qAvHLioT2ZoaI1ITTQnw/90CV3Phftrz3Mot6jdyKTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781

On 14.02.2022 13:51, Andrew Cooper wrote:
> Now all callees have been annotated, turn on typechecking to catch issues=
 in
> the future.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> RFC.  This is still an experimental compiler extention
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102953

Hmm, the last update to that bugzilla entry was in November. I'm not
sure it is a good idea to carry code for something which hasn't even
reached gcc's master branch yet.

Jan


