Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B62F1828
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64899.114782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyy9C-0005vO-21; Mon, 11 Jan 2021 14:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64899.114782; Mon, 11 Jan 2021 14:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyy9B-0005v1-Ub; Mon, 11 Jan 2021 14:26:17 +0000
Received: by outflank-mailman (input) for mailman id 64899;
 Mon, 11 Jan 2021 14:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyy9A-0005ut-Kk
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:26:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37fb2bb9-e972-49b0-bcdb-4951d165220a;
 Mon, 11 Jan 2021 14:26:15 +0000 (UTC)
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
X-Inumbo-ID: 37fb2bb9-e972-49b0-bcdb-4951d165220a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610375175;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=miyK8KVaRTg9byt8gkPnXWMV9lvzuOLZPjqiYoiXcjY=;
  b=CKTgIuw/AO6fB04ojm7JgmoLxVyBc6cv77IHTSxppIV98xsYTk11Qv1K
   LJ/FSns/fZE3+UnkdqFNrF6FVRqbeafEcm3/tGM7u5H1gTpNvdP63MxSj
   j5wAwrQ8N+IJxh/NFoRIuXjkcDOr9Tj7gemzAOXwOJ40r7tY7FEeLWlgf
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6ErkfSsr1KapbrBLz2vWnuzrn0tCGWLCWcXjnKeGA+hMlqTeEETVDA0MWDhWvPE22qHnkPsoUa
 mCWdXytOIJlUeABaOGB4lZ6UDGdk7fr3dTAepdjvainaL2nzmBJb/ZNM3CeaXdWfriWkhZO9jz
 cOAAIAAMLAIkEbIoOqV00pEeJnDYUhhSDDdvnhDtRcSlt2p0kA+0/kx+XwuiGzLrEoQuV8Cb4e
 /uqtbX4LgaWukPWvII2LY+P1OPQwhXTKJB4UGh66k2YpfPiH7IIoWG8tnY52Mx04n3sceDejo4
 Z0M=
X-SBRS: 5.2
X-MesageID: 34869322
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34869322"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdUxgzgysZK0Yb+kJuOiutDWxxIiTIXjU2Wbp1WR31nd2EtjOzC+6+ofOdNCcsQ1fxQOS1gxwZ42NPz2g8Rao/8+qk8kke25UBGwDuvDv6gkZp8u9mCIqYC8pcC1PawwBY+qT4DBLl8V38jAsbgAfx+Nvp+DJ7FcoYgbd/+IDvERn4IJzGdWA52/NtGZwiIZGvKUoH+4jtP2abvw1qJw8TPkEcIht1JkVcy0nxDEwtXmYlvBbqIaW4bdn2/1TDYgF+K3VWe8qRUZHb1rgI724mWDIt2gvnV72eAQgwjTyJQfIJrk9U8vg3QL2ZVS0jjxBdKhWNtGYhlQjxH4/4cPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/x2FTPAzgwYY4bB9bWOK8CrM9sC0tJrv9hcZuZ5xn4=;
 b=ZHetKfQpy7Y2J8TunkfY6ArdLNMjTWnB6CdO3isZrnOH2up+3DNAQIcKI/C/nHTTcoHxkbQRRMttUL0TQH2UxQ1sLs4F9ib3VQqqLVPk07fegZgewKgpia46XKOpfd77He55yHKx+YzJki+mDlJPak+InmFMWFLrVngr2+mkcUStNjHLr+mKQP/uELW1EciU8FYIPfLRnv4x2s6KssacHc8jk7BpyyAHuSrD+OiJwNzaQ5JWzcgmIzjbdhXhTPLWoz+4EfyphXpEymwBc+ogS+yrjUBBfMqV4R8cX+wTq2MtbZf4BlOT474YHAmj4BY5BVa3xAXB6VDKIT4eCN1VAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/x2FTPAzgwYY4bB9bWOK8CrM9sC0tJrv9hcZuZ5xn4=;
 b=jaoS92rITQS0l19pREGrDqDy2MndecAXIUgmZv3Zq3WSMIykl5BzqfvfT0Krq4yFtp2FLgJWo7dn5Y6hlpWhTjCBPwZDEC8ZnZqfk6YjdSinoAIaQXEpEKeYHRfDosICovrDt5OYk6zDVjGkq2+o+hJN3DN8vjQDh+ugDVGuer8=
Date: Mon, 11 Jan 2021 15:26:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 3/5] x86/PV: _PAGE_RW changes may take fast path of
 mod_l[234]_entry()
Message-ID: <20210111142603.jvs7wl7xrvwst3kh@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <11633161-6809-db0c-44e6-e5f383f4ebd2@suse.com>
 <20210111110841.timv43eteslr54xz@Air-de-Roger>
 <a0e9df02-5eed-55cc-7fba-0a9acd93d15b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0e9df02-5eed-55cc-7fba-0a9acd93d15b@suse.com>
X-ClientProxiedBy: LO4P123CA0329.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d8ddc40-ca5b-4068-bac1-08d8b63cd629
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4217E6462D034BF47F769AA98FAB0@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZQJAut8gJs0TsdxmEqc7i77Xx1vIi8tL1UdtMGVZhM3d7YNM8zySnXeRClECmkZnshcr42FJqSeASn6rRZjPsC3BsUwBkBAsaUwFwIVbZrMqyaGTLVXRXwCtcIxvxfg2EPEVc3NUj5q3DgzLwxk5WRGBsUsoW73wMGpmY3SZReqXgkqpXc7rcaOi0qWKXnlqlibuZPQomkfswAfWRzNdBDLbS7/OQ78xsKoaxDO/D+d1xRiwr5YU3hDi1FipfmItTj0mCaeISMC1AAGq4ujTVJSHct+9LizTdlDP1qfv3j4WJlFdvZTxnyplW02BcbjfH0cIOQzVyd18Ey15c5SmC7uL1te4cctl32B1Iw9h+7fMeZAmNsDEoVoyOpDwi0eakd7ejMbz9pwbSdT+D+aKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(376002)(366004)(39860400002)(346002)(4326008)(2906002)(85182001)(83380400001)(6666004)(8676002)(16526019)(6486002)(9686003)(33716001)(107886003)(5660300002)(6916009)(316002)(6496006)(54906003)(478600001)(66476007)(66556008)(956004)(8936002)(26005)(66946007)(53546011)(186003)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzNCWEN0NWtRYzl5ZmM1c1ZFRyswbzE4bzk2dXNIeHFDa1ZTaCszQTErRnJn?=
 =?utf-8?B?Q3Q1V1R4a2JoMXBMZkxwKzJ0aTBvQ3F1L0g1cDloUUR1RHJZYUpxbjluK0RS?=
 =?utf-8?B?Z1RFS1MxUkF4elRXdnpwanV1elFoQno4QW5LSThpYUY4dHRSTjM2WnhNbitZ?=
 =?utf-8?B?T0E5anZZWXR4ZVZQMGV6VXRwRlVMblE5ZFJXWmcxemJDWGVUVDJVNjNvL3RH?=
 =?utf-8?B?UmJIMEpHbkQrVFR2czhJUlJEVmRSTXB4d1BaRng5RDJnc0xnTWUzc21xR1ZB?=
 =?utf-8?B?ZERLT054cUtlR1JOWFlycjZjRzFnS080VHNFVDgvTTBGdUdobnZjbUJ4MjFS?=
 =?utf-8?B?ZE4rK3cxNmVtVTNPaWczaVpIS3J0OU9SSlpkeWVuN0xBZVpjekVScUlHM0Q0?=
 =?utf-8?B?VVA2ZnJrUWw1TURrbkpjUVJkajZMdCt5UUVjbEtheGVHUnZhTmg4S3dTMy9Y?=
 =?utf-8?B?MTlHZ0YyTHFlTzJpMzM1UUkyZlcycUFKckRsOFNDbDBVK09kaWdSN2M5cGdW?=
 =?utf-8?B?MDB4aTNUZ1NLajJVdmVTZFpNSlpuSytkdUEwSlovMU5Yb3VFd1ErelhNY3RJ?=
 =?utf-8?B?bFFrbzAyMC9GODIyOHRpQ0wrK3ArZnhHSWZKWFc4RVdWdUtyMDRncG04V2V5?=
 =?utf-8?B?SXJuOXB5QXlxSnFmMzRudEpxbEVUV2lWNTJjcXU4L1pwK2ZtRlJHMEdQM2Ri?=
 =?utf-8?B?ZjdNVEU1dG1WTWlkZWVpbmFVMDE1YzBoczIxK1lvZDlnaStVRDFqNEphNkhq?=
 =?utf-8?B?SVljaHIwR2w4UjdqRVNFTS94YVlDWXVCeTdZVFNaeDVsNDJvZFZxZEZGR0Ew?=
 =?utf-8?B?bHpWVVJ6ck1NWDJYak5pYWlZV2FaUERrcE16RS8xejMrZVB1SmRFaTY5QjQ5?=
 =?utf-8?B?U25VQkVDRU5Oa2x3ZjZyakdqU2w5RGU0N0VjWTJOLzg1OE42TlhHQU9sSXcx?=
 =?utf-8?B?Lzg3R0xOOENNWDdsczVRWDB2aWVQd1FjS29uN1IxR2JSNkJ1ZEZFTzR2MEdZ?=
 =?utf-8?B?bTJMUkVkeUNIa1ZlcTdOTTNtNWQ0cEgzZGw5YklVSHVlckFjNWk0ZjZQck1Z?=
 =?utf-8?B?a2YxUzM1T3ZNYUxzT25uKzlQWDVjcnhUU2d1cGwzZ1RoS2xwK1crNmlZUTNE?=
 =?utf-8?B?VGN0TFJ1RW1EVGhaZ0FCMzJWOXJMMStmT1QrckpaTHRlZVBpYndaNG1ZZStU?=
 =?utf-8?B?YW9JTTFhc0ErQk4yRHRLTXhORUd0OTJ0ZzlzSmNCNVc5Y3prRGNRMjlEaVl4?=
 =?utf-8?B?Y0h4SUMvaUMxVU5XOVFjRTZUZlBoMnJ4clVUZDc2ZlQ1RnRjN09jS0J5Y1JT?=
 =?utf-8?Q?fCi/HlmCQoG1kYaZEolyT7TNrcbBpyanpf?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 14:26:07.9749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8ddc40-ca5b-4068-bac1-08d8b63cd629
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVP/WzFuQgASctgGInP3TrnfdlV3AEcniHYNN7SGOTp9oTwh+wqFeCmJWSxiqAltJyQrrCxiDEwW8A7TBJ2L7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

On Mon, Jan 11, 2021 at 02:31:10PM +0100, Jan Beulich wrote:
> On 11.01.2021 12:08, Roger Pau Monné wrote:
> > On Tue, Nov 03, 2020 at 11:57:10AM +0100, Jan Beulich wrote:
> >> The only time _PAGE_RW matters when validating an L2 or higher entry is
> >> when a linear page table is tried to be installed. Therefore when we
> >> disallow such at build time, we can allow _PAGE_RW changes to take the
> >> fast paths there.
> > 
> > I think it would be helpful to note why PDEs with linear page tables
> > aren't allowed to have the RW bit set, likely here and in the comment
> > below.
> 
> I've changed the description to
> 
> "The only time _PAGE_RW matters when validating an L2 or higher entry is
>  when a linear page table is tried to be installed (see the comment ahead
>  of define_get_linear_pagetable()). Therefore when we disallow such at
>  build time, we can allow _PAGE_RW changes to take the fast paths there."
> 
> Considering there already is a code comment explaining this, I'm
> less convinced of also editing the comment. An option might be to
> move up the #define-s next to define_get_linear_pagetable(), but
> imo this should then involve moving FASTPATH_FLAG_WHITELIST as
> well.

Referencing the comment in define_get_linear_pagetable in the commit
message seems fine to me:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

