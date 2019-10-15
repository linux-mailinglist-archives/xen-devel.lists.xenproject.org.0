Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61C9D8247
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 23:38:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKUTe-0006f5-Bj; Tue, 15 Oct 2019 21:35:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4d0t=YI=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1iKUTd-0006f0-30
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 21:35:33 +0000
X-Inumbo-ID: b5e61242-ef93-11e9-93a2-12813bfff9fa
Received: from asav21.altibox.net (unknown [109.247.116.8])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5e61242-ef93-11e9-93a2-12813bfff9fa;
 Tue, 15 Oct 2019 21:35:30 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no
 (148-252-118.41.3p.ntebredband.no [148.252.118.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id CEBEA800B2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 23:35:29 +0200 (CEST)
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 5E3C8624E80B
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 23:35:29 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id 32C432410674
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 23:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alstadheim.priv.no;
 s=smtp; t=1571175329;
 bh=V7LVaMALlpwLuBvs2XN7xsjt25G4+52a/aPB/cItInQ=;
 h=To:From:Subject:Date:From;
 b=MZcI2a4PgFsVuS5rHvrbLBAdMwNDG3gt+W03HlWni1Z6ACxZNsr9JEm6Nxj0Guoa6
 N51tLZjFaG5N4tCUI3/a3dTrpO1GBGdmWM72K8pOZuCOnAkmHosGqGxjNkdP/QTV5l
 YGCngTtSdQMbhcLSMDYfJ3QlTHPMZh9HTSSYbPA0=
To: xen-devel@lists.xenproject.org
From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Message-ID: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
Date: Tue, 15 Oct 2019 23:35:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=d8DbNyrE c=1 sm=1 tr=0
 a=qndhj//pCErt3rr+x0O3mA==:117 a=qndhj//pCErt3rr+x0O3mA==:17
 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=M51BFTxLslgA:10
 a=_iPA-etNg5h_H__ioZUA:9 a=w-qan2LXgLDAo1xK:21 a=QEXdDO2ut3YA:10
Subject: [Xen-devel] [BUG] Invalid guest state in Xen master,
 dom0 linux-5.3.6, domU windows 10
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R290IHRoaXMganVzdCBub3csIGFzIG15IHdpbmRvd3MgZG9tVSBkaWVkOgoKKFhFTikgWzIwMTkt
MTAtMTUgMjE6MjM6NDRdIGQ3djAgdm1lbnRyeSBmYWlsdXJlIChyZWFzb24gMHg4MDAwMDAyMSk6
IApJbnZhbGlkIGd1ZXN0IHN0YXRlICgwKQooWEVOKSBbMjAxOS0xMC0xNSAyMToyMzo0NF0gKioq
KioqKioqKioqKiBWTUNTIEFyZWEgKioqKioqKioqKioqKioKKFhFTikgWzIwMTktMTAtMTUgMjE6
MjM6NDRdICoqKiBHdWVzdCBTdGF0ZSAqKioKKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRdIENS
MDogYWN0dWFsPTB4MDAwMDAwMDA4MDA1MDAzMSwgCnNoYWRvdz0weDAwMDAwMDAwODAwNTAwMzEs
IGdoX21hc2s9ZmZmZmZmZmZmZmZmZmZmZgooWEVOKSBbMjAxOS0xMC0xNSAyMToyMzo0NF0gQ1I0
OiBhY3R1YWw9MHgwMDAwMDAwMDAwMTcyNjc4LCAKc2hhZG93PTB4MDAwMDAwMDAwMDE3MDY3OCwg
Z2hfbWFzaz1mZmZmZmZmZmZmZThmODYwCihYRU4pIFsyMDE5LTEwLTE1IDIxOjIzOjQ0XSBDUjMg
PSAweDAwMDAwMDAwMDAxYWEwMDIKKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRdIFJTUCA9IDB4
ZmZmZjkwOGU0NDBmYWU2OCAKKDB4ZmZmZjkwOGU0NDBmYWU2OCnCoCBSSVAgPSAweGZmZmY5NTgx
ZTE1ZDU2MGIgKDB4ZmZmZjk1ODFlMTVkNTYwYikKKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRd
IFJGTEFHUz0weDAwMDAwMTk3ICgweDAwMDAwMTk3KcKgIERSNyA9IAoweDAwMDAwMDAwMDAwMDA0
MDAKKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRdIFN5c2VudGVyIFJTUD0wMDAwMDAwMDAwMDAw
MDAwIApDUzpSSVA9MDAwMDowMDAwMDAwMDAwMDAwMDAwCihYRU4pIFsyMDE5LTEwLTE1IDIxOjIz
OjQ0XcKgwqDCoMKgwqDCoMKgIHNlbMKgIGF0dHLCoCBsaW1pdMKgwqAgYmFzZQooWEVOKSBbMjAx
OS0xMC0xNSAyMToyMzo1Nl0gcHJpbnRrOiA1MiBtZXNzYWdlcyBzdXBwcmVzc2VkLgooWEVOKSBb
MjAxOS0xMC0xNSAyMToyMzo1Nl0gW1ZULURdZDc6UENJZTogdW5tYXAgMDAwMDo4MTowMC4wCihY
RU4pIFsyMDE5LTEwLTE1IDIxOjIzOjU2XSBbVlQtRF1kMDpQQ0llOiBtYXAgMDAwMDo4MTowMC4w
CihYRU4pIFsyMDE5LTEwLTE1IDIxOjIzOjU5XSBwcmludGs6IDIgbWVzc2FnZXMgc3VwcHJlc3Nl
ZC4KKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NTldIFtWVC1EXWQ3OlBDSWU6IHVubWFwIDAwMDA6
MDI6MDAuMAoKIMKgIyB4bCBpbmZvCmhvc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOiBnZW50b28KcmVsZWFzZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IDUu
My42LWdlbnRvby1yMQp2ZXJzaW9uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIzIg
U01QIFNhdCBPY3QgMTIgMTM6NDg6MDAgQ0VTVCAyMDE5Cm1hY2hpbmXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgOiB4ODZfNjQKbnJfY3B1c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA6IDEyCm1heF9jcHVfaWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAxMQpucl9ub2Rl
c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAyCmNvcmVzX3Blcl9zb2NrZXTCoMKgwqDC
oMKgwqAgOiA2CnRocmVhZHNfcGVyX2NvcmXCoMKgwqDCoMKgwqAgOiAxCmNwdV9taHrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAyNDcxLjk3Mwpod19jYXBzwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDogCmJmZWJmYmZmOjc3ZmVmM2ZmOjJjMTAwODAwOjAwMDAwMDIxOjAw
MDAwMDAxOjAwMDAzN2FiOjAwMDAwMDAwOjAwMDAwMTAwCnZpcnRfY2Fwc8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDogcHYgaHZtIGh2bV9kaXJlY3RpbyBwdl9kaXJlY3RpbyBoYXAgc2hhZG93
IAppb21tdV9oYXBfcHRfc2hhcmUKdG90YWxfbWVtb3J5wqDCoMKgwqDCoMKgwqDCoMKgwqAgOiA2
NTM3NgpmcmVlX21lbW9yecKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAxMjk5NgpzaGFyaW5nX2Zy
ZWVkX21lbW9yecKgwqAgOiAwCnNoYXJpbmdfdXNlZF9tZW1vcnnCoMKgwqAgOiAwCm91dHN0YW5k
aW5nX2NsYWltc8KgwqDCoMKgIDogMApmcmVlX2NwdXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA6IDAKeGVuX21ham9ywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiA0Cnhlbl9taW5vcsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogMTMKeGVuX2V4dHJhwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgOiAtdW5zdGFibGUKeGVuX3ZlcnNpb27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDog
NC4xMy11bnN0YWJsZQp4ZW5fY2Fwc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiB4ZW4t
My4wLXg4Nl82NCB4ZW4tMy4wLXg4Nl8zMnAgaHZtLTMuMC14ODZfMzIgCmh2bS0zLjAteDg2XzMy
cCBodm0tMy4wLXg4Nl82NAp4ZW5fc2NoZWR1bGVywqDCoMKgwqDCoMKgwqDCoMKgIDogY3JlZGl0
Mgp4ZW5fcGFnZXNpemXCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IDQwOTYKcGxhdGZvcm1fcGFyYW1z
wqDCoMKgwqDCoMKgwqAgOiB2aXJ0X3N0YXJ0PTB4ZmZmZjgwMDAwMDAwMDAwMAp4ZW5fY2hhbmdl
c2V0wqDCoMKgwqDCoMKgwqDCoMKgIDoKeGVuX2NvbW1hbmRsaW5lwqDCoMKgwqDCoMKgwqAgOiB4
ZW4uY2ZnIHhlbi1tYXJrZXItMjE1IGNvbnNvbGVfdGltZXN0YW1wcz1kYXRlIAppb21tdT0xLGlu
dHBvc3QsdmVyYm9zZSxkZWJ1ZyBpb21tdV9pbmNsdXNpdmVfbWFwcGluZz0xIGNvbTE9NTc2MDAs
OG4xIApjb20yPTU3NjAwLDhuMSBjb25zb2xlPXZnYSxjb20yIGRvbTBfbWF4X3ZjcHVzPTggZG9t
MF9tZW09OEcsbWF4OjhHIApjcHVmcmVxPXhlbjpwZXJmb3JtYW5jZSx2ZXJib3NlIHNtdD0wIG1h
eGNwdXM9MTIgCmNvcmVfcGFya2luZz1wZXJmb3JtYW5jZSBubWk9ZG9tMCBnbnR0YWJfbWF4X2Zy
YW1lcz0yNTYgCmdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzPTEwMjQgdmNwdV9taWdyYXRpb25f
ZGVsYXk9MjAwMCAKdGlja2xlX29uZV9pZGxlX2NwdT0xIHNwZWMtY3RybD1uby14ZW4gc2NoZWQ9
Y3JlZGl0MiBtYXhfY3N0YXRlPTIgCmNsb2Nrc291cmNlPXRzYyB0c2M9c3RhYmxlOnNvY2tldCB0
aW1lcl9zbG9wPTUwMDAgbG9nbHZsPW5vbmUvd2FybmluZyAKZ3Vlc3RfbG9nbHZsPW5vbmUvd2Fy
bmluZwpjY19jb21waWxlcsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBnY2MgKEdlbnRvbyA4LjMu
MC1yMSBwMS4xKSA4LjMuMApjY19jb21waWxlX2J5wqDCoMKgwqDCoMKgwqDCoMKgIDogaGFrb24K
Y2NfY29tcGlsZV9kb21haW7CoMKgwqDCoMKgIDogYWxzdGFkaGVpbS5wcml2Lm5vCmNjX2NvbXBp
bGVfZGF0ZcKgwqDCoMKgwqDCoMKgIDogU3VuIE9jdCAxMyAxNjoxODowMSBDRVNUIDIwMTkKYnVp
bGRfaWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogYzY3ZTNhZWViOTEwZmNkMDZkZmU3
YmQzMWE5ZWI4MjAKeGVuZF9jb25maWdfZm9ybWF0wqDCoMKgwqAgOiA0Ci0tLS0tLS0tCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
