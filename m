Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA1BDF3EC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 17:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143758.1477403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9333-0001u1-3J; Wed, 15 Oct 2025 15:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143758.1477403; Wed, 15 Oct 2025 15:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9332-0001re-W8; Wed, 15 Oct 2025 15:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1143758;
 Wed, 15 Oct 2025 15:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/G8=4Y=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v9331-0001r5-Vk
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 15:04:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32c88216-a9d8-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 17:04:08 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so40994715e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 08:04:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426fb279857sm1066562f8f.20.2025.10.15.08.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 08:04:06 -0700 (PDT)
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
X-Inumbo-ID: 32c88216-a9d8-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760540647; x=1761145447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jXWEmbODTr4r343Fu+N0MFEuT483ARvIEQ5JP/0jvsg=;
        b=e0Axbct5+EoDZqAQG3BBTxKH0KyeGDkcIMN7nSLb0IQnW+W0lBsS4COENVmzlhBgmP
         2F6dcY0L3ur4X0f0+lByAFmazD+xo+nJAxlsXgDgehpWQsmc44SI9PECOq0CJKbB8W3R
         OgbX0xb2Iu5pKUCYptovdfBVHAdnUAlzsv3yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540647; x=1761145447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXWEmbODTr4r343Fu+N0MFEuT483ARvIEQ5JP/0jvsg=;
        b=eSipBIvQUfmUifnsK96b6fY00vDkYiijLZtkvxtZUoLaxdJ7hHgI6IUF2r/NMIEKFq
         VyIjd5atoWJkqaRgoyF1Ba3XkWXaai9xNWXTSC2siu0IasNRcu5J57e8PKXQmiS9R4Dl
         wwLUUe/4QbgRvnRIO/KxJC4eYO8OZPSJGtnvXHc4nQZYCh0tUpThmVEvJAa6Z5OgArQm
         fsNHTesiHNgLIqtUVI8xkr+2DtwdFZDRvDxg53+ekKF1IrDSrOYfNTNcFidioSVn5cgV
         oiIlSXTF+zBNgBgu3Ch/QVfWV3bmqqLog93VZbgNCEe6HzjTXUoNxCMO1n4WIymyWYHW
         YN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxdpYmBjRqCjBj8J3KsLljwFSRNwES504z+FlVyF/I7hKNlFevo5+E6wmSFm05prC+gH4c4MGvaMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYzTeOFE4Cz+Bb/vSkopnY09y/VfQRXE3N5WiWkXcDksThEFeB
	iyv3NU4MXRyaRC8+7jnJbKmEqPunXS1yzqsYPjVl1mJTvlqcVyOK68ncs5XKRRnHxnk=
X-Gm-Gg: ASbGncvIJEHqFLcWxqZFioxvMZ01PnELuBdgirg6R8XhrdyIvylFHxlT6Y5Z00hkpgE
	1EGNK4a5u4OWVEYVxLshKr4wC9scD3cwyxatBlW/Orze0HklEs2I2j/ZxjvCWA2xNJBflrGWoil
	fua9DJOS2MHTDL5bap++YFMt3D2qsUzOPQubI1WvjE9htouONVafCq7oWpAyrA95ar1O0CsqNox
	RIbHVLcxyiofordK2uoUdfIuZX/tiZ3tvUafADb+8Bff4Pmjp++CO2F66RExAUo7EetFWZ6JuLg
	FFy0/7FwsJjqKJjrfJqUTq40gNT1P+s9xLGJCgOAGDT7hJBJ/XNySKCq9xpOij+Mm15JrQgyvXu
	fIjTEA66RKXBHVJMsx9cUwlFBtpClEczzyoGluDiacSaMVTeoIwX7uM3q+LyVvf70FrogCd4knr
	3DMVY+6HnYvbfCyY/s0ZEDcttn
X-Google-Smtp-Source: AGHT+IE/BKrfW5oJmA3/UlWQSRQon3yQi4aoShw6eKhakD36kT1np256sxKnYV/08f3BxiYkaIUUbA==
X-Received: by 2002:a05:600c:8719:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-46fa9a9efc4mr191389945e9.13.1760540647262;
        Wed, 15 Oct 2025 08:04:07 -0700 (PDT)
Message-ID: <87f5c526-8491-433c-bf64-027d5635b13f@citrix.com>
Date: Wed, 15 Oct 2025 16:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 0/6] tools/{lib,}xl: Coverity falllout from the
 json-c switch
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2025 2:40 pm, Roger Pau Monne wrote:
> Hello,
>
> The following series contains fixes for Coverity reported issues after
> the switch from YAJL to json-c.  Those reports are from the internal
> XenServer Coverity instance, as the project one hasn't been switched to
> use json-c yet, last patch in the series switches thegithub triggered
> Coverity build to use json-c.
>
> All should be considered for 4.21.
>
> Thanks, Roger.
>
> Roger Pau Monne (6):
>   tools/{lib,}xl: fix usage of error return from
>     json_tokener_parse_verbose()
>   tools/libxl: avoid freeing stack rubble in
>     libxl__json_object_to_json()
>   tools/xl: check return of json_object_object_add()
>   tools/xl: check return value of printf_info_one_json() in
>     list_domains_details()
>   tools/xl: fix possible uninitialized usage in printf_info()
>   github/coverity: switch to building with json-c instead of yajl

Other than my query on patch 1, everything else LGTM.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thankyou for looking at these.

