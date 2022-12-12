Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE95649E76
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459560.717318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hf3-0004Rh-TZ; Mon, 12 Dec 2022 12:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459560.717318; Mon, 12 Dec 2022 12:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hf3-0004Pd-Qr; Mon, 12 Dec 2022 12:11:57 +0000
Received: by outflank-mailman (input) for mailman id 459560;
 Mon, 12 Dec 2022 12:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5Rs=4K=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p4hf1-00049X-Fl
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:11:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2adf1ac6-7a16-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 13:11:54 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id tz12so4750986ejc.9
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 04:11:54 -0800 (PST)
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
X-Inumbo-ID: 2adf1ac6-7a16-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QTj5PzSAD8ckcRZ5fkls/1kVA1Ib8uFdBQua4sbDGc0=;
        b=lpGySwIVfWOQDVC40Ozx5QYQGg30VcvjckLu5lGqop1adiz9oTF82vP+yuS6X3cVK7
         /kaAiezR7edFOtV7pCF3HiNoObq2mDD+EV7nWYlUKyqAXVBVjHbx1yJupHJP9oUP4AiN
         uQ0FLEeOBtvrUNl7HTa0QRVCW5JQ5K7j0HOe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTj5PzSAD8ckcRZ5fkls/1kVA1Ib8uFdBQua4sbDGc0=;
        b=Yqh6WDRck3ZZDjhwXwnt1pEjkg4+YyPCk51g0FCSZl5lE5mo6pGEYciv3D0kqJCMUc
         /iqUB4tdbEVjmImK90MEv4dyVFUKaW9QN9C7Mb0eAqiaS5bFQ28hLLWy3+uvJ4FtIIAI
         1Tbmj1ofEee+p/4OVZX0aM8W+oZOQ5e0tcmcb1ciY/WecVnXnmNpWmZn30idi+2/l0HZ
         SMkhcboTIgOpV5XcKx48gfoHpQxgjPD0jICE+MGZmJVKvvmkeMIG335lUokRykWbcNdc
         /v9Snl8YMCp7RZOYqvketjuvVKk4/VgBmRvYkIEMlbpeAE+m59y2wUkmX+a9SmN7FW+5
         gV/Q==
X-Gm-Message-State: ANoB5pmRbRVv0lEOLmChGag3uQAh1RqLD1Yme13yKOoTUXbVleJk/Aj4
	cmoX6XDmrcbXxgkksR7+MZOn+qCuovaOwTEPpW+SBw==
X-Google-Smtp-Source: AA0mqf7RSszhd0tbKpk/IcF1Z1aBwT1jXVlZURgSui0pTj8O0btjg4BTSjB7P55OGaQMmUb3R6PbH/tJPaQYeQXxFeg=
X-Received: by 2002:a17:906:970a:b0:7c1:266a:73e with SMTP id
 k10-20020a170906970a00b007c1266a073emr4134112ejx.179.1670847114274; Mon, 12
 Dec 2022 04:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20221212093410.36289-1-julien@xen.org> <20221212093410.36289-4-julien@xen.org>
In-Reply-To: <20221212093410.36289-4-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Dec 2022 12:11:43 +0000
Message-ID: <CA+zSX=ZyOKDLN3_9_0T3CRf_yEoCpQjzY+nR7SJkrmK+2gNJcw@mail.gmail.com>
Subject: Re: [PATCH 3/8] docs/process: branching-checklist: Remove reference
 to root
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="000000000000b8810d05efa068ac"

--000000000000b8810d05efa068ac
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:

> From: Julien Grall <jgrall@amazon.com>
>
> The steps to generate the documentation for the new branch requires
> to ssh as root and then su to run with the user xendocs.
>
> The release technician may not (and should not) have access to root.
> So update the step to directly ssh as xendocs.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>

Acked-by: George Dunlap <george.dunlap@cloud.com>

--000000000000b8810d05efa068ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 9:34 AM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Julien Gr=
all &lt;<a href=3D"mailto:jgrall@amazon.com" target=3D"_blank">jgrall@amazo=
n.com</a>&gt;<br>
<br>
The steps to generate the documentation for the new branch requires<br>
to ssh as root and then su to run with the user xendocs.<br>
<br>
The release technician may not (and should not) have access to root.<br>
So update the step to directly ssh as xendocs.<br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br></blockquote><div><br></div><div>A=
cked-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">georg=
e.dunlap@cloud.com</a>&gt;</div><div><br></div></div></div>

--000000000000b8810d05efa068ac--

