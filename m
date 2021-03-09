Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18F3327D1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95438.180246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcot-0006Cl-6Y; Tue, 09 Mar 2021 13:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95438.180246; Tue, 09 Mar 2021 13:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcot-0006CP-3X; Tue, 09 Mar 2021 13:54:43 +0000
Received: by outflank-mailman (input) for mailman id 95438;
 Tue, 09 Mar 2021 13:54:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJcor-0006CK-N4
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:54:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d76b7dbf-fe7f-42e0-99c8-ffa6888d6a86;
 Tue, 09 Mar 2021 13:54:40 +0000 (UTC)
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
X-Inumbo-ID: d76b7dbf-fe7f-42e0-99c8-ffa6888d6a86
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615298080;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1+KscXvyCCD81TD7F9sW2175DPD5UtaWe9uwNTX/4lE=;
  b=XA9blZjoX/zNTUASH/WEB4DWDYsCIzHEv/Y9j+RGT1i4sLbVz7bGOldC
   LDb+HUONpVdiGakFqzXmEJkyxQ6/bEba98MavOuSspFonquMRKwNE8nH0
   hw1uxJIshBKsvJ30DX+XzpW2j09yy7c5L5A+oan2PJ6++1Mf51sUYin3Y
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7BTF9tYZq/oJHFo9+fB43BybqSCa9BsLB22fhRHUsO1xn3B+XgZX8oM7LUXUutUZF7hSqOhM1r
 zL9RBZYKTxypwoqA00q4+f+e+MV+gJSSARO1m3aESkMN0cTnu4ALTSWqHwAJcclD5VGrBUEnzv
 BQdSHq0zBJhMKW3OV6bIKo15SgJnFiR0PJLat3mjQhU2YDnM/o5WiR6N674ZRMJjripUwZnZeI
 zaL3Et02Q/52oXh/xVv/EpVQcZGnMo/p0VR/8tmsvge2+1w2hS73ZGmSJ0Z/weKHMPMPcgmwBL
 nfM=
X-SBRS: 5.2
X-MesageID: 39226148
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="39226148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4vfSxcrU6nhlKKD/fnPp8zC1LgVd8MfrL8OzdPH5oychq9IQsLc5bJ4LvQXEWjpZZyuULFKTPmMO95HxOG+QBqxKtPOsDmIxFHIrM5zy9sYg3nEUF8AHIzD9zdafpSwCoArPzAM8KmmQPMG8rYmeVuWIX2+n0zrPZP/t+UUH6os65bONYyh8hRltFhONuMy4bp63baBO+9Vpt/oazOh27KGLji9XXRDGAVOAGVguUNgrBlTkk2PMBApx6/+fWVqD+U5YptEgvX8IkIJnPwUJsRrPgMV+bY3oe9EJRqE+My7kvzVFuJt8V34ZXTeBkoO6MV0+4ihLwPlIv4QDBsusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6nC5FmpFN+MJz4419r0TamyGM7/BsI6Yi5wphL6dqY=;
 b=CUm0co0sPuQebDdkvbmL3hQsspdvMuFTVOt30ZyzGO/N596CJhRrabA69GDWmzlAKfHey1ot++7zTC+/6NNQOc8+MO57UQMde/givqRMaXbHHRaTv8xoH5DiwOTPqTUNcThiUJpKO5g0YTxZi8AhoshfhPIrLCloQtcaYFlrlZPGFQViY8Jn0MNEPZpR1QhYth0T3iW+1IeoTFnAIA9CIDYUMvt1+rPvy47WRzGlQrJc+CqMIbahA6thP1mR3XwMw64PjEmEfTd+0/AenpER4wd7dgM/IyKFIHR5YeLytO7rmQxEOMBdGTnaNSmdWyxH7KsKm0ipYxfArECaiF/YzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6nC5FmpFN+MJz4419r0TamyGM7/BsI6Yi5wphL6dqY=;
 b=aQ69vAHn5hnq7+iBA/APE0S6Kzj20TKtatHkLzoVLGa8CK/P1O6JidI7o7C9SJis6cy35PPQ/S1wbO0lsR2LChWvoLARq0vhLm0VEFSYnEQe15ClbJRL+02FMcY1Gw8SfZXQZhwzhHwmRKeO0/1MS9+d2SoDoMvU7+F6Enyr9hc=
Date: Tue, 9 Mar 2021 14:53:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Anthony PERARD" <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Message-ID: <YEd98T104rrsmn2S@Air-de-Roger>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
X-ClientProxiedBy: LO2P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16945f3a-b25b-4693-1b87-08d8e302c9ed
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB40575FB3BF9D9619C56BEEEF8F929@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8LBlOlpSMXp3gJB61iJ0TG7djpAGegB7/YWMwyb69+COPGiVxNERcUV7UMx/shwtyVqMztNQUO6ueCyNAPi+wZnKz/R8dEFWxKZoVzFzglWIHDvFGK3Ceft7AtTNZCHgPmc3jGd9/A97qHiCOcngpH/SWp+/JR8gSlJwAA26tLUN8UQhJZAu78QNpIA4atuFWFYhQyk9akHqe5lT4bfHVUQ5crwXPGxSPDLdJgFoOVnH1+xa1CMNl9smo3jz5HagigxLWfI0f8jyHlT7dxrH25wUSn+DPmrmbH5Qm8nogm1FJinVwK695bWNMqZu+gy40GD/dq450pYx9UZlX9SnZd+DGhFa4g8rjwYDTBDme6jLR26UgMkCh0tlEfwCk5TG54Xpp3er+hj4bzotgxbrMMPcF2v0UmOUULKO214aiL9xcPaURiwdXBNeU6539SRRpKQnywXfPApgP2zWmfp1v6VGydugJaZBgafESnsg5m0ipshJAVg1svx1EF3veh/1prS53DPcgg8ZUZymblCGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(6496006)(6666004)(53546011)(8676002)(7416002)(33716001)(6486002)(9686003)(85182001)(5660300002)(86362001)(186003)(66946007)(66556008)(16526019)(478600001)(4326008)(26005)(54906003)(956004)(8936002)(6916009)(83380400001)(316002)(2906002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEt2WUo4YW1SeUlRN1Y2d293WHBNYVhrZk1aUWVaSzhTaXVoOU9aaGNpSnpr?=
 =?utf-8?B?WnF6SnkwaVV1ZXY2ZVltVDF1S29JcjI3VEpTNzNZOTVuaUVBZmxmVUw5eVRt?=
 =?utf-8?B?WFgzMVNnQ0Y3QXk1eDNoK1lQamdVNTBjbnRGTU5sSXk4UGtGTVVQMEF2aDF4?=
 =?utf-8?B?TmtWM2RRT3FOcG1SNFExdWd3dzNiRStsQjlwQUtHR2JrQ1VyRWx0WlVhWlVT?=
 =?utf-8?B?TFRjQTZlRDBoeGtaWEU2M292Sjd1R0hVbHF1bjBCK3dLcDZkeml0KytrbE9E?=
 =?utf-8?B?NW1yem1ldVh2WXlUK09jNmMrazJETVVWVnYrbjJYQ1VZZzVEc0RySUYvNWVs?=
 =?utf-8?B?MVpZaWNIOVFkeDVLR1JJbzQ3R1h6R0pFVHRyYW9wYXNVaFl6a29FTEhZNmxV?=
 =?utf-8?B?M1g2QnZhQkhpV3doWkY4NE1tKzczeXUySngvZU9BWWRzWGdaUGFoM3Y0eFNB?=
 =?utf-8?B?UnpjK1Q2Z21QZTZZVXJuTEUyNkJEWnY4ZzAvamFjN1Y3SmNBSCtlSHFZUFJW?=
 =?utf-8?B?Z0RlMWxJVXZWdEYzbGZKNXpad1lCb3VLNURFRHBVRk5qellTYTB3YVdwQ0Vl?=
 =?utf-8?B?OFRYS3hOMCtGZ2ZxNDY1OTRSS0gvd2JWdnRuMG5TZXRIVmt3VVN4UjNOSFo4?=
 =?utf-8?B?QjN6Q2I2eFlJZWplZG9kY1hqaDZrMzdvbGErZG1SZHF6RkxObDZVbFB0aHdP?=
 =?utf-8?B?Q1QwR3YyNlF4Qk5VdHd5ZksxVDFPeDVIT3Bob04wMzkyN2ZCSWZ2SVFlNHFv?=
 =?utf-8?B?U2ZZZis0Vlh6a3gwelJONmlQbWQ1aUVvL1h1ai9vMThrQkJXOGxRS1VBOVl2?=
 =?utf-8?B?TkpmQWtvMTcvY0R1MTYxVytSRVJXZ0JGZVVnc3pld0RLVnRjK0orZlhQcG5s?=
 =?utf-8?B?UndwS0ZvY3pPWnY1b0ZXWkNRMlVVaTV4U2FjbWpaV3NpT1QvL2NlZlZoV2Jn?=
 =?utf-8?B?WmZpSXlmNDZDQnpPU1ppNUtuc1JpeE9ob0drcDZaTWdnQ0ZHZHFOOHNFVFlo?=
 =?utf-8?B?SDdpakg1cWtnckhyaTZZVVIwVzBFZHV5cUJZZGxoREtwWkQ4WkJpOTFSc1dp?=
 =?utf-8?B?dWVYczlzWDIxSmNHRDV1V2pVV2hiUkdCMUw0WXhvTktQVHh5cHY1eXlPbURp?=
 =?utf-8?B?Yi9UYkl0SndhYlBmZnh2ZjkrK2FRY1ovdks0WWJaWXpNdWs1aWR6bS9NMC9F?=
 =?utf-8?B?YU9VM1JwRm01R0NUN1Z1eE4vS1dGbGwxcy94NWdLOEErbldtVW9icVUrb0tW?=
 =?utf-8?B?OXhCQ2VsRzNxRmdMTUlVZE5xV0M1b3Z6bEIrRUdCeU94S1A2SVhIWFUzZlpO?=
 =?utf-8?B?VmxCRzBzSlNoSENublJPVFFoaTZFMm84WlV5NGlNdXpHTW1Bdy8xOFBqUFZQ?=
 =?utf-8?B?TTNueGNsZzUzZjQ2NzlrWGYyMytHSERPa1lJM2Q5UkpMQTVaRVpnZWZxSnJk?=
 =?utf-8?B?Z0JUNnhjMEJzT1pJL0svUVFIRGlPNWE4K1NmYndsYXhXT294WjB4SHRUdlZZ?=
 =?utf-8?B?d2pQNkl1M1NGelVJWEJGTjRjMm1rUW81UzN3WTFtN1loY09BQ3BEMVZmWmFl?=
 =?utf-8?B?eTFkS3lDSkx6WWtxS0ZoUDFnLzZ6Z005UHpPRFNzZFY5M3RWMVk1SEpRbGcr?=
 =?utf-8?B?SkE5bHcrR3BQSU1UOTd2c3ZHRVBBUFV3RVVBL0t0VXJvOW5yQnNkWG1qbm9r?=
 =?utf-8?B?RXdWQXU2WXo3cDNaTVdTK085K3kyaC9yMFhLWkxIWXpBenhEQTRqTzJQNTJw?=
 =?utf-8?B?RlYxaWpLbWlvMXU0MVhUQnNMN2N1SjI3MFQveDNGQmJaT2hRNG1iVTduS2lk?=
 =?utf-8?B?YmxiQkVPL2lPMGI5RnVhZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16945f3a-b25b-4693-1b87-08d8e302c9ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 13:53:59.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBO6exsclYOaEm5txLnqoXvHxs2jnKYjBqrivIgK0ohh7GL1M3wOi9hLVLkJ2Y3cA9MZBOzn7Ns4FYbqK96u/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 12:36:39PM +0100, Jan Beulich wrote:
> On 09.03.2021 11:56, Roger Pau Monne wrote:
> > Introduce an option to allow selecting a behavior similar to the pre
> > Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
> > 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> > handled by Xen result in the injection of a #GP to the guest. This
> > is a behavior change since previously a #GP was only injected if
> > accessing the MSR on the real hardware would also trigger a #GP, or if
> > the attempted to be set bits wouldn't match the hardware values (for
> > PV).
> > 
> > This seems to be problematic for some guests, so introduce an option
> > to fallback to this kind of legacy behavior without leaking the
> > underlying MSR values to the guest.
> > 
> > When the option is set, for both PV and HVM don't inject a #GP to the
> > guest on MSR read if reading the underlying MSR doesn't result in a
> > #GP, do the same for writes and simply discard the value to be written
> > on that case.
> > 
> > Note that for guests restored or migrated from previous Xen versions
> > the option is enabled by default, in order to keep a compatible
> > MSR behavior. Such compatibility is done at the libxl layer, to avoid
> > higher-level toolstacks from having to know the details about this flag.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm generally okay with this approach, but wouldn't want to give it
> my R-b until it's at least clear it's not entirely unacceptable to
> anyone else (Andrew in particular). Couple of remarks:

Thanks.

> > Changes since v2:
> >  - Apply the option to both HVM and PV guest.
> >  - Handle both reads and writes.
> 
> I take it that it's intentional that you didn't allow separate read
> and write control?

Yes, I don't have a strong opinion, but I think just having a single
option is better: guests requiring the read side bodge are also likely
to require the same adjustment on the write side. It's also better
from a user perspective, as it's likely people would enable them in
tandem anyway.

> 
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >      const struct domain *d = v->domain;
> >      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> >      const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
> > +    uint64_t tmp;
> >  
> >      switch ( msr )
> >      {
> 
> While to some degree a matter of taste, I think such variables needed
> only inside a switch() and not needing an initializer would better
> live in the respective switch()'s scope.

I can indeed define them inside the switch statement.

> > --- a/xen/arch/x86/pv/emul-priv-op.c
> > +++ b/xen/arch/x86/pv/emul-priv-op.c
> > @@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
> >      const struct domain *currd = curr->domain;
> >      const struct cpuid_policy *cp = currd->arch.cpuid;
> >      bool vpmu_msr = false;
> > +    uint64_t tmp;
> >      int ret;
> >  
> >      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> > @@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
> >          }
> >          /* fall through */
> >      default:
> > +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
> > +        {
> > +            *val = 0;
> > +            return X86EMUL_OKAY;
> > +        }
> > +
> >          gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> >          break;
> >  
> > @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
> >          }
> >          /* fall through */
> >      default:
> > +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
> > +            return X86EMUL_OKAY;
> > +
> >          gdprintk(XENLOG_WARNING,
> >                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> >                   reg, val);
> 
> So what are your thoughts wrt my change to this file? Drop it
> altogether and require people to use this new option? Or do you
> see both coexist?

I wouldn't be opposed to have both changes co-exist, as long as the PV
one is made part of the PV ABI, that is have it properly described in
the public headers as part of the PV behavior. I've replied with some
details along those lines in your patch.

> In the latter case, since you had suggested
> that I drop the write side of my change - does your changing of
> the write path indicate you've changed your mind?

Yes, I think we need to provide an option to allow users to revert
back to an MSR behavior as close as possible to the previous one for
compatibility reasons, and that should include the write side even if
we don't know any users requiring it right now.

We would be in a bad position if that use-case gets discovered after
the release, so it's IMO best to provide an option that covers both
read and write side straight away.

Thanks, Roger.

