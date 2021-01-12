Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49322F2A02
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 09:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65528.116118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzF3B-0005DQ-Jb; Tue, 12 Jan 2021 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65528.116118; Tue, 12 Jan 2021 08:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzF3B-0005D4-Fu; Tue, 12 Jan 2021 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 65528;
 Tue, 12 Jan 2021 08:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CJbp=GP=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kzF39-0005Cz-PF
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 08:29:11 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb774f57-c831-40e5-a9a4-bcb10f28a71c;
 Tue, 12 Jan 2021 08:29:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so1501463wrc.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 00:29:10 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id h9sm3466438wre.24.2021.01.12.00.29.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 00:29:09 -0800 (PST)
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
X-Inumbo-ID: fb774f57-c831-40e5-a9a4-bcb10f28a71c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=LTyGPzmr7a6GwIZ7pjvCFIHNC5tz7N7IC08JrjJUCwQ=;
        b=aOCvfMmIQwSRxNmrRZeHfhT8yZuzdOo+MOAB+Pq3G/tvYdzcg/ETTTAa8zCZ1fa5MO
         8nnipp98ZC8YUEajJsVR18DZf+ywkfim5w40xwH9qYCw+5bvqdL0QGQkd0CxIPk0SRqt
         TZq++fSRx7MeP711XvC1qHVVUr+VarG6TFLlUkayXpJJeb2gA3xovzspbXjBGQgVH70G
         fDxCkqrMZcoXDP0UqjXhIZgreoyXj5Kjpci9WrozExZU6sXT5nlYcDlDRJYo3t2955e3
         d/Qw9kApNJWS1D9auZ+8eMjANsQYXyamSW8qhnBVDKAOlKcm/tZeczllQ2BkG05etgg4
         4DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=LTyGPzmr7a6GwIZ7pjvCFIHNC5tz7N7IC08JrjJUCwQ=;
        b=Em9TNVwMoJF7MSb4SEuXNyOwTFiIUNg4zFL0t535NjvIUgtVTXu5wrspFzGviB7H8+
         4YRER5k5CVKczJykmDEFN3mFQ4/2HNR3Od+1rA4gMUmD91v3A/AsQz1t8dMP7Pds36/a
         lpxiiy+2SNhmSk7aB0KhCF/c3bfqsJL+e4JpaBn6J0PJRSoFF0g/L0DgnWOHNLacQgnP
         PpFjJ5aYiHqjjzkSQAAjkP1ooBCLeNL+s61+I37VzyoDcqrp/DL52GTwupBNnRKweZIB
         n5AmgZiT5eciaC4Cxv2hRk/s82e/7ppVA+VtCqvHbMj6907qhRp4DR0JU7BNxqrTbEVR
         cjHQ==
X-Gm-Message-State: AOAM532i7I6PEa2TALpLMaUT+ENBEZmpwyYj6Id+wxnJDmx9UgPC/t9q
	7Le65oe2kyPgpoFZgtmRXOM=
X-Google-Smtp-Source: ABdhPJzjaCtsmtq1+uBQdCV579Zc6ZrCUONDHsEdcCKn1X2wpKCdCFCeQuIiLcqLjQ1jbs9ZjP09hQ==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr2963383wru.213.1610440150107;
        Tue, 12 Jan 2021 00:29:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <amc96@cam.ac.uk>,
	"'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <JBeulich@suse.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	=?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
	"'Hubert Jasudowicz'" <hubert.jasudowicz@cert.pl>,
	"'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com> <20200922182444.12350-3-andrew.cooper3@citrix.com> <001601d69258$4d6a7c90$e83f75b0$@xen.org> <835893e1-fcd0-efa1-86ce-02af70dd1101@cam.ac.uk>
In-Reply-To: <835893e1-fcd0-efa1-86ce-02af70dd1101@cam.ac.uk>
Subject: RE: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
Date: Tue, 12 Jan 2021 08:29:08 -0000
Message-ID: <001c01d6e8bc$ffa46d70$feed4850$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyALWxT5UApWGlZkBspd8Q6mNcwkg

> -----Original Message-----
> From: Andrew Cooper <amc96@cam.ac.uk>
> Sent: 11 January 2021 21:23
> To: paul@xen.org; 'Xen-devel' <xen-devel@lists.xenproject.org>
> Cc: 'George Dunlap' <George.Dunlap@eu.citrix.com>; 'Ian Jackson' =
<iwj@xenproject.org>; 'Jan Beulich'
> <JBeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Wei Liu' <wl@xen.org>; 'Julien
> Grall' <julien@xen.org>; 'Micha=C5=82 Leszczy=C5=84ski' =
<michal.leszczynski@cert.pl>; 'Hubert Jasudowicz'
> <hubert.jasudowicz@cert.pl>; 'Tamas K Lengyel' <tamas@tklengyel.com>; =
Andrew Cooper <amc96@cam.ac.uk>
> Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
>=20
> On 24/09/2020 10:51, Paul Durrant wrote:
> >> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> >> index a5d3ed8bda..912f07be47 100644
> >> --- a/xen/common/grant_table.c
> >> +++ b/xen/common/grant_table.c
> >> @@ -4013,6 +4013,81 @@ static int =
gnttab_get_shared_frame_mfn(struct domain *d,
> >>      return 0;
> >>  }
> >>
> >> +int gnttab_acquire_resource(
> >> +    struct domain *d, unsigned int id, unsigned long frame,
> >> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> >> +{
> >> +    struct grant_table *gt =3D d->grant_table;
> >> +    unsigned int i =3D nr_frames, tot_frames;
> >> +    mfn_t tmp;
> >> +    void **vaddrs =3D NULL;
> >> +    int rc;
> >> +
> >> +    /* Input sanity. */
> > Nit: inconsistency with full stops on single line comments.
>=20
> The whole point of relaxing the style was because feedback over =
minutia
> such as this was deemed detrimental to the community.
>=20
> If I ever see feedback like this, I will commit commit the patch there
> and then.  This is the only way upstream Xen is going to turn into a
> less toxic environment for contributors.

The tone of your response rather proves that Xen is already a toxic =
environment, I'm afraid.

  Paul


