Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0F77399F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579585.907625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK3c-0006iK-4x; Tue, 08 Aug 2023 10:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579585.907625; Tue, 08 Aug 2023 10:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK3c-0006fW-21; Tue, 08 Aug 2023 10:35:20 +0000
Received: by outflank-mailman (input) for mailman id 579585;
 Tue, 08 Aug 2023 10:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTK3a-0006fM-Di
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:35:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44340661-35d7-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:35:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8628.eurprd04.prod.outlook.com (2603:10a6:20b:42b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:35:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 10:35:16 +0000
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
X-Inumbo-ID: 44340661-35d7-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4lwwanTZjhL/RzXv3lqfonBzM1SHMK1c0Tdd5uRbW/sN30h1cNkrIVEa4m2U2L71n4Hj+/WQXhRja/3bFxOZL7Jwej3sJcfZ5LT1wLuZzWuOADCZA4QfuNkNMvIxww0ldQ8D0RG8qcl2aDz1SEnK0oaGZYqNVFWHMVS4ATWJ+wND7+sfjwOmxgTH9wXxVBiL2+o+aCX5dKEBD9vMQzOlDiphJa6B4hIrvi8JJmpsMZYMwMuaxQkY0UgCz794xKg3UtDJzGGsBJ0oyjEDyhTJ3vop6uT9Ej4R3KM8g+NM0cMdxbqTDA+Txv7UiXgra4pjOOD9PT1s1l4tfXfDd4ovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlJ3WM6FvUIkZY0BuNVxuiXNNnSEQhgfB4Uyx14ToyY=;
 b=MuM0pIQcNHB+JehZWIKS2nUvv5KjwtLWeSfSeeuCJmwZIbQQ26+uziSKT7ICXt5NpZjCOnKKD8ymQxDc57aO0/9kCuy4Ovue24oE/+OjbtMlgVdZAaEuPhswMbDEAO3TN3EJId00eX+QZ1rTTKTrk3di7Lqfe1eCptSoq4Qx0u0JUpVXAgZnTKW9VP5I7R0x/ZDSZ8ue4f3Ko4Ic0hiYbVsqtrv44204+8IBcjuSlGOVs/v2iU3jjTsXAiJhdpQfN+p8eP1tJOQRKHjbi/z/pzyBaPcxl34Uq/E+FqGMBs0sNvWtmBfaL7WcZCC1JmEx5idGYBLFjomWmqz22qBMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlJ3WM6FvUIkZY0BuNVxuiXNNnSEQhgfB4Uyx14ToyY=;
 b=t4FX7hjHiui+CI1B6RKe1CE79rsVJ3Ztp8j3/HVs+y5Hp6KnR2ZWVwHeHy9QEL+WENE5/k3RUv/br3Xw5zu8r3yytOeTOtwcIraeqow1kQfL8FqkEo+fY84u8R52GJBJX28bRoYwX5BWd2ugp/NOXNutB54ak9Jv7Z0vStfE8iNV3t1OwAGlAf660Svd8Y/rIMn6zsREaAfFTAimlrG0jg5P3BE6iIUOzanvzt4sF2sHMmGMlextepGQ8Uxo01/ff8MW/Ho1OyLS/XYVMuuugE/nrMJHGIAkW8TiuFkF8lHAm72Gu5BlWxZV2adAhkKY9PMS5GXmLrPl6+ELdAJsfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <077004b0-4938-ed87-81a1-9071f80f61e4@suse.com>
Date: Tue, 8 Aug 2023 12:35:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
In-Reply-To: <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: adf9793d-ca8f-4623-0347-08db97fb27b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gnxBuYGbOzyPNNaYH40+o5mOYaM7nnAl5e0rZCaP2A5DGOhAt6gQ4dWCDWewk3/YRlFU4lZlcnHldW9yxFp2EgGoY6Vfv8IbNWvkSDUTgDzFciJ6xflK6fOpQGhPnIcEizj6ufkvUBsY7y5y1gKQmvPYa8thdLOEwWBFUoXe2JNlRGchSZeH5kiYop33OxcpjNKIkuoTN+tISB4m7qRomPsGRotc7U/Nj0sqax7+vcCdDOze6j24Pgkx/WsEK3PoBQyxlg/J3qNnhgqhr8T2ai6R2kjf3OM/UYegDxTyU+9vgw53kgVpXCfkj/NHkMfmcyJcmVuoVCHHBW1nI+abIzDpioD5HGSGWSC58fZy5mOeZWkm1si1kO0NwbiS9FYdHsTSOnE3UumoTGVLgPuZtDLyZrJKb77fL4MvTWCPfq8ihntasH1mfD1qlKxmaBwMESJozOsK+lRAWzstgIGW+DwO9uhJUpv2qQWxx1PU/3tyvVCiWbTJ0xdWR0sUYTh2An3dy+65HihbUO+K61gmalcEG8cRdz5e5EIySupW84jvavwgV+VZQb7HJx1GVSrSnPasjhlLDlAL4QYkgebhbLZ/BO9AU5HHScbAJpFR5DFMshhHSjEcsxLbH1Ju6fhT3MWUdXBuzvNkb0kSi+ELSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(186006)(1800799003)(7416002)(8676002)(8936002)(5660300002)(4326008)(6916009)(66899021)(41300700001)(316002)(83380400001)(86362001)(31696002)(2906002)(6486002)(6512007)(6666004)(2616005)(53546011)(6506007)(26005)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2d4U2hOZHJ0bGhDTkNvVDdCUExjZER5ODV3Yk1kZUk4ZldIKzlSZEVXUXNW?=
 =?utf-8?B?MFl1VkxMUDlPa3B3Z3hmbzZmdUdlWjhPQUkxY3NmamZRUDg2Ky9KNGNkZXg4?=
 =?utf-8?B?YlNDbXVxR1dHZEhOaTVFdVZCcHNpdGlBcUtYT0NuUUwvOFNqWmRoakkxYTVB?=
 =?utf-8?B?R0tCbGxVZnRaMHJ0ZGtHTFVUVE10a3psMlJ1dFR1Q1hxalJhR1N1eFlxMDE4?=
 =?utf-8?B?dHJVelI1eHFqSHVGRGNRTkt2ejFEcHREejgzSURDNEpLblgvRWdCYkZCVGFl?=
 =?utf-8?B?NG8yMVI2NnluM2c2RitLWjZ1Mm93aDdDckdjUEVqRnBUSCs1Z1hKd05vWmVH?=
 =?utf-8?B?bmdEY0E2ZDJ6bUNlNTYvWmM4TjRkaW13dVZ0aExIV1c3bUU5eExpTjZXZkdP?=
 =?utf-8?B?VG80WXpjbDNlTEFMUCtablBocjNZeE54TFd4V0piVUdJditneElzYjQ4SENL?=
 =?utf-8?B?a2VZMWgvSUp6NUtKODVTbSs5dS9pLzRSd092YkVsczNFT2tDV25wd0d6Z3c4?=
 =?utf-8?B?YmQ4cHBYckUvdkRzanFOQ0UxbTRtYTJOanJoUEt5Zlh6MzNITWFtNnZyeW1X?=
 =?utf-8?B?R2xoT0tncUIzWXFleTNJY2pUYjl4Y1lyNWc0YzgrNHRDU1JQUGJSZklzUnJH?=
 =?utf-8?B?aW16ZytDcFR5NWluUkwwcDRCbWVnOHoxZENzdVk4QUM1MHNDVTk2YmgyZ2tJ?=
 =?utf-8?B?N3lhTk1JUXhodE1lV1ZMMTROK2tvdXpIN1ErRTJxWTlRcXFHdkp4RDM2NzhF?=
 =?utf-8?B?VDFhT3BVU3JsZDdHcndMLzVQd3lwTnErVU1EMUNKcUhLZE5iREJJNVpQWFly?=
 =?utf-8?B?cXViTmxiZkZiT2RSZklvQ04rb2RyYzIrbUJ0WUFzWjhXa0FTb3RabGZiZnBp?=
 =?utf-8?B?TjJDSHQwb3d1RzR3bTdlY1g5Z0tKQVNMOUdzbnBTaVdQR1JLNkV6T2FRcjR3?=
 =?utf-8?B?ZGt2SUN0Q1JnL2hvZXpVTEVhVGRlQXQxcU55b0pCK3VoNUl0SVRSUGY3dnRr?=
 =?utf-8?B?RW1KUVVJSUlHWUdmcTB3ZjE1dDM4MC9Nd0JZMXpwbXNmeFJreWVZdjdna2dp?=
 =?utf-8?B?T0U0U0VTMHpKb3JvWmtlRGs2OGk4QmxxVXVvZlBXSWZHc0dIM1lMbkFnaFZG?=
 =?utf-8?B?VDBldDNheSs0RU5VWWtqTHE4RHpNSlZpa0FzN2Y0SEt1MHhpd3haNmNiQk5m?=
 =?utf-8?B?U28yYjJFZncxeFV3YndUdTV3VmZBaUZoY2V0Q0tBdjZuUVhSd1NlZXhYTXBh?=
 =?utf-8?B?Y0VLMjZ4Z09rS2NSeXM5OVJVU2l5elVFWmE1eEhNVU44V1BNYVpmdXJITDRv?=
 =?utf-8?B?MnpkOGJBbmNTRVh5SndEdmZNcVpIQWg5cnRlY1JvRjB0L253djhHaG9ZcG13?=
 =?utf-8?B?MkdDblVPTUY3WE9UT0NFQ0xpaFM3MHRmYzlUcGUrMEhVbXBoOUI5OEJweDVY?=
 =?utf-8?B?TEs1QUZCZDN5QVNmMFV1NXdtQU5pYW9Zc1dkd3VudkdhcmFVMk55T0h1cXlj?=
 =?utf-8?B?QlpLOFNCQW5LVVR3L21xMFNWbFVOR2Rzb2V5eTBoR1EwaHF3T2hXelZHNk9h?=
 =?utf-8?B?bk9lTTZKNDZVVmZMeEQ5T0k2dlVEWmJ5K3BjdEVHTDlqTVEwV2VYV3JXTGNQ?=
 =?utf-8?B?dHo2ZDRXV1I5TzBxYVltRE9sV2RjRFBSRzBOSWVwb2lKK2ZHNzlVT2d5c0Jr?=
 =?utf-8?B?MUhRTDN1aG84QjkzbDYvS2lRenRrKzl4TzJENW1yVGQzTW5ZWHpwY1BEMm85?=
 =?utf-8?B?QUNDbWpaY2F2YjNleFhJUUhPRlFjVDhlUStTeFRPcVErRUZQWHJna2thRkJF?=
 =?utf-8?B?YTFwYXNxeklPOXVsd0xNa2NuaUUwSmswQzZYYm9xcWJXNFp2SWxCY2QwbjZR?=
 =?utf-8?B?WFFqUVE3cEFYRWc0TnJXeWU5ZW5DMWh3VnJaV1lrZis2ckh5MHpibUFEOWk5?=
 =?utf-8?B?MG1wenJoVy8vQXAyQXZlTTZxM0lQSTMxZ2pva2xDZisxTkNld0xZSlZpRStZ?=
 =?utf-8?B?QnYvUlBQazk0Zk5TQVVlZmZoQmt6RkFoNllKTTVDQnFCd1pkSUtkaVl0UnVh?=
 =?utf-8?B?ZVRnMUo2a0NTYXdGSVZocTFLMU41WGlnVFliZHpNL003TTFJdGZYcm5LT3Va?=
 =?utf-8?Q?mYV3Sx5SxRPGyjtjdVeSoWExH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf9793d-ca8f-4623-0347-08db97fb27b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:35:16.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4noygbaSha2XcaPhwE1/pzQ7h68DPZVmjZzyHXiPnG1mAhrp8FRGznMfjMaUaLcM8TUIdAydLRTETn7Y+Er+pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8628

On 08.08.2023 12:32, Jan Beulich wrote:
> On 08.08.2023 12:18, Andrew Cooper wrote:
>> On 08/08/2023 10:46 am, Jan Beulich wrote:
>>> There's no need for every arch to define its own identical copy. If down
>>> the road an arch needs to customize it, we can add #ifndef around the
>>> common #define.
>>>
>>> To be on the safe side build-breakage-wise, change a couple of #include
>>> <asm/cache.h> to the xen/ equivalent.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Could we find a better place to put this?
>>
>> __read_mostly is just a section.  It's relationship to the cache is only
>> microarchitectural, and is not the same kind of information as the rest
>> of cache.h
>>
>> __ro_after_init is only here because __read_mostly is here, but has
>> absolutely nothing to do with caches whatsoever.
>>
>> If we're cleaning them up, they ought to live elsewhere.
> 
> I would be considering init.h (for having most other __section() uses,
> and for also needing __read_mostly), but that's not a great place to
> put these either. In fact I see less connection there than for cache.h.
> So the primary need is a good suggestion (I'm hesitant to suggest to
> introduce section.h just for this). In the absence of this, can we
> perhaps deal with this in a 2nd step, thus not blocking this patch and
> therefore not needing to then also clean up PPC-specific code?

Oh, also: I we move them elsewhere, it wouldn't be logical for xen/cache.h
to include that other header as well. Yet without that the risk of build
breakages (perhaps in only exotic configs) is of course quite a bit higher.

Jan

