Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443F893EB5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Apr 2024 18:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699926.1092400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrKAZ-00045x-Uc; Mon, 01 Apr 2024 16:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699926.1092400; Mon, 01 Apr 2024 16:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrKAZ-00043y-Rx; Mon, 01 Apr 2024 16:05:59 +0000
Received: by outflank-mailman (input) for mailman id 699926;
 Mon, 01 Apr 2024 16:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2p3z=LG=huawei.com=jonathan.cameron@srs-se1.protection.inumbo.net>)
 id 1rrKAY-00043s-Nc
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2024 16:05:58 +0000
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c8c5d4-f041-11ee-afe5-a90da7624cb6;
 Mon, 01 Apr 2024 18:05:57 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4V7bNH6t7Jz6K7JS;
 Tue,  2 Apr 2024 00:01:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id EB0981400D9;
 Tue,  2 Apr 2024 00:05:54 +0800 (CST)
Received: from localhost (10.48.156.172) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 1 Apr
 2024 17:05:54 +0100
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
X-Inumbo-ID: b8c8c5d4-f041-11ee-afe5-a90da7624cb6
Date: Mon, 1 Apr 2024 17:05:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>, Bernhard Beschow
	<shentey@gmail.com>, Thomas Huth <thuth@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, "Anthony
 Perard" <anthony.perard@citrix.com>, Ani Sinha <anisinha@redhat.com>
Subject: Re: [RFC PATCH-for-9.1 08/29] hw/i386/pc: Move CXLState to
 PcPciMachineState
Message-ID: <20240401170553.00000ba3@Huawei.com>
In-Reply-To: <20240328155439.58719-9-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
	<20240328155439.58719-9-philmd@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.48.156.172]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 28 Mar 2024 16:54:16 +0100
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> CXL depends on PCIe, which isn't available on non-PCI
> machines such the ISA-only PC one.
> Move CXLState to PcPciMachineState, and move the CXL
> specific calls to pc_pci_machine_initfn() and
> pc_pci_machine_done().
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

LGTM as a change on it's own - I've not reviewed the series
in general though, hence just an ack as an rb feels too strong.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


