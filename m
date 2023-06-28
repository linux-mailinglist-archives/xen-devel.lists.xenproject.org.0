Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F074100B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 13:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556441.868990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETLb-0002Gy-Sq; Wed, 28 Jun 2023 11:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556441.868990; Wed, 28 Jun 2023 11:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETLb-0002EE-Po; Wed, 28 Jun 2023 11:28:31 +0000
Received: by outflank-mailman (input) for mailman id 556441;
 Wed, 28 Jun 2023 11:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKaW=CQ=citrix.com=prvs=53677329f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qETLa-0002BC-Eb
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 11:28:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e597a3c2-15a6-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 13:28:27 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2023 07:28:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6667.namprd03.prod.outlook.com (2603:10b6:303:122::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Wed, 28 Jun
 2023 11:28:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 11:28:22 +0000
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
X-Inumbo-ID: e597a3c2-15a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687951706;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GZ9RQ8aRBtTlyEXhMFf90N3jkT5j1uK1bYOFn+ipJ4o=;
  b=IMdO12csALaKscv6RVXGILD+efRil6ouenwa2JqzjDg2+Th8Pe9wAEzd
   zRbyNl4ak2WDPq5GKe/QdEOCN575MPoI2iOD1bmSHdDFG7EfmyiOyQC6J
   YYeBN9WukJQsBwSvFQcNYkUliDFhfP8VOHtzRWA3Xn+l/fUZdoE6f7K1G
   A=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 114473554
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OjwOTamibo9mACfT4Fk5DwHo5gxPJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCGjXaP7ZYzDyKYsnPIu+8U8CvJ+Eyd9mQAc5qSk3FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgV5g+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cc4JDMRSR/fvM71+e+qachem908INa+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeHkqaU33QH7Kmo7VTQcU1W6jOOCtF+wZs5UA
 WkVpnEPsv1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebR4A2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRny3
 jSLoS4Wl7gVy8kR2M2Tw1fDhD69o4nTeSQ87A7XQ2GN4xtwYciuYInAwVLW9+paJYCVCFyIp
 mEZmtO25foLS5qKkUSlSuIHFqCk/PaBPTjVh3ZgGpAg83Km/HvLVYlU4SpiLUZzdMgecDniY
 VT7pg9aopRUOROCZqhxZYWzB800zLPIGtHsV/SSZd1LCrB2cAKE5yBvI02NxWfmkEsrua46M
 JafN82rCB4yEq1hxSGqTvwc1pcxzzgiwnneQ5/6yRmqy7uYazieTrJtGEeWY+kj96SCiB/c6
 8pYLcaMxBRZXeDkYy/Yt4UUKDgiN38xCIrqrIpdf+GFKxBvMGs8BOTcx7xncItg95m5jc/N9
 3C5H0pHklz2gCSfLR3QMyg4LrTyQZx4sHQ3ezQ2Okql0GQiZoDp67oDc5wwfv8s8+kLIeNIc
 sTpsv6oWpxnIgkrMRxEBXUhhOSOrCiWuD8=
IronPort-HdrOrdr: A9a23:FJBuOqsnzayRe7d2kJAozDQE7skDhtV00zEX/kB9WHVpm6yj+v
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBO3ZogEIcxeUygc379
 YDT0ERMr3N5CNB/KHHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: 9a23:vYMh5GxdnGcNC5C7/DLPBgUvOswmblrSkEz8YHblGEVIeqCMVlOPrfY=
X-Talos-MUID: 9a23:VZdLzwZvKLUOCuBT6hbmgj9jGd1T3bWgNVwGu7AH55KlKnkl
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114473554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vs+JKBRpaP/EyEvoGf+O9/BnUIXt1RVy6typMLNaVcIARXoKr06PRV5i0nNkaiRoXBH1FpLS50ltQo7T4vwyKBkPeQXRZ4TKtIZd5nnOfYo+FIK8NAOZg9TWSwcusD0gwDFs3nlrjC8NJZu+ltB/QPsYsD6ZFIg3/2xBo0BwofYUKFUcdlLZtjjDNXlD7yL6k7aHEsFvjeq4RSFapTpio2ItA0ld1YN+6vUk63btXGfSnNg1Oxc2ddJs8AYP2qd4vbTTQ9Z0ENz0O0XyXnzQXRRwI3i6XO9ZNwME7ms2zHv10KYrGQX6LXFoWqXfAivdLJM10eX3clKZWm5DWotRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWf9FE5JByjue4Vxq37Qy8ZDTnEca4oZWiP9ciZ1/ps=;
 b=QV9XDMgBwzDGy9k3uafCYOLWC6eUzWh9JWXcBPHmMUmFCgxkzfre5LqLXg81eHFlgj/OL8S06UHY2Taxz+4ncDyiHuzJdFD3XMXJYSK9LYIWR0Lk+p9fqLH8COJLROLReqY7Vg3aiMeqpaf2MM7Dp6Bzmz/RDfr78+KndQ+3iZH18LJLISXRlgqMH5g7Jxr0MRVhGeIQyClstJlx8LhNtb59co73OmdhTMR2hxhltCpa7l9d0ewJDkk1zjCO2/EvG/UjntIOp3irnY0qI6tYD977Xgznhpa8aN++tMh1TLWhTLPUbWibWWve7HYYpqUCjLX3ptwXErJ6iAGGHo1nYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWf9FE5JByjue4Vxq37Qy8ZDTnEca4oZWiP9ciZ1/ps=;
 b=ayCPFejalOqq2UCf/PA+7/6XKu3ZFxrAYl9f3XsCslGpTTAtVlOv13+zoiOehjv8TgHkgsdO6TMFXJIu+oblO/SYPJC11r2elDfqu6Geba2l3VEIPGR9y//lV3/CeVd4VBgD19LbfzCx3HJFXfkzmexcz+eIKXlzBEK0OfSRO5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2e2f73af-4953-6b49-a404-4fce0e2f2fe3@citrix.com>
Date: Wed, 28 Jun 2023 12:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] xen/types: Rework stdint vs __{u,s}$N types
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
 <20230627075618.1180248-4-andrew.cooper3@citrix.com>
 <ZJwUt1r08pHhNK1n@MacBook-Air-de-Roger.local>
In-Reply-To: <ZJwUt1r08pHhNK1n@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b83e3a7-f384-4ae0-0c29-08db77cac7b8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GrhiYc++du209UU6+lyVP1I5RkNhbUh1+v2nrGTzEOPrOMPe63i3bUYLdgkk0knk3p253PkKvksQ4j2ibzOTnmAYrknBQqagfus0FlVxHBknVavQhknliifc22uEVNQ7LP+lZ7vfXYArMjIb5UHJJIbDctpLOl27n1psBt7VGDUsglc9GUTOXaCG2oaUIXgmYpUhwtwHix+xZecQ5y+/HihLsQnXFaLG0TsfKup+mGKNeLqZT3h/DIll/i8dlUybaLZG7xIYBcANfgZUwLOl6GlHBHNmeJQqWrAUabQ04aItG9Oj+4xkMShz3Sd5jo7giwgNbL/DqEuauodvpRt3Vk3MjKhvng9vW3gidz7qY8I6gtvHPJpNKjftFpjyeg/E5ZPS4/2y2jU6b3xCbBvlQAGvIW/XYMoaLv3NjrCTe/jkUH29IZ9CIfprZ9IZtBxi0MJI5kgRXz/t3I0Kq5Mj4+7LV6036mCbFmXD7QmVo2TU2pOZ5oruhuJU+YUYXrbwIiCmeVUvFt0A4mppnUYTbNNTL9rk6OUEy7cOrjhRAehsSI2YKEXPYfKXZaoixw4rkHhpVzghjll7HtNtqWoakE73HNvv9jngsKEpdxtuyfJlXXc0jyv91XwIFoZEogEsFgN3437mx5IX7KLHxKF6yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(478600001)(83380400001)(31696002)(86362001)(82960400001)(38100700002)(6666004)(6486002)(53546011)(186003)(2616005)(6506007)(36756003)(6512007)(2906002)(26005)(37006003)(54906003)(4326008)(6636002)(316002)(5660300002)(66946007)(66556008)(31686004)(41300700001)(6862004)(66476007)(8676002)(8936002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZUcU9ON2JPdUM2bjhUdVdQVTF4c1dXenJ5QjB0S29jSTIwdFZ6S3FmOUtl?=
 =?utf-8?B?SC9DOGVQV1RNNjZYMlQxUC9ZdlJEVWx4TFQ3R0RjbUk0OVNKV0JLQ1RkZ1VG?=
 =?utf-8?B?a0JhU09sR3pYanVKWURMMlBKa1Jpc0RaNmpmTjNkdUw1MFZKcDl6aE1MRmtS?=
 =?utf-8?B?QW9odVcwOUFFUmFEMWdDMUR4T3BLYzFTY0hqK01DZUoxZUFQQy8zY0lUdzhC?=
 =?utf-8?B?T0NrdGt0STRaUDNOK3NRTkg5YkFWUWFKRExUNjNQSWY0TkJQek5iM3ljaE9r?=
 =?utf-8?B?RFZhT2Q3bVYvbTAzNStWdDN6K0sxa09TTXBFNzhWTFRBOEhHQkthbUxVaFN5?=
 =?utf-8?B?M2toU3dOREFXQUpndWlEdHBZblJqcmJlME9jYW1XSWY1bXVzQlJ1ZVdIUDVy?=
 =?utf-8?B?TlRCd3g3aDZTTVM5VjFHT1grdTdMUVlUeHhFRGN5eHdsVTVGSmlCWEpIMVhy?=
 =?utf-8?B?WmdHMTJGdC93aUd0VXlLNkpIWjR4SU4weTVHZzdhZnd3L0srUnpVYjI3TFpB?=
 =?utf-8?B?cE9JTUlEeEw5OXlYMytTT0tzSGVKcndzZEVpUEVNTENUaFFrOWZhamJid3E4?=
 =?utf-8?B?VlRrTms2OTRIWWdVQkZIb0hiZTVyMFhwMGFYMGxKUTR3N3BuYmIzWVNnQVpX?=
 =?utf-8?B?K0NrVmp4ZGhZZEhOaTlXZGhrVU9kTEd1TXhZQ0JhVUpTSFlWVXdIUFk1N0xG?=
 =?utf-8?B?VU9DNXhMdko3NlpwMmtyMWt0SFhGWXA3WStkZFNvVlhVbitsV3NGWXY1L2pq?=
 =?utf-8?B?eEEzcjQ3eGcvRVk5Yk9ka3JlY2FRZnR5QnZwRDVwdFJBNEVpL2NWQUpOcE52?=
 =?utf-8?B?YmxoSjE2RUFWNnluem9NN1V3L1F3OERYdSswdHhUeEsvcUZ5K2tmekRFdG5D?=
 =?utf-8?B?dzErSEVMeVJBT1YxeXJTZnl4dThoVlNMMmpxRm8wWjhzSUtVUDVGNFVOcGJN?=
 =?utf-8?B?Z3J3d3dtQlRhVTdwcWZzYWxBam5OaVc2YmhiZk9iR1ZCUlAyZVY1cEJPbWpR?=
 =?utf-8?B?aFU2dXBoYVoyR0hLQ0FhQTVqOFBMMFFnekM1bkk1UTlFWmkyaW00dzRudnBR?=
 =?utf-8?B?OHdZRjVGakZKKzE3SG5kUjNXZElXZ1k1ZFJVN1BaTlkrNVhGbVpJdjJyd2No?=
 =?utf-8?B?ME1YSTBaaDR1YytURlN2NkJqZVp2bmZIaE8vdXl0aXowVTJzTjI4UmxOdlFk?=
 =?utf-8?B?TjlnRkg3YVIyQlMxc3JUQmwwNUpYVTNDL3FxR2thL05UWW9jQ1J6b01MSXdq?=
 =?utf-8?B?eVFhR0NSUXZsZUI5SWZiQUpGcmc0bE1jenhYV0k1TXB6aW1RZHRPS0dPWm9j?=
 =?utf-8?B?RXAvYUlCVUdseTJPUFRPdTAvVUZnRXk0emJiVVVkV2FyZjVmcW1tY2lvNFdl?=
 =?utf-8?B?WUpNR2VpVWl0MWthdGozVGh6Y0F4M09SZlZENk55UGRzaS9INm4zbTlXcTE4?=
 =?utf-8?B?d1NWTjdhWWJ4aUllcVJBb01iNHJNSUc0cUJrbXFiL2hHQ1c0dlVPZjJsN3Zk?=
 =?utf-8?B?bmJwUkpDWlRqUzloUDFmUXNXUUFhM0xnU1FTaElMRlJxYkhMRFF3Snp4eTEv?=
 =?utf-8?B?cUM3TGd1V1d3S0Y1TkFGR2N0KzJrelYvVHozeWp6aW9YNlpvQzNYYmFiOS9p?=
 =?utf-8?B?b3lFSDJpVWRMSndaemwycS9OV2hGcnk1ZDgzSDlCZkpVS0ZrTkoxZGdhcTdJ?=
 =?utf-8?B?VjNhVENLMk05dm9hZlU2Y3ZHQmU1Z1BuVVljSzZxQTZ0eE84MmgvcXVKVUxL?=
 =?utf-8?B?QXlKK21MTjMxQnRwTW9BTHRadzN1cTB6VjNtKy92TUpjS0VPb1hiejQ4RjRi?=
 =?utf-8?B?bUt4b3gyRUNnK2NoV1dnbU5adjF1QkttS1lUTmp2MzFXK20vOUNDMWdMVFFj?=
 =?utf-8?B?czl1d1dJZkVHczFjdmVHYmIrd3BOVFFxd1JmaTlMT1NRL3p5ZUhYOWppamVK?=
 =?utf-8?B?QWZDWTRZQjdSNjZ5VWt0c25uZmtWM0VkV1VsRlhrdkFNREVDcVZBMDZ2YUk5?=
 =?utf-8?B?cjNuRlFYbkNGNFlsam1VUWRjVHB3RVJiTUxNbjdnYVZxVmxCT2V5RjFsTVc2?=
 =?utf-8?B?Snp3VElPQTZpOERXUVFCUE53OG5tNk0rNkIwMGxtZFRTY2ZxdXBtQkNrMHpl?=
 =?utf-8?B?aUF0ZXprRDZTZWZXSnIrOWJOQ0ZiY2xtS0tFUEhvVTlDTXFkblh5dWNOYU42?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?WFNIaWczanVpaEozVG1lT1kra2VlNmM1QjZHYkE0c2llOHVKcEV0ZlNiQ3dY?=
 =?utf-8?B?N0xEWGE3MnN2RUIreEM3VFlVSjdzUWt5SCtjclFrdVNiTFM0L0dTSTZZekNC?=
 =?utf-8?B?T0ZYR2hyV2xXVTF1dVNSWEllQjNOeHJ4Q2t0bnppdG1OWlZwMXZJTzNXcGxU?=
 =?utf-8?B?YlhrK2ljUUVkbTA5SVlCR0s3MWNRYkJFbVhwR2dlbCtsMnZKZ053cHYwOG91?=
 =?utf-8?B?bDduTk1iZVdFY0xwcU9nS2gwZ1NId0RGRElMMm43ZzNuR3JKZGszSGFjK2R6?=
 =?utf-8?B?dHBVaDRWTEJJL202c2xialkzVytZNWJjc3dOcm1uNzV5eFRKaW1JZzFBOHJU?=
 =?utf-8?B?MWRpRGpEbzk0UC94NDdyT1VGdDEyNGMwV2ZSWVRSNmEvUlBnYWtzU2pRQ05a?=
 =?utf-8?B?cXhUQkJZblhRT2VXUGpac09XTmdUNUUwK3B3SDJPNDQ0bUtsOWVqdlYzTld4?=
 =?utf-8?B?MjY1aUNUMlU3Vm1TaXZuZVpZbVJzckhMaGhzYmx4azZaZS8vbkFSTi93RHVS?=
 =?utf-8?B?M0s3RkgzeHFYYkNpVXVTQWZucllxbVRlSHB5cDJNQWlRRUNGdFI4ajZKTk5z?=
 =?utf-8?B?d2o2RXFIbGNxSXNqMHdwRnRkZlljeUN2RExOMEU5Nk5EVGdWSGdWbG1WbmNH?=
 =?utf-8?B?UDJxQ1lEZEw0WUJza1piS2RrRXpiT0tkSDM3b2p2cVdxSEwrb1Jxa3Izc1Rp?=
 =?utf-8?B?VWNtYWtOT0E4WEppRGJBUkRQK1FaYXpTWkRTYjZZcytlN1RJWjdKWUhNeFlB?=
 =?utf-8?B?aVZPWjFDQ2xKQWxTV3Fob3J0ckdWR2syR2R5T1dXRTE4NHRiMWtlZFRlWkNs?=
 =?utf-8?B?dVdQMHlyOVlNVXFxcytRUVdBZm1ZcDJMNTVzc3g3RHZtUGczQ2Y0SitKRkNv?=
 =?utf-8?B?aVp2NWFjb0d3ZGx6WEpTcE9LaXc0UkdrTkZ2MXV3RFl3MkJVSHk3Yy9YSi8z?=
 =?utf-8?B?UDBaTzBVZE5sMEdjbDl2d2lqUVN6bTRJenJLaUFWOXpLNjlqTE9acW9oYW1I?=
 =?utf-8?B?Qnh2SHl2MFFiTTFZNzF0ZklNczlsVkZoRjBDT29jdy8wRHB4ZG5vcEdQK3BO?=
 =?utf-8?B?c3RzMlIvUHF4eCtwTkd4YnlkVVZOYlFESHVJOHZHenRaWmI4MmRZbEF1MEtv?=
 =?utf-8?B?WU9MSkdtRER0SjFvTzY1YVVDdjA1WEZSWjVkZXBFWmVlelB2cERJSmRDUU4v?=
 =?utf-8?B?ZnVYczJXYzAxMlVLT3RqUDg4QzBnZFUraGovN1lxLy9uK3FobmpMOW9TUUFV?=
 =?utf-8?B?TFBqTGJZTHoyQTZnaThZSGo3MU4vUFVkVVV0RlJyZ3RUU1RnbVVqK0JWci85?=
 =?utf-8?B?bFpwS2xPRVNqajNLcEFYWmtINEZzckl1YXBraW8zT2ZJY2JRdnVMQnF6RUtq?=
 =?utf-8?Q?xeFbyZyULzblkLl8zE7NVSA9SqinY6eQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b83e3a7-f384-4ae0-0c29-08db77cac7b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 11:28:22.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kFownup5K/mu5VpMhw58/eeTaeE1HU3uSa8o2dRlGTsptg3rjMIzwUz0vDx1ypUYLrV5/9/5t/G2ZHOAP6zVzkLMkEAE6ZOHwT2JYTE5/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6667

On 28/06/2023 12:08 pm, Roger Pau Monné wrote:
> On Tue, Jun 27, 2023 at 08:56:18AM +0100, Andrew Cooper wrote:
>> Xen uses the stdint types.  Rearrange the types headers to define the
>> compatibility __{u,s}$N types in terms of the stdint types, not the other way
>> around.
>>
>> All all supported compilers on architectures other than x86 support the stdint
> Duplicated "all".

Yeah, already noticed and adjusted.

>
>> diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
>> new file mode 100644
>> index 000000000000..4cf82790f196
>> --- /dev/null
>> +++ b/xen/include/xen/stdint.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __XEN_STDINT_H__
>> +#define __XEN_STDINT_H__
>> +
>> +#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
> I'm possibly confused, but don't you want to use __INT8_TYPE__ if it's
> defined, and hence this should be an ifdef instead of an ifndef?

You're right.  I was too tired while putting this together.

Originally, this was going to be

#ifndef __INT8_TYPE__
#define __INT8_TYPE__ ...
#endif

typedef ...;

but decided to get rid of the intermediate and use a plain if/else. 
I'll fix.

~Andrew

