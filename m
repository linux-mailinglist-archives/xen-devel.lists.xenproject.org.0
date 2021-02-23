Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA8322DAA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 16:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88832.167183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZkf-0001Ov-J7; Tue, 23 Feb 2021 15:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88832.167183; Tue, 23 Feb 2021 15:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZkf-0001OW-Fq; Tue, 23 Feb 2021 15:37:29 +0000
Received: by outflank-mailman (input) for mailman id 88832;
 Tue, 23 Feb 2021 15:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEZkd-0001OR-Oy
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 15:37:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f137e573-794f-40e9-9b67-96b375fccc80;
 Tue, 23 Feb 2021 15:37:25 +0000 (UTC)
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
X-Inumbo-ID: f137e573-794f-40e9-9b67-96b375fccc80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614094645;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sUDcpx6dLOhRBP43cnFz/f8uIz9kVVFXggG9jGn0e4w=;
  b=UvBFBl1ig/BaN0620QbADwe32Cz9uUENLW3oX/UR0MIQ2FEp/1F7Ct5W
   +KVQdCrWfUXN53+rk/oOvVh5YFvB5/EMtyc06VldKkq/I/ehfKFibv/je
   XrVtG8b3PgvrLzsOGBKo6xOq8y7Gbqef0oT5tRUsICeE6YS1vth+2gcDJ
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nmcTU305/hoj0tgouqRSvlVG/cJF2Kk1n4OVKwoiyp8jbcI28qefgm57HqqhkWL/AhRwYPg2zj
 H14Mk3kl7+Ju7FGF6ECNUyQbznuzeGhs/7EPaj8GCvVljCKbnImxZe6S+2u+NKsj5/ke3jZ/La
 DD80EiaKPka4VKAwtTMzWgEgZt/ewmjeIVbskfGowh2u6ooJZiUtgXDmBlq+BsS2TIdwkPoF80
 L1nOZqMiVvGWdWdgdnSLgGIgk47INbUBZfkjABOChneQhOHhyXe6xQ7uExGYjad/OEFe437V+f
 HoQ=
X-SBRS: 5.2
X-MesageID: 37765267
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="37765267"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqR3G8/dECBEEf55WQyQa0klKxFqoXJEl9YultfD8ub7hCyo2N4jMu6yFEaWMLedxE23cYv89pB4Lc0Gy2cZpEgHf2aDacLU3GTW07zg6FmHbr17B7JevQUJS8ycUFvYstRFCqb4XCIbaNaBMyTEKgWhOXHGgj+GZWNJfRbOgu02gqmZzzXxbPmjYYpZU3DR8s30zoQP2pQjPm3+pwLq821KnjNxEo7YCwkTwkD0j2f4K7z9fb2IGp04iLtn9Jtnu3M0RkEVX9ogl6V4W6jVshgA8NJ0F8YKzsDtI46NaQjAZS/6Htq8AUJxDc0toAJwfXQOMvktjAl+LRg6bJvJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk0QKkx8KOD+aEZhcQ5FynwWqr2Jayi3cggBH2hmmCM=;
 b=V6inC/Et0GBzG1ABQ1OEV2dRLX2Sc6wSp7dOoj7sNypDSREFOVhRuEZHK7fRhzJCp326Guwr79XKuPLHUJxJHV5+QMdByzOsFevDGnQaV5/U4Q2+8wOXlyZWw50RqPg3kSKvEOmwhBWEEppEcaKzMVEdQrXBPaXZqZr+yc2tVhnx8hvC144IdX0wvGS83wm+mDS3p+KwRgE8tXyajZSfI/74gsKpCUzOZoXmPM7rxQZgCMdyHMGfueEW4rax35sTgqLD3TcRe9Snd+cd8/yByWsTtrygqoAsYArqQRHAa3cKJk0oSB/c2oBl3xXgBYghlY6TbJi4j3tyVKl78mlFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk0QKkx8KOD+aEZhcQ5FynwWqr2Jayi3cggBH2hmmCM=;
 b=glInX5RN0Nb1orRft62IEf8d7/b6KOXzV97WviHhtMG7dSspvr0WqsE8NUSqixH8Sapr1jvlmlPVFlsZ6gYENoyvqIjW+0ZZFW+968AlzFPeso15PW8APTyGa1qEBEQ3c95CzemvPrhL2qDlhGrlMpaw3zih9wAloTRyKCo5c9M=
Date: Tue, 23 Feb 2021 16:37:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 8/8] x86/PV: use get_unsafe() instead of
 copy_from_unsafe()
Message-ID: <YDUhKw+19ITgVmml@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
 <YDTuGn8YWRrWlbS9@Air-de-Roger>
 <76207250-1372-e7ab-2d03-b46020a7906b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76207250-1372-e7ab-2d03-b46020a7906b@suse.com>
X-ClientProxiedBy: MR2P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7294105f-1963-4b62-578d-08d8d810e93a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49697B36EBDBF49313D2E2858F809@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITsx363DdjHxpe3sLgXvhDVRUPRkcayZothUAo2qGh3255IU53ghapC3goAT7oEX/Ok6VfzVwe/lLmABreV6XFH4lWiUdm0VeMQJ+Z7swLMwW1nDiH71cSZpPg/M7Ra+eTCMcck/BBkcNux6T71N9b41p2PpX4p3FuIc8Qo6+wL8h5YVOpjjE6PlcV20nAu4yYHKf8vbgQBmLGixWEIaAIsMD45cnWFEppFD6zOXE2/rgXpjDPw/tcVMmVwFLK5BkEGP3GqZBkrq6ueFxfHDQIZ0Mt4vTYPrQPqvD+4CtW7ouD/pgi5ZpjdEP3GAbfb9E2MYJx6DKbrsTrpiOrzBanH/tLHKNdSSX9vPR7bcKyL1f1ebXr10k2b7SIL9SG91vx4aOK3hhJccclmLRdkcWwusRPgfEZm6HPC9EJQZrfoGz/f2pl4PzuCLM5Fqk300GOasxFWh2ud1P3VIzBfvusO3NmQNQ/RGhQ/Z1L7qpjxt7b27jZCWdXj2P8A5sX0sYitBDVN5Wow/VvZrZqX8bihbY1I+eSKQAD12jPWemojMuDoGHrU1Xg2oOCP2Y/sE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(16526019)(186003)(54906003)(956004)(6666004)(26005)(33716001)(8676002)(316002)(8936002)(9686003)(86362001)(83380400001)(6496006)(2906002)(53546011)(478600001)(6486002)(5660300002)(85182001)(66476007)(66556008)(6916009)(66946007)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTVHTlBCbE5EUVphUm1wdzF1WmI1cFljRmhvdnNMVUFlQnI1d1ltRkZtQ0Fq?=
 =?utf-8?B?T1A2UG1ISXlQNGYrd3RSUDR1RTF2Z2tXbmdGQ2h3NDc2R1lYbGwzb2dDdnp4?=
 =?utf-8?B?cFIrZWZWdGhlOWF2RTVIZlJEM0ppR3hHcVBVUWUwZjI2cjYxcXlkSWtVOGkw?=
 =?utf-8?B?bHRmQzB5NkRJcVo2WCtXbnZHTmszQTYvL3RCSFRtVVVHY2NWbElyNVVtWXBi?=
 =?utf-8?B?dUNabzl1dzNFMi9iQkVwdmN3ZWtoWEVYaEFuaUtQL1BhMGFpR2hYRmlmQnhk?=
 =?utf-8?B?UDF2U1kzOElERXlvUjByS2xjY20yRnlYNTdWdWh5aDhrTm9pc0g1RmhuRTZv?=
 =?utf-8?B?Yys1TFFUOTdJc3dUeXMwb25IMU4vUkhVUmJYempwL1VGUDlQa280aHV5emwv?=
 =?utf-8?B?Y2tkOUdJN2E3S1M3UTBWaWNaYzBTNkV5Z09EMUs5TjVNKzlOb0pvNkdBMzM2?=
 =?utf-8?B?NGlyT25scGlKZmhRVG1Yck1la2s2Y1hzYm1KR2NmUERmS2xmODlVakJaWjlY?=
 =?utf-8?B?MXpUUkxhSnNNOWZpc3pRbWpSWXZtSnJHSVRCYnZkMDk1Y2p3b0Z4eXo3NExw?=
 =?utf-8?B?Zk1VVUk2d3hoaEJORkdJdkpMNU1LeDJKL2xoUXVWYlNjMFp2eEVPek5VTWQz?=
 =?utf-8?B?VmpLZjhJeGZMWTQ0SWlsa3I1YlBMc2hFVFdIQ0Z3dDM5VWFSY25IMUNBa3lT?=
 =?utf-8?B?ZVNPTll2a3g2UndaNEQ5KzNEUTNiRThCUVU2aC8wNnhxRUhtU2lhRkc0Sll3?=
 =?utf-8?B?SEFibnJ5dS8wbU9YWnNteGVnb2dTd2ptUXNvZ29zL1R1UVQrNTZuYWhodFRj?=
 =?utf-8?B?QlY5ZlNtL3BXalkxWWpzWmlxSVNsbjNiRjhBMmozSWpKMHgzY0R5dEtYVEhw?=
 =?utf-8?B?SUhlelZxaXNpZnVGOW9lcUxNUWNtNkxWSXZtVjN4Mm8xYkgzZHVQNEI5ZFJi?=
 =?utf-8?B?VTRJK2IzMDBKalgycTNSS3Z1cTdmdTl6MmxMSjM1aGR2MjZicnBYRGpKeTN5?=
 =?utf-8?B?WG0yNDJHUFc1YWY5RmtRT29IbmRJb0N4STZxY2FHQXJKQWJKeGlCYlR1VXc5?=
 =?utf-8?B?eWlHTFowRy94UWhjMGUvSyt2UHgxWEtJT1RaY08wbFB1VGluU3AzUGh2WS9T?=
 =?utf-8?B?d0JuZWlDVkZveGtQc1Fjc0FmMlpiNmRuVkFOY0sxYXJHTDBQODVIK1QwcWVV?=
 =?utf-8?B?YUlvV0JXNmlrelROL3hsVXhyWDU2YlducVQ2UlFwSk9aMEp6K0pXeXRGeDNW?=
 =?utf-8?B?dEl1U01hMDJCcHlldVc0cWJQU1FERktRQUFDRXZPZ0RobGl0QXoxUDNGakp0?=
 =?utf-8?B?bkw0VEV6OXJ6TUF0d0ZNMHRrYkFJRndhdGhvMGhzMTNuU0hjbTBSNGc4K2RK?=
 =?utf-8?B?MHpVNkU1ZzZyU1ZldVphV3M4T2NXaitHdTdrc2tZKzFnYTF1aFJPazBFaHlB?=
 =?utf-8?B?UHcvU0M5MU9iLy9DUDdhUmlBWW9BWEVXMzVaYnRRRlBIWnBvM0tzaitMb0w0?=
 =?utf-8?B?dXJLUEt0RkJ1T3BiY1NIbW9RUk1BRENrZFdBRVhVajNQZFZ3ckNOdlFKZ2w0?=
 =?utf-8?B?L0N2dlhUZmd4akVZR2ZkMURiVFhNUUxkWXNTTXdyb2FyWG5zRmxiVzJYNVFZ?=
 =?utf-8?B?aUZRa1JLKzgrUE81aFVYVnlzSXRoY3VjWTUySjN4eWV4VWVOVVd1a0o3eHd5?=
 =?utf-8?B?NnpzWlowdURqOGd4eGgrcUh2QUpCRzVucmZRWXRlV0s1NzhLaXIzOUxXeStL?=
 =?utf-8?B?MkppY0JLb0IrcjdoMnNuaTNOUUZ3VDNCMEpOZWhneGQ5NEVFa3JOenhBM1M5?=
 =?utf-8?B?a3BpaXZmNGpJN3Qzd0Q4Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7294105f-1963-4b62-578d-08d8d810e93a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:37:21.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuh8zY6wl47UQ48aQVUXtJtbe6f0s3FFHj/3UR1PPagr3ZEUvrPCHTQnY+5ooF0W2aeNgLy5f/ebM67o4d/H4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 04:25:00PM +0100, Jan Beulich wrote:
> On 23.02.2021 12:59, Roger Pau Monné wrote:
> > On Wed, Feb 17, 2021 at 09:23:33AM +0100, Jan Beulich wrote:
> >> The former expands to a single (memory accessing) insn, which the latter
> >> does not guarantee. Yet we'd prefer to read consistent PTEs rather than
> >> risking a split read racing with an update done elsewhere.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Albeit I wonder why the __builtin_constant_p check done in
> > copy_from_unsafe is not enough to take the get_unsafe_size branch in
> > there. Doesn't sizeof(l{1,2}_pgentry_t) qualify as a built time
> > constant?
> > 
> > Or the fact that n it's a parameter to an inline function hides this,
> > in which case the __builtin_constant_p is pointless?
> 
> Without (enough) optimization, __builtin_constant_p() may indeed
> yield false in such cases. But that wasn't actually what I had
> in mind when making this change (and the original similar on in
> shadow code). Instead, at the time I made the shadow side change,
> I had removed this optimization from the new function flavors.
> With that removal, things are supposed to still be correct - it's
> an optimization only, after all. Meanwhile the optimizations are
> back, so there's no immediate problem as long as the optimizer
> doesn't decide to out-of-line the function invocations (we
> shouldn't forget that even always_inline is not a guarantee for
> inlining to actually occur).

I'm fine with you switching those use cases to get_unsafe, but I think
the commit message should be slightly adjusted to notice that
copy_from_unsafe will likely do the right thing, but that it's simply
clearer to call get_unsafe directly, also in case copy_from_unsafe
gets changed in the future to drop the get_unsafe paths.

Thanks, Roger.

