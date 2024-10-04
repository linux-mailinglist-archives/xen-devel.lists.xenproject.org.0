Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DD98FEA4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810077.1222690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdMq-0003NS-VR; Fri, 04 Oct 2024 08:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810077.1222690; Fri, 04 Oct 2024 08:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdMq-0003Kw-ST; Fri, 04 Oct 2024 08:08:52 +0000
Received: by outflank-mailman (input) for mailman id 810077;
 Fri, 04 Oct 2024 08:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdMp-0003Km-Qy
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:08:51 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3437f69-8227-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:08:50 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5e1b6e8720dso952789eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:08:50 -0700 (PDT)
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
X-Inumbo-ID: e3437f69-8227-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029329; x=1728634129; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5U/RfJiVVDXWCtXvmAmRE+qP8KedmL9mM5VnKMMLDg=;
        b=ckS38WHz3DTL3T1LNv7Wi1GK5a3JZqkrB9wXUPLMXpTMJMx9HPdMpu8xr2YtJrZ9kc
         O0aS9N4uCfDXxqA9XARaW8Is+x8OC7Bg80p9UN/1JlU4XMGQnfwVwJGZSmg3dN/Q2lBN
         oBhh6KXUUfjWKF+t5vRAjEr5D1yq9lAdl/mqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029329; x=1728634129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5U/RfJiVVDXWCtXvmAmRE+qP8KedmL9mM5VnKMMLDg=;
        b=eINWW8+k6kcTNUMgiNHEHuyv2D6KkM0I8jEkdx3u1L41gJrhmUGsQ5ffsrzIZ7owo+
         emqxj+72kzTln3xWWHJD3e4DeDk+VKVaPcjjnM9GL8hFDMEN4kNut7g8lLaTkIY1oTPU
         Vwp5SStAizthpi25EoM+hK6Q6vbwJYvuz09CUg0wvWNMF+wH65Q4SEUc/50+mzUM7mFd
         OkHxTj899zfguRo6ymlIQ+rKiV8knPqI2dgPB4WdyXFkHYOx7+LgWNnDmRV6GOHjiTNB
         iRM18GF7c6DxhkzH0tWf3HCv5IRJHfESwV+P6XQY9wn+NrVIXKJ5gn1mr12RnIml49/9
         OyKw==
X-Gm-Message-State: AOJu0YzQys9odli/TGnN5C9bsCLc2mtt4tNWTGmza2rMOfcylQ1NF3BT
	R37s79deBWyBmWwH/JL2VfZEjkTMymngEoXzN5Epm0kU1oBgIgzPAdVo61w5dHvyO6MU9QAU8rG
	1JxId08xkC71BT6neA4ZQqWg9GLZn25sOCZxwu00cZESJdHOt
X-Google-Smtp-Source: AGHT+IGaCRp1L7gV1QiYnElWK/5W2LRwV7vWLfoqgYKY1Mue4Zg2j9/RgIDjOoKNzT369Rqu+Bi2dT3uPh8V5Z/EYaM=
X-Received: by 2002:a05:6870:65a8:b0:27b:7370:f610 with SMTP id
 586e51a60fabf-287c1d3822amr1498378fac.10.1728029329283; Fri, 04 Oct 2024
 01:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240926095133.483619-1-frediano.ziglio@cloud.com>
In-Reply-To: <20240926095133.483619-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 4 Oct 2024 09:08:37 +0100
Message-ID: <CACHz=ZgwcejTF0Yz5vchVy18Hn15LYp_R8Y1LqOA=qAHK-HRiA@mail.gmail.com>
Subject: Re: [PATCH] Update deprecated SPDX license identifiers
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
	George Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 10:51=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> As specified in LICENSES/GPL-2.0:
> - GPL-2.0 -> GPL-2.0-only;
> - GPL-2.0+ -> GPL-2.0-or-later.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

ping

Frediano

