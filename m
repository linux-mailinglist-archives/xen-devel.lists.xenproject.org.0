Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34961F021D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 23:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhK4l-0002oV-AM; Fri, 05 Jun 2020 21:40:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUU5=7S=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jhK4j-0002oQ-Tg
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 21:40:29 +0000
X-Inumbo-ID: 2c522c1a-a775-11ea-ba62-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c522c1a-a775-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 21:40:29 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 055LW58Y017757;
 Fri, 5 Jun 2020 21:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=92xTSdf3wbaz+/R0fTMy2xdg8meNwxO0k6N5Ns/wDW0=;
 b=I12g0M++UVMsOKnKxZcKguNHd2Ee2K3XHYVMz5W+kwyrJwTgQ+rx/3GAEgJtmYkCQlrv
 L94Lm2/njmucq9/7aq+y5QU3b9Qg6DBpgFVoo+9c6grxnVxtdg3tZjoXRS/DthdOv0ny
 k5DEiRJzwz3RGKN0iBfUtzHORGW8u16ZPVGV/4//99bLNnju6Bm8MNM2FbuuABzAyerI
 Vy5koEnazbwUixVGRRtBnOIYWO+vSMsiIV2NwuutbF2/INXiv19Rsw45WfKln1wi8D3P
 Q4o+XrAJ7Mf3GusxPtRQLtipZw0ZiMm1nl3ZaNJ90cFuX//h+eQIW40o1j/HVH8jeNS/ HQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 31f9244twh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 05 Jun 2020 21:40:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 055LYB2I033194;
 Fri, 5 Jun 2020 21:40:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 31f927ra3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Jun 2020 21:40:01 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 055LdwSK029799;
 Fri, 5 Jun 2020 21:39:58 GMT
Received: from [10.39.238.70] (/10.39.238.70)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 05 Jun 2020 14:39:58 -0700
Subject: Re: [PATCH 03/12] x86/xen: Introduce new function to map
 HYPERVISOR_shared_info on Resume
To: Anchal Agarwal <anchalag@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
 <529f544a64bb93b920bf86b1d3f86d93b0a4219b.1589926004.git.anchalag@amazon.com>
 <72989b50-0c13-7a2b-19e2-de4a3646c83f@oracle.com>
 <20200604230307.GB25251@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <9644a5f1-e1f8-5fe1-3135-cc6b4baf893b@oracle.com>
Date: Fri, 5 Jun 2020 17:39:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604230307.GB25251@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9643
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006050159
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9643
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
 lowpriorityscore=0 cotscore=-2147483648 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006050159
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
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, axboe@kernel.dk,
 konrad.wilk@oracle.com, bp@alien8.de, tglx@linutronix.de, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/4/20 7:03 PM, Anchal Agarwal wrote:
> On Sat, May 30, 2020 at 07:02:01PM -0400, Boris Ostrovsky wrote:
>> CAUTION: This email originated from outside of the organization. Do no=
t click links or open attachments unless you can confirm the sender and k=
now the content is safe.
>>
>>
>>
>> On 5/19/20 7:25 PM, Anchal Agarwal wrote:
>>> Introduce a small function which re-uses shared page's PA allocated
>>> during guest initialization time in reserve_shared_info() and not
>>> allocate new page during resume flow.
>>> It also  does the mapping of shared_info_page by calling
>>> xen_hvm_init_shared_info() to use the function.
>>>
>>> Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
>>> ---
>>>  arch/x86/xen/enlighten_hvm.c | 7 +++++++
>>>  arch/x86/xen/xen-ops.h       | 1 +
>>>  2 files changed, 8 insertions(+)
>>>
>>> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hv=
m.c
>>> index e138f7de52d2..75b1ec7a0fcd 100644
>>> --- a/arch/x86/xen/enlighten_hvm.c
>>> +++ b/arch/x86/xen/enlighten_hvm.c
>>> @@ -27,6 +27,13 @@
>>>
>>>  static unsigned long shared_info_pfn;
>>>
>>> +void xen_hvm_map_shared_info(void)
>>> +{
>>> +     xen_hvm_init_shared_info();
>>> +     if (shared_info_pfn)
>>> +             HYPERVISOR_shared_info =3D __va(PFN_PHYS(shared_info_pf=
n));
>>> +}
>>> +
>>
>> AFAICT it is only called once so I don't see a need for new routine.
>>
>>
> HYPERVISOR_shared_info can only be mapped in this scope without refacto=
ring
> much of the code.


Refactoring what? All am suggesting is

--- a/arch/x86/xen/suspend.c
+++ b/arch/x86/xen/suspend.c
@@ -124,7 +124,9 @@ static void xen_syscore_resume(void)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* No need to setup vcpu_info =
as it's already moved off */
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_hvm_map_shared_info();
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_hvm_init_shared_info();
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (shared_info_pfn)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 HYPERVISOR_shared_info =3D __va(PFN_PHYS(shared_info_pfn));
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvclock_resume();

>> And is it possible for shared_info_pfn to be NULL in resume path (whic=
h
>> is where this is called)?
>>
>>
> I don't think it should be, still a sanity check but I don't think its =
needed there
> because hibernation will fail in any case if thats the case.=20


If shared_info_pfn is NULL you'd have problems long before hibernation
started. We set it in xen_hvm_guest_init() and never touch again.


In fact, I'd argue that it should be __ro_after_init.


> However, HYPERVISOR_shared_info does needs to be re-mapped on resume as=
 its been
> marked to dummy address on suspend. Its also safe in case va changes.
> Does the answer your question?


I wasn't arguing whether HYPERVISOR_shared_info needs to be set, I was
only saying that shared_info_pfn doesn't need to be tested.


-boris



