Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E5349B84A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260505.450113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOQn-0003cA-04; Tue, 25 Jan 2022 16:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260505.450113; Tue, 25 Jan 2022 16:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOQm-0003Zw-SZ; Tue, 25 Jan 2022 16:12:28 +0000
Received: by outflank-mailman (input) for mailman id 260505;
 Tue, 25 Jan 2022 16:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOP7=SJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nCOQm-0003Zm-8O
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:12:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96023266-7df9-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 17:12:27 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1643127130253802.1977210405523;
 Tue, 25 Jan 2022 08:12:10 -0800 (PST)
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
X-Inumbo-ID: 96023266-7df9-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; t=1643127131; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YeGQyUQqDwo2SyhAUsIQvWOAYbhRNxhRKU8jbwUosZunKEY6umkI5Jcs0ykSq0XxA0wgQEbv1kXjfffLGm1duTHR1idnIHWY3/5hdDyJZOu++CDM/1hFgfPunkfAFn/3bRzqLksNI0A/QruJUTMJZsmWJBc1zfV+rs9gUJkH7Rg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643127131; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=a+oPP2M7d6P3zr6pbFs2njrmeT1J0gwDJU7cTXHyolY=; 
	b=AaDkWlTShoIXqOCCQ5evmyYzB1DnWOfZkunmccS2oMQB+sS8vjxEiTBo9TB66Y4GZY/E3uVuSR3cSqnLPK5sslUnTxYMEYZeApsxbeGv6b9K9XBMyKBYfNYaDtIBgLhRNiHjrIabKlXyKbvJWLH3+vI/7tXnYvrki/qVBCRwe6Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643127131;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=a+oPP2M7d6P3zr6pbFs2njrmeT1J0gwDJU7cTXHyolY=;
	b=WuKPYwXloA1NQguNNMViP50ZGhvo5II9qxszXqj+mJIGRDkyuzq2QPNysKoSSboP
	5llXP3PcF6kUzDLR/onNhHQLCCv2gDkngvX6YdZYvqazI4ZhZiOuGIAV7V0QrP75npz
	Qf7tNBwPiAGGuRb0siYzrcODa+CpmJlJUEgXABXg=
Message-ID: <2eddfe83-38fc-6309-25b3-ea943ddfe274@apertussolutions.com>
Date: Tue, 25 Jan 2022 11:10:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 26/30] build: replace $(BASEDIR) and use $(srctree)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-27-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220125110103.3527686-27-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/25/22 06:00, Anthony PERARD wrote:
> $(srctree) is a better description for the source directory than
> $(BASEDIR) that has been used for both source and build directory
> (which where the same).
> 
> This adds $(srctree) to a few path where make's VPATH=$(srctree) won't
> apply. And replace $(BASEDIR) by $(srctree).
> 
> Introduce "$(srcdir)" as a shortcut for "$(srctree)/$(src)" as the
> later is used often enough.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> Notes:
>     v9:
>     - acked
>     - reword "# shortcut for $(srctree)/$(src)" into "# shortcuts" in both
>       places.
>     
>     v8:
>     - merge of two patchs from v7:
>         build: add $(srctree) in few key places
>         build: replace $(BASEDIR) by $(srctree)
>       both patch were acked
>     - introduce $(srcdir) as a shortcut for $(srctree)/$(src)
> 
>  xen/Kconfig                 |  4 ++--
>  xen/Makefile                |  7 +++----
>  xen/Rules.mk                |  9 ++++++---
>  xen/arch/x86/arch.mk        |  2 +-
>  xen/build.mk                |  4 ++--
>  xen/common/Makefile         |  2 +-
>  xen/common/libfdt/Makefile  |  2 +-
>  xen/include/Makefile        | 14 +++++++-------
>  xen/scripts/Kconfig.include |  2 +-
>  xen/scripts/Makefile.clean  |  5 ++++-
>  xen/xsm/flask/Makefile      | 10 +++++-----
>  11 files changed, 33 insertions(+), 28 deletions(-)

<snip/>

> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 4ac6fb8778ae..a99038cb5722 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -8,8 +8,8 @@ CFLAGS-y += -I$(obj)/include
>  
>  AWK = awk
>  
> -FLASK_H_DEPEND := $(addprefix $(src)/policy/,security_classes initial_sids)
> -AV_H_DEPEND = $(src)/policy/access_vectors
> +FLASK_H_DEPEND := $(addprefix $(srcdir)/policy/,security_classes initial_sids)
> +AV_H_DEPEND := $(srcdir)/policy/access_vectors
>  
>  FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
>  AV_H_FILES := av_perm_to_string.h av_permissions.h
> @@ -18,14 +18,14 @@ ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
>  $(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
>  extra-y += $(ALL_H_FILES)
>  
> -mkflask := $(src)/policy/mkflask.sh
> +mkflask := $(srcdir)/policy/mkflask.sh
>  quiet_cmd_mkflask = MKFLASK $@
>  cmd_mkflask = $(SHELL) $(mkflask) $(AWK) $(obj)/include $(FLASK_H_DEPEND)
>  
>  $(addprefix $(obj)/%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
>  	$(call if_changed,mkflask)
>  
> -mkaccess := $(src)/policy/mkaccess_vector.sh
> +mkaccess := $(srcdir)/policy/mkaccess_vector.sh
>  quiet_cmd_mkaccess = MKACCESS VECTOR $@
>  cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(obj)/include $(AV_H_DEPEND)
>  
> @@ -36,7 +36,7 @@ obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
>  $(obj)/flask-policy.o: $(obj)/policy.bin
>  
>  $(obj)/flask-policy.S: BINFILE_FLAGS := -i
> -$(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
> +$(obj)/flask-policy.S: $(srctree)/tools/binfile FORCE
>  	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
>  targets += flask-policy.S
>  

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

