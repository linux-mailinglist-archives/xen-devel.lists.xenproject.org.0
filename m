Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EF6A5DAF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503587.775880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3D4-0006Iu-Ji; Tue, 28 Feb 2023 16:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503587.775880; Tue, 28 Feb 2023 16:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3D4-0006GE-H0; Tue, 28 Feb 2023 16:52:14 +0000
Received: by outflank-mailman (input) for mailman id 503587;
 Tue, 28 Feb 2023 16:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX3D2-0006G4-JY
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:52:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2084.outbound.protection.outlook.com [40.107.13.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df5e04a-b788-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 17:52:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 16:51:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:51:37 +0000
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
X-Inumbo-ID: 3df5e04a-b788-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdPRvwU24jibs6DUdCd/BQDqksp+j81JHLd0AoqZBHPM0SYO43l1kYflEnYVq6hI3SlDBA9yqlEzpW/YVYJXIqadMsI0DoKxh3w5EfEXm+ZjAn48OeWYZTVnhD+8C3hy4W+8PB6revbbOejcbzyAuD4b7sCbLqegmgLhe9pWBuoyK3MU6TXi9j61s1NsmTn4RJDWByR0siiZTv3fFBrBnldTRdeMU/5a5G3bQciuzV5GdU6SWDntFppkEk97Cd1A5zPT1CS+N2cwjMGghmFIV4HcdYp0X9oEPYYAxZktrF78r7pJ04i5VeR5wRR1AIf3laPzdQrNgubd2iyeXQBRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8hqyLEJTtVAvew4f/pEMLzCvmFRMKYBiv3Hc/GeL7Q=;
 b=ktAeCpdt/tSlLQWmP2d1JPPzJIvHp/qyz51Og4m26P6uaEv7E6ux3Lz9xa7OCwvQa/PK/H3PvO9QGkucJzvolG6U8qcsD8RfjLix7XcWdtLUHx02kEWFaOWUNz5i3FcU39O5L1JPUTCgmaI1J/EHCABXWADWHdtGfn196R48bzMomboBT9EeV+ThYYMLEPGBsqo/ueCiFXTNiHLBgyR4waMLnxpza83v/V6ovJElV8ZMrEBnH28nEYLhkyU228YG57I3x2fBCKKkTD6RAMzlUq2rZwpe87Q18n3KPHXx2Fft5B1aqHnQw6UCouWBB5/YYi8gOnJZRNIf5CKNAHfofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8hqyLEJTtVAvew4f/pEMLzCvmFRMKYBiv3Hc/GeL7Q=;
 b=O94k7GESOvzYKKdYTl7jIIiD12LWxQcwaOcwp/KLxWHx47ZG1Pk7aPuF9x7ZvcWSQsRxC+gshWcagtsafwKiUfODtZ22W7E+OjxxlKV6guQrakMnFh92d8NIEJh92iO9XFWoNIXSxS0QDbj+478YjnnaKd/EqQ2Kok9GGSrk+fRY5phPv10LTzX+AFZ2IlPWUZ8SL2tWh/w0vtRYSxn+O20VU5ht8zO6aj4s+Mhg4EheyvmKvhB5olHQ+LaV7yAsF9awih2SBnj+B1WAN65NyRbO77hAoD6fpZTCGeD5DL0+p1pJrxSFChGgWsiyxi2m8Bkkq0dBtdgNAYevpxEpbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfd46bd8-3fa7-4880-3513-ea2cc09478d6@suse.com>
Date: Tue, 28 Feb 2023 17:51:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-9-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: e54f18d0-201e-4d45-29f9-08db19ac0eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eA5g9i/OaCGhrx+eT69gRo0GAfm9C+iMGCaykitF/iiMDM+xq6UjGROdD/0teo5Q3lNgDzUJPdl4WE/h7hluIaIhjXsWbKH0S2EWDBc+omeULee8w3bvVhduHuhUmf3csELOq0fTw93vUSNVpWL2htviqAi7CBoNMlzm6jlW1MiRvneysfscVXq/Yc/vWYm8QAEX+0pp2bt+a5ta2ir8QxMizNrAGoid4de6ZH1SANn+cBJsb7wn2beMtWjx5wxk/6PAUyVIs0faIHuTo+JBaKtsv7I6UMZ1NvzbLpiRPk355OqXbMf05PcKyxFlGXzfYdENPfLoBDros46GlM2eIcIvljOLMAA8s2ApFD7lT5tNPRuyXMWTO3GL4Zx0Mas7F4XZdfxl4Dm2pNMGXXFtFU0KVUAHql9TUr9WRMOq+buCtisuZVxGoYi3Helse6SiSgTtd2Dp1nVPsTVryBXwNq4qkZ+y8aek9VSHTbzE18Xddxnl3+XltOnGSr/Ovn2QfpCGB6WvDsvg2Zm1IA9r175jW9pfd7l8lGEZxDLudXve6P9ubHQOGbhqn+93/bBAjPgOz0Z4N2k/pr7Ht027FeUoknmASxaNAAR0VZ9PrOAscGEnlI1eMWOnS6gMEXbustwR2kHL530i7V7DzNKMV4B0rr5/mFCKX8y46R6KfGWaCSfyp+tNUJU002cjx0/VMjhRes6HQG+YrTbDRjxFb2OVLOuNvH/PzO8uRouHuVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199018)(86362001)(31696002)(316002)(31686004)(110136005)(2616005)(36756003)(54906003)(6486002)(186003)(2906002)(7416002)(8676002)(5660300002)(4326008)(41300700001)(66476007)(66946007)(8936002)(6512007)(66556008)(478600001)(53546011)(6506007)(6666004)(26005)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZ5MkJXY2hrTmw0YUR0cytUY3pINTl6MW40WXpHTnBhbDMzMTB1aDFlQVp5?=
 =?utf-8?B?d2xVV3orekREbWtHN3JJN25FZWVsc0NQSFlaV2puLzNpSlZJSm9neFZUS3JK?=
 =?utf-8?B?cDlySzllQll2dG5uTC9QQkEyZG15aThpcDkxTmljU1V2R3J0NmRyT1lRRURk?=
 =?utf-8?B?UTlvL2gwV2RYcG9XRmw3NEpSZ29aeSt3NGw1Vm5EU0xLbE5HU1lyeHIzZ2NU?=
 =?utf-8?B?NzY2ZWlkU1MrR0x0Y1k3SmxndjZxN3JTWE1nZmFtSTZ5SXN2ekJUVXhNMSs3?=
 =?utf-8?B?eGdrMlEvTVE2Y3B1Q1BxckQwZEoveVNTT3YvQXRCRmpVOTBJai9TOW9HTWE5?=
 =?utf-8?B?alB5dDVrY1pyQmhWc3hScDFVN0xLZ2JzS1hDS0JQenM5ZXN4K0hreUlUZ2lG?=
 =?utf-8?B?Ky9FN1lGUXN1Ukc5b3pXNXVQam5kd2h1TElPZ1hHWlFUM2ZzZ3dhakp3RHZr?=
 =?utf-8?B?a1BEdWdDR1dOTzBCbDdKV21VZXhTVkpCb0ViNWNyQlpNRWYzcGlZRnZYcEVO?=
 =?utf-8?B?TVpPQ1NuZlVEa2docWg4V1g3Z2drRTRsRjJaSTVqcHBNbFRNR0hPZXYzTytl?=
 =?utf-8?B?RnJ5dmM5V05CL2poVi9YWTdGZFpBSFkxbC9SMEhOcFg2UjJBQ3djZSt4TmZJ?=
 =?utf-8?B?bFprdVBRUXM2eVJFRnljL3RkZ2kxTm0yUTZWczB4TTAxM01vUnptQ2FRRUtN?=
 =?utf-8?B?MmtVSmQrM05mdWhiRTFURS8vMW1yY0F0MnV5Qk93dnZiRGo2Lzl1MDVWbUhD?=
 =?utf-8?B?OG0vQVpvMElrUkJTZTRLdTB5YVovazI4Z0Z6L1JUMEYxYWFUOU9Rd0FxSDhw?=
 =?utf-8?B?Nmh5dkthVVZpTVp3dXU2d1F4YnZGOWNRdE1HZ1Z1c2V2c29LaEhIdGtyVnRZ?=
 =?utf-8?B?WHA4dW0zNnJWempIa1VXQkw1cFZEMTZjMytDaE1pUmFZL05xMGZ6T2M3Vm9R?=
 =?utf-8?B?TDJBOXhkeTQyK0dkeitZRVBnL3ZpMXROYTg4Qk9oVEgvSFVPeEdHS1BpejhZ?=
 =?utf-8?B?QSt3aFVrcEZzVHppR25GT3E0bFdCbklhQng0SnJQSmdicVM3RWpZZHpjMHhL?=
 =?utf-8?B?UDhhWktXd0hqZ0ZqRm9TZlZvQmZiTlhLTnlxZnhDcjBiajZYRjV3L1ZtbXBC?=
 =?utf-8?B?Zlk3dExnQm1Oc1doSXBlZUFWOTdoOGMwalI3VnlCd2JORnhwQUZYMHRVZ3M5?=
 =?utf-8?B?YXAyMUdaTkVscWRaYWJHODNBNmJEK2RhQTFvaXBEWjJlbm16Ym01YTB5VXdT?=
 =?utf-8?B?M0Rqb2JJbHpqNkZXZ21NTDhJRHYyZ1ltbldxZTlqWXJsYXVxcFY2b0JiZlZG?=
 =?utf-8?B?VlhGRkFVcC94akZtQjhRRGV2SmhTNWVLTGRoV1ZCMDlIM1BncFpCYzNTeWRt?=
 =?utf-8?B?WXBiNW5JbnpUNURTTTVHWDZleS9nV2tBSGNaS3Q4VHgrSW1nM3BQNmJJdlR3?=
 =?utf-8?B?akVuUlFrd2R2VVdSV21QQmM0NHZRUkxlVjJ4UHZPekpJY3YxM3FTd2ZDRVJ1?=
 =?utf-8?B?SVgzWUM4SjJic1U3VFEvMzVjaFVvMXh4bVg0OE1LSGJTU21tRGdMNzRVbFZ4?=
 =?utf-8?B?QkpjbkVTbnpJM25QKzQ2NENCTi9JSlA3Q0hwWm95WlVBV3ZOZWIxNzJUWnoz?=
 =?utf-8?B?WVBnOEduZFFKeHBEL2VlMzZrYWFGMlZ4dmVubVhlMXpDbS9XRXo2Mi9ITVhI?=
 =?utf-8?B?Rmp0eXZDVjJVaWlVTHZBeXNROW1kSzdoalU3cndHOGs4ei95eXhDREVhMitE?=
 =?utf-8?B?UnZDNnlUZ01tRnhJTnZuY0NTNmdTTkFQL2psVC9FZVRuT3JBRlUvQXRVTmFB?=
 =?utf-8?B?aUpRRmVaN2RVdVMxT2lyczNUTGtiSkRocTgwcmtKRmY4aE9UUU53MjFqZk5p?=
 =?utf-8?B?YjZrQVo4Ynp0MWE1Sit3MkZSVjJZc1dWUlpyQ3ZkZUFPTjVPV2pkdlJScEwz?=
 =?utf-8?B?NzQxQkRHSFNyZU1TOTdxeHlMOGlSZzJRZW01QzQ5NmUvdVB4WW9JZzcydVdI?=
 =?utf-8?B?cWY3UG1lOFlZVEZMelF3UzZZaUhVWThTR0lTVFI4MFNlckZTdHJEZjRINEZt?=
 =?utf-8?B?V00vUVozZUNQdVNJYTdFZzRSZlNsdHhoUkdtbWphc0J0K0RCNzY5RVo1aEtU?=
 =?utf-8?Q?TLbF3w8ar+SFsKYmzH5GogzbP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54f18d0-201e-4d45-29f9-08db19ac0eb0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:51:37.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xkj6ueMkXzDyiHVbxQzR6WbvXaIR96B8jUH3I1Z226WOXWM/WaWglYxecBp1g8BMs+sDtVMglW98uSRqwUC7mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355

On 28.01.2023 02:32, Stefano Stabellini wrote:
> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> As pci devices are refcounted now and all list that store them are
>> protected by separate locks, we can safely drop global pcidevs_lock.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> Up until this patch this patch series introduces:
> - d->pdevs_lock to protect d->pdev_list
> - pci_seg->alldevs_lock to protect pci_seg->alldevs_list
> - iommu->ats_list_lock to protect iommu->ats_devices
> - pdev refcounting to detect a pdev in-use and when to free it
> - pdev->lock to protect pdev->msi_list
> 
> They cover a lot of ground.  Are they collectively covering everything
> pcidevs_lock() was protecting?
> 
> deassign_device is not protected by pcidevs_lock anymore.
> deassign_device accesses a number of pdev fields, including quarantine,
> phantom_stride and fault.count.
> 
> deassign_device could run at the same time as assign_device who sets
> quarantine and other fields.
> 
> It looks like assign_device, deassign_device, and other functions
> accessing/modifying pdev fields should be protected by pdev->lock.
> 
> In fact, I think it would be safer to make sure every place that
> currently has a pcidevs_lock() gets a pdev->lock (unless there is a
> d->pdevs_lock, pci_seg->alldevs_lock, iommu->ats_list_lock, or another
> lock) ?

Yes, I agree - there shouldn't be cases where lock uses are removed
with neither replacement nor an explanation why the removal is safe.
Which in turn suggests that a change like the one here likely needs
doing in much smaller chunks. Grouping could possibly be based upon
all touched instances having the same replacement or justification.

Jan

