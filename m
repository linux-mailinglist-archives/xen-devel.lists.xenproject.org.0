Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CA49B842
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260493.450058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCONF-0008MU-An; Tue, 25 Jan 2022 16:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260493.450058; Tue, 25 Jan 2022 16:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCONF-0008Jt-7Q; Tue, 25 Jan 2022 16:08:49 +0000
Received: by outflank-mailman (input) for mailman id 260493;
 Tue, 25 Jan 2022 16:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOP7=SJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nCOND-0008Jd-00
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:08:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1162ce28-7df9-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 17:08:45 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1643126915011486.55772157056833;
 Tue, 25 Jan 2022 08:08:35 -0800 (PST)
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
X-Inumbo-ID: 1162ce28-7df9-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; t=1643126918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IXeBYZAEWhLY3coZyNZ0QvqW/kwF9Byz/bclz+pM4+mzpuapctzwKACtv10CG2XochnUVm/nx3zLJAe8gF47N50FdEzo2Xz1oV/oRvw7/MALwfkfG8jpK03lx8HOXH5aHj/B5sSJ5EeuR2FU50qJdg6ybtV3fXVw5d2v8sULlkM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643126918; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=94fqOvepo5IyQQXC/srzO3iqvJ3EM8wAwRgEsi+4mcQ=; 
	b=kh2jvWCjzE7Xp5T35RUQyp0DHjlLDPhU+B8WeQ17yrBiYu0fv80Utd5X8z4i8js7IGqovnApJwhrf8ZZJ4c7WxeXymsy8CK9Mf0G0+tc0qeaiR4pV/FiIEYiC0l1uiqUZgCdyjA6Wfzqf/RehSX69FPlH2FIAR8/LTOQ/dZAykA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643126918;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=94fqOvepo5IyQQXC/srzO3iqvJ3EM8wAwRgEsi+4mcQ=;
	b=L1X3j43+4RMfMwlOHocol2VhESpQF1/+gSR1OkCy4uZ8tEyko5DddyYJMdieSeBN
	baG/JpKcZzRPmuc19Bp574Ob9BKYHrGMPPOe7PUIRKrtMvvXdxI5hqkPXVXBpI1zDwd
	j+VOShAqo4kOmCfH5AJ/Ra3FJdHbbnNm5E1Jie9M=
Message-ID: <ab1e3770-f682-5103-88fc-2d2be2975701@apertussolutions.com>
Date: Tue, 25 Jan 2022 11:06:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 05/30] build: prepare to always invoke $(MAKE) from
 xen/, use $(obj)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-6-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220125110103.3527686-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/25/22 06:00, Anthony PERARD wrote:
> In a future patch, when building a subdirectory, we will set
> "obj=$subdir" rather than change directory.
> 
> Before that, we add "$(obj)" and "$(src)" in as many places as
> possible where we will need to know which subdirectory is been built.
> "$(obj)" is for files been generated during the build, and "$(src)" is
> for files present in the source tree.
> 
> For now, we set both to "." in Rules.mk and Makefile.clean.
> 
> A few places don't tolerate the addition of "./", this is because make
> remove the leading "./" in targets and dependencies in rules, so these
> will be change later.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> 
> Notes:
>     v8:
>     - acked
>     - rebased
> 
>  xen/Rules.mk                            |  5 ++-
>  xen/arch/arm/Makefile                   | 14 ++++----
>  xen/arch/x86/Makefile                   | 48 ++++++++++++-------------
>  xen/arch/x86/boot/Makefile              | 14 ++++----
>  xen/arch/x86/efi/Makefile               |  6 ++--
>  xen/common/Makefile                     |  8 ++---
>  xen/common/libelf/Makefile              |  4 +--
>  xen/common/libfdt/Makefile              |  6 ++--
>  xen/include/Makefile                    | 44 +++++++++++------------
>  xen/scripts/Makefile.clean              |  5 ++-
>  xen/xsm/flask/Makefile                  | 36 +++++++++----------
>  xen/xsm/flask/policy/mkaccess_vector.sh |  7 ++--
>  12 files changed, 103 insertions(+), 94 deletions(-)
> 

<snip/>

> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 11c530dcf458..51fd37f6c4d5 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -4,46 +4,46 @@ obj-y += flask_op.o
>  
>  obj-y += ss/
>  
> -CFLAGS-y += -I./include
> +CFLAGS-y += -I$(obj)/include
>  
>  AWK = awk
>  
> -FLASK_H_DEPEND = policy/security_classes policy/initial_sids
> -AV_H_DEPEND = policy/access_vectors
> +FLASK_H_DEPEND := $(addprefix $(src)/policy/,security_classes initial_sids)
> +AV_H_DEPEND = $(src)/policy/access_vectors
>  
> -FLASK_H_FILES = include/flask.h include/class_to_string.h include/initial_sid_to_string.h
> -AV_H_FILES = include/av_perm_to_string.h include/av_permissions.h
> -ALL_H_FILES = $(FLASK_H_FILES) $(AV_H_FILES)
> +FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
> +AV_H_FILES := av_perm_to_string.h av_permissions.h
> +ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
>  
> -$(obj-y) ss/built_in.o: $(ALL_H_FILES)
> +$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
>  extra-y += $(ALL_H_FILES)
>  
> -mkflask := policy/mkflask.sh
> +mkflask := $(src)/policy/mkflask.sh
>  quiet_cmd_mkflask = MKFLASK $@
> -cmd_mkflask = $(SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
> +cmd_mkflask = $(SHELL) $(mkflask) $(AWK) $(obj)/include $(FLASK_H_DEPEND)
>  
> -$(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
> +$(addprefix $(obj)/%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
>  	$(call if_changed,mkflask)
>  
> -mkaccess := policy/mkaccess_vector.sh
> +mkaccess := $(src)/policy/mkaccess_vector.sh
>  quiet_cmd_mkaccess = MKACCESS VECTOR $@
> -cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
> +cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(obj)/include $(AV_H_DEPEND)
>  
> -$(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
> +$(addprefix $(obj)/%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
>  	$(call if_changed,mkaccess)
>  
>  obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
> -flask-policy.o: policy.bin
> +$(obj)/flask-policy.o: $(obj)/policy.bin
>  
> -flask-policy.S: BINFILE_FLAGS := -i
> -flask-policy.S: $(BASEDIR)/tools/binfile FORCE
> -	$(call if_changed,binfile,policy.bin xsm_flask_init_policy)
> +$(obj)/flask-policy.S: BINFILE_FLAGS := -i
> +$(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
> +	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
>  targets += flask-policy.S
>  
>  FLASK_BUILD_DIR := $(CURDIR)
>  POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
>  
> -policy.bin: FORCE
> +$(obj)/policy.bin: FORCE
>  	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
>  	        -C $(XEN_ROOT)/tools/flask/policy \
>  	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
> diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
> index 942ede4713f1..ad9772193bff 100755
> --- a/xen/xsm/flask/policy/mkaccess_vector.sh
> +++ b/xen/xsm/flask/policy/mkaccess_vector.sh
> @@ -8,9 +8,12 @@ set -e
>  awk=$1
>  shift
>  
> +output_dir=$1
> +shift
> +
>  # output files
> -av_permissions="include/av_permissions.h"
> -av_perm_to_string="include/av_perm_to_string.h"
> +av_permissions="$output_dir/av_permissions.h"
> +av_perm_to_string="$output_dir/av_perm_to_string.h"
>  
>  cat $* | $awk "
>  BEGIN	{

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

