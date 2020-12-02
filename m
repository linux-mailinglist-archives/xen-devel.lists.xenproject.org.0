Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FC2CC114
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 16:43:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42845.77111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUHO-0001ex-Ph; Wed, 02 Dec 2020 15:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42845.77111; Wed, 02 Dec 2020 15:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUHO-0001eY-MO; Wed, 02 Dec 2020 15:42:54 +0000
Received: by outflank-mailman (input) for mailman id 42845;
 Wed, 02 Dec 2020 15:42:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkUHN-0001eT-Et
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 15:42:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0854dc01-12da-491f-b673-e1a4cd091d09;
 Wed, 02 Dec 2020 15:42:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CEA41AB7F;
 Wed,  2 Dec 2020 15:42:51 +0000 (UTC)
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
X-Inumbo-ID: 0854dc01-12da-491f-b673-e1a4cd091d09
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606923771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1aXkKaaHyUKoJj5Oe6Rs0XH7o9R1EUE9tK8pBVy7BkY=;
	b=dPOJUDYBhLc98TxAZtPAin855IzVePbD8MQHKtooagXc1+CqohePj2wwrWnOaAhCuM+qar
	b/uYXRKmb/7RxNK3Fz9ZlHE4FxBjeUTUtA8HGKUgJSTA2uJx0BaCsPNBco5s2GlvIVjQcv
	nU0LMaSQBVYAOxfcx6WbtudWlB/Oqsc=
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8a876c9-b1bf-62a4-d30c-a2c646cb68f7@suse.com>
Date: Wed, 2 Dec 2020 16:42:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-12-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> Add a getsize() function pointer to struct hypfs_funcs for being able
> to have dynamically filled entries without the need to take the hypfs
> lock each time the contents are being generated.
> 
> For directories add a findentry callback to the vector and modify
> hypfs_get_entry_rel() to use it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with maybe one further small adjustment:

> @@ -176,15 +188,41 @@ static int hypfs_get_path_user(char *buf,
>      return 0;
>  }
>  
> +struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
> +                                         const char *name,
> +                                         unsigned int name_len)
> +{
> +    return ERR_PTR(-ENOENT);
> +}

ENOENT seems odd to me here. There looks to be no counterpart to
EISDIR, so maybe ENODATA, EACCES, or EPERM?

Jan

