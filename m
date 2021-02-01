Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE330AF2C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 19:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80081.146196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6duW-0001wU-4D; Mon, 01 Feb 2021 18:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80081.146196; Mon, 01 Feb 2021 18:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6duW-0001w3-12; Mon, 01 Feb 2021 18:26:52 +0000
Received: by outflank-mailman (input) for mailman id 80081;
 Mon, 01 Feb 2021 18:26:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6duT-0001vW-Su
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 18:26:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7313bb1e-9402-4f9a-9120-38ecb80355fd;
 Mon, 01 Feb 2021 18:26:48 +0000 (UTC)
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
X-Inumbo-ID: 7313bb1e-9402-4f9a-9120-38ecb80355fd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612204008;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=arVrXoL+C248ZsaLgLTHSqwkl3EUXRTWbZXpN3xpU+c=;
  b=ZxeaJWeUovf7LFPVXLVEMfKFvka5VGxKyHFECk4dK99Ef7kCIQWCXTLu
   65baePcPywsFU74vXBtTx9iAYcfGJ0WoG9JgkWhjwC/8uX7Ck3XWehIEh
   y+LTAnei7zdXJUnYPFtkJtBv+TWNcfFN5aO/7pJgd4JLHWUA1iQzgGS+J
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jRdklUyo6Irdf6VSpNNCBncG3MiX2zf6WwVNnbTD5E5PWUEXLee0ezjsGd7HCgRJ4RRyP+UC9s
 kByQY1JLrSQSJ3Iwleq3DP1pBVKwoOZ+ehQZwlqQ8jvIMdAc44mfpNsf3IfIX/p2XfXMvEG86X
 DAiQEn9o4djNXLU8Z3PJjKoEkGm3mn1QwMwWMk3fPQakZTJ0hcf8zPL6KEIpq2KWK1uM2JotfZ
 qzmuYACkeLracertJormAvejFWs4BWYbF9DeUE1wVvqepbNpKcyeuTz8imLg+WQ1e5OaJgLvb8
 rTw=
X-SBRS: 5.2
X-MesageID: 36260110
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36260110"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6jSzKexu37FDwYlsbXZVfKRhx8iElhxfSnsmKiyFhrO/kOr3Lk5NaAaXFyF3jH+NsUGcDZ6Y2FSQ/e30NGjmdsqwIFSjtLFkLwHXaeCODVRa44I5niSJfv7TTVw1EmO/JqBFgCkoSL+m9SwVlF+uQ8Ln56FHuLYYkMt1fEIVqR6DtmvkzspTd74c4CGm4wzMDviDNUJZiRg4rDMoxPkWA5lN2FYGxQueZYlcO6B0N7P69l7BVYgM48iP51jqrrVRkuJlLsJSldCeHBNf++h2cErKnKdJ8cHxduh28U3QOIxfjP9X2dIsIXR7GRPfJmwLhmnbpzK1QQcBWfaJkofpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzeBeog67ofe8nEnuWFZTQD0XYXfMZHV8KiLcfzrO+0=;
 b=Vyk02z5c4Q3wVDcQyeQUqZiD9Sdl/mLOA9q4+jxy+pB1vhgVij3Ra8v6DYFM2u05XD3hPZ2k2F6e6NyXpNacvmrwnUboFjrhj7nwWZt5/47f28a9yMgMfYBEp0EPMoX8b4ZKPzQMTgEDDjfXeRMLVn4OPdDdA8cmoNlQIzcEhCIkzxafV4ncwFjx4qLN7yqIQFWhaigwbsIQFnaDG9PalMa2jFof9jVK0v/tOXzKeN8HEdT4RqPHUPSoV3nM8Lgs/GfFCnpAvSmQXgIxZTf0FA/yZ80rZXSK2sL5tGoyFObKgbE2xPWF4QQyzh9gGq0II1SJwzAHhncIJrDmOqJgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzeBeog67ofe8nEnuWFZTQD0XYXfMZHV8KiLcfzrO+0=;
 b=RKYygpSa2lFRpGo4u1o4CcoP0rdqdVh3Junn+AmrEJ5BUVLSEV4/JoDUzZGIOEHCSd7g2USb19uRdD9o2JR5UF6YDDcrWIaI+pMT7JlUfDWSAg1cFqIvDpHnL9U2SmWZTBdgxyXNgmyg0xA8jeI7h4zljEXZcQ8hJ6rmAf4ybsQ=
Subject: Re: [PATCH] memory: fix build with COVERAGE but !HVM
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <84a05b9e-a0c3-7860-4a59-a591a873b884@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a2fff2f5-70d2-19f2-b7d3-01e4db50f709@citrix.com>
Date: Mon, 1 Feb 2021 18:26:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <84a05b9e-a0c3-7860-4a59-a591a873b884@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d750821-1f92-4521-7dd2-08d8c6dee844
X-MS-TrafficTypeDiagnostic: BYAPR03MB3478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3478EA56F976530D46097EEEBAB69@BYAPR03MB3478.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ts+jpXwdqi5ZFKG8UnrsJFS+jgmWBBhe+Y0/DggmsWFJnw0pzTlp/hKMZiSTPiv39eHQcMlbiOdnRwwiT4DHY5d/QQcObWELZ4V9JBbLIqJflpQc8Uar7dwujV3fCMQlD5mvZ4O8PRN95XDUXuY8ETaZiVb22kTRqpX4t+597b70mvbELvNSQ2BWdJN5LvLqEoJYU+dqEQN5Kv7V9VWYP/gNQJwURFrWkInU/7Djb5Umix/ps243qVSwxVzqvCA4pXENuHlJknlcnq86sY602EcU2uDTLfot3uakXOAmHsLnKW1BOOF0WG4bELmP98YFjWf6Uewr88gPThivVOCuDSigFvFmVCWkVDxrFzBglv/zzXi5NrOVY8LLYSbznHDjVZBCnXZcl4MI+At+GPhJn6d3v7yNvY10LxyeLl9zjeZTiUV6k1lm7P4CTmNlgksV19ptTWaPu2sIxLmdwQMJcPBgqWUqTocjRcbZNG0Nr3BqC8vOmqopjhQMIIoA0MthwvJulZDcTI3T05lfI6zVpEJnv2cRGplpDQRASKzU032VrOR0H25BdDQ9/mi9WDyHykLU+ndgz7SWfIVvVBGja5kUJCxJspXdOoLD21fmAe0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(31696002)(478600001)(66476007)(4326008)(36756003)(5660300002)(66556008)(2906002)(66946007)(6486002)(8936002)(8676002)(6666004)(110136005)(316002)(16576012)(54906003)(83380400001)(53546011)(31686004)(16526019)(186003)(86362001)(2616005)(956004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmZiOFB6VWYyNVU5WTcvaDlpenJaV2dpc1Y1VStTQmZMRUFwbTZIVE1Nb3Nu?=
 =?utf-8?B?V3ZjbXo4Yys2cWZRb2NFNTI5dSs2U0pWNmdSbFhneGRlcExDMHhRdU5VUTRn?=
 =?utf-8?B?YjZxSVhXang3MXkwWTlSZXN4S05FMFRiMDFVeFRoUkc3L0JPWFhCcitLM1lo?=
 =?utf-8?B?NHhCbHl3RW5lOG1iZ0NiUlh3NmRWeVphMlgwMkRUTUpzNmpTNjhPVnQzb2ZL?=
 =?utf-8?B?aTF3Vjc3MGN0MW5rU01xL1c0c0szdWNrdk44WXo3N2Z0NGdWdWFvZjV5QUZW?=
 =?utf-8?B?YW91cWFmVi9ZQ1JJbVB1b1dXeWd1bFlxQlhLK25GK05wbWpLWENTYnplOUk4?=
 =?utf-8?B?aS9Lci9iYXQvOE55SjhMMXo5NEVvY00yT2lSelBWMTVpN0JUSENCd0RXeDlq?=
 =?utf-8?B?YWkwZFVRczR4b1BCbUZhcnFWNzZqMzF4bVhsSkhoU1ZJVXBsOXg1ZTcyditU?=
 =?utf-8?B?alptd2cxY2x0d3dYVGlja1dFRUJGekJxSnY4RGJTS3JPY1ptTG1TK2x0T0I0?=
 =?utf-8?B?MWZCM0FzWURxSUY0UmVYMS9rZFJibkx5alZnbVl5cmF2d1AyYnBLdVJoSGhY?=
 =?utf-8?B?TkFFQVdlNE1NRGIwekdJZmtvRThLWnhxbmFzd3dLeFhGMEhlZGFaS3h0cm41?=
 =?utf-8?B?eHo3b3hNbmFJeUVXemV4ZkplY0tRWWEwSmt3Vnc4ZFVmb0FOVHM0b04reGNW?=
 =?utf-8?B?bHptMG5KSkgzTVJJL1FlMG1vREYxa0JqNGpabU9KTnN1cWw1Y1FXUWNIZ2Zv?=
 =?utf-8?B?SE9SdTlEZUlvU0dYWnVjMmExYWFFaVJHVnBNKzZIMzhQYUdNRzhNdkJmaThs?=
 =?utf-8?B?NSt6VXpPL3BjZGlaYitBUXRNdDRGK0x4Vm8wVE83RjJRczRTTlJFWElnYjA5?=
 =?utf-8?B?K3BhVWloM2lST2l2eFpybXJwVFdKMmVkOUZvRTUxdDAvMGE1cW0zTFdlcEhS?=
 =?utf-8?B?ZjRYNDhnVjYrRzVDdHVsdVluK2IxbFVMNFhJUityQm5McVVSZnp4T1hoNzhI?=
 =?utf-8?B?Q21kbytFcWp1akx6VWdwa1FvYm1SWTBMSlpMQU9mZVZlQjBxL0tNQWhKTWVR?=
 =?utf-8?B?MkFsSkU1U2ViUUFaSnZuQ1k2Q0hlMFJ3MmRhaW4rV0dHL0dCcXhDdDVBTURh?=
 =?utf-8?B?NGk2Z1ZWU1hrZzArc0JOcEM5MU9qbDFEa2JoWmgwZ2hSUUlrbGNQR21oclRy?=
 =?utf-8?B?dGhwWnF1dHhCYmJWamhkNGtUNnUzL1hFYXZTTy9Cd3JFS3BHUnBzNmRHMnB5?=
 =?utf-8?B?ZGt2TDdBZnM3UnRqaC9GdVVUV0lxRldxSFhkK21FZFhqOXpLaWxQQ0UxY095?=
 =?utf-8?B?Yjd1QmZNa0JZZXRBTi9YOFlHZ0F6UTRzcnd2Q1prbXM4WjA2NjJTTERJWk5j?=
 =?utf-8?B?QUJ2V08zQVpzZGRTdElMYnNVdmdLMVZtT1QwUkxXVGovV3RaK3ByOVBNamRC?=
 =?utf-8?B?Ymk2dEp6bzRTeWRJbXllazUyY3dDYmpvb2N3djRnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d750821-1f92-4521-7dd2-08d8c6dee844
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 18:26:35.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdymTA+vfHcoxeagtJqW+Tfn7q3Mr1A0ODyJcjXk1gE+hbs9pSUMyEXdq1qKsBXOAI/rnmeXP4Ro9uQ2AdJpK0gGhDwZRozlhPQDgcHKTKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3478
X-OriginatorOrg: citrix.com

On 01/02/2021 16:20, Jan Beulich wrote:
> Xen is heavily relying on the DCE stage to remove unused code so the
> linker doesn't throw an error because a function is not implemented
> yet we defined a prototype for it.
>
> On some GCC versions (such as 9.4 provided by Debian sid), the compiler
> DCE stage will not manage to figure that out for
> xenmem_add_to_physmap_batch():
>
> ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
> /xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
> /xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated
> to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
> prelink-efi.o: in function `xenmem_add_to_physmap_batch':
> /xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
> make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
> make[2]: *** Waiting for unfinished jobs....
> ld: /xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' isn't defined
> ld: final link failed: bad value
>
> It is not entirely clear why the compiler DCE is not detecting the
> unused code. However, cloning the check introduced by the commit below
> into xenmem_add_to_physmap_batch() does the trick.
>
> No functional change intended.
>
> Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> ---
> Julien, since I reused most of your patch'es description, I've kept your
> S-o-b. Please let me know if you want me to drop it.
>
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -904,6 +904,19 @@ static int xenmem_add_to_physmap_batch(s
>  {
>      union add_to_physmap_extra extra = {};
>  
> +    /*
> +     * While, unlike xenmem_add_to_physmap(), this function is static, there
> +     * still have been cases observed where xatp_permission_check(), invoked
> +     * by our caller, doesn't lead to elimination of this entire function when
> +     * the compile time evaluation of paging_mode_translate(d) is false. Guard
> +     * against this be replicating the same check here.
> +     */

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but I feel this
comment can be far more precise/concise.

/* In some configurations, (!HVM, COVERAGE), the
xenmem_add_to_physmap_one() call doesn't succumb to
dead-code-elimination.  Duplicate the short-circut from
xatp_permission_check() to try and help the compiler out. */

~Andrew

