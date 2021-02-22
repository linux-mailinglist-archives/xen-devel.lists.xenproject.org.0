Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9696322043
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 20:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88355.166105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEH0Z-00022X-2U; Mon, 22 Feb 2021 19:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88355.166105; Mon, 22 Feb 2021 19:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEH0Y-000228-Ug; Mon, 22 Feb 2021 19:36:38 +0000
Received: by outflank-mailman (input) for mailman id 88355;
 Mon, 22 Feb 2021 19:36:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEH0X-000223-A9
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 19:36:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20ca9ad8-fba3-488e-aa94-9e8a4153e421;
 Mon, 22 Feb 2021 19:36:35 +0000 (UTC)
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
X-Inumbo-ID: 20ca9ad8-fba3-488e-aa94-9e8a4153e421
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614022595;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yIIDdTs4M753HnCo4p+NLv4EdJWLKKVNJwGdJSOVFSM=;
  b=eHiJ7Zvo4vf2oBd6OagZLt/+12pfh+loiq4pBjoDS6SpaDrX/jFYkKB5
   Uh/mIjipc0k2rdN8MXNsj5TKhQIiaqjKwJir+qzTxwTD5FQY3NjUIZ53k
   sLiPVhISlb40+OCa5AmAMj4lRbb7bfCUwQ7DO2LvV6PEsNEg0aEcc0npK
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jUvTIvZWIdATa/pn29vU+7/MGA94YGdjfMotrAJIYmrEBpoSQqVIhCKRaKKSVfnd+wGETA4R1M
 II3kAn5kuk0QkyA3tGHBa7t2kIKeFhFmp38VPepmjoRPWVoEB75QJ+ytUb/g/czL1v5piiPml/
 r2Hn0rFt3P6iIdp6IukB8e7SZcvmYKXt/30E/wcADnhqWuJdJ62TYbmHH9dg+lDz3mpH/poz00
 ZCTDvGNkz8c/qXRuE0gx5I0xvMP9bRZXyirUgpFANirxWA/0eZDp1n1AWLDbax//UwyLyV6Ckl
 8u0=
X-SBRS: 5.2
X-MesageID: 38138546
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,198,1610427600"; 
   d="scan'208";a="38138546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKfzNeEIbuyTj1FINJDtvSsVqfww5QEqe5m0ZOoFtL3RUpPm1u4VXB+TyftBbZBcl0uoZu5Qjd/6n4ZF5EpZumY3apkCE2ldgodU6YjQOwdv544FQT1Rh7lkYB7u8ffYdP75PwTwheIuNvmIVHYRJ1yl+ETsrnCadWb+4VZO/Xub6vI49hcd/v1HWPBiKKDscm1SFlkkNNpKSI+ahBie8rlZ8Vl70a5/E6fcYnEcnQ8MO8urL4rxEmwA6+mYR1kjukf2zNQ8ggTHhdLbCuIuTJgO+JkLcXwezlnMYxIcJvpcg7BRfjaaOEfplEkQNjPgHknmujvCdkxrtMmint+QXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MEpMaYpx1LTAi9LKxCvjT5JulrsbKJ6fs0Biqt+3zM=;
 b=eJWKIQ+YU1sSAxISRR0lbN9iscF5WytJn9owYp8zURYBhsrFPfTZM+pIrU1f88hx3usBnxlp5foefh/+5196j7Fr8s7OnDDHo1S+wVLrqVIflf3XYO9GgF/BeY5Fhjk0CtbYeNufUwCbs6jTawM5A18ETgTQRIW7RN0ljYqMQGxrIi4LCFPuJGVGSNDpp+oR2Nt06jXVGtARz3iRKkiQ1dKyHR0r/KCSGNAUURBMrzOXuo5qwlDPYRivsdMiuvKfFxAtl5yog3mXtqHnXKKrTW0zL+R5CQvzELQweNBaUvs1XR693tAe5ETDNQVbMUeh+Y/ER+eldxQPmtikFJV+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MEpMaYpx1LTAi9LKxCvjT5JulrsbKJ6fs0Biqt+3zM=;
 b=p384+T/cKxMRwwtjhCww9NheQ7wPqvpvGW/mP8xru6UD01WuS+seKQVnrQ3SZXj0xOGzws7Ulk28gb7NjyE6XCj9UsCe8uC4cHP5QJSkFzy6eBl01BMtz1aFOtmNpjVGjefBwZ4IybPp3LQNPXP94UNdHhAkfwngBH/+OlUuYss=
Date: Mon, 22 Feb 2021 20:36:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
Message-ID: <YDQHuHRJqhY4BruZ@Air-de-Roger>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
 <77a36366-9157-c3d3-b1f0-211f4fc39a93@suse.com>
 <60a31ec8-6844-2149-1a04-7e757d1d2dd3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60a31ec8-6844-2149-1a04-7e757d1d2dd3@citrix.com>
X-ClientProxiedBy: MR2P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e520f8e-d8ef-48d2-4c43-08d8d7692758
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4683AD73542C08C9CE57C9728F819@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTdueBf5a/7gB6e5QdpHPWw/dv7qxj2Pw6FJqcJooaBErjRX5ClbyQ41ukFpoDVRQSAHu0PM0RXJI07IPl5N4do3GEUfIl3pATbOEwPOvit/z7FQdKPf/2XPMl5UxtLoFlKMy8llGTfLsVq1PJT8jeH3C//RbHWAqXxnooo/RQWxAuqZC4mPYfbBWg3OQTU2TZpcXzIRhEZVvOj2efXcOffO8CvDor+d+CFEc72fHs0Wqm/V2/AGLfcAIHgX7iIlZHnU4cSbmNTgIvhyJkUwwqcE+tCVLTICcTgF8KHN/BM1x1P3PjDjgCN96Y9UucUSpyPwzvuZlvHg/5tRegjYVSLSvRsbWTKzZUPJGd+bKwJ63A0DxtDTTgsyxWUvpLEuTTZWsOjAWo+sHg+xFIXZBtjQK3PnujMcNeJl0llEq2epiW+WAoQtZ66Yj65eqw/gQcTsp1XMmsp0JZjfNDhJhK6i+jy6IrXC/tRuQE3Hv2XpQogXSgjjlO2tfWCIGXMtBmWNlY3ddOecM8I2CTPFVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(33716001)(83380400001)(6496006)(66556008)(26005)(16526019)(956004)(54906003)(6486002)(66476007)(9686003)(86362001)(316002)(2906002)(478600001)(186003)(8676002)(66946007)(8936002)(5660300002)(6862004)(85182001)(6636002)(53546011)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SzllOFZKQ1QzQzh6OHR1VmtVUUZxeENzY0wvMnVYR2RFVUhSZ2RoWGFTaG1W?=
 =?utf-8?B?c0hxMHF6U1orSTlSK1Q0MndWZjJkcWNvelhoQk5KL2l1VHVOVlNrQWVzTTZz?=
 =?utf-8?B?N0hXTVRkSEpiODJFTWdoaUpQMExRRmlGZ2VoWWttbWE3SzRGbFZmL2NOd2lC?=
 =?utf-8?B?eFdVNUpDSy9xRjZjR2gvUjRCWng1TXR3VDJtYzg0ZzdkV3pUNDArY3Vnb0Ji?=
 =?utf-8?B?M0VxRHQ0QnJ5bnZnSlVGTm5wdHJxTGRrNTRvRVdaVmIxR3NNbW84MzhNYW1Z?=
 =?utf-8?B?M3BidHdJcFl1em8xa21LS3BRcGlRRk1TTjhPTkcvNmRWMlJ0M21Na2FpOWNG?=
 =?utf-8?B?Nlh1SHBneGpnYW9sWUlRZmFrN2sxN3V0T1o4eW83ZkpzTnZ6YWxoc0Rsaktw?=
 =?utf-8?B?MDN3U2ZyL2xkdHdxYkpTelNFc0FlV3haMC9kRjg1bk1GY2gvSDFFZFRQTjZE?=
 =?utf-8?B?Zzh6SGNqK1k0MHRUSUUvOXc3Zklid0RLYlVra0FSMjZJTlRobDlrNmlicTNJ?=
 =?utf-8?B?bm9iaFlIODE3Kzg2bjdMblBFNWVaNVYyaHlpclYySW52cGNvSS9Mb2s5UEky?=
 =?utf-8?B?TXE1UjBmSzE3Qk0wTjh2TUlWUTI3ZDVJaVIrN0pBUnIybUlYT1NBZzVwVThn?=
 =?utf-8?B?OEZodHZRdDRyWThHQmhsOGR0SjRxWVlqOGlGeDR0V1hraytsQnk5RGxPTk04?=
 =?utf-8?B?ck52SUJ5ajlucWVmaHBSQ29mdS9CTDBUeS93Q2RoamhSWm1ZTnp4N1dxNTdY?=
 =?utf-8?B?djZxK1pzaG5BKzlTOGNmL3Y3ZlJVZFpGOUYzZHpDZ2hqQkpadWFXUlVKQ3ZL?=
 =?utf-8?B?YzllSmtvSXdUWWNscnJYdjRZbEt3NVp0T2E1bnZnaG1HcmxtS3NnMzBDcDZz?=
 =?utf-8?B?Vy9uQnA4aXVaSnhrZ2lmc25oT1kyeVZvZGcycG5HTllnclptcmhQK2VpaElh?=
 =?utf-8?B?bXZJWmhZMU9YWUlYUERtRzJNUWZ4NXBEUEtNcksyRUFVUlVleVBEcGxsbVBZ?=
 =?utf-8?B?NkJabGJEU2ZUWlNFZUVMUmI4UFR6aEExTXg4TWF1TVhkTjVRaEp4TjFDY0h6?=
 =?utf-8?B?YlVtYmhzRzBJblE0NHBWTmVCc1VOSUtmM1V0ejJEN2crVlMzcUp0YTNGYXJW?=
 =?utf-8?B?R0ZuMXB1QkJGNk9uU3B2TWVxdjVQYk91aHBqVWJud3dXN001c1o0dlJPa01V?=
 =?utf-8?B?S1RESXdxMG5sbVZNNzlaTmRWZVZqb283ajE0bzFMRlMvYjRQbmhidXJkYlZK?=
 =?utf-8?B?MDdmU01uL2o3S3BONmpDM25KSEIvdFYzeDBIY0lXM2lZdmVSOHM1elhnNlAx?=
 =?utf-8?B?ZFRMRFhLU2FKT2VnNTFSTno0WUplMEtyc01xNTdlTHhQSElGbVRjUFh6N3Ny?=
 =?utf-8?B?WTFrQUc5MHFsd3ZIVzFpNERidzU1TEltL2tQOTNmUnZWMXUyelQwTkNGb01X?=
 =?utf-8?B?blNFelE4Ymxha3dYYTJrdTZNSW56T0cxSjIvL1BYZDVtMG5OSXBpdEZ5NUZp?=
 =?utf-8?B?THd0TitPTWdCWDdNb2Y5bkovYXFHWXQvbVRaS3JtOGRwQitHdDNWTE5zWGJn?=
 =?utf-8?B?M2w5N0lKVFF3R2hYK3ZiWjhkRkgxRW50aFN5NzVuL0hXTmZ6b0pnT2duWGI3?=
 =?utf-8?B?N3JEeE05QldDN3hDaUJWdk4xYzVVcU83eG1Lb1JCOXRML3c0TVZaN1RId2x5?=
 =?utf-8?B?QmlteHlzZGVVQ1lJWFhJVXFFS0hINlFKbVVLa1lBc0Rxd3ZDc3BIWHhTRkly?=
 =?utf-8?Q?jgXuwEFj1aoXa+pZxIw/7m77S0f4TI3dcJ7gbtJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e520f8e-d8ef-48d2-4c43-08d8d7692758
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:36:30.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQDZSfdh9ERA4kA6okkN9NY/yik8ZU3LmY/K1UylZv07PJNcoE1K1Yv10c+9kdy0gSScdePL2xJ5U4dsxQAfAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 04:47:38PM +0000, Andrew Cooper wrote:
> On 22/02/2021 14:22, Jan Beulich wrote:
> > On 22.02.2021 15:14, Andrew Cooper wrote:
> >> On 22/02/2021 10:27, Jan Beulich wrote:
> >>> Now that we guard the entire Xen VA space against speculative abuse
> >>> through hypervisor accesses to guest memory, the argument translation
> >>> area's VA also needs to live outside this range, at least for 32-bit PV
> >>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> >>> uniformly.
> >>>
> >>> While this could be conditionalized upon CONFIG_PV32 &&
> >>> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
> >>> keeps the code more legible imo.
> >>>
> >>> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
> >>>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
> >>>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
> >>>      }
> >>> +
> >>> +    /* Slot 511: Per-domain mappings mirror. */
> >>> +    if ( !is_pv_64bit_domain(d) )
> >>> +        l4t[l4_table_offset(PERDOMAIN2_VIRT_START)] =
> >>> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
> >> This virtual address is inside the extended directmap.
> > No. That one covers only the range excluding the last L4 slot.
> >
> >>   You're going to
> >> need to rearrange more things than just this, to make it safe.
> > I specifically picked that entry because I don't think further
> > arrangements are needed.
> 
> map_domain_page() will blindly hand this virtual address if an
> appropriate mfn is passed, because there are no suitability checks.
> 
> The error handling isn't great, but at least any attempt to use that
> pointer would fault, which is now no longer the case.

AFAICT map_domain_page will never populate the error page virtual
address, as the slot end (MAPCACHE_VIRT_END) is way lower than
-MAX_ERRNO?

We could add:

BUILD_BUG_ON((PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS) - 1) >= (unsigned long)-MAX_ERRNO);

For safety somewhere.

Roger.

