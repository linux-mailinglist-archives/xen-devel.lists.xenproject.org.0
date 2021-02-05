Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A47310A4B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 12:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81623.150938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7zLd-00063T-8s; Fri, 05 Feb 2021 11:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81623.150938; Fri, 05 Feb 2021 11:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7zLd-000633-4Q; Fri, 05 Feb 2021 11:32:25 +0000
Received: by outflank-mailman (input) for mailman id 81623;
 Fri, 05 Feb 2021 11:32:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7zLb-00062y-Jj
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 11:32:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5f1d411-1cf3-48e1-a377-c6bf18ade084;
 Fri, 05 Feb 2021 11:32:22 +0000 (UTC)
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
X-Inumbo-ID: d5f1d411-1cf3-48e1-a377-c6bf18ade084
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612524742;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kmQQmcdcYR1qlbvU5mwSsGaJFWNh/dzbjzITAV278Vw=;
  b=PfDNu8fQGKr4vX5gEZMVNzWBT8M/I0Q68GcqVgBrexWeE/xrZyKH7DHl
   wOxLBWpjVrJ+7Za2dUYffJhnm/2FgwPtNnCF/Blu6NsOCm4XYq79wq0RV
   QDi1E3P590MU8XeClhAth8Cjppr08T43fhfLpUtl6rqqNDu7nbmVrQVdI
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3sL55lhBnClkfU06ag6FaD7Iw2BBIHEewqjbgZtYxobP+SmNWPi8N6NrNVn78IacAodf/CVtuR
 mTg472yMK3u3xDJBJB5eCaYH+6rOChrh1KJ4wYSIlWGQdL0Fp3NtqKhGtXPtVicAA7nWKvEsSp
 hRrqkXRt4kVvKQGE1xr56NCvU2n3o8LjzDr+EKsrY5QsGitadDkec1OEjh1M9lcmgDoAlcgSGK
 7D/ovTz2Ackoik2NrL1YzPNFKdyiUYqqi3EWznV0OiC49rS8F8XVAZ42HRzJuthGFg90bE1C19
 qDc=
X-SBRS: 5.2
X-MesageID: 36665032
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36665032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9csYst7JAHauj+9taIQvKTKDRM3so++G34LjSoK7Ki22OUCVq8aLBwmhhhL4DKRVcXEhyRtP1O+Xr9JwackwweE4gH9Ht6OI259v63OWMPYFhBfAXrf/8VEcYzHOGKmaZAbSSHpl1tVvwRA7u+XK7RaLwcRkQQehTqg2CALbbf2BTHGb6Wjf96KbnEzTQNdbUoskFT74J/uTH00IqIy1KL0mlP/Gn3C5YpitAzldgaUyIoVEvohA/tGUiXD8+FzWTk4zYkjITsS7rrCJSLMkcTpAt6tgGzeeD3cwF0wBGqMKtKMA1kRaKpFME4ZMz61Zun3/9FyFyTOB967Wv2sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmQQmcdcYR1qlbvU5mwSsGaJFWNh/dzbjzITAV278Vw=;
 b=V+juD+e65ilVzdKKhoNxV0I6v6hif2aNtMviyDnM3y87qYg1osAKx+9p5WEbI+FSWUl3eLPIw3ip4NjnrTLDaEfLCvtBcCzwglnqXDzFYOzox76NyPmXyiU9OdoAoDNH07LIzaLeXYe0prwv9rEXFXZiL1U8fjvmC1K4cj8q6hNiW9IvmQNVRXSEm6RnCOoxOrNDAdlxktW4AiA6wEhjRMirkYnkjvE/fBuFv1Msl/2CT7DXaQfikJ+4rzwsLMYxIAqwXU1Iol/T5lmZdHBNYMxAxkJPd+wuiso9EYBIDpu97669Aj015gFgdhwQE7JTGF61pdGMWyQ5+8jdXGu4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmQQmcdcYR1qlbvU5mwSsGaJFWNh/dzbjzITAV278Vw=;
 b=EoQ7FNvGhszKdtX1KgM/7MVldtiJNU1JbIU7qSkNEy0xEGDWVFWCXdO7uPCanQUWYycEXTD5xYCYq9hGOs5YlE+A9M3US0LMj3JFRSkgZpTs60aS3l9s7sZ6+US1nv91hMnbrwcnYs5VPlCBcXpgWlWzb8twFFqrnIlWBTf0uWE=
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
 <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7fdfac30-0c7f-f07d-fc7c-f7bb87b71a28@citrix.com>
Date: Fri, 5 Feb 2021 11:32:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b65dd0-eb5e-48f5-3f47-08d8c9c9af29
X-MS-TrafficTypeDiagnostic: BYAPR03MB4582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB45826E7B90ECED62DDD1B6E5BAB29@BYAPR03MB4582.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dm4/mkfzawNgpY+TQF86gj0h2PNlqmm69MR9LHIjWGvK/pb8Hp39L8Z98JDsqj3CSFAxPP76jjfpvckcrUu2aOK61KeqT+d8sAiQpqIQWFzwcMgpE7o2kRxElVEOPyFtANjNq7sG4ny/IQ65jD0BtYv37pxWT6zOtcdZv5CrriF5NSozZaQ8JsbD3ThGKgqNJ+IoVxkNz/rxCNYmQeVwCzpR4aPbuJAg5TMMqcxsN40Xx8BT51ZeuTt/RNWVG72ebbBI3Qit68JEwqCrqLRVecb2+R3xaoVksa41wtJv1ErHoQDHhLA4i0JodUIqfu1qqLq0o97F2E19Rw/eF6Uxjf6I8P5oEbSTQiDGCNgtL8Qbm6dIew57PXTkB44ZfYc0aQ8EAMgzxFaBGXabdzhE0xfaqpAtUCxwfnbvlT1SrFDw77e4/pHquDjhUCduq155mG/qA7nEkevD4AIXGp51imlcTxwDzofSQ/A3DpzEWa+frYky7dRe7PN9m+6UhycwR1JKB7L4wmrWGXaAgXCBfmNczmdHT8fVm2SSwUOkPKBmT/VwnJKHVxSDc6iMdfN/shdNYDPFx5IzyTgv9wlSQY/YQRb3nXad29id2j9oDDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(396003)(136003)(66574015)(66476007)(186003)(66556008)(110136005)(66946007)(54906003)(26005)(36756003)(53546011)(316002)(6486002)(956004)(83380400001)(2906002)(31696002)(2616005)(6666004)(8936002)(5660300002)(31686004)(86362001)(16576012)(16526019)(478600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2Y4NnA2d2JYRVNrbUxLUGxwQnhNWGtPa3k3bEFVL01vY2xEdUVldkRCcnRL?=
 =?utf-8?B?aHM3UTJBcWEzYWtuQkRFYXBOdFNQYUZDZlhKUWxvTlBya1NWK1k0RUwzZ1ds?=
 =?utf-8?B?UzZQcERyVE5BNVFNN1FNVW5KZGVaWkN6ZE1lRm1BQmZoR3FmM2pYNjZJN1d2?=
 =?utf-8?B?ZGNkSEdGM1UxbkUyUUNaYU81c29DSXpBcXZJSjBlZGp1OEJpYnQ1TVJJNjZI?=
 =?utf-8?B?REhnUG42MUhoUUd3WCtlby9hNDJybnRyV0U2dDZtZHdvS3ZONGhNbVBaTHAv?=
 =?utf-8?B?Ti9HckUyK1JtUHNreGpCdnJMRnJVelhWckpEZGVpQnEvV1NGcVJxTi8raUZP?=
 =?utf-8?B?TGdBaUJKRVk4R1JYeWxFSFYrSmd4cU1Db3VkbUwzNCtaRmNobkh4WFdtVExu?=
 =?utf-8?B?d3AyeFk3M3Rpd2thSVcvOE1NdXh2OVpzaEJMZ3RmTFRsL1pyK3F6c3ZhaDd5?=
 =?utf-8?B?TFJYZTE1RS9tT3pLWDFIdjMyRjV0a3Y1M0hsSUE3Wm5QUGUySUpNTmMzN1VF?=
 =?utf-8?B?S29ZN2lWMFRxQ3FJSEJDcTJrUHltbkdtdmdlZ2gwYzJML3cvY2srSFlzODFR?=
 =?utf-8?B?TkFFUE1xQW9RNFRxR0h1TGxNRXNxeFk4MmwwaVpydGp1dG92TVF0TFZTeWd4?=
 =?utf-8?B?UW81bXVTY1BIcWhqYS9SUVR1SUd1djFVREFvR3JiOThiUkovOWM5SjF3Y01q?=
 =?utf-8?B?MDdudm1oTTRhMnJCaEc2Vzd1OUQ2a09oQTl5aU5maHJyeERXT2gzY2RZNUJp?=
 =?utf-8?B?TmZvVVgrOGZCY2NpUDhycmJTMDFiTXIxcFlyYUgyQ25EbFJkUG50NkZRRitm?=
 =?utf-8?B?SFZHNXVuQ0c2VGJRNXNwTU5hQy9FN2Fxdy9JZ0lhRlFOdzBwMm8zTk0rdFpY?=
 =?utf-8?B?RS9mQnhMSUcyMzVkNG1CMGZtbkM1dEQyVjJ2LzdFTkpBSHM3RExLUlY2VjFE?=
 =?utf-8?B?b0NBc1lWeElNRjZxbVg1SUtScVR0R1M4QlJPK2dqdXBpdW1VWmEvTmZkdEdU?=
 =?utf-8?B?aW5NSEREMEorN2FLdGxNNm5zbGR2WGovVjZEaTZTMmlWQnBNY09Yb1U4aVJQ?=
 =?utf-8?B?UVFXRkdvdW1qVktRZno5dnE0ZnpDUkpydSt5RWFscWFoUE1VbzErTDZHZTRj?=
 =?utf-8?B?RkNCQTBCMnJ0QlI4Z3hiVE1vT2xvQVFyWVZKcTRLNVROMTk2V1NJeFNpUVNW?=
 =?utf-8?B?OXU3aXlqY21DeWNZckFCeGMxM2Y1d0VDMi9IaHo5SUh0TzU1Tmo3Q0hCS2pn?=
 =?utf-8?B?MEZZUk9JMWgwRzRTbjhvMkEzWU9MbDBOeUFPMUZzV3ZjWURYNThndjBZZkRk?=
 =?utf-8?B?blIzQnpXZG8xVHJYVFFQMWRoM0cyUmhxZXgrc3Z4MmxPVkxCRUFyTnJmMmg4?=
 =?utf-8?B?R0lZYkhoR3YyUHlXTm1iYUlMV2ZxbG1MK2d3WTVVbk12c3p3ODdPZTU5Ylkr?=
 =?utf-8?B?YTVMYmRYRGlQb3I5UFdIeFFnSjNreHc1dmlvTkhyUGtoMlRnajZwakk4U3Fr?=
 =?utf-8?B?bUtjTzJHMnpXb0c1SnlNWGpzUmI5UlZxRzZuaGx1Q3ZobXc2LzhabVBIMWRF?=
 =?utf-8?B?OE96dlcrR3VNMXdvUEhqaUJYc3ZaQmo0YmVOSDJCRnJwdmhaZlV1TmgvbEZ5?=
 =?utf-8?B?MWFyMmhkdGlWRGVYZkE4bHB1ZHJUY3BmYUE1TWkzM05LeFRMdHN1anNsQkdD?=
 =?utf-8?B?Wms4WVp1OHUwL2VMMTdnOTJWb0hTeHIwSHJyYUdLc2syNm8ySEZxZGlRUW44?=
 =?utf-8?Q?7wvWuG2hwP0aXwPKBtMm8mSaTdEIVdKNRq0ypsL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b65dd0-eb5e-48f5-3f47-08d8c9c9af29
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:32:13.9769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoatxHEG3aNeI9rl7c5L5r/VkR1gPMYQWsPchy28AIwLlpYnfFCy4+7DwSx2XqQuzNxTyOlhUi0bKkYKBL9sFEJB0AaVYgmkGgxw6az1RAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4582
X-OriginatorOrg: citrix.com

On 05/02/2021 10:56, Jürgen Groß wrote:
> On 05.02.21 11:14, Jan Beulich wrote:
>> (simply re-sending what was sent over 2 months ago)
>>
>> On 04.11.2020 11:50, Jan Beulich wrote:
>>> On 03.11.2020 18:31, Andrew Cooper wrote:
>>>> On 03/11/2020 17:06, Jan Beulich wrote:
>>>>> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
>>>>> handler early enough to cover for example the rdmsrl_safe() of
>>>>> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded
>>>>> read
>>>>> of MSR_K7_HWCR later in the same function). The respective change
>>>>> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv
>>>>> guests") was
>>>>> backported to 4.14, but no further - presumably since it wasn't
>>>>> really
>>>>> easy because of other dependencies.
>>>>>
>>>>> Therefore, to prevent our change in the handling of guest MSR
>>>>> accesses
>>>>> to render PV Linux 4.13 and older unusable on at least AMD
>>>>> systems, make
>>>>> the raising of #GP on these paths conditional upon the guest having
>>>>> installed a handler. Producing zero for reads and discarding writes
>>>>> isn't necessarily correct and may trip code trying to detect
>>>>> presence of
>>>>> MSRs early, but since such detection logic won't work without a #GP
>>>>> handler anyway, this ought to be a fair workaround.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I appreciate that we probably have to do something, but I don't think
>>>> this is a wise move.
>>>
>>> I wouldn't call it wise either, but I'm afraid something along
>>> these lines is necessary.
>>>
>>>> Linux is fundamentally buggy.  It is deliberately looking for a
>>>> potential #GP fault given its use of rdmsrl_safe().  The reason
>>>> this bug
>>>> stayed hidden for so long was as a consequence of Xen's inappropriate
>>>> MSR handling for guests, and the reasons for changing Xen's behaviour
>>>> still stand.
>>>
>>> I agree.
>>>
>>>> This change, in particular, does not apply to any explicitly handled
>>>> MSRs, and therefore is not a comprehensive fix.
>>>
>>> But it's intentional that this deals with the situation in a
>>> generic way, not on a per-MSR basis. If we did as you suggest
>>> further down, we'd have to audit all Linux versions up to 4.14
>>> for similar issues with other MSRs. I don't think this would
>>> be a practical thing to do, and I also don't think that leaving
>>> things as they are until we have concrete reports of problems
>>> is a viable option either.
>>>
>>> Adding explicit handling for the two offending MSRs (and any
>>> possible further ones we discover) would imo only be to avoid
>>> issuing the respective log messages.
>>>
>>>>    Nor is it robust to
>>>> someone adding code to explicitly handling the impacted MSRs at a
>>>> later
>>>> date (which are are likely to need to do for HWCR), and which would
>>>> reintroduce this failure to boot.
>>>
>>> I'm afraid I don't understand. Looking at the two functions
>>> the patch alters, only X86EMUL_OKAY is used in return statements
>>> other than the final one. If this model is to be followed by
>>> future additions (which I think it ought to be; perhaps we
>>> should add comments to this effect), the code introduced here
>>> will take care of the situation nevertheless.
>>>
>>>> We should have the impacted MSRs handled explicitly, with a note
>>>> stating
>>>> this was a bug in Linux 4.14 and older.  We already have workaround
>>>> for
>>>> similar bugs in Windows, and it also gives us a timeline to eventually
>>>> removing support for obsolete workarounds, rather than having a
>>>> "now and
>>>> in the future, we'll explicitly tolerate broken PV behaviour for
>>>> one bug
>>>> back in ancient linux".
>>>
>>> Comparing with Windows isn't very helpful; the patch here is
>>> specifically about PV, and would help other OSes as well in
>>> case they would have missed setting up exceptions early in
>>> just the PV-on-Xen case. For the HVM case I'd indeed rather
>>> see us go the route we've gone for Windows, if need be.
>>
>> As can be seen from this reply, we're not in agreement what to
>> do here. But we need to do something. I'm not sure how to get
>> unstuck discussions like this one ...
>>
>> Besides this suggestion of yours I also continue to have
>> trouble seeing what good it will do to record an exception to
>> inject into a guest when we know it didn't install a handler
>> yet.
>
> As we need to consider backports of processor bug mitigations
> in old guests, too, I think we need to have a "catch-all"
> fallback.
>
> Not being able to run an old updated guest until we add handling
> for a new MSR isn't a viable option IMO.

You're trading off against issuing XSAs for all the unknown quantities
of sensitive in MSRs on all past and future platforms.  This has
unbounded scope.

Xen's previous behaviour was astoundingly stupid, and yes - we're
playing more than a decades worth of catchup in one release cycle.

I'll absolutely take "care/tweaks need to happen crossing the Xen
4.14=>4.15 boundary" over whack-a-mole for MSRs in the form of security
advisories.

~Andrew

