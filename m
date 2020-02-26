Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA216FBC4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:12:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6td6-0001NJ-BH; Wed, 26 Feb 2020 10:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6td5-0001NC-BM
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:09:23 +0000
X-Inumbo-ID: 0f4ae240-5880-11ea-a490-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f4ae240-5880-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582711762;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tdsIxZ6z8x+5pAUWFFGaTvd3GuCZPAKamtEZ1emSFQc=;
 b=Wdpg5+F+XsvmdsULQGEpMSB8pxMfJpeSM11M9UfHftLjpeLS9LYUjudZ
 yPJgAZYtZhStazZV+yhK6D/JN/qJfyYDU3PRd38DhFA8s0BW6Z9oRac+e
 JM1QcPIf2LNXVl5XbVBdtNYgc7RstG5VoIIPp/YrKuc1HwXu/k/SVSQwh g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y1wFpr1Br9E2p/Vsj/atSfFQn/lJPAEtP7SlYyPL7mnlqLHHkHWvVbDOACAwUD5BtJ1NQCpsSW
 HC/q1cDv6QYlN46psQ4nuwbk0kwkFmKNl0pKqyQGd7hP+fKRQX+bDV067OtSV5LzIFmSDtOjLY
 op4zGwJI6E6vr7E39ue2bpQGUm3FAgdpV0bM5TlM4NyI33RIQrP7hIb0zqv8ZIaUCA4Kl9jbz4
 Bp2ComvdTxcalYWiHn1LH3eOa9i9CfWY10APeXNTCAc+eleDPaIxUgamJ90yqxP/1HFvZ3CKGl
 DLQ=
X-SBRS: 2.7
X-MesageID: 13655066
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13655066"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
 <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1a869429-d7d5-242b-d19d-2fb6ad7cf8e9@citrix.com>
Date: Wed, 26 Feb 2020 10:09:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vPMU: don't blindly assume
 IA32_PERF_CAPABILITIES MSR exists
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
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, Wei Liu <wl@xen.org>, "Chen,
 Farrah" <farrah.chen@intel.com>, "Gao, Chao" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDIvMjAyMCAwOToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSnVzdCBsaWtlIFZNWCdl
cyBsYnJfdHN4X2ZpeHVwX2NoZWNrKCkgdGhlIHJlc3BlY3RpdmUgQ1BVSUQgYml0IHNob3VsZAo+
IGJlIGNvbnN1bHRlZCBmaXJzdC4KPgo+IFJlcG9ydGVkLWJ5OiBGYXJyYWggQ2hlbiA8ZmFycmFo
LmNoZW5AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
