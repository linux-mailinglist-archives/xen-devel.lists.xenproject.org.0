Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D53690B2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116171.221779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtVq-0004au-TC; Fri, 23 Apr 2021 10:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116171.221779; Fri, 23 Apr 2021 10:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtVq-0004aU-Ph; Fri, 23 Apr 2021 10:58:18 +0000
Received: by outflank-mailman (input) for mailman id 116171;
 Fri, 23 Apr 2021 10:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZtVp-0004aP-R1
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:58:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2519292a-cd3b-431a-a75d-7fb50370563a;
 Fri, 23 Apr 2021 10:58:16 +0000 (UTC)
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
X-Inumbo-ID: 2519292a-cd3b-431a-a75d-7fb50370563a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619175496;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4URIcieHUiRhDICt2FziTzOhnvoju1JzkYqQXvOlaXI=;
  b=GynAfx5HO1mqcJgV5UMGIHeY6mTlm7cTsSwJ90o4UvdN/M19iN4SC+sL
   bvwph9mX9+v8SdzcbEdyU4azUSOSsHbcmYmCCapwkfCWDrFpAvNSJv4D7
   s6D1g6hpSCNohVRbIII99tvo+1AHaqrzWcxV4C/Y96VFPjsoD2cSl48sq
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M5MvZnu53Af85koYzOC6of3UQVNC2KRsQeXW+1yB+OMpUwUHyeRRUfuB9B3vlINOJNJ0VCITVw
 sY7hCD+sAvbPJmtdaTotWHdalJP/1TVOCZlZnqpPY87Y7Hoi+oZqVJBsnLhi4LMFwn+CyJbLFo
 HkzxYruCxOUz5p3nwpFlG4qkUBk19UND98wKBHx5f1OfLYTqL2mMNRgQChil7dyJaTV0tbJhZl
 ObvwStjapcfpkPWf2ocVxuFh0jObLXUueclaKDZ4nOXNopWQelpfXCDf8JYI07jhoMmN/4Ocoz
 Kxw=
X-SBRS: 5.2
X-MesageID: 42260105
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:l5zDt6hMxXXewNFX5MfNsdchBnBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42260105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwYJz+tkZsKXtg4PcTs0RLVQgvrWzf89StCQuq4IGYL1LjlI73CytrvLYnTEJkSKI8JunYP5iEb2F8YP2btM7YZBfRzFoP7v3xHGxrEtYa37es9udwRbfgg20kXYyf+Px1r+GOVBR+4jxsePVTTYO0K4mSEyNvAt5UH78eV9Oq3Co/lSKWe+VONc6Qe24dTPI8K1yaXZvjfmblavsxNgkKS8EfL/hW3+lnYVvdA2xSSgu6EgRP6KKU+dd6RfZcmuW6zUcIrGZCf1aZkUo1vhwPifavXv46GauaNm/lzq888kKu91UzO4MpHgikA+Bw1XpR048ZEdq3NHPsGYWZF0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GSV6DlcN8l0AYw9V35FatmggFYhG00rbwZMj7Psi0Q=;
 b=ELimJ6u/atezrEYl4q0cdpcQh+roxxy3LUyvwxxqvfQCizaeCxK2PZj8uY83yZ2LjpnwIjL3fBwcdHHF/BOGQYfp682kzGbcCbCSWzOscIs+kM9F/UQPWuDcC3Esut/vtaF56g01L3NgPSS+S4n5yG+UptZ6Y14uplOGiCwazflKsq0nt4CNGSPMWLoKmf8i6Voc9sPPAzf4Rm9Qw04SdWEOiOzaviqS6ounYVIxyt+u3rHmIG5IjCsDNqUNDJtVwgC70LUDmrMtG/VPJws62wEKzmtfuoZhivPfICUcvpKPWoNJsDn3cQrB/aRacCDTVxJhXk85vPlgPcwdZi4z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GSV6DlcN8l0AYw9V35FatmggFYhG00rbwZMj7Psi0Q=;
 b=ADnxyo53Yns57+C3JwRueYZIG9bQar8tD8lO8UyjdjK25Ci6SQpClFj7WqV7Fj6LeUDPDKDSr0P5reLdptsF52cOdvrIivHDeD9iIhjwwtYIHsKeqRWwfIPUdcnrgo8TyGAydx3yBH6xnUsc5t7OibtVBxPiATE6SqFjf+2Zav4=
Date: Fri, 23 Apr 2021 12:58:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIKoPXpMKIHcqaJI@Air-de-Roger>
References: <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
 <YIGOrOL+pKGaHqwX@Air-de-Roger>
 <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
 <YIGcE5Cr+xK4K6gw@Air-de-Roger>
 <98431d14-d4a0-61a8-148e-221652f37b61@suse.com>
 <YIJ3icwAoGEW/AO+@Air-de-Roger>
 <32bba278-12cc-d105-7b95-6a788992d70c@suse.com>
 <YIKcS0o/9A0whxa/@Air-de-Roger>
 <c0edf6b1-46ea-e246-223e-b60356c928d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0edf6b1-46ea-e246-223e-b60356c928d6@suse.com>
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd76348-c564-4a47-2da9-08d90646af77
X-MS-TrafficTypeDiagnostic: DM6PR03MB5354:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5354E1597729A3C009F6BA8B8F459@DM6PR03MB5354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLCmFTvx94wId/SqAEwvwxybavV9qMOQM+v9+oZfNML761C/2NWN7bPRTayVvKNsx3T0TT/46MH1VQfODw6SnoasR6WNsTFpwXgfkEXXvjMIaPMshACtJp5KcGtqkuIq1x5xHg26pFFtMQKE7d3Up3K/wO8hkrmxkzwhH/Z78VUDdQIDYdDuxF+ImAiqG3QnBFXGaiaV/Rs0MzyYL527QrJ4W7nju2PEnE0Hso0gnITWSVHHlhBBh8O0MTTEjeyx2WbcZSWWRqrpcw537ojFIaU+thyaXa/1OTdWSFtBYiB1Gim4cBERaaVgIr4O/kXjfDrb7iFo1O2huKQlKZFaCUc4WWu8XPLg10QpX2aTxR9sGROF5aiDacuqMI7w9Ekq4MCSi5wq6ZxKKIkZdAk0enmuvTF9WuyP3yezcpXXJNbIqyvopuywnvN96F+c72F901OlIFmqxspvalDeA9bouBK0rMxmWhO3m+Lp2/SD5RLtrloQUIhrEwYYyxGGpDeW6EsCr8MLq8+uTJQFYKDa5SkrAfoHzRTsYAe4G1Km5LqNDsoly82bv4SpIS0FSvg1lR2RbmpYtP1nX/IrYG3XvE9FCQahUp2GMdi+LsaGgH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(6486002)(5660300002)(54906003)(6916009)(66476007)(6666004)(83380400001)(66556008)(26005)(86362001)(9686003)(66946007)(956004)(16526019)(4326008)(2906002)(8676002)(53546011)(6496006)(8936002)(316002)(33716001)(45080400002)(38100700002)(186003)(85182001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ck1MTWtVbzBCMjRQZTRXbFF0bXlTTHlRd0VEVHVobzhYbkF3dkM2RURMMzJL?=
 =?utf-8?B?UkhsMkJCeEN6Qmw2MEpHUzcyM2hVcTdCWitnbUkybU5GMVhJa2xKTHRXYjN3?=
 =?utf-8?B?OVk5QVZFK1RqK1hCaUdHbTZoZjZQTmtzUUc5dE5YWTh4aFJVV3NvcjRYczhy?=
 =?utf-8?B?YW9qcTZYRFV0RVFWNFl0OHczUGM3cTBLQXVKY0hBQXVLT2pDWWtKbEtudmVu?=
 =?utf-8?B?ZXp1N3pjQllLNXI2UHptZmdTWW5pMXlPVEEwakE0WkxLYTByamdEdDVRTVRJ?=
 =?utf-8?B?RDJ1aGRBaEQ3dVVxWWRnOHd5UG9ubEF3czBRdnV0aThNM3ZWYXhMYUtKZXZv?=
 =?utf-8?B?LzR2dERyQXZ3K2c5ZWNvRTRFZ1ZNSldXMXBObEF4SWZueXB0dnFzNnloV1Bp?=
 =?utf-8?B?OWtweWxHL2RHVTN6d20xZUxqZ0NJRHhZUGJrQTIxZUs5K2E0TktBSEdOWGVh?=
 =?utf-8?B?UDZCTElWNnVMN09kdUxXSFZyd1hycm5pV3ZxeERzZ3c3Y2c5MHBwaUY0RitX?=
 =?utf-8?B?L1luemlIekU3U05vMCtDMjNjdFNMSHNOZURvelJhMmdVZjQ0UDA5eWFSalMy?=
 =?utf-8?B?YkF6ZDNqaFVZbW1xZFZEa0ZOY3R3aWVZRG5aQXArSHE1T2YrYytaVklMNjF2?=
 =?utf-8?B?STZmM1dzektzK1JZMnRNbHRnRWxNTWV3UHF2VFlYWmNoUFFSK2M0S3hsM2Nt?=
 =?utf-8?B?ZGE3aFRoWDZ6QnN0K1lTUHVoNnA5eUQ1bHZYSTVmeFloK1Z0OWxSTGNlelNK?=
 =?utf-8?B?bUNacVIrWWs5OUlmN3RQS3JjTDZCUVA2T3R6SWVrejBxdzd5VHkxMFIrTFVq?=
 =?utf-8?B?MjNyUEszbkZEZ2svV1J1a3Q4VFhhOUZMSmVQWXVuV0U0dTBWbGZiQXFtN3JQ?=
 =?utf-8?B?Y1BCdEF1c29HOVoyV0JMeHVpSENsVEtvRlB5SlFmZWMxQzdvcUYxVlprendO?=
 =?utf-8?B?QWN2WmFvZVFaTG1JeWlVOFhndlo2K3Q2eksxT1puYnRWSERqUmFGR1krUXZB?=
 =?utf-8?B?Wk15YTBBMTlaRVFHZkZNYWw2ZWphOVZkenN6RVpjZlFqNWYrckdoSk80bzhK?=
 =?utf-8?B?SkNQZE5IOHV2Uk1Da2UzMGVjZ08xL2NsaGsyaUhBTC9EcldrTjlzMDEyZGI1?=
 =?utf-8?B?MW1lQjdLZ3lnUDJtQ0pNazlXLzQ0bWRnek5NWnk2eG53VUFwWUZYZnlnQjBN?=
 =?utf-8?B?MlAzVnc3cHIyM2VaV3F1TlF3ditFYytwRE44NFB1dnkvRFR2UFJXSTVtaGNS?=
 =?utf-8?B?aDBBai9pcFJTTmpoaFd6S3J6K3NwL0l2RTN0YTFQVGY2MWZHa2VXeVZweG85?=
 =?utf-8?B?b0RTeGlEYmpJZjFtd1YrbHlOZVNuUDh6YmF1UUNNNytoMkJyNFJabzdTUzJD?=
 =?utf-8?B?dmlnMUI3enlBLzlZa2xZbCtaK0ZXMDgxZXdLUlpMUjlMR1phck1rSE5FeEtF?=
 =?utf-8?B?bU5VTGk5clFrTnRlSzJwdTJ1QkNkaVVlSVl3K25uS0ZkOEFEUnp1dHc3REVv?=
 =?utf-8?B?US9FWll3R1JvYy9Vem9yTHIyU0RsWUcwSDk5Y3ljY05aclBYODlVa3d6UERW?=
 =?utf-8?B?MHlxZ3k0YzZQWkN1QlZHWDVlSnU4UW1VbW9wYW1UUTJ0Vy9mbUdJaTRrY1Rz?=
 =?utf-8?B?Z0NSMWFTVW9ERVVUSFY2SW1QVWdVUHFtT1ZZRHVZYTQyV3phSDA3RjRoYUNM?=
 =?utf-8?B?d00xU3pFU2hPd1ZXcithdk1BUGlaMDY3UWVMRmpaRHh1SWZWdFJ3UlFVMzE3?=
 =?utf-8?Q?Xg54+5hFjroTXi/2lAg3xsdW6HJd1y0s8nCr1OP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd76348-c564-4a47-2da9-08d90646af77
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 10:58:11.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1ALnRFaUku6Gpl1GAZBlGSDLvPjSTRgU34sqq2NJ+zioGADjRBaCHPLgNyISbzSb7p+0PFNLxTjhATB61O4Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5354
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 12:45:14PM +0200, Jan Beulich wrote:
> On 23.04.2021 12:07, Roger Pau Monné wrote:
> > On Fri, Apr 23, 2021 at 10:51:40AM +0200, Jan Beulich wrote:
> >> On 23.04.2021 09:30, Roger Pau Monné wrote:
> >>> /*
> >>>  * Explicitly list debug section for the PE output so that they don't
> >>>  * end up at VA 0 which is below image base and thus invalid. Also use
> >>>  * the NOLOAD directive, even when currently ignored by PE output, in
> >>>  * order to note those sections shouldn't be loaded into memory.
> >>>  *
> >>>  * Note such sections are past _end, so if loaded will be discarded by
> >>>  * Xen anyway.
> >>>  */
> >>>
> >>> Feel free to reword or expand the comment.
> >>
> >> Yes, I've edited it some while inserting. Will see to get to
> >> submitting v2 then.
> >>
> >>> Not sure there's some
> >>> reference we could add here about how debug sections are placed in PE
> >>> files usually.
> >>
> >> As said before - I don't think there's any "usually" here, which is
> >> why different environments have invented different ways. The debug
> >> info native to COFF is more like ELF's symbol table (with a little
> >> bit of extra information) plus Dwarf's .debug_line, but not really
> >> fully covering what you'd expect from debug info.
> > 
> > One last thing, do you know if the newly added debug_* sections get
> > the IMAGE_SCN_MEM_DISCARDABLE section flag set?
> 
> At least with an up-to-date ld (i.e. one meeting the requirements so
> we wouldn't force debug info to be stripped) they do.
> 
> > Not sure there's a way we can force it from the linker script TBH, but
> > would be nice and seems to be a recommended flag for debug sections
> > according to Microsoft [0].
> 
> The linker does this for debugging sections irrespective of what the
> linker script says:
> 
>    if ((sec_flags & SEC_DEBUGGING) != 0)
>      styp_flags |= IMAGE_SCN_MEM_DISCARDABLE;

Great, that's good to know. Note sure it's worth adding to the commit
message, maybe I've just missed part of the documentation where LD
notes that IMAGE_SCN_MEM_DISCARDABLE will be unconditionally added to
debug sections.

Thanks, Roger.

