Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC5A5DFC5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 16:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910478.1317186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsNfx-0002ui-NP; Wed, 12 Mar 2025 15:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910478.1317186; Wed, 12 Mar 2025 15:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsNfx-0002sC-KD; Wed, 12 Mar 2025 15:07:17 +0000
Received: by outflank-mailman (input) for mailman id 910478;
 Wed, 12 Mar 2025 15:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrFP=V7=bounce.vates.tech=bounce-md_30504962.67d1a320.v1-e855c459a2c24d428b98e5cc6ba39a68@srs-se1.protection.inumbo.net>)
 id 1tsNfv-0002s6-Jx
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 15:07:15 +0000
Received: from mail128-10.atl41.mandrillapp.com
 (mail128-10.atl41.mandrillapp.com [198.2.128.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8c281d-ff53-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 16:07:13 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-10.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZCYrc0bcxzLfHGyc
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 15:07:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e855c459a2c24d428b98e5cc6ba39a68; Wed, 12 Mar 2025 15:07:12 +0000
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
X-Inumbo-ID: ad8c281d-ff53-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741792032; x=1742062032;
	bh=27GbLBCunkOi+rXsnGWTqOFKKegb9TBg0JutHIAllHc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ek4yJUR+VamcfeK+gwHtNgjr/XGQ5U0dJnanTHxJJxUIhlaqiKA6DNSYZ5bfIftH2
	 ioyyaq+7+wQYLvxJWzpIGGLJ/mZBFmVG1c5iQI0NpsNzCtL4r918GSB7KbhTGK99Y6
	 QQMyIege95m2Xd5XPcJKx+t+ve+1nWjIEAEtKHj1xUupGDCcE0bkxBo6bHIVEGBRoJ
	 Mxy6YYjASgZb3rOiLYeTRSII0cluzxeAjJaQHmVz18QItogxVP5FVoOC4ff6Tu2gVw
	 47KjP7g4sMUthjDLPFwoAYYMBjP5eRZn1dCCdFoWtmTs7Ai7n0EbUCK8di7U0Dle2e
	 X5UdLdXfu0IAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741792032; x=1742052532; i=anthony.perard@vates.tech;
	bh=27GbLBCunkOi+rXsnGWTqOFKKegb9TBg0JutHIAllHc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VHsvaWYb/25GrjbIhkmENNtYeUaMiXHIokN+hhPfvQT+D9KwVZHvqMya37/cIEVuV
	 +/jqn3IfJ3hTki+9K1sT2xsqrX0Ez2u/5mffB50/yN798rrngh9Z8+Eck4tfBwcmC9
	 ritKkqlda77LRcclnRYCC0hViImEzQHywDfkJw+6FBVy9+6v4zgqTj0TrgI1gzE+yP
	 ytcWxBkW1bZ7mUh0XVg8FyTIHBUNoMZ5hVcbXNfCGASpA3PCX36ncbpoIeWnHyz819
	 VtvOQuVosTeyBeyOA741z3WGeNaexO1n6fbkO5wqzBlF2b9aXgI64ZG1fe4D74P+dH
	 1f6URDJu1prKA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=201/1]=20tools/libxl:=20search=20PATH=20for=20QEMU=20if=20`QEMU=5FXEN=5FPATH`=20is=20not=20absolute?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741792029520
To: Hongbo <hehongbo@mail.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z9GjHDWz4qP8-6Bz@l14>
References: <20241223031753.13709-1-hehongbo@mail.com>
In-Reply-To: <20241223031753.13709-1-hehongbo@mail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e855c459a2c24d428b98e5cc6ba39a68?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250312:md
Date: Wed, 12 Mar 2025 15:07:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Dec 23, 2024 at 11:17:53AM +0800, Hongbo wrote:
> `QEMU_XEN_PATH` will be configured as `qemu-system-i386` with no clue where, if
> `--with-system-qemu` is set without giving a path (as matched in the case `yes`
> but not `*`). However, the existence of the executable is checked by `access()`,
> that will not look for anywhere in $PATH but the current directory. And since it
> is possible for `qemu-system-i386` (or any other configured values) to be
> executed from PATH later, we'd better find that in PATH and return the full path
> for the caller to check against.
> 
> Signed-off-by: Hongbo <hehongbo@mail.com>
> 
> ---
> 
> This patch is from the maintenance team of the Xen Project Hypervisor at NixOS.
> We encountered this and thought it was an edge case, and came up with this while
> maintaining the package and module of the Hypervisor at NixOS.
> 
> According to `xen.git/tools/configure.ac`, `QEMU_XEN_PATH` will be configured as
> `qemu-system-i386` (relative) if `--with-system-qemu` is set (as `yes`) but
> without an absolute path. However, it will execute `qemu-system-i386` from the
> `PATH` only if a file is called `qemu-system-i386` in the *current directory*.
> That is because the existence of the device model executable file, in this case
> `qemu-system-i386`, is checked via `access()` without concatenating it with
> current PATHs. And `access()` is not tailored for executables, it will not
> search for the PATHs for us.
> 
> See `libxl__domain_build_info_setdefault()` at
> `xen.git/tools/libs/light/libxl_create.c`. It reads `dm` from
> `libxl__domain_device_model()` and then uses `access()` on it. If that fails, it
> will modify the `device_model_version` to qemu-traditional. Then, in
> `libxl__spawn_local_dm()` at `xen.git/tools/lib/light/libxl_dm.c`, it reads from
> `libxl__domain_device_model()` again, and `access()` is used again to detect the
> file's existence. In my investigations, if I comment out these 2 existence
> checks then it will run `qemu-system-i386` from the current PATH without issues.
> I guess if it's not blocked by those 2 checks, it will finally reach
> `libxl__exec()`. Then, inside the `libxl__exec()` the device model executable
> will be executed by `execvp()`, which can certainly call the executable from
> both absolute paths and current PATHs.
> 
> Since the device model executable will be checked twice, both of which will call
> `libxl__domain_device_model()` to get its location, I think the preferred
> solution would be patching the `libxl__domain_device_model()` function itself to
> tell if we're referring to an executable in PATHs, and resolve to the full path
> of it for the caller to check against.
> 
> It's indeed an edge case. But why would we need this? Because in Nix (the
> package manager) and NixOS, we use Nix expressions to declare dependencies on
> the dependents, and we ran into the issue of circular dependency - to build
> QEMU with Xen support, we should give the Xen header and libraries into the
> building process of QEMU, that makes Xen (`pkgs.xen`) a dependency of QEMU
> (`pkgs.qemu_xen`), which prevents us from using `pkgs.qemu_xen` in the building
> process of Xen, and in `--with-system-qemu=` argument in particular. It is very
> different compared to those distros and package managers that follow the
> Filesystem Hierarchy Standard (FHS), in which Xen can be built with
> `--with-system-qemu=` points to a non-existent FHS location of
> `qemu-system-i386`, and then use these Xen libraries from the artifacts to build
> QEMU afterward. So we decide to build Xen with `--with-system-qemu` but not
> including an executable path, taking advantage of the fact that `QEMU_XEN_PATH`
> can be configured as a relative `qemu-system-i386` when omitted, as declared as
> the `yes` case in `xen.git/tools/configure.ac`, and that results in we finding
> the aforementioned "current directory" issue, and submitting this patch.

Thanks. Sounds good, and also the feature seems half-way there already
with the default to a binary name and the use of execvp. The patch looks
mostly fine, I still have a few comments.

> In the patch, I'm using the existence of slash (`/`) to tell if `QEMU_XEN_PATH`
> is relative, and begin to search in PATH if it is. I'm sort of iffy on this,
> would it make more sense if we do this on inputs starting with a slash instead?
> And should we notify the user if it's not found anywhere in the PATH thus
> proceeding with the value configured in `QEMU_XEN_PATH` as-is?

Well, on one hand, that's how execvp() works, if there's a '/' in the
path, search in $PATH is skipped. But that would be a buggy scenario
because when you reboot a guest, the working directory isn't the same
anymore, at least with `xl`. So if `pwd`/dir/qemu-dm exist when you
execute `xl create`, but then run `reboot` in a guest, there's an "xl
daemon" that would try to reboot the guest with /dir/qemu-dm because
`pwd` would be just /.

So I think checking that QEMU_XEN_PATH is absolute would be enough here.

> Let me know if it's appropriate and if further changes are needed.
> 
> Best regards,
> Hongbo
> 
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/light/libxl_dm.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 1f2f5bd97a..db05f20a5b 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -332,7 +332,39 @@ const char *libxl__domain_device_model(libxl__gc *gc,
>              dm = libxl__abs_path(gc, "qemu-dm", libxl__private_bindir_path());
>              break;
>          case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
> -            dm = qemu_xen_path(gc);
> +            const char *configured_dm = qemu_xen_path(gc);

Here, `clang` complained about that new variable, it expect an
expression. Can you put the "case" in a block {} ?

> +            if (strchr(configured_dm, '/'))

As discuste before, just checking for absolute path should be good
enough here.

> +                dm = libxl__strdup(gc, configured_dm);

The function used to return the value from qemu_xen_path(gc), so you can
keep returning `configured_dm`, no need for an strdup, here or the two
other strdup(configured_dm) below.

Also as the `else` part have a block {}, it would be better to have a
block {} for the "true" part of the `if` as well.


> +            else
> +            {
> +                const char *path_env = getenv("PATH");
> +                if (!path_env)
> +                    dm = libxl__strdup(gc, configured_dm);
> +                else
> +                {
> +                    char *path_dup = libxl__strdup(gc, path_env);
> +                    char *saveptr;
> +
> +                    char *path = strtok_r(path_dup, ":", &saveptr);
> +                    char fullpath[PATH_MAX];
> +                    bool dm_found = false;
> +                    while (path)
> +                    {
> +                        snprintf(fullpath, sizeof(fullpath), "%s/%s", path,
> +                                 configured_dm);
> +                        if (access(fullpath, X_OK) == 0)
> +                        {
> +                            dm = libxl__strdup(gc, fullpath);
> +                            dm_found = true;
> +                            break;
> +                        }
> +                        path = strtok_r(NULL, ":", &saveptr);
> +                    }
> +
> +                    if (!dm_found)
> +                        dm = libxl__strdup(gc, configured_dm);
> +                }
> +            }
>              break;
>          default:
>              LOG(ERROR, "invalid device model version %d",

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

