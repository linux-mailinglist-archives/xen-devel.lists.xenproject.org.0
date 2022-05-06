Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0A51D520
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 12:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322863.544319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuo6-00048U-6b; Fri, 06 May 2022 10:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322863.544319; Fri, 06 May 2022 10:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuo6-00045d-39; Fri, 06 May 2022 10:03:30 +0000
Received: by outflank-mailman (input) for mailman id 322863;
 Fri, 06 May 2022 10:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmuo5-00045X-G2
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 10:03:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c694b450-cd23-11ec-a406-831a346695d4;
 Fri, 06 May 2022 12:03:28 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2174.outbound.protection.outlook.com [104.47.51.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-rLG7vvWDPfyfPO0EWc33TA-1; Fri, 06 May 2022 12:03:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6833.eurprd04.prod.outlook.com (2603:10a6:208:17d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 10:03:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 10:03:24 +0000
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
X-Inumbo-ID: c694b450-cd23-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651831408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vcus4KzsWrufXtEPEasfCu5qSPVsJwNNR29zq4QtvhQ=;
	b=T8BqNZhNFKaikOJm3+DCFe9aeSy75xh8396BoxSdkwpoFzM2xY8bCTUutJKTk1wH6Cz9RL
	gzn1Abs56bwSta1pdTieSwdscVTYcLOjUut7QYDrgDHP831o6qtOjBky54AShsUvXJpJDG
	mIzvay5B01YA3u7Rzh3wjnNtSpcc5wg=
X-MC-Unique: rLG7vvWDPfyfPO0EWc33TA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjON0tRISC64XJxAO161hFdsL8HWR/2oixp/+9O6gdiM9dqCpO+xdz4lijom6i4nhUhqpiW/DsOs3qG1nb6JqPop10vYj84XE2Wcll6sNbfghbEqpjWpCAMTQODcBm3m59YyWIGNHyxJjuXIWOzINhWOu96le636R3MoLJu748Rq91QOkhFJr7YGk4kEY8BsbWsdGsWuwcKl/ceLUhYcxZRXBA/s/8nhhJUzDEqdLduhFU99jR9ZkcolfZIrzutOSKscCjagAVnFvMviv2q5RITo7wm4UGjHOtjQdejuBhwGUYoylBSnz8T7ZIvgJ4R+5SJT8X9MB++CUh6TSygbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcus4KzsWrufXtEPEasfCu5qSPVsJwNNR29zq4QtvhQ=;
 b=XlqF+ahUNi9dve6VBtQUKf3dnWJGyl+f66jHv6/AKg9HVBEeVmQ/AOxb3158qBrxth+puAf2cV+UiTIbfzTkDsiSxV3F62nHZpWOUSF0u90OfCy57L2lHBvYYAtFZnI/aKSDMSqkOK9NZ7PFXhxRhmHP+dquiPbBx3pq/CLcmA7QWwO5qFgNUGlKZiixOevi8ISbizFMIDuseaIKuRPbFCgxdeoMUIamfnmHiJpTRG5xBKnSnEMLw2Lwtt94uLh+HGfXXbLdNSoCiyqg/1xIg2lvhkfr0rrAVUaM82ZhXQI8DRpF0VIrDygiI0rvb0cfK1rke8dEAi+edq0T7kLaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7366893-c4fc-dd53-3b20-828e67cc5b91@suse.com>
Date: Fri, 6 May 2022 12:03:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220506094225.181815-1-michal.orzel@arm.com>
 <20220506094225.181815-2-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220506094225.181815-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bad065f-afa7-4d8d-9453-08da2f47a87a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6833:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB68339174229A5EBE6CEC97E8B3C59@AM0PR04MB6833.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	byK7IEUTWRbU3mgJPfB6sJJRQry7U+0/tbMCx0SVRfkxe4/kdaHUa30pl+YVGMu/biX9czZ49c0WTNQ9JssZcPGZWo1R9bk7iiIF04E0BfdEcsxRUZJmi7tr0ubQtmUt/3p7NvH23OuJ17MeSlaQVxduCgyZAl4WcichDi7FRgf+XpBXgjVWyyfr94YRj8ue8SKV0WPRQfNqrqsYQ6m8ubWFYLrpqFmJJNkowezAblHrQU7wXNRI1FbTULmoXUJ/deCmuSlTXlmSMTHrUOVz0xhsi33p1N/EmHgo/d7bvG2c9+8Nh8B19zY6++RQ+/7fG9hc+GSsC39P8BcI9TvUG/Ve2UbQGDLt2Wqrfqklu+1IR71N6ORPu51x4yB5Eogy3HE8aJ9NR/0uIKC+3bBAz0cJsT8EIkGOh2z4rCSIIGA070JBXm0ec4B/fuMAj0jatJvZSF/XRhh8+J/qXQprjaQG4NErzNiYYuGZItPeBDEt0Xuj9spnNpYRIXweVh3m+Muxxz53zmq9/Gn58ryP29fBAMJcqddEKM/WQ4jAD2daHhlvPfGDAWsNZm/ueoAZCyY0D0qRdsFSQGMvDD3ag+VKHghIxhw6psOqkqKC0KpZwQK68V6/0nhzxtOsshPIamOxc5+nTnmUN3M3KMqL/F/1Xdkw389Sar6JQpVZHx0Knh3PEq0ecKLRhc+lRazDQc6/RFYsGOVj2Cvsv1UDhvQrgSqRkidfbu+HKfXGppvsC53PgCRx4LmoaFHwJpO8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6506007)(53546011)(31686004)(5660300002)(2906002)(36756003)(8936002)(66476007)(8676002)(4326008)(66556008)(508600001)(6486002)(66946007)(38100700002)(26005)(6512007)(186003)(6916009)(31696002)(86362001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGYxa3ZuQXBmODdud2QrdVE0TFo0aUQzaE9zQjUydHhkbko3V0h0QVd3YXJz?=
 =?utf-8?B?Rk1xNlh3SVppbVRsNmxsUDJnOThVa3RzekI3VU00NXZwVUVlMS9GZTFZb2Rq?=
 =?utf-8?B?RGs5SmllYzgzSnp3dnNRYitMMGVMTHV4eS9oWHo5UmZpN1ZQVGtpNElsdXc4?=
 =?utf-8?B?QnY5Wkp3SEFEZ2pvSHBFSEF3OTc2MkpzMFhOODRtcmRtZ1hjRmhScUkzSmhw?=
 =?utf-8?B?RUVXeFFpaHA0WUtVaTVHL3I0cHlPTy93ejBNQzRXYzdJM1pvS2tQSDk5OWhk?=
 =?utf-8?B?Zm1ZdXV0TEI1c2xrNXlBbXFmRENBaDYzWkF2QXdDQXhhRnAxaW1BTEJiSVIr?=
 =?utf-8?B?Um1mZTJWeXVGeno3bkE0UHhyaDR2WVFtMU4yK3dEcFU0QmRMaDFSNGthM0lE?=
 =?utf-8?B?SWJFWHBxNUhQcnRSSHdJQy93aDdjcDFKMHluUlRxejFWb3hjbHJSZW9lbFBq?=
 =?utf-8?B?RE00MDlJbUJQM0tNYzh3WmZHcUVSYmNUaFNjdTZUMDhtdzRrL1o3WDdSc3ZX?=
 =?utf-8?B?WEtCMTlHTUZpelhOR1FKYXo5eUl2d0c5WXU0eXFKMnFKenFYaktXQTBRU284?=
 =?utf-8?B?Y2hpYzdmaXNiTXN5UU1icERLbGloTHV5QUpneGRSTVltVnI2eTloR3pRVzZy?=
 =?utf-8?B?S2laVnlpeVNXa0F0aWZ3Mkh2d2RTaVFZY2tBOXppbUR6TkcyOGJpT2tVdWxP?=
 =?utf-8?B?bWsrWGZ6akFDUmdKRGRKakxhU2Eza3FDQmR1S3NRZnRWL1JLSjBsTkZjNTA2?=
 =?utf-8?B?czNUQ2Z1dENoMWdqOFdpSE5mZm9UYnNhOG1xVDc2ZHlVMk0xSXNKMVF3ak1r?=
 =?utf-8?B?S3hpN2JLRGJOSTFzWkEzVWlUdmc1ZXlva0JnWHJ0alFLdkZnRkkxKzZSK3Na?=
 =?utf-8?B?YzVMMENERHFZZ3BXZlRraUhwY092cGdzN2dDUm5DWWNydEE3eW5UV2tZblZj?=
 =?utf-8?B?RGJVWFl6SUZYZmRVakt1QUNjMmxIS3h6N3c3d2RDYVd4b2Q4aDlIZTJpWUYx?=
 =?utf-8?B?emNJTFBtUFdZRHVZaDZ0SGFjTnB6WmpRcmF0UHNPRXBkUXdTNDJyOTRuSHc1?=
 =?utf-8?B?MHpsa2o1VjVIMVJrcDRIL0ZXOXhzQktQZTVBZjBBV2daeWE4ODJ3TnB4R2hV?=
 =?utf-8?B?NHc3NFZVckIwcldON0FtV3BvRUp0bEdyUW5lZDI4b2czMlhhbTUrbkMrc1ov?=
 =?utf-8?B?OHJaMjRTV3p2cDMrRWE0S21lbFliMExLeURBeEd5NUxveTY0ZlNhdUIrNElV?=
 =?utf-8?B?dVoxN25zR0pqeHZadFMyeGVBbng5b21aZjVqRklLUlB5cDdUbGhGLzN0V1NY?=
 =?utf-8?B?MW5DNm1rTFdrOXhPTDVZYmttTC9mbTJDVkF0S1JoZ1Vza1F3ejZ2NTBsOEMr?=
 =?utf-8?B?dW9rR0ZaVmUzN3JjZU0yK011MTU0UWY5amZQenZpaHBjdnUvdG1YYmp4YXVz?=
 =?utf-8?B?bjFabDBEbjlDUXRMZ0Q1MEhjeFNCY0dtODBYRUg0cmxqKzk3a1VSNmJrdWUz?=
 =?utf-8?B?RS93eTN1MU0xY1NxdEN2MmtYTzZ1U3hIYjFJQ3hnM0doUWM5bXF5OVJaUTdx?=
 =?utf-8?B?Ujg1Q1FKQUlUajJjNm5LSmRJZkR3OFVyZldmcElhaE45WEs1cC9VbEQ5YlVN?=
 =?utf-8?B?V3ZkSm94ako0MTF3WGluaUcreVRtQTErWUl1K0h5Wmtlc3c3NUtaZnk2c3dT?=
 =?utf-8?B?WnYrMTQyazdSMzhSZ0JDdU9sQnUxSVg1VldZY01ueGhWSnVzc3cvZUxsMjI0?=
 =?utf-8?B?V1g2UDQ0SmpXYmd5anFEMUpOenA0YVozQzZPWWxyVTZWM0d2citRWUM4SHkx?=
 =?utf-8?B?TDByN0laRGpDZE5ETWRtNm1CdnJPUXRISDBCN0V1Z21zQTNQQzliOFZLTkFR?=
 =?utf-8?B?RjRHaU5EK2l1Tm5JU29sNnBnNlprYi9KQ2JrQjNWbGVvRWx2RjRoOS9HUXRw?=
 =?utf-8?B?dWdBbkd4UktvdmpqbG5HQzc0dzR3enJyTURuUVZVQ2JTSnpLU1lnTFdUYnpS?=
 =?utf-8?B?L0dFQTRzWTRJV1lPSnQ3NkVSQ0ZnOWQwSHNXS3k0NG9MOGdLd2NsZjh6MnUy?=
 =?utf-8?B?QmFObHJNbnpCSVpLZHRENllnUHR5R01kQVBPZ0tFNXhUQ0lyWkgwayt0WDc1?=
 =?utf-8?B?VktxSFVBSkpPSis0ZVJQRG5vcllYQTJLMWRXWWNLZmxuY1EyTWZBMnNRTTRR?=
 =?utf-8?B?TmhGMDJKWjRTVWlYT1drcEUvd3NYVGovdDlhTUZiTXFDWU5kejMwQlhtZVht?=
 =?utf-8?B?dWx0N2RKR1JsUmhNUVdERzJQQS80Ui8yNE1QVmJqZEt5Sm01YjM3ZVFNTFBE?=
 =?utf-8?B?NmZ4WDNITWdEOGlVRTBJRk92NklQTitVK1h0cXBGNmwxMXV2Q3NZQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bad065f-afa7-4d8d-9453-08da2f47a87a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 10:03:24.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAbjLzQl91K1aQhLm1wjmvm2t/6VFLlO1a6IqOBJvHB+7bAcPgoL8o3Jcy13jL88TE68vwSW/66Lr+f6m6xnGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6833

On 06.05.2022 11:42, Michal Orzel wrote:
> Function unmap_common_complete (common/grant_table.c) defines and sets
> a variable ld that is later on passed to a macro:
> gnttab_host_mapping_get_page_type().
> On Arm this macro does not make use of any arguments causing a compiler
> to warn about unused-but-set variable (when -Wunused-but-set-variable
> is enabled). Fix it by converting this macro to a static inline
> helper and using the boolean return type.
> 
> While there, also convert macro gnttab_release_host_mappings.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

This R-b applies only ...

> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -29,12 +29,22 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>  #endif
>  }
>  
> +static inline bool gnttab_host_mapping_get_page_type(const bool ro,

... with this const dropped again. As said elsewhere, while not
technically wrong we don't normally do so elsewhere, and this ends
up inconsistent with ...

> +                                                     const struct domain *ld,
> +                                                     const struct domain *rd)

... there being just a single const here.

Jan


