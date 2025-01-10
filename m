Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73BA098D4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 18:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869893.1281346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJ5Q-00053n-AX; Fri, 10 Jan 2025 17:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869893.1281346; Fri, 10 Jan 2025 17:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJ5Q-000524-7a; Fri, 10 Jan 2025 17:46:20 +0000
Received: by outflank-mailman (input) for mailman id 869893;
 Fri, 10 Jan 2025 17:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hl4S=UC=gmail.com=inisider@srs-se1.protection.inumbo.net>)
 id 1tWJ5O-00051g-Te
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 17:46:18 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8698815-cf7a-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 18:46:14 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso2304638e87.2; 
 Fri, 10 Jan 2025 09:46:12 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0664sm598754e87.193.2025.01.10.09.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 09:46:09 -0800 (PST)
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
X-Inumbo-ID: c8698815-cf7a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736531172; x=1737135972; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2uLwHxKIE8Flro4+3aVb5JHjHe6Cl/VATUVw80eks/o=;
        b=mg1YPqnUhz7+xWQUL8bV0wP3KBNPrghrPR9SYBnvsBPOvFWXHRKCsGOr8DUKGUY5rB
         Bq0fLci/ZSXix9SlhQ7eAzNUOfOkLpMYjNwq4gORahqCrqTJ26Q0UcbwCYty+p3h6uJQ
         5sDrdJVnDLPl4K+05Nt2RuAoFVtbuZBkscDVnpcZeNoeMXaLnwyZCEhyYCZrQheaPe9P
         5iriKawWJNvU+dUpOH5c31Do9cPKGZufQ7uSwPk330dPkN4aygf2NkSiWzqdlTf5vdp6
         OaYa3FiV54IzrdQ3w8QMP18ByczxOrhROBKsYa0MbXi2kd18H6Zk13qofcw3ZdI1wLsE
         qtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531172; x=1737135972;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uLwHxKIE8Flro4+3aVb5JHjHe6Cl/VATUVw80eks/o=;
        b=OXxfKLudPjpIIpndWwW5+2+Bff4iXyqdiPFsJC54n4P6YtKB2vsmJlqKnbkWdlzA8R
         wu8vBEpjqzWXNpL66a++nR2uUPXU7gp5iLlhsFO0HhtSF66jgInbjCaeLy8mAfQUgcST
         sJgoLE5UjQBfwtVZWPN5Mi+a3QwJCaWDO0tCfXt4ULXSyEbl//dJLn+pHXEDzWcIlONS
         uTP+oS0Cy0eT4Wi11Pm98uBP0KokggL9m3DuXAiUeYzpDpKCeVVjj2BuQEG8y4uY1m6T
         DlYcZGCKGPhq9XKh+ZFrYnmstEXfCtwirJBx7liF8JSNJ1nRF0n7O2ECx6XDTfRdGGyc
         pYOA==
X-Forwarded-Encrypted: i=1; AJvYcCUlZ6glAvMtQBuC1MqSy1E/09K2uE7Yw00YwqsODg+uyjftAXV2uYSSYKqd1gOr/fYEn6Rj9MmZHkoRaBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRWXcvBPvAgLTU7h4uilmUfu0HhJZ/LNz87rRfO0nadl7yl3M+
	806Fx97XuKP7rtNJNfVf+mvhApxxFpb1QefWDbs772m+DekIFtfZLhClyFLt
X-Gm-Gg: ASbGnctxB3NqNORxjpxkLZZ2xw1RUDmcO90oKIpxqqU/3ZHTUIdaum9B3T5Feb4T3Zj
	RCfylL3Y1Cza+3fTaJEyKVTL/nL/w+6B1UgSm3Ss1yuyOzuZSuiyUMMmLU/j260hpClS23NKgWq
	cCa5rlFLXWyoo4tktYu5MeQO5prxoVyssNo6pzfLJJdR80q1GXhjVs7l0sKqnwQ0Pstj36V2Tqf
	iogBXavkx9eQIGd4MCYrsowngHP0tvos7C25mKvuwyEGm1whV7jf22v2eE=
X-Google-Smtp-Source: AGHT+IGQGXMKgnOv4/H/hO3+1TyFo/8EFk6d9QMQZTUbkIGwwKQwomaxbI2SagGkLY/NkWuphbIlXA==
X-Received: by 2002:a05:6512:3049:b0:542:297f:4f65 with SMTP id 2adb3069b0e04-54284450352mr3928821e87.0.1736531171379;
        Fri, 10 Jan 2025 09:46:11 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------R0yv0aq2cjlHE01ISJyTQsiw"
Message-ID: <4c90bca8-997a-43d2-a0e0-963ac5555b93@gmail.com>
Date: Fri, 10 Jan 2025 18:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <inisider@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.20.0-rc1 is tagged

This is a multi-part message in MIME format.
--------------R0yv0aq2cjlHE01ISJyTQsiw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Xen 4.20 rc1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc1

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz <https://downloads.xenproject.org/release/xen/4.19.0-rc1/xen-4.19.0-rc1.tar.gz>

And the signature is at:
https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig <https://downloads.xenproject.org/release/xen/4.19.0-rc1/xen-4.19.0-rc1.tar.gz.sig>

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Best regards,
  Oleksii

--------------R0yv0aq2cjlHE01ISJyTQsiw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi all,

Xen 4.20 rc1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc1

For your convenience there is also a tarball and the signature at:
<a
href="https://downloads.xenproject.org/release/xen/4.19.0-rc1/xen-4.19.0-rc1.tar.gz"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;">https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz</a>

And the signature is at:
<a
href="https://downloads.xenproject.org/release/xen/4.19.0-rc1/xen-4.19.0-rc1.tar.gz.sig"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;">https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig</a>

Please send bug reports and test reports to
<a class="moz-txt-link-abbreviated" href="mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenproject.org</a><a class="moz-txt-link-rfc2396E" href="mailto:xen-devel@lists.xenproject.org">&lt;mailto:xen-devel@lists.xenproject.org&gt;</a>.
When sending bug reports, please CC relevant maintainers and me
(<a class="moz-txt-link-abbreviated" href="mailto:oleskii.kurochko@gmail.com">oleskii.kurochko@gmail.com</a>&lt;<a class="moz-txt-link-freetext" href="mailto:oleskii.kurochko@gmail.com">mailto:oleskii.kurochko@gmail.com</a>).

Best regards,
 Oleksii</pre>
    <p></p>
  </body>
</html>

--------------R0yv0aq2cjlHE01ISJyTQsiw--

