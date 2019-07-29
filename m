Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20207B862
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 06:05:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsfoU-0002Xv-PA; Wed, 31 Jul 2019 04:02:06 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.152])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <bcotton@redhat.com>) id 1hsAr0-0003T0-Rm
 for xen-devel@lists.xensource.com; Mon, 29 Jul 2019 18:58:38 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id B1/29-30864-DD14F3D5;
 Mon, 29 Jul 2019 18:58:37 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-10.tower-244.messagelabs.com: domain of redhat.com designates 
 209.85.210.193 as permitted sender) smtp.mailfrom=redhat.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsVyMfTSQd27jva
 xBkdmMlvcm/Ke3YHRY3vfLvYAxijWzLyk/IoE1owfC/ezFNxirzhwcCJzA+Miti5GLg4hgemM
 EldXf2MBcSQE5rBKTHrTztrFyAnkVEnsv3+PCcIukph/bCsbhF0u8X/iFXYQm1dAUOLkzCcsE
 JNusUj8vrKNBSTBKeAv8f/9MbBmNgFVicXvFzOD2CxA9t61D1kgmgMk7n75DrZMWMBR4sb2j4
 wgg0QEuhklVn29wAziMAtsY5bY+G4uI0gVs4CmROv23+wTGPlnIdk+C0lqASPTKkbLpKLM9Iy
 S3MTMHF1DAwNdQ0NjXXNdQzNDvcQq3SS91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmBg
 phSyL9zB+G7WG71DjJIcTEqivOlW9rFCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjvOwDlBItS0
 1Mr0jJzgFECk5bg4FES4V0KkuYtLkjMLc5Mh0idYjTmWLJx3iJmjo5fixYxC7Hk5eelSonzfr
 QHKhUAKc0ozYMbBIveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeR1BFvJk5pXA7XsFdAo
 T0Cl7+O1ATilJREhJNTDFKOR+rDh5KbbWd+mMc4WnSzSUijUN+Xl3/UrK+GWQLKBleeTU+ojG
 b9ff73E0PbqseDOP8TRTv9v9P7wO6VQxvHDi/2yibZPZNsEk/vH/L7qf98zSlPMvqQvhmDHJ5
 ksi11KLHVUTj0z+JPj7W/3dc62R309/zWBbK35dzrCD63vKr7X8eZMPSe2v+r43S+LHndCUZf
 PlksofMLy0DLq46+7+j0ZTTMSetwk3fOXpXhslE8Z2Z27/kbUsMhZz17PzaEam770pckWmpLf
 n9CLf9s3Gk5dOS9Us3bii2yLX686vY+e6D229JNB1cE3ohLPMOyqPzJh6bPXq/192TPr3W+0T
 85/ACw71TbcahDxDlFiKMxINtZiLihMBuCuvhVkDAAA=
X-Env-Sender: bcotton@redhat.com
X-Msg-Ref: server-10.tower-244.messagelabs.com!1564426715!294522!1
X-Originating-IP: [209.85.210.193]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10981 invoked from network); 29 Jul 2019 18:58:36 -0000
Received: from mail-pf1-f193.google.com (HELO mail-pf1-f193.google.com)
 (209.85.210.193)
 by server-10.tower-244.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 29 Jul 2019 18:58:36 -0000
Received: by mail-pf1-f193.google.com with SMTP id g2so28492682pfq.0
 for <xen-devel@lists.xensource.com>; Mon, 29 Jul 2019 11:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhDoHkOBRNE6/ottiNVtWGgZ+2YA3S3gr0JOIEPmtts=;
 b=m2Yd3i2xVVpP049uPRc7jJQvCTRDY4IKdEq3PB+I8+ObkPFVSTQH0pDxC8iX95kE1W
 FTRqt4pp6t70n9VyZHF9aX8f/keIJsqM+O4flGtvUmnhycCUwBRumjGp388RnHRNxb45
 RSOHGoF0fCTxxPIiddUucGBNdXdI+kUN7rDIZnV/1RNGMVmJZftuxV8D7lmFfyNBnjwj
 a+iIism5sELCeB6EBeDegyFYHg38Bb+gmiYkEatbMOznpD7JDY8uKiWCBLW2OaaZLbh+
 jkzpN+cq4m0/oyBmcV2mp49mi9shxRTHnwyZl8r6EH5kpFAqFEQQEZgR3QWnDalhtgPU
 U3GQ==
X-Gm-Message-State: APjAAAUtHJ+YND+dCMcOAVkIwDayEVFqGdZNpGJaGHI3NhvL1idqP89w
 1IL59i31hBXvKP6riQKbhGizatkZYyDwMtTfp5zSGg==
X-Google-Smtp-Source: APXvYqyWnFHlPtkY9nMXOa9Is2+aG1WL5Z976sI8RJ8YEpZQslLEk28F+nLIBqvMdzasAxlz3DQY0ezXSjR5p15Lti4=
X-Received: by 2002:a63:484d:: with SMTP id
 x13mr105042782pgk.122.1564426715090; 
 Mon, 29 Jul 2019 11:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
 <64ed536563d83cdf164e87c044fecdbb75ba73f3.camel@fedoraproject.org>
In-Reply-To: <64ed536563d83cdf164e87c044fecdbb75ba73f3.camel@fedoraproject.org>
From: Ben Cotton <bcotton@redhat.com>
Date: Mon, 29 Jul 2019 14:58:24 -0400
Message-ID: <CA+voJeUC1x53nDh8AMG=tW9AThD7Y-fiBMetTH_0+BTT0O=SHg@mail.gmail.com>
To: Fedora Cloud SIG <cloud@lists.fedoraproject.org>, 
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
X-Mailman-Approved-At: Wed, 31 Jul 2019 04:02:05 +0000
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgNzoxNiBQTSBBZGFtIFdpbGxpYW1zb24KPGFkYW13aWxs
QGZlZG9yYXByb2plY3Qub3JnPiB3cm90ZToKPgo+IE9LLCBzbywgdG8gbW92ZSBmb3J3YXJkIHdp
dGggdGhpcyAoYW5kIGxvb3BpbmcgaW4gY2xvdWQgbGlzdCk6IGRvZXMKPiBzb21lb25lIHdhbnQg
dG8gcHJvcG9zZSBhIHNldCAoaWRlYWxseSBzbWFsbCAtIDIgd291bGQgYmUgZ3JlYXQsIG9uZQo+
IFhlbiBhbmQgb25lIG5vbi1YZW4sIGlmIHdlIGNhbiBjb3ZlciBtb3N0IGNvbW1vbiB1c2FnZXMg
dGhhdCB3YXkhKSBvZgo+IEVDMiBpbnN0YW5jZSB0eXBlcyB3ZSBzaG91bGQgdGVzdCBvbj8gV2l0
aCB0aGF0LCB3ZSBjb3VsZCB0d2VhayB0aGUKPiBjcml0ZXJpYSBhIGJpdCB0byBzcGVjaWZ5IHRo
b3NlIGluc3RhbmNlIHR5cGVzLCB0d2VhayB0aGUgQ2xvdWQKPiB2YWxpZGF0aW9uIHBhZ2UgYSBi
aXQsIGFuZCB0aGVuIGRyb3AgdGhlIFhlbiBjcml0ZXJpb24gYW5kIHRlc3QgY2FzZS4KPgoKSSdk
IHN1Z2dlc3QgYzUubGFyZ2UgKEtWTSwgYWZhaWN0KSBhbmQgdDMubGFyZ2UgKFhlbikuCgpNeSBB
V1MgZXhwZXJpZW5jZSBpcyBwcm9iYWJseSBub3QgcmVwcmVzZW50YXRpdmUgKGJlaW5nIG1vc3Rs
eSBpbiB0aGUKSFBDIHNwYWNlKSwgYnV0IHRoZXNlIHNlZW0gbGlrZSB0aGV5J2QgaGl0IHRoZSB0
d28gdXNlIGNhc2VzIEknZApleHBlY3QgdG8gc2VlIGZvciBGZWRvcmEgKGNvbXB1dGUgYW5kIHNt
YWxsIHNlcnZlcnMpLiBJIHdvdWxkIGV4cGVjdAptb3JlIHBlb3BsZSB3b3VsZCB1c2UgTSByYXRo
ZXIgdGhhbiBDIGZvciBGZWRvcmEsIGJ1dCB0aGlzIGdldHMgdXMgYQpLVk0tYmFzZWQgaW5zdGFu
Y2UuCgpIYXBweSB0byBoZWFyIHdoeSBJJ20gd3JvbmcuIDotKQoKLS0KQmVuIENvdHRvbgpIZSAv
IEhpbSAvIEhpcwpGZWRvcmEgUHJvZ3JhbSBNYW5hZ2VyClJlZCBIYXQKVFo9QW1lcmljYS9JbmRp
YW5hL0luZGlhbmFwb2xpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
