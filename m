Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817C774D0E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580495.908731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTUF8-000834-HC; Tue, 08 Aug 2023 21:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580495.908731; Tue, 08 Aug 2023 21:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTUF8-00081P-E5; Tue, 08 Aug 2023 21:27:54 +0000
Received: by outflank-mailman (input) for mailman id 580495;
 Tue, 08 Aug 2023 21:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTUF7-00081J-Th
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:27:53 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cd524e5-3632-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 23:27:51 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691530062954947.7218140859737;
 Tue, 8 Aug 2023 14:27:42 -0700 (PDT)
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
X-Inumbo-ID: 6cd524e5-3632-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691530064; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gg82p8SFLAS85ZsR5VgvXpPM5slIHZcXyDhNHVe6WG1wEPmXvIDXWa4hyC+P1TXHPJ+Y8kxmBIt3K30ISVo2dTMRMDcsFxfJ9j9sTPbnfusiB2ojsQjmyaQcMAjhR9ytQDmfAbae/JeYOHzP5hUi5bcm0L8AM2SqoDr59ZGqiHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691530064; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qhdsCcqLV5gPF6Pj1XWQJS4sDgk8TWD9gM81TQ2vS6s=; 
	b=lX9FY0HK/kuELKZ++w7P8LcLIQ4WvaQw5SZt9+L65sBMMJeUaBVXjcoG7qwd5IbIFV9URH+VLANEXCDccD8ICLNPGvVmDcu7gHlxfUZQx43OCu9h69sCj7GEG2XT0+Z/BerWh7mf0eMpM09xv94lWuyf/oK790ayGSLBmB4p5bU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691530064;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qhdsCcqLV5gPF6Pj1XWQJS4sDgk8TWD9gM81TQ2vS6s=;
	b=qQbUSFf4udCXycZVO7oCT9DhkrXsPh9WAn5ZO7QdbN5rsKTf2qbSFMv0jL9ANfJb
	Jung7bwd95VNhxgGL/2nOKo6xIopypKgUmqd5r0OUrCVOOo4sVdSPjWynMA9BnT6kWM
	2dORYAKI+HbzNygZveea8asLuXvIlGl04oXBtaWI=
Message-ID: <a6348a98-30bb-8a03-7ed7-9e965be119eb@apertussolutions.com>
Date: Tue, 8 Aug 2023 17:27:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/3/23 16:36, Andrew Cooper wrote:
> The opensuse-tumbleweed build jobs currently fail with:
> 
>    /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In function 'rsa_private':
>    /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
>       56 |   if (!key->p || !key->q || !key->u) {
>          |       ^
>    In file included from /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
>    /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
>       28 |   tpm_bn_t p;
>          |            ^
> 
> This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
> OpenSSL BIGNUM flavour).  The author was probably meaning to do value checks,
> but that's not what the code does.
> 
> Adjust it to compile.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> 
> While I've confirmed this to fix the build issue:
> 
>    https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430
> 
> I'm -1 overall to the change, and would prefer to disable vtpm-stubdom
> entirely.
> 
> It's TPM 1.2 only, using decades-old libs, and some stuff in the upstream
> https://github.com/PeterHuewe/tpm-emulator (which is still abandaonded as of
> 2018) is just as concerning as the basic error here in rsa_private().

For semantics sake, the Guest PV interface is 1.2 compliant but the PV 
backend, vtpmmgr, is capable of using TPM2.0.

> vtpm-stubdom isn't credibly component of a Xen system, and we're wasting loads
> of CI cycles testing it...

Unfortunately, I cannot disagree here. This is the only proper vTPM, 
from a trustworthy architecture perspective, that I know of existing 
today. Until I can find someone willing to fund updating the 
implementation and moving it to being an emulated vTPM and not a PV 
interface, it is likely to stay in this state for some time.

v/r,
dps

