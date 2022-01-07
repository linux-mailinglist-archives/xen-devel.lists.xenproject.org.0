Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C4E4879A7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 16:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254478.436339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5r3I-000758-QS; Fri, 07 Jan 2022 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254478.436339; Fri, 07 Jan 2022 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5r3I-000737-MX; Fri, 07 Jan 2022 15:21:12 +0000
Received: by outflank-mailman (input) for mailman id 254478;
 Fri, 07 Jan 2022 15:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AuXA=RX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n5r3H-000731-Fw
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 15:21:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d10c61e-6fcd-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 16:21:05 +0100 (CET)
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
X-Inumbo-ID: 6d10c61e-6fcd-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641568865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o36T0wcnM+HiJPViT2i5aKqbFL2oovc7zM+AbasLxi8=;
  b=LkRjKh9xzhMkxtCFQOXpIP35KIo/o0TMMuu06IIySpGmr4ji4eHe7OfK
   75fAlTWLRQRy1Y+EDPI5v22LkNIs+5h3ksM6HUkW1d8NsksHc97FGqH83
   VfZaRTcBfNGJ+DnRNmYGzHBPlBS6XqYDiwZdbJMEhVJbeTLHzQxOinb5T
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: isXv0f1SLxNnKvekwcZag8JoK6zACcvcuafRtgpmuR4af5TfXCByHR1SNJjySI6xpYKIJGDm0H
 0rwvfd3ZQFtdrg4ZALg2PEDEURegTnEbbPtA/9M1Kcevp/YTYIBc+PVCGE2j5qosmfYWI20OiE
 tv4c00in8kG6Kmi/y9xANBJEbbyFxgOLQSg3wlcIq7rYE9vy7pZebmM+eVlHX9ADJ2/4Q3h3ps
 0ph8d1sWOA9SFwa/bhorD4ypSVeY4DeR+HBP145Lklh6T9tod0kcFHVFlTykzKayQH6jx1uGLb
 JOJLbhtZxa3iGxzCuU0PfQTy
X-SBRS: 5.1
X-MesageID: 61527020
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BqWfh6rhOZyzlTNXJ2GMi/nXn1NeBmKMYhIvgKrLsJaIsI4StFCzt
 garIBmFPv+CamLzKNB+Ptu280wBvcLQytVkHAA6qi88H35Do5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IDmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncOVUicuArTXorgMcitgUBt/Bq5Y5KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZNEM2U3NkyojxtnNlMWAowlheSRg3T9VixIsViEl7AU2j2GpOB2+Oe0a4eEEjCQfu1XkVyfv
 Xnu5HniD1cRM9n34SKM73aEluLJ2yThV+o6D6G1+Pdsh3WI2mUZBRkSVF265/+0liaWRNZ3O
 0ESvC00osAa9kamU938VB2Qu2Ofs1gXXN84O+8z7g2X27fXywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPWqPCrQx
 AyTtxJilpQhtY0x1p6440zY1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlQenB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17YCrCgUxfOdvZ5yEWIU7IToiNuhf8NIYmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTqHrtMjeFwl3Flmgs/oKwXKTz8jdJyg1bPFN843KamNLhlvMtoXi2Im
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8KRqmhq4ClM+QgkJUqaJqZt4ItANt/kFx4/go
 yDmMmcFmQWXuJEyAVjTApyVQOi0BsgXQLNSFXFEAGtELFB/O9vyt/lGKMNsFVTlncQ6pcNJo
 zA+U53oKpxypv7voVzxtLHx895vcgqFnwWLM3b3aTQzZcc4FQfI5sXlbk3k8yxXVni7ss43o
 ruB0ALHQMVcG1Q+XZiOMP//nUmsuXU9mf5pWxeaKNdkZ0ixopNhLDb8j6FrLphUewnD3DaTy
 y2fHQwc+bvWu4Yw/dSQ3fKEoo6lHvFQBE1fG2WHv7+6OTODpjiowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mlPts6cHuqrlWyhVfME/KN1n7WKl9JnSm3NVUsvEfzLFupgbrC
 FmE/cNXOOvVNZq9QkIRPgcscs+KyeoQxmvJ9f0wLUj3uH138b6AXRkANhWAknUAfr58MYdjy
 uY9os8GrQe4j0NyYNqBiylV8UWKL2ABDPp75s1LXtezh1p50ExGbLzdFjTyscOGZNh7O0U3J
 iOZ2fjZjLNGy0ueK3c+GBAhBwaGaUjibPyS8GI/Gg==
IronPort-HdrOrdr: A9a23:HGAqLqxrjQoVw0FVIN3bKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,270,1635220800"; 
   d="scan'208";a="61527020"
Date: Fri, 7 Jan 2022 15:20:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<stefano@stabellini.net>
Subject: Re: [PATCH] libxl/PCI: defer backend wait upon attaching to PV guest
Message-ID: <YdhaWaxFaC9rZTF5@perard>
References: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
 <CAKf6xpt6+ZkXK5uXyp15UyA1J2AhtZWipW04M1xD1Yx4nx3jOw@mail.gmail.com>
 <18a2487b-f754-d971-2e89-93e54b7b951b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <18a2487b-f754-d971-2e89-93e54b7b951b@suse.com>

On Tue, Dec 14, 2021 at 02:52:43PM +0100, Jan Beulich wrote:
> On 14.12.2021 14:34, Jason Andryuk wrote:
> > On Tue, Dec 14, 2021 at 2:50 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> Attempting to wait when the backend hasn't been created yet can't work:
> >> the function will complain "Backend ... does not exist". Move the
> >> waiting past the creation of the backend (and that of other related
> >> nodes), hoping that there are no other dependencies that would now be
> >> broken.
> >>
> >> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Just to make it explicit: I have no idea why the waiting is needed in
> >> the first place. It's been there from the very introduction of PCI
> >> passthrough support (commit b0a1af61678b). I therefore can't exclude
> >> that an even better fix would be to simply omit the 2nd hunk here.
> > 
> > The first time a device is attached, the backend does not exist, and
> > the wait is not needed.  However, when a second device is attached,
> > the backend does exist.  Since pciback goes through Reconfiguring and
> > Reconfigured, I believe the wait exists to let the frontend/backend
> > settle back to Connected before modifying the xenstore entries to add
> > the additional device.  I could be wrong, but that is my best answer
> > for why someone went to the trouble of adding a wait in the first
> > place.
> 
> If things are as you describe them, then the change here is wrong: The
> waiting gets moved from before the creation of the new device's nodes
> to immediately after. Yet then I also can't see how else I should
> address the issue at hand, so I'd have to defer to someone else; this
> may involve undoing / redoing some of what the commit referenced by
> the Fixes: tag did.
> 
> However, since all new nodes get added in a single transaction, I
> can't see why waiting for the completion of a prior reconfigure would
> be necessary: That'll either notice (and process) the new nodes, or
> it won't. If it does, the next reconfigure would simply be a no-op.

Well, the current code is checking that the backend is in a known state:
"Connected". Without this, the backend could be in any state like
"Closing" or other error, not just reconfiguring. We probably want to
keep checking that the backend can expect more devices.

Looking at Linux PCI PV backend implementation, I think linux reads
"num_devs", takes time to do configuration of new devs, then set "state"
to "reconfigured". So if libxl set's "num_devs" and "states" while
Linux takes time to config new devs, Linux will never check "num_devs"
again and ignore new added devices. So I guess it doesn't matter if we
wait before or after to read "state"=="connected".

There is no real documentation on this PV PCI passthrough, so it is hard
to tell what libxl can do. The pci backend xenstore path isn't even in
"xenstore-paths.pandoc".

But overall, maybe Jason's proposed change would be better, that is to
wait on the backend before adding a new device but only when there's
already a device which mean the backend would exist. (It would be better
to me as it doesn't change when the waiting is done.)

Thanks,

-- 
Anthony PERARD

