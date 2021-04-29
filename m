Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356E36EDA3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 17:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120151.227199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8uh-00089Q-LA; Thu, 29 Apr 2021 15:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120151.227199; Thu, 29 Apr 2021 15:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8uh-000891-HZ; Thu, 29 Apr 2021 15:49:15 +0000
Received: by outflank-mailman (input) for mailman id 120151;
 Thu, 29 Apr 2021 15:49:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc8ug-00088v-A4
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 15:49:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40eb7255-dcaf-4bc6-b7a6-bc5b089e14dd;
 Thu, 29 Apr 2021 15:49:13 +0000 (UTC)
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
X-Inumbo-ID: 40eb7255-dcaf-4bc6-b7a6-bc5b089e14dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619711353;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z1fKSP2QNwtgtSjcUP4UZliXkg6w39GVof3uaP1bGWE=;
  b=hrfHD0hro7lZsZfmNrPC6ZNLrYQ+bjsCPaUHWseP5cwJ1/ih2VwWQum+
   HjIzWrNBLOAfdRYJsfzjIaQAR0rkSGZ6ca7PZTrwMotc8TbzMQFrxM/ac
   hzAjdaS9MtiO3nVhZiLWhJIcZNF5i7QYCV4XcQxniATNwppxMxiHZtY1L
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6JLJtJaDxiQcVkDKblPaZEk9xHfPDKjKttCHfbTPETRTLoGhqKJ5IcHOJZJi/zLCNZN6vqajB1
 vbiGYsHFT+6peC5quJpCTiJQZ4kwX90nco+S28f8L/V3Z2PtH3QhWB5rIGF2TDFYwN0Ow4Ymlm
 MAnglIY2LycVWcDUy/lJFNfginoO+Jj1a6zKnyY+4uWLHHszGioIlOlh3wjamm/WK1DpC74aLl
 WX/DBo6m8+01pBhc8HBB8XbyxkL28Ua/MWnAurOzTBrWJOJ9/aGT8mnVToU+wDZ00LYLZGAtn3
 0kE=
X-SBRS: 5.1
X-MesageID: 43107644
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="43107644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTl0Hud9PgaLcCRqJ0ANEPSUuYbNMgvQL7hMZSHxereF6bvOYpb1bWm5pt/WG9uWoFaqNMlz2dWGk40GDqFm1qLoNjOQzNFnrcxBOwrhn8SLYOz9CDOpCuIFLsE+RVIbkEbOjgyJhCiJCOCh0B+q7qPUchU9I/hV93uwMy/EP8DtgtdZWOtOnjo755gEeg/munzAiiiG3Yl/uix1HvrsS5WGXUlb5SQq5qURYJUblO81x9cXy60l8oXp8tZY8qbstwLScv07E045iTBo3bCdKbxRrm+7m4L2TzAxPJZMbRFnWistNXUNBs4F2zdF0lbzNCKK7Y1lCYMrDtHnueQviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MM05zdT3QVI80XF6xaBWZr+I6gI6WFhIVfCbdXKHU8=;
 b=NFFJOftkTURiHwJFg4+8+DRoq79qpl94wEyxWTxj9bc24eTHt1hZzzKFmvf4fPXF4tNDoE7kHTBUGl3RifG3o1Idx6g1k0gq4hnTPhVdc3UuL+jYDi6l0HIgu4udUOFbTSU/rbryQSR/zPe6IpryHrVnro7cu+TB+aiuvC+s11uUS47Xi/ukySYtXdl4izwvFmI8w0LV9UBxv4Xwf8Fyxm9IpPsl0+5lAqyzn1cBo+w/dRBbADirSp5TAtwvIXRGGiV2bszNG654feCv0jAJ51OcNbOsH6NatPMG4LUUKAPB+6j8Nm04GKl1Vh0mjsMhHX3G3ylmID9GrQao4gFBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MM05zdT3QVI80XF6xaBWZr+I6gI6WFhIVfCbdXKHU8=;
 b=BP1bSYLleWiQBBveSSF67BOJw0DaX8tcHmm+g/UQDcP+i5j1uy8bk6HLVrXDeHL0SJHe2QYF3kv8Hd/WQdFfhygcACxEggSiI/DQk4NqFKZfO1bv79JIy713Qf1BBeD79r163jRsyZW6UUEAuOYhFXoOl+BJD1n5tdbtMB09ABc=
Date: Thu, 29 Apr 2021 17:49:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 05/12] x86/p2m: change_entry_type_* hooks are HVM-only
Message-ID: <YIrVb1xCYsYF94Vi@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <8f6e2834-fbc1-4f3b-c305-71bb20b04502@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f6e2834-fbc1-4f3b-c305-71bb20b04502@suse.com>
X-ClientProxiedBy: MR2P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d868a2c2-8192-4746-4914-08d90b265394
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057E809E588351E64C00C0B8F5F9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kluUoXpwLEDkoObOlcOfAo4cDCK7fiZM0ZjOrNMFqthFZ5/q5rga5qE9Q6+JP1fXVPQyAQNaQ7s9KK9/wWoEWDGI06/nx28p7B08sn9um1boNaKLjDRVba0MhvpkdOGlumTjg98jYn4QKxaJnrUdiwOWXCvef+CbPogbkYSMZLJAZ2GMirRQyepsyNr1ZVSaH6KV/TNu2dHndg+3n8/1AJ3U30KL21LbOVve7dTZNTU+om+SruGpSCl3fAfxOcxRQhB0a9+4rHIlBM2cdw/5pxZRfOyx31bP6zncZpgKkKD0JPzAlHEQsP9jfQp9qzhQyAw3bxWe/kulkvHSCXM5JfKycZXPFXQSnYnkASzZA4ToXMK2XSoI6uC85F+YvUDrmycWyrodJJVYFEDNvTiMsdYQWLcBnPZTPlf4vXN8+F+YIsLccLcYneG+23qBlDNGdaDxhcGFnJM65NPMoAc7pYXLJYx5Tp2ifDZeWriisqp7BxwJ/X30xdcsGj+4P3INhrjQChUlsi2jl8aZttrbXZtbDlXffHz/PLtRp+4jwVy+7bgEk3qW6Bj7aJJOxEVvxu+XW7LOdHOtJ/srKWWaPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(8936002)(107886003)(86362001)(6916009)(4326008)(5660300002)(66556008)(66476007)(9686003)(16526019)(66946007)(33716001)(186003)(54906003)(8676002)(4744005)(956004)(316002)(26005)(478600001)(2906002)(6486002)(6666004)(38100700002)(85182001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?amNldk51ZllaeVRmd2NuMFhIWUwzNmZIV2tXT2dFd0VQeFZ2SElFbk10U0FS?=
 =?utf-8?B?RVNHV1lnNkNqSWFKa3NoOWlPQnpiUjlOOHg0cStyVVRsRW9QWGRKeU42dUcw?=
 =?utf-8?B?S3VWcW11TFU3Nms1dXNPSTRYMVpTU2JBaGh5NVNaRmN3b2hZVjlPMzhGcmlm?=
 =?utf-8?B?dy9IejVndS92TXhnc2ZhaHdnRk9GYVh1NTJvRWw5KzA4S082SnQ5d0JmVG12?=
 =?utf-8?B?emJnK3JmMkZmOE1PdG9mMDFxK0R6Q1lEZ2JPM2RoanRKOGdONkltZnNDRzd2?=
 =?utf-8?B?L0o4Y2tBQ1ZDSUZKdzJEeElLZnN2VGd3NXNwNWxlYXhTNEdBOWFBeWpxMldr?=
 =?utf-8?B?TUZ3bmNwQWZJL3IrYy9TbFNnZWJsTU5GbVhkazFWUlV5NXNBeDB3YjZ0UWUw?=
 =?utf-8?B?dmdmVXEwN2ZFU2I0Vy9JTE1tdGdHNDZwUGFWUXlVSitjVkFWbjlYWFR2cWZD?=
 =?utf-8?B?Nm5HVkhMNGdDcGFWUUVjMFEvZGNEUUhZRFBtZGtqSDNMVEIxa1BVOUYvTk5t?=
 =?utf-8?B?QUc4UVhCck83TnBDMlhGaFZtOHRodzllQ2kyQkxjbUpyZHhESUh5QnhiQ082?=
 =?utf-8?B?MkU2N0k2RGtRTTBhanIyWFliV0J6Mzhvd3BUdEhmSVhHaXZjQ2dEMTZWMEI1?=
 =?utf-8?B?TnpSZVRKa0MrR250QmJhMkVRNFh4QmhVWHViclREY1lQTitwL2tIeHpib1JL?=
 =?utf-8?B?QXVtQ3RVVkZmOGE1YjhEczZvR09EQTRxcmsvazFzcDZ5eUZYNmdsV0VZemJj?=
 =?utf-8?B?UmtzM3RrQlB5UjBrZWR5bklaYWllQ0Z2MHU4U1J0OExocFNJd01QMkRKcUd4?=
 =?utf-8?B?QTdIM093R1J0RVFUQWtIS3hxRENxMFdHSnZmYmloamVHQXRaZld1TkZnSWFU?=
 =?utf-8?B?NTZ0ZExTTEdlczlBK01kdGwyNDFieWpDSDMwSnFFcFRBNmwzY2wya1BMNkhh?=
 =?utf-8?B?YmNQVHhjNXdvQnNmMEVNNEJZZG1iN1JqSFloRHNCZWVRWnVIblEwUnUyak92?=
 =?utf-8?B?OCtyUUNMQWxnd3E2OWE3dzdRYjNiUlJSUksrejJsRDBRZEh4SHRRNnJ2eUt4?=
 =?utf-8?B?MjdXVnhqNW1UNmExMWg3YkpGdDhSSzR6Q3N1bEQydk9oMDZtc2tjOExDQ3M4?=
 =?utf-8?B?djBLTmY2WU4zMzE0Rk5UMCtjdTlyT3RzTE5nekxFTzNOOXY5dGhhZzAzZSt6?=
 =?utf-8?B?Q2xlTE1ubjFkYmsvSmFCNXlER1VJZnFGUUhxNjFicGVyalNXWURoakJlUXpk?=
 =?utf-8?B?ZUpiWUJLSGs4bEJOYll3OWlKNld0OW1wZ2tWUDA2SEYxd1cyQlB5eDlSOWFN?=
 =?utf-8?B?YmtKQWt3S0h6RnpOVGpwZnVseFUrbUZpSnh1bi9zOEsxL2VEa2xBQ2R0Sk1J?=
 =?utf-8?B?YllkOTBpeEg2U25NbkZVL01jdUVZWlhXU1VGTG9OY3FlYlFSWk9UWW1pOG1h?=
 =?utf-8?B?K2w4K0tqZkU2QWk4WUVRRVlibUE2dzZGTTZ0V01NZVJUMjFCZDlNNTB2eWpP?=
 =?utf-8?B?NDV1RWJHMnBTSnptMGFaUmI2ekdQNk1lNDRoSzVKa0F0ckwvRnJhME5CdW9q?=
 =?utf-8?B?cjV6ZlkrTEVaQXhLUDcrcXJzeC9qU2QwK2h2RmdseGgrSzYzWDluQitPTzV1?=
 =?utf-8?B?bGZ1UERvaUM3b1dxRlUyUGpIMitnb0FFS0JZRUZmZXk0OVRqTVRFZU9Ib1pB?=
 =?utf-8?B?TXNISnlzNUhTM3Ezc0pSczBZd2hMTjRCOS9HU2V0ZksvQ1Q2R2I4bFVoN2FN?=
 =?utf-8?Q?nacIfx5x+q67urPuxMVP3m7FYo3/vvZLHPsRU+s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d868a2c2-8192-4746-4914-08d90b265394
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 15:49:08.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWvpO6ced8ojcYPjILog+RLVC4ZRk1KWT6MRmtl6+YnArhvjRBfapkAcurHo+qT6qS2yHGh52xA34flEGUGuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:08:29PM +0200, Jan Beulich wrote:
> Exclude functions using them from !HVM builds, thus making it possible
> to exclude the hooks as well. Also cover the already unused
> memory_type_changed hook while inserting the #ifdef in the struct.
> 
> While no respective check was there, I can't see how
> XEN_DOMCTL_set_broken_page_p2m could have been meant to work for PV the
> way it is implemented. Restrict this operation to acting on HVM guests.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I see you also make the recalc hook HVM only in a later patch, which
I was going to ask, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

