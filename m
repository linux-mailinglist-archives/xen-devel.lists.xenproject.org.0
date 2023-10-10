Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F837BF6BB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 11:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614623.955819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq8fF-0007vz-7m; Tue, 10 Oct 2023 09:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614623.955819; Tue, 10 Oct 2023 09:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq8fF-0007uC-4e; Tue, 10 Oct 2023 09:04:29 +0000
Received: by outflank-mailman (input) for mailman id 614623;
 Tue, 10 Oct 2023 09:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+X1=FY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qq8fE-0007u6-DW
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 09:04:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ae73b0-674c-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 11:04:27 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id DC4B54EE0742;
 Tue, 10 Oct 2023 11:04:26 +0200 (CEST)
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
X-Inumbo-ID: 03ae73b0-674c-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 11:04:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, Ayan Kumar Halder
 <ayan.kumar.halder@amd.com>, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
In-Reply-To: <2AC05F6B-477A-45C3-A865-E0917692EE12@arm.com>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
 <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org>
 <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
 <2AC05F6B-477A-45C3-A865-E0917692EE12@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <784666fd145d1bdcd2afc4607de12dd1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2023 09:29, Luca Fancellu wrote:
>> 
>>>> /* SAF-x-safe */
>>>> if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) && (modrm_reg & 7) ==
>>>> MASK_EXTR(instr_modrm, 0070) && (modrm_rm & 7)  == 
>>>> MASK_EXTR(instr_modrm,
>>>> 0007) )
>>>> 
>>>> Any other ideas?
>>> 
>>> Could we have a number in the comment to indicate the number of lines 
>>> the
>>> comment applies to?
>> 
>> Luca can confirm that what I am about to write is correct; my
>> understanding is that ECLAIR supports it, but cppcheck does not. Which
>> means for cppcheck we would have to translate the SAF tag with
>> xen_analyize to:
>> 
>> /* cppcheck tag */
>> line1
>> /* cppcheck tag */
>> line2
>> /* cppcheck tag */
>> line3
>> 
>> and that would end up changing the line numbers in the source files so
>> the cppcheck report wouldn't match with the original line numbers any
>> longer
> 
> Yes, but it’s not only Cppcheck, it’s also Coverity that supports only
> the above notation.
> 
> For Cppcheck we could do something, but for Coverity we can’t.
> 
> Anyway, Stefano or Nicola, I would like to understand where Eclair
> reports the violation
> in the case of #define, does it report at the usage or at the 
> definition?
> 
> Cheers,
> Luca

The report is at the usage site, but ECLAIR can be configured to deviate 
based on a comment
at the macro definition, or also just the macro name for reports of that 
rule (e.g. Q[1-3]):

#define M(a, b) (b)
/* -E> safe MC3R1.R7.1 1 blabla */
#define Q1(s) M(s, 0300)
/* -E> safe MC3R1.R7.1 1 blabla */
#define Q2(s) M(s, 0070)
/* -E> safe MC3R1.R7.1 1 blabla */
#define Q3(s) M(s, 0007)

void f(void) {
   int x = 1;
   int y = 2;
   if ( (x & 2) == Q1(y) &&
        (x & 3) == Q2(y) &&
        (x & 7) == Q3(y) )
   {
      y = y + 1;
   }
}

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

