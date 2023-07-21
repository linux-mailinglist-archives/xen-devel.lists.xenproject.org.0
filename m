Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BE75C750
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567532.886712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMppj-0004ej-61; Fri, 21 Jul 2023 13:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567532.886712; Fri, 21 Jul 2023 13:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMppj-0004b6-2d; Fri, 21 Jul 2023 13:06:11 +0000
Received: by outflank-mailman (input) for mailman id 567532;
 Fri, 21 Jul 2023 13:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMpph-0004b0-1S
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:06:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 596bc526-27c7-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 15:06:06 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 09:06:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6062.namprd03.prod.outlook.com (2603:10b6:5:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 13:05:59 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 13:05:58 +0000
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
X-Inumbo-ID: 596bc526-27c7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689944766;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dHbDsbMtoJL7+K8YhHWOVA2z5NN2itLxkFUiz01E3Bk=;
  b=QUGquqZUkLGwYlRiCN7coemld+LlrY0gl9Jj5D2Awf66+073Imy5jsjs
   CVoJg1v3BE3/Dvoy1e9AFdmBNtcddLKNPFydoqFfIhdEz8j0kVT28yjJJ
   SUw4x5OyJn6N+j+M3FDVID90NFjVFiASGVmtpJsyHmhak4ruGn1RsI9O/
   M=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 117431435
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rxPXkaB51bthKhVW/+7iw5YqxClBgxIJ4kV8jS/XYbTApGhw0GcEx
 zEfDGvVaaveNGX8e9hyPIrkpk5U65aBy9EyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4v4qCHxSy
 acjLz0ofBCYjqG3+b69Rbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy3w3baTxn6TtIQ6T+KEqvlM33eqyXUSVg9LBVees+emhRvrMz5YA
 wlOksY0loAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVq68rqXtjq0NTIiBGkOfzIfTQAF7t/gp6k+lhvKCN1kFcaIYsbdHDjxx
 3WGqXY4jrBK18oTjfzkpBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:YWbxZqADbVmmKk/lHemP55DYdb4zR+YMi2TDtnoBNCC9F/bzqy
 nAppUmPHPP5wr5cktQ4exoQZPwJ080rKQFm7X5Xo3SPjUO2lHYSL2KtrGSuAEIcheWnoJgPM
 FbAstD4bXLZmSS5vyV3ODXKbYdKA3uytHOuQ6Q9QYVceg7UcxdB0UQMHf/LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3ApYaAjGisoiM42JscI2nn9a/9xzJuamWAxWrMHxS?=
 =?us-ascii?q?DDmtMWr2OQByRwa9inJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/DVCPA3o6ssaWxQRAwPs2ki2hTUjuPuSVEcrzr8?=
 =?us-ascii?q?/tNCFaz4tazu4niqoTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="117431435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIGWdsxX+7cVFJgb7qUW1EtDqy3K1KaQtubdcfXaaw2qkgpURJviF1VDm4M0qsuBxwd/6rq7VZNIYBP5nW9MfTAuofXrOUJuSewXY6fKNwJhBthodIS0edPqorDEWfnmtOixL6cLyTawRbJcTZNDBIxUq/voP3Ot6f5xIC3+rYAPjfYJLR5mCS8AfVxUSsE8Cn6QJLLJZ6WzXZCX2xcS5ua6P7GHeB9GmwJhyyc+ezwRlfDI5RN3aeT8Dz7Zz/RgGsS1louMAMDm/0zEL4u7tp8BKaaZqdznjTrafMLiyCiFWnV/NLbR76b0iA+/AqvQzogsYGc2NnMUqGnTxvEKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7GllXGm02UxznMS/nsqMCo81EILZwbK3P5UuFOnxlQ=;
 b=HmSHkhSi3vz0A29tRi454tADfwu3pRA1pTKmBSvWpo587kqPd4ZLxmmQRks/V0CH16eNinNxcOwyC4pRE5ykm61K+LnFY6PXIb4wWI8Ugvh06j4V9unyK7R5XlEIMCynkCqPPKGdp/pZZ94II+OZCy4jIT0Cj7MzTFS1aJUnvR8cLbtWUcjl+4J94XvjWpL8AKTzJDN9LnZs+SgtFsB3JDeAidWv23csLQw28lZi0aVz+0joPzoDxpEGYVb/rECTrBsDh5qrgrNEyqUALh+eS/xJj1d3wpTwYnXuxRbKtZi7GeHZCoW5VpNpKqtUmVEz3yl5leu3pkk5wBKZb1M5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7GllXGm02UxznMS/nsqMCo81EILZwbK3P5UuFOnxlQ=;
 b=De/PTVryqDqZnyHtMM+l5WB2m/OoRi0fe/1bwItvO3xVy+VD6bDkXdmpbeDR8IYBBI1uay0VXwxYq7A7goLyCGnP4JnyldHNulNwnQwmiiZhcW+5J5EERTl/vKtLAqoCPTpY0Shi/yMoTj/5ouaTXuFn3/XuvqAfQzJ12hlvkF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 15:05:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Message-ID: <ZLqCr_ySq41C5w1i@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d8e829-2adc-4125-f422-08db89eb397f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	19/aJOwFr5dx48s63GMLrmsTeGkCd/+GYNy+ATFYbO8woUypIk6NCFqrgNH2bZJIRrs8G7/Q2TTN0H1jjRYRTXtEpECc9TFwREBGoMoAQfyM15L69/i/VSSVeKMw/HfDDPWb/AzU3DsR+oBfyNx49JYWsaYltP05P22vu/cOodFaI2Xe83LW6R01xCPgvYqO73AQihseI3u+M8sFwtBmdbbQtP0IInmt+4X2GtqF0FnzDBUlBc/VOAiTzVzbhQN3E/XNASevCh6GglfhCu+bejHGRM0SDlvzaGja/NclkHNdJYCjmBQksIvjJHJS8aYamVywobhqIPUkBq4hD4WBe+OvU5Zrg76uy1dt2XTfMlzeM7/YnHM8xVphrpBdZ9/pvSrmKW2vb7OLhngi32mqXjdOV5Hd17r6diWCBhZAN4rkTQwJJnGEEu4741HbzXbYki8qGbuJoa2WArqeNIkJns5z8Vm0a/154l0RjVP5YZDiP2LjfEPU39rz7Jv6h8kkc+yQeLt4PPVPaLD+ssGqjtorcDfegQxzfhDPlhDywZkk947mpvwSUG4cmtfAKkn0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(9686003)(6512007)(82960400001)(38100700002)(83380400001)(6506007)(186003)(26005)(5660300002)(8676002)(41300700001)(8936002)(85182001)(2906002)(6486002)(6666004)(6916009)(66946007)(4326008)(66476007)(66556008)(316002)(54906003)(478600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0cyeUpBcGI2Sjd1NVc2cS9JdWhQN3hKbjR2QUtDOEplY3RudmQ0Y3Zlbitq?=
 =?utf-8?B?MFhZLzE3cE1QM2JPUWxjNE92OXhBOFd6cEhqMjljNWdkUUY2bW1QYzZYelJR?=
 =?utf-8?B?QlJ0NHg5RXAvTXFvbGN0TnZWZFpld2ZCVnNBNkhFL2hqcDZwNXFYbDVET0Jt?=
 =?utf-8?B?TGR0QTFRdVdwdXBKSFZwT2J5RmZaRXAvMHpVdGR6TkV3L05aZzlmWmJDVGxp?=
 =?utf-8?B?STlrZmFZMk9EdC84QllvdXRNbDN1bGJCSmcwTmY4RWwyOExVakJZbHVkS2dX?=
 =?utf-8?B?NnY1NUl3MUxOZGtVbFFpS25FN21PeFZMdFdpUW42VjZIQUpKVjV4RXJiV2xL?=
 =?utf-8?B?eXRuVzFJWjA1SWlBK2IvakxseXZNdHFZS2lZa1orZHAxa3JvbDFhRnRtdXRt?=
 =?utf-8?B?RlkyTzJMRm0yeE56TWNpcmpvaGZha3MrUUt4V091L1Z6UHd2cnduaVVzN0ZR?=
 =?utf-8?B?TkxBdGRiZ3ViUkZ4aGJrMzRnVVlGb1RjV05IUjNJT21DbWlXa2lNUlpFOVpQ?=
 =?utf-8?B?VGM1Y25SNDVhdnlkdGJCMGp3Q3d1WGhCVlFudjd5VEIxNXc4b3NCT2lkeGJh?=
 =?utf-8?B?U2o5aWs3ZGE0QjFzYUh5L1I5VGR3QnBHRk0zUjNlRVJvNjlwc2cyWHREZEFV?=
 =?utf-8?B?ZGhoYXNGanV6dlhvSmpPYzlnYXdrQy8rWnFNcFIzK2VWbnNGQ2dHcFJJSVdU?=
 =?utf-8?B?M1VFRldOMFNWb2FKUW5HQVpSUTF3aGNjeFJBNFJxdGJiaHdYNVFiUEJXWGor?=
 =?utf-8?B?eEliYTBGZDd4SHh2LzU3TFFLWGk0c1lmOEJTQ1o3YUEvbWU3OXh3VVdBZ0dR?=
 =?utf-8?B?UnkvcmxSNDZNNGVyVTA1WEhoOTFUcFZwNDR6TW1Td2FUV1p3Mm95enpaUEkv?=
 =?utf-8?B?NXFXUTFQNG0zMDF3Z2dSQ2hDT0RrSGpEaXprY1V1ZDFNSkpMNWJJV1FJQlZE?=
 =?utf-8?B?Rk1OMGhSaDVJTWt1N3VJY3p1S3F0ZUw4ekVPSDJtQlhJcjlGRHdyaUx6QmVZ?=
 =?utf-8?B?ZWoyMHBNWndKS054MnlNZU5RcW55eTlYRmVkdkZGaGhQVVovRGkvVHBuYXVI?=
 =?utf-8?B?dFdKNzhuaWs3U1pqZGEyUExCUjZUb3FjSEd5K3IwaUUxVzRYL2EzcWM0cWZE?=
 =?utf-8?B?UENqVWtrTTgrWUtUYzg5SUV1bDlGTEp4dm55bHBWL0ZWekRWYUFwTWh3V0tv?=
 =?utf-8?B?c0tDRWxzMFFSTmE0RitiaWxFaE1JUGExVDF5VXEzTFhxNEhLcmtYUlNBNFE0?=
 =?utf-8?B?WDFXb3NqU095Z2ZrZk1PRTBWSkpFakFrci8zMEY5eExNT3hoRlRNMGl1d3dZ?=
 =?utf-8?B?SFpzQ1NLN0tHZEhuM0gzREUyOXFRNkR4ZDgvWUdKMDFJYWprRVU4cnQ1c1hN?=
 =?utf-8?B?WlY2V0lMdkg2aGVVeEwvbVFuWHRoK0NzNVBScUJEN1p2aTlNeWZ4RjU5NVpj?=
 =?utf-8?B?aWl5UmJWVGg5L1RHaTV1ekI2ek5xcmVybS8yTmswTkUxMDk0T2U3K2tZWXFD?=
 =?utf-8?B?UURXUGdMa0h2T1RhYVR5a0lINGNZNUc5Q1UvbjFUQVBhNGJ0QTRTMk53eS9s?=
 =?utf-8?B?RjE4Y3hwNzQ4OHBYWTVETkVSSWUzc2d1MmlxZ0VzNWVxbVNpeHNIdUw0RDAy?=
 =?utf-8?B?QTFPQzJtRXE1emJMNUVRbHl0M1pnMDZpZ2twRG92ZDE2UlRjcFNCMnd6NExo?=
 =?utf-8?B?TERPUGc2ZzVXaFlLY1BVTE15ZEJSSzJVeVpLWDY1SVA1RzBqNnBsWkNKVndH?=
 =?utf-8?B?ZTRoNDB0WXc2RHBYY1VvMFI3WHdmYUpERW45cStKL2h4dWxTSDZscVVkSmJv?=
 =?utf-8?B?bm1aMkUvdHgxRUtnWFRQamFvdndBVU9oRzJRTVQ5TGJsTGc0aGN6S0RvOXU2?=
 =?utf-8?B?TmlUckVLNEVmNnh3YWtJYm5sTUVUYlF3SlJrckFOckdFNDgyOVV1dmNPemlT?=
 =?utf-8?B?cFp1UkNpNEw0UXpqNkMrcjU5S20wQ3duZUQyYjdoOUc3aSsyZkpBenFXdkMr?=
 =?utf-8?B?OThKenNhbjlVWHR5OFF6eXA5VDlWcjl0WTgyaVlkdEpxTWxBdmVSRWd3cktq?=
 =?utf-8?B?cnk3M2xobHdMYmwvUTZjL2xVRGwzWXpXLzVkbFhTR0dEdXFjMmpzNCsyL2Fv?=
 =?utf-8?B?eUZHSkdXcnlPTmdibVhtbW5aZDRvSzVDY1hKbzZGMmdNY0FzTUV6cG1HNjdS?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lghGTnz3JhayHAzk+SmMSlwOeWcvTS2KnS6Louz40sT6Nm9luOBl1IWrGkRP+1wOd+LdQkSVe1xUA8Got6mKO8DXYWO0fPeSXrU4a85YjDptgn5asG8yrXk/KNNqpFpJg8UXeVfE0hTiL49iQEniJgBiWfneHTHr68Wue8oTqJnq14dCqqEi2H6wkK4HTLu1sM6X5NuJAX2U2px/JaExJwuPRUBpDgQtAJpYXeMNr2UPy93RBJjgbjj+mc/P6zf/9yRapHEXxTg7OQw6hbIvgZDGezbhJ6wUns3PJ9aMJWMImzQRH/lj7sKlsNhPdU//Wvn8dc+Yvz43WSehUvil0Hxs10eB/BqTyZK6p3NSCmHe/cKjEar/Af6H/QNyaDYl9HaKYkOkkLxWc8Xb4Ae39G9uE8olACAnUsYg+TJQ6xTN3iybsqryZg/gBGSt4/pPUgNKR3SAghG4HCypb9Zja66Y6+UVL3Tz96RDaQradZP/JeZW1melFMEDjJCfng8uleDfrqgc2tZqUywUZ7yPvaXQLIeTH3JiTfXfU+DIYKWCTotQm2lsNM6JiMLKHvPTNLecYO2qYJ1ZBVOAi1sQk4xNcyg5XknYt9DgpOOFc4y6y6oCoKsWcSeO27+dQo1yP/N3XB1Qksc9nLt5vZCfBM7rvgDBdw5rM9OlSo/ypL+in/JA7+4TTzZ9F4E0dpcad7odg4Clmkyer2K/KTDXrM++4b5/ybbqsnLLQBA1pKR1NubuvbLqb8tvneDm5u9OalkNa4VWiQ1xOc02FTBY3WyZIj0IfWj9HhsTSkY0Amc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d8e829-2adc-4125-f422-08db89eb397f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:05:58.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEqAz7vuc5A6P/S6uSR16+wLFZvuKiSxt0JSOCG2hOjdGogSoKOgJkZrWVwiu8MmaJPM05Ewek8e40B/eEBPEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062

On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the PCI bus driver in the hardware domain.

Who sets that value should be left out of the commit message.  On x86
PCI BARs are positioned by the firmware usually.

> This way hardware domain sees physical BAR values and guest sees
> emulated ones.

This last sentence is kind of confusing, I would maybe write:

"Hardware domain continues getting the BARs identity mapped, while for
domUs the BARs are mapped at the requested guest address without
modifying the BAR address in the device PCI config space."

I'm afraid you are missing changes in modify_bars():  the overlaps for
domU should be checked against the guest address of the BAR, not the
host one.  So you need to adjust the code in modify_bars() to use the
newly introduced guest_reg when checking for overlaps in the domU case
(and when populating the rangesets).

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v5:
> - remove debug print in map_range callback
> - remove "identity" from the debug print
> Since v4:
> - moved start_{gfn|mfn} calculation into map_range
> - pass vpci_bar in the map_data instead of start_{gfn|mfn}
> - s/guest_addr/guest_reg
> Since v3:
> - updated comment (Roger)
> - removed gfn_add(map->start_gfn, rc); which is wrong
> - use v->domain instead of v->vpci.pdev->domain
> - removed odd e.g. in comment
> - s/d%d/%pd in altered code
> - use gdprintk for map/unmap logs
> Since v2:
> - improve readability for data.start_gfn and restructure ?: construct
> Since v1:
>  - s/MSI/MSI-X in comments
> ---
>  xen/drivers/vpci/header.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index eb07fa0bb2..e1a448b674 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -30,6 +30,7 @@
>  
>  struct map_data {
>      struct domain *d;
> +    const struct vpci_bar *bar;
>      bool map;
>  };
>  
> @@ -41,8 +42,21 @@ static int cf_check map_range(
>  
>      for ( ; ; )
>      {
> +        /* Start address of the BAR as seen by the guest. */
> +        gfn_t start_gfn = _gfn(PFN_DOWN(is_hardware_domain(map->d)
> +                                        ? map->bar->addr
> +                                        : map->bar->guest_reg));
> +        /* Physical start address of the BAR. */
> +        mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));
>          unsigned long size = e - s + 1;
>  
> +        /*
> +         * Ranges to be mapped don't always start at the BAR start address, as
> +         * there can be holes or partially consumed ranges. Account for the
> +         * offset of the current address from the BAR start.
> +         */
> +        start_gfn = gfn_add(start_gfn, s - mfn_x(start_mfn));

The rangeset for guests should contain the guest address,
not the physical position of the BAR, so the logic here will be
slightly different (as you will need to adjust the mfn parameter of
{,un}map_mmio_regions() instead).

That's so you can do overlap checking in the guest address space, as
it's where the mappings will be created.

> +
>          /*
>           * ARM TODOs:
>           * - On ARM whether the memory is prefetchable or not should be passed
> @@ -52,8 +66,8 @@ static int cf_check map_range(
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
> +                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -62,8 +76,8 @@ static int cf_check map_range(
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
> +                   "Failed to %smap [%lx, %lx] for %pd: %d\n",
> +                   map->map ? "" : "un", s, e, map->d, rc);

I would also print the gfn -> mfn values if it's no longer an identity
map.

>              break;
>          }
>          ASSERT(rc < size);
> @@ -165,6 +179,7 @@ bool vpci_process_pending(struct vcpu *v)
>              if ( rangeset_is_empty(bar->mem) )
>                  continue;
>  
> +            data.bar = bar;

Please init the .bar field at declaration, like it's done for the rest
of the field.  It doesn't matter if the BAR turns out to be empty
(same below).

Thanks, Roger.

