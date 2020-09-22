Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F0C2743CC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiuX-0001zN-BG; Tue, 22 Sep 2020 14:04:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZys=C7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKiZW-0004k4-Gq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 13:43:06 +0000
X-Inumbo-ID: 4eabe95d-f83d-493d-8c4e-733a3c0561e3
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eabe95d-f83d-493d-8c4e-733a3c0561e3;
 Tue, 22 Sep 2020 13:42:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so17138751wrt.3;
 Tue, 22 Sep 2020 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BS2AtMUMqMOXmo+GPN/2keMADWnOvUYZgslyCE4S4gA=;
 b=RVH2uJz0oO7xRxrAWjAJd05UH6eXgIXBeQorwmXzMWSjNjHc0d++ulK5eFGPL6Wm4O
 yh2tfix1/Pmr21wph3TpBevYtqAbfZWbP3Bc0ln8PeVvQS1hjz58bdDTaKIUTqVTQigd
 2WQIvVKOMbWCy8Wgi5/N70MdPcN+8dZF64uGhZDJnLhgpcxwbU41wAwFMKucxucwbnRv
 NdBH+rB08kAWbMfo0eLAq55qGVlwvkP3UAg08AdACwKr2lOg8dKDkLQSBT6rXW1QXTkQ
 jsSmzrANGHmMHZrOomjcte30lvV3hqnimu8CmsRYdd91wWLOIlsz40K8ubcJ9XEDxpkK
 Cp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BS2AtMUMqMOXmo+GPN/2keMADWnOvUYZgslyCE4S4gA=;
 b=MPO77ZQC9HlvXJxf6YSSe9H2/Pb/DGo2QpcbTobOKUBEMIEzxOMMMFEx7cq9/ghuI2
 ZQikZFC7p0jGlGeKJecvM6rzGIghZYOzQzlc3E+JtXmsBFYmmjDiCB6Aj6CZnnxTjuX2
 XWcq5yTmZFMv4lTIhU4Yfs+BcYvtGiTs31UyoyQs9rmNvS+4n3eIFDHjyhD7uwbcVHyO
 szoJ6EyZZ094gN90eok17Xt3rsS8oFLRor3SulxZYQs+99jNzTNIPSDf6mKbg6h17OwH
 2bG9piNGUcvcOcjGL/sd+UU8tZmaEnWvisjb/tNVtNTTo9yR1UokjI6XtKAZD69dWqVa
 KfhQ==
X-Gm-Message-State: AOAM532Mpkw2lsu18bt6q7m03uxMCORefvlhTR9Ukrxa0klhmnF9Ek3t
 nbWCoggKjdJhi6brUBuu7EU=
X-Google-Smtp-Source: ABdhPJw7oeGdK7WmgCXxZhfbXHbzlbNxlc4fDXcb/mfPiII+FkHw3k+jTkL316G5kpH8lujHjd8pDA==
X-Received: by 2002:a5d:540e:: with SMTP id g14mr5684743wrv.148.1600782144725; 
 Tue, 22 Sep 2020 06:42:24 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id j26sm27976424wrc.79.2020.09.22.06.42.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 06:42:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Edwin Torok'" <edvin.torok@citrix.com>, <sstabellini@kernel.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: <xen-users@lists.xenproject.org>, <jerome.leseinne@gmail.com>,
 <julien@xen.org>
References: <CAAMaOzi5d7S0qAhBkPTFzNfAWXMuK-JbxtQuyk4hdPcVDUwxQg@mail.gmail.com>	
 <c84155eb-429d-7143-9eb1-3b5a50c6bde5@xen.org>	
 <46f1f50dc02c53391958d9d4bb5fc57d23ba6ede.camel@citrix.com>	
 <CAAMaOzj3eYo=bQgth51f+psR2ZBj+c-2boZy57x2qV2aq0fShQ@mail.gmail.com>
 <ba74b8225223ba800c38b34ac950283b7b6cb0fe.camel@citrix.com>
In-Reply-To: <ba74b8225223ba800c38b34ac950283b7b6cb0fe.camel@citrix.com>
Subject: RE: oxenstored performance issue when starting VMs in parallel
Date: Tue, 22 Sep 2020 14:42:22 +0100
Message-ID: <00a101d690e6$33a88bd0$9af9a370$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIMrhWN1wQeREaSEc+MmVb+KxeEJQB0POE8AQkglPkA0UpCvgG7bFMSqOgelyA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Edwin Torok <edvin.torok@citrix.com>
> Sent: 22 September 2020 14:29
> To: sstabellini@kernel.org; Anthony Perard =
<anthony.perard@citrix.com>; xen-
> devel@lists.xenproject.org; paul@xen.org
> Cc: xen-users@lists.xenproject.org; jerome.leseinne@gmail.com; =
julien@xen.org
> Subject: Re: oxenstored performance issue when starting VMs in =
parallel
>=20
> On Tue, 2020-09-22 at 15:17 +0200, jerome leseinne wrote:
> > Hi,
> >
> > Edwin you rock ! This call in qemu is effectively the culprit !
> > I have disabled this xen_bus_add_watch call and re-run test on our
> > big server:
> >
> > - oxenstored is now  between 10% to 20%  CPU usage (previously was
> > 100% all the time)
> > - All our VMs are responsive
> > - All our VM start in less than 10 seconds (before the fix some VMs
> > could take more than one minute to be fully up
> > - Dom0 is more responsive
> >
> > Disabling the watch may not be the ideal solution ( I let the qemu
> > experts answer this and the possible side effects),
>=20
> Hi,
>=20
> CC-ed Qemu maintainer of Xen code, please see this discussion about
> scalability issues with the backend watching code in qemu 4.1+.
>=20
> I think the scalability issue is due to this code in qemu, which =
causes
> an instance of qemu to see watches from all devices (even those
> belonging to other qemu instances), such that adding a single device
> causes N watches to be fired on each N instances of qemu:
>       xenbus->backend_watch =3D
>            xen_bus_add_watch(xenbus, "", /* domain root node */
>                              "backend", xen_bus_backend_changed,
>  &local_err);
>=20
> I can understand that for backwards compatibility you might need this
> code, but is there a way that an up-to-date (xl) toolstack could tell
> qemu what it needs to look at (e.g. via QMP, or other keys in =
xenstore)
> instead of relying on an overly broad watch?

I think this could be made more efficient. The call to =
"module_call_init(MODULE_INIT_XEN_BACKEND)" just prior to this watch =
will register backends that do auto-creation so we could register =
individual watches for the various backend types instead of this single =
one.

  Paul

>=20
> Best regards,
> --Edwin
>=20
>=20
> >  but in our
> > scenario and usage this fixes the problem and dramatically boosts =
the
> > performance.
> >
> > So far we haven't seen any side effect, all the xl orders are ok, =
the
> > VMs are fully functional, no devices leak (like network vif for
> > exemple) and once all the VMs are down a call to xenstore-ls show
> > that
> > the store is indeed empty (dom0 excluded)
> >
> > We will continue additional testing and stress but in all cases a
> > huge thanks to you and Julien  for your help on this issue !
> >
> > Jerome
> >
> > Le lun. 21 sept. 2020 =C3=A0 18:57, Edwin Torok =
<edvin.torok@citrix.com> a
> > =C3=A9crit :
> > > On Mon, 2020-09-21 at 17:40 +0100, Julien Grall wrote:
> > > > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open
> > > > attachments unless you have verified the sender and know the
> > > > content
> > > > is safe.
> > > >
> > > > On 21/09/2020 14:05, jerome leseinne wrote:
> > > > > Hello,
> > > >
> > > > Hello,
> > > >
> > > > I am only CCing Edwin who is working on OXenStored. Hopefully, =
he
> > > > will
> > > > be able to give you some pointers.
> > > >
> > > > > We are developing a solution based on Xen 4.13 who is
> > > > > constantly
> > > > > creating / destroying VMs.
> > > > >
> > > > > To summarize our lifecycle :
> > > > >
> > > > > - xl restore vmX
> > > > > - xl cd-insert ....
> > > > > - We do our stuff for ~ 2 minutes
> > > > > - xl destroy vmX
> > > > >
> > > > > So our VMs have a life of approximately 2 minutes.
> > > > >
> > > > > The number of VMs we ran in parallel depends on the underlying
> > > > > server.
> > > > >
> > > > > We are seeing the issue with our larger server who is running
> > > > > 30
> > > > > VMs
> > > > > (HVM) in parallel.
> > > > >
> > > > > On this server oxenstored is constantly running at 100% cpu
> > > > > usage
> > > > > and
> > > > > some VMs are almost stucked or unresponsive.
> > > > >
> > > > > This is not an hardware issue, 72 xeon cores, 160 GB of memory
> > > > > and
> > > > > very fast I/O subsystem.
> > > > > Everything else is running smoothly on the server.
> > > > >
> > > > > what we witness in the xenstore-access.log is that the number
> > > > > of
> > > > > WATCH
> > > > > event is matching the number of currently running VMs
> > > > >
> > > > > so for example for a single WRITE event is followed by around
> > > > > 30
> > > > > watch events :
> > > > >
> > > > > [20200918T15:15:18.045Z]  A41354       write
> > > > > /local/domain/0/backend/qdisk/1311/5632
> > > > > [20200918T15:15:18.046Z]  A41248       w event
> > > > > backend/qdisk/1311/5632 38ed11d9-9a38-4022-ad75-7c571d4886ed
> > > > > [20200918T15:15:18.046Z]  A41257       w event
> > > > > backend/qdisk/1311/5632 98fa91b8-e88b-4667-9813-d95196257288
> > > > > [20200918T15:15:18.046Z]  A40648       w event
> > > > > backend/qdisk/1311/5632 e6fd9a35-61ec-4750-93eb-999fb7f662fc
> > > > > [20200918T15:15:18.046Z]  A40542       w event
> > >
> > > Hi,
> > >
> > > All the A<id> here point to another unix domain socket. They have
> > > all
> > > registered a watch on this key (or a parent).
> > >
> > > To find out what key they are watching you can look for the watch
> > > registration:
> > > grep 'A41248 .*watch' /var/log/xenstored-access.log
> > >
> > > You can find out all xenstore clients connected to oxenstored, =
find
> > > all
> > > the numbers in the port column here:
> > > ss -a --unix -p|grep xenstored
> > > Then look up those numbers, e.g. assuming you see 22269:
> > > ss -a --unix -p|grep 22269
> > >
> > > This should tell you what the processes are.
> > >
> > > I have a suspicion that it is related to this code in qemu:
> > >
> > >       xenbus->backend_watch =3D
> > >           xen_bus_add_watch(xenbus, "", /* domain root node */
> > >                             "backend", xen_bus_backend_changed,
> > > &local_err);
> > >
> > > If I read the code right this seems to set up a watch on
> > > /local/domain/0/backend, so if you have N qemus running (one for
> > > each
> > > disk) then you get N^2 watch events fired in total.
> > >
> > > Best regards,
> > > --Edwin
> > >
> > > > > backend/qdisk/1311/5632 6a39c858-2fd4-46e4-a810-485a41328f8c
> > > > > [20200918T15:15:18.046Z]  A41141       w event
> > > > > backend/qdisk/1311/5632 8762d552-b4b4-41ef-a2aa-23700f790ea2
> > > > > [20200918T15:15:18.046Z]  A41310       w event
> > > > > backend/qdisk/1311/5632 4dc2a9ae-6388-4b0c-9c98-df3c897a832f
> > > > > [20200918T15:15:18.046Z]  A40660       w event
> > > > > backend/qdisk/1311/5632 6abf244d-5939-4540-b176-4ec7d14b392c
> > > > > [20200918T15:15:18.046Z]  A41347       w event
> > > > > backend/qdisk/1311/5632 ecb93157-9929-43e2-8ed4-f5e78ab2f37d
> > > > > [20200918T15:15:18.046Z]  A41015       w event
> > > > > backend/qdisk/1311/5632 a1fec49f-e7cc-4059-87d3-ce43f386746e
> > > > > [20200918T15:15:18.046Z]  A41167       w event
> > > > > backend/qdisk/1311/5632 e9419014-9fd2-47c0-b79d-30f99d9530d6
> > > > > [20200918T15:15:18.046Z]  A41100       w event
> > > > > backend/qdisk/1311/5632 a2754a91-ecd6-4b6b-87ea-b68db8b888df
> > > > > [20200918T15:15:18.046Z]  A41147       w event
> > > > > backend/qdisk/1311/5632 176a1c3c-add7-4710-a7ee-3b5548d7a56a
> > > > > [20200918T15:15:18.046Z]  A41305       w event
> > > > > backend/qdisk/1311/5632 afe7933b-c92d-4403-8d6c-2e530558c937
> > > > > [20200918T15:15:18.046Z]  A40616       w event
> > > > > backend/qdisk/1311/5632 35fa45e0-21e8-4666-825b-0c3d629f378d
> > > > > [20200918T15:15:18.046Z]  A40951       w event
> > > > > backend/qdisk/1311/5632 230eb42f-d700-46ce-af61-89242847a978
> > > > > [20200918T15:15:18.046Z]  A40567       w event
> > > > > backend/qdisk/1311/5632 39cc7ffb-5045-4120-beb7-778073927c93
> > > > > [20200918T15:15:18.046Z]  A41363       w event
> > > > > backend/qdisk/1311/5632 9e42e74a-80fb-46e8-81f2-718628bf70f6
> > > > > [20200918T15:15:18.046Z]  A40740       w event
> > > > > backend/qdisk/1311/5632 1a64af31-fee6-45be-b8d8-c98baa5e162f
> > > > > [20200918T15:15:18.046Z]  A40632       w event
> > > > > backend/qdisk/1311/5632 466ef522-cb76-4117-8e93-42471897c353
> > > > > [20200918T15:15:18.046Z]  A41319       w event
> > > > > backend/qdisk/1311/5632 19ea986b-e303-4180-b833-c691b2b32819
> > > > > [20200918T15:15:18.046Z]  A40677       w event
> > > > > backend/qdisk/1311/5632 fb01629a-033b-41d6-8349-cec82e570238
> > > > > [20200918T15:15:18.046Z]  A41152       w event
> > > > > backend/qdisk/1311/5632 84ce9e29-a5cc-42a1-a47b-497b95767885
> > > > > [20200918T15:15:18.047Z]  A41233       w event
> > > > > backend/qdisk/1311/5632 ea944ad3-3af6-4688-8076-db1eac25d8e9
> > > > > [20200918T15:15:18.047Z]  A41069       w event
> > > > > backend/qdisk/1311/5632 ce57e169-e1ea-4fb5-b97f-23e651f49d79
> > > > > [20200918T15:15:18.047Z]  A41287       w event
> > > > > backend/qdisk/1311/5632 d31110c8-ae0b-4b9d-b71f-aa2985addd1a
> > > > > [20200918T15:15:18.047Z]  A40683       w event
> > > > > backend/qdisk/1311/5632 f0e4b0a0-fad0-4bb7-b01e-b8a31107ba3d
> > > > > [20200918T15:15:18.047Z]  A41177       w event
> > > > > backend/qdisk/1311/5632 9ff80e49-4cca-4ec9-901a-d30198104f29
> > > > > [20200918T15:15:18.047Z]  D0           w event
> > > > > backend/qdisk/1311/5632 FFFFFFFF8276B520
> > > > > [20200918T15:15:18.047Z]  A40513       w event
> > > > > backend/qdisk/1311/5632 d35a9a42-c15e-492c-a70d-d8b20bafec8f
> > > > > [20200918T15:15:18.047Z]  A41354       w event
> > > > > backend/qdisk/1311/5632 e4456ca4-70f4-4afc-9ba1-4a1cfd74c8e6
> > > > >
> > > > > We are not sure this is the root cause of the issue but this =
is
> > > > > the
> > > > > only real difference we can see in the log.
> > > > >
> > > > > We don't understand why the number of WATCH events is related
> > > > > to
> > > > > the
> > > > > number of concurrent running VM.
> > > > > A watch event should be registered and only fired for the
> > > > > current
> > > > > domain ID, so a write for a specific node path should only
> > > > > trigger
> > > > > one
> > > > > watch event and not 30 in our case.
> > > > >
> > > > > Any ideas / comments ?
> > > >
> > > > Cheers,
> > > >


