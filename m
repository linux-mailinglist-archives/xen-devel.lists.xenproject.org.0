Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D789B48B2B8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 17:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255966.438978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7KT8-0007sd-KU; Tue, 11 Jan 2022 16:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255966.438978; Tue, 11 Jan 2022 16:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7KT8-0007qm-H1; Tue, 11 Jan 2022 16:57:58 +0000
Received: by outflank-mailman (input) for mailman id 255966;
 Tue, 11 Jan 2022 16:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7KT7-0007qg-16
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 16:57:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9da83533-72ff-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 17:57:55 +0100 (CET)
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
X-Inumbo-ID: 9da83533-72ff-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641920274;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LXtlm7iopRUpk2lb9/oCptar2Utch3GqkBAbzEVpJEg=;
  b=KOfpgvxAywKzlKEPzds6vqRLUYPSti0okYKe1/bXGjl+qvXjHkMLyBwS
   4x8OuGtqYL7/HWScyYBl2VefKNCKvBf+h3IK4YEQ1zMLO35zQ5oHD8CLY
   PU3Z1VnylGEL9i3/plnsA3QlH2lUMwDLnso+ZDexNIKEeHMCxqcz09O1G
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IsQXVCvbLUrEP7uKf9V1Og73dXmpZsFF36fRi23QkNhSQjgG0eELwYMCaXhVkFcBI//AsS7tg0
 tYHMPHryCwwkVHYPisFbu/zcuwg/218SeLqC3UJZsjO8rdSaeRDuf37Itf2yDUyMEpDLJ+umC8
 CN21ZOdSPMsF4ePrXMd0kxHoKy3ftEb9euqqUcyvJx0e4HN9vrw5pBKcYm5rfZmXHmozzZgGDQ
 yHvZXuD3ovBwDLcErF5+wu+nAgrwwK6qSXVwPpLxNVZQqar4gwiuQ3NdCfslWnnIdZJ7FNd3Kq
 YCJgf7rRWpYP809XoHVepd5l
X-SBRS: 5.2
X-MesageID: 61757142
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K7oMq6kr5ElBpDJF8yGpkCro5gxBIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCj3SPPrbN2P8Lot2at/l9EsC75bVxt41TVRoqio1QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MRt6bOwVz0qBaPNoNwNXBJeOg5XGYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glp2Z0RRKqED
 yYfQQFtNBr9XUBRBm84Gs4GmO34rDr9WDIN/Tp5ooJoujOOnWSdyoPFKNPIfvSaSMMTmVyXz
 krE9WnkBhARNPSE1CGItHmrg4fntDnnVYclMay3//9nnnWe3mUWThYRUDOTpv20iVW3Xd5FH
 EUS9jAztqg59EGtTd7VUgWxpTiPuRt0c8BZE/A+rhqMzKXUyw+DAy4PSTspQNYrrtMsTDomk
 FqAhcr0BCdHuaeQD3ma89+8ry62OCUTBX8PY2kDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj3qO35wqf22qEqZ3ATwpz7QLSNkq76Qd+aJ+gdpaf41HR5vZdL66UVlCE+
 nMDnqC26+QDDoqEkiCXd/kcB7Gi5/uDMzr0jEZmGt8q8DHF02W4YYla7TV6JUFoGsUJYznkZ
 AnUoww52XNIFCL0N+ktOdv3Upl0i/i7fTj4ahzKRstuPrdxajWExy9vXXaA0GvruWcFtYhqb
 P93bv2QJXodDK1myh+/SOEczaIny0gC+I/DeXzo50/5iOTDPRZ5XZ9AaQLTNb5hsMtotS2Iq
 443Ciec9/lIvAQSiAHz+JVbE10FJGNT6Xve+50OLb7rzuaL9Qgc5x7tLVEJJtQNc0d9zL6gE
 pSBtqlwkgGXaZrvc1TiV5ybQOmzNauTVFpiVcDWAX6m2mI4faGk57oFep08cNEPrbI/lK4oF
 6BUI57dWpyjrwgrHRxHNvERS6Q4JXyWaf+mZXL5MFDTgbY9L+A2xjMUVlS2r3RfZsZGncA/v
 6ehxmvmrWkrHGxf4DLtQKv3lTuZ5CFF8MorBhegCoQNJC3ErdY7QwSs3q5fC5xdcn3rm2rFv
 zt69D9F/4EhVadvromQ7U1Fxq/0e9ZD8r1yRDiEve3oZHiDrgJOA+ZoCY61QNwUb0utkI2Kb
 uRJ1fDsdvoBmVdBqY1nFLh3i6k54rPSS3Vyl2yIxV3HMAamDK1OOH6D0ZUdv6FB3OYB6wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0XegiJqM7YoYpgux
 v0suZBK5lXn2AYqKNuPkgtd63+Ici4bS6wiu5xDWN3rhwMnx0tse5vZDiOqspiDZ88VahshI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEw4OXiOU20Rtd9SUMYj5UlhgXgfhuP
 mVLNlFuIfnc9Tlfm8UeDXunHBtMBUPF9xWpmUcJjmDQU2KhSnfJcD8mIe+I8U0UrzBcczxc8
 O3KwWrpS2+3LsT43y90Uk95sf3zC9d281SaysygGs2EGbg8YCbk3fDyNTZZ9UO/DJNjnlDDq
 Mlr4P10OP/yOiMnqqEmD5WXiOYLQxeeKW0eGfxs8cvlx40HlO1eDdRWF32MRw==
IronPort-HdrOrdr: A9a23:GttHSqi1v2CeTAsR0aI0Uw9aUXBQX0J13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5kUUtKPpZ0fSKGMB28ffvyChPhHb3GLtBPB5ufke++3F0KjNvaDaDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="61757142"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxNqenZNCMBN+nt3JMrIdHPPxoPumgCMtQ6yXy4PlJRn3M2eUY0BKgZY2bUoroIz0sqwJfuOcVaXkfogtmpGkH8gthiXQsl7vVYh9Fb/1ag/Uj5+EWjIOjnhdDzdSLAcXsGPa0qboIL75T37Ul1xfMFIXJH8aGsK7WFnQyLr0amN67+6Vv6CrbYTvc9gG7NXJxhDvnaqztPLwgNAFWLvSrmvfqA3am+06muQDyrakGFHeajhqoyIksmVqrU7DxZiKSvbl2fd01hl1+VNvLUsRfHi20S1jvgTAcNGgkXfYYtuTONbrM7oGKsNZ51ap9Is3cMWjgx4+fNSM+01fY2aPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=324mOVSynRIU/5IOmFMq24ZHee6A6mxL09dWv8Q9P7s=;
 b=j/yCyJ5+f03dzjKv9NJsGtO+tezZS2ECS5bAzRiSy871FtZPAk0xY1YC4msXKU0/6FfT1aSX1F4X34n9FdyhRmMMoF1lOFyQmaboc6NKcW6X5HWlAdtIU2cuGFIcI2Kxo2KFmZyx1GfJL0TCuPBmmDD287Ee3psGT1y2h0LGewaTMiW5OLawRgBKRsQHpuyR4SXOX8wPFZrJ3H9UEW2zmEggq9shnc5kFfkwBgqDfGDxKVO/8bgZy2lHPS18ooaYrKUPuQiPcuCTxwEfTx7/mr5UBac0qDn7uave65Wkp0eimseF+opHBpFgVEytzviILX/c/n0wylwcegNZd5OAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=324mOVSynRIU/5IOmFMq24ZHee6A6mxL09dWv8Q9P7s=;
 b=GMZB4omnSMGg58RvpMVSo69uNb3OftFYYfAypFiWS7Qk2w8MmIJipr65su3/iQG4F8KGYwp0feWvLeEZEn11/XJ5El5y+Fdis3nJvhIIAJXul6Jl3smvw+MzM138VmQEWG2V1Ks0GecTdUbv8v0Ss9i/kqhXIrs8dymYM8uN8Uc=
Date: Tue, 11 Jan 2022 17:57:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Message-ID: <Yd23B3KkQBpTAK1v@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-5-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211125110251.2877218-5-andr2000@gmail.com>
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3793555e-64b0-4822-db12-08d9d5237f82
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4603D38EFD8DC1237D29D9AE8F519@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejo+tqgk2xeK2CBCFqShFUbX4k1y+72U9Qt+PBvchehGZ0fpfPnc9iK8KZTmT3TTNyR/MGMBvdoZ3Fx7ghpxRDqAjisgdmXyKeqMJ+6J4+ESUPOzJnDuO/01JLebJyG7y2GPqM76NUP8poM5MCNdmLdcpG5efQEsp00QSvptyNw0Ijbo5EzDgKhqqZ2I6gWxIZ9G8fiLE7VsQPE/ieTa0syprdmve9ZO+JL6etBiQ6j48p342y/qN5Ki5qmYa00aR7zqStfmJP+4ZVu0XjULnKV5H43b5RyFqSpr8YmBZrGbC7A40uj5j/xtykcFR5TZzIaL6Oap3bCcQCMVtvuk637CKBqNmYLSO26ncB2nSa6jbGl3j8CGhyXnEMmOn+tYZ9wDFjPrPN3zx+OPil4EaLzE8xUxg8yL26669AFqSdv6KtukIScbj78EDMMumjkxIhuevqmbeMEaMcAxSnjnUtx1vxI0aA9FOcLcKFz+0wwBoAt3rlUweQsE3GEuIvUbEjxpy8/8fle7KInT6EOr/mbLWAupNh6G8c9dUWLa57GYlbbpkLRBMnCFoksvDCDBd6A4aY0YCQqOBbPIX4kICnDF++qjt1NqVYiad8EINjKkXb+l97GtNYQVFiB5MsmJr0lWNfOkkEFS7BkmK5tE+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(5660300002)(8676002)(66946007)(82960400001)(8936002)(4326008)(83380400001)(38100700002)(33716001)(6916009)(7416002)(9686003)(6486002)(6666004)(6506007)(85182001)(316002)(66476007)(66556008)(186003)(26005)(2906002)(86362001)(6512007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmxHMzNHNURaNlZLaWIyRjU5Z2N3cXlVeTVyWkRzbGdib3pwa2VwZWFRcUsv?=
 =?utf-8?B?RUNCZFZmQ0g1OExYU2p3ZUdTV29pQjFuY1JPYnNjTStwY1B6aEprSXd5cWdS?=
 =?utf-8?B?WUJTbGszbEhxaDdvVTRhTzlPdXZXbFQyYlZTU2QxZEdGcWZUU0EyenZIZ3ZZ?=
 =?utf-8?B?cW5UclY2VWVOK09zdWJRZ3NOdTdheXRBKzZrODJGY0NzVDNuT3dJNGxVc0tt?=
 =?utf-8?B?U0FvY2RqMjM2UmZ3azBmRVk2TWZlM0k3MkdpK1Y2N21EcnpKRy9ZQ3lDeHYv?=
 =?utf-8?B?ZW5vMXplV3hXOXk2YTRGbmUxakhqWkZMUlhkQ2xxNHQ3clFjb3RQeHZUSXgx?=
 =?utf-8?B?RGFXZkRxckx3NURWT3JuK3g2dWpHSi90UEpMRGRKNE9wSEtRM082TFBtaVdD?=
 =?utf-8?B?dnJEZjBLaEFWVlIxYkc4eWdYZ1J2cjZCc2YzOVprVnlFRzVaQ0NlZWlaWTdK?=
 =?utf-8?B?Vis5WmJoY0FLSXYraEExeXczbGtSWGM3Sk5yMC9SY0hHV2tuOWM0TkpyMGtF?=
 =?utf-8?B?YkdLb1dLQzM3VVlnc3hQZzVuUCt3ODVmTDhZQ2JNR2NNcDB5azdxR0ZjOWxt?=
 =?utf-8?B?RW5Gc0twSmdneXBnL2VMblBxc2RJeTBEUjZVNzdiQzlhalg3eWtNenZtd1hI?=
 =?utf-8?B?eHZVdTFNbE1MZG5jR3g1OXdBZmFlNkNMMVhydlVObERjUUZLdno3aCsxWU5M?=
 =?utf-8?B?MnJ2aG8rdE1seVhxNW4waDNRRHYxZUxBSUdpcFZPMVJLSXd0ek56QkpiUVR4?=
 =?utf-8?B?TUM3cDBPS0xiaDk1SS9HQVlzWGZUYTJFVllnYk84UXNDbzZDZTk1VnpRVGJP?=
 =?utf-8?B?ZGk2NytlTTVocGVvcHdKVVVIb0FmNVppc1E4eUpqLzJrcmx3dDh0cXRJUXNT?=
 =?utf-8?B?b1R1a3lYQjZIdzZ0WHpoU3hRVWdnRVBoRVpsZlJMQmFLZDIrY1NDVVo4WFRp?=
 =?utf-8?B?V0JlQzRDN0swQkl2OFc1VHJ4ckdublRLbmY4MUVzS2U4bWw4dzFUMi9KeElT?=
 =?utf-8?B?b3lNaC9tYmZra0E1VkI0T3hydm9DdjNLUXJZb08xbDB3V0pRNi9MenZMelg0?=
 =?utf-8?B?RHk1OVNFWmkzSkU3RmEyVmlhVDd3LzhSdVFHTVlrd2RNVWdHbUlXcjVVd3h2?=
 =?utf-8?B?L3JaV3VYeFkvZk1JbzlvR1RnWXpsOWRXVDRBTnhuOTdFaDBPdm5mK1ZJK3Vz?=
 =?utf-8?B?RThlR3lLWHJ3WThqS3c3ZDhIK1R6Q0loTVExaXBES1hGOERvekxvZGRuZ1dD?=
 =?utf-8?B?b1BBZEVOVFUydEkrMFFybGZ0OE93OTNOVVNiV1ZFYnBlQ3hJOGFpd3VpRFZH?=
 =?utf-8?B?QS9WSWVnSkQ2ekxHZWdxUWFuNmQwTXdGN2VJUHBYeDNqOGZXcVFwZW5QMHU0?=
 =?utf-8?B?U2YybS9tUWpaZkx1aS93aldweTVRbTZGbmU1VHdxczRWUHBlYkVseHFNdkVz?=
 =?utf-8?B?eGxLdHZucmp4M2FPTG9sdkZ5SWNEaFpZWXJCbGJrUGh6bmxDZjREdm9OaWhW?=
 =?utf-8?B?WEZ0Y2NYbk1jNmtyMDhCc2FtSlhSWlIvWnRQYmlyakVraG9Bd2c1RXRUV0dz?=
 =?utf-8?B?RnY1TzZhbTBVQVZ4WHAxTDlnb2hCV3ErbGVSZC9MZGwwYXd1cmJxczZEWklF?=
 =?utf-8?B?L0YyV21TVjU4MktUZHRCTnVnWThnZllzZU1lVElNcFBwd1lqRmtJWU5NM3Jj?=
 =?utf-8?B?NEt3RzJreVk4cnVnWFJtM1ZDT0RjY1VqRGZVUGJ0UGxSV0M0aWExT010SUJK?=
 =?utf-8?B?cWl4NU1Yc0ZObmFSaHlOMVMrRmg4eU5KeU8rN0RaNjQrd1l6YUtFbWRtSUtJ?=
 =?utf-8?B?ZGlaL1ZuYVl0cU9wZkk1T3BvaWcycERVNXptTWxKV1ozZjVISmZ1QndPZ1kw?=
 =?utf-8?B?WXlCeFRNbDNXanQvM2JQQjEzcTBvRDdnLzY4T3U2Y005Z1EvMmhobEpNcmZG?=
 =?utf-8?B?QlE2QnhwSjZJTCtDV1pUbXRBbWJtREhLd2lVS2QyTGp6aVVldmZTU1ZLdU1N?=
 =?utf-8?B?SnNIZUJ1RUt5R2ZRRXNwZHV1QlY1S0JkMGY4dndkazR6dzd1TUZMaG51Rk5C?=
 =?utf-8?B?bFhIZVk1MjBnSlIzMlZJU0pmcjVKWm5HdlY3ZUFuZFgxUkFHSTBVZVBIMHIy?=
 =?utf-8?B?emZncG1Vc1ZKbDRXa1MweVB3YjdQK0xKRFAwSFFVQmFnblgwSlVHWk9EMkNu?=
 =?utf-8?Q?TvbOnXAaGvHfNEHDnjRKmcM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3793555e-64b0-4822-db12-08d9d5237f82
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 16:57:49.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDvB7OiloN8VUUtq+fFKqBDJJMVzwP82IK6evIJ7ZP5M1pN2cc7T3T2hcTU9O4DhNcVt7XCuPgE7OiFfeRZenQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:41PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a vPCI is removed for a PCI device it is possible that we have
> scheduled a delayed work for map/unmap operations for that device.
> For example, the following scenario can illustrate the problem:
> 
> pci_physdev_op
>    pci_add_device
>        init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>    iommu_add_device <- FAILS
>    vpci_remove_device -> xfree(pdev->vpci)
> 
> leave_hypervisor_to_guest
>    vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> 
> For the hardware domain we continue execution as the worse that
> could happen is that MMIO mappings are left in place when the
> device has been deassigned.
> 
> For unprivileged domains that get a failure in the middle of a vPCI
> {un}map operation we need to destroy them, as we don't know in which
> state the p2m is. This can only happen in vpci_process_pending for
> DomUs as they won't be allowed to call pci_add_device.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Since v4:
>  - crash guest domain if map/unmap operation didn't succeed
>  - re-work vpci cancel work to cancel work on all vCPUs
>  - use new locking scheme with pdev->vpci_lock
> New in v4
> 
> Fixes: 86dbcf6e30cb ("vpci: cancel pending map/unmap on vpci removal")
> 
> ---
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 49 ++++++++++++++++++++++++++++++---------
>  xen/drivers/vpci/vpci.c   |  2 ++
>  xen/include/xen/pci.h     |  5 ++++
>  xen/include/xen/vpci.h    |  6 +++++
>  4 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index bd23c0274d48..ba333fb2f9b0 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -131,7 +131,13 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    if ( v->vpci.mem )
> +    struct pci_dev *pdev = v->vpci.pdev;
> +
> +    if ( !pdev )
> +        return false;
> +
> +    spin_lock(&pdev->vpci_lock);
> +    if ( !pdev->vpci_cancel_pending && v->vpci.mem )

Could you just check for pdev->vpci != NULL instead of having to add a
new vpci_cancel_pending field?

I also have a suggestion below which could make the code here simpler.

>      {
>          struct map_data data = {
>              .d = v->domain,
> @@ -140,32 +146,53 @@ bool vpci_process_pending(struct vcpu *v)
>          int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
> +        {
> +            spin_unlock(&pdev->vpci_lock);
>              return true;
> +        }
>  
> -        spin_lock(&v->vpci.pdev->vpci_lock);
> -        if ( v->vpci.pdev->vpci )
> +        if ( pdev->vpci )
>              /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(v->vpci.pdev,
> +            modify_decoding(pdev,
>                              rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
>                              !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci_lock);
>  
> -        rangeset_destroy(v->vpci.mem);
> -        v->vpci.mem = NULL;
>          if ( rc )
> +        {
>              /*
>               * FIXME: in case of failure remove the device from the domain.
>               * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> +             * safe for Dom0, for DomUs the domain needs to be killed in order
> +             * to avoid leaking stale p2m mappings on failure.
>               */
> -            vpci_remove_device(v->vpci.pdev);
> +            if ( is_hardware_domain(v->domain) )
> +                vpci_remove_device_locked(pdev);
> +            else
> +                domain_crash(v->domain);
> +        }
>      }
> +    spin_unlock(&pdev->vpci_lock);
>  
>      return false;
>  }
>  
> +void vpci_cancel_pending_locked(struct pci_dev *pdev)
> +{
> +    struct vcpu *v;
> +
> +    ASSERT(spin_is_locked(&pdev->vpci_lock));
> +
> +    /* Cancel any pending work now on all vCPUs. */
> +    for_each_vcpu( pdev->domain, v )
> +    {
> +        if ( v->vpci.mem && (v->vpci.pdev == pdev) )

I'm unsure this is correct. You are protecting the access to
v->vpci.pdev with an expectation that v->vpci.pdev->vpci_lock is being
held.

I wonder if it would be better to just pause all the domain vCPUs and
then perform the cleaning of any pending operations. That would assure
that there are no changes to v->vpci. vpci_cancel_pending_locked
shouldn't be a frequent operation, so the overhead of pausing all
domain vCPUs here is likely fine.

Thanks, Roger.

