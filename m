Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50A49C81E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 11:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260800.450890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCfwT-0006Dh-Gw; Wed, 26 Jan 2022 10:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260800.450890; Wed, 26 Jan 2022 10:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCfwT-0006Ba-Dk; Wed, 26 Jan 2022 10:54:21 +0000
Received: by outflank-mailman (input) for mailman id 260800;
 Wed, 26 Jan 2022 10:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCfwS-0006BS-DS
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 10:54:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eea9553-7e96-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 11:54:17 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-Ri-8ECm0PrSzFhmogM4kDQ-1; Wed, 26 Jan 2022 11:54:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB5804.eurprd04.prod.outlook.com (2603:10a6:10:a6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 10:54:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 10:54:14 +0000
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
X-Inumbo-ID: 4eea9553-7e96-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643194457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+ge7EUNQiGqI64SVSmpPkDaukHjUKYgDJLmG3iUvu0=;
	b=SGaMkPQ8WT5oiH7ROA3B+sLoLC3380Pm8b+GoTit33DrPe2ZHRzZbwq68jOyZQRSFb9coL
	3XoxS8r26B2fECDI9IC6lenUozRZFS+rqDmCWljDGBNUG6dUwPtkpDNOChVG018rtqhf2c
	mlvQWb0hrUwbHNWdnnxhHMo7alGR+MY=
X-MC-Unique: Ri-8ECm0PrSzFhmogM4kDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVpcm7LxT0jPaDU+E2cW3xGkM6mITkky3bpulS1LeP64c9WAL8v8Ryf/uiXMaZ7VdUm0cj7FGarPJcCrstqy1hKhJFaLWEf8AZsUppxAXAUCCL1Qbk4XSXB75gw7/Eaiz46HRNgHmpquX22e6vbb2ThnVIa/7aBtUd3UY6daaHlcpoeg9yORA57/DuXueopbYAFSbYYJss5h/u337mhMbjUX3oI/U0jDwv3uHb1wkEZfatLPVjzutl+ExsVE4hR7xJWlV1nD5lcy3J3ShSxJ54vbyakN/hD0y/HBx81W4G9B3+CyuYRBofaYAFl2Tn1K60JlwTSjoC5kT/2n/DdJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyNLjyoFZjLGmDlnJxY+vUN2MQ8HGo5R2aN/x9XOKBs=;
 b=iPO10O7lyUPj5yNsU8R99yTBxQC6JtbPoRuL5DaEn91+3ojAWLgCms+pfzbRpbvmWsVmc5cCZnnZXr76H+15uu8BYOYrDTqevmqmvli6wS9IFkiW86xniE2ezWWH6lV4Xu4irLVEYyBpTTAYImNov1Uy2N17VQzoDJ4JHBfkBx/tz4kXs3p5J24kM18SQ1KQv9yvdLYQJ27Rp0BytzLcV/Io9mjzUaQc8ONlk4lvQqXeHfYmD4zjmOG/24yK14TYZJINlEDy/oR20COhswn0O5HlPV69Hdd8E0Vb1zhO3aGX+ILIY/9CP6BcbrOL0Oy3Kqj/vTelNvRoavZXzzDRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d7168f4-3963-19ae-f436-2057bc6b0e5d@suse.com>
Date: Wed, 26 Jan 2022 11:54:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-3-andr2000@gmail.com>
 <19c43763-966d-e336-9282-ff12b1b3b2c6@xen.org>
 <YbRfRv3x0lxZvPcw@Air-de-Roger>
 <9ecf5a52-4fa8-04c7-d0f4-8d08b07fcf90@epam.com>
 <2cb7e479-8e25-9531-e01a-7415cd7a3f92@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2cb7e479-8e25-9531-e01a-7415cd7a3f92@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0298.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda92f7d-b139-4786-1831-08d9e0ba30db
X-MS-TrafficTypeDiagnostic: DB8PR04MB5804:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB580491239D1294301359A157B3209@DB8PR04MB5804.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bIpoI4SVBnG2Dx9ztCtV4QFY7RNy0x2KaftnSpNTPW1YGsGM8nk4n0ctjZ261Mu6CITNbQeLU2PMUQB0OcVfYWoCmpTUgaNFjW9fWZrn6NH3FBzLn+bBBVuN8/no6CovDxtHYdKSPJML5K9vCVrbNfMkS4tEbGmKX2LOAyrqMNDBo8mvtZr4g3Ms2v5z6EO+IrvICC/H/im7Kfz7Wv2PUQsN8kNW4d1tCH9aXeQ54Ku6VCtREVIqPJxyvwIexSqNpIwiyTBgDP9EfUMJbAMHI9iGayL/YfsgSREFtbET7kNSRPWVOJo40KNK1OC+imUAQSP190bHEgYQcgGgcRtIE168tiNE+ZFHCYNzG+oYQCcFmgZgRp1+J9w3dQ2sjYXlqgr7jLc2rRDwvldikiOszi7iVLA+Zs2oNHl6Ho18E7GcQ0DgVWm2ccxVGnJjRb0ckFKb9BV5JlNDhBISaBHReunrQEJtufaA9jBKZoqFD3tgbVO3dG40L/NakJUVb3Ur4okfJALTA07nWjYR/H1sUdFmjvn2MXmqbXKt54dMfIXGYlE8D258SjBnjyUt/nGMynBf2iKljr/TM35pqUoRCjGgt9ejNkxAlkdKs79GbLIxuVgWQeu6fkOV9jtHWiDC6U3XhP9okrrwSmEFZel5alV6JRRSbhcPl0kHWlBMVJfftpQBJnsmgOjK07eEARzKOfSOVWp4CuoG0lQeJO0qc9x/3wImM9PZq3gE+nkMhuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(53546011)(31686004)(26005)(7416002)(5660300002)(2906002)(36756003)(4744005)(2616005)(186003)(6666004)(54906003)(6916009)(86362001)(6486002)(4326008)(66946007)(508600001)(38100700002)(8676002)(316002)(8936002)(31696002)(66476007)(66556008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KWMlWVKzM5S55z84LpTcCXalDGnDCbB+QiwCne4O5vTdWV1Q5qx39ZzSfsJb?=
 =?us-ascii?Q?df5l/JGEoAGTdCwSDXS++ORjj5DbQTuSsOFt3HjfASiSHuJYAPEfnPOkohx7?=
 =?us-ascii?Q?Xt7DLYyX1oL6KQWQlGqhv+jjZNIKcWVXp6ZAPXhoMAProUwgewalj+GHxlfg?=
 =?us-ascii?Q?5slZ/GNgWBn/aK27L9gzUR/nlmWa1g1ZppPu2EnjyO+jD+n7Kirj166BV+Nb?=
 =?us-ascii?Q?mtrJmUZ0AUgsTraDJRBtQk4Dzdd4rCYVS+APqq5GOzge0MtBYy1jqj/C1TdT?=
 =?us-ascii?Q?IaG00rkNzQpxJ/NcSzMEaNsCGJIRvpZiD//bvtFTP6erlP+YuxRPJpDKcCob?=
 =?us-ascii?Q?STajobLL0RKnUTmgPZAPpIv/PwZuDolTSAN7I2E9UzyUGAR3lPSf8k/ak8OX?=
 =?us-ascii?Q?6z+Bo8N9r4SjMllT20Pmtih7IQDZOn/1+RJwwZiVp2FA3O2IPDs5kYsAjfR8?=
 =?us-ascii?Q?LP5OfiLoX4JqtrRq8M+hBfHcojZN3ADDyGVX31YVk/H+cl4ih3nnUclZyV8n?=
 =?us-ascii?Q?hnj7QZ3GjPrDVEhIhSg2xk7haHY2D7i+KZN2RKp1NqZnMgadRx1lxcMf7TX9?=
 =?us-ascii?Q?SCws82IVqg+hjKi3vb9mnm0tg+kRAfjV8YtxpElVzpUpwcbGGQ3bq0iaHqMJ?=
 =?us-ascii?Q?2uKVcGP9p7RwMTIdsdpUTGFPtPgpA3BJf6yQ3/gC9i+CH/0rVm2noA/wgyaB?=
 =?us-ascii?Q?jHRa9RYm6MkmmdMbLSoi7q/IdHnrd/r7gS8ytwsYMNzv0dZxXPtk6YAMgy57?=
 =?us-ascii?Q?7tlBZMH8oB9KsCRqo7OxPTKrralwXH5CXoJnlxZx+YHFIOvTPX4HVS/9b+Q0?=
 =?us-ascii?Q?xU5PVYmu80urLOoAuxe0CqXI+LPrAs38i8s0uqAFYX/BrQprYKAQwghC/QS5?=
 =?us-ascii?Q?ZNzMqVBQ2BDNa966mfwi4XM8UlCq5Vx2Ui1Xmy8cJ9i2zZhjdUmkC5hwr1OE?=
 =?us-ascii?Q?ua9MYKR2GqVdCj9R/lQTVHn778z2X6L/S1Ez4E9z7RxI2fJPZMNN5hfgHopQ?=
 =?us-ascii?Q?uC2dO3zeay/xa7j2B5uDm8/JXxa288nycQVZvE1+1aPhVBJkhd2Dloxf5ZQh?=
 =?us-ascii?Q?c6xRAGgYW72OhCvGbrJTNmtFZQVC7E+WgRLFiGPnl9hvWXxD2xTq7GgFbkFU?=
 =?us-ascii?Q?BT0YRU7v1KLWHBZTt2fDUEGkTxQ5aUklnBLmowcHAaqdh2AcoHxf9edAySaR?=
 =?us-ascii?Q?GdE6r6KsyI+md7ouAWb5OA/jy71Q30BuPR1s4mKRoJFHfHi+FEZaZuzD0AWZ?=
 =?us-ascii?Q?ezm2O5FiYX5SKt2trEdIg/2MEZ37JFhbS5428d68KcNYd2xvoZTN9IYiEfMg?=
 =?us-ascii?Q?HBtYa4SCxlsoMMjDhKo96Y7bhJUsJAabmZ/V00x9NZNse8me8ZLQzx8GIm9B?=
 =?us-ascii?Q?d5lQrnu0GnD0HSWYChjaFrDhbb5GnGKuETO3Vlrv44hhd7kkri/IOQgTexr7?=
 =?us-ascii?Q?cbwC4O+N7iWcqiGhRWC1zTPgSCF9Kn70XBbolhCJ5gGneK0wE2HyXqsyqvtp?=
 =?us-ascii?Q?rZ6zweksKCB9GUlAG9Tgp6CTWZdI9o8iESMb2+vrQ+wUzuZEkIYFV6sdJ3LD?=
 =?us-ascii?Q?cy65GQwgHgAzVFVqounfe/DvQmU3kgF3VQ2ULhYDKJ1jSBoN6VilYe1psaDs?=
 =?us-ascii?Q?6WBbyKo5HrZI0u4Guq+k65E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda92f7d-b139-4786-1831-08d9e0ba30db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 10:54:14.0651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR4pM6RCRLcDjmdUU0ZjXi25fW8yUuXuGYFPgoAj9UM+CWSXmIgNd+pamCnbWKZQvAQ665SKmuYauTUkOeXE4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5804

On 26.01.2022 09:31, Oleksandr Andrushchenko wrote:
> On 11.12.21 10:57, Oleksandr Andrushchenko wrote:
>> On 11.12.21 10:20, Roger Pau Monn=C3=A9 wrote:
>>> I think this can be committed independently of the rest of the
>>> series?
>> I think so
> Could you please commit this one, so I don't have to keep it in the v6 of=
 the series?

Did you actually check before asking? See commit 7dc0233f534f from Dec 14th=
.

Jan


