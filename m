Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF55A71B70
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:05:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928065.1330860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFl-00039T-AV; Wed, 26 Mar 2025 16:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928065.1330860; Wed, 26 Mar 2025 16:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFl-00036L-6L; Wed, 26 Mar 2025 16:05:17 +0000
Received: by outflank-mailman (input) for mailman id 928065;
 Wed, 26 Mar 2025 16:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txTFj-0001z3-RK
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:05:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a183626-0a5c-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 17:05:14 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAA4C1F445;
 Wed, 26 Mar 2025 16:05:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86C521374A;
 Wed, 26 Mar 2025 16:05:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PoFnH7kl5GclaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Mar 2025 16:05:13 +0000
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
X-Inumbo-ID: 1a183626-0a5c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAHvy3F2eUaT2duqNqIKRTDIIwRGgy4VzLxx0NXdzNY=;
	b=cKb6LuIIUmlvDjXtiOcCobdrQYwOJ0F9W06FK3Nu9OkFmmEAJ0ehCyOz6QJmRIrkXVeuCu
	ir4Ce9KhjzNjGlpuFkpGVDrHq21KeYlTOwkn45Qrom+QIpV7id8m3Uk7D5aOCe1wu7zr7G
	V1l9lEMXebGSkAzXuky/SLj0XC1MGQE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAHvy3F2eUaT2duqNqIKRTDIIwRGgy4VzLxx0NXdzNY=;
	b=cKb6LuIIUmlvDjXtiOcCobdrQYwOJ0F9W06FK3Nu9OkFmmEAJ0ehCyOz6QJmRIrkXVeuCu
	ir4Ce9KhjzNjGlpuFkpGVDrHq21KeYlTOwkn45Qrom+QIpV7id8m3Uk7D5aOCe1wu7zr7G
	V1l9lEMXebGSkAzXuky/SLj0XC1MGQE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 5/6] stubdom: remove ancient stubdom-dm script
Date: Wed, 26 Mar 2025 17:04:39 +0100
Message-ID: <20250326160442.19706-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326160442.19706-1-jgross@suse.com>
References: <20250326160442.19706-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The stubdom-dm script is still using "xm" instead of "xl", so it is
probably unused since more than 10 years now.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/stubdom-dm | 182 ---------------------------------------------
 1 file changed, 182 deletions(-)
 delete mode 100644 stubdom/stubdom-dm

diff --git a/stubdom/stubdom-dm b/stubdom/stubdom-dm
deleted file mode 100644
index 05d07ac0d1..0000000000
--- a/stubdom/stubdom-dm
+++ /dev/null
@@ -1,182 +0,0 @@
-#!/bin/bash
-#
-# Copyright 2007-2008 Samuel Thibault <samuel.thibault@eu.citrix.net>
-#
-# dm script around stubdomains.
-#
-
-DIR=`dirname $0`
-. "${DIR}/stubdompath.sh"
-stubdom_configdir="${XEN_CONFIG_DIR}/stubdoms"
-
-# To fit xterms nicely
-height=339
-
-# Parse arguments
-
-domid=
-domname=
-vncviewer=0
-vncpid=
-extra=
-sdl=0
-opengl=1
-vnc=0
-vncunused=0
-while [ "$#" -gt 0 ];
-do
-    if [ "$#" -ge 2 ];
-    then
-	case "$1" in
-	    -d)
-                domid=$2;
-                extra="$extra -d $domid";
-                shift
-                ;;
-	    -domain-name)
-                domname=$2;
-                shift
-                ;;
-	    -vnc)
-                vnc=1
-                op=${2%,*}
-		ip=${op%:*};
-		vnc_port=${op#*:};
-		shift
-		;;
-            -vncunused)
-                vncunused=1
-                shift
-                ;;
-            -loadvm)
-                extra="$extra -loadvm $2";
-                shift
-                ;;
-            -k)
-                keymap=$2
-                shift
-                ;;
-	    -serial)
-		serial="$2"
-		shift
-		;;
-            -monitor)
-		monitor="$2"
-		shift
-		;;
-	esac
-    fi
-    case "$1" in
-	-vncviewer) vncviewer=1 ;;
-        -sdl) sdl=1 ;;
-        -disable-opengl) opengl=0 ;;
-    esac
-    shift
-done
-
-[ -z "$domid"   ] && { echo "couldn't find domain ID" ; exit 1; }
-[ -z "$domname" ] && { echo "couldn't find domain name" ; exit 1; }
-
-# Termination handler
-
-term() {
-    [ -n "$vncpid" ] && kill -9 $vncpid
-    rm -f /tmp/domname-dm
-    rm ${stubdom_configdir}/$domname-dm
-    exit 0
-}
-
-trap term SIGHUP
-
-############
-# stubdomain
-# Wait for any previous stubdom to terminate
-while xm list | grep -w $domname-dm
-do
-	sleep 1
-done
-
-# Generate stubdom config file
-mkdir -p ${stubdom_configdir} &>/dev/null
-echo "#This file is autogenerated, edit $domname instead!" > ${stubdom_configdir}/$domname-dm
-echo "kernel = '${XENFIRMWAREDIR}/ioemu-stubdom.gz'" >> ${stubdom_configdir}/$domname-dm
-
-vfb="sdl=$sdl, opengl=$opengl"
-test "$DISPLAY" && vfb="$vfb, display=$DISPLAY"
-test "$XAUTHORITY" && vfb="$vfb, xauthority=$XAUTHORITY"
-test $vnc != 0 && vfb="$vfb, vnc=$vnc, vncdisplay=$vnc_port, vnclisten=$ip, vncunused=$vncunused"
-vncpasswd=`xenstore-read /local/domain/0/backend/vfb/$domid/0/vncpasswd 2>/dev/null`
-test "$vncpasswd" && vfb="$vfb, vncpasswd=$vncpasswd"
-test "$keymap" && vfb="$vfb, keymap=$keymap"
-test "$monitor" && vfb="$vfb, monitor=$monitor"
-test "$serial" && vfb="$vfb, serial=$serial"
-echo "vfb = ['$vfb']" >> ${stubdom_configdir}/$domname-dm
-
-echo -n "disk = [ " >> ${stubdom_configdir}/$domname-dm
-j=0
-for i in `xenstore-ls /local/domain/$domid/device/vbd | grep 'backend =' | awk '{print $3}'`
-do
-    i=${i%\"}
-    i=${i#\"}
-    vbd_mode=`xenstore-read $i/mode`
-    vbd_disk=`xenstore-read $i/params`
-    vbd_type=`xenstore-read $i/type`
-    vbd_dev=`xenstore-read $i/dev`
-    vbd_front=`xenstore-read $i/frontend`
-    vbd_devtype=`xenstore-read $vbd_front/device-type`
-    if [ $j -ne 0 ]
-    then
-        echo -n "," >> ${stubdom_configdir}/$domname-dm
-    fi
-    echo -n "'$vbd_type:$vbd_disk,$vbd_dev:$vbd_devtype,$vbd_mode'" >> ${stubdom_configdir}/$domname-dm
-    j=$(( $j + 1 ))
-done
-echo " ] " >> ${stubdom_configdir}/$domname-dm
-echo -n "vif = [ " >> ${stubdom_configdir}/$domname-dm
-j=0
-for i in `xenstore-ls /local/domain/$domid/device/vif | grep 'backend =' | awk '{print $3}'`
-do
-    i=${i%\"}
-    i=${i#\"}
-    vif_mac=`xenstore-read $i/mac`
-    vif_bridge=`xenstore-read $i/bridge`
-    if [ $j -ne 0 ]
-    then
-        echo -n "," >> ${stubdom_configdir}/$domname-dm
-    fi
-    echo -n "'mac=$vif_mac" >> ${stubdom_configdir}/$domname-dm
-    if [ "$vif_bridge" ]
-    then
-        echo -n ",bridge=$vif_bridge'" >> ${stubdom_configdir}/$domname-dm
-    else
-        echo -n "'" >> ${stubdom_configdir}/$domname-dm
-    fi
-    j=$(( $j + 1 ))
-done
-echo " ] " >> ${stubdom_configdir}/$domname-dm
-
-mkfifo /tmp/$domname-dm
-xm create -c ${stubdom_configdir}/$domname-dm target=$domid memory=32 extra="$extra" < /tmp/$domname-dm &
-exec 4>/tmp/$domname-dm
-
-
-###########
-# vncviewer
-if [ "$vncviewer" = 1 ]
-then
-    # Wait for vnc server to appear
-    while ! vnc_port=`xenstore-read /local/domain/$domid/console/vnc-port`
-    do
-        # Check that the stubdom job is still alive
-        kill -0 $consolepid || term
-	sleep 1
-    done
-
-    vncviewer $ip:$vnc_port &
-    vncpid=$!
-fi
-
-# wait for SIGHUP or stubdom termination
-wait
-
-term
-- 
2.43.0


