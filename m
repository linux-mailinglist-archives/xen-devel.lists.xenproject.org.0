Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93137378C69
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 14:44:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125197.235669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5FT-0001SO-6b; Mon, 10 May 2021 12:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125197.235669; Mon, 10 May 2021 12:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5FT-0001PV-3e; Mon, 10 May 2021 12:42:59 +0000
Received: by outflank-mailman (input) for mailman id 125197;
 Mon, 10 May 2021 12:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Mbt=KF=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lg5FS-0001PP-09
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 12:42:58 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 202f170b-23c6-4785-9eb0-68fe58095d52;
 Mon, 10 May 2021 12:42:57 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1620650572040854.0141297689187;
 Mon, 10 May 2021 05:42:52 -0700 (PDT)
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
X-Inumbo-ID: 202f170b-23c6-4785-9eb0-68fe58095d52
ARC-Seal: i=1; a=rsa-sha256; t=1620650574; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CSNlFklawnHPee4lwxWi5eOyYhZNgpKheczdfGvyoP9x4cTB0bvxGgsw7GVu2sBBgNDHA59iTzU3Gv6cJVEEtb3ieYDIuy0s7seZqsYU7Yh96JDJDHSBhDnpe1bR/sEhhDnfE46p2BIKgHl3wfdWrN7x/usMedQl/yWjRxy5NI4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1620650574; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JrtRtYTziMVBkc25lrmbzpeFMiZIj4YEO43pv7WHuuQ=; 
	b=ZxXBJ/U9+OXhyfFm0aaRRFmWn+NKIAVg7Wh0NTPKMZDW/OQX1BAxFRO7FsRXH0SgMc5XcAYLRXrsCQgT1Esj2V1Et1dWlAGWVJAOgFn7tRjL9WaGN6NspUZo164Zd5jRu4t9UMnG9qwwMpd9SstRCf/ZZivmQO3RN68EI74zw/c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620650574;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JrtRtYTziMVBkc25lrmbzpeFMiZIj4YEO43pv7WHuuQ=;
	b=EMma8h59ICjDj+NIvmY2AB4N7yOT4swZw2L+quVLcKIkA6imRVfh0GbqzTD3Dk8m
	IbTwTfXua4RNm1BZwV4PKYjIiXB4uZv0X84pqoj0PaLlDA4VMjvFGWOJFnuvF7zcv3w
	kyDaE+KggWEj89yejz4t1vyuzyhwKaEyYnbsDoY0=
Subject: Re: [PATCH v2 08/13] vtpmmgr: Shutdown more gracefully
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Samuel Thibault <samuel.thibaut@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-9-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <bd57ee2f-2b7a-7ff8-69d6-a9275d959223@apertussolutions.com>
Date: Mon, 10 May 2021 08:42:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-9-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> vtpmmgr uses the default, weak app_shutdown, which immediately calls the
> shutdown hypercall.  This short circuits the vtpmmgr clean up logic.  We
> need to perform the clean up to actually Flush our key out of the tpm.
> 
> Setting do_shutdown is one step in that direction, but vtpmmgr will most
> likely be waiting in tpmback_req_any.  We need to call shutdown_tpmback
> to cancel the wait inside tpmback and perform the shutdown.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/vtpmmgr.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/stubdom/vtpmmgr/vtpmmgr.c b/stubdom/vtpmmgr/vtpmmgr.c
> index 9fddaa24f8..46ea018921 100644
> --- a/stubdom/vtpmmgr/vtpmmgr.c
> +++ b/stubdom/vtpmmgr/vtpmmgr.c
> @@ -67,11 +67,21 @@ int hw_is_tpm2(void)
>      return (hardware_version.hw_version == TPM2_HARDWARE) ? 1 : 0;
>  }
>  
> +static int do_shutdown;
> +
> +void app_shutdown(unsigned int reason)
> +{
> +    printk("Shutdown requested: %d\n", reason);
> +    do_shutdown = 1;
> +
> +    shutdown_tpmback();
> +}
> +
>  void main_loop(void) {
>     tpmcmd_t* tpmcmd;
>     uint8_t respbuf[TCPA_MAX_BUFFER_LENGTH];
>  
> -   while(1) {
> +   while (!do_shutdown) {
>        /* Wait for requests from a vtpm */
>        vtpmloginfo(VTPM_LOG_VTPM, "Waiting for commands from vTPM's:\n");
>        if((tpmcmd = tpmback_req_any()) == NULL) {
> 


