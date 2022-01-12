Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D422248C9B6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 18:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256802.440891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hWG-0001qn-8i; Wed, 12 Jan 2022 17:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256802.440891; Wed, 12 Jan 2022 17:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hWG-0001nu-5Q; Wed, 12 Jan 2022 17:34:44 +0000
Received: by outflank-mailman (input) for mailman id 256802;
 Wed, 12 Jan 2022 17:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7hWE-0001no-FY
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 17:34:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaf4f655-73cd-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 18:34:40 +0100 (CET)
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
X-Inumbo-ID: eaf4f655-73cd-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642008880;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=J/au+q5vrHkbFNRXJW+gUtLdkvjFmOProO3/XnYbdPk=;
  b=LQqAPFanHGyzrbQtxJfYc4b0DMg+6Maj40ToIbgua9LwtYEkHRBLP7/f
   5g6xa/zTmtzlt9cdRW4dvrgfECweZTqOk8J/IBZ/4BuAYYc+fbvdnxjVD
   sXScjl3/VSlQTJhayxgiIuEckE2Qet6TSGqns44XDyvxt54KTFwWvVXfA
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NrW8EMrL4pfTXGpnoZTTjEuVFcW2l9i0cmgpf209t9Lq6Nc6y/PCWgUyUrK7GmIN+mqMsyLfs/
 WYEfwPmuTxPSuslojIVXX8pBKQpJ8+M56QjEweDKqggAMSeDUy8hvi6QLekQBl4RYXacSnvUbm
 paUI+osuFBQxiru1Rg/a62wP9kFZhbwxBH+C1ozOeXki0E5lXm39rJ9lNpDQoay7V9ADNvMQH8
 zBbupQ6gjjmpMJlcoSycop2aTjZKpHDWBTaO9ddiW8nBjz2VRhUfFUMv8TzDeHkvUw6fJYmLCW
 e56NCxOMjzRMT5afXsI41FCL
X-SBRS: 5.2
X-MesageID: 62257435
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PWrf/qmhDztcN3DUBkuoL+To5gxBIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDGuCM63ZYTH8eY10bI209RlU6JTdx4BiQVM++Sw2ESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N9UksCVWSczBJPrnsZCdBNqFHFlJZQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq3J0RQa2DD
 yYfQTZORwvifxptAHceD5QRoN2OmCXuWSIN/Tp5ooJoujOOnWSdyoPFKNPIfvSaSMMTmVyXz
 krE9WnkBhARNPSE1CGItHmrg4fntDnnVYclMay3//9nnnWe3mUWThYRUDOTpv20iVW3Xd5FH
 EUS9jAztqg59EGtTd7VUgWxpTiPuRt0c8BZE/A+rhqMzKXUyw+DAy4PSTspQNYrrtMsTDomk
 FqAhcr0BCdHuaeQD3ma89+8ry62OCUTBX8PY2kDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj3qO35wqf22qEqZ3ATwpz7QLSNkq76Qd+aJ+gdpaf41HR5vZdL66UVlCE+
 nMDnqC26+QDDoqEkiCXd/kcB7Gi5/uDMzr0jEZmGt8q8DHF02W4YYla7TV6JUFoGsUJYznkZ
 AnUoww52XNIFCL0N+ktOdv3Upl0i/i7fTj4ahzKRtBXRcRUZC+dxh9JY2zP+Grflxg3iZhqb
 P93bv2QJXodDK1myh+/SOEczaIny0gC+I/DeXzo50/5iOTDPRZ5XZ9AaQLTNb5hsMtotS2Iq
 443Ciec9/lIvAQSiAHz+JVbE10FJGNT6Xve+50OLb7rzuaL9Qgc5x7tLVEJJ90Nc0d9zL6gE
 pSBtqlwkguXaZrvc1TiV5ybQOmzNauTVFpiVcDWAX6m2mI4faGk57oFep08cNEPrbI/lK8uE
 adVI5rbU5yjrwgrHRxHPPERS6Q4JXyWaf+mZXL5MFDTgbY9L+A2xjMUVlS2r3RfZsZGncA/v
 6ehxmvmrWkrHGxf4DLtQKv3lTuZ5CFF8MorBhegCoQNJC3ErdY7QwSs3q5fC5xdcn3rm2rFv
 zt69D9F/4EhVadvromQ7U1Fxq/0e9ZD8r1yRDiEve3oZHiDrgJOA+ZoCY61QNwUb0utkI2Kb
 uRJ1fDsdvoBmVdBqY1nFLh3i6k54rPSS3Vyl2yIxV3HMAamDK1OOH6D0ZUdv6FB3OYB6wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0XegiJqM7YoYpgux
 v0suZBK5lXn2AYqKNuPkgtd63+Ici4bS6wiu5xDWN3rhwMnx0tse5vZDiOqspiDZ88VahshI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEw4OXiOU20Rtd9SUMYj5UlhgXgfhuP
 mVLNlFuIfnc9Tlfm8UeDXunHBtMBUPF9xWpmUcJjmDQU2KhSnfJcD8mIe+I8U0UrzBcczxc8
 O3KwWrpS2+3LsT43y90Uk95sf3zC9d281SaysygGs2EGbg8YCbk3fDyNTZZ9UO/DJNjnlDDq
 Mlr4P10OP/yOiMnqqEmD5WXiOYLQxeeKW0eGfxs8cvlx40HlO1eDdRWF32MRw==
IronPort-HdrOrdr: A9a23:/bvhcqq56OHOVXI8jNSOpEoaV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnlE422gYzRLrWd9dP0E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="62257435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3SbyU4YsjGITIlPXWWs497SAGimwks+j2k1ITTwMLHo8KynKnpxD10sH5LQkB/4sLYuz8A5Ba4vlnynoejZIoisLMRCiLbbV5I0jVQJT6lEJIxGqaO6s7sDMhDMwXVfE1oE5p+eS6g2PH6DyoxeswgTup9ZERZAkCZglvKZp30zDaipR/t4Df8AOSJox3g/jnnn/yD2y4NsnYhoA1M5dSHxxd/UkDSFaHggohq5dR8aEMoE21ULD44q3H7o09PAcyve5VdMKfsHXim0amYZWa1MlD7lpStQ2J3XWGaPVqTzB9zV2NXyf69/gpjCfXgHHkf+uE7nfT1NCiNxqAIj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGA+8NuGfkZOot8O5jPiHhr4FywJLuwxEOFpXbc0eqs=;
 b=FAuha1PBmPQyO5dRCEw6zc4VlvGzPYil/myjXH1GtrRuwO9uHb1zAlRtiCTkohJGYEyXoPWkGe/AK+kmvkGEcne/0iZGFQ7fWz5JrRn8albgG/IklGdrl/E882TjGhMEme9B+8yOKOA215wevPJkaaiVtZ5tIK3ixqO2nuYRBK9fVjrDdLyra2kpGw1JkeZxKhJSNL9tfkoDmg6qRTUjO8/Q01oD3M9zJU6LsVqcJR//Z7jkZ/L8ESwRk8uIzzEwnVnajxkUyAHA00oPNSQC16PRpnzxME9xvBy473I7NZ4tjUkpAJK6Tea2KpwojH9I5qS6/hPnmwBXN0xhlaf+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGA+8NuGfkZOot8O5jPiHhr4FywJLuwxEOFpXbc0eqs=;
 b=dfVXr4t2oMi9rxJXlheHzWsRRez96k14O5yoRCO9fAVc0RFb0nO2bl6HG913rSw051prUWROwJwcWTeFr2NVPkyo5F3nd7pvtTBYUPYEXR+BP30MOp1bp+Ls0kIiVuntdtg2ae7nM3fNNsItmw/wBn/PS/Fpz7H70e1ZE9fKFtE=
Date: Wed, 12 Jan 2022 18:34:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <Yd8RJfpEalnfl+CC@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-7-andr2000@gmail.com>
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e33434c5-9fdf-4966-7478-08d9d5f1cc17
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5885:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB588542FEFCB64D501A6FD6818F529@SJ0PR03MB5885.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yFHSfOnJDn4fMrtF0kN8DS0rFxZdXWZ4v+u6Y2ynvv+hWTiX9OjXZoTPmxwPps4zmext4+XlVqn778F5luJwe5+TqtZgYgr2YPwl//jMI+7wkbjwnwPiCwRC/d2udVP+AE9iFIKvb3BVIxLFpDK7UGbgXbbR/n2g1xuvr9NHml+DYhsV+wkfW317QLVAPayct0LSCHs8OhN+dfXrXv8FMxwkov/rsrIMWhQSIdbL8aU0Ub8DrZuALt/2+D64APCITsVNcL/CjfH8FAawbPyKazrPxbp27hz3+z11D/QM+AGlNhqLEJyXVP/r6uG6M4xwiVFiY6M25ENqGgtKgwitBsXvK5GYpAkC1VjT5dp0hQxKqdtBTMpq+SgoljL8/DD63yH32WNchsJnbBmH0hl1PK06uQnEekv233wiSjIYlC/wMb9m9BO/NxhLTwX9XI5wNWynB+HA7S4J8VxOs1qu4PbYoz5ZMLKbEtMhzzAV4O6qqi8LP3JMK9cPgMMpWbNUGo69/knKu5FIrPGUTs/yko13HqEOeG15RGZD2GbUaOKCk32A07Otw6hA7Dtwtxfly1AKGsZrXEzV1YBIJ1I9lthHAs67pCceCiHGg6gCaBsl4+qxJY8C1T9faxHbzunklaAYHSuEi6fM7b7QjHhmsk4hc0crxHb9OkJISYvgdj1e7+0kImz9mQ+IM3Og0LU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(26005)(66556008)(6506007)(38100700002)(7416002)(186003)(8676002)(8936002)(66476007)(4326008)(508600001)(6916009)(5660300002)(316002)(6512007)(66946007)(2906002)(9686003)(85182001)(83380400001)(86362001)(6666004)(82960400001)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elRHRStpQ1REYzljU3h3RmoyeXB3TmErVVBjdVYveXVYVzlzeFh2Tkx1ZmxE?=
 =?utf-8?B?RU5jVHNJNWI1WXJ0MldISmFmcXkrbE5jRVBmMkhjaU5XamMyOXVJd2hKTno5?=
 =?utf-8?B?cldvWHg3amo2NFBpK3Q3WjU0QXY2dDVNUENHckVhaEJKVThqa0syMHdVcG1m?=
 =?utf-8?B?czkxbXZXc1JKZHFrOHZvVWdXeHAwZmdhZTRFOW1zdzZBSnVIZ2l5eVFYK2I5?=
 =?utf-8?B?UHA5Rlg5QXlObytQTER1UjJNak82Q2FHZDRteEJRSHNqQnJ3QjI2VzFLVFpP?=
 =?utf-8?B?aGNyOUlGSXZKRmF4Ri9DK0lmbC9CZTVrWGEycmk2QnBZajY3SWhCVVNCUXhq?=
 =?utf-8?B?VVh5VDV1MnhrL2pKdmhHTS9sd21KWTlGbG13MTJZR3pxckNUYWhKMllhdlFE?=
 =?utf-8?B?NFE0TFhURHhzTVE4cUlDQmtiazhCN05YQlBaNVQzR2lQWDJPejNuTEJEbDd6?=
 =?utf-8?B?K1h6am5VSEM3YklDZ3I5S2RqU1ZzQXZ3WThaU2xDdDFRd3pWOGVJYjhlSFN0?=
 =?utf-8?B?MDIrazRaZC9GVDlzZVNrZkpwbFcwdWxaeDRBYjdVaVJDWVJPWmhuK05iL2Fl?=
 =?utf-8?B?Y3NDdlNHVVR5dVdvYVF6WFRBbVVxeXFQMnlGUkFhOUlrQ1RaaWwwc3NwSVJa?=
 =?utf-8?B?eEhVWnZnaFF3WDRRS0NQVDRWeFB4L3JZK2Zndy9ZcHVvUlY4Y0tob1g5Y1I4?=
 =?utf-8?B?Y1c2RmdXaEh5ZzNxanIvV2xKU290T2ZqaVJ6bW9sdk9YdncwR2lzcklweEh3?=
 =?utf-8?B?QS83MUV0TFVJNEVpK0lRTDJZUWkxcjhrUzRNbWZiYTBVZ2NqL2lkTk5KUGVM?=
 =?utf-8?B?N1lnUXgrS09SQUlvRUVBYUhCMWw0bWZhdC9wTDVIclF1d1NWVTd6TGIwWFE3?=
 =?utf-8?B?T1k2RFFOZXN4L3RCd1A5V1pHQTEyUlFjbzcwYThEZlVINDNyZTRkUG5NTVI1?=
 =?utf-8?B?WUhzN2k3Zm1BZlJWVjZNZG1Ud3RlU2pmVThyNWZoenluRHUzUWtYWHN1K0dX?=
 =?utf-8?B?dDk4Q2VoM1dwL2hmM1Y0ZzkvVlFxaGtyK2hOb2xMYUIwK29pZDhCYzZ1UEky?=
 =?utf-8?B?VDdUb1JkL1JzOW11eXFFazg4dlc3WmRKMW0zQWNxWFo2QVhDVlRjMDAwanMz?=
 =?utf-8?B?bEFIeUxrSE04SysyUTdTT2pSVFNMNU14OHFGVEErVzM2SjMyNUozVVhNampj?=
 =?utf-8?B?NW1pZ09KRkZOdkd1cnFJMktoUG8vM2ZLdW00M2FId2xwRFJnSEI0cm5iajQ2?=
 =?utf-8?B?RVJFUDEwSFRPNklXcHNMVGlkT1hEbmFBcVJ3SGFRUXZMaXNOTTd6ZHorU2Fo?=
 =?utf-8?B?eEJkeDhnYzVGVzlkek1ndW4zOWZmeGRpeDVtS0NjVTJZTU1EaDE5bnRTT0sx?=
 =?utf-8?B?Qi9qb25NTlozcGdTeFVBUU9oNFZ1VzNwNGVyWkdFMDI3dFQ3NEtFcU9hcEI2?=
 =?utf-8?B?RmdUODQvd0NwV052QnJOVkhlNWRsdEtwVGZRNmRyUG04cEU3K29qdk91OXZq?=
 =?utf-8?B?aGNqVkd0N29EOHVScFdpUG5FenpidFRRamhQNjlEcTdKR25rWHRCRVRidlE2?=
 =?utf-8?B?MTIxVkIrRnBBNWRoNjZzT0xvNWVNSFBHRU5DVTA4SEVBS0pCY2dBVlpjS2xY?=
 =?utf-8?B?dSt2aU5FNllEbmhzV2llR2Qvdk13bDRVd0l5Zm1yMTNIRkRKcDJrSnZCZW9K?=
 =?utf-8?B?VU83MzU3SWd6clExMTdPRDdNL1JHb0dXWU4rT0JkOVN4S1MxbFNINUhXWk81?=
 =?utf-8?B?aXRnUmVHK0plbng4M3NDbmZqZlBrRFAzdUtGWnhUK24vUy9RbHBSR242UUtK?=
 =?utf-8?B?ZWs0ZkRqajB0THMvTmxtNllOZjV1NTZ3WjVCOGdHSXZITWNjOXBMU2o1SWZI?=
 =?utf-8?B?cG1Wa1FRRDlJODVkdDE0VzZDYUpNM1pRQklGNXJ4ZWViQjdqK280ODJhNEYr?=
 =?utf-8?B?dTVVYnpWaTQxRjdNTHIyL3Vabi9vWjNRaU8yUUwvQjJLR05PQ1YzcFlTK3lo?=
 =?utf-8?B?bWlTa2NmcFRRb21qclNTZ01qYVB5Q2kwUE9HcE9qeUZiOVp5bkNkYktSNThy?=
 =?utf-8?B?L3E1cnBlRXhrTVlYSm1zN2JLOHRSR3ovcGlBK3pnY0I2YXJSdjN4OGpwS0Jp?=
 =?utf-8?B?UGtaTWpVN2xmOUF6YVh0alB1VVkrZHg5MHdJTUw5QUVqeVFRcVUzOXZRU05h?=
 =?utf-8?Q?BU0HHPx55nG2TuxxWFf0GQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e33434c5-9fdf-4966-7478-08d9d5f1cc17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 17:34:34.0215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gsw/PkhHSJsGBlhYsMQoYew/DrEHz2VfTgfth+MrQTfoV7ROHaBxDYMHTuG3I6T9es2iMkE6sHlbSCkK2Plt5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5885
X-OriginatorOrg: citrix.com

A couple more comments I realized while walking the dog.

On Thu, Nov 25, 2021 at 01:02:43PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM handling is supported
> for x86 only and it might not be used by other architectures without
> emulating x86. Other use-cases may include using that expansion ROM before
> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
> wants to use the ROM code which seems to be rare.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>   handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> ---
>  xen/drivers/vpci/header.c | 72 +++++++++++++++++++++++++++++++++++----
>  xen/include/xen/vpci.h    |  3 ++
>  2 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba333fb2f9b0..8880d34ebf8e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -433,6 +433,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    bar->guest_reg &= ~(0xffffffffull << (hi ? 32 : 0));
> +    bar->guest_reg |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    bar->guest_reg &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;

You need to assert that the guest set address has the same page offset
as the physical address on the host, or otherwise things won't work as
expected. Ie: guest_addr & ~PAGE_MASK == addr & ~PAGE_MASK.

> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +
> +    return bar->guest_reg >> (hi ? 32 : 0);
> +}
> +
>  static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
> @@ -481,6 +523,17 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}
> +
>  static int init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -489,6 +542,7 @@ static int init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
> @@ -528,8 +582,10 @@ static int init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                                   is_hwdom ? bar_write : guest_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
>              {
>                  pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -569,8 +625,10 @@ static int init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);

You need to initialize guest_reg to the physical host value also.

>          if ( rc )
>          {
>              pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -590,8 +648,10 @@ static int init_bars(struct pci_dev *pdev)
>          header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
>                                PCI_ROM_ADDRESS_ENABLE;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
> -                               4, rom);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_rom_read,
> +                               is_hwdom ? rom_write : guest_rom_write,
> +                               rom_reg, 4, rom);
>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;

Also memory decoding needs to be initially disabled when used by
guests, in order to prevent the BAR being placed on top of a RAM
region. The guest physmap will be different from the host one, so it's
possible for BARs to end up placed on top of RAM regions initially
until the firmware or OS places them at a suitable address.

Thanks, Roger.

