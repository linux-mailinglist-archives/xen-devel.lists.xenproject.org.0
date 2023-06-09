Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E3729684
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545836.852447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z81-0001UG-Oo; Fri, 09 Jun 2023 10:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545836.852447; Fri, 09 Jun 2023 10:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z81-0001Sb-LD; Fri, 09 Jun 2023 10:13:57 +0000
Received: by outflank-mailman (input) for mailman id 545836;
 Fri, 09 Jun 2023 10:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7Z80-0001ST-1V
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:13:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b73a94-06ae-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 12:13:52 +0200 (CEST)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 06:13:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5391.namprd03.prod.outlook.com (2603:10b6:a03:287::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 10:13:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 10:13:42 +0000
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
X-Inumbo-ID: 54b73a94-06ae-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686305633;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LVO6Ve5cTySLZSAkPlvkrNAtq3RsdHk65R1hUZNp46M=;
  b=WGHK1JiFGGOf4LztCIkYZ67it69I+CVqgpYY3uc2X0XTVh3KF8Iy+1AR
   gM91SfOoLV5au4vTLVKc0+6QcsL3MQMGILRQfILJHyV9fZRGqj65CTyY5
   1Jagu2f+tEczgfkLkYL5JklxtMAhRl6fqF7mo0ebIeSSQ3hboXJZxNOa2
   I=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 110940934
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yLm7IqrYMaTqoNpann96V7cbhydeBmLSZBIvgKrLsJaIsI4StFCzt
 garIBmOOPiLY2H0eN5+bITi90oG7JHWyNBqHQFv/C80H3sT8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzylNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABwvLR6BqOK1/Jy2b9F0q9ogL5jlP5xK7xmMzRmBZRonabbqZv2QoPN9h3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearbIK9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThrq822AzImgT/DjU3UGTn8Lqp1ne9QuoYN
 2sP8BcBkrkLoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnp+QsDi7fyYcK2QPYSsZZQIf5p/op4RbpjDlQ8tnEaW1psboAjy2y
 DePxAAhg50DgMhN0L+0lW0rmBqpr5nNCwIwvQPeWzr/6hsjPNL9IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz0k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:dGyRpKg6O24cU9oRVdD85BpO8nBQXmEji2hC6mlwRA09TyVXra
 GTdZMgpHnJYVcqKRYdcLW7UpVoLkmwyXcY2+Us1PKZLWrbUIXBFvAf0WKg+UycJ8XGntQtqp
 uICpIOduEYb2IbsS+K2njdLz96+qj/zEnAv463pEuFDzsaCZ2IiT0XNu/xKDwSeOApP/QE/b
 Onl7t6jgvlV3QLT9ixQkIIV/LEoLTw5ejbSC9DKR47yRWEyQil4r7iExSew34lIkhy6IZn32
 jZshDzop6uufGjyhPayiv64plMlMH6o+EzdPCku4w6KijMlg3tXohnVrGY1QpF2N2S1A==
X-Talos-CUID: 9a23:Hw8gc2FC2EvLXUi6qmJL1g0aGO8lcUHzwVLoO2KmCmU4Rr6KHAo=
X-Talos-MUID: 9a23:pDgesAtAF1aBTOp0VM2npTRdaJYr8/iXC1k11okhoMO5GhNhAmLI
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="110940934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYD1Dh7YAdiVSNpNT5TfMPNSbKA2r6Lfqz0UQJfxVYIBC2NB6B2lXneD4Cqfv9cq5VTA1ppWQdToFxDCzSyj0CBzDjpuI7ynWXgizaZ4XWKRLaSamOR49mvN5wcRj7UTm7syAayNzMlg5U3K7URzo9HDGLpdUGyi7DXthweeQr8kYsxU8xE9S7+lhtJcqefod/XcMAMCgwIrDq3klrJqGzVtQiBk2Jgenz8Iuj255mnR97Sqxi0SXQMUvY5u/knwq+fMY0CMSiCo03rsrGYjgazlR9wrBmEyoh64CutBAvxOexdpLmUzOjCkUNrhIs9nkcdoDlbrqcVu0drXvOSSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul/fQ4UrBZ+wAke+ySmgGeM8anjZv5AWRY7n6/qNx/0=;
 b=jcAUpwV9ZTJIO5kj7KARHStpBXXDYcDGdqGS3Npd2hcupqWkSJbTWi5NSrMDnRTOT6ArM+tGe4CQgHQvpxZqCvfh36n0EKjMV/dihUhFDvL+t+oDwffm+2rbIPT343XQXR1gaphjDcEkmINi4zQKxFStYJXKkrEQtdQwLOsgrSrq6l7yY2tSML4LsQ7tE5GBXcnNNtMrECUaJ1YyszmkKdXCPIX3nU5hpuMVeCz2aHQgO/CKCi5XyX2cp6dFIJi5kcgHTfmjpy34SqNg97hqpSdGSYuW/4tuIbGPOG0O9w9r0GwXuzgMM/iKIlMscHS6o6/bqFtrR7uowIdZ1F5xPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul/fQ4UrBZ+wAke+ySmgGeM8anjZv5AWRY7n6/qNx/0=;
 b=IaoYGlwNxClymf41oBfzxisryrFsgWVmIPehhMlX+8djKOXPU50kZ3QJM+fF0XlfwMk8KolsLYTd+R97S61hPKVQCwMRElFqGw3xgO+FmJLeTrr+RV6NLY43TC9T6OdEydWKbvMn3PjfG4yCAzJJbiO3pc0zbUa/RYlIKrgGKqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <37ec54d8-02f3-206a-56a2-1af59d19bf82@citrix.com>
Date: Fri, 9 Jun 2023 11:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools: Move MASK_INSR to common-macros.h
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: de5d2dc8-2302-4599-979b-08db68d233a8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HvFtARBfH5Ex+mn2rCEv9SRlXrf/X9tkGVgyYKzAzjwdKN2d7Z1c4U2aFEYEEtvdk8dH+x1rxkzjTV4cfXxon1gbyCM1gq870KbbVr2Gc2VT36Rhnf+PguWbJSyqc9P/rmU6fWcTC+hijgxHIPzS5Bgv9goe5xeQEiDdQx9lgfP8Z9YkofU11DaK1vpwEfXiqZ2NUqkxkeDKqvSr+ZPcKVts4ahipKkKodYID9n5ujtAxMzuByxYXfrPtmjRNDcdCaK51uFpyBsLUh4jBnfBIQ7G8RdItOz5IlAmQoxUVeCA7f9WHHuCjVC/wDhx5a08vwR8xn84OEN4LDwb3I6FZVXCTQsgDHEk5zDIUK2Cg8tGK91jUugCPX50JfYYexv2BMOo+TDuN+jsrDkeO6M0Vy6yOBWFU2rMzf4KsW4n+ZrJpgEJ2tPwezoGWRgSscJU+QH9qbpicy77UEf93mXcb/2Akxnqym7rTssNHoYqaLt7uPqkZsTB5/sdkvbDMlHJucrHxDehDTjCcd2bhRWv/nU3G0mgnb7dNo7/HgwjlZ2zmQw4uiFqfrUcFjupNV6lTSA8JSg4OL/CdMJZHYYDPUN/cElUaQrXFT9fGgqQb4ct3B6Uuw6GKJPWSwVxkMyLxJtGKvkFpSjciur4piVlYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(8936002)(66556008)(66946007)(66476007)(2906002)(8676002)(41300700001)(5660300002)(478600001)(4326008)(6916009)(6666004)(6486002)(31686004)(54906003)(316002)(53546011)(6506007)(26005)(186003)(6512007)(2616005)(82960400001)(83380400001)(36756003)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJlNEJEUTh4RnNZZHBGSzMwTkFHZ1VMZlB0Q1VOa3NVZS9PRnZidHlhRGR2?=
 =?utf-8?B?cGlwa1hzQjRuOTROVjg3NDVqeXFxYWNBTmxXaVRwUGZOWktuWGhXd3pGT2kw?=
 =?utf-8?B?WXV2ZXZ5eFhBbDNydUlWV1QzbThxK1BUWmFTc2x1d094c2hYTEM2ZWJlaXpq?=
 =?utf-8?B?cXB2dDZseDRReFZRaXhqRytjOFdCSVdRY2dycTc1dEdJU2E3RElyQjdQa1B4?=
 =?utf-8?B?RWNaM2YyL01TVjRHOFEyK05uQS9CbVNZYjdjdGFDT3crMnUyVDZkdTd3cmc3?=
 =?utf-8?B?UmJTNXZjdHhtWS8xM1hML1pvMkw0dmRTN0o4amhvTHc0UGErZk5pOUFxWGZy?=
 =?utf-8?B?ZWIrOTl4UHowMG5qUW8yN013QUJQY3ZMVkJ5Uk9YdWZIMjVmUVB5Si8rZW9N?=
 =?utf-8?B?RzVsVVo3bW10QmFRaXh2dmxKL1BYZHVzNmFkbERuRk0wT1hGcVl5cmNvUUQx?=
 =?utf-8?B?UVZxcXZ6TEpqQUJ4VXhwckZudUVIcld2M05OKzErQ0RXaWRWcGpWOEp0a3I4?=
 =?utf-8?B?MEFvT0RMU1VvVHJqSVlNWkY4WW5YbUgzZ2t2c3hXMjlKR3ZPTXI4cFFZRito?=
 =?utf-8?B?akJpcXN2R0plVldJLzRhNHJCZE1mMTd6ZjJsZmt2K0pSamRLZW1vc2FHUzlM?=
 =?utf-8?B?cHdIRjk0V3BNdWJBeFpMeWtuaGJDT3JhLytQWjZWSnU3Uys5OUF6cnlWR0d1?=
 =?utf-8?B?b1FxeWhjMkJBUytkREpBZXRiWUVwaC9HNkVMUWdzSFRUMGtZSEh4UWFCcENF?=
 =?utf-8?B?OTlyaFdDMnBocDJ6ajdjV0MrWlZ1ZThFeVB5MlIvREMxRXQxd2JhVHlIemVC?=
 =?utf-8?B?a1dsOHNPUlVPTDdqZHhmWnozcTVYcGdxMWxYU1pDNUEyRnNGMXNaRXpyR3RN?=
 =?utf-8?B?WGVOWVZ4UU4yRFJ4WE1QMW9FNFJQcElueGRyVTdGakRnNUhsT0lkSFF0NDdu?=
 =?utf-8?B?UkxJcCtRbHdmQ3lGN0NBNXN6czdnekZBRWNlemplZ0Z1OUJ0RXR3c3BJajN2?=
 =?utf-8?B?eExjREZZZTBDQ3JGYUk4dWIvZ0MrYjQ3TFJQelhuNFgweS9uaVhVRG1sRzdJ?=
 =?utf-8?B?dWpkTmhlejlPZHRpWDlJc2M3bGdYdWliRkhtTlZud2U0a3JCTFp6MW9TQS9E?=
 =?utf-8?B?UUVvY0t1NU1ZUUpmWExqWmRDZ2gzUHR1VXhRVzA0RmU3enlwTjhjbktGVk0x?=
 =?utf-8?B?QVB5Uk1MUWRMMU9TU1V2NUFUaCtERTBJYjUza3MwcUsySGZ2TUZJNjd5ZlFt?=
 =?utf-8?B?emxVMXY3aVlPMEdxYXM5TzUvWnptdWEzSGU3V0tWbkRQUWdBdGJHNVFEeUdV?=
 =?utf-8?B?azJNalNySW54cjRpdWp1ZDIwdFM1RTVRc3d2bXNxazBaWUJSMGsyRjNUYTdj?=
 =?utf-8?B?Qk51eEl2MUt6akFzWDAyMDU3aytMemZ6dzJIc2piQjk4Sm90OEFKaVlHRCsv?=
 =?utf-8?B?ZEROU2Q2Z1V6Wmg0Yyt5Q2VFYVhSb3Z4QmtWZTY5WGZialVnUTNBdFJvcjlJ?=
 =?utf-8?B?bUZibzNxSWVrZG1wd3JxNXhpWHpFelc3RVBOaU1EUVZOVXkrUVpjMHlTZHo4?=
 =?utf-8?B?bFBiZ2VidEZGdGxWenFwcTNSWDZUaDJYM1dZMUh0eUxCWUIrbE9aQ0JjRm5G?=
 =?utf-8?B?TmRvVmdmT21La0JYZlEzL0VEUlNockhWZXJLRFA4alBieG55WEpKV1I1ZWxP?=
 =?utf-8?B?ZlVmaE16Y0ZHYzE2Y1hQOWdUWC9MSi9lcFd0blQ5SlQ0TTV1MUlRZm1xT2c0?=
 =?utf-8?B?dUVjN0VnKzkzQ2YyRHVyRGVTOFhWWS9lL1FMb3hKaGM3SlNHTjgyV1NtdDRL?=
 =?utf-8?B?aUhQUUZCdG9yam9GUi9PZnlVZFNGUkRlOG1wbnNrZVBSY1ZpSFVoV2dSQ2Qx?=
 =?utf-8?B?alZsSm1RdXBXSHNzZ0hVekhOSnpnL0pwRlpTZm1TRHRsYzNpQmszV2JmSzA4?=
 =?utf-8?B?NnZQbjEvMzBQUVVLZEExaHZKTTROb1RGZlJrZVVzSDJNQVc0QlFjOVhocm4x?=
 =?utf-8?B?MGF3eXdZTldSKzRoM0t2b0JQb0hHZnpZektnTW9VdDgwNnVGSFlMa1JOWnFZ?=
 =?utf-8?B?VlVUc3R4b3czd1lCVU1sQVY3cEwwaVRZb3diZ2RlOVNyWDJqZk4xMlpITzFQ?=
 =?utf-8?B?WVJJUExFOTJJaThEdk9QNE80cWxnNm9wWkZuNllMSjY1OTZLNUZobTJqNTJp?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1p2yI3uU0tPpZKrMM7Bw5gyxRyUP7xIyqk5ImuVz8aV1N8Kztu/y9eA/lQUBqc31vG3e65M1LnqEVjBXUzVu60zdKdKHmd9PJHy6X9NoJ4klhXqNmFluvtW8ndqnSkwN21B8TvY0HYiusoMHWzl61RU+mn1KUE7dkCjqiSEEvkbEwFTJEYeE/iNqYRo7+/eKeXpkd1rLjM3VOTwklmS2SXfGZOUCO4mpeVnGPPR5kNrNhjw4/603SqYMVgcS1qr3efY1b1FxPt7AQkbPDUgM8alp+kWY7Op+T6KkWkQUbyn11VAzO+eLZPWU0TFQ8AAXlbikrxDotRzouih7sBkCX2fiKJXoLHeO2PRnFeSGUGcG2I05V0E/HrDYmygLhRbCX5ee1fzqbrGMyYPhiXrRPzZImEK1g9mi1vPtjLlIkF6QeZatZiH6m7d3+i0YzzldT9igjnpdiLk0d0NjR88JKk4kDfuXskjbv/Khx58Dond63+e35ICD0Ycq4Mz+CfREzB4OVxomZkM/iFEfInRS2/YzppUJVsatI3EJHUAkT+qVFVZ3cseRAIo01yFCsEoqsBkThDcSw9GGRzifVF0xhXvgRqPs9vIT4fzITRAdJrRm30wua910TOcjZVbT9cLvAGesoFwnrbhFHjOXlw0j1cb6ufEgAOKdA88yt8Zegk/MPJYENNZyb0FR3dmLjQtWjsGGBqg4A9OfD2h208hYt7x+En/X/BjBIUjvbp6NdlPdGBxtjWHJxrJjbHtCqofwSyUzOlpK6qmmFPW7uj3coonVQKVY1O+RqxMH3ST8DHr4Msmkkmr9SLcAGL/ixBS6toJG8QVX61cszW+Rp6IXFw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5d2dc8-2302-4599-979b-08db68d233a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:13:42.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5FdzlDvJvJxAR9ryWQgnMrbsJMOcyk3vyr9jL6c0sXFDpSmg+qDz+nUVY47yyS4QZ/5E8TSVPWn+JU2QjcEjH0cc+YkbEszUrhbGWLiZPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5391

Urgh, well I'm failing at email today.  This is v2.  Everything else in
the patch is as intended.

~Andrew

On 09/06/2023 11:11 am, Andrew Cooper wrote:
> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
>
> Drop the pair from x86-emulate.h which includes common-macros.h.
>
> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Luca Fancellu <luca.fancellu@arm.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>
> v2:
>  * Drop from x86-emulate.h too.
> ---
>  tools/include/xen-tools/common-macros.h | 1 +
>  tools/libs/light/libxl_internal.h       | 2 --
>  tools/tests/x86_emulator/x86-emulate.h  | 3 ---
>  3 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
> index d53b88182560..168691be0e93 100644
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -73,6 +73,7 @@
>  #endif
>  
>  #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> +#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>  
>  #ifndef __must_check
>  #define __must_check __attribute__((__warn_unused_result__))
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index 8aba3e138909..61f4fe1dec55 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -132,8 +132,6 @@
>  
>  #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
>  
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> -
>  #define LIBXL__LOGGING_ENABLED
>  
>  #ifdef LIBXL__LOGGING_ENABLED
> diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
> index de1f82668010..aa1ed75ec890 100644
> --- a/tools/tests/x86_emulator/x86-emulate.h
> +++ b/tools/tests/x86_emulator/x86-emulate.h
> @@ -51,9 +51,6 @@
>  #define DEFINE_PER_CPU(type, var) type per_cpu_##var
>  #define this_cpu(var) per_cpu_##var
>  
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> -
>  #define __init
>  #define __maybe_unused __attribute__((__unused__))
>  


