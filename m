Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CB64028A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:54:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451585.709364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11o5-0000Ky-5q; Fri, 02 Dec 2022 08:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451585.709364; Fri, 02 Dec 2022 08:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11o5-0000I2-2W; Fri, 02 Dec 2022 08:54:05 +0000
Received: by outflank-mailman (input) for mailman id 451585;
 Fri, 02 Dec 2022 08:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AIqc=4A=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1p11o3-0000Hr-8I
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:54:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd60535d-721e-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 09:54:01 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-u3ii-unoMP6JoLGOF_lwxA-1; Fri, 02 Dec 2022 03:53:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32EBB811E75;
 Fri,  2 Dec 2022 08:53:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B751402BDA;
 Fri,  2 Dec 2022 08:53:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C80B021E6921; Fri,  2 Dec 2022 09:53:52 +0100 (CET)
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
X-Inumbo-ID: dd60535d-721e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669971240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQcCSXiFAF2L81EAA5lji2vAstDjVjeWxi4Yd9lyf48=;
	b=CVsq7VlWjZYWeI93tiKXNz8ZfteqRoOX8jSEKyQQ83jq7wncEzoDW7ofUHLYGO2JhuMdKZ
	w0/VhaR6b/SGlNWLHV17UmSU+joQ84HoxJ+46nyRgaCzMS0Fo6+gFnCVOufSXFOGEbtrE9
	0vXw+aUdhm5n9KiChyUqEvJnnzR39uA=
X-MC-Unique: u3ii-unoMP6JoLGOF_lwxA-1
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>,  qemu-dev@xilinx.com,
  stefano.stabellini@amd.com,  alex.bennee@linaro.org,
  xen-devel@lists.xenproject.org,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Paul Durrant <paul@xen.org>,  "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 07/11] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
	<20221202030003.11441-8-vikram.garhwal@amd.com>
	<e7922267-9a87-8936-942e-e73a789672f9@linaro.org>
Date: Fri, 02 Dec 2022 09:53:52 +0100
In-Reply-To: <e7922267-9a87-8936-942e-e73a789672f9@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 2 Dec 2022 08:27:39
 +0100")
Message-ID: <871qpitcdb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 2/12/22 03:59, Vikram Garhwal wrote:
>> Replace g_malloc with g_new and perror with error_setg_errno.
>>=20
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   hw/xen/xen-hvm-common.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>
>
>> @@ -717,7 +717,7 @@ void destroy_hvm_domain(bool reboot)
>>      xc_interface *xc_handle;
>>      int sts;
>>      int rc;
>> -
>> +    Error *errp =3D NULL;
>>      unsigned int reason =3D reboot ? SHUTDOWN_reboot : SHUTDOWN_powerof=
f;
>>=20=20=20
>>      if (xen_dmod) {
>> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>>              return;
>>          }
>>          if (errno !=3D ENOTTY /* old Xen */) {
>> -            perror("xendevicemodel_shutdown failed");
>> +            error_setg_errno(&errp, errno, "xendevicemodel_shutdown fai=
led");
>
> See "qapi/error.h":
>
>   * =3D Passing errors around =3D
>   *
>   * Errors get passed to the caller through the conventional @errp
>   * parameter.
>
> Here you are not passing the error to the caller.

Instead, you're leaking its memory.

> Maybe you are looking for the "qemu/error-report.h" API?

Plausible.

Also, @errp is the conventional name for the Error ** parameter used to
pass errors to the caller.  Local Error * variables are usually called
@err or @local_err (I prefer the former).

[...]


