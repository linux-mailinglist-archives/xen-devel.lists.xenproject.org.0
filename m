Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD278D656
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592959.925835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLbH-0001Qi-Bi; Wed, 30 Aug 2023 13:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592959.925835; Wed, 30 Aug 2023 13:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLbH-0001ND-8E; Wed, 30 Aug 2023 13:51:15 +0000
Received: by outflank-mailman (input) for mailman id 592959;
 Wed, 30 Aug 2023 13:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbLbF-00015D-NU
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:51:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 472aca44-473c-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:51:12 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 09:51:08 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SA3PR03MB7466.namprd03.prod.outlook.com (2603:10b6:806:396::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 13:51:06 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 13:51:05 +0000
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
X-Inumbo-ID: 472aca44-473c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693403472;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QzymfWvSHAq97ZllLFN7szuTdiwFkhkXKZdH0XgtcFc=;
  b=K76MFisxC6pttwdwrD/OB1L8dNbkgMGkw2xrWrCAbq+CHl+IvTFYpsuN
   2ZqWHu7UpmTieJ3NkP78Rk8eQgb/cY4hT0r4ePclK8mO52wUWLcnzl/lM
   Mbc8oaMT98HPSN2gDIPEdM/lYowX4/tYd88CFHqNB5JbP/Jqv7GCtBhFA
   I=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 123830232
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QyQ6dKqmoDcZ7gatlKRiZ+QzFbheBmJbZRIvgKrLsJaIsI4StFCzt
 garIBmDbv7ZY2fzc41zYYS1oEkBu5TWn9Y3QFRurX9hRC4apZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5weOzCFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABZQUD+kusGu/LK2DexSgfUfPpniDapK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrKU62wXJnTZ75Bs+ZVq9gtfjsG2EdflfK
 k4M4RgIrqJp+xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsTD9Hb9xgt8YwSnopz
 HeGmtroAXpkt7j9YW2Z3qeZq3W1Iyd9BW0fY2kCRAgM4djmqakyiA7CSpBoF6vdpt74BzD2h
 SyLpS4WhrMPgMpN3KK+lXjbgjeEtpXPCAkv6W3/Qmug5xhReI2haoqn+FXfq/1HKe6xR1iat
 XkAkuCU7fwCAJ+AkiCAWqMGG7TBz+6dMSfXiFpmFYQJ/TWx93OtcIZc7Ss4L0BsWu4UdDmsb
 ELNtAd54J5IIGDsfaJxe5i2Cckh0e7nD9uNaxzPRt9HY5w0eArZ+ihrPBSUxzq0zhlqlrwjM
 5CGd8rqFWwdFals0DuxQaEazKMvwSc9g2jUQPgX0iia7FZXX1bNIZ9tDbdERrpRAH+syOkNz
 +tiCg==
IronPort-HdrOrdr: A9a23:3WdUja/kbyJsFO4dgEJuk+AKI+orL9Y04lQ7vn2ZHyYlDvBws/
 re58jzsiWE8Ar5OUtQ4OxoXZPrfZqyz+8X3WB8B9eftUzdyQ6VxeJZnO3fKl/bak/DH7VmpN
 1dmsFFYbWaMbE5t7ef3ODSKadG/DDoysGVrNab52txSxpncqRxhj0Jdzpz0XcbeOCFP/cE/V
 anifavbgDPRUgq
X-Talos-CUID: =?us-ascii?q?9a23=3AzDrTz2m0LOYYnq7Wtwfan/3/3grXOVuA8lj3Hmy?=
 =?us-ascii?q?gNWZkD7irTm6s6vNtouM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Agf0EBw4w9SZaaskmEQI4Q8j9xoxY4qKNJho3sq8?=
 =?us-ascii?q?okMmFNzRrCRGehm+4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,213,1688443200"; 
   d="scan'208";a="123830232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZGfJHNmQxUu+SbG0Tcz15YXZYLGyaF6UJB50C6DsKGBpUvcV76sgsfNikGTLHkgJYYDRUZLVkk5v1Qlmv6sXLzwBW6gixux3QLo4wVpkbHr1qeWNrHGEEou8m9ajxoOqwZvwAhgPAnBXtyTuewWMlwUF43DVjmDfqYzJcFLoIuw+RIptaFFjPhQal3X68SLFAW75nX+7tGnYbdFL94VdS10HfuubNitr5qE8Ivs4TCNat6ynMwPofjODD/I5vrNlSp6+n400jxtEKLxi+at52J3BBrjhY0aEhiB95HAy91ZGaKczrQm/4iMK3bVhbfEGenag/BaBtO53HPh3UGVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91OXY1DoIUE5Y42/bGq0w6nZAhgPs6qUAlIYq4nHpiI=;
 b=iPQEWRBWnaIpzFMfBoZc+xQECWHYyyeysFKCNWCiBO0eAIbDJd4RO7eMHyiFEAVEHuO2w5DM9ftQqPE4kMlvs42DdsDz3RY0grPdra1RsIYqtBRZQ99e43cpwSTW+aVOFXrpcBUoMJNVQkd8JTaqaY8eLIITQUcuX7re2aQYSvsfbZDfuQMN/UavU9CAYqjXW4V4onhs3M9yOijgTctAbyhVTfLpezRlKt89dOXJQ8ktOLz4zxf8sXUwc1K7CiV4diYOgsl0osXsEfEkRmN2dO7mZnMUxEWdy3Olp8uAaMOERYTE9TgBq7SBvweAtrBYnRJgzAMMjS3sFdRwuqs8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91OXY1DoIUE5Y42/bGq0w6nZAhgPs6qUAlIYq4nHpiI=;
 b=R9oETfXWK20aKhkbSA9q0HrOCE2FZbeHFHTVcmQVE2mhhUUsiv+0X+hvhuDVR63M0m3fWRjNJSlnMtU06j5MDEHSh282k6YZ5maOii1ykXBENB5eWlWYxu/RCjSNwYgH8FXcehckG7pqzf6RIQSdigrRSjts0UX6hAWRUaMwQd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0e0b01ad-30c3-a538-1c67-c22b1ce9af3c@citrix.com>
Date: Wed, 30 Aug 2023 14:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/8] x86/emul: Add pending_dbg field to x86_event
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
 <eb9854df-67cb-8d9b-ac2d-75ff11f29367@suse.com>
In-Reply-To: <eb9854df-67cb-8d9b-ac2d-75ff11f29367@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|SA3PR03MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fab22f-f7f2-4bc3-7aec-08dba96027fd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ib3pLSfPG2Gvqbv7bLveO8scAiir4HTnVmq/vmyfTCevI8qnTyvMNf3b5czPf3Ce+PAth+diuOUUx7P/pY/Uup5xxZOAA71N9a5adoi21Y6kZEjwvLTHKT0vyrYudfwv6PvBVwlI4eZhUyxYl6qKLLg3MW53qvW0mc+RXuo3fEKljkK7s9rfHaj7H3YLe9BHPcpa1Xgxf/F97exGfV2tifuck39yxK/fiGSyXpFHyLCb1XaR8/kJj5VGCdHmpB991Gog4r6+sfguEQMlteT10PkpsnqRHCgs1wnG3W6GFjmZcwsTkxiSrSr8fRr8zj71VreyDGtSg8/OgOzz7g5OncRmK0WRCJtK4tDBWB0qEfyuA3Qb1JOTWtMG+vDDCIz3DUUBZWPx3+9xJoGhDhACAEowN5VcizIx8bEiZbJceU20olzmmDiUOxBaEASG3GbwDDiOtWb2hzix3yky1QlXiuujjy2p8Gv9czdw8CPiuz3sYyof6Y9BW4tSX+KXOipCyOF/DJCn8fraa3Ymq1h8zgBzn7Tm8PZfZx52+Uv9A53L7iDp42PYOenhyv6G/2sjJLoWg8Lzux5XWFHNg2kDDjZ94d6lxJqqoBZ+/RVAz/fbfaXuNUP47MWCPGZdEAOp/wa8G1bZh4vqX7vd8x+5Qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(1800799009)(451199024)(186009)(31686004)(66899024)(6486002)(6512007)(6506007)(8936002)(66946007)(36756003)(86362001)(38100700002)(82960400001)(31696002)(2616005)(2906002)(26005)(53546011)(478600001)(83380400001)(6666004)(110136005)(8676002)(4326008)(66556008)(5660300002)(66476007)(41300700001)(7416002)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3JBT0xBdGtEdzhyS3IycWdXR0gzTFk4TWRQZWc5eTB1OHFvYU9weTRSc2ov?=
 =?utf-8?B?RWIwNE1WTHNKQWU2dGJ6R3hmbWVtekVTSTRacnlnd3BudXNPelpIZlQzVWxJ?=
 =?utf-8?B?VmVBTVplL2ZhMWYveko5VDM0VFNTbTVDOTFVM1NhWnQxQ0YyQmZiK1dCd1Qw?=
 =?utf-8?B?ekhPVWEyOGpMY1BtZzMrQkpvZklOam5IZ2E3VjhtVDFHNnh0U1BETENQMDFK?=
 =?utf-8?B?a3RTQlJZci9LTGl2U1doSkJvQWN2dnNuRllXdEFISE1ZdFZBRy9pam9HNEc3?=
 =?utf-8?B?blplRlM1eWNETC9Jakh3Z09Sd1hhUExRMnZpZmpCSDJiZkJiT2hnd0s5RVla?=
 =?utf-8?B?RWdQLzJYOUV3bG9pYXBScWJMNWFjbFgyT2hlL1JQY3ZkbnFOSVViVkg5K25x?=
 =?utf-8?B?WTFlcWJuMEllbDFFZ3ZQNGZOb3hadW9UQXVMN2JjTE5OanZIcnlQVTZsczhk?=
 =?utf-8?B?OEZ6eGQvbjUvbjFHcTdIenZoaWNORkQzdDlWM045S042WkIzVUlxSnRRa1F1?=
 =?utf-8?B?ME5UVVgvSlVUeS9DTWxPQS9BeHViZzNZK1BZT3lWc1cva2VNb21LZkJPMnZx?=
 =?utf-8?B?a2hpYSs0QjFPWWVjSURySDRkcHg0MzEvdHVKOWlSd2U3UjB4d1d4SWJBQmRu?=
 =?utf-8?B?VHNBdEZuMkMyOTEwM3JiUytqTmNyY0RlWmRQaHNxbUFNNGhXL0hpRWN4R0di?=
 =?utf-8?B?TGdSVXpGZEVhT2lIaDdham10bDJPM2c1YURBM2t0aGRPNXJ2MTR5MzlrbHUx?=
 =?utf-8?B?bnhyRktMdjRFTXIvNGdlSG1HaFdwZVp2NU40ZXdMSUE5ekhDRkQ4ZjB4U3RY?=
 =?utf-8?B?RWN3VjRQY0crTnpPTC9mL0RlSFE5ZCtlbmd4cGZwWjBxRThLeGJTWWQydUla?=
 =?utf-8?B?clRhSmJROTRWcytLQ1V0OUNkcThQTlN1dW56dm1iOTQ5dXJwd2Zla0xiNExi?=
 =?utf-8?B?WFhpbDY4VVFnVWRPQzAwTzg2RGl4NWhHSVYxd0xwUVJFdEVsdDFjNDk4b0kr?=
 =?utf-8?B?bk03NWljT0dCZ2FYNHRKSUV2N053eVRVdkdEa2w2NlBUdGt1M3RkR0dGaTZK?=
 =?utf-8?B?SGRQbnBQUHRuZmFxTTA5TXVuN3hLMnpLNHhYdTJKL3hGWTJKV3hMUSs0UEFK?=
 =?utf-8?B?VFZQSlB3a2ljWjNwbHZuL0hVTDI3bkJQbzFqN2RRY2JTYldMRjZ2ZjEwZ29B?=
 =?utf-8?B?VnhoODB3QlVUS1p6eHFHVUdMV3EvVWxqWVVNN250QWNXbzVYR1NHUWFpVnZs?=
 =?utf-8?B?Z2IwV1ByNUNPMUJmUU5MT1EwQWV1d1hXUXVoVlc5QjZpWUNPeEVZZW1Pc290?=
 =?utf-8?B?eFk3Zno0dGwyM1l1czQ2RFdQcllZL04xOXdRNnBQOVlJVXljNXdrRjc0QnpD?=
 =?utf-8?B?d0hlOWI3NzVVNnE1S2pNN21VRWlzM2RrdGd3VTFPSWs4ZWhJK1lrVU44R2N0?=
 =?utf-8?B?c0hNN3N3ZjhxWU9pY0ZLbk4xWU04Rjh1UmhtYWQvOVZLeWFpNXJNRFoyWUVS?=
 =?utf-8?B?Q21UK1V5YktyOTZFVW9tQWNpN25INFkyUHVJYndoeFh3YlJmOWR6L1ZsQnAw?=
 =?utf-8?B?UGVTRENkL2NqS2VsZUgyalBRU1ZEeDUyN1hUeXlYKzJEQ3hxSlo2SUY0dDJ2?=
 =?utf-8?B?aUlFVDZzdTVSd2U3YTZFcy94UytFdXRYbnJxOUl1L2RvSU9NR3ZGNkF0dTE2?=
 =?utf-8?B?SCthWXduWExuVzFmSXRscThiMkhyTllHQkhwK2VITEM4RmVDcW5BNXZHVi9R?=
 =?utf-8?B?YUNTa1B4bENQVHUxa1A1SFRDdndLRytHUXdSZHJ1UVV6WlJuS2ZGczFwUkcx?=
 =?utf-8?B?YlZBbjNMNlpHQ0lpTFljTkdkUlF5NUszdFlyYmhOSGVmN1ZrNWVYMzU0SW9v?=
 =?utf-8?B?TXpOcTd5VUxtSmMwWEhQM0xBRlowMmU4cjBqd2Z6YnZZdC96clNBOTh5Ujhs?=
 =?utf-8?B?ZEpGVm5XaHY2bUlsSGxEVjIzM0dhQjBKZzFWWS9RQ09OTWRhWGFackFqTzk1?=
 =?utf-8?B?Wk9VZ0VzdjBOd0JhdXYwcEdmODZUVWNLQmdrclROVXpkVTJLZFJMY1VmaG9u?=
 =?utf-8?B?bEtlR1ZmZ3MzOVNXdjdIbDJmRlVtcTNsVmVBWC9vZ0JVbDIzdXNkVGhrclNT?=
 =?utf-8?B?UmhMUWJSK0MzTWZDNE1uQW8weFo0akxxMmtIMjg3VGx1bUhiTjlxWU5BWnZM?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?VFRuamEwY3hwRElOMGxSbUNjZWEzRnM4MW5iL2w0QTBzb29jMlUrbFA5UTdB?=
 =?utf-8?B?WlRXUGVJSXBRa0FoS0FxcjNTQ1BCbFlPTUxJZ2pRS24zM2xrREM1YytkR1hZ?=
 =?utf-8?B?cDMyeVFoQk5sZlJ3ZFJSTG9lWmdhVGRzYWxaTm05d0ZqMWxWakZaWXI5YTJn?=
 =?utf-8?B?Sm1IQ0c0aDkxelZlQUlTSCt3K1ZjTm82TTVIbkRYc0s0R0ZwaGpBMWs5eVZF?=
 =?utf-8?B?enJDbHUyWFNWcWovcEozSVVHclBhcmJ5VFA4RVZ6TGpTZzdpVVYrcHlGMzBz?=
 =?utf-8?B?TkprSGlkVi9uVlhHSVJMaFg4UHFPZUpWSERVek9yMEhzWWdYc1hpZzVoRHNk?=
 =?utf-8?B?ZWRJaTNwU25pZTR3V0NkYUhJZHN5THYzQlRkSjV1elY4MFM5MVlEVUFZd3JN?=
 =?utf-8?B?NXk0eFVnUGJQUnVDWlQwSHk0SExjM3lFcEZRVjNWYllPejZYekluMUpLWU11?=
 =?utf-8?B?RitJSEV6WlZ0cHhWTy9adHFzZkl4OU1KbmtqTW0yOEk3Y0MwR1JXcG1ZTzZo?=
 =?utf-8?B?NjA1Z1pDN1J6U015MktVTVNlaW5jVm1aQUlLSzZrMi9oMnVwMW42MXh5UWd6?=
 =?utf-8?B?eUMyN3cwbkJxL0EzRjRYQTFrV3ZhUVEyVGZGK3dLbWdleXpiWUZIeFZQZVBt?=
 =?utf-8?B?Z2taM1ZVaGhnVHFEaVNzblVFK3pqSngzM1IzMVZsRWdFdmd0OUtCT01TdWhV?=
 =?utf-8?B?SUdrSTJhVkE3YUVRMzVsbHRHTENsVVlYYnNXZUc5RndPbkxiSjBDcW1JZ2dz?=
 =?utf-8?B?T1FRZ2dMWEwvRFdoUFpJWHdickNmR0tWdkp4S2I5Q2pXV2ptMVJNRUNhUjhH?=
 =?utf-8?B?NHFqdEJGdlkwZTNWU012bHBZV05QVWhkamZ4SVdiNnBXTm84V0lFZHN5WlFY?=
 =?utf-8?B?ZCtBZEY3c2N5alFuMDE1emJTSjNqaFo2N3YvR1o2RXV2K3FKT0NoWFhFMEx2?=
 =?utf-8?B?OVh5WE5yUVZ3VGt3S0hoYWdFUUg2TmxlV0NzTThqMHJVVTF5UlBpS0dKNmtt?=
 =?utf-8?B?UkNRMDJLV1ZoY1ZpTzdVdEFmRHUveXUxKzR1V0o1U1JQK2hlYWdzU2JRUDg1?=
 =?utf-8?B?VGJGMjc3M25TZWtEMHU1NCsxYVVXNEF2ZjBIMnIvejlwZ0VlQ05RUHBSeHdE?=
 =?utf-8?B?Mnhld2QvVytMMGswOE15OXhVQWd1M29WMXp6WDltVkFHZzE1R2NxbFVpaG1n?=
 =?utf-8?B?dTdLVGVROG5RUjB3WE1yWlpuUUk2c0M4emltRERtZFF4d3BORVRibUF4VkJh?=
 =?utf-8?B?ZFd2MVY5aHlSaVV0N0pGeGxEdFNGL29jbW1zRHA3QzFJcUlnZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fab22f-f7f2-4bc3-7aec-08dba96027fd
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:51:05.8470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/pPQto7ipkVJZ185wr8s+GO/RlnJGCMgGfn4dTH1D0mHrhfBDe+QesO2JfPd2SAgMXKy4UAxtJ7bVZ3r1uOwMin2nkaf+IGTfiJfKYy1Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7466

On 30/08/2023 2:30 pm, Jan Beulich wrote:
> On 24.08.2023 17:26, Jinoh Kang wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> All #DB exceptions result in an update of %dr6, but this isn't captured in
>> Xen's handling.
>>
>> PV guests generally work by modifying %dr6 before raising #DB, whereas HVM
>> guests do nothing and have a single-step special case in the lowest levels of
>> {vmx,svm}_inject_event().  All of this is buggy, but in particular, task
>> switches with the trace flag never end up signalling BT in %dr6.
>>
>> To begin resolving this issue, add a new pending_dbg field to x86_event
>> (unioned with cr2 to avoid taking any extra space), and introduce
>> {pv,hvm}_inject_debug_exn() helpers to replace the current callers using
>> {pv,hvm}_inject_hw_exception().
>>
>> A key property is that pending_dbg is taken with positive polarity to deal
>> with RTM sensibly.  Most callers pass in a constant, but callers passing in a
>> hardware %dr6 value need to xor the value with X86_DR6_DEFAULT to flip the
>> polarity of RTM and reserved fields.
>>
>> For PV guests, move the ad-hoc updating of %dr6 into pv_inject_event().  This
>> in principle breaks the handing of RTM in do_debug(), but PV guests can't
>> actually enable MSR_DEBUGCTL.RTM yet, so this doesn't matter in practice.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> [ jinoh: Rebase onto staging, forward declare struct vcpu ]
>> Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
>> ---
>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Jun Nakajima <jun.nakajima@intel.com>
>> CC: Kevin Tian <kevin.tian@intel.com>
>> CC: Tim Deegan <tim@xen.org>
>> CC: Tamas K Lengyel <tamas@tklengyel.com>
>> CC: Alexandru Isaila <aisaila@bitdefender.com>
>> CC: Petre Pircalabu <ppircalabu@bitdefender.com>
>>
>> v1 -> v2: [S-o-b fixes. More details below.]
>>
>> - Update DR6 for gdbsx when trapped in PV guest kernel mode
> I take it that this refers to ...
>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1989,17 +1989,17 @@ void do_debug(struct cpu_user_regs *regs)
>>          return;
>>      }
>>  
>> -    /* Save debug status register where guest OS can peek at it */
>> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
>> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
>> -
>>      if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
>>      {
>> +        /* Save debug status register where gdbsx can peek at it */
>> +        v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
>> +        v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
>> +
>>          domain_pause_for_debugger();
>>          return;
>>      }
> ... this code movement. I'm afraid this should have resulted in you
> dropping the earlier R-b, and I'm further afraid I'm not convinced 
> this is correct, despite seeing why you would want to do this. The
> issue is that this way you also alter guest-visible state, when the
> intention is that such now happen via ...
>
>> -    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
>> +    pv_inject_debug_exn(dr6 ^ X86_DR6_DEFAULT);
>>  }
> ... this call alone. I fear I can't currently see how to get both
> aspects right, other than by breaking up

I think it was wrongly broken up in my RFC series too.

With hindsight, I think the series wants rearranging to introduce
x86_merge_dr6() first, and then fix up PV and HVM separately.  They're
independent logic paths.

~Andrew

