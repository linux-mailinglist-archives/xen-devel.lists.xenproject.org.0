Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2603FC764
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 14:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175670.319932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL31Y-0000Fk-6g; Tue, 31 Aug 2021 12:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175670.319932; Tue, 31 Aug 2021 12:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL31Y-0000Cu-3V; Tue, 31 Aug 2021 12:37:56 +0000
Received: by outflank-mailman (input) for mailman id 175670;
 Tue, 31 Aug 2021 12:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL31W-0000Ci-Js
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 12:37:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de993101-e59b-4786-9836-ffcead1c7f3d;
 Tue, 31 Aug 2021 12:37:53 +0000 (UTC)
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
X-Inumbo-ID: de993101-e59b-4786-9836-ffcead1c7f3d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630413472;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MBvN3aq+SJvErWD4ddk0gs1AEeQaeueGWymeNsTX3CI=;
  b=diGj6XE7K1FpTLYbV+cnfTKO9SmxTMMsluJNXGg7vaVr0OcvuqDkynec
   4g+zR1tHSiQO4fkAcrocNJ+SqMVs55evn1qrX/K7xoKQZIy9OWVdoWvfI
   8NJ8BsocZDt1PTvZiWGvjJCdl9HKXEftbc+Dh8FCRxy1k8Z4pb8RHWQIQ
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: e6fnvc10pe5PxK+00A0BUpl1yxSIz4Oy1E/bPUeMhpd5tvWqWwVbHyzBqJB5Y1spN/8INIHKYm
 4mddnNKszO4x5VANdkTdWE6359EMYMoLQZhaq8WueEdPzU1alfOq11PI01AMwEGK5taDPIGcvZ
 VGwWfqoL+dUTJaBfz0ZmNV63Zkq028yVbfVR2jPTRAnUm5wEJmyfDj1/WAqjqb/QXXZVBovzVS
 cAABvtgIu8lCQKXPn460sxLtC/cOudLGqEsu4B/MAy8fs7dH9ht3w+2eiEi5glvKdKRIpahG3i
 TPj0d/5eb/5gdlzD1LyreU7G
X-SBRS: 5.1
X-MesageID: 51661406
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jByUTaAzJYSiytDlHela55DYdb4zR+YMi2TDt3oddfUzSL3/qy
 nOpoV96faQslwssR4b9uxoVJPvfZqYz+8X3WBzB8bHYOCFgguVxehZhOOP/9SjIVydygc078
 xdmsNFebjN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="51661406"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6yJp30lnT3gUfY0oT/aQiwDPFgBD6nFiX47n8OsEYRj+HDZ1uUI3+JzLnRz5m59AWSl2kr4v32I3S7i1qCkCNjEMfB7c3IGvVxhEk5WBEMtJ7812cTfJLXSb3CkJlxY4q7RVBMBhK9bAKUEyTaGW1fm7+vQCqDYSMJKBY3wYtw/YGm8o7IP7HMeWgLDB7k+smfQs4dDmSkSQxTUefXCWQWCcIeoQRuJUtBfw9uiYNNcq4n60AnWn2T6HiK7qY5CsUaDby+0bM+dkoyeS1npxUQe88Edgo7oHDGgrEwLjnXWqJKhOzPkBjqBAQOG9ZbQTEVM7XjnWm+4JK30MJc2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MBvN3aq+SJvErWD4ddk0gs1AEeQaeueGWymeNsTX3CI=;
 b=kyJPSjLnvxg9CkwVN4kwN23XmpIdrTLxauDUNbpoT0TRtBZcSrCGOe7ikIJwiheHLg9kkv8b2Sgj/C+BcFPLg6p1/F68MGugO8Cc9DtTyFOxgPcUj5UYcwGj+hn1jwDZpZ3oRH05qMo1UKuzXwIcrqEq+6Dxb+8eb7YKaY0G4FwkQiJtb9W+LVTlOKXBBfvbN++HY1z/EpI0yttmjlSRovlwGaBHQmNe+JCadQaCymzAIliTc22cRKf/sFJVy+BCgIWfQzQ65ac5J06JKYbVjX2lFj22hw8jlQKJ2iJeDzqQJeYNofbDodEBcE/68QEXcS5u7k5PSWjhJZTx3kZRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBvN3aq+SJvErWD4ddk0gs1AEeQaeueGWymeNsTX3CI=;
 b=mTRw6KJsIVxExD2WUkukII6155+3ZcMLLbmFTfE2RaCzEwCmosVGem9VAQDMancAABuchveJoixSDPZrYOZwe38feeGo18rV2MWbF5t643POwGN6z2rGxG/CbgjY2GeQ9D/EtqVcDQew4Ylk8oStJkzIipXifd7wuB8VDyUM17o=
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, Ian
 Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
 <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
 <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
 <c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
Message-ID: <9352f82a-1b43-4bf6-8b0a-5916627b7537@citrix.com>
Date: Tue, 31 Aug 2021 13:37:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82a25def-1474-42f7-ca4c-08d96c7c2353
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5597:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55977BC53811D24A8750CC87BACC9@SJ0PR03MB5597.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7o5Gc5Z6598lTLD74trc96gUX8Zk0l8zmIWqGLV23LEDeQR9huP0AsDhb492KfDUYJNkD4apBrA87WHMDbYsEpBkSuVGKL1SA7O8gE4mq5KFK6V54Fw2NQFBnes84LanIslzH7YpGkXKk9fpm1IP6TJpPbeyLTHbhnPn+nTt+cC8eFRiar0O9VZn0sx5ChXPKPC49xzVIpHy5cG7ct8eqMgoPCVZLlZ6Z/c1dhMFRHPC5RTOmYrvcGaLNyGDUMvSl/vqxeoU50Z8Czuruh2FZXN+24MVpfDBXgvgspZL+TEaZ/VkDv4dhms9uxSeVHDtPyIfRYwDhyp0aC3kQE3aoyaJsTxTQwaLK6yH8ZFonMbea6tnvKlueySHeWfKaaur6gompbTvxVxrFRMnkyid1KNT3GZq9MIq7XVN22AglHhdGkGPwpk6ImNum/tQ/8QgCOBVeejJTSn0tqGGq/9iMPah9nfpIrHMhswIrSC8oSS9FMMn4cVRAYi7ZwhCFHMbrcRzzHTjGWoomukj75uGq3Z62TP64P7o8RhirkUqQhj/MM0g+JFJ1Hn093wKO24md+wAnmzTLUfpHUPERQ1Ja2vjTxdt/UF1rMJ9EKLquNvOk8CZqFBX2Dt0Uf4cRekiGvDo9KCwK4jMQCDqKsiYdFPZpJ4JDHYkc7ZeC5gwxKeixtK6cPsSnFrDmbJHjg4xr9Pr3cKk18tZZw3V1boIFczXE+nqdxGAoZwRWM+4ZnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(110136005)(86362001)(16576012)(31696002)(316002)(478600001)(4326008)(8676002)(2616005)(956004)(2906002)(8936002)(36756003)(31686004)(83380400001)(6486002)(55236004)(53546011)(26005)(66946007)(5660300002)(66556008)(186003)(6666004)(66476007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW50M2tPNjUvVGlOOEFwN2owWHB2bVQ2MG1qZW10M1hBN2FhN3JPTDh1NGZ4?=
 =?utf-8?B?ZmVJL3B1ZWxmb3VaN2d6Q1lpQjVvMXU4ZnBDaWNTRVNKNGlFVHNJL2NSTFZl?=
 =?utf-8?B?Q0xFZjJXN0F3UkYvT2xzSVNzODdUMnd3KzlxU2R2a2liejN6ZW02Sm93QUFY?=
 =?utf-8?B?MHBsRWVtR2p6Y2EweUhoekNablhwaHFaTmdXQ3VnL3dKVXI2UURrOXBPQ0xY?=
 =?utf-8?B?Wm40ODNBWDRTbnFXZU5Kdzk0S1NCTEkwWktRZGRDK05PRVlPZCtHdnpqWEI4?=
 =?utf-8?B?YlNLT3ZFYVlwVm9ZZWUzWDFZejRQT1BiY3l4OHAveTFKK096dDVDKzRGYklQ?=
 =?utf-8?B?S3A1Q2dlRkdyVUQ0SkNFNjJJSE14TlQrd2dWbTNFZTRpbUZCcnFDMU5jT2pn?=
 =?utf-8?B?S2p0dWRoNTJxY3pFNHpScDRYRDd2RXRoWGJkbE5DV3pxckJkK0IyMkJFL3Iv?=
 =?utf-8?B?a1p2Uzh0Z3pYTTcvV3JEcEpVUTdnU29OempiSjIyT3dYdE5PV1pXbWZhYUxi?=
 =?utf-8?B?VG40NEhFRFVhaEdSV2RRNm9UWUM1VWQ2K1FJcG84dzM2TitTMWtoSC9ybE44?=
 =?utf-8?B?Wm1ndmZTakdmcU4zODBZbC92dzRnc2dFSDN4Y2MrQUptQTgwVCsrdElITzQv?=
 =?utf-8?B?VlF6R0RsdnFvVkJqOGQ5V3FubE16QVh5Tnoyb0RENzI3Qk5FOVNCejhYR2F6?=
 =?utf-8?B?OStGQkdQNTlscVNOTk9VYUNKNnk5Z2NYajM2V1JEZ3FmNy9SZWVURjQrUzcy?=
 =?utf-8?B?ejRVYmlia0d2WHJOSzJmaTZOaWlWQXo1N0x1UVVtaEhKZzhFTjdXb21zVTdZ?=
 =?utf-8?B?S2ZGaHM5RWlrOUxVWS9hRFlpMFJwQUhOMVdnckl3cHFpb29mSDNrcHlMdHhC?=
 =?utf-8?B?ejhJL1F0TlNBWkFSU0I0MDJRMXNXL0hvTHJmTzkzN3BOSzZKcGgxbXlHbGFC?=
 =?utf-8?B?d0VucWJiWmloQjkvSm5Vc242OVpkdTZ6VmRpd21xOTl3Z3NHaWIxZUpXU0w1?=
 =?utf-8?B?OUtTUjVYU0NkN2xoZ1A4YVFQWk5LM1ZTdVkxRVh0UUplR1ZrVHUzTlRyT2RM?=
 =?utf-8?B?VlBJM25tZHpFbXhtZ0x0aDdkRjdGeVR1UDk4SmpDV3pONTA5UHlWMkI5R0Ns?=
 =?utf-8?B?aG9VMnZ3ZTR4K3pUQ0ZFdVNYOXJQVmZDdEVIQ2tCcWx3Z2o5RHBjUEsxbllW?=
 =?utf-8?B?WmpFNENEZmNzMU1LZ0ZwS1VwQkdsNEpKY3NQZlc0WWtCT0dXWHhhSWRGRC9t?=
 =?utf-8?B?N1BxYnM4cDZyOVdjbW1VZGlBdWVPQWtzQ2plUS90VCtHdXhsTkwzVVlNckwz?=
 =?utf-8?B?RlQ2b29SVnFhVDFkUjBlQUE4SjJtTmlWVGNtUExCMHViVGZ0eW9YUnpOYmdj?=
 =?utf-8?B?TERFamRGdkF0UjRTK281bjJmR1llYVRCL3hCSmJTckZNT0U1ZnhIdGhvNmJF?=
 =?utf-8?B?MllBeW0xTXlRVUVTb3RYVkFQS1BjRTk4dGhqL0ZueUlhQXlYY1VSWTkzWjgz?=
 =?utf-8?B?LzNITXExcEJiQ0VIR1Azd0FJNnhRTGpaUkNaRlhPVVd4c2cxVmlVTU1pdzRw?=
 =?utf-8?B?Mm9MTG5uSG1qMm9Dc1RtVll6SzB0RTBSTE5mdVNEc3pwWGM0OXJsSUl3eU1T?=
 =?utf-8?B?MDVxcEhwdW4vVUFzYnU3T3FqcUwyZG1XTSthbmM3akU1dE9jQlRJZXhvdEpl?=
 =?utf-8?B?eU1UbzVaMm1oZktHc0tLUzlHQjNRcld6ekxUWExKdFVNSzBuaTBXZ0hySlE4?=
 =?utf-8?Q?j0uJ5xic6sURxvbqy3VVNSKbyb0AmuhQVCOyy1W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a25def-1474-42f7-ca4c-08d96c7c2353
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 12:37:47.6292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDDwHG9VjEeD4YBNGAnElsb5T1/gLXwGK41Y/Xwc9yyBGRt6OLQzUibMV8f7BjXKdIuqui5QfKYdTy0LzlPuaPxXYIMHsDkgignsVcT3XN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5597
X-OriginatorOrg: citrix.com

On 31/08/2021 13:30, Julien Grall wrote:
> Hi Juergen,
>
> On 31/08/2021 13:11, Juergen Gross wrote:
>> On 30.07.21 19:14, Julien Grall wrote:
>>> Hi Ian,
>>>
>>> On 30/07/2021 14:35, Ian Jackson wrote:
>>>> Juergen Gross writes ("[PATCH v3 2/2] tools/xenstore: set open file
>>>> descriptor limit for xenstored"):
>>>>> Add a configuration item for the maximum number of domains xenstored
>>>>> should support and set the limit of open file descriptors
>>>>> accordingly.
>>>>>
>>>>> For HVM domains there are up to 5 socket connections per domain (2 by
>>>>> the xl daemon process, and 3 by qemu). So set the ulimit for
>>>>> xenstored
>>>>> to 5 * XENSTORED_MAX_DOMAINS + 100 (the "+ 100" is for some headroom,
>>>>> like logging, event channel device, etc.).
>>>> ...
>>>>> +## Type: integer
>>>>> +## Default: 32768
>>>>> +#
>>>>> +# Select maximum number of domains supported by xenstored.
>>>>> +# Only evaluated if XENSTORETYPE is "daemon".
>>>>> +#XENSTORED_MAX_N_DOMAINS=3D32768
>>>>
>>>> I approve of doing something about the fd limit.=C2=A0 I have some qua=
lms
>>>> about the documentation.
>>>>
>>>> The documentation doesn't say what happens if this limit is exceeded.
>>>> Also the default of 32758 suggests that we actually support that many
>>>> domains.=C2=A0 I don't think we do...
>>>>
>>>> I didn't find anything in SUPPORT.md about how many guests we support
>>>> but I wouldn't want this setting here to imply full support for 32768
>>>> domains.
>>>>
>>>> If you don't want to tackle this can of works, maybe add this:
>>>>
>>>> =C2=A0=C2=A0 # This just controls some resource limits for xenstored; =
if the
>>>> =C2=A0=C2=A0 # limit is exceeded, xenstored will stop being able to fu=
nction
>>>> =C2=A0=C2=A0 # properly for additional guests.=C2=A0 The default value=
 is so large
>>>> =C2=A0=C2=A0 # that it won't be exceeded in a supported configuration,=
 but
>>>> =C2=A0=C2=A0 # should not be taken to mean that the whole Xen system i=
s
>>>> =C2=A0=C2=A0 # guaranteed to work properly with that many guests.
>>>>
>>>> Julien, did you ask for this to be made configurable ?=C2=A0 Having wr=
itten
>>>> the text above, I wonder if it wouldn't just be better to
>>>> unconditionally set it to "unlimited" rather than offering footgun
>>>> dressed up like a tuneable...
>>>
>>> So in v1 (see [1]), Juergen wanted to raise the limit. I assumed
>>> this meant that the default limit (configured by the system may not
>>> be enough).
>>>
>>> I felt this was wrong to impose an higher limit on everyone when an
>>> admin may know the maximum number of domains.
>>>
>>> By "unlimited", do you mean the calling "ulimit" (or whatever is
>>> used for configuring FDs) with unlimited?
>>>
>>> If so, I would be OK with that. My main was was to move the raising
>>> the limit outside Xenstored because:
>>> =C2=A0=C2=A01) This is easier for an admin to tweak it (in particular t=
he OOM)
>>> =C2=A0=C2=A02) It feels wrong to me that the daemon chose the limits
>>> =C2=A0=C2=A03) An admin can enforce it
>>
>> Coming back to this series, I'm puzzled now.
>>
>> Julien, you didn't want me to raise the limit to a specific number
>> covering the maximum possible number of domains, because you thought
>> this might result in xenstored hogging huge numbers of file descriptors
>> in case of a bug. Why is unlimited better then? This will make the
>> possible number even larger.
>
> I don't think I suggested the unlimited number is better... My main
> objection in your original approach is you set an arbitrary limit you
> in Xenstored (which may not apply at all) and don't offer a way to the
> admin to tweak it.
>
> If the limit is set outside of Xenstored, then it becomes much easier
> for someone to just tweak the init script. I don't have a strong
> opinion on whether the default limit should be "unlimited" or a fixed
> number.

xenstored is TCB.=C2=A0 It needs a large number of FDs, and can be trusted
with unlimited.

Also, like xenconsoled, we can calculate an upper bound, which is
derived from the ABI limit of 32k domids.

All you're haggling over is the error semantics in the case of:
1) the upper bound calculation is wrong, or
2) there is an fd leak

Personally, I think a fixed calculation is right, so fd leaks can be
spotted more obviously.

An admin knob is not helpful - higher than the upper bound is just
wasteful, while lower will cause malfunctions.

~Andrew


