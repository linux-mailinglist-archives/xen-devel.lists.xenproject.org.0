Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14422946F34
	for <lists+xen-devel@lfdr.de>; Sun,  4 Aug 2024 16:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771667.1182144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sabo7-00006z-Om; Sun, 04 Aug 2024 14:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771667.1182144; Sun, 04 Aug 2024 14:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sabo7-00005x-Lw; Sun, 04 Aug 2024 14:01:59 +0000
Received: by outflank-mailman (input) for mailman id 771667;
 Sun, 04 Aug 2024 13:18:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o17T=PD=decay.netherworld.org=mag@srs-se1.protection.inumbo.net>)
 id 1sab8F-0001m1-LO
 for xen-devel@lists.xen.org; Sun, 04 Aug 2024 13:18:43 +0000
Received: from sinister.netherworld.org (sinister.netherworld.org
 [38.100.53.3]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 11251976-5264-11ef-8776-851b0ebba9a2;
 Sun, 04 Aug 2024 15:18:41 +0200 (CEST)
Received: from decay.netherworld.org (decay.netherworld.org [192.168.6.20])
 by sinister.netherworld.org (8.17.1/8.17.1) with ESMTP id 474DIegj018897
 for <xen-devel@lists.xen.org>; Sun, 4 Aug 2024 09:18:40 -0400
Received: from decay.netherworld.org (localhost [127.0.0.1])
 by decay.netherworld.org (8.17.1/8.17.1) with ESMTP id 474DIeNI015175
 for <xen-devel@lists.xen.org>; Sun, 4 Aug 2024 09:18:40 -0400
Received: (from mag@localhost)
 by decay.netherworld.org (8.17.1/8.17.1/Submit) id 474DIeBq015174;
 Sun, 4 Aug 2024 09:18:40 -0400
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
X-Inumbo-ID: 11251976-5264-11ef-8776-851b0ebba9a2
Date: Sun, 4 Aug 2024 09:18:39 -0400 (EDT)
From: "John E. Krokes" <mag@netherworld.org>
To: xen-devel@lists.xen.org
Subject: [BUG] incorrect "help" output
Message-ID: <c79f8028-6c34-0e25-1445-79e5bcb93890@decay.netherworld.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

Here's a simple and obvious mistake:


~> xl help | grep vsnd
  vsnd-attach         Create a new virtual sound device
  vsnd-list           List virtual display devices for a domain
  vsnd-detach         Destroy a domain's virtual sound device
  ~>


I'm pretty sure vsnd-list should say "sound devices" instead of
"display devices". The problem is in tools/xl/xl_cmdtable.c.


~> xl info
host                   : hoffa
release                : 6.1.0-23-amd64
version                : #1 SMP PREEMPT_DYNAMIC Debian 6.1.99-1 (2024-07-15)
machine                : x86_64
nr_cpus                : 2
max_cpu_id             : 5
nr_nodes               : 1
cores_per_socket       : 2
threads_per_core       : 1
cpu_mhz                : 3013.706
hw_caps                : 178bf3ff:00802001:ee500800:000037ff:00000000:00000000:00000000:00000180
virt_caps              : pv hvm hap shadow gnttab-v1 gnttab-v2
total_memory           : 4063
free_memory            : 2995
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 17
xen_extra              : .4-pre
xen_version            : 4.17.4-pre
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0xffff800000000000
xen_changeset          : 
xen_commandline        : placeholder dom0_mem=512M,max:512M
cc_compiler            : x86_64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0
cc_compile_by          : pkg-xen-devel
cc_compile_domain      : lists.alioth.debian.org
cc_compile_date        : Sun Feb  4 15:31:59 UTC 2024
build_id               : d0c85ddff788a56b72811a274a9f56888198eb6e
xend_config_format     : 4
~>


Thanks for your hard work.

-Mag

