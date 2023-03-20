Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2556C10CF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:29:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511850.791192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDgf-0007jF-79; Mon, 20 Mar 2023 11:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511850.791192; Mon, 20 Mar 2023 11:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDgf-0007ga-3h; Mon, 20 Mar 2023 11:28:25 +0000
Received: by outflank-mailman (input) for mailman id 511850;
 Mon, 20 Mar 2023 11:28:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=noC+=7M=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1peDgd-0007gU-QD
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:28:23 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510a2822-c712-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 12:28:20 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id s8so14172791lfr.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 04:28:20 -0700 (PDT)
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
X-Inumbo-ID: 510a2822-c712-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679311700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/gvYXIxK9olQJqfA8fmzmbRTg/ZgyuDXSPV7ialyW3Y=;
        b=NtAwJo/NF6WZooaQ1t+QjtBqDWZeomFZ9jKvNqyqaumq05gVVMt6ELQc5R8QZtEyS3
         BzQHbtcGl7XcvQUz7LLhUdTSnwAFdDdryPeHnkBhS8ylmmJz+fC+w3rLEkxKV+fs0qRh
         JRKTNwQoYLcLEU4ZiKsQ/28cm3/iQ5PILWJEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679311700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gvYXIxK9olQJqfA8fmzmbRTg/ZgyuDXSPV7ialyW3Y=;
        b=jxKMES3LKyWAHiyT0kxbV8Iy3HC7NqD0BpbUAsui1Axkti/JHfAm3lazcRFr05WMmz
         5WyoaCYFOKOfT+x9iKzBK/djXfMYOvVaRvgicPNf1ccwl4CQS6XSURSRzl/0ztz5iUMv
         IKDf6brdg+YLDM1ixpJP//pLM4qaipnGg/JisbHy1HqFpfpPbSm2lP41lt15hbVTS+Eb
         7pw5e2ZdOyPNFL26rv2tp8dFJV8YPIReP121hT/oodq7G7N+zWzQirrVXmr+uzs4OV9B
         cR4jBy4fzT+0EBPG1xTTe1zksTr4UXP/gb1uMCVhfIwItYWSuv2W1kFLQlq/+Fus+1gM
         RTdw==
X-Gm-Message-State: AO0yUKWK1bpK2lTPXsghrebMinM5+5VRLPfe+leXF9z22Hen20Jze5RA
	MmYq7XsVcmHi6HeUJtWX4v+fYymDMR09xxLE/IVfKA==
X-Google-Smtp-Source: AK7set/T7NjIqnE1kMTjtiVhxKYj2R/1VOC/iDJa6hr/BKnLuLCnZAIenf0ahEjx+X12RLbtOkNCjrXVa1dJQ44bu0g=
X-Received: by 2002:ac2:4a6e:0:b0:4db:266c:4338 with SMTP id
 q14-20020ac24a6e000000b004db266c4338mr6952305lfp.1.1679311699770; Mon, 20 Mar
 2023 04:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1676750305.git.demi@invisiblethingslab.com>
 <cover.1677356813.git.demi@invisiblethingslab.com> <ccf4f624-356f-4498-9ae3-e4528b9e1901@perard>
In-Reply-To: <ccf4f624-356f-4498-9ae3-e4528b9e1901@perard>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 20 Mar 2023 11:28:09 +0000
Message-ID: <CA+zSX=YBMEwOtbbg77oBHjKa1KeuyTNPafb65=WnzjHk2+1C8g@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Stop using insecure transports
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: multipart/alternative; boundary="0000000000005513ef05f75339bd"

--0000000000005513ef05f75339bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 11:14=E2=80=AFAM Anthony PERARD <anthony.perard@cit=
rix.com>
wrote:

> Hi,
>
> I believe all the containers that needed to be updated in our GitLab CI
> to be able to access HTTPS URLs have now been updated.
>
> So I guess the series is good to go if it's reviewed.
>

Has it run and passed Gitlab-CI with the new container images?

 -George

--0000000000005513ef05f75339bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 20, 2023 at 11:14=E2=80=AFAM =
Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com">anthony.per=
ard@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi,<br>
<br>
I believe all the containers that needed to be updated in our GitLab CI<br>
to be able to access HTTPS URLs have now been updated.<br>
<br>
So I guess the series is good to go if it&#39;s reviewed.<br></blockquote><=
div><br></div><div>Has it run and passed Gitlab-CI with the new container i=
mages?</div><div><br></div><div>=C2=A0-George</div></div></div>

--0000000000005513ef05f75339bd--

