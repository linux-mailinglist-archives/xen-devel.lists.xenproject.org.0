Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B44F939B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301413.514400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmbU-0003lc-Op; Fri, 08 Apr 2022 11:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301413.514400; Fri, 08 Apr 2022 11:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmbU-0003jm-Lk; Fri, 08 Apr 2022 11:16:36 +0000
Received: by outflank-mailman (input) for mailman id 301413;
 Fri, 08 Apr 2022 11:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncmbS-0003jc-96
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:16:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57071bb8-b72d-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 13:16:31 +0200 (CEST)
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
X-Inumbo-ID: 57071bb8-b72d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649416591;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ky3iroG1Yy0kR0KlTHtg7jmW1vpDs+uS0YRCiszdGJs=;
  b=JqCxJ2JBAIdeMVMC8AcYAeVi51tuO12UBdzwcggbNKI1C4RVkL8utlK3
   sYCprXG2ty0IqHGhJ2Ts8OnYOvQOWKz35Zaih73b1wzzofhpYOLYtxiZP
   G0sQ5s6VohCFZAGFBi081COXi8MpSn9GJPrcbVuhYMhusNviRGlNB8Yjo
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67773439
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:O66NN6+Zb94I3HZcXYfoDrUDcX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DZMUWyHPv7fNGShKt51b4mz/BgE65bTy9FqHFM6/n08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YDpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYe/UxUtBIj2ou1HayRhEht3FKhm8rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4RQqmFO
 5FIAdZpRAzZeD8UFwslNLYVwea1r1SgVxMDo3vA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6GLOx+fFrh1mS7ncOExBQXly+ydG+kVWiVslDb
 kUY/ysohbg/8lSxSdvwVAH+p2SL1jYeRt5RHusS+AyLjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWnLoJn8ox8p+B9Ar/vgutnJHgSy4/6VCCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI5lypUQDPY68PhwxUjaoSsIsHONg1HszDXN8J0i3zCARfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+N6nHBjmDOMGsmip/hC7VZ4TCTIIVviGAHQBt3VEYve+FmFm
 zqhH5XiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbYSjeK7FoJUqeLqZt4ItQNt/0Myo/go
 yHsMmcFmQGXrSCWdm23hoVLNeqHdYxhtkgyISFEFQ/ugxDPl670t/xBH3b2FJF6nNFeIQlcE
 6FeK5rdWKwWItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nky
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:adNX2qu+LGRer1iet0jTsh6x7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="67773439"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTIPbd402Vd00pq+NH+ZhnqQjAGhRCsjM9fDz/VX1FbRH8Wn1Gyg1NnjM57XSxLBs74EV5qz9N+cLlzk/UAAkrCmvDUqnXD6TpYd7WwplI4j6xoAttF3wuK7ZeEjZb+lvowcSasWvDpgJa9+NcG89stbbkX27NDg0K52BFuGXA64LjSab3kdMLlIR0+ej21icRksRvuvlahRNg5QuaHDKQwGPxIBLDkTAP1yxKAVlEATODFIN3GuG9QOnpwk5bWFeoyGzMx1hZDjTphNR2eAECzKxoIbT1+IaqjFDESTXN8FUw9EGZWv9lHlwi8/NXA75wAS8mVHqCyLnnF7Z0l76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHBUewqf1lhrLr+WV0/oLjO4AS+vJmrXN10z5b0fMjI=;
 b=bsvKaTkh73p+bgI6rzoBwpNGKox8mlf6IhXrahpHVYy0ZX7Y+6vGrGK5b7xLD6TTVltb3rJQcUUWwkorpmUOotDY+iPwYdZ9neoX+5hA5aQv0bT3cTp0vGLCnc1iyxwFhZgbCt3YJBEJ7dCboj3tnRVF7W9qeq3fWx7XzVdTVCfyJm5eMgeSZLqVdfrpYjqTslbhMQ2X/03GbkAJT85SkvP2JP5PPep+hm9DLvYBxehC+bCIasvnC/SFV/3EgexGSJwwwc23Vit7H/4dJh/CQrOnQaQSysqfTde9ZlYSgwf1hhQn42JfCosHvgGl8a2fRBiwRNk9suWfNyVpsF2v4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHBUewqf1lhrLr+WV0/oLjO4AS+vJmrXN10z5b0fMjI=;
 b=nipdkZ5UzGRMZCB9BwO0sc67aYUZZ+nBiVPurSrvkx+DQyTTXf0mOxs7n6j4RUk+EZUQoiyei05OzoYLD6nAcR29Zl8iS5mOktkobC20EPCz2rIIdC1SaOe8GVYx/YC7aMbjDI1Ite82KSNnT0QPDIDoFUryZrcU8P8mnmUVAV4=
Date: Fri, 8 Apr 2022 13:16:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, osstest
 service owner <osstest-admin@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Dario
 Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Message-ID: <YlAZhWVFziwoL0rb@Air-de-Roger>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
X-ClientProxiedBy: LO4P123CA0184.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcc1f283-e11b-4dd0-5363-08da195138d7
X-MS-TrafficTypeDiagnostic: SA1PR03MB6628:EE_
X-Microsoft-Antispam-PRVS: <SA1PR03MB6628A9786558EC3309CB67238FE99@SA1PR03MB6628.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X88hkNNQaZSXsRW040nIpk0H+MkOoFnjQ/lRpcV3E12ebYfjNxeo0hRWnfUKxnmhyNxCapfqxMjaC1rqMEgkemX+bsHkHLAZWFmTq92MaREdLzeV8hOH07wCfa1DMcseQ8sdOC2e0u8cnvLfMf07y+ilpu/yEV3DQE2C61gbIm+vGDw5DloYEo18YTpWOpTxsVTK2YIlbb9+pElJf43Aw6Vi+uwJ2aJ12UNaxkXHF1rpGTO+OYJf5inT1YUnZpHpwMKE1rlTSO44qmq82L/opRoqTUc7zOOgq5oM5hilaZ9XbiY6fyOc9n4l9bwhHG09GkBDh8HEANi/IzTYLjR7kBbS3Skbt9T7d/oHFLua04gJRyPLpxm+BMvop0tsCU0Yge+RKE2dMs3pg/DOpleFp+foXioyqBgpcH/23JoOwyGLbZbB+B24Ipj5KZcaY4v+98e9J1v5EzPtKday9b9l4OO+wzV3f/KymwSG3eYiDymsdAluit0A5UwfnxRmB0X15G5RxWLORV+qRLl7djSdce5/oFrLIr/eswfAq/DqxBo7++9TPtYK5Yy9joXwPq/criXQq+6L4vEpnYoU3sDzvjGIGDAEAkZ2coE9CK5Y6JSjYSDWB/9k4x/cmuM+Coaf2zzP7H65VJrhz9t8plLCnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(66946007)(66556008)(66476007)(8936002)(38100700002)(6512007)(33716001)(82960400001)(9686003)(85182001)(6916009)(86362001)(54906003)(6486002)(508600001)(6506007)(2906002)(53546011)(5660300002)(316002)(83380400001)(6666004)(8676002)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0pCblRHNFNuMkhLVGp2SDNiTFpwWHlIUVFacGVGVjBXdms5ZjJFTnRORGg4?=
 =?utf-8?B?bkgzdGlBMklOR3hKWlhYbnBBMWJQQ2orYmNseC9HWUt0Q0hZeUE0cGRjMVpZ?=
 =?utf-8?B?Wi9DTVVXUThQdmFBRlE2YlhRTWk2b0dTVnIwOVhqZUNGcnJMNGhIcVplQnBs?=
 =?utf-8?B?UGluZ2dCSm9VM0FWRlVVdS92TUFlK3VNZWhaUExVamdsRW0vMld2ZnhDWHZy?=
 =?utf-8?B?RmZxZ1JyOWJqS1RnNlRyMnFYVkMwdGlBb1VteEpHUG5rN3hBcUpxOTFEeWdU?=
 =?utf-8?B?TnlvOEVVaDZuOXVSdFdydzBaWHhvWjRkSnJ4d2dMWGVKbVphNUhDTXZQSTdk?=
 =?utf-8?B?TW9ycHZob0x1YzV1MXIwWGZLRU5QWFVFYXdWV0RUSGkvYjZCdWtQKzVtWG82?=
 =?utf-8?B?eE1tU2loSElvKzBIWlBCT2hVcU5yQ0lFTCt4QVVyaW8rbHVnaWo1cDJlOWJ6?=
 =?utf-8?B?VmtHWjk0VjIrZHh6WmZJWkxrVFpxOVN2b01QYUlqWmdWQm9vMkRTTEx6VWQw?=
 =?utf-8?B?a2hYLzJBWGkvN2ROeDJTREp3YnRia3IrR2h5VlNhazRkMHR3SEpOdnJ0aXRt?=
 =?utf-8?B?YWpGa3hwNlEzSVJnT3VDdUJ6dGk2S0F4QWpQNThKZjF0bUwyZjZ0VHQyQ0pv?=
 =?utf-8?B?MEVZejRTZDMvT05YNVFITEtNMjRhZzNWbncvZWRPTlp3enNrMVVyTUFWNy9l?=
 =?utf-8?B?KzRDZ2lpRjBDbW1hUU9tQVh5TWNzVUdObGRPZkszZGdINUdvSDVMMDJTa0Nm?=
 =?utf-8?B?YXh2YTlBS0NYSnE2WXJDWElKcVl2dmZsUlVHRkl3SjlWRlZFbE1YOElWdlg3?=
 =?utf-8?B?dllQWnBjZUxaTHpkM0c4Tk93VUUvc2tJR0oyaTFiaG5KM2JLQXRhNTk0d0Yy?=
 =?utf-8?B?YTZ0ZzhpaDlHL08wa1pIQ3FVSVhDTGJsYytQbjFSQjBlZC8yMzN4amQ1aE51?=
 =?utf-8?B?bE5weWVhYzYvN0tnQ2lvb1d0aSs4WWlLV290UFlVYjFpcXg4bTBVL012U1JN?=
 =?utf-8?B?UTJpbWFzUWhVbSswOTBOSGt6NmJyWWx2VXJUZGtyaDhaaFBRRHkvUVpGRUc3?=
 =?utf-8?B?azBHYnBnY3FpY2NpRmFOeDRZZXNUVEcwc20xem43NERHRnJEb2ovRkdaTDNX?=
 =?utf-8?B?Q05xLzYwenRQS0I2OC9xUWk2Ym13L3YvaUhaMlMzcGU3UmcrbGFMeFVqL1Vp?=
 =?utf-8?B?cUM1ZVg3VWJqQ0kzYXhCVVQyUHZSM25Za2VUU1A0dHRrZEVjVC9QSzFuUzZk?=
 =?utf-8?B?eEdtd1d4bmQxN240QlNBSDdLR0ovaGJFWDh2YTlNSEpMdzlVY05vbGs0TW85?=
 =?utf-8?B?M05rRGVtNmFIaEk1QU4xbXVOWjRoWHVHYXo3NW54dnRaY1Z2Zk9DUEwrcllG?=
 =?utf-8?B?MVBabjRIVkgzTWIyMkZWUThBelpNWWw2TG1yZk9YVFkyUVJ5UUN6N1NndmdP?=
 =?utf-8?B?Lzl4MVFsZm12dkpYdkNIYzBaQkpnNUxKRUxTNUtYS1gyV3VVdTVOY3E2WkJJ?=
 =?utf-8?B?OXE2WlBVQ3hQYWNzbDVtZ1J4YzVRaUQyckNHbUpNMXV1T0tWTnFtdjRtaHNE?=
 =?utf-8?B?aThwZlBZY21CZldpNlZvUTFBT0ROOHJwbnU1Slc5VTNONVYrZERIZ3ZzMkJB?=
 =?utf-8?B?MjdVNjVHWG16NldzcUUxZnJ3d3d5ZHFBMkp3YkdLTFFFY3FDVzFTc3ZPVUdp?=
 =?utf-8?B?Y1cwOEUrNFBrZ1U3SGw3eTAwd3BOM2FjdlZOVkllL2NSc0FLbGdqKzd6aHEy?=
 =?utf-8?B?QVlmb2NnQk95UExaVjlYOTRvQmE3Y1NRenBXZUlVNXluSm4vb2dpZll0RVEw?=
 =?utf-8?B?cnhxWER4MVdYOWFVRmFTNC92c1dlNVFxOFI2T01GRnl0eUtNYmNrWXlCbVlK?=
 =?utf-8?B?UnBQQm1MTDZmemtpNzZiUnhrNko1ZStkNlg2ZloxTTQyNi9CY0NLSUU3Mmlz?=
 =?utf-8?B?SWxTK3BvTDIzRGM4elVRY1E2MUxmMFdXOTZPamwyMC94bTJua1hHUERaM2Uv?=
 =?utf-8?B?UDRNaFBrdS84RVFFNkZ4ZmNCWVBlbElVdWlWeVRlQWVBOFBQYzFWeXZaMm9Y?=
 =?utf-8?B?bkhyTmpWeUh0eUs5bE84U1hhdEVaMmRxQWxqSkJxK0V0c3VrWkwvMnFYM0Ri?=
 =?utf-8?B?cytJT2NWNFk1Tkd4ZzZ6aDFrRy9zdlBuTUZyNjI3RTdjS09sK0dyOXpyN3ly?=
 =?utf-8?B?a1gzZ1MveFZsN09peXJKYUc3bk1FVmNCYVA2RktGZ0l0N1FZVXZJcEZWRExK?=
 =?utf-8?B?VHduVDBOQ09ISDBnMXNPSm1hbnNWVTluTjU3OUthZkZVc1B3K1pGem1OSkRR?=
 =?utf-8?B?NEkzMnR3S3ZUWFpsZis5cTZlMmVxTS9CcTZwTFBMMVk0dkFJeE5uRW9MbHl5?=
 =?utf-8?Q?uQjuytQBoeO2XD4Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc1f283-e11b-4dd0-5363-08da195138d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:16:26.5057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2Mbj+uH1LoxfdLFl/RR5EdpdDzY7KL0jhqNTbk8QMZBrlO6AgqPpBg7v1v9DfO/0wz+qrGkFuzNGgjH/J7Lmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6628
X-OriginatorOrg: citrix.com

On Fri, Apr 08, 2022 at 12:08:02PM +0100, Julien Grall wrote:
> Hi,
> 
> On 08/04/2022 12:01, Roger Pau Monné wrote:
> > > > I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
> > > > uses 16 for example.
> > > 
> > > I'm afraid a fixed number won't do, the more that iirc there are
> > > systems with just a few cores in the pool (and you don't want to
> > > over-commit by default).
> > 
> > But this won't over commit, it would just assign dom0 16 vCPUs at
> > most, if the system has less than 16 vCPUs that's what would be
> > assigned to dom0.
> 
> AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will get
> that number even if there are 8 pCPUs.
> 
> In fact, the documentation of dom0_max_vcpus suggests that the numbers of
> vCPUs can be more than the number of pCPUs.

It was my understanding that you could only achieve that by using the
min-max nomenclature, so in order to force 16 vCPUs always you would
have to use:

dom0_max_vcpus=16-16

Otherwise the usage of '_max_' in the option name is pointless, and it
should instead be dom0_vcpus.

Anyway, I could use:

dom0_max_vcpus=1-16

Which is unambiguous and should get us 1 vCPU at least, or 16vCPUs at
most.

But given Jans suggestion we might want to go for something more
complex?

Thanks, Roger.

