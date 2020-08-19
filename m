Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D624A463
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RK6-0003ml-Vu; Wed, 19 Aug 2020 16:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RK5-0003kZ-K9
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:25 +0000
X-Inumbo-ID: 89c9041d-db2e-4060-ba49-5dcb8daba7c9
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89c9041d-db2e-4060-ba49-5dcb8daba7c9;
 Wed, 19 Aug 2020 16:52:19 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id p4so22238139qkf.0
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q2WqSu/8Zl6Xt4/uPButL58RhTDGnEGmRT5brdvV48g=;
 b=FHlSPZgWsTZnk9cy0v9F8mqtk7ZfgppGTXmeBM3Q63Lm1GM/s1L6taBFvRrH/PFaEY
 ek9BRNL9ZOHCax8zb9g2gdgoiD/MbNmFdpjMZ6jy10v+qLuOYmUIIEWzmRr6DafacayG
 OtAZd3JjRpdDMDS0Flv886DsVv9rH/ORiQNoK20Yr54gNSeF2sl1EBJhYvojhqNpVIay
 OYpCJdlp1KgjGiogSSAwWK8gp7sQmSpDlv6HRxFZNZDVBo6pBpgMIWGRdo6praNdVU/i
 KLNzcE9LBna8/YGum4scb2PIdqlZdmbzAU6lbTGz8EIYUaXUIlBif1ql45D+C6AG34JM
 oM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q2WqSu/8Zl6Xt4/uPButL58RhTDGnEGmRT5brdvV48g=;
 b=bKkBgIDVHdfYFc7x2t+h5O+WY2cikC42paumqOKgohBHQYLBU1CubxV8jqal3KV4mf
 XAbGviB/L+Q0+URFVd6fhKDoLaXh2iluAlu/VtRFBWqDv4M8TVxV2E8T7M+8aoTbq8nD
 n57HBBQDVbhvo+nxHkJUt83H3XHYNxmiaTBTrUsMGNONFjZ8Go9Uk8d9M5SumK7Xs9Xp
 GQd1+c+1zDdDK1IM4z5mgzS+EQfj9n+8F+VNIPXhOqfSes7mZdd31MqsZLtquqO+leqD
 4QgkilD4jl91FDszMs8c0XswTOqw03LczuXhZXrfRko/HJO+/XVzjDC/NkY7//YlG8j1
 2ifQ==
X-Gm-Message-State: AOAM530IvhoSDFagA3cDdo8/8tV5b8OhCB2OP+Lplu2YOC43z9w86Km3
 FGZDJcfN+4RPuCvjRKrF0pkRFq74ANKZnmne
X-Google-Smtp-Source: ABdhPJyxhPlMJ/1BUEhvk2+Ps4DNzQxzhMLNNicZ5+ACUW5/9lKXjM4YlouOXKjBQFe0HsZbTVShVg==
X-Received: by 2002:a05:620a:11a6:: with SMTP id
 c6mr18687936qkk.209.1597855937973; 
 Wed, 19 Aug 2020 09:52:17 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:17 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 0/8] Xen VMware tools support
Date: Wed, 19 Aug 2020 12:51:54 -0400
Message-Id: <cover.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <don.slutz@gmail.com>

https://lists.xenproject.org/archives/html/xen-devel/2016-01/msg01105.html

Is the last message on the list.  I do not have this message to directly
reply to.  I plan to try and continue this as part of this version.

Changes v13 to v14:
  Rebased on staging (not a simple rebase, needed rework to function
  with changes).

  Since over 4 years have passed, moved all Acked-by, Reviewed-by
  to under the ---

  Jan Beulich (#2 xen: Add support for VMware cpuid)
    why this needs to be a 64-bit quantity?
      changed to 32 bit.

  Jan Beulich (#5 xen: Add vmware_port support)
    why you couldn't just use another XEN_X86_EMU_ ...
      Drop arch_flags and use XEN_X86_EMU_VMWARE_PORT which will not be
      added to "all".

  Paul Durrant (#7 Add IOREQ_TYPE_VMWARE_PORT)
    Reworked the "Verify the emulation request has been correctly re-issued"
    to have a pre if.
    Made a single statement.
    Code no longer exists.  But, there is a way to not have it.
    See HVM_IOREQSRV_DISABLE_VMPORT

  Jan Beulich (#7 Add IOREQ_TYPE_VMWARE_PORT)
    Was left off in the middle
      I think haveing the current state of the code posted will help.

    don't think having something prefixed vmware_ in the Xen public
    headers is a good idea.
      Also did not reach a clear resolution.
        Last statement:
          All of this may be true and fine, but none of this is - to me - a
          reason to introduce new unclean names into the Xen public
          interface. In no event do I see qemu dictating naming to us.
        My current answer:
          My take on this is that you want me to use a different name,
          is vmport_regs a name you can live with?

    Also throughout the series I didn't find any code addition to
    guarantee (perhaps at build time) that BDOOR_PORT doesn't
    collide with any other use ports 
      Added BUILD_BUG_ON for all that can be checked at build time,
      which I think answers this.

    Long line needs breaking up.
      Fixed.
    The parameter should no longer be named "buf".
      Changed to pt.
    Do you really need to set up a (dummy) range set for this
      Last version did not finsh on this.  Here is what I think now:
      hvm_select_ioreq_server() uses this "dummy" range to see if a given
      IOREQ Server should be picked.  XEN_DMOP_map_io_range_to_ioreq_server
      and XEN_DMOP_unmap_io_range_from_ioreq_server can be used to enable
      or disable vmport usage at any time.      

    Several comments on vmport_check_port
      All changed.
    Lower case please (and ...
      Changed to lower case in the enum.
    But accessing BDOOR_PORT + 1 with a 4-byte operation ought to
    be undefined (or properly split up). After all you don't know what is
    on BDOOR_PORT + 4.
      Changed to only allow BDOOR_PORT with a 4-byte operation.

  --Fixed bug in hvm_alloc_legacy_ioreq_gfn: the if is always false.

  (#8 Add xentrace to vmware_port)
    Added VMPORT_SEND because I wanted to see it during testing.


Changes v12 to v13:
  Rebased on staging (not a simple rebase, needed rework to function
  with changes).

  Ian Campbell (#1: tools: Add vga=vmware):
    Added Acked-by.

  Konrad Rzeszutek Wilk (#2: xen: Add support for VMware cpuid leaves):
    Adjust temporary comment to include which patch.
    Adjust copyright year to 2012-2015

  Ian Campbell (#2: xen: Add support for VMware cpuid leaves):
    Added Tools side only: Acked-by

  Konrad Rzeszutek Wilk (#3: tools: Add vmware_hwver support):
    Perhaps add 'Recommended value is 7' ?
      Ian Campbell: Assuming that is a good recommendation then that might
                    be a good enhancement for a future patch. Or
                    perhaps some sort of simple mapping from VMware
                    product versions/names to a suitable value to
                    use, unless that means having to think about
                    trademarks etc.
       So did no change here.

  Ian Campbell (#3: tools: Add vmware_hwver support):
    Added Acked-by.

  Ian Campbell (#6: tools: Add vmware_port support):
    Added Acked-by.

  Konrad Rzeszutek Wilk (#7: Add IOREQ_TYPE_VMWARE_PORT):
    I would have made this !vmport_check_port ...
       Changed to !is_vmware, and invert vmport_check_port's return value.
    That would mean you could also change the function to be 'is_port_vmport' or
    such.
       Did not change at this time.
    Comments on code that no longer exists do to re-work, just
    dropped.
    Use 1 one for "list_for_each_entry ( sv, ..."
      Done.
    Full stop missing in comments.
      Done.

  Andrew Cooper (#8: Add xentrace to vmware_port):
    Please do this by extending the existing infrastructure rather
    than special-casing 7 on the side.  (i.e. extend ND to take 7
    parameters, and introduce HVMTRACE_7D)
      Done.
    = { d1, d2, d3, d4, d5, d6, d7 } will be far shorter, linewise.
      Done.


Changes v11 to v12:
  Rebased on staging.

  Jan Beulich (xen: Add ring 3 vmware_port support)
    As there don't seem to be enough convincing arguments for this
    to be worthwhile, I'm going to drop this...
      Dropped the 2 ring3 patches.

  Ian Campbell (tools: Add vmware_hwver support):
    s/come/comes/
      Done
    I'm not sure this hunk has anything to do with this patch, nor
    what the semantic difference between the old and new text is
    supposed to be.
      Dropped comment change.

  Ian Campbell (multiple):
    In v11 this seems to have morphed into only
    LIBXL_HAVE_LIBXL_VGA_INTERFACE_TYPE_VMWARE being provided, which
    is clearly not an appropriate umbrella #define.

    "#define LIBXL_HAVE_CREATEINFO_VMWARE 1"
    Lets just have a single one of these indicating support for
    vmware, it should be added at the end of the series after all
    the baseline vmware functionality is in place. I think that
    means hwver, vga=vmware and this port stuff.

      Make (tools: Add vga=vmware) no longer independent.
      Change the #define to "LIBXL_HAVE_VMWARE"

   Jan Beulich (xen: Add vmware_port support):
     Surrounding code avoiding the use of "break" makes the result
     look rather inconsistent. Please move this up immediately after
     the XSM check, or drop the "break".
       Moved it up.

   George Dunlap (Add IOREQ_TYPE_VMWARE_PORT):
     Sorry for coming a bit late to this party.  On a high level I
     think this is good, but there doesn't seem to be anything in
     here in particular that is vmware-specific.  Would it make more
     sense to give this a more generic name, and have it include all
     of the general-purpose registers?
       Did not change at this time because QEMU would need changes 1st.

   George Dunlap (Add xentrace to vmware_port):
     Do you need to log edi as well? It looks like it's not used.
       I think it makes sense to indicate that edi can be used and
       may in the future.
     And do you need to log all the registers here?  It seems like
     port + regs->_ecx would be enough to tell you why it got
     ignored.
        Adjusted to log just port and eax (ecx was NOT tested for).


Changes v10 to v11:

  Andrew Cooper & Ian Campbell (#1 "tools: Add vga=vmware"):
    Nack. Qemu-trad is currently has remote code execution vulnerabilities.
      Dropped support for Qemu-trad.
    
     Also changed later patchs to not need this one.

  Andrew Cooper (#2 "xen: Add support for VMware cpuid leaves"):
    Needs re-base.
      Done
    Adjust /* Disallow if vmware_hwver */
      Done
    Newline after break;
      Done 2 places.
    Allowed Reviewed-by: Andrew Cooper, if these changes are done.
      Added Reviewed-by: Andrew Cooper.

   Julien Grall (#2 "xen: Add support for VMware cpuid leaves"):
    It would be worth to add an explicit vmware_hwver = 0 in the
    libxl__arch_domain_prepare_config.
      Done -- Note: Adds a tool change to this patch.

  (#3 "tools: Add vmware_hwver support"):
    Since Qemu-trad does not support vga=vmware,
    Dropped "If non-zero then default VGA to VMware's VGA"

  Andrew Cooper (#5 "xen: Add vmware_port support"):
    You will not be getting here for a non HVM domain...
      Dropped ASSERT(is_hvm_domain(currd))
    Newline after break;
      Done 6 places.
    Allowed Reviewed-by: Andrew Cooper, if these changes are done.
      Added Reviewed-by: Andrew Cooper.

  (#7 "tools: Add vmware_port support"):
    Since Qemu-trad does not support vga=vmware,
    Dropped "If non-zero then default VGA to VMware's VGA"

Changes v9 to v10:
  Split out LIBXL_VGA_INTERFACE_TYPE_VMWARE into it's own patch (#1)
  that can stand alone.  In the patch set because a later patch
  depends on it.

  Reworked to be based on:

    commit a7511905fae7ba592c5bf63cd77d8ff78087d689
    Author: Julien Grall <julien.grall@linaro.org>
    Date:   Wed Apr 1 17:21:41 2015 +0100

        xen: Extend DOMCTL createdomain to support arch configuration

  rebased onto:

    commit e13013dbf1d5997915548a3b5f1c39594d8c1d7b
    Author: Yang Hongyang <yanghy@cn.fujitsu.com>
    Date:   Thu May 14 16:55:18 2015 +0800

        libxc/restore: add checkpointed flag to the restore context


  Andrew Cooper (#2: "xen: Add support for VMware cpuid leaves"):
    Did not add "Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>"
    because of changes here to do things the new way.
  Reword comment message to reflect new way.

  Ian Campbell (#3 "tools: Add vmware_hwver support"):
    LIBXL_HAVE_LIBXL_VGA_INTERFACE_TYPE_VMWARE &
    LIBXL_HAVE_BUILDINFO_HVM_VMWARE_HWVER are arriving together
    a single umbrella could be used.
      Since I split the LIBXL_VGA_INTERFACE_TYPE_VMWARE into
      it's own patch, this is not longer true.
      But I did use 1 for the 2 c_info changes.
    Please use GCSPRINTF.
      Done.
  Remove vga=vmware from here.

  Ian Campbell (#3 "tools: Add vmware_hwver support"):
    For "Add IOREQ_TYPE_VMWARE_PORT"
      With those fixed the tools/* bits are:
        Acked-by: Ian Campbell <ian.campbell@citrix.com>  
    Did not add Acked-by to "tools: Add vmware_hwver support"
    because of the rework for using libxl_domain_create_info.

  Andrew Cooper (#4: "vmware: Add VMware provided include file."):
    Added "Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>"

  Andrew Cooper (#5 "xen: Add vmware_port support"):
    Probably better as EOPNOTSUPP, as it is a configuration problem.
      Done.
    vmport_ioport function looks as if it should be static.
      Done.
    Why is GETHZ the only one of these with a CPL check?
      Please see thread for detail.
    I would suggest putting vmport_register declaration in hvm.h ...
      Done.

  Jan Beulich (#5 "xen: Add vmware_port support"):
    As indicated before, I don't think this is a good use case for a
    domain creation flag.
      Switch to the new config way.
    struct domain *d => struct domain *currd
      Done
    Are you sure you don't want to zero the high halves of 64-bit ...
      Comment added.
   Then just have this handled into the default case.
      Reworked new_eax handling.
   is_hvm_domain(currd)
   And - why here rather than before the switch() or even right at the
   start of the function?
      Moved to start.
   With that, is it really correct that OUT updates the other registers
   just like IN? If so, this deserves a comment, so that readers won't
   think this is in error.
     All done in comment at start.

  Andrew Cooper (#6 "xen: Add ring 3 vmware_port support"):
    >> This looks horribly invasive.
    >>
    >> Why are emulation changes needed?  What is wrong with the normal
    >> handling with a registered ioport handler?
    > Because VMware made a bad way to provide a "hyper call".  They decided to
    > allow user access to this.  So when a #GP fault should have been
    > reported, they instead do the "hyper call".
    >
    Urgh - now I remember.

    Right.  In the case that vmport is active, we start intercepting #GP
    faults and emulating access.  That part of the patch looks ok.

    However, the rest is very invasive to the emulation infrastructure.
      Re-worked along this lines suggested.

  Jan Beulich (#6 "xen: Add ring 3 vmware_port support"):
    I hope that vmport_check will no longer be needed with the adjustments ...
    > Since this is not an architecture feature and I do not expect any real
    > CPUs to support this, I do not expect any other use.  But I am happy
    > to make it more generic.

    Let's see how this ends up looking - the hook is probably indeed
    bogus (from an architectural pov) no matter how you name it.
      Last e-mail on thread, so no change.

  Ian Campbell (#7 "tools: Add vmware_port support"):
    If..." at the start of the sentence ...
      Used Ian's reword.
    Also, why is 7 special?
      Attempted to better explain.

  Paul Durrant & Jan Beulich (#8 "Add IOREQ_TYPE_VMWARE_PORT"):
    Now that buf is no longer a bool, could ...
    These literals should become an enum
      Added an enum.
    I don't think the invalidate type is needed.
      Dropped.
    IOREQ_TYPE_VMWARE_PORT as 3 is a re-use.
      Switch to 9.
    Code handling "case X86EMUL_UNHANDLEABLE:" in emulate.c
    is unclear.
       Re-worked to a version that Jan likes better.
    Comment about "special' range of 1" is not clear.
       Re-worded comments.

  Ian Campbell (#9 "Add xentrace to vmware_port"):
    Acked-by
  Readded dropped traces.

  Jan Beulich & Andrew Cooper (#9 "Add xentrace to vmware_port"):
    Why is cmd in this patch?
      Because the trace points use it.

  Jan Beulich (#10 "test_x86_emulator.c: Add tests for #GP usage"):
    Need more comments and simpler error checking.
      Done.  
      Dropped un-needed new routines.

  Andrew Cooper:
    That is because you broke it adding a bool_t item.
      Has now been dropped.


Changes v8 to v9:
  Overview of changes:
    s/vmware_hw/vmware_hwver/i
    Switch to x86_emulator to handle #GP
    New patch: Move MAX_INST_LEN into x86_emulate.h
    Add QEMU usage, patch #8 "Add IOREQ_TYPE_VMWARE_PORT"
    Split patch "xen: Add vmware_port support" into 2. 1st has same
    name.  New one is "xen: Add ring 3 vmware_port support".
    Added 3 new patches about test_x86_emulator.

  
  Jan Beulich (#2: "xen: Add support for VMware cpuid leaves"):
    Change -EXDEV to EOPNOTSUPP.
      Done.
    adding another subdirectory: xen/arch/x86/hvm/vmware
    Much will depend on the discussion of the subsequent patches.
      TBD.
    So for versions < 7 there's effectively no CPUID support at all?
      Changed to check at entry.
    The comment /* Params for VMware */ seems wrong...
      Changed to /* emulated VMware Hardware Version */
    Also please use d, not _d in #define is_vmware_domain()
      Changed.  Line is now > 80 characters, so split into 2.

  Andrew Cooper (#3: "tools: Add vmware_hwver support"):
      I assumed that s/vmware_hw/vmware_hwver/ is not a big enough
      change to drop the Reviewed-by.  Did a minor edit to the
      commit message to add 7 to the list of values checked.

  Jan Beulich (#4: "vmware: Add VMware provided include file"):
    Either the description is wrong, or the patch is stale.
      stale commit message -- fixed.
    I'd say a file with a single comment line in it would suffice.
      Done.

  Jan Beulich (#5: "xen: Add vmware_port support"):
    Can you explain why a HVM param isn't suitable here?
      Issue with changing QEMU on the fly.
      Andrew Cooper: My recommendation is still to use a creation flag
        So no change.
    Please move SVM's identical definition into ...
      Did this as #1.  No longer needed, but since the patch was ready
      I have included it.
    --Lots of questions about code that no long is part of this patch. --
    With this, is handling other than 32-bit in/out really
    meaningful/correct?
      Added comment about this.
    Since you can't get here for PV, I can't see what you need this.
      Changed to an ASSERT.
    Why version 4?
      Added comment about this.
    -- Several questions about register changes.
      Re-coded to use new_eax and set *val to this.
      Change to generealy use reg->_e..
    These ei1/ei2 checks belong in the callers imo -
      Moved.
    the "port" function parameter isn't even checked
      Add check for exact match.
    If dropping the code is safe without also forbidding the
    combination of nested and VMware emulation.
      Added the forbidding the combination of nested and VMware.
      Mostly do to the cases of the nested virtual code is the one
      to handle VMware stuff if needed, not the root one.  Also I am
      having issues testing xen nested in xen and using hvm.

      

Changes v7 to v8:

  Jan Beulich:
    Coding changes to vmport_ioport. Things like:
-             regs->rax = (uint32_t)~0ul;
+             regs->_eax = ~0u;
      
  Andrew Cooper (#2: "tools: Add vmware_hwver support"):
    Other than these two comments, the rest of the patch looks ok, so...
      Added Reviewed-by after addressing the "Spurious whitepsace change".
      and the wording in the new docs/misc/hypervisor-cpuid.markdown.


Changes v6 to v7:
  summary of changes.

  George Dunlap:
    Any doc about this?
      Added reference to:
        https://sites.google.com/site/chitchatvmback/backdoor
      Last updated: Feb. 2008

  George Dunlap & Jan Beulich
    Too much logging and tracing.
      Dropped a lot of it.  This includes vmport_debug=

  Ian Campbell:
    Any reason RPC code cannot be done in QEMU?
      Not that I know of, so dropped all parts of RPC code.
    Default handling of hvm.vga.kind bad.
      Fixed.
    Default of vmware_port should be based on vmware_hw.
      Done. 

  Tim Deegan:
    CPL check of GETHZ needs to be fixed somewhere.
      Added check for CPL == 0 (assuming this is what VMware is
      checking.  Matches the testing.

  Ian Campbell, Andrew Cooper, George Dunlap, Boris Ostrovsky,
   & Jan Beulich
     Various minor fixes.
    
  Per patch notes:
    #1 "xen: Add support for VMware cpuid leaves":
      Prevent setting of HVM_PARAM_VIRIDIAN if HVM_PARAM_VMWARE_HW set.
    #4 "xen: Add vmware_port support":
      More on AMD in the commit message.
      Switch to only change 32bit part of registers, what VMware
        does.
    #6 "Add xentrace to vmware_port":
      Dropped some of the new traces.
      Added HVMTRACE_ND7.
    #7 "Add xen-hvm-param":
       Was a later patch.  Still optional.
       Fixed formatting.
       Adjust for drop of VMware RPC.

Comments on v3, v4, v5, v6:
  George Dunlap:
    Is there any reason not to merge 05/16 with 03/16?
      The reason I have is that v3 03/16 only contains new files. 2
      from VMware and 1 to allow use of the VMware files.  I added
      xen/arch/x86/hvm/vmware/includeCheck.h at the request of
      Konrad Wilk.

      This patch has many style issues and white space issues.  So I
      want it as a separate patch so as to be clear on what files do
      not meet the coding style.  And why and where they came from.

Changes v5 to v6:
  Boris Ostrovsky & Jan Beulich
    #4 "xen: Add vmware_port support":
    #6 "xen: Convert vmware_port to xentrace usage":
    There is an issue with reading instruction bytes more then once.
      Dropped the attempt to use svm_nextrip_insn_length via
      __get_instruction_length (added in v2).  Just always look
      at upto 15 bytes on AMD.

Changes v4 to v5:
  Re tagged the optional patches.

  Added debug=y build checking that vmx is defining
  VM_EXIT_INTR_ERROR_CODE.

  Boris Ostrovsky:
    #1 "xen: Add support for VMware cpuid leaves":
      Given how is_viridian and is_vmware are defined I think '||' is more
      appropriate.
        Fixed.
    #4 "xen: Add is_vmware_port_enabled":
      we should make sure that svm_vmexit_gp_intercept is not executed for
      any other guest.
        Added an ASSERT on is_vmware_port_enabled.
      magic integers?
        Added #define for them.
    #6 "xen: Convert vmware_port to xentrace usage":
      exitinfo1 is used twice.
        Fixed.
    #7 "tools: Convert vmware_port to xentrace usage":
      'bytes = 0x%(2)d' or 'bytes = %(2)d' ?
        Fixed.
    #8 "xen: Add limited support of VMware's hyper-call rpc":
      PV vs. HVM vs. PVH. So probably 'if(is_hvm_vcpu)'?
        I see no reason to exclude PVH.   Will change to has_hvm_container_vcpu
    #11 "Add live migration of VMware's hyper-call":
      You ASSERTed that vg->key_len is 1 so you may not need the 'if'.
        That is a ASSERT(sizeof, not just ASSERT -- not changed.
      Use real errno, not -1.
        Fixed.
      No ASSERT in vmport_load_domain_ctxt
        Added.

  Jan Beulich & Boris Ostrovsky:
    #8 "xen: Add limited support of VMware's hyper-call rpc":
      The names of all three functions are bogus.
        removed static support routines.
        Also changed in #1.

  Andrew Cooper:
    #2 "tools: Add vmware_hw support":
      Anything looking for Xen according to the Xen cpuid instructions...
        Adjusted doc to new wording.
    #4 "xen: Add is_vmware_port_enabled":
      I am fairly certain that you need some brackets here.
        Added brackets.

  Jan Beulich & Andrew Cooper:
    #1 "xen: Add support for VMware cpuid leaves":
      This hunk is unrelated, but is perhaps something better fixed.
        Added to commit message.
      include <xen/types.h> (IIRC) please.
        Done.
      At least 1 pair of brackets please, especially as the placement of
      brackets affects the result of this particular calculation.
        Switch to "1000000ull / APIC_BUS_CYCLE_NS"      


Changes v3 to v4:
  Ian Campbell:
    Report on both viridian and vmware_hw set.
    Added LIBXL_VGA_INTERFACE_TYPE_VMWARE (vga=vmware).

  Andrew Cooper:
    Add doc for hypervisor-cpuid.

  Boris Ostrovsky:
    Changing regs->error_code may not be a good idea.
      Dropped this.
    
  Jan Beulich & Boris Ostrovsky:
    Only enable vmwxit for GP when vmware_port is set.
      Done.


Changes v2 to v3:

  Add optional unit test tools.
  Re-worked split of changes.

  Jan Beulich:
    for #0:
      I don't think you should be adding a new fine in hvm/ _and_ a new
      subdirectory.
        Moved all files to hvm/vmware that contain code.
    for old #1 (now #1 & #2):
      Is there really a point in enabling both Viridian and VMware extensions?
        I still think so.
      hvmloader change: This needs an explanation
        Dropped as not need now.
      Can you make vmware_hw similar to Viridian, returning success when
      setting the value to what it already is.
        Done.
      You don't seem to be using sub_idx: ...
        Dropped.
      Extra changes...
        Dropped.
    for old #2 (now #3):
      ... these guards have the (theoretical at this point) risk of clashing
      ... the patch is obviously incomplete without this header...
        Did not fix any of these issues.  I will stick with this needs
        to be a 2nd patch that changes the include files to better fit
        in Xen coding.  For now these files are in a sub directory
        which is not part of the normal include search.
        Moved the includeCheck.h file into this patch.
    for old #3 (now #4, #5, #6, #7, #8, #9, #10, #11)
      As I think was said on v1 already - this should be split into smaller
      pieces ...
        Done.
      All this would very likely better go into a separate function placed in
      vmport.c.
        Moved most of the code into vmport.c or vmport_rpc.c.
      In any event I'm rather uncomfortable about vmware_port getting
      enabled unconditionally, ...
        Added vmware_port (done in new patches #4, #5) as an xl.cfg
        option.
      You'll have to go through and fix coding style issues.
        I think I have found all these, but since they do not stand out
        for me, let me know of any left.
      "MAKE_INSTR(IN," name is ambiguous.
        Added all 4 opcodes for in and out that can access this port: INB_DX,
        INL_DX, OUTB_DX, OUTL_DX.
      A VMX-specific function shouldn't be named this way...
        Added new common routine vmport_gp_check() that is called from
        both vmx.c and svm.c which is where all the logic about checking
        for IN ans OUT is done.
        Also fixed naming and added static.
      Ah, here we go (as to using HVM_DBG_LOG()): Isn't this _way_ too
      fine grained?
        I have reduced the number of bits used.  Partialy by switching
        some to xentrace (new patch #6 and #7).
      Right, and zero is an indication that it wasn't found. Also I just
      noticed there's a gdprintk() in that event, which for all other ...
        Made the gdprintk() optional.

End of v3 changes.

This is a small part of the changes needed to allow running Linux
and windows (and others) guests that were built on VMware and run
run them unchanged on Xen.

This small part is the start of Xen support of VMware backdoor I/O
port which is how VMware tools (a standard addition installed on a
guest) communicates to the hypervisor.

I picked this subset to start with because it only has changes in
Xen.

Some of this code is already in QEMU and so KVM has some of this
already.  QEMU supported backdoor commands include VMware mouse
support.  A later patch set exists that links these changes, new
code and Xen changes to QEMU to provide VMware mouse support under
Xen.  The important part is that VMware mouse is an absolute
position mouse and so network delays do not effect usage of the
virtual mouse.

For example from the guest:

[root@C63-min-tools ~]# vmtoolsd --cmd "info-get guestinfo.joejoel"
No value found
[root@C63-min-tools ~]# vmtoolsd --cmd "info-set guestinfo.joejoel short"

[root@C63-min-tools ~]# vmtoolsd --cmd "info-get guestinfo.joejoel"
short
[root@C63-min-tools ~]# vmtoolsd --cmd "info-set guestinfo.joejoel long222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000joel"

[root@C63-min-tools ~]# vmtoolsd --cmd "info-get guestinfo.key1"
data1
[root@C63-min-tools ~]# vmtoolsd --cmd "info-get guestinfo.key2"
No value found
[root@C63-min-tools ~]# vmtoolsd --cmd "info-get guestinfo.key2"
data2
[root@C63-min-tools ~]# 


Most of this code has been reverse engineered by looking at
source code for Linux and open VMware tools.

http://open-vm-tools.sourceforge.net


changes RFC to v2:

Jan Beulich:
  Add xen/arch/x86/hvm/vmware.c for cpuid_vmware_leaves
  Fewer patches

Andrew Cooper:
  use the proper constant for apic_khz
  Follow 839b966e3f587bbb1a0d954230fb3904330dccb6 style changes.
  Changed HVM_PARAM_VMWARE_HW to write once (make is_vmware_domain()
    more static).
  Dropped vmport status stuff.
  Added checks for xzalloc() having failed.
  You should include backdoor_def.h ...
     Every thing I tried did not work better.  So I did not
     change VMPORT_PORT and BDOOR_PORT being the same value.
     I did not try and adjust VMware's include file backdoor_def.h
     to working in other xen source files.
  Switching to s_time_t is not valid. get_sec() is defined:
    unsigned long get_sec(void);
  and so my uses of it should be using unsigned long.  However
  since that is not a fixed width type, I used the uint64_t
  data type which is almost the same, but does allow the 32 bit
  build of libxc, libxl to do the correct thing.


Konrad Rzeszutek Wilk:
  Please don't include the address. It should be, etc
      about the Vmware provided include files.
    I went with no changes to these files.  Even if the files should
    be changed to match xen coding style, etc I still feel that the
    original ones should be added via a patch, and then adjusted in a
    2nd patch.
  Can you use XenBus?
    I would say no.  XenBus (and XenStore) is about domain to domain
    communication.  This is about VMware's hyper-call and providing
    access to VMware's guest info very low speed access.

Olaf Hering:
   Dropped changing of bios-strings.  Still needs some documentation
   about this may be needed to do in a tool stack or set of commands.


Boris Ostrovsky:
  Use svm_nextrip_insn_length()
    Looks like __get_instruction_length() does this, so switched to
    __get_instruction_length().
 
RFC:

See

http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1009458

for info on detecting VMware.

Linux does not follow this exactly.  It checks for CPUID 1st.  If
that fails, it checks for SMBIOS containing "VMware" (not VMware- or
VMW).

So this patch set provides:

        SMBIOS -- Add string VMware-
        CPUID -- Add VMware's CPUID (Note: currently HyperV (viridian support) breaks this check.)
        Add the magic VMware port
            Allow VMware tools poweroff and reboot
            Enable access to VMware's guest info
            Provide the VMware tools build number


Don Slutz (8):
  tools: Add vga=vmware
  xen: Add support for VMware cpuid leaves
  tools: Add vmware_hwver support
  vmware: Add VMware provided include file.
  xen: Add vmware_port support
  tools: Add vmware_port support
  Add IOREQ_TYPE_VMWARE_PORT
  Add xentrace to vmware_port

 docs/man/xl.cfg.5.pod.in               |  36 +++-
 tools/libs/devicemodel/core.c          |   4 +-
 tools/libxc/include/xc_dom.h           |   2 +-
 tools/libxc/xc_dom_x86.c               |   3 +
 tools/libxl/libxl.h                    |   5 +
 tools/libxl/libxl_create.c             |  14 +-
 tools/libxl/libxl_dm.c                 |  11 ++
 tools/libxl/libxl_types.idl            |   3 +
 tools/libxl/libxl_x86.c                |   3 +
 tools/xentrace/formats                 |   6 +
 tools/xl/xl_parse.c                    |   6 +
 xen/arch/x86/cpuid.c                   |   4 +
 xen/arch/x86/domain.c                  |  20 +-
 xen/arch/x86/hvm/Makefile              |   1 +
 xen/arch/x86/hvm/dm.c                  |   3 +-
 xen/arch/x86/hvm/emulate.c             |  57 +++++-
 xen/arch/x86/hvm/hvm.c                 |  21 ++
 xen/arch/x86/hvm/ioreq.c               | 351 ++++++++++++++++++++++++++++-----
 xen/arch/x86/hvm/svm/svm.c             |   6 +-
 xen/arch/x86/hvm/vmware/Makefile       |   2 +
 xen/arch/x86/hvm/vmware/backdoor_def.h | 167 ++++++++++++++++
 xen/arch/x86/hvm/vmware/includeCheck.h |   1 +
 xen/arch/x86/hvm/vmware/vmport.c       | 194 ++++++++++++++++++
 xen/arch/x86/hvm/vmware/vmware.c       |  82 ++++++++
 xen/arch/x86/hvm/vmx/vmx.c             |   6 +-
 xen/arch/x86/traps.c                   |  21 +-
 xen/include/asm-x86/hvm/domain.h       |  10 +-
 xen/include/asm-x86/hvm/hvm.h          |  18 ++
 xen/include/asm-x86/hvm/trace.h        |  60 +++---
 xen/include/asm-x86/hvm/vmware.h       |  33 ++++
 xen/include/public/arch-x86/xen.h      |   5 +
 xen/include/public/hvm/dm_op.h         |  21 +-
 xen/include/public/hvm/ioreq.h         |  17 ++
 xen/include/public/hvm/params.h        |   2 +-
 xen/include/public/trace.h             |   4 +
 35 files changed, 1088 insertions(+), 111 deletions(-)
 create mode 100644 xen/arch/x86/hvm/vmware/Makefile
 create mode 100644 xen/arch/x86/hvm/vmware/backdoor_def.h
 create mode 100644 xen/arch/x86/hvm/vmware/includeCheck.h
 create mode 100644 xen/arch/x86/hvm/vmware/vmport.c
 create mode 100644 xen/arch/x86/hvm/vmware/vmware.c
 create mode 100644 xen/include/asm-x86/hvm/vmware.h

-- 
1.8.3.1


