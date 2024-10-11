Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B8999F37
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816744.1230845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBEn-0006fV-Rv; Fri, 11 Oct 2024 08:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816744.1230845; Fri, 11 Oct 2024 08:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBEn-0006cj-OK; Fri, 11 Oct 2024 08:43:05 +0000
Received: by outflank-mailman (input) for mailman id 816744;
 Fri, 11 Oct 2024 08:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SPWD=RH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1szBEm-0006cc-At
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:43:04 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c43fd2-87ac-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:43:03 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a9968114422so257400966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:43:03 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f28090sm188533866b.79.2024.10.11.01.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 01:43:01 -0700 (PDT)
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
X-Inumbo-ID: d3c43fd2-87ac-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728636182; x=1729240982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uK7bVDwUqdSSXqCQ+8WvLCvoErNePtyK6vj0Akt+rBs=;
        b=AdV0s3dOs1VbSlWifyIH08giX11F3L4HQB0mDNn4fTReSXnrSqLQ5gR+FETXq6gCis
         ct9kWx/CGLEoRNZKEvCIBq7TQbYHrawdT39I5vkJBM1kz4iqF9lvYP3MTyd0jW30648/
         8KXVNxPWhARwr+whX+l9lfNYB9aDBhiumqkZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636182; x=1729240982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uK7bVDwUqdSSXqCQ+8WvLCvoErNePtyK6vj0Akt+rBs=;
        b=I0JCAYS+yaDTKN0RESRZ1ztcJ7D/Eo0WStf69NWigbohYVbPXTdzL0yAIgy1cYtZjI
         MQ3QBXtv5WLcPvqPAM1KmEgJJrQ2+GiH6kRcqu7ZGUMrQHRT0bEBM8LnLHAE5GCenGlm
         rbvumvSi/TGQ4CJIBdzwaX9yXNiIxOjynJ2xnJ5KUOJp4Oy3PszLYmgXKFOmkd2fiTx0
         nzKr+QVD7I10CYHPYnRXB/cSeuzmcSG1EddKb09THsep4Tyb7tyP4GTd/dQLqIloAobs
         8WxKl3Fuc2WvG+KNmmXACNVzEJQEihajzoVV34C9anAMdZ8T3DRHULHOoPh5otHe3W+p
         61lg==
X-Forwarded-Encrypted: i=1; AJvYcCVlYZvFEc5s/VxPG1ohJ7wNV43oxeDZLBQbAU1bmteCFCiV2KIvuqGre/DTgcQynxeAvBT/tOnWhqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWQlGtbct/gQSV4Zhgqp0Ds1FJbxeWyDWTKDv5ZM8Dyv5fSgVM
	/D4WlWETCnyt4RiMpwZBAhh9sg2RkXVl/+gCFvShaFaLgz/yaxPXvFxwi1QN01E=
X-Google-Smtp-Source: AGHT+IH7dkama+lKckXw+dg1Oir6FRnBH3QafifhF5LDxm5/b4SYdFAh4O2xvUwc2TkYKenLbmejnQ==
X-Received: by 2002:a17:906:c14c:b0:a99:435c:89f2 with SMTP id a640c23a62f3a-a99b95f5f72mr180002966b.63.1728636182409;
        Fri, 11 Oct 2024 01:43:02 -0700 (PDT)
Message-ID: <3e6e0e97-ac19-4e27-a284-f9e39cbda5bb@citrix.com>
Date: Fri, 11 Oct 2024 09:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] stubdom: reduce xenstore library dependencies
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20241010155459.22389-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241010155459.22389-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2024 4:54 pm, Juergen Gross wrote:
> Instead of letting the xenstore stubdoms depend on libxenguest and
> with that on basically all Xen libraries, only let it depend on the
> actually used libraries.
>
> This is in preparation of removing the libxenctrl dependency from
> Xenstore and with that the capability to use xenstore-stubdom on
> multiple hypervisor versions.
>
> Juergen Gross (3):
>   config: update Mini-OS commit
>   tools/xenstored: remove unneeded libxenguest reference
>   stubdom: use real lib dependencies for xenstore stubdoms
>
>  Config.mk                       | 2 +-
>  stubdom/Makefile                | 6 ++++--
>  tools/xenstored/Makefile.common | 1 -
>  3 files changed, 5 insertions(+), 4 deletions(-)
>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

