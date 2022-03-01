Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A24C876C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 10:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281027.479171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyUn-00040B-Nq; Tue, 01 Mar 2022 09:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281027.479171; Tue, 01 Mar 2022 09:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyUn-0003xa-Kh; Tue, 01 Mar 2022 09:08:37 +0000
Received: by outflank-mailman (input) for mailman id 281027;
 Tue, 01 Mar 2022 09:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfhu=TM=citrix.com=prvs=052ba2b28=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nOyUm-0003xN-LJ
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 09:08:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b6a561a-993f-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 10:08:34 +0100 (CET)
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
X-Inumbo-ID: 2b6a561a-993f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646125714;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jtaHO/6yv8fud/lDlGDMwHCV2yhz0Ye4vvTfd/lzXac=;
  b=cc2zjPm+G/PpglAfgooTz/J12sjuXJX79TepyJeQt2HhaIQxpEyEowee
   fRvc+YSRGB0q9PPrxvinaFGF+FbqlkWQ5oBn/HDnnjWvbkajyMx6CHHwZ
   jqcbwJKNsmcAyOGAPIKcOt3WBmdOObPwNdknCtWBl8gLrS28sng/8M0FO
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67485720
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rUKaeqB5kOv34hVW/w3jw5YqxClBgxIJ4kV8jS/XYbTApD92hTMHx
 jccXG7Qbv+DYTb2eI8gYYm08UkDu5SGyIBkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhO5
 d8XlqTzcj4MN5zoqdkUdiVFPgRhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg2tg258URZ4yY
 eIEdjszQzvBPyRpN2UtWJES27izpFPGJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmu/OhmX6Q8QbTLmj8fhCj1iax2hVAxoTPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l9YfeuSWhRVM9azdwTO0bveoKWBEPy
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94ddO51rXHb5
 RDofvRyCshUVflhcwTXHY0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2O3O
 BCI518IvcYCVJdPUUORS9jqYyjN5fK9fekJq9iONoYeCnSPXFXvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQtSfChjWMuv8JQ/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:/bwf7Kj0kXKi9WQp0XAEYd+c+3BQXzZ13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZ0yHtycegH2w
 3+CNUZqFh/dL5mUUtDPpZzfSKWMB27ffueChPlHbzYfJt3SU4l7aSHpYkI2A==
X-IronPort-AV: E=Sophos;i="5.90,145,1643691600"; 
   d="scan'208";a="67485720"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUU6ztCNxhRi+078GXNnr6PR/+2w0XUyxyHtKAJGvxKNopyvvILyuuMPTPdUqufTbY/ck4AGenarqoIoVwLldYRQa9bIfmEobWFA2E1hQSpUsluxqPQOlaP+gCDYxzY0CZvlIRDki1RSrZuDwk8wVpvNoKwVPOn8bEMjS1pFT++5kmtx3+3XD4iLlxx7G9nXVrWgG83KSp06j58AHrbN51sH9RCMlQQ6gQkEJeo56u7yg5iKfMKgYSI41V3tTpGaKdH039w94dl/oZQwmNyJe9JSTSM8MstxkbJKbHG3000MFR2xuhx9kR7iUDBXkiagOFA+5F6oTJ6lX2CxITesMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8fnzI4GTrw9523cEd4RFODQB3qr1XuIkTA83vsrJqM=;
 b=mX/ADKwkK7oTvl7kA+1P7hqNr4g9BgbnbT+QCrgj0lzQtkniQWnCUYKyXLL+iPwY4yehkwDQpPESKpv9AWQlOLFTf0OuZX+Bvi6CuzvAG+41iMnDloD411hyu8Si5/GtAS3KdPA+ys59xT+ttaG3GgcymIzCcr+sUdQ2PoUGhto9dOqbShpromaSR81ljDB7ZZtCpfLlQnMn8hIS8rdvO16XeAJdLS3EozU6jZODEX1Xzau80j32wPk+mb0+yvkcl2qFjSo9UEEI1iFhlQWwsOJSNSGTVnla5wP3fb6Rpomxm2nS/0JAtgFAOjKy9rTe6kWN/EDbfbcEBMCaZH2vzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8fnzI4GTrw9523cEd4RFODQB3qr1XuIkTA83vsrJqM=;
 b=QyFeJyc/mbZ/snlA617vD0ELUIMF/PnLKkfFdo2YFl3+lSMcS8b59PEZ9Ng+im1bZQEtWzPPC+G673oc6c0eIqbPlJOIdcHwuZq6W4xvpkPUHRj2J48XtzP5CIYz+cjjueWGtkKrahXMUQ1p8SBl/waZgTXdAUx66TTd4JOGT+A=
Date: Tue, 1 Mar 2022 10:08:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.1 2/2] vpci/msix: fix PBA accesses
Message-ID: <Yh3igzWQQO+Nvf3+@Air-de-Roger>
References: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
 <20220226100554.2664-1-roger.pau@citrix.com>
 <8597cd20-4d79-0f5f-8370-d2353e7116f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8597cd20-4d79-0f5f-8370-d2353e7116f7@suse.com>
X-ClientProxiedBy: MR1P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf0202e-27d6-49f5-1019-08d9fb630aa6
X-MS-TrafficTypeDiagnostic: CH0PR03MB6099:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB60999FF50709D88AD15E19618F029@CH0PR03MB6099.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BFVsLTExQXoDluL+RcpPtOrI7tY2Ejp5h3c3JMBL6wiPn2XegRkoGHMNDRbl2ZXVwejErq9FHxLOcHUhp/E2B5X9QSO9WuR1NIzaSwAHKWAGx8kUke41QjQdtJhImAa5Y1ZxfyUiPX3WeImHJuQKZiBoybG+4e+ISN495ABp1QbWunexh3E/C5sPHhzPhzVua2oF0aD/eAhRRkztRpACvw1U52WhYVe/L5gVuUjq1KPb8JZ0kJCbrlbTdFRp7GUEwW/OWj6rvB6NTls0tfydD0kAC5oWHix1M/FeGM9xHi8mg+ra5GCAVfMXGhQ7ihN4xeZAEf+gKEWDjt+BlHIunL1g206oTLCEAO/ytGvAkb1q7LhJfGGP0/GOPshSkphAD5KiUoYH3cey0EPwn/BGd11uugt7Fw2re2CjqnSwaSthUP0AWt9MYXX0T3x26mdA5uuu+r8XOLc6roSLnFfvCZ0pbsmJg5s17ifpFv7CdKW4hgELjjP7tzXVTIrD8sQA0dhR/h3WcHZ7nbGLXHqSQp7D0PW5RwqAmtaSDHVBgNdWlCcKtWfQzlJ6wVGDx+xvCNil39+Om3BfvoKFw5YD2j659EyUhxPV0MbNNpmjxNsyHF6kvcXpCJXaYz8IMgkh8YQsXAoOdb5zEbgtmAioHigL8G9Kt2MMMYs5X/x2+cUAvf7k+ZhOyTB/EU0p5v7UlYqD/DHRT7GkYzKKw/YQ9yy75a3FV7s0NOtsUMMWJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(966005)(66946007)(8676002)(6486002)(4326008)(508600001)(66476007)(66556008)(85182001)(8936002)(5660300002)(6666004)(9686003)(6916009)(53546011)(316002)(33716001)(6506007)(6512007)(186003)(38100700002)(83380400001)(82960400001)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1VxbnJ4UzQxUmZLMkgwelEzcnZZYW9oNjlnNHM5ay9Pa1o2SzlHMjJaMUZo?=
 =?utf-8?B?aFIrcWJwYXVXRDIxZys5Y2JuS3dhbms4MXVHREFrQ2hhazYvSFNHV0VSWThI?=
 =?utf-8?B?VTJTL21qRmFJb0t0YzFBWHp2bjR5RzZSck53NTdnazBWMUtYOW00REthSU14?=
 =?utf-8?B?ZXRBZDBob3VZRG5OVU9xcXJ2TXcvdjh2a1lRbW43MW1Ob2x0SEFoTWNOUjl1?=
 =?utf-8?B?NDVSWHNpR2pYS1dEWm5oSFE5Q3hzWmFmUHYvMUxQRWxuVDROaTRQbXBvSTEy?=
 =?utf-8?B?SXVJRmNsdlZCVjVEY2xaN05POUFscVFscWtoY01ueVlLalpMSTFONGJMRW5k?=
 =?utf-8?B?M0FsYVNiL1pvZ2wvTEp1MlBMZEd4SmdZMDNPT3AreGtXcm1yUGRhWnlEQ0VF?=
 =?utf-8?B?WWdNZzA0S1lxaVUyVnVuakFIbUR0bTlIcUFoajNDSWdZdm1nNVA1aVBETjJG?=
 =?utf-8?B?S000Y2NlWWU4QWlnNThFbnhzdllmWUh4L2R3N094MHg4MEE1K3ovTlhnT1c3?=
 =?utf-8?B?WUphcXNIZGgrRXZJekdQTDZ5eUFBcXJlNS8rSDJFWHJSejNzYUxqcFpNMGVz?=
 =?utf-8?B?TXlQbHhGdi9IWUEvZGdRR0xMMkxSamdrLzVZSDBPM3laV3ZjUjB4TWc1Y25l?=
 =?utf-8?B?Z3RyVFl4NU14cTdicjdXRmdZYnJRYVZzSklLcEw2Nmtyb3ZEeXNrNHFNc05h?=
 =?utf-8?B?OHZ5VXdvSUc5bm5LUXpwR1o0ZjFBSVhKTzFjeDBVMzFGendiYWVtNzI5Q1Ex?=
 =?utf-8?B?VDN1SzVQK3JUalFtTi9ZU3RMenZIZFNaUE1wZjQrZ291QlFxZjRkUmRaTXB6?=
 =?utf-8?B?d2tOcTF0T3lQNURXNGtPOVFZQ3FIMldSUko0SkphMGtwdGRpbE5pTDNGY3d3?=
 =?utf-8?B?dUxpeWg5YS9WQnF1ZnRlWkNPRFFvY0czZEpVM3dPRzF3ZklsT04wdGV3NzJr?=
 =?utf-8?B?aWhPQ3N5aTFaaStYaXNHMDRHUG9CUkJMelBsR0Y2TzFkN1YxWWZRQjdwc2ls?=
 =?utf-8?B?RDN6VnpXSXdiejNESnl6Q2Nja0hJdGx1V04ycjRpakp4dktDMXNoNTJyOVB6?=
 =?utf-8?B?UlUzRUJwa1RjWCtveCtNZ1RhdDR4dmt2NTM2TVh6K3ZvSXBQUnZXQTVySGpt?=
 =?utf-8?B?bS9FR0tJNURGcXFVVnBUUzI1WWhLdmFqcG44OFRJZkVQYng5WFRvdzRxUmc1?=
 =?utf-8?B?VXlJVlhrMGNBSVdBRmdFN0ZJcUtBZDhpOXFCdFhJc0E0cFlmRzJTdUFyV3hP?=
 =?utf-8?B?Zm0zMDZRdnQyUllpQ2tNTjRYTGNjbDI4TGcyZGJaekhFN2ZPZkhvZzNjV0JL?=
 =?utf-8?B?bUtISjBhVnd4TVZRczNpWU5wUmFmWXdPeDVPTExsM1pTYllrdXliRUViODBj?=
 =?utf-8?B?WUZHWkx0dVlPMFFqMWRZbWZmMEdTR0FoSVM1TUV6MTlJeXE3TDFRQmpsSTNl?=
 =?utf-8?B?WEdaVDJHVmYxNFNLZ0NQSUltY2V0S0NKUUlST1VERUhZZWNuSGQ1eXRtWU1i?=
 =?utf-8?B?K3RXZ0VLS3NWV3ZSYzF3R1hqajg2eXNhKzhTT3R5NXE1SmNxaGxZUXc0alFa?=
 =?utf-8?B?c2xEaTcxdzVocnM2UE10THJOWDFzMnpUSGpsUm1heGVWaTRIbVZvaE5SNjVM?=
 =?utf-8?B?RjF6R0s1NEtpOWRGYmtleXBGZW5hREQrZSs5M0RLYkNXcU5USzNtcFVBWHYx?=
 =?utf-8?B?TVUwY1ZzZDRzSzV5Sk1sdXhncHNXRTJycmlhMHZPMEZDSTdUSlk5QjZWV25H?=
 =?utf-8?B?YkdKWXZDRENsREdUdEQrTkN2MHJwVmJ5RWFxdFJQajBqa0ZycWxOU1lvMzBK?=
 =?utf-8?B?K3dETzFBZWJnUlBMaStoNklVdU9abVVNWmhzTU1vUmU3UVpQYnMvTjNoSGxr?=
 =?utf-8?B?N0hyRGZFNXdmK3ZQRmRGbmtlK2ZycVpHQWpOV0YzVEJDeWVISUxvRXpYNXRH?=
 =?utf-8?B?R01nbWxSbDZuRjBHMlpLdzk2cGpmNm4zWjRXWDl5WlkreDBMandSc2NwMlh5?=
 =?utf-8?B?Z2l1andXVm8yU0gwajJmcEwzWEFaUVRWRnFhckx5RGxkb0Z1bWhwT0trTy84?=
 =?utf-8?B?YWlIb1Mrd0loZWN1T1lDcjBRa2JiMGxWaTBwZkQwQkpINk04RzhXSEdKRUho?=
 =?utf-8?B?V1Q1TVh0SEtPWi9OTFJmdkJ1QXRwVG5MMDdoUVhEd25MWVNnOHpDSEFLRGpj?=
 =?utf-8?Q?5+7IsfFB/dDkyquUY9++XxU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf0202e-27d6-49f5-1019-08d9fb630aa6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 09:08:25.0656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XsJ3V9DMn9wFtQTVfQ+cREKQku8NAtRrvyYz/HCXhWL9IStm5Uk5He693xLhYxZ4HqklJF7IEhT5wCwP9Egwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6099
X-OriginatorOrg: citrix.com

On Tue, Mar 01, 2022 at 09:46:13AM +0100, Jan Beulich wrote:
> On 26.02.2022 11:05, Roger Pau Monne wrote:
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -198,8 +198,13 @@ static int cf_check msix_read(
> >      if ( !access_allowed(msix->pdev, addr, len) )
> >          return X86EMUL_OKAY;
> >  
> > +    spin_lock(&msix->pdev->vpci->lock);
> >      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> >      {
> > +        struct vpci *vpci = msix->pdev->vpci;
> > +        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> > +        unsigned int idx = addr - base;
> > +
> >          /*
> >           * Access to PBA.
> >           *
> > @@ -207,25 +212,43 @@ static int cf_check msix_read(
> >           * guest address space. If this changes the address will need to be
> >           * translated.
> >           */
> > +
> > +        if ( !msix->pba )
> > +        {
> > +            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
> > +            if ( !msix->pba )
> > +            {
> > +                /*
> > +                 * If unable to map the PBA return all 1s (all pending): it's
> > +                 * likely better to trigger spurious events than drop them.
> > +                 */
> > +                spin_unlock(&vpci->lock);
> > +                gprintk(XENLOG_WARNING,
> > +                        "%pp: unable to map MSI-X PBA, report all pending\n",
> > +                        msix->pdev);
> > +                return X86EMUL_OKAY;
> 
> Hmm, this may report more set bits than there are vectors. Which is
> probably fine, but the comment may want adjusting a little to make
> clear this is understood and meant to be that way.

Yes, it could return more bits than vectors, but that area is also
part of the PBA (as the end is aligned to 8 bytes). I will adjust the
comment.

> > +           }
> > +        }
> 
> Imo it would make sense to limit the locked region to around just this
> check-and-map logic. There's no need for ...
> 
> >          switch ( len )
> >          {
> >          case 4:
> > -            *data = readl(addr);
> > +            *data = readl(msix->pba + idx);
> >              break;
> >  
> >          case 8:
> > -            *data = readq(addr);
> > +            *data = readq(msix->pba + idx);
> >              break;
> >  
> >          default:
> >              ASSERT_UNREACHABLE();
> >              break;
> >          }
> > +        spin_unlock(&vpci->lock);
> 
> ... the actual access to happen under lock, as you remove the mapping
> only when the device is being removed. I'm inclined to suggest making
> a helper function, which does an unlocked check, then the ioremap(),
> then takes the lock and re-checks whether the field's still NULL, and
> either installs the mapping or (after unlocking) iounmap()s it.

I'm fine with dropping the lock earlier, but I'm not sure there's much
point in placing this in a separate helper, as it's the mapping of at
most 2 pages (PBA is 2048 bytes in size, 64bit aligned).

I guess you are suggesting this in preparation for adding support to
access the non PBA area falling into the same page(s)?

> > --- a/xen/include/xen/vpci.h
> > +++ b/xen/include/xen/vpci.h
> > @@ -127,6 +127,8 @@ struct vpci {
> >          bool enabled         : 1;
> >          /* Masked? */
> >          bool masked          : 1;
> > +        /* PBA map */
> > +        void *pba;
> 
> Here (and elsewhere as/if applicable) you want to add __iomem, even
> if this is merely for documentation purposes right now.

Will add.

> I think you did mention this elsewhere: Don't we also need to deal
> with accesses to MMIO covered by the same BAR / page, but falling
> outside of the MSI-X table and PBA?

Yes, I did mention it in a reply to Alex:

https://lore.kernel.org/xen-devel/Yhj58BIIN2p4bYJ8@Air-de-Roger/

So far we seem to have gotten away without needing it, but I might as
well try to implement, shouldn't be too complicated.

Thanks, Roger.

