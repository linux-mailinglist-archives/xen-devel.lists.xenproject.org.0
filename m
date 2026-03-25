Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMUbM3eww2nAtAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 10:52:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804D5322770
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 10:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261837.1554594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Kuj-0003JU-PJ; Wed, 25 Mar 2026 09:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261837.1554594; Wed, 25 Mar 2026 09:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Kuj-0003H7-MN; Wed, 25 Mar 2026 09:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1261837;
 Wed, 25 Mar 2026 09:52:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c3b062.v1-14bbfae5b9ba48c48016e920f26295b8@bounce.vates.tech>)
 id 1w5Kui-0003H1-FZ
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 09:52:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Kug-00C2yo-9i
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:52:35 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c3b062.v1-14bbfae5b9ba48c48016e920f26295b8@bounce.vates.tech>)
 id 69c3b060-5cb7-0a2a0a5109dd-0a2a450ab64c-10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:52:35 +0100
Received: from [198.2.132.30] (helo=mail132-30.atl131.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c3b062.v1-14bbfae5b9ba48c48016e920f26295b8@bounce.vates.tech>)
 id 69c3b062-1772-0a2a450a0019-c602841ee076-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:52:35 +0100
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fghz63BVTzP0K4yd
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 09:52:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 14bbfae5b9ba48c48016e920f26295b8; Wed, 25 Mar 2026 09:52:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774432354; x=1774702354;
	bh=UaxZica+m1LUQHGkzYfJ1+kqnXdJBmBtC5PuT3IRKuc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KoZO8QbzfTcB/A2lvA2Ohl9BPqfIwjvwyrCyW+557NlgNk15fiHj1D9w5PR95LRvL
	 cSrgIVOXOKUc772OPX2p0AwGvQg4Hy+JfDM5K3FM1OwfFja2ycNrBQhStodmzFomZW
	 eOwwOHhi3pNPXfP4iw2cPwluQtvwVgoozWYsRtfhMlPrzbJ/bbi4T6Gvu4WkGEVfPE
	 7uvtG1IXQFKlZVUt3PR0yHMsEZskrslokZfzhylb+stNU6GTHGK3dDLHLRUPzcN+7z
	 xaLnFc/Uaf5tbAamOxPcUeBq66+wv4RYUCucM6rJqgVamwyvLKNbIqX8n3eZHEMfkC
	 YBGvMEhRbpfRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774432354; x=1774692854; i=teddy.astie@vates.tech;
	bh=UaxZica+m1LUQHGkzYfJ1+kqnXdJBmBtC5PuT3IRKuc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qO7ETy4sAC9m6AVduv6MVBrin3g0wC0iqzQuYiGeLPJSUpfs+jA6iupVHrLAX10m8
	 33mSvuVzlPXxJINx/MAFNTTHO+aL1yKarjrRQ6se4IIq2D8ORBU+WbKml7s1xbOiIl
	 pKQlvk5ABfbtbic062rZdodwWeoK53g3Hv1TXK8h89QhLznG8cYK1mttz0mvWJy85x
	 a9iAgHbdtMOoDCK1nv2X8EWnZT3aljxssAnPUpionpq5EK9i36WQSPVDAGgYrQweF1
	 lZfezYTnwR5BA5dleaktp2GIyfMo+QcWk1zzfhVoeys6ttWJnvhHgbRulwSQ+Um4QC
	 Yk9weToOGREIg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/6]=20x86/vpmu:=20Sanitise=20Intel=20PMU=20version?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774432353580
Message-Id: <1bb2df7c-aabb-4449-9a77-8449b0d1a6cb@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech> <dcd278658139976d1af92b4d201c17e12cf7eb2b.1773160025.git.teddy.astie@vates.tech> <0857c00d-f11e-4b84-8988-e7a096aa55f5@suse.com>
In-Reply-To: <0857c00d-f11e-4b84-8988-e7a096aa55f5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.14bbfae5b9ba48c48016e920f26295b8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260325:md
Date: Wed, 25 Mar 2026 09:52:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1774432355-BE691900-D3F13F7E/0/0
X-purgate-type: clean
X-purgate-size: 1934
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 804D5322770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 24/03/2026 =C3=A0 17:03, Jan Beulich a =C3=A9crit=C2=A0:
> On 10.03.2026 17:44, Teddy Astie wrote:
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -253,6 +253,33 @@ static void recalculate_xstate(struct cpu_policy *p=
)
>>       }
>>   }
>>   
>> +static void sanitise_vpmu(struct cpu_policy *p)
>> +{
>> +switch ( p->x86_vendor )
> 
> Nit: Lack of indentation.
> 
>> +    {
>> +    case X86_VENDOR_INTEL:
>> +        if ( !p->basic.pmu.version )
>> +            return;
> 
> Better use "break", but: Why is this check needed anyway? Nothing ...
> 

My idea was to return early if there is no version (keeping everything 
0). But as I only added checks for PMU version in this patch, this is 
effectively redundant at this moment.

Although, "x86/vpmu: Limit to using supported general/fixed counters" 
makes some additional adjustments to the CPUID if pmu.version !=3D 0 
making it non redundant anymore.

But yes, it wants 'break' here.

>> +        /*
>> +         * Expose up to PMU version 2
>> +         *
>> +         * PMU version 3 introduced the AnyThread bit we don't want
>> +         * to support (see "AnyThread Counting and Software Evolution"
>> +         * regarding notes with virtualization). This is the only known
>> +         * feature introduced in PMU version 3.
>> +         *
>> +         * PMU version 5 deprecated AnyThread, and introduced a CPUID
>> +         * bit (ANYTHREAD_DEPRECATION) to indicate that this bit isn't =
supported.
>> +         * That CPUID bit should be set for PMU version 5.
>> +         */
>> +        if ( p->basic.pmu.version > 2 )
>> +            p->basic.pmu.version =3D 2;
>> +
>> +        break;
>> +    }
> 
> ... here breaks if it was dropped.
> 
> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



