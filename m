Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90716786B07
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589832.921876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6FU-0001ED-2D; Thu, 24 Aug 2023 09:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589832.921876; Thu, 24 Aug 2023 09:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6FT-0001CE-Up; Thu, 24 Aug 2023 09:03:27 +0000
Received: by outflank-mailman (input) for mailman id 589832;
 Thu, 24 Aug 2023 09:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR62=EJ=citrix.com=prvs=593229a51=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qZ6FS-0001C6-C7
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:03:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139691ff-425d-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 11:03:24 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 05:03:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5795.namprd03.prod.outlook.com (2603:10b6:303:9b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:03:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 09:03:18 +0000
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
X-Inumbo-ID: 139691ff-425d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692867803;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=7NXk3TUoorK3axRMN+k4qOCxS7iuHsrExEGL1D8BV3Q=;
  b=eYLZRXeCY+cIQLpxIfThlmqsZ1nJIVz9j6LlKG4kmIdGJn4jDM9JaCpy
   Un1w4W0ZMZhjFdgaCT1edzFlcv7fmR17n395XcL198W716D5Jg5ELps/T
   MOeDzbZgzzwQNFgwyEmeYW5Deh/Z968VBax3var6++QEAXrGUe+Wt/JaC
   U=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 120365330
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1o1RtKDG37hyXRVW/+biw5YqxClBgxIJ4kV8jS/XYbTApGwm0zMOy
 WQYXGvTb/3eYmSmL9p+b4yy9R8BvZ6HnNFgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNC5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy/9MEWdEx
 9IjFD0UYD7ejcOr77OZc7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrugA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPfqiny27SUxUsXXqofU52V1ftpuGHL6VMoCx4xa2OYjcWQ3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht9H0AT1itpWFRHTb8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv58FIalg9uzHiv/q
 w1mtwA7jrQXyMsUjaOy+Amdhyr2/sSQCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:2fWuUq0tPO7O9J0z8L6nPwqjBfdyeYIsimQD101hICG9E/bo4v
 xG+c5xuyMc5wxwZJheo6H9BEDtexLhHP1OkPos1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOd+EZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Sm+o8dfng5OXL8fq
 DslvauYlCbCAUqh7+Adx04dtmGncTPiJXlJTYeHnccmXCzpALt0qf+Dx+bmjwDUzZDqI1SjF
 TtokjC/6C+tPP+7RfZ2wbonvNrseqk8MJHGMuPzu4KLTn24zzYArhJavm5pTUop+Pq0nYG+e
 O82ysIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCSlqEqmm9X9WDU5T/VMnphYdByx0TtbgO1B
X-Talos-CUID: 9a23:KtrN6WC3cthp/oH6Exh+z14SEPILSUHQ1Xn+fkWZFEloaoTAHA==
X-Talos-MUID: 9a23:oUJteAXGrApNeYPq/DKrpBxBMcRQ3/yBN3sOkrI4g+qoCQUlbg==
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120365330"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwphuLD/IVdU+C8HQJ9B4d/Nu0x3tJgjHaR/PXggyhG/zPEMr5/B4xllF3QCvJMTq/JktGdqGfITGCFxua4k+8nekn7UCsFiWHY2QB/ZVL1UzlsxMPVIx5o7u3IHwQRPpY8pxI8m+akfmWBs7HLkqKXZPNXYvBkzR5MGpSLaa91wBsmuQldNfnfmXNxFR6uIFuQVR2q5rH2pwypmd5c8mq7HIJbfHL+yy68dx+Puk0F03GfCO/gMF/T4OpRiL6GsVPsHkrS0hp96+0gu02omhaEw6jebb4pZ+va2+FLMvrWKeKxXJpO2RGHtPHi3CweIkhrAk5k6G/FXzY2ZvCuE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QpfZ8Y1pARBnsRsHN+REqsp6412lRLypRmEjE84+ok=;
 b=YqguywAP0OSsAIy0+AXtVYNRCcoY1E3xvcU9SgXa9VbVZO9oekI3n86Cp1dQX0039C4LZLBoMR+Eq3Y5hQ6jKs01UIiW+W1Ec8kGGu/Q8PVTcirKJJW3UCYv9rv/qh2QiD5FFqXHqDeHQBvVr/aH0OuQYM+GC7Y12XcUOtkpSlwy1cewQ/+PWi01WkHC/k4oVmXRjl0PhMAc1W+G05hslw+cFw1nXNEq5QYD203R2KuAvWOuKFMp7roVUvdxlwsEcWn1x5hpFwQWDA6hdWSXQ/NxUvJgLn8uUGjS37D1tiyKE32BMw1Xakz2kOWqFnJUNB8q6tR4qpnqO8OXU//KoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QpfZ8Y1pARBnsRsHN+REqsp6412lRLypRmEjE84+ok=;
 b=xVLi8zS5Q9FtiQ9nwOCi6dQE5H1qEUfcsj+zmiUYTBEdoyym/ylKan01NLRzrw7yYFt4VrYWvkr2CqrfWFoVkJMzZxYXu9afBwkCI+LW+M8GHzwKh5AS1Esw9+Qe8LA6RHCZr1Xa/ejExk3J8yx87Ckh1e7ThX65EbriBDgBtWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/console: Set the default log level to INFO for release builds
Date: Thu, 24 Aug 2023 11:02:58 +0200
Message-ID: <20230824090258.96775-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0449.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::29) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: c54595ad-bee0-4f36-fb7c-08dba480f54a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80fAoL8CXejXUjTSH4N/QqLMZzfoU1xVvDeVm9q2XuVULDQv8gJCaZE1MvXDEFOCsH7WNbfhcapRN8Jjc35576jPOWETL86seGA4sm/UDULSQ+SNPHzubfRYWyItYAh/GouZTB7ImQ28gsyEe6H2MDd7Po4u1KiJBMRVV5m9GcnqJtxPUR3jw4e+x7LGwLhUntcx194jucSD76fDYxz+RsdQDl8RZ3Ghyz5QM4fqtmliUbt9cCKyaLLY/mqJIGCLFoQ7KyWeXBVqI1OAcfzhqzsxfdv5r3Hj0HjXsu3TfzsN8whZZTvhaLWsUmBG76jiqn90KMuxPHUENPvPZecyfgnrYC0G7BWWcR4DmSEyp5gQT0M16MzmgpvB5OQnSniJeULJT2CEmEAg1KjCrz4Ns5d4k6Vt43yjg+/9a9eVAM0eTghzTvROS9XWBr7+qU/jIgXGLsuvGbN+VXfVdQa62z3cpkgoQuGVcw2LUHuxir7rfNJTnUHzwE3slP0S+eiwBw9RhoUOQ9S5VU6b7j4wj/3pT9ZgTheDSjRaBNzYkDFFFE2hcVDBOydLlW9jyPwp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(1800799009)(186009)(451199024)(66476007)(54906003)(66946007)(66556008)(316002)(6916009)(82960400001)(478600001)(26005)(38100700002)(6666004)(41300700001)(6506007)(6486002)(86362001)(2906002)(6512007)(4326008)(8676002)(8936002)(83380400001)(2616005)(107886003)(5660300002)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9rb3VlbSsrakxPalZObE9Ba0MzSjZWaDVKNUxzdDVsc2lnbFJ3MU5tT1ZR?=
 =?utf-8?B?N2FocTBPZ2E1aTJqNm5MSDA3bmttQ1ZFU2NUdXQrZFBnb3ZWNHBTK2RsQVZL?=
 =?utf-8?B?ZmdDcUpUaklsYmdSWWlkY2pnMElCbjFmTzhnZWI0bjJUM2NyZGphbjBvZjd3?=
 =?utf-8?B?YXB1bVY0QjVobGVZd1dYVlBzZ29yMEtrc0drNkp5UUVKT2lrZjdSdmdQa081?=
 =?utf-8?B?TWtaRjE0U28wbzA2OWlRdGhiTy9vQTVTdzE1ei9PVG1CL2MxVnk3cjhTZG01?=
 =?utf-8?B?MmhNQVhsTnM1RW9reW14MGlyeTQydGt1a3BZclNHd1VsMDA5SldkZDBOV0FN?=
 =?utf-8?B?ZXFIcDhEc3dsVlZMODNrWTRva2ZUOXk0S2plVDBZQ1o1eEZmRjdObC9PTlFD?=
 =?utf-8?B?eUJzNUp2S2V6elQ3d0pUS3o4NlUrbWlMdG04RVZsQko5KzJvdUMxVmlpRkJN?=
 =?utf-8?B?Zno5UExBbWpUZnlITjRFMC9ySTRCNnhuNzFCUERsWUtZL2hmVm1hTndadjZs?=
 =?utf-8?B?c3AyWFh1TjBKckVMQnkydmVjc1RQeGJ0bFBBRGZkOC91UCtNZTZMWVFhMmk2?=
 =?utf-8?B?Z1Nmdi8xbG0wdGxpU1FrbjlkUlBwRlJ0elJTN0JualZtR2hvUEExZWZHbU9H?=
 =?utf-8?B?Tk9MUnlaREhZQ1FPZ0ZVNjQrd0Z1WStVUTR1Y3R2Tnl2Z1lITmUyZVg1aFpW?=
 =?utf-8?B?bmNCSjh6bFhVcEFiSmtVRmQxR0tSNjk1TlFlM2twcjlveHhnU3pDQjNFbTVj?=
 =?utf-8?B?ckFsazhxd2plZ2VmdHhkS1dXU0x6K21WeVV1QUVUb0xjaTZYYkphdW1yY29Y?=
 =?utf-8?B?NkJvVVRtSTdjMmhvY0pPNTY2ajkyRUlLSTJsbEZNQ0VsakhZcFc0STZBM1N6?=
 =?utf-8?B?b2tjM2NLOU1zRWZzOTY4aWdtcEZ2Yy9DMEpUMG9TeUtSMHdDSGhVN0lyQ0do?=
 =?utf-8?B?ZlRrN3g1OUJXNE1kbTlrZUdCOHhBbGJTZGNKcnB6bG5kV2t6Znc5N3N2V29I?=
 =?utf-8?B?ckUyNW5Hdm92S0p4NGZqc3kxemhwMTZwNUdkSjE4TENLVzlRYnN5OXB0cGN1?=
 =?utf-8?B?dWl2QUtsN1ptSjAyZnlxNTA0bFZxSngvOFpzVFlUa3Zyb1gzQndCdDdBYkxZ?=
 =?utf-8?B?K0RyMGFMR0RPemY3cmFOdVZKRnB6QUY3QmtXTno1RDRuVmlyWVliZjd1bVBi?=
 =?utf-8?B?Z09UcVlHMWNvUnpvYzZORjA3bENEcjlkMy82L3FQVzhYVCtDR29oQTZkc0FQ?=
 =?utf-8?B?S1ZkekR4S2pmVGlGK0FYbDNCdDB5RUhhRUhBaHNpS3NIRUp5VjNDK21tZ0xP?=
 =?utf-8?B?MGlMVDRpYTV1R1VTNlBSNU04TGEvcTV0cWZoVXVDSXpWSUFicEZ4NXpyRDhF?=
 =?utf-8?B?OU8xdy9Nd3kvTFNLbXRKbGZubGJQMy9OaFZKc09VNFd6UFNSaUV2eGE3STJI?=
 =?utf-8?B?Sm5US1g5OUF1eWhjTFJXT3VHTGJKcnJvaExmdVNPNW9sNjdiMGhTcEZUR1pD?=
 =?utf-8?B?T0cybmljdmI0THhYcDEvQ0p5dnU3R1JSVkgyM2krNDNoQVUzWHNBU3MzM0xI?=
 =?utf-8?B?RTZNdEs3NUc0eG41bzgrTy9DV21HWTNPZjRHNlJQY3lyLytXdUQ5QW1uSFVX?=
 =?utf-8?B?UXo0cjlnVDNiUk9hV3I1clBtbUtKdGtxL2hSd1VHb0FGa3RkZDJyWXh0bDYz?=
 =?utf-8?B?UzIrWEJYaHhTRTFTWVlTYm1TcFQ5eHdPaUpMZnRFbmdXTjkxaDZ3Q1o3V2Yx?=
 =?utf-8?B?bnhydzFaOFJ3Y0tnTkdsTGd1Q216cjBaMkx0RDZta3ZMK1pLeEhlVmdUckha?=
 =?utf-8?B?dUNwNU1Hckw1N0UrVTVidUdlQXhMZmo5V2YxcDR2akNSQitIaWREZlZ6bWpW?=
 =?utf-8?B?QVYrbXZkY01NK0JneFIxNUdTY1UxOWNjT2NSQ1k0UnkrMkRxZThLSEpPR0dm?=
 =?utf-8?B?b1VIY2dVMmd4NElQOTIrM3RxTTRtTzBUVVVsT1RTYXIwbzZwdG5EUmV4KzJ1?=
 =?utf-8?B?RFFsM1QrYUdyVCs4SHcxTm12NFUrMzEyN3lpWmRtRFF0bGZCUGNYcGhGNG96?=
 =?utf-8?B?dERzQll1SCtMb0tFQnRyaDdmYTArVXhWeXFGbjNvMzFiREl0TjdkaU9vQ3Qr?=
 =?utf-8?B?RGxFS1lHWjlreUZZWW15a0ZUUTZJdVRtcmRsRXB6bWs2OVhmN3B1Y1V5T3Nu?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oTbkDIudJTI7TiVSPQlfrnpom7ShqLBi+0M/F/KOzWODef4T5rChOV5yI54CrOuPJvQrPFIPW7c11t1OQuarl0QYFiM2wVa+PlgZ3kJhgSdrPjCSEhYM4+ePPcFJ0SDPYIhxAFDhA1mfTN7fFLjmEwVKgvw6qz5GlNoU5lIYGCQEU5JPfPUlVqNOdKNtMN3XCkor44ncTIB2lqLP/TeK9NP6pJbl+uAF8ixlhA5EeKoTs+YeZuBsYwi2lhgs0IQXdDbscnFLL12aHeu+JtyD1Fg0YGCygmU3AMcoXsReFlpIdWuy/Mv4QLXabrGV+A0syhUCuH43U2n1V1HZHweufApXu3BGnc0rjZcORGdR0RFIv60+nD6JamrlPjMKDp4JCnAlAm0ycNHkKWlOEcIUhMX74S4hTAPGg5ZCiQL4iXuzb/49Tw9IwFvL5A4p0/rVFIq4e9jH9zl21PzMKQV8ElE0B92MaSObDJiMrfyCPg+iFo3kjm3DZh7xT+5pg5C/28ZNXMUmnrnH1W3rJ4CRqQAwLdI1x6Ef0Mn3UbRF87JdDERGm/ThRUGCVfJ4h2AtDrgeSGzk1QdS3KL5IySnjjbm0xkucItifjoPtd9Cwv30OIa17UJ/5w8ot8nOGsuVt31OSD70P2JyVBGNLuAkenHwob1OuZP/xf17SFTjrt5JgAVGu6T4KcuhZQdRpxKwqIAXrdgrSOUMJdJus2yeLPsnUp5CnLmLzYExXj/QAyZCT71QS7eXJYnI15eeFLGPGaxug+p4/8WYwPRrXYHqhO+oNSWxASLRg+lom6eXYc3QBkHyT0CwDVPVGdGG4NBHQk2SmVItk22O8hRz14+W2M+FztJ2KAvRMcVpV2b7xbs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54595ad-bee0-4f36-fb7c-08dba480f54a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:03:18.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGivlmA3TPD0KHPUM1YDKyiY58noeJNWdZju5ZLvtTEzS+4pQyo8xdUZznkzG6WMAwhnj1nXbXk+rBrows/3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5795

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Not displaying INFO messages by default on release builds is not
helpful, as messages of that level are relevant for hypervisor
operation.  For example messages related to livepatches applied and
reverted are of INFO level.

Custom builds that require less verbose output can adjust it using the
command line, but attempt to provide all relevant information by
default on release builds.

Adjust the loglevel of printks that don't have an associated level to
INFO instead of WARNING, since INFO will now be printed by default on
all builds.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 xen/drivers/char/console.c        | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 5f388eb560c9..a3145983f623 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1706,7 +1706,7 @@ This option is available for hypervisors built with CONFIG_DEBUG_LOCKS only.
 ### loglvl
 > `= <level>[/<rate-limited level>]` where level is `none | error | warning | info | debug | all`
 
-> Default: `loglvl=warning`
+> Default: `loglvl=info`
 
 > Can be modified at runtime
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0e410fa086df..f81b8b6b47d0 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -136,8 +136,8 @@ static DEFINE_SPINLOCK(console_lock);
  * the lower threshold equal to the upper.
  */
 #ifdef NDEBUG
-#define XENLOG_UPPER_THRESHOLD       2 /* Do not print INFO and DEBUG  */
-#define XENLOG_LOWER_THRESHOLD       2 /* Always print ERR and WARNING */
+#define XENLOG_UPPER_THRESHOLD       3 /* Do not print DEBUG  */
+#define XENLOG_LOWER_THRESHOLD       3 /* Always print INFO, ERR and WARNING */
 #define XENLOG_GUEST_UPPER_THRESHOLD 2 /* Do not print INFO and DEBUG  */
 #define XENLOG_GUEST_LOWER_THRESHOLD 0 /* Rate-limit ERR and WARNING   */
 #else
@@ -150,7 +150,7 @@ static DEFINE_SPINLOCK(console_lock);
  * The XENLOG_DEFAULT is the default given to printks that
  * do not have any print level associated with them.
  */
-#define XENLOG_DEFAULT       1 /* XENLOG_WARNING */
+#define XENLOG_DEFAULT       2 /* XENLOG_INFO */
 #define XENLOG_GUEST_DEFAULT 1 /* XENLOG_WARNING */
 
 static int __read_mostly xenlog_upper_thresh = XENLOG_UPPER_THRESHOLD;
-- 
2.41.0


