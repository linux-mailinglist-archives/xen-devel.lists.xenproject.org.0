Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C93414F59
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 19:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192975.343735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6Gd-00069B-As; Wed, 22 Sep 2021 17:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192975.343735; Wed, 22 Sep 2021 17:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6Gd-00067O-6t; Wed, 22 Sep 2021 17:42:47 +0000
Received: by outflank-mailman (input) for mailman id 192975;
 Wed, 22 Sep 2021 17:42:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tKcP=OM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mT6Gb-00067I-8Z
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 17:42:45 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2bb333d3-ef26-49f8-86cf-69b74f0549dc;
 Wed, 22 Sep 2021 17:42:44 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-ggp9NKr6NNmscOmBfPvVtQ-1; Wed, 22 Sep 2021 13:42:42 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so2851944wrd.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 10:42:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w1sm6588014wmc.19.2021.09.22.10.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
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
X-Inumbo-ID: 2bb333d3-ef26-49f8-86cf-69b74f0549dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632332564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVaOmuvSmYMdDMUDJJ0nLDELyFbMOLlDnDD2b93jvo8=;
	b=Htwu1n9DeDxsziaCPMz9t6wz0Mw0GtG++cWp/nBcFvG6MM6eM5UywOJvFWeioZrknvIQMD
	BBYgMXFCWrpjbf59/YJNDt/e8o6cbWAEIRHGKmLGfdTK7EBPQeGgjt1uf/R6xGfw+B7q+X
	6GVImcLQ8pK8m9UKXmhJNv9hUnuVK+E=
X-MC-Unique: ggp9NKr6NNmscOmBfPvVtQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uVaOmuvSmYMdDMUDJJ0nLDELyFbMOLlDnDD2b93jvo8=;
        b=oitZFyFq4UYLAInIGuCa5ZDaOwFcYbFyXQl6JorvRTAlYrf8vS9eA4sxlegKK86LUU
         UW5D/gYhRqxAwvdfbtcdCn4qSeso9gv/0stCHA23gQ1cxrgYPQ4bB3/XZ4gZIn3n85gj
         lXgFvpBgoaDUUNZAE3j8p7QmB5jcoasfqy+jVlZCABzifFkX97rf/MXlwGNPP0OoqHtj
         uWnlS90B1Zg4bmMdzZO5RhNUgWIGLA8+G2pBpmJUPYzMkTRKkuKR5CihC3BM7q4rjqMf
         E50ujdWcGBLe8JoOwKVQ/NCTHdVHcnpwzKSAZY3RI0MPx0rot3GseXskfol6iM9UloJ9
         VmJw==
X-Gm-Message-State: AOAM530+9d9hW8flowghdwAN0C3dmPOjMS3fKddXxEmKqchux8d2uKaW
	ewYslyIqZQrofHjOZhBOHUbR10iuy0UOvHvClkiWjgNJXyGTjmqDdDtf1r59O+qUd2FqznMhZIg
	ZtemzrT+bix+fOP5RIZ//DFSd/u0=
X-Received: by 2002:a1c:7310:: with SMTP id d16mr326728wmb.30.1632332561639;
        Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMUMMi8eLqjRXCSalitvGzPda/oA8H6U5KYwVIDPTTCJLTISya0LAgbbYFrl2db1iXLKfbNQ==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr326712wmb.30.1632332561486;
        Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
Message-ID: <bc37831d-4d31-8b02-acc9-c54191bbf31e@redhat.com>
Date: Wed, 22 Sep 2021 19:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/21 18:14, Damien Hedde wrote:
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
> 
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 22 ++++++++++++++--------
>   2 files changed, 36 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


