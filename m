Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2A45044D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225864.390145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaxU-0006Ii-2G; Mon, 15 Nov 2021 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225864.390145; Mon, 15 Nov 2021 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaxT-0006Go-Ug; Mon, 15 Nov 2021 12:19:35 +0000
Received: by outflank-mailman (input) for mailman id 225864;
 Mon, 15 Nov 2021 12:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmaxS-000601-Ng
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:19:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 498f690c-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:19:33 +0100 (CET)
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
X-Inumbo-ID: 498f690c-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636978773;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZvO7oA7ZOOZL3R5aozMovAwaf4e8yyts1RHkl8Rh9hg=;
  b=LvlMyaSLZuYP1SMxNYkJFwoVvCuZfjCQbk3dDk/abfpwUacWrm1A3b72
   WlGvDi5bv96f664GiS3kl2ZwvhjrmAaVAoxLdxVYhqgrkyEy0hVcg6Bnf
   AMFzdEK1kqUU5yLVpiJ4rFoS2Wh2o2r9dNnPVyhj+xeUlOaefHq4u/Cgt
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0dfLA/60FVHG9SzUddVxl07jbRv5KLnc60dT14w/7jeXRWIakiBLoU4jkQEgTjSTIZkT+hI3op
 91QRHbD3btw8L6l66qqdV2h7TXtrmqpk3UmSv0nAgGpgjm1WCvFWDj/Wmz18rFG9CgN/eLTQN0
 2EzZtI/vxPeAW0HPMnxaWmZ2DqbXkPblrqUWWWBO8zz0sahKwF5Pq0LoCoPhGhid9I75Pd6iw8
 UcmBSGTqzd9em8qClFQljQc1wlQoY7nRC5lYqc6vy79xygKKzbHgth4CwOpev376keBk3N48as
 epezYvsXTjYmqUwJEN03CF2V
X-SBRS: 5.1
X-MesageID: 57826396
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wg6za6i+HxKHARbQteCI0Z/oX161gBcKZh0ujC45NGQN5FlHY01je
 htvDDiCOarbNmShL99wOoTioR9U68eGx4JnSwVvqC40Ensb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1RjL2pFAYYZJHNs+o4fgZ+IxhHBqlZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2ZAUQ62PO
 aL1bxJPYgTlZiwRKmsWM70svN2wryClTmBX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mPZ/UzpDxcCLtudxDGZtHW2iYfnlCbwCdw6D6ez+LhsjUH77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixGlElV2NAWYYateQ4YBE18
 G+wpujtGmk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMulGrplIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyP
 h6K5V0MuMEPYBNGiJObharrUazGKoC6SrzYug38NIISMvCdiifalM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu0NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:axQ1Ga0R44Njn/gTvxQa2wqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57826396"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPNmf7uuGRKKzHBWkamG9ag7TfUOPPCi/rV3e4BYNgioscp47IjVx80dBBXQzhY68Jk6+nqB5bDICarAv1bNQQ/MttRKHKVBoU7TVg/iVZadTwt0kTCEgnueEPBzNmJcKvk3f9S5mKaAaYipNkKjgznTvqjgcyaLpFoONnnEqnIu+rZK+j6s+XLf3Wa5G+FdgjvWUvPcIA2uC9rmfPlXzVI9umZxWH792BuNQZ+l0GDOz0cq5ReQUMTvBsZ+488VYpPqohqEsx7clwMpl3Lo91N0DDa/W4wLclYDTM2xVmMfosDjfssNE7ul/nniWklFo5lHqVhUqSFB89i2VoqERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14q7p6bGsb3dXiIewrDUNNR1JTQgTg0gyntwWqB1erI=;
 b=gVFhyZZmuMw2RbSP8IpyDd8xG0PhALSFdGqVzpNqYmcUiVzJ3wZJa8k8xsQNM09O99Hyp7bqgSGJF85a0FVhLn9eX+K9hgrIdwsZLS2fETsUK/1qXZ5L1oRrq+MphabG7XcpvD51CDZiksR6suZb+yll3ta2/dWC7Nz0Zyg1XvZSbu1JA8/+Kk+TUK7tYbs/6b4E1yRS8qFNtvb2/TCNjLpaXmvlPmGpJkDf8OuJFXRNQDKy0zkEjjzz684p5bMqm/QF3mhPTd7JrBOkXpsyEXQQ7kRGavs/LIDx0/L3ulCcEo3HENxlY1VQPgfH2AhxsG0eE0dSSlyZzXM5ZH4edg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14q7p6bGsb3dXiIewrDUNNR1JTQgTg0gyntwWqB1erI=;
 b=UoV+IaZSOeQuqeh5c71xGdj2zOwvO4Dkp9JKdg18CJ41ATk3bYjyor+uWFIID6cpxzp8+iiQLtB+XpcKUA2c7zhko/vlccDCbh6JUWlCh7sXfYKnRZh3gDrO6kniQWBIWiftBZxaPQNhbcfcCK1OYQv8XMRVg9hbam4ELlye5vQ=
Date: Mon, 15 Nov 2021 13:19:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH for-4.16] freebsd/privcmd: fix MMAP_RESOURCE ioctl
 definition
Message-ID: <YZJQS5bG+/7M0fEh@Air-de-Roger>
References: <20211115110851.1462-1-roger.pau@citrix.com>
 <11c7c89d-ba8f-e1da-e2af-4ba186f92fbe@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11c7c89d-ba8f-e1da-e2af-4ba186f92fbe@srcf.net>
X-ClientProxiedBy: MR1P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a78180a-950a-4346-ccba-08d9a8322b93
X-MS-TrafficTypeDiagnostic: DM6PR03MB4601:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4601EFE1252C2738869A0B468F989@DM6PR03MB4601.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5J23zHx+Tzmx2AiEp7COYCIJYkZQ0zC9JbB9DU3Jmk0aip87lRhqzuyWno6WlDe6UiiSNUmnnjjFZqQvBRTCysYErsn+tFbcNH90Oktq7MOZ16Mg26FyhicSA9xFSD+JPY65rZdyFI6CbYzwEbQ7b73Rf/ABgPZZckjvkVWfbUa+9EZU8NJzxqD37S7dS5hu85Vx9POPTnCF8Nk9ccAxNVEQMW8zxkQlE7vaJ5PddZmhJQDd/x7QIWduRk0p1kjmmbv0kQbS5dEc2QAzstnfBE2Fs4ru5h8hYzwM9hjOncHqIB+ctnMToGo8DnV7UsKQY6F+2mkxYZeYNNXMaEu8aEHy4nEdLcG6jTKNk5u1tARNIREJ/2j9JOecucxIyoPUFad+jnhTfUJ4s0qMevoTATHI61okUjnkY2lqKAdJEGYD92zsVq83lm6rztpeuAL4LUiAjPB5DtquvZqB0xaEr4jwLvk2ni7zp+7y1PhNz/fxmKk67PE1wLhkkyX8JEkxz7MC2a306pCaZQKx91RgdVRRuP/KOvhFAXgnB2Ku1fwD83N6Zms5f1bxKcU5uSFSlJGEqRvuaE8u8GFeBFOPi4KHOV+gRzzSIcYrBn80+NA5mtzMVYmd2Fa38kBHOLEhPvDYRVynEG2EnddIFl+Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66946007)(316002)(86362001)(956004)(83380400001)(54906003)(66476007)(6666004)(9686003)(26005)(186003)(6486002)(8936002)(5660300002)(6916009)(66556008)(4326008)(53546011)(6496006)(508600001)(85182001)(33716001)(38100700002)(82960400001)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVcxTDlneGVqMUFuU0p1TjFzNkFyYjBYMG8rRnp3VXpHa0lENWp2VHVSbXhk?=
 =?utf-8?B?ZG82ZElvdXFRVEdPSWpuR2huTXZvT092aFRSVU5MSkR2QjFMcEEvVEZxL0Zv?=
 =?utf-8?B?V1VUWmpZQmY4Q1VjRFJ4bk9CaHR1bm5oeU9TWHU4RHVuaGNLVUFBMFpHYTR6?=
 =?utf-8?B?L2xpb1JjWUxrUG9oMkRxNkRnM0dXTFFyK1ZCRDlVMC90NDJTQ2ZRY1JqUzRz?=
 =?utf-8?B?bEpHOWRYRWwvaU5pVDkvOWEwSWZSUTZpUDlmMnN2ZDhSbGdCN0ppbHhNeUNB?=
 =?utf-8?B?c0dqQWRsVjhrSGd0d25na213cUErQm1wY2FmcHA3Q3ExR3h2cDZrbzZvUjNs?=
 =?utf-8?B?cTd4NUZHRHFCdUM3MkJ2OHJkN3hkeDhrOEdlbmJ3L2pCZnlxQ0VzRStFK0lP?=
 =?utf-8?B?RFI2STFrVVhsV1lzdzY3TGZNRVdCei9vM2xtTkNvU3puRFB0eEUrQ0pwNith?=
 =?utf-8?B?ajRSVnZLYzZ3aDQzaW1YOXFmWTB3WlBHQXV3WWpqMHAzWkNRYjYwVkhwK1lG?=
 =?utf-8?B?eXh5SUZpSjZGa1pON3U0OTFySjZVSU9uYi9sN0lJT2dJd052UzBJcFl2bmxT?=
 =?utf-8?B?bHdVbk9zUFZpV3R2ZXVIdEJMdVoydXlEUDlXZkZUR3V4Y3lISGlxMHNlZTZn?=
 =?utf-8?B?aVVHcUhyZTBxaXQxSHNnbXMxU2k1TlVrV1NKanBGTCtscjA4MExoQlZKVGor?=
 =?utf-8?B?YnVmckt2VHR0OExVWnVyQmNzbWZYOTBTL1o3bHYwaTNuU3RqTEZCOFd0M1VB?=
 =?utf-8?B?cnY4c2NSdS9rejdxM2x3MGxROHVQM09LeEJYVnBPaTE1NlBhRG5zSTI5Ymg5?=
 =?utf-8?B?MzFiZTdCM1h5SmNBUHdqbTBJdEhtUEZVWmdaditmbVZRNUJJcVB5NURrOTQ5?=
 =?utf-8?B?UU1LeWI3V2JDYkFsVUxPZHA2U0FCUW9adkhHVm9JZit0YTl0akp5QTFiMXVr?=
 =?utf-8?B?ZmJkdWFwQXZjLzN2TWJwdE9VL0V0di9hbXJXUU9yUEJydkxYMTFMMkZaOUlZ?=
 =?utf-8?B?Zk04UlphS3FjeFIySFlnQkdjaWN4MXF6SWM5d0lDM2c4UCtQc0dJaGhOZTF0?=
 =?utf-8?B?V29uK01SUk9XTUkvUEYreWZJdENET3ZFQm9wZnRrWFE4RUplVGYzTmwzMGdZ?=
 =?utf-8?B?b0ZaVy85bXJpM0JVVE41N05SeHFGdnBWSkZxTWV6YVFCYlJSL2o2T1FNSWow?=
 =?utf-8?B?UGRweWN4cVRnamhEYk04ZjQxK1pnM3NxR3NTanFaTVhDWkwzY2owWHYwQWRk?=
 =?utf-8?B?YjMwNFM4WXlXRzhLZjBlRVFGanoyWWs0eDZvWFVyVGlPVXVkM2hxN2swcjhW?=
 =?utf-8?B?NXJaYkFwc1lteDlScFphKzRLdE9sSit4Z2V1Z2JVZmR6clk1NkhRNFh3VEhn?=
 =?utf-8?B?QWJwNGtrbytiQXNoSWtKcWo0eFNoa1pOd0ZFaXczNytDUFpYUStZUnh1NlMr?=
 =?utf-8?B?T0VNWVA2L2hFbHZBVndiU3VWbDN2WnN6UGd4S1NoTG1MSWdjNUV5R3E5ZG4r?=
 =?utf-8?B?ZmkvNFp0SWlCUXpxeXNhd1QzL3lhQVhKUFc4L1NRdnF4YTd3WDBvRmNkVDd5?=
 =?utf-8?B?czBkT21PR0dmY25YdXVZNktwUXlZdERRVllXUkJWRXRJRHlHaFFLV2VRekg3?=
 =?utf-8?B?L1NUZW0wQjhnNk0zeVZDUkZMY05zRFN2d3FPdFdOdHdEdUdiTDV5OGlDQXpK?=
 =?utf-8?B?cDByV2RmU2c3WHBUSzQrL29ZRjMyaFdaa2dXZVVQZEtQRHloNHZMc3JRaWhp?=
 =?utf-8?B?Wi9hOUtyMk1rNFkrbERlOGxMYUhVVHpCbXlJdERiVzBIbkhEc3I4dE5aSFAw?=
 =?utf-8?B?empJcnBCOGJ4M1dGemtOS09ycWx1SEsyRG1BVWIrU1FQSDZvYlNRQ3BrcEhl?=
 =?utf-8?B?azlkQXNkekN4K1ZyWllmWVBZcllYUVN2NUtzRk1DNTI4VHVtalJGOE4yMk5D?=
 =?utf-8?B?K2ZTZ3BYSFpYTWR1cWoyT21uQkRJcVZmMnBCNVYzdVlrWS9BbmRDdkdKQTdK?=
 =?utf-8?B?aVNvb09KeU9hVHVzNnpucDE4K1pJelVpUllWN1JxNVBzaVRkNGxNTzN0amVM?=
 =?utf-8?B?NXBNdUdvYnVrWU03dVRWSXpHSlVHeHdkT2Nhemc2TGhhR3VEcUx0NnFuUURt?=
 =?utf-8?B?Umx3bnloQXNmbjQ5SWtrVWVlTXZnb3VLVkJXb3NOZXpvd0N5dWROam5uNG1i?=
 =?utf-8?Q?1jpnA3WAhUPBjI0tbGB2Gbg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a78180a-950a-4346-ccba-08d9a8322b93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:19:28.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5Z73OYajGvFABiHeC/U8+a762brwt/72vqAlFsJWsaNU/ZSom4D42m/Q3etvCzLEkkf/HARJCNPAo7RPrzKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4601
X-OriginatorOrg: citrix.com

On Mon, Nov 15, 2021 at 12:03:26PM +0000, Andrew Cooper wrote:
> On 15/11/2021 11:08, Roger Pau Monne wrote:
> > Current ioctl definition was wrong in both FreeBSD and Xen sources, as
> > the MMAP_RESOURCE ioctl needs to copy back the size of the resource
> > when passed a zero address and size. FreeBSD encodes in the definition
> > of the ioctl number whether parameters should be copied in (W) and/or
> > copied out (R). The current definition for MMAP_RESOURCE is lacking
> > the copy out part (R), and thus the call to query the size of a
> > resource would always return 0.
> >
> > This change will break the current ioctl interface, the tools can
> > however fall back to using the foreign memory interface in order to
> > map resources from guests.
> >
> > This was a shortcoming from when the hypercall and ioctl gained the
> > ability to query the size of the resources, as originally the
> > MMAP_RESOURCE ioctl didn't need to copy out any data.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> >
> > The change only affects FreeBSD, and it's only a change in a
> > definition of an ioctl, so it's unlikely to break existing code logic.
> > Without this change Xen tools won't be able to use the MMAP_RESOURCE
> > ioctl.
> 
> I guess you found this while trying to fix test-resource, in which case
> a further argument for the change is "the unit tests now pass on FreeBSD" ?

Indeed. It seems like this is the only instance of a resource size
query that we have implemented so far.

Thanks, Roger.

