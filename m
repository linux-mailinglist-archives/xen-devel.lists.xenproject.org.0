Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDD7B546B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 16:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611585.951084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnJYB-0004Je-CM; Mon, 02 Oct 2023 14:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611585.951084; Mon, 02 Oct 2023 14:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnJYB-0004Hs-9R; Mon, 02 Oct 2023 14:05:31 +0000
Received: by outflank-mailman (input) for mailman id 611585;
 Mon, 02 Oct 2023 14:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWvZ=FQ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qnJY9-0004Hm-FG
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 14:05:29 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcd3b6c5-612c-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 16:05:27 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c00df105f8so261400911fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Oct 2023 07:05:27 -0700 (PDT)
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
X-Inumbo-ID: bcd3b6c5-612c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696255527; x=1696860327; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dBzT8eXaQ5wsgfoWTCpotoEQ3+0daidlOKbjZvnMEHE=;
        b=GF5YUlGjCTCXTxQDeMqpOdUAhUFykv5ikrlrIA7S8E1x9KwSkAg1iLm+L1Kv9x8BG4
         jX6qm6NMq49XyVC6P2YlGK909a0d/iCg+Qtr3zhmZkyCcteK37me/KASs8Y1Yqzq4CVM
         OwjQo2eJKPYgp2GNPluEOfl4rkoZS8qiYwdF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255527; x=1696860327;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBzT8eXaQ5wsgfoWTCpotoEQ3+0daidlOKbjZvnMEHE=;
        b=sdnSmYOf4ndt7g3lPnY/+WcxCC/MyTNW7UUdMWMqunzLXMAqvAGawwIIaro9TmNdh5
         JI0zEPAsTDL96uLR46BYzjr7EXSqWldBs+8NCSl4xBxkeyVcWodZDODhfd/ZsXWTKrXq
         gOpxHxjoXLwyT2Rl063MEOs983KEef/fqKDFEbCSAgBTMYCuksrbrcqbouKgrUHfgZMh
         1nvAY7odXT1JAGFCWWLvJkq6VdtMjLsN8cadBVtp3gN4h//OeyQcsmtEIxtYWn/uJgFR
         3fOGy2gkstXQEmVS32uojl0sUXpaGu63rjhjQOAXydGuhE3iADzWO73lC4EzpQzJG2hf
         EdnQ==
X-Gm-Message-State: AOJu0Yz5qWK/4mABcwd9VhO4w17yQHkGjvaJFRX/hZ2qPHKM+LckW+vv
	Y0f7+0ZwW9bempER6TDU5V7LnO2Fln/8ofrK+fmVFj0ndPmItpwCoGrxMVtS
X-Google-Smtp-Source: AGHT+IGmYv7wWkM4njgLrEXiKsHJsDTwn8+eh8KSk5eAB2zzzF+/gfCImxi9+cuNJ6OC2fx9iH5NwGcH5VBDrhakcnY=
X-Received: by 2002:a2e:9611:0:b0:2bc:dcdb:b5dc with SMTP id
 v17-20020a2e9611000000b002bcdcdbb5dcmr10085026ljh.39.1696255526318; Mon, 02
 Oct 2023 07:05:26 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 2 Oct 2023 15:05:15 +0100
Message-ID: <CA+zSX=bSmA+NMgZTdgeDshy2p91br3RgS0j6+2973Z22u+7Ngw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 5 October Community Call @ 1500 UTC
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

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/cQBSSCUBQj9es3-wcs7I+8Em/ and you
can edit to add items.  Alternatively, you can reply to this mail
directly.  I'll be running the meeting while Kelly is on PTO.

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=10&day=5&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

