Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FF302A81
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 19:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74279.133478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46op-0006FP-V8; Mon, 25 Jan 2021 18:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74279.133478; Mon, 25 Jan 2021 18:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46op-0006Ez-Qq; Mon, 25 Jan 2021 18:42:31 +0000
Received: by outflank-mailman (input) for mailman id 74279;
 Mon, 25 Jan 2021 18:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pue5=G4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l46oo-0006Eu-VT
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 18:42:31 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b39b013-c4d9-4ebe-a6ee-f8e495d3bb2d;
 Mon, 25 Jan 2021 18:42:29 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PIMkbv137640;
 Mon, 25 Jan 2021 18:42:25 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 3689aaewbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 18:42:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PIG4p4134086;
 Mon, 25 Jan 2021 18:42:24 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by userp3030.oracle.com with ESMTP id 368wqvbtsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 18:42:24 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4227.namprd10.prod.outlook.com (2603:10b6:a03:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 18:42:22 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 18:42:22 +0000
Received: from oracle.com (138.3.200.58) by
 BYAPR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:40::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 18:42:20 +0000
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
X-Inumbo-ID: 2b39b013-c4d9-4ebe-a6ee-f8e495d3bb2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=SIBIaHAC50lHx23tnHHFlxGtn9opRqiXyT2xMlsk0mM=;
 b=PyIYPoQcVYHROR0ynz4BFVuAsJyYdL1Wx/9Q9DlEgdx9l6iOA/6InIxH+l0M6awSkUVI
 kf11W0SgkSXKdPN4CoaGo4RKrzhdaDTaD5amFpPPQK5eOJd1svYtsYs7pa2OeRIpRjPz
 vHgZFa30fLkw8kxHjiEL4vQM3IbDAOVIMSgg5URQIsKBdiWv2Agg2inb+PILWqhTnWZg
 CGlsD5JHBs2mlRQR8sXMdB4hEg4uWJXjOsXtLId48Yrp+ZcY1nZYsjB6eWQThIIUgDBN
 thl9xv3n0PqEFFaSjNvTBgq0uUJ2+vopA+bWTbiA8CKOzJcDksvXNoCgg2oaTLntNYTb pg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdclxHHQLbu/fRTrCgP+LKxM6c4OdqdQSwKn5lIvDDbLJuQHnDmpe5IGT1rGjQQ1OiuIddRPXspj4dWblQBim75nSQEm2c53utNBIpwohRHZnNsPQ7fZmzXrgjz4MEa7LOUU/JZIu/+Cnp+3eia+0FGb9uXfHzeiM79VyLWSVkDwf9QDN+6CTOSBFpOQiCRVxwbmwXXAm6+salnDb0oN4yw4I5QSU9SJKGAoBD12kjzyX7GoWYbCw7nzwTFtYyMp6IxdIhf6oOSSQlrp/+k9vH54dBjxd87c+P97MRhLYZ01ch7Dhi2HHYYllvkM35zcJ/p1TnrO+JH3ccZ8cPfg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIBIaHAC50lHx23tnHHFlxGtn9opRqiXyT2xMlsk0mM=;
 b=QOotJdZx+ZkbAovgc3o9F5sks7Vgx2T4imN9cjmTOjclAkyQcsRe0QYOPRt0POikVib90RkcrTh34PWqpHB6CZE5fnUnApzd254ruRiE7mWF7GiL7O4FinyfGByTqbFn/DztkDPjdMFB5WrmMwqKVDJe9c4G3bZw0nQFUPpSgThZzI6h8wdUVyIgrTMZuLI3HgGGijWbQ77PKYAJeYW9hGJmWhrx4quKUi2po53++Q5OS3R22QQ3rBfQs5p5dCZfgGYUY2e0LlkXs7n5q2iOjcnqXVUeyBele/l70A2SuLR82LzMtSI8BMVKZXn7oneCMzeOUAAVcRa6NasB3+IBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIBIaHAC50lHx23tnHHFlxGtn9opRqiXyT2xMlsk0mM=;
 b=JTfsjr39rqv+NubX7nnQ3FzLJd3ksZBEfRoo/2R9YCzYwsHB6li1CsmZab2GP7FjQNas7Ci+tRJgnEWcvNmrStoqaxnRvltAt1jfCL/X96v9cIlGfyIeGFBzigmWjI78XsokHRoG9ZPzNW5QEYmHqtPqgJ5yp3pN99NYK1vhNDc=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Mon, 25 Jan 2021 13:42:16 -0500
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
Message-ID: <YA8RCGy6Zj5rE2R8@oracle.com>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
 <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
 <d3aec393-4f3b-140b-2189-5de731ee23ba@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3aec393-4f3b-140b-2189-5de731ee23ba@suse.com>
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 173f594d-2911-439e-748c-08d8c160f360
X-MS-TrafficTypeDiagnostic: BY5PR10MB4227:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB42270C165FD6AE41B854631A8ABD9@BY5PR10MB4227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P423V5CvetYM4wNhyBzpv2hyUgjCkiKVZpy6ig9MmIfotCLrLUxENnjIcibo5CoRT7WXpxEZH7jI3honFdptdEjiHuncjnrEeZ6S9jr1rPaMwFCvnd9UcVb95ovBOsPXaTPdqYoYZ1G18RM1VMv3YoZ+Eq0FmlmMShOMJ9AO8ZxbPInjIoTq5bdnZQeGecjzA/GdnLjJzagiv62PnVmCY265tVmRel/B5dec7r4eCfLkhtVmXXRXSy11qHZSYjgs9/Tvc5p7dfKM46cWxsZjgenNHBI91N6XK6APJouRM2vrCy2z6Optz84CzAJ0q6YbzjDOCT5bfpTOe1oqdFdwJHZbHzf/xz1tNtez3GNiZVL6J38hnLDyX9OfCUBxezhE/B2mPWAjdi6zwy0IZyRssvsHb546Gy1hH18lVxYRoOjmlTOwLlyvvza6Si4pIJFxBZ4sZTjmM/L0kOj9P3skKS+K38wfSZniWBOm4AvHwH1QvyqRsCAP/5O9tTKqUKEBAANfXpoEQtylz68v15LuTw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(8676002)(6666004)(44832011)(2906002)(2616005)(16526019)(5660300002)(316002)(956004)(478600001)(186003)(26005)(86362001)(8886007)(6916009)(8936002)(4326008)(53546011)(55016002)(52116002)(66946007)(66476007)(66556008)(36756003)(83380400001)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8TPFZj3pnjTAifNCfckmTdHomIw+HTT6jAQDrUFKIZzVHgaWPOZAhIGoa2P5vKPztTqlY27hEd1L6oAb8B7D3S5WpqxefSNI5n1u+9vtxk61VrcRy4P/EbtOO0fGjT5x3tLZN0fnP6tTdqeoq/N4zkl03hDVPzY2GqvnLWNED8TzVMxECA0lQMqEgWM2kf329ZhzSudOEksFs3pjFYsH794KloiZPfRjjbM0ydlF2Mj6GoPjUgcCxxLBzQc4158r5VDNqgkPiYt2I7gwErATgehMxJIpjec9ra2wh3Hqq9Gbo4lWozUc/1Pz19klX3a4Sg+W6tHlCGOixVPljOw0NFLvzq9/TG7NeCEY515fArkPuk1q0Ct5g9XHQtM7nRTuVbPgtVCSY9KgvO5yYzIKd/nU8qx+T2qHzAadaE6KE7MwolpLm1dZ3qcWyYbR3cUrse5ztM6ApmYd187EKyF2h3QsAdId4lyYqZnj0qZiJxwgGW/agLey83vNfaHiqtj1aWP+0ED3KlenJrG/aCKkFNQTq6i6Q2cH7feF/Hd59R4ROb1/0oP0Se6lE34fUNcruONLPycQTva7eDUHhGE4Up8R2ACA2EF535CSfxZ7d1dpy/b/lLp9uBvckyg7al5BU+eRCW1UqVkXxrK9P2fnTS6kNWfA4owgDvdyebc7ziQwJfc0SbDxSpCiuwKhvjhIxDkRmPacCiSpE3B568gL+sjfA2D9t3/FNZ77SozczTlA7kLSXIWEBSHdS874Kqrf
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173f594d-2911-439e-748c-08d8c160f360
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:42:22.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXCzO/fX/OZ+t/+iAx3OdgrVVxhlYnwjOjqpXg0ulpF7ZWbgaI1ZZ6NDH114Wlkl2ZSZf7VZNyVLuNAWxFprzBI9wHmgXh/tQiBClwowGNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250099
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250099

On 21-01-25 11:22:08, Jan Beulich wrote:
> On 22.01.2021 20:52, Boris Ostrovsky wrote:
> > On 1/22/21 7:51 AM, Jan Beulich wrote:
> >> On 20.01.2021 23:49, Boris Ostrovsky wrote:
> >>> +
> >>> +    /*
> >>> +     * Accesses to unimplemented MSRs as part of emulation of instructions
> >>> +     * other than guest's RDMSR/WRMSR should never succeed.
> >>> +     */
> >>> +    if ( !is_guest_msr_access )
> >>> +        ignore_msrs = MSR_UNHANDLED_NEVER;
> >>
> >> Wouldn't you better "return true" here? Such accesses also
> >> shouldn't be logged imo (albeit I agree that's a change from
> >> current behavior).
> > 
> > 
> > Yes, that's why I didn't return here. We will be here in !is_guest_msr_access case most likely due to a bug in the emulator so I think we do want to see the error logged.
> 
> Why "most likely"?


OK, definitely ;-) But I still think logging these accesses would be helpful.

> 
> >>> +    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
> >>> +        *val = 0;
> >>
> >> I don't understand the conditional here, even more so with
> >> the respective changelog entry. In any event you don't
> >> want to clobber the value ahead of ...
> >>
> >>> +    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
> >>> +    {
> >>> +        if ( is_write )
> >>> +            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
> >>> +                    " unimplemented\n", msr, *val);
> >>
> >> ... logging it.
> > 
> > 
> > True. I dropped !is_write from v1 without considering this.
> > 
> > As far as the conditional --- dropping it too would be a behavior change. 
> 
> Albeit an intentional one then? Plus I think I have trouble
> seeing what behavior it would be that would change.


Currently callers of, say, read_msr() don't expect the argument that they pass in to change. Granted, they shouldn't (and AFAICS don't) look at it but it's a change nonetheless.

> 
> >>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> >>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> >>> @@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
> >>>      ctxt->event = (struct x86_event){};
> >>>  }
> >>>  
> >>> +static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)
> >>
> >> The parameter wants to be pointer-to-const. In addition I wonder
> >> whether this wouldn't better be a sibling to
> >> x86_insn_is_cr_access() (without a "state" parameter, which
> >> would be unused and unavailable to the callers), which may end
> >> up finding further uses down the road.
> > 
> > 
> > "Sibling" in terms of name (yes, it would be) or something else?
> 
> Name and (possible) purpose - a validate hook could want to
> make use of this, for example.

A validate hook? 

> 
> >>> +{
> >>> +    return ctxt->opcode == X86EMUL_OPC(0x0f, 0x32) ||  /* RDMSR */
> >>> +           ctxt->opcode == X86EMUL_OPC(0x0f, 0x30);    /* WRMSR */
> >>> +}
> >>
> >> Personally I'd prefer if this was a single comparison:
> >>
> >>     return (ctxt->opcode | 2) == X86EMUL_OPC(0x0f, 0x32);
> >>
> >> But maybe nowadays' compilers are capable of this
> >> transformation?
> > 
> > Here is what I've got (not an inline but shouldn't make much difference I'd think)
> > 
> > ffff82d040385960 <x86_emul_guest_msr_access_2>: # your code
> > ffff82d040385960:       8b 47 2c                mov    0x2c(%rdi),%eax
> > ffff82d040385963:       83 e0 fd                and    $0xfffffffd,%eax
> > ffff82d040385966:       3d 30 00 0f 00          cmp    $0xf0030,%eax
> > ffff82d04038596b:       0f 94 c0                sete   %al
> > ffff82d04038596e:       c3                      retq
> > 
> > ffff82d04038596f <x86_emul_guest_msr_access_1>: # my code
> > ffff82d04038596f:       8b 47 2c                mov    0x2c(%rdi),%eax
> > ffff82d040385972:       83 c8 02                or     $0x2,%eax
> > ffff82d040385975:       3d 32 00 0f 00          cmp    $0xf0032,%eax
> > ffff82d04038597a:       0f 94 c0                sete   %al
> > ffff82d04038597d:       c3                      retq
> > 
> > 
> > So it's a wash in terms of generated code.
> 
> True, albeit I guess you got "your code" and "my code" the
> wrong way round, as I don't expect the compiler to
> translate | into "and".


Yes, looks like I did switch them.

> 
> >> I notice you use this function only from PV priv-op emulation.
> >> What about the call paths through hvmemul_{read,write}_msr()?
> >> (It's also questionable whether the write paths need this -
> >> the only MSR written outside of WRMSR emulation is
> >> MSR_SHADOW_GS_BASE, which can't possibly reach the "unhandled"
> >> logic anywhere. But maybe better to be future proof here in
> >> case new MSR writes appear in the emulator, down the road.)
> > 
> > 
> > Won't we end up in hvm_funcs.msr_write_intercept ops which do call it?
> 
> Of course we will - the boolean will very likely need
> propagating (a possible alternative being a per-vCPU flag
> indicating "in emulator").


Oh, I see what you mean. By per-vcpu flag you mean arch_vcpu field I assume?


-boris


