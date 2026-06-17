Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8BaqDtaKMmoU1wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:53:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC6699513
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QuXeSHtK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340352.1601404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZopz-0000OM-5L; Wed, 17 Jun 2026 11:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340352.1601404; Wed, 17 Jun 2026 11:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZopz-0000Lt-2H; Wed, 17 Jun 2026 11:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1340352;
 Wed, 17 Jun 2026 11:53:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZopx-0000Lm-3H
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:53:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZopw-000bjM-GN
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:53:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328ab5-5cb7-0a2a0a5109dd-0a2a4502d350-44
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:53:40 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328ac4-af86-0a2a45020019-d1558035bd07-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:53:40 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b12270b3so34817925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:53:40 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e6a8fsm54334241f8f.37.2026.06.17.04.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:53:39 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781697220; x=1782302020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbLksA3BholJDia7lte/EbDKvlwduySUNQKPC1qhceU=;
        b=QuXeSHtK8z3L1bd65WjquSDrHniVJQqS6um4pMeYvheH15xQbC9L3Nne/DGmJPfxhd
         4B1KiLHX909BC3MsrDo3lKZehZWvjlnI2tUVzswFNKkGzBG900yunPAgVbc10+k9oocN
         EoiGOzMA/zplqrSrL4UJdhH3lY6M3nFyR2ENSAESg7YaROK1tDuPZQ1pbOR7Cwwhltj2
         PaHZgHbWAtAhuZkn8n9OpVnNvnPtfTsS2WmO6opLmlXvORRatK0JzWM+DnPMdwt6iN70
         DrzDRI+SRVhkcnKxnVzyUtolZZPkXa1dzgF3opz+tSuoA8Rjje/fXyaJWZCmnvnC4jFu
         GpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697220; x=1782302020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbLksA3BholJDia7lte/EbDKvlwduySUNQKPC1qhceU=;
        b=TeSsoxsCcvEhQ6r2d2tE0rdxIzi4Mv0v+NMwisDLpFeQTy7+rHSW76sbp1rvmwjHZh
         9Vgrdejyd/jYzMvRc4gjvoKxbr6/8EJGNmumgaNSlYTlHaEeFtq0nKyfTQOt7a78O0RD
         SFkZ0/0jAlDvYRfyRIxIw7+q6/j+7hJOZNxo3dBjVXvkbunoc2DGUDaT5RNEjup71GUD
         AIpan+WMRTR+leC8E6As9WzrwthiuSzW0NzyCegP9kWXs1kpYorKFO2VpXz7+8OxoQ7R
         IBt46kVW0QaQaXdFNFWxYNYBcc2I0Kq70bfxdrho9yLeUxnkCGFC+Dta/6asTMvcQb68
         TaRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+dkGErujg4TdEpuXd2ZIFRHO2KVzaVbHhf+1FHiBF/7w7ZHkGZCpF4hI5BJi4ZOUV5XtGev15g3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwiroTpoLUUQnDXmr/mP4PU7kEIJZpbl8ACy097/p2UEH5+joM
	IzXtXrVxbm9hRO3t8Tn6XneSGHcESylAq5IsdmjLUUkvpIJBpJqBlpx+
X-Gm-Gg: Acq92OGR8rkHCni0LhVpWEOUOzAFjBS717ZoY+h7OTNcYRolEJR6bUsjq6OX4eZvmBn
	R8QzFf/OUnOmSWXXw3j7TBRs8U1aS/RwNo8vPjiSXhYrxj66LnPQORHMzPk+X2Z9px3E2Um9VHO
	odgvsEIwyEjL+UNnji2p8Yv0R5KTSForC8HK4fcuOceYpN2l6xlKD6CMLeKBqJ9tj3HQDJ7svef
	Ok6MYlJcX96hXNGYt7LGjgJcKpxzzd6gd6m2xTOc8bCnQgdWO3JgyGc3GIZbDOk3WlH8wcj8msV
	17lZay9AAQSsa88IsIfrZvkdS9ElPVwPXEPNloMC4KDsoKCbn9gRlqL75RjR715hYAKVwVlbNV6
	r3P1ZBaFxuxzNxRp/aVpoCIOnBtj/b3XYQzoOEJa178KizwjYGjIEOESb/MDtXqr2IQr4+cgkAm
	VmQYJntYmnF3m9rZFY8ElaGNeQyrDT/e5Lf4f1LuncSCSjKQtTzwh1z7NePEqfaZ1cZm4=
X-Received: by 2002:a05:600c:8485:b0:492:3173:b17 with SMTP id 5b1f17b1804b1-4923412f148mr41360775e9.17.1781697219790;
        Wed, 17 Jun 2026 04:53:39 -0700 (PDT)
Message-ID: <03cb6dc5-9ce7-44e0-be3e-441bfa038fa9@gmail.com>
Date: Wed, 17 Jun 2026 13:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 6/7] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781697220-8057B161-7ECAF42B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1969
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93FC6699513



On 6/17/26 11:30 AM, Jan Beulich wrote:
> Rather than granting permissions when mapping (an operation that DM-s are
> allowed to carry out, while they can't invoke ioport-permission), check
> whether permissions actually were granted when adding a mapping. This then
> also allows relaxing the necessary locking.
> 
> While no longer granting permissions upon mapping is "only" at risk of
> breaking guests, no longer revoking permissions upon unmapping strictly
> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
> else a security issue would arise. In-tree code already does so.
> 
> While there switch to using %pd in the two log messages.
> 
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

> ---
> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> I/O ports look to be treated equally.
> 
> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> region special in any way? Clearly this can't work from a stubdom.
> ---
> v2: Avoid double evaluation of "add". Add ChangeLog entry.
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog
>    - On x86:
>      - Enable pf-fixup option by default for PVH dom0.
>      - The libxenguest bzImage loader now uses the system liblz4 library.
> +   - XEN_DOMCTL_ioport_mapping no longer implicitly grants permissions for the
> +     port range in question.  XEN_DOMCTL_ioport_permission now needs invoking
> +     up front.
>   

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


