Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54829892D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12070.31607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyWd-0004NQ-75; Mon, 26 Oct 2020 09:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12070.31607; Mon, 26 Oct 2020 09:10:47 +0000
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
	id 1kWyWd-0004N1-3j; Mon, 26 Oct 2020 09:10:47 +0000
Received: by outflank-mailman (input) for mailman id 12070;
 Mon, 26 Oct 2020 09:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzuJ=EB=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kWyWb-0004Mw-Az
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:10:45 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98f4234d-5ca6-400f-b652-5e3911cac795;
 Mon, 26 Oct 2020 09:10:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mzuJ=EB=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
	id 1kWyWb-0004Mw-Az
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:10:45 +0000
X-Inumbo-ID: 98f4234d-5ca6-400f-b652-5e3911cac795
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 98f4234d-5ca6-400f-b652-5e3911cac795;
	Mon, 26 Oct 2020 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603703443;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HevSUfVx9XCXw/IdnyXHaf9pc4s6R+rAi24K/Zi/YGc=;
  b=iNslXG1gEV+kUlpreTv+lMiUM4yT/kuwEMaCgyd4bcwqAnoq/unnkwav
   veTZyUdosj83++Fd6vVfALN4u3F6fpTX5K1kEanWkDrq9Ty28WmyW2ozX
   Thbw4RKD/MUxFYJkRHOYgUAingFNASCPotcent6JSbcqRshlTr1W+FkCC
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vqMUyCHM7t8wSMwvlHwbADC6KYBn9TFQlQl/MlwqyGA+ZM+vynPP059l1XNlSluWDwOFHUrmaW
 FxebGTlfjIOy93nw60hd1nMB7LD0279QZlJjpCUuuEU78xSncF0ucloS9oxtSe+l5wtjIbM2hx
 wRoH6noqyxMrLJb0tM3ddQIcFgGut4Qyh+oW9FsrT9TZjikeZv/I6LHDEit7V+OdhHrxtqwdCh
 5gEPiMifAFz5Xu8Id1DVROfsyi6QU4DUo20L+6zx0LkJGUn0FEKLNgjOT98lqglwQIVYtHS0cK
 VDQ=
X-SBRS: None
X-MesageID: 30097165
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,417,1596513600"; 
   d="scan'208";a="30097165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4TX4h+JTKpQhsbQiTn+ukW7g3bIu1hwRVXW9YGm/5VdZeTSZeNB0x4wlpp1PpBCasSzaNeNB2KEalXIjLfoNhw/JYpsrIJ9ID5HvUsG1aesUv29j7+uLGSRs9MkvwuJWuwLdTTQzHBBYwiitiP3RklhJU1vCMu6i15cxLmsWGlBCCtDO6/XCXKqwdQB37tVU8mYqPaBsEaPd33pLeudb6ZIvNGGxbgNluKlJBh3WFrPTLZajvmG1UJbwD8g+ue9U9JVEmOXbmGNG05iyVL3I3k2bZ1UXFjoWMyXUo6IwtP0rZSHA9C9x/pw5PfDSlfErzSfxoGnq+K7CznTqdG3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/atUr40ri/lRe6qjuIsDEbw5SZZA1YqUtnpWhxjBcY=;
 b=L2e0gDfPY/ki4ghwWZkfSApjB7Lj9o5hhEqQK7ullEANTk5UDPXOH4WKVLjX2R9SE2IKm6wQq9CeEFRtLAFuz8XAsGUS3cNxSH/XNcnTzX23XAwSJBk1GxkEfx1ffo83eHAxrgdDveRI/vqpbI8Fiyo7qSHM0eE0uTUFggbgZXG306EvMNQie0F8rp+ZWPbEZevLMVESSdy2CI0sDAeNHLZEYF6Xaw0M4SQ3pC04nBzFclpXyymQuWKOjupPXEN/fI/OxKYuNLPa+WSqseHIywT6pjVy9RLC+qutkIph8CZjm8PkvmVIrqGZUzjsXywIXf/dmz4a4ARku81zWQa6TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/atUr40ri/lRe6qjuIsDEbw5SZZA1YqUtnpWhxjBcY=;
 b=j3dKAA0GTh3Jtx6GUCkdZ8LhbhqWour1QPFfUR/hZsTKsft3X8sNzoyf8w7LfzLjiMNSpSvME16Uaa0O0BAz5NedXEgCYAVIY2wHk/WkYBl501hHC3iBkmYYAt0LVr8+6FGpnsYHeGF4eBtkkcJZxD5F/PPPc0BgpPSBEBH6+Pc=
From: Christian Lindig <christian.lindig@citrix.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Anthony Perard
	<anthony.perard@citrix.com>, David Scott <dave@recoil.org>, George Dunlap
	<George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 00/25] xl / libxl: named PCI pass-through devices
Thread-Topic: [PATCH 00/25] xl / libxl: named PCI pass-through devices
Thread-Index: AQHWqVjZZk7XivGQQ0yHJO5ww7Ae8ampnK5M
Date: Mon, 26 Oct 2020 09:10:39 +0000
Message-ID: <DS7PR03MB5655470EA654923540585C9EF6190@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <20201023162314.2235-1-paul@xen.org>
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5e1fb6d-48d9-47db-16c8-08d8798f01e1
x-ms-traffictypediagnostic: DM6PR03MB5051:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB5051BB6BCD1CA6361090D79FF6190@DM6PR03MB5051.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3V4jUNZeoc9XI6pgpLKYw1095w8tPvq2h2GZp6sfdgUE1SVerrx+fVIHBjmXu5LDuL9wfx8XJbEoiYdfGZt+RW/Nh/SKMb0nEgCGAjxebY4atxTzbrh+LS5YRbmo8IK+MZAJk+PqKoAOCZyhsrQlUAO+cu5IeeiXXQGHOK4AwoBV2uAK84UjarRoh2suXUiKx870/i63TJS4jIj0jc09yVdrzeR+lQgJLzhWOQFvXU2gZJ26ffSYEbs1CYPYBHQsDG8WpP5P4m00udkxMakEub0v5vf+36TSgjdx2oPuoCVGnx7ijLPEW2z03bCCiu/t
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(55016002)(8936002)(9686003)(66946007)(316002)(26005)(2906002)(4326008)(33656002)(86362001)(54906003)(64756008)(478600001)(83380400001)(76116006)(110136005)(66446008)(44832011)(66476007)(91956017)(66556008)(53546011)(5660300002)(52536014)(186003)(71200400001)(8676002)(55236004)(7696005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7VKYMGYGbFLvi5jgVpl2Uxchhiu+LatOHH34GAk0mzSROuH5NccqrrA03Yd7KkHD53Hc3c34hzKG7WgQk3uXPMej96oR+VUIqrWFVPwgI0Mw2CbIwxk7JgRrxFy9YC1qk3J/TJlnIFS9Yz12RKXH65i/lxPwWILOBvbdR+Yq2HA120jM5CN/P6x4XMR0jN10NJI2+W2vPZr9b7JNKqnDt9++6Odvj9apIyyYw7tJ8379+j49Gcpmp7xxu9cO0chpDYqdRfXoXSg9Y86Yq+KlGWQyGHnISOfTV6MOP5dXeEAslyNpRObTuVxoISURaCexTrqvkszwQprNPii+x+MJWRGvd71vnsBzm9i2WnB24Ch7bCZj9QtKFjOrcluxt889UWtmeY2Pq4WLH1rVGDBwSd9HmuQRQcjXg3SITwf/vAmML3FE5Cvfii5WPq/YW/FgzFqVnY42Wqcu12qNijmunBU4L/UkMV3l1R3u8TNGCv+rfbyX3bg/9rd/oKBdsdwK9044mrrC8FJHldTwGnS+hzG+Q8mZodgQyzAmiag1UcNBTV2PTfEY/TuZPOmsJqWc0hgMQQkiQVUyZGRqtfQIzS9pBobKna3eGL8Mjama4hBygkzzDaRMWXp9nmrPy0rUF9x6rzMHTci1UAYCbVgvTw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e1fb6d-48d9-47db-16c8-08d8798f01e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 09:10:39.0543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjpqLgsau7cLyfgTNqQ/fJ9YQhKMs8YpPUbN1tNGkB2qU9i5I3R4gfCbsLnVKBcctpmkFNNRBp7q/CMJUPCXdj9tPOZ+CriUINYYhinqal0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5051
X-OriginatorOrg: citrix.com

> NOTE: The OCaml bindings are adjusted to contain the interface change. It
> should therefore not affect compatibility with OCaml-based utilities.

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Paul Durrant <paul@xen.org>
Sent: 23 October 2020 17:22
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant; Anthony Perard; Christian Lindig; David Scott; George Dun=
lap; Ian Jackson; Nick Rosbrook; Wei Liu
Subject: [PATCH 00/25] xl / libxl: named PCI pass-through devices

From: Paul Durrant <pdurrant@amazon.com>

This series adds support for naming devices added to the assignable list
and then using a name (instead of a BDF) for convenience when attaching
a device to a domain.

The first 15 patches are cleanup. The remaining 10 modify documentation
and add the new functionality.

Paul Durrant (25):
  xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
  libxl: use LIBXL_DEFINE_DEVICE_LIST for pci devices
  libxl: use LIBXL_DEFINE_DEVICE_LIST for nic devices
  libxl: s/domainid/domid/g in libxl_pci.c
  libxl: s/detatched/detached in libxl_pci.c
  libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
  libxl: stop using aodev->device_config in libxl__device_pci_add()...
  libxl: generalise 'driver_path' xenstore access functions in
    libxl_pci.c
  libxl: remove unnecessary check from libxl__device_pci_add()
  libxl: remove get_all_assigned_devices() from libxl_pci.c
  libxl: make sure callers of libxl_device_pci_list() free the list
    after use
  libxl: add libxl_device_pci_assignable_list_free()...
  libxl: use COMPARE_PCI() macro is_pci_in_array()...
  libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
  libxl: Make sure devices added by pci-attach are reflected in the
    config
  docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg
    manpage...
  docs/man: improve documentation of PCI_SPEC_STRING...
  docs/man: fix xl(1) documentation for 'pci' operations
  libxl: introduce 'libxl_pci_bdf' in the idl...
  libxlu: introduce xlu_pci_parse_spec_string()
  libxl: modify
    libxl_device_pci_assignable_add/remove/list/list_free()...
  docs/man: modify xl(1) in preparation for naming of assignable devices
  xl / libxl: support naming of assignable devices
  docs/man: modify xl-pci-configuration(5) to add 'name' field to
    PCI_SPEC_STRING
  xl / libxl: support 'xl pci-attach/detach' by name

 docs/man/xl-pci-configuration.5.pod  |  218 +++++++
 docs/man/xl.1.pod.in                 |   39 +-
 docs/man/xl.cfg.5.pod.in             |   68 +--
 tools/golang/xenlight/helpers.gen.go |   77 ++-
 tools/golang/xenlight/types.gen.go   |    8 +-
 tools/include/libxl.h                |   67 ++-
 tools/include/libxlutil.h            |    8 +-
 tools/libs/light/libxl_create.c      |    6 +-
 tools/libs/light/libxl_dm.c          |   18 +-
 tools/libs/light/libxl_internal.h    |   53 +-
 tools/libs/light/libxl_nic.c         |   19 +-
 tools/libs/light/libxl_pci.c         | 1072 ++++++++++++++++++------------=
----
 tools/libs/light/libxl_types.idl     |   19 +-
 tools/libs/util/libxlu_pci.c         |  359 ++++++------
 tools/ocaml/libs/xl/xenlight_stubs.c |   19 +-
 tools/xl/xl_cmdtable.c               |   16 +-
 tools/xl/xl_parse.c                  |   30 +-
 tools/xl/xl_pci.c                    |  164 +++---
 tools/xl/xl_sxp.c                    |   12 +-
 19 files changed, 1337 insertions(+), 935 deletions(-)
 create mode 100644 docs/man/xl-pci-configuration.5.pod
---
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: Wei Liu <wl@xen.org>
--
2.11.0


