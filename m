Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3A1E12DF
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 18:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdGBx-00059P-6V; Mon, 25 May 2020 16:43:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGcw=7H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jdGBv-00058h-Ca
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 16:43:07 +0000
X-Inumbo-ID: c66a1128-9ea6-11ea-aef8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c66a1128-9ea6-11ea-aef8-12813bfff9fa;
 Mon, 25 May 2020 16:42:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7BD3AC51;
 Mon, 25 May 2020 16:42:53 +0000 (UTC)
Subject: Re: Xen PVH domU start-of-day VCPU state
To: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 anil@recoil.org, dave@recoil.org
References: <20200525160401.GA3091@nodbug.lucina.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
Date: Mon, 25 May 2020 18:42:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200525160401.GA3091@nodbug.lucina.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.05.20 18:04, Martin Lucina wrote:
> Hi,
> 
> I'm trying to bootstrap a new PVH-only Xen domU OS "from scratch", to
> replace our existing use of Mini-OS for the early boot/low-level support
> layer in MirageOS. I've done this by creating new Xen bindings for Solo5
> [1], basing them on our existing virtio code [2].
> 
> Unfortunately, I can't seem to get past the first few instructions on VCPU
> boot. Here's what I have at the moment (abridged):
> 
>      .section .note.solo5.xen
> 
>              .align  4
>              .long   4
>              .long   4
>              .long   XEN_ELFNOTE_PHYS32_ENTRY
>              .ascii "Xen\0"
>              .long   _start32
> 
>      /* ... */
> 
>      .code32
> 
>      ENTRY(_start32)
>              cld
> 
>              lgdt (gdt64_ptr)
>              ljmp $0x10, $1f

You need to setup virtual addressing and enable 64 bit mode before using
64-bit GDT.

See Mini-OS source arch/x86/x86_hvm.S


Juergen

