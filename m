Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B67431A74
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212223.370017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSQo-0008IO-QZ; Mon, 18 Oct 2021 13:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212223.370017; Mon, 18 Oct 2021 13:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSQo-0008GD-Mi; Mon, 18 Oct 2021 13:11:58 +0000
Received: by outflank-mailman (input) for mailman id 212223;
 Mon, 18 Oct 2021 13:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcSQm-0008G4-Sj
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:11:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c98a0cc3-610d-4eb2-b0b6-5b0272538b9c;
 Mon, 18 Oct 2021 13:11:55 +0000 (UTC)
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
X-Inumbo-ID: c98a0cc3-610d-4eb2-b0b6-5b0272538b9c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634562715;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=y1WgyZ/83puoQO+6ZeJJBQkuwmWGJIphjlhjEqDOzNI=;
  b=aj6f443zO9W5FLenhFhVYYi4uIj85FybSlWyEJYMv7ttzHr2yffYrUpx
   +C6GA16Q0+5HgG4R79nbWgeQzNVnGC17tdTJ5g2WAsmkRIWwHafC8vA5V
   ob3H0fuxvxiZomAY1/9a621YQzxGu+6y6RkNNi6XIC5w65L4hID0toViw
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i5DsyNPnx0XIsLmFqumpQluR2SN369j7v3iLu5UT/r+PGXOm1p+QIuc8zDujpEBpZOHVgJOpdZ
 8v6cLqH3pf8w5ApHVaXLBjZpsm8GDdSEaGtAlq9xXOjJ9eQYJrPw5SPRUGElpRh7k+w5Dv6D8K
 sZJ/pBgZYYARQ/kX9Mdj+AmkqGI35t/5wlP7aDUT/8CF8erxAva8/jSNKj5mjAwP658O5Pqmpd
 GHKAKEV7uCf0lEafk6lR/dvj60+FlmSW295cQ3nlVn6nfWOdhBj9SBNtiVY4Gc5y4ATBG/rGTI
 VUekISWA6Fj0vzfQsP2xugnf
X-SBRS: 5.1
X-MesageID: 54996407
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NGyNfa/ktD5wGcrLq9vWDrUDB3mTJUtcMsCJ2f8bNWPcYEJGY0x3z
 2YWXDvVMvmJYjf9Kot/bdvg8R4FvpDQnNVkGwFl+CE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh2w
 vZCuoyIEz41O47Nx+AsVyVZGXFHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgGZh2JwWQp4yY
 eI/dzVUTQXyQCFfN34cC6NghuKXoUDGJmgwRFW9+vNsvjm7IBZK+LPqNd/UZsCHX959jkuev
 njB/WnyHlcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOToOa7ol6zXcpFL
 E4Z8TZoqrI9nGSpRNTgWxyzoFafowURHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC0
 VWqkNz5PWZWrLi2SC2Zx7OorDniAH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G/S8nBv71kHpYtSjf/jpAGY6965jsGRFlZd2+nBYo6yAuqVjqaebIu09UOT0/9EKIuIJrVql
 ClZw5bAhAzi4JfkqcBsfAnvNOzxjxpmGGeF6bKKI3XH3278k5JEVdsIiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+Toi5B62FNIYSOMkZmOq7EMdGPx/4M4fFyxBErE3CE
 c3DLZbE4YgyWMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJINA8wPkJy76Vp
 xlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJOBPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:vzv4VqxGMUpd6y1qXA2AKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="54996407"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3Cg2HfCcHLBg3GpnBX+PRInoJ1XSsEqdqsjgvgE9drbbd18ETsYDcYB9O3+6emqfKCE0NsT+eznsFfjKSuKS9gdWGPj0CcW3tcwsn0VbitChG88EvvarLbmQ7LG2bcH8z0x0wg8EZRyFopXtppWiq0Xh10pxYbr+BMi/edoCMkO7o9krcU5IE886Z4qNSvI49aWU73zPieGv7HSveAKMYyTeuN7QCKwCCDyVR+hvnJVuR3r3OA7NRcdFpYvoVdACJSqpHfUz+lAPHb1LkhB4JcODyojRXZZRz1w+rFx6QMTbQVb1LHWRGZmBFxjWWDEfaIEXAVDOSMiGnh53uGPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4MAdkY7uFevrVJzF/vr5+D/Gv/H/dd8ilzLcrqW3Bw=;
 b=O+AsIoTVBhgVS91b321qhTmUmmwRL5j8Q9RkoK+PnwmVr8ZMysAnIQZuVZKbkczGyQOeg/6NxoVZWwdydAp2E4qKfcGoLr+fZeKBaVMmizu3yLvzynKWqfesAVIvIkj42vp8MAMRR2YdcQPEDVBA27IxcBjzq9i/nhvnFSI6vJsJ51HFxY7rferhytfXuehR+TtKTOyTqEUZ8e2reSFhQZs/dCyNuBz2tDspPEY/GbF6Zn0nTnKX2cSJFNazO8t3Kjee7lZENXmurKUFrltrfnE9PU9PckgD/bY1hgy75UiH+bQz2ytBRf57gqC2v8+B/q0rdY4aLT+owilFrxCyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4MAdkY7uFevrVJzF/vr5+D/Gv/H/dd8ilzLcrqW3Bw=;
 b=Ui3VBN68KrQXv8xMNhDTY4YRXHj+g7nixfRWStIguaEmnE8asQPGkc3nRmU4FFTVX9t9PhDfH6yBbo0L4QbiWp+zr+5Lqi4s9u9qP82Um1eTrJlu61tzu9ex5U8r6RheKCrP05tVgcrcEi4l1a28OgVwhBai1Jbs2DOGvxFJEpw=
Date: Mon, 18 Oct 2021 15:11:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, <committers@xenproject.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.16 development update
Message-ID: <YW1yjgYvdQS+h7NY@MacBook-Air-de-Roger.local>
References: <24913.54299.590779.955301@mariner.uk.xensource.com>
 <24925.34307.187952.463474@mariner.uk.xensource.com>
 <e644a1d4-a7a2-0554-f639-e19ba3102294@suse.com>
 <24941.20900.439531.733506@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24941.20900.439531.733506@mariner.uk.xensource.com>
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78bfa1d6-fe85-4ca0-506f-08d99238d660
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR03MB25542E260C783AE0E2C30F778FBC9@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDmgHdqhPUpZii6qRDFJoFKcJcqIaVs1TIfLuz8JzubOM4io0m70N6BTPbcR1dbZFoJ9ZOaNxnvuSXZAfuXH3FuDAe4izA67ojWAk0NiLItDaMBsgSBVk7GfeL7fYk6b4rdnFEPzKPt4D9BWtRvlyNtb347dPo6B4q6suW5Hxv2wis15qAd2IvEd9VKT5+W/pb4lLiHZGFQDMaoiWgqzW/0QeLH37i6Rvk3V6wWjSn7gvG4hLHA+rmKUKENB0GgDmXkXnW+TSOnWYoiPHdc1Z0bHTFZsiYduofn3TNCwgOgHPQPAS7dA+fCVILlf8DLXzZ2B2oyZmqxnth8r27BGpl/t3c6J+wUiN54EiIHXdEnG4Ep0OHRvnRbj6YOnJl2gMs/HSkwy8Ilp20OB7XEVy/hD+bFxlpTSx5wCzq8EbLJuUJGRdV/Bpu+AXbzQxNCCYHwFBqw2q8XnaummDzrpgXCB9niwoGbiGhz+v0XoMzjzWOdfhksJpH/zyDP8FBAy+23Gm94G4x0Bs7ZyFKgUPGw0dOwSBKp3uroTsRbJKns5MV/5SpyM7fSE78zKJLNi3niom4pFx5XSYcTpY/yC0wROhTeBqkbZCBlk+0FNHSMD8VXoWZ33UEZDUE9xxncaz5lNo1HBUGDNhq+Fr6iPv93bp8nVZ/SJDnFXuHoYiY1Btc5a6HRjTWPbXmZxfXOmTu83jqGXyloTbD5Yg41oYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(4326008)(508600001)(9686003)(6666004)(86362001)(6486002)(26005)(82960400001)(15650500001)(38100700002)(956004)(66556008)(7116003)(186003)(8676002)(2906002)(83380400001)(316002)(5660300002)(6916009)(66946007)(85182001)(6496006)(66476007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpyTWNwVys5ZHVDL2V5d3pQNE5kQWlxSmsyNmNiREJxRDdDcmdudjBGelhs?=
 =?utf-8?B?V3RaU215Z0hFWUk2VXRpbHp0dHZrNUFiaE5KemJvTURJcXFWaXpFRnZIT09X?=
 =?utf-8?B?aER2blc3OXpQcmNlYStvQmdzcHVXcVVPS3E2SkNpWjVPMW5FU0VtT3ZsOUpq?=
 =?utf-8?B?SFRXKytScFhQV0JaaDZNaE9VK3JoSklEeDJneXVuN01KN2pDQWhkeFIxK2xK?=
 =?utf-8?B?alh1KzgxSUs1OE1aZXg1Q2NkSDNvRStDOU9pMUdmUWd2NHlrR29oZHgxbDNG?=
 =?utf-8?B?OXcxYittNmlzVVdTM2dhMFJBbFRmdEVvRXFBQ0NsbUlFcmpIdFVSTEY4SzB3?=
 =?utf-8?B?VndOcFdoRXpRcnNvVVY4cnJ4UDdrVEhlVFdNMmhLL1AxOVVtQUxzTG9xdGZZ?=
 =?utf-8?B?MGRjN01pbnZJQnMyMml1bkZSNHU4R216Y0x2N2wyR08vSW1sdFBvM095b3hL?=
 =?utf-8?B?Nys4V29Lbng1UGNhUk5YeVdvT0pRb3d6WkNSR0dBUVcwblQvMGlCenNaZFRC?=
 =?utf-8?B?aFMzdE1KM2Z5c0hZWjAwUGdVb2VuNGZrdncrOW9FRkd4eFQ1TEIyRDRZVlJq?=
 =?utf-8?B?WjUyWEE3S3VGdTk1L0ZkTEphUVFVNW1yczIrQ2NWRnhwSmtYTzBVTXhMaFhS?=
 =?utf-8?B?YjFUaU5oSUFRMHpuVnB6cVZ4dHVvZEpsZ21tTy9mNGxQZlA4dVlmNW4vNzdE?=
 =?utf-8?B?OU5nbnJ1dVVpVDA0eDZCa21IOFB0eGVxcjNBRjltZjVyV2szTnRLMitHZ1dU?=
 =?utf-8?B?NnRrRVAxS25HRzNNVzVIQXJXdktxVXZmd2ROeTF2YmxHZ2ZRZW9ocjZIemF3?=
 =?utf-8?B?QkllS0hiQng1UWhPc0dickNkeW5xSzZsbW1say9RRktaU2RYRjdiYWlwYUFJ?=
 =?utf-8?B?citZSzJtTG1ENmdTcW1aZkpaWmtweXhYRHFxb0hNL1lxWG1SQSs3OUp2TWVr?=
 =?utf-8?B?YzNNL0pPcFBzN1VBdjBSN1FEcjJMM1Y0d3ErUUNDSmlsVEZrT0svdCtsM25s?=
 =?utf-8?B?RHV1ZVM0aXJXL0UrWjFYc3hFZUdSbWVpMld4a1Bhc1k2YVkwbndBTkRHUlRi?=
 =?utf-8?B?RWEySnRuRUhVOHIxMlRuL083RVFWak9DcmlwbVdiNWl1bmN1eFZCY0d5MnlK?=
 =?utf-8?B?TmphTExIYzFYbUtpYm9EMTRMWHBNYVZHYVpGeC8zeDRFeFBYb2lPaWlVdXB2?=
 =?utf-8?B?aUV4bUwzcncxRldkc3E3ditCdVpTM2xwN3BKQUpNd1NSVW1rYmgzb2d3K204?=
 =?utf-8?B?a3dFcUNzTURTYld1dThzYlBOVS9La3c5aTZnckhEbktzSmI0KzJwR2FUT1RY?=
 =?utf-8?B?bW0rbVFMcmwxWjdkVkFvRWN1bWxOcFhTYjE2bXB3d3RaMUo5VjBtZlZxelF2?=
 =?utf-8?B?RmF2a1lMVUh5enoxRTI2M1FsbjFyRXhOSlB3MHhWZGJRQXU0RTZzL1Q5MHkx?=
 =?utf-8?B?WkVmczBWUm9jemVCMk1LSStwK1dZVnZHOU5GUG90NnRJWFVUUktXd1phVmNJ?=
 =?utf-8?B?aGhzTUdLV2xSWGpwYTY5QmsrR3FXcUJzTWMzdkxJZGhHT2hOeFd1M1lmeVRM?=
 =?utf-8?B?UkRXaXBiaXJKV2VPVGpOUWtCaHZ6UFNkdExzVzNTT3FDcW1zOGdwZlB4QnlM?=
 =?utf-8?B?VTJIY3YwclhUTEM2dzhoUjFFUTZpb2IvZ3NMZ1lZU1R4U0VrR2dUS0ZaUThY?=
 =?utf-8?B?QVNEdXd3WVVEcHd4MjlyanRZVU9CWHhQbENJTk52K3dreWVTOVNNYTJrdHRB?=
 =?utf-8?Q?BIqAZrhQwNZ9z1xbdta+6Gn+WVl1EVOX1MqSYkP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bfa1d6-fe85-4ca0-506f-08d99238d660
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:11:46.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+OfUQrgtG079rcnNrvsR3R1PAriiCbVwIVjak3z1ARRwpHQnA37KVaSYd5V1i7l47RrXLK7UlsZZ5sFK3nt5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 11:51:16AM +0100, Ian Jackson wrote:
> Jan Beulich writes ("Re: Xen 4.16 development update"):
> > Now that we're here, I of course have given up on any of the pending
> > non-bugfix patches to make 4.16. But I very much hope 4.16 won't go
> > out with known bugs having fixes available. Therefore I've pinged (in
> > some cases again):
> > 
> > x86/CPUID: don't shrink hypervisor leaves
> > x86emul: de-duplicate scatters to the same linear address
> > x86/AMD: make HT range dynamic for Fam17 and up
> > x86/PV: address odd UB in I/O emulation
> > x86/xstate: reset cached register values on resume
> > x86/altp2m: don't consider "active" when enabling failed
> > x86/PV: '0' debug key stack dumping adjustments [at least the first 2]
> > x86/paging: restrict physical address width reported to guests
> > x86/PoD: defer nested P2M flushes
> > 
> > In principle "x86: more or less log-dirty related improvements" also
> > contains a number of bug fixes, but the way this series is stuck
> > made me not include it in the pings.
> > 
> > I've tried to remember to Cc you on these pings, but I may not have
> > succeeded in doing so.
> 
> Thanks.  I got at least most of them.
> 
> Roger, would you be able to review these changes ?

Yes, already on it :).

Roger.

