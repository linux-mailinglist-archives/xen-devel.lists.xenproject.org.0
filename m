Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52269E27E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 15:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498986.769970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUTme-00038h-2N; Tue, 21 Feb 2023 14:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498986.769970; Tue, 21 Feb 2023 14:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUTmd-00036T-UU; Tue, 21 Feb 2023 14:38:19 +0000
Received: by outflank-mailman (input) for mailman id 498986;
 Tue, 21 Feb 2023 14:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUTmb-00036N-UR
 for xen-devel@lists.xen.org; Tue, 21 Feb 2023 14:38:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e536bba-b1f5-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 15:38:14 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 09:38:07 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5994.namprd03.prod.outlook.com (2603:10b6:408:133::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Tue, 21 Feb
 2023 14:38:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 14:38:05 +0000
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
X-Inumbo-ID: 5e536bba-b1f5-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676990294;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=85UKRV/t07Qf+ryceesESGNmRFwd8iiQWpiMyg5bjXo=;
  b=H+1GnWVU0+5IHQh23SVx0+hoco3vaCV7oCK9SRyGK8vjC0e+KGGV7LEj
   X4mKuX038llAqIIZsOzCzP9B6dejP//prccp10EnlpcnihFbwTVnnxCII
   LKhtCSWxaGgDcI+xJCuXYjF9PsySqc6L3c0GWvjEmjP5Xj8q3to5bEmeD
   s=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 97290956
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BRmwFqszUX36/aw4HfjBvwp5IefnVEpfMUV32f8akzHdYApBsoF/q
 tZmKW3TOPeNZWGjfNknOtjn90NTucSAmoNhQAFo+yk0FCIS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEziFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIgIHNxmbxMmKn7uRa+tUgu09Bc/FFdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4W9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOznrK8y0QDNroAVICU6Xl25quGLtmm/Sc5yN
 Q8Z9RU2sJFnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAC4DVDEpQN8hstU/SXo11
 1uKt9TzDDdrvfueTnf1y1uPhTa7OCxQIWpcYyYBFFEB+4O6/951iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:nF21JK/9E18FseMR90puk+AFI+orL9Y04lQ7vn2ZESYlC/Bxl6
 iV/cjzpiWE8Ar5OUtQ5exoXZPqfZqyz+8R3WB8B9iftUzdyQ2VxeJZnPTfKl/baknDH4dmvM
 8LHsRD4Z/LfD9HZK3BgDVQZuxQouVvh5rY5ts2oU0Ccem3A5sQkTuRQTzraXGeDDM2f6bROq
 Dsm/Z6mw==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97290956"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/IwsBjryVHW3GywvHXfLgKbj15XvQHUW1f2u6AnBeu8HOJQ8nk59PpjNOHkmWF05WwCvsKKW9UrlWOr3KrOmabPS/3oHD9doGPMGhOok4VZXaB/vIZ8Lcno6QX8U5ah6qnzLmLsTlWaWgY2H5eyeuvGyfpAApGz5HjJtTQoRF6cnsXaWsmgCxZtKOeqeU8f8JBGUfBDpStXKfDD5tWQW+FaZk0MNi2Euxm0xxwtrRFl1qAb3X4ExDBRohIS0iv+yi497gi8csYXBh0se/Gy22eFIUIottYrgVH0PfzijL6v9+cWbSZdAw94tzqG5H6BlWIAzuGyUSWY9pW2DKLUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MM37u8V4czHa6d+O9uK5G9EuKa9HzrnjqRj5yHHjEnM=;
 b=GReWcgknXAMHu+1s1Gbn1i9+dgdVFQyh4ElE17hKwwRJbcn5Jb52ZfzdoR2ImZANYiDiDko6YrNVv+HiP0+NBOv8FGbZA1nIQqQLmli4e5rGZZLgkTAtXCNAe9Fx/F+78iKgeBR/6oM/7najR3IUp2OOcQ1BNpmdKHx/c9NmitWUuD21FPs12+kW7oi48ji/S05hJaccO/khnWGV1V1wk6d3jRZ8OFh6p6GF4pVkLPAjMZ5F15KorQZA3/ppKzvhu7+D3Aq5ct6FErHqj7Ss2/R21yw82MDsfVKvohpLxrQc4ijZezk8bScpG2Yq/LtkZ7mOWIip06rykz7yqlnwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MM37u8V4czHa6d+O9uK5G9EuKa9HzrnjqRj5yHHjEnM=;
 b=ds1WgoSp/uGMu2JqShOoDzM4fXXZlrpj9cEGtQBQ7QP8py3qR6QXh2Zvh34E0dhCkvdj1iJT56MhP0DQ6YzWTP86om8ukTdM8UZW/yp65rMAKHa8qu/AYW378eqh2vPBZ4lXB3VVUhmwRtgA+3E0III1sel9GAM3uJfVPW165iM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <41113fd1-d1bc-df92-ef5f-8e85689c82c2@citrix.com>
Date: Tue, 21 Feb 2023 14:37:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] livepatch-build: Check compiler version matches
Content-Language: en-GB
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xen.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20230221141432.972145-1-ross.lagerwall@citrix.com>
In-Reply-To: <20230221141432.972145-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: fa09873c-2e77-479d-1c4c-08db14193dde
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	308KyWHubkHYO27O0xwKienuWy2oXS6ic8/dQ0OwGa+Q0FvxTrAoWFe67bzC+vgIvd/qTaUPNPFDqufmIdDWewoVWviKL8rYJjftrSruSHC57n1SmKYnP5t6sf71LPhuPb/PI4d+KFNPfAlQsmiH7kPMB/DAZQLRSgpl7AC7+Po/G3lChZQvNNWUAOERnOLMeleSi6Oe6zRxz7pPozJHszeiqCJC4BdmAvfWjEzEqiTLeJ6btw3/zw1FjAUkIOuHSYCnucj0DWWofBRb+N+dqaLjdEJ4zwwAYBJUZ0id3qCfWsAjdZp8HjEUTy2D6o13P1VoPN4+v02Y6DhiEbZpyF+aKv0aFzWzZxe+Goz7VKqbyfCn08wzQSYQZgKhkKgg16fxIbGTOepgyjuSQgjgmByW51mybER07HKJkB0iOqC2RuNnBoUqKA438U67PBUSdbLLB0jMiLK0xduVpkredvuo7HP/LUxYXUkcbOt/iTKcuj6cL11tiC7yTUZSpQwWeLNLKlxovP7vD9iixsjZ9ISvSsjK4rq15xYMQZtZCI7B0/42ZAH8hneMjk2GfAvThfEIfbPcoOVXklznpZjRN5bSrFSq3O3QcQCkJnQblFy591l/aZiusE0irZfnvurzlAnvEI9zPBMcUfpAabjmxvfYqlP0HTFp6YZfhSLDJqcw7jZgiINpBN8/CqimXHaFYVk58ifjk1oWkMnrwAGUQKQ6O7OeTfr93rU5m0rLLOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199018)(186003)(26005)(31686004)(38100700002)(4326008)(6486002)(8936002)(53546011)(6512007)(6506007)(5660300002)(2616005)(83380400001)(6666004)(36756003)(478600001)(41300700001)(82960400001)(8676002)(66476007)(66556008)(66946007)(2906002)(86362001)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TitlSjVkc0d3d1pFT3FLaGVUZlRDZ2czc1NzaTY4TXE3SVYrUkw3U2txL2Mx?=
 =?utf-8?B?VHpaUXZKaEVuTE0vRG9LanZwM0hkM2VDbzR5TVJUc2UvYzRsTXdRMktjTlBr?=
 =?utf-8?B?Y1FPVTFVbEw2UDNoclExY28xRFFmb0QwOVd2ODlyaDNKMlZTUzlNZnFKT0Z4?=
 =?utf-8?B?WWNuUUsraGRaaGpSRHBBazNva240VlZGaUVFUVJiU3IyVDJtSkhQY0NiR3p3?=
 =?utf-8?B?UUptRGVSV09QRC9BZ2wvT3pFNWtHNnJKK2cyVlNTUGpoYlJvdlZxZ1dEc1d4?=
 =?utf-8?B?NGxkTTd0UkFYOW95SVR1Z3BKTXhjSEdpbHp4UXR1MHhOVWQyaUFnZmZXWnAw?=
 =?utf-8?B?bFozVjNJaEgrN2p2RU9NdkRhU1Q5UElwcWpuRFdCblE3NU9ISjFackdyVUll?=
 =?utf-8?B?Y2NBM3gwcUlxc3ZVSU1vUHpLWFVMQXFKUDZTVktDOG5BRlJRV0N6OHpKd1JD?=
 =?utf-8?B?ZUFBWTBYeW1LNlNHbGdnM0lNNkMzU0liK0piazlnVU0xN2ZaUHJkaDhZTWhH?=
 =?utf-8?B?UnJJcEFyd1FTNFBjTXM5cUtJeDlKT2QxbnpuL0hBUENwOUNESEhjS21jd09B?=
 =?utf-8?B?elNoRVBIdFFnZ1NvV1lsOVNzZFRocFlMUzFtR2dzdGtlZ3NSd0E2MnBhNEpJ?=
 =?utf-8?B?VERqd1hjWFNjNS9zc1Zia3FKN3dUQVE2R1dHeVZlM21vN2RTMXFwaU02RzY3?=
 =?utf-8?B?UEhmYUFqSDFheEhGNi9rdDV1S1hLUkJ2cnF0ZUFNTEJZQjRFeUlyMW14Rk1v?=
 =?utf-8?B?VVlFMmh4d3pWTjV5a1VLRW0wejU3SnZ3amppa1N5L0Q5R2J5bjZPc00zRkFW?=
 =?utf-8?B?OCtKaktoREtxeFhrVVhxbXMwZldhVjJPSjNwSkFKdWZNSWUzdVF2NWRzdkZy?=
 =?utf-8?B?emh4dEFOUEZ5YUgzSmxGTytRelh0UlFSWWwwUGV1K21udGU0T2wwOXJtSW5Y?=
 =?utf-8?B?cmE0dk1RejBGL0duSFVBNFh0SXdYTEN3SEdKOWxITE1ZWWgvdWxRMXArbUNH?=
 =?utf-8?B?YTV3L1lsS2J6QXRocTNsTENpYW1uWkRBc3MzamZHYStNWk1PczRnUERkaHlJ?=
 =?utf-8?B?U2pHeGFQYnpoMHRqeTJXR3ZGUWZSc2hlUTN4bDhZWkZoNHNEZ2pENlp2anJB?=
 =?utf-8?B?bHplNzBIQ2ZBN0xhVjFUbXMvYkx6bFBqNzcrQ1h4ZC9iNEkrbWNWVkp0MThz?=
 =?utf-8?B?cFpQTFFGM0tacWFkSEpMQk9rWmg0bFFwQnpZb3hIZ1grdHR4UnNER1ZnbnZk?=
 =?utf-8?B?T3hCSUJDZWQwMk52dU84NG1Telh4amRiNHJrTHJrNU1qelVlekpab2kyOWcw?=
 =?utf-8?B?VS9RaXFmemx1T04wS0l1WW1BcGVLNkZEQkF0Z08xTUFzYWdpbmk2MXJBa0Q0?=
 =?utf-8?B?SXZ5eUw0a0hsSG1TWkNoYmdWZDZNeFByOFZlaGtaOC9ITHhueDNZSm5xQzk1?=
 =?utf-8?B?OTMyQjMyMWZKekg1VmVmczFsMy9KRjVRZldaY2ZnWWxXWlNtdDR4dkh2akxZ?=
 =?utf-8?B?UGhwRVdOZlFvQTZVblE5dk5UNDREa3hyKzh4cUhFekszbCttR0l0SFRrWTl3?=
 =?utf-8?B?Z2FGUFYzc2drbHNCSzRMSGIxaEN4dmZkcFI2RFpJY2JHUFpPRlYvNUdzZ0RK?=
 =?utf-8?B?T3lxbzUxSHc3WXpqaktwZzZpeDVvc3Fob3hjcFdGdlcwTTNzN3V0VDdrL25z?=
 =?utf-8?B?anRFZGErS3lsUFhzaUVEWjcvRWN0LzlTTWVXOXpnQ1hIZ0ltZWEzWFhpdXdl?=
 =?utf-8?B?Q0xyM2FKd05TQXN5aE9JL3c2MXJBclBWVnpBcXhFTXMyZmt4dVk2cUNCd3g1?=
 =?utf-8?B?QS83U2xka0JORW1xVDUwL0JKaUNDM0M3NHJhLzBnQzVUT01GcTVEZmxjU0Vl?=
 =?utf-8?B?Yy9IUm1XMk01NVEvekgzOVBlc3hEUjJpQ2RIdnNrU3d4NExrRHRjS0hDQWYr?=
 =?utf-8?B?SWpxK3h3dVFKM3FNSk5IdVpnSEJqUU8xTENlR05Wb1p5b3VZdlRLT1NDemZj?=
 =?utf-8?B?NG51OFYya3RqUjFWYnAxWW5QclBTeGVkNStTcXRjZ2RvZGxFY3kyWXNCdkUz?=
 =?utf-8?B?dlgvcHI1aWRvWThYaEcwemgwdUVSNkNQaWtqYW5DMkRXQnY1QmJtZWNCSHdp?=
 =?utf-8?B?WEJ3SmxLcjdWMkVOb3NDZTlPc0taRFhGNFFjQk9NNFN1Ri9YajhMOGtZTThk?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V0+4rSY7CrYPTfz925MhFK0A0K3Do3ANwe+By4E8cTmE/OayJKmbfon0oT3i7uK6cm1WlJZed004UAQNrZ9qvYoyVpwIYwgT+P8tk4TZPTbl8vnFiDy+Gc/k9EUbJc4puBFJhQLG2nPLS0fHfxAJDsIzKrAhhbFQkQNNyNX6wgBd98UR3b1zuxN4lmsDgbtbopXKP7OAaHu1aVSSYSELms8c8S8e/OMctzrftO0obmSN36wDJyw7LbMnsfQQ2z0z0GHxeIVAtchReG43NqVyBXOnnhXjkc+8zJPvzFQFmuHdrLWYK6luNYjxdbWyySgaNNiRpgzBPurexFCdWyDgGsoUrK3D5Gjh6F2/pIOJwlWBGAs8VYSgLjyf9kYjBLDFQFctRM7UQw8gCF2TWyYJLHvW0VUO66nTOekhkmViOwgvwErr5G8dYbokQYWBPQLyAAJ0DV1iGZtWToNjOabx0BQvqRXk1APgKegJYXbSbPcI3moMTTgjGXFXLZwfZuhVEHsHx2iwAUh26cAX5lOvX8b1xnOtvoqMxM4DrnZ6XrKjzpG9iz0VbnIdc+hyYy/s1c+aoU6FNynCR9GUXAvWJADJdHdbZfEeSUVaA75D7w9WmOZDTJOmv8II3c29SXCDZF7GjrkR9mdDUC+ZlJtVZNGMJKt+nvHpqQHq9GprS7VtxYcw2YZLywmm/Jnht8h/v60c6ImkoLxx5QvX36omx5TJfbiy4t3VcCeymu/tA9zLr1owDl1r+xP1ycvoSwpTvYJXQ4DmP8QdfBH/gbttCbqCnNKSngLyde6sKs8qLPQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa09873c-2e77-479d-1c4c-08db14193dde
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 14:38:05.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFRlTH1KNk4rUdWStsVaDBDGoJL2qCeB8uBqygZSJy48tpzye6ABkZECdZOCOVm+EPiHRMbteWsiHzTrjP7jYemYHZ3RZf8MzIALKeMdB/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5994

On 21/02/2023 2:14 pm, Ross Lagerwall wrote:
> For reliable live patch generation, the compiler version used should
> match the original binary. Check that this is the case and add a
> --skip-compiler-check option to override this.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  livepatch-build | 54 +++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 39 insertions(+), 15 deletions(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index 91d203b..e4b4dba 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -33,6 +33,7 @@ DEPENDS=
>  XEN_DEPENDS=
>  PRELINK=
>  STRIP=0
> +SKIP_COMPILER_CHECK=0
>  XENSYMS=xen-syms
>  
>  warn() {
> @@ -266,27 +267,44 @@ function create_patch()
>      objcopy --set-section-flags .livepatch.xen_depends=alloc,readonly "${PATCHNAME}.livepatch"
>  }
>  
> +check_compiler() {
> +    orig_ver=$(readelf -p .comment "$XENSYMS" | grep -o 'GCC.*')

This rather breaks Clang as a toolchain, but it doesn't seem to be the
only GCC-expectation in livepatch build tools.

$ readelf -p .comment xen-syms

String dump of section '.comment':
  [     0]  Debian clang version 11.0.1-2


Irritatingly, while clang* --version always reports itself as "clang
version ..." matching the .ident it writes out, gcc* substitutes argv[0]
into it's --version.  But the way the Xen build is invoked, I think Xen
will always substituent cc for gcc, so this may not be a problem.

A build of Xen should only use a single compiler, so I think you're
better off looking for s/[     0]  \(.*\)/\1/ rather than assuming that
GCC was used.

Also, I think you should error out if we can't identify a compiler,
because very little good will come from trying to proceed.

~Andrew

