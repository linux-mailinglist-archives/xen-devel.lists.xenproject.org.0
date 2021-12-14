Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D0474659
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246851.425719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9cq-0001H0-Ui; Tue, 14 Dec 2021 15:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246851.425719; Tue, 14 Dec 2021 15:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9cq-0001Ef-RM; Tue, 14 Dec 2021 15:21:56 +0000
Received: by outflank-mailman (input) for mailman id 246851;
 Tue, 14 Dec 2021 15:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx9cp-0001EZ-EB
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:21:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91485565-5cf1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:21:53 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-8wwFTmsEPg-VD65Y11OImw-1; Tue, 14 Dec 2021 16:21:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Tue, 14 Dec
 2021 15:21:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:21:51 +0000
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
X-Inumbo-ID: 91485565-5cf1-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639495313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPhPfrSkj9ANFiUdNv+LLOjW3A4h+KcEpAaqpqVYUeo=;
	b=QbEu+WeIZHe+83qeyd0FiPQQnnqzDXUjm5Pn7ez601sp34vyKp7HVweJvT9A+w/6BNXuwa
	TWYvyZAxFByef28jdR9dxnsqr63n9KzXs4YtZi4rYXXABOsleZ/dft6EsGEQLGln/q9BJe
	lmEMAkwDh2PiojTHOqX5aVWL/ews/5w=
X-MC-Unique: 8wwFTmsEPg-VD65Y11OImw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKMVl0A5sIiGx5gPzP0egGh6qzNdh+8Ln9EFBhEanqvOmADPZy85qA4EACY+7FOTG4iv0myUu/bU5Cf/um6Jk4ROXKNmHzHRkjKM3Zn8HaXR2X+1ugRNs0MjYHCc7VWyCFjmMvOBxMubhpoodzCDTYwyTgiv4gEu2h1Rf6hScarhT5amfpAe+hZU8DEoOqWic/NYvqjOXw7J6VrbxaEmJqJEF51qiJ6e5q5lrQ8lO6ZuRcIBTf4RTXG3uD8RBa7J+W33nFEglfKy5R9cdNkAmVwljXHQ5b6U5+L4B4+7pB87KKAwqV2LhoUzLw87btxl+8D82LjNd2RRQC7Ft+Y+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuLwTY5RZx4Bn86K/JtQgfz+h+ld0WJ0s3DFkB/c9po=;
 b=aB7FkO9ZcBLgJOSZsSqvwmB65N3otHdMuHlJjYLz45IMzuu/QRyuPXY2caNEmHBqURp7UBbeudt7b5HAhaqa8C47bwFmFez+gKB2cMrMbBUrzQiboNQV1IxWm6YdHI1OvgyZ3OFh8veMyQpvZbrTEKkuwsf6IbKODXlBF2+Kgn47zATRI02W/RIyLAN/e0mEVsuDhnrKZ8diZy58SnZsDIHK3siJc7NwZ8sLNajRO7GlKSmgpUx8YNDdwrDPq8auxPyo1Tc6WYxuYfGTeFYyEJqPdR0Ydz7fPHfyOUl1TbEkNbdHAW5GpWfwxh8RBuh1VKQ/SfEhg7Ge5rF7vWYGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dce504e9-a4f1-1c85-61fe-274f2a96b091@suse.com>
Date: Tue, 14 Dec 2021 16:21:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbivUH/Er0o2PwsG@Air-de-Roger>
 <fb221da6-2ad5-e298-c582-364943b95198@suse.com>
 <Ybi1BJR+UybxeMMy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ybi1BJR+UybxeMMy@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 759016a8-fc37-45c3-102b-08d9bf1573f6
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037400E6E71100334E2C9DDB3759@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v0d9sP+ecq7CCUMTfzXgCx6oX6bewCaXmm1KFHgIFPK5h/Iexfn6eXLspQMyBK1g/lcdjEZmwhIScJk+m/TGOyKaD43nsi7MHbBR4Q8ctTXa7+iaJ3a5V5r4UI1y3YTXvRkxcQxvxv3UtGAG+7d0H4UsMwRe/mTqSuo55edesfJhWznhDLBdUnjUk6sBvQKxZV2EafdAY1xRvzHQyoiloamta7z64hQI74x7XASO5hTaEDZ3GZI3dFEOwFUgeMRpv8hH9yezoOEjbh4sndgQUgk7KcDjn9OyLF7nmVvhHzz4TeAQP+JA7tgFfh0240KGNLCH3nLgAviVebuTUFD9r5O5RNiSoUx7SXsstTKkuyZOrss1xeNTvJxMBslQx8DwmA1elGcFYBqsIAoJLW0ivg1MW5qJQ5bQFHhPJ/P/f9Oet3rYwqhW3uk69CHVWsQjeKnVLT0n6YQ+sRb0EV/nrmURBLjWmF2nqFUQNE125uO9a+UeZS87SPSuSK/FovTk9AbXNprmTJ4RTSN5fR/SFgxHVEoyczIhINzaU0Eh7u/jn5Nze1ZTfoYgg2suqd3Gq+B7VibowYhig+dWCMTtN/qANWI1gKlh1xCZ2l9FGUpxNLZCWF9uaswCh5Mo8AsEk1t4l4GIRDEfvM3qZb5mG0JJGEaa35tmHkQJ5Ii+t7d5tfZlUBvOTua4iFqKEseQ56LDyhGKawgoDUnzBCx0JBMwLlC8lqcvJopQ8W1Ndyk+xeF7xrgRZVo/m2MdjjzX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(66556008)(508600001)(4326008)(31686004)(86362001)(66476007)(36756003)(66946007)(2616005)(6916009)(54906003)(186003)(26005)(316002)(2906002)(8936002)(8676002)(6506007)(5660300002)(6486002)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JrEl8bRf3NoivIWVcbuR2U1p43YvNheFAs0RKibVT5u0FB45A9yww0ZUeQyv?=
 =?us-ascii?Q?+pjJMmh9PO68tjTrbI4fdNiOHxy7PLnT0McGWffa/9ERdzq7Db07+I3WsLzi?=
 =?us-ascii?Q?jjgGZ1XD7LoWSkmqr0TKuCKVdVUBMzC5B43NMHIHc9HvRoVzaZKOV8pSu2wQ?=
 =?us-ascii?Q?VPeRa7lbS9+CaPVbPZwbLAFM+mPdCMwFi7qc5sLbqzG1kkXY56n40tczKsBk?=
 =?us-ascii?Q?t4ZThUnOuhuGAvik/AFpJPwsBDa3b0lDzqm3yDdFGw5z2cSchBfFH7J202sT?=
 =?us-ascii?Q?V3WnBhSguyR8RqnjS3F3AOh08dw8PSaulbL+H/nbGwxbyrducbfmaxg2rgO0?=
 =?us-ascii?Q?ljoaG3+mTOrB081fXnad+rICjJRHeuyWPVZskZ8I0hT3yei0evFPGDDrO8Y6?=
 =?us-ascii?Q?Y8j288ArgvcSjXnq+mXqy7VYQFtEG8jI4eY1qb415Fk4sYINzbO8RLnVnwly?=
 =?us-ascii?Q?Oft/F7I7Bb2WDWWQOpBBu17QybLto99FpL7qnEdKqsAtzSkV6o0CeGfZebLD?=
 =?us-ascii?Q?UsHvFeux74B2nt9Q4/gRtezwJNSBf/2PMP2VgtmBIKeOS27Icngrsqbu2eQh?=
 =?us-ascii?Q?f5QzoAPuxeSxIBOR3anyzz5enYBBB7boO6HJ9syWEBoB3bcA2VErSqU/2rpr?=
 =?us-ascii?Q?O0ZfIyr9OChxjBLMUKs1vKdxcvVppSS8W6DAxTWYYgjmo4JQNeieAowuivgG?=
 =?us-ascii?Q?4CodOd5QhbkGWXfDct0tceO19pMxTNDYfbDMwNql0T4W/hEQDbhzevY3Gu1D?=
 =?us-ascii?Q?oAIVBj3SRYRvv7HSJvWdmnuOBtlj7q0LleF6i/E9SidRfCbD4zzDDcS+quC6?=
 =?us-ascii?Q?m5/zHS0YeSTlIqOVZ5PU0NP3IcicXbSAtoFHCXvSYDyrM+K6UvjZdEVNlJhf?=
 =?us-ascii?Q?fKmwKNE8WQCipwCt7V+Oj8hwpq+A3J/VH/gSDoZmMH/22DbXo0N18bJEFslW?=
 =?us-ascii?Q?Q0f3o62EmpEzbKw7J9qztxZcAkASuPEMGXv40wHLi9w7NPYN/rSUzy+UZ1SA?=
 =?us-ascii?Q?nVzrrxX0QxwiErFhYwwIWUBQlyeNTFNN7ZCR/lyraM8DrGOf4IA6lLTsnwMN?=
 =?us-ascii?Q?EJwmsn+I4lVsTBCliyICN5/Qlp7ZYBiCDhksbEWIrrcKmbmR3lZ4tdS8K0/V?=
 =?us-ascii?Q?/QHS3oPIFLRE2qUP8HokwSlrRPIAH5g2+9pXp4liEyjdzrLuupKNDdv4Yf62?=
 =?us-ascii?Q?l61gzcCRGE6kyk3wjc/cVQiGP2ZYZRYns+wG3xAKtoKoAmzi86XH/GDBjWq5?=
 =?us-ascii?Q?jDO72XSZPx94Jp3NBzUY0x79eS5Ale96nCye22S7BwRk9Wc0QW9kjxOLq5Hj?=
 =?us-ascii?Q?nqgMTekpH4aef6aosUWXUMFs77iJi4PhLSZI1ERhBy/YGycBLLWtr1oZ/kbn?=
 =?us-ascii?Q?OqcIjx5EibWKY0bCVG+HfUawqJE4kHBkpulm0mZ/HdAhZFwPR/YpePsziElb?=
 =?us-ascii?Q?eezHTvDfQQ1sgdI8gOumH8yLPG8kUA7ztFsr/jO+gYggIXj2fUENG22IiVIE?=
 =?us-ascii?Q?sScatyBep4Z8CdvG8+bEgi/0QLIeDqYpfTZHiIPzjkMEFVDhqnnWPMvAftqZ?=
 =?us-ascii?Q?/cSZ40DP9MK1r8o83hlV508tNIqm9rE8IrpjwYybBVWn2XjOh6fZUpaAJPod?=
 =?us-ascii?Q?NCaX8Aas7Ze2SvcF4JmNIlY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759016a8-fc37-45c3-102b-08d9bf1573f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:21:51.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7P4Zrsm03SVZcC32WbAWwL6zunkC2QbnMla5gp6In8NlDkaQv+Q+QMY0aVdJtVg+fkQvZ3Yfr0MHhUviDJTmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 14.12.2021 16:15, Roger Pau Monn=C3=A9 wrote:
> On Tue, Dec 14, 2021 at 04:05:27PM +0100, Jan Beulich wrote:
>> On 14.12.2021 15:50, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>>> @@ -116,7 +116,19 @@ static void set_iommu_ptes_present(unsig
>>>> =20
>>>>      while ( nr_ptes-- )
>>>>      {
>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>>>> +        ASSERT(!pde->next_level);
>>>> +        ASSERT(!pde->u);
>>>> +
>>>> +        if ( pde > table )
>>>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - table));
>>>> +        else
>>>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>>>
>>> You could even special case (pde - table) % 2 !=3D 0, but this is debug
>>> only code, and it's possible a mod is more costly than
>>> find_first_set_bit.
>>
>> Not sure why I would want to special case anything that doesn't need
>> special casing. The pde =3D=3D table case needs special care because the=
re
>> find_first_set_bit() cannot be called.
>=20
> Well in iommu_alloc_pgtable you already special case odd entries by
> explicitly setting the mask to 0 instead of using find_first_set_bit.

I don't consider this special casing; instead I'm unrolling the loop
4 times to simplify calculations not only for odd entries, but also
for those where index % 4 =3D=3D 2. Unrolling the loop here just for the
assertions doesn't look very desirable.

Jan


