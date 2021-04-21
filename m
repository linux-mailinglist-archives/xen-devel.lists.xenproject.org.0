Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB8B366E03
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114643.218507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDjV-00022z-4t; Wed, 21 Apr 2021 14:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114643.218507; Wed, 21 Apr 2021 14:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDjV-00022Z-1Q; Wed, 21 Apr 2021 14:21:37 +0000
Received: by outflank-mailman (input) for mailman id 114643;
 Wed, 21 Apr 2021 14:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZDjT-00022R-0Z
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:21:35 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 569a3e72-618b-4ac8-80cb-6f3bc250c746;
 Wed, 21 Apr 2021 14:21:34 +0000 (UTC)
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
X-Inumbo-ID: 569a3e72-618b-4ac8-80cb-6f3bc250c746
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619014894;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sX1CMihl/T72pXfcjH70CQgmZN3vdgf+N711aQbnS3A=;
  b=HomdwS6fp+pKf8nNDmYietjZSCjKDFZvrzBTSUWQHuFp5ZKJSTesgFuY
   jeACNK5E077E523dlJfRo+Gsria2XUhLz6yFSI24Ma09gi0vpn5g9/6/Z
   S1iErhypq+ynGTCYO7/dsRgTAQMExbahmK70HUltc3rs41HzFHM/QysAl
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: S0ZVkX7sAUrZuJdblNpPb2NTH1WLzX8cHcZEhv2y0+BiLnZI+XE8aWO3b7EfCHivZ+ZOzA28Sd
 lIVzRHQqL8JF5VvqvWMrxFbmN9LXW69uJGbflD2Gqm0I2nm8Lg2EXkR+K2MROPqfW7Kyt4VLZR
 BYW9rR0LWisppakIVeYx2VJmhN1EcLpTBnGWtI8WYSoiBSVa4E8jw1UJcVi8LeB2LEfjx7moHO
 WIcExqPv4jnANM6slHjisZAx/jEwabMOqRiBoXbXgyJ2WYqeEpH8oOGlH9YuS7WQ56e746gzrg
 ZVU=
X-SBRS: 5.2
X-MesageID: 42091057
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0+2x9Kp0FZZ/remUWRczDKIaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.82,240,1613451600"; 
   d="scan'208";a="42091057"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FktSm/H+INlWSPIWaqSqVrW/ZrAGrcqM/Y3p2CrKbIg8u62V75UGxsswIWz2iVkhKXLLgfYFvpJuZghpPSVyjO9j4VM3CIruqLsfsb0baf6bC7oSx59hEPv6hhuUQggGRYyXwKOnVHbCKXrgqd5a97593uQ9q3TZTMm427oqz6Wnua1FsNnBp6m/Y9zEN+5Bx5Tb2yTvnySw1BLLus1f4Nv2iyH8ITyCqxLOj0244dYmMur3DX9a9fJLUY8cbe0V3DWMWATZ4p/vvrFQSixAamrJeAiiTurn6DvRfbGhaLdsgFBH1mzBDyibzqk1atuqi/zirQwErM9EQFUbNkBSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNMhF7PHwW8p7LfJN7/WLbLO09GmNA9ENeeoH4A24w=;
 b=hNTyos4cpLMEHqM3JqZmJ0RZwbuznynpvN7Fp+/P7Gyo9KfBMHuf0YgDtE79MadSKp6mRWiK7zeGhVhkxpd5RR1DdFLpu5OAANIAe9paz8nMxx4fz14Oy6HlpTwZKNIXxOggttouWn4FJB5APkzdFvBdljAztWlyHSu+QbsL2ULRplZB1cFGhIIBRUVnKuMLdNTtAmQ2yThRjwiK78eBiGbO07oPa7ONKUX2C8kW6lHvofOxqaGKpmsKNQcrzyx27/lXhIJNSW9OYSggx3wFjNfm627dkODf99iRdIpOo8pxXNV2/0FcYxdKB5Tlq8CEbIfIWpLMdEqYNga6SX5q4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNMhF7PHwW8p7LfJN7/WLbLO09GmNA9ENeeoH4A24w=;
 b=i48OCqZt3TYei7uROgTsVEvR4fs9FX/yqsqys2n29f1k9jMW9S38hr4zVZD6hmD3DdWfVLTezJVOoXt0OMO3kRquHbBgrv8XdwDt3leWaBAfUMGNNi6AdyqKWiGV0c21dd6ZxUUsy+iluxLxLV7foMGA0JcHhA5uip0LBPBeX6E=
Date: Wed, 21 Apr 2021 16:21:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/8] x86/EFI: program headers are an ELF concept
Message-ID: <YIA046qIRcLsiOPY@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <017478f9-76d2-4dc4-de93-b662c4552968@suse.com>
 <YH/sLn+g/7wsZUDy@Air-de-Roger>
 <69abcc03-7ffc-10e2-0de3-26c6c84a6d26@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69abcc03-7ffc-10e2-0de3-26c6c84a6d26@suse.com>
X-ClientProxiedBy: MR2P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3409f940-6b10-4968-662d-08d904d0c193
X-MS-TrafficTypeDiagnostic: DM6PR03MB4540:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB454065B76851B08A592A243C8F479@DM6PR03MB4540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwkjC+R8/9OHwAqLCDFYyY7jqYZTHOWPJL4GgDEfQpIi97JW1Fc/b/+74n83gWkTmmVZT2ahQz/rtzkQhWPI4pKVDBk5pucPAxtznf9+kiv/2IZlTveXE6LX66NQmwgNYw3FTmND5KgHjzUut/26nVbgJhGQpthgNdr2avRqCzv2cr1xDxlGsUeuzHisIN+Dxiwk5U8ZjECrOCOxIL7FJTLOznx8nMDCATfL+an1H7gCtiZZSgkA5+bwPWrig6HyyKv3K1Fnl7F6z/N+yh9MeYzj9F65eZTDHs/jjdMm7LNt/ubK/AkCECzu9H6YM8iQH4YrXVKJUpK5d/GqT7V2dWrE04RyctaNFVyMvs9WExcjl4dSeUuKEiwngk5p6KBvXmJmEk0EsFIZ/GJaFxv6YEaZM1GOB/BTNH7YMYk/aPYqRnJWyJZIAo4mW4Yx/02L+CefsHudwq2T1RCSVcF4qp4Zz2ln88DjEqu2rZ9t/XCNe84eI58GF+zfERC9hYN2PhTtK9Y65KxNO336o1fTeyZXDStunOP8+kqBHXCmhv4SAqi4ejOS2A5sklh2XZcb8v8+urBHj5VGhkguV479FnMxVCn+RcUN2CHGIx4P9NU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(366004)(136003)(396003)(39860400002)(54906003)(6486002)(316002)(6666004)(9686003)(8936002)(2906002)(478600001)(5660300002)(4326008)(956004)(6916009)(26005)(83380400001)(16526019)(6496006)(85182001)(66556008)(66476007)(186003)(66946007)(38100700002)(86362001)(53546011)(8676002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGplRDNjSXBMTWlHN1hQbi9TMjAybjVRVEJpck1jeHdxWXdDSk42ZHhocVhr?=
 =?utf-8?B?ejNLc29RSCtQZnZNTjl2K08ydndWY25UZkNqT0pSeUc2UFRVNllwUHR1c0Yw?=
 =?utf-8?B?OXZia0RuV2ZNd2VNaTBBdUMybmVQZlU5L1BhdDR0cGY0SzZYbExNTFdqcHYx?=
 =?utf-8?B?RkVycXpIdzJURmdka3VwbGw2dllpYXRuWGp6ODRmb0dJdFAvaUlXUjhXYUhj?=
 =?utf-8?B?cm81blVybU5QTk01REVsOWM1MjlGUlNUbzZ0Q2dGc0dDS2puMGNSL0tacDFO?=
 =?utf-8?B?a0R0M29SeWdleUd1cm5nNTNZZlgvRmJDL3dWeFIvVlBrbGpMWDhKWVl2ZU1X?=
 =?utf-8?B?cEVoOUNBOGhBYncvYmNwcjNGQlp0RzNla0ZESEpmaXdSc1Q5ckowU29NSm4v?=
 =?utf-8?B?SzFvOHI3WjlGWFJVN0JFUHVKclFTVm1jbjA2dEJYWW1GUi9qT2x6N1Y2SWk1?=
 =?utf-8?B?eFVjbUxJRTZ0ZEtXNVdnUmVmSk5zR2FCNmNhODA0N2Y5Y0oyb3QwSEErZFhI?=
 =?utf-8?B?VGlZbTFXTFhmeStwbC8zZ0NJOUc0SjdwcW80d1ZrUzlUSTBkb3VDbTc4YWI2?=
 =?utf-8?B?eHJDajloaHArbDdpT1B1cVAyWGJMeThnT3p3bXNNdWlFeXVUcmRCOGVKTit4?=
 =?utf-8?B?S2xMaHVqc1pSdnN3WWcyQnIxQjRablVXclVVcDFEc041Vzhpb1h5emhuc2ly?=
 =?utf-8?B?aEpyTlRrUWU4MGYrcUhodFIvaUltd2xkMXVINDdKWjQwejhzQWNoSGlkVkpF?=
 =?utf-8?B?R201dlU3bU0rVGxHdG51V2ttb1FaaXRXc2ZMVlVCdnUzRVIrbjA3SHRsa2pF?=
 =?utf-8?B?L0trWE9KMnR3K3JPV2xpYWJHL2pGQUx5ejBvVCsySWlORXlnV0pIVE9WcHBx?=
 =?utf-8?B?b3UzczlrblppZ25mYVRHaHB0cVovUmYwRDNzRThRaDZnKy92TlpLOWVsTHVX?=
 =?utf-8?B?a1BhaUZMTFVHckk5WEZySUxWM3Y2YkNLTTRlQkRTUHZxSkk1WGJoeHFQcFEv?=
 =?utf-8?B?VWp5L0RHOTlVWGNvemZLemVYbitnZUVMemhvc0RNMHk5ZERRckxjbTJNa0VU?=
 =?utf-8?B?bUIxeWJhZmdYT1lXYmpaSnBxUHRUd1VCNnZHYWtQZmVvZUMvTk5CWjJFMzgz?=
 =?utf-8?B?ZHczUnlQRjQrTlBEa0NiN0d2TnZLSDRlRTJBdnNZS2JwaHBCeXRFWE5tV3JR?=
 =?utf-8?B?L1RMSjRZaXRmYnRmN08vUk85S0VqdXo3NDhveHpmVWZnTGRXZkl6azlaSEpa?=
 =?utf-8?B?YjdsK0dsSG43MHZ3MitweDBXak55bjIrWVR1S3RtRmpQUXNNalp0a0QyUGFp?=
 =?utf-8?B?OGZ2RWVFM3dYVmp5WWxLeGlWZkJuYVFqSUZsMnlGNURJUWszQ0pVamRtWUZS?=
 =?utf-8?B?S3RMUE9RTitBeU96c3JzVUZ0dnRaaWw0d04yVi9PRTdJRzhzYXpibEVSQThi?=
 =?utf-8?B?U2doYmorNDQ3Sjl0QWxsNWhsYVpJU3kwQVBTTFl2ZjVPelVNdXhsZFVPYXNQ?=
 =?utf-8?B?MUJvS1h6UkF5TGZQNkFzM3RhQ0kwR0tBLzBhTXZFNCtrQzFvemJoMFFzeGpR?=
 =?utf-8?B?c0pvMGhiaktaM3Z4elNpM2oxOEF6S3ptL05RRCtybkw1c1RTcFVKVHZ3dG9L?=
 =?utf-8?B?VG0wNk50OE45MXlsdDlnNTVlQ29CdVJoTHF4ellBWU5nbUtOSWVxejd3eEVN?=
 =?utf-8?B?bWVDTWZOMDFTWXoyb2habjdxc1I5OUlpSUtYUmpPcTg5L012T2YyUG9HUzcx?=
 =?utf-8?Q?AMABk6AMK7eP0Fa9isRlg7KJa+DIxlUiGoiyTV5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3409f940-6b10-4968-662d-08d904d0c193
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 14:21:29.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRgjhToM0pAV0wDzVEjYHSXfQfZNWFmdmGjxBBsWEPzcaaKuGy2O0CRrI3IsvO7/55L5WEa1Aw7dbyuEZWeyQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4540
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 12:36:16PM +0200, Jan Beulich wrote:
> On 21.04.2021 11:11, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 11:45:09AM +0200, Jan Beulich wrote:
> >> While they apparently do no harm when building xen.efi, their use is
> >> potentially misleading. Conditionalize their use to be for just the ELF
> >> binary we produce.
> >>
> >> No change to the resulting binaries.
> > 
> > The GNU Linker manual notes that program headers would be ignored when
> > not generating an ELF file, so I'm not sure it's worth us adding more
> > churn to the linker script to hide something that's already ignored by
> > ld already.
> > 
> > Maybe adding a comment noting program headers are ignored when not
> > generating an ELF output would be enough?
> 
> Maybe, but I'd prefer this to be explicit, and I'd prefer for efi.lds
> to not have any PE-unrelated baggage. The churn by this patch isn't
> all this significant, is it? In fact in two cases it actually deletes
> meaningless stuff.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I would prefer if the new PHDR macro was used for all program headers
directives for consistency though.

Thanks, Roger.

