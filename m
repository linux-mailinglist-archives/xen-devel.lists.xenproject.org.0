Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD456B775C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 13:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509248.784668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhBD-0002Xa-Fm; Mon, 13 Mar 2023 12:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509248.784668; Mon, 13 Mar 2023 12:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhBD-0002VD-Ct; Mon, 13 Mar 2023 12:21:31 +0000
Received: by outflank-mailman (input) for mailman id 509248;
 Mon, 13 Mar 2023 12:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EdO=7F=citrix.com=prvs=4292f2e3e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pbhBB-0002V7-Mz
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 12:21:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93689092-c199-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 13:21:28 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 08:21:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5209.namprd03.prod.outlook.com (2603:10b6:5:245::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 12:21:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 12:21:17 +0000
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
X-Inumbo-ID: 93689092-c199-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678710088;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZCInWqXnXNNAJCp2pmmLNSePjOPS7P383EwhPtdAKQU=;
  b=FFexCrCOXxUaHMeketc2hDbHO8e2Cr7u+cNbwYZlBnkPoEYV2Oafvois
   RIuW4rKAkdtbIoj+rauhPxSucz+OwOAmTFdcKczaE3+yf20zZ/DklGE8V
   KiFKb+Iy9qg6pwncf36g1MyOlJ6bCkhsoBQkZnG1dj+CvaClHdC2YT7Ve
   0=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 99966387
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JuIc8amng3ESk8C+H7OICv7o5gz7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbD2qEPPreYmf9L4h+Pd608U9Q6pfVz4NmHgVs/3syRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dMGeAAGTQ+dvtmn5Jfld9BnreYND9a+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzHKqBtxJROLQGvhCum+r22EJMSctREbk/uSHkUe/afN8J
 BlBksYphe1onKCxdfHnVgz+oGONuBE0Ut9cVeY97WmlyKDZ/gKYDWgsVSNaZZots8pebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnYy
 jSHvCE4i7gJy8IGyq678Ervijeg4JPOS2Yd7QXNX3m57wp/Io2iaoqp5nDS6PoGJ4GcJnG6o
 HUbktKCqsAPCZ2AnjaERuklFbSlof2CNVX0i0N1DZAl8Diq5HeLcoVZ4TU4L0BsWu4EfjnmZ
 ELS4EVR+ZZVM1OjaKMxaIW0Y+wo0KzhHJL3VvnSYfJHZ5Q3fwiClAlMZFeR1maru0ghl4k2P
 JvdesGpZV46BKJ93XyJTuES+bYxw2Y1wma7eHzg5xGu0L7baHvLT74AaQKKdrpgs/jCpxjJ+
 dFCMcfM0w9YTOD1fijQ98gUMEwOKn84Q5vxrqS7a9K+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:tQzFUKE4gks52RQ9pLqEGMeALOsnbusQ8zAXPhhKOGBomszxrb
 HKoB1p726KtN9xYgBTpTnkAsO9qBznhOZICOUqTNSftUzdyRaVxeJZnP7fKl/balbDH4dmvM
 8KE5SWSueAd2SS5fya3ODSKadF/DDzytHPuQ6o9QYLcegFUdAD0+67MGqm+49NKTWuyaBXKH
 L0jfA33gZJGBwsH7eG7yQ+Lpn+Tpbw5ezbiFY9dm4aAcC14w+V1A==
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="99966387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+dHVi4TzkU30fFH8721EQkY8OGyLwGRhoGEugMuuHnQSD2qHWNc7D0B7XFy69LXPuUD7fz8Pho2D9CQnkmEnwBJoIVZRkTj8huwT5VgmtBYT5i85oqkQue0eozs/uE1t71Wg4tiomPRQUsbUlOWc2I/J5RNfQA42Bj363wssR9IKaVTs33bRT51Qr8xcaACAwvsqX895M3UMzhgA7BUP253EAwJ4cPs8voZLd4409kXW0KW96rILI38OCF9n7xYkZ07QXQ690HhGJPCC8YEdY0Mq5SS+wXmSAzUbNtxA2YHUECEBrMv3yT/aFaphZpM12MbjS1xS5kjZZV/MFkoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMZq7t5HACCBn4ul1x+K4zW9jH35Wn7eBpGq+8P6zPs=;
 b=hJoNsBl/mcSckh0hTVxIP500TpSM74qcnSXOftyZ8bArE9x1t1sRqBtGA0AlOf+ur1snstpislT789Pt0LgxTG8mzSx2vN1jYqFApPCuWRJwHP4iv9fLim2u84M5AtJ+fM5DIdJfp/jgtPeBG9SbczY4AlkMOsL7SGVIH5vFk5fbbWEegMZclSCZjk/HoPG4S7BvQ+Ea2wUIz33uaIefGIetxpoMcf8mdxGynpKPEt5+hWgAFM3EUbcQzrNXjbAKYy0asTTxGPuXfNuIpTaMYFWnDjzX63yo24BD59UEoutur/YB1Y4Y9eaVNG/7Mbdd8H2yZ+hBRvIK7fP0IIdNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMZq7t5HACCBn4ul1x+K4zW9jH35Wn7eBpGq+8P6zPs=;
 b=E3Q+w8UGaLx5IskRjJERsRmzVC+Vmq83qLZDiBYr0g7nAUIEjTSQciqPT2L7/OlmeOaSHTNydU6mCEKWGxywIofvGvSYX1GfKpsLWUXBR0hdp9iICULZpwUaxbhqDIt1wJDnBTklp/tEaH1iX5sXjxRdOxzgh2do4zSF0LCFJ5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Mar 2023 13:21:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [RFC XEN PATCH 1/6] x86/pvh: report ACPI VFCT table to dom0 if
 present
Message-ID: <ZA8VNkfHUMjvtUnR@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-2-ray.huang@amd.com>
 <682beaa7-736e-432a-3525-1368891641c6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <682beaa7-736e-432a-3525-1368891641c6@citrix.com>
X-ClientProxiedBy: LO4P123CA0631.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf8e65e-bf15-4c7a-eade-08db23bd715d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	117tjladG8i0Cib7vNiAJLes5pNSM3uHp+rHIp/HkdR7IZeszBEPLkbUjz9RTbGtvD67NNbAFTIkTple8ojoqTBD78vRAaovEUfVRzr2yXfJsQS9DF6NAhzCLzA9uVKc/Hk7IdNrtvoeV0ADXWgwySQm9zaQ5IzQwVFrYeT4dmpSJyuVwKn+A+za15FMPp5UjdOtEkGF2Eq7+0bvRrD9ZeKE9en59ylzNtAyVUSRTdeLGZzxZy/XQY52PlX0nb93bNCNdxa/gPdTb/XxfkhXW+8NYLYq9lqdwvYU2ZiazAuaRs+PFBTKNdBLhCpBjjyG2FQeRoK81fVPlyuCUlSeq9qRl+Ost/ZS3fXMbdQ/s7O+xy333/e49m7Eswhh0q6BFeYStRZozEhifTREec7s84dhrVfdTT+Bf0bL1KHEx5bS36mY+GjeaOETfQiAiKBb1ScOdPY4kmj9l2ThbFO2g7ewKxSMvDwkM5C6rUZvUAlX/uodutyLdKH1yTcGYR2Y4GlYGXNxyXa1bB0Bk298vpKVQw2aUlz9Y7lcZcvJSeNHs/JooU9grEZ2Hc6+wm6ZUYlwKtG/u0oqTXHgDmnh+j/hF6bGl2ChBAIGeEUikox7743zUGIvdlYeimiZ3HNZEWX4gLgqg5wNwr+5xu5ZvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199018)(5660300002)(7416002)(85182001)(83380400001)(478600001)(6666004)(6506007)(26005)(6512007)(6486002)(33716001)(53546011)(9686003)(186003)(66476007)(4326008)(54906003)(6636002)(66946007)(8936002)(66556008)(41300700001)(8676002)(6862004)(86362001)(316002)(38100700002)(82960400001)(66899018)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVo5ZXRianJVaWhIN2Vua0g1TWFuc0UrWDZNK1NtV2lON1ZZR1NxWEthVU9u?=
 =?utf-8?B?cTRTTTFyZG4rV09QNDh5U01HbnN6RGVOTkFoZlhyOGtFeUJWemRZbC9Odk5D?=
 =?utf-8?B?VHNzb0JJb3E5WDZHYlFNZkhDQmQwczI3N21DMnBGcmtQbDh5Qnltd1hJVGpr?=
 =?utf-8?B?c2VkdWw3T1VtV2lQNHhGdVRaSDd6MEhkaVJsYXY5Z1JsQ3UwRExTVnZST3Zt?=
 =?utf-8?B?TXdyT215dGRBUmUwaTlLc2ppUUtKZ1MzK2xuSzF1aWd6MGx5MzY2RUJ5c3hP?=
 =?utf-8?B?ZUk0eTZ5ZFRjN1BlZE1VaE1DRFZjSlJ3UDFGK1N6ZmdudmVTZEFZYU1uTHQz?=
 =?utf-8?B?S1RBWGJxZmdjZFh4UitRUkdCWXprRlJNUEdVdVdRMlNaZ2xTR3djMGhsLzNj?=
 =?utf-8?B?T0lLVDdHTzRLRFh2ZmdZYm1QQklueXNMZDNLc2w5RzhNaWg1aGsvWUFQQUZ3?=
 =?utf-8?B?cVkwN0V6dXE2dkhPOWlBMmZBYnVNOSs1MlM5dS9HbjlwYUVDbXBRZjhrdkVk?=
 =?utf-8?B?eWZCYzlXY05TMmxGYzg2M3J4OVpzU3ZtYi9Odys1U1ZiUElkc3UxVDBsdjJ3?=
 =?utf-8?B?OFI2V2NDSmRUNVFQTHh0SHB5elh4U0VwbW9DUTJlQ3VvcHh2Ky9QaXVoWWpJ?=
 =?utf-8?B?bHVGV3hnbWxXRlkxdThVNVg5dzlkS3dqQVQ4RmNoRDFjNVFMZ2xyOXQxeDhV?=
 =?utf-8?B?c3pWZ2tOSU5WbTdPckpUOU04UEZXenl6SXJ5S0t1THVxZFRmaitxekd1NUhB?=
 =?utf-8?B?d0xPSjErZHEwREp6bUdOYlpKSlNVT2lVUXIvU2ZDdU1JQTdsaTFXa1hyM1dD?=
 =?utf-8?B?QlcrUStNZCtTY01xVEloamxIemJQRTM5RnIyc2tZTWltQkRhRVNNejdFdDB2?=
 =?utf-8?B?SitYYWxNeFNINkJUWk4wYzhxQm5qcVBTYXJudWZnMUZBTTlDdkp0Y0pnUUt3?=
 =?utf-8?B?cjFhb05TN3FYY0lLZmk3aFFpaFhhSWZtVVNKMnV1OWZjNjQ5cmkzV1gyNDFL?=
 =?utf-8?B?aitReElRYlZlSlFmRVhpREowc3RZNkpMSDE3ejRpYTRnejhCUUx1L2NBUXVI?=
 =?utf-8?B?RXNod0RudnBONDl4aUlTRExzeEFUMm1CQVZ5Z1lycUp6SEJNT21ldTZSL0Vh?=
 =?utf-8?B?SUE2dk81anpJY0wyRWY2ZGlQSG1SVDYvMFZ1YXR1U0J4aUdWV044WmhyU09p?=
 =?utf-8?B?cGhUUkhlUzVuTjY4Z2NneFVhT2QvMk5KT0tMa0d5Rm5HM0lYTzBmTCtKZGo0?=
 =?utf-8?B?TFpZbElmOExTYU9Db1IyY0ZkTW01V1VHT3FBeFA5dHBmeDdkY3R5SDRIWTJt?=
 =?utf-8?B?N2Q3NXVqSW1HL1g0M3RyaytHVU5sS2ZtSnNZejBCclJsYlg1aURhdHR6Qm1S?=
 =?utf-8?B?L2o4RUwzQmFST3pvMjB1Q2F5T0phQUFmQXNPWkswOWhxT0FkdEJBUUFxTUM2?=
 =?utf-8?B?UVlDdmQ2Q0xNcjRyM0VKOHVLdDV6SnZoUjIxZE0xZFFSTndvSzJCS01seVc1?=
 =?utf-8?B?bFkveUJ3QVhkU2FjdHVOMUNObTFxK1pUK2dYTW5TTkdxSjdZTGJZWFdkNS81?=
 =?utf-8?B?TW1DS3JidlJldFhQdmZ0ck4zNmQ0OXlDSVA4NTlxMlBUWWVRNUR5aFFCUTVw?=
 =?utf-8?B?b1YraEFNcm1ESlA4UzVodWt6ZE1nVVIzYXhNWjUxZ0FCQkV6cGYxUmxOR1U5?=
 =?utf-8?B?MzRnRVFyMnRBb0xzT0FlV3FKRG1OUkxHYTdZbTMyWWNDRkZHamZRRHduaGxm?=
 =?utf-8?B?dGpJNGRoVDJPMkVaYlVvSDREMExLU1Zsbm5nNGR5WDZhaWFkMU01a2FrOENC?=
 =?utf-8?B?V2xBWVJ5VzBCcW8rNlZ3KzFMVXgrS1RpRWRhdkRXSFJuK0dFeUZuRUlBZlY3?=
 =?utf-8?B?SEZONkRGSlF1Tkw2MmM3eWdLZGEzeEZrL2x3K3prODZ3OTVOWkRNN2I2UDIr?=
 =?utf-8?B?WFZidS8zZnowSitZdGZTV3hwejNmODVHMWRQbVJORWVqc1lkbEVrWHdxR0E1?=
 =?utf-8?B?VFl5U1U1VW01djEwcHMzNDFFTktVdGNkYVRiemlmV3pGTGdySnEzV3VqWVVl?=
 =?utf-8?B?Wnh6WjE5US9rNG1nL3VmVlJDdHF3Q3NKVmFWdzlQNUQxbWxQNmNMNFhuZHM0?=
 =?utf-8?B?SmVPaHE0QTVqQThOVjFINnkxajlKOWVJQTJ2R3htZVFKUjlzbXA3L0YxUUhj?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bk+bsKELFNG7YAbMl43ze3vFsMTlMvFxjuM8VL8F7rgv5bD6/CTrJI3WoimmyDOOKtjS0vUbB4zN73CC4UYs4cHWBnJ27+qEHYSOgtPqhuDqcCFVWdnd4+QkVmoS3eNptCR4UvahyBo/qBiPz9pZNSHpXQNE8qS1kUsb56a9Ox6ioQ5I4JxHsGM27HyUHV8K2M7pGyFg06VFhtnhjPqJR1k+fKZRaPEuRI5Tj5b2/myODZ1wtKWw29/9WTqRQwuzjtAkmUWL6qSnMX9a6vZDm0Yr4wTd1brYmZTLpPh9bZPxl7YzgAGzEVoTkf/94jyX35xcaB3ooOTFnT79/MllLHpDIfEoBAw14uREj022NTtUA9G2gktUIBnkxdvGyZpLp9CA2knEXfOtAnekr/E+2wZecIbxr3I7bYu8L86xZQ/Qi5IqvN+BFXXv9FwpV1I1UdZOMr4EY83YUBwztrSaDgN5qSkHwNo91f2FO1X28UYFIJSVROGr0YUH5CNz3NSIUnaK1G1i9QvkgRmFHuASCOfAqrCn1UQuS6Yde6Rrg//XxIRYfHutb8+Vj7SMvUUYw8HEUOiuFx0qgHoByKmCZSgc9n/L+A7Kcutay0nYfNoPQtcV+nUCeW3cgr/Wzp1tHUQnZ9IUBWDMqGbIqvLWRztKPN3mzkC/9Hb9LW3zain3YlaaTrR8+MdpHmi2IAH7IYesIJz4eMdXAQLqmfwGKHbxdLnK9uR6ru0zlX5j+BcXCfbv4EM8MVf3k8lOQlitl6LKON3w4v2zffyfB+BP5fameSgYaG19vh/eoZ5mZqczd0Z5ItkkjG1UeHPT2ImAxC0Ovn25+1J7Uo8XTufT6egbPC5GVMW3hIWIuVYZ0gzXhtS3+2X3D89G4B1SBTvNnGxb/LFdFo0LuOiY53q5Pw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf8e65e-bf15-4c7a-eade-08db23bd715d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:21:17.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tt5yYTLnQEHpcUFeAazKS8Pt5uG6SKC25GFbvpGUUMNq4W7LkldTuV6iEQWKm4CyKkPH2RYp1HS9DVGPiV6xxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5209

On Mon, Mar 13, 2023 at 11:55:56AM +0000, Andrew Cooper wrote:
> On 12/03/2023 7:54 am, Huang Rui wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> >
> > The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> > from the firmware instead of doing it on the PCI ROM on the physical
> > device.
> >
> > As such, this needs to be available for PVH dom0 to access, or else
> > the GPU won't work.
> >
> > Reported-by: Huang Rui <ray.huang@amd.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Acked-and-Tested-by: Huang Rui <ray.huang@amd.com>
> > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> 
> Huh...  Despite the release ack, this didn't get committed for 4.17.

There was a pending query from Jan as to where was this table
signature documented or at least registered, as it's not in the ACPI
spec or any related files.

I don't oppose to the change, as it's already used by Linux, so I
think it's impossible for the table signature to be reused, even if
not properly documented (it would cause havoc).

It's however not ideal to set this kind of precedents.

Thanks, Roger.

