Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84620B41A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jops8-0003fP-KH; Fri, 26 Jun 2020 15:02:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jops6-0003fK-Tj
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:02:30 +0000
X-Inumbo-ID: 0dea3da4-b7be-11ea-82ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0dea3da4-b7be-11ea-82ce-12813bfff9fa;
 Fri, 26 Jun 2020 15:02:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5F91AC46;
 Fri, 26 Jun 2020 15:02:28 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: tweak variable exporting for make 3.82
Message-ID: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
Date: Fri, 26 Jun 2020 17:02:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While I've been running into an issue here only because of an additional
local change I'm carrying, to be able to override just the compiler in
$(XEN_ROOT)/.config (rather than the whole tool chain), in
config/StdGNU.mk:

ifeq ($(filter-out default undefined,$(origin CC)),)

I'd like to propose to nevertheless correct the underlying issue:
Exporting an unset variable changes its origin from "undefined" to
"file". This comes into effect because of our adding of -rR to
MAKEFLAGS, which make 3.82 wrongly applies also upon re-invoking itself
after having updated auto.conf{,.cmd}.

Move the export statement past $(XEN_ROOT)/config/$(XEN_OS).mk inclusion
such that the variables already have their designated values at that
point, while retaining their initial origin up to the point they get
defined.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -17,8 +17,6 @@ export XEN_BUILD_HOST	?= $(shell hostnam
 PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
-export CC CXX LD
-
 export BASEDIR := $(CURDIR)
 export XEN_ROOT := $(BASEDIR)/..
 
@@ -42,6 +40,8 @@ export TARGET_ARCH     := $(shell echo $
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
+export CC CXX LD
+
 .PHONY: default
 default: build
 

