Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58EA23F3D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 15:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879953.1290148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdsG8-0000qR-Ne; Fri, 31 Jan 2025 14:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879953.1290148; Fri, 31 Jan 2025 14:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdsG8-0000p0-KW; Fri, 31 Jan 2025 14:44:40 +0000
Received: by outflank-mailman (input) for mailman id 879953;
 Fri, 31 Jan 2025 14:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a7eC=UX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tdsG7-0000op-Cs
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 14:44:39 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e112cdea-dfe1-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 15:44:35 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361f796586so24120885e9.3; 
 Fri, 31 Jan 2025 06:44:31 -0800 (PST)
Received: from [130.190.73.38] (wificampus-073038.grenet.fr. [130.190.73.38])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5a03sm4802060f8f.71.2025.01.31.06.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 06:44:29 -0800 (PST)
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
X-Inumbo-ID: e112cdea-dfe1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738334670; x=1738939470; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lCyOsl5i9oW6/jLPFFZPQrzigEMcJssDy0WWAdSun5k=;
        b=kU2YF69z5tnGkyDxjPV4vaei5boAkViiXTpchSytPnxJ6Jxx27YMDP2vSk1rBVc0jo
         8S0+1RP+WkIYtJUyDcB3WY1oY+gB8sPX3vzy1fM27GbNJzIC7zEoiHhRgBi8jzmitp99
         vwdoyjvF3mbbnh8IspWxyfBglJhFW0km8WhJXBft0dNRuuXBW3CpzzfW7y0b2CtxVxru
         t5KklaKQ6WyMvaouOdoMSO5jhrBlNkJ+/T7nR4K2bzfOk/dUsLRD1ueu7IZ0o0weKBvn
         au9nDnjoso7PVNvn8xUbXVqcK3VBykTT6txsWJ0rdTCeSJb+IZzaOz+ZQv/LJ7Zx5Rh4
         KmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334670; x=1738939470;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCyOsl5i9oW6/jLPFFZPQrzigEMcJssDy0WWAdSun5k=;
        b=DHomlGsd4n9+pP/LtC7Y3PxXg2eBmDEqqACf0DIwh0rP+EgOfHs3jUbHZ5W+FGLD42
         BCUOhTd64e5k9CEBMsTJiwMWcVntwJMynTLw1RQTEbilVmgXKqQkbj33UDsCxJ1Wj0FL
         amJqb6uu9owEZ7AugzhfcnoJvMQT12deZh96Ag+qVZnh9I6NfLYwsRy2FjIog//BaXi6
         OhdmU9ipX9MJwSao/ST6w9RveABGYacwoGroPV4tx/rEg0rq3aZxuUsaLPI03J8n+862
         UJYPZbuKhSykZoZIsqGnwSxkBbyonjXAYWGX9N3KkWye9NZdvSVu2QHZQ/4Cp+/9MUXm
         Gk8g==
X-Forwarded-Encrypted: i=1; AJvYcCXMBCEjaXeuY/+Cg1Yq7UjHhLNHKJE76uIB0dNGP8/OA7wcyPcyNnTRrnDdCNkXha124LYXpcorZ5j31BA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwirL4UXuXWqLJI+MICuuOoSPbXBDabwPOELY1hAhIpR6XisYuU
	sEkeUxOYpkzWh2yOGmd2LUF49BHloG5NUk1SWR9FQItVvbBYAOFA/l+Ut2V4
X-Gm-Gg: ASbGnctrndErP+OTE6AVeluzQ5eOZd5Q9yUE68iIcHO6siKRYrHGC24zfC59AtlrmJ6
	01aS8RRADjXdkOk0N5/lEueSrE4xay+Wz+VDWQ22LGa9KbbUtystMb3PvaUQ6RZnGPL6RZIz6sE
	kM2+a9mV2uBCh6Pmqn/ob68bEB5CCdhlemaVMIfb7XRgDhFbODRGK3SVZ8ftiYBgCeGlc8EdC3Z
	CBGbAyvyzooeFjAVkhMBFY3C4viGRQPYxYEmkPlc4ML6L6fMJCSGnEPTlNXYC8UW3IEjjF4DByl
	Ib5oglI1FyaxmbePhVSpX3DbBcUBDEmBBoasOLmvzpWFN/Yyb1b2kZi9
X-Google-Smtp-Source: AGHT+IEnJaSDBPuMCaFspjL8x93hQ5t1uDZ7LNIKzexxAJ7Tt6bOBIYazAn6WZqOyydu7mhEKeKIdg==
X-Received: by 2002:a5d:6d86:0:b0:38b:e32a:109f with SMTP id ffacd0b85a97d-38c519504a4mr10565201f8f.12.1738334669763;
        Fri, 31 Jan 2025 06:44:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------UbUlkkAwyI5ShSe4dsue4nBa"
Message-ID: <93212889-7393-4fbb-9cc8-fb08f6ebeeab@gmail.com>
Date: Fri, 31 Jan 2025 15:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.20.0-rc3 is tagged

This is a multi-part message in MIME format.
--------------UbUlkkAwyI5ShSe4dsue4nBa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Xen 4.20 rc3 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc3

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.20.0-rc3/xen-4.20.0-rc3.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.20.0-rc3/xen-4.20.0-rc3.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Thanks Andrew to do rc3 during Xen Winter Meetup!

Have a good weekends.

Best regards,
  Oleksii

--------------UbUlkkAwyI5ShSe4dsue4nBa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi all,

Xen 4.20 rc3 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc3

For your convenience there is also a tarball and the signature at:
<a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.20.0-rc3/xen-4.20.0-rc3.tar.gz">https://downloads.xenproject.org/release/xen/4.20.0-rc3/xen-4.20.0-rc3.tar.gz</a>

And the signature is at:
<a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.20.0-rc3/xen-4.20.0-rc3.tar.gz.sig">https://downloads.xenproject.org/release/xen/4.20.0-rc3/xen-4.20.0-rc3.tar.gz.sig</a>

Please send bug reports and test reports to
<a class="moz-txt-link-abbreviated" href="mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenproject.org</a><a class="moz-txt-link-rfc2396E" href="mailto:xen-devel@lists.xenproject.org">&lt;mailto:xen-devel@lists.xenproject.org&gt;</a>.
When sending bug reports, please CC relevant maintainers and me
(<a class="moz-txt-link-abbreviated" href="mailto:oleskii.kurochko@gmail.com">oleskii.kurochko@gmail.com</a>&lt;<a class="moz-txt-link-freetext" href="mailto:oleskii.kurochko@gmail.com">mailto:oleskii.kurochko@gmail.com</a>).

Thanks Andrew to do rc3 during Xen Winter Meetup!

Have a good weekends.

Best regards,
 Oleksii

</pre>
  </body>
</html>

--------------UbUlkkAwyI5ShSe4dsue4nBa--

