Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777542A8C4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207481.363337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maK1v-0005yv-19; Tue, 12 Oct 2021 15:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207481.363337; Tue, 12 Oct 2021 15:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maK1u-0005wa-UF; Tue, 12 Oct 2021 15:49:26 +0000
Received: by outflank-mailman (input) for mailman id 207481;
 Tue, 12 Oct 2021 15:49:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maK1s-0005wU-V7
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:49:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f85e38fc-2b73-11ec-813c-12813bfff9fa;
 Tue, 12 Oct 2021 15:49:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-Unnj1PnNNVakk-TOr-Iw-g-1; Tue, 12 Oct 2021 17:49:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 15:49:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 15:49:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:20b:130::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 15:49:19 +0000
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
X-Inumbo-ID: f85e38fc-2b73-11ec-813c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634053762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8WZ82IlWMAXJKyhCrciJUxbLB/jlI/lyslnFBdBxA4=;
	b=X/x9kNFCrVPRZAFlP8bVwpbzyski2G10hujn0tS2jZw65sUiB44q8Yc5Ws2pFIj9LLIUj9
	B1x6OGiIzu89KC5oEjJzjlrEfyLWzqqD9cy0zUyZBe/ztUENLiyzBwP8s9J2Q8Vr0KVHlK
	wTG2v1Xp1uIIDtq9JhCSwA6b5k/Y1Lo=
X-MC-Unique: Unnj1PnNNVakk-TOr-Iw-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBES8Y8yt+IBwJ9GFVX5FvQxDE18yQIVLSyD5I75r3OER90Zz/wIOj09uED4Ud5snU855zdErpWjNcJfmZUAFf6fz63dZFuJ5WDZWavsGWhXSukXbya/jSf9vC/5uy8V88fotqkJtXQ92tinRkYmsSh63ysO3oMbUReW4sxQAWuPUsojsQQ+r7EWBSmO8doxCL0+c9qC8t0wMHnqPLPT10oC7SIjMEyN0Z2wYLQqI1dDIRrVggvO4sKtrUc0JUzRMyjm4lW6SewJ5Oa3FyyaoxKvD/CnNElnEex2qAejIu4KD2Z5vJ+fe/D2n7P+vx5ALHq3aFkMV+CPlnp+N6DGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8WZ82IlWMAXJKyhCrciJUxbLB/jlI/lyslnFBdBxA4=;
 b=fpe3joyn/3l2+Qh4HLGLRvNUdxWU97Ln9jsPteEFJmZI0PJH0bD7095oC8rHaVrbwYaugr32wbdAAgt5n17uoy1wnPKNn+4TsOMTcfy4jmMTQxmUA8pnwNtNmNNaG4S8Mf8ixXzNosasmktfHqrvOTb1QelQ4th5t04cuH08W0nuxc3lX3VudglMBKKAN0AjRESwOEStj5hK/HPdn/0xQpkeWKTJIDnBakzWDtc7TwZBiE2ds99ZThqpntV0oFfBxm/DlL6Kt8q1XIAHytsHJlXoezuTtZL7I2c0TdGpSSqqkIqSVS8Y7j1ZGJqOjSrcJxnvdf1eP7lGYX0O0KCdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH xen 2/2] xen: update system time immediately when
 VCPUOP_register_vcpu_info
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com, xen-devel@lists.xenproject.org
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-3-dongli.zhang@oracle.com>
 <317163fa-f736-ccfe-40d4-b918ce2834f9@suse.com>
 <3e16648f-088d-5f62-03d7-ca744e913cbb@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b31045b-dbb0-3ca1-074e-a12107b09159@suse.com>
Date: Tue, 12 Oct 2021 17:49:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3e16648f-088d-5f62-03d7-ca744e913cbb@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96214f0c-b509-432f-13d0-08d98d97db08
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349E1228CAE1BA8F5E11412B3B69@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZTU6FLLIY0ddQgH6KFAEYUMUHNMlxkSJDXHYWFCTGw+2mrwt3GqM7+TTQ++KfCTD5gAfX0SUvKlWG5ahiaWpFDQnJZd9xKY9sukOrnRudObJhZ/scn3lhiEPpbPHDZUS2Gshbn8SD9S2/1iUv4lMDS9UdzMrhyoEma+/yhqPON6j09aQg16Wv94+6tKyVR4w0nu4ooCWvdl0nR0+6zS982rvMs+EUAIIV8CqlJ4uLu5E0+tyv9yBZKbrEhg1kvMnY7ZAVwqS5kdQt9auY5bZmkj0D3mdy58Js9+Kh4DXqBlmfHKwhTtW4ipTNnLCLbO3vL5SVC50st5z9SjDvHjl7/dRUf0WmfFbSoE44XIEb+IxDg4HxJYp9a2EhSndvJxC9g2SmBe+pGqZHWoAGt3EYq5ll+Pp3qsAjFBk1JmcFMU9Gndh0RQXd6wXd12IJ0SZfeBSuQ5Kr5NPbnxVTlCctrhFZDckK8xqcuzmrXDtkpQqDZgj1kLkyk0j9aip6TgI8P93GNZTnE1x7mP+AtNOi+Zz5n/pJ7A9ey6ooWqe5/rq4n7SGG1l2ndOzKziRgMQ3LPgdKp5pXC5R4ZX38J9eYPcWs/TxZS2vlX+s1iaVjlbupoQSjKvv0iZfljb/HgiUVM0mYYC1azl4LE+yx+09ub+b6PC1SOuAyBY/a781SiAZ4RgcMURDj1MfyfVY4B9uxbV2v54vkihNwbY/bvZPGoN3rY/UOVL/hsfocMJd1/VuQge6PDRIGDCn26XiH5dwLjqFEfQIPCbpON2XOEMNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(956004)(8936002)(15650500001)(508600001)(5660300002)(6916009)(2616005)(66556008)(6486002)(16576012)(36756003)(26005)(31686004)(66946007)(66476007)(31696002)(38100700002)(53546011)(8676002)(83380400001)(316002)(4326008)(86362001)(2906002)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzYyaEFsekVvSGRZRUNCSlFjTnpQRWl2Y2J6TVBpclZtRHhyeC9mUnR4S2ds?=
 =?utf-8?B?TTBIV0lMRkVwczdDNTVpQ0tIUm5FUytnNUxXSjJpY0lmUFZnc3FXVm5DQUh4?=
 =?utf-8?B?TXJoOXJTN2JlVHZaaVYvNXlnNnluaDRIM2h0Z1I2UVNHdUZZVVRURGQyNStH?=
 =?utf-8?B?MWE1MmdOeW1YUElkWUhpT3hVcWtqVzkvTjNibjNyZEowa1BWcnZOelRuZ1Qz?=
 =?utf-8?B?OXF5Yk12QU43K0hCVXJxR2JGNkFmUXVBSXhpYzFNYzdGVDNlRVRSOHljR0o3?=
 =?utf-8?B?WElDUVhPbUVWZmZQNkVPMTJMYUhGZ2xURmdnV3c1V1haN3JUMVhCQ2Z5SDR1?=
 =?utf-8?B?RHlaT3ROZ25pbkdtcXd6aG1lREFzbzk1YnJsenpRdXpBdUhlaDhueXhHbnh2?=
 =?utf-8?B?c1o4U0dWMVppZzB1ZHhnTEFCRm9hcTk3MlZ1U2ZZRHo5M282enlkelcyRGNJ?=
 =?utf-8?B?dDNQVDEvUGFBQ2xYSENYTStwVDJNRlhTWWQ5alNFd1I2MUlyeXl5ZHVUS282?=
 =?utf-8?B?YlRhVC9xNDA4aHpwNzZmaFBtdndKbjE2bDBZM01mNHFSTXVKR1hYNmxKS3J1?=
 =?utf-8?B?NUk2VEZZU0hiWGJHaDFrSHZmQy9adUViUHk1a28wdWhkb1ovQm9HYksya2Fs?=
 =?utf-8?B?RkYvK0E4d2ZNV0JmYzc0S0tEUEI3U2ZOcGlyNXVXOFE1YktlUXFQM2xqQXBj?=
 =?utf-8?B?eGNVbGl2elVyNU5QWVg0bXpKYkF3RStqQTl3WFVDOXF2RlhPQWdsdE5SbFJI?=
 =?utf-8?B?NjNsekI1VzkrdzlGMTNDSVN6bjNKTDBmM0MvTVdlalFCWFdiR3JYVzRPaHJp?=
 =?utf-8?B?VHQ0VmNhVmNqRjNPREhhOGhLcjdiT0xDZklsMkR0dmNNSUtrcE1kYVV3QklG?=
 =?utf-8?B?K2QrZU9nRkt6SkhjTEJLUzN3YmpWYjlnT0RkM1NHNHhwMVFwTmVuQXcxVDdD?=
 =?utf-8?B?YTRVVDhHV0d6UmNsM3dzYmExbTlhdUZueGRkWkVTeUVJV2FhUXJuVE5HZjYx?=
 =?utf-8?B?SWxlVTVPdzBzTWx3MWRPQ0xjQ3JZWVFwbHV4QWJYcWVpZFplYVVSTWxrUkdo?=
 =?utf-8?B?NkJTMUxjUU8zWm01bWFMcnUzcFNnazF2ZG1xa2VEai9Qc0lHcUo5eE1UaGdO?=
 =?utf-8?B?OXJNODVrNmNTSEFvbGVoRGRSVEVlTXZzYVJlMy9iNjM1Ymg0dnRJQzQrMlZn?=
 =?utf-8?B?d2g3NFlWMFZ6Z1Yzc3BMaTAraFpTdWJPYmZUZXA0Zm9RbGNta1VGNUtDUktx?=
 =?utf-8?B?WGd6OUswc1VnTVpoVUxMdlFFamJXTHArRWVTS010VG51cm4vR3h4Z1Q1dS9j?=
 =?utf-8?B?eUVIYzBaTUg0VkFzT2RNeUIxcG9UR3kyOHN3ZzRUbjkvS0VQcmhQL3NqaFpL?=
 =?utf-8?B?NUlad2RYKzZaSkJ6bnI0TVd0ZHd0dTlFT0VwZzRZSllUSExFdktOdHA3QlVV?=
 =?utf-8?B?K25keWsxRHgxeDRRQmVVY2VyYjV6M3NMc2IzZXhQeWJRVCtxQzRac2FSa2FI?=
 =?utf-8?B?eFZtVk1TVm1sQmUxbi9HelZLSEVtdlpYQVJhWGp3WjF1WGRITzNEeElxVTZa?=
 =?utf-8?B?bUtNUDNibHErYURsaHRJMVZ3aUtod1Q3SXlMaUlDMWhnbzFud1M2NGtnY20r?=
 =?utf-8?B?aWQ5eGhNSko4dkJSdW1EcVp5emJYbUlvSWNydE9ncVg0TGNTM3ZRNXp1cTFK?=
 =?utf-8?B?TkN1clhCWFJEYTZOOThRWE9LTVc2TXhveTg4YnZLYWFyK2dlZWFtSHJOdmpB?=
 =?utf-8?Q?UFz4XNHZYlOb2nznf419NOltmHgT57A8PnQH0oD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96214f0c-b509-432f-13d0-08d98d97db08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 15:49:20.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCe2/F5V+XNOX39KmzVNKlL1gWttKGGYyKcn/miSPPvIC9rBoTrGxdAEp0wR27wN9ntQs0ZH6X3SKuAmWM+l/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 12.10.2021 17:43, Dongli Zhang wrote:
> Hi Jan,
> 
> On 10/12/21 1:40 AM, Jan Beulich wrote:
>> On 12.10.2021 09:24, Dongli Zhang wrote:
>>> The guest may access the pv vcpu_time_info immediately after
>>> VCPUOP_register_vcpu_info. This is to borrow the idea of
>>> VCPUOP_register_vcpu_time_memory_area, where the
>>> force_update_vcpu_system_time() is called immediately when the new memory
>>> area is registered.
>>>
>>> Otherwise, we may observe clock drift at the VM side if the VM accesses
>>> the clocksource immediately after VCPUOP_register_vcpu_info().
>>>
>>> Cc: Joe Jin <joe.jin@oracle.com>
>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>
>> While I agree with the change in principle, ...
>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1695,6 +1695,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          rc = map_vcpu_info(v, info.mfn, info.offset);
>>>          domain_unlock(d);
>>>  
>>> +        force_update_vcpu_system_time(v);
>>
>> ... I'm afraid you're breaking the Arm build here. Arm will first need
>> to gain this function.
>>
> 
> Since I am not familiar with the Xen ARM, would you please let me your
> suggestion if I just leave ARM as TODO to the ARM developers to verify
> and implement force_update_vcpu_system_time()?

I'd much prefer to avoid this. I don't think the function can be that
difficult to introduce. And I'm sure the Arm maintainers will apply
extra care during review if you point out that you weren't able to
actually test this.

Jan

> I have tested that the below can build with arm64/aarch64.
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 40d67ec342..644c65ecd3 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1695,6 +1695,13 @@ long do_vcpu_op(int cmd, unsigned int vcpuid,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = map_vcpu_info(v, info.mfn, info.offset);
>          domain_unlock(d);
> 
> +#ifdef CONFIG_X86
> +        /*
> +         * TODO: ARM does not have force_update_vcpu_system_time().
> +         */
> +        force_update_vcpu_system_time(v);
> +#endif
> +
>          break;
>      }
> 
> 
> 
> Thank you very much!
> 
> Dongli Zhang
> 


