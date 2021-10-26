Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DF43B020
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 12:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216361.375939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJoN-0004Cw-B8; Tue, 26 Oct 2021 10:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216361.375939; Tue, 26 Oct 2021 10:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJoN-0004Af-7B; Tue, 26 Oct 2021 10:36:07 +0000
Received: by outflank-mailman (input) for mailman id 216361;
 Tue, 26 Oct 2021 10:36:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfJoL-0004AZ-Od
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 10:36:06 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 221b2cdf-7f71-4f5d-8db9-7f7f8b5e79c1;
 Tue, 26 Oct 2021 10:36:03 +0000 (UTC)
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
X-Inumbo-ID: 221b2cdf-7f71-4f5d-8db9-7f7f8b5e79c1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635244563;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6K0QuZDpLKvERMWwE3Nglbw6L07CNVdJa7H55MNjY6M=;
  b=Iezp/DiPOFiRRQnoWcbNEvKwbtHwC4avydNk6aZWwJ8nrdUUAeehFmcE
   6+Z1tca7McwIa1347rNyag48dxgXaWsoXPTlJbR7PSnLgVPLR4LuQ1QtG
   4mcafXgwL4m8zgaJkcJh7e6WRkDqeyQk9IDbOT5fiVLF0D62h/Ntv3PKL
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Jzd1dVpxVtIsLLl4oxkvx/iBUpgtGYSAWFxE5hbfce5dSaYe320Pbo5h9jVrjfO1ICQv34IU7V
 x5o1suUyG8JpjQcb1kNnL4UAyOLGGpW9S344srOnFD34resMuAvRRuRnEZDTKv4CoeeFmvfFqH
 xWqt8MKCwhO4KJjb0zQmHMCYt3a/mMxUVCFxuhO/sTSX06vGxt7htvlmvTlMDkGkH00OIPxAAU
 yU8emZHWE0ikh8ZEE5BFaqt8zW1HpBkLdYpMOFS7HbReJiQwDcwyBfGPqNjWi6bqp3OM4ffpMo
 BaxfVcs1BuTgzIXQcd5hN61s
X-SBRS: 5.1
X-MesageID: 55621280
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rKInWaKCQ45qdlUoFE+R85MlxSXFcZb7ZxGr2PjKsXjdYENS1WMDn
 2BMXG7UbvqCZWWkLYtwO4638U5S6pbcmIVnGVBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2KluAv2
 osdtaCQVDkVFILwqNwhdhdXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuIEChW1g3qiiG978Z
 cREcjNtYi3fekJqAk9LDKg9vfWn0yyXnzpw9wvO+PtfD3Lo5A573aXpMdHVUseXXsgTlUGdz
 krv5Xj0ByY/JdOWyDeb2n+0j+qJliT+MKoYGaek7PdsjBuWz3YKFRwNfVKhpL+yjUvWc9VbJ
 k8P8ywit5878kCxU8L9VB21pn2DlhMEUt8WGOo/gCmXw6rJ50CCB24LThZIctlgv8gzLRQ00
 VuOk8LsFCZYurSfQnKA9Z+ZtTq3fyMSKAcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA3gbkJ15ZTj420+FnGh3SnoZ2hZgwo4gTaWEq14wU/Y5SqD6Sv7VXY9v9GIJyuUkiav
 HMEls6d68gDFZiI0ieKRY0lB6q17vyINDndh19HHJQ78TmpvXm5cuhtDCpWfRkzdJxeIHmwP
 RGV6Vg5CIJv0GWCbqZHPZDvW8QW7bXeKf7KasDsUv9Abc0kHOOYxx1GaUmV1mHrtUEjl6AjJ
 JuWGfqR4WYm5bdPl2XuGb9MuVM/7mVnnzmLHMGkp/iy+ePGPCb9dFsTDLeZggnVBou/qwLJ7
 80XCcKOzxhOOAEVSniKqdBNRbzmwH5SOHwXlyC1XrLcSuaFMDt4YxM0/V/GU9c995m5bs+So
 hmAtrZwkTITf0HvJwSQcWxEY7jyR5t5pn9TFXVyZgvxiyh6MNf/vfZ3m34LkV4Pr7QL8BKJZ
 6NdJ5Xo7gpnE2yvF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMpSLyw/XZ2+QK/+kDuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5tcdUmanWDKi
 V3+7NVxjbClnrLZOeLh3Mish4yoD/F/DgxdGWza5qyxLi7U4iyoxooobQpCVWm1uLrc9Prwa
 ONL4ev7NfFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHVasnrJ0EceVg+ZeOZ2PBKxjSLtaYpIF/37TNc9aacVRkAJAGFjSFQdeMnMI4sz
 eo7ltQR7giz1kgjPtqc13gG/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxBzc
 DGOhafEi7BN/Wb4ciI+RSrXwO5QpZUSoxQWnlUMEEuEx4jejfgt0RwPrTluFlZJzg9K2v5YM
 3RwMxEnPr2H+jpliZQRX22oHA0dVhSV9laolgkMnWzdCUKpSnbMPCs2PuPUpBIV9GdVfz56+
 rCEyTm6DWa2LZ+phiZiC1R4r/HDTMBq8lyQkc+qKM2JAp0mbGe3maSpf2cJ90PqDM5ZaJcrf
 gW2EDKcsZHGCBM=
IronPort-HdrOrdr: A9a23:0zC8D6Mdg4i5zcBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="55621280"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja7DKWaYVs2Y8i9A8VXVqlmNAeJiNxgk20NYwiEy7n/Zxu+qQfw9OQMfZo+VnsvX4O1G0AFqzOm9AJaRetsN5oDcaIdrLzgwnuEmlegmcpAx+VR/XE/xNjiKqbb/gGql/u8FD707P2A0mIxJ9XNKe710VAH24XX9WkFtiz/cx5mx2VabU8dvX1cwzf7TYYj7EcXZQtETOSBahnvA/1kxNZCi+n0zNbmpuN4h0YRH4ZJFBlTztAmJRKSfr7DkXCjpHAHKi8ydztXM5lRJeyBierI/OxYYN6OticWkwxJDvVyb+IYQj+8Q2nxV+9d8t3Z16nYTgYh9bW52Xvg+eQDflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vmesls1fMP5JrkhPFpoWML/guw/Cs719OE1dAa1P7g=;
 b=lbO6TuRPHX6ZubjI9f6MO6kcQQdjefW1X9I+9+4h9VuJg43VQImWtUKGh4d4PXS4vhJR67UeXf8cZipWe/rChdkteJlEodv8kyCc2UWFJ+O3ZH9MstYGkJiurlydCHzCIBMOHjONUxk5DgdXi9RHQQYxmujoxAOwdcnMaJmdDqgtbzpJnXyIQS18mecth9LApqROZYVWt0+IApEq3ewltaX2yzebYRbUpgge6T+0evy1e/jnw/84+QogJu2ddehlmVy7FPt6kQ130dTcGh3oPT539FsdaL8g5PxqRlXBw3/0J41osBY8YYPaJwWX0xwnHwY8T54Q4AvCnIrhnPj1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Vmesls1fMP5JrkhPFpoWML/guw/Cs719OE1dAa1P7g=;
 b=paI9JEv8gLJlOiGsjNwFOsr1uvD0+ArdL0bBQ7j/x0nqrUzkMTEAwqpyCTQ7JGG9i4P9iWDyCAYhEMPIgz+tAVK+na1q4FSuPmns1WSd5zVH6Rhgr71LmVMJvrgVpFZNNlGmXOj10H/1Wcu5KlDVCY73H5eGcx1vebnR6PlQN7o=
Date: Tue, 26 Oct 2021 12:35:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
Message-ID: <YXfaCgRpQJbBNaD2@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-8-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-8-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3b31639-86d8-46b3-eab8-08d9986c665b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4604:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4604291367EA1A5D478BB4208F849@DM6PR03MB4604.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+QDcsDg2DeWgJqYRo0u5NfiHnsaftKChRE1YG9oJhpTIaNcXfsuW5+Zi2r4qRe58i6PeIHImnsgME5fZO9KOqQwfn7XFPwxhJS9Bi5nT/emUgYOt6SFPx1F8z7mDkYMBrNOiWSAILRHz6dn3+cNg/KZ1NiKu2gcMQxzPZB8x+5/pTq9FQZOoAuJClSoPLnsVEohOeJEik9M2XPcAISSu/bXOWDuXu4svtRuBr3sw0yqJ0Mt8e5ShOqxfAFx/m6y25+0SOI2rtOlZ5fxN5oWeotQyRk8ZFXW4op9iX5wlyxcvXreoyD5jFh5znzWKPczkDTRgQclcpSNUxmgCWah9g7f/D+FWQf54DCxmRn/NnTefmS+ev2icnGZlnx1GS1HyKtbsPwFUiS9h9Ig/jgh03AC+kTzKBYhoMZM4ZWMpaXQpT17wB0dynyNcr7xkTDqTEwrdvn0OufCIOrLImmWNIARgYyxfhkBZZU/efVBttPmSN6uHr+0qYR66jWx24MTvRCaas0geIgsh4+SeNxo76+r1tJ/bpMl6aHMxv58GrrjULlPDLhtkcoU2YiDNh+YuLsib/Ju6DNh8QFqwcpmA6w0AR0bnv9tpk82Bd2qwtlxu2sSejV2wXrKZAskOZlJq+XfcirKkvpmVbrFBtBDDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6916009)(508600001)(7416002)(5660300002)(83380400001)(86362001)(316002)(2906002)(66556008)(6486002)(186003)(8676002)(66946007)(66476007)(956004)(8936002)(26005)(38100700002)(4326008)(85182001)(82960400001)(9686003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDRjMXdWSXpYZms5VVJMMDJsMzA5NDVyMy91QlQvWlVJdEJ5OWl4TmNvZ2ty?=
 =?utf-8?B?eWw1eUszL01rMC9nejFZSyt4QUxzOEhWTUVJY205Y2ticGRtY0h2LzJra0J2?=
 =?utf-8?B?K3pwSHd0Njhhc21rVHBnMzZpOFkxVHBjaHhmemIvMCs3SytaTmlESVNqUTBq?=
 =?utf-8?B?ZjNaV2s0aTJkWXo2ZVZaZUdnaExScmZHdWNua1NOd2wxRmw0WThDcGFsMTh0?=
 =?utf-8?B?bGFrSGtpY1Q3L2h1RkVBTUtvdys0WjZ2Nmt6OHl1Y3ppTGJhYWxRaElQK1Q4?=
 =?utf-8?B?UVEzeDZiMmFPNmM4SDJoRzBRb0Q4dFFrZDB5aFdyZ2w4V0xMNjZKUTkyNklL?=
 =?utf-8?B?MmV4NWNjQmFSM0cxRzlsU0hKRm5nZXlwWU9sc2RaWGRja090WWEyQUtxcEZR?=
 =?utf-8?B?Q1J2T08wT2NDRHlqVk54WUFXazhwRklISWdqcEVLN0E4bTg2VEUyNlZGaEJ3?=
 =?utf-8?B?MGtDU3VWQ2dUU0krcmR6SS9hRHp5c2h0MmpKSC8yblo2Mm9WNzV5UEQ1VzVC?=
 =?utf-8?B?eUYxWjN0TzdtTTNXRTJWdDczMndDbXNyY3lsWllqTVVPa0Y2TXZ1YWN3TlZv?=
 =?utf-8?B?TUtJd2srTzJ5Y2xqUHZoQll0SmlnQkJNTWVwaHdyV1FyS1hXcmlmM0ZpWk5P?=
 =?utf-8?B?Vjcrck5tRE5CT2VhL2c5MkNOamk4cjFObzJTakhia2ZDd1FZbkVabnpEN1JV?=
 =?utf-8?B?MExiNk1XalNUYTBpVGMyQXA0MXhBcnY0aSsrVTJ5SElUOGIrQ2hQTDhpdlNJ?=
 =?utf-8?B?eDFiREszWUdJd1NhT3dCdkJIaDB3QjBIUHNEMFJ1R2tKZkRuR0tlbkNNYVV0?=
 =?utf-8?B?NWlmZG54dHBVMVlQaDllOGtKRjk3blR2bGNSVUplaEZuSTAzUEdxOGdGbGpR?=
 =?utf-8?B?TnlXQSt6Qm02WmRCZ1B0bjhLOG1LMWMwRUJ5cmd1YU1ESE1zWnhxazd2L0VQ?=
 =?utf-8?B?aEhJVmdqd0RRTS83YWROQjhyYUI4Z21QeTM0d1VwdUhET0ZRY3piNnBmT0l5?=
 =?utf-8?B?WmZPMlNEdUxWTTZQcnJ1N21NbVdmNjBDajFJaE1PWTR3NEtvb05ZUWY4dnIw?=
 =?utf-8?B?Wnk5WUxWYTd4QTYwZWlRWExLcHNIVUgzZ2RXYVh3ZlZLT3c5N0JQeU1Vczdr?=
 =?utf-8?B?MmM1ZWRXRDVDR0JMWERSTlVlSDN4aXJVR1pjcG5kT3pZQzZxK2tsT2V1UXZR?=
 =?utf-8?B?Tnl6dmdSQUNrYWNjVmVJT1AvNjhGNjFFNjJOclpFcld3WXJzV1RUVFVZcTc2?=
 =?utf-8?B?aUYvcUQwTlV3emdoeEZ5NHNnQ0tKSCtueHpSQzJnbTA5ZXpUajh1M3k5Ny8y?=
 =?utf-8?B?OWdlWFV2SERxZWhpL2FOYnQzdkxrTFRQZ2FUMGtGNGdOblZGUmVPelJSUnQy?=
 =?utf-8?B?cHVjOE9KSnlZWEFPSzBoTUlrV3haM0hFVklnYURSb0xxZVdQbXpNQzlOUitk?=
 =?utf-8?B?bW9rM01UL1JaQW5iQ0hLaExNR2lqS3ZRU3BvU0p2VGg3L0pMd0hjYlk1N1I5?=
 =?utf-8?B?d0ZwcW1CMUNGR2FiRmk3VU9oOC9DakgyamhsQStjeTdFN0lIdkxXeCt3OTJq?=
 =?utf-8?B?NStxTVUxbTRIWlg0RWFIakd4SHJKMzFqT3JmbFcxVXIzZnp3aEZSNjdkMm5F?=
 =?utf-8?B?V2FWcDdsbXAwVzNqMTBtYVplM1N1dFF4d29qRlNHTXlQN051YVoxaGh5YkF2?=
 =?utf-8?B?SW93cWpzNWVRY3VRYUNwV3ZQQnhFekxIK0dpVVNEUUs0NmFTN2h5V3VKSGI5?=
 =?utf-8?B?bGFrZU1ZMndzWUZ1WS9YZGtBeDQ2VGkrUGtiTS9SUnJWUXBWc1RJU2hqRzNK?=
 =?utf-8?B?aW96TVMxNitha0xMQnlDTU5pK1c1MFFIWTFuNlY1b1ZBVkR6eDRibTZFZ1Fm?=
 =?utf-8?B?THNBUXR0dGZhOEF3KzRSRUFiUUpIdnk3U2Fvb0V6czBsMjZ5alZzQXNBYjBa?=
 =?utf-8?B?L2ZORFRHcUhELzFEM29xdEVzVWxUK2t5Y3NicktscEhyTVVubUJQZ1JvMEs3?=
 =?utf-8?B?RDg0NWxBQzdhQUViTmY2TjM4U1dUdjJLdDFtZ0NieW5JQkt5OFhvd3RXbUhh?=
 =?utf-8?B?ZkoxSmV6YXVlNHBnU2xlSlRIWHR3a0E2YUxMSXZXYit0aHN6R3huTFhINzlz?=
 =?utf-8?B?elBGNllMMS9UY2ZrVG1vNnBWR1ozQ2VrMWMzejlCbEhmbzF5b1lSQzh0N0xm?=
 =?utf-8?Q?+vWeoGkl9swrob5MKINSNMI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b31639-86d8-46b3-eab8-08d9986c665b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 10:35:59.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88UTVT/cHAP+5DlP33JDrXAqRKHgS+wvqLOlJcET5g8Tr56qTorh36pQFezNIK3nwfpIVk6zW+O/hrABXXSF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4604
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:19AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the host bridge in the hardware domain.
> This way hardware doamin sees physical BAR values and guest sees
> emulated ones.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v2:
> - improve readability for data.start_gfn and restructure ?: construct
> Since v1:
>  - s/MSI/MSI-X in comments
> ---
>  xen/drivers/vpci/header.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 9c603d26d302..f23c956cde6c 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -30,6 +30,10 @@
>  
>  struct map_data {
>      struct domain *d;
> +    /* Start address of the BAR as seen by the guest. */
> +    gfn_t start_gfn;
> +    /* Physical start address of the BAR. */
> +    mfn_t start_mfn;
>      bool map;
>  };
>  
> @@ -37,12 +41,28 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>                       unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    gfn_t start_gfn;
>      int rc;
>  
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
>  
> +        /*
> +         * Any BAR may have holes in its memory we want to map, e.g.
> +         * we don't want to map MSI-X regions which may be a part of that BAR,
> +         * e.g. when a single BAR is used for both MMIO and MSI-X.

IMO there are too many 'e.g.' here.

> +         * In this case MSI-X regions are subtracted from the mapping, but
> +         * map->start_gfn still points to the very beginning of the BAR.
> +         * So if there is a hole present then we need to adjust start_gfn
> +         * to reflect the fact of that substraction.
> +         */

I would simply the comment a bit:

/*
 * Ranges to be mapped don't always start at the BAR start address, as
 * there can be holes or partially consumed ranges. Account for the
 * offset of the current address from the BAR start.
 */

Apart from MSI-X related holes on x86 at least we support preemption
here, which means a range could be partially mapped before yielding.

> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
> +
> +        printk(XENLOG_G_DEBUG
> +               "%smap [%lx, %lx] -> %#"PRI_gfn" for d%d\n",
> +               map->map ? "" : "un", s, e, gfn_x(start_gfn),
> +               map->d->domain_id);
>          /*
>           * ARM TODOs:
>           * - On ARM whether the memory is prefetchable or not should be passed
> @@ -52,8 +72,10 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, start_gfn,
> +                                         size, _mfn(s))
> +                      : unmap_mmio_regions(map->d, start_gfn,
> +                                           size, _mfn(s));
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -69,6 +91,7 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>          ASSERT(rc < size);
>          *c += rc;
>          s += rc;
> +        gfn_add(map->start_gfn, rc);

I think increasing map->start_gfn is wrong here, as it would get out
of sync with map->start_mfn then, and the calculations done to obtain
start_gfn would then be wrong.

>          if ( general_preempt_check() )
>                  return -ERESTART;
>      }
> @@ -149,6 +172,10 @@ bool vpci_process_pending(struct vcpu *v)
>              if ( !bar->mem )
>                  continue;
>  
> +            data.start_gfn =
> +                 _gfn(PFN_DOWN(is_hardware_domain(v->vpci.pdev->domain)

You can just use v->domain here.

> +                               ? bar->addr : bar->guest_addr));

I would place the '?' in the line above, but that's just my taste.

Thanks, Roger.

