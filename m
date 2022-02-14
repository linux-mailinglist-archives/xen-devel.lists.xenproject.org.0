Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC174B5422
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272393.467217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcsW-0001xf-Q2; Mon, 14 Feb 2022 15:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272393.467217; Mon, 14 Feb 2022 15:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcsW-0001vt-Mk; Mon, 14 Feb 2022 15:03:00 +0000
Received: by outflank-mailman (input) for mailman id 272393;
 Mon, 14 Feb 2022 15:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fX6a=S5=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nJcsV-0001vn-7s
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:02:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31cbfbfa-8da7-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:02:58 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-qdJexCgBN8eI4Ui_ZKo7ag-1; Mon, 14 Feb 2022 16:02:56 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB6435.eurprd04.prod.outlook.com (2603:10a6:208:176::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Mon, 14 Feb
 2022 15:02:54 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::ccff:6c4a:d6fc:3b74]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::ccff:6c4a:d6fc:3b74%7]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 15:02:54 +0000
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
X-Inumbo-ID: 31cbfbfa-8da7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644850977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=UIox7dkw3kSLbAPAwaqHJJZcACHo1M82BL2Dud1K1n4=;
	b=KJsv23xI6afBbp5Nl7qmqbmPnlC/Kg5RKnEBmy6cqQmQ00VubhDGjVf9kLlYO4pDxgtADB
	0RUptty7Eu5EUJclGFn0VXGAWedDlCEeLWRdl/F7W0wvY3c0Pt6boFeqRPSPcMrbemin0P
	pWMPhadiBipVOqt4zY1CCEtWnAzNKAw=
X-MC-Unique: qdJexCgBN8eI4Ui_ZKo7ag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELWah6MMQO05hJg4BPah9Vzzwb4Mr1gW1V36pAXONDKqGL7kP/GMyWLljz0/vsrZ7j2Y5c3mJhjJESov1z7SYL7M6vtIeLYCqYTQSEuPkJIPOo7pmPi+jttF2NNYVrZaLBPxdWtvPSV+lnLELkjK289roeK6+NRbfql05gud6jmspv5GWrU6H0q3EOXCwWvgNIwkHlMW9ZyxY7A9tAdRhFvZuSGRjmy5i+HTYf2RZN3jgUjzuaM3HejeAJWK3my7SCvkWiiU6CSyxiARrMKacGd+PRorz2ordHwkj5v0yU7tKPAVa8XliDrJk+Akn54IKRio6I5CJFwtRfeASuQxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIox7dkw3kSLbAPAwaqHJJZcACHo1M82BL2Dud1K1n4=;
 b=ZOABoM9oti8ypj0hBANedlglXHOIuT24uxPKz9W17FWtZwpoqsSaZ8hRtcJJTEmrVBmhSuc1KhiFXp0PqRPlOczN5qPazH5n8+xvGWA+TVZ5E7EnqTC2u4Xfhlo/GIkkzUDXdctxo2laYIQ5UMgIiHZaUGLoUSo8VX36WGyNmsPPOgQgNELxyDH4x5D1nCGIKfYXoHk4e1yE9G9FSl/1vtd1WqDJFSd8MWFJ/P9sd5/rdmjjr9lHlNj0/v/Uc7E8KPpXVkhhsSrnrPhi4QLtXr8KJd1YbQh5dHeOhnzDq5BOYvwvPVyTUtjITPGt72lEXgpoVVeVXJ+6zjuYmDhjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>
Subject: SecureBoot and PCI passthrough with kernel lockdown in place (on Xen)
Thread-Topic: SecureBoot and PCI passthrough with kernel lockdown in place (on
 Xen)
Thread-Index: AQHYIbPxFY5Kj3bRXE6t4z/dbeVrRw==
Date: Mon, 14 Feb 2022 15:02:53 +0000
Message-ID: <8daad0f6c623a57bc0b047fc2388e8b698135624.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.4 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5409a396-1777-485a-04c6-08d9efcb13db
x-ms-traffictypediagnostic: AM0PR04MB6435:EE_
x-microsoft-antispam-prvs:
 <AM0PR04MB6435DCEA2D691C8CA4A27B19C5339@AM0PR04MB6435.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IgTYsvdWuAncSEEELugARCzz9/oLkxNzCo4JsB/TAsvTGgWgqk+qUw+wa2mZwVSjuWDCxYmJjULHpTt7mkGkEaawxZ8gOeKZ1p1xOYqwQswU5qhZMNrDmFOPpzuhfjb4duJoInPU9LY6yLkqVC5bVqZspYtoeYXYuS6jPqhemlOwtfaIQBDaxlsNhLiuKQjmeWUiK5MEPuzE/2XymQJ9KCS8/oeKKO0flTBEiLN+UTUx0sifO+O7iuibwGFHIgjg+M2IIsSNN3VvG81okqFpxjuGknuEUZmT3Jsl00Xc6F+jm16PGSy3FwF+NrShkYmFbFwWm1Ph7Amv/kfOpHMzFKsWtDqKYj0FYipneY5Ge7oz5zvzJ/M5OrORTg720cZN1D/H7/86bpdY1n2xdRlzYtF2o3epUDhIe9bUyIO2DAD8FR8Z4fHks9PQ75xRe+kUaRIGmgDbi41KeIXOTN1fBOlaE/ZUYjT3rO0yRN1rrEb9eJAxdtJHOfubzdrRlnu3COhBdPIUSDoPofeiADN3gDkZ1TZ+PEk8+uw1PaLLmM4/Za+utZzgS0l9NNLjAreNJ9dY8LOBqKXydbvXU3ysK3QgsyUIjEthZ++Cp1juwfY7XOh5LnYbafJzCGWggYgC46cFcSrthJscKeSZ8Uk9y+mO3X74JwvRb2Zo5p4NNQipLvCzyUpL9CsuXXCuRcSu2uby/eNSSuaMk4RBow7vczUHj/9FKZpL3pl9NdAipgIq7y6VW7vmmW8dlmWKJB19fOgul1WxuM4SFIquDLhsXyJcZv1Cu0lDMzzTRIS4pI4H55uVCGggWWARTuj6czN+5XnHBR4WfSWkhmllS3UzIw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(316002)(6512007)(91956017)(38070700005)(86362001)(54906003)(66946007)(64756008)(122000001)(66476007)(66556008)(66446008)(6506007)(8936002)(71200400001)(8676002)(4326008)(36756003)(6916009)(38100700002)(966005)(76116006)(26005)(5660300002)(2616005)(508600001)(99936003)(2906002)(186003)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDJwSUZUU2dXelBBdDBDaGhOYi9DMTlUaTVPVG1vV3IvdndpZWl2MzFKLys2?=
 =?utf-8?B?WmhyZ05oME1RRG9vT3FSMFVRUG5EdkNmU3lhY0h0N1NqcUluK29OV0N2N1R1?=
 =?utf-8?B?aTZZMG1iVnVZdjVJcDU0S0ROMnlScndEY0xqdFA3ZjVXTHdyUEdSRlVwR3Jk?=
 =?utf-8?B?VUdyazk2c3o1blM5eVBaaGxuTHUraklrL24xOVlhbDAvVEdIWlVGR0Y3VEYv?=
 =?utf-8?B?eHZNa09KZzkwTHZSZ1ZDN0JZb0lLNGZaMG9LTUlnRUNwN0Q4VER0ZTFEZUFS?=
 =?utf-8?B?cU5IUEVYa1hQUHFTTm02L3FpaUluZGN0NktZRE05VEY0UWlsek53b2d3dVFD?=
 =?utf-8?B?N2dvU1pXVERQWm9MQTl6aXJ2S0E2RmlGQ3BCUlF2dnpGVnBWR2p4alIreTB6?=
 =?utf-8?B?eUd3L0RtODJoT0UzVXp4SjJDYmRDaysyMVRRUm1SbXhRNTZOaklaSE85Q2tE?=
 =?utf-8?B?S1liSDE3ekVIbzQ5azJUeTlqMWJkQmt1a1JqSjFBSVpDa1JDTmpxQjFJcm5y?=
 =?utf-8?B?dXROQUxmdi9PdU9LQS9kN3Q1Uk55SUpkREhUK24zbERzY3JXSnZDRDJGMGZr?=
 =?utf-8?B?YlBlMmYyVVRPQjV2RTA3OFg3U0hoRFFBZVI4UFFXRjg2YUJwRWk0UjlHNXBW?=
 =?utf-8?B?bzRsSFpoZEJKbmlYSERGVmJTdGc3cWRXcUljQWlCN2tBTVkyOW1pekk3eFlw?=
 =?utf-8?B?MHBBcU1LNVRmbDZJZDdJWXlidk9MbTIxZzVqNlZtSWNVNVhwa3RUSmRLYlBX?=
 =?utf-8?B?MG1wRHpkWGhnRlNNY0xKTFgvNTNCQlZTbVBlVGFPek9yZjNjYllmK24yRHZj?=
 =?utf-8?B?WVhmN3VHaCtnL0JPZDNKK29QZWViU1NDRHRjZXNRaEVwd0Y1ZXJnR2Q4QjBK?=
 =?utf-8?B?ZVc0MEtTUzFMVkdFczk1TVJBSzNwSDFQaU1VNEFlZTZUbVI4ay9UcEp3WnBw?=
 =?utf-8?B?bncvT3BWcW1KMDYxR1gxalEvcU83NDlEQ29NbytvbjRSVDMxSENRbWNORjFS?=
 =?utf-8?B?am1qLzRvL016UWdOYUJoa3NiclVqU0VLVjlnbWg4NXNPOFFsZ0UvdTJvWmZD?=
 =?utf-8?B?ZmtsYlBxbldLU1IrY3dSYTFmTWh6RlJMTlVMQVUvWWpoeEMrR2NXc043aTJm?=
 =?utf-8?B?ZlRNRVRKdU82aTkrK2ZkbXU1SDRvZk5aa0FmRHhReFFNL3FHTHZ6MS8rSlJm?=
 =?utf-8?B?WmpORzVlZDNoZXdST2ZwWjk5blFrSVBTOWd1ekRLQkc3dkJQclRsUXBoVS92?=
 =?utf-8?B?U0dnMHZLdlR0M1F4TkYvTXRpdnM3SUsySmU3YkZTNUw1WDNQNzdwSWVGSTFW?=
 =?utf-8?B?NGViTERQME4rQ29XNWpNZjRGbklKMnl5ZEN2YkY0ckIrQXlwbDZ0UGVYdjlQ?=
 =?utf-8?B?UlBVbVZMVFh1NzI2Y0NRbmxuWUwzQmoySlgrZmMyR2FoWHlOZFhWbTZsRXlQ?=
 =?utf-8?B?bnE4NDcvbEV4TGhyeHd4bVZ2VXpFbU1uYm8yd3lYcnZVcmNwQUVGVy9JaUI3?=
 =?utf-8?B?UnVTcSt1RVROc1l4bnlhcXdCTFJDakdBdHVZT2tmUzR3YlNaTzg5S1BXOW13?=
 =?utf-8?B?SFQwUjdyQytxWmJWc2hJRkluN1dtUmpHbWcwRyt4Y0RwWWJ3eitRZHhnOS83?=
 =?utf-8?B?cVpoRnFma3FhaXg1WUVUZXNiOCt1SlY3WVd2VUx4bG9zOVFCaVcxTlZQWHJL?=
 =?utf-8?B?ek5nVnVvNS82UjQ2akZkNVdFNmxYUGdCUWw5cnRMeVFHMEFDVzA5a3VYOVY3?=
 =?utf-8?B?cUtSMzg5bFFKT05YNXdaZUVKa0xpT0d4SVJaWGYwTjh1cE0weUwvaXM3Mnda?=
 =?utf-8?B?a0dwSGVSWkFxUTBwTklCdDRyNU1tcVRJREFFZmgxWG1NOEJOMDd6R21hNG1B?=
 =?utf-8?B?N0Z2eDlpY0pSdVN0NGRhRjErSTExc1EyMzQvYXFKaVFsVzFRWFdFQmNDei9X?=
 =?utf-8?B?aFU2ckRaZmJleERib1hNOXY1L1p6VDdQdDdVcXowVHlPd3FOOGZPY3dEMC9W?=
 =?utf-8?B?YStkaWlmN1k5QTdzczJiM1JIOWVKanhJY3NvY1RXcUJDTVozZ1grcXd6eWtL?=
 =?utf-8?B?MlZUbWZPSnJVeHA1ekVzZi9ENjdXSDdmWW4zL3YvZzd5V0hTZzYzbENpOFdU?=
 =?utf-8?B?bWI5bk84WXB2VkN6NjVXaXhwVzltMkFBNEU4d21IcFNRU3FOSFV0cnZIbi8z?=
 =?utf-8?Q?WWc1yflUz8mJ6Yhqu7tdv84=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-o0+UXT5YZwxmdHu4aySw"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5409a396-1777-485a-04c6-08d9efcb13db
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:02:53.9218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9fkIKhhkbRIvl+q8guT5FYD5LcOp0+dKlHgkRWTbuJdLeOa4d+osEfmp1+QVGzsuknxSUGUcdFUM12Bz/NRqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6435

--=-o0+UXT5YZwxmdHu4aySw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

We have run into an issue when trying to use PCI passthrough for a Xen
VM running on an host where dom0 kernel is 5.14.21 (but we think it
could be any kernel > 5.4) and SecureBoot is enabled.

The error we get, when (for instance) trying to attach a device to an
(HVM) VM, on such system is:

# xl pci-attach 2-fv-sles15sp4beta2 0000:58:03.0=20
libxl: error: libxl_qmp.c:1838:qmp_ev_parse_error_messages: Domain 12:Faile=
d to initialize 12/15, type =3D 0x1, rc: -1
libxl: error: libxl_pci.c:1777:device_pci_add_done: Domain 12:libxl__device=
_pci_add failed for PCI device 0:58:3.0 (rc -28)
libxl: error: libxl_device.c:1420:device_addrm_aocomplete: unable to add de=
vice

QEMU, is telling us the following:

[00:04.0] xen_pt_msix_init: Error: Can't open /dev/mem: Operation not permi=
tted
[00:04.0] xen_pt_msix_size_init: Error: Internal error: Invalid xen_pt_msix=
_init.

And the kernel reports this:

Jan 27 16:20:53 narvi-sr860v2-bps-sles15sp4b2 kernel: Lockdown: qemu-system=
-i38: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7

So, it's related to lockdown. Which AFAIUI it's consistent with the
fact that the problem only shows up when SecureBoot is enabled, as
that's implies lockdown. It's also consistent with the fact that we
don't seem to have any problems doing the same with a 5.3.x dom0
kernel... As there's no lockdown there!

Some digging revealed that QEMU tries to open /dev/mem in
xen_pt_msix_init():

    fd =3D open("/dev/mem", O_RDWR);
    ...
    msix->phys_iomem_base =3D
            mmap(NULL,
                 total_entries * PCI_MSIX_ENTRY_SIZE + msix->table_offset_a=
djust,
                 PROT_READ,
                 MAP_SHARED | MAP_LOCKED,
                 fd,
                 msix->table_base + table_off - msix->table_offset_adjust);
    close(fd);

This comes from commit:

commit 3854ca577dad92c4fe97b4a6ebce360e25407af7
Author: Jiang Yunhong <yunhong.jiang@intel.com>
Date:   Thu Jun 21 15:42:35 2012 +0000

    Introduce Xen PCI Passthrough, MSI
   =20
    A more complete history can be found here:
    git://xenbits.xensource.com/qemu-xen-unstable.git
   =20
    Signed-off-by: Jiang Yunhong <yunhong.jiang@intel.com>
    Signed-off-by: Shan Haitao <haitao.shan@intel.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Now, the questions:
- is this (i.e., PCI-Passthrough with a locked-down dom0 kernel)=C2=A0
  working=C2=A0for=C2=A0anyone? I've Cc-ed Marek, because I think I've read=
 that=C2=A0
  QubesOS that it does on QubesOS, but I'm not sure if the situation=C2=A0
  is=C2=A0the=C2=A0same...
- if it's working, how?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-o0+UXT5YZwxmdHu4aySw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmIKbx0ACgkQFkJ4iaW4
c+4xDQ/+Lh9dkdFd5qg1dtn5INAZFK+0azmUPs/RVBrl1hrLRNlWZ80BvgLBDBIc
D8dhgC8m1ZW53XVLfETnlBWSut2EMNbwxMN2f8qL4PmrdCJiFcMVZcojzLTNfvqW
5KMQeB0VN4Up8ul/Ad7ESpjMBcKKgahOg1YwkAr8F2oNbH1pIIYq+FAwu+mVAlD+
WYsP/TfEkBbb0Pv8TxfJq/ai0AyNgVH0Ww/TfXRN6PGCg7LAWzIMtwDDaNy7JZk0
HQFVG7Qdxr8IVzKULcb166eCh62y5HRXcRGLijGgUCny/yHuZpA7CIp+uzSwqAoU
cBOttrh41TC8WdE7P6tMWWgWvqF+W5x+6EFpQKjxHOgT3ybYIvn5FvRxvP6Xa/TM
Nf9bJPXP8q4EDAshzUGlAvnVigZflN3L4OjtqlXcEsWXo9bRCtLpJNac5Mp3jn9s
pGL9r+y9hH8cvFeCvfoEecvu1kVnIeilyoiVSvO3Z6YRyAdci187tpTnOCa24ADr
awq5vq1FpKLI7zpIlWJ++2oK5yxo6wfEuxo/WSNGM00w2a/mqjFaZpFJbkZjn0rf
/CffPzmeDKnXR97Bcz1ghVCS5BsvVyuE6d3DbHa0uLvLIhR31uBsT/cw9edwEUTu
HIt+nQxbd8cr58MHJeIn8VdAXH9TfDAGaqNW/x73JcEKIH6/ANI=
=J9gk
-----END PGP SIGNATURE-----

--=-o0+UXT5YZwxmdHu4aySw--


