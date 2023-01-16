Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E2866C339
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478794.742183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHR2Q-0000qg-Mc; Mon, 16 Jan 2023 15:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478794.742183; Mon, 16 Jan 2023 15:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHR2Q-0000nX-JM; Mon, 16 Jan 2023 15:04:42 +0000
Received: by outflank-mailman (input) for mailman id 478794;
 Mon, 16 Jan 2023 15:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHR2O-0000nR-L4
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 15:04:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2049.outbound.protection.outlook.com [40.107.8.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1858bd9e-95af-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 16:04:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 15:04:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 15:04:36 +0000
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
X-Inumbo-ID: 1858bd9e-95af-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfgBewjfoxXJDhKvrz2erMJ+ftkEW2ZFKs0uxWMOAjFa+zZtt8XtjvVo6hXG5exKpmg3eHoOeOy4mOTX2cQi7m1Ap3XkJk4IRscj8kFjIz82bp1oU4VGACHwalBSVAw4wakF044toJN16RRLhCD/3CbOAP1qbQ46pwwuYmcj0K8d/Ux68B+r7WA41H9C1myS+Fh+9gj+V7MTKVN/hlgH5V5o9DaQWslzM9SOsJ5C8JcDfZn8adigtext9uHB42RTtTBOLuJ2E512RvrzrGWEzD/yy4idQpQVCB02zB+plxHrasEOZ3ME4HoXx+JqbP7OiFZV70uDxYf6W5EmAqefiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFsgRX5bACsixQV9TsmLqP01VelcJnv1dRK4g9WEXdg=;
 b=BQxHYR2LIfmENm8dcpqU3mXk5ubp0XrJrGFZw3zADd49QgJ2KS23bAUeHeDFreWmsVRX6f4Eqj9x4LSJ4PVWuHfg31297tcQv7pkZbaT1DwO9o8jjnM3pDHINH4gTdnRxpN5G4/p5FSkW+b+acjDBkKxs8GxN/8IAJqnYBbPFdNOx/7a+LavhkO5AALC17r0EHMMHv1T1wz7jg6kBZOz1tcX6QdWroa2ILAfHDDo02V7dx4aLdWUWuM4zKJwIO5YR8dd0B5fQ2aQe+36LF7UBs/4vxRyy2bcYGCie/UFmXxzi7laA5i4iLyEv/CtfbvYf5VriEWP39Qx7XQ4ih0nKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFsgRX5bACsixQV9TsmLqP01VelcJnv1dRK4g9WEXdg=;
 b=Hz3xarsDH0I4fOsqkhFNEP8vIEj3MUHjcXns632QpCLAleZjjbdy6pAhmjHtmv4t8QmLQ/9L0hfrLmxo67sbmznjoc3JNcRL+/55uY5oXdZZixlYPrRTRYtXjnO062Q2ZbI+yHjuXgLqLj5unvlxQ3VYogukGgqWCZMzjOFzSiWX7XIIDRMZsPgBWXlILxf6Eg/T6rsEIJwJHEJR+PGL5joK2oSV5R2aXOBIlhzYfoDrdUGJyZo8pGRHOJ9XKaUZ2sjsmiyLuDh0eW1UfO3JtZVfuZZm0IVu07cFWnyu0DtZuCdF6dHuJZL1z1e1/A4NzaMisXhrWW4doXuSF206CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac8d8c62-e1f8-a98e-3ead-e1f3f8a55c2d@suse.com>
Date: Mon, 16 Jan 2023 16:04:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-6-andrew.cooper3@citrix.com>
 <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
 <3ac6a4d6-44db-d248-4440-6e71aa14ad93@citrix.com>
 <adf6f951-a0e5-c167-9739-d8b0a2b4af38@citrix.com>
 <309925fd-1e7b-4541-693a-0296bd22e242@suse.com>
 <a1ffc132-5343-c070-7bda-b3198a1ccc95@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a1ffc132-5343-c070-7bda-b3198a1ccc95@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcff5fe-d8c8-44df-3915-08daf7d2fb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D1dt71g9zeXaB9IRNISBaE3DxvfhvVNr4W7lKbmkn7em0joeR6HEiADYLIUIrgnjwkCB6VfsA/crVrbUpZtLAXW5b9clI6K8/0N8GA5Sd8uHXkP8oMICFhwutM+amE1nMao12Z7k2k4dOiHBgYUhcw+X/kt9+7TEQtmgdoB1vBp45qlcphJ5KsVf+0lxmrVbslVOLGMY9p6s4fkJwyJHxPCEAGgHKFFZ/ohXijBF2VoGQ5lO6Tj8eDMZdxhYyq4MDBR/xs+IGEPJ6TlaI5eJhZ4PPvcwTUpfARlU0YgwRDXWmBRkw/VA7Q7E/AjO4gQPmF9YVXjdm5uayXY2HqZJk0C08ikXT/XzFKqE6WTAEXlUVll+clZASH9umjf9wUD62IdUYPZbwrITJnTp4wjjMQMpEQwbCLQyVub0WYF0owyb8iC560Eo1GdHpnucx2E3OMm0LU+9IMNVlh3vgyUjP8U07CWbItCzJ5aszuysIMYUi3+qlciDwz3j05owZszAxF5iCW1bBtufQdUSZaLb8SkQyewXnGlkuEqIvAEwwN5RT379lrsxir0CWWgCfOlgIss2/qpGNDmo4iO8VOXicTUEVpGhD7h1EIS0GnGRwvsQofx948Y0ZerWE2ZxGRxPskTHRBY3gjFPkWyBtVWrNTYGw8ChzD2SmaE0mY9mPymMwIbLp4L/8Mr26/HYRf+Qo2s++5hotWfiJ8Zsr9woKLs28AxroZ+kCSuRPc+PDnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(36756003)(26005)(6506007)(53546011)(6512007)(186003)(38100700002)(86362001)(31696002)(83380400001)(2616005)(478600001)(6486002)(8936002)(5660300002)(31686004)(66556008)(2906002)(316002)(6916009)(66946007)(8676002)(66476007)(4326008)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVVvRkhlcGxQdjQ5bFp3TGt0S3g4dk9rT2tjUDR4dHYxSC9RUUg2VXErRTV3?=
 =?utf-8?B?eitHOWF1cXFpUXllNmVweU1oU1g5SUJxb2h3S2h1TXFSOWRweEY1OU5aTCtq?=
 =?utf-8?B?NmdDdmt1Y3hJTERhaW1aekpsNGFxTDd4WUhYU2U0UmgxNlJNMlNPMWtwbmNo?=
 =?utf-8?B?YlF3anEzQUNnNzhMZngrbVB6cloxa3BydkdpVjd1dHB2NWVTcFJPUEZjUjN5?=
 =?utf-8?B?OWhvd3VlSjZvbmMvUno4K1BLSDIyL0M0M0ltcVlqUldLUXJuZjRwZnRzTm4r?=
 =?utf-8?B?VFgrSFozSkNFRXVTT2FLbjdhdlZ3VGg1anpxWS82YTdmSUZmbngwWnIyVXp6?=
 =?utf-8?B?TXRIdXQ1L2ZPR3FiS0pteG40Wm9nUzFhTnB1SWJXdEx3SDhXRFFHc3JDRDVw?=
 =?utf-8?B?UjBmbDF3ZXhCSTNSenhWZE4zMFM3dmwxZjMwOWcyRGhUNDVDQ0hGdWJFcml0?=
 =?utf-8?B?NTg5RWZwdHBmd1pjS0t3VU5KVmY0bndkSWJhZkJObExMRmw3eUZsaDlseTNU?=
 =?utf-8?B?WHBzNmRVeEpnRmdlQWtQZEI0dmptK3FlRTRRbGQ4M0lmdnk1RVM1N055cHVp?=
 =?utf-8?B?ZzQ4azY2SEdOSmVLWmd5UjlmSzh4VEJreGltdi8vVCtBaTBTb3FXejQ1T1RU?=
 =?utf-8?B?VUZwZm5xMnp5OEpBMVBYb0tEU1BuUElFSUp2VEk0OGtMTk5mb0s3Y2xkYlRR?=
 =?utf-8?B?TDJlMFVxNzFqZDl1R2RFNmhQdWRrYWtoMWVkdGdTbVN4OEJqdlRBaEMzRnNJ?=
 =?utf-8?B?OXI2RCt0czkvTTYrMHJLUG9aU2sycFUzV0xkSzNuN2JjbGdFVnJ4aDFLL3lS?=
 =?utf-8?B?SzRnR0ZtUFpWbjZ0czFvZUg3MUxRd3F5KzY5akNRa1JqRlhHU3BEL1FaaDc3?=
 =?utf-8?B?Ui9uMkZOaGRZZUNBY3ZQUDNqRFArTG9qMFk2aUFjNHlFRWRaL0NGdDlUeldO?=
 =?utf-8?B?cUZBbTY1dVZRUExzSENFZ0hWZEVVWU54MkRsODVuLzN6bytDZTFmckNGc0VY?=
 =?utf-8?B?Z0hucjBIalh6Z3M1WTY4V0FzTUtOTi9XOFduRnFVRXNLbEVZMXk3VGlVclZo?=
 =?utf-8?B?d1Z4bGk0ekQ2anh5dFA1R1FvQkhwTmxsOWFMejRrUG56bjNxdEhBWmlKVUJj?=
 =?utf-8?B?OGZiSmt3bmlYdjdCeWdvV25JdUxHU3V3eGJXZEtwRWhGMU5mYXl4NkNJOGpj?=
 =?utf-8?B?S2c0K1JQSW1iODFpOWpPU2gvY2k4bWZ1VThhMWVNWXhrRWNUaGJ0cG9HTmpx?=
 =?utf-8?B?V2J0UnFYTnpKVnVkckFKNWxQWlBqNXIrdGpMb2tSTTcxZ0trK2JZbkR1NGFw?=
 =?utf-8?B?M0t2YWxIN1RLRk9odEhsR25vNVBYYU5yTGlYZTBFV0ZDVlRzZnplcElRNXp3?=
 =?utf-8?B?bzFGcEZiNE1kNnl2c3BCNW9JODU0S0QzY1g5MnVtMVZ0NTk2OWtVVWpYbHFq?=
 =?utf-8?B?VzBzV0lpbFl0ZWJ3NHlVVHFlZDVkeDE2bURCcjZaOWl4SWowUFM3UVJRNkd6?=
 =?utf-8?B?TFhjaW13STMvMFpKSlBCNk54d0ZTanhMeXk2SzRnNnVOck9vU2NCSXhQK3pv?=
 =?utf-8?B?b0VqWk1yY1llTzNWdXpLaCsxRFRaRCtNZDlSUU9sbEVRY2pOS2FCK1JhOGls?=
 =?utf-8?B?aU02QmxjVUlIYW1mRDZrbEJzMUdxVFBWcGRpRE5jN3ErWmlhYU80dGFVK2xW?=
 =?utf-8?B?eGU0ZVVMN2lzdk5DSUhkM1VVVXN0dnhHK1NJSzNXaERjYjY2MXA0RXAxbGNW?=
 =?utf-8?B?Y2JrVDJCdEpLVXV0VTdWcVBZMjNNN0hCcHRYZmd3SnJHNG1HVWlEQ1oyMHZG?=
 =?utf-8?B?UVVuV1hDekZZNUVQT0tZWjY4TTErS2s4NGttRDczdHhSVjF1b08raGhxK09M?=
 =?utf-8?B?QXdSQnFXQVpNMFU1VVhGM3daU3FKUlRMWVRsWERKalhYTkZUcDVKUXB5a1lJ?=
 =?utf-8?B?bDBIa1lJc005SGlYWFBUSkd5eHlEMXRpdFlubHgwTTBNR25hbk51SWRBMnRG?=
 =?utf-8?B?eXVKenRpVi9NMFFLSStQRE9zTjN6TWR3a0IwWldoeWkrMnNvczlhVXJjMS85?=
 =?utf-8?B?c0s4VCtqYndLT3FvY0lVYUtla0N5SDVsU0dDSytKTzZ0NXNhVlZkZGF6WTdl?=
 =?utf-8?Q?JdwnvtKa2OOdg62K4IW3DkD1t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcff5fe-d8c8-44df-3915-08daf7d2fb81
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:04:36.2495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ruh5eh/scffdv2aNSQFipAzNzJaKQWDCR1zl9waAF+51CxcSv9bMtltN0bm+63Wv+hUjuJWhkAsX0lCV2+Euag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8676

On 16.01.2023 15:57, Andrew Cooper wrote:
> On 16/01/2023 2:17 pm, Jan Beulich wrote:
>> On 16.01.2023 14:00, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/acpi/power.c
>>> +++ b/xen/arch/x86/acpi/power.c
>>> @@ -299,6 +299,13 @@ static int enter_state(u32 state)
>>>  
>>>      update_mcu_opt_ctrl();
>>>  
>>> +    /*
>>> +     * Should be before restoring CR4, but that is earlier in asm.  We
>>> rely on
>>> +     * MSR_PKRS actually being 0 out of S3 resume.
>>> +     */
>>> +    if ( cpu_has_pks )
>>> +        wrpkrs_and_cache(0);
>>> +
>>>      /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
>>>      percpu_traps_init();
>>>  
>>>
>>> I've folded this hunk, to sort out the S3 resume path.
>> The comment is a little misleading imo - it looks to justify that nothing
>> needs doing. Could you add "..., but our cache needs clearing" to clarify
>> why, despite our relying on zero being in the register (which I find
>> problematic, considering that the doc doesn't even spell out reset state),
>> the write is needed?
> 
> Xen doesn't actually set CR4.PKS at all (yet).
> 
> I'm just trying to do a reasonable job of leaving Xen in a position
> where it doesn't explode the instant we want to start using PKS ourselves.
> 
> S3 resume is out of a full core poweroff.  Registers (which aren't
> modified by firmware) will have their architectural reset values, and
> for MSR_PKRS, that's 0.

And where have you found that to be spelled out? It is this lack of
specification (afaics) which is concerning me.

Jan

