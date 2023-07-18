Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0EC7577C5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565018.882821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgvh-0008EE-Qj; Tue, 18 Jul 2023 09:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565018.882821; Tue, 18 Jul 2023 09:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgvh-0008BR-Nf; Tue, 18 Jul 2023 09:23:37 +0000
Received: by outflank-mailman (input) for mailman id 565018;
 Tue, 18 Jul 2023 09:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLgvf-0008BL-W5
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:23:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c387baa8-254c-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:23:34 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 05:23:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6682.namprd03.prod.outlook.com (2603:10b6:a03:401::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Tue, 18 Jul
 2023 09:23:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:23:20 +0000
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
X-Inumbo-ID: c387baa8-254c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689672214;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XVkU1XfdVEIvw3mZ8pbaWLFSbMFhOl+4y7A/y5C1Dq4=;
  b=d3wA1RMjY6NyHLFuJyxZMqUPrl+cqKcUAoKtyhroBDT35NpmVN+69Rac
   72DnjST/gjBw3E2QR0DHdl0EW9mRDYO+VBAKj48Aol9U0gyrJUnnJnIig
   o/oOQzUVtxdOyQ5fufjFx28tvPYTr9uMVjq/NhBV2HXOXUEc4Hx+bYEQs
   I=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 115274066
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ibdxY62l44Xp5TkP5vbD5dJwkn2cJEfYwER7XKvMYLTBsI5bpzMPm
 mUWDD/Uaa2KZGLxcttyb9+/oEIBsMOAzN5rSAVppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDW1p+
 /0fcCA0QSuznOyY3aqkUed+r5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1EZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137KVwn+jBtx6+LuQx9VPu3LU6kEvChQ/UEXqoffnrBevVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQNkvtctzSTl00
 FaMxontHWY27+DTTm+B/LCJqz/0ITISMWIJeS4DS00C/sXnp4YwyBnIS76PDZKIszE8Ihmoq
 xjikcT0r+57YRIjv0ljwW36vg==
IronPort-HdrOrdr: A9a23:H+Icg6E0Z4Bc+XyopLqEU8eALOsnbusQ8zAXPo5KKCC9Ffbo8f
 xG/c5rsiMc7Qx6ZJhOo7290cW7LU80sKQFgrX409+ZLXXbUSiTXfxfBbKL+UyeJ8SGzJ8i6U
 4DSchD4azLfDxHZJ3BkXCF+r8bqbHtzEnrv5a9854Kd25XgspbnmJE42igfHGebTM2dKYRJd
 6z5tdnuzHlQngedMK9b0N1JdTrlpnklI/GfRVDPBIs6BCPgTS0gYSKaCSw71MxUy5v3bxnym
 TOkxX46qK/99m3xwTRzXW71eUnpPLRjvVCGe2RgYwuJjLghh3AXvUYZ4G/
X-Talos-CUID: 9a23:NKbbXWwszjbm85hRzc1oBgUYFucrc3qF3E7/GH+jB0h0UKKOR025rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Aud4IOA9rBf1IvHYnfovvyxCQf/ZDxp+BT2wgrZc?=
 =?us-ascii?q?PksyaZCx+ZRHEnTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,213,1684814400"; 
   d="scan'208";a="115274066"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8sNwryxuySbuT9pNmYR1k96eBexGTtkb2ku+IRQeXIcXOsDvHugRW+97nXevoGRInz4s/C2xrgFZlu5CwNiSB2ATRezeiGcP9odimtCTmmTx1+rqMS2/EbczxsTSNIoMTgV1TzZJWrAx1kXYn+rywvqy9Me1Kzk+bDLhUGl5TMDDdhdZixeCrnTDtqEu0zTiSNFqANbEql/uiT0QcB4G1Y5/49c2n+GNIehzQ/rwjpITYPT6ukLskuUmu8TNnc87903T0OcrjPD/KRtopWCkA5fNqqMvF0ZouEWEXCmdpXs4M30ATgbm7xcCHl01bxqEj0zUX31tBwL0JGS7CgWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rKHUeiYisf/q/yzFUZJCgj5s4jO4cu7ZwD//Ugdv08=;
 b=hTbRQSnsr15i47BIr3Cgqt6Ro6jwDqcYZxEQusl7AoueRt1EES49rBuOEbwpE3wG8dWL7M2ImL6WQH/FE17jJcvrQZFJMblRtLVkekukIO6GDFs5lXIwSe0QduVswvYcW2H43wEPoGg89RCkQw2EEbhML3YQBwBb2Q9eTfLPMPZy638cAn4tPmOwj4q9C7j3YzPUGGMQkqk6TxeCOUx/IEOYArpwwTWiLywPZ/2piKzqb2U4TzdauXwgwX0glFAlRD0KcmOZr66h+6YkKsGp1kvyz141d8vbHlX/AvcOwYNO1y2Zi70vtHJgJa9ApyimJIYXF7ANnrq8rXmqo6HJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rKHUeiYisf/q/yzFUZJCgj5s4jO4cu7ZwD//Ugdv08=;
 b=fCDJ+7NbD9PaaP8iIlswINK9p0ev7ImXfgBD3Dvw6hos+jVr2Msd7+XXug9Sc+GYAKC7gUoTW8mO/uGRzCIZhGBodTqTXfIiCpc5PRhjOVKjQGSEpC01LIZoxQ3QnN5dVe2PzTarJ3ioaJEleJ773bKsGyrleCcM1FDmf/7ZETc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Jul 2023 11:23:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH] ts-xen-build-prep: force use of git protocol v2
Message-ID: <ZLZaAQu7gD5Y0KZa@MacBook-Air-de-Roger.local>
References: <20230717141745.33470-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717141745.33470-1-anthony.perard@citrix.com>
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 16985a79-37d5-4027-60f6-08db8770a06c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RaZJxFKMehar7mk5ePG/JoRSV3JMQb+Qb4PZ1zEQefyeCBoPHW2tXia5kfb2aQVbnlISEzRCDnmX/wK5aZjMXKaIxEn0Iere7nWFhNSaXc2Ez8UQ+niQCgSDq8E2XOFc/1V7Tr+5aPmXVyfr7bYt8fna6tXBA1+7X82EoKxFEC8oq+AOYZy4cY75fQkeN7NVTVVwnR1Ehg7lqyUTDB4P+19Is9gTMxBMmZiEfoocufZwpJmQeUP/2FiySupOXSggY6l1Kjlz2ml4ksZTB0pyfk8DCH4Yjquzp7OBNjS14BcDrGzD7pOnH20fDB0NeVw1wJqx5CmHJbIZuqY8Mt71ab4XhTcCMVgQ0CjEB3zzbqsjNGlBND3GrtrucqrstIP920AsOTrtyQ++GnNoWiP6RTvl9Y0CdKADdvCiveukU4naZ1jmgWh+KhhDndHFcxgQgwILvCAc+vt+4U+nOCNwM4cCo3dtVZE9O950pfH0VHeB/qOhK0oN9S3HJ2ii9z4wZkuvJIGcULx6On+kzJfMjhTkbmGvD0yVvRxeP7gj+ec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(41300700001)(4326008)(66946007)(66476007)(6636002)(66556008)(316002)(2906002)(478600001)(6862004)(8676002)(8936002)(5660300002)(6666004)(6486002)(966005)(9686003)(6512007)(26005)(85182001)(186003)(83380400001)(38100700002)(82960400001)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzJKdjgzYzkxb0NOM1Y4ak93V05IWGFiMnhSYS9nSlRpZEdkbnZiSW5waVc4?=
 =?utf-8?B?eXdpNERJVEpldWR6TU00WVVHQnNLS1VxWWZQQmZHcnIzdkhKeCtFU1ZJcWNQ?=
 =?utf-8?B?SWlLZHJmQUZwbTNzekhzTC9VWFk5VDEzTUJFQ0hLN0F2NFkwUHEzNjZBSEtN?=
 =?utf-8?B?R2pKdmdTMVQrNEY0YjRScXQrTlZrcW5mTHNINTVTWVJ5SVdUS0dJaEpLN3A3?=
 =?utf-8?B?cThpVURXT0U1QmhNVko1NVlTZEdEZHg1YStIVEpmUDFaVFVRWUFtRnVSV0dm?=
 =?utf-8?B?WFlmaTd5amlWczM1SmZSMmpLMk5rbjZaWGdwUjk0TEZnbWs1TGpCbENsNW1K?=
 =?utf-8?B?UDRFVHJad2J3M1VDYW01L3VMT2JUL2QwSjBNRWFQOHVBMlJ6eVlPTEtYMTAv?=
 =?utf-8?B?cWp0Z01XY09uY0xmNzluSHM1b3ZBL29xRWdiV013OGdMR0hkWDBlTDVqT2Nv?=
 =?utf-8?B?WW5HbEJ0MFFEd1kxdjRhNzhESlhHMHRYU3BHeUVXRlBhbTZ5ZnVPVERpVFpU?=
 =?utf-8?B?NlJOTWY0eXBkU3RURlFNd2owR1AxYVYzOTlHZk1jQUU4Q244TS9telBJUHkz?=
 =?utf-8?B?SHp2WVpwQU5CeHNWZjZEY2REWVBXczZQMnlGRlBpVTFDNTJLMElBcUd5R3Nx?=
 =?utf-8?B?WW1CMEtNbk1KYStVTm1DU1NxQy9MaWRmbDFaVHdHMmdmZ0FaZ1dTdzR4QnNW?=
 =?utf-8?B?VGdhOWlwYmdCZGpjYlNWSU1KSUtzY3BocUFqRjk2ZVBQYkxPc1gvRlFOQmRU?=
 =?utf-8?B?aG5KTXJHRlRzSVpjV05HSE56cHN5dzVhRi8xSkQrbFU2ejRHZlU4RE56OElO?=
 =?utf-8?B?Z3l6am9IekFoWjZEWC9VVDFEWEovZGpmRVo5L2pmY0VIU29rOTRqVlVvWVJy?=
 =?utf-8?B?WnV3bmNSNXJzQmF5NDJFbEp6eFJuNmhmUmlmMHBDK3ljNVI3M3VFd0RVa1Vh?=
 =?utf-8?B?dW1LcmQyYisxOS9mbzdrWE1QTk04b1I2bGE3SE92ZldHaE5JeDd4ejQ1RzBn?=
 =?utf-8?B?YWVRTUJ4bkxNM2Faek5xOEpzRkcrLzIrQ2lPdlY4UnBvUitLOG41MU8rU2JU?=
 =?utf-8?B?b3hjQXhTTnZZQWZkWDlvRXQ0NmMwSGkwbkxRVlBYUyt1MUpZa2xoWUJkRE9C?=
 =?utf-8?B?VGxHTXdmbERXRlRveG4rM1NpSXYzVzFSclZzbnVvR2xrdGZ5bVhkMGNOVE5S?=
 =?utf-8?B?WjJuRWZhV0tYcDhOaXBtaVIrRkZtQ0ZBRHdHbGpyT0srMDZRSFl0cmMwUzJF?=
 =?utf-8?B?aTVURG00NUl3Rjc5d2pKclVZM2lMSlp2RThDVmk2TlFjdmNvWjZRUzVSTXV0?=
 =?utf-8?B?S1NkeUJNUkZRUTE4U1FWVTV5ZEcvekx0Wm5Sb2hUUjAvekNzdXdneEFFTkVF?=
 =?utf-8?B?SVFpaEZVWGVkQk1waDcraDRldmk0cjdneGNxeHNFZWYxN2gwVmxLeTVqWDhK?=
 =?utf-8?B?OWhQNVNTQ0p4OEs1a21qajdDMlNzb0paRnozZyt2SnhER1RnRFRuemF0SnZI?=
 =?utf-8?B?eGl3OURWL2hsVmxGa0VtdStuWStEc3o0aTIwVWZnREt2ei9PdEFVcThQeTd3?=
 =?utf-8?B?RUlzellEazhxVGdoSE8zdXBkOUFJbmNvaXVaVmhING9oZnV2YnJieVRmNk1m?=
 =?utf-8?B?Y0Q0ZW9nYXY0S0pQSmZod01KYWdPSU50bTIweXkzRXM3cVViSlBTT2RMNkNv?=
 =?utf-8?B?a1lpUDB6KzA5RlFUYkxUZjhsbUhzUWdDaURkUHVsVjZncjRVZnNvL09EVFFZ?=
 =?utf-8?B?aFZxclBQeGRkSkp6S1czUmhqOW53eVBDdTJONzVHKzEyaTVuNGdKTDZhQzU5?=
 =?utf-8?B?TzZPRllRSTdnejVsamhFUkdGQ0l5U1hBRTlvSll6Y2VOdTY4aEIrSXNYdWJi?=
 =?utf-8?B?SDBialByTzB2azFMeWdzV3R2eWxVK09GQWpEemhQZ0M1bDVPNFEwT2JnVEN6?=
 =?utf-8?B?UHZ5RVRQZzh2cnRuMVF2Tkw2SS93UjRWemlVVzZ4QTZtUkVvemdzaFZXam1Z?=
 =?utf-8?B?ejB0eFl1amZmbWVvbEdFMmFEZjd0YUVQTjN6OUhiYUlseVo0ajNQY3VESzJl?=
 =?utf-8?B?QmZZSk9qZ0NNZlB3OHAyZzBET1dlSkVnaXkxZ2QzVDcvbVJkYkVsVURxMGpu?=
 =?utf-8?Q?kTY7C7EIKv8/lliowcUhcLvAr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g/pJwyra2RKOMIxO8uYBEvLd3z7UVzVgCo+9oPEKJoXsHiq+n6rjOJH3Qumj3DbUCeHiMgXZgrru9pt0YL9niwVMzl9NPQnM9BvgREDWIr4HIw+FVcdgDRoHamKLrURS4XmLJMPIZe0H6/A9M3pv8Ftb0VgIwG3qiPwGFggZ8WNp5z+QeQmS4iE/8knNbRK37DqCF4+81/1Wx0SKC+n/mCUdJ4SBiON9fOFoAjp8/JKuXhErhVX4EJwIg4uA4/061aZTfbty/yvMHUHhiSqJeJH17gqbaTUOxq7y5rnWnkFzrF0oBkuN2Q6GcXqFlorVpYVXbhG66IG4Qbvpf2PgKFO+MdDwUoEh5SantpqNyUzBpC3y/bdl2UwmieFMA3Frfiebh6w2SWzITPSR9r0kJ6zcdzWxe4iiCgY/7modLqyBpO2sTNLes4YfVCCdV5rKL4NeR5cwA6dVOBYdtEMfxHryKvAiSGYL6PS8UQwxZpJ7A9x9m39a/LolvD/YEwmdFIl4BjIW5htlMthTkSaZf0Ev0JzXNFJVVOK9Cq92MlHnfgME1qk9rOGvAUaxeEz0aXBi6dadP1DHVkkuIVwNw4igSVXo53OE5AfFjsS1P9JAh+yeeNv4g7e7EYNIFe0D/r+cPD/a+OcdgINtMaiZHe0wPYtTyO6COUI1oStGshid0+6OunLyIkihEaFMesAIq8Mf+fhfGAz3BcIQO5YKSL1Qh3kRtTdosQiFbUZ0s3n1+NkBOeuPgiYqsfBUZXmSYWWHIXE0IhwV5VLHMyTa3g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16985a79-37d5-4027-60f6-08db8770a06c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:23:20.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2MuQIzXUeIKvVvWZbW7YKgL9w38J3fTmwZ44Nr4VR7VJdd21oPUIvykiHbJqMKXNSvxrFc+irIsUTTTJjKwzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6682

On Mon, Jul 17, 2023 at 03:17:45PM +0100, Anthony PERARD wrote:
> Recent version of QEMU (to be 8.1) started to use meson subproject to
> clone extra repo. With the example of the subproject "dtc", they do a
> shallow clone with a sha1. Meson end up running:
> 
>     git fetch --depth 1 origin b6910bec11614980a21e46fbccc35934b671bd81
> 
> This command fails. I think the error message is something like "the
> remote end hung up unexpectedly", on Debian Buster. A more useful
> message with more recent version of git seems to be "couldn't find
> remote ref".
> 
> If we allow git to communicate with the protocol v2, then the shallow
> clone works. But git on buster still use v1 by default. Force it to
> use v2.
> 
> This needs a git-cache-proxy version that can allow to switch to v2 of
> the protocol. A bug is open upstream to track this change:
>     https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1040476
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

