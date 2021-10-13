Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67442C318
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208559.364732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafDo-0007vk-EL; Wed, 13 Oct 2021 14:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208559.364732; Wed, 13 Oct 2021 14:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafDo-0007tx-Ak; Wed, 13 Oct 2021 14:27:08 +0000
Received: by outflank-mailman (input) for mailman id 208559;
 Wed, 13 Oct 2021 14:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVjq=PB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mafDm-0007tr-QX
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:27:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a394ce12-2c31-11ec-8179-12813bfff9fa;
 Wed, 13 Oct 2021 14:27:05 +0000 (UTC)
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
X-Inumbo-ID: a394ce12-2c31-11ec-8179-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634135225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VWfF5b+yHwyyQ5m1UWkgFlWZUR0Pmn/m9glp0ubmhDo=;
  b=GG7Tmq5GQbvs+MrH4Bjjx3R6UwmVnR+lCJ4Lzti49r9hpmEKwGQZCo+1
   lARoCQvGDtnZom8g7rpcMSURmUjji3aKpZJ4HlICZ1ldncVb6jKTgepg2
   95sydI9eTwDlvfkJUhtUcN+nk8iWbkxbfOE1jDdkEqWkc4qkxWEhxMt/9
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bpbR6ArYKxIEu9NiiH5EgTt5zyjKj3KoY+aRcPFTCM4rJ4TECRl/HBEble6LsFd1JNaBma5xEV
 XFbvlVT5TLSQ8Jm6oIpaa53tkYdpTJVH9ZOlMyOHDBpweWYgD4RslhdZAEZfPpb9yhsxdKKAfa
 Oi5QjwjPk5zT8FipzMGNGsjbnzZr2PRc9gVhFUhr+MTWZh0jINsXEuGQ4Q4oAIIGFPH+v7HENn
 ZrLBpQokLAPym58ud8neJtoglZwF5x8WM/rXNyxRp2xi5+fuqn+aXVQItROIxvE74G+OyzgMD6
 UEJ4rfqvFgyPhDINQNGGk8UF
X-SBRS: 5.1
X-MesageID: 55098980
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hdJMyaLtgu7SZyo9FE+RXJIlxSXFcZb7ZxGr2PjKsXjdYENSgjMBn
 DRKWWnVOaqMY2P9LYxxa4S+phxVuZfTnYI1GQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6wLZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB25hfRvk
 NBgsqWqUBp0boz3wscCEBNhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpt3pEeTKaGD
 yYfQRdkXA3laB1lAwkKKaglh9akmljGdDIN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRasvwEec8pdFfUg7wOAwbaS5ByWbkAGUzpAZdoOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqVTUgU1MAzt7aupgu00LudYxAD+2/t4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVqPADr0hu9tTMv8PdbwsAmEhRpVBN/BFgHpg
 ZQSpySJAAni57m2nyuRXP5FIrit4/uUWNE3qQ8yR8d/n9hBFnjKQGyx3N2cDBs3WirnUWWwC
 KM2he+3zMQMVJdNRfUmC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyyv1nZ
 8vBKZzwVipy5UFbINyeHLh1PVgDnHFW+I8ubcqjk0TPPUS2NRZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLMeu1A8kk9y5nZETB/z+AghAeXGpm149HH7NfQFXt3LULISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:okhYg6DSZ1a2yqvlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.85,371,1624334400"; 
   d="scan'208";a="55098980"
Date: Wed, 13 Oct 2021 15:26:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 22/51] build: clean common temporary files from
 root makefile
Message-ID: <YWbspfv86oEVFMap@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-23-anthony.perard@citrix.com>
 <dd760c79-e761-3547-726a-4d7ee092d10f@suse.com>
 <YWa2neA0zQSvkqn2@perard>
 <16d19699-8ebb-9352-dff5-83147aee9ffc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16d19699-8ebb-9352-dff5-83147aee9ffc@suse.com>

On Wed, Oct 13, 2021 at 02:32:55PM +0200, Jan Beulich wrote:
> On 13.10.2021 12:36, Anthony PERARD wrote:
> > On Mon, Oct 11, 2021 at 01:41:16PM +0200, Jan Beulich wrote:
> >> On 24.08.2021 12:50, Anthony PERARD wrote:
> >>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> >>
> >> Trying to synthesize a description:
> >>
> >>> --- a/xen/Makefile
> >>> +++ b/xen/Makefile
> >>> @@ -382,6 +382,7 @@ _clean:
> >>>  	$(MAKE) $(clean) test
> >>>  	$(MAKE) $(kconfig) clean
> >>>  	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
> >>
> >> This was effectively redundant with ...
> >>
> >>> +		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
> >>>  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
> >>>  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
> >>>  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> >>> diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
> >>> index 027c200c0efc..b6df9e861e6e 100644
> >>> --- a/xen/scripts/Makefile.clean
> >>> +++ b/xen/scripts/Makefile.clean
> >>> @@ -14,10 +14,8 @@ include Makefile
> >>>  subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
> >>>                $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
> >>>  
> >>> -DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
> >>
> >> ... this and its use below.
> >>
> >>>  .PHONY: clean
> >>>  clean:: $(subdir-all)
> >>> -	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)
> >>
> >> With the command gone, I think the :: should also be converted (back) to
> >> just : then. Then
> > 
> > "clean" has been a double-column rule for a long time. If we convert
> > this rule to a single-column we need to convert all "clean" target to
> > use single-column which would make this patch more complicated. So I
> > don't think we should make this change.
> 
> Hmm, indeed make would complain in that case (I didn't mean to suggest
> to convert all clean-s to single-colon rules, but I was instead under
> the wrong impression that spelling out merely dependencies would be
> okay with single-colon rule). But then make's doc also says "Each
> double-colon rule should specify a recipe; if it does not, an implicit
> rule will be used if one applies." So perhaps, to avoid depending on
> the latter, an empty recipe should be added here (by adding a
> semicolon)?

That sounds fine.

> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> Assuming the patch is independent of the earlier still uncommitted ones
> >> (please confirm), I'd be happy to make the adjustment while committing
> >> - as long as you agree, of course.
> > 
> > The patch is independent of earlier one, although the context is changed
> > in one patch so wouldn't apply cleaning without git helps.
> > (context is changed in "xen: move include/asm-* to arch/*/include/asm")
> 
> That would be easy enough to adjust, I guess. But first we need to settle
> on the above.

Thanks,

-- 
Anthony PERARD

