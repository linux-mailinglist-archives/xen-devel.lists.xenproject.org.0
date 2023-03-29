Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45606CD67D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 11:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516135.799771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phS9u-0000pd-G4; Wed, 29 Mar 2023 09:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516135.799771; Wed, 29 Mar 2023 09:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phS9u-0000nC-Cn; Wed, 29 Mar 2023 09:31:58 +0000
Received: by outflank-mailman (input) for mailman id 516135;
 Wed, 29 Mar 2023 09:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phS9t-0000n6-Ay
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 09:31:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be497c5-ce14-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 11:31:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7538.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 09:31:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 09:31:51 +0000
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
X-Inumbo-ID: 8be497c5-ce14-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh7mXWbnEdEjkxN81y7gHqj3AiwUkIhP8bU4U+V3o6MQh14twzcCNg2Xx/6fi6qUEZtW2ZakzUqKzMzJNuSMOhuLoF+zmab2ZxXq2Vb5PGwPJ8TG1urpEKouyFs8RBYortmOI7mqTYQI4jbd/NmSzl8UotbIHqsbd5SvODGUr9MB/4+8FPMR3Gh2qxDjzuwhHhe0nCIRLYCRH3tKUBAQZRtP9Zcf70wUsGcfHVF4O/+ZkRFz53gIqA+wTTX4moUSa++RHGxCNAfVi/UG8tTyIIa/hr3YGPSzb+WMvSEsjUsK+LLY/RrkqQPsXgSEJBhZZcXptZc955qANkEVj5wG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76rYo/icGWXG1N9jUWEnrx+p2geu0sIqXAVpi5oXy6c=;
 b=TTSU9pdlAm+EzViynOwFwSgMHu1H3FGMdWjXukDa+RZBTsrdUHEw4Vsy+IenBznyOcDoerUg7p/5pmS4ouRXMr6AuAdd5UPJ65a/4egCo5lpJLKwulc8Bs9nvqIoHDClGX+W3919lIfCcoUbHVG7VkSskRQvqLcPC4sC5Qftfee97LR5y/HpaUH8JAnLjig+d9ApghN6TEFOfKltMZn9lL5+Jzt5gUgQ/d1KbFSKqjDr/kMjwpHXLS6KjnwfaknIjtR1AAWjr3YnIoew1zJ1c9E4jhFlnUDSPcRVNlyshQH/O0E7KeGQ8G6awaNK5rsaKhV+z05YKfz+m8FZBB4+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76rYo/icGWXG1N9jUWEnrx+p2geu0sIqXAVpi5oXy6c=;
 b=sDleq5XyS3FsUlCPqEi4NOwImFf80YYGFYRo1lWxFqBCJUBEllio8fXsjOuVVFtPitsliu+dX6U9J1uefs0uIuKt1cEVSdhraFNv52tmZcg8Tr2zTMOMxdw0IxCH71ZtG/Oa8qBl/H/5H4KU6sFiyTZ6XbDcXjcrDbXSo3EH2jbyfETU5gIOaboUVDxAzqrkEb58bZeNuVRaO2THePbj5yEIaslol983i82679LyS8P6p6mhxWmrolJxFRw5hJVqlGCxirCcgUgQHdK8w5Uva4goyN3BvpZwuIWwfUgcEAn9Tfk1kU1XUg4hEY+uklQZUslIIdYPO+OX83aXXpHn4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d18032c-9917-096e-e963-a20eabb75161@suse.com>
Date: Wed, 29 Mar 2023 11:31:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 5/6] vpci: use reference counter to protect vpci state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-6-volodymyr_babchuk@epam.com>
 <ZBQoLFz5T0G7p9Dm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBQoLFz5T0G7p9Dm@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d2675c-6d8c-46fb-7937-08db30386ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	48xPtGWsZQlHbB+q0SBkQj2HguE2hvTGY5fYmwMj9qAKzrnQ93kXu9PLZyE3Nzr819TWciew3l78r8jZKq1jaHJ0rBCX51wTumTqQouzhGGNN06WsAmXUggK0qMPvi9HQod6EZjB8UZXRxlPEz9Wc5LFF/+Mf/+5iqM1WxjGGmN4gKX8b6fxJeHsppz6FI5NxJ0uBKADdEZcIfgl4xw4gIOqlzB+H4UWPnaGzqW+/3/oZbiYO8LGysxK4iOPMEFRpGgEWH6ZwQB4aso/Jnihr4L1s7mkvHX9mFLj0TX2aTvDFeLJgu2L8JRl8XUwWbYmnfQn0yq8m6slcSPCm7EC5i3zpasDLMyw0yTAvgOX0FHNChFZC6Ks9XqSqYdXLQ8KXhgBePi37UpXZyEUmxV8lLHZ1w2LPwSlQI6kxxHqjUlTqqYcESlFVa5X7A1VhLGeUpv8OT6HqeSckBo0z6rbhVnHvdhP4X5XWr25iH0npDjKV+r3HRzqYUgihRAb4PKQDIPRdch5hRuxH1oOqHYdg5cd3Lump9IppB+c6hZvTDQgnkhjBfrGjlQQbQqTZdYBwaH5p04w8LiOJAC7ZdDmhKFuQ7614n0tzKcMWT710bD547lrxrNtezox14P4bWKAlpOS2kr/2uShR4GTmBYP6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199021)(36756003)(8936002)(2906002)(8676002)(31686004)(66556008)(66946007)(66476007)(316002)(110136005)(6486002)(5660300002)(4326008)(41300700001)(478600001)(6506007)(53546011)(186003)(6512007)(2616005)(83380400001)(26005)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk1QTy9wMmViSndqNHFBQlhFcDRxTFRPMDdIcGw0UGQxd3NIVFZNbUZJNEJV?=
 =?utf-8?B?MUxCaTlrQ203ZzE2WWNaTkhNeUVnZzcwNE9sSlc3ODJoYXB6T1kvV2ZaM1Np?=
 =?utf-8?B?S1U5b2p4ZHlVNGxYakFYYmV5RHFRWjh5OEZ2dHBZNlhOZWFvbFdZR2ttaGxR?=
 =?utf-8?B?ZUN1VVdla0ViQXhHZG93ZHpRcDB1TE1yaGwybHVmTFB2S204amRnQVJ6Mmdy?=
 =?utf-8?B?RjFzQU9SNG15RGEydzJzdjIwWklucUR1QndmcThURGtzTk9HSDdyU25EMUl1?=
 =?utf-8?B?OEJ4SXJESWRxNmpDMUx2NUVRWnRpd05zZ2xPdXU3OHlHQTgrbFpNUXF4K203?=
 =?utf-8?B?ZUgveHduQmU5MWt0c1BVR1N6U1hnM0FjSG5QYlZGSkdPdmNkWjhDZXFDd2dS?=
 =?utf-8?B?VUZxV3AzRUVxekVJRjQ1V0drMjlmdUl6cUxNdUp1eEJlUTBRemVUS2FnVjNi?=
 =?utf-8?B?eXNuWTd2TU92b2RFczVoRHdkN0NrNmFwZWczZi9ObklKZmpsZzNYNUxWdGNz?=
 =?utf-8?B?TkhNbFBINllaVHU5V2EyT0x0VHNzOTRPQWRiRkwxSjd2UmNyVmowemdpMjRJ?=
 =?utf-8?B?VDRQcGhkZGVvYkdtTVY2TVhCcStOSnZKenlJblpuOWRyeHlIV1ZHbmtPaTNa?=
 =?utf-8?B?SzAycjg5VldFMTVWS2dRVytGejkxWW1vaW5yMlhqL1Q0Nyt0YXVqWWxrSWlo?=
 =?utf-8?B?R1V6S0xqdWdNai9STVJacWtxZisvNEhGTHp0Qk1LdndvMVp0MDhBM1ZUTEx2?=
 =?utf-8?B?cDlHK0N2R29MK2QwVWlsZGQvMkFNZXQrS0dQbTF5Vnc3OXZudldJa0dOc1Vp?=
 =?utf-8?B?d2RJOVAvZGlHcnI4WXUwV1dTdHNHZDQ4dW05elJPQmRxd3NBckV6WlVqZEFT?=
 =?utf-8?B?dnNrNW1RclBDbVJ4VzA3K0dWWTRQMTI5eUZrVzdpajJJOUFVc0JLdjNWbW9Z?=
 =?utf-8?B?S1V3SjNES2ZtQjl1UjRXUTFmTVJad3lpRW9jWkpGUlp6NVRrcklKRWRQQktq?=
 =?utf-8?B?RGQ1VkY3SWQ0OG5WajlpYVpmRnJNY2lMTVVsRHRKVmRzM0tOclRXdXR6aDJB?=
 =?utf-8?B?UzVuYVdaejhRNUloQ1NYM0d4Rlo1c3R0Q3g1VGJhTVgydUhPNThKSVREVWcr?=
 =?utf-8?B?anhVWmo3NEdmTENtYzJrNlJod1FuT0s5TFBUbW5OaUVucnRrS00ySnZQSkVi?=
 =?utf-8?B?UFRjckFJOEFibzUwZU5yNzl4R21YSkVUM0tDb0diVnRXY2NFZkZaRXBsWFFh?=
 =?utf-8?B?ZnBxaDV0TmtsZ2l2M0s0U0NhRWNseld0SnN3Q0RHbDIwQ2QwYjVMaExwVFVx?=
 =?utf-8?B?MjZvaENuOE1KODUwTVhITmJYaXBneHBLWGhvUXVCbys3Skw1QlBCMmM3b0dM?=
 =?utf-8?B?OGd2VE9zMEY3dUFETVpyN2JiL3RPRXRCWW9kVlVHQ1VuUHRpdzV5MnlpNHJT?=
 =?utf-8?B?c2EzNzRLaDV1d2NNU0R1QU41T2ZHUEc5bzlsYnNKVEFGQjNYVFVabFQ4QkUz?=
 =?utf-8?B?VDJnQzVsbHV3T1RDRUV6dHRkMkZBdFQ1TGgxcVlCYTY4MFR5QnVxNGtLcWti?=
 =?utf-8?B?aTEwTDlzSzZkTlFsUXh6cXIvV2ZiSWNuTFBOYXlBTjhYejVZM0k3TDNhN2hn?=
 =?utf-8?B?U2wvWVcvSG5SZUJkbm52K1pQNmpyR004YkZyeEV6N1ZDcEx2TGtGa1JHVzlT?=
 =?utf-8?B?RkxCUTI2NEtadEFJUVpqN0hTakpNVndNdUNNSEt6V3RFZW5DQjRCbHk1bk9N?=
 =?utf-8?B?K0hVR0dNY2VUdGtnL1Z4ZjVZYVFWQTJPNlA4eVo0S2xKUTJYckxYeWx4UHpE?=
 =?utf-8?B?b3ROSnJjSDl0QzVDSjVxbTZWS2RYQzZPNEZWWlJET25SVUd1NEdvUW4zWlJh?=
 =?utf-8?B?dFRYNVA0UnZMN2hHbm9nSTRLK0VOUEFCZ1JpbDhQUFdBMmZPVjVvV1EyaXp4?=
 =?utf-8?B?Mjg0NlZudGRJeEt0T2JzQTRXSmJhMHB3WjNsa3FacFc1UmYxMDNxbVc0RWw1?=
 =?utf-8?B?aTlxWW95anEzVjRESGpyYXlNMWZFQi9ySm5tL3lCdmhMSDArQUVIeWI2WXhi?=
 =?utf-8?B?czhlby9iZmZJay94ZS92blBTODBwNEcyMFcxM1hodHZycDFWSFhlMHhNTENZ?=
 =?utf-8?Q?xpUtZ5jj87wH1Mfrsxgr0jvmm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d2675c-6d8c-46fb-7937-08db30386ce7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 09:31:51.0970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIVtKtqvNsnMTd3TF4oOUXTEQriaJSShB9cM7bL2RNPSQvvmRvo8t0NDXTvSH74DT1dbpoAjF7nmgAMZCZd4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7538

On 17.03.2023 09:43, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 08:56:30PM +0000, Volodymyr Babchuk wrote:
>> vPCI MMIO handlers are accessing pdevs without protecting this
>> access with pcidevs_{lock|unlock}. This is not a problem as of now
>> as these are only used by Dom0. But, towards vPCI is used also for
>> guests, we need to properly protect pdev and pdev->vpci from being
>> removed while still in use.
>>
>> For that use pdev reference counting.
> 
> I wonder whether vPCI does need to take another reference to the
> device.  This all stems from me not having it fully clear how the
> reference counting is supposed to be used for pdevs.
> 
> As mentioned in a previous patch, I would expect device assignation to
> take a reference, and hence vPCI won't need to take an extra refcount
> since vPCI can only be used once the device has been assigned to a
> domain, and hence already has at least an extra reference taken from
> the fact it's assigned to a domain.
> 
> If anything I would add an ASSERT(pdev->refcount > 1) or equivalent.

FWIW: +1

Jan

