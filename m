Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FC589D95
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380464.614626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbxp-0003Oa-L8; Thu, 04 Aug 2022 14:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380464.614626; Thu, 04 Aug 2022 14:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbxp-0003Lz-IR; Thu, 04 Aug 2022 14:36:41 +0000
Received: by outflank-mailman (input) for mailman id 380464;
 Thu, 04 Aug 2022 14:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJbxo-0003LJ-DS
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:36:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9644c7d-1402-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:36:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9410.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:36:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:36:37 +0000
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
X-Inumbo-ID: d9644c7d-1402-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aswbek4tPS64AW3u6EViYBhgM6qGJr7xwtBE3pYn8/l0gFYrc7gQub1eXh+0QFWMAFq3fBnuS2F4MtpxnQsp+ocnbyrZgRsqVZHjdwXvRQ5wMECdze3EjgTRWVrYB0O30D1BoeCSBDPQO4cT7tgZRBSrxHXUa8k3m2613pSqXx0pMMJ0sRTBg4xrQtApj9O95R4E+Q0tygCdCrsREXTN780gd0ha3e6ruNaP02A/U8uabmy6/nm+lTPebrNYuG9KConfPh2umQjyJuVfeAnU/loSYKvoSmODCqtJhOkS26IDsfEAVZNLtG76hZdbFbk+bfwVZ53/IgH+IN3xlHEJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCrFzfLO4JwT40Kgl1uU/Intzf3eBBVTYERP1T9BfUg=;
 b=CVfSrCfWnEAgVYIaoat54WZLZyXORzYgwni4kVPwqQ9AoTQK/iaSF6FZIgm9p8ph5+LZhYhJWyeLYjKynFz8/36QZlfKndFPA2S+xbJ0t1lMTWpEli8WZpUJ4Cwmti/4pGatD0k/MsriUDt0T3c+AYk5Rxe5XOWLWjWkZ1I5ggO06q3MyCpAm2uPfFO+6447x5TUpJKX6Im/rBdN3rAcOCC1ro46uS2e9xk//0jQQMNrISz3qQxwiAE9zBvg1b6eTqTtZknyOUV/hsmspnMXzvyp0bshVXjp7EAT6shRb0ofP6ZSQyXpa29KaiAlfSK0WWq3evjWedBF6IAbloXosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCrFzfLO4JwT40Kgl1uU/Intzf3eBBVTYERP1T9BfUg=;
 b=kxQbycklRub3cycLRIgzK1GA8X0yVy/VwJ9IXYuZoFgFMdYWu8hMDBokb7zE0nG59fXUAWUWwpHsBMKtltfYNp0C4rEZtXiAeY6+k1ZCIz+3vguNhP5eTK6R2RYbajKjMzVoq5RdHU7ij3qSXfykOiZqrxmJoOm6jvDUiKvEoM5ivI80iruvlJvBAURx2ZoWiN2PtBT8Nt3+BhTDUut5hdDdubX9tpI6ZGtUcq0oQxYVaeKUF3YUGJblnjXG4Be8amyPZO4QF3ui4nS69l7XpcU61y6LIZzcizRcAdYGwzmLp6X/zSxk/iGyMU1ObjnB+j/Mm8o/ILg7bFr5v03R9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fab2ccf5-43e9-e341-f448-092de2c01f17@suse.com>
Date: Thu, 4 Aug 2022 16:36:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com> <YuvM7vElH/IdBJjq@mail-itl>
 <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com> <YuvXjEZMlwjsuIGA@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YuvXjEZMlwjsuIGA@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b2f1786-7d0f-4659-69cc-08da7626bcc7
X-MS-TrafficTypeDiagnostic: AS4PR04MB9410:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	04SODQoxaWKry9uir1nu4upavX6K4UBo8aXr57PMtUvp6cB94KJxVF8yu8ZnJ1eqoDA7d+KR6BLmRC3jda5mdoZ+h+mc4cM7k59mUx96Pf6Xj86X3jLEmYF8NXW7ugY7wh+WktD6Wl8D8e+W1sjf8fPpRhmZkg7OxfBPuSkZNgkB7r34C8eO5DNjVrJ+xXmXPDBSvPAn7WImr8jIH0naUsg3/73h/mhmg2ADbEcf04btPwrV3CwGHR1WUEne36z5KAoiDKrw5Qi07Aimx+3StX159lisQk75b/KSa86W1TLLrCjW6FY5ys2ZsCMw4BaiH9bo1e4WBZPylUkxKYlcLqrY6ud3qt18c3Fm7oPj9lynRtEZUBeCh6ooTVm/RT+tx2Bt9QhOcR0ydr7AD0XvjH05UU4bFKiJTNNwEV/oO/7UgJcZZ+qtJq1x0AAvfU8qj7lhpcB0n1AkQo3c09K6QjAPns0aDxryVLxovANYDD5Ph2s1BINB97dYXPd2Q8fD0OtwhsJM24uFId61f5Da4F72GXcKuWxzZnHzBbs0l36vz/+gQbTKDVr0j3tfKfpTDP9vRuf7Qs7b3CRqykXeozCtKgwVumYI0tsCBwJ+yC0PgMXvSCflL4XopyYcYWgEetkk4mr9cN7OBki4EXFsAcRlnFY6PL1uJrlUyDIW4wmHY0uIu+d6vq3HdfpQahvcR+Elq9uI7lMpmwTwgkaVfK2IwZQnpwG0SdxUQLSHDLeooOMF6yxcc1FeEqg5385iL22P9rMq7OavSLyrMpTsaaHsVzFFXXn0BhVAlR/5B2YNkSX6v+IIzrjtiUYyUGx+m5ea19R6s1ml63JSuez72g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(366004)(136003)(376002)(53546011)(6486002)(2616005)(38100700002)(83380400001)(478600001)(186003)(2906002)(36756003)(31686004)(41300700001)(5660300002)(54906003)(86362001)(316002)(6506007)(6916009)(31696002)(6512007)(26005)(66556008)(66476007)(8936002)(8676002)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blNBSWloSHMxcUpNdDQweEx4V3NVa2s2TWE3V0lEbTMyUWU2YTNKbmoybXk1?=
 =?utf-8?B?Q0dSQXB0cGFsbFJYUXBOVm50RUhIMGlTNXUrSXdVNUY1Rk93UHBoTms0dWFZ?=
 =?utf-8?B?RlFmVExZTG5ad2RKaUR2VDMyWnQ3TWsyUVl0VDFoOGJmRXlIUUMzdjZEMWhF?=
 =?utf-8?B?SVV3T2ZXQk10UjBmR1NCZ3NQKzBqNWoxY1NINnpOblRmb3lRMEtsbkdPdUdv?=
 =?utf-8?B?c0lOWEVYMkYwVEFpcFdWQklCVWNXaUt3NUN4RWV1U3pNaWdqa2hWb2pqYXNE?=
 =?utf-8?B?ZjcyYmhGSFNmSlJwNlZzTnh1TDZnM1RUckd1cGdBY3VmNmp4LzNTZXJIdzY2?=
 =?utf-8?B?Z0dGNjRtKzNIU3NXZENsUDdYM2ZPN291eCt0UEIxYVBxN2lybjlwTnM2Snpl?=
 =?utf-8?B?Tk5XT3BDQXlzamVCeW9uNENwS2g0TEdiVnFjeURURTFXd2pjeVdjTFVTSEkw?=
 =?utf-8?B?bjkrd3orQnF5dldQaHFMMjlmcm1EU0lhbjBHQ1NNVnFaUjdJcS9XcFJwWEND?=
 =?utf-8?B?dDF3UzdkRHZMRkdKa3Z1ckpkZmwvWXdITmI4RnZSSFR2RzVKWmg4dWw2aVdi?=
 =?utf-8?B?VWJnUStBUUROY0JOL0hDOUc2a3N3b3NWMHhkb3pnTlI3cFcrZ3BmZ2luY21P?=
 =?utf-8?B?T0d3YzRRQnFOcGp6QzdCL29kcmZkQzZwQnRqTGhrb1VlT2FNNmdhYW9pdGZn?=
 =?utf-8?B?L2JldEVyVTNkRFArcHN4TTU4SDk1TjU1ckhjZWZFQndoc2t1Nkx6aUkxaFZs?=
 =?utf-8?B?RUsyWWF6OXdlUmVUaXVuT0FRcnY4Yzd0ME5hY1RkS2JhUVpTVTlOa08yWEJr?=
 =?utf-8?B?WWE3ckJGQlF0TnBSU0Z4OUtURXhnKzJ2elR4OHU1RzB4MUtZM0IwcDNHTVhn?=
 =?utf-8?B?L1B4am5DWFBJMlNDR0xacndPQmNDb3hCLzV1Zi9Id2U1QStoSVkyb0VLQUV4?=
 =?utf-8?B?cGxueUJhRU82ckpaSWJaWjh1WmZMbUFjRGM4ZFloY3FFT29qMTlCcUF1ZjBW?=
 =?utf-8?B?TDBsQ1UzU0k0UHEwQnFtRXZiWjljN1hmamE1QkpldWt4ZnliS2k0ZG85dyto?=
 =?utf-8?B?V0syQ1E0Ti9zNWVKNGlqUkJsa05mbmswcUZpQ3Y2aURKWVBDNlh0SXFPQlNL?=
 =?utf-8?B?UDA5MTRvZUxCL091OGN1dHNSWklwTXFYT3NtaXpxTFdpY3A4ZVYrQzBCSG1l?=
 =?utf-8?B?Tk9TWTRlNXpvWWFMeTA3dEJJczc4cUlyZzdBMG9wblB4clNsRUpSK0dHOHFi?=
 =?utf-8?B?NzZUZTBhbk0xelZCMUsvTE1QMUU4VGJmZml4LzBRdGk5OXBPV1BrajdSRDJ0?=
 =?utf-8?B?a1g0M2dWOVptVWpibTZuUStuTXUyNVBCbU96WS8veDViL0RQOHdSK1hCWW9n?=
 =?utf-8?B?QjNCUkkxWWdNQ2l6OGRMbDljRDlZaDhhUGxZRkVSVFI4aGtVVXhubUdOamdM?=
 =?utf-8?B?ZEErSmdVM3kzTTBmdVJETnliSHk3R2ZCcUJLTkNKU3hMcEovZmpvL3hCWnow?=
 =?utf-8?B?R2dJKy9VS2kwcm1nM2kxZzJuSlJSMGpKTzlNMkV5eURWcTAyUjVCbXNCL0gz?=
 =?utf-8?B?c2Y5OXBnWE1HdldDcTVmblNwRG5GdmhZbUFxOUNjVE1Hb1JseExHMlBIWEJq?=
 =?utf-8?B?SmF4cjlJSytUMkRIQlVMOE5KeC9aWmhKUnBIc3prc0NMSW1WdlEzamZCSUd6?=
 =?utf-8?B?dkNtbmJoMGZPRkF1VjgvcmJONVRtbTFYTGYzaTRCd3FLQ0FWWTJoZG1nb2N2?=
 =?utf-8?B?Mm4yRG5UQ3RTZzhjKzcxVkNnZnVraUptR0p0ZkFhRk1NUEovenQwUk9IVEkr?=
 =?utf-8?B?Rmpsd0pCU1hMenV5bERlVWlQZkp2cE5XMnVNVTVheUdPQld4R3FCUGMwSFZ3?=
 =?utf-8?B?RVBSRkxZaDhYTUs2TnYrNjlLa25IOGZQVHhILzZTTHlJcGNHbUROdWIrR3du?=
 =?utf-8?B?WWpJaU5vRnRDNjNFSzdlOFd1VzVwOHF1TGQ2WVZHdFJVT1I3cDdjeE82d0RF?=
 =?utf-8?B?eCsvaENTbEJFWS9uNzAzcTV3WExJRE9NYzE4MlFSS0hLdHFtK3E2Y211MzFM?=
 =?utf-8?B?RFJkVE90Y3RzTS9ZTmUvRzJiYTRXd3Z2ektNUmkyQmpESi9BZmxlYW5GQVE1?=
 =?utf-8?Q?9yvcFwLxx/0sUvNcGtHdWaYTa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2f1786-7d0f-4659-69cc-08da7626bcc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:36:37.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWcTHjKQtbuh+69Nydkkv9+JxiAu7CJJOp7sy+oZFjVQ3qjaq/XpWgaZBSQUbaQP4ocou2Pzy4T3JPA3KzZSLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9410

On 04.08.2022 16:28, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 04, 2022 at 04:21:01PM +0200, Jan Beulich wrote:
>> On 04.08.2022 15:43, Marek Marczykowski-Górecki wrote:
>>> I need to keep this structure somewhere DMA-reachable for the device (as
>>> in - included in appropriate IOMMU context). Patch 8/10 is doing it. And
>>> also, patch 8/10 is putting it together with other DMA-reachable
>>> structures (not a separate page on its own). If I'd make it a separate
>>> static variable (not part of that later struct), I'd need to reserve the
>>> whole page for it - to guarantee no unrelated data lives on the same
>>> (DMA-reachable) page.
>>>
>>> As for statically initializing it, if would require the whole
>>> (multi-page DMA-reachable) thing living in .data, not .bss, so a bigger
>>> binary (not a huge concern due to compression, but still). But more
>>> importantly, I don't know how to do it in a readable way, and you have
>>> complained about readability of initializer of this structure in v2.
>>>
>>>> That struct will be quite a bit less than a page's worth in size.
>>>
>>> See above - it cannot share page with unrelated Xen data.
>>
>> I have to admit that I'd see no issue if these lived side by side with
>> e.g. other string literals. The more that the device is supposed to be
>> exposed to Dom0 only anyway, and hence that'll be the only domain able
>> to get at that data.
> 
> Other string literals are fine. But for example `struct dbc` itself is
> not.
> See how it is combined with other data in patch 8.
> 
>>>> If you build the file with -fshort-wchar, you may even be able to
>>>> use easy to read string literals for the initializer.
>>>
>>> I can try, but I'm not exactly sure how to make readable UTF-16
>>> literals...
>>
>> L"Xen" looks sufficiently readable to me. We use this all over the
>> place in the EFI interfacing code.
> 
> Ok, I can try that. But given later adjustments, IIUC it will make the
> whole 50+ pages structure land in .data. Is that okay?

No. I was actually expecting the piece of data we're talking about here
to land in .rodata, and hence be re-usable at the same address for all
devices. Hence my reference to string literals.

Jan

