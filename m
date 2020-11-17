Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2F2B6F2A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 20:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29255.58569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf6va-0000a6-5n; Tue, 17 Nov 2020 19:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29255.58569; Tue, 17 Nov 2020 19:46:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf6va-0000Zh-2F; Tue, 17 Nov 2020 19:46:10 +0000
Received: by outflank-mailman (input) for mailman id 29255;
 Tue, 17 Nov 2020 19:46:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lsz4=EX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kf6vZ-0000Zb-7V
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 19:46:09 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7845435a-e6e8-4aaa-a58d-8e7731568280;
 Tue, 17 Nov 2020 19:46:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m6so7319662wrg.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 11:46:07 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id q12sm5256327wmc.45.2020.11.17.11.46.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:46:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lsz4=EX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kf6vZ-0000Zb-7V
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 19:46:09 +0000
X-Inumbo-ID: 7845435a-e6e8-4aaa-a58d-8e7731568280
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7845435a-e6e8-4aaa-a58d-8e7731568280;
	Tue, 17 Nov 2020 19:46:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m6so7319662wrg.7
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 11:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=WhbrHOh5eSpBRYHEg/N9n8NuGSwrwc/G6QPCxIY3d7o=;
        b=GJINZe74AIO3LsMz4NPEuLCLOt64/dNnqvA9/+lV8h+n2ZiLUq3+CClnjJtNjvm+m5
         CGpbMCd+cfkhaRg+YFqA5QbTQPfJPuVxpTUsGjDQalpIDfuIXGGYGBuS3arOF7DHCLW7
         p6SzGIVkAusKoW78k00lFqtg0i3uupddXKg3tFa4dQ0/uzPd1T409QYZZh//9IVOsxbM
         dYo1ZS17eV0EqVILT4xMIgybIPAH105+Oh1ANeevC8sz5jy594VzOEwLFiHUtneTo534
         yqUSmRqZF8Vi3KDfqAB1hvdXpDe/F9gB7gWc8b+vhmHTGAanmOfQIvaTw2ZaK1usrqi7
         wLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=WhbrHOh5eSpBRYHEg/N9n8NuGSwrwc/G6QPCxIY3d7o=;
        b=lv69SdCg7mCSkIK+/PdpJW0G8fdgPLYn6R0NKa+sqpOrfH3ZvCmLICZzaaVTd7T5ti
         LQCP/vPxHfwUUJny5s+HrBS5s/MLd3DPusW3QXOzqsl3/EXiXq8R3s8jC52Lsc0RYbVN
         pMFd1ec5f7unuBPl1lCtUpVyNF0q5d8lRRdRbzsbM8kf7IepEoBCAw9H/DAOYqJaaoWv
         FXFcDXPElZQRUtZ+8ltzOqNhXT3PbwkVRjSTi5HgfadjAt93AIgzKTnTa4zW+qSKqDGl
         PgxYrBJ/G2oLcp97JZa5Fq8nyug3xW9W7MWppc2oPVor48IQMEs8oa9km5Lwv+26Q2cI
         pBPA==
X-Gm-Message-State: AOAM533+M89ZrrUG7GwTMmuGBU5DFSjTW/YYRuUVgdDwg1zC1JgMPYnH
	//+lFvhduoXo/EDv+19AWWI=
X-Google-Smtp-Source: ABdhPJxsmC9uOcSOcnMknob71tiENDIwTJyS8x40iGMs+a69olsrp5uWjSEgv0MisZ0dO48QImq7Hg==
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr1113204wrr.273.1605642367105;
        Tue, 17 Nov 2020 11:46:07 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id q12sm5256327wmc.45.2020.11.17.11.46.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 11:46:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Andrushchenko'" <Oleksandr_Andrushchenko@epam.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'David Scott'" <dave@recoil.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Nick Rosbrook'" <rosbrookn@ainfosec.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20201110175147.7067-1-paul@xen.org> <f8393cbe-d32f-9b45-049f-ec67a73e7c15@epam.com>
In-Reply-To: <f8393cbe-d32f-9b45-049f-ec67a73e7c15@epam.com>
Subject: RE: [PATCH v2 00/24] xl / libxl: named PCI pass-through devices
Date: Tue, 17 Nov 2020 19:46:05 -0000
Message-ID: <009901d6bd1a$4a1b97d0$de52c770$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHVuwFKgyCNjAECHbA+TpJefiRY1gJP93B7qbw+PMA=

> -----Original Message-----
> From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
> Sent: 16 November 2020 10:34
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Anthony PERARD =
<anthony.perard@citrix.com>; Christian Lindig
> <christian.lindig@citrix.com>; David Scott <dave@recoil.org>; George =
Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Nick =
Rosbrook <rosbrookn@ainfosec.com>;
> Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v2 00/24] xl / libxl: named PCI pass-through =
devices
>=20
> Hi, Paul!
>=20
> On 11/10/20 7:51 PM, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Paul Durrant (24):
> >    xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> >    libxl: use LIBXL_DEFINE_DEVICE_LIST for pci devices
> >    libxl: use LIBXL_DEFINE_DEVICE_LIST for nic devices
> >    libxl: s/detatched/detached in libxl_pci.c
> >    libxl: remove extraneous arguments to do_pci_remove() in =
libxl_pci.c
> >    libxl: stop using aodev->device_config in =
libxl__device_pci_add()...
> >    libxl: generalise 'driver_path' xenstore access functions in
> >      libxl_pci.c
> >    libxl: remove unnecessary check from libxl__device_pci_add()
> >    libxl: remove get_all_assigned_devices() from libxl_pci.c
> >    libxl: make sure callers of libxl_device_pci_list() free the list
> >      after use
> >    libxl: add libxl_device_pci_assignable_list_free()...
> >    libxl: use COMPARE_PCI() macro is_pci_in_array()...
> >    libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
> >    libxl: Make sure devices added by pci-attach are reflected in the
> >      config
> >    docs/man: extract documentation of PCI_SPEC_STRING from the =
xl.cfg
> >      manpage...
> >    docs/man: improve documentation of PCI_SPEC_STRING...
> >    docs/man: fix xl(1) documentation for 'pci' operations
> >    libxl: introduce 'libxl_pci_bdf' in the idl...
> >    libxlu: introduce xlu_pci_parse_spec_string()
> >    libxl: modify
> >      libxl_device_pci_assignable_add/remove/list/list_free()...
> >    docs/man: modify xl(1) in preparation for naming of assignable =
devices
> >    xl / libxl: support naming of assignable devices
> >    docs/man: modify xl-pci-configuration(5) to add 'name' field to
> >      PCI_SPEC_STRING
> >    xl / libxl: support 'xl pci-attach/detach' by name
> >
> >   docs/man/xl-pci-configuration.5.pod  |  218 ++++++
> >   docs/man/xl.1.pod.in                 |   39 +-
> >   docs/man/xl.cfg.5.pod.in             |   68 +-
> >   tools/golang/xenlight/helpers.gen.go |   77 +-
> >   tools/golang/xenlight/types.gen.go   |    8 +-
> >   tools/include/libxl.h                |   67 +-
> >   tools/include/libxlutil.h            |    8 +-
> >   tools/libs/light/libxl_create.c      |    6 +-
> >   tools/libs/light/libxl_dm.c          |   18 +-
> >   tools/libs/light/libxl_internal.h    |   53 +-
> >   tools/libs/light/libxl_nic.c         |   19 +-
> >   tools/libs/light/libxl_pci.c         | 1030 =
++++++++++++++------------
> >   tools/libs/light/libxl_types.idl     |   19 +-
> >   tools/libs/util/libxlu_pci.c         |  379 +++++-----
> >   tools/ocaml/libs/xl/xenlight_stubs.c |   19 +-
> >   tools/xl/xl_cmdtable.c               |   16 +-
> >   tools/xl/xl_parse.c                  |   28 +-
> >   tools/xl/xl_pci.c                    |  159 ++--
> >   tools/xl/xl_sxp.c                    |   12 +-
> >   19 files changed, 1308 insertions(+), 935 deletions(-)
> >   create mode 100644 docs/man/xl-pci-configuration.5.pod
>=20
> Patches 1-18:
>=20
> Reviewed-by: Oleksandr Andrushchenko =
<oleksandr_andrushchenko@epam.com>
>=20
> (I'll probably review more later as time allows).
>=20
>=20
> I would like to ask the respective maintainers to look at this series =
as, in the light of the
>=20
> upcoming changes for ARM PCI passthrough, these changes greatly help =
in adapting the
>=20
> code for ARM
>=20

FWIW, I believe there is still an issue in one of the patches (probably =
patch #14) which has caused problems for pass-through of multiple =
devices. I will debug that in the next couple of days and post v3.

  Paul

> Thank you,
>=20
> Oleksandr
>=20
> > ---
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > Cc: Christian Lindig <christian.lindig@citrix.com>
> > Cc: David Scott <dave@recoil.org>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
> > Cc: Wei Liu <wl@xen.org>


