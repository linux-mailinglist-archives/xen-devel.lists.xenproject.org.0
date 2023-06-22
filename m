Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B07F73985C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 09:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553296.863774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCF0U-000592-Ji; Thu, 22 Jun 2023 07:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553296.863774; Thu, 22 Jun 2023 07:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCF0U-000577-FO; Thu, 22 Jun 2023 07:45:30 +0000
Received: by outflank-mailman (input) for mailman id 553296;
 Thu, 22 Jun 2023 07:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCF0T-00056v-1S
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 07:45:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfdc8eb2-10d0-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 09:45:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9910.eurprd04.prod.outlook.com (2603:10a6:102:380::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 07:45:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 07:45:23 +0000
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
X-Inumbo-ID: bfdc8eb2-10d0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwyCCFqu4Jp322Ado+B+ntjxo24kSEz+3/Grc580QpzkqKr7ZNrlgId5ASF6QZ1VEFz0kk4nsB6qLh/OkXtqlGKlivRWaTo3x5Eq4M1Fz6PSh447qJ+ecU8y/D44CxU3DIDtzNJdibHkuj9Ik48+YYgUWOAvAnMKA1eqb1n3ssD0py56BaUfXWo3NugsJ8nsgc8ejFGQHuYtrkXEtn2GYhuf47z/TH9YwSxhu5Rq7pLxAOG0wqIHapLOdGTgAIfzfrXR7zkietSQHw/3ckldWuChRwNq8mTIK6Yg2nF0FJs1ezpM5ManHo5pCLa4iVZbOIimHFduErvizIyThOszuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK9yz4PV+fxnM5auYG/u4lO7vuM4ivFQCsoIjObR5T4=;
 b=Ki7vm1doBOaaWTRAgGzIJ8eB05oGy02GomlprxzuefCXMbI8qmX6wneYYjivx5f81+y8Erb32xtvjDtVZJ4ISjI8/iurki+PuVcJrbUcmE6Tr1uxPTO7Dcmvjp21z8v3TkWDsg/GYMQR7tB8Xmc/lTqJnUFWxt4Q7m11qKd8k3zbQsSHeGddnAyRpCsISmYTHZx+FIzvM7osJVdN9YqwGZvY7uxoespu11CGsj3JqB5yFI8cCUqp0F/LF2CQG7N0hnCF2YvmcRbg8fCwMn91FN2gI3xs59vfleQKtgfreBmxA54vGKLv2dY9yfZFjJucXoMyRTvM0JCtf3VP9TfRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK9yz4PV+fxnM5auYG/u4lO7vuM4ivFQCsoIjObR5T4=;
 b=kgOu4cWNOIpgQHdBflqyqySAnsznu7z/ANtECAFEUrs5rziDLYwOljuB5+cyalM0/Kor2JPlGFz0C4Ab79GSlHJNmGCAik+wIjciSjrIbFvm8HVu4Gyk+wLhcAKZoLrNoi24n2w9KbA2wKOLW8OFi76L6rD0FomnBZsYMLRdP3oqNhD33m84Mi4C0EZnOn6JcJ/gw61IS32xTjtZJHSjlvBZTyiagVOvC+Dv2sP1WgYH5QGUyF8YAgzU1MGXoNFpraM1gbEoxC4OzCJ0Oanvx301p3eNxoe8j2d/gfKanRtIgzzCWMl+TJL3kMu2C4D6cvRAEeJE8b/cBkdXgOl76w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ab5fb54-34d7-c601-1c45-abef19bb5e84@suse.com>
Date: Thu, 22 Jun 2023 09:45:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] docs/misra: add Rules 8.2, 8.3, 8.14
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230621012618.2661337-1-sstabellini@kernel.org>
 <98a2acc7-956e-d97a-ac2f-5d7368f2cdc3@suse.com>
 <alpine.DEB.2.22.394.2306211434280.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306211434280.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9910:EE_
X-MS-Office365-Filtering-Correlation-Id: 1840fdd3-6c85-4cc9-0a7f-08db72f4a2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MgSrjlxrDm61B8yG32jqTkdW1jCjZnxxRmlhc8TX+XB9KxM2UISGzZemMRc64uCcRm/xGTV+ZjB2CjCeeb9rUgeeGGcb4CdNB0PceQNujhOW/MNp31Bj2ZK7oHO6Y6QYBag4IxaBfDHONdQen7vvcW7t3coblEcNhvNXRxDco4nac6jTczeWk/mrESgM0jm/8Kvf2gmirTuIs/tyasErRBFJfOPl3VqwrI6Cino+84bx14ckzHM8wUyCbpF+qO/wjV4IVudwLpbpWraXzawdeh26nAXdTJEFukgvk8CvT8jUsUDd2Ix+/cM/DKY+T3oK6RxH1NwhbfzRk1RfC3Chu3Ycoz8CmtlAL5FIeMfCawHnAlDPWxVyqZ7DXdb1SBum4aPuW4e2EGDGwIuoXlWlnTGIc3Mi3RpbN4MCKK/xFVrhHO+iRB8NnEdvuwMeM5Q06D/HC62MyW3i9vvuEEnPkm7QcNswRPnjFR/Jphk3NMja3+qY/Sh9DoJvE/p3yKpS0HlH1HL1xkg4s6+FYgCU4Meml6YF0Q7czZDUelE3s46f9FlBoHwd7fsXcuh+lwAyd7wY4RKmauHPBs/mzYLpqJZPNHgkjjEnO5RZMzQSoznbrg+KZNw6SBNn5J8+ZWlCRDsKmi82YWXTFDYFN2l4DzO553FNLpxHnHxbDJep6M+fHEBziZy5PMGJV7ctEJGT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(478600001)(31686004)(6486002)(66476007)(66556008)(6916009)(2616005)(4326008)(66946007)(2906002)(5660300002)(31696002)(66899021)(83380400001)(53546011)(86362001)(38100700002)(8936002)(8676002)(26005)(6512007)(41300700001)(6506007)(186003)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmVGR2FTWjZxWDlmTVpSUE1VaTIvaFNnbEFmQlgvVHhKazhyOWZKNy9udXNn?=
 =?utf-8?B?ODh3cDdCWmE4ZmQvK2JMaGQ5ZXFlMnhjaFNqZDFxSjRZN2Y3dG5FZEFOSWJ6?=
 =?utf-8?B?Q2N0ZEM1eCtMQTBHN0tOdmIrd08rZVB4bkREUXphakpodG00K29TQ3A3OGdZ?=
 =?utf-8?B?YjNzWWc2b3ZwWG9DanZLVktUVE5CeFdjalh2WCtnUHhodnNTWUVibTFyRGRL?=
 =?utf-8?B?VTBydHhQbjlOa2dtV1AwYWJjaVllNzA2UGNkZ2w3VlRkWm95bDc0cVI2T1pB?=
 =?utf-8?B?am95UExCV0t6cEl3TFpsT1ZzUFJLS1ptaU4zV0QrcVhkRXZMME9nbHdYR1J1?=
 =?utf-8?B?NFdVaU1SWFZWZDNtS3g3V3FxcWsvRmN5KytuVWJyaDdtYm84VGFBTmFLM3pj?=
 =?utf-8?B?MmVYL1dBK1MrZXdqR2VVOCtiZ0ZTWG14ZDE4czRBbVJDWU1JTUpCTmxNcVBK?=
 =?utf-8?B?V2xBL2t1cHJPcGdkUWZvc2ZSb3YweitsNjZmY0ZTUmc3NE9pVkhOMFFISTVk?=
 =?utf-8?B?aDJlT0M2V2I2YVFBMG8yWFBCR3BqUXpaY1d5WVRlc0FYQlFmZkt5UnZkWjVI?=
 =?utf-8?B?RytHa1c2Vi9WZTRDVk9RQjdWOHBaMExDR3p3QVpCUTRIQlF1V21nbk12eW5X?=
 =?utf-8?B?K2hRYy9uck1ndGNVK0w0UnhaWkMvRDE3bHZLWEpFL3NweGIvVzRrTldCQnBK?=
 =?utf-8?B?NWtRbkRoK3plNk40QVI0Qnd6ekdmWng3b0VZK1JKbnloR3lHckw5R00zblEr?=
 =?utf-8?B?WVlNSVpqTWh5K2dLR2tsdHQ2eCtzYUY0Qll0KzJLd202Y0lWWmhHMXF0MFJH?=
 =?utf-8?B?djUyTVJiQ2FEMzlDRk5RWGdMbjlwRnBxNnI2WXdqL3NUT0sxVUJ3NUFwRmRB?=
 =?utf-8?B?TUhzblJMY2tMWm1CUmZwNnJ6a1ZDRkRoYml2OHlnamZOUGNwTEpYT3JwT1Vq?=
 =?utf-8?B?cmVXN1VqYno3MlFNMUVhSE5TYWtWRVRTQXEyd2syV1Q2L3ByNUJmTGdMQ0tV?=
 =?utf-8?B?RCtiMHJqY292NUNlbDRVdEF2QUVWMDVmL3Nja2xqU3kyQzQrVGxGeGtydWNY?=
 =?utf-8?B?eVovNW1uSThlcVlhMVVDN0Z4Z0tLRnhlU2wyRDBDRTJJcHBOcmJ1aUVwdUlX?=
 =?utf-8?B?RkFiSjJ5STQyZHNiaTA1RG16cW5heUlrb2g4bEYyVitVMHJIVm14YXU0UmM0?=
 =?utf-8?B?SHlrRFFuU1U0Z3k2Nk1PcnI3aXNMZ3RCemZsOENiTkdMVUl2SGtUaUJRdkF0?=
 =?utf-8?B?UzREZTZZekJFdGlvcVBVOGtqY0lGSHExMjdvcVAzdzExZVliL1YyVWRlVVdy?=
 =?utf-8?B?YnU5SGNhZGVlS1RpS1RTbHJhb2NVNHJPLzExcmRIVFNJTlYwZWhYS3Urckkv?=
 =?utf-8?B?Ry9teFlTdnhubUh5LzJBbU5WOU93dGNvTXF0bkltZ2VrajZpNlM3NUFNNEJW?=
 =?utf-8?B?VkRQVU1oemdBQjFmV1lQVWVSWit6NTZZcVhjRFpHdlMyb2VYLzdXbVFHRHBY?=
 =?utf-8?B?aEpBSzEraytuTlJrVmNob1dDd3ZvWFJWaTA2U2U3TmZhTmwwMlVXTlMxSzcz?=
 =?utf-8?B?TUtXM0k3WVJHME1qbUc4TGRpUm1OZlBjU0xQc0VMRUdTdDNvUkY4all2a2Vz?=
 =?utf-8?B?c21kWmdYa2xnWkQ1YStKTzYvU3MvbWJtUGtydDNLckUvK2NBS21rcndYZGRt?=
 =?utf-8?B?dkNhN2NJVGp6WWRaYWdZaE9WcUpOYnVpOU1VblZybFo3K1BTSDVoMENVbnJR?=
 =?utf-8?B?UmVjSThzZXAzOUdzaEVCcFZmMU5RQ01jbjNiUlNpMjY5ZG9PQ0VmdHdVM0Ew?=
 =?utf-8?B?OGRJZGU2Si8vbis3MTVrZmxOWVRaNVFXOG05YlVVeXg4dmd6cTY2UVFPN2Va?=
 =?utf-8?B?VUV3R09wN2JaMisvYW1vWnFjTkk2RHBmQXJ4WDE0dkMyVS9NV3g4ZnVXaGpj?=
 =?utf-8?B?d2NwTHY2UjU0dWtzaWRHQnVnZ3h0Tm1JUFJ3WnUyc1h5VE05YmtzT2pkUDI0?=
 =?utf-8?B?bG9KMDB4ZlY2ZU55VDlDNTFBWXFPQVpoTlpDd3R3YmNpQzFKbHpMZy8vTVhJ?=
 =?utf-8?B?OWgwRXNaNEs2Zkh0Z2pKdU5udXZ6Nms0WDR4ckJ6Zi9ZREltNnBuTS8wSjZ0?=
 =?utf-8?Q?PGHlB3aStylKG4ZL+Plepy1qO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1840fdd3-6c85-4cc9-0a7f-08db72f4a2e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 07:45:23.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxMrt5sIcyiVBq55De3xtrZ3IW+G0oBaRG/rnR7HtkVZmlPSIy4nkIoKvYNBDcUAeOrJpobOk/lHAbecUqj6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9910

On 21.06.2023 23:38, Stefano Stabellini wrote:
> On Wed, 21 Jun 2023, Jan Beulich wrote:
>> On 21.06.2023 03:26, Stefano Stabellini wrote:
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -213,6 +213,17 @@ maintainers if you want to suggest a change.
>>>       - Types shall be explicitly specified
>>>       -
>>>  
>>> +   * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
>>> +     - Required
>>> +     - Function types shall be in prototype form with named parameters
>>> +     -
>>> +
>>> +   * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
>>> +     - Required
>>> +     - All declarations of an object or function shall use the same
>>> +       names and type qualifiers
>>> +     -
>>
>> I think we want to deal with uses of const when not qualifying a pointed-to
>> type: One approach is to simply say we don't use const like this (and the
>> few uses there are should then go away). The other, if we deem this a
>> valuable feature, would be to make a project-wide exception for this case,
>> as having such const in declarations is meaningless and hence at the risk
>> of being confusing or hampering readability.
> 
> I think they should go away (the first option you wrote).
> 
> If you are OK with it, I could add a note here, such as:
> 
> "The rule also applies to differences in const-ness."

I don't think that's necessary. A remark would be necessary if we meant to
make a particular exception. I'm not sure whether we would record the
agreed upon course of action here (i.e. as you say, drop such const).

Jan

