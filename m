Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3F78EA22
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593727.926796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qberR-0004qe-5S; Thu, 31 Aug 2023 10:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593727.926796; Thu, 31 Aug 2023 10:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qberR-0004oa-2F; Thu, 31 Aug 2023 10:25:13 +0000
Received: by outflank-mailman (input) for mailman id 593727;
 Thu, 31 Aug 2023 10:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvVB=EQ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qberP-0004oF-9i
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:25:11 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9b02d9a-47e8-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 12:25:10 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-500bb392ab7so1271111e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 03:25:10 -0700 (PDT)
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
X-Inumbo-ID: a9b02d9a-47e8-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693477509; x=1694082309; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5eIk4b8bm7Nj2Znmo4bCpni4RJbcYsj/N2fBl7uhdvg=;
        b=JbdW+EFiSvLPZ0WZZJVF68lxOS1pqYBQ1k45MLx5ako2l6uJVWv8glVC7RUZ5Uc6XP
         A9nI4Tnyie86KEUh7fHkCkmCTmU46ckl3R/n/GshYubaJEIPdrVP1+13GVpMcOhS7Wh3
         mziIu+RNRDuYYd8XsamvZpSiI38Xkb/9N6BV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693477509; x=1694082309;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eIk4b8bm7Nj2Znmo4bCpni4RJbcYsj/N2fBl7uhdvg=;
        b=e/up5JmxSN1nYiNmEHo/Exkwe4ZdXwhBJCD+PvATuB6iC4xqxW+DOQoMJKWbTtGwQt
         0T19KGpBfC71WR6r/lC0GMmcC5/4X3T03bIuDVFlcb+IxG93J4sQXCLjH76Wj0A281kK
         dHyRRdX8BOWX0rlhN/dOZSIPlC3KC8ClvzuYoGl81eucfs1l7LbID/FRRl6UIESN+psp
         SdZDrrmj139c9iXqkahc+JqrRx7gW03yjdZ9kAoX5PpynZ6o1D1+cwqoBnPN1IxKUZKh
         cYxEgSDE6Jih9ovilwmbcVc1rtoodGFktX+03Hkwq3rNT7OyKzhrj922iq/OljQzsk2O
         cFqg==
X-Gm-Message-State: AOJu0YyXu67S3nUdh07CE1SWusud+8ScCI9TQPkUvW7xTPGLmi1+JRPt
	WID+uT3wo5nvX451CzqwPj5IsxnT2wSEZxs/oYVJRVkbitotmL/HTyLMtw==
X-Google-Smtp-Source: AGHT+IHVwhvCiFWtlNmxoBVu6jdD6hdkX1OjJnjgqYBzcdTZyC7Bq02p9r2qCFKIcjtV03uzi/5a5Q5Yk2UVbsZSMS4=
X-Received: by 2002:a05:6512:3d24:b0:500:b973:8e32 with SMTP id
 d36-20020a0565123d2400b00500b9738e32mr4379690lfv.68.1693477509257; Thu, 31
 Aug 2023 03:25:09 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 31 Aug 2023 11:24:58 +0100
Message-ID: <CA+zSX=ZFPALNNN0NATqAjLSNGB=oksbhyu-90J848PjHQJNQ4w@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 7 September Community Call @
 1500 UTC
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
	Kelly Choi <kelly.choi@cloud.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/s6D6t2vTjCkpfRIJXo8IVSWf/ and you
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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=9&day=7&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

