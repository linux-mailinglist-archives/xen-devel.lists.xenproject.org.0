Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192A7D7E48
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623566.971513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvYq-0004IW-2X; Thu, 26 Oct 2023 08:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623566.971513; Thu, 26 Oct 2023 08:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvYp-0004Fu-VG; Thu, 26 Oct 2023 08:17:47 +0000
Received: by outflank-mailman (input) for mailman id 623566;
 Thu, 26 Oct 2023 08:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIwS=GI=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qvvYp-0004Fh-BL
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:17:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23cd0352-73d8-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 10:17:44 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so442480f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 01:17:44 -0700 (PDT)
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
X-Inumbo-ID: 23cd0352-73d8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698308264; x=1698913064; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QlcZTPz0VxE1NAr3bnHmFcQKBfgNdzjWK/+xtw9AwM=;
        b=awiUzg7O140iADHGp+qxV+JrLgpHXt6KHyPgqupwU1fanrS2nA3nh1j7BeUNycQrSj
         pVoIChZ2oFBvVMcPmyRMGIzrnAgE/oxBDm7Oj1CqM5sxLqnGVTP8RhG8AODxi8TWQTXs
         UICTmQU4/N/wT1qWA0eLFlcj2hOFoyJOk91mQcDskvgyT45+M7DQApoKJ2X38WHmG4Qd
         sSU4TLoVqwiInT3/qDC6NVVfR2azU/eGl9tvyzbHi2qjxNv7Xqdeu27E04cw13/OeOvW
         wR1IeCBooyy8Hu7TaRAu2OYf2/h1lbNd6gieQ6xyFLhqUzL8+YDF73shchAytATcEBqh
         47iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698308264; x=1698913064;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QlcZTPz0VxE1NAr3bnHmFcQKBfgNdzjWK/+xtw9AwM=;
        b=PRAlqYRNBUkjOuqs54uoYpBVT4Ec7G9PNQhl/6JUdbdFaOSRVGAecpxVKfz8Gn3L8t
         65zz77toKtzGGQ48D3XxGm2VtxRzx8U5Mzj9HIvRDZYAM6yBPd41HTGE+XYUOgQQ4UNb
         W79QpcBhNjqe3f7ZuSpP4WY0fHMrEm46aGxolqyUkNmt69ovq5Vstxchk76Mehk3nc9T
         wdWVtqdaALNN7TigtsFooo5AoqtRGuW5AFMi1H9QhmAsxYO6p4zQTSs1bEslvMJxhdb3
         tZpP6C92doGsvNae8/7oppdWaCtACsAgGDkrH1W7RMJ5cBHA9t7IMTIX2J9+X2tM1Qfi
         6iWw==
X-Gm-Message-State: AOJu0YzNkoMlTeCKQdFnu4XSudZxDKdzaYbnlEBJc3PuseBERGq7xq4x
	SJ+Q6hRY/92xKDCohf3JftpIA1YSws/XbhJ31DA3J0WtyzZu3w==
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

