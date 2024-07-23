Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE665939EEF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763003.1173252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWD1O-00080B-Bq; Tue, 23 Jul 2024 10:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763003.1173252; Tue, 23 Jul 2024 10:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWD1O-0007yU-8f; Tue, 23 Jul 2024 10:45:30 +0000
Received: by outflank-mailman (input) for mailman id 763003;
 Tue, 23 Jul 2024 10:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWD1M-0007xr-Sb
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:45:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab046243-48e0-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 12:45:26 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7a91cdcc78so26431166b.3; 
 Tue, 23 Jul 2024 03:45:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa38fesm7356311a12.35.2024.07.23.03.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 03:45:23 -0700 (PDT)
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
X-Inumbo-ID: ab046243-48e0-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721731524; x=1722336324; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lP51VGX/OgUw3HTE0gywU0LsHSW3IICbIntS6gP1HaA=;
        b=Wn4G/inHnAV3HoQsvzYvAXJ32OXv2cGjENK2pxCS/VZ4vefYBVXpdxIO1YuPDuh+xn
         1w9+IhP56dKj45MhQWXvHg+eLu0pajTxIPS7Md66XUcRwjW+2uNzRbybmZhmQYMPAMZM
         TFQG1jv3IB6SVT4P4nl5ZaTMnrcENbe3satTxFepOWATVcZgwlQZ9V8dKyqcldYBKcEp
         39re6pCze844Hbes1i/dbFsW/yErU2PDipN3WJrPla+idrJzJGgslhFr0yLEg5FXjkww
         X1Nh7dt3ffVBYjBtQ4zW7N+ZGqBPR/b7FFn/Gr3xKn8R4LT5b1lq897FWqfP94jGCjMo
         /gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721731524; x=1722336324;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP51VGX/OgUw3HTE0gywU0LsHSW3IICbIntS6gP1HaA=;
        b=HIEkLhwLK9orbzcApdYDyFJDlTN8U01Z75DzWfqTB340PYX8DqOIC6WGmD++I9u8wn
         bu6m0Jbzb02JqNRJImnhLmkeGg6aVlmA61+/bpjVyUsqwH0i3LFaptndRVEU2ZJKiBqM
         8SuZRmF9c1qGZBvNLvPk6RUuWTH9VmjvcGs0wswUbvC4VN8QMvoNsfxxkgoox0k7PJ5i
         Jz/5hTY1g/lGNjyhCcOPQeEkTpIAPL8WIjqcwqHxM5gPGfpKmSran1LQOy5ufJbcIl0E
         r60wPjfAJ870YbwTIwmtjs5rw7jgPcd2fGGXy+ZYALs6lj0gwgprQmMPb3rFTKHLWPql
         Ensg==
X-Forwarded-Encrypted: i=1; AJvYcCUBcxTgjK0rh8ua9qE5dggHQOo3FrS0vFAxrDeSTgfR2h8Tvnb7+xeQ3UUru8xSTohsnl2TW5hTmD0H+lOHrlrvnZC6HAPHQPL7RPdhh8rpZ6k=
X-Gm-Message-State: AOJu0Yza+uoIoqikgIBhFiG6L7djwyw29IjpPjfULF+Ip0h6F3u4FLjv
	bEtayoav4vPOcxqiSB9RZyZE2Koo06uR/jxCyKw86i6mTovDtoy7cNlIWwYK
X-Google-Smtp-Source: AGHT+IGYnUEjnZ+70xz938Sk/e5pyFQeeFsSL84nHM5gvhjXvf08ItX8Lg1mmO0EJaG711AyaapJEA==
X-Received: by 2002:a05:6402:5111:b0:5a3:8077:3c90 with SMTP id 4fb4d7f45d1cf-5a47b7ab45emr8301220a12.33.1721731523919;
        Tue, 23 Jul 2024 03:45:23 -0700 (PDT)
Message-ID: <b0334b68f130984f58fbd4adc1044626dd282768.camel@gmail.com>
Subject: Xen 4.19-rc4
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org
Date: Tue, 23 Jul 2024 12:45:22 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi all,

Xen 4.19-rc4 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.19.0-rc4

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.19.0-rc4/xen-4.19.0-rc4.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.19.0-rc4/xen-4.19.0-rc4.tar.=
gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Best regards,
 Oleksii

