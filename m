Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419014888AD
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 11:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255112.437195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6VJa-00067A-3g; Sun, 09 Jan 2022 10:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255112.437195; Sun, 09 Jan 2022 10:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6VJa-00064u-0a; Sun, 09 Jan 2022 10:20:42 +0000
Received: by outflank-mailman (input) for mailman id 255112;
 Sun, 09 Jan 2022 10:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6VJY-00064j-M9
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 10:20:40 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca41a26d-7135-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 11:20:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 752C217D;
 Sun,  9 Jan 2022 11:20:37 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJSn2jWH_SWF; Sun,  9 Jan 2022 11:20:36 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 13A5A174;
 Sun,  9 Jan 2022 11:20:36 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6VJT-005iAR-1F;
 Sun, 09 Jan 2022 11:20:35 +0100
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
X-Inumbo-ID: ca41a26d-7135-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 11:20:35 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 02/15] mini-os: makes file.read bool and move it ahead of
 device specific part
Message-ID: <20220109102035.36bhefgq3y2xhdto@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-3-jgross@suse.com>
 <20220109011844.ztd7uwre6kb3dzwv@begin>
 <20220109012100.tpv42y3efylqgrhr@begin>
 <4b989643-9a9f-7bba-d729-d3248db49499@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b989643-9a9f-7bba-d729-d3248db49499@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 752C217D
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le dim. 09 janv. 2022 07:12:32 +0100, a ecrit:
> On 09.01.22 02:21, Samuel Thibault wrote:
> > Samuel Thibault, le dim. 09 janv. 2022 02:18:44 +0100, a ecrit:
> > > Juergen Gross, le jeu. 06 janv. 2022 12:57:28 +0100, a ecrit:
> > > > The read member of struct file should be bool.
> > > > 
> > > > In order to have the device specific part at the end of the structure
> > > > move "read" ahead of that.
> > > > 
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > 
> > > Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> > 
> > Mmm, but tools/libs/evtchn/minios.c needs updating, doesn't it?
> 
> It will be, but assigning 1 to a bool is just fine.

Yes but it's moved in the structure.

Samuel

