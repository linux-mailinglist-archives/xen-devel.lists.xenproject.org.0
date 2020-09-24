Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E044B276E39
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOBB-0002cz-2f; Thu, 24 Sep 2020 10:08:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLOB9-0002cl-91
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:08:43 +0000
X-Inumbo-ID: 3f9254da-1043-4c79-8399-3b45552b53b5
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f9254da-1043-4c79-8399-3b45552b53b5;
 Thu, 24 Sep 2020 10:08:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z4so3158790wrr.4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=PxjuONuSpgIe0qh4pw3LdtZtlWigqqYRuj4esJeg8Dw=;
 b=Ykfq9RhLr8rzG/jL62enGpUDm8zzpaKfHsT5eefZxFaPDL6oigZzWoN05tuBIjGEHN
 PV/YsjImoCr3ZFx24wfIlNk5JMOOqrC0TUX2F1poKERWzqEQ9newG3tyqgVTVAVg6LWN
 Hp/Re4+ilbMNWChrld2A5qGwychW/d9RWPb1rFuN8wucGsosyleeRLbFBmbMWLa4ry0Q
 95C2gtZXVRXt6Q8J9Zuda26WIL+N+jBo2qgeGLXN2jL3GY5lvQ2E2pq4JP8w9hVi4A+H
 XNAxIe3WZ+rDzMSkZI9wA9b8sGBPcli1yzKadhBraESjPxbkc2YmnxEQX4YyQ2B6UlfG
 MOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=PxjuONuSpgIe0qh4pw3LdtZtlWigqqYRuj4esJeg8Dw=;
 b=PBQ1S6zwIc6AiW6/fUOwDT84IymBJa6sIFqEME+OzublWlfv8FDSqrRRRB7OcaMz3H
 M93gHHT2lz6Yhl6OjfnUhQeAHjFdtO9mLpHKRbEqvJxNe19zhaZ3Hw4YFd0JC558YUBe
 ZHXNHiW+wxeMKWA91BD813csEgIlq8maJr4ElgOY1lXLKryp/+FbxXuLa7t/C40S7KYn
 ubqOERh80W/AMXlyRVE6iZuWbRVxNfyu/qHYYObSBJeBAjx+tHaCI+P4AXQlszLeS33B
 4RTPWtw48ZttzaklqYl6Ncjv+aOws80gkHaO/hFHq36lSzmBsOxiaJiLS9CFObMIvEnU
 tuYQ==
X-Gm-Message-State: AOAM533i/TF79nKAs53cEfz08ENW7qgOneEz638choz26eZ37sEaes5B
 8r/h36e1+kOjXA+kQ3f0hmtA6Xgz7kv9mw==
X-Google-Smtp-Source: ABdhPJzB8Uzo2vxNuj86Wxa9N8o/t3qXnr96rEEZ681vCmWdbNuDWUrv/4USL/eJpw4r0IYagQJNlw==
X-Received: by 2002:adf:dccd:: with SMTP id x13mr4527492wrm.403.1600942120977; 
 Thu, 24 Sep 2020 03:08:40 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id h3sm3267314wrq.0.2020.09.24.03.08.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 03:08:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'George Dunlap'" <George.Dunlap@eu.citrix.com>,
 "'Ian Jackson'" <iwj@xenproject.org>, "'Jan Beulich'" <JBeulich@suse.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>,
 "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 "'Hubert Jasudowicz'" <hubert.jasudowicz@cert.pl>,
 "'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-7-andrew.cooper3@citrix.com>
In-Reply-To: <20200922182444.12350-7-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 06/11] xen/memory: Clarify the XENMEM_acquire_resource
 ABI description
Date: Thu, 24 Sep 2020 11:08:39 +0100
Message-ID: <003c01d6925a$ad0d99f0$0728cdd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyAJ/cLEsqQWqE0A=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 22 September 2020 19:25
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Jan Beulich <JBeulich@suse.com>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Paul Durrant
> <paul@xen.org>; Micha=C5=82 Leszczy=C5=84ski =
<michal.leszczynski@cert.pl>; Hubert Jasudowicz
> <hubert.jasudowicz@cert.pl>; Tamas K Lengyel <tamas@tklengyel.com>
> Subject: [PATCH v2 06/11] xen/memory: Clarify the =
XENMEM_acquire_resource ABI description
>=20
> This is how similar operations already operate, compatible with the =
sole
> implementation (in Linux), and explicitly gives us some flexibility.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/include/public/memory.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index d7eb34f167..c4c47a0b38 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -642,6 +642,7 @@ struct xen_mem_acquire_resource {
>       * IN/OUT
>       *
>       * As an IN parameter number of frames of the resource to be =
mapped.
> +     * This value may be updated during the course of the operation.
>       *
>       * When frame_list is NULL and nr_frames is 0, this is =
interpreted as a
>       * request for the size of the resource, which shall be returned =
in the
> @@ -656,7 +657,8 @@ struct xen_mem_acquire_resource {
>      uint32_t pad;
>      /*
>       * IN - the index of the initial frame to be mapped. This =
parameter
> -     *      is ignored if nr_frames is 0.
> +     *      is ignored if nr_frames is 0.  This value may be updated
> +     *      during the course of the operation.
>       */
>      uint64_t frame;
>=20
> @@ -672,7 +674,8 @@ struct xen_mem_acquire_resource {
>       *          If -EIO is returned then the frame_list has only been
>       *          partially mapped and it is up to the caller to unmap =
all
>       *          the GFNs.
> -     *          This parameter may be NULL if nr_frames is 0.
> +     *          This parameter may be NULL if nr_frames is 0.  This
> +     *          value may be updated during the course of the =
operation.
>       */
>      XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
>  };
> --
> 2.11.0



