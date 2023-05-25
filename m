Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE8D710C5A
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539573.840590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AOj-00031V-7C; Thu, 25 May 2023 12:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539573.840590; Thu, 25 May 2023 12:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AOj-0002yW-4c; Thu, 25 May 2023 12:48:53 +0000
Received: by outflank-mailman (input) for mailman id 539573;
 Thu, 25 May 2023 12:48:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVPt=BO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q2AOg-0002yP-Rr
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:48:51 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d188d59-fafa-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 14:48:48 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1685018921909599.6999728037861;
 Thu, 25 May 2023 05:48:41 -0700 (PDT)
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
X-Inumbo-ID: 7d188d59-fafa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685018924; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OC+iVi66v4ZUQXOXjJZxV/Tc03LQTONsmQ1C349Vu/XXeVKWAFiyhctPyHbWUwRZSEBmnENJcQ8d4AWHqOLuhGZDPpwG/apGCC4pr6XX0rVQvockVUJdSErqeXYmT/xi1Dw8sLbKBzvP3jfgwJtqwC3TT/eGRpDdKWNNcBH2+M0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685018924; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Nrwi7EB3kUI4MvvcpNAWEhE0/2/LrdcYBPX8lCg0UDk=; 
	b=i2d5rnJBVDO1KUnpAVEO0PG1jNzqTeGs7vpodMbv7GSzDtT8+np0cca9+gSRnZnCBkND7pa75xibsp4TORm0/ddjsUQ+ThUVYty13zATEdOkgICKwiAJW18Q8NEgj3gtkv56wBFzPdQPbuqx5UgA5OHbRsfH7WD046OiWaU6ovM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685018924;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Nrwi7EB3kUI4MvvcpNAWEhE0/2/LrdcYBPX8lCg0UDk=;
	b=Zni2iwAzrNCF70ioCahNknfgiThAAFYXUkseqPsNQDVO3oHL8NtdDlwrTjxGc6GD
	lhJT05x1377giKk+Z7LqCekofbigv5s7X2CdLlV6aGDXB6aVVl0DfaLM52cbCC1Fmio
	hTwEV0c18XhacHJc6kbO5HjurdJvibWH+6kmZhpE=
Message-ID: <48aa8d36-7f70-0223-db09-f966aaffdca8@apertussolutions.com>
Date: Thu, 25 May 2023 08:48:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN PATCH 04/15] build: hide policy.bin commands
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-5-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230523163811.30792-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/23/23 12:38, Anthony PERARD wrote:
> Instead, show only when "policy.bin" is been updated.
> 
> We still have the full command from the flask/policy Makefile, but we
> can't change that Makefile.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   xen/xsm/flask/Makefile | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 3fdcf7727e..fc44ad684f 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -48,10 +48,15 @@ targets += flask-policy.S
>   FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
>   POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
>   
> +policy_chk = \
> +    $(Q)if ! cmp -s $(POLICY_SRC) $@; then \
> +        $(kecho) '  UPD     $@'; \
> +        cp $(POLICY_SRC) $@; \
> +    fi
>   $(obj)/policy.bin: FORCE
> -	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
> +	$(Q)$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
>   	        -C $(XEN_ROOT)/tools/flask/policy \
>   	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
> -	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
> +	$(call policy_chk)
>   
>   clean-files := policy.* $(POLICY_SRC)

Outside the suggestion and nit(s) from Jan, all else looks good to me.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

