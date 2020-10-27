Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C229A954
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 11:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12740.33009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXM1P-0006n9-DU; Tue, 27 Oct 2020 10:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12740.33009; Tue, 27 Oct 2020 10:16:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXM1P-0006mk-9t; Tue, 27 Oct 2020 10:16:07 +0000
Received: by outflank-mailman (input) for mailman id 12740;
 Tue, 27 Oct 2020 10:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXM1O-0006mf-7q
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:16:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 126356f5-4a59-4741-9e19-b6145b081e87;
 Tue, 27 Oct 2020 10:16:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90BEFAC3F;
 Tue, 27 Oct 2020 10:16:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXM1O-0006mf-7q
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:16:06 +0000
X-Inumbo-ID: 126356f5-4a59-4741-9e19-b6145b081e87
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 126356f5-4a59-4741-9e19-b6145b081e87;
	Tue, 27 Oct 2020 10:16:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603793764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uio1N1/bRRMGiCixJ50d+oeJQt91viHk8fB+jmT1j2A=;
	b=f0iykRrB50vPYNALhXVWYcbICEgM5Ged8dFO2K6snCSVLxB/L0+FvwxD3WrSLSFbtxps+m
	XolQ6U5YYh+T8r2wH34fH6/hRmbBhBvcpb0cl/MlzxS/InMK0yHlL9I56/gDP9ykWAcDXp
	/Hh6o9T0oPTGK3K2HEUEBUPNWNyfVfU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90BEFAC3F;
	Tue, 27 Oct 2020 10:16:04 +0000 (UTC)
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
To: Olaf Hering <olaf@aepfle.de>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201026204151.23459-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
Date: Tue, 27 Oct 2020 11:16:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026204151.23459-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 21:41, Olaf Hering wrote:
> Use a temporay file, and move it in place once done.
> The same pattern exists already for other dependencies.

This pattern is used when a rule consists of multiple commands
having their output appended to one another's. This isn't the
case here, so I'm afraid I'd like it to be made more obvious
what the gain / improvement is. That is - I don't mind the
change, if indeed it is for a good reason.

Jan

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/libacpi/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
> index c17f3924cc..2cc4cc585b 100644
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -43,7 +43,8 @@ all: $(C_SRC) $(H_SRC)
>  
>  $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl iasl
>  	iasl -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
> -	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@
> +	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@.$(TMP_SUFFIX)
> +	mv -f $@.$(TMP_SUFFIX) $@
>  	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
>   
>  $(MK_DSDT): mk_dsdt.c
> 


