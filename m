Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B576248C7A3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 16:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256739.440738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fvp-0000iW-0H; Wed, 12 Jan 2022 15:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256739.440738; Wed, 12 Jan 2022 15:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fvo-0000gb-S9; Wed, 12 Jan 2022 15:53:00 +0000
Received: by outflank-mailman (input) for mailman id 256739;
 Wed, 12 Jan 2022 15:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7fvn-0000gT-37
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 15:52:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6814866-73bf-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 16:52:58 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-tNikZQh7P3uRkYDduV-okA-1; Wed, 12 Jan 2022 16:52:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 15:52:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:52:54 +0000
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
X-Inumbo-ID: b6814866-73bf-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642002777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KV2vw0b9d+TuS933+B+CTVlS6ua/KZYtY/fgMgwL3C0=;
	b=Fa7wU+LcDAUKe+TIhICkUdxI11k/iw1PWjXOGp1xolVDg353Wn2hBEHaieX3EhX0cEvv1J
	TYQEctXQPOMoJaxUfNuv7OkUvd5zS3BTFQEJ3friuDhRuoHJ+ru/5omnZ1bt+ajGwSmln9
	Aqd9G3hxK5RPsxBdKHsyrIlG7IKqyAQ=
X-MC-Unique: tNikZQh7P3uRkYDduV-okA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctij/2DWLaNQfpo2xGBmATkU5C74eSAtox6gkAYc8Dlcd5LkEdEpKn6fUyBQaSG6O7DdpTo++vrXT8GCKSlOMNtlDy98UohBwtVjXPcTmTjV8lGx5KAqBT6p97TO7tF6wN/iFGepBRQbXWZe8wNRdtpYGtwHFjxLKHZ23lYOyET6K56pUUJLSC6xOlelDg0rONcS5MrQ3zY55z1Q1nL4ocohQR5f0twpmXJamedGuFtCyphCHWKFXLYlv4sGJdbroTzr9dv5oErUVH5kyNfXuh6zvoBnKC95ml2QVGfLujnrOEwlHsezndoO1hctkHnz9T1v8vV/QcpftCplH9p4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwfi8e4CEqUxsEeBbHGscrvKhlOZGR44hx3/ktbTFqk=;
 b=Qd8e3sWkKqGV1u7PxNV6GwmfyWK7KRUmhj9eUx2TJMXbXVvtdUDHE0E91iO8oByYMYIjH4fQoPzNjW/Hl8GDkDTY9++cJK5f7pUy8XjAIfOn54cA6+0ugNwowx3f4RbeFr1gX34LIhgcGbeCT/9sVepzOxfAQAOuCAn5ZbVhh8JlI96ziTOxiL/D8EAItZmuXkNRNAlPMUo18PDyje5e94yTlBKcVrGBQz+SigMbwNQM/vmPO2H2WZHvwpxClRoLOlflC9E406dsz5kvJfr5VFfzejCIx6Ljd+WdbbTxRFrnaQT6P+ALEgUg2w0pc9XAjFjkZ+grpcO9IU6jiN9J6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fb1d547-6f6d-c4e8-b2ef-0dea780dd66d@suse.com>
Date: Wed, 12 Jan 2022 16:52:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, julien@xen.org,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
 <Yd73Aq4w2H1Eo01h@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yd73Aq4w2H1Eo01h@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf68288-ae97-4bd4-32e7-08d9d5e3987e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478DE1AA568D7E8A117D268B3529@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPnFcX0Ssdhv1sO50XdZys3YdbgD+Dl9NXZUtOVmE3uO//3lwGNLcDrUcqPCM8sMTKI2Q1LaKizdmYbPmkRGOi6652xX9Jy8nvkr+fnKDy6IhjDr0GhtK7D7bMjTqIofPo/A5s1M+YG1wukFGr3YxoqCotjPCVXMcxfPBsMTC8DGcN1Abigj6BT72ucS8zTFzJ0y9aZQLu1YGwA+jkhjinAfMCGlcLH7uEVls2AuGFssQb7+dyq3qHW6zb71gMnf3QFtr+38rVD29XFt4tYDFcPzXeAYyMIJl07qtCu4ef0aR5ALVpXQmsvHoptvH0fWMHdsoJsqRZy3cgjrra6SRSf0rr+9mZ4mXmAIyC2haqeNbvoINEpFKeLP4+Gp+dnSNhn2ugHDdtuWEFpLjuHPppD7uaxvft46aUxcZsyNdVj4zUcTCwlgp/s8jt5aODS0+yl+k6OqVF/TxnLfNVP1vmET45FhPOkPqL6m1nlP5sZZPUYKOVJzESOPkupycAqctZfHs5DSVGqr667efwi998xrFdQ28mwIKInLBnHNF4xdVhSOuBRx1vtnyHsCbrVolyeITLC6qJ/zex+c7/b4A2b3IQBU78ULiAGGvr18Lf3OK1cdpOq+B8kqTOi082L/NTlrzaKh6ybvFM6SYZa9Gmg85gP0s1bQ9GLJEVdI9TyH4ybfWT9Rr1RqY/IJAG3MBR48feSFsF51wUCdEpJD7ZHcIi6Wtlo+qYxftUL0I48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(6486002)(6506007)(66556008)(5660300002)(31696002)(36756003)(31686004)(8676002)(4326008)(66476007)(54906003)(86362001)(8936002)(83380400001)(2906002)(53546011)(26005)(7416002)(186003)(508600001)(6512007)(6916009)(6666004)(38100700002)(316002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lcB8VS5FX1f6VOu+6M0OtZjmBBsqLyxs3nMutO8ibbT8GECktcbhskk0X5Sy?=
 =?us-ascii?Q?hIAND5q16tYD/pdBd44Wzc+5VNrfBe/SAeVgQVWfjDVGDgo6COSGVVYd0KO3?=
 =?us-ascii?Q?hMHLFtaF02TmcIpq46P3HiEo+IpdDP7vO6B43wShK4A7q5LSJjKF/JQJUQ6O?=
 =?us-ascii?Q?B9dkqDhx+dpjafsxLIOFv1xAkq2W5dyZPtnUOcEVxiFuqHj/gulDPjiNd32G?=
 =?us-ascii?Q?GgTtg+V5IMqQKxf3yPonv2LWZq6jfV9JhZ4wnqOh1KURT1D4ftpkSDKXU0tW?=
 =?us-ascii?Q?ZWPyM68RUPVrwv5thN4e2sPDy0Q/8PIsD1ivLfYJxiMRbB7y8srf5rM/LFNF?=
 =?us-ascii?Q?p57J2d01nvwrAvpiPYOq2vG38p4sHmEyRczfPJHKoCcryle4BS8J6Ahy8McW?=
 =?us-ascii?Q?rNq1kaZG3f4Y5vENMK1tcmjpkj2TqYe/RNCsrf976cMChPAuQLvMYB03I/6D?=
 =?us-ascii?Q?czKL4e9pEfcgCz9EGRgn6Af1z0T9K4brPv1xs22m0vbPI+uN86w+XvDRck1N?=
 =?us-ascii?Q?/MewIkXoFGD1P90UfQ1/YJEGI6B4oTXOr5D+OSV5hVz1eHtG19Z0i6MVtPFF?=
 =?us-ascii?Q?We2hAmYWdrkVg6ud7q2Xi08NvMV+xQyTzjHxUwNEeRGK/4OSyoOW3q05y7aQ?=
 =?us-ascii?Q?LJDjY4ufmOOWK4RV0Ry3UhgZ6+EckNOM3nO8A5RZDLv+FPn3dprdH7/1GswY?=
 =?us-ascii?Q?QiSm2IuclDAki1Dv+nIkHqzpIAa3xSaKAam0GOn71RoAjIRYfdthI8qfjuYI?=
 =?us-ascii?Q?RjuM9tOKL4gziVXAZ2PhH5q98ywPBajYWiLx8v4ikrk7rmfFLEYaeGqZHyBN?=
 =?us-ascii?Q?Z+edUQnah0LRrX/n5Nxlxag9Ecler26F5FvqLjn0fM5t1exnm1cvf2UX6F+/?=
 =?us-ascii?Q?Gl/+nXGXROqi4sSHjqkfAfRgbnZbpuuRgYeCjsDMLBG5+/2noo9o7q4v6X2G?=
 =?us-ascii?Q?YECtkdwaw4MDgZ8O02Qjx9tiTtbFFq+BdPoCdiLI1AzH5+B2EjSBdF5nSxpG?=
 =?us-ascii?Q?9s9UbiIVsS8o4y6vTcsBhbue1GCcKHvCLl1MnZtnOsKeCbJNpqj2b8qQQ3QL?=
 =?us-ascii?Q?1t6PfQ4DZjw/0t3/sZ6IEZcmB8xM7KrklVg3LHkcYiuQJNY6w1ZCEvpFatmT?=
 =?us-ascii?Q?uuhqP/+kRPpyoq6IR21lOyHbZ3EPiys0hh0p/k21IPV4BHFUsfsjRvlTH90A?=
 =?us-ascii?Q?e/Q+74CPxCJ/boJSRnrTvefE1stG8RSRSTvZU4p7PlGPmaue5xWxGNkhfreC?=
 =?us-ascii?Q?z65KYvHNR1J7D5D8mx/HuLz/Lv2QZJEsmrtRvdMs3FvadApiP4FV9H8EUQRS?=
 =?us-ascii?Q?fvMBnlHPjHt9xrY2sO8V8PCpEsazbDdGaSPNyiIFizF9CilOFhi3EhghgG+Y?=
 =?us-ascii?Q?u6pn9ncruEZF5LRMXNzzUAIMe8+jle7oWKx3ZsGrhYuTwM121E5Mt332TvaR?=
 =?us-ascii?Q?9uepUWSiQ3ZAfOWw+wTZmZ7SYAJEX9X19IJWSnS0jrE9c/0OB5YshLezH/LU?=
 =?us-ascii?Q?NwVU4iEv+MjMK/32tZZHamktke7t4sioRn+QWaBttL3rw7tBPjOrJl/AjFF+?=
 =?us-ascii?Q?dWnc5lmYp30E87TTzh8z6z0Sa4XzgFfVgZfRYCMogdTyWanlmh27N36CD8P+?=
 =?us-ascii?Q?HzC79s9VRKEVqk2KTfbyFsM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf68288-ae97-4bd4-32e7-08d9d5e3987e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:52:54.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFpxpb6sSV6P3ZmK/XXcrH8OMJJPX5Zh/9YMuFm9DeWUh5ZYxryW9srx1tr5ReQ0WWEiUEAsxDh8Vwo/B341nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 12.01.2022 16:42, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 12, 2022 at 03:57:36PM +0100, Jan Beulich wrote:
>> On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
>>> @@ -379,7 +396,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int re=
g, unsigned int size)
>>> =20
>>>          data =3D merge_result(data, tmp_data, size - data_offset, data=
_offset);
>>>      }
>>> -    spin_unlock(&pdev->vpci->lock);
>>> =20
>>>      return data & (0xffffffff >> (32 - 8 * size));
>>>  }
>>
>> Here and ...
>>
>>> @@ -475,13 +498,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg=
, unsigned int size,
>>>              break;
>>>          ASSERT(data_offset < size);
>>>      }
>>> +    spin_unlock(&pdev->vpci_lock);
>>> =20
>>>      if ( data_offset < size )
>>>          /* Tailing gap, write the remaining. */
>>>          vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
>>>                        data >> (data_offset * 8));
>>> -
>>> -    spin_unlock(&pdev->vpci->lock);
>>>  }
>>
>> ... even more so here I'm not sure of the correctness of the moving
>> you do: While pdev->vpci indeed doesn't get accessed, I wonder
>> whether there wasn't an intention to avoid racing calls to
>> vpci_{read,write}_hw() this way. In any event I think such movement
>> would need justification in the description.
>=20
> I agree about the need for justification in the commit message, or
> even better this being split into a pre-patch, as it's not related to
> the lock switching done here.
>=20
> I do think this is fine however, as racing calls to
> vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
> around pci_conf_{read,write} functions, and the required locking (in
> case of using the IO ports) is already taken care in
> pci_conf_{read,write}.

IOW you consider it acceptable for a guest (really: Dom0) read racing
a write to read back only part of what was written (so far)? I would
think individual multi-byte reads and writes should appear atomic to
the guest.

Jan


