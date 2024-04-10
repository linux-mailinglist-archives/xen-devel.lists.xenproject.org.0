Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE289FD1B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 18:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703434.1099147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruawn-0006Lp-GV; Wed, 10 Apr 2024 16:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703434.1099147; Wed, 10 Apr 2024 16:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruawn-0006JA-D6; Wed, 10 Apr 2024 16:37:17 +0000
Received: by outflank-mailman (input) for mailman id 703434;
 Wed, 10 Apr 2024 16:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqiL=LP=bounce.vates.tech=bounce-md_30504962.6616bef7.v1-d14370195b404c52b72b1f148820ba6e@srs-se1.protection.inumbo.net>)
 id 1ruara-0004sW-H8
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 16:31:54 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67a6558-f757-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 18:31:53 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4VF7dM2xF0zGlspGF
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 16:31:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d14370195b404c52b72b1f148820ba6e; Wed, 10 Apr 2024 16:31:51 +0000
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
X-Inumbo-ID: d67a6558-f757-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712766711; x=1713027211;
	bh=sSfrU7AoiIs020T7QtgqqYpI39Dr+n4OosN3e67IR84=;
	h=From:Subject:In-Reply-To:References:Message-Id:To:Cc:Feedback-ID:
	 Date:MIME-Version:Content-Type:CC:Date:Subject:From;
	b=NBTvcVd2qt+rXsbH4IUpAeQY/uHM+r+3P4vNDgfE3h60Lbcy/TyNl6O9O+F5TAtt+
	 mOXszb75J+mi0u7S4wez3xw/AsFOmtmweMnYRirFNgFHZMuXd0C6yJdtDFNq2AwYcx
	 6ldE+goUN2lxiEOt9VJINiNoYDLstdvjWe1UG7o9HDqaUbtFKnJPHo4ZMkizICnvQR
	 +5tSlxaDmy7Ht69YQfrvTAgmAyZVMznnHwBlYiqTvV0r6XLPvxEq/mxsO7uMh6baQF
	 sG2+Re0l0avpLynlhtq3IH+97v3fKIgVc3Ui29ySMuGPf14asW97GGdzKTc2+fafbV
	 I4jzq1ZjZ8iwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712766711; x=1713027211; i=andrei.semenov@vates.tech;
	bh=sSfrU7AoiIs020T7QtgqqYpI39Dr+n4OosN3e67IR84=;
	h=From:Subject:In-Reply-To:References:Message-Id:To:Cc:Feedback-ID:
	 Date:MIME-Version:Content-Type:CC:Date:Subject:From;
	b=HJVRJIvqsLomCDsXYXdr7kOSxp7oM0FxQ+HpCVC0e+iDp0mJoo/F+lh9FOWNAeYkq
	 HcTnw5HDRTEcllV3Ho19adI4cXtG9S2LMd8E5JrEkGqaXi+AQXWRgHN+guW4tXWoLQ
	 cuVZTegoEeb6skdnBNFv4CtAEKvA+mwwFY1xzaTONfGqLG4cKs6vOktjOpQfPu1TDi
	 h0wNY9QXs5oczn6ukLxlnhFFNq+DeyD1gxtQuwjzpYDfFE976VQYoeZBoHIpJb+l7+
	 4GXjKMUXbKKgRhVliRg9v2UIC3/HqzwlNCTfiTaXw9ZvFnFP/C05jbK+ly3OrklcTb
	 K4c62zJmpAz9g==
From: Andrei Semenov <andrei.semenov@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=200/2]=20AMD=20SEV=20initial=20work?=
X-Bm-Draft-Info: {"type":"REPLY-ALL","messageInternalId":2365954,"folderUid":"5bc3cd3c-1c54-4448-8b93-1d5e00399c41"}
X-Bm-Draft-Identity: default
X-Bm-Sent-Folder: e241ae38-d68a-470c-b463-de37822a6206
X-Bm-Draft-Refresh-Date: 1712766707351
X-Bm-Internal-Id: AF93AA0B-DAD8-4612-B2C2-10A4B7388341 bluemind-4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2 2366246
X-Bm-Previous-Body: 772a8432c78e6cf357f02335a8aba3e17fe04e12
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712766708276
In-Reply-To: <cover.1712759753.git.andrei.semenov@vates.fr>
References: <cover.1712759753.git.andrei.semenov@vates.fr> <cover.1712759753.git.andrei.semenov@vates.fr>
Message-Id: <luu104te.1nffyo9e5v9c0@vates.tech>
To: Andrei Semenov <andrei.semenov@vates.fr>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d14370195b404c52b72b1f148820ba6e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240410:md
Date: Wed, 10 Apr 2024 16:31:51 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_av-5B1GENlOtEY6IStm5WuMBw"

--_av-5B1GENlOtEY6IStm5WuMBw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Also sent emacs ~ file. To ignore, sorry
Le mercredi 10/04/2024 17:39, Andrei Semenov <andrei.semenov@vates.fr> a =
=C3=A9crit :

///HERE YOU GO

Andrei Semenov (2):
  Implemented AMD SEV discovery and enabling.
  Implemented Amd Secure Processor device driver

 xen/arch/x86/cpu/amd.c                 |  53 ++
 xen/arch/x86/hvm/svm/Makefile          |   1 +
 xen/arch/x86/hvm/svm/sev.c             |   4 +
 xen/arch/x86/include/asm/cpufeature.h  |   3 +
 xen/arch/x86/include/asm/cpufeatures.h |   2 +
 xen/arch/x86/include/asm/msr-index.h   |   1 +
 xen/arch/x86/include/asm/psp-sev.h     | 655 ++++++++++++++++++++
 xen/arch/x86/include/asm/sev.h         |  11 +
 xen/drivers/Kconfig                    |   2 +
 xen/drivers/Makefile                   |   1 +
 xen/drivers/crypto/Kconfig             |  10 +
 xen/drivers/crypto/Makefile            |   1 +
 xen/drivers/crypto/asp.c               | 808 +++++++++++++++++++++++++
 xen/include/xen/types.h                |   2 +-
 14 files changed, 1553 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/hvm/svm/sev.c
 create mode 100644 xen/arch/x86/include/asm/psp-sev.h
 create mode 100644 xen/arch/x86/include/asm/sev.h
 create mode 100644 xen/drivers/crypto/Kconfig
 create mode 100644 xen/drivers/crypto/Makefile
 create mode 100644 xen/drivers/crypto/asp.c

-- 
2.35.3





--_av-5B1GENlOtEY6IStm5WuMBw
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"bm-composer-content-wrapper"><div style=3D"font-family: Montserr=
at, montserrat, &quot;Source Sans&quot;, &quot;Helvetica Neue&quot;, Helvet=
ica, Arial, sans-serif;">Also sent emacs ~ file.&nbsp;<span style=3D"displa=
y: inline !important; color: rgb(0, 0, 0); background-color: rgb(255, 255, =
255);">To ignore, sorry</span></div><br><div id=3D"data-bm-forward-separato=
r"><p>Le mercredi 10/04/2024 17:39, Andrei Semenov &lt;andrei.semenov@vates=
.fr&gt; a =C3=A9crit :</p><blockquote style=3D"margin-left: 1rem; padding-l=
eft: 1rem; border-left: 2px solid black;"><div id=3D"bm-composer-content-wr=
apper"><pre>///HERE YOU GO

Andrei Semenov (2):
  Implemented AMD SEV discovery and enabling.
  Implemented Amd Secure Processor device driver

 xen/arch/x86/cpu/amd.c                 |  53 ++
 xen/arch/x86/hvm/svm/Makefile          |   1 +
 xen/arch/x86/hvm/svm/sev.c             |   4 +
 xen/arch/x86/include/asm/cpufeature.h  |   3 +
 xen/arch/x86/include/asm/cpufeatures.h |   2 +
 xen/arch/x86/include/asm/msr-index.h   |   1 +
 xen/arch/x86/include/asm/psp-sev.h     | 655 ++++++++++++++++++++
 xen/arch/x86/include/asm/sev.h         |  11 +
 xen/drivers/Kconfig                    |   2 +
 xen/drivers/Makefile                   |   1 +
 xen/drivers/crypto/Kconfig             |  10 +
 xen/drivers/crypto/Makefile            |   1 +
 xen/drivers/crypto/asp.c               | 808 +++++++++++++++++++++++++
 xen/include/xen/types.h                |   2 +-
 14 files changed, 1553 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/hvm/svm/sev.c
 create mode 100644 xen/arch/x86/include/asm/psp-sev.h
 create mode 100644 xen/arch/x86/include/asm/sev.h
 create mode 100644 xen/drivers/crypto/Kconfig
 create mode 100644 xen/drivers/crypto/Makefile
 create mode 100644 xen/drivers/crypto/asp.c

-- 
2.35.3


</pre></div></blockquote></div><style></style></div>
<img src=3D"http://bounce.vates.tech/track/open.php?u=3D30504962&id=3Dd1437=
0195b404c52b72b1f148820ba6e" height=3D"1" width=3D"1" alt=3D"">

--_av-5B1GENlOtEY6IStm5WuMBw--


