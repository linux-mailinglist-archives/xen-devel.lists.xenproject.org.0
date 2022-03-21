Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5444E2C43
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 16:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293057.497779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJy2-0004ec-WC; Mon, 21 Mar 2022 15:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293057.497779; Mon, 21 Mar 2022 15:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJy2-0004cB-Si; Mon, 21 Mar 2022 15:29:10 +0000
Received: by outflank-mailman (input) for mailman id 293057;
 Mon, 21 Mar 2022 15:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XmvP=UA=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWJy1-0004bB-IC
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 15:29:09 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a619810a-a92b-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 16:29:08 +0100 (CET)
Received: by mail-oi1-x22e.google.com with SMTP id ay7so16558177oib.8
 for <xen-devel@lists.xenproject.org>; Mon, 21 Mar 2022 08:29:08 -0700 (PDT)
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
X-Inumbo-ID: a619810a-a92b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5lBj1J0avmJHMDFFacrl//nl+Gdx/FJHfmxHmrANteA=;
        b=F+Lf4lnNXrMeZDgRsgvxwK9NtXVKkns8Q30LhOZsPMc78mSwE4icVbpOq1lf9r5OlV
         K78IzdLQEEWX3j8a6rzNJ2GhADxejTrSpKd6ML5/DLhwQEFZb2XmPbfPxgrmbShAZNbs
         juaCT2MGZDGRL2FhPQz1ZQrMpphEFHqtTDrRoahcizyysfQHvOEu5hT1GI3BJj9KSapa
         NIv/2WAVKLe9CgFI/13mKSovnCVireVLQ6Vg9BsS0a4ojJT8aOlnT9cMfiEz5+TqtKSP
         SlwER6gBALFmMTc+2r8wjy/0IJAY9FX9yIh5UO42JBt2yARQYIbyE5rQvJTL6L/pP98z
         ovmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5lBj1J0avmJHMDFFacrl//nl+Gdx/FJHfmxHmrANteA=;
        b=7UQGrgnL/jIh79ao1VddCSGzXUv9lKWF6GwMqFgZYid5gQtwVtNTjGdx52WZ3j8ClY
         YLWI22y8a39WWoD5ZxOSkXOHR+H6PQQ8eT0aKYVN41/FB2VLhNNgnFslJoDngXotP8aW
         OltQoZ7PiERTm4wxy9zAKgPe1YHbvwyQkaix8X4iCnSNuhm0w2bKIeiWrcNhjiwWSfPx
         Bp+3Y+BhOfmJrtxw+lg1V+RKdra/4twv8h8RCw54n04DKm7UG79e0bQ9+vDf7y4Upp9Q
         KUDHQFGv3t/xtM0vvKzcJgNEhqmjTyUYoTPVf8Er3kGCrkOmIwoitei0XX39wfYyRPWQ
         tfBA==
X-Gm-Message-State: AOAM531IaMRXPlY4FtYF2ysb5ZQ5sC9uP5Zyjf6dGXqbFt2nf8dnJVhw
	AeJ9zr7ZynYUa+4jOcHxJ9sbb4RpOAMbQq2IBrc=
X-Google-Smtp-Source: ABdhPJw43zpp+exGaPdDwzMn5duc/AlKJ/MtGxBh++GoRmHToJWc3sc+63cYxfK2BPvE9QT7go5P1lBMSXqns429OHs=
X-Received: by 2002:aca:d12:0:b0:2ee:f684:bd4b with SMTP id
 18-20020aca0d12000000b002eef684bd4bmr11920713oin.128.1647876547223; Mon, 21
 Mar 2022 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
 <ca8f13e5-5e3e-e64f-2711-4730883a24fc@suse.com> <CABfawhn3-zRJ+m9nJsOGBL=8gkVmzOyE_ttuWJcSLd4UseLzXQ@mail.gmail.com>
 <dc3cc4f9-e1ba-b73e-9527-7a3a85043505@suse.com>
In-Reply-To: <dc3cc4f9-e1ba-b73e-9527-7a3a85043505@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 21 Mar 2022 11:28:31 -0400
Message-ID: <CABfawhmqZS5_gjpUxye2LvzcpS93Oj2U0-gsNfMBXjt3dLxrKQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86/vmx: save guest non-register state in hvm_hw_cpu
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 10:58 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 21.03.2022 15:39, Tamas K Lengyel wrote:
> > On Mon, Mar 21, 2022 at 8:16 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 17.03.2022 16:57, Tamas K Lengyel wrote:
> >>> @@ -166,6 +167,11 @@ struct hvm_hw_cpu {
> >>>  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
> >>>      uint32_t flags;
> >>>      uint32_t pad0;
> >>> +
> >>> +    /* non-register state */
> >>> +    uint32_t activity_state;
> >>> +    uint32_t interruptibility_state;
> >>> +    uint64_t pending_dbg;
> >>>  };
> >>
> >> ... these fields now represent vendor state in a supposedly vendor
> >> independent structure. Besides my wish to see this represented in
> >> field naming (thus at least making provisions for SVM to gain
> >> similar support; perhaps easiest would be to include these in a
> >> sub-structure with a field name of "vmx"), I wonder in how far cross-
> >> vendor migration was taken into consideration. As long as the fields
> >> are zero / ignored, things wouldn't be worse than before your
> >> change, but I think it wants spelling out that the SVM counterpart(s)
> >> may not be added by way of making a VMX/SVM union.
> >
> > I wasn't aware cross-vendor migration is even a thing.
>
> It used to be a thing long ago; it may not work right now for no-one
> testing it.
>
> > But adding a
> > vmx sub-structure seems to me a workable route, we would perhaps just
> > need an extra field that specifies where the fields were taken
> > (vmx/svm) and ignore them if the place where the restore is taking
> > place doesn't match where the save happened. That would be equivalent
> > to how migration works today. Thoughts?
>
> I don't think such a field is needed, at least not right away, as
> long as the respectively other vendor's fields are left zero when
> storing the data. These fields being zero matches current behavior
> of not communicating the values at all. A separate flag might be
> needed if the receiving side would want to "emulate" settings from
> incoming values from the respectively other vendor. Yet even then
> only one of the two sets of fields could potentially be non-zero
> (both being non-zero is an error imo); both fields being zero
> would be compatible both ways. Hence it would be possible to
> determine the source vendor without an extra field even then, I
> would think.
>
> A separate flag would of course be needed if we meant to overlay
> the vendors' data in a union. But as per my earlier reply I think
> we're better off not using a union in this case.

Right, both structs being non-zero at the same time wouldn't make
sense and would indicate corruption of the hvm save file. But I think
the same would easily be achieved by defining a bit on the flags and
then a union. If two vendor bits are set that would indicate an error
without taking up the same with two separate structs. This is what I
have right now and IMHO it looks good
(https://xenbits.xen.org/gitweb/?p=people/tklengyel/xen.git;a=commitdiff;h=84f15b2e1bef6c901bbdf29a07c7904cb365c0b2):

--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -52,6 +52,7 @@ DECLARE_HVM_SAVE_TYPE(HEADER, 1, struct hvm_save_header);
  * Compat:
  *     - Pre-3.4 didn't have msr_tsc_aux
  *     - Pre-4.7 didn't have fpu_initialised
+ *     - Pre-4.17 didn't have non-register state
  */

 struct hvm_hw_cpu {
@@ -163,9 +164,21 @@ struct hvm_hw_cpu {
     uint32_t error_code;

 #define _XEN_X86_FPU_INITIALISED        0
+#define _XEN_X86_VMX                    1
 #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
+#define XEN_X86_VMX                     (1U<<_XEN_X86_VMX)
     uint32_t flags;
     uint32_t pad0;
+
+    /* non-register state */
+    union {
+        /* if flags & XEN_X86_VMX */
+        struct {
+            uint32_t activity_state;
+            uint32_t interruptibility_info;
+            uint64_t pending_dbg;
+        } vmx;
+    };
 };

Tamas

