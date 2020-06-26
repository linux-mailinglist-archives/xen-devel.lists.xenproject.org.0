Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A320B4F8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqTn-0007dY-TS; Fri, 26 Jun 2020 15:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1joqTl-0007dR-Vd
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:41:26 +0000
X-Inumbo-ID: 7df3be4a-b7c3-11ea-8496-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7df3be4a-b7c3-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 15:41:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t194so9786927wmt.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BeD/NHdZkIwfRDP6Mg2PFeXR7Ht20SKficQIwODTwKE=;
 b=juIx2IErCdzA58VHHhTYRcHusmxp0wr25UXxy9cAZJPLes69Pi98I4cyTwlgeU8kDO
 jD9lJWib/6jkKFoaGk5md96DVDUvE4P+YzwSW12/KX9y4rMhjd5kEyUYviBDsFe65F9X
 vJO8RBF+hpQhnYHOPyWrIOOCnHuN1LbXfStAg3rUnSN0g5o0JQIFB+8r0daWLgjdSjUT
 HrcJBGbFEUHZ/r5ewtPz54Au/dQ+SPGu6vn2wqs9yYiNzPJ3bBN1293Z0JFa3wQNjdh1
 /ZHQVv82QQtTqgd67O3F3m/lLKpo87LHdEPllQGDIlkw6M63YlmcfiHrfNBDnWKiDkqM
 xr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BeD/NHdZkIwfRDP6Mg2PFeXR7Ht20SKficQIwODTwKE=;
 b=shb1tFPX8+07Be+JdphvzK3/yw5QTpazwyv7fVqnlLbpm6lI5Wo6/gzgEmPcSD2aQ5
 iBnHmrjtoW5cY+23PW3+rgY0YdiBgV3CccOLPmC1xtEcLKwe4G+KxpGL1eciYDEM2McJ
 k91+DFoGCii7oYXTHOAEeD7Jqvn8ihrG80kbJRqr+d+YQgyV0f97Erh6Xkoxyr4OMnFj
 /ltmk5F4tXUDUe7ADn6BDJvkYlDSGrv01TLkkmZADx4rH1H1nWBUD/Xppj0zl+x/Oyqj
 CFrqkHEnF70y4KUcdIs+eoT3j3F3J8VZegqE49S9o+ioBY142CDvUFJOIZvNC0haXs2w
 kDUQ==
X-Gm-Message-State: AOAM531iw2NOI0jtfFm+8M3u4t+LZDPlXSR0VPTNn0NROw7BcdDx2Tvf
 9zg5LNuoAnrSO872yKul3Wo=
X-Google-Smtp-Source: ABdhPJzVdH4frkVQdmuGgxYwMnxlrU3VGxHCZ5OOXBRHbvC7WBt0Ub/d6aV5aLGjKXCugiiJCkz4gg==
X-Received: by 2002:a1c:2157:: with SMTP id h84mr3999191wmh.35.1593186084475; 
 Fri, 26 Jun 2020 08:41:24 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b62sm7393080wmh.38.2020.06.26.08.41.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 08:41:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200626153951.91301-1-roger.pau@citrix.com>
In-Reply-To: <20200626153951.91301-1-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 v3] mm: fix public declaration of struct
 xen_mem_acquire_resource
Date: Fri, 26 Jun 2020 16:41:22 +0100
Message-ID: <000f01d64bd0$3f3c5e50$bdb51af0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIIgSIxQb0hh/+C7e70wUGvND+TKaiGnhrQ
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 26 June 2020 16:40
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>
> Subject: [PATCH for-4.14 v3] mm: fix public declaration of struct =
xen_mem_acquire_resource
>=20
> XENMEM_acquire_resource and it's related structure is currently inside
> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> hypervisor or the toolstack only. This is wrong as the hypercall is
> already being used by the Linux kernel at least, and as such needs to
> be public.
>=20
> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> uint64_aligned_t is only to be used by the toolstack. Doing such
> change will reduce the size of the structure on 32bit x86 by 4bytes,
> since there will be no padding added after the frame_list handle.
>=20
> This is fine, as users of the previous layout will allocate 4bytes of
> padding that won't be read by Xen, and users of the new layout won't
> allocate those, which is also fine since Xen won't try to access them.
>=20
> Note that the structure already has compat handling, and such handling
> will take care of copying the right size (ie: minus the padding) when
> called from a 32bit x86 context. This is true for the compat code both
> before and after this patch, since the structures in the memory.h
> compat header are subject to a pragma pack(4), which already removed
> the trailing padding that would otherwise be introduced by the
> alignment of the frame field to 8 bytes.
>=20
> Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire =
guest resources')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> Should also be backported.
> ---
> Changes since v2:
>  - Remove the tail padding.
>  - Expand commit message.
>=20
> Changes since v1:
>  - Add padding on 32bits so structure size matches between arches and
>    the previous layout is kept.
> ---
>  xen/include/public/memory.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index 850bd72c52..21057ed78e 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -610,6 +610,8 @@ struct xen_reserved_device_memory_map {
>  typedef struct xen_reserved_device_memory_map =
xen_reserved_device_memory_map_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
>=20
> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> +
>  /*
>   * Get the pages for a particular guest resource, so that they can be
>   * mapped directly by a tools domain.
> @@ -648,7 +650,7 @@ struct xen_mem_acquire_resource {
>       * IN - the index of the initial frame to be mapped. This =
parameter
>       *      is ignored if nr_frames is 0.
>       */
> -    uint64_aligned_t frame;
> +    uint64_t frame;
>=20
>  #define XENMEM_resource_ioreq_server_frame_bufioreq 0
>  #define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
> @@ -669,8 +671,6 @@ struct xen_mem_acquire_resource {
>  typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
>=20
> -#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> -
>  /*
>   * XENMEM_get_vnumainfo used by guest to get
>   * vNUMA topology from hypervisor.
> --
> 2.26.2



