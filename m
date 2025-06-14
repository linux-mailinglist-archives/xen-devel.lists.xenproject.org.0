Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E7AD9E7A
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 19:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015746.1393281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUeY-0002tr-On; Sat, 14 Jun 2025 17:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015746.1393281; Sat, 14 Jun 2025 17:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUeY-0002rU-IG; Sat, 14 Jun 2025 17:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1015746;
 Sat, 14 Jun 2025 17:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUeX-0002rH-1N
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 17:26:49 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb6e51d-4944-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 19:26:46 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-70e6bddc30aso27404937b3.0; 
 Sat, 14 Jun 2025 10:26:46 -0700 (PDT)
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
X-Inumbo-ID: beb6e51d-4944-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749922005; x=1750526805; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJCZ4kEjuHzHgfAjb5QZWRKn5ynqjQ7bSPlRAN8WfrM=;
        b=gvLQ01Jr12sRNOggxlXkgljHyJr0iS8YkorZNxy62zXixJcSjfq+alFmhs4ez2xw5l
         alrpvfPhyJ5lINCZNdi30axM6c7Vhr1aRK+3vM7+MrXnkXuJ8hanAdZoZpfgXQhYDoJB
         DIoIdFYafzb0cW5FBxl43DUTch4FIrEQBhiy/FD1hIs7ehdJ4neyewwNTCSZeRGDZzGb
         e1axEH4FcKRKV7RqwC7GDY8PugqPMBVu/hYo6k0MkaFujdsSA81GMrj1toUkyq88UjRG
         cCNugIg5DYp1PnQRjgywahuidcbDmnBvCT3y9mrnWiGs1QaN53Gr6v6UxS5GyZjiKp6L
         Dqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749922005; x=1750526805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJCZ4kEjuHzHgfAjb5QZWRKn5ynqjQ7bSPlRAN8WfrM=;
        b=j73qNo64sAKv7PrhKs0BSEm9kLzfMrp+A1GU5opZ2yj0hwE7uZAVTatYRuAYpf0HIh
         dwbmgOGDUGyExnqof09eFgitKkCis1DBgSwaui3TeAk7jvlo0FlKF9Azh3eQfFRvf6eB
         PLaq6oOtouOE27V4zDLRhPd0cPo/n6PvLl9xlbOhQDsKxloP64HIq+oxCuAzM6GXzNjk
         iKtGEfSjuDjThfhVnX7fnAWuL6VzZlLbu7+6LuaAbJm0Yvauu0pJ+F5/5CjfgtL7Rjrh
         OqNaVVZjqd4QcE6muq+IwbAxNKOUGtAneRD2mWwFVxqRxiF8+TseYtfdCHCmb5MrAK9W
         OxRg==
X-Forwarded-Encrypted: i=1; AJvYcCU1+4rFXXET2E0nl03LbPYYREr/2LxfJRqyp3nu+qjQ67IBLbwQij9TQ/OPbAXaUyWaMWgUpSS28Wk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyqnv+kTly8ag5Wu3kzp2RIDYe6YrS2dnMlR/l9wt9GnTA3I2Tm
	YZ2gHHfAbN2W+w2YblocGtl5vwAraDhbOEHlwvJW/ESdh/kJEaQo28/V8uvy+D8eRGWFhMLhcSk
	/JnQIApr0Rn3bO0VmHt+MEUtVLixxFUOQ7w==
X-Gm-Gg: ASbGnctQky0JXiVypCeycxyoqKRJp1xCFmFzkvX3XjC/RXy4QyEXT52zTnCqGd3fkfg
	QUyhNJCcY2qXdopdENpUtjJsoYGf0ZzLABxKfBTziM2gkc1MrXrAPSrgD7+9BBHlauoDzzWy864
	0HOcLL7meQVrlxv/OzBQqZsAzsjYQ7RGzXetaUEqfl
X-Google-Smtp-Source: AGHT+IEMALxpsIxc1eV0koLniB8nABNQTVZs7oJx4cD8JykKYVTYUDzGzuDIWZt6Ss52KBvEZEKMqw0MDi6Q1+QKQMQ=
X-Received: by 2002:a05:690c:a8e:b0:70d:f237:6a5a with SMTP id
 00721157ae682-71175383953mr52498777b3.8.1749922004928; Sat, 14 Jun 2025
 10:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-11-jgross@suse.com>
In-Reply-To: <20250321092451.17309-11-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 13:26:33 -0400
X-Gm-Features: AX0GCFv_vQ1r_KhhIS-I2AjPO6bAA15N3f0sysGZJIN02eP_RvQ3_B2THRGVnjQ
Message-ID: <CAKf6xpvV7njQ6iV1Cnx=ROFxSA21zMiNQAQj8Vzd-dL3LeWuNA@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 10/12] kexec: switch read-only area to be writable again
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:30=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> In order to allow writing the new kernel, make the readonly area
> covering current kernel text writable again.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

