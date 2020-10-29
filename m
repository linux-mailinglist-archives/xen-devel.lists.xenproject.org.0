Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D929F345
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14528.35891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBlN-00079p-Gc; Thu, 29 Oct 2020 17:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14528.35891; Thu, 29 Oct 2020 17:31:01 +0000
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
	id 1kYBlN-00079Q-Cs; Thu, 29 Oct 2020 17:31:01 +0000
Received: by outflank-mailman (input) for mailman id 14528;
 Thu, 29 Oct 2020 17:30:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kYBlL-00079K-Qd
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:30:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca475892-3348-4a95-9715-74c3628a907d;
 Thu, 29 Oct 2020 17:30:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kYBlL-00079K-Qd
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:30:59 +0000
X-Inumbo-ID: ca475892-3348-4a95-9715-74c3628a907d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ca475892-3348-4a95-9715-74c3628a907d;
	Thu, 29 Oct 2020 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603992658;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=UCywN/RX+8t1lgf/RGUgEx1VaXzugQ4kDhApv8r9oUs=;
  b=MIRXUvZ8UOH8VBJ8p1ITE/30LWC6GxthzAoqs5h79h9v5Bvmy2NVhRjM
   nBhxPzWXAc9HigAAmLip34Lu740XnWDG4BUkdh6N7VFqqp/ffdmNK7ym3
   bh4gumoV4LfXtAeZxdekabMuRB4APwRSsB+FBSj8N2aZAHfEltc8Gwes9
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6rp4OESqtVocJTDgZ8qwPP2DQJ00UTd4rQg7uSPQFt8F6Irkne/m+EVafVFuIAIc6LKC58Rxpb
 g+lBE0gEySgfGu+TmP0UA0r0aSQxhtJzlxC2FZmPOmuiY2IMYIVg8o6DAsnfQl8qccDi9WH9wz
 FleDqc36yzdYdDr4MwE0Wa9++jjx7/VgGb/+4GgPs9NOiKevWX4Bq0Ar2HlonBx0PdQoPSsHya
 yi9Wx6fHjUZvymJqfUMxWY3xTIpPZau/swssvX0evDtlKEVPVhLMbfzQWKI37LK8W1HNObUeN7
 R0E=
X-SBRS: None
X-MesageID: 31179790
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="31179790"
Subject: Re: [PATCH] x86emul: support AVX-VNNI
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <bead640a-e75e-8352-cd3d-5986386cab3a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7232319d-bc8b-8aec-d19e-e947f13c9e86@citrix.com>
Date: Thu, 29 Oct 2020 17:30:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bead640a-e75e-8352-cd3d-5986386cab3a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 29/10/2020 15:01, Jan Beulich wrote:
> These are VEX-encoded equivalents of the EVEX-encoded AVX512-VNNI ISA
> extension.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

