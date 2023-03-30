Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BEA6D0415
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516669.801176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqtX-0000AZ-TL; Thu, 30 Mar 2023 11:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516669.801176; Thu, 30 Mar 2023 11:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqtX-00007d-Q7; Thu, 30 Mar 2023 11:56:43 +0000
Received: by outflank-mailman (input) for mailman id 516669;
 Thu, 30 Mar 2023 11:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phqtV-00007X-Tw
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:56:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed9fb0cf-cef1-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:56:40 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:56:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO6PR03MB6209.namprd03.prod.outlook.com (2603:10b6:5:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 11:56:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 11:56:29 +0000
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
X-Inumbo-ID: ed9fb0cf-cef1-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680177400;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xUl9eeiOlLKqTVCzasdlfkiEGLrLAMydSibTiLUI++c=;
  b=Pcp7qpu1Mpg6mmL3d/7Eilaz0oaC8uu2D31fg4qTooITws7J+LZ/mJ0W
   XM1dDZHbuLdTcfdxg4IPZEBEmCzIffwE3BOxV3gCv7t4wVv0/lCunpBWK
   J8H0IeYCAnoWahMh//FwO0Pa8Ujqe76lo7H/jAP3Ap73UquWtIlhvHT6N
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 103694797
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AG4MiavnGF4NrCiLDQ8s8Bzn8efnVHtfMUV32f8akzHdYApBsoF/q
 tZmKW6FO6zeZzDxeoxxbY+z/UIPuZ7VzdU3GgtpriAwEywa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASFzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCzcdRxTeo/KK5aOJWOMr3u4Pa/uoFdZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgraA73ALCmQT/DjVVeWfirvacgHfmVtRUC
 1MGwhEit/U9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSfexloesR2C2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:MOPx/aj2GdKcT+dJxBFr81DUA3BQXvwji2hC6mlwRA09TyXPrb
 HVoB0+726MtN93YgBHpTngAtjmfZq4z/RICOYqTNSftWXd2FdAT7sSibcKoQeQeREWrdQtrZ
 uIGpIWYLbN5DNB/KPHCWeDcuoI8Z2u7L2vnuvGymcFd3AQV0ii1WtE48Sgf3GeiDMoOXPxLv
 Sh2vY=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103694797"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVas2PvWtvJw2dkYkl4qKlVRHzMkVhW4yJPXfXvoib4J2+s6+j6jZHqh/NE+/TJd3BK/mZw8KRx7NJo+f0DNQJCzcme3uix4umTDbUgQq99iE1n4qwFai5GKnIshu8ect2Cnr9ZThCQXFlbje8v/mB8FIMhKQCn9rVIwX6BuoaOKYlT+/qNLWuoS34tYe1bUhwZga1SY43cfn0n5Z1uEpHzRS+eIV7zwPSesSP5PKRFS6LkYhWgsfqrwQiAWonctDmwTAp3QcqW/uOQxM1H0+9eUsfgWl0yNvlmO9ou4rmiKoZsA7pki5iLVSOh92dvCjLR5Adx/GPqnZTOsiavRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKBRSv4JaaZqbnws3tYTBKZ84gwOmdgiT4UddP5fZBs=;
 b=kEyjsVEg21jma2NQXzEsVqzfui1j1UVFFuR1G1AchSfpRxeBzJc86y5rUqTk8We1Q/FezpVCOLUunQSEuyA7NQ8ufpkC+HQYxOCOz4cuo0Sqc8J2CODTajCTG094Mm+cZa3LqaO0hNsocMjx7E9RbRzVxAmplYMZP48M6+5QiZd64G3yXSpSGi6XLtbI/UncYt+pONWoOS2EjmMSKhW4p7hFZyOrbFZIMZ/mfnLnk9gwdwS99rsOS2YuEFJ29cECQL2HNmq0YGuE2eQKooi6fm4Ip8cNLGIqujgmiZdIri3yBCWyGCz9uAgorEWLzVNToyF9S3fP2jJ04klLlwhKgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKBRSv4JaaZqbnws3tYTBKZ84gwOmdgiT4UddP5fZBs=;
 b=Fr6sU8W5zeiXG2V7H6SNIfLOlz/0fujDccsV6m8pqoHJuSClf4bxkqNB488brqMB+wRPdS6s5GMcLZxTVDlU3UyY59KRZTEuLXaBfqjvNdG8Y8Nti5v8zlyMuztw2LLxtGrfF7QDVrSWRWc4EvCm9TC+386tZH2rBqEbl4pxU0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <af5e1fdc-e3ee-c283-65ff-4d2f1403b61d@citrix.com>
Date: Thu, 30 Mar 2023 12:56:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/9] x86: Merge xc_cpu_policy's cpuid and msr objects
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-8-andrew.cooper3@citrix.com>
 <cf81c142-766f-9186-27b0-e3262ccf62bf@suse.com>
In-Reply-To: <cf81c142-766f-9186-27b0-e3262ccf62bf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO6PR03MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 410c7b92-ffac-4768-7d78-08db3115cc20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Spl76M9VYQPnng4T6CTIpv30SRwQd8wF8+b+7acLsaBxp3I1a7chmIe4k6LyaBw0KwyrtyQi3VOyu1QpfziJlBcRhzSgyk+WFtO3cC9KEZ6ODx6Ibtmpwe9cS3whvUhCffuqhPy8tLOdTPMGPfa2kGVce572ZjJmnyEQus3sftGZQ/g/w8vVMVz2rZuzmFH0U+M/0YcoGhlfXSK5kbxMQlKkfNE1u3vjEZp0iKWLWtGvQDyQbYGq4krDV3OGdRkc+IoParzsxmHj8W7nwZgoE1jOOc5yBn5xHw7Yp82J9eVXydLckQMNdVsbEI1AXBp5UTTnOfolIa+UTb2N8wJWOtOmQ4JpDErLX3a3o25TqVQcfxUWtJ5w5UR7W2Dvhz0MJHYEf9HArhl4lJYASUHDz5TVi3rFrI47KtfKf/NtyU7R3dCPQ3/8bFAsU0avf8yRihGTIsOF1/Zmh0OUmL00mugT5thdc+1Qu0JGcpSbaJcwPz8SyYmF+MTMpFGCxk3UXStGutMyIvYOECtCeyH1m2PAq29Vp0yHw0oblRw/GSRc1GH8p30TznZ3Jn4LqqIDXZhH1CHcjI0MMRy/HB6S+ubWjxvLZ/FB7/Hu5CryhtkdGS44VrA0ivC6RYXqtK1E+STx7PT4z4CDK5dKSDEkRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(31686004)(53546011)(31696002)(66556008)(6666004)(26005)(478600001)(316002)(36756003)(66946007)(54906003)(66476007)(6916009)(4326008)(41300700001)(86362001)(8676002)(6506007)(6512007)(2616005)(186003)(82960400001)(6486002)(38100700002)(2906002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1dXaVh6SkN4OUdGSXZ3Y1paQnppaDg2OHZIaVU4UDIrTTBwclVIV2F6NWtG?=
 =?utf-8?B?N1JSUmhJL3d0dEJVUk9uaWJtK2QrbFdJTlRRQjZWZmtONjkyNmt1bXp1UDln?=
 =?utf-8?B?ajNZV2lGWnJaRFBwTk1SVVlxZmVYQXZDa25KWWtOWFRyZDBWZEl3cTJWUGpL?=
 =?utf-8?B?NHdvRk1abTV0QXlyTWJucE1NcU8reFBoaFJOOWtJWWxtUjNaSHVhT1VhT3N2?=
 =?utf-8?B?bE5LY3FOdGRQS3ZQTlF1UXJWalZZd0RETmJqdlI0TEU3WURLS3p1RldFRG9B?=
 =?utf-8?B?NzJ5YksyK3hIWmpXYlMyNVpPSnZGNVJhWmlGS3lCQ05EbzFqa2FMeS9kZm83?=
 =?utf-8?B?STVTTjNNTVNPQUpVOHJkemV2dXhzN3RaYlNidEhJdUgvZE0yZ0hHRHZtVFZT?=
 =?utf-8?B?L3kvQ0VaN3pGNDdzeDgxcVJqeEZiWnVNcS9GK2EwanNucjR4dTUxZmhpUXda?=
 =?utf-8?B?R241NndaZ2hQYjFCbmRFZ1IyOXFaWjVnK3F5d2dKa2s1RnRuMjE0RDZ0cCtx?=
 =?utf-8?B?WW4xWTlSN0xMa2NrVVpKOEVCY0xvQ0NJeDZVOGc0S0tFV3kzb2NrVDl4TW9U?=
 =?utf-8?B?ZTlMdXpRNWtseitWZ1RVMEJRS1d6YTB4SHdlN2ZyWmdIcng1QVNIaTltdDNZ?=
 =?utf-8?B?RUFVb1lpdHJvaHdSdURSVXR5NmRBRkEwV0ZQdkk1Y3FObzRPbXFnMEdsalFr?=
 =?utf-8?B?UFFEQ0FLSW9uc0F0U09zWTFoV2lDa1EyazdMeWVjbXg5ZnNxb2JmdlVLMEJV?=
 =?utf-8?B?TlZKa3YwQWlZSFJ5ZnQzQXN6dW9WSVppVHhzTElZK1ErcHNaeTluT29FREZn?=
 =?utf-8?B?VnJsbXdYWXFpQlhRM3Z2ZDRwVzNmQ2Y3SHJYQUxpT0xtR09UUXhNYjA4aDF0?=
 =?utf-8?B?ZHM2SUsveWk0aDFlcUJGRWtrRDhhREtHdjBpbmhkdUowaE5mY1pZWVduMFRO?=
 =?utf-8?B?OEdsMzJkcEdRb2tTRllHUEhuT1pBdDFrVHh5c1VvSHFsa2lQcHkyZTQzUk5D?=
 =?utf-8?B?TXp1MmlaWGc5eVR6M1NaTWFQenVYdWFMNmUrbXVqbDRmWG9xUTBFL3hFdG5k?=
 =?utf-8?B?a0srK3FHMml6QUllYXBwMkx4YjhlUEE2c1dJZWJYb2R4anFkVkNBaENRM0hQ?=
 =?utf-8?B?TGV0bCtBTVVSTDVCNW43bTh5ZkRoWVFKSWJ2dklWci9GREd4SVdDTkJLUUZI?=
 =?utf-8?B?TjloUWVDSmlIOUcrdFVuV2dEVkRTMm9MaENLUXI4QW8zYVJNcXR1QVBydHBZ?=
 =?utf-8?B?K2FYMktDbDNBSnU0a1NMQmFxdzl1U2VlQU9NQnQxU1JUTU8xbjNxdm9TQ1Bn?=
 =?utf-8?B?RGQrdit3blFSa3dKQ0NYN01yQ3JxMkxoNE1pdzhia0l4MVZIZW9ueGdwUy9k?=
 =?utf-8?B?WEdINC9XU1hhUkRWbzVIVm5FV1FuSDdWV0pPQU9GZGpvVUtwNDZ5S0tsVkdC?=
 =?utf-8?B?Yko1aHNSRy9yd1F0Z0pKWGZjQTlKWjVLOHBmcUNxSmp4alV1T3FRRTNyc0FQ?=
 =?utf-8?B?eEQxdXA0Nm1tSmdRSWZWeklCUkErY1VsZEM2ejE4aDRPb1orS0xlV2N5RUFV?=
 =?utf-8?B?WnhqVXltUjZlb3R4M29TWmxXdHdXaVlSbm90dStTMGNkV1gwd0FaVE43TjRt?=
 =?utf-8?B?TVVNWVRKaXRJK09FQUJIN3dCT3ZPWXowK2x6THF3UXRjSFVrZjc0bVBhamR4?=
 =?utf-8?B?Qzd2bXRheVc3NjA2Z2JoMVhzeWFYOHpFSmFaVkhxL3Q1Nk9aRStDekh2ZHF0?=
 =?utf-8?B?Nnl2a3RCSGVZaGY4UCtUcVNqQjRmTkNieVVnSTlrQkw2SW5Dek12V2FOYzJC?=
 =?utf-8?B?dkJYb3A4TEdNTEN6SFp6bHlQQUI4dSthR3ZoYkFkaERocVBHK0lZZVJvS2No?=
 =?utf-8?B?UlJRcStJZTVGMDAwVTQyYW5NbEFuQkFicUVmWTNJZFVIMlhmZGViVDE5MkFZ?=
 =?utf-8?B?V1hqZ0hGa21STEhjdUVFTlk4WTFCQ2JNSnFxTWd3SGd4QVN4aW5pdHpyVGtP?=
 =?utf-8?B?QUZTdkd0MWZqLzVqZ0Q2NGI4anlHNlh6R1BPQTNBakM4ZUFkNDd5bFE3UlZt?=
 =?utf-8?B?dU1TOWVibGhjSmdHenY0cjNtdXc5VGt6V3M1SDdGRnhFSmMyUFE0c1c3NTJP?=
 =?utf-8?B?ZWIyeDNvS1JxVEZFZWt2SmV0elZaVHdkMHhTK2txaWJVdU1tckk3bXp2djFN?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V+3Uyu+7upi6564w0x+l3kkV4I7Hjf8zj7KcKDI7DikqoSJOiC9yvcUNyHAkLymbpJlB7x/LIBNruAmDQB7zJTbVj38IDhKEfqtTad7yfKoCGzooK/kHgo5j+Q9VfLaMnqF9m8yTcDVg9HkAQdYHpG6qjzd71XdPEEOtqnI+DaMrN9Z7iL8F+SvGktuV+/XtzpGn0z/P6dwyENjPAKoh4uZDN53yrtq9CPSh5ukalPCxDV/aMzVUJqpaLXj0CvzdcaO9FSxh/QhCtYUCCtcuGVZ5GM0r6NLkzN1prChIFGoe3h2yV2qVJyoutMb6S8rQ4vzurBCT7xSDKG5d2qiF/uUAdEND6a3NLdqfr9A2ivw/3aZxHjINmVyRU9c6JcvHqnOwOY8FS2flJ7CVvLEJhikqsv1K63EOz1eccIgrxLqX42tu4Z+QW2oh6E+92eYYJ1Dexrm7OO22oCdj3dhU1IMiz+GP7v7OpnBLVscjw5qbDU/zFqAqZH9U8V2LP5CdbWfmumZhgzuAT6Kf+LAXG2mrrgZtmX63n8+XpjjJHyJEXz/FQ4kiqlEb8SFVnzZJ4lyJ7twgqBZf4JapiZZZqSPXxdL0GgMjBcWOMHXCGXpH0TCCb5hMwurL78L1SImVdWRaT+K0/BNHLKwddCAhZ5ru8ep2to7Q/6K08qFKDlKIQ0ErQJOTXHjfTy+GC7ZNW84ZT+lESsXH+/I9tmqvaKhSHWJxK1ckhSRvzF3AbbYVLu4OwiLbjyg3Z5xuxTGmx8TNnPimN5tXRhc16rD+GQf7YSHvCJrvrGAihPWm56fx5kC+cW1qu2w294baAC5dxxiXH3pKLPynI3Slz8CcDQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c7b92-ffac-4768-7d78-08db3115cc20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:56:29.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lrq14fFwQfhvLHaiDXwv3tnWj/mJbs/7rWqqB0PJO/0A0kGgZ60yDfVwdmjEbGbhbwWHANGeZXXmKI010oM2woUEOTto4Dfo5eezfDNiyHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6209

On 30/03/2023 11:04 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>>  /* Sanity test various invariants we expect in the default/max policies. */
>>  static void test_guest_policies(const struct xc_cpu_policy *max,
>>                                  const struct xc_cpu_policy *def)
>>  {
>> -    const struct cpuid_policy *cm = &max->cpuid;
>> -    const struct cpuid_policy *cd = &def->cpuid;
>> -    const struct msr_policy *mm = &max->msr;
>> -    const struct msr_policy *md = &def->msr;
>> +    const struct cpu_policy *m = &max->policy;
>> +    const struct cpu_policy *d = &def->policy;
> Looks like you could reduce code churn by keeping "cm" and "cd" as the
> names, which would also be consistent with you continuing to use "cp"
> in hypervisor code.

It's a unit test - I'm not worried about churn; I'm more concerned about
the end readability.

I did consider swapping {d,m} with {max,def} so the logic below reads:

    if ( ((max->feat.raw[0].d | def->feat.raw[0].d) &

but it occurs to me that because the policies are now merged, I can get
rid of all of the xc_cpu_policy passing and use cpu_policy instead. 
(For inspection purposes, we don't care about the serialisation buffers
on the tail of xc_cpu_policy).

It will be a slightly larger change, but the end result will be better IMO.

~Andrew

