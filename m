Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C048C3CB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 13:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256601.440470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7cUO-0002Ri-1N; Wed, 12 Jan 2022 12:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256601.440470; Wed, 12 Jan 2022 12:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7cUN-0002Oo-Ts; Wed, 12 Jan 2022 12:12:27 +0000
Received: by outflank-mailman (input) for mailman id 256601;
 Wed, 12 Jan 2022 12:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7cUM-0002OS-Ai
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 12:12:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e58aa92d-73a0-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 13:12:24 +0100 (CET)
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
X-Inumbo-ID: e58aa92d-73a0-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641989543;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=o+KzZ0aIAumGFIFVhRJywPqZE9aJIl25ioDtSF1GW5w=;
  b=N68PM38zgl4L7k01brqDgWd6kisWRDYk6p9rqkwAmbxpTBJn3WwyjvEv
   NZWmJKxGeCz99KuklHHvwGLnUTsB5SzyZ6tUOq0PVIakAtSP9E0qmdv9P
   iSMSNBwwNRexMD2PwOhKA64hmS5bGWdGl2oDwjqciIc8LtwwPMmRm4znm
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KKhmlUQe3zZxv8iehL/2OSRWsostTEeeGpDfSsWPYzWo85CPITNnzdgAbW5VLPYb+oc5nupYse
 6KeSlIlmXzi2RcI8ulKophRrSt66Yfvybz27m1oyeR3ZInhUE1rWhpFCVN6hlKWBOlnicXicOU
 Od4s8RhspnD6o9prcHbqMi3jOS85JQZMCvkS+12D/txTsv1cGbKbHbpFvFeiN4kFSB0TTyO9NI
 Uy9mCC7iQPFvcilDWCDOs6Bd2AkwSU0OvnB1QRLi3MIS2ZK6OblPHE3qIBLUPkrb6EzjdToT5n
 cHiUX14UETGduj/CKDxbDZxV
X-SBRS: 5.2
X-MesageID: 61825313
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hkArd6POITJE0TDvrR1lkcFynXyQoLVcMsEvi/4bfWQNrUorhWEOz
 TZJD2GGaf6DMWr2LohyO4jg9EtU7MTQzYBgTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxirretjy
 ZJEiaGLbw0jDPyPm+E2DSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uTtYUFh25r7ixINbGDd
 9REU2doVg3NSCxLY0coKJ1hkt790xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1XlEuFo
 mPN/0ziHwoXcteYzFKt22iwi+r4uDL0UYMfCpW17vdvxlaUwwQ7DxkbVkCyp/WjvUe4V8hCM
 Ewf+icorq8a+VSiS5/2WBjQiGSNvgMYHcFRFeI6wAiXz+zf5APxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9S2+Z97qShSO/P24SN2BqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0AWjrMfl5RTj/2T8lXOgjbqrZ/MJiYr4QHQUnOg/xlOboevbIy16nDW9f9Fao2eSzGpu
 3wJmNOX6uwUOo2cjyyGQOgLH7aB6u6MNXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBX
 aPIkVoPvtkJZiLsNPIpJdLqYyg38UT+PfnHZMvGb51HXqVKUgWNznAtZku7gVm4xSDAjpoDE
 ZucdM+tC1MTBqJm0Ce6So8h7FM7+swt7TiNHM6mlnxLxZLbPSfIEuldbDNie8hktPvsnenDz
 zpI2yJmIT17Wfa2XCTY+JV7wbsifSliXsCeRyC6m4e+zuta9IMJV665LVAJIdUNc0FpegHgp
 CDVtqhwkguXuJE/AV/WAk2PkZu2NXqFkVo1PDY3IXGj0GU5bICk4c83LsVrJOh9qrIzlaEvH
 pHpnvls5NwVG1wrHBxHPPHAQHFKLkz31WpiwQL4CNTAQ3KQb1OQoYK1Fuce3CIPEjC2paMDT
 06IjWvmrW44b106Vq7+Mav3p3vo5CR1sL8sAyPgf4cCEG2xoNkCA3Gg1ZcffpBTQSgvMxPHj
 W569z9C+7mUy2L0mfGU7Z25Q3CBSLohThEETjiCvd5b90DypwKe/GOJa87RFRj1X2Lo4qSyI
 +JTyvD3Kvocm1hW9YF7Ft5WIWgWvbMDfpdWkVZpGmvldVOuBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3FZC/cnu5gWDZXFkA0uzl0eM5XQBjWvuMOEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHlQZQKU6Il9zJgu4M8CdQqTlnHB5Iyhhn0v5oP
 jQ5PUNCOqjTrSxjg9JOXj7wFlgZVgGZ4EH413AAiHbdExuzTmXIIWAwZbSN8UQe/z4OdzRX5
 ujFmmPsUDKsd8DtxCoiH0VirqW7H9B28wTDnuGhHtiEQMZmMWa03Pf2aDpasQbjDOMwmFbD9
 Ltj8+tHYKHmMTId/v8gAI6A2LVMEB2JKQSumx26EH/lyY0ERAyP5A==
IronPort-HdrOrdr: A9a23:d//KBq4aVwFNPJZZ1APXwSyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdgLNhR4tKOTOGhILGFvAG0WKP+UyFJ8S6zJ8g6U
 4CSdkONDSTNykDsS+S2mDReLxMsbr3kpxAx92utEuFJTsaFZ2IhD0JczpzfHcGIzWvUvECZe
 WhD4d81nGdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn5y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXoIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6V9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF39tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc8a+d
 FVfYHhDcttABCnhyizhBgs/DXsZAV+Iv6+eDlChiTPuAIm2UyQzCMjtbsidzk7hdYAoqJ/lp
 f525JT5cVzp/8tHNJA7dg6MLmK40z2MFvx2TGpUBza/J9uAQO5l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="61825313"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRj/jj6u0RW1fKPxa0hTfygYTnkSQyh+vuMO7IZcxehGPOlIfA3PCgh0t+o8bviPW+P/ZVhjcH1zcWiQFljmaOBI2TMsQNSPlBJymuP6GO8OFd8QKCqSZ9/HEqxoPftfJefTOssqBCUabJJXeFXzvUxVMczR2s+l1hTUyjVx9ye0aq16HWG+kBXWwqXiKyqZfGnQH0v9HdwabT5LOXkh3FrHNSvV5hJRCBWdfeEQxjm+ck4y4TDpWPsx2ybNjH+izw0gRmebx6JKbp4039v2+/nswpgsKkjVF555CHxhe+redMi5Ezn6SZ1ZGtdiJSNB3kpNUIJmsYOo1KapHCtUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDYg8WEqjw17gvw6eD819gI8IPywABDXoVDPovaRbPo=;
 b=GAPJt3y378kww2nn0vT9uE1eZe+ONP22bjblUxNtJVuZdSg+XYJVgI7AAEXQ4gMq4Q93I5y9LyFh3V3rfVC6f0yLKPxcyMoZn2DASv2iANjYbIloVMf7pmvA9dOqTTIXNFo0Jwoq6hdv/eQjQo2kugR52Lib+bMWmPp7R78Z9ZUwE8B5gNTRnE3yV5yUX1YeC+Diwrr4FdPDNK9dFKyZsoPlIwVK4APEevvK/SS4XGaysv/wM9l+APvJsOBWlIhUXyElUiHcxZbxE4lWsN7XwWubPJGzpSCgM8jFV4wqGbeMOcYv9bBTaHIWs0dovWakmsjI9JUcHcSHv5N/riVjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDYg8WEqjw17gvw6eD819gI8IPywABDXoVDPovaRbPo=;
 b=l/PTFi/BmCvpJuvX5bMak83LddJeRh0FXFXx009UqOSYdcKKZNCco01oR9bJsuRPJEFznCRbxuy9lrx2kR63+wK6V8nSS0q9/N5aVYJWNRalXYXUJfb0ziiqH3mvumLeruIAVPT883KDu9M5UV2gdXcZC65OIU6DoBf7NEHLwsM=
Date: Wed, 12 Jan 2022 13:12:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Message-ID: <Yd7FnIQAw4J03/MG@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-6-andr2000@gmail.com>
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029fc724-cef4-431c-8cd5-08d9d5c4c5f1
X-MS-TrafficTypeDiagnostic: SN6PR03MB3920:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB392007FDBE2776DB4AF6A7278F529@SN6PR03MB3920.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3bdTC7/yQiTy7xEq/D9dNhHX+1GUlsMZqdexH2o8evU7U4cg4vsI4T+SSf0XfX4Fcyy4pqGbaK7bdaLbkG20H7+U5oq/o/wqUrishRWG03KMtWyhere1vgy/EnJCquVyQJdCBx13cVeiQAvnRrEu3mk1z8wAf+GqCsxVCjOMg/ajy7K2vPhXo5A1iU2dIQR/iU1tgui4xu7FIQxQmj1yLfUS3nRINaayb1/yy0kpOLy4cuhHxgTKIx4DizhsSx2wF1PeNuQnTQGNQ6Ul8ylxFRSOnWD53w/ENpra3xgTNgo6F8BdxD/eH6YjI/QL9kX/2GcGclCWaITYBlJPLlBPcuLHL+/kFpPa+0up8nQLZgSmKq7xqMrpdRsX5y18kXNLHEBCWyQiTWaV1etsoJ+wWaNdPUzZe2o/OnElK6uVv4gyWswEHp7GsQzC8oi3yK/3oM+Pr2ff4ocezhV5GMM3K28otg3a5qzQYQRzX88qKzcOMuIhUTNpQPc97bq21bbZv0CLn0B0KS2pHu9VDhMZvIq8nyYorCX13Uw3pUj6HJdyfC65uKRG1emWTM9aaayr/E12te2sI4+n7Z9RtEnO/3mnu/YqaE0++SUimatZv+SaLC5mHYSQEYP6FeCePc/v9m1uUb31fgeQ5hOEHMt+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8676002)(5660300002)(6512007)(9686003)(83380400001)(6916009)(508600001)(6506007)(38100700002)(2906002)(86362001)(85182001)(33716001)(8936002)(6486002)(66946007)(66476007)(66556008)(6666004)(316002)(186003)(4326008)(82960400001)(7416002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVZMUN4RHRYVXVwTFVTVW12cHk3VGJLVHdTRkZwaWxZeHI2Z05iQXdzZ0RR?=
 =?utf-8?B?c29FeThZU2ROVXBkZ1FyZXV2TmxwZ1FoRk1iaXVqRVRWaHN6WTlVRlhsaVpB?=
 =?utf-8?B?WWtldTkrUDVpR05TMHZsWmlxTk9xeWFBNmxNM08yTUUwaEdyK3k3dzhkbHVK?=
 =?utf-8?B?WUtWbW5LejhKSmFKNExnLzlmNGVTZ3Bac0d0YnJwUmhIN2o1L3ljSVFiMmQx?=
 =?utf-8?B?QTNYMDRvRHhzcEpyUHJaaXJ2UDFjVEsxaE9KekNDWnRSZmkvV0hzMFFVRjFJ?=
 =?utf-8?B?NWFhTWlGeWJPNFdCSXRSdHp6VkMyY1BFWWNMVXJBNXF3T2s2bzdwSlVHTm1N?=
 =?utf-8?B?OHM5OERXbTJNR3psM24zc3dlSjJrYmhuR0NHRDJLdTdKQlhFZXFXbEhGNnBC?=
 =?utf-8?B?eEZtUkM3NUxMODAzYlJXT2hXN0d1djBlZDI3OTBTaWd3ekVZMHFBcUZBNERi?=
 =?utf-8?B?ckI0dEtnNEc0RmNWM2I4enQ0Z09BWGdVZzZMQ1lMSXhadVpHVUp6bU5yMEhZ?=
 =?utf-8?B?SHFENVJzNmdmeDRGbDJlUnpheG05dnFUZmp0ZUFSV1JOSG5VRUZMQVgwakNi?=
 =?utf-8?B?RHVYTlUxQW9MMnEzS3Noa3Z4VWpPcXJGN1BXQTU3V0FYM0hJeGh1blJkTU40?=
 =?utf-8?B?bWZ6aXFZTFBNVzRaQXV6TEVSVVd5V205dlc5bmdoUGkyc25mL2w0a3prQ2ha?=
 =?utf-8?B?MUYwdWFYc2xHc1A2Skc4Vis0aFMrVE1zS3ljZG14Q2h5MTlRYnFQWXpXV095?=
 =?utf-8?B?bUhhWGtoYTdNL2FOSmo5UjJJaVljbEs4U2h3M1h3NzZyNXN6ZGk5OVdZRDda?=
 =?utf-8?B?WmlMb0NWLzR6eTZoT3Fxb0lteTgwU29mOU01emIzYmdEeEdLbloxYWxKSDlV?=
 =?utf-8?B?ZXV5Umx5NjRzRXVKOTl0Nkx5SWcvLzZsL0gxVXRqeXJuTGwvd1d2ekNpa01H?=
 =?utf-8?B?L3BwTEJ6QW1kVjQvM21nV3FFaFlTMHNKWC9rL1lhYmRWNklMMmxKOHI0THZv?=
 =?utf-8?B?S2Q0RldLKy95Y0RxdGo4WFFLSW1YbzhjWkxYREt3YXdNZ2RPdlBMS3RhRXlm?=
 =?utf-8?B?b203MnR2RnUrT0lRczROeE5CcGZ5eHE1MDhCL1RqN3krbU10QXJrdzZUbkxU?=
 =?utf-8?B?eS9scFFob2g5VGdxZU1rVXlhYjV3VjBtekh5RG8rT0NQRE02TG5abFR1OXBx?=
 =?utf-8?B?Q01OcmJIOHZDK3pjZ3JzOUo1OUNyS0JlZ3pZMVNmdFc3aGJvelcvbWRHY1o4?=
 =?utf-8?B?TzBvRVprak9wZDdvcHpDay9CT0RvR1NLUWxMMXpScnRtT1BzVmZxMWRUTlVq?=
 =?utf-8?B?YitPNmx2Q2JWaWFHc09VeFVGVUZjeUF5UjdvTnpwWWRDR3RPNCtXbHhjbEtX?=
 =?utf-8?B?K2hHR3loS2tQRTFYRFFrQ3haWC9mRDNDQWRCeWhhMTBEaVpwejM4NFRSdFJI?=
 =?utf-8?B?cHc2c3FRdXVZMEhwYk4rVDFLMnYxbFg3KzV5SkZiL2taNHo4RTFPR2UwNVZv?=
 =?utf-8?B?dVArV29HYXdUbHBINGdyak5zaDg5NEx0aUMwYzlsUVROaUpHTnUyMnpiVGZD?=
 =?utf-8?B?dUttaldRbEhlYmpiRXdlSjloc3ZRcldMVG1FaHRYd0FkaUEwOWcrUWhZajF0?=
 =?utf-8?B?MS9VWHVuNml0MVdDcWdVeW9ucTZTV2V6OVEwNmhBa01oQUpud294TFBwSVYx?=
 =?utf-8?B?VzhRMjJVMTlyeUR3S3VXdkhYZXdrZkpWMDFNNjdQWjhqQ2cxU2lXZlYzMWRG?=
 =?utf-8?B?My9MMmlmSHE2M3lPcDJ1OVBhcExjV3d2ZGRna2xTMStIWDZkSXBYNDRxeEtj?=
 =?utf-8?B?NDVSY0dXOUtNS2hyMVVBNFlsajNoeTdsVzhYYXpOd0c5MWJXbG1YcmJPblda?=
 =?utf-8?B?VTJySW0yMEdnb3hKQi9oSVRSN21NcjlTVmtVUTJDN0xyUlFQUjROanB5MVQw?=
 =?utf-8?B?eE9YV0UrMzN1NFN5NVZKUzd4NEdraXlYMXV1amRyQ1NqbThxM1Z1cDZEd2R1?=
 =?utf-8?B?a1paQjZPd2dobTUycVVpVU9ORmI1VEZndmMyaTBRS1J5cVY1RGU1Mnl6b0dq?=
 =?utf-8?B?Nk9DQ0UxbEs2WGpwZlRaUTEySWYwYXpXZ2U3b2IvUytjT1Zqa1dDb0FuNWtE?=
 =?utf-8?B?MFNHdVp6bFVnRjhHZ1NOSUFUY09TYmFyWjBQRVhqSC9ucStuTFBnNFYzM0Nq?=
 =?utf-8?Q?qR85Op2/HzC2uTjYDWfdiGU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 029fc724-cef4-431c-8cd5-08d9d5c4c5f1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 12:12:16.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vvEhUA0XVO5r30bMhAqWMhIKwkSlo13cyadx6NUguFadeqS85sxjlZP6I6oSjyjGCrz+ILYWlI1fKH9mSbqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3920
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:42PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
>  - de-assign vPCI from the previous domain on device assignment
>  - do not remove handlers in vpci_assign_device as those must not
>    exist at that point
> Since v3:
>  - remove toolstack roll-back description from the commit message
>    as error are to be handled with proper cleanup in Xen itself
>  - remove __must_check
>  - remove redundant rc check while assigning devices
>  - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
>  - use REGISTER_VPCI_INIT machinery to run required steps on device
>    init/assign: add run_vpci_init helper
> Since v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/Kconfig           |  4 +++
>  xen/drivers/passthrough/pci.c | 10 ++++++
>  xen/drivers/vpci/vpci.c       | 61 +++++++++++++++++++++++++++++------
>  xen/include/xen/vpci.h        | 16 +++++++++
>  4 files changed, 82 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47a6..780490cf8e39 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI
> +
>  endmenu
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 286808b25e65..d9ef91571adf 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -874,6 +874,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> +    ret = vpci_deassign_device(d, pdev);
> +    if ( ret )
> +        goto out;

Following my comment below, this won't be allowed to fail.

> +
>      if ( pdev->domain == hardware_domain  )
>          pdev->quarantine = false;
>  
> @@ -1429,6 +1433,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      ASSERT(pdev && (pdev->domain == hardware_domain ||
>                      pdev->domain == dom_io));
>  
> +    rc = vpci_deassign_device(pdev->domain, pdev);
> +    if ( rc )
> +        goto done;
> +
>      rc = pdev_msix_assign(d, pdev);
>      if ( rc )
>          goto done;
> @@ -1446,6 +1454,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>      }
>  
> +    rc = vpci_assign_device(d, pdev);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 37103e207635..a9e9e8ec438c 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -74,12 +74,26 @@ void vpci_remove_device(struct pci_dev *pdev)
>      spin_unlock(&pdev->vpci_lock);
>  }
>  
> -int vpci_add_handlers(struct pci_dev *pdev)
> +static int run_vpci_init(struct pci_dev *pdev)

Just using add_handlers as function name would be clearer IMO.

>  {
> -    struct vpci *vpci;
>      unsigned int i;
>      int rc = 0;
>  
> +    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        rc = __start_vpci_array[i](pdev);
> +        if ( rc )
> +            break;
> +    }
> +
> +    return rc;
> +}
> +
> +int vpci_add_handlers(struct pci_dev *pdev)
> +{
> +    struct vpci *vpci;
> +    int rc;
> +
>      if ( !has_vpci(pdev->domain) )
>          return 0;
>  
> @@ -94,19 +108,48 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      pdev->vpci = vpci;
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>  
> -    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> -    {
> -        rc = __start_vpci_array[i](pdev);
> -        if ( rc )
> -            break;
> -    }
> -
> +    rc = run_vpci_init(pdev);
>      if ( rc )
>          vpci_remove_device_locked(pdev);
>      spin_unlock(&pdev->vpci_lock);
>  
>      return rc;
>  }
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* It only makes sense to assign for hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )

Do you really need the is_system_domain check? System domains
shouldn't have the VPCI flag set anyway, so should fail the has_vpci
test.

> +        return 0;
> +
> +    spin_lock(&pdev->vpci_lock);
> +    rc = run_vpci_init(pdev);
> +    spin_unlock(&pdev->vpci_lock);
> +    if ( rc )
> +        vpci_deassign_device(d, pdev);
> +
> +    return rc;
> +}
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)

There's no need to return any value from this function AFAICT. It
should have void return type.

Thanks, Roger.

