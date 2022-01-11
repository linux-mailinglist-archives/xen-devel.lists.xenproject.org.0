Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C731248B0A6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255895.438864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Itv-000126-Qu; Tue, 11 Jan 2022 15:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255895.438864; Tue, 11 Jan 2022 15:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Itv-0000zj-LN; Tue, 11 Jan 2022 15:17:31 +0000
Received: by outflank-mailman (input) for mailman id 255895;
 Tue, 11 Jan 2022 15:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7Itu-0000zO-6D
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:17:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9531ad7e-72f1-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 16:17:28 +0100 (CET)
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
X-Inumbo-ID: 9531ad7e-72f1-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641914248;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bWqGpkZCxkmu/YZ2Hp2KCBox9T7QgCxruMpQXOC1OOU=;
  b=ga+JWzAE4QwpoBdasCeDcS2qHphGAGtzyfKHsOlZogU0lDcDgRo3nqT6
   WP6CA/2Qs7rsvADfEqDCCaHLTLKwetI2ZFz8JL08QsNDtpEi7cKkx9Hxx
   nA5zCozKYKPvGHTzCqovzeELlpHJhxU4Tejc4HGFG8KDWVM9Gw2cGnfGg
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JkbdpoiGavRVpS/5qk59h5h4xXYdsM7+A/BY6qc8UGP/3AEBcGdJ2qiPqJ9vCZkfw3K5rh8Jbf
 yygZCDWqaVhnH5/fdiZgfEfIoVqBRTnyTtksTejU8BwWwm/2nCTK4oAgHbVFSAB2uPsJUaHyba
 dzjk0iF59fDnMUxIFDYEYJG8vhYYCkCikhKsu6Gx3tUGilGE9+JndBDTOXIedzuocmJKpLAcAJ
 8ckczquDIYDylcu0l56aLTw0itn+b7fPSFTIuN5oAjGQrlOAzw+RqEuMI/tx92mTZES80W9oSE
 0DJobKFvEXiDZsDgjZj2/Zz9
X-SBRS: 5.2
X-MesageID: 61748328
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nDI5hKk/6qCv8orHTTaIwGvo5gxBIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKD2/Qaa7eZzH8Ldsna4y/8xhXv5Ddy4dgTQI/pXswRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IRxsLW6dTcsBbDBnfU+Dx9SHXF+B6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glp2ZweRqyOD
 yYfQTtTVUiROQwVAF1UBIIivePruGDzaTIN/Tp5ooJoujOOnWSdyoPFKNPIfvSaSMMTmVyXz
 krE9WnkBhARNPSE1CGItHmrg4fntDnnVYclMay3//9nnnWe3mUWThYRUDOTpv20iVW3Xd5FH
 EUS9jAztqg59EGtTd7VUgWxpTiPuRt0c8BZE/A+rhqMzKXUyw+DAy4PSTspQNYrrtMsTDomk
 FqAhcr0BCdHuaeQD3ma89+8ry62OCUTBX8PY2kDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj3qO35wqf22qEqZ3ATwpz7QLSNkq76Qd+aJ+gdpaf41HR5vZdL66UVlCE+
 nMDnqC26+QDDoqEkiCXd/kcB7Gi5/uDMzr0jEZmGt8q8DHF02W4YYla7TV6JUFoGsUJYznkZ
 AnUoww52XNIFCL0N+ktOdv3Upl0i/i7fTj4ahzKRotyZ7F7SD+CxzxjYF+zg2bnnhgsq65qb
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
IronPort-HdrOrdr: A9a23:sBCr8KykpL0ovjcJvVuBKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WBxB8bYYOCCggWVxe5ZnOnfKlHbakjDH6tmpN
 pdmstFeaPN5DpB/L/HCWCDer5Kqrn3k5xAx92ut0uFJTsaFJ2IhD0JbDpzfHcGIDWvUvECZe
 ahD4d81nKdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInly6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXsIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6U9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbgidzk7hdcAoqJ/lp
 T525JT5cRzp/8tHNNA7dg6MLiK40z2MGTx2TGpUB3a/J9uAQO+l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="61748328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5K35ZTvy9Bba30cg6PhodR2ERrpdnzXgilw7YkpERPvTjl1EqnBGTlk40YRmnQTrZ5Zbz89PTLH5cBp7kab3J9/cRfaSgZmJ9kusrwJ4JIujvvFOcSWavwMXCuJB/V9Ak6WsH7pyyR6F3rjaj0K3AFqWEGvRrmWTY3i5FOspvxN0ssG5aTk1jYNNXFdeQ2XNeUifi8vnnHmeL8BstgARl5uSAH1f3Uk/NxHhImru93yCr5dX9c/NnPWROUjHNYVXyk+nvTlan4hkz8iNOXkLl5v2VU8jPvG4lCxTG868q+WTjyaVgtUoaefSRXePNK0hf46wabP01tVdbGK0x5kaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcV0lNMIFRVE2hKB1xAYqlr4g5G/7DISIT66BBWMIUA=;
 b=J8MtZrfZgjqU16tCLnS2Cjc3B+ixyPIz/Mve26olwwyYDNk4rhK+Jus6VWsYWBWcdtM/7+Hm8YrP4wm0LwFe+kdPbun0TQxuMXGJSXFT23ID8eNFImKlNL8XAXNi75ib3UoD0xZzJKaLWtMWWaTAbgYztQASfDbjGCM3/IiJyupOQWnz1h9g7PGoMdhS3haLeW78Bes1yfNfpPPm740Q4+3k82dc/JYMA6UGj7CfeQfhDeYcvkq3QZriOQzDGQEGIVxwG5ffOUhbiK9azBuyrdb5OiM1l8Qcnnb2xRqsVjrEYgHA9a/dl2LSIV19EHUzyxNq7zV7xWrTcxg0Fn1SwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcV0lNMIFRVE2hKB1xAYqlr4g5G/7DISIT66BBWMIUA=;
 b=pFR0YtPtXu5NVD58MdSCPHn1jH05hMzyQxNz8X3Yd86pc2BUM9r+8ZZLG4ba+9hcXJ5B08uaY8rn+J0jyIltiV34ffHMhAWAKo/W071zcyOFUta/QIzxP+3WYsVEmA03wjdiOATAqzs3oT5ukDanzuBTLaeL2lfjwhCm+UQtDfY=
Date: Tue, 11 Jan 2022 16:17:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Message-ID: <Yd2ffPULbmNpSmaD@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-4-andr2000@gmail.com>
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddb8549e-08d6-40e7-a7ba-08d9d51576ad
X-MS-TrafficTypeDiagnostic: DS7PR03MB5575:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB55751F97A7C6502D7FDD9C0E8F519@DS7PR03MB5575.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muCVFmS9bWpnre070nPizU6seZ2qEl8VImyJqJpexQFVuFMi4SxyKbATRs+osRyYmfLEkSADdsAj6msGvaiBy0Jf41QO3aHnHUEcfOFvvJPpVs1e/A0SvPxALrc97sd+Kcq7M6owrpaP0T4MZUb2ozck9X81rNcR37a0TVoHA2bMMU/96d4DM0pKTFkid2NEhhlxY4lDpimYMrrCQ4edVsq5wV+VBlJjmSJKTFK73qTqhBqVSrWxUQIxJ3P3Oc6OBVBgBXnfjPJiJZGzzRT96R63InARemPxDMWzmBHyp82Ybf34EFZI6VxxoDZvrRmvLqimENL3hWTAg3vHzcCJXyVAn2ve1zuiA4dmJH/harzp7SAKYYqCBZhY3HpIa4Jqu2y8UnNWJJIFg4GhFL1VHst8vZuU68y/CyaiynSBG0SV1m2twQ9EluqdOgH6tfehiYXoIlv/qv5HVBSTD1uCOZ8QvI67dgzfLbeQzeEWGRnNVWFRxIdqRatntttd69QYC+49AEImFbGWA6QYqMJOOMgYgoNAoPK4fch9EbdG5fIoQ7YyPjkn/gl59KKNM6gZCapg3TOK12yg44rxCnZaqGz4t4xHR+EqxZAIKWoSfxn4JlDDY6PtwhbMi7jdAXzmk1ByG24UJP+vrVdfR5AQjR4iLOHcvKFlzEiZ2aIRnF4Siawn/tRMfwAtHmCuiA9R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(5660300002)(9686003)(508600001)(6916009)(6512007)(66476007)(33716001)(316002)(4326008)(66556008)(6486002)(8676002)(66946007)(8936002)(86362001)(107886003)(6666004)(54906003)(38100700002)(186003)(83380400001)(26005)(6506007)(82960400001)(7416002)(85182001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhhb21NYUcyUVRmZ1dHMGIzV213SitDbjFPSktMUGthSlhydTA5WGdYZWV6?=
 =?utf-8?B?K3FjVUVRUXVGb04wRFp1ajZPZDB5b1Z3S0EwK2s3SnlQUkFKMU0zc2VWTnNn?=
 =?utf-8?B?elNqbnA2V0VhbHFKcXpvc09YMzBtcStSS1d4S1RPWkNKb0o1Ym9IeU5tajJy?=
 =?utf-8?B?dEhsRnJ1Nk1VazkwZjFmN2pVaEFEb3dtUU9HOURSOUVsL3dLaHlXdnFtRHZS?=
 =?utf-8?B?a2VwTXEzbzI2Yy9acExVeUpmeEhKZHdVdmU1UkF1aTg0bnJjQ2dYSW9Sb3cr?=
 =?utf-8?B?TlNOYnJDVThMVm1GWGNNUHJIQVE5dk1pZE1SUUp3Z1pTSkp5M3g5ZHBKbkJ1?=
 =?utf-8?B?cXFTMmk0dTRHVDdBMjBsM1VMYklkUG5ldWx0K3FUS3hobXByNUR3Tkp2c2sy?=
 =?utf-8?B?OW9zQzFhaWcyRk9MWWhvUUpMUEpkeWxpblliakJwNUwxdktJbUNxWnJwSDJ5?=
 =?utf-8?B?NTlwSm5pczBBMXZrOVRicXdjaFoxdWpOaGt3Z3ZQR3dsaWMwdWtKQTNMM2Fn?=
 =?utf-8?B?bVczRVNsWnRvcTY2K3ltYkpZNlBBVUk0WWh6eEN2LzZQeTc0MGkrSEJGNW9N?=
 =?utf-8?B?K0RkdEo1Zjd3YzlYR1U0TmV3TXZBV1pJVzNZWFVXQU9RWFlSQ2ttaWk4VzdP?=
 =?utf-8?B?WVA5SUFqdGRCMm4xakorUVl1ZHJ6aGc3ZnorYnVPSmdIdk9aQ3FpaFNIQmFX?=
 =?utf-8?B?UFdJR0Fsa0pNVnNYZ1Y3Vml2TDk1eml2N0JtdGFCakx5N2ZnT1VpM0gycWJs?=
 =?utf-8?B?bUsrZ1JYU3BsUXllNlVhbzB1YTZjYStCYU1vakoxaXp4SU4vYjVXZ2Y4elNj?=
 =?utf-8?B?aXZtZCtPREZ6cTJEVzV3MFljQUhGY2h0UlgvNWlONURZdlppUDkzMSszM0Ev?=
 =?utf-8?B?dHVKSGl2STNSQ0w5TGoramtTMXJsWGFEMHAySWVNMXh0aWJCWHZnNzVUWHlu?=
 =?utf-8?B?ZVEzTk9CNlBBc2psdzd4K1FhT2JIekIvV1ZybkpxUXpsMHA5dkVYVTFuK2NK?=
 =?utf-8?B?Rlk0QzZtOTczVEkrbTk3bmt0YjlmeHozZnBxcnJqV1NMeCt4ZmJ4NW5abVpO?=
 =?utf-8?B?RDJWcDlra0w4OGhpUFlKZnBXLy9WVUo3Z3orWXJTNlBTb0U3SlhTalVrRUd6?=
 =?utf-8?B?ck41c1lSOUIzUGt5elYvZWZaaWcra2t5dkpjRnZJR0N6a25nYTJGdjRmeWlD?=
 =?utf-8?B?T0kyUkRHOFlSTVMyams2UWxqQUhQWHlzUjNZU1NMNTdEL0t5SExnZ3VJa0lN?=
 =?utf-8?B?S1E2UU84WFlNLzQyZ1BoKzlJNWxUNDM1dllKa0R2eTNWaGo3bldyclp3REVw?=
 =?utf-8?B?YjRlRHhVOTgyeUx1eHo0Vi9MTHR3NXZxckhoWVpqdzhNNHQ5djEwajhWRytY?=
 =?utf-8?B?VEx6MjZLK1N6QUpXMDQ2b1JEWmt6RDYvYmlxb3NaLzVJaTM1ZmM2dU1RSG5w?=
 =?utf-8?B?UVRjTi9Rbkt6SFBia0M5djI4YkJQUExDWTB5U24xZTNDUk1rOWM1Z2VlbVcr?=
 =?utf-8?B?VFFScnYyWEdCUEtId2hOTGJpK3NrMFBwK1RTSlRrd3ZFbzJQOGlMaVFtMzhm?=
 =?utf-8?B?ME4wZVZ6UWM1Q2xicHRqV0NwVUw0T3RDY2cvSWFDYXAvcm5iK1RhTElKN1Za?=
 =?utf-8?B?MS9ld3JQK1FwQ09ZNExwdXpnNmtabEFTOEpXSnV2UXhidHhYWFlUQ3BpNkRM?=
 =?utf-8?B?OTJZVDdCTGhyTUdGaVFWaFo3RGNyRVFoR25FVlQ1b1MveXlRZ1JXTVoycWdz?=
 =?utf-8?B?SXVLRTFwU2JHbGQzSmtCVGNQVmNhNG1vKzErUm0yWVl1SGlieGtYR3NwQ3BM?=
 =?utf-8?B?UWRhVTY3VVVyanFZbW82eFJEQy9ZaVhydjR4bTNTWEtWSjRFeUE2bG1MV3dG?=
 =?utf-8?B?RkNmTXF2eHNtUFVHRytrUnpSSlpCZkFLMURNWXhCMVR0TnpwbFhCMjZsbHFG?=
 =?utf-8?B?Y2JKa2pmWXRoVW1NclB5Q2Vxc0ljbTAxdlVnNG1Nei9JaWNMY3Fxb0VMN2lN?=
 =?utf-8?B?czJSMmJrUEM0RzdOZGxkbTBiZW02QWV6OE4rVDlkQnhpT3JhQzN5MUtGb3g1?=
 =?utf-8?B?b09Uclk2MTh1aUNqSlJwWjBXNFhoMEFMTFFoYllWeHVZamtFRExlNHd5citW?=
 =?utf-8?B?RFJXRlVKNWlwRXdsZDJ0MG9nNk1NUm1jRXNSNXdjZ2s0WE5ZQjgzcGpJYU80?=
 =?utf-8?Q?92BYh5ww7B5LRh0atCyBHu0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb8549e-08d6-40e7-a7ba-08d9d51576ad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 15:17:22.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3BFOWxTuFnTEdrzullmaYByTiL+hr31MbsVKghzZiF7sKQ84L4lyQvW3bktjcFlU2hY3G2MXnMDVeJV19Ih8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:40PM +0200, Oleksandr Andrushchenko wrote:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 657697fe3406..ceaac4516ff8 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> -void vpci_remove_device(struct pci_dev *pdev)
> +static void vpci_remove_device_handlers_locked(struct pci_dev *pdev)
>  {
> -    if ( !has_vpci(pdev->domain) )
> -        return;
> +    ASSERT(spin_is_locked(&pdev->vpci_lock));
>  
> -    spin_lock(&pdev->vpci->lock);
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
>          struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> @@ -50,15 +48,33 @@ void vpci_remove_device(struct pci_dev *pdev)
>          list_del(&r->node);
>          xfree(r);
>      }
> -    spin_unlock(&pdev->vpci->lock);
> +}
> +
> +void vpci_remove_device_locked(struct pci_dev *pdev)

I think this could be static instead, as it's only used by
vpci_remove_device and vpci_add_handlers which are local to the
file.

Thanks, Roger.

