Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB81D477018
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247883.427486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxomD-0006X6-2R; Thu, 16 Dec 2021 11:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247883.427486; Thu, 16 Dec 2021 11:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxomC-0006Ut-Va; Thu, 16 Dec 2021 11:18:20 +0000
Received: by outflank-mailman (input) for mailman id 247883;
 Thu, 16 Dec 2021 11:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxomB-0006Uf-Jj
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:18:19 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de41b533-5e61-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 12:18:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44406)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxom1-000MFY-01 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 11:18:09 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id AC7B51FAC8;
 Thu, 16 Dec 2021 11:18:08 +0000 (GMT)
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
X-Inumbo-ID: de41b533-5e61-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f8709d9b-cda0-323d-4e06-dc21ee3093c5@srcf.net>
Date: Thu, 16 Dec 2021 11:18:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-35-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [XEN PATCH v8 34/47] build: add %.E targets
In-Reply-To: <20211125134006.1076646-35-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2021 13:39, Anthony PERARD wrote:
> I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/Makefile | 4 ++--
>  xen/Rules.mk | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/xen/Makefile b/xen/Makefile
> index 995815e82235..e39a6f82859a 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -609,10 +609,10 @@ cscope:
>  _MAP:
>  	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
>  
> -%.o %.i %.s: %.c tools_fixdep FORCE
> +%.o %.i %.s %.E: %.c tools_fixdep FORCE
>  	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)

So what I hadn't realised when asking was that Linux calls this .i and
we've already got support for what I wanted.  Sorry :)

Thus, I suspect we probably don't want to take an extra %.E alias to the
existing %.i, although...

>  
> -%.o %.s: %.S tools_fixdep FORCE
> +%.o %.s %.E: %.S tools_fixdep FORCE
>  	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)
>  
>  %/: tools_fixdep FORCE
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 73d5b82ab2e7..745d892d0707 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -287,6 +287,11 @@ $(obj)/%.s: $(src)/%.c FORCE
>  $(obj)/%.s: $(src)/%.S FORCE
>  	$(call if_changed_dep,cpp_s_S)
>  
> +$(obj)/%.E: $(src)/%.c FORCE
> +	$(call if_changed_dep,cpp_i_c)
> +$(obj)/%.E: $(src)/%.S FORCE
> +	$(call if_changed_dep,cpp_s_S)

... I don't currently see support for %.i from %.S in the tree.  That
one probably would be useful to introduce.

~Andrew

> +
>  # Linker scripts, .lds.S -> .lds
>  quiet_cmd_cpp_lds_S = LDS     $@
>  cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<


