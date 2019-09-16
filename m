Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B57B4283
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 22:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9xx2-0005u5-7N; Mon, 16 Sep 2019 20:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gi+b=XL=apple.com=afish@srs-us1.protection.inumbo.net>)
 id 1i9xx1-0005ty-7z
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 20:50:23 +0000
X-Inumbo-ID: 98c8a760-d8c3-11e9-95fd-12813bfff9fa
Received: from nwk-aaemail-lapp03.apple.com (unknown [17.151.62.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98c8a760-d8c3-11e9-95fd-12813bfff9fa;
 Mon, 16 Sep 2019 20:50:21 +0000 (UTC)
Received: from pps.filterd (nwk-aaemail-lapp03.apple.com [127.0.0.1])
 by nwk-aaemail-lapp03.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 x8GKlHiU060937; Mon, 16 Sep 2019 13:50:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from :
 message-id : content-type : mime-version : subject : date : in-reply-to :
 cc : to : references; s=20180706;
 bh=72wVYMIybrHwiM17lWUy6sjI8QWq6a3xG3JD38mrUWU=;
 b=IAEK2hu9iUQnPoZg8Pw+ecWZ/l2v9nujTusmjQfUO5YZln/qwySjILOB8VxhMo0NJsD5
 US2g9Rrz/b8mXOVwgIfR3s1Ud2Lqww7IcwyjsS0rNN7llG3NnR0l7peJw37CqClKIfJJ
 9u5tyYR3Sf/VGANueCmRyfqWmyijsHglb/e2l8VoP7DkBmJQENLRbCIfDGH1kyyfZpG7
 HHVZ1h3sN6gO3E53Mingesu/8sHa9dpAKqeZL8jdTU6joEsnC+l6wF9M9OHfDFal+p9z
 TCujcgnvnaxafCXdK9wijFcafO9/Y2ye3IAYL7TFRRk8WMYwEYl59vaDilobVrNtsliP Ow== 
Received: from mr2-mtap-s03.rno.apple.com (mr2-mtap-s03.rno.apple.com
 [17.179.226.135])
 by nwk-aaemail-lapp03.apple.com with ESMTP id 2v1gejgypm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 16 Sep 2019 13:50:13 -0700
Received: from nwk-mmpp-sz12.apple.com
 (nwk-mmpp-sz12.apple.com [17.128.115.204]) by mr2-mtap-s03.rno.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0PXX00CL7Z7OS1A0@mr2-mtap-s03.rno.apple.com>; Mon,
 16 Sep 2019 13:50:12 -0700 (PDT)
Received: from process_milters-daemon.nwk-mmpp-sz12.apple.com by
 nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0PXX00G00YUVP500@nwk-mmpp-sz12.apple.com>; Mon,
 16 Sep 2019 13:50:12 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 07a9f7dd315dc6000695a0402a47d12d
X-Va-E-CD: a5a5e046124b1576edd6ac48f9946ad5
X-Va-R-CD: 5689ef722b0dd46b2e850591228443f8
X-Va-CD: 0
X-Va-ID: 1f6ba6ce-189e-497b-8016-14208eed63ec
X-V-A: 
X-V-T-CD: 07a9f7dd315dc6000695a0402a47d12d
X-V-E-CD: a5a5e046124b1576edd6ac48f9946ad5
X-V-R-CD: 5689ef722b0dd46b2e850591228443f8
X-V-CD: 0
X-V-ID: 6ae4ebae-ee41-4366-84e4-bf2089b875a8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-09-16_08:,, signatures=0
Received: from [17.235.22.77] (unknown [17.235.22.77])
 by nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0PXX00LKNZ7MLOC0@nwk-mmpp-sz12.apple.com>; Mon,
 16 Sep 2019 13:50:11 -0700 (PDT)
From: Andrew Fish <afish@apple.com>
Message-id: <E64F90B0-5376-4040-9AB1-B5BF1C7C4CBF@apple.com>
MIME-version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Mon, 16 Sep 2019 13:50:04 -0700
In-reply-to: <5e73e526-0f76-5f91-aa7c-a4adaeee4608@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-10-anthony.perard@citrix.com>
 <26405443-8a65-5d03-dd35-1000ac3fbf0a@redhat.com>
 <FDC048FC-B33F-49A4-9FC3-DEF91AAC6334@apple.com>
 <5e73e526-0f76-5f91-aa7c-a4adaeee4608@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_08:, , signatures=0
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 09/11] OvmfPkg/XenBusDxe: Fix
 NotifyExitBoot to avoid Memory Allocation Services
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============5475844277541672194=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5475844277541672194==
Content-type: multipart/alternative;
 boundary="Apple-Mail=_7D7E9BD1-1AFE-4709-86D5-D49A2550EB02"


--Apple-Mail=_7D7E9BD1-1AFE-4709-86D5-D49A2550EB02
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Sep 16, 2019, at 12:31 PM, Laszlo Ersek <lersek@redhat.com> wrote:
>=20
> On 09/16/19 20:36, Andrew Fish wrote:
>>=20
>>=20
>>> On Sep 16, 2019, at 10:36 AM, Laszlo Ersek <lersek@redhat.com> =
wrote:
>>>=20
>>> On 09/13/19 16:50, Anthony PERARD wrote:
>>>> This patch fix the EVT_SIGNAL_EXIT_BOOT_SERVICES handler to avoid
>>>> using the Memory Allocation Services.
>>>>=20
>>>> This comes with a new interface named RegisterExitCallback so that =
PV
>>>> drivers can disconnect from the backend before XenBusDxe is teared
>>>> down.
>>>>=20
>>>> Instead of using Disconnect() to tear down the XenBus driver and =
the
>>>> children drivers, we are going to ask every driver using
>>>> XENBUS_PROTOCOL to disconnect from the hardware via the callback =
set
>>>> with RegisterExitCallback, then reset the xenstore shared ring and
>>>> the grant table.
>>>=20
>>> I think this approach -- a lower-level bus driver calling out to
>>> dependent device drivers -- is quite unusual.
>>>=20
>>=20
>> Laszlo,
>>=20
>> I agree given the timer event activity is stopped prior to calling =
any of the EXIT_BOOT_SERVICES events there is usually not a requirement =
to call the drivers Stop() function. Generally Exit Boot Services events =
just turn off DMA, or any other hardware that could touch memory that is =
being freed back for OS usage. Since the timer activity, and thus all =
event activity is stopped there is not a lot of ways for the drivers to =
ever have any EFI code run again.=20
>>=20
>> The only other exception I can think of is if the OS driver makes =
some kind of assumption about the state of the hardware.
>=20
> The
>=20
>    hardware that could touch memory that is being freed back for OS
>    usage
>=20
> is the part that applies here. Most paravirtual devices work by =
sharing
> at least some memory between the host-side device model (emulation) =
and
> guest-side device driver. When the guest is transitioning from =
firmware
> to OS (and those of course have different guest drivers for the
> paravirtual device), the host must be made forget the memory shared =
with
> the guest firmware driver (as the guest OS boot loader or the guest OS
> itself might load anything at all into that RAM area after
> ExitBootServices()).
>=20
> So what I found unusual in this patch wasn't the necessity of EBS
> notification functions, but how they would be ordered / coordinated
> between each other. There is a bus-like device that shares its own
> resources (RAM) with the host, and installs protocol interfaces. And
> there are dependent endpoint-like devices that consume those protocol
> interfaces, and share their own stuff (RAM) with the host OS.
>=20
> All of that shared memory needs to be cleared from the host's
> book-keeping when we leave firmware land; the tricky part is that the
> bus-like device can't request the host for its bus-level shared memory
> to be forgotten before all of the dependent endpoints ask for their
> shared ranges to be forgotten.
>=20

Laszlo,

In "real hardware" the bus driver can usually clear the memory usage by =
by turning off the DMA. I guess this would look like sending a reset to =
the virtual device. The buffers allocated by children of the "hardware" =
bus driver free all their buffers back to the OS as a side effect of the =
ExitBootServices, so it is typical for the children of the bus driver to =
not have an ExitBootServices event.=20

I find it strange there is not a reset operation for the virtual bus =
device, but it seems like worst case the bus driver could  could track =
all the shared memory allocations and free the child allocations 1st?=20

In general the ExitBootServices routines for hardware can be very simple =
since EFI is a cooperative event model and the events are shutdown as =
part of the ExitBootService processes. Most of the times I've seen =
complex code in ExitBootServices routines it was due to people thinking =
in terms of threading vs. events, and forgetting that just returning =
from ExitBootServices frees most of the the resources allocated by the =
driver.=20

I'd also point out the order of the ExitBootServices events are not =
architectural, but a given implementation may do the same thing every =
time. For example the ExitBootServices events are probably just an =
insertion to a doubly linked list based on execution order of the =
drivers. But if a lot of the drivers are Driver Model drivers then they =
all have the same Depex so the order could depend on the order of those =
drivers in the FV. Some times the root bridge driver is a DXE driver for =
something like PCI, but a USB Host Bridge driver would be a Driver Model =
driver that Starts on a PCI IO Handle. =20

Thanks,

Andrew Fish

> Thanks!
> Laszlo
>=20
>=20
>>> How about the following instead:
>>>=20
>>> - introduce two XenBusIo protocol member functions, AddReference() =
and
>>> RemoveReference(). RemoveReference() should take a BOOLEAN called
>>> "HandOffToOs". The device drivers should call AddReference() just =
before
>>> exiting DriverBindingStart() with success, and =
RemoveReference(FALSE) in
>>> DriverBindingStop().
>>>=20
>>> - these protocol member functions would increment / decrement a
>>> reference counter in the underlying XenBus abstraction. =
Additionally,
>>> RemoveReference() would store the HandOffToOs parameter to a =
bus-level
>>> BOOLEAN too (regardless of previous value stored there -- a =
TRUE->FALSE
>>> transition would never happen anyway; see below).
>>>=20
>>> - both XenBusDxe and the Xen device drivers should register EBS
>>> callbacks, per controller handle (in BindingStart()), and unregister
>>> them (in BindingStop())
>>>=20
>>> - the ordering between EBS notification functions (queued at the =
same
>>> TPL) is unspecified. In the device driver notification functions, =
the
>>> last action should be a call to XenBusIo->RemoveReference(TRUE) -- =
after
>>> the device-specific "forget me" actions have been done.
>>>=20
>>> - if RemoveReference() gets a TRUE parameter, then it should check =
the
>>> resultant (post-decrement) value of the refcount. If it has gone to
>>> zero, RemoveReference() should re-set the xenbus / xenstore =
connection.
>>> If the parameter is FALSE, it shouldn't do anything particular after
>>> decrementing the refcount.
>>>=20
>>> - in the XenBus EBS handler, if the refcount is positive at the time =
of
>>> the call, nothing should be done. Otherwise, if HandOffToOs is TRUE,
>>> nothing should be done, similarly. Otherwise, the xenbus/xenstore
>>> connection should be re-set.
>>>=20
>>> The idea is that normal Start/Stop should manage the refcount as
>>> expected. At ExitBootServices(), the XenBus level handler should =
only
>>> clear the connection to the hypervisor if no RemoveReference() call =
has
>>> done, or will do, it. (If the counter is positive, then a later
>>> RemoveReference() call will do it; if it's zero but HandOffToOs is =
TRUE,
>>> then it's been done already. If the counter is zero and the BOOLEAN =
is
>>> FALSE, then all devices have been disconnected normally with Stop() =
--
>>> or none have been connected at all --, before ExitBootServices(), so =
the
>>> XenBus driver itself has to ask for being forgotten.)
>>>=20
>>> Admittedly, this is more complicated (due to the unspecified =
ordering
>>> between EBS notifications). I just feel it's more idiomatic to go
>>> through normal protocol member functions in EBS notification =
functions,
>>> rather than special callbacks.
>>>=20
>>> (Side comment: the reference counting could normally be replaced by
>>> gBS->OpenProtocolInformation(); however, that service itself =
allocates
>>> memory, so we can't use it in EBS notification functions.)
>>>=20
>>> Thanks
>>> Laszlo
>>>=20
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Groups.io Links: You receive all messages sent to this group.
>>>=20
>>> View/Reply Online (#47292): =
https://edk2.groups.io/g/devel/message/47292
>>> Mute This Topic: https://groups.io/mt/34128015/1755084
>>> Group Owner: devel+owner@edk2.groups.io
>>> Unsubscribe: https://edk2.groups.io/g/devel/unsub  [afish@apple.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--Apple-Mail=_7D7E9BD1-1AFE-4709-86D5-D49A2550EB02
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Sep 16, 2019, at 12:31 PM, Laszlo Ersek &lt;<a =
href=3D"mailto:lersek@redhat.com" class=3D"">lersek@redhat.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 09/16/19 20:36, Andrew Fish =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On Sep =
16, 2019, at 10:36 AM, Laszlo Ersek &lt;<a =
href=3D"mailto:lersek@redhat.com" class=3D"">lersek@redhat.com</a>&gt; =
wrote:<br class=3D""><br class=3D"">On 09/13/19 16:50, Anthony PERARD =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">This patch fix =
the EVT_SIGNAL_EXIT_BOOT_SERVICES handler to avoid<br class=3D"">using =
the Memory Allocation Services.<br class=3D""><br class=3D"">This comes =
with a new interface named RegisterExitCallback so that PV<br =
class=3D"">drivers can disconnect from the backend before XenBusDxe is =
teared<br class=3D"">down.<br class=3D""><br class=3D"">Instead of using =
Disconnect() to tear down the XenBus driver and the<br class=3D"">children=
 drivers, we are going to ask every driver using<br =
class=3D"">XENBUS_PROTOCOL to disconnect from the hardware via the =
callback set<br class=3D"">with RegisterExitCallback, then reset the =
xenstore shared ring and<br class=3D"">the grant table.<br =
class=3D""></blockquote><br class=3D"">I think this approach -- a =
lower-level bus driver calling out to<br class=3D"">dependent device =
drivers -- is quite unusual.<br class=3D""><br class=3D""></blockquote><br=
 class=3D"">Laszlo,<br class=3D""><br class=3D"">I agree given the timer =
event activity is stopped prior to calling any of the EXIT_BOOT_SERVICES =
events there is usually not a requirement to call the drivers Stop() =
function. Generally Exit Boot Services events just turn off DMA, or any =
other hardware that could touch memory that is being freed back for OS =
usage. Since the timer activity, and thus all event activity is stopped =
there is not a lot of ways for the drivers to ever have any EFI code run =
again.<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">The only other exception I can think of is if =
the OS driver makes some kind of assumption about the state of the =
hardware.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;hardware that could touch memory that is =
being freed back for OS</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;usage</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">is the part that applies here. Most paravirtual devices work =
by sharing</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">at least some =
memory between the host-side device model (emulation) and</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">guest-side device driver. When =
the guest is transitioning from firmware</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">to OS (and those of course have different guest drivers for =
the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">paravirtual =
device), the host must be made forget the memory shared with</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">the guest firmware driver (as =
the guest OS boot loader or the guest OS</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">itself might load anything at all into that RAM area =
after</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">ExitBootServices()).</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">So what I found unusual in this patch wasn't the necessity of =
EBS</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">notification =
functions, but how they would be ordered / coordinated</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">between each other. There is a =
bus-like device that shares its own</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">resources (RAM) with the host, and installs protocol =
interfaces. And</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">there are dependent endpoint-like devices that consume those =
protocol</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">interfaces, =
and share their own stuff (RAM) with the host OS.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">All of that shared memory needs =
to be cleared from the host's</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">book-keeping when we leave firmware land; the tricky part is =
that the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">bus-like =
device can't request the host for its bus-level shared memory</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">to be forgotten before all of =
the dependent endpoints ask for their</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">shared ranges to be forgotten.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Laszlo,</div><div><br class=3D""></div><div>In =
"real hardware" the bus driver can usually clear the memory usage by by =
turning off the DMA. I guess this would look like sending a reset to the =
virtual device. The buffers allocated by children of the "hardware" bus =
driver free all their buffers back to the OS as a side effect of the =
ExitBootServices, so it is typical for the children of the bus driver to =
not have an ExitBootServices event.&nbsp;</div><div><br =
class=3D""></div><div>I find it strange there is not a reset operation =
for the virtual bus device, but it seems like worst case the bus driver =
could &nbsp;could track all the shared memory allocations and free the =
child allocations 1st?&nbsp;</div><div><br class=3D""></div><div>In =
general the ExitBootServices routines for hardware can be very simple =
since EFI is a cooperative event model and the events are shutdown as =
part of the ExitBootService processes. Most of the times I've seen =
complex code in ExitBootServices routines it was due to people thinking =
in terms of threading vs. events, and forgetting that just returning =
from ExitBootServices frees most of the the resources allocated by the =
driver.&nbsp;</div><div><br class=3D""></div><div>I'd also point out the =
order of the ExitBootServices events are not architectural, but a given =
implementation may do the same thing every time. For example the =
ExitBootServices events are probably just an insertion to a doubly =
linked list based on execution order of the drivers. But if a lot of the =
drivers are Driver Model drivers then they all have the same Depex so =
the order could depend on the order of those drivers in the FV. Some =
times the root bridge driver is a DXE driver for something like PCI, but =
a USB Host Bridge driver would be a Driver Model driver that Starts on a =
PCI IO Handle. &nbsp;</div><div><br =
class=3D""></div><div>Thanks,</div><div><br class=3D""></div><div>Andrew =
Fish</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Thanks!</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Laszlo</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
class=3D"">How about the following instead:<br class=3D""><br class=3D"">-=
 introduce two XenBusIo protocol member functions, AddReference() and<br =
class=3D"">RemoveReference(). RemoveReference() should take a BOOLEAN =
called<br class=3D"">"HandOffToOs". The device drivers should call =
AddReference() just before<br class=3D"">exiting DriverBindingStart() =
with success, and RemoveReference(FALSE) in<br =
class=3D"">DriverBindingStop().<br class=3D""><br class=3D"">- these =
protocol member functions would increment / decrement a<br =
class=3D"">reference counter in the underlying XenBus abstraction. =
Additionally,<br class=3D"">RemoveReference() would store the =
HandOffToOs parameter to a bus-level<br class=3D"">BOOLEAN too =
(regardless of previous value stored there -- a TRUE-&gt;FALSE<br =
class=3D"">transition would never happen anyway; see below).<br =
class=3D""><br class=3D"">- both XenBusDxe and the Xen device drivers =
should register EBS<br class=3D"">callbacks, per controller handle (in =
BindingStart()), and unregister<br class=3D"">them (in BindingStop())<br =
class=3D""><br class=3D"">- the ordering between EBS notification =
functions (queued at the same<br class=3D"">TPL) is unspecified. In the =
device driver notification functions, the<br class=3D"">last action =
should be a call to XenBusIo-&gt;RemoveReference(TRUE) -- after<br =
class=3D"">the device-specific "forget me" actions have been done.<br =
class=3D""><br class=3D"">- if RemoveReference() gets a TRUE parameter, =
then it should check the<br class=3D"">resultant (post-decrement) value =
of the refcount. If it has gone to<br class=3D"">zero, RemoveReference() =
should re-set the xenbus / xenstore connection.<br class=3D"">If the =
parameter is FALSE, it shouldn't do anything particular after<br =
class=3D"">decrementing the refcount.<br class=3D""><br class=3D"">- in =
the XenBus EBS handler, if the refcount is positive at the time of<br =
class=3D"">the call, nothing should be done. Otherwise, if HandOffToOs =
is TRUE,<br class=3D"">nothing should be done, similarly. Otherwise, the =
xenbus/xenstore<br class=3D"">connection should be re-set.<br =
class=3D""><br class=3D"">The idea is that normal Start/Stop should =
manage the refcount as<br class=3D"">expected. At ExitBootServices(), =
the XenBus level handler should only<br class=3D"">clear the connection =
to the hypervisor if no RemoveReference() call has<br class=3D"">done, =
or will do, it. (If the counter is positive, then a later<br =
class=3D"">RemoveReference() call will do it; if it's zero but =
HandOffToOs is TRUE,<br class=3D"">then it's been done already. If the =
counter is zero and the BOOLEAN is<br class=3D"">FALSE, then all devices =
have been disconnected normally with Stop() --<br class=3D"">or none =
have been connected at all --, before ExitBootServices(), so the<br =
class=3D"">XenBus driver itself has to ask for being forgotten.)<br =
class=3D""><br class=3D"">Admittedly, this is more complicated (due to =
the unspecified ordering<br class=3D"">between EBS notifications). I =
just feel it's more idiomatic to go<br class=3D"">through normal =
protocol member functions in EBS notification functions,<br =
class=3D"">rather than special callbacks.<br class=3D""><br =
class=3D"">(Side comment: the reference counting could normally be =
replaced by<br class=3D"">gBS-&gt;OpenProtocolInformation(); however, =
that service itself allocates<br class=3D"">memory, so we can't use it =
in EBS notification functions.)<br class=3D""><br class=3D"">Thanks<br =
class=3D"">Laszlo<br class=3D""><br class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-<br class=3D""><a href=3D"http://Groups.io" =
class=3D"">Groups.io</a> Links: You receive all messages sent to this =
group.<br class=3D""><br class=3D"">View/Reply Online (#47292): <a =
href=3D"https://edk2.groups.io/g/devel/message/47292" =
class=3D"">https://edk2.groups.io/g/devel/message/47292</a><br =
class=3D"">Mute This Topic: <a =
href=3D"https://groups.io/mt/34128015/1755084" =
class=3D"">https://groups.io/mt/34128015/1755084</a><br class=3D"">Group =
Owner: <a href=3D"mailto:devel+owner@edk2.groups.io" =
class=3D"">devel+owner@edk2.groups.io</a><br class=3D"">Unsubscribe: <a =
href=3D"https://edk2.groups.io/g/devel/unsub" =
class=3D"">https://edk2.groups.io/g/devel/unsub</a> &nbsp;[<a =
href=3D"mailto:afish@apple.com" class=3D"">afish@apple.com</a>]<br =
class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</blockquote></blo=
ckquote></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_7D7E9BD1-1AFE-4709-86D5-D49A2550EB02--


--===============5475844277541672194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5475844277541672194==--

