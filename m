Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74586D021A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516591.800956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpqk-0006GD-SL; Thu, 30 Mar 2023 10:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516591.800956; Thu, 30 Mar 2023 10:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpqk-0006Ds-OQ; Thu, 30 Mar 2023 10:49:46 +0000
Received: by outflank-mailman (input) for mailman id 516591;
 Thu, 30 Mar 2023 10:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phpqk-0006Dm-77
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:49:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9554ea76-cee8-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 12:49:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 10:49:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:49:43 +0000
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
X-Inumbo-ID: 9554ea76-cee8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTaea0kTbbH869ueOIJCGOEPxH9bfh6qLr6qoteRKMVAE6/etiM6txmc3rGY/BvZCiJkj1kEEZXCkuIh4GIjfyMu7Z64xHEjDmeGsyB4ERG3gi4rsslsZGfZQGLnYkf/t2lwQCCOWLw3wfVWt91XME9HMIltxAK0w93wTWJcHZ+GbF2HKOWMyygTn3NwSVHPElDlEJRSFa8yX5fplDuMwXjYc4SAEgnXfRZe1WnMv2cMU3jQpbn/nFMnwl6Uc9gUeX5yJ5RmYzAXeSwClt+OY1fJ6ss194AhgotwVUuqhSUcl/YOm2TI+qvkCgxAK2YCpPFUAffpRJPQ3O5KNsIygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqlUBDKmuxRPMK2AGhLdnImiD1oR+j16HHXc92V7FCM=;
 b=N8J/YmU1Qhfxdp6uFV0CTqsOPXLgRPDHEQ4JmQ7zHU2AtAuO5/3wJ0bdOQPLk2yqfKXpwhCQCpXwumf09EXCjjSM5W1xUHq4wsil/+JD+rAiY/n0HSlXy1TJ0fwpD0Km1hrtSYHdyScbmcpJUwbL2zF9yLBimENWtCNmZNm8PU9cphtxB/7XHqpn2/LWEr+1cQdHvTIpbDXEwR7fOvCKSvfXa5RNCfxZlB6RpplWDN5p2o9UHpt+O22aD89ty18m0qLZLSTl2krr8aLq0V87r9+PgWUWAcui/xaXMnrUAwduwOEE0NQ+AQjG7d/PDp3orGiA5kPdtC1NL4GZsQRzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqlUBDKmuxRPMK2AGhLdnImiD1oR+j16HHXc92V7FCM=;
 b=xBNG5KFr7eYtQRUnWDGCSoTl7q9LddT4GYX9hXaw+elgfWS8ywA0+Yg8OkyanOOTYeYzEl/eC07EW+jbnPz5xExpywLcI4g70ihUyynjxdyMkd81GjM9zyk5CMMcqioc9yrI/cMx4wVLqx2eOvSvDhBWc+BI1utixa4E42COhOmLi+HQbX/QPBgG4iMB6l5gepMgekDFTHncvrejri7COxNM8xx/X4u/8ywU/DXacbGefJ7QwQDhuJ0RHKefUSKTfMlqxJ8/rFP7qowSYP8JBgiit+OzxL/P/x1Zy5i1OGiL2rAYoqRgFk2vBPheA1N/qO17aAPP5PdlmpePfL/vOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1aab510-6660-99ca-71bf-dcf127dfbfea@suse.com>
Date: Thu, 30 Mar 2023 12:49:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 08/12] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-9-luca.fancellu@arm.com>
 <b5411b23-2c2a-b771-c2c6-00b0f2a7a033@suse.com>
 <45149B4D-7127-4CC1-B8D7-A6B4BFC16F43@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45149B4D-7127-4CC1-B8D7-A6B4BFC16F43@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d5c417-85b5-4626-34be-08db310c7853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5iJaOVb96VRRNMNcZHHsitvcHpGdW+p+slvuj0COVQaehlHqVroduNUI1DZIwdBFpw0ylH89ASL88Wex4VNpYwKxJUA50BUOBiRysIS62mo3ONKmQibnVY55pe33IqfFnE2YmYynrVu5hHSh+plBiuLlQvyhvkLa15GEZmNnPE1QMoLCGy0UIjF8NgsN9g7cqcrjlpPiN3BU/cxyjxrAUvvkG3ZdGgnqhbBfpPVcfSucKQigBGJiOh7wvf6okfKO8MaRoO/XR/KEQf0C0wC+I8azfpH9UiblSvbr1UFwiVvESAC9mMc545qtBjgLkTpNJYX5OlWVJOVnA22bKwF3HhjdKhlYZLXHRaB/Rm9ge5jSo+RX2F54qtWQNkqPUdKFHdbfMvujDDSHH1sFLWutOgf6KVIqfkq48lqvyPPjgnpave0vJXEYgc9qPQRVl6+ryMFlsK6kNyUuaV9PfMdK8GDUfFCrfmIRxA5f5vqvHB7q9TP+EJTVGhEdzaklmc0I2hvmlrdSb/sCGmv1dLY+/SuVjb89SLQYwJBRazzLl5u8GO9o1PM1/dw1FqWxKRaTx5E3VN5Y4MqA+CKmbJm7SQhDys4dZPEuRVGdGPun4Ztv9mDx2rYrGjCZ3f13UOkaMIdd2b79+V2OalAY4fLt8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(31686004)(36756003)(6916009)(38100700002)(66556008)(8936002)(5660300002)(7416002)(4326008)(66946007)(86362001)(31696002)(41300700001)(8676002)(66476007)(6506007)(6486002)(2616005)(26005)(6512007)(54906003)(2906002)(478600001)(53546011)(186003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUxjU09rMVQ4Ym1pWFJlNHlTMENRR1BZYXlXUWpmbFRRalVqN3lNYzVXWkFG?=
 =?utf-8?B?OWNKK0ZwQUdpTkZKNC9ZeENIWkpUeFB4Mm9DakVjdTFYS3Zja2cwZXd3Z3Fm?=
 =?utf-8?B?Y3ZsMm5CN05CcnZ6QnNrZUppUmtocXUzUmp2STg0bWZPVkRQU29XV0h0TEgw?=
 =?utf-8?B?SmtMNU0zeEdMelBRNFQxUFhmLy9xaUtWN0VxSXdsZmV2RllyVDFyb1ZjTEtt?=
 =?utf-8?B?Wnc5K1pJNnJKQU1uemwyamUwME1Nb2FuZ21iYittU1Bya3JPUi9KYnRvUnlC?=
 =?utf-8?B?WkpoRkIwRUU3L3IwTDdQT3cwOFUzZ2ErNWwvb0VFYTA2NitleVMzRVRaR2M0?=
 =?utf-8?B?Zk1WUEQ3QzBTT2tjakVtRlQrTXFza04zSDZtSE9jN2RGRW5OWXh4UFRoK1Na?=
 =?utf-8?B?QU5ITi9VaWoxdlhFYTFCbzc1d3VvaEpLcTBKd1psSTd4Z1QveEl3RTlkQ0la?=
 =?utf-8?B?VWFUMEM1YzVnWVR1cmtrU25DcE4rWmRWQVpKQzZsV0Q0am5QSm42VnRNRWdq?=
 =?utf-8?B?NjdvYlh5RkFnUG9ZaWdlc0NaSXV0azdSVHEwd29SME5iempZRGlSSllGdWt3?=
 =?utf-8?B?K00ya1FvS1BpWFk3WEYrYjhKVVdEcTUxZXBjSEJTVDljVzB1VEd5RHJIYVNM?=
 =?utf-8?B?V1hWdFF0dlBLbExiYnlZcUhyY29xVTF0cjVIdXN5Ui9JZGRBaC9Hb0FuSnFF?=
 =?utf-8?B?YXk3Y0NrNXpGN3laKzRkTllhQXZyNm80Q0VPZzNueGJUWWFaRmxkWHIyRzNs?=
 =?utf-8?B?MXRiL0J3Z1hCN2JGbGtNM1kvR01vQTljN21SQWt0bWxFZEEvRldJVkZ6amMv?=
 =?utf-8?B?eCtKQXlSL0lvUWlkNE5SU1FNYlZIMlV3YUxISUZjUUZSdEVMS2w3UFJPellu?=
 =?utf-8?B?SlYyOHZac0RTcHdZQms3ald3c0pSZjArTFp6MEFCRy8yR3JmVU55TmVGUDZQ?=
 =?utf-8?B?MXBiS01tNEJna3lNZmFSL0pqbUhyWHdsYnUydm5zVHFaalpBajJPVWI3K2pS?=
 =?utf-8?B?Skk0bVJrMGxjeXBtTVpBTEdTUHZvRktjOUdTaWI3MWxyNXFlNHMybThBQWZK?=
 =?utf-8?B?dXR6aUx6WDV4aHlCczRLRy9XR0xYVXBoaUdvT2FHWk5LTDRNK0NaczFYQ05W?=
 =?utf-8?B?WjQxSzdFVHdaQzNpQ3p6TEN6eHlJT3pic1dTSmx2T2pGT1lPSGdlTnFlcjZr?=
 =?utf-8?B?RW9YYWZidHhBem1BWlpOY1dWK2lEYkt3V2VzTlFZZVdZV0lOVWhtQ0lSaVdt?=
 =?utf-8?B?K05PVDQrMm5CZ0p4U0g2cE8rSkVaOGZGcFFYbVJQRk9ESEphL0FtQmw2TTNq?=
 =?utf-8?B?M2t1Z2ZSMVpna1ZPQVNScmxueFlZQXUwYzM0MFd0bTFiR2JtZUc0dXY5cThT?=
 =?utf-8?B?eTZMRGVnY3hnRmhXRm5oa1g3YzRING05S1dLeGhLRlNmcEZOWSt5b29XTzRu?=
 =?utf-8?B?THdod0lIZ2tCNHJXYUlQOFpiUmd6Z054TVF1bGM2NUE4cUNUTFIxeDJjYUdo?=
 =?utf-8?B?STZGTW1TR2g2cGpnMHBvUytLNVE0NkRhKzRLUFMwRXVlYmYzYUhrMmpyNHJm?=
 =?utf-8?B?aTN0b1BVREpDM0pkZU82MUM3ZERLbkVpR05DeXg4a1F0K3NYbjdWRGt4MVQ2?=
 =?utf-8?B?WEM2RGRaUGs0UlMvVHBwMXNVRW1pS1JNVlh6WlRSeHdqeHpCQ0xzaElyNTVL?=
 =?utf-8?B?dkkrV2xUYUI1aXJFQmhKRWdsYURvWVk5Y3IyaTVsNTNZTTJHbHd4dkZlNTRC?=
 =?utf-8?B?ZjFRWVppYXdXMytTcjZ5SVNMNFdZSnNEUnpvMHVnRURCSUg3WWFCOE9kS0pK?=
 =?utf-8?B?bUg3RWZHMGpYTGZObC9leXU1enRya1dGbndWcHZxZ1FZa3lORmJ5SldTazRM?=
 =?utf-8?B?S3BuM1dGbVhGelBxMXlSNENvcEpIRmlvS0RFNFBybXBuejRrNjF4UXRZSWtS?=
 =?utf-8?B?OEdXTXVocTZkNUVJcHkzSGt1SHZyYjN1b0U0QnoxOCtDWXkrMmhyMTRCMTVN?=
 =?utf-8?B?TFRIRjZQQitCUTFjNEpYQmpxMzlkQnVmaEZYTVRSZVV1QU4xdWd1ejdxL3JN?=
 =?utf-8?B?VTdIZVRIMSt6ZW4yc0Y5eUl4ci9Ca0l1VGFIeUdvaDBCUWM2NGNBT2VHdFRu?=
 =?utf-8?Q?uAgPPFgV7DK/8ckZyGcEbbTcF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d5c417-85b5-4626-34be-08db310c7853
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:49:43.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ihrOQlDney5bXtQ+n4SOiNtjcHwxZJIRbmbY8VjcoTKVQd3iAbW+qrk8Qi+YuIjn39dzUsKAPnkwF2AyhVEDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920

On 30.03.2023 12:41, Luca Fancellu wrote:
> 
> 
>> On 28 Mar 2023, at 11:14, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.03.2023 12:59, Luca Fancellu wrote:
>>> --- a/xen/arch/arm/arm64/sve.c
>>> +++ b/xen/arch/arm/arm64/sve.c
>>> @@ -124,3 +124,15 @@ int __init sve_parse_dom0_param(const char *str_begin, const char *str_end)
>>> {
>>>     return parse_integer("sve", str_begin, str_end, (int*)&opt_dom0_sve);
>>> }
>>> +
>>> +void sve_arch_cap_physinfo(uint32_t *arch_capabilities)
>>> +{
>>> +    if ( cpu_has_sve )
>>> +    {
>>> +        /* Vector length is divided by 128 to save some space */
>>> +        uint32_t sve_vl = MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>>> +                                    XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>>> +
>>> +        *arch_capabilities |= sve_vl;
>>> +    }
>>> +}
>>
>> I'm again wondering why a separate function is needed, when everything
>> that's needed is ...
>>
>>> --- a/xen/arch/arm/sysctl.c
>>> +++ b/xen/arch/arm/sysctl.c
>>> @@ -11,11 +11,14 @@
>>> #include <xen/lib.h>
>>> #include <xen/errno.h>
>>> #include <xen/hypercall.h>
>>> +#include <asm/arm64/sve.h>
>>
>> ... becoming available here for use ...
>>
>>> #include <public/sysctl.h>
>>>
>>> void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>> {
>>>     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
>>> +
>>> +    sve_arch_cap_physinfo(&pi->arch_capabilities);
>>
>> ... here. That would be even more so if, like suggested before,
>> get_sys_vl_len() returned 0 when !cpu_has_sve.
> 
> I’ve had a look on this, I can do everything In arch_do_physinfo if in xen/include/public/sysctl.h
> the XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK is protected by __aarch64__ or __arm__ .
> 
> Do you agree on that?

I don't see the connection, but guarding the #define in the public header
looks not only okay, but even desirable to me.

Jan

