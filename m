Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D06729646
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545802.852387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z1B-0005cQ-Hf; Fri, 09 Jun 2023 10:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545802.852387; Fri, 09 Jun 2023 10:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z1B-0005Zb-Ek; Fri, 09 Jun 2023 10:06:53 +0000
Received: by outflank-mailman (input) for mailman id 545802;
 Fri, 09 Jun 2023 10:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7Z1A-0005ZV-IB
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:06:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 594dfee1-06ad-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 12:06:50 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 06:06:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5626.namprd03.prod.outlook.com (2603:10b6:806:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 10:06:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 10:06:31 +0000
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
X-Inumbo-ID: 594dfee1-06ad-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686305210;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dLcG8+ZWyKDayaENU0K8aXfwa/sJQK+nCUqVyTvyMx8=;
  b=hY7IQSqajP02ICRb2UWh3jO9EhlhdH7zu5ovXSYTzk6EPNQaTJyT4JdY
   OnjsdkhYj2YJMPmi0vo0a4iP1J5aEunkdk5lPwLSTdviRDfj8Ief37j3Y
   lhc5k5KM2p6JsDAHTYFEy10p4xhQ8FE+wEUtfSIsjDhCEEk2XLzAlLRkJ
   Y=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 114708386
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pLX6tqn6hfZUOxV10iSNwT3o5gy1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWmuCPv2JNmPxf94lb4u390xXv5XWz9NiTws/qHszFyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5A+GzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dETLQEJUEG5u6Xs0p7qR7JUicEKE8a+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieezWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeHnrq4x0AP7Kmo7VA1Gexyek/2DiEu4d+MHD
 kgVpQ8Wov1nnKCsZpynN/Gim1agoxUVHfRZFeY37AWQ4qPO5kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaOycPKnQZTTQZVgZD6N7myLzflTrKR9dnVaWy19v8HGipx
 yjQ9XdgwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:1WMM46ilrEReI/B7pqCQQkmR+3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AHhvZZGqoVCmkKf9n4SUyNWzmUe0ud0zZ8ibqHwj?=
 =?us-ascii?q?iG0o4ReatRlq5x6wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AZrwtwA9N9sA9oYq35mFO7CuQf5t4s4rpLXIJq5c?=
 =?us-ascii?q?DveW1bQl0Omi4tDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="114708386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jwlq9jY4Urt+GmMpvHddZ777JOv5G6biVmURn1p/piEcASMd125xaXzsNO4uv4bSjqnBVwB+krvh1GPcjE3UNVJXlYvJ3x0ZIu+Ar4Hae+hjc/EuSQrOzrxFD6Y9I3YBm/Kd7g2CwSs8nuHAoU3zKHOt1vVbc5tJgx6e/gvHjuyLWQZEOdOft5q1HiL7pSiEI+ag5tI3m+hjF7YAK5nJOC4PUGx1aO71IWltcNh3Zcld/DfYsyKVcq5Rk2KIwtefqGlsCY2vzhhoHwfLYLDFbJuT6VGb6LaK5ttDfzGkA+Bu7K8u8YcAWAimmiuVPHDlnwgiP42i9fUyUDTcqdwsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3oIEoC83UskXLNO9RkeGsekOzRadA5EOva+PTLNrb4=;
 b=cMZd4d5fxQL1mXPPIi9e6lCoHxEdvtogbwiTrtqUYkP/PqeB7PE8geI9Apl0QkTleO+TTvOo9a4HH3VzckMWbxvAyGFtY3loyrxI2hLKL93SKNLJxE/cywwL9IO4x9EmAR4jWDJJ+xy72NqCiO6PecJvNtFKQ+nAna4WrPjl3O0BXTRR1T0kkbk3erazRQSCTVjjMD+a+FaQ3j4ATYk3YvqaE7n7yGXBGjXxxoRPZSINYbX7AlQ14IIBDfosT9FEQll+DVj4mkIqo/WS1cNiV98EIb/rKecbQ7B7LLZ1R2QEzO6qHVzAh7ma6rbd5VPLvZf0HwEFVjM2p8AMPGYjrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3oIEoC83UskXLNO9RkeGsekOzRadA5EOva+PTLNrb4=;
 b=w/VYvHDk0CfqD+V+bW7y/gW5oaGZHlGOc9z6pwwFlQDtLiRcoUs/d0fUFNrbtB5GrVpKwqVB8TNcTxPJl0GyEhRtOBp0ftWYn3w9bh0xwc3M6G4VLwwlN/4BqPoYyKgbgrajDC1X9LL0ly2WoqIi6tNJMNRMb1vJeZeaxgySnzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8c69d867-0c71-a6b2-39b7-30e82a71f97a@citrix.com>
Date: Fri, 9 Jun 2023 11:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
 <9BAB3408-676E-4801-BCE1-4DB7BE081ADB@arm.com>
In-Reply-To: <9BAB3408-676E-4801-BCE1-4DB7BE081ADB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0620.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: e11efc05-1da6-4fae-b8ec-08db68d132ad
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bI8BV87IfgCxBHO6GLMhZjwsmSXU8NFyM1QA22APDmyLoubB+06LsXIuz4NOQfYNrJ9OdZbAYcp5W7HJP7CspqpEDyWKH80KLrCftoyYT/1K+M7Oum4WzfpLySOb5FbLBBrNxes+uCq1ULMFxYrQgo9y/sFhyACy/9CwSQzde4rv+kKN6cRaKkKqESKouXJ0oFhhoLeUuJzyoctn53wYDRVMEIpNmE6C+gHFpNYN4bnGmXzWE63GOFBT9vJ8Q7RKANV2FnCuMrRAMyP+LOBGoCZ6lgTwzXLmF3QzkClqKEf0oFYgsNYD+N87T4MZ2PRUJoWnbwlfN5UmpNvi5BSIpfqpI295fSeK4Q8Op7bLTNCcMR6OUHq5mcnO5rZBTgDUTwALPfh2cUdnBMUAnXSf8HGHxIf0SnOSvL3AsDnoZ9yV5Mr8Fh3Y44dLqIyBybXXlzhOMGnoxhaNxdZfPHjKE9KF7Woy3/k109qNCVq2uDf4R1fjtt4HQDrl1IagigwfwOpaMvgKJnJ60QvrjYRrT5miiv9W1XO7R0BOoJ5+78CjuSm2wi/O+CLsYFo846YOxpXKJGRUiVM8BXDM6j+iJWVQgKKHeWAGAe/1bQ816iCfZk7WnPjGVKjiBtAvSv89iFkhAgj1aAiozCcCAHbsRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(54906003)(86362001)(2616005)(31696002)(53546011)(26005)(6512007)(6486002)(36756003)(6666004)(478600001)(186003)(2906002)(6506007)(38100700002)(66946007)(4326008)(31686004)(6916009)(66476007)(8936002)(5660300002)(8676002)(66556008)(82960400001)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDF4N3dCcVRYYk5vV2duQjNob09rUHJTT2JqY2xUaFJ3amxpaGtTY3FkaXhI?=
 =?utf-8?B?enROdDJFd2VYOWN4eElNanRqWkRBWjUvSlhFdDRqeG11S21maTFseitwWlZk?=
 =?utf-8?B?NnFla2h5QUl0ZVpYZHB3TW9YeW9idS9ETllXSERhdlh1b2VES0d3ajJHYnpR?=
 =?utf-8?B?b1VmRzRONTlTSjVkZ2NsMHE4WDZhWGIxbnYrODJDVXdRdUhKN3BUQVpyRWc3?=
 =?utf-8?B?K0dhRWZ0dWQzN041RGlYQXNLM0hjSFovdG9FZFpOa3dTc2pFRHBPd2FtcjRi?=
 =?utf-8?B?eW1VRkpacDdqUGxTZEJWMWphZkZVd2dyc2xTMGo5RmdNZUVlSit5Ty9GVXVq?=
 =?utf-8?B?eFUyRmJmZFFYUVNOa1g5aW9pcDhkWmUzdE1JRksvTDdWOFBxamdhbnh5YXQx?=
 =?utf-8?B?TUg5ZDlsNHJONy9qeVA5bkNqZ2dJNXFMdVAyZ3AwSHpML2I2dTB0SExwZ2hr?=
 =?utf-8?B?QUQ4RnJoaUNJaU9uTm1qN3Z2WU5neU8xVHZXZjVGV1N3OEUwalo5WDdZeFBx?=
 =?utf-8?B?TW9qMUdocm8zT1pIOGdlYXZuYkdveTU2cFJXaHlvNjFxQTJRTUtyYll4ZzZy?=
 =?utf-8?B?aFpGR2llejFPRGtCM3BhdjJnY25Mc1pZenZxbWJmODM3d3VCVXp5ZUMrd1Zm?=
 =?utf-8?B?cVNRUWc2Zzk2MURUNGFLWnlNRmdaUXh5cmJFNlBQR09LNzQ1T2FFRlZFeFVy?=
 =?utf-8?B?WHJ4em1TQ2QwekhEYm1NeEJTdUNhSHc0SUFVWFVBTEYwbGFMUE11OUpIa3RD?=
 =?utf-8?B?VGd0QzhvR01MVlJibzNFdDZKMVdOZ3BsZHYvQ1FQd0ZUNU90QjFNVmROdFZy?=
 =?utf-8?B?OE9lTHJkaE1sTy9hZURKZVRXTS82aGN0QzRjMDV5cEdMWkc4WS9ZUm8yekxF?=
 =?utf-8?B?NHpwZitKa1AzVVA1U0JqNStqYTJFMzBLUEFNQUJidmRuOGJDTHBUY1JXL2pE?=
 =?utf-8?B?U0FGWHh3YVlKQVIyVlo2Z2F4Rzl2Z2xMVEJ2b0F3N0RrT0puUXVUekZ0WXg1?=
 =?utf-8?B?RTM4NEZQT3YvamRuemxmM0EvakRBVXovMlVoUjFCUWhGSWoxRW1VemhHN3dk?=
 =?utf-8?B?bmZqZHpDRG56eDcwdllrbWVaWmRWOVR2NUNuNFBJMUxTSm91UDFBeU16L2J1?=
 =?utf-8?B?Tk9aNFVsZHJHSno0UjBXQ3RhTmVpam0yc3JMMXQ1MEhoY1o1TnB2dERpYmJW?=
 =?utf-8?B?SkZvcytpQ3lFeDhMU3FXTHhDdXdPM1QxelhjYkV5aXlLdkNFRGpwbVBnL2hx?=
 =?utf-8?B?a0lnbkllN3NFZVZpRUlRTnE0aWlXSzAxOGtyZWIweWFDOFFuUWZvQXZ2Zkpp?=
 =?utf-8?B?NCtzSmROM0pYelBUSnBOeEFyV2dNVFNhQzBpMGVBUFZ5RGRsdnFZRHAzeENY?=
 =?utf-8?B?aWVhZTE5Z0N2aEdNeCtsUXNldDVWdGtLalpKN0hwVU1xUDZxamlJZzNPcU5M?=
 =?utf-8?B?TWkxTTVsdzdrNGNBcWJvWnRJZHN2QWJtcjRCa0dZNTBPSUdrRlpsUGRSZzFI?=
 =?utf-8?B?MWZzVTFhZVphMG5aWGpFN0ZwWVlNaVgxaE5zeFhCb0VSK09SU2FQTXpsWitL?=
 =?utf-8?B?cHhKcmM0QWVCZzhobmwyUm5XRTkrYW9kRWM3cDB6dVFlNnpnN0RTa3VGZlJX?=
 =?utf-8?B?MFNBc0lreElJTkFkWGpac1hyRytVRkk1eDVHWlZCY0dMc1Z5YjN1R2VRTzZo?=
 =?utf-8?B?MFhMeUtmMGt3ZmJqWnhINkx0L0FGOVZVOXU3WVZXL0h6UkNiNmNaa2Jpck5N?=
 =?utf-8?B?azN2SmY4eVR4NWVPQkZTSGFFMTlHWTZyQUdYZjZQQlc2bklhUFRJaldwSWk0?=
 =?utf-8?B?bjhoTlZEZ0RITkxHbWV1NC9FQ0U1S0NKbUtMWFNvYnYvT1Ywd2dRTXkrSXZx?=
 =?utf-8?B?WVVkRy8valI5aTZhbnBJbUxIUnJOK0FnVUZnV1FYOFNhZVFvd1JBWkRoOTZx?=
 =?utf-8?B?dzYxSC81TGYwMlQwQU9QNElzM3lLOE9Wc1FBenExdCtNM3o5YTBueDExNEJW?=
 =?utf-8?B?RXhBeW5sYldXWkFNN2NaMXV0VmlQaXhwa25yamgvVEU2cUVUYW1LTjhQWVJx?=
 =?utf-8?B?SmhvcFQ1aE1LdDFxeXRXOFNad3FlSVdVNDZ6aWhwUkFJcWwxcXU5M1RyVzdQ?=
 =?utf-8?B?cVRvYkx2Z1NzMi9MK09ySGpESytJSVhkVGtiRlRRZ3hsVEVraE1tcm00Z1Fi?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EeKN5gL2/EOavRDWCsxunWsxxo/9GFxX7WV4FYQM8w9CL3TK/D6SdYgxyNsclIwSSmaiWBiBnitlxgBdoW+nxPutUN8gkO7Tu95fuzA5fqf7dflBi8GvNoYm3AjPz8OdrRwfByeskkNJrD5/I9AKHpKUuobWQkE+pYgXUer2Oki5J7vr2ilXv3tinAWz4gI+Jv2AFpkX4WNZRLD+vh8299BK7dYxHsGz7Q8bpzs3zPcsnyxrWz+ZTQfOxKqR2DptX8pWFLmTRsc3QfgCbpwmjgH0W6PU+b27+2jUo9tNEYbnYCW10wCDqbqVM56JasLcYgQ0noSO8geqy32vGnZTFN37Iu4WV7QvV1WN4rGaBfykCI6LxHeZzY7wG7sB0HKaxgZrmy5axJqwv/565lEVtNauYO4wmemnOAVA+uLaGWpFAC4M0eotml5FerVDjOpzvG5O8aq+IL0i0Wy4mzvDDF8CFKpgYVnz6GkdrxcTKFZQGgZDL1BLQKuuwvB9zXeZ/i8c3/wD/qeftvEPKk3Sj5Ha0NXNqwW2F/TFmCkVDQpo36Ce04BOx7pKORzYF0imdwOZaq9jSl7GhHAuRb+Qm5I8XQMJzXNoBJHdpNm+wNPXLwYk+JgeohX/tZXjroaFmT9cWANJ+uM3jDkYLnOslPMmg5T0MnDIfygDnU8cq3aJMAeFMnWBgwjC6jxJi78elUX2hwejPWj1OrkjAwjmQjTp1TzcS2LSRu0hW8N+5MGZTcUNNzCdqZN3kOKSsvL2VJeTS/Js0HRGOsIpVcqc13iow4NO+IQRolpnn8lMGBTbaI3jnMRvBAz/8fUxzgSc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11efc05-1da6-4fae-b8ec-08db68d132ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:06:31.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA/Aus4Sb15mRAYdGSc4J9u/TO1m3h4vmXxgKXIF3CmRbuyarx2hTDhTcThlwXS85MpkC4Oh4rW1mcXlBxQ8UPCf48BW80iiJupspAlj4Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626

On 08/06/2023 8:37 pm, Luca Fancellu wrote:
>> On 8 Jun 2023, at 18:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
>>
>> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
> I don’t think this patch is fixing a bug:
>
> ### Fixes:
>
> If your patch fixes a bug in a specific commit, e.g. you found an issue using
> ``git bisect``, please use the `Fixes:` tag with the first 12 characters of
> the commit id, and the one line summary.

That a poor explanation...

Fixes: is about corrections to the patch, not bugs.

56a7aaa16bfe is unlikely to be backported, but if a downstream were to
backport your SVE patches, Fixes: identify all other patches they need
to take.

Fixes: was specifically invented to let tooling (partially) automate the
task if finding new patches to backport, based on what had already been
backported.

Concrete bugs are the majority reason for a Fixes tag, sure, but not the
only reason.  In this case, a downstream absolutely doesn't want to get
into a position where these macros aren't together in a pair, because it
there will be a case in the future where it causes a build error.

>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> But it makes sense, so 
>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks.  As you've already indicated that you're ok with fixing up
x86-emulate.h in v2, I'll retain this.

~Andrew

