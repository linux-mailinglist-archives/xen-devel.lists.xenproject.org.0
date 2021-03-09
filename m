Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70B332F6B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 20:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95735.180735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJiUa-000124-CV; Tue, 09 Mar 2021 19:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95735.180735; Tue, 09 Mar 2021 19:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJiUa-00010z-98; Tue, 09 Mar 2021 19:58:08 +0000
Received: by outflank-mailman (input) for mailman id 95735;
 Tue, 09 Mar 2021 19:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uN4=IH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJiUZ-00010t-AM
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 19:58:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5298766-ffaf-4d25-a25e-bead9c8d8734;
 Tue, 09 Mar 2021 19:58:05 +0000 (UTC)
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
X-Inumbo-ID: e5298766-ffaf-4d25-a25e-bead9c8d8734
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615319885;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ph6+vjGNebz+xJRp/BtoeAWuoF4vhl56XYXMIntmvVg=;
  b=WERVoIbE80fnWCVTc+4jlAPcLsagvEBAOTF803QBbKia4Hpcim+oGXBv
   HIMX5/Z5Dafb7ZyWzwSfJ2B+fSmQWl1XdA0PP0+d8SZD757a5OFcHV76b
   yjmE7UV0LbSEj9uV4NEME3kkH7GfXT83GQ09wqaij+fQjkREYv6Xm3dhi
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Oz2MRHUGCKPRx62BpRwaKit0MPbMbrhCdqtR9oWlfaGACbELzMbKb6a4amctUv+kPdsN1xI/HJ
 wf4QaEDv025tlUgc+yRrylIMcBHY0yTGp1UP0UI6va71AubZixi7ZJ+Msy+ZVE8anVficjpBn1
 0YzP2xTS2icgnaAEcsyULjzkFG41W/RIVCwlYi4PJWnGIl2yLh6m77qa+8Rq7buwKIvjO4BB2O
 0XfALhMtNuHeN/7hbUgfKF9IM0HM1V/yMjji/q+kn+3X+fHcNE/Aq2H3A0aeTsnL9fIH7ZcL9o
 SRs=
X-SBRS: 5.2
X-MesageID: 38892319
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,236,1610427600"; 
   d="scan'208";a="38892319"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTvAz2W8PrXZ1dfNX7Tiby1pZIQGZA9/WU4qezrys4ZFgLLN5c9+ellW8sYkUBIRo40CMoC38L54OLubz7MXrj+SO/wG3lrgpv+PmLeZadzm7qfLFSdAu636vK4JO+YmocZb2rdVNGAfpRJiCB93xTPFzOOgSYyyMt4r8q9TPhllw47idm8+AmZxeJACFzqZEebtEUVdxTcPI+NXFbpbaMEsxihLfbkQA505e4xoT/o6CElOngVWieHMiCNXAQLFdYC+7U37iToecBfeggFxNA+QzqlbX9Q/+SHZy2n+NaG3fbTXHkA+EnycMXAeJeZRO7GPO+ANCZw2lz2aYl4FFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvsyn4BQtuOsH1ezzYT6qfWEubjzVqiQLFtMWsBe5Gg=;
 b=ekmyCFYNxVbOpIoVpWWsemGJUe0yTtsn0MST6FWkhkPWvk7Y0EOLa1ZtlxmeNdNElBuyqc3Q8v8y7C/KKq20OWDLdTMyi3r+Qg7FAaYDSUGKhE1kQN3FYdjG6GQm/8dxsw6cT8kz1e/0mWZiSM4MGioBBvHBrxVCZJC+aogRhrpwrtEgLUw2GDC3YgzzXgFvB0WklbwUqSdwrAZGYRilZI33aI2gLZc6xTmyAyIavACFWGwa1LoNuFlqqmGzQuFeFFppoH/Z3VxY5TNQ7bAKOJIMwPG46yj2wXkUU1I7LvwJWRrCiQ3sTbhQXJfYU9kFHP8BTkA/O2gMeOo/TbwVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvsyn4BQtuOsH1ezzYT6qfWEubjzVqiQLFtMWsBe5Gg=;
 b=ih28x9AlhCjxOztbDazjxcQ0KoV0qNbmbhxT9Ej/jA02IWk3Ms7PWdwjwdql70ndMWBNzBtJJyMenZSc4yXwooB3KBbfmkCXbdvSeavBd066xkyYko67FQFmC/jozghXuLx2KJ9GFWStIGXFje64z9LEl+SuWDYxFX+3P2B8WVA=
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Message-ID: <4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com>
Date: Tue, 9 Mar 2021 19:57:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0472.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1025599-0fa1-4ccd-3c1c-08d8e3359ea2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB545437125AEFDE1572DC49A2BA929@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOV3GjUvGmMqSKOmIpRghAlQW7IxtqtMngGZ+Q6HzWRhfgUd+p2vQdVbxn+LQdus58fYfKZB8u2bWdnOoP4gACrcAbYctqFlMdV7P/hVVOnkvadW0iuppkx1fCKGOUf9cuOZp4R/hYlK7retusYuaLUjZ0i/+6vNNTqa2ItTjvZKaru53REWfJg70pHcV/YHnX+5+H7kvqhH192hVbbwqycYz7JSvDrnbfJPCnr7bDVC5mCm+IH+X/dAVhPSx3/ZZzSifhNRWpjnt4IhehifXU58k+Xu1yGaye2EfiJe1f2OLnuZBO4WOrXFyZp3oiWVZVqp+K4EUH5dM4GOYgnt8ra77f320NOX14pRf9KBPMRuZmk6Mo/HjoiZFsNcqA8LoJtjumFl+q3Ku/4pB9KaDjjTYV4QlCSxNGAje3ZrDpIkTwJjB+n8ZPL79OhpG5YvWvqJLp4FmqOW1t6Zd3zLH44PjKxepvcBCvTKmkInyIZZKFlSt9+jASV5LYtMW+CJiWDjGb1MpLmOii9K9wZQKsEifBuIdaAFplJd5p1AqlR/h7AjfZfvOQldFfX2yIC4QbUKwdRLFsElto/T4pTSZLl8Of35Bjz6V3BvUIH/K+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(86362001)(31686004)(31696002)(316002)(16576012)(110136005)(4326008)(54906003)(2906002)(5660300002)(2616005)(956004)(36756003)(478600001)(7416002)(6666004)(26005)(6486002)(53546011)(83380400001)(6636002)(8936002)(66476007)(66556008)(66946007)(8676002)(16526019)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0FOY0FzR25BT0hyeGRSUFpWa1YzYnpEL3NOcGtxbDN1L3N3T0tvbmRiNUR2?=
 =?utf-8?B?K0ZFRUZLNXVKT3J0UjBpUWs4azdtYUJsZVdQRVNWZWJac0lYUkpqN1Q2V1dC?=
 =?utf-8?B?dGYzSlR2SkJrdHRCTmU5ZDRsV0VQS0JSREM2UHplS0V2U0w1QUN2S0ptcklz?=
 =?utf-8?B?V1ltUDJRcDYxY0xNcVhpQXYvcGpTMkx2d0NDOG11Q0Q0ZUo3c2N3ZEVxTlN6?=
 =?utf-8?B?ZFo0YlUxc3JLdHVVL2d5dk1ibHFmbFBmN1d0ZkxTM3lIQzJmcm9oRWZHMURa?=
 =?utf-8?B?dTlpQmQ5Nyt6aERBTGJGMCtjeUpmbkcyY3huaFkycHU5UDJReVEyMnR4bHlU?=
 =?utf-8?B?RisxN3pGRS9yMVF3aXJjLzN1OVdIYXFlQW9tbFJFYlU5alJMbmlrMjVsSmFw?=
 =?utf-8?B?Y3JPTnJJQ2FpZklLWVpnYzU3QWphM25UbkZ1R3cydFJxN05BWVJLTWdwUmVJ?=
 =?utf-8?B?dkw4L2FMY25ZUlhraXZVTSt5dEc2VXUxdFhSQUdudnFhaDlsVFVqYU5QQ0Vt?=
 =?utf-8?B?NGV4NFVrK3RlYmxVanlldVZZWmg5NitjV2lmSm03ckdCWFJpMDJDb1VxaEVI?=
 =?utf-8?B?S1JXUXgrQzd2WDJIdHV2endrWUxjbGZZeVF4YTVwRHdCVVQ1ejI5NzY3RnNK?=
 =?utf-8?B?MFNBd0ZhZjQxNHJpendJVHZDZnplWld6R2l1U2ZheGhWWGtKRUFIbklyb3M3?=
 =?utf-8?B?WU9qek1DclROc3M3cEVYMHFId0lkak1XYUVlUlNxVU54NEFObjdqRVVLcmR3?=
 =?utf-8?B?bjEvT3BiUCtTa2RQUmxtYTlFTXA5cTk0aWlsWm91SmNOKzRLcFFlZmcxYnk0?=
 =?utf-8?B?S29oUjVFdWk3cUQyV0JtTm5TazZJL2FOMnZjOHF6OWJ0Z2kxY1I3Tk5DTTVG?=
 =?utf-8?B?Ty9QMVZSWUZibE5XTDFFSEZNOFVoVlIwUm9GdUtIS3ZJS3R3SDk2bnBTeXBP?=
 =?utf-8?B?L3VDcVh3Mmw5Vjg0ZEV2ZUpoTVp4bHhzcmNpMDlvUG9uclpjMndnVGpzYUxq?=
 =?utf-8?B?T1gyK3g4bWMrWGJ3SzJPR1c3SksrOU1hZ3NjTHBaYVJRUyttNE1qSm5HQzY3?=
 =?utf-8?B?SVNEZTJkRGYvM3BZM0RNd09TZjhBME1IZ1JsdFIwVGtmRTVycjV1K0tIMWFW?=
 =?utf-8?B?WkZzM1djTDhrcUpTSjVraVhqSFMyb3dPM2xzNlg1a0pscHFuQWdwMEg0aXNS?=
 =?utf-8?B?VzgwRGtXRkF0MS9JckZPblE5dEtzM1pQcy9nUm9wazJjRzVqN2lCam92RDlh?=
 =?utf-8?B?eWJhRFRyQU9TZ0xFUXRpNWVlTEtpY1R4N0lFUWR6Uzk0cWNkZ1NRUUg5RzlH?=
 =?utf-8?B?bUFvd1ZKQXdoWE1RTUsrTFFaYTJTeHNnRHVXWllDWmtzcTZRa1h4Ymd6WmFT?=
 =?utf-8?B?SVl0YTdELzlhQ1pvdHZxOVpJeEllUFNodDBlMDZuMmo5Nks2TU9oTURBUkN2?=
 =?utf-8?B?SjBhbU5QcklId2RIRkpvSFNNUkNjdmlFZzJhaE1KZXdVTEtjTmRxZXRhMDU4?=
 =?utf-8?B?MEdYQkVmakxtTGVEWndHSDBKRzdEV3NyOVFTTG0waGhta01PU3djWXNEYXh3?=
 =?utf-8?B?T2UyWisvVWs4Ym5CSUQrVUlINXZSQTZGSHU3bDRiUnZrbXFnTi94NThCWFl3?=
 =?utf-8?B?dzZGOG1YcXh5SmVwNTREY0Z4Sm4rbEhMSHkvMUpvQnRqRzhDTVFBNlZQSmpF?=
 =?utf-8?B?UmFYUVJUOE10L215UTF4ZmlmL2FKQWdneWhZTDRuRkdydTcyM1FPTUV6N2NK?=
 =?utf-8?Q?b1LsuwVExhPveZ9cB76kXI353ldHqfX/mEr7GDi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1025599-0fa1-4ccd-3c1c-08d8e3359ea2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 19:57:50.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vx4ljMiiYvCCPAHMKsrkcFe3FFane8jjSyk6UR/Me0I3zgZ5BIoWc0HSk2QLNNKE3YpGnEudAolmqYgCKPeNB31p7TeHiKxc7QD1CYugwiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 09/03/2021 11:36, Jan Beulich wrote:
> On 09.03.2021 11:56, Roger Pau Monne wrote:
>> Introduce an option to allow selecting a behavior similar to the pre
>> Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
>> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
>> handled by Xen result in the injection of a #GP to the guest. This
>> is a behavior change since previously a #GP was only injected if
>> accessing the MSR on the real hardware would also trigger a #GP, or if
>> the attempted to be set bits wouldn't match the hardware values (for
>> PV).
>>
>> This seems to be problematic for some guests, so introduce an option
>> to fallback to this kind of legacy behavior without leaking the
>> underlying MSR values to the guest.
>>
>> When the option is set, for both PV and HVM don't inject a #GP to the
>> guest on MSR read if reading the underlying MSR doesn't result in a
>> #GP, do the same for writes and simply discard the value to be written
>> on that case.
>>
>> Note that for guests restored or migrated from previous Xen versions
>> the option is enabled by default, in order to keep a compatible
>> MSR behavior. Such compatibility is done at the libxl layer, to avoid
>> higher-level toolstacks from having to know the details about this flag.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> I'm generally okay with this approach, but wouldn't want to give it
> my R-b until it's at least clear it's not entirely unacceptable to
> anyone else (Andrew in particular).

I'm broadly happy with this approach.=C2=A0 Some feedback just sent.

>  Couple of remarks:
>
>> Changes since v2:
>>  - Apply the option to both HVM and PV guest.
>>  - Handle both reads and writes.
> I take it that it's intentional that you didn't allow separate read
> and write control?

I think v3 is the correct approach.

This is strictly a backwards compatibility option.=C2=A0 Splitting read and
write just doubles the complexity the admin has wrestle with to recover
a legacy guest.

As we explicitly intend to retire the option in due course, this is very
much a "make my guest work until my upstream (either Xen or kernel) can
fix the bug".

>
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr=
, uint64_t *msr_content)
>>      const struct domain *d =3D v->domain;
>>      struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>>      const struct nestedsvm *nsvm =3D &vcpu_nestedsvm(v);
>> +    uint64_t tmp;
>> =20
>>      switch ( msr )
>>      {
> While to some degree a matter of taste, I think such variables needed
> only inside a switch() and not needing an initializer would better
> live in the respective switch()'s scope.

Actually, I was hoping to make a CODING_SYTLE change removing this as a
permitted construct.

Recent compilers have hardening features to automatically initialise all
stack variables, because even if your code isn't architecturally buggy,
an attacker can launch speculative attacks the stack rubble.

However, because of the way the compiler transform works, it cannot
tolerate this specific construct in a switch statement, as there is no
available execution to cope with the implicit "=3D0" or "=3DPOISON".

Even within Xen, we don't have many examples of this construct AFAICT,
and there is a concrete security advantage to being able to support the
compiler hardening.

>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>      const struct domain *currd =3D curr->domain;
>>      const struct cpuid_policy *cp =3D currd->arch.cpuid;
>>      bool vpmu_msr =3D false;
>> +    uint64_t tmp;
>>      int ret;
>> =20
>>      if ( (ret =3D guest_rdmsr(curr, reg, val)) !=3D X86EMUL_UNHANDLEABL=
E )
>> @@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val=
,
>>          }
>>          /* fall through */
>>      default:
>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
>> +        {
>> +            *val =3D 0;
>> +            return X86EMUL_OKAY;
>> +        }
>> +
>>          gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>>          break;
>> =20
>> @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t va=
l,
>>          }
>>          /* fall through */
>>      default:
>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
>> +            return X86EMUL_OKAY;
>> +
>>          gdprintk(XENLOG_WARNING,
>>                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>>                   reg, val);
> So what are your thoughts wrt my change to this file? Drop it
> altogether and require people to use this new option? Or do you
> see both coexist? In the latter case, since you had suggested
> that I drop the write side of my change - does your changing of
> the write path indicate you've changed your mind?

I don't think we should legitimise buggy PV behaviour, either by
codifying in the ABI, or providing a knob beyond this one.

A guest blindly stumbling forward with a missed #GP could very well
worse than crashing hard.

Case in point - the 4.15 behaviour spotted a very serious bug in NetBSD
where it tried writing MSR_PAT with its own choice (which wasn't the
same as Xen's choice).=C2=A0 The consequence of this bug is getting cache
attributes in pagetables wrong.

It is unfortunate that multiple bugs have combined to make this mess,
but every instance needs investigating and fixing.=C2=A0 Continuing to pape=
r
over the hole doesn't help anyone in the long run.

~Andrew


