Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8B3A6B55
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 18:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141693.261645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lspBF-0004ts-Mh; Mon, 14 Jun 2021 16:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141693.261645; Mon, 14 Jun 2021 16:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lspBF-0004qO-J9; Mon, 14 Jun 2021 16:11:17 +0000
Received: by outflank-mailman (input) for mailman id 141693;
 Mon, 14 Jun 2021 16:11:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGyB=LI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lspBE-0004qI-B9
 for xen-devel@lists.xen.org; Mon, 14 Jun 2021 16:11:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f54a521f-288c-484f-8468-108234d9dc30;
 Mon, 14 Jun 2021 16:11:14 +0000 (UTC)
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
X-Inumbo-ID: f54a521f-288c-484f-8468-108234d9dc30
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623687074;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4IXsOE+0doyab0n3YENYho7vANoNoNBsDlgqAt9hDvI=;
  b=Vo9Z69XeEkhLfOzMjE2rop+f3gM8nuLpAipC75nLUvyy44g/DHOM46Xm
   g9ISIjbujwHWGK96Ir6oX8VvpMNaB6wdcwoX9bJySWCJU7llisZprSfLQ
   SB6JIyn2VV3+s5CufGAy9z/C6rjptm0FAOejmHwhcM9f1Mtt4i+7TPsPZ
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mFPjPqHycggq6xH14w4AXiI7pHdrnpP3SBs9Ok2kDHjaCixgq0QERYHiogCxZrqaSng4iDcwbg
 h85rSOw88IpQgZ4EGdVMT7c5+OKfpsBfQMytes0HZ5mqMgzoXRjvSvT18ZxzvwhCmJldIdFkZY
 EiCs8yhstAvmFQ/wz8utlwkgp2biy6UpPfE4+7ZmtUSDNJ7MRxG30Q5hjCf3xLDxaao3upVgKT
 TuN2FCnmQO+wkdmUoZCGn5vER7cqgbpUwIrvV/eVjbJHWNRWvU/olpB5xUtzLhJcO1XF1BBOfv
 S98=
X-SBRS: 5.1
X-MesageID: 46087402
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ou7RpKxzbtbig5npjnVlKrPxG+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE80hqQFnbX5Wo3SEDUO2VHYYb2KiLGN/9SOIVyGygcw79
 YCT0E6MqyLMbEYt7e03ODbKadZ/DDvysnB7o2+r0uFDzsaEJ2Ihz0JTTpzeXcGIDWucKBJcq
 Z0kfA3wAZIF05nDPiTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIA/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfoWG0hYczDgNkGmpDs1L8Yqq
 iIn/4UBbUx15qeRBDwnfKn4Xie7N9n0Q6d9bbfuwqknSWxfkNKN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amCa/hGrDv8nZMZq59as5Wfa/prVFZbl/1UwKqUKuZ3IMve0vFTLA
 BDNrCu2B9mSyLsU5mChBge/DWFZAVAIiu7
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="46087402"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbONE5NoXo7m1pHQyZhLFz0wcBuIPd4osuum8tUHTYDQil1OykoEcJPwKI7qWRR1srKLtVAxOohk9O461eh4zMouPK7y6pjm2CUVEVHlHm1L1mEWnL+OdbznHCMnrHNJ0+mC/s+tgawKb5bmUFO4DfpJ5EVxw/WTelKip3cFVQK6xS+eufN2UadKZ3V+wOVh4eXvsk4MUsZDBgGe8E6v492fzgp3GpqY5/S/4sMsOjuvWKlPrfg/NbOwujQkMbbnLpuVa1LgoryqAI5KRuB4fOQWYsRHCAnkBCPmFsw2CwryzKg72JEXVxXKPLSqznV1MROq6aoPJ8AJP6/LbDgQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSYu2yIruysuaHr2D9ceHUQB+jqmnGD4Yn63V9Hi2o8=;
 b=gCJEDvZCwelzomfSq8fg28/i7UFnHlgtqPKK+J4JEXQcJDH5uxIz/ztEq1Lr4p8fjvW0ZTNxfw39wssKDyGgnnECDq0+VXNr+M9z0xXIaViH1CfF1pjewDyo/a6NeBhYW972DLOgDAN8XdkijHl2ZFNV6wWtyDRJN91rCTJtw/16eLd3reupttSmE6dxk8Kprty7pLEG/MUnpTV0jaAXLkcPotnx0w5I/7yEs/lLUQGrqs+lGYwd7CD8nseQ03g9psIWdN8odYEkAHevuFGFCPsJuxQdGutao+OPA0J/qhRHSGx86afXVm0ArNfyWAPnJf4Yj5A+TxOtE8rhwOw8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSYu2yIruysuaHr2D9ceHUQB+jqmnGD4Yn63V9Hi2o8=;
 b=VjIdSpICTtu2h2YD4tbmPdLWn0AW4nhB0qBnL69eJFwm1ZhR8P83XJUpJJyqACsBmNPBisGrXlYO3g3GUPJ+PmrE3+jhyAPXiWZasZMR/u4Mtu1RMe9AS4QCpj6QEKX+yamxlzqo+5wYMdh5wWN5Kip7+76mY5cXOMEObfrh1kE=
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, <xen-devel@lists.xen.org>,
	<boris.ostrovsky@oracle.com>, <stephen.s.brennan@oracle.com>
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
 <YMdZKuKOnFKpQ3sg@Air-de-Roger>
 <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a7ec2d98-465a-9691-ab73-bef5b45a6cfd@citrix.com>
Date: Mon, 14 Jun 2021 17:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b47d425-3398-435a-2571-08d92f4f035a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3493436D606F4BCA9FC94C2FBA319@BYAPR03MB3493.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvNCSFBDgWmgjPhMu0Su6ui/Al32Yj+NEnamql/Sls0odhHPLyMIFAblsiHIXZILjRnxBk8A8i+ZmT07AfYtNuVCSpF7Cuh+Hr04Bor+08GdD9RPH0U03LhXUeUXe6d1v9nMHCGo6iGfYBawj/kRMkHyMVo3TAR7EwLDyvCnwzmDeGzaLj/yDTuBUup6A5XsNp0Ub092Lv25zYPylObOfBD7/DragmL2CediFPdd9e8FgDEXbCphkWN8k8WkTMeFdSSDozFnza9MJm+FmjVKeGalib26DIcbAJrvkSwBkV0E9+vEc97ONDt6HSlD1n17o1pljffYpHx9CZBJsw81jQkB8cSwG0pclOXJNZHcFj7Q6Z3GgG5Ou6ilqmx8FjrKhG+NihllmlhqtRl6khL46MyWyZqPs55hMhLuf48fuJPcJVOW7ZXuSDTMPgjFanMUIqY57/ejPEINy7PHLDsmH9ueo65Fwe3m2wy4VQvSgY130TSdLoOVR7yEdVL9U3265lpFrp77c/U4U9eXUDPwQTpYt8s2k4Yyy3YP54EvKuTm9TdPBCV6jGkx4G4H/gJofJDbAXW0cWKMUnjCi31VPpCJiPUnDm97AcCEDSAo+It1I/TVRMf6iWRHXM1ZVyGDkGHWvYXmJbJqEOPfsEj+GmHBCWhcD0v/c0bPxK6l/KsKmsXyQjVbYQ5tdssHE7TV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(4326008)(6636002)(956004)(66556008)(186003)(66476007)(2616005)(31686004)(16526019)(8676002)(16576012)(110136005)(2906002)(66946007)(316002)(26005)(478600001)(38100700002)(53546011)(6486002)(8936002)(5660300002)(6666004)(86362001)(36756003)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVYzRkM3OEVONWRpdSsvd1V6OWJIQ3BjSExZMUplQ3FxcFFrR1B0ZmhVdG0r?=
 =?utf-8?B?VUJuM0RkY3dNMXVaNk9Gb3p3RVFYb1BWdHJwSXJBdEREbXZ0UGFhN1dMNGJ3?=
 =?utf-8?B?ZVU5SXNoYkdXL3BoSFdKN3AxUHluMXJ6YmtGVy9kTzAzTnovVGNUL2JSVkJn?=
 =?utf-8?B?cS9ocHNCK1FrUERNcDh5dFdFRWw4V1NZaEs2bXVSV2dpRlliZ1I3aTdjaTA3?=
 =?utf-8?B?dmxSSGd5TFBGY2wydWhDMmc3aUFrZWpGU2g0a3h1ZEVtUjZ2ZVUyWFIza0JQ?=
 =?utf-8?B?WTlRR3pTb28vVXR0VXJEMnhsdVc5S2l6UzdxLzBLN2dqSVY3VG9LY0lwbUVQ?=
 =?utf-8?B?MUsvZG1WUnJSTWgzdjZIQ0g1ZEZzUzVhcnBNbnI4dHdoU2YrODFzRE8rOExQ?=
 =?utf-8?B?cjFla0JVRkcxM1VKa2JRSEdWbU5yNHBIMVhaOWR5UUh1WnY1NzZxRjNkWDgx?=
 =?utf-8?B?di96WGJ2RlpqZHNmSWw2WDc0K0xzRWZ6ekw5Tkg3ZEVRZUY5ZVpJeTFhbEU0?=
 =?utf-8?B?OCtydDN0NWJ2WUwvTWtKeDh6T2IrMkFZN1A5ODk1SzZITERZVngzOVo5SnEw?=
 =?utf-8?B?MmdRcUZqdHZHaUFRaXB0OC9IM0gvbzRNRGJoWk1iN214U3U4bHdLMHluSjhI?=
 =?utf-8?B?L3pKaDVDVUlPYkJReFhmbGxUZC9BREl6cVN5Y0U2bmVoUmFyZHNPSXFidnRO?=
 =?utf-8?B?UkwzU0FiU3R3K2F6d0xkVzNWRk1pOFd0T0lMejVMQUFOQlVwVHhqVkNNa3dv?=
 =?utf-8?B?V3ducUlJSzVlTy9XMFZRek5GWmRmVlVubW1SWElrR1oxNDEybW9qckI5Y3Vh?=
 =?utf-8?B?d29jd1Y0ZUxvaktKK015aERkZWhUTEtjQnhZY0k4SXUxYVoyYTQzODArQkxI?=
 =?utf-8?B?bGZFWUJHSFRIQzVLTTlRelZYanFHaXkveGQxeTRvSit6VXJwcGQ5TGd6eVRV?=
 =?utf-8?B?clluYk5YeE92TmVQNUlXc0drM0oxbjJHRUR4aEJMMU16SVAwK2lwd25Vbm1q?=
 =?utf-8?B?dGhqOUI3TGpoTXB1RHJ3K0dmaUdMQmkwV0NHdTIyL1lCWE11R0tsbTlmeU1t?=
 =?utf-8?B?bVMwcUlEc05aY0tZaE1XZDQyVTNQeHlWMFRPWFRwbm9sL0RmcnM0c3JmVElm?=
 =?utf-8?B?eno4SnFTYUtHQ0p1cFdOcGNrYVVTanY0cUVxRlRNYUM3ci94K20wdmo5eThO?=
 =?utf-8?B?ajQ5WjkvODh1REE1by8veHBKTnhtT3hWd1RRRWN6bUVyV3JaUGxpTUh4bEli?=
 =?utf-8?B?NGF4QkxodXVYNGlXQmFyekZoZUVuendKWkJKZzQzWXdKcFpGTGRoTHE1RHpB?=
 =?utf-8?B?aVpXUk04T1NiSGlxazY3bkNaVGhUYit1YmRoZ0xSOW1FQ2pyZy9IU0daMkJy?=
 =?utf-8?B?czdWRG9ISUtKWERkSXRnVkovMkdqMThKVHJTaTdvNUtrZXg5MzluNEw2Ui80?=
 =?utf-8?B?MEFtTll3WWQvcVZudVIyUU90MWpmWU5hYnNGOXl1NjU0K2lLMGR0ZEJBSUNK?=
 =?utf-8?B?OHdSRDJId2YySnV2OG10a2x2Vk9sS0lNL2JNWWlweUk4QkE5cDNyV3RxcjhT?=
 =?utf-8?B?RGNUYkZOM1draUJjVEMvU1p5RE84SENla0w4YW1nRndWaUFSaWJEN0I1eWgz?=
 =?utf-8?B?OURNNVB6SmR2SE1JYU4vaGp6WlIxR242RTl2ZHpQUm54eWZTN2w1QXRCOW5o?=
 =?utf-8?B?MkRrWVF0ZS9UMnBCQXNGdUZSY0tnSzBYR1h2OWtRcDZNSEJ6SVk3L05JL3hN?=
 =?utf-8?Q?ZVdqQb4RdUsE9zSGx7poqZ05jg/BeFX5Q00k+Cq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b47d425-3398-435a-2571-08d92f4f035a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 16:11:05.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzmpuBvs6G57vQEnnWBWNEAJ49awI/8rjU7bcET0CUqe77NmqAb4dVqxlc7+hGEwcte35rC565bYiR9bi17W4ZA11lhkfIgEqQaDegNkG7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3493
X-OriginatorOrg: citrix.com

On 14/06/2021 17:01, Jan Beulich wrote:
> On 14.06.2021 15:27, Roger Pau Monné wrote:
>> On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
>>> On 14.06.2021 13:15, Igor Druzhinin wrote:
>>>> Hi, Boris, Stephen, Roger,
>>>>
>>>> We have stress tested recent changes on staging-4.13 which includes a
>>>> backport of the subject. Since the backport is identical to the
>>>> master branch and all of the pre-reqs are in place - we have no reason
>>>> to believe the issue is not the same on master.
>>>>
>>>> Here is what we got by running heavy stress testing including multiple
>>>> repeated VM lifecycle operations with storage and network load:
>>>>
>>>>
>>>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
>>>> ----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
>>>> CPU:    17
>>>> RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
>>>> RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
>>>> rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
>>>> rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
>>>> rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
>>>> r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
>>>> r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
>>>> r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
>>>> cr3: 00000013c1a32000   cr2: 0000000000000000
>>>> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>> Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
>>>>   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
>>>> Xen stack trace from rsp=ffff83303fff7cf8:
>>>>     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
>>>>     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
>>>>     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
>>>>     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
>>>>     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
>>>>     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
>>>>     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
>>>>     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
>>>>     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
>>>>     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
>>>>     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
>>>>     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
>>>>     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
>>>>     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
>>>>     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
>>>>     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
>>>>     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
>>>>     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
>>>>     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
>>>>     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
>>>> Xen call trace:
>>>>     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
>>>>     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
>>>>     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
>>>>     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
>>>>     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
>>>>     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
>>>>     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
>>>>     [<ffff82d08024324a>] F do_softirq+0x13/0x15
>>>>     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
>>>>
>>>> ****************************************
>>>> Panic on CPU 17:
>>>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
>>>> ****************************************
>>> Since this suggests a timer was found on the list without ever having been
>>> initialized, I've spotted a case where this indeed could now happen. Could
>>> you give the patch below a try?
>>>
>>> Jan
>>>
>>> x86/vpt: fully init timers before putting onto list
>>>
>>> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
>>> iterating the list and acting on the timers of the list entries will no
>>> longer be kept from entering their loops by create_periodic_time()'s
>>> holding of that lock. Therefore at least init_timer() needs calling
>>> ahead of list insertion, but keep this and set_timer() together.
>>>
>>> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cases")
>>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Thanks for looking into this so quickly, and sorry for not realizing
>> myself when relaxing the locking. Adding the timer to the list without
>> it being fully initialized was a latent issue even if protected by the
>> lock initially.
>>
>> Provided testing shows the issue is fixed:
> I guess the change here is needed anyway, even if testing finds there's
> still something amiss?

We've put this patch in for testing, but results will take a while,
because it only showed up in our weekend stress testing.

~Andrew

