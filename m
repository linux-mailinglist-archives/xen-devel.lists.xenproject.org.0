Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BA51458A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317090.536260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN6M-0007V3-Jw; Fri, 29 Apr 2022 09:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317090.536260; Fri, 29 Apr 2022 09:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN6M-0007SQ-Fa; Fri, 29 Apr 2022 09:39:50 +0000
Received: by outflank-mailman (input) for mailman id 317090;
 Fri, 29 Apr 2022 09:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxz=VH=citrix.com=prvs=111f028e5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nkN6K-0007SI-SA
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:39:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48bce012-c7a0-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 11:39:39 +0200 (CEST)
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
X-Inumbo-ID: 48bce012-c7a0-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651225187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qx15oLQAIXPIdeDCoSNYEx2nHBETrR/0j/6F2fxLnUg=;
  b=I8ugoRzR6LH9i2pk48WzSfGGYeBxkJ3i6ur8ZLzsw3ZrivTxL2/3q1aM
   3NKKSUQHXYTMq1bD3+tT3njnoMshA96CVy9SK114uXWWz5SNgZ6DQPl16
   T4Ui+WRK3gBm8MSL4mXVIyqrq793jUm4QL/bCpklrNKpUvbLB+efNr39D
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70623567
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MTDrL6qzqn5F3Vx/BHhkLg9e/ZxeBmJkZRIvgKrLsJaIsI4StFCzt
 garIBmFPayLY2D0KN5wbIjn8kIFuJWHn9EyHgJtqXg2QngX9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvR4
 4Kq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHKncx+dGXkZhCiR5Pb9gxLiafnehiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIwNEqaOEARZT/7DrocoNm2qF2ibwdGl1GbuvQK01X8/Cp+he2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTrPm0jw2uVtR3L
 hEMvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l6K7EvAXCCzc9VztGaM4AiMhrGjM07
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2rSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeR4wapxdIGSzO
 RK7VeZtCHl7ZSrCgUhfOd/ZNijX5fK4SYSNug78M7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lurUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWP3eHrNZPfQxbRZX5bLivw/Fqmie4ClIOMAkc5zX5mOpJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:EVz1BakhcloPqgbXspYuotM4LNzpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70623567"
Date: Fri, 29 Apr 2022 10:39:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools/xl: Sort create command options
Message-ID: <YmuyT0/8Mfa0eM1b@perard.uk.xensource.com>
References: <cover.1650422517.git.ehem+xen@m5p.com>
 <c145a7648025e9bbc2f47ab8bd5839c80c01933f.1650422518.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c145a7648025e9bbc2f47ab8bd5839c80c01933f.1650422518.git.ehem+xen@m5p.com>

On Tue, Apr 19, 2022 at 06:56:03PM -0700, Elliott Mitchell wrote:
> Hopefully simplify future changes by sorting options lists for
> `xl create`.

I'm not sure that sorting options make changes easier, as it would mean
one has to make sure the new option is sorted as well ;-). But sorting
the options in the help message is probably useful; I've looked at a few
linux utilities and they tend to have them sorted so doing this for xl
create sound fine.

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 435155a033..2ec4140258 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1169,13 +1169,13 @@ int main_create(int argc, char **argv)
>      int paused = 0, debug = 0, daemonize = 1, console_autoconnect = 0,
>          quiet = 0, monitor = 1, vnc = 0, vncautopass = 0, ignore_masks = 0;
>      int opt, rc;
> -    static struct option opts[] = {
> +    static const struct option opts[] = {

Could you add a note in the commit message that "opts" is now
const?

> +        {"defconfig", 1, 0, 'f'},
>          {"dryrun", 0, 0, 'n'},
> +        {"ignore-global-affinity-masks", 0, 0, 'i'},
>          {"quiet", 0, 0, 'q'},
> -        {"defconfig", 1, 0, 'f'},
>          {"vncviewer", 0, 0, 'V'},
>          {"vncviewer-autopass", 0, 0, 'A'},
> -        {"ignore-global-affinity-masks", 0, 0, 'i'},
>          COMMON_LONG_OPTS
>      };
>  
> @@ -1186,12 +1186,15 @@ int main_create(int argc, char **argv)
>          argc--; argv++;
>      }
>  
> -    SWITCH_FOREACH_OPT(opt, "Fnqf:pcdeVAi", opts, "create", 0) {
> -    case 'f':
> -        filename = optarg;
> +    SWITCH_FOREACH_OPT(opt, "Ffnq:AVcdeip", opts, "create", 0) {

The list of short options aren't really sorted here. Also -q doesn't
take an argument, but -f should keep requiring one.

Thanks,


-- 
Anthony PERARD

