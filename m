Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3721B6A4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 15:39:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jttEs-0001Ig-Nw; Fri, 10 Jul 2020 13:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY6w=AV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jttEr-0001Ib-84
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 13:38:53 +0000
X-Inumbo-ID: b12de9bc-c2b2-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b12de9bc-c2b2-11ea-8496-bc764e2007e4;
 Fri, 10 Jul 2020 13:38:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAE72AC9F;
 Fri, 10 Jul 2020 13:38:51 +0000 (UTC)
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: Ard Biesheuvel <ardb@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
 <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
 <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b4e60a2f-e761-d9ad-88ad-fe041109c063@suse.com>
Date: Fri, 10 Jul 2020 15:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.07.20 15:27, Ard Biesheuvel wrote:
> On Fri, 10 Jul 2020 at 13:17, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>>
>>
>> [ added EFI Maintainer & ML to Cc: ]
>>
>> Hi,
>>
>> On 7/9/20 11:17 AM, Jürgen Groß wrote:
>>> On 28.06.20 10:50, Jürgen Groß wrote:
>>>> Ping?
>>>>
>>>> On 10.06.20 16:10, Juergen Gross wrote:
>>>>> efifb_probe() will issue an error message in case the kernel is booted
>>>>> as Xen dom0 from UEFI as EFI_MEMMAP won't be set in this case. Avoid
>>>>> that message by calling efi_mem_desc_lookup() only if EFI_PARAVIRT
>>>>> isn't set.
>>>>>
> 
> Why not test for EFI_MEMMAP instead of EFI_BOOT?

Honestly I'm not sure EFI_BOOT is always set in that case. If you tell
me it is fine to just replace the test to check for EFI_MEMMAP I'm fine
to modify my patch.


Juergen

