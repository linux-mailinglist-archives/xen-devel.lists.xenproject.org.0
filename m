Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224B48872E
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254962.436889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6MtQ-0001P6-Ga; Sun, 09 Jan 2022 01:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254962.436889; Sun, 09 Jan 2022 01:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6MtQ-0001LZ-CV; Sun, 09 Jan 2022 01:21:08 +0000
Received: by outflank-mailman (input) for mailman id 254962;
 Sun, 09 Jan 2022 01:21:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6MtO-0001JH-LL
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:21:06 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69460c7f-70ea-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:21:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B4FCE3A7;
 Sun,  9 Jan 2022 02:21:02 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1x4HL83GeeH; Sun,  9 Jan 2022 02:21:01 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 47ECA64;
 Sun,  9 Jan 2022 02:21:01 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6MtI-006iHK-8I;
 Sun, 09 Jan 2022 02:21:00 +0100
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
X-Inumbo-ID: 69460c7f-70ea-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:21:00 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH 02/15] mini-os: makes file.read bool and move it ahead of
 device specific part
Message-ID: <20220109012100.tpv42y3efylqgrhr@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-3-jgross@suse.com>
 <20220109011844.ztd7uwre6kb3dzwv@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109011844.ztd7uwre6kb3dzwv@begin>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: B4FCE3A7
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

Samuel Thibault, le dim. 09 janv. 2022 02:18:44 +0100, a ecrit:
> Juergen Gross, le jeu. 06 janv. 2022 12:57:28 +0100, a ecrit:
> > The read member of struct file should be bool.
> > 
> > In order to have the device specific part at the end of the structure
> > move "read" ahead of that.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Mmm, but tools/libs/evtchn/minios.c needs updating, doesn't it?

> > ---
> >  blkfront.c             |  4 ++--
> >  console/xencons_ring.c |  2 +-
> >  fbfront.c              | 12 ++++++------
> >  include/lib.h          |  3 ++-
> >  netfront.c             |  4 ++--
> >  tpm_tis.c              |  2 +-
> >  tpmfront.c             |  6 +++---
> >  7 files changed, 17 insertions(+), 16 deletions(-)
> > 
> > diff --git a/blkfront.c b/blkfront.c
> > index 834a978..7c8eb74 100644
> > --- a/blkfront.c
> > +++ b/blkfront.c
> > @@ -62,7 +62,7 @@ void blkfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
> >      int fd = dev->fd;
> >  
> >      if (fd != -1)
> > -        files[fd].read = 1;
> > +        files[fd].read = true;
> >  #endif
> >      wake_up(&blkfront_queue);
> >  }
> > @@ -484,7 +484,7 @@ int blkfront_aio_poll(struct blkfront_dev *dev)
> >  moretodo:
> >  #ifdef HAVE_LIBC
> >      if (dev->fd != -1) {
> > -        files[dev->fd].read = 0;
> > +        files[dev->fd].read = false;
> >          mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
> >      }
> >  #endif
> > diff --git a/console/xencons_ring.c b/console/xencons_ring.c
> > index b6db74e..c348f3c 100644
> > --- a/console/xencons_ring.c
> > +++ b/console/xencons_ring.c
> > @@ -102,7 +102,7 @@ void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data)
> >          int fd = dev ? dev->fd : -1;
> >  
> >          if (fd != -1)
> > -            files[fd].read = 1;
> > +            files[fd].read = true;
> >  
> >          wake_up(&console_queue);
> >  #else
> > diff --git a/fbfront.c b/fbfront.c
> > index d3b3848..6725da1 100644
> > --- a/fbfront.c
> > +++ b/fbfront.c
> > @@ -45,7 +45,7 @@ void kbdfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
> >      int fd = dev->fd;
> >  
> >      if (fd != -1)
> > -        files[fd].read = 1;
> > +        files[fd].read = true;
> >  #endif
> >      wake_up(&kbdfront_queue);
> >  }
> > @@ -207,7 +207,7 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
> >  
> >  #ifdef HAVE_LIBC
> >      if (dev->fd != -1) {
> > -        files[dev->fd].read = 0;
> > +        files[dev->fd].read = false;
> >          mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
> >      }
> >  #endif
> > @@ -229,7 +229,7 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
> >  #ifdef HAVE_LIBC
> >      if (cons != prod && dev->fd != -1)
> >          /* still some events to read */
> > -        files[dev->fd].read = 1;
> > +        files[dev->fd].read = true;
> >  #endif
> >  
> >      return i;
> > @@ -349,7 +349,7 @@ void fbfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
> >      int fd = dev->fd;
> >  
> >      if (fd != -1)
> > -        files[fd].read = 1;
> > +        files[fd].read = true;
> >  #endif
> >      wake_up(&fbfront_queue);
> >  }
> > @@ -376,7 +376,7 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
> >  
> >  #ifdef HAVE_LIBC
> >      if (dev->fd != -1) {
> > -        files[dev->fd].read = 0;
> > +        files[dev->fd].read = false;
> >          mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
> >      }
> >  #endif
> > @@ -398,7 +398,7 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
> >  #ifdef HAVE_LIBC
> >      if (cons != prod && dev->fd != -1)
> >          /* still some events to read */
> > -        files[dev->fd].read = 1;
> > +        files[dev->fd].read = true;
> >  #endif
> >  
> >      return i;
> > diff --git a/include/lib.h b/include/lib.h
> > index a638bc9..df2de9e 100644
> > --- a/include/lib.h
> > +++ b/include/lib.h
> > @@ -49,6 +49,7 @@
> >  #define _LIB_H_
> >  
> >  #include <stdarg.h>
> > +#include <stdbool.h>
> >  #include <stddef.h>
> >  #include <xen/xen.h>
> >  #include <xen/event_channel.h>
> > @@ -183,6 +184,7 @@ struct evtchn_port_info {
> >  
> >  struct file {
> >      enum fd_type type;
> > +    bool read;	/* maybe available for read */
> >      union {
> >  	struct {
> >              /* lwIP fd */
> > @@ -235,7 +237,6 @@ struct file {
> >          } xenbus;
> >  #endif
> >      };
> > -    int read;	/* maybe available for read */
> >  };
> >  
> >  extern struct file files[];
> > diff --git a/netfront.c b/netfront.c
> > index dfe065b..a566e34 100644
> > --- a/netfront.c
> > +++ b/netfront.c
> > @@ -255,7 +255,7 @@ void netfront_select_handler(evtchn_port_t port, struct pt_regs *regs, void *dat
> >      local_irq_restore(flags);
> >  
> >      if (fd != -1)
> > -        files[fd].read = 1;
> > +        files[fd].read = true;
> >      wake_up(&netfront_queue);
> >  }
> >  #endif
> > @@ -783,7 +783,7 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
> >      network_rx(dev);
> >      if (!dev->rlen && fd != -1)
> >          /* No data for us, make select stop returning */
> > -        files[fd].read = 0;
> > +        files[fd].read = false;
> >      /* Before re-enabling the interrupts, in case a packet just arrived in the
> >       * meanwhile. */
> >      local_irq_restore(flags);
> > diff --git a/tpm_tis.c b/tpm_tis.c
> > index 475ac5d..4a51027 100644
> > --- a/tpm_tis.c
> > +++ b/tpm_tis.c
> > @@ -845,7 +845,7 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
> >     }
> >  #ifdef HAVE_LIBC
> >     if(tpm->fd >= 0) {
> > -      files[tpm->fd].read = 0;
> > +      files[tpm->fd].read = false;
> >        files[tpm->fd].tpm_tis.respgot = 0;
> >        files[tpm->fd].tpm_tis.offset = 0;
> >     }
> > diff --git a/tpmfront.c b/tpmfront.c
> > index 6049244..d825b49 100644
> > --- a/tpmfront.c
> > +++ b/tpmfront.c
> > @@ -66,7 +66,7 @@ void tpmfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data) {
> >     dev->waiting = 0;
> >  #ifdef HAVE_LIBC
> >     if(dev->fd >= 0) {
> > -      files[dev->fd].read = 1;
> > +      files[dev->fd].read = true;
> >     }
> >  #endif
> >     wake_up(&dev->waitq);
> > @@ -438,7 +438,7 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
> >     dev->resplen = 0;
> >  #ifdef HAVE_LIBC
> >     if(dev->fd >= 0) {
> > -      files[dev->fd].read = 0;
> > +      files[dev->fd].read = false;
> >        files[dev->fd].tpmfront.respgot = 0;
> >        files[dev->fd].tpmfront.offset = 0;
> >     }
> > @@ -611,7 +611,7 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
> >  
> >     /* If we have a response waiting, then read it now from the backend
> >      * so we can get its length*/
> > -   if(dev->waiting || (files[dev->fd].read == 1 && !files[dev->fd].tpmfront.respgot)) {
> > +   if(dev->waiting || (files[dev->fd].read && !files[dev->fd].tpmfront.respgot)) {
> >        if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
> >  	 errno = EIO;
> >  	 return -1;
> > -- 
> > 2.26.2
> > 
> 
> -- 
> Samuel
> > No manual is ever necessary.
> May I politely interject here: BULLSHIT.  That's the biggest Apple lie of all!
> (Discussion in comp.os.linux.misc on the intuitiveness of interfaces.)

-- 
Samuel
<c> xlnt comme sujet de stage je peux essayer de donner une description formelle de automake
 -+- #ens-mim -+-

