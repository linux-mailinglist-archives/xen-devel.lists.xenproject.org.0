Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B4D5659E8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 17:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360430.589811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8O4j-0005Ww-EU; Mon, 04 Jul 2022 15:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360430.589811; Mon, 04 Jul 2022 15:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8O4j-0005VA-Ap; Mon, 04 Jul 2022 15:33:25 +0000
Received: by outflank-mailman (input) for mailman id 360430;
 Mon, 04 Jul 2022 15:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8O4h-0005QB-3x
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 15:33:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1217b34-fbae-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 17:33:21 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 11:33:17 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5034.namprd03.prod.outlook.com (2603:10b6:5:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 15:33:15 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 15:33:15 +0000
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
X-Inumbo-ID: a1217b34-fbae-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656948801;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W7BoBpzlfSZDDM3iqyBmBNOfB6bvi8qQKSnXaoYBiWk=;
  b=bPqghFv1MocFtDe9whtk3X0B5fLzQ3HG7gjQagnfuz+pLfrgOmuwVKTJ
   ppcVcVpPM+vLHKxlh1pW6TYZAgYiF1w+3QHaXNuSo+0HT/iiwR0DlWS2M
   0ExjiwZMrkzRvcu/iNVGiwC905QZNwHDwAknXsGujhF3qjdpWLruIkGO4
   Q=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 75040371
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uPjTSqJ8gvT4ojQYFE+RuZQlxSXFcZb7ZxGr2PjKsXjdYENSgWMEz
 mUaD2/QaK7fMzenKd1/b9u39UlQ75GHzt5hTgJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3dYz2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I1/5bmzeCAyBOrVoMcZDToJGRNmNIQTrdcrIVDn2SCS52vvViK1ht5JVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FGvqQjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SSnL2UD9wv9Sawf/3rDxi923YPXLJnlKoPQS90Mp1yVq
 TeTl4j+KlRAXDCF8hKL82ihg+LTkCThcJ8JGaejsOVtnUeYy2IUEhIbE122vZGRmkO4Ht5SN
 UEQ0i4vtrQpslymSJ/6RRLQnZKflhsVWt4VGOpj7giIk/PQ+1zAWTJCSSNdYts7ssNwXSYty
 lKCg9LuA3poraGRTnWesLyTqFteJBQoEIPLXgdcJSNt3jUpiNpbYs7nJjq7LJOIsw==
IronPort-HdrOrdr: A9a23:+wjyg6D6PBQI/w7lHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="75040371"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjgDWuyEENMHqIiCJ2IJsS47Qq3xNLBcGaYgGLNmSKJ+OG79Z3YaYSkwAXZ/jARbwVuE6T1gb/gN0FZ4X+qxL4bUIZs0nOjINFW5StSVVDkrxgRSpyNNrshBlNCwL53dgaop9vZcvEY0QAQBr0dvbHXUc1/9LCVlU5N+cynYSBXvRT6zAULPo3PBdsYOfQ12F3OUTXRrVO/oPuDIfVYbg5H1r5PRHNwq6Kvkl3T72xj+XulKFv0vunVm+aB6t5ZIGehiCi27n70E3xwAiThByH17Fb94G2LY4Ymdq2l5kAizG5XYOT76ErybO3DpWA96b3dGq24yTdlWYqG7AfU3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWpUYK+xbI4BrR4Ykhb4sS2WAiMcJyVblXe8eD8qp6U=;
 b=Jyl7WjSMI9VOP50oegxrO4ClIzs5xoETn103HvCS2WpWdL0lzVsyS+MyLFvVus2Ezd7t7NUUmvVhfzuBvBYOi5UGpj/KpTqw9JivupJhQfC4zStwK7Jp8ID/nm4o+n4CY82RaiNQHAfBhbAboWfhqhBCgJOAdfZTy898wxbTCbVDJD4gZIskYo4wn4w6GJ8sMJBHRaAILxK0ScwaVnpHjPn4y3uZbPZI52dkx7LBLTfGmKhGiypsFZh1VzX1L4eOzX/vRrodGKSfB8f+HYnbbbFzgxcI/sc4gCFKDMSxg1nVmMwgzb5+MYhHvky/o+Oe4dpHhqag4LseASsrzApPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWpUYK+xbI4BrR4Ykhb4sS2WAiMcJyVblXe8eD8qp6U=;
 b=ZVzBpg8rkyPDUThVaFmOJ3o3gmk7NEuKs4JHfw6d0VV8daVYUKgKVV8TZg+n4hyR4eRCj/IvNQ0D/I7UQUr3nfRX3K3ddsXriclBlKqtG7FS9nTFzeAuh1v4Esta3v1wJG7rTF8uViqxqiEUYBGxjQhZdH/RGq0OtrzGsYYihb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 17:33:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Message-ID: <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0636.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b3ad1f-02bf-40ac-a0df-08da5dd2832c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5034:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sZmQ2FaaqJEliDn6ytk6QNrdPSt5h5/cl47Z7hjyxAX2aj29T4gEdGtqBBlhznvDENeehFR7L7vVCM1+DIHx8z7bnnpcEIP5lcIDgxxCD8fDI9gFEl8B16nUpzogWh2lTtoitDQi78KruYuiCRXAcivFR6ykn/B3n0focczUvm+bUNsE8fHy8hJgkvWyjYkDNozNxLBK4OMDCJXIjKsBOUI6KzrxDG5MWsM5wNaGRp3A8qKRK3ePvNEwZxsgE3vGGFyUg0DAYLJSuErjqdmpZHXcItFF7CY5Tek2hzxnHDgdFJSd2u8GZCc5VZ6hG8xZzaSdA20EyfX/AFGfoaoRGPxGj/slcPHUek1XCaqJBiOlkrZ4VeaGSslNiBvXbFCb4rgBtbq8nZHq0cHOH3+TPlK2THLiKkykKemsj3AI1wwLSkYRRxQhX/PKosDcHMGz7Fpvn74OsazTLHbPLP1UUe0ly63vXa64V5gSWcx8kFEoEEFbxoj9/yb1zuEc0keecubODa0cFe2WaIco4V3CMVnZSgxhAfVYm/2brNFkZUll/J3jpIT+oeddW2OgcsUysKUmswZHqRFWxwlls8ML0DTfQZ5coTJ7EfewB5Aj251d9UDE3oi6U6b0Swiv9o9OX8tnn3+Ce3yipJYLchDt2VtIHVwpNUNuTlw27gwDoEECtQ773ERiFxSPNI1L3f3KAks5D9ediIfJAitg0Xkjma42Rw11XWWkg9FlSEGTg16q98SKRRAYJ30883vdsVlsbzuw3BD32EfI165v+7UhZlItXo5q0jJESOCH5c47zBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(6506007)(6916009)(85182001)(316002)(82960400001)(53546011)(86362001)(38100700002)(5660300002)(41300700001)(8676002)(8936002)(6486002)(966005)(478600001)(66946007)(6512007)(66476007)(26005)(66556008)(2906002)(4326008)(9686003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG9WblBkU045TE1PelpmRmY2RFIxc0h0dkZGSzMvUFlDQzJ0Ti9EZ3F1VWZ5?=
 =?utf-8?B?WWFKS2VYU0t3TEhHalY4KzJTcGRCeUNMK1plWmMyYTlGTWFHNFJxcmVtWEtz?=
 =?utf-8?B?YjE2bFcyMzFIQUJuMjlKRVFqUGNmRTY5eS9GUGZwRGhYZlBrZDJ3TmlHOVlF?=
 =?utf-8?B?cE51WTlVVllFSzdpREFXL3hLaCs1QXZweEF3TnBRd21CSWJxb2lzYklmb3BX?=
 =?utf-8?B?Q25sdWhXK2FKWWs2WUFKNWdFNVQzN1J1REdkMzBYSk85dVdMQ2txV0ZEQXUy?=
 =?utf-8?B?OFpyMTJZWnV1anNOdnAzVExyUzhRUGdUaHp1eVNBMGxKWDJhaCtWeTFjSEhT?=
 =?utf-8?B?M0FKRWpyNHJmOTVPaGhuNDJZUlFqemcrZnZDMHBESW4reVMzYzk5Ri9CTmpK?=
 =?utf-8?B?V0o0L2gySmNmVzV4L0tETENpbFVDejR2azROb2NubkJ2b0tjdVRTdHYreUgv?=
 =?utf-8?B?S0kweXJNTHg4ME1udThpSlcxdm5EQzFUOTA3Z0c0T1FFS29yNXdwVjJobGZm?=
 =?utf-8?B?NUl5a09JKzVoKzJUcUhFMHdONDNuRTk4b1dmRk40aTVLRXZleWFCaVhyRjRr?=
 =?utf-8?B?Rm5TL2xZZ0l4RFZkaFlLZkRTL3FjYzBQYjZhNjM2UUhCUHkwdC9XR3BZcndZ?=
 =?utf-8?B?UURZRkg4OWRTTWNZNlh6amNVbGtNVnVVYnRlTG5Uc3RRU3FWVU9FREZpcmlp?=
 =?utf-8?B?STV2V2NUNW9xZlFIcHZrRTBNeUNtdzBVUHNGdUI1TXNXZWpEaW5KdEcvMXAr?=
 =?utf-8?B?d21DWWtBRS82ZDJRd2RadHpDUkhIdFBObmRDd0czV3dZVmZYWHE1RVJ4YWI5?=
 =?utf-8?B?SW1aeFRJbTluUGE4NHpWWHRFWHd0ZTBLOVA1M2pEbm9oR1V0UVcxTWRxcCtE?=
 =?utf-8?B?S1ljN29JWHIyOXVWM2l5U0ZyenhOS3h3TndLQS9lRk9JQzdtNk8zVUpDZ1NC?=
 =?utf-8?B?dUpmL2l6VVJKdWlQQzF2aEpoQXB3RVFEVnMxcVRtYVNjOTExVnRBazdGWWFT?=
 =?utf-8?B?OEhqWTljTDR3VHh5OXR6MmV6ZVk0cHlKQkpLTjM0bk9hUzNRQzgybEcvSTZP?=
 =?utf-8?B?bHV2OW80cDNzN1JCRnNic1pTTmw1ODg0VmxNaThTeWRyVk1pbi9rQ0RQRjlJ?=
 =?utf-8?B?U00zcnpIYmx2WnkwamNqQS9sVmZkMC9MNGlqQ1I0andpV1pmbUFiSUNXMTgv?=
 =?utf-8?B?c0FYc0xVdjJ4QXZDQkltREl5WDRRUHdVV3FCZVhwcVpEL0pKOVp1UEVBMVpN?=
 =?utf-8?B?MWZyZ09wanRRY3A2NDZnV1d1Q0g3TVQ4SUs0OG0zaEVZNldDNWlnelZRQUdq?=
 =?utf-8?B?Q2xBOUNDekZPOUNPWnhPbEt3OTlpYTJEOWRKNEFxd1VxeGkvdWpsbCs2TnJU?=
 =?utf-8?B?YVpqK1JtV0tMSGY1azZFU1NuUWVYSVk1azYweU1wSWx4UHpnZnJSelFEM0tK?=
 =?utf-8?B?U3l6czBmVmZVTUNCUlNpT2FHU29NUktWMUZucnNmNTJ3SkNnRFdoU2pJZG5y?=
 =?utf-8?B?RTJRTFdFcEhoTHdmR1lRN29ySXJsMDdZKy9OcHBhbWxXaFBSTGYyMkI3TGRQ?=
 =?utf-8?B?blhOczZyR0FPWk03WjhUSnJ4dVFQMkx2QVZRVjF6Z0V2bnc1OGVwMndzem8r?=
 =?utf-8?B?V3V5d2d4bldsaU9laGlWY21xaUUvQitPaFJxWldNU0NaZ01qUFBuZTRlOW92?=
 =?utf-8?B?MVBodmUrNDdRVmczYUlzMXQyRHpoV0RDVDVjN2gvOXI4bEVXVmE4SzhzZ3da?=
 =?utf-8?B?M3lJOVpIaXk3ODVqd2lsN2IySTBnaWdlR1hIM3lOSXFYTkhKN2l1SDZRVjln?=
 =?utf-8?B?enFiSmVtTnN0Sll5aGFBeElvNEFkVGN0YWNtcUVGNzYvNkJYRUJNaHYzTFk0?=
 =?utf-8?B?ektyWGxFbVlzU0hzVVRSR2U1eis3R292QTFtbVllNmxjbFNZdUh5Z0Q5bEZY?=
 =?utf-8?B?ckdMYU5XbDN0L3JpUnJnRlJKckRKMG5YbEtsWTNkZ2kwWXVld2kxL3dWSndL?=
 =?utf-8?B?bEkrb3JLM3BlYytDa0NUVnlzR1VBRkFjQ1F3S2tabVh1clpuOUdEZk1ZNFAz?=
 =?utf-8?B?OGRKYlZ5NDdHemI1MitVODdMRi9lNi9qN0FkdFlxN3FjelRGRElaamxCMEYw?=
 =?utf-8?B?bFZ0Sm9yMFZvVGdQVHRwVXE2ZTdFRkM3anVaQ05aQ2lFSzJlcFd2NDM1dmIx?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b3ad1f-02bf-40ac-a0df-08da5dd2832c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 15:33:15.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/Sr15oqoJpB7LoTzX8VOPRlbkmc7A8Q7MAlMqkf5sTYa2zPxXdHktL1e556KLBd45ANdLpTDH8hLd1HsKFaRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5034

On Mon, Jul 04, 2022 at 10:51:53PM +0800, G.R. wrote:
> On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >
> > > 05:00.0 Non-Volatile memory controller: Sandisk Corp Device 501a (prog-if 02 [NVM Express])
> > >       Subsystem: Sandisk Corp Device 501a
> > >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> > >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> > >       Latency: 0, Cache Line Size: 64 bytes
> > >       Interrupt: pin A routed to IRQ 16
> > >       NUMA node: 0
> > >       IOMMU group: 13
> > >       Region 0: Memory at a2600000 (64-bit, non-prefetchable) [size=16K]
> > >       Region 4: Memory at a2604000 (64-bit, non-prefetchable) [size=256]
> >
> > I think I'm slightly confused, the overlapping happens at:
> >
> > (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
> >
> > So it's MFNs 0xa2616 and 0xa2504, yet none of those are in the BAR
> > ranges of this device.
> >
> > Can you paste the lspci -vvv output for any other device you are also
> > passing through to this guest?
> >
> 
> I just realized that the address may change in different environments.
> In previous email chains, I used a cached dump from a Linux
> environment running outside the hypervisor.
> Sorry for the confusion. Refreshing with a XEN dom0 dump.
> 
> The other device I used is a SATA controller. I think I can get what
> you are looking for now.
> Both a2616 and a2504 are found!
> 
> 00:17.0 SATA controller: Intel Corporation Cannon Lake PCH SATA AHCI
> Controller (rev 10) (prog-if 01 [AHCI 1.0])
>         DeviceName: Onboard - SATA
>         Subsystem: Gigabyte Technology Co., Ltd Cannon Lake PCH SATA
> AHCI Controller
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 16
>         Region 0: Memory at a2610000 (32-bit, non-prefetchable) [size=8K]
>         Region 1: Memory at a2616000 (32-bit, non-prefetchable) [size=256]
>         Region 2: I/O ports at 4090 [size=8]
>         Region 3: I/O ports at 4080 [size=4]
>         Region 4: I/O ports at 4060 [size=32]
> 
> 05:00.0 Non-Volatile memory controller: Sandisk Corp Device 501a
> (prog-if 02 [NVM Express])
>         Subsystem: Sandisk Corp Device 501a
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 11
>         Region 0: Memory at a2500000 (64-bit, non-prefetchable) [size=16K]
>         Region 4: Memory at a2504000 (64-bit, non-prefetchable) [size=256]

Right, so hvmloader attempts to place a BAR from 05:00.0 and a BAR
from 00:17.0 into the same page, which is not that good behavior.  It
might be sensible to attempt to share the page if both BARs belong to
the same device, but not if they belong to different devices.

I think the following patch:

https://lore.kernel.org/xen-devel/20200117110811.43321-1-roger.pau@citrix.com/

Might help with this.

Thanks, Roger.

