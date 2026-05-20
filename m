Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JpPAFuuDWrW1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:51:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E9A58E38B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313937.1583967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgOT-0000B0-T1; Wed, 20 May 2026 12:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313937.1583967; Wed, 20 May 2026 12:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgOT-00008g-PS; Wed, 20 May 2026 12:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1313937;
 Wed, 20 May 2026 12:51:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wPgOR-00007V-H5
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:51:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPgOQ-00GBSv-QO
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:51:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a0dae46-e002-0a2a0a5209dd-0a2a4508e9da-14
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:51:22 +0200
Received: from [103.168.172.147] (helo=fout-a4-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a0dae48-63b5-0a2a45080019-67a8ac939e4b-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:51:21 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 1E1D5EC00A5;
 Wed, 20 May 2026 08:51:19 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
 by phl-compute-02.internal (MEProxy); Wed, 20 May 2026 08:51:19 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 0F0BC216008A; Wed, 20 May 2026 08:51:18 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1779281479; x=1779367879; bh=Jxj4b47lg2
	xi5Nsw0TfkSeTWxLc0RwisqW7frdYveYM=; b=guqbbH7AgGxL8WPIVjyqho33wZ
	5DVVWfngNM7flttNq8DJQL1E0xv2ysnzEsIEKVpRIs869h2v1UC8qFOT6DPpHkic
	54C/B87MxqtBfmQ0pevftSQTSEKeWKZfGKC7A5jF8nHLqWqpAubpAjTtl7kMX0in
	1yPLcqedVTi+wap2Wx83y8zbpQ3MO8CHVIFhUVIIpM3gSOH4xlIeYdO59NhD96B+
	sAV9A4phEv1R86twE4rn+Uag54+HnuoDJY/Y3TN8YqQWfu4htyt/9NKPnOvxpcQJ
	hfVTpI0hs87UwmbwlGb2zDoaobE5RSTwL1oaitAuMizASs2GZ8/iLT09q1sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779281479; x=
	1779367879; bh=Jxj4b47lg2xi5Nsw0TfkSeTWxLc0RwisqW7frdYveYM=; b=o
	idn6j/y5I0yK9UNSJCbJGelri8VrrqQs5MxJ+VlfrFx8I2gM4LaTnfMwoqIS1DRY
	sULKEubT6bCRslxOKKL3jQD/GrPK/7zmmJwPDhgnn7ENOs9589+K4GCgYyqc/Qxa
	49Nll2IEqxNJ0q7Y+4j+TJ8sX6mwsdvIv4njtdmPPAPZbqUafbR/FrafG963sd+X
	Y0MeiAhRa2MuIbj6Kow73/nH4dO8llzlHbtEtunW2IjFUfa+1c/K/WBVBO4N4BZ9
	I6KXgySvHBmku6dBRfS9oUbTruFkPexfBJYtspTgdg0n8KEGJSE4eHhgOAEPSDGa
	RlwBvhSPmNiEx3pAK4Xjg==
X-ME-Sender: <xms:Rq4Nag7dunH4LlK52QCdqRuZPoCN2dRnQJkv3T0yBBsMw5SX2HqOdg>
    <xme:Rq4NasuGoRfxBzws7584pcNOxm3xGf3UYtas37iHBQrafCGkueh3G2GbJ8Dte0PKi
    2xu7Y9WGoa5XIFHBP4CJA3SwuVUX7sgDPQr5PTbHl5kTFHxR2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpefuiiihmhho
    nhcutegtvggurgnkshhkihcuoegrtggtvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepheeghedvueetffegkeduteeuiedvkeej
    ffeggfevffeffffghfetvdelgfetkedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprggttggvkhesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhmpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepughp
    shhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepsg
    gvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrd
    hprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehvohhlohguhihmhihrpggsrggs
    tghhuhhksegvphgrmhdrtghomhdprhgtphhtthhopeholhgvkhhsihhirdhkuhhrohgthh
    hkohesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhi
    sghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhnih
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Rq4NahLRS6RXJM0b9n0u56qSmeUr2EIVk1BdolZxuDf69qDgwKrskQ>
    <xmx:Rq4NajrQI9BzycuNuczjnEIEWUxQEUUOVmzh5BmSNzEELbmEiGvgfQ>
    <xmx:Rq4NanvPtabc9GRkWO1PXkerJZtldcS2QF8vJg9IFdxIkWpEz3InkQ>
    <xmx:Rq4NalIl4FAI020XVeaLXcXD745UZT-Y0qoNmkIfdgmnuZZirynebQ>
    <xmx:R64NatxzoUsANYSZG1oJQfKZjHbz6H4IvLWQi_9yCPhXk8mZ3RUngNlZ>
Feedback-ID: i792e4853:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AjnajP81mqMc
Date: Wed, 20 May 2026 14:50:57 +0200
From: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Marek Marczykowski" <marmarek@invisiblethingslab.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Julien Grall" <julien@xen.org>,
 "Bertrand Marquis" <bertrand.marquis@arm.com>,
 "Michal Orzel" <michal.orzel@amd.com>,
 "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Teddy Astie" <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Message-Id: <b7708cbf-ea9f-4ba1-a93d-3981eacabbc7@app.fastmail.com>
In-Reply-To: <31ee4635-0eaa-41cd-8fad-223fb11cb9bc@suse.com>
References: 
 <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
 <31ee4635-0eaa-41cd-8fad-223fb11cb9bc@suse.com>
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file system
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1779281481-B7D7BDB1-1810D5C3/0/0
X-purgate-type: clean
X-purgate-size: 3595
X-Spamd-Result: default: False [0.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,app.fastmail.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,invisiblethingslab.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 30E9A58E38B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026, at 1:58 PM, Jan Beulich wrote:
> On 20.05.2026 12:30, Szymon Aceda=C5=84ski wrote:
> > @@ -1526,31 +1537,33 @@ void EFIAPI __init noreturn efi_start(EFI_HA=
NDLE ImageHandle,
> > =20
> >          gop =3D efi_get_gop(&gop_handle);
> > =20
> > -        /* Get the file system interface. */
> > -        dir_handle =3D get_parent_handle(loaded_image, &file_name);
> > -
> >          /* Read and parse the config file. */
> >          if ( read_section(loaded_image, L"config", &cfg, NULL) )
> >              PrintStr(L"Using builtin config file\r\n");
> > -        else if ( !cfg_file_name && file_name )
> > +        else
> >          {
> > -            CHAR16 *tail;
> > +            ensure_dir_handle(loaded_image, &dir_handle, &file_name=
);
> > =20
> > -            while ( (tail =3D point_tail(file_name)) !=3D NULL )
> > +            if ( !cfg_file_name )
> >              {
> > -                wstrcpy(tail, L".cfg");
> > -                if ( read_file(dir_handle, file_name, &cfg, NULL) )
> > -                    break;
> > -                *tail =3D 0;
> > +                CHAR16 *tail;
> > +
> > +                while ( (tail =3D point_tail(file_name)) !=3D NULL )
> > +                {
> > +                    wstrcpy(tail, L".cfg");
> > +                    if ( read_file(dir_handle, file_name, &cfg, NUL=
L) )
> > +                        break;
> > +                    *tail =3D 0;
> > +                }
> > +                if ( !tail )
> > +                    blexit(L"No configuration file found.");
> > +                PrintStr(L"Using configuration file '");
> > +                PrintStr(file_name);
> > +                PrintStr(L"'\r\n");
> >              }
> > -            if ( !tail )
> > -                blexit(L"No configuration file found.");
> > -            PrintStr(L"Using configuration file '");
> > -            PrintStr(file_name);
> > -            PrintStr(L"'\r\n");
> > +            else if ( !read_file(dir_handle, cfg_file_name, &cfg, N=
ULL) )
> > +                blexit(L"Configuration file not found.");
> >          }
> > -        else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL)=
 )
> > -            blexit(L"Configuration file not found.");
> >          pre_parse(&cfg);
> > =20
> >          if ( section.w )
>=20
> Seeing in particular this hunk - why not have read_file() call the new=
 function?

This is because get_parent_handle not only sets dir_handle, but also sets
file_name to something like xen.efi or BOOTX64.EFI. The quoted code then
replaces .efi with .cfg to get the path to the config file to load:
> > +                while ( (tail =3D point_tail(file_name)) !=3D NULL )
> > +                {
> > +                    wstrcpy(tail, L".cfg");
> > +                    if ( read_file(dir_handle, file_name, &cfg, NUL=
L) )

I considered calling ensure_dir_handle() from read_file() for the other
call sites, but this would:
- still leave the explicit call in the quoted hunk, so it's a bit
  inconsistent (most calls implicit, one explicit)
- requires passing loaded_image to read_file + changing dir_handle
  argument to a pointer

Happy to do it in v3 if you think the call-site savings outweigh
the inconsistency and the extra argument.

> Most of the churn here would then go away.

The hunk above is the restructure of two else-if branches into a single
else block with ensure_dir_handle() on top. Most of the churn is
indentation.

Szymon

(ACK on sending new patch versions as new threads)

