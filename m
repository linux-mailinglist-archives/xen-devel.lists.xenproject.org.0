Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1C3EE8C9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 10:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167663.306064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFuhp-0007pq-Qt; Tue, 17 Aug 2021 08:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167663.306064; Tue, 17 Aug 2021 08:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFuhp-0007mP-NB; Tue, 17 Aug 2021 08:44:21 +0000
Received: by outflank-mailman (input) for mailman id 167663;
 Tue, 17 Aug 2021 08:44:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFuho-0007mJ-Bm
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 08:44:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e38ba344-262b-452c-b977-0ee53a435976;
 Tue, 17 Aug 2021 08:44:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-SjxeO8AdOwqqw9uMS9EpVw-1; Tue, 17 Aug 2021 10:44:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 17 Aug
 2021 08:44:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 08:44:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:208:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 17 Aug 2021 08:44:14 +0000
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
X-Inumbo-ID: e38ba344-262b-452c-b977-0ee53a435976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629189858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmRFB+ZtVNe4nUkLdzMq+5Lfg8uUNCNBMdtotOWbs3U=;
	b=HldxQMkQy3nf9ZG9b3cgIFDxb8gvL1D2EoQhUlLILECdM1bbbTJ9dR3YsvU2pNcx2jqMYh
	sL8Y31+rJ9uFdPeUZwbLK5BalrY7BdjjgiWQVn4nUpridtz4cCjl4VMQwsURk0Gb7mSaE8
	jSWkJnAiNoqPejoZhV5DoEzo+syVlRk=
X-MC-Unique: SjxeO8AdOwqqw9uMS9EpVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAcAXJntY8otQkHxN/hJTueSaBnEhZKELylgzwAx3eN5tA8+sAty89xiDSHcBznfRNOGO+XEBB99RiDfzhYCia2qmRd0rvpjpA2IfVQPWDWMrrxA1iwM1eNRX4FD9Mcnm5JYIJq42jRj2A4XYIztU2z+C1XdiPixyMDKBUcPQPlf2gry0GfzzIVfYQsKoierhOIKDLEkqDpjuIEHNnh5Bfl5ZKRNsymXGr6YtUGqZS/E3VO/IIWi0HDvsKftZ0+Z9a1zKc7XrAoPthARzdq18zfhw+eKRw4eKI427N8iHgTQxfU33fPmGtQP2AyaMgFAkj8j8dfODiflE4XzMTBwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHJ9fgTWaF7qMHftEoAjhmjVTM7DO3Izy/wkx2lUCrk=;
 b=d6bVO5osLp1f9cYBtXECrrtppjKqghAW9rQ2jbIcn/nR+4iWqfaabFVTw3DcHAHhK2D5edUUEcKxcn1/hVXMY86ns/RrIgBmh11TGk37UQITxNFXNC+VINx1UoEuVqFiJ/LklnKKL4g0Q4LljLHtnicmKboEK2txF7pWQ45B9af4dKa3s13dvutw9eMnwlTX5vrmn0F6h0RfY02RSaiIson5z6xBExcgIjPEgLy4jVal2NSl98qwvgLyAh3TENJgvbLz8lJz/ScQbj0Qr/CvjChu5LBzvKWAm4iwY34EvZDWEf/k2NjFHkYBzFHEJh1W+9uWVbQFCfSfXl34amucPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/PV: suppress unnecessary Dom0 construction output
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bed8e679-b531-e1b4-5ef9-79019fa230dc@suse.com>
 <a7b79e6e-ff66-2f5b-eda9-75552fb8a686@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c61b877b-a4ea-8e2c-dd16-8af8011b3c0f@suse.com>
Date: Tue, 17 Aug 2021 10:44:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a7b79e6e-ff66-2f5b-eda9-75552fb8a686@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0005.eurprd03.prod.outlook.com
 (2603:10a6:208:14::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0531c907-b05f-4471-f6d5-08d9615b3148
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5328EB4567A4A5E0CA4979AEB3FE9@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XTMkTw4t1UD0/O2R+pZNFgtghwxYH2DBpacK8kKD5KwlxEb9Ep2iGkp78xPNVF4gjxyGV8n5Y0JT6EWU32b1BsQWRi3HydjtHrK/1f7rLvEVnTJdH6qFX+A1l50izOBbJRxKyBosqrlsg/bhQy6xny6WBfjz2S+k/7aA/QrIF1za++AVgLN/O82jxX5vfLLhWg9qbCjm5dH4sDAYut87sn0wkHAR/SeVScE8NNd/MlCd3dHeeGcMeS4SYGfDMwnXXXOT+yZtwcGJ+Hvb+4D4Pj4uB77JwTMW1h/8v99X4tmN4x2gU4umqYdOev+Rao/4pJFJ+LnR7vT61rI06cv6W9e9vBWVVS2XhHj+0JlZ53U41TSxCpSBiUM9N68BBXOAMPBLiSAR59LkaBwJRheE/Y0GJmwOuNcN9bZr/lEwf0b+VgsbVXjA6GCgmL2pMXN+A5IcGMrmfVfVn0Nwd6BMcUG6VofQ/IcPQ9N+OxmBvlvpHHk+qJs1mShV//OsWhSOnrSw5P1osUTryu59/IaZN4uoiZUwRJcnp6jZeHMsD2znfE87pkTzMv1rgqLeANbZ2cJsRUsyHn2+4AIHxEoFl688T0fxGKibt1v4Q7I/jCVSbVI0RzK4KxyJDsKbWDXsqKpCkAO3nv1/S+Gf+9wUH4wNikwrv0CJ7Fxydq3bjrxP4u9uWdhC1uWjBe9aofZn5LgKjYdDeYwFwFFrLd0/LGX9xWai8yfqL7zQJ1gy+5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(39850400004)(376002)(26005)(186003)(36756003)(38100700002)(5660300002)(2616005)(53546011)(2906002)(956004)(8936002)(4326008)(8676002)(16576012)(6916009)(83380400001)(316002)(478600001)(54906003)(31686004)(66556008)(86362001)(6486002)(66476007)(31696002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KqK46T7yZpV43iJRGaPwkvJj/wZoEL4WnK/9AwHLD9IkiQmkLKccNmO88t4FBar0oPgksgUWwwW3MjdaUScOp84e9WVn2s2K9vABq7ooDoqqA/cE+EbjMgBe2OYxbYr2PSARPVUFddqD2etQkzxos2o5hZmtLKjOZipFgEBLFUCnrqtwkipqFdIgpoq/P9XRzj5unyF+2kX3EHABdyvRebaGm/MP491egSf1gQirRzUEFVbOUwBxlQ8z6M7wWmNQCYIBTTSuGxkGCp6ZUD8bPn6AAinXbXwT7U2Hbadh9vUQKdwo+7qmq4r4CWaNpIE0Mk9YgAnOhxENioWPxF9rSaXMf+Ik4/aUq+3xq56k7LRWbfkXsg8s3pJOYkLs368xtJAeslUY/ApDtpwUOsBRqbcgF9Ra8UWczvz/VmjlINp5aHS945fDt4y0/8TXi+57spfbS7xl9R6lBu+D+xEiRg3De0MQZEkaZlNZ9zwijAGU7zm0JYeZcR8uEXT30iq/aaVubH2hCxhwsLcvlzaZRtrMu2c/znol+MAC9jvz+ZWTyZWnx+8g67BxpxxfZASVfJ4zdovbrDjHxwpUkwBJpZ9lIwKlj8OWpPp4wGguTBi5utR50eQ6B7rWBO/wQX6xlrzoXnPgQMTR2tw4BiXQXlf/HVurVsvGUJ0JkFV1FeIwmDq2Oju7Y19h9iMzY7kdDYs5ghstiGOkpAd/kjrNPFpM+C5vPiUBAfDk6XcLhgE1jxf25exHgwMIihLAeMqk
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0531c907-b05f-4471-f6d5-08d9615b3148
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:44:14.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBB3I7z0EeZfNHV44jRP70z8OJ7yWIuhHydCdcMfXdj48rKFsmZD4OWJqruZDsd0YQdRn/PpGaMteMnyVKayVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 16.08.2021 18:20, Andrew Cooper wrote:
> On 16/08/2021 16:30, Jan Beulich wrote:
>> Especially with XEN_GUEST, being a prereq of PV_SHIM, defaulting to N,
>> v{xenstore,console}_{start,end} can only ever be zero in such default
>> configurations. And in case video is the only output configured, space
>> is scarce. Omit the two lines carrying no information at all in this
>> case.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> as this is an
> improvement, but honestly I think it would be better done differently.
>=20
> Each line ought be a separate printk() in the first place, and these two
> messages should be conditional on opt_pv_shim rather than
> CONFIG_PV_SHIM.=C2=A0 That will also shrink the output for native boot wh=
en
> SHIM is enabled.
>=20
> It also lets you conditionally drop the ramdisk line which has some
> conditional printing a few lines earlier for the physical layout, but
> unconditional printing for the virtual layout.
>=20
> And on that note, the earlier few printk()'s really need some newline
> corrections.
>=20
> If you do go with this approach, feel free to retain my Ack.

When making the change I was actually thinking about splitting the
printk(), including suppression of the initrd line. Since you now
indicate you would welcome this, I will indeed do so. Thanks for
the (in advance) ack.

Jan


