Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A404FB84C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302820.516617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqh5-0005r2-0Y; Mon, 11 Apr 2022 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302820.516617; Mon, 11 Apr 2022 09:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqh4-0005oq-SZ; Mon, 11 Apr 2022 09:50:46 +0000
Received: by outflank-mailman (input) for mailman id 302820;
 Mon, 11 Apr 2022 09:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqh3-0005oQ-Qq
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:50:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db25d050-b97c-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:50:44 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-x0lK-gd_NQ-61aPWmggmNw-1; Mon, 11 Apr 2022 11:50:36 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8280.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:50:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:50:35 +0000
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
X-Inumbo-ID: db25d050-b97c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649670644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VlCDlrrXerBqUA2dNYSUlN8BCdQEZkeb8vSjqzfzVo=;
	b=IIqFodNIGflIrvcHZN1fQ/gqJ42YOrYWgMMl2wkDr/8XKJzNHHp3gctnS7p8Kl5T0zEe+i
	aAKcRgksAZSRa5eGt38SWQEk60dYftAnrROwXu0+54zjsPV51+SG1vu50xdyX+oCkFNbIq
	8jAK2bsvmKW0HxDEPRy+7UBQyW4anNU=
X-MC-Unique: x0lK-gd_NQ-61aPWmggmNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+m/T0A20YuZn0QbnlWho/pxMZLuhf8kWa3PpXacOtzLGGWqYBL7C5Iyvuq8ShP68+LhAcbwq0pYV1Ggqa/HK61xfNMTs7QXteChdc2UA9H9eZB0EQmJcQTH+UAucZbSHz4n4zTCwUsLVrZmnwgGfQDv+Ls8qPijLzGC31HNWQeeb83fzbBEspFb9E465aKf0zrcST8FzTvkIy/Mf9pZ21dNB49Dv6tmNw87qi9T/IFncSLhK+SbhlX0ICQ8/Ch+GXRJ0PmXDRPpMcO5iMrkzd4gthWQRM0hyGWjtoJOmje5VB0pthQf7mpLAY/wkkKCzs9r9d99rVElk+7VuU0xwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+goW0bkyqT+ZqMe57EdXFktRdr40TADb1pr34628B0=;
 b=dFKxCo44QPnEILNwzdEsfknfelyRc2fJlBw9O/b0m1/sDfP8zLNkXiw7C4t2CFgl5oxORanBBfUPRt5cK3HFvXYQ57QoX5WXBOj9VrRX5iocQ0NMwuodBfa7670aB5mXMpP2+RSRnAPOVZHIp+DsGkY4KDRdCAK2BLBCFAyc1KZaftIFfWYYKFqjK3LFTGQz1+hQXuYw1fjor87EsMF5sa0T2LQcCM6Z5QEXrGy5kf2F0IX+ROjygfVuzx0Cwi3ZA9XgcLi+lb26/Ya9URbCaTT9TwRyX3XU0bc9wLQNS2E7Gj6JqbSDx3PuCCz+Yt+/o7ZPtj/pk6+k3h6/TdUdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01992254-1a4d-850d-78c5-7e4ee738cffe@suse.com>
Date: Mon, 11 Apr 2022 11:50:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Ping: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics
 modes
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YkwBpKcyrnuXyNPa@Air-de-Roger>
 <65d3068b-fde5-951b-9a60-4ba1dcd89a49@suse.com>
In-Reply-To: <65d3068b-fde5-951b-9a60-4ba1dcd89a49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::12) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8b9ef77-3be8-4ac6-267e-08da1ba0b9f8
X-MS-TrafficTypeDiagnostic: AS8PR04MB8280:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB82800492CCAAAD590AB0564CB3EA9@AS8PR04MB8280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9DNCM+T6JLdzFP6+XPc0HcjIrytMYW7P3PIJAA3ec4ydjI3Xa8kSj1LToSnTDY8od+wwMJFasicgKINRteKPbbQsG1QFrJ2rf241sZnulJ1QTX3LFaz2DPoVqRKt9sA7ORcBmevZeeIsFAm359T9rLyACX2QiYzydd0VO0oRQZYxv7zw8eR6fQ73s24/xwFT4D4zF6lFwqd7CXMTBzJgfuXcqWp0rsZ+T3apHHqAGB5dMec8ifIccn0Yft3X/jFkJeiZUvjiyfL1HUOKfFGysAUTYE7wVy8tTYWyaawpdilx7aM9f7FcbgDVvVV4julf9hyJIW6EeRhAmXi9fWe8xuxi2ouI+ewaxwn8VittSOvDl+gOAtUcA7ZLNgoY9lqmWeHs6m4eWgih1Jd4JY0JZiX6ZIcRM6WyLrZLfXH7KsyRcti8vdLhyrp9DFRudeIBM336P0bWYzZB0PuqZXRDmdG0Jy7mB1onlndKrgK0j6CMkngcryahxiypHbkC4P6/q44UMdZhgZlprxXsEUhjGBGGP73+MV+tyrSLe7pEC5J72j0kMJh+8kj09IUnoUIr5Mwwl4SsHypAhxbmMkzzoZ0rzCMNQRs+4RARy8EvwwgWsa/1wUWfzxXlcLf89DglGa8yseLQRcT5DQMvSC2yS7oW87PNMj428oqZx/b2savbRoCDyp25rwpJmt24h5okueTpzYzKFlktFame2LomelgO12X1zmgVHws+MWEGPRXRym7b2M0qj+4V71PGqyYn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(8676002)(31696002)(5660300002)(6916009)(66476007)(66556008)(4326008)(8936002)(316002)(86362001)(6512007)(53546011)(6506007)(83380400001)(186003)(6486002)(38100700002)(2616005)(26005)(54906003)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZYsBOpkXEknDyXBPm3S/LSqdktFtu7qaebLeBuQ9skWs87s6qSJNI54MWEY?=
 =?us-ascii?Q?EDNwSXtt5NfGVkrH/skrMUaVi//hwqpc7d6AwX1GhUy2DFSUKG62Q7936qei?=
 =?us-ascii?Q?2c8LuJsRHpFldHP4IqOgekYyQPPElkOiNUlW4e9/7u9utX0TAUBlM3BrI9Te?=
 =?us-ascii?Q?wxOwiVLmX5PzgCwkmet8E8pVbAH0mfQ/KIacusRFp8+9AOqG18zl043Fu5dQ?=
 =?us-ascii?Q?H+vXyONe7yrfaDrxp4pZaADNFByqsFFGRr3PVh35FEdTNHPRvW6rzcN7mwMC?=
 =?us-ascii?Q?eHw+QE/T774xakFnu+42qkzSsUvdqYk2KRawDE7hLKLwZq33kj+em2t7Bad7?=
 =?us-ascii?Q?F/7632CMyYqX7U0h44ZkOA+iR497RgWwOE5OvgHoo91AmSlYshkln1r60lQo?=
 =?us-ascii?Q?lMW/Cm+h1bnYuxLGklEZtjJn+fruRl6Gm1zHs2vEwHKHzl60mQkfFCzHvkP9?=
 =?us-ascii?Q?i1eotGVMxIC5BLZjzfgMhPq3eI7v7EEYxlxb6P868bm6NOkUFQtTdyHK2Tbm?=
 =?us-ascii?Q?xhsxNd7cT3OBC/lahW6r7NG/7L0zh91i42AQMBPYTriNaBnMsWpL/b49YhMT?=
 =?us-ascii?Q?BtvbvkADy2m1qRNmBj+Xy4ckkvxZ3//5hIxYhUPiqHQb+/jMXuHZOVBxD3ex?=
 =?us-ascii?Q?Xhg+Zc6YSos0iZOwVrfIlqrBhMafzetuKAkh20pH6vWMRS+O86/PXkRwXtAP?=
 =?us-ascii?Q?Og6xVU2GZIBvB8Eti/lA25DnDnMgFWFcboAUSKcNgixt2csXZi6EK1yLKMxQ?=
 =?us-ascii?Q?e7Loz+ccEfjtVeW+pfMhzoxOhxD/bWLSAcJG39MhzkTEZmOnq1acZutmdlFo?=
 =?us-ascii?Q?yUng43LJ1WRSaIazXxhCDlyG69merMmZTyjrjYuL6v2y4pI35egvOtHutABS?=
 =?us-ascii?Q?8Y/hxLNoWwJWR1wZk9SHXR7M46DKupcROrhAlLlL4l8crobVjvGuCOvkFo6B?=
 =?us-ascii?Q?wdTB/B7FihM9sMjZN0iIqG+6WZJ2WfIC1pPPxWP6B8kzQSt+LlK2O+okakLr?=
 =?us-ascii?Q?S3tlQEV8C5weJ57ifSPAfBlDmJQ98zfmvu87cnieCKKSD4ow/MvxonNCrXfw?=
 =?us-ascii?Q?oEfMlwptDJroJ8feOfgryNJQL1awcK4z4TwIq8u8nB7OSFp3+pw9kgdSBKbg?=
 =?us-ascii?Q?uUxvbKsoxbGfJfyjyegenmXirAF4w7LxlVuOxgsaoeb4Cb9eaZUHKKSvx/vZ?=
 =?us-ascii?Q?WJGGOMllQnAmIO3oMaITGckmuEztRlgTLoOUazXSvYbVLpwHkR6IxcklVU4g?=
 =?us-ascii?Q?8q0wIvLqzCfiaf3LqwV4zbtOcVTz2HAr+z0wPrare2nz8iZQNaXaadikm8UX?=
 =?us-ascii?Q?16ZSUS5Vt8KvybL8llwxANrW8toPso/Was5NjRGcGHGIoF/MnVZ1Cru3vE+L?=
 =?us-ascii?Q?t9Aw+DV1+woQwL/nrC+sx2cPiWJYsxbbJEPbupsRsddg2f77h9mQZC90aofZ?=
 =?us-ascii?Q?s87UsLTniJyzqpxGHbnceAfBssqUK/4WCLe2ODzu8C8zMGTdTj2ABgCQrKJo?=
 =?us-ascii?Q?jFCu8+xNEtplCoigS1DZU+S4ZfX1NjQP6vTO52LTfmtw0in2yFvR7womSvoa?=
 =?us-ascii?Q?Y42dZACkVsI9CwZdWGqzxKNpAI1ePn5cEzd27J2ZIta+gj1hcoiRqlUxE/my?=
 =?us-ascii?Q?eWk8hqg2tLY2vzrl0j+Mpio3yyGDnbnkK/vKTP0GVtXUPX6+kmHrUw5eR2Z7?=
 =?us-ascii?Q?way9xuFAMAkvWDYsS6uVE7yXZAMHQ3529iAxkyYf+WmD2kQkXapOwKihS9dX?=
 =?us-ascii?Q?G2XVSbrlNA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b9ef77-3be8-4ac6-267e-08da1ba0b9f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:50:35.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WV1T5eJQEiyJoFzlASdZ4xJLAMaTFfdoMmab5LDWIUaKzwi7ilmRBavu3bQ5CvXaMatr9FJc6cH5oASSegPbFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8280

On 06.04.2022 16:23, Jan Beulich wrote:
> On 05.04.2022 10:45, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
>>> GrUB2 can be told to leave the screen in the graphics mode it has been
>>> using (or any other one), via "set gfxpayload=3Dkeep" (or suitable
>>> variants thereof). In this case we can avoid doing another mode switch
>>> ourselves. This in particular avoids possibly setting the screen to a
>>> less desirable mode: On one of my test systems the set of modes
>>> reported available by the VESA BIOS depends on whether the interposed
>>> KVM switch has that machine set as the active one. If it's not active,
>>> only modes up to 1024x768 get reported, while when active 1280x1024
>>> modes are also included. For things to always work with an explicitly
>>> specified mode (via the "vga=3D" option), that mode therefore needs be =
a
>>> 1024x768 one.
>>>
>>> For some reason this only works for me with "multiboot2" (and
>>> "module2"); "multiboot" (and "module") still forces the screen into tex=
t
>>> mode, despite my reading of the sources suggesting otherwise.
>>>
>>> For starters I'm limiting this to graphics modes; I do think this ought
>>> to also work for text modes, but
>>> - I can't tell whether GrUB2 can set any text mode other than 80x25
>>>   (I've only found plain "text" to be valid as a "gfxpayload" setting),
>>> - I'm uncertain whether supporting that is worth it, since I'm uncertai=
n
>>>   how many people would be running their systems/screens in text mode,
>>> - I'd like to limit the amount of code added to the realmode trampoline=
.
>>>
>>> For starters I'm also limiting mode information retrieval to raw BIOS
>>> accesses. This will allow things to work (in principle) also with other
>>> boot environments where a graphics mode can be left in place. The
>>> downside is that this then still is dependent upon switching back to
>>> real mode, so retrieving the needed information from multiboot info is
>>> likely going to be desirable down the road.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> May I ask for an ack or otherwise for the changelog entry, please?

Ping? This is the only thing missing for me to commit the remaining
parts of this series.

Thanks, Jan


