Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2936132B1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 10:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432729.685383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opR4E-00039v-D9; Mon, 31 Oct 2022 09:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432729.685383; Mon, 31 Oct 2022 09:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opR4E-00037C-AN; Mon, 31 Oct 2022 09:26:50 +0000
Received: by outflank-mailman (input) for mailman id 432729;
 Mon, 31 Oct 2022 09:26:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CXQ+=3A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1opR4D-000376-4J
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 09:26:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2428a044-58fe-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 10:26:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8706.eurprd04.prod.outlook.com (2603:10a6:20b:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Mon, 31 Oct
 2022 09:26:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 09:26:45 +0000
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
X-Inumbo-ID: 2428a044-58fe-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIRNEsAllMSIAnLWqCatL3K88IzTJuo3h/2WlItfCNWezoMLO+quNSejAtyYmb5m+PiSoXmVsi/zvJitq2Zk5X8PsQxbt957RHItX5JNn9sBOPpobDmZGqo+0CIPTflgPZooTHwljIgAPbBAvx4jXCpUo8x9eh/7C/UuCVTvLzJnpiOlY6G3ntYfKk1Hc3+44WyEFG2f/B3Fdo+p/KVYpDfuDs6Q3kzBLt+NV9lCItz57pTfTnSvuA/NUPYzLqQR3skPPg45T6qrN+GQSkRXbmn2WsjUc0le0alFF35+M14MJ1DtTdO2nodwLguHJsqRmrIXUdh9WwKTr8R2kgxjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTlqkDrR386OTIQSyronbV5SigiCTNsZ6FGukga/31I=;
 b=nRHRSWlrPaL7p1YMbCGqMvu76oxKoY8/7nqkpjdaBPX2DB8tk2Gr0gzXpNRkMpeq49lnjee47GMaHrLJx3rJs6lO4spLwYUy1YkoBvVdUSEsVcQKrI1RhA8pJTfeCASoqD0mp/qPnTSJzuqMIorIBpTRdC593dX5NnqpUXBzAEo51oqjHLKpBTwy1lkdSQTK3X/SYR66a1irckF1bWHODfQZ3ymiU7uvvEg29Wrf02i29yUTY11voLv071SYsUHEoDGVlu8E4462320c8dgV/FvuCt/8/xKmnSkkNItKUtieyAuKYhCJIY0xnFPlXeCwmKwaympo7izGX3+ZnG+Z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTlqkDrR386OTIQSyronbV5SigiCTNsZ6FGukga/31I=;
 b=R2+4XhIlQ+PDG9cLUoeHBaol3tS87RuqqswxGf1eTfHXfPdtB4/fsK1hdgRf4YAZPxIMWpAyZ8tQMDEdgeyZOJDr8tAbCe7+TAMX9+vESdqRjuKZcEzetFRi49NLzFS2K0KEbA+PvHsY/ydAgO02/VDrWFcpJAhXAo9q41DH1SH63cexBHbEAAxaFLphzkfIyX/ks6MWn+L0sutoeEBJXCvFTVnreh2b3OA/frDw+LVSLPf6QVmBw3Udg8LXmDrUl5OlnLLKPH4iTvq8xSD9SYLFuwBWHaGygk404/wuW5QFEbx82kd0NaeGz8uTMDT+rjad8/g+xljY4Z3FZK2L+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a8a490b-fd5c-5fe5-64ec-975c9c4784d0@suse.com>
Date: Mon, 31 Oct 2022 10:26:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
 <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
 <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 88661de5-1d4b-402f-35bb-08dabb220769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DzRLm4RYn8XGtrdkJ4p7b3+UFX0zPeSutdLqUXXLFt381VGe+gLqZSRgiENJIpl1+4pDTXmjNGiKrly15LGpygW+k+CbuUiuH9QuLD3UJqcezEaAm1MZH6SuJBF46TTY6ldMJXOUj/og5ndiwA76Li5QwRDWd6x+nbzDzKVtpwpcHP0D6tW/JuBa/wjnp2PtDR+Jeyr21kgCETDmnqIk63zbn/Bof0+yepXSJNJsjBcGEKH6pGg3ll3pGkBp1imHMLKlwL/bQgc7VsPELtvh7hJMaO8uBFU/YUqoDf4bppVSkxNZ73Aqtg67rJKu4HThYwfTRWQTCG+nlJbS/iWewyFFEADN/X0oGRaeLGv1hF6Wqn0OlrkDPYRpx3aOQcik0LEtam7Ab6lFcO+IQ+vb0/RFtwnIWVMNKUNvolLBOusIafIgXSlDnLD9A8aPHDLbkHi5AAynPjJ1amWVuC2cMkVPAjMAnAAC0GdBT0vLBNjfLrH2KV1RuNh27nRuB4jEfugDoug0epFpIFSXziGN9jUQTIeuWPDpPvhLwNnkMcfdH0nmpGbE5DNhmXpc7uDOZNKhn8xlHBjGjizy2xBoh5kIEKJd10LV77SMDYnab/oWI2GQE7Wtf7peOXwWHR40uaaon9Up1TF9eD7jbriFSnGp9i+PR1FxCeqXCa/yaRJf9i1QuiL7mB/Ei9zvIKldiuvFl+UfgDldiZC7gCZZjUCeIBbfyLQJgRHMSfpyId9B9iY5SiSBB/WyRpIaL7s0DfA+CUkJCtoSDwb0J3rw1UtnWsGQbIkVelYP1w2XVpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(8936002)(5660300002)(7416002)(2616005)(6506007)(31696002)(53546011)(2906002)(478600001)(6512007)(83380400001)(86362001)(26005)(36756003)(6486002)(186003)(38100700002)(4326008)(8676002)(66946007)(66556008)(66476007)(54906003)(31686004)(316002)(41300700001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxqNEJpNHFITk05b3FmYnVwYXFGTlcxRFAxbytUWHZVU2I0bHk5czlsNE9O?=
 =?utf-8?B?UEhKdUlpd0J5cUUrQ0JZaFNSUzl4eWtLOFl6RGxZTXAyR1VhOXMxOU90TXlm?=
 =?utf-8?B?UlRmUVFjeGdDN0J4RnpoNHZCUHpSbytjT0c4Mml6LzJyNTZkRUhiZkZzTGQw?=
 =?utf-8?B?WlpxdUZBbXNMZnc1b0MxK0FrbHZlZElUalVBcXVWWnI2N2RCSDkwTmlXSEJj?=
 =?utf-8?B?aElRRmx6aGZBMlE5VS93Ym5KOUQyNGVOQVpmdytIVU9lZ1lOSFlpMDBvZE1l?=
 =?utf-8?B?VU0vZTNVcXpWTkREWFY0OExoa3ducjZoSHJRZTVFTUlTYkhJeEdMc2FlSnVF?=
 =?utf-8?B?dTFKMTlXRTNvQ0NBNk1XT1VrVHozRTh0Mndrb1BkSDJUa0lTS2NwWnczc1ZK?=
 =?utf-8?B?WnJPZTd5bUlVS3RhR2w1UWNqYjl5enBRdWxjdnkycVkvN2xsSUhtUis3bUJ6?=
 =?utf-8?B?NnJLZEQrb3ErS25Iekw3TUQwRmIwYzV2VTFXY1RWV1VwU3N5eHhmcnloSzNG?=
 =?utf-8?B?NFBRS2dKZzVYM0pIYzF1Q3lXRmhWdmxtMUZWektrYnRlRWRBd01md0J4elZs?=
 =?utf-8?B?RGtTOUxmWlJTWVAra3FVdDAwVU9rRTh6SGhkTUJ2R1RvZmwvZmw5WlAzMlVi?=
 =?utf-8?B?RTB0QXpNME1iKzNpdkpmdVdrNGkyOW5OVFhocWhTVVhLSjJ3S3VCdHZnd2Rw?=
 =?utf-8?B?Rzl2SmYwWDZ2VFJHWG9CdHMvd3lxMUtWK0NPZmRpMjZTNm5VREZFTVZQTlBs?=
 =?utf-8?B?d2NOUTg4N2xPNlZYTlpMUWtxS1Yxc3Z3empua25qUHNnSGx4RlBSZ29FSThL?=
 =?utf-8?B?WVFEMWlybkJRaW9uYi9aR2tXZE1jSFRvUmc4QzV1dFB5RlFZdm1UcStJSWg4?=
 =?utf-8?B?ZVdFV1NDVDR6UFpPNnNVeTBsQzcza3VVNGtwQjFpZ1RkUkJaQTNQYThRWFBx?=
 =?utf-8?B?SzF3czNtSkJpVCswYzZET2xHYk5FMG9iaUFVTm5MS0VFc2pHU3NUL0Z1TWlr?=
 =?utf-8?B?VlVxOVE5Z0d5QWZDb2xNVk1tVHIrMmIrSm44RTBiSTZmRkdXS0ZHK2R3SkxL?=
 =?utf-8?B?dFRFZjYwMmN6UG9UbGszcE1ISFJ5RXpqNm53SVF0WW00SS85cUJuYkFnY3E5?=
 =?utf-8?B?ZlNscEt5Tml6UEVGNUd6b251VWhLcy9na29tODlVNWdhVlhLL1J2anZWZEdV?=
 =?utf-8?B?TFBGK0I1d0ZxM3dKbEErbW9vcnd2c3lHZ29RVU1FSzNMYWlpSEE4U055VWJs?=
 =?utf-8?B?NnZCa09yRHZrS291cnluWmRBMGJ6OGdmRFNXTGFmVk9FZnNVNWFmajZ0N2FT?=
 =?utf-8?B?YlNSQWtMSENqN0Y4L0NaSS9KSzYrT1ZqOHFxc1I3QytDOGNJUnZ3UHA1akor?=
 =?utf-8?B?R3BNS1dnbEsxOFloelRBZXo2RVRGdlIrM2JHY1M2SHhZaGJZZmxPeGVQZWJC?=
 =?utf-8?B?MWRPd3o4UG52Z25FMWJjK2l6RUs5SFpPanpweHhtNGhRckxwOGI1UTR5bTIx?=
 =?utf-8?B?b3JsQUlIaHF6dlBDZTdCZTlueDlnd2dBU3dMTkh1QWl1OVRGS0FqZFovY3h3?=
 =?utf-8?B?anhMOG5kaHRQbUxPRndSK2lNczdIZTNORXBlTXltck5adXR2ZERxaG93MGVF?=
 =?utf-8?B?M1FiQTZxSGh0NGRiMXh4Q2JqVmc5TXpHTG1oRGg0MTJJMDlEbEE3aTRvK2I2?=
 =?utf-8?B?alEwcHB4M1lTdStyTUV6dk03ZVBudUNYYzI1eExGcGV4azkzTDBmaXNWWUhu?=
 =?utf-8?B?UlF5UmtvajlwSHA5QkhEMHd0NFdzQjdNV0VjZWRsR2h4c3NzYms1d1hEaUh4?=
 =?utf-8?B?YjFlRnV3Y3hieWRCbTIydXpxVnlSVkVWemZNMWQ0S0p5UXY4SzZjZGRCMTBJ?=
 =?utf-8?B?UUdGR0psRGxPWG5rdjE0VHlyZXJ6L01tczJoR1dyR0MzTjBUbTAzS0kyOHg2?=
 =?utf-8?B?TjFjTzZUaUVoYk5MeTV3UDU2SU5Cc0NvdXdkb01Tb0hkNjhpUWhtUEh1YTNU?=
 =?utf-8?B?VTlWL3ljTHhSakpKR1hLVGlRdExUZGllVVhxRlpFNVMrYkRlRVZ6N21SSnFL?=
 =?utf-8?B?QVArZUQ3OXUzTTkwR05lVHhoVGs5KytTL2p4VXZURk9kaHNXT3BkZ0t1ajQ0?=
 =?utf-8?Q?UbHllvtcpNTbtPQVIUS7XwBJ3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88661de5-1d4b-402f-35bb-08dabb220769
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 09:26:45.5214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPsK6qbKiwr8u5F+9EOomYr9xLDHmpoFWCWKGFaiOdUzITyoSCK4VNo5a7KmAIMqAmqIhCPK1hNmm40FF7g/eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8706

On 28.10.2022 17:27, George Dunlap wrote:
> On Thu, Oct 27, 2022 at 8:12 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 26.10.2022 21:22, Andrew Cooper wrote:
>>> On 26/10/2022 14:42, Jan Beulich wrote:
>>
> 
> 
>>> paging isn't a great name.  While it's what we call the infrastructure
>>> in x86, it has nothing to do with paging things out to disk (the thing
>>> everyone associates the name with), nor the xenpaging infrastructure
>>> (Xen's version of what OS paging supposedly means).
>>
>> Okay, "paging" can be somewhat misleading. But "p2m" also doesn't fit
>> the use(s) on x86. Yet we'd like to use a name clearly better than the
>> previous (and yet more wrong/misleading) "shadow". I have to admit that
>> I can't think of any other sensible name, and among the ones discussed
>> I still think "paging" is the one coming closest despite the
>> generally different meaning of the word elsewhere.
>>
> 
> Inside the world of operating systems / hypervisors, "paging" has always
> meant "things related to a pagetable"; this includes "paging out to disk".
> In fact, the latter already has a perfectly good name -- "swap" (e.g., swap
> file, swappiness, hypervisor swap).
> 
> Grep for "paging" inside of Xen.  We have the paging lock, paging modes,
> nested paging, and so on.  There's absolutely no reason to start thinking
> of "paging" as exclusively meaning "hypervisor swap".

Just to clarify: You actually support my thinking that "paging" is an okay
term to use here? I ask because, perhaps merely because of not being a
native speaker, to me content and wording suggest different things: The
former appears to support my response to Andrew, while the latter reads to
me as if you were objecting.

Jan

