Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349942F7EE0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68239.122125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qdi-0006Xu-EG; Fri, 15 Jan 2021 15:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68239.122125; Fri, 15 Jan 2021 15:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qdi-0006XV-B2; Fri, 15 Jan 2021 15:03:50 +0000
Received: by outflank-mailman (input) for mailman id 68239;
 Fri, 15 Jan 2021 15:03:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjQ6=GS=bounce.vates.fr=bounce-md_30504962.6001aebe.v1-92ff45e39fc14decabe69ada6e8d7130@srs-us1.protection.inumbo.net>)
 id 1l0Qdg-0006XQ-JU
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:03:49 +0000
Received: from mail187-1.suw11.mandrillapp.com (unknown [198.2.187.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4823e9eb-3ace-489c-9666-cb1f1774448f;
 Fri, 15 Jan 2021 15:03:47 +0000 (UTC)
Received: from pmta01.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail187-1.suw11.mandrillapp.com id h06nd6174i4v for
 <xen-devel@lists.xenproject.org>;
 Fri, 15 Jan 2021 15:03:26 +0000 (envelope-from
 <bounce-md_30504962.6001aebe.v1-92ff45e39fc14decabe69ada6e8d7130@bounce.vates.fr>)
Received: from [185.78.159.90] by mandrillapp.com id
 92ff45e39fc14decabe69ada6e8d7130; Fri, 15 Jan 2021 15:03:26 +0000
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
X-Inumbo-ID: 4823e9eb-3ace-489c-9666-cb1f1774448f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=vates.fr;
 h=From:Subject:To:Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding; i=samuel.verschelde@vates.fr;
 bh=pEEtCL3JjBhA/0f/k2t99CCUvfcHxNK2ieq34zrxf3I=;
 b=WMgOCkWxBc4FkLtmYuk8RqN6uca9phFOeR7zyX1BM4lQIX8obhfMJDm94mIWQgygYDHlXtlaqPR3
   Hw6L3tQlrz29TgFdD6ySf7tNYG+/BYW+YEcXzZTWMhXca4DPf+mKYZ9iANVoktuFpJtLJaLukAGM
   Z1Gx6F3LB4+qBEHa9i8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1610723006; h=From : 
 Subject : To : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=pEEtCL3JjBhA/0f/k2t99CCUvfcHxNK2ieq34zrxf3I=; 
 b=a9Obdf6TRQ5hDcsuMC4r7MWlzDk/4in0UmvBK5kc35X1o+VxzOL6hka8fRM+FshgWYAjf9
 TQmAfAUwDYVLRTOXXIy+P9pC4DEhqCjvCD9A9BkxhsThBSo8FOsojFG1KFnFBQnUYR+hHuCD
 DMakEiJRloKew718usxH8v4TOpQn4=
From: Samuel Verschelde <samuel.verschelde@vates.fr>
Subject: XSA-332 kernel patch - huge network performance on pfSense VMs
X-Virus-Scanned: amavisd-new at vates.fr
To: xen-devel@lists.xenproject.org
Message-Id: <dc5d60d7-1ada-5eb1-ff91-495d663ca89e@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.92ff45e39fc14decabe69ada6e8d7130
X-Mandrill-User: md_30504962
Date: Fri, 15 Jan 2021 15:03:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi list,

Another "popular" thread on XCP-ng forum [1], started in october 2020, 
allowed us to detect that patch 12 from the XSA-332 advisory [2] had a 
very significant impact on network performance in the case of pfSense VMs.

We reproduced the issue internally (well, we reproduced "something". The 
user setups in this thread are diverse) and our findings seem to confirm 
what the users reported. Running iperf3 from the pfSense VM to a debian 
VM gives results around 5 times slower than before. Reverting this 
single patch brings the performance back. On the debian to pfSense 
direction, the drop is about 25%.

Testing environment:

Host
* XCP-ng 8.2
* kernel 4.19.19 + backports and sec fixes [3]
* Xen 4.13.1 + backports and sec fixes [4]

VM 1 - pfSense, HVM
VM 2 - debian, HVM
VM 3 - debian, HVM

All VMs running on the same host.

I can provide more details if needed.

Note: a user reported a performance drop between two windows VMs [5] and 
another when accessing DBF files across the network [6]. They didn't 
specify what the network setup was though. At least the second one 
confirmed reverting patch 12 solved his issues.


*** Test results, without reverting patch 12 ***

Debian to pfSense: ~1,20 Gbit/s, stable

root@samtest:~# iperf3 -c 10.0.90.1
Connecting to host 10.0.90.1, port 5201
[=C2=A0 5] local 10.0.90.2 port 58036 connected to 10.0.90.1 port 5201
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr=C2=A0 Cwnd
[=C2=A0 5]=C2=A0=C2=A0 0.00-1.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 100 MBytes=C2=
=A0=C2=A0 842 Mbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.22 MBytes
[=C2=A0 5]=C2=A0=C2=A0 1.00-2.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 148 MBytes=C2=
=A0 1.24 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.00 MBytes
[=C2=A0 5]=C2=A0=C2=A0 2.00-3.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 145 MBytes=C2=
=A0 1.22 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 3.00-4.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 144 MBytes=C2=
=A0 1.21 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 4.00-5.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 141 MBytes=C2=
=A0 1.18 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 5.00-6.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 150 MBytes=C2=
=A0 1.26 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 6.00-7.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 144 MBytes=C2=
=A0 1.21 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 7.00-8.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 132 MBytes=C2=
=A0 1.11 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 8.00-9.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 140 MBytes=C2=
=A0 1.17 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
[=C2=A0 5]=C2=A0=C2=A0 9.00-10.00=C2=A0 sec=C2=A0=C2=A0 142 MBytes=C2=A0 1.=
20 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 2.11 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 1.35 GBytes=C2=A0 1.16 Gb=
its/sec 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sender
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 1.35 GBytes=C2=A0 1.16 Gb=
its/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 
receiver

pfSense to Debian: catastrophic and not stable. We should have 2,2 
Gbit/s here.

root@samtest:~# iperf3 -c 10.0.90.1 -R
Connecting to host 10.0.90.1, port 5201
Reverse mode, remote host 10.0.90.1 is sending
[=C2=A0 5] local 10.0.90.2 port 58052 connected to 10.0.90.1 port 5201
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate
[=C2=A0 5]=C2=A0=C2=A0 0.00-1.00=C2=A0=C2=A0 sec=C2=A0 30.2 MBytes=C2=A0=C2=
=A0 254 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 1.00-2.00=C2=A0=C2=A0 sec=C2=A0 28.5 MBytes=C2=A0=C2=
=A0 239 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 2.00-3.00=C2=A0=C2=A0 sec=C2=A0 47.3 MBytes=C2=A0=C2=
=A0 397 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 3.00-4.00=C2=A0=C2=A0 sec=C2=A0 96.4 MBytes=C2=A0=C2=
=A0 809 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 4.00-5.00=C2=A0=C2=A0 sec=C2=A0 43.3 MBytes=C2=A0=C2=
=A0 363 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 5.00-6.00=C2=A0=C2=A0 sec=C2=A0 36.9 MBytes=C2=A0=C2=
=A0 310 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 6.00-7.00=C2=A0=C2=A0 sec=C2=A0 25.2 MBytes=C2=A0=C2=
=A0 211 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 7.00-8.00=C2=A0=C2=A0 sec=C2=A0 43.8 MBytes=C2=A0=C2=
=A0 368 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 8.00-9.00=C2=A0=C2=A0 sec=C2=A0 23.0 MBytes=C2=A0=C2=
=A0 193 Mbits/sec
[=C2=A0 5]=C2=A0=C2=A0 9.00-10.00=C2=A0 sec=C2=A0 17.0 MBytes=C2=A0=C2=A0 1=
43 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0=C2=A0 392 MBytes=C2=A0=C2=
=A0 329 Mbits/sec 112=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sender
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0=C2=A0 392 MBytes=C2=A0=C2=
=A0 329 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 
receiver

Debian to debian: 8,5 Gbit/s

root@samtest:~# iperf3 -c 10.0.90.3
Connecting to host 10.0.90.3, port 5201
[=C2=A0 5] local 10.0.90.2 port 39928 connected to 10.0.90.3 port 5201
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr=C2=A0 Cwnd
[=C2=A0 5]=C2=A0=C2=A0 0.00-1.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 963 MBytes=C2=
=A0 8.07 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 878 KBytes
[=C2=A0 5]=C2=A0=C2=A0 1.00-2.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 994 MBytes=C2=
=A0 8.34 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1014 KBytes
[=C2=A0 5]=C2=A0=C2=A0 2.00-3.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 969 MBytes=C2=
=A0 8.13 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.10 MBytes
[=C2=A0 5]=C2=A0=C2=A0 3.00-4.00=C2=A0=C2=A0 sec=C2=A0 1.02 GBytes=C2=A0 8.=
80 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.15 MBytes
[=C2=A0 5]=C2=A0=C2=A0 4.00-5.00=C2=A0=C2=A0 sec=C2=A0 1022 MBytes=C2=A0 8.=
58 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.21 MBytes
[=C2=A0 5]=C2=A0=C2=A0 5.00-6.00=C2=A0=C2=A0 sec=C2=A0 1012 MBytes=C2=A0 8.=
49 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.33 MBytes
[=C2=A0 5]=C2=A0=C2=A0 6.00-7.00=C2=A0=C2=A0 sec=C2=A0 1.01 GBytes=C2=A0 8.=
71 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.33 MBytes
[=C2=A0 5]=C2=A0=C2=A0 7.00-8.00=C2=A0=C2=A0 sec=C2=A0 1.05 GBytes=C2=A0 9.=
06 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.33 MBytes
[=C2=A0 5]=C2=A0=C2=A0 8.00-9.00=C2=A0=C2=A0 sec=C2=A0 1.02 GBytes=C2=A0 8.=
74 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.40 MBytes
[=C2=A0 5]=C2=A0=C2=A0 9.00-10.00=C2=A0 sec=C2=A0 1018 MBytes=C2=A0 8.54 Gb=
its/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.54 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 9.95 GBytes=C2=A0 8.54 Gb=
its/sec 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sender
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.04=C2=A0 sec=C2=A0 9.94 GBytes=C2=A0 8.51 Gb=
its/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 
receiver


*** Test results, after reverting patch 12 (only) ***

Debian to pfSense: better average perf, but there are big drops so it 
does not manage to stay at 2,2 Gbit/s.

root@samtest:~# iperf3 -c 10.0.90.1
Connecting to host 10.0.90.1, port 5201
[=C2=A0 5] local 10.0.90.2 port 46946 connected to 10.0.90.1 port 5201
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr=C2=A0 Cwnd
[=C2=A0 5]=C2=A0=C2=A0 0.00-1.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 237 MBytes=C2=
=A0 1.98 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.44 MBytes
[=C2=A0 5]=C2=A0=C2=A0 1.00-2.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 240 MBytes=C2=
=A0 2.01 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.52 MBytes
[=C2=A0 5]=C2=A0=C2=A0 2.00-3.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 260 MBytes=C2=
=A0 2.18 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.68 MBytes
[=C2=A0 5]=C2=A0=C2=A0 3.00-4.00=C2=A0=C2=A0 sec=C2=A0 36.2 MBytes=C2=A0=C2=
=A0 304 Mbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.68 MBytes
[=C2=A0 5]=C2=A0=C2=A0 4.00-5.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 115 MBytes=C2=
=A0=C2=A0 965 Mbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.68 MBytes
[=C2=A0 5]=C2=A0=C2=A0 5.00-6.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 255 MBytes=C2=
=A0 2.14 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.78 MBytes
[=C2=A0 5]=C2=A0=C2=A0 6.00-7.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 181 MBytes=C2=
=A0 1.52 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.78 MBytes
[=C2=A0 5]=C2=A0=C2=A0 7.00-8.00=C2=A0=C2=A0 sec=C2=A0 76.2 MBytes=C2=A0=C2=
=A0 640 Mbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.78 MBytes
[=C2=A0 5]=C2=A0=C2=A0 8.00-9.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 261 MBytes=C2=
=A0 2.19 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.78 MBytes
[=C2=A0 5]=C2=A0=C2=A0 9.00-10.00=C2=A0 sec=C2=A0=C2=A0 251 MBytes=C2=A0 2.=
11 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.88 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 1.87 GBytes=C2=A0 1.60 Gb=
its/sec 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sender
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 1.87 GBytes=C2=A0 1.60 Gb=
its/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 
receiver

pfSense to Debian: back to stable 2,2 Gbit/s

root@samtest:~# iperf3 -c 10.0.90.1 -R
Connecting to host 10.0.90.1, port 5201
Reverse mode, remote host 10.0.90.1 is sending
[=C2=A0 5] local 10.0.90.2 port 46954 connected to 10.0.90.1 port 5201
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate
[=C2=A0 5]=C2=A0=C2=A0 0.00-1.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 238 MBytes=C2=
=A0 2.00 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 1.00-2.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 239 MBytes=C2=
=A0 2.01 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 2.00-3.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 252 MBytes=C2=
=A0 2.11 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 3.00-4.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 256 MBytes=C2=
=A0 2.15 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 4.00-5.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 263 MBytes=C2=
=A0 2.20 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 5.00-6.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 255 MBytes=C2=
=A0 2.14 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 6.00-7.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 265 MBytes=C2=
=A0 2.22 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 7.00-8.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 266 MBytes=C2=
=A0 2.23 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 8.00-9.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 262 MBytes=C2=
=A0 2.20 Gbits/sec
[=C2=A0 5]=C2=A0=C2=A0 9.00-10.00=C2=A0 sec=C2=A0=C2=A0 273 MBytes=C2=A0 2.=
29 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 2.51 GBytes=C2=A0 2.16 Gb=
its/sec 123=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sender
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 2.51 GBytes=C2=A0 2.16 Gb=
its/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 
receiver

Debian to debian : no differences.

root@samtest:~# iperf3 -c 10.0.90.3
iperf3: error - unable to connect to server: Connection refused
root@samtest:~# iperf3 -c 10.0.90.3
Connecting to host 10.0.90.3, port 5201
[=C2=A0 5] local 10.0.90.2 port 59498 connected to 10.0.90.3 port 5201
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr=C2=A0 Cwnd
[=C2=A0 5]=C2=A0=C2=A0 0.00-1.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 982 MBytes=C2=
=A0 8.23 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 779 KBytes
[=C2=A0 5]=C2=A0=C2=A0 1.00-2.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 982 MBytes=C2=
=A0 8.24 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 904 KBytes
[=C2=A0 5]=C2=A0=C2=A0 2.00-3.00=C2=A0=C2=A0 sec=C2=A0 1.01 GBytes=C2=A0 8.=
65 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 904 KBytes
[=C2=A0 5]=C2=A0=C2=A0 3.00-4.00=C2=A0=C2=A0 sec=C2=A0 1.03 GBytes=C2=A0 8.=
85 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.07 MBytes
[=C2=A0 5]=C2=A0=C2=A0 4.00-5.00=C2=A0=C2=A0 sec=C2=A0 1022 MBytes=C2=A0 8.=
58 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.13 MBytes
[=C2=A0 5]=C2=A0=C2=A0 5.00-6.00=C2=A0=C2=A0 sec=C2=A0 1.01 GBytes=C2=A0 8.=
69 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.13 MBytes
[=C2=A0 5]=C2=A0=C2=A0 6.00-7.00=C2=A0=C2=A0 sec=C2=A0=C2=A0 988 MBytes=C2=
=A0 8.28 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.31 MBytes
[=C2=A0 5]=C2=A0=C2=A0 7.00-8.00=C2=A0=C2=A0 sec=C2=A0 1.01 GBytes=C2=A0 8.=
64 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.31 MBytes
[=C2=A0 5]=C2=A0=C2=A0 8.00-9.00=C2=A0=C2=A0 sec=C2=A0 1.01 GBytes=C2=A0 8.=
70 Gbits/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.38 MBytes
[=C2=A0 5]=C2=A0=C2=A0 9.00-10.00=C2=A0 sec=C2=A0 1000 MBytes=C2=A0 8.39 Gb=
its/sec=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 1.52 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bitrate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Retr
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.00=C2=A0 sec=C2=A0 9.93 GBytes=C2=A0 8.53 Gb=
its/sec 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sender
[=C2=A0 5]=C2=A0=C2=A0 0.00-10.04=C2=A0 sec=C2=A0 9.92 GBytes=C2=A0 8.49 Gb=
its/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 
receiver


Best regards,

Samuel Verschelde

[1] 
https://xcp-ng.org/forum/topic/3774/poor-pfsense-wan-speeds-after-xcp-ng-up=
dates
[2] http://xenbits.xen.org/xsa/xsa332-linux-12.patch
[3] https://github.com/xcp-ng-rpms/kernel/tree/8.2
[4] https://github.com/xcp-ng-rpms/xen/tree/8.2
[5] https://xcp-ng.org/forum/post/33264
[6] https://xcp-ng.org/forum/post/33268


