Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010C3798268
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 08:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597811.932178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeV3K-00064a-6n; Fri, 08 Sep 2023 06:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597811.932178; Fri, 08 Sep 2023 06:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeV3K-00063A-2Z; Fri, 08 Sep 2023 06:33:14 +0000
Received: by outflank-mailman (input) for mailman id 597811;
 Fri, 08 Sep 2023 06:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeV3J-000634-18
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 06:33:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 947cee30-4e11-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 08:33:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7588.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 06:33:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:33:09 +0000
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
X-Inumbo-ID: 947cee30-4e11-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av6q5V+0oTi/zK/WQTHmL7tTP9Aix233H9SNPZAO7g4S2skWS0/e/WRNAJYxVy4VFXNAKF9NodSecvvAzEfH3poq8iLT5Bfj1d8IkLL4hnnopho/wzC4rkP9axZw7W8N7Yq8UbRDQz2Wy70GCGshO0dlakLxeBDQv6SRwVZ+CxRNZ37JFnYjmk5higMyGGkHaT64sf/VBkMB6UPHfsS4J4ppNvPQEMxErFxXVPzFymUmAowEYq2S4hvI4VHjqMNHep3wnwN/ZI3xia2QAZbzwPOqdnQxUpyjnrO/8gchYFFLR4QHxtV7xALz4ERRZLsOPNBdkQuRmFflFHEeuekbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTGfpXSxe47/I7+edLm9a+hrYhWpuk2AW0eMYbStwbo=;
 b=BYRdarUtTgCXiRGjgVS1mYkkyciqCRX6LN9bY4yGoBvikaye/X2YZVUgN54PcxApBpSzSiVELGXP9P4OMprGVhV4p39sgeV9FsnOjDZwHlwme0K4tSc1745A4D9F8RBmMPF4mCbRCCcM04Aa2/T2mtJDhfspv9QiML89WVBHUvk55GvfgrZYjdc+tea0qvrSZMcYo1tEdJU6xeshEfr7HZxk2E0Eop6LlvlgaYG96XeJaLBOR8MGjkmY2b3I05Y6rZC/Jd+t6zleNhf/0cRMkIFRdrwg92CnbixAJDSurNBXapbSV/WjTzAQ/F2zT9SpIV4AvwkQVUT9X3a14Y7GkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTGfpXSxe47/I7+edLm9a+hrYhWpuk2AW0eMYbStwbo=;
 b=K2aJu45Ph7gm1/wq5l3nenLB6fBRFqV7JqWrQsdSd3uTSYWtK6KhEzTumTx5yxgpvVn9oWEqo2g5buJ3Akv+BXvvht3xefuuyhRBZqAExM9U774GNL5huq1kE8fEyvmRR8UxixDq/mX4L7RnIACHTwK2o+u/Qa0xTLUQUBwMUkw9tLxSBpCEKnBmDOhUjTtilmWk2eOlbMydXt2s+F8TcwzkaaTr20XrKDSBZAl6aVQiLTd7hmQ+VqKqNZYZlzomw9cx+iBjDQoJ0QX4l5DJsrjJAxA3WLt7seJvb8WRh0HAxVc7tEfuF85qocw+PgB0CKE5fBmnv5AyxSFHFXDoiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f83504f2-c12c-c359-a1d5-8c20ce3de334@suse.com>
Date: Fri, 8 Sep 2023 08:33:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 1/3] docs/misra: add documentation skeleton for MISRA
 C:2012 Dir 4.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
 <e74433904abe30e2e9e030f663a7a87813dabd24.1693558913.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: bbca38a3-5352-435e-a7c9-08dbb035777c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mid/XGPgk39ZR6r+OW6hp8BaMZpwCOunA5LLQC8ssFXgOjylRVpC2i9s7ad7FR8jVg9JnXkVyYhDr5ps7vfbn+znozlzfNQAFOlRIEAEMCUSsOXI/OJPJ7JeAr5wWrx/IcHZXofpRqVh5g768FfToye/uUhzYz0Lg+N14pqWeqRWpPhxaXEn+298KIL80xcXc1KUJIES2heM/5jveBeQkMz2J6JZ+ZTOMrftgOLL1i3gG7Vo43cBCtlkaLHp5zDp5fybQ8B78Pw1NvKwj80RtEpocTEwG8Qs9ZG0WaKB+MXVdbladVLOO/lJ8KrPjz5Hey0SqeDx2B/ncoGw7XadXDYQQqB0i49SKI7O4IkPccbsI4XwCNpXApizEJwP4PDHBfzrmcpa/trDQhzJTnJhxLDt47ieK3wrHOSxWjmpz5PFw6BaREOYPsa57EsmS51cL6BSHeegwLHWpjWbTES9lUSdnTrx8Ei3T/p6zObcwh/qNfRmqUEQjutLgSYzkmTx9QXuF+pQ5cxNrOMMFy/scYRoVIrW+HnI6y1YSq1Ngr1YHT19IEYcqUNKzdetc/g89l/hNvxIQHSKxMuYVmemlnPtTn4UANqOIXEgmA66amGiU4BvtN53vUCye1F8GEfrrS+ZpnCvuuP+hZEGaOU7Xw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(1800799009)(451199024)(186009)(478600001)(31686004)(26005)(2616005)(53546011)(6486002)(6506007)(6666004)(6512007)(4744005)(4326008)(5660300002)(8676002)(8936002)(7416002)(54906003)(66556008)(66476007)(66946007)(316002)(110136005)(41300700001)(36756003)(2906002)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdQM08yL3AwZWxMT292VWNCVWZoei9jaU9JU21XU1h4RXM2N2R0V2JGNWI3?=
 =?utf-8?B?RWRLbXpseGlqTlhmNG8wMFdnQ2t6MGtvcmdvWkNjd1FDbDVqRWFTU0ZXYksr?=
 =?utf-8?B?V1M3ZmFDSkRISkVudDVad1NXQnA5eXFJVy9RMldTTGtaOEhCMUl2MmFwMWpJ?=
 =?utf-8?B?aFg3N21ncVlHdnlvQjRJN3QvZDI4alBFRUwrR3RDeCtQdmlzYmpxQXpQZW9m?=
 =?utf-8?B?bU9Qa3NXRDFRd1ZqaGlTVFYxOVQ5dHY4UDE4Rlc5aTdkSUNWNHE1R0xqQXRI?=
 =?utf-8?B?SDQyOEhPWk04amthQ1pkWnNZQXpKdU9zZGFvSWR4YlkxOHpRTXJEaDZiY1Yw?=
 =?utf-8?B?M3d0N2ZSZXNyQ0Z2MUdCMEJlNHk0b05ia2J1N2Y5ZkNsOUZwaVk0QmZwcDMy?=
 =?utf-8?B?UHlrcTgxWnk3VlpDUEFORTF1Wi9pRXU5YUwvWGduZFJBYmNPckVMWXZGbDBC?=
 =?utf-8?B?Uy9FWUJEODhHa1JmaGdxVTlNeHNpRzdEZUlFV1JtaTJra2RKeS85YmhMOWs3?=
 =?utf-8?B?aFRYcXpWQUZPNVVrbld4TVBpOWpIY1pPa1J5Zi82UVZ2YVFGclQxWmtyRk9K?=
 =?utf-8?B?Y2x3eitvbkRlMTZvMldlbmFmcGpERkoxdmMybG5Tb3FRbmxUM1RrdEJWalBR?=
 =?utf-8?B?aGhsSlU2SEtVOEtua3hoQzNKQitFRUlFTnptdzVKd3lad0V6TkJsMGRtdllO?=
 =?utf-8?B?clhIb1Y2Mkk5RXdGOE5vUmJUbkxRNmJaZEV6VVRyT2x0RFlkMGcvK1NGQnZG?=
 =?utf-8?B?cjYxK2VYNHArM3hqVXhDTW9pTksybGZNS1lWenEzdGY2K1VFUXYxbHl5UUkv?=
 =?utf-8?B?Slc4QkxBT0V6ZzE1eHNNYUU1Sm1kZ0M2eFNSS3h5ZmpxNjAxcU9QRG4zdU5R?=
 =?utf-8?B?ekpzZTNKekMxUWJaaUpWdGkzd2gyNWRHME1CL25LVFJqcU5FVDNCdmRua3Nm?=
 =?utf-8?B?Um9NRURvOHhnaGdlSFdXSm92MXRmb3FPR1Z6OUlaRFFyYjZlVDhBaVYzWWZh?=
 =?utf-8?B?S3E4RnNoVTBrQWdGY3NSdi9aeEhwT1V5RW9hbmNSelIzRk04V1g1MHRKVzFI?=
 =?utf-8?B?WFQ0OTBzeWZ4Wlo0MzhNbkZQWDBQYi9YZFkyVVQwenB2SzBicnEvSGo0OHVx?=
 =?utf-8?B?UCtZM0xYWjFpckRFZ0liN1FUcFFJWEl1MTRoNDJxdk56aVZGK0dhNkFFWG9o?=
 =?utf-8?B?eTNtSGpJcCs2YUZBS1YyT0owem04N3RUYzNKZHZudkpIaXE0TkRVbkpMZWEr?=
 =?utf-8?B?K2hTNW9aL1BjT2l4K01KaFBtR29pdWFpVmpZWmpXL1JUcTVoenR3ZXQ4b1FD?=
 =?utf-8?B?QWVzdFlObWh2dml5OE1wbVFiaDBKb0ovQVlhUW5aT2ZyeXE2RjBTK0w4S2hw?=
 =?utf-8?B?OXpaOUJGeGN4TXkxaDQxZTdsbzhZK2lBMExBVFRUSkQxQ2NydGZPQVVpa3Zs?=
 =?utf-8?B?MVV1MTdWT0I3ZHBYUWFJc3VqcHZtb2lnWHFKMHhNQTFNc3ROU0hEWlc0U2Qv?=
 =?utf-8?B?RFJGNUV0dnRIUDdsUlhQZFVPT2Y5YXh3SG9qdkpkMHdudGxrWlgvZitJd1M0?=
 =?utf-8?B?M3dFcS9GWDRKbCtvaktiMGFuZ1pqbFdiekxlT1htM2E1aXRla1JVMGxVV3BX?=
 =?utf-8?B?TFhNTURRaHJJcVBsYXNQNG5pbXI5Si9mSStobDdtRm9NSmQ0eXJTNXRpSXBU?=
 =?utf-8?B?SWlFUzgwTGJzeVBVMXF1UGhkRGg1SEJMM3NvYzRTK3lJZnpya3FrMVczaG9S?=
 =?utf-8?B?OTl3dHBoNzQvNTZlQ2hGdTBsc3VVWmVWZGxBSi9oQjloWXFFV01FZmRyQ1VS?=
 =?utf-8?B?cCtCcjFwaXRiWUY4NTVtWVFPYnhBcGNkQ29wTGtybjVJTFZRWjQ1ZmgyU1F4?=
 =?utf-8?B?TnE4R0gzcE1MNnVmK21pbmJmNDljeCtPeXRoOEZSRTJNdXB0cVlNQXY1K2px?=
 =?utf-8?B?WEMyTzRKd0xTQXd5K1hSQ0k2bmVoSGg2ZnJLNENkc2JCN25JYlI0OEEvRlRS?=
 =?utf-8?B?RndCaUdhVWVTN3JXY2J1SUJWc2NIbThiRTRsK01JRDJxSnUvcHh0NWc3d2ly?=
 =?utf-8?B?eVhpU0hGdzlKZ2tCOXN3TjNHbU9GR245QTA3NlVOd2lVT3RaOUJ6azZKa3BM?=
 =?utf-8?Q?4JuaA3LaWoboqAG3HhGOG/vLc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbca38a3-5352-435e-a7c9-08dbb035777c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:33:08.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKfxtAXYsP7RIvVBeQpg68CQXTDBTzvaxIHgCAKrWFoGxOP8+cHWU5nk/N5dhhT670+hpnBODvZ9qhUfxR7PQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7588

On 08.09.2023 02:20, Stefano Stabellini wrote:
> On Fri, 1 Sep 2023, Nicola Vetrini wrote:
>> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized allocated object
>> +________________________________________________________________________________
>> +
>> +To be written.
>> +Example:
>> +The code does not use dynamically allocated storage.
> 
> We do use dynamically allocated storage with xzalloc but xzalloc
> initializes the object to zero

Just at the example of this: I'm not sure in how far the examples given
were actually meant to (remotely) apply to our code base. As to your
reply - there's also xmalloc() which doesn't, and the page allocator,
and other more specialized ones.

Jan

