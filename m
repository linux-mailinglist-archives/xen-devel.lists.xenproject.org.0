Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C37B0C0B2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051324.1419653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnBN-0002tT-1S; Mon, 21 Jul 2025 09:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051324.1419653; Mon, 21 Jul 2025 09:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnBM-0002rw-Uy; Mon, 21 Jul 2025 09:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1051324;
 Mon, 21 Jul 2025 09:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gi0K=2C=bounce.vates.tech=bounce-md_30504962.687e0da8.v1-893ce259eea44b818686d1bff46f242d@srs-se1.protection.inumbo.net>)
 id 1udnBL-0001aA-D9
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:51:39 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b214c93-6618-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:51:38 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4blwf04xWZzNCfNV1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:51:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 893ce259eea44b818686d1bff46f242d; Mon, 21 Jul 2025 09:51:36 +0000
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
X-Inumbo-ID: 4b214c93-6618-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753091496; x=1753361496;
	bh=plDmh4J7Y95MD5zWE1O2+aAykVIgtRTi79dNDV82XoU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BSn9eV713hXQowhA7jrOKyzAesg/F7CS6wksVoRSHYeiZChF1wEsev8KHhHg78Kl+
	 QdBzhLieu73W7jAZN755FY6nb7CJ2tx2t88nXl8limLBnUKPNysWGo8A8UDwn9Bzpi
	 u7TvU9vLhuAwlNJOGTkDU50Cl8lflm42+KtzihI8GQfhevHI3nZBMnawb8D8pyL9W/
	 rLj4Y3OTXpNNsI775Me4xAtwg0JKidaQNXMQB68mkloKoKsmiUZIpRS9gTGtvCUXmQ
	 j1XPKgx23vyjKiwKEYJJPhdx33WNgdvE4I7VDzQZKOlysv9W1kFSDC3yZtGFgyLPxe
	 TA/iN1gWPhDrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753091496; x=1753351996; i=anthoine.bourgeois@vates.tech;
	bh=plDmh4J7Y95MD5zWE1O2+aAykVIgtRTi79dNDV82XoU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gZoir4uPa0Smhb5VibKy9ZiOEnCzDqtaAHLjve3XVJPC364gqV7MSDiN01Ri1Tpj7
	 JCG/SmZhp0AJasiKsj+vbjPSaMYvcQpy8wZGPIBzJBE8DSMqjtZICKP8TOz06+USFy
	 jyhsqwovlDDmrn/4rjka+3XdFsnpbIq+lf/WtW5Y8ZaVdWbss9Zxg/LbWzg6tdoRqZ
	 eddX9SVkmeK8PjfQ8ieM4PEdCk1z6aS23KYq6RhaH+B39JzX9TfhhToZNTHFXxxwFx
	 4r0G92n9qQ7Fg3lm0ul3ZlJmy8tN8eupJBzD1bQTaQf7Owsaq8frdh9vsz+lI+TxCO
	 dU4gealiAAH7w==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753091495722
To: "Elliott Mitchell" <ehem+xen@m5p.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <aH4NpRKpUkJkXck1@mail.vates.tech>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech> <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com> <aHSth3FOCpiRRfwv@mail.vates.tech> <aHWi3ncNrVBO6jrh@mattapan.m5p.com> <aHYPktKlOyFJ49bb@mail.vates.tech> <aHapxmJ6miJnWYit@mattapan.m5p.com> <aHdZInm-EC487zKi@mail.vates.tech> <aHfv6jj4GkW7ZR2S@mattapan.m5p.com> <aHqzEUtvIz1KpRW3@mattapan.m5p.com>
In-Reply-To: <aHqzEUtvIz1KpRW3@mattapan.m5p.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.893ce259eea44b818686d1bff46f242d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250721:md
Date: Mon, 21 Jul 2025 09:51:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 18, 2025 at 01:48:17PM -0700, Elliott Mitchell wrote:
>On Wed, Jul 16, 2025 at 11:31:06AM -0700, Elliott Mitchell wrote:
>> On Wed, Jul 16, 2025 at 07:47:48AM +0000, Anthoine Bourgeois wrote:
>> > On Tue, Jul 15, 2025 at 12:19:34PM -0700, Elliott Mitchell wrote:
>> > >
>> > >I tend to follow Debian, so kernel 6.1.140 and 4.17.6.  What may be
>> > >more notable is AMD processor.
>> > >
>> > >When initially reported, it was reported as being more severe on systems
>> > >with AMD processors.  I've been wondering about the reason(s) behind
>> > >that.
>> >
>> > AMD processors could make a huge difference. On Ryzen, this patch could
>> > almost double the bandwidth and on Epyc close to nothing with low
>> > frequency models, there is another bottleneck here I guess.
>> > On which one do you test?
>> >
>> > Do you know there is also a workaround on AMD processors about remapping
>> > grant tables as WriteBack?
>> > Upstream patch is 22650d605462 from XenServer.
>> > The test package for XCP-ng with the patch:
>> > https://xcp-ng.org/forum/topic/10943/network-traffic-performance-on-amd-processors
>> >
>>
>> Why are you jumping onto mostly unrelated issues when the current bug is
>> unfinished?
>>
>> Spurious events continue to be observed on the network backend.  Spurious
>> events are also being observed on block and PCI backends.  You identified
>> one cause, but others remain.
>>
>> (I'm hoping the next one effects all the back/front ends; the PCI backend
>> is a bigger issue for me)
>>
>> Should add, one VM being observed with these issue(s) is using 6.12.38.
>
>For reference, the following:
>
>for d in /sys/devices/{pci,vbd,vif}-*[0-9]-*[0-9]/xenbus
>do      if [ -f "$d/spurious_events" ]
>        then    read s < "$d/spurious_events"
>        else    s=0
>        fi
>        if [ "$s" -gt 0 ]
>        then    printf "problem %s: %d\\n" "$d/spurious_events" "$s"
>        else    printf "clean: %s\\n" "$d/spurious_events"
>        fi
>done
>
>Flags all passthrough and virtual devices.  Even though there is a
>reduction with virtual network devices, that is only a 10% reduction.
>Most of the problem remains even though there is progress.
>
>I was mentioning an AMD processor since the initial report stated the
>problem was more severe with AMD processor machines.
>
>This is likely a driver design issue.  Most pieces of hardware, telling
>the hardware to process an empty queue is quite cheap.  Perhaps minor
>energy loss, but most hardware isn't (yet) too worried about being
>attacked.
>
>Passthrough and virtual devices are quite unusual in there being a
>concern over attacks.  There could be major design flaws due to the
>front-ends being designed similar to normal drivers.
>

Hmm, you check the spurious on the backend.
Sorry I should have been more specific, this patch only mitigate the
spurious on the frontend.

I will take a look on the backend.

Regards,
Anthoine


Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


