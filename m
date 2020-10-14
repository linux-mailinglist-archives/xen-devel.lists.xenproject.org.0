Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9C28E4AB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6896.18053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjr2-00076U-UC; Wed, 14 Oct 2020 16:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6896.18053; Wed, 14 Oct 2020 16:42:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjr2-000768-Qk; Wed, 14 Oct 2020 16:42:20 +0000
Received: by outflank-mailman (input) for mailman id 6896;
 Wed, 14 Oct 2020 16:42:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbRJ=DV=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSjr0-000763-Pb
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:42:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35cd91e0-8b3c-4e5c-b9d1-8f569fe15a3f;
 Wed, 14 Oct 2020 16:42:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nbRJ=DV=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSjr0-000763-Pb
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:42:18 +0000
X-Inumbo-ID: 35cd91e0-8b3c-4e5c-b9d1-8f569fe15a3f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35cd91e0-8b3c-4e5c-b9d1-8f569fe15a3f;
	Wed, 14 Oct 2020 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602693737;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7bzHnT69tW0R5VXZ4MQBOqCdfcMHvevAeG9gp5iZwQE=;
  b=XYd+d7+w7WNW4XT74HqEZh7nUColr0Knw/QZpIpUJbai8N1xDOjnw++3
   sa2D37aZVWFZBCij5iVTfPF+ixpR54pGfEgBOqbWgZoHauhWAlsb7SoJL
   k7DxxqM2u/hdALL9a72Qc6/6CbVs8cZnL16ooMO7y7elMW7J1t08Y/JGt
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7oisZ/rXFwmGBpjwwUY/CpJ+X4cOtC4q8+dVsvSG2yXyhJvCIhj8DZ+bwjlfnkP/ThzrkU8b9v
 uYv8swOSWwupdAhhhH+VZjxHaW7Q6BlyzLc90JgKgw73rJCNkiZyWnmZH0Vgm2xwX0TV9BHAN4
 47JKsJ6GjKAtUDjKNRcj5HuZNGCMcnd4tstEkc5vPXevA/MrpZRu8GUHYZNxYZTKU7JoaRD4w8
 5MdtFJx4rADewqgITaaeVcvnLa23U2sfdMQIVbs+0KexfhA82jNk+BFV++uh2kPfZrFVXVpKMa
 bh4=
X-SBRS: 2.5
X-MesageID: 29256984
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="29256984"
Subject: Re: [PATCH 1/2] x86/intel: insert Ice Lake X (server) model numbers
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <wl@xen.org>, <jun.nakajima@intel.com>,
	<kevin.tian@intel.com>
References: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
 <ca9a1cce-1e51-0f55-4527-42f48bc7d6ab@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <e30f7f98-ee1a-1a24-0496-01911a79c861@citrix.com>
Date: Wed, 14 Oct 2020 17:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca9a1cce-1e51-0f55-4527-42f48bc7d6ab@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14/10/2020 16:47, Jan Beulich wrote:
> On 13.10.2020 05:02, Igor Druzhinin wrote:
>> LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
>> to Ice Lake desktop according to External Design Specification vol.2.
> 
> Could you tell me where this is publicly available? Even after spending
> quite a bit of time on searching for it, I can't seem to be able to
> find it. And the SDM doesn't have enough information (yet).

True that SDM doesn't have this data. As I mentioned that data is taken from
External Design Specification for Ice Lake server which is accessed using Intel
account. I'm not completely sure it is right to make changes in open source
project like Linux or Xen based on information which is not publicly available
yet. But Intel is frequently doing this with Linux : even my second patch uses
data taken from one of these documents and was committed by Intel to Linux first.

Do we need the information publicly available to commit these changes as well?
If not, we can run with these changes in our patchqueue until it gets out properly.

Igor

