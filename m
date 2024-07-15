Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265D931771
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 17:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759015.1168550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNRX-0006W1-6W; Mon, 15 Jul 2024 15:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759015.1168550; Mon, 15 Jul 2024 15:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNRX-0006U6-3T; Mon, 15 Jul 2024 15:16:47 +0000
Received: by outflank-mailman (input) for mailman id 759015;
 Mon, 15 Jul 2024 15:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTNRV-0006U0-OW
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 15:16:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ec658d9-42bd-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 17:16:44 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77c080b521so482250166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 08:16:44 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7ff893sm220987166b.147.2024.07.15.08.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 08:16:42 -0700 (PDT)
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
X-Inumbo-ID: 3ec658d9-42bd-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721056603; x=1721661403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVJPldX7VXCeLiRYSK0tTv3jEja/PrajLyWOuBIo7/U=;
        b=lTRRjvEVAV6LRR6iAK6bOSSUBqD/mm42/n4dcyy5w1oW1uc23Dqhj9NOTUEl3dH+mN
         Vvhcm7G0eEZi6/9qQcgp0NhmSC3E7O5lBbsZjHp2VEiui5TE795gVB9PmpeGXyv5AsVh
         s7XOMqDwMpdI36gLi9bUkbnMI3+0eJGVnJocA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721056603; x=1721661403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVJPldX7VXCeLiRYSK0tTv3jEja/PrajLyWOuBIo7/U=;
        b=W4la0jE8JdbbifyPXPJSN83Sj6vpdjERejJolSnjCFnR5HkPuJdsiFfP+gkkemP5m3
         pfeD8Cwafd2zcRLDiZ1vnAIiMJcnVtZ+sUaj+jmCX+pmkfO2vtXtUgaTvU+5jw65BESe
         EUnrKsNMXmyhFK9eIff5a5kd6hUfwt1NBq9dbaJQ3AB4xZAvuZvgotMteiGugV42Pfgb
         F0ge6nFuz9+s3RBQ0lyRqkenwr4qO7Db+29Pt00V3N1AUWotNIq+FusGWwVb4TKmgBFn
         MD4QXWpNmOhiX0JNMsOcWCXNBeeZTf4nZx5X7M7ce/OcbIpo3vK7TTDHxV+6wnsDcTUf
         7prQ==
X-Gm-Message-State: AOJu0YyEqaZ6WU+1OQl+qOT6y7orGHD8G8PmwOZ6it2m2pYdQgeLuqS8
	DtQWoXbredDT7qV0hKRmSsKZVVvrsaBdHXXkjN0Q1INetvwY+TfjvWFGCuKIFc4WdrR7rwChVrW
	h
X-Google-Smtp-Source: AGHT+IGJE15djMpAePK2JIhLEDuf5nCCmMtPHad2moFXfqRXOC3yEnPgtKZMcfKsAneved+tP28SnQ==
X-Received: by 2002:a17:906:1786:b0:a6f:51d8:1963 with SMTP id a640c23a62f3a-a79e6a5c54emr5558166b.43.1721056603111;
        Mon, 15 Jul 2024 08:16:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 22/12] tools/examples: Remove more obsolete content
Date: Mon, 15 Jul 2024 16:16:40 +0100
Message-Id: <20240715151640.3374005-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xeninfo.pl was introduced in commit 1b0a8bb57e3e ("Added xeninfo.pl, a script
for collecting statistics from Xen hosts using the Xen-API") and has been
touched exactly twice since to remove hardcoded IP addresses and paths.

The configuration files in vnc/* date from when we had a vendered version of
Qemu living in the tree.

These have never (AFAICT) been wired into the `make install` rule.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/examples/vnc/Xservers |   5 -
 tools/examples/vnc/Xvnc-xen |  53 -------
 tools/examples/xeninfo.pl   | 284 ------------------------------------
 3 files changed, 342 deletions(-)
 delete mode 100644 tools/examples/vnc/Xservers
 delete mode 100755 tools/examples/vnc/Xvnc-xen
 delete mode 100644 tools/examples/xeninfo.pl

diff --git a/tools/examples/vnc/Xservers b/tools/examples/vnc/Xservers
deleted file mode 100644
index adc5748be6ba..000000000000
--- a/tools/examples/vnc/Xservers
+++ /dev/null
@@ -1,5 +0,0 @@
-# Configuration lines to go in /etc/X11/xdm/Xservers to
-# start Xvnc and connect back to a vncviewer in domain-0.
-# See 'man xdm' under 'LOCAL SERVER SPECIFICATION' for format details.
-
-:1 Xvnc local /usr/X11R6/bin/Xvnc-xen :1
\ No newline at end of file
diff --git a/tools/examples/vnc/Xvnc-xen b/tools/examples/vnc/Xvnc-xen
deleted file mode 100755
index 15058e622d7f..000000000000
--- a/tools/examples/vnc/Xvnc-xen
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/bash
-#============================================================================
-# This script should be installed in /usr/X11R6/bin/Xvnc-xen.
-#============================================================================
-#
-# Start Xvnc and use vncconnect to connect back to a vncviewer listening in
-# domain 0. The host and port to connect to are given by
-#
-#    VNC_VIEWER=<host>:<port>
-#
-# in the kernel command line (/proc/cmdline). 
-#
-# The '--vnc' option to 'xm create' will start a vncviewer and
-# pass its address in VNC_VIEWER for this script to find.
-#
-# Usage:
-#        Xvnc-xen [args]
-#
-# Any arguments are passed to Xvnc.
-#
-#============================================================================
-
-# Prefix for messages.
-M="[$(basename $0)]"
-
-# Usage: vnc_addr
-# Print <host>:<port> for the vncviewer given in
-# the kernel command line.
-vnc_addr () {
-    sed -n -e "s/.*VNC_VIEWER=\([^ ]*\).*/\1/p" /proc/cmdline
-}
-
-# Usage: vnc_connect
-# If a vncviewer address was given on the kernel command line,
-# run vncconnect for it.
-vnc_connect () {
-    local addr=$(vnc_addr)
-
-    if [ -n "${addr}" ] ; then
-        echo "$M Connecting to ${addr}."
-        vncconnect ${addr}
-    else
-        echo "$M No VNC_VIEWER in kernel command line."
-        echo "$M Create the domain with 'xm create --vnc <display>'."
-        return 1
-    fi
-}
-
-# Start the vnc server.
-Xvnc "$@" >/dev/null 2>&1 &
-
-# Connect back to the viewer in domain-0.
-vnc_connect
diff --git a/tools/examples/xeninfo.pl b/tools/examples/xeninfo.pl
deleted file mode 100644
index 95a15d9595c0..000000000000
--- a/tools/examples/xeninfo.pl
+++ /dev/null
@@ -1,284 +0,0 @@
-#!/usr/bin/perl -w
-
-#############################################################################################################
-#                                                                                                           #
-#  Developed by Ingard Mevåg @ Oslo University College, spring 2007                                         #
-#  ingard [at] mevaag  [dot] no                                                                             #
-#                                                                                                           #
-#  This work is licensed under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 License.      #
-#  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter #
-#  to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.                #
-#                                                                                                           #
-#############################################################################################################
-
-use strict;
-# http://search.cpan.org/~rjray/RPC-XML-0.59/lib/RPC/XML/Client.pm
-require RPC::XML;
-require RPC::XML::Client;
-
-# for debug purposes
-#use Data::Dumper;
-
-##### CONFIG ######
-
-my %xenhosts = ("192.0.2.10" => {"port" => "9363"}, 
-					 "192.0.2.11" => {"port" => "9363"}, 
-					 "192.0.2.12" => {"port" => "9363"}, 
-					 "192.0.2.13" => {"port" => "9363"});
-
-##### CONFIG END ###
-
-##### STATIC VARS #####
-my %host_info;
-
-#######################
-sub apiconnect
-{
-	foreach my $xenhost (keys %xenhosts)
-	{
-		my $xen = RPC::XML::Client->new("http://$xenhost:$xenhosts{$xenhost}{'port'}");
-		my $session = $xen->simple_request("session.login_with_password", "user","");
-		if (! $session)
-		{
-			print "Can't connect to $xenhost :(\n";
-			$xenhosts{$xenhost} = {'xen' => $xen, 'session' => ""};
-		}
-		else
-		{
-			$xenhosts{$xenhost} = {'xen' => $xen, 'session' => $session->{'Value'}};
-			print "Connected successfully to $xenhost..\n";
-		}
-	}
-}
-
-sub validate_response
-{
-	my ($result_ref) = @_;
-	if ($result_ref->{'Status'} eq "Success")
-	{
-		return $result_ref->{'Value'};
-	}
-	else
-	{
-		# status = Failure !
-#		die ("xmlrpc failed! ErrorDescription: $result_ref->{'ErrorDescription'}[1] -> $result_ref->{'ErrorDescription'}[0]");
-		print "xmlrpc failed! ErrorDescription: $result_ref->{'ErrorDescription'}[1] -> $result_ref->{'ErrorDescription'}[0]\n";
-	}
-}
-
-sub get_host_cpu_utilisation
-{
-	my ($xen, $session, $host_name, $host_ref) = @_;
-	my $host_cpu_ref = validate_response($xen->simple_request("host.get_host_CPUs", $session, $host_ref));
-	foreach (@$host_cpu_ref)
-	{
-		my $host_cpu_utilisation = validate_response($xen->simple_request("host_cpu.get_utilisation", $session, $_));
-		$host_info{$host_name}{'cpus'}{$_} = $host_cpu_utilisation;
-		print "     CPUiNFO: $host_cpu_utilisation\n";
-	}
-}
-
-sub get_host_pif_utilisation
-{
-	my ($xen, $session, $host_name, $host_ref) = @_;
-
-# This method isnt implemented yet it seems so using PIF.get_all for now.. 
-# This will break when xen is made cluster aware..
-#	my $host_pif_ref = validate_response($xen->simple_request("host.get_PIFs", $session, $host_ref)); 
-	my $host_pif_ref = validate_response($xen->simple_request("PIF.get_all", $session));
-	foreach (@$host_pif_ref)
-	{
-		my $host_pif_device = validate_response($xen->simple_request("PIF.get_device", $session, $_));
-		my $host_pif_metrics_ref = validate_response($xen->simple_request("PIF.get_metrics", $session, $_));
-
-# Whats the best solution performancewise?
-# Collecting stats from get_records, or pulling individually?
-
-#		my $host_pif_record = validate_response($xen->simple_request("PIF_metrics.get_record", $session, $host_pif_metrics_ref));
-#		my $host_pif_io_read = $host_pif_record->{'io_read_kbs'};
-#		my $host_pif_io_write = $host_pif_record->{'io_write_kbs'};
-		my $host_pif_io_read = validate_response($xen->simple_request("PIF_metrics.get_io_read_kbs", $session, $host_pif_metrics_ref));
-		my $host_pif_io_write = validate_response($xen->simple_request("PIF_metrics.get_io_write_kbs", $session, $host_pif_metrics_ref));
-
-		$host_info{$host_name}{'pifs'}{$host_pif_device} = {'read' => $host_pif_io_read, 'write' => $host_pif_io_write};
-		print "     PiFiNFO: $host_pif_device READ: $host_pif_io_read - WRITE: $host_pif_io_write\n";
-#		$host_info{$host_name}{'pifs'}{$host_pif_device}{'read'} = $host_pif_io_read;
-#		$host_info{$host_name}{'pifs'}{$host_pif_device}{'write'} = $host_pif_io_write;
-	}
-}
-
-sub get_host_mem_utilisation
-{
-	my ($xen, $session, $host_name, $host_ref) = @_;
-	my $host_metrics_ref = validate_response($xen->simple_request("host.get_metrics", $session, $host_ref)); 
-	my $host_mem_total =  validate_response($xen->simple_request("host_metrics.get_memory_total", $session, $host_metrics_ref)) / 1024 / 1024;
-	my $host_mem_free =  validate_response($xen->simple_request("host_metrics.get_memory_free", $session, $host_metrics_ref)) / 1024 / 1024;
-	$host_info{$host_name}{'memory'} = {'total' => $host_mem_total, 'free' => $host_mem_free};
-	print "     MEMiNFO: Total: $host_mem_total MB - Free: $host_mem_free MB\n";
-}
-
-sub get_vm_mem_info
-{
-	my ($xen, $session, $host_name, $vm_ref, $vm_name_label) = @_;
-	my $vm_mem_stat_max = validate_response($xen->simple_request("VM.get_memory_static_max",$session,$vm_ref));
-	my $vm_mem_stat_min = validate_response($xen->simple_request("VM.get_memory_static_min",$session,$vm_ref));
-	my $vm_mem_dyn_max = validate_response($xen->simple_request("VM.get_memory_dynamic_max",$session,$vm_ref));
-	my $vm_mem_dyn_min = validate_response($xen->simple_request("VM.get_memory_dynamic_min",$session,$vm_ref));
-
-	# not implemented yet.. We'll do this at the same time as getting cpu utilisation
-	# in the get_vm_metrics sub instead..
-	#my $vm_metrics_ref = validate_response($xen->simple_request("VM.get_metrics",$session,$vm_ref));
-	#my $vm_mem_actual = validate_response($xen->simple_request("VM_metrics.get_memory_actual",$session,$vm_metrics_ref));
-
-	$host_info{$host_name}{'vms'}{$vm_name_label}{'memory'} = {'static_max' => $vm_mem_stat_max,
-								  'static_min' => $vm_mem_stat_min,
-								  'dynamic_max' => $vm_mem_dyn_max,
-								  'dynamic_min' => $vm_mem_dyn_min};
-
-	# xm list uses the dynamic min var as far as i can tell.. or?
-	# Lets print the memactual info instead of this... I'll do that in the get_vm_metrics sub instead..
-	# print "  |- MEMiNFO: Dynamic Min: $vm_mem_dyn_min - Actually in use: $vm_mem_actual\n";
-}
-
-sub get_vm_metrics
-{
-	my ($xen, $session, $host_name, $vm_ref, $vm_name_label) = @_;
-	my $vm_metrics_ref = validate_response($xen->simple_request("VM.get_metrics",$session,$vm_ref));
-	
-	my %vm_vcpu_utilisation = %{validate_response($xen->simple_request("VM_metrics.get_vcpus_utilisation",$session,$vm_metrics_ref))};
-	for my $tempcpu (keys %vm_vcpu_utilisation)
-	{
-		print "  |- CPUiNFO: $tempcpu - $vm_vcpu_utilisation{$tempcpu}\n";
-		$host_info{$host_name}{'vms'}{$vm_name_label}{'vcpus'} = {$tempcpu => $vm_vcpu_utilisation{$tempcpu}};
-	}
-	my $vm_mem_actual = validate_response($xen->simple_request("VM_metrics.get_memory_actual",$session,$vm_metrics_ref)) / 1024 / 1024;
-	$host_info{$host_name}{'vms'}{$vm_name_label}{'memory'}{'actual'} = "$vm_mem_actual";
-	print "  |- MEMiNFO: Actually in use: $vm_mem_actual MB\n";
-}
-
-sub get_vm_vif_utilisation
-{
-	my ($xen, $session, $host_name, $vm_ref, $vm_name_label) = @_;
-	my $vm_vifs = validate_response($xen->simple_request("VM.get_VIFs",$session,$vm_ref));
-	foreach (@$vm_vifs)
-	{
-		my $vif_device = validate_response($xen->simple_request("VIF.get_device",$session,$_));
-		my $vif_io_read = validate_response($xen->simple_request("VIF_metrics.get_io_read_kbs", $session, $_));
-		my $vif_io_write = validate_response($xen->simple_request("VIF_metrics.get_io_write_kbs", $session, $_));
-		$host_info{$host_name}{'vms'}{$vm_name_label}{'vifs'}{$vif_device} = {'read' => $vif_io_read, 'write' => $vif_io_write};
-		print "  |- ViFiNFO: $vif_device READ: $vif_io_read - WRITE: $vif_io_write\n";
-	}
-}
-
-sub get_vm_vbd_utilisation
-{
-	my ($xen, $session, $host_name, $vm_ref, $vm_name_label) = @_;
-	my $vm_vbds = validate_response($xen->simple_request("VM.get_VBDs",$session,$vm_ref));
-	foreach (@$vm_vbds)
-	{
-		my $vbd_device = validate_response($xen->simple_request("VBD.get_device",$session,$_));
-		my $vbd_io_read = validate_response($xen->simple_request("VBD_metrics.get_io_read_kbs", $session, $_));
-		my $vbd_io_write = validate_response($xen->simple_request("VBD_metrics.get_io_write_kbs", $session, $_));
-		$host_info{$host_name}{'vms'}{$vm_name_label}{'vbds'}{$vbd_device} = {'read' => $vbd_io_read, 'write' => $vbd_io_write};
-		print "  |- VBDiNFO: $vbd_device READ: $vbd_io_read - WRITE: $vbd_io_write\n";
-	}
-}
-
-
-sub get_vm_type
-{
-	my ($xen, $session, $host_name, $vm_ref, $vm_name_label) = @_;
-	# not running response through validate_response() here to stop it from crashing..
-	#
-	# api docs says if this (following) field is set, its a HVM domain.
-	my $vm_bootloader_results = $xen->simple_request("VM.get_HVM_boot_policy",$session,$vm_ref);
-	if ("$vm_bootloader_results->{'Status'}" eq "Success")
-	{
-		if ("$vm_bootloader_results->{'Value'}" ne "")
-		{
-			$host_info{$host_name}{'vms'}{$vm_name_label}{'type'} = "HVM";
-		}
-		else
-		{
-			$host_info{$host_name}{'vms'}{$vm_name_label}{'type'} = "PV";
-		}
-	}
-	else
-	{
-		# However, xen 3.0.4 doest support this part of the api, so afaik I can get the difference with: 
-		my $vm_pv_kernel_results = $xen->simple_request("VM.get_PV_kernel",$session,$vm_ref);
-		# which is something like:
-		# 'PV_kernel': '/boot/vmlinuz-2.6.18-xen',
-		# or
-		# 'PV_kernel': 'hvmloader',
-		if ("$vm_pv_kernel_results->{'Value'}" =~ m/hvm/i)
-		{
-			$host_info{$host_name}{'vms'}{$vm_name_label}{'type'} = "HVM";
-		}
-		else
-		{
-			$host_info{$host_name}{'vms'}{$vm_name_label}{'type'} = "PV";
-		}
-	}
-}
-
-sub get_complete_info
-{	
-	my %all_vms;
-	foreach my $xenhost (sort keys %xenhosts)
-	{
-		next unless $xenhosts{$xenhost}{'session'};
-		my $xen = $xenhosts{$xenhost}{'xen'};
-		my $session = $xenhosts{$xenhost}{'session'};
-		print "_______________________\n## $xenhost ##\n-----------------------\n";
-	
-		my $host_ref = validate_response($xen->simple_request("session.get_this_host", $session));
-		
-		my $host_name = validate_response($xen->simple_request("host.get_name_label", $session, $host_ref));
-		$xenhosts{$xenhost}{'hostname'} = $host_name;
-		$host_info{$host_name}{'ip'} = $xenhost;
-		
-		get_host_cpu_utilisation($xen, $session, $host_name, $host_ref);
-
-		get_host_mem_utilisation($xen, $session, $host_name, $host_ref);
-	
-		get_host_pif_utilisation($xen, $session, $host_name, $host_ref);
-	
-	
-		my $all_vm_refs = validate_response($xen->simple_request("host.get_resident_VMs",$session, $host_ref));
-		
-		foreach my $vm_ref (@$all_vm_refs)
-		{
-			my $vm_name_label = validate_response($xen->simple_request("VM.get_name_label",$session,$vm_ref));
-			get_vm_type($xen,$session,$host_name,$vm_ref,$vm_name_label);
-			
-			my $vm_id = validate_response($xen->simple_request("VM.get_domid",$session,$vm_ref));
-
-			print "vm: $vm_id\t$vm_name_label\ttype: $host_info{$host_name}{'vms'}->{$vm_name_label}{'type'}\n";
-			
-			# vm_metrics includes both mem_actual & cpu utilisation
-			# So we'll add all stats found in that class in one go..
-			get_vm_metrics($xen,$session,$host_name,$vm_ref,$vm_name_label);
-#			get_vm_cpu_utilisation($xen,$session,$host_name,$vm_ref,$vm_name_label);
-
-			# all other mem stats are added seperately..
-			# This might not be needed at all as xen doesnt have functionality to
-			# resize mem for a VM atm (afaik)
-			get_vm_mem_info($xen,$session,$host_name,$vm_ref,$vm_name_label);
-	
-			get_vm_vif_utilisation($xen,$session,$host_name,$vm_ref,$vm_name_label);
-			
-			get_vm_vbd_utilisation($xen,$session,$host_name,$vm_ref,$vm_name_label);
-			
-			$all_vms{$vm_name_label} = "" unless ("$vm_name_label" eq "Domain-0");
-		}
-		print "\n";
-	}
-	# Debug: Uncomment to see the nested datastructure..
-	#print Dumper(%host_info);
-}
-
-
-
-apiconnect();
-get_complete_info();
-- 
2.39.2


