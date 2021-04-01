Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37893515C7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104594.200236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRykk-0008AX-HF; Thu, 01 Apr 2021 14:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104594.200236; Thu, 01 Apr 2021 14:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRykk-0008AA-ED; Thu, 01 Apr 2021 14:56:58 +0000
Received: by outflank-mailman (input) for mailman id 104594;
 Thu, 01 Apr 2021 14:56:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRykj-0008A4-1E
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:56:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRykh-0008B8-HE; Thu, 01 Apr 2021 14:56:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRykh-0003kS-BF; Thu, 01 Apr 2021 14:56:55 +0000
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
	bh=rfgmK8b3v2wrnOQZH/HmOldZxQezvqRdiK53LCZCLKg=; b=Yht5N5XR3g4reB06REhcxUGQLI
	ticfeF3lexnbto1XPZ16QqDvXCkQdwHagsATzPoMkZihka5nXyJjhBvBfvI52JttLNemcyW2FItwX
	ceheQrAnkPcB8VCKeI5q5fJo156XcZq9uRd59EiHDsvK5WB9W2luiWjSF9So8XRpl6PE=;
Subject: Re: [PATCH 02/23] lib: move 64-bit div/mod compiler helpers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <0fec827f-bb0b-4ea1-7757-9c27e9138be7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <008a8b14-8f58-2127-9e97-87c696e07b5e@xen.org>
Date: Thu, 1 Apr 2021 15:56:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0fec827f-bb0b-4ea1-7757-9c27e9138be7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/04/2021 11:19, Jan Beulich wrote:
> These were built for 32-bit architectures only (the same code could,
> with some tweaking, sensibly be used to provide TI-mode helpers on
> 64-bit arch-es) - retain this property, while still avoiding to have
> a CU without any contents at all. For this, Arm's CONFIG_64BIT gets
> generalized.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/arch/Kconfig                   |  2 ++
>   xen/arch/arm/Kconfig               | 12 +++---------
>   xen/arch/x86/Kconfig               |  1 +
>   xen/common/Makefile                |  1 -
>   xen/lib/Makefile                   |  4 ++++
>   xen/{common/lib.c => lib/divmod.c} |  2 --
>   6 files changed, 10 insertions(+), 12 deletions(-)
>   rename xen/{common/lib.c => lib/divmod.c} (99%)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index d144d4c8d3ee..f16eb0df43af 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,3 +1,5 @@
> +config 64BIT
> +	bool
>   
>   config NR_CPUS
>   	int "Maximum number of CPUs"
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 330bbf6232d4..ecfa6822e4d3 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -1,17 +1,11 @@
> -config 64BIT
> -	bool
> -	default "$(ARCH)" != "arm32"
> -	help
> -	  Say yes to build a 64-bit Xen
> -	  Say no to build a 32-bit Xen
> -
>   config ARM_32
>   	def_bool y
> -	depends on !64BIT
> +	depends on "$(ARCH)" = "arm32"
>   
>   config ARM_64
>   	def_bool y
> -	depends on 64BIT
> +	depends on !ARM_32
> +	select 64BIT
>   	select HAS_FAST_MULTIPLY
>   
>   config ARM
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index f79e6634db3f..4d6911ffa467 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -1,5 +1,6 @@
>   config X86_64
>   	def_bool y
> +	select 64BIT
>   
>   config X86
>   	def_bool y
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 71c1d466bd8f..e2a7e62d14bf 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -21,7 +21,6 @@ obj-y += kernel.o
>   obj-y += keyhandler.o
>   obj-$(CONFIG_KEXEC) += kexec.o
>   obj-$(CONFIG_KEXEC) += kimage.o
> -obj-y += lib.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
>   obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>   obj-y += memory.o
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 0b274583ef0b..a5dc1442a422 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -10,3 +10,7 @@ lib-y += rbtree.o
>   lib-y += sort.o
>   lib-$(CONFIG_X86) += xxhash32.o
>   lib-$(CONFIG_X86) += xxhash64.o
> +
> +lib32-y := divmod.o
> +lib32-$(CONFIG_64BIT) :=
> +lib-y += $(lib32-y)
> diff --git a/xen/common/lib.c b/xen/lib/divmod.c
> similarity index 99%
> rename from xen/common/lib.c
> rename to xen/lib/divmod.c
> index 5b8f49153dad..0be6ccc70096 100644
> --- a/xen/common/lib.c
> +++ b/xen/lib/divmod.c
> @@ -40,7 +40,6 @@
>    * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
>    * SUCH DAMAGE.
>    */
> -#if BITS_PER_LONG == 32

In theory BITS_PER_LONG == 32 is not quite the same as 32-bit arch. Can 
you clarify whether this code is necessary on 64-bit arch where long is 
only 32-bit.

Cheers?

-- 
Julien Grall

