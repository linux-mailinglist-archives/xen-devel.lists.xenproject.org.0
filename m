Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A009786EE9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 14:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590047.922138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9Ka-0003qR-N5; Thu, 24 Aug 2023 12:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590047.922138; Thu, 24 Aug 2023 12:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9Ka-0003nf-K7; Thu, 24 Aug 2023 12:20:56 +0000
Received: by outflank-mailman (input) for mailman id 590047;
 Thu, 24 Aug 2023 12:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR62=EJ=citrix.com=prvs=593229a51=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qZ9KY-0003nZ-B5
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 12:20:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e522f8-4278-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 14:20:52 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 08:20:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6656.namprd03.prod.outlook.com (2603:10b6:510:b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 12:20:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 12:20:13 +0000
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
X-Inumbo-ID: a9e522f8-4278-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692879652;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pdes3R5NIdTBKC+Vrst2FdpLMy0z/iObbz5RHQ1/U7M=;
  b=MqTCmgJfbDWYq0RReUsSnJ/qp6cfAm5F1p3te7Gu9A3cnQSDDetsPICW
   UdDdZNeeZEWN6Er45vpdpjrVQP2Piq1RceCPvHdhAbI5FOMO2SUK0B/Pr
   dolMe1V3wQUXD7btfLgz7d8zKVrMInu+G8bbyU200M6NhJfEDzv26aBZI
   0=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 119186449
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CA8CZq5EcIuAt4gnIuSVagxRtL7GchMFZxGqfqrLsTDasY5as4F+v
 mAZWTuOP/7ba2fxeN12PInkoRxV6sPVyoVlSVA5/Cg9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaAR5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 PZHMwpWSxK4lc290YqeZbZPoIMEFZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+CF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHKiCNxOSOzQGvhCrleD/0BCITQvTXCp+8meq1CYaewCJ
 BlBksYphe1onKCxdfHmXhi/pnPCtBcYX9NKEusS4hyC0afS7ECSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMi8TNnIGeS4CQiMP/tb4rYc8yBnIS75LH6+8iNnoEji2x
 y2SpTI/gbQ7h9MEzKi98hbMhDfEjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxfRKIZudT1KBl
 GMZgMXY5+cLZaxhjwSISeQJWbquvvCMNWSFhUY1RsZ5sTOw53SkYIZcpilkI1tkOdoFfjmvZ
 1LPvQRW59lYO37CgbJLXr9dwv8ClcDIfekJnNiNBjaSSvCdrDO6wRw=
IronPort-HdrOrdr: A9a23:1i0Ora+M3m+m+ILKkzhuk+AoI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSWc+eAamSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-Talos-CUID: 9a23:d7WHUG/rLmb3O2PBooKVv1MeRdsfKVjf92X/KF6ALEk2a5vSbmbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ANBx9aAzo/H9ZKSLKlygcAwOcDxmaqIqkGHkhwLw?=
 =?us-ascii?q?vgtGvJ3ZAHBaDqgaJH4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,195,1688443200"; 
   d="scan'208";a="119186449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GulHYtW1GczqImUwTxquSSD2TA4LxdSC8QuQbtJXJKOe5qu9mNf6YbEznjUlOIl1AFsug45KmZEVxfp6OgGiZEUlndYIaA+Bz5Cn2bPqSP4520+XhS72ppcF1DA0gn/gz3Wmv+RDMqCXLzaiquTbpFHRSjEgeTjQ+RGiK7FuKnCl5YN+Z2df9DEeECnQl+n4ctC/b5fQMTl7U7BSsC2K3576Dsgh1dY8EUVuIEYGApUBCeLFmOSJ4arusQSqQR0W8+0Us/k0wmptHFHO4Z+5AVqorYlHl6mx6v2u1f5zMgK0aP8N7YnzkXspmVmUo0AQjV+6AbOu32lwX8hU2N/INA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFn7YAQ+ChVjijhUIa6DsiAN6AKGJwks8kSgmVOMLCY=;
 b=h6yp7kXd9Zc1sxtUuPTTTLZbO67QmrwnenlU82k4xnEF6JSB1qP4L4lxtoGk0lB3ySWt4i7KieWL80jOX0wa3BtFO6lMgndyDm08nEldGIXViwkMQU0v8/MnKZekBFsPfcpqM0WsDJ26L/PqvXLBqNKXbPc64Zt863ZlRoVWHQrp/AcxrIm/1tSNCBwWSudXdmRr6wu4xlQF0YRPOmCrzqBLlmqO6w7OWO3vJK60gdX4itbYsYpLw7+sadND1+Wr7aH6tQNqKbetDfiicaFjxO3imwMoKTz2UMU92TbxhapxlbzrS+gxiT0q72LtbersOGSLw60ScqYQkqrxKvQqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFn7YAQ+ChVjijhUIa6DsiAN6AKGJwks8kSgmVOMLCY=;
 b=htJUhMYbRhQnKAZnpYT7drCbYuhy1z35MRz3CF7oqdKY5dpY8S3fTJDdEzCCiB31yY6NUsgYuJ5mTw+4gs2zxRwydbWPYBhHE+JI5BCi8WlQIHD+yd8C4sL0M1bAChyLg8mYu/vcxnpB54XVPiYEN0UW1+VEuQ7TuHqtT0zUgaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Aug 2023 14:20:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 2/4] xen/vpci: address violations of MISRA C:2012
 Rule 7.2
Message-ID: <ZOdK9w69E2IiHI1r@MacBook-Air-de-Roger.local>
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
 <2cb770d946c4bf858a41271fd7b9985f789ca149.1690368810.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cb770d946c4bf858a41271fd7b9985f789ca149.1690368810.git.simone.ballarin@bugseng.com>
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: c768902c-01dc-43ab-ae12-08dba49c77ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	27AQIduWzhZkaMX1wIiXtOTXz7yxoMmAPPtn0pqjReo5SDmf8oKOx7V4FgHMCrW+gEWDP9YbYqiIIBlZLtDWeW3wif+HZDHeJi9dBY7Hephz1MKFBydoaisAANvR5weLQsJBL/0vwWk5+qqgAg+k+GaWw0RWY89uuE5WYho2vxc11HKgPE58pBYsbFOoB5sj9rn6M5x9TwPD7NcEmE6DUiz82ssg+ZCKERNBEiPLB8cF2e3jGb2DD0LzfWPQ2T8TRcQdcXKb3aG5kgnZTij4OTifJnai1kYsGDNCl/nvRtbFb/GLnBNAefaHGQFsYnknvYpcrbR5cdzVixvPCxeRCP5ypKHyhLgiTMDkRE9gpzrc23Pm4zzlkPupAlxovQNtNNicQ3ZnSIHUqbq5wkxRyRT8FcwDbcKFj2u9tHN9LK0gjbL2SzGgnoltkJWyOGeV8EQS9nfutKZFx1Nluw2aDjnGIwsgnbIMkuNIG6/ApXUerNb/qlei5xb+Xd9VIWCk/67FXiBCNv0bpSx7HqLAdWHmPiCCTm6wy/35MIrMqUEknPJiYXo1/OTrcA6HP/b0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(186009)(1800799009)(451199024)(5660300002)(8676002)(8936002)(4326008)(85182001)(4744005)(83380400001)(26005)(6666004)(38100700002)(82960400001)(66946007)(66476007)(66556008)(54906003)(316002)(6916009)(478600001)(41300700001)(6512007)(9686003)(6506007)(2906002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGc0SzlJMjEzK3BnRWI5WUJlZ3BDSyttc1Z3ZjBqVXNvREh2VmIyaWxidk9W?=
 =?utf-8?B?VVNjOFhSaDNYM3VwOXJZYytYZys1L2VYbkZoa0tJcm5QRjdYbTlnSkNWcUVm?=
 =?utf-8?B?TGpNdnVhZjFDTFpwcXlDNVFVLzlFVndzU0h0dzgwYzBOTnFWYzJTTHM1S3BJ?=
 =?utf-8?B?QWVpTHJKMmVxcllCd2tKVkMwaEtLd25CbkZsaHNQUE1saURObjZKZUI3OG9U?=
 =?utf-8?B?bi9yT0ZGTHA1bXFPVFVFNjhJUkxWNFRWTDRXSFBwTUlRWlRjdlBtQWUzaUkv?=
 =?utf-8?B?NHMvenZ0c3RJZ1djZytkS2VYSzFZdHRLN1RDQWord1ZIQ2VlcVBHaFYvNXVR?=
 =?utf-8?B?RnQwWlVTK3o4bVJLWWc5NGZ6TGxTOHpSK0s5RFJEazRiTFF0SlgvdUU1MGhi?=
 =?utf-8?B?M1Z3SVYwb2RXNkJUUGNGU1hRMmVNeXV0dzl2ZGs4S2xNVU56aFVtNm81dU9t?=
 =?utf-8?B?QnNlTjNhMCt0TEVTVEpsb2tlY2U4b2JzSG8zQVkwN05LSEYyU2ZRWEtHditK?=
 =?utf-8?B?U3hCSjh3N3d0VytHVUcwMnphUGZ3Z09Yc3Yzb2FNc1FaRjBqaHVnMXVCclh6?=
 =?utf-8?B?NTh6WUJ2QmduNnFuRE9LNkYyTUplUHpLQzhPQy9DdC8zTGJXMjRIcC9OTDJV?=
 =?utf-8?B?Um4zcHlIbWRmbHhoQ1dkc1dSUnNQbHE4cUNvSUN0ci8xd1RpMU1QU0ZIUWQ2?=
 =?utf-8?B?T2JPWm1qYldpb1hRVU8ySHpONDdwdkNEQUhXOVp0VThuVzNKODQvNUtqdDNI?=
 =?utf-8?B?UTJVM2h5ZWVwbzJPeEpsR0tTYUJWN09BeHlTR1FLSXVRM3U3eUc0VUFUVEZO?=
 =?utf-8?B?UDI0RmxXMHhBbmYwNjUxemZOblJ1NzhBRkhYcDI3WGdRcHBSaFBGZ1kyYlZs?=
 =?utf-8?B?RFBHM3NDL0E2ZGlZZmVya1VoNmZQVG1pMTZBME1SMzdiQWl6aTJzSWhiWDRz?=
 =?utf-8?B?Tk02SWdsVFVicTNOeUppKytGWFh4akVEMHJITkV1VEtLSVdXUG8xSEpwVXBF?=
 =?utf-8?B?WW13STRtc0NwU2NRSUtCRzFOckJJbWYxVG91c2RVeVQ3dm1GVkxKOURIUk5M?=
 =?utf-8?B?QmI2cEtVSWRoWWhITUZBb1lYZFJpZVVuYlN5dDBSRHdyYmx5OUVIdjQ2N0dv?=
 =?utf-8?B?UXkwdHdoTW9BV0t0TDJxazI5ZXp3elp1MVBLOTY3aFI3WTRZVGZiZGxyTzBF?=
 =?utf-8?B?MkRidU5KcWcyTG00OHdJZ1MxT2Z1N24yWUJ5NUVyM0gzK3dMMUZRL3VseDFH?=
 =?utf-8?B?dDBWV1kzRjBIZ0M1K1VLaHhCeWdNd3VYdUZpYmo2dm50WERRN0lRUzZmMjNG?=
 =?utf-8?B?UmdzNVZEcWxwQ1Qya1duVjdUM1FSazAxejJEVWJDWmx0M0c1T3NwN3c2eXI2?=
 =?utf-8?B?VVNHUWtHamVjT3ErdzR6TkRyZEhXcTVVTEpDdms3bnBEcWUxdHo4Ny9Bcm5E?=
 =?utf-8?B?WWRlRExNSldHMGttdGVua29rR3RHNDM5YVRqb3k5MnhHbWRhd054S3F6OTB3?=
 =?utf-8?B?WENTVkp3T0dCczcrSFovdkp2MUJFN0VMSkxDR0JRdDNVdHNRREdyTkNqNkhl?=
 =?utf-8?B?NVFsaVlYcmpRelllenppVG5tM0xXeFZla0xpcUR4bDhIZlhKVC9QdDR2U1R4?=
 =?utf-8?B?U2pGU3grdnRPTjA3Qk1nL1BnOFdRQldLS0RGZm5sR3pxUkxpR01QQmQvYmpX?=
 =?utf-8?B?aWNCaWJLdzFpUmRxZTFyaHFZbERWY3J2OWFCYWJqVFFwRDNNNXQrZkFoRjYz?=
 =?utf-8?B?dlhuYUdUUDJzVkhEQ2poMTBobXcrdm1EMUF0aVNRdUFuYUFmMlc1RENqUnU5?=
 =?utf-8?B?SU1OaTFFdHVDVEJ2Z2c1YVdVTFUzWkNTcmwxNXlyUG1RUkM4QjVhaGd4SGtH?=
 =?utf-8?B?akNhMndwQ2ZJdkFmNnA1c0dJdUxXclZwZ0xyZG1Ia0FDUVlBTkdwNzdPWEMx?=
 =?utf-8?B?L1ltNktKazBOZ0hIdG0rY2lmRnZBZlJMeTQyNFNmRjMxK3drWTdZUzhzRlZF?=
 =?utf-8?B?dFlsVDdPK0k3TzEybGMyL3Y0MWszT0JSM0VVZG1OMDE1Nk5vblBNNWJ1NFdq?=
 =?utf-8?B?ajZCRm5GZnY3TmxjWENNcjJiU3lITy91SlFBMXFYQlRoN2pqUldGOXJ3Z01E?=
 =?utf-8?B?VGVjcXNZVzJpWkticXgxTEdudDBNTWpjQTlFVGFGbTVJS0JtSGtpS1h1SnNK?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X6Z+KMbcazk8A+hFjpILE2GHhAbXgIKqSTuIEi5YM184OicQJCVmsYoQUrrXAeqxG8EGSj5NIThyg84pcOYEbxRV1/gSSJXjuZDIYAiuCy65nH+uE82m9MQLfFPFWZE3Lgz0ZC1/YU8U3PxbHmpbWHwB18OqCc8N8ERIRc89cXiUmLR1885N5Kh+ReHMtbkLb0Bap3iZHu5BAvpV5rJu8P3SKsGYnLfy4ZrRxEDmsmtmGa7scySAvgqywN2Odu8RWOg+/6YR/YQ+mLrfJ1fChDPa9kyfZEVgZ6lWdFkero7/YGzlS62n2j7F2Har6VF/UAb3pLEFJZRYXt0OmmsbQPZDfjzIR1Y5gDq9vyXoQHzpaU4b1/SZKb1mUfg39Wqt/noOIF9P4ABZhyVihte9/n9bYyYt4um/B8GEzNJ95W7VYDJxJv25rP7RSnZl39WyQisqWlkTJM8+V2sIuIgPTTtAbFiVSwzz2OoOQddVlL1buP+3idl3FYqjkVb9FIPvxkQLDaCq1VkgoCKIbQMy4wEthd0vZllOB8NOZidTW8RsPTTn3unGxK8nQ38l9JrNo1a3V8NjkQUkrGAgNjDx1ElDq/FeF10JYfwnYghS4OV11iX5UpRdMWCwjyivOvaDA1tWchab4XZe2pVH7J7E1izwL/DjUWoi+OscsEzNmIIUsmS5YMkHiUx0gdJlvAC8bjlKlHY5GUyw9Vg2IaXEc+o6hv1uHLBstfDuSmzlQ9NKP0lNFVbL8xAqqKUtcyQkenule1JNyvtuD2VMGTpoW+pA65wtY3fHXNgOi5jzaKbh0E/eBuclY2sGMvAUd3cwzlbiuEKiTfq4SG4gDpbVi8MMAfAnJ/7gJ1+mmvVVHPE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c768902c-01dc-43ab-ae12-08dba49c77ae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 12:20:13.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB79upSPn+2sk8bOLZAhphC2X1ekFkbVqchgq6bNe4d19PHFHvAFBb9S0vbYAwdSrghCA8LIKcW6TZN67MAQxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6656

On Wed, Jul 26, 2023 at 01:03:37PM +0200, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

