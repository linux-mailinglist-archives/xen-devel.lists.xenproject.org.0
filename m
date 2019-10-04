Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8ECC249
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 20:03:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRqH-0001Yu-ND; Fri, 04 Oct 2019 17:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jBs=X5=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1iGRqG-0001Yp-7u
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:58:12 +0000
X-Inumbo-ID: 85d7952e-e6d0-11e9-975f-12813bfff9fa
Received: from USAT19PA22.eemsg.mail.mil (unknown [214.24.22.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85d7952e-e6d0-11e9-975f-12813bfff9fa;
 Fri, 04 Oct 2019 17:58:10 +0000 (UTC)
X-EEMSG-check-017: 35698020|USAT19PA22_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.67,257,1566864000"; d="scan'208";a="35698020"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by USAT19PA22.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 04 Oct 2019 17:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1570211878; x=1601747878;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rH9e/z+r6ye3vHt1nGZH6N9lJd3r3TRyRYlhEtDDre8=;
 b=ozuyR+hxZ5JUp33BXPz1WAoyGXZl30znjjzY7QhriABiIPZuVYPq2J9c
 2/BNeg+Zhi1awj7xLoWsm3oUKndZYgIZ99+Efw1IfI8BgwBDjM8jAe/4J
 ncUK+YZ9ede052mHuh6/XwjKc6sRhes3eii4qtMkVYNDhXw7LkARoIJOS
 5lMB0wGlEeLJosRjsgYR16Zucwss8B5qE37SoQKJ0Mg0QvToOUKBAXNn2
 1Y5pMrnb9xEwZ2OSp/+F+HOOqhrPcprELBUBt70pteCLigLe5BEH3q0oF
 8wTCip6TU+wKiFjyCBNKxbHdN3S2QfzA2PuYhuza8JE7eBvZx/1htQFM4 g==;
X-IronPort-AV: E=Sophos;i="5.67,257,1566864000"; d="scan'208";a="28667917"
IronPort-PHdr: =?us-ascii?q?9a23=3AVftvzxCil6aB+owIZGmUUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPX8r8bcNUDSrc9gkEXOFd2Cra4d0KyL6uu5ADZIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfL1/IA+2oAnMucUanJZuJrgswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwKLCAy/n3JhcNsjaJbuBOhqAJ5w47Ie4GeKf5ycrrAcd8GWW?=
 =?us-ascii?q?ZNW8BcWCJbAoO4coABEewPM+hFpIX5vlcDox+zCQyqCejyyDFHm2X20LUn3e?=
 =?us-ascii?q?o/HwHI3AsgEdEAvnvao9r6NrsdX++uwanUzzjOde9a1Svz5YXKdB0qvPGCXa?=
 =?us-ascii?q?h3ccrU0UQhGRnKjlORqYP7OzOey+oDvHaG5ORhT+KgkXQoqw9sqTWo28gshZ?=
 =?us-ascii?q?TGiZwaylDe7yp025o1JN2kR057Zt6oCp1QtzqAOIdsTcMiRH9otT88x7Ybup?=
 =?us-ascii?q?C7ZDAHxIkoyhPQcfCKc5WE7gj9WOuePzt0nm9pdbSijBio60eg0PfzVsys3V?=
 =?us-ascii?q?ZPqSpKj8fDu2gW1xzW9siHUvx9/lq92TqX1wDc9OVEIUcsmKrHMZEh2L8wlo?=
 =?us-ascii?q?cIsUjZAi/3mFn5jK+Rdkk+/Oin9//nban8qp+ZNo90jhnyMqUomsOhHeQ1Kh?=
 =?us-ascii?q?UCUmeU9Oim1LDv4Ff1TKtFg/EoiKXVrYjWJcEBqa64Bw9V3Jwj6xG6Dzq+zd?=
 =?us-ascii?q?sYkmQII0xKeBKdlYfkIE3OIfDkAve/hFSgijFrx+vcMbH7DZXNKWbDnK/7fb?=
 =?us-ascii?q?lh805c1BYzzddH6pJWF7EBJPPzVVH3tNDCAR85KRa7w+LjCNhmzIweQ2ePDr?=
 =?us-ascii?q?WFP6PVtF+C/vgvLPWUZI8JpDb9LOAo5vHwgn8/gFMSYLem3YUJZ3C8BflmJ0?=
 =?us-ascii?q?SZYWHwgtcaC2sLsRQxTOryiF2YVj5TZWi9UL4g5j0hD4KmF4jDTJi3gLOdxC?=
 =?us-ascii?q?e7AoFWZmdeB1COHnfobYKEW+wXaC+JOc9hjycEWqa7R4A90hGusVyy970yDP?=
 =?us-ascii?q?fQ+yAe/b353dxxr7nRiBUz+DoyAN6U12WlRntx2GgPQmlylLBypwlxx0mO1Y?=
 =?us-ascii?q?B8gudEDppD6vVRSAA4OJXAietgBIPcQAXEK/uATlerRp2KDHkeVNs4zZdab0?=
 =?us-ascii?q?lxFtq4hzjfziGqBPkTjLXNC5sqpPGPl0PtLtpwni6VnJIqiEMrF44Wbjyr?=
X-IPAS-Result: =?us-ascii?q?A2CGAQAqh5dd/wHyM5BmGwEBAQEDAQEBDAMBAQGBZ4F0K?=
 =?us-ascii?q?oFAMiqEIpBJJZN/hyMJAQEBAQEBAQEBNAECAQGEQAKCRyM4EwIMAQEBBAEBA?=
 =?us-ascii?q?QEBBQMBAWyFOYI6KQGCaAEFIxVBEAsYAgImAgJXBgEMBgIBAYJfP4ILr1yBM?=
 =?us-ascii?q?oVNgy+BSIEMKIwOEgaBf4ERJwyCXz6HUYJYBJYhlxeCLZUSBhuCKgGXFS2Nf?=
 =?us-ascii?q?ptCIoFYKwoYKQ+DJ1AQFIIHjiolAzCBBgEBkGcBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 04 Oct 2019 17:57:57 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x94Hvvof024649; Fri, 4 Oct 2019 13:57:57 -0400
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20191004165646.14482-1-julien.grall@arm.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Organization: National Security Agency
Message-ID: <db4c28cc-2d0b-2166-eb01-f8e9af68daa0@tycho.nsa.gov>
Date: Fri, 4 Oct 2019 13:57:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191004165646.14482-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Check
 xmalloc_array() return in security_sid_to_context()
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
Cc: jgross@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvNC8xOSAxMjo1NiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHhtYWxsb2NfYXJyYXko
KSBtYXkgcmV0dXJuIE5VTEwgaWYgdGhlcmUgYXJlIG1lbW9yeS4gUmF0aGVyIHRoYW4gdHJ5aW5n
Cj4gdG8gZGVmZXJlbmNlIGl0IGRpcmVjdGx5LCB3ZSBzaG91bGQgY2hlY2sgdGhlIHJldHVybiB2
YWx1ZSBmaXJzdC4KPiAKPiBDb3Zlcml0eS1JRDogMTM4MTg1Mgo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkFja2VkLWJ5OiBEYW5pZWwgRGUgR3Jh
YWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
