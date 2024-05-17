Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C98C7FD6
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 04:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723768.1128827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7nCW-00021N-KT; Fri, 17 May 2024 02:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723768.1128827; Fri, 17 May 2024 02:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7nCW-0001xP-Hf; Fri, 17 May 2024 02:20:04 +0000
Received: by outflank-mailman (input) for mailman id 723768;
 Fri, 17 May 2024 02:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZ95=MU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s7nCU-0001dU-UD
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 02:20:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f74a1f8a-13f3-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 04:20:02 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so4150020a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 19:20:02 -0700 (PDT)
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
X-Inumbo-ID: f74a1f8a-13f3-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715912401; x=1716517201; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13/tEnsX00az+Z78WeQi1Ma/WwplAv72LsKUOMKIlZY=;
        b=cpRWHl3JLxWcfG+BK0k1eMp8n0QBx8JISWf1MtnST0FH5Bif2/a4LP49B2Rgrr+2bs
         kjPxxAyFzTwcBjAm+cxxRMVSbO8cN/i/rFQX7ImQ+je0ifYiJbkjN/b6skdXUt9+MJrG
         hL7clAmSXFKdxO4YKSxIEjlOGM5sG03q7N2xnZAjHFUUKhGn2vTZcjER6WyjAmosnjtB
         JdBjzB/XYFdCs+vOWzKuudhrQ3ey3m4uH/FQFn4lZVhIed7d6O+xE7S4UX1BeTMxkZcZ
         xrOCq4PjBdTuN8YOTaFt3n3sVefuBNN6gZBxgT6MHJRXVEfhLTfsVV03MkJ9VbnhrDnt
         RZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715912401; x=1716517201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13/tEnsX00az+Z78WeQi1Ma/WwplAv72LsKUOMKIlZY=;
        b=bpTaHy82lha02hYiaujGIFqmvF3Fi2E5BwpbsE49LmU3N3ntFuxnI+0rLU2mOAHp5a
         W9lZ8T8xq1Xf5vx2xMzcF/Mr2CQBqYYXFWh+TPwyN0ltMCJ13G6Gy225ySJ717fMRRq8
         TC71O3kg/2SIpUEt+aQv6W9i1eswUZdoCKedspUh2tk9Y6TTcg4FzSRDGWPhk0Ot6d3B
         mXq7hlS/sJr+3UzsB5UPinDicW77YUldCAlu6B1qAItx8kkyK1wl8oFNKQgp0Wer16ab
         0i4o3LgrGk1jlHe41JM+t2+2MMb46yYteh5btYvLRi2V1WyE7R4IiNC6GnR89hwrgJfO
         N+hA==
X-Gm-Message-State: AOJu0YzQTFtHUQrsoimI/bnX9PSrNjquGaJIeJrzhY+5KGL/YInXrz2Y
	AZr49v7zYwG4qn1R6Wn8/+H7EygtuWesmqoswxADOfIIXQNOEP+yXTEpaRs4vEOdOxQzgtoFpMd
	yIj4wkx8geMIBOQOqNV2lxLrwKk4=
X-Google-Smtp-Source: AGHT+IFQhIrAP4kf4JQCCdSWLCRSARgpMDd/QyLTW7I0F455I8yRy5zLbZOHaU9gy0Ej/s2Gfm34+r7+QV6Lu4XZirQ=
X-Received: by 2002:a50:c049:0:b0:574:ebdd:9ab6 with SMTP id
 4fb4d7f45d1cf-574ebdd9c5emr10676238a12.6.1715912401293; Thu, 16 May 2024
 19:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240516105612.15306-1-leigh@solinno.co.uk> <20240516105612.15306-4-leigh@solinno.co.uk>
In-Reply-To: <20240516105612.15306-4-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 16 May 2024 22:19:49 -0400
Message-ID: <CAKf6xpvX2T3xhx59b0_X3e+9BpYuMZS84P=ghisZFD3yWsFssw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] tools/hotplug/Linux: Add bridge VLAN support
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 6:56=E2=80=AFAM Leigh Brown <leigh@solinno.co.uk> w=
rote:
>
> Update add_to_bridge shell function to read the vlan parameter from
> xenstore and set the bridge VLAN configuration for the VID.
>
> Add additional helper functions to parse the vlan specification,
> which consists of one or more of the following:
>
> a) single VLAN (e.g. 10).
> b) contiguous range of VLANs (e.g. 10-15).
> c) discontiguous range with base, increment and count
>    (e.g. 100+10x9 which gives VLAN IDs 100, 110, ... 190).
>
> A single VLAN can be suffixed with "p" to indicate the PVID, or
> "u" to indicate untagged. A range of VLANs can be suffixed with
> "u" to indicate untagged.  A complex example would be:
>
>    vlan=3D1p/10-15/20-25u
>
> This capability requires the iproute2 bridge command to be
> installed.  An error will be generated if the vlan parameter is
> set and the bridge command is not available.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>
> ---
>  tools/hotplug/Linux/xen-network-common.sh | 103 ++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Li=
nux/xen-network-common.sh
> index 42fa704e8d..fa7615ce0f 100644
> --- a/tools/hotplug/Linux/xen-network-common.sh
> +++ b/tools/hotplug/Linux/xen-network-common.sh

> +_vif_vlan_setup() {
> +    # References vlans and dev variable from the calling function
> +    local vid cmd
> +
> +    bridge vlan del dev "$dev" vid 1

Is vid 1 always added, so you need to remove it before customizing?

> +    for vid in ${!vlans[@]} ;do
> +        cmd=3D"bridge vlan add dev '$dev' vid $vid"
> +        case ${vlans[$vid]} in
> +             p) cmd=3D"$cmd pvid untagged" ;;
> +             u) cmd=3D"$cmd untagged" ;;
> +             t) ;;
> +        esac
> +        eval "$cmd"

Sorry if I missed this last time, but `eval` shouldn't be necessary.

        local args

        case ${vlans[$vid]} in
             p) args=3D"pvid untagged" ;;
             u) args=3D"untagged" ;;
             t) ;;
        esac
        bridge vlan add dev "$dev" vid "$vid" $args

args unquoted so it expands into maybe two args.  You could also make
args an array and do "${args[@]}"

> +    done
> +}
> +
> +_vif_vlan_membership() {
> +    # The vlans, pvid and dev variables are used by sub-functions
> +    local -A vlans=3D()
> +    local -a terms=3D()
> +    local -i i pvid=3D0
> +    local dev=3D$1
> +
> +    # Split the vlan specification string into its terms
> +    readarray -d / -t terms <<<$2
> +    for (( i=3D0; i<${#terms[@]}; ++i )) ;do
> +        _vif_vlan_parse_term ${terms[$i]%%[[:space:]]}

Because terms is not in double quotes, wouldn't it expand out?  Then
any whitespace would be dropped when calling _vif_vlan_parse_term.
Your %% only drops trailing spaces too.  Maybe you want
"${terms//[[:space:]]/}" to remove all spaces?

Stylistically, you use (( )) more than I would.  I'd do:

local term
for term in "${terms[@]}" ; do
     _vif_vlan_parse_term "$term"

But you can keep it your way if you prefer.

Regards,
Jason

