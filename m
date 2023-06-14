Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389C72F74A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 10:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548567.856541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LV1-0006Qn-HN; Wed, 14 Jun 2023 08:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548567.856541; Wed, 14 Jun 2023 08:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LV1-0006NY-DY; Wed, 14 Jun 2023 08:05:03 +0000
Received: by outflank-mailman (input) for mailman id 548567;
 Wed, 14 Jun 2023 08:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGM=CC=citrix.com=prvs=52225e267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9LUz-0006NS-G5
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 08:05:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ffa4a8-0a8a-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 10:04:58 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 04:04:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6051.namprd03.prod.outlook.com (2603:10b6:610:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38; Wed, 14 Jun
 2023 08:04:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 08:04:51 +0000
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
X-Inumbo-ID: 25ffa4a8-0a8a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686729898;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JXEHax8nLdyfvviPfnA0xcOG+8OCuwfBkquZ83nAQP4=;
  b=dPwojKsYbMYaDVanBGOtyiMksj4C2nxLaG1sVtPekQvHgDJsJ8YOTPf7
   yAMQZ5qC3qdP+gaujNmjd3QdgeB0O/ppWNw2qGEF0zdcd+tOVR7LiPqsw
   yG0tu3WypdWq4Lp0an99Gcz8nCzjHloI7zlE1uKUjeZr3fKSRNtlnl3vI
   Y=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 112741343
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gjDzLqu5FuStmaEkr1AntS5cn+fnVMhfMUV32f8akzHdYApBsoF/q
 tZmKTvXaP+JZWP2etxyOdu39R4GuZDUxt82SARu/itgHioR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDD8ubDXAteGM2ZGnQM9Du8saJcjWM9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTiqaIz2wHIroAVIAAzbHiSnPa8sETgQdhkd
 kw6+ncvqIFnoSRHSfG4BXVUukWsux8XW9NUVeog+gyJ4qPR70CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LErOxj9DzMSH9x
 XaNtidWr78el9IR3qO3u1XOmSuxp4PhRxQwoA7QWwqN0AR9Y4K0Yp2y3nLS5/1AMYWxQ0GIu
 T4PnM32xOIEAIyJlSeNaP4QB7zv7PGAWBXDhXZ/Ep9n8C6ik0NPZqhV6TB6YUJ2aMANfGazZ
 FeJ4V8BophOIHGtcKl7JZqrDNgnxrThEtKjUe3Iat1JYd56cwrvEDxSWHN8FlvFyCAE+ZzT8
 7/CGSpwJR720Zha8Qc=
IronPort-HdrOrdr: A9a23:+3xfd6CYRN9iarjlHej9sceALOsnbusQ8zAXP0AYc20uTiX4rb
 HdoB1/73DJYVkqKQ0dcLy7SdG9qDbnhO9ICMoqTP6ftWrdyRiVxeNZnPTfKmbbalvDH4dmvM
 8KGcUOb6yXfCFHZITBkXmF+r0bsaS6Gc6T9Jzj5kYoZyFGL4pJ1W5Ce2SmO3wzbilqQbEHL/
 Onl6l6jgvlU1Q7KuuSLEQiZIH41rj2vaOjSz4qQzoK1SHmt1OVwY+/OTi0mjFbcxRh594ZkF
 TtokjSxojmirWB9jrxvlW8071m3P/d6LJ4dbmxY7AuW0vRozftQIxgXr2EsnQRoPuzgWxa2O
 Ukuy1QSPib9UmhCl2dkF/Q5ynMuQxDmhvf9WM=
X-Talos-CUID: 9a23:2a8sdmDxahBNpwf6Ew1o10wxWfImSGT+0H32DHK3MG9odbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ALHvrmw7nxTsNDutOV1Nf4znoxox1xp2NIX0ClK8?=
 =?us-ascii?q?M5dOODnFwFTfAjTGeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,242,1681185600"; 
   d="scan'208";a="112741343"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oyr3lUSD44aQtO1u2PAdgOgub6rlnLnlDQbwkTLqbyXHl7/Lqw+voxhaWxckKO20Z+DCdyFBKPhqG+NrLKgn4leoE4+tTtFbbGfTjtJTNyl6EdRCYv/l+ULmv6od4N2sE2dGrItkkqIHknea6n20P9RE7TM6QD1msXY9dk9Vs03ZC+7MWBO+V7ZywTNgjtyzGNwRf+1zU0CADuPg+VIOBlAZbfDqpZgdOHe2SQkBqBMJOSRndtfgSLjKATxDdipv5nkVrJ2ApyR9IJBHYteXAlmwq+QLuvG2VH7ArBdF9g1zGrKAgR4s6OuEnTbbT+zEny7xQQzQvh5rmbkFrX0vXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0ms2YejFOSpaRTBFCXaCHlmXXiuzo5e0M6nCbzl2nQ=;
 b=g55UM0AUMqCeJsAHwZKz0JDmMOKMcVjXngQszk5VaPkxhe6UnrtCC+rcSb/ReezdSPmH2TRP8oicDCMAQIf1Iedscg15pJNgRRdj+5HDdwd1rbhsI+cSku3mYWo8UHhdL35BxO136XcwjXOMurhvFJhwMYIlvM93WMXl9QRFLFbu4LhLASq0hyFf3ucPr5EmCmQqCxrvNFjxQcsG47lligSobjwEAYi0h2aMh85xOEPR8JoXh3tSK3gbNsExNFZtsXi6aVA4vMCIW7dV9M5Un4kSCZ9SLjazWBXOKR1eACZJPghWAAy0PSGg/hkbh4rEIQwYkGACgm6UoO5vCQzmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0ms2YejFOSpaRTBFCXaCHlmXXiuzo5e0M6nCbzl2nQ=;
 b=spkQRZ3/bdVFq/m9Axdw874wPZ7nhLMEJJ269yioBs6iGqx264tP9zjiB91FmIPXkmFSI+72/hpfRB6jG19aP9c1xcRobNhdf9/W8q3NWa7jYuN1Td7C1do9HqbxlU9jkY0wTsMIz1KvtDzRt0SXYf3Q3sArRbR5mkwNsNLs8yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <261ab0b0-91ed-e6b7-730f-0ecb8a7b5635@citrix.com>
Date: Wed, 14 Jun 2023 09:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230614073018.21303-1-michal.orzel@amd.com>
In-Reply-To: <20230614073018.21303-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 982d9d5c-74a5-4713-bcc4-08db6cae078d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lenf2NxecAZiDEWujxYHklLQytDSvElLZR6n1pW+Ilq3rq15rj8BWBqfZOSTyvuk+SkIVrK7tRz2ZUO78lCr3jFTlRxs3D5+SBPYMcP467f19bvwDMhTZwz2hPAFrDow6rV5vY/kCe1c1/6cJo+WbxNr/eFYA4RkSG/qduv3CW0vYSjNTx5iEU5ggTTIPriGq+sCS1TnBNOhzzm0SUprprSYY1SC6Tqis820gEhL9wD2jExpLoP1zH65ghJ0W8+umyK4g3SpiyEftBb2Y+5quZMxvr59C/XJNI4YYtozB0c6Rw9ee0Xj72TfRoaHQpTV68Ol1tW7Zp4egdLbZ/j4tucjKoyKqTl+Fu88A+blrAIVcqEWxs1BuOjq+bBKqPbwhaNLoCDlbhn064jqrEHENzma7Yxy/s41O7F4rJmLKFlUX3XnklE8maO8tY7vEpT+rw4XKI1W8heUJ878p1OvHQhXj9cnqM973s0sOJ0nuO+tKqj2EyyVywMk/su64G8tM7H0kTbAfcuk9ONg4obPlC32HVTrYkts3l5dzy65SxTLztLAlXx6GKKipT+HYvc2qmTN/mHwd2OL7UM32gKR6+F00cWUJn2noM4fF9DKlxw7EIE4szzfWqq7mHUfSDmJAXnJeX9sHfJTGeqKL7yjrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(54906003)(82960400001)(478600001)(8936002)(41300700001)(5660300002)(8676002)(4326008)(66946007)(66556008)(66476007)(316002)(38100700002)(2616005)(186003)(83380400001)(6486002)(6666004)(53546011)(6512007)(6506007)(26005)(31696002)(86362001)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGxVTUthSVcxRDBaS2IwNWszMkNSbXpFNE4rdHpmOEoxV0xBYVdEK0FvS1Rk?=
 =?utf-8?B?bDJJcWpiQzNaZEFPVDl2a1RJRWV1a0I5UWdETGt5VmtRUFJ0K1NzMXlzTUIz?=
 =?utf-8?B?RDQwUHgyaWRUalBQY0VtZlZkLzByNUhwZmhqMEF5Y0pya2h0QU5BRFJqTHlB?=
 =?utf-8?B?OGUwR2IxYUFETGlCMTY0UUxZYWxaMUZlb1l2R09EKzhUZ0VOSVhhYVEvVS9N?=
 =?utf-8?B?T09NWnFobFU3MjZ3WXRXQ3FTVGFaUjM1Q0dsRGRDWkYvemt4bXdhZXpoNmMx?=
 =?utf-8?B?YXY5MmZNaUQ1bjlHMmNZcWFNK2MvMkZRSjVyMko0ZjYxMlozMFlyNWpDRWZr?=
 =?utf-8?B?Y2hKeUtTWS9XSDJwMEZTanF4WXRrM2JlbkNyWk9YNSs3NldoSzdrcEV4QWZH?=
 =?utf-8?B?a0JBVWNmcGtCRDhxUGdkQ3RGMFg1a0hNVUtJMW9ielYrT1FVRnBPSXM2aEds?=
 =?utf-8?B?T052c1lBd2JXUk14cWJPejczVkRHZXNYT2lwek1BeG1PZGlJWXZOVFovN2J2?=
 =?utf-8?B?Nys2RSs2bTkzYWFVblR2MHVWaStQdG82QW5NVGNFbDJwWldnbjU4cEVGYi80?=
 =?utf-8?B?b2gxSmRFYmpBOWh4ck5adWhGRHMzMEE2emtreFV5ZXJJbkF0RE1wREJvSXRn?=
 =?utf-8?B?VWx4SHFpaVhRbm00Mm5ROFFyL0V2TjhYYVEwWnhvanJzU3R0YkhpSDNhaGdr?=
 =?utf-8?B?Nit0U3ArMDZFUFE5aHA1Nkg5WXgyUCtYTENVNmVEOEhUdVBWWTFzRmg4YmNM?=
 =?utf-8?B?cE5aMHJybVhzazBXSWQwRThBc2JWanhlZDMzaFlsV3lJSVVlaXlwdnJla0NF?=
 =?utf-8?B?RGluTmdUVFhocThmVjVyQ0pBRkg4UFdsNzN6ZFlFMUVmdVlEMXdYTHRmMnFw?=
 =?utf-8?B?ZUJDclVuVmxNV2d1SitSWGlnMHNsVlNIU2VHVVVmSU43NitWWUpVR3QraEZB?=
 =?utf-8?B?Z1crK1VJWVBmV0dIM1c5M2NnVmpnNFZ0R25kdnJHN3BIaG1tbXZBWnd3QTNL?=
 =?utf-8?B?VlIzdmNnN0hTYWMyL3Vzc09MQTc0cnBXTG9RRmw0c1VaQ2FmSjdnSEZTbVRD?=
 =?utf-8?B?TnB6Q1VBNjBBTDlOV0U2MFl2bVhWaHoxMHM3b1owV2x3NTU1Y3I3bmt4MGVq?=
 =?utf-8?B?MGEwayswaWFBdUoxakhhblpsb3BRaXFzZHl0UkVZZlIxWGN3eEpRTVhHNmxm?=
 =?utf-8?B?d2FRcDRvUkQzYWVnODJDQ2YzU0UxQnE5SWRrS2ZlT1ZtdGJ5Q3BHR1lvNWdv?=
 =?utf-8?B?cFFlVzFnUWZHVVlvd3JwNE45VXljTnRJaUdPL3ozSS9BaE04YTRvcURnR2NC?=
 =?utf-8?B?eFVvUVRPc2E2NFhvZ3ZLeHE5REFaZXhyVGxDOXQ3ejNXZjEyOEo4SGtYdHpT?=
 =?utf-8?B?TjNHM2FzYVgrVFpBTWFVbjZZZ2I5bFhDd0QvdUhJVkVqYnRweHR5Wmx0UWNv?=
 =?utf-8?B?RTZ0T3dSNHFBOHpNaGNoN1ZpM2lIYitVdUp2d2VLc2NyQ3JoSEIycnV2dXpl?=
 =?utf-8?B?UHBnMHBXdW8yK0FZOCsvbEQzV2o2ZzdHVm5YTS9DZWpTZUNab1M2TGdFQkZ3?=
 =?utf-8?B?VnZpRkpiZC9ET1FXNzdpSHA4UEtaenl6SWVOd29zQTNEdk4ydkZxMDJaWm8z?=
 =?utf-8?B?d0NVUTYzRmlIMTBDYTN1Z2dJYnNldjg0L0phTHZWcFFZN1NZNXF6aEFReno4?=
 =?utf-8?B?c29laWxGTmxQYWttSkZuYjJTcWEvTWJrKzE2ZE9zcGRXcDRFM1FTU3k2My8y?=
 =?utf-8?B?SVJGeHlrOFFPaXYvUzNQeWpnZllJeDFOS25XRDdmVmphR3AyQzQ0Y0dwMWc1?=
 =?utf-8?B?SVFCckJpa3cxbmY2UTdBNlkxRnpZWG5oalhpWmI5WkprOVpGTnBERzFXbHQy?=
 =?utf-8?B?cUNibWd1OFZkRTI5YTlxamptY0hUanZvbGVHVVlEdCs1Rm1VNzhMWG44UDdS?=
 =?utf-8?B?SEN6YlVJT3FuTkUySE9ZOWl5cmdpdW5YRjkvN0tlVmZITGROaElNT3FESGlt?=
 =?utf-8?B?KzZGK21xYmllRmx4bVBlcmlCRDB4YytGeVpMVUpqcnJseWZUMlEraC9vcFFU?=
 =?utf-8?B?NEJOVG5tS0JvNlZzV3dhamNOaFlBVzNXaWNQNVp4VDFwcm5nNTk0ZmE4TlFN?=
 =?utf-8?B?a001STNWZHU1OFMxSWF1Z0R6VXBGWDN3L2tHWHFEVjNjam9MRUNCWWFpQjhy?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TmGk5LjFV6HKYZFCWzlN8Sh98MxBuCHtqyOgsFi8oeK+rRur4BhGu25aUgHvWT3OzD7/+Uf7avsn9yVL9qP4FkNJ0XOuftTG6DZ3juvsxXhLGS1WMxd0RnKrXdFjao/g9/2Bi99biA7V5PTv/lsGlDAEyQS1xUg/lLjXnqIU7KJT/BujsVH4mCPe8b63QBPVLOx52OJNdPSUHWOznpp7W0ICcpDCJgaj0+8zxX8Ot6kSuHh5P3xOtiwFFe7ZKqjDYSVvnPUOvHHqCWJFoGrOZOdH9RZcX/43GpMwBtjNUKp9IPRhpKCWx+7A6gOkvCPq2OxgzUyELeXf4Jmk1m9Mrca3VW4+SgS0r4SHQIK6+TGAz68NVHn6fDAbeJvLiNJPYbcGcUgQGOhD7MGsyxu0NnVZiJtonsji4wqGddz1NiZ9enzvs0mq92L8yviVwpOREY/XTAVMyUblnAld4G8wgagVTFZvZmXYPcITf+pCR8O4TdA7uCLzr63TzffzjO452GXWd1cOJy5anCXLddSj4wOrxMp+w1FQJuwO/fFLCHa2rtF7Km9S9SKc0T0UEo/1rGraXYULi8mVPaY7XeuBUs8Ur7bM/CVg93FsFYXwkkGjjtCrXLpYEPzNLSKWzoIpNfO0mq/n1eXgtjjWj/lGY6jOPxo8Ig6DE6445L8/OTNsx2edsdlgBJMtG0QLTJix+MJXV419650LXtaJGu2LGfV8NZGMyiCoSZZ1PhSwb44sRt1FPtFKIZEgRDbrUkO51r1IYYojwY577x9p4+JUVl7EndQoL5mmKAyFw2GBdzy/kciiQXVBAKnslZ1wBD9xMX+EgBcOQ1dmtjED/3/a/348FE7yEy8HHXOKIwSPLtL9Ox9Q0xAtUxonzgTjPiyU+m8cAZ5HG7WadELm1wBkw3fumA9F6CIoDfZzkccbDtQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982d9d5c-74a5-4713-bcc4-08db6cae078d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 08:04:51.3323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nWo08TBXoNL8RoQJVbLoecgP1RqGuYLBv5ZuuUwFSKazIYNC1f8+uEzCwLH3K3OsIdSYKcN06gjqGR7YzewJvhM5dlansmP2dMPDb6rcOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6051

On 14/06/2023 8:30 am, Michal Orzel wrote:
> Missing newline is inconsistent with the rest of the callers, since
> panic() expects it.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

although...

> ---
>  xen/arch/arm/bootfdt.c            | 2 +-
>  xen/arch/arm/domain_build.c       | 6 +++---
>  xen/arch/x86/cpu/microcode/core.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index b6f92a174f5f..2673ad17a1e1 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -225,7 +225,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
>                                   size_cells, data);
>  
>      if ( rc == -ENOSPC )
> -        panic("Max number of supported reserved-memory regions reached.");
> +        panic("Max number of supported reserved-memory regions reached.\n");

Trailing punctuation like . or ! is useless.  Most messages don't have
them, and it just takes up space in .rodata, the console ring, and time
on the UART.

I'd recommend dropping the ones you modify, and/or cleaning it up more
widely.

~Andrew

