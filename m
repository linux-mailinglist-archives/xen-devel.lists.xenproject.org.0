Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D8947AAAE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 14:53:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249810.430201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzJ5b-0005mS-It; Mon, 20 Dec 2021 13:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249810.430201; Mon, 20 Dec 2021 13:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzJ5b-0005kO-Dd; Mon, 20 Dec 2021 13:52:31 +0000
Received: by outflank-mailman (input) for mailman id 249810;
 Mon, 20 Dec 2021 13:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfhU=RF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mzJ5Y-0005kI-Ho
 for xen-devel@lists.xen.org; Mon, 20 Dec 2021 13:52:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f126fda-619c-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 14:52:25 +0100 (CET)
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
X-Inumbo-ID: 0f126fda-619c-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640008345;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=91cR3m/NxJYXyxZ1l2TtTmYuELnfSj6Nff2IWOSUKFU=;
  b=LT2sDJ0kWR4iCsUskoVNwGHNNuCBVTpJy+cN0CI82uTDg/JYM59Xe1wk
   NzvKBQQltPlN7h3MQq/FIYSHtofNuxIyHQs0TzQApgcWBFcWcIEkG8B6f
   EwBKyX96s8gS0elDm/d+A/7S7xmS3ifhsxJelaUClfzCnct5VkzeqUD6x
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v6J7V0aeymLCUi+aXGJM6GGy6qJXtzPIRDygLsUFLu0V+MXaHR3+gSkm5JxXPbqt8BBFWYpS2I
 VL6D4pL9bO2p1al7nTIPYNdR0qSDdW5oky2rqdkctSx+kYVW5o+u6XXD+hzS9QDwOz9IDpSJ3o
 gCIYdd8XYpyko2PyviWuoWUXW4WNsrYRZN45SIFULa7P+v7xy/9t+epJKm0iGUp8NUvYv0s4Eo
 1wxxa+by1a2f2zXbm4ejfEJUvZ5Nw2fpgUfl8O/BRv71pwNnG8h8CNgzjmqPvP6FptbpeVGb1W
 OI9GU7GCHGIJFEhv5zsESV7h
X-SBRS: 5.1
X-MesageID: 62505232
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VPGmlaBJ5RgWYBVW/+fkw5YqxClBgxIJ4kV8jS/XYbTApDIj0zUCx
 mtMWjyBaauCZ2qjeN1xYY61oRsFscSHndFiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+EX5700o7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jBWMkO5w5
 s53iYWTagdyMvHWuf0gekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+XvYICh21YasZmLM/aR
 ZMAMWVVUBGcfiBRGFMSV70CpbL97pX4W2IB8w/EzUYt2EDDwQo03LXzPd79ft2RWd4Tjkue4
 GXc8AzRDBAAOdmS1TeC6FqxneLVhmXgX58IH7C28eRljRuVy3B7NfENfQLl+7/j0Bf4Ao8Bb
 RxPksYzkUQs3EuLS9bDXjOjmkKdnT0cANYMCcwj1SjYn8I4/D2lLmQDSzdAbvkvu8k3WSEm2
 ze1oj/5OdB8mObLECzAr994uRv3YHFIdjFaOUfoWCNcu4G7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNsjuk0djj8hu+cWGJCT9b3gWU3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/ba2yN2g8zQcd7pmvFF5ufkWd4um4WGauUGpxcJW+Bj
 LH75Gu9G6O/zFP1NPQqMupd+uwhzLT6FMSNaxwnRoEmX3SFTyfepHsGTRfJhwjFyRFw+Ylia
 cbzWZv9Vh4yVPU4pAdass9AiNfHMAhlnjiNLX06pjz6uYejiIm9Fe1YbQDQN79ht8tpYmz9q
 r5iCidD8D0GOMXWaSjL648Da1cMKHkwH5ftrMJLMOWEJ2Jb9KsJUae5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:r25Yga2RWN8KBpNRNOI5EQqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,220,1635220800"; 
   d="scan'208";a="62505232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1O817cJsLtGb2t9hvCnTh+e0EBKpeE361UN+H7ROPuEm1cuCq5XSp/1wgvKDFxW4mnJhycYHVJ3oqhbNcsIl05IQiB4BJCAcQ+VGtiMAEU1QNeJQSfdxW4pOzTUheePBtFcnakAXdugEcd/fxuF+x3Gu7icZVFbQDe/0/ky7p7pe2L/pBImJaNDgkjom2M9ettMiAn83gAQ4giVG1NQRD906KwgG629tijZ+iYRBHh/xoHpRoJTpbuFtPuYWIjlrt3dGNsqF/XEPvWGYaDhYiWMMMXgh6lutUymi/aX0qCAL6frKa+qfUf1BcEBzbQZB802KRgJxgZRUlyGK84p6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv0+3kzokXdmEQ/Fdh+QFho2JUgAqqg1nHlzm3hkPWg=;
 b=b9aUdgQ3MDe1OmOdjCRYEEyD4wd6oJy+keEhQrEvSielTIXbj6ERAPfy/k2FHlZdS0hebi+4rhJB8QeEHmFcIJGgp+uarlc2fJFU5D74zjZ/N76+RLcrAmDodJcsrdIaWEbjB7jLsotCssAFufVcYRDiDCtXypI2lWuWnnZ6nzYj82/gnas6xRi6fHst82mLfTeFuN9xR/UHt2CXUoUr5Z9AoreaEwSBzlRH/Kqx5rodWoGtV279Q4bmFH8j9PWtewaxrJVxzk4e4OvaUF4bOYIkoOh6xnFw7lJcUN+h6RLaSIFJafzaDCDgofgzuSaxZVDQApBsXVA1i3HvoeCZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv0+3kzokXdmEQ/Fdh+QFho2JUgAqqg1nHlzm3hkPWg=;
 b=CXkFR0ecy7SaYsZK6qEyaUpDzD4SsbzWImFh7waGeunNugk7vfytLNiIiTuPhbacYoNLElbR+Lm4Kz484OS8Mqf4C5YjWRtDF7gsYS7KkNpl5zu1Su1rFM4yAl455X9dTjh/uRNiLPxn0tChGh6CXWfvxyBSddI922F2Maz0F/Q=
Date: Mon, 20 Dec 2021 14:51:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: xen-devel <xen-devel@lists.xen.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YcCKfx4YivB4U0FP@Air-de-Roger>
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71f9a257-3629-4c68-93c1-08d9c3bfe752
X-MS-TrafficTypeDiagnostic: DM6PR03MB3915:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB39154A654A7B882E77464DCF8F7B9@DM6PR03MB3915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+t4Qxn7h0rltQWwChQ5mKoPSTq7fUfCcaXvBN2yb6UhZV8SI0qPVVEhjp+1HAk6rhMRVibbYvt6SFkq1yOyGv5SjBoUfhCIM/Pz8e1W28X5i+RlF1hS5ccMVAJHmOShwy5ast6Fji3PMo1u7f9DlEUzrVM1E04WpSGaql3aAVbBZuE9y20WrBUkmi4J5c3kg3opy2ILk1DNhlZkEHYHXEO26yXubF5beuF5PtcF4SosXkxhOIw1xCJudwC1bVlBpgMXgO4woSpz+e62eO6AkWC7cvFGQJyXnUsOCE5SjN/jzG/kyubzLUv5GNSCN+c/MJEiIkYmOgk6wXS0xRHAzvXwcTVIe00u865F1/x4RJKPFR7l7QHtoYZRXMk9R71uNjCLlESZQihmF1IT7ye5EJeqPk3sS1CorISJTzj3msqfYJTiHhVnJP8scojDAV8DVVUT1q/HR3MgSkh1FBWaa406V1CNdtdNYOwfiiy9AUsTFdrHMk4EsNCGCk4F0uDPlfvb+CHLXQrOd/dQaCGEqtYIkbklDbqz27ev+8icuWukMgTCuabY/0ftWojy2/mJPkyXj69dnmsJgRy8Y/Db4YfDucPpbiv1wUFFTQj4CZ/5e7x0oBRPven9ooQ27v1yopuyuvZ/XUx4oHDKPSIc/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(4326008)(82960400001)(9686003)(6512007)(508600001)(5660300002)(26005)(85182001)(86362001)(83380400001)(6666004)(8676002)(8936002)(6916009)(316002)(2906002)(66476007)(6486002)(66556008)(66946007)(6506007)(33716001)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnQyZDh2TXJpYlMwMFpFZmFrUEtSaGZ6QXBxZk0zT1QzN1NUUlVxd2ZDOWxQ?=
 =?utf-8?B?YWRYdTFPSEYrbktkaHNYSStFVENvL0pSZ0syWDZkYlQ1dVZ6RE5WY1FTSWpn?=
 =?utf-8?B?UDJSZ2ZtVGladktNTVlxMWhrNy9sUHpOQTNEcU5NTDFPbjNxdVM2NEdCQ0FP?=
 =?utf-8?B?dUdzWm1iQXp2aEZCbGpoUUxWRU5EUVdhRmVnL3lOQmJrR0ZTWG9VeUZnN3BM?=
 =?utf-8?B?UnVEMTh6MHZEaXpRaWd6Vm9maGp3c3ZCQUc4WFBVVnM3Z2lvbHlDeVgrMEM5?=
 =?utf-8?B?dS9MNE5vUVRVSThSR2FtZ0trUmZUL2ZHdUlVMVpVclRDcnhpd3pLZFNOcC8z?=
 =?utf-8?B?d3VsL0VLNTV4N0N2ZUhFekhqS1JxZFJEcWZWeUhxaEdvMk5DTVVUWitUM2tx?=
 =?utf-8?B?TWQ5VlFGSk9CZGY2L25ic093Y01iU2RReUNxMCtFaXhTTkI3RGZYeHMrTCtI?=
 =?utf-8?B?M0NRaTVXRWhnQlA0amt5OWZWZlk0N1VreVNKVlgyUlNXSXpmMHkzSlBlWHN2?=
 =?utf-8?B?aHFsWGlpb080ZFgvUGpRajlaUzEwUnRMZmFsaTJpa3BlWlhDOUVQbGxZWUpB?=
 =?utf-8?B?QXhQRVA4N3VldEdKV0VTNlQrbFVFSi83N3l3UlBWbkk2Umo1WlFGVVo0TEgy?=
 =?utf-8?B?K2RLL3RpMHhpbGwxaE9ZdndCWGlxNzNIeHdHZ1B0QVhqeDlibG5LYXVPdFBv?=
 =?utf-8?B?RzVtVzF6QlVlcW5DQ0FKaTU2ZEhpUkd3QXZVV1VBcC90MFMxaXdKd3VGWHVr?=
 =?utf-8?B?ZnBlb1RGTm5ISzhhUXFuMWlOaW5yVGhCZjYxaTY2S0NjYWlaNUdVVk9yYXZM?=
 =?utf-8?B?SmhqVXE2bXBGSysvSmhDcFlOeWkrblJ2bGsvdVBoRFc2elVqOU5vbWp5YVJQ?=
 =?utf-8?B?UU1LQUt5VGtjLzRZdlIzM3ZZU1JOTHNHVWhpTlA1NWpuTTU3OGYvdkFFZUdz?=
 =?utf-8?B?QXdvNHFuN3gyMnM0K2VROTBqQ3c2Y0t2TkllK3V0VWpVcG5OSWkvMnpsRkRC?=
 =?utf-8?B?SW9OODhPTWJVWDR5TmlhNmtiL0NpS3hmYzFzK2FFVFhudDBXaUUzeSs5ZVQ4?=
 =?utf-8?B?ZklRQzJwc3QrSDRpMGllYm5RNXRQU3pDc1c5dHFLR3NiL1ErZ05CWlovV01a?=
 =?utf-8?B?V2VTUG1nVkd6V2ZRWWwvVFMyVGk4L3JFUjJTSm1reW5NZ3VuSitXQWFnNG1o?=
 =?utf-8?B?WFBTaU5zRUhYcEFPMzAyOWpjUmNtRG56TTdHSkN6bmpyZGVOZkdxNEQxbDJt?=
 =?utf-8?B?eVp5ME9wUWRaVE5FVXYzNi9PZHJDY09vQjdzVTVGNXltWU5sUThFSEM1QWJr?=
 =?utf-8?B?NGJJT3BPT0ZkT0lLTmVjM1JZRXY5WUQzdE5QVDZQT3IvaXZjM1BNZENrdVRx?=
 =?utf-8?B?Z1VjeFg2M3dEYUk1OFlGbm5ncXFVM3AweFZORTVRKzg5bWhKTlU3Um9jbVEz?=
 =?utf-8?B?dmswTUd0ZS9qdG1PeExYcHkvN3ZsN3FNVHVqTHBnOGtEaGlSNDJsOThBTFVF?=
 =?utf-8?B?UVFKRGMrUC8wRVBxNXBLRFRLSHIrclI1aXNBckxhT1hnZExaSWhMdkZzUmY4?=
 =?utf-8?B?VHlmN0Z6Q1JBNnlnRlJGUThHM3l2THdsR0YxS0dmMEFUdk44b2RmTjZRYmRT?=
 =?utf-8?B?MEo1cFBuS2M1dzAycGUzeWt2elFQd3ZHM1JrMjhYeUkwbitoNm5JZG1PM1hs?=
 =?utf-8?B?b3k0SDhscnlsbDF2VHBYVHpyY2xLK1Q2YVFaN2pTdWtPQ29kcjRPMmVqMEhP?=
 =?utf-8?B?b2txd0oycFVEN2t3ZWhvUW4rOHdDUzRqcjFXbG8zUXF0UG8vcllwVmtZZnNH?=
 =?utf-8?B?OEpLUFVKNlVPd3JZVlkwVTV1bmZnY0FUOEgrZ1o1S1BoUk1ONnNEUnF0NkRr?=
 =?utf-8?B?QkpmWHFieENvRjg1K2pRT2d5Y0drcUFJd2xqUTJwNVpaZkp3cTdSS0tvWjBw?=
 =?utf-8?B?TTJoejZGUEdDSWhtT2VXRmFXbU1Cd1hEanU1bXhiTVRvakxZY0ZJZGM0SVR0?=
 =?utf-8?B?V0kvdVZMVytOTGJvTjg4Yk5xWTVvZHJQY3BiOU01SHZZSnF0bXhqamdXbEpI?=
 =?utf-8?B?VXhSMWxGUW5Deks5cGJjNFZwNjFoV2Z6YWJTNTJTTTlSSmRsbkNPZDBWeGJx?=
 =?utf-8?B?U1lQV1prenlyMFRVY2I3bzZKMW5Ia1Qrd3AxaEZ6dUVPOXdTeFU5WUIrMHZa?=
 =?utf-8?Q?ZA3KS9JFzPdkYTKP/Jvzotw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f9a257-3629-4c68-93c1-08d9c3bfe752
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 13:52:03.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ovug9emfI4p36gRcVLGGUBW8+ZWmEZwOSJOiGOFhuM6hBFy6Dcpf1mUmyKHHY5X+ECHoWYS/tuDO7e1RmYIb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3915
X-OriginatorOrg: citrix.com

On Sun, Dec 19, 2021 at 02:35:56AM +0800, G.R. wrote:
> Hi all,
> 
> I ran into the following error report in the DOM0 kernel after a recent upgrade:
> [  501.840816] vif vif-1-0 vif1.0: Cross page boundary, txp->offset:
> 2872, size: 1460
> [  501.840828] vif vif-1-0 vif1.0: fatal error; disabling device
> [  501.841076] xenbr0: port 2(vif1.0) entered disabled state
> Once this error happens, the DOM-U behind this vif is no-longer
> accessible. And recreating the same DOM-U does not fix the problem.
> Only a reboot on the physical host machine helps.
> 
> The problem showed up after a recent upgrade on the DOM-U OS from
> FreeNAS 11.3 to TrueNAS 12.0U7 and breaks the iSCSI service while
> leaving other services like NFS intact.
> The underlying OS for the NAS is FreeBSD, version 11.3 and 12.2 respectively.
> So far I have tried the following combos:
> - Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 11.3 DOM-U: Good
> - Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
> - Linux 5.10 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
> - Linux 5.10 DOM0 + XEN 4.11 + FreeBSD 12.2 DOM-U: Regressed
> 
> I plan to try out the XEN 4.14 version which is the latest I can get
> from the distro (Debian).
> If that still does not fix the problem, I would build the 4.16 version
> from source as my last resort.
> 
> I have to admit that this trial process is blind as I have no idea
> which component in the combo is to be blamed. Is it a bug in the
> backend-driver, frontend-driver or the hypervisor itself? Or due to
> incompatible versions? Any suggestion on other diagnose ideas (e.g.
> debug logs) will be welcome, while I work on the planned experiments.

This is a bug in FreeBSD netfront, so no matter which Linux or Xen
version you use.

Does it make a difference if you disable TSO and LRO from netfront?

$ ifconfig xn0 -tso -lro

Do you have instructions I can follow in order to try to reproduce the
issue?

Thanks, Roger.

