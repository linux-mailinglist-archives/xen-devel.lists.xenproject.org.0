Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA223BCD2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2yQQ-0008VZ-08; Tue, 04 Aug 2020 15:00:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exko=BO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k2yQP-0008VU-4w
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:00:21 +0000
X-Inumbo-ID: ef5fadc4-4bba-468c-bea2-51884dd8007a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef5fadc4-4bba-468c-bea2-51884dd8007a;
 Tue, 04 Aug 2020 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596553220;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zwI3V060M/+vMgnPet7K7MC8n3DXrk47Ov37cF5uQO4=;
 b=ZeC9g0fRlgVZ2xoV+9FEcPe6480z/vun9HBnCa5sgNK7TSX2z/hJ1ucn
 FUl11UCUGmMojnBH4ED9CZ2C7wjQ8gV3iAMjNBXqXitEhps+LipPG5hqp
 UUvOAZg/JH+kLiuhxeO98jPDXVwH29lkSJe6+/Pq1GayeGUcIVEynmOHa Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ss79eXD16EMThyJMkPQ+Kjxnq4Tn0puUppM72GVsw/gxfUVNfW647jWQEuooJPFLtWfAwvhBt8
 Hrh0cvVxp9Iq+fTaid0t7BXHi6KMwhVkM9tHXW44gNjoIkRdQTOZ/ZM6QYYGEPRSfIPFoAd8M1
 SGgsBI6mGmcsTz945qiAhkHMNyyS4yLfOxwdjjMTQyrx/0hgiu12hP8a9hFL7FRNg99eIeaMBF
 dxJ7F9D3jnzfS3qb9kl3h8fHyKB2AQOXu0HIpL+OvUgBIv5i/FKkFi0anl9/RH7Mqs7a+kf8BW
 sTk=
X-SBRS: 3.7
X-MesageID: 24156014
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,434,1589256000"; d="scan'208";a="24156014"
Subject: Re: [PATCH 00/10] x86emul: full coverage mem access / write testing
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9d401ca1-e09f-48f7-dbda-3c6914577ef2@citrix.com>
Date: Tue, 4 Aug 2020 15:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/08/2020 15:47, Jan Beulich wrote:
> ... and a few fixes resulting from this work. This completes what
> was started for legacy encoded GPR insns in a rush before 4.14.
>
> There's one thing I'm still planning on top of both this and the
> EVEX-disp8 checking: For all encodings we produce via general
> logic (and in particular without involvement of any assembler) I'd
> like to add a kind of logging mechanism, the output of which could
> be fed to gas and then some disassembler, to allow verification
> that the produced encodings are actually valid ones. See e.g. the
> first patch here or commit 5f55389d6960 - the problems addressed
> there could have been caught earlier if the generated encodings
> could be easily disassembled. What's not clear to me here is
> whether this is deemed generally useful, or whether I should make
> this a private addition of mine.
>
> 01: adjustments to mem access / write logic testing
> 02: extend decoding / mem access testing to FPU insns
> 03: extend decoding / mem access testing to MMX / SSE insns
> 04: extend decoding / mem access testing to VEX-encoded insns
> 05: extend decoding / mem access testing to XOP-encoded insns
> 06: AVX512{F,BW} down conversion moves are memory writes
> 07: AVX512F scatter insns are memory writes
> 08: AVX512PF insns aren't memory accesses
> 09: extend decoding / mem access testing to EVEX-encoded insns
> 10: correct AVX512_BF16 insn names in EVEX Disp8 test

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Ideally with the commit message for patch 3 adjusted.

