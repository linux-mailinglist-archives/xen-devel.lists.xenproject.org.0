Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD454D0DF1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 03:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286507.486060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRPS3-0007Dz-Pk; Tue, 08 Mar 2022 02:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286507.486060; Tue, 08 Mar 2022 02:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRPS3-0007CC-Jw; Tue, 08 Mar 2022 02:19:51 +0000
Received: by outflank-mailman (input) for mailman id 286507;
 Tue, 08 Mar 2022 02:19:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJ36=TT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nRPS2-0007C6-Bf
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 02:19:50 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a84a986-9e86-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 03:19:48 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id g39so29598928lfv.10
 for <xen-devel@lists.xenproject.org>; Mon, 07 Mar 2022 18:19:48 -0800 (PST)
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
X-Inumbo-ID: 3a84a986-9e86-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iFAibcRWNE35UOcnXkapKq77qG8nZ67Esy5gljmzfPU=;
        b=cLpWod/ida82hDcPeKlONEOZTi+GTmnOQAwsQrb4n+18SYMgyv+jMdU/XK2PWWWbEC
         R7wY1V8PNsp2oK1LQV1LvTSeZNvvPaoZzVweNSboJ/LpkZAyHHDxJWeCWSUZFBygMEDH
         PCAeBAmZeogpfNY59ol5e4DygLIFWh/cTGx030pc9ICZNTw0F0R1p5iKxy3zZiKPV/Gx
         Wn/+GX3FBD1NXN+C97cTaSVjXeLHTRJDmk+iy64cBMA0zRVU8wW0Boy5JhR0YEnvGqOG
         C8aGvsjKbnnqNB6fMrbEiR2qBw08QBJ/DugOFOxdA0V5ZcZorGuPK/inoPHrKV0g7KxH
         wCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iFAibcRWNE35UOcnXkapKq77qG8nZ67Esy5gljmzfPU=;
        b=7fO2xuQH5I71nFQLLROpnHHntZGDN2XoP4a7v/IwUGlMrW51nokM66YJ2j7eHbwEYc
         HCCttMhEvDPY/5fZ4rhyMpsuLp2HeqhWIoz0ovSQSCMZPDa/NQe3lyWCGlJOI0A9YUlS
         J+IMc9IOLmhRJT8opAONttCVeFwIfBp2+J9NEiGDhMYSHvIvX4gFxEscpgxJDI5Mp+dK
         n7OOF+iTdl8rPSzHhd42hTDiyZDCzAQ1/f3LXqKBRKcz7hvddLbdch9ExWYzNk/OQxcw
         EHA6O8F3OM2DrSLSB8x5L1ylqlv9Tc6zpHJEc4+do6aOaZ3uGDtezpNMp4JWqntdR5l1
         o+mA==
X-Gm-Message-State: AOAM5322vs2Oxyz8qYuqLrC0wsJom2tI+A/SBZAO6+QHEz5c/ZvBj0So
	pwd83iQ9TCYfWvT/YNgX3+VYNbri0EaWJRVmHDQ=
X-Google-Smtp-Source: ABdhPJwOPJ3zL2JyojKTY9vqzD+Po4i5YwidIMMmVrK8LCPyh33q5TGOW+HyJlLOkZZ998mNjtk5NihKUGE8Njsg3jY=
X-Received: by 2002:a05:6512:36c1:b0:443:41a7:27e6 with SMTP id
 e1-20020a05651236c100b0044341a727e6mr9642338lfs.359.1646705988195; Mon, 07
 Mar 2022 18:19:48 -0800 (PST)
MIME-Version: 1.0
References: <CANH0Q9k6SJQ+EXNZz+-ZPnPtsxHXthYcx1E6z8euSDEt7XhLQg@mail.gmail.com>
 <871qzhiwqg.fsf@linaro.org> <CANH0Q9mF-vmW6gNDWnkMKR-VGQ2YbT+_55p=8F-N_L67Wuv5NQ@mail.gmail.com>
In-Reply-To: <CANH0Q9mF-vmW6gNDWnkMKR-VGQ2YbT+_55p=8F-N_L67Wuv5NQ@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Mar 2022 21:19:36 -0500
Message-ID: <CAKf6xpub8XNd+AGhcQEsQQmxvDQQDLyNYns1hoBikgijQ27C-w@mail.gmail.com>
Subject: Re: How to create and start Xen guest VM by qemu-system-x86_64
 command line
To: Trigger Huang <trigger.huang@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 6, 2022 at 7:47 PM Trigger Huang <trigger.huang@gmail.com> wrote:
>
> Hi Alex,
>
> Thanks for the response.
>
> Actually my target is trying to enable virglrenderer on Xen based Qemu. Before, I have successfully enabled it on KVM based Qemu by the Qemu command line. Such as 'qemu-system-x86_64 -device virtio-vga-gl  xxxxxxx'
> If change to use xl, I don't know how to set this kind of special option(-device virtio-vga-gl ) to qemu after I checked the xl's arguments. Or do you have any idea? :)

You can use device_model_args in your xl.cfg:

       device_model_args=[ "ARG", "ARG", ...]
           Pass additional arbitrary options on the device-model command line.
           Each element in the list is passed as an option to the device-
           model.

Regards,
Jason

