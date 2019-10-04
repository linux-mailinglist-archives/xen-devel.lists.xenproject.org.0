Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA790CC246
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 20:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRql-0001dt-2V; Fri, 04 Oct 2019 17:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jBs=X5=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1iGRqj-0001dk-DG
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:58:41 +0000
X-Inumbo-ID: 97822638-e6d0-11e9-975f-12813bfff9fa
Received: from UPDC19PA21.eemsg.mail.mil (unknown [214.24.27.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97822638-e6d0-11e9-975f-12813bfff9fa;
 Fri, 04 Oct 2019 17:58:40 +0000 (UTC)
X-EEMSG-check-017: 19910134|UPDC19PA21_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.67,257,1566864000"; d="scan'208";a="19910134"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by UPDC19PA21.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 04 Oct 2019 17:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1570211918; x=1601747918;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tLOF0x7OBi88pZW1IULuERN4j1emCFy1tjMBKqtDeLo=;
 b=e9Oxbj8k+06QqpwQD1AL2FqL4FIjOadmXk0+TgaxfNIh7H/D0UoQDLuw
 y9MqiL9c96gQBEZwGC2X37HFJGtZ4RlmVYi/elDmjrgEHjJ6LFpu+rf95
 ZuA+CA77sewYhEC7wIs1MTR5GDdyNBM3lDOu7kOw+EHfTIzP/gN7NFw3E
 8IG0UBzZ4yJ9cWHuJR4+5JZK8y6VNheOXkFqWSYCWGzULdKoToiAEwR7w
 nZNWrwh4/TutH8DZqIjiRngsaY3XSRT4ikRzOXJht8zoXgX/5SB2ZDvtk
 PQc5896qgr83f86ZnDwSvv0knPVAtGdY5Vrr7J3KszFbjiSYg+UxfDUZ/ Q==;
X-IronPort-AV: E=Sophos;i="5.67,257,1566864000"; d="scan'208";a="33774752"
IronPort-PHdr: =?us-ascii?q?9a23=3AnIRnqBA1FGwBkj+NkUUwUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP37psSwAkXT6L1XgUPTWs2DsrQY0rGQ7vmrADVZqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmsrQjdq8YajZZ/Jqos1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMOiUn+2/LlMN/kKNboAqgpxNhxY7UfJqVP+d6cq/EYN8WWX?=
 =?us-ascii?q?ZNUsNXWiNPGIO8a5YEAfQHM+hWsoLxo0ICoBW6CAWpAu7k1z1GiWLs3aAizu?=
 =?us-ascii?q?ovDw/G0gwnH9wNvnrbotr6O6UOXu6616TI0TfOYulK1Tvh5oXFcBYsquyMU7?=
 =?us-ascii?q?JqdsrRzFEiGQ3fgVWWqIzqITeV3fkDvWeF8uFuVPivhHQ9pAF/vzOiwdojio?=
 =?us-ascii?q?bUiY0LxVDE7z92zZ0pJdy4VEF7YdmkHIFWtyGBLYR6WMwiQ2Z2uCsjzLANpJ?=
 =?us-ascii?q?21fDASxZg6yBPSZOaLfoiV7h75SuqcLil0iGh4dL+5mh2861KvyvfmWcmxyF?=
 =?us-ascii?q?tKqy1FncTSuX0VzBzT79SHSuN6/ke8xTaDzwDT5f9AIUAzjafbN4QuwqQxlp?=
 =?us-ascii?q?oOqkTPBDP2mUXqg6+WcUUo4O6o5Pj8Yrr6vJOcMo50igXmPqQvnMywH/g4Px?=
 =?us-ascii?q?ATU2WU9umwzr3u8VDjTLlUgfA6jLPVvI3CKcQevKG5AgtV0og56xa4CjeryM?=
 =?us-ascii?q?kXnXYaI11bdxKHlZLmNkrSIPH4Efi/g1OsnC1tx/DdJLLtGJrNLn/dkLv5Z7?=
 =?us-ascii?q?Zy91ZcyBYvzdBY/59UCKwBIPbyWkDvstzUFBA5MxauzObjDNVwzZkRWXiKAq?=
 =?us-ascii?q?ODLKzStlqI7Po1I+aQfI8VpCr9K/896v/hk3A5n0YRcrS30psJdn+4Gu9rI0?=
 =?us-ascii?q?GYYXr3ntcBCn0GvwUgQ+zskF2CSzlTZ3SsUK0g+jE3EoWmDZ3MRoq1mryOwD?=
 =?us-ascii?q?+7HoFKZmBBEl2ME3jod5+DW/cXcyKfOdRhkiEfVbe/UYMuyRautAriwbp9Mu?=
 =?us-ascii?q?XU4jEYtY7k1NVt/+3cjwwy9ThvAsWSzW6NSXt4nmQSRz85j+hDphlf11OC3K?=
 =?us-ascii?q?4wrOZREdgbs/FUVgY3M9jT1eV+D/j7QAeHddCMHhLuUtigRD08UN8169sPeF?=
 =?us-ascii?q?pmXcWviAjZ2CinCKNTkKaEV7Iu9aeJ83H3Jst5g1rLnIY7hlAoCp9DOmGrib?=
 =?us-ascii?q?R23xTCDI7O1UOCnuClcrpKj32Fz3uK0Wfb5BIQawV3S6iQGClEN0Y=3D?=
X-IPAS-Result: =?us-ascii?q?A2CbBADyhpdd/wHyM5BmHAEBAQQBAQwEAQGBZ4F0KoFAM?=
 =?us-ascii?q?iqEIpBKJZsiCQEBAQEBAQEBATQBAgEBhEACgkcjOBMCDAEBAQQBAQEBAQUDA?=
 =?us-ascii?q?QFshTmCOikBgmgBBSMVQRALGAICJgICVwYBDAYCAQGCXz+CC69bgTKFTYMvg?=
 =?us-ascii?q?UiBDCiMDhIGgX+BEScMgl8+h1GCWASWIZcXgi2VEgYbgiqXFi2EDIlym0Iig?=
 =?us-ascii?q?VgrChgpD4MnUBAUggeOKiUDMIEGAQGQZwEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 04 Oct 2019 17:58:37 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x94HwaX0024655; Fri, 4 Oct 2019 13:58:36 -0400
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20191004164243.30822-1-julien.grall@arm.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Organization: National Security Agency
Message-ID: <d148b549-ee2c-5279-0395-b2e7edf24b5c@tycho.nsa.gov>
Date: Fri, 4 Oct 2019 13:58:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191004164243.30822-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
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
Cc: jgross@suse.com, paul@xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvNC8xOSAxMjo0MiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGZsYXNrX2Fzc2lnbl97
LCBkdH1kZXZpY2UoKSBtYXkgYmUgdXNlZCB0byBjaGVjayB3aGV0aGVyIHlvdSBjYW4gdGVzdCBp
Zgo+IGEgZGV2aWNlIGlzIGFzc2lnbmVkLiBJbiB0aGlzIGNhc2UsIHRoZSBkb21haW4gd2lsbCBi
ZSBOVUxMLgo+IAo+IEhvd2V2ZXIsIGZsYXNrX2lvbW11X3Jlc291cmNlX3VzZV9wZXJtKCkgd2ls
bCBiZSBjYWxsZWQgYW5kIG1heSBlbmQgdXAKPiB0byBkZWZlcmVuY2UgYSBOVUxMIHBvaW50ZXIu
IFRoaXMgY2FuIGJlIHByZXZlbnRlZCBieSBtb3ZpbmcgdGhlIGNhbGwKPiBhZnRlciB3ZSBjaGVj
ayB0aGUgdmFsaWRpdHkgZm9yIHRoZSBkb21haW4gcG9pbnRlci4KPiAKPiBDb3Zlcml0eS1JRDog
MTQ4Njc0MQo+IEZpeGVzOiA3MWU2MTdhNmI4ICgndXNlIGlzX2lvbW11X2VuYWJsZWQoKSB3aGVy
ZSBhcHByb3ByaWF0ZS4uLicpCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8u
bnNhLmdvdj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
