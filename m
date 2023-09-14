Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8107A0717
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602300.938785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnAB-0002lX-Tr; Thu, 14 Sep 2023 14:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602300.938785; Thu, 14 Sep 2023 14:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnAB-0002j1-Qm; Thu, 14 Sep 2023 14:17:47 +0000
Received: by outflank-mailman (input) for mailman id 602300;
 Thu, 14 Sep 2023 14:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgnAB-0002iv-8q
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:17:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2080.outbound.protection.outlook.com [40.107.13.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78dca31b-5309-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:17:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 14:17:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 14:17:15 +0000
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
X-Inumbo-ID: 78dca31b-5309-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+g/7PuOPkxQpAs02C0Xuyrq8tPc+r0yXBpLlUX/bMOneOrVy2bzPtP4L5o632ZlJdmCXySV25DuhWJZBDQAAcoDZ9+Ttg9eAIlFg9PYJ6lUIOlERumREqz1CSCEB1N/W5YFR0P83YpDey1WtBqrzBADZkuTuxdSzpt2lACigSX31S94huEpHD2f4vSOzcvoGHnTABst/XFPD4FXLYAmwnd6x9MatKlPJ5fVtmHbbHhfdWYtBaH6Q6qgbbgRwt96L9iKAQGJiOeky555OTLTI3cgg7OG8g5bQfBREzH6Y8ykz1cTszl41wjN/ikbFNzUdAnUG6nIgpw/7RsJOLNWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIIMpnk0jTAW5p16Gmr9FOBn2wk2mHvhSej75VSPLkc=;
 b=NCXjqBzLOreBcX7s+PAMLu5f9o4PFuKS3uThKRLtBVyoWdeuMPRtisaDAeabUhvrVvF7wjjfbsA1eAJQhuafqogf7qP1hjRJBtd9jltHOhSmCza1B57SdKDatjctfsxeP1HQMR6zoLUB41zDV7o+KPwyn3DeVbtM+Kt5SeOGJvAWAgh9Rl0oIvTxjMGbAO+yUVx0nLSZI4BRua5s0coff6HjgQbUCtEAla42Q71nOJBAsqkRgwoH57+jSeuKLf8Q/ZV3ac/OEEuUZ1MIbIa6Df9XGh5M1x9MwgKpSGz4pTs7PN3ravGbxSYkZcayMWSbD24xUgd2deXhreliXGq28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIIMpnk0jTAW5p16Gmr9FOBn2wk2mHvhSej75VSPLkc=;
 b=MCD+8U+cFMitM9KQWEws4YFN9dCwKUK9k05nj20ET2r7+nWEZ9QZxhV1m8MvRaKelaD3zpJGeS7lKpRZnpuymGmNRP+WavW3Ube7ZgrmOkYtm9/GyCK0aw9XlkgNVFCH1k1PWopK/pD+/o0n2I5UIwF+TOaSKI/vBFwve5Q0VZdukWxLuY4Eno4QIBZO7lmiET053q8sS5AA92Mavv4jU2cnscSqwl2MU8K+MdYNr7S2FiToSRifDnwSGL+cQg/f41FnU7vE+0BjBVNldXHaS3ks3D6C4oAX9WFaimqfRKRBs8tJsfAtlfmSG6NR2jfn7cDwJxKOpIPRMuvWkYKQWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20ad6fa9-756b-45dc-c16c-e9af0ecff7b4@suse.com>
Date: Thu, 14 Sep 2023 16:17:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Sol=c3=a8ne_Rapenne?= <solene@openbsd.org>,
 xen-devel@lists.xenproject.org
References: <20230913145220.11334-1-roger.pau@citrix.com>
 <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
 <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
 <e8859459-53dd-aa02-b776-ba4052c7ffff@suse.com>
 <ZQMDOwGGNJVnjFEm@MacBook-MacBook-Pro-de-Roger.local>
 <8b791d74-636e-6f79-2918-4bceda1905e0@suse.com>
 <ZQMNJfmoOmIIp7GD@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQMNJfmoOmIIp7GD@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9afc2b-ef8f-42bf-db03-08dbb52d4bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TVLaKLHUXdSyzpFixQ6PIA5KbyHD2ckqCyzh7xW06r/98vAadSiAT6mrAfGWXOrEpun8OFDX6s9eh07cD9L4aLAneC+zPR5R+mC6k/hCN1Y/5XV73GFwiZDATt7QCSdeYxciwWV8ApiAlUxoedSgiqoDpbw21aR6YHArbL05m8QheCdW90ggAROUT1f1nIAbD8lqaRvi5Q+8nSPHhWtm1XTNaWY7Vvv7aGA4fGXuJz2pFl4V0L5plTS1jDScZ4je5MWRGblpQEf9YKz5sK3+FMuz140tWlfNTT9t49QKbRDZRLPyW9cervgDgyasu+snvmLDNf1h8bq7SrvjiVwn8/N4rYhjQ8esSUVdEcgoQoHNkd8SgCirQj1D1+wRl2vWUFIYxOgSUNOS0aFITtFYseGELh9r+cCINAAj6ILipvPEp+pF0OKs9boiDA0duat0g6LDmHZwp6Da7fRL15ZU7H5aya/36CEiB7MzPiNwrFIvEaqpC7fZLbyMMOf+WQxiQt2i0HrB4y3BRX5uZXvppQxF4sacgki/tIASWvEIGc9apZptMnxYgRMOMo8UcmiOy3ZOLGZ2sfKmhxhFzBUSyYA7zQsz12vX2jUNkf5eXSqpBBLQdfRQ6ujvvgBtp6zEb5aI4SXXMYX9ChPxsTzJUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(186009)(1800799009)(451199024)(31686004)(36756003)(86362001)(31696002)(38100700002)(6486002)(53546011)(478600001)(6666004)(5660300002)(54906003)(8936002)(8676002)(4326008)(66556008)(2906002)(6506007)(66476007)(66946007)(316002)(83380400001)(41300700001)(2616005)(6916009)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEdBYmZLY1ZzaWV4VzkzNjBHUGlkMUk2M2k0TkZKVWJ5cGg5MmNaWGc3L3Ey?=
 =?utf-8?B?TE10bW5tQnBEUVVQMHB4eDRZclUwVHNLdHhGcklETnhXRGFXY21QSzJWZEJZ?=
 =?utf-8?B?dmlkeVNQTWROeU13TE53UDVoUEp0dDc1VVhzb0ZjOGQ3dVF0R2gyd29TVnVu?=
 =?utf-8?B?MnYveFE3bkFZdUlEMzBsT2NyU3QvNDBDNk0yR2ZoRXdiMjQzUGtjNzFWNUYv?=
 =?utf-8?B?QldpcS9XQU5kYU5mSFdCcDFzZWRHV3FIQ0hPVzFPMzVZcWsxNGhKQXE5Tmk3?=
 =?utf-8?B?L0xqNXg2aDR1RWlFNmRVbXdMNnZMK25SSjhpeUxQT3pFR3JZS0xsL1JWZ2JG?=
 =?utf-8?B?ZUV3RUNSZEVGZ1VrM0VjZnlvMWozeU1aSUc3U1REbmIrNlM2U296THJuZUJ3?=
 =?utf-8?B?UXpFUE5Idmtya24yZGVtMXBlZmVTREwyMUZIaFR4dGs0enFZSitYQnNmWisr?=
 =?utf-8?B?OUwwUklDbk05djJrc2dhOWd4dkIrUEFHbjlHTkRkVEExVWdPcmlTTnlaTm5a?=
 =?utf-8?B?cThTOG5xajNEODhmait2Mjk2RjZTdHVVemJjSHpCdmFpOXVwZGVUMG9CVXlM?=
 =?utf-8?B?cVhvUXhLNUhZUkdjM2UwalBnamxUcjE1US8wR0NQWitDVy8wOHhHNEZtK0Vx?=
 =?utf-8?B?aTZLM3B4SlR1Z0IzVlVmUkVaZFBueDhHRERvTkdTSWk2eHBrZERIT1VON2dF?=
 =?utf-8?B?cGxTQWtpTmhoeVBSVHZjYmRhTVA0c1JMNmpOUExueEpNL0RRSXFvQXI4ZVVE?=
 =?utf-8?B?MDExMVdjRThMalVOeWRIVHd6eGx4cVcyTTM4SkQ0aXpKQWZuMHo0VTN6NUl0?=
 =?utf-8?B?eWQ0MTVFNG94UWpnMnc1Q0FRMldYTFBTNTZXR2RqOElvWEp3cXJBdFRLcnNm?=
 =?utf-8?B?a01mYVYySFdnc3plOGJhZ1N2Y2NwcER1UEdYUWxqUlgrSHlmQ0xIVStiWWE2?=
 =?utf-8?B?TGtuMmZTM0E2K05MRkJkYzFVcnNtRncvOVVtNnpHUzdVRnRwNVZPSWdmNVlu?=
 =?utf-8?B?QUFYVElVZExZWXhsNDRibGRUWE9XTTNPdWVWTnpINmo2REJXaWRndXlVN1gr?=
 =?utf-8?B?SVhFREkyYmZiZWQ4b0N0WTlCVkthK1IxR1hBSXl4QjRjWEtIdXdkZkVYSnVS?=
 =?utf-8?B?eXdZY3IrOWJSNjNEUTFNWU1uVGNVQVM1QmVzMzhZNDVScVl0TzRHVjN0Y1Fy?=
 =?utf-8?B?S1lETEtXdU1sNVFMVEcxNXhVK2FQMW9HVWE0bkZKeVhyWHdmZTFpR0xVcW1R?=
 =?utf-8?B?d1FVd0pKTS9ucW9OQStRcGRwenB0dmdvUFJhKzl5SUpQL3VQb0dMZkRXTW51?=
 =?utf-8?B?REsyNUxLdmdsbCtUbFRDRzNJU2ZTc2NhOFpMRVNmdmxxcTZ5VjF0UkJLTDlW?=
 =?utf-8?B?U2NueHJWN2liTmF1ZnUxUGNPMjh2cUFmRThaUG9NaG5WMWlsSDVpUFhvOWhI?=
 =?utf-8?B?Q0RkRHBuT1FUcTZiL0FLKzZBSXYvK0pUOVNudDR5MUxGWll4S0ZwQ25UQzVX?=
 =?utf-8?B?VXBDaXQwWjRiVlZSU1VJbldzT3RmK1IrSlROeEVnelZOR0Q3aE9uM0M0cE45?=
 =?utf-8?B?OWd3VGt0OGlaSnBqYzJwS3NoRFRYbTRsR3hKa0d2akJQRS9DdzYrUllscUQv?=
 =?utf-8?B?U3Z2ekNKMWJvSHp3MzhuRGZRY3NJWGcxdlhwY1dQZEtONU5NcWUybWVPZFdr?=
 =?utf-8?B?VGx3Y3p6Y1BONHRHYnZlTG9LZzZ3alZOZ2EwMExPNEcrTnRDOUlIMXQ4YlM0?=
 =?utf-8?B?TlF4N2dlaGxJQUttclNiL2JrVm0zSWlyckNaM24wZEpZVnJ6dEEzWUlKQk1R?=
 =?utf-8?B?aGtidU9GbmtIcG5ENlp4T1FJZS9oYU9RdW5mSlpIRUZTM3MvS0tBYnFqRGNX?=
 =?utf-8?B?dkdCQmxlc3JtR1d1d0pLQW83L1NwMHNZQVhxZ04zTHM4MTkvN1hYeFhpekdR?=
 =?utf-8?B?bWoxVWNQYmgrdWNOendBbmZxSlZodlZZMnY5RGZSeWJqZlJ4R0h0bDJXUXVn?=
 =?utf-8?B?L1ZGVFBjQ0EwL0hldFJtUW5Fb1hXR1BDaktWSjh4ajZzMzhma3ZEUWZjYW5q?=
 =?utf-8?B?VEZTUXNmbGJsK1dCWnpWYlJMd0srOVN1ZnlCK2E0bmRRSWpRdkZpWFNGdXhD?=
 =?utf-8?Q?7v4d9chUtJmUJTrLypKi0klSZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9afc2b-ef8f-42bf-db03-08dbb52d4bf7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:17:15.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxTIU2lWJDpx4wxgN+mKbApiib9f8De9irbI47ypxnO2ShVjWATBevhYylmRnSq6+dCDpZM6APqP9Jt2WtowAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213

On 14.09.2023 15:39, Roger Pau Monné wrote:
> On Thu, Sep 14, 2023 at 03:16:40PM +0200, Jan Beulich wrote:
>> On 14.09.2023 14:57, Roger Pau Monné wrote:
>>> On Thu, Sep 14, 2023 at 02:49:45PM +0200, Jan Beulich wrote:
>>>> On 14.09.2023 14:37, Roger Pau Monné wrote:
>>>>> On Thu, Sep 14, 2023 at 07:52:33AM +0200, Jan Beulich wrote:
>>>>>> On 13.09.2023 16:52, Roger Pau Monne wrote:
>>>>>>> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
>>>>>>> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
>>>>>>> HWCR.TscFreqSel is set (currently the case on Xen).
>>>>>>>
>>>>>>> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
>>>>>>> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
>>>>>>> TSC increments at the P0 frequency.
>>>>>>>
>>>>>>> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
>>>>>>> because the PstateEn bit is read-write, and OSes could legitimately attempt to
>>>>>>> set PstateEn=1 which Xen couldn't handle.
>>>>>>>
>>>>>>> In order to fix expose an empty HWCR, which is an architectural MSR and so must
>>>>>>> be accessible.
>>>>>>>
>>>>>>> Note it was not safe to expose the TscFreqSel bit because it is not
>>>>>>> architectural, and could change meaning between models.
>>>>>>
>>>>>> This imo wants (or even needs) extending to address the aspect of then
>>>>>> exposing, on newer families, a r/o bit with the wrong value.
>>>>>
>>>>> We could always be exposing bits with the wrong values on newer
>>>>> (unreleased?) families, I'm not sure why it needs explicit mentioning
>>>>> here.
>>>>
>>>> Hmm, yes, that's one way to look at things. Yet exposing plain zero is
>>>> pretty clearly not within spec here,
>>>
>>> As I understand it, the fact that HWCR.TscFreqSel is read-only doesn't
>>> exclude the possibility of it changing using other means (iow: we
>>> should consider that a write to a different register could have the
>>> side effect of toggling the bit).
>>>
>>> The PPR I'm reading doesn't mention that the bit must be 1, just that
>>> it's 1 on reset and read-only.
>>
>> Sure; the PPR being incomplete doesn't help here. My interpretation, based
>> on the bit having been r/w in earlier families, is that AMD wanted to retain
>> its meaning without allowing it to be configurable anymore. Possibly a sign
>> of it remaining so going forward.
> 
> What about:
> 
> "Note it was not safe to expose the TscFreqSel bit because it is not
> architectural, and could change meaning between models.  Since HWCR
> contains both architectural and non-architectural bits, going forward
> care must be taken to assert the exposed value is correct on newer
> CPU families."

Fine with me.

Jan

