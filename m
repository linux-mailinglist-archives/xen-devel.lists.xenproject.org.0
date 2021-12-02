Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FC94667AA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 17:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236852.410787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msofX-0007E3-H1; Thu, 02 Dec 2021 16:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236852.410787; Thu, 02 Dec 2021 16:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msofX-0007BR-DJ; Thu, 02 Dec 2021 16:10:47 +0000
Received: by outflank-mailman (input) for mailman id 236852;
 Thu, 02 Dec 2021 16:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msofV-0007BL-Rz
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 16:10:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 666490bc-538a-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 17:10:43 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-tC3BLQFKO06QhcnL5BYcXQ-1; Thu, 02 Dec 2021 17:10:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 16:10:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 16:10:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Thu, 2 Dec 2021 16:10:40 +0000
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
X-Inumbo-ID: 666490bc-538a-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638461442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8c5YhVWrZJkhqgJjPBvxyRaWM5FRo1K32n4gXLEIiWw=;
	b=Gk3IdzXSb0S6WvQBM5nAkXzC/JAw6BytAzHLJV0ioTNr4rrLEVUuPoghB+wbq7O9dh0g34
	S4SzYKuQumwbVdixIipN/WgPKaZ6mZf1TmVGnWtDlp08/b0HbdD8dSl7zVOLlwg3XwYZOR
	Ip5deqgype10xqmLMKl0WwYXeq3X1Q8=
X-MC-Unique: tC3BLQFKO06QhcnL5BYcXQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cugkEtFzLIsS2xlQ3u2mxuQbBa1SVkO3tk9nIfEC1kHvFRGr5AwwfAMS1Nb2sZRBzuW0wyVuaNrwOaLM4DuJkvcQ/VOsEMf0+vuDETft2tiHxglaxdAsrjTCLUM9FqsdYYUiljCGxq+wfzyqQGB1HYWBO6caRffYQsV81+v+J8YljMdZDienTsuGbsWeNYAa9o6BfVP8K2fuDHUO83NCn8mTq+4vGK990n168Dy5m13KC8Mk1QmAWg9Mh/NAXfU7XzZYhQLWRH0Tt5OEutQIvN342bFr5MMcZIk7+gzgt0L0dZYVOvfczeoIYMIbE1TawE1MmSvRYKnM42m2QCIv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBbOQsBJIUhlgJqrZ8zkLK4TCyNi7tLVk7+u/4X6KrM=;
 b=VLEPphuAOIrp+otMxTmQw1DGO2ZYYDIpstyXJ/s/negFEJQL1aOZ2F6MfzZe+XRWJOJkCu21vYPFFE1UuQXRhsC/jBDngL1mhc312DK9c5Npp1IYUkrkTpQNUYrJhQ4+QB2EvhSuigjFeurS+C/M6D4ytE4GToq9xpud85GMLCE8iwmUkvs00mjrU3zZJxXmmp+QuQkGxzvm2lICD876ChfnmbI6c/CbvfNQnqF4sQ/ALHYuqfSfAI3fmmtb/6rRrk1c8b08mn8xqOc2VYpGfyVJWvqB6xxiWJ3mKlfV2Fi2UNQuByhO6iaZjVraRKKqRdMTeHs5u8qn44sIzGMm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03dbb062-002a-3770-61c4-4f93de73c0a0@suse.com>
Date: Thu, 2 Dec 2021 17:10:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
 <YajubFeUclKtpqV2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YajubFeUclKtpqV2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79c65085-8199-428e-c63f-08d9b5ae4939
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630475BCE45AD3B3CC8C7AA3B3699@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cgGSTUGwSkQZy6jk18unwUynxZcm/NQgoOtyWS0ySFBu/8sSWrCibG7QSxEV5UfqLRF4ct/qpo347HJ2GofidBd2PgCwKtyJKG5lga9fyB4d3LsHzvs8ll+u1MmhRAJkLW8Ol/cV19x0ateMG9u9jnlr/UxDH0SMOSnXaa6I8JVEETJ2jiDUTK3lWmxSbKWKBLnT/8nmT56zlND4u8RzOL8w97I2xNQfD6aY/+YkDDBsiK7kHOgXloiho9+h4l+ngFs9bVByOn6ln8YNForGJxr5cikD/7W17wArmW9wHGhOWc+vYLRfKFbIJgkcTEEPw6g+LEedD3tJB2zAIFaeqrHxfcd0PTacd4MJVnAHHMdJJpKKj7zmryrZeYeVnuWZ9j28F7SDmkDDE17F6vFdCKNXuvz0Otn5bb8T6JcLUE8OAOAzr+mtVzC95DAryf7PcKbgIPqXvq+0jqmpUN8szR3fQF+qoFzr7TwsQyYxW7Lz6MvbGrVBOoYVhzTVzKMwnGxnxf5SINlorFQULRCwuxeM//8c2I7kX1giRNRyE3GaAt0PRo2wxqsVJgL2bLVPmhRa6XotB5azoKQYazoUhtcK68BckuL4uZNO3UHsCmEfr9pOFe8xDhXacMnVxoQHmJgpwM8Itjelgh+Schcs2r/zvJvV50DccTXd/P67R/GfzDsiK6XFY3TGzpEUSoxO7bSwV9gOpKEDUyr5Cnidm+o4t8tMkB4Y+BkMeXg2hw7rWdiqdhieJBKD7SwQBYWa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(5660300002)(31686004)(86362001)(83380400001)(4326008)(6916009)(508600001)(2906002)(53546011)(956004)(66476007)(66556008)(26005)(316002)(16576012)(8936002)(186003)(8676002)(66946007)(2616005)(38100700002)(54906003)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ly9sFiqFX1ohySeNqtnwCMKnZY4Scts8snfJEtgrOjLPJHQXXmWg2WCIt+ub?=
 =?us-ascii?Q?Td8JzcM4ODVPzctxi+CGBg1229yTqa+Dl4mGmqlfBa6FxsncuLcGhoMq0pJg?=
 =?us-ascii?Q?KqAJbGSt4XP4/1lBDo9Acp4e64wNSmdqLuS7imoTBHUay7z2U11/FqkStFPs?=
 =?us-ascii?Q?lLKfrD5w4lvi+vCX4Isk1lBeC8qG7AKGdFzzLiXEUApUr9UvLStv29Wczd5k?=
 =?us-ascii?Q?EsFjwtXfeAxNfTxKJuALkyAY8brSkZLVdl6GIR2DMzlRIxU0jwcdRju3HwKy?=
 =?us-ascii?Q?ZgxDwfM++BlP8mHZu6PSGj2HJbV40csW21Y7dW4nYB2McjCxAd6nlaObIDwy?=
 =?us-ascii?Q?bZq3Du/maI4IokUuSfBA8TmiB8bNPcq0AYD96G06EIgmxOrvnFELd1wbjMq7?=
 =?us-ascii?Q?N6ytauy80F+keovnKMgG+8uVGhuR6C4aefWbniJSY8/0DIqhOvUac2+OfzZA?=
 =?us-ascii?Q?UDK+Ou3sA/NAno+HBxudHFIdph7P5FynzlJkmXLk8M1ooUuZqSkmlTr+onR5?=
 =?us-ascii?Q?QuYDuGwZGCF8aw/bskmc9W9jkcOoefTyt8v9hF9mUABrs81E1gdoN4lBV7Qv?=
 =?us-ascii?Q?zlzutq1EwmsmZZvoQ5ufbvb7bYatWeidWy26Bip1ZdZ35nfQllM65rNtw9c6?=
 =?us-ascii?Q?aNFfGEn4ragicZzw6rx/GZDKWgrMEdBpbnXo9GnL03mu1IDzfK4Pj/t0TdbC?=
 =?us-ascii?Q?ybVDVin4Hnc6Mr2JKmrO6lUeF1o+MfkaOkGrENZT9OjliYmQu9It3P3YasME?=
 =?us-ascii?Q?gkzHhhPgg0BpvQMqWKut4nmlpJo67r0ImQJU19S/duj7nqEk2CbbK9kTsMfd?=
 =?us-ascii?Q?40LVCjKlE9rEdcThUWJFcy1LW0tUf9gZ3YtbAuRyjlPpBDAO9gnytJqWxR+i?=
 =?us-ascii?Q?AgF6f6xMRRadyFVsys2HziWYu81hq8dAE0Jsl4npDi4n0oyCjxMZaBBHdeUg?=
 =?us-ascii?Q?zLNnL6KOCtmunikkQ+TEBCssB51Kk4dPNxrbNpSAIXEV7QIhDQVT8jf7CCOc?=
 =?us-ascii?Q?4wrqgxGMFjDLWbiEHv9P0VaPTnAiTrvrBK3T+ztGpCYAHSESzDYFM3AfOnHU?=
 =?us-ascii?Q?XHCD83FzM0M6U+9Ak2J9vI6vW6CmYacpIF3Why2modOp6lRI0PB/JkPNJkVD?=
 =?us-ascii?Q?g6Pm7rJEoEs6JUmJSGMewsiO3xrIXLLKQw8gkjTQoTkniQjxYrZixouf9t0K?=
 =?us-ascii?Q?Guhtn2go8FFPeGqre+hr0mZf3nUdZN6OTpupyxRwMe5fxcYnN7BvdiDXf15t?=
 =?us-ascii?Q?eNon5UGlScf8rx/I5u3raWk0iCljW5YWTx5cMxo0oZWIQtzTP2ZmZtlc9zmG?=
 =?us-ascii?Q?xmHEa2sirZE/l+zu0EHvaX9DPgBv02ed44tvENfXBSETwFDXAc/8CSiNbzZ3?=
 =?us-ascii?Q?bpkSXROkxvv4V3ZABxGX4oZkP0CLGqDUpxBm8VvUni7958UgdLlPbBQd8qvb?=
 =?us-ascii?Q?SacD2iDOFD/LWbgt1eWD0+ZACLzp2I+QjcHLWr9neCbzu+StNX96ZXuqIb9L?=
 =?us-ascii?Q?DNfxpQhL86FUFWWO22zj0feMTwsusTlabMZtA+pLrRmtwniXdut9BtvJnE93?=
 =?us-ascii?Q?o+zZHxQMsosNMu1Tg3aC0ir6E+Gq3ebLTJLBMkK3hBm2pKlzE/ThAaLmOBP5?=
 =?us-ascii?Q?f/STR7IlEEW3WtEsOeWa9SQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c65085-8199-428e-c63f-08d9b5ae4939
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:10:40.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hq6wsku1oAvnYAYp/THiwLgf8Q0rQdBEeT6VTWTJSu/4R15JzzjCcQjT0dkZRC0pEBIf6vKKSdt9xUxBnDeE1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 02.12.2021 17:03, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
>> For vendor specific code to support superpages we need to be able to
>> deal with a superpage mapping replacing an intermediate page table (or
>> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
>> needed to free individual page tables while a domain is still alive.
>> Since the freeing needs to be deferred until after a suitable IOTLB
>> flush was performed, released page tables get queued for processing by a
>> tasklet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was considering whether to use a softirq-taklet instead. This would
>> have the benefit of avoiding extra scheduling operations, but come with
>> the risk of the freeing happening prematurely because of a
>> process_pending_softirqs() somewhere.
>=20
> Another approach that comes to mind (maybe you already thought of it
> and discarded) would be to perform the freeing after the flush in
> iommu_iotlb_flush{_all} while keeping the per pPCU lists.

This was my initial plan, but I couldn't convince myself that the first
flush to happen would be _the_ one associated with the to-be-freed
page tables. ISTR (vaguely though) actually having found an example to
the contrary.

Jan


