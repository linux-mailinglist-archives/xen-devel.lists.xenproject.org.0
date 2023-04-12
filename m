Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630056DFC4B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 19:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520276.807679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmdxf-0005Hh-5m; Wed, 12 Apr 2023 17:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520276.807679; Wed, 12 Apr 2023 17:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmdxf-0005F0-2q; Wed, 12 Apr 2023 17:08:47 +0000
Received: by outflank-mailman (input) for mailman id 520276;
 Wed, 12 Apr 2023 17:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPvI=AD=citrix.com=prvs=459801679=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmdxd-0005Eu-28
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 17:08:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abf1074f-d954-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 19:08:42 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2023 13:08:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6239.namprd03.prod.outlook.com (2603:10b6:a03:3ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 17:08:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 17:08:36 +0000
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
X-Inumbo-ID: abf1074f-d954-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681319321;
  h=message-id:date:to:from:subject:cc:
   content-transfer-encoding:mime-version;
  bh=BtD/8AvZNPytXou2Hlw9qZJmjNoCMdu898mKJ+GnOoA=;
  b=KzH09fwdFjllksIr1WXREIKG9Izj/LMjYX3vMcVBQ7f75kXFZ9Kmgkkp
   sU38NdPKeuLhGVGzYsro/WcATGe2E/3j+IVSwU7BHdv76X5kJVTOe4IxG
   rnRmwRNe1oAQ181fsT4dQvZyf0eQAkpBWSY4JMDwImGz7u5sIAgimUmAl
   0=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 105298112
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CGDWOqo5VhRwq+ZC2sQ4OzCsrv9eBmKwZBIvgKrLsJaIsI4StFCzt
 garIBnVa/bbMWHwcohyPI+zo0ID7cLUzYRhTFFo+yszEXhH9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCziNNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACoTQy2jrv+E+7b4aMlsms94L8PUFZxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKMEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqMw0Q3KnzZ75Bs+SH27/dewtWSHRYh7d
 09N6AEnlpE2+xn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 lSOmtboGSBiqqa9WX+b7q2Trz65JW4SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjigjmsr5yPaRQn6wH/V3igqAh+YeaNbIWy5V/Wxf1JNoqeQx+Ku
 31ss82X9uUHF5yOvC2LXuQWHbut6uqFMTvTmlpmFd8q8DHF016ue5pBpg53IkhBO9wBPzTuZ
 SfuVRh54ZZSOD6vcvVxaofoU8Ayl/G4TJLiS+zeacdIbt5pbgib8SpyZEmWmWfwjEwrlqJ5M
 pCeGSqxMUsn5W1c5GLeb48gPXUDnEjSGUu7qUjH8ima
IronPort-HdrOrdr: A9a23:D8EMs62nvJHiy5Op3lPE8QqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-Talos-CUID: 9a23:9065JGO0bIj+j+5DQjdKyW49B/Iedj7/7HfMKBS7A1lAV+jA
X-Talos-MUID: 9a23:8db73QZIKI0CSeBTqhns2B9rC+1R/f6KVENUg74PgPCAOnkl
X-IronPort-AV: E=Sophos;i="5.98,339,1673931600"; 
   d="scan'208";a="105298112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkHHcB9HciYGK9Ja1WmMAQKJ49R5T4r3mlZVzLOisUg8N2xjdnzg6CE7bkfyNylKtvB8q4GEP6gjF/K1YrAyECJijHRa29azA8e2OD3B9WsTcIPdehR3PArVkMRpHq72F9CEhjZFzeIGMYs7jwLked8hCrg1hWCfkECLo4VRCPulyl14qDCcviB32N6zuMilydG8Xs3R53PQoKNMvkbvCF40YjH+uP+i/YBaagFkyCGcZZiJtkT/khV4ta6uDYnKfEtZHsN6f0Vh7vBPjyPSbdm4XRF6WjgXio1TWcTPuqz0TYPyJsYoFWWqLT8LLx9Ss7CY9pQiTWjiXZCCTeH5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtD/8AvZNPytXou2Hlw9qZJmjNoCMdu898mKJ+GnOoA=;
 b=gwsoK/Hkm1P3QvpRpAZKKQukUTj0icu/Ag3XReUA+lB4ISC5gp4wKlKr77xTeDm5Gn79s2bnaNIyXJZ+/5a2MUo862aQplFCuD0NvHnE9vavHa8tq7zf1yxodrkILNRpQOlzvpns2PC23Zajc3BCwtV11HKgvVUoXjiHu2i0j4erXbiuiep+RBdaH2qCGj+AKpx8wgqC+jnZ+Er8MVg1+1vuDT1kZ6hwy5tjQ0KER50hFDI6eXSqkr6VrMtpJGymMjyBK0sMpg2xIo8zZM4wwwV0HWSgaWjfbLsZD+8sUtOJiUs+hZTPy+IqKh+AKO9Pq/jOViwPHnYpYKsf0MsNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtD/8AvZNPytXou2Hlw9qZJmjNoCMdu898mKJ+GnOoA=;
 b=pBFZd6hfvGwQIqxyqWwOU15KmmltVTB2Px3yUBrcEz3hRw6AMKfkMsrEpXdrFRFdO3c9UVS2bHkIi7DG6ZQ3kiOh6XG+Xc2lMWwxf1w2PWIS8s5KwZu4HvXRLdVXOzFaT2vXzgs0u7UXImh/bMGMXgnpAUFXKabCQXH6ksdDQdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <193206bf-76a0-818d-8fa8-1886a15ad5e5@citrix.com>
Date: Wed, 12 Apr 2023 18:08:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Gitlab status on older branches (Inc some 4.18 blockers)
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <Michal.Orzel@arm.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 698c16ca-3baf-43be-67f7-08db3b788db4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mq0gkoaNvjh047BUcJRWhlJrcD8s5NUTYuo5xtOkhI+DdRl5yQ9Np1ciGfDfTpdPXI6Xkp1zny1CPpT9pB806iP6jxdIgwyHfdsyOtdMWuqIVNAePadjvW6xOZhJvfsroxQV3sN8SSXhcEMGjRHr4DaehTlkr8lky6KfQ4p4N1quZgkp//ls/7P4RS4NdWa3a0gqG0f1nIv8cbyylswF6wfhjtKjUMJTDbkd1cIxrKBHED+T/MJVrrXqtXeDKzTbicE8uwqrT32KQJEgzlQUSkipF2b33FsZ6JPYHoIVZMEIVx1HbrL4r6KaANYDlXaPd9M1JhSHonGarFVkecboYchkBk+Eo1RUNT0sJCXntvVq5+3oGEBrFMafItumbO6tMYneOVBAEmnu+1deKR6Mu0F9vdS63rYTfC7GRskhNXuXfmsedviL6nRXVii0MF3JN/Y8zmMkYC5zFKGy2q3FDZ+wmtAJ/VUnYHJ7TjTOGZVq9icfbyA+EZ8c4ox4Mz1pzmEF2wzgmHcIR7BDjTE2E/lMq9In2n3VTQDVz045tyOTavKfmFzdiPg3o1pe8jChgVDWRklMCEN0JJvuKz6CRTIfZh0ZLYG48HdV6o5rpFD6iTMRsc9JiP1vsKNd7Bnncl6PdU0B8JlYVznrv4y9UjzwqoSY0guBEb/avxd6O6Vv0imb6BQ5UKaN9nRRGaCV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(83380400001)(2616005)(966005)(6666004)(6486002)(26005)(186003)(6506007)(54906003)(478600001)(6512007)(2906002)(36756003)(5660300002)(38100700002)(6916009)(4326008)(82960400001)(41300700001)(66556008)(66946007)(8936002)(8676002)(316002)(86362001)(66476007)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXIreUhuQ3dGdFlNWkZnWnBhVURKSTF3bm9UbHgvRTJUQXQ5VzV3UHh5YXh2?=
 =?utf-8?B?VkdFcGhIaWd1U05remtFV0NKVDVlZzFPYTMzdzYvSzJmaXZYdzdTbUVQVVBR?=
 =?utf-8?B?QkZ3VGxBMHNPMThvcU1sYmloWTZwQUNFWnIvcDZNbmNGWUYyZGxzOHdISlN6?=
 =?utf-8?B?QkRzditUTVg5WVk2OExOV1A1dUZQTmxmdjRNZE0rd2V5WXNxOGZNc25CWnlN?=
 =?utf-8?B?SlYxcVZTV1lwVTMyMDFFeWZhem1HYWZZQnI0SzFhd0VIaGdsSGI4eWxTS3o4?=
 =?utf-8?B?L2NPTy8zaGJWbEYxUnNBZlAxcXVkSmVmckZaeEdXNER6M2RVakxBN0dkaktw?=
 =?utf-8?B?Y1phU1F3NC9Kd2lzNDAwT05BTTN4TjF2OW1IUHpDam9tb3hVdlZEZ3AxemIz?=
 =?utf-8?B?WCt2Q00vV3Bhc0lCc2xnLzJhdWtmTWtCanNQVzQ3YUZmZ3BoSGFBRnlNa2l1?=
 =?utf-8?B?SkY2cUFEdGVscG1Ydk51V1VUY3hXQmZRRDN2ZDhQc3U2eFVsY0FPcitrTTEv?=
 =?utf-8?B?R0F1eUpQcnh4dWhyM0ppZ2ZvckE2OXpSWjFId0F1NHgxVXMxQlZESVBDL2x4?=
 =?utf-8?B?ejJucU5JZWhIOFpWY2R6ZTVDWXpDM2R0TThjb1FJYVdJSjB1cjdJdStvMEtp?=
 =?utf-8?B?VFpJcGVyS0JmNlErUDRRdDl1STJNM2lVcmsvdG9ZcS92TmU3ZWZCVk9wNmhQ?=
 =?utf-8?B?ZEtzKzYrL0c0RkRmc0tqZjc2RWZabjVCWWduSGlsN2twVXNsWFVseUJkVnpi?=
 =?utf-8?B?MmxzTk1oOG9uL1hZdlVBWTlTUmJGS0Roc2xXYnhHRWU2UWFVZi8wdFpYT0Rl?=
 =?utf-8?B?TnZ2NDhSeW9VSVRHZndCM2hUa1NCeGNGS1N5SEhTQ0xLajZUNHRLY3o2Ymk3?=
 =?utf-8?B?Y2x4c2ZzY0dhaFNwaXJaWHBxMk9uR2F5emd6dVBnVy9KWjRxWDZMNVpmbjRS?=
 =?utf-8?B?bE9IUHhUS3MyVW5heUpMcDVvS0NxRTNHLy9GYVlVT292SStRQmJHRlF3bG9O?=
 =?utf-8?B?eWltcFd3MzZsY1NCV1dMMGw1MnZrUUhKZlZnbkp3M0N3QitlNkllVVN4NFdY?=
 =?utf-8?B?S3FBc1FHaFlyVEVaMnE1N0lFQTlGK21USlM1WDBTQ09wYWRhZXI2cUFjaVhk?=
 =?utf-8?B?SHIzRzlvVStkblk2eWFNb0QwQVc5YlByTHR3L1YrZDR4NFJ0eTNVUXdpeHZF?=
 =?utf-8?B?amhXaDh4Z1FmcFE2N3owR1J2cE4rMkw5blhaM3pqby8wSHdFamQ3ZjNISHp6?=
 =?utf-8?B?WjRtZlBITjZOeVRZVXVQU204eFdFcHNTSDFIRXhNeFl4TCtQQzZFREMyb1dD?=
 =?utf-8?B?a2ZqSm4wOXpLSllaWlVBVXdVcDJiUWN5aWUyYXNZenJGU3Ftd09rSjRmclpq?=
 =?utf-8?B?WTEzQUFITmpjQURTM0lwekxXNTRjcmNvdm9GemVDRFBwQjQ5TW8xMXdJY0NB?=
 =?utf-8?B?cHVhZW94MTNFUENrdE9kUkRNWmZrTEdDelVDaU1va2JWQmo1enR0cjIvUFpM?=
 =?utf-8?B?UmZiWWdtSXhCbDU5dFdDSXdNdnVoSG1uQ2lQVWUvQXNtTHRQL096ZVgwd3VF?=
 =?utf-8?B?K0lqUXpGUjNHdU1kbTMrT3V3QlNQdnJBdFJXaTgrdHVHdWJjY1IvNmVxWlJi?=
 =?utf-8?B?YnFGeWZVbDczQ3hEalo0N3NmaFllSldsaVh6VXEzZUhTcm1OOVFISE9vY0Ev?=
 =?utf-8?B?MXpOQ2hoMXBKZlc1M3lGb3oxc2lSWUluUEMwcXZmRGpuMFdHWEMvZ080REZz?=
 =?utf-8?B?UlZwM0FpYkhNNW0rcVJBZFJUTkNERFZGYkd1SmhXYVJ1Mjk2Vk5MMUdjclRy?=
 =?utf-8?B?M1hQd3B0czJ6Q21xZEZsYnpUck04czJXdlh4SEZwM3NIT3BYdGhRdUlqQ3Vx?=
 =?utf-8?B?dTJFck1oTVpEQUZlaE8rcE5qbVB5SGNzUnRTMWVmSW5Na1ZYV3VQSENHdTlU?=
 =?utf-8?B?bm5QcWFtU2FoVGRJZmo3dnRKMDF5bWFMd210bTJVR2VpRWpSdzlJM3pVb2Fv?=
 =?utf-8?B?Uk5XcDU2MnRKNExDUWxDdDI2dVdpUm4yRjllMVV0bjJIKytzY0xKNE54Y2Jo?=
 =?utf-8?B?Ti9Od1h0bFRNdndyZUxyRVlPK2VWUElaMG9HdUhsc2lKc2ROK1NNQVorVmFi?=
 =?utf-8?B?Vk5PWlZMMlVxV0YyM1pTYlBtS20zWVR5N1BrajVhdE9qYzhVQVdpM2doOEZk?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?QWIyWDBzU3lBdFphR2RYd0NPK3haU2JtaVJyMGxhK3hRREN3TFR2M1YrNTBL?=
 =?utf-8?B?QmRRVy9wMnlkcmNUQmtKdVd4MTBhc2pYdHkyMXFERXVJNTVmTllidDJzUWpz?=
 =?utf-8?B?SmhLQnJHU0VLYlpTUjVHUE5GS2d2dG1XVnlRU2V3VStDWlMwL05KT0N0VVM3?=
 =?utf-8?B?dWhEQVBSMTZadllNMFpJeVgySDRwUlllajg5WmZQQ2FFTWRUNzJDeW1sTVFR?=
 =?utf-8?B?aFJrZndZRjNYb21yanZjRkJQK1lwNGJEaHpyZm5KWnNOektHSVh2NlVtbU1p?=
 =?utf-8?B?MklydXR1ZGhSR21idGg2MEx1MllobGJLNFoxVjd2NkcwUUJJNC9GM0wwY1Vv?=
 =?utf-8?B?K290ZTVpVkMwenF4bm1oZ2F0VUtZL1RNRlQ1M3dEamxIWlFMaGw0dUcyM2tr?=
 =?utf-8?B?ZGpFbzhEdGxHRnQwVEhrVGVjMjNQM09DWlB4Z281VnR4ZFVHSjhmRzlTQ2Jy?=
 =?utf-8?B?eFh3Y3NPb0NtNTBKY2FOT3k0eUM3WVdGR0srb0RLVnhBK1hoQVlScndJa1VG?=
 =?utf-8?B?QXFGTDRibG9DcFZ6UlJWWDNja3BZbkhLTUc1aTNEUXJDR0tEVEtwYzhaaHdN?=
 =?utf-8?B?NnRmcDVmQmdVSjcwamI5cDZLeE5mNSs1UnJncnhESC96d0pQNEZWWWVXSEhP?=
 =?utf-8?B?bkdDbkZtdmF3N2VxWjdIMjQzNlYyRENiS2taYTlIdW92ajdBMThpUWgvZVk2?=
 =?utf-8?B?K3pYcHFYMW1yOElrTGk0anNGcnp1NlZGWGZVTE5ha3RLZisyZ1JyRFUxaDNG?=
 =?utf-8?B?bEpra29GSW5CV0lBOCs5MFNvVDRoM0J1TTI1OGZDTmhvRDd1aytoTVg4YkFE?=
 =?utf-8?B?MmxxTTZEL3BJbjRtcU44UWFJbEdQcWcyRUF0dzlyTTBadkJZOEx0UnBJaktS?=
 =?utf-8?B?NHkrZXBuL2lLQ1NkZ1o5bXJET2RzWkZxblJoOGNWTWVvMnBYS2Z2QlRuSVZv?=
 =?utf-8?B?V2F1SVl3bjgvK2Zkdi80SGZFRjFiOCtnbE95aVRuTzBSakd3bk9KU0FVWERo?=
 =?utf-8?B?YW5HWllVbkdoeHBITmt4ampyQ3VRUm1yR1FXR2NzUkh6VlJjeVJpa0szR0FY?=
 =?utf-8?B?b0VYdm54WkdBUGVEUDhZTjlMTmNXUFFCWXVFTXFxNjA0RzhGQk9zbkYyUGtv?=
 =?utf-8?B?MHFJc2dvNSs1Z3BpcjVvUVpCYlV0ZVZBMFI1ckZpRnB5aFpqZ3R2L1hWMTBP?=
 =?utf-8?B?c0xudnQ1NHhEbHJKVnYvbks0cE9NN0pIVGdDNU1ZTmNNbHJNdWpOZE1JQmhE?=
 =?utf-8?B?QzJ5UUM2T0drUWEzVk83R0dmTVBYU0xoQ1JBclpQakhOS3RNU3dqYndoRDd0?=
 =?utf-8?Q?rrPjzQPchcs+I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698c16ca-3baf-43be-67f7-08db3b788db4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 17:08:36.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9wJyVSZepS+jCuNQ0XrPakP9ydXw1kfDlmqTTlKajww3N8unaEalSxXHerH7VXiGCcIykknTeyl9Ge+F/io/TwzwB91g5aTYHuAPJuZBCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6239

Hello,

I've done various backports to staging-4.14 and later trying to improve
the state of Gitlab testing.

The good news is that 4.16 and 4.17 now pass.  The bad news is that
there are still bugs which need fixing, but lets start with the older
branches.

Also, I was forced to backport an update to SeaBIOS 1.16 to all branches
in order to fix compile failures in build environments we supported at
the time of each of these releases.  I honestly don't know what we were
failing to do testing wise back then, but whatever we missed ought to
have been release blockers.


4.15:
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/834460832

Individual failure instances:

1) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232265

This is a -Werror=array-bounds failure in HVMLoader but the same
job/container works in 4.16 and newer, and the underlying code is the
same.  There must be some change in the build environment, but I haven't
worked out what yet.

2) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232266

This is a -Werror=array-bounds in iPXE.  Probably needs an update like
SeaBIOS too.

3) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232290

This is a Qemu upstream failure which I do vaguely recall.  Bit it also
means that Xen 4.15 had a dead-on-arrival version of qemu which call
into question a number of our normal release activities.  Probably the
least-bad option is to backport the one fix relevant to this, because
changing the version of qemu in the security-only trees is far riskier
than changing one of the in-guest ROMs.

4) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232334

I have no idea what's going on here.  If nothing else, we're failing to
collect all the relevant log files from a build and that probably wants
fixing and backporting.

5) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232324

This isn't so much about the failure, as the fact that the OpenSUSE Leap
tests (which were replaced with tumbleweed in newer versions of Xen)
probably want the same doing to them.  And being marked as
non-blocking.  This is a failure somewhere in the middle of qemu.

But, on top of all of ^, I discovered that we have a majority of tests
being debian/unstable which, when we refreshed to fix the HTTPS issue,
ended up retrofitting a newer-than-at-release-time build environment to
the old trees.

This has come up previously, and not addressed, so I'm now declaring it
a blocker for 4.18.  Only tests against a fixed disto version can be
blocking; those against an unstable distro must be non-blocking, and
most of the currently unstable things should be transformed into their
stable alternative.  For backports, we want to retrofit what
debian/unstable was at the time of release, rather than what it
currently is.

Furthermore, the fixed distros we currently test in staging are old
bordering on obsolete.  Which is not a healthy position to be in as far
as the 4.18 release goes.


4.14:
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/834461234

6) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097236330

This is the only 4.14 failure I can see which isn't a duplicate of a
4.15 failure, but it is an OpenSUSE leap failure in qemu so perhaps
related to #5


As a general note, we still have too much testing (and/or insufficient
testing resource).  It's very painful waiting 2h for each branch to
complete.  I'm very tempted to trim things down further on staging and
backport the results.

~Andrew

