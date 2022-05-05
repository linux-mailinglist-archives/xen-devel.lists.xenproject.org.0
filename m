Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E897251BE9F
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 13:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322038.543232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nma5R-0007wU-Ar; Thu, 05 May 2022 11:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322038.543232; Thu, 05 May 2022 11:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nma5R-0007uN-7e; Thu, 05 May 2022 11:56:01 +0000
Received: by outflank-mailman (input) for mailman id 322038;
 Thu, 05 May 2022 11:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nma5P-0007uH-GS
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 11:55:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 534ab6a7-cc6a-11ec-a406-831a346695d4;
 Thu, 05 May 2022 13:55:58 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-FqL5NIvaM_ysMoI83ygxAA-1; Thu, 05 May 2022 13:55:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7681.eurprd04.prod.outlook.com (2603:10a6:20b:286::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 11:55:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 11:55:53 +0000
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
X-Inumbo-ID: 534ab6a7-cc6a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651751757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ip9NLDbIkinEk8L3v7zxIbR5eNjq31A39HEQEZfsmA=;
	b=ACDR6jCC5CzpflV94obtFwXYGEoqm4c7UVXhwCasH7vKbotYNS0wKGsPrQwYT+kDBj6i/0
	6VXmLL/o/RXxzAsJFbi3iHq8gTSIiFfeCC2BZa/vZNouvobzI/ueUqXRfuA0eh8WsMZiy+
	zps9YhhraTxbZ0Uazc4llu8REA1PPSw=
X-MC-Unique: FqL5NIvaM_ysMoI83ygxAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B31V0Fw5uzWM/PQeOgp6v8uNJezWqvCSWr8GEFDTJ+0cHmHxFjXn6nmckA8c9KBNEKlXbG7DGDQoqNgGvszfj8RkqtPU/mvLiE81dPEm2AtLXTJabY+SF9OtdGaDYf5YDtXFsYQYlILflDtJaBsHsih9C04J3x/5jNU0M4/7h26g75JGAq+VE7qG/dT2W4YTES/zWOM6GEMlN2a5NSH8j7Q08hqLMnXbwH/pKuOmvanCQySlFWyd0kEEuEVvJN0MMqr29y5RvulXvbUCfY+7+pys+w8x6cpPR6729sQ2sL3x1Wm7Q5NUpFHOjvPbvEdjA/3HU4nvO5Y5NY1mchBRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ip9NLDbIkinEk8L3v7zxIbR5eNjq31A39HEQEZfsmA=;
 b=n6Yamit5blYAEGNIuAGrMqJalTCYDZIMB0JRGsN936dt0/F9dqrsiRFgwv3mf3JKfrRRW05YQ6F0MX9//1k2yvL89TfoPhrXMXUhEsRoA8crGnqcYPvokt2o+23q0yPOvb3gHnRG9z8SyCsXrjQ75eY+ZTOoZX7Vxp4TDcETP2nhM5pqAdW2rxjUiYFyQ83DSAPsHL0fH5NhkM+i7tXyrRLOOAhVfXCa0Cqn2xIHT1BEqEt5xl0CxaH6FO1aobUJUOkWDqD2AkGsY5qB6YRcC+N7QLhI2nlSHBJsicIjuknEbtOyr9egt9beSaK12MC6GOcBWig5LaI9INAXIs+Y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d15e279f-fb99-6d86-8eac-8385ee24723d@suse.com>
Date: Thu, 5 May 2022 13:55:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-3-michal.orzel@arm.com>
 <0bf31f91-9a05-ac91-a258-d28d6ad9084d@suse.com>
 <77ba649d-89b6-8a15-191f-6e4261b7e381@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <77ba649d-89b6-8a15-191f-6e4261b7e381@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0342.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cac7665-79ab-4349-397f-08da2e8e34bc
X-MS-TrafficTypeDiagnostic: AM9PR04MB7681:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB76814CFB7D3DDBB4B3E326FEB3C29@AM9PR04MB7681.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zi/d7lI7QtCaY82eJveLZyPeksfxXsC1Slx7iFgKIpsgbilNdYYttWJ+gb5/7OA2BE/fqv+8oy6kRPKN5/ZLTPtMjZq5oBbM4aCpFk32cfPzkkJtAonMuMV+a+PxuBmX7wvBpGov5I02exaVaab02mU3Ndqvy2Nkq2I11WCyvYzZeGnXfyPx09aFdgILbs3X6QHyf4wT2ge+fzXpGE78u2ArVKdJOCQ7Q3ulZqinn6DgU2vMip744bXFm71BKwbFgVQlHFjRuSJizz/RjpTD0bVpp5b4tqJ9HWhWx5clulNzm1S6z5e46BeFuKw1DGbDXdOtX/S+59eR7TZCaRUxbRdVLORKUs6TGDWZfSyVWz+OwlwYr7n5Hbk+Ny+94YUJAxkpNAJT0VdSuiJmCTc0yFoKIhOu9j0goLVetU377uYjj4GF5tmSqYGKSiwWfMl/kpPL9k4AseNLUlDo7OGzKEqm9HO65YTJhkl4qlwoqb8by2HSWuVNtyRzYtnro9+oLglv1tjWpjuuizRUP/4qLQZsDt61pos/8+lVAKaY5IjdFCOfWK28NT2dOWsGQ0ctol9qb/SinO52+wmmkmdO/YwysFDWSViCD5F+Y+J146a6HsnP68knibas5G++lDHDfdN53b8Rl/lZS+mtv4w33GWzYI01XssHndyrgRj7SpommdpPMvxSdjGcx6figwZ9D9TittedlQp+T/86EBcTH0u1ZFwWfPdYntC0hFsT694=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(38100700002)(8936002)(508600001)(6916009)(54906003)(6486002)(53546011)(2616005)(2906002)(86362001)(31696002)(8676002)(31686004)(26005)(6506007)(4326008)(36756003)(6512007)(5660300002)(66946007)(66476007)(186003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHArVkNKcXhJRTFzbjdWUFJ0dUx2QXZmdWFaemVabGNUVzc1K21JWUlua25o?=
 =?utf-8?B?NktiSFVBWEJCVXhmTEtEZW1iY2cvZTBnQ21vYzdLZXV4eVMvQ0NmTFNTOU5a?=
 =?utf-8?B?ZU5UMC8wTG9vaDFtUmRWbUM4TzJzbklrNUtSUXkyT0VTUDlibmlsSHZVdEtw?=
 =?utf-8?B?OXZsS0x1REE1VzNuWm8yVzUydDhXNHNoSkJScjFMRm90RjhkUGdMSndRaURF?=
 =?utf-8?B?enR3NytzZjVNcVp6anp6WmVpUjRPR1ZHbUlFb1VLNDZwbndWbFBnSE9mYWIv?=
 =?utf-8?B?OVF5bVdFSUxOckw4RTZhMXEvZnVBakljcDFoWmVRQ21VbEZPekN6ZkxkdGhO?=
 =?utf-8?B?YmwzWGVybWM0VU1pZjB5UzZCUzhjRzFjTlVveTVVRXFUK3FhNUdGK28xdWVX?=
 =?utf-8?B?RkorbU9MOEp0NnA4ZTE2S1BHeTluUi9YT0dQbkxCOGJoTldYTWUzQjB3UkNS?=
 =?utf-8?B?UUZOZWRHYk5mN3hNQXF3LzFzVmk0cFlmdUJ2ZkVYM2RCTjM5QkFyQTRONG5E?=
 =?utf-8?B?QmNkZmlIeXZEMzM0TEJpNytTU3I4ZUxmYmt4YjVmU2VjcVc4MnJsQWVkd0VB?=
 =?utf-8?B?Q3hGR3RxUEVvRTJNTWRxSnF4U3libERHTEVTUUYvOVVQVW44WlBNUVZFLyt3?=
 =?utf-8?B?SlZyV3JCSDhmSHpQWktiQ1kzL1RWeDdqMEFEc1A1RTRlUWczMlpONWFwSVJu?=
 =?utf-8?B?UHlLSkxWUXNwYXlndnlJRStvMHo1VEVqaWhIb256L21DWWplbi9MemxOb1Ry?=
 =?utf-8?B?aS83VEE3ME9XTGcyQ2F1d0ZVVS9LZmdLbGlnVDk5akcxUHhWektjbzl1K1A0?=
 =?utf-8?B?eVlaUjBnQWJjNVZELzN6TGJXdjg1STl3Wm12Y2tNVEFkQk9KcGFUM3lobWhY?=
 =?utf-8?B?N1AzMjZ2UHY5ak9rbVVheXhsNjN0NThKTE9Ud25jOHBpd29DWnN2MDJMc3dr?=
 =?utf-8?B?d3ZLeWcxbjJMVmh1ZGN3dUVtN1pLVlpwNmdGd0FNMktHdUlVQ1dTcXZxdkM1?=
 =?utf-8?B?b1Mxb3NMKzBHb2dvRHdzb2R3UXJFeVVDOHpFWWhTTmVnMkZYcGpEY2t3ZGVa?=
 =?utf-8?B?SVBaVDNjWTRvTUMwNEU4MkdVTUNQSWRWSEJNdEpUWUIwdTR4TE9iQWpvejd4?=
 =?utf-8?B?ZUdqSE1abjE1eHpRdkplUzVTdzl3R1duQmJRY282ZzNxMkNlZjUvU1I0Q0JJ?=
 =?utf-8?B?RldSTVFuemNDb2tqK0VkV1B3YU51Z2h1ZmhGOG5QVVQvWHRPeHhQa0RSb0Nu?=
 =?utf-8?B?TTB2ZTdtNFFuWGgvdVRSZDVES0xVUVhjclMvZDMzZTNKWWw0NVpnTkY0V2RY?=
 =?utf-8?B?bFo3V1V4S2lwai9SNjJ4dEdCTC84cXdJTzNyT1hFYnRGTEd3Wk1KR3dOcHdW?=
 =?utf-8?B?bi9UdlVDTkZLMVJiaU1qRWdHRW94VnVWR0tKRWliU2RsZHN1akVVNEFsK2xu?=
 =?utf-8?B?NHpuNjRUK2VVcVVsc000SEpHa3MzSVNvbU9VbWkzZGRtQ3B5T3pIb2dFWEFV?=
 =?utf-8?B?eEM1WDJZNlNCYWRKYk9MVHRTM2FYWkg1K1hmNWUxVGQ1dzVta2JKbUxZamJi?=
 =?utf-8?B?WGRsZzlESjRFVVdBNkVMNGJqYUJBUUM2ZDBLU2FSczQrRFJFWDdJNU0wTkho?=
 =?utf-8?B?OWhyUnEwc01ZSm9pc2thb0cvaFV4SU5OVFJGZGNGbkVsNFMvL3lSZG9kQXI0?=
 =?utf-8?B?ZDBvekY1NzBqWnQ1aEEyN01aUmdaUFc2dDZXczlVS04ydWZRQmtBQ1o5QWFF?=
 =?utf-8?B?RFJQN0dSLzRhcndRTEUzS3kwYVNKL3RjWVhXSUxJbUs0eEZ2RlpUdGl2Si9o?=
 =?utf-8?B?dnExKzhqUERkTDdWYWZDaHEzVXlkK2dwUzd6QVhGb0o0RXY2aGdJN0xocDQ0?=
 =?utf-8?B?eWZvVHBXTDBFYkJyYitxVlRndUlQdG1neFNsLzNJTHhHYTJES0xRenBXKy9L?=
 =?utf-8?B?dWxvTUoxUk95TzgvVUFIM0svVGpTekF0QnpyZGFwWms2VWxVWmExbEdXTGlu?=
 =?utf-8?B?cHNHRDRPQmV2bjdoS2NDbUJNTGtqY0cvV084a3JKbG9iajJ0ZWh5OWZnNEJI?=
 =?utf-8?B?K1dXZHRWSWhka1pTcWhPUzgyeFY5RGRuVWdnZmkwa3Q1UjFSUm5pL2I2NHlw?=
 =?utf-8?B?Q1FCbHpMSEE1WmV4UzhNb25kZHBuc2haRlhJZnRST3BBMEhyMm4zV1IzcjhQ?=
 =?utf-8?B?Z3VUdk5zMVpRMk04Z2RKV29HSDdNU2dZeElnaTgzWFBBQUNkS2FnWlNKdGlY?=
 =?utf-8?B?OXUycG1iRVpDMVVjakNTbDZ0Q0VnR1NMcWJFTnZMVmZSdlByQ09ZeWlWSGgr?=
 =?utf-8?B?SXRTbWJ1am1jQ0daQUhuVC9oRzJHdGg5Y1lhUkcySURMcWkrZzRuUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cac7665-79ab-4349-397f-08da2e8e34bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 11:55:53.2893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69KQBt+lnvnHAyAyotJz1/FHAM+xnZblQ0M0gqEKpiXdncUR0YE89FdnkNh0v1fm0yLiNDeq9v3WCkBQnxEydg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681

On 05.05.2022 13:25, Michal Orzel wrote:
> On 05.05.2022 13:20, Jan Beulich wrote:
>> On 05.05.2022 12:36, Michal Orzel wrote:
>>> Modify macros to evaluate all the arguments and make sure the arguments
>>> are evaluated only once. While doing so, use typeof for basic types
>>> and use const qualifier when applicable.
>>
>> Why only for basic types? To take an example, passing void * into
>> gnttab_need_iommu_mapping() would imo also better not work.
>>
> Just by looking at the majority of macros in Xen, typeof is used mostly for basic data types.
> Also I think it is better to explictly use a struct type for better readability.
> Otherwise one need to search in other files, to what type does typeof evaluates.
> 
>>> @@ -98,13 +104,36 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>  })
>>>  
>>>  #define gnttab_shared_gfn(d, t, i)                                       \
>>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>>> +    ({                                                                   \
>>> +        const struct domain *d_ = (d);                                   \
>>> +        const struct grant_table *t_ = (t);                              \
>>> +        const typeof(i) i_ = (i);                                        \
>>> +                                                                         \
>>> +        if ( d_ != NULL )                                                \
>>> +            ASSERT(d_->grant_table == t_);                               \
>>
>> I'm puzzled by this NULL check (and the similar instance further down):
>> Are you suggesting NULL can legitimately come into here? If not, maybe
>> better ASSERT(d_ && d_->grant_table == t_)?
>>
> Example:
> NULL is coming explictly from macro gnttab_get_frame_gfn right above gnttab_shared_gfn.

Hmm, that's pretty odd (and Arm specific). Just like with the other remark
above, it'll be the Arm maintainers to judge, but here I think the NULLs
would better be done away with, by introducing intermediate macros, e.g.

#define gnttab_shared_gfn_(t, i) ...

#define gnttab_shared_gfn(d, t, i) ({                                  \
    const typeof(t) t_ = (t);                                          \
    ASSERT((d)->grant_table == t_);                                    \
    gnttab_shared_gfn_(t_, i);                                         \
})

#define gnttab_get_frame_gfn(gt, st, idx) ({                           \
   (st) ? gnttab_status_gfn_(gt, idx)                                  \
        : gnttab_shared_gfn_(gt, idx);                                 \
})

Jan


