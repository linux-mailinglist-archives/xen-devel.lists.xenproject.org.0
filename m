Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF4697BF1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495955.766423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSH1m-00030R-If; Wed, 15 Feb 2023 12:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495955.766423; Wed, 15 Feb 2023 12:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSH1m-0002x4-FQ; Wed, 15 Feb 2023 12:36:50 +0000
Received: by outflank-mailman (input) for mailman id 495955;
 Wed, 15 Feb 2023 12:36:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSH1l-0002ww-L8
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:36:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6784aceb-ad2d-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 13:36:46 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 07:36:38 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5331.namprd03.prod.outlook.com (2603:10b6:a03:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:36:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 12:36:36 +0000
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
X-Inumbo-ID: 6784aceb-ad2d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676464606;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wgz6eA7ewvfoLa3ktw+QAFC6Xoz+7XxObOEaIhKwdBs=;
  b=g1pe7G2KYmeFH+wZiMetRok3dAtkp2UF0/D3PvgF0WrkC4RmPuxWKYwY
   NJSfLnbGuZHt22Oh4Rim+CFt5sknDKd9aDiCfR7U1/JOlNsHhNvw6WzS3
   YaAsNpWrjiqSR+kv6BCns3gtBtgxIc6pVBF3RQFkYg3Rjx+IBHIT21mU3
   g=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 99554142
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1rS7D6M9wbm3CXLvrR2TlsFynXyQoLVcMsEvi/4bfWQNrUpw0jMGy
 2FMXz3UaP6MMWPwKNFxPYji/UxQ7JLXyYdiGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tctITp//
 NklET0uNA6Buv2K/qKUWMA506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eezH6mBNtOTtVU8NZTpluO/30wVCEocl/mht+1qEygC9R2f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpY9U8uMg7bTcjz
 FOOkpXiAjkHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRt3jX4iIQ6jxaKRdE6Fqew14TxAWupn
 G7MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgPpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:yRE8267BJ8XZIdbwNAPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRMdcLy7VpVoIkmxyXcW2+ks1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="99554142"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TidWqDTk7Bnp5M7fXjijXTOiscw0Fd5ztILHUGrYzu77qm6EYlKqSasxAvaDiOPoeOE39TOrfj2FL+z+Hf7M7396Tkb5zWCFO7FBdy7FU8i+2jY660USIJLFHapOF++aHQF3qrk4KIrM96/5Gm4zcI6+0PitpiG/DL6DEIEil2GF+q7slNv44jC7jR97lPK2jOYFMBNlolp9ieNzi4h3Upr+B/7s3ki33bvJOUowR0AFncKxQX7JgHpTSCeYGMWcBb+J7diRNrEpIH9RIMm7ElS16PouoK4RNDYZQ4BXOcIjdiQN12dBTa0hpQkjCqryaDsN5bC2D0xpt/koCfpi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdSoV0etH00QUEh3gRB5Nk8NYqeA69HbB/2V4j5CNwM=;
 b=iM+LwfhYpiTC6VJBnzGb4gqFEbgugg4UfXvp9e36UCRUm4Ne2aGbWsrNQN2TnrWHFzJ4wF47VqupPJ0Icz30LpuGEc2AQe1W0IsS9uxZ3WcKJIcL6jzFYN3GHCdfTkHKxrFujm602KYFDOvuU4sWllx36oV9kgzZYv9FGzIP5bxnDowXFcc56Yfdaym2ZhDO7lsQi66dgSjKqGo0+KEEqszXHjD4RqdCYQuFCcfMHIZC99rA5i+sDGTE+KyE9Al+GTR/pzDvRwPFeuR9kilYUORPJOlzEPcMTbfsEMtOEqaZqvqd9PUk7zZlPMD3rxAuwsEFckNYoMkyqNAHnT/4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdSoV0etH00QUEh3gRB5Nk8NYqeA69HbB/2V4j5CNwM=;
 b=PbnPM3b5NQzROuxH9a5/e5nyEgwZnbEoJVQ+Fv3aRo/lvHD60OUatbTpKvjPWczpCawRsslJ+LHmNX4XQqWavkyvPH1rFV0i7/n5SYSWo3hvHNte/ok5QjFfYwd00rtz/3JESfSAZQzhgJDB+ghpc5J+oZG7IwoNt0oPDNsTCy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <949bd6fb-a6b2-71bf-7eed-374939b54fb4@citrix.com>
Date: Wed, 15 Feb 2023 12:36:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH 2/4] automation: Ignore package authentification issue
 in Jessie container
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-3-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230215120208.35807-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f6e45f-d6b5-453a-d563-08db0f5146cc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x/aU2ZVkleheHlvkwdJYehX3XyIGYmDf93mz2phWvw/qfIboljFlWhn8bljXzGlwve6LpjcSe4oNsTi1CQYrZznAaEc/ba6JQTmqmTF9lCdaCSbQKXbGir1qYfYMZSmCjKYLIe52uHZLoWds3nPXP12Q57K1gYpqJcPpukD+FtVTPGRjF38kb2fAhszF4pkG+Oxhe/56zWuo//E+K5diDC0bJadNB9Q6N18xVq3WEEAqj42rPXnBVQdNL4CzmIrIL7pSTA84WCkmXPMvPIWNCS35ji63EefAqP5jhRB2S4oYSiMtuS6xjIRkb1Dlk8OZKs2QGN5i68a7URvJbmJPRBR5wpz9XxE5PPGox2WVNzrWc0UVaBSJ+smvD/EYruLNSxT+7o9qD3wTlFgDg0rIUo0ms6OPXrf4ssaGNA0HeNGW7fwvFa1IvsKcG7Zlz3q/WsSIfucb+mXxJmjUzD9/n1Cgp9lCf+R37kl+kwQZpuEf4mqOShQ3d82hHotS/Scz4dqOd1HpaCO17zCYjGYeY6ajScI0Vr3WoMmfMee8dqSJtPNI/mQboRcPfx0HpIVzu1/5lo7zTASWQZi14/MlTjtXArE+nFeJCVl+g1O0BExFEjz83dK1HHyq59RDMoGp2ro462pr7JahUlR4rPGAi4U+DDPuTl3Lgs76WGx3bURdkcG/osW7kHHwInF8Uo0MH476HHmhkA1+UvGPbCnsfSgV0yuDw7i2R5JAXtujNDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199018)(41300700001)(31686004)(36756003)(66946007)(4326008)(66556008)(66476007)(8936002)(8676002)(316002)(5660300002)(54906003)(6512007)(186003)(26005)(83380400001)(6666004)(966005)(86362001)(82960400001)(31696002)(478600001)(2906002)(6486002)(2616005)(6506007)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFVSeGU2UFdYQmhhTmlkTS9lRWxEZEZRcGlJY2kwczc1NlpjMVV3bTJNWFRh?=
 =?utf-8?B?MUZ4TXQvTit1aFRJS0tzakE5TWRtSDJLeXpETnVoODRiZ2Y4azlYWXRCLy9W?=
 =?utf-8?B?alFHN0tFbnBpSzE5YWZnRnpSNTNWaThSRWVaU3Bod2E4ZkNjdUU1MlVCck9M?=
 =?utf-8?B?QitwOFYxT21HUkFaajh3cGxWeVloWUpZVTlmRjNMRnZlcjBnWUxaa3gwdEJ6?=
 =?utf-8?B?RVZ5RjE0OTdZZFhiWjFiN0RjYkNYVXBKQnFkN08zUDdxSFpmTG1Jb3FYbjFM?=
 =?utf-8?B?ZUFnQUlRQjB2TU1LOThCZjVsOGFHMTRoZEJmNnYxU2twK0dVR1FrbTNYVkk1?=
 =?utf-8?B?Z24vVGpaZlNSbktqMVI4a3UzM3h4V1ZuQ25ISHdOUTZGWjhtYzRhTnFTSjU3?=
 =?utf-8?B?SzhMa1E4TjdIcW92R20yaVgvVWhXaDUrSXhiOUZpMlNVMVZPbTBBUUJQMGYv?=
 =?utf-8?B?VmlsWk03ZGpndWFoUGJtTVV2Vm5IV2JCWjVJbmFGZHJvWFRtaldxd25JK0pr?=
 =?utf-8?B?TVV4N0NvdkVNSTF1S3Z6MlJ5VGRpaDYzYkUycnB4Q3pjTXNiazdLUXZ0QkVq?=
 =?utf-8?B?aEcrU0U4WXMrd3pvU0E2SVFzWXZtUUFGYWtsd0JyMVpmRE9FVTF3WTdOaVRY?=
 =?utf-8?B?YXRxM2lJZ1lIR2hnR0dIWnRYTTB4aUNmSzhBL3pEWklGQ0ZYR2kvazZtNWNY?=
 =?utf-8?B?NjdhQkU2ODc3Z1Vwa2U1SFowbm45TzNZSEM5T3NQRjgyZnBmSThkYUUrdEFW?=
 =?utf-8?B?bDRoQ3dDTFFxV29keXdHNEJ4OTNYSDBYUUd4NEpXa2VBWURxamxtK3FTVDVi?=
 =?utf-8?B?ZjVyRVV5ZEVGKzFWRkUwNUlLR2RiS2wwOGEwemExanpQdmczbTFHbnZaaGJ4?=
 =?utf-8?B?eEdJS1BuanNqQ1BaNCs3VnFGYXBjMlUwVytDTmNuSWd4MGtRaldhL0MrdEtO?=
 =?utf-8?B?aUJWYnJUVGFnRVJ1OFp0OEVqZmZtWGZFS0Z1akJGekd5OTFIamFkQTkwT3RS?=
 =?utf-8?B?b3d3Q3hMSGZRTFRFdHdjR0hJUnRnUE1OZExRVVpMTGNqR2dSNm9xN0NTOGJl?=
 =?utf-8?B?OEdYOHVzR0pZUjVabkNTOXNpVkFUUHFGRThnYWh3aUpITG9ZU3puU0FnSnlI?=
 =?utf-8?B?TG9TaGVvbTZRejU1RXZxbTlvU3JPOVczSld0V1h6T05POFBJbStGZlU5ZlQ4?=
 =?utf-8?B?MnF6MVFBZWFrd3kzWnp4ZFJHTXpQVjBuUEwwNXd6ZW5FNmIxckhFdU4zTTBH?=
 =?utf-8?B?K3RhUlN2NzkvWGRvZHcvOHp3bUZGeEo2OHl1RlhPR3hLR2FJVGtKQndVWkxF?=
 =?utf-8?B?Q2M0bUtldVNVZklLaFJCKzNnaUYwamxSb3NWK21yWE4wdThkOFY5cTd4ZXgz?=
 =?utf-8?B?YXY4UkRpVE1YOWhMMVZ2TjZYZm1RN3lXd1F0MXhBZzZQUUR0ZVRzeFp3NlV1?=
 =?utf-8?B?aVVBOHVkYXFyT1hRWmNEeGJnbVpUUmRJejBJbG5ZTWdFSVozcmVBa2VYb2lK?=
 =?utf-8?B?TmdCVEVoT2NzT2p0dHM4ZnBtRlhIZUEwV3NtZ3l3QmM0dmMvekNLYm1jdS9C?=
 =?utf-8?B?ZHJVM2Y2VzB2cHE2eVloRVp5MVhGZkticmUrQzUyUUg5VjF1RDJPaEdVOWdH?=
 =?utf-8?B?WUFjUTI3R3c4VDF2bGNGUm9DNkNURm5HOFJsNVVlY0kyQjdQcWgrRlpQYVM1?=
 =?utf-8?B?YU5ZM3A0T2E2VUtsdWxnTkNvdkJUVWZ6NUh5OHVEdXh2dHRpVjVSeGFmTFJW?=
 =?utf-8?B?ZzRzK1pieVNPWnBuQVovcnQyTGdNczZYdFN1c2JPdnBJRWthSE8rWFZMakZ1?=
 =?utf-8?B?Mzg0R0tYQkRkZElxWWd1N3NhaEtZZVBnd2UvSXM0TTVScERiQUgzYmVURjhS?=
 =?utf-8?B?UitVcWtINTI5M3NPQ2k4cmMvTElrS2lwSjh6QmNvUUpiVDM2S1JNVnFCVXJ5?=
 =?utf-8?B?UmNidXRralUzQUphU284NDBIb291eEVHMS9JYm9tdkZ3V0ZPZGdYSFk0aU1l?=
 =?utf-8?B?Y09IWDJjZE5HdUVPTGE1dzdrK1llakRoS3NEb1hwTlJhVmFXYUd0TXZCVGor?=
 =?utf-8?B?cE1CQWR4eExGYm5jZG5FdlZUcHJuekdlN1lPUCtUL20xa01aUW5TeEV0b1ZY?=
 =?utf-8?B?cHRIcDJKV1UvcHg3SXBZeFcvaWFwWlFZOXBQaE1vMURrWll2dHdkZUNMYlFy?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NuQyrOYd6OCDegkEIN56ByT/jmDLfDzXP2YyfmtAwV8b1B+B4hPlycpd6ZO6vkJ7YoVEXUbQIkI/rW0JDbIa5BBO1oRBe5wIAtHbX2UPHxTDDRjIWuTNUWhGZQyOZWyogWFpLu3RutS3mOMdfAjZ9h8kPZaXDWYqSWD+JJb6BwRaacgFSTxBvnv+M/WKSCEu5Rhn08l2yynGUArhq4lkqR8sor0pE5f1q2Avxjzg2/3pDYnVLRl3ZbeBFVdqcYOxyNS8ukD+GnrXlCXwEKxbmIX2GLnmwS0UX+b8PWp3R3owNF2CnVG4geV+Ho5gHz05jO/OQZKU0EjX439hL4l/4S8vv/5EHPQRp9zdYfdry3M8Qne5/VW4BLRtk0kW/thzqcyDReGDAIsBQ5jU+ku2Jdp58jzwory2lwIF+6M7Gw1tUAdRmtIoRB7YbbkaFmCuWk1YTtLix9KbgBsYPEDCZdgzs27qUsBSjq3PYLqMphcXwOE3DQZDDPz6hU2s+XOUf4yZh8H44FNj9OximbZ/XtFdIVmEO94rKWfhglEAUlopUp95/wfXstmv0YpcTKg5vsvaYaLPBXt2W0Adhv7WDElkQikjZxpJclJBtm/Vias+9BrqGevwDmXsb8yXlOPLizxBgvssMNk0nJnKkFLhAPsiurvcq/wivyIKlvh3enrzg5dq2muO5CvcZQXgvI1Gaj3RAkBfLSySHUm/5hS+9u62dmdmngIAKayWcVyYaKrM+kOxtFHZDji3j94rR2vzQjsQv19P2X7rUmhpaCpSAPgQuqs6WzJxKBohxYtG+F3C+EBBluVDB7GLu1LEsoFFCKG/HA4GT0XE6i/sktfiVg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f6e45f-d6b5-453a-d563-08db0f5146cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:36:36.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diqEL67draGF7fKRffBLDhHv6VMjFPifzEwpgQqOdx/J1whOd8A283f9jxD5zYsjDzZITFjPV33jGUaD1MBU9T4UeIm9DuqrthOs4yGOKd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5331

On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> We can't easily install package on Debian Jessie anymore, the release
> keys seems to have expired without a way to get new ones. We have
> these warning:
>     W: GPG error: http://deb.debian.org jessie-updates InRelease: The following signatures were invalid: KEYEXPIRED 1668891673
>     W: GPG error: http://deb.debian.org jessie Release: The following signatures were invalid: KEYEXPIRED 1668891673
>
> So, from now on, ignore the warning and force the installation of
> packages that can't be authenticated.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Or, we could just not test on Jessie anymore.

Jessie fell out of support in 2020, so its certainly not reasonable to
be testing it any more.

But on older branches, we do want to keep it around, so I guess we want
to fix the containers to still be buildable...

But is this really the best option?  Some googling suggests that all we
need is a properly up-to-date debian-keyring package.  Are the jessie
docker tags really shipping with a broken base package?

~Andrew

