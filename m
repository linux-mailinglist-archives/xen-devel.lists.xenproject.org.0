Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C8E66C20A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478638.741936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQIc-0008PB-He; Mon, 16 Jan 2023 14:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478638.741936; Mon, 16 Jan 2023 14:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQIc-0008NF-Ea; Mon, 16 Jan 2023 14:17:22 +0000
Received: by outflank-mailman (input) for mailman id 478638;
 Mon, 16 Jan 2023 14:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHQIa-0008N8-UI
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:17:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2048.outbound.protection.outlook.com [40.107.104.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba37fa6-95a8-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:17:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:17:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 14:17:16 +0000
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
X-Inumbo-ID: 7ba37fa6-95a8-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJGbRZ8TxVM19RYkvUXuIzsPKcgO4ykDWuK/bCU033FZOA0MMyIWu4UQKQ3cRe8CinjKYtTZsgf6L5/KKx+u9ltNRyytmkphYsnW6wzSp+NWVJ2qvXnbWSiMOziiyN78cUHZ6Oigt3yzPB+mSNewlo+mOIl7ly4DHo3rtcvXCprGi0auZDROgUwqcgScNU2SjJya82xwNeVD2X8XIJ8EZ5v9RefOfExImPSA5s5BVNOr6sWvzYHGPduv3sWgLVU1962SliT0Ntol601iMi3FzfRKFCOGt3XzMOsKb0mzjMUpUMaxZzBdR1NW37yXnon+K+AZ6/7OKepO1rz242d3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZdV/7KhVK8Mkszdu3fyT+VI9hxYQgROkZDAHCL1GmM=;
 b=DGiMLR5+d1/fEFutNHMbX7lx3xbiCIIz8Sw6b10+IZ+GhcVKed5FyCcwmPOGZfZlShwIXKe52EXjIIGdGDFqP0Sq/xrklI0GUO4hfQM8i3rKe3o7NeC0GEkYEwRvn99gUZZJkZTdNhL6+5N+fgr9emz6Q/l+MM3hdZlu7xlfjgQB5y4emfHMG3X189hTyMG0PTlUdJ1cNCxX/bM1Ob+vFhTOLIef9l1qVxYK2KTe98ocJuAEQgj2gvR7SveH518dlrJKqnau8o2BOtqNp6AoQqHZzTDNyBUTMLCy2jxMa6eqNjUH0LQ4I4EXBLfIAaw4wd864UOE8uNH8lRpCUz1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZdV/7KhVK8Mkszdu3fyT+VI9hxYQgROkZDAHCL1GmM=;
 b=lz8PxpaRsQvvPzrlcRdYjZpLSFneI97JC2nINsrUwSynOklO9+rvCoxOmXCSCM5+ZST1hrZ46BIjc1yxavXmvBv0tpW+3/+Mgyg09GUarxk1jmh4Yzit5JcHjk/qdbfPPlxtMCpVeSY+zMh4/BZopNJ6hCE4p2HEu63zdbJVTiO4Gg+lvy/4AssnWTyQWjw09r6K4pZeNvF+cvJWd8rpNTiu30d88xtN0nEf+oeMnMH6Q/0tg1W5IfuTJmcclD1t3ebZYUwtKurSDFjzhODSmd9GXObkX9e6JOmA0WGy4gO00QiHs19Fp14n02kK9MJMkgT1gPYQ3YEHMe5Ur3WIiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <309925fd-1e7b-4541-693a-0296bd22e242@suse.com>
Date: Mon, 16 Jan 2023 15:17:14 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <adf6f951-a0e5-c167-9739-d8b0a2b4af38@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe08447-9c54-4da3-700c-08daf7cc5ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hpv8NGCAsN3i75kKejferwIqW+LE6ubZZ02b3U6TusVX2RDejXLRjfa63v6QHPK5q/CVPVl3slGSoVAcM/Pk+OHOdCTOPqyytpphs9Vjn090Pp5ihp22X9OLolAawJ+KeSukAsJL7phFpLt98YMFNSUZjW/+myKTJnCXR1ro6fIDz4BF7gVP8Ni0VQk0jUAFPWA9WGewGOcYUb3F/bkFx2ue2sEnsphwXOh8bmw7mdwWAnh1Xdn+PeoZxY5BXo/Sd3YU3t3hICIAPLyOIzNUvKE1DXrzfbobwBjsiT4xFfr8jqeidRhlowopJLN/T3QwF8KQBZDfgkIf34ChZY4qgW9MYtinYhybTNIssSt2Wde4XfwKFqCQYsttx9M71+/3RhK+iQpZ2jAPjZRIcNkdLg6Pe0JAdsWsO5PYH9QOT4GWRlyy/kp+kiMqkAMNnSPkcqbTOMcFugf6UHMwcbWboWFcs6E0wzolBnED/zJOgKF5gIwx8Bts04n4ZgKEMsA186+8ZBUllmHV0uQywkgDGUnuSxwP9fFcsoW/Res8TblJjEmH98yBt2qCgQPKBWeUxWwZw2jZVIGpxrhk+0XjdkYxKy1LPcINRF1/fQNttR6ZyFReRUY0Y1gp+abUFZGXEw6E2IZuZMSuU/1jWuNfQWdRp8Pd97fYCpva39hixmKaZlwPeZRXsZ+bc3aQHd3qWBlss/jzwryWzvMpgAPhJJmSJiSPfqZgYYfF/XK5lzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(31686004)(66946007)(66556008)(41300700001)(2616005)(66476007)(26005)(186003)(6512007)(53546011)(8676002)(4326008)(6916009)(86362001)(31696002)(36756003)(83380400001)(5660300002)(8936002)(54906003)(478600001)(6506007)(316002)(38100700002)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnlVRmRPeFk1aVNRb3NHVUxMKzB1SVpIQmZwRzRJU3ZQSWkxazZha2EvRFBv?=
 =?utf-8?B?em1tWVByUU80dDlvNWVzcHU4eWpua2l4TjN3M24xa1B4Z1EzeGR2Z1cwdHBW?=
 =?utf-8?B?Tzc2Si9pVVVCNHlPZDFDRlN3V2hqYW9nN0xDam9WeXlodm9GNUZrOG90eVlq?=
 =?utf-8?B?SjVqZThjSUE2YXZyYVdnc0t5VStXYVFsV2h5YndaS3VHbWtHbVN1Y0FNOTE0?=
 =?utf-8?B?K1VYUWRuTGJlaVVkaUczM051R2J6RmU0NzBZSHAzay9JZ0VwUVYxOXplalAw?=
 =?utf-8?B?RXFEeE9EQWVKendVdGRLL1pGQU43d01yQ2VFTDBnODV3b1dVc1NxQktRdEta?=
 =?utf-8?B?VHJGMEhBaVM3cFhyYmJrNVRrMVRPNjVyUGFBcFh0Z0N4bmVodFp1bThCNmlQ?=
 =?utf-8?B?UEtNTHlvSVJaTDFkeXZYckRNRW9MdkNlbWFSR21JMUFlWVB4T281ZmN1NVZ4?=
 =?utf-8?B?ZzlsTVEwUklJaDl0TCtGV2lPYmZiMFFIWXgxVGRMc3c3ME9OUmJPUVRqNkJB?=
 =?utf-8?B?OVQ0Z2hJMGdzVzF3VFVNcGRpQSt6TWZJVG45QVp6bkF2bktBWXZEWkVnVVFG?=
 =?utf-8?B?VmRocEIrNk9ETlVybkpKaXNpSEQ3OFdhQ08zN25rMCtPWXB4blVXUWZQR0Zw?=
 =?utf-8?B?eVovOWxXZzhtK3dsSjVwRkJ0eWZ3NWwxK09MQ3plQ0dQMGs0cUtRNytMY0dn?=
 =?utf-8?B?NG02bWdDUWJXNmI3eGlLcmtPNE50OTRMQjJiNlFsSVo1UU1qMG9oNk5vcTQ1?=
 =?utf-8?B?UHRZTTgzQmdZeWtyWVBPc3U2bkVvQmJkcjNhdUMrdjZDWExYVDVWejRlOWV3?=
 =?utf-8?B?UkpHcE5tNjJ0V3puWmVEZUlnbmFXQmFhWGlaM0tFTUdYWDFyRHYremwzVE9P?=
 =?utf-8?B?aUpSNElxOC8vNHc1SmtOQXYxT1lpMndGT1pIdFpSeXZ5bVBCVnphc2x5Zy91?=
 =?utf-8?B?K2g3eUlZbTQwWUROMUxvVGp6ZlAvaE8zYjBRQ1ZUbmZvT3RjWDlXbnRZS0FW?=
 =?utf-8?B?bTFUZUthSTlCeEJCM0U2aDhrMTB5cjFURGg0ejFuUCtveE1WMUc1ZWFpOHBz?=
 =?utf-8?B?dk5PVlp4NGpyb0FxVXJWQy9TbFNEdkQ1TEZtQXNqUWxTTHJaQ0FuTXhoVFlH?=
 =?utf-8?B?TkdrM2tVV0JmajRNOVJ0U0NkQjQwUFo1NHpEb2hyejFiZ0Z2dE5wbHF5dVV2?=
 =?utf-8?B?OS8zMGRib3Y0cUZRc2Y4cVJScHVZakRSQ3FIalRsRzBMOU9JSDhSbFNTbGVn?=
 =?utf-8?B?OFg1SU9LTm1MYS9sUUNYaXIrTjFaam81V0gwNXp4cWNKWlFjOEw3ZEY3SmNB?=
 =?utf-8?B?OUZEcnVNZjYxeThlWS9LcnNqY1ZmTGg2T2dkQkpkRm5TMi9kREtKTFN5czhp?=
 =?utf-8?B?WFpTbmtCSjRRY0RzWVhrdUFBbHY1d0plQUZCWS9qRnZkMVBid2ZRNHE0dXMr?=
 =?utf-8?B?c01NdjdvSXBEU1BTeWxtQXdaZE9FVzFmNzBFV1VQaTJnT0xaMkR3NDZhT0lB?=
 =?utf-8?B?cHdWV1BMNzN6TWRpYkFSYkZkUE9SNno5WDBneXJ4YWlhRmw0M1ppcWZQUTBR?=
 =?utf-8?B?dWJCVWQyZ2tscFhmQ1hSV1JGa3E5Z1JKbnhrUjUzeUpESnNTcnJGSWZZSXVU?=
 =?utf-8?B?T3ZCNGFWLzZRQXdHSmR0K21pdDBvU2F6bld4a2hoZHlWbUxEQmtoK09ueGV4?=
 =?utf-8?B?R0ZxY1NQQ05LaGoxODZMUzlkYVhZVENRWDVKZ0R0bFAvNkZFK3VhZ0JWYzJv?=
 =?utf-8?B?OHd4K3ZqV2diODRqNHM1bERyMnhJcHNJQ2lLYzY5Yy9FYWU1bHhZQm16cnVk?=
 =?utf-8?B?MzdYQi9pWmh5WUJPTTNKWTdKM3VmRk1ITy81SUZXWitnVkZsbFQ3YXlobTk5?=
 =?utf-8?B?OUFQMlE2MzU1Nm8vY2EybndSQVBZbmRYZDRnM1dUbFlOLzU4OEthcXpHUUY0?=
 =?utf-8?B?VXd2Q0hKNysyU2VUMW5OY21TVkxTRTdoUTYwTFhIcGthb0d0bkg3aGZTczJI?=
 =?utf-8?B?Q0d5UDVuTmxsUk1UU1V4UlRyL1lTMmJlbzVuZUFTbFN5elQvRjh1VnArcGxq?=
 =?utf-8?B?QUJXbTlmbmNqZzFnN2J5TnZOKy9uK2JxQWI4OW9iUnBGRjV0dFRCK3ZqY0xr?=
 =?utf-8?Q?4qfrqkxUllPuFqyxCYjQjUW11?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe08447-9c54-4da3-700c-08daf7cc5ea7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:17:16.2579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0yUeocQuML/DITxH6dPL4qUOqAQJGW3PsuVhLeEWY3pJiz05B3/4Y92R0E6KoeZd1xZNoB3C51/SUyze6pniw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595

On 16.01.2023 14:00, Andrew Cooper wrote:
> On 12/01/2023 4:51 pm, Andrew Cooper wrote:
>> On 12/01/2023 1:10 pm, Jan Beulich wrote:
>>> On 10.01.2023 18:18, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -54,6 +54,7 @@
>>>>  #include <asm/spec_ctrl.h>
>>>>  #include <asm/guest.h>
>>>>  #include <asm/microcode.h>
>>>> +#include <asm/prot-key.h>
>>>>  #include <asm/pv/domain.h>
>>>>  
>>>>  /* opt_nosmp: If true, secondary processors are ignored. */
>>>> @@ -1804,6 +1805,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>>>      if ( opt_invpcid && cpu_has_invpcid )
>>>>          use_invpcid = true;
>>>>  
>>>> +    if ( cpu_has_pks )
>>>> +        wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */
>>> Same question here as for PKRU wrt the BSP during S3 resume.
>> I had reasoned not, but it turns out that I'm wrong.
>>
>> It's important to reset the cache back to 0 here.  (Handling PKRU is
>> different - I'll follow up on the other email..)
> 
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index d23335391c67..de9317e8c573 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -299,6 +299,13 @@ static int enter_state(u32 state)
>  
>      update_mcu_opt_ctrl();
>  
> +    /*
> +     * Should be before restoring CR4, but that is earlier in asm.  We
> rely on
> +     * MSR_PKRS actually being 0 out of S3 resume.
> +     */
> +    if ( cpu_has_pks )
> +        wrpkrs_and_cache(0);
> +
>      /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
>      percpu_traps_init();
>  
> 
> I've folded this hunk, to sort out the S3 resume path.

The comment is a little misleading imo - it looks to justify that nothing
needs doing. Could you add "..., but our cache needs clearing" to clarify
why, despite our relying on zero being in the register (which I find
problematic, considering that the doc doesn't even spell out reset state),
the write is needed?

> As its the final hunk before the entire series can be committed, I
> shan't bother sending a v3 just for this.

If you're seeing reasons not to be concerned of the unspecified reset
state, then feel free to add my A-b (but not R-b) here.

Jan

