Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71F3A299E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 12:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139821.258463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrIEZ-00046p-BX; Thu, 10 Jun 2021 10:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139821.258463; Thu, 10 Jun 2021 10:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrIEZ-00043l-8B; Thu, 10 Jun 2021 10:48:23 +0000
Received: by outflank-mailman (input) for mailman id 139821;
 Thu, 10 Jun 2021 10:48:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrIEX-00043d-KX
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 10:48:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25085f1c-382e-47e6-9cdf-a9fa836cc71a;
 Thu, 10 Jun 2021 10:48:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-hlbNZYm_NSeB69vjGB0GOA-1; Thu, 10 Jun 2021 12:48:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 10:48:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 10:48:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0074.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 10:48:16 +0000
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
X-Inumbo-ID: 25085f1c-382e-47e6-9cdf-a9fa836cc71a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623322098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRXC7e/10hM3vysBE7o6rC/+9XiQwbKNMTh1OfkDXOQ=;
	b=iBnD59eKiriLSqd4wIDzvskI+h5XstCmarR1P+CjAdD4WMv2N2KCVI4u88NQ1SqE2H7ywf
	KQMhtFooGvHg7GbYm4W+sMGW3biXzZwlheGPE5OCYfdZY0UIP4wkpx0yeWZYkM/TVsX6Wr
	rdyAzuqRaUFUPz2AmJr2WNb0SUXS/Io=
X-MC-Unique: hlbNZYm_NSeB69vjGB0GOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hX7qLixLm9pRx94FSEqiIa8JrYtKE96I3BKuZZFMaykJ+lm6CggTNM/J+RRZsq8EgVCQbyu3k9YZ72Bkuy0ibQi1EjzOydLFYxqzUgQja2s46EuDlUZhfZB5mFZl9YFmeYUOXerrUYdAv2K0dULUKQoXjJf+vQA2CiE1HKmLNg0YOuBj44kWDFM8Qz1bcCDp7yYHNZ8MCIHZ1prJ+PQw5sqa+NdExmLqDGVmyJwbHAgUl1dVpJus6I7smoeLCwXtsGf7GLxw75AUMmKUiNQuAu8ucFc0RFtZMp7/HjHgylIRDE2PYckLZEEpFec/0QpB3+sMnBXm5YmHFo7ruSCl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gw34B5bF4ryf/8QK6Mpyf1ldonxYpGyZCdpsLUUIdk=;
 b=ksylpRNrp3P1uzMdX+sRzFxH52QJdvjFVWocd5URhqjvV4a+cqJiYK0kPrtnVMD0H+Pvi6Zh2vL5fdjHRkxQmyR0eHmjf556J+94HgT8q8FLEo0C6J8SzeXozoYoYgXXS/s/cSDTultYpr47R0afaty1cNX5CUPcqM0UJgJ+32KfgdTyjHhgItETEBpiZCt9fD9aGoHTCCt3pNBJtDLt4N/BdQ2uuC2yJWghYiYmrw1aoq5qsFcixirbkGKaSCU9U97tywxq4oE59nt41awdnqfC8BjTgV1iYdVZGd9lJRTnkZMYLbAg8BCzP9QpqMqcYFdAKcFiz88GaBhVleIKmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0aa4bf61-e08f-6da0-1cda-48e61bf876af@suse.com>
Date: Thu, 10 Jun 2021 12:48:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0074.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1fb4bae-11d6-478c-265d-08d92bfd40dd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165BD8F97730E93D13429D8B3359@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pEwUwebPbgoDMUAg34iFLHnrq6SsUOghQnvW3KSa9ekRKN1uEJCAZvsAKvWUvqF7ZXs30BDOEs+43lCuhmE044eV3rQ4BRQN3/SDQykAtphi3WiVSwkcxC/BaqV4SxhtCdKyGeerU9GQWGH9P/XeqDoJNgD/Z91WVX0AHtl709aQUAYpWmEXVnToR6IIP96R5c6VKtPqcH7N7UZAsNTGSEDVV6OQdoFgKrspyihiYoorLpoB4nBkZF0GwW8h4iKWx6gGeaCsoEgptBJb7wqNG5WvNMZIxc3HLjtgh+Br8zutpWd32uQn4eHmjPtR2isqDDZpb7gCPaNtHDFSmSpW7BXtCeyMjOWokRw9LWWh4a0/mVy4Zpc9UTJ1WlXbtEFqaETnyMn7qUpGCn529fB7pkBYd+bNXS/C4/2d4mE26dqL9PnRO+0hGVYNmx4KFHQnqsqgAQxT4BT401HP8IAPfaTnC1LPu5lLxRMS5o0btfabJyxf0bUB2yzLAdRwIAXPVWod1lksP4Tp2f394TXzfIGrXPqqzpZwSx8Y74pwLyuGgyaNpG8L13Yw1nEOCPTWx2BAHqM7Fx+6OIIYSPQD9NH6lqi+5QGJN9WbslZlA1DU24roRnkP+QYbeidxgjgTnrhZt2Xl1nDrbUq7YWT/+cyVQ/1OuBACOkHVI0bHQVoT8YUaHf+LZ5nKM9erAwWQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(39860400002)(396003)(2616005)(16576012)(956004)(8676002)(53546011)(54906003)(8936002)(316002)(2906002)(31696002)(66556008)(4326008)(478600001)(4744005)(16526019)(186003)(26005)(5660300002)(6486002)(86362001)(6916009)(38100700002)(66946007)(36756003)(83380400001)(31686004)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?N69YkhDnlq3UA4BdhBl9fX1EPsXGKo5K3pf69MD8M9DMpQJkPyV3NCCKLTYV?=
 =?us-ascii?Q?bwa/iyElqRiFVk++i92O04o5/TNn9j3bDkYvbWfdbsPUiXHWHU027TjtFdpe?=
 =?us-ascii?Q?qSnbpdEBk6NCQqibQRkUp9odF9/EOgcr0Tn1wZJviCLlDcBVIOo9ZwvCpNsU?=
 =?us-ascii?Q?wALF06Zt4meccWPeeLBgUwT5xLs99pVK2SYjIrYvOAWVLBfS1nyJNUU7WY+d?=
 =?us-ascii?Q?zqg0LVTGpJij2ngjE3W+Jlw5f8PgCj0siFK2sbnoFv6XCMyYo73WJVVS5Doy?=
 =?us-ascii?Q?g+tqc1KjCX9x+HLOL/EKPMyosIf9AlK/UqjmJArItNHnhoLkoCKtzW1y0tiC?=
 =?us-ascii?Q?8FbQxzIqylt0JeleyFXj4eV0CXaqQfL+pHJbj3tJ06r12oXJTFNg/l7xw3OJ?=
 =?us-ascii?Q?tzkhYuflOZSbj5a4JEqacs8RgZPaXgb86nc0MyVFsHOEmg4XwK7BKJOI31gu?=
 =?us-ascii?Q?F1YE1xvpcOoEnJSaLLYSKsCPIenp4d4tkNxF+NM0EDuHRd4u5VJUWQoO1MUH?=
 =?us-ascii?Q?ix7MirRgHyVL9NFX/qM+xNIHZx6ir0322sTm9dHekEWaRrIKamnjtNn2IDl8?=
 =?us-ascii?Q?fT8eSJlqT9uZNp6+r/gzaxjyigwUxGkkI0LuvO3iF/0qvB8d5bj2qqBukcCm?=
 =?us-ascii?Q?h8aUNVjMfF28BxLdQg9/RrzUhAmol1V8pQHR7PBZYjmYPDC/uikyRcaXaRuY?=
 =?us-ascii?Q?MAFcndTdZI/M3WgnDftdiaCMyFusu0ffnuQSpqMUrRmlTNEBZOZ6pTBbf9ev?=
 =?us-ascii?Q?sK5EoGU3FzAglAK7EU6GtsKpe0bOxJttG5LH0NX6j3EzuBBFcCbiF8/vdOp7?=
 =?us-ascii?Q?PO/2UWPMT6gl+R9AR5PifwtkYGm/meMtn+vV+VoBKXa/xrfCxzZTsSBdZEtP?=
 =?us-ascii?Q?YEP0kwQR1aQxw+NuWx5FBBJ5aevy13LD0nCIMahhvIkqesWTFfo8sg/PVAV6?=
 =?us-ascii?Q?lXPdjMb6E6O7hNQphZMG5khKzmBeQgl5F9vnC84abVl1keMv0jfggk1u4RKT?=
 =?us-ascii?Q?CnzCSMjGTDxnqTYNyDeaL1YH4DyEuDSI+4/QY+Yi4t249aDZ3c3upd1fq+Ln?=
 =?us-ascii?Q?LWFgQgUtz6f9IZgvI0EYT4GFHbmO0qxTE/x62bBop8CAyS3VZ+9Lc+INImmq?=
 =?us-ascii?Q?YbzztDqaZMrWwwaEZ1s7Ax0Tje8Y7/+sy/5MQzj3g8klpzDbxGy1hTtzUeI/?=
 =?us-ascii?Q?0w00YGuFv+Q7jy9MLkNtUZUi3f+SXqohGPx9vat1MhrnLnwY+nQd2cFCh4a4?=
 =?us-ascii?Q?VinUinZa2SJvCnx/2Zjr0GcOFsO2cZGtMN5pjz4Y4LX44jf4ZMNcRiMvHrpb?=
 =?us-ascii?Q?pzlYVhtiEe5IF3jkgt0ZpopO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fb4bae-11d6-478c-265d-08d92bfd40dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:48:16.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJBCrIcMMyXrUElcWSpSkB4RTvF5Yz4ZMTztAZ9KWfHv5S6CQGuAWIqJBzhs7rScnHM03ZHOhniBVcPZ2iFvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 10.06.2021 12:01, Oleksandr Andrushchenko wrote:
> On 10.06.21 10:54, Roger Pau Monn=C3=A9 wrote:
>> OTOH if we properly trap accesses to the SR-IOV capability (like it
>> was proposed in [1] from your references) we won't have to modify OSes
>> that want to run as hardware domains in order to handle SR-IOV devices.
>=20
> Out of curiosity, could you please name a few? I do understand that
>=20
> we do want to support unmodified OSes and this is indeed important.
>=20
> But, still what are the other OSes which do support Xen + PCI passthrough=
?

I think Roger saying "want" meant to cover ones which currently don't,
and which would have to undergo more extensive changes if they were to
be enabled.

Jan


