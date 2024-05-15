Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E48C69BE
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722505.1126550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GZi-0005tl-L1; Wed, 15 May 2024 15:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722505.1126550; Wed, 15 May 2024 15:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GZi-0005ri-Hx; Wed, 15 May 2024 15:29:50 +0000
Received: by outflank-mailman (input) for mailman id 722505;
 Wed, 15 May 2024 15:29:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1aeg=MS=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7GZg-0005Yo-1q
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:29:48 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f59a0cc7-12cf-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:29:46 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 86BB580068;
 Wed, 15 May 2024 16:29:45 +0100 (BST)
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
X-Inumbo-ID: f59a0cc7-12cf-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715786985;
	bh=nja7hs+1Fl4A9h1PMkBe/mv1CUxj2LF9liD70bT+zlA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OS9z4LABvhs1zpA3tPsN8Pv0YXdJsg8wiLF9/ooaiaDBYxf6EzvgU3zBvA1xl4KVG
	 n3PR8+/Nfj9B7FtuWKAAGMSjpPEGb10inZSjKFhHSTKObMsBCBmfYopj0gQPyInaSg
	 iKPWYINh7cVZ2YZSDtYZt0/yqV1eO4sYBv3CRWds=
MIME-Version: 1.0
Date: Wed, 15 May 2024 16:29:45 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@citrix.com
Subject: Re: [RFC PATCH v2 3/5] tools/hotplug/Linux: Add bridge VLAN support
In-Reply-To: <CAKf6xpuNJbf2ioVFyvu2L6YG2_eNRbqPF8tn7Yodyv5UA4uE6A@mail.gmail.com>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
 <20240508213824.55824-4-leigh@solinno.co.uk>
 <CAKf6xpuNJbf2ioVFyvu2L6YG2_eNRbqPF8tn7Yodyv5UA4uE6A@mail.gmail.com>
Message-ID: <f7a94db1deb1c3197d1f77e8e774ee53@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 2024-05-15 01:57, Jason Andryuk wrote:
> On Wed, May 8, 2024 at 6:55 PM Leigh Brown <leigh@solinno.co.uk> wrote:
>> 
>> Update add_to_bridge shell function to read the vlan parameter
>> from xenstore and set the bridge VLAN configuration for the VID.
>> 
>> Add additional helper functions to parse the vlan specification,
>> which consists of one or more of the follow:
>> 
>> a) single VLAN (e.g. 10).
>> b) contiguous range of VLANs (e.g. 10-15).
>> c) discontiguous range with base, increment and count
>>    (e.g. 100+10x9 which gives VLAN IDs 100, 110, ... 190).
>> 
>> A single VLAN can be suffixed with "p" to indicate the PVID, or
>> "u" to indicate untagged. A range of VLANs can be suffixed with
>> "u" to indicate untagged.  A complex example would be:
>> 
>>    vlan=1p/10-15/20-25u
>> 
>> This capability only works when using the iproute2 bridge command,
>> so a warning is issued if the vlan parameter is set and the bridge
>> command is not available, as it will be ignored.
>> 
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>> ---
>>  tools/hotplug/Linux/xen-network-common.sh | 111 
>> ++++++++++++++++++++++
>>  1 file changed, 111 insertions(+)
>> 
>> diff --git a/tools/hotplug/Linux/xen-network-common.sh 
>> b/tools/hotplug/Linux/xen-network-common.sh
>> index 42fa704e8d..d9fb4f7355 100644
>> --- a/tools/hotplug/Linux/xen-network-common.sh
>> +++ b/tools/hotplug/Linux/xen-network-common.sh
>> @@ -121,10 +121,113 @@ create_bridge () {
>>      fi
>>  }
>> 
>> +_vif_vlan_add() {
>> +    # References vlans, pvid and error variables from the calling 
>> function
>> +    local -i vid=$1
>> +    local flag=${2:-}
>> +
>> +    if (( vid < 1 || vid > 4094 )) ;then
>> +        error="vlan id $vid not between 1 and 4094"
>> +        return
>> +    fi
>> +    if [[ -n "${vlans[$vid]}" ]] ;then
>> +        error="vlan id $vid specified more than once"
>> +        return
> 
> You could do `fatal "vlan id $vid specified more than once"` and just
> terminate the script at this point.  It would simplify your later code
> if you use fatal more.

I will do that.

>> +    fi
>> +    case $flag in
>> +     p) if (( pvid != 0 )) ;then
>> +            error="more than one pvid specified ($vid and $pvid)"
>> +            return
>> +        fi
>> +        pvid=$vid
>> +        vlans[$vid]=p ;;
>> +     u) vlans[$vid]=u ;;
>> +     *) vlans[$vid]=t ;;
>> +    esac
>> +}
>> +
>> +_vif_vlan_parse_term() {
>> +    # References error variable from the calling function
>> +    local vid incr last term=${1:-}
>> +
>> +    if [[ $term =~ ^([0-9]+)([pu])?$ ]] ;then
> 
> I like that you split the different cases into multiple REs.
> 
>> +        _vif_vlan_add ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
>> +    elif [[ $term =~ ^([0-9]+)-([0-9]+)(u)?$ ]] ;then
>> +        vid=${BASH_REMATCH[1]}
>> +        last=${BASH_REMATCH[2]}
>> +        if (( last >= vid )) ;then
>> +            for (( ; vid<=last; vid++ )) ;do
>> +                _vif_vlan_add $vid ${BASH_REMATCH[3]}
>> +            done
>> +        else
>> +           error="invalid vlan id range: $term"
>> +        fi
>> +    elif [[ $term =~ ^([0-9]+)\+([0-9]+)x([0-9]+)(u)?$ ]] ;then
>> +        vid=${BASH_REMATCH[1]}
>> +        incr=${BASH_REMATCH[2]}
>> +        for (( j=${BASH_REMATCH[3]}; j>0; --j, vid+=incr ))
>> +        do
>> +            _vif_vlan_add $vid ${BASH_REMATCH[4]}
>> +        done
>> +    else
>> +        error="invalid vlan specification: $term"
>> +    fi
>> +}
>> +
>> +_vif_vlan_validate_pvid() {
>> +    # References vlans and pvid variables from the calling function
>> +    if (( pvid == 0 )) ;then
>> +        if (( ${#vlans[@]} == 1 )) ;then
>> +            vlans[${!vlans[*]}]=p
>> +        else
>> +            error="pvid required for multiple vlan ids"
>> +        fi
>> +    fi
>> +}
>> +
>> +_vif_vlan_setup() {
>> +    # References vlans and dev variable from the calling function
>> +    local vid cmd
>> +
>> +    bridge vlan del dev "$dev" vid 1
>> +    for vid in ${!vlans[@]} ;do
>> +        cmd="bridge vlan add dev '$dev' vid $vid"
>> +        case ${vlans[$vid]} in
>> +             p) cmd="$cmd pvid untagged" ;;
>> +             u) cmd="$cmd untagged" ;;
>> +             t) ;;
>> +        esac
>> +        eval "$cmd"
>> +    done
>> +}
>> +
>> +_vif_vlan_membership() {
>> +    # The vlans, pvid, dev and error variables are used by 
>> sub-functions
>> +    local -A vlans=()
>> +    local -a terms=()
>> +    local -i i pvid=0
>> +    local dev=$1 error=""
>> +
>> +    # Split the vlan specification string into its terms
>> +    readarray -d / -t terms <<<$2
>> +    for (( i=0; i<${#terms[@]}; ++i )) ;do
>> +        _vif_vlan_parse_term ${terms[$i]%%[[:space:]]}
>> +        [[ -n "$error" ]] && break
>> +    done
>> +
>> +    [[ -z "$error" ]] && _vif_vlan_validate_pvid
>> +    [[ -z "$error" ]] && _vif_vlan_setup
>> +    [[ -z "$error" ]] && return 0
>> +
>> +    log error "$error"
>> +    return 1
>> +}
>> +
>>  # Usage: add_to_bridge bridge dev
>>  add_to_bridge () {
>>      local bridge=$1
>>      local dev=$2
>> +    local vlan=$(xenstore_read_default "$XENBUS_PATH/vlan" "")
>> 
>>      # Don't add $dev to $bridge if it's already on the bridge.
>>      if [ ! -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
>> @@ -134,6 +237,14 @@ add_to_bridge () {
>>          else
>>              ip link set ${dev} master ${bridge}
>>          fi
>> +        if [ -n "${vlan}" ] ;then
>> +            if which bridge >&/dev/null; then
>> +                log debug "configuring VLANs for ${dev} on ${bridge}"
>> +                _vif_vlan_membership "${dev}" "${vlan}"
>> +            else
>> +                log warning "bridge command not available, ignoring 
>> vlan config"
> 
> Do you think this should be fatal?  It seems to me that setting up the
> connection but not applying the vlans could be a security issue.

Agreed, I will do that.

> This file before your patch was very close to posix sh.  Afterwards,
> it definitely needs bash.  vif-bridge is /bin/bash, so it is fine.

Great - I would not like to rewrite it in Posix shell!

> Regards,
> Jason

Regards,

Leigh.

