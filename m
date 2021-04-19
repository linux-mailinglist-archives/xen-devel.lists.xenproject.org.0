Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2A2363E5F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 11:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112747.215037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYQ1C-0003lE-Ev; Mon, 19 Apr 2021 09:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112747.215037; Mon, 19 Apr 2021 09:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYQ1C-0003kX-Ak; Mon, 19 Apr 2021 09:16:34 +0000
Received: by outflank-mailman (input) for mailman id 112747;
 Mon, 19 Apr 2021 09:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xPN=JQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYQ1A-0003kR-3d
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 09:16:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edf516cd-bed8-4b87-978d-7f2f8548a714;
 Mon, 19 Apr 2021 09:16:31 +0000 (UTC)
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
X-Inumbo-ID: edf516cd-bed8-4b87-978d-7f2f8548a714
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618823791;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nq6VMSDq3Hg9M4OVHynOZLLxvIBm7lu4U6CkezA0eB0=;
  b=NPXSDf5Qss1YyaUI3jHQL7bdvpK6i0YWBCu2mEZdNiNbyr8OtxHVJxMZ
   K/UgfvHIIItZdBTccbnsKv3ePXIrFdzBoNvdJHnNsqic6e7r35UUpELGz
   BSdSXFenuu+4evXOqHQCaPyJs89s8fSwuWbbX5kGg0bTdXsoOKVaNJQ3S
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MX7KVcCsGh5U0FRapQiRICjmg3Tc5tUhf3H7vHz6cKqE3h/s+0NlWr4HBFv6HzJKMggbtHddl5
 wHfwzulkov3oQ2+rW27hn38DoOdQANw1z3QsdVi5mEM8Bcwh/xEBUPgYkKLmodRnAAOLw8D3pE
 NkJDTMDLr82dm2df76qgJPXLWyxkyhlHssk+0Xeub6O8xPi7qGDRTS8HL51EZ7nPDLuA4L1IeX
 dIa96SSEzNRh0rSHluehWWY285QUXIMwRoAjXinoHwVpE+KtEO7jzS7xmrPgUBroLHwQzio3Ru
 /Z4=
X-SBRS: 5.2
X-MesageID: 41870793
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:a5htuqzOAU4gtFMvsWj4KrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.82,233,1613451600"; 
   d="scan'208";a="41870793"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT18DcPMLPQFayN/O4ekb8HxsBXjvF7Zsa/4gDyE+gNcyJ4O4UkQSY3LNK2KtoOKh5Wp/yWfR4WMa48B3c/BI0zYPObOCraCPHQOTWTN9MgqItbx67gKkgq8FY2m9J1YfUdKGWK9MXW3ljIIfs3pJxmQr6wMM4XsCLHw5IugFpHEDlg2K62ZW3y04yQuEw58KViO5zNXRBEKwWsZtHhBF0nPS9w+3xobKftLvwQE28YuKJhTGMS2zH7yCB8aLYe0uls/YeQyw793mg8a04dvSQ5KF89hvgvvpPmbKVS3ly+bb8qy4f00l1p0cyQUCUk1hKOkdNeD/5rXAvzHs3E4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PLY0aKOfIuDgUiZ8ThRy7y/O7VBHTAieLUwYA6ba14=;
 b=oMgBGZW6wOQebqolBItz4K+3g/fnegTLDG5xPFyssjHy88ojov8SBCSkbtPrQGeCOidmloOW4RXiZyijdY0iRsAYWb8NGED+QVwk0/c97bGEp169fcrG8CTDYBZdrnClVyUR+CsfDu77Z1QZ6zdopevmpVrOCDHE2OjU6yIuu+40pNRfFw1Bp6qjYxUqQ7Y4ie/8pxFrua97FuZTaFxAF3og2Cu6ZKJrazpASgDivdAHMLQ/QWh9Vo7M0Sr4Jc51khyOYn5UPjpUv2TLc0z2HqQwW4SJy8eVvPLURJN+6QKhM3YCcDfHwLSpvihxDpO0ngul/6RW9YF06F0rFzkV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PLY0aKOfIuDgUiZ8ThRy7y/O7VBHTAieLUwYA6ba14=;
 b=Nr0sZ4CW5E/fjDhEaFlltaUZkOCg98A9JGVxtyp3dbmVnmX08+CMEG24sTC6WTbs33sx1v4iZOajB67WYcrHhdjjIhLD2tf6eS7fa2tw0XDbffpuEhM6ubHE5pNoDpLWYNjLU/cXRBW6rli4u9hWRi36MTto22f9BMqBhEa7bKU=
Date: Mon, 19 Apr 2021 11:16:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
Message-ID: <YH1KZhLrC6anI/Hm@Air-de-Roger>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a519f0ce-0b8b-429f-e1ac-08d90313d06a
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB560601E04D1D0390EDB7B9D18F499@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XzrM8lw73HqGYr04N3NKDD6f3LnRsib3X5o4kWEziLKR0cEQED5owW7E7t/ekDmi+eETpaWP9O7EiuZgL9bj2ItjEVH8WN8TvRDAouNcw2I/WBF14JVaqVQyEUeqMLNXn6jg4YHuXzV8UW9WgqQeavoQ9y78M3VtY6sbW6i719tyhWROfy9b+yf2Boi/+2wnm7mhIxDcus0gne55KvFZsENgm1SjIEuzBvoGu1PFdfDd0uu6JUVowBRrusH9VXo5r4d4/ayhaFgQ62AEVc83dFwkPRayftfifBB8IJU4hSdMuB/6XKX/IcExhDcBzXRIyYnH6EDzlK5Sm3bCxyHORbVAyCeyKNrXM/gH3+KdZsGV8fmSsQBLPrPl5iQYAJQfD7r8pU7czSnRjcVCs4AL/8aVUp6eCiEljlogqSOAqa24Q+q1KJF3lE4VRGSfrPjBBXJkIwor0O6YOL1kXpnomXuBSdpJlQhWWAQwLzyIMIgUjc5CBy2rLwnREwByjRfTutQIuivE+WV97xPSfZPiKNXan8OK6kKZ9ZWXq1sgo+0tp+aTsBM+HCQfV5ksLNFw8LFPtDqKKtQ0FLoEt/PPpCGV4mqOHIEq3cQFQwj/Bfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(396003)(346002)(136003)(366004)(376002)(9686003)(6916009)(54906003)(38100700002)(5660300002)(85182001)(2906002)(86362001)(6496006)(66946007)(16526019)(83380400001)(8676002)(66476007)(8936002)(66556008)(33716001)(956004)(6486002)(186003)(478600001)(316002)(6666004)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RDFpejUySmI0dm9GWUh3ckRoZ1RucEhxb3dCV1NHK1k0TTBLVEwweFpnV05M?=
 =?utf-8?B?SkFROWd0T1RvSmgwVHVSWXZoQmt6VG1Cc0hDam0yZHkyUnFTeVUyemQvSFJC?=
 =?utf-8?B?eGR4dFhXOFlrcGpBSHRNTmZOSnJPa0owQ2o2Z3VaS3ZPS2FoQTRYcWFFQTg5?=
 =?utf-8?B?cjFUNFRuQ2UwY2F5QkFpNWRNMkNkdmc2VnBtU25PbzlsR2RLZFdOV2lKNCtT?=
 =?utf-8?B?YzJwbXlRZkZFMGM1Qks2MHJzODZWSWlHcEE3WTJOMjBrSnY5Z1FCZVpLbVNQ?=
 =?utf-8?B?UjIrMHZjOWNDenF1UzF1M2RTQnhmRVA4NWJ5U01hcEJ1VVVQc3cwRWFWVWR5?=
 =?utf-8?B?aC95aGZKODkwVUZUQk1nOCt0MCtBT0tYQUpDVkFvZVF1c2dVUk9Kazl5YjhK?=
 =?utf-8?B?VEFSVjdZeFRYZzBqeTEzMktRT0lZNUFQdisrbVcwRVc3SlZ2UEE4UFEyQm9P?=
 =?utf-8?B?dHRtNXRkdk55MnF6d0RCUTBFcHBTTVpZU1FreWhtY05JSTg5U1VreTZCMU1M?=
 =?utf-8?B?VWp0cVJkV1R6c0VGN3hMSGFmZlRqanBUR29OQW9LM3Z2eFByeG1PdkRTcFRW?=
 =?utf-8?B?U25MeXVjSmFwREd4cHpMY21FK0tSQS94MFhmdklqbEpyelJySmd0dGVJZnUz?=
 =?utf-8?B?TWFvbXBvaU95cElWamNnQnNDMVpZUTZzTmh4bVkwUmtpWHRVK3h6ZGZiWjIw?=
 =?utf-8?B?cTJqUi9jT1hOd2VpaWtwM29raE9JdW1WQmF6NUhXdjZxYVBXQkZJL0QrMGl6?=
 =?utf-8?B?QWpCNUZNWHdoZ0gxUlQwb3hLcm1vU0lQS3hmV3VKME5KaFowTGdLRWVRWEJK?=
 =?utf-8?B?R0VjV3JPS3lmMTk0NW1QSUtTZFVIU3Q2WGdGTEZNTk9Nc3ZzNnhJVWg5alli?=
 =?utf-8?B?b01wNERocWRObm5UMkpjeS9qa3NmOXIwZHhoU2cwZVZEU21Mekc1OUhmOWtR?=
 =?utf-8?B?ckFzSHdXMDlNR0o1M3ltU3JsWWZJSnhzSVkyRDhxYkcyeGlTclZUa0o3bWYy?=
 =?utf-8?B?YWpTY2NYRW5iZi9NSjVuUExiNnJ1ajFNOUtYZTlhM0NRV2dVVW9lWkVRalFn?=
 =?utf-8?B?RHhTR2dGdDBvTEp5YitLUzdZeEtKeWpleng1eEhHVjZSS1ZWT3RrRHkyL2lo?=
 =?utf-8?B?QnVaelFkaDYzNnFOZVArSXdiQUp0bUNrVnRGY2hMRmE0dmpnWSs1MkoyS0FS?=
 =?utf-8?B?SHlrdFV5VUtqdWRXd2h4YjhYWlkyQlg3ankrU1RET1RBZlM2WnRqUENsckFz?=
 =?utf-8?B?eEo1K3ZvYVRqY0ZjalN3eTN2NlZzK3BmVDBlU1Y5ektQcDdqbHdQNUxqZUlj?=
 =?utf-8?B?d3luQXFDYXloSkQyT21RN0VxT0FHWTNOWFJydWVSeDc4WFJUQ3pzMXp3Ynpo?=
 =?utf-8?B?ZEpaSnBBU1l5ZFZ0ZkZNckRFQ0dTazVjR0NXV3JsOENnVk9EcWNDNVlZU09q?=
 =?utf-8?B?NXEzcG1GT0s5azZ2bEhyUENZSEtBeHRURTViY1RuVms2eTNaTTJGLzIxZjJG?=
 =?utf-8?B?MkpGSnI4OTA2NklxMVIwK2hWaDVkeEI2bkVNZFBZSVNzTjR2ZmkyN0t6YnAz?=
 =?utf-8?B?WnpLcUYzd2t4dEc5VEsycWswSUtyci85M3pVRGNkd2hmenhCcUVFa09nRE9B?=
 =?utf-8?B?V0tyem1kbWorZ2JuMExSbHJXN1VUam9PeDVpYjlwbzhKSWFkaldkSzlnZG1i?=
 =?utf-8?B?S1lmUExjT202RTRIZEI2L2xLZExYVURVTFFjQzhxN2w0c3ZVTHBjRy81bWxh?=
 =?utf-8?Q?gzEf1hXYgcDQRF+dWZw2osRnq0fPz4uv5oI7iiW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a519f0ce-0b8b-429f-e1ac-08d90313d06a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 09:16:28.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQGmd7qxzkdFQwr1slSfDD6U+/LkXusHC5DyYCtoef5Mc2QoRcKKLofUuZbxXZ1LiFid5JeBLQe5gKqzXbzCAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

Adding Paul also for the Viridian part.

On Fri, Apr 16, 2021 at 03:16:41PM +0200, Jan Beulich wrote:
> Zapping leaf data for out of range leaves is just one half of it: To
> avoid guests (bogusly or worse) inferring information from mere leaf
> presence, also shrink maximum indicators such that the respective
> trailing entry is not all blank (unless of course it's the initial
> subleaf of a leaf that's not the final one).
> 
> This is also in preparation of bumping the maximum basic leaf we
> support, to ensure guests not getting exposed related features won't
> observe a change in behavior.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
>     than subleaf 0. Re-base over Viridian leaf 40000005 addition.
> v2: New.
> 
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -8,10 +8,13 @@
>  #include <err.h>
>  
>  #include <xen-tools/libs.h>
> +#include <xen/asm/x86-defns.h>
>  #include <xen/asm/x86-vendors.h>
>  #include <xen/lib/x86/cpu-policy.h>
>  #include <xen/domctl.h>
>  
> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
> +
>  static unsigned int nr_failures;
>  #define fail(fmt, ...)                          \
>  ({                                              \
> @@ -553,6 +556,103 @@ static void test_cpuid_out_of_range_clea
>      }
>  }
>  
> +static void test_cpuid_maximum_leaf_shrinking(void)
> +{
> +    static const struct test {
> +        const char *name;
> +        struct cpuid_policy p;
> +    } tests[] = {
> +        {
> +            .name = "basic",
> +            .p = {
> +                /* Very basic information only. */
> +                .basic.max_leaf = 1,
> +                .basic.raw_fms = 0xc2,
> +            },
> +        },
> +        {
> +            .name = "cache",
> +            .p = {
> +                /* Cache subleaves present. */
> +                .basic.max_leaf = 4,
> +                .cache.subleaf[0].type = 1,

On a private conversation with Andrew he raised the issue that the
shrinking might be overly simplistic. For example if the x2APIC
feature bit in leaf 1 is set then the max leaf should be at least 0xb
in order to be able to fetch the x2APIC ID, even if it's 0.

I also wonder if we are shrinking the leaves too much, for example we
should always report up to 0x40000000 (or 0x40000100) plus the Xen
leaves, as we never hide those and it's also documented in the public
headers?

Thanks, Roger.

