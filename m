Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD540966A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 16:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185752.334473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnL9-0004IR-Sa; Mon, 13 Sep 2021 14:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185752.334473; Mon, 13 Sep 2021 14:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnL9-0004Gh-Oz; Mon, 13 Sep 2021 14:53:47 +0000
Received: by outflank-mailman (input) for mailman id 185752;
 Mon, 13 Sep 2021 14:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPnL8-0004GY-SA
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 14:53:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64aca1a8-14a2-11ec-b3b9-12813bfff9fa;
 Mon, 13 Sep 2021 14:53:45 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-phxAIHv6OKGQtJSZsWWlvQ-1; Mon, 13 Sep 2021 16:53:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 14:53:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 14:53:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Mon, 13 Sep 2021 14:53:41 +0000
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
X-Inumbo-ID: 64aca1a8-14a2-11ec-b3b9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631544824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BxbF0wOkqVuizTCkYCnWGEuxFb+oTJxIc/0InreWG4=;
	b=RYocRuYNmeZfG+a/7uh7b1ABlQqEvwswZFJAc0YZeTGbPECEdM5sTfuqx8AoDjvdYisSJo
	lXfKp06cDQf7X3hlvcAUgjWBEOlC3S+Gf/dZy9Peeo1wjSWMrulfTINIvkX3kABatWmk6k
	m3VJj0D53S/2CWm4XAqz93cY+Hl0mAg=
X-MC-Unique: phxAIHv6OKGQtJSZsWWlvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jme+vsoZ0xXfVZHNJ0wvIG735bSu2yXWQOjWrLO+irL2OQuX2gIGtlX8J/H7m7/vLC1XZDTKZevj4iK5MafwzUWhjqWziRwH4uK2SA0GF2LDlixuEkvYWh7zYQp87t7em6/cPDxbi3LDsFzBQE9QoUO+IyiHG56+VXx2BZQMkNK0JRgZ92qZhA9lskkQywHl/wECcnK4+3MBaJvVrFR7zYNgRC2T3p11QoR8w8MkCXDxt/QyAvUZdeer6rQXnuPSSAxv0IzbusqstoVMn5bjFv5PjjiTHnbm6RGK+xnVuSKxnAer4fwsuoERr6rQh6vDtvaMuQQMHKiJsDOo1TQ18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+CL2492WpoF54KuVMrvjinzjgufY4hDJluNqOO7t6fc=;
 b=Xb6ZRqRJMYcys3TxEKFYk77qGQcED5wre9AkGalm0O8a4ukGf3vAP/JDSLwdhQS5HCtrym9PeTS+efvYYANDiRvJOhdc2K7Aw0+t3LUrh0nIS80HYKk2ws8IPoaHqzty45UJbOlWQC8+4OzeNJWP6czg1RH/0Pd0qR4Ndczz6k+EAmNsz6YICPg+b60hTr8Aj5Kivw2ML+ZbUjkioqAP583JwytURPcRZ5QLZRx6QplBSbO5lz+byUvki8rdm3srr96nLFnAsjgOB6mLWm877gGW1R8gejTwgYD1DxCHd+nTRVPWr2UOqn8QXdz1tBbeiCUtRl4SRWau3A0ztONvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
 <YT9eL7b7A8CirzOa@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25560e35-ad35-a775-7b38-284251b8a3b1@suse.com>
Date: Mon, 13 Sep 2021 16:53:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YT9eL7b7A8CirzOa@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c115ac7a-ae0f-4c70-e996-08d976c646f5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484691D1F002150AE4415563B3D99@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aCAklCfx5k7IPF83hx5qCkKsO70Y/k/MvVe8V08lzKW2LnR1n+oGrMa7eGMVUdS/gZFcV1qed9zV3SsdnCruQvbWBNOPrwi3tOgO5mGikjCxvnySt0Zr6dmxCdZVVoEPyp2CQEW1HH4pqLZz63NdX5OY0Q096qhn4AUIzbw7sXRZpMy4UhaU9RNQgzXdEuY+n57eAjAuUX7QcaUNFuQ9MJ8FGiw/IEayd3Bv1qBWY/o1UPjCO/uaB2q0UB8d9BSV+pOvwAXJO3ke/qOHmCWXMCZO426H14W0xJFhklNdydGuqM9CFymeSBkl4D+jo+xRhrmtEHDSWCd8kFMCrrZm65Qyb8jk0TFcvzsO53/MFE8EibUWCiXOK4Wc3qbUZl8xu9y3RopQygK8aVnpbOmFE2zWZArMxxUil4K6/D9ty7SN8kOHVAc9W9lXAOpfhlkp+wGqbhaW4IaU48gbdFv5jFbg5Jc4OnSUshf5U/G1eExeYISc+arJQOuOHhzb44/eRl6nZjOGxIE88VtCXQMRoErNHjj7Eysu3GOi7/EfK6rxouxRTHgW+eiBUBqnd4lPlIPe0hcJrEzgwha8GKaamZlSLKeCgfPedeDHjueFDeiwvpjWQVaWjKW1sgdY3w2oYaPO3IASwM7rCUkH8am7NDsEFYTqPx3tuhwXDP4n03QWYRhu36VMEwBZUe4zgyDV4E2+NODA7O7g4O60N3hG8A1Z2bykX66e+hj9RvDrtRKhiqkXOTFT7tP4WCkj3TFf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(376002)(39860400002)(396003)(956004)(2616005)(66946007)(4326008)(6916009)(5660300002)(8936002)(36756003)(186003)(6486002)(316002)(66556008)(31686004)(86362001)(53546011)(4744005)(31696002)(2906002)(26005)(54906003)(478600001)(66476007)(38100700002)(16576012)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pxETmIzGf/qrDanq0byO45QuroIsqcrv8R2Fva/kjup8VhsqPAXuqLlHUWo0?=
 =?us-ascii?Q?Q9IKq1cq1MHP702cjwgCv9F+BJJLnJpC7ylxpk9mbSCmNatVwELA3otuTUB0?=
 =?us-ascii?Q?VfrnEXjmnT61kbYvgHOhX7bO+dsh2goPbtHZrTLIDWZPENNLugb2WZIGvCGf?=
 =?us-ascii?Q?WM8zRs1DZXFL8pYhVUNuazDfhbEOsecnkKdDtlMAXZjqiRx+uIv+lQJ/jh8s?=
 =?us-ascii?Q?onhWElDAEW690vGN7VnnfZZ7JZrRr0N9FfXzkhFFN0a1bMXdjht7T83Sd2Bb?=
 =?us-ascii?Q?Gca9y9FIaXp158NhLHdqoFckjYqvuaw1xpdWgzMtfwYipVXlqfSZiB+D77w4?=
 =?us-ascii?Q?KyNOAkxnjKWp/eWm+LcTeQ8SihrEBRJCnsznc3alJ2+PC7gMdaYx+gIrWRoi?=
 =?us-ascii?Q?7lq7jhmTuzODfMckLsBLH1G5g8dX7mkS/xx/h/Yp3I8LybhfeuBW4+nTCrYb?=
 =?us-ascii?Q?4ZPQeZOXogAt93pcM5GaX6/I5eMTejkXWwW0kulVRpBeUVgHh3yoxKqEqXBE?=
 =?us-ascii?Q?bch/MqCk45jtW8MkIXd7t9KMuJlNxU8h1oXGNbCiLc5Y0LgjnjKjQYfn6UfP?=
 =?us-ascii?Q?AT1rpZ++r2OY4hoe32YYJCcvEC3K3qusXLjlP3b1jv41arKfz+4hdiaSrMve?=
 =?us-ascii?Q?Ynhu8un2laJDeOLSujmL51MdHdiwEcU+TS7Fyz/up1CTkIg8tknJumg/pzVP?=
 =?us-ascii?Q?qY8Avxz8qpzKZEgi6pdG7W5B2aueiNb9TST87fta15JK5siE/qDbBgYKvavM?=
 =?us-ascii?Q?t8mrqbQzYuM/r4eWhIYtwIJuoa7USbBc8WKRzqWJtaKOhBtc84TdhYamEv3P?=
 =?us-ascii?Q?zfDuMsshHx8SivA2E0NSnrPRrni0BW7vVATwwYR0bBlIhR5uM+Jz7Gf8428w?=
 =?us-ascii?Q?z7CTYcdl/gagfhS+RyjmRu9xc8NzDkwxEhWbPwg4heEDDIx5NN7tGTEkuxYx?=
 =?us-ascii?Q?I1IaACyVScnkZSkD7cI0m4tB2dFG/8Dx+GYWTrlNbKRwszc0DLUPdXtfMDeQ?=
 =?us-ascii?Q?sO0gpzrV9YX7N0lFtR+GoILUCsqh1rNEXVkCFXKSfhBUbQ7jD5rS4yVEL4f6?=
 =?us-ascii?Q?hN5xdSQeF8qsY+K9CI2uwF/JoW8gF5Of/9lM9QPjpru7Fh2scaYmOyVflxMB?=
 =?us-ascii?Q?oZjrLwhcqq96E03QdSLdam+bmEo+ZCsUtXgKqOEyl+ShskTCrCOKL0QxdXUE?=
 =?us-ascii?Q?wGwCM34rTFrCO5GBgkmUT9+t7Ygx4Ph8SgzgnGTuHPoLhpcxTRbi87Hh7DTb?=
 =?us-ascii?Q?RHJXXFubZBynWxc0eGHvNb/znHIk4neStzwhks4A1++M2Xe2cbWFDjOSwKzz?=
 =?us-ascii?Q?btso2r18m03u7+Di9x7IS9PP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c115ac7a-ae0f-4c70-e996-08d976c646f5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 14:53:41.6868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgtKuuVCp0Suoyl9vGyUp8DvbhhzfMo28Hji61qxfV8TrCCpIJzOQRcHfvZ3Ut6sTEMt7AVT46EKzy9AN0O/5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 13.09.2021 16:20, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
>>  .PHONY: clean
>>  clean::
>> -	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
>> +	rm -f ???.lds *.new .check.* boot/*.o boot/*~ boot/core boot/mkelf32
>=20
> Forgot to mention in my previous reply, but what's the point of using
> ??? instead of just typing xen.lds?
>=20
> AFAICT there are no other .lds artifacts, so doing a 3-letter .lds
> wildcard seems weird.

efi.lds is the 2nd one to match.

Jan


