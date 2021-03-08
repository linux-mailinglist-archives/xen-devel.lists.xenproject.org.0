Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1034C330E87
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94885.178840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF9D-000757-Pd; Mon, 08 Mar 2021 12:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94885.178840; Mon, 08 Mar 2021 12:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF9D-00074f-ML; Mon, 08 Mar 2021 12:38:07 +0000
Received: by outflank-mailman (input) for mailman id 94885;
 Mon, 08 Mar 2021 12:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSVd=IG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJF21-0004nW-DP
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:30:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dac5c8bf-ec30-4ec5-bf3b-85d414fba7d8;
 Mon, 08 Mar 2021 12:30:20 +0000 (UTC)
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
X-Inumbo-ID: dac5c8bf-ec30-4ec5-bf3b-85d414fba7d8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615206620;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TayP8bEaFukGDPPCgGjSihYBohwJDVKOk1AGxYWOmrs=;
  b=YsBQumrwPwjgRsqYR4WnlFM3gq/GsUoqExQVNi8a1Ga2D8/MZoBCcEzB
   fOn7/eXxOMuFEK0/YuiK3JJFa3uEFIUDgwILUlp4hS6yihmykkKqj0WLJ
   d1D8YAMRiMl/H0vv959Tdi3okDacYNTrnv5+xmhw5Ptp1/8E7gJtR+iIY
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZF5Iyk1oXfvIbR+7liz3AQ6EtMgyTZmbc596MBcD9lEXwIHvc6AL6VluB3GrdxnN1KfdvLuNgR
 c5+Hd/9dPzsPMIp/bEk1J/At4Bnmxapp/E5R/GTg02lxq4roYjhPZWc1nxjSN1VX33mcAxdilO
 sQkZ3d8qlyEjJFr3FGrXqZqqGWKXIDZBOy/hcMdLIZXiz8/HWpOAm4CKGYplePlEZLwEZL8MrC
 +ho7MkXSulkJyfpLvIa8ocZOwo2XI0624kTRGb+QkrT40lJ57RnHcbaGJJWoneUm5FPOivEG+F
 rZM=
X-SBRS: 5.2
X-MesageID: 40172049
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="40172049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN1zMsWWMZSGGILUzpjJwpOcI4TeyHbxYdt9zSE+tf5lyXQrw1lBxIbYtlsOrW1Tk4zqPkLGenqca3J3PwiM4AR+6nnL2i19UyOQVVcrZqsSPJK1oZr1MJrYA+KL4ki16VexX1wqSXhc9CP1eU8Sr86iORupHUNsNh7rM6wuIIytW33UKHzAx2S85jXcK7k6ufQiryS3TIMtWbdAwrWTE9NC8D9qsjB6AWsTpxOGlD1YHnRn88KdLzNv/gdtH6A4o/F2ua21NIuaQ3eRP4qMx662cTepLswJwmXhSz2IU3aG6DEoYkRj3Qg2NE7aDXiGfOkjWxG25eHoH3al+VFPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J16x54dZKc6ZSeGa4nuayG8cy78C5+Z71zHErQSR22M=;
 b=NFMQsMOx8PSXFUDifjupED6t98aZb2O+YiqtFZnkigaCHjPhW4Gpk2hhH7Qy3GQKnvpjjfHNXlcwuiGhjXmDsZAFuTUOfirWekZGpLv3NgNd9AkbtExxzL9vuj7o6ldToM7mypmqtolJAzkX5IMmsVEVAojo9qmH+rS3WrbRwk1DZCZ+7XuKUEgw8jc5f2fSr5f04q7095PyoUmMuxusjqqdQrkrJ1Y7sMZZKbyGc5i04J+uKFvzpAaOEhUpNYHit3D4wPgAez8tTs5pPW0noH/snJ81qVXyfr7EHAC5s5nQXO4N6xjijijn5Vq7sjUNAz3zbW5Mr17uzf9jVmfaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J16x54dZKc6ZSeGa4nuayG8cy78C5+Z71zHErQSR22M=;
 b=B/fg4oB+ZpLRkoo7XSwLvdaf7JMZMrF2kIckT3athu+ajPwetCbuypoCLKxhbFNmpIc+fwhz0kAv10wK3vRCJbFLd1HD+ZE5zLIDX9Z1OcNakJE5Y0q4kjrEZi/YCyTyfu4KNwK9oWEMt5ZwiXgrKOb+FMQECEm/2N9U7vBdo9s=
Date: Mon, 8 Mar 2021 13:29:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
Message-ID: <YEYYuyhnH1B0k+IV@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
 <YEYMgQ+e5A9/jqQE@Air-de-Roger>
 <c5dd3650-b8cf-ba4c-70ee-f0dd09a1ea09@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5dd3650-b8cf-ba4c-70ee-f0dd09a1ea09@suse.com>
X-ClientProxiedBy: AM5PR0701CA0017.eurprd07.prod.outlook.com
 (2603:10a6:203:51::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 743f8c3d-d546-4a85-e40b-08d8e22ddfe8
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB367325B6AFF08D72D8A77C2C8F939@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBW+rUsowXjNyw8Ig4M71LCP6x0j4LYF0GTu26h1RrK9nV82kUrrEHilbPpTinIm2pkf3PfK+Yl1NpM70XrZdQVP7V+Rui5A9OhcqYIV/cSRjgPjj+dfP6jUKqHC8QKlnl4hj1+2aOcujrKealIKQdYgOWwCuc4G+eTdBJvSBSkczUHT4X9rp9h8QWYOPRu5cRuSI3B/oi5phs/8hIadA6+9V6uSS7DpMKNw+HMM6UWAr2gFyT7AQISB2ZkWsy2leguMd818B7GSmtakcnxCkyQ8UpsTApDklqIOOyhZu3rN8f+LBpKttrw/LQE3ZA8Z9yZ1oD87Z3MWllB+xLn7LjplT2oMZ/itD1aPVfoH7m/wwYvDReASO/okq1wFpjD2T4W9wpJaPDJwIIbryzN5FapDwFrooaxQwcuJTIy4RtgKAt6HfW4C9b6JJvDUvPLRjAkV1gdbslF1qZAx30CD8ZxtQmRKV6NJC9YxtCQZm5VawcqyQRUE2Cq0qw8CWdH2sbos1DqNXSsuQ6rTMqat/aadWxNqRRLH1wmCwIvvkR6l8eYJFO0JbijZi/FBywN8Rl56AWsScJpypqk2MaqTEVO8thF5mLCxqOu2Wmj0zFBUD7KD8y28X6fFvIhMP2gmNAxXfpG3OPJ5mWXCfuficQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(6496006)(2906002)(83380400001)(8936002)(66476007)(66946007)(66556008)(53546011)(8676002)(5660300002)(4326008)(6916009)(478600001)(956004)(26005)(16526019)(85182001)(186003)(966005)(54906003)(316002)(86362001)(33716001)(9686003)(6486002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Yk54RTVvSitlODJDREZUTnNRb2JMWDg5dFVoQmJXTUZXK1MxSHkzMWJycThP?=
 =?utf-8?B?UDBGVnkvRDhkWStMNlNlUjZSTitpM05nTG5KaXQ0S0IwZ1R2TjcxbGtYSGFm?=
 =?utf-8?B?bUxiSXBpVHZUejMrdUc0WEUzMk54NDZCbzV3YVllREZQUEp2L1dPNXZ0ZCtD?=
 =?utf-8?B?aDlTTW5qcSs1SFNnNk9mOURKRzVPZkJ6M3gzUGxkTkpqUVJmS2FWRnJXTitR?=
 =?utf-8?B?WS9IcHc5MCsvc2NBdWdqbC9pQ3d2QUQ3OEdHWXdpczNpNlVscjNIVUx3bDNW?=
 =?utf-8?B?cFJ5Q1I3QUxLZmpzV3JhZXI3WXR4N3RQQTJ4VDg4VUlVZE8yQ20zRk9DVjFI?=
 =?utf-8?B?SkczVXIwNThzSHFuVitlMng4ZlF2WnppNXQ5NDJNU1Z4NW51eU80MlNKejZw?=
 =?utf-8?B?RlNxTkFkKzI5ODI1dk5JTGVIOEFLYlZKSEJua1Z0Y2VGbEdZdzhGRnBISFRG?=
 =?utf-8?B?T0w4cEJKbWJXaVJRQzZZWTZxbGgxK0Z0WXpxMnNOMmNTeUZINDM3K09kc1dX?=
 =?utf-8?B?UnZXZWdGbVNmaysvK0VXUDlyOHhYU1dodU9pWkJKRWxsekEvTkZqNTJEN3hQ?=
 =?utf-8?B?ZnJsNzRhclFtRk1QdzRTbmkyYllrL3ljeVF3T1JpRFNydkVXNFpIZVVFWFNx?=
 =?utf-8?B?clJ6Z2xmdUZxNEpYTjZ4T29WaDVRb0tCSG04clh1TFVac1prWmlCbGtOWTZG?=
 =?utf-8?B?dndaNmhzeHRuKzVpdmt4WmVnZExKMUNZN1ZXUEtZaFp4ZHNQOXlDOGpKWUNr?=
 =?utf-8?B?elJuck9tdktsT2JaWktUeVpTaVBqdmt2eGpYWEd4QVU2NHNJazFNeERHQkkv?=
 =?utf-8?B?bkdRR1RKak5aZFJYWXVBZDBOemdTcnAyZEQrMTdLTlEraCtEYzFmQ2FXV2FU?=
 =?utf-8?B?OU9hMldSWERkNDNGTWg5czlLZG9XSjBPR3RiM2FWT3RLUU5yUENnMjVpaXR0?=
 =?utf-8?B?SSt4YUpMMGhycWFRQUNLWSthVFhObjYyQWN4VitQOWFzZ05KTk1HNjlxRlFC?=
 =?utf-8?B?UWJ5NytOZ1dHdmRpaW41Vko1MHhXczBJbThNTXpzRDE1NG9VL3BOQWV1K3hL?=
 =?utf-8?B?bzBqbWpvSit5T2h3SjBKN1NSaTlZTkVNR1BFOCtpWHgzcGxJNFFCUHVFQ1lh?=
 =?utf-8?B?RHEzMi91UU9RM1hiVGFGZzI5cUtSQ3luTzlMekxGVTNFTkVFUjNTcm5WR0dY?=
 =?utf-8?B?Q0NqRTYvYW01QlUza0FSN0FNSjIxMHkzOVJFeFZ0RWd5aGNmL2xlcTN3dWlD?=
 =?utf-8?B?OGRTcllhc05WdnpkOWYyOFBlcU8vL2M2R2Y2cUpHVzRoZlFlRlBnM29zcEpJ?=
 =?utf-8?B?UjE2bVNtM1V2cUVxVzR4RTU3Q3VEc2lIN1pubXVqbGFDdWwwVVFiS09LY3ZB?=
 =?utf-8?B?bS9INTEyM3AxaENiNnFQNm9rNmZLRUREY0d2a1VIWW9pcnREOXJBamRoc21j?=
 =?utf-8?B?RWF1cjRBdzlMTXV0MGREbmlHb3hFTHdOcDh0S2pIbXBwLzcrT09OaDRjTk9K?=
 =?utf-8?B?dElnZWpXSW1kQVlqRkFHbmdRSzcvTTh5c05WOHc0U1VmeWlFa0d3SmZYakoz?=
 =?utf-8?B?UE5Ja280emxLV3dhZ1FxbklBanhSbTdjMDZoU0czUzZFdy9VMmhBOFdEVVhI?=
 =?utf-8?B?MWpXc25XZ2xnWk9GYVM0eWJRYUxhSnA4Q0EvaldNYVZjclRxbWRJRHVuNWVD?=
 =?utf-8?B?am1UQUtadGJxOXg3cTdFZW9FdlNCN3FXQ2lacnNsZXIxV0pLKy95THh1Y1Nx?=
 =?utf-8?Q?preCFCU3zJ34NqLVlSsYy/cqCMbOemgHg7N0Xbj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 743f8c3d-d546-4a85-e40b-08d8e22ddfe8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 12:29:53.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcHTaJ2T00KyaMFwERWFNs5ePFJM1NpIFXbPXfCBxEBT1LprBz/EzY4CiL4H9ArYHF3Ls1vewWxJnb5qXdhWWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Mon, Mar 08, 2021 at 12:47:44PM +0100, Jan Beulich wrote:
> On 08.03.2021 12:37, Roger Pau Monné wrote:
> > On Fri, Mar 05, 2021 at 10:50:54AM +0100, Jan Beulich wrote:
> >> Linux has been warning ("firmware bug") about this bit being clear for a
> >> long time. While writable in older hardware it has been readonly on more
> >> than just most recent hardware. For simplicitly report it always set (if
> >> anything we may want to log the issue ourselves if it turns out to be
> >> clear on older hardware).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > One question below.
> > 
> >> ---
> >> v2: New.
> >> ---
> >> There are likely more bits worthwhile to expose, but for about every one
> >> of them there would be the risk of a lengthy discussion, as there are
> >> clear downsides to exposing such information, the more that it would be
> >> tbd whether the hardware values should be surfaced, and if so what
> >> should happen when the guest gets migrated.
> >>
> >> The main risk with making the read not fault here is that guests might
> >> imply they can also write this MSR then.
> >>
> >> --- a/xen/arch/x86/msr.c
> >> +++ b/xen/arch/x86/msr.c
> >> @@ -315,6 +315,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
> >>          *val = msrs->tsc_aux;
> >>          break;
> >>  
> >> +    case MSR_K8_HWCR:
> >> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >> +            goto gp_fault;
> >> +        *val = K8_HWCR_TSC_FREQ_SEL;
> > 
> > I've been only able to find information about this MSR up to family
> > 10h, but I think in theory Xen might also run on family 0Fh, do you
> > know if the MSR is present there, and the bit has the same meaning?
> 
> From its name (and its K7 alternative name) it's clear the register
> had been there at that point. And indeed the bit has a different
> meaning there (its the bottom bit of a 6-bit START_FID field if the
> BKDG I'm looking at can be trusted.

OK, I cannot seem to find the BKDG for family 0Fh. The oldest BKDG I
can find is for Family 10h [0].

> Since I don't think it matters
> much whether we expose a value of 0x00 or a value of 0x01 there,
> and since we likely don't want to make #GP raising dependent upon
> family when we don't _really_ need to, I would want to propose that
> the value used is good enough uniformly.

I would be fine with setting it to 0 if Fam < 10h if you think that's
acceptable. I think the chances of someone running Xen >= 4.15 on such
old hardware are quite dim.

Thanks, Roger.

[0] https://developer.amd.com/resources/developer-guides-manuals/

