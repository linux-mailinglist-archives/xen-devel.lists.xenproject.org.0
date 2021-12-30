Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAD481F54
	for <lists+xen-devel@lfdr.de>; Thu, 30 Dec 2021 19:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252513.433569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n30X9-0007im-Ru; Thu, 30 Dec 2021 18:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252513.433569; Thu, 30 Dec 2021 18:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n30X9-0007g2-Nv; Thu, 30 Dec 2021 18:52:15 +0000
Received: by outflank-mailman (input) for mailman id 252513;
 Thu, 30 Dec 2021 18:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRWN=RP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n30X6-0007fw-Sq
 for xen-devel@lists.xenproject.org; Thu, 30 Dec 2021 18:52:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9523ca41-69a1-11ec-9ce5-af14b9085ebd;
 Thu, 30 Dec 2021 19:52:09 +0100 (CET)
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
X-Inumbo-ID: 9523ca41-69a1-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640890330;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QMN2CVEPIXWxLRu4mL5JdhYoiURI5aK72/IrCobcaDU=;
  b=aIlQhr+Id6pXIjXvlJ/DihUJOdV6zBHTuiQa08pfvMHP445TqflebNRk
   hXkYt0h9S2YB4z97RaDXD+iNmY+iBj1ejvBUlimCGfsAWC0S/wIfapt/F
   r/1SVCgeY4RkK6CQZCxaMpiGcxpfBKLmgmtEFruaPfp418ZXEkj0vDZW/
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8uMafof8fMWo+3R1bNMS64qhUWngWlQyJtTEDW6bAukmNflye5NVzvieLJFuGQV5Nnfe9ReDvv
 z0t981PO6RwaqMyXt+nzTE54Yqvsey6GsOGe2LUo8XKCm6KwmwX8bgLCLjNcIptb1l9mJ1F3L4
 HYCYq975FXGJmV8gbmw9BFs9CVboJlL0dYy90jwAZz58L7tmxTcJke9RlQJEUl4vXUEIha7Hd7
 eF5jyV+UlJueFvpx22PWr6E0HUEf8dQxG/YAT1SRj1oxJxXWv8V3BprHAmvFwFQdMjLsEhlFZ8
 4RW8obAJcEj3AKVeo5q/vC8j
X-SBRS: 5.1
X-MesageID: 60971728
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DyQuHqP4oL2r9ZXvrR17kMFynXyQoLVcMsEvi/4bfWQNrUp3gT1Rz
 WYYWziAMq6PMGfyKotzO4+/9EkDsJ/RzNBiSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400k7w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo22mtPJa9
 Iwdj8OxUignJbHUocUfczANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uStIABg21g7ixINeSZX
 cYUamRQVR/jYF5AE34WUso9hfj90xETdBUH8QnI9MLb+VP73AF3lbTgLtfRUtiLXtlO2FaVo
 Hrc+Gb0CQ1cM8aQoRKL82ihg+LTkCThcJ8JGaejsOVtnUeYy2IUEhIbE122vZGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQ+FGvnDUgAopqTOwhxw+W1rLtwgS5Lz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj70hu+aTNT8D2BN1bQ9xawfRGp+ZgPf1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpybzJdsMuGknfh4B3iM4ldnBO
 hC7VeR5vsE7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5HXlk4BCbKmOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:3UGtUqmJHWwDLTLHl1FxIFOS1s/pDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,248,1635220800"; 
   d="scan'208";a="60971728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrJ4Kfg9sRyhvPBFZPuAdhVFNeb2vRCkh01IVGsIptEouNh9kYfGGBwREeN3g2Rk/tsHXwPiKqy9cqUmdsWTouMXK6AoCHRjXrrX74Tf22rqUtcRh7ThIngdK58vvP4hpguUdzO4zcBWKrUCaWRH16MvAThDzcyeQ91Fv+W4/5XmxMp8VaqdVy+IpwReGvTcTvC2bl7pV/AuChCl5MPEjAje5dmDuQ4TA6e4zoMtygc+kM9OKionmEK0VsZj6vWZjljgs+Ku620nHWZVxVl6GF+u+MQOtRL6gRpUTi5h7mTXI3iqGn1P/6oGeINhxeZevYaH4aSfdMVc5PdahtlwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54Dtz6S4QjaRdfgFg0rffxQ27b3abDwbnaOO/zmAAKo=;
 b=gQ91Qu2AjCeXHeZARnXzwSpSlhkg8PrOeyXLQdTh05rvuru1zMrlDwvFiamFC4Mb48gWezayNuliFTQh2kGSIuWYmENlMal7V95B+WPb6+8QRzT3Yh4KfcqOoIo/3BJTX7fz4zVg9fCAmR7EZuUrV5h1vls1GwtjnpFiB/K7iL48uk2VtRz814AzPOwJy24pNl7fMJ2fVDHvLd7+XPTL9XPYC0wGhqagtb2Z4stBY+6smh6sDz9XLANfUQ2S/FaYOInqClbYocnjJE8u6hNuxg1X4cWhBv2qNAwSOxfLOq9rqhrgiwERTrPBV/DhWZ1e1yQKBDZV+CpAvCPdDCRelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54Dtz6S4QjaRdfgFg0rffxQ27b3abDwbnaOO/zmAAKo=;
 b=DETI/GNKRYmCFQhqalbdUkUnitXlAcLMwgDc0dVGQZYUrrqyBsTL9dC3OOOm527IM5eiDlUkvmYq9RU7E92CIr10bDPVrPJ30ZVFKOAKoTz3SK/iv9TiU7+Nn0J5NRXg5QJkwmMId489SgSp8c+rwtUc4zGjXKE0xXrLfpA/8hU=
Date: Thu, 30 Dec 2021 19:51:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <Yc3/ytwCHFtR1BLi@Air-de-Roger>
References: <YcWuCgYWestnlDSH@Air-de-Roger>
 <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger>
 <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger>
 <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
X-ClientProxiedBy: MRXP264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63050e0a-e188-4dca-c04d-08d9cbc576eb
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2553623654938713457C13338F459@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zzTx60luQAsoCtPKjirdj9zujHyaXceb8Mh4f/Rw+NOLbhsY/4Hu7ngI1YfNUZIdY2JWesZ7OMfEWJza1c2aceeq5McA+dhfyc6+BFImeh5BZu7Ym1+hXz5IqQeKd8SmNKSk1CZJf58sg6IhYOdd+Fz7mGAeCxN+TELJ/HoHDNoGh7NqDyjwm4IEji3ZqxA33J2yhC0Va8HeZYtbvBJpcNnQvGT21K/6X5XbFoUZYvocYnABD2tCfw9On/bjUSyWO/M6jEpDGxof/bv92VKdBQs+9WKk4GJDkdz1VEL0kZgLC39KO5/M4Wqn9TlAI7sCmJcOOuUVUiKgXyffnMSP1+LD+TtLL9agDa/yQHS/iwB+wVN5ce3qzrvfgEO5ctD20QhjXuQGnknSDBfa48TT3s0TH4jPETiZLewinJwzlQSvT0nezk0kAOL+YxGx4cdh4bHYVJOUWugk6uhL6m6e59uFla1HHHnhqK2uGjL7euw1LMre7Yqw2dCn+enxLFqnGvnGXU0ZWMDnzMumEK+VIQcj3UD9tPM5mBUAGIJ4s/mfwdeF95GKICQUnx4jxixsq+yXOQG4BiyHf6FGaMtyzBbtEIRUhb9513MYJPrz/xP6tM2XyrZgptOI3lNf4XdgIWkRa68vgWSuNwc8uVqag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6506007)(6486002)(5660300002)(30864003)(83380400001)(85182001)(26005)(38100700002)(82960400001)(186003)(316002)(4326008)(53546011)(6512007)(9686003)(8676002)(2906002)(8936002)(86362001)(6666004)(508600001)(66556008)(33716001)(66476007)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytyMmwwZG1NOWZtamlucFJTVlNldi9BUGZkWmhPbXl2aWtZMVZOaFlrRGMy?=
 =?utf-8?B?eStoMEYyeGlndXowMmI0NjNKUEZKeDZ0NkJKSGVzbnE0Q1cxRUVhbDU2QUNz?=
 =?utf-8?B?NzFoWm82V0xLUWExYlRYMzNKSlozRWRkNUY4UFF2V0p0TXl3aGFKRU9veEla?=
 =?utf-8?B?T3M3Z3gxVDRkZ25NQmRmRk1hbzgxYUtHNGUvbHVDMmtFb215MndXNmZWenNQ?=
 =?utf-8?B?VkNiMi9uNWpOMUlrWTNtc29BTURGTDFwTGNkbDZsVWM1cG9ic21lUEdPMnhM?=
 =?utf-8?B?KzRCVFlGMVpMYVhSdVh3Z05McWs4LzB5RTJydEluZnprQVhpaDA1azlPSk9L?=
 =?utf-8?B?eFVvYWw2Y2ZqbUZ6Tmx6eEw3Q1VIUEpjeHdWZmw3TU9sZFZkRXpoUVdzNlFi?=
 =?utf-8?B?YnY0V0dwTnkrRVFoMWxNQnJuOG53VklZbnk1TWR0em1JSmNiUWZabmpqTlZW?=
 =?utf-8?B?NG9uQ1B3VlVkK0k4MTQzakVqRHFmS21ja000TjZ3cGwzTEZ3ZXhKaUwzdjZt?=
 =?utf-8?B?TitUdENxNmNoVU85Z3VtNGd5SkdPNXdaZEliSDNLMEpEZzN1emRsdXRxVi9C?=
 =?utf-8?B?UlRQL051R0s0bkhSUUFRUFg1alNPVm5jOWlmTStuZE5jWjlNOXFub1BnK0VB?=
 =?utf-8?B?QWFuM1hzWDlRWTM4M0hKVEcwcG9zeENMN0RGeGR3cldXNjIwckM3TlNsVXhO?=
 =?utf-8?B?cUZ6cDR1TWdaQUtsVWNIR3p5V3dHSVhXcEtZcUlQaHNKMTZod3dEWWF2V3JG?=
 =?utf-8?B?bk11V2JCb0ttU0tKUzR1OVJ3YndDOVF1b1hPS2N5ZVR1bUMyZmVFY2d5ckhu?=
 =?utf-8?B?aHg5N3JkcXlrd2tOQXRDeW5rWHVwbThaMGRrb256S3pjVllvZ2I4U1dFaXNS?=
 =?utf-8?B?MmpJVmdRVnRUbHBpM1JNeHBHV3crY1FaWmNjblgreDBxMzQrZ1RYdU5jemZ1?=
 =?utf-8?B?MnRsR2FNVVhlK0dPRjRzTlg1djZ2ejhJdEZKV2ZVZTdMNGZRenFmb0xnbHJY?=
 =?utf-8?B?SHRMcWFVK0cyY1Z4VXhob2RvY1VZTGFnSTVyalM2aEU3Yzg2cTRvb1o3T2dK?=
 =?utf-8?B?NnNaaytYZElOaTZUMnBTK1o4TTFEMzl3NWs4SlgvNlN5QUVqNlhDdklkTTRr?=
 =?utf-8?B?QmVLRDUrSjBMWlM1cUx2WHdjUWxsUDVpZXZtT1p5K0thS0ZQTXBscEFPQ0hM?=
 =?utf-8?B?REV1ek5oVDlGd0VYcVBWTlVyUUVIVUhuV0VnM0FyNGczelZ5SkVVd2VrUVAx?=
 =?utf-8?B?S0FFbWlLVXNmSjh0aUg3VDg0blFDR1lyUXhPTHV1allQLy9HY05XVUduYXll?=
 =?utf-8?B?eEtsV1JiSjBHalg5RXl1MzFpbDV2NjhXcVNrd05pQmx4VHYwOWtHU2JNbnhj?=
 =?utf-8?B?eFJvenYwaWUvRHBTbGJXdlByY2JUeDJ6d3pnaGxYajdXV1hEWkFhdk9QSEpW?=
 =?utf-8?B?eUtCYXhVL3hDYmtSMHNzUXdvUzgySG9jaXlPd1ZlMm9OcWEvSnpSM0lHcG1q?=
 =?utf-8?B?Nnd4alIzTkYzd3ZESlpuLzNZQWNtQklXeWIxVkNnWHlxZlVRU1JCYXloMyt3?=
 =?utf-8?B?L3hyMW1DZ0VncXBRc2tScUNDdDd5MXhwRldSVzc2MVk5SXE0TEtqMHpWcUlr?=
 =?utf-8?B?b25PWVE1cXFFMHkya3BzdU90L0QrT2M3c0d2R2xWem1NVDJBdVVQTWNvZlJD?=
 =?utf-8?B?aU1rQ3o3M2FBc1pWb21kNHJSME5WNFRDb2dLd0EzU0xqL1NKYlE3bjNzd1pB?=
 =?utf-8?B?TlJCSVdwMHUyb01EWEZJRi8xOG4yTFh2QmNmWjFXQ2xRMmpwR0srMW02cnJi?=
 =?utf-8?B?eDA1SHM2Wm5wV1kzdy9Fc1dzaVZDcHNoSGJPcEltOG1UUytQVTZrNWRKclNk?=
 =?utf-8?B?bmg3REFYTXRMa01yOVQ4ZXRaVy9pVUhIeDFxRUtJOVQxQzUzdVlveWJsTzJ4?=
 =?utf-8?B?eXNoOStjQWI5MTlUd2w1LzYrUGZtZklHRmx2THVkQ1pEb2JLdFFScTNMR1dL?=
 =?utf-8?B?SGlkOGltckRvZGZJSnd6bkVGNC9DQjlxOHM4N1JPVkd3ZHhpVlVHMGZCdjZJ?=
 =?utf-8?B?NlVwdUgxN3EvNyt0ZkxsT2RBeE1BZEg5TG5qTkcxVXRtMGNWVi9QeEFSdUFx?=
 =?utf-8?B?UFFCSDdEcGJaQm5ZTzQ5NzJYM0xMeUZ1cE9ZcVRyZm0yWEkyU1RzdWhNT2J6?=
 =?utf-8?Q?R/vF43RwbQhiNfnsg5b71vI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63050e0a-e188-4dca-c04d-08d9cbc576eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 18:52:01.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSniVkGyrOkAqZn/VnuwcTptVluL8H5TOqEHPYJEVJlnxuZARmp+tAUbOsjwxLaqgnu1dHhitGWz8VxarlDdpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

On Thu, Dec 30, 2021 at 11:12:57PM +0800, G.R. wrote:
> On Thu, Dec 30, 2021 at 3:07 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Dec 29, 2021 at 11:27:50AM +0100, Roger Pau Monné wrote:
> > > On Wed, Dec 29, 2021 at 05:13:00PM +0800, G.R. wrote:
> > > > >
> > > > > I think this is hitting a KASSERT, could you paste the text printed as
> > > > > part of the panic (not just he backtrace)?
> > > > >
> > > > > Sorry this is taking a bit of time to solve.
> > > > >
> > > > > Thanks!
> > > > >
> > > > Sorry that I didn't make it clear in the first place.
> > > > It is the same cross boundary assertion.
> > >
> > > I see. After looking at the code it seems like sglist will coalesce
> > > contiguous physical ranges without taking page boundaries into
> > > account, which is not suitable for our purpose here. I guess I will
> > > either have to modify sglist, or switch to using bus_dma. The main
> > > problem with using bus_dma is that it will require bigger changes to
> > > netfront I think.
> >
> > I have a crappy patch to use bus_dma. It's not yet ready for upstream
> > but you might want to give it a try to see if it solves the cross page
> > boundary issues.
> >
> I think this version is better.

Thanks for all the testing.

> It fixed the mbuf cross boundary issue and allowed me to boot from one
> disk image successfully.

It's good to know it seems to handle splitting mbufs fragments at page
boundaries correctly.

> But seems like this patch is not stable enough yet and has its own
> issue -- memory is not properly released?

I know. I've been working on improving it this morning and I'm
attaching an updated version below.

Thanks, Roger.
---
diff --git a/sys/dev/xen/netfront/netfront.c b/sys/dev/xen/netfront/netfront.c
index 8dba5a8dc6d5..69528cc39b94 100644
--- a/sys/dev/xen/netfront/netfront.c
+++ b/sys/dev/xen/netfront/netfront.c
@@ -71,6 +71,8 @@ __FBSDID("$FreeBSD$");
 #include <xen/interface/io/netif.h>
 #include <xen/xenbus/xenbusvar.h>
 
+#include <machine/bus.h>
+
 #include "xenbus_if.h"
 
 /* Features supported by all backends.  TSO and LRO can be negotiated */
@@ -199,6 +201,17 @@ struct netfront_txq {
 	struct taskqueue 	*tq;
 	struct task       	defrtask;
 
+	bus_dma_segment_t	segs[MAX_TX_REQ_FRAGS];
+	struct mbuf_xennet {
+		struct m_tag 	tag;
+		bus_dma_tag_t	dma_tag;
+		bus_dmamap_t	dma_map;
+		struct netfront_txq *txq;
+		SLIST_ENTRY(mbuf_xennet) next;
+		u_int 		count;
+	}			xennet_tag[NET_TX_RING_SIZE + 1];
+	SLIST_HEAD(, mbuf_xennet) tags;
+
 	bool			full;
 };
 
@@ -221,6 +234,8 @@ struct netfront_info {
 
 	struct ifmedia		sc_media;
 
+	bus_dma_tag_t		dma_tag;
+
 	bool			xn_reset;
 };
 
@@ -301,6 +316,42 @@ xn_get_rx_ref(struct netfront_rxq *rxq, RING_IDX ri)
 	return (ref);
 }
 
+#define MTAG_COOKIE 1218492000
+#define MTAG_XENNET 0
+
+static void mbuf_grab(struct mbuf *m)
+{
+	struct mbuf_xennet *ref;
+
+	ref = (struct mbuf_xennet *)m_tag_locate(m, MTAG_COOKIE,
+	    MTAG_XENNET, NULL);
+	KASSERT(ref != NULL, ("Cannot find refcount"));
+	ref->count++;
+}
+
+static void mbuf_release(struct mbuf *m)
+{
+	struct mbuf_xennet *ref;
+
+	ref = (struct mbuf_xennet *)m_tag_locate(m, MTAG_COOKIE,
+	    MTAG_XENNET, NULL);
+	KASSERT(ref != NULL, ("Cannot find refcount"));
+	KASSERT(ref->count > 0, ("Invalid reference count"));
+
+	if (--ref->count == 0)
+		m_freem(m);
+}
+
+static void tag_free(struct m_tag *t)
+{
+	struct mbuf_xennet *ref = (struct mbuf_xennet *)t;
+
+	KASSERT(ref->count == 0, ("Free mbuf tag with pending refcnt"));
+	bus_dmamap_sync(ref->dma_tag, ref->dma_map, BUS_DMASYNC_POSTWRITE);
+	bus_dmamap_destroy(ref->dma_tag, ref->dma_map);
+	SLIST_INSERT_HEAD(&ref->txq->tags, ref, next);
+}
+
 #define IPRINTK(fmt, args...) \
     printf("[XEN] " fmt, ##args)
 #ifdef INVARIANTS
@@ -778,11 +829,18 @@ disconnect_txq(struct netfront_txq *txq)
 static void
 destroy_txq(struct netfront_txq *txq)
 {
+	unsigned int i;
 
 	free(txq->ring.sring, M_DEVBUF);
 	buf_ring_free(txq->br, M_DEVBUF);
 	taskqueue_drain_all(txq->tq);
 	taskqueue_free(txq->tq);
+
+	for (i = 0; i <= NET_TX_RING_SIZE; i++) {
+		bus_dmamap_destroy(txq->info->dma_tag,
+		    txq->xennet_tag[i].dma_map);
+		txq->xennet_tag[i].dma_map = NULL;
+	}
 }
 
 static void
@@ -822,10 +880,27 @@ setup_txqs(device_t dev, struct netfront_info *info,
 
 		mtx_init(&txq->lock, txq->name, "netfront transmit lock",
 		    MTX_DEF);
+		SLIST_INIT(&txq->tags);
 
 		for (i = 0; i <= NET_TX_RING_SIZE; i++) {
 			txq->mbufs[i] = (void *) ((u_long) i+1);
 			txq->grant_ref[i] = GRANT_REF_INVALID;
+			txq->xennet_tag[i].txq = txq;
+			txq->xennet_tag[i].dma_tag = info->dma_tag;
+			error = bus_dmamap_create(info->dma_tag, 0,
+			    &txq->xennet_tag[i].dma_map);
+			if (error != 0) {
+				device_printf(dev,
+				    "failed to allocate dma map\n");
+				goto fail;
+			}
+			m_tag_setup(&txq->xennet_tag[i].tag,
+			    MTAG_COOKIE, MTAG_XENNET,
+			    sizeof(txq->xennet_tag[i]) -
+			    sizeof(txq->xennet_tag[i].tag));
+			txq->xennet_tag[i].tag.m_tag_free = &tag_free;
+			SLIST_INSERT_HEAD(&txq->tags, &txq->xennet_tag[i],
+			    next);
 		}
 		txq->mbufs[NET_TX_RING_SIZE] = (void *)0;
 
@@ -1041,7 +1116,7 @@ xn_release_tx_bufs(struct netfront_txq *txq)
 		if (txq->mbufs_cnt < 0) {
 			panic("%s: tx_chain_cnt must be >= 0", __func__);
 		}
-		m_free(m);
+		mbuf_release(m);
 	}
 }
 
@@ -1311,7 +1386,7 @@ xn_txeof(struct netfront_txq *txq)
 			txq->mbufs[id] = NULL;
 			add_id_to_freelist(txq->mbufs, id);
 			txq->mbufs_cnt--;
-			m_free(m);
+			mbuf_release(m);
 			/* Only mark the txq active if we've freed up at least one slot to try */
 			ifp->if_drv_flags &= ~IFF_DRV_OACTIVE;
 		}
@@ -1530,46 +1605,51 @@ xn_count_frags(struct mbuf *m)
 static int
 xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 {
-	struct mbuf *m;
 	struct netfront_info *np = txq->info;
 	struct ifnet *ifp = np->xn_ifp;
-	u_int nfrags;
-	int otherend_id;
+	int otherend_id, error, nfrags;
+	bus_dma_segment_t *segs;
+	struct mbuf_xennet *tag;
+	bus_dmamap_t map;
+	unsigned int i;
 
-	/**
-	 * Defragment the mbuf if necessary.
-	 */
-	nfrags = xn_count_frags(m_head);
+	segs = txq->segs;
+	KASSERT(!SLIST_EMPTY(&txq->tags), ("no tags available"));
+	tag = SLIST_FIRST(&txq->tags);
+	SLIST_REMOVE_HEAD(&txq->tags, next);
+	KASSERT(tag->count == 0, ("tag already in-use"));
+	map = tag->dma_map;
+	error = bus_dmamap_load_mbuf_sg(np->dma_tag, map, m_head, segs,
+	    &nfrags, 0);
+	if (error == EFBIG || nfrags > np->maxfrags) {
+		struct mbuf *m;
 
-	/*
-	 * Check to see whether this request is longer than netback
-	 * can handle, and try to defrag it.
-	 */
-	/**
-	 * It is a bit lame, but the netback driver in Linux can't
-	 * deal with nfrags > MAX_TX_REQ_FRAGS, which is a quirk of
-	 * the Linux network stack.
-	 */
-	if (nfrags > np->maxfrags) {
+		bus_dmamap_unload(np->dma_tag, map);
 		m = m_defrag(m_head, M_NOWAIT);
 		if (!m) {
 			/*
 			 * Defrag failed, so free the mbuf and
 			 * therefore drop the packet.
 			 */
+			SLIST_INSERT_HEAD(&txq->tags, tag, next);
 			m_freem(m_head);
 			return (EMSGSIZE);
 		}
 		m_head = m;
+		error = bus_dmamap_load_mbuf_sg(np->dma_tag, map, m_head, segs,
+		    &nfrags, 0);
+		if (error != 0 || nfrags > np->maxfrags) {
+			bus_dmamap_unload(np->dma_tag, map);
+			SLIST_INSERT_HEAD(&txq->tags, tag, next);
+			m_freem(m_head);
+			return (error ?: EFBIG);
+		}
+	} else if (error != 0) {
+		SLIST_INSERT_HEAD(&txq->tags, tag, next);
+		m_freem(m_head);
+		return (error);
 	}
 
-	/* Determine how many fragments now exist */
-	nfrags = xn_count_frags(m_head);
-
-	/*
-	 * Check to see whether the defragmented packet has too many
-	 * segments for the Linux netback driver.
-	 */
 	/**
 	 * The FreeBSD TCP stack, with TSO enabled, can produce a chain
 	 * of mbufs longer than Linux can handle.  Make sure we don't
@@ -1583,6 +1663,8 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 		       "won't be able to handle it, dropping\n",
 		       __func__, nfrags, MAX_TX_REQ_FRAGS);
 #endif
+		SLIST_INSERT_HEAD(&txq->tags, tag, next);
+		bus_dmamap_unload(np->dma_tag, map);
 		m_freem(m_head);
 		return (EMSGSIZE);
 	}
@@ -1604,9 +1686,9 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 	 * the fragment pointers. Stop when we run out
 	 * of fragments or hit the end of the mbuf chain.
 	 */
-	m = m_head;
 	otherend_id = xenbus_get_otherend_id(np->xbdev);
-	for (m = m_head; m; m = m->m_next) {
+	m_tag_prepend(m_head, &tag->tag);
+	for (i = 0; i < nfrags; i++) {
 		netif_tx_request_t *tx;
 		uintptr_t id;
 		grant_ref_t ref;
@@ -1621,17 +1703,20 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 		if (txq->mbufs_cnt > NET_TX_RING_SIZE)
 			panic("%s: tx_chain_cnt must be <= NET_TX_RING_SIZE\n",
 			    __func__);
-		txq->mbufs[id] = m;
+		mbuf_grab(m_head);
+		txq->mbufs[id] = m_head;
 		tx->id = id;
 		ref = gnttab_claim_grant_reference(&txq->gref_head);
 		KASSERT((short)ref >= 0, ("Negative ref"));
-		mfn = virt_to_mfn(mtod(m, vm_offset_t));
+		mfn = atop(segs[i].ds_addr);
 		gnttab_grant_foreign_access_ref(ref, otherend_id,
 		    mfn, GNTMAP_readonly);
 		tx->gref = txq->grant_ref[id] = ref;
-		tx->offset = mtod(m, vm_offset_t) & (PAGE_SIZE - 1);
+		tx->offset = segs[i].ds_addr & PAGE_MASK;
+		KASSERT(tx->offset + segs[i].ds_len <= PAGE_SIZE,
+		    ("mbuf segment crosses a page boundary"));
 		tx->flags = 0;
-		if (m == m_head) {
+		if (i == 0) {
 			/*
 			 * The first fragment has the entire packet
 			 * size, subsequent fragments have just the
@@ -1640,7 +1725,7 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			 * subtracting the sizes of the other
 			 * fragments.
 			 */
-			tx->size = m->m_pkthdr.len;
+			tx->size = m_head->m_pkthdr.len;
 
 			/*
 			 * The first fragment contains the checksum flags
@@ -1654,12 +1739,12 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			 * so we have to test for CSUM_TSO
 			 * explicitly.
 			 */
-			if (m->m_pkthdr.csum_flags
+			if (m_head->m_pkthdr.csum_flags
 			    & (CSUM_DELAY_DATA | CSUM_TSO)) {
 				tx->flags |= (NETTXF_csum_blank
 				    | NETTXF_data_validated);
 			}
-			if (m->m_pkthdr.csum_flags & CSUM_TSO) {
+			if (m_head->m_pkthdr.csum_flags & CSUM_TSO) {
 				struct netif_extra_info *gso =
 					(struct netif_extra_info *)
 					RING_GET_REQUEST(&txq->ring,
@@ -1667,7 +1752,7 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 
 				tx->flags |= NETTXF_extra_info;
 
-				gso->u.gso.size = m->m_pkthdr.tso_segsz;
+				gso->u.gso.size = m_head->m_pkthdr.tso_segsz;
 				gso->u.gso.type =
 					XEN_NETIF_GSO_TYPE_TCPV4;
 				gso->u.gso.pad = 0;
@@ -1677,13 +1762,14 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 				gso->flags = 0;
 			}
 		} else {
-			tx->size = m->m_len;
+			tx->size = segs[i].ds_len;
 		}
-		if (m->m_next)
+		if (i != nfrags - 1)
 			tx->flags |= NETTXF_more_data;
 
 		txq->ring.req_prod_pvt++;
 	}
+	bus_dmamap_sync(np->dma_tag, map, BUS_DMASYNC_PREWRITE);
 	BPF_MTAP(ifp, m_head);
 
 	if_inc_counter(ifp, IFCOUNTER_OPACKETS, 1);
@@ -2244,7 +2330,20 @@ create_netdev(device_t dev)
     	ether_ifattach(ifp, np->mac);
 	netfront_carrier_off(np);
 
-	return (0);
+	err = bus_dma_tag_create(
+	    bus_get_dma_tag(dev),		/* parent */
+	    1, PAGE_SIZE,			/* algnmnt, boundary */
+	    BUS_SPACE_MAXADDR,			/* lowaddr */
+	    BUS_SPACE_MAXADDR,			/* highaddr */
+	    NULL, NULL,				/* filter, filterarg */
+	    PAGE_SIZE * MAX_TX_REQ_FRAGS,	/* max request size */
+	    MAX_TX_REQ_FRAGS,			/* max segments */
+	    PAGE_SIZE,				/* maxsegsize */
+	    BUS_DMA_ALLOCNOW,			/* flags */
+	    NULL, NULL,				/* lockfunc, lockarg */
+	    &np->dma_tag);
+
+	return (err);
 
 error:
 	KASSERT(err != 0, ("Error path with no error code specified"));
@@ -2277,6 +2376,7 @@ netif_free(struct netfront_info *np)
 	if_free(np->xn_ifp);
 	np->xn_ifp = NULL;
 	ifmedia_removeall(&np->sc_media);
+	bus_dma_tag_destroy(np->dma_tag);
 }
 
 static void


