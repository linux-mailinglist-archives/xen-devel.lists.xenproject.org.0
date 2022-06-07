Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78186540DA5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 20:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343472.568810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyeFu-0005Qt-01; Tue, 07 Jun 2022 18:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343472.568810; Tue, 07 Jun 2022 18:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyeFt-0005Np-TG; Tue, 07 Jun 2022 18:48:41 +0000
Received: by outflank-mailman (input) for mailman id 343472;
 Tue, 07 Jun 2022 18:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OQGf=WO=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nyeFs-0005Nj-J7
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 18:48:40 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 716c0ba2-e692-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 20:48:39 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id h187so11967492oif.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jun 2022 11:48:39 -0700 (PDT)
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
X-Inumbo-ID: 716c0ba2-e692-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tgKco9MRubG8WBIGWhqaMAjuefz45fkYscFCEEt8VNo=;
        b=EMniyzo/gc9yNNU7LvcM5tky+bmChS0d0WNwi8holR7nNenOnchm2eh0DhQPZ4ENvD
         L/5AVAFeMBzXbfw6xLcDjDKSl1euXC+ELRl+HWQ8MqO2AXIEx61xtueuavN/xYckKAKz
         DA2zOfl4OYSLPN06dDbTNoWs+8OYKNetMGVytR/sHMxpnyz8lXinZmpX2zNE/XbU9eo5
         JPeFASn/c7dq7X0tjDt1RnawsHAmmH+vougGIS48y9uCpMfs0MqSJYWeToSZ4gPyvkjl
         +mx7DJhXEjU++j31MLrhLrLGQBqcj03kxp6HgiF1WqTeOQHaoz+KojLuaqVlcobn4TL5
         n6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tgKco9MRubG8WBIGWhqaMAjuefz45fkYscFCEEt8VNo=;
        b=4JcDkdMAyVeuvcKA/FT8dlwvH4/z5obeJxFLZZHsArSt/d6NDiguh/YwpqK+whOMMc
         HE5libKoaR75YnexoHaKBuhC4OAh2t0gnhnc4IdzeK+Ohx3KSYR6ePNW6lgzaEpnVfYM
         LDZMnq1D1B9wdBWT3RYSbKdxX3BeVZ8q/qe4SYIF8rPKvCfkSMtHY/CTk35WM/CxeVe0
         rhNt1QDZ7o7AuQDnlSEQvJkdzaTq3YriTtoqH4p08k8g1zpXMGc77vik+HQHh6383g6m
         1T+/w4dNejH2P4Q7nGifXI+bLUP/PxLoBgJDv8A1DOHjcsBnTz/xlpHqXEB58GcXQGoN
         xswA==
X-Gm-Message-State: AOAM5319M1+I1nCUij12E1/VVYtWTo/EgAdQ6ZKuBMrzY//2BAvdMcRD
	awTYAMsYN6SZMpC8y071RZeF1qUMSIrEdPcmgHQ=
X-Google-Smtp-Source: ABdhPJxcBHyJoQXbk17VvTdPQCYRoUzhpmn8EG3+I48sv6EecSJa+IiYDY3v/jvxYS69VkZreRx42i88V8cgDHVRtDE=
X-Received: by 2002:a54:4486:0:b0:32e:aa60:134a with SMTP id
 v6-20020a544486000000b0032eaa60134amr183949oiv.9.1654627718000; Tue, 07 Jun
 2022 11:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 7 Jun 2022 14:48:01 -0400
Message-ID: <CABfawhn_R-Kd1w8OhPh2Lf6UDS28j-6W=5EOJ9CARV83U328aQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] Add Xue - console over USB 3 Debug Capability
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2022 at 10:31 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> This is integration of https://github.com/connojd/xue into mainline Xen.
> This patch series includes several patches that I made in the process, so=
me are
> very loosely related.
>
> The driver developed by Connor supports output-only console via USB3 debu=
g
> capability. The capability is designed to operate mostly independently of
> normal XHCI driver, so this patch series allows dom0 to drive standard US=
B3
> controller part, while Xen uses DbC for console output.
>
> Changes since RFC:
>  - move the driver to xue.c, remove non-Xen parts, remove now unneeded ab=
straction
>  - adjust for Xen code style
>  - build for x86 only
>  - drop patch hidding the device from dom0

Tested-by: Tamas K Lengyel <tamas@tklengyel.com>

