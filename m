Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A96B8B3C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 07:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509459.785239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyBT-0005G0-LF; Tue, 14 Mar 2023 06:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509459.785239; Tue, 14 Mar 2023 06:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyBT-0005DM-I3; Tue, 14 Mar 2023 06:30:55 +0000
Received: by outflank-mailman (input) for mailman id 509459;
 Tue, 14 Mar 2023 06:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbyBR-0005DG-2W
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 06:30:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c22f9ce9-c231-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 07:30:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7126.eurprd04.prod.outlook.com (2603:10a6:20b:117::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 06:30:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:30:47 +0000
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
X-Inumbo-ID: c22f9ce9-c231-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXDKhc0laKUwPTfN5RlRnMIEOKNSWIgkWcXgmxGVlx2M8Z58mS1aIlya35UD8l5kCbaNhNj3pqgeMoZDn+KKCoG7pFgNf3ZJ7ERAXg22vuy++OH2deEOQTIDJ8nX0yCNFP2bi6mNsH5/VJQFuXo6A5OPe4C8IHUfvR0oGA+EothCFm9afZcHo+g/RVzlKJTSrULdFysP7q89irSRKasIsBJxhVuBDBAkQTp8KL4DzaykZHPCItWcNiVcWcqfRjxIa/AovAoDo41H/9gXJxxh9CGHDtOrIV8bzmtKbKfJiROS4uvM2XWLJpOSwHeLFUEWbSToSWrcGsUKNEdXvomCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw6ljLsSE+ZLLg9TU+6OcuJNklBMqa9CuHOfv4lUHeU=;
 b=A30w4h6pU1onk5Er79CCxP9477rH7fPW0B2ukRZD74XCMSMn6r//+YbMgZ92sclgLbBCyoeHLtW1mDZ3P81PxXUlarFk6rfnuvLsT43O+g+t0Q5DBAjc5mXgkTuZ8TFL/D9FPy58MoDk3dv1qRtqOS+g9A0Ge7T+XZsvjQyf0iFFgBg5Kr+++5dw0UCAELWB7dympHau8KusZIr/6hrbvbpeyJoO0U8qe18KJa1qiXee4F1plGjSGabiwdDlevSss37c0B9FoeLLjZG+oJeWkaJLfR48p0q2U3oUtbfk4TPXJ9SPdJVbhwBsE0hnnbxqP6FcNkLepPr4K6qYfZF9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dw6ljLsSE+ZLLg9TU+6OcuJNklBMqa9CuHOfv4lUHeU=;
 b=K3KeuBPI/b2C/UH256oPSn+9beBt+4dHGXT3q6ksSVc9ona+THT8l7oIuNmkDabBwdkP7WpC/tBIZ/sNHCj3wUDDNppX8ey/NVdyouZCJCcTh9QpliXnS6nOsgAdkWtAWRyvMM9KMZahX5n3/MaEef4KF9FDVQsSeSOw1n/KJcSNq6Mds3xf7SXOmwDTEoyJvUoYkQnLEdecvXk0qJ6BJWJ68zsbZhysqjad8TMnGQ1MVU/qCD5x2JN7gHSpDBe3d8DaoM9jTPGAVk7+DLnv2OptYkHeAGPFdjstsg0iPheQcN66kbw/m5r2cch639StXUNW2RNBH0LVe9AaeyP46Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf072acd-9d50-a5df-6a0c-c36cc20b575a@suse.com>
Date: Tue, 14 Mar 2023 07:30:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Drop ELF notes from non-EFI binary too
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230225235642.38880-1-marmarek@invisiblethingslab.com>
 <9fbbfa17-821f-8c9e-376e-911481a1988b@suse.com> <ZA/SDWh5NwrvBJeb@mail-itl>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZA/SDWh5NwrvBJeb@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 40691010-65a6-4d72-1042-08db2455a4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mVAqKPopOhsGJKfLKcyvH74BC64WzJBV8mQ51nylfM5N4P8WcgQgofBybEkryfqVVHFBfDI7V5WqSpR5p2q20xOixOvgwEBjOVqTyDRk7hYVgp8+FQmby+lstM9DRAOiXRIxVc38WZHeiJ32SMZ88/WPNQr1rjuMcoG1tGRYZ5DYN5oHM1r7903RdbbN1p450coDfyRxjykVL4mHKacOsMiPl9DJq9tYCFKCSYjOMzWzbrBcm171vOFaQ8SApw/RrLUzfr0MQFBQySzAv80qT+WjuRseoFN1VFK4JiRfqWXcooSlyUZvDB6xlBRvVL13XVghGS5oska6nI3wzR2VcTuHOp+Erk7HqQL3cI19ifv/Ws84r5QZPf+WUuWtiefaVYf5wYA98RDxqdF4oSY04jFbEkh25E6wOaZWAurU6Wlb/sOIA84HBVZc4qzMG+MlH6IXPTqRm2lHf8yIAnxptPaUzCOfPdxyvqzjVoXw1Fv688FCtA1/RgGUbXmaJF7xDU29OygdWGl3VGGNzsOnd4zq5dcnyID+jlnKPJOckyVtx/AZhumTY4dFwkx5GouMdjo3VpioNv5BKZqNCPRUhaGYW+wgK5hV89fw+2s1ODXfoLwYzSKvyFlff5sNkWq0ShIYCuruGooAG6uRoEi/lDJm9P1rduhWMoigPBBOgM+YSKcmjO7JPjJQWupfN9tuKKKu+9XXkaiEwSX/8aFY33E6b9JG8c2JED5IyXdwCtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(396003)(366004)(346002)(136003)(451199018)(6506007)(31686004)(6512007)(53546011)(2616005)(186003)(66556008)(66476007)(316002)(66946007)(8676002)(478600001)(31696002)(36756003)(4326008)(86362001)(6916009)(54906003)(6666004)(2906002)(38100700002)(6486002)(5660300002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEdYRmdwNTRXbzBxTHUyQmx1N1ZVYXhlMEoxSjdqdk9xdVNjYlpOZ3RIM212?=
 =?utf-8?B?ZnRiZ3FGT1dFM0ZkTlAreVhhRGpybU9JTjh4VU1DL1BrUS80WWQ1cmtBUnVS?=
 =?utf-8?B?bTRUZDMzWHRMMFI3YSttaXRNcGFFOVBydFVhdms2TUU2a3lTcWRidEgvbnh4?=
 =?utf-8?B?am5vRS9tdEpMUTVxVFFXeldyOTRhRGJ3ZHZzRnlJMDJjU3VZaEI2QnlMRzNk?=
 =?utf-8?B?MjdEeW9Na21PTVNRZzEvQUNQbnZNREN2aGl4YzVVOGlNdWxGTVVESkFhOTdS?=
 =?utf-8?B?Z2NDMmpoWE9ManZaNitxbllEN3VUSEp2ZUl3dEVMSS9FNHNsYlBrUTN6a3Z1?=
 =?utf-8?B?VG5zaXUzV2pmTHlYb1hBTXZKMnMyMkhIYmdHbEhHTFBMcTdWZHlZVFNJVHpW?=
 =?utf-8?B?RExCUEZ0endhbjg2NldEOFZUTDBnNTRaMUxkYzc3TWZNQjB2Y0czMGtXb2o0?=
 =?utf-8?B?MFpZQVY1WEp5NGZ2b3BMdlFMYUlhMEFuSWkweE15Q0daR0owOVhOekdlRUg2?=
 =?utf-8?B?RTV3ZUgwTHIvb1RIeVNmdzdKVE93WEZxTmZqaUZaWEk1ZVNJaUhLWHFNUHB1?=
 =?utf-8?B?YjdPMzlOQVRQZStzNnl5QnpOWHFQVTJFSXk4RFBwUlMraWlqMFEyVTBiRkJp?=
 =?utf-8?B?eHZtcEhTVUYyeXJURGI2SmR5Nmk4eG9rZWhxb2w2VUQxTFhYV1lDN1NUbFI5?=
 =?utf-8?B?ZTEzRERlWmY1TEdxZUNSOHFnejd5Mzc4M1hJMXRjWTNYbFVJSFFYSDdKWjhE?=
 =?utf-8?B?WmpQR01IbzdlYkYrSUhGeXB3NWFNeHE1K243MU1kY000d21uMFpVNXJyL1hP?=
 =?utf-8?B?R085eWNkM3hpZ2lvLyt2Ui9BQ3RTK2NaZlBFVUMxMUNKc3BDc2FpaU80ankz?=
 =?utf-8?B?NU16Ym1wVjFHclhGQTQ1Rm1PNEw0NSt4STNmUHkzVXczQ0tWaFJYamJ2aTRp?=
 =?utf-8?B?QUp6cHRNcndOSm9XQjYxWW4vYlZBVFVTZHlNRHVldCt5UFV0ZlViSmJjam1h?=
 =?utf-8?B?STd2bllKa3crbnF5ZEh5VlNNSFRnZXh4WTkyZUxHWUFyMmdoZFF1Nm10RU9S?=
 =?utf-8?B?eEIxWGhUUkxqenMrUFlqK3R0U2tQcGVXQ0FYMHo3VW9MQTZJdit0NVRmT0RO?=
 =?utf-8?B?OXFDaDRJZ0JGN0tiMVRmREE2RDFqZ2RTbkU0N1IyZUdiZ1M5dGN6N213S0NL?=
 =?utf-8?B?NUQrQkNkNUU3Y0RKOXJ3dTZ6WVZ4S2k1Z21DVVYrRWdJYkJTTS9oTng3c1J4?=
 =?utf-8?B?QUNKQjhBbE51SERReFpoVWxUZExXYkRLWnRic2NxSVQ2WjRDOWxLNThEUkJo?=
 =?utf-8?B?dkV2MGFwMkVBSTlmMlFYWVZNNmlLWDdYNFQ1WGh3bTVCdTlnUS83RHluNHVC?=
 =?utf-8?B?MTlDR3FtVlp2K2EzcW1nWkI5ZENkZ210TThhNVJYYXlWWnV1RzBYZlJrbXhC?=
 =?utf-8?B?LzY1ZHNKVlpsdTkwMllwcnZzbmZWa0wzWTdqTEZWSG1ucWtaL09FQVljMmJ0?=
 =?utf-8?B?MUJITmVPWHFZR3pocDlYamFKbUhiTitCM2FHTHhGVHlnUVBoUWZCR2NQZXlq?=
 =?utf-8?B?Q01ieHhlY0w0M2s1RStHVk5nS1l3enl6czlkdTZDbjVjUUo4M2N5K0VxYkhs?=
 =?utf-8?B?SWh3cXo1QnhRWWRaM3RKRTBJKy9XNXlneFY4Y3BQYnd4TDdVR2NhNHRmR0dm?=
 =?utf-8?B?QzFuNHByWG5zRysrMldmZ0d4VEJYbE91Tk1XNERqN293RzhsK2NadU1oZUZ3?=
 =?utf-8?B?dmhkSXVZUXRselRaY254L2RLU2s1RFJ4RVdlNXBlZmpjZ0VXZHVNeTJFOHpz?=
 =?utf-8?B?dVVIcStXOXIvWWFkODVUU3dDVVRBTmsrU2dxV2xma1M3UVBJR1dITWxsL245?=
 =?utf-8?B?T0JKTkdQSDZDdjkwTXJ0c3hxUTBXS2h4MXFzUGtieDVlMWwzUVcrV25WOWxH?=
 =?utf-8?B?L0pGakJlQlJlbVliTjRaVVQrZHN1bi8yL0srNTN5QXpmRlZZYlBmZ1dFa3FS?=
 =?utf-8?B?azN2ekkzcEo3Q3hXREZMYWZVVjd4NmVhQlhZelY0WU5Gazd1a2F5bThseG1m?=
 =?utf-8?B?WXdqd29xT0RGTmFXREVRc00wM1FTMkM2QVV6SWpTVU11UkcvcVkxTk9kY3lU?=
 =?utf-8?B?czN0QldiSStEYXdmQzNRMUhrak5BZzdRRktZNkdncHR1dnVDR2tESzhOM2ZB?=
 =?utf-8?Q?HQRCPlMaEWz4a66IuDsyNn+8/g2vKix0fn4O2IEYu9tU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40691010-65a6-4d72-1042-08db2455a4fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:30:47.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNzQIhp+vb+hLBx1yAYvP5pvdU+Tl4EWDMDcHMkbwHAt/G09LGguvarYghAmqruTEoOemFu1/DR7ZkeUijz7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7126

On 14.03.2023 02:46, Marek Marczykowski-Górecki wrote:
> On Mon, Feb 27, 2023 at 11:28:28AM +0100, Jan Beulich wrote:
>> On 26.02.2023 00:56, Marek Marczykowski-Górecki wrote:
>>> The ELF is repacked from from 64bit to 32bit. With CET-related notes,
>>> which use 64bit fields, this results in 32bit binary with corrupted
>>> notes. Drop them all (except build-id and PVH note retained
>>> explicitly).
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> Perhaps a misunderstanding: Yes, I did suggest this as a possibility,
>> but I didn't really mean we actually do so. At the very least not
>> without further clarifying what the cons of doing so are. The notes,
>> after all, are actually valid in xen-syms; they become bogus in the
>> course of mkelf32's processing.
>>
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -192,13 +192,6 @@ SECTIONS
>>>  #endif
>>>  #endif
>>>  
>>> -#ifndef EFI
>>> -  /* Retain these just for the purpose of possible analysis tools. */
>>> -  DECL_SECTION(.note) {
>>> -       *(.note.*)
>>> -  } PHDR(note) PHDR(text)
>>> -#endif
>>> -
>>>    _erodata = .;
>>>  
>>>    . = ALIGN(SECTION_ALIGN);
>>
>> Is this sufficient? .note.* isn't part of DISCARD_SECTIONS except for
>> xen.efi. I would expect it needs to move there from DISCARD_EFI_SECTIONS.
>> Otherwise, aiui, the linker's orphan section placement will kick in. 
> 
> What supposedly happens then? By looking at binary produced with this
> patch, I don't see other .note sections included.

The linker can't really discard them without being told so, from all I
know. So the pieces must land somewhere, and considering the special
section type (SHT_NOTE) I would find it odd if they were folded into
some other section.

>> Yet
>> at that point you'd also affect Arm and RISC-V (which, interestingly,
>> don't place .note.* anywhere at all right now, afaics).
> 
> That's interesting observation. For RISC-V, I'm not surprised given how
> fresh it is in tree, but if Arm doesn't need it either, maybe adding to
> DISCARD_SECTIONS isn't such a bad idea?

Well, yes, if we want to get rid of them, putting them there makes
sense. First we need to figure where the notes end up when not placed
explicitly (as that'll tell us whether on Arm they can be useful at all
right now).

Jan

