Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D314ACA1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 00:32:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwDof-000158-8K; Mon, 27 Jan 2020 23:29:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LMPD=3Q=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iwDod-000153-EV
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 23:29:11 +0000
X-Inumbo-ID: d1797d76-415c-11ea-b45d-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1797d76-415c-11ea-b45d-bc764e2007e4;
 Mon, 27 Jan 2020 23:29:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RNN3CL036125;
 Mon, 27 Jan 2020 23:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=corp-2019-08-05;
 bh=mfioxmdR2FGExhyT6Mng5mcE+EsgGV9VGne7EvYdh5s=;
 b=pcumYC7lxJRbXCjALEeZwFluLJ/zTMIBVo5WyN7Kog79rgyaZ7sF07H86tMP9zoHE9/T
 2WFetLuJ3vfNtX4jLrk4//QwzZJangCph+ONBPuoU135VAayfJ78vLQfeLHiHjNqeXP9
 8EGhJcH0DABPFAN+q0gQThalAj3IeHqtnEhQISH3ClIjkumGrUvvDVmiFctk+chKEgDq
 Hou6pPr3wy0F6VtDi+K5qXk3ouKUXvBMVSwJdfsOUUnSdCIDMUljrsLV1bpBZdPaNhZ1
 QDtUKlfrRNGBNd/Us1whEMHzi3dfZ3j3slj/gZrW1Jg1wxpYg8K80PAaWEEalJV8QZK8 IQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xrd3u2rkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 23:29:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RNNeCb129394;
 Mon, 27 Jan 2020 23:29:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2xry4vcrds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 23:29:00 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00RNSwow000657;
 Mon, 27 Jan 2020 23:28:58 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jan 2020 15:28:57 -0800
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
 <20200127213722.GC2995@mail-itl>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <a486de72-c3bf-2d32-c86c-0e38d9d87f0a@oracle.com>
Date: Mon, 27 Jan 2020 18:29:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127213722.GC2995@mail-itl>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270183
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270183
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 Jason Gunthorpe <jgg@mellanox.com>
Content-Type: multipart/mixed; boundary="===============0847949493711425214=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============0847949493711425214==
Content-Type: multipart/alternative;
 boundary="------------F94AA9BE90BF735764B8F8F9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F94AA9BE90BF735764B8F8F9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 1/27/20 4:37 PM, Marek Marczykowski-G=C3=B3recki wrote:
> On Mon, Jan 27, 2020 at 03:45:11PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 27.01.20 14:16, Ilpo J=C3=A4rvinen wrote:
>>> Hi,
>>>
>>> I've noted that 5.5-rcs and now 5.5-based kernel fails to boot in VM.=

>>> 5.4 based kernels worked fine and there seems to have been some chang=
es in
>>> drivers/xen post-5.4 so perhaps they broke something?
>> I can't reproduce your problem. Just booted a VM with kernel 5.5 as
>> PV- and as HVM-guest without any problems.
> It looks like an issue with gntdev driver, so reproducing it require an=
y
> userspace that actually makes use of it. Any idea what recent change
> could cause that?
>
>>> Loading Linux 5.5.0-accecn30 ...
>>>
>>> .[5;22H      [ initrd.img-5.5.0-acc  16.52MiB  100%  10.23MiB/s ].[5;=
1HSetting up swapspace version 1, size =3D 1073737728 bytes
>>> /dev/xvda3: clean, 852118/1294896 files, 3076785/5190907 blocks
>>> [    2.730931] BUG: kernel NULL pointer dereference, address: 0000000=
0000003b0
>>> [    2.730959] #PF: supervisor read access in kernel mode
>>> [    2.730966] #PF: error_code(0x0000) - not-present page
>>> [    2.730973] PGD 0 P4D 0
>>> [    2.730978] Oops: 0000 [#1] SMP PTI
>>> [    2.730985] CPU: 1 PID: 402 Comm: qubesdb-daemon Tainted: G       =
    O      5.5.0-accecn30 #31
>>> [    2.731000] RIP: 0010:mmu_interval_read_begin+0x24/0xc0




This looks like it could well be
d3eeb1d77c5d0af9df442db63722928238310a86. Can you revert it and see if
it makes a difference?

(+Jason)

-boris




>>> [    2.731008] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 fc =
55 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8b 4=
7 38 <48> 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b 64
>>> [    2.731030] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
>>> [    2.731037] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 00000=
00000000000
>>> [    2.731047] RDX: ffff8a4ef53add00 RSI: 0000000000000000 RDI: ffff8=
a4e94712500
>>> [    2.731057] RBP: ffff8a4e0bf7a640 R08: 00007bc5c0573000 R09: 00000=
00000000008
>>> [    2.731066] R10: ffff8a4ec756c190 R11: 00007bc5c05a2000 R12: ffff8=
a4e94712500
>>> [    2.731076] R13: ffff8a4ed3ab9d50 R14: 0000000000000000 R15: 00000=
00000000001
>>> [    2.731086] FS:  00007bc5c00dc7c0(0000) GS:ffff8a4ef5d00000(0000) =
knlGS:0000000000000000
>>> [    2.731097] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [    2.731105] CR2: 00000000000003b0 CR3: 000000008148e004 CR4: 00000=
000003606e0
>>> [    2.731116] Call Trace:
>>> [    2.731123]  ? vma_merge+0xef/0x370
>>> [    2.731132]  gntdev_mmap+0x153/0x30e [xen_gntdev]
>>> [    2.731139]  mmap_region+0x3d9/0x660
>>> [    2.731146]  do_mmap+0x372/0x520
>>> [    2.731153]  vm_mmap_pgoff+0xd2/0x120
>>> [    2.731160]  ksys_mmap_pgoff+0x1b8/0x270
>>> [    2.731167]  ? ksys_ioctl+0x60/0x90
>>> [    2.731174]  do_syscall_64+0x5b/0x180
>>> [    2.731182]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> [    2.731191] RIP: 0033:0x7bc5c03e8133
>>> [    2.731196] Code: 54 41 89 d4 55 48 89 fd 53 4c 89 cb 48 85 ff 74 =
56 49 89 d9 45 89 f8 45 89 f2 44 89 e2 4c 89 ee 48 89 ef b8 09 00 00 00 0=
f 05 <48> 3d 00 f0 ff ff 77 7d 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f
>>> [    2.731219] RSP: 002b:00007ffcbccc89b8 EFLAGS: 00000246 ORIG_RAX: =
0000000000000009
>>> [    2.731230] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007=
bc5c03e8133
>>> [    2.731243] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 00000=
00000000000
>>> [    2.731252] RBP: 0000000000000000 R08: 0000000000000007 R09: 00000=
00000000000
>>> [    2.731263] R10: 0000000000000001 R11: 0000000000000246 R12: 00000=
00000000003
>>> [    2.731273] R13: 0000000000001000 R14: 0000000000000001 R15: 00000=
00000000007
>>> [    2.731284] Modules linked in: xen_netback u2mfn(O) xen_gntdev xen=
_gntalloc xen_blkback xen_evtchn parport_pc ppdev xenfs xen_privcmd lp pa=
rport ip_tables xen_netfront xen_blkfront crc32c_intel
>>> [    2.731309] CR2: 00000000000003b0
>>> [    2.731315] fbcon: Taking over console
>>> [    2.731321] ---[ end trace 5ec57aa3f3a40247 ]---
>>> [    2.731329] RIP: 0010:mmu_interval_read_begin+0x24/0xc0
>>> [    2.731336] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 fc =
55 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8b 4=
7 38 <48> 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b 64
>>> [    2.731358] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
>>> [    2.731365] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 00000=
00000000000
>>> [    2.731375] RDX: ffff8a4ef53add00 RSI: 0000000000000000 RDI: ffff8=
a4e94712500
>>> [    2.731385] RBP: ffff8a4e0bf7a640 R08: 00007bc5c0573000 R09: 00000=
00000000008
>>> [    2.731395] R10: ffff8a4ec756c190 R11: 00007bc5c05a2000 R12: ffff8=
a4e94712500
>>> [    2.731405] R13: ffff8a4ed3ab9d50 R14: 0000000000000000 R15: 00000=
00000000001
>>> [    2.731415] FS:  00007bc5c00dc7c0(0000) GS:ffff8a4ef5d00000(0000) =
knlGS:0000000000000000
>>> [    2.731427] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [    2.731436] CR2: 00000000000003b0 CR3: 000000008148e004 CR4: 00000=
000003606e0
>>> [    2.731446] Kernel panic - not syncing: Fatal exception
>>> [    2.731527] Kernel Offset: 0x2a000000 from 0xffffffff81000000 (rel=
ocation range: 0xffffffff80000000-0xffffffffbfffffff)
>>>
>>> --
>>>   i.
>>>
>>> _______________________________________________
>>> Xen-devel mailing list
>>> Xen-devel@lists.xenproject.org
>>> https://lists.xenproject.org/mailman/listinfo/xen-devel
>>>
>>
>> _______________________________________________
>> Xen-devel mailing list
>> Xen-devel@lists.xenproject.org
>> https://lists.xenproject.org/mailman/listinfo/xen-devel
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel


--------------F94AA9BE90BF735764B8F8F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/27/20 4:37 PM, Marek
      Marczykowski-Górecki wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200127213722.GC2995@mail-itl">
      <pre class="moz-quote-pre" wrap="">On Mon, Jan 27, 2020 at 03:45:11PM +0100, Jürgen Groß wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 27.01.20 14:16, Ilpo Järvinen wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi,

I've noted that 5.5-rcs and now 5.5-based kernel fails to boot in VM.
5.4 based kernels worked fine and there seems to have been some changes in
drivers/xen post-5.4 so perhaps they broke something?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I can't reproduce your problem. Just booted a VM with kernel 5.5 as
PV- and as HVM-guest without any problems.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It looks like an issue with gntdev driver, so reproducing it require any
userspace that actually makes use of it. Any idea what recent change
could cause that?

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Loading Linux 5.5.0-accecn30 ...

.[5;22H      [ initrd.img-5.5.0-acc  16.52MiB  100%  10.23MiB/s ].[5;1HSetting up swapspace version 1, size = 1073737728 bytes
/dev/xvda3: clean, 852118/1294896 files, 3076785/5190907 blocks
[    2.730931] BUG: kernel NULL pointer dereference, address: 00000000000003b0
[    2.730959] #PF: supervisor read access in kernel mode
[    2.730966] #PF: error_code(0x0000) - not-present page
[    2.730973] PGD 0 P4D 0
[    2.730978] Oops: 0000 [#1] SMP PTI
[    2.730985] CPU: 1 PID: 402 Comm: qubesdb-daemon Tainted: G           O      5.5.0-accecn30 #31
[    2.731000] RIP: 0010:mmu_interval_read_begin+0x24/0xc0</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    <br>
    <br>
    <br>
    This looks like it could well be
    d3eeb1d77c5d0af9df442db63722928238310a86. Can you revert it and see
    if it makes a difference?<br>
    <br>
    (+Jason)<br>
    <br>
    -boris<br>
    <br>
    <br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20200127213722.GC2995@mail-itl">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
[    2.731008] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 fc 55 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8b 47 38 &lt;48&gt; 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b 64
[    2.731030] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
[    2.731037] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 0000000000000000
[    2.731047] RDX: ffff8a4ef53add00 RSI: 0000000000000000 RDI: ffff8a4e94712500
[    2.731057] RBP: ffff8a4e0bf7a640 R08: 00007bc5c0573000 R09: 0000000000000008
[    2.731066] R10: ffff8a4ec756c190 R11: 00007bc5c05a2000 R12: ffff8a4e94712500
[    2.731076] R13: ffff8a4ed3ab9d50 R14: 0000000000000000 R15: 0000000000000001
[    2.731086] FS:  00007bc5c00dc7c0(0000) GS:ffff8a4ef5d00000(0000) knlGS:0000000000000000
[    2.731097] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.731105] CR2: 00000000000003b0 CR3: 000000008148e004 CR4: 00000000003606e0
[    2.731116] Call Trace:
[    2.731123]  ? vma_merge+0xef/0x370
[    2.731132]  gntdev_mmap+0x153/0x30e [xen_gntdev]
[    2.731139]  mmap_region+0x3d9/0x660
[    2.731146]  do_mmap+0x372/0x520
[    2.731153]  vm_mmap_pgoff+0xd2/0x120
[    2.731160]  ksys_mmap_pgoff+0x1b8/0x270
[    2.731167]  ? ksys_ioctl+0x60/0x90
[    2.731174]  do_syscall_64+0x5b/0x180
[    2.731182]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    2.731191] RIP: 0033:0x7bc5c03e8133
[    2.731196] Code: 54 41 89 d4 55 48 89 fd 53 4c 89 cb 48 85 ff 74 56 49 89 d9 45 89 f8 45 89 f2 44 89 e2 4c 89 ee 48 89 ef b8 09 00 00 00 0f 05 &lt;48&gt; 3d 00 f0 ff ff 77 7d 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f
[    2.731219] RSP: 002b:00007ffcbccc89b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
[    2.731230] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007bc5c03e8133
[    2.731243] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 0000000000000000
[    2.731252] RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000000000000
[    2.731263] R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000003
[    2.731273] R13: 0000000000001000 R14: 0000000000000001 R15: 0000000000000007
[    2.731284] Modules linked in: xen_netback u2mfn(O) xen_gntdev xen_gntalloc xen_blkback xen_evtchn parport_pc ppdev xenfs xen_privcmd lp parport ip_tables xen_netfront xen_blkfront crc32c_intel
[    2.731309] CR2: 00000000000003b0
[    2.731315] fbcon: Taking over console
[    2.731321] ---[ end trace 5ec57aa3f3a40247 ]---
[    2.731329] RIP: 0010:mmu_interval_read_begin+0x24/0xc0
[    2.731336] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 fc 55 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8b 47 38 &lt;48&gt; 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b 64
[    2.731358] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
[    2.731365] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 0000000000000000
[    2.731375] RDX: ffff8a4ef53add00 RSI: 0000000000000000 RDI: ffff8a4e94712500
[    2.731385] RBP: ffff8a4e0bf7a640 R08: 00007bc5c0573000 R09: 0000000000000008
[    2.731395] R10: ffff8a4ec756c190 R11: 00007bc5c05a2000 R12: ffff8a4e94712500
[    2.731405] R13: ffff8a4ed3ab9d50 R14: 0000000000000000 R15: 0000000000000001
[    2.731415] FS:  00007bc5c00dc7c0(0000) GS:ffff8a4ef5d00000(0000) knlGS:0000000000000000
[    2.731427] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.731436] CR2: 00000000000003b0 CR3: 000000008148e004 CR4: 00000000003606e0
[    2.731446] Kernel panic - not syncing: Fatal exception
[    2.731527] Kernel Offset: 0x2a000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

--
  i.

_______________________________________________
Xen-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.xenproject.org/mailman/listinfo/xen-devel">https://lists.xenproject.org/mailman/listinfo/xen-devel</a>

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

_______________________________________________
Xen-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.xenproject.org/mailman/listinfo/xen-devel">https://lists.xenproject.org/mailman/listinfo/xen-devel</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
Xen-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.xenproject.org/mailman/listinfo/xen-devel">https://lists.xenproject.org/mailman/listinfo/xen-devel</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F94AA9BE90BF735764B8F8F9--


--===============0847949493711425214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0847949493711425214==--

