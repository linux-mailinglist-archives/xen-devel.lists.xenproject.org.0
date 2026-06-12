Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EA7+OR7ZK2pWGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322906788EE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="jbQwmb9/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336506.1598362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyi5-0006Kl-Bv; Fri, 12 Jun 2026 10:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336506.1598362; Fri, 12 Jun 2026 10:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyi5-0006Hp-6A; Fri, 12 Jun 2026 10:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1336506;
 Fri, 12 Jun 2026 10:01:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47e1bc000701b@swg.vates.tech>)
 id 1wXyi3-0005wL-O8
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyi3-00D9qT-4g
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47e1bc000701b@swg.vates.tech>)
 id 6a2bd90b-5cb7-0a2a0a5109dd-0a2a4504a10a-24
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:55 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47e1bc000701b@swg.vates.tech>)
 id 6a2bd910-1dec-0a2a45040019-b9ff1c12b34f-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb47e1bc000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:50 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 37BA28617A;
 Fri, 12 Jun 2026 12:01:50 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=wo38Wb4mhnf9Pj4GWkNkBAFqvtrLKZaAKnM+mE1EOg8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jbQwmb9/dqeVvLT4Wwa6LXm0R5xxLhrjQbG+sTV6SJjePEgC8IaGVjbgCBqqEQFmnN+nfxGNT
 KGalCYfj/6pCSAGEjJcmuxWdahODVudcbT059UYcl6v/2hepiL9yhU0x40ZqIgKv5NnukpbWsMl
 y6KJwh7nQtZeWV5ywaf828O1bR/ycHu01se0ZdnNOXto//P+dK38Jd5CWDmAnauFSsEtm5T2/lK
 HLxW3aCpC6Z+8zp3PGUZHr4HhaSEAH5NB+PQMFsfZEieXr6FMSVvV2aYxYwU7D2TcYNeVBZHyC9
 KuIc/Csuv6QZ2KqS6toDFPA9uElmaPDE0l2ztwV85Zrg==
X-Zone-Loop: ceb447816a2f9dc5c9801313aca56b1d1b75bb633db1
x-campaign-type: default
x-transaction-id: 5b8f2ec4-e29a-421c-bf03-cffa32e3ad69
x-swg-uid: 01-54f2050a-e2d9-41e6-952b-2387ef95cb3b
X-Mailer: Sweego
Message-ID:
 <1781258510.8631fc262581453bbf619ec5b2062170.19ebb47e1bc000701b@vates.tech>
x-swg-bid: 1781258510.8631fc262581453bbf619ec5b2062170.19ebb47e1bc000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 09/17] xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-10-thierry.escande@vates.tech>
 <df1aff17-1fb1-4ae3-995f-944a1750659b@suse.com>
Content-Language: en-US
In-Reply-To: <df1aff17-1fb1-4ae3-995f-944a1750659b@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a4.af6c48b767941662.19ebb47e040.c82bf858b273b1fe=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258510400
X-purgate-ID: tlsNG-ebf023/1781258515-4217E3FF-67CC86B2/0/0
X-purgate-type: clean
X-purgate-size: 3429
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 322906788EE

---=Part.a4.af6c48b767941662.19ebb47e040.c82bf858b273b1fe=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 17:12, Jan Beulich wrote:
> On 13=2E03=2E2026 17:35, Thierry Escande wrote:
>> This patch adds 2 HVMOP hypercalls, HVMOP_get|set_ecam_space, used to
>> set and get the base address and size of the PCIe ECAM space as
>> configured by hvmloader=2E
>>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>=20
> Just in case we want to stick to these (see Roger's earlier comments
> throughout the series), a few remarks here:
>=20
>> --- a/xen/arch/x86/hvm/hvm=2Ec
>> +++ b/xen/arch/x86/hvm/hvm=2Ec
>> @@ -5195,6 +5195,58 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDL=
E_PARAM(void) arg)
>>          rc =3D current->hcall_compat ? compat_altp2m_op(arg) : do_altp=
2m_op(arg);
>>          break;
>> =20
>> +    case HVMOP_set_ecam_space: {
>> +        xen_hvm_ecam_space_t ecam;
>> +        struct domain *d;
>> +
>> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ec=
am_space_t), 1 ) )
>> +            return -EFAULT;
>> +
>> +        d =3D rcu_lock_domain_by_any_id(ecam=2Edomid);
>> +        if ( d =3D=3D NULL )
>> +            return -ESRCH;
>> +
>> +        if ( d->arch=2Eecam_addr ) {
>> +            rcu_unlock_domain(d);
>> +            return -EFAULT;
>> +        }
>> +
>> +        if ( (ecam=2Esize >> 28) || (!ecam=2Eaddr) ) {
>> +            rcu_unlock_domain(d);
>> +            return -EINVAL;
>> +        }
>> +
>> +        d->arch=2Eecam_addr =3D ecam=2Eaddr;
>> +        d->arch=2Eecam_size =3D ecam=2Esize;
>=20
> Shorter (and easier to follow as well as less error prone as to the
> rcu_unlock_domain())
>=20
>         if ( d->arch=2Eecam_addr )
>             rc =3D -E=2E=2E=2E;
>         else if ( (ecam=2Esize >> 28) || !ecam=2Eaddr )
>             rc =3D -EINVAL;
>         else
>         {
>             d->arch=2Eecam_addr =3D ecam=2Eaddr;
>             d->arch=2Eecam_size =3D ecam=2Esize;
>         }
>=20
> all utilizing =2E=2E=2E
>=20
>> +        rcu_unlock_domain(d);
>=20
> =2E=2E=2E this=2E

Will rework that part=2E

>=20
> The magic 28 also needs (a) explaining and/or (b) abstracting (a
> suitably named #define might address both)=2E
>=20
>> --- a/xen/include/public/hvm/hvm_op=2Eh
>> +++ b/xen/include/public/hvm/hvm_op=2Eh
>> @@ -166,6 +166,17 @@ struct xen_hvm_get_mem_type {
>>  typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
>> =20
>> +#define HVMOP_set_ecam_space    16
>> +#define HVMOP_get_ecam_space    17
>> +struct xen_hvm_ecam_space {
>> +    domid_t  domid;
>> +    uint16_t pad[3]; /* align next field on 8-byte boundary */
>=20
> The comment, as is, is wrong for 32-bit HVM guests: There =2E=2E=2E
>=20
>> +    uint64_t addr;
>=20
> =2E=2E=2E this is only 4-byte aligned, and hence the entire structure on=
ly
> has 4-byte alignment, and hence the padding also only guarantees 4-
> byte alignment=2E

Right=2E Roger proposal fixes it:
    domid_t  domid;
    uint16_t pad;
    uint32_t size
    uint64_t addr;

Regards,



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a4.af6c48b767941662.19ebb47e040.c82bf858b273b1fe=---

