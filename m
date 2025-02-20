Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B35A3DAFA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 14:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893866.1302714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6Le-0004Gv-HF; Thu, 20 Feb 2025 13:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893866.1302714; Thu, 20 Feb 2025 13:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6Le-0004E2-EP; Thu, 20 Feb 2025 13:12:14 +0000
Received: by outflank-mailman (input) for mailman id 893866;
 Thu, 20 Feb 2025 13:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=he41=VL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tl6Lc-0004Dw-J7
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 13:12:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aec89a8-ef8c-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 14:12:10 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8CF284EE073F;
 Thu, 20 Feb 2025 14:12:09 +0100 (CET)
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
X-Inumbo-ID: 4aec89a8-ef8c-11ef-9896-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1740057129;
	b=yL9Pl8P/3LMzRoOv+BH/lEUj29QiMr9Ebzg69sZ7c2kwqPj99yapQaGg2WaCiE2MMggU
	 pByVJV4ygIdjR6n7eogQMXvhz31Kqg+k2Bkr8QHP5u5X2PobH5+VYWOqNvtbObtoN8ed5
	 qbfFhOHGFMDy3zmPRZnBA2ZvRg5ylqtIX+L94XdbFyhPOqjWQ7JYfAtb1kNrLftOCQzgZ
	 YonN1Ew6F88OpzFe7yafwAjYDuLgQU0d2QnMKyXSrbh3NYesIzIHCpawgOa36RRk/gZC8
	 MfYAUe8zFEuu0a0d3hTtqoIeP6/BGzYzZS8uDrmkk3hxU4wdqB2hzwtZMLbTAZx2Y49+h
	 VUqBckFLTEzWBZ2EVvUYrz1b4LLYo5W5FeF2l3m8W0wCHY7WnSKWKnXpo5eM5ccQ8Aa0W
	 8PNjaBJDcHDIc874AAfwzmM9qOOZL/L76rZMzdP2VjqEqxsrp4SG3WkA/XB+4hU3jMRX7
	 J4Jz1v3I5wvN7sYeaKaiy2cQVrfO1AVfnrh2kCdQEy8/YgfLYdOqE4+4lJ5yh/tFO8ST6
	 mkTRrGHudILNyY/s/Xe+ys0BLSaPeV+667dUHIdkFxYhkHb6Q0mhtIh6wPlW+ZT0DmdCQ
	 6poQYsUT0MCkIVzTQXSYG5rP8JziH7GJlBg60hltPfNuk16JvJ1I6xeYZXYz/bE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1740057129;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=WKD6HlPkujte/P2180B4usHqNy34tHT9XinokMYPM8k=;
	b=4c09QvE5eNXczD1HbottzH3/K/+UcbJeCkY1xKmMO5dtXvAK5dK96hbGpYdxb7UEy9iM
	 ienpwymBZJQBOMNuhO5XfSbSIdTY8oUSQ5C22QW71lPWb7qomeyNITgWytHZwfjVrHcQY
	 F18EQF/0GCu9xZpnp9VuLVSBRszhXH6a91Ygexaik2MC3rNuLBk7QEn/p7iMCI0wyLTnP
	 ADv/g8bbrqYMT/NGsUhzB46DHQG77yI+abCHR25JYN07cIDHtESs2GKjTbvt2HuswPj07
	 1E86qUfccCE7N5spRwa/iSC5Zz7hdIdWd16DVg4MTACbNMDOtAuWm4G5Y8cAkfcD/zmCF
	 X3Tq6umVAEF4ylNNr48D7SvInbJfUpC7fePuT0unQuanUFBW80cNKf0bze6xGUdzAcInm
	 pluNFPJ9gYVvyGNqc1hL5uJBpcQadsRoUBJOckt9T21VkT63zEoYifWwaArTu5mvkhzhc
	 UYmsBhOJUkr4Oprc0bUbcpmrfiIj/4DFY+oAMP7bPU+kGxKdji2hy4gK8pQlo7Duron0e
	 mI3a7e51GKzoIfP0GwfTzJJjcHfYu1QfhW8MvApaO4HizDDxGKGwjyLjs3qF5dQPeJGxd
	 jUcvE8fIuIQmbXLQ/4h/isjaSpvZfNPUrWACjL+qWd9iRkOElSwLguI/RaIPNUA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1740057129; bh=ugA0h4FcJ5U3rRwMDKU+CONbcyRrWR5nlV6sH8cKOHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qszMbF/CID+9UMkEoT5sbeSwPldBDWJfkQ0PfAwLOjnNO9PIPaGhYs8MCse/KTABi
	 vBKNFRJ4S2AQoD8IsF0V2X/LG5Y8BgqRKoB4HAdbnjwUiibe6rvp2W88XpXNqgGUwl
	 YAJzk8yOo2B+qTrFQmBlEI9FnSakA/S7H7W8xZxUXpDFN7wsd/4y/TTYoMK0kGYhqC
	 cV7rFpnZ/b9dOJQdXrJJ91CHEybAz9sCMG3FbTlzZZDYLV0U70S5vvwyfj2OmrQfHN
	 wajGLy/DdOTuzW/ZFglAXX+tqkG5dwTukB+3J3vH6K5t7xGFzRUSHnDkMcNRF8rqNf
	 0BY4dOGqiAvjg==
MIME-Version: 1.0
Date: Thu, 20 Feb 2025 14:12:09 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] CI: Mark MISRA Rule 11.2 as clean
In-Reply-To: <20250220125354.869062-1-andrew.cooper3@citrix.com>
References: <20250220125354.869062-1-andrew.cooper3@citrix.com>
Message-ID: <a0859957bacfbed1a880e55da12fae6f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-20 13:53, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> For 4.20.  I want to include the fix and this patch ahead of RC5 to 
> avoid
> backporting.
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
> b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 491625e84c27..66698b4bfffb 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -58,6 +58,7 @@ MC3A2.R9.2||
>  MC3A2.R9.3||
>  MC3A2.R9.4||
>  MC3A2.R10.2||
> +MC3A2.R11.2||
>  MC3A2.R11.6||
>  MC3A2.R11.7||
>  MC3A2.R11.9||
> 
> base-commit: c989ff614f6bad48b3bd4b32694f711b31c7b2d6

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

