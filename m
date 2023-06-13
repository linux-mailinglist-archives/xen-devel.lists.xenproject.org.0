Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6F72DED2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547963.855648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q911x-0004mh-Ne; Tue, 13 Jun 2023 10:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547963.855648; Tue, 13 Jun 2023 10:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q911x-0004kK-Kx; Tue, 13 Jun 2023 10:13:41 +0000
Received: by outflank-mailman (input) for mailman id 547963;
 Tue, 13 Jun 2023 10:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qeg=CB=citrix.com=prvs=521ad94c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q911w-0004kD-GO
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:13:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5e3a150-09d2-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:13:38 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2023 06:13:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6156.namprd03.prod.outlook.com (2603:10b6:408:101::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 10:13:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529%6]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 10:13:32 +0000
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
X-Inumbo-ID: f5e3a150-09d2-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686651218;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ar7JSWCHfOS72OqSWinzSo4qh8vU7tSRF/npAlaU7mo=;
  b=FAI3SGhAdwIjZ1ikjb1yQXN+eFvUd67CFlVW4q+GqJSqe6Eihn41LWc9
   hGTY1rf1VNAiMFr0Lf6UZ5PAWF1zuxwCegjMgIapMzXjZ5O1j1Iu9+Aiy
   GNwRVq49/19EKhB/AbPCCsxL5RWkZI5ndr2jMDjwAIJcbkRlfOv36Dzoc
   M=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 113010329
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/Vhk4qxiQnXHF1iAf596t+ckxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 WEfXWmHPf2CMWGmeY0gb4ix8hxQvMXcxtJrTlRl+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPKsT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KThg8
 scXeBA8VTC4vM7r6YqwYedLmMt2eaEHPKtH0p1h5RfwKK58BLzmGODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVkFAZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137SXxHugAtN6+LuQ+ddxjWGfm0MoM0MSVGOS8KG8m1bgRIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbQGDq5WQQHOZs7uR9jW7PHBPKXdYPXNYCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:yhKID6sVVvWUHKe79E3Np0227skDu9V00zEX/kB9WHVpW+afkN
 2jm+le8BPyhisRMUtQ4OxoWZPwJU80kKQf3WB/B9aftWXd2FdAT7sSiLcKoQeQeBEWn9Q1vc
 ldmupFebrN5DNB/KTHCXGDYrAd6ejCyoaOpc2b4lVMaUVRS49Ghj0SNi+rVndxQwlNQboVfa
 Dy2uN34wCnfnQcKuCVb0NoYwCWz+enqK7b
X-Talos-CUID: 9a23:GdlJSm80yvjdI6mnJ/6Vvxc6HfsqIl3s91frGGPlIF5iY7OyV1DFrQ==
X-Talos-MUID: 9a23:GSa7CQhpVweZKbqfc4wAecMpO+5z7piiVW82qssCuvGtZHR1Ki/Dk2Hi
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="113010329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMzo/t1x3i7JJlWBBDQ35qUWMwiPbt9bmXyMENCV8u4nUBW13Y2BMQ9g6fV2vzIDFcg61yTDDw+7+mSjTIfRT9x9GR0advqVUuIi1EI7vxJCo9lMGLnCK7HxzMv+twLEDsfU/UV3zPDrKXk6pvnmewpZvI1KMgf6eEDGWzTnSPJfEYbgMbPG0Q+e91QElaw/LscpA4jzZtYO11r9iA2eQlrqgzt/DbcffxQLozd/DodfIRelUHLZqipNI6W5z6GhU+sYVzTL8VP7fVRcll0SChwsc/labQ/+XzS7G6ZaDFZHqBL9vifrvCQWy0SDDT1Bxi2877qq+QCd2EjRSrjiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukpPL3ENiHNCM+TCw9anvfetqEyu8mpxdvdU3ftHPzc=;
 b=MWfkY1UW7x4dRx2rgTl8XxErJJI5WRtByUmUJrmEXeaVXs5c+G+CmVmqkL65TqMB90MltQ3obzcPJZnyCfr2OOeJPbzPgdktKyczPMWGEhfMVziz2hxNmfd+PjiDg3U8Hpl41JRQlg/2eeWo4kESJpRV189uKR8sg3l07t8hFbm0Qme5ubCFh8INsltq6BF6bsNTeKmT0lJjiFR4Njo6mC9Q3d6t4NyVJ6ucesf5zvqfEvXgSmN8E47hUi8QXnHvzQqQdbR681zjUSokcG5dvv0qq32PQMX0S0ustXe+yUrxzm+jqdHcWNg6HjYJKOjrz4YuutnVe2WSlO/0UjO+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukpPL3ENiHNCM+TCw9anvfetqEyu8mpxdvdU3ftHPzc=;
 b=iKW5H0OdvCNzmYeSkbEtl5SL05UJ+FIm/Lhezl68A+tTkWnsOKign/xfGyreXOfjuKBp4jIQRsGxAAIwDqEe5W/I7E3XmTbhPEPGsPU4kfpyg0HGoczrzseCsPpdM/J8QnxVUXSX7ceZ7gdARRzoLaJZDq+PMtvMpNjHOgNERsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] iommu/amd-vi: fix checking for Invalidate All support in amd_iommu_resume()
Date: Tue, 13 Jun 2023 12:13:13 +0200
Message-Id: <20230613101313.51326-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: d93906c4-bc0c-4f80-cdd3-08db6bf6d727
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EJATgP87kvAqDC1t8GYSzrlFLcfLOHRDPvKecezuux0XuVJ0J6rZ7sKOVcytoz3t37RAm34TgZaO83zq/qhMLnaztbn0T17v4bf+p19LWon0zPx7jA3fa3CdaCaLq+3g6ZcI9eOFsD29cgZXkZtYaQWaGtPctpX2NI3cAmotRX6MhIHfMlHdK+KyWd7HFD13m9H+pDfaFBLUsjuJn8/x5vTJyKamH30FRm8P7blltWVXIQ3d/G6oaO+ZdoFTxrC+3YUngXUtVoV0xZ8J63p5d8FPcniUq7U1GnnLDOl6tryoG8putwUOoqGnQspHVdGYspPxq72NTKw6fTHzxvap2AjJg0VZgOY9obWxmdYNBZNPGUerBBpZLCxBAy1PbxOU5X0Tq0O1Jgujr3a9JiZuKvVlufEStTnN8dFHw3l41c1GI5EiVQc3nxyVBN1IEvhIUCMejUtfF8YXmVtVmkprgabMw2U6H2SBUJsKeDJJKu0X4ZJ3D77GPxaA5mvkvkzqIlstnX2oaKehQ9q3wtzRSdHRWXdNZmcqNop+jS6gQFSyWFMEReYgiCd8UVE++KCD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(186003)(6506007)(6512007)(1076003)(26005)(38100700002)(83380400001)(107886003)(41300700001)(6486002)(2616005)(478600001)(54906003)(86362001)(6666004)(82960400001)(8936002)(66476007)(4326008)(6916009)(66556008)(316002)(66946007)(8676002)(5660300002)(2906002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0l6Q01KVk5USHY2Rmt4TUl6cituTlZsaDJJSExHS1ArcVcyZEZCSVEvd0RS?=
 =?utf-8?B?L3hLU29EaTFaV1orQ1h6ejVKTjBpM0Q1SXgrdUtKbHpsQW90WW9nemM2SlY2?=
 =?utf-8?B?WC9QVHpWMEt3a3ZrcDdpRDdCbnZSWWxpc1hMa3BaL1NTTkJuM0N4aTBIN0FT?=
 =?utf-8?B?azlDZGRsTW9oczVjWWNYZk82SjhnaUZPOW5VNy9iTTlJeGNmVGQycm56djIz?=
 =?utf-8?B?aFVNMXREYkYxdWlNa0U4TW42TkhnVnZ1Q3UrQjRVV3VWVUNqZUd0WVp4Nk5m?=
 =?utf-8?B?Y2s5cVpGTVhaUy92RVJHcHdqYUc4VWp6cDRBNlpyYU5zbXFjemJaTkp0WCtR?=
 =?utf-8?B?cFFuQWI3U2VYcEU4RzhnQWR2TmRQZnB0TzF3d3RteU5tS0pnY2tWamJLRzNj?=
 =?utf-8?B?VUFuVmlEd2djcnBlaE81ZXZjdDRodFo1QXVtMXRyNEdkRU5CZmp3QVloMCs3?=
 =?utf-8?B?aExGaElPZDJwSEhjMnRpclFvbU9nNmRKNmI4OGJONWUyb0xOZzNveS9ubGpC?=
 =?utf-8?B?Yk1qTFBkVC8wNFZ0ZGozRHBVUm1rUWJES3IwbTFwRlZpQlQ3S2VTdUU4eUQw?=
 =?utf-8?B?NU5xS0ZLbkIwTnloK1h1Z3QrSFppZzZIR2xKK25EZ05GVjNoNlVDU2dmQXJy?=
 =?utf-8?B?Vlc0TWNUM2lwWkloQllpdmJjUUdKOEtTYlRUUFo0LzBQQ1ZTclgyMXlWQjV3?=
 =?utf-8?B?OHRVU1BId3BGUXU3Yk9kc2xkUjVtUGU4aWdrT3BRRHV0YUJKdFpzdTdRMndI?=
 =?utf-8?B?bnFoQW4yMWg1MmhwQWVzVm5vMzNuRzRXdVhaVzd4dThRZFVUUXJsU3E4T0gv?=
 =?utf-8?B?OExPc21QYlBvUXdaRVZGQnVYUGVadWlHSUkwZjFZSFVSZFNETFMrRGNJV0lS?=
 =?utf-8?B?ZGxzNWpQcUtFRjZiSFF3bmlVcyttTEJ0NStnR0UxUFZGQndWTlRQS3QrbUdF?=
 =?utf-8?B?eThPRkpLa3JUQWJrTTJGNzMrS0pYYXNxRnVNZGhLVGNnUW5lREY4Nm1MZmNM?=
 =?utf-8?B?RWE0YklFMXZNRjAxMVFlZTZ5Y1NQbGNndFcwdTdTTXRKMDJUa0ZCTGlLSGFx?=
 =?utf-8?B?ejZqbERqSkYyWFY2S3dJQndhTjVzL0Y0Mm9jYW9iRktEaWFpMXYxUWN4MDZq?=
 =?utf-8?B?dGFrVFpiWnR6RnN4ZCswQytCMUdGN0ZzalZJbVZGSHB6ZC83elNHeU5YZmpu?=
 =?utf-8?B?S1ZKcEJNSmhvdXNhWFlZbERXTTUxbUpacWFnRkpDc1FhREo3bElHWTIyc0Mr?=
 =?utf-8?B?RGorUXJxdHdmWnc3NUJvaTFnbUErT05ZMnVTK09nN21OMEV1TDQxRTQxcnBZ?=
 =?utf-8?B?bmFuM0pjRWg3Q2NSM2FmWWk3a0tBVlFVZDZKZWx4aXFEaldveGFXR1pzMVpL?=
 =?utf-8?B?QlhrQ0NvdENPZDJzazB1dWw3ZWQ0QXphZmYwUWFrc0w2UGFXdndLczVCRVdr?=
 =?utf-8?B?MzhralBlTFM3SEdzVnVyNXpVV3I3b0xwQm04Rms1T0xnVGlrbnZ1UHJKQ1p2?=
 =?utf-8?B?VjQwbk5LeWtwZFJPQXV6YmljOGRablQxUGdTQ3ZLbUhBc0tGNXFlMWZuTldt?=
 =?utf-8?B?eEYyQnNnMWVYME9JdXA5U0h2blg5MDZ3MGphVTNJUGdLZ2JyZEc5cmxZdGto?=
 =?utf-8?B?bnJaSTBYSlpmY1FNc205KzBqbDJZaWJLMU9rdmtCdmVUZm52Vjg0dXdBcUxG?=
 =?utf-8?B?V25ualU1blRoU1BBTTdrS0hTL3FMc3ZSNTY2ZkNZZG1KdVRiZXFWU09ZWDNy?=
 =?utf-8?B?eWNuTEhKT2YyS2NYWmdHZzhnZ3A2VW9yY055eEh0Tm11TmJHT1p4Q1owcmpv?=
 =?utf-8?B?cWlTUnpwaENvN3JRcVlUZU9oRUlTVWk4WEhLR2h4dWhJWi9aSzlia2VaLzlZ?=
 =?utf-8?B?NVZ5c3RqdDF2U0dVZktDVXRYSnA1bUIwYlVSNlk3SmZObEN1UDkxaC9oN0dy?=
 =?utf-8?B?YTM2QndjZ1pXUUM0SlhRMG9DaFRCSjNzOEZudXk2WmdJZWVHbFNXNFFMMFUw?=
 =?utf-8?B?TGpwRGlQL0hyZCtkYVgyeFhtUFZ5V1RXWWxlM2o3RXhyZ3l0UE8rRUN5aHNC?=
 =?utf-8?B?UStzTUd3ODc0SG1nTUhmNEFzN0F2MGI2eTRBYU93Y2xlWTN6MWI4TmxnRG8y?=
 =?utf-8?Q?UINg5L7E3mLFjr+qV1Nmg0vbO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6dtqXvQVF0CMR2iOL8Fyc5f9KPJanQSBH/RxQdm0xJEJ0+xh+3dFQsJb7Ep/eNEQJwYRv6sA85ZGESxwIgHPtSpV7yLvV+4XqKq4uG8GFhK5fNvKCGWeBL9fHhaI/nQHzBFkGqmaWMI79fjY0BDZbzTBcsAUgETW+6nkXKe++clyZYKOLHaGw9TXJq1xbzO1HfGOKpHQGqBkn+by6eVxl9wXo243jFuAQskvvuzaNNufYHfaljcxDN0+YMygZ3DY+g4z2xnea1P1Eam4re1Qb5uw6BGfeu9qzCArJx+gtUqII+KaybxLhZbRo8KaVNlDwgxuVbVJeREBIxiMrv+cgQQIPrM8qrFzt5Q+rtwkE6AzVHpfSqhjAjSB+ZldKeHoTiu7OhXT7jjmWQqzmhta/8P2DOIauRxvddhXr4g2H9n0N6ypaloKTAMrMXzQlcXD5zYW0o1a5Yg/xk4JrKMMTTAnBo+f5MJhT4jL7dCPCRAHAMGtmHOh8rpOVF9VRBz6HeJkT1cEq0BIQIq8nk4KEvuYQBl8/uHlI6/TePCHCRja5bUflEKQc6WPfqC9ffowNRPONndpebS+77zWWfclaVPJRPUVF7zPXHSkMynNGlMSV2VF0r/I6T3yVa81qp4KFVuxEPHWLPbXsGOMYtz/M+VpM8leQy6yDzzdONoKZIUo1CSv9simcKmG7no2Nt0s3m/YVXzZUVgJSPPFly2qzTVTKNqO93TMgmoZ6TCWHcB19S4ZX2rADAAo6HHheCksL867VpjPkURMG/Tu+H9mpLNXzzb10LTbX0JAhat5opct71C9yuQFiltygSRATZCa
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93906c4-bc0c-4f80-cdd3-08db6bf6d727
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:13:32.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TJry5bsdKWHdBhM/MlpFgx9XIETD57NEEbDNkI5uMs8FPu5z9WNmQXhi6njcklZSEmjk7bSo/z4XHDPl8yw7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6156

Do not rely on iommu local variable pointing to a valid amd_iommu
element after the call to for_each_amd_iommu().  Instead check whether
any IOMMU on the system doesn't support Invalidate All in order to
perform the per-domain and per-device flushes.

Fixes: 9c46139de889 ('amd iommu: Support INVALIDATE_IOMMU_ALL command.')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I don't have a way to test host suspend/resume, so the patch is only
build tested.
---
 xen/drivers/passthrough/amd/iommu_init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 9773ccfcb41f..4facff93d68b 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1580,6 +1580,7 @@ void cf_check amd_iommu_crash_shutdown(void)
 void cf_check amd_iommu_resume(void)
 {
     struct amd_iommu *iommu;
+    bool invalidate_all = true;
 
     for_each_amd_iommu ( iommu )
     {
@@ -1589,10 +1590,12 @@ void cf_check amd_iommu_resume(void)
         */
         disable_iommu(iommu);
         enable_iommu(iommu);
+        if ( !iommu->features.flds.ia_sup && invalidate_all )
+            invalidate_all = false;
     }
 
     /* flush all cache entries after iommu re-enabled */
-    if ( !iommu->features.flds.ia_sup )
+    if ( !invalidate_all )
     {
         invalidate_all_devices();
         invalidate_all_domain_pages();
-- 
2.40.0


