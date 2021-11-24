Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965545BD3D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 13:33:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230397.398266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprRy-0006aL-Ia; Wed, 24 Nov 2021 12:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230397.398266; Wed, 24 Nov 2021 12:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprRy-0006YN-FZ; Wed, 24 Nov 2021 12:32:34 +0000
Received: by outflank-mailman (input) for mailman id 230397;
 Wed, 24 Nov 2021 12:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qlkt=QL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mprRx-0006YH-Jy
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 12:32:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9614c089-4d22-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 13:32:31 +0100 (CET)
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
X-Inumbo-ID: 9614c089-4d22-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637757150;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OzVFu2UtLFxn3mnDwIRxST9LByMCRmgrPKBUgltAQxI=;
  b=b6PqEugLUoZUsD0XUCimLFxFfy2zM0GKNbbyhVuLz1rOXG2KKhikaR8x
   h12LuLltm6eRnCabJXL23HmTyMLD5NX33ho+Fic9+IOyMKyNqHKUwqZgv
   VMWtZ45ZtEThV7Q5sJAIaC/tlXXByXa2ZOeooL1NJYAvgC2+nCsBzlVma
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Zcnxi0OMOTx2O3RHQELSF2019JFBPTIIhKVh0oLSx8wRNbQLooUvIhxtUHoOkaa0CrMuSqfxAm
 h9+8mMilMZWrsgEMLez4wk5Vt+WFKLQxvdaOtiSJemq8xQN8zGckUu12AWNZ6fBo9f7/FPIdZZ
 JqHH/+H6WsD83xQFy0aIyvgasdekF0Q//eFz2dnqtB6Ers+5z7dWPEBCMN6+rWEyqoKEa33Myd
 Em6B/zXvs+mQ1UTZQ0qXeqTEKR+T1897WBrgKOWfUcg4kU72RRxnm2PGN427Ly342UGuV5tJIq
 mPbGGbbGDxSo/Qr016HHmFZc
X-SBRS: 5.1
X-MesageID: 58922272
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zbJWQqDNI77DFxVW/wTlw5YqxClBgxIJ4kV8jS/XYbTApDwk32EGz
 WJNXmiCbqqJYmekeoolbdyx9RhUv5/Qy9I2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540047wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1Rqbxo1d8
 Nx2n7eUdFsmA7XGm7oyTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWbv4UCg21YasZmQsvmT
 MU2UTZWdivcZTllE1wOD7MZpbL97pX4W2IB8w/EzUYt2EDZwRZtyrHrPJzQc8aTWMROtk+Co
 yTN+GGRKgkTKdi32TeDtHW2iYfnhyr7RYZUD7y++f5CiUeWgGcUDXU+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xL3IYQzt2Tc0pvc47WxQnz
 laM2djuAFRHsqCRSH+b3qeZq3W1Iyd9BUgGaCwfRA0J+e7Kpo0pkwnPRdZuFq2yptDtEDS2y
 DePxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6ji3pWWai4hJ8dZSSTYWi4ljG7t5NNI+cCFKGu
 RAsvMyT7/sHC52XoxCcW+UGHLyv5PGtPSXVhBhkGJxJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkV1+9sYOEEOjVoVcR7/tBPkyx6u+OsuwA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuKHcijpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLxBQxbRZTYLcqvwyCySgJlClA6cI3GI6WMqY7Ng6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8h9i1lbHZ9ZAv5hydLjWOTAEE3LcdfkV4PrrIL8BKJZ
 6NdJ5Xo7gpnFFwrBAjxnbGi9dc/JXxHdCqFPja/YShXQnKTb1ehxzMQRSO2rHNmJnPu7aMW+
 uT8viuGEctrb1kzV67+NaPwp25dSFBAwYqeqWOTeYINEKgtmaA3QxHMYggff5tRdE6dn2TCj
 G57w34w/IHwnmP8y/GQ7YispIa1CepuWE1cGmjQ97GtMifGuGGkxOd9vCygIFgxjUv4p/evY
 /t71fb5PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSEEdOl1PYopz
 P0PoskT7wDj2BMmPszf1nJf9niWL2xGWKIi78lIDIjugwst61dDfZ2DVXOmvMDRM41BaxB4L
 CWViazOg6Vn6nDDK3djR2LQ2ed9hIgVvEwYxlE1OFnUyMHOgeU63UMN/G1vHBhV1BhOz8l6J
 nNvax9uPayL8jpl2JpDUmSrF10TDRGV4BWsmV4AlWmfREi0TG3damY6PL/Vrkwe9mtdeBld/
 a2Zlzm5AWq7Ipmp03tgQ1NhptziUcd1p1/Ll82QFsiYG4U3PGj+iai0aGtU8xbqDKvdXqEcS
 TWGKAqoVZDGCA==
IronPort-HdrOrdr: A9a23:oJSVC69rCgg2aiA2X9Vuk+E8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICOgqTMyftWzd1ldAQ7sSj7cKrweQfhEWs9QtqJ
 uIEJIOduEYb2IK9PoSiTPQe71LoKjlgdGVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.87,260,1631592000"; 
   d="scan'208";a="58922272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYrUKmmHFvZcpbgEBDDlAvGBbRMvvns1kL3usZ61YcYX6aO1I6vsGUZdryiYIEBajW2/+tKNMk37TJ+pyqsl4K050Mv46rXeLYjZ97/jFuJjq+NWLvNWhx24fUgasik4/oN3OsVWL45oSFQb1Oklp4qOZJRK4tcDPJSsP64AYIo3OUe+nkpuTYhQ4WaMNCFCfHmegygipVDFl7iCrzZ/EKfusDv+KOJhx+zjq6etQFsJrTYTrg+1mx+q+JAogkPsRvkLF6GK0IJc02NDflvyYjmtuFJ1saJ0bUglFouwOzjaG6AZj7SLk+vE9dR3qL4KxFtsotE2/e+GZB6aQ8MVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hBoHQcYG/ka+PcKkHYtMJn74bLi2h+JtlGse22uZbU=;
 b=hBf7r/Mwn9GBc/9e6wgQdNAIcPeyx+WV/V9nF733tHKqgxYFVZzs08NxkKudJSWjRyA+v3Mi+Iwyn6p/3Q+819m7l3jWwRMbdPzE34xlwmj0lRIjZuiaamuLihVMgDE2B9XxPgY+HkqwAZFvDgfuLZJruR7NCxYK4YvYzszdMIAfongyYxSosXGv7hXU5gRv7rWnwSAP6lWZ5N7eb+3LRkN177sumCBFKRizoGrG9d4iylqnTbeXwbewj9/SEq+Od7SGzA3T8F6aAOkR+SHB+TnV68NpomZ25/Y98FqPNYH1uhgLnfYLmyupSWQfnAlPNfsSJRzN3ZJeB3+qcYp4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hBoHQcYG/ka+PcKkHYtMJn74bLi2h+JtlGse22uZbU=;
 b=JazpPNfvlox5YkdbYzAEuLVgPx55bRGmsfTy72M/n+pldc6VEa7bb86tT8v8V8Utj9PjZVCrRCCiX6wsJs5bYM2pPfk3ymvk80DGF3cgSNBpVaYn9L8Pqa7UGcq9+g7SbQGYZHu8316vfqjFFOUOfTjwW9NhCRWIVn+0zQXzG/I=
Date: Wed, 24 Nov 2021 13:32:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Message-ID: <YZ4w0AoZ6Af/Dnl5@Air-de-Roger>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
 <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
 <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
 <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
 <3192ef9d-c014-df72-91c9-13386bb584e7@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3192ef9d-c014-df72-91c9-13386bb584e7@epam.com>
X-ClientProxiedBy: MR2P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae78c6ee-8e55-4be8-9177-08d9af467528
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:
X-Microsoft-Antispam-PRVS: <DM8PR03MB6230E6443C78D1EDA527DE1D8F619@DM8PR03MB6230.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ji5SiZhxP3xOKYm9HLkeERBzwfF5bcOB6GHc5yunxrwajjYxu58ee/dQpadjnztnTSrdEMqfd+0IhvzGAu7f9E4ysKJbTze4ULGZxKqYhlZ7J9vkMGMlL3ZKI8h5SETAS1d/GiVNdkZhkQj1g9E1BFySYWz+tOQhfa0O7Zczq/IcuwkMES3DYf47eCW47IcJALUk89BRxi/Mg5NB63QSNURvcXmFnOzreKhSq6c2KbXHrUCwgiUUEh0qh+veO8Fi/b2QNhemzu1rovtfu3X36/bUHjiDig1yQkay8iM+lHmw60ld0vcSbkArQx8y3mKLyMtTua3xo+tIwFNbJzvCNJhTLC6bM0lUnjMsHAgvVxHU5EDA0ZGzqCkaMWjNBX+8hLwTCKjWJgyJ2g77u9vg/y1O0RDTdVDSNTQhd+HhS+FMwBdauVvNHHpdyBtCGhYF6rftx93nJ4sX72319/toJ+FF6BVZNOrgTpLN5Lcr9qU+3KeIPYLPDrB4cxWhqiWBGbojaFmplv3wavdQOXNIdQU+XiRuF0brYGYOhWSnyX5SsP60wRbrN0m2GDY7g/C0Hi2AT34WCHejQd1WxhcMnTImSv5GcharjXUdN76V8aeenTI7g4KMuDBdU/1ODd3IFcVljyDAUi5gbY1rjv3T5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(2906002)(7416002)(53546011)(26005)(86362001)(9686003)(6666004)(33716001)(66946007)(66476007)(6486002)(8676002)(38100700002)(316002)(4326008)(956004)(8936002)(508600001)(6916009)(54906003)(5660300002)(186003)(6496006)(66556008)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmZBdXhwMlZ5a1hvdSsxSTZ1VEh3UWNmQzgwN3pxR01VYXEwU1hrM2o0TE1C?=
 =?utf-8?B?UEVVU1VxcURSZnpDbHVsRDkzaGxsZ0pGekc0YytVbXBkWlRxZ1k1TWcvZmhC?=
 =?utf-8?B?L3FxTzNaWHhvZER0Rno0RDVpRGRVMW9vbnRHeVJrWXhJWlVXcnJwWVp5dk96?=
 =?utf-8?B?N2lUeEE2dnNjR1NZQXVhV0p4S1VCbXkvd2IvVnFyQkVlK2trVkdLTGwzeWxk?=
 =?utf-8?B?bjdJdkR5RmtNQkdnMDRyRW84QSswTm1CenhaNWxJbEdkTmNXYTB5KzlNOHVi?=
 =?utf-8?B?ME9xNHNWd2FxNXRvaVhTb1d4dUtIR05uQkl1NllEVEhRTGF5NCs2OEJCK0hG?=
 =?utf-8?B?T21WWW8yM1ROWTBqczg4Y3ErZUVqYmdZL2Z4bkwxSnJEb1pnMFVNVzFCZ2xV?=
 =?utf-8?B?dC9pZ1ZsaDhIVDVxK2ZsR29BNkdidzhDMjM3NDJXT0ZIN3R5Nys0cTBpenBF?=
 =?utf-8?B?bEc1SXJsR1dTS3kxZFkyN29WNENRNUNHaXh6cGhWNHdjQjdiK0ZnTm16U0xk?=
 =?utf-8?B?eFdSV1BNTWFER1VGb2VoS0JBRGJtRWRZSVlvWE9KR0VjR2JlUmRpcFk4OHRG?=
 =?utf-8?B?SlRLYlh5bnZpL2o0YlpQRzQ4ekRocHdNSUZVdXJmR29vQ1I1ZEdnRUtuSXhJ?=
 =?utf-8?B?bGJjWW1YeVMzTjBiWmN4cHh6ZGNwNms5QzJVeFl6L0pWdEZEeWw5UG45S0Rv?=
 =?utf-8?B?U3BURnpyMnBqK09wb3RVZTdzN3FndDFBbWlEYWxFVlhzakU3OHo0WFN1SDRK?=
 =?utf-8?B?QThxTU5xVFJKU2FwQjJiQ2RQc1RnS2NyY1pDeEU2aGw2dWl1STNqWkpPQm0r?=
 =?utf-8?B?YXVDS1NOMlY2UTJMNXVITEx0aEJEYjdBS1prZktzQXVZM0pZUXhGNnFYcFY1?=
 =?utf-8?B?SFg4UmVuM3llTzdBZGJLWFhxSHBCVGxYalBqZUlubDBTMFB0OWhzK091MmhV?=
 =?utf-8?B?Uzk2U0RSVmJ1TGxyN1FXZzVFNk9PZ1hpN0NDODV6cCtqemZvNCtudlBlNTZH?=
 =?utf-8?B?MkpjUmYvd01Cd0ZuUjB4SlVhcXJPMk15ckhENks4cjY4cG9QdFQxT0ZNOTZn?=
 =?utf-8?B?Uys4ODZ5QWpyRWZNRlR4c0UwRGt3LzBqbElHV2ZUR0ptK3Y4amdwNStIT1lY?=
 =?utf-8?B?THZ6QkJrcm8yMkN1SVhWUjZKSy85WHRMYkZBUnhTdCs1M2VzZU1vK0VEaWR2?=
 =?utf-8?B?TW5FeFg2c05KU05tVjNIcnRVUXN4U1dFR1NsWjI3K1Z1MmdLMmtOYWg0ZEE3?=
 =?utf-8?B?WlMxaU83eXB6QzVOOTNoS2hua1UyL1VlMis0ZDdvUVJxbU1ta2NuTFdMOEZy?=
 =?utf-8?B?MERvYkFORHZxK0pZRlVaWkIrMWYzZVIvQnkrYzlBYkNYQkdKY0RaRHlCT244?=
 =?utf-8?B?WHJ4UTZhelRjSHdLbkNLTkJQOGNKd3NTRldnelhldkpGaWRCdm1CZi9EcERU?=
 =?utf-8?B?SzlGNHF6WDlsSDRXU1BVTk1hNTFmZTNEVGE2bDROZUNpOTBDQmpHajVuMjJE?=
 =?utf-8?B?eE8yQnNkRitQN0dvZVdNMy90UHlGaG5NQTc2VHBwRkVXVG4wVEZwSDlnTFp5?=
 =?utf-8?B?ODlDaDBhU09IYk5xVEFxcnJBMzZSUHZCeXNudUU1QnNqc1RFeWxaM2JzZkdW?=
 =?utf-8?B?aHJxOHBldThCeDR3ZUxwd0ZyelNOQjN4ZHZxRmxpSGk0S1dKcThCMHMvRlNp?=
 =?utf-8?B?d29rRUVRSWJ6UG1mYUtKZlRsTVFaRXVhUGZPd29NV09qWDQycjVQSllJWCs4?=
 =?utf-8?B?T3ZvVktNTDJnam5lak9LTjBrZGZoMGdnWUl3Rkw4MVBqVTZWUWNIUGZsQjJ3?=
 =?utf-8?B?MjIyeCs0cmNLb0xqZDlvb2Jqc3ptYW1YZ0xjd3crZWxaR3RIQnBDcU5LOGRX?=
 =?utf-8?B?aXNtMUozT0dVeW9rZFdITWREblA5alhwU3BoT25Gb3dTZUc4aU5ia1hKZ3BQ?=
 =?utf-8?B?YXBkY3Ivd0JBajQwb2JsK2JZTWhWVnZsMDNOMUgyMTVnTGN4OE9neGlKSStL?=
 =?utf-8?B?NG5RZk4yL0JIa2dJbGFhL0h1YWtJbm5kWS9OSXptOERjUkdiSTB1S2ZtYlEz?=
 =?utf-8?B?VDdCNmpwV2syK1pSMWVxWmFHZDNha1RMbzI2bXlPUCsvSERpTktiTkJwVEVh?=
 =?utf-8?B?K3hIeDJQLzFUTDhZRjByZHJ0c0w1ZWZvQ3NvZG5pY1ErMmlncitxcytSamtN?=
 =?utf-8?Q?sk4awgafAy5hGrtUWWlUW2Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae78c6ee-8e55-4be8-9177-08d9af467528
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 12:32:19.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJMXbR5H+iT8g6qLwZFubINrKLtAWasdHfz8qKpQh9OZ2SbQQuf4/wffmvoIdHLBqdJ+sa/Kg4eAmy8qoNpLoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230
X-OriginatorOrg: citrix.com

On Tue, Nov 23, 2021 at 03:14:27PM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 19.11.21 15:02, Jan Beulich wrote:
> > On 19.11.2021 13:54, Oleksandr Andrushchenko wrote:
> >> On 19.11.21 14:49, Jan Beulich wrote:
> >>> On 19.11.2021 13:46, Oleksandr Andrushchenko wrote:
> >>>> On 19.11.21 14:37, Jan Beulich wrote:
> >>>>> On 19.11.2021 13:10, Oleksandr Andrushchenko wrote:
> >>>>>> On 19.11.21 13:58, Jan Beulich wrote:
> >>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> >>>>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>>>> @@ -408,6 +408,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>>          pci_conf_write32(pdev->sbdf, reg, val);
> >>>>>>>>      }
> >>>>>>>>      
> >>>>>>>> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>> +                            uint32_t val, void *data)
> >>>>>>>> +{
> >>>>>>>> +    struct vpci_bar *bar = data;
> >>>>>>>> +    bool hi = false;
> >>>>>>>> +
> >>>>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> >>>>>>>> +    {
> >>>>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> >>>>>>>> +        bar--;
> >>>>>>>> +        hi = true;
> >>>>>>>> +    }
> >>>>>>>> +    else
> >>>>>>>> +    {
> >>>>>>>> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> >>>>>>>> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> >>>>>>>> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> >>>>>>>> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
> >>>>>>>> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> >>>>>>>> +
> >>>>>>>> +    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>> +                               void *data)
> >>>>>>>> +{
> >>>>>>>> +    const struct vpci_bar *bar = data;
> >>>>>>>> +    bool hi = false;
> >>>>>>>> +
> >>>>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> >>>>>>>> +    {
> >>>>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> >>>>>>>> +        bar--;
> >>>>>>>> +        hi = true;
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    return bar->guest_addr >> (hi ? 32 : 0);
> >>>>>>> I'm afraid "guest_addr" then isn't the best name; maybe "guest_val"?
> >>>>>>> This would make more obvious that there is a meaningful difference
> >>>>>>> from "addr" besides the guest vs host aspect.
> >>>>>> I am not sure I can agree here:
> >>>>>> bar->addr and bar->guest_addr make it clear what are these while
> >>>>>> bar->addr and bar->guest_val would make someone go look for
> >>>>>> additional information about what that val is for.
> >>>>> Feel free to replace "val" with something more suitable. "guest_bar"
> >>>>> maybe? The value definitely is not an address, so "addr" seems
> >>>>> inappropriate / misleading to me.
> >>>> This is a guest's view on the BAR's address. So to me it is still guest_addr
> >>> It's a guest's view on the BAR, not just the address. Or else you couldn't
> >>> simply return the value here without folding in the correct low bits.
> >> I agree with this this respect as it is indeed address + lower bits.
> >> How about guest_bar_val then? So it reflects its nature, e.g. the value
> >> of the BAR as seen by the guest.
> > Gets a little longish for my taste. I for one wouldn't mind it be just
> > "guest". In the end Roger has the final say here anyway.
> What is your preference on naming here?
> 1. guest_addr
> 2. guest_val
> 3. guest_bar_val
> 4. guest

I think guest_reg would be fine?

Or alternatively you could make it a guest address by dropping the low
bits and adding them in the read handler instead of doing it in the
write handler.

Thanks, Roger.

