Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A076C6C2B23
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 08:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512215.792028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWBR-0005JM-BO; Tue, 21 Mar 2023 07:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512215.792028; Tue, 21 Mar 2023 07:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWBR-0005Gl-8A; Tue, 21 Mar 2023 07:13:25 +0000
Received: by outflank-mailman (input) for mailman id 512215;
 Tue, 21 Mar 2023 07:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peWBP-0005Gf-Oj
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 07:13:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dafcabb1-c7b7-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 08:13:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6917.eurprd04.prod.outlook.com (2603:10a6:20b:109::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 21 Mar
 2023 07:13:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 07:13:17 +0000
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
X-Inumbo-ID: dafcabb1-c7b7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRjVEXBfEXC17VaD1/1C6L9ZHFQgNQwE3u7NfowS/pHGGSgVyrjMzGDyIKpQKtmqxyvrgFrFxtBpKUPkK3wZUSHK8h1xS7u+zNfqT90UX/w6mLGIgDgWLRrNTGg3aL6JoIukCuXNwsbLGaKHomdCX3L8X23i5ELKtpj2r9BmoRblCwSTrvfgYNgTGmkjxheM69Sti6MmCLbh4NqGsia8dh7bZUThDAPUflle1AaPJaWvLxyasy/my9XvA6VXbJJrAJ6ic80QZVumdAWxXLLTarUG5Q4GfSDPtyaX4PBA96JrS7MWzcjKS2Vdi5ylPUFd5mufOjuNial5qp/J4g7FCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txfMLxfdsC7xPBvjI7isx1WEOEcBv2c99H5fK7IJ0SA=;
 b=Br+LWjqfs5fclmKDBe00uDCavqaNglmQNVeGg2+oOv7wmLkdJyw+JyVPwt/F8Fwbj1HUsRZ5lMr2STcyOV7tnjXU75uIiPNnV7FcOIv0wkqCiP/1MFyzQtp2zIYgqSKRGkFn23z1I18xf2nbnbRQhflaT4s7a5tuSZ76zyidNxcklLB8hbCZlZjnIEk02rchecxKQ/FOzQhvA2yYK7bmjRuisGW/6ArNmZEDTh43+qJcxgW1CuGVizDEKnJRffv5pde7NHY07uA0qT0tUaB+4dk2F7Dgx+UlsBmzeCe7aTHG+IeZotx/SljZF1hJoEaGD1Ytmb/9/fgG75/714daEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txfMLxfdsC7xPBvjI7isx1WEOEcBv2c99H5fK7IJ0SA=;
 b=aZfwgXe52njl+JVQfJPM+gnAqfeQxOo+RBFamEc3OIXDIIXd3ty4VwxYsh9LyJeIgYuKpPLEeSNEzSathY7XrwncxBydmduBV3Woxa+WaEoc1i1LZSjq4YI1w/vz4zTz8IGTB9CdQtLmwsV2qZlPUiUWXzh2NMQ1b9ZLdnFiZhC7a0dlvI9g7JqlxWyCJpNTqwhM1B+0jHV1a0UJhOstF8X7QblkGdAN5fKHvODwbW24l7ju1gX1rgUMx5YAjAuJaJZjivVhI6yQMnp4DNjLMoJiYIRyzomPZ4OjX7gsM4VHdJwWgUnalXs9NjaHpgvN/L+5fTalUrSuEFhVYpvPLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c019d72-93d5-f820-7079-2a9c3fee8822@suse.com>
Date: Tue, 21 Mar 2023 08:13:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>
References: <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
 <ZBkwboNcQu6ooSRC@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBkwboNcQu6ooSRC@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6401f6ee-5234-45f9-c84e-08db29dbbe47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ikyt8Q2CNaYGNfPO1Vr7WrGSIciMj/uZG+6xMVrFpK1FBacn3Q4tC2RdjZR3J0rkTnbNlDsEISS88cLwBN0j6fXgIQn3EGrIrGghfHXQf/+xSKsx0vmn52AjYlFPcaKaatBMWggX1aqjJ6FIqro8ur8VSCdVhSmTxGiE6g+YTADoWKqu59Wcsav8lEowWT/b/ChiUSTA81lercI0QDlBPA2aFJQ+JyCLSw3yX8a4xcu6iM6jZFoZJ29IQYxTHurZN/Cczl3fSpGOdKv5zDGZ7o8n4xmwmSk+Lyn3OUil2YM6+P9pPV97znBaPWJrlGjy31WI0s6eZ/4I2vQwxCWWZ31qH1TE6cNDt/efRwLK7zetr2+xSWnaqm0FBNFv0+MZm8Ym6iSFZGEsZEEjiHcg2KSWlotrZGTs0nLB7g8ABdBnJWuaRxPF85mRpDEFAlCjAbTFVaMduCqBc8N2hr4rIZzqpVgJj9pLCEcpFCsF/CHEoHdX4/OjrZKFZf9yv9mD9YFvacvqyORQu47j1Q+bPSdtfhv5OXmpje2fAGxYe5VX5CQKIvAgh2mXtfNxC7gebO9dOeVYstbvJfZg1ZS9jfRS2UI6PzEZvm/uycEbOc/5YCNBcJUtQEJ+pYreb2zctDNjftZ6QljaJ1jkZFZTvsgbwCmnIlyoKcnVqT/vBveFnntEwLs6kuAmTjJvuRTEXr9i+txo1wkXIamgkFLG7GYouZDaaXmSDWf+zf91Tww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(39850400004)(346002)(396003)(451199018)(316002)(478600001)(31686004)(36756003)(6506007)(8676002)(6512007)(26005)(53546011)(6486002)(66899018)(4326008)(66946007)(66556008)(66476007)(83380400001)(86362001)(2906002)(31696002)(2616005)(41300700001)(186003)(5660300002)(38100700002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FPTTE3TC9nalYrLzhxK0VFVmlwMDh4OVZLTU9iMEk2K3NqcTViTHBjaGd0?=
 =?utf-8?B?Y1kzNzVlR1M2NGlvb2VVSk5zblVWeHUxTjBoZzdXUU95QzNjSnd1ZVlRRlk4?=
 =?utf-8?B?U0xHL2UwMU1DRHNYOU90NURZVlpvc1RpQ2MvOWR6QmhOUERyMElPNXBKelox?=
 =?utf-8?B?aVdKY3l1OW10dVdEcjEyVDdieVdLYkU2UkZGdkRRVDNCZjBzUkl2RkdkK05U?=
 =?utf-8?B?L1JYeTVDVUw1TGxxeWY1ZXRSTnpxc21rRzBkVWNWclAzVng0Q0NkMURPRjA0?=
 =?utf-8?B?QTJ4UEJTbUdZV1FiaUpUSXhjdWVlR3BtOVh4aFRqZlBsNFF6dVo5WTB3SHNP?=
 =?utf-8?B?eTZnR1BrdWlzZWN2c0Y0M1Z1MGZ0cEZJRThIUDUzbkdvU0dZMmVMTk5Qc1pl?=
 =?utf-8?B?UTRmZjhkMklwMWZiS1RsQjNLdC8vbnZUZjZEWHJpenRORHpJRCtyQVQ4WWcz?=
 =?utf-8?B?NWFsYzl0anF1R0ZoeW1iMlYwZ25oVUJsa1lnMi9kaFVQRVB1L2VDRkt0TG4v?=
 =?utf-8?B?blJKV0RjSDRKaWtuUng5UWZRNkFEdFNkVVB1SUtHTmlVM1hEa0pTQ01iRUoy?=
 =?utf-8?B?UEVEUVZnWWxHaUNZdm95ellab0w1czBzTS85RUFsaFoyVitheXcxTmhUaTRa?=
 =?utf-8?B?WktsSUxxZVhaa1JzQzVsUVV1YlczR3NuUWpaTDYxanA1d1hqUGRGMkI1dGdt?=
 =?utf-8?B?MENjcmpUSC9ISHVZcWNtbWVVSTRZRFZHY29QVkQxMk5zNmw2YXVHdVp2dmRy?=
 =?utf-8?B?T0J6U2tiaTdjanRMcndnSHdsc2tldHBMdmZPVWtIV3pjS3pjZlNTZ1hicW9K?=
 =?utf-8?B?Wi8zWDdZZ0dhdFBQcXJOcEd6U1c0TDVEQUZYcUU5VzV3QjRiUWhVTUhIbUI1?=
 =?utf-8?B?eVU0ZXU2bnJDcVFmTTRBcGwyREV3N3QyMUVKODk4aXB1UDdNTDYybzlhdjVx?=
 =?utf-8?B?WHdQQ2YvS01Vam14SlZtR1NHMExOMjJCQmZiZFg3dVhTK1p4NU5KVlUvdm5w?=
 =?utf-8?B?S0NsWW16d2puY1NZUDhNOGhCQnlwYlhTcjlyaTF1OHMzR3FpN2tFeHlFRHAz?=
 =?utf-8?B?cWVyMkpDYk56NEM1NlZzUTcya1lRYnZKTjVGbVN0RU5kYTFPY045Y2ppOWJy?=
 =?utf-8?B?blY0dHNOc0ZwRVplbHlkWTdMNCs5M2ZtYXkxOFRoZklGYlEzNTVpbUdZNEEz?=
 =?utf-8?B?Q1NsRU5lUTVjQkZkbU9hNVF2b0pCTk5NZzQ0Q3VBdEpZMm5lWkhZNk5RSXk2?=
 =?utf-8?B?Q0VsZWpzcGdzWDJhZkxXckNscUQ5cDh4ZVRQL2xSTlBad3g0UVgwbmYwNUJo?=
 =?utf-8?B?aC9SNWpNQkwwWGFOL3FtSklrM2dENUdJTnNmbXV3US9ia2ZSdGJycVVCbVRS?=
 =?utf-8?B?Yng5eWJ0bTdSNjJhZVMwSkY2SVRKT3didVNVUklzQmlLREtNMkZrNmxRZC95?=
 =?utf-8?B?VFZMQ04xNmI4ZEpuSUhTaVVGSXpiNy9aRmRzT3FJQW5VUE9MK3RsMldrZ2JN?=
 =?utf-8?B?YmRBemV1ejRkOGFlR2E5bzVtQllLdFJPdmt1YmQ3ZEdyWFVBQndodE5sejhB?=
 =?utf-8?B?SjRRSW4rcGRTbGxBbjl6dnFScWxTcDBsOXpOVkR2OHBuYjlOdVJvSlVCdEZF?=
 =?utf-8?B?TTVVNTVWUmNyWUJvRENjNWZxWVVkSkpMbXNBMThWU1VVTHhiZEg0YUlmS1Jv?=
 =?utf-8?B?R3h1aVJhWkZGWmp5a25QUXhzc0ZGdGJiZmhMWmY0TGVQU1FOdWJRa2JCNlJ1?=
 =?utf-8?B?SE5hd1IrRXJEK25ORFFKSnpPV1BVbHRQUzhKU2FudGpIT3dGY0Q1Qkl2amVE?=
 =?utf-8?B?anNxVWZodGdhUmhYR0VzYnVYeXBEVnZTdE1Wdm9sVHJ0QjRIWlJlV01qVlBY?=
 =?utf-8?B?OVhDeVk3YnhjMkpwZWdxeHo3dFdSWkFXWllUN0w5WkYva3QyY1hqTUFzM3J6?=
 =?utf-8?B?bFNKWWpIVVVQd1B0WUFhNDhiNjNFR2lkQW82Mk9XUFhZdTZwVDNyRTlwOFpB?=
 =?utf-8?B?YmpSVWFVSWdKZEJaUkV0aUpiczNhN3pTcHVmc1FzR205WC9EUzdmQk1ndDRt?=
 =?utf-8?B?MHZMRi9NQ2g0b2IxYnZnajJHU1NIY0xzNXVmcVVzcWE4REVlWTFGOUFaeVh0?=
 =?utf-8?Q?vxfyn36dmL26j594Rk8AQ4WNI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6401f6ee-5234-45f9-c84e-08db29dbbe47
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 07:13:17.3290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4eFI0knKNtPXDV/Gld/GR/cr2RBisYfXQG6MLln7GJZzd1AWqx+CPLcHMGoaJAULIBXTCK2YIxaVMB3OXptRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6917

On 21.03.2023 05:19, Elliott Mitchell wrote:
> On Mon, Mar 20, 2023 at 09:28:20AM +0100, Jan Beulich wrote:
>> AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode
>>
>> An earlier change with the same title (commit 1ba66a870eba) altered only
>> the path where x2apic_phys was already set to false (perhaps from the
>> command line). The same of course needs applying when the variable
>> wasn't modified yet from its initial value.
>>
>> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This does appear to be an improvement.  With this the system boots if
> the "Local APIC Mode" setting is "auto".  As you may have guessed,
> "(XEN) Switched to APIC driver x2apic_phys".
> 
> 
> 
> When I tried setting "Local APIC Mode" to "x2APIC" though things didn't
> go so well.  Sometime >15 seconds after Domain 0 boots, first:
> 
> "(XEN) APIC error on CPU#: 00(08), Receive accept error" (looks to be
> for every core)
> 
> Then:
> "(XEN) APIC error on CPU#: 08(08), Receive accept error" (again for
> every core, but *after* the above has appeared for all cores)

Receive accept errors generally mean a bad vector was received, yet the
sending side deemed it fine. That could be a bad I/O APIC RTE, a bad MSI
message data value, or a bad translation thereof into an IRTE (albeit
iirc we never alter the vector).

> The above appears about twice for each core, then I start seeing
> "(XEN) CPU#: No irq handler for vector ?? (IRQ -2147483648, LAPIC)"
> 
> The core doesn't vary too much with this, but the vector varies some.
> 
> Upon looking "(XEN) Using APIC driver x2apic_cluster".  Unfortunately
> I didn't try booting with x2apic_phys forced with this setting.

My guess is that this would also help. But the system should still work
correctly in clustered mode. As a first step I guess debug key 'i', 'z',
and 'M' output may provide some insight. But the request for a full log
at maximum verbosity also remains (ideally with a debug hypervisor).

> So x2apic_cluster is looking like a <ahem> on recent AMD processors.
> 
> 
> I'm unsure this qualifies as "Tested-by".  Certainly it IS an
> improvement, but the problem certainly isn't 100% solved.

There simply are multiple problems; one looks to be solved now.

Jan

