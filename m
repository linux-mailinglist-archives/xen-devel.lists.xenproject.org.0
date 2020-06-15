Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009541F9158
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 10:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkkRY-0002dj-MH; Mon, 15 Jun 2020 08:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jkkRX-0002de-7M
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 08:26:11 +0000
X-Inumbo-ID: dd7b138a-aee1-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd7b138a-aee1-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 08:26:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so16122841wru.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=cqhzZxtqAsRRO3BzrlM6m9t/GkiBo/7EUSd/KzYdIbk=;
 b=MYpR7KNtizfDZo2iLVlKeXyFEvnN82kDlPWv+7SgEli37rq4gCv6oTD2jy4WL0TDYw
 SwQInUzLgI5iatZ/piryiorwntk0U2BQ19ySNBzmExnJ/ap5uCDvZTaKefsqXE+1CqW/
 smoco1uVE+7qJ25cDlwwRQxV/7lXA7CUuqUG/kXfD/QJlmidGyU4w6oB+e7a8/h2OaGa
 NOViInN+a7zLYrFI9PQq9N/IlHoerWs7Nvtabj8cpoPq1jXzYND5WDJtjbTlNnGkNqOO
 gRNvzysniMTHC8ovoRNmeCaMNaHBPh/ON3Wah9XtFlakjq3VdlnhWPBn4YqA/BiptYAb
 51yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=cqhzZxtqAsRRO3BzrlM6m9t/GkiBo/7EUSd/KzYdIbk=;
 b=ZUiZfmGsDpreMnZdJOP4zj0OxKumcUGRbDFu7okWqH5uXFRLp8yH0D/HIlHVp+Mghg
 a6YXxFiZlN3mqiAInHEJgy1JKRErbwyJwiohrFZhpPRJHYgu1glimvoHltUnXbcvF6LT
 1jsaWXT7GwlCGcluWy2CtZXETjQZajLaa18RZZgoybb5Ith1WnQ4mIOBANABTAlUs+b1
 +HMHLE5QT3xBrLF7oqe0OThJD9M6bPBPu9vTftlExZizw7sdamjKPbTzTAd0CCPjIdGj
 wrY+JRXn0PoebfoMxwbGS0jWpPNx/y6vMpNqrfo8NB31wKMiZBUGZRxm2unNhbeq/8vm
 EoPA==
X-Gm-Message-State: AOAM530BdxsjHg3zB18sivDDcRu6OZmh1GDSQr6xOG4xkvrr6Oh6YUJG
 6u4XJHGQsgkGSQVgujztNak=
X-Google-Smtp-Source: ABdhPJxIO5NxtMYxrMLj02HiqnOMDm6/U4pOCMdhgOWYaNt1Js549ycX2ty/Oa7pDhAJPXEcBuLNHw==
X-Received: by 2002:a05:6000:1184:: with SMTP id
 g4mr26351447wrx.46.1592209568984; 
 Mon, 15 Jun 2020 01:26:08 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id r2sm23941985wrg.68.2020.06.15.01.26.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 01:26:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200613184132.11880-1-julien@xen.org>
In-Reply-To: <20200613184132.11880-1-julien@xen.org>
Subject: RE: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
Date: Mon, 15 Jun 2020 09:26:06 +0100
Message-ID: <002301d642ee$9e86c390$db944ab0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIdN0zh64cmcx6NK7tx64iRcBxsdKhLbmMQ
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
Reply-To: paul@xen.org
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <jgrall@amazon.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 13 June 2020 19:42
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Julien Grall <jgrall@amazon.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>; Juergen Gross <jgross@suse.com>
> Subject: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely the padding for all arches
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The documentation of pvcalls suggests there is padding for 32-bit x86
> at the end of most the structure. However, they are not described in
> in the public header.
> 
> Because of that all the structures would be 32-bit aligned and not
> 64-bit aligned for 32-bit x86.
> 
> For all the other architectures supported (Arm and 64-bit x86), the
> structure are aligned to 64-bit because they contain uint64_t field.
> Therefore all the structures contain implicit padding.
> 
> The paddings are now corrected for 32-bit x86 and written explicitly for
> all the architectures.
> 
> While the structure size between 32-bit and 64-bit x86 is different, it
> shouldn't cause any incompatibility between a 32-bit and 64-bit
> frontend/backend because the commands are always 56 bits and the padding
> are at the end of the structure.
> 
> As an aside, the padding sadly cannot be mandated to be 0 as they are
> already present. So it is not going to be possible to use the padding
> for extending a command in the future.

Ugh.

> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> ---
>     Changes in v3:
>         - Use __i386__ rather than CONFIG_X86_32
> 
>     Changes in v2:
>         - It is not possible to use the same padding for 32-bit x86 and
>         all the other supported architectures.
> ---
>  docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
>  xen/include/public/io/pvcalls.h | 14 ++++++++++++++
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
> index 665dad556c39..caa71b36d78b 100644
> --- a/docs/misc/pvcalls.pandoc
> +++ b/docs/misc/pvcalls.pandoc
> @@ -246,9 +246,9 @@ The format is defined as follows:
>      			uint32_t domain;
>      			uint32_t type;
>      			uint32_t protocol;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef __i386__
>      			uint8_t pad[4];
> -    			#endif
> +			#endif
>      		} socket;
>      		struct xen_pvcalls_connect {
>      			uint64_t id;
> @@ -257,16 +257,18 @@ The format is defined as follows:
>      			uint32_t flags;
>      			grant_ref_t ref;
>      			uint32_t evtchn;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef __i386__
>      			uint8_t pad[4];
> -    			#endif
> +			#endif
>      		} connect;
>      		struct xen_pvcalls_release {
>      			uint64_t id;
>      			uint8_t reuse;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef __i386__
>      			uint8_t pad[7];
> -    			#endif
> +			#else
> +			uint8_t pad[3];
> +			#endif
>      		} release;
>      		struct xen_pvcalls_bind {
>      			uint64_t id;
> @@ -276,9 +278,9 @@ The format is defined as follows:
>      		struct xen_pvcalls_listen {
>      			uint64_t id;
>      			uint32_t backlog;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef __i386__
>      			uint8_t pad[4];
> -    			#endif
> +			#endif
>      		} listen;
>      		struct xen_pvcalls_accept {
>      			uint64_t id;
> diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
> index cb8171275c13..28374a82f410 100644
> --- a/xen/include/public/io/pvcalls.h
> +++ b/xen/include/public/io/pvcalls.h
> @@ -65,6 +65,9 @@ struct xen_pvcalls_request {
>              uint32_t domain;
>              uint32_t type;
>              uint32_t protocol;
> +#ifndef __i386__
> +            uint8_t pad[4];
> +#endif
>          } socket;
>          struct xen_pvcalls_connect {
>              uint64_t id;
> @@ -73,10 +76,18 @@ struct xen_pvcalls_request {
>              uint32_t flags;
>              grant_ref_t ref;
>              uint32_t evtchn;
> +#ifndef __i386__
> +            uint8_t pad[4];
> +#endif
>          } connect;
>          struct xen_pvcalls_release {
>              uint64_t id;
>              uint8_t reuse;
> +#ifndef __i386__
> +            uint8_t pad[7];
> +#else
> +            uint8_t pad[3];
> +#endif
>          } release;
>          struct xen_pvcalls_bind {
>              uint64_t id;
> @@ -86,6 +97,9 @@ struct xen_pvcalls_request {
>          struct xen_pvcalls_listen {
>              uint64_t id;
>              uint32_t backlog;
> +#ifndef __i386__
> +            uint8_t pad[4];
> +#endif
>          } listen;
>          struct xen_pvcalls_accept {
>              uint64_t id;
> --
> 2.17.1



