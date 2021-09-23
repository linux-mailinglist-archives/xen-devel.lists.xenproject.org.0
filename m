Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E782415C07
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193630.344907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM49-00011F-TV; Thu, 23 Sep 2021 10:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193630.344907; Thu, 23 Sep 2021 10:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM49-0000zS-QR; Thu, 23 Sep 2021 10:34:57 +0000
Received: by outflank-mailman (input) for mailman id 193630;
 Thu, 23 Sep 2021 10:34:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTM48-0000zJ-7K
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:34:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e41cf942-1c59-11ec-ba28-12813bfff9fa;
 Thu, 23 Sep 2021 10:34:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-IFSlWXeTMp6wriZKts0jMg-1;
 Thu, 23 Sep 2021 12:34:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 10:34:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 10:34:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0052.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 10:34:49 +0000
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
X-Inumbo-ID: e41cf942-1c59-11ec-ba28-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632393294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMGtfv2GIbmnQ7Y8ZAx6bsOoV5Jz9FESpz+hQv/7GUw=;
	b=IjXU4bkLhf7PRYusuMA90T1lrRze0T4joJ04wXQYmJT3KUYsZ5RrUT3ODmq3kDhQ8ZkHcj
	jrwWhE8MseKDwfubmJ78hskMGt5CuZ2q2/+sG9RNwaUPd+dOHWCidY10Q4c1M2nS7NFSuk
	KAeM+4PPhsOEUeQ5MaKSNUv7poRle/c=
X-MC-Unique: IFSlWXeTMp6wriZKts0jMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0aGng4EfmqVXinLUonr6tbR7QFH3bWMi9NvYWrBc2z2ieBG4mdP1z0ZOMQkXMt/tML1YjhzD6Ok5hZUp/+W0xGxvZmni62WveKVIpZd/sV7wLt+v+wlVu6G5xLtiIQDBIVkqX8JymCUSHlkHFBREmYAFHG49JXnn+fx20JGe/TpditOsf2MiNUN8XzKJe8qAvDCvMW1NLVmp1qM1Y+F9Wcu2ZtqINWJ3VL9l68JcgIeCSHaZ9hKL9a6S56SoVpWo0O9vqxP+5GBXfNo8zxMd/p0D9hau32pf48agU08fbXrLHFOpG1nYItCc0Kwz8BP7vWyT1J7J+4Gk4kWxLM7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xsJR4mBTsBcRuYBVyViNw9g/7NDrTvKyGR8IzJp0MYY=;
 b=IfB3iJUNnrog4hT9XiynxOCYzAFiRHBdpkGWZxDvd0bcD3Z/8JuK/ctBKwJs4r09gI2902m5TV9yz8Ww/zSRqf0oG12bFKmOIbjsQgMCpMH8n+su5Q9bVMQ8220U6JgSr/QHzHd49ahjajVCSxIS+prHKCX0Pu62HUgyhK282+i3MqUAbCYGIuvxq5Q/nBOX29oWJ6PCEVHIakp+cj6BcYF63rNMooWzdnseJtQ9q54i3saWEppkRRQNSS/QCgpiR7V+zK9jQeAAujGifs9x2cnV2rTLCZK+xngPP6ehOCZcN17xMYGf3a5AV8HHxG5DvhXcZvIY/hDV5CDaPnM/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 6/9] x86/HVM: convert hvm_virtual_to_linear_addr() to
 be remote-capable
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <3397b5ea-bc21-5a2c-ba5d-afc974a92df4@suse.com>
 <YUw2RLtI73QNjaPE@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46f90ac6-a4f0-d00a-2956-a0e4b351f698@suse.com>
Date: Thu, 23 Sep 2021 12:34:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUw2RLtI73QNjaPE@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0052.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac148389-cae7-4242-e40a-08d97e7dc538
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24478BB240EC3D23A66C5087B3A39@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HVUUxpmL3bnVEyinhoBrYzjc/zkMzk5aj/1uh6BuQw4gdcdTa6/PZZa6U0/CxLGPh4i/Rwy4qjonU6KDUm3oPBY/m+4ubaXlmxIQWx1cKjBUIRlj9vtE3z+FjZyjknZghMC3CXxbOkIdKVjOjR7VXYMbxmfFdtqQ43sA5dfDISxrnIeCIRaG3PkSTdkCl1eSRXr15GqW153j4Cq3i+LwtpdeBEOIyx0dgOVxc6ZSdOK/+Ij5/TIJcJh3Zr7D1Oo6bwsGc0861gfT/bd/ALmi1g2CeewPaQcJeUQkm0MOaoYVHjv2uGGA0LOOJeZAGh3/oG42F163PMSnfljS2ltk8ruoRAjo7n83bAc/ndLFq1Togo9AqlJwKFwXSpfGIajrRRG2P5I3L+FM32bIe8gpUXx8B9ij50x/9jUzyCBsQwdlaxgE2dJcMfQqSOJVT64o6sjgxiwoH4S0MEtMwnFXfdvsZT3ZIP8B4lbpBIOJHW6tMvI6ft7NZKg1i1IRK0/HxD+QntbPzwRenQ93lxvHDT011RlX6/OItjBRBCq0shz+YKkG6I/opm1CvgN9aHZ8OuspYaY3McEj4XkB1OX/XpjDkE0Kxb5C7GPNQM0zOa3GCUaF40g9S7ZzRgyRlfoxRBoQZEfjC7AwA/zymR2fnx5zagYtPdINUcHGh17aAKdKX5LbLaOFpWXz1qSl6OW/59UAobqX9l4GyueZnTOSk5/9T6IobUdn5CCTBbodNbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(16576012)(186003)(31696002)(66476007)(5660300002)(2616005)(66556008)(956004)(2906002)(8936002)(38100700002)(6486002)(66946007)(86362001)(6916009)(53546011)(54906003)(31686004)(8676002)(83380400001)(508600001)(316002)(4326008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iE2J/buITkiD/XBKV+CHVdd36F2mNAoVP0Csit18/FtVt/zXlu2hmiPoz6co?=
 =?us-ascii?Q?UM56P4jEcnUGWmmYkwLATflICBP4FLs3H7e7dKlAfCYNv4eUd5tiFIstJd1z?=
 =?us-ascii?Q?XZydoZ+Y0o8sUs/YSTXIb5AyY4DbUUsIu6d94DWtCJI/pW5mPhKsjfqCswy6?=
 =?us-ascii?Q?DHCa2nyeIXCs6vkIsjAvyRfrdtOFW6OZfzLWk4jULFbT0fCPaRsHz0ShZpIU?=
 =?us-ascii?Q?pd/VqsWF/SJk4I8HNo1jRMuuAaYqy8dSKAn8pHNWWYZfEuWQHKrO1rrVGJkK?=
 =?us-ascii?Q?OWl8A2JjGKN+ZgGhuvT+VWrzIaC3KXesDd18XQ7YBRFT4PsYDNKGqV9CGWqq?=
 =?us-ascii?Q?1yJDff2EgiGl7YpKmX5KhnN+0olR4kOJxAGjoLqH/L6ZFu8HSAwIDWxeRuLZ?=
 =?us-ascii?Q?p9QWvUKv6CP2ba28tgz5kiaSPsELyjrldSiFcjm+kVqvd2IsTZK//YoQTMvh?=
 =?us-ascii?Q?oucUfN+rQK+c+KGZIhKQnlffNYLawJRl2l2rFRZcfguXoLZH8B4N7BwQo1Fb?=
 =?us-ascii?Q?CvRt0tNRiRMK/N7eO6A+4XhDsEoqtjNYQ45VpSEJT1WZO7uAEoiwokDXVv3u?=
 =?us-ascii?Q?xA3HREksnmaFNaiyi43iVhwt0hSkaALpRQWwiPKz1f6VQcwAjbU2+lOr367q?=
 =?us-ascii?Q?Ho2wcO+LrLu4r0s3G0rG5VEBjc610Wp2BS9RcHpezHqwzJRyXpx4NTKgCBz2?=
 =?us-ascii?Q?h6t4hy64GTlelWhk51dLBGW/NYSxUz29RXtK7M7Cud2RY5B9xDekANPfxKVG?=
 =?us-ascii?Q?gAHEjaeKZFXsEjtzMp7ZyU+cqRBSMDywwiGU+a6UpSNPDH422h12jSPVb51W?=
 =?us-ascii?Q?TaJlUQblb/L93Lx63fCYJm7szjt2TYj0UZOJ6zv6ta0M7naGIHj8iUmBx31D?=
 =?us-ascii?Q?C9kQ7rxNMYtKmC0WD7S2XseWVYNdUVoIq5f21KyZaRRCWgmwjw3bLTLWwtsl?=
 =?us-ascii?Q?3OvqBz+7T9VlRAOeSub240jEQUuK3kuys+/pSnjDq6pwa19pEUCTAMwUmXrz?=
 =?us-ascii?Q?bAvUL0QX27QOeZN5u8myl31fpgdyFPkAcEvro0WLwR/nnsQVC0gzHIznbu6X?=
 =?us-ascii?Q?E03Zd0Sk33I9x+UAguY03Xg8oUFA3y0fyTV+FhkiHVBAbtyn7BExhSnTAesS?=
 =?us-ascii?Q?LcLJfIYnarWnuxYAIq8iEpPJdPHO1gfRJhJnXaGJnf6mQ+1nrFev92iwmTND?=
 =?us-ascii?Q?TH4MfWm4N/QWOaY8+LkUUZ+IvmmsbVy7vuuzQBeBJAvDt0W6zYoRn76ZYY3C?=
 =?us-ascii?Q?yokt+z/oCPBNqHDsTWTSV5leYNJOXsC3PwMb4oYbySZWFvcFfx89xcvftGk1?=
 =?us-ascii?Q?e7lWbJyj+zrgnFTTW5MGS2cV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac148389-cae7-4242-e40a-08d97e7dc538
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 10:34:49.6266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsxqyAxVL1ybwjSV29ShT8VN/3HtPSvjrH3cvgjSaSG4jLM0+ERgVgKGb2F/5fIwJz0jTtMlSuF2xiNkoc62RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 23.09.2021 10:09, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:19:37AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -2526,7 +2526,8 @@ int hvm_set_cr4(unsigned long value, boo
>>      return X86EMUL_OKAY;
>>  }
>> =20
>> -bool_t hvm_virtual_to_linear_addr(
>> +bool hvm_vcpu_virtual_to_linear(
>> +    struct vcpu *v,
>>      enum x86_segment seg,
>>      const struct segment_register *reg,
>>      unsigned long offset,
>> @@ -2535,8 +2536,9 @@ bool_t hvm_virtual_to_linear_addr(
>>      const struct segment_register *active_cs,
>>      unsigned long *linear_addr)
>>  {
>> -    const struct vcpu *curr =3D current;
>>      unsigned long addr =3D offset, last_byte;
>> +    const struct cpu_user_regs *regs =3D v =3D=3D current ? guest_cpu_u=
ser_regs()
>> +                                                    : &v->arch.user_reg=
s;
>>      bool_t okay =3D 0;
>=20
> Since you change the function return type to bool, you should also
> change the type of the returned variable IMO. It's just a two line
> change.

Can do; I would have viewed this as an unrelated change: While the
first change needed indeed is on an adjacent line (above), the other
one isn't.

> Also is it worth adding some check that the remote vCPU is paused? Or
> else you might get inconsistent results by using data that's stale  by
> the time Xen acts on it.

I did ask myself the same question. I did conclude that even if the
remote vCPU is paused at the time of the check, it may not be anymore
immediately after, so the information returned might be stale anyway.
I further looked at {hvm,vmx}_get_segment_register() to see what they
did - nothing. It is only now that I've also checked
svm_get_segment_register(), which - interestingly - has such a check.
I will copy the ASSERT() used there.

Jan


