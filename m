Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891A4B5451
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272416.467250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd4k-0004h1-JJ; Mon, 14 Feb 2022 15:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272416.467250; Mon, 14 Feb 2022 15:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd4k-0004eh-GL; Mon, 14 Feb 2022 15:15:38 +0000
Received: by outflank-mailman (input) for mailman id 272416;
 Mon, 14 Feb 2022 15:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJd4i-0004eb-Au
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:15:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f52255b2-8da8-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 16:15:35 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-hn29n2k-PYq4HChjpVap0Q-1; Mon, 14 Feb 2022 16:15:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 15:15:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 15:15:29 +0000
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
X-Inumbo-ID: f52255b2-8da8-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644851735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEXMCj3DYSDyqC/ONxWqA1mSUSxmSKF3BwnJoReKvWM=;
	b=ll+mrCx91PZvFoWbZ7ElF/gleCbiaMvg0gwCxz8LweyFBBRT/rEMCOT6/t8mT04fbzaLLm
	D+uleISJdvTAmT3HD7fs7ETZx/iCMw+Eku9Ze9v6p0yiGy16dgZrhZeFDiifkkK2V7MD5/
	FacFz/FzQKttUPgKvxEERKYQZYitZ8k=
X-MC-Unique: hn29n2k-PYq4HChjpVap0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsHL6IoSRczhgSeKozUKAbrPM7Nb67Kqwq0/MMsqkQwKU2ZvEGl5d6rJRvXsGOnl3kisyi0kU+iP+EVfTI+nIQcgHdJVFBhtw+y13+H2fNhqhBCqd9WR5jiIAlSw6F3O34xFG8mgkhOluySap7n7tNATVddjuLbYWlZWnI4f616BRPiw1Sfmf6Xs2MP2XM2/VzcARp865IWl8RN1rvh471SZqOkr42lcdaEGYU4tWWZ9cFqO8+b1c8WfVlMf09OKwtWGUeNKbZEQ2R3//CLSvRTRtpJY7NY8IZv4pcBmZpIYxcdluZbVSvMxzCGrPtKCHDWDeUHvl1fPnULlnGbdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLsVGs84Z5dydf1b5ztBFdYdbymEGxDfTpQ7HTwM0DE=;
 b=XG6ZltovLx3ZyNfS37iD1wrNyr4eXf8DD88RLIOj8+695+F+ioYXn9PkOZlYmuWORNeb7A2dSqNajMWRNEdbCWAMxv2JyC3XKyc9+D8zadXk7vEB0KnLlm6CChvne4CU1xWSqDPiVDUOIGRySOePNGD+PEyAZlcMo77KPjjTashNpDi2QtAIOFK28aXgUVEYbYORKHqTHB0Vu2EnYXDqyXs4ZZlQfgGWAUdka9m1TdWcFpUVflguNuCUj+SVcWIsFkvT1sLENnbQmkksrwMQ0In/ZvAhXAbJ+ZLdjyTLdLt/lG+8KblrFDTOgc+NTqjE0JgstkauYj7Ve7XOrDyZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eea4e9ce-3629-62b4-4c93-efa78fcc5bfc@suse.com>
Date: Mon, 14 Feb 2022 16:15:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: SecureBoot and PCI passthrough with kernel lockdown in place (on
 Xen)
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8daad0f6c623a57bc0b047fc2388e8b698135624.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8daad0f6c623a57bc0b047fc2388e8b698135624.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11aacaa3-c20c-4d48-6903-08d9efccd64d
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7160B2B32B1CFEB969106F90B3339@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ePsL/quWb3HzQba+REARBu0vCw7jAHID1cIqyLJeruTupmwA+nej9kUJY/TvSqldSGrG/a39f0HYNVnHylK6URHAOc92TjZfa9+T4/J9iSZ6j7thjRzYAO1bnMLtQYp7vn4AXXG0MPa/eYj1F+BMYx0BAZ4aLo/hekv0L8w1zOVktGSdhVq8iCZEnhV4Ta1DLBn1vwX81JK+oHG3s0ng7iqhl5N0g+rGV/WLUXjjZAQux79RZ0vVWFS/81/NjzsxZaw7gBW6E7pbeDODGaSc/HwYZr781BofheIoPku2+/bM4pLwQ0Lx51ZZI1kplBbOfYkiAMGsszZ+XEie9rLye/wN+4FkVQAa80bWd9AyWJzqYcNoSihwL0OzFlech2JWIl/LL/qcH31kMrAhuBoHD1ei0C5AKNQ0NEnAzzG1cNh07HbTlkpit9xU7c10LkjtVA3xxWYDfaAAgBWEF6+TCsrIFxD/9U13/Y+/fPBe9K622WDNkOI2c4yZJ8HcGIY2VX1hQg+G5Et2ucqJSepL3DUewhXhRSgeLVl1FvBI5yNMZTbRvGSTcubaTEEA+A8A1IUuKtZOxmlXpHff1/Y/CDV+G4EtQqysGCbI9NlPv6ke31oOcwRLQZ/1mxk+8KcoZVYp8plm3b+R9UM6RLqO/mAQpmUwnN2+PmpC28GxiVDdPn/KYxbJS1t3ZYt+XAoNwuutz9kXLCgUc0DNPGbUb/rDWYT9q08WPq9CkS857wE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(66476007)(6512007)(38100700002)(31696002)(6862004)(5660300002)(8676002)(8936002)(6506007)(53546011)(4326008)(83380400001)(54906003)(37006003)(2616005)(186003)(26005)(508600001)(86362001)(36756003)(2906002)(316002)(6486002)(6636002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gQZTdsT6gW7Leeru4i/p5v/lmNqiY+TGZo3qt9ix9VtkpdmC9CxlKnf/AJVZ?=
 =?us-ascii?Q?VogA1g+L7uTUuJ0wGxM7E4nQeV/I8MfB8VnYQyou4C1MjmwBeQXbid6MXEYt?=
 =?us-ascii?Q?szAFtLJ8W1qZu1dDAnj+Zojd0TuG0HbdJnzTsNxYb8BG+8W2L+0W2tijcThY?=
 =?us-ascii?Q?1R9O7ZfBW5W8llPcaWzxjO9xSyFRWCvI9KtTPYW03CrFGl1TbKj0wqoejqjo?=
 =?us-ascii?Q?835RxY/i2zIAGwerdfSqih5WMjYiGIUb0H/9872kAVV+6smEs/FO+JhzTDhI?=
 =?us-ascii?Q?qAZYxs0y+trJm+fyTSIVrKcQFAsvwx/qFGHVEcy2gOAn/0Pd8q2c/W/yFyDZ?=
 =?us-ascii?Q?/gDmVkHN/E2QeOaMUtyfD338ccHvRtwg2BwvYUPShCmGlsrBqltN6y7TgAT5?=
 =?us-ascii?Q?kaYMZNrXbR6g/naR0skxY3MX1xNGzJbqINpPVzuc6hfYlM1WyD4UOKudGOYo?=
 =?us-ascii?Q?NQD7oL+4yQaSEHtQfn0HrhTgd2QNBAyl72Mnaf9ayiRaGS6HMkDaqRTzcBDx?=
 =?us-ascii?Q?hWX+yhWX3PF3GcnZ9hfLCN4CjHsyPPC4TvnHLO6m0rpGZ0cE2X0qbPN/SaVt?=
 =?us-ascii?Q?m1ngu7mfcIAoDL2dTCZAHDBiW2VNKIW1l1tmjpaiwZV7aDqmgcGy1bbSELU1?=
 =?us-ascii?Q?XSk8DQsxM9ZfDPb2EEt6WHDtjVvucbNLm16AM+hEJn1i2Et813oRkMaSzcKS?=
 =?us-ascii?Q?hEZqhd41ozgxm4zbeSeqlL7EQlMP2sOJgck2Jo+nPqHl6ykRtj9VRsnYAYj1?=
 =?us-ascii?Q?fA9OOqAmGzAGgEe58MBQYwVFwd9IShNkrjnafYQSgaJAoPNo+7rGbFHImPs0?=
 =?us-ascii?Q?32Mw0bL6sAIXYE31Go9N/YwfdNBZCuG/PhlhXIHG3Yq44cdHkewpX0rTvarQ?=
 =?us-ascii?Q?tnnrr3M7LZE+DUgdaG+OM/3r8MFqeqwblBgasQSeKXnsmz1jhViER+dU7aEx?=
 =?us-ascii?Q?tcO8qMRKhR4FTjexf5EZR482N3kY0IJrqGACqIcF6Iva6WJpIGglzHpvEyse?=
 =?us-ascii?Q?jrBnmi3Kk/ue3Ji+bMe5dnJ2fbFt3plI8xRyD+89a8KozaWVPEc30SfXiD2o?=
 =?us-ascii?Q?JWvJl2zGQUP7EyVv29JPZhG7WiqP58K/ZF4761c14F8ET5SqeyBXJVMLhp26?=
 =?us-ascii?Q?B0UJfI8Zl/X8YQ/ZEOLu2/L87M4pEhKDx0sbuIVgkV4GQ99bSIaaJuEAE0To?=
 =?us-ascii?Q?t1sZfx/qdd3CIdQZqux8vp7sJa9C7RpQ3x8zllnVcUFjvPAQNdY6Jr2pU9Kl?=
 =?us-ascii?Q?EwumS8/e/UkzMwZtHOjGmdp0/BdsM3YP6Jn5KSIxI0Jq+YFL0LX8EMtVLKno?=
 =?us-ascii?Q?R1k8QSRRrE2QhFftNk12LShxIs1Sj36KGQ6XVdCla0YYZTr7GMeg5ucrH0Fb?=
 =?us-ascii?Q?kgKg1b4lgPMUmO7RSNkbtcOvaj5nXlzCz1MH6cV4xIuIVXtql1lidjWSHlp4?=
 =?us-ascii?Q?vdedfDrN7KMjLOB/6ahuWIziDQT4+flb4bNFKyNHFjEkCTwEvpxSwzXNBYBS?=
 =?us-ascii?Q?l8zIq93EJZnvGVYqgmvarpIdAxiHIJHHKI1uD3PHrPfjGCq7M+Gvk5Z8nRoQ?=
 =?us-ascii?Q?TamjkONNF0nqcwQLc/zKxjYNzH9jD2oSTGhXzF0XY9P93Yke/3XP5QRj9BHY?=
 =?us-ascii?Q?haT3YKuEb0dlXabSZMXzJS0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11aacaa3-c20c-4d48-6903-08d9efccd64d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:15:29.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReOnZP3NYrV5JgPm8oY5ipHEs4Wj7hflorl4kdUgq2MriCMSUb3cxxIfd3zwbRnQKonjIMabmAJmKJdNncWRRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160

On 14.02.2022 16:02, Dario Faggioli wrote:
> We have run into an issue when trying to use PCI passthrough for a Xen
> VM running on an host where dom0 kernel is 5.14.21 (but we think it
> could be any kernel > 5.4) and SecureBoot is enabled.
>=20
> The error we get, when (for instance) trying to attach a device to an
> (HVM) VM, on such system is:
>=20
> # xl pci-attach 2-fv-sles15sp4beta2 0000:58:03.0=20
> libxl: error: libxl_qmp.c:1838:qmp_ev_parse_error_messages: Domain 12:Fai=
led to initialize 12/15, type =3D 0x1, rc: -1
> libxl: error: libxl_pci.c:1777:device_pci_add_done: Domain 12:libxl__devi=
ce_pci_add failed for PCI device 0:58:3.0 (rc -28)
> libxl: error: libxl_device.c:1420:device_addrm_aocomplete: unable to add =
device
>=20
> QEMU, is telling us the following:
>=20
> [00:04.0] xen_pt_msix_init: Error: Can't open /dev/mem: Operation not per=
mitted
> [00:04.0] xen_pt_msix_size_init: Error: Internal error: Invalid xen_pt_ms=
ix_init.
>=20
> And the kernel reports this:
>=20
> Jan 27 16:20:53 narvi-sr860v2-bps-sles15sp4b2 kernel: Lockdown: qemu-syst=
em-i38: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7
>=20
> So, it's related to lockdown. Which AFAIUI it's consistent with the
> fact that the problem only shows up when SecureBoot is enabled, as
> that's implies lockdown. It's also consistent with the fact that we
> don't seem to have any problems doing the same with a 5.3.x dom0
> kernel... As there's no lockdown there!
>=20
> Some digging revealed that QEMU tries to open /dev/mem in
> xen_pt_msix_init():
>=20
>     fd =3D open("/dev/mem", O_RDWR);
>     ...
>     msix->phys_iomem_base =3D
>             mmap(NULL,
>                  total_entries * PCI_MSIX_ENTRY_SIZE + msix->table_offset=
_adjust,
>                  PROT_READ,
>                  MAP_SHARED | MAP_LOCKED,
>                  fd,
>                  msix->table_base + table_off - msix->table_offset_adjust=
);
>     close(fd);

I think this is finally a clear indication that it has always been
wrong for qemu to access hardware directly like this. I see no way
around replacing this by something which isn't a bodge / layering
violation.

Jan

> This comes from commit:
>=20
> commit 3854ca577dad92c4fe97b4a6ebce360e25407af7
> Author: Jiang Yunhong <yunhong.jiang@intel.com>
> Date:   Thu Jun 21 15:42:35 2012 +0000
>=20
>     Introduce Xen PCI Passthrough, MSI
>    =20
>     A more complete history can be found here:
>     git://xenbits.xensource.com/qemu-xen-unstable.git
>    =20
>     Signed-off-by: Jiang Yunhong <yunhong.jiang@intel.com>
>     Signed-off-by: Shan Haitao <haitao.shan@intel.com>
>     Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>     Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>=20
> Now, the questions:
> - is this (i.e., PCI-Passthrough with a locked-down dom0 kernel)=C2=A0
>   working=C2=A0for=C2=A0anyone? I've Cc-ed Marek, because I think I've re=
ad that=C2=A0
>   QubesOS that it does on QubesOS, but I'm not sure if the situation=C2=
=A0
>   is=C2=A0the=C2=A0same...
> - if it's working, how?
>=20
> Thanks and Regards


