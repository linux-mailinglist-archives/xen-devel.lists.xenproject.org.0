Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506671622D
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541180.843643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zWu-000169-AY; Tue, 30 May 2023 13:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541180.843643; Tue, 30 May 2023 13:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zWu-00013L-5k; Tue, 30 May 2023 13:36:52 +0000
Received: by outflank-mailman (input) for mailman id 541180;
 Tue, 30 May 2023 13:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3zWs-00013E-30
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:36:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 049f573b-feef-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 15:36:46 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 09:36:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6641.namprd03.prod.outlook.com (2603:10b6:806:1cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 13:36:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 13:36:41 +0000
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
X-Inumbo-ID: 049f573b-feef-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685453806;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=j2ySiuXPSywQRZCLfQ0KLFYGTRq2VSX8MDl5MMnT7xE=;
  b=eOvMxXZ27TjXWMU08qxGOA0mbXc2WaBBEcdFpQk5o0v8g9QqbnlAgAZG
   Hr2xsbiNaYE3fzzq2xOObcaaDmXuJ+1OZcKHthJFfQEQM5naWw5JTDjZf
   1KFnvcey5f9h8qhNjMHJ4z0kCbT1EaIpk168G0mjsWG114i77M4E58Zkt
   E=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 110811061
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Mc5/pa0CDwvQoCSVO/bD5fhwkn2cJEfYwER7XKvMYLTBsI5bp2BVn
 GZJDWyGOauMYGfzcox3Yduw9k8P7ZPcnYRgTgBopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFlPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGE5Br
 MFEBhc2P1OuieC9ya2KELVXr5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv13r+WxHulAer+EpW52eE0w3mrxlcLKxMLelyJn/2k00OxDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSd0rLSfRHaZ97GVhTC/Iy4YKSkFfyBscOcey9zqoYV2iw2VSN9mSfSxloetRW+2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:KS8ZvKpIhqwZ2uYjRfBAxaYaV5v5L9V00zEX/kB9WHVpmszxrb
 HXoB17726QtN91Yh4dcL+7Sc+9qE3nhNpICOUqTNSftUzdyRKVxG8L1/qj/9XPcxeOtNK1/5
 0QPZSXMbXLfBtHZSyT2nj8Lz9Y+qjHzEnKv5a7854Od3AJV0g61XY3Nu/zKCQfL2MqafRZdK
 Zw/vA30wZIO05nFPhTKUN1GNQrzOe7864ODyR2fCLOKWG1/H6VAOmQKWnm4v5naUIz/Z4StU
 zMkwn87qLmm+ij0RnC22KWx4k+oqqq9jPNbPb8xvT9fQ+c9jqAVcBZQLuFsykyoOazrHgXsP
 SkmWZSA+1Dr0rLeGe7uB3s3BSl9g0PxTvN9X+06EGT0fAQYloBer98bEZiA2qpmXYIjZVF+o
 JNwm6DsJJTZCmw4hjV1pzzThlvoEK/vHolloco/jdieLpbUqZYqboV9Fg9KuZIIAvKrLo/GO
 1ZF83E4u1KGGnqJ0zxjy1U2dSpaG44GAyLK3JyzPC94nxthXh8+VETwtcSqHcG6fsGOu5529
 g=
X-Talos-CUID: 9a23:ig+07WMr2XG2IO5DQQZorXNINOceIz7wwnXbKlCJUzpSYejA
X-Talos-MUID: 9a23:1h895AvG1r4r4/mpvM2nhR59aoRM26SVEGMDjLoBifeAKHV9NGLI
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110811061"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=illSC23pHVn2leBo7sZZYWDDo+aVVes5tUWJXEzbDrJsZt32zrdbANo5hiwOthesV8iaQCvfJgHH3XmsLM/u8J9ZjT2CUfXaRoMwoTsOUwC1T4pYdVKoHB5WLdXYOT6xHwFmVFhlye4c6F+dRXM8oJjOTCZghGWzYKoLHoMtpKmpdQ3iKrKCYInBEfBT3Fuhsmj7AZNXrXiJpNldbqJd6XHIeSVZ1EbrtBa8hMR3PNmO9FLj7AmO7MjNbNVV1ymKxQlbgKehyPKrXODkWVwam6GwV5LBy6cyTLldnmQ/s7Cu/8uy5e3b0V7xVOp3iwdcei7lJNBnB9lpBoIHo/+hWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96weyViAV/4YcbOJcV3izndEXIx065gHdjHm5RRyJYM=;
 b=HJ60lqOmnT2dZN+4JtihZ8yP8FdGYmQQQ3jWr/NH1bV0o73ghk1zKRTOV0KpAc3wdtpUH14EteczAQcGPCwfbEt6fqld4d8y3brWIBlgkpQBLfzP+5mUFBCpF8wkt4SurxD4x9t6fQgtuyoIkdyPuCDhHCKUhtK8z2Qj/uIcQ/DNav7UzWukgAIX5oR9HlJadKgXuRjZdAywVgDWkfja6yu7iRPHVudylS0D30SjZT9rw3NsqTwCf94QPkS/XBy1seEQzICTQhRMehYpefpK5IeJONA5ovy4wUnxHK8Q+S6xprp+W/MajKtqYeiDuAy4UthoWrX3n3k9NVDTvQVjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96weyViAV/4YcbOJcV3izndEXIx065gHdjHm5RRyJYM=;
 b=fiBqIxJuqdDd3Pvgq3W3KLxX4I277wpFXijQga/8ibpJTqQ8rBH42VojAPD8IagQaRvgl6QR+QhhU89mlUMWQl7nKMxIvSdOQmA+1xqjAGLi3ESCiaMS0WyUvmM5C/SJD94XI+Mh9PngekqQiNeIczHibbbGo/fWNU5VsG+izbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 15:36:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] vPCI: account for hidden devices
Message-ID: <ZHX746v6VZAehZsg@Air-de-Roger>
References: <e1c6e297-0046-73f6-981d-af776b271f24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c6e297-0046-73f6-981d-af776b271f24@suse.com>
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: da7daae1-8d75-4947-684f-08db6112e676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P6dBW9Gs/1jJZe8zbEjZEDSHvoBwsSWfD8uFDzY69sFu8EGvAlHO5cNBqLHhE1NMIxmSYpk111AGbtsLos3wAk3jnP0bJ4L2282ZbTMEPZ6MFrsM97bfgVsk+U6TURuXm/Ra4gcHJ2YDyrrAWm3Zwt3mFwLWr0jXeamaGTqCc5CAq5hQS+ed9zLtkppn2y+/DWNm4MKwQwxUc0LO8Jxoni0N0WVuyrwkUiiVdUt6MWCnuV22+OQ6gAt70A78K2eXtxiM3Ttat17pQ2/QZDSjTbRg3tUe2sjHHHtOmu2/FuIvgjbSARKmwMJHbLbhToxeyoVorXFLFboQuZiq3n2okNWtQtHYT2Z7/e2v4gHqzCUqWtmIJfC8XXFxKXn98QEkD1CQYndpBeZ5k/Xz219qNFQUHSkTSE0Qk7PDC5g5cIHmsTQenL077f5hekl0vaMU0n/cs+98EJHm2tFea8OUUh+YtD9hG1KMgxTggY9FKycRgfwv1cpxaLoXJp70x06tzgSBKUQmu73PCz2wIK3ajXv4CzLUe7zvAUA9MpugH0Z+RfTa+mfQp+8cCgJFJewn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(85182001)(86362001)(478600001)(54906003)(4326008)(316002)(6916009)(66946007)(66556008)(66476007)(6486002)(6666004)(5660300002)(33716001)(8936002)(8676002)(41300700001)(2906002)(38100700002)(82960400001)(9686003)(6512007)(6506007)(26005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFHRi9LZmtjcmpQbiszQUxOSlZiUUhPSGszY2xnaVIydEdNWHRnTXBlVjFL?=
 =?utf-8?B?VHVKb1RieENjZXdoT3YwdzRCaFBaUm1tbHROYkpBbytmWW42MCt6akJ2amx5?=
 =?utf-8?B?YnF2QXlMZXJ5aDl3N2J6MWZ1QVhZejRZNnNlOUZXWG5VeHVFYzUvUGFvQkNj?=
 =?utf-8?B?NDJUM1MxVnRkc3NMM1VmTDB1ZFcrNEZWN21DVzFuTUpQSjI3blNYRXk3aXYv?=
 =?utf-8?B?MnpzNEU0QjhCTGd0SDcvTzl6QzZxUi9xYVdGa3BONVl2ZGJ5ZHJmSUtYbmQw?=
 =?utf-8?B?Z3dkWmxPNmFicXExYXVhSi9RQlhvWnIxWnlXOUdEb3RnaTIrOHI4a1R0ZHpz?=
 =?utf-8?B?cTRSYUJNODRuMkZyaW02aDE4Ynl0SVFRb3RSWmJSQytPOXlYdTdPVERBOUQy?=
 =?utf-8?B?aDBOTnlrTWZncm4xandCR2hFYlhJOGl0WDRjRFczQnh3TUNCL3B3dUlkekJH?=
 =?utf-8?B?N2dyUlp0Yy9Wb2s2T2p0bzlvV1paRVdUdHlMS1FGSFI2Sy9DdVFLVTJVMVht?=
 =?utf-8?B?cWtxdDE1STFPZkt2VTY0TnlKVm1YYy83OXlFeWdOYnpoZGZsNkpEV0tiUXJM?=
 =?utf-8?B?WVhzVFZ2UDdJeks3SmdYZ3ZvYy9NMGZYWlhraVJhWjFJWFJTc1o0elI4b3BD?=
 =?utf-8?B?TjBBVzE5TWtMcllXMHo3QkhYaTdFaHQyUDhWMmVYb2NvZGRQcldGQ29lN25p?=
 =?utf-8?B?cTdTOVZ3RDRjMkF5UEV4OE9YM0k3R3MwakV5cU1JeE56dXo4aTZiWExkanE2?=
 =?utf-8?B?SUNmeFJIVytDL1E3K0VhMkExdVRGaVNkOGZ6UDlwZTZLMWc4YWFxSnB5R0p5?=
 =?utf-8?B?L2F5akU5akY0UmhBbW5lYVV1QkpFRjFkRmRYL3EwSkkxNGcxMkU0RFZwRWRn?=
 =?utf-8?B?c2grbCsvR0RQRUZObEM1UTZ4R3UrdXhEblBEUkpkVXp6NjFjdEVzMnpqMzdP?=
 =?utf-8?B?L2F6ZU1iV2tKazZKT3lvNFdoVHdQY1paOVJjeEplbFR5OE42aHkwREpPR1JW?=
 =?utf-8?B?azhCNW85VmZmTGs0SElOSm5qN2dOZnBWamt0YXNoZzhadm5VWmV0cVZ4Y1V0?=
 =?utf-8?B?OUpDcU5WNXViQ09ZMmNMeGpuUlljZ2lxT1dyRGc0L25zNC92YkJuN3V0Q3FV?=
 =?utf-8?B?dy9YTTBDTHFJS2E4ZkM1L3U3UE5mUWhwSTQ4dGFIM0RqVUdoZnh5US8wNUlO?=
 =?utf-8?B?U3lBWWNtY3prN2o1WGN2S3M0NzF2MXJMUldXYXAwZWRha0FpNEp0R20vVS95?=
 =?utf-8?B?SnYrbUViZkF6ZzhPQzBsbzRCK2FCWktnQTBjYmlxTGZyMVBETm9yaE1EVDJq?=
 =?utf-8?B?dHdMc0pIVkNGU1d4ZGVLeXExUGFCRldpSFVQaElIMjBoWko5M292Z2dEMS9S?=
 =?utf-8?B?cTZJS3UvUVl0V0hEbVVSY2FDQllCVnlaVy9XU1RKcWx0UjNibFBsTWltQ2F1?=
 =?utf-8?B?NG5Tc0dEQlRpUU5TVi9qREQ2dm1YUFM1TDhBV0dyRWUvM2UvMmtZZWRpU3Vt?=
 =?utf-8?B?NExHRVZlUHd1SGtBODR1K2IyekpFTUxINkRqY3ZlancyVkJ1eTN0MXhzSzBN?=
 =?utf-8?B?dm9YNGVmY016N2VZOWlaK3JkSlhpY2FwZEVaTWlxaTUzOGVVR0JiQmNoZTVK?=
 =?utf-8?B?dm9WVWo5VzdrRGJKVHlQZVlKYWExK1lPMGE5ZjRRSzNjRGgxazQzUGlJQk1y?=
 =?utf-8?B?UWZzMTNSSDNOWmNCTTlud3R6a1NlQmF1RzZLVzFKU1B6K1BROGRFVW1qS2Ry?=
 =?utf-8?B?cThTSmNSV3JCMXhkYlc0YlBGbDJSRUQrUHgzR0FMUzFlcE9UbUgrUjh1NWNM?=
 =?utf-8?B?Z3BBbmN2Uk9zM3gyL0Rmd0xad1ZndnJhRzJwaUVqZnJWb1JXY1ZHWjVnUCto?=
 =?utf-8?B?QkUvSEdLVE5MM2JSTmRIVWEyS0V6Wjk1cS9COVlQSU1hSGcwZTJNTXRPcHlG?=
 =?utf-8?B?My8wUHlaNWFXK3VBS1BrSlk5Zzk1eGJUcWZqWlRRZ1lPR0hsblQ5TlBtYmRm?=
 =?utf-8?B?a1h0Sk9nYys4WUZhR0orZGtRR2UzcmRmQWlBOTJnNG45MjFxWjB4Q09JbHg3?=
 =?utf-8?B?aWxsWUhwRnZtbmtFelRCMkh1QXlKaWt3MzJ0MXpCYW1JcUtWNGRCekhySkZq?=
 =?utf-8?Q?jfXMUDf48UyMEBtItjxJw4IT9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tjv43YnqxP3jSWk/WlRc+OotVSC+wnr1d1ZPs3zQivlbb6zlrtwgPruT826+27FtyFOoquwLH5HNx5mvpBERHS9nbYgRRj05boBbgVQdEKQ8lNgznKj/RibQ/BcTHzwdgG2cV7q+x0JXAqdgSF1wxejod05DIU55Vrt/Km0Rg2vAJKElpl45NwEjoQ98Lpiumf4F73kSRXfIMly/K8j+bNFksJFJyWtHzW0OSofOEw2d79rtzjT0zZBUL8OTzBEPIcJ0nqNBbjnqOEN3nqT91qN3BoChq09wWaxIhDzMRq67k8U9rHPspzIvYbMTmCzPX5kJX1JCPpCkWcATEm6fK0OPLKcJP5hu049q+iGDMGEKVcZ5AjCF/7NAaxqZFpO16Rv7q5ubPYxlPCB2017bs8LPiaRvioqlE6n5dTGuqerNvwTQECDgf2uo8AwF0lo2FmZlR3UQ5u1s8iWd2XYgyKS/oubG1ImkIU99iWKByZkLrDmoOwESd+Xdg0xZhuWsH/Hq/y5x27d1jRZ0Bolp1uBSu2SRO8SCvcizU1ZBE82mVnkWevfFstekitJJcO7kuwj7Z/N3yvYyZ8ZmGHsh8mngq+Q7BOvWLFKJVeKBZfL5G5HwK82rZJfZ+uYkSzg8LvZonDA/JpwWpq0lbozN4wpCB+ajKPkPFxxTY19HYrq2HKUXwgHOWebGsyJVJ4Xidke6sjK8fDR33iuFJpIf46aGQUvE6cajSvETc0M2zfE+AsIj1pyZ3+tfbUdHPz52D7L+QTdvnse07SeiZZdNsj4EvYoDX9APPWsBED3Vgak5cnqFYvw/ZA+G3pi7ns0CFLbTrV6OSr1xlaEmyH8lFQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7daae1-8d75-4947-684f-08db6112e676
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 13:36:40.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCH2mbZC96AziRRky7VKARBFmG5AGgRfVC19L9kF2sgXhRh9vSfRnv7x+La2LxdsTUgipUnybyf6JSX0aGr8GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6641

On Tue, May 30, 2023 at 02:38:56PM +0200, Jan Beulich wrote:
> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> console) are associated with DomXEN, not Dom0. This means that while
> looking for overlapping BARs such devices cannot be found on Dom0's list
> of devices; DomXEN's list also needs to be scanned.
> 
> Suppress vPCI init altogether for r/o devices (which constitute a subset
> of hidden ones).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one nit below.

> ---
> v3: Also consider pdev being DomXEN's in modify_bars(). Also consult
>     DomXEN in vpci_{read,write}(). Move vpci_write()'s check of the r/o
>     map out of mainline code. Re-base over the standalone addition of
>     the loop continuation in modify_bars(), and finally make the code
>     change there well-formed.
> v2: Extend existing comment. Relax assertion. Don't initialize vPCI for
>     r/o devices.
> 
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> +    const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
> @@ -285,58 +286,69 @@ static int modify_bars(const struct pci_
>  
>      /*
>       * Check for overlaps with other BARs. Note that only BARs that are
> -     * currently mapped (enabled) are checked for overlaps.
> +     * currently mapped (enabled) are checked for overlaps. Note also that
> +     * for hwdom we also need to include hidden, i.e. DomXEN's, devices.
>       */
> -    for_each_pdev ( pdev->domain, tmp )
> +    for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain; ; )
>      {
> -        if ( !tmp->vpci )
> -            /*
> -             * For the hardware domain it's possible to have devices assigned
> -             * to it that are not handled by vPCI, either because those are
> -             * read-only devices, or because vPCI setup has failed.
> -             */
> -            continue;
> -
> -        if ( tmp == pdev )
> +        for_each_pdev ( d, tmp )
>          {
> -            /*
> -             * Need to store the device so it's not constified and defer_map
> -             * can modify it in case of error.
> -             */
> -            dev = tmp;
> -            if ( !rom_only )
> +            if ( !tmp->vpci )
>                  /*
> -                 * If memory decoding is toggled avoid checking against the
> -                 * same device, or else all regions will be removed from the
> -                 * memory map in the unmap case.
> +                 * For the hardware domain it's possible to have devices
> +                 * assigned to it that are not handled by vPCI, either because
> +                 * those are read-only devices, or because vPCI setup has
> +                 * failed.
>                   */
>                  continue;
> -        }
>  
> -        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> -        {
> -            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> -            unsigned long start = PFN_DOWN(bar->addr);
> -            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> -
> -            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
> -                 /*
> -                  * If only the ROM enable bit is toggled check against other
> -                  * BARs in the same device for overlaps, but not against the
> -                  * same ROM BAR.
> -                  */
> -                 (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> -                continue;
> +            if ( tmp == pdev )
> +            {
> +                /*
> +                 * Need to store the device so it's not constified and defer_map
> +                 * can modify it in case of error.
> +                 */
> +                dev = tmp;
> +                if ( !rom_only )
> +                    /*
> +                     * If memory decoding is toggled avoid checking against the
> +                     * same device, or else all regions will be removed from the
> +                     * memory map in the unmap case.
> +                     */
> +                    continue;
> +            }
>  
> -            rc = rangeset_remove_range(mem, start, end);
> -            if ( rc )
> +            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>              {
> -                printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> -                       start, end, rc);
> -                rangeset_destroy(mem);
> -                return rc;
> +                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> +                unsigned long start = PFN_DOWN(bar->addr);
> +                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> +
> +                if ( !bar->enabled ||
> +                     !rangeset_overlaps_range(mem, start, end) ||
> +                     /*
> +                      * If only the ROM enable bit is toggled check against
> +                      * other BARs in the same device for overlaps, but not
> +                      * against the same ROM BAR.
> +                      */
> +                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> +                    continue;
> +
> +                rc = rangeset_remove_range(mem, start, end);
> +                if ( rc )
> +                {
> +                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> +                           start, end, rc);
> +                    rangeset_destroy(mem);
> +                    return rc;
> +                }
>              }
>          }
> +
> +        if ( !is_hardware_domain(d) )
> +            break;
> +
> +        d = dom_xen;

Nit: don't you want to do this in the advancement to the next
iteration?

Thanks, Roger.

