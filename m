Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515FD8C5E7B
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 02:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721842.1125519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s72xM-0004J9-UU; Wed, 15 May 2024 00:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721842.1125519; Wed, 15 May 2024 00:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s72xM-0004Hk-R6; Wed, 15 May 2024 00:57:20 +0000
Received: by outflank-mailman (input) for mailman id 721842;
 Wed, 15 May 2024 00:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DUSJ=MS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s72xL-0004He-Go
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 00:57:19 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139ede97-1256-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 02:57:18 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so1099843a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 17:57:18 -0700 (PDT)
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
X-Inumbo-ID: 139ede97-1256-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715734637; x=1716339437; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgKeQCtSGXMOTtoEpL9MupCi/snafMG2ArhxtXmZLco=;
        b=ngJ3O788aO7Khdj9qPS0th7eRL3r5eVpDrkfq9Rjrz3OT7N22XHN74zLhWQzMisrtX
         PoIsfepri+NnR0ai5EapA/5yA3LFgqPu6GYk4H5BuDmH23LMShTnF6tBAe9yabg5BIO7
         VVxSEz7iyHoaWMjHCd/SX9hhlAhXOeQ+8LpmjFfY4gnNu1gv5iQE2W6ywviO9IKa+/cW
         pNfOQ9khesja+BWQrrkh+5O6en5hjVnTgbp2PsnGs/xrVrVrqL4Nzw82A9Ts3799SS1r
         1mVfsaFfXB6aT179s1o17DMSPZM/dhT4OdHh+h61SyJnLaFQUJSDWT520RE+3SZQyKzi
         SkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715734637; x=1716339437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgKeQCtSGXMOTtoEpL9MupCi/snafMG2ArhxtXmZLco=;
        b=vka1wDiXGIEPaPRGnTNNvLh7cxfNdxfYOSHW/tN03BceuTNLUVLSbqHQ0pclibt29o
         CeIFx2I+1jZmjkScNJe8fIvGNcqqNSgxnLdAgJAxJlQOa+6lWH9KlLFpDTjsqG9gLsIv
         hxmL/X8Hze72GABriHA+OXslpEsblcY9q4mmYDshYZ3Z+G0D2eNP7rLX1B/Hyh2oLn+k
         HKjRCMQr8atyFcUZbt7wgKi2hX/SZgBLFxWM54dX/tvEuOYY/l+RhGH25xjkb015NrOs
         G/ZIwuk1FR1to1yuSbmjKLLHZh7AlrRfUduFRYLUuHP1NbUG19hgEHUSiflgX2DoWcFT
         6eYA==
X-Gm-Message-State: AOJu0YyuXRY36eQfdXl+bxSWjoqGYFUx9rvIt343W+tOuIQ9vk/TKeY8
	pciR450SvuOsdsfq5OXdtMHoZ9Bmzfs4xvUvzh0Iw91/AA+Tlt11BQLXBvL3/43pKN8eAjgSGE1
	0YMs6vw7ou88OQnmoUK2rJHZObvhKIMie
X-Google-Smtp-Source: AGHT+IGtWA2CGE+sxULYJnuwa46PUC7MelEpKWom0NOkGcnLQHu4VCLUvA9ib8yUsb/t9fmIGkjfYgMQ96W5z+ZXB/U=
X-Received: by 2002:a50:d5ca:0:b0:572:a4eb:6682 with SMTP id
 4fb4d7f45d1cf-5734d6b1f9amr9772610a12.30.1715734637044; Tue, 14 May 2024
 17:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240508213824.55824-1-leigh@solinno.co.uk> <20240508213824.55824-4-leigh@solinno.co.uk>
In-Reply-To: <20240508213824.55824-4-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 May 2024 20:57:05 -0400
Message-ID: <CAKf6xpuNJbf2ioVFyvu2L6YG2_eNRbqPF8tn7Yodyv5UA4uE6A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] tools/hotplug/Linux: Add bridge VLAN support
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 6:55=E2=80=AFPM Leigh Brown <leigh@solinno.co.uk> wr=
ote:
>
> Update add_to_bridge shell function to read the vlan parameter
> from xenstore and set the bridge VLAN configuration for the VID.
>
> Add additional helper functions to parse the vlan specification,
> which consists of one or more of the follow:
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
> This capability only works when using the iproute2 bridge command,
> so a warning is issued if the vlan parameter is set and the bridge
> command is not available, as it will be ignored.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> ---
>  tools/hotplug/Linux/xen-network-common.sh | 111 ++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>
> diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Li=
nux/xen-network-common.sh
> index 42fa704e8d..d9fb4f7355 100644
> --- a/tools/hotplug/Linux/xen-network-common.sh
> +++ b/tools/hotplug/Linux/xen-network-common.sh
> @@ -121,10 +121,113 @@ create_bridge () {
>      fi
>  }
>
> +_vif_vlan_add() {
> +    # References vlans, pvid and error variables from the calling functi=
on
> +    local -i vid=3D$1
> +    local flag=3D${2:-}
> +
> +    if (( vid < 1 || vid > 4094 )) ;then
> +        error=3D"vlan id $vid not between 1 and 4094"
> +        return
> +    fi
> +    if [[ -n "${vlans[$vid]}" ]] ;then
> +        error=3D"vlan id $vid specified more than once"
> +        return

You could do `fatal "vlan id $vid specified more than once"` and just
terminate the script at this point.  It would simplify your later code
if you use fatal more.

> +    fi
> +    case $flag in
> +     p) if (( pvid !=3D 0 )) ;then
> +            error=3D"more than one pvid specified ($vid and $pvid)"
> +            return
> +        fi
> +        pvid=3D$vid
> +        vlans[$vid]=3Dp ;;
> +     u) vlans[$vid]=3Du ;;
> +     *) vlans[$vid]=3Dt ;;
> +    esac
> +}
> +
> +_vif_vlan_parse_term() {
> +    # References error variable from the calling function
> +    local vid incr last term=3D${1:-}
> +
> +    if [[ $term =3D~ ^([0-9]+)([pu])?$ ]] ;then

I like that you split the different cases into multiple REs.

> +        _vif_vlan_add ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
> +    elif [[ $term =3D~ ^([0-9]+)-([0-9]+)(u)?$ ]] ;then
> +        vid=3D${BASH_REMATCH[1]}
> +        last=3D${BASH_REMATCH[2]}
> +        if (( last >=3D vid )) ;then
> +            for (( ; vid<=3Dlast; vid++ )) ;do
> +                _vif_vlan_add $vid ${BASH_REMATCH[3]}
> +            done
> +        else
> +           error=3D"invalid vlan id range: $term"
> +        fi
> +    elif [[ $term =3D~ ^([0-9]+)\+([0-9]+)x([0-9]+)(u)?$ ]] ;then
> +        vid=3D${BASH_REMATCH[1]}
> +        incr=3D${BASH_REMATCH[2]}
> +        for (( j=3D${BASH_REMATCH[3]}; j>0; --j, vid+=3Dincr ))
> +        do
> +            _vif_vlan_add $vid ${BASH_REMATCH[4]}
> +        done
> +    else
> +        error=3D"invalid vlan specification: $term"
> +    fi
> +}
> +
> +_vif_vlan_validate_pvid() {
> +    # References vlans and pvid variables from the calling function
> +    if (( pvid =3D=3D 0 )) ;then
> +        if (( ${#vlans[@]} =3D=3D 1 )) ;then
> +            vlans[${!vlans[*]}]=3Dp
> +        else
> +            error=3D"pvid required for multiple vlan ids"
> +        fi
> +    fi
> +}
> +
> +_vif_vlan_setup() {
> +    # References vlans and dev variable from the calling function
> +    local vid cmd
> +
> +    bridge vlan del dev "$dev" vid 1
> +    for vid in ${!vlans[@]} ;do
> +        cmd=3D"bridge vlan add dev '$dev' vid $vid"
> +        case ${vlans[$vid]} in
> +             p) cmd=3D"$cmd pvid untagged" ;;
> +             u) cmd=3D"$cmd untagged" ;;
> +             t) ;;
> +        esac
> +        eval "$cmd"
> +    done
> +}
> +
> +_vif_vlan_membership() {
> +    # The vlans, pvid, dev and error variables are used by sub-functions
> +    local -A vlans=3D()
> +    local -a terms=3D()
> +    local -i i pvid=3D0
> +    local dev=3D$1 error=3D""
> +
> +    # Split the vlan specification string into its terms
> +    readarray -d / -t terms <<<$2
> +    for (( i=3D0; i<${#terms[@]}; ++i )) ;do
> +        _vif_vlan_parse_term ${terms[$i]%%[[:space:]]}
> +        [[ -n "$error" ]] && break
> +    done
> +
> +    [[ -z "$error" ]] && _vif_vlan_validate_pvid
> +    [[ -z "$error" ]] && _vif_vlan_setup
> +    [[ -z "$error" ]] && return 0
> +
> +    log error "$error"
> +    return 1
> +}
> +
>  # Usage: add_to_bridge bridge dev
>  add_to_bridge () {
>      local bridge=3D$1
>      local dev=3D$2
> +    local vlan=3D$(xenstore_read_default "$XENBUS_PATH/vlan" "")
>
>      # Don't add $dev to $bridge if it's already on the bridge.
>      if [ ! -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
> @@ -134,6 +237,14 @@ add_to_bridge () {
>          else
>              ip link set ${dev} master ${bridge}
>          fi
> +        if [ -n "${vlan}" ] ;then
> +            if which bridge >&/dev/null; then
> +                log debug "configuring VLANs for ${dev} on ${bridge}"
> +                _vif_vlan_membership "${dev}" "${vlan}"
> +            else
> +                log warning "bridge command not available, ignoring vlan=
 config"

Do you think this should be fatal?  It seems to me that setting up the
connection but not applying the vlans could be a security issue.

This file before your patch was very close to posix sh.  Afterwards,
it definitely needs bash.  vif-bridge is /bin/bash, so it is fine.

Regards,
Jason

