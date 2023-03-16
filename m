Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC16BD5B2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510715.788933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqWu-0007SO-Et; Thu, 16 Mar 2023 16:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510715.788933; Thu, 16 Mar 2023 16:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqWu-0007Pi-Bs; Thu, 16 Mar 2023 16:32:40 +0000
Received: by outflank-mailman (input) for mailman id 510715;
 Thu, 16 Mar 2023 16:32:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcqWs-0007Pa-Db
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:32:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 289054cb-c418-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:32:37 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:32:33 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB7143.namprd03.prod.outlook.com (2603:10b6:510:291::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Thu, 16 Mar
 2023 16:32:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:32:31 +0000
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
X-Inumbo-ID: 289054cb-c418-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678984357;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xKyaPNrZLne3Aofb+ecv8GLfzZarJA0O9Bf40kDCmNM=;
  b=DS4KnVDPeWubEyS7ab0tMdPgC2RsyU7swTM9qa7e9JZGIDa8AGmG/TSw
   x9H8BmPPgaNxsi739FqLtj+6eB+VH+YM7oaURub6iZuR7DGQxlxTNl/JZ
   2aV0SNkpFGmEroX+VEOSrtAlRQGqCzBIHzsr0a13ykW5stca3bv2mpkC3
   k=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 101149890
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JSa0I62CA4mm+TdB8vbD5fZwkn2cJEfYwER7XKvMYLTBsI5bp2cGz
 2cWWDiOOPfeYzOketBxaY7k9EpT75DWztRhTFA5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnO6gU1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfD39vx
 cNJITA0YQHe2f2bxIuSeNMymZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFQZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13raWwXKrCdp6+LuQ26dSm3KDhWovLQBHU1edrcSJl2mRYocKQ
 6AT0m90xUQoz2SVSd36Uwy9sWSzlBcWUNpNEMU38AiIjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGUEOikNSFJd58G5+dlryBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:Cwl6f6AgeIOnZwnlHehJsceALOsnbusQ8zAXPh9KIyC9I/byqy
 nxppwmPEfP+U8ssQIb6Ki90ci7MAXhHPtOjLX5Uo3SOTUO1FHHEGgm1/qF/9SCIVy2ygc+79
 YFT0EWMrSdYmSSz/yKhzVQeOxB/DDzytHLuQ6o9QYPcegFUcBdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz7OHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T+c1TiyWsmlM73a4m1+cJ+eEzSvBkv/JlZgkExDzYJbiJEIfyxwzd6NvfkmrC1u
 O86yvIdv4Dlk/5byW7pwDg1BLn1ytr43j+yUWAiX+musDhQikmYvAx8L6xXyGpmHbIhusMop
 5jziacrd5aHBnAlCPy65zBUAxrjFO9pT4nnfQIh3JSXIMCYPsJxLZvi399AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlONQ1QEuMaSzz9K9UoJu3cw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosMYad0FI46MLuK46z2MGPx2U6pUCra/fs8Sg7wQrbMkcoI2N0=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101149890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvmYbKNnWbnKoD8RjK8bCHbJbmg+t1h+yik0Dpqtp4GQD9T2cLhL5HE6iuLdMW95JmgzjI5PSU+YAjbjCrV9kJBPiHXjs87pCaiFnyCsxdRtlGc1SrEEPyxJm1zqE2PRZTlRF+/WQE5UhNlsEfwpWyd7WwpmGPN1dCM1CaPgw/JLjyHPqlqJo+NUGSizBD6qMb3FRizjQnZ6O6t4qDvwioRvKRYe1wRjbcyCMEudZ4/v+ju7SbsAV+eS0ReEBD7I7gYqtdmjuKx3BbBpjmBIMxJsvoDtUEOSBGbZFm7lZXYeMVcuCsHXx+tapFu8guRKDvggcXEWvVjh+oW0LHb7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE9FB3PKrGusax0VFJ15lgof7u3GvuDyqan//uxuyCU=;
 b=MmeO8aYHTXxl7l9W8cLyp2ksCXCC24H1H5Klzvw+fknTF9sOG3j5G42RiUMWpjVxozBKLuCMvK4OaPgX5fU+vmNAYpXm8hiLWqWWONAG9MGuu9RN24TLzuKJpHjhZ7SFmiCZAN7zpPXY0OYj+YuERYNuwcRN+gqiIEjgUCdxttD5tIPCy/sYBlc6ivkuBYuew38rNbV9OEZ5BQ9hFliYq/TIHVEuCQ1/EfBkW5bCBErti8vaGpM21meB4VNALIcYDb9gvvYGLQMau9YAR2b9xEgnpGTjKCm9rrw6X1VfdJsH37aLYMhSa1cdYERf6kJSuAMQxg1dau/toQVUfqtJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE9FB3PKrGusax0VFJ15lgof7u3GvuDyqan//uxuyCU=;
 b=GfB7sp9jc4eS+lOM+yrZez+pdZITNvCSNGnqimiBXC8zGxmY0iSYzXMba780NVTo/u9aV3xHuc3BQweG9Ry0SZblpyeNx1igM1E11VOM0jFkFBiy1J8hR9BT4Q0PWG16ZCb1pbxodNJdfjM2lloMdIX9HWjrLk/ezZHuN+UfHB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 17:32:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/6] vpci: crash domain if we wasn't able to (un) map
 vPCI regions
Message-ID: <ZBNEm9HIAlJHzDkN@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314205612.3703668-4-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: BN9PR03CA0854.namprd03.prod.outlook.com
 (2603:10b6:408:13d::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 0680919a-f059-426c-07df-08db263c09f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXeO8fblW9l4CHqo1h3QMUIhX6NmNwOWIJJCzuyHdlgHzdc/rRYrA0DlTNrZcdui+pgJKD8YoEP0XVHtZDqX+VLAoJi3HAH5g0H+qz+2DyU4l2vxJ18H/yfQ2ZDsnTdtCnYpPu1ZMKdTZKQxVZ3m4I+Uhpj/bdbByI7oVcxiFwtvFk8nmeNwcEdYeWrD1XFe/lZg1QJM2mUfvPhgxZkaWDRASQIDX7W5gC3MHeQb15xoMmiARWZAWOKoPqJ104snU7PpZ3e9xHgtyhllN8Gackr44RRYb6fflBvQW8ZyFQPUjqDtQ2FGqJmEsOR02KtaFjNCmaQH+hILeZoKxh99aks9Ak223VmR1a/YTIRy0sUm+No6c9VIIZHpEk4krIy7VH9jPydZz4N+kN9ptbwz2iRfRriaj4K1grqpXVVZT3HU8B7s4ODB8wau7uujc7BBWTf2qdCwKyqFElM0yCygZn72E0QLZfJwNpoQ5qbl08pa51Sneto+cKNjeL8/jgIAvVxlBhcvOp7rsIR5ijRzKat8WnQhVbnUhvFp93ql84ZK9eE7UR7HqWffawOFT7PDZrN+Eo1v8Qz5d8LyN1TPqAzcohEWZl9wg5VdQLoZBbd9OuzM2xAotI6U3yHoTxjW/+DhW5+6aPNy8fTuT9siow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199018)(86362001)(82960400001)(38100700002)(33716001)(85182001)(83380400001)(8936002)(478600001)(41300700001)(316002)(6916009)(6486002)(5660300002)(2906002)(66556008)(66476007)(66946007)(4326008)(9686003)(186003)(26005)(6512007)(6666004)(8676002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkNKRFVTY0ZPSFFYZ1h4akFTdThCcGtkSmJJZjExQk9DMnYydk9Wam5VcTdS?=
 =?utf-8?B?RGVwWGRKeFpkdGNjNEsrQmFLbFNoS3NpRXRnTWFldnhkbjRFVGxaRzNvTWRz?=
 =?utf-8?B?MGFQQVVaaDVMdDl3VS9BR0EwMVJraXVlSk5QaHZhRXJtS2hLT05zSm9SZXY5?=
 =?utf-8?B?MDI1QUNDaGd1ZGwrR1hHOU83RHJUc1FoQ0NGZGVxRUpzSTZIYlJVQ2I3Mzlx?=
 =?utf-8?B?cDJ5Tmx4K2k3TXVObklUak5tZk9kTUsrQXBJTDAvWTA1akNqVTIzYkE1SXdE?=
 =?utf-8?B?N2JmcHMwdC9LUUVCZ0lnWllMOUFRdmZqazFkbFFlMkFlS3hpanU4Sml0dWNs?=
 =?utf-8?B?R2M3WjlSbnhwNkZDV0JDTmEzT25HRGVrdDFLY0RRREpqOGxGdFhETk5BVjM5?=
 =?utf-8?B?ZXdCS0FuWWRtaktkNmJ5QjluZ0E1emx4dkZzcHo2d1VWUE83UWljRFZQcE02?=
 =?utf-8?B?aHBCckkwbkwyKzIrNlBWRld2aHh3R2h0OW5YcDB4RVo3ejZUdHZnQ2phRHZZ?=
 =?utf-8?B?NC9KYkFFVFArRnRTSExSV1ZUNGgrcW0zZ0hsWTZzRGpGOTNVQVB0Q3l4M0Qv?=
 =?utf-8?B?QWZjcVlXaUlyVTVDVDRFWWM5VlluSUZ1SlhXLytxZlJLYTM5Vmhndm9XUC9D?=
 =?utf-8?B?bE1pSXBFa0l6TldTdmE4V28yaHlONHFQeEhUams4eHhWbXNhZTd3aTZIWkRJ?=
 =?utf-8?B?Z05uNy9ZS1RLdGpSUVdYeVZ0akY5RUtYVHdqa2J3YzU5VS9oRm51MG85eG5Y?=
 =?utf-8?B?SG5ELzdCZC90ZG1nbk1UOENZS0E2Qjc3NFR1YmlJaGpKcEpZdW1qVmRYdVVF?=
 =?utf-8?B?T1AralA3ZkZhMnVVSkttWlB2aXJtSzBMZU1oTTBhMUtMQmNxYmt4T2w5MnBZ?=
 =?utf-8?B?OUxXNWNTdko1UzRjZFlYVzJUbm1wWEhoOEhZbytUSjFjcWo3SmQrcXEzeHJm?=
 =?utf-8?B?YUdlRzJsVHoyWnJKdWFodlRnVUVXcVp4M055VFJZMmVuZ1V5WUdpSkZXTkRu?=
 =?utf-8?B?SGRpaDEzUnlTVjkzUFhObXNWV3R2UVd3NUVwQnM3YWw3d2dnQldKNGp6OWk4?=
 =?utf-8?B?MEVsTWhuSUxqd1lwbVNYR2dLZWNncjhEK25TNXovaHBSNTd5eVpIM1R6Vmlt?=
 =?utf-8?B?bVl5Sm5PZGZZVlJSTEgzdHQwVXp2TkhTN0c2M3pDNDdyMHRxRUdkTmcvL09Z?=
 =?utf-8?B?RytVZzJJbDRhU0ZZcWc4QzRYSTdxdHlXWTNBRmFqQnp3WkJmZllnRmplc2Vn?=
 =?utf-8?B?WHdZak80MGJuamRybDkzMHBjcm5Sd2N5ZHJaempKellHUkgyOWpjaWlyZjZo?=
 =?utf-8?B?eXh0S0JIeDd3T1A4bGkwWnNzaHVTTjE5YnNoVGNZMzJETFlFRDNnNjQvSnlC?=
 =?utf-8?B?eDh1MmFFak9YSnlSNFVzTVIxMTY2cnBCbStXaVlvbDRjMzM5SVYyU2pQK2lN?=
 =?utf-8?B?S3ZjQW1ucjU3ZXFacnVnak5XdlpOODJVbzNRM0p4TzR2S1ZsSEs2dW5HWUZB?=
 =?utf-8?B?S3JoQUlzQ3JLTnE0TVpCenAzVFNKbmZ2TmF4cFJXVUNhby9Jek95UWd6VVh2?=
 =?utf-8?B?ZFcyMTlGUnJIUXhwaTNRL1dteEpEK3hadUZqb3BXc0RNYU00cVVCVUNGZ0or?=
 =?utf-8?B?Unh1ZDhSTmQxakZCei9NaERmK1NDVGVrMGxlVk5oQzRMQUllWGVvU3cycVZU?=
 =?utf-8?B?UFNRcTFCanN0d3g5NUdsVC9XdmpwSk8xNDhYdVNZbm1RN1lsNytHVHh6TUIv?=
 =?utf-8?B?ODJMWmxnc2xLcTBaMllZQ293YjdSaGxqci9qYXZLTGpYTVhQQkt2bHdpa0hm?=
 =?utf-8?B?OXhtL0t6L2RaL2x3SUFtcDBSUDZGN3kzSC9lUS9YcFo2b3BOakF3MmJJL01l?=
 =?utf-8?B?MnlyRklKZGZhM1Bvc2loRll5R21GWGpJcEZ2dEtsbHVoeVhJanh0anJtNEZm?=
 =?utf-8?B?Ryt4YS96RkJ2YklkT0M2Z2NsRjhzcE1FcldFR1dPS1JTS1h2aDB5TCtXdHpD?=
 =?utf-8?B?RXhoN3ZDZVpycUtLd1Z4Q1lxditWUmdLQVpoKzU4TSt0V0FPZmVtaVlGNTZF?=
 =?utf-8?B?YUYxOVF0ZVRSL1gyYm5JNTZjbmJzd0RGTW5YQklWMTRIdTM4ay8yMTNSNHRy?=
 =?utf-8?B?VC9JajAzRGp5Q2doRkV6SVhkaHlWa0h6WUJJUmJVZ2ErdlNvS0Y2alhOV3Nx?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ubn3jbNEWyHjDYWF760AzoS+H+epmTf/+7NjrVSROybtpTidJ8zFf11jTX4HUKrXRqMDFLOdVC7mtL5QruFS1uSF68IXe1dm9IlREeYh9o7AYVOSxnYywSj1bnRfui0vaw0vfbrxBS+jNbXauhewZxVu9C9pcccUbhaQx1W4vHJKULCGuXCB82Xpu9RQfdCu+Ok1sMWUyWeewBynn1bfdWNOwsoTCqWEYRj83+SL2pZJiYjk+JjkOvdtOw6gMlMMZwq0mw7AaPDynx/SH1sNhndQO4FoFor2ctclKBVhEKo3Q8zy75xbg8TaJGNpBUm5s55b3l/VTS832mJ6No225BRct0L/75CxupABHqqDr7GyODm7xGDzsxgO7cyEd0taJEP8fDkdNRekbKX556AZf0+rfSyK6XYHkpOheUH2mXBW5zSIka2JDIRLEL93s2YoeUpYiq1m+xRAc2ydJ0p7jiR7ZHwCv4s0oEU1OnTYQOLZf+DSfJGmr0AnN4qHNa1prE6aetmR1Stpe9ONa5g/pnc15LIhuKIeqtM1E7YxEZeiuZ/88aOPH4r1qnLnmde792M/dKo3otnNI5pcil5WMNcXOTEYTpkjkj1bL0HRHyoQhuqEXBf+eqlRKF0Xq5ry4CUJyqpIzqdZ7EQfFuosnWIvRdQ386fLnn1jAYsq2Xk+23o25f0xnTBT044Tziz29Od+WHWtFKPQxDV42Kyykbmbg6HYV/w0QzrHY1Kwtz75yfb55aB4onjH56Nd0vYnlzEkJ/kLHRNPDK7u6HmPhKxY8S3obCykpYWnD+CP7z8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0680919a-f059-426c-07df-08db263c09f2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:32:31.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDFU4R/Zz2jEiTU+o6YtNMpOugCoBvrd7H0q8egpvQaOlk4z42AoBsc0XWRZx5r7GAjjJReV2WxyHhn1Dki76Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7143

On Tue, Mar 14, 2023 at 08:56:30PM +0000, Volodymyr Babchuk wrote:
> In that unlikely case, when map_range() fails to do it's job,
> domain memory mapping will be left in inconsistent state. As there is
> no easy way to remove stale p2m mapping we need to crash domain, as
> FIXME suggests.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> v3:
>  - new patch
> ---
>  xen/drivers/vpci/header.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ec2e978a4e..8319fe4c1d 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -162,14 +162,11 @@ bool vpci_process_pending(struct vcpu *v)
>          rangeset_destroy(v->vpci.mem);
>          v->vpci.mem = NULL;
>          if ( rc )
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> -             */
> +        {
>              vpci_remove_device(v->vpci.pdev);
> +            if ( !is_hardware_domain(v->domain) )
> +                domain_crash(v->domain);

No need to remove the device if you are crashing the domain, so the
vpci_remove_device() call can be placed in the else branch of the
conditional.

Thanks, Roger.

