Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F55308FCD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 23:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78536.142875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5bwE-0004IJ-UM; Fri, 29 Jan 2021 22:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78536.142875; Fri, 29 Jan 2021 22:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5bwE-0004Hu-Qp; Fri, 29 Jan 2021 22:08:22 +0000
Received: by outflank-mailman (input) for mailman id 78536;
 Fri, 29 Jan 2021 22:08:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5bwD-0004Hj-JI
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 22:08:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3f9b6e7-ff45-47d8-97d9-7725b36d74a1;
 Fri, 29 Jan 2021 22:08:19 +0000 (UTC)
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
X-Inumbo-ID: e3f9b6e7-ff45-47d8-97d9-7725b36d74a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611958099;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E2zxGlu6UFyp9YWLyRlvG8Tkp3Af1ul8vgphw3tB7P0=;
  b=bn8T2dQfg+wqbCArwhINoajbm3PpLfWheRxgyskWwiq+uz4AjCODMAZx
   mMGKDQC9dzPhRygMADReFcdzfNC6u9f63261zBCyOsDrtwz2Pzj7KJXNL
   qPfWyQarRxqlOyistDFiQVhy3keQULW/21Wfq8B/EH9lX+8ciEPa/dCKD
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ii3bJQ9wrl2Rs0VmkwV1E425Gv5UnM7RkF7J2sGhfETt3xABYiIgul+ovSBdVG+EDx8+x60D0H
 HW67qDZjsY/wJVfH2LT6pL/YHxAPoCHTTb1wWiXK778pEMJzKiyNGhCJQ3JKX3INGhWFvfeJcc
 JrWTZDsN9BZuCCSbUW4dU2WGmcv9efGIWVRjtaIQ6vGrJITyIThBYp/L3ctgYiDUUDaRnqlRhv
 f5aMx+3M0xOmKQt1HH+XicNNrJkkJSUG/xF4DNjacqt12M90nHSpXqLlKS9jh7HibBB2Ygfyuy
 unQ=
X-SBRS: 5.2
X-MesageID: 37517067
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="37517067"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR39gu8CLreG7DVODD5IT3T0MVDhJpHUGw5scXmRMsrHEEXphJm8fkee7kKWtrm1/rLfb5up/J59SaA86pYyAFjoBevt+5595QFdBoTeVldqyj1VkS+PiJjci5y6PLcioRBfANTSxnwmwzljHXXwx7Gjxz3f+K+wAS8bc04cm0slPpeeTjNWePDlwrk/zyatqynAdYdi+X2vpAsPzUc786DA7MbLkF6RHYjwH6rC3E6r8JtA4caaw9uLHuAu8EvQpVWevAZWz6Zk3VLewHI/KD+Jd74FpzNnssar0IhixZ15krRa4Fg31GMyR4/N85ECeOyQrIB7s3G6k+wb+vngIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp6uXK5EQx2tinS2k5rBse7bcwefxSb7M+RGMrG/nBM=;
 b=oQxQItPBw6pFURBJVJJpHFB04r1YeRX7yBj3fbMwuiDYQiI2kpfzcMr+NkMb4A7TRaoWA5P5F74zVWh8H9CIXXLfNJ0drYb63Xr/6k8gcKU5/R8gydxJx39vF5+Qa6TltI28JnODsb4wOVb5l16Sx6mOit/eBI8ZZUT6DCx1o6f7hM0MKZUuYO2h6IacahJAthQvRtdOnAlCORKSp8nC6PAe6oEcR+E+twgoUZvx0wlhLTbQ/ITtxck8rknR8f/gZuDQO6naxOyWW+JHIoIHstgdiEWat639O0+nwzeMxiMRtv9HrYG5iJnW/6Fx0slcpBv/n/z5Rkz8LAErozSUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp6uXK5EQx2tinS2k5rBse7bcwefxSb7M+RGMrG/nBM=;
 b=BEFYpl9+V+GqiHMYl6lX7CExSHfbdCu8gk0+N0gvZgi3Wg4IjiW7fU6UCOJxFjaqN9z/uYuBMk33V+cErEK5FKlAyojOVSNIDPgtI60QgYjB/TibpiO0c1ewtA9+YJYiTx2la3dKdWyQPxVbRsOBEyol7e6ngjSTW9M1L/h9ulQ=
Subject: Re: [PATCH v7 05/10] x86/vmx: Add Intel Processor Trace support
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-6-andrew.cooper3@citrix.com>
 <9fa8ff47-cd09-a09b-6d62-bb47f72c3847@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a77e3a2a-2935-3ad8-b45a-4c4b82b78091@citrix.com>
Date: Fri, 29 Jan 2021 22:08:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9fa8ff47-cd09-a09b-6d62-bb47f72c3847@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cdd6eda-04ce-45fb-080c-08d8c4a25eeb
X-MS-TrafficTypeDiagnostic: BY5PR03MB5268:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5268AD43B780510740AC07C4BAB99@BY5PR03MB5268.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IikRcTVRaJCgGKJgFSuWw/Lm+SCeCdcOBUPQlp5cpnJxFRA7DtJZz6noTfWpffGfudOVhRCvjUUyFWFs3dBg667P2S3VUJbdpheK2Xw2cN56fdhfUT5m/kP8y0pWmlIjBTSxs6tQurHWBp1VELSP53u0f/75C/6CzZJCyJ3uIN9YSgRsWVSSwgz0EltA3SpVLQm+J7vMHeJB7SziDIUcsca13sWTD5c8YuR34LO1Uc2jNdxjwPlQ+gi2yjJXDk28Tr7/sJMyZ/OE5zW8LZJUGgkQqZXFTWaRR/WFXioR202RJuP75tIFoiFbQoCISJS/V7aJI4eTv90XRtzxcPwtYqdOpkDwJwJnZDjpBqEuVLeZFTQSWx51L0OKFR+5SV11QeV5zkFpQIFxa6RR2PJoQo4JiXK3CZN6eprlRbRi41PpPluY/gKkyhyzMIe/EdsJgbVrQ1ZsubDirOZrfzkF1xzII1HA2Oir61xxJHEHiftU0IFxKUfk3sFHqJcbLbmhBp47i9kCDWi+fZ9FaclRtcZrkqg4CPCQsZmth38zR/l0kIzdc6efb6X6xnZvEcDdRmbm4S02jW/UE9X7/6auBLCatJ/a1rIR7TCmakdB+iE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(6666004)(2906002)(26005)(956004)(478600001)(2616005)(16576012)(86362001)(54906003)(316002)(36756003)(4326008)(6916009)(5660300002)(31686004)(6486002)(31696002)(186003)(53546011)(8676002)(8936002)(16526019)(66476007)(66556008)(66946007)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWZjOWVWeHA0Yjl4dXRCWUJLMVNwc3l5VnF3RmRKNktOaHhoQWdZWGdGL1Iy?=
 =?utf-8?B?TnpIMXVSbWtrcGN4a2hqai9vUUNNcXlIckRwZzBwaDlmYmVUSzRUeGNkZlBM?=
 =?utf-8?B?cFRwVVpnSzJvd3lXKzhCeG02SGZRT3lHYkhHTExCMHhac05GR01RaDhQbTJH?=
 =?utf-8?B?ejNOeEZLT0JscUlvakppMWV6SFpraXJjaUtMZW1YLzZmaklhNU1kOERzYURW?=
 =?utf-8?B?Y0VTSjM4NHRjMmtsNnphSHc0U0dlWEo1bVBZRHhBZ2J0M1BzVk9qOEg0VUFB?=
 =?utf-8?B?dUEvLzExd2xPcFhPeXBlQ0tZVzY1RVNnbFJKM3VxVWdhYzFnSFNOaHQyK1Zv?=
 =?utf-8?B?a1BhOUNITjljNjBrK29LMGxEVFp1eFU2T1dBTkxNZXMzMjFBUXhlVXlmZG04?=
 =?utf-8?B?cFVNZVdZRkREZHNqc21scXNOdlBFdHRTcXpwRm95N3lOTVR6TjRkekd1eGdJ?=
 =?utf-8?B?L295VEEzSStUZDNEQzZ2Z1dHWFBROUt2ZndhUVpVK1Z1U0VXbFRiUlVqeWFC?=
 =?utf-8?B?WTVSOWc5a1EzRzlLTmwxcDQvUDM2UnJxUFN0T3hrWkgrd0FUZjBsTUhFcnBP?=
 =?utf-8?B?NUxYbHgrSkFUU1hJeDVTY2pUbnY0YUNJdGE1d2dLNkhIRjhYY2FDZG1FMzYr?=
 =?utf-8?B?OUpsbERIMnQ0bmo5MjVRU093cmZvZjhZRnFOUTRrUXdtT1JSRExOV0VuZ2li?=
 =?utf-8?B?MFF4NThCNmxOWkRWdlMvUUVHajBtVGJYU2Zmb2pKNk43NUhOalhsS2Q0bGZY?=
 =?utf-8?B?eGhIT1lRWnBjcnNnWEYyaWhiajNIdkJ1bXZPMHRaQ0luT2Y2MFN3bFZsZXNM?=
 =?utf-8?B?RTdDaXIvQUpEN2p6Q0dBdnhxdXl6b3hFU0M5alRaNlVJZCtudmp2UVIvWUx4?=
 =?utf-8?B?ck16cFNqVW1VcFd2MCtSemZhc0g3MkR4d0lodEhodDEyanZlRkgrcmpBRVEr?=
 =?utf-8?B?N0tMUGtxZU13SUxvTDhtQXRTYWlTd2FQN1FXQmNRZkFTM2diRDF4TnpTV1NR?=
 =?utf-8?B?anNoTHNlYXI0WHFZRVFmN0lDeGIyYmNORjdPUnBYblRzc2FYUXVVQnpiOHAw?=
 =?utf-8?B?djRibjFZSHlBUDNuS2N1MEp6Znd4bURyYzBQMTlQNDlCZVFFOXVpTlpxdG9l?=
 =?utf-8?B?bnMxbE9TSXEzWmxIT1A4RE45bEZOMXBJYXFwYUNSU1k2bi9XRXZpVE9SYzhp?=
 =?utf-8?B?Rmx0WCs2QU9QUVJQVGNDbWx4UFhicGE5STI0VSt3VHd6NVUzTG50YjVCc3lL?=
 =?utf-8?B?VFJrcE9DRlViWko2RnpaVFlkQlBDTnVURnRGS1kzWm5XUlBKRUlLc3BpTUFQ?=
 =?utf-8?B?eVJHb2JTdkYrbDRQaW1MQUxlMkZwcmFKYXdhMkpjdGY4c2szd0FYOElpazBV?=
 =?utf-8?B?SEhoZk12UWIvdXRnT3F0Ui9kQWsvOUYwODVsZmxEMDNYV1hRaGFkVXVNN2F3?=
 =?utf-8?B?TWVCeU1udG9obTY2VFBVWlZlb1I4eWFtUUpNbFdBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdd6eda-04ce-45fb-080c-08d8c4a25eeb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 22:08:13.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNCVCl2kZtfCuL3kGwKRvqNp5VA0zbHjM77S++c2lPpWVlh1n1j3FF20Yezg7CCrMruSB8O/qxNjGfErMInoi/ll5rTp8UBYp4pv6yC1g74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5268
X-OriginatorOrg: citrix.com

On 26/01/2021 13:35, Jan Beulich wrote:
> On 21.01.2021 22:27, Andrew Cooper wrote:
>> --- a/xen/include/asm-x86/msr.h
>> +++ b/xen/include/asm-x86/msr.h
>> @@ -306,6 +306,38 @@ struct vcpu_msrs
>>          };
>>      } misc_features_enables;
>>  
>> +    /*
>> +     * 0x00000560 ... 57x - MSR_RTIT_*
>> +     *
>> +     * "Real Time Instruction Trace", now called Processor Trace.
>> +     *
>> +     * These MSRs are not exposed to guests.  They are controlled by Xen
>> +     * behind the scenes, when vmtrace is enabled for the domain.
>> +     *
>> +     * MSR_RTIT_OUTPUT_BASE not stored here.  It is fixed per vcpu, and
>> +     * derived from v->vmtrace.buf.
>> +     */
>> +    struct {
>> +        /*
>> +         * Placed in the MSR load/save lists.  Only modified by hypercall in
>> +         * the common case.
>> +         */
>> +        uint64_t ctl;
> IIUC this field will be used by subsequent patches only?

Correct.

~Andrew

