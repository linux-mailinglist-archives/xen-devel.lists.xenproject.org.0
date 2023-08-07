Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D277235E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578329.905773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSywk-0006p2-EU; Mon, 07 Aug 2023 12:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578329.905773; Mon, 07 Aug 2023 12:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSywk-0006lB-BP; Mon, 07 Aug 2023 12:02:50 +0000
Received: by outflank-mailman (input) for mailman id 578329;
 Mon, 07 Aug 2023 12:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSywi-0006l5-Ft
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:02:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52c4c4c8-351a-11ee-b27e-6b7b168915f2;
 Mon, 07 Aug 2023 14:02:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8193.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 12:02:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 12:02:17 +0000
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
X-Inumbo-ID: 52c4c4c8-351a-11ee-b27e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/N7n9vBOa0yPJcz6aJbjKIAf3/FC+gHYbtJNralmUR0gKigyefLVlLEqp/mu8vYvS+hrgnqEEgosFANoLrdWVLqhcQE3sE/1uoYnnQqQd49F0CEunIr5HUKyQQG4m8Hwvz9o/ug8HfX5AY8/gv8BPp3p6kwgn0FkhQFNT1jCwlOl0R3CuUaHHVnhxGbAu9oYF2+XAaFEsAHHp4E5BC2xLCuipnwJvFfAR8SHaNJ020gBoX8GLeOV5Gx9DhYpv4fred1JsYOP+BGXkwGpavrRrUqitM+GnfPsIGHAvWase5DnU/wL9K40+RpoSN5HuHJ2XoP/vyrXk5iC5LW2k+3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrBKQz4pbcL7Gop5ewv1uH0dkcqoCwmO18JiTdgjQXs=;
 b=G+/oyCwcQFeE/Aw4EGQknIa1ZXefp9zbzazHJjsjBWHAQu9S6wF2PK1ELH2/KYT0FjEEBx0WX5ehxyuHe4z8P6F2pDFFyIx05eYMX5DYSXyNYSa9E9g3V1dw5vmO2sCMIuMcWzfDNCjjS+juPZr6rsl1AQ27c005l6MGV2vMVsn3Ueo6Kq7W5u6SaaD+JZhL6lwUwva/IMYq4t/2KTl51bsTihzZdYiaelVJg5IwJgZdZbdAVwoVY2vL4luuQ+gP2C5xVFDa8keaEeZrz1/lstlt73sCVISkhJIs5mVyUWPI1JJVBKkCDpiemGVvf3gOCt1JuUKJ1sqL/VyeGD9dEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrBKQz4pbcL7Gop5ewv1uH0dkcqoCwmO18JiTdgjQXs=;
 b=37kjOQhEbj9LMlUhpGUBJonC+EtXdw4eScddTAaOKPVBqB6n9WgikjJsDha1IGHOm1fcbo662dZlTRrs0dnRjJ4i74dCjPRtILUoKkHDHDjJ9Ojqf6Ij7XuqjDbEG1o3jLwVYtCOV0UHVORaXlRp6u5pTT7uT383cbhZ+stJxg9kEF92KkkUk3KpgHzOcT+I78q2UuOT7FG/eQUOry0KiTFa0x3lWEt5HMnDT2OVdZleg62BNybmWMVmO5n1Ct+DiypIQWxbnd/G1lKbvhZ5iIGBqA9o91whPh3fdy1ArMXtU3TUYPhsIOo62Szok8Dvoxd0VQpLF4+Si1SeXtOZDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42d0bbd8-5f90-15aa-017e-e48581a28e48@suse.com>
Date: Mon, 7 Aug 2023 14:02:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
 <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
 <742f4a4a-5938-82f5-7e76-1189a2519063@suse.com>
 <871a501fb76cff724ed1c2b09277e2a3@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <871a501fb76cff724ed1c2b09277e2a3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: bf509fb4-7e02-473e-0c12-08db973e252d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mj/wBhr5cSi8+UNDFF0P8RRXENf9atbDPffQfXMqlwr+AFw/gpcmhRVoqjebtqQyDONt9aF3L33ScehzlxBDOf4FsiUQ+YhZuQ+pWzIKA7/ALWuSnpe57gNgepwp9w1nxSl3Wihdl+kW4YUrBtwgCnZpWmzXgxzdaor2MddULaNcJyEhLvA5zIT60RxuAihWcT+0ETIGJJEx6oI6BE2qaUhbuxTjuSYAXVQVb/kCpFDyRChAxFC9gIcq2IgmsrLcMluFAUayLWfA0Z2QkeouAy3jBSY8QpsPybKwwC36dnyNx7/wEkbk+y+chtkTm46f+bKJoGqWwauk6KOaxlYFkkH0fRuDCmXLeawELApy+rC3Ol8TZ4amZ0xBRNeHlspspgJslW4aunG96OFcF0v4qACMF49wzBjjvCw8gMWUJB+1Nxoq0bfChpIqCOrmw0YROtUdXClh9x/9i+kzkvLGaS3Mr5ef7VU6o6wXb5t1uqjsz3o2HWSk3WIlYtpn+pKI3MQveoB04+50XE2ofrk8fwx715HgeZW/HEJQwbtaLCNxQ70vokVwblEDpbUcv9ymK1bXHO8fiUvaKoN9GxdTwEMoLp/JWkd8qLfajTkImxix1Qm3oecW/oWxvTyxW8xzYxWmlrxKX/wNDkpbm3MmyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(83380400001)(7416002)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(31696002)(6506007)(53546011)(54906003)(38100700002)(6486002)(66476007)(66556008)(478600001)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXhkeEs3ZHlNbWVHN1pnV29IWXM1NWVxbzVUcmdQcHFua3ZXbjlWYzhYTFJO?=
 =?utf-8?B?V2xYRVFabzhKUkk1ZDFKdlhmVFpZTThBSDh3Q095THkxWXZDSmRpdk1lQWlr?=
 =?utf-8?B?YUdwVElEV0w1OE9zUkE2R3YwTThFeVlKY1JVa3BwNE5iRXJhTmEzMEtsd2Fj?=
 =?utf-8?B?cFFGTEd4TGhObG5YcXdPSXNSUzVxVHBReDUwTUV3bkpieW9pd0FyN25uNzh4?=
 =?utf-8?B?Q3dkQWp3b3RvYnhVSk8yV1B1Wkx2aU94WW5YZXEvZkxDeG5TbzVPM3Z0UmVo?=
 =?utf-8?B?Y2w0RHdLaURZWW93OTkyc0twQkRzVWwrRUNJM1FlMXpkM0JWTkFQRDlqVUdq?=
 =?utf-8?B?a1lXbkdhSHNKbGt5L2hNVXdXQVdUZnk3OU5xRWQ5Y0svRnRGR2l6Qjhpckc3?=
 =?utf-8?B?VUJGTzNVd0tPZlptdHVkM3kxcXFTblpmQk9UOUdPdzVCV21vekNocWRPQ0cv?=
 =?utf-8?B?V3pXRCt5KzlEQktyWUhFelFhMThsSEtsSEM3T1JVN1lKRzY0VzJERmhVZkU5?=
 =?utf-8?B?d1ZxcTJmeFhMVVpVYlFEMjlkOENZTEljTFhTMjA3c3U1VkUvR1Q1aTlDY3M4?=
 =?utf-8?B?MWI5Tys2WFcvQUlldTN6c3NZUHFaU1d0VzExN2VTMzJJbzFjSzhMVjNqYW5J?=
 =?utf-8?B?ZmtrR1RVa2RvWXNDSTZCRlVtM3pUelo0K2R4dnJMeC84SVBBcUcvWjNlTHQz?=
 =?utf-8?B?NGlCd1VDNHFZcllSZWhUSmprMnI2Ym8rOWNjc3dYWXFGR09FYVU0ZmVoODk0?=
 =?utf-8?B?UWlDOVh3UXMycVlKS0w1NTlOZXZGSTI3V2RwekJ3d29BR0ZINS9VbWdSVGtk?=
 =?utf-8?B?OUxEek13czNxc3Nuc0ltVnlSb3FQWEpkQXU0VllDeWlZdlZDTVhYMmE4azVl?=
 =?utf-8?B?cXBLbHRsU0hOQzJRSGF5dmpyVWxCejlQbThoNG5NRXRTajU2bVFjcW1ZUzRS?=
 =?utf-8?B?TGpHQ1lnYkx5eTJGcU5wOHphU1kzV3hVNHBtVnU2WTQ1WGg4MWkzbTJGQ3ZV?=
 =?utf-8?B?S0NYL1pvN0xsK1hldk1GRGMvWTN6dkFTa0ZybkNjK2pWNFVtYVZiSjVoYnBt?=
 =?utf-8?B?SGVGNmZrenVQZU5JZWthVkpoc2tEQ1dQb3gweXBIQWhVSkQ5My9lTWtuaUJG?=
 =?utf-8?B?QUtiR1JtaUVsVDRjamp3VUh6Ui93cUxQR2lzWE5GeitjcmZpYkxLbVp2em0w?=
 =?utf-8?B?U3ZucHBMSUdsejZ2V3JoeEtNSFVERWdVTHA5NVZ2dU5VSVdpY3dWS0hKdzdj?=
 =?utf-8?B?OFBFZHEvM0lNd1h2ckRRaEJTMUpMaEVDL3B3OE5tdU1DR01MUTZOV3YrQXRG?=
 =?utf-8?B?enpRQmI1TFNOSGZSQUQvdVFnWlNOd2lHMGZQaUk5cGdjU2M0S094blF4NnV3?=
 =?utf-8?B?b2hLTFdOLzIrOTVQU0lRdDM2UHJrQzNkdCt6eXFCeFo4TEhNMXVIblFoa09X?=
 =?utf-8?B?TURQSU4vMGVZanF5N0hIY3hueXEyZ0h0TVUvSldQU0ZzN0dFQkhMMHJmbit1?=
 =?utf-8?B?RTRqb2V4MHNERkNBOElLRjlGRGxDeFRjb2d3RmtMYmNTQlJuVE9jZU8rbWUr?=
 =?utf-8?B?MUNScHE3SlpiT2VvbW8xbm9CVDEwZTNZdXo2NmlhdUZQK3V0TTYxU3ZqeGZ3?=
 =?utf-8?B?UHhyUlVOUTRHdnZVVndTWDU4c3dFWnRRVy9DWEtKUGdxVDZ2SFFESitEMnJZ?=
 =?utf-8?B?OHYyejM0eDdKcldYZEdDSytMM3ZKU21GNEhtWXk1K1o0SXJLdjhvN1ViYm1a?=
 =?utf-8?B?a3E5cW15S3grV3FlU2lFeC9LNXF4MXZFYkdoekZ0c1JHeG9iZ0VwekxoSUNO?=
 =?utf-8?B?cncyNWkrbTRWQnV2ckR3bThpaWdyNkU0VzFmRFV2Ym4vMUlyVUZKZUhpMEd1?=
 =?utf-8?B?SmVmc1J0TFZSUnVrNFI1SzBMb2JqQmx5SHdTT2N4anNreEYwUjhFRGhKR09T?=
 =?utf-8?B?TXdtTFl2Z1B1U1ZNVGNqWjNsa1JYdEJhNUZkT1l5MXRCWnVnRmNDRjRVNWtE?=
 =?utf-8?B?OWVnbC9kTWVXTmhjK2ZlWWZXdDZVd3pKOUI4bjVJK05YTmlWM3NlMGNKeThI?=
 =?utf-8?B?a2twaWpKd2h6SXYxRkl6cWpLTWFBK1RzazNiSCt6aHEwUCsraW1sV2ZSSmtR?=
 =?utf-8?Q?RQ1hZikUDFFPR/0zA+qEt9cSI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf509fb4-7e02-473e-0c12-08db973e252d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:02:17.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSlyDHXF8jJJNRVSjRJhMepb3J/58yJwvm0ampZGvIpEladgntrZSvD/ekpPfqdlcXPci9uOVBpDkD0kNtYEQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8193

On 07.08.2023 13:12, Nicola Vetrini wrote:
> 
>>> Besides the one you listed, there are these other occurrences:
>>> - xen/arch/x86/mm.c:4678 in 'arch_memory_op' as local variable 'struct
>>> e820entry'
>>
>> This probably wants renaming; my suggestion would be just "e" here.
> 
> Ok
> 
>>
>>> - xen/arch/x86/include/asm/guest/hypervisor.h:55 in
>>> 'hypervisor_e820_fixup'
>>> - xen/arch/x86/include/asm/pv/shim.h:88 in 'pv_shim_fixup'
>>
>> These can likely again have their parameters dropped, for it only
>> ever being the "e820" global which is passed. (Really I think in such
>> cases the names being the same should be permitted.)
>>
>>> - xen/arch/x86/setup.c:689 in 'kexec_reserve_area'
>>
>> This surely can quite sensibly have boot_e820 use moved into the
>> function itself.
>>
> 
> Ok, although your suggestion of breaking these renames/deletions in more 
> than one patch may not be applicable,
> as 'kexec_reserve_area' calls 'reserve_e820_ram', which in turn calls 
> 'e820_change_range_type'.
> Similarly, the call stack containing 'e820_add_range' includes other 
> calls to the modified functions, so
> effectively it's best to drop the parameter everywhere all at once to 
> prevent accidental mistakes.

Well, this still allows splitting parameter removal changes from
parameter renaming ones.

>>> We can take the first approach you suggested (which was my original
>>> attempt, but then upon feedback on other
>>> patches I reworked this patch before submitting). My doubt about it 
>>> was
>>> that it would introduce a naming
>>> inconsistency with other e820-related objects/types. Anyway, if 
>>> e820_map
>>> is not a good name, could e820_arr be it?
>>
>> But how does "arr" describe the purpose? I would have suggested a name,
>> but none I can think of (e820_real, e820_final) I'd be really happy 
>> with.
>> Just e820 is pretty likely the best name we can have here.
> 
> Ok, so perhaps the best way is using the strategy above, although I'm 
> curious why in other places this
> was not the preferred alternative (as the global may be dropped or the 
> callers may use a e820map other
> than the global one, but here I recognize my lack of knowledge on the 
> internals of Xen).

Other x86 maintainers may voice a different opinion. My take is that
since we've now lived with the set of functions we have for quite a
long time, problematic changes like ones you outline are not very
likely to appear.

Jan

