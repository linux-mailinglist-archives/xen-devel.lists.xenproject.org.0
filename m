Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18B6D5D8E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517808.803652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdwy-0003jc-03; Tue, 04 Apr 2023 10:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517808.803652; Tue, 04 Apr 2023 10:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdwx-0003hS-TU; Tue, 04 Apr 2023 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 517808;
 Tue, 04 Apr 2023 10:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjdww-0003hM-LU
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:31:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa9873c-d2d3-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 12:31:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 10:31:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:31:33 +0000
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
X-Inumbo-ID: dfa9873c-d2d3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPs6cxSRpxJ0evezqtVW3GhqqpF9JGlPRnTVvwbE5C1EmYgJfz51qB0WNAF2D/ztlv6pHuNsdxxoRmwvILwIoJFG1TtOXtrnQqrS7k5Vnvv9JhPTqvVhUsNm/3yngqifFXEbCowGYFJJvkhLpiHj71/8TFasf//gC8sh7FnFwecicQ7qGYKk0CbVJleLbgCdxizgYr/tq9/QL+NtfLXsJRR7XpVjl0u3iHsqVAy6nNzg1pKDrP6DAj35qBAMaAnOjxemCAzoDYn+Bo3fnGeUEOkVOiJ6VEoXdXFUTPDc8eXX0laobm8uT8LsdkTXGUXvECUqiUzCGJcPXL0864C9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK5yEcXmvmF9LNfOBdI39ph6figLkQWOz0P31QY8dBg=;
 b=odvfKTC28lKLHP5xiLycaN/exVvFShAjRlrNj5mQBB6hKk5a5lY24Bd7iJm2l4PNELNE4StN1AlQ8HuY/iJZdZGBUyW8w/lOMEln7ENs08eDpZvXZFWNjf+6aZC/zgAtfzH0e9Q3N8SrQQWbIOJjfZ/P6j8Eb1bJgk8ONmXorArF4b/+eKuAiPwt1bX0N6EmCYdR11SJ79NHH5CiWJtDt03QvPzjn7279v7ylkzKeh0+9LH3OTKV+fva//Qs6l298BKnO8RdCXpCax10kMCzTqyU6MhJ5plYZ3+MVHsyQd6MpLGJ9r6lAA/ADkRiRcmpZDwoz3LUmO0i8z1SjdkeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK5yEcXmvmF9LNfOBdI39ph6figLkQWOz0P31QY8dBg=;
 b=wGgAHSVk/JYQwMgEp3Ix/GB4DLlV1TpQWU7B3HsrW81olMSQxHLEH4ONWg12QnDRRcYGm8YnABebysymwl9c7CCNvvm+nIBPL2Y00jjgNkUDMB3F5klgzLf8YxirANpADwtm7OH0y6NB+oct3uwzPbuwQs49ATgw0WDjsFYaHal7pWZ4uwyayu+0SNlD51fclYs3g8RYjmbDPvLCgXTN0r/0veXauoOhHW5xkYPWHgOaIITptJUdqCXyIRudNlzcdlTHcfwzYdGZ/6C6aUv438mg8nM850mHIdi0xTEhXipgi5RSCkSWO7n8RAx0Smz2+BsXQXneizDIirZn9/WVkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
Date: Tue, 4 Apr 2023 12:31:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCv3+cpzJ52Y679G@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b9e487-f8fa-4488-56f5-08db34f7c2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tS5fpPz/AxFt8LgcxRun1J4alZjrGRctKpx3efuBKBxvI71aAMP/NUlCIRQcYufUMh1rkgzXq1rsuxhbgND94FpuPkx85Xm6XJBs6uRvAeJ3BLnvA7jG0xWPSlIxDOToETLChN3QCD8kDOFQLhI/mr/csGkegnF4eTkpUF/Qy99P5Fk87OAGCym+4wcDYaMvLFnaHUsa9Y1WtncYjfakc0ng5UQI3cJnxmZ8Qp58iYqNWrMpSlZulhTCX9RqSlcxe1Jhv6hsn0Xz2huLeSsxA0yPGJdfDNKfvQzEdzYm/cotFWQapg4S/fa9LcnfKXttHERLF2mEEX3KBppLXXYUPNZgH1/yuanUPqIGrC96FMAMiFOQNjaJTEBvXcxkHrR7rd9W5BDKA90oAvh5huS43X8qUciaiPceQ9+392/wLuhB/sgQoXXqG4YX2cy2WlVIEC3+r8jXfpz6i5Drkn41ty0XYi8l/e2EnVa/2P5+ar1T7CT65I4F5nL1Ti2bwdA8HouK9AOQnM3aYdMPTPP6tHuXrJfiL6w1G+DGaWmIHW7rjvy36rHVa9ZlDTIgzIEeUXlb/R7SkdK6T9ht1j64yFR3zBhIakMOC6Rs1EQYHJ4a0j97Oyn3kcz0OUFK2fshPwhGYjB5jPSg9nMYjjgoZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(66946007)(31686004)(478600001)(6512007)(6506007)(26005)(66556008)(41300700001)(6916009)(6486002)(2616005)(66476007)(4326008)(53546011)(54906003)(316002)(186003)(66899021)(5660300002)(83380400001)(8936002)(8676002)(2906002)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a29TWWw0eHdESHRBZUUvODBBZEM0WlkyVzRQUTkrbGFQclpIcWt0NzNEMHpt?=
 =?utf-8?B?L1BISGxsalZZcUs2KzFxSFZvekdiUTEva0poTU8yb2VXSG1iR1dvamFTQS82?=
 =?utf-8?B?aEdKZFR2U3V2a1d0YXBHZ2lRZXBZeVRvVThGbEpnTTk2dERLTG1BK0JWTjc5?=
 =?utf-8?B?dDFFbmpySko1amwvL2NlYWNLelJnRjNCbVVWd0MzcnR4a3pGYXh3eWRiVXR3?=
 =?utf-8?B?OHFER3RHeXhabkgwMzNBZjZ0ZGxyeS9XMXIzMEJmYnk5K0w1ZGdGeXVCd3NZ?=
 =?utf-8?B?V1VCZ2ZUSGdBcHJpMFhmMUpNcUg5K0ZXQlRpeTQ2dkFHZnhrWVYxN1BicFgx?=
 =?utf-8?B?Qm9CZVRCZHNGY0JUVXE5WUJoZXBUWnN4MVFJTFlWVVJPd3FLVW03OTFjcWU3?=
 =?utf-8?B?akh6V3FMandnbUFsVk9Qd29URjZGcVByaFoxeWN0WDllU2FXbzZtSlMrN3hH?=
 =?utf-8?B?NStIYVVINFBuZXBkdkpheXVxV1FTbWh2UlhiVGk1bVRPWHZwK1h0VW16NVFN?=
 =?utf-8?B?OUFOWjBLUFlEOThQdktZSnY5Wk9GLzNyMDFGOGUzWEhReisrRWNnUGpaY2N5?=
 =?utf-8?B?bmJMMFNGcFo5UWh2d1VidGw5K21peTlkcUkyQmF0bjQ2UERDRkpRcTBuZkhP?=
 =?utf-8?B?VGRMdXBzYTdoNTROL25hZlVORExwaXVCRmtZMkRoclpQZHlLU2ZwMjljUmx2?=
 =?utf-8?B?SWpxY1JyQSt2Rk0xUGM3RmlNRDIwM3dhUzNUZDN2OHRMTUpJTWtzcjc5cFBD?=
 =?utf-8?B?SDd3TTlJSkNzbFI4enFqUmhFUlpsb0hIOHpqZzVZQlNvK0t1bzB4WGpMVEgr?=
 =?utf-8?B?OXVBVlBVZDVVZm45cERha0FFcmxxTmIwdGFJQWtmQ1RSRHVzbVFUWEd5TVV0?=
 =?utf-8?B?SXBGaGNLaDJEbDNJdmtqVlloZzBmckJrVHp0RXAyNFJkb3hTUkNtMzdkSDF6?=
 =?utf-8?B?NGFiZWJRZFI5M2tUeFRySkk1aWZjTkVBOU9wbVVXSFFoVDdaQVczaFhDRnFv?=
 =?utf-8?B?OSsrNytoRGkrVFNNSk40UlE2dlhvN1I4SWl2WFJxN0tkaFNsQ1RYY2JWMDJ6?=
 =?utf-8?B?U0oySFNtTmFwVlE1RFdBR0xsWWxSWS9Ibm14MHZIbW9QeVpkRlF3NFllWmpC?=
 =?utf-8?B?cndHQkY5eHUvUExSMHkzdTIwKzlPY0dRcTdBRDhnVXBqdlVYOXppeFJ3NDlT?=
 =?utf-8?B?TDR2MlZLdjR5akJHYXZMTkR4QTZuREJ6MDErZ3NjNGxrbDdISkRJeGRnUDNJ?=
 =?utf-8?B?TjBhZmNycCtIQ0NKTmNhV1ZDN0laNUtJcERUNFhiZ04zTUZLSTd6N3V0M0FH?=
 =?utf-8?B?RnYzZ0NUSlBmcm5scVVrY2VjQnB6QTUzODVZc2d6MGp3RjcyWU92ZFFtVElZ?=
 =?utf-8?B?Si9RRm9rZSs0anJPN0NhSDVqZWV0ZEZUNjN5a1Jod0FMc0RBa0pueWZxYUJy?=
 =?utf-8?B?VFo1NDRIcFFuSG1pNUJ1MnpFMW1WSVRWWlFYb2RLUnRUWnVoSUNvRWJjWXV3?=
 =?utf-8?B?ZjdEU0pRQUhrVFBSbGtMaWFXNkJBdGUxZHhUMHM4enVFQmJvZEtVZGFaYXVa?=
 =?utf-8?B?KyswclVDVUR0YmtWMTRsMksreDJkaVlYVnBsZkVUL1BYUWU0VW45M2lKeWJC?=
 =?utf-8?B?cjdPU1RyS25MSVJzNU5jb3pEL09FcVFFQW4wWlUzaHB6Y1lJTzAyeWhOaVNp?=
 =?utf-8?B?TmNIRDlnbVNKbG1HOGxZRGxRdHQzOG1ZMlJiV3gzTW0rNDZTSVltYjZuaXJa?=
 =?utf-8?B?S1hRNjlpa0lMcEhUR2JTTUhrUlRVSndXYUVHQmUyTk5IbnJ4TVlkVTVMNGxI?=
 =?utf-8?B?NFJDMEtGaVpJOGkvVGdQcTVxQTVkb0owckk3Sk0xRzBMR1owelNkN0dPSXMv?=
 =?utf-8?B?S21YZE1YTjlpTWpnM1phWDloQnJueGtxV0M1cVNNVFd1MFdRenNEcFVtTCtr?=
 =?utf-8?B?WGhkR1JnNUlKWWNnNlFiWkNyNjlZTWhXTTJHTDRTMzVQek1hQThseTFwOFFm?=
 =?utf-8?B?RjJ1UERRbUhSM2VuckV1UUU0eHNNUXBIeklpSmtMbXlCd2xYSXRlbzFLcGFQ?=
 =?utf-8?B?RkU4MTFvQjFOaVh3RDI4amllcmZnVDVoS1BWZE9LUzQwZzJiNkN1dkNOU1du?=
 =?utf-8?Q?bYlQv6f93bZe7IvZXXjfgpOjm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b9e487-f8fa-4488-56f5-08db34f7c2c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:31:33.4765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJO4R/GTiOt8Qw9jsVRL5bbQeiVFCrBy9TfaLmwX6/hVsqsTKTaDBuKNuQofuGaNIDxIzzzwOAtCrDb33jdhJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8788

On 04.04.2023 12:12, Roger Pau Monné wrote:
> On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
>> applies to guests also when run on a 64-bit hypervisor: The "extended
>> CR3" format has to be used there as well, to fit the address in the only
>> 32-bit wide register there. As a result it was a mistake that the check
>> was never enabled for that case, and was then mistakenly deleted in the
>> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
>> CONFIG_PAGING_LEVELS==4"]).
>>
>> Similarly during Dom0 construction kernel awareness needs to be taken
>> into account, and respective code was again mistakenly never enabled for
>> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
>> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
>>
>> At the same time restrict enabling of the assist for Dom0 to just the
>> 32-bit case. Furthermore there's no need for an atomic update there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was uncertain whether to add a check to the CR3 guest read path,
>> raising e.g. #GP(0) when the value read wouldn't fit but also may not
>> be converted to "extended" format (overflow is possible there in
>> principle because of the control tools "slack" in promote_l3_table()).
>>
>> In that context I was puzzled to find no check on the CR3 guest write
>> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
>> of the low reserved ones) could observe anomalous behavior rather than
>> plain failure.
>>
>> As to a Fixes: tag - it's pretty unclear which of the many original
>> 32-on-64 changes to blame. I don't think the two cited commits should
>> be referenced there, as they didn't break anything that wasn't already
>> broken.
>>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>>      unsigned int   partial_flags = page->partial_flags;
>>      l3_pgentry_t   l3e = l3e_empty();
>>  
>> +    /*
>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
>> +     * understand the weird 'extended cr3' format for dealing with high-order
>> +     * address bits. We cut some slack for control tools (before vcpu0 is
>> +     * initialised).
> 
> Don't we then need some check in the vCPU init path to assure that the
> cr3 is < 32bits if we allow those to initially be set?
> 
> Or will the initialization unconditionally overwrite any previous cr3
> value?

That's not the way I understand this "cut some slack". Instead I read it
to be meant to cover for the VM-assist bit not being set, yet. Beyond
that it is assumed to be tool stack's responsibility to constrain
addresses suitably. If it doesn't, it'll simply break the guest. (There
is some guessing on my part involved here, as the original introduction
of that code didn't further explain things.)

Nevertheless going beyond what was there originally might be desirable.
Yet it's not really clear to me when / how to carry out such further
checking. For example I don't fancy walking all of the domain's pages
when it's about to be unpaused for the first time.

Jan

