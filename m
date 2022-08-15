Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D23592E3A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387300.623483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYLJ-0007k6-IO; Mon, 15 Aug 2022 11:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387300.623483; Mon, 15 Aug 2022 11:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYLJ-0007hB-Eu; Mon, 15 Aug 2022 11:33:13 +0000
Received: by outflank-mailman (input) for mailman id 387300;
 Mon, 15 Aug 2022 11:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dVr3=YT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oNYLI-0007h3-JV
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:33:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09954e79-1c8e-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 13:33:10 +0200 (CEST)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1660563183208163.51664345215397;
 Mon, 15 Aug 2022 04:33:03 -0700 (PDT)
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
X-Inumbo-ID: 09954e79-1c8e-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1660563186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a2pVrLGVeiGWDPs13TpvQqBJ0Oe+WGErb72Nsnzn17fQEqnoeqeE/sdz/gdtAp68FAeSDmvLX+x/jTMnkQcM5cZ5xljXBlVR5dZvcgFvBSwfW60itCJ8uZuFg561fZQEZ1HvilEe59WR0wNSdCwjhraW35jXIa8y2O2qOqMBKcQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660563186; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=soCfa/IHePpPuZ2nlzbzb1s7QwWxzLT8lyTnUAFPN1w=; 
	b=E/RpLTJGWNc0GqCC+ToIOsL6a4g/hU+aixz0yfqAw5XLsFXxyAfFJiLl6vZO4j4hnEyJm/DlZwodfoa3IDVNHk+zIeOscudzPwmSCXMV4IsivjUSMrMQDb9QJB3zRzcq15Eeb+CPozXX274iCcQ2UD04R9Y81nXGtIy1OejKzDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660563186;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=soCfa/IHePpPuZ2nlzbzb1s7QwWxzLT8lyTnUAFPN1w=;
	b=XZzlsFPkQx2cT5Vk0hC1r9Vql7xvy/nYRU8WrKnRNqKz57PF9ayGVBLdWLKjMyWo
	KikrdIUijGEGqmeXWm1WIcUFHLkOllPjJ3C+92ltD+SfWj8DnQGigTRwEdqYM3cYMpU
	UFs8tQNqEH8Mr8MzPhHtKFOBZUmNk6GPPXh60g/I=
Message-ID: <89b2c8d6-e614-e819-4f4e-40bcf36a56f4@apertussolutions.com>
Date: Mon, 15 Aug 2022 07:31:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [XEN PATCH v4 11/32] tools/flask/utils: list build targets in
 $(TARGETS)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-12-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220811164845.38083-12-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/11/22 12:48, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
>   tools/flask/utils/Makefile | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/flask/utils/Makefile b/tools/flask/utils/Makefile
> index db567b13dc..6be134142a 100644
> --- a/tools/flask/utils/Makefile
> +++ b/tools/flask/utils/Makefile
> @@ -4,10 +4,10 @@ include $(XEN_ROOT)/tools/Rules.mk
>   CFLAGS += -Werror
>   CFLAGS += $(CFLAGS_libxenctrl)
>   
> -CLIENTS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
> +TARGETS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
>   
>   .PHONY: all
> -all: $(CLIENTS)
> +all: $(TARGETS)
>   
>   flask-loadpolicy: loadpolicy.o
>   	$(CC) $(LDFLAGS) $< $(LDLIBS) $(LDLIBS_libxenctrl) -o $@
> @@ -29,7 +29,7 @@ flask-set-bool: set-bool.o
>   
>   .PHONY: clean
>   clean:
> -	$(RM) *.o $(CLIENTS) $(DEPS_RM)
> +	$(RM) *.o $(TARGETS) $(DEPS_RM)
>   
>   .PHONY: distclean
>   distclean: clean
> @@ -37,10 +37,10 @@ distclean: clean
>   .PHONY: install
>   install: all
>   	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
> -	$(INSTALL_PROG) $(CLIENTS) $(DESTDIR)$(sbindir)
> +	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(sbindir)
>   
>   .PHONY: uninstall
>   uninstall:
> -	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(CLIENTS))
> +	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(TARGETS))
>   
>   -include $(DEPS_INCLUDE)

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

