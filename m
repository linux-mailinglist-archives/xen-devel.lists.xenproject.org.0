Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791703FD5CB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176089.320513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLoK-0003Ng-Fp; Wed, 01 Sep 2021 08:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176089.320513; Wed, 01 Sep 2021 08:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLoK-0003Ls-CL; Wed, 01 Sep 2021 08:41:32 +0000
Received: by outflank-mailman (input) for mailman id 176089;
 Wed, 01 Sep 2021 08:41:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BIO=NX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mLLoI-0003Lm-TE
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:41:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66a61580-0b00-11ec-adb9-12813bfff9fa;
 Wed, 01 Sep 2021 08:41:29 +0000 (UTC)
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
X-Inumbo-ID: 66a61580-0b00-11ec-adb9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630485688;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4JfLTFLOD28S5qrWhN3Gp2Z5R1EyEGIHqAO0UFHt04k=;
  b=gwm9To9WUxzREtbV40yqZnSLS2kdxBfSncz7sM2U/p/d9Fr6fKBDmbIC
   izyvwcaUwivUwca+hMV2YqPq5GB0CynkkgQ0e3Sbb8X8IkwEcRBXhGKB0
   azNV/UGe1PxxNTM1H404Ygbh0Ux1CQeTMh2uYUHA2/erxO7z3jBazYnWT
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: w8v8xFC/VqwLgk6a+nwW7EkKIIa4lKvOrNPcoipjKTx7NGZDsV7H4j/0aBjbpYX3JstoM8G0an
 ypX4iTeNKuwpu5MGQqzHjzV3kjW2m65//ahbrIOSJdB2950OkDq/3re3qX5sloO8rzKvFlwRby
 taZY2otOjjBYatG1q3CDWy6yUfLLflfLTuCzZ2GNoXcroJqIz64Zz2J/HZJ1zzqgGSCxRI20YM
 5RcSFq457qkUtv1nyAKrjMGwTqMaoCkC/C0DPdIL3LtrA1Ak8U2rxUrhbFzSMTqbzKYw4u0YiY
 dcQrtYL1L2n2xCSmm02lVZwX
X-SBRS: 5.1
X-MesageID: 51745175
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZpVxIamoCnYJap/jxnElZ0sjSmfpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.84,368,1620705600"; 
   d="scan'208";a="51745175"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyRfmk6HC3OBebgm7qUPt6LtwhalpKQe73E2e1erW4oqmh9p+x8C3+Wg6b17ZIV5z7OgUs4vG9U/YBemKQgk5OSgDgK/P/+Pn+eCybF1gnUm3WLwEqQUM3J/VqIdA+yr6YJZ5YkR6AyhhPfmXKV3kWa80HX+TNjlW/ROnzTQ5x5Nf+D1ZsBRE0bVGErc30nTd4lYzo5iLhcx1CWWGP1H0Cy3ogwtYowt79VV2/etPaxSVILamVAu6HU0/NeGkafJ806ZxcGTwJppOVVDC+ulKw2T3TEk9B6cbxxqKLEs1Eb5ZDCbvhJi9RZPybZJK8lOpRIaFs8Bpga04CtJsfkgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTMmjGYrRe680AdAYN8pAzhWSq3wfk6ltNwSmWH6CGc=;
 b=cBKl8tmsheOhZ6k90EizphfhYZKoIy96QmAgxnex2devo6Gi612xcbLzX5N+ePFDh3T/5YFdTxqBXPOSkolQLp1mFJCSXvUSy/6dNCkYWBJekjr24ln+/RMNWdGuMz8nScWPCnDR9J6VQO1w65B/XDCTOVlR9o+vZS4Z1hpyYnE5E8Nss7TzM5ezduI1/VuQkHTYse270w8XwAq8FLrvYoyKpXpSxz+ZQ2mtzP2vW+RhlwuQCjKCvqCc2qg1gYiNkHEXYVs4wQCxqBKMkwfb4NKAXgfnKrVJ6/tIBzCqfBDT43GZViDav4oQGdqpi6Ji0RN0ga5GjZ3hVt3XP5iLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTMmjGYrRe680AdAYN8pAzhWSq3wfk6ltNwSmWH6CGc=;
 b=t1N7a0gnFrUqa1hKDEKk/iFh48P+yJ6424FdtOKzkmHdjxtS50sbcn2G88Guii5dn9ZbX9mNeyD3zEVahB9KkJQbqWCVoyZx1/3opWLThC9LORnXZe4bVhAh9tVg7ni2OhWlVGOgpBYf5LeSp4bUunaa36+/D0HipMl12K4TFuE=
Date: Wed, 1 Sep 2021 10:41:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
Message-ID: <YS88r8O8WbIORlgT@Air-de-Roger>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
 <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
 <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
X-ClientProxiedBy: MR2P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63312824-9005-437c-dcec-08d96d2448cc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4140E1AC21A64AD5B6715B098FCD9@DM6PR03MB4140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFfjqbKFZGyFWg8oofuPY4L3tYXGAa+cnyIkF0iQjTSe1ijqXDIWW5jwjaKd7KRkXP4Su3bJZIq9X7ngKz3kz4BOEt7BCQuejHsbVcFMpHK1Ubvrp8hC5oWRQ6yYfN+tb5R/8hD9m/sx8UgBwebDsT14rpWQ++BvSIAKJH8plpRInun9SLYM2SSaE92BiRts0heJMctMSnjvAWDqVGHjvUU3KmlFjWayAdSKCtXXLD8dxPg8njmztEbtj8e30G/0rH8HunMyvZZLHvF8OWyPrZdrMYQYLKAGQ9l3m+j80rHRABUJL14vmx54GEsxXZjRsmbMqlj8mb8Jz6jog+o8W1vr06w6RmqK0CJ2hhMCpEhUmtjBBSEepxsF9Yzsma8zPeP7ape0PL1fwYlvTJ/yr1iS0lgiJrBykQNkpZ+nm65KXlIGbf6EdKtRXy5HwYQT0yXqykKbMNXd6rgRandSAJtA932lNtuCCdKept4M2AJTQVR9cfnkx67jnpgCbbiD2oufG84om2B2kvyDgQyJ6VXqsvaB0ODFTzQGZaTwdhbVx6DaSfGjb8ZBY0jLKzHYmGO1wR6Shh5QtMWnI3mUz9qIlAImfDzUxQp0vR9svhfVopUf/sbElr890KnpJGI4fiAGkWUZIUdH4YXcocbPfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(376002)(136003)(366004)(39860400002)(54906003)(6496006)(53546011)(66946007)(956004)(86362001)(66476007)(5660300002)(316002)(2906002)(4326008)(8936002)(66556008)(8676002)(33716001)(478600001)(9686003)(85182001)(6666004)(6916009)(38100700002)(186003)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEJMS0YvSWxhbUo2RVlvSytIZGd1U1d4d29LMzRFQ2xsNE1QNTFTdXI0MFhN?=
 =?utf-8?B?MUMvak10ZWhxdktGR004VlFuY2UvYWlvS04xb1loYW5wWFhaMkRyd3I0U3Z0?=
 =?utf-8?B?NW84VVZsZFdESGR2ZlpPZDZmWFdrLzBPK3ZqNDl3alJCbWVrblp2SHJvb0dV?=
 =?utf-8?B?ZmtNZUwrV2pDSzFvN04rU2oxTjJDUDNKb3FDLys4YkE4bExQcmwwRURONVBX?=
 =?utf-8?B?TlQ1aUI5NDVGcUU3UGNVT0g3ZjFiUTlLQ1gwR2FHR1BNQ2pqbVdaRVl3dEF5?=
 =?utf-8?B?UU9ETjljUWpwZTAwM2llUWVpbnBDRG9hVDhUVk5oUjA4RjRwRHorTHlRMVAy?=
 =?utf-8?B?MzVPUXg4SVNEMHBjNWEyNUpmT1lDckhBdEMxQzZLVGpWN1hwak9GZzZlSWRm?=
 =?utf-8?B?TzNVUXdJL0xhTUg2R2h3a1VWODFydHI0NGVYcnZSV1Z5ak5rbWpORFJUeHd5?=
 =?utf-8?B?L2lpa2NmMjFzb1dqc2kvVUtuT0V4QXNuYisrZVkrVG92dnlzZ09XOTdXMkxP?=
 =?utf-8?B?aVNYejY2eWk3UGpydXBYL2NMOG5tUzEvZlhsUE9jQS96OWRBRzhlNDB6OXkv?=
 =?utf-8?B?RE81Zm9HdVc5TDgxMVZGQnl1aXl0L09Cb0pRWUxYZFYxVkNyMDRCYUZ6MW9r?=
 =?utf-8?B?OWMrZmxSbDVSM1ZNVC9KaDRjNVBmL3hpUWtuWVFXdU9YWDJjT2JRTUtPY2g2?=
 =?utf-8?B?R1dVZ0o2MkhmZ2djRThKZzkxYTJCWWFiWlpkekRYUFFoYmNpKzRjLzZUdUdU?=
 =?utf-8?B?ZnAvcSttSUpaeHB0L2x0SGlOelpmK1RHTTZnOVNFVy94dm0rSnBjZHdwSjRz?=
 =?utf-8?B?eU85LzJJRzFyOGNNYWdtS2paTWxBVWNyaEZSZDF1M0FyZWtiK09LZmc2OXA5?=
 =?utf-8?B?eUdvZHZodXhXdlA2dmEyMUppU1F5dmo5TU9TT1d4TytDSy9mamhzVmtBek5C?=
 =?utf-8?B?bW1GZkZTNDduSHdRMjg4cnVnNnErR1dFbFpIdnJsOENZb090OEZvaXVEWWFv?=
 =?utf-8?B?c3BCaFNKUjNPL3czSDBZMWhyenhWRkdrcEYrbUlya2U1ZlhOdVJUOGFqMzJL?=
 =?utf-8?B?R0xYeVk0SE1xWk1QZEcyNjVZVit2NjhRNmxPUVVPUnJ2S2lYajlQazhBV01v?=
 =?utf-8?B?S3ZTdHc2MnlHL2NYeGQvTXF4RmR2SmhPSGdvMHBLbTc4M3ZtSGpQcEQyaVcw?=
 =?utf-8?B?RUxVdmJWbHFtR25UZVhjdFQ2bGplRXZmemFmV2ZiOGZ6UExZRXNuSStiQ0FH?=
 =?utf-8?B?Z1V6enR0ZWJ4M1MrN1g4ck8wRVN4Q3l3eXpHaDM4c3N4Q0FEOWRzTW50TnlT?=
 =?utf-8?B?ejB0YkFqaEc1M01idTBlb3VUS0pTdGN2WnIzNG93ZDh0a0ltR1JTRzYwd3NZ?=
 =?utf-8?B?ZjF2SHc3S1NUSk1leWRGaEoxSkErNEREWnpKZnI0VWZLUnArTW9vcmk5RFNp?=
 =?utf-8?B?SDl3MysySDRCblF4bENjTVdoYnh3cHc0eGVZempTRUZCOU5ENkxNMUQwNnVT?=
 =?utf-8?B?QnYvdTdkR2srd2lVOHZoQ29yOGFwTlRHVzhnTUhMc0NmczJOdXFiZk8vZllE?=
 =?utf-8?B?Z1hLN0QyTUJ5STJONGhBV2xIYmZuR1lQMDU0ODBsMFlJM3pqOUVwdGRMTlgx?=
 =?utf-8?B?SmVnUFF5ZXQ3R1Y3NjRJWStZRDkvc2pYbDRkcXFPNHBqb3VEbURxOVN4Q0FV?=
 =?utf-8?B?SURlVExHTGRmWXp2cE1iQzM4SkdCUDhiTjNTK2VtOHVISzlNZWVkUXJuVkdt?=
 =?utf-8?Q?OIgU4KQuYmmDgcQtFARgC+Gj0os0XuoYkk0OYtj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63312824-9005-437c-dcec-08d96d2448cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:41:25.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oox+/mumLfWMOabDQxXyBsGi01HD9fSazdkDdhSAPgrZNKIpwTssb8c2SdFaMOnp5vFrw/nWMbs9X8aVf+wzpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4140
X-OriginatorOrg: citrix.com

On Tue, Aug 31, 2021 at 03:14:06PM +0200, Jan Beulich wrote:

Sorry for the delay, and likely not being of much help right now.

> On 31.08.2021 15:02, Andrew Cooper wrote:
> > On 30/08/2021 14:02, Jan Beulich wrote:
> >> One of the changes comprising the fixes for XSA-378 disallows replacing
> >> MMIO mappings by unintended (for this purpose) code paths.
> > 
> > I'd drop the brackets.  All it does is confuse the sentence.
> > 
> >>  This means we
> >> need to be more careful about the mappings put in place in this range -
> >> mappings should be created exactly once:
> >> - iommu_hwdom_init() comes first; it should avoid the first Mb,
> >> - pvh_populate_p2m() should insert identity mappings only into ranges
> >>   not populated as RAM,
> >> - pvh_setup_acpi() should again avoid the first Mb, which was already
> >>   dealt with at that point.
> > 
> > This really is a mess.  It also seems very fragile.
> 
> So it seems to me.
> 
> > Why is iommu_hwdom_init() separate in the first place?  It only does
> > mappings up to 4G in the first place, and with this change, it is now
> > [1M-4G)
> 
> I guess we'll want to wait for Roger to return to shed some light on
> this.

iommu_hwdom_init should cover from [0, max_pdx], or 4G if max_pdx is
below that.

IIRC first PVH dom0 implementations used to have a behavior more
similar to PV in iommu_hwdom_init, as they would get almost everything
below 4GB that's not RAM identity mapped in the (IOMMU) page tables.

PVH dom0 has since diverged, and now iommu_hwdom_init just identity
maps reserved regions. We could likely move this somewhere else, but
given it's still shared with PV dom0 (by using the same command line
option, dom0-iommu=map-reserved) I think it would just make option
handling more confusing.

One way to simplify things would be to rely on the hardware provided
memory map to correctly have the regions in the low 1M marked as
reserved, so that iommu_hwdom_init would identity map them. Then we
would just need a bit of special handling to duplicate the data in RAM
regions for the low 1M but we could avoid a lot of complexity.  This
however requires trusting the hardware is not missing required regions
in the low 1M.

Another option might be to slightly modify hwdom_iommu_map so that for
PVH it returns true for all non-RAM regions in the low 1M. That would
avoid having to add another loop in pvh_populate_p2m to map those.

Thanks, Roger.

