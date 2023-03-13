Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCA6B7D93
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 17:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509348.784931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbl4p-0001WS-2l; Mon, 13 Mar 2023 16:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509348.784931; Mon, 13 Mar 2023 16:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbl4o-0001TO-Vo; Mon, 13 Mar 2023 16:31:10 +0000
Received: by outflank-mailman (input) for mailman id 509348;
 Mon, 13 Mar 2023 16:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbl4m-0001TI-V9
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 16:31:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74816a90-c1bc-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 17:31:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7111.eurprd04.prod.outlook.com (2603:10a6:20b:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:31:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:31:04 +0000
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
X-Inumbo-ID: 74816a90-c1bc-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPBEZXpXp62solHz6JcoO/T6Mw1xD4o2zRihc9wvuTClLGWTg3lq+aCl086eOp5cB2SDxe7dqjhqodVrBhdMQJiYOEm6yC72uq8Q0YN7OTHX+AxUcMX6w+ELbxL9eUFXP9z7DnvfIa4K042Jos86fg27PBfPF62U1TNv+miPaKXW9T8BVP6k6X1i2/LYrSGgJH6syywq9f/aIHFBp6xQxDFvscYxYG0hh8qyATzPho7F2ZDcRy2k/OB8Mha6vJ7DXDQwHOLtJnyljpTicQgZUV/zPGpqpF7oeQepW1RNbVlvEtugQWFpjp7RQztF9op9et0uVgjen9Hxysq2vktRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDcKdplSk+i3MqTWznByf9vgi9yBSa0JjkN0upLKQuk=;
 b=IzbhuPPI4C2vIWPtbeBZOWkXHOMUly0bTzKe024MWsDj/6zccx2DoXAwJrzaDUOn0wvDU1D6vMEPHaNlPp5XQR2wDGU5XiIaOjgcH7pcRQq291la0CCDxMRWIjl0e8znBhihghEQf36gSLp9QdRTvirpu2+spwOk2C+yKiGF/4C28Sdw5ROxZEkjxxNRbaQNB4MVUzLPK2izntURFrmFBU59mK3cO+k6NzmOuqhjywExdkdLBNczKxIPir9ZBbgixdkAQwSFRSSgKmEtbO4yWWDfBB0Z3u4/NZTFNXjiVPdPkq5nNbREB7mJNxbm8Kiqac8maykyUwToKzWz9DmLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDcKdplSk+i3MqTWznByf9vgi9yBSa0JjkN0upLKQuk=;
 b=Yx2tbqXrtE5RigWv5ksrXbt2L8LiY9uHVRGiG7en1PvvwlbjK0F4YrJjcTM6hoX00RZ5HMz8MqTyIYF/kClBG3f2KBdO4FE3bGr0M8bCl57g/Cx1j/cC1yGj6q9YS77g3DBzDvZfy2fbK8FibGEP4BMf1D5DWk5KlFapgtnZO3q4DWc3dqYZz7VY0XXwD++fh2RX7GsUHryr8pCPaMDK5i1wD/uwYrpi6tp1/vlLFA3LcC1VDxr8dUZZCG9KEpFTnmByNVL2Cayqrgfal9jHFAofhM98ms1d8Q3GfWrODjRQ5nY59H1b+l9GM4s4i8Xf5yWXtvTs0FlTiMinY6rsvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ac2fc9a-4c76-377c-5357-daf993fd9967@suse.com>
Date: Mon, 13 Mar 2023 17:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@cloud.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
 <20230228173932.28510-4-sergey.dyasli@citrix.com>
 <4fee8e81-79d3-eafc-b806-ea061216e072@suse.com>
 <CAPRVcufSx6PTGKaycZBj2j-92zRYnHqx=8YPH5EOnWf9ujwAaA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAPRVcufSx6PTGKaycZBj2j-92zRYnHqx=8YPH5EOnWf9ujwAaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bb985d-80ae-4c95-dcbc-08db23e056ef
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fkNS7mjo8KqeOGM9qxnLXks8CWjcLbhDzHuVkoMRjCgquhmB8T8vPiKoLRrlYznrxXv9b5pMYqZegN8t+OcrZNiCQyBuKvPzvu+tmEwMtjFr2Ct9lzcm3YgoVCYw3ujgT46l6U4QnPeNR72tOp2oPbAJ7d5ypiw60nEyXrZt7pQ4kEVWIs1vzYMpj0ARxBB97q56oLdNVww/DfhsFex1ETBrakqVLQUZjtuvLzY0EiFUe4FQWNrmiKhE1N9H/vDuYb1dJaFm1Ilu9tfNBeTAedsYgPAgtlHUZasGC548e9MYwsvbELDgembEa5ebahyFrE9UQn+zrX92oNBJ0KU/pb9AQEQH5uQW99uc6+RMZc911EGhzDxPmsxk7ItrTrS/4lmW+i32W4U4SOp2vEdseoSdnRVhKPu7IjpzXkX0A30/ENCugSKhFfjCLcBcrnOWt6idlRZ3cyxVPuREXID0NvqQJFV4t+j7djfJmnv36Y3IiNEeY1HUtECNSzmWH6vrJ72j5FUjx9U/khviPwFI9ine7too7mDsStknWM5lYatOO2dFe00y/3exwINTsHHjyv4s3UjHMFXPxZETa+UUVI8j1DSrROqVZCClZWyvUSk0DTyhCtuGCUcC321Yide3DHZymAfExvqmJ0yAZv2DtOeWtk73/wA1/psepLe5P/9/dj/5wG4xIJY0RnOq3sK9q1FumaKb+rRfsIMdBagqFLXMofoEPQ1vGer8kKbbkkE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(136003)(366004)(39850400004)(451199018)(36756003)(7416002)(5660300002)(41300700001)(83380400001)(478600001)(6512007)(26005)(6506007)(6486002)(2616005)(53546011)(66946007)(6916009)(4326008)(66556008)(8676002)(66476007)(54906003)(8936002)(186003)(31696002)(86362001)(316002)(38100700002)(31686004)(66899018)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDJITkJ5eGdaRTY1bDcyYkllS25Rbm54RnZKd3RGNjJ6dmJDd3VaOXdiNHFR?=
 =?utf-8?B?dTZReVBacEVXQ0ZrY1F5b3h0V2NWdWhrc0FnL0RYN1lkL0lydHUxZ0RmVmFY?=
 =?utf-8?B?SGFWbXdxaXgxTmMzZ2VGQ2VBRzNYUGkyNXlMbGpGNkRwWGUzQVE0d2w5UzhF?=
 =?utf-8?B?K1hlWERTUVhjVmVwRC9ybW5JNUJWR3NwQm5yclhKSU8yUjVRNUs2NUFXbFZp?=
 =?utf-8?B?ZTdEcUVucktrSk9tMnB5bXJoTWlSL01Qa1RwTjEvSmMrejBtRHlrczd3ZXpP?=
 =?utf-8?B?U1QxNitPcUs0OVQ1SHBobWlFYjQ1SlZVVy9QSVhtaWR6RUdLNm1ldEFWbU1W?=
 =?utf-8?B?R0oyMTFUWFg3Z2tBMjNhVE5GdXBOeFFpRFl0Z2hQV2NVS081V0NodnRSYlFR?=
 =?utf-8?B?b0tKRXhtV0dYRWZGNytNWitKVWhNRnNINHhPRUVxdFVSVHFqaGZadi9JNlU5?=
 =?utf-8?B?WUlWRXM3NkxDZ1pySE9PYzZPUDhMajFBbU44anRCeUk2STBSR0IzOW1URWxn?=
 =?utf-8?B?RS9DSDIzSkEvZmM2bUE4NENvZWNlcWVOT2xod1NFemJac2Z4cjJ4WUhGVFF1?=
 =?utf-8?B?YzVXUjQxL0loWjB4c1dyczZXZmI3OUlvQ0tNdkJhYklkMlN3blpSNTJmYWZS?=
 =?utf-8?B?L2Y2MkZ3eUZ3UDFWWmpuREFheFdDYjlNYlZGVllrdkprRjhsb0E2SGIrVGRT?=
 =?utf-8?B?UFlIbkROSXpaYmNVRjdGcWY0WEdKUVpuSzNYZVdwZmwyVk5KZHZyb2hQQTFz?=
 =?utf-8?B?QW5Dc3dNZmc1cEZXSy96aEtMcDZEZkdyVWRIR2IwREhMSC9ueTRPQUY1VkJ2?=
 =?utf-8?B?MG5yNEFmcG83cXZrcTMrb3Y3VVVXSUhoSHcvK0NLYkI4K3AyOGdnMVZmMjV5?=
 =?utf-8?B?ZlB3VndBWS9IM0xrWDFrbUYxTk9oeG9hZzR6aVgvTjJmSm9VRkpMbk01VFBy?=
 =?utf-8?B?a1NLUHZuaTBSTC9BV2pDRzNndkhCNC80NmV6S0QyWkRQQTIwTVBJNWliUENG?=
 =?utf-8?B?dEhPaDc3WE91aEhoVStZZ3VxSmRtWGJaRys4WmFhOHZvdFdCaVFiRjN5M3R1?=
 =?utf-8?B?d1E4TjZRSHVlLzRrVnV0V0V3cTFDTnBVM08xWDF5NmcvRWhJMENSVEpkRmZM?=
 =?utf-8?B?YjRPUTRsTXlNNXJ6MWpwTEYxNXBhcXZJdUFrdUU1NTZzYW1TRGdxeEQxT0hW?=
 =?utf-8?B?MzhBQ0NtcmowQUxuZ09uMjZYaTVkZHdKY3ZHOUZoNTR4UHZKSGJybTZiMHVG?=
 =?utf-8?B?aE9VNlg2VGxsYkN4clFUUEV3THVwSVRMcDRQL0hqMm8wSnVNeFZMVmhwa1Vh?=
 =?utf-8?B?T2d1VmFPRS9nN3BHWFNybFpWdUoycTVNZVdqamNWTEZ6RjRxeG4xV1JWVXpM?=
 =?utf-8?B?ZlVWYzJGODFQUHFYZ0E2VDU1VGlWQkcrTm1DZnVBMUltRHFMM2ljYU5XUDhS?=
 =?utf-8?B?eWdwK2pMLzVVcUVKV053WjZGeExRNkk2VytiT1BHdkFRK2VhSWlmSTZzZmk2?=
 =?utf-8?B?cGFBV2Rsa2FqcDRyazQzNGw0VDVMRHhTL0IrbW9CS1lMdVhxcDZhQi9YZUNo?=
 =?utf-8?B?b0FoTUJZaTNXTytqakdoUTlBamE2RkZ0dk5sbnRJcnNMcGVHV0hIU0pvTnBq?=
 =?utf-8?B?RlhLc3FZK3JDdlQ3VWgxdHFEbWQ2UDJvTzRUeVJQWGV1a01kYkphOG5Od0tE?=
 =?utf-8?B?VEZra2k1SXh1N0htMkdpNjF4TUNTc0NGdndPRDJvbEI5VkNpYTdVQ3I2Y0Nx?=
 =?utf-8?B?SFBzK01IWWpsb2QvZTdqRVFjUEw4QW81dC8wU084Y29XVDFEQnFaT2V5QW00?=
 =?utf-8?B?UUtGYW5sby9YbUs1YS9iUUM4Q1hlYWZIN1RqVm85SkQ4MysvV0dQYmJNKzV6?=
 =?utf-8?B?MlQ1Tmg0aVJJSThIWHdldDVRYW04bkMwdHJLOXhZWWUrT0NScklQcW9ZNWRN?=
 =?utf-8?B?TmJaZEw5MitlaHNvTFBxSWRlR2h0dUVlZDJYQ2ZBV3hKNHFmSG1VWU5iZGFJ?=
 =?utf-8?B?T25mam41cXM5Z05ldndIclE5SGRHUGpNelU0TUpvUEdYeEY2dHBoUWZKTDEv?=
 =?utf-8?B?cnFmZzVJV2l2RFNNV2tnU3FkS2FvY1JEeDM2R01ER1dZTjZrZXl2MFZCWmlj?=
 =?utf-8?Q?NpWC+IhVpoc3coQ/w4vB9MADG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bb985d-80ae-4c95-dcbc-08db23e056ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:31:04.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMx3Sv+hhs3uSjMPRookCvTPwdH+PMHipSz/zvdH0HjbYn9rAMrhN2Fq8RrtaNwGNSmBRqwtZ0153RSUJM4xmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7111

On 01.03.2023 19:01, Sergey Dyasli wrote:
> On Wed, Mar 1, 2023 at 11:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.02.2023 18:39, Sergey Dyasli wrote:
>>> Add an option to xen-ucode tool to print the currently loaded ucode
>>> version and also print it during usage info.  Print CPU signature and
>>> processor flags as well.  The raw data comes from cpuinfo directory in
>>> xenhypfs and from XENPF_get_cpu_version platform op.
>>
>> While I don't mind the use of the platform-op, I'm little puzzled by the
>> mix. If CPU information is to be exposed in hypfs, can't we expose there
>> everything that's needed here?
>>
>> Then again, perhaps in a different context, Andrew pointed out that hypfs
>> is an optional component, so relying on its presence in the underlying
>> hypervisor will need weighing against the alternative of adding a new
>> platform-op for the ucode-related data (as you had it in v1). Since I'm
>> unaware of a request to switch, are there specific reasons you did?
> 
> Ideal situation would be microcode information in Dom0's /proc/cpuinfo
> updated after late load, since that file already has most of the
> information about the cpu. And the closest thing to /proc is xenhypfs.
> It allows the user to query information directly, e.g.
> 
>     # xenhypfs cat /cpuinfo/microcode-revision
>     33554509
> 
> Which could be used manually or in scripts, instead of relying on
> xen-ucode utility. Though printing the value in hex would be nicer.
> That was my motivation to go hypfs route. In general it feels like cpu
> information is a good fit for hypfs, but agreement on its format and
> exposed values is needed.
> I can always switch back to a platform op if that would be the preference.

I've confirmed with Andrew that I was remembering correctly and he would
not want to see a dependency on hypfs in such a tool. Since it's optional
in the hypervisor, you'd need an alternative source of the same info
anyway, and hence you can as well go just that non-hypfs route.

FTAOD: This isn't to say that some CPU info wouldn't be useful to expose
in hypfs. But that's then an independent task.

Jan

