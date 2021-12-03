Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01574678BA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237668.412225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8vm-0004xM-58; Fri, 03 Dec 2021 13:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237668.412225; Fri, 03 Dec 2021 13:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8vm-0004vY-22; Fri, 03 Dec 2021 13:48:54 +0000
Received: by outflank-mailman (input) for mailman id 237668;
 Fri, 03 Dec 2021 13:48:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt8vk-0004vS-Bh
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:48:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf25517c-543f-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 14:48:51 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-YkTYVuZJMKedBGFy94d5XQ-1; Fri, 03 Dec 2021 14:48:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 13:48:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:48:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0252.eurprd06.prod.outlook.com (2603:10a6:20b:45f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 13:48:47 +0000
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
X-Inumbo-ID: bf25517c-543f-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638539330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00IiUJ+qCnjd6G/lxZPyTmg1lhKbzuTbjO8qNUGdmNo=;
	b=fJVXPEWcKxY7Eay6xdN66vVaVmRMSb8RLRL6JpCqb9IPMqXDQvh2IGFuiphBMzvC+59Czm
	MN65jyPVFf+A5kzj7IixvXbxHVjAf/vKHdr4zC0To5eldfRyJVr+rST3xtlknC5kZuM8UI
	LXaBiw/cjUrVlNn79giUsupOpWDUF0w=
X-MC-Unique: YkTYVuZJMKedBGFy94d5XQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLhQysXXbNa9WlEwrSS2qjP7SKaiRE1U8bZZtlb5XLM21Pv6VuNwOjELmJN+ln9EXgCCBbj9z0Hb6pgiHOMnd+JBny6gxuI5DkXCv6kjlGIGjVXaypdvJgfr4koj+2nfLW35rs/v+4LkbUat9CatTK7TuLX3nEmMm0iwcmMsy3dsJvPy5VM1hMDyxUckwUW9mbIWWW7m1dBfpFcQeTtIqflVaVJrfY1x83z5vI7Xy2dr06qP8/EI/DCd3VdyL5N2hoERQwF6PXngsoI12HXE3tVmBMgX3/8ORYxM67IZVykLdjY7gKLpTZDkBrJE/ju/sTQALwuNOzXpwANoC5m6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00IiUJ+qCnjd6G/lxZPyTmg1lhKbzuTbjO8qNUGdmNo=;
 b=j1HvlFMOG6ik3GhCLQOzpwpvpTmL5iDvcM24GwY1sk9fiwADSiBmAAWv+LiBgO6xFIl79SvRV7sMepsxTLKcb5LbI61LifXpw6+LYrZon0Xwvxsh8l6tt5E152Y79M2zv65EHIN152vw4EpYUfED3rWhyCVepO9P4+rosaGwFUYFZrTt4RNGwhSSI96rmEfsfXensdQ4uUQKkCVcLxBLbCzoolXv9rsWJ8uFFEM4lT7EdxkyckrbjalczE5iERQV4v15tE1dH7BIrKqqGk/Wb9vb1hrTyjYjNR1dB2wczh1k19BFmDLy6Pp5wV/7957rMV2h/j639NBq6dt/r8lySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8605b44d-17ed-84c3-aa98-87c789c623fd@suse.com>
Date: Fri, 3 Dec 2021 14:48:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1.1 61/65] x86/entry: Make syscall/sysenter entrypoints
 CET-IBT compatible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163747.29517-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126163747.29517-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0252.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b73fad69-b2f0-45c5-7213-08d9b663a1cc
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119C68F52FF5C4A3F9FE2C2B36A9@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tkBHnb0MeaKVw1FvXIw1Ebw67mmIrstnbFCIUPu7Op1ZqxtEsU/SQg0qf6xn6ybVgpZoN0Txhyzp7/S7TQe3d5gQFVdTfCoYaNG4WHKcbAfv3r6ZG8aseFeXdO9AfD4XpxLhuVD9yeov1aEf5UCG89UKJ+ZVOFTcCEEcfPqJw9Go1UeApbB6Z/ZPiXmLL0if3v4lftB33SjLhC7URYRDO7QzHsLegDiJ7pEUYvZ0ZNxjlwceQb0HqgZLBqSaaOhOAqxZWLJ3oXXd/QrJGsFJRqtbCrtzroT9ln7rb2Xz1yUoUm9zmHi4i0IK1TqpD+aBybyVZ6BUavWEQw0BNTUTXmbbj7jPjQPupHMHaysXVn9XWm8+TRajVn4XHI+Kqv4U2MIP0KcaSN/AtwTpAc3iLQ91M7ew+fnty39um7fo9mXp+PGtorEEvAo4FjpbUbbcKst4S/VW8dlz7I3yQZdWaYFlojR69PduSwZ6ndg/H/uN8A0jrlhrWU2BpMxbLXmQssBWwEkDrYfsaD7/xMuxcgOtwbs2EkC/YZROq8UR2CYL5bcOzK9Vpj5Mpsn9+C2JRSj2RqjdiXc7Q6h1zSkq8N8IfyKetgyJcvNzDdB4ZWcZ7Cf6p1qEjej1k2HUauH7ot7IYdRBz+xgXAagzNw+jfOB8tI/dtbANZNNmrvs3GXUIDsvdbkwfAHr0UNA4UrPNqsay6uUSmc0MWSKfem089IAxyUnh4w71OO3y12DljE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(36756003)(6666004)(6916009)(83380400001)(956004)(5660300002)(66476007)(8676002)(4326008)(2616005)(26005)(53546011)(186003)(508600001)(6486002)(31696002)(316002)(2906002)(31686004)(86362001)(8936002)(54906003)(16576012)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDVLTzRKRjc0dGIyQjk5WXBDeHdhUVltRFVpZnN3V3p5ME1JNnJaSHdMTGJM?=
 =?utf-8?B?WkV1TkU5UE5SekJxcm5BZnRaUXVvYk1sRER4aWRrclVWbkJqbmIzNWxSQjZM?=
 =?utf-8?B?V0oyOGxoVGVkVThHMHVzaGlzUk45YytwSExJYS93UzNVSVByZnQ0a2dJK05V?=
 =?utf-8?B?VUFoQzVSUUhNK3oxbVFaRzhpZVNZUFprTEVScWd1amEvc0xrdWhXcVhsdVpC?=
 =?utf-8?B?ZHA1OHBZcjMya2pZckUzWTlqMTVtbk8zZGRaS2JhRllpbnpOSUlvSDdyeVpo?=
 =?utf-8?B?S2F3RC9VN2VNbjNJT0dkL2NCRTRJWXRJemZlM0M0OGgxcnBsbm43eWhWR25X?=
 =?utf-8?B?MWRqSVNnZG1vaWo3Q1dWRHpmLzJvQmpycTYvaE5xTHBuRk4yNk9LQ0tVdXNv?=
 =?utf-8?B?WUNBYXJwOThZczdzUUk2QVlHTm8xM1o3NlE4VS9Kd2JXZHZsbE1GRktXRklZ?=
 =?utf-8?B?RUVGQW94dW1WdFlZQ0pnZjAvdEFnd3BuNzlySGVENkJrSFErRWdFYUZvZ0k5?=
 =?utf-8?B?dUdaQVMzUEQrR0UwSytBYWtNY3hxUlRlZjNRQ0hRbHU4ZHNuOUxibGVVRi9u?=
 =?utf-8?B?S3RnN0NWZTFrSWU3UDY2cDU4WHhtT3F1Yjl4Q01laWpwSTk4SWd5NlpidnZG?=
 =?utf-8?B?NW9DYXdCbGxad3BkazBQenJab1JMYU10d25hT3d2eitPaFYwM2RXQzM1WUdU?=
 =?utf-8?B?bFREaUdVQStYd1I1eHlENy9ESGJUVGEzZENmSFIwTS9LbEtZV0NMWE96aUds?=
 =?utf-8?B?YUNuSDAvY1JDT2NCcE1neG5wNDU4QnIxTVV4RUNUZkJ1QW5tR2g1SFdFckhC?=
 =?utf-8?B?VUhNdDZOaDk2R0hNTlRiUU9Ua0l5NU5kMW45d2RBa2lTNEdnSnBHMS9NVGVi?=
 =?utf-8?B?UDJhbDl1UC9OWFdTZVAybWhFb2kyV1hvb0lYUkxFZ0xqaVJvMVlOSG5rZjlT?=
 =?utf-8?B?ZS9HbDFDbUR0eE1oUEl0ZkFrdTZ5L1loa2hTdTdQU1oxQStsSUwyaFhYRkZG?=
 =?utf-8?B?SFpzMUJzSFA4Z2lNV0I5WTVoR29jVHU3Ynh0UjkyaHd1c1BwaEpxYXdnZFJ4?=
 =?utf-8?B?QVAzZklGeG1Eb0dubVFmSXRGVE9oaEQ5bWh5a1hWbWR4bmZZV25PVGVvTGNP?=
 =?utf-8?B?NnBvQTVBS1R2R0ZIRXE5dVFFcDk5ZDdFSHZYWW5mNHdkazV6TkQ2L1lFcDdE?=
 =?utf-8?B?MTJkMlN1dnJLa2xITVRuTXdwTUJtM2cxbjY0elFoblJWcG1nN0NjNEhTUTFI?=
 =?utf-8?B?SHlxQmwvZ0tVd1hFYnhmZklIYm11U0pMMFFQaG5lSnRQWHFESUI2aEtBVi8x?=
 =?utf-8?B?bUZ2OSs1bjN6RENLVlptZXQ0bGxUdGlnM2d3ek1XMzI3YjlZbGlDc0RNaC81?=
 =?utf-8?B?UnJZNFZnR2c0dUNnREhyYlVDUU9YUjY4c0xnSWRzUndyTDlnZFNMK2dNaGM0?=
 =?utf-8?B?Q2xnL1k4RS9aWUpPRmJkUDByUXorZFdncVRLTUxaQjFCTW9FbmdOeXpJMjVX?=
 =?utf-8?B?TXYyQXpOTW10djAweEY4WlcvbC8xcnJMRXFOYnZCNERpcFhVMWQ2RlMreS91?=
 =?utf-8?B?TzlFaE4wdFQvcTBWV3dNVjZuMk1lUG1rZVFwZUxCOUhZTzVLekpkMVpEeVZl?=
 =?utf-8?B?M1NGbFdodkVidzc3a1VOc2Z0L3BncmxOVDV1SGRoL0ZzZFR6aUR3cjZMamZh?=
 =?utf-8?B?WUpMZHNuQkR5ZXNRMU1WUHhsZGpiY1h4alRJQ2UxYVp0QURVdDR6MjVHVkxq?=
 =?utf-8?B?TGFxVi8xd1pFSHJ4TWxVS2tnNXBkMyt0TDhQaUlRMHA1eC9hOVhLeksvdit6?=
 =?utf-8?B?cVNhTXpVK3VvZHBpTmpMMUZSUmwvY2IzTTlnZ1A5VUxFNFplZnNKNWVHT1BB?=
 =?utf-8?B?elh4Z3ZYcyt4dk1PeUpzUEduRTRleDhncHBKOGhVMm5yZko3SkEvUGsxN3Bh?=
 =?utf-8?B?Nkh5bFRURERINUFqQ21aa0c2aXM5a1c0QTRQb3BFSTBvNnRheU9MTXhING1h?=
 =?utf-8?B?SWJENHF2enRuZm1xdW13SmhCdXliTm82cHBXQ3NkQ2VZbHYwbWtIc0Q3V1R2?=
 =?utf-8?B?N1l6ck5CYkQ1M0RQR3EwUm5OVDFZMTY2ZmlvYVRzcWorY1F6Z0hwQmhKMjZU?=
 =?utf-8?B?L3dPS2JKdm96Zm9pc0NRUHFoU2NSYWhpU0ZSWDB4d1orV1h5TUJlZXd1bndo?=
 =?utf-8?Q?5wnOAsx+Bz+gBBQRJEf7lBY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73fad69-b2f0-45c5-7213-08d9b663a1cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:48:48.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jno6J1l7lrchwwnHLTCaoplcIYRjua89hAfMPqbWbgrn0piBLIBgRmt9t9ytgx2B3Iwig15YNYgcN264UvUKgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 26.11.2021 17:37, Andrew Cooper wrote:
> Each of MSR_{L,C}STAR and MSR_SYSENTER_EIP need to land on an endbr64
> instruction.  For sysenter, this is easy.
> 
> Unfortunately for syscall, the stubs are already 29 byte long with a limit of
> 32.  endbr64 is 4 bytes.  Luckily, there is a 1 byte instruction which can
> move from the stubs into the main handlers.

Oh, you actually found a different solution to the space problem. I should
probably have looked here first, but this being a v1.1 it sits lower in my
mailbox ...

> Move the push %rax out of the stub and into {l,c}star_entry(), allowing room
> for the endbr64 instruction when appropriate.  Update the comment describing
> the entry state.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -295,6 +296,12 @@ static unsigned int write_stub_trampoline(
>  {
>      unsigned char *p = stub;
>  
> +    if ( cpu_has_xen_ibt )
> +    {
> +        place_endbr64(p);
> +        p += 4;
> +    }
> +
>      /* Store guest %rax into %ss slot */
>      /* movabsq %rax, stack_bottom - 8 */
>      *p++ = 0x48;
> @@ -315,10 +322,6 @@ static unsigned int write_stub_trampoline(
>      *(uint64_t *)p = stack_bottom - 8;
>      p += 8;
>  
> -    /* Store guest %rsp into %rsp slot */
> -    /* pushq %rax */
> -    *p++ = 0x50;
> -
>      /* jmp target_va */
>      *p++ = 0xe9;
>      *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);

With this it's even less clear to me why you did remove the 16-byte
alignment in the other patch. Initially I expected you would extend
the "first half" of stub space by 2 bytes.

Jan


