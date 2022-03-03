Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874A4CBCEB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283208.482165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjpD-0008Qh-Ld; Thu, 03 Mar 2022 11:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283208.482165; Thu, 03 Mar 2022 11:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjpD-0008OX-H6; Thu, 03 Mar 2022 11:40:51 +0000
Received: by outflank-mailman (input) for mailman id 283208;
 Thu, 03 Mar 2022 11:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPjpC-0008N8-EG
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:40:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5b584c8-9ae6-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 12:40:49 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-VXeXDVP7M7yKwUgixo-Pgg-1; Thu, 03 Mar 2022 12:40:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6039.eurprd04.prod.outlook.com (2603:10a6:20b:73::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 11:40:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 11:40:45 +0000
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
X-Inumbo-ID: c5b584c8-9ae6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646307649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcZWY7UDM8wNsztSHagZP8wPYZ5XByk5xZOfPj019ao=;
	b=Ju9yYark4bCAtYGq0ZPIK+xGaJ3XsznEutFpqRSYZ0uo3mbGytHunjoU9oxYD7WT1Au15W
	DQ9VD9EIa2FsF02GKEbTbZrCtepL4iJCzYYO1raVHphM0TtI4p1o7ir4d0p2CntuOQd3iI
	lHcXA9m1a+zrHnAkLulAwKzvnraGZW4=
X-MC-Unique: VXeXDVP7M7yKwUgixo-Pgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpPlnrL8Tnmj8cL1Osv4OYMzFlkqdwl+ZzUHUi6sS+pUQIsHYyByCMGrJ6A5lBlthOupp5AVjF3hWKbuwtrbujLLMC9S3h17wHTIYtYFKNhJlnjVCIrEnPB55CuhW8/DujbFJwJsdtkNrDgHPwmZlQMsOfQ0o+VxmzdrSe/dVNsCkJpJuiNd5Dd4P5E8cjfeG4qN2CQv2FkX0Aq/aG4DVFJJi9/aJHXwylyQyO9hATlguT5aaRQxhZ5nu4N8DFcTkSJjSyfcxnRXd1HS/rwsZGj8uDKls808k/LqHCxaZAIsRokD7wzw9/QhrNSlVFbVsaTDojo0XeiEViws+PUjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRw1SjXvQzn3T21RYtLxvIlmfYzmHraSIKOrgV2TF8s=;
 b=JEVwWI0OygkYoFJxQXestDsNghaHCFy8yeDLQUBP0sJsMZ0Vdx3rjsnTh1EguaHoG2PvV15Rf1fg51JgGO5dZCj0pLDsDAAo/9t0HGIYQMQ2O0PYsxOq1oL84CQyiNOG+V+VRoAhj88Gkdh83azkaYTeDq0jcJRxht01fXIE/o77nO+c36ZO3hw4n2AYCPYsxMmQUF5sWbv2hrYpXYyeYpMtfY9GtTqofNh8UIYMMcz3WVCpDAdWOFpIASra//KgQeqGm0DQsXjUPKaYKBIIqFPqqaLUFD6U02CoCOzE2yYc1NvmdgI4x3dQuKDafGdQA0SRce/3dRxDR70vLYr2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46630b9e-0b88-f6e0-c240-29c0f7de94e1@suse.com>
Date: Thu, 3 Mar 2022 12:40:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302221157.17246-1-andrew.cooper3@citrix.com>
 <6ffbc025-758e-bb7e-4e87-0b6b9e1bc2e5@suse.com>
 <bd6dda42-fc33-5958-31e7-741853c85c9b@citrix.com>
 <3bbbe906-ca02-c748-23fe-7a98864cfb93@suse.com>
 <9377d616-e5ea-a3a5-0a90-e2ec81ca6fb8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9377d616-e5ea-a3a5-0a90-e2ec81ca6fb8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:206:1::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc05177a-1ada-4429-d8d1-08d9fd0aa7c6
X-MS-TrafficTypeDiagnostic: AM6PR04MB6039:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6039EDBF42254F0B847FC0C6B3049@AM6PR04MB6039.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yutaw/ZQvhG49RoH6JPgjgvwlHRFmLYFNngLUJGMg2jIUs4xLVqfIN0nXS4r8sjGOEReK2/xXobkL2dbDCVj+QD2YzKEVD7B+xBr/9FQIoAt4doDQvfqgI2dUabWnqSPyMiVu56apdNe2OizkfSufTiPKXHP0nUn2fbGLiVI2m8hKq0SIvXjfJgZt3UCs3ew48T0q5wS7kYiABgUzrUT8UnxiWKRS2JCYCK1pKF3ptNgUNkBQ//tGKkB7y0he5u7osGwp0StBR2ZjNkSIfZDLOe+aKuDD1gSKjcOZFiRcPgoFyOVQzU0pZDu2rpPRklrOIVtI2Fu4w/PVN5ayevz5qAFqsClkEO0abyRvZdoSHPgV+YtjYjHjNyhy94/SVjrrrHj8K8gpYOkApZ83yhMEHO0GBhuEdUMStf5V1YpMXocFWlMJB4+c0l9d4EABCwhMWXiGAqJmfHkTzdd8zRlMtvT0Ietn4PIZXI6YMP5AnA1Va5bW94Y8s+LziTM+05bl4T0TydPqPS0dH8bgKTuYetxDdjAzMd33Exi2K9ZOgJJhyPngGXyTLVPxo5BfBefbOSFXR1iqluElcXm6y2nWvK4Ww5o0RpY4Cd5QTw8Dre6kZNMmGSLuSOY/nAvOVA7Op0BP3ggj5HhpZR0uyjd6emj9ZayWDkg8kygov7yu+qkTfDI6Hof0XMgqxcy0d2q8cKWvEB9+1jsY5xA3B01jy2qSlzPYYpGsu4EX70iDeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(53546011)(26005)(2906002)(36756003)(6506007)(186003)(83380400001)(31696002)(4326008)(8676002)(5660300002)(8936002)(66946007)(86362001)(2616005)(66476007)(66556008)(508600001)(38100700002)(54906003)(6486002)(6916009)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GioiGEAPxMMIQWYKk8HZHQhTN4gGaQh7VU8IXHpSfXSj1VRK8OOoCOQfDg6L?=
 =?us-ascii?Q?0eFvOo2nsibbqw36iZCExeoMbBxu7AbnQe4caVWJVFF4xQ6tgGFn5Cx2TReP?=
 =?us-ascii?Q?Of5qYzMDFhdmZoyNCBZfAH0ttUvGwpc6RUtu6BeJTvZ3GlJ6OGydrWYjWPpm?=
 =?us-ascii?Q?VYmtCVJCfQfArNo9AJ1KTvQ1LQik7Fv51e7G/6ZfaWRDL/plp57VM22/bkcu?=
 =?us-ascii?Q?GRduCk/DwGeQNL8JeY/6Cex8nqMBct139nhVEQndUg5whxsB/yoEW3L4ArDW?=
 =?us-ascii?Q?ho1XIX3Gytr4Gm/gmEID+AYPuTy7uvNvxU8vtQ8FIplAz/hs7YG5IQDiBora?=
 =?us-ascii?Q?r9PzWQX1v/A+pXkdtbPQ+/5ii43+6p85UGeiEsZbmTN6zOk6uu4u2MQALDNk?=
 =?us-ascii?Q?EzkLPPeGOG4neensXdwIHnri/XUdGqloh7kcdpGfS8NfKxpvsdtsid2hqlqz?=
 =?us-ascii?Q?gA7maNUuba1YFFLWxpYaqa3HbsVTRTpKemJbOcK2aItHPtvjb3sU/xSEGzwr?=
 =?us-ascii?Q?XO7AY0W8+Fj7ODxcJWPvCJlkA35GQrGKe/uFrv+FCYf4KHUuI8T6LsNYc+IA?=
 =?us-ascii?Q?m+lATsUXBNSGS12JzHP1iApYWQzteKnXE3dqJOcqC4v49MHnmZvnLZURePCb?=
 =?us-ascii?Q?eA9k7Cz+Wj3EJgvfPjgy5+NeWhl4qw4aBmCVyepp6hBqIuwmN2zUu8EZL05h?=
 =?us-ascii?Q?09XOi5y/sTSTS6YzTWU8bwAgcuI4/iTNRyHi5LMaKAMXJeqoSZA9G/PxZRVy?=
 =?us-ascii?Q?nKF/LgtL1RqU7GynZ73aTcNLTp7/NHQsvzZaLPTXtV95qoNu3nI8JbhCbOgO?=
 =?us-ascii?Q?V4RpBGwPJCihSBUd7zVXZuSXn7oD5SgeOfyVixHWrjl2buDswOQitlNIsjwV?=
 =?us-ascii?Q?kAtHSQ/Bbb+/cZOYFcmnvjdn7hMov8zaK1tONXtZFWzjoZHGkasAsiGViqYF?=
 =?us-ascii?Q?IhvW2oqcQvtE9Y/ulAlqhtdextxNbeQOKF2yUwmTiT/DkU9/6tyGgxruvdSC?=
 =?us-ascii?Q?Mwd+Uj6NU1F56hhfiDL2/qiJG3YhyaNhSq59JVe8NHfb9FEdl4dDFE1fKGOq?=
 =?us-ascii?Q?BWLGZfCVFfzyykKapwMWoCBJ+5ufdkSi07x8u1k2WyGpi/LYQTNSVtY3jpWl?=
 =?us-ascii?Q?Us7NoQDLU+e6RH/NzNs2Enkzx4Fi57xGA5Ga9+zXbldeYQzjYn2kY+WNKB3l?=
 =?us-ascii?Q?r+fQQjjMvP7RUgrRPI061Vr93pMbgHoF9pHc909EWkyMg2sDjHrNP+K+2C5l?=
 =?us-ascii?Q?sAh9Eq89z5jsIES8g4sYW/eBRbCaC5MuIYTZDGNuoEChH+2BqyFpvcqk176N?=
 =?us-ascii?Q?umlCb71aw7Z9jVDSlgRxrt86kwb4MNdkXee7LAZirFya4jPTSKlcTXJRdvyH?=
 =?us-ascii?Q?efGQgmKHdkx/8OqTrI2jph8h6usYu2eUhlZHtNVSFgd45kP5bjNQxCn+OMCO?=
 =?us-ascii?Q?CIYjLCYFUWohp9KRSpnVqTgm0oZSM7bRCRDzB/pU5oBYFviQaiYoezRmS77q?=
 =?us-ascii?Q?rDozTmYiRRDnRdHNxMbZfTytfnQT0UfDosi1Kk8k4akiklGXdlzVccUcF2Pd?=
 =?us-ascii?Q?xC2rRadF/qu9galkWE+zb39XwPQoW3+/3qP64qQqP13okkSewR4YDsLwt8OK?=
 =?us-ascii?Q?q9BZl80Fgzw5pU12YjrP4Bw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc05177a-1ada-4429-d8d1-08d9fd0aa7c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:40:45.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuAWJXT0h4/i9QSYOu8dj05bb9jqZMtBBixgBGNDWX7oRyQA6CFK9cYKtA7vWjaKSLzOU0c87AzYg42dlwoTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6039

On 03.03.2022 12:15, Andrew Cooper wrote:
> On 03/03/2022 11:04, Jan Beulich wrote:
>> On 03.03.2022 11:48, Andrew Cooper wrote:
>>> On 03/03/2022 07:44, Jan Beulich wrote:
>>>> On 02.03.2022 23:11, Andrew Cooper wrote:
>>>>> This makes it behave slightly more like a regular boolean option.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>>> Slightly RFC, because there is no easy way of making the opposite "no=
rmal
>>>>> boolean" case work for no-vpmu.
>>>> There's nothing to do to make this work afaict: Generic command line
>>>> handling converts "no-<option>" to "<option>=3Dno" for custom params.
>>> Oh - I'd forgotten that, in which case this patch actually wants to be
>>> simply:
>>>
>>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>>> index adff2d2c77f3..2cea1da781ac 100644
>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -162,6 +162,11 @@ static int parse_params(const char *cmdline, const
>>> struct kernel_param *start,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 safe_strcpy(opt, "no");
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optval =3D opt;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 else if ( !*optval )
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 safe_strcpy(opt, "1");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optval =3D opt;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 rctmp =3D param->par.func(optval);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 case OPT_IGNORE:
>>>
>>> to turn "option\0" into "option=3D1", no?
>> Iirc extending this to the positive case was deliberately not done, for
>> the risk of breaking custom handlers not expecting the standard boolean
>> forms. We could likely go this route, but only after auditing all custom
>> handlers, I'm afraid.
>=20
> Well - I've already audited them all once recently.=C2=A0 What's once mor=
e...

Of course if you did an audit (for this particular property) recently,
that's definitely enough. Feel free to apply my earlier provided R-b
also to this alternative change then.

Jan

> I'll have a go in due course; I'd definitely prefer to avoid special
> casing the positive boolean form in individual handlers.
>=20
> ~Andrew


