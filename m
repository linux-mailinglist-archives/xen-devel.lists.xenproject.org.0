Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65084C025FD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 18:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149480.1481139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxyw-0005C6-BU; Thu, 23 Oct 2025 16:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149480.1481139; Thu, 23 Oct 2025 16:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxyw-00059S-8p; Thu, 23 Oct 2025 16:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1149480;
 Thu, 23 Oct 2025 16:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFMh=5A=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vBxyu-00059B-K9
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 16:16:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f39986c-b02b-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 18:15:58 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B09F34EEBEA4;
 Thu, 23 Oct 2025 18:15:56 +0200 (CEST)
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
X-Inumbo-ID: 8f39986c-b02b-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1761236156;
	b=ndS2bkNDFM1LpBtmINmlY3hE6f9mleleXmDX0AhUa4H5CVsW+IiL5DoOmrwR+dN/OZ49
	 HLtH2I1WRae4QGWSTvk2yNay00xtOPyve4OIAZJy6mmcm7pqdsJ8ry2tNLhZ5IktQDDPm
	 N3vZyeMQ2eq+s7yDL/7UZdKa5I5NEWgGHBQsUS9bSt0gCBpVYf1hMPiKzyuGoxQq+i/+3
	 PFxE1IvRoHFvS80GB4cWE752jwiDiioo7Jwwm/sbSt4ImuzDjFeudsz28Kcb65ac4DExj
	 jOfczaj6JKRLgwWqT5TQKgg4xQYYf4M7v5JCiJ8q7FMFsLMwKQRrxL2btQgzG24+0T94h
	 NzgrHt8uffsISEuVCsEvwC7LTtuEOngym6KjJ7IsWPWesZwj6hYngdgGIsDXfNiURHI9Q
	 kFQIprNxTe9P2iujbneu8UzYLmYfC/37TfM5ptHPSitlIwpPrFz6wD6JldiyHjxPc4E0r
	 em8xaHcoltr/Jekheyf3AVb8NckpvbnKjDf+fMNqJO1XphUCEldC/3MsSBE/Tp7UtGGna
	 Dex8eKyzCKx+GrWSOsB8ctTFokMsuBEKWakQYwPwpQsPS9wrkgia72dE9fKN7fb6k9llD
	 ZfYvU8PCSnmR1SbfrKvSV4rd5TwtrKTGfhX9R3TbunwINCbIKGHiGdwjstblPto=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1761236156;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=UozdKfoZsjAi+/92oPIl9SJW0PZ3oD10egncKYftKFg=;
	b=OXPgxvijBUTqrpUiNibTzrHxJgzSdix7irsm1Ar6nkXhi5vHt5UoP9ut6GTiL/PvTI1H
	 Bv/Fd0K6ve28lZ6B00RDHq674hlr7MbAsBFjE4PdQMkRQmNDaoZZONemZmktHa2ySnGuJ
	 cxh7IZS+GcknBtEQwzQ9wTDKq1NXVZRFLSCIik0rjRt8tkcLvUj8UIOJL9O6XDA1AQe12
	 a+ttFhb+SMXInlVaLkHQoSO0ywXttFBowXiMTFdLPAZc/rHFir/lvryuiulgWxo0VuX6j
	 BGpn7M+HdVgGpkT5r4FR+Tf/l7j+4FByjWx/Uv2ZWMtg+quxUVZS7YH+AJWCtJF8KdpCd
	 lMNoCdNs37KujEPw+W7YbkkKXJZY2nZIC2EKrjtS3t9GglAJd32hD4USmosCRmCeBsKmB
	 zdf+o6ZbC6CziYXhe9r+2X9LN7MJXf26jcXTj5ACKPs61AhkzBcYrasksl+jbH9Jiv4AJ
	 yOFo7xp/pG7SpnZRulN4hZ3qmhywNhcV7qhucXL27EX6857MMwgAfFtATXuTISeuxeOYE
	 6rDprsG/UIgNUBY0r/l2MTS40aEP/S9a3DgiR2TpRGKGZtgpiQNdws25nKLOuKqs0moA5
	 8MZHVQCRYEc5I/SC1AjosFF0+LqBRQM8ZFqUJSdOZp1tuWcb4AaEzScGvNLzuMM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1761236156; bh=D0IP52VtNGa/zU+9XHpZbqM0sChmjlulCvDlK9urYtc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lvrrwheMgP2hBtrc7NBLxnyZLGmLANxms5/a5eyfm1Tw0dDtMliy0O92UAcKTsp8w
	 a2LgVtEA5Kk1xsWOkOFl2WB97bvtRcaBZIhcfjo53TOVdCOGTsZdhRdFOLCqhREitm
	 Yf8Owd0SsvgtYwhDI/VdpaPKAKuy5Iw1c9mQ3mr2ZehDvi5e96Lv5fKRgIxAy2i6Ma
	 id2vNEMLR+Y7cc0ID3UlUdqNtEFumVysec/tMi0WjmKKpREfA+A9da5GunIsvZSyRP
	 WM1R5DPgWHu0szwgwdgT6in8+oYKdUBS406LYzjDmuzQ4zaFX3eDsMnaTqwj5D1e2M
	 UByFHEv/bPMlw==
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 18:15:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: move vlapic_set_ppr/apicv_write()
 under CONFIG_INTEL_VMX
In-Reply-To: <e45956c8-89de-4c5e-a5ef-12bc5daa0fe1@suse.com>
References: <20251023152036.561109-1-grygorii_strashko@epam.com>
 <a6b61e9b-e1c2-472f-95d6-05b114b201d2@citrix.com>
 <e45956c8-89de-4c5e-a5ef-12bc5daa0fe1@suse.com>
Message-ID: <e8f4631272fd390b1e0db00ee96f1bd2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-23 17:37, Jan Beulich wrote:
> On 23.10.2025 17:30, Andrew Cooper wrote:
>> On 23/10/2025 4:20 pm, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>> 
>>> Functions:
>>>  - vlapic_apicv_write()
>>>  - vlapic_set_ppr()
>>> are used by Intel VMX code only, so move them under CONFIG_INTEL_VMX 
>>> ifdef.
>>> 
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> 
>> Yes and no.  Yes right now, but this is needed for AMD AVIC, which I
>> understand is one one of the plans.
>> 
>> Throwing #ifdef's around like this in common files is fragile and will
>> lead to a randconfig nightmare.
>> 
>> There is an alternative which ought to work.  Turning on
>> -ffunction-sections (we already have this for livepatching), and
>> implementing link time --gc-sections (new work).
>> 
>> That way, the compiler/linker simply drops functions that are not
>> referenced in the final binary.
>> 
>> Personally I think it will be far nicer and more scalable than the
>> #ifdefary, (not to mention far easier - it gets rid of everything
>> unreferenced with one fell swoop).
>> 
>> Thoughts?
> 
> We'd need to have Misra buy-off on such an approach. I'm not sure if 
> Eclair's
> scanning would take --gc-sections effects into account.
> 
> Jan

Currently it doesn't, but we do have plans to implement something 
similar in the future. What might help in the meantime is using ECLAIR 
Code Scout to tag and hide unused program entities. Not sure if the 
mailing list is the best place to present the idea, but I'd be happy to 
illustrate it in a community call or something similar.

Basically the idea is that if something is possibly reachable it will be 
captured by Code Scout, and then a second analysis can use that input to 
selectively find and tag (e.g. "unused") the definitely unreachable 
entities. This could be limited to functions for instance, and then when 
the rule for unreachable code finds something unreachable, it can be 
silenced selectively for tagged functions, because we know that these 
are unreachable due to that reason. It's not 1:1 with the --gc-sections 
behaviour, but realistically it's much closer without resorting to 
#ifdefary all over the place.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

