Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B5310ADE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 13:06:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81655.150992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7zrz-0001Gy-5H; Fri, 05 Feb 2021 12:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81655.150992; Fri, 05 Feb 2021 12:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7zrz-0001GZ-1p; Fri, 05 Feb 2021 12:05:51 +0000
Received: by outflank-mailman (input) for mailman id 81655;
 Fri, 05 Feb 2021 12:05:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7zry-0001GU-Df
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 12:05:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff0fc39f-8052-4b15-8a01-ec03e5a67ca9;
 Fri, 05 Feb 2021 12:05:48 +0000 (UTC)
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
X-Inumbo-ID: ff0fc39f-8052-4b15-8a01-ec03e5a67ca9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612526748;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wI9erkbu0/wX24Oxec5EiES1+4Cd6UYRzPRO/ELxRQk=;
  b=XP25Zh9/VSmb75vgNP6bUSrzmLOxriiPtOll0o2uHxpkqaaoHAVIcOl3
   sqpstEWk+7ff8fXtSsMqs9CuFdyhWYWpsYEnbIl0HJFZg0wPmxffKXGiA
   sdw9+apQ81aEbvEeBDtR/dCTi4BHnQO3FFCnYm5TVEIMMWwd7aMiT5w3W
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sNJvlcGzAXg5KGLksvcZglX5+0xm6aBgw/T8sCDjM3GfGv4mbXu9D74cbya9vRWyMZPoCXCyD7
 OiPiTuFmGg+tjF8PgzPk0DbuLzLmQfeDS/cRN/mSSUv83oSM5njlD8jlH085V+KeMQJ1l2qBR0
 SzTLf86WQMC8SggmdAfTm3WN2oYYrUGasg6owuZqPJMwMwTQJrfYImfNdBaqPfH7DOSXif8Sno
 LgclvvABxetoR7WDy+r83RVCAiyUIFBJLGvu0YSvV/8jefheUsnyGltrUQna2NAIBp7nyz7PI9
 fWQ=
X-SBRS: 5.2
X-MesageID: 36634052
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36634052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf1c2yQ95iN019C3bGsNxiX5b5WD5gmJcp4s1QWoF2o5Bg08CET+iyLtUPfF7WgMYjErDnjblSuc8lbol/9bX4QWEet/7r9hbx9+Nb+WQKEnC96eOWcdE3WBpJCiviLDIKdjecfO7Ck19s/82HMZdiQ8NRmcgu4RbZpDFlZ7Opg9wjMd4APoNSuCHYjBaxd2SNO+VR8eaKpFp9tqoPGlFSEpXFtGQ9Fls9jl3b6zEQPZYOr9UYjSO6DfaDQxyUlkdvbgheYjV5JOWJ8glRLL7+jKw7G+2/Ddk1BCCe2Pq7kDZPxSJkOJC6zvc9mAD6HV2kmQ7Y2cu+UMU35HsyyTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbkXz2G1gY1mWnqqlGfO24JSvUwQzoGuQbX7AZGJnFs=;
 b=P3pS0wzQVt5UMr8z/QGxHSb3TUj/qZjbwdSwsWrYyO5Zf6R/rcihc9ExwrMVgJfIvXeF+5rK7qugZe7l0b+AKZCDvctxKcUWxKHGQYQATNWTWH2NrKYlKW5cAQ3JdZ5PhDjRb0XUDpKIWlPIZhJsrImd+fjPCaImKjulIRNusuZKulUvA2qxN24b/M9tr+P+L/MpGqO7YcIhK0Sr8rX1WB+DHDcD6ZnYj4e6d2Kt5V+Mw5gMa4NNII0zVRnf6aCYA1eyA6WDHQQn3deUwJoWW/YuQ0F+0uDDvW4o/ehd5TRazoGohLCT9bgSvYXNbIquzONz4yAt3bMtidVcs57HWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbkXz2G1gY1mWnqqlGfO24JSvUwQzoGuQbX7AZGJnFs=;
 b=g/1bmK4svlUuAGAcRhS8Av02770YxmSX6kTWs+vQfJReOZfwNIK88jrgWxczlcSYFlfwgsWQaFrQrXa6PPt5m7fbzmtyqN32QhlI3nBQf4+Q0+9qFLWmZU5K0DShSwUu3SOaD8+kssV2PbXrjIeEqJrBPnBjcgl8NzHxEoK6P2I=
Date: Fri, 5 Feb 2021 13:05:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?B?UGluZ8KyOiBbUEFUQ0hdIHg4Ni9Q?=
 =?utf-8?Q?V=3A_conditionall?= =?utf-8?Q?y?= avoid raising #GP for early
 guest MSR accesses
Message-ID: <YB00kpC8Iz54TbxA@Air-de-Roger>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
 <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
 <7fdfac30-0c7f-f07d-fc7c-f7bb87b71a28@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fdfac30-0c7f-f07d-fc7c-f7bb87b71a28@citrix.com>
X-ClientProxiedBy: PR3P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6427c3a-61cf-4726-60d6-08d8c9ce5c6c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5591D2A44F218B283366ECC78FB29@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVDVWSh858goVJOe8x0TT/ecjoRpimDdVEGYnjcNM00CqrAj+oNFIZDvWsKpsSKNI3aqqq4UdDLX1EyWAB5OOrIkopowpxHTT0lGEQ273GclA8zMIMh06h7mVyOACydxt2N9fD1ZTquDttbvt2dRiDqC00SmGDxnIUJ1YHxW0rLYQrCdCv+Z6wgtj3dUCq7FSvOMwfxpz6BLbPaxh72Lc3OktyF9SFq+FVoiE2UJjpnIUfii4erhme1A/bRHJ0geHVdoMcVR7IzSrsSJcdoeAPF4b4LTv+uLeUsbn8AUVglNW2Aa5RhxpgOk/xf9KtDTB5oTMF68a/WMVaATL4UzV31hUmQ1Ly/b0TqCQzLuX6zerigay6Z/NyqFswWK1QY+FSOY5HIAn3lt1UuUS+HGRvHH45N69ipF4YetpRQSJXkNV7jeqwGq7tbsnNhS/2BJGb2tWbllt7DK8Ftud8ItEj1e5U7ti24mQrgJZOH1uYRRpUzz0tQNWRDV5AjVaObGcB5xnuu4qw5VbKLhSOIzRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(956004)(54906003)(2906002)(66556008)(66574015)(316002)(33716001)(83380400001)(26005)(66476007)(186003)(8936002)(53546011)(9686003)(66946007)(85182001)(6496006)(6486002)(16526019)(6862004)(478600001)(6636002)(4326008)(6666004)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0Z1N2ZWQnhhWGNDS3ZyR3E4a25sNGhMQnEvSDNEUncrWTNHRUhzUktQbTBV?=
 =?utf-8?B?aW1INmpna21sQ0d5VHFIS1pMbGV6aEVVS1JlS2Z3QnZ6RStOaE1nVW1uT09k?=
 =?utf-8?B?elVpU3ZSSytiTXVTNGV4ditEY2czdE9xQlhjMkN6S08xVFpXaDJkUng4TkMz?=
 =?utf-8?B?N3dwY0NkR1NUU3Rqc3BtSWFjSE1pd3FHVmNDSnpIZTFpM2RCeTNUcjRuUlJi?=
 =?utf-8?B?eHVkV2NNT2dWNkduRmZPSnduQUd6aVFaZHZ4MUhEVHdZNWlqQ1czaWhiQUN0?=
 =?utf-8?B?SnhLTFdWTlEwaFZoaTJkYWNra25aaGFiRnBCVHJHeXlGNjMyUHRNdHdjWlBY?=
 =?utf-8?B?bWFweGFaTU1VT3FrZ0VKM2ZnMXBSSGw5SmtTWEVoSENCckJuZVN2bHloSWto?=
 =?utf-8?B?T09HUVZCR0lpc3gxcnNrdDZYcVhMZldXSC8zQW1SZGJBR2wvdXpoNEJtSlds?=
 =?utf-8?B?Wk91QVBWMUVpTGw5TTN2M0tueWtkS3hrNGpaNmp0eWN4MTQvU0o0eXdBeEF5?=
 =?utf-8?B?YzQvVFRwZlFDbjJLRTdCOWZZaFY3RmJYemlaN1BhdDBrVEN5QUFRbnVyVm1G?=
 =?utf-8?B?dnQ3ZEUxWGJQUFRjM2kxK29OVVBNY0dpaGN4KzJYcVJaalNuMitRd25odWFu?=
 =?utf-8?B?SkpIL3pVL2xnbzhZT09vRkVhVWRJWk02TmdPdDFzUG1KcFZPcHJKa0hyVHBh?=
 =?utf-8?B?aXozVWFpdHFVSUpCU29VNVN0bkh1SXZNbS9hR3YvR1ZUR25hNm93cWJkdzNJ?=
 =?utf-8?B?bldqbmlYQ2hBdXlZU1hJanUrd2RYQTF5RmIxWkVBV2loaTNRMEJNVjFXblJi?=
 =?utf-8?B?QXlSb295MTgwWTNpQXh6K3prK2YyMlpONEltZ2s4ZFJIblpRUHNOSjg5R1o1?=
 =?utf-8?B?cDNVSm0wbGN5a1BLU3RuUmM4RW81UE5na1Jjdlk5M3Vidm5jT3JhenVtS1ZS?=
 =?utf-8?B?VGdUTkFTRVFudHZEM0ZBWVdYVkdkZ2xTSCt2Y2FUNzQ0SDNSakpoaGp2NEl6?=
 =?utf-8?B?NUxkeWwrNW10UDJ1bXZ4eHZ4d3ZJMjJybWpMby9LQUFsQ3krV1lMd2NQV24z?=
 =?utf-8?B?V3dydTdoUHFXY3c3UEhFTTJoanB4cVVicTRmWC9tTkZocDIwaWI2eldsU0RO?=
 =?utf-8?B?WWFmYzlpZmpxNEVtZ0hPRk1Oa2h3YkRoQTMydFN5OUtBUlk4NkIzdGthZWJu?=
 =?utf-8?B?YlFMcGdvVWZ2UnpyRXZ6Q2NpUURuMGlWV3V6NGpJTSsyeG9JL1NJNmJxR1NG?=
 =?utf-8?B?TUlVWGFEUmpOS0hRR1E3OE1IWTE5dytoOSsrbjdCNjZsdDZJV1JMMjZXMFdl?=
 =?utf-8?B?TEU5aFZ0dXd5azJLMHVPV29vVmdYZGJWeVFGSTkxdzhOT2QrNVkzZldtMk9T?=
 =?utf-8?B?Wk14UWljM2NxVlhnaGxRNTZYSjMzaXp3L3U5UmdoVVRYVXN4eGE5VWFQWlVD?=
 =?utf-8?B?aTE2dnBOWjdUcFlwQzBaWUFrcjF2b2NIZVp2TU5PSnd1Sks0dXQzZ0FXZml3?=
 =?utf-8?B?M3JabGZoayt1SVVEaVlKbllEK055aWZvNnQxVWxXMVFGU2lQSWFRN0xOcHJC?=
 =?utf-8?B?Y1JneGd2VXFSYlhtR2YzbDZkc1dycjREUEtxcVRYcHZKNEVrWFVxa0dUTHJL?=
 =?utf-8?B?YnJtdmFDLzdMZnN2eFlTc204QWoxOHVZL3A2M1V1OXBKVG8vcUorUjJHa1Jw?=
 =?utf-8?B?SVliU0tEcnRDQlNERUx3eWtDcnZlYzZ5Z1VGMzZWLzVCcWFnTjlXQ1Ard2F4?=
 =?utf-8?Q?DqwuMjBwH3Y0SaUkRXiCrAYEQMJvFdJLi/u0pM+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6427c3a-61cf-4726-60d6-08d8c9ce5c6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 12:05:42.5401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /14aRT8UB1KgMPVenQWwM7nMQH2IHCUcXH3a4SH1tJFGzGj55oSqSfwXkgV2npVLdRp9tmWNAuGnOUm8TuDqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Fri, Feb 05, 2021 at 11:32:07AM +0000, Andrew Cooper wrote:
> On 05/02/2021 10:56, Jürgen Groß wrote:
> > On 05.02.21 11:14, Jan Beulich wrote:
> >> (simply re-sending what was sent over 2 months ago)
> >>
> >> On 04.11.2020 11:50, Jan Beulich wrote:
> >>> On 03.11.2020 18:31, Andrew Cooper wrote:
> >>>> On 03/11/2020 17:06, Jan Beulich wrote:
> >>>>> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
> >>>>> handler early enough to cover for example the rdmsrl_safe() of
> >>>>> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded
> >>>>> read
> >>>>> of MSR_K7_HWCR later in the same function). The respective change
> >>>>> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv
> >>>>> guests") was
> >>>>> backported to 4.14, but no further - presumably since it wasn't
> >>>>> really
> >>>>> easy because of other dependencies.
> >>>>>
> >>>>> Therefore, to prevent our change in the handling of guest MSR
> >>>>> accesses
> >>>>> to render PV Linux 4.13 and older unusable on at least AMD
> >>>>> systems, make
> >>>>> the raising of #GP on these paths conditional upon the guest having
> >>>>> installed a handler. Producing zero for reads and discarding writes
> >>>>> isn't necessarily correct and may trip code trying to detect
> >>>>> presence of
> >>>>> MSRs early, but since such detection logic won't work without a #GP
> >>>>> handler anyway, this ought to be a fair workaround.
> >>>>>
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> I appreciate that we probably have to do something, but I don't think
> >>>> this is a wise move.
> >>>
> >>> I wouldn't call it wise either, but I'm afraid something along
> >>> these lines is necessary.
> >>>
> >>>> Linux is fundamentally buggy.  It is deliberately looking for a
> >>>> potential #GP fault given its use of rdmsrl_safe().  The reason
> >>>> this bug
> >>>> stayed hidden for so long was as a consequence of Xen's inappropriate
> >>>> MSR handling for guests, and the reasons for changing Xen's behaviour
> >>>> still stand.
> >>>
> >>> I agree.
> >>>
> >>>> This change, in particular, does not apply to any explicitly handled
> >>>> MSRs, and therefore is not a comprehensive fix.
> >>>
> >>> But it's intentional that this deals with the situation in a
> >>> generic way, not on a per-MSR basis. If we did as you suggest
> >>> further down, we'd have to audit all Linux versions up to 4.14
> >>> for similar issues with other MSRs. I don't think this would
> >>> be a practical thing to do, and I also don't think that leaving
> >>> things as they are until we have concrete reports of problems
> >>> is a viable option either.
> >>>
> >>> Adding explicit handling for the two offending MSRs (and any
> >>> possible further ones we discover) would imo only be to avoid
> >>> issuing the respective log messages.
> >>>
> >>>>    Nor is it robust to
> >>>> someone adding code to explicitly handling the impacted MSRs at a
> >>>> later
> >>>> date (which are are likely to need to do for HWCR), and which would
> >>>> reintroduce this failure to boot.
> >>>
> >>> I'm afraid I don't understand. Looking at the two functions
> >>> the patch alters, only X86EMUL_OKAY is used in return statements
> >>> other than the final one. If this model is to be followed by
> >>> future additions (which I think it ought to be; perhaps we
> >>> should add comments to this effect), the code introduced here
> >>> will take care of the situation nevertheless.
> >>>
> >>>> We should have the impacted MSRs handled explicitly, with a note
> >>>> stating
> >>>> this was a bug in Linux 4.14 and older.  We already have workaround
> >>>> for
> >>>> similar bugs in Windows, and it also gives us a timeline to eventually
> >>>> removing support for obsolete workarounds, rather than having a
> >>>> "now and
> >>>> in the future, we'll explicitly tolerate broken PV behaviour for
> >>>> one bug
> >>>> back in ancient linux".
> >>>
> >>> Comparing with Windows isn't very helpful; the patch here is
> >>> specifically about PV, and would help other OSes as well in
> >>> case they would have missed setting up exceptions early in
> >>> just the PV-on-Xen case. For the HVM case I'd indeed rather
> >>> see us go the route we've gone for Windows, if need be.
> >>
> >> As can be seen from this reply, we're not in agreement what to
> >> do here. But we need to do something. I'm not sure how to get
> >> unstuck discussions like this one ...
> >>
> >> Besides this suggestion of yours I also continue to have
> >> trouble seeing what good it will do to record an exception to
> >> inject into a guest when we know it didn't install a handler
> >> yet.
> >
> > As we need to consider backports of processor bug mitigations
> > in old guests, too, I think we need to have a "catch-all"
> > fallback.
> >
> > Not being able to run an old updated guest until we add handling
> > for a new MSR isn't a viable option IMO.
> 
> You're trading off against issuing XSAs for all the unknown quantities
> of sensitive in MSRs on all past and future platforms.  This has
> unbounded scope.
> 
> Xen's previous behaviour was astoundingly stupid, and yes - we're
> playing more than a decades worth of catchup in one release cycle.
> 
> I'll absolutely take "care/tweaks need to happen crossing the Xen
> 4.14=>4.15 boundary" over whack-a-mole for MSRs in the form of security
> advisories.

I think I'm likely missing part of the point here - Jan's patch would
just return 0 for reads, so there's no leak of unhandled MSRs? Hence
I'm not seeing the XSA aspect of this.

Roger.

