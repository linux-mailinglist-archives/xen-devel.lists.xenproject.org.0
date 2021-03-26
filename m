Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5B34AADD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 16:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101888.195183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPo0o-0002HV-Jl; Fri, 26 Mar 2021 15:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101888.195183; Fri, 26 Mar 2021 15:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPo0o-0002H6-Fg; Fri, 26 Mar 2021 15:04:34 +0000
Received: by outflank-mailman (input) for mailman id 101888;
 Fri, 26 Mar 2021 15:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPo0m-0002Gy-A4
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:04:32 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 234b433f-7c5c-4260-bb5b-1ef1b52de579;
 Fri, 26 Mar 2021 15:04:31 +0000 (UTC)
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
X-Inumbo-ID: 234b433f-7c5c-4260-bb5b-1ef1b52de579
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616771071;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=POZK0SEB8+3+pl+ZTLR6JNgeKpAxwiaBERHnA7valOk=;
  b=Yz7IYf8zfgCl4IfLCnuzK9Tlku8PXIBCxIILXhJBuAdn80h930feUR11
   iVqZeRAIhh7YcFYCFTkfwdjGexR9e7NxcxcIk8aga3vBeeG+cg2CP9ijm
   AM2giz8vpEMys/zXyoN8aknvlL0VFAONmRfkrr8TzaYugAXOZHrolCVgM
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iHIIWWgkd1Hjdb4FE2sQJEaWGliFqc2Yq/uhh8oP/o2E2UKpAgeBLUZAZC/AdUz95i0nGZQ5MZ
 /eJ87Y0+oN7GvOTKpI4kR4Ts1SlKT7d7BjhQ31jA+wiMlbzteCnVIjheSTWTZ+7poiBs3naK2o
 BTvHqyYsSnvGX1H/wSn2zkgORZKRC7PsViIzSGCaaEMG6JuJjb8I5RyKyAaTmhz+jOtnOtUvEh
 IOEdtuarcdnoDiIPfiVzptVFhskQzWr42oL6eodqllMdGjJwdYoRGE51y+VYEv2oPcYCEe99dR
 WJM=
X-SBRS: 5.2
X-MesageID: 40377433
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.81,280,1610427600"; 
   d="scan'208";a="40377433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYdhipyOeDdCZbsbLfuMM8wdS+69ehSznJEoHU669nBcFOTBcbTe37RPac9t6The+3YppEnAsScKH0KSw2NotfLA88kXjKyA+OyciqJw/P61AvX3UE0pTBTRCi58k02jhX7Np3U+XD8ZVeunie2zkADPetdP48GWdMK6J9+HRNKwjU9ls29qRM0MEym8Qku+hl3jeXlc0/PnmPmTnQW9lOhXPkaHUvTG1B6B9/grYzbl0r99oUl3uF9Yt3JcW+DQqLVvtR8TiIafO8Ay1ZgY+hjSZZ5jyA9m5/KjGI4vXdfUz9YoSUahnEpXUkPbF3JbFQeX+ejpq0tMHLf1j2ne4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POZK0SEB8+3+pl+ZTLR6JNgeKpAxwiaBERHnA7valOk=;
 b=gAFXZ9XcxnLk3PS3OlIUU/ev/lm9IwwCLKMph2b/rzJyGT09Dqvfa36h6ypq6JoQ3Svwn6UGIf/DDr4KCo9tTcsB+ldrU1VgbOs5k/Q3W130Ldp4IOo+nwFucOBOsbR89VIZqaSSLLxxPAuP4xKLw/D+wqVbch7VhzWgXFssWYQV+80qJIcOq8PMyHr1KO9rWw2H6WP5lz2FCM18GpyAxoZkOWbMiIJ48aAmStVor1MqW3890vAY6RKDZK708PZhNnmWLcwFPbnEDXnu6y/nu+2SmRfJFjkGa/KT/Q9DaEPu9IPL08VBeAXAM/PRLoyOlK3IcwqdiFv/6fDveS8wDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POZK0SEB8+3+pl+ZTLR6JNgeKpAxwiaBERHnA7valOk=;
 b=XNqed11FzFdY6eRQSldYfZnsnKuriVU29Z8LTkEBr+hF80y5U4fTXf61dOvbMLRPQe3tJOgb3krCrxwJXKzTQwvZTxwBYvs4tAlh33w4qb7AZgB6/n4GkpN6kTCVEKPuOvXQVR8+MZQr99KiIfwh6Ijb7nhe+fDE6ahT5RroxG4=
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4785d809-956e-07d1-0d5a-ee5ccb54e097@citrix.com>
Date: Fri, 26 Mar 2021 15:04:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::22) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5decbac3-419b-4ed3-3ddd-08d8f0687308
X-MS-TrafficTypeDiagnostic: BN7PR03MB3617:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB3617ED9F61EA945A92C5C329BA619@BN7PR03MB3617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yafINrfZktGbnqHUZSa9DO9lZPp016Fvqp+H5pAJnfMYCJ0RkzDm/3MZCPHr//XWdxZ1cE4Pk36wi3Iu8GiKRBdGRNuFHItH/45cPdHhpmra1eOV2Z5qlGuq+tyITVaGkWVhognaEGVwyZiEExLewdRbRJjL3cWEyf/nitFBDxxEfO2pyb3cvcluuajyTQBymXUWq+QcbGnpXYhxZFXAcBtlOGF+aTnIb5qhLkvsLZX9dunznsC8iIjq43pqRX/nYKNjUG7HtXFPiXxb0oeGagJC2zvOpeX98WgVUlV/8bz6H8EXRpWGc6tSWYyIh9e/Snrl+4BW7f65oMQXC3pW52HXPMz61GaSjtKDjA1Gha4MfoWB2fMaQR7EVkCQCRCYUPatcXOL7/FbXwE8mA0CrnUyxztceh2wRtWt0AzjF+zS9BPSU5XfobcqSFokPTiD3SmNb61m9C/5Cu/eMazxU/7CSse3kuSZNl+esVpkZOpY+SwdZlH+5reUUnR5gE2GFpdkQksgD6pa2YJ4hZCIi4jvrm7TXCust95ySPKdSe7PhMjnP69bwxH68xbXhfsTGx6zSgPTeyqzSMrIFlRsZv5H/QSSIBJbkrjk8LnXHYRLtrKhzKDzX2sUl1tEoTsd3HKmXBwkxQuiKGj7uUBnyuwxE6oATX4yGn0SJb8ZRCFZvQdA2/F+7ROLg5GdDFpF8FQ1s++xtzxwhZRzoP96fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(8676002)(38100700001)(36756003)(31686004)(53546011)(26005)(316002)(8936002)(478600001)(66476007)(66946007)(5660300002)(2906002)(2616005)(54906003)(6666004)(16576012)(6486002)(4744005)(16526019)(186003)(4326008)(86362001)(66556008)(31696002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eXozc0EwV0c5VGNBNENRNHdlazZEbzFkSGxYc0Vab2NrNWN1OTByUkliMTJE?=
 =?utf-8?B?RENnZ001WjNOQUsrTUtkNys1eGEwa0t2UXRtKzBJeUppUGgzeHpHOS8rZjZ6?=
 =?utf-8?B?b0NkUGxvT1M5RzZ6dmQrVEQ3eThDUzkydmlwdUNCYlBhU2ZuSHl4U1FRRStj?=
 =?utf-8?B?UkZqOGNlRnJ1RStYWHBtWHJvUDc1TDBsVHBsY2ErLy9SNG5OQzFNVHUvMW0v?=
 =?utf-8?B?QTAxamN5VzRtMUhNeEZTajdHVTBRSUdXYVNHNHNWU3pBSlBNWjFjNmdZOGN1?=
 =?utf-8?B?a0VtTCsyVmV5M1YzR3NTbmxaV2t3S2dqUEhyblVwN0pQSjNiZGJuVWRGMHFJ?=
 =?utf-8?B?cE5DVCtlYkxLRnJ0eGFyUVRvK2M5MU8rL2V5V25ENVJXaDNKWnpCd1ZpY2pE?=
 =?utf-8?B?VUJzK1J2d3h1enp2K01ZOVIvOTJVYkpxTkZUWjd5R1lnYmp2K2JQWkp2alNm?=
 =?utf-8?B?OFQ5ZHdNVVkxMnEwQlR1R3dHM3ZUQUEzbE9QY2RYWWNKTmVVTmM4NVU5NFJy?=
 =?utf-8?B?K3FnOHZpOU5ZNHNaQUVsT0J3Z0RDYmM3NHYwQmFTb2k3ZGd3cGdqeVg2aFdl?=
 =?utf-8?B?YVI0OC9ycC9CSWFhNVl5bUkvMDFlVHBYREM1dFpVUE5YOVNrSWN6NnllbTNY?=
 =?utf-8?B?bzNDc0toRzh0bFZVRm5XUzU2UGs2QlFpNVV3dEJWTFVKL1VNZXp3TXUxSXhK?=
 =?utf-8?B?akoyT2RsQTBvY1JDMXo5enhBZjhrUkNXdFlyc2dNeXB1VlNOQXlKaG9pajlk?=
 =?utf-8?B?Sjd1aFZXeVNwWnVKTHJ1L3NxUmNseFQyY3czSmhhaWlYcWs4dmNISkM0Rjhm?=
 =?utf-8?B?b1d1MkR6eHUvQWpmQ0liZ1hRbGNNbmtScFdnZVF1OWdubXJaNEVEbzZkeTdp?=
 =?utf-8?B?Qm15WUlmWmFwSDlaaEtkaURMR1R1OWJVVHN6NzRpeFZUYnVCSC9idGpOcGlv?=
 =?utf-8?B?ajROSnhnbG5NK1p5VGMrVHJIQlVtT2ZQc25pdzNkcE93MnltVEl2SjNDZElS?=
 =?utf-8?B?b3FOT3NURk04RXg2SkNNRzVvWG9xbzNWMlp0U25xa3diNkpuN1ZIa1NEVU9N?=
 =?utf-8?B?cW1BaHIzdW5wcTdJUlF5WFYxdndSY2J6TXZSNjZ1cGVDd21IUDVQNWwrenEr?=
 =?utf-8?B?WDhvMEsycmVFSzNGU0MxeG9OSndQSnQ3QWxTcnBhajRYQS9nQnNNbVpHTTlQ?=
 =?utf-8?B?S3hvWUdJRXk2a2RUTW54blQrdWd0UzA0TWJDU29BZitrdzJTWmtsWUwxOTRU?=
 =?utf-8?B?ay8yM3M4cHdwdXlMc3Nsa2pSWlM3U3ZFZlpaUVFkaXdycFZ0UndQQVc1cm1X?=
 =?utf-8?B?L0xtUUY3ZStLc2dWNVRFSDB4bFZjOU0yWWg4aEo2UWRZMzBxZTl3Y0o3c1pQ?=
 =?utf-8?B?bDBoWTI4eXBEczNPZUZyWTNqcE5FT21MckxZNVJhenFHdEpmMGJMRGlwbXRi?=
 =?utf-8?B?SGxDTlY0bDhTSDZPKzJpVEk1cXF3UTJWNDVCUTFjbnlraUVaSTdCZmlxNWk3?=
 =?utf-8?B?a3AxRXN0WGZQVlRlWUo3MzFITzEzelowc2E5UjJZajFnVnpYMGc4VlJialYr?=
 =?utf-8?B?VCtWZGxtb0srLy8ycUl5YW1HNmx2NStpNFZVcWx1ZnhRbWkrOXhENGhEMW8r?=
 =?utf-8?B?elR1cmRScHRNY1lKSExnOFUvN1VVZDdhejNlcjFSWHpDS245ZGl4ejVYMXJu?=
 =?utf-8?B?enNYRlB6RGJJem5mMHk5RVRnVVkwZlYvUzVsUmlHZ2NEaml2Q3l2amdoV1RU?=
 =?utf-8?Q?1e86NJhpcAkDKQMRMuxfIFw1RaIHp86mUbGMfOL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5decbac3-419b-4ed3-3ddd-08d8f0687308
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 15:04:27.2958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olvionpR29HyjIh3aKmOyBmNs8JZABCwMsKAok8G2+51b6RcpNkdOy7ckPQV5hhHE3Q9a5+WaiiHt34wx5ZSrCFf+QKAVdO6fVC+vn/AWZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3617
X-OriginatorOrg: citrix.com

On 18/03/2021 21:36, Tamas K Lengyel wrote:
> When creating a VM fork copy the parent VM's hostp2m max_mapped_pfn value. Some
> toolstack relies on the XENMEM_maximum_gpfn value to establish the maximum
> addressable physical memory in the VM and for forks that have not yet been
> unpaused that value is not going to reflect the correct max gpfn that's
> possible to populate into the p2m. This patch fixes the issue.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

