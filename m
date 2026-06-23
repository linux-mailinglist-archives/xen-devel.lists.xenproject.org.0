Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ajc6Ee/uOmoWMAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 22:39:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0E6BA0FA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 22:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=ef7ikcWk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344492.1603533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc7se-0004jL-Hh; Tue, 23 Jun 2026 20:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344492.1603533; Tue, 23 Jun 2026 20:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc7se-0004gt-Ek; Tue, 23 Jun 2026 20:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1344492;
 Tue, 23 Jun 2026 20:37:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wc7sd-0004gn-IC
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 20:37:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc7sb-00EmbU-Jo
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 22:37:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a3aee84-bab6-0a2a0a5309dd-0a2a450a82a0-14
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 22:37:56 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a3aeea2-93a5-0a2a450a0019-888fbc3352bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 22:37:56 +0200
Received: by mx.zohomail.com with SMTPS id 1782247065615346.27250139176465;
 Tue, 23 Jun 2026 13:37:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782247068; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dHHqT/IPAjn6lt5RtvbjKROEn7Vorx/SiL3ENvDLtUJQkFtsWLnK87l9tk/n81Ne4QYf3Hv9Q8JO1fGdJ+V4POfrum/4NTXNx+oGHlymPzFJ/e/yiZcz4xzz3bNrL01/qAQlGUyRvFpTNwZjSIU7hTmOdKhMD4R/NEdTL9llZ48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782247068; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CMo1oSi6NuHwGlocOQBApwjiUoe5SibobKM/BdfaoDE=; 
	b=W1IOAf9ui+ZlAntP70VW/HpA8Hl+qoqDdjS60bopTmi9ks5Og3sWPbfvprWRW/FuW74dBiuXod4ma7wsoL1yrRDjR/1MuXdNm60eGcghAgDXztHWemQSXMeih3V5dLftaKfiSjKdc4AJXikTff8lxpZfz9HO+XUAjgK6NnuFfiw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782247068;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CMo1oSi6NuHwGlocOQBApwjiUoe5SibobKM/BdfaoDE=;
	b=ef7ikcWk7twfN4sjv4RsV42oV8kfn4j9uFKX1O4a/al2R4whLjkmKT/CF55kc3Ex
	f7rxLP9yT4rxkeG4D69Xz6RvRRycekvqN87Xagv4oV9rY6cMvP7KhVjzd9eodZpbwow
	X0+4tO2xGkk2Mis9O+LTzvnlXoAmgBboU5rU/chU=
Message-ID: <b84d58e1-7b29-443a-b2b9-df56e6bd7020@apertussolutions.com>
Date: Tue, 23 Jun 2026 16:37:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260619130501.272832-13-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-4011c0/1782247076-B21F6DB8-15586EC7/0/0
X-purgate-type: clean
X-purgate-size: 2633
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:dkim,apertussolutions.com:mid,apertussolutions.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8C0E6BA0FA

On 6/19/26 9:04 AM, Frediano Ziglio wrote:
> Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
> memory from/to a foreign domain.
> 
> Extending MMUEXT_COPY_PAGE seems better on first sight but considering
> that MMUEXT is meant for PV only and trying to change that sub-op this
> solution is better.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> --
> Changes since v4:
> - Fix typo in comment.
> 
> Changes since v5:
> - update xen_foreigncopy structure comments;
> - move check for no frames after checking the domain;
> - use mnemonic instead of 1U;
> - fix page type checks;
> - do not overwrite error copying back structure;
> - latch MFN value;
> - improved commit message.
> ---
>   xen/common/memory.c         | 145 ++++++++++++++++++++++++++++++++++++
>   xen/include/public/memory.h |  44 ++++++++++-
>   2 files changed, 188 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 3672bda025..98726766bf 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1545,6 +1545,139 @@ static int acquire_resource(
>       return rc;
>   }
>   
> +/*
> + * The "noinline" qualifier avoids the compiler to create a large function
> + * consuming quite a lot of stack.
> + */
> +static int noinline mem_foreigncopy(
> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> +{
> +    struct domain *d, *const currd = current->domain;
> +    xen_foreigncopy_t copy;
> +    int rc, direction;
> +
> +    if ( copy_from_guest(&copy, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> +        return -EINVAL;
> +
> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> +
> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> +    if ( rc )
> +        return rc;
> +
> +    if ( copy.nr_frames == 0 )
> +    {
> +        rcu_unlock_domain(d);
> +        return 0;
> +    }
> +
> +    /*
> +     * Check we are allowed to map and access these foreign pages.
> +     */
> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);

While on the result is the same, this is a different action. I didn't 
immediately answer because I am split on what the new hook should be. In 
particular if it should be only one like map_gmfn, if it should instead 
also take a direction (in/out), of should we have two hooks (xxx_read, 
xxx_write). Myself, I am leaning toward the last option but I am open to 
hearing other's opinions. If you need any assistance with writing the 
hooks, feel free to reach out.

v/r,
dps

