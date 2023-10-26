Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0A7D7E49
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623567.971523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvYr-0004Xc-Ax; Thu, 26 Oct 2023 08:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623567.971523; Thu, 26 Oct 2023 08:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvYr-0004UX-7Y; Thu, 26 Oct 2023 08:17:49 +0000
Received: by outflank-mailman (input) for mailman id 623567;
 Thu, 26 Oct 2023 08:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIwS=GI=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qvvYp-0004Fi-Jp
 for xen-devel@lists.xen.org; Thu, 26 Oct 2023 08:17:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23e663ae-73d8-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 10:17:45 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32f5b83f254so433774f8f.3
 for <xen-devel@lists.xen.org>; Thu, 26 Oct 2023 01:17:44 -0700 (PDT)
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
X-Inumbo-ID: 23e663ae-73d8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698308264; x=1698913064; darn=lists.xen.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QlcZTPz0VxE1NAr3bnHmFcQKBfgNdzjWK/+xtw9AwM=;
        b=EkowZ73R8D3Atn0R9b6xJ3wtvJvvTborfByB14SksfZ51yYcVcXxOGmOlyqPyiUFfy
         yJqzuE/ZWTB9vnH8Z0jGgZ566HcSBYQqy7oJ9rEgADG/jc9zHQeSuNI/PrLyljgvABzj
         rZQvpjJ9yBdahQxj5j2rHUjbgvflArQMH/RzLwBRc5lyODxbOmQe3JyN3bAD1Tzm8glZ
         JNmx7p5qQmn/lpeey/0YQWCMulWJkjrlt7EtAZzSUjf7z6BEQ8mgEkEvMI+W1BmH+kFU
         eoH7qAUvrxDTFeBR8PobiSmikmMzzgsTinrUODQOrWelThshkcfeoSB79CSyxCBgOoVz
         oBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698308264; x=1698913064;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QlcZTPz0VxE1NAr3bnHmFcQKBfgNdzjWK/+xtw9AwM=;
        b=vQHigj756MxG3jgfF5ZT0rkq5VsWKMgwt8QdazCIyOnBG1IZCWPWqUBDo9WmfYQOPI
         gd9LNsciz3DaxTj54efQuKF/5jv267cE7GMdLP562Ty5LoVqQya966kqoAj1lfH+iNyx
         o7SACTY7pbzl1r3D17GH/GbI/cAUUifmxmu1tT9epGBZys3F28ehaEw4DqcNFu3Vf7m+
         F5QdEMisH5qwph0cEG+xF+Q5r8Ntvkv/2ns7kGy6BobcKpWZuKFwuo0MrsjyYBsKXlyY
         DA4TooarsOwmStSGExfuKN3+gsBeyM69pwl4Y1GAlkSwQxrLSLNZrxpcZbt0UYD3Z6NW
         axCg==
X-Gm-Message-State: AOJu0YyEnOCzAJ1HOpaGHSM75RRVsJYqgD2TaHkM4Smpm96CWsgKPSb/
	WAuZE3nj20DJtZzzHLOz6b/AQhTe4Q/QndppYxPyZpYSGz9H1g==
X-Google-Smtp-Source: AGHT+IGl7umX9sly41zXRcJ1W85Xy7fQqboAZXtU4V8j87p/q+Xwx6p7Iojl4RHWGKebZWo9PD3jAx9sVEhSgO67ZeU=
X-Received: by 2002:adf:f049:0:b0:32d:9daf:3f94 with SMTP id
 t9-20020adff049000000b0032d9daf3f94mr11326102wro.53.1698308263895; Thu, 26
 Oct 2023 01:17:43 -0700 (PDT)
MIME-Version: 1.0
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Thu, 26 Oct 2023 11:25:28 +0300
Message-ID: <CA+SAi2soyLRdKeLScsPph2Qe9bLytAGCh4U1zKHp3hAJWaMxkw@mail.gmail.com>
Subject: network communication in CC mode
To: xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c9e5ca06089a3428"

--000000000000c9e5ca06089a3428
Content-Type: text/plain; charset="UTF-8"

Hi guys,

This is a new question.
Has anyone tried networking communication in Xen Cache Coloring mode ?
I mean connect from one DomU to another one DomU for example ?
It may be achieved by xl command.

Or maybe a goto device which has xen with Dom0 in CC mode from the host ?

Regards,
Oleg

--000000000000c9e5ca06089a3428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi guys,</div><div><br></div><div>This is a new quest=
ion.</div><div>Has anyone tried networking communication in Xen Cache Color=
ing mode ?</div><div>I mean connect from one DomU to another one DomU for e=
xample ?</div><div>It may be achieved by xl command.<br></div><div><br></di=
v><div>Or maybe a goto device which has xen with Dom0 in CC mode from the h=
ost ?</div><div><br></div><div>Regards,</div><div>Oleg<br></div></div>

--000000000000c9e5ca06089a3428--

