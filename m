Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97063776A90
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581363.910034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTqD9-0002uW-8l; Wed, 09 Aug 2023 20:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581363.910034; Wed, 09 Aug 2023 20:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTqD9-0002rk-5c; Wed, 09 Aug 2023 20:55:19 +0000
Received: by outflank-mailman (input) for mailman id 581363;
 Wed, 09 Aug 2023 20:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTqD7-0002nd-Uk
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:55:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09bdf0a9-36f7-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:55:15 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2023 16:55:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5938.namprd03.prod.outlook.com (2603:10b6:303:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Wed, 9 Aug
 2023 20:55:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 20:55:05 +0000
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
X-Inumbo-ID: 09bdf0a9-36f7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691614515;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fJuHu8NqLd2az+NUbKq47zdtoWIH/ARDT/1veQidzZs=;
  b=KZRK8zrZBvXO2IfLMnV417E90owtkUE2arXyYqHrPiyucddxEdNb8XZd
   kK4W6mxpyYtnCHWsjg2LLJELq1gfuWuRmaCDtZGGmd+imB1+oAsjPelKz
   G2Xn+yONWI7u7GK8SiMviHHDcFv3tSSgUpXOzT1sQ5P9slK1IOHNqgqfY
   o=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 121700303
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YLpS2a7DqB0R73jbc3VdVQxRtKnGchMFZxGqfqrLsTDasY5as4F+v
 jAbCzqAOK2MZ2PyKtBxaY639UkHsMCEy95rSABspX0xHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAT7QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 /5JIhwnMza6gM2SmJCXabc33ekMI5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+OF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtITeLgrqUy2zV/wEQXA0ZOc2DgpMOV1B/5fP9QB
 RAm0Qkx+P1aGEuDC4OVsweDiF6JuAQNHeVZFeIS4RuIjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+fqja3JC4UMX5EYCYCRAQI+fHzrYcrlBXNQ91/VqmvgbXdGzv93
 jSLpygWnKgIgIgA0KDT1VLahzOhoLDZQwhz4R/YNkq+9R9wboOhY42u6HDY4OxGIYLfSUOO1
 FAultKC9ukIAdeonTaUXeQWNLiz4rCONzi0vLJ0N5wo9jDo8Xjze4lVuWt6PB0wbZ1CfiL1a
 kjOvw8X/IVUIHahca5wZcS2Ftguyq/jU9/iU5g4c+ZzX3S4TyfflAkGWKJa9zmFfJQE+U3nB
 aqmTA==
IronPort-HdrOrdr: A9a23:rqpfX6tW/fQXk4Y85cCGx0UB7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-Talos-CUID: 9a23:GNtpkm2M4ZkQLzT17SVUP7xfOMJ0eFH3kVHpJGCcUURFa+POEnK/9/Yx
X-Talos-MUID: 9a23:9nRbwgZnJJwvkeBTszS33BdZb8JSz/r/T2cgnrtaieKnKnkl
X-IronPort-AV: E=Sophos;i="6.01,160,1684814400"; 
   d="scan'208";a="121700303"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+OpxoCU97OqkkPLAQvtXbtneEcIto+H3XZZZ+GUyq6CVWjmew7YBTw5SNH5aoU2PjY6eodalcR9fNQpk5s4oxhpkzuqRGjtKX6XsDPi6Scb59vuQmypT0NPlxgCp369Sh/WFw4ZTl1rXeb4ITwXqe+8YWcexiOZAG3xMItgfItX2+gfelPTZ327WU4v8gjgJtpW2Z9Kji7TdEbvnTgcwV3RDrZq41M2Q5Y3M28HaBS3XAPnI9rEST9x6YpmxkDMnQsj4/hLni7hR6eIDeDxC4Dms/k6yWyqJRzlGe9R3AdiaokVQiFHswIm1fGr8VEz/KT7VPx88ookJ/GPiqgJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJuHu8NqLd2az+NUbKq47zdtoWIH/ARDT/1veQidzZs=;
 b=aEnLWOn4MkqRJhQbzEb2v01DBYO6jjruIsMlw0/Qf0Nn1vgNM946vESI6YnJN3erx0IEoLgHx4F2vnExFRJtrDI52x62skUgDOV5BRBPqSdFIJkOd0gO1G1YW6x2s01+LJQTYMDrQhCDOfTzjbMeVZJgf0uzPUu71Ia99z4yeSVopSfGsUVtfFr0gO3AvWvXTtxmdDN4gCsvwyUuc32ujgvXS8BUJOnQAC6gnX0jANxPvN3RI6Xv0vZQPjUj/Uq+OyWqyP1zVMWie6HOyZ49tVdIzgHN4nNCkMKzxCRcRASPYNCvRFPP+5RMyJDslmx7pL9XbFMMtRJ9eUQ1cgSb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJuHu8NqLd2az+NUbKq47zdtoWIH/ARDT/1veQidzZs=;
 b=C+yZJlmkARBWrcklJ00A718yDXf2aes+TGUtHv8+Rpz0h/dFwo4mTm26uP6a1AKIQ/AkxL3BBZhSQ/8mB+aKMajAimoQeYU3UpFT+vwHYl8zE8v+MZeAesyfSToUd72Sf7vyeeFC4TzAhdW/Nm3AP3v6kwsoowAiNkuLsSb4iMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com>
Date: Wed, 9 Aug 2023 21:54:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d9b78e-d673-4cb6-583d-08db991ae84d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kDWHdpIqZklk1ortUTwDg2l8rxGlsYqMnw8F8+J8sz7xwChzJjEkBJFBc1IbBuYNwHWRAvSGvDED3FWXR+vUdFgUid2AXI/03KL8cTMlGTgScMkcd49gLa4SQwJgIAfUjLYxww7BoyfOCpDWpIv0ejJ4GpuDbm3NsrSTjmgxs9GFUK8ToqYJ/v4NAsjYMObAAtinXKC71crXnw2MNBhGScMJ65s7FvOH9t40Zy7pd80u0i18JluIYoepUxhMgOaR6etMV7tfDtZLP6l1ww/uVTitAGXzXnas8xn3VCkNENxuZZkiMXEbCku6MbzHAU0IcitihFdq5gUrL0fs7C5li6oHoRyCcymS4G/ucbK+IhdAsFjC3i1SrCytRmMVHbYSXyaEHnBjpsL57opYfaFPi9JRfA2nNIjBV0qD7PwCIwVMUIkOnSHjGm+XLuxfqSVTN7px2O7Yff4aVmy1IA5UFvL0V28Tzbqq7B30DlwSd1ayUZugPNu7jKTiskI0hOwpGXRr4gUD49juFXCovT2TCiP6yM1/MgQaytXK0IcyZJExX1CMs7JiaWZ7iOmpHcr4xLA3LQSp/jfNKseLRhAI8tS6/zoQ8vZIU2BS8rOE1rUMdfU0em2VbxaKZjHUCYrbKR3fNYswJp/n5s711EpewA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(186006)(1800799006)(31686004)(8676002)(8936002)(2906002)(82960400001)(4326008)(66946007)(66476007)(66556008)(478600001)(45080400002)(110136005)(54906003)(41300700001)(316002)(5660300002)(31696002)(86362001)(6666004)(6486002)(966005)(6512007)(38100700002)(53546011)(6506007)(26005)(83380400001)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3JRSXlBSlFWZGVUcWptZmJ6YUhacEpkNjRHbUZjRkhzL2tTUUpaU1UyaUZ3?=
 =?utf-8?B?OUp5T0thR2pnTjlhM004YytRTjV5NmhjUGM3NW9MRFJOQlNSMmE2OW5PajBz?=
 =?utf-8?B?RHJIZHdWSG5aR0ZrRTN5NEVKMWRUZGFGc0gzRi9hVVRTTUNBNXdnWGxYL0lT?=
 =?utf-8?B?SjlkSFRHS3N0TU9za3V3TTdiOUlrZjhPRThDZXRVaStCKzB4Q2wzQzVrQjBZ?=
 =?utf-8?B?OVBPZVV1OU5DL0NoQWlYNkt1dGoyT09EdjY2NHJGbnRFbU52c2JmZ1lYandO?=
 =?utf-8?B?cksvZmYvMThCa0N3YUhGNFdzUDNvUzc5c0RVdEZNZXZCMStxdms3ZUpMSnBl?=
 =?utf-8?B?dFdCbXQ1VUY1UWFOKzFYdjB1YXJDSER2dTFWRnVCcU5BVXl2aytycEF4MWg1?=
 =?utf-8?B?R0RpZWtLSEczb09jcGFzWFFUcGZsUVBaVi9rRkJSQkQ3cmNYMXlBZHhIdUUv?=
 =?utf-8?B?N0h1RTYwRlFUUGdaQmlpelAwYXhwL1IwOGhsMS9JVmx6ck8rejl5NmZNMXJi?=
 =?utf-8?B?a2RrazBuYTRQNXNhSDRwU216Y0tGeEZNL29EaEJYeFczWUVIQ2VYVUlsU2ow?=
 =?utf-8?B?TXlyc280Qi9yN2NKaUx4R0R5dzV1YjNvdzJXeEwyUXlYcEg4SHAvbUJhNDZO?=
 =?utf-8?B?eUdyWlZaQ2ZrS0RSR2k5Y2Noa2xTRVo5ZmtNb3NBL3JJSmJ5eUhjUXQzbXVU?=
 =?utf-8?B?cWExZjFidnBmVUZXVStWK2R4V0VaMjFUSGEvczlaeVhqZW13S0ZQcWdVaTJm?=
 =?utf-8?B?RGxWaTFnS01JU01yY0NvTXVwNlJEYWlINUlUMUhhNDZOWG55SWJDU1dqbU5N?=
 =?utf-8?B?b1Q0Rzk2azY2Sms0KzJuYU1TNEFmM0xTSFBhYk1vaDRBOTFOQ3RUK3B5em5D?=
 =?utf-8?B?NXl2cXF5RlpldjF1OWd2S2g3dEpZNlppemtkU0hUNUl2TXFUbnVXZ0Y4aTBq?=
 =?utf-8?B?WFozZFExaVh5SW5BakR2SldvVXJOQzMzbkg5YVN6a0FUZGRxQUpsYjROREVB?=
 =?utf-8?B?ZGlJL015czNSQUQ1bFlYUFR4ZnRBVGNENW1zajFub244YlFHU0czMHEwd2p0?=
 =?utf-8?B?cENqOXJLMVYrQ0czWm5aTzBCOGJIRTZia3l5WlRoeVVSSlNYaUlZQ1V0RjZ2?=
 =?utf-8?B?Z3dpaDd1aFJDcEhRZkdybDFaWlA3RTN5UjZSa2QzUDNxN25oZGtZSE1JWjE5?=
 =?utf-8?B?aTBRSVhQbWRjTzFTWnVBQ3J3R2hYaWRWVDVvWlZSRDBHTENWbmRIelM5S2E1?=
 =?utf-8?B?QStRNzNnTTdGMjBCTFNwU0t1MXB6Y2xnQ3UrbllnejZXRlQ1ZmpOM0ZJOGFK?=
 =?utf-8?B?Q3NKdXNsbmlCOWEwTTRiNXZDNmlLRzdYOTFtY2RNSlFuMjVZU1NIL1VnWmJq?=
 =?utf-8?B?a0kxWW1RSmptbEdCd2Q3a0FNQmlqWlpPY1dMa2NpSUkxTmFObHM2WU9kckly?=
 =?utf-8?B?N1UzbytqR2J1eHlKTGM3UFhkTWlCRFJ6WVNyZGRvLzN0VE5sQ1JjdHFlcENk?=
 =?utf-8?B?enR6TnR5TEJIcU9iSWNSR205NnM3VHFUcGg5Zm5PcFRsS2txOFl1a0dGdXpj?=
 =?utf-8?B?TkVoL3QvcG9RZVQ4eFdlMlF6MHM1WmM3eDE0M3NtMnFLeTRKS2p6MTdMSUFQ?=
 =?utf-8?B?RWovTkFxai9Lc1NmNjB1ZWFUb0xJYXZRaXVzWUZMTVpGdnFXckQ3VWFwR1hN?=
 =?utf-8?B?NUVheFdCOGJNT3hOc3d4d01rdlhPYjg1N3hFWmNaNWxucFVQdFRiNExDM1gw?=
 =?utf-8?B?WjE0R1MzeTlBVUVZbDl0SDJIRGdCc3E1OUtuNHNyY0ZlcFh3NXFYb3FvZU1u?=
 =?utf-8?B?T0c3SmZWVXZiaXRzcUt2UjVGRWF2VGVxNEdNdmhWeHBtTHEzWW1nSUVXTS9o?=
 =?utf-8?B?bFJONUhxSkNZR0Z5dDB1dG9uTFEvZ3VxdWN3VDR3MHR5cko3TWFubitJQVRW?=
 =?utf-8?B?Umd3bElNQ1NQTFpacDJGeVJ2K3RtS2pnQVEvbmFYTkd3ckFQV3hKOUkweE9o?=
 =?utf-8?B?UGJxTUtQZmMzMU1MdlFQOUdEak8wQ2lVZ1NTMkRIV3dHN3VPQWloWTBzc0g5?=
 =?utf-8?B?dEVZVkQxQ2ZkUUlwMHZhcXdBT1QvRDk4ZGx0YnBxQlpzclFUMHZYREROZW1D?=
 =?utf-8?B?ejVXamVQeWdjU1p1Y0QrZ2kwQ3BrWkJIdTJnTUE0Z0hJR0FOU1dJdmg0WjVY?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6L0SK6oEnNwOpTG8b9oCaFnN21p8HRRGBpb8DcP0l5bQt2+jJxpQtrUBgPcWNF1PgCX0PpuIJzFuCSZdeTlJCPjIudCExbkeNhhGy33vCT5IdOn1bV0wCBTLSPPfkZqFRcyH70MDSVn1F2cZroingNtU3f7uWINJni/7p630Fhjj0MamZWT6V/ci61+ZZATd2x179DCGkoDi6TDR1gOpjQgOOisX1Aut8PVcj8ncJt2avdHdMDIifZsCLIDPmt7jPzuB5+KN6tUv7eUKh77H1xZvFxOTY/FjUYSmZJDTmimlc3j798MpavNlt0wEdZDRAX1tyNc+K3xbVrjC2WdN83wiNWStsoKCJxD63Mi61pv44+AmVEKgDh/CMIKOv0fi2Ar0jFKePwoNIuNcO0Ut1tHh4nUMGyJRBMNz9j5MxcCNM5ZWo6KJUdZZ8j3ptQIu9E/0JX6VQ6Mwaq5a9Ak9UyNW2Xtvi0zkUt5db67dG3RHKIlpEbYR7PBszbZlggIHd279PTMDVvf5jllvM5kkV7TTtF4ay2RM+3gVfhXYI6C0OCOgUOLSlqwwR3Nlt66QVHV9rdMw2/A9Zaun84EZpNOPYqNGOhfO2D3I5y1vrmBnVAE9JMfaS03KHSkQ+opprPtd5YveGo+whT7h7nuRuxbHBonPndoVqVn5qbw+iOEIdKXHG22QPqumDRv5u914o10URIA5r3ne3t+B9xWj0zW+aLhmcL3YhphDIqsE/ikCvCRPcTmgWzb06n5ECmEbW6QaglOhpjn07NW8BU2tR2yeg/CWMh+uqgJID9w1mnXqisO9Pd4ZEwLarDOSnF7Uc2HPAB4kr3uBR9g6xnPhsFArqwdjiFp2Ih6xRjA5GZhW9GNThqswu3zUkExpUreGnSkTaCWunZojDdeyJOPj2TMBcXqVhqrWXAvMKL8TzDk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d9b78e-d673-4cb6-583d-08db991ae84d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 20:55:05.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/kShmj3Ov0427yxnTaRWLTjHa/9v9YMARAWW1XnyHaS2wKtr7gaCHb1mhh8bPrfCSJenPHssRULD4TRKHiUn4duDfislX0ymfz0hzadaUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5938

On 07/08/2023 2:24 am, Henry Wang wrote:
> Hi everyone,
>
> Following the release schedule discussion in in April, I am sending this email
> to remind that according to the release schedule [1], August 11 (this Friday)
> will be the last posting date, when patches adding new features are expected
> to be posted to the mailing list by this date.
>
> Also, note that we currently have 1 release blocker [2] which might need
> some attention.
>
> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
> [2] https://gitlab.com/xen-project/xen/-/issues/114

Off the top of my head.

There are still unaddressed Gitlab bugs from the Eclair integration, and
other Gitlab bugs (use of unstable containers) which I'd unwilling to
let 4.18 be released with, given the pain we've had on the stable trees
trying to keep CI working.

There's the XENVERSION_* hypercall ABI truncation fixes which is a
blocker for XenServer (I'm refusing to forward port a piece of technical
debt when it needs fixing upstream).

There's another thing on the back of Tuesday's mess which has
technically been posted years ago - the proper eIBRS support, but I want
to refresh and get sorted for 4.18.  I expect it to be an even bigger
perf win than the ARCH_CAPS work was.  But I'm not going to have time to
get that sorted this week.

At this point, I'm hoping to squeeze in before RC1, along with some
compelling perf numbers.

~Andrew

