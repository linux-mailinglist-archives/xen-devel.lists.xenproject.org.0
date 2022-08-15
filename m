Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407D592B25
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 11:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387200.623341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNWBc-0004mp-7w; Mon, 15 Aug 2022 09:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387200.623341; Mon, 15 Aug 2022 09:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNWBc-0004k5-50; Mon, 15 Aug 2022 09:15:04 +0000
Received: by outflank-mailman (input) for mailman id 387200;
 Mon, 15 Aug 2022 09:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNWBa-0004jz-FE
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 09:15:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd50fc35-1c7a-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 11:15:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5530.eurprd04.prod.outlook.com (2603:10a6:10:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 09:14:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 09:14:58 +0000
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
X-Inumbo-ID: bd50fc35-1c7a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJnSiEDy1hLLPlmJhi8txbl0b3C5RKJJ8i30Q8c7WSAFDk4J6KXQwZjTo/NCesvg0ykSoKBIQmq3fDbA47Lxu1azKx1Afi4l55BJo18VFRqVcoFwebPPPklF4rjQqi3+1EsqS/3O5zG9oZkEehres9RyBZbgJO9C9SxeYRh8Qzc/Yz6KUMTW3TByeIj3wY3gUE9HY1KYLiw+60Pkg2H99EoqgyJKRM+kLxLIDKeYeNh7Ix3dVcDm5oXPTAXF+drgEHpmc7cDj6cahpKSAQiMFah0hPaNfhBHh00Lk0XudxSs/arKwU1ttNRVxb/92h9HbtsCQpLUq201jnIoVN7miA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzC0JAwU597SlzbW8kNe98VRsqaeSs3CJOR0vLMwlGc=;
 b=AUb5brgUqiygXT76f0ZaWrhBlOD7Yvprd7HoEJHR7Hi3NHLvM0l6qjHDVS7EgQq1u9FeTVOnvM/OsEVwlbpkevIiiox6g8++uY2lbrhgvEHBCAhQkmiruBdd1gLThE025ZNkl1HJl8MlYBfoM578emvD7+UMxENyd/u0K2Dg2rUa5qZV2posZvACfIK0xN4dNIRZBReHGGHQDfqhv6gu5xGF1uYznAxxpxn/dwwGk8xDG+MhciPw3gR+HCtXXocM9NZJydAGjL/DwWn1Z3u0zewLeGgQDr+kkSSnZ5q4dQDkPwZ0ysvzz8/TJTvGdylcbdOQqwZf9nndEt0Hl8TCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzC0JAwU597SlzbW8kNe98VRsqaeSs3CJOR0vLMwlGc=;
 b=tquDA6EfWyXgYxY2nK9tK59w5fltPnYBeTbWKV3m7f3nY/yEbxYRHI1E3yOteHFp1JeZ5lw97x9dX+iNJvcOZXcnM3vuC4qBGMFhEo7HokuvUctaKFOVq/8EjZ5PIP+fP1CuvV8GMR6qOcI9Pl8PdHcegE9WBJ33u1NdHn+YvWHuZM3suRfA71/KyJSgCYNP8dXvOPjhSlVxKbQ0XHQIaNiXoMrJ8GFmMc+OB6D2QXRrZSSacU/hYYyl2OPq0out87ATms6EIK4DuWC73EA4o4UQU0MdlhPARJVJdiyhbmqipXxzutxxdiReG2YUqPm8eLdUcEtgW/0kP2GKnSJeWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a975638-9675-9a95-fead-91120edefee1@suse.com>
Date: Mon, 15 Aug 2022 11:14:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
 <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d244d68-5e5a-40fa-908c-08da7e9ea002
X-MS-TrafficTypeDiagnostic: DB7PR04MB5530:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	klXbjnD/8THL+a8nkg4S7ngcsz8+9ylzaJ6bpFmPKmq3e/np90cRA2DubXOv1/1gvG5tdoHtc47jaJL2gFuS4565u8jBbXOdFI9Hu8LyM/S0wiltOZH5oYCy4nzpaMWui5oBtM62pVkPR9BOPZXYRq7tIFgLCYHwSDIShquwly56ppQsRNi+J2Y8CNHBRZU+lg1M2aMDqmQIawSpIgG9o2APbUdn2fgUS/3pIeq971qx3e7z8MlAdNsWI/TwxkJSgIw4RdPXQgJBdGA52//ZgS1RkJ09T9GrsuEr6J1nQCcfbirK6KVGJaiZRRXLolsk6AQ8bhlGZG9JU7vZ7CsuXvVhxOpV/Vi7AfO7qduUowAGm1MgXGQQSyVvEFMmh93FudOAlxAzkTlQ7YSlPheJCVBjyBTY9r+YIbZFvwzEY7Kd9VyM546znGVb+soz+lotAorO21495sPXJChw0GVuKlS7BXv+IYl4jr38JdymS9wWyOh9CvUWSqVIKTj6n9P2/6hDcJYd5uwUtQ4Qw7LVE58G6xDRcqln6075jiR8Wc8CxYZOCgvrCdN3od3hLPxZnCeatG3O1+NUUDCL+Ylw5febjBeVgn5jl0OtJNDXo5jX2uv/9S0FgrWw8SkdfJVr7xAdPdksWiczNhiKw1lmLIdwvGomCcsERFXVww44ox4bn1m1xMJUdlSekpVz+5Ykl3xTIrzzJKxpcFoF+a2hGJiaK0nlpG4rwfi/g6CrO5nV/1Rv8X2+h2GoKCNsrjm0xOlXcmVCcxzKUInAOUv4NuiTgJQ2JaAAu/B4GP3LERsN21fZoZ7YU18NjHnliY0QR8ElbFHSw0aCM04oeQ/lNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(136003)(366004)(39850400004)(31686004)(5660300002)(6512007)(83380400001)(2616005)(186003)(54906003)(316002)(6916009)(66946007)(38100700002)(478600001)(36756003)(6486002)(4326008)(8676002)(66476007)(66556008)(8936002)(2906002)(41300700001)(26005)(86362001)(31696002)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmI0TmYyYzJCVUdwenRRUWMvYmJhankxaWJaSE01cGc2ald5QXlVeFg1bTFY?=
 =?utf-8?B?Y1Bxa01TbnFQZ1NqZ0pMN1pNWlBOUVF2OVFLVnBsUlNxZE00c0RidDRFVzIy?=
 =?utf-8?B?OVdVa2lCSEZFMUFCcWN3UzNDZGZaYXIxbXFNVlh3N3RTWnBYSjVqYldZaEhZ?=
 =?utf-8?B?eGhncURudENQNFk3S2lTT2hQZXd2OWpweUdGN2M2MUFWUlFvUG04dGJyT3d3?=
 =?utf-8?B?UTFCZ3hoYVdDUkN0S0RKNk93bHlGVVNWZDc5WUZaQVZGMnlGbUlhcFdyVStv?=
 =?utf-8?B?UFllSmszZndVcU04U0tERXFyV2pXcEl3Vy93S0JFUVZSV2x2c29waTVUWG5Z?=
 =?utf-8?B?NmRSalN3S1F0b0JabnBQRWJqMlRyK1VVeWM5NDc3TlRvWTdDMnRIa0RpaE5X?=
 =?utf-8?B?WWg5b3BqK2pmRzJzQnpUcUNoYWJWREVjR21KYzBpc2ZwYjJTdmphSjNRMjZ0?=
 =?utf-8?B?dlVOcHBTdkhrYWtnVEVWeG1xcSt3VGJDSm9FeDlROFViRnBTUVpPR0pPNUxY?=
 =?utf-8?B?eno1V0M1YXNESFpEbkZvdW5UY2luUU9rM3J0NVA2cldqdFZXdHdHM0JHd214?=
 =?utf-8?B?cGhhVVF4ZmZIa3BWaW5aZHN0Z3FVbXFZc0p6anJuVzBJUlI4enh1VTZ2TTlI?=
 =?utf-8?B?V0QrZ0RkNFdoWUhvcSt2N2YwYnRCa2FONy9EclQ0bjI4aWZFK2FhcENnN2ts?=
 =?utf-8?B?cWRlYUxPZWNTQmJ6Q2hFM1dDTFpZZHk3ejZXcGt3QzU3SlBHYXFIc2ZjR3B0?=
 =?utf-8?B?aW9TNCtDVUQrQnYrYjBVU3NZYllEUjNKRVJWbmsvV0w4bVhkQ1hMc2J6aU9i?=
 =?utf-8?B?K3JISzl1d01zc2RGVllXNzdqTmdKb1Y2dGhVbGJmV3ZSYzluaWk1NFBRYXpx?=
 =?utf-8?B?VlMvZ2JWblgwMGJIN1lYZnBOZHBxbVV0Tkl5aFd2c3pSdGZnT2pTL0RlbCt2?=
 =?utf-8?B?TkIzWjAxUUtkYi9vb1cweFFPVlpxQjQ2dkE0a0dSNm9GWktnRUgxT09iWVhI?=
 =?utf-8?B?Q2hnT2MrcmtTTUlVOUQwOXNSeS9lOGp6WUROVkZkVUtZZDBIdHRIdlBqVEN0?=
 =?utf-8?B?amJ2Vk9HZ01yK1I4RkZJaGlsRWpGbGV0TjJwS010TXhWcm84VjZJTkIvY3d0?=
 =?utf-8?B?bGJzWVZtSGNlR0hJcjMwekw0NnVvWiswbTNCbzNtOEhvR2tqbzVHVXB3ZUty?=
 =?utf-8?B?YmFJZTdESTJkVDlRU3lyWjJlc1ozak8xZHJTSlFUQlM3OHZxWEJSOTlwMXVy?=
 =?utf-8?B?dHFIUmgxSUNMRFRSSEg1SVdlSWxMU1dZR3dIb2lYaWI5T3M0Q2JDOG11UEtw?=
 =?utf-8?B?U01xaHNXd1kybzhOTTlLbVdVUllrQVo3U1ZYSXZST3FmWEdqdnhwZU1TaTgw?=
 =?utf-8?B?WS9YenNMWFhIdWZ4dG1Ea3ZObXZzR0s2dDFxM3dxTkNnbGVEckk0bDgxcERa?=
 =?utf-8?B?SzhMUnZXV25WT3Y0eENFeU5Rbm1WR0hObDN4Wml2bWtjbk94SXZpQWRkQmZm?=
 =?utf-8?B?UmZ2K1IxQWVoYzFUTzhMaVlaYTl6d2t1b2djZW9vNGQ1WFBBM2hYaUl1ZGRK?=
 =?utf-8?B?aEpVQWxsR3N6WWRRRzZVc0ZQc3JVWFh6MEUyVEFsM002YWdqUVR4dFMyVEJn?=
 =?utf-8?B?Qk05WEEwNzJvdk9tM2ZOSGxpRnBQK1JBbnh2T0tNUXZ1Q25PdS8rQWEyeVZp?=
 =?utf-8?B?WkE5WkZ1ckZ3VTloZTJLNUVQd3hvYUZvb0ExRFAvMWZ1dHJsNUFjQm1tbklB?=
 =?utf-8?B?ZmJxZGlkNTB3L3dBWGEyeTkrTW9wNXFhNlNkeFc1cmhvZ0w2UVFvbGtxQ2JX?=
 =?utf-8?B?ZTdoTWxmNjg3bzF4L21KdDRObXRhU0dmN3M4TExwWEFmRDBtQkpNTm5xamxY?=
 =?utf-8?B?QVp3SGE1ZlBFSFY1ck1EL2lBRFJJUUdIUWE3d3R0elJnZWtHVDBNNXh4TFZF?=
 =?utf-8?B?a2dLd1dJVThjdjcvek56MVZNYVVBN2RWdzU0b2lFSTdGbTEyTzJwelZaVTlr?=
 =?utf-8?B?NXRUK056WWx6NCtkdHlFSmVTRTRMRUxOYnoyekVBZS9kMko5SGFXWlVrUWdI?=
 =?utf-8?B?TzBWOEtSQi80Y2VMdGMvdDJ6REF0b3M0Qzdwck1KOGN3T21JUjhYZEExTGQ1?=
 =?utf-8?Q?Ohcpd/oIudKKTg6Eeeih5z1tR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d244d68-5e5a-40fa-908c-08da7e9ea002
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:14:58.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsCKge6p0PHzDPEMJ3UFBKYBTqK7fNNsuiqZt5ZgkVRDBnXAea3QNDpxV3g+ZL2pM5zUiPm3uX3OXXA1WHHxXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5530

On 15.08.2022 10:15, Andrew Cooper wrote:
> On 15/08/2022 09:01, Jan Beulich wrote:
>> On 17.05.2022 17:31, Roger Pau Monne wrote:
>>> Roger Pau Monne (3):
>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
>>>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
>> I came to realize that I had announced that I would commit this about a
>> month ago. I've done so now, but there was quite a bit of re-basing
>> necessary, to a fair degree because of this delay that I did introduce
>> by oversight. I hope I didn't screw up anywhere.
> 
> Revert them, or I will.

There is no basis for reverting, at this point at least. May I remind
you of the fact that Xen is a community project? I know you've done
reverts in the past without even waiting for a discussion to settle,
but this wasn't okay back then and is not going to be okay this time
round, nor going forward. If you see issues with a series, and in
particular one which is otherwise fully qualified for committing,
you ought to voice these concerns. You cannot expect people to guess
that you're still not happy with the adjustments which were made in
an attempt to address earlier voiced concerns.

> There has not been adequate review or testing.

No adequate review? Am I a 2nd class citizen all of the sudden? In my
reviews I've tried hard to account for the few comments you gave (or
should I say that Roger was able to shake out of you)? Plus I've said
more than once that I would prefer to not commit this without you
having given it a (perhaps just informal) look over. Yet no feedback
ever surfaced. I don't recall you going ...

> Patch 2 in particular is firmly nacked, because the only thing I have
> ever suggested in that area is deleting the patch.

... this far (and in particular not for the later versions of the
series), but I do recall Roger re-working the patch to (try to)
address your concerns. Going from just my mailbox (which goes back
only to v3) I see no replies from you _at all_ on this patch. There
was a longish reply to 0/3, but nothing on v4 or newer, despite
pings which were sent your way.

Knowing this has happened in the past - is your reaction based on v6
or rather on the last version you've actually looked at (presumably
v3)?

Jan

