Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A065080DD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308824.524645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3ZP-0003mM-Av; Wed, 20 Apr 2022 06:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308824.524645; Wed, 20 Apr 2022 06:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3ZP-0003jl-7w; Wed, 20 Apr 2022 06:12:07 +0000
Received: by outflank-mailman (input) for mailman id 308824;
 Wed, 20 Apr 2022 06:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh3ZN-0003jM-So
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:12:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc322893-c070-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 08:12:03 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-eZEyROo-MTaFLwYuf6fF5g-1; Wed, 20 Apr 2022 08:11:59 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 06:11:57 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 06:11:57 +0000
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
X-Inumbo-ID: cc322893-c070-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650435123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6nTPjwHlcOinJr9lFEiEJx8Z1LsrJ2xWRznUplycrs=;
	b=Z10775Na5CiHav2NCgJw9zIXYmciK1YcDNtA79CC58IA5LJT+rhbhcJ8kwqra2sCMadzOd
	1zKfGzvScd56vKGORiVxpz/QOnu3URd6Bu3QmgsKPol08SJ3Z3evhGxw1jaJ89Sp3QzeYn
	FYByCtuH6ta3loPyDzg6wWiDuV3tMEs=
X-MC-Unique: eZEyROo-MTaFLwYuf6fF5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DT/XaOV6qTlV0fRD/4ycZGR5AQ+r8cUwB+q+aba1FGVWKUXQO/lslqgP1XvTL7ZkWW4zYQhLEnwkAFLlGZ7u9EhtLokLP9DNHiVx8E3lT119cznGc6fm+Y/Ui9of+Opsx6+Yon3sZbf1isGrKrmESVMvxZRMWSvGDSTD7Vqyu1mou3/jkd7Y/oTs3XwrLup6YV5bKuZ50ZelXw9UsaQ4umfzGoiaeJqcRaRzB8susKUkWaRSEIaZTuAVo9QsUHuZ2oe5Of4k3tcIydKPRY4HlX5uOP1fV5Zx85f5uMdMflpMEB1DOTMqCt9rNKoB0yie0I4bBTPUUp51SHy04u+15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6nTPjwHlcOinJr9lFEiEJx8Z1LsrJ2xWRznUplycrs=;
 b=lw6BUj1TxyhsYS60o0Sh6BHtsqjjbT3U8Yb7uEUEJ3JHRJQd6GCD30E/awJPXQb+iHJiflmQ3fSvhkvyUPP49WdEPWg5wzgbx8IhHSRL23G7bQOyDDJKc+pRKjfmWBaQPm/L5fHOU+IpZXl9+JjckQeN37zBM4cMCyOFDyw5gzI0WmpAZJC0iOr29DniDaCPKTivkxN6j55zImqUUF/Zb/LOllGVqzw23THytPRK7WhyURhlu5ijRa72wTGKic3NWhI3AiOA0VrcHf6k4YJFFvd6vJF+tF0WnZe+aXvOU/xEpxT8SqBwM7CjO7Z4d+/F0A/lCV4t2fY0+h37FprAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
Date: Wed, 20 Apr 2022 08:11:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220420055736.27901-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420055736.27901-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71bef4b3-5d9e-4a59-9b2b-08da2294ac4d
X-MS-TrafficTypeDiagnostic: AM9PR04MB8081:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8081F07DBEBC4E5C911467D5B3F59@AM9PR04MB8081.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6LH/pL75ofltKiGr49TZW9Yv5Dr6vTazEHcoXBqox7wm4TC3/pBPJUpclZXph29wKX1G+Y3HF02KBxyZgyJZ0QBF6no2t9XLo3l/mB8dL0SnzWis58kMCltjAWcvnZr0Utll60cotHl7jq76/ravYTYoPLHxOjBZPVRlu7Y6h8b/oc1pxxVvh7NA9lu7frwoLwlEzY50HzauNN5YJ9DM4PNgl2jX8rHEUACdGtESpkqxSvmJf6Qbg3K4Mi+QZfqL7ri3GDn8CHejxrn3uHqfhM/wg/pmu29riStoslHaZ4SPgQdDAn1nm8gHk6wp6qb9tiNw0c4L2SeRoPss6xO8qE0OYcGBIZpGHKknuhTvzhUOk+Wh6Wtf9of72jRDfCDZG3YdMK2SubqB6VLOH6oZFJwzSZQfwuaWHcclaqChDEFUI5/+Zuoy3Nd+PVEZTaJJHLo0g5YBWZexHmXEdBx+ZbfxHPc2Zj71248SNkQpHvYsLotZFYHgho6K1eYzK55XheDrYLq/jkoH5TIxMq31rR/eZlId224g/CBDRZ42ld635VQ8tnxPIvlpEZH2jF2MTVmwgaZh6srm7/8NGR6BGB3HUJ6wuXXwWXT9HwAGW5Fa3Yy6FTzOP6Q6dsvGjO/46Vq2UCGulB7a3OQIddaWAozaD33/jC54eC3eWYEFnvVseOf8YP181ZJtRfjW33wsWFllNcJa0lLysS3tDbfJ01f5yAvzfNAyHgLlLpRyNiE+raqVhQoejiKuRARilFr8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8936002)(316002)(86362001)(5660300002)(31696002)(6862004)(37006003)(6636002)(4326008)(66946007)(66476007)(66556008)(54906003)(6512007)(6506007)(8676002)(7416002)(2616005)(186003)(53546011)(26005)(508600001)(6486002)(2906002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTNKNmdGOVZIYk5kcWxVN3V0UWJxYkZsazhlZ2JibDhwdHBhbVhoZ1o1bmdQ?=
 =?utf-8?B?RC91VWowMENnZTE3d1FBaTNsNzg3RXNGd01DMytDSVJ0bmhzVVVWcklSZGFx?=
 =?utf-8?B?RU0zR3A1Ung4WHdMZTRTTnZ2dVl2NlZvT0tJQXcxNFJOYXo5WmxrdTNCYnpC?=
 =?utf-8?B?OVZoRkVFSXQxckZLMktwVjZ3KzcrQzhZaDZPZ0E5VVVkMS9vRkZZemM4Njd2?=
 =?utf-8?B?YnFBaERFMkJBVnpYYURNZmwxaWJ5cHA1RE9XcGwrNlJDeUpHaWJsN21sVDlY?=
 =?utf-8?B?Y1paZUIwc1BDWXpCSFhXTWRoQ291ZmdYQWZZSXJUOHBKVzl3emNyWGFUdEVK?=
 =?utf-8?B?SzVCblBmTzNoVVM4aDlFZUNBamZlSTFXVk8zNFE4OGZ4OTVpTkRpL3dHdWF6?=
 =?utf-8?B?MWh0ak1MT3NIaHdBVFRnYysxNlR2TUNicmpVeFpBdVRaelhNRE1vbE55Rnlp?=
 =?utf-8?B?cDhHVFFMbjVVUy9OZm5mSzhveWRKNXc4M1ZlSkpldmpiODFHcFNaN2VKRkph?=
 =?utf-8?B?VFVUWUVmZjZVSUxwUmQrTDhpU0t3S0FZdVVqZDJUeWMxZmdvdkdBWVVFY25r?=
 =?utf-8?B?WTZheFNXdi9KYittRXhOc09wWXBBeWxVaGU3UGw4NFVhVEZXZVcySWJQVkk2?=
 =?utf-8?B?UlRLYzA4aGU1T1YwcUxkT0xhclRuVGpNZEVuUFdCbkpieDNDMkVPVEVaL0pl?=
 =?utf-8?B?QmFRMjJTb2pyUFBGS0xFWTBoK2x1NjlNZi9hZVFaSGJKdm5hdVRtdU81LzdB?=
 =?utf-8?B?NklqeXluSmlXQUlrWGdIZkdEREwxdTFsWXZOeE1RRzFpVUZSck1YbDlIeDRw?=
 =?utf-8?B?VGIxYkZZRklmZGRtZzNCa0RmTkNzblR2UXlnUnlPYjlrbE1xR0ZLQXNYOTkr?=
 =?utf-8?B?WmN0anlmOFBsdXdQbmZmc1dGS0xjbDg0SUNZcnZYQlhQNjFaYmlaUXpkUzNz?=
 =?utf-8?B?UksxYis3RWU5b1ErUzhucWMyZklaUUJvMnNvWWRUVGtGbElhTDlhNDVSbUdq?=
 =?utf-8?B?UVVTK1hvQlFaTjZTbEgzZGhPTXlqU2lrVnpEUndEREc5R0NxaTl3cmJoNUZh?=
 =?utf-8?B?Q1NBMG1vcnVZQkU1ZDF2UW5kLzh1cHlqeHpxcnhBakhQNFBsaUJabGJBdldq?=
 =?utf-8?B?OFJNL2UrUUNkK0t5QmQxWGtob2hYQ3dHbUt4RjE3U0toR0lHVEZ4b2N4dytR?=
 =?utf-8?B?NW5OdjRSZ2Z5SmQ2REJTQmkrQmt1MzBNcEw5NU04NkNlSW5HZEN5TWVhUm1n?=
 =?utf-8?B?VHhlbG92ZDFsUGYxbGlpa2JCTUE0Z2M2NlVqb29LODlXRDczY3llMGpDd3pi?=
 =?utf-8?B?ZHU0dzZFWWtuaWFOeGxLOWNxZmdvQk44RlJnQjc2NzZBbk13ZG9kQXdMZGtv?=
 =?utf-8?B?RVdWQkdjYTQzWTNndHFDYzFNZVN1ZnljeDJsMEVUMUNRUUxCY0lJeFo4YmVn?=
 =?utf-8?B?TGpsWGpmUmdRL2ZVNVBXYTI2WXBtTHovVGZiVjZ0REt0MTRMUU5EcU43Nzkz?=
 =?utf-8?B?Q2lyNjRQWjUyY3ZWQ2R5U2NDQnZGQjRXS0hUYzhnTE5UUWdDbnZnaU9MRmlV?=
 =?utf-8?B?dmdVK2FCOVRvdkNldUpQeGVyUmp6dXI5RC9XYXhXR2sxeXRrOVhZTkIya3VW?=
 =?utf-8?B?eE5ZWkR0cGdLZTJEc1pSb25saUVKb2JZVVdEVEY1ZGF6MjZIc2JOcjkra0Rs?=
 =?utf-8?B?azNXUUUxMlJzcGROVXc0R3BRVTNDUFY1bjFadU1SQzcwSU51eE0xNTkxTGRN?=
 =?utf-8?B?ZTdFNGpScGxhcG9FYThRK2I4UmhnUldjSGluTkpEb2pYSHhvdG9KUHpmb2Zm?=
 =?utf-8?B?VTd1NjJFalJDVFpVam9FeFdtS0M3bXpLRmZ5UnN1STlOSjFmME02dW1hZlNK?=
 =?utf-8?B?QVFwV2JsUE9VblhuY2FPUnhuR3AyRWlCU1lFWjRNdy9RRStQMzExVFZ5c01o?=
 =?utf-8?B?d0xWeXhaSVVsL09IRUc2RHFZMytJcDBnQXpqNC9XMW9JSjVWbEVOcGV1RElM?=
 =?utf-8?B?NnN2YzdIYnI5b3lScTlZMkQ5M3FqeVU1Znc4U2p6c3d0R2Mxa2RDa0xEZW40?=
 =?utf-8?B?VXI4a0lJWndRaXhZWHQ1YU9yeXRJYTNSUk42K0huQzZudFlyaWtTQ3VRbHlV?=
 =?utf-8?B?dTJKVE1FeVlyMDdkLytSUitoVDdldjM4SVNYd3NRR2R3cGVURTVNTnhEK3la?=
 =?utf-8?B?S24yUWx5MXlnNldLbmp0SlNyNzllYlMwc05uR21xWXpZMTNIRExwUFdoQURV?=
 =?utf-8?B?U2RmWHJGcTlma1pVTWlkVjdJYjVNeHZTdmhoOUNPeGRDZGNlSG5hWmdsSkx1?=
 =?utf-8?B?aHFvSloybmdZNmx2dEppOFZ6c3FPTG50MHI3MlZISkRyckV4Nmx0QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bef4b3-5d9e-4a59-9b2b-08da2294ac4d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 06:11:56.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV8FTTbRx3TR7cWcElgTQWaDFbe9mez4MYGmVtwGZc7hG2ssh2nSjwnTbFYGMlOUiYqL/ThVVqsYWzVJd/6UZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081

On 20.04.2022 07:57, Juergen Gross wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -341,8 +341,17 @@ struct domain_iommu {
>  /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
>  #ifdef CONFIG_HAS_PASSTHROUGH
>  #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
> +
> +int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  #else
>  #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
> +
> +static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    return -ENOSYS;
> +}

As said in reply to Andrew as well as in a number or earlier occasions,
I firmly think that this wants to be -EOPNOTSUPP, not -ENOSYS. Views
here may differ of course, but in the absence of objections I consider
this easy enough to adjust while committing. If, of course, the
approach finds a majority in the first place - as indicated before I
don't view it as very desirable to enumerate all the IOMMU related
domctl-s in the common handler.

FTAOD I can accept x86'es arch_do_domctl() returning -ENOSYS, but only
for the purpose of not altering the pre-existing error code which would
be returned if making it there.

Jan


