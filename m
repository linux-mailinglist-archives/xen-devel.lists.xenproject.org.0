Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0C6FF299
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 15:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533383.830004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6Ew-0007uT-Mv; Thu, 11 May 2023 13:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533383.830004; Thu, 11 May 2023 13:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6Ew-0007sP-Ju; Thu, 11 May 2023 13:21:50 +0000
Received: by outflank-mailman (input) for mailman id 533383;
 Thu, 11 May 2023 13:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+vG=BA=citrix.com=prvs=48888ca5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1px6Ev-0007sJ-F9
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 13:21:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c506effd-effe-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 15:21:43 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 09:21:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5970.namprd03.prod.outlook.com (2603:10b6:610:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 13:21:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 13:21:37 +0000
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
X-Inumbo-ID: c506effd-effe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683811303;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9WPipmuCY+y/9hC59mQdhfggkIBPL1jHCBEfpsN1Y0w=;
  b=Q4eWhih6NfuriL4fNn2zfa39uk6wQo/6PMHLvaEk5SCvDmOO/E7QrRRs
   HFCO9Z8yGn1p1VefoCc8QhsNkX0rmpEkoVxESbQbRd33eUUd2lsrbi2Jz
   lZhV5yoa6kQz2wnkLxOIbCLqSw8SFjbKG5IUnNmxiLmNvjsEHD1ihaSN4
   Q=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 107427063
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6hKvcKrGA8h9TWXel7zez3sLPzdeBmLgZBIvgKrLsJaIsI4StFCzt
 garIBmGO6qLZDH1KIp3b4nk80MOsJLTztQ2HQJv/CpmQSMV85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDziBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD4QcAvbub6y/J7lR8A1o8stJtnKMJxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWKEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqE22gLLmDd75Bs+cgWEoN2ziESEQ9NNE
 mk2wBcelZMy3Rn+JjX6d1jiyJKehTYZWtFQGul87xufx6786gOVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIa3k9n0FDfY0
 z2M6i8kiN07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitHY4qia52t+ELsx/9KJ4aETXGMp
 HEB3cOZ6Ygz4YqlkSWMRKABGe+v7vPcaTnE2wcwQN8m6iin/GOlccZI+jZiKUx1M8ECPzj0f
 EvUvgAX75hWVJe3UZJKj0uKI5xC5cDd+R7NDJg4svImjkBNSTK6
IronPort-HdrOrdr: A9a23:+NVkzqMapNTVtsBcTvujsMiBIKoaSvp037B87TEXdfUzSL36qy
 nOppQmPHDP4wr5NEtLpTniAsi9qBHnmqKdurNhWYtKNTOO0FdASrsO0WKI+VPd8kPFmtK0es
 1bAs5D4HGbNykZsS5aijPIduod/A==
X-Talos-CUID: 9a23:u+wgCWy1AtRnGIMfoncMBgUaB94+KkOByEv8fUKRUENmRreFaFOPrfY=
X-Talos-MUID: 9a23:aGYFrQQ2sVx6mfGZRXTL2g5jEM1q6Z62CVI0tLc8hvm8DixZbmI=
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="107427063"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOOlIEBLvU2m1nqKneUZ2UnPWNstnLv4qD9seUg4BFx95ZsoLSCLeIDXad4KmFvJUu9unyayi1QL6x9LCUhU9inUIduqpeQ8SKcosiQdYlwj5DmUOYvkvd5jErOIA5kpPnMkIcIJ2mpuDn2eVr4xiVfcG8OwZlYES/Hu/Og1x2P2wjcfOeDw4rP6bEUMN/EL7E9gNhf1SDZzMcj+xCCN3rD3Osc5eoD1quEE4sv2UrAZe6vAgoBMe803Ke2QYZKRXm8JXAs/QTU3xriDSli82tPqheH6wM1BG+O6KBF82ftcJvprkPPNFb+3GBW+G6ZhVJKX14yoyfrMt06F+Odxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WPipmuCY+y/9hC59mQdhfggkIBPL1jHCBEfpsN1Y0w=;
 b=PSfq+D3o1dSHSrwHDAICuFKThnwLcUCq00JgLrOs9ikZJ6vMQcc+WBIK688kUYOMDKlmhesJSHTfhGvts0cgSBeBLN0IWrhSieV+cml+QjFHDPJokXIr62l/1WDuMKQ1V+iVcCoPAltj018Zag3HbKfwVQJsiqvEAbrk1mmZ7YXdKDyhbZ4MBd7UjQyb68DEL262lFMvG2kiDn27FVBbJFUo7norgRgCjfRMrSnzi3uTlSUIl2SXr+KaX+COCBfQzWeNixJCgFk5Zz6afZeDNSgghhYqwdBpAHC/ntGRuY8JwKhNVzRNpnSdGSysym0qhk7QsmShfxO/Euo1AePEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WPipmuCY+y/9hC59mQdhfggkIBPL1jHCBEfpsN1Y0w=;
 b=aCb6KPArKt15zG1Itr5q02k0CuaNU0PLl/OV/k3guezZNnEHndCplA90yH9xbzmMPXiLslJhu7vHGhBXwlM0kgcTPsxfsvZn/yHs3Ec0s4WBBR/Zr3APSmTYRQTFV6Y5Rs0Bp+UR5TjRz9kIsmDM4l6xXJqXfLDAoPYNvbobtK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a4289d04-4cef-e4a6-a3ca-378f3e56be5a@citrix.com>
Date: Thu, 11 May 2023 14:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in
 map_{dt_}irq_to_domain()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
 <20230511130218.22606-3-michal.orzel@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230511130218.22606-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0c0d8c-3724-4749-6801-08db5222a5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0aAmVDvixqAgwxqyaqEgE7Z7VVgie0IH9KeMsjCbYpd+nY1QcDVVscFhNcrVvqyWloSVETEN+jFoMTyXh3oegVKwOJyLGRe7DvPrzQGDRL4lN1Ft1eZf/aA+FN3CCyhGBcn6jyNLa0NjG0ao4ZiCJLorO0Oi3cTcFmHSYRPLp2K80+Z1VxaeB49nwMoGgk7e4BJpESRFizvSoe4UZBjHv7b8Y0usgy6ybrdF8FjcDAbIjetpy/7Syx1lbEoHa7VGhBHMUj5qjH4h8QwwFuRR0GmXc94JK9GOZbZsItxtpI7hBgv/NSHPjuhcBV+4sb/PJpdF61AzP8X07c7oH86Jhre36F5jMn2U9F/7x2Zpxvzu6VHRvI1DSPBFvtENFZGOZhNzkKBRaA7Q090eVhJCDM7BOEWyQNnWPEJEG9ONO3kPoNSn4rP8K1yM9jx3VVQ3RCa6fQVye1U3CqLBn+F60SW0vxrcE/YXD+PZqdVVCIVK2p3NJn5YFPSVBGocn+MNrjTyrupQXt21+y1KvQHktzaYWkXE3rw/hcgvMH6qQy7gtmlE+pHJ+1FO7277h4Jzz8/PBlJKoEBQHtgA76MqAJX+8gGSVPR/XWjHoKertrCj6QTbc7POIlNHbua+71wCe0pZir33Ov1vabuUxB7lkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(31696002)(53546011)(38100700002)(82960400001)(6666004)(6486002)(31686004)(6506007)(86362001)(186003)(2616005)(2906002)(316002)(4744005)(4326008)(36756003)(41300700001)(8676002)(5660300002)(8936002)(6512007)(26005)(66556008)(54906003)(66476007)(66946007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STQ5eVBQV2EwNnoxSy9CTW5CK09VdmdQOUdzWEQwNlhES0lIbzJwTUREUFhH?=
 =?utf-8?B?R25qRDFjQTJDN28vUFZGZFZxUkRGQzcxbXA4TW9sbkJ3V0J4eUpPeTJuVzJq?=
 =?utf-8?B?STE5RDk5ZVNiMUZNWm5hcS9MVWhSQUZBbG9Hemg3bHpUejAwZ3Q2RWp3MEFZ?=
 =?utf-8?B?dmlPSU80UndKYllvR0ZnK2w5MjVPb2RBZS9OTW0zakY3UEp1dXZnTFczWVUz?=
 =?utf-8?B?ZDlMYnRnOHoyckhmMVBPWjdaVkdqYTJIU09vcU9jbjNSZEVGNzk1WDQ3eHhB?=
 =?utf-8?B?aEsyRmtvb1FYTTdSc0phUitYd29NOVQvR212bldYeFpZU21OL1o1QWh5bnNi?=
 =?utf-8?B?SmJ2QWo5azlqWTFiSTBlUDBSWVNBYU9RUFpJSGF4andQMjBYcjA5YmZ1RjJJ?=
 =?utf-8?B?YkpxMmV4WFBFZURta1NhUUhySnQ5YnlrdWxGVEhZSG93SlhOc05lK3pXMFhj?=
 =?utf-8?B?Q1g4TmRiVjBWUEhQeXBEZ0tMeFdlbE5hc1NoZzBkUzRuSEQ2U3pFRkI4c2dM?=
 =?utf-8?B?V0dHMXVzK2RZMlZNVXdIVTdqTGVsZVp3THpzYmJHUWJzdlBVTG9vR3o3TFRX?=
 =?utf-8?B?dGlHMFZPLzBoV0lmMVE1WW1LOUdYUTgxSGFab0gxMFE4YzhFbDRLZ0M2eUtO?=
 =?utf-8?B?TTlCOWw0YnV2VEh1YU5RQkx4bm8xREJCTndkZmZBRTlyOXdSWW5IL2lCcGlO?=
 =?utf-8?B?U09iZHFLeXJnQm5oalVZcjBTUzRpR3hGanI4c2xzQ1Q1aExCcXo3UUxLT2d6?=
 =?utf-8?B?MDc2eGszR1NLWVhRU2ZoM290RWRWRXN1UW9WRTY0S3hNMVNHeTJtMGo5Yllq?=
 =?utf-8?B?ZDhMNW43R0hUaW4rY3c2c1A1MzNnSXhxT3ZWOTdNY2ZtbGxiQVhQZVpTcm1Z?=
 =?utf-8?B?bEY0S0kzTnM5TGhCakczTTFKbVZlVDI1NHp1UlJzNFFEQTJjQnY5MzhkTXFq?=
 =?utf-8?B?ZzZzNHZWL3kvb3JVY3hqd3dpNGwvL3psaVJBQVQ5THlxZjVlOENFVnNhbUV6?=
 =?utf-8?B?NzNTYkhtbTBNb2krbzlRSzhxZnZ4c3ZZN3JIU1JpVmV5cmMrUS9rQjBzU1N0?=
 =?utf-8?B?eFoxUGgvNnFGS1ZNUE5kTTY2b2E5VHlBTXJoQU1VQS8xZk1PUDByVjVaL2tL?=
 =?utf-8?B?REVnSjY3SXRtbEhzVk8wZkVCMGFQSUhENzhiejAzZ1k4MFBuMzFQVHhCRFlo?=
 =?utf-8?B?MWhRNmdiaFdBRWtURXJ5bE1NYm5vemJpbTdWKzlqeEFqNGMvZ2o1NjAraTEr?=
 =?utf-8?B?aWpoaWY5NnNVUlVLdmlPcDdaMENVN2lsQUNQTE1udk4xMDVNeWxrVlJta1Zw?=
 =?utf-8?B?WlZ4OFJ4Nm5icUUyUXpYekUxd3ZldHhOcjI2ZlNKRmJidEhCbDV6ZXllS2px?=
 =?utf-8?B?dkZDSGJMN3Rpak9LY0pHWUlVN1R0RCtnUWhNZWpZNzdtdWl4WGRlZGpQRXRI?=
 =?utf-8?B?emhXZHFqanpyY2NVbndnS2pjNjVIenNHMGo3TDU3QjF2Y0hYQTdTZ2YwUmEz?=
 =?utf-8?B?UE5jVy9Ud0lYbUJCMmlqT2V0WTZ5UG83WFJLMGxMNW8vZzhwMmRiTW5uQ1Yr?=
 =?utf-8?B?OC9UaXBaRzYvWm03RWFXcTdlM0h2MWdNM2xkM3lwZ2tZNndKUVJaRmtNY0Rz?=
 =?utf-8?B?NDlLRldvYWhBWHZtRUJlNWloVW1MQkNnMkpuNVlyU1ZCaXRSV1pRci9lanA5?=
 =?utf-8?B?dFRXR1RrYzhGcExKMkFvNVBtdlNYRGpFbS85WHV0Z0RKVXRZYzU2dHR6Q3FG?=
 =?utf-8?B?SERjaURBVWdiVHVuNXd6OERwa0x1K2tjS0hibkNYYzREM2ptVVVBUlEwOE5z?=
 =?utf-8?B?WXdaT2pCZW5MVWtQcE1UNXFQVmVGZnByd3JXRW1BNHNHb3Y0OERHMzJxWTN2?=
 =?utf-8?B?K0RoQWNWMjYvKys4ZzJmeUVmYzVVenY2bzg4SFNrVURlZUdCVXVTcitHaDIr?=
 =?utf-8?B?a3ZUYThSN0ZjTHd1VHBmSzh1RHhLOEhLaG9MaEVPSmRzYU13OTg3Yks2TjZl?=
 =?utf-8?B?VW9hYzhORTdYNmx4UjROajFxVDNkNlIyL3hrYURiRG56VWNxWmZMVTd6RGo3?=
 =?utf-8?B?ZmxpejU1ZkRyUkEvUVMveFFneFhzbTM5N1dwL29TS2NmcnZLMUh4MEhWOE1w?=
 =?utf-8?B?ZWZBU1BiaXZpT0FaYnZ1N0tkdUJiK1o1aDRzdEEwVjgvbjJxWFpMYnpadTlk?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1Xk1a8W8IxKY62Mh96jhHea/ZeNlV9oSxJsdEYkpG6QZoXqi7lBqD0BBbgrd+DtZgs9CSc1esk+79JM9QRF3IlPBniSmvF/Yvh2ih2BL3nk/wk+41WumNJrTbPjOA9SZFLWjQ3AELaJqGXOr0ZcV51c/rwUHtzl9ITvy6QpWBDk3frmGKf91SdLIWMyWiXkYaTg88ulti6uV+8QUGnRc/yZICNGzvp07YshuZNzf/YQD3j2mFTvZwBu274SBUjMVJBD4PotY0PtOJTCxWGN5RPu6Z7czx2kLkDXfSwSi6QAfX1OKtL7077XpDmtiXvN0cZqmmzDKDhUPCR0lEFw4u//rBQ6BgFi1TQ7ufTX+RU1Fjwcd1Pwffp/zxHmqw2AHbkjv37SkzXCLIDbi7lU+GvUMZfo7tqiPtPFw6e3KvI7RRbhzlDvpb3IepSnGDzQ6rgjb0Qa8nKZZE5hs0J7dqB5mvgXuRitVSGcXlLKqrvoTUHfcgoIzr5Dv8ENUbL5amYYE16BFtBPpQOw0k+nhyLphrX52BEHZyhH/6IrEUHaYIfP+4iHxIhOp155b7Uuh6tEURqk4gvRf6XbhjKifFQWAPQOSr7BLgMpzofBHONH5Jl4OKcn1cWNb6uQkbfIv18OyuotVEN/iG0Et30qLs/sTepThpwnMkogs7KmQKYaJAgYvC0hLoaXng8ZO43BKf2bPM4MzyBuoVmWt1vDQzsCRR82l8oj2vkPYExoosY3WfQjSCKU5fObYTr97B5ejs+iVGg+LXS1KdAagFt66KCU+YxF4xJ3SSY3lz4AdBZuJOz4VqpKF2g8O8WBdlPDzrE3pKvUZQ26Ug1sWOrUGkNQFMJ/8DLIPYvhdOFfYpldcD9kKhtRyX+6kCkSpyVLJhbX/gby/847O8TGTch04RQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0c0d8c-3724-4749-6801-08db5222a5c9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 13:21:37.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us+xLiPuZvnr+AOhxXR4CuxCizpVcw3EBrUUUVWLz/66eJbuT35J4sPeBEpaCHWLIISTBPwORiFSpmVQMy0DcqdZzvxhAioXezVQdVUrO1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5970

On 11/05/2023 2:02 pm, Michal Orzel wrote:
> IRQ is of unsigned type so %u should be used. When printing domain id,
> %pd should be the correct format to maintain the consistency.
>
> Also, wherever possible, reduce the number of splitted lines for printk().

Very minor grammar note.  Just "split" here.

~Andrew

