Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C562E97C1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61284.107693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRHx-0002Hv-IS; Mon, 04 Jan 2021 14:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61284.107693; Mon, 04 Jan 2021 14:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRHx-0002HW-FD; Mon, 04 Jan 2021 14:56:53 +0000
Received: by outflank-mailman (input) for mailman id 61284;
 Mon, 04 Jan 2021 14:56:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwRHv-0002HR-NX
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:56:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c03d387e-1bec-49ec-94a0-93ecc139f4f5;
 Mon, 04 Jan 2021 14:56:50 +0000 (UTC)
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
X-Inumbo-ID: c03d387e-1bec-49ec-94a0-93ecc139f4f5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609772210;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kLmNVsxs09uIBbJ26ouP/AblOTlGCEc4i+9wDry82KU=;
  b=huYaTz5bGS8L2y222uApRZu43QAYpVMblIaQGwhjHoXGFdzaRWpogN3G
   0qfC8ZfQ5P6orkHcur7uQXmoSzYzoLDT9tW3iExpXJTiz8SN8YiU3Y5nz
   T0uZtGwZaCqaYtpwBh29URA4P7Ay4rBMnqyBG/3hjE1CWhGNzvexanKTE
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2dliIfz8kgL1ZypgNMbLSWlENo/obU4ymTmzeH8PyjiamdedY4W8WYtCshoHmZNg9u9UVA2g8L
 zzZe0biE7DhaSOx0xL89I1ZdbKDSWdI2fqRguq5+g1yDYSri9iOAZErtXketb2qVsJoM8z3ad0
 Pmyu/bedmoMF5GEYb1D1k8XW+yDiblJNJ0+wF86QKGWqQ4up61Rold8MVvsJtcOWOiMTwcEc4H
 WbF2uFCMgzxwxw+IpG8O2+QrykcgeR8h2NdOrl0FtPiMoMFBneyU5MIbJ3yaQzjY9SClWCgtpC
 Gvs=
X-SBRS: 5.2
X-MesageID: 34349054
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34349054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm+atFD9RHgRX80I9JrIiRkxDotpyaNzZAV8/QkRG343Vk1PlCYGumeCXJ+2i3Lr3sKS8mAPmhD+C6YuNsl4DLnqTavgZm56Esx23hx62JFxiFzO3KjhkBLrWuy5PRLv4IfcVDd5teh3sOuP1FzsE9hN6ke7wV4e61NiMxr+FXA3maoqM5f4YmOgM+Cel1QfX2AEZQLh54wZ6lWY8lvJCm0sCue91uL35MwzcRFz6e2YwIGDjIkjBLN2ujZ0CDfRZfSQOemQesebsbCBwQUcMiUN/IKbz+CK778iJDRnfFZ5Qh7dh5jzsXWYgmZTTYvtrErpgH7f28CMVx6spLsbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uck64sDDJvtXANtk7yZlrc+V5UynT/cxC7P43X4SiBo=;
 b=m+s31lnrR5cJGcXHT9RC6PB5ddXG00Xbgxo8XU4MK8f/1OQ+6eL846yrMLww8BeInB/NYALPE4Xydz7c2XyUygCmmWDkLv3xAyrd7xA7bkN2thMaGvLYk4iNAM/I981uC/HHn4xqR7dTMlfMKTsO84vUriDkNuaO+aQgr8OnG9p0vlXuXVG37haJ17gYTEkBPF1zZw5CmvGDIa3OrpXbi3e7wRLkYOs3VBMRaB7cm1WpKZxIZyZlukIs1/rl42JbCs6L1tqYJGZh1EMwG2lQfgUO6RUjaYCpoP3AH4wnk4pdTpdT+uOOvmX1x47mqp1OfKI9+gVAeXXs0Nhehe4O+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uck64sDDJvtXANtk7yZlrc+V5UynT/cxC7P43X4SiBo=;
 b=tY2G1eDesRofhVGEwjWIaRNBcqmeRrf9TDnt0PZs7sLaNKg1nKKdI8tX6Hw/OtwPB1z6ZaXXQg32pAB6M4iW2lPFqFf9DlwlcJ4low0PszExIu91wNhFdVHQg+39vKkX3tRkPYH2vnYyHrqNxBgStRV+iRSgZrxkwejuogrwPSo=
Date: Mon, 4 Jan 2021 15:56:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
Message-ID: <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
 <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
 <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
X-ClientProxiedBy: MR2P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 950fa38e-457d-4494-1d8a-08d8b0c0f585
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB296927C3A9FAC26AACD48E478FD20@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKjlBMZLtsud3eKKAz9Zt8g1vT4Q9jr/suJLsveqiF74ScVkLsB74ChXVUQXyi7fwqnzpXAiKYZJW1L3JQ6d3490Fywup3QQmmu/FZJVAKcBMo2gXjda/3po6BriN32I7jtX3H0v2lonvog7Br2aIYlr6s4/CWXerJvlbfrTOYT+J6n93uLRmT5cuQh4a8nvsyuUV6DyIv2DnF61FZHE5MHbgWLV4fGD2vYDXDFrhBaxya0h1L6sQ68jndMIbhwb3IcFFQCleJ6L3AzKxOp5PFQX4NRvalkmlGvXaRJEnU6MdRkf5cYXn02rsbL7srqc4gUI5sd1tXLSxORhFwJAxXMBlxU3Qmfsmy9QOIseT1+0ma+jpplscjQHdF0RffSYTtcvoj1YsUySm71VnviCTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(16526019)(186003)(6666004)(1076003)(26005)(956004)(2906002)(5660300002)(6486002)(83380400001)(498600001)(86362001)(33716001)(8936002)(54906003)(66476007)(66556008)(53546011)(6916009)(66946007)(8676002)(9686003)(4326008)(6496006)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ym1hS1B5ak1hN3dsV09DaFQ0a0hKRXFhMU1IeWlNVmRtKzcvazBBM2tDL3d2?=
 =?utf-8?B?YlpzVnBtcytLOXh2aDZQVXFLTXg1M2lrQ3BKelF6REtoRmwxaWlOTjlNQlM0?=
 =?utf-8?B?dVJvU0ptZGpJaEdqYk91bFFBNWY4RVBjMFB0MnBZY3ZlckZ3NkdVTWRhaTNK?=
 =?utf-8?B?dGQ1SVBqbXl6cFVVeUdvOTZ0ejl4OWVCbHBoaGxmbkU4dmlLWVBjNjhybGNh?=
 =?utf-8?B?ZlFTTW5HamYxQWVhUWYrVU9Zc1Bva2dnK29qWmhhTllqdk05d3J4Qk90M3Jx?=
 =?utf-8?B?LzFmNkZ4aUFVV2w2bENxSkJ5TklCOWxQbFJ2VDhEM0UveHBoU3lVcnB0N0sr?=
 =?utf-8?B?WVBUMmFpTlB2Mlc4b1ZNMytLam02UnNKK3BhS0FmTTAwSCtMRXE0eFpYb2NS?=
 =?utf-8?B?R2Y2aTdabDZWWWlKRDFWV1c4c3ZiUGRkQnpLUC9wWmtGdzQ0UGc1ZC9lb2FR?=
 =?utf-8?B?bVhjT0R4TlBqVTB3MGtWMHpIcDdjRjE0eG1INHBlZ2diaHoxeXF1Q21ESkFM?=
 =?utf-8?B?UzhzQTNFT3dNSmo5Q3lwTGk1OHl0L2FGYU5HVUh0c1ZXT0hOcDA0SFMyM1Jz?=
 =?utf-8?B?ZzNwNFZmRzJKMjAxMTNZTWx1MHFVcVdBNmRPS2NZM0wvWjF6dFRValNhamZS?=
 =?utf-8?B?TlNYZHZ1V2lEMG00R1B4NVhZUDBuMnZEaElPelpWWHVXb1Z1Y2EvS21pNWtk?=
 =?utf-8?B?dFByNUVzWnhBNUt0K0NQNldWQ0tTOVZZOXhTc0UrNk9vK0pTY0JXalVEaldF?=
 =?utf-8?B?bllYTy91YTd4RklGSG54UCtFeDRxMnRGWG9Yd1lVK2o1L1lTcGRPbWlXODVw?=
 =?utf-8?B?SVVYN1d4RlI3R2s3V2tRTmtpWXozWklRbUxhZzFhYmMrblFTWHp6RU9TY0Zs?=
 =?utf-8?B?aUx0dDBqTG9lM280RFFlWGc1OFB5SzFUbGc3NnlMYS8rbjJyRGZEa1RpUDBC?=
 =?utf-8?B?c3VLRS9nbUlnREZCc0lXaEo5cmVmM2NldTdPUEFEWDY1Q3JlaWtkRkJESVRr?=
 =?utf-8?B?UG9icC9JZWJBNDkwTnNFMzBnNFROR0RiK3VLR2YwWDFqZDdSUUhZNk8xa3Vr?=
 =?utf-8?B?a0c0Z05PSXh0L25VSkxMdHFoV0ZlcGQrUTNWNFhqb1BwZngvNmVmRjRuMDg0?=
 =?utf-8?B?YmhuaEdwZXJqMGUyM0hoaXhDMVpRTnNuZXZGbkZVNTNXWkx1Skw3b3pOMHNh?=
 =?utf-8?B?bGhFTXl2RHM4bU9uOGhJOU1PeXVMSm1pYklUdis0T2xJSnpoV2RtTmk2RDhX?=
 =?utf-8?B?TGZoa3ZwTW5Nd1Z6NzNjR1JJeS9TdlVGN2ZHSGJCN0NoZS9nRGdyelQwS0Ev?=
 =?utf-8?Q?08EWTw9kuvbMACZfCUZAwInYmi9saaOaKu?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 14:56:47.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 950fa38e-457d-4494-1d8a-08d8b0c0f585
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHVd72iX7k7WqldmFx9x+YW6KAU/dKBaQMTUF2UBBEo/BHgZwvPgPh2hMNGaMZaYpWNKU+r1LrMfHU+50KrZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 02:43:52PM +0100, Jan Beulich wrote:
> On 28.12.2020 11:54, Roger Pau Monné wrote:
> > On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
> >> Now that the IOMMU for guests can't be enabled "on demand" anymore,
> >> there's also no reason to expose the related CPUID bit "just in case".
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > I'm not sure this is helpful from a guest PoV.
> > 
> > How does the guest know whether it has pass through devices, and thus
> > whether it needs to check if this flag is present or not in order to
> > safely pass foreign mapped pages (or grants) to the underlying devices?
> > 
> > Ie: prior to this change I would just check whether the flag is
> > present in CPUID to know whether FreeBSD needs to use a bounce buffer
> > in blkback and netback when running as a domU. If this is now
> > conditionally set only when the IOMMU is enabled for the guest I
> > also need to figure a way to know whether the domU has any passed
> > through device or not, which doesn't seem trivial.
> 
> I'm afraid I don't understand your concern and/or description of
> the scenario. Prior to the change, the bit was set unconditionally.
> To me, _that_ was making the bit useless - no point in checking
> something which is always set anyway (leaving aside old Xen
> versions).

This bit was used to differentiate between versions of Xen that don't
create IOMMU mappings for grants/foreign maps (and so are broken) vs
versions of Xen that do create such mappings. If the bit is not set
HVM domains need a bounce buffer in blkback/netback in order to avoid
sending grants to devices.

Now it's my understand that with this change sometimes the bit might
not be set not because we are running on an unfixed Xen version, but
because there's no IOMMU assigned to the domain, so the guest will
fallback to use a bounce buffer.

Thanks, Roger.

