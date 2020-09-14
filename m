Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF4268F14
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:08:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHq5B-0007u1-VY; Mon, 14 Sep 2020 15:07:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9IHB=CX=tabit.pro=d.fedorov@srs-us1.protection.inumbo.net>)
 id 1kHq5A-0007tr-35
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:07:52 +0000
X-Inumbo-ID: d7ffec1c-cd7e-4ba6-a9a3-7a24d702a470
Received: from mail.tabit.pro (unknown [77.221.146.2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7ffec1c-cd7e-4ba6-a9a3-7a24d702a470;
 Mon, 14 Sep 2020 15:07:50 +0000 (UTC)
Received: from mail.tabit.pro (localhost [127.0.0.1])
 by mail.tabit.pro (Postfix) with ESMTP id 4Bqq6L2pWbz9smp
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 17:50:34 +0300 (MSK)
Authentication-Results: mail.tabit.pro (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=tabit.pro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tabit.pro; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:user-agent:date:date:message-id:to
 :subject:subject:from:from; s=dkim; t=1600095033; x=1602687034;
 bh=5objYpv9tvayHCobRvkGXtg3ONSY1tPJsVTtmLyJjHs=; b=aHl1peR0Qhsl
 DUi4OQQ2JP9kvM/0uIoKKX723qgTA3FsxY5AFkt9YVNHWdpjl2cuV5UtZCRujnn4
 yVwURaj3yX41AZWAF37MSz5vv3WK05+pfJzA4g3dkXH6MX5ONU0m5TfENmQ45Tl2
 CKKNz/dDPcGMmQKW9gDDEIfmVcUeaTI=
X-Virus-Scanned: Debian amavisd-new at localhost.localdomain
Received: from mail.tabit.pro ([127.0.0.1])
 by mail.tabit.pro (mail.tabit.pro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X4u8WKcCx-PC for <xen-devel@lists.xenproject.org>;
 Mon, 14 Sep 2020 17:50:33 +0300 (MSK)
Received: from localhost.localdomain (unknown [176.110.127.80])
 by mail.tabit.pro (Postfix) with ESMTPSA id 4Bqq6K59l5z9slT
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 17:50:33 +0300 (MSK)
From: Dmitry Fedorov <d.fedorov@tabit.pro>
Subject: [PATCH] libxl: User defined max_maptrack_frames in a stub domain
To: xen-devel@lists.xenproject.org
Message-ID: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
Date: Mon, 14 Sep 2020 17:50:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Implementing qrexec+usbip+qemu in Linux-based stub domain leads me to
an issue where a device model stub domain doesn't have maptrack entries.

Would it be possible to apply a user defined max_maptrack_frames value=20
to dm_config in the same way as for max_grant_frames?

Signed-off-by: Dmitry Fedorov <d.fedorov@tabit.pro>
---
 =C2=A0tools/libxl/libxl_dm.c | 2 +-
 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f2dc5696b9..f044f2566c 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2292,7 +2292,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc,=20
libxl__stub_dm_spawn_state *sdss)
 =C2=A0=C2=A0=C2=A0=C2=A0 dm_config->b_info.target_memkb =3D dm_config->b=
_info.max_memkb;

 =C2=A0=C2=A0=C2=A0=C2=A0 dm_config->b_info.max_grant_frames =3D=20
guest_config->b_info.max_grant_frames;
-=C2=A0=C2=A0=C2=A0 dm_config->b_info.max_maptrack_frames =3D 0;
+=C2=A0=C2=A0=C2=A0 dm_config->b_info.max_maptrack_frames =3D=20
guest_config->b_info.max_maptrack_frames;

 =C2=A0=C2=A0=C2=A0=C2=A0 dm_config->b_info.u.pv.features =3D "";

--
2.26.2


