Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CFBC613C1
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 12:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163243.1490426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKb9y-000468-TT; Sun, 16 Nov 2025 11:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163243.1490426; Sun, 16 Nov 2025 11:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKb9y-000444-Qk; Sun, 16 Nov 2025 11:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1163243;
 Sun, 16 Nov 2025 11:43:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKb9x-00043y-TB
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 11:43:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKb9x-00A6jv-0Y;
 Sun, 16 Nov 2025 11:43:09 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKb9w-000bRg-2m;
 Sun, 16 Nov 2025 11:43:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=VicII8vY/o+jje6S04gQAxkgnQ+Xq8DsT0fI3Yzz3ss=; b=Gc5kTf6UA2iY4mDTCk83P/niL3
	IIru41IGkl4hG8WhzKQ4ujoaylH1MwNlpqFfFz74HlDxVtPHFB79mUY/n8xjdBDR6tE3XEJWTMJ/X
	zNMG60uHUb4wrJy59SjbUc7rj3EZJZxCesgBWrxoG4I84QAmEIBX+2wCtndu9bWQGPGw=;
Message-ID: <8b19fe39-f31a-4698-a004-1e57eb854082@xen.org>
Date: Sun, 16 Nov 2025 11:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] docs: Document CPU hotplug
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <48bafdb8e6269a3d958065c6a1062ce2736632a0.1762939773.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48bafdb8e6269a3d958065c6a1062ce2736632a0.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 10:51, Mykyta Poturai wrote:
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v3->v4:
> * update configuration section
> 
> v2->v3:
> * patch introduced
> ---
>   docs/misc/cpu-hotplug.txt | 51 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 docs/misc/cpu-hotplug.txt
> 
> diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
> new file mode 100644
> index 0000000000..1fbad0ecf7
> --- /dev/null
> +++ b/docs/misc/cpu-hotplug.txt
> @@ -0,0 +1,51 @@
> +CPU Hotplug
> +===========
> +
> +CPU hotplug is a feature that allows pCPU cores to be added to or removed from a
> +running system without requiring a reboot. It is supported on x86 and Arm64
> +architectures.

"supported" usually implies that we will backport fixes and issues XSA. 
Is this what you intended to say?

Asking because SUPPORT.md has the following:

### ACPI CPU Hotplug

     Status, x86: Experimental

There is also no mention for Arm in SUPPORT.md. As you enable the 
feature, we should clarify what's its state.
	> +
> +Implementation Details
> +----------------------
> +
> +CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl calls.
> +The specific calls are:
> +
> +- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
> +- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
> +- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
> +- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
> +
> +All cores can be disabled, assuming hardware support, except for core 0. Sysctl
> +calls are routed to core 0 before doing any actual up/down operations on other
> +cores.
> +
> +Configuration
> +-------------
> +
> +Sysctl handlers are enabled unconditionally on x86 architecture. On Arm64,
> +handlers are enabled by default when ITS, FFA, and TEE configs are disabled.
> +Building of the userspace tool "hptool" is controlled by the "hptool" flag in
> +the configure script. It is enabled by default and can be disabled with
> +--disable-hptool command line option.
> +
> +Usage
> +-----
> +
> +Disable core:
> +
> +$ xen-hptool cpu-offline 2
> +Prepare to offline CPU 2
> +(XEN) Removing cpu 2 from runqueue 0
> +CPU 2 offlined successfully
> +
> +Enable core:
> +
> +$ xen-hptool cpu-online 2
> +Prepare to online CPU 2
> +(XEN) Bringing up CPU2
> +(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
> +(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
> +(XEN) CPU 2 booted.
> +(XEN) Adding cpu 2 to runqueue 0
> +CPU 2 onlined successfully

Cheers,

-- 
Julien Grall


