Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177152DD98F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 20:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56136.98005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpzMa-0006Tq-DB; Thu, 17 Dec 2020 19:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56136.98005; Thu, 17 Dec 2020 19:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpzMa-0006TR-9A; Thu, 17 Dec 2020 19:55:00 +0000
Received: by outflank-mailman (input) for mailman id 56136;
 Thu, 17 Dec 2020 19:54:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIZe=FV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpzMY-0006TL-0h
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 19:54:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3a4d447-f897-4af5-99df-aad7e89fa9d9;
 Thu, 17 Dec 2020 19:54:56 +0000 (UTC)
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
X-Inumbo-ID: f3a4d447-f897-4af5-99df-aad7e89fa9d9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608234896;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=6b75V8lNBxTwMLVNegOgh4gC5t2N3jdmF7LWG6K9iZM=;
  b=U2IDvXNKu6Ed02Qto61I6gMJI4WV3xGH+9ljpcZ3ea8ewERdIpmgvopD
   qopGJ42MUIQrZHjckPi5dbVDCmCFkHLnyI0I3euk+A9oQYJRcX2ZZKf0P
   cZrxRbL+OX49p4nJwaG/9niJ2jWwVBtUiarAeQYqN9izZeHG08mQ6vGMG
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YRLXeFaD6X01hM2pJLCP8KhXP1IyJmK8KuCRsbK8M8ML7MNqQvk6JKRGmNk4YoOXgkP+7ZyDEG
 u2uoyoWNzyN9+Z/AVwyt5PiYnueicZlIaJAQvjRk1AGrdn1xsmdIdyW35dQSjgryhSD6jQHAQj
 eEcwpOvlHQdJKldMwI47S9Tf1emrlubqDmoISGLiybUO6ox95xZTjtAENYpjA+VeOVpwc4/OyS
 LDetmAaqLxKkk4Mycn17zRkgdddKNrXVO3f+huSDF+7OJVu0FuxTX5S/Uozhd8VxU8i/okRYg6
 l3Q=
X-SBRS: 5.2
X-MesageID: 33475931
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,428,1599537600"; 
   d="scan'208";a="33475931"
Subject: Re: [PATCH 3/6] x86/p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <15f41816-4814-bae5-e0bc-89e99d04a142@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fc78c235-f806-6120-25f0-182b4c08bdaa@citrix.com>
Date: Thu, 17 Dec 2020 19:54:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <15f41816-4814-bae5-e0bc-89e99d04a142@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 15/12/2020 16:26, Jan Beulich wrote:
> Extend a respective #ifdef from inside set_typed_p2m_entry() to around
> all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
> check path.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

As the code currently stands, yes.  However, I'm not sure I agree
conceptually.

The p2m APIs are either a common interface to use, or HVM-specific.

PV guests don't actually have a p2m, but some of the APIs are used from
common code (e.g. copy_to/from_guest()), and some p2m concepts are
special cased as identity for PV (technically paging_mode_translate()),
while other concepts, such as foreign/mmio, which do exist for both PV
and HVM guests, are handled with totally different API sets for PV and HVM.

This is a broken mess of an abstraction.  I suspect some of it has to do
with PV autotranslate mode in the past, but that doesn't alter the fact
that we have a totally undocumented and error prone set of APIs here.

Either P2M's should (fully) be the common abstraction (despite not being
a real object for PV guests), or they should should be a different set
of APIs which is the common abstraction, and P2Ms should move being
exclusively for HVM guests.

(It's also very obvious by all the CONFIG_X86 ifdefary that we've got
arch specifics in our common code, and that is another aspect of the API
mess which needs handling.)

I'm honestly not sure which of these would be better, but I'm fairly
sure that either would be better than what we've currently got.  I
certainly think it would be better to have a plan for improvement, to
guide patches like this.

~Andrew

