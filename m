Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22BA74E8D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 17:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930939.1333457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyCbr-0004RJ-TD; Fri, 28 Mar 2025 16:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930939.1333457; Fri, 28 Mar 2025 16:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyCbr-0004OL-Pm; Fri, 28 Mar 2025 16:31:07 +0000
Received: by outflank-mailman (input) for mailman id 930939;
 Fri, 28 Mar 2025 16:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xT9D=WP=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1tyCbp-00049v-TR
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 16:31:05 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazolkn190120001.outbound.protection.outlook.com
 [2a01:111:f403:d001::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09f5854d-0bf2-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 17:31:04 +0100 (CET)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV3PR02MB10209.namprd02.prod.outlook.com (2603:10b6:408:21e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 16:30:57 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 16:30:57 +0000
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
X-Inumbo-ID: 09f5854d-0bf2-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6JmUu/Hqs+frGhi/fJ3DguzQY3OpEsdgo/1IlK+Q3XsoaspjPWB6FD2ETktWRSQ/sU0nRJNoevv1Z5YVhBxV+9ToDDHyZ1ht2siY7LKS0Hyv5CFX9u+E3AYXfHEmTeKJZYBS1x4lrM0mlUvZeodrEUqL+f89xbjYntqrX68lk8YnXz+kgaT/tmejJRuDqPTOsFRIhTKS/lpAp7t5N4ltPifgMHEtDUoEy9I5Fwm+BSvJGUot7P0Zmq0ZWT59OTncK2p9bfvM2pOjZr49nY9yejIL7X7i8PenEAqgXwDIimxbOjRo/R2awsrIxEZ1hhDTcy3CsAxRHY+Zeq9Yfhxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKfPkJWqqtna9YgBxWWb70kH76Gv5EB8a2uCVkpzmGM=;
 b=xEpPeBj3yVGPrS4HjlK9JbVoQGFxsWTJeMJL/u0YKoQDpAzaixddVJz80UI5h1FMVDl2BXsdelHBhuQl+4YeSqTqL5RQ2A+e4OtTM2bQ1hx4zr9WjSc9CxZB09+KuifXVkqnjz0DVdqzW6GoKXe8fK1uDCU20lieJazFRI/CzTSsBmP7FzioirSB2dacELAhOsYM0cx0gU8pMcQcBycrhSBm9sd/b9CNnPkB2bWAe6TI6nyCN8w981gv8KZav7HpF8DsiPTJumJ7WkH9V78fNJu8DRLMsWIZdb0vxJ7YeP+q0IFaQK77SJHoU8YfyZkv/adUthZrf1vZx+0LXYixlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKfPkJWqqtna9YgBxWWb70kH76Gv5EB8a2uCVkpzmGM=;
 b=qwMZkS4uT4BA7NOVwrkrlP62A0H8/nWVVUQgjsnwMjZNJKsiQh5kVdfHfQYBZRF0iaGDmxKBWBY2z9DXi79581b3dm5zUE3520UIpeXlisGYJmWSqFmX5JvVQs/QeTN/KD/oo+/Dsr8LFko57VO+fig6goB/sg4xzAhM9emNY10HuKgNIJN+Pt54mt+S9FCxepaTGoo6QzujVD3alf72VjcZkYGzlQwuu8a1VI8KP5dFR0A7zM721oDrefzRwHkkXWAxxc9RpKWtai6pTjOSn2jISz2cGjp+EfErgCBsYTEh1NDtI3nSA3qL3vZ9Be7mcxFJ8sHKx+XIu6th/XMXXg==
From: Michael Kelley <mhklinux@outlook.com>
To: Teddy Astie <teddy.astie@vates.tech>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@vger.kernel.org"
	<linux-mm@vger.kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: Allocating SEV C-bit-cleared pages (without relying on swiotlb)
Thread-Topic: Allocating SEV C-bit-cleared pages (without relying on swiotlb)
Thread-Index: AQHbnyKPeCLT8FgtS0qlE8WmAsket7OIu/hA
Date: Fri, 28 Mar 2025 16:30:57 +0000
Message-ID:
 <SN6PR02MB4157AFE96ADCA3D504909FFAD4A02@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <b16ec2d7-4a84-482f-b875-d7c152facab5@vates.tech>
In-Reply-To: <b16ec2d7-4a84-482f-b875-d7c152facab5@vates.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV3PR02MB10209:EE_
x-ms-office365-filtering-correlation-id: 25cbc120-57c0-4dd9-a8c8-08dd6e15eb5b
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|15080799006|461199028|440099028|3412199025|12091999003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?O1DDhA1dGv5CV/809zFqC40jwS6IHbERt5RRaO/HQl6tEjZuCoZd/Bp7+tI7?=
 =?us-ascii?Q?E04lscUt7jIszTZKwlZyY+VZewNRaoTTeHiLcX3NFV/TV8zl0f4A0mvRR/wm?=
 =?us-ascii?Q?6sa4/tqsHYh4SvMqufU1UzUK30Jp1AgiadL/UpHQpmxytWDPM2cwM9MXaHXg?=
 =?us-ascii?Q?lNIj739AMiDE6szoVNUwDK+t1i9G8rqMj8+LokKlmjT4VrLmY77/m69/pAu8?=
 =?us-ascii?Q?6+SVli7HxE2EY1yfncf7yl9f2D3MNTPq1Z7fC4fl3xjYklaGvs8xDZ0nkdTl?=
 =?us-ascii?Q?O+OmAsuHcewFXfJ7auWol5sTnlSJPIZlU1FTtQRnQih02YyO8FU5N61QHrkV?=
 =?us-ascii?Q?duGmhx7sY3dsJPwrR5/YnT8fmbZuJ/3dYld+YjQPMsvgrHGXcMBfy/+MvG1w?=
 =?us-ascii?Q?TfGL5AruIhyRYuLKvsn9oXS4jVH10W6dPstxOFyvrbau6kMWwiHB4WS9zw43?=
 =?us-ascii?Q?Tv4FhV6RtTGlLjGY66nd/MhGjBfQHZwPhQ8fi2JlX2Zf9H1PTiR2/tRNFFnw?=
 =?us-ascii?Q?TM7zOwrDdslfES2sDjlD8FZ/ttcgCJ+7iuUsyQQNBD+LiHEPZPIoobewmOVF?=
 =?us-ascii?Q?j3bhbC1hAPCB+D6JNksf2fN9DymsNJPvxC5sVvv0BqyU+5ZYNAkY+MdqFh0u?=
 =?us-ascii?Q?92mU6heOjXTgn0bWR0NDxaL6/FR8GF3ZRZojIreY3EDq3nTKgxtGR6paDwAs?=
 =?us-ascii?Q?0lZ/paWIyTTQHXqVM+LNdPHe3h4IMZ7GUt/T1ph15X7c5Blab+MnYjWtS0Cw?=
 =?us-ascii?Q?krDMuup6SKa45VCQ5L0tWvkJCkJHW+paWqDjGJ+BsIty3C+Jw62Dtrf3pwdI?=
 =?us-ascii?Q?UeEBlKj8HqbRyZC1cmt6GloA9QBt8U2V+Ehufrok1zAhEGjQurk4+w4aq552?=
 =?us-ascii?Q?wgBrEH4bzdr60F2LJI3B8Y4pgMBmskRkVZxdHSngWpSHeudyQpwgHWdtMz3L?=
 =?us-ascii?Q?O03uQZgJOmfXP/SzQ6iLJ5/7uklXblfydmVZEmlwn+PkK2T0U4k+mHg7DYh7?=
 =?us-ascii?Q?VKAN1IzoXFFSVG7sclXhY9rMFzCZX8n2qQYyjgdPdfGtBx6uqnDq3ShbVFsp?=
 =?us-ascii?Q?F2XCL6trQBgU4xCV15iYIB9yeBzBkkK8LbcEdLh+87+vwZwa2j34EZWP1ZFU?=
 =?us-ascii?Q?UVtSMumlJ9yo?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QauGjtUi7yRbM5De0W5mbr7xev2SJvEcOhT63ic8DU+EH487u1Gv+vD5pw0Y?=
 =?us-ascii?Q?NE94xoxux554nOg/p4+MPS2QCvrl8H4YimSTqF7sI6r9mulxIRJCRtmg2haE?=
 =?us-ascii?Q?SXEhRcKSf+DIalnwJ+sudX0kZ5XYBtJtyBWH9cLGJL2cIG/yFdxRKNgDdxd2?=
 =?us-ascii?Q?7jXnRKPUOmKejQNLcDgu/N+w7d4vxBDHwWbRzVX8nc6VJGk5vmIyjT9aahwE?=
 =?us-ascii?Q?JJQUQ7uxeCV8dtnyj122riqGbbZtSccm1dgSXnnO9s4rNOXIoPUl5SimpgdV?=
 =?us-ascii?Q?vD5mEK9hMI3sPbXuaqurm9PfqO7wpBZyJVT6gz5etO5TdiscqYMtHtvulIa5?=
 =?us-ascii?Q?trbDl3OGpClW5LUtPkG3VMUEvJlbNFOq8ZtWs+WcWp28t9NhxYYGwZ6RuCdt?=
 =?us-ascii?Q?CP4LUYVwo6/K0Wx2vOP45X3QBFcN98BIDqwPE+eZDOFu6iw25gRgzkCGx7hB?=
 =?us-ascii?Q?FdrmdIlXTwEIND/VncnGDbqBPbXZ5G+QBJQx4kVm+tolaTFBmWK9HGthW+cl?=
 =?us-ascii?Q?T/yfp1RuoNahIfSg5LjThaFoh9ydwkWQFPx0RJw0vvqORHJIwosvhNbJqW4l?=
 =?us-ascii?Q?by6SrgxiMgZ4gl49Kqov0Pa7Uo+O47Ru7K9LFL8tiyrr5SoAy85o8BbtDdUx?=
 =?us-ascii?Q?tMjHVg8zgImrcG1tEhtfFaE0p7XTU9cWS2re36YPfLWYiSkz+j+/jfzu2+cl?=
 =?us-ascii?Q?hsRttIVXwD8DZf3oX6aN9lTSjJfuCa1KvP0QDwsdpe5nrGTt1+xqPSBTYJ2z?=
 =?us-ascii?Q?ju770j03cm0+FLagfaFD77BMMHYofA9sJeOiKNT1HrrFPekkV7oZk+EPU/XY?=
 =?us-ascii?Q?0k5koUBCJasnY8l7OONCkIW+yWyxIKyTT8J0LykS//J/f69XZ0JNTAeAB+Ad?=
 =?us-ascii?Q?itq+Bk0Q+ryQtPl50+aMcr8Nzev2C2LEVw7lmlZ0L2pRYtrkmHFGA3BxoszH?=
 =?us-ascii?Q?25s+o2L7rSy538hHj+ejdLBmQURJ/dHnI55pU9nITfnssY+HpoTiqwTnbo3X?=
 =?us-ascii?Q?uUy0zifqJ70GjCRmUy0RAM/ST9mTocsrR+/xtIRcC3ivocGLFSdeXOqY/ltf?=
 =?us-ascii?Q?jM+7I+hBIq4uhLLQSh1Aw4RlMnz8EGKIrnzZuEtxLfislqI0Qrrk+BXzpyqd?=
 =?us-ascii?Q?HqIeFmstivfvN80/OvzLyqxNpeHOo2gsr82fWH+lsx3C0Y0njpzCugrLmTUg?=
 =?us-ascii?Q?gHVEhe0R17j7oV3zINvnjKKr23pxFkM6DAN73/iP3/kVewPFtHnhyrFprFQ?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cbc120-57c0-4dd9-a8c8-08dd6e15eb5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 16:30:57.7903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10209

From: Teddy Astie <teddy.astie@vates.tech> Sent: Thursday, March 27, 2025 7=
:12 AM
> To: linux-kernel@vger.kernel.org; linux-mm@vger.kernel.org
> Cc: Xen-devel <xen-devel@lists.xenproject.org>
> Subject: Allocating SEV C-bit-cleared pages (without relying on swiotlb)
>=20
> Hello Linux mailing list !
>=20
> For porting Linux code to make it work on Xen with AMD-SEV, I need to
> change the allocation of some pages to use "shared pages" (C-bit
> cleared) instead of private pages (C-bit set, which is the default kind)
> as these pages needs to be shared with the hypervisor/Dom0.
>=20
> Is there a facility to allocate pages with C-bit cleared (and if not
> running under SEV, just allocate a plain page) ? Current Linux code for
> SEV seems to only rely on swiotlb as access to shared page is mostly
> made through DMA-kind devices (e.g virtio or emulated device), but I
> don't think it is the best approach.
>=20

For allocating memory that can be shared with the hypervisor,
allocate memory as usual (with alloc_pages(), for example), then
call set_memory_decrypted() on that memory. This approach
works in general for Confidential Computing (CoCo) VMs,
regardless of whether the underlying hardware is AMD SEV-SNP,
Intel TDX, or ARM64 CCA.  If you are running in a non-CoCo
VM, set_memory_decrypted() is a no-op, so you can call it
without having to check whether you are in a CoCo VM.

When freeing the memory, do the reverse. Call
set_memory_encrypted() first, then free the memory as
usual. Note that if set_memory_encrypted() fails for any
reason, just leak the memory instead of freeing it because
the encrypted state is unknown after such a failure.

If you search for set_memory_decrypted() in kernel code,
you'll find several examples.  See drivers/hv/hv_connection.c
as one place where code for running on Hyper-V follows
this paradigm. There are several other examples as well.

Michael

