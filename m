Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22004CC218
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283493.482527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPntE-0002T3-Hk; Thu, 03 Mar 2022 16:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283493.482527; Thu, 03 Mar 2022 16:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPntE-0002RD-ET; Thu, 03 Mar 2022 16:01:16 +0000
Received: by outflank-mailman (input) for mailman id 283493;
 Thu, 03 Mar 2022 16:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPntC-0002IT-T1
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:01:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26821bb2-9b0b-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:01:13 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-ilkSwlCcNcKor__p8WefJQ-1; Thu, 03 Mar 2022 17:01:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB8061.eurprd04.prod.outlook.com (2603:10a6:102:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:01:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 16:01:10 +0000
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
X-Inumbo-ID: 26821bb2-9b0b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646323273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lgMq9A/GB8C6EyR43l7HUYjyuXSS3p5LYTfsPgtZ/Fs=;
	b=FJMmF2TtElNq8q96ANzqNqy9UwF+Io186UcXVJl1QM13fqa+Fp2S1upbqkX9gtfYEwPiPZ
	FLz9MyR4l9Ii4ZC17r79Ar8ZGB2Lr8jPGZRxDvOvgkYaaueLL9Uq80N3kah5TYrQen50Vn
	Jvnah0xHs7xlYjb11ojvNyaL4QK1X5Q=
X-MC-Unique: ilkSwlCcNcKor__p8WefJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdJmZtkXGlkG9vHndVcBlEAgNqajEZogLsClE5KI/cqH1ZZ70ncPvnVFMv30cpmmmVHvXn9xPxWOYU9xv8c3JC5+vpGzI93wc2PXRp8nVK2kjIczc0ZGBUBD+vnY9yyhdXUrGNQKwCoGaC1v9Z2ZFWfHm3LMJvFn/bo3mXwqUarpTd8j/GfjaFpWXOXjzftvVEgD/Dk9IJVkWITxMsdb1vYE/5xQ7RXyIritODiIUzfI/znGoE83GDuq6SzfmIOi2HKXPykafRbkST5npE8oyWpTRQm7+6ovLCsV0FPITbkjB1zC2tKJtwSCt9L0g/RgHbfaKdj9kZBW/dZrcjP/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgMq9A/GB8C6EyR43l7HUYjyuXSS3p5LYTfsPgtZ/Fs=;
 b=drUeUZ0cEa4wqiuT9HuTO8h4+Xjq44mwqKPINsXqlzg33QR4WgQzXZU61mYUx09g2d/i+o2mr76twOOWFv1Ts7WYHgjJfW4jcCgdLRIcsUc37e4w5gPlcWQGcWdjnZPIVop/fPXigl5J0uycSMNURMoXLOXEli16uDvl+tED0XNOgLACRkzvWYX92DGg76TOCJ4KicWtpYg2tWYmMFAxhXgWQtBza+rT3kKgAU6u2zFdXcuUDZTPx2dO9rHVq4rNOLrWGNDbKCKY2m54TSJyN3cn9Gr3+zYA7naMMPCdx33Q3Ec+YEo6qPryiE56bVDOE0+U/UJjwXdq9HPACqiaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48c58217-30c6-790f-a058-49b887fc1355@suse.com>
Date: Thu, 3 Mar 2022 17:01:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 24/30] build: grab common EFI source files in arch
 specific dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-25-anthony.perard@citrix.com>
 <3bde2fea-f3fd-3926-b98d-aa0afb549bf8@suse.com>
 <YiDhpSZC1z/duG4q@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiDhpSZC1z/duG4q@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0102.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ae153f6-9631-49bf-8d38-08d9fd2f08e6
X-MS-TrafficTypeDiagnostic: PA4PR04MB8061:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB806108EC6A5C6D70F29DD281B3049@PA4PR04MB8061.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DyWABsQQlN87WYAcj+kMWmpA8YCOeKVNSDvsoqKAtsSQ4m9s5MFtLMR9ffmj3NiumVMSPRdBSToT9n9HJPf2P2BlXMCECERvvKdFLMDZ1CMnFEZSnrjMqfKH5wSG1FshzTpvHrscvfm8mWiWvUnvCSnr3vTnwN7AQMN0XXv5p+yumc0nuvTnMZu5KGe988fnkHS5SBQ9KMUEEctNv11q4cVKLJvKNqhNIUdnOMwq7BGYhT7JWxpGnSeqTN8+nyFXhFG68YMi5IfWvc68xLYThonhuUCd+rRYJWmqD60Dfkx1vnmWXvxuyyLq4hKSr808cJy6qwIF37rfVd5F9VUeCDDksX55Qcj46MB8twektZeT/d+aEYysWZ0uIo4073yt2mHjC3D8BBznSvICWKNUr+ayRmqxhsUuJN4kZgH3Gus+3Ci6xCiWAxNB/GIddnNasTEZPS6L+8Aj50HwVyLMbHJ3meEP6rp4Saj7wBwQULDmDCqo1/K4xcXhYV+EaMBbcCgyVVfrkQ1qmQEwWTq/RoGPGODcF/uoKPgLDzWWIBoMoma4KllpcvhL8a4AypTxFThL30PknyUdpVo3qmMkYBUAts0i0lxgkLpsv37mov9Z9dMX3XmMYUH01ESVl//acq+xoFx0mjCxvT7WcfPbrAT+/I1AD+pdLOe+j04VyAs6P0TNeP5+Sj1L82o7n+nudW/9S7ap3/u+4Q1AHzeqCWtSRg8fzAeMa2M1aYi0F78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(4326008)(316002)(38100700002)(186003)(66476007)(66556008)(8676002)(2616005)(6916009)(5660300002)(26005)(508600001)(36756003)(6486002)(31686004)(6666004)(66946007)(86362001)(6506007)(6512007)(53546011)(8936002)(7416002)(54906003)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FNamxleHUxZExCMXRpTjhEQ1BIcE9BQTN6eEtxdUJydTNlS0FNK1Z5S213?=
 =?utf-8?B?Z0xneU1LV20yeGVlMWlGUXVBOE1TMnlPcmEyUEFsVXdqWC9GakNnQkVxdVRH?=
 =?utf-8?B?aXFBNTYxeENLYzg3ZjNyanBvL2hva000OEpGWFZMRHVUZ0d0UVIvWUpRaU5u?=
 =?utf-8?B?R3NRazkyeUlkL1NiaTBWNnFhVXMxUHNUWWk3L1VqbVVkdkdUVTB3NmUyNlBM?=
 =?utf-8?B?dUlOSXduamdjekdLMzNWUmh1MDZ4SkxHcFFuSkNDam13bGxTRUhjMnRZQkFn?=
 =?utf-8?B?ZXVrZFp3WTZ6Rk0xK1Q0QjJnR1hCQjgwVzlKWURoeThNVVpib0twNUM1K0Qw?=
 =?utf-8?B?Y1RFbnAzNDFLM3Y0aVFmbVJvSHZFTHA3S3hrUTlLSnZMb0xqNTN0ajZNTTNP?=
 =?utf-8?B?dktBbWc3emR1OXprWk5IS3E3TUVrNExqSmxyZlRTL25mTXhhR2hxRlZhOXBv?=
 =?utf-8?B?dWtjZG9rYmV0NSs5a2ViTzlRbjdtVHdEb1lDWForN2NjbHBabHlacHA5d3lw?=
 =?utf-8?B?T1QxaTlDT3BzVnBjMGY2bExxTEYzT3E5TXR4ZDRkSUVlczVLTXhxbzVQUnB2?=
 =?utf-8?B?Nzc3T1VQTGhka2c3cVdnd3VocG5WTFZsdGRDV3JYR3EzbHZpc2ttaEJ0TU5O?=
 =?utf-8?B?ajVHNlFVSW9UQnphS1ZJRWV6U3RmVW1mM09tUXBuNU9RSVJPQ2hiR1lueVQ3?=
 =?utf-8?B?c3lOYTkzNitrVHN6VkpFY1hnMzUvb0NETmFqcDFEN3JaOERQVERSQ2pCdFRQ?=
 =?utf-8?B?Q0ZZTVF4bTJlWXpJbUlzelN1YzRhcmc2a0hzOUwzelVvS3I2dUVsVGhSQmV4?=
 =?utf-8?B?SjI1NlkwTUZkTkIxUkpUdDlNa0pkS2llYzhNZGxSeVZJdW1XMFYvL1hOelFV?=
 =?utf-8?B?MDhMdHlHSUJlVXRESENpQk9zT3htR0FPS1V4WUVPS01PendiQ1VuRWd0dkIr?=
 =?utf-8?B?MVJrV2w1SDFYYmk1Uk91MTB0c29qRGJyL3F1OTlmemRpU24xQ053M24vZjl1?=
 =?utf-8?B?czJveG1yZjNNckl1c1dJdDJlRzg1OXVjUDdiYk1OT3JRVVNOSEJtdHlVQ0x3?=
 =?utf-8?B?KytUcFEvQkMwcXpWRUNKaTBHUTc1TEMrZnZJbjVMclJLZExEdlREMHZyT0FN?=
 =?utf-8?B?M0sxNkJ0N2s1ZG1OTVJ0MTljdFVETHViSU81MTE2RTRPZ1c1dGtXQzhjbnRM?=
 =?utf-8?B?SGdGNjhmRWhwM1lrSnYyYmc1OVdrNE5VeUFoRnJGeU1CWUJtT1NSa0JUVGpQ?=
 =?utf-8?B?eitQM0p5dm95YWRxemtnNzBWZmM4NUMra0tkVlJsRm9mNFhsVGF2ZDRxVktw?=
 =?utf-8?B?SEdjZU4vV3FxQkp3cm5sZWc5SUpYUGE0RkdnWVZ2WEppVFdDV0ZoWG9FTThU?=
 =?utf-8?B?bC9aZitrSWFQYUswNm9vNU9LZ080Y3U2TWtGZG1GcFRJWG93VmxmTE9RTWJW?=
 =?utf-8?B?VUJWbWMxb3dQL1NkZEhNNXdmTnlDVTZNNS9idkNsaTArWXdJdkV3SER1cG9a?=
 =?utf-8?B?QVhMWndXMXlzNVpBZWZZT283b21iQUQxL1J2M09BcVNQcVBxZ2VING9HTFlW?=
 =?utf-8?B?WE9aSE13QmN4M09tZVhaeFE5YWh3QTB3SnI5VkkzMHduYmMrMzk1TXJpQXZD?=
 =?utf-8?B?c1B6cW14aUVSSmNjM3JqQU5KUE1mdFo4K29UUkxZb1p5RkpVRVY4aWdpWjhz?=
 =?utf-8?B?L1cyUDl4UWFWYjVGckFRaEUwVHQ5V1hWdTVqMkFaMW9jZ25KV1d1VjlvUzZr?=
 =?utf-8?B?V3JoLzRuQ2N2ZUxuR3JUYkxFRFRuM2RRT1hoVEhKRmhOTFRMelRQK1l5VjFl?=
 =?utf-8?B?QmRRN2J5K3UxekFpOVhhY3NaNmF5aE5wV1dTajB5UHc3TTAxaUFja2dPT0J4?=
 =?utf-8?B?MitQRk9uaTJkU3F0bFY1RVZLbktKaHlPdFFSSnIrWHBaSkg2NHV0MllXNmZv?=
 =?utf-8?B?dHdFekM4QkNwbGQ1MlFKQ1BNNkF0eDRjeitFeVdDN3hWejllN0NESkt2SW1D?=
 =?utf-8?B?eTNQZDVQMVlRdUJucHUwdGN0RTVNUThmS2pucmpoUUZ2ZFEzRFNUTnE0aEhM?=
 =?utf-8?B?QjhaNlNTMFhtRmZOaXltZUxsc1NpaTl0WDFVQ0pyeU5FTEFYQm9IejRBdEw4?=
 =?utf-8?B?OTVXcG1DTTVQMmY4QVk2Z2laQm5pd0V5ZGdHZlJCTkZac1RPZ2crd0xtcUhN?=
 =?utf-8?Q?gRpSshVkk1b3BC1Qe/a81sY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae153f6-9631-49bf-8d38-08d9fd2f08e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:01:10.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwEbuM6DFHeIdsHSObgenvj8rTHcVKuZVoBZ0vzx9JqEeHpgIvOorbRReYpb0JeJdPuflIUKrroPpemc5tRZTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8061

On 03.03.2022 16:41, Anthony PERARD wrote:
> On Thu, Mar 03, 2022 at 11:37:08AM +0100, Jan Beulich wrote:
>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -77,8 +77,9 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>>>  obj-y += sysctl.o
>>>  endif
>>>  
>>> -# Allows "clean" to descend into boot/
>>> +# Allows "clean" to descend
>>>  subdir- += boot
>>> +subdir- += efi
>>
>> No similar addition is needed for Arm?
> 
> No, because Arm already have "obj-$(CONFIG_ARM_64) += efi/", which has
> the same effect on clean.
> 
> Make clean doesn't use ${ALL_OBJS} to find out which directory to clean, so
> adding "subdir-" is needed at the moment.

Oh, I see.

>>> --- /dev/null
>>> +++ b/xen/common/efi/efi-common.mk
>>> @@ -0,0 +1,15 @@
>>> +EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
>>> +EFIOBJ-$(CONFIG_COMPAT) += compat.o
>>> +
>>> +CFLAGS-y += -fshort-wchar
>>> +CFLAGS-y += -iquote $(srctree)/common/efi
>>> +
>>> +# Part of the command line transforms $(obj) in to a relative reverted path.
>>> +# e.g.: It transforms "dir/foo/bar" into successively
>>> +#       "dir foo bar", ".. .. ..", "../../.."
>>> +$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
>>> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
>>
>> What is the "reverted" about in the comment? Also (nit) I think you want
>> s/in to/into/.
> 
> I've tried to described in the single word that the result is a relative
> path that goes in the opposite direction to the original relative path.
> Instead of going down, it goes up the hierarchy of directories.
> Maybe "reversed" would be better? Do you have other suggestion?

I'd simply omit the word. In case you're fine with that, I'd be happy
to adjust while committing.

Jan


