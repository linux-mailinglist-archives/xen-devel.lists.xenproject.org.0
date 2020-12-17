Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F342DD052
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 12:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55871.97466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kprSR-0003Ej-Vn; Thu, 17 Dec 2020 11:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55871.97466; Thu, 17 Dec 2020 11:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kprSR-0003EN-SP; Thu, 17 Dec 2020 11:28:31 +0000
Received: by outflank-mailman (input) for mailman id 55871;
 Thu, 17 Dec 2020 11:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kprSP-0003EI-R7
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 11:28:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b58acd1-4d25-4eab-9f96-c6f2c4fb68cf;
 Thu, 17 Dec 2020 11:28:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53BD1AC7B;
 Thu, 17 Dec 2020 11:28:28 +0000 (UTC)
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
X-Inumbo-ID: 5b58acd1-4d25-4eab-9f96-c6f2c4fb68cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608204508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=byGWWpcSVKqbTQcQ3wglN0nxKpOX6GFjlcWDjhuWRCA=;
	b=BMHSblRqwWT0JsPaZVrZ2j9yy9Hx0qq2aeixNTEDjjapT64dHfmakiSrqsKS3stIC0wsQP
	7xOAnXfF5JSwEXlJt3Ps64zSudxtCE8JDoOGcLwPNvXLMupYvyZ/cW8V9MnGX79WMc1n6a
	59MzIOcbm6vqZEKFV6RWem122261rU8=
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
Date: Thu, 17 Dec 2020 12:28:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209160956.32456-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:09, Juergen Gross wrote:
> +static const struct hypfs_entry *hypfs_dyndir_enter(
> +    const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_get_dyndata();
> +
> +    /* Use template with original enter function. */
> +    return data->template->e.funcs->enter(&data->template->e);
> +}

At the example of this (applies to other uses as well): I realize
hypfs_get_dyndata() asserts that the pointer is non-NULL, but
according to the bottom of ./CODING_STYLE this may not be enough
when considering the implications of a NULL deref in the context
of a PV guest. Even this living behind a sysctl doesn't really
help, both because via XSM not fully privileged domains can be
granted access, and because speculation may still occur all the
way into here. (I'll send a patch to address the latter aspect in
a few minutes.) While likely we have numerous existing examples
with similar problems, I guess in new code we'd better be as
defensive as possible.

> +/*
> + * Fill dyndata with a dynamically generated directory based on a template
> + * and a numerical id.
> + * Needs to be kept in sync with hypfs_read_dyndir_id_entry() regarding the
> + * name generated.
> + */
> +struct hypfs_entry *hypfs_gen_dyndir_id_entry(
> +    const struct hypfs_entry_dir *template, unsigned int id, void *data)
> +{

s/directory/entry/ in the comment (and as a I realize only now
then also for hypfs_read_dyndir_id_entry())?

Jan

