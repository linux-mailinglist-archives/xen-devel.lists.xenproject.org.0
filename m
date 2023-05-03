Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E36F5268
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528996.822869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Ma-00064A-F6; Wed, 03 May 2023 07:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528996.822869; Wed, 03 May 2023 07:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Ma-00062U-CJ; Wed, 03 May 2023 07:57:24 +0000
Received: by outflank-mailman (input) for mailman id 528996;
 Wed, 03 May 2023 07:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tguP=AY=citrix.com=prvs=48085cdab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pu7MY-0005aa-89
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:57:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208a384d-e988-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 09:57:20 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 03:57:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH8PR03MB7200.namprd03.prod.outlook.com (2603:10b6:510:238::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Wed, 3 May
 2023 07:57:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:57:12 +0000
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
X-Inumbo-ID: 208a384d-e988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683100640;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=itWKGxrLUCqshMYvXypKtCJ+px6WnIaXc4zX2RJ0me4=;
  b=QvfZuZV3On+WCHkSM2gC+s1QbZ0IyibG/dptgvIrAivdgQBfF4lIVuLP
   +Jaj+TLxt15RbXAHnQ5P8tqWEV1T6KPWtZfm6mDIaqPuGEhSqSfhsvpcy
   +vml2ZsX12ckDzokA3AZY0SBn1uoT8YHQteFs6cV6DoHPTR5AVxlNk/Uf
   8=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 107698403
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZMeSbq0VZUnqLDhPsvbD5Qtwkn2cJEfYwER7XKvMYLTBsI5bp2AGy
 GAfC2qBaPzcMGahLdklaN7i9hsCupeAy9JnTAM6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBUVN/
 sY0FzkxYDfchsbm/OrhSeVrmZF2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1AZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rCRzHOnANl6+LuQr6JqokWV9kMqNQQNcxy5m7qYsG+GcocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxOcts9r+ctWCcnk
 FSOmrvBHidzubeYTXac8La8rj6oPyURa2gYakcsSg8I4MLqpo0puQ7eVdZoEKOzjdrdFCn5x
 naBqy1Wr7wDh8kG/6a251bKh3SgpfD0ohUd4wzWWiep611/bYv8PYiwswGEsbBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:0rf7RKGsRo6H44v8pLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-Talos-CUID: 9a23:SbAwbWMnPi/O1+5DXA1k/3Q4JckZfFqCzVOAHxfiCmpuV+jA
X-Talos-MUID: 9a23:NGDfMQQQdlb3Ybl6RXS12DFALMFYzJ2TEVsr1pc8+Oi+FBRZbmI=
X-IronPort-AV: E=Sophos;i="5.99,246,1677560400"; 
   d="scan'208";a="107698403"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeuASqqABLOx1yIhEZqX8BvvtOQu2Dy6rm0gYmAHfl4fsmri6m8h+iqM2Vuxq3nPJF07HPMRHUO6AULxHbMTBtgvJ9rf739/JvKmk4VvgIXee5hPaFINgZPu235r4bGTY5Zm4L+z12g9Z2hbGK8VJfazqLGJldu3es7vrCdKfLMhEYusJpiRdXcpBN4TL1cYayJiaFS17X70dgtJOfBp+OpENzeYqXpxGJx17hwjFSaXdVsofu2z+hvcXWqRnoYixjMAhw/ONaILu46tcS1GzJxoDo4Lvc6T2J4Mb37JfDXl78Kk2f2s2aEWpx/gVkwtQXy/ebWliVbOLzjd6R2TIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SE1h/hbxFGyTWQaiwT8El7+ijhYgcZMhFhy29wQyVA=;
 b=nR0Ydg74lKq7NF9gh11WFe5rmxaFxfRStqRhBZjZOTtFycXd94E3bA3WZY9CyXgCNR974SU3cuGedQfTRlV2uR0pQJ4qAVRzWrIRV9EDACWVBkMSDPuz5ew0nFOMfOgE8osQamUaeWg5vNkfnF1DaBTGZDRNNQYsikSY9zjWItOPoZS3NAd02k+4A+t6GGIUOvTdd/DkUC+Vb+WcoE+goYN2xa7TtlU+OxRuQUttLhR8aLvHrpgUE+OWC54zHV1Yj8YUtVi3ayfF5LbiKA3J2joxfSlcbSD5l/nMpf20Plo2ipbqa0HthT4iosL0EiWFzTVosRc02jhA9chyRxM3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SE1h/hbxFGyTWQaiwT8El7+ijhYgcZMhFhy29wQyVA=;
 b=qGfxJ31aT/umzKH4CRGEKepOM3knajT64UfVs4ekfO/Qz0d8YzwbZeFVNwT1WKJiw6wCVr/gputai1cmtt6bjZnHGKwxh3B2lfI8/ciwNwWflI0t1c2xelc50gfbDG2TWg5so+FzIA5aSHhr+rDncXLDBfKjy2c/+UN89cL/MO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 3 May 2023 09:57:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>
Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes
Message-ID: <ZFIT0+rQRCpBVDU8@Air-de-Roger>
References: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
 <ZFEzAnOskzdb61O4@Air-de-Roger>
 <DM6PR03MB53726982B16DC1FA7B77D143F06F9@DM6PR03MB5372.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR03MB53726982B16DC1FA7B77D143F06F9@DM6PR03MB5372.namprd03.prod.outlook.com>
X-ClientProxiedBy: LO2P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH8PR03MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac2aa51-87e0-4f92-d8b2-08db4bac00d2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wGF/M20XJenEdc5WJsI03d/3J2Mw7006RagmapNu7QGhn0GiMNHcIPUvjcEYDEbYVQyOhdxi2CNYhx/wNBt11TXF9MII7R2pdMmP2+MvHJc9AqBMO7SPfYPtyMNZbfdj9VA71zRDeu7QG/bCoELU20Y0wtfPl7UvUxtE5WH32+dTGdn7/Qbj33/y6l3chgsIdRnstmGx2vOYW06i9EH2Sraoz1xxjjaESU1S1vc8jJr2DIxIE1qHW61Pi47tibAIqR5lYqJbpxsubTx1/2Bn7HSHKV5+DcJN1cwkdbpyChn+MVe6kV/mjhUNBNvo+kJXJ/okZQ8X3/xkZkwDkhH625pG2jshugnHT7VvSzgiVJhBi+wWiVWpBZiWv6xNvRs2ZnD44rK3WoRtbTXMbkCrZy2hll3juMmph+eeo4WJInSyTnUFH9DfiGyDvgbvSnWLtXRpCHYnoWRMZXxi9zWGOKMWNNTLQhg2BxUARM1ZiKFUNgZisicAVEQQhlahWNwaA/XaLmdE6NLxIKu8aR3Kw6b8eQtQdl06it3xtWEwOJhdCNFuLdoVwvCKrlLL5ErXggThecenHx6rLDddjG9j/iou/MJAqRnK3yTdrY5jsRU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(478600001)(83380400001)(186003)(4326008)(6636002)(66556008)(54906003)(53546011)(9686003)(966005)(6486002)(6666004)(6512007)(6506007)(26005)(66476007)(316002)(66946007)(8676002)(41300700001)(5660300002)(82960400001)(8936002)(6862004)(2906002)(38100700002)(85182001)(86362001)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0JZRDBVVlh2UUlxVTJJYlNEajEwL2FKemxoL3dHbG5Xc2tDVURQenFyV3ZJ?=
 =?utf-8?B?UFRnN1hFMVg5RkpFNnRsNmhoNlN0cUc3MGJEd2FPcHAvZFBhc09OT201dnVT?=
 =?utf-8?B?aG1Na05GdWxMN09jRjdrclVvN0VqcEhMamRnYWlTUndaa1Nrd1VyQ3JiYlRT?=
 =?utf-8?B?elJRS0ZRUndDVjRIcU1rdVNDRTVzTERZbjN3TkRQM1M2UmU1bE1oQVZucWxE?=
 =?utf-8?B?aURyNDhFenlVVElsQkxaSDI4NFEvREhOSVVrZUdYdkFZNWV4dFF1OFR0dm45?=
 =?utf-8?B?TzlOLy94dWdNeWlId3JqdTFKY0JCUW5NbmxDbHFIemZmdjc5T2V5aEZhVUJm?=
 =?utf-8?B?OEx6VEJNV1B4Tks1WTR3TC9pR3ZmWXp1M3NjUkVoODJCVEZnQm82b0pxQlZB?=
 =?utf-8?B?OHVtbkZOM0I2NUt6N0lSSjB0MlVjSDNaZGp2Q1pqb2Rld20yT0hCOE4xOTZV?=
 =?utf-8?B?V0NLSWpoS05EemhENXYyWWVaU05XOXNBamxRZUp3T2I3M3BFZ1h5OGU5VnlP?=
 =?utf-8?B?YUxWOTVPOWdUR0tVRlJBM2xQak5YNmRibEsyOWxtR05TdUJ4SmpIcGRFU3ZZ?=
 =?utf-8?B?UDNENFlyMnV5Um83blR3N1FUWDlPb0JjSXJjM2VmZ3pQd01Ia0l4MGZ1STRU?=
 =?utf-8?B?MnRIV2RaZjdFZnpMVi8vVVRBMlZxS0pUdVk0V0doekwzQjRtbXNhc2E2Mndk?=
 =?utf-8?B?RUE3VkJXaTlwNXhBK3BDSlBGaGVmOEFnQ2c5UW10SFc2c2JFKy9rUCsrdEY0?=
 =?utf-8?B?ZzJvczdLYUNnMHFGY0RBZGRsMHZLa0h3WmZnVC9iRy8wSDNRZEJTRFYvNVhG?=
 =?utf-8?B?ZkhNL3ZsT1JZZHRUTlcxY1BsY1ZlLy9mVFJQaERKOGNOaDdFTHZVWUlyNk42?=
 =?utf-8?B?N2dIemt4UWEyL1ZoYU04bmRiVElrUlVMR2EyYlh6MTlkcmlIaVh6bDZuam9K?=
 =?utf-8?B?eW1pR3pYK28vaFh5K1MxbGhYYnUwM0RsRVZEYS8vcDFFU3drUlE3SWFsdzBw?=
 =?utf-8?B?VmV1WStWQkRmWkZXZ3V4VjM5Uk1iWDYvYzdQT2FyMFJQQjBUSHM2dUdVU0lZ?=
 =?utf-8?B?V2FIaHdOTFcvaXlJZ3JveEdyVUtBZjFobFNEeDU0YWZMd0RwMjlQZXYwUTVo?=
 =?utf-8?B?TVdLQ1ZrVWxmeGdmeW5aN0lZZGpVbldyUEx1OGhPUVh4MXVtNTFlM29qYlZU?=
 =?utf-8?B?VVlyYU9nZVVZbGtvZGltTzJoYnIyTm5Sd1ExTHk3Z2hza1JoYkdzbDRTUHN1?=
 =?utf-8?B?L3hWM2QrVUljZEZkM0M0VmdVMjVEZ0lNazNQZE53U0VOTEhOclVraVFMTlFF?=
 =?utf-8?B?U2xpb1N2U3VmNU55RnhHRXR4ZFRVY2ZaVlpOZ2dXb2NqSzlicXVnbGZQT1Vr?=
 =?utf-8?B?WG4ybkdZUWF0M3BaR001NUZsSk5Vb2dXVFRCcldxdE9nc1ZjMkR6SVNsWTNF?=
 =?utf-8?B?eHZyZStIUXA4Ymx4dEFLeUt2NmtHRUpPK2U2emgyY1V1QmRmbzJCa0NCSmIw?=
 =?utf-8?B?K2lpKzYxYXVuSTJFYkpNdmkvOU4ydkJ3Zm9rd0VBS2ZOUW8xYnovb2NlOGdQ?=
 =?utf-8?B?UE9ML0FUUlNlNEE0Q3JEZEV2UjltdVVTMXFDQVhCRCtrQ0ZTMWdqL3djRWZl?=
 =?utf-8?B?VSttYk5Pb2RSTzlyUkxRWFVIc3dQS0JJOHdVTFJlV3VJK05XcnlxT00vUEV5?=
 =?utf-8?B?MEpkbE1PcFM0bWt3QnpWVW5wTHI1eTN6eEVVTWx0d0xMWVh4UkdnVExESy9Y?=
 =?utf-8?B?WlRwa1l6N2xWR2dRK3RZa29rRkFaQ0FGUUlObU80d3kxbzhBeFNFQnNxaHpz?=
 =?utf-8?B?VG03VXZobmw0Q281clc4ZjVKMmxoTkxBT3dTTVRNeklmbThLNE15SVVZL2JC?=
 =?utf-8?B?VkJGTTBnRkoyTUtTSCtNN0pnNGF0Z09nR0E5WGdvSkZmZk1waTBkaFFIcHJi?=
 =?utf-8?B?V2IrUGtOd24wUDZHTjlTWHlDd05zd0JNUjQyMWZHMms1VklsVkRuNXFSNnRs?=
 =?utf-8?B?L0ZqbWJOU0RGaGo0QTI3UTdyUXgybFo3NG9DL0FNUmtEYU03NjhzK1plUVJV?=
 =?utf-8?B?d3d0NmdVZ1pCWDdoNkxvdFFzRUJMalI1V3gxNDhLUTF2UlNtYXJkeGZnSnVi?=
 =?utf-8?B?QWJqcS9VbUdKaVFOTjJLdXJsc3JocS9pdkZjeldPMU02VklLWHgwanhtUVFq?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ewb1XD0ZKu+1j2l/D3I8loJVw0bdzx4B2dvY7XcCKCySe+wwZVUd4vpZjMaoDc/J5mjhWote+LpwhrNg+GEY+UagvQBMzku9jBgXPBkaVOuReyYZQmhdHLiKr1imTCMtB+QI1t9LT1nDnusHKmcRQDmjZBAa0xZKP5xoQq+++EqNZJi4eYeYcaldy5yzgaGO7TFK4kxDr8j4QnU1m3u8wrqbXUcXZ9iX2OcjGB7AgTvrf282QLr/BcAnpFt/2V2VwzEoVmIHu1B3B/sKR3xmVAOFvI6UuqssIdAno/duu+uqoq4tYUNdz8mjIhq3IeOefvttnsNSZoVrUgYyq6t3YBia5gZsWgEA2G5hjn9HS2zUcA4dpIQ0uNa+Q22PMBB4WQFCX1/FCpPiQf30MJtBOua0+kffp2/ZzzIevmNfhQbw7EbrjC9CO6SZEmxd8irG0aaETF3pNhjPaRLR5BWehAvoxC1uydAnEYhW03YLXmxXjZiJ+zLfvreTdW8jzAN/WgpaP+5DK9w+xnLenxtRYwoY0PfluBfbUOZGWhxtJnimXo4UbrdSKS8DRT2ihLz59ohTNWbivQQfYqDq89V1e5+oy3St3KrQIx7HFfPSduA+biauL4CPZvC1dIxozwCw/E0OP8tQpfBcb+Z0H6PxxvUbyq6k6lOjCvAotINbphDGcYMjWyeZ02FfqlrIQmwOBkpOaqoWMwEHK3bAXvnCUSMJgXAvtfWrSsYdZ7XRrLqOHISTbMt4sPSxDl9P4E4GXpoKa1nwr7U7mZP3qxs3c9yeM//arTnxZutcysfkWkMKM4cWMAy7SqEvS8dTSdrHlzB3BI8RTorsB41knZLoStFpMK9OOi30GC7U72feAaq3C5TPkDo3o99mRPsjWgm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac2aa51-87e0-4f92-d8b2-08db4bac00d2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:57:12.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKlAsURm+LbZWB35AOf+UJvY19oTdIj7E0sPnPDmIBr2v1OTdNMsmwg13YyizPzkxYJo78Fo/2fimEUnXrM4yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7200

On Tue, May 02, 2023 at 04:40:17PM +0000, Ross Lagerwall wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Tuesday, May 2, 2023 4:57 PM
> > To: Ross Lagerwall <ross.lagerwall@citrix.com>
> > Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; jgross@suse.com <jgross@suse.com>; sstabellini@kernel.org <sstabellini@kernel.org>; oleksandr_tyshchenko@epam.com <oleksandr_tyshchenko@epam.com>; axboe@kernel.dk <axboe@kernel.dk>
> > Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes 
> >  
> > On Wed, Apr 26, 2023 at 05:40:05PM +0100, Ross Lagerwall wrote:
> > > The existing code silently converts read operations with the
> > > REQ_FUA bit set into write-barrier operations. This results in data
> > > loss as the backend scribbles zeroes over the data instead of returning
> > > it.
> > > 
> > > While the REQ_FUA bit doesn't make sense on a read operation, at least
> > > one well-known out-of-tree kernel module does set it and since it
> > > results in data loss, let's be safe here and only look at REQ_FUA for
> > > writes.
> > 
> > Do we know what's the intention of the out-of-tree kernel module with
> > it's usage of FUA for reads?
> 
> It was just a plain bug that has now been fixed:
> 
> https://github.com/veeam/blksnap/commit/e3b3e7369642b59e01c647934789e5e20b380c62
> 
> I think this patch is still worthwile since reads becoming writes is
> asking for data corruption.

Right, can you add to the commit message that this was a bug in the
driver?  It wasn't clear to me whether that was the case or it was
legit for FUA to be used with requests != write.

> > 
> > Should this maybe be translated to a pair of flush cache and read
> > requests?
> > 
> > > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > > ---
> > >  drivers/block/xen-blkfront.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > > index 23ed258b57f0..c1890c8a9f6e 100644
> > > --- a/drivers/block/xen-blkfront.c
> > > +++ b/drivers/block/xen-blkfront.c
> > > @@ -780,7 +780,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
> > >                ring_req->u.rw.handle = info->handle;
> > >                ring_req->operation = rq_data_dir(req) ?
> > >                        BLKIF_OP_WRITE : BLKIF_OP_READ;
> > > -             if (req_op(req) == REQ_OP_FLUSH || req->cmd_flags & REQ_FUA) {
> > > +             if (req_op(req) == REQ_OP_FLUSH ||
> > > +                 (req_op(req) == REQ_OP_WRITE && (req->cmd_flags & REQ_FUA))) {
> > 
> > Should we print some kind of warning maybe once that we have received
> > a READ request with the FUA flag set, and the FUA flag will have no
> > effect?
> > 
> 
> I thought of adding something like this but I couldn't find any other
> block layer code doing a similar check (also it seems more appropriate
> in the core block layer).
> 
> WARN_ONCE(req_op(req) != REQ_OP_WRITE && (req->cmd_flags & REQ_FUA));
> 
> I can add it if the maintainers want it.

Hm, yes, it would be better placed in some generic blk code rather
than (possibly) at every driver, otherwise people might complain that
xen-blkfront trows warnings for requests other drivers handle fine.

Would you be up for sending such a patch to generic blk layer?

For the code here:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

With the commit message slightly adjusted to make it clear read + fua
was a bug in the module?

Thanks, Roger.

