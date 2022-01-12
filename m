Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB948C777
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 16:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256731.440716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fms-00074d-PJ; Wed, 12 Jan 2022 15:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256731.440716; Wed, 12 Jan 2022 15:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fms-000726-Lr; Wed, 12 Jan 2022 15:43:46 +0000
Received: by outflank-mailman (input) for mailman id 256731;
 Wed, 12 Jan 2022 15:43:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7fmq-000720-TY
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 15:43:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a5c677f-73be-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 16:43:42 +0100 (CET)
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
X-Inumbo-ID: 6a5c677f-73be-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642002222;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4vnnTHknJsz12LxTDM+5NyqK0ysyI03RoZWtlhUil1o=;
  b=f+2cqiSWN8KU36+KCQ1xvy/FEa8UjqEEDyFuA5qZd3lmfsTv5Nf9Jwtk
   T0XF302BWuXCGJk2S/m8BseDgagkyjHmLvgNMRjLsf75jlH11UBTYaTIH
   LCd4QPBR0rTmAjhysv7kvhlVQ9IM5YlP698tjIgkmYp9jzVM0VdV/AXyI
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DltGclRys/UFQJoJbT/WKvMRO90PC/jMFcnwDr1PWR/u8t8F06hJ0lq7vYUUSIMYhWKA6E+aDd
 GdJ4FKpiriN5xrRHZYzOpfDm0OYIyaYZXIKRB5R1Aih7hy7K/7fEPE26uPejHPCUqvLxoHFzT2
 har8EjLk9S+fc1ObJtstr1X9R9PIlg9UZI4DIBAayFTHB65WSGLqLhGabtU/BtDS1dCntBFpva
 5HliEph1GUD0PlEgCCzOSu/zm+FBteU5YFRNzL8RsN4jAxFeBJiY92ox9yyltwqbQ2PUbIF+Fq
 ic2eHlDNpEFDn3PEpEyOaVHc
X-SBRS: 5.2
X-MesageID: 62245909
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zYGkBalZLE0ZrK+djs519oTo5gxBIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOC2uEPfnfMDCncowib461oEoGuJLSzt5qTQtkrSw9QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PFVscShFiYFBKLvmMRCAyZUKD5UI4QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq3JwTTK6PD
 yYfQSp1RRfPRBhKAF0oC4kaoM70omT9UjIN/Tp5ooJoujOOnWSdyoPFOtfPZsaDQ8kTm0+Cv
 3/H5EzwGBRcP9uaoRKd+2+orv/Cm2X8Qo16PJSi6vNvt3iCyWUSBQM+WEOypL+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS7wWAybHd5QqDMWECQiRcc9wttMIwRjsC2
 0eAmpXiAjkHmKecSW+ZsKyVqzyyESEPKCkJYipsZQkY59jupqkjgxSJScxseIa8iNHvQ2mom
 xiFqSE/g/MYistj/6ex8E3DgjmsjoPUVQNz7QLSNkq76Qd+aJ+gdpaf41HR5vZdL66UVlCE+
 nMDnqC26+QDDoqEkiCXd/kcB7Gi5/uDMzr0jEZmGt8q8DHF02W4YYla7TV6JUFoGsUJYznkZ
 AnUoww52XNIFCL0N+ktOdv3Upl0i/i7fTj4ahzKRv5WZsBgKy6rxi5NZW7Pj1/hq1cGj4hqb
 P93bv2QJXodDK1myh+/SOEczaIny0gC+I/DeXzo50/5iOTDPRZ5XZ9AaQLTNb5hsMtotS2Iq
 443Ciec9/lIvAQSiAHz+JVbE10FJGNT6Xve+50OLb7rzuaL9Qgc5x7tLVEJJ90Nc0d9zL6gE
 pSBtqlwkguXaZrvc1TiV5ybQOmzNauTVFpiVcDWAX6m2mI4faGk57oFep08cNEPrbI/lK8uE
 adVI5rbU5yjrwgrHRxHPPERS6Q4JXyWaf+mZXL5MFDTgbY9L+A2xjMUVlS2r3RfZsZGncA/v
 6ehxmvmrWkrHGxf4DLtQKv3lTuZ5CFF8MorBhegCoQNJC3ErdY7QwSs3q5fC5xdcn3rm2rFv
 zt69D9F/4EhVadvromQ7U1Fxq/0e9ZD8r1yRDiEve3oZHiDrgJOA+ZoCY61QNwUb0utkI2Kb
 uRJ1fDsdvoBmVdBqY1nFLh3i6k54rPSS3Vyk2yIxV3HMAamDK1OOH6D0ZUdv6FB3OYB6wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0XegiJqM7YoYpgux
 v0suZBK5lXn2AYqKNuPkgtd63+Ici4bS6wiu5xDWN3rhwMnx0tse5vZDiOqspiDZ88VahshI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEw4OXiOU20Rtd9SUMYj5UlhgXgfhuP
 mVLNlFuIfnc9Tlfm8UeDXunHBtMBUPF9xWpmUcJjmDQU2KhSnfJcD8mIe+I8U0UrzBcczxc8
 O3KwWrpS2+3LsT43y90Uk95sf3zC9d281SaysygGs2EGbg8YCbk3fDyNTZZ9UO/DJNjnlDDq
 Mlr4P10OP/yOiMnqqEmD5WXiOYLQxeeKW0eGfxs8cvlx40HlO1eDdRWF32MRw==
IronPort-HdrOrdr: A9a23:HWtfq6j7Fbx0JNfeiwxYzlmVUXBQXz513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="62245909"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncl5OEZmKrJKrJVS9zkOihr5Y3BodJrIBlq21BJ4z5nS+J6x+fq0QB7Db66yJ13Y/onYIbUmK4Q3oTolyN6aixKw4MnrhkgagDcNEz8f+wO7klsNfq4gOJQczOEY/elcBAEJSbJT5FlCux9IYHr+6FnHIF4hLp86z+7HehsVsabysuU/qPwrcIrUsXSEetO3Z1lqyBqZ5z6l7srWb1NrWxQtihjVRHTCXP4LFr1JmAN4+H+eDG3aRAUU1daWvw9ROeoKRhYWX5tjuFv1DKDi3FowwJOGhC7/6jIujZxM8+mq5JMFh0CSf3Lq0bVjo/GKzLN9GDN4iA1StzwfQOHAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+0TNkJOwTARJYSgBPRrPJTm2zaozFgdnEd37LZcyqQ=;
 b=lB01GtiOnhFI6K956rNTQbBeM1Z+hDaA5ULDHjitaByhnI8+bMv/YcPuq1vtEuxEAv7sy0AuADGIAmhDXT0HjdFnI2ld5e/csS99WucfZeJgEGMRkOmuew6opajO0QDKvyd6MLmeuRoMD6vyAmqP0lh3M16xLqfwOgmy8+8P5lA3dQQadSjkbHXgwMAXuMvEs2KLDe+QAPYkuEUMtusBO/2eM0QDTmTkGk3WDqs8AehMZzHM9LHIjm1kKYb222mn7H5hZtzKaLdsZm/rBnIfSJ13zEUeNYIxekMYjVTQJ5If/XovkUSfLQRqbp5eKPEA8+P5NOhszPCH70tgJAlC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+0TNkJOwTARJYSgBPRrPJTm2zaozFgdnEd37LZcyqQ=;
 b=R018LOnwnhwwDF+H5cfPuM7X0rYnqgEgbNX5+mM2Hv3qUL8jPnl2JXgBFLuzs8Q7o/pq/HpOy9zufLCw6JSrrmQp+rIgehPiHf2EmFTiS6qYMU38E8aiOQpnJ/hlZMKG31lFDBhbl7Og4OVIRJzLRaM4lNGMs+0PzQL74q0OM9U=
Date: Wed, 12 Jan 2022 16:42:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Message-ID: <Yd73Aq4w2H1Eo01h@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
X-ClientProxiedBy: MR1P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e6b91c2-17f1-474f-a704-08d9d5e239d3
X-MS-TrafficTypeDiagnostic: BY5PR03MB4983:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB4983A48A70CD5C2E5534AFD18F529@BY5PR03MB4983.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1FZpDszGzuQ2JvkNfwrnQ+AoYr0sKwfYrehsTexewUqs41uPSm38KZGh7Fi5DvYok89Fm3a4UuIfcTAayydxT0BTbCXErEkMdxl7kt9NG2w36ThMpB3g3BvJAzK//VhCcXS3COhq4cIq9b6f88eWAN4+ekZOt6gSE1xL3qxuZVNRplgg+RE6HY3trx+u3orS65Sm+8MBgrktkkLt4v13EpVCyDnBpyhS7CRmV2JchBriuTDf5oFQP5KIysYaFSrWcaP10FuatlYthYT39PQeAqxEy8T0ErvGSGdrlasRcniF+yL6+Do1W5MxH+cfIlSn/UqVPatjTzywUXQmmGjb2xtjJjt9fYQSSAwdYL+fuX1gvNMTOedI4HSsfF4rn1y03VG4gfE+TEwGah26bdXx8tsALxYYNUM/G8EYk7pFjZb2DlRhoVHfmfvR6tOQ+//IK/DViqZBLyPk5PXUeSTLjo8B+uhS+tcgIEL+aQgocDmc0+7B/W8JC16uU9m6KoL8j4OL/Ixjh2GkrwZaG0IkblGF69zVTUUDWNvJL7uZNsVR99pe47oL7jL9L6vZYWM6Ler4xbaqGHRwBVzj9fEXZnASknGHt1e8SwH+/OQ+C9+R2mnpFqJ0G7F4Fshlr3MHTajw+TxXDhmBPt3JszwPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(9686003)(66476007)(4326008)(66556008)(26005)(33716001)(6512007)(316002)(66946007)(86362001)(5660300002)(85182001)(186003)(7416002)(38100700002)(53546011)(508600001)(6666004)(8676002)(83380400001)(6916009)(82960400001)(54906003)(6486002)(2906002)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0swK0hoN3BBN3dLVFBCZGJUSE9RaGE2bkFkZjRyLzF0K0pWRVRrR1dsdDRT?=
 =?utf-8?B?V3I1S0I2azdWa1YyU1FxbVdidDRqMzZlNncybjFqbnpWaGkzQ1FPcVZEcWhz?=
 =?utf-8?B?d3h0RWpOUjBVVlFkdmh6RlpFODFHQngrUEd5Z0tMT0V2amY0cFVYNUQyU2ho?=
 =?utf-8?B?UUVCa2phU25XRjdWK2NTNk1oWE5JcUVTa0hQM0ZjazNHYUhET1RHRVNpYWw2?=
 =?utf-8?B?d29GOHlYMlQ0eFBPQmRTZFlvRDczdkdDb1ljVW83dHh3U0I3eUdwQWY1UUJq?=
 =?utf-8?B?NzRWeFZ6ejEyTEtMLzZ5dlUrOEs1bVd6Wi9GTXdIZXdoenJVYXJRSi9TQ25M?=
 =?utf-8?B?NFkwWHNTS0VEWFJDNnlyKzlqZU9XeGVJVGxvQ0hRWlpoOGRTZkREaHZ6ZUpx?=
 =?utf-8?B?L0xMVXROekE3VFl3emsrWEpXV3VmNlkwZnUxbEhEenpuYUR2K2xBaGhSMjN5?=
 =?utf-8?B?VGlpYWFyMmFTQjNwcXJaUEtWR0dKaVNVS3gxcUNrTTRQYnFMb21vUUF3T2dh?=
 =?utf-8?B?aXpmR0l3QmdMYUJhdWt3bW0wZVM2NGVpdGNraVZYRWtTSzVlb2xDc3FYeWkx?=
 =?utf-8?B?djNNcmx4LzN4RTcxYTQ3eXVUYkpCMmJCamg3eFBucnVkTTQ1amd5TDg1ZEhl?=
 =?utf-8?B?L21vTk1RWjJ6Rm5pdjFnemtCTks2SlVRekJyRVQvZS96RlIvSyswTWtGcnpE?=
 =?utf-8?B?R2N3blFCVUhkZUd3dUxLL2p4VjM1MFEyZHphaVJEN2xzbTBsd3ZMYmpTckth?=
 =?utf-8?B?NitwdFJPeThMNGpYVnJud1JaRVV2WkhQNlpXQitvR0pEUnlsUG9zVUNBQU5E?=
 =?utf-8?B?Qko4SDVoVXVIV21rRCtsMmV0Nk5OSVR3bkhwSDNpU29wZ1FGSERvdUNDTEUr?=
 =?utf-8?B?RkNiMUEra1ROUndRQkhRYzhUMGJoeHJ1UStVWHdDTmtZRThMQi8zbmxQR2JQ?=
 =?utf-8?B?Z0JlLzNVSWRmNUJOdTVYRXo4Z2dRTjVtV1RycjhmYnIyQllaSW1yMHczMzZh?=
 =?utf-8?B?TU5QdnZicC8yRjlFZ2EraUZwMG85MnJzM3ppUXhVd052Tmk3R2s4anJCWmFq?=
 =?utf-8?B?YVE3ejdSVXBlTHRoZlpJdGRIN1c2bnU1TE5yMmI0L2hZUDZJUzladHNoT056?=
 =?utf-8?B?YnRNSExrc2pjSVdpeXBnOVNRTlc0dEV3dDNqZjhvc25KYVhaalpRYk5aSmMz?=
 =?utf-8?B?S1RVQ0VwUExKNGJJazh2MTc2UHpmODVxT0ErbmlXMXA4YkM0OENoSndTYUsr?=
 =?utf-8?B?U1M2c1YxODhTbVNsS3Q3QXoyenF6VU51QUhvcmFHNnk2ejZ5bXJIUmJubWMx?=
 =?utf-8?B?Q0NHQTZsQzQvZjZlUS93TVcwR3FzTkhvM1JxYWpFSnlKWWlFTEtaV0VQa1ZU?=
 =?utf-8?B?VW9La2JzbGFBRGFHKzZGMk51dUpibm5LSEhobUVMc2FPSDFxWUU4NjJPbjNN?=
 =?utf-8?B?bnZabTZuK0k3RTNqYkNIcnUxaW8yRytSL054Z2UyTTI3WnpNZUJuTmtUNTE1?=
 =?utf-8?B?dTNLZWdBSlJZY0ZyYkhsRGlIMENzYml5bkNNVzAwSmJWNE1zMGVTelp1T0dy?=
 =?utf-8?B?MGlHZi9YQlptaVNEUC9IZzl1d2JjUnlDODNlekVydTluc3BjWlc4dkZRaW1z?=
 =?utf-8?B?V2cvMDF3QURHRnhIUUo3ekFqMzRKaE82TWNZdkUrenVYSGtUWlFlWDdiRjlR?=
 =?utf-8?B?MXdTT09CT0J1OUxuNWdCMUcxZkEwK2FpUVN5MDJCSlFORkswQk51Tnkrb1dB?=
 =?utf-8?B?RVlwL3BheFNVNDNzQ1lHc1BYVVNIRWJFQzdWeG5aME5XazVjN3M4N0J1NUpX?=
 =?utf-8?B?OTB1YjhSNE9Ta05VL2xtcUpNSGxNYTJQaFVEeGtjRXlIOUkwTE8wNjdoTXNJ?=
 =?utf-8?B?dG5HVmRuZlI4NEtZbklzZXJYSlk1ZHdlRnJNbHp5MU5odjBIaTFKU09qZVJj?=
 =?utf-8?B?NXFFK2wxcTFTRTRvbEpPRWh4Y1phOTdvekp0cGdQcTR2VU05Vk8vbWNsaWJK?=
 =?utf-8?B?RGttNjdSYlZtQTVHeWtlZkxDaHRxQmtFbXBPWk5KelFlNDBCdjc3VEE2VlVD?=
 =?utf-8?B?QVArWkhpTnN5NFJEUXFFUWJPTFYyNVhhTER2cGorU3pyem0vdnphTWhxc0du?=
 =?utf-8?B?L0FHRzZDOGhrUkh4VjJhanJXOHNvZ1Z2MEtLOTI0dUdWQXZJWkZZMUNYQVAx?=
 =?utf-8?Q?QogXLvKifiwXsvKn216j394=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6b91c2-17f1-474f-a704-08d9d5e239d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:43:06.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ai8i5/Dxf4aHvtIeqI12kSmKQBIvGLQOvIngWDDWsOE+Y+i7y6aw2mMn94yQcuIVnBuqyNSY5gO36wrs+6wIQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4983
X-OriginatorOrg: citrix.com

On Wed, Jan 12, 2022 at 03:57:36PM +0100, Jan Beulich wrote:
> On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> > @@ -379,7 +396,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >  
> >          data = merge_result(data, tmp_data, size - data_offset, data_offset);
> >      }
> > -    spin_unlock(&pdev->vpci->lock);
> >  
> >      return data & (0xffffffff >> (32 - 8 * size));
> >  }
> 
> Here and ...
> 
> > @@ -475,13 +498,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >              break;
> >          ASSERT(data_offset < size);
> >      }
> > +    spin_unlock(&pdev->vpci_lock);
> >  
> >      if ( data_offset < size )
> >          /* Tailing gap, write the remaining. */
> >          vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
> >                        data >> (data_offset * 8));
> > -
> > -    spin_unlock(&pdev->vpci->lock);
> >  }
> 
> ... even more so here I'm not sure of the correctness of the moving
> you do: While pdev->vpci indeed doesn't get accessed, I wonder
> whether there wasn't an intention to avoid racing calls to
> vpci_{read,write}_hw() this way. In any event I think such movement
> would need justification in the description.

I agree about the need for justification in the commit message, or
even better this being split into a pre-patch, as it's not related to
the lock switching done here.

I do think this is fine however, as racing calls to
vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
around pci_conf_{read,write} functions, and the required locking (in
case of using the IO ports) is already taken care in
pci_conf_{read,write}.

Thanks, Roger.

