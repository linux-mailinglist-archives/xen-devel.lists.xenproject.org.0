Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Id6iItY7RmroMQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:22:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CF6F5D33
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=CpZddfSW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351601.1608729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfEYT-0005xe-9w; Thu, 02 Jul 2026 10:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351601.1608729; Thu, 02 Jul 2026 10:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfEYT-0005wG-6a; Thu, 02 Jul 2026 10:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1351601;
 Thu, 02 Jul 2026 10:22:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wfEYS-0005wA-4W
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:22:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfEYR-00CSD2-Hf
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:21:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a463bc5-5cb7-0a2a0a5109dd-0a2a45049e16-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:21:59 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a463bc5-a01d-0a2a45040019-888fbc335294-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:21:58 +0200
Received: by mx.zohomail.com with SMTPS id 1782987707484235.51031824193228;
 Thu, 2 Jul 2026 03:21:47 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782987711; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Erf+OR88YGH7B33E9ch2qAhCtGGsfCsPMoEIbVC+vurj185iySuOiI3psNr3kGL5iMITufCSMpZP2klH1tAvb/hGIMHnimCp2vNOtnrEBHHENMoBqbB8g4vzIZW0ydzvOapoIZIi7MkIcooGUPTd7ppN7+1wRdCMn9v3a0UoRnY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782987711; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vIAPMhBu82ubtuLXA6Cfj915g3ip0b/QqrhVvOeWe6s=; 
	b=g5rt67UgzxSmQqYeFgECM7EHEEfq9iA+mWjzItyXmxH/+rLNh/cgkSLyIicAfqjAXr4AAc5gKN/52NML2kiJX9IBZhxeWnhgoemKf5T1GHsH5HXRNtrkNs5pcrGBiH1bx7zYZ4W2aCkbf0BtiLgppb3aEHDIKtthrdZaOm6ToeA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782987711;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vIAPMhBu82ubtuLXA6Cfj915g3ip0b/QqrhVvOeWe6s=;
	b=CpZddfSWDo2i7vEP16AJ6GuEW+NSVFTjXoJa+uXJGfXjOKD5oVp4iQsd0zk/dVxw
	cF0NSMOgAiR8ASeGOnFDOsCh3pJvZ1JUDOT627wCdoviNN7P2hCVEcMGe1Fb8pQQmqP
	J/8+lO45Em0HzmMp0icrTXKtmLbyfA6t+KmeUc5Y=
Message-ID: <70b66c05-29bb-44f3-b105-3d85aa44b032@apertussolutions.com>
Date: Thu, 2 Jul 2026 06:21:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libxc: drop size parameter from
 xc_flask_context_to_sid()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
 <d3b03ebb-7923-4033-8bcb-cf0cdbb4e771@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d3b03ebb-7923-4033-8bcb-cf0cdbb4e771@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1782987719-AD13E1CC-EA2F2633/0/0
X-purgate-type: clean
X-purgate-size: 4045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,apertussolutions.com:dkim,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:from_mime];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E35CF6F5D33


On 7/1/26 10:47 AM, Jan Beulich wrote:
> Nul-terminated strings are passed in all cases, so the strlen() can very
> well be invoked by the function itself. In preparation for a hypervisor
> change also include the nul terminator in the size calculation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Ideally libxl_flask_context_to_sid() would follow suit, but aiui doing so
> would break its (stable) API.
> 
> Of course the casts in xc_flask_access() are suspicious.
> ---
> v2: Avoid assert() use in libxl.
> 
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -108,7 +108,7 @@ static int build(xc_interface *xch)
>   
>       if ( flask )
>       {
> -        rv = xc_flask_context_to_sid(xch, flask, strlen(flask), &config.ssidref);
> +        rv = xc_flask_context_to_sid(xch, flask, &config.ssidref);
>           if ( rv )
>           {
>               fprintf(stderr, "xc_flask_context_to_sid failed\n");
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2372,7 +2372,7 @@ long xc_sharing_used_frames(xc_interface
>   /*** End sharing interface ***/
>   
>   int xc_flask_load(xc_interface *xc_handle, char *buf, uint32_t size);
> -int xc_flask_context_to_sid(xc_interface *xc_handle, char *buf, uint32_t size, uint32_t *sid);
> +int xc_flask_context_to_sid(xc_interface *xc_handle, char *buf, uint32_t *sid);
>   int xc_flask_sid_to_context(xc_interface *xc_handle, int sid, char *buf, uint32_t size);
>   int xc_flask_getenforce(xc_interface *xc_handle);
>   int xc_flask_setenforce(xc_interface *xc_handle, int mode);
> --- a/tools/libs/ctrl/xc_flask.c
> +++ b/tools/libs/ctrl/xc_flask.c
> @@ -83,10 +83,11 @@ int xc_flask_load(xc_interface *xch, cha
>       return err;
>   }
>   
> -int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t size, uint32_t *sid)
> +int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t *sid)
>   {
>       int err;
>       struct xen_flask_op op = {};
> +    size_t size = strlen(buf) + 1;
>       DECLARE_HYPERCALL_BOUNCE(buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
>   
>       if ( xc_hypercall_bounce_pre(xch, buf) )
> @@ -249,7 +250,7 @@ static int xc_flask_add(xc_interface *xc
>       int err;
>       struct xen_flask_op op = {};
>   
> -    err = xc_flask_context_to_sid(xch, scontext, strlen(scontext), &sid);
> +    err = xc_flask_context_to_sid(xch, scontext, &sid);
>       if ( err )
>           return err;
>   
> @@ -325,10 +326,10 @@ int xc_flask_access(xc_interface *xch, c
>       struct xen_flask_op op = {};
>       int err;
>   
> -    err = xc_flask_context_to_sid(xch, (char*)scon, strlen(scon), &op.u.access.ssid);
> +    err = xc_flask_context_to_sid(xch, (char*)scon, &op.u.access.ssid);
>       if ( err )
>           return err;
> -    err = xc_flask_context_to_sid(xch, (char*)tcon, strlen(tcon), &op.u.access.tsid);
> +    err = xc_flask_context_to_sid(xch, (char*)tcon, &op.u.access.tsid);
>       if ( err )
>           return err;
>   
> --- a/tools/libs/light/libxl_flask.c
> +++ b/tools/libs/light/libxl_flask.c
> @@ -21,7 +21,10 @@ int libxl_flask_context_to_sid(libxl_ctx
>   {
>       int rc;
>   
> -    rc = xc_flask_context_to_sid(ctx->xch, buf, len, ssidref);
> +    if (len != strlen(buf))
> +        return ERROR_INVAL;
> +
> +    rc = xc_flask_context_to_sid(ctx->xch, buf, ssidref);
>   
>       return rc;
>   }
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -1754,7 +1754,7 @@ static PyObject *pyflask_context_to_sid(
>           return PyErr_SetFromErrno(xc_error_obj);
>       }
>   
> -    ret = xc_flask_context_to_sid(xc_handle, ctx, strlen(ctx), &sid);
> +    ret = xc_flask_context_to_sid(xc_handle, ctx, &sid);
>   
>       xc_interface_close(xc_handle);
>   
> 

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

