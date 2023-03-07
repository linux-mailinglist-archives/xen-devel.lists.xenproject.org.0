Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D576AE66A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507596.781302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZa9J-0004pn-5x; Tue, 07 Mar 2023 16:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507596.781302; Tue, 07 Mar 2023 16:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZa9J-0004mw-2s; Tue, 07 Mar 2023 16:26:49 +0000
Received: by outflank-mailman (input) for mailman id 507596;
 Tue, 07 Mar 2023 16:26:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZa9H-0004mq-KQ
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:26:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daaf94dd-bd04-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:26:46 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id v16so12790389wrn.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:26:46 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b002c58ca558b6sm12858433wrr.88.2023.03.07.08.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:26:45 -0800 (PST)
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
X-Inumbo-ID: daaf94dd-bd04-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206406;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I80iEwAu4TMYHhdsbHIgvh7/mafwHEpwDMpOmPu3VGM=;
        b=L6S4fwA2oOwi/xBrfz6Nnp/KUez6VuoT6LaHwoLXXotSsmAX/KnN+sBsSELQumASdc
         8NcEG0lbHHtfIGO8eSYJmP6PwOLVvOY4jw3gYiGIl+pVoqEj76sncbhv88zjF9h2PI7l
         QR3+4dGeiR8aYULXgy06Ht/Ar2a7sAkkw9nUUN/mA50xzDl3sM85WQN0vWEDOZGX2ZEh
         YHb9MS55LNm38n+fBWSINnRtsflY0OiBdfzKFUhMv3RhUt7TIxcP6su7mV2q818pyElz
         AGhjYgjYtYMT7uxhWylriZ6NKdDzbwbq1c7rB8gGX7q1QWUpUCV8CGtORNJEzjSK5ljA
         sjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206406;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I80iEwAu4TMYHhdsbHIgvh7/mafwHEpwDMpOmPu3VGM=;
        b=xuVirrjpQfab2NMgszVkHSJIQLPbGYuY8ePol/V5SJl07yle33gjFHz2QsJY72gRw2
         rbWJ/9dSFLBL8Ci1BOZ96gsCVLmezImu+rp4MYikei30Bqj93zqbRo28Mmeu2P0zmW8s
         1RTOAasZTSaONVvpZxPcvenAR6DWHShB3gE2VP2lSXWpfRE2mDN4+56T50e3wTyRbeSz
         v+TxsvMyGxcgV4kZzOow2pxdSUR/+8SVnN1y2rrWi7biq4gKkrjJdXw4IymLcIPCSr3R
         LjwjpAM0hy4Me4U1KluSW638bRqEqYpah2fdn/NAgbv8sUe2Zg1Q6vkEBq5aF5yL/Van
         +BsA==
X-Gm-Message-State: AO0yUKU5JWYF+Ffy+MSujG+0zMd9XmMGvsluKalAL4U8n/NV1uxV6iKL
	l9le9B5WngWuhPqmRGoEDzA=
X-Google-Smtp-Source: AK7set8zbGsS6LCfp75z+EmFwqCqnXKYjSlzne8m1S5SgKTGCyISo+WRaXxS5E7mGw8oY8cOpmWBzQ==
X-Received: by 2002:adf:ce91:0:b0:2c3:fb3e:ae85 with SMTP id r17-20020adfce91000000b002c3fb3eae85mr10585326wrn.44.1678206406129;
        Tue, 07 Mar 2023 08:26:46 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <827fce11-372f-db65-b15d-6db8373dcf97@xen.org>
Date: Tue, 7 Mar 2023 16:26:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 23/25] hw/xen: Map guest XENSTORE_PFN grant in
 emulated Xenstore
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-24-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-24-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
> index 028f80499e..f9b7387024 100644
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -21,6 +21,7 @@
>   
>   #include "hw/sysbus.h"
>   #include "hw/xen/xen.h"
> +#include "hw/xen/xen_backend_ops.h"
>   #include "xen_overlay.h"
>   #include "xen_evtchn.h"
>   #include "xen_xenstore.h"
> @@ -34,6 +35,7 @@
>   
>   #include "hw/xen/interface/io/xs_wire.h"
>   #include "hw/xen/interface/event_channel.h"
> +#include "hw/xen/interface/grant_table.h"
>   
>   #define TYPE_XEN_XENSTORE "xen-xenstore"
>   OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
> @@ -66,6 +68,9 @@ struct XenXenstoreState {
>   
>       uint8_t *impl_state;
>       uint32_t impl_state_size;
> +
> +    struct xengntdev_handle *gt;
> +    void *granted_xs;
>   };
>   
>   struct XenXenstoreState *xen_xenstore_singleton;
> @@ -1452,6 +1457,17 @@ int xen_xenstore_reset(void)
>       }
>       s->be_port = err;
>   
> +    /*
> +     * We don't actually access the guest's page through the grant, because
> +     * this isn't real Xen, and we can just use the page we gave it in the
> +     * first place. Map the grant anyway, mostly for cosmetic purposes so
> +     * it *looks* like it's in use in the guest-visible grant table.

Might be useful to stick this text in the commit comment too.

Reviewed-by: Paul Durrant <paul@xen.org>

> +     */
> +    s->gt = qemu_xen_gnttab_open();
> +    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
> +    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
> +                                             PROT_READ | PROT_WRITE);
> +
>       return 0;
>   }
>   


