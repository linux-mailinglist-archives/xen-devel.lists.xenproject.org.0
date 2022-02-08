Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B44ADA9B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268385.462212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHR0v-0002fk-DR; Tue, 08 Feb 2022 13:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268385.462212; Tue, 08 Feb 2022 13:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHR0v-0002da-AU; Tue, 08 Feb 2022 13:58:37 +0000
Received: by outflank-mailman (input) for mailman id 268385;
 Tue, 08 Feb 2022 13:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHR0t-0002dU-Te
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:58:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9bc8db7-88e6-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 14:56:30 +0100 (CET)
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
X-Inumbo-ID: e9bc8db7-88e6-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644328714;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UAjDz+CA7RX42v8BujD8mln2JVzaqpwAsYZzWBfOkZM=;
  b=eqDvExdHsE1nls3vlW03M0FJFTEIL3KSvelFvHJ4XdWi8k3+KvkCQO6k
   hz1zqjf5ScpWWBa6s42AEtx599IMr7dr7vLWDfz/3NFMTQOauMBqQgIBo
   +LHVr3+XjkW/X7F0klK7ZmmwQ85aUPvbrQru6zXotRY/LeQdAN1B9+jlW
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +3fEt8S3We6OIAOWRYlfroOLn1jYaczmm9ruuFLT2mAbaOJgDAkA71wxVGqa3TnLFg+UyNLilE
 i/lGlSfCXHWogAT4tvjCfPEXvcBVvMwC0imnEEAvyRDCkQSuBnIvxFYqjwbX+zgVejyh2XHhN8
 LHEIK6H37uRUWFYH+NFZPlDPai6zCmf8lcLahHxBsas77CKX7hvU75NFjCgIThwInJCiNC/wrf
 LtVxtsR4t3zPg99+pmoZM9lNqU4tZji0fFR8d7jHJAS+ZkqZhrQ+U1PUu4c4dJi428aV6zr1Vb
 Ho5t/WuhXNjy0YqDVsTcyZB1
X-SBRS: 5.1
X-MesageID: 63644481
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qoTwU6tGejGu5yfVmRmw2rKMC+fnVHZYMUV32f8akzHdYApBsoF/q
 tZmKWDUb/uCZGWkfoxxaNnioEMHupLSx9VqSgNupSlmRHgQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YjhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl9qyIWFcWYYv1psNFbylFGDxRG/0W9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsQQaqCN
 5NxhTxHVVPhfRMWEW8tJpN9kLyMxXmmeWFfgQfAzUYwyzeKl1EguFT3C/L8YMCHQPJwj0mRp
 2/Y12nhCxRcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+TVKmpdGph0j4XMhQQ
 2QO8yozqe4p9UqkTvH0RRj+q3mB1jYWVsBMCeQ85EeIw7DN/geCLmEeS3hKb9lOnOgySD8x3
 1mFheTVFCdvu72YT3Ga3rqMpDb0Mi8QRUcAbyIZSQoO4/H4vZo+yBnIS75LN6q4jcb8Hz3q9
 BmMoDIjnLUYjcMN1KKT8EjOhnSnoZ2hZh444EDbU3yo6it9ZZW5fMq45F7D9/FCIY2FCF6bs
 xAsgNOC5eoDCZWMki2lQ+gXGrytofGfP1X0g0NrHpQn3ySg/TikZ4843d1lDB43aIBeI2avO
 RKN/1MKjHNOAJe0RexHW5PhNJsM9JbHTejVS/vJQfweMpckIWdr4xpSTUKX2mnslm0lnqc+J
 YqXfK6QMJoKNUh05GHoHrlAiNfH0gh7nDqOHs6jk3xLxJLDPCb9dFsTDLeZggnVBougqR6dz
 dtQPtDiJ/53ALynOXm/HWL+wDk3wZkH6XLe9pY/mg2reFMO9IQd5xj5m+JJRmCdt/4J/tokB
 1nkMqOi9HLxhGfcNSKBYW15ZbXkUP5X9CxnYXV9ZA/2iiJ6Ou5DCZvzkLNtLNEaGBFLl6YoH
 5Hphe3cahiwdtg302tENsSsxGCTXB+qmRiPL0KYjMsXJPZdq/jy0oa8JGPHrXBWZgLu7JdWi
 +Dwh2vzHMtYLyw/XZm+QKz0lTuZ4yNC8N+eqmOVe7G/jm23q9M0Q8Ew59dqS/wxxeLrnGPFj
 l3LWkdB/oEgYeYdqbH0uExNlK/we8NWFUtGBWjLq7GwMCjR5G24xoFcFu2PeFjguKncoc1Ov
 M1ZkKPxNuMphlFPv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY58m
 bUhtcca5haRkB0vNtra3ClY+37Vdi4LUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ3fOQia5dy0zOd2sIOULMhecN144TvB1qzUMZIwjbkNTymfJqjgZa9i46T1oJw0wfgf5zI
 GViK2Z8Ob6Ko2VznMFGUm2hR1NBCRme9hCjwlcFjjSEHUyhV2iLJ2whI+edukse9jsELDRc+
 biZzkfjUCrrI56tjndjBxY9pqyxV8F1+y3DhNujTpaMEJQNaDb4hrOjODgToBz9DMJt3EDKq
 IGGJgqrhXEX4cLIn5AGNg==
IronPort-HdrOrdr: A9a23:xUo3uKFTdSVPiDrZpLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo+VvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOul5Dt
 L/Q9FVfYF1P74rhJ1GdZQ8qOuMexrwqEH3QSuvyWqOLtB0B5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63644481"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoaaCyPS5Npe09IGiofsMcRIgbcdrrI0c8SSUosJVC8WsZ3NuEWuwxWuO6kCwP51NWko0KNkdHNOSnKsr10V/1LfsItJQwRFxGRmFK+6Gg2E5CD5EXTSrpZMZ4Y9j5nwMSwVoL3C1sqysfVqea2dB2nmIawL4TasMlqwJy5L02fejMepFg6YYBLV6w8kCIRQxl4sOP3BfNS43UHcfxuQEGTc0Xoej4+zxt2FP9tEU4DsjeL5x3xm65TikZ67hwoNp7fiBBUta/UIJUrJD3P6X5j+UL3N3JAg1wzxOhfVqNpw51QIj2/HqXKa07Tb36WJtZgdgTVpxtSKZX6EliQEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAjDz+CA7RX42v8BujD8mln2JVzaqpwAsYZzWBfOkZM=;
 b=PHob21JWSH0nXMLTa52+oC7veMa2OiMt29Utrubg1WI/vodxuyEflemicYWBOHu7wj6Y0IvolQyDYbyxYeTL6SSvnMMcg/jhgYc3XB0nz0b0wGUa+sJbAgAIm3av0MAasxw8s+YTrfGm8Njv0NcosS4PCj6SoUWruFWT/sTVchYvkQEk9qQrQVGeNBH4AGVHq+goOtiFlC1gEWOQj3RjQFK/aIpRkEMfLn2n20EONdc0osjFriNRwS3I2blCGaPbdfy2GEta9pwQucYW/zK9i5lh2K20QCKc34Nz0+hzJBnDD/NzsziBOm6Fp8PgFohrD1GOnxhAux8Mb3XVzH4uGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAjDz+CA7RX42v8BujD8mln2JVzaqpwAsYZzWBfOkZM=;
 b=td411PWWDNHJtxsbAS8BipVdbLYwYsX9u9x/fsPOIm/5XUqIrIBLACGoPU8bRG9pxOQGHr+EMBiK1EWSoUHFguvAG20td8XDYAlQZOpE7TZUNvOGR5honfHcrSa95U7o1v21gk5DZ/uNCBZg7JVatvu9oMzJTaFFAcXYWSJRsJs=
Date: Tue, 8 Feb 2022 14:58:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Message-ID: <YgJ3ACIeq3nn4D8v@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com> <YgI3HpFffudiEmNN@Air-de-Roger>
 <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
 <5bc96dba-e9b8-de2e-f6aa-ae6c604897e8@suse.com>
 <6ac5d7ce-96dd-66e1-c8d1-eff7b0a1349e@epam.com>
 <41552c52-5e2e-5108-ab37-d1fb5d9b5edb@suse.com>
 <a92fb9da-438c-dd59-e7b1-d288a8efa05f@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a92fb9da-438c-dd59-e7b1-d288a8efa05f@epam.com>
X-ClientProxiedBy: LO2P265CA0160.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0992303d-3edf-4c90-8a9a-08d9eb0b1610
X-MS-TrafficTypeDiagnostic: BYAPR03MB4022:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4022E6CC53C015A5C0E266908F2D9@BYAPR03MB4022.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AE2SKvZSvE6i8DuLHtxvGzoblkGFCnFQu5VTJxs2KfX/Oq3QW9DrK4dU8OEJcnmwxQ6m4prJStmqac6yXLUYeZIQIGMyVEvsDyTypqh0mJ8KctX5BXJ6ZidH2Lbq6QxlyF5PEMTzZCttmb+5LYNgxtquXIrP8U5UQXQG5EJ0jjcZLoqs7gNqqxegtxMEMP6fINX9zx1qDnu7b1PyyuO7FMd0gRuC16MJ6whwTplv6dV8JHPsW1S6ahs/SYuTwepIb20uCSid8veQ0jZDnoF1g/dFdzTrdWF4A+484i97aGUHJWYWtQuSYzKmVo5NIDzeS7MKk9FeSSkyFzD+h66SLXf4BilrDivycQlwRbTTkRrBEMBhXKLQViCJkG9IGs0FCDM9kDXvcFgqXA8nQH906LBar5lTsDNdyCyk6doAkKsRgA/FN/KckjNEKeKmyB8frF53CnVnEAy1i+CKnp776f0hIczs9VAyp8R1ckJkFuz88jkrWBCLSTa1DHmm1rvIzTMDx/4ruYgt65jXBn7FuDHi7nRNdx8p65Mzh5GgEfE3D2U3VlOIcncE+P5kNuqTeZj0xKf6O9u5yXfgJyC2hVXbl41dXHi4H6ynpuDSpY6N/de2m3N/uXBr77lMaFUKLJYBpVeth3O7XjeOsyLRYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(54906003)(6512007)(6666004)(53546011)(9686003)(316002)(6506007)(38100700002)(83380400001)(7416002)(66476007)(8676002)(8936002)(4326008)(66946007)(66556008)(6486002)(508600001)(5660300002)(85182001)(86362001)(33716001)(186003)(26005)(4744005)(2906002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZwRDFDU1BLK3NaVis1UGtJaklST3FBcVN4UDJWN2NSdTJtTlh6bWtaRk9h?=
 =?utf-8?B?SWIvWTJmaCtheGF6clhUSzlIMEFiVDRRNUNKVVdNTHFjbkd0Zm5POWdNVUR4?=
 =?utf-8?B?V2s5ZU9jSWxzZmZ0d1ZuQkZ2RGJSaUZsSnZGNDNPaE9Ud1hqdUh2blViendz?=
 =?utf-8?B?cGc3VUdEa3hCcVNCQUw4YnJNY0tlVlRKRWEwV3YyY0k0M3o5UkJVK2lhdjVy?=
 =?utf-8?B?NjhHeGJycXIrQTAyL3h1aEVtRUg0OGRiek9KRlpncDY5K1BteVplZmx6Qjla?=
 =?utf-8?B?UWEvQ3czSm9XR1FPM2ZPVS9HSWJ5WmNCRmdVaVRKeStpcVlVR2xhOGJsMFhO?=
 =?utf-8?B?SjZmN2pJTTBZSkpYMFEwWFJPaUhTWFNqdGtEOEtrZjQxcUV3ZGlORm9uWGxu?=
 =?utf-8?B?L2xNZXVreElzM3p4SG8rRWxFMXBZOG5CM2k5VFk1VHY0Uk9SQXJOZ1U5a2Nx?=
 =?utf-8?B?V3ROeWJTNUNrYThBaVorMFo3WHRLdlR2UjQ2andIellhS1VPWnEwa0Q3eElF?=
 =?utf-8?B?ZlAvT3ZSZ2VLY0FJZTZMckhldWRnQkF4Vlo4a3d4bU1yNytmSlRNL0NudGhj?=
 =?utf-8?B?N21HWUFLOWVIWE1hYk9ZUlc3SlJwZWJhTENlcnVpK1BvQjJwempXVzFvS3Bv?=
 =?utf-8?B?anNHaFlsU2djdlFJUS9HZW52WWo1NmIvZzVGTnBmc2JONkVJV2FLM3ZDQmNm?=
 =?utf-8?B?ZkM3Umtpem9aU3VWd0I1N2tPRUluU3hKcjkwZGlzdnhnVzFFOVBFUUw0WUFG?=
 =?utf-8?B?YWs1QnZzM1V0TnZiOE5NOUxqV2tnLysydkhKTTE1RXRsbnZZN3ZqdGx6bjF5?=
 =?utf-8?B?alRPdFJFUlE0cUQzQnd6eWRSQ2RSdndYTkZ1YlU1R1RHSmtwZlFnTkRJS3JV?=
 =?utf-8?B?R05ETHB6cTBaOWVJYlZoYVpRbDZZUDFzck5CR1dzUmJBZmlOM2YxazNxcm1D?=
 =?utf-8?B?M1VPZWNjUkxyUmJNRGl1aFAxemc4K0dLVE15R0V2WXBvZDJUVGxyOHBIZXI3?=
 =?utf-8?B?ZnVuQW1JZ0pkODdWTi9pTmJwYlVsSEpMRWIwd3B5am5YNlhzOE1JMjZJWDN0?=
 =?utf-8?B?M0JUYkFqU1JqM3VPSVBscTFMYkczVHBQazhsUlhQdEFOelRqY216OUlIZXNP?=
 =?utf-8?B?OHRXaWlkYXREcFVZREdtdWdCNWNmV05Fb0kyb3BidEdSSmxCenVXM2R1bGFr?=
 =?utf-8?B?VjgyV3RXb3FHTTlVMjNRUEZRWFlmK0ZLbGk1NGc5Tm5pWVJQakhabVBCcjll?=
 =?utf-8?B?M3Nwb0dhNXkrYW51QTN4N0l2b2pXTjJFNTZ4SXZpZk9IMk1UZlNqZU92V1VB?=
 =?utf-8?B?VjJYQkc3LzdWUzU0K2VGWDFNZkJwY3VHeW9rb2IvV3ZzYUtpK05Ja29tbXZY?=
 =?utf-8?B?cEx5S0txV1QvNWZkR090TXhJL1BzU2k1SitZVkxVZkZZNVBJZHNFejRVWUVV?=
 =?utf-8?B?emVoWDVKZUJxTHVCN25rem85bVRBMDdzbzIrV0l0MnNlVHhHY1NPZ3B3M1lj?=
 =?utf-8?B?M0xSUjJnam0rOFpSRlE1akNhRy9FenY0dnJ6bFhkd1J4cVN5b21Ud1BiUFR3?=
 =?utf-8?B?aWVrbFV4RE0vWTNmcVlTK1llNHBwMFNwOU5uM2Fta2h4ZExadVo3YVdKNTlB?=
 =?utf-8?B?Ty94bVhGNlhub1hkbWFoZ1ZOVlhuRGNaUmI4OXRoUmI1cFJkYnBsME5vUGcy?=
 =?utf-8?B?YnJLSTdneE1xaG9sTkNaRW40OEtBZjEyUk1iejZMSmlZRnRrOGFnb2JLOGp6?=
 =?utf-8?B?UDRpRmROd3lTV1hKQ3RVOENHTkg5UjB3NGljTFFUNk80c1RCWWVWYXlleEI3?=
 =?utf-8?B?QVBPNWwvMzIwcEF4Znh6MVU0eEh3UU11V1gyZk0vd25MOUxqT0o0Z3FVM1ly?=
 =?utf-8?B?ZFJRUDlTS0dOQWpVd3ExYkF2Uzl3Q01qN0NJbmpCTXI5aWJMK1lEMGRyN09V?=
 =?utf-8?B?QjRaUU9lREcxVU1JTkxHcXVXSFBmdGdKQm5xdjM0U1hqMFRKMEk3Vjc3UzFC?=
 =?utf-8?B?bnAzUmMrMUFrNHJLckZrRGRxaHVEcmFRRmw5QnlMSjNMQlBHUjJQc3ZqRWhX?=
 =?utf-8?B?Q1NRMDlwczg4eXQ0dFdSbmpSZmhOTnlQSG9wQ2lDUEFzSHBVVG1Rc3o4bndk?=
 =?utf-8?B?UlJEd1B4VFMrWklqcWFXbDEyOEx5UFRaTnlYVXRrZlUzV1huOHFRbHpScmE2?=
 =?utf-8?Q?8gt/CCaKLNXnkbBcGAoI46k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0992303d-3edf-4c90-8a9a-08d9eb0b1610
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 13:58:29.9486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UksN/nLZltbikDAIT1Mitfw1HMXMxKU/dIoeLczaLdJ2QfYteGdACxOA5oZeyq0ga45d8LicUINrTgYPrOeaPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4022
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 10:29:22AM +0000, Oleksandr Andrushchenko wrote:
> On 08.02.22 12:15, Jan Beulich wrote:
> > Yes, but I'm not sure this is going to remain just a single use.
> > Furthermore every CONFIG_<arch> is problematic as soon as a new port
> > is being worked on. If we wanted to go with a CONFIG_<arch> here, imo
> > it ought to be CONFIG_X86, not CONFIG_ARM, as I/O ports are really an
> > x86-specific thing (which has propagated into other architectures in
> > more or less strange ways, but never as truly I/O ports).
> I am fine using CONFIG_X86
> @Roger, are you ok with that?

I guess if that's the only instance of having diverging behavior
because of the lack of IO ports I'm fine with using CONFIG_X86.

Thanks, Roger.

