Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533C6C354A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512793.793007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedgI-0002Xl-KK; Tue, 21 Mar 2023 15:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512793.793007; Tue, 21 Mar 2023 15:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedgI-0002W2-GX; Tue, 21 Mar 2023 15:13:46 +0000
Received: by outflank-mailman (input) for mailman id 512793;
 Tue, 21 Mar 2023 15:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=03cH=7N=list.ru=valor@srs-se1.protection.inumbo.net>)
 id 1pedgG-0002Vw-Mn
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:13:45 +0000
Received: from smtp17.i.mail.ru (smtp17.i.mail.ru [95.163.41.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f69535f1-c7fa-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 16:13:42 +0100 (CET)
Received: by smtp17.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1pedgC-00E7Yu-1r; Tue, 21 Mar 2023 18:13:40 +0300
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
X-Inumbo-ID: f69535f1-c7fa-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=qPP1M5IFSH9zx1ZzxjJLvXoDsj1nz98BxuwTlaMrt7Q=;
	t=1679411622;x=1679501622; 
	b=tNf1DHiChGb6Z/orxCUGpnoNJOsR76HjZSLuR3Cp42cBG3lAEkA99eeI3JP02LhfLqyWsLdj4p/ZZavdYRu4bZ38tPxR60mKl5unnc10QW/F/AP5rfLeo0JkmX9Z2sTs/Xe3brvTTh2r1ADXB3wG0qxJToSGDFtHJJw4+JRDnavYxK/J4TwsiStYtST9xYcIyogq+691Gw6NaXrkXDlYnH1hzS8TeOhLGJQ9AcacOxQoc//VMFLeHsTZGaKNxyQdQ5fVfOem4SI1eUBd+4Nfu8jpjG6G1W8vvnD7pTSqQ9mGyuR+0IVnww7E1v5he12/3N9tQB/iq2LEcRFfB4i8gg==;
Message-ID: <49dda9cd-3e6e-1062-1851-ca6601018e51@list.ru>
Date: Tue, 21 Mar 2023 18:13:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: ru, en-US
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
In-Reply-To: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD992B47CBA3690DD1E33C7708EBC2A8DFD233A4A8259E5758300894C459B0CD1B9F0C83F24E9F18DA8B1447A49C28AFEF7F0664F603B66ED770A58214F65DFC571
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7ABF4E7777AC3C096EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372094AD700861FA748638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BE663010BC51B312A345823404F49A5C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7F15BD2ADF938F0759FA2833FD35BB23D9E625A9149C048EEC24E1E72F37C03A02CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC7A3838EBC35966AA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC69CA9D5DD3A960893AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006373D42D4F566CB30C1D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F790063789CC3F4C0027555EEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AC6E62257D6CD1C9805869C331FEA2A1DB98AB3CDE934B789E7CD4AA204B119532AD9AB561D841D91D7E09C32AA3244C78FC672409C2BE6EDABE2F7EACDD3A8D3A76366E8A9DE7CAED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTmvmcsmE6tiRB+N2lU5/Ow==
X-Mailru-Sender: 9422C5FC7C00AE69302EDEBB3FCEDF4FE1672C4618465B79F21C6400DB605B6C3AB249A19D58F90376E790B0992C7B54B52423DB74AF18EABD4DCABF7D1B4669C77752E0C033A69E3453F38A29522196
X-Mras: Ok

Thanks to all for suggestions and notes.

Though as Andrew Cooper noticed current approach is too over simplified.
As Tams K Lengyel noticed the effect could be too negligible and some
OS specific logic should be present.

So as for today we could drop the patch.

20.03.2023 19:32, Ковалёв Сергей пишет:
> gva_to_gfn command used for fast address translation in LibVMI project.
> With such a command it is possible to perform address translation in
> single call instead of series of queries to get every page table.
> 
> Thanks to Dmitry Isaykin for involvement.
> 
> Signed-off-by: Sergey Kovalev <valor@list.ru>
> 
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Tamas K Lengyel <tamas@tklengyel.com>
> Cc: xen-devel@lists.xenproject.org
> ---
> 
> ---
>   xen/arch/x86/domctl.c       | 17 +++++++++++++++++
>   xen/include/public/domctl.h | 13 +++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 2118fcad5d..0c9706ea0a 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1364,6 +1364,23 @@ long arch_do_domctl(
>               copyback = true;
>           break;
> 
> +    case XEN_DOMCTL_gva_to_gfn:
> +    {
> +        uint64_t ga = domctl->u.gva_to_gfn.addr;
> +        uint64_t cr3 = domctl->u.gva_to_gfn.cr3;
> +        struct vcpu* v = d->vcpu[0];
> +        uint32_t pfec = PFEC_page_present;
> +        unsigned int page_order;
> +
> +        uint64_t gfn = paging_ga_to_gfn_cr3(v, cr3, ga, &pfec, 
> &page_order);
> +        domctl->u.gva_to_gfn.addr = gfn;
> +        domctl->u.gva_to_gfn.page_order = page_order;
> +        if ( __copy_to_guest(u_domctl, domctl, 1) )
> +            ret = -EFAULT;
> +
> +        break;
> +    }
> +
>       default:
>           ret = -ENOSYS;
>           break;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 51be28c3de..628dfc68fd 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -948,6 +948,17 @@ struct xen_domctl_paging_mempool {
>       uint64_aligned_t size; /* Size in bytes. */
>   };
> 
> +/*
> + * XEN_DOMCTL_gva_to_gfn.
> + *
> + * Get the guest virtual to guest physicall address translated.
> + */
> +struct xen_domctl_gva_to_gfn {
> +    uint64_aligned_t addr;
> +    uint64_aligned_t cr3;
> +    uint64_aligned_t page_order;
> +};
> +
>   #if defined(__i386__) || defined(__x86_64__)
>   struct xen_domctl_vcpu_msr {
>       uint32_t         index;
> @@ -1278,6 +1289,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_vmtrace_op                    84
>   #define XEN_DOMCTL_get_paging_mempool_size       85
>   #define XEN_DOMCTL_set_paging_mempool_size       86
> +#define XEN_DOMCTL_gva_to_gfn                    87
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1340,6 +1352,7 @@ struct xen_domctl {
>           struct xen_domctl_vuart_op          vuart_op;
>           struct xen_domctl_vmtrace_op        vmtrace_op;
>           struct xen_domctl_paging_mempool    paging_mempool;
> +        struct xen_domctl_gva_to_gfn        gva_to_gfn;
>           uint8_t                             pad[128];
>       } u;
>   };

-- 
Best regards,
Sergey Kovalev


