Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3EA6F3CC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926365.1329210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2UD-0006FW-QF; Tue, 25 Mar 2025 11:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926365.1329210; Tue, 25 Mar 2025 11:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2UD-0006D8-Mc; Tue, 25 Mar 2025 11:30:25 +0000
Received: by outflank-mailman (input) for mailman id 926365;
 Tue, 25 Mar 2025 11:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFHn=WM=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tx2UB-0006D2-Sg
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:30:24 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8758cedf-096c-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 12:30:18 +0100 (CET)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by PAXPR03MB7999.eurprd03.prod.outlook.com (2603:10a6:102:21e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 11:30:15 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 11:30:14 +0000
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
X-Inumbo-ID: 8758cedf-096c-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwgJXTdcc3bSJ9Ldk+HQ1SCWXqJ85JIxythW+KqVsgcpPUNeRWBQYg3XPTE/5Wq+sxxHoTJKvwIkiOOuS58Y37Kn27XY0v5VMDFYFQPQupFDcSFx8lZIKHt5FSgZPGGCxSLMJ+f4p/3NytpS3IiW45mH6QEzXrHtVqVJ28xusCtumjYUkpegVozjMRRMIAZff/aN1Vj1QEFlLxqHaJt3Z8G90SyJiom8osEmEyNYGGBdlxtY1q7/Q1k1eJMZ5C3O4kzSSO0Z3PN1nzcrazbJK0GW35kLvXpjCfoYQ67R8QR47HLNj8hHjEWu0fXsQOVJ13h5m6YnYID5mJKpoTPPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1xVWBhIyB1zYZ4W4+MNstvj6SC91Kwn/Qzovo6iCtY=;
 b=WKXnPJHz5JanrP5fUwVSNHYX2LqlhVhjhxCJDBfKsGJyXGn7SMRziR7JOUdzeL9nA1Ohd6G03+r2JE6YavV3JIn2J2elaYpuSXwScutDugUEYMSNHxlREk/OL2jr7XnW/0GJDdUotteOPrhsgi6XjDSCfOuehE2VMULuqsyNyphVIASd6ciGXc84bEQ2DMXzl/oGn7c1kM+kiSa5b7AIKRxYpOfr/lANGEA/A/v/PvkpylwHf5FZsv4hor7Ksqj7y4FsjtZsMgRNlFzz9ylXDV/5TOSGwKkdLTciH9vyrJf24EcCz2rYoKceFgos8RYoLYoTxAoY3kFsIY11AajXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1xVWBhIyB1zYZ4W4+MNstvj6SC91Kwn/Qzovo6iCtY=;
 b=WT1Te/WcEquvlVpP4iq68JnL3wcji7NfYpSRolKxtbiTZN9OASth22qkcpmjsNRO7XOXAoDoKLKU6qg1TUmAQxeYtSmvpkiqt6VWrrXrQ9JFxU4YAw4s9lfEvbsFwOuIvC/sM79n94pKlb1CiTJ407RwJ0nonCahLbkpYBNYWXFwE7J55IfBr0j/H6FvVaE0QITg3JacaBCq909SoNbm+8ZD+8ETgzxgzMmDViK8iSd3FTIP+AaV5WinVkcHyPvttuJf2pVYCguMaRfBTE1F0l8U7V1GSlO0tav9DLSmUN9yqS/XwqLGzfBZVdguQJOp82JGc8rmpBv32uUonjspeg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [RFC PATCH] xen/device-tree: Switch back to dt_unreserved_regions()
 in boot allocator
Thread-Topic: [RFC PATCH] xen/device-tree: Switch back to
 dt_unreserved_regions() in boot allocator
Thread-Index: AQHbnXlHnsoSPQvjtUi5zku8ytw1yA==
Date: Tue, 25 Mar 2025 11:30:14 +0000
Message-ID: <20250325113014.1945518-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|PAXPR03MB7999:EE_
x-ms-office365-filtering-correlation-id: e4a2b349-8d6c-4a53-2e9f-08dd6b9069b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UOiIRuqXZO2+v3SKM6WNo8kvklepT1WwwrFah5RQDzwzhlF+2NRyyADEZ/?=
 =?iso-8859-1?Q?z5+4ggC4y3etre2a6qfnpJeE1/MtYRcZ5qIWNE9hNDDoqWjfaoEaRGz2aV?=
 =?iso-8859-1?Q?GDx+WljJsd4MycFMpq3Ij/m6nhcM2xBm/TzAKclf7voABCa/POUVEHrX0Z?=
 =?iso-8859-1?Q?jBfFftuWYy9b/wA9XiZROztHS6i6l6VOQDFKVvybZd20n0/dSzILl4N24t?=
 =?iso-8859-1?Q?UVIHALVPufsZeg1g+/w/F66JR9Q0jg/qgDXaiaHAL8Y2cwjwWuQoOj0luc?=
 =?iso-8859-1?Q?1M8A2cW4cDdbFHffQ1QvNgf+hIS8jc/QSJ2pHsnbb64EH/D9pT1+Vo0rcw?=
 =?iso-8859-1?Q?ch3Eu9Zngz+fD12Zj9xHnTW/l+OUo/FogGt3+DDg5ayPo8b6JJ0kakiWKv?=
 =?iso-8859-1?Q?hkCc1/bEL8lXNRmsOqF6L/Zubs5j+9yl1XaFVvYF8uTF2KRHGeqJ6OdzYy?=
 =?iso-8859-1?Q?XzmOvKJboTVZM0stZJ8QjaPy82ClY3o46XKfAzZU2jXC9AzC2youpLLrpi?=
 =?iso-8859-1?Q?h/ufyw/rSGo9NpqCx954lnfvFG1FTUhvItUoOybrM1TfNxKtd2HyBCv6M2?=
 =?iso-8859-1?Q?BnoGeSoNHZIVvdtfKaP+yEdhCGJjkJ033Rs+D2Y/Wobb34J7XqgR4nJUYU?=
 =?iso-8859-1?Q?CDhz5TRZeLr1hrLy4Z/miCwtHzYH48N2dcfFVVmXXhYONZdhdnzu/Wv72i?=
 =?iso-8859-1?Q?rWaPXWX5syMGAzAkKj/O56oZFpxEuV91nHdYf3jNZCB3G5r/hQBtPwUS/j?=
 =?iso-8859-1?Q?+5sYuoNZpxk6d9GwZ5teNytf9KSzFF548q8eqODQ0ySQvG3CBhhUX3rX4s?=
 =?iso-8859-1?Q?WfnLeFMF/OV/MR4Qv7G/bipiuxHUKabJJibJ11/yIVmH1Dx776Sk+70Iwu?=
 =?iso-8859-1?Q?at/OwbD9iLw8S1/5GIhw+03iqGTX+XPChjgxGKkr3rEkrTjKjcX9fmjoAZ?=
 =?iso-8859-1?Q?JqWVuKB74ngWqfCPBy2jaPn2+8X3EVB4yxzjRqalAIAp9g6VhFSvtOaJ+g?=
 =?iso-8859-1?Q?b7flvHgsK3WeNRtPBddQdQDDOtmRww4CMo43D1+JoAc/Uo0sjnjF2qigaU?=
 =?iso-8859-1?Q?GUpIqDqY1hEsApHNqv9/lsyFUQCAT9KQY0AWluvJukeGSKeUDMb4+RPeY4?=
 =?iso-8859-1?Q?mv2xWXDahvIN0KIr8dG6952hvKaDdpyUWTepMXZxr/qyb6Au1M4yT4hgv7?=
 =?iso-8859-1?Q?V58H7U0V+c69P2NrGNt0oC3wzHaMP0WAvW2Vf2fpFPQEIHA4FPNjjpg0nE?=
 =?iso-8859-1?Q?VeOHOiuscPkpUeiWWb/mcF/kbXaXIm1ZD67TMoy6hUn6ixGYvV7CZhNx6n?=
 =?iso-8859-1?Q?aBatjGPlYcOB7OuGTXwFKMfOUaimA1+5zsbF+SvsUiGQzaq5T0eoD70hGu?=
 =?iso-8859-1?Q?pM0kwQD6BBd67gyKzFyuAJZwAtg40RQrxz3WJjIGbq68W7RcNJts8NZal0?=
 =?iso-8859-1?Q?gWt9UEd602f+W6z1NZHKxAXHdo7MzQA1TTwSboq9T5w5qxrp/6tgbtvGpt?=
 =?iso-8859-1?Q?uDI/H5hpXQfZfs6at3q1dIaV8VgqNZ7g+qUsv3TV+pwe7RYi/F+RM7P2+U?=
 =?iso-8859-1?Q?Otxvvfg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Y7r6iQ2MBTXdn8THnzUA2X3kRgUwz/cLNW4nJeQ5WWFrZ9nPoPVm7WJKAW?=
 =?iso-8859-1?Q?WPMAVOsfifayWGKqRMBQY/dLTh0xfoXmm0eb4A7pYjVbuHaCnA2uWWY46k?=
 =?iso-8859-1?Q?+gqpeWtt45/JS7F90Jsb+WSASR17/MPL8vvk95959tbIjVHtTQ7t+Na9F8?=
 =?iso-8859-1?Q?hNmGQAAR1RFVLQLRtyG562la2/l+WvZ2fesp4tTDZCocTnj+fmZtgiQ7Eb?=
 =?iso-8859-1?Q?hmj906ra8LiiOBbbViI/r09ooSkHFtXLT61Zxm7r5x7UV1w7l+qXi1xeUK?=
 =?iso-8859-1?Q?5P5yvRpQRYKemmNOJN2VUjUt2VgbLhC6U/3C54ZgI19MANME44c7ETK6Gd?=
 =?iso-8859-1?Q?jn7fAYhN3s07ayNdKUtMLWBWMDw9cFvtoUG1w4uDD/ALM7e9Ip6BlyGDlH?=
 =?iso-8859-1?Q?3p36j2AuGzYpAycK0h6efgTjX3H57MEGa5mEZwW93KHZMEsZadOtrceLLl?=
 =?iso-8859-1?Q?eAh68S1LpuUxlDX+hISK2JmMVsJvE3AACjipm8/0bwAMD5yh8Jgt3RoOMO?=
 =?iso-8859-1?Q?38/wxrYh0F9Rp7TujwzXhAWxgJAm6cBTl4nkrellm2ozcBL9bfUh0AYff/?=
 =?iso-8859-1?Q?baHs1txbbptpj+aXbF/HxiIJ/bCurv0arvht7ucYQdY6U1SbT5eRQ2/D3b?=
 =?iso-8859-1?Q?V6DBHZniWFJn0PMN7RcjOqt8oUp/U8/M6b0L4Z2/2rrBv2ZvzmVOmbYVge?=
 =?iso-8859-1?Q?NNA1bTl80k4s7bXV1KvLUPRaXLeVv2qoOyLG3tvS8s2y5SfKNla2/sXHuh?=
 =?iso-8859-1?Q?AXNo70+A7pbsRIUBrHLoZ4jz0PWX+F6PS57dtZ8X6gbhj+DczjY71mVgYv?=
 =?iso-8859-1?Q?UxMMPTFe51auSd7+rl4BogfnFoJOqHbopoH0tC8TcGbue6eHFyo0Lg5vS7?=
 =?iso-8859-1?Q?kWIPiom+1kPEcRi1CFyBuigNaHOnUhvl5k1oCZpAN4Hr1sFkfnQXEjCsvs?=
 =?iso-8859-1?Q?0GySwPCMuvhgYtuKea3670Oyn5ggOLSToFzrMkruC9IT76ks3dkf+ngJRd?=
 =?iso-8859-1?Q?X7GL0thlU0EeoACdX6aUEbcgmwzcUJN0+7A9g5osgWiVQRrDKGln5tjKnq?=
 =?iso-8859-1?Q?CrIWWPtqvw0plOXyTn+M4csZUNL+aAAslMiReyZnKaFuWnfuHeiNq7Iwuz?=
 =?iso-8859-1?Q?blHm0dlus7kcmxTrZQHUeNoJNnGPb9w+pCGvjquRKYmXjfU/OknVG9On4H?=
 =?iso-8859-1?Q?k4fri+W01G1Pv3unHOU1XE0mZpR5ekre8AkiP/MZUNnrj/4rIHj3eYb3oo?=
 =?iso-8859-1?Q?tlvYjQ+EEpQtPEn8mBNfHSWPg1ahueTzIkK2CW2auG9kNH36Fty6/9v/BU?=
 =?iso-8859-1?Q?nZ/CeyBq1u239jWV71pHSS0wnY1xr40Adt8wZQrWKJrSA1kgUA36WFnc+d?=
 =?iso-8859-1?Q?vQwXAX4rJqFu2tjW2Z2AGuQsC5GCscjEIo13JmgM7EIkmkPMXDcB+SFBfb?=
 =?iso-8859-1?Q?yF4LntFSQrzlsdw4YmTRRryKnKjA/jx61vGXFxx48KNos4j+6DxlpX2pyD?=
 =?iso-8859-1?Q?wy02NmkTCHI7rFI0NcieEOaVnJfYvK8gn3900OIghGie/NigqGqQskxCCY?=
 =?iso-8859-1?Q?+MD4tIn9FoxXZDo8Dk1SjblzvLwlM7L+ulOpNyqasTCd5ngRdGZe270VCB?=
 =?iso-8859-1?Q?N0MS77xwSPvRKfmQSGpqENV3BndU3R2cUCQR9NslhYY3+oADYqlSzJ5Bo/?=
 =?iso-8859-1?Q?exQhCFd2xV2gZ/n8oYs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a2b349-8d6c-4a53-2e9f-08dd6b9069b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 11:30:14.8740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oksyXl95INCrITkON0GGGiGfaPBYVam9LmLFexoHsyysxLx/d0mrB9FJKyK7Ivs6wcFhh4Mg+e9jDzIkMwGl/zXDz3xH7WfGdtdL//+WgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7999

On the device-tree-based Arm64 system, if Xen is built with
CONFIG_ACPI=3Dy, CONFIG_STATIC_MEMORY=3Dy, and the static memory range
is provided in the host device tree, the BUG is triggered in
common/page_alloc.c during Xen's early boot. The BUG occurs when
the first page from the static range is fed to the domain
sub-allocator and finally ends up in mark_page_free().
The pg->count_info & PGC_state is not in the state that
the code expects to see there.

The problem is that the static range gets mistakenly unreserved
in populate_boot_allocator() and reaches init_boot_pages().
This happens since by the time the populate_boot_allocator()
is executed, the evaluated in fw_unreserved_regions()
an acpi_disabled variable is still false (CONFIG_ACPI=3Dy) and
dt_unreserved_regions() which should simply skip that static range
does not get called. The acpi_disabled will be set to the actual
value later on in acpi_boot_table_init().

To avoid unreserving the whole region (including potential reserved
memory ranges such as static memory) open code fw_unreserved_regions()
and add a comment.

Another solution could be to call acpi_boot_table_init() before
setup_mm() in Arm64's start_xen().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
The RFC since I am not sure whether the description is precise
and the fix is correct.

Below the dump, w/o and w/ the fix applied. I also added prints
for the processed memory ranges with "OT:" for the visibility:

********************

- UART enabled -
- Boot CPU booting -
- Current EL 0000000000000008 -
- Initialize CPU -
- Turning on paging -
- Paging turned on -
- Zero BSS -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) Checking for "xen,static-mem" in domain node
(XEN) RAM: 0000000040000000 - 00000000bfffffff
(XEN)=20
(XEN) MODULE[0]: 0000000043200000 - 0000000043343fff Xen        =20
(XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree=20
(XEN) MODULE[2]: 0000000042e00000 - 0000000043111f82 Ramdisk    =20
(XEN) MODULE[3]: 0000000040400000 - 0000000042cfffff Kernel     =20
(XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
(XEN)=20
(XEN) CMDLINE[0000000040400000]:domU0 console=3DttyAMA0
(XEN)=20
(XEN) Command line: console=3Ddtuart conswitch=3Dax
(XEN) OT: populate_boot_allocator[475] s 0x40000000 e 0x40400000
(XEN) OT: init_boot_pages[358]         s 0x40000000 e 0x40400000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x42d00000 e 0x42e00000
(XEN) OT: init_boot_pages[358]         s 0x42d00000 e 0x42e00000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x43111f83 e 0x43200000
(XEN) OT: init_boot_pages[358]         s 0x43111f83 e 0x43200000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x43344000 e 0x43400000
(XEN) OT: init_boot_pages[358]         s 0x43344000 e 0x43400000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x43403000 e 0xc0000000
(XEN) OT: init_boot_pages[358]         s 0x43403000 e 0xc0000000 <<<
(XEN) pg MFN 50000 c=3D0x2180000000000000 o=3D0 v=3D0 t=3D0
(XEN) Xen BUG at common/page_alloc.c:1474
(XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00000a0000222ec0 page_alloc.c#mark_page_free+0xe8/0xf0
(XEN) LR:     00000a0000222ec0
(XEN) SP:     00000a0000307d10
(XEN) CPSR:   00000000600003c9 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 00000a0000310040  X1: 0000000000000001  X2: 0000000000000000
(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000000
(XEN)      X6: 0000000000000000  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f
(XEN)      X9: 0000000000000080 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
(XEN)     X12: 0000000000000008 X13: 0000000000000020 X14: 0000000000000001
(XEN)     X15: 00000a0000a00000 X16: 00000000bff3b8fc X17: 0000000000000000
(XEN)     X18: 00000000beebbdb0 X19: 0000000000050000 X20: 00000a0800380000
(XEN)     X21: 0000000000000010 X22: 00000000000be000 X23: 00000a0800380000
(XEN)     X24: 0000000000000000 X25: 0000000000060000 X26: 0000000000000001
(XEN)     X27: 00000a00002991c8 X28: fffff5f800000000  FP: 00000a0000307d10
(XEN)=20
(XEN)   VTCR_EL2: 0000000000000000
(XEN)  VTTBR_EL2: 0000000000000000
(XEN)=20
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 0000000000000038
(XEN)  TTBR0_EL2: 0000000043321000
(XEN)=20
(XEN)    ESR_EL2: 00000000f2000001
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 0000000000000000
(XEN)=20
(XEN) Xen stack trace from sp=3D00000a0000307d10:
(XEN)    00000a0000307d20 00000a0000224154 00000a0000307d90 00000a00002261a=
0
(XEN)    0000000000000010 00000a0000312d38 0000000000050000 00000000000be00=
0
(XEN)    000000000007abfd 00000a0000298ca0 00000a0000298000 000000000000001=
2
(XEN)    0000000000000040 0000000000000000 00000a00002a5170 000100000000001=
3
(XEN)    00000a0000307e20 00000a00002ab2c4 00000a00002e5430 00000a00002e53f=
0
(XEN)    00000a0000298ca0 00000a0000299000 00000a0000298000 00000a000029800=
0
(XEN)    00000000bffbb6d0 0000000000000000 00000000bfefeccc 00000000beed7ee=
0
(XEN)    0000000100000014 00000a08000b60a8 0000000000000000 000000000007abf=
d
(XEN)    0000000001ad9f58 00000a0000312d88 00000a0000307e60 00000a00002c62b=
c
(XEN)    0000000043400000 00000a0000c01c28 00000a0000312000 000000000000300=
0
(XEN)    00000a0000a00000 00000000beed7eb8 00000000bedbb730 00000a00002001a=
4
(XEN)    0000000043200000 fffff60043000000 0000000043400000 000000000000000=
3
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<00000a0000222ec0>] page_alloc.c#mark_page_free+0xe8/0xf0 (PC)
(XEN)    [<00000a0000222ec0>] page_alloc.c#mark_page_free+0xe8/0xf0 (LR)
(XEN)    [<00000a0000224154>] page_alloc.c#free_heap_pages+0x10c/0x528
(XEN)    [<00000a00002261a0>] page_alloc.c#init_heap_pages+0x47c/0x678
(XEN)    [<00000a00002ab2c4>] end_boot_allocator+0x184/0x1b8
(XEN)    [<00000a00002c62bc>] start_xen+0x134/0x9ec
(XEN)    [<00000a00002001a4>] head.o#primary_switched+0x4/0x24
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Xen BUG at common/page_alloc.c:1474
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...


********************

- UART enabled -
- Boot CPU booting -
- Current EL 0000000000000008 -
- Initialize CPU -
- Turning on paging -
- Paging turned on -
- Zero BSS -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) Checking for "xen,static-mem" in domain node
(XEN) RAM: 0000000040000000 - 00000000bfffffff
(XEN)=20
(XEN) MODULE[0]: 0000000043200000 - 0000000043343fff Xen        =20
(XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree=20
(XEN) MODULE[2]: 0000000042e00000 - 0000000043111f8f Ramdisk    =20
(XEN) MODULE[3]: 0000000040400000 - 0000000042cfffff Kernel     =20
(XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
(XEN)=20
(XEN) CMDLINE[0000000040400000]:domU0 console=3DttyAMA0
(XEN)=20
(XEN) Command line: console=3Ddtuart conswitch=3Dax
(XEN) OT: populate_boot_allocator[475] s 0x40000000 e 0x40400000
(XEN) OT: dt_unreserved_regions[50]    s 0x40000000 e 0x40400000
(XEN) OT: init_boot_pages[358]         s 0x40000000 e 0x40400000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x42d00000 e 0x42e00000
(XEN) OT: dt_unreserved_regions[50]    s 0x42d00000 e 0x42e00000
(XEN) OT: init_boot_pages[358]         s 0x42d00000 e 0x42e00000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x43111f90 e 0x43200000
(XEN) OT: dt_unreserved_regions[50]    s 0x43111f90 e 0x43200000
(XEN) OT: init_boot_pages[358]         s 0x43111f90 e 0x43200000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x43344000 e 0x43400000
(XEN) OT: dt_unreserved_regions[50]    s 0x43344000 e 0x43400000
(XEN) OT: init_boot_pages[358]         s 0x43344000 e 0x43400000 <<<
(XEN) OT: populate_boot_allocator[475] s 0x43403000 e 0xc0000000
(XEN) OT: dt_unreserved_regions[50]    s 0x43403000 e 0xc0000000
(XEN) OT: dt_unreserved_regions[50]    s 0x60000000 e 0xc0000000
(XEN) OT: init_boot_pages[358]         s 0x60000000 e 0xc0000000 <<<
(XEN) OT: dt_unreserved_regions[50]    s 0x43403000 e 0x50000000
(XEN) OT: init_boot_pages[358]         s 0x43403000 e 0x50000000 <<<
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
---
 xen/common/device-tree/bootinfo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/boo=
tinfo.c
index 76d652c0de..e250801d89 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -464,7 +464,13 @@ void __init populate_boot_allocator(void)
             }
 #endif
=20
-            fw_unreserved_regions(s, e, init_boot_pages, 0);
+            /*
+             * At this point we do not know yet if we are running on ACPI
+             * system. To avoid unreserving the whole region (including
+             * potential reserved memory ranges such as static memory) ope=
n code
+             * fw_unreserved_regions().
+             */
+            dt_unreserved_regions(s, e, init_boot_pages, 0);
             s =3D n;
         }
     }
--=20
2.34.1

