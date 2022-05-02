Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19872516ACA
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 08:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318626.538461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPHu-0002My-4I; Mon, 02 May 2022 06:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318626.538461; Mon, 02 May 2022 06:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPHu-0002L5-17; Mon, 02 May 2022 06:12:02 +0000
Received: by outflank-mailman (input) for mailman id 318626;
 Mon, 02 May 2022 06:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlPHr-0002Kx-IP
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 06:11:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4dc1dee-c9de-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 08:11:58 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-JmsiRaHuNbycMHoe3j-3Mw-1; Mon, 02 May 2022 08:11:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8116.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 06:11:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 06:11:53 +0000
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
X-Inumbo-ID: c4dc1dee-c9de-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651471916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BIM8v4uXW0RD1G0aUIzdq8YaSrQvuFG6tw8hIwzM2Q=;
	b=AVzkL8SHZZJcJBFl3I4QyMxU7gNiLHRExqyzAwYgfDzif/YFLxwrjtCGG6MjNkYhCyOY/A
	HKSePSUynlN+ag5hDwvRzWMhl/7bCwPLGrgW3EcrNgFCilf23mos/+l6Ojodycd6DCzSHY
	6mqW8rY9PKZQ2kaa7jvaPvsst3km7h0=
X-MC-Unique: JmsiRaHuNbycMHoe3j-3Mw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHB9HTY+3VEhT/mjinmNm7tgHOfFJdvph+C5ipwb8zNlU4tLupI/rqpS/omjOMCaR+DLpHsCFflLGHwg+MY4EIQFPxTPvNoL5d19r+M6QqiHR+DJiR50PCdwgjUIpRtGBbkNc/k20PwF3OLiHSudIMVRyimvnLMrHEmpIeuUV72Uy3TqQoMj+Frp2OKwgf5iz0TaU3qCKsWP7t4lnnLQBFKh3FTWTy4g98wI4HVwVwXUDg7akXUA5/bJGcZu9HmsXCEH6xU56wFC0jKkaIXbh3UHe67ISILyowQHX4fEv4a7wMOKqrzEiu3t/J8gHBCBsVxyYnu8atohmMd6crLdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1xttg9DPI47C8bDODjVmNp1gMhrQ6eaSKaARBgvnI4=;
 b=iELH8n3piYUX5E6aWp2LA+TcK6uM9yl7WcoCLGDbWGprDMzYE9az3Dp9qswDWDWKxh5P0OWs6mvch6nqGYuI/FMBrEcCT7x5hlYWQn11MMEE9ErazJHIYWhOBy9B0goja6qxFLusAmpLgHIRTW9HDYy1dmjsxIgWGHvka6uQ69RkGCQxjMj9WP5wU/335t0tByfl8mremVfDruCtfNrTBWSdH379TMQD9JeYqTQxEI269XPfkDn90MAfeZ5sO95+FEGODLhWgOZLy6UBAFFQRbnvKqmPxuoKWLJklYTGLJKBv0bv1XNEHAfvv3oDkTdxwmw5ym2t3SdWpsVEVADy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01122788-ff9c-5b68-b273-691c8ef92bc8@suse.com>
Date: Mon, 2 May 2022 08:11:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-4-roger.pau@citrix.com>
 <38f0e56e-f72f-698f-c4c3-5973ec9e46a3@suse.com>
 <YmwJFqcfOX8oFcyI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmwJFqcfOX8oFcyI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22d40b00-1cf6-4f28-db1d-08da2c02a718
X-MS-TrafficTypeDiagnostic: AM9PR04MB8116:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB811657D16D86B6D1C49F8A80B3C19@AM9PR04MB8116.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZHfMR8Toe4jb1w+vsc3NbxTh5BT19248j068l2W5/g9OT/jV5X0CCjPdcWc+ocIsXuTdJIfqU8wPFtyC9rAgnYq1qYkHFbyjvH86/UU9PyRKswGE6yPAhnFkRHhlJEDxChez4WiQHpg1rvweZ21rocNsTAkMKx95pA3/ZzZ5SvYYihmLhEIJr3LoZRsXkXQxX6RZRMCwVcMOoFv1c9y8cV4/Cix/hOicsCmvJB+k1WyQATxj3MDw+itB+WDcXf1gKRxTAZqKnpZXsJzoQH9q2Ub+STMxg6ib1WKKuR7sA8vcE0dCO0PpqtEDtGhqqRZAez8bz6CWc7l3/vtdy+f/hE9RAuTZqByJMugb0dmwW4iP8gS+MB1LcLRGjMEvF4HvmzO/hE4vJGxVXQryYCXKMn4MeJBSdUJ4ziAHgcxS+IA2KQl5Nd15DIyG2nMELzL11Le1uzvEmfMOyPWncUKq3GQxK8TzOUILz8OgvKqnbkXZ7xILNH7AJqrFu+y3xgdkhVOFpNlo4lunqvxihAQc8AOTJPDJDM2JyiS7FK8TlOyepGwbIqerPdfneG9k8q8voKPGuOby+G2mqlZI/ygx7hv9TSxRQb3MScjJSzbPUFWwwrovo54Qnt08iWLPe3hJl7caa+q3KKx/MYOoLezzTLTFpUO8yqVHtMlMn0IStVbJU3wvg7eYGX9/5yRUjh/ljtSaTd0J2gphjAOH0cnhH0rPcxgwX0g2Ezol6m0HGKiFGuO/YGivz08J+hc5L4r3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66556008)(4744005)(6916009)(508600001)(6486002)(316002)(2616005)(54906003)(83380400001)(31686004)(2906002)(36756003)(8936002)(6506007)(26005)(66476007)(66946007)(6512007)(4326008)(186003)(8676002)(5660300002)(86362001)(53546011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3NnKh4fIay9B2CFAEekE0OxrQT4XFtnCCUv08sEB12pk9zFl+XdQi+lxtOth?=
 =?us-ascii?Q?1DMBi1Hut2LfX56pUSzIDj//3ZDb7JXvhfk4X9gzgV4qvjfByG0DebJOIndn?=
 =?us-ascii?Q?Al5SprTWfmz+AHlNlICQJ0IZBEwiWsw3bkcLY5zFULWLDEqg9El9tun2glML?=
 =?us-ascii?Q?339ypPRraPEcW75kySAU4YpjVt3/W70FNLwICboPFGu+Kgl1vcmNPZhYiDRQ?=
 =?us-ascii?Q?hBmpBII5kMjoULawuTAW6fbJ0qzNQGBtGL+7cFpE1oK3hRymZsmwHFOFRcTf?=
 =?us-ascii?Q?BfbK2AzYx3hs2MKAoS8ip9K19BbIssl8KblQdYWNc1zr0bIFFGZrp5Hc289H?=
 =?us-ascii?Q?aULlck5RFcKtsV3NI4mKdW1fkI3H0XSCiDRDXmPaOv/K1tKl4J7ihUKkMeHN?=
 =?us-ascii?Q?oXiq4ZqYorLvWBK/JgKbB8n36GtblHYSXNMQ6opAgW5dTr+akWxdjYOvKFo7?=
 =?us-ascii?Q?v9O+vjs02WUwYlCw2gSww2bP4k7XzpgdNFI/VpZwpFDu5Q1qUAnTuNHQVqZ8?=
 =?us-ascii?Q?l9nNRpmolmxVIyEEVoYs6XFW/ewgHvBx5YYhb5gIpmhLD4aTGbp8brRG10F0?=
 =?us-ascii?Q?GVrH+EB+WncngGGr6pMSIaMoVs9q0EVMB3xdMKf0/39VAwVRChblc48fBcLi?=
 =?us-ascii?Q?cao1tJSpP6+DHp0/ZeMSY7ga3CwHdTVtdOrauzzNJzq8rLa3jsM2atUrSnhK?=
 =?us-ascii?Q?LzH26q/XcP7ddTvP9EzLdwwJjx6gWlG170Gm1fqtqV4peNJe5wU+EFj3aNRt?=
 =?us-ascii?Q?LPcS9kG8bSnKmICPlMIPz6xaRYdfo3PTz6wBYrloci6uvA5DklBUhaA6jdMI?=
 =?us-ascii?Q?0IzHrG8a+TssGCs0tdJqP8I55vPr8f6IMT6zZ5GRdOPTRl2oB2AxwIIjRSJY?=
 =?us-ascii?Q?CQtBxZk2UFNiMzVRqhMTpwZB5YNWJMVktUcZ9CAYL6sVGPXT2nHFeQb6n5Sg?=
 =?us-ascii?Q?R989qlIBzgGL2ZbmPEuVI8XA9KZqFnr+4AfUG0GJtADsz+Wg1WLXjup/44T4?=
 =?us-ascii?Q?lCTZc91GYAZchlT0wHPP25Suv3A2WrDccKJ6mktk1xf1NFhUsFHvfASE7hwP?=
 =?us-ascii?Q?BoWP/4xXK/o0AHcjNVoB66FbW1dVNxz9O3mM6DYxdjuJHd0Sf4uB0cOcwqY4?=
 =?us-ascii?Q?tkBya24QexPn1yDPf7qXHUl4pulOhpepqf37NmDyxnGiKjZWedBZ4W6hhvtI?=
 =?us-ascii?Q?OYLQNa7tO19ZuYPk0zdi1KiqOV3mQJ3MNaTOHe2vGxebWBVSXFY3VMgKw3ri?=
 =?us-ascii?Q?wVYOSkHZcfKjHi8swH5UwCR4P6jnW7t4Kw8jO6T5wmHZwg3tAqBURX2UUlSh?=
 =?us-ascii?Q?DMNfEM3TbWgUi5al4sbQ1uD2KmU5HpY65B5aX9Jkd1mLMsJscPFZqAP85qZd?=
 =?us-ascii?Q?9eeTItl6ZtZCejznQTt1FTVtaqnNAc65hQn8n2xsCplIag7jWDJ6HSvsLyeZ?=
 =?us-ascii?Q?A79jmEJWKgNV6B8RQmyhVHHSfY8aTr3aV2NMv7cKQhVM2YN4FdeDAj5ok4wB?=
 =?us-ascii?Q?X1K4V+4adFHxc7sMELXX+CB50mcanl50ibS5ydWAJzmmM0WMMZLltDjN5fb7?=
 =?us-ascii?Q?G+lxj99ZfZtiaZcsqQjvhV12nsER4wg3c9fvRy+Y2Hm9VW1qQu2+mjmsXzti?=
 =?us-ascii?Q?aOYne1D+NBIl1k4RRY7rAoD/FujmiSxzIqWC47u3vy7Nno6HccHdchzw+6Fx?=
 =?us-ascii?Q?Cwr8T/ilUO8DRUoWZpYqmGiVxUGFgwgoE0saQmt3zd8NFzGFw3DlyID6NEk9?=
 =?us-ascii?Q?HK0HTDHwvA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d40b00-1cf6-4f28-db1d-08da2c02a718
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 06:11:53.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ggTNi0n1UQ0nd0V6awldELJpYKLvqS8DuCAdXWGQR8OTaJ3gKRFriCEOD6KSVD5Ox575mvXeIKzek+CVN5hJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8116

On 29.04.2022 17:49, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 29, 2022 at 12:59:58PM +0200, Jan Beulich wrote:
>> On 27.04.2022 12:47, Roger Pau Monne wrote:
>>> @@ -3138,6 +3140,9 @@ void vmentry_virt_spec_ctrl(void)
>>> =20
>>>      if ( cpu_has_virt_ssbd )
>>>          wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.r=
aw, 0);
>>> +    else
>>> +        amd_set_legacy_ssbd(current->arch.msrs->virt_spec_ctrl.raw &
>>> +                            SPEC_CTRL_SSBD);
>>
>> Would seem cheaper to use !val here (and then val for symmetry in
>> the other function).
>=20
> I could even use !opt_ssbd, and that would be more similar to what's
> done in vmexit_virt_spec_ctrl?

Might be an option, yet when using "val" there as well I don't see
benefit similarity-wise. Using a local variable would imo still be
cheaper than accessing a global one. But that's a matter of taste
to a fair degree, so I'll leave it to you - all I'd really prefer
to have is the functions using as similar / symmetric as possible
conditions.

Jan


