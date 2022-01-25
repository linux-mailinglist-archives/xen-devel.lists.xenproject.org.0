Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B489649B845
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260500.450091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOPJ-0002EF-DC; Tue, 25 Jan 2022 16:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260500.450091; Tue, 25 Jan 2022 16:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOPJ-0002CK-9J; Tue, 25 Jan 2022 16:10:57 +0000
Received: by outflank-mailman (input) for mailman id 260500;
 Tue, 25 Jan 2022 16:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOP7=SJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nCOPI-00025R-3i
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:10:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1881ee-7df9-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 17:10:55 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1643127040607112.68892910086618;
 Tue, 25 Jan 2022 08:10:40 -0800 (PST)
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
X-Inumbo-ID: 5f1881ee-7df9-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; t=1643127046; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JuhxPL1c0ug3Pn1e7HmzlDJkAHjFnIpHj8HthOoeqmM73B8o93ZhEYaoQ+lUsjCDd4+g2+C+f0m/nZrMg4qGbYo36HSsrPphEpJY4lOPYlsLwRpPy/gGmLsGZKUaOlfLz3lV5iHHfjCl5OBd5YsMMYHGki98OvVlndKHu07wF9s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643127046; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=CvBj2eJDqp5R/1SQGRb09Go2e1vHAg9XdBzTdm+iBJY=; 
	b=cvbb3iFIoQTl/OIOZ5pHl+u4wysILgBfDg0Suc5ykGAS+DFe0+qjdiPjNUdoDho3G77w8414mPW5C+Yj4I7CgGmxmleyRB0sPw+q3+UQ6o1YvTgP+D/vQz1YpavcdKRPsoga851F+kw8WexjkVHV8RnMIiV2TG4wfa0QrvRVX6Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643127046;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CvBj2eJDqp5R/1SQGRb09Go2e1vHAg9XdBzTdm+iBJY=;
	b=b0K+zL/Wx9p0lR7+I8V1gUNkGESaZypdMmw5en9zVSa2NyGGqEca7qJtyHqRP8HL
	0WSqAjySkLvxm86Zs3T4kTbx/6VTnMwQeWbL2ep8+6rWUYuyq/fwvDMHK00+oZkwxGo
	T0bA0yagt+7YkMIXaTk8drgG4oYxRuPb5tlfMfwY=
Message-ID: <1045d27a-0368-8190-e707-85addaab7d1f@apertussolutions.com>
Date: Tue, 25 Jan 2022 11:09:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 19/30] build: clean-up "clean" rules of duplication
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-20-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220125110103.3527686-20-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/25/22 06:00, Anthony PERARD wrote:
> All those files to be removed are already done in the main Makefile,
> either by the "find" command or directly (for $(TARGET).efi).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/Makefile                | 2 +-
>  xen/arch/arm/Makefile       | 1 -
>  xen/arch/x86/Makefile       | 5 ++---
>  xen/test/livepatch/Makefile | 2 +-
>  xen/xsm/flask/Makefile      | 2 +-
>  5 files changed, 5 insertions(+), 7 deletions(-)
> 

<snip/>

> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 49cf730cf098..832f65274cc0 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -51,4 +51,4 @@ $(obj)/policy.bin: FORCE
>  
>  .PHONY: clean
>  clean::
> -	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC) flask-policy.S
> +	rm -f $(ALL_H_FILES) policy.* $(POLICY_SRC) flask-policy.S


Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

