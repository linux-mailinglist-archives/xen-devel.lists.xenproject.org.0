Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13808B563BF
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 01:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123570.1466482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxZZC-0002zR-J8; Sat, 13 Sep 2025 23:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123570.1466482; Sat, 13 Sep 2025 23:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxZZC-0002ws-DX; Sat, 13 Sep 2025 23:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1123570;
 Sat, 13 Sep 2025 23:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBAy=3Y=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1uxZZA-0002wm-SX
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 23:22:00 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e6a047c-90f8-11f0-9d13-b5c5bf9af7f9;
 Sun, 14 Sep 2025 01:21:54 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1757805708409168.5613458921232;
 Sat, 13 Sep 2025 16:21:48 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-322f0a39794so911666fac.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 16:21:48 -0700 (PDT)
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
X-Inumbo-ID: 6e6a047c-90f8-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; t=1757805710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Svcm3mobCYbmtaKgvDfiCw1S4czfRKrJHI7Nxwh20aCslb3hRrIkLmmtS2hnV5ddndgiz8urjqKjGSwEiWih8UM7qzknWYXaC/C+SBYtBqzENc9mZq+shimHU8EAZdgTrvXJCIULqGbP/j05yjzWSL6bYQtcgEaXpdw9Qx242Rw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757805710; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lb4oPEpeznTSNONNNkvIwZWMW8wPE/TZ8ZqgB31kdBU=; 
	b=NSoPXnzXA639TFkNgfIiRYqfiVgi7+MuoGlPp1QvxTT788pSSVOWM9HL45geL7dAj2VFITu5Je8FJvYF0D+oE5ggzpEIeQ/eXVQ29yEx+orttH6SpcUEVoPNKo8uiV+Py3pGEDuth+T2PHYyI7uOSHLblWo6OoxMzy7Gw97R114=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757805710;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lb4oPEpeznTSNONNNkvIwZWMW8wPE/TZ8ZqgB31kdBU=;
	b=BJYCEwM+J6jYBeb7HP+RwlN+8fBFs5gVClzhI3hE5bsopg45UdPjWJVuku1WJi6P
	gO0ebe7Kh72EWNgPWettBCvlbYAz2NevJLyjuFhmpYbp69KQlKvgZAVkjwbdQLOpcvz
	fcWBf7rojmkH004+9gbvrNP44NdsE5SOP4zT2+1s=
X-Forwarded-Encrypted: i=1; AJvYcCVhcyMAUTmuTdJ7VI1yP1MCoPiL8Zh0xoX+uC7NiYA1lBBMqz5/SThXWosONi/xUyiN5JAj8I80y/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUGt+qYU4UQ6AiPReTfeuc1eRSFebD11r+E6BtWUST2MrEBvvu
	JFaoIfZB4GMutnbdVTA3havYOXjL14CqPyoBvSkU1oQlKJ4HOvbqOGClFBkdLWQ6C65qM4BfSbU
	UA9wVTsK2xizZPmnW1rwM0Sp/MmcOkLQ=
X-Google-Smtp-Source: AGHT+IH6rlFWsBb58CAzact8c+s/gwD+oH00dVydclqv9iB+pIhEiCJYR+hgRKqOyTCVo2GGvYjynTkFHE6w7e1a0S8=
X-Received: by 2002:a05:6871:611:b0:31d:8c33:59b4 with SMTP id
 586e51a60fabf-32e55ec69f7mr3157277fac.28.1757805707555; Sat, 13 Sep 2025
 16:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-6-Penny.Zheng@amd.com>
 <4e61f21e-6e1e-4baf-a78e-2b17b876d20c@suse.com>
In-Reply-To: <4e61f21e-6e1e-4baf-a78e-2b17b876d20c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 13 Sep 2025 19:21:11 -0400
X-Gmail-Original-Message-ID: <CABfawhkON8sEQHHmCY+hknoX33uJ4xr=d3J3WOV=eDc_oR60wQ@mail.gmail.com>
X-Gm-Features: AS18NWBoTwWby4gfbh2Hlm-4u3KeUcE6OcRxRuvhCYTlG9I8nsZw1HHCi0AJzgM
Message-ID: <CABfawhkON8sEQHHmCY+hknoX33uJ4xr=d3J3WOV=eDc_oR60wQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/26] xen/x86: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 11:06=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 10.09.2025 09:38, Penny Zheng wrote:
> > VM event could only be enabled/disabled via vm_event domctl-op, so
> > CONFIG_VM_EVENT shall depend on CONFIG_MGMT_HYPERCALLS
> >
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>
> Looks plausible to me, so:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> but really Tamas (now Cc-ed) should also get a chance to express possible
> concerns.

No concerns, thanks.

Tamas

