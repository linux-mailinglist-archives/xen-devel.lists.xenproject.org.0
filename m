Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6156D811
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 10:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364946.594935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoq0-0004YE-MO; Mon, 11 Jul 2022 08:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364946.594935; Mon, 11 Jul 2022 08:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoq0-0004WR-JZ; Mon, 11 Jul 2022 08:32:16 +0000
Received: by outflank-mailman (input) for mailman id 364946;
 Mon, 11 Jul 2022 08:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAopz-0004WL-CT
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 08:32:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d6eafd-00f3-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 10:32:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7222.eurprd04.prod.outlook.com (2603:10a6:10:1af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 08:32:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 08:32:12 +0000
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
X-Inumbo-ID: f6d6eafd-00f3-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjVLt7oYf+ZWIXVWWoP9DfNH3BWvuUat2moYyaQkuAphqktiCGyYNyS/vAFUiJ8Fis5cZ90F7IBFMAKa51VJ6sleF5E62oXqDgy3NY443SRRFG0KJohEd3+sC8sGwxvvLzk1XF4/wgPZ3tRjhekAt54xmLmg26vEYN826MqOyyCWb5HwXWnD2jCdqQmQ7odktP/kN1BMPFqHXr7ultgq05z3Uc+vcgjFB1a/r9jrcGxd8bSrwyCU5nsspRyUrrQsdO+exQbPZT+j8tgMx4pjSI2d4coTicRFCLTyQItrZ5cdxxs324PkiOSkAfkqK3bjUmRfHL1+fAAVM5xDoBRedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jjrHqJ+4T+EXjrFd2As2FR11kJL8/AyAArI5WMMQFU=;
 b=agCbFXL7QCDQbdtmeRX8ard8B45M7CtTczjLub6+m7dN424m5X0fN4pFMqNtn/tLD0PSESMTFLP+eWc/bduhymNmb0BZ1FSAs0BaFd7FUBJameENbdrB77E3co28OgVMqQLabTIJlcCtxUmnqHWA+/4A6S9HlCyTj69cHz+MXOvYrb4NFyCq/g7yx+KluPVCZXjrz1wX7La4sd/acMY1RMhqT9L2VFAB1aawtQh3E0PIyqmgUJAm5bOIK+YQGEa4zAjusLgYGiNyLE/y5GryV2WrJwZvG0qOueZuwGCc8oauI8gFc47lHVevPOVjQf5EoBycQ8jgzpx8mSOKVHyLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jjrHqJ+4T+EXjrFd2As2FR11kJL8/AyAArI5WMMQFU=;
 b=E2Lhmy5ZmPr08tKo3xa1cmf+P4VvOiO8Q+RlU4/A4QwUApgMT5BdYFquA2B6ylkYVWIGMW7OzQrauLUFs1DoXcdg1bca9pntZNRg9k5a51385NJqTIen1aufGnHoDmMtj6xYhvS7qF7+Ciil5kbTeatq/uhJFoC4pIu+eCCtZ3lx7COSfiGvoiX32CRYzxaRFT++4sZEJeGu4es9gs93G3GS/ehrJVFN8rrK9QizZf+AejRl1PrW0yB2DN0QbVqoZYjIb2v3IIytV7luUpavK9AU6hQ87dHvDI0gAK4nXfQ3en77Wp7jSX+qOccMVNPURlq4xFfEbrsPT9mzf4HKbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <edec19e8-94f2-5ce6-1a32-58f718154162@suse.com>
Date: Mon, 11 Jul 2022 10:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen development discussion <xen-devel@lists.xenproject.org>
References: <20220708213403.2390-1-demi@invisiblethingslab.com>
 <fb459be1-1f02-ba6c-6ef3-ebfd787fc773@suse.com> <YsvflpBJKLJdvYh4@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsvflpBJKLJdvYh4@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfcd9339-bdc3-4469-4d2c-08da6317da76
X-MS-TrafficTypeDiagnostic: DBAPR04MB7222:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ryGim/kVfQkeSY4ei/vhyjX12/AjiLJNAc/1eJAKqK8/dijXbdSgmRxNPIgAWB/ja6QKnS++iHO6fAsgeGr0BzMYsw8BGx7vpbfJArEvmjQhRMtFaKIfcT5kEjoi05veouDnxkufHy9bj+/cYPnhobNxtgq5jCc6HW7yxmnxfZenifNtITOhaZPD/EMRV6pUopXOnhUt/el4cgPt0/abx7bIoRc52TfkbibMpqpGW1ykljtIL1iuWE6gXrPDWNPO2+vTiZCGHT7kIcnoI8cAgfPgWS/XaPKZ6MfyD3BB/gvNxNL9YR81Cng7HlBHqI8uX5i/1+2yt4xh+G/xv1Ft5eYyMNpFRkfxYTXz8WXMJgx0i7+87r+b/Qt3lwUunWZwUim/Dpf5Mr9YtoqtVMoK+7HlCD+CLLpDOW1giz74otXzrlHJRq6XPe9Digi7IOgujAhSvSoZup9R3zD9z88Wb0XFrf7uWDgcw6HtWuT8I2uZmxh+r3yyvCSdtTfFVHgwIe/Zcc9EbLbGEYd9cNeTUVi5lappV2Blama8XPRZp/FsdkoPHJEeHG/6AIkInXVs7J0iEbCQ5lKvNHKK+kDtOwCzyPoRGrdJqLanHnIQCD/EYdwoPad2PfiawgbE80zk7OMo05Y+/MJfEg4PkkfU8y1Zx5zqS21deTVwSXm+t1aZWmUTut3WcElpZ6O5OUqRAySuksjFuycQllvP/porB2ZHBzV7BvK9G1XeSiH3leRXK2sQVARCk6/b+zDPLzBtOKI1OiMr00zbWnU2HdVBJwjTUhoIB7fY9otsY+FE5Lo6fqA0+N4bu+SME8zruztb29VLgS6YbltLrKFxMFQkN+wPDk7zknI2ikd4qC/3wAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(376002)(136003)(396003)(346002)(366004)(8676002)(66476007)(2616005)(186003)(4326008)(316002)(6486002)(66946007)(66556008)(36756003)(53546011)(6506007)(26005)(6916009)(6512007)(478600001)(41300700001)(86362001)(31696002)(38100700002)(31686004)(2906002)(8936002)(4744005)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW00TktEb2hudjBoSCtxNTJ6NXVKR3dMTElQelEvQWhleE9sNTFGb25RMXpP?=
 =?utf-8?B?WUY1amJCUFc1YTlaZmNzYUltMjlTdlJQbk5lWGgrRmlyKzRWSXRMdktYYnRV?=
 =?utf-8?B?UXhHbGcwQTd1ZmhTZWFTc0RZMmZqbUprWWlpdStXRllUVFN0SDliQ2hWM1lt?=
 =?utf-8?B?RTg5ZERJNlBIajlxYzRvKzN0QkVsZHRBYm01MzdIQzY5NHhwK24zaWhrbTNm?=
 =?utf-8?B?bUI5VlYrTjdMUUp6ZnM2VXhxSnNWcHRMbndzcSsvWVRKa3U2RG44dHFabG53?=
 =?utf-8?B?OHV2eDlGSnptVGl0cFNSdFJ6aGlxdkV2Ui82UEpkZ0ZpZVlDSGZveDV1UUw0?=
 =?utf-8?B?NEtaMHZFdm42TDdsK2wrK1J5Rkhnc0M1MmZSb2t2aVpDQ3QrMDEyUzQ4VTVY?=
 =?utf-8?B?bUhOSTlxZkNkZ1o1R3EwYVFZdHBSSjMwMjFtcGNPcGMzaTBaZ2lGNXEzcVF1?=
 =?utf-8?B?cDZ1SHE4TktnZUFPdEtQSW1jVmpyNm1jZEczOFFSOXRCaUJYekdwSUdKVGpn?=
 =?utf-8?B?S1daczhLUUI1ZHhqc2lPNkQ1SUc3UjAwQkFzVlpmR3Q5UDhoYW9FcWpQRXMz?=
 =?utf-8?B?cDdtMzZKTTZSeVkyNi9lU2FWSWNvZDk3a05GQWVKOWNhOG1yRWNjcmFWNHlS?=
 =?utf-8?B?WEdhR0YwVU1xOFJTc1ZmdWU0dXhUanJIMlJxY2dlMlFKNDhCQitmbk93MU9Z?=
 =?utf-8?B?NGhuZzRZWDBEbVNiU2R3TDhsOVQ4YWE4VGFyYjA3bHJONldURERadHNzNDl5?=
 =?utf-8?B?RjduMkE4YnRIWVZ6S0NiQXN5eFZQbGkzRm5TUTJVbHFnQmlnckszUmJVb2Jj?=
 =?utf-8?B?WVRLY2Z6MFd3YUI5ZzFJMy90NjRTKzVQNDI3KzZnU1YzQjZwQjVrNnM5LzQ2?=
 =?utf-8?B?WHBzNVdFd2RXNTQ2cmZUTVhNbGF4azNjMjJUenozejhlS2NuemNkVjh1NnU3?=
 =?utf-8?B?bG9hdXpSVkxBdlZjTTVLTGxPNjhod3lmOFVSVDdrd2p3eTQzZnZ5akZhZjRU?=
 =?utf-8?B?YjV2bjRiRXFyN2s5eTE2Lzh0SmlxZllyNHRLTERXMU1VR3JNOHlRT2dmUVpi?=
 =?utf-8?B?ZzhydHFYc0o5MEp4NUcrR1Z6dEFJaVFwU0ZIOHRET3d4WHhTSFJhcncySk90?=
 =?utf-8?B?cnNXVzNYeDZjYTFrKzRMdkhTSUQxU0I0d3ozOVluMTh1eVhhaklaUno5L1Vz?=
 =?utf-8?B?NlVHT2F6UDZXa0dIeEFmM0MxeFhzRWRkenBLcFFLcFVUWEZDU1N5bjE0ZytK?=
 =?utf-8?B?MG5iVUl1WWNhSU1pM3VnTUpsQzJvelFhSDFGdWQrY0REaVBIdE9MUG9RR2pn?=
 =?utf-8?B?dTRpRm0za0tJU0xMRFhGWDVoSmJYZG1LN2tzQWNleFFBNzAxaVBxUllUUW9G?=
 =?utf-8?B?dk0yaytBVVY5YVlhUElSZVBjcTdnR3pjNlV6MkFpRFBXUm1SbWh5bGhHcVAv?=
 =?utf-8?B?YmQ1Q1FZYlFwd2N5UkIxcXpnTHNNQXRPeXhxQjNtS24yU0NBRzFKeVNHeUta?=
 =?utf-8?B?YTdjN0Z5bDZubnpRMEpmbzBhSVMyaCt4dE5nK2EvQ3hIZGhnV2VzdWZWQmRn?=
 =?utf-8?B?QkZreTNuSy8xYk8xM2tCcm5NTzN1SUVjWjZvTVlESW91aHoreE5BOUh0eXNR?=
 =?utf-8?B?UVBpVmRmWUcwbDdLZWpBbFRmeE5PTk55eDNKOGk4SEVpcTZhRUZ2ZkhXTFBi?=
 =?utf-8?B?OTRyYUswaURBZjJuSE54cWNKTnVFOWdiNHB1RDhJRTlhUjZON1ZHNmo3Vy9a?=
 =?utf-8?B?KzlrY0RyVE1qcTBhNXJ4UUNBTHB3S2dQa3dLN2M4ZDl2cnpuanhlS08yZ2cz?=
 =?utf-8?B?cVc2S3pHNzF6dEpYVytFU1pKYnB3eFJwS09oUVBvR1JOZDVLUjl5V3g3SHVO?=
 =?utf-8?B?dGE1OUZZMC9GWkpzVk05bGFvTlEvUjgzYUNycmVTRnVPWHpEbm1OZWlQUW1a?=
 =?utf-8?B?M00wZ3QzT21HNXdLMnFLT3RGbU53V2VxTVZ0b1RIWU5iZTlERXpWMWNlb2U0?=
 =?utf-8?B?VXQ3L09qVzVrTkpZd3hsTW1TREtaOFV5NUxITWpRR2JGNFR4SERIcHdnRWpX?=
 =?utf-8?B?MGtMT3AxTmxUWExhOGpqbXNMZzlheDhvRlRvK2pHL2dJMHFDbHJuREFvcHIx?=
 =?utf-8?Q?0fNCQMIYV2xO0b8ngcdKCp09a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcd9339-bdc3-4469-4d2c-08da6317da76
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:32:12.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nc31etUeZggnb9zxI+qN8BAO5X/8HPHc+bNhyRA0GmDYOKroc5rhdPhrN+iUlxxNhGf/FoMvO9lbJnf+MQ2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7222

On 11.07.2022 10:30, Demi Marie Obenour wrote:
> On Mon, Jul 11, 2022 at 08:41:59AM +0200, Jan Beulich wrote:
>> On 08.07.2022 23:34, Demi Marie Obenour wrote:
>>> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>>>  #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>>>                                   (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>>>  
>>> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>>> +{
>>> +    EFI_STATUS status;
>>> +    UINTN info_size = 0, map_key, mdesc_size;
>>> +    void *memory_map = NULL;
>>> +    UINT32 ver;
>>> +    unsigned int i;
>>> +
>>> +    for ( ; ; ) {
>>
>> I'm sorry, but I'm now going to be picky and _not_ offer correcting
>> this style violation for you anymore.
> 
> No apology needed.  Is the problem that the brace should be on a
> separate line, that the spaces around the semicolons should be removed,
> or both?

The former. Iirc you did actually _add_ the spaces upon my request.

Jan

