Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905EB62F6A3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445787.701173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1rD-0006G7-Bg; Fri, 18 Nov 2022 13:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445787.701173; Fri, 18 Nov 2022 13:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1rD-0006DS-89; Fri, 18 Nov 2022 13:56:39 +0000
Received: by outflank-mailman (input) for mailman id 445787;
 Fri, 18 Nov 2022 13:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow1rB-0005e2-GD
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:56:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d06a9f14-6748-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 14:56:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8805.eurprd04.prod.outlook.com (2603:10a6:10:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Fri, 18 Nov
 2022 13:56:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 13:56:34 +0000
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
X-Inumbo-ID: d06a9f14-6748-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdGYqp/6JtNSAqrNYxcYiab+gq4sDzdCA2wTqybHoZY0v9E9KtyCUTNUx5Q3f+6qLj4fl3yaiXbAD+w7BMlEEGeZbuZtP+7RDcdEGmI3GIIID1xQdc3BdJ+gsX2+CH7FiWHizKHqWEJgjFkc62P1yvKRH6R8KirsFI6b4ZDfGycUjW9aVzgD18hQMhf80Xvgd2EPQD8uJ9M4eYGmFDDvYpma3EYzE12DM7HJFBHLtAcK/RoLhqUU1dt157ruTJdcghf4NWXVdI3XSyzIOEXTEJkNkqHJ1e8vtLYOaZTdf7P+JtgIqFohjPhCdDpBNeoS8sTikWhbENnETX5mgjBN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15/mCCZo8iSZ2OCYInkPQMMZKDWnQCxH+KVsa63G4MY=;
 b=cOeNQQIGSifTn06GBECtBpTPGjkaYUgsGM6LjrLcKOi8zRg3FRQxSjqKDyH7Wr8xrTIvcX5cfmAUUA4WYyGi64JdH6OmsPYnKRVw1aGa+RDG+KTjq6KHLwz/6T+yErLjaBODA3picCtzgbWQvVc/hTEj3m5JPww9bbsa+oexUF6d/D4cka6YALJVTwqVfPZSALVcyB5C4Qn4Fpv0jcGOvbugi7PYl72wQPJYRd79RLlbEShjfOp4pny+IHQj4YAu4p24+Eg9H6QYUoEGoczc5ouqzR2wEqewNUnonCrNXWRsKOl0d5CQJ2DHqij+9V2A1wGQu/kB7npNld9UhJS2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15/mCCZo8iSZ2OCYInkPQMMZKDWnQCxH+KVsa63G4MY=;
 b=fB1gwwjrY/Y5hFG9ZHaxKP5GX+7ZSDSiEcXBtDQmfHQAJumUAcLg+1fU6G3JBtuH4lam7CQl8egxiB/jg1U0QZVqUJjmBTj6y2U42WwgcKkToZYni6pmdhTX5CKqaHYDEKnF+Di2gjlo4eNNeF/D55JFbn80ijjLqO6wtKOnSNvmChDfkCygNGJNlpWzdYWCNav52rV1/2pmcZToR/r3An06ZpBMrFFrTDSiTRzrvDNVV48PloS/XwNImFkyYLzyuSE48ydhBPGSeZPw9rNnZwA3m3xExoyLRyjtKlGVGtOtXhQ+PXfbukLWh07uLMYMlwF+xiDP3mlYOJ5xUcQwsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab764680-c420-df54-8a63-fd9dbd284dbb@suse.com>
Date: Fri, 18 Nov 2022 14:56:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] efifb: ignore frame buffer with physical address 0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221118123925.25363-1-roger.pau@citrix.com>
 <d2d0d0a0-6ee6-d9da-992d-99bf52be8119@suse.com>
 <Y3eMPMvtIgfkaMJV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3eMPMvtIgfkaMJV@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 9deb2a66-a716-4a88-daf0-08dac96cb422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MuSTYN3WLcS/xx2pTuL/wdFbmVSdQc8y+M9vpXqXtm/0Bxe+D3dxSuofDPjfonDQCgu3HVElKKhhS3YZBPEcUrCDQevl0HQaryAS8flggmmYJLMVIiJBUXYLcwGpb4FMZNV+IhOj7kA76vI888oIgVcWTNXhfoNKhscqzU57zv9JFAKSkVDHjSfRsPZ2WRJJy1B7j+P3vGzgkgqKPQWfaDdBDhxh0XTcqdUzwAEkvsUOz8kSlH97WO4vWV/QYuj9ameQhuCbsTX6tK36Hm3HskLHbt93SXdiZ11srQpqDrq08eVPH5Cy4FzcBhx5xVPOZ5yzTkIG1HWOYz5aW898VeL1myRXFdTDBIf6+vfxwBjExNuZMCeWJBmh/C3rO4lomBzN9wRcPF2jND8NqBKSvxi1QPoAs7OcM3i7g1nxrU+7xbaH0kw2+P8VTX5BgiUG49xGjABEevxA5i26SL4jHsfNxhNtURoDAe5jpZAfEP9rYFIntREbSO2f8LpjjEvKeGTilbQIMf1Zzl43FMXbhcQ0AYeO8yamuqKWgWSS+7vjtYX53szmvS6eodi0+B5o87I0cAqN3qrJPQX/6ZIchtZZeEUh3hcfHI10C09hhZWtRM6ZWPEjXYBJo+le65D1d2kKcAm8ezX1E7rJPC6LQ+QXq1KepZs5QWolWYvceWoWfL7Gzvmlz8u8tKnBPyzMHTryoBc7X5xKrSwfhbUcgP/XV6I8hIBKRs2+VG29l+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(31686004)(36756003)(31696002)(8936002)(4326008)(2906002)(38100700002)(86362001)(83380400001)(54906003)(186003)(66556008)(6486002)(6916009)(316002)(478600001)(2616005)(26005)(41300700001)(66476007)(6512007)(5660300002)(8676002)(6506007)(66946007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlhIMUY2Rk9hN0tkalROcGlReVkrUG1KWll0QVFkRU1EZjh1cTJjcW1MT0pG?=
 =?utf-8?B?RU05UUwvREdNaFhRelU3TmppenNTaDZkSWlXcUpnQ1JMeFZ1ZUZsUGN1eFh4?=
 =?utf-8?B?Wmg4L3BZaTdHenF6MHVYTTl0cUpiSmFnaEs1YXpROWtKUVFuWGtDYlBXcWkv?=
 =?utf-8?B?NWVsVHZuUU5CS3ZSMlFzdytjOUtYNmlGNUErMTlPVTVqV0ljakFKK003L3Q5?=
 =?utf-8?B?c3Bxc0d6SmtDazFWQ3MrTWRaNWppZ0kvZlU2Vm40d1BMSlRxTnkyWDRzdkth?=
 =?utf-8?B?WEtLZTFJUDZRa05wbzNud1EvNnp4VDBwMEdjSzRHWU9mc0loMGlvc052SEZM?=
 =?utf-8?B?UmtBaWtPUFBwa0w4K1V5MXFHSnpQVHkrczdYZy9MWEdjQ24wd0NkUjhGSDY4?=
 =?utf-8?B?Z1djWHpRUTdxc2dSV0JOZmpsS05SVFd0NGhiRm8wOWMxTXpvUmF1T2RHZE5z?=
 =?utf-8?B?bmxBQTNqSUtSZEVLSS9EQjZFbjVZcnU3SVVDWmhlUjNVdVJTQzZTcVl0SFlu?=
 =?utf-8?B?bFdMREgxeTVvZi9RQUtrWFlrOFB0dTJmM3ZiVlBaMmJ5UmZ1U3NpWDg3dU9r?=
 =?utf-8?B?aU1UMFdnVGcrMHQwK0lCbUx5eEhtL1pNYkpPeHB5eUZjSE4veFo0aExCbUxS?=
 =?utf-8?B?OFVObnB6RGVSaEphMFJsZWo2R3BvMC9BZkVnTlJsSFJnTTBoYXlZMWpyWE5r?=
 =?utf-8?B?OUUvTnBYQU9scHF0VDZjcGkvV2RDOEhUZUtKVnFvK2s3V3o5ckFzK2hnSGNS?=
 =?utf-8?B?VlNZZGxZV0lONG1ScVZTUTJjaUg0dnh2emNTNkxDZHNnYTV0Mm9WR3RZWTMv?=
 =?utf-8?B?a3U1WVhTWEgzUE9hL2VpSmloTkJvWFp5c0VnY2czbDFHbEJaUzQ4S0ZsTXZF?=
 =?utf-8?B?Q05VcDJQdFVMd0MyVXlXNFViUGtqVFdJMWc3YUdXbW93elV2dVc3SCtickI4?=
 =?utf-8?B?TEJpd2k3cnI4bklSdXVnVHpjRE9lRjQ5OWhFdEF6TXJ4Vkdqb2tORDBFbVIv?=
 =?utf-8?B?blIwMUUxZEZ5WEd5d2JibUQzL1dVdVRIQlVlRGdHR1lxRTM2dGE1d3h4QVBJ?=
 =?utf-8?B?cmdGRFZNa05ZYmtzY3htaTRTMjVIbDk0WHdxenVUZTArVVBrckJOWUhMemVm?=
 =?utf-8?B?WTdIUDFOR1g0VEt4VEdUOFpNUHlzQ1A3YTJPWkYvTStFV0o5YkNFRlFtZDFw?=
 =?utf-8?B?LzkwK1VRYVllRjdONVpLMEdvSHBpdEJqQ3Y5RlZocmZHSWFFN3RoeFVITlp3?=
 =?utf-8?B?ekNrMXNCZ3cwODVib2RsU282Q1AvekpRcWtsRzU5ekVvSkJ4L1VJUG5wQ1pU?=
 =?utf-8?B?ckU0NllYUFRxZEpaT3p6UEsvdmpManMvbERoZDNOQ0Q1U0ZnZmo1TVpGQXZF?=
 =?utf-8?B?TUk4S3Y3NGw3dGFSNUUxeGtDUEFyUlRUY0JmMThVUTlzVy9ReWtBN1RmbnR0?=
 =?utf-8?B?Z2pTdVUrRG1ManVHdWExck53QlhJTFpUa3JtSlhPbHROV3E1TitsU0ZybDB4?=
 =?utf-8?B?Mkw0N0NaNGlMU2NobGFBNTZ2VWRudFdjbGtkQXBKcGNMWEU5NUZEQUJabFZa?=
 =?utf-8?B?K1JaM2xRRTJ4QzYvaWtKWTRNNjVVc3JueVVYT3pWazhEWVZ4WDB4WGE3QllN?=
 =?utf-8?B?dFNjMEtQU0ZRMk1vdWVlMVZJcXRzM1AxbTFydGkybWxvb3FQZEI0TVJ5R3Jt?=
 =?utf-8?B?Q3krbW1zem0zeHpydFora1laSDBtVmxnS0RFM3VPMTMxb0dXanhHMkoyUk9w?=
 =?utf-8?B?N3Bqc0lnTjR3OW9iQWRXS0hNeDAydXRmd1ozeVRiSCtsY0VxMFRRL250Yzlm?=
 =?utf-8?B?SDFQZE1ka0pqaFhMNHhreWFmNHovYlBVZ3d6YUlxREdLcUZ1UU53dnBKdFRw?=
 =?utf-8?B?T21JS0d2M3RxVXFhenlDS2ZHNnUrcU9mcjhpcVVDOHVROHEwNk8vR1BlNzht?=
 =?utf-8?B?SXNCZXhPN2J5U1J4Z3dPYysrbEFBdG13YWlHOUN1Y2JmTnAyQno5bUpobk40?=
 =?utf-8?B?eG1zUlpVdmJsNklIdGxKU0c0T0ZyaktvZW40bVhhNmxFb3Z1QWJYMk5JckQ5?=
 =?utf-8?B?THloV25OMjA4YUpWNUxoWWVLT0xXM054N3ZJVzdIdmhxaGw0NWhvc1RVSyt3?=
 =?utf-8?Q?8vHAgvrA0gVM7RBZsElt79Cpu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9deb2a66-a716-4a88-daf0-08dac96cb422
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:56:34.3743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iljPuAtfHJmAugbeZBipuM4A6fu6WDFSYdllKnxGovd1Jr7Qw7RTINsTI1RJwJ9MmiNd0dnz71KoudFe8yU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8805

On 18.11.2022 14:44, Roger Pau Monné wrote:
> On Fri, Nov 18, 2022 at 02:04:40PM +0100, Jan Beulich wrote:
>> On 18.11.2022 13:39, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -552,7 +552,7 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>>>          bpp  = 0;
>>>          break;
>>>      }
>>> -    if ( bpp > 0 )
>>> +    if ( bpp > 0 && gop->Mode->FrameBufferBase )
>>>      {
>>>          vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
>>>          vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
>>
>> A few lines up from here, just out of patch context, there is a
>> PrintErr() which imo is bogus/misleading when also encountering a
>> zero fb base. I'd like to suggest that you put the new check early
>> in the function (perhaps extended by a zero check of other
>> applicable fields, as per above), returning right away alongside
>> another new PrintErr().
> 
> Would you be fine with the new message being "Invalid Frame Buffer
> configuration found"?

Yeah, that'll probably do.

Jan

