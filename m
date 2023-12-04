Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81243803A29
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647162.1009935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABlr-0003n2-OW; Mon, 04 Dec 2023 16:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647162.1009935; Mon, 04 Dec 2023 16:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABlr-0003kE-Lo; Mon, 04 Dec 2023 16:26:11 +0000
Received: by outflank-mailman (input) for mailman id 647162;
 Mon, 04 Dec 2023 16:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rABlq-0003k2-DZ
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:26:10 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0a0796e-92c1-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 17:26:02 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9f72176cfso21240291fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 08:26:02 -0800 (PST)
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
X-Inumbo-ID: d0a0796e-92c1-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701707161; x=1702311961; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T3QdI1C+dXcYTjlrn+RsitEevQdL9pj9FuRq72TdleM=;
        b=eneMLp/CVEzAj7tJV/wHFkQKqk7y+7rz/UeCDZbuiy4CJRWZ3Nnzyvj8mtju70ufIL
         0bDh4SkHhXv03DnIleAzuqHZLddt/F9l0xnTSBU0Nw2Am6BYkMtUPwnGYPMLmEbrou0a
         wdX3ryImk13VS88fbkr9baW7eTDB88feJ9UjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707161; x=1702311961;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3QdI1C+dXcYTjlrn+RsitEevQdL9pj9FuRq72TdleM=;
        b=iUoT9OYkbgRMWgBSLqIotaNiJXSActFBG4p195YHJMQ84h+/2eNWvtpwSC8Fl2wa9X
         3tq5fTZeqXSdOAAAi80Mh2brKfp+lezVVKQx4eJ4zZXmeMewwWMuyMItI71XCtVjg4D1
         qsNuIYDTxJ3HsPNvhP+Bh/VoNV1geWfXgdy46nuVtnNFKzpNcoBc3So9KpLozOUSKAJ+
         tEXuvu3LyPuXDGgSi8FqgdPA8rwIGi66cZNB/Ypy2x64wunSuwFybcbpYAwi5CHGW2y/
         uteZzI6r5A+RinSm4Mzsp7qLNCcxDFhnUcpjFPyoWEsn9LZbP8rE3Iq7LheTcxAlB2IQ
         b/YA==
X-Gm-Message-State: AOJu0YwHz3LadkyaPZzRtBq2PGynXwFaIV0yUf4A8F7mD6WzplQVRdKP
	YqjtARqq2QT3Ak2aP0dLV3J+vfB/J8T3D6nbWn6awdC34U3cMXUQZekkuQ==
X-Google-Smtp-Source: AGHT+IFng8YeExqguCpr6kLVw5IazKc35fhaMnb+D6ZvSvhHuhrWiZP+U50MIHkRXGuRBIyw2OXGip4/72GtCa6n5sQ=
X-Received: by 2002:a2e:a304:0:b0:2c9:bb88:6ef3 with SMTP id
 l4-20020a2ea304000000b002c9bb886ef3mr1237937lje.18.1701707161438; Mon, 04 Dec
 2023 08:26:01 -0800 (PST)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 16:25:50 +0000
Message-ID: <CA+zSX=bpVoB7vB0_FgxadybyjTP-SL7a4uFZRwRXtA-CPqZ16A@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for YYY Community Call @ 1500 UTC
To: Xen-devel <xen-devel@lists.xenproject.org>, 
	Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>, 
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	Sergey Dyasli <sergey.dyasli@citrix.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, 
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <pdurrant@amazon.com>, "Ji, John" <john.ji@intel.com>, 
	"robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, 
	Matt Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?= <cardoe@cardoe.com>, 
	George Dunlap <george.dunlap@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?= <varadgautam@gmail.com>, 
	Brian Woods <brian.woods@xilinx.com>, Robert Townley <rob.townley@gmail.com>, 
	Bobby Eshleman <bobby.eshleman@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?= <cminyard@mvista.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Brendan Kerrigan <brendank310@gmail.com>, Thierry Laurion <insurgo@riseup.net>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Scott Davis <scottwd@gmail.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
	Marc Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming Shen <zshen@exotanium.io>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>, 
	Per Bilse <per.bilse@citrix.com>, Samuel Verschelde <stormi-xcp@ylix.fr>, 
	Andrei Semenov <andrei.semenov@vates.fr>, Yann Dirson <yann.dirson@vates.fr>, 
	Bernhard Kaindl <bernhard.kaindl@cloud.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLTHVjYSBGYW5jZWxsdQ==?= <luca.fancellu@arm.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Vikram Garhwal <vikram.garhwal@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	Kelly Choi <kelly.choi@cloud.com>, Vaishali Thakkar <me.vaishalithakkar@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'll be running the community call while Kelly is travelling.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/SvabZ2utDN3G7XRSG2k1NSLJ/ and you
can edit to add items.  Alternatively, you can reply to this mail
directly.

Agenda items appreciated a few days before the call: please put your
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the previous meeting otherwise, the call is on the
1st Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George


== Dial-in Information ==
## Meeting time
16:00 - 17:00 British time
Further International meeting times:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=12&day=7&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

