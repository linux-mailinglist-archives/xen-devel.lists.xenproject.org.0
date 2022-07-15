Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B100D576467
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 17:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368304.599522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNBj-00035D-HP; Fri, 15 Jul 2022 15:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368304.599522; Fri, 15 Jul 2022 15:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNBj-00033E-DL; Fri, 15 Jul 2022 15:25:07 +0000
Received: by outflank-mailman (input) for mailman id 368304;
 Fri, 15 Jul 2022 15:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s8X+=XU=citrix.com=prvs=1889885c9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oCNBi-000338-6U
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 15:25:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b6f546c-0452-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 17:25:03 +0200 (CEST)
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
X-Inumbo-ID: 4b6f546c-0452-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657898703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MuyVNov3n87qXgrxIOmnRgMHXtp5gciIjQXjAl81t+I=;
  b=X6DMvq+jalk5bCndZpGSitH+ljyBSRci7tLSh3/50yXtoRgTc3yN0R7Y
   S6VOIZ7JL5DSGkGPGoR6hFj4r3VaBLVKe4S6asloWqX4qneM0vbpqCap7
   5uWbPVJp677aWi82nZxsexmJuUH0eHmOQR2jjFwPucHN6/G6MBiFijFM3
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 78464100
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IFBlw6j/04VhRHqUhF7ZhHS6X161xRAKZh0ujC45NGQN5FlHY01je
 htvCGqCOarfYWL1L4gkPoW29B5S78SByN4wHlRlrytmQysb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kur5WtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eYZIX9bYuIU537
 NcmDTRcYCuNv7u1+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyYIaLJoXSHa25mG6am
 Hzcz23+LihBH9+Q4yGe30+3i8LQyHaTtIU6S+Tjq68CbEeo7m4ODBwbU3OrrP//jVSxM/pEM
 FAd8Ccqqak09WSoQ8P7Uhn+p2SL1jYiXN5XH/w/+Ru64KPe6AaEBUAJVjdELtchsaceQjgn1
 USVjsjpLTNqubyRD3ma89+8pz6oJTIcK2NEYCYeVBYE+PHquoR1hRXKJv5hH7SylcbdAizrz
 naBqy1Wr5IXgM0Q3qO352f7kimsrZjESA0yzgjPV2fj5QR8DKa1aort5VXF4PJoKIeCUkLHr
 HUCg9KZ7u0FEdeKjiPlaP8KB7uz4PGGNhXThFduG98q8DHF02GnVZBd5nd5PkgBDyofUWa3O
 gmJ41oXvcINeivxBUNqX26vI5g1wqewTPTKb+n/UP9KM5ZKejfe/xg7MCZ8wFvRfFgQfbAXY
 MnGLpbwXClDUsyL3xLtGb5DjOZDKjQWgDqKGMull0nPPa+2Pib9dFsTDLeZggnVBougqR6dz
 dtQPtDiJ/53ALynOXm/HWL+wDk3wZkH6XPe8ZU/mhareFYOJY3YI6a5LUkdU4Jkhb9JsezD4
 2uwXERVoHKm2yCYeV/ROiszMuy0NXqakZ7cFXV2VWtEJlB5Odr/hEvhX8FfkUYbGBxLkqcvE
 qhtlzSoCfVTUDXXkwkggW3GhNU6LnyD3FvWVwL8OWhXV8MxHGThp467FjYDAQFTV0JbQ+Nl+
 Ob+vu4aKLJeLzlf4DH+M6P+lAPs5yFDyYqfnSLge7FuRakly6AyQwSZsxP9C5tkxcnrrtdC6
 zurPA==
IronPort-HdrOrdr: A9a23:Dus5WKAXXwFxOBDlHemq55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG+85rsiMc6QxhPU3I9ursBEDtex/hHNtOkO8s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkGNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.92,274,1650945600"; 
   d="scan'208";a="78464100"
Date: Fri, 15 Jul 2022 16:24:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Nick
 Rosbrook" <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Message-ID: <YtGGwUqzgtJYt1Qi@perard.uk.xensource.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
 <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
 <CDED6C13-E0BA-4F4F-A739-82611CF5D886@citrix.com>
 <5fa04098-a3a0-a517-ca8c-19d45ecac63e@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fa04098-a3a0-a517-ca8c-19d45ecac63e@epam.com>

On Wed, Jul 13, 2022 at 08:03:17AM +0000, Oleksandr Tyshchenko wrote:
> 
> On 13.07.22 03:01, George Dunlap wrote:
> 
> Hello George, Anthony
> 
> >
> >
> >> On 30 Jun 2022, at 22:18, Oleksandr <olekstysh@gmail.com> wrote:
> >>
> >>
> >> Dear all.
> >>
> >>
> >> On 25.06.22 17:32, Oleksandr wrote:
> >>>
> >>> On 24.06.22 15:59, George Dunlap wrote:
> >>>
> >>> Hello George
> >>>
> >>>>
> >>>>> On 17 Jun 2022, at 17:14, Oleksandr Tyshchenko 
> >>>>> <olekstysh@gmail.com> wrote:
> >>>>>
> >>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>>>
> >>>>> This patch adds basic support for configuring and assisting 
> >>>>> virtio-mmio
> >>>>> based virtio-disk backend (emulator) which is intended to run out of
> >>>>> Qemu and could be run in any domain.
> >>>>> Although the Virtio block device is quite different from traditional
> >>>>> Xen PV block device (vbd) from the toolstack's point of view:
> >>>>> - as the frontend is virtio-blk which is not a Xenbus driver, nothing
> >>>>> written to Xenstore are fetched by the frontend currently ("vdev"
> >>>>> is not passed to the frontend). But this might need to be revised
> >>>>> in future, so frontend data might be written to Xenstore in order to
> >>>>> support hotplugging virtio devices or passing the backend domain id
> >>>>> on arch where the device-tree is not available.
> >>>>> - the ring-ref/event-channel are not used for the backend<->frontend
> >>>>> communication, the proposed IPC for Virtio is IOREQ/DM
> >>>>> it is still a "block device" and ought to be integrated in existing
> >>>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> >>>>> logic to deal with Virtio devices as well.
> >>>>>
> >>>>> For the immediate purpose and an ability to extend that support for
> >>>>> other use-cases in future (Qemu, virtio-pci, etc) perform the 
> >>>>> following
> >>>>> actions:
> >>>>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
> >>>>> that in the configuration
> >>>>> - Introduce new disk "specification" and "transport" fields to struct
> >>>>> libxl_device_disk. Both are written to the Xenstore. The transport
> >>>>> field is only used for the specification "virtio" and it assumes
> >>>>> only "mmio" value for now.
> >>>>> - Introduce new "specification" option with "xen" communication
> >>>>> protocol being default value.
> >>>>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
> >>>>> one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
> >>>>>
> >>>>> An example of domain configuration for Virtio disk:
> >>>>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, 
> >>>>> specification=virtio']
> >>>>>
> >>>>> Nothing has changed for default Xen disk configuration.
> >>>>>
> >>>>> Please note, this patch is not enough for virtio-disk to work
> >>>>> on Xen (Arm), as for every Virtio device (including disk) we need
> >>>>> to allocate Virtio MMIO params (IRQ and memory region) and pass
> >>>>> them to the backend, also update Guest device-tree. The subsequent
> >>>>> patch will add these missing bits. For the current patch,
> >>>>> the default "irq" and "base" are just written to the Xenstore.
> >>>>> This is not an ideal splitting, but this way we avoid breaking
> >>>>> the bisectability.
> >>>>>
> >>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>> OK, I am *really* sorry for coming in here at the last minute and 
> >>>> quibbling about things.
> >>>
> >>>
> >>> no problem
> >>>
> >>>
> >>>> But this introduces a public interface which looks really wrong to 
> >>>> me.  I’ve replied to the mail from December where Juergen proposed 
> >>>> the “Other” protocol.
> >>>>
> >>>> Hopefully this will be a simple matter of finding a better name 
> >>>> than “other”. (Or you guys convincing me that “other” is really the 
> >>>> best name for this value; or even Anthony asserting his right as a 
> >>>> maintainer to overrule my objection if he thinks I’m out of line.)
> >>>
> >>>
> >>> I saw your reply to V6 and Juergen's answer. I share Juergen's 
> >>> opinion as well as I understand your concern. I think, this is 
> >>> exactly the situation when finding a perfect name (obvious, short, 
> >>> etc) for the backendtype (in our particular case) is really difficult.
> >>>
> >>> Personally I tend to leave "other", because there is no better 
> >>> alternative from my PoV. Also I might be completely wrong here, but 
> >>> I don't think we will have to extend the "backendtype" for 
> >>> supporting other possible virtio backend implementations in the 
> >>> foreseeable future:
> >>>
> >>> - when Qemu gains the required support we will choose qdisk: 
> >>> backendtype qdisk specification virtio
> >>> - for the possible virtio alternative of the blkback we will choose 
> >>> phy: backendtype phy specification virtio
> >>>
> >>> If there will be a need to keep various implementation, we will be 
> >>> able to describe that by using "transport" (mmio, pci, xenbus, argo, 
> >>> whatever).
> >>> Actually this is why we also introduced "specification" and "transport".
> >>>
> >>> IIRC, there were other (suggested?) names except "other" which are 
> >>> "external" and "daemon". If you think that one of them is better 
> >>> than "other", I will happy to use it.
> >>
> >>
> >> Could we please make a decision on this?
> >>
> >> If "other" is not unambiguous, then maybe we could choose "daemon" to 
> >> describe arbitrary user-level backends, any thought?
> >
> > Unfortunately I didn’t have time to dig into this; I’m just going to 
> > have to withdraw my objection, and let you & Juergen decide what to 
> > call it.
> 
> George, thanks for letting me know. Juergen proposed to use "standalone" 
> for the new backendtype name which is far more specific. I agree with that.
> 
> 
> Anthony, would you be happy with that renaming?

I tried to figure out what backendtype is supposed to mean, how it's
used. I feel it's quite messy at the moment.

Man page xl-disk-configuration says it's a backend implementation to
use. Beside 'phy', which I guess is the kernel or blkback, the two other
point to QEMU ('qdisk') and tapdisk ('tap').

The, backendtype is used throughout libxl to deal with the different
backend implementation, and the value is stored in the xenstore key
"type". From "blkif.h", "type" should be 'file' or 'phy' or 'tap', but
we store 'qdisk' for 'qdisk'... so the "type" note in xenstore is
probably useless for qdisk, but maybe useful for 'phy'? (This "type"
node is only for the backend, so probably useless for a front end.)

Anyway, it seems to me that backendtype should be the name of the
implementation of the backend we want to use. It is just a parameter
to tell libxl how to communicate with the backend. At the moment libxl
uses xenstore to communicates with all backends even if that's not
required, because libxl works this way and it's hard to change. (We
could communicate with QEMU via QMP rather than xenstore for example.)

So I guess either you have a name for your implementation, or something
generic will do. So "standalone" is fine.

(We probably want to document somewhere that this new type would
simply mean "only-relying-on-xenstore-data" like Juergen is putting
it, and isn't blkback or QEMU.)

Thanks,

-- 
Anthony PERARD

