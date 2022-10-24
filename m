Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9060AF58
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 17:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429229.680115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzdh-0003JE-7L; Mon, 24 Oct 2022 15:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429229.680115; Mon, 24 Oct 2022 15:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzdh-0003Gz-3g; Mon, 24 Oct 2022 15:45:21 +0000
Received: by outflank-mailman (input) for mailman id 429229;
 Mon, 24 Oct 2022 15:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1omzdg-0003Gt-5n
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 15:45:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db25d622-53b2-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 17:45:18 +0200 (CEST)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 11:45:11 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6601.namprd03.prod.outlook.com (2603:10b6:303:128::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 24 Oct
 2022 15:45:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Mon, 24 Oct 2022
 15:45:08 +0000
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
X-Inumbo-ID: db25d622-53b2-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666626318;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Dxe7k6DSxaQxf/PQnS4TwHgZiw34blUqEfl7lJC/Wns=;
  b=D/dl0P/yAWMKh1gLsHtN/o3DZ58A9wJwQgF3L4bcpxXoMxcdUghlwJqb
   CcJlUl6ZyEySTdCStv9fitz1udTeBolCEVIRtZtawvRa+cvNLdB4VGh0Y
   FZnBtu1+UqMb0yfU6pT3EdSLToy0bZkNfVuy8uUamWW/ZYT/4X6AJ286M
   8=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 85914126
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:78oLRqn2xEPkkM/xKkAJ7Cvo5gybJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWWiFMqnYZzP3c9sjaoji9UgG6MSGzYVlHlNlqS5hHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWG1ep
 OE3JzU0XyuIntmnxOy9e9Fsr5F2RCXrFNt3VnBI6xj8Vaxja7aaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqui6Pk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLx17aTxHmlMG4UPJ+iyK9Ro1yX+lEWJ1pGD2KQjKeXskHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBHTVytJWFRHTb8a2bxQ5eIgAQJG4GICUCFA0M5oG8pJlp1k6QCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:uuOq8a5i0Kq9lUBBfQPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.95,209,1661832000"; 
   d="scan'208";a="85914126"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgvJWuMbcfYe4zAeXK0kxnxT3e7A/06l+o2Cf7NVZdzGVquxacf4rALo4knI7l4lq3UubJsUPjmtmzyEjFrRHqBWhIwj2tCXxEuGpftY0UTz3z1I1Zx2ScmW9k+eZxRscLQClfCL1iABUhMguAVVaGXTZrk0eq8uKXc6H7QM8g7jFieWwy3Buone9smAqgvh12HffLRPMdTOPKc8IIVez3P3CAYdNbYld/Fdrh4jNrZXq8d6tsUPK6kVnLQwYNAA/lBJZ0mM0tuhmv7maYOU+CZN0hFQvH6sLlIHZRFQFqqXvgWuaULDh+S3NPcqVCG2eY1+gsbQJ5jNyfjQu9OAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKWsM/xhzADHISPFyavQE8JYWV4KUiN3xi1vW7pAttY=;
 b=Pyk7Xk5qnDEA06XK30YAMr+3NqH0WjHBk3Eky3hFtYR/13so4h6/iIQMPsIpkzGMkE7rb8QuGH2Yia1TEhPX2tmYxbvXhRQaVnaGEAIIwDLMBnFa5xnqNmEVggMsxIiPzqDF+OlWVoqjBxf4CaGT0zCK7vutZPT9xAkqEozddMI7qmekInXivP+7AHk62HltfdKWzd/oeYbhM1KOCTSwIg40F9qbK39/Qy1SOSxfR5q95E6J4iigOttK+5LbcVs0H4YALdFGQWkXKlpunzb7B4DazDtOJbt5fTmy20SZNtZvYymkqooFwmJaGTxvHKvjbChXIP9kFErRAmODEParQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKWsM/xhzADHISPFyavQE8JYWV4KUiN3xi1vW7pAttY=;
 b=ajRht9d3OHOnwlIFw6lmMt4TMEt07VmjVtfQBigawVGA8fWBC4EAAHNevHpmRgVgdeVDB1cyQ4aIsTGYow4MUk4qcY8Dy5i/reG/UVvwPxRNp51mP/PLDH27/oTv1036r91ASZhdcGL6vaOBGhemF8CWXX3Ytaoq/1H1KvjF1FQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 17:45:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.17 5/6] pci: do not disable memory decoding for
 devices
Message-ID: <Y1ay/zIPSpODqsNY@Air-de-Roger>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-6-roger.pau@citrix.com>
 <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
 <Y1aI5Lbi3sysIZVv@Air-de-Roger>
 <730158ce-d168-5dbf-38cc-78cdedcfe33e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <730158ce-d168-5dbf-38cc-78cdedcfe33e@suse.com>
X-ClientProxiedBy: LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 53131d07-92fa-4ef0-859a-08dab5d6ba5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MOSXdw7+jcYycIkNJ+Zx8YrhfUfjJjNLBQGNngcjtMjKlkLOnPZbx4SDvdv+uguYzTDZRfGhqrAWu1/cFJDEvkEhHmTfx9bGtWn1aZo+TlLQ9dcnLYcNasUPubtVm6SSV9KuOGVq0vY1vIxJRHMxrWJ9V+s8qo1k8Doqj1uUKbPT5H/FIZ3UvWciFQ/3BiK+nWYYUbNVRytu13GLrGchUZD3+xAmd00qXs5CxvV1ZqhGogcl4SiEdpSdt9JkDk3Wge5wv30Oyvxg6f0ht2oiYtbHos/6rRatrXttEVsfO7P9YZ3mhe/ds1dku5yPTmLhrWmYv1qb9axntgohvcLVX3biCyGVAmFvrOvIUBtz3iQ4JOEXWHjuHuD0cpJFkF4lqZUBmyymokuOTFoZqW4Dv+GsEUHZsx2uf77WEpWRF05e9iAyM31jOWBzp7h9tLiCd2rHizXVsFKciBiSV6dd7jIiI9hb5wRdVcupRIjVsaf/nDuCBLzTPxjYG4+UaSASR0m77lCXSf4D01+FRWLl5FQnKFL60OMQ/93nDboHA69mB3p1JkYQF+I0RsmeIVSZKM97Nx3/zFZs1fvY2xt7yr8Y0fYaouSPJo/Ju4u2sEARCS0z4cItvebqbjw2qI7fwo8Yft+BVxSLX/Ar5vfWDAXbnXmkuGL9dQFilBv2uQs+zBqnLVCHih0/Go0+6ucbPvpPZq+mr4iBCiZSfPHk+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(6486002)(186003)(2906002)(66899015)(478600001)(26005)(5660300002)(9686003)(66946007)(86362001)(316002)(6916009)(6506007)(33716001)(41300700001)(85182001)(4326008)(8676002)(66556008)(66476007)(53546011)(38100700002)(6666004)(6512007)(8936002)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlFuWkxvT3BiN08wT1BXeTdQRlZFTDhxd2JFc004M0c4QkpKUUZiSkdXK0h1?=
 =?utf-8?B?Z3B5MWlyQll3UTY2SUh1eEE4aEIwRGp2M0R0MjFWMVpiWkM3OHlXNC9UbXpt?=
 =?utf-8?B?NGk4dFI5MytLVWNaSnNDb0VtVS93TlZTd08zTHRDVlA2cWdCK1pIQ2hSVTBn?=
 =?utf-8?B?a2VaS0lmSUhiWXN6dWwrRFc2TGd4Q0JiSzNIdTFJRnFRR0V6cDgzZFpLeWFN?=
 =?utf-8?B?T3ZWRTBMVkU3UjkxVTNYdWh1Vy9CbzVpWEtEUU1RV000UTNNOW02K3R5aXhs?=
 =?utf-8?B?UWp5SkdOd2tZcks4WjBJT1Nyb0NGdVdwZVdob3VOSUNYMXhjNFNsRzB3Tkx5?=
 =?utf-8?B?cG1jSlN0My9iM0x5Z2pza0REUUE0WDZEcno1RzA5TlVIbFZTa2hCRWZieUdX?=
 =?utf-8?B?Nmhod200VnBKbFF3WlNOR1BRNk9vSnVJaFlhUXJwb2c2dkZFZ3BUNEF4OVlF?=
 =?utf-8?B?MlN0VVV2QmZhUzZTS05WbmRRVlgyQUtvZlMxV3l5cUZDbllJNWJJQjMvTXI1?=
 =?utf-8?B?M3MxOVJ4Y3EyZEQrZ2pINkplNlF2RGdtSGJ6TmJXMTVDYWppWk1KSGxxRlJu?=
 =?utf-8?B?eEZFazJBR3J4L3AzUnpGMkpCYUpwVFFoZE5hT01MTlBtNGMxeEFVcVNxTnZ0?=
 =?utf-8?B?K2xWcndHeCtiVzRyUUZGSTV0K25jL2ZCSWZqcWs3MC84c2x2ZHBNSGJ0ZkxB?=
 =?utf-8?B?dkE0VzZJUUNXYXFXNTJCNmFUenArM0Y4djY3WWk0R3NmdTNIWWdzdk9FMmFn?=
 =?utf-8?B?VHUxK1NZcTVCWWdqYU81SGhialB0NmdqNkxPemdVM0ZieXpjUlBEVG1kZm92?=
 =?utf-8?B?SEg0SFcvZTNpR1lieDNxNWw1eE15VjVPQm4wT2Vta2ZxZGpSMW9OUFNvRGJC?=
 =?utf-8?B?NlE2MlVyNGgrUU51WnFrcXo1OUgzazIyeWJhcEc5OWR6ZTJZa2czckc4aURX?=
 =?utf-8?B?ZDNYeG5zZUd4Ymt5OG5LVXBDY1N0L3BTUkRkV2xlOW1scXlnMkZoK2gzaXdM?=
 =?utf-8?B?b0lsVHk0aUhJRXlnK3Y4UkVwd0hPanNqN0dRcDlxTHdTZ3hhZjg2THZ6aTl5?=
 =?utf-8?B?d0pUNVNzZTRjUytBTFc1MzNyNElCek03UGJSNXg3cjRsMUZDaCtMa01EQmlw?=
 =?utf-8?B?cE1rOVRCV2RBT1lBdlZxWFh6ZzNFanRyYVBvby9MWHBmT0lyT09QMHA1TzFz?=
 =?utf-8?B?MEpSNHVSelluUTFnTXNlQmQ1NjFDOWswWCtCdUQrVmg1OVZMOWJZVU16M3li?=
 =?utf-8?B?R0tXY1p1UU9BQ2VnZnIzRmNmdVNCNE51ZEVWNGh3SGdHRlZoaEN5VDJYUnll?=
 =?utf-8?B?UWxRUEJNVEtBaGNRb3ArdWNoTUZ3dUxqeFE3N1ZyNDZyc1kwaTlWT2Noa3Fu?=
 =?utf-8?B?VXJBWDJldXB0b2o2eWpUbndPRHNZRHp1cm5SeEowcVgyS0poLzNhUThmYVZl?=
 =?utf-8?B?VjU4TUpMM1liN3hWQkRkK2pMUlBSTTFwSUd2Tjk1Q1hpOC90OXFqTWdwMnRT?=
 =?utf-8?B?WC9BOFZxK0dkRFhjaU1ITG9zNllzaVN0dUtZaGd3TldXZnVtdjR2a1Y5WVkx?=
 =?utf-8?B?L1hlVUU0SFRqQzZ6eFh3bGw5ZnZPR2d6RGRZblFpeU1pcEFvUEpSRXVKVXQx?=
 =?utf-8?B?WnQwa1hBQ3ZNZHk0YTcyNXZNM3M4LzhMWHByM1pndFMvNnFDQ0FkTUppQVdX?=
 =?utf-8?B?V05zLzR6YVVvRy9IZGFtRm9JelZWNW9KWEk5N2ZZMUQrUFl1R05RKzlsUVNk?=
 =?utf-8?B?OUVtck5NUldIUXlqa3Z3YXFvc1N3UDI1bzJBelE2OEtYWjNoZURnUUw0Rkxr?=
 =?utf-8?B?RVlvNnhHYUNkSUJxMmU2c3RkaXc3T3pBUzZBenB2MVhlcnZ5d0dZU0tOK0RK?=
 =?utf-8?B?QVA3RlBHNkNWWUMrWGQxaHJHRi9zZmx1a01iUDZodG91UWxOcGVxQ2l4SGxI?=
 =?utf-8?B?V1Erb0tmVU95MzZEV0xnME13aG5WQ3ZScnhUMHk2Z0ZnSml2NitTZEErVm5W?=
 =?utf-8?B?Qjl4ZjNoL3JoREEyT0ZNc0RFMlo1dkRFZVlPaDNnMUNzWUc4OTl4TGJmbmli?=
 =?utf-8?B?bUxabEc1K3FuYWlTMFp4Z0YzeVNxNCt5bTdtbnR6YUlmTG8wNWpVaStYbVBv?=
 =?utf-8?Q?i65C44UfwZwq7k+BjehcfSWcC?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53131d07-92fa-4ef0-859a-08dab5d6ba5d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 15:45:08.2697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCEaZ794rktq4Rfn/mrxMEBQlJmtdp6JbVms/OFElvim5/i7OvnSWyL1AaaXqISCS/IbFXG+DCFfvyKSMA92cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6601

On Mon, Oct 24, 2022 at 03:59:18PM +0200, Jan Beulich wrote:
> On 24.10.2022 14:45, Roger Pau Monné wrote:
> > On Mon, Oct 24, 2022 at 01:19:22PM +0200, Jan Beulich wrote:
> >> On 20.10.2022 11:46, Roger Pau Monne wrote:
> >>> Commit 75cc460a1b added checks to ensure the position of the BARs from
> >>> PCI devices don't overlap with regions defined on the memory map.
> >>> When there's a collision memory decoding is left disabled for the
> >>> device, assuming that dom0 will reposition the BAR if necessary and
> >>> enable memory decoding.
> >>>
> >>> While this would be the case for devices being used by dom0, devices
> >>> being used by the firmware itself that have no driver would usually be
> >>> left with memory decoding disabled by dom0 if that's the state dom0
> >>> found them in, and thus firmware trying to make use of them will not
> >>> function correctly.
> >>>
> >>> The initial intent of 75cc460a1b was to prevent vPCI from creating
> >>> MMIO mappings on the dom0 p2m over regions that would otherwise
> >>> already have mappings established.  It's my view now that we likely
> >>> went too far with 75cc460a1b, and Xen disabling memory decoding of
> >>> devices (as buggy as they might be) is harmful, and reduces the set of
> >>> hardware on which Xen works.
> >>>
> >>> This commits reverts most of 75cc460a1b, and instead adds checks to
> >>> vPCI in order to prevent misplaced BARs from being added to the
> >>> hardware domain p2m.
> >>
> >> Which makes me wonder: How do things work then? Dom0 then still can't
> >> access the BAR address range, can it?
> > 
> > It does allow access on some situations where the previous arrangement
> > didn't work because it wholesale disabled memory decoding for the
> > device.
> > 
> > So if it's only one BAR that's misplaced the rest will still get added
> > to the dom0 p2m and be accessible, because memory decoding won't be
> > turned off for the device.
> 
> Right - without a per-BAR disable there can only be all or nothing. In
> the end if things work with this adjustment, the problem BAR cannot
> really be in use aiui. I wonder what you would propose we do if on
> another system such a BAR is actually in use.

dom0 would have to change the position of the BAR to a suitable place
and then use it.  Linux dom0 does already reposition bogus BARs of
devices.

> >> Plus with this adjustment, is
> >> ...
> >>
> >>>  Signaling on whether BARs are mapped is tracked
> >>> in the vpci structure, so that misplaced BARs are not mapped, and thus
> >>> Xen won't attempt to unmap them when memory decoding is disabled.
> >>>
> >>> This restores the behavior of Xen for PV dom0 to the state it was
> >>> previous to 75cc460a1b, while also introducing a more contained fix
> >>> for the vPCI BAR mapping issues.
> >>
> >> ... this (in particular "restores the behavior") a valid description
> >> of this change?
> > 
> > Yes, it restores the previous behavior for PV dom0, as memory decoding
> > is no longer turned off for any devices regardless of where the BARs
> > are positioned.
> 
> It restores one aspect of behavior but then puts in place another
> restriction.

I assume the other restriction is about moving the check to vPCI code
rather than disabling memory decoding?

It restores the behavior for PV dom0, and keeps a more 'contained' fix
for PVH dom0.

> 
> >>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> AT Citrix we have a system with a device with the following BARs:
> >>>
> >>> BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
> >>> BAR [0, 0x1fff] -> not positioned, outside host bridge window
> >>>
> >>> And memory decoding enabled by the firmware.  With the current code
> >>> (or any of the previous fix proposals), Xen would still disable memory
> >>> decoding for the device, and the system will freeze when attempting to
> >>> set EFI vars.
> >>
> >> Isn't the latter (BAR at address 0) yet another problem?
> > 
> > It's a BAR that hasn't been positioned by the firmware AFAICT.  Which
> > is a bug in the firmware but shouldn't prevent Xen from booting.
> > 
> > In the above system address 0 is outside of the PCI host bridge
> > window, so even if we mapped the BAR and memory decoding for the
> > device was enabled accessing such BAR wouldn't work.
> 
> It's mere luck I would say that in this case the BAR is outside the
> bridge's window. What if this was a device integrated in the root
> complex?

I would expect dom0 to reposition the BAR, but doesn't a root complex
also have a set of windows in decodes accesses from (as listed in ACPI
_CRS method for the device), and hence still need BARs to be
positioned at certain ranges in order to be accessible?

> >> I have to admit
> >> that I'm uncertain in how far it is a good idea to try to make Xen look
> >> to work on such a system ...
> > 
> > PV dom0 works on a system like the above prior to c/s 75cc460a1b, so I
> > would consider 75cc460a1b to be a regression for PV dom0 setups.
> 
> Agreed, in a way it is a regression. In another way it is deliberate
> behavior to not accept bogus configurations. The difficulty is to
> find a reasonable balance between allowing Xen to work in such cases
> and guarding Xen from suffering follow-on issues resulting from such
> misconfiguration. After all if this system later was impacted by the
> bad BAR(s), connecting the misbehavior to the root cause might end
> up quite a bit more difficult.

IMO we should strive to boot (almost?) everywhere Linux (or your
chosen dom0 OS) also boots, since that's what users expect.

I would assume if the system was impacted by the bad BARs, it would
also affect the dom0 OS when booting natively on such platform.

What we do right now with memory decoding already leads to a very
difficult to diagnose issue, as on the above example calling an UEFI
runtime method completely freezes the box (no debug keys, no watchdog
worked).

So I think leaving the system PCI devices as-is and letting dom0 deal
with the conflicts is likely a better option than playing with the
memory decoding bits.

Thanks, Roger.

