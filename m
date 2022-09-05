Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982435AD92F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 20:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399139.640205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVH5k-00085J-8h; Mon, 05 Sep 2022 18:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399139.640205; Mon, 05 Sep 2022 18:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVH5k-00081s-59; Mon, 05 Sep 2022 18:45:04 +0000
Received: by outflank-mailman (input) for mailman id 399139;
 Mon, 05 Sep 2022 18:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErJb=ZI=gmail.com=nadav.amit@srs-se1.protection.inumbo.net>)
 id 1oVH5j-00081m-D0
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 18:45:03 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d924e6d8-2d4a-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 20:45:02 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id y29so9308161pfq.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 11:45:02 -0700 (PDT)
Received: from smtpclient.apple (c-24-6-216-183.hsd1.ca.comcast.net.
 [24.6.216.183]) by smtp.gmail.com with ESMTPSA id
 u15-20020a170903124f00b00176ba091cd3sm1910534plh.196.2022.09.05.11.44.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:44:59 -0700 (PDT)
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
X-Inumbo-ID: d924e6d8-2d4a-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=bp7uubPhvNdLHMSt0aPBCCek7261kdyNq09tUdxS+hw=;
        b=piwDQu/IQn+iTyDmrFAKLLGug2/KVIY0wExpws2cTzWbVzQSAeP21bPvOiuaRqDs2W
         JQoerfe3i4QQz7Cj1GsYnZVIR1xKCKWMECDAl3eXr+TOFn09Ud17TXz2OPRBNMzXaQ00
         bRAB2djvvnCoTXv68Ow/gDY8gNR87B3UphTOmg/nkljGpBLK2Kru1ca9zKlDPQvntNjO
         mMIzgSHR8yf5hPReChlBzaYVsZgAt1UFpnPZ3NTnb1GPzkwb3HG7zv/BZtSipedU5QQ3
         aVcP2YbTWfY0XZEJvLhnxRCKUAZXjcy0d3SAOSR8rLFHgESMgNsb387q+JmPGxUvicyP
         hisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bp7uubPhvNdLHMSt0aPBCCek7261kdyNq09tUdxS+hw=;
        b=CpmZTDSiyUofPi0g9+3K8K1bWab53ZdKlCc+vZaEB/ekQ0kRxRKMBAFvB/tV7+tzxl
         lQZz2ATLPKlvdwrPRSav1ir9g3D8+28yw3ijMMI5s4kVtlEtiHg9bbEDBMEG2JyOKkko
         YA4Wt4uAGHMG6EktIBBmWvv3Ksa8uwh1SJvGs5m3Yo0E7NMucPupZ4QzsUg9LkzSv+37
         VXsxf8TcMksSQEbU7oHYaHgMITOARAwrQrQGppya2ox4P3WzkBFBYteH2gGoclH4i3mA
         HmUnsTuHxzJjHQKYvmOU99LJTKb+Vtk2GeIQct2JW3aVbTyNbsVOPePmm7m3pwZho4qE
         bBMg==
X-Gm-Message-State: ACgBeo1NKo0uToUR0TazW7Vtgr/2QfegJL3MFJ8n9ztri5iMNu+YAO0d
	0AKufrfXf5uzjEbN2/M1vIM=
X-Google-Smtp-Source: AA6agR5Z0n78WBJ+tl3rvbtMAHs4LRm2iBpVTL/7lQ4Vdk+FtE7G2db+zR5YWnYqEMH87O6DNCB35w==
X-Received: by 2002:a65:6cc8:0:b0:3fe:2b89:cc00 with SMTP id g8-20020a656cc8000000b003fe2b89cc00mr43555470pgw.599.1662403500241;
        Mon, 05 Sep 2022 11:45:00 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20220831101948.f3etturccmp5ovkl@suse.de>
Date: Mon, 5 Sep 2022 11:44:55 -0700
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>,
 roman.gushchin@linux.dev,
 dave@stgolabs.net,
 Matthew Wilcox <willy@infradead.org>,
 liam.howlett@oracle.com,
 void@manifault.com,
 juri.lelli@redhat.com,
 ldufour@linux.ibm.com,
 Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Jens Axboe <axboe@kernel.dk>,
 mcgrof@kernel.org,
 masahiroy@kernel.org,
 nathan@kernel.org,
 changbin.du@intel.com,
 ytcoode@gmail.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 Steven Rostedt <rostedt@goodmis.org>,
 bsegall@google.com,
 bristot@redhat.com,
 vschneid@redhat.com,
 cl@linux.com,
 penberg@kernel.org,
 iamjoonsoo.kim@lge.com,
 42.hyeyoo@gmail.com,
 glider@google.com,
 Marco Elver <elver@google.com>,
 dvyukov@google.com,
 Shakeel Butt <shakeelb@google.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Arnd Bergmann <arnd@arndb.de>,
 jbaron@akamai.com,
 David Rientjes <rientjes@google.com>,
 minchan@google.com,
 kaleshsingh@google.com,
 kernel-team@android.com,
 Linux MM <linux-mm@kvack.org>,
 iommu@lists.linux.dev,
 kasan-dev@googlegroups.com,
 io-uring@vger.kernel.org,
 linux-arch <linux-arch@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org,
 linux-modules@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8EB7F2CE-2C8E-47EA-817F-6DE2D95F0A8B@gmail.com>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
To: Mel Gorman <mgorman@suse.de>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

On Aug 31, 2022, at 3:19 AM, Mel Gorman <mgorman@suse.de> wrote:

> On Wed, Aug 31, 2022 at 04:42:30AM -0400, Kent Overstreet wrote:
>> On Wed, Aug 31, 2022 at 09:38:27AM +0200, Peter Zijlstra wrote:
>>> On Tue, Aug 30, 2022 at 02:48:49PM -0700, Suren Baghdasaryan wrote:
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>>> Code tagging framework
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>>> Code tag is a structure identifying a specific location in the =
source code
>>>> which is generated at compile time and can be embedded in an =
application-
>>>> specific structure. Several applications of code tagging are =
included in
>>>> this RFC, such as memory allocation tracking, dynamic fault =
injection,
>>>> latency tracking and improved error code reporting.
>>>> Basically, it takes the old trick of "define a special elf section =
for
>>>> objects of a given type so that we can iterate over them at =
runtime" and
>>>> creates a proper library for it.
>>>=20
>>> I might be super dense this morning, but what!? I've skimmed through =
the
>>> set and I don't think I get it.
>>>=20
>>> What does this provide that ftrace/kprobes don't already allow?
>>=20
>> You're kidding, right?
>=20
> It's a valid question. =46rom the description, it main addition that =
would
> be hard to do with ftrace or probes is catching where an error code is
> returned. A secondary addition would be catching all historical state =
and
> not just state since the tracing started.
>=20
> It's also unclear *who* would enable this. It looks like it would =
mostly
> have value during the development stage of an embedded platform to =
track
> kernel memory usage on a per-application basis in an environment where =
it
> may be difficult to setup tracing and tracking. Would it ever be =
enabled
> in production? Would a distribution ever enable this? If it's enabled, =
any
> overhead cannot be disabled/enabled at run or boot time so anyone =
enabling
> this would carry the cost without never necessarily consuming the =
data.
>=20
> It might be an ease-of-use thing. Gathering the information from =
traces
> is tricky and would need combining multiple different elements and =
that
> is development effort but not impossible.
>=20
> Whatever asking for an explanation as to why equivalent functionality
> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.

I would note that I have a solution in the making (which pretty much =
works)
for this matter, and does not require any kernel changes. It produces a
call stack that leads to the code that lead to syscall failure.

The way it works is by using seccomp to trap syscall failures, and then
setting ftrace function filters and kprobes on conditional branches,
indirect branch targets and function returns.

Using symbolic execution, backtracking is performed and the condition =
that
lead to the failure is then pin-pointed.

I hope to share the code soon.


