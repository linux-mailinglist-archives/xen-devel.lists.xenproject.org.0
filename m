Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A34BA4B3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 16:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274858.470468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKiw1-0004Xy-I9; Thu, 17 Feb 2022 15:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274858.470468; Thu, 17 Feb 2022 15:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKiw1-0004W8-Ep; Thu, 17 Feb 2022 15:43:09 +0000
Received: by outflank-mailman (input) for mailman id 274858;
 Thu, 17 Feb 2022 15:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKiw0-0004W2-9G
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 15:43:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bb00712-9008-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 16:43:06 +0100 (CET)
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
X-Inumbo-ID: 4bb00712-9008-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645112586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WYsCC30DTUis/FmKE5Z3+CVmrp7owvRWbCtgXBB4CUo=;
  b=OxZTSZd3y0rJdVqwH/fqqkBNdUXxe8166mhwMJWQ5ez47bx1z4i3zmm+
   DYnRZ0dMbyW0WnnfpVBxFWtnx5PYRpFpK33mpDP74XB65hYVQi3i1wAPV
   HkI984EciwixVQIcMyDiiUrlIeFLYsKtTS9f5/7uRkGHpMlRCn4EUp7MJ
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: h5TZCVeTNVrbpo6vVZiDcuYdf/lR1n4JHnqFrBEprHWFVqy6s/NmzY4nS+tibumMYi9EEeCI1e
 d//OpfXOPN98EL3umtIqUtbOkWiQGWzb0vrPoCqX+jxt89T2hjjXRQ8V8ydpB9yTWKhaAvLZUV
 kfvxg4cCmKLyHiylQBmQltCWffRWS2xOqCrlxB46Mhm7vhh3DPpcEmsTQ5FsRr2kpqO1o07sAh
 vzjozyzZJ4F6QRSOd1IGbd/hPYfL8mG3IxVfs7bM6EF+i9oQy3eTAJk42Xj0eVYcYhUvSfJJNo
 rGDcmH2/EFOujeU7K/Ia4moP
X-SBRS: 5.1
X-MesageID: 63883320
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YWWTm6pH9xZAK5F4jKLbmb3n4AdeBmKaYhIvgKrLsJaIsI4StFCzt
 garIBnVaPjcYzTzetgkOozlpk4Ov8Pdm9AxSVc/rHpnQi0Q9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaS/ExY7OoqSpORHSRdXIhNQHPFioaCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZFJOWE0NkyojxtnAk03LrYgufyTviPQdxdJmmqwqY0Y7D2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S30iGZ+3ihguvOmyLTW48IErC8sPlwjzW72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JTFOsg4Q3L1avQ4C6eHGEPSjMHY9sj3Oc0TzE30
 l6Cn/vyGCdi9raSTBqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bth2VX8RnN/CJjofvFz7B8
 R6r8AxnmOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxL1WVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxe1M
 Sc/WisLvfe/2UdGi4ctPOpd7OxwkMDd+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5rxVS1FV/g6l2XrLwv47VPN7nphrY80bcqmpylLLJLEPCLFIVv7GADmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZIRW3m2UMTXMisw+QOL7brClM/RAkJVq+AqZt8KtcNt/kEyY/1E
 oSVBxYwJKzX3iacd21nqxlLNdvSYHqIhSlqZ3NyYwfziiNLjETGxP53SqbbtIIPrIRLpcOYh
 dFcEylZKvgQGDnB5RoHapzx8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMpRXRlmAebXdOmrkwG7s08Clb8gREDPONRSJhnhqdA4Nyzrg/YrCMgQMhGflCCC3
 gObDE5A9+nAqoM46vfTgqWAo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBexQREqYtxFbpv3JkS3dq3qu8I1BlgEVXKc0+vVuFqLE6Z0JQdraZK3LJY51e7A
 xrd5tlANLyVE8r5C1pNdhE9Z+GO2PxIyDnf6fM5fBfz6CNtpefVVExTO1+HiTBHLaszO4Qgm
 L9ztMkT4g25qxwrLtfZ0XwEqzXSdiQNA/c9q5UXII73kQ56mFhNbKvVBjLy/JzSOc5HNVMnI
 2PMiafP71iGKpEur5bn+aDx4Ndg
IronPort-HdrOrdr: A9a23:PhVje623qOmOFEbfk4HHDwqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="63883320"
Date: Thu, 17 Feb 2022 15:42:58 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Ping: [XEN PATCH v9 06/30] build: rework test/livepatch/Makefile
Message-ID: <Yg5tArVkT2JUyM91@perard.uk.xensource.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-7-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220125110103.3527686-7-anthony.perard@citrix.com>

Hi Ross, Konrad,

Could you ack or review this patch?

There is also a few other patches in this series that make some changes
to "xen/test/livepatch/Makefile", an ack for those would be nice as
well:

- 09/30 build: build everything from the root dir, use obj=$subdir
- 19/30 build: clean-up "clean" rules of duplication
- 20/30 build: rework "clean" to clean from the root dir
- 25/30 build: replace $(BASEDIR) by $(objtree)
- 30/30 build: adding out-of-tree support to the xen build

Cheers.

On Tue, Jan 25, 2022 at 11:00:39AM +0000, Anthony PERARD wrote:
> This rework the livepatch/Makefile to make it less repetitive and make
> use of the facilities. All the targets to be built are now listed in
> $(extra-y) which will allow Rules.mk to build them without the need of
> a local target in a future patch.
> 
> There are some changes/fixes in this patch:
> - when "xen-syms" is used for a target, it is added to the dependency
>   list of the target, which allow to rebuild the target when xen-syms
>   changes. But if "xen-syms" is missing, make simply fails.
> - modinfo.o wasn't removing it's $@.bin file like the other targets,
>   this is now done.
> - The command to build *.livepatch targets as been fixed to use
>   $(XEN_LDFLAGS) rather than just $(LDFLAGS) which is a fallout from
>   2740d96efdd3 ("xen/build: have the root Makefile generates the
>   CFLAGS")
> 
> make will findout the dependencies of the *.livepatch files and thus
> what to built by "looking" at the objects listed in the *-objs
> variables. The actual dependencies is generated by the new
> "multi-depend" macro.
> 
> "$(targets)" needs to be updated with the objects listed in the
> different *-objs variables to allow make to load the .*.cmd dependency
> files.
> 
> This patch copies the macro "multi_depend" from Linux 5.12, and rename
> it to "multi-depend".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> Notes:
>     v9:
>     - half acked, still need "livepatch" maintainer ack.
>     
>     v8:
>     - rename multi_depend to multi-depend
>     - use $() for single-letter make variable
>     - re-indent one line
> 
>  xen/scripts/Kbuild.include  |   9 ++
>  xen/test/livepatch/Makefile | 213 ++++++++++++++----------------------
>  2 files changed, 91 insertions(+), 131 deletions(-)

-- 
Anthony PERARD

