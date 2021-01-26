Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823D304356
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75246.135430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qnv-0002Ad-SE; Tue, 26 Jan 2021 16:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75246.135430; Tue, 26 Jan 2021 16:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qnv-0002AE-Ny; Tue, 26 Jan 2021 16:02:55 +0000
Received: by outflank-mailman (input) for mailman id 75246;
 Tue, 26 Jan 2021 16:02:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkEF=G5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l4Qnu-0002A9-A8
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:02:54 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2beff1b8-e543-4bf1-9730-a8261061da22;
 Tue, 26 Jan 2021 16:02:52 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QFn96k131513;
 Tue, 26 Jan 2021 16:02:46 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 3689aajwju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 16:02:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QFj4mP045334;
 Tue, 26 Jan 2021 16:02:46 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2051.outbound.protection.outlook.com [104.47.38.51])
 by aserp3030.oracle.com with ESMTP id 368wcn2t00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 16:02:46 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4340.namprd10.prod.outlook.com (2603:10b6:a03:210::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 16:02:44 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 16:02:44 +0000
Received: from oracle.com (138.3.200.1) by
 DM5PR17CA0060.namprd17.prod.outlook.com (2603:10b6:3:13f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 16:02:41 +0000
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
X-Inumbo-ID: 2beff1b8-e543-4bf1-9730-a8261061da22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=D/NaZ5aD6wKZY+nY2vqLMxr4ck2pueUmFbt6t5lePm4=;
 b=P5wK3STPxUgfIptrD9kVFFBQRHpWggO0uMFrxL96Ve2tY9gnJGfp4/jQMRPE1MIBflfq
 zCwNC4xL52ftdc3hccz30qIYCM4jQceV+AWfdnlzGbJAyv26wWEUAoPKwmuxEY0s1bq0
 U3zUrAIZKthTewFdDUat45yu3mtrlQrHuIsqbi2Vo4IQFWePNKoxlkyZVkDrAEZnCInk
 qTv8t2f5oTCrBIi4uXtl9Zm94mSHHeSgAEL++wthHV6aBixbrgFaJKZsuBwxdMM0DN51
 ng3EiocSb8xfV/X/g1+UTx1YpasnlkIDPH8yJ+S7QZTp4nDQMn5XvPmyrjzNJBBHrCG0 2A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZgVhsdYgCvBjlFPKEZ7cibrWAV7vXuUq2TLMzSYQnaBwo0fqLM8WudGBj/atT4P8/cVHcTGR5AXLa2gFT1eugqJ2TunvPMv5uB1YHTl7eJCpQ9obZbKdVOO6VrdPz8qM88JLBKyhY/Fx/cCBTOVRvlEVKjsgm7v8wVFvANLjJjmStApinz0+xWk2v7E1aedOfjntLDrhUhcOQnv09p4i25n/8SKpqUyvY+u+/agMrY7QeSZjN6DSXr/VEcIqqNcG+xEuvJ7deRXlZJC2w1F8R6PXU7PuWhnBJN21uernKF31r3+dXialCxaL/NbUIVPPSFQjn2mxwZxTiMT/s9MPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/NaZ5aD6wKZY+nY2vqLMxr4ck2pueUmFbt6t5lePm4=;
 b=gIYt7fFZUW5kbSD2WBgXKUV+4SGTbt2XZEt4qfmP+KVIsm+MlHenyDZhUI6HZ0XoRdhwOaHmS+pZVA/GaOyiFyHDvn2KnubgDikEpyMgf8cAiFXM76F8H17Jy7DJbt60SCPg2LbReEXlosTwczJckdv7jSK0F0YDdVb6yfwyCx2RPpIs6OPQmYSNh4DsKWFeZeax9B7XKIsUflJv+kPM2Ki91Im+GCFDCl2sJsmbiZzHE789Gro1dWk7pJwCs//B8ADEBOhZnnyV7BmoQrcED7e1XOGA87R4oaHy2GCaQswjI2lrjc1/F0H+T8cuPL1RTRJEqInmigi/XM9dExHRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/NaZ5aD6wKZY+nY2vqLMxr4ck2pueUmFbt6t5lePm4=;
 b=HdDQmlirylaGbWk76se75CgMPbqSrf3y9odyqIG8Or1zhV0DAGJOfol0I+uryT2OZi1OY0nL5YC1gp21Dk3X5p+y6AdSpp3VF0yURLB2WdQicmP9hZ+Kqk0gZOmrLW+vCO/qO9+WIsblJG+NU0Ls7JeCO7V4nMnZyY9TUN37128=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Tue, 26 Jan 2021 11:02:36 -0500
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
Message-ID: <YBA9HKvmToot64BP@oracle.com>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
 <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
 <d3aec393-4f3b-140b-2189-5de731ee23ba@suse.com>
 <YA8RCGy6Zj5rE2R8@oracle.com>
 <6f16e5d7-41b5-1a11-c444-11aab52a8891@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f16e5d7-41b5-1a11-c444-11aab52a8891@suse.com>
X-Originating-IP: [138.3.200.1]
X-ClientProxiedBy: DM5PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:3:13f::22) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97a28080-bce9-4bad-41ad-08d8c213d11e
X-MS-TrafficTypeDiagnostic: BY5PR10MB4340:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB43405A2B61431A1F17D759458ABC9@BY5PR10MB4340.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V7CKgp1uiDvd6cq3MO+QQmGAzMWL2ZJwv8Zln1Mua+kObhTqKkrBkbZrB0iUfs2DuMNAEfJR8gRbVAyk+TVRdaYp4GHDjRYrbjr6WEZ8Iw4GiXsVhtpE4FoY2rJlGgtRrCEj+wTeGxs6AbZ8l0Jcg5bBMKuGqwKDpLtghVfM2GPZ/MWfA6EDikdift8PVwXRc5VlYzukBp42PfgUCMlODTzgxBt3NLNK8s0r1EaR1+Io/JIuVMFgvNTt5GPMx/b1JJWpPEADdvNFhxajp3HUsJqqY5hhnauRruTOHhVMqVLVe1o8wVJQsJilRvJQB4Xi8btte12TNRl/ur8PfM3JM/i/NfQPZNRDTTJ7xgZYZfyunGLKyEtY0Q20Mfh1V+GrQFJ1vipTd6iQ/m+nA8wBo2NsCTvipm0cK7z4WXQ9oWJMwtYbRT2DvHovDrSZw/KMTZ7eLs+ruGSExpUy7L0Nd7P8nJPp+xYRDd/gIu6E1uB/NMBgCPnPohPUuxQojH6YUVDg3BypQ+mu38LUFadT0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39860400002)(136003)(346002)(4326008)(26005)(8676002)(83380400001)(86362001)(5660300002)(7696005)(8936002)(66946007)(53546011)(2906002)(6666004)(2616005)(6916009)(66556008)(956004)(44832011)(186003)(16526019)(55016002)(66476007)(478600001)(36756003)(316002)(52116002)(8886007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?oos0gllOFkbqb46e5k03ZJhBx2gF55wiofTBW96t3fnKD1kHtcaWcqXIy5en?=
 =?us-ascii?Q?63ohcRHjHLAvy776GoAPcujJIMLMtr5r1I2+K3mzRp0gTVdeAJKPr4VoqhhH?=
 =?us-ascii?Q?1j6cwZV85G+AW4CXA/Jf5/OCWU7UhzO+FdRpYDSkO8TnK9f92JRVwy83Esfs?=
 =?us-ascii?Q?kKLkJehDaLuf7MqFYa5rq/WTcwdfDoa3giN2Hc9ie2/ubhP1QYznP1Lug0wo?=
 =?us-ascii?Q?Voo9WMGzQ34WDd8vXSngEI7eX0FD+hgvQkfA9jibjBujixhWbNA41sginuHO?=
 =?us-ascii?Q?TTRLaKFJWTcTz3dkUZnX1r0JZ8cF8kZnkGMRmTsHWf4ma0QDYARXh8CwLuGQ?=
 =?us-ascii?Q?oiQ+6JnaBFD7aOFjqQ/TZ1mOWMj0IZkSxxBz/A4AtnGm/M7EWU/TPLINbkzz?=
 =?us-ascii?Q?IL+ojY2bvQ+ucXfOUswievhR0JwdkF3HtdSpgq43LVvpq2EZDHTteBBB+GzQ?=
 =?us-ascii?Q?NxlKx+kO7vs04VdM2w4mBzLQyiI1xbcx9D5BUeu8wpq1oUUvr9pj3EczP45Y?=
 =?us-ascii?Q?hP/x/ZbqBapY3W652Y9mUXuERPSwXWkp5BglD6QF4i61R4u5P5UEM6xxjYaV?=
 =?us-ascii?Q?KktyIm09oXhUZMCUpI0bW8xYyi0Ae2mqEVNtbIX8p2LT44SjGmlneZ0354P0?=
 =?us-ascii?Q?X1cGRd7iPVw7uh6MaiFy2HWB5ViYHUgNrJhD7gTOkRMwvnYjEK8kbAJlt8PX?=
 =?us-ascii?Q?Mc3E7h2gEikxYACI/y5+e7vs5fH5u2M736lyYAr7HRyZS/tJR3YpcIEAcs7G?=
 =?us-ascii?Q?SLU2Akf8AohomZFsj9AI5rfaaQ+ywMOGZ4hV07fMM+az6ri4/l2wNUAENpwZ?=
 =?us-ascii?Q?hflx+VI2bWpDkJNgzRXoeC2Wslz59JAD2ILpw0kL/udo6gdXGTxRXs3Zy0J6?=
 =?us-ascii?Q?CKfj10VoaYtfdnFghEzqwVHIau3BIsFtbPLY0vQmPo3BrEytfTTqbIYEEFso?=
 =?us-ascii?Q?fBsb3urWvR1rWUmRet9Ktjl8bJK6yaA4nKewofwFhjaA3Ooxsjoul2cLo4RJ?=
 =?us-ascii?Q?Ozx2GH6l2SsDYHaV3bfCQwMeMhUvL835jQ8uIJZj1bgl3HfG3sJAPviq5HMG?=
 =?us-ascii?Q?u/4GNY8Q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a28080-bce9-4bad-41ad-08d8c213d11e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 16:02:44.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0G11PaaQijdA3WY9jonepezjDNItplO7e51YMVZaBqtTKU0wHhw85zfqec+yMFfC+waqO4r//4ZganDlyGfUF5+jeUmIc63yWZTl9J0pB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4340
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260085

On 21-01-26 10:05:47, Jan Beulich wrote:
> On 25.01.2021 19:42, Boris Ostrovsky wrote:
> > On 21-01-25 11:22:08, Jan Beulich wrote:
> >> On 22.01.2021 20:52, Boris Ostrovsky wrote:
> >>> On 1/22/21 7:51 AM, Jan Beulich wrote:
> >>>> On 20.01.2021 23:49, Boris Ostrovsky wrote:
> >>>>> +
> >>>>> +    /*
> >>>>> +     * Accesses to unimplemented MSRs as part of emulation of instructions
> >>>>> +     * other than guest's RDMSR/WRMSR should never succeed.
> >>>>> +     */
> >>>>> +    if ( !is_guest_msr_access )
> >>>>> +        ignore_msrs = MSR_UNHANDLED_NEVER;
> >>>>
> >>>> Wouldn't you better "return true" here? Such accesses also
> >>>> shouldn't be logged imo (albeit I agree that's a change from
> >>>> current behavior).
> >>>
> >>>
> >>> Yes, that's why I didn't return here. We will be here in !is_guest_msr_access case most likely due to a bug in the emulator so I think we do want to see the error logged.
> >>
> >> Why "most likely"?
> > 
> > 
> > OK, definitely ;-)
> 
> Oops - I was thinking the other way around, considering such
> to possibly be legitimate. It just so happens that curently
> we have no such path.

I was imagining a case where we'd add have another "ops->read_msr(_regs.ecx, ...)"
in the emulator and some values of ecx may not be tested. (Or even passing
an explicit index that is not handled, although that is highly unlikely to
pass code review).

Yes, these cases do not currently exist. 

> 
> > But I still think logging these accesses would be helpful.
> 
> Because of the above I continue to question this.
> 
> >>>>> +    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
> >>>>> +        *val = 0;
> >>>>
> >>>> I don't understand the conditional here, even more so with
> >>>> the respective changelog entry. In any event you don't
> >>>> want to clobber the value ahead of ...
> >>>>
> >>>>> +    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
> >>>>> +    {
> >>>>> +        if ( is_write )
> >>>>> +            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
> >>>>> +                    " unimplemented\n", msr, *val);
> >>>>
> >>>> ... logging it.
> >>>
> >>>
> >>> True. I dropped !is_write from v1 without considering this.
> >>>
> >>> As far as the conditional --- dropping it too would be a behavior change. 
> >>
> >> Albeit an intentional one then? Plus I think I have trouble
> >> seeing what behavior it would be that would change.
> > 
> > 
> > Currently callers of, say, read_msr() don't expect the argument that they pass in to change. Granted, they shouldn't (and AFAICS don't) look at it but it's a change nonetheless.
> 
> Hmm, I'm confused: The purpose of read_msr() is to change the
> value pointed at by the passed in argument.

Only if MSR exists/handled. We add parameters that allow it to be set
to zero for unhandled case but default (which is existing behavior, i.e.
MSR_UNHANDLED_NEVER) would leave the (pointed to) argument unchanged.

>  And for write_msr()
> the users of the hook pass the argument by value, i.e. wouldn't
> observe the changed value (it would only possibly be
> intermediate layers which might observe the change, but those
> ought to not care).

Yes, this would only be relevant to reads but since I dropped is_write check
the conditional covers both reads and writes.

In any case, this (and the one above) are minor issues and I don't mind
making the change.

> 
> >>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> >>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> >>>>> @@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
> >>>>>      ctxt->event = (struct x86_event){};
> >>>>>  }
> >>>>>  
> >>>>> +static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)
> >>>>
> >>>> The parameter wants to be pointer-to-const. In addition I wonder
> >>>> whether this wouldn't better be a sibling to
> >>>> x86_insn_is_cr_access() (without a "state" parameter, which
> >>>> would be unused and unavailable to the callers), which may end
> >>>> up finding further uses down the road.
> >>>
> >>>
> >>> "Sibling" in terms of name (yes, it would be) or something else?
> >>
> >> Name and (possible) purpose - a validate hook could want to
> >> make use of this, for example.
> > 
> > A validate hook? 
> 
> Quoting from struct x86_emulate_ops:
> 
>     /*
>      * validate: Post-decode, pre-emulate hook to allow caller controlled
>      * filtering.
>      */
>     int (*validate)(
>         const struct x86_emulate_state *state,
>         struct x86_emulate_ctxt *ctxt);
> 
> Granted to be directly usable the function would need to have a
> "state" parameter. As that's unused, having it have one and
> passing NULL in your case might be acceptable. But I also could
> see arguments towards this not being a good idea.

I see. Where would we need to call this hook though? We are never directly
emulating MSR access (compared to, for example, CR accesses where
x86_insn_is_cr_access is used). And for PV we already validate it in
emul-priv-op.c():validate().

> 
> >>>> I notice you use this function only from PV priv-op emulation.
> >>>> What about the call paths through hvmemul_{read,write}_msr()?
> >>>> (It's also questionable whether the write paths need this -
> >>>> the only MSR written outside of WRMSR emulation is
> >>>> MSR_SHADOW_GS_BASE, which can't possibly reach the "unhandled"
> >>>> logic anywhere. But maybe better to be future proof here in
> >>>> case new MSR writes appear in the emulator, down the road.)
> >>>
> >>>
> >>> Won't we end up in hvm_funcs.msr_write_intercept ops which do call it?
> >>
> >> Of course we will - the boolean will very likely need
> >> propagating (a possible alternative being a per-vCPU flag
> >> indicating "in emulator").
> > 
> > 
> > Oh, I see what you mean. By per-vcpu flag you mean arch_vcpu field I assume?
> 
> Yes, a boolean in one of the arch-specific per-vCPU structs.
> Whether that's arch_vcpu or perhaps something HVM specific is
> another question.

Currently we only need this for HVM but using it for both will avoid the need to
check guest type. 


-boris

