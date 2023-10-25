Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8C7D6EB7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622953.970257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvetn-00044W-8j; Wed, 25 Oct 2023 14:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622953.970257; Wed, 25 Oct 2023 14:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvetn-00041f-60; Wed, 25 Oct 2023 14:30:19 +0000
Received: by outflank-mailman (input) for mailman id 622953;
 Wed, 25 Oct 2023 14:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kl7N=GH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvetl-00041Z-JF
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:30:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e6c453-7343-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:30:16 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BD2B14EE073A;
 Wed, 25 Oct 2023 16:30:15 +0200 (CEST)
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
X-Inumbo-ID: 03e6c453-7343-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 25 Oct 2023 16:30:15 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] x86/vlapic: address a violation of MISRA C:2012 Rule
 16.2
In-Reply-To: <b07f9709-5f4c-a079-140e-c3da371929df@suse.com>
References: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
 <b07f9709-5f4c-a079-140e-c3da371929df@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <221fe25e118912453aa2e956c11656f4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:44, Jan Beulich wrote:
> On 25.10.2023 15:22, Nicola Vetrini wrote:
>> The clauses of a switch should be enclosed directly by a switch
>> statement to make the code more easily understandable and less
>> prone to errors.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This patch is mainly indended to probe how the community, especially 
>> the
>> maintainers, would receive such modifications to the code, and whether 
>> there
>> would be consensus on the rule's adoption. Anyone is welcome to
>> give feedback on this, especially on the x86 side, where this pattern
>> is used more frequently.
> 
> The chosen instance (below) is one where it is relatively easy to argue
> that putting the default label in an inner scope isn't much of a
> difference as far as overall code size / redundancy is concerned. But
> there are (perhaps many) other cases where the gains of using what
> Misra dislikes are much higher.
> 
> This is another one of the various more recently discussed rules where
> I think Misra is just going too far, dictating various aspects of style
> for - in my personal view - no real gain. Furthermore, if you could
> pick some more involved example (arch/x86/x86_emulate/x86_emulate.c may
> yield a few "good" examples), I'd like to learn how you propose to
> change such code, with two up-front constraints:
> - no added redundancy,
> - no new goto.
> Either of them in replacement code would go against what the 
> description
> above states as a goal.
> 
> Jan
> 

Honestly, I think none of those is attainable in such cases as the ones 
in x86_emulate.c

Take, for instance,

index 94caec1d142c..2a70c5f0a197 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1492,10 +1492,10 @@ x86_emulate(
          if ( ops->rmw && dst.type == OP_MEM )
              state->rmw = rmw_add;
          else
-        {
-    case 0x02 ... 0x05: /* add */
              emulate_2op_SrcV("add", src, dst, _regs.eflags);
-        }
+        break;
+    case 0x02 ... 0x05: /* add */
+        emulate_2op_SrcV("add", src, dst, _regs.eflags);
          break;

or

@@ -3504,13 +3504,16 @@ x86_emulate(
  #if !defined(X86EMUL_NO_MMX) && !defined(X86EMUL_NO_SIMD)

      case X86EMUL_OPC_66(0x0f, 0x2a):       /* cvtpi2pd mm/m64,xmm */
-        if ( ea.type == OP_REG )
-        {
+        if ( ea.type == OP_REG ) {
+            host_and_vcpu_must_have(mmx);
+            op_bytes = (b & 4) && (vex.pfx & VEX_PREFIX_DOUBLE_MASK) ? 
16 : 8;
+            goto simd_0f_fp;
+        }
+        break;
      case X86EMUL_OPC(0x0f, 0x2a):          /* cvtpi2ps mm/m64,xmm */
      CASE_SIMD_PACKED_FP(, 0x0f, 0x2c):     /* cvttp{s,d}2pi xmm/mem,mm 
*/
      CASE_SIMD_PACKED_FP(, 0x0f, 0x2d):     /* cvtp{s,d}2pi xmm/mem,mm 
*/
-            host_and_vcpu_must_have(mmx);
-        }
+        host_and_vcpu_must_have(mmx);
          op_bytes = (b & 4) && (vex.pfx & VEX_PREFIX_DOUBLE_MASK) ? 16 : 
8;
          goto simd_0f_fp;

here, I think some amount of duplication is unavoidable.
Global deviation is quite a viable option, and in fact the one I would 
favour the most.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

