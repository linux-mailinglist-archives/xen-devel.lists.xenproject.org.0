Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB761CFB49A
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 23:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196503.1514303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdFpl-0001Qd-GK; Tue, 06 Jan 2026 22:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196503.1514303; Tue, 06 Jan 2026 22:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdFpl-0001Oa-DZ; Tue, 06 Jan 2026 22:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1196503;
 Tue, 06 Jan 2026 22:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D/Hg=7L=bounce.vates.tech=bounce-md_30504962.695d90f6.v1-b1553eb1c00644bcbb88f64e577effc2@srs-se1.protection.inumbo.net>)
 id 1vdFpk-0001OU-0J
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 22:47:24 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89646d3-eb51-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 23:47:21 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dm5s26ZP0zlfgFc
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jan 2026 22:47:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b1553eb1c00644bcbb88f64e577effc2; Tue, 06 Jan 2026 22:47:18 +0000
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
X-Inumbo-ID: a89646d3-eb51-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767739638; x=1768009638;
	bh=uG9dkpcyxG9XGIOrcqOgWZEBQUboGOvOW5SQQsgO9JQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rHQHdgx9W+Z7otwHoGXl8Lpr17UVSjNVNTXuPiW7JX2QyW/lhbnwhmEbtfgxzr9g2
	 jUF/QjdJDutsY9VgIVwnMcgjw8uGW3n/fKsxNEpoxWbvp58naXQV9FRxxXbKrxYw6n
	 K26Gc5/IOOWzue4lX6llR/FQcd/1cabMeTDjqLfsQFNimcx2LTBCTwbZImmFl0gjD3
	 m0cOKuVUUWB8B5hRkKvBhvwK6EaN5UN2Tnrfjbq1GqgFxrp0RrP/Cf9Y2SJY7G+zC4
	 BCc+8CTrVw0d22TWucgrjAs2FbWTSLpsDWIdPBueBQ5uGKg5I0QD6b8b6u9TXOUbrA
	 KDVBJstAWCZrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767739638; x=1768000138; i=teddy.astie@vates.tech;
	bh=uG9dkpcyxG9XGIOrcqOgWZEBQUboGOvOW5SQQsgO9JQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jm3DRF6W4/YL0lwx/YN9qQu4XjpIMo7Zy9i3LZpzEp18mXM3GC+GKDg1Wc1cW29Ru
	 UkirsBkBF2K2b6jaR658iI7fGXyUymDnwYw6sMmw1dBPOy/uqCd5oz8oQ+W8qBL8su
	 bvmI2MhofW2a30Fn7RkIHsRUTxhTZf2pRcJZgTFOeB2KIlOWz6fg1+jQ7S003xLVVf
	 ovt8UliGWkwiB5vUp/q0BccZ7mFOJPIinROBgu/dg4nt40DzfiYH9gQmRb+8ZejtdZ
	 Wfl9r6Zap8qshad9I3pPIyFg2Vc7EUBbMVsWHu6h91HCU+Vvs+Z6dMV0E0PlmkLk0B
	 ao3KHrpltAqnw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/virtio:=20Don't=20use=20grant-dma-ops=20when=20running=20as=20Dom0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767739637478
Message-Id: <0b168d85-443c-4f38-92f8-8c008b2f8b82@vates.tech>
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>
References: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech> <995f7ac8-0a8b-43d9-9cc7-63622ec52ca1@suse.com>
In-Reply-To: <995f7ac8-0a8b-43d9-9cc7-63622ec52ca1@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b1553eb1c00644bcbb88f64e577effc2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260106:md
Date: Tue, 06 Jan 2026 22:47:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/01/2026 =C3=A0 20:06, J=C3=BCrgen Gro=C3=9F a =C3=A9crit=C2=A0:
> On 06.01.26 18:36, Teddy Astie wrote:
>> Dom0 inherit devices from the machine and is usually in PV mode.
>> If we are running in a virtual that has virtio devices, these devices
>> would be considered as using grants with Dom0 as backend, while being
>> the said Dom0 itself, while we want to use these devices like regular
>> PCI devices.
>>
>> Fix this by preventing grant-dma-ops from being used when running as Dom=
0
>> (initial domain). We still keep the device-tree logic as-is.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> Fixes: 61367688f1fb0 ("xen/virtio: enable grant based virtio on x86")
>> ---
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>
>> =C2=A0 drivers/xen/grant-dma-ops.c | 3 ++-
>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index 14077d23f2a1..c2603e700178 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -366,7 +366,8 @@ static int xen_grant_init_backend_domid(struct 
>> device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (np) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D xen_dt_gr=
ant_init_backend_domid(dev, np, backend_domid);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_put(np);
>> -=C2=A0=C2=A0=C2=A0 } else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)=
 || 
>> xen_pv_domain()) {
>> +=C2=A0=C2=A0=C2=A0 } else if (!xen_initial_domain() &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (IS_ENABLE=
D(CONFIG_XEN_VIRTIO_FORCE_GRANT) || 
>> xen_pv_domain())) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info(dev, "Us=
ing dom0 as backend\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *backend_domid =
=3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 0;
> 
> Please make this controllable, e.g. via a boot parameter.
> 
> It is completely valid to have a virtio device in dom0 with the backend i=
n
> a domU. You'll need grants in this case.
> 
Due to
 > *backend_domid =3D 0

Dom0 would always be the backend, unless we introduce a new boot 
parameter to select which domain will be the backend.

There is also another issue, as in the xen_initial_domain() case, all 
PCI devices come from hardware. So no virtio-pci device can't come from 
another domain as Linux would pick up pcifront devices only if we are 
not a Dom0 (!xen_initial_domain()).

> 
> Juergen

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



