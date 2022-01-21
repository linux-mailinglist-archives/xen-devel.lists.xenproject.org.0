Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CE496037
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 15:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259354.447588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAuTM-0008AQ-8J; Fri, 21 Jan 2022 14:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259354.447588; Fri, 21 Jan 2022 14:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAuTM-00087a-4I; Fri, 21 Jan 2022 14:01:00 +0000
Received: by outflank-mailman (input) for mailman id 259354;
 Fri, 21 Jan 2022 14:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g0ta=SF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAuTK-00087U-9b
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 14:00:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b93a3b3-7ac2-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 15:00:55 +0100 (CET)
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
X-Inumbo-ID: 8b93a3b3-7ac2-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642773655;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TocoKrOiD2gfHp1KVVbQ6UhOslcHZ3SLirZqne2Ouuo=;
  b=J0jlIsGe9emlpfL32TXx97TUbLxzQ2Rn6pA3XmzrKUWSnL51PS4bANEu
   sQbzNnijRbkgiL6SPBb/cr7UGq5PzRJyx51QmpAYR6Vqj39qxGzEhSRAS
   OHzXZ5mIuOF6Km4Un2DXb7aysqppfg4tWY06d6oQ2mjRp0J21x5sW75KJ
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E/TZOY/h1nNksGeFJ9grUZVIhNPOmHRFyyGXR40XceQg7XWTGnVCGGMJzQ/yFfFEeMmsLICa2i
 N3PZfTGOpGP8W5PvTN23CrirOUrRidBsrnSmxE5bTgmZwXWMAHHbEw6WS0wU26AG5TRSNP9p0G
 zVufhfP0aY2MXwqaVvNPwhR/22O0AHj8vGc6MF0v//nCJ3d3psb2xDohCHbD/hoqx3S88riU/J
 6gJKrTSIJLZjd2HNCXH9S0xn8kABPuxRRfaQCC+hcbNweSL5vEvZo+soa3dPCJt5zVna9QhQt+
 biPPUc91qJ7lhS48Hj/92DVQ
X-SBRS: 5.2
X-MesageID: 62899047
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FosJWq8ltQq9cOfwnS/MDrUDZXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2dKDTyOO6rYNzH0Lt8na4zj9EoA68CDm4A2GwZv/ik8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhh6
 t5yrqW1Uz5uI4fUxL1EYxBeCzxxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhmdh15gSQp4yY
 eI3Qx0oTRWbfSZMBW4aUJQ+ouCltlXGJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEhObKkDi+SI8UPLG58PF1iVmXgGkeTgAVPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHtfRaHu0eBpCdbRvBIT7Rj2AiL0rfbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBgpJDSsjPeZJgrBED3CBvJ6sy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj3pCb4LNEJvG8mTKuMDiriUWSxC
 KM0kVgJjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WnMnCIqtZCdA5TRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:NgNE1KywLr4Ps+gTmug1KrPxtOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62899047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MipfKNyfGBSFL8UoCYnJAgSlbAvNMERRuXlaVAHd59HGXDmnfYS8ckF1h1llWsH5Yw/2Ut0RvUPkVTU1KtFO0mbOXeJZZYqnVdnRns0HmSi2ovaYSggl8O3AWNa+zI7eyP7bHhpfS+222Ntff1uYRUd7/LGYCRNTPqcNbsQIU2REQThnFKvNo1m/pyKtxVXOej6i4wYUw3VaVYGJ/38ApN1PyXFERvGeqWikV9Y68WA7EUJqYOjenBEWJ8pJVFKqP/qSvhzAxZspLAUw5KWF6SKYl84iSAJI2QkYpUYCWhRrXGFXuX7zgizx3IRcQFcg/4CQjYC5d+EMpgC/maUmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCuScff/WVAZh9KiKf5D7d8nCSAnd9cFHsMUnKW7iDU=;
 b=nBK7SQCbdpMGt3iTfdE7G+ZQvnHj+2ocD6JWvvZSm7SyGayYoTyY3+5Sruca1/z8iLCirAaOl8f/xdWY8vcuuOSUHwTPgInmQmE3MzTjv6I3wH9Q2dojmiMUxMx/ex1LLUjJSaLwFI6d302uH5ZZyeWTGQzuwjgf2Gf12YhOKeYHGWA8LytIj2PPk992jgWEEI02zORcPEcEI7BsbP7IPV9sCG0aJ7cpr4Yz63ieIEl+bAqSGSS/nrPevlJ/9+cTZ9tJeL85MQVKGBOHypGlcLldtkPCx3dX5XJW70r5FkIfCu+xDR5ER+IXvFwxXhyr8WlP5VaU3DM+fhzjGZyYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCuScff/WVAZh9KiKf5D7d8nCSAnd9cFHsMUnKW7iDU=;
 b=NF4eydJ44j9pzJZ6Q+Ket59SVwFQSAZdJ00Eh5I+vajph19W+AHDvceVMmmt4YWzXDBJKjsW4Wt+NH0fcgXxgyby1181QndeCgA11QKLVryi8kCq3F2EqXz+fiOrKMH0z81C6pOOSNw4pSlBunoUQXoJELu8oFctYv8tPFwYQa8=
Date: Fri, 21 Jan 2022 15:00:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: possible kernel/libxl race with xl network-attach
Message-ID: <Yeq8fdOWLngcjDH8@Air-de-Roger>
References: <20220113111946.GA4133739@dingwall.me.uk>
 <YeBPG+8D00xG4h0j@Air-de-Roger>
 <1671ad485c35fb86d758951889cfa05d@dingwall.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1671ad485c35fb86d758951889cfa05d@dingwall.me.uk>
X-ClientProxiedBy: MR1P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2047fb41-4d10-4bcf-e7b5-08d9dce667b2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2651:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB26517674D738B5C83678924A8F5B9@DM5PR03MB2651.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8EyZFvhz/syccsgRS/vfrXNtUjK/oSX3EkfEsnW8zKo37JKr1tg7CcRCHT+G0RKP80Uy8Cn92kIk8t/nSQXYWPOJeWfBHitAlEsjEDPeazi2RnJq9Hu7yrnejYJ9vEFDHHyLAW9yITL9uUMF997whzWIkggfsYrt5tacrio6/mseU2BnObivuqCbCpApoBERhuEtmJZ1V9r+jxOFaG4DLQmr1Ymlhvfp79/RfZbemZ2/CWjunpZ5ztqnbHdoP+HiZw20Ovth482nLDNz/eH/9igkOrdi4Lkyf13gnzj0AApzqEjo5+8k6+QgtPT1LrRmDYpYP0iZkkrmp0DjerHfyWlFG/KKULvOpq5TTfRdxHmGANr2gjtrOkgLhaOJdJyXhN29cstu332l8TLrYcb6kvcYpREw8ALoorKXCYWmxkxE6nvitQ21gcGMua4S2huKr+EGsnA/flBHlS3kg+xHgyIF4t/1feZfx6/fkkEfgLGttBVsSZDR49rPXF6PB+Ca3kslXv3eBHAnRbV8tSZOBUrmsUsa3kjQeabt0JQhy0+3ro2taO7PT0/fMMaQhh6LiI3qtqZJp6i1Vy1ITgIJ2GRq/Abc1JrXM3hCRkAd/DiYjXs/ti9JNWMh9zgqOY7V9ydx6FDh1KB6Z+RSOs4NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(53546011)(6506007)(66946007)(82960400001)(66476007)(33716001)(5660300002)(186003)(508600001)(4326008)(6916009)(38100700002)(8676002)(316002)(86362001)(9686003)(2906002)(6512007)(85182001)(66556008)(26005)(6486002)(8936002)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1B0SEx3empYNHArYjd6RHl0MjZWL3JscWRKYitnc1c0bm16SnNFa1EvdVJE?=
 =?utf-8?B?bDFjQndTSm05eVovUmt0enBNN092aXkwc0p3TXJuTDhEZUdhWTFJMlFBNUdJ?=
 =?utf-8?B?NnBjZ1BxVGlhTXZzdW1WaWZQaWpTTHgwYkl3Q05ZTTg1WGR3ajNYeHdCSlp2?=
 =?utf-8?B?b0kzZy9ZcFdiS24yc284N3lPU2dORUVyTzVONVc3QmhNd3hmNU9JMTlQRXRx?=
 =?utf-8?B?d3ROYUhkTnp1K1QyR2EvNzhZRzNHYTA5djhxekhoakFqbUZsUzNOT0g4UGIr?=
 =?utf-8?B?dFZPVmpDZERWTGdzNEZhdVVCWEpBT0RyRVhZNlZ3cXhGR3pyMld4dnRucTY4?=
 =?utf-8?B?LzBNUFFqeUNQWW9qcWxBSkxYNXpKRWdxb3lMKzFqWkN3dms1YTQrdnFwRWhO?=
 =?utf-8?B?UktXNjF6L04wWGhHeEJFT1FwWE94a2dscmFCcUIyb0xLY3UxTUx4ZUVqZXZD?=
 =?utf-8?B?UmRvOFFzSGRYcG1QZUx0SHZ4VGhicTZZcXoyRWZJbm9BRSsxU2FUMERzeXVV?=
 =?utf-8?B?Rko0NGNmblRoQmdreFUxalo2Z250Tm5naG80NlM4TFMxMTBWZ2Q4aU43Z09j?=
 =?utf-8?B?OFJDTGNTd3BRdTgxUFZVLzFJdm5MTy9zcU56ZGgveDBaSnM1WmRxYlJTQjhH?=
 =?utf-8?B?b1RtK0NvSEtGR1plUW1NcWV3TVNWOW5WT3NMb3lzZktoT0IrMVoyZytNRnZm?=
 =?utf-8?B?bC9yaU40eG5nWG9JVldTQVRoaitZL09idE1pTVVmM3V5UnhySVlXbU1GMHhX?=
 =?utf-8?B?WSs4RGVIWnRYTHZsbVRrOVBYeW9PR2Q1RUxzNGZsbC9JTUFUTGh6NUJYWHpZ?=
 =?utf-8?B?WGNmM0V0UUNuZ3dZMWlORnhDYkRGNndJd1VkSTVCOWlPMVM5THgvZGRnaVE5?=
 =?utf-8?B?eE8vNFZtbnRoekswdUoraWMwbFBiYVFhaTFpeWhmcmd5dkJIMm85ZTNIYStM?=
 =?utf-8?B?SUtxM1d2RW5jK3VqTU1sU1lVOXNwM3NDNzVTRlZLc2w3NkszYlNFU3lvTWFu?=
 =?utf-8?B?UHFuN1NCWjFDM2J6SVBjdmhoQUFlRVN1NVo2OWFma3RVRmFLeVd2K2tNYWly?=
 =?utf-8?B?L3pNZVJKUExudXE4cVdHQTVBU0VSaC9HZE5NeXY1c0QzN1d0NVh2a1pBNitL?=
 =?utf-8?B?NVdnV2VoZWEvSE80MGhLSlF0RmVGUStvQnpmTW1jdzlwR2E5M21OaUJ5YVox?=
 =?utf-8?B?RjZ4MU1mWi9Cb0tod3BhSXBFM3pzRU0vc0twUkxjSVdCNnpyS3pKd1R5TFNI?=
 =?utf-8?B?MTVZZUxFaHYvZ2NqU3JWT0x2QTM0akVuNG1hVEJLSjVOZmVqYmcvTHprMWVP?=
 =?utf-8?B?d2VNVGNSUUg0ejNYcUM2cmVRWTA1Ny91ZUFxZzRJWmtPQzJaQjRYQUJiek9h?=
 =?utf-8?B?a1Z4Z2txLytLMytjdVFIM0JsRUJuaWVyMEVLbDkydGZRalRhdEVuRmRGaUcw?=
 =?utf-8?B?QXZVVUNGRHJJQmI3ZVg3NWd2THljdXlOamlkNit2dUlNUWZocFd0ZDJGWldP?=
 =?utf-8?B?S1pOV3kzTDJqRnVzNEdCTFRQVHRyMDlIdmhDVmVJaUN1WVZJVG5qQkVnZVNl?=
 =?utf-8?B?ZVVVVm5yT0pIMGxXK3ZQcDNUTjJYcXBPOWx3SEl5TXhVUnJETFM4bnNNVTNO?=
 =?utf-8?B?ZVo0ZE14NVRIb3FBd1UwT2RoRmlWaitkR0hrRHREb1ovYWlqaHp4VmNDVWhH?=
 =?utf-8?B?NXpFbUN0RkM3dG1FcW9JZklSd1oxMmRyNXVyWkFJTjI1YVdmQy9oenZWUGRM?=
 =?utf-8?B?OEV6R2x4TEFQdTVqeTExS0FzTnRSWWVQWXhNVllDZXlMU09CZndzMlBpMnJQ?=
 =?utf-8?B?TWR3N0NTeDBXc3lpOFA2QzJIaGlKdlFoM0QzRmVqdExUMFdKTUxaeFFqYzN2?=
 =?utf-8?B?Q3VwakRkVzVqN1hzK3FXN002ZUQrTW0rdXJLSjNlZ3gyeElYNG53bzdHcXpp?=
 =?utf-8?B?TEdaa0FWWXRiTEp1SkwyK0ZLNXdCdkZ3TlF5Y25hdld1TUgyM1RkNzV0MGsr?=
 =?utf-8?B?WXhMSUZXc2hEZDNQeXh4YWlKVFFXamtzcy9YTUEyTmRzYWtTR0ZMaHlIbUsx?=
 =?utf-8?B?dzMxUTZTdFoyZTE4MnIrQnNpSGRwbmRGSmJaVUU0Z3ZkZi8venhsWW5xM0Qy?=
 =?utf-8?B?ZUswbVVIYWZJN3JVVkNsR3VZdWJOQ1k1bDhNVlZQUnlNWUZ0RFVvT2s5NGp5?=
 =?utf-8?Q?ioAbAlO+SmCs4Xxg/O0+/WU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2047fb41-4d10-4bcf-e7b5-08d9dce667b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 14:00:39.1096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Jjt8goHzSxnNeLEeIZCfXofNRngDKTmzYoqN4UFY0VVlKgnM9zlt03wCrnu5m9cxNl/qApgjUHlIDTjq1VTMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2651
X-OriginatorOrg: citrix.com

On Fri, Jan 21, 2022 at 01:34:54PM +0000, James Dingwall wrote:
> On 2022-01-13 16:11, Roger Pau Monné wrote:
> > On Thu, Jan 13, 2022 at 11:19:46AM +0000, James Dingwall wrote:
> > > 
> > > I have been trying to debug a problem where a vif with the backend
> > > in a
> > > driver domain is added to dom0.  Intermittently the hotplug script is
> > > not invoked by libxl (running as xl devd) in the driver domain.  By
> > > enabling some debug for the driver domain kernel and libxl I have
> > > these
> > > messages:
> > > 
> > > driver domain kernel (Ubuntu 5.4.0-92-generic):
> > > 
> > > [Thu Jan 13 01:39:31 2022] [1408] 564: vif vif-0-0 vif0.0:
> > > Successfully created xenvif
> > > [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed:
> > > /local/domain/0/device/vif/0 -> Initialising
> > > [Thu Jan 13 01:39:31 2022] [26] 470:
> > > xen_netback:backend_switch_state: backend/vif/0/0 -> InitWait
> > > [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed:
> > > /local/domain/0/device/vif/0 -> Connected
> > > [Thu Jan 13 01:39:31 2022] vif vif-0-0 vif0.0: Guest Rx ready
> > > [Thu Jan 13 01:39:31 2022] [26] 470:
> > > xen_netback:backend_switch_state: backend/vif/0/0 -> Connected
> > > 
> > > xl devd (Xen 4.14.3):
> > > 
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528
> > > wpath=/local/domain/2/backend token=3/0: event
> > > epath=/local/domain/2/backend/vif/0/0/state
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac569700:
> > > nested ao, parent 0x5633ac567f90
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180
> > > wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event
> > > epath=/local/domain/2/backend/vif/0/0/state
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:1055:devstate_callback: backend
> > > /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting
> > > state 4
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528
> > > wpath=/local/domain/2/backend token=3/0: event
> > > epath=/local/domain/2/backend/vif/0/0/state
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac56a220:
> > > nested ao, parent 0x5633ac567f90
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180
> > > wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event
> > > epath=/local/domain/2/backend/vif/0/0/state
> > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > libxl_event.c:1055:devstate_callback: backend
> > > /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting
> > > state 4
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_aoutils.c:88:xswait_timeout_callback: backend
> > > /local/domain/2/backend/vif/0/0/state (hoping for state change to
> > > 2): xswait timeout (path=/local/domain/2/backend/vif/0/0/state)
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_event.c:850:libxl__ev_xswatch_deregister: watch
> > > w=0x5633ac569180 wpath=/local/domain/2/backend/vif/0/0/state
> > > token=2/1: deregister slotnum=2
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_event.c:1039:devstate_callback: backend
> > > /local/domain/2/backend/vif/0/0/state wanted state 2  timed out
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > w=0x5633ac569180: deregister unregistered
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_device.c:1092:device_backend_callback: calling
> > > device_backend_cleanup
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > w=0x5633ac569180: deregister unregistered
> > > 2022-01-13 01:39:51 UTC libxl: error:
> > > libxl_device.c:1105:device_backend_callback: unable to add device
> > > with path /local/domain/2/backend/vif/0/0
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > w=0x5633ac569280: deregister unregistered
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_device.c:1470:device_complete: device
> > > /local/domain/2/backend/vif/0/0 add failed
> > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > libxl_event.c:2035:libxl__ao__destroy: ao 0x5633ac568f30: destroy
> > > 
> > > the xenstore content for the backend:
> > > 
> > > # xenstore-ls /local/domain/2/backend/vif/0
> > > 0 = ""
> > >  frontend = "/local/domain/0/device/vif/0"
> > >  frontend-id = "0"
> > >  online = "1"
> > >  state = "4"
> > >  script = "/etc/xen/scripts/vif-zynstra"
> > >  vifname = "dom0.0"
> > >  mac = "00:16:3e:6c:de:82"
> > >  bridge = "cluster"
> > >  handle = "0"
> > >  type = "vif"
> > >  feature-sg = "1"
> > >  feature-gso-tcpv4 = "1"
> > >  feature-gso-tcpv6 = "1"
> > >  feature-ipv6-csum-offload = "1"
> > >  feature-rx-copy = "1"
> > >  feature-rx-flip = "0"
> > >  feature-multicast-control = "1"
> > >  feature-dynamic-multicast-control = "1"
> > >  feature-split-event-channels = "1"
> > >  multi-queue-max-queues = "2"
> > >  feature-ctrl-ring = "1"
> > >  hotplug-status = "connected"

The relevant point here is that `hotplug-status = "connected"` in the
backend xenstore nodes, and that's set by the hotplug script.

Having hotplug-status == "connected" will allow the backend to proceed
to the connected state, so there's some component in your system that
sets this xenstore node before `xl devd` get a change to run the
hotplug script, hence me asking for any udev rules in the previous
email.

If it's not an udev rule then I'm lost. Do you have any modifications
to the Xen tools that could set this xenstore node?

Regards, Roger.

