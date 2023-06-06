Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68148724300
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 14:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544058.849552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6W7E-0000FO-J3; Tue, 06 Jun 2023 12:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544058.849552; Tue, 06 Jun 2023 12:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6W7E-0000Cw-GB; Tue, 06 Jun 2023 12:48:48 +0000
Received: by outflank-mailman (input) for mailman id 544058;
 Tue, 06 Jun 2023 12:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tz0j=B2=citrix.com=prvs=514dea429=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6W7B-0000Cq-Vq
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 12:48:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 775afc31-0468-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 14:48:43 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2023 08:48:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5538.namprd03.prod.outlook.com (2603:10b6:208:285::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 12:47:59 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Tue, 6 Jun 2023
 12:47:59 +0000
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
X-Inumbo-ID: 775afc31-0468-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686055723;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zGmeKrAU3YsrpRh78hq8JCHN6XlwQ5friGDS/qVMrOk=;
  b=EXbj7Yxus3zZa9J5ElstbreKTV17doCUHOAUBTFzcfD0TcfShAdMr58p
   f9Nz/McWoJZA9MEnD8GWbheMhZEMjr/JoAkb5NQXxIMto/D9thYwX85av
   lKz8dZqiZsL8cB6I1it+J+88l6GSRb6i1RZNOzhD7vcTof7zy7Fi6JI0a
   A=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 111089255
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sFLXBquJ2sNKXTPKA5FXykwmS+fnVJhfMUV32f8akzHdYApBsoF/q
 tZmKWnTPa2OMTPwLd0jaIXjpxkB65fUzodjHQJkqng1RStA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGGySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNRooNiiZi+uPxpGFZ/Qz3PojK8jzBdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIS9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdtKROziq6MCbFu77UgPBjQMZ1GCn96Lk1CzZdBON
 HEN0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOttIyRDEs/
 k+EmZXuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqY2O76T+FnGh3ego8bPRwtsvgHPBDv9sEV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRfHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:VDZ4vqhmHgkedZGLThdrBzy18XBQX7t23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30QZJPh8sH7SGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Xh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboX0Twk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFv9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb9rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tps+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFzxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIKzNaVwg1DwqViGLHfQIpk03ek6hlS8fsumDcS7ciFuryP6yM9vR/EyWJ
 6ISeBr6rHYXC/T8L1yrnzDsqlpWAYjufIuy6gGsnK107b2w97Rx5vmWceWAobROhAZfU66Kk
 c/fVHIVbZ9BwaQKzLFvCQ=
X-Talos-CUID: 9a23:jdvRfm9dYgC1Zw54HMqVv1M+P5gdaHHU9XHzHWKlVjxXSLqUUWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ABuFAYg0a3YhTOLNH11J0GmYuMjUjyICyBmkXo58?=
 =?us-ascii?q?/he62LDJ9BTWMkwmua9py?=
X-IronPort-AV: E=Sophos;i="6.00,221,1681185600"; 
   d="scan'208";a="111089255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6DJ3HvpBHY03ciqfJ5kFG0kde9Hz67c1b5waNNEad9eWsdHfNIBTRH0YShMy1miac9tTWOqL7/4VErm3w+HYIRZH1pnRSbsEuNM8mSF6qeIxkHWaJ0kM0j9rYmNFd4H7NeySEON+P+kAHVZZ1tPteZaF07wSyCQhWOwnv2Ge9a4Ue6Iio6Oje68gKaSzopVmyYD8lqWXn+P1zSwDmeODrCpjOphRJ3ROcUrssSXq9ZdVKnioDO2cpaUI8kjzGlsyN/QEgUXmn0cFfOaZ70fS5TBZXVrrewAyUiY3ymNsU4P3CLbOeAR9MzQgRdpP9Vg1SXwXGKn/Hm87w0tVigRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDwDyoZp+SxQZl1iVzj/KEpIuUlTHSAv97fZkXKuQNw=;
 b=Hf/hrdwQ2iKoHKy6ffRXdE3a076gpxx0e5hi/Ny1cQ0LOra/sNQT/dJTe3iRH0YSk+Qf/cOdnLz6EnfAmHocelnDiHUPwnypa+CqDzU5FZag9aFwl4SZ8vQa/lwGxETT51zXCbLhQvahzeq4SNStYAHhhHP08Yeqa3YtW6vVpShG0BXwCF0v6AVmoB2hVfxhITJzVX4k9FvUGfDWEq53NA23MdnDlix3eJ5Urp/vP7r028/yCC07g14EmmsGUwn9pCVLuFvw1q4VnIpiNrxTopQvKuOcvJMlYhlNBXxRg48/x5T2zyK+UTN6QdeiSWAE5lTw4jeH337sU/5ZThAyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDwDyoZp+SxQZl1iVzj/KEpIuUlTHSAv97fZkXKuQNw=;
 b=t2uMcx9u1xB4kzg4rfQ5eyRvGmlB2wHlhAc3jA/L6EyS31W9DXQo9LVDtE34nH/iOaGnuudMtzYVr9lygjvtiY6fd8CCVOLrE5UdYh6Br1zTsERaaZT7zSdM2lqW2lxTZhzBq3fs7Rs9DeVwzPPxKU+MvfV5ben4S0QNbIkgbCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 6 Jun 2023 14:47:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] amd: disable C6 after 1000 days on Fam17h models 30-3fh
Message-ID: <ZH8q+bXqAab3sICI@Air-de-Roger>
References: <20230605151036.18085-1-roger.pau@citrix.com>
 <c0c4142d-586f-09be-b2d1-502be72e7968@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0c4142d-586f-09be-b2d1-502be72e7968@suse.com>
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5538:EE_
X-MS-Office365-Filtering-Correlation-Id: 05351d5a-92e2-4fba-feb0-08db668c41b6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bx7LaQp4QYkvPiy5PLX+MDYOuiPvQEniASDk+6KyIfiaG3hqK5La+z5pxDzq0Kt4umGL3dzom42nl+PIR8j8PXklOvQgUPTle4zshNmyH3I6sCzPquDl0pXl6xN8Gg2dgKkw/I+4k6d1AvQK/kHZkbqJ3jrM+KfAuTgsukQhLLs0IClNHamVp6z2nVPZyp1h2VOgFlfzNJz4F4nxta/DoE/5miuhk/cRDmBwXXDAbmhjh7VZqlj1qDSvXplHlV7uKJpn473HqEebQstv1LYIoB5K53bR4M3AB9eiKaVNrw7yvzInY1tOFCwOGIMhAcQ4muuQh2ctNaD1KfCbkCteg/1ykKf6yPqFnd/ki2Ky6wxOnbShGQ37C2SS0vNm48DB8plvlno69T56XesS44LiN0Ti5xle6qKyJebNvRad3T4b6O7zAcf3ekvgAXLjQghPyZxEBDCpPDr7bAUVtoNORal2g1Ho0mWTarl/irszDgC0JBHTeKs/eJPdnL4/cIAj8HcM3GrBSEljNvUPApdsbzk0Hqy75vhAmNBy0jMj0gS0iL66Nsol4W2Yjqokn7gud/xISZRNMcTyZHtBzT5x775LW+7RCvfkYbHFPWisOzQKu8SLwlW1Ui1zWsApdPL30WeieXSa59jysR+wMcq79w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(85182001)(2906002)(33716001)(86362001)(5660300002)(83380400001)(6486002)(6666004)(53546011)(9686003)(6512007)(26005)(6506007)(82960400001)(478600001)(186003)(54906003)(316002)(38100700002)(4326008)(41300700001)(66946007)(66556008)(66476007)(6916009)(8676002)(8936002)(221023011)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm9hemx1SWRzaitCUHlXY0hPTS96Rm4vdU0vcnBVekZOUHBaSHJidFVZb1o4?=
 =?utf-8?B?RWFXb1FJdWFVbjhnbHhJQVQ4a1lRci9QbHVwc2JlM3Y3Ukl6Sk1FQ3pWUitS?=
 =?utf-8?B?b1d6WHV0MzBPRGVXV2VqeUVXeVlWZ3RsaEdzTy9RRkdHRmZMYk13RzhoS1Jv?=
 =?utf-8?B?S3A4SnhBNTNhNjRMN3h6V0ZwdldKVHhUL1J3b2RoSmlBUlJhLzl4NGI3QkNI?=
 =?utf-8?B?Q0RhSWtqb0pqZkVhTmpzRTBERm16RWxVRlJublMxZWVMM0F0QTZ1WUt3cnE1?=
 =?utf-8?B?ekF4Tjg4bXkxeFlKUkludm1sNjVDTHFtcVdvcXB5b2QyMkJXYjZENlZFWmlW?=
 =?utf-8?B?cmJGVU1wU1BBMVk0ZnNwekM2MzMxeFJKWGxLTFhjL1BrcEZIZUNNMTYycVQr?=
 =?utf-8?B?WFBodlJwKzVxODVVWUx1bzhhZ2NRN2dYckhCemtkOEYzZWpnVVBMNDV1S3FW?=
 =?utf-8?B?Z05aalJpbDVZWmsvKzArczFQNzQ2dFYwOWxxTzIvVWd6aTg0cCt3bStXbXhj?=
 =?utf-8?B?QlBFQ2JVS2RIWjY1Wm02K0RQSGlRMGJ3dEdsNHZNYXVNQmQvSk1BU1BaTmFM?=
 =?utf-8?B?akRYRHJHNXFzR1hwNWVSdlhBZERsTWRyNEVsODFDN2FyZTZvWGlJbFdsTlRV?=
 =?utf-8?B?WGdYbjRrZE9vU0trUEcwY0d4Nm5HbVdtdGxwUnFjRExBQVZMM3RvYnFOYlhr?=
 =?utf-8?B?WXNQalRTMTlnTGhLU1pIbDUvcVhXdnRrdk95MnF1bXo4Q0R2Ujk2bHJlOWpt?=
 =?utf-8?B?TlZLVGtENlQrQUxGR3NxRk5aV1MyT1hmMllQMlE3a0E2ckZwUjdUT2RTeFQx?=
 =?utf-8?B?OTduWldOTWk3QytrbFVZaWJiUGtyNEgyZW9VVWhNN2cwUnpGNmxhYnhFWG5N?=
 =?utf-8?B?clVza1Y2SEZhWEN2MFR3MFFKa05DbE9od21uY3RIRFlQVGJNUVZwQ3lxOXpB?=
 =?utf-8?B?YVROR09TVTE5UFVYRjF0ZzlOek9GQ2p6THA3SStHUm9BOUQzWFZxMngxNytq?=
 =?utf-8?B?Rkl5MXJvUDQ2bE9mU1J1aWhSMW1GSkcwZ0RRdDYyVm5oY3g4aGtpTk9YV2Vj?=
 =?utf-8?B?NnRSR0J1SFBDTENPM1RWaGkwMGRUdE1rMksxdWpzRDNLejh2QTlpbmFzMmZo?=
 =?utf-8?B?S2UvRDJaU0pwc0l4S2pCSnpxQjBYS0hJakZvdUREek5Oa0hqNlhUYVNoTzMw?=
 =?utf-8?B?dGhZRWxrVXEyc3QyT2Z4bWJCSitvaGFCVHlXZ05saDZPVk0wdUtCRlRVUmR0?=
 =?utf-8?B?QUdIWGRFTC8wZ29YcVdndE5wcm16L3BxTUh4TDlxRXlHcUM1RnBPUlFVYjl3?=
 =?utf-8?B?eFZTbVJzbGZUV2pQMnNDVEdyRXBqYkIzUmpRbDR5YWxqSFVEMmJjbTd1ZmVX?=
 =?utf-8?B?cmQ2T1dsMmxjajFoNVNNaytPRFZCOC9wT2Q0YUVLNW03eGpnazY1WlhaVmc2?=
 =?utf-8?B?aXhTOURzUFAwa2xGdFpyMTgyTnJpM01ScGcwWG9NK0pXaVZ3eXgySEh0VTAx?=
 =?utf-8?B?cWRCV2tCV3AzUmNHQ1d0bDdXdllVQnZ2WTNaei9ubHJydFNZTkQ4cEpYVlFP?=
 =?utf-8?B?YVhFLzBOZ09aM2hRbzNNeFBac0hNZUdUVGVWbk5GVGZzUFJmMzhsVGtZNCtK?=
 =?utf-8?B?VTF4U0lLbDg4ZzlSWktXb3pYTFQxQXNRVENQa1o2UllGMEQrYVlwT0VoVW8y?=
 =?utf-8?B?RWc5WjF4WHVhOW1CaUJtZU9JZHV0UGNNeE9NNkJENFAvY3UyUm4wekpIb1lK?=
 =?utf-8?B?ZnFiVHk0aVdENVc2QlZIRkpTM2drTU9DWFdHQ01GOXVYWE9EL1BNYTM0T0th?=
 =?utf-8?B?dVQ2QlNLRENjN3JlNG9ZUmtUeE81aXZTU1hYekxJclorZFc1SlZMNHorU05p?=
 =?utf-8?B?K3l3Q241Uk12MlE0Yi9ENjFJQmNldGdacUxQaG9vbHBjYmU3Q2xGdVNYaUl2?=
 =?utf-8?B?V0NDc003SXpnb2RUNCs0Ly85eDhBTGFMSnd2aWRTRm1wN2M5STNib1F4djhF?=
 =?utf-8?B?elFLbWpYaHlEOTlTWjc3UEE0TDJIK3ZTTFFuYVFwS3dQRGE2TzRGZGlYeW5G?=
 =?utf-8?B?TGdiZ24xSFBuR29sbXBJTHo0Zk9hcXdJU2VUZVMzRHd4TVdUeUdQbldvU1RZ?=
 =?utf-8?B?OUxYSGgzYUFOeG4xL1pWbUIzUkZnOGUyWkozMytCSzliOHBJTGhPZ0l6ZXhQ?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L3XWD3Dw7geCrGcANx1R40aI3EYdxX5lOHjwDVz85aEApZ1BIfFLysqiuHfs8Kcp6XLsMTxYp9sP70BPRDIfZHz3rXhaXuyu/TO6933eY7UIqdtqe8njGdOdyc6/aqR3p7fQ2HD/+ToXH2LIf0RpNw1gcuUoAWQTcGcmsMnIY9kYMkjRIjX4+C3pZwaMEQr4mD+HLcicYjJsTB3J//XqpulEs1F3mm8n1PtrExIB9lf+a5An6hKthFb82kN55n+QGw+Kj0XQ+J5Qm/8SnEk83ZJsLI3DzgB6Ybfb973zo2znCp45P0tP7W0hj3Br9msM8I9I+uxWrs+SVhgYY3xusXL6kRHwW+OVnjdIuil0kL9CTnSBOEQxcy26ZPtRLxjS12kQqA1h5nqDh99aES2bVr5qOY/YxWJzI/YPJiW/NWO8VGLmJuNuiVpSfBBU1vy3NWYofqh6Be6EybTNT8uDNZB20DDJ6veZlTC4oUpCJf8aUWmcHEmBzcvZJ01qgVd21VEKY3pXdZUw/XGD/eNzjr9pKkRdQOoJmYfWIMTO3eSmahbMSBhotbpmiU2sJ/wn1JwwGmBqwIf7W8Oo0p7I9dHsC32whCEMyCxu88E3YSSGlCTeNl5q2As41d6Dv9T5KJHu7fOVrHsezkucxeI4JfoutwNBqq2bliU87Wn3ad4k4oZiHxkUwpn1LOhWQU1Lea1Y5PGZ1/h6uq68xffaZ7cAmwxkewpgjPPyoZupH1HUv1SXLzATQt8out6cYy7muOdAR9+sPm22NIPV1FKfR+bMzWq3YhlnpVqly+yVHp0UdrvB5/keCF3iVtHAy0KRCOtzpCTdeKBolNdT6T2l4aqDtFANBEy+/SDr88xcCWg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05351d5a-92e2-4fba-feb0-08db668c41b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 12:47:58.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+AOpWDG2nvCz4VUqRLef0P8jHqFeIeAMqITYISSeiV0GJzZTP8RZIkU2Pt5B7s1UHuOL2JyNrVYi0YSoB/gQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5538

On Mon, Jun 05, 2023 at 05:54:50PM +0200, Jan Beulich wrote:
> On 05.06.2023 17:10, Roger Pau Monne wrote:
> > As specified on Errata 1474:
> > 
> > "A core will fail to exit CC6 after about 1044 days after the last
> > system reset. The time of failure may vary depending on the spread
> > spectrum and REFCLK frequency."
> > 
> > Detect when running on AMD Fam17h models 30h-3fh and setup a timer to
> > prevent entering C6 after 1000 days have elapsed.  Take into account
> > the TSC value at boot in order to account for any time elapsed before
> > Xen has been booted.
> 
> Models 6x are also affected as per their RG. I have some trouble with
> the site, so it's too slow going to actually try and fish out the RGs
> for the other possible models.
> 
> Given more than one set of models is affected I of course also wonder
> whether Hygon CPUs wouldn't be affected, too. But I realize we have
> hardly any means to find out.

I've considered Hygon, but as you say I have no way I know to figure
out what models are affected.

> > @@ -1189,3 +1190,44 @@ const struct cpu_dev amd_cpu_dev = {
> >  	.c_early_init	= early_init_amd,
> >  	.c_init		= init_amd,
> >  };
> > +
> > +static void cf_check disable_c6(void *arg)
> > +{
> > +	printk(XENLOG_WARNING
> > +	       "Disabling C6 after 1000 days uptime due to AMD errata 1474\n");
> > +	amd_disable_c6 = true;
> > +}
> > +
> > +static int __init cf_check amd_c6_errata(void)
> > +{
> > +	/*
> > +	 * Errata #1474: A Core May Hang After About 1044 Days
> > +	 * Set up a timer to disable C6 after 1000 days uptime.
> > +	 */
> > +	s_time_t;
> > +
> > +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
> > +	    boot_cpu_data.x86 != 0x17 ||
> > +	    (boot_cpu_data.x86_model & 0xf0) != 0x30)
> 
> Perhaps better ... & ~0xf, just to be future-proof?

Right, will need to change anyway to account for 0x60 models.  But
x86_model is a char, and hence the mask is 0xff only (8 bits).

> > +		return 0;
> > +
> > +	/*
> > +	 * Deduct current TSC value, this would be relevant if
> > +	 * kexec'ed for example.
> > +	 */
> > +	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
> 
> Generally the TSC can be written (and we actually do so under certain
> circumstances), so deriving any absolute time from the TSC value is of
> at best questionable value.

It's IMO better than not accounting for the TSC at all. Worst
case is we end up disabling C6 before actually required, but that
would leave us in safe position anyway.

> Furthermore, perhaps better overall to suppress all of this logic when
> we're running virtualized ourselves?

Indeed, will do that.

> > +	if (delta > 0) {
> > +		static struct timer errata_c6;
> > +
> > +		init_timer(&errata_c6, disable_c6, NULL, 0);
> > +		set_timer(&errata_c6, NOW() + delta);
> > +	} else
> > +		disable_c6(NULL);
> 
> The log message is going to be misleading in this case. Maybe pass
> that as the so far unused handler argument? Albeit I realize that this
> will mean casting away const-ness, which isn't very nice.

I think we could use the same message in both cases, what about:

"Disabling C6 after 1000 days hardware uptime due to AMD errata 1474"

> > --- a/xen/include/xen/time.h
> > +++ b/xen/include/xen/time.h
> > @@ -53,6 +53,7 @@ struct tm wallclock_time(uint64_t *ns);
> >  
> >  #define SYSTEM_TIME_HZ  1000000000ULL
> >  #define NOW()           ((s_time_t)get_s_time())
> > +#define DAYS(_d)        ((s_time_t)((_d)  * 86400000000000ULL))
> >  #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
> >  #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
> >  #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))
> 
> While consistent with the other macros we have here, I think this would
> be neater as
> 
> #define DAYS(_d)        SECONDS((_d) * 86400ULL))

Hm, it would make more sense to introduce the missing macros between
DAYS() and SECONDS() (MINUTES() and HOURS()) and use HOURS() in DAYS()?

Thanks, Roger.

