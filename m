Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D7A5A677
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 22:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906868.1314242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trl1a-00082W-J1; Mon, 10 Mar 2025 21:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906868.1314242; Mon, 10 Mar 2025 21:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trl1a-000812-G4; Mon, 10 Mar 2025 21:51:02 +0000
Received: by outflank-mailman (input) for mailman id 906868;
 Mon, 10 Mar 2025 21:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J+5T=V5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1trl1Z-00080w-05
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 21:51:01 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf32235b-fdf9-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 22:50:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 101E0A464B3;
 Mon, 10 Mar 2025 21:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC40C4CEE5;
 Mon, 10 Mar 2025 21:50:54 +0000 (UTC)
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
X-Inumbo-ID: bf32235b-fdf9-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741643455;
	bh=2jdVk8k2Ole035as3LBLHybHTad2Sfu6smck/2Tf7BI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BIUYAbn93Q0ohHrEpVa32CUtOkjnQMiFPScj1Wn5xVxLhO5j69EkxLlodf/d6a5LL
	 FE6UttgVpzzeUHMaTfVDHzPcB8BnutlmSM9wKTBHV4kfQTsi8++hCe6xSk+bvo1DMj
	 Sm+ZjOBRcKxr65DnclZOpsNeIU7GXUK7JUKm1knHQUMmjRX//HvxU+QyI+2hYpKEtf
	 lQZpiSiDcm2NVcNetr0qxWLWD0Bw1zu+E/swDMHDG/lxess07vHZyxvQhex5e2OO2a
	 1rp8QBPB+33QddqVAA6HpylkHh4sB+jQ9GT8ATGIc7zrlq5pz5+kd0A/yKWwTZuF0b
	 2A6hffpezIBbA==
Date: Mon, 10 Mar 2025 14:50:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/cirrus-ci: store xen/.config as an artifact
In-Reply-To: <d9b90141-3af1-4247-b900-0032d70ade0e@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503101450280.3090675@ubuntu-linux-20-04-desktop>
References: <20250310181638.51196-1-roger.pau@citrix.com> <b95a2bcc-4ab8-46d5-9d92-1f2c37d4c279@citrix.com> <Z88xmtUGw5k1nsBN@macbook.local> <d9b90141-3af1-4247-b900-0032d70ade0e@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1572860903-1741643434=:3090675"
Content-ID: <alpine.DEB.2.22.394.2503101450420.3090675@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1572860903-1741643434=:3090675
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2503101450421.3090675@ubuntu-linux-20-04-desktop>

On Mon, 10 Mar 2025, Andrew Cooper wrote:
> On 10/03/2025 6:38 pm, Roger Pau Monné wrote:
> > On Mon, Mar 10, 2025 at 06:30:15PM +0000, Andrew Cooper wrote:
> >> On 10/03/2025 6:16 pm, Roger Pau Monne wrote:
> >>> Always store xen/.config as an artifact, renamed to xen-config to match
> >>> the naming used in the Gitlab CI tests.
> >>>
> >>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Looking at this, I suspect my failure was caused by trying to capture
> >> ".config" directly.
> >>
> >>> ---
> >>>  .cirrus.yml | 12 ++++++++++++
> >>>  1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/.cirrus.yml b/.cirrus.yml
> >>> index e2949d99d73a..1a39f5026f9a 100644
> >>> --- a/.cirrus.yml
> >>> +++ b/.cirrus.yml
> >>> @@ -15,6 +15,14 @@ freebsd_template: &FREEBSD_ENV
> >>>      APPEND_INCLUDES: /usr/local/include
> >>>      CIRRUS_CLONE_DEPTH: 1
> >>>  
> >>> +freebsd_artifacts: &FREEBSD_ARTIFACTS
> >>> +  always:
> >>> +    rename_script:
> >>> +      - cp xen/.config xen-config
> >>> +    config_artifacts:
> >>> +      path: xen-config
> >>> +      type: text/plain
> >> Can't this be part of freebsd_template directly?
> >>
> >> Or is there an ordering problem with the regular build_script ?
> > Exactly, that was my first attempt (placing it in freebsd_template),
> > but then the collection would be done before the build, as
> > freebsd_template sets the env variables ahead of the build, see:
> >
> > https://cirrus-ci.com/task/5086615544004608
> >
> > Thanks, Roger.
> 
> Ok.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1572860903-1741643434=:3090675--

