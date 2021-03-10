Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4F333B32
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96008.181397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwnM-0007DF-5j; Wed, 10 Mar 2021 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96008.181397; Wed, 10 Mar 2021 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwnM-0007Co-21; Wed, 10 Mar 2021 11:14:28 +0000
Received: by outflank-mailman (input) for mailman id 96008;
 Wed, 10 Mar 2021 11:14:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfCg=II=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJwnK-0007Ch-ND
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:14:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c26db8b5-8465-4d6a-b5f8-943c313c07fb;
 Wed, 10 Mar 2021 11:14:26 +0000 (UTC)
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
X-Inumbo-ID: c26db8b5-8465-4d6a-b5f8-943c313c07fb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615374866;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gAL1CWpQh5Vfovsqlcxf55EjjbG441S2ljRcu6DkEbE=;
  b=LoWiqnA4ObrebIABPFqSosl+x1a3fb3iQIR75ZDvjNZHZwRrMe+njgZi
   UzBjXnXO1yT4mar5BlppWXj2JHNJ0HCMrWFm4irBoeK+TN0H1mTcxTyEh
   r8RqxvAw92njvLSByCEiXvCMl23UlGc1EJAw5UCC0pfOYtLFfkBmTmiE/
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4Se8efW+pUmNnD3Hz3E0SEdTjoZ5ZSDwSogEMbjeSSEcgNQBRmNW+X+r7i4R10ibDc2+BXIphZ
 bWKHWK9flUMi+3ZmY36o1rou15N7OQe7SmH0wKegcgtAF/hIoVIfgLK5g3Gf1Q5oou0kEDMHcV
 o1vJT5AbqQJfPWXgEb990a0kPtsz311LHXGC75Jxc3MeONEpc/eTMCbIHEycl8P0xizfjskYNM
 Wa0uTd/RQaLFmoxu+RGDqKiHFQWp4DD4aABSJMTR5U6SD3Fe03CMNfxRiPwTXqbrcxEKNfi9qP
 js4=
X-SBRS: 5.2
X-MesageID: 38855821
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="38855821"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crVL2ycZ/RlDFEqK/AFLrcGd36QF7QL3/5dkhzo/zluug191xXrrJBRQKOoZqRDUOQPAz+UUdH+lzeJPWhfAC1Ebb0XeivX4XFBnJbXu5/X1wi2Ja45jTwkJTVr0c9jhXhGOHWss5/ueaSNCMb1usnCqr8y6gYtxqB0dL+Vff8pkP2QF5xtVWARsFzsCl9f8k2v1MnfUq1peNQGeIg3cDCWthfbJO7X/EEI5m02MMr0NcNfQbDK7zuIPxewbx6LGT06i9W1aAqpo9ta8LmZNBrbm0iT1pVIxPTkkKoX9DONe39RTMf5c4fut8Iop92SKl8devjQqBOnPORDE7iwb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSlPR975+YkePtkUfBjhUF8gMxXvL5hxSJ1uqufy44A=;
 b=iwv2swueLLrvwo1fd5tPhKllhFvERUjZprbGOMicXrlLUuUmoP3RQQpB4aokE6zs7npujYODCs9M4yuEd+wRsKIF2XShuNbBor8OXJxZ+2uJYd5nB2hKOSeE/XHbkeR4TrJ7PxxNSLaaFCURC0G0mEs9Sy+fGd26vsVBR9JrFQJPFnGabeUZgsTs2LlWmh9Pjs6bSd5hMXy4sfOUk8Rw6fL0KEC5984dFzkbw/Ri6IiBqDcPGl8PZmCbkS5avvCjQCndSTkDipBv4uGMMaqvnAsRn9/VBF0d8WsWugW4ykD+PjwzoZZ4A47GFThvDokzFZHzXG8l5WHkXv+mzLKQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSlPR975+YkePtkUfBjhUF8gMxXvL5hxSJ1uqufy44A=;
 b=taTkNixGZNA0jRbCF/7OJw0R/3MXse6z3Mqb+xLNZk8TNYNm3nM9EE6KpCIUvuOnxYaPImh69Xf9T384vaY7GQjnrE0lyFhvByvr1PhAc5bnQCYSI+5VUT49e0rtpj5s7eRGOrx60RiNEtg3SGO6DGfiH6ZFb7fqw4Uu9/leD9U=
Date: Wed, 10 Mar 2021 12:13:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Message-ID: <YEip7rg+AGCXF69j@Air-de-Roger>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
 <4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com>
X-ClientProxiedBy: AM6PR0202CA0061.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::38) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4481136b-2b24-4de2-03f1-08d8e3b5990b
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3945D9ABB8B02292AC355E608F919@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yV5D7P+pGxQ0cTKn5FhHUmAnhKYq28uWu2Au3Z0fNAhZK/q1oPwSAigciLbmBXCV/9IHbe/9gGsc/aDUdrQ0PgY9iLiEcVcXMM9ffCFTDEcmoJ0LaQNIRUOHb3jgF092B31Zv8/nKqJ+vqNFXTPWtv6J0Z6HdMHSm3NhgcAuMc/QVsRQLlM5No9clf8oRecEngWbpzQXCigTmGjMrRHYFLZjuLZm2K4RQCb3IuSEkkOOZOR5BHwzFLUn8J9GjxBcl05S357/Sq/CpWCKNYlhk9FeoAT+5dhcBDWdNCvq8iNAko23nfdwA9YwGLqtf88TD2V0UHidT+vjFIuTWyEBO2+Q3xbhUYSMospvFaM4iB+XDXClLteyiMANmntGPwbsSETdQr1cWani20nhf4ph4hDUkVWG5A4da18IENfv+jGllS3+E+93giYfmKotFOzsHrruCxA+nVvQVCfp3uEXNFkVqNF7vobQRit4GTuBrDag9eiou3PrX8ApHI7qcAhz6aiGSCp5GetBdSRG5SP6wLGFf52WlQS0BnF5CgZqrEOARwMrdAuojizp9h1/jCtY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(136003)(366004)(39850400004)(346002)(956004)(66556008)(4326008)(316002)(66946007)(186003)(26005)(8936002)(6496006)(66476007)(83380400001)(110136005)(8676002)(16526019)(54906003)(53546011)(33716001)(478600001)(9686003)(6666004)(2906002)(85182001)(5660300002)(7416002)(6486002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnE0R2gwVnJVZGRBemdaMWgwSmw0bjVxQituNkgzNVFxZ2VOcXQyOHBCRVgv?=
 =?utf-8?B?b1lDSkJIUzZzTjdNeVpWazBoaHQrZlE1Y2x0NTJxTk5ERDBlRFhqZEc1ZDZY?=
 =?utf-8?B?bGc4Rm1aenA4cVpObUpuSEcrN0RTdlVOZXErQTczT1hkRnlhN284L010MXEv?=
 =?utf-8?B?NGNUcDBKK3owblAwN3pEcWkzQlREemxtUWk1TTdrN3FhQmJBSG5XVUJRVjNG?=
 =?utf-8?B?WThmQ3ErQjdLT0p4QzN3L2J6a1huVm9WbzdaTWVQUDZVd3FIMzJ2ZnNhcXdG?=
 =?utf-8?B?MkRtUzFoUjdHTXlNWVVsN2ZRcVlNbjB1aXlHbjNkV0dzMUlxSnVUM3grM2VI?=
 =?utf-8?B?SHNlTmo3UmlTSm15dmlwTk1PTGFXNkp5YjBDaDF6Uk9lbGN2N2xWNUw2LzBq?=
 =?utf-8?B?c3pPN29RWkMwa0tVUlBadFlhV0RHT05aemszSjBDWk5FbFFEcENjU1BwdTBT?=
 =?utf-8?B?MWxCbTVPRUxGMkZ6TDhkbUlNVWlxM0d6T3YzVzFmdkNkeUI0LzhZcjlrRTRQ?=
 =?utf-8?B?UStDZXpkc3pNMXhhbzFmeHBidGg4V2pPOFUzSEF2WEVVY01WT1RJSjBLQnZ2?=
 =?utf-8?B?ZzhSZFloRXpJVXh5UThkeno3RkFqZ2hGYUlUZzZ3b0hJelBTbUVQNHhDc3VT?=
 =?utf-8?B?TkNnWHdqRWNmeERoaWFjMEFDNEYvdmJSTmRKVWhqWktqekh4RVVEeG9IRGU0?=
 =?utf-8?B?ZDJMUUo0ZGY2ODZXWW5lUGNsRFdZWURWNHZndThlRWlwcU1RVkdXOXR0dHF6?=
 =?utf-8?B?SnV5a3YweVFYQkxkbnhld0JoakI3OWdURlJVeGc1MXdyK01GVlZXaHg3NERH?=
 =?utf-8?B?S0E1a2NNd2lkUHM2TVh0N0pOWFlYZjNpVERiVjZNUnkzbFY3a3NIUU1rVndr?=
 =?utf-8?B?aTd3Rjk5MFpEaXFWSmJ6L0lXU3ZLRzNCdjlvWENsMlZUOW4yeEFHOW5ROGxG?=
 =?utf-8?B?MjA0a21xWXUyT2kvWmVmdnhXdUt5aFFHcjJ5aEswc1h4WkwyVWsxQ0M5TXdU?=
 =?utf-8?B?SHZpd25lS0p0Ymp0OHRMWVk0andaT1hWbWJteC80eHg4SFh2dXdJMGlGTTh6?=
 =?utf-8?B?K1JLWFQvaWlrdVJEUnNIcXZLb2NaQjFUcVVKU0lHM0Yybk81aDBXbWFCcTJJ?=
 =?utf-8?B?Q1daZ1k4djdBRVFuTCs5M1kwazk4VHNZT1pneTR4NGZmM2s3YnYvTjJQcTdP?=
 =?utf-8?B?R1d2cWpyajJzWUFkYjFId0lFQnFaZnVvRXZYZ3NmbWo1ZVEyZmZ1RkJVaVds?=
 =?utf-8?B?ZW5JcHU5ZXRHd2toMHg0Sm9DU1pHajM1QS9oQ2FZSWZoei8xWEZ3ZEE5bWJX?=
 =?utf-8?B?eTQrUWxaRGZLTitsR2toaWRTMHlIZ1BzeHE2ZHA3SGdLN0pNZTNEdHREVFRx?=
 =?utf-8?B?d2s0UllRRXVoU2Y4anRFcHZWR093UWNrd1lKUS85UFh2R0J5d0hRdEdSRldp?=
 =?utf-8?B?YzFVbjhHOU1oZ3M2cHFwWUxPdkhPdGtDaVJ5OFRNd1JPUU1QeDNWYjc0Tmls?=
 =?utf-8?B?Nk4vSE82bGhSMHRxSE9BTDNkOEttQkFSbmhOVjN5cU4rdlVTeEJLb054cHFB?=
 =?utf-8?B?b09XRVBjTmNpY0pIcTArUzZCckRYWTYrYzVxZkVBN3dCSFNsOGcrenIvVjds?=
 =?utf-8?B?V2JqMzVtTzRYOFZVUHVxV0pnQnpSQ2NKSTZTdGgxYk90RDl0QmYrZGtidDNq?=
 =?utf-8?B?bWIxTzZoTUpnNWZ3RDBWUXArYTdJWHVSMHNkclpNcUVxQkdDMXFVeHR4TElq?=
 =?utf-8?Q?9GHq9woQeJePzJnt+vVX+ieEMFBZiLPGjwi2nNm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4481136b-2b24-4de2-03f1-08d8e3b5990b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 11:13:57.0849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJCWd/Gjnk+m0rIsXAmoTcqhk96SOzbsEXZiXh7qX2ucSjxj3DY9J+i3BEXeDWwx4JaFUW9cF3a1ZSKoCi/I/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 07:57:42PM +0000, Andrew Cooper wrote:
> On 09/03/2021 11:36, Jan Beulich wrote:
> > On 09.03.2021 11:56, Roger Pau Monne wrote:
> >> --- a/xen/arch/x86/pv/emul-priv-op.c
> >> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >> @@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
> >>      const struct domain *currd = curr->domain;
> >>      const struct cpuid_policy *cp = currd->arch.cpuid;
> >>      bool vpmu_msr = false;
> >> +    uint64_t tmp;
> >>      int ret;
> >>  
> >>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> >> @@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
> >>          }
> >>          /* fall through */
> >>      default:
> >> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
> >> +        {
> >> +            *val = 0;
> >> +            return X86EMUL_OKAY;
> >> +        }
> >> +
> >>          gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> >>          break;
> >>  
> >> @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
> >>          }
> >>          /* fall through */
> >>      default:
> >> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
> >> +            return X86EMUL_OKAY;
> >> +
> >>          gdprintk(XENLOG_WARNING,
> >>                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> >>                   reg, val);
> > So what are your thoughts wrt my change to this file? Drop it
> > altogether and require people to use this new option? Or do you
> > see both coexist? In the latter case, since you had suggested
> > that I drop the write side of my change - does your changing of
> > the write path indicate you've changed your mind?
> 
> I don't think we should legitimise buggy PV behaviour, either by
> codifying in the ABI, or providing a knob beyond this one.

In that case - can we try to figure out which MSRs is PV Linux trying
to access without having the #GP handler setup?

Maybe we can try to handle the ones we know the buggy Linux versions
will try to access without having #GP setup?

I know it's not possible to test all possible Linux versions, but we
could at least try to get the ones we know about fixed. Is the only
offending one we know about MSR_K8_HWCR?

> A guest blindly stumbling forward with a missed #GP could very well
> worse than crashing hard.
> 
> Case in point - the 4.15 behaviour spotted a very serious bug in NetBSD
> where it tried writing MSR_PAT with its own choice (which wasn't the
> same as Xen's choice).  The consequence of this bug is getting cache
> attributes in pagetables wrong.

Was that write by NetBSD done without the #GP handler setup?

Because the patch by Jan affects only that specific scenario.

Thanks, Roger.

