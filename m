Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DBAD13CD
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jun 2025 20:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010000.1388197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOKtz-0004EN-Ha; Sun, 08 Jun 2025 18:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010000.1388197; Sun, 08 Jun 2025 18:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOKtz-0004BU-BC; Sun, 08 Jun 2025 18:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1010000;
 Sun, 08 Jun 2025 18:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aQ79=YX=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1uOKty-0004BM-BR
 for xen-devel@lists.xenproject.org; Sun, 08 Jun 2025 18:37:50 +0000
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acbd757e-4497-11f0-a304-13f23c93f187;
 Sun, 08 Jun 2025 20:37:48 +0200 (CEST)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3ddd2710d14so20267485ab.2
 for <xen-devel@lists.xenproject.org>; Sun, 08 Jun 2025 11:37:48 -0700 (PDT)
Received: from smtpclient.apple (216-131-77-230.ord.as62651.net.
 [216.131.77.230]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-500df421ba4sm1427875173.44.2025.06.08.11.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jun 2025 11:37:46 -0700 (PDT)
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
X-Inumbo-ID: acbd757e-4497-11f0-a304-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749407867; x=1750012667; darn=lists.xenproject.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX/ARDRvaQNzbhhMjpqA1HTQhNfsIMGOzvjaAGIsCgk=;
        b=DTxhmbdhO8bb6MrurWdSJ9htzI3EJ29Y+JuATkeDHaUsRt9HfN/F54r3irxmNYULOU
         rqi6ZGwOmuLmgxZ6aoyIX7EdZr7xY1q0LeP7rExzsODDdEBx3ZN36XeDLcOYNQT7uhuA
         p52VwVVBUoLNZPvgPjxHDQNULutdbQOEjvDl/QXQcn/E36Izp34mewIKmyI6zk72wJt5
         rQDyVg1NnQwfGsRD+d80hqjUxDZeDVlc3z7Rvz+lGr+yLfbp3IjGzIxqWMu+Cvls9zbA
         KVx7K83KspQ4dKn1smZubNywyjP5oJUYTkPF/7vNsECSX837l9I4sdmCKv6mBvt1ZOTL
         19eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749407867; x=1750012667;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pX/ARDRvaQNzbhhMjpqA1HTQhNfsIMGOzvjaAGIsCgk=;
        b=bALkvNpviC4pcALOR2v/duyCOTinzXzgjuxcZmD/nHp6aNywuQ2g1TnryHiNxJrbYw
         lBKAhG8pDkoaqqyzgA0W0z7aNjaBhWn3ea/2OmTXxmblzE3jjjXH+x24Cwbh67+4rDoz
         gfJvKz5npE6vCHsm+Qzk6H+bnKvXnzEcm8qY9JvJ+eC7FoU/PWprjR1C26rl5hJ/VCWt
         116H/Mzrh0sEyvuJ0fuXSQPOPAq7qMNWCORt/Ncx1YEe5TPV6ZZUfsiNDQbr+dT+PnnV
         iRwpoE/g4tSPE8MiGnlNC6DdFgrMPU3DV9s6KTnpP6DY2rV8mhSqAISzf/a5lWmWh5oO
         vRVg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3X8YYhbSi79z8OPjgX0E0fGZFs8OlArH+SaLXeCEXf70pax5INoeAEx+mAfSAOLQ8e35GV4EVbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze1vM7PaeFFa+Hra6lZgs4BLHpcu07cO8b92/r1WgBYMYqnSad
	yGFcMCHFrMyZ50Jua04AX7Ve4qhnatWmUZ8yjgdNOn7+vCGYVTnupBlD
X-Gm-Gg: ASbGncuZWNDG0ynYgNnR/lkdH+EqcRkTC5oPkLukGFNTq+OY63K/L0DiscEa8/eE+AM
	IfdhjLcE3X+X5h3O1yGVXGmOmVaB559BDY7xhshFWRisCbs0UY4MQjuDE05c07VsU3XiPfTJvT3
	lvdvAg9kYvuUv2FtxqaftouyKPACb8mBuBcVHDvtYEMgukq85qMawvKSZ5z0YhIn2417YqptI+b
	T0qxZmt193bB8r1qTrXBC4nJzx5B0VgADU6h2fS+GqN2bfkseOAq0dusrFV8DD6pkXrfn7RsV/H
	dUIM5tSIJ9BawKn/l5G2taEJCAMIIJMd8xLZoHVUa5UJvc1c5hmHgVngSLD1wIaNn1wikGuFJGn
	pxQ9MjNbBFlxDITQUssEGBQ==
X-Google-Smtp-Source: AGHT+IGHzSRBU/gbP2XiSJzFgmFqnJUGk52IWbYBo/VgYbQXExah2tmVxcd6eXF799keQEBAEJVOZQ==
X-Received: by 2002:a05:6e02:1a26:b0:3dd:c78c:ec3e with SMTP id e9e14a558f8ab-3ddce49109emr128643415ab.22.1749407867060;
        Sun, 08 Jun 2025 11:37:47 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-04498CCF-82CE-41A8-8EBA-F5EE56B73C31
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 1/3] docs: add documentation for Argo as a feature
Date: Sun, 8 Jun 2025 14:37:34 -0400
Message-Id: <2EAAC8E1-2342-48F4-9B2E-849551291F22@gmail.com>
References: <CACMJ4Gb35EAy2igefhzH5=g=cQstNvbJCZdiMHA7QHQ+v=4cOg@mail.gmail.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <CACMJ4Gb35EAy2igefhzH5=g=cQstNvbJCZdiMHA7QHQ+v=4cOg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
X-Mailer: iPad Mail (22F76)


--Apple-Mail-04498CCF-82CE-41A8-8EBA-F5EE56B73C31
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On J=
un 8, 2025, at 5:49=E2=80=AFAM, Christopher Clark &lt;christopher.w.clark@gm=
ail.com&gt; wrote:</div><div dir=3D"ltr"><blockquote type=3D"cite">=EF=BB=BF=
</blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr">On Wed, Jun 4, 2025 at 5:14=E2=80=AFPM Jason Andryuk &lt=
;<a href=3D"mailto:jason.andryuk@amd.com">jason.andryuk@amd.com</a>&gt; wrot=
e:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
I think this should be dropped.&nbsp; We don't need a link to a design <br>
document without an implementation.&nbsp; You can add it once you've <br>
upstreamed the implementation.<br></blockquote><div><br></div><div>OK, I'll r=
emove this section for the next version of the series.</div></div></div></di=
v></blockquote><br><div>What's the recommended location of Xen design docume=
nts, requirements for future improvements, roadmaps or pointers to related w=
ork in adjacent open-source communities? The Xen wiki is being deprecated.</=
div><div><br></div><div>What's the recommended way for the Xen community to d=
iscover the existence of Argo documentation that is not hosted by the Xen co=
mmunity? If necessary, we can create a new semantic label or Xen docs direct=
ory tree, to host technical content that might otherwise be lost.</div><div>=
<br></div><div>Should we add a sentence to Xen's Argo documentation, to the e=
ffect of "Please refer to the Xen [wiki in archive.org, website, mailing lis=
t], external sites [A, B, C, D], or your preferred [search engine, LLM] for m=
ore technical documents on Argo design and implementation"?</div><div><br></=
div><div>Rich</div></body></html>=

--Apple-Mail-04498CCF-82CE-41A8-8EBA-F5EE56B73C31--

