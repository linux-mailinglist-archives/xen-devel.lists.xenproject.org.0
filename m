Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFE874174
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 21:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689502.1074545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhy13-0004aA-SL; Wed, 06 Mar 2024 20:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689502.1074545; Wed, 06 Mar 2024 20:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhy13-0004Ye-PS; Wed, 06 Mar 2024 20:37:29 +0000
Received: by outflank-mailman (input) for mailman id 689502;
 Wed, 06 Mar 2024 20:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYTB=KM=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rhy12-0004YY-Ct
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 20:37:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57146142-dbf9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 21:37:26 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 20:37:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 20:37:21 +0000
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
X-Inumbo-ID: 57146142-dbf9-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JldIa/XzVoPqhGq1WrB/tnPheYs082TKLi4yl6LbLqf8cTYL/H2GtCBMhvWVzpbRuzDO22poFpPZ4WosvpFj+TSKhX9he3IMNew3UuhT66yseEq76LZt7Dp1Mc53LVmGMlXZAiAoGtH9gnaBB7brUvIbXx0B/eXhj+KLViCDFBA8kGnNN2ubjEiaEgnIdBXXVXe4xb4QNRk+Hb5LJWHULE/TdWJawebpyCga0EKde1zWA/QP709cntvqnOwI+LiI5gSX/RdmPjZ20ax3MAD7c7hQR/osnqdoh3t5aYhDSvnQo89xBX44qQdwIcx7NPMl6zZGYmOJhVQJAeSDePI1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWGdSP4rjHWo36FDooJJkETdC+jecOAAOvhQ960wGgk=;
 b=VxHD+duBm28GSe/DUyge6BQhbDny7FX0v8eHXz2RjweyTCDl3wtqdm48/WFnwkXo/quGuYd2BtLrmq9DUMqBiFfoovdqRAsJgejTjuYfhXAXTKdPw0EcZXS1cf8zSr7SzdocBDunORkEX4uVb/RVRKO9GbWmi4wK6ouoQZLEdp9IWkgSyD3Rw5XOnMeyjLLJlskbDSN9oPn/ZrZl5oCYNRG2x5H7SPLFYiN4YQmXXoVy2TgEDQOQxV/t+sKw6w8ApMq+k73N8IbUXU8QEHV/C2jzKVwbq5YPfJVOtKV582WR1RSFIvo8+H7ObxYzPzuiGnJ987Lvjollu0zPNFJ9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWGdSP4rjHWo36FDooJJkETdC+jecOAAOvhQ960wGgk=;
 b=pfdL701ta8UBcG5Y6CS2nF15vsjwWqsKA3guhKTxCx5vb7KtlJPrvNOn2iz5hq/iiwByHTp0t6S3cJrw5F3YY2yiTqGljJKoGcYcw/37PLCskxcqcFGFr+X4fjtDiEj7HC9GronC78BfJnk7MH489nhRHamYfar/xdEZCLnLRNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2a609713-3eec-438e-80af-c1dfcfe598c4@amd.com>
Date: Wed, 6 Mar 2024 14:37:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
 <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
 <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
 <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
 <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
 <7c2f9983-a0b5-41f7-81cb-f196787f3dfb@amd.com>
 <CAKm-UmaHA5Xgmneqv9zgEUN1eejqB_1aZ4Kd5MxWttoyVLThwA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAKm-UmaHA5Xgmneqv9zgEUN1eejqB_1aZ4Kd5MxWttoyVLThwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:5:333::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fe51ad-db51-4805-43bd-08dc3e1d3958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ya9bAHIVmb0HOVMmeAaEyBnVf/EWgwP3D0t0PnFqN42hf8vyDRPQjvcnraloWOC4KO8aY95A9G505qN3dDA+c0eB+MTMuYrqMawyuv5py8oKqnpY+KngvzlGGcbqAdDi0gWsPX8nc7dJzkdNlwBh6heHndo7PMNQ0MQz4MRyz14TerVdTnmwEdmNLuEzjkyykXynBNxVoW+6AEwfGkHJX51/AFGFbZDUs5lX9GL+GTKhtic5nqR6U19rC2Iq6rCoHJgaPudCRXC8Ag6KW9k2XYeid6Zcqe49RzE7/0j5KMOarnzTuH8Dt1eZJIGRai8/N/LRmNuIPI5k9JKoAIeDUWnOceTKUZ6jeGuNROFNhwe/DfbljktzmMwa1HLxQSM25BdsyOfTJotVKqIREQUBthn7CWyiulw77Xbild1wBqlGgOYNhoPJwe5FXrJQsyx9t3Jm7zENzy5r22LDcnWx610FQ3Y6H3SvhLsr/UH16iR/iZHDXxmv0El7WjIE1kWkabtGL0hB3kAWofyk0aYG97j9FidUR6+z87uPoN4aCTeCpqXTns/3XL0njbykSzHMzJqxWnHH5BBmOcxTvzi6JWKciLJrvAKgesjOFoIZ9fk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU52dWRXNDd3OWJscUhLeWt3SmZGM1FsTm1nMkNHcVJmdjcybitibzV2SHps?=
 =?utf-8?B?bURpVzhJWmc0VEFZYjRPMkRvdDZSd3pzVFFFVEd6RzBGTzhKc2gxSlpTTGRk?=
 =?utf-8?B?UmtuWGk4cFJtTzhpcStYR2tDV2t3SWQrYlRpbEhoUlNyem9UU1JNUjVrZWxQ?=
 =?utf-8?B?bHVCeXlVWnJZeGR3K1ZndUdadmF0b1FnNWg2c0VRVU9BNzNUa09ySjQ2NWZz?=
 =?utf-8?B?S05HM1B4YzNJd2NzWUxpQ1VlZ3I3cjNzcWNpWXdQSnB6OGxWVFYwYlNpb1VG?=
 =?utf-8?B?VThaYkJmTXhtQSs0dzZFQzlkZEdjMHdsUUhNdHAvR1dnbWQ2Y2VwenBXRlI5?=
 =?utf-8?B?aWpQWENmVzJhQ2pPak5CMGVzbjFWb0tmeDRzUzN6Ny9SQnF0T1FyQnpqT3Rz?=
 =?utf-8?B?dytDR2hZRHJMcFJ1clF1aDlkRmF3dmp3TlhTMHF6ODdaSTRWMVcyMXQ2T2FR?=
 =?utf-8?B?YitWRFo5T2c0MUtpUDVMbkQvV0V2NjFDdjd0YzdIeXlSV1g5b3ZrU3BVOUdy?=
 =?utf-8?B?ZVRrQmtIZ0pBZmd1USs1YXpjQUUyYXhrN203ZWVZaDJ2ZytCckdxaHpxSGdV?=
 =?utf-8?B?NllQZmZNdGlkSjVCSUdaQVpxTFJaT3lVWEZTR3NuR0dyZmJKN05kZmp4N1hX?=
 =?utf-8?B?NmI3MGZpMkZQL3FNOU9HSHlMRWxXYWNnbTFCSitIVFcxTFppR3c0TERyMTZz?=
 =?utf-8?B?TllSYlF0TStFcWxyckg2VFo2bDFKVU9GNExOOUlqMHN5c1RRRWdFY1hmcnRv?=
 =?utf-8?B?RkFYcnQ0ZUU4QiszT0xsMkJmL3dWdjFhSk13Y0duRWJWSVh5NWNiQm9wMkxH?=
 =?utf-8?B?dWZadzEzaGREUWhqKzdPN0lsUWpTdGZONzBNVGpmT0txcE9iVlo3dHJRVkhX?=
 =?utf-8?B?eE9kbFNYeDI3cDdFeEpYTENrd1NBUVdjQzNPZ3J1Wi9xWWNUY0ZCWEcwOHhm?=
 =?utf-8?B?Y1FHMlhoWDF1R3dRQVdsNzVzdW5PeERoVjlhZytCamdxMi9WWEw1ZEtkSXhk?=
 =?utf-8?B?cDVVaFhocThMUWtId21JZUhhUkJ6c0p1OEZ6MVRPTnRCc3A3SndIWjZrSFVa?=
 =?utf-8?B?QTIrSmFoS254ZTU3QkE2NVA2eFBtMFJaUHVMVFpRUGw3S1Fla3NLdmp1c0Rm?=
 =?utf-8?B?MEZqaFVJcU9BTHNiUlZtRmdOYmVaYkp2UmNTWjB6enRZZVEzcU5UMGY0WjRO?=
 =?utf-8?B?Q0lLOGpEVUpaUHMwVVpLTWNyUzRudVdwa3hzVEU0WTlJcW9tYWxaMmZiN2RZ?=
 =?utf-8?B?NXlZS0o1WWE0Z2RuVXM4cE9neGN6OEs3MEFtTlJZMEdxbnZTcDNrOGt6Rmpw?=
 =?utf-8?B?clFZRDhqRlBaYVFkdG1rRURUK3pBSGVpL21IaXNDRWwwOHN2aHFLLy9PQjZP?=
 =?utf-8?B?dWtJb0VBRUszU2ZrOUx3dnRVWWFyenY4UlVFWm92Vmk2bUJWbTFHMW80Qzg1?=
 =?utf-8?B?NkZvaU5CYW8wQXBUc0Y1ZkR5a3dwQmRZTjJJcFM1VW96YVFBOU0xWm5HdURS?=
 =?utf-8?B?WHJVb2JVZlJnTTlIekJqVzRSMUVTcStqdGRJYmI5Q0JvM3VaUkFTd3U3S3N1?=
 =?utf-8?B?MXIzNWVNOTNsdy96enBTUTF0WTBQaUZBZ3lxV2czenIza0dicE1vbkZiTElB?=
 =?utf-8?B?Ukk0RmtxQzlzbG0xaUYzVEtZQ1JNbEN6TXd6UUd6bjFqbVhqQVoydWE1MG9U?=
 =?utf-8?B?dkEyNXhWK3M3K2M1MDhQSnVJcUlXY2dPK0FNS0QxaWdJSUVVc1Q1bmM0anRp?=
 =?utf-8?B?L0VxRGVGYkdLLzJKNTFNays5QWRkR0JJZGhsaE45cEFsU2dqYkRaUHRnUGxt?=
 =?utf-8?B?WGJnTEpkMkNSejB6OUFrMTFFVy9ZUkxjM1dRZEo4WDAxVzFwdVNqR2hueVBr?=
 =?utf-8?B?SGY3T0trVk1rcExQT0owbTd1S2xkQklEa2I3MlJNdWxadytsWTZBZG9RWXlq?=
 =?utf-8?B?L3RmaU00QkNnYzF1OVd6L0RVOHN0SEZjK2JsSTVveVlSWnRLamp4cWNFQVhm?=
 =?utf-8?B?eE5XYi93eDB2WHhKVW95VGw2ckJWOXpIR2VOTmtDZzJhRTA1dEpIb0ZCTFBN?=
 =?utf-8?B?OGtBSkZ0ZDMvcEduTmY4eXVTWnJmem1KL1UvVk9HZi8yd0lUWDhEVWN3NVVw?=
 =?utf-8?Q?N5LiAo/YyBDcDt5qvyIZm6rug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fe51ad-db51-4805-43bd-08dc3e1d3958
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 20:37:21.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwICybCBgzjZzPZQM2Vb6XPGh7t3o07WCQA+nqkCZWu3cCBAheJY+Aq/Y4DS56CQHDhyrOHtyNHPkPx0eWHkcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483

On 3/6/2024 14:34, Sébastien Chaumat wrote:
> 
> 
> Le mer. 6 mars 2024 à 19:51, Mario Limonciello 
> <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a écrit :
> 
>     On 3/6/2024 12:49, Sébastien Chaumat wrote:
>      >
>      >
>      > Le mer. 6 mars 2024 à 19:08, Mario Limonciello
>      > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>
>     <mailto:mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com>>> a écrit :
>      >
>      >     On 3/6/2024 12:05, Sébastien Chaumat wrote:
>      >      >
>      >      >
>      >      > Le mer. 6 mars 2024 à 18:33, Mario Limonciello
>      >      > <mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com> <mailto:mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com>>
>      >     <mailto:mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com>
>      >     <mailto:mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com>>>> a écrit :
>      >      >
>      >      >     On 3/6/2024 11:28, Sébastien Chaumat wrote:
>      >      >      >
>      >      >      >
>      >      >      >
>      >      >      >
>      >      >      >     Reasoning backward  (using a  kernel without the
>      >     pinctrl_amd
>      >      >     driver
>      >      >      >     to ensure xen only is at stake) :
>      >      >      >       checking the diff in IOAPIC  between bare
>     metal and xen
>      >      >     (IRQ7 is
>      >      >      >     on pin07 on APIC )
>      >      >      >
>      >      >      >     using kernel argument : apic=debug
>      >      >      >
>      >      >      >     bare metal :
>      >      >      >     [    0.715330] fedora kernel: ... APIC VERSION:
>     81050010
>      >      >      >     ...
>      >      >      >     [    0.715433] fedora kernel:  pin07, disabled,
>     edge ,
>      >     high,
>      >      >     V(00),
>      >      >      >     IRR(0), S(0), physical, D(0000), M(0)
>      >      >      >
>      >      >      >     xen :
>      >      >      >     [    2.249582] fedora kernel: ... APIC VERSION:
>     00000014
>      >      >      >     ...
>      >      >      >     [    2.249730] fedora kernel:  pin07, disabled,
>     level,
>      >     low ,
>      >      >     V(60),
>      >      >      >     IRR(0), S(0), physical, D(0000), M(0)
>      >      >      >
>      >      >      >     So the APIC table is not the same.
>      >      >      >
>      >      >      >     As strange as it looks the  (IOAPIC 0) pin07 is
>     correctly
>      >      >     described
>      >      >      >     by the APIC in xen but yet differently than in
>     baremetal.
>      >      >      >     But the APIC message comes long after the
>      >      >      >     [    1.833145] fedora kernel: xen: registering
>     gsi 7
>      >     triggering 0
>      >      >      >     polarity 1
>      >      >      >
>      >      >      >     so I wonder if the APIC pin07 info had any
>     influence.
>      >      >      >
>      >      >      > Finally found the fix : adding ioapic_ack=new to
>     xen boot
>      >     parameters.
>      >      >      > Not only the trackpad is now working but also the ACPI
>      >     Embedded
>      >      >      > Controller which is completely disabled.
>      >      >      >
>      >      >      > Sébastien
>      >      >      >
>      >      >     That's great news!  I'm personally totally unfamiliar with
>      >      >     ioapic_ack=new, so I did a quick search and found out
>     it's a Xen
>      >      >     parameter (I came across
>      >      >
>      >
>     https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html
>     <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>
>      >   
>       <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>>
>      >      >
>      >     
>       <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html> <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>>>).
>      >      >
>      >      >     This mentions that "new" should be the default, so why
>     isn't
>      >     it the
>      >      >     case?
>      >      >
>      >      >
>      >      >   "This is the the default unless directed-EOI is supported"
>      >      > xl dmesg without forcing the parameters shows :
>      >      >
>      >      > (XEN) Enabled directed EOI with ioapic_ack_old on!
>      >
>      >     Got it; it sounds to me like a logic mismatch in Xen then.
>      >
>      >      >
>      >      >     Also; I'd be really interested to hear what happens with
>      >     s2idle with
>      >      >     Xen
>      >      >     now (if it works).
>      >      >
>      >      >
>      >      > suspend to RAM now works :)
>      >
>      >     Do you see /sys/power/suspend_stats/last_hw_sleep increasing
>     with your
>      >     suspend cycle?
>      >
>      >
>      > No,  it does not increase (0).
>      >
> 
>     OK, then in that case I suggest you run
>     https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py <https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py>
>     in the hypervisor to find out what's wrong.
> 
> 
> It fails with xen (not bare metal) during the prerequisite tests :
> 

The script might need some modifications for tests that don't make sense 
in the context of Xen.

> ✅ GPIO driver `pinctrl_amd` available
> Traceback (most recent call last):
>    File "/home/sch/Downloads/amd_s2idle.py", line 2447, in <module>
>      test = app.prerequisites()
>             ^^^^^^^^^^^^^^^^^^^
>    File "/home/sch/Downloads/amd_s2idle.py", line 1938, in prerequisites
>      if not check():
>             ^^^^^^^
>    File "/home/sch/Downloads/amd_s2idle.py", line 826, in check_msr
>      val = read_msr(reg, 0)
>            ^^^^^^^^^^^^^^^^
>    File "/home/sch/Downloads/amd_s2idle.py", line 813, in read_msr
>      val = struct.unpack("Q", os.read(f, 8))[0]
>                               ^^^^^^^^^^^^^
> OSError: [Errno 5] Input/output error
> 
> Last line in the log is :
> 2024-03-06 21:29:33,146 DEBUG: Lockdown: [none] integrity confidentiality
> 

Do you have userspace MSR support compiled in?  If not; that could 
explain that problem.  But it's very unlikely you changed the MSRs.
For the purpose of finding where the suspend problem is, I'd comment out 
that specific check for now.

