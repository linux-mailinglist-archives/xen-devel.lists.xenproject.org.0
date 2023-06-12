Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609772BF56
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546988.854133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ez4-0003nb-6I; Mon, 12 Jun 2023 10:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546988.854133; Mon, 12 Jun 2023 10:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ez4-0003kv-3G; Mon, 12 Jun 2023 10:41:14 +0000
Received: by outflank-mailman (input) for mailman id 546988;
 Mon, 12 Jun 2023 10:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COfM=CA=citrix.com=prvs=5202ad488=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q8ez3-0003kp-I0
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:41:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3eabaa1-090d-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 12:41:10 +0200 (CEST)
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
X-Inumbo-ID: a3eabaa1-090d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686566470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nEetswxUePN3M2K8xNdmA+3YEAsM8rCQOOG8Dw6F+fI=;
  b=APt9ie0sanDV+F4mBFfIoPuQJttmi+RLJ++jV19vVkzgwKYhD54vJnBL
   Ro+eTzjcfnpyBdJd2bsSDB25LXN2H25tW6xgs0mM5Ox+aG8W2+GYYewQ2
   UjJec+jodfoHzj4JKEmIjNetwFQdzymZZgMPFImuFLq6LUQoh3ihqZRHJ
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111192826
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6EQORqNF66qYRlDvrR2vl8FynXyQoLVcMsEvi/4bfWQNrUor1mEPn
 TcbWTqOb6uPZmDzLdt+Ody0/R9Q6JHXmIJhGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vdHClx03
 NgeFBQudDyCo++P3e6fFfY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHJwExBbC+
 Aoq+UzZGDgGK8TCygGH/27vnMbJ2gD8A7IrQejQGvlC3wTImz175ActfVy/qPeRg0OmVdZSb
 UAZkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yxmdLngJSHhGctNOnMYuSCYjz
 FOhg9LjDjspu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bnyLEc+xKNKiJqv7vNTDUz
 gmX8AxhmOBG5SIU7JlX7Wwrkhr1+MiXFF5uvVSKNo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28zaK7ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKPoQTOsgtLF7foH8GiausM4fFyhFErE3CE
 c3DLZbE4YgyVMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcys8JELKLfYc1AO9aNII6a5/I7NsrdNx8x9/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:IWtqNaxUH/nGjT7My5zeKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-Talos-CUID: 9a23:m2SK9m7AUXfxxbAxG9ss5X4fJ/oMVnvh6FTKD06cBF90FJnKVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ANJHxtQzxJpbd5BTGZzMo3eYO8rOaqIS0IVwSicg?=
 =?us-ascii?q?FgMuJKW9qEjHarzPscrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111192826"
Date: Mon, 12 Jun 2023 11:40:55 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: fix make rpmball
Message-ID: <6734a258-3396-4641-b9bf-edf6193a8095@perard>
References: <20230530111807.6521-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230530111807.6521-1-olaf@aepfle.de>

On Tue, May 30, 2023 at 01:18:07PM +0200, Olaf Hering wrote:
> Commit 438c5ffa44e99cceb574c0f9946aacacdedd2952 ("rpmball: Adjust to
> new rpm, do not require --force") attempted to handle stricter
> directory permissions in newer distributions.
> 
> This introduced a few issues:
> - /boot used to be a constant prior commit
>   6475d700055fa952f7671cee982a23de2f5e4a7c ("use BOOT_DIR as xen.gz
>   install location"), since this commit the location has to be
>   referenced via ${BOOT_DIR}
> - it assumed the prefix and the various configurable paths match the
>   glob pattern /*/*/*
> 
> Adjust the code to build a filelist on demand and filter directories
> from an installed filesystem.rpm.
> 
> Take the opportunity to replace the usage of $RPM_BUILD_ROOT with
> %buildroot, and use pushd/popd pairs.
> 
> Fixes: 438c5ffa4 ("rpmball: Adjust to new rpm, do not require --force")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/misc/mkrpm | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
> index 74f6761bb0..a7bf854197 100644
> --- a/tools/misc/mkrpm
> +++ b/tools/misc/mkrpm
> @@ -50,20 +50,35 @@ uninstall.
>  %build
>  
>  %install
> -rm -rf \$RPM_BUILD_ROOT
> -mkdir -p \$RPM_BUILD_ROOT
> -cd %{_xenroot}
> -dist/install.sh \$RPM_BUILD_ROOT/
> +rm -rf %buildroot
> +mkdir -p %buildroot
> +pushd %_xenroot
> +dist/install.sh %buildroot
> +
> +pushd %buildroot
> +popd

Are these 2 lines left over from testing? They don't appear to do
anything useful.


Beside that, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,
-- 
Anthony PERARD

