Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B18319CCF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 11:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84197.157890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAVxl-0005hL-Gz; Fri, 12 Feb 2021 10:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84197.157890; Fri, 12 Feb 2021 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAVxl-0005gy-CF; Fri, 12 Feb 2021 10:46:13 +0000
Received: by outflank-mailman (input) for mailman id 84197;
 Fri, 12 Feb 2021 10:46:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuCD=HO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lAVxj-0005g8-HX
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 10:46:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b97e3335-899d-4a23-a8b1-ffba49ed4297;
 Fri, 12 Feb 2021 10:46:09 +0000 (UTC)
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
X-Inumbo-ID: b97e3335-899d-4a23-a8b1-ffba49ed4297
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613126769;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cyWk2E+WS3mL2Vm7Fx7BWrhEmqy5qdruLJ9hoJCaUJE=;
  b=KhX9G565xmtu95VIqgDj6Rmyvgtu4uBVaC6cegxSjk3jxB4KZATiMaDh
   Z3tB4hBFDUKi1IJWqWZ4FRyCMJZfTHgDM5EXVucvV+9Ih18HYO0lRFOi3
   1i3Wdgt2RQSiPqfQy3trTQSiqInnIecleZ1V3DhEcUq5O3KUmzPZFYbxH
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /6XuCIqyUnRfjRhoXKl+gA8WRfxMXOgVcuNSc4mTPCTXUZ8aDTfRFW6KIwb/DJNzylGvJgqid/
 o7j8nk9UDWX9ryn9tIZvYEoGwY7lCu192E/WA38h/plWkRQocNBUgOLbSSWGFjad+mo3/xJCbF
 dr1ougIPae5+0eYhQA6wqsUYu0Q2zAgDXCe/X3a1/1nYG6M54XtrUvl+nJzcZ05k2zzlBvwUmL
 wxJw8omU6qmNaSVePIM80dmVTrc/WR2el3jpjsPwK0se9CIkUqWsWqmO4VLGcszaunUK3nmT3b
 ukQ=
X-SBRS: 5.2
X-MesageID: 37322926
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,173,1610427600"; 
   d="scan'208";a="37322926"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBuvHzEXLPEPLdxe8KvAgFBbKdYjgDMJ1hiCuiBkXK/jwo3pkJTE1W2FBZ1AQa56B8kc4/nwqQBXecx3plPQjlFlXD+6y8lW+t/YrjrbjfXjJ6i/8kz9xnckBCO1cNfKyQGrpRjLCSYa2FOY9QNCAY4EplCdzSaHWqLBWc7OZ/d0Hvb4VKyZ/flF8ii6kDW5VYisRf0dGrnPwbPDbiJ6412IKSGDUHqTM86tWiiqHLNZFb1RgTRNGzq4nY79FoC44URy2IYcOSYlRdbkbOBygzoDt1QtfAty7Td2S2Tm5F24F5u83QQkzq2ymMDB2FTaqLlBOV6q5MtJj2QyYffKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOkdkfX61/MIq9/1Z6cE/L6pzSpsxc2u4oE10N2uiS0=;
 b=jbUaV72Q1JNDYRYnNd69DR1ArUfIhWAJze2LiA1T+dA6frOwA2XX7JVmV/h/HEYWV3McZIVx8FA9MFJ3nqfw5toD/UJjIfaa1VBzgWMF6X4ywRXzlOXkCdR5IvznIxbb/XtGqnBRx8yehlg7wJ43BBiFq+4LJTk9NZXA39tDUtqk/6cKGICU7PLziLmxRl5RBQRfBCZOjFPdNVA7uGs8Z9nBkpzibMdEol8Fp0MUjJ1qAtHCNXA+uZa/5zboXaZjK3AKGhXA2c2tBFy5deqw1JHpgaX1tv9UK3wN8DcxPtMHqtfXOYn7JU00jLCsHFPkIfpTbHTbJmwcC1a1LHYZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOkdkfX61/MIq9/1Z6cE/L6pzSpsxc2u4oE10N2uiS0=;
 b=QR/WO7W3fzxLYCJhnPSfk9EskEl4uEVgWqK7PqZWgv9LBZggIiIXsh4xsHXGVbY7qyNlp9Jjq9miti0s8OweFg+KdxirHlkH4A+AEVJXAJ1fW2hK2EG5kZS+knfbUK1/M2fIAQJjkfYhtKIeYxezSWSpMu3pSIZzLjdGGpDsMpw=
Date: Fri, 12 Feb 2021 11:41:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
Message-ID: <YCZbToiL3+Ji3y48@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
X-ClientProxiedBy: AM6PR08CA0021.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc8b5ae-413b-440d-f73b-08d8cf436605
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5606979D06B8B07512B782398F8B9@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2p5GjHOVgcDBneEzkMLyhyTOpKgDNOH06J072ZVfI7Gf5Z9x2DtkrOOcIdZtQThlBkoaAXcfiGpbOD2NoR+GqH4NF9oZzLKG0zpAjhSryra3TYEbXfPYpjJ6cY/TRe4F7/Bs78mB8W/Us9YJXCD3YJHZ2427bGbWQlDgsnvXGlMQyT3lNay5x02u2NgRolD1VDFAGG8+Jh5/K5J28CpZepP6lbeuq7mDyzJVVKk2C40ZrU6JXlcjgyYi5h70/dEDXjt4fbx6DDxguo+G5LX9UNRsqzLwRBVnYJxPXY0QsQEm7d2iUmhg8/0P5qt1J7mdjWRhKw0eNV/8mBuq93uUugbWqwIPuztu30XowxIjGxbS30mL7sQrrGca1OfmXDRAI/f+aGj4IR6i7OM7e/10oOZBTayjBvIdBix9Zl1aCfIwu4SkLdCHAFN5Gb9Hakx6ACJ7XhLWFL524/OxgYiXBkX0jc0knDrA+IUBtBEuHkZtGtR8BuvlKTdls1sOWCp7YpnqqHw8zucfvj9gHTUjDRw2CWbHqo3YCjxq11fjFC2FQWdov5RrcLbuJM7l4nUVtdg5dNGqrB5/BpKDnoTJUBH8aET68aOsQ3tPXlTUynjDA7u63+YSOYR1gHPkLkUlam6fvQkNDsbnoUBSgvv3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(33716001)(26005)(8676002)(66556008)(66476007)(6496006)(186003)(86362001)(966005)(956004)(9686003)(5660300002)(4326008)(2906002)(478600001)(6666004)(66946007)(16526019)(85182001)(83380400001)(107886003)(54906003)(8936002)(6486002)(316002)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3M3TWxsZjg5WS9wanZjQVZrTW0xa2ErdjdGbTd4RWN1YmdjZmNhNWxlcy9x?=
 =?utf-8?B?c3BjbU41UHgwajQzWHE2VnEwQ2ZPZmJpZHlXWXdTNThWRk1GYUtTSVZWbURP?=
 =?utf-8?B?UXFwcW1TcDRTdkUwQzQxaXZ5SUIrWllRdlYvdDEyNzVSQ2U0TmxhQkRXSzNp?=
 =?utf-8?B?UThiMVljK1lSRWpBb0VQKzVTZEE3V0RjOFNVeC9oZUVxRE9veWE1cFpWK3o2?=
 =?utf-8?B?ZEJSdXUvdVFxZUQ3Q0xIMCtsbml6QUpyeFZPdmpqOWpsckdGU2J4S1JNTVBN?=
 =?utf-8?B?V2ZPM01Xc0FIUGNwTmdNQjNYcjJLV3ZIWm9JT1QyY09ZRWM1MzAyakV0NXl4?=
 =?utf-8?B?MlZadUpDK09ZUFN0NGhQWHh5Q0hPRUhRbS9oZUE0elZrRFJvYTFLclNxTkht?=
 =?utf-8?B?U2xudTlhbWJIc1ZiUEJxNU1YWnVub1VTWWxjdnA0UThXaGExT3ZhY1Rrejl4?=
 =?utf-8?B?ZDNMMjJmS2hmQ1Q3MURYQ2wrUFdsMklGS2xzRGdLS1VmN21kbkFRNng5SlJF?=
 =?utf-8?B?bmYyaE04WW8xaWVRQUJGSmpQZGM1QXJiVTUyQkd0ako1QnQ4QUs2V29yLzVk?=
 =?utf-8?B?enZmazNEZm1wMVB5U1NES2ZzYVVCNGZ1N1ZmdHphWHJVTmEzbzVSQnF4WTRP?=
 =?utf-8?B?bm5UVTFJSmo2MG1iOTdoZVU0ZHNOc1lZQzNGY2tnRDFrMWhuWmlCQ1RsdmZN?=
 =?utf-8?B?RmhnUEJBb2FFYVZyK0lUcmg3QW80akMxa1FtWTcxbVlWVlQ2N0xaRWRMN29W?=
 =?utf-8?B?aHY1RGJNdkszTEdlZHF0c2F4OXYvR3ZNQlBrWTh6NGtyZlgyQVRTTlVPK1Z2?=
 =?utf-8?B?bEZNUzRnakxTTGpSektBWUdvc0Y0NTQzbFZMRzJKQk9xazYzWnRoemsxdmJ4?=
 =?utf-8?B?M3ZKTFFkMlJScVRTSC8wOHk0cXBuQ2p6SmNkM1A5c240dW5wT3JQRDdDR2hp?=
 =?utf-8?B?YkhmRW5nd2lYd3BBRnFWbWtqNEo3YnVmTWNtN0o4a3pxbDZmZG5keUJDeXpR?=
 =?utf-8?B?V3FablcvaWJobFZ4dGxiWXgvVXVHVnk2MHJVdTcyNnBLWGI0bjRjVHBOcWlD?=
 =?utf-8?B?ZjNXMmE0Rm1nbnVueTJWbDRkQTU0TjRDUm4wZjNXSE9jZisrc0V2UVZmOWQ3?=
 =?utf-8?B?eTVGUS9CZjBhMEZ0VGEwK2wya0Y4bWdYemdmUnlpUGtKUUFiN1ZPMHREL2dj?=
 =?utf-8?B?NFRacWlvNzVLVlVDRnVPaGE2ZHhlWTU0THQ4Zm5hRFU5MGF5VzlxczRZTG40?=
 =?utf-8?B?ekl5d1JEeWN3eEdyL0ZsOXlmQ1Z0ZkllSVJ0T1h0cnRWaVlHWVBMMUtydmtY?=
 =?utf-8?B?Yk5ndHVLNGNreW9oajNSR2lvYmdkU0RXUnJvYVR3QWEyUTBlekx0NjQvTXNJ?=
 =?utf-8?B?VVgwODAwa2xKRTg3UkVoZ0dHSUJENi9admEweE85bWJ5L1BvMVFTQWp4YkNC?=
 =?utf-8?B?L2xQeGRwUVlFbzlFUVJBWWF6cXBYc3IzU3VFQkM2b0RJVENLTWhVcVRtbjBu?=
 =?utf-8?B?eU4xMHprQkNYQmZBNE5tMzNPYWsvbXl3bWNxeUhDQm1HZXpEb0kzQURVQzE3?=
 =?utf-8?B?cnI0ajhkdVoxWCtQWHo4WlUwbmhqMnZpWTNQUEk2SW56dUpURmtnY0FUUSt2?=
 =?utf-8?B?cmtXOS95REx2dVVCOVNjQUlQcGRwWFNRZTJ5WG5yamQzeC85NGlpOGZ3N1pW?=
 =?utf-8?B?TU9YdzgwcW5pRXYyNys0UFZYL1UvWXI2SVl2bzR6UVE2OHVJU2dBQmJNRjVK?=
 =?utf-8?Q?0krROGSXMNdgGFfOCF+WkPlnAAS+Rx4vuIxNTrw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc8b5ae-413b-440d-f73b-08d8cf436605
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 10:46:05.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY5ISyHq+ZNKLv+8660dwBDYJ5eN9KueNiCb08udPjD19m7ZLjESSjnX1TDgs82U8BLz9/ELzGT0Q/MNyvqZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
> Inspired by
> https://lore.kernel.org/lkml/f12e7d3cecf41b2c29734ea45a393be21d4a8058.1597848273.git.jpoimboe@redhat.com/
> and prior work in that area of x86 Linux, suppress speculation with
> guest specified pointer values by suitably masking the addresses to
> non-canonical space in case they fall into Xen's virtual address range.
> 
> Introduce a new Kconfig control.
> 
> Note that it is necessary in such code to avoid using "m" kind operands:
> If we didn't, there would be no guarantee that the register passed to
> guest_access_mask_ptr is also the (base) one used for the memory access.
> 
> As a minor unrelated change in get_unsafe_asm() the unnecessary "itype"
> parameter gets dropped and the XOR on the fixup path gets changed to be
> a 32-bit one in all cases: This way we avoid pointless REX.W or operand
> size overrides, or writes to partial registers.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The insn sequence chosen is certainly up for discussion; I've picked
> this one despite the RCR because alternatives I could come up with,
> like
> 
> 	mov	$(HYPERVISOR_VIRT_END), %rax
> 	mov	$~0, %rdx
> 	mov	$0x7fffffffffffffff, %rcx
> 	cmp	%rax, %rdi
> 	cmovb	%rcx, %rdx
> 	and	%rdx, %rdi
> 
> weren't necessarily better: Either, as above, they are longer and
> require a 3rd scratch register, or they also utilize the carry flag in
> some similar way.
> ---
> Judging from the comment ahead of put_unsafe_asm() we might as well not
> tell gcc at all anymore about the memory access there, now that there's
> no use of the operand anymore in the assembly code.
> 
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -10,12 +10,19 @@
>  #include <xen/sched.h>
>  #include <asm/uaccess.h>
>  
> -unsigned __copy_to_user_ll(void __user *to, const void *from, unsigned n)
> +#ifndef GUARD
> +# define GUARD UA_KEEP
> +#endif
> +
> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>  {
>      unsigned dummy;
>  
>      stac();
>      asm volatile (
> +        GUARD(
> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
> +        )
>          "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
>          "    jbe  1f\n"
>          "    mov  %k[to], %[cnt]\n"
> @@ -42,6 +49,7 @@ unsigned __copy_to_user_ll(void __user *
>          _ASM_EXTABLE(1b, 2b)
>          : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
>            [aux] "=&r" (dummy)
> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>          : "[aux]" (n)
>          : "memory" );
>      clac();
> @@ -49,12 +57,15 @@ unsigned __copy_to_user_ll(void __user *
>      return n;
>  }
>  
> -unsigned __copy_from_user_ll(void *to, const void __user *from, unsigned n)
> +unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n)
>  {
>      unsigned dummy;
>  
>      stac();
>      asm volatile (
> +        GUARD(
> +        "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
> +        )
>          "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
>          "    jbe  1f\n"
>          "    mov  %k[to], %[cnt]\n"
> @@ -87,6 +98,7 @@ unsigned __copy_from_user_ll(void *to, c
>          _ASM_EXTABLE(1b, 6b)
>          : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
>            [aux] "=&r" (dummy)
> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>          : "[aux]" (n)
>          : "memory" );
>      clac();
> @@ -94,6 +106,8 @@ unsigned __copy_from_user_ll(void *to, c
>      return n;
>  }
>  
> +#if GUARD(1) + 0

Why do you need the '+ 0' here? I guess it's to prevent the
preprocessor from complaining when GUARD(1) gets replaced by nothing?

> +
>  /**
>   * copy_to_user: - Copy a block of data into user space.
>   * @to:   Destination address, in user space.
> @@ -128,8 +142,11 @@ unsigned clear_user(void __user *to, uns
>  {
>      if ( access_ok(to, n) )
>      {
> +        long dummy;
> +
>          stac();
>          asm volatile (
> +            "    guest_access_mask_ptr %[to], %[scratch1], %[scratch2]\n"
>              "0:  rep stos"__OS"\n"
>              "    mov  %[bytes], %[cnt]\n"
>              "1:  rep stosb\n"
> @@ -140,7 +157,8 @@ unsigned clear_user(void __user *to, uns
>              ".previous\n"
>              _ASM_EXTABLE(0b,3b)
>              _ASM_EXTABLE(1b,2b)
> -            : [cnt] "=&c" (n), [to] "+D" (to)
> +            : [cnt] "=&c" (n), [to] "+D" (to), [scratch1] "=&r" (dummy),
> +              [scratch2] "=&r" (dummy)
>              : [bytes] "r" (n & (BYTES_PER_LONG - 1)),
>                [longs] "0" (n / BYTES_PER_LONG), "a" (0) );
>          clac();
> @@ -174,6 +192,16 @@ unsigned copy_from_user(void *to, const
>      return n;
>  }
>  
> +# undef GUARD
> +# define GUARD UA_DROP
> +# define copy_to_guest_ll copy_to_unsafe_ll
> +# define copy_from_guest_ll copy_from_unsafe_ll
> +# undef __user
> +# define __user
> +# include __FILE__
> +
> +#endif /* GUARD(1) */
> +
>  /*
>   * Local variables:
>   * mode: C
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -446,6 +446,8 @@ UNLIKELY_START(g, create_bounce_frame_ba
>          jmp   asm_domain_crash_synchronous  /* Does not return */
>  __UNLIKELY_END(create_bounce_frame_bad_sp)
>  
> +        guest_access_mask_ptr %rsi, %rax, %rcx
> +
>  #define STORE_GUEST_STACK(reg, n) \
>  0:      movq  %reg,(n)*8(%rsi); \
>          _ASM_EXTABLE(0b, domain_crash_page_fault_ ## n ## x8)
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -114,6 +114,24 @@ config SPECULATIVE_HARDEN_BRANCH
>  
>  	  If unsure, say Y.
>  
> +config SPECULATIVE_HARDEN_GUEST_ACCESS
> +	bool "Speculative PV Guest Memory Access Hardening"
> +	default y
> +	depends on PV
> +	help
> +	  Contemporary processors may use speculative execution as a
> +	  performance optimisation, but this can potentially be abused by an
> +	  attacker to leak data via speculative sidechannels.
> +
> +	  One source of data leakage is via speculative accesses to hypervisor
> +	  memory through guest controlled values used to access guest memory.
> +
> +	  When enabled, code paths accessing PV guest memory will have guest
> +	  controlled addresses massaged such that memory accesses through them
> +	  won't touch hypervisor address space.
> +
> +	  If unsure, say Y.
> +
>  endmenu
>  
>  config HYPFS
> --- a/xen/include/asm-x86/asm-defns.h
> +++ b/xen/include/asm-x86/asm-defns.h
> @@ -44,3 +44,16 @@
>  .macro INDIRECT_JMP arg:req
>      INDIRECT_BRANCH jmp \arg
>  .endm
> +
> +.macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
> +#if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
> +    mov $(HYPERVISOR_VIRT_END - 1), \scratch1
> +    mov $~0, \scratch2
> +    cmp \ptr, \scratch1
> +    rcr $1, \scratch2
> +    and \scratch2, \ptr

If my understanding is correct, that's equivalent to:

ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);

It might be helpful to add this as a comment, to clarify the indented
functionality of the assembly bit.

I wonder if the C code above can generate any jumps? As you pointed
out, we already use something similar in array_index_mask_nospec and
that's fine to do in C.

Thanks, Roger.

