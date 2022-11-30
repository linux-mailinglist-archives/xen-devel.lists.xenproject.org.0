Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59963D9DC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 16:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449969.707039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0PKg-0005eg-4j; Wed, 30 Nov 2022 15:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449969.707039; Wed, 30 Nov 2022 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0PKg-0005cS-1p; Wed, 30 Nov 2022 15:49:10 +0000
Received: by outflank-mailman (input) for mailman id 449969;
 Wed, 30 Nov 2022 15:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQKT=36=citrix.com=prvs=326f52c84=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p0PKf-0005cM-0x
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 15:49:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 828bb275-70c6-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 16:49:06 +0100 (CET)
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
X-Inumbo-ID: 828bb275-70c6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669823346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L/pergYOW0+Pg6MTUynuvlmE5E/HZqjlLKr/hQOnzTE=;
  b=XGJ9SFsbsvWN1Ew5lpefXHsMQ9YBFqXcd0rMfFMBKs/1AzDhycqFXIGP
   k/uf5bIvk2KUe/jbaWh+EbPMJnQO2Ws78VKN//zpE5dRFFgovCnHA6NQR
   7y5llYbmdiFSHnvdWpuC8F1Gh51YG7t3Ji/IEzwfuNDICTpfBBA52FXEt
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88405427
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mIRASqgH2WPbhb2ugpUoO9LhX161thAKZh0ujC45NGQN5FlHY01je
 htvUGmAb/zZa2f8eIwibt7i90pTvJPSyt5gTFdlqHtgFSIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QSGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ9EBsdPg2siN6y55TgZcJBjfg+LeTCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthbI+
 jqboz6mav0cHNyR7iqk+EyCusT0h2DxWr8XSbGj7+E/1TV/wURMUUZLBDNXu8KRgUekV9VSA
 0cd4CYpoO4580nDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8ywOYDWgNSnhGcs4rsOc/QDBs3
 ViM9/vjCCZzqrSTRTSY/62NsDKpESEPKCkJYipsZRsI5ZzvrZ8+ijrLT81/C+ilg9vtAzbyz
 juW6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyNyztSdN64SIOU7X/9ttlrAY2lU1isl
 S1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zq1+KTPuftlU
 Xt+TSpLJShyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXQP79lsv3Z/lmJr
 b6z0vdmLT0FCIUShQGOoeYuwa0idyBnVfgaVeQIHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVAydlJK7ErSSfc22iMykzAI4DqL4j9RrXywRwZwf3s5XiCK7zhJoim2wfJ+Z/qbI7naUoE
 5HouayoW5xyd9gOwBxFBbGVkWCoXEnz7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:XfQfjK7MH/kOq6Mk/wPXwY2BI+orL9Y04lQ7vn2ZKCYlB/Bw8v
 rE8sjzuiWVtN9vYgBdpTntAsi9qBDnhO1ICPcqTNWftWDd0QPDEGgI1/qA/9SPIVyaygZXvZ
 0QDJSXYLfLYWST5qzBjzVR3LwbreWvweSQoaP78l8odAdtbshbnnVE4sTwKDwJeOGDb6BJZK
 Z1I6B81kudkA8sH6CGL0hAZfHHu9rI0Lr+eHc9dmcawTjLtyqs9Ln5VzOF3hISOgk/vIsKwC
 z+ignk4afmlPm+xnbnpgjuxqUTosLl1txAQOqTjcQPQw+c7DqAVcBaQrifuzJwmsGDgWxa6O
 XkklMbJsFu7HGURG2vvhf3/AHl3F8VmgTf4G7du2Lnvcv6AA03ENBAg4UxSGqi13Yd
X-IronPort-AV: E=Sophos;i="5.96,206,1665460800"; 
   d="scan'208";a="88405427"
Date: Wed, 30 Nov 2022 15:48:32 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 2/3] automation: Add a clean rule for containers
Message-ID: <Y4d7UA9PXZ01FOCa@perard.uk.xensource.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <f793cc70fdb6802b66156a8756bf676fbac0d809.1669810269.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f793cc70fdb6802b66156a8756bf676fbac0d809.1669810269.git.bertrand.marquis@arm.com>

On Wed, Nov 30, 2022 at 12:15:08PM +0000, Bertrand Marquis wrote:
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -28,3 +28,13 @@ all: $(CONTAINERS)
>  clean:
>  	rm -f yocto/*.dockerfiles
>  
> +define CLEAN_RULE
> +.PHONY: clean-$(1)
> +clean-$(1):
> +ifneq ($$(shell docker image ls -q $(REGISTRY)/$(subst /,:,$(1))),)

Please, don't use "ifneq" in a rule's recipe, especially when running a
shell command. That shell command is evaluated every time make parse the
makefile, so we are going to run `docker image ls` 23 times!

Just write the call to `docker image ls` and evaluate the result in
shell. I guess something like:
    [ "$(docker image ls -q ...)" ] && docker image rm ...


Cheers,

-- 
Anthony PERARD

