Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B8690EE9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492785.762493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAQs-0007w5-Le; Thu, 09 Feb 2023 17:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492785.762493; Thu, 09 Feb 2023 17:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAQs-0007tQ-IE; Thu, 09 Feb 2023 17:10:02 +0000
Received: by outflank-mailman (input) for mailman id 492785;
 Thu, 09 Feb 2023 17:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kKO=6F=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pQAQr-0007jg-Ba
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:10:01 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95cfd57f-a89c-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 18:10:00 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id j23so2520390wra.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 09:10:00 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n18-20020a5d4012000000b002b57bae7174sm1730636wrp.5.2023.02.09.09.09.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Feb 2023 09:09:59 -0800 (PST)
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
X-Inumbo-ID: 95cfd57f-a89c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3UOEvVGLa7nvfAmL0eKXVl8ZhK8JMc34Dxz1vYCigw=;
        b=k1qQ8F25uN34lVXG57adr4dvOgz4XL7JXSj6L7KaLyFOY6zwcc8ZhVSem+YFA/K52C
         2ALPIxb8Cfl28/QHz+5OEk47ohQU7YAH9ueWdurDQG12oGQf6Sfhi1o1QwuJM0UN8Zcr
         woFycYlFomzvhW+94MMRCRaqye5iqvH2h1cCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3UOEvVGLa7nvfAmL0eKXVl8ZhK8JMc34Dxz1vYCigw=;
        b=RWvQYfJABshBFDMtcMkjf1UA9nnp/mvRMKcEp8doEs+5Ufms9yiH3GXt2jguBTiaAX
         zWrBNPNK02H5zm6gDxVjatnFtwiFtbE3rvsePCVRuSdn9bBiuYK2WxLhrOGw9lfYQOZF
         xUsGzHlW/ixYJgIuOlpJtD87pPHxqIlY+4IG/JmMXRsAlV0E5j96u7InDiSQH6wOxQcA
         LdF4iZjsBOpbSeYloo3PbwWjMFkorFB3b0JbmVNr2mrddr82Zb96qqs1MpqyFwDYut3Q
         pUtqE+IAQBfW0jOetj3I16v2qPvMgsGoQyHnBcjKV5Uz4t+Na4AZ9cUtCExJsGrmdL3O
         dZqA==
X-Gm-Message-State: AO0yUKUpeLtAPWWLRrhmldmmtPfT8PDmS5Th4+abIjhnNabJgY4JTCI+
	wWJ3ESYeuCYI550sTI5PHCPirg==
X-Google-Smtp-Source: AK7set+0ZD0ce5Dx9an+mEXBrKVDCtP7X8uOalpLRBXELoqI9ljqV2C3RPDpOz5tKr65QP4WZ2h9/A==
X-Received: by 2002:adf:ff89:0:b0:2c3:efe7:c632 with SMTP id j9-20020adfff89000000b002c3efe7c632mr12253774wrr.15.1675962599809;
        Thu, 09 Feb 2023 09:09:59 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/ocaml: Drop libxl bindings
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <131d89b6-3681-3776-aae1-453ece0a0ead@citrix.com>
Date: Thu, 9 Feb 2023 17:09:58 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <42E86602-7DBB-408A-8E66-D433B65E4FA7@cloud.com>
References: <20230209154300.22130-1-andrew.cooper3@citrix.com>
 <131d89b6-3681-3776-aae1-453ece0a0ead@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 9 Feb 2023, at 16:41, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 09/02/2023 3:43 pm, Andrew Cooper wrote:
>> There are significant issues with these bindings, and their companion =
half in
>> Xapi was deleted in 2018
>>=20
>>  =
https://github.com/xapi-project/xen-api/commit/203292ebe0c487d7ae4adb961a6=
d080f4fbe933d
>>=20
>> owing to there having been no development of these bindings since =
2014.
>>=20
>> In the unlikely event that we'd want to reinstate them, they'd need =
reworking
>> basically from scratch anyway.
>>=20
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Christian Lindig <christian.lindig@citrix.com>
>> CC: David Scott <dave@recoil.org>
>> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>>=20
>> I'm unsure whether to drop xentoollog.  They're technically orphaned =
by this
>> change, but could be used in principle by the other bindings.
>=20
> It turns out that the xentoollog bindings segfault anyway, and are an =
an
> equal state of disrepair to the libxl bindings.  In agreement with =
Edvin
> and Christian, I've dropped them too in this change, but I won't =
bother
> reposting an extra several thousand line deletion.
>=20
> ~Andrew

Acked-by: Christian Lindig <christian.lindig@citrix.com>


