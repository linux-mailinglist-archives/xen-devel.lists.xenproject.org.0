Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4737E49DF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629010.981030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Skj-0004ir-DF; Tue, 07 Nov 2023 20:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629010.981030; Tue, 07 Nov 2023 20:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Skj-0004gD-9Z; Tue, 07 Nov 2023 20:32:49 +0000
Received: by outflank-mailman (input) for mailman id 629010;
 Tue, 07 Nov 2023 20:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Ski-0004g7-AC
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:32:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa73515-7dac-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:32:46 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9d216597f64so940732966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 12:32:46 -0800 (PST)
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
X-Inumbo-ID: cfa73515-7dac-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699389166; x=1699993966; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m38PUps8ldqcGXeXfhp1gBa/e/TtG/03cwnsr3eLYZc=;
        b=NUAZQoK2Qq9gcj9wK2inx+12UDKK9dUwmBMVtMnp3oeMJUrPv9zOKBN+DmTHPS5VTr
         Z6O5B71qJk4S3fwvz2UYMRJghr04MOVb3FQRLpXOuTXbdn9QppZ0uKm0h0kcFsQOh1El
         X8wgl9ZaS7RSb5MKOXpRvg4EC5xyqI4kMhrv7Xz+F3Ty5EksoY9ffJBCg5zQXsS08DSO
         My95yTKpN0hXCwbEFkrskL/d007kiV9YWQ1eiFXDVEnVv8xkQRQkO7zDCSsWe2PIhIkl
         3E+aqxMDKUo6O7b7fEGN2La3ybBWbuBpk46KAHa0kOEn3OkHZTRpGChgOur9632xDI/s
         337g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699389166; x=1699993966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m38PUps8ldqcGXeXfhp1gBa/e/TtG/03cwnsr3eLYZc=;
        b=KSks/VBCGbsPTJ5KeAqZj4eU67UC23dSSdcagkd+vNi69+MPBv70pRfEPPgjkW/W5w
         7JH3csr7QXjgbyFaLPXDPMXkh3gyzuMwJCao9HP0h0JqkAH61jEu1rWcK9gaoxIYZvYp
         tMgQPjCbpdJZ8KMTz/16nSWyVsM2yB+jOXz9/MG+6DeCJhBtRwGRFz49aywxMmMqca19
         XrIqFIy5dwSPnV4PqyDHt0DfCoD1fvm/3k7RsUcRzedj4qJQ4P/xcgDqgmJSAbOc6Gvp
         unOvkp6SVwVnhraJal5sMyrJQtufO+XNTwicGIuriCFX7CCWi/UiLsBAhZDuN/65iR7N
         v+AQ==
X-Gm-Message-State: AOJu0YxUXvzmADjGRwuTbJsbBP3JntyKED7rcfmpHzPi5v1QUESHRrkG
	oqrVMiuJyWWj4I6U26sCPd1taCjile+/lk7CCSY=
X-Google-Smtp-Source: AGHT+IFo7qHWg8nilM4qvZexkY+717LBLapUZip0cTTlCZ2AhXPc3EGdLXzES+CxnejY4GoYW4Kjk3uuvt/o9NEIadc=
X-Received: by 2002:a17:907:1c17:b0:9d0:e4a1:2826 with SMTP id
 nc23-20020a1709071c1700b009d0e4a12826mr17566479ejc.67.1699389166089; Tue, 07
 Nov 2023 12:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-26-jgross@suse.com>
In-Reply-To: <20231101093325.30302-26-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 15:32:34 -0500
Message-ID: <CAKf6xpv_X1mEM6OmWPfC8tjvzn+ZPEDpVcJ9Q3vUjCvF8sP13w@mail.gmail.com>
Subject: Re: [PATCH 25/29] tools/xenstored: mount 9pfs device in stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 7:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Mount the 9pfs device in stubdom enabling it to use files.
>
> This has to happen in a worker thread in order to allow the main thread
> handling the required Xenstore accesses in parallel.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

