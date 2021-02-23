Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C232302E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89047.167464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc2D-0001nj-Hp; Tue, 23 Feb 2021 18:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89047.167464; Tue, 23 Feb 2021 18:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc2D-0001nO-Ef; Tue, 23 Feb 2021 18:03:45 +0000
Received: by outflank-mailman (input) for mailman id 89047;
 Tue, 23 Feb 2021 18:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEc2C-0001nE-0E
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:03:44 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfaaa91e-9940-4dc3-ba40-21c8f24bf469;
 Tue, 23 Feb 2021 18:03:42 +0000 (UTC)
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
X-Inumbo-ID: dfaaa91e-9940-4dc3-ba40-21c8f24bf469
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614103422;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PCgjtMgIflsC6PSiHLI9Ys5v7Nm5z7vXeFYHLR6W0IA=;
  b=MgGM4Cr/LNdw7ToZeHgcQBQOs+67KPWaVHGd0ZArdnRMDkPRrXiejCFx
   4sZcDY07hmgEDpiHKzUHvKOzzku5leohIe25L5spu7kzfkT8I7By/KqYn
   XZ5jSo+wGedLXBqhfYu199U3P6HhfFVcKS2E6zbTdORpVpGVeIKqlpOFv
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I/ga5D+mcVxz/gH5YPjhN8K4X1frv3S6d6GOTHkgwZhdWl/Nx9DIb/OpPGCbUVwBvadfEXhMpS
 iHC1yOnVB3r65vo7YX84jaKDL3p28PL6FISKDj1iweLiQCm7sELkFYitU5e5+OuA1seMXS+U9A
 LdSIhQHZwy5C7jRa8zzdxWyTvlcO5odXTR6OQBxfqQjMIcpp9EWHVRChOTL/iRhSxbxBtrQCzx
 BZWonwt9IG2YX1O77z3ngYQ4t6KhEAsQwv4hPf2TMKzsSJX1knreYaYLHHo3gZHch8tXRLRyS5
 fMw=
X-SBRS: 5.2
X-MesageID: 37850584
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="37850584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oun0jR8m1ZDozQMz0Qus/4tpoK4hcxls1G5qf/W3klaz4EXsOCkXeHGOcoTwXeqC5gw12y3X9Ys1aRlFISECKwt8a8tUaOurW11Ze9AcEQ/ZjHMFW5o/CWgTLKLm1QEe0mgsCAleIjWNz0iN2sapUEwoFgZKMKiKDGDoFfErFuK1MWNCnKzzEhHjE2PWIWxuwJBucbg7gAagAe0r+J6FzWvBZTV2GI4+GqJlikMFtyaF7F64H0S7x3tnw9bj8rz7gekgooZor5t1+PKuBZGE5HHkfX8DT+tMGB9/ijUbSwudbBtqngxZZWhmcu6N/rc2xcavz5pVGd1pJ7zng4DWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HN5eKrFtSWC3HPsDBv8QE0Sl+p3T/8jC3D6N82xv25s=;
 b=fqLjaYEkAWME09e75hNxzwsZ5Kh+a5HXD4TTcyJLTm5eaSlt4tL6m+dNMZksJt1dmUWwb+4yXvPFGgOhPPHYuCX6/QPcGrqVLA/Ev/UZcmkITOiyb5O4Q9XTgzpoDZwJBtLZdqiB0VJxHRD3GJTQID83DUketM9sR14uk4Ft5SdF6hQZntcH76V+tP/Zeqf4uVAOEBtDRbzHhW7b9zf9Hj2BBfaqiWbLVRkRK/CpxXPsWyal5gkvhKzdcHdS6iPNrZMkzVZYTjtwakxoNBEjfEmzmvNG3xLw3kWscVSyC58grtakaaMpulnImVs+a38W5GUcL1/qDOlgSxLkWIeEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HN5eKrFtSWC3HPsDBv8QE0Sl+p3T/8jC3D6N82xv25s=;
 b=GH4E1zr7Yk9UffecGsaDD22qIIR5k5jk7Lk5dWmqDhoaK0YY3tfBUw/KNKQE41RY69lYfli3gxc8zLqxUHOEajpQBkzDGqxuOwnCH7NPysm1X6I5BOYeYzolpNnTymYeOLk0VWldMadAZ6YvQw4q99iRHeD/8Z93qOufJgZi/eo=
Date: Tue, 23 Feb 2021 19:03:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 8/8] x86/PV: use get_unsafe() instead of
 copy_from_unsafe()
Message-ID: <YDVDdozqBnoZjD/H@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
 <YDTuGn8YWRrWlbS9@Air-de-Roger>
 <76207250-1372-e7ab-2d03-b46020a7906b@suse.com>
 <YDUhKw+19ITgVmml@Air-de-Roger>
 <4fdb5952-6196-3a79-1306-e65d75e495d2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fdb5952-6196-3a79-1306-e65d75e495d2@suse.com>
X-ClientProxiedBy: MRXP264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9465a5fc-c45e-4b8c-9412-08d8d82558d9
X-MS-TrafficTypeDiagnostic: DM6PR03MB4602:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4602FF7BB41C92F99283C1BA8F809@DM6PR03MB4602.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EL3kLv1t1Thb4ZR2j8oLfPYrZhxchwLXx7aZwEXJEe4ypPnUdc+/+2LklYp2Pc1e6x8x9flts8WxAs56DCzbzPLJTVb2Vcx+iC0OJAv8G8e0qGb6g+pxNyC2ZNHk+dZtTtl7PysxjeaDqUD3vpuERdYQxyaUURu3EiYwQXm5MS8vPAs3icI6nMzOz0A5xQMRkADutAwq/VYwu9q1vsTihdlLDnB5zmby4k/3N0oZ8riRQpLySOJxL9JWgNMj7A2YGJfVGo4kckM6hg77yvqyKzpU34QMzgjCohhdpbPqMUK/0TPTFLrkkGyQHQXGL2e6A/GR3x03h0+iH0OD2HL9e1bKppc5QB7SREPj7wwnaStFQusF0bymdldxHNBopLFmZyH+u0j3RYNmQmn+ccKhaRAEIXnnoU/i84SPsQ/+qZEhD8RQXMff0NpZuPm1qe+C/9dy9dfNfF4ngwzlrTv5+kLlwglHchNNXyeQLgz5GpXLW/jOEzz+cck7gzTQ73BdVnB5dYA5ZG2ix0pm1TT6Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(6496006)(956004)(86362001)(2906002)(53546011)(9686003)(26005)(85182001)(16526019)(83380400001)(5660300002)(8936002)(66556008)(66476007)(186003)(66946007)(8676002)(6916009)(316002)(33716001)(6666004)(478600001)(6486002)(4326008)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlpBZVU1RHNGL2l5VWRTb2RDVXlMMVVvR2E1NkI2d2pZVC9CeWVGcWtEb1Zx?=
 =?utf-8?B?N1lNcGVOTWdzRFhSNlRONjM5ZEFadnlyeG02ZGs3bzMyNVl3QURGSkozdVhn?=
 =?utf-8?B?bGVJSkszNTBVMVpGUTVhOU82bEpwdklGbXBtUkNsREc3WVRzK1I2S1FIeExw?=
 =?utf-8?B?OFhtMkZVU0hLeUlkWlltOXptRVpIbFdvTGNMT3dESm5yV1g3QWpEQWZMUzhF?=
 =?utf-8?B?QnRQR240S3R3TkJyU0J1S3p0VlFXM2FnTFV5dnlQSmRybWd5UkNsMWhWUGQ1?=
 =?utf-8?B?SHp4Y0p4WG0xbjdvMDJQakJzS1hJbGZUVGR4SWpjYlp4eUZUUmIrN0xZdkYv?=
 =?utf-8?B?c2VMV1RHOHk5QjRHZ0ZaelVaUGhPVHhOb0l2aHZXOW51SnFqaUI1RzAxaC9t?=
 =?utf-8?B?UElqZ2MwM01RUU1uaTB1SWNWazZVVy9KRTI1U1JZU1k2OVluUTRqc2JXUlo4?=
 =?utf-8?B?R0xaLy9US09vWFl3R1dyblpNQ3ZPVG9OL3BFYXJBUUdzUTRVZ1h4RHFUVDlY?=
 =?utf-8?B?ZlhkTkhkeEdsbFpCRG9kZjNyQVQ2R2REV0tBNVgvYnlldVlldExCeW53ZFNG?=
 =?utf-8?B?bm5jaVk2K3B3NHlWNEhDWXVkYlgyQWZ2REluOVJOMW5VMVg4MktDcFBJeVB5?=
 =?utf-8?B?K3FiRUIzaGJlZS8zeHo3QUdhMnJUNjFLby9tNW9aNWRwa1FWQ01MejU2K1VZ?=
 =?utf-8?B?NnZFY2lZVThwZXNUcWsvS1FReVpub1h3REFqN3gxUmRBSnJQdGRoUUt1elZa?=
 =?utf-8?B?cmtvTi9jMDlPWlBUZ0VqUDBTbnRxRDlRQnRQaW12NkxHRE9uWjhMQ2NVZFUy?=
 =?utf-8?B?aGpiaDd6eUlTSDhJcW83d3hCRDBMSWo2Nis5YXRweEhNckVjYWdlc3MxRjhq?=
 =?utf-8?B?bU9hUzR0YWVkUjl2V0UrWkVyVEZkQ3BERld2dW1CNzByUkhXTUpDWGxTa0xl?=
 =?utf-8?B?SE1qOElGb01aTThUa3krSU5xMlZvYS8vbDRQNW4xdDdqNThtaE9BL2JjdzZk?=
 =?utf-8?B?Nk0rV3d6TzF6ZTFBQlBBWTZnVnM5clJkWnAxZWdueEFoQUZrSGorQzlBUmNj?=
 =?utf-8?B?SXAvN05oV1czMDJEQnljczB1dzMxNFU4NEVLNU5NOUZWdy9BODVHQ2dJZjRE?=
 =?utf-8?B?NG00czhzeGZvMlNMcGdhbUs3Sk1HTzRMenFHb1pVckpHV0I4dks5d01peVIw?=
 =?utf-8?B?SXFoZ1p6NmtEVjhDNEsxSURRd0RiRldkdjJwVXl6SDJBeWR5R1grVHUwYWgr?=
 =?utf-8?B?eTFNeGN4Sy9xVDRCUFJXWnM5K3pXeGNLSW9GTVdlWEt3T25xUmhPOHZkNkRz?=
 =?utf-8?B?bnd5NzVUekRabVlpSnRXOVJxZG5mc2tBbnVFMythdXR0d25BNUJDL2h6SGI0?=
 =?utf-8?B?UnBobm9raERzUUswSDJBbjRkOUxGU1Q0NXQ5K0ZXdHpBUEU0VmdSckJyaHk0?=
 =?utf-8?B?YUFNVHk0bGdMR1NmTHZ1bWhaMXZBSUpyNHdwYm82ZHF0QkNXYkNlMUE3Q1lL?=
 =?utf-8?B?NlhZTGVZSXIyaktiekppVy81TFA1eTNHbkdaQUxDTjlJa3NpUjV1NmtrcDBI?=
 =?utf-8?B?T2FNV0xrdURqS21sZ2xDME9vS1dpYktJaHJxRTNhRE5jOWVJMXhQaVVxZEwr?=
 =?utf-8?B?RmRBYnB1aVdxbnVoQlhjK2srMFRvczZGREhOdzFpMFZ0dFN4MjAvaE1pMGdW?=
 =?utf-8?B?dldMUlFKUWE2VW5tcDJBc2lVV0FCamRmV1h5UkdaUXRUdlF3REY4dG5sdHlV?=
 =?utf-8?B?OUJvcVI1ajEwMWJSNUxxL3lxcGtQT3hueHZaVzJ3N1ZlYk4rc1YxSEN5QnBq?=
 =?utf-8?B?V1pQMmNyVVlYNlE2NWptdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9465a5fc-c45e-4b8c-9412-08d8d82558d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 18:03:39.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeVAIGWXmCMAhtCOnjyTcVos30wFWjRNU3VKeAGzgsDK0YefcRVLrJLzFNqVFQ8V1mT1cVY2J3Gl0Fq94O7a7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4602
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 05:13:21PM +0100, Jan Beulich wrote:
> On 23.02.2021 16:37, Roger Pau Monné wrote:
> > On Tue, Feb 23, 2021 at 04:25:00PM +0100, Jan Beulich wrote:
> >> On 23.02.2021 12:59, Roger Pau Monné wrote:
> >>> On Wed, Feb 17, 2021 at 09:23:33AM +0100, Jan Beulich wrote:
> >>>> The former expands to a single (memory accessing) insn, which the latter
> >>>> does not guarantee. Yet we'd prefer to read consistent PTEs rather than
> >>>> risking a split read racing with an update done elsewhere.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>
> >>> Albeit I wonder why the __builtin_constant_p check done in
> >>> copy_from_unsafe is not enough to take the get_unsafe_size branch in
> >>> there. Doesn't sizeof(l{1,2}_pgentry_t) qualify as a built time
> >>> constant?
> >>>
> >>> Or the fact that n it's a parameter to an inline function hides this,
> >>> in which case the __builtin_constant_p is pointless?
> >>
> >> Without (enough) optimization, __builtin_constant_p() may indeed
> >> yield false in such cases. But that wasn't actually what I had
> >> in mind when making this change (and the original similar on in
> >> shadow code). Instead, at the time I made the shadow side change,
> >> I had removed this optimization from the new function flavors.
> >> With that removal, things are supposed to still be correct - it's
> >> an optimization only, after all. Meanwhile the optimizations are
> >> back, so there's no immediate problem as long as the optimizer
> >> doesn't decide to out-of-line the function invocations (we
> >> shouldn't forget that even always_inline is not a guarantee for
> >> inlining to actually occur).
> > 
> > I'm fine with you switching those use cases to get_unsafe, but I think
> > the commit message should be slightly adjusted to notice that
> > copy_from_unsafe will likely do the right thing, but that it's simply
> > clearer to call get_unsafe directly, also in case copy_from_unsafe
> > gets changed in the future to drop the get_unsafe paths.
> 
> How about this then?
> 
> "The former expands to a single (memory accessing) insn, which the latter
>  does not guarantee (the __builtin_constant_p() based switch() statement
>  there is just an optimization). Yet we'd prefer to read consistent PTEs
>  rather than risking a split read racing with an update done elsewhere."

LGTM, thanks.

Roger.

