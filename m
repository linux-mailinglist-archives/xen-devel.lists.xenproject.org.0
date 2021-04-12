Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3E35C92A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109258.208564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxst-0001ef-Oy; Mon, 12 Apr 2021 14:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109258.208564; Mon, 12 Apr 2021 14:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxst-0001eG-LR; Mon, 12 Apr 2021 14:49:51 +0000
Received: by outflank-mailman (input) for mailman id 109258;
 Mon, 12 Apr 2021 14:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVxss-0001eA-AH
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:49:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d12217d5-20df-4821-ba81-61d023beb080;
 Mon, 12 Apr 2021 14:49:48 +0000 (UTC)
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
X-Inumbo-ID: d12217d5-20df-4821-ba81-61d023beb080
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618238988;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=L+JdXt1SzKzNTyKq2EgQOpmwveflVs2Zx3b8/2q4gq4=;
  b=JqGZYLrgRavxD7/pb0ovvZYfPgdy3B8Qr3kGoN5h1RDFgJYxvlKfqHCy
   EbGGhqdM4fdDBNrbv5gwmoZsOM3codlhL2RWk8y2uic24T+NGkz7TULQ3
   GvsDgNVtCVMu5YjgKMEzMX0nfWeqMcK5omdEqlqTa14T8lIRqRVYNciTH
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Yit578DTXAgMPoZCc2TUi4XlNrpguQScsjztvxec6YEuEMHn1s+PfFCph6R4BKWUKhDMhqe/mY
 zh0+up1iZERix2u5rAs6vUhSwqnWwKVQ9rc+S/Uip4IQak/bAPed8fMvBvyJ1E4+3yT58DRMBk
 BBWB+Docwl8uuKPXtMFJiJefyloTedSLPb7R5HI0BivFWEeEO2Qlq5WQDvk+nvR1TVSSh4zCxk
 DX0zkt9hCbFg+iXLeYVGF5jxqWqqazFRvqsX0xo6JE466yeetluBterdenE0LI9Uct/pDd2IXz
 RZ4=
X-SBRS: 5.1
X-MesageID: 41396576
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JAIbYaoFwuox3/PpWUTmpVYaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41396576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfWC+kQswF72aO/tTEA8+CERNjno/nU4FLNv2GANcifPogO/+Dgj9P5PPZl6XETtrHR17QZbUhnnjpussc8FmAwQNV9Uq0xM56ZS5zN0R8QPrwtdH90cr+xYCuQ6Md8HxiE/gZ14QgEpfVWGL2Y6zWVVOm1v4Dm19wQ3IMosFBZkEC/cQBU4PgVw3Gtgk2EmxxEa5zy+873pb7ABT3xdwvbkez9ESDLzwe63Ho7jY2KC30RbUiNQHkbDdyHW9vhHJOvseyzrg8CaEdlxVvTqQWlcu6ybOBf3hCsFKrF4t93O7/iPVV+qWV14DyIol8ynBS6ZJjVcZt9a3sBqA4y6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBPdAEzLTeacBZZ++lg+2ivXRlWRkIjkwoUGETJAqq0=;
 b=gLoj1L/rtwk9LzXqKe/QYvCv593arLegm9yIe2U7mvHOCmeVeq7mV9loinMVKT4cAjt/SYB9YcQzTxtzBXxUUDGYJDgJyEvSlWfawnCkmYNjh2jafdxbKIog9eZjlwMBLOG7EAvM2/Qhylv5+JkrIZVpjIJ+goPI9fwMjO6K77ntJbnlRCQMT79ERiaUyIoL59PDYtDhM66BnEnwzBkjDBPyZBv0RkPnER60dtUzt+T1X25RbK+SI3sJ4Kn6TfmyMQfGf5RaBoDwqCBPiOmSq0AowSbUJazinvuua7CKyEBAOzUlnY2/yNh1RKMPM8lAA4qaI6uJxAd5l4R4ZId9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBPdAEzLTeacBZZ++lg+2ivXRlWRkIjkwoUGETJAqq0=;
 b=lCE/dZZWllg0flUka27lCp1WsrEvWGFEZt/sYh3IJHjkY/BfSGsecopdZHiLZ31/9q0p6rQDnO4M8bG5j0+pJXCjt8HTOB7NxK2y8yu1kaHiRDziirm5LrZP1OGY2p8gzuVjpABiQbwcDKfDgBvf64mRSjvUdOdUIA8MLdTIdrU=
Date: Mon, 12 Apr 2021 16:49:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
Message-ID: <YHReAkwZPnnh2itL@Air-de-Roger>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
 <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
 <YHQUJw8H2tgNy5iY@Air-de-Roger>
 <169d6a5b-81ec-f347-8edc-60ba6ab0864f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <169d6a5b-81ec-f347-8edc-60ba6ab0864f@suse.com>
X-ClientProxiedBy: MR2P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 885b0509-0f41-47a7-43b8-08d8fdc2364a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35781B267543BD631D2C45668F709@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlcL2OrA+QlZqrtYEJCIu/bryofjYDUL4+LOOzaa6UgqWMXZVYt1gCjzcvSoh2fiK0FzOr1ox+qhGD/2NBe4Gv4V6ItteQfZmkXgVftJhuCFR49VyMw9VSPJ3nhTjtMTDmSbU/xwgKx9jClpKkrfC8SYUIWhZur1+JdtxBDZjYTRhnnwgXpHYXp+AV4GT9uXoh3ksl03CRrglH4jP24nJYlT0yj5pU1oltShXl3ucCO5eGsx42tp3kBF0yKS6FB/jPK4OsgoWpEfOUT/0KE+H8vNV4tkh8W6Tc8ZQgkZSuUI8Nv6N/rer1DdRoyWBMVC+L1NR8cn5wVwO/faqxCY1cTGuzl01rDii/xf3vn54I36ggZlVy7CP/wfAJhx/auclUGhjKv/ft9PxJc6EkFR4KHqiPzX0Mmkkzfk3z5+Ip7SX4Et6HKaQTYZ73/IaiPtYalbYNTBZICazXQEwVsCuuWfWpzrzJUV9c/Sm0a5Wt7YVFWNOb+a038hR34mHLQQ8Lr+Hj8v1PX3s7C4sujg76+2QRTldcMNo+bX6eeZ4Jd/ZiVHR+VC55h/KbQiVJUaZMXEH/zGdq1ONuSJceubkBlYICTSIqXsOyUfD/5LFM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(186003)(16526019)(6666004)(86362001)(6486002)(9686003)(316002)(6916009)(54906003)(38100700002)(66946007)(478600001)(83380400001)(66476007)(26005)(8936002)(85182001)(956004)(8676002)(5660300002)(33716001)(2906002)(66556008)(53546011)(6496006)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a1FRT3pQbkNkbHk3TWFUZ0JkdkE4OWRjanc4OUF0enpwVFRKOWs1OEJJd1c0?=
 =?utf-8?B?d0JQU0pKenN5d09NMFRKWnZZcGpTblhKMjBVbnU3RVdwZFVKeUJWa3FUcm9o?=
 =?utf-8?B?QnB2Z25ZdFpDVlR5MjY4bElHQmFTV2hvVVhTQ29JUHlYT2IrV1hrclo3SlJN?=
 =?utf-8?B?YXpCUUF6dVNyeitFVUFvbWNXc21Vd1FIRWpyVlBUcjRYLzRUdWNrR25xN1Rj?=
 =?utf-8?B?eEM4d1l3VlVFQWhEamxveU1aM1NmdlBFNVdyOW5DcGI5cGNReFZ0UWc5Z0NN?=
 =?utf-8?B?U1UxMU9YNzBhSFB5bEx5RFk0cGJNNHFCck5SamY2K2RURmZBQTJPM1ZFaGJV?=
 =?utf-8?B?encxNkxCejRPM2I1WDJaMllSRHNjWEJvemhnd2NpY2dvSm9uL2xST2IvQ2xu?=
 =?utf-8?B?S2l4Y2dSY2hMUnRWZW8xeWQwQ1hrc09ZRDk1dzlxN0d6VEhseVZPajI5eGlD?=
 =?utf-8?B?ZkdIWVlaNW5KV25tU0J6UkNDR21BaXdDS2FEUSs3YzJqdGlTT0hobEs4OGtI?=
 =?utf-8?B?U0R2ZktrRitlODBzOVJoVmpWMkpWOTNnWE9MSlZQNGZhdkRNWXMzR2dGcVNa?=
 =?utf-8?B?SUtHSllQTDRVVTdYNXJwRFgwSVVLYUlJdzgvN1k0clVmUWY5bk5sWXNIc3pZ?=
 =?utf-8?B?NUlKTmxHa3Z1Zy96cVJuR3Z2dXBwZGwxWTZKdVRqL0phNjFaK2JhNDh0NGp2?=
 =?utf-8?B?NUFEejJmbGdvVUNZY0cyb0txL0pudnArRlVuTEw2bSs2Z2U5UThhN0JvMHlS?=
 =?utf-8?B?N2RqZkJYUWNYS2ExQ0ZDaXFhNXB1YkFWTzNXZTQ2ZWFLUVVnUE9HaXVwZXE1?=
 =?utf-8?B?K0t0ajBoZmViZHZhZzBSQThhbzBFS09IS0tINjNrQzJWODYxQUZnMFFJS2lT?=
 =?utf-8?B?bTM2SHBKeE4venQ0V1ZuNjFpRERCOEdkOWZ4SUFSa2wvSUR1SWlKSjdUYUNa?=
 =?utf-8?B?UWJ4VEY0blppT2laZkowS2RVeE5SdFRiQ016NmhEZG55cjUydElxWDluNEFW?=
 =?utf-8?B?WUZpTGJOVjBUaGlRVUdHVE5iNm9tckJJY2FIZk1BWW5vTlJJczY4UUphSVNn?=
 =?utf-8?B?VWZRYlNaeTJuSEoyQytsclM1eFhSYzAxckZNemJUWGsyWTVYZ0dKY0dkZFJW?=
 =?utf-8?B?WStDMkpXK285b0tOVFdLL0VKZDIyRmdWZTgwRWNTMXp2Y1RkYTZLYmx5dkcw?=
 =?utf-8?B?ZGRmZUh1ckJUL1dCOUo1YmdFSmdidDhIR2lxRExtRnlmVWd0QVBPVXNWTFdG?=
 =?utf-8?B?M20wSVlFVWZGdHlQNzZkR3RkTzE2NnZJVnMydk9jaDExeEZRdzZua1BjVlpz?=
 =?utf-8?B?U0ZBbnI1VlptVndYSEhnSUlkT28zZ1RZeWIzL05VN1k4dUQram9KUERpWG5P?=
 =?utf-8?B?Vms0MzkyQXBCd1hqcTNrY1B5WU9xSUhQd0I0RGF4cGFsUzJtZWR0bDZaQU9r?=
 =?utf-8?B?K0ZkYm5lQ2JuWENPby93KzU4MnhnSlRJTmYrV2FXemRpOFN6R0FYRTFjTXBq?=
 =?utf-8?B?MmJDcFoyb1BvUFJsVXp4OG1TQjRtemhxWllhc3hTUkw2ekRaTEZpeWdlaDNs?=
 =?utf-8?B?cjlnWllvYzJIQUJlSXk3d1BudWdYZitBZ1BDRTI0T1MrU2dEL3F5aWtTN05T?=
 =?utf-8?B?TmtXNGFLdkRrbndoN0NUakRUNUFwTitQQVg2VlVLY0Y4ZktDZzNzWVU2OUVl?=
 =?utf-8?B?N2E3TUVFWGJRcjMzVUhlMk14UHI1bEJ2ZW9DaWV5OSt6OUpTVGVSVmlMQ1Vi?=
 =?utf-8?Q?UiYU2Gmi0AuYDeCcS+2kaXeBOeizM4DpKcJzShI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 885b0509-0f41-47a7-43b8-08d8fdc2364a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 14:49:45.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fbvO5NsH3NWGBvaFxm77LBWki81qTk7nXn/eW+z6NzTDRju5UW3WrYMoHubx1LKUsXKel1ACtlpNjTX5kjphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 12:07:12PM +0200, Jan Beulich wrote:
> On 12.04.2021 11:34, Roger Pau Monné wrote:
> > On Fri, Nov 27, 2020 at 05:54:57PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/dom0_build.c
> >> +++ b/xen/arch/x86/dom0_build.c
> >> @@ -568,7 +568,7 @@ int __init construct_dom0(struct domain
> >>  
> >>      if ( is_hvm_domain(d) )
> >>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
> >> -    else if ( is_pv_domain(d) )
> >> +    else if ( is_pv_64bit_domain(d) || is_pv_32bit_domain(d) )
> > 
> > Urg, that's very confusing IMO, as I'm sure I would ask someone to
> > just use is_pv_domain without realizing. It needs at least a comment,
> > but even then I'm not sure I like it.
> 
> I can add a comment, sure, but I think this is as confusing (or not)
> as ...
> 
> > So that I understand it, the point to use those expressions instead of
> > is_pv_domain is to avoid calling dom0_construct_pv when CONFIG_PV is
> > not enabled?
> > 
> > Maybe it wold be better to instead use:
> > 
> > if ( IS_ENABLED(CONFIG_PV) && is_pv_domain(d) )
> 
> ... this.
> 
> > In any case I wonder if we should maybe aim to introduce a new type
> > for system domains, that's neither PV or HVM, in order to avoid having
> > system domains qualified as PV even when PV is compiled out.
> 
> This was my first thought, too, but would come with a much higher
> price tag: We'd need to audit all uses for whether they're meant
> to include the special domains. And this includes auditing of cases
> where !is_hvm_*() may be inferred to mean is_pv_*().

What about we provide a dummy dom0_construct_pv that returns
-EOPNOTSUPP when !CONFIG_PV and take rc into account for the panic
call in construct_dom0 ie:

    if ( is_hvm_domain(d) )
        rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
    else
        rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);

    if ( rc == -EOPNOTSUPP )
        panic("Cannot construct Dom0. No guest interface available\n");
    if ( rc )
        return rc;

I think that's likely less confusing that the alternatives.

> >> --- a/xen/arch/x86/domain.c
> >> +++ b/xen/arch/x86/domain.c
> >> @@ -1544,6 +1544,7 @@ arch_do_vcpu_op(
> >>   */
> >>  static void load_segments(struct vcpu *n)
> >>  {
> >> +#ifdef CONFIG_PV
> >>      struct cpu_user_regs *uregs = &n->arch.user_regs;
> >>      unsigned long gsb = 0, gss = 0;
> >>      bool compat = is_pv_32bit_vcpu(n);
> >> @@ -1709,6 +1710,7 @@ static void load_segments(struct vcpu *n
> >>          regs->cs            = FLAT_KERNEL_CS;
> >>          regs->rip           = pv->failsafe_callback_eip;
> >>      }
> >> +#endif
> >>  }
> >>  
> >>  /*
> >> @@ -1723,6 +1725,7 @@ static void load_segments(struct vcpu *n
> >>   */
> >>  static void save_segments(struct vcpu *v)
> >>  {
> >> +#ifdef CONFIG_PV
> >>      struct cpu_user_regs *regs = &v->arch.user_regs;
> >>  
> >>      read_sregs(regs);
> >> @@ -1748,6 +1751,7 @@ static void save_segments(struct vcpu *v
> >>          else
> >>              v->arch.pv.gs_base_user = gs_base;
> >>      }
> >> +#endif
> >>  }
> > 
> > Could you move {load,save}_segments to pv/domain.c and rename to
> > pv_{load,save}_segments and provide a dummy handler for !CONFIG_PV in
> > pv/domain.h?
> > 
> > Sorry it's slightly more work, but I think it's cleaner overall.
> 
> Doing so was my first thought too, but we'd lose the present inlining
> of the functions. For save_segments() this could be dealt with by
> moving paravirt_ctxt_switch_from() as well, but load_segments() would
> remain.

I see, maybe worth marking as inline then or adding a note about why
they are not moved to pv/domain.c?

As an aside, why do we need to call load_segments with interrupts
enabled? Could we move it to paravirt_ctxt_switch_to?

> As an aside, I've long been wondering why we use
> paravirt_ctxt_switch_{from,to}() also for the idle domain. This
> presently prevents their movement to pv/domain.c. From my not overly
> detailed looking at it, I don't think anything the functions do
> actually applies to idle vcpus.
> 
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -985,7 +985,7 @@ static always_inline bool is_control_dom
> >>  
> >>  static always_inline bool is_pv_domain(const struct domain *d)
> >>  {
> >> -    return IS_ENABLED(CONFIG_PV) &&
> >> +    return IS_ENABLED(CONFIG_X86) &&
> >>          evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
> >>  }
> >>  
> >> @@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
> >>  
> >>  static always_inline bool is_pv_64bit_domain(const struct domain *d)
> >>  {
> >> -    if ( !is_pv_domain(d) )
> >> +    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
> >>          return false;
> > 
> > I think overall is confusing to have a domain that returns true for
> > is_pv_domain but false for both is_pv_{64,32}bit_domain checks.
> > 
> > I know those are only the system domains, but it feels confusing and
> > could cause mistakes in the future IMO, as then we would have to
> > carefully think where to use ( is_pv_64bit_domain(d)
> > || is_pv_32bit_domain(d) ) vs just using is_pv_domain(d), or
> > IS_ENABLED(CONFIG_PV) && is_pv_domain(d)
> 
> Imo it's not "then we would have to carefully think where to use ..."
> but instead this patch is an indication that we should have been for
> quite some time. For this reason (coming back to your first comment
> at the top) I'm not sure adding a comment _there_ is actually useful.
> Every use of is_pv_*() needs carefully considering which domains are
> really meant.

Maybe we shouldn't have used is_pv_domain as a way to hide code from
the compiler and instead always provide dummy functions, as even with
PV support compiled out we still need some of it for system domains.

I'm not sure I have a good proposal to make, but it seems wrong to me
that is_pv_domain(d) could be different than is_pv_64bit_domain(d) ||
is_pv_32bit_domain(d).

Thanks, Roger.

