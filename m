Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D40AB6A17
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 13:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984221.1370402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFAMU-0000v6-DS; Wed, 14 May 2025 11:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984221.1370402; Wed, 14 May 2025 11:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFAMU-0000td-AF; Wed, 14 May 2025 11:33:22 +0000
Received: by outflank-mailman (input) for mailman id 984221;
 Wed, 14 May 2025 11:33:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uFAMS-0000tX-N9
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 11:33:20 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2405::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b4cf6de-30b7-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 13:33:19 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 11:33:15 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 11:33:15 +0000
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
X-Inumbo-ID: 3b4cf6de-30b7-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw4RVuhmoZVCZEEJaifMe0nqkdmU90v6+Mbfo7RiUNqX5sNpVOjflgLACqs+wd5o0KNDvaaR1rXpoXqmkNUFhQHPMEfBezsKFiBSfRaM2mxuwLDVtogIwJgrWAKqFS1nn0RbvMgrB2IbO1j5aAtwEF2vrbOzjXh3YufZL48J+gbxEyiukN90o16UjnWadbFz7v8ge0crw0kRbSUHNIh8tl5lvp17hJmNkhaRoAI2DWRMFpJIHC2nBbvlpMAcukwl4FutBmWTKC/+6xNDxvSbhxcfMX7Aq9/bGvQuFWJLiY78QOXhmJKrxEhnEm1phgmtU7+roBdvhW6DZcNA/DIoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEwRZZmcwzQtIiNRE0bNc/XBc5E21easpUXT1BfBnM0=;
 b=CAJwFb5VGMso+YUDzc56FAz5OpReWYYDuyD/tUfjAQ+3cHxawKHsEth/bYPDly98UdSQ5DQeGwPTFbYfwjQV5BtKm5oHbRf5IdQMXk9IUSuEj6BB8T9mf20HP7VgwxbDKI4OHC0aV3iB5Az2PZc6A+nDH7t1N7oponP0ibxRp60T3ORUobWdiuKnd+2RZaMJ5cRYWCGxGzDrH6QER5T1WMuo9k2I5JKqkey0NQfQbFmpzgpOGRRhLv36ZK4Vbm2QIT8TCyl2IVkIRhlL/ysIcK4I1PsCfff1jnez354excE0cYkUoHSj/TFooK5H2OrkpQwaXXPFdGS+c/3qoxtn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEwRZZmcwzQtIiNRE0bNc/XBc5E21easpUXT1BfBnM0=;
 b=DipKQnLLLJeBZpJ+VUZ3tN4m82KGacGopmx1cjV9XjR4H2BPmHJ0IZUzGjqjrRn4MgMt+7GeUsfioNz8TTEvPI0B4S+29GrAq+uikncWEiP+Mlj4WOS6WW+Q3+UqTEbfjVt8/DqHfOxw61PrbRF7qX4D7u3nSaPzIX5yefZ1wAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <aed77ddd-3db9-49a9-8a51-2df50b768e24@amd.com>
Date: Wed, 14 May 2025 13:33:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
 <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
 <44143db1-1766-4851-9a0c-7428dce9087d@xen.org>
 <c8e9469f-2ee3-4b60-a580-9705f4831053@amd.com>
 <aa6a1f7c-8abf-4af0-97a0-e0e265839bd2@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aa6a1f7c-8abf-4af0-97a0-e0e265839bd2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: ab19fff5-2be8-46fc-cdc8-08dd92db1d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3V4K0xqUWlMM0JQUHBrUmI0dWxwcTJadUo0VEhFZDZMR1lvU1ZOU0N0TGhp?=
 =?utf-8?B?UGlRWDFmbEY4Y1dPbDlZbUFUSDBvMC9ZdjdBSDdYcGVJTE15a1hRbU91T3hj?=
 =?utf-8?B?QlV1Z0RJUTlpcENqRHFpdy9sMUZMellFaURPZ2Z0aThjSTlaVDYzREhBblhz?=
 =?utf-8?B?K1BOOCtwKzd3a2dqck1LVG11eGY3LzVQZkZLK3dRQzFWeEgzSG5PQUJieGN2?=
 =?utf-8?B?WlFCeW16VzBCT09uM214Z3NFeWhJV3Z4QzZKd09wNXZlWStpNk1QamhnUlZM?=
 =?utf-8?B?RHdpUmxRVzh3YUFMRnNqcm1IejN6WDVaT0VKQ3hIcy9HYUdHOUoyaFdFdjFi?=
 =?utf-8?B?bVI0Q0xwREpraUZPZEJYcXFUazM1Sldac1pCeklNZXZ0WU9FWU5NOVpQUXBF?=
 =?utf-8?B?cWFQQnhuNkZSQVUvK205L3RiVCt3N0MzVHA4QjNwc3FFZjVkZDZ1eXFtTTY4?=
 =?utf-8?B?T0x2TjErVUVSYlFNZjhQaTdNSWdiR0hqS2V5ZjlhSHhKSm9uQTZOdEtRTjNQ?=
 =?utf-8?B?VjgrK3p6b28rTDlOcklxZk5zWEU1TFFoaXdrTWpHZWRoU1JaV1FtdUtmR3gx?=
 =?utf-8?B?eEI5N3d5UjMxRGYrMXpLUFJkc3R2eDlTckdxK3FiRkFKZ3BKekFjRWQ4T1lp?=
 =?utf-8?B?OW5nQjBra2RsdUdpODNjalpzcjZmTkl2RCtoa093d05LTnYxdEJPbkZxR25B?=
 =?utf-8?B?b2tUQTVUeExoWEpTQUk0L0Y3dUxtdCtQLy9ZZ3RPT2pPOURKRjQveHpuLzVY?=
 =?utf-8?B?b29aYmVBZ1lNK1JtVElHYXEwM2tXS2NqYkR2RVU2V1BJZ1VOMi9BSVREVjBD?=
 =?utf-8?B?WHNyTkd1WVlQeU94aG1ZcHpINmNFOGlqZStVTGJLT3N6ZnFsM243SzhDSUEv?=
 =?utf-8?B?NktoSnEwOFY2R3AzdmZVSzVZWEVrejJVMUxCamFhUklqRU9HYlVoSEJzTW5C?=
 =?utf-8?B?MEFKRUNpR3R6TlQ1Z2VuOG04Yy9IMWZQU2l4NDdmWFhnTlRkemtlYW1ZUjZP?=
 =?utf-8?B?REk0QzBkbXQ3bHNFbXNmTEtpb3JudGdJeTV6L1B6QjlzS2JJYityS1FSZ3Ey?=
 =?utf-8?B?bkIrTHNaeGtNT3dhQjRGY2VKR1A2QUFVWlduZU5CemhPelBPWXJOWXlWcEla?=
 =?utf-8?B?Umo4K3Fvdm4wOXJlcjUrNTNkVkJValdZVkxZSkNUNDh4YStrSEVaUGIxbTRW?=
 =?utf-8?B?Y244NndLeis1elY2bVJlaXk1RVphZ0ltVFB3ODVIV044dzRHaERkQ1RiTDVP?=
 =?utf-8?B?Z1BITXBGdkUzVWZ5NzFqdzY4Mnd5YlptWDVxRmRWMllYbWwxZHVkLyt0L0s0?=
 =?utf-8?B?clpFZksrODJaZnZtc21FaWxKSk5kNXRUQ2NpMFZBSmQwdWRiRFpsY2dQTnJu?=
 =?utf-8?B?ZXhPRFNnVThTWTEyQXdPQVc3VmJTZ24vQnFaTHM0RTQ2eEJZRGZ6bnhlVDJF?=
 =?utf-8?B?U0V6ODFRckY5VEdHaEZKbkxPMk1PQitIT1E0cFNGR2Z3ZGZBRFBKZi9taVA4?=
 =?utf-8?B?ck1vUEY3azVhaHJpZ0RmQnE4eW5TQ2pNeTlVZXU0VmxJMmx1R0E0N3E0dTho?=
 =?utf-8?B?cVB3U1RzTVNHV211UHNvcW90cVIydkw3bkl6WnlyczEwRXZPb0dCL0hFUzlv?=
 =?utf-8?B?NE56aGFybndNbjQ5anpFeXVoMmd2Y2k1YS9RemdXbUpOaFN5cmNYNjJXMHBk?=
 =?utf-8?B?SEIyRGp5dHRUcXlERDU4bnF3Rm9tQlRVQmlzb2NBVlBGTE82bG02azUxWGZO?=
 =?utf-8?B?UDVtdGx1aVk1aExBTDZVOUZSQi91STl3N3ZxZjc1blp4WUR0V0N0aStKbmds?=
 =?utf-8?B?Q0t2Mm1rTXRxMk94Rk1DazRpMXlJcnE1RU8zQ0lUckxvenJ0UjlkdnhGV3Ez?=
 =?utf-8?B?eXorRW9NWitzRHdJdkZiRjFLMXFtZUJYckdNejZwd0ZOV3RjVi8vS053Nkh1?=
 =?utf-8?Q?vLqtpSZDcuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lUUFpKejBiaXlabE9TenRrRjdmVDgzV3JNVVVUY3dQeUtsbGRDQzBaMWds?=
 =?utf-8?B?VFJRcmVDcVR1VFNnRzJ5TDlPZ3NGN2JIWWgxQ2NzejhYcSs4SENJUmdxSHJh?=
 =?utf-8?B?NGFnbjhuL1hiVTkyNkJ6OVNUeHhsR01sdS9QcThZOXdpVXFiZ2t6MUZPOGMr?=
 =?utf-8?B?Z0tSQzUwSEFUOUJES3NIellyUzJnS0l1eGtWSys3eHlRV2MyYzJxVEJqd0hn?=
 =?utf-8?B?bHhBcE0wOFoweTNMRXpwbktsN1lFYTJpcy9Bb0FWcXdvQlFsdHpYa0t0UkxY?=
 =?utf-8?B?a0JVdG5sSlkrTDRqUFhUMFUrektBMFFBZXBHSC9FZmxjdlhJSXAyVmlKR3gw?=
 =?utf-8?B?QmtQcEVNQzczSGg3b0JSck02YlVuZzRNRGtHMlpOSUR0dkhjSzZIdm9ONTFl?=
 =?utf-8?B?dmpXYkNIREx2V01WdVN3RGFucHI0QWNvQ1VVKzUyNUg5ZUhYVy9YTzZCNTMw?=
 =?utf-8?B?M25sUXlFWm04aEVVcjcyMGI3THhYRmUrdXl6MHZLMzNBWTFWSVhkQmJxQXVl?=
 =?utf-8?B?cFpiWDZCcW15T2g1TG5MTkkrcFN6dVhmQVZtNDhoTTJMWHB5N0xQT1pteGY3?=
 =?utf-8?B?MGlIL1FrUDdwZXNvSkZIN05PWHFxYjdWK1ZnZDVFUS9UdGdZcUw0cC9vWTUr?=
 =?utf-8?B?bHZBYlV5V3B6V2txbm5ETm9sb1QzeDlVd1kwZHdCQ3l3R0ltMXA0RnBCbFlJ?=
 =?utf-8?B?RDE5b0licDhHeVNOTk0wTmdyc2x0QzdWT1BaNS9SRDdKRjhuMkx4K3pkYnZB?=
 =?utf-8?B?c0JvNzRobytrNXY0MTRWT1NacHBheHJGakRPb0RVUkRKdWh6TjRESWNZVHlO?=
 =?utf-8?B?Nm1QcFg3eUNSNFVweE9ZNHR0ZmFPYVd5dUdxaWdiVWV6bWhMcFM1ZVA3N3F6?=
 =?utf-8?B?bUpCTk5mYzh2YmFtNGtXYXd2UUJQa0Z1SzVmNXVVM1Npb05zMWFyU09WRWw1?=
 =?utf-8?B?QnQ1WkJ2ZjY4QndrQVdqNjJzV2dBS1hIRUF4aFErV1gzK2t6cFFGd09jSWdH?=
 =?utf-8?B?bUFUSjhnV2RCTFRtMmdOci9UQXNBRGxydVhLcUlZaWIrNG9lc0VkYVZoQ29t?=
 =?utf-8?B?QjZwQWY2cHlpeUxWczgxSEpjWDY1d3VTcGd2aDVWb2tLT0FDbk4rdzBKZGNj?=
 =?utf-8?B?alB4bVFwbXdZZkxndzc4MGJZWlAzd0lmd0FoNGY1RVNmRzk1TmRSY0syVVhx?=
 =?utf-8?B?VEJFYmdJVzVaMVBVeGQ2VjBqREp1TjNjV1lCQ1lCV1hMOENSUEQ2bkNuUkYx?=
 =?utf-8?B?cXpyVFdHMGJRa0VUSHB1RGZjTG91bjJTL1QyenRMTnlmVXlhNjEzaTdjRklZ?=
 =?utf-8?B?SzFWRXRHRG1waEtjODBmZ1NqT2N6TkxDWnUvemZQQmdtZUN3ZGhVbXpkWkxP?=
 =?utf-8?B?cnhwRHhuK3JFM1JNK1VGVFFkbFJ3eElITnFOYTI5Sm9LZDNxZ25jQlQ4OVk0?=
 =?utf-8?B?alJWbFhCa1drU3FyRlN4NDcvcUhqUzhFbWptK0JrdWdUS1ZETU1wa1ExVDBY?=
 =?utf-8?B?YUtmb0RhS3BlNUUvc214WFhwTG02bks0a0dYSkttWXRvN2FrbWJ2Q2xPMU9O?=
 =?utf-8?B?Mis0QkhFQTFLaXhaVUpKNEc0WEhCaE9YVlNXWndBQnlqdlVWV1lURjNqdmI3?=
 =?utf-8?B?YWVRWXA0V2tneEtYS2R1L3NuVDJmcWkrQ1N4Mi9Gb3VNWGQyeHE2aHljbHdW?=
 =?utf-8?B?NWJCWWNIb2VGQmlIQXUvQmJ4VGVuU2lFVk5ZTEdIbXo5bjBGcTQ5YXFvY2RP?=
 =?utf-8?B?ai9SaDAzM3gxQkxwQTQzN0pvMmdWeU5HV2VhK3FYaDRPYXEzS0tDV3NycmxT?=
 =?utf-8?B?UDY4NzY0Z243ejdKbUdNUEZVS2FObGpDWlR3R0hrRjREeElTVFVSbGhwY0o1?=
 =?utf-8?B?Rk5JSk1XNzZUSmRrNkJSMjAvN2hvUDlROGt2Tit1SW1VUnJPbCsyVUx0Q3lq?=
 =?utf-8?B?TDZmcy9INjRkamJCSjR6TGVheFRjMUMwMU5RcFdSVVJNUjB4Sm4wL243WHFs?=
 =?utf-8?B?RzJndGU5MEI3VXN2YTFIT0pUNVgzU2orRlRRa2IrWEtDWlVWNzVOaDhUak0x?=
 =?utf-8?B?NWo2eDg3ZExIWnFrcHE3NW1IQjM1bTVEMllDbUNHY3lESlhCZ2dvaUVkbXA0?=
 =?utf-8?Q?nWnciV/BEhg2r/ZJy/peMJ2UZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab19fff5-2be8-46fc-cdc8-08dd92db1d9a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:33:15.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URbZ+iluBH926m27iWPLcCReu6RrRQHfL8aBoBQrTjzmODLsur2KKixrKF1a4rnQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307



On 14/05/2025 13:18, Julien Grall wrote:
> 
> 
> On 14/05/2025 11:51, Orzel, Michal wrote:
>>
>>
>> On 14/05/2025 12:06, Julien Grall wrote:
>>> Hi,
>>>
>>> On 14/05/2025 10:57, Oleksii Kurochko wrote:
>>>>
>>>> On 5/14/25 9:25 AM, Julien Grall wrote:
>>>>> Hi Oleksii,
>>>>>
>>>>> On 13/05/2025 15:29, Oleksii Kurochko wrote:
>>>>>> Refactor construct_domU() to improve architecture separation and reduce
>>>>>> reliance on ARM-specific logic in common code:
>>>>>> - Drop set_domain_type() from generic code. This function is specific
>>>>>>     to ARM and serves no purpose on other architectures like RISC-V,
>>>>>>     which lack the arch.type field in kernel_info.
>>>>>
>>>>> So you will only ever boot one type of domain on RISC-V? IOW, no 32-bit
>>>>> or else?
>>>>
>>>> The bitness of the guest and host should match. So, an RV32 host should run
>>>> RV32 guests, and an RV64 host should run RV64 guests and so on.
>>>> (I'm not really sure that on RISC-V it is possible to run with RV64 host
>>>> an RV32 guest, but need to double-check)
>>>>
>>>> Therefore, my plan for RISC-V is to have the following:
>>>>     #ifdef CONFIG_RISCV_64
>>>>     #define is_32bit_domain(d) (0)
>>>>     #define is_64bit_domain(d) (1)
>>>>     #else
>>>>     #define is_32bit_domain(d) (1)
>>>>     #define is_64bit_domain(d) (0)
>>>>     #endif
>>>>
>>>> With this definition, there's no need to use|(d)->arch.type| for RISC-V.
>>>>
>>>>>
>>>>>> - Introduce arch_construct_domU() to encapsulate architecture-specific
>>>>>>     DomU construction steps.
>>>>>> - Implement arch_construct_domU() for ARM. This includes:
>>>>>>     - Setting the domain type for CONFIG_ARM64.
>>>>>>     - Handling static memory allocation if xen,static-mem is present in
>>>>>>       the device tree.
>>>>>>     - Processing static shared memory.
>>>>>> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>>>>>>     this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>>>>>>     at least, now.
>>>>>
>>>>> This looks shortsighted. If there is a plan to use CONFIG_STATIC_SHM
>>>>> on RISC-V (I don't see why not today), then
>>>>> I think the code should stick in common/ even if it is not fully usable
>>>>> yet (that's the whole point of have CONFIG_* options).
>>>>
>>>> We don't use this feature in the downstream repo, but I can imagine some
>>>> cases where it could be useful. So, for now, its
>>>> use is purely theoretical and it is a reason why I agreed with Michal
>>>> and returned back these changes to Arm.
>>>
>>> I strongly disagree with this statement. If a feature is not
>>> architecture specific (like static shared memory), then the code ought
>>> to be in common code so it can be re-used by others.
>> But the code is not common. There are still 900 lines in arch spec dir.
> 
> Sure. But my point is rather more that static memory is not a feature 
> described by the Arm Arm. Instead, it is a feature of Xen that is ti to 
> device-tree. So inherently there is no reason to be implemented in arch/arm.
I agree, it can and should be made common. But exposing only callers makes no
sense at all for me. Callers should be exposed together with feature code movement.

> 
>>>
>>> Also, AFAIK, the bulk of the static shared memory code is in common. So
>>> it would be rather easy to add support for RISC-V if we wanted to.
>>>
>>> Given the code is already in common, it is rather silly to move the code
>> IMO it should not be made common in the first place. I don't like exposing
>> callers with the big chunk of code sitting in the arch specific directory.
> 
> So the concern is we didn't go far enough rather than the feature should 
> not be implemented in common for other archs, correct?
Yes. Oleksii exposed only callers. His intention was not to make static feature
common.

> 
>>
>>> back to Arm for then moving back to common potentially in a few weeks time.
>> What about static memory code? With the recent Oleksii code movement, the inline
>> helpers like allocate_static_memory() became unreachable when the feature is
>> disabled and the main purpose for helpers was to avoid ifdefery.
> 
> Sorry I am not sure which part you are referring to.
With the current code, allocate_static_memory(), assign_static_memory_11()
callers (that were moved to common) are protected with #ifdef. This causes the
helpers defined in case CONFIG_STATIC_MEMORY is not defined to be unreachable
(see static-memory.h).

~Michal


