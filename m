Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876E56826A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362007.591844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90yL-0004lg-9p; Wed, 06 Jul 2022 09:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362007.591844; Wed, 06 Jul 2022 09:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90yL-0004jY-5v; Wed, 06 Jul 2022 09:05:25 +0000
Received: by outflank-mailman (input) for mailman id 362007;
 Wed, 06 Jul 2022 09:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o90yJ-0004jQ-Ov
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:05:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60089.outbound.protection.outlook.com [40.107.6.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4412b49-fd0a-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 11:05:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3474.eurprd04.prod.outlook.com (2603:10a6:208:1e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 09:05:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 09:05:21 +0000
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
X-Inumbo-ID: c4412b49-fd0a-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zgtc8Ih+QUBPPx1t0X1O+JZTQXr4PfsoyLPelVDD32wPoQVxTS/8DT6fkGBl3XycvnQVG0AIJNPLtrN2Djin+xEPl5udpRtkSbVIpvud2F4Q/A3SKoAcdaujlCpBXlepXXdZw+Tz285jk3J2HQrX6fGcil5pN5CCDnGe9S+NqjJNqxa7ddwCFQwfwvbIx/cu3Sw1g1RhzLHnl1jASPln0pJ6nwHdEdlnO1wRNdBxo0Ql8aEbh53JUme8FvWjqyxsbm+2i+N0doacgqmY+DLRMqjtDFjA1G4Z48cfrSqpVcYJcA3uWRYZ4t5qHflotdd84VmGoHwGhUk23vqh5k2UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTh3XsPykSP6dLgfEdVlwHZEw7elspkfNXKu1gQ6NcE=;
 b=NjJ5rpOk187tGyg0L+eeR8gZu7s1wQfs1rPkGISU7Wn4ML2Z+/1DNZ0KgQNK1ad1ifaiNR+gduNha4rntjidORRqUzIELrbot662kBeWC24chhaoT9ZXGHDb4jMK38y3EAaTgNaUFJ4fyM9ufagERzCWmLUirCfr6kLM/htJ0YgmmSeoQxULQKoaEuqzfnNbFcIpd9JfpX3Psb4eTtXPT5rem6M94t5FdpA2wiWj/T9GeuNKggpRHPkXBd0wz/mgctQLpl3L9gNrIc5eGDDozsOaAdAyfJwud+BCHmZPkKkX0/BJalyxuO5tpFgiwBBqMt0W1xjAKUszyOfkHQxaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTh3XsPykSP6dLgfEdVlwHZEw7elspkfNXKu1gQ6NcE=;
 b=5itm6F0AI89JwtHn/3OhGqF3q+u/uvn7mtP7B4A8lxNjP8ed8GGNkvYW2pSeZ2UQZX3abMomsHKF54WNmgV09VCSgM3YrqHMgyhP+oQArdPUk6LQn9h9aHlpflyH9jSAFXpCqSvHP+CLW9oPnjZZ8jce9JYPuP+fOB1wiD7+6VMc0Hsq6FnSuu954799PhARXZ4YTYV75FFI5GQI5OMX0NQbvR1k+AfdHzlv2k+u1J/OCwCnPpvrXRw0r6ZZXFOS6G4/CCQWRahyFaI9oOZCu62lhBrZ7C4h+N6q6O633RfxIAmBxMs1bFaZu+BHNHjfEHnYfsCIRXp7AqI50z40XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd5b8de5-2478-defd-5133-5560a56a6023@suse.com>
Date: Wed, 6 Jul 2022 11:05:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <AS8PR08MB7991F4C747E3520491B9E1A292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991F4C747E3520491B9E1A292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9e68a74-7c5a-4eaf-aee9-08da5f2ea7ba
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A3bW0pJPr86vTkVrk/W0UAkBG04oWVM6f+VpIo4p44GCDRG5hBSh51TcStWmiR9BcMGGmI9Ie58ZEJ/nSTXWMX5nYKlHvP4KDMcjUByb5vFxVaSpOoIiwbr2FbQH0Q1immaTR5ilVY2nwl04xyevSh6l7DC4XHW8AWAtvKBj6xQPmo2nLV7JGYVGWjFGOBOd5BinpDKMonnWssBcseiS25bpG/m2aSTc7MqjaHULrgxblYEoKuga8LP3o6K20TWJkmt6euNud1Y+Eyf075mZdEY3tGVLQmhtbIz4UzHnvh5UvQ70/mrdPCft/A6ZzM1Dbo0TqFnbmKqvUhTFRu8ick6al+CWSARlzPPu2noI4XDIAl6Znfg8fwoLM83o4jSVgPU5K5MWifY07JAkJOLoEOG1hm6eCMaqUvn0KRe7FOVZ89gukgvYdEEgTGD2VQp83GeOuoAhHkuG9qyv5bSG0Sx/HSq3jHmnorgMITR+AQPASHW7i/8Zftn6+ktsvwXoXF8aAFJH0B5WdpsqQUYMUL4z/FnOg5JEggm5k+bpBT1m7hVsp01xDSadyfhpALKLfjzhuv9/MPSZko3S/+bG3D2j2JXHNYJv5Wo52s8p7dSxuRb0HVsu7Id//RJgz4e1PopnxRGcPSuemY7aDoEZ/oboLSRdxDAcX2Tu6Kc0Gon5caFiWnTMwtVCBgJbaNIxBPxZmZp4NU/TAQwd5THm98QNm5WqRPSJgasUdIlojosmlox50V7ayYSFSP4wQdaFOWgaawn6wv+jBAnmMrFt404eD6HMbZ98m1oYk3RGU6FDgoq3fwJIVbIfgU0sXzXfT2E88WpT36GUHdL+jsrvVhoRfJKnjq+21kmpZhcLFXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(26005)(6506007)(83380400001)(41300700001)(2906002)(54906003)(53546011)(316002)(36756003)(31686004)(38100700002)(6486002)(8936002)(31696002)(6862004)(5660300002)(86362001)(2616005)(66556008)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU1ibEFQRGcxWEErLzhHSFpyRGQ2MW1ha1hGelBlWk1TQVRTNWp4QnpFZVN3?=
 =?utf-8?B?VGtaZDZ0bVdWbDZRNkoxbnJjeUhsbS9xNGQ2UjBLQzNFbzdOV25zZGNialpm?=
 =?utf-8?B?SVJ2dS9wZEtRaHR4SWt5UEt3d0JjUFdUdXlsMTRKeEVMcnQrMXhIZW80ZC9X?=
 =?utf-8?B?SzJmekpQUWRVT24zVUFydjV0d2dZd0o3QnVuNURIZEIxUkowQWlGbVd3TXlw?=
 =?utf-8?B?bE1xS2x6Vm82M2pNdStOMDdIcHJLMDhLUzZFOEtEVnM4K3kvRzhHaEJ0NzNG?=
 =?utf-8?B?Y3h1ODltbEpyQmNpdTNtTzMycGRueWU1anZ6d1NJbk9nNGJPaCtjdHZNdjhs?=
 =?utf-8?B?QXQzTlhDbmQ0TTFzNGcwVVJHU0o5TUY5TlNzaDZ4M05YVGVTZm1CMWpyYWov?=
 =?utf-8?B?Q3NKeklYR1FObEZkdHVWaGpIQUZBZXM3aERJcFRnZ0RzMVRZNEN4Uk9tV09W?=
 =?utf-8?B?OE5kaDlaVmc5eVA1aktFZ2VxczhzVEdBbkIwMmVvdTNxelNrS2c4NkFOc2hD?=
 =?utf-8?B?dDgrZDhQL2N1bWN2WTlJcDJuYmpncG9aSnBVSmQ2SElQUnBOVWJNUXBJQjdQ?=
 =?utf-8?B?VE5QZzlVdC9NSUhuRW41dGt3bWdOYzhGODFuYTBxbkd2ZUo0TFFZdC96T1Bi?=
 =?utf-8?B?MHZUclh4NW54R3RrSUdQbWZuZXB3SFI0cW9ueG4xSy9hQTk1V0VEdDZvN0JG?=
 =?utf-8?B?SE1saURrY25lRHczWFNWdW9kZHNCWlg5WTJNMDF1OW91Rkt1QWpwV2RlYnVk?=
 =?utf-8?B?QUJwQ3UwRnFVNVptbEJRZXpxTHZGczN4cWlNVmhsbk83VGxyZURHZmNweURl?=
 =?utf-8?B?L1puVVZoeEpHWjVseDlKMVR2cE9PdmU2am1TZVpJRnlENlROdi9pWjBVYW9w?=
 =?utf-8?B?T1FQa1JNVHVWUmk3T0ZtQ0NreVB4YmJ3QkFQem9pL0dVNzVaQ24zaVhSOXdR?=
 =?utf-8?B?UFI4UTJEdkdEOUM3MXRWSytCMmVHZFdUZHR4NG5yU1Qwd1UvUnJLbjNLVHdT?=
 =?utf-8?B?Mm92SWl5WGdjc292ckVSdVNxNlFSM2dPcnk5cXA0V2lGR3BhdzgyYmNkSVBX?=
 =?utf-8?B?YTNBUS96eGo2WEV6eTg0NldVODYzaGVic3lXSkdQcU5YU1p0cXo4Y2tuRFp4?=
 =?utf-8?B?WHpOeStraG9GYTIyRVU4aHBYd1pESEJXZFlZbHlYdzNQaWdtWVhvQitkb0VU?=
 =?utf-8?B?dmhtU3pjQzEwU2dKa3hYS1lUQjhyNE1sa3Z5ZGtWTFI1aVFqTmlLUjVYeVFQ?=
 =?utf-8?B?OVdQTUtiT0FxYnhKSm5LWmF5QTViTU1MeDRmV1pBM3BKVm1PczhRYkdidkRP?=
 =?utf-8?B?YmMzL1VUbzRpZTQ2d2xNM1dwYXpUYTZnNmw5T1Q2QXVXbks3aXVkZEhmNXZG?=
 =?utf-8?B?YVkzNlh0cXRjd2hmdDBOS1E5NjM2MHBMRkZmcVZjT3hxek9XU1ZORTVuMlRV?=
 =?utf-8?B?aGFKNjVyQk41RXpSSUpVZ25rbFF2S2lFR0E2MldTVGNPRnpJUlNtSkhlbmpG?=
 =?utf-8?B?Zk91V01DYWkxMDFsU285Sld2ZGVrVHZRd0hSZk5xWkQxRDYyd0JWTldUNzV6?=
 =?utf-8?B?RkFPaVBVc2VqTnlFQ2pqNXdNS2JHL1F1SlliS1ZTV0ZraGEzc3hRWmlZVVE2?=
 =?utf-8?B?UWd5YytjeGRlV0haTWxBVFlUbHphNmtOZCtRWUN5MEVzTkFldENUemJpYUtO?=
 =?utf-8?B?Qzh1bXg3ZExDQk1iVkoxODg4aXEzaGk3OURKdll0TGhkYThkcmZOZmxEZmxa?=
 =?utf-8?B?OEd0cURvY21Mc3F0WXB4WmxqYUc3SU9uNWw0L1EzQlRiY3ZNM1lSQW90aVlu?=
 =?utf-8?B?cXY0SW51R0puYXdHY3lMSldWOXV3SDJoRHVQbVdjdlg4MUdqb1FycWVrVzF2?=
 =?utf-8?B?eS9ZSFZSSFk3MkdvQVdWUHk2S1BSbzEwanZoMEx4RnNIM1Zxd3lBalNRVUNV?=
 =?utf-8?B?RGpoaThsNmovbHpGLzg0eVl0UjMzMXUxOWFqYlpPQUhQaWplVWVrMlhQUnlT?=
 =?utf-8?B?cW9MODFuNERTUVJOUUsvSkRXN2RnMkVvQ1RQcGtzL2dhWElNTTlxcDlCQ0w0?=
 =?utf-8?B?c0xNRGFBbEp0MVUxc0loSERaaW42VHNMdHZwd3I4elN5RGhlRHVKbXZ1aFVz?=
 =?utf-8?Q?mFm8OkOdUf51GoqKIKshkk+Qf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e68a74-7c5a-4eaf-aee9-08da5f2ea7ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:05:21.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GacpI0Jpxabu0sweOkphd33bl/imJq7Vv9iGUF4waIWhVWn6FTrrziRXjPFJe/G2vEeeUNkNGl3ru49R9UtqNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3474

On 06.07.2022 09:31, Henry Wang wrote:
> It seems that this series has been stale for nearly a month, with nothing heard
> from maintainers. So I am sending this email as a gentle reminder for maintainers.

A month? That's only since v2 submission. See ...

>> -----Original Message-----
>> Subject: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
>>
>> ... of the huge monolithic source file. The series is largely code
>> movement and hence has the intention of not incurring any functional
>> change.
>>
>> It has now been almost a year since the v1 submission, without having
>> had any feedback.

... here.

Jan

>> Some re-basing was necessary in the meantime, and a
>> new patch (the last one) has been added - even if seemingly unrelated,
>> it was in this context where I did think of that possible adjustment
>> (which may want to be viewed somewhat RFC, as I know there are
>> reservations against the use of -Os).
>>
>> 1: split off opcode 0f01 handling
>> 2: split off opcode 0fae handling
>> 3: split off opcode 0fc7 handling
>> 4: split off FPU opcode handling
>> 5: split off insn decoding
>> 6: move x86_emul_blk() to separate source file
>> 7: move various utility functions to separate source files
>> 8: build with -Os
>>
>> Jan
> 


