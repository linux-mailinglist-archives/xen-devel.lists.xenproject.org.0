Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12DA2E95B2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61186.107437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPkS-0008Hw-7T; Mon, 04 Jan 2021 13:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61186.107437; Mon, 04 Jan 2021 13:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPkS-0008HH-3h; Mon, 04 Jan 2021 13:18:12 +0000
Received: by outflank-mailman (input) for mailman id 61186;
 Mon, 04 Jan 2021 13:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwPkQ-0008Gn-Hh
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:18:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13b8a812-ace1-462d-8c65-141eb860d810;
 Mon, 04 Jan 2021 13:18:09 +0000 (UTC)
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
X-Inumbo-ID: 13b8a812-ace1-462d-8c65-141eb860d810
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609766289;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=13zsp/3YgVjyHy8qdPB2QWLtJYcvnB6rDmMvXggceSQ=;
  b=LNABbbiHn6Xe6y0WcJ3LSqMVYMqzC9PYLbcEIbGi+UO6VLiae23IhxYb
   4C/AGD/zIs3exLvax6YpCD03HhYkA+om540p65z8bs9n1LESXRd3zsMgo
   PgfnPNK3wFEf8w/YFIFlzCc8h5qc+GpZhnmTVcp3/YOtqkLhGML2DulVr
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: u72Bg9S6wbnZKlkH2x1LQPMDGD1R2c0PPpv0yo0LJogJ50gPfrdnQqJ/WEomWURIu3xHDMgNO3
 l9/bhptjka5e5oGTf0FST6nVRCfR2kKNjv5j2QcSKXJGqiCO0IFyu0WVrX3AR1iLos678V5zM9
 20PUe8w4WMtpSUXXzft1qzwDgf17aJ08m964F6gTDkNqthMUgUJqq+jigSpeDLgFiaUi8t2O5Z
 5sdIlKva6M1KS/T1ZWKuhPvyNHTe94SoFl6COZkYOes/i25PQJY83sfdsVO66+v9jgpi+n+k44
 3k4=
X-SBRS: 5.2
X-MesageID: 35599236
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="35599236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBQ1U2mjHqbztTqfDxtoBlC9WqIvAKwW/wKQ7mbBEOsWBXJ4n/EpaDYPR6K0mb9YnzllLkdCqRhOm/uhL1NDejwUiqkkTWqQldBTYvnGi1yhQ4WGuIgBacHxNEGEu2MTiVz+DsbsztTM3fXJESoQQUxsocINB8chSy8Udq+alitwWO2oPV1aC5CX/1FeDZua0LYbTIelDVyIb4mc0MaVMywZ9oL4jlTJUi+Reen18D0ahoUHLEvIIGUIOzxNXouKxqvILhrD6uqWwQiNcvo3U+nerOHjdqCrqWZRk3zHfp0rl8t4D3C3Qb3dEO0eH0QUpf5jp6ZcNB70IEf9TsIV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GkzFCQq5aY2BGrWLxUmCMej3tD4FCVV4/AxIhcPRWg=;
 b=Qjd3lrEDZdAUcCDVtQhB+RXYXYNcjzDnl85wnY1n9Sshqi6ZySJvKUarIzCRvHTSqckGOY0fcMgfW1NHD0XVBdyRP99p6k5kDIRfNhuFzrx8KHkp9so/BhuEjv8h1M5+NEzQzGY8eDKx8to7VN9Ih6bfOuWrr35oNywpoXFH8TudeRY2k3fL9lxurfyZYOZUq96N3abk69H47JjKDuKVNew1coq1hG6KBl7bIKcI+Da31don7xYu0YjAlRmLqSSSpV25NKpECLRTxGZU3VMTSHTkeI6n5ggeOqs/GL831zmaUFBjithBmYtv191fuadKhtQJDs+P/zY51Jq1tuoDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GkzFCQq5aY2BGrWLxUmCMej3tD4FCVV4/AxIhcPRWg=;
 b=mZCta2cPDmrvpnMmSjKIf7PGyaNjp8kquwggRTteao/HyH4Rc9KnuqV1PNkM+ZjT1JbHDOGjanQnn73LHvJHOFsFLaoJq5qCRbdKJd4wcCLN7WRvVTPBEe0VIreTJpJTIXck442sFc21iM/1xjeEUWQ1Yeqmtq7LqjHCFazcuAM=
Date: Mon, 4 Jan 2021 14:17:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: Re: [PATCH] x86/p2m: Fix paging_gva_to_gfn() for nested virt
Message-ID: <20210104131757.4jpjpy53ugqrbzry@Air-de-Roger>
References: <20201231171021.10361-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201231171021.10361-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8d772a-18f9-4523-0519-08d8b0b32ba2
X-MS-TrafficTypeDiagnostic: DM6PR03MB5082:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508235353A3A002CE7169E178FD20@DM6PR03MB5082.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIURUp/pqYveHcmD7dont0j1HyXIBzcZULIkeVycTrehbqZ7iOwWnxZ6MgC3+FRMDqmhfvK/OIlwS9tCoJ1UcO7QPR4U90hT9eoPQ6TwqHnDKwpCIArJnOJrE0CD5ReHrQelyWoP3NKl4XeaUbqMQxbxwWamqN9keQk/+j49X6xLzHd/ro9XmogofyUs+hffX3YV4oouPWx8JTPXmyN/ZE7PqMhzRY2a7YiMBRDFrjmZ6mzFRwdBtvzxiZ2JIpJ/jyT44YSQbQcomESWR+G6KPNlQ6IVdrpxuPbKiZNu9FFUXFhcviMRwKuoYlNT8uT2g+G8Twrtb9UlC/+9r0uJ6DqF/7rTM+2WLTXNyu51TBjXh9Xowagd3GODtT0WhOqCzTzzbFvdcgpFXAyGqe0YYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(86362001)(186003)(316002)(85182001)(16526019)(8676002)(4744005)(6666004)(956004)(33716001)(9686003)(54906003)(6636002)(6486002)(4326008)(6862004)(5660300002)(66946007)(6496006)(8936002)(83380400001)(26005)(478600001)(2906002)(66476007)(1076003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHhSVnlWd1NWUUh1SkQ2VDdBc1pPRzByQm1hcVJGMVpKY0Y4QTI3TnhHTmNE?=
 =?utf-8?B?MDZ3WjA2cVBVRGJTMWQvcUpsTi9halRWcERBanMvNnJDVzVOKzdZZDVlWlRy?=
 =?utf-8?B?YmlyTC8wK0tTTlBtZEhrcSs1QU5kVDd0alRJejRKOGpkeEdtRUhYMGVqejZR?=
 =?utf-8?B?dEFVcmxLQnovam5VbFlla0ZJb3dkOXV3QmRnL1hmWTJuSU1qcGQwamJzdkFM?=
 =?utf-8?B?TGt0b3NMeWIvYWhlaVpwUVBNWUlCUzNhck84VlViSHIxekI5QXQzRSs4N3Vq?=
 =?utf-8?B?K2dUeEl5QmlkVW43VjczdDI0OTFxTDU1cm5qWjBpMUl4TU12UnVIdk9UN0pt?=
 =?utf-8?B?VTVJa2dGYTVqSkxLV3VoRUdhaFpJcVNBM1Zha095Sld3bzQ3eFl1R1lZTGxU?=
 =?utf-8?B?Q2w5c2VYQlEveUtGZXR0QWdiZzROTGdHU2kvY3h2NzByQUpSQnBWclZMY2Rz?=
 =?utf-8?B?VHFnR1ZoMGE3WWxMcGg2b0F5enFOd2FpVmFJWmhNTFJHK0hPSjdzWEs5eXZk?=
 =?utf-8?B?eUpLVFlWWFAvcXhIaW51OFUwbGRUQkRXOWsrc01KZTE1VU1uTkxTNzhYK2Nh?=
 =?utf-8?B?ODBsaW5qT3ZaT20rc1A2Tys0ckVOWnhyWXJlVVVOSU9DOTNZcXFlajBXNzRN?=
 =?utf-8?B?aEM1QTNOSE9uNTZJTjdoVFIyQjhnR21GRDV2bHFSWUswYnJIV0xwM0ZzajZm?=
 =?utf-8?B?OGROd2NMVlVSa29NZnI5L2NDVHhhZTRMa2dMVng3TDF5NExzRkEvOHBnbzVU?=
 =?utf-8?B?OVkrRDNKL1dXSzVtSlcwdVlUZEc2MEoyRzBKSytsUGRTWlBaWjBFN1ByZjM3?=
 =?utf-8?B?V0E5MkhSV0RDV2xoa29EK2hNWmpuK1pHekhrNU4ydGJNblI5MnA2T0ZEZzRJ?=
 =?utf-8?B?TmlSNzgyR3hOY1RXOVRVL1p2MFFSVGlTVlh2cE5VRkRKNk1oR1phMjlNVEpB?=
 =?utf-8?B?eGthdUJFemF6Sy8rUENXUjhFaUl3RDdyaEV4bWsxQUxVYzYxM09MR0E5M0FC?=
 =?utf-8?B?aWlyVlhYb1RobnFZQ212T0JEYkptKzU5Q29GVnZyNGFibDR6YzdjeTl3WEUv?=
 =?utf-8?B?UEIwSTVzb0I0ak9NSEVWMTk4TC9SeE56NzU4ajk3Znd0a2RPbXFOamM5Nlpr?=
 =?utf-8?B?TXdDbGI2bDFKWkhLWkhORmNidXRYQnlGZ1JvSjJtQjA0THg2dGg1ZUFUUUdy?=
 =?utf-8?B?T3QxUXplNnNiWmc2ZjMxMVl1Vm1GemJ4WDh6MG96UnJRam5wMDZJNTQxZ28w?=
 =?utf-8?B?eEVmcy9henQvU0d4eWRENWxsSTlEMnZtUVhXcytQN29UV1lYUUp6OWVUeGNm?=
 =?utf-8?Q?Y6NUjeCaEhy37tA4WIJZELQNr/LeiNOZ7N?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 13:18:04.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8d772a-18f9-4523-0519-08d8b0b32ba2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7BdRn0baGQ8rna2LqbIpVrkmjG+cl2wAFSBULsmOxZIgN8uxd9uy0CQvER49D7EOWqdy0OfDAtQdgaKCF4T7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5082
X-OriginatorOrg: citrix.com

On Thu, Dec 31, 2020 at 05:10:21PM +0000, Andrew Cooper wrote:
> nestedhap_walk_L1_p2m() takes guest physical addresses, not frame numbers.
> This means the l2 input is off-by-PAGE_SHIFT, as is the l1 value eventually
> returned to the caller.
> 
> Delete the misleading comment as well.
> 
> Fixes: bab2bd8e222de ("xen/nested_p2m: Don't walk EPT tables with a regular PT walker")
> Reported-by: Tamas K Lengyel <tamas@tklengyel.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

