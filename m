Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A26D5901
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 08:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517657.803344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaZT-0005sQ-Qh; Tue, 04 Apr 2023 06:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517657.803344; Tue, 04 Apr 2023 06:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaZT-0005ow-Ni; Tue, 04 Apr 2023 06:55:11 +0000
Received: by outflank-mailman (input) for mailman id 517657;
 Tue, 04 Apr 2023 06:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjaZS-0005n7-3q
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 06:55:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a20f5801-d2b5-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 08:55:08 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 02:55:04 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by CH2PR03MB5237.namprd03.prod.outlook.com (2603:10b6:610:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 06:55:02 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a84f:cb5:8471:f9d6]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a84f:cb5:8471:f9d6%7]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:55:02 +0000
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
X-Inumbo-ID: a20f5801-d2b5-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680591308;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wVelfQuyaKXgYl0uIIi7iW/tVlnA+3FXHh3/C5/4X2o=;
  b=YZPjn0EBcLbJef6f09zqSo55KU06KkHWCGwEL5OYxQerg+w8js52Kb3G
   JXcPCo8QfBzVC3V0ZeCYxMXhQvQypj1XodwBcac9kd8YX7hc9AUcEuvNr
   ujWMpFFfwV3lC9Iszc79gxEjGEv0/PEUPa7dkgBNeV4qLfj1lpPS6b7J3
   M=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 103016611
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nBj2LapFAdA3WNJv0l90SXm7XsleBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBmHPv2LYWv9fI1wO4nj9hxQuZLWzIRjGVZk+HoyECJE8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyVNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD48QUvcoNmN+qDhcK53wecofMbMZbpK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqUy2QPNnzV75Bs+BGLjg8ewlhOHW8NuL
 1YU8W0+gfAd+xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJTbp+PHmqYA3yxjJHtBqFffsisWvQG+gh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7EJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:5wqcma/RDsCuNSm8MwFuk+HFdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwQZVoMkmskqKdhrNhQItKPTOWwldASbsP0WKM+UyCJ8STzJ856U
 4kSdkENDSSNykFsS+Z2mmF+r8bqbHokZxAx92ut0uFJTsaFJ2IhD0JbjpzfHcGIjWuSaBJdq
 Z1saF81kadkDksH4yG7j5vZZmwm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjsOTj9Vxr8m0G
 7d1yj0/L+qvf2XwgLVkza71eUbpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+Bwlve21714usd
 /U5zMtJd565X/9dny85THtxw7j+jAz7GKK8y7UvVLT5ejCAB4qActIgoxUNjPf9kobpdl5lI
 ZGxXiQuZZ7BQ7J2H2V3amDazha0m6P5VYym+8aiHJSFaMYdb9qtIQauGdYCo0JEi7W4J0uVM
 NuEMbfzvBLdk7yVQGTgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i3AVwcQO901wg64Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWmKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGNfIyEZ0Wu9ihi3ek9hlWlL4CbdRFrCWpe3fdIms9vQfEyAJ
 2ISdVr6/yKFxqbJW8G5Xy5Z3BoEwhsbCQkgKdLZ7uwmLO6FmTLjJ2sTB+BHsulLR8UHkXCP1
 AkYB/fYO1902HDYA6MvPGWYQKjRnDC
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103016611"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFjjsVIrQG5TVQuVRZLwzfZdjbzjPNhDXbp02TC0leo3IYduaz1ekEk4i3JFT40ZAEvy9JxnM21FfdEJ/IiN3KgaocPOVHqAitJ9kPItSkKTxctg2KMFD7iOhITGfQ8EmT1cKAHilSA7d0/6DgfBp6lWdh0t3iKC2vbBAiKgvGoIm5ZTdchsmmh5CYczGG6jdq7EKKVQD7X6GGYWqzgu67Jw0ccs3nLpWnFgtfv/2+1oceILhZE5AFp19KDCALMQZphkpWBt0E9TP9yPiMr6icyrt5J5vwI6ULbY0p/+0nGtVhhbrJ8mqT35msSQnNh4InWDh896EQg6sKT8jqyt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVelfQuyaKXgYl0uIIi7iW/tVlnA+3FXHh3/C5/4X2o=;
 b=FaEJBRkyftcnuijZI0cq4y4sA9zfzGd9dDHkF3JIX5z+voBRc5MY79XA8yZROe8Gp0xDtce4yHj9qKgGjEfzlpM3wk6nyQXwzyGNEY9Fg5pSKIy8NT9lu/tNgdUGu6Bh3dD4KUGGZB9YO2JixFMsFSV4ChKmaqrb7rt46L/CPaaly6pBP3UsqkHIPT3LqlGs3FsHirJ7wfj4mLGv9DnPntpd57qCoYengtimBYLhz4FtnpsUaAjvcgQ8OPzJUmHJjyJqeX0qCz7LUnpjIdxIM3X4qCTKfwGlUm5PXLO2VJO6BcktQZT02+9ZM81zEJvpmQPKCEeI8Zwqsgw9ZetlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVelfQuyaKXgYl0uIIi7iW/tVlnA+3FXHh3/C5/4X2o=;
 b=PAWcrJtkhu26O+etMMBUvk0D3lEC3Uq6kDyK1jCflSk7Kv+TTM73ug0s5SBUrGgbuEByXF5+D9jQAwdypUBcHcxakNyJs7WO8XMPqYouxZE7z3/VEGCo5Bm2Q2h0J5KVxnmxf5IK4j6ukFSNtIasyv9V8Zs8CiakgvWHpFxdXdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7de7a0a9-dd1b-c98b-9663-23c4aedb65b1@citrix.com>
Date: Tue, 4 Apr 2023 07:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul/test: drop bogus .PHONY
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
References: <515bbf07-91fa-1932-1be1-1411f7814e6e@suse.com>
In-Reply-To: <515bbf07-91fa-1932-1be1-1411f7814e6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0596.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::10) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|CH2PR03MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fb6780-f414-48cc-fb03-08db34d98369
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xw+Z1IDcIkWTgOrUoj4f1+/CxJPAvnKH1Y8HxMcSSw860+vVrRYVZ1wsFlZqCRhfcrnP26MDym2j8lXciDtUaE7mbNEHsRn0h0YFXGQEWimJeFdUWz8xnODErjBjOv1ogUk1TdjfG8+KRvtnDIh7AZjDeY9o6jVSdtyV+oHf/+jYrewWlYkGCWpAAQc00cw3eCGFiXR6Y9W9AR/SwXJUyBC81CuoOaXeNyWo586iLjcm8eU9sIWeQGTS14cvShWmqlJp5wRg6/dWxLAMPs9bCCdQzzX3E00xtnIVB6pmJM1tRQHnY4DnTSKMQ4vXVLIMXadGcyCQzJvIrDuRHI7uZtH9Bm9gaaZJ/6ARTVGfJGM1/3CPtIwrkS6F+WRNeq3EFn1s1VeSDfK9JyTlNh11C9ftab2n8b+zoJqFBgMwu0SvxBcJODRx1AeIqfaJJNKLzVitL0B/qOzFBmKGt5MF5Mi9QRsmamOIfEgDKARypIAJgryOS8rT3/CElAZlUF7YibOm8e9luJ+qpuWuPqY5c7SHewYgPYYR5R2FEDi5Qv1UjkNnmLqnf2OSN7jg8d4S7KSwGIAM0Sfr64suWGDjO6OMsoQ31YgPCABhNM6l/4YQWClY0C/kCqpaV02sPD1zdMxPBJSTLjKNqKPDar4lNyLCRXG6qiKlC/5tDPuiyZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(4326008)(66556008)(66476007)(66946007)(478600001)(8676002)(54906003)(316002)(110136005)(8936002)(5660300002)(38100700002)(41300700001)(82960400001)(53546011)(186003)(6486002)(107886003)(6666004)(6506007)(26005)(6512007)(31696002)(86362001)(558084003)(36756003)(2906002)(2616005)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmFiaXJHUHRzRm1rT0tqb3pyTU1zNzNhNzhweENBOEZFaXFJcUd5MDVodlVt?=
 =?utf-8?B?YThGS094MzJiT25SVlJlTHNLYXk0emxzUlQ3alIya0lXOW1iUlRNQThGbzBl?=
 =?utf-8?B?UzI3KytMcnJjVlZTU1g2QkE1YktvMjladlY5bnBlRjE0TW85NWtnZ1pFZ0sx?=
 =?utf-8?B?aEgrV3QrNHo3WUQxOEtEMEZEazZDRzU1TnE0cGRISXVEYWVxK2RSbTYwVWtQ?=
 =?utf-8?B?VjlhbXBwWncwUDBqZDV5dFlQM21JN1g2cDNZeFdwWEtaanJmNVVNYk9LYXds?=
 =?utf-8?B?YXFBSU9pS3dwQitQWVZCV3dHRG9uVjN4NXpqUVRab0o2VlJla2k4WFQ2WUxh?=
 =?utf-8?B?YjV3WGpIOUtsZEJadTVKOTgxRnJHYkFvY1RQM2FGV3lLTW1wNFFwSTNSWC9r?=
 =?utf-8?B?U3dtbE1QVC9yZE1LWUxpME55TjFlWXI1cDZWV21tZkJVeDRKbzc2MWovYmYr?=
 =?utf-8?B?SHNVY1F2M1ovMHQ2UkI1QWVYMHdXTGRQeUYvS3FwUHNSSFh5SktUVTZYeUp1?=
 =?utf-8?B?b2JlMGhtNk9DdlMwQmxKSENKS1EzVFRyR1JuS05NZFZyNmVnRXh3dlc1QVJO?=
 =?utf-8?B?alJzOHRpdG0wblkvR1dBVjV1N3U5L3FNNkNEUEMvaXczWTJ6Rnd2Z2NGcFRH?=
 =?utf-8?B?elMxMjI3dG9FeVBJc2oyQjV0WUc5UG9NdjhRNW1vT2lmS2pBQ2NzRkFFNzU4?=
 =?utf-8?B?bWx5K3hkUittTklWN09CcVc3ZkZUWHh0ZTMremtKQkhWZ0hLaTkvdWNXMnFD?=
 =?utf-8?B?VUt4dFZ1eVBPZTFTTmUxTEVpR3E3L0w3U3plTFd6blplY0FJM2piVWs5MmJO?=
 =?utf-8?B?bGg0LzFFanBRejc1SkRWTEZVMjIxdmd4MFF6WWxYbFFuV2FZUXRRNkZxeERO?=
 =?utf-8?B?UjdzcE5ESnZ6UHdzSkMzcVRmZHZpOGFvOG9ieVBwWmk4OVhpTDlLMkcyeVdN?=
 =?utf-8?B?dGJzdlk1NHRZcGhpRVFHRHF5cmsyb1FGd3FBTHp5Y0FDR0JmNnUvVU0xcDN4?=
 =?utf-8?B?TnN3eVFCbk9ObkxFZ1pnVHR1dnVpSnFjbm0zVDZHZkF4cDJoSFNYTVQraVlr?=
 =?utf-8?B?bFl0aktGOHhZYXQ1NW1nYXFSWjN5RHk1dlZTRmFFT2JUSjI4YTNua2dUbTd1?=
 =?utf-8?B?RGg4TVlZN3BqaHBtY2ZFM3dqbjIwK3RWc2x3U2dQaWhtR1M4RFVSMkwzQlE4?=
 =?utf-8?B?YU15Y3FLaVlYUE5vRnMxMVVZUFM0OVMrRmpabnRTS1hJT3RaQ2l6aGdOWXgw?=
 =?utf-8?B?Tks3WllCbjhPRHhmRGNBd2k5dGNnZUt5ZFZwaGNoajJKNWszOWxON0I4Ykhn?=
 =?utf-8?B?ZnZING4rRWZoVEErb1dFS0MzNjJsaExkNzcwcWpLb2liTGRrQUJFdzVIcGts?=
 =?utf-8?B?YWZTY2N1RDFTQXRJSEJ1RlovZnJjR0tFTkszZFNUazJHYy94dWRELzFwN2k2?=
 =?utf-8?B?V0VvakVvdHdmQnNwSGFjeFlrUmFaaXBpVnp4a00rSmMwS28ydTRDS0tnS3ow?=
 =?utf-8?B?ZVNpdGVLV1pxbnhKRk96dzZQTWQ4VGh4UFFtbXVtNHEwZWlnZUZsTEl4NGtv?=
 =?utf-8?B?RHp5ZGpETVZNU1hGaDNoZ0wzbjVFRElSTVNqQi9xODlYMDhpb0liem5LQ0cv?=
 =?utf-8?B?STRLTVZZek9qV1Q3SXVjODN2YVJDcjhwekRPQll3RXk4TzJQOWVEU1dqRmJX?=
 =?utf-8?B?WVFkRzZEL2xLamxPOEFGNGVhVjIvTzFCRkNUTzNrREJ4dTlsVUxCQ0UxRmo4?=
 =?utf-8?B?TmJqRFIwODdPR2Fjamp5Z01zQ1FOdEpWUG5VOFNtLzJXU3VXMDlkZEdyR3JH?=
 =?utf-8?B?ZmJCUEN1K0JJVnhWcDlpTCtWejlPRmw2L3JmamRzTHVNb1ZHeFY0WEhFVFBh?=
 =?utf-8?B?cVFOcW40VEhMbk1IMURxc09zcVE1R1B3cS9NSUJCa1diaXN5c1ZKMi85VkFZ?=
 =?utf-8?B?NjEvTzJNWk5KN0JRUGpXS0s2VmZuKy8vS3g4R2xMQXhVSnlPY3lRVko4WFlH?=
 =?utf-8?B?MklsZHhKVmlsVmJQQTdvNGorRzFNVzBGVE1zMnV4alkxTU0wRm5TWU0xN28y?=
 =?utf-8?B?cTU0TXMzWmwrLzVzYUdvOWxOVGZJeHBFTktPWEt3RFp1eVNOSGJFVHpyMWdX?=
 =?utf-8?B?OS9YVVFZMnp3dWQ5ZUJZNVczTTRFSzkxSkl3WmNQRVhXRFFhaEVIVWhJMGVa?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EVmzHPohxC0F84xEMxQTvJ8ncscMKdeCS++FZl9d703OjJD5SKjAuvh5ts8/D7UXp8olOa/hV/ObW4TmzgIU0BtHRX65ypks9e6N/y+DAxjusvRVNW5PjQQkZo35P4ehGH6NQg/6iESW6kEoR0+aHkVTjBmF840ik+xgRNDfv2tQq/iAe/z1K17WU7IVFDxCCaIalrui1Bx4P++HhseduVwPdujtOutvLcphPIM1hk5Q16LLhu7Q9c9Q1MdsjuH1gyY4KXCCVK4qEkIs6fxTpS4Oyyh48Lw//hk+eCq/CGzQGjJolBnxqrWr4y/PAUJ+quyqJGlcIDewxmj7Xg+C/o9eUGZYEiTBVXQmINSk5vclxLJPeqMgrSrtndw+sDzr4BnUtKDXnAoygmrAy+Pbqu6YrNFfoVZ33aRXDD6RcWfDYm2xbO74Ks8ahS3V5L/Pr6isdDj5H0/MivUuSCXS0r3NpgTe5I3Tu0YslzfDTbOc7iKYBUHyuTJIogqbLEwJI4YbO+aICAAUHK2nEN72FlieYd7hxYvZq5VPmb61M3+/GmGk4rSb6D/6aZ+TyW39faJTmP2DtETMxh8V7b0NHS+h7gWUrFbqrJLz7JloylVDuuet+pUtwzKico7uKX+X1QD/1+EF4eOUQlWCXVJQcDBxaITJagV7xhloTLVvJloAWSlevWu7Oo8+3KmEP3gNiUTK+Y1g9PzJzrMYpT9i4yb7jQIB4Ja/RZ7Sf+3h6Vf6CplJLrtFO3nub9dXiwgj2QTTu4UpHWeFvEZvZNhxWlavePSOqi1ns8N27bsxxHq048C82UP5khmZ41U1sc8H
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fb6780-f414-48cc-fb03-08db34d98369
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:55:02.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CXdfMX8kUGciHWFxH1v3VxUTlN/qZQRURPMKZLs+1ido4nN4m6lPwTT3Hp1NNlphc7lXzgOMYmuki7kRKAbU1MRdgnH5bs/XNhrk0o2Vts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237

On 04/04/2023 7:37 am, Jan Beulich wrote:
> x86_emulate is a real (directory) target.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

