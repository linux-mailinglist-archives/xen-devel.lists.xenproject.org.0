Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHLOD15U+mlPMgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:34:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D474D3B06
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301081.1575421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKMSO-0004Vc-4a; Tue, 05 May 2026 20:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301081.1575421; Tue, 05 May 2026 20:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKMSO-0004TQ-1p; Tue, 05 May 2026 20:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1301081;
 Tue, 05 May 2026 20:33:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wKMSL-0004TK-Ot
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:33:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKMSK-0078Ld-1Y
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 22:33:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 69fa5403-e002-0a2a0a5209dd-0a2a45039108-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 22:33:23 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 69fa5411-672d-0a2a45030019-888fbc335283-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 22:33:23 +0200
Received: by mx.zohomail.com with SMTPS id 1778013197458240.2115813323103;
 Tue, 5 May 2026 13:33:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1778013200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MolC+U6dDRgKzEgEsYoJgtFaUaV8n+ElOL9dZY0AGCRi3X8aFbO6qkA50UR/1PTlnkAuXJ0/dPka9x1CDye0dx2fF/HjMTkPEjQs9CPtTijAyzvtN11iYszSys5zdGcRI/Ojhs9D2CTsQ8LnQgFBMWxADBSdQtaDhi9udbZeXME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778013200; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=1ymrRuK40LDWL4DAPkTL6UWbQmdGYGFd2FHyD/hl/RU=; 
	b=HPJqjcch0PtOeNrg69GG4pK+3TConFsd0zmxbSfNFk56qp/EpTovy2zcmoaak+FjG1zigKwOQlrdK3KAdIny4ARj9Yq+6+h5ziVpufA07BRSzM62dfFDz+SaunSB9E2Eb2yhQiFYabBB+ZxW2h7Z9jwkzW/qhzZ7UMO0jWveefA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778013200;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=1ymrRuK40LDWL4DAPkTL6UWbQmdGYGFd2FHyD/hl/RU=;
	b=Bo8gWvoWSLR8+7vtSvOPFzq+ULBWxX4pSiho0Rx5dTwnGYdGq/tcg0T2MwSucW0G
	RE6U7JabUEHHDMC6fc//Udutgxb1sBXB3nz0yv+m/nwQgkOaXUNgOeb/hNkO49N7D8D
	VhmdHVysNy30NOQpYNsMz4zRs4pJrzM7sD9Mw/V8=
Message-ID: <800d7a78-6125-4bf5-9e5d-5f3befcaa9bf@apertussolutions.com>
Date: Tue, 5 May 2026 16:33:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xsm/flask: Fix undefined behaviour in avc_dump_av()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <43fc4b4ed45858b2cebbc37bbbf3b70e664a0661.1777642449.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <43fc4b4ed45858b2cebbc37bbbf3b70e664a0661.1777642449.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1778013203-2997D938-DD9FF2D5/0/0
X-purgate-type: clean
X-purgate-size: 1941
X-Rspamd-Queue-Id: 75D474D3B06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[apertussolutions.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[192.237.175.120:server fail,10.42.69.3:server fail,195.190.135.10:server fail,136.143.188.51:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]

On 5/1/26 10:17, Dmytro Prokopchuk1 wrote:
> When booting Xen with CONFIG_USBAN=y and CONFIG_XSM_FLASK=y,
> UBSAN reports undefined behaviour in avc_dump_av() due to a left
> shift on a signed int:
> 
> (XEN) [    1.104348] ================================================================================
> (XEN) [    1.105096] UBSAN: Undefined behaviour in xsm/flask/avc.c:184:14
> (XEN) [    1.106052] left shift of 1073741824 by 1 places cannot be represented in type 'int'
> (XEN) [    1.107546] Xen WARN at common/ubsan/ubsan.c:176
> (XEN) [    1.108295] ----[ Xen-4.21.1  arm64  debug=y ubsan=y  Not tainted ]----
> (XEN) [    1.108848] CPU:    0
> (XEN) [    1.109147] PC:     00000a00002f64fc ubsan.c#ubsan_epilogue+0x10/0xd4
> [...]
> (XEN) [    1.146320] Xen call trace:
> (XEN) [    1.146663]    [<00000a00002f64fc>] ubsan.c#ubsan_epilogue+0x10/0xd4 (PC)
> (XEN) [    1.147227]    [<00000a00002f7bc4>] __ubsan_handle_shift_out_of_bounds+0x1a0/0x290 (LR)
> (XEN) [    1.147868]
> (XEN) [    1.148177] ================================================================================
> 
> This can be solved by making 'perm' an unsigned 32-bit type (u32).
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2493649109
> ---
>   xen/xsm/flask/avc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
> index 3d39e55cae..9c3ffdc070 100644
> --- a/xen/xsm/flask/avc.c
> +++ b/xen/xsm/flask/avc.c
> @@ -152,7 +152,8 @@ static void __attribute__ ((format (printf, 2, 3)))
>    */
>   static void avc_dump_av(struct avc_dump_buf *buf, u16 tclass, u32 av)
>   {
> -    int i, i2, perm;
> +    int i, i2;
> +    u32 perm;
>   
>       if ( av == 0 )
>       {

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

