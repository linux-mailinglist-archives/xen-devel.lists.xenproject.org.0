Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E249C49B848
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260503.450102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOQ6-0002zZ-NK; Tue, 25 Jan 2022 16:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260503.450102; Tue, 25 Jan 2022 16:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOQ6-0002wT-Iu; Tue, 25 Jan 2022 16:11:46 +0000
Received: by outflank-mailman (input) for mailman id 260503;
 Tue, 25 Jan 2022 16:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOP7=SJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nCOQ5-0002wJ-1B
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:11:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bdc26a5-7df9-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 17:11:43 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1643127081555803.0574614939743;
 Tue, 25 Jan 2022 08:11:21 -0800 (PST)
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
X-Inumbo-ID: 7bdc26a5-7df9-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; t=1643127082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zr3EKKWYToeXoovYPLf+P0yQEaDq0COZNSewksddLzWVWg50E+UwMuKSpfKtOdn9crQqsXfQZkv3jYuH6v2ryiHE15PJEZprmDGY7awsN9kWngtwK9Tr8DDra9hQhO6/e5dvwIBy+cDTxt08hXLVCmJg7b5YJ1cYQWWj8zm5aRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643127082; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=VSWs1JVcA5s3mEv8Rp+wZYLf3DeH5t+xxTNGZ+GRRrI=; 
	b=K1Ohr0NkJfDrfV6VuFIdoNdlimeMVDhad+NccSZq+RhaiCIbbAUGdtC5UPulHbJta/+jPm3JgOwYHrXwtOLVMiRLWYPZKdRNb9i1MQob/Asx0/ZqD2S+qCumBLOSAnGNDqtbHLdA7LPoj3N9qHflqH+rW3eGQgsk2CBzAvbP0lU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643127082;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VSWs1JVcA5s3mEv8Rp+wZYLf3DeH5t+xxTNGZ+GRRrI=;
	b=rccVaEgoPiEeXJsu+raALZsDc78Pos1X6sFQS7OnMZ7ahc6v8a5jRbNmTapABLq/
	S2Z5ZrE+BiGnCHQ3/8smAAV8ProYAsk15oDvhgGuNOXvY0qFFuICSIl43tc9oaEB0y1
	2+focvCMiT/8fPOwaCtq8vcSV6hvf8KeHnZlQmmE=
Message-ID: <e4470398-cea9-6747-a85e-8a041d28849b@apertussolutions.com>
Date: Tue, 25 Jan 2022 11:09:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 20/30] build: rework "clean" to clean from the root
 dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-21-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220125110103.3527686-21-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/25/22 06:00, Anthony PERARD wrote:
> This will allow "clean" to work from an out-of-tree build when
> it will be available.
> 
> Some of the file been removed in current "clean" target aren't added
> to $(clean-files) because they are already listed in $(extra-) or
> $(extra-y).
> 
> Also start to clean files listed in $(targets). This allows to clean
> "common/config_data.S" and "xsm/flask/flask-policy.S" without
> having to list them a second time.
> 
> Also clean files in "arch/x86/boot" from that directory by allowing
> "clean" to descend into the subdir by adding "boot" into $(subdir-).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> Notes:
>     v9:
>     - reviewed
>     
>     v8:
>     - fix comment for the shorthand
>     - move this patch earlier in the series
>     - replace some BASEDIR by objtree
>     - start to clean $(targets) files.
> 
>  xen/Makefile                | 24 ++++++++++++------------
>  xen/arch/arm/Makefile       |  5 +----
>  xen/arch/x86/Makefile       | 20 ++++++++++++--------
>  xen/arch/x86/boot/Makefile  |  2 ++
>  xen/common/Makefile         |  3 +--
>  xen/include/Makefile        |  4 +---
>  xen/scripts/Kbuild.include  |  4 ++--
>  xen/scripts/Makefile.clean  | 14 +++++++++++---
>  xen/test/livepatch/Makefile |  4 +---
>  xen/xsm/flask/Makefile      |  4 +---
>  10 files changed, 44 insertions(+), 40 deletions(-)
> 

<snip/>

> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 832f65274cc0..4ac6fb8778ae 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -49,6 +49,4 @@ $(obj)/policy.bin: FORCE
>  	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
>  	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
>  
> -.PHONY: clean
> -clean::
> -	rm -f $(ALL_H_FILES) policy.* $(POLICY_SRC) flask-policy.S
> +clean-files := policy.* $(POLICY_SRC)

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

