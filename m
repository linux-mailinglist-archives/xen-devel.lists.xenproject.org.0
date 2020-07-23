Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C422B1B5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 16:44:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jycRK-0007tq-Hv; Thu, 23 Jul 2020 14:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jycRJ-0007tl-RY
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 14:43:17 +0000
X-Inumbo-ID: d7ef76d4-ccf2-11ea-a2ba-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7ef76d4-ccf2-11ea-a2ba-12813bfff9fa;
 Thu, 23 Jul 2020 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595515397;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LX+ZlWCtBd1t9rdykL+lY+9RmrIAo5grgz9ZfVL9Epw=;
 b=cCWFbMrKIY7CauV500lkQigoEOypyazGsssRmTl2PyFIagqgjnirRGsN
 WfYz/6nzM9qNH9Y26b63thlDcBErqLh3Z/nxoovIY4SPRJfF6mLJOa7c4
 TXro6UqQQcn96iXZm019rKQ/zPJGALNGdy5WYMoLf3vGB21SRLghAv8V6 o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SAiegcltMIL9ydSkPEo7wUhAqyySwFguryX74FJRFwvQqEhn+wu9sR207uvhGU6SiDdQdIWb0Y
 8XyVNW3Fq7Iee4vXkP+3WNIAIOiWKX4emhDDLoREs4DgyIbRFTL45GCYNqFZHoUdgL9uZf32sD
 S81l6wCmyddCESFHLHEt4qgMLTq9hzzKervYWVN5ZTli0KXf9zzKnJw+8j7PlxHRzB38EqQhVS
 Ju9icWXj5mIDdOGMqDgCEp6m5F3ge67ZXBQJQPMgpigEjAYnVDnoa7FmHsiT9MDhFtMM5sZ9+e
 +w4=
X-SBRS: 2.7
X-MesageID: 23242506
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23242506"
Subject: Re: [PATCH] x86/S3: put data segment registers into known state upon
 resume
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6343ad61-246f-fefd-cd12-d260807e82f0@citrix.com>
Date: Thu, 23 Jul 2020 15:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "M. Vefa Bicakci" <m.v.b@runbox.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/07/2020 16:20, Jan Beulich wrote:
> wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
> wakeup_start did set it to, and %gs at whatever BIOS did load into it.
> All of this may end up confusing the first load_segments() to run on
> the BSP after resume, in particular allowing a non-nul selector value
> to be left in %fs.
>
> Alongside %ss, also put all other data segment registers into the same
> state that the boot and CPU bringup paths put them in.
>
> Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -52,6 +52,16 @@ ENTRY(s3_resume)
>          mov     %eax, %ss
>          mov     saved_rsp(%rip), %rsp
>  
> +        /*
> +         * Also put other segment registers into known state, like would
> +         * be done on the boot path. This is in particular necessary for
> +         * the first load_segments() to work as intended.
> +         */

I don't think the comment is helpful, not least because it refers to a
broken behaviour in load_segemnts() which is soon going to change anyway.

We've literally just loaded the GDT, at which point reloading all
segments *is* the expected thing to do.

I'd recommend that the diff be simply:

diff --git a/xen/arch/x86/acpi/wakeup_prot.S
b/xen/arch/x86/acpi/wakeup_prot.S
index dcc7e2327d..a2c41c4f3f 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -49,6 +49,10 @@ ENTRY(s3_resume)
         mov     %rax, %cr0
 
         mov     $__HYPERVISOR_DS64, %eax
+        mov     %eax, %ds
+        mov     %eax, %es
+        mov     %eax, %fs
+        mov     %eax, %gs
         mov     %eax, %ss
         mov     saved_rsp(%rip), %rsp
 

It is a shame that the CR0 load breaks up the obvious connection with
lgdt, but IIRC, that was a consequence of how the code was laid out
previously.

Preferably with the above diff, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

