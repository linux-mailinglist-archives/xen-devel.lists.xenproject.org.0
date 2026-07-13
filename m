Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q37SHkGyVGqipgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 11:39:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E809749646
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 11:39:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex-team.ru header.s=default header.b=EH+sRfAS;
	dmarc=pass (policy=none) header.from=yandex-team.ru;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361543.1613737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjD71-0003mN-50; Mon, 13 Jul 2026 09:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361543.1613737; Mon, 13 Jul 2026 09:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjD71-0003k1-2J; Mon, 13 Jul 2026 09:38:07 +0000
Received: by outflank-mailman (input) for mailman id 1361543;
 Mon, 13 Jul 2026 09:38:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vsementsov@yandex-team.ru>) id 1wjD6z-0003jv-2Y
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:38:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjD6y-006Urm-7A
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 11:38:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a54b1fb-bab6-0a2a0a5309dd-0a2a450296e6-2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:38:03 +0200
Received: from [178.154.239.200] (helo=forwardcorp1d.mail.yandex.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a54b1f6-64c6-0a2a45020019-b29aefc88bfe-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:37:58 +0200
Received: from mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:94a9:0:640:a3fa:0])
 by forwardcorp1d.mail.yandex.net (postfix) with ESMTPS id 0B8BD80D23;
 Mon, 13 Jul 2026 12:37:58 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:c5a::1:8] (unknown [2a02:6bf:8080:c5a::1:8])
 by mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (smtpcorp) with ESMTPSA
 id sbKrT10a84Y0-nOS8gQZY; Mon, 13 Jul 2026 12:37:57 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1783935477;
	bh=CTcAYbgj/3lc1gK9l4ZVRRXqBQQM2jCl6PzUptJwolI=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=EH+sRfASNV1d5CFYkTftwEXBhDoGEt6XsF0SygT6ZdOLSfYH1FyP1Fjbq1Vg4PSzk
	 pSFh1wuhrml/eqZ5oFxLccEtjrLCnSXddTt/TeusIY/TkhltWaAybsFD1E5MbCNG5b
	 BSz3uoFWpf3uXREd+fqVoM20dDFL14ppCRni+uN8=
Message-ID: <d1ea2c42-7990-4529-b9f8-d0d9e35ffd51@yandex-team.ru>
Date: Mon, 13 Jul 2026 12:37:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 03/14] net/tap: deprecate "no" as special value for
 script/downscript
To: Markus Armbruster <armbru@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, peterx@redhat.com, farosas@suse.de,
 raphael.s.norwitz@gmail.com, bchaney@akamai.com, qemu-devel@nongnu.org,
 berrange@redhat.com, pbonzini@redhat.com, yc-core@yandex-team.ru,
 mark.caveayland@nutanix.com,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Sergio Lopez <slp@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowangio@gmail.com>,
 Eric Blake <eblake@redhat.com>,
 "open list:Incompatible changes" <devel@lists.libvirt.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:Microchip PolarFi..." <qemu-riscv@nongnu.org>
References: <20260710191809.721154-1-vsementsov@yandex-team.ru>
 <20260710191809.721154-4-vsementsov@yandex-team.ru>
 <87ech7uycy.fsf@pond.sub.org>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87ech7uycy.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783935483-B354EA87-412D6A2F/0/0
X-purgate-type: clean
X-purgate-size: 1611
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.69 / 15.00];
	WHITELIST_DMARC(-7.00)[yandex-team.ru:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex-team.ru,none];
	R_DKIM_ALLOW(-0.20)[yandex-team.ru:s=default];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.de,gmail.com,akamai.com,nongnu.org,yandex-team.ru,nutanix.com,oss.qualcomm.com,intel.com,kernel.org,xenproject.org,wdc.com,dabbelt.com,lists.libvirt.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yandex-team.ru:from_mime,yandex-team.ru:email,yandex-team.ru:mid,yandex-team.ru:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[vsementsov@yandex-team.ru,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:armbru@redhat.com,m:jasowang@redhat.com,m:mst@redhat.com,m:peterx@redhat.com,m:farosas@suse.de,m:raphael.s.norwitz@gmail.com,m:bchaney@akamai.com,m:qemu-devel@nongnu.org,m:berrange@redhat.com,m:pbonzini@redhat.com,m:yc-core@yandex-team.ru,m:mark.caveayland@nutanix.com,m:pierrick.bouvier@oss.qualcomm.com,m:slp@redhat.com,m:zhao1.liu@intel.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:shentey@gmail.com,m:Alistair.Francis@wdc.com,m:palmer@dabbelt.com,m:jasowangio@gmail.com,m:eblake@redhat.com,m:devel@lists.libvirt.org,m:xen-devel@lists.xenproject.org,m:qemu-ppc@nongnu.org,m:qemu-riscv@nongnu.org,m:raphaelsnorwitz@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[yandex-team.ru:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vsementsov@yandex-team.ru,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E809749646

On 13.07.26 10:45, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> 
>> The interface is ambiguous, as "no" is valid file name. So,
>> using "no" as a special value to disable script is deprecated.
>> Use an empty string ("script=" / "downscript=") instead.
>>
>> In a future version, "no" will be treated as a plain file name, just
>> like any other non-empty value.
>>
>> Document the deprecation in docs/about/deprecated.rst, qapi/net.json,
>> and qemu-options.hx. Update other docs to use empty string instead of
>> "no". Add a warning.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> [...]
> 
>> diff --git a/net/tap.c b/net/tap.c
>> index fedd48c48d2..1ec9e5ebe6f 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -103,6 +103,8 @@ static bool tap_is_explicit_no_script(const char *script_arg)
>>       }
>>   
>>       if (strcmp(script_arg, "no") == 0) {
>> +        warn_report("script=no/downscript=no is deprecated; "
>> +                    "use script=/downscript= instead");
> 
> net_init_tap() could pass the parameter name for a simpler error
> message.  Probably not worth the bother.
> 
>>           return true;
>>       }
>>   
> 
> In net_init_tap_one():
> 
>             qemu_set_info_str(&s->nc, "ifname=%s,script=%s,downscript=%s", ifname,
>                               script ?: "no", downscript ?: "no");
> 
> This sets nc->info_str, which is shown by "info network".  Should we
> replace "no" by ""?
> 


Agree, will do.


-- 
Best regards,
Vladimir

