Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E884BC8F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 18:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677061.1053464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXPdm-0003RZ-WA; Tue, 06 Feb 2024 17:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677061.1053464; Tue, 06 Feb 2024 17:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXPdm-0003PD-T6; Tue, 06 Feb 2024 17:53:50 +0000
Received: by outflank-mailman (input) for mailman id 677061;
 Tue, 06 Feb 2024 17:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onkB=JP=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXPdl-0003NK-TM
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 17:53:49 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac3b3d85-c518-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 18:53:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 3DDE2A0121;
 Tue,  6 Feb 2024 18:53:45 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoEOQOKMLb2i; Tue,  6 Feb 2024 18:53:45 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id E19D6A0112;
 Tue,  6 Feb 2024 18:53:44 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXPdg-0000000HQU3-1y01; Tue, 06 Feb 2024 18:53:44 +0100
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
X-Inumbo-ID: ac3b3d85-c518-11ee-98f5-efadbce2ee36
Date: Tue, 6 Feb 2024 18:53:44 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org, julien@xen.org
Subject: Re: [PATCH] Mini-OS: fix 9pfs frontend error path
Message-ID: <20240206175344.ljhcmkn2bso4hrvf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org, julien@xen.org
References: <20240206061721.27297-1-jgross@suse.com>
 <20240206152602.5mbztpfam7x2ykcw@begin>
 <6ff940a5-5918-4da4-9a1e-ebe6fe9570a0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ff940a5-5918-4da4-9a1e-ebe6fe9570a0@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jürgen Groß, le mar. 06 févr. 2024 16:37:17 +0100, a ecrit:
> On 06.02.24 16:26, Samuel Thibault wrote:
> > Juergen Gross, le mar. 06 févr. 2024 07:17:21 +0100, a ecrit:
> > > The early error exit in p9_stat() returns without zeroing the p9_stat
> > > buffer, resulting in free() being called with an uninitialized pointer.
> > > 
> > > Fix that by doing the zeroing first.
> > 
> > This is not coherent with the usual conventions: when a function fails,
> > it is supposed not to have done anything, and thus the caller shouldn't
> > have to clean anything.
> > 
> > I.e. i'd rather see the free_stat() call be put after the check for
> > an error returned by p9_stat.
> 
> I can do that, but this would require two calls of free_stat() (one in
> p9_stat() in an error case reported via req->result, and one in the
> caller of p9_stat() in case of no error).

Indeed, but that still looks more coherent with usual conventions.

Samuel

