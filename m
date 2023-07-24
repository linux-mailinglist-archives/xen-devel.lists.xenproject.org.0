Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EB75F317
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568704.888476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsnW-0008Md-KN; Mon, 24 Jul 2023 10:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568704.888476; Mon, 24 Jul 2023 10:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsnW-0008Kz-HO; Mon, 24 Jul 2023 10:28:14 +0000
Received: by outflank-mailman (input) for mailman id 568704;
 Mon, 24 Jul 2023 10:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GZnG=DK=citrix.com=prvs=5629cf0ab=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qNsnV-0008Kr-J9
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:28:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8c300ab-2a0c-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 12:28:10 +0200 (CEST)
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
X-Inumbo-ID: c8c300ab-2a0c-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690194490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+f9zFSLQ2gak6Gf97nxUR4+vN+KgXcXbChzBQRV/ijA=;
  b=K9jbcP5OkOV+428vY5fRDE9OwmoueK/KfRhXGFJzMidvKVhxsaJTl5Iv
   DLo0T/9aoySuzYjvR8CX5jdD1Hl4EQ4M5S4ytPw12rSQlPClxEsablKE0
   XBnhLvw8YCEtj/+w3z90q//TKXdqrkk7wKPC3urhPNitmcOJ9JVLaiT+b
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117641410
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FNMfw6hbXrgdxiY8X+vf6U3JX161VxAKZh0ujC45NGQN5FlHY01je
 htvUW7QPv2KazGjfYsiPYmypkoO68PUmN9mGldqqSxnQSob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWFzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQUAQ9cKSiHot6ng7ulELNt25QONNvSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 z2Yoz2lW0ly2Nq36yqPynK2uM3zwS7KaZM5T4X/qvx0qQjGroAUIEJPDgbqyRWjsWaaRtlWb
 WId/CEjqawv3EWxS5/2WBjQiHyOswMYWtFQO/Yn8wzLwa3Riy6jD2gZSnh6adoptOc/Xzls3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIgrgwjGVNpLDK+/hdqzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAd6izoDyWd6iZFdc2sedby6AWLwO5SFdPMJrWeh
 0Toi/Ry/chXU8DVzXfRHb1VdF26z63baWOB2DaDC7Fkrm3woCD7IOi89RkkfC9U3tA4lSgFi
 aM5kSdY/9dtMXSjdsebiKrhWp1xncAM+TkIP804j+aigbArLmdrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75DgOdynX9kmT6CHcuTI/GbPV22PSD9dFv4GAHWMrBRAF2s/W05D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEJTILcmeliCjTcbaelAOMDh4W5fsLUYJJ9QNc1J9yr2Zo
 RlQmyZwlDLCuJEwAVzTOyE9MumxDM8XQLBSFXVEAGtEEkMLOe6HhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:7ahpLKw3aiArGdKurP0WKrPwLL1zdoMgy1knxilNoH1uA6qlfq
 WV9sjzuiWE6gr5O0tBpTnjAtjkfZq0z/cciugs1NyZLW3bUQWTXeZfBEjZrwEI2ReSygeQ78
 hdmmFFZuEZqzVB/KXH3DU=
X-Talos-CUID: 9a23:5lUrSGPUsu3yqe5DVABYpQksHuUZYz7U0i2KIhLoJH57cejA
X-Talos-MUID: 9a23:oU7wIgnN1xMqd59Hb5g0dnpAJM1Q476QKnxRnKQ3quLfDWssOSm02WE=
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="117641410"
Date: Mon, 24 Jul 2023 11:28:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>, "Roger
 Pau =?iso-8859-1?Q?Monn=E9?=" <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Message-ID: <af1388d4-ddd8-4afe-8710-f5a780e8c333@perard>
References: <20230721121627.1229906-1-luca.fancellu@arm.com>
 <ceb7d6ad-0292-facf-6ad5-4bd265a8d34d@suse.com>
 <2CA77C15-BA9B-4D98-80A0-B1B7EDE4E48B@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2CA77C15-BA9B-4D98-80A0-B1B7EDE4E48B@arm.com>

On Fri, Jul 21, 2023 at 04:45:44PM +0000, Luca Fancellu wrote:
> > On 21 Jul 2023, at 14:24, Jan Beulich <jbeulich@suse.com> wrote:
> > On 21.07.2023 14:16, Luca Fancellu wrote:
> >> --- a/ts-kernel-build
> >> +++ b/ts-kernel-build
> >> @@ -245,6 +245,7 @@ setopt CONFIG_SENSORS_LM90 n
> >> setopt CONFIG_ICS932S401 n
> >> 
> >> # Enable some additional drivers for Arndale.
> >> +setopt CONFIG_AHCI_DWC y
> > 
> > ... does it really need to be y (and not m) here?
> 
> I didn’t try with m before because I was unsure where the kernel module were put (in the disk? But then we need to read it),
> but now I did a try with ‘m’ and it works, so I guess the module are put in some ramdisk instead of the disk we want to read.
> 
> Thanks for pointing that out.
> 
> @Roger, is it possible to change it on commit or should I send a v2?

I've pushed the patch to "pretest" with this modification.

If osstest is happy with the patch (that is no regression with a
"xen-unstable" flight), it will be committed.

Thanks,

-- 
Anthony PERARD

