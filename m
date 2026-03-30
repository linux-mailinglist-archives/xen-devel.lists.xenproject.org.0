Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BtRAvZ1ymmB9AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:09:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F535BA5C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267621.1557082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CMS-0001BY-Ch; Mon, 30 Mar 2026 13:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267621.1557082; Mon, 30 Mar 2026 13:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CMS-00019G-9P; Mon, 30 Mar 2026 13:08:56 +0000
Received: by outflank-mailman (input) for mailman id 1267621;
 Mon, 30 Mar 2026 13:08:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69ca75e4.v1-0ce58cf1903347f2bf5eab2ab4093227@bounce.vates.tech>)
 id 1w7CMR-00019A-36
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:08:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7CMQ-00FSVf-0e
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:08:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69ca75e4.v1-0ce58cf1903347f2bf5eab2ab4093227@bounce.vates.tech>)
 id 69ca75e1-5cb7-0a2a0a5109dd-0a2a4508c058-16
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:08:53 +0200
Received: from [198.2.179.37] (helo=mail179-37.suw41.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69ca75e4.v1-0ce58cf1903347f2bf5eab2ab4093227@bounce.vates.tech>)
 id 69ca75e4-1950-0a2a45080019-c602b325e9e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:08:53 +0200
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4fks5J3HtHzG0CBMd
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:08:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0ce58cf1903347f2bf5eab2ab4093227; Mon, 30 Mar 2026 13:08:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774876132; x=1775146132;
	bh=mIEm/iN6fS8KrIMEKNtAJdkxNl1wvFYMuGBbwzIso9s=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dNNEjd+R88zXUCt8zOhkINrMA/vbtAe2+33+Jmyb0iRdX9BgQnCQTnHPvN1TWuabK
	 aPuD7Rf46BrfaXTenj23XPgGFUWz0UKPeRa/wqiscPplpSmiDs+IryikyfSd8aX2UU
	 BKKOwkFWGO2Nr8UAjcasPLePkrZxsmeiW9a66Ls1wJrmpscXXd54izRaF7V3aMuZ+F
	 0uvAmwj2dv+Ba4yi1yBOFnR57csx+FHaMou9mvvAgnl8FF0/skeltnru+UItcvpLcw
	 WTe8dymhC4Ig4mvh8a8MNWsz6p7XEgO2arvH5vr/GOzOzh40F+w+eTQJ4/ku/C/QUa
	 j+QTNCnr81aAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774876132; x=1775136632; i=anthony.perard@vates.tech;
	bh=mIEm/iN6fS8KrIMEKNtAJdkxNl1wvFYMuGBbwzIso9s=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JN2yXSfjGsSxvIzwIyrgkzQ77q6OTvp3776rY7XJaFyGVdziOhW22S/1dhmzHPsNN
	 H9shES4u3kQkJ+J0MVxzSulGQmK4k8oEWuFIvr3vw6dyYeftz/4kNiZGBuOaObux8H
	 o0zbHjqjdUJl5sGr2Gl/uM+F6qJuekhQIuSWdXS9Q6NuvqbUlx+SKl9Ojm48OvQAXM
	 NJVSC/RcIQlTWodicnqktoAYrDfYIngWN8HZsJw82JlcaUxHmiNyCnT7NgsuZ+PJed
	 mjYWA7CZPBLqx8Uoa9p1BsGVRw8DEP4U4gD32/eg3NnWoRG9oa0+R+n1tGf3w0l+pA
	 smRkRnFhdORCA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v9=203/3]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774876130735
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <acp14kg1WJKKwa_Z@l14>
References: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech> <97e34958e8070ee8771157e5ece78e7db1308174.1773671343.git.teddy.astie@vates.tech>
In-Reply-To: <97e34958e8070ee8771157e5ece78e7db1308174.1773671343.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0ce58cf1903347f2bf5eab2ab4093227?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260330:md
Date: Mon, 30 Mar 2026 13:08:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1774876133-E9488726-97333838/0/0
X-purgate-type: clean
X-purgate-size: 2941
X-Spamd-Result: default: False [5.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,xenproject.org,suse.com];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5E2F535BA5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:34:09PM +0000, Teddy Astie wrote:
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index e4902d2e82..37f484b362 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> +static void get_core_temp(int argc, char *argv[])
> +{
> +    int temp =3D -1, cpu =3D -1;
> +    unsigned int socket;
> +    bool has_data =3D false;
> +
> +    if ( argc > 0 )
> +        parse_cpuid(argv[0], &cpu);
> +
> +    if ( cpu !=3D -1 )
> +    {
> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
> +        else
> +        {
> +            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
> +                    errno, strerror(errno));
> +            printf("No data\n");

What is this "no data" for? There's already two clues which says that
there's nothing to print, the error message on stderr, and the non-zero
exit value.

> +            exit(EXIT_FAILURE);
> +        }
> +        return;
> +    }
> +
> +    /* Per socket measurement */
> +    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
> +          socket++, cpu +=3D physinfo.cores_per_socket * physinfo.thread=
s_per_core )
> +    {
> +        if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )

Here, you deal with the error return by fetch_dts_temp() first, then the
success, but in the previous block (cpu=3Dall) you do the opposite. Also,
here the success isn't even in the else part, but after. Could you
choose one style to be consistent?

I think I prefer to deal with the error first, so like here.

> +        {
> +            fprintf(stderr,
> +                    "[Package%u] Unable to fetch temperature (%d - %s)\n=
",
> +                    cpu, errno, strerror(errno));
> +            continue;

If we got an error one one package, aren't we likely to got more error?
Is it worth to keep trying on the next package?

> +        }
> +
> +        has_data =3D true;
> +        printf("Package%u: %d=C2=B0C\n", socket, temp);
> +    }
> +
> +    if ( has_data )
> +        /* Avoid inserting a trailing line if we have nothing */
> +        printf("\n");
> +
> +    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_cor=
e )
> +    {
> +        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +        {
> +            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - %=
s)\n",
> +                    cpu, errno, strerror(errno));
> +            continue;
> +        }
> +
> +        has_data =3D true;
> +        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
> +    }
> +
> +    if ( !has_data )
> +    {
> +        printf("No data\n");

Another "no data".

> +        exit(EXIT_FAILURE);
> +    }
> +}
> +

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



