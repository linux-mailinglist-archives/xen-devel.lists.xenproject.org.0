Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156539DBB2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 13:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137883.255377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDgb-00019e-PI; Mon, 07 Jun 2021 11:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137883.255377; Mon, 07 Jun 2021 11:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDgb-00016p-M8; Mon, 07 Jun 2021 11:44:53 +0000
Received: by outflank-mailman (input) for mailman id 137883;
 Mon, 07 Jun 2021 11:44:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v64b=LB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lqDgZ-00016j-Qo
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:44:52 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa5bb2aa-566c-400f-ba79-13b21d8a8dbe;
 Mon, 07 Jun 2021 11:44:50 +0000 (UTC)
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
X-Inumbo-ID: fa5bb2aa-566c-400f-ba79-13b21d8a8dbe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623066290;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oU+7BIOQYIJ4vk9Hrs7NVdUlRzGukvCTg8swiWYEQpU=;
  b=Sw/4YmjfusuxieCKer7Pkjp2yBb5mCDfizL+kKxhMzbgYbOs5ear169M
   MPhxH+s+ZcHpiZBZ7oRSZPOuq8Cc5iUiMKUpvEju2W0jyA7UJotGc7Co+
   ZQja922KCxe+M+e2nP3KdOaSgiQHz/rfkGLHreX5N1OMkstaB6tWsb+RW
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R2MvXMKq9US595xz8s0SMRwO4NcGsXvgS3ixhMM2M5f/VEZEj+9r8WsFOA6yDcP7t4r3SiHeex
 /B2WU0DkFAsEn/HAYBkiXupRF1rd2D/WvfpXXv/rgv72n4bEUNyQeZIhjes0zIaRNHmyJF1BBe
 gPlmXmL+IdoAPj/cOISp9wKj/rIH5/OMVK37Gf4OHylEXInb4ibXHcJS5Zai2yDq4/e75ktimJ
 AWu4uRwvflBsQTT+1wQuFuaQWEPZ7KD72g2L9eO+tk56/H7iO6chevOTUePEKjMiKEfj+CDzSc
 vs0=
X-SBRS: 5.1
X-MesageID: 45273656
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ev37Paje4JtY9NPsXCyAA5wrLHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; 
   d="scan'208";a="45273656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRtb8aNlXu8LRcg0Wl+2Mfsgu+Q1WLYqECGST6VV34oknB/vCxWGWRpmKiuOAeG8o709FDzIo0eFSxRmRMClQu7iFzKLa5QsWi7+TgrYA7QZiaY3odMmwiHwGZncrBv5mdPfl55R7QJlyrl1bdu8ctHG9tZnM+bPVDBjNo40iam9qqH6Hkbp8hmh8Lp/h/dP6GnVFNNOygkymIc+M/r8kBa7Q8jftHcuOog3UCof8YraBYKFAlEWYYjdlFJTTx4LEEXZr9+ku3Ka/rLljPm+RNMVCcHtXxLSbhZoW/l4WMM63OTdA+FUkg+3TtlHujKzRGkcB6xSghKygmKy00/M9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX+EwXKI2YExnugVtuinHTKeSOeX8gHOq0wQrNOVTGs=;
 b=QIgcyXNXK6BXswusBQIIuOET6LH70zgPvQn/ftZzr5s0I67RxS9QjNeSAB5rs+gvHP4hW7NdbpAwxA5YecO2c+DqqCj+LvUalmQN6jriKI6Ncnta7gog4T8FGFA4BfhVwHqrLSlSS7Ldc8nR5xWS5hmmwqGLhcKTcQCRsl7w+3Sv6JRrj/Xx7NkDcWTTJd7KenjXXeSpHt0yw4iVErGLWr6z910M4gj2R1i1nNYFr2TWd098nk5LvHpzVbUsv4ZgqxmRUJNqCe7rAy9fq18p+L/X+MOq8nTZp5Dt0dHE05ahfIa0StwqUEc2WbODpBDbOF7CpQalUtKbwk+QeEFbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX+EwXKI2YExnugVtuinHTKeSOeX8gHOq0wQrNOVTGs=;
 b=rnHtSu5dmKxxo1o0WWonhO1F+Xbkddzkw2NzGUYqOi4rrCIeg44+/Fqu9OuKU+Rw3ZxH42WPwvi7bgxJOhkHO43W5g6mYojwb95LUGrHN2BemeqPnDpsWRhHnE2q1Xs67zrTIZGUtFuHVSceinCZ3k94RO8Aq1YghZQL4vuPzZI=
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>
Subject: Re: [Bugfix PATCH for-4.15] xen: credit2: fix per-entity load
 tracking when continuing running
Thread-Topic: [Bugfix PATCH for-4.15] xen: credit2: fix per-entity load
 tracking when continuing running
Thread-Index: AQHXHLluQ+xtLrrTJUqwj2ZWRPlE/6sI65QA
Date: Mon, 7 Jun 2021 11:44:47 +0000
Message-ID: <A4388641-0B69-4C3A-84D5-10017B91DC74@citrix.com>
References: <161615605709.5036.4052641880659992679.stgit@Wayrath>
In-Reply-To: <161615605709.5036.4052641880659992679.stgit@Wayrath>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b855648-e559-4e52-8b29-08d929a9a6e3
x-ms-traffictypediagnostic: PH0PR03MB5829:
x-microsoft-antispam-prvs: <PH0PR03MB5829EEAD66217E102EFBCC9699389@PH0PR03MB5829.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: th1g84hhf56ptlAiBuIeqMs/y6hTzaIBfjJHXuhTTZJV0N0K/TLuMkFgR/MEpXi0Xs1pIlxZTrcbGxg+05/DFACtz0dDqrUWrxCGbZIduOMwzOgte2QlvzYI/Zyno9Pehr1uHPEzBzZF6kt4O3M0eThCgyHKcLXWXSCmdjfJv2JEJa7/A7yDRNjd5YZz5odoHhVDgFEXeTaMNfXYjELTTU/s7W+9sEB9t0UbwTqD2C7sPXvMykpt6EugE8OqQlqVTDjaPrs+mKz0fLxO6sZFi7dffVvV2qxm+1lUmzJ7ogQ8BMSeBmTGHFRyJOxYAw10rQ9GqD3oeum9Q3OWRVjGMGSzjijYerT0mO7XVllY501RN/ZM2UtY6pAiVQrWwcLJBSWv2zNf9BGy5O/9Wx52Wv8RbLI19ncT0BcQBoNhIJaD5FU6KfNAFG3pj0aZEswUHU7YEoZffH2QCrowTToJ5SA0mqyzGZ5MgFLKZzCuxaH7AcHAJmV4yqLRnEeaGOedmFf7SLEoD59Pj5stwukrb0jN75Gr9xqIN1qpogKiJcWyRB6J6SPu4sJg+QOPeyFqnzkx8MWBj6++dKLT7kud4MjytVgnfxciuBWx1OQMbhYwvqneYfZSORIwX9oknrxh1ejD4ieQ9qlv3K4w6qCy/9iD7VS7DyKTJnMpoJFie+s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(36756003)(26005)(6916009)(186003)(91956017)(76116006)(66556008)(66476007)(71200400001)(66446008)(122000001)(6506007)(53546011)(6512007)(64756008)(66946007)(478600001)(8676002)(2616005)(6486002)(33656002)(54906003)(2906002)(5660300002)(4326008)(316002)(38100700002)(83380400001)(86362001)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bxg9V/Pq/X9ODfKWKm90NwEAK6nuSHohC/AU0BaNQUJtXfiSTn+WOMt6WJ35?=
 =?us-ascii?Q?x8jm1hk/cnR1LnB6ZrbstqPyLF6h9a7XT5uNBaAqdaXYrs50HJVHflAq0Lgc?=
 =?us-ascii?Q?THf5T43jM1elW1SP46xnqZ3BfQXbReB3eJBm6m48gpguQJt+MxbSCOSksbTh?=
 =?us-ascii?Q?OrclNM85dnmjOn14RHcNnShHsfGbdDRPa41bFmLlsK9CVIuYXGwWnIIBlKSd?=
 =?us-ascii?Q?c5CY+7DMeF6rM0LS+abOiZdFTK/miAPkxH5jh1pAbCH3N5a52HAeYEhC3Hjg?=
 =?us-ascii?Q?dW8ISTIGbipoTqwPGFIXsQ/7NCSa4Q+Ka7vE3xUVgfvVCXI/yJdOgqrCbZze?=
 =?us-ascii?Q?03alcHLFycXAUJk9NsijsQ6AthcbWp9KK5+uUzr1sn9/Yd8hxQ+eW25S5Pr5?=
 =?us-ascii?Q?IGtmWVhFIdMFPpxnTbsuEIvUoMJwMV3EocZXks/J1qrJ2CNPyREO3gCnxOi3?=
 =?us-ascii?Q?uM352+AbDvDG/KQRnVlDyqD2wcpUielh6xbYSO9fwZFzRS8sr4zbu1NluX+d?=
 =?us-ascii?Q?oMr3sdZPvS+jvMtGcRtNpuNSKWNm+hVgv3tgS+4fV6btNk8XCtz1Fuq7tOeY?=
 =?us-ascii?Q?KfY0NtcDh1oZLbr5IXm4nMgwKniqTDhBVfu7mDNkbTaSOVQ9FoYEt1ZGLSUZ?=
 =?us-ascii?Q?iXJ1c+sIIdX/F6Aj4lH3kft3SAZbA/d8l6obUDa/ibIVRpWXCoWQSO9nu0xK?=
 =?us-ascii?Q?VJblIZfWtELcg9h6y7oN71y0n2UXhWZEAQsKyJJMrCi6sxV4rara3TsbXczW?=
 =?us-ascii?Q?lHNV1WfFNUQKP/12aZhx4jTGCJZ5uBAGxgmFjehXNeWkVFFo8EfgU2/z7TNe?=
 =?us-ascii?Q?eEIl6P7TldiFPSIEhFwTulW6rYMdGSdrFcFNHzZrVgttQHYfIhI85sI4g6Kj?=
 =?us-ascii?Q?ee5xTWMkKoEVisjP4UFimVVsHxRSEstwU+vSgvT8/jqfJPN8o5fURKpi6N6o?=
 =?us-ascii?Q?XMyNW15Xq1ciITUsdTpG6gDfe/CJFLYF/rBNfX8dBXxj8sD4incOw21Y/+m4?=
 =?us-ascii?Q?k/B+CkCHEiocbF6MoCaM34G0/+e5pgngoBYPUxCjyD/VCQLBzx44a4fA1Jgy?=
 =?us-ascii?Q?3121byXClOLuFYCMmquUT3cnpJCqCC9yBK2BDbTdwq786/cZl7mAOCFlH4eF?=
 =?us-ascii?Q?5UhU9Rh7WJY4US93XP1nRyqcnGrAjcHgGvv7Hg4UGSjTA2zXFUQKPh1+aFsz?=
 =?us-ascii?Q?Iqe9Bh1IHSJHNOwRMpRIG9LDJi7I90jWjFQTGlI77H4HrIqhfAWm7JnvY5jS?=
 =?us-ascii?Q?3hXZQFfSK/9X8XFUt2yOKacyiLoeUFnWJrDSakshK9DXT9fiazR/riYtR62E?=
 =?us-ascii?Q?eY5psActR5EqzDKiqUQoEb2OpyuhBO5NlpSrD0QWRc8lgA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2196A24B13B8EB40B972CAA00F6BA3E8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b855648-e559-4e52-8b29-08d929a9a6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 11:44:47.4294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ch/Bsa5hvhMWTe5MVLpWc9dTe/ZVd1qES9pG1FFpX5ihJkaLoylSQmBhvhCvgkZT2DZkcSZ7x7uFiWSw4Qr/ajWc7cvtrEztEpvbdoNfawI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5829
X-OriginatorOrg: citrix.com



> On Mar 19, 2021, at 12:14 PM, Dario Faggioli <dfaggioli@suse.com> wrote:
>=20
> If we schedule, and the current vCPU continues to run, its statistical
> load is not properly updated, resulting in something like this, even if
> all the 8 vCPUs are 100% busy:
>=20
> (XEN) Runqueue 0:
> (XEN) [...]
> (XEN)   aveload            =3D 2097152 (~800%)
> (XEN) [...]
> (XEN)   Domain: 0 w 256 c 0 v 8
> (XEN)     1: [0.0] flags=3D2 cpu=3D4 credit=3D9996885 [w=3D256] load=3D35=
 (~0%)
> (XEN)     2: [0.1] flags=3D2 cpu=3D2 credit=3D9993725 [w=3D256] load=3D79=
6 (~0%)
> (XEN)     3: [0.2] flags=3D2 cpu=3D1 credit=3D9995885 [w=3D256] load=3D88=
3 (~0%)
> (XEN)     4: [0.3] flags=3D2 cpu=3D5 credit=3D9998833 [w=3D256] load=3D48=
7 (~0%)
> (XEN)     5: [0.4] flags=3D2 cpu=3D6 credit=3D9998942 [w=3D256] load=3D15=
95 (~0%)
> (XEN)     6: [0.5] flags=3D2 cpu=3D0 credit=3D9994669 [w=3D256] load=3D22=
 (~0%)
> (XEN)     7: [0.6] flags=3D2 cpu=3D7 credit=3D9997706 [w=3D256] load=3D0 =
(~0%)
> (XEN)     8: [0.7] flags=3D2 cpu=3D3 credit=3D9992440 [w=3D256] load=3D0 =
(~0%)
>=20
> As we can see, the average load of the runqueue as a whole is, instead,
> computed properly.
>=20
> This issue would, in theory, potentially affect Credit2 load balancing
> logic. In practice, however, the problem only manifests (at least with
> these characteristics) when there is only 1 runqueue active in the
> cpupool, which also means there is no need to do any load-balancing.
>=20
> Hence its real impact is pretty much limited to wrong per-vCPU load
> percentages, when looking at the output of the 'r' debug-key.
>=20
> With this patch, the load is updated and displayed correctly:
>=20
> (XEN) Runqueue 0:
> (XEN) [...]
> (XEN)   aveload            =3D 2097152 (~800%)
> (XEN) [...]
> (XEN) Domain info:
> (XEN)   Domain: 0 w 256 c 0 v 8
> (XEN)     1: [0.0] flags=3D2 cpu=3D4 credit=3D9995584 [w=3D256] load=3D26=
2144 (~100%)
> (XEN)     2: [0.1] flags=3D2 cpu=3D6 credit=3D9992992 [w=3D256] load=3D26=
2144 (~100%)
> (XEN)     3: [0.2] flags=3D2 cpu=3D3 credit=3D9998918 [w=3D256] load=3D26=
2118 (~99%)
> (XEN)     4: [0.3] flags=3D2 cpu=3D5 credit=3D9996867 [w=3D256] load=3D26=
2144 (~100%)
> (XEN)     5: [0.4] flags=3D2 cpu=3D1 credit=3D9998912 [w=3D256] load=3D26=
2144 (~100%)
> (XEN)     6: [0.5] flags=3D2 cpu=3D2 credit=3D9997842 [w=3D256] load=3D26=
2144 (~100%)
> (XEN)     7: [0.6] flags=3D2 cpu=3D7 credit=3D9994623 [w=3D256] load=3D26=
2144 (~100%)
> (XEN)     8: [0.7] flags=3D2 cpu=3D0 credit=3D9991815 [w=3D256] load=3D26=
2144 (~100%)
>=20
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> ---
> Despite the limited effect, it's a bug. So:
> - it should be backported;
> - I think it should be included in 4.15. The risk is pretty low, for
>  the same reasons already explained when describing its limited impact.
> ---
> xen/common/sched/credit2.c |    2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index eb5e5a78c5..b3b5de94cf 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3646,6 +3646,8 @@ static void csched2_schedule(
>             runq_remove(snext);
>             __set_bit(__CSFLAG_scheduled, &snext->flags);
>         }
> +        else
> +            update_load(ops, rqd, snext, 0, now);

I feel like there must be a better way to do this than just bruteforce reme=
mber everywhere we could possibly need to update the load.  But at any rate=
:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


