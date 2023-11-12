Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7938F7E969A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 07:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631211.984526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Q5D-00032q-Nk; Mon, 13 Nov 2023 06:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631211.984526; Mon, 13 Nov 2023 06:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Q5D-00031C-Ks; Mon, 13 Nov 2023 06:06:03 +0000
Received: by outflank-mailman (input) for mailman id 631211;
 Sun, 12 Nov 2023 20:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfMF=GZ=gmail.com=jimmylee4930@srs-se1.protection.inumbo.net>)
 id 1r2H4f-0002nE-Jz
 for xen-devel@lists.xenproject.org; Sun, 12 Nov 2023 20:28:53 +0000
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com
 [2607:f8b0:4864:20::1142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 178f1d27-819a-11ee-98da-6d05b1d4d9a1;
 Sun, 12 Nov 2023 21:28:52 +0100 (CET)
Received: by mail-yw1-x1142.google.com with SMTP id
 00721157ae682-5b3b17d36d5so39621967b3.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Nov 2023 12:28:52 -0800 (PST)
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
X-Inumbo-ID: 178f1d27-819a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820931; x=1700425731; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/bZ6JlDX2WiUn3FAhGNH+2q05nnJRn5fMsHYlnD6/As=;
        b=YdaBlGwUUZHFuBNXo6+vED0KVJ4p8UGYjxUgHjQx2ZVXLZM5bISVYo0ylVl4CJ5D/X
         hZkTyjj0Le/UD2dMBArFmqnfHAViRc3ABpGRfpSZZ2z9ppVU62GUlBxVflPalOvWxIl0
         0taNX5SMd8zH4wcZP1cHnm3oI7N/QupL2hRqvILmZLK6dibUte4j1yPiYYVKTYU6mac/
         Iokg+V4EtJ5tdcExJPNh0upBwY9S8pzXjN5HTqEDglbn5FoOEKxv1xmP+r5mXUoiqoXd
         b1AOumK3mDb+RWNWmXiAgn9dzu8jU8+/UdBBu7PenHxHrouR3HsC1y5ChsB9ax64VOAw
         wcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820931; x=1700425731;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bZ6JlDX2WiUn3FAhGNH+2q05nnJRn5fMsHYlnD6/As=;
        b=rLiQHuweky8bZ+YKQY7pymyQMJ/HxUzCJ31DPbmDoUTKx/sJUyEp/QGFe2jviTwZyt
         s2d9LskTD6yuycnFqQkqRwgtgorKbd04WsAg3EDqh0aFlT3/nX8tb9n0pE/Wi2IvhX5V
         Ex+W1e0HUSNZL/kT7Y3D6y11I0yxPn1u0rE683wGRzGDNFHf0M3l1qBwl/Eum1gFclgJ
         tpp3bdk+p2lCb/04xpbL8U3I0xMzz6AXCclGqtqeLTdlV1bFYO6qKRwb5iE3/9fbrwKr
         EDHLyVEEvMAlfiR2zawLgpFA35kJsB/8j3Hwa8ci9PcDKz+xrShP1tak9cpOpT9R3O7q
         986w==
X-Gm-Message-State: AOJu0YwfQqgMZccb8zaiNCqqsw62vVv7nA4ncsXXZL43QAqdBHBTzFDz
	VlvjHqrdGzjIF0iD0K6+Uui8g9+/O1Zh/IteLD3aKpFn4vMRmWmRJ1E=
X-Google-Smtp-Source: AGHT+IEIQdeOFCqy9xfoUGcEGvUMafPwMwzop8jFaHO9Vici/0Kxj1gFYA1ldfbB/u9YKejsBefBMPHZSA0C1XxNiU8=
X-Received: by 2002:a25:6ec1:0:b0:daf:18f9:2a3f with SMTP id
 j184-20020a256ec1000000b00daf18f92a3fmr4882862ybc.27.1699820930776; Sun, 12
 Nov 2023 12:28:50 -0800 (PST)
MIME-Version: 1.0
From: Jimmy Lee <jimmylee4930@gmail.com>
Date: Sun, 12 Nov 2023 12:28:40 -0800
Message-ID: <CAFyR2DVCuDyufB-EWHTSurQ69Dc7PZ9CQZdN_T-Ym2rjVaRPNw@mail.gmail.com>
Subject: Faking the number of CPUs for dom0 with dom0_max_vcpus
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c2c8fc0609fa66a0"

--000000000000c2c8fc0609fa66a0
Content-Type: text/plain; charset="UTF-8"

Hello Xen experts, I am trying to set dom0_max_vcpus to a number that is
larger than the number of pcpus. For example, I have a 4-CPU machine but I
want applications in dom0 to have an illusion that they are running on a
64-cpu machine. However, it seems that dom0 will always recognize the
number of pcpus. I can see the vcpus in the output of "xl vcpu-list" but
most of them are not online. How can I achieve my goal? Thanks!


Jimmy

[root@ip-10-0-131-61 cpu3]# xl vcpu-list
> Name                                ID  VCPU   CPU State   Time(s)
> Affinity (Hard / Soft)
> Domain-0                             0     0    0   r--      15.9  all /
> all
> Domain-0                             0     1    3   -b-      11.9  all /
> all
> Domain-0                             0     2    1   -b-      11.2  all /
> all
> Domain-0                             0     3    2   -b-      12.4  all /
> all
> Domain-0                             0     4    -   --p       0.0  all /
> all
> Domain-0                             0     5    -   --p       0.0  all /
> all
> Domain-0                             0     6    -   --p       0.0  all /
> all
> Domain-0                             0     7    -   --p       0.0  all /
> all
> Domain-0                             0     8    -   --p       0.0  all /
> all
> ....
>

[root@ip-10-0-131-61 cpu3]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    4
Core(s) per socket:    1
Socket(s):             1
NUMA node(s):          1
...

[root@ip-10-0-131-61 cpu3]# xl info
...
xen_commandline        : placeholder dom0_mem=3%,min:2G,max:4G
com1=115200,8n1 console=com1,tty,vga dom0_max_vcpus=64 spec-ctrl=no
sched=credit vcpu_migration_delay=1000 allowsuperpage ioapic_ack=new
...

--000000000000c2c8fc0609fa66a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGVsbG8gWGVuIGV4cGVydHMsIEkgYW0gdHJ5aW5nIHRvIHNldMKgZG9t
MF9tYXhfdmNwdXMgdG8gYSBudW1iZXIgdGhhdCBpcyBsYXJnZXIgdGhhbiB0aGUgbnVtYmVyIG9m
IHBjcHVzLiBGb3IgZXhhbXBsZSwgSSBoYXZlIGEgNC1DUFUgbWFjaGluZSBidXQgSSB3YW50IGFw
cGxpY2F0aW9ucyBpbiBkb20wIHRvIGhhdmUgYW4gaWxsdXNpb24gdGhhdCB0aGV5IGFyZSBydW5u
aW5nIG9uIGEgNjQtY3B1IG1hY2hpbmUuIEhvd2V2ZXIsIGl0IHNlZW1zIHRoYXQgZG9tMCB3aWxs
IGFsd2F5cyByZWNvZ25pemUgdGhlIG51bWJlciBvZiBwY3B1cy4gSSBjYW4gc2VlIHRoZSB2Y3B1
cyBpbiB0aGUgb3V0cHV0IG9mICZxdW90O3hsIHZjcHUtbGlzdCZxdW90OyBidXQgbW9zdCBvZiB0
aGVtIGFyZSBub3Qgb25saW5lLiBIb3cgY2FuIEkgYWNoaWV2ZSBteSBnb2FsPyBUaGFua3MhPGRp
dj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5KaW1teTxicj48ZGl2Pjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+PGZvbnQgZmFjZT0ibW9ub3NwYWNlIj5bcm9vdEBpcC0xMC0wLTEzMS02MSBjcHUzXSMg
eGwgdmNwdS1saXN0PGJyPk5hbWUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBJRCDCoFZDUFUgwqAgQ1BVIFN0YXRlIMKgIFRpbWUocykgQWZmaW5pdHkgKEhh
cmQgLyBTb2Z0KTxicj5Eb21haW4tMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAwIMKgIMKgIDAgwqAgwqAwIMKgIHItLSDCoCDCoCDCoDE1LjkgwqBhbGwgLyBhbGw8
YnI+RG9tYWluLTAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMCDC
oCDCoCAxIMKgIMKgMyDCoCAtYi0gwqAgwqAgwqAxMS45IMKgYWxsIC8gYWxsPGJyPkRvbWFpbi0w
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAgwqAgwqAgMiDCoCDC
oDEgwqAgLWItIMKgIMKgIMKgMTEuMiDCoGFsbCAvIGFsbDxicj5Eb21haW4tMCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwIMKgIMKgIDMgwqAgwqAyIMKgIC1iLSDC
oCDCoCDCoDEyLjQgwqBhbGwgLyBhbGw8YnI+RG9tYWluLTAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgMCDCoCDCoCA0IMKgIMKgLSDCoCAtLXAgwqAgwqAgwqAgMC4w
IMKgYWxsIC8gYWxsPGJyPkRvbWFpbi0wIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIDAgwqAgwqAgNSDCoCDCoC0gwqAgLS1wIMKgIMKgIMKgIDAuMCDCoGFsbCAvIGFs
bDxicj5Eb21haW4tMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
IMKgIMKgIDYgwqAgwqAtIMKgIC0tcCDCoCDCoCDCoCAwLjAgwqBhbGwgLyBhbGw8YnI+RG9tYWlu
LTAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMCDCoCDCoCA3IMKg
IMKgLSDCoCAtLXAgwqAgwqAgwqAgMC4wIMKgYWxsIC8gYWxsPGJyPkRvbWFpbi0wIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAgwqAgwqAgOCDCoCDCoC0gwqAgLS1w
IMKgIMKgIMKgIDAuMCDCoGFsbCAvIGFsbDxicj4uLi4uPC9mb250Pjxicj48L2Jsb2NrcXVvdGU+
PGRpdj48YnI+PC9kaXY+PGRpdj48Zm9udCBmYWNlPSJtb25vc3BhY2UiPltyb290QGlwLTEwLTAt
MTMxLTYxIGNwdTNdIyBsc2NwdTwvZm9udD48L2Rpdj48Zm9udCBmYWNlPSJtb25vc3BhY2UiPkFy
Y2hpdGVjdHVyZTogwqAgwqAgwqAgwqAgwqB4ODZfNjQ8YnI+Q1BVIG9wLW1vZGUocyk6IMKgIMKg
IMKgIMKgMzItYml0LCA2NC1iaXQ8YnI+Qnl0ZSBPcmRlcjogwqAgwqAgwqAgwqAgwqAgwqBMaXR0
bGUgRW5kaWFuPGJyPkNQVShzKTogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA0PGJyPk9uLWxpbmUg
Q1BVKHMpIGxpc3Q6IMKgIDAtMzxicj5UaHJlYWQocykgcGVyIGNvcmU6IMKgIMKgNDxicj5Db3Jl
KHMpIHBlciBzb2NrZXQ6IMKgIMKgMTxicj5Tb2NrZXQocyk6IMKgIMKgIMKgIMKgIMKgIMKgIDE8
YnI+TlVNQSBub2RlKHMpOiDCoCDCoCDCoCDCoCDCoDE8L2ZvbnQ+PGRpdj48Zm9udCBmYWNlPSJt
b25vc3BhY2UiPi4uLjwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSI+PGJy
PjwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSI+W3Jvb3RAaXAtMTAtMC0x
MzEtNjEgY3B1M10jIHhsIGluZm88YnI+PC9mb250PjxkaXY+PGZvbnQgZmFjZT0ibW9ub3NwYWNl
Ij4uLi48L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBmYWNlPSJtb25vc3BhY2UiPnhlbl9jb21tYW5k
bGluZSDCoCDCoCDCoCDCoDogcGxhY2Vob2xkZXIgZG9tMF9tZW09MyUsbWluOjJHLG1heDo0RyBj
b20xPTExNTIwMCw4bjEgY29uc29sZT1jb20xLHR0eSx2Z2EgZG9tMF9tYXhfdmNwdXM9NjQgc3Bl
Yy1jdHJsPW5vIHNjaGVkPWNyZWRpdCB2Y3B1X21pZ3JhdGlvbl9kZWxheT0xMDAwIGFsbG93c3Vw
ZXJwYWdlIGlvYXBpY19hY2s9bmV3PGJyPjwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGZhY2U9Im1v
bm9zcGFjZSI+Li4uPC9mb250PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGZvbnQgZmFjZT0ibW9ub3NwYWNlIj48YnI+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQg
ZmFjZT0ibW9ub3NwYWNlIj48YnI+PC9mb250PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--000000000000c2c8fc0609fa66a0--

