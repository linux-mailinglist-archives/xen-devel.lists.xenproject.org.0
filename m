Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A28A6E5AD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 22:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925999.1328864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twpKe-00064Y-AV; Mon, 24 Mar 2025 21:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925999.1328864; Mon, 24 Mar 2025 21:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twpKe-00062d-7k; Mon, 24 Mar 2025 21:27:40 +0000
Received: by outflank-mailman (input) for mailman id 925999;
 Mon, 24 Mar 2025 21:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zDv=WL=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1twpKc-00062X-9W
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 21:27:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f403:2612::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda2535c-08f6-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 22:27:36 +0100 (CET)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DBBPR03MB6841.eurprd03.prod.outlook.com (2603:10a6:10:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 21:27:32 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%7]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 21:27:32 +0000
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
X-Inumbo-ID: cda2535c-08f6-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xln/W8wirnFTvhPQHJ/dNpHcpS2zcW/hHt+Oddt7SGdazb0CtrZxB4m/dCG9IsXZQLQmZEdNvruxsNfAmXkxv+QnIbLeEdcRb7T+N/NiRH1cSGKGdni/xi3idDAIfYtu+3V4lbSjvM9GrsmUiDnl+tfqWK2qitio51zesG66NgUVcuzDDVbbg+lBooe3D+jmpyVeFHRWgdgIuxK8oTAUrkXlfxeikt709K6SSWGFcouBK7KpJU/NlNva7FpECSeC3MjQ9N9GNqD6kmN3LlyJ+8R3JgZaVWcPdQ0KG5jI96cjsWc2sGCM6ppst8EhWyKIgIt73VKA5FC2K7w3E6/5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1xVWBhIyB1zYZ4W4+MNstvj6SC91Kwn/Qzovo6iCtY=;
 b=ypDbXjl0aACgvmMfMoQ4IoBaWP83B0MdW5VxBI4Eg8uxA3JPN3CAO8872we4S/XQsZZfTDdJ3MDvcXMW9/HUQ8YKdIkrBCtd+zeV/WJWMuJ5Se86HjPWb3mOTDlDbMnK7wDSzuJKLJIlpAPHXGp39HW+X4YQbykf6GMsg3oBdrHgkiajsuYmoU7sTWU1Ibff2SifMiAjMu1aOBtpfw7J6PUK7jgQZ2um1ISiQiYCYneSRQidlCSiz6vBpnIEVFtCPwefQ6GD/tTPWknG4SiuuHd2rGKRX+rdJ3kvXhO+bwVmb0wTzBRkWRiulDbu7d8l1BjnbWfeOR4fd2p0+9vT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1xVWBhIyB1zYZ4W4+MNstvj6SC91Kwn/Qzovo6iCtY=;
 b=eeQGNmfDWzteX96e4yhmyVVhZR9zhuur2eoaR8prJnz8ip0/Mhei7VGb/svLHNV0xq/hzZRDRIAfi2eiuQPR65p8WEVqjxFQx5Zr7MxohXGVBYDDsCKGsP68Lu8Uj7vnxQyM9eNvjHtpSHEEs5wNBP05IlPOQmFStU8icbF1JmcKigAoiy5B9MQEr9W0rmUAGtcnlUK1PugjhaECM9C/lXShjlOe+FPRfkBs1ill7PeNlaDqmiGsUesixCctxKckE+85nyBeQmJmEuOkYLNJMiJA3bwnGEQgDQR/7YMh7QNcQrf2axQIw08YJsVkkuRqrrSuSWuoslwZTe1kXVTzMw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [RFC PATCH] xen/device-tree: Switch back to dt_unreserved_regions()
 in boot allocator
Thread-Topic: [RFC PATCH] xen/device-tree: Switch back to
 dt_unreserved_regions() in boot allocator
Thread-Index: AQHbnQONSMLBGwvKMUWMY6fOky1K0A==
Date: Mon, 24 Mar 2025 21:27:32 +0000
Message-ID: <20250324212731.1702255-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DBBPR03MB6841:EE_
x-ms-office365-filtering-correlation-id: 57b1820b-6860-4be0-e7c4-08dd6b1ab01e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?M6smeElmD9wKqH375GZEF1g9bTiT2f+ACo1x7pywdeB9uKp/qkxsrh82cH?=
 =?iso-8859-1?Q?YSNGq3AZr6fQTCbvdRoiMm22rWIkrzrPd8KLxsO1xR/bSwW05PDwpFid9v?=
 =?iso-8859-1?Q?8k20LNyECs0KEIRHRCSbPqRH4qM+AuDHavlkGLiRkuYrUnpGBo4ha1BJnZ?=
 =?iso-8859-1?Q?HEkC5xZVbNFS7rbFalSNF6zXSWE07Q3EuFPU/tLSuUL/DsMm6GflqRn3ye?=
 =?iso-8859-1?Q?EuMQdJUjSMZxNmWU4dvGynEIvtIl5cZ/fQ7phj6nhbR3gA+fwjBCU1jHEI?=
 =?iso-8859-1?Q?/m/mO70bB3tKyioSCueHvuzNID4m8FHn7UsQrIf78GagUd6fn0k8ThsKx7?=
 =?iso-8859-1?Q?G2g6OfoI1RxuPkmaLGxDhlqydmUIeKIDY3BSQU5iC2ilpEIz3Rsp0zgnfA?=
 =?iso-8859-1?Q?I3Lm4SZU1glFt9v8eWeHMd0RvCWJza1RP7Vu/pbPxt8TYgwkIf23ykvIo2?=
 =?iso-8859-1?Q?eLXMqWSJZu+95yuUK8nXfAuEyPENKQHUmDgA1eIrwfILpPJYPl3PMWCIrR?=
 =?iso-8859-1?Q?q3gjsCvqIFEFJCzFzS0mfqqMi6h55Uj75GheJW481VNy24EKYruVFIpiH/?=
 =?iso-8859-1?Q?1g0d4EAukjnUxRExrPRrxEajC7JLVO1d7O6tsHluSibsTx8tfAE9SW7rhy?=
 =?iso-8859-1?Q?YLsTEWeMGV7oAMP629aUTQpARgr1kQMUaU4S9cxO5laLeDUsUr+Gda3R48?=
 =?iso-8859-1?Q?QM5w+muBcGrepfOoz9l9+vTJl9M/ShNt4yF9feTBbzEPpkr87tUszcRT2y?=
 =?iso-8859-1?Q?tmC5ifksFocwwteImc1yDWgjHs2q9fQpcnoWLbuQ7DpYRA5o6aJDzstoGX?=
 =?iso-8859-1?Q?+IN1D9TZy1iGwZ1fZsoljVJolNxuH72qIKGhcqExyBAAS4nT0sRuvdOz2V?=
 =?iso-8859-1?Q?3Ruu4KbMXIA1bBvWNIP6/vvMekYqgyzTsnTxh7rz5lDNQjtkeEGxSgqCIP?=
 =?iso-8859-1?Q?mv4IK1helnqToU2+AnWQzQ5z6uhhAFmmzpZava6EipDD5CEE1MtCTuNmft?=
 =?iso-8859-1?Q?L6yJjIXXz2QE07JJB7WBwYdzb2AWz0bY/asXFsohpuERuEL9kEr1+ESJvJ?=
 =?iso-8859-1?Q?1/1i71SWqV+kOteUlo0vhrx3pWygnweO9zXLVWMTY1i5z26ff3D2uGMbUY?=
 =?iso-8859-1?Q?+UlVfVgFbpJoXEw9dcZnPipr5rOzYQjEBFXjlrUsyOFZfLZw2E1YX4WGeQ?=
 =?iso-8859-1?Q?BbLK7jnyFlsFnPBCPgCBjerNpgUsaqCn7kEflP3p6NPpg87WMhEP1F14HZ?=
 =?iso-8859-1?Q?il9OPif88wZt1mDONdObogk270OKHmTgRdFRA2iuvcocFR3oFfUimludqs?=
 =?iso-8859-1?Q?Pl1Da20kOe/EaLk+/K+PnBn6rWUhJgRSkCpfwLP+9DN8tvPePGz267haTW?=
 =?iso-8859-1?Q?vDg8qmgzlirWC1cV9J6bdXBDYi3CF5wBhlJYZmRmpy2JzirR40QW+yxAQq?=
 =?iso-8859-1?Q?ytYPOaQUrhpSxFpGW5SSEFDu2Zn3JR2vINCAfF0KsIFNB9vW06ynxQH0Y4?=
 =?iso-8859-1?Q?gT4LvQlKwWkacHdXiNs6bX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2oTpXYY/lV7uwhWUDTjzDd8ciwACncoj8/nflKzNVZQiFY+N5GVulEA4ym?=
 =?iso-8859-1?Q?8Pp0W7SsqjsWv+6CWJYyVpdYjQebVGZf3dn6YtgBxYZ3v7w/K9ZTAz1eCJ?=
 =?iso-8859-1?Q?SBQEN+oSMGEiG0YNhcTZJtKbuwOi5DrtSBBokD3+1ZILFJvNYtirT4iEFY?=
 =?iso-8859-1?Q?YDdHvCRKzV/PTL+3ZbFCzt2N2qliOwoUWKa+F70TYTCztc6KGmzxkIT53m?=
 =?iso-8859-1?Q?PGsbLxDzu6DmzFXA1UTde6s04WdsQCBizqcJcoaci0OesKCX9/PdBOKG1+?=
 =?iso-8859-1?Q?GelRdXqESepVf8iZe04Hnvtvq6q/d+V/QwbcCtIW96OLg+4IJHW4kDITXK?=
 =?iso-8859-1?Q?NbBDW+CvyCNkyOVL/u6dEJBIaJ5upyNfb3xegeRnII6TYB5/bUrI3YzvWw?=
 =?iso-8859-1?Q?03LWSVXTt6/+foMjHmNON0dqNdzuMfj3S7qdLbBByhbm18I/O0h7kvopdG?=
 =?iso-8859-1?Q?Nt9Z+DeC0wYq9BbGLgOl+eBz7JSHhkbr4PXrMaITC4/HERX8sM4VqfjmJx?=
 =?iso-8859-1?Q?UBzD5Z44tNQ4SolJCFdX9U88ZTLtEvr1MXNtNxSeFoaSJntdsS32OtV2p+?=
 =?iso-8859-1?Q?nKOW91B45s3dsbShy4gVoVHAf9JGcRMA5VYRP7NdJLNEymi7G1N/XTm0FU?=
 =?iso-8859-1?Q?cnkLMMQLXdnfBtmas5hl4RtEPIIL4hQChTQQdr3yQ9ksFQ4YckFwAial+B?=
 =?iso-8859-1?Q?VP5qXmP6uOnS7SHoBD01j2qVbCYSulKHZZVlrVnLjp1/Y2U6DNCBaf7mGT?=
 =?iso-8859-1?Q?hjqlhw9oK+pDURbN1Ce+naoIAO2nDj/caH97m7BCTimzOf7DyFKrnLCVAB?=
 =?iso-8859-1?Q?QZIk5Yi0+Wrl+HukoV6mfUwIJQNc1d/fJCHGcf782iizBqZD2WhMX1z/aC?=
 =?iso-8859-1?Q?jzvvKcLjGa9ID9obrDukLcAqW1B6VM02xAwZCQGseKhrXjnUSw2WlclW6S?=
 =?iso-8859-1?Q?Im1cL1+vhixKSruwRhyOmgAofoMqaVF32vLeUHbkGbpcBBy2tDEtyDXmu1?=
 =?iso-8859-1?Q?kOu3iqr3dA87m2iJw1lv46eO2hCjzTecRCD04qEi1wV9WtzKG3PCci2doE?=
 =?iso-8859-1?Q?wPzjGc76DmWGQZWzZMT7qwCWsP3Xl5nWJV4hTRSKCO9lAigwY0kdplQTqO?=
 =?iso-8859-1?Q?sgtreSWftWNQhwExmiOs0FtcVooDweTFwoU+7mTkUIACr97QX7DjsbyOs8?=
 =?iso-8859-1?Q?EDj0QjO1IJ0B0sz/xuRgFw7DXaDEKcP5i2FwmXoezW1Y/vr82uXLXiXs1k?=
 =?iso-8859-1?Q?Rm9kt0yT+/2l0Cd/4kSiju8jZHkXqO29bC03UvlKFhtYua/8lvmRsRhFvR?=
 =?iso-8859-1?Q?GEe82yuMyc82zmCDr4/7nRoffTpkC769DPfgcrXZk5MBhb2AZ3x7QUofJP?=
 =?iso-8859-1?Q?HB0qlGLYI3lutCYCbXAcrc0F4F/OIGenP6UBOzjrj5fzlh2PBoyFhvGvPZ?=
 =?iso-8859-1?Q?4bGleHmn677viQ2otkIlct/rh9rlIPfbMWYtWqgo4wCY6d64VJlFSWvVb4?=
 =?iso-8859-1?Q?jTA5DCLzvasISjYuHmAB1tTPR9fswriW4FSYldhgQ3kXmsz8J511AzqsEg?=
 =?iso-8859-1?Q?oPhL5kDdMcZm+dtww/P0R7CWYiZJxRDZbFd9bC/oyasIES2sx+krxp5laj?=
 =?iso-8859-1?Q?QxS4Z7b3NO6PeRpsCpwAPNa4IiW4FDgWFk3KGJAglyvkJBv3/kLN9goRAt?=
 =?iso-8859-1?Q?nxfs12iYXoW05u5qYTg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b1820b-6860-4be0-e7c4-08dd6b1ab01e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 21:27:32.4337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Es1zSVxxXHqie3JplRd+QGIKxxF6lZi9rLzpTa+CQfTiAGG66WUSE8Y3zuTbL+EkmQL6zlCBsO2FPPjADPHlPqPBO2F85JKtboJDaQfJigQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6841

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

