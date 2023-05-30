Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF57157F9
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540767.842723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uNh-0001L8-9E; Tue, 30 May 2023 08:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540767.842723; Tue, 30 May 2023 08:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uNh-0001Hk-5k; Tue, 30 May 2023 08:07:01 +0000
Received: by outflank-mailman (input) for mailman id 540767;
 Tue, 30 May 2023 08:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3uNe-0001He-SG
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:06:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2629950-fec0-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:06:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7100.eurprd04.prod.outlook.com (2603:10a6:10:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 08:06:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:06:28 +0000
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
X-Inumbo-ID: f2629950-fec0-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8cGvdae7M5Xh4PYIXJ0TpcAhyY5/WH1iTZdxRr7hpDh34ReK0n1l7TJAAK7glyicAfuykbV2FajA94XtLpHJ/Fl8KX1rMg+vba+C6Goz3Orm1V5x2h3CnPo1hhOwX6iR2PbR99BRQRGBCySuJYDEl5V7mCFGRtyjS8PLLOhPLDct5U1DwAV1SMeX1W23jULAEIGYQA4P1+YIHdqIrrXv2fvCqexRzRQcL75ZS2D7D//yamdnh9U3ca+BYJdxVPjxbutCLkJ7x8qQLV7Z2NYAQ486FQYLnMXEqTy6vcYzb0sWDl2jLIVF1uVy2TChfJEbjNsfidR6ff2xasOSriKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHwNiK6jZO8xC/ncSOQrfAgpObym3fYYc5idrzpd99I=;
 b=au/+NgOglTmVnlwvKoNsAr3qgM5/3HobYC7saBYtFjD2Uwokb/EpmtWkexNXRJ2Pj+0/de3Ztym0vqoF4DwHmcmgPLXmeU0JP6LEtL6mv+egUX8krxgeXHBYlH8WIEyayg5Fcu3qFGy+psrwzieTxck/jChTkotDicynHbhe1RHzNugNWn5gcm8F8ATLnW55qqFnR59aIBq95Bj3ysT8AYaNo5qbdWmcsRsSLm1P9BEP5aPowZSO5WCVnzdPVD9mr+R5OAnVWfCXN6h9231LIYGoqxzi6mPWDrhgXJUX2tQHf1BDjZlvrJm9N6sihOfnqrGafsQHY0Go3KwbKzs9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHwNiK6jZO8xC/ncSOQrfAgpObym3fYYc5idrzpd99I=;
 b=U6apqAtWR0RaJv9Q3uIUjoFue9b9KMknatbP/tPi+eP3c2e0nQDz7RMDT2LI9xsIutKfR4ydOhlmBtO+PKaj6usybU2+FSO9tsfDPgn5ob7ni9nIAUqx41n9gl5fL5ZVo2wbXdXnzu8NIN/XOEdtTCWscLyJMfi6rh6hpqRxkdzO8QDazZGSSiEdWCxW2kkeXhUVoy2LCVzIJNxy9OCpGaSTTR9/FGRGEQShF61I6MwrSmJp760whldwMjkUYa6Bp0lPXk2ZeM+5Ll9gXtwxmQFe+YC2Jb9qwyiNnr815I0phvsnKUxR4OSelk4aB5QEcSz6ay9dRp9xCSnOhOioWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bba057a2-0a68-bf05-9a92-59546b52c73c@suse.com>
Date: Tue, 30 May 2023 10:06:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] x86: annotate entry points with type and size
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
 <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
 <ZHSp9+ouRrXFEY4R@Air-de-Roger>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHSp9+ouRrXFEY4R@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 5689e02b-7c1c-428c-bc1e-08db60e4c4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2h/fzW/CXfb6y+j144+kP/IU7NNbGXtfxU6LxqWoNL+P5zOsWLoc677vCS7Ify154wkQDFE0m3aVeWXqI8tadrHhpgBjnMUYIYELzSioOxyufzvZxn/1cz4nfF9tzEyraW3WfzdT7tkJovKDzkUfpN5GIMPs+BxMWDMtD/BksmQaMZYs96Tzgax+UlunnTIlDI6yiNqTRc9XEqIgpABUrud2Xuk/f0yr4oAGoQR72bF4MCIYdBvDQAELeIQncmzIK3zYrkAxMieFb7sLOcrveJ2Jqw8Ux1fFtk9PKmEcXR/GwJfJHFOzU+FNfrTIBR2NH2iJ09DyWtBlyIb1GDh08Qv66Adk0Un/J1pmUSXiSb7YbY5Vnf6G7AjP2ilXljiZz/mkTaA/t5GVVNU+wvlA/L7Dy8Cii0L4dzvmPPK3XnX/hoar239dvHRzn3PsKngWvHbDSF8NNWJ97FYUFBMY14KFzaTY6AcZiCEyc7oEcCQynwY1qTKR2INAkzwhZU3Sgj8Q+ca/JohFOUJScXlIsY2DXE3NoxseBttb2Z1xbClyWghZO/1DAOKbPmQHEPWIE8eHCgrF2vj9EBy3+v5D1VW7ZAtklWZ9cPSbTOidfxgoZPR27HxNACJ9zo1Lkgm49kbkTjK4pfccVEJxOZhOTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(54906003)(478600001)(38100700002)(31686004)(66556008)(66476007)(66946007)(6486002)(41300700001)(7416002)(8936002)(8676002)(5660300002)(86362001)(31696002)(26005)(2906002)(53546011)(186003)(6506007)(6512007)(83380400001)(6916009)(4326008)(316002)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS9PYWFya0JrWmZLT3p3RVNHbjBqM0UvalB5dm5XNm10aVlNekk0UEJSK2gw?=
 =?utf-8?B?dUErMFBrWXAzZ0N6b0hxa0JDbDhSbjVGajhSY3VjeHdZUW5XZExwSUlHQVQy?=
 =?utf-8?B?dDZvdmxubEFDb1dKSEYyV2syL3R2UEhvNVp0NmF2R0tqR2ppcjRsdnZweFBS?=
 =?utf-8?B?V2hxd1VTT0JWMTVhUGlQdllMZTIwcGdhcU1ZUVU2L2hwVWIvSW5wWWwzdUkx?=
 =?utf-8?B?SFBtcGpzSGhZeit6eXdUd0NpUjNEanNMSjZJSGFZTmtrd3M0YkpuVUpWSXo0?=
 =?utf-8?B?K0NyRFE0MFFtK0FWelozRVJYZGxmcWNpYWQ5N0NhenVEeUs5amF1cjBDcm14?=
 =?utf-8?B?dERpSkpsMGF2Zi9sU2xwUWcwTmkwTFNQWEZYVEhUVnYzWVd5cDhwVHJtV3Zl?=
 =?utf-8?B?VURoYmlyZXB4VUpKYlppd0NvWUd2WFEzTTE1Zm93dWV0MlZxUXAvU1N5b2dm?=
 =?utf-8?B?OVc3bWp2Yi9EQ1FyelVrSXlPdmJwblN4QWdMT1lEMDhZc0pKamYxdERXMVkz?=
 =?utf-8?B?dktwNjJZRk55TktuTUdtdlltWDNKT25WRWFDYk1Zbm8yRFdhZllXZmNTZU9l?=
 =?utf-8?B?azlFWlBWNjBXUStWdmlVSGVLcm5YTG10YStPcS9ncFRqajlEbDZmWlRTSHpR?=
 =?utf-8?B?a3N5Szg2VTNOaVlSaHRUZFdJdDVpV2JoVUc5N0FOT0lIcUVhUFF4NUYvNjU3?=
 =?utf-8?B?L0FzaktWM1I1NUFBVnJYNkh0TEMrOE1FTklpOFZvMjZWbklveCtZMEVxclUr?=
 =?utf-8?B?U1Y4THp5QWhETjJtRW5HekpZTS8zSCs2MGxnMmlkTzljbHFMMnByZGdmWXlz?=
 =?utf-8?B?Snc3RWYzMXVFNlN5U2h0OWQwbzhXMlJPUENWK0d0UkR4QmZ2QkNOMlVzMEZZ?=
 =?utf-8?B?QjkybXA2SmNJdXZuNEUyTExwUktaRm5ZTExPVEhSaVYzMVlQL3FrRVVtZitU?=
 =?utf-8?B?MHNHWlhhRU5iekxSVUxGN2ZuVnBBTWdueUpUNVhZZ3FmdHEwWVNPc3RHRGRw?=
 =?utf-8?B?eWtMdUFYWUZ2NW5lYUxqZS9yRWlsb1VTdFpzdGJyZkV6akU0ZGxxWjdabnh2?=
 =?utf-8?B?UVZyZEJ0anA2TmVRN20ybnZVWVJLRFJONlNqQjdHM0FsWUJhSEx0NW1Ta0pJ?=
 =?utf-8?B?UHArd25JSUd1eE1CNktzb1o4MFN4M09zM29TYUYwazZYVUduTzdnN0pyNlBt?=
 =?utf-8?B?OExqdXBuVnc5SzQyOU9sUy8xcUlzWTFzTnc4RTRZYjZ4cVBGTzFWOXpjNFZ6?=
 =?utf-8?B?b2JXdDl2TzNvRnVEVzNxZEFyYmR6RUZpZkVrd0VFTnNqdVBKNnFzRHlSWVM4?=
 =?utf-8?B?MnNwTFczVTB0WTdRN3RWUGxXdzJ5aGdnSWlZaExPVnRlanJkemp5dVhQUFJO?=
 =?utf-8?B?cklKWEZ6WkNnZTFQWHdmeDNPUHJoNEQrcjJSbDBpL3FDNTRqZi91NEwrVlAx?=
 =?utf-8?B?OFdJOEFjeWNNU240ckJoYS8rVU83K2FCUWxqNzBsYlRFWEo4VTVLQ0xvUWJn?=
 =?utf-8?B?QU5yTGo5Z1U0dThxYkRjdjhuQ3p0WjVIaFRDNGJ0N2J3czVBUVFPTzBmYXpJ?=
 =?utf-8?B?dVRQVXkzS2dTS2FMQnZwT1RtZ2xuQVYxaURBTXNqbFdqcXdjK1NYR2tUQ1k2?=
 =?utf-8?B?QUNub2IrU1FUNGI3KzVrNTVxNVBIT09zNHNQSDVWYnRFWHpITmhkMHBpRW1h?=
 =?utf-8?B?YjZSVkVnMzdwOUdwb1VYQ0J3R3N1b0NBY0VqNVI3VFUxQUZKMTIwdllhR3JO?=
 =?utf-8?B?akM5NGxqbWRTUGZYRkxvczkvQy9LY01qQUNzL3J6b1FEek05Z0hEK0E1WVB4?=
 =?utf-8?B?akY3Smp4OEhKRkxFeExBemJpWlphQkJ5Wkd5dDV1VC96ajM4VldtbGpnS29W?=
 =?utf-8?B?dEpQM3AvcHh3Q3hsUWdZNmlxRFlsM29VaDZjN09FTG1jQVFNSUhOc0xtZlVL?=
 =?utf-8?B?U2M2b0JManBIaWpFeHBsclkzbko5UHRteHU4ZmdOaFl3eE9kZ1Y2OUVTRzhr?=
 =?utf-8?B?SS93WUJoMEY4Y0NZVGVEeFdTUFZ3SC9aNXhmWmR3dHoyODg3eHNhVEgwS2xk?=
 =?utf-8?B?U2VyZUp6a3Z3MWlpNXhoNEZjVDJIOExqZFA3L2d3UmlIMmhEbTBTZXNaZmcr?=
 =?utf-8?Q?Hqh23Rj2xXgeKQkY1zcQrnl7V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5689e02b-7c1c-428c-bc1e-08db60e4c4df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 08:06:27.7685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfGRSdRPaHvcqfcXfQjAWFO1gvsGiv1rNoYX/q5Wz+zbiuhrkZkSjFLGKLSpD5xvToNzEIxH0dRdmgXUccDdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7100

On 29.05.2023 15:34, Roger Pau Monné wrote:
> On Tue, May 23, 2023 at 01:30:51PM +0200, Jan Beulich wrote:
>> Note that the FB-label in autogen_stubs() cannot be converted just yet:
>> Such labels cannot be used with .type. We could further diverge from
>> Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
>> labels get by default anyway).
>>
>> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
>> still have ALIGN.
> 
> FWIW, as I'm looking into using the newly added macros in order to add
> annotations suitable for live-patching, I would need to switch some of
> the LABEL usages into it's own functions, as it's not possible to
> livepatch a function that has labels jumped into from code paths
> outside of the function.

Hmm, I'm not sure what the best way is to overcome that restriction. I'm
not convinced we want to arbitrarily name things "functions".

>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -81,6 +81,45 @@ register unsigned long current_stack_poi
>>  
>>  #ifdef __ASSEMBLY__
>>  
>> +#define SYM_ALIGN(algn...) .balign algn
>> +
>> +#define SYM_L_GLOBAL(name) .globl name
>> +#define SYM_L_WEAK(name)   .weak name
> 
> Won't this better be added when required?  I can't spot any weak
> symbols in assembly ATM, and you don't introduce any _WEAK macro
> variants below.

Well, Andrew specifically mentioned to desire to also have Linux'es
support for weak symbols. Hence I decided to add it here despite
(for now) being unused). I can certainly drop that again, but in
particular if we wanted to use the scheme globally, I think we may
want to make it "complete".

>> +#define SYM_L_LOCAL(name)  /* nothing */
>> +
>> +#define SYM_T_FUNC         STT_FUNC
>> +#define SYM_T_DATA         STT_OBJECT
>> +#define SYM_T_NONE         STT_NOTYPE
>> +
>> +#define SYM(name, typ, linkage, algn...)          \
>> +        .type name, SYM_T_ ## typ;                \
>> +        SYM_L_ ## linkage(name);                  \
>> +        SYM_ALIGN(algn);                          \
>> +        name:
>> +
>> +#define END(name) .size name, . - name
>> +
>> +#define ARG1_(x, y...) (x)
>> +#define ARG2_(x, y...) ARG1_(y)
>> +
>> +#define LAST__(nr) ARG ## nr ## _
>> +#define LAST_(nr)  LAST__(nr)
>> +#define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)
> 
> I find LAST not very descriptive, won't it better be named OPTIONAL()
> or similar? (and maybe placed in lib.h?)

I don't think OPTIONAL describes the purpose. I truly mean "last" here.
As to placing in lib.h - perhaps, but then we may want to have forms
with more than 2 arguments right away (and it would be a little unclear
how far up to go).

>> +
>> +#define FUNC(name, algn...) \
>> +        SYM(name, FUNC, GLOBAL, LAST(16, ## algn), 0x90)
> 
> A rant, should the alignment of functions use a different padding?
> (ie: ret or ud2?) In order to prevent stray jumps falling in the
> padding and fall trough into the next function.  That would also
> prevent the implicit fall trough used in some places.

Yes, but that's a separate topic (for which iirc patches are pending
as well, just of course not integrated with the work here. There's
the slight risk of overlooking some "fall-through" case ...

>> +#define LABEL(name, algn...) \
>> +        SYM(name, NONE, GLOBAL, LAST(16, ## algn), 0x90)
>> +#define DATA(name, algn...) \
>> +        SYM(name, DATA, GLOBAL, LAST(0, ## algn), 0xff)
>> +
>> +#define FUNC_LOCAL(name, algn...) \
>> +        SYM(name, FUNC, LOCAL, LAST(16, ## algn), 0x90)
>> +#define LABEL_LOCAL(name, algn...) \
>> +        SYM(name, NONE, LOCAL, LAST(16, ## algn), 0x90)
> 
> Is there much value in adding local labels to the symbol table?
> 
> AFAICT the main purpose of this macro is to be used to declare aligned
> labels, and here avoid the ALIGN + label name pair, but could likely
> drop the .type directive?

Right, .type ... NOTYPE is kind of redundant, but it fits the model
better here.

>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -8,10 +8,11 @@
>>  #include <asm/page.h>
>>  #include <asm/processor.h>
>>  #include <asm/desc.h>
>> +#include <xen/lib.h>
> 
> Shouldn't the inclusion of lib.h be in asm_defs.h, as that's where the
> usage of count_args() resides? (I assume that's why lib.h is added
> here).

When the uses are in macros I'm always largely undecided, and I slightly
tend towards the (in general, perhaps not overly relevant here) "less
dependencies" solution. As in: Source files not using the macros which
use count_args() also don't need libs.h then.

>> @@ -66,24 +68,21 @@ compat_test_guest_events:
>>          call  compat_create_bounce_frame
>>          jmp   compat_test_all_events
>>  
>> -        ALIGN
>>  /* %rbx: struct vcpu */
>> -compat_process_softirqs:
>> +LABEL_LOCAL(compat_process_softirqs)
> 
> Shouldn't this be a local function rather than a local label?  It's
> fully isolated.  I guess it would create issues with
> compat_process_trap, as we would then require a jump from the
> preceding compat_process_nmi.

Alternatives are possible, but right now I consider this an inner label
of compat_test_all_events.

>>          sti
>>          call  do_softirq
>>          jmp   compat_test_all_events
>>  
>> -        ALIGN
>>  /* %rbx: struct vcpu, %rdx: struct trap_bounce */
>> -.Lcompat_process_trapbounce:
>> +LABEL_LOCAL(.Lcompat_process_trapbounce)
> 
> It's my understanding that here the '.L' prefix is pointless, since
> LABEL_LOCAL() will forcefully create a symbol for the label due to the
> usage of .type?

I don't think .type has this effect. There's certainly no such label in
the symbol table of the object file I have as a result.

Jan

