Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FE7B9D0C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 14:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612984.953207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNgj-0001GL-J4; Thu, 05 Oct 2023 12:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612984.953207; Thu, 05 Oct 2023 12:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNgj-0001Di-FS; Thu, 05 Oct 2023 12:42:45 +0000
Received: by outflank-mailman (input) for mailman id 612984;
 Thu, 05 Oct 2023 12:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8SC=FT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qoNgh-0000ji-KG
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 12:42:43 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad57e67c-637c-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 14:42:43 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50435ad51bbso1178472e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 05:42:43 -0700 (PDT)
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
X-Inumbo-ID: ad57e67c-637c-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696509762; x=1697114562; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFB4lVFLq+3ZyVndg6AF1otH/FaLKRfpZQA9UuhZKbg=;
        b=WKCdUys6ARtNbcl8j+SF9CD/mXNXS1c5hi2DJEfEqvAnYJ6QiFmjqlGeEsK+mMtYYS
         BuLB0+jHeVI+UNABzsIbDNpZQCuDahfFpMfiqPlrDZXQdrAVSU0wd6784YVaZrhhYG1G
         myaF1b2oyD7r7+Wm6IvxuiNvNZx9l1pQ1k3vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696509762; x=1697114562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFB4lVFLq+3ZyVndg6AF1otH/FaLKRfpZQA9UuhZKbg=;
        b=oUykXjlftRwdR+fdGUUuIiuTCRm6H2Y6e53evPosj0AfsehcxQBGgj7xP6A6vu70HI
         gWU0fxrOAIvnk1Y3O165E7MNNuJlJtSajbRxlCRryYHHN9ks9SP4DQ8PpAkiQ2YnlGEV
         hzgj4NHOOSps6B/K8Pwb7p+xL54RoR7hSofDfZNm5YE7H6mIob7COGxJEaScpi3dNzly
         UznW0OYZuOijlETJQUyc0KhGrGaNg2mYaY8hHYLVioHtc1izxG68MdFrkpPo7u1w+fNu
         UffL7LXIZbbNvOZDuUTVvX/SHOZAxxCLT1Ie5R2zo6BzLJlmLOKfnHUkFYrhHBqlj/Yp
         afpQ==
X-Gm-Message-State: AOJu0YzOXEUDtHqrf88dNlBc+7phyCM9mqXQW3GL8C4nCMT9FkOYsTiQ
	ozxrxRe/I56FrBgJk1huPCf4o/gx0eS8NYFPy6Q3qQ==
X-Google-Smtp-Source: AGHT+IHTS4weoOq1IaejShEcxN9cbi2AzkYIlKytrrbbz146Ojk//IQftELLr3gpEFCCn4waxMm936APy9tJn2ZR4vw=
X-Received: by 2002:a19:ca17:0:b0:503:294d:797 with SMTP id
 a23-20020a19ca17000000b00503294d0797mr4034933lfg.11.1696509762532; Thu, 05
 Oct 2023 05:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151127.71020-1-roger.pau@citrix.com> <20231002151127.71020-2-roger.pau@citrix.com>
 <f196e4ac-c458-4c4e-8dd7-4a7b53c763c3@xen.org>
In-Reply-To: <f196e4ac-c458-4c4e-8dd7-4a7b53c763c3@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 5 Oct 2023 13:42:31 +0100
Message-ID: <CA+zSX=YSK6CYd92JrHg=Bkiw2oaLt2x4oUTyTKqjXU58Nc9ZNw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate
 vcpu_info page
To: Julien Grall <julien@xen.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
	henry.wang@arm.com, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 1:11=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> While preparing to commit this series, I have noticed that there are no
> Acked-by/Reviewed-by from Tamas (or at least not present in my inbox).
>
> @Tamas, can you provide one?

I see an "Acked-by" from Tamas two days ago.

 -George

