Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36287BB412
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613402.953883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogww-0005l0-E7; Fri, 06 Oct 2023 09:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613402.953883; Fri, 06 Oct 2023 09:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogww-0005hd-Av; Fri, 06 Oct 2023 09:16:46 +0000
Received: by outflank-mailman (input) for mailman id 613402;
 Fri, 06 Oct 2023 09:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qogwu-0005Di-EU
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:16:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10f2d78a-6429-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 11:16:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 13A064EE0738;
 Fri,  6 Oct 2023 11:16:43 +0200 (CEST)
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
X-Inumbo-ID: 10f2d78a-6429-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 11:16:43 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 consulting@bugseng.com
Subject: Rule 10.1 violations in perfc_incra and PERFCOUNTER_ARRAY
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <5cfaaaceb163af3244981b020ed55f3f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Given the following macros in <xen/perfc.h> and

#define perfc_incra(x,y)                                                
\
     ( (y) <= PERFC_LAST_ ## x - PERFC_ ## x ?                           
\
	 ++this_cpu(perfcounters)[PERFC_ ## x + (y)] : 0 )

and the following violation

xen/arch/arm/traps.c:1407.5-1407.32:
   reference to enum constant `PERFC_hypercalls' has essential type `enum 
perfcounter'
   and standard type `int'
  <preprocessed xen/arch/arm/traps.c>:11606.29-11606.44: preprocessed 
tokens
  <scratch space>:137.1-137.16: expanded from macro `PERFC_'
  xen/include/xen/perfc.h:69.35-69.45: expanded from macro `perfc_incra'
xen/arch/arm/traps.c:1407.5-1407.32:
   `+' addition operator expects a number or a character
  <preprocessed xen/arch/arm/traps.c>:11606.46: preprocessed tokens
  xen/include/xen/perfc.h:69.47: expanded from macro `perfc_incra'

the difference between enumerated values is forbidden by the Rule. In 
the coding standard's
interpretation, named enums are unordered list of symbols, which can 
only be compared for
equality.
There are a few possible paths forward:

1. use means different from named enums to generate these constants 
(such as #define-s or
    constants integers);
2. explicitly deviate subtraction of enums, therefore defining an 
explicit ordering on
    enumerated values;
3. use an unnamed enum, effectively considering the enumerated values as 
plain integers.
    This does not violate the Rule.

Similarly the sum in

#define PERFCOUNTER_ARRAY( name, descr, size ) \
   PERFC_##name,                                \
   PERFC_LAST_##name = PERFC_ ## name + (size) - sizeof(char[2 * !!(size) 
- 1]),

causes other analogous violations.

Lastly, this is a concern that manifested only in ARM code, but does not 
seem to be related
to ARM-specific files, so there is perhaps some difference in the 
configuration of the two
analyzed builds.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

