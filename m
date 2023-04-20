Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC5F6E97BE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 16:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524312.815161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVhE-00011r-I7; Thu, 20 Apr 2023 14:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524312.815161; Thu, 20 Apr 2023 14:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVhE-0000zg-Eo; Thu, 20 Apr 2023 14:55:40 +0000
Received: by outflank-mailman (input) for mailman id 524312;
 Thu, 20 Apr 2023 14:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppVhC-0000zW-MZ
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 14:55:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68ece81e-df8b-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 16:55:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 14:55:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 14:55:34 +0000
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
X-Inumbo-ID: 68ece81e-df8b-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvouuGhvgUd/qvo8vsfAkA6dQV8T+MZDc6Jq4mMA8d2pAUj5mSPog8kaADb6/+WGDasaFSS9d6oBla3jEUlRw/but3cie4meXUqV2QC6rksHaWQBjEtq9YuAT7AvGVOHoNuAHCnp2eH3swmUnPOnAeFklGTo+XNJ1qBnLwh53jC71eCAVgyy1rx4krOH5ZZw0HBMvgWWykCvERsSOLFX+xc6tkEEkMdOLuXenhC5DdQH7Vbnzqvr44sYHuvp8z9T5eMpa0XZJ86isOCc0gtJr5jHB+U6Pud6bQxaWR+TTXn8m1aafW31LAENNoBFQ8L173rbPD7zK3bdaezNISd7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wThXQbyC/G5eLouaVldG04k+jzCpyz3zziIZopr+s4I=;
 b=CmN869umJQbv81gaDjW6UNnbTlVcOqIgDx7/1DJptviPxekr1UH8HOpuNDnm/2xKbI7VJ3wEjHsCE19RgoljYnrhOBrVVx+LehTzAxJy19r38yjPM6HdHdRdO2BhSG7CvazMKDUe+91WSw22ZeCgzsdSVLhR481msxhXXFPVGHDOk0J+c0gIDNJ6YWqk63beuToS55J9kLzI9283aiEgSbS1FYX4INfYiaeFR4GL2jmM4WOU4hTyhWUWVq6JWc8YhDTl2dUfHNNkIVlpkQLh7l2Ea7ftFk0z5FsY8OnHS1QWZw0tQIDWLVN/uiZ/v9wFtzWuUrTcLESJYTMsvBlbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wThXQbyC/G5eLouaVldG04k+jzCpyz3zziIZopr+s4I=;
 b=FGzZQAF8dqTPaBVH21NUVoZAJ8WssqPhlG+KJLddQLTLewJuS2bpayc3cWMVJGJxXPpaslnramSCzCFl7hPDJG+aLEfsw1sp+EdK2qsDOwYAeSY5Th21ok3EUtx5RiTo7jLZ1FMXGt7VZQIAG5ERGXyhAv6xyrGAJu/h4/em81JCxvL97xa+l3YEbIzRt3a9OHRW3AfF4vkRPMzdcdWrs4JDZaHz27MRGg0N08nBsF49CiRJl6fpuOH+XHrAx6IRNagv0mEyWMZvPiHe36LgPjnAiD4jWLT2X4nWfJVhlVf1NkbTV4tpJeUd2867ZYYdfQZefsR/p4MsyXd3hsp8NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f79d18f-8289-87df-1bbb-336fac5f381e@suse.com>
Date: Thu, 20 Apr 2023 16:55:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
 <c736271f-96ad-dfdb-48ae-b8e9cc002d9b@suse.com>
 <ZEAO8e9iTjmi86fr@Air-de-Roger>
 <7e3246c7-6de2-b3eb-477f-99ef9bd1b33b@suse.com>
 <ZEFMzu8k5wlYt2aD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZEFMzu8k5wlYt2aD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e14d2ae-f43a-473e-999b-08db41af4b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mcyJVtfH0HmQxEF/51QCdi7l0W0Pd6Y5M02Ca5AywDCMVErWokFLJvmsJoTvKDneVkgMgtn8n52kC5QOUwk6CYadjvE2I+DR73tWPp3s6+G3wr37MehdAbn3CxufCtSZmH/smrrcsDRnnMkbWUMYAZbbr2bHyw2Ig0OgL6RXvmzuBY0TD+Q5/9en+Ubi4lQL/Yaj6zZ4BvXY5oesIT9I0JBRrdoyQHj9PzE7tLTRqTYsIAjPzgNk4DLIY6y34Kh9Flu/9/u8aF7UIhfxWzBe4eV/we/fSuwewy4PXSLcMc+2IfbaOWIOzUD/qNZ9sUK4XBPEuf6SQrZ/lfZW5JOEVhJaAXm+1pA2R57Qw8a+vWZpOSSS7Lm7WhkOs3Sj8BUjMnsUw7ZWg0CDvV1I2b+GlGoqboY35dgVFcEint+mxK02S2+PrEP4cM/lq7Xwcs/1VDQ14fr/acGUbSl0RkIkV0caiORSTfHejqSygorZna6ByJjGGwA3AMEZAFKsrKB8TIxgUI9hXOZzfq9FWbd68QqsoiJv5sfrwuP7KML0KOBvfWvVy0GRlTQ0R3O2WdJtRJVpxI+h8uEjAJu42OOZtGQMJVAbJpeCiofPVOYZ+fRC+tkIpdnXGkVbqIXsK0ljVKPJ0+LeCCPwKQR8Q7HZVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(4326008)(5660300002)(86362001)(2616005)(83380400001)(31696002)(53546011)(186003)(6506007)(26005)(6512007)(38100700002)(8936002)(8676002)(478600001)(54906003)(6486002)(41300700001)(316002)(36756003)(66556008)(66946007)(66476007)(31686004)(6916009)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STJydTJJeUtwU1Rqd2lqK3Fxa005V2kxakpsKzhCUU9wRnMveWtXWkM1dUd1?=
 =?utf-8?B?ZzN4R3RCcnJZdy9QU1laWTRGNG10UmJOQ0RzOWhkQW1qb3JYd3BPd3phVk5w?=
 =?utf-8?B?eVZkTTZDMXY5UE9vYU9aTEZZMVFENlVtYU8vMDRjTFhZLzBKSnpkR0Z5dmx2?=
 =?utf-8?B?WFZLMER6eHBldWJ1b2FDTDB0dzNRc0tLaWlTdWhjWHkwNDlYZGhzeUxyZk1v?=
 =?utf-8?B?YWhEaXMxeXlDTlNVditQWEdIS1YwVUJrM3k5cFpuQ3kzamg1LzdEZjMwWXVY?=
 =?utf-8?B?THVYbGc0WVE0TXhrU0NLekpJc2tMRWVBOXgzNUFtUTU0a3dBd3JDbFZ6MjdF?=
 =?utf-8?B?YXVkeFl3SkUxOTk2MkcyUmpMS0RtNkZJK3REeWV5UFRQQXM4VmJNWjBkV2lQ?=
 =?utf-8?B?eGNLV2pKMDY3WUIzRVFGWmYrdE5WbkN4b0VXSVBVTlJZOGU1dDdBNzBZVVF2?=
 =?utf-8?B?Y0U5bXhmTWFHUVRpTzRaT1ZCK0VPVGRtdkl3WElOa2w0VGhHNXdxbHpSby8x?=
 =?utf-8?B?VUJyTXFFYTl1QnVEZTZodW1CbmV5TnZyMXVmVXVlU0tiMlZTeVkvQS81b0JH?=
 =?utf-8?B?ZjYwd1VuWkJWeDhRYzBlalowWjZ4YjdJZlhvOC9scDhIK0w2bktDdElVVW40?=
 =?utf-8?B?NWMvYVpaWkhzYXAzSlFTUCtQZzhnVm9COUd3aVhsbk14OFV3MmUxcmdsSjFl?=
 =?utf-8?B?WUpvK3BPeFFJZWl6WlNqb1BUNkgvSWloN29GaEhrZ0lxZU12MEl4NjBLSTZC?=
 =?utf-8?B?dk1TV21jZVdSU1BqaHJUcUhXV0RVUmg3Qng1eTVra2d5WDNUNGlpRVlUc2FE?=
 =?utf-8?B?Q3ZrMU1EV0NRdjRsMjlTdi9NelI1NmtLeFYwUDRHRHd2R0RrMFR4NkRhbEdW?=
 =?utf-8?B?WnU3YzZWUms3Q2pQQ2hyZ2MvRlJvZXNhRGIxSWh2WmxyenZId0RPV3Z1RUV1?=
 =?utf-8?B?eFBlMW94QnRGUkVzb3R0UkpjL25VNUw2bkhtVlhpRTJMNldZS3J2RWRhamo2?=
 =?utf-8?B?cE5jR3l3Wm85Z3pGeUxueWVVaEJnenVmMWFoODNZcGRNTWtWMXd6aXRmUTZM?=
 =?utf-8?B?WUVUTFkwOWY2WXNiNDJMT3FDTFdWZVdRcHRodnZRSkR1ZE56bHlKZVFVc0Np?=
 =?utf-8?B?NXFsQ1hHNVlWL1BBM3VrRGZmaUxTSzJBTTFVSFZKMkY5R2dad05YL05WRksy?=
 =?utf-8?B?cERacXF2UGRKMDl5L01ocFQraVhIb1UrYmNidEVUWDN0eGs5R1puMmFaa3Zv?=
 =?utf-8?B?N2JsN0xjWGRudXRTcGhtNEJqRTV4amMzQ3JIMFRoWUVLWWR6NVE5SVhYUDhH?=
 =?utf-8?B?elMxcXdVbGVYNitwTXRlS3pnS2NJQnd6eGtZQzJXM2VOUUpnWEtTbHYvQVJz?=
 =?utf-8?B?Yk9id3hmNUQ3Q3FyRmlKVlR0emtSS1Rndzg4YU1HbXAzMWdRUkJuVlNHREpX?=
 =?utf-8?B?Tk82WmswVkRVakZ0YVlJSm1NenV4cXQvWm9uTlI3NFhSUU54QlZzK3l0V1lq?=
 =?utf-8?B?K293bmZ3c0xtT3dvbHFBNzY1R3hVb1FxWkduQmxwSnNOTERINExhbmhGaGta?=
 =?utf-8?B?cEFkZnFITGxTUEE3RS9lSXBiSDhMK3NRem9QaWdnVWhvM1Vna2NvVUNkM0JW?=
 =?utf-8?B?SE1mL1d6OGd5SjV0SVgva1hDVjRHc3FvditWS3l4ZGh3RFhHMEEwUTVEbk9w?=
 =?utf-8?B?UTV2MzdOS3hHOTFPQnUzZUJvZmdLRldOV1ZKKzNHWjlFblFUSllSdWZ2a2Ev?=
 =?utf-8?B?cXB2M3p0b2YrTEl2V2NMT291SzJXSXBuczFSam12TUpCcTI1TkdNeGg0a2ND?=
 =?utf-8?B?Mm9EaUY1S0pZUzQ5UGRzbCtLTFJobFMvbDUrcmoweklnRnFyOHQvT3ljYWxL?=
 =?utf-8?B?dEVUbTBnSzRNVU1WdFFhUVBBY1Z4OWt6KzVTQ2l4bUtyWWEwcVVXeHVDRndQ?=
 =?utf-8?B?b1JkTGJBRnQvUmFOWTRxQ2RhcGRmdG5TSmlOeXlZSzNrRlp6LzJRcFhENDFj?=
 =?utf-8?B?SG11dU12OFFPYW4zbkJrSFYyM0FLUzV1SlNuREQ4UlJVUExvSklaK0NYU2Z1?=
 =?utf-8?B?dm1ub3l0MllIUkRocmwxbEFDamVGVEFTaFcxYWpIRUU2R3hwLzlrRGpjSlAz?=
 =?utf-8?Q?uNt1y8iEySz51fEZh1fA2Rj5L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e14d2ae-f43a-473e-999b-08db41af4b6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:55:34.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuiLz9amE4d4hHWWPObugbAomEHsX0chHPe9qv93TFVeH0bSXVZoHPDf6BngJaithK98PIkpTkDo73zOPyq+iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641

On 20.04.2023 16:31, Roger Pau Monné wrote:
> On Thu, Apr 20, 2023 at 10:31:08AM +0200, Jan Beulich wrote:
>> On 19.04.2023 17:55, Roger Pau Monné wrote:
>>> On Wed, Apr 19, 2023 at 03:58:10PM +0200, Jan Beulich wrote:
>>>> @@ -1342,6 +1349,17 @@ unsigned int rtc_guest_read(unsigned int
>>>>           * underlying hardware would permit doing so.
>>>>           */
>>>>          data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
>>>> +
>>>> +        /*
>>>> +         * When there's (supposedly) no RTC/CMOS, we don't intercept the other
>>>> +         * ports. While reading the index register isn't normally possible,
>>>> +         * play safe and return back whatever can be read (just in case a value
>>>> +         * written through an alias would be attempted to be read back here).
>>>> +         */
>>>> +        if ( port == RTC_PORT(0) &&
>>>> +             (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
>>>> +             ioports_access_permitted(currd, port, port) )
>>>> +            data = inb(port) & 0x7f;
>>>
>>> Do we really need to mask the high bit here?  We don't allow setting
>>> that bit in the first place.
>>
>> I think it's more consistent to mask it off, specifically with the code
>> visible in context right above the insertion. The doc isn't really clear
>> about readability of that bit: On one hand in says R/W for port 0x70 in
>> the NMI_EN section, yet otoh in the RTC section it says "Note that port
>> 70h is not directly readable. The only way to read this register is
>> through Alt Access mode." (I think the NMI_EN section is more trustworthy,
>> but still.) Plus if we were to ever make use of the NMI disable, we
>> wouldn't want Dom0 see the bit set.
> 
> I guess so, at the end Xen itself doesn't use the bit so far.  Maybe
> at some point we would want to expose the value of the bit to dom0 if
> Xen starts using it (most than anything for informative purposes if
> NMIs are disabled).
> 
> Feel free to fold the diff to the existing patch and keep the RB.

Thanks.

> I guess you will also add something to the commit message about the
> special handling of the NMI enable bit even when the RTC/CMOS is not
> present?

Of course, albeit not more than a sentence, as the code comments provide
the details.

Jan

