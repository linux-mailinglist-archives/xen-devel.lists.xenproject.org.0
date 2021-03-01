Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC743328915
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91896.173454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmiM-0004cY-Vd; Mon, 01 Mar 2021 17:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91896.173454; Mon, 01 Mar 2021 17:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmiM-0004c8-Qx; Mon, 01 Mar 2021 17:52:14 +0000
Received: by outflank-mailman (input) for mailman id 91896;
 Mon, 01 Mar 2021 17:52:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGmiL-0004c1-DZ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:52:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83a2bf0d-b35b-4ab9-a9c4-77d8c34fbaea;
 Mon, 01 Mar 2021 17:52:12 +0000 (UTC)
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
X-Inumbo-ID: 83a2bf0d-b35b-4ab9-a9c4-77d8c34fbaea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614621132;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FZXC0VidLQL6hHv3Yur34SirW1hs57x5e35Io7PoxC0=;
  b=bGXkzaJc1+dhCgZ76qedToNO5Uhl9iiDfiqA42UkMLX8mJVniJMME2NO
   beESQspGQQKrrdoAyCs8hI/ZcSH+UQjA9ZRMYZQPYkSjrezzkBxV9uuAa
   MABG1LD4IAkoL5CjuA/hqAeZbctPJlmZjJlA2HnRm5fh5MFZQPmCZN+YK
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AsyBMN6QSkhSGzmL8LJDNrCe06uCBmzwnwZLeW6y5UDKaMoYE8Ep7Gf3k5wpTLRUjFh4ZIleRG
 A23q6Y0tVOVTvaF81kb0D5qTTXQ7Y5/xus1yEvugdedrskpzPimFLlcmn5a/lLy6w7dwq+keXX
 0Js3GtBlkoOQqb5ksbAJIpo5RB7+Df6gDx6XaJa/cMViHhsB6DCt6HIab7k6jie7Yxt5GTjswe
 VzCDzGYYEK6nP6X0PViY3SlDIjIJ52wq+2HRQmI387zaY06A9p0+462uuLzERRTaFuPbNJRimV
 hmg=
X-SBRS: 5.2
X-MesageID: 38634359
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38634359"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYp5REqLBxXGBNlci4MDrHTaY+zh+fl/BscA5MrYJj6NjoUBupA71oMRFWdx2Fkz7vuoyTbK4F8o5nfhqpwqnRV6t0odO0B1aAyaTBn/QjJxpFVoH5NS8wagVWjMpJQ6W7lj8sSgFLaQ90UofrYOOvpi39+HdRMPoy3eImMN2PdNBYXcqwD0m3AuXbOAo3O5k7hdcVveFTDQueiofTjWr16LepmdYDokjv0cUxX5bbxZ+0q+c1gLwNIk2DvpbTyT53UY/GAlZ1X0Ex7o8GQN5pHrSdjbfeXVNeNH50h2wLYv7vyQPp/2fja1LnPjsXCiOPrEcmcP/GhSDLtvICvdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vO6ge7pGSUMm0wQHeGn2y/o0F5PADTZi596ljeQehg=;
 b=CBGoX7L3rb4/W36upR+7b5G4vySVsyV48JewgsVqsuWhq0uSO9Olx505KN52NERN4A4aZibRcmmfyiP4kiUFdYHq0iPXnBLldZMg2IJUbLNs8sEpcoVDuWYF2NwpnL4aD7axbf38DNihDTQfPgedaIPjoCDV9p7id/yOXq1r3SjgNHbNG+sh2riVw4a68vHR9Xpkn9z7OHEzN6DvJVpH4H/hjQx9SelVC/vwuot7qWBOsc6hQ8h5RXbnmUnY1o37VU76XgfgKASNlDy5d6r/IAXQmvIapoi3V2cqSoI3CfJ6X5SCvzBEsMdRhi6AXiWp+GdbQ1ywtYkmiHIoSvCHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vO6ge7pGSUMm0wQHeGn2y/o0F5PADTZi596ljeQehg=;
 b=jm3xXDxH5thdz/2ILmz3N7sq4eHvjBSOB5wsRtFNgGhOG5xqT3sSVITavjbqQLs9rJtviH1CU2n+67QMwBzvc1GQ3zj9YLWRWhGe1jW32MoUOrovnuL7o2wl3GexPAjYIqwUAW+mD55Cy8KxQsnIcFbISKb94dRw9InXdvNqJNQ=
Date: Mon, 1 Mar 2021 18:52:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
Message-ID: <YD0pwgN3jOYTGWnH@Air-de-Roger>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <24637.8562.514355.845883@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24637.8562.514355.845883@mariner.uk.xensource.com>
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33d0c404-ef86-4297-798b-08d8dcdabc24
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2554006B3A17743678E480488F9A9@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hU/ODPY+A/uuIvyWZoES1teoG+Ta2fh/rxik520Y3XpxU6cFCGqIM6ZwBakVkzwVzxSXaSe1ODkZOO5xz1wd/JaRBdXwTBr/Bb5Hszcgy56na3y1jz66SbNt5vFDTJ2oYCDPa4LTaDLEeIxpspXaxZPIHYRx60hkRniJPzeeFADTHYzyUVtt8tCZ1CReJ+Csp6WycuBc5IDETY7CGkx8/0Xxd0vTPo+1ZxKt2wNV2yiDACLDmar5zTjvGz+ze21ohGNE3kGF1BJMkBydBBsiWcpcm1xb/nJkm3tgPrcND30V3Ag2n0dKlDmDe3BiCHChntEHkoZXlnQrubjHrjAg0viTVNoKGtx1JANzqiGAXXi3JZFMnfDB5mvZu8QanPbDk2/wGrLJEQmrDkWKYiAw9IxpKQLJ10V0e2mGTjVhv1hYgjkgrK5RTmUcE7MvVXj75KY4EbaLny4mRJHAN5Kh6X26VFbvLOXousgVI5SXf0QHiiaYUBhX4g6j4zCR0MH4lMI8YGGN7Nqo50XOjN5u/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(4326008)(478600001)(5660300002)(54906003)(85182001)(83380400001)(6486002)(316002)(6916009)(2906002)(66946007)(66476007)(9686003)(6496006)(6666004)(86362001)(8936002)(33716001)(8676002)(186003)(956004)(66556008)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjBNWEhUbW9VSTJyVURJa1VLNk10RU5ya2t3eEZMSjFVM3hNWldTYU4wSkVs?=
 =?utf-8?B?Nm9mVjFjY0E5dWZDTmxXTWduNjB0Mm1JUlhYNUk1YlVnYXc2ak9KWWsrNFFY?=
 =?utf-8?B?MEg2bW1WUFViWlplSzJqQ2hXWEVJUnc5dFhOL0ZuQm8zalQzVHExV3M3ZnNl?=
 =?utf-8?B?bUhocXRXRGxRdHFyVzhjUVhBNHBBUzRUUG5FVExhbGFvd1FGSWJWWU03a25q?=
 =?utf-8?B?WXZ6Y0hpOStTUnJ4TnFua3U4OG92dStnODg4bEljMDM2SVNqcjNPYjg5dWxs?=
 =?utf-8?B?c3dUSzF4RWFxb2pzMXk3RSsyKzRxOFJSRTQ1cDNMRFdLOTUxV2hMelFhWU9i?=
 =?utf-8?B?ODZaVXBlQ2oyUTVQSUF0aUZEblR2ZmpIdVNLdG1zYUdDeU9hTEJDTDZsanpX?=
 =?utf-8?B?ODVkVkRkaEg2QjAzZXpkb21UeTZnaHB5dnVMWUhSYWNZVWZ0QkJnY0M3RTVj?=
 =?utf-8?B?KzQxajM0MFlacTRaV3dUUElzNmc4Y1J5bVh1Vnl3RTFGaXlpUzl6eXdwSFI0?=
 =?utf-8?B?R0p5c0x0ek8yNWpVd0ZCMEVYbTUzcHBtTWwvY0tzMG1aYWhadzNCQjlNb0p3?=
 =?utf-8?B?UEdjQ3J2VUNyTmdxSHhLZ1FQeFMwOERRT1ArbGdDbUJ5bHNPOHZBRUtpemFr?=
 =?utf-8?B?M05zdDc3R3BsTDJrSXNRR3Uvb0NkZCtRYWxPMzZCM0tLMjQ0NW1lbDdTblR3?=
 =?utf-8?B?QW1oRWphSW50TUdIR29KbDdDaittaFVYK1U3Y3NyeTJKczQ5WmgrRGtVWVlh?=
 =?utf-8?B?bkgrYmRIalV5VUxQejB3T3YzSVVUekViRGsvVnRVUFowZmJRcWlMNGVqVS93?=
 =?utf-8?B?eXBkU1JoUklmSjhqclB4UUNac3B4WnFJTjBKRUkxcitRRmVkblQ2ZEhMbHVp?=
 =?utf-8?B?TFRTbG96Y3hwWHhPMFJ5T1lVN3FOY0NMU1ZuVUE1dExvN0pPL2l4YUNVS0dp?=
 =?utf-8?B?N3QrTERubEFpejZoNkMyQmpYamxuSjNObHpOL21hVldhNTdLTlZ2RUo2aE1s?=
 =?utf-8?B?MmNleXJLS2xKWnJKb1JuZkY5UjloTy9GWXVUMUJLaUJ3dWd3dDU0QnNQcjQx?=
 =?utf-8?B?L2VWT1ZLT2RkTlROd1FET0Ryam9qdlVoaXhvdnFFVzR2eHhyRkpWNm9IcWJp?=
 =?utf-8?B?OXRWRUFWOUtTS01XZi9ycjA5SXZaVmFHb3FqVjJlQVhQcGRscmRha2Z2d1RR?=
 =?utf-8?B?T1ZFY0NuVEZmVGRiVEYzK1BGT0c1cWxvK1B1Uk9jNW55NjNmbGYzVGduQi9n?=
 =?utf-8?B?SEpVUnMyY0dqV3BPM0p1ZHU3L1d1TWJteGwxb3AwKzNyNTBzdjlldUtHc2Nm?=
 =?utf-8?B?aXdYaE5qdG1tOXFXSGowdnNMNzRXQ2dsQ0s5Q0RJZTFBRVFzZ1MxT0dneWl4?=
 =?utf-8?B?SjhEamVRU21WVkNyK1UzRUdJZGhnUzdDazBHN1J5bjEyditGTVQ4alNLd25Q?=
 =?utf-8?B?SWhmVW55Ui9RUldQNWUxbjA2eFRhQ3g4VlFoZk03V1FkaUpsQS9VYW53NkdX?=
 =?utf-8?B?QzBsYUVpNFcvNU02Y1JtTnhRdjVWVWtFbUZ0aWI5MU1EWUd2MSs3MjRmVmlo?=
 =?utf-8?B?bktjYmJiQTgvT2tKdlVLVGljekNQbWIvdXlVQk5FUnlmeDdzYkUzU0lBc1BP?=
 =?utf-8?B?bG53SnNMTEIydUxGdktMRlhBZUk4R0FIZWhuNk03RlR0YUpIU3gvNWdYZXkw?=
 =?utf-8?B?Nk12bVpSWEJ2Mmw1YjRuQlpLZ2hvMXgzZ2dWNVN2V2R4T3JnYnpCV0tSWWFX?=
 =?utf-8?B?dGI2OE0xaElnNzROajVoU1AyVm41WkxQTlIzdzRZeU9FV2h0eDJpdGJoblor?=
 =?utf-8?B?VkxXNU9WcU9yS2RCb0FTdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d0c404-ef86-4297-798b-08d8dcdabc24
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:52:09.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnUhtw3lNg6z8yhEqiAUnyWwE2nrIyBj5/f37LSkMMZpV1D/PwqddZgacd/8dV0cQBNic7TE74boZXXLBZZ4XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 05:16:34PM +0000, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR behavior selection"):
> > Introduce an option to allow selecting the legacy behavior for
> > accesses to MSRs not explicitly handled. Since commit
> > 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> > handled by Xen result in the injection of a #GP to the guest. This is
> > a behavior change since previously a #GP was only injected if
> > accessing the MSR on the real hardware will also trigger a #GP.
> > 
> > This seems to be problematic for some guests, so introduce an option
> > to fallback to this legacy behavior. The main difference between what
> > was previously done is that the hardware MSR value is not leaked to
> > the guests on reads.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > ---
> > Note that this option is not made available to dom0. I'm not sure
> > whether it makes sense to do so, since anyone updating Xen to such
> > newer version will also likely pair it with a newish kernel that
> > doesn't require such workarounds.
> > 
> > RFC because there's still some debate as to how we should solve the
> > MSR issue, this is one possible way, but IMO we need to make a
> > decision soon-ish because of the release timeline.
> > 
> > Boris, could you please test with Solaris to see if this fixes the
> > issue?
> 
> So AIUI this patch is to make it possible for Xen 4.15 to behave like
> Xen 4.14, thus avoiding a regression for these troublesome guests.

Yes, sorry I haven't provided a release executive summary, as I wasn't
sure this would be acceptable in it's current form. Can do if there's
consensus this is an acceptable fix.

> Have we diffed the result of this against 4.14 and if not would it be
> a sensible thing to do ?

I think there will likely bee too much noise, we have changed the MSR
handling a bit from 4.14, so it's likely a diff to 4.14 is not going
to be helpful as the context will have too many changes (albeit I
haven't tried the exercise myself).

Thanks, Roger.

