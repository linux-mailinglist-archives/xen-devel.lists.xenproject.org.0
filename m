Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8F3495EB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101428.194047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCo-0007ho-BD; Thu, 25 Mar 2021 15:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101428.194047; Thu, 25 Mar 2021 15:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCo-0007h7-7U; Thu, 25 Mar 2021 15:47:30 +0000
Received: by outflank-mailman (input) for mailman id 101428;
 Thu, 25 Mar 2021 15:47:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cfrO=IX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lPSCm-0007aB-F1
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:47:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 952d8419-3a87-420f-82d7-35cd8feac7d2;
 Thu, 25 Mar 2021 15:47:20 +0000 (UTC)
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
X-Inumbo-ID: 952d8419-3a87-420f-82d7-35cd8feac7d2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616687240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KVilLDDb67bS7C+WpFITR7DzrixuVw3sneqjw7mFbUQ=;
  b=hHegj+/wCU7rlOgycuQKumcHc1FBmKM8FdVR0HzZ+D8EL12PjLIhCQwI
   x7imJ8J3kYObUWySw41Rt5KQ2FtGXl7hzWDjJUAxv+DcYKMMe0qt7ZFVi
   Vuhrwmlge9ZRruDfr2wvTnf6fJlbt8Cz5M0I2oGxu1cfNJB2hIwUXTRBy
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PKVjxGMoTsEq7h+zCQ56+IbED4T8sU/BznOzg72cOtaZG25T1U0OniYjTD/jvKFGMfSGNUyydj
 EQGmXKRT/2i3SIbgJo0TQvsDArCYOP16PTo55EHg58RjcqgaOJeUkDl/W609llUfgIC9/rL5uV
 4chN67h3f16cAxw17YPIQ7UxC2vcEODSKmcshxXGguAtV2Ly0/BodNAbo0FazrsJMEvuZs5Whe
 3QIYaVqdpADs7Sp8ylsphILyfXIiXCXF6grh4mWQdcCmFHdoj5eLUdlgKCllxPMomNkmn+ZUs4
 rMg=
X-SBRS: 5.1
X-MesageID: 40500441
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bY24YKP5zDb3qcBcTxP155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEqPoexPh3LRy5pQcOqrnYRn+tAKTXeVfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYdNi++HldtTAdLQboVfa
 DshfZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ9bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUqpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zUwIidDq0nkGup
 3hpAohItRS5hrqDx6IiCqo4SbM+nIP7GLv0lCRi3eLm72GeBsKT/BvqKgcVzmx0TtGgPhMlJ
 hl8kjcir9sSTTHpyj578igbWAQqmOE5UAMvMRWs2ZSSuIlGdlshL1axmx5OrEaEhn37Yg2ed
 Medv301bJtfVSWY2uxhBgX/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv5ks9yA==
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40500441"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: <xen-devel@lists.xenproject.org>, Jordan Justen
	<jordan.l.justen@intel.com>, Anthony PERARD <anthony.perard@citrix.com>, "Ard
 Biesheuvel" <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Julien Grall <julien@xen.org>, Liming Gao <liming.gao@intel.com>, Bob Feng
	<bob.c.feng@intel.com>, Michael D Kinney <michael.d.kinney@intel.com>,
	Zhiguang Liu <zhiguang.liu@intel.com>
Subject: [PATCH v2 2/7] MdePkg: Allow PcdFSBClock to by Dynamic
Date: Thu, 25 Mar 2021 15:47:08 +0000
Message-ID: <20210325154713.670104-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325154713.670104-1-anthony.perard@citrix.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2hhbmdlIHRoZSB2YWx1ZSBvZiBQY2RGU0JDbG9jayBh
dCBydW4gdGltZSBpbgpPdm1mWGVuLCBzbyBtb3ZlIGl0IHRvIHRoZSBQY2RzRHluYW1pYyBzZWN0
aW9uLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lk
PTI0OTAKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpSZXZp
ZXdlZC1ieTogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Ci0tLQpDQzogQm9iIEZl
bmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgpDQzogTWljaGFlbCBEIEtpbm5leSA8bWljaGFlbC5k
Lmtpbm5leUBpbnRlbC5jb20+CkNDOiBaaGlndWFuZyBMaXUgPHpoaWd1YW5nLmxpdUBpbnRlbC5j
b20+Ci0tLQogTWRlUGtnL01kZVBrZy5kZWMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01kZVBrZy9NZGVQ
a2cuZGVjIGIvTWRlUGtnL01kZVBrZy5kZWMKaW5kZXggMWQyNjM3YWNjMjJhLi5mMGQzYjkxZmM2
MzUgMTAwNjQ0Ci0tLSBhL01kZVBrZy9NZGVQa2cuZGVjCisrKyBiL01kZVBrZy9NZGVQa2cuZGVj
CkBAIC0yMjU3LDEwICsyMjU3LDYgQEAgW1BjZHNGaXhlZEF0QnVpbGQsUGNkc1BhdGNoYWJsZUlu
TW9kdWxlXQogICAjIEBWYWxpZExpc3QgIDB4ODAwMDAwMDEgfCA4LCAxNiwgMzINCiAgIGdFZmlN
ZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RQb3J0ODBEYXRhV2lkdGh8OHxVSU5UOHwweDAwMDAwMDJk
DQogDQotICAjIyBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gY29uZmlndXJlIFg4NiBQcm9jZXNzb3Ig
RlNCIGNsb2NrLg0KLSAgIyBAUHJvbXB0IEZTQiBDbG9jay4NCi0gIGdFZmlNZGVQa2dUb2tlblNw
YWNlR3VpZC5QY2RGU0JDbG9ja3wyMDAwMDAwMDB8VUlOVDMyfDB4MDAwMDAwMGMNCi0NCiAgICMj
IFRoZSBtYXhpbXVtIHByaW50YWJsZSBudW1iZXIgb2YgY2hhcmFjdGVycy4gVWVmTGliIGZ1bmN0
aW9uczogQXNjaWlQcmludCgpLCBBc2NpaUVycm9yUHJpbnQoKSwNCiAgICMgIFByaW50WFkoKSwg
QXNjaWlQcmludFhZKCksIFByaW50KCksIEVycm9yUHJpbnQoKSBiYXNlIG9uIHRoaXMgUENEIHZh
bHVlIHRvIHByaW50IGNoYXJhY3RlcnMuDQogICAjIEBQcm9tcHQgTWF4aW11bSBQcmludGFibGUg
TnVtYmVyIG9mIENoYXJhY3RlcnMuDQpAQCAtMjM2NCw1ICsyMzYwLDkgQEAgW1BjZHNGaXhlZEF0
QnVpbGQsIFBjZHNQYXRjaGFibGVJbk1vZHVsZSwgUGNkc0R5bmFtaWMsIFBjZHNEeW5hbWljRXhd
CiAgICMgQFByb21wdCBCb290IFRpbWVvdXQgKHMpDQogICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1
aWQuUGNkUGxhdGZvcm1Cb290VGltZU91dHwweGZmZmZ8VUlOVDE2fDB4MDAwMDAwMmMNCiANCisg
ICMjIFRoaXMgdmFsdWUgaXMgdXNlZCB0byBjb25maWd1cmUgWDg2IFByb2Nlc3NvciBGU0IgY2xv
Y2suDQorICAjIEBQcm9tcHQgRlNCIENsb2NrLg0KKyAgZ0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlk
LlBjZEZTQkNsb2NrfDIwMDAwMDAwMHxVSU5UMzJ8MHgwMDAwMDAwYw0KKw0KIFtVc2VyRXh0ZW5z
aW9ucy5UaWFub0NvcmUuIkV4dHJhRmlsZXMiXQ0KICAgTWRlUGtnRXh0cmEudW5pDQotLSAKQW50
aG9ueSBQRVJBUkQKCg==

