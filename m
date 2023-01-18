Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E06671794
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480258.744550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4hA-0002eU-RL; Wed, 18 Jan 2023 09:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480258.744550; Wed, 18 Jan 2023 09:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4hA-0002cj-OZ; Wed, 18 Jan 2023 09:25:24 +0000
Received: by outflank-mailman (input) for mailman id 480258;
 Wed, 18 Jan 2023 09:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI4hA-0002cd-3j
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:25:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07efa09a-9712-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 10:25:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Wed, 18 Jan
 2023 09:25:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 09:25:20 +0000
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
X-Inumbo-ID: 07efa09a-9712-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOczQuQRhOJIZxztP/7SsvB+38bAtNgKsAxF7GOEYE4Zx5w2rOApA2eMElQSldsQVcS4d46Lp+ubZ/MFvmVV5EM0IqoDmJgjUDvClKthMlSNTzJkHSv3Y9xyKoSePV5JgNIXJAb+QmT2DcV0L5ZEt1lMbiE45y5EdZVjp3MR/yS+K5JExJHQ3z6carrnl7DhkB96fF91aSQtIDkjyZumJOW3Hz/81tfKF1XS+CgOU5byVtN9N02/zxUIBArvUlgLI8Mt1eh/C7IC9VwqrESH9KnDpSXg+i//miZdAbQOHYuV0aQTGryL+5ZxBiQbT6G70R6Dqk/64I+KrUIExKaMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q00CwzZYgjFUSgH0jbxOOZfZ1NsMwDeapivnXGKnI4M=;
 b=lWI/M48e3/yQQwamD3AhN3GZDRNSckP5/JSP9IcQT3GmJ0vrYpbjn46Of1hOqib+724h6zTop+7Ld0UKHCpTORZuUnW5mnOMcW74lDHcufxEmurCVbdK81JQxljNucMlyzKrzLXercXyyvJm+gYpPXMJnyj6stdWAx3MKUay3iRILsqFjnL1dJUgK0+fl0YV87Mk7ZGQ7Kngs3PgFNoolB7S1AnJrdpPoxEyDqvmdwAwsu8RRDWlDM32XCzSMjeQd8VkqhB+FdKJ6axqqUq9ZeQT13brzfKGsFP03iW0NByOj6Gr0vc7tLzK+5VT8Qxog86ioeKzzlYneCTMexNLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q00CwzZYgjFUSgH0jbxOOZfZ1NsMwDeapivnXGKnI4M=;
 b=sp3at5B22I/KTUogobZEICxYDqA9ff8Lz8wk8cgj9eMwRXfnJSJOszndOa8+uCpwpyYnxjqeHLwKaUpQ+s7sna3pYulkvv/JbbOqZ5WYbHJS3T5Hd1NlUTJEhCI13g/OKuN4gm0QwbVGL2YvwQJU75xErNq3D8L9ymQ3A5WIewBnQABmRYkTss/Hm9o1xG1c5/zXfntrFG4YuKGQvVg8JLDF5teF9U+yyfwKbV73XqL6tGaYLoGDPGRmfiRcav4E0LP6VDMAb7jawBNkV8gAVRmbpSSHmfS1o3JA68YUeNQZ50mHnLJ/pnIJ4vwbMC2NqQZUrHzDQITFBY//OIP2zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ff1357d-8318-f105-f0e8-ffec40699841@suse.com>
Date: Wed, 18 Jan 2023 10:25:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 05/10] x86: update GADDR based secondary time area
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <7d814375-c190-ae0b-793b-a8563a23d318@suse.com>
 <d0186b8a-652c-60a2-dc27-50c54d9221f4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0186b8a-652c-60a2-dc27-50c54d9221f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 133d7c51-5473-44c9-4da7-08daf935eada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n3pTvUSf34x6JiHpkbfSXPDrwPyBlph5HxLHrcvOkCqY0guCmGaXyLEb8s7z4S6dhX+NUYrIVMq8pft1ivloApXtdHKgGNfCevbSPw19Rzjvnx29tN9D+05X3EQs5nT0V9wn8pbFPPUE0U1bDSFC8F+DNBE7S1PTfvdj2vKhO18SCxoDr+JYlrG1R8gNdYNzqrWYIFjbZGb41bLI5FgZZBf2RxY1Z3/GZ1U21N4Wj067K9gL5WZEkgrUyDSUSJIQ0jOrzCHWLEGm7rEcKsIrxDaseI2Gmbhn7ruRMhhqz7rRL75BPVm+85NEyncKOJZ18U1tjrryt0ShRpkvjNElXe1jOQ2Ri40SLTWNOmmwLU1TgNy8adS0oP8V2I8wUDYUJyfX8vUjVyvNbhqPX/Rvu//q0Kp+ZWvdStmj40rf/N4MRUICX2X+ZQPIVe8LS9twtzCsNDZ1QtNvu/1SGQhZShAUdJdfEBefP1bHuZlS7UR4jYBbCydMMNLpC57VoPrP4mtVow/sp8+X27z3tXsmus57YK/YLtNM1U+VTsXJPJlGqwU6MTJjmQCXjjIKwsiFCOYDYgSXiY6DaANpETZVzSAAIoQaZPx4JV6kUibmpThu22gY0/yuFtNu+MrEOOJLMawRwP09RI6n9OpllnvoJbFzKCjbPLkwPM2Bhi46gKErJbebE/EqVP0pGkABtcWaj2tfle0crp/vRalULE5fAO0xuXCOcnuxMTQ+FOFaR5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199015)(31696002)(83380400001)(86362001)(36756003)(38100700002)(316002)(54906003)(8676002)(66946007)(66476007)(6916009)(41300700001)(4326008)(66556008)(8936002)(5660300002)(15650500001)(6506007)(2616005)(6512007)(186003)(26005)(31686004)(2906002)(53546011)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRpYzlzSVM0V3Yyekx6K3h5N3E5WVZ6ZU5Ka05hZy8yNldsUHJqbkZmSC9m?=
 =?utf-8?B?bExZWDNndHlKQ1BPRWxjUnF6a1ZTdytnRjRlTjQ2QVRlUWtqLzQ3WFhCS3g5?=
 =?utf-8?B?eXlTbWNYbkswemlzTXphdGJxMVNBaitsLzYvTzlwT29GQWppd25Bay92MjlF?=
 =?utf-8?B?Q2JSeDgxdGNKd1ZrenVCbHFseVowQ0VIYmt4K1FsMGVJN2hpMm9lREFGNWVh?=
 =?utf-8?B?OVc3VktsdlNQNlM0S25nV3JURWJEL2pVQWVZZG5NLzdZRlBPYm5hYWlxZXFw?=
 =?utf-8?B?YTNCYjE1djg0bUlmaHRwVHdNS0w3cWtLeGpGSzduVEg5REFYdVErc2RWek1l?=
 =?utf-8?B?dXJ3RCtFY1JySzQzbzFabjdjVVpYRWNELzdlRHFDWmppWmpYaGlUUFdwcU5N?=
 =?utf-8?B?OHF5cENlSW81RWIzWVVrbzNxNnc3OE44NjhoT0JxVFd1cDRoUmlWM2I3UzRY?=
 =?utf-8?B?cUpZbGoxTitEbWpyRldkVEhTM0ZGZyt3WU1XSmo4RnhadnBHQ3oyV2g1VWw3?=
 =?utf-8?B?azFxZFdONkRXTVVzN0hYb0IwMU9USDFXNndTc05LdGl6SWZ5Wm9YanBkcGV2?=
 =?utf-8?B?eVArWEsvQVhPb2k4R0FrbHk0dkJ3UG95Mm9QOXBUUyszcERNK0xYSWp3T0o3?=
 =?utf-8?B?T2NldDRRSzVEL1dEUzVMQUg0blBCVzIwY1dnU25wZEZUSXZzK3VacVRnUVRs?=
 =?utf-8?B?NEs1allvVi9jTFJzWmJSbU1CL1Vna3B5bHQ2cDVYV2VoZUNyL1BoY2x5TGIy?=
 =?utf-8?B?VkFTNjI5ZUw2YlhFL3cwbExOamYzZFdpbTNONHh0T1lHRHpMZVhKMFE1Vjli?=
 =?utf-8?B?aUUxQnpwc3FZbnFGRGVhaHZLS1JFbWUvNVZhZUtnTDVOVG1CemQzYXpRditX?=
 =?utf-8?B?RHY1M1Q4M1p4dGRzWWw1YThGNFRSbHUwb0c3QVorWG51T215bnRITzdNOFpi?=
 =?utf-8?B?WHlsVHNxZmZvaWhyeXVvS1lnNDg5b3c2RkxYdlAxWm1zY0thQ0l1ZjlWTVNZ?=
 =?utf-8?B?d3JPb0xFdXNHTGdGNFp0TUU4MEVCd3B4RDlKMmZISWk1TnJWcnlHY1ZVZmVU?=
 =?utf-8?B?cUtCRi9FSk9FSGZZVE9hUU9hSmpkN1psbzBrbFRWWVN2V0dEK1BCMnZxZHJP?=
 =?utf-8?B?czZBTFI4S2JXNUtnWWFuN01maTIrdWZiQm5hZmZPcnVmdGpMTWpZbGphSHov?=
 =?utf-8?B?TmVXbzVIa2dTOHl1ZEdDSkY5R3djQ24vaWpHa09Mdk9xNEhIMEhjZWFPUnFx?=
 =?utf-8?B?aURRM1orTkNXbDdlRUpMY2R3d3ljWVN6d2E2bWUrNE5hSTQxR3Nla2M5TU9z?=
 =?utf-8?B?Z0Y3cDNvcndxZUxMaDc0cm1iU01DcEdPbTY4NDFXSlNqNjVyTjlCUUVOZHE0?=
 =?utf-8?B?SGFjOXQ3VlNxY0UwUEhlazJlRG1tR1ZKWHJDMVREZjhIdmVsOW81aVhiUXZw?=
 =?utf-8?B?ZGphVmYyNWErYzZ0NVB0ME5iNjIybS9nT3QydTlvZEROU1dIYnoyZTVxOU5Q?=
 =?utf-8?B?ZXM4Nzd5TnJWbk8zeHhMaDU2NkRFTFVkMGUrNTIwTHU4RWpDTzRKMnpWbGxR?=
 =?utf-8?B?cFp6eXJhWmt1TXFzejhJbloxODRxdi9YSFFKMFYvdUFFa1dDT3ZicHVKRGkw?=
 =?utf-8?B?VjRFcUVsVnZQR1gwdkp5UVM3ck5HKzYxR1dmdG9BdUFTUjdIK3ROOXJLeWpE?=
 =?utf-8?B?czhPTFQwWXFQQXRQNjF1RTFLVjZUU2czVlpscm44U3EvZXNBRGZhdWdHUDg5?=
 =?utf-8?B?WFMvRGgxMmo1bC9VbHhvQzVpV0w5QW1ETzBIMWQyYTV4UnBOMHVyVDk3bkxl?=
 =?utf-8?B?YmpDZlpyRnJJeVJMMDY2L3UrMVhZNThiKzR1Q1pReldMYmlQbVJzbWx6Snd4?=
 =?utf-8?B?UmVQK1VGZ3VzSU9WK0tMTGNtNVliWllISVJOTXBSM0piaUNhWDFCUmRNNmVC?=
 =?utf-8?B?eDlocFl0NlhFWTFKUkhXVDk3WFVJajkwNFlzWkZZdUpNNld4VStOeG9JNDlj?=
 =?utf-8?B?WEU3bnhLUW5FZS9ySWh1WXhPZldDZG9qU05VWDVUV1c2SWx2TmdMck1kL1Bs?=
 =?utf-8?B?RHdYUjBwR2wwSXZqQTZwQmRUak5QL1MyZ25uME9CZkJnazJZUlk0WWN2Qld6?=
 =?utf-8?Q?ib87ltr5sJe1kNNf18WlXctAv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 133d7c51-5473-44c9-4da7-08daf935eada
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:25:19.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+WDfJJq6W8taWntVTkP77xJREqoX0/32A75jc/KFJHNBMQLOezyKI83pn7SZBWpvs8iO3wmDOmf2PASttA3XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471

On 17.01.2023 21:31, Andrew Cooper wrote:
> On 19/10/2022 8:41 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1462,12 +1462,34 @@ static void __update_vcpu_system_time(st
>>          v->arch.pv.pending_system_time = _u;
>>  }
>>  
>> +static void write_time_guest_area(struct vcpu_time_info *map,
>> +                                  const struct vcpu_time_info *src)
>> +{
>> +    /* 1. Update userspace version. */
>> +    write_atomic(&map->version, src->version);
> 
> version_update_begin()

Not really, no. src->version was already bumped, and the above is
the equivalent of

    /* 2. Update all other userspace fields. */
    __copy_to_guest(user_u, u, 1);

in pre-existing code (which also doesn't bump).

However, you point out a bug in patch 9: There I need to set the
version to ~0 between collect_time_info() and write_time_guest_area(),
to cover for the subsequent version_update_end(). (Using
version_update_begin() there wouldn't be correct, as
force_update_secondary_system_time() is used to first populate the
area, and we also shouldn't leave version at 2 once done, as that
might get in conflict with subsequent updates mirroring the version
from the "main" area.)

Jan

