Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247972CC3ED
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 18:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42936.77266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkW2X-0005Iz-1u; Wed, 02 Dec 2020 17:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42936.77266; Wed, 02 Dec 2020 17:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkW2W-0005Ia-Up; Wed, 02 Dec 2020 17:35:40 +0000
Received: by outflank-mailman (input) for mailman id 42936;
 Wed, 02 Dec 2020 17:35:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkW2V-0005IV-73
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 17:35:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkW2S-0007PM-KS; Wed, 02 Dec 2020 17:35:36 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkW2R-00046l-Ug; Wed, 02 Dec 2020 17:35:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=2d1O9j/QPszej8rCOoWJe+/YrsxXIN6L80GKVTZ8lFA=; b=DNih/QhlpiQxhtO2yg2vG3/Zhw
	L0DCmOXps3kgE1zIxd25TOY+E0UvBLAbbqPml/CGU/7dPEfCP3VCPdkXG2f9RHeIA+x1qozVgKq7G
	kdPAIHeGDvIXbRftQUfO11UA9EqJl8Ahvaqfz5V2eRyBopyfwkcehO7pfncMVKxBI/qk=;
Subject: Re: [PATCH 2/2] mm: split out mfn_t / gfn_t / pfn_t definitions and
 helpers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <fb4de786-7302-3336-dcb4-1a388bee34bc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9c240acd-f3ef-6775-eb4b-6e3b14251e51@xen.org>
Date: Wed, 2 Dec 2020 17:35:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <fb4de786-7302-3336-dcb4-1a388bee34bc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/12/2020 14:50, Jan Beulich wrote:
> xen/mm.h has heavy dependencies, while in a number of cases only these
> type definitions are needed. This separation then also allows pulling in
> these definitions when including xen/mm.h would cause cyclic
> dependencies.
> 
> Replace xen/mm.h inclusion where possible in include/xen/. (In
> xen/iommu.h also take the opportunity and correct the few remaining
> sorting issues.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -10,7 +10,6 @@
>    * Slimmed with Xen specific support.
>    */
>   
> -#include <asm/io.h>

This seems to be unrelated of this work.

>   #include <xen/acpi.h>
>   #include <xen/errno.h>
>   #include <xen/iocap.h>
> --- a/xen/drivers/char/meson-uart.c
> +++ b/xen/drivers/char/meson-uart.c
> @@ -18,7 +18,9 @@
>    * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include <xen/errno.h>
>   #include <xen/irq.h>
> +#include <xen/mm.h>

I was going to ask why xen/mm.h needs to be included here. But it looks 
like ioremap_nocache() is defined in mm.h rather than vmap.h.

I will add it as a clean-up on my side.


>   #include <xen/serial.h>
>   #include <xen/vmap.h>
>   #include <asm/io.h>
> --- a/xen/drivers/char/mvebu-uart.c
> +++ b/xen/drivers/char/mvebu-uart.c
> @@ -18,7 +18,9 @@
>    * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include <xen/errno.h>
>   #include <xen/irq.h>
> +#include <xen/mm.h>
>   #include <xen/serial.h>
>   #include <xen/vmap.h>
>   #include <asm/io.h>
> --- a/xen/include/asm-x86/io.h
> +++ b/xen/include/asm-x86/io.h
> @@ -49,6 +49,7 @@ __OUT(l,,int)
>   
>   /* Function pointer used to handle platform specific I/O port emulation. */
>   #define IOEMUL_QUIRK_STUB_BYTES 9
> +struct cpu_user_regs;
>   extern unsigned int (*ioemul_handle_quirk)(
>       u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
>   
> --- /dev/null
> +++ b/xen/include/xen/frame-num.h

It would feel more natural to me if the file is named mm-types.h.

Cheers,

-- 
Julien Grall

