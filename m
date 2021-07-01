Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EFA3B95AF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149018.275444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0oj-0000ih-KE; Thu, 01 Jul 2021 17:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149018.275444; Thu, 01 Jul 2021 17:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0oj-0000fZ-Fz; Thu, 01 Jul 2021 17:49:37 +0000
Received: by outflank-mailman (input) for mailman id 149018;
 Thu, 01 Jul 2021 17:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaNF=LZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lz0oh-0000fT-UF
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:49:35 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7e92e8e-5db8-4b7d-a5e0-5679b76c1516;
 Thu, 01 Jul 2021 17:49:34 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b12so5453965pfv.6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jul 2021 10:49:34 -0700 (PDT)
Received: from ?IPv6:2602:4b:a45e:ca01::9? ([2602:4b:a45e:ca01::9])
 by smtp.gmail.com with ESMTPSA id m10sm657377pfh.62.2021.07.01.10.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:49:33 -0700 (PDT)
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
X-Inumbo-ID: e7e92e8e-5db8-4b7d-a5e0-5679b76c1516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U+W37TQ3T1y+C5Q0xHkEVJ/uCWV5n7YOCtXmRIz31uY=;
        b=jRnDwladYCmFPktuYJ+57+1jrKD8YE06vTGnV7pkX/UMK5G3bcT8TqfrJJJXb2Weqy
         RBuh2sljZadfP6HBgqhLruw+PmYKuKHhXWsD5BncdcTWQnUmS/K9T5ELezU9Z2JZDk+O
         0bLmGYloYifTymMYr/pelIlNJh/pMYQeDBvn7I5ine7GNWDSgjPpJSyLFxppdrs7da2K
         MrCPfG0nAaYd8Tv6qmn8zWktZr5wZ7irLNfR19HqyU/P32AZ4EMCAl8cPb52Z0qw6aOG
         d1kqRL9tuuoO6FcQGWMtpZXXKyZ92n/h/AjDFRTbiskmLkt5jnfPMNrA+ORuVPfH/I7+
         6kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=U+W37TQ3T1y+C5Q0xHkEVJ/uCWV5n7YOCtXmRIz31uY=;
        b=OyPuHZhwEhXo/xrB45TPjMUUAoacDj16RJOvSE57OMu9Rdny4YW0cg4553Fin4VA6K
         ZTdh2M4l4U1qjVci2IvF+KMgG1L7OIs/NwNX7I7VvA25eJZGS35ECXJDsDZHzqEJKVKg
         skDPj16fppkwBcPISHkWGqzDLSa2tx7zJTL9PNFZbJWZo+v6UMRgTNhMRuxpoKyujv9Y
         z7jAXvrlpidp/2XmvQFCaDa1B4kXiK5GeEpjFyC0VdZtjVcHH1uyTXYmmJbjGu9uP3zV
         nevVINMd3FDsSXHFRxmlkopzkp1WLOxS+UAqRVJUucwNV8hDKDTSH03DJLhqBJ9/bFrh
         F93g==
X-Gm-Message-State: AOAM530/WkelUiCQw4uNRJmVy5C7GZPSUzfBFMPpf7FBfk5IrHsS2vFA
	wIeBiGkcbymBv8Lj1nCDoVk=
X-Google-Smtp-Source: ABdhPJyORDWdcFyyra64spz9FVC6hyprvWsHXOD0m5Bwuv7ne7Q5OU+IPwzohxffdUCZNpj+bB+WoA==
X-Received: by 2002:a63:ef44:: with SMTP id c4mr753464pgk.162.1625161774060;
        Thu, 01 Jul 2021 10:49:34 -0700 (PDT)
Subject: Re: [XEN PATCH v6 29/31] build: build everything from the root dir,
 use obj=$subdir
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-30-anthony.perard@citrix.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <11c9c305-9053-e492-ecd6-c0ab22c93ed1@gmail.com>
Date: Thu, 1 Jul 2021 10:49:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210701141011.785641-30-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/1/21 7:10 AM, Anthony PERARD wrote:
> A subdirectory is now built by setting "$(obj)" instead of changing
> directory. "$(obj)" should always be set when using "Rules.mk" and
> thus a shortcut "$(build)" is introduced and should be used.
> 
> A new variable "$(need-builtin)" is introduce. It is to be used
> whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
> isn't the main target anymore, and thus only needs to depends on the
> objects that should be part of "built_in.o".
> 
> Introduce $(srctree) and $(objtree) to replace $(BASEDIR) in cases a
> relative path is better.
> 
> DEPS is updated as the existing macro to deal with it doesn't know
> about $(obj).
> 
> There's some changes in "Rules.mk" which in addition to deal with
> "$(obj)" also make it's looks more like "Makefile.build" from Linux
> v5.12.
> 
> test/Makefile doesn't need special handling in order to build
> everything under test/, Rules.mk will visit test/livepatch via
> $(subdir-y), thus "tests" "all" and "build" target are removed.
> "subtree-force-update" target isn't useful so it is removed as well.
> 
> test/livepatch/Makefile doesn't need default target anymore, Rules.mk
> will build everything in $(extra-y) and thus all *.livepatch.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>

Thanks,
Bobby

