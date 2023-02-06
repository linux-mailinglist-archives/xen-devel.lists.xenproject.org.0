Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E8868B8EC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 10:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490163.758758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOy6x-0001E6-0V; Mon, 06 Feb 2023 09:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490163.758758; Mon, 06 Feb 2023 09:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOy6w-0001BW-Sx; Mon, 06 Feb 2023 09:48:30 +0000
Received: by outflank-mailman (input) for mailman id 490163;
 Mon, 06 Feb 2023 09:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8JA=6C=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOy6v-0001BL-R7
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 09:48:29 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 686e1ae3-a603-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 10:48:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 3112220137;
 Mon,  6 Feb 2023 10:48:28 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37gCvjbV6Dqt; Mon,  6 Feb 2023 10:48:28 +0100 (CET)
Received: from begin (unknown [89.207.171.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 03F7D20135;
 Mon,  6 Feb 2023 10:48:27 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOy6t-0092S6-0v;
 Mon, 06 Feb 2023 10:48:27 +0100
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
X-Inumbo-ID: 686e1ae3-a603-11ed-933c-83870f6b2ba8
Date: Mon, 6 Feb 2023 10:48:27 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 4/7] Mini-OS: add 9pfs frontend
Message-ID: <20230206094827.rayr5tqstjnco3nf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-5-jgross@suse.com>
 <20230206090139.ehvf2czoocn6j7nc@begin>
 <383cbd1b-6518-bc1d-a3ae-5562e3dec5c1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <383cbd1b-6518-bc1d-a3ae-5562e3dec5c1@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 06 févr. 2023 10:22:10 +0100, a ecrit:
> On 06.02.23 10:01, Samuel Thibault wrote:
> > Juergen Gross, le ven. 03 févr. 2023 10:18:06 +0100, a ecrit:
> > > +void *init_9pfront(unsigned int id, const char *mnt)
> > > +{
> > [...]
> > > +    free(xenbus_watch_path_token(XBT_NIL, bepath, bepath, &dev->events));
> > 
> > Better check for errors, otherwise the rest will hang without useful
> > feedback.
> 
> This is a common pattern in Mini-OS frontends.

Ah, indeed. Ok, then.

> > > +    for ( v = version; *v; v++ )
> > > +    {
> > > +        if ( strtoul(v, &v, 10) == 1 )
> > > +        {
> > > +            v = NULL;
> > > +            break;
> > 
> > This looks fragile? if version is "2.1" it will accept it apparently? I
> > guess better check whether strtoul did read a number, and in that case
> > break the loop anyway, successfully if the number is 1 and with failure
> > otherwise.
> 
> Versions are defined to be integers.

Ah, it's a list of versions?
(I don't know the protocol at all).

> I can add checks for sanitizing backend written data, but I'm not sure we
> need that. In case the backend wants to fool us, it can easily tell us to
> support version 1 even if it doesn't.

Not necessarily fooling, but misprogramming :)

> > > +        }
> > > +    }
> > > +    free(version);
> > > +    if ( v )
> > > +    {
> > > +        reason = "version 1 not supported";
> > > +        goto err;
> > > +    }
> > 
> > This looks odd: when number 1 is detected this breaks out successfully,
> > while the error message otherwise says that it's version 1 which is not
> > supported? Is the message supposed to be "version greater than 1 not
> > supported"?
> 
> I can change the message to "Backend doesn't support version 1".

Aah, yes indeed, that was the part I missed for understanding it all :)

Samuel

