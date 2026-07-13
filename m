Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2qc1AqeXVGr+nwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:45:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCC7748519
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:45:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=OS6s4xl3;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361496.1613719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBM4-0005az-RY; Mon, 13 Jul 2026 07:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361496.1613719; Mon, 13 Jul 2026 07:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBM4-0005ZY-Og; Mon, 13 Jul 2026 07:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1361496;
 Mon, 13 Jul 2026 07:45:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1wjBM2-0005ZS-Vd
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:45:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjBM2-007GgG-2o
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:45:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6a54978a-bab6-0a2a0a5309dd-0a2a4502863e-30
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:45:29 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <armbru@redhat.com>)
 id 6a549798-64c6-0a2a45020019-aa0a817cd613-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:45:29 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-IZooiFzcPA6IroMRGoyIwg-1; Mon,
 13 Jul 2026 03:45:24 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4EE9B18002C3; Mon, 13 Jul 2026 07:45:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1509E765; Mon, 13 Jul 2026 07:45:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A638D21E6920; Mon, 13 Jul 2026 09:45:17 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783928728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mKVnbI611gExUMjuzjUm1eZVIqPdwDXtnBh9poHdS4c=;
	b=OS6s4xl3cFcNsGf2w5FGUFhmRAGTUlk3zbHPcVR69Z1WNZFXYbbpP4dkqzEZG8SPVhGmEH
	FEAnqWrodniOl/417mu6arLDpvHfDPHo2xvBceZhxMHK3UXylV5bnTSwJfdqL/Mu6n0OxF
	hF1DaOpL4RV6836ABC6Lsd/nE2mZwic=
X-MC-Unique: IZooiFzcPA6IroMRGoyIwg-1
X-Mimecast-MFC-AGG-ID: IZooiFzcPA6IroMRGoyIwg_1783928722
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: jasowang@redhat.com,  mst@redhat.com,  peterx@redhat.com,
  farosas@suse.de,  raphael.s.norwitz@gmail.com,  bchaney@akamai.com,
  qemu-devel@nongnu.org,  berrange@redhat.com,  pbonzini@redhat.com,
  yc-core@yandex-team.ru,  mark.caveayland@nutanix.com,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Sergio Lopez <slp@redhat.com>,  Zhao
 Liu <zhao1.liu@intel.com>,  Stefano Stabellini <sstabellini@kernel.org>,
  Anthony PERARD <anthony@xenproject.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Bernhard Beschow <shentey@gmail.com>,
  Alistair Francis <Alistair.Francis@wdc.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Jason Wang <jasowangio@gmail.com>,  Eric Blake
 <eblake@redhat.com>,  devel@lists.libvirt.org (open list:Incompatible
 changes),  xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
  qemu-ppc@nongnu.org (open list:e500),  qemu-riscv@nongnu.org (open
 list:Microchip PolarFi...)
Subject: Re: [PATCH v18 03/14] net/tap: deprecate "no" as special value for
 script/downscript
In-Reply-To: <20260710191809.721154-4-vsementsov@yandex-team.ru> (Vladimir
	Sementsov-Ogievskiy's message of "Fri, 10 Jul 2026 22:17:52 +0300")
References: <20260710191809.721154-1-vsementsov@yandex-team.ru>
	<20260710191809.721154-4-vsementsov@yandex-team.ru>
Date: Mon, 13 Jul 2026 09:45:17 +0200
Message-ID: <87ech7uycy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: SI_OOTtmjfjrBeyao0TsUdz0BdalIXkd-3rJ3EyrovM_1783928722
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-purgate-ID: tlsNG-720697/1783928729-3EF43A87-422508C4/0/0
X-purgate-type: clean
X-purgate-size: 1451
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.de,gmail.com,akamai.com,nongnu.org,yandex-team.ru,nutanix.com,oss.qualcomm.com,intel.com,kernel.org,xenproject.org,wdc.com,dabbelt.com,lists.libvirt.org,lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[armbru@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:vsementsov@yandex-team.ru,m:jasowang@redhat.com,m:mst@redhat.com,m:peterx@redhat.com,m:farosas@suse.de,m:raphael.s.norwitz@gmail.com,m:bchaney@akamai.com,m:qemu-devel@nongnu.org,m:berrange@redhat.com,m:pbonzini@redhat.com,m:yc-core@yandex-team.ru,m:mark.caveayland@nutanix.com,m:pierrick.bouvier@oss.qualcomm.com,m:slp@redhat.com,m:zhao1.liu@intel.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:shentey@gmail.com,m:Alistair.Francis@wdc.com,m:palmer@dabbelt.com,m:jasowangio@gmail.com,m:eblake@redhat.com,m:devel@lists.libvirt.org,m:xen-devel@lists.xenproject.org,m:qemu-ppc@nongnu.org,m:qemu-riscv@nongnu.org,m:raphaelsnorwitz@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[armbru@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yandex-team.ru:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DCC7748519

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> The interface is ambiguous, as "no" is valid file name. So,
> using "no" as a special value to disable script is deprecated.
> Use an empty string ("script=" / "downscript=") instead.
>
> In a future version, "no" will be treated as a plain file name, just
> like any other non-empty value.
>
> Document the deprecation in docs/about/deprecated.rst, qapi/net.json,
> and qemu-options.hx. Update other docs to use empty string instead of
> "no". Add a warning.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

[...]

> diff --git a/net/tap.c b/net/tap.c
> index fedd48c48d2..1ec9e5ebe6f 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -103,6 +103,8 @@ static bool tap_is_explicit_no_script(const char *script_arg)
>      }
>  
>      if (strcmp(script_arg, "no") == 0) {
> +        warn_report("script=no/downscript=no is deprecated; "
> +                    "use script=/downscript= instead");

net_init_tap() could pass the parameter name for a simpler error
message.  Probably not worth the bother.

>          return true;
>      }
>  

In net_init_tap_one():

           qemu_set_info_str(&s->nc, "ifname=%s,script=%s,downscript=%s", ifname,
                             script ?: "no", downscript ?: "no");

This sets nc->info_str, which is shown by "info network".  Should we
replace "no" by ""?

[...]


