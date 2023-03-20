Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF46C1F2C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512058.791663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJyh-0001Xq-V8; Mon, 20 Mar 2023 18:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512058.791663; Mon, 20 Mar 2023 18:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJyh-0001VW-SF; Mon, 20 Mar 2023 18:11:27 +0000
Received: by outflank-mailman (input) for mailman id 512058;
 Mon, 20 Mar 2023 18:11:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peJyg-0001VN-3n
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 18:11:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peJyc-0003Av-9K; Mon, 20 Mar 2023 18:11:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.17.111]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peJyc-000430-2A; Mon, 20 Mar 2023 18:11:22 +0000
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
	bh=UwjuBidChx0Z7MpRJ7V+++PDtlGWZdl8Riz1mFgubiM=; b=0xr2OvVtjJ+3IoDbAuFNG6WzDd
	QdN/JBn+h4l4Gs2hBBJ26BSDT7m3mR/KFwC2IsXb42xj0p9FrAbCk6hI3in52cajvdR3INygZzkfi
	aIKzKKcJYJPCJfvbhf/b/h1PiuVcs+3bUh9JwOIfJZoUb33SlSGxDWtL02pp9IsJOMzk=;
Message-ID: <c870f9dd-797d-095d-9bd2-5869bc6193ad@xen.org>
Date: Mon, 20 Mar 2023 18:11:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v3] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-US
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>
References: <858e4c67d14ec9d9c6737dd0b33056e3610c00f6.1679054228.git.isaikin-dmitry@yandex.ru>
From: Julien Grall <julien@xen.org>
In-Reply-To: <858e4c67d14ec9d9c6737dd0b33056e3610c00f6.1679054228.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/03/2023 12:01, Dmitry Isaykin wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 51be28c3de..7280e9f968 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1063,6 +1063,7 @@ struct xen_domctl_psr_cmt_op {
>   /* Enabled by default */
>   #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
>   #define XEN_DOMCTL_MONITOR_EVENT_VMEXIT                12
> +#define XEN_DOMCTL_MONITOR_EVENT_IO                    13
>   
>   struct xen_domctl_monitor_op {
>       uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> index 0035c26e12..1e4b6063f5 100644
> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -160,6 +160,8 @@
>   #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
>   /* VMEXIT */
>   #define VM_EVENT_REASON_VMEXIT                  15
> +/* IN/OUT Instruction executed */
> +#define VM_EVENT_REASON_IO_INSTRUCTION          16
>   
>   /* Supported values for the vm_event_write_ctrlreg index. */
>   #define VM_EVENT_X86_CR0    0
> @@ -388,6 +390,13 @@ struct vm_event_vmexit {
>       } arch;
>   };
>   
> +struct vm_event_io {
> +    uint32_t data_size;
> +    uint16_t port;
> +    uint8_t  dir; /* IOREQ_READ or IOREQ_WRITE */
> +    uint8_t  string_ins;
It would be good to comment what the value is meant to be? Is it 0 and 1 
(extra meaning to be confirmed) with the other values reserved for 
future purpose?

Cheers,

-- 
Julien Grall

