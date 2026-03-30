Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEX+IcCUymkR+QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:20:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC735DAEF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267815.1557302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EPP-0001SB-EO; Mon, 30 Mar 2026 15:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267815.1557302; Mon, 30 Mar 2026 15:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EPP-0001PX-AH; Mon, 30 Mar 2026 15:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1267815;
 Mon, 30 Mar 2026 15:20:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69ca94a2.v1-7a98e02100ce4a4da531b8a42863f51e@bounce.vates.tech>)
 id 1w7EPO-0001Gf-0m
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:20:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7EPN-004cBL-7l
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:20:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69ca94a2.v1-7a98e02100ce4a4da531b8a42863f51e@bounce.vates.tech>)
 id 69ca94a3-e002-0a2a0a5209dd-0a2a450bb756-4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:20:04 +0200
Received: from [198.2.179.37] (helo=mail179-37.suw41.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69ca94a2.v1-7a98e02100ce4a4da531b8a42863f51e@bounce.vates.tech>)
 id 69ca94a2-ef63-0a2a450b0019-c602b325a699-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:20:03 +0200
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4fkw0f0bXRzG0CBK5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:20:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7a98e02100ce4a4da531b8a42863f51e; Mon, 30 Mar 2026 15:20:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774884002; x=1775154002;
	bh=PeO2S1AWRgDSx8/UdTM17lTckXg5MBjaSPLBSlRlcys=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WJZVIOAnCKewQFcVKavIEp4qPhEfkseeEqPhmjyLg9catcoVBel2KeMdlE0WulLQw
	 3puspz1OgSeusVY/8QRTzzl87jQ3sBNMGFVwkS4gb97Dlcl5j40WOqTMKIeRWGJDGg
	 tSs7s9fnlnj1aizC3qSZSe7rMphM96xkJ1VMCHxImFumbBekulp9KRCc0Nk3Qadzn8
	 co4PNk3nPDI6HiemWqdN3Qzo9jyaz+Pc6cmRtn0Ou9GX2AAzFYq3VWZOWmzSsHG52z
	 +V0mvfVoOMm2KS2zLNmiMAeHKSeJ2ME3jd17QpcAL5cDbnchEhGehbjADzMcik8RTS
	 s8rRjII+YqcYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774884002; x=1775144502; i=teddy.astie@vates.tech;
	bh=PeO2S1AWRgDSx8/UdTM17lTckXg5MBjaSPLBSlRlcys=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SdKVD21eFyh6MKbvJg6bHHaUfgwZ5EAMP0ILGoOitxRV9qlC9RZl681/O9oe08J82
	 TzhOp7hyOSE5xm5kpz6k6nYicXBmf8vpxPsVVmKjgEO2OXoZgFBp4jTzakMXXC62vZ
	 Ikv7jrUa1371rhVnuq5FTzoizx0DIYdL4BdPzgRvV976Zfr3oIAjwgvHUh7flYv38V
	 TwGddUSlSOGhsF+Y9CdsrOIItI4d6a4eAUzNZo/cEATLvMsulsepaU0PpDOjsVkcLO
	 1e6wsViDJpaZgFOITBtrRANvYuDSBbwAPgV1srTWZlahnCXfP4xec8nNs7raCsy03q
	 9XzYDGXGJ/RNQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v9=203/3]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774884001337
Message-Id: <a41e6e2d-3aa8-4025-892a-632ffadd2e33@vates.tech>
To: "Anthony PERARD" <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>
References: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech> <97e34958e8070ee8771157e5ece78e7db1308174.1773671343.git.teddy.astie@vates.tech> <acp14kg1WJKKwa_Z@l14>
In-Reply-To: <acp14kg1WJKKwa_Z@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7a98e02100ce4a4da531b8a42863f51e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260330:md
Date: Mon, 30 Mar 2026 15:20:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1774884003-A2638112-FF0C2414/0/0
X-purgate-type: clean
X-purgate-size: 3714
X-Spamd-Result: default: False [5.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,xenproject.org,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ECBC735DAEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 30/03/2026 =C3=A0 15:11, Anthony PERARD a =C3=A9crit=C2=A0:
> On Mon, Mar 16, 2026 at 02:34:09PM +0000, Teddy Astie wrote:
>> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
>> index e4902d2e82..37f484b362 100644
>> --- a/tools/misc/xenpm.c
>> +++ b/tools/misc/xenpm.c
>> +static void get_core_temp(int argc, char *argv[])
>> +{
>> +    int temp =3D -1, cpu =3D -1;
>> +    unsigned int socket;
>> +    bool has_data =3D false;
>> +
>> +    if ( argc > 0 )
>> +        parse_cpuid(argv[0], &cpu);
>> +
>> +    if ( cpu !=3D -1 )
>> +    {
>> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
>> +            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
>> +        else
>> +        {
>> +            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
>> +                    errno, strerror(errno));
>> +            printf("No data\n");
> 
> What is this "no data" for? There's already two clues which says that
> there's nothing to print, the error message on stderr, and the non-zero
> exit value.
> 

The "no data" could be removed now that the information is transmitted 
differently.

>> +            exit(EXIT_FAILURE);
>> +        }
>> +        return;
>> +    }
>> +
>> +    /* Per socket measurement */
>> +    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
>> +          socket++, cpu +=3D physinfo.cores_per_socket * physinfo.threa=
ds_per_core )
>> +    {
>> +        if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )
> 
> Here, you deal with the error return by fetch_dts_temp() first, then the
> success, but in the previous block (cpu=3Dall) you do the opposite. Also,
> here the success isn't even in the else part, but after. Could you
> choose one style to be consistent?
> 
> I think I prefer to deal with the error first, so like here.
> 

Looks good to me.

>> +        {
>> +            fprintf(stderr,
>> +                    "[Package%u] Unable to fetch temperature (%d - %s)\=
n",
>> +                    cpu, errno, strerror(errno));
>> +            continue;
> 
> If we got an error one one package, aren't we likely to got more error?
> Is it worth to keep trying on the next package?
> 
>> +        }
>> +
>> +        has_data =3D true;
>> +        printf("Package%u: %d=C2=B0C\n", socket, temp);
>> +    }
>> +
>> +    if ( has_data )
>> +        /* Avoid inserting a trailing line if we have nothing */
>> +        printf("\n");
>> +
>> +    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_co=
re )
>> +    {
>> +        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
>> +        {
>> +            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - =
%s)\n",
>> +                    cpu, errno, strerror(errno));
>> +            continue;
>> +        }
>> +
>> +        has_data =3D true;
>> +        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
>> +    }
>> +
>> +    if ( !has_data )
>> +    {
>> +        printf("No data\n");
> 
> Another "no data".
> 

It could be removed as well.

---

I wonder if we can remove the "has_data" boolean by making any (aside 
package temperature if it's not supported) failure cause a 
exit(EXIT_FAILURE) instead ?

We lose the empty line between Package and CPU temperature though, as we 
need to add it only if package temperature exists.

>> +        exit(EXIT_FAILURE);
>> +    }
>> +}
>> +
> 
> Thanks,
> 
> 
> --
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



