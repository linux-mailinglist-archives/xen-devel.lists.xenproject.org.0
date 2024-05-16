Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E868C74EE
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723126.1127702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Yn5-0008A5-8a; Thu, 16 May 2024 10:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723126.1127702; Thu, 16 May 2024 10:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Yn5-000853-3E; Thu, 16 May 2024 10:56:51 +0000
Received: by outflank-mailman (input) for mailman id 723126;
 Thu, 16 May 2024 10:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujgU=MT=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7Yn3-0007XN-MV
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:56:49 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe152f91-1372-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:56:48 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 0C42C8009F;
 Thu, 16 May 2024 11:56:48 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id D4C4B20189; Thu, 16 May 2024 11:56:47 +0100 (BST)
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
X-Inumbo-ID: fe152f91-1372-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715857008;
	bh=/LeYpkSLtC63z1CHHwG/PrlVgENABot2k3FS2Sid64E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RnuQNhykSjB2NiCV5Wh4HaLqxR5NpHTnhfMZ5lYVizmPF9dA46LeV6Bqj8SM6BXMP
	 Om5n+o72WDQwxxpkXaC8YqJvS3sF9qKkbXo/ky/qwe+xIMN3IOFmRVNppYJmDpNWDJ
	 3GBsd5Ts/U8OPirHDvBKAkstrBiGxCsgSz4SBFVw=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 3/4] tools/hotplug/Linux: Add bridge VLAN support
Date: Thu, 16 May 2024 11:56:11 +0100
Message-Id: <20240516105612.15306-4-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516105612.15306-1-leigh@solinno.co.uk>
References: <20240516105612.15306-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update add_to_bridge shell function to read the vlan parameter from
xenstore and set the bridge VLAN configuration for the VID.

Add additional helper functions to parse the vlan specification,
which consists of one or more of the following:

a) single VLAN (e.g. 10).
b) contiguous range of VLANs (e.g. 10-15).
c) discontiguous range with base, increment and count
   (e.g. 100+10x9 which gives VLAN IDs 100, 110, ... 190).

A single VLAN can be suffixed with "p" to indicate the PVID, or
"u" to indicate untagged. A range of VLANs can be suffixed with
"u" to indicate untagged.  A complex example would be:

   vlan=1p/10-15/20-25u

This capability requires the iproute2 bridge command to be
installed.  An error will be generated if the vlan parameter is
set and the bridge command is not available.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

---
 tools/hotplug/Linux/xen-network-common.sh | 103 ++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 42fa704e8d..fa7615ce0f 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -121,10 +121,105 @@ create_bridge () {
     fi
 }
 
+_vif_vlan_add() {
+    # References vlans and pvid variables from the calling function
+    local -i vid=$1
+    local flag=${2:-}
+
+    if (( vid < 1 || vid > 4094 )) ;then
+        fatal "vlan id $vid not between 1 and 4094"
+    fi
+    if [[ -n "${vlans[$vid]}" ]] ;then
+        fatal "vlan id $vid specified more than once"
+    fi
+    case $flag in
+     p) if (( pvid != 0 )) ;then
+            fatal "more than one pvid specified ($vid and $pvid)"
+        fi
+        pvid=$vid
+        vlans[$vid]=p ;;
+     u) vlans[$vid]=u ;;
+     *) vlans[$vid]=t ;;
+    esac
+}
+
+_vif_vlan_parse_term() {
+    local vid incr last term=${1:-}
+
+    if [[ $term =~ ^([0-9]+)([pu])?$ ]] ;then
+        _vif_vlan_add ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
+    elif [[ $term =~ ^([0-9]+)-([0-9]+)(u)?$ ]] ;then
+        vid=${BASH_REMATCH[1]}
+        last=${BASH_REMATCH[2]}
+        if (( last >= vid )) ;then
+            for (( ; vid<=last; vid++ )) ;do
+                _vif_vlan_add $vid ${BASH_REMATCH[3]}
+            done
+        else
+            fatal "invalid vlan id range: $term"
+        fi
+    elif [[ $term =~ ^([0-9]+)\+([0-9]+)x([0-9]+)(u)?$ ]] ;then
+        vid=${BASH_REMATCH[1]}
+        incr=${BASH_REMATCH[2]}
+        for (( j=${BASH_REMATCH[3]}; j>0; --j, vid+=incr ))
+        do
+            _vif_vlan_add $vid ${BASH_REMATCH[4]}
+        done
+    else
+        fatal "invalid vlan specification: $term"
+    fi
+}
+
+_vif_vlan_validate_pvid() {
+    # References vlans and pvid variables from the calling function
+    if (( pvid == 0 )) ;then
+        if (( ${#vlans[@]} == 1 )) ;then
+            vlans[${!vlans[*]}]=p
+        else
+            fatal "pvid required when using multiple vlan ids"
+        fi
+    fi
+}
+
+_vif_vlan_setup() {
+    # References vlans and dev variable from the calling function
+    local vid cmd
+
+    bridge vlan del dev "$dev" vid 1
+    for vid in ${!vlans[@]} ;do
+        cmd="bridge vlan add dev '$dev' vid $vid"
+        case ${vlans[$vid]} in
+             p) cmd="$cmd pvid untagged" ;;
+             u) cmd="$cmd untagged" ;;
+             t) ;;
+        esac
+        eval "$cmd"
+    done
+}
+
+_vif_vlan_membership() {
+    # The vlans, pvid and dev variables are used by sub-functions
+    local -A vlans=()
+    local -a terms=()
+    local -i i pvid=0
+    local dev=$1
+
+    # Split the vlan specification string into its terms
+    readarray -d / -t terms <<<$2
+    for (( i=0; i<${#terms[@]}; ++i )) ;do
+        _vif_vlan_parse_term ${terms[$i]%%[[:space:]]}
+    done
+
+    _vif_vlan_validate_pvid
+    _vif_vlan_setup
+    return 0
+}
+
 # Usage: add_to_bridge bridge dev
 add_to_bridge () {
     local bridge=$1
     local dev=$2
+    local vlan=$(xenstore_read_default "$XENBUS_PATH/vlan" "")
 
     # Don't add $dev to $bridge if it's already on the bridge.
     if [ ! -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
@@ -134,6 +229,14 @@ add_to_bridge () {
         else
             ip link set ${dev} master ${bridge}
         fi
+        if [ -n "${vlan}" ] ;then
+            log debug "configuring vlans for ${dev} on ${bridge}"
+            if which bridge >&/dev/null; then
+                _vif_vlan_membership "${dev}" "${vlan}"
+            else
+                fatal "vlan configuration failed: bridge command not found"
+            fi
+        fi
     else
         log debug "$dev already on bridge $bridge"
     fi
-- 
2.39.2


