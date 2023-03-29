Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD8D6CD65E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 11:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516132.799761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phS4M-0007nG-Qx; Wed, 29 Mar 2023 09:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516132.799761; Wed, 29 Mar 2023 09:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phS4M-0007kd-Nh; Wed, 29 Mar 2023 09:26:14 +0000
Received: by outflank-mailman (input) for mailman id 516132;
 Wed, 29 Mar 2023 09:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phS4M-0007kX-8k
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 09:26:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be07b906-ce13-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 11:26:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 09:26:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 09:26:08 +0000
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
X-Inumbo-ID: be07b906-ce13-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxI31J9fQnEtViqO4fpM50E3qyxTdGQhtcbmUjmMFtxbU/DbP8/eHO6+b4HLBh6WVtPq/UFLpD9CTMeDsLKBSKbl3KHXLCzJJLdqQlw7TwMlm+g2SVp0zDd7Y/sGB44VB1Bo/CseneDNQMk690SZNwz/LpX42VYwoTKtWeS5g8DxTgSM+q7Q99/YC7OJ4HlIJ0H36IEPxm6zijv9o56xcgKuc1IpTR5eOBNQhocIGGDoq7z2Y1dBufyUJOFcUSP8UlSGBv7MaDp5w3ggUQpTW4p1Uc3tN43Id5WrlJRaRavTglq7lgEV61vJG9zrxBc3wyt3Qus5t1xlonGxpjgz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dHrHk7e7MWwaapL9Sz1b672jKFXAfjfMAQ5upDJ++o=;
 b=cWTeou4zpQo+vlCTiHRmA9ONmbz5wzKfmVybw5S3oOPQU50KNHPWTbOPhZ/Z1CIK2oymMvMHMR63mbIW/T/iEgapNQCASH46TSXOnN6zyd3IHdmxpHvuSRrR+qOVs4RGcDo+tPSFfN2q4D3igKxMuZHC+joTYT715yzdmAHhDSj4LYwNOxCVzRU8Ja/olEmhv/OT29FWPkR2OcikjPXIkCkWVL3nuL1cMN4qpLiQ8baKQVOuq7vxRqtpPwLCQp9LTBz8IewW6Z5ANX2DUnuKHaEaJqmfpvABysxJEgjndXVGDRn2fnDRvYSqq/VHWlTUaZQG8CbmI/Z0xE8E2XrEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dHrHk7e7MWwaapL9Sz1b672jKFXAfjfMAQ5upDJ++o=;
 b=FxV8jyWfT7B7wU2dzzdeoS40vpEWkkfS36naal3AMYumo36OX+qLcpyLVJcvHwh4M2JeIvWQUyHX1p0VEkKpSc4S1SYNL/7iAHeeTPKiQhhCb4xJFcd+nCtOJd9v/GH/4bX8D48B2JTFv7PovlCuybsw2vapPsYjSI3lskf2tUNkQ9WgiIimWvZIK/1V1cjVha+DI+R3jtBPTZ6eh/kiB+aRTLGGfG9O8GRkyq0XFEDnN75zYcUXrBhZDYSVQ/uTC3zPGmrB9F2anX3pU9dtvRsSd3rKOV1VxL1Q5tGGbyI6h4hL+qVA2Czyv2AWxPP04wJt4fRSfE4ECNNSevBNbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23552dd4-f913-70e0-a737-a80ca71018c9@suse.com>
Date: Wed, 29 Mar 2023 11:26:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] x86/ucode: Fold early_update_cache() into
 microcode_init_cache()
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-3-andrew.cooper3@citrix.com>
 <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
 <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com>
 <8ca9ddb1-d94a-7010-ab42-e6d0f0670aa3@suse.com>
 <CAFLBxZY98QO99+EAURNeDU+tNrLRGot0w2=ybfRWvFEq7XH9dg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZY98QO99+EAURNeDU+tNrLRGot0w2=ybfRWvFEq7XH9dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f51cd80-7c6f-4d29-3959-08db3037a0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8vBm5gEztYDjeGTVAV5RjIdWhGd+z/ZEFpar2zxe7okTJQEmJSCajmq53jE2VNLKgKLuLeuTj7erZQ9KY5fbZKvySJdPSZ7fNYeCTi53816Dw1hk47QM+L62+RPLxMh6kkmZvo/nCYWNXm/eX4oGlV4XPGz8G0ivkG8Psb5I5vMBtotsAiF3Kd4MevkXHExMcQWePCJbgk44Okm7rsjsAUutuac4i+nUKXFdUSLNSWy2bfTvRSaYaSZ7XjeaTsKl9BbsRYP9FO3pwVTD2H/T0LnsuY9l52CMbKktwBUiIgy7UmsDpkslhFvFqpShnjF2xKoga/kMfWv4Z7bbq4mrB+FXTQ7bFDoLeHXo5nMj/zQ5BgoAR5Eb/Ix+yX0gs0FwXwpDEcHKoyWrcW95HGY2pFQqpG8U81MYoiQ4TakG/MFH59biQEN2HgWeJhCOzc+HwTRXj0BCD71v4zta1D41EdGWOvdKZ3amWOWVyR0+vETA8/Z0cePWfNIb8a/WIn6spOkwtHs8d6IrB/rJaD1rmFEfZfWvs+8ueA5ZP+l+8wJvEiFww+gLgp5AHLeTtc5KMLaOp4apjzjpAa5XteMJDGKtsEDyHjRZX03vHBsMD6FBNt7v+CC+W5QIwJWUMo8XNI/yNNCT2hZAJTsoCQHXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(83380400001)(2616005)(5660300002)(478600001)(6486002)(54906003)(316002)(6506007)(26005)(6512007)(186003)(53546011)(2906002)(36756003)(31696002)(86362001)(8936002)(38100700002)(66476007)(66556008)(66946007)(41300700001)(4326008)(6916009)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9HT1dNaWhtaTlsVkF4amNrQVlJa3JZbWVlQ3BSdERKblU0akVSdHRCUnMx?=
 =?utf-8?B?aFpHeUVOSkRpa1JDaUF2NXdqWVdvNFlSalZOa3RIMTF5R1ozcm0vK0swMDdR?=
 =?utf-8?B?MUQ5cUVPVXRxbXNlVE1tWVd0WWlCZTdReURHbXJJU3dqZWhRYlZmdW5MNHZS?=
 =?utf-8?B?ZFdOZXVlQy84UUZpcWNGS0ExbDVxeXZFVG9xRldMbnBPc3BuWVpDU1JSRC9Z?=
 =?utf-8?B?SFJCWDdEVTRZREFCM3JLcE1BdUtUUUZrazk3RGVvbTlDUXhOaGVQTXEyaUtD?=
 =?utf-8?B?WDFIZ1RjQmZjTHUzVnNPNVJrY2g4OWV6QStNMVk1SzdPVUNQeXduMmp5RGh3?=
 =?utf-8?B?ZDhjSzQ0QS9tR3UxbzQ4bG0vQjZmSzczQVJoWm1majRkb21aUVdCZFBwTWpR?=
 =?utf-8?B?aHJTazBQcjVJZlZmc0JQUjRBWmc5TjltS1FtRWZzUVhQejNxeS9uWGtEbjFi?=
 =?utf-8?B?T2JlNzF4VW5hNWZsY1czNU1MczVXUFFuVHdvZ1JZOWExRWlhUnZzaVVnbTR6?=
 =?utf-8?B?MEFVQkUvNkhTZ1c3cEZvQWkxOFA2TkNocWpaVnBENWRTTWZlZHI5WkVqbjZy?=
 =?utf-8?B?Zm9xQmhXLzF4TkhsOFZvSENMeVIrd2p3NXRSQ1pzU25pdjhMZThBck4xcVhE?=
 =?utf-8?B?ZER2YkE4MVV4cld3bGZIOUpFcjZzZ1lsNGNlZXM0YWRxU29lVXF6a2s3bUNy?=
 =?utf-8?B?c2hKRm1tUi91aDU4dXhwbjFWVGVDKzNFK3o1d0F5a0MzMGhFMStkbjJDa1pu?=
 =?utf-8?B?djk2cnMrZXhvdmN3cjVzRGxzRDNYTXpMVkJEaXpxM3FiVGlnc3dHM3VrRWt5?=
 =?utf-8?B?bWc0V0RlRFdTbGFCSDIzRXoyZnRsOHpZMzdyZ3Y3VVF6U3VMYkIrcWxYazVk?=
 =?utf-8?B?QkV0MGlydUFFYU5vbGJmUWVzZ2w2aThkQ3R3U21DRGtqMHcyNkxUSlcyOEZM?=
 =?utf-8?B?TUh3Yk53ejR4Z3R6L2dtR1pwbURNZWljZms0UUd4SmtlN1lEcTFIZmdKdkxE?=
 =?utf-8?B?TEt3eXQ1Vkw4d2xSazc4NUtTREl4bk5DQjFCZUN0dlJSbkt4M3pTSmRRQ0la?=
 =?utf-8?B?a2lMc2Rta0NtK1RNOXNsNHhlSk9FYVB3TW5wRnR6ZFg4N2hzN0FWTjZLM2JC?=
 =?utf-8?B?SVR5M1BFUW84Qm83RWkyWjdxd0lwL1lUMTk2NGZ5cE4wbWMyLytIOC92eHN1?=
 =?utf-8?B?dW9yY0ErN01HQ3hVY2NSbGNmL3k2Y09aWmp6WFlYN3lRaFNUS2dWMTZkYlJz?=
 =?utf-8?B?Z2ZPRC9iTVQyNnphUTlnOEhSSWJBZ1JXZERQUktveHFlWmE5SENjSHpFcDUz?=
 =?utf-8?B?My9Hcm9UaU9DcHR0YStHUGUyeG5waUxWWUdSM2xmRFltcS8wZGFpR0FJSmRk?=
 =?utf-8?B?OFN4b2FoTnc3RDZ1RGtNRTdmRlMxaFNuazRHWVhIeUlaN2RnZkFvNjFHaGs3?=
 =?utf-8?B?THhYZG9mK0EzdktldFNKQXo0eTBVUFRqTFdTaXBZaWlYU1dhUU9ZMGZSZWMx?=
 =?utf-8?B?UDl5TUQvVkdNQU9yTXlnUk80bkI3NUQ1UW9ibmQ3MEs3WXJ5NWNncDZzNDFZ?=
 =?utf-8?B?UzdPdlVMVjN5SzYyMEg4K2JUTmhxL1VkSk5mblVZZkg1RWpqZHVEVVpKOEMx?=
 =?utf-8?B?STRpMHo2MXlXUDl3QTRNTDE1QUN4Q1p2anRUMnBTTHpzSWxaMXV0bDhXNklv?=
 =?utf-8?B?NUhhejlaRGNTbkFiNWdIeXhIRU5GQ09pN2FtL3RuUE9KM0VKMmJRMVY4VTd0?=
 =?utf-8?B?ZDB4cHF3Wldkd0ZrYnZFdDNSU3pXRzZPMUEyT3dXRC9vY1VrL2prRGF1RUtq?=
 =?utf-8?B?UXZESCtDRXAwbVdzeGhNcURHSnFvaDU2U21uV3NrSXU4aWd4ZWxxUFRNY0xX?=
 =?utf-8?B?bXRPbEN6RHR5TnRUYVNpRjBtd1JYRkZIamlDL0dxWGdLZUpHYkpEemRhNU9j?=
 =?utf-8?B?djJqazArQ1JDUGptV3RLYjVubHlKdzNTNC9IV1lCaVR6UGkxZDVybyttclFw?=
 =?utf-8?B?VFJKRk1rWkNyT2FGVm5IeDJvTGdzN2dYOEZjc293aGt0VWVCTUdMTGhFcUx4?=
 =?utf-8?B?ZXMvcTJpc0NsODBLbXVWZWF0Rnc1MVpyUHBjNWx3bXhrNlY4cm1KNEN6MHJn?=
 =?utf-8?Q?ljpjrdFBc5pNOLw+2nJuzr13Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f51cd80-7c6f-4d29-3959-08db3037a0e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 09:26:08.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZRUb5cmKDqjSYRs4okGWVz+ZwzUN+T3VLYlwcgryyD1eh6AcoHeZ3Yw9u1vw5DH5zQjewNfBiYtomNXYlUUBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405

On 29.03.2023 11:13, George Dunlap wrote:
> On Tue, Mar 28, 2023 at 4:58 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 28.03.2023 17:07, Andrew Cooper wrote:
>>> On 28/03/2023 2:51 pm, Jan Beulich wrote:
>>>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>>>> It is not valid to retain a bootstrap_map() across returning back to
>>>>> __start_xen(), but various pointers get stashed across calls.
>>>> It's error prone, yes, but "not valid" isn't really true imo: As long as
>>>> nothing calls bootstrap_map(NULL) all mappings will remain as they are.
>>>
>>> And how is this code supposed to know whether it's stashed pointer is
>>> any good or not?
>>>
>>> This is precisely "not valid" means.  It doesn't mean "it definitely
>>> doesn't work", but very much does mean "can't rely on it working".
>>
>> Hmm, not my understanding of "not valid".
>>
> 
> A "valid" approach or algorithm is one which can be relied on.  If an
> approach or algorithm may sometimes work or may sometimes not work, it's
> not valid.

Interesting. Still not my understanding of "not valid", not the least
because "may work" again depends on further aspects. In the case here,
carefully placed (or avoided) bootstrap_map(NULL) means the logic, which
has served us well for years, does always work - so long as you apply
sufficient care. Over time that "sufficient care" has arguably turned
into "overly much care", and hence Andrew's rework here is definitely an
improvement. All I dislike is to call things worse than they really are.
(Another thing would be if "sufficient care" wasn't applied at some
point, and if as a result we actually had active breakage somewhere.)

> That said:
> 
> * "Not valid" is kind of vague: it tells you think it's "bad", but not
> how.  (Even "racy" or "risky" or "error-prone" are more descriptive,
> because it prompts you for the types of problems to think about.) It's
> usually better to state exactly what problems might happen if you do X,
> rather than simply saying X is "not valid".
> 
> * It's usually better to propose specific alternate wording, rather than
> arguing about whether a given wording is... er, valid or not.

Which I did (without explicitly saying that this is an alternative wording
proposal) by starting with "It's error prone, ...". Similarly (iirc) in
replies elsewhere on this series' thread.

Jan

