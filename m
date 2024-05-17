Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1ED8C84F5
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724023.1129206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uyu-0008V6-61; Fri, 17 May 2024 10:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724023.1129206; Fri, 17 May 2024 10:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uyu-0008SD-2j; Fri, 17 May 2024 10:38:32 +0000
Received: by outflank-mailman (input) for mailman id 724023;
 Fri, 17 May 2024 10:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4QDV=MU=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7uys-0008S7-Cm
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:38:30 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98f2a54d-1439-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 12:38:29 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id C26DE80078;
 Fri, 17 May 2024 11:38:27 +0100 (BST)
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
X-Inumbo-ID: 98f2a54d-1439-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715942307;
	bh=JbgDqEkKYwG8oYvQtlqZV0fdmMP03V4Gg1bYu38mNKU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iGlpphG1VruUs3TmxFGzJaolWTubYWOxySTcSSiGUB3iJDUBr0+PJw3NlIB4yeMdD
	 UwXtYKm4Yj4YkKGJkrW4een46sq12NY2d3USO5S3JhCRU1PHR+kLCBPjAVHtr+8Iwc
	 0d1uqv5wvs6g4+0HE7xM7Uc5GuRRqvhrCEEEQfas=
MIME-Version: 1.0
Date: Fri, 17 May 2024 11:38:27 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 3/4] tools/hotplug/Linux: Add bridge VLAN support
In-Reply-To: <CAKf6xpvX2T3xhx59b0_X3e+9BpYuMZS84P=ghisZFD3yWsFssw@mail.gmail.com>
References: <20240516105612.15306-1-leigh@solinno.co.uk>
 <20240516105612.15306-4-leigh@solinno.co.uk>
 <CAKf6xpvX2T3xhx59b0_X3e+9BpYuMZS84P=ghisZFD3yWsFssw@mail.gmail.com>
Message-ID: <18967904c69aa6d4975d1a80dd825aeb@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 2024-05-17 03:19, Jason Andryuk wrote:
> On Thu, May 16, 2024 at 6:56 AM Leigh Brown <leigh@solinno.co.uk> 
> wrote:
>> 
>> Update add_to_bridge shell function to read the vlan parameter from
>> xenstore and set the bridge VLAN configuration for the VID.
>> 
>> Add additional helper functions to parse the vlan specification,
>> which consists of one or more of the following:
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
>> This capability requires the iproute2 bridge command to be
>> installed.  An error will be generated if the vlan parameter is
>> set and the bridge command is not available.
>> 
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>> 
>> ---
>>  tools/hotplug/Linux/xen-network-common.sh | 103 
>> ++++++++++++++++++++++
>>  1 file changed, 103 insertions(+)
>> 
>> diff --git a/tools/hotplug/Linux/xen-network-common.sh 
>> b/tools/hotplug/Linux/xen-network-common.sh
>> index 42fa704e8d..fa7615ce0f 100644
>> --- a/tools/hotplug/Linux/xen-network-common.sh
>> +++ b/tools/hotplug/Linux/xen-network-common.sh
> 
>> +_vif_vlan_setup() {
>> +    # References vlans and dev variable from the calling function
>> +    local vid cmd
>> +
>> +    bridge vlan del dev "$dev" vid 1
> 
> Is vid 1 always added, so you need to remove it before customizing?

Correct. I will add a comment to that effect.

>> +    for vid in ${!vlans[@]} ;do
>> +        cmd="bridge vlan add dev '$dev' vid $vid"
>> +        case ${vlans[$vid]} in
>> +             p) cmd="$cmd pvid untagged" ;;
>> +             u) cmd="$cmd untagged" ;;
>> +             t) ;;
>> +        esac
>> +        eval "$cmd"
> 
> Sorry if I missed this last time, but `eval` shouldn't be necessary.
> 
> 
>         local args
> 
>         case ${vlans[$vid]} in
>              p) args="pvid untagged" ;;
>              u) args="untagged" ;;
>              t) ;;
>         esac
>         bridge vlan add dev "$dev" vid "$vid" $args
> 
> args unquoted so it expands into maybe two args.  You could also make
> args an array and do "${args[@]}"

I will make that change, using an array.

>> +    done
>> +}
>> +
>> +_vif_vlan_membership() {
>> +    # The vlans, pvid and dev variables are used by sub-functions
>> +    local -A vlans=()
>> +    local -a terms=()
>> +    local -i i pvid=0
>> +    local dev=$1
>> +
>> +    # Split the vlan specification string into its terms
>> +    readarray -d / -t terms <<<$2
>> +    for (( i=0; i<${#terms[@]}; ++i )) ;do
>> +        _vif_vlan_parse_term ${terms[$i]%%[[:space:]]}
> 
> Because terms is not in double quotes, wouldn't it expand out?  Then
> any whitespace would be dropped when calling _vif_vlan_parse_term.
> Your %% only drops trailing spaces too.  Maybe you want
> "${terms//[[:space:]]/}" to remove all spaces?

That is a hack because readarray adds a newline at the end of the
last element (not sure why).  I will change the code just to fix up
the last element before the loop, and it will be clearer.

> Stylistically, you use (( )) more than I would.  I'd do:
> 
> local term
> for term in "${terms[@]}" ; do
>      _vif_vlan_parse_term "$term"
> 
> But you can keep it your way if you prefer.

You guessed correctly that like using (( )) but in this case your
suggestion is simpler, so I will make that change.

> Regards,
> Jason

I am making the changes then will test, after which I will send an
updated version.

Regards,

Leigh.

