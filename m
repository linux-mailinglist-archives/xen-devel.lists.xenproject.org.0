Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA22EF6CB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 18:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63782.113126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxvwl-0004hq-Ex; Fri, 08 Jan 2021 17:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63782.113126; Fri, 08 Jan 2021 17:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxvwl-0004hR-Bf; Fri, 08 Jan 2021 17:53:11 +0000
Received: by outflank-mailman (input) for mailman id 63782;
 Fri, 08 Jan 2021 17:53:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TfFo=GL=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kxvwi-0004hL-Qb
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 17:53:09 +0000
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28b07034-526d-4fa2-8a98-cc692bcfeaa2;
 Fri, 08 Jan 2021 17:53:07 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:40462
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kxvwZ-000PFX-LH (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Fri, 08 Jan 2021 17:52:59 +0000
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
X-Inumbo-ID: 28b07034-526d-4fa2-8a98-cc692bcfeaa2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e3bmFR/UoqtFuuF/Sn1ZMjP5hdagzhYKEZ8hIPFmhSY=; b=hyM0sqXMFxcKHkQlOhlerKvIv9
	GnZUoFo+FsAmE/7NAG2tCNO6MFFRX8s0WqFu9CdKtGnu92gN1NqSn/q/NdMeJeLrDIj+ce6bbrsM5
	AZ58I4FT6picRGFp+rGRGVRE+K9GewBaS8YUWXYemsDIrHBvx+SCwLxLu+Gcq3fWuOuw=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 05/11] tools/foreignmem: Support querying the size of a
 resource
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <amc96@cam.ac.uk>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-6-andrew.cooper3@citrix.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Autocrypt: addr=amc96@cam.ac.uk; keydata=
 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
Message-ID: <22be067c-1e6f-c87d-f910-ced27091a87a@cam.ac.uk>
Date: Fri, 8 Jan 2021 17:52:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922182444.12350-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 22/09/2020 19:24, Andrew Cooper wrote:
> diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
> index fe73d5ab72..eec089e232 100644
> --- a/tools/libs/foreignmemory/linux.c
> +++ b/tools/libs/foreignmemory/linux.c
> @@ -339,6 +342,39 @@ int osdep_xenforeignmemory_map_resource(
>      return 0;
>  }
>  
> +int osdep_xenforeignmemory_resource_size(
> +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +    unsigned int id, unsigned long *nr_frames)
> +{
> +    int rc;
> +    struct xen_mem_acquire_resource *xmar =
> +        xencall_alloc_buffer(fmem->xcall, sizeof(*xmar));
> +
> +    if ( !xmar )
> +    {
> +        PERROR("Could not bounce memory for acquire_resource hypercall");
> +        return -1;
> +    }
> +
> +    *xmar = (struct xen_mem_acquire_resource){
> +        .domid = domid,
> +        .type = type,
> +        .id = id,
> +    };
> +
> +    rc = xencall2(fmem->xcall, __HYPERVISOR_memory_op,
> +                  XENMEM_acquire_resource, (uintptr_t)xmar);
> +    if ( rc )
> +        goto out;
> +
> +    *nr_frames = xmar->nr_frames;
> +
> + out:
> +    xencall_free_buffer(fmem->xcall, xmar);
> +
> +    return rc;
> +}

Having talked this through with Roger, it's broken.

In the meantime, foreignmem has gained acquire_resource on FreeBSD.
Nothing in this osdep function is linux-specific, so it oughtn't to be
osdep.

However, its also not permitted to make hypercalls like this in
restricted mode, and that isn't something we should be breaking. 
Amongst other things, it will prevent us from supporting >128 cpus, as
Qemu needs updating to use this interface in due course.

The only solution (which keeps restricted mode working) is to fix
Linux's ioctl() to be able to understand size requests.  This also
avoids foreignmem needing to open a xencall handle which was fugly in
the first place.

This patch (well - a subset of it) will be needed to remain, to make a
usable interface in userspace.

~Andrew

