Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFB50D922
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 08:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312372.529587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nirot-0005yI-6k; Mon, 25 Apr 2022 06:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312372.529587; Mon, 25 Apr 2022 06:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nirot-0005vn-2z; Mon, 25 Apr 2022 06:03:35 +0000
Received: by outflank-mailman (input) for mailman id 312372;
 Mon, 25 Apr 2022 06:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niros-0005LG-5o
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 06:03:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f97d4b5-c45d-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 08:03:32 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-D8nj5UUTOMOXKN3OC6yyNQ-1; Mon, 25 Apr 2022 08:03:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3551.eurprd04.prod.outlook.com (2603:10a6:803:a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 06:03:30 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 06:03:30 +0000
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
X-Inumbo-ID: 6f97d4b5-c45d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650866612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qla4iPLvTB9bgTz1l2+vBOmKGjCe/BAEs8SusRxRU9k=;
	b=ILudyZuC8mAea4nZJQkx4eQRyznY3YeBsV0CcOgdd7HlMOXoYD+BIYg6j9DT/IMa0e9Q7V
	autPung6KfcPdIgqqSE4kTVDfDnudZCY4H7FXDuVXGRzq3trGZ4w+pmp1RCce76yohbxPG
	XWXKUeb82awwha0Ac/zOd+p+MiZHFp8=
X-MC-Unique: D8nj5UUTOMOXKN3OC6yyNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2irF/+W7A1ZM1qMAqDBwZ/ciExcz6c8PzuCx+zXyltDzI6clkwUEtQ6did/58bQOWfJMHoGtyvFqcKgkxIzqvcYjKUtcw6/VHsaQxZxO5Dh2XBPiWBi8b/+/pn3iOZXSuivKodvwt3VNAaJngdBZXBl+2kiW9vTpnjEZI+00ZsTcZkOVNXNl7jLsioLhBHlV5d3E6J2L3d5spkb1mBiVGzKZDI75lY29x7G6U/GAThtrwhYGMVJ8SbGGSrogam9h+CrCWfzZ4sOQWehXDsAah0ZBzsj2OfNtACP3yrIXmLqdOJkwwsi8uUvslhjDz9oy2x4OXaCT3wN6sl7iddhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qla4iPLvTB9bgTz1l2+vBOmKGjCe/BAEs8SusRxRU9k=;
 b=jzTi7Dt7hhWJlkquIz2aCTIAK4Z8u3/gr/jrTERkT3v3H3xgXb1VEgV4vtdq1Hp6YhAvhEs26z5ee9LNisHrVnGIW68XOk96oNRXrBs6KjlUe93FSWezmzQRm4aKGt0euJ/JtaaNfPpUAlIQ6XN+QUYDGjfpFgUScZQ4lMh7R6bR3T3aXcccBosJX3amtYvmpdthbi99bXA+i3dIhN+S+cwXaxvqgDvnOJ6CrtnKl8r5BBGkJ7itmojdoPHmbkDZNOH/pQY2hJxDbrNjfRa1f0x3kxmV6qrmSfVkrwPbRwAMoTKFvZw0dUbHwYwmjbdDpDESNA2G3EOnhf+xe6Xniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de23d880-0494-1712-da7d-052fdaa28287@suse.com>
Date: Mon, 25 Apr 2022 08:03:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/efi: boot fix duplicated index, offset calculate
 operation in the copy_mapping loop
Content-Language: en-US
To: Paran Lee <p4ranlee@gmail.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
References: <20220424144414.GA17868@DESKTOP-NK4TH6S.localdomain>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220424144414.GA17868@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff3e953f-c796-472e-de49-08da26815231
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3551:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3551AB2A42D59E4959A8D8B8B3F89@VI1PR0402MB3551.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hyxg2SN3MvMTo20E1nd5w+3YEV+t4BQQgahygZ63yOhkaeq6VBdOGtvLU6/3xVIlOApxyMkC0nRrNBfksEwdTAch0Q2nJ92st8n56tVzN/HJCViAM132x0Sox1z0Olhtjf2CYWufhkxo4cYvsvSG2hyODdtwY/f1DWA5i9qmfJcU8urh1PMUt6s9AKkc4qICiL56+m4iODcumCZDQXr6awFwuMNIYmGR+t+fhuBu5tJpmB+/xMR5UqwlL5llF74APzXc3aoGnZRFNcLbj3cHi9OGYtC3tjbJaiDg4vGbpNjTmvh/Sdwmvi3Qx2Xx7WSAHySnp1OgDjKDNQFUwQOhpeoUEAmnNc4pyDovSe0MQnI7CY1u1cngGk7M1+bjyD85bCWSo4Ks4w4KB2OXL8caeUqS6ry3Rel+O0C83em9vIhzJItlbcREoDSMEcHrQTKNK84ZfryKxqRb72PM6w0C4bJAjVjb59Ib9QKFjkuId/r7OpHfnoiQP293cdPKJHqqIvwaDYxH/H8Hq8hjIPXRheZOOHJbRdjJhTrE0FhtbYS6YSDVjozGRkcQtGgQFJwpINUmk36JoZiS+9oV/FSu2p7Pk0IA3Nyhmd3t/rMTBYuqwtxG9uHD8t0+1IFfNooTPIFuWkZpsbKl49K8OdaOu7wVuXpQyAKewweUG40frzTmS1XZ/deYVn5qWrAl4HtMf7/vEjceDYCicSSOS/dfKTbkEmQwjOEWlKOxujdtXrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31696002)(508600001)(53546011)(86362001)(2616005)(316002)(8676002)(2906002)(36756003)(6506007)(8936002)(26005)(38100700002)(31686004)(186003)(6916009)(4744005)(6512007)(5660300002)(66476007)(66556008)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9lK3FpYjZuVnNiRmhVcFhjeElWbkJRM2RHeUxSVkV5emdWTGJLVlZFYVlo?=
 =?utf-8?B?ZHRjZ2VkMUVDQzNjT3ZZcDdTZVZIMlV4OVJycTh0US9va1hIL0IvQURJbmth?=
 =?utf-8?B?SlJ6dWk3WWkzYWVsT2tQL240MnZHT3Q1TmVDTFhjb1F1WUd0QzFOZXN1TDZX?=
 =?utf-8?B?NjcyRTFuQTl4TmNMOU9IZG1URFk5MTM1dmxMVlp2RGV3U0lsQ2s0NHhlTXNM?=
 =?utf-8?B?aW9ROFBMRlo0U2ttMmRqSGhsaWJKclF2TTdscDZuN3Nra0EzSHYwUE43U051?=
 =?utf-8?B?bkFVU1pDbFVxSUo4SFgwTWk2LzQ0NW4zZ2JyNUI5amdsWmhUb3NEaExEbk02?=
 =?utf-8?B?NStTRzNSdUxlQjBuR3NyZURJUm40cVlLdE5rNGtnWk1KOVFRdW40ZWZhSk50?=
 =?utf-8?B?eDlteHlkTzF4MmJ1akUyQkFXRnJWenZ4aW42eDllU3VSVzVrUEdxZFZBcUJV?=
 =?utf-8?B?bUdiT2UvckVJVVR5aEFwR0NlQVdTRDcxcmc4U1BkNU5wWElKMzVwNmNKMnI1?=
 =?utf-8?B?VllOTzUzdk8wRG9ITmhXK0duMm1Bek42eGJDNG1iL2RRYW9SM05Bd0lDdjBa?=
 =?utf-8?B?OHNDTmNQZnRZcXd2REluSWJzVmxwTHp0b2FmTEcrb2ZMNmg4SlVXM0M0RE8v?=
 =?utf-8?B?NGw5akJtZVZldzVXNnFlUE0wcVFGMVdDUVB6SlVhZ29rZTVHNG5SR2QwRXE0?=
 =?utf-8?B?VGlDNlRPRVRuOEhoanFRTXN3bjlDaU84OTJRK1FqcGVpVkMrZ1pxZG9yQTQv?=
 =?utf-8?B?Tm5JRVFvN3Y0V2h3QTlNVHA5U2tQUlpUNEhTN2pYVjNaclY1Wm1rS1h4ekt4?=
 =?utf-8?B?SUpJd1FmS295dFRSTGdxNzRpS2lBNm5rcEt0L1N3KzBlRkx0bTRzSjJONTQv?=
 =?utf-8?B?dUpiRTYxTHZFa3ZvNmE5V1dienZDcC9LVEkxVFFJSXRvSEZ3T2p3TmlETXZY?=
 =?utf-8?B?VzVqMU0yUXZZNHdQc1UvVityUzlyazRna3Q2cit4elF5UTI5OE9waDZhWUJn?=
 =?utf-8?B?aml2cEdXdnV6dTZqd21XcERwUnh6K1JPQlUrME90YnNOMnc0aUR3VHJVdDgy?=
 =?utf-8?B?eVhnSmx4Rk1QWm1vNnV4VUliS3gweks1SWtKZ0tLcUNPSXR3OHN5eEJkbk9a?=
 =?utf-8?B?dWFvTnk0b1BhRU5PdzZwRHhkdjlZNGpqMEJJaGd3VEgyQXd4S1lWU2tmUUxF?=
 =?utf-8?B?b3Z3UXFYOTZQckcrbFo5dHpFVlp4d1BWVU55eXVBeXhNZkgwYXIrWWpZZy8y?=
 =?utf-8?B?eW5wdzNaZU82OVBrMFV6dENET0dJTFhRNnJ5ZTYvSnAvVDhURmhkeHBXZXhR?=
 =?utf-8?B?UlBSb3JIVlpNZUVRUkhVR1Jyc0x5TUx6MzFmRGNYNTNzNU9PWUpyNWdoUWsz?=
 =?utf-8?B?YUxxOWFPRTViR3RRTGdwZks1ekxodU8zaTNtaWc5SEF5R2lIVGdGNkNsMjR1?=
 =?utf-8?B?M0V6SFZqVXFIWXpETy8ySUJrclZQRnoxZlc1VkNnaFdBWEhPWUVQTC9lb0xu?=
 =?utf-8?B?VmxyMldoZzhXT0tPSWowN2ZMOHkxOHhNTnlaTE1iZmFjOUxSREZzeU9kbk9v?=
 =?utf-8?B?Qm5yU2dSUnpBSE94Mzdkdncxb1U0UjI3NGw4MDA5WURtZHpvNkhBbHJqVFBW?=
 =?utf-8?B?aVhhUnVTdHA3Uk94elkyMGl1dGhwa2V1SnhDS3NpRi9SczBSOS9RVHpYOEh6?=
 =?utf-8?B?SUlHalJNY0RJZUgxVkNwR1k3VThSK2k3WFp2aGhzc0FNRzRsMVJsOUVsdktL?=
 =?utf-8?B?RGhvUnlxcnF5MDRhVm1ack1hWnM1dEtHQktvdXFYVmViVjNHK1UxN1JPcW9u?=
 =?utf-8?B?OS92WDgzcHRDaWt0L01xbFFCdHVSM3krMVVRaEJsRUJkejlRc1BnbGIzWWhF?=
 =?utf-8?B?cVQyKzFzZG1sSzVLL1Y5VEgxZVdNRVhBVlFsTWJoSjNoYzlna1o5bGNocnZh?=
 =?utf-8?B?ZzJxcFExUkE0OVhpT3kzWjRHL2tKYU1UWHY0RGdnak52T0R3MXFBOGozYTUv?=
 =?utf-8?B?OVJYZUptMGQ5YUI3bnJJVVJTMG13RkJ1Si9VTi8wTmVTMWZCWnFQdFI5Z3c5?=
 =?utf-8?B?ZHpERXFRVTkvbDlxN1JFbTNWRWk3UW5WOVhTbW1CRHFXRjVvSm1zREg4U2F6?=
 =?utf-8?B?akh4UGFTeVZEcUZRU0U4bnN1ZitVSzJuU2ptRElZeWtRQzBWK1NJaGdRRTJ5?=
 =?utf-8?B?RTBxMFl5bzZhTmJCbm5lVlllL0FPd28raTZVbGRpczBINDl5V3FBWFVwb1F5?=
 =?utf-8?B?NWhicVcvenV3WVRCZFhreHVUS1Q5ZWIxUEpja2N3VFMvVkhTaG5TODNETUkx?=
 =?utf-8?B?RG54dHR4Y1RWODBGY2lBWDB2akxUL1IxL291a0Rjc2ZEWDBuOEFRUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3e953f-c796-472e-de49-08da26815231
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 06:03:29.9701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fvex53t9k6DQszzXxM2ScTSmSFNhkcx4cIUIkqJWEZSa2T16yKq7PsDyDL1RWiarQvPnaENGRXjBYqj6zbUc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3551

On 24.04.2022 16:44, Paran Lee wrote:
> It doesn't seem necessary to do that
> duplicated calculation of mfn to addr and l4 table index
> in the copy_mapping loop.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>

Oh, one more thing: Please submit patches _To_ the list, with maintainers
on _Cc_ (not the other way around).

Jan


