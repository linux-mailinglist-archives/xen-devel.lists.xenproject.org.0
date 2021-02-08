Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7439E3139AA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82976.153570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99Zp-0006Eg-9n; Mon, 08 Feb 2021 16:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82976.153570; Mon, 08 Feb 2021 16:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99Zp-0006EH-6J; Mon, 08 Feb 2021 16:39:53 +0000
Received: by outflank-mailman (input) for mailman id 82976;
 Mon, 08 Feb 2021 16:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atCq=HK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l99Zo-0006E6-6z
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:39:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddb1c5a2-ccf8-4349-a44d-c1b5ed0d5ed0;
 Mon, 08 Feb 2021 16:39:51 +0000 (UTC)
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
X-Inumbo-ID: ddb1c5a2-ccf8-4349-a44d-c1b5ed0d5ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612802391;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=u/9MljKpQSyzA/UEqo6UHZARuh5o2PonKRKGkPOWK7I=;
  b=BsOfKoliOF43GhO3959DYXudGZITbHMfxue31ifDfzB9dKUDIkiF05vJ
   UI12fi/17Rt2JZfbCsa5LkE/YUwtga191PwG2v9HSfYVG5OOkUwZ/BAk7
   K1AQYV7kM1oUTnYSZMaYjYynDqMlvGGRlcYq5Le45wi1FbAwJcp1+V0dc
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KNmOHEoc+fs6Qjf7XpnuqOlS3WHPDruVugi4fc/osjZEtU/UqKOv+3wvEjD6g1VMjbXkzJ0lCS
 Utas9z0C5it1TN0LrhIRFMwbw8BzM7A2GlkDkkJKJbSeCqlja7T1xPp0nbz973Hksb45AQwfzD
 IAM0h9Dwbmke4oNXKSPT3sn6ZkhzDBBmYbu6zZQ3Ta8FB5txhIPtSj0VG7HrjL+fGeVkqIuZ0j
 HAt2ArH7DEZ9S8eo2Lct93FBusbrBg9WFY12ZnDZ1OKp3T5XDHBGjQJoVhfn8v7RfikDrfjP2n
 txM=
X-SBRS: 5.2
X-MesageID: 36818554
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,162,1610427600"; 
   d="scan'208";a="36818554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZ38+pU0zpgRQVSH9X4LKSIyAVPLS2jFDXk294NHfLoo4pCj5bQGGDz+5zQh9zjDAl4i937M6+2elrgi1VSjTzWqpnYDWsMcmqKJxilTWcd2uJ6KyABFfiaqauVsMv7O4XcCRII0Pom710VzQW5Aja5heQxzHCvwNWXSJNL9sFdgvsAtYLxLnjP6MxvB7+QOvC0cf6ZTIbnnZ0UppNnMMbq6n0ugplVgwQWx8smy4SHYwfoE8amVkLzw5BHbFplw58Lci11n/mw2vPBWL0B00yvAvllyTqNJSdH6kxiO9DtfdqsBpO82edsPBUG/ZVHUx+zWuO9BfjxF1Pv7hWavzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y58D1HQJPdV9rWbvSfCrG+b68fRv8CzeC0e4ZYte8A0=;
 b=hOTqeFTeeUiUL4peoeg9jgbiQk/qZ7HymDFuxV2EB+hSYPtiC2iW7oUK+d8g/Q22yeAf9FjuFuXYh3i7x9HAXkR3wQ2h/fcMccK5AxFhHuFPbF4x38fiAyGREd4Sz0/rRKg3OJNTAict4VPbB+HZYWYSMdusnQAsaJgBtz79sjFDjjJGmMrJXOdAkOgm/7hIuJczI4EsuKyUmCW6WMw9ExsYPv6YfGXrlv3gmFGDAHJD/Qy29fjwZvXnoXrVAZcDZ9z464Fg90MHP8hGRDLOkzppEU9V6EKI5USfJ83MBBZeuPZbkaCwLIDurGyVKDaUmroMEYCduEjew0QBOye7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y58D1HQJPdV9rWbvSfCrG+b68fRv8CzeC0e4ZYte8A0=;
 b=u2GEEn2P/9oDELOCmF7VIHqCT9PJv1pskAMUKLxSjUMgKmIS7or1H8Qh5G1+HuGqjMcvOChNjgQPh8z6DHN6MSZnf9IEUmETbLcXpNjVQouQ8V7jbZLwO68zuOeoah7/aVJXg3DTtECUP+7MI4pknKVTEfg/W2vP5qwNIl/gBUI=
Date: Mon, 8 Feb 2021 17:39:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 2/3] x86/time: adjust time recording
 time_calibration_tsc_rendezvous()
Message-ID: <YCFpR7NVYGblUKGS@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
 <YB1vGGl59oNZb5m5@Air-de-Roger>
 <861c931e-7922-0b5b-58a9-63e46ba24af0@suse.com>
 <YCEa7JxPCAzyWqfe@Air-de-Roger>
 <9d37329c-50fd-81ae-6987-40c81b78e031@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d37329c-50fd-81ae-6987-40c81b78e031@suse.com>
X-ClientProxiedBy: MR2P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ab799ab-458c-43de-6f78-08d8cc5021fb
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB336983D38EDB19339743B00E8F8F9@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9S91eI5ZNgivnLvAZONHjxkyyw1bS9nFhqzdLJiZdJ6ksKJcjtSGHwWD0ghWqwsEVw9PWPr//HMn5inwog79ZymswlegtmF9dRbzbvb13dN7dolRemagITMwKry2r7piTTY0HpiqDAbGA7zr+S488D55uUHlnjqPVh7/d87lkkT3LaP4x3vDfuVQJO82ofs2DBt/QFYxe7TEIvxDTb+vxgwcd0cet24kl+JrmwEDCHCL8dWPECIn+Iu68sOL9u2DIKTHVKiX7DwpiWdAHEgnFTGTynkhmMVFrIxiVwHUlErgQ5L7/gwyqyxocfLoofw8ZZWEUUSrVrg6BAv1P+v+Odpas1qw2mzLsWuf+57C3sy5B2hePh21EGTRQGS26HSYoSO+VUjAIPiL6GbjYiHis2siEfpg1r+L0Vf+ASnBfFjiFAZ1I0Wu0ao4Q7JNhH6IuomPw161bnN+nYvbT+loYioUB427UdHrMGQRgUSg3iKCuBYdz2AtDVUi5uaXiaus0JmcMXdx1Pwn2eiuu5GDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(85182001)(83380400001)(9686003)(316002)(8936002)(478600001)(6486002)(6916009)(16526019)(53546011)(956004)(186003)(86362001)(6666004)(26005)(54906003)(2906002)(6496006)(66946007)(66556008)(33716001)(66476007)(4326008)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTZDN1RIYlVBSU5tYVM5Q0ROcnI2a0FGQ2VrMnFjNHRTRDFrKzhVMXMxa1Jw?=
 =?utf-8?B?Zm1IMXRuV21OaGxpWW11ankxam90SlJDeGw3cGJTWUZ4cDdnYlZweTM4RlBX?=
 =?utf-8?B?UDBwYVh4ejVLTTVxUEFKQ2ZGUk5NNHJ5aG1nL1dWRlNTYVhYTC9Vakhnc3NR?=
 =?utf-8?B?bTlEczcyaTJOWEdxWERiVWsxVUVydzg5MEd3R0ZybXNBSDV5eDVFa3ZlaHlX?=
 =?utf-8?B?dlFUc1F2bm1aeWhtZi85RkR2Z1hjUUZyQXpPUzdjc1k4QlpHbG1HbjY0Z3pW?=
 =?utf-8?B?MmVzdVEvcW9UZ0x1UVQ4MGVKTGhYcHZWSDA1ZWdPbXl5RnB0NGlFNlVWbnNl?=
 =?utf-8?B?ZklDeCtvMHgwdlNlTFVQT2FmSGlYVzFQQTZ1V3liUHE4RVhwTTZaNXhreVo4?=
 =?utf-8?B?VVEyekhLTE5JRlF0TWVnUkNvditKQkozdDI4cGJhUmo1WmNNRGlMZmlMM3Ra?=
 =?utf-8?B?NXNaSVp2WW5aUXY0RTM4MEk3dnRpSVdETXdVcDFWdUZMR3liRUdBN0NYeUpH?=
 =?utf-8?B?REhpUjI4dTBreVRhalFLd0d1VjZNSWlOaXNFeCtDbEhJVmZsQmZZMWN2T3ln?=
 =?utf-8?B?UVJYWmRpeFdvS25ET1RHc3hINWc0SCtTVUs1RDdkRW9jL01qaURoR3lyQ3pC?=
 =?utf-8?B?ZGppZWhTVUkzRld0bjNKL2pkeXlxMDBUZHZqRHZlRHNLRHU5cDk3b0dNQkRi?=
 =?utf-8?B?MXRGS2VMcC9yTkVpaGRnb2RISmtQYUxQM3dISlBKM0ExYjJmYXRkY1pxQnJ1?=
 =?utf-8?B?UVZvdEk0OCtKbVFTSXdndWxqYXVYTlorVFR2SGovRU5VTVNob3pJdEpvdU1H?=
 =?utf-8?B?Wk82cURoeHF1aTBDL0lCcDRHUFVPeDBsK1ZZY3pQTUlabnlCRGlLbWZNVnVM?=
 =?utf-8?B?eGtNanRFT3VwblJYQnlvRFNuWnNsbFdDYW4ySUw1N08yVzNQM1hVa0gxc01l?=
 =?utf-8?B?WlgzZVl2dkd4QjdaNE9kSXpENUpDNnhOUjF5elMyME01dlUvcVZNMmxvOFBS?=
 =?utf-8?B?T1YwNjlzdjFVY0ZpR0hJT1RhTTNnS2pCZVVKOGttRDE5NlJqNEM4TVFqaHNz?=
 =?utf-8?B?eEpnMk1DUHZybnFDdGE3NVYxWnBLcGxsMEhKRnovSDFCWnl0SmJnaXBUTnhB?=
 =?utf-8?B?YzZaMDFsazVRUm9RTWRmemQvbmpnbmRCYUNZallvaWprclNsUGFTK2pkd094?=
 =?utf-8?B?VnFacDVXYnEvQ1c2eEVFS3RhSTBwMjA5MWhveTh6SEVVdmZFL2FGK0NHZC9H?=
 =?utf-8?B?V0EzMDlCR0o5RzVLWktOL2QrdENRZkt5STlEbEI2ZzV5S2V4VzEyemxJK0FZ?=
 =?utf-8?B?VlZsMC9EYTZzL3NyeWVMbElKS2RKM2dyOWZ2MnN2MHExSUlTNUVTd05lU3NS?=
 =?utf-8?B?eVNyMUpnQ25vcXVnT29jb3BVVDJ4clpxb1NYMXpkaExpZFFORXdjN1V3SDl4?=
 =?utf-8?B?NEtYUG9vd1cvODcxSldTR21JZ0p1OE1jUFFCSGwrYmJqTTN5M2QvSEdEUVFo?=
 =?utf-8?B?d2VldXRsNWRzdjNLT3VCdjBKSFlEa2pUc2tZVUZEUXJNelVRUCtMbHZLeWNt?=
 =?utf-8?B?YkxzRHh2S0Riclh2dUtUNDdmYjFmS2txWFJPaWZYNW5GZThOWWpyY0JiSUw5?=
 =?utf-8?B?VURJcDk1QTVza1liV2N2MjV5OHFjUXMxeGxqSlV6T3dId2hoRldHWUhYNGFm?=
 =?utf-8?B?Yy9qeUV1dmlLOXJDUGFEdWF6VnluNWM4SERZRmdJWjdOaFJ6SW5ORG4xcVdW?=
 =?utf-8?Q?l+eeOd23AcPHcbi2LzWuc0OkouRgj/ldZ4d6Ctt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab799ab-458c-43de-6f78-08d8cc5021fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 16:39:41.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XoXB5n2pPP3Rh6petamUV+c2WvpI16nn2CyaxdPCrOdHEZSyBUBvIZG/4LH6TcO7uA+GeRE4Sj1qMtJSCYU6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Mon, Feb 08, 2021 at 12:50:09PM +0100, Jan Beulich wrote:
> On 08.02.2021 12:05, Roger Pau Monné wrote:
> > On Mon, Feb 08, 2021 at 11:56:01AM +0100, Jan Beulich wrote:
> >> On 05.02.2021 17:15, Roger Pau Monné wrote:
> >>> I've been thinking this all seems doomed when Xen runs in a virtualized
> >>> environment, and should likely be disabled. There's no point on trying
> >>> to sync the TSC over multiple vCPUs as the scheduling delay between
> >>> them will likely skew any calculations.
> >>
> >> We may want to consider to force the equivalent of
> >> "clocksource=tsc" in that case. Otoh a well behaved hypervisor
> >> underneath shouldn't lead to us finding a need to clear
> >> TSC_RELIABLE, at which point this logic wouldn't get engaged
> >> in the first place.
> > 
> > I got the impression that on a loaded system guests with a non-trivial
> > amount of vCPUs might be in trouble to be able to schedule them all
> > close enough for the rendezvous to not report a big skew, and thus
> > disable TSC_RELIABLE?
> 
> No, check_tsc_warp() / tsc_check_reliability() don't have a
> problem there. Every CPU reads the shared "most advanced"
> stamp before reading its local one. So it doesn't matter how
> large the gaps are here. In fact the possible bad effect is
> the other way around here - if the scheduling effects are
> too heavy, we may mistakenly consider TSCs reliable when
> they aren't.
> 
> A problem of the kind you describe exists in the actual
> rendezvous function. And actually any problem of this kind
> can, on a smaller scale, already be be observed with SMT,
> because the individual hyperthreads of a core can't
> possibly all run at the same time.

Indeed I got confused between tsc_check_reliability and the actual
rendezvous function, so it's likely the adjustments done by the
rendezvous are pointless when running virtualized IMO, due to the
inability to likely schedule all the vCPUs at one to execute the
rendezvous.

> As occurs to me only now, I think we can improve accuracy
> some (in particular on big systems) by making sure
> struct calibration_rendezvous's master_tsc_stamp is not
> sharing its cache line with semaphore and master_stime. The
> latter get written by (at least) the BSP, while
> master_tsc_stamp is stable after the 2nd loop iteration.
> Hence on the 3rd and 4th iterations we could even prefetch
> it to reduce the delay on the last one.

Seems like a possibility indeed.

Thanks, Roger.

