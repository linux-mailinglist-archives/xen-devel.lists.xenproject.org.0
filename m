Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AC5255F8
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 21:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327948.550838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npEk3-0002fW-IL; Thu, 12 May 2022 19:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327948.550838; Thu, 12 May 2022 19:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npEk3-0002cp-FD; Thu, 12 May 2022 19:44:55 +0000
Received: by outflank-mailman (input) for mailman id 327948;
 Thu, 12 May 2022 19:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmFN=VU=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1npEk1-0002cb-Ua
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 19:44:53 +0000
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd8d3df4-d22b-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 21:44:52 +0200 (CEST)
Received: by mail-vs1-xe2f.google.com with SMTP id v139so6345733vsv.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 12:44:52 -0700 (PDT)
Received: from smtpclient.apple ([2a0d:5600:6:44::b62e])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a677007000000b0032d275e6907sm69757vsc.7.2022.05.12.12.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 12:44:50 -0700 (PDT)
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
X-Inumbo-ID: fd8d3df4-d22b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=3B8+9l+PMBtpQmuYQQK7mo5R5UmSQ0El1iYJojGekkY=;
        b=XfugUBwOwKZBFD3WLdD2O54UZx1xTkfldPMbwjBhDdZrgTN0wkcUMlK/wzcyd+2ndo
         QP9AHE/Nn4Ap84kvIT7Tx5vFo1QFEly1DdOLUc4fMBfzrYjin52TJADAdYXqUPJKt7MZ
         F+RAkAA5RQRGZJxs5Y/XvRUMX+NXEWzbNysxgpK78/o5bOS8CXcLNQAAC9TMTDXBS3jk
         ojdzwcP9kEy/mkNC1uUMVcvwK+NsCaRIJ0WO7VRlPWFLI3oG+MlNnXc990ulFLdFUrVg
         JHG/iufnTLWbe9IigT4mUKBLEWdbmziI5fhoiItcXcpKx2DrjdFu2Q953fGo/OhzDjhy
         loNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=3B8+9l+PMBtpQmuYQQK7mo5R5UmSQ0El1iYJojGekkY=;
        b=ODes1K5tZh638BQVn1tv4D6zEm8uiPjrMLgEb7z3H4FfUpJNBpdllwYVURUNZUhVPd
         bs0hj2x/Zf9iUsmVv51M0VFlkuK0uQtfaivLCrS3VkLEdOdeeYf664Bu7Zp33WQzrUbk
         /IEoFlm6zWTLmYD7Zcuust4CXK9OS9dSkirhdgbLYZLVs58r/Fv6MiuY8uMf1LV99IP8
         CAyRTC9HAQV/QdHrwcBN3Qj3jUV5+Nvi62l9YMY8+rP+UAY9sIqlfQDyghEs1qhPZesD
         UQFAgkPlSCwkpiqxAEsPbYQmAZHWAoA7o8mzhruTdXU66JaoOiie5amVMy6b+cI9U99E
         KCmw==
X-Gm-Message-State: AOAM5318nXnXQkPPn8z2k4uTNcVSIbt2wpJED2NbFDssA4eUvNgEphYB
	EqZCmgkWu8vRL1EEQlbTQw0=
X-Google-Smtp-Source: ABdhPJyc3s7ZukVRWci6kRCKhMEBfksOHbrOp3jo2xrOCHERoo0JV0UrDMvZhqr10qGkFiUaCpSgAw==
X-Received: by 2002:a05:6102:3d0d:b0:32d:6911:ae72 with SMTP id i13-20020a0561023d0d00b0032d6911ae72mr1130031vsv.60.1652384691572;
        Thu, 12 May 2022 12:44:51 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: PROPOSAL: Delete www-archive.xenproject.org
Date: Thu, 12 May 2022 15:44:49 -0400
Message-Id: <915413E2-1E4C-46F5-8A23-F24967E78401@gmail.com>
References: <8DD705C9-2878-4F22-BEEC-82619857C702@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
In-Reply-To: <8DD705C9-2878-4F22-BEEC-82619857C702@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
X-Mailer: iPad Mail (19E241)

On May 12, 2022, at 11:55 AM, George Dunlap <George.Dunlap@citrix.com> wrote=
:
> =EF=BB=BF
>> On Apr 14, 2022, at 4:49 PM, George Dunlap <george.dunlap@citrix.com> wro=
te:
>>=20
>> I=E2=80=99m pretty sure www-archive.xenproject.org is at least N-2 for we=
bsites; last updated nearly 9 years ago.  As far as I can tell there=E2=80=99=
s nothing terribly interesting stored on the site itself.  I=E2=80=99m going=
 to pursue deleting it within 4 weeks unless someone objects.
>=20
> I have instructed Credativ to take the site down, but keep it in a tarball=
 should we ever need to recover anything from it.

Is all of the historical content from www-archive replicated on the current s=
ite? That content was indexed by search engines and linked from other parts o=
f the web. Are the existing links going to break, or be redirected?

Hosting static content is essentially free, e.g. the entire site could be ho=
sted on GH Pages. Is there a cost to keeping the current site online? How la=
rge are the uncompressed HTML files and images? We don't delete historical m=
ailing list archives, why delete historical web site archives?

While on the topic of historical content, do we have a self-hosted mirror of=
 slides/videos from from SlideShare, Vimeo and YouTube? More than one publis=
her has found their content deleted due to policy changes. It would be prude=
nt to have our own backups.

Rich=

