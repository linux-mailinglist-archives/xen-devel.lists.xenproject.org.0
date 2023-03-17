Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A36BEDC6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 17:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511162.790094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdCh1-0000vg-NY; Fri, 17 Mar 2023 16:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511162.790094; Fri, 17 Mar 2023 16:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdCh1-0000sh-KR; Fri, 17 Mar 2023 16:12:35 +0000
Received: by outflank-mailman (input) for mailman id 511162;
 Fri, 17 Mar 2023 16:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pdCgz-0000sZ-O2
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 16:12:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8348f54f-c4de-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 17:12:29 +0100 (CET)
Received: from mail-bn8nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 12:12:26 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB4999.namprd03.prod.outlook.com (2603:10b6:a03:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 16:12:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%9]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:12:21 +0000
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
X-Inumbo-ID: 8348f54f-c4de-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679069549;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UARjhkZ2gzkzcbfVSNYGd3sdtsCdYphu8Y897ljoVxo=;
  b=FT/aTcTRse9vBeR70lVISBblPhuQkwNjGGWvmBgjJ7RHrlH9QSYQVpTM
   EFspOWIXsf3YDAhTwtFSJhWm7FtkdrS9d03luHab5FV28ftK8Ypc3E/7Z
   YFgZpELd3hvfmZHB8p4IKoegqV9cMstG62knfkXNjinUl4T3XeB1Yvboh
   s=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 101297726
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:I6qxjaM4WC1fPsTvrR2QlsFynXyQoLVcMsEvi/4bfWQNrUoghGYEx
 2tJWm7VOq2MZDf0eNlyYdvg/UlSvsCGndBjHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ts0DmRT7
 NwlEi1XUByCg76k27GKSNA506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqiv217CQx32TtIQ6Np653/FkvVevz2UKTyRGUxzkg6CJhRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vxDCFrmK2YTzSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2hBSfSN9mSPKxloetRWy2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN3xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:6b6c+6irb7WiSB0XhcyI/UAuDHBQXncji2hC6mlwRA09TySZ//
 re/sjz8SWEwAr5OUtQ0OxoXZPwCk80mqQV3WB6B8bXYOCLgguVxcRZnPLfKxOJIVyPygd279
 YTT0CVYOeAfGSS9PyKnjVQcOxQpuVuIcqT9JLjJhVWPGVXgvpbnnhE42+geyVLrUt9dP0E/f
 ynl716ThWbCAcqh6+Adxw4tob41r72fMWMW298O/fl0nj5sdr+0s+DLzGomi4EVTVB2LEj9n
 WAvTDYy8yYwoyG4y6Z7nTU6ZtOntvn159kP+yjzuYoChiEsHfVWK1RH4WpnDcprPqp4FNCqq
 i3n/7oBa8Yhh+/EF2InQ==
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="101297726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhjGi6Z/xU1GdO4l6kunmWjHN8V5+0SOwdrYTC4QfSyxys6iKIFc/VOOmR+ySbPSasTaEgoFhVQHHfrfFPgfhZ0ilFz+qw738PAs1yUM2N7ZMvnDZlrGROSd1s7BaHmrxpnUUvKfMwZAA2vNPcgV8JBh2OArfvif6usUn3D7nPdWP4RfxzbVPDaZgBqDHcVW8b3+zJ3V/GYhq26LXmnQ7Wqx6IZjYcBhdRYHdnb3oBU+MltjZ4wZcmxMKwvYUN8kkF//bE4gJgw4w9d15VaOtXlqXBCYj5n0yHEmWR6ZU7yJN6vXCb3I3xPfthvYbhIqMcVGNx6FeTXr9XGTKMjdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49WGvqiNufNnhQvmZi7/G3RkUsNEWpRCOeTfFUZSQiw=;
 b=EvQrSPTPN7Ws96edCG6tLHXfHahJ5MfZtwRh8t1kA44DBHZNovXIzoPyXFjl6LAMh3EELzeh1t5459X1ZLbQRRO1sfi6iwJ+SoLAJsIQ1qyzTGk5RCekx0pKmErG/oEHUwydD4wn8tTP1mejCHJ23grv3TU/6tMPdPh+FGwzQeQ1laAKAcW7ldb7sTTdo/WVK79Symhg89vk78RFGBP7mSGzkEWaVaWReeY8n4TtcoJZlUpB7G7G7QB+w2E/aW8bmdH2IvDM9/DdsFeixLRBrleJ7AcAfIZ/uUscc8ewwpxcpy+SOYiW/rrekTN3FpsNgGBNc6XHY/+G0utlXYUjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49WGvqiNufNnhQvmZi7/G3RkUsNEWpRCOeTfFUZSQiw=;
 b=Nm5SRodnjufyn1566Tu0d5ttfWVe8q28kQufr8WXZWTiaQPZDtZ+QlqxnzKoxO0KcgViiS9KKkYlUcN8VgrhXST3YcmhfGWOqLQjAMR6CATmxTuLabwnQYk/hzs2oiCdAFH6kziMQzLQotk8M+RzJ0mD6U7JOzWP+Z6NFAgwIfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 17:12:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/2] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZBSRX52P7Hb5OE19@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <441327cd-a7d6-8cb6-bf90-69df8e509425@suse.com>
 <20200720111118.GK7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200720111118.GK7191@Air-de-Roger>
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d8def8-3f95-4926-db15-08db2702636f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TvBzwgV5Q6vB2xs/A61ImU8ux6KTfZQhge5PXjwheq7IYD8raBW+ofoQV95XEz8vTWSZEjcN9fGo4X0uhr4ZVzgqzD2Snf3hnf4QLy4nWsJPmkaCI5Kt8TTFHAbnE+l7HCaKzLwPp4It9uAMP72ZEFjUr/hRSoklfQI2sHc8bTrpq+7WdNUuSO8x51WUdPRb38DybYAb5j4PYK+FKu+kzevJCOHqfiYzPVRHVVxw/J3pmCR8VmHLdXS9a7VwKk1FejlULKT/TRgkyrqRQ4QjSkHsAeQOh/Dm8UZTzFJBzdhg9IdfJ9FP4tz6+3Abd5V7s2R/3sfnJCFA5EWMheNJ9OKhf5SiyiSSxObeLklnYHcS1SqegNMafCBJklzdmGX02ckN/s7Bzt0Ae6luHMIkxGkAWnXumR5mv/E+RKgup2JHnryjywzZxzBRLYXNLZJy//R6DBU6YfkdADoE/pdAeNJFmRtBV0O51aewVp+vSs1++bxJ+45zb3seeQtBT5H66EAogwTVjiSM9E+qWWZYYDxo5wz7nQiUg/DJGhuGNmV9JmN60jX9pdeYc/ZWk2wwVnRMl+7p5ehYSO+DP6Es/4DWsjEPfetOjSli0VvIqiFF3JfHwEy6JTmN2g/R/tgtlCXuDFfA1Y3TeT5tRWo7Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199018)(85182001)(41300700001)(2906002)(8936002)(4744005)(4326008)(5660300002)(86362001)(38100700002)(82960400001)(66556008)(6666004)(107886003)(6486002)(8676002)(66946007)(478600001)(66476007)(6916009)(54906003)(33716001)(316002)(6506007)(26005)(6512007)(83380400001)(9686003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1h0d0kxZ3dXU2dtYUNiT3NybUpONExFM09kTzBseHhoUFMxbXd2emd0QjZ3?=
 =?utf-8?B?cEkrd3A3SkVmRzgwOTNJS3RpZE1vdnZiSjVFZVFTZ00zcEZNZHpMamlGN1BZ?=
 =?utf-8?B?QmhFNzA0dm9PbUpzeitZS1ozOC9PeWNuWEZiTDg0UUVzSElpVWYzWFpXamNF?=
 =?utf-8?B?cmdZNi9iMTc0TkRBTVNKQmt0cWhVZFFwb0hYaElERGFiZHBEaXl6cVJ2UUE5?=
 =?utf-8?B?R1o1ZktMYlRiTkVPRHJFdVZybnFNZkxLb3p3RUNGZ3RYd3FneXpWYkVBelE2?=
 =?utf-8?B?ZG5SdUNXdHdnTHUzT2dTWFV5bFZ3SSs4UG9KeVZibC8rcXEvbmpia2hzc0xH?=
 =?utf-8?B?aG1tR0xHdjVuakxJdUJmNWR1aDNMenpJQkF0aTFLcm5nNDMwMGxlb2IwT3Vr?=
 =?utf-8?B?VVZEdGowNkZKeHBwOWtreGlPUVRhZHJ1NFRxVVpkQ0ZxZUc2eHU0ZGVGWXVC?=
 =?utf-8?B?SmFHOForNzhOdFA2Q3k0VjJnTzEzVDB1T2F3Z0JJSTJ1eFQ1bkdPU056S2F1?=
 =?utf-8?B?ME9mWXRzZEhybWR6c3l4ZmhFRFptaDZYeXRhbjhvZ3NSNWo4UENEcFMxKzFr?=
 =?utf-8?B?VEZidkJTN3M2dXJneFgyUGhqNlZ6V3VCcTBqZ0tWZHcrNFB0Vmo2VGlwWFNQ?=
 =?utf-8?B?ZUVnQkhRVnhtKzYzOVpyWVF6NHR6UVZIT2IxNzRsQm5aL04wbStwclpYd25j?=
 =?utf-8?B?ekltREVsV1FsUEhXbElYRm0zVGVNSG9PQXZuRGZZQlhYbWZqT3lTQVBadEY2?=
 =?utf-8?B?Mm5CbUkyVUw4cTJIZWNVVHM1THRHTkl6Z3oyaDdkYmhJS2t5cVB1ZlY0MUJr?=
 =?utf-8?B?b21FdFUxV1JGaGJ4NW03MGVudGloZTB6TjhDeU9xNlBGd1htN053cVlQd3Za?=
 =?utf-8?B?bFZnNVdDTUk1Z3FsNDRjYU9CSjJEVmNnVFFTZ3IyUUE0YnhmcW1YcU9rQVJr?=
 =?utf-8?B?WHVJM2V2czBRZWNTS1Ryd2l3RmxJU01WcGx5Qmx4UjVxM0dac2d2L2NnQ3ND?=
 =?utf-8?B?MG5zYXZFaTJtb1JqSWVjMWh5SUpzd2tTRHV2WS8vNjNpZGE4QXUzcWRuNU5h?=
 =?utf-8?B?ZVRNaGVaelBVdWtKK0NOdHNXVG5kaTZOMitQSkNQVDhVejAybHJYRDNCOHZr?=
 =?utf-8?B?RDl3Q2hwMXNDZHFZSDRjUjRKTC9Bek8vVXRPTG1zTng5OVZSbDVkLzZlY1FT?=
 =?utf-8?B?bkxPblpUT0E1Ym9DelBtYVArY1lGb1dnRHhyR2UxN0g1cHRQd083TzJ4VU5M?=
 =?utf-8?B?YWFRamxzWHIzb0J1dVJsZ0JML3dSS2E5dlJ5YnRkV2hyRlRqWlVydStwYnF0?=
 =?utf-8?B?bUFtZkUwZHdLWFZldXlDaWR0Z3djcHBjek5Ga3E5T1hzMVlKZDRhc2ZsWXRj?=
 =?utf-8?B?WEFVZk02b1EzbUxrQjVnQWZISVVNSGQwb2xlVmVHU1lDTDRiRC9PREtIejFU?=
 =?utf-8?B?Skt3VDNvdTcweC96TWZ6dUJ1cDY5RVBVUWNnMkdxUU82UzhzQks2VnEvcHph?=
 =?utf-8?B?MGl1cGNmMUhHWDhpWFd0bkhoZnZmREdPZ2JvTjU3ZmxRMkN5Z2Y0YjU0cnVU?=
 =?utf-8?B?MU1TY0w2RU9GS2ZsL24vZzkycTZMQ1N3cWRqTWN5OHo5emhiSnZQRW9OOGho?=
 =?utf-8?B?Yi9IYlBROWFPUVBFTUhFMkpKNkJKWEdWVjFOa2ZRV21NNFFZYzB5R3lZSGE3?=
 =?utf-8?B?bmpUSTZHYkVMTVMzbVBiV29LODZEWWlVckZCSHU2RGdkN0dXdXplSlA5dE5M?=
 =?utf-8?B?UDFrZ2FBWkZvNlBIUWg3UHBhbjZyNjVEOHRUM0szeGpidzhkSXpERS9tb2du?=
 =?utf-8?B?b21hcVVWUFQrMUszWHozdFhwYUpHVy8vOFlKNFkwa0hZZDBqU0g3eGVNYTZK?=
 =?utf-8?B?T0s4NVUyeHZUVEFydVcxU1NQcTNuSlIyaWVhdm9VcDI4cjJIR1NhV09uY0Zi?=
 =?utf-8?B?SkVZc2hwYnZsVEw1a1JVdjBVV0krVjAvdms3TGZURnptdVVFWi9nL3hmQmVq?=
 =?utf-8?B?YVYrR3B4dlVCVVNXVW5VYVJOVzNya2g2c1RJR043Vi9Ka29CYzJZbzFOck9o?=
 =?utf-8?B?cHA2eTNyaGpJVEJHTUxNYkJSSE42MFZvYmlkZFVTNXVoWGt4Ykl4NVd6dncv?=
 =?utf-8?B?TXpxTU1DZHZGclNFcEIrKzhtN1hCQndTYjZNUFBvK1ZkRW9WeWR6NkExMDlZ?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YRIf2RBvnaAmr55qd5uSdbSIrGv9ubZBrc5gk7RQKLV7hbOYMxRVES6qs0ynYeHlPawCgtuOe3SnbPPknr7PBCf+g+Qa4f3sKm8CFJ3IQqrdcPhbidccxsl2Y5qSHRq7hYadr4uCuljfVMPzM97t0yk9rNqAS62cq/cer2WhY3iRpa4UzaVd0y2acJ5tR6GIg6E8qhgWMKyRnJVVyDCdpZukhg0SSUAQGE2/HlhUgHIIjQNQIAWYoB1lpYywJXO5wojzzOCdnju8uJKZfDW3qbcRvygOeK6MAD63OzF08ycudYk0B4kSMfMSCjOEYUCCGAkK9+iLMVijcvio1+7B8AUXVXUy0mLGTcatucWKTmyZxBfwqjGTLRgsLQmqhGe5RkRCg4ZI+FAIn7GJQDgFqM4GIwrudpPHSNabRlMU+PUD+NR/1MfVdPsiERdY59k0NnieS9DFMIQuuxMRnGxxrsD1KFEAjfz6Fx567npFC52UW0o7iI8w6DH9Wk2k6AOREjzqeTi1VtGoOK0+YM++NB0pkNeHDOCujRkAl41njCslN28Y9UkCxi3OcyBi/1LSk1NhdQgFo4Km/sYVM5qqaFBj7oECBamjwOF1T+x6JgRu9bPAwJxxbQg+HAGeQw5L+vAVFCrtyI/smKX7cQFrED4SmGprIdUb3N+KJCsZ0ZQQk3gOq21Xw2mEyrTPZTSVYqPPM5lr8eOJBUeRBYp5GmSi46/qjavW4yOxghJFk1Ialj+V9fpzXKnYIKMz52oMamoLjNiNdb2qBDHD8caCOtJODbvxVk86WflGgyyY0EqydIV3ZxGWHVRUcHLoNEFY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d8def8-3f95-4926-db15-08db2702636f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:12:21.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nil0jGFX7eLtOGQqg9Oc1P8x/sjyjsvXHMWXGobvTA01+J8vmdyuvidEkAVcZP30G3cdxg4D5pCrvM2WbSZM+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999

On Mon, Jul 20, 2020 at 01:11:18PM +0200, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 01:57:07PM +0200, Jan Beulich wrote:
> > ... in order to also intercept accesses through the alias ports.
> > 
> > Also stop intercepting accesses to the CMOS ports if we won't ourselves
> > use the CMOS RTC.
> 
> Will wait for v4 with the fixed additions to PVH dom0.

I think this is waiting for a v4, let me know if that's not the case.

Thanks, Roger.

