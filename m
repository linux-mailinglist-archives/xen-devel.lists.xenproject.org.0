Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C362F6B0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445791.701184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1sn-0006qB-Ma; Fri, 18 Nov 2022 13:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445791.701184; Fri, 18 Nov 2022 13:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1sn-0006nZ-J7; Fri, 18 Nov 2022 13:58:17 +0000
Received: by outflank-mailman (input) for mailman id 445791;
 Fri, 18 Nov 2022 13:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow1sm-0006nT-9P
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:58:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe13::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bc4e246-6749-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 14:58:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7793.eurprd04.prod.outlook.com (2603:10a6:20b:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 13:58:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 13:58:13 +0000
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
X-Inumbo-ID: 0bc4e246-6749-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmHxRwJlI3ohLxM27CVTI9bihfceapPmYGGV3t/uVtjse1ZwGYxLc0UXKjmjHQvlQ0oI2mvrhTzzLvf5my2tZp7GSsO0991j1ECEzNpx7Q327oC1UPil2OyjRCQ74LSEvvPXubih9x6vODLws6j8+iFUqliXaWHLAmym+7Al0XX6YQXL/2A1Qa+QYfKgyoIHuGbFNtTTEOiUcqz7CjQ5/hKJs3ifLPbzQrBOXjFstqkZ9PQMUPHlgx+KCYg64L66hSaBRlfuiNoQcR+IDcJ2QbF/g/MCelN6aK6hU2NhTZXSn2TR360Zmm48YHPCkVdbBChB2pe+8vdojj0m777STQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/od3HOrDwIzV/8AvZpDoF3peZnkN8EfBKMO+v6kT9aU=;
 b=ARoCGF3rE3RI+1IUZ5FQEYKUx5V+WcoPlap9DzR1QPxvlFCaT2MLGwSwbQSVGoe7ZGjfrwVRtE9f9TjYhTY/wEKQH7r0LaEpoJjGtZfQTyQARMD2M1Xll/K7NHPrjNTBG6AHGBojDY/85RaI1x/FBGaW8wt4t20SOBsGOCiixVPSp+CiQ1/5YDl+R0BfRp4akuo43ACmI8w+W/T+4+WUi3lFvixdVsgVTprrlgVpxCh8Tiqa9TTrxWJcCtQ4D3iKctr/Lfta8t6b+bST4w6Rg9N2VI0lF5xKLOTymQnOazngba5P79BbSU5+2u4w4C3jzQp8LH8fczzAXyT51z2dWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/od3HOrDwIzV/8AvZpDoF3peZnkN8EfBKMO+v6kT9aU=;
 b=E43v7tWO6haw6+rMvxu36sy8HgUOtPN1uWSXA979GDxQjQSvpvMI2mkwFY5aZlIMQD3DOV17j/bGt+fgAyO51kd8tSoV5IM9Gol1+/gnltfyQVvHBxPuGZkx8DQ/SjQAGmFlW62RWht0nGj/0H47mI9VDlfVcDc58PMezhfgKoOZPIZSu1DJvvpnxskz0ZKoJLr0iCssmI1sdn71ZmEkp3Io3w7qWXevoHf9n8I8QRQtfT0wD5MpMJiMo1RYL1eYpSK8uoZcbhnChHPU+4IMSP96JjnVav3Q1W9T2jfYGX5v23IEt6QdtYBSECPg1NVQ1EBXicg3j9o88JItYnPaGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aea20fd0-9c68-25c5-d8dc-fd46b0b99867@suse.com>
Date: Fri, 18 Nov 2022 14:58:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <Y3eO0bMKRPYJc2yQ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3eO0bMKRPYJc2yQ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: d7036e5e-2502-4ef5-6a5f-08dac96ceef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z50NPPSTSJv33OvW+RbDoBFtGBWjmOSHcffpt7YXVIn+maED3xVKzFjKaE0VBZzac+GB4+vTT/oS3VitMm+lcYZzCB9xvvMg8xTnrF2XFl+5OnVrpYrfcPaf79PZkZSipROn8561/i1Xkq0GULiWAFsTul3r+w5DdkdK39BFUl6R9sdjq1gmhsVl+yX2Cm0LtcDfMLRJ7Wc7h9NEZKWStzNyXLIgB34UI0dhxIOAiTG8Y5Exqb1AiuUSJVY/Ic3Kn6GXEp/X0W4x+3KDNF1JEFeXc0TeYXwfIPZBKu6vbfXZfg/IARXZ85sGi4aLDEMpE/ikibOFTk81r2tqj7qjDwAkB6VGHsFVJDX4GN3YD5A4rh9n2cTzBTx8/MWLafP/QxcAYGhuBM818X0QU2SWqI3O9yTNH5TessZgaSwzjQPDN8ogn1Rl0QQ2VtjcHBTvfGJrLofifA0nos1xMuLIbsrSc5YVdGqNE0LKyLkB28ersxuBAC40K2PzZIuSgGEkUmaJ1HdLw8v+S+AIpfoXZST87n6xZEHpeKOtU/gV330Eu6XkFtaB31OOKe705frmEr1ZEbiUF37ttOih1GO7Ex1dnQwIvuUJSXAJV2uoR3TMsNsjJ1S60HdD5+izsh/ztjpiZH0Qw0InSFmC/jDY0WYtSblUazP7d61kCeKLkE3xW3/ONynb6fe1gxrU07SE2PwspDHjj4MpS82+6x2zZ+bd5ZaDf9YDmdOQ3UABG+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199015)(53546011)(5660300002)(186003)(54906003)(316002)(6916009)(6506007)(2616005)(26005)(6512007)(4326008)(66556008)(8936002)(36756003)(66946007)(66476007)(8676002)(38100700002)(41300700001)(86362001)(83380400001)(2906002)(31696002)(478600001)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9MNkU5eWNGL3RTTS9MeUhMeXk3TnZVS3dWQVBCdTRMM3lIUnVoQWtOTE80?=
 =?utf-8?B?ZzNMckE2eFp1UXpsajkxdGZiUHVKV3J6bWlsWmtjWldMZm84SWM5YTVpZW1G?=
 =?utf-8?B?d1hJdkw0WGtqQnVJSVBiNmYyVmJWbzJrbG5xMm9RS0tXaXNWQnNTZVE3VzVa?=
 =?utf-8?B?dW1yaC83SGJBcW1YKzVxWXNrUXRRWlI3WnQ2aHlhVHNXQnl0QVhXUjB1dzc1?=
 =?utf-8?B?b1ZWeXVSaDhnSWN0Ync3TDVQVWhxaUMybzhiMndvWjdZQzcrQ09vQkE3ZHk4?=
 =?utf-8?B?Tjl4N2xHeTdvcnVlSStHMTFHNVBCc2pOYXh6Rm9nUzdXKzZwTHQrc0FNQW9o?=
 =?utf-8?B?UC9UTGxidFZMUlhqbEhRa2t0M1M0NWtFd3U1T3lqZjhtVkRLTlpYZ2JlRE9j?=
 =?utf-8?B?bTVvNDVrRDQralkyeXlDSGpaMkV5L0U3QTFCRVpPMzBBRjF1QTJ2N2J4Zzl4?=
 =?utf-8?B?UDFVN2xEZUJuWFZwUUpTcDNqS0FmWHBCMm9tblYrZjkrQ3VaUlQvK052Qks2?=
 =?utf-8?B?eUJ4T1ZCTTBwdGhiaUhVOStETzNBOWs0VmdLQnIyZXh0WldZREJFUzEvdDEy?=
 =?utf-8?B?cERIRWVTU2NoMm9XUmdGN29BZXB1aHhDSGdpS3Y2SFN0NlkycWVvU3YxYjdk?=
 =?utf-8?B?b0tqQXEwbHpGTGQ1cURXOE5CN3BlSnpOaVJNWThYaVBQY1duRzRleG8weTVu?=
 =?utf-8?B?V1pOd29tT1RyWjNuZ3FjVEVMM0gwTDBnWjhaMTk5ZHQyeVdHdm42TERrcHJs?=
 =?utf-8?B?Mk8zYVZPakx3SGJTVnpvdnJHRWt0bFdBYTkzQjduTnZaQnBvdlIyRTBrM056?=
 =?utf-8?B?ZWpuZlFjSDBUWUZ3K1ZuNXp2NDlaMTB4Q3N4RHJaYi82NUlVQkZkNjFGUlhq?=
 =?utf-8?B?WjR2T1pacHRKYk56aUFOMjl2ekxDM3ZtT3E2b2k5MHVhZmIrTUZpRmlGVTZP?=
 =?utf-8?B?MGtTdHZLa29Fb1F3aWN5NHp5dENIQVlTUHRCd25NTEV2MEFMNEwyb1FMTFJN?=
 =?utf-8?B?NUhCZ2wrZ3o1M2E2eWRVd1hxN05DK3ZVNmw5NlR4cG1lbHFDN2xkRlRCTzl6?=
 =?utf-8?B?OHFiaC95YWRBWm1OKzlGVW5qTWtkU0JJN0xCVjJkZTM3dXNqYUxoWUs1ejlk?=
 =?utf-8?B?ckt4NDJLVGZ1cm5uWW80WmVtemtHd0VZOE1xQTlIcGZzc2w0UW1SYnhDdEt1?=
 =?utf-8?B?YmptR2l0Z0pPTUdzMVNhZG1SVmFEc0lhVFhmU3dGb2I3ZVNkdVhtWFRYRGFY?=
 =?utf-8?B?eW9QdG9seDNKR0x6bmpHUG1qOWF2S21GMWJGSDhOTjRYOEJ1cUhmamJEeHJa?=
 =?utf-8?B?bWQ1b2dpcEJwTFA4NHpaUk41SFRmVHBSeXovWGtoMmZYUnUyTXdtRjVPSXQr?=
 =?utf-8?B?eGlxT0RabnQwckJTeDR5RGdGSUFwSTkvTDRFdjhUTmZ3MTg4N0dET0NCSXNu?=
 =?utf-8?B?Z05jUmFmeHVKUXBNdGJ0bjB5MlBXaFJ0c3JTNzd6enROc1Y0RFd0eWpJckVk?=
 =?utf-8?B?OFdRV2hoeFBWekI5OW9uMVpqK2UxS3lDTE95SnlIYXVqTzFDQjc4eVEydmZD?=
 =?utf-8?B?aFgvaVFPZDZLT0V1dnc5RzljNnZrSzNDTzZtQTA5VDFXeGdEcStKL2lDVEVW?=
 =?utf-8?B?RzZ4OHNlcVNQTnRFcXBXdk1sMUphMVF4d08yMmpQNUhnanI0bkI1SDlScWFH?=
 =?utf-8?B?aHVYODZyQjdWMUNXbHh2cjE4c0o2NWVnNzA1T3ZqUitsbnBWWFk2Y2FDcmw5?=
 =?utf-8?B?ZmthMkgrNFJqUXlrQXhKd3A4L0FobGN3bjRHSmY3azBMYWZxZ3h4RVEvZVRW?=
 =?utf-8?B?enFBZ1RMU1BuQ0hXdHRtdFhkL3JNbFo4R3hQQjZ1T21EMENRUFVGNnVtQzJZ?=
 =?utf-8?B?b3FKOXkvSDBwUWMrais5dHI5RTR5Y0pLQ1dab3pzT1VRTWFWdGdRc2J6dE5C?=
 =?utf-8?B?YjNsdnlWUHlqL0lvS3ZpNmdNOS9CYk1xZCttTVZ0SXZBa3Uxc2VZNThOMUR6?=
 =?utf-8?B?cS9jUFoxZ2tKUm9vUTRFTUp2a3hyZXVFbDYyR2FsbU5iRG53dmpyenJuUGRr?=
 =?utf-8?B?bHl5c1dNQzQ1UnFuUG8zZGZlOFh5c2kyOWRkV2d6ZC9HYW0vMHNGNUt3K1Ny?=
 =?utf-8?Q?4ClO86WifImGluxdgxIbbLpIb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7036e5e-2502-4ef5-6a5f-08dac96ceef4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:58:13.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3Ee5Dt7nom9s4w2Pd5zbI15G5yWL6FOZd4V8jDlwE9gZBTX1VrbKHzXmQ4H+rsAkHVmBiFufU7hLEoNHHpr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7793

On 18.11.2022 14:55, Roger Pau Monné wrote:
> On Fri, Nov 18, 2022 at 01:54:33PM +0100, Jan Beulich wrote:
>> On 18.11.2022 13:33, Andrew Cooper wrote:
>>> On 18/11/2022 10:31, Jan Beulich wrote:
>>>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
>>>> exposed a problem with the marking of the respective vector as
>>>> pending: For quite some time Linux has been checking whether any stale
>>>> ISR or IRR bits would still be set while preparing the LAPIC for use.
>>>> This check is now triggering on the upcall vector, as the registration,
>>>> at least for APs, happens before the LAPIC is actually enabled.
>>>>
>>>> In software-disabled state an LAPIC would not accept any interrupt
>>>> requests and hence no IRR bit would newly become set while in this
>>>> state. As a result it is also wrong for us to mark the upcall vector as
>>>> having a pending request when the vLAPIC is in this state.
>>>
>>> I agree with this.
>>>
>>>> To compensate for the "enabled" check added to the assertion logic, add
>>>> logic to (conditionally) mark the upcall vector as having a request
>>>> pending at the time the LAPIC is being software-enabled by the guest.
>>>
>>> But this, I don't think is appropriate.
>>>
>>> The point of raising on enable is allegedly to work around setup race
>>> conditions.  I'm unconvinced by this reasoning, but it is what it is,
>>> and the stated behaviour is to raise there and then.
>>>
>>> If a guest enables evtchn while the LAPIC is disabled, then the
>>> interrupt is lost.  Like every other interrupt in an x86 system.
>>
>> Edge triggered ones you mean, I suppose, but yes.
>>
>>> I don't think there is any credible way a guest kernel author can expect
>>> the weird evtchn edgecase to wait for an arbitrary point in the future,
>>> and it's a corner case that I think is worth not keeping.
>>
>> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
>> after setting upcall vector"), referenced by the Fixes: tag? The issue is
>> that with evtchn_upcall_pending once set, there would never again be a
>> notification. So if what you say is to be the model we follow, then that
>> earlier change was perhaps wrong as well. Instead it should then have
>> been a guest change (as also implicit from your reply) to clear
>> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
>> enabling (here), perhaps by way of "manually" invoking the handling of
>> that pending event, or by issuing a self-IPI with that vector.
>> Especially the LAPIC enabling case would then be yet another Xen-specific
>> on a guest code path which better wouldn't have to be aware of Xen.
> 
> Another option might be to clear evtchn_upcall_pending once the vLAPIC
> is enabled, so that further setting of evtchn_upcall_pending will
> inject the vector.  I'm worried however whether that could break
> existing users, as this would be an interface behavior change.

You mean _Xen_ clearing the flag? No, that breaks firmly documented
behavior. Xen only ever sets this field.

Jan

