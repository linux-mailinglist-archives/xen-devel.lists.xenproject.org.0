Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551EAE17DB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 11:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020694.1396818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYEH-0003VY-16; Fri, 20 Jun 2025 09:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020694.1396818; Fri, 20 Jun 2025 09:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYEG-0003TH-TV; Fri, 20 Jun 2025 09:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1020694;
 Fri, 20 Jun 2025 09:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSYEF-0003TB-Gh
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 09:40:11 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 871eaa94-4dba-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 11:39:57 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d54214adso12155665e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 02:39:57 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d0f1d868sm1548901f8f.44.2025.06.20.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 02:39:56 -0700 (PDT)
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
X-Inumbo-ID: 871eaa94-4dba-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750412397; x=1751017197; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxDIJUE+HPxU05Xg/Wr+29VEXI+BUKdLDuT6Res18Jo=;
        b=qAd9cdVR6otGPAxCptLuldMiTJEHXpf5S4cMm2YQ/EyWgCxZPUG1SKcaqmh/VwbTtm
         RvXD7MmIB2amqXQhymda6SMKxRANg4qBsGXZ6IAh4m005CyktjctZ7Bs1bbWw2CDmbBE
         /zWzSJODjedUsAyVn1nv8JyA0gq/ScFkakYrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412397; x=1751017197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxDIJUE+HPxU05Xg/Wr+29VEXI+BUKdLDuT6Res18Jo=;
        b=QxM9OoLlRrIzscz3R3YBWifAIemw4A0m+/aTjvZo7g0h71hg+mJVZ2YF3pg2p+adFA
         M9mx+iBb24GtHN6W3nDT9i9bQxxj8qdsQqPU06zJ8BVOJ3cNebue467Zt5NA9Jli3w6x
         kQOymoJSx4NVGLNIrpw0y7exfDA3Kh+M/cjugxx3ehtPKq8fnuABaEUyi/C561NpnJpa
         Bi1x3s8NFDlQNePCRWO/d6HX8sQ5GpsPcX+e+4FSByYClj3s3ghULjbR/2aP3gwxxF3z
         2N768Bt87+btuTWiVAhHFVr+OND7TBQO6js4gK0ykLEDfqeGm9mYZf6FKmCXhOM0oqCB
         32OQ==
X-Gm-Message-State: AOJu0Yy5Hdwu6cAVLObniO5IiKS4JaSiiZTiu2x1oysL0FMOKy5u9EFO
	8g9XVm9adAGc3ouea0DOgedOscbegcybxql5dKUNYEEtpRliGKeSbWbUV7ArmsTb0Y0=
X-Gm-Gg: ASbGncsm1OT9i1tnAl/toFvi7cBah1zYTMPM/VnJ0SeBFwHaD/2oqHQ6rcbSxBLQxGG
	m74vOHR6tzNZYzkZwPkof85hhZfeal+ogAkMy5dTV6F/idoVQmoFHAuyz2KEsmFnpG5JvV8CqkE
	Jv74XV+IUA3lUUiP6wkgpq5AldYOzTtnZNCmFJYtrPL7Sf7MScVD7M2x0Zt0x3GsIwBM9Bh+aFu
	KB7ZxAGapEkSISmQard4rBhaxXVzgSYluz1PS4tlhYvFkuQU3s78d0eY0x9j4fERcQ6CUbW2nfO
	pC2/Dm8TF0sICYwk+StmPLPYweupPdk8+hMsgWqHHIfOXLVUuQWyXWuWrd+Jr2eplPe5ukVur0G
	8kQzMlOzXYQk8hhDjzxCz7DUuwHylB7podlc=
X-Google-Smtp-Source: AGHT+IFNQjCMGC+87ag7PggR5a5KN6bdjVRcXDLEo4UUQo2z0AkyH6XXKVmMTU3XkSVRnw6bWG5vmA==
X-Received: by 2002:a05:6000:2486:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3a6d12fb300mr1664987f8f.9.1750412396924;
        Fri, 20 Jun 2025 02:39:56 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:39:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Lampis <kevin.lampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/5] livepatch: Embed public key in Xen
Message-ID: <aFUsaySlHs4ymmtB@macbook.local>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-3-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602133639.2871212-3-ross.lagerwall@citrix.com>

On Mon, Jun 02, 2025 at 02:36:34PM +0100, Ross Lagerwall wrote:
> From: Kevin Lampis <kevin.lampis@cloud.com>
> 
> Make it possible to embed a public key in Xen to be used when verifying
> live patch payloads. Inclusion of the public key is optional.
> 
> To avoid needing to include a DER / X.509 parser in the hypervisor, the
> public key is unpacked at build time and included in a form that is
> convenient for the hypervisor to consume. This is different approach
> from that used by Linux which embeds the entire X.509 certificate and
> builds in a parser for it.
> 
> A suitable key can be created using openssl:
> 
> openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
>     -sha256 -days 3650 -nodes \
>     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
> openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> In v3:
> 
> * Drop unnecessary condition in Makefile
> * Use dashes instead of underscores
> * Drop section placement annotation on declaration
> * Clarify endianness of embedded key
> 
>  xen/common/Kconfig          | 18 +++++++++++++++++
>  xen/crypto/Makefile         | 11 ++++++++++
>  xen/include/xen/livepatch.h |  5 +++++
>  xen/tools/extract-key.py    | 40 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
>  create mode 100755 xen/tools/extract-key.py
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0951d4c2f286..74673078202a 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -472,6 +472,24 @@ config LIVEPATCH
>  
>  	  If unsure, say Y.
>  
> +config PAYLOAD_VERIFY
> +	bool "Verify signed LivePatch payloads"
> +	depends on LIVEPATCH
> +	select CRYPTO
> +	help
> +	  Verify signed LivePatch payloads using an RSA public key built
> +	  into the Xen hypervisor. Selecting this option requires a
> +	  public key in PEM format to be available for embedding during
> +	  the build.
> +
> +config PAYLOAD_VERIFY_KEY
> +	string "File name of public key used to verify payloads"
> +	default "verify_key.pem"
> +	depends on PAYLOAD_VERIFY
> +	help
> +	  The file name of an RSA public key in PEM format to be used for
> +	  verifying signed LivePatch payloads.

I think this is likely to break the randconfig testing that we do in
Gitlab CI, as randconfig could select PAYLOAD_VERIFY, but there will
be no key included, and hence the build will fail?

Ideally Gitlab CI would need to be adjusted to provide such key so the
build doesn't fail.  I think it could be provided unconditionally to
simplify the logic, if the option is not selected the file will simply
be ignored.

Thanks, Roger.

