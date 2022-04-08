Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8E4F9322
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301350.514278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclzT-00012d-3G; Fri, 08 Apr 2022 10:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301350.514278; Fri, 08 Apr 2022 10:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclzT-00010A-07; Fri, 08 Apr 2022 10:37:19 +0000
Received: by outflank-mailman (input) for mailman id 301350;
 Fri, 08 Apr 2022 10:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nclzR-0000w2-PF
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:37:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc490bb1-b727-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 12:37:17 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-gShiYJ72MB2u7-nJuhnYYA-1; Fri, 08 Apr 2022 12:37:13 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM0PR04MB4419.eurprd04.prod.outlook.com (2603:10a6:208:7b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:37:11 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 10:37:11 +0000
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
X-Inumbo-ID: dc490bb1-b727-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649414236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cogzCrZyJ1Tj6sTl/3vAb4/QkolEAe50Cp1WAOlNi2Q=;
	b=mdyLzAWaWBMET7fH17WidUrb6bIypR5d7Gwj2ZHU05dlTQalha7yeTxeHernumNkY4ySD9
	yJUsUdKarXb5SbpwsUNdcOP6jJG+des70N2J6gOnUZ479HTiFtkGID51PtHewuCGfcJL0+
	JxSMZziaFN1NRRLOR2cpmX5+aTnmf3U=
X-MC-Unique: gShiYJ72MB2u7-nJuhnYYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYA7Z9T9iuyNQfBkPMM2Vsfzpl+IwscV5WUkuhPXvirrqcLo2kmgd76HS+Y8bpN3HpYRcZwRgvXIhcX2yQ0Qq3rNNbdW9RIFuwHv0eblxdZOPPQKCqK06NIM0dnsGrvVu1Fu+gDyRzSjDWRQQOTyzzVvLwiw3mlxA8PaoMyejReO9FZya1b1UFWl0HIp6nahZG9mlXILA/hUfr2TW/Iv/9EpLKZ6mA9pfKxh+abbmwFP7HPhKmTR7uhpbFoG0KOKYqa1gvxy4wIE2HsUrUX1NiC2kzvTcARtJsbn9lAgUbQyhwqMyTdi0UmbvYZ2Vn7Asn+cgushVh7q9EiPQBX1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L8XbTYH5iN0XL/FNUMIrcVAFDUQX1nzM7sUDNTxEH0=;
 b=M8WczUwKp2u5uwuradTn6RoY+bJQxbONji8qdQR0QMtwglCJYeKlIKr2e0PCn4rbnyQ8/quH5/uQQMjdIN94xheSlyh61+gWqzoor6M7O9onncdMLQQ++F1e72zxDSJSZ7EzIIHCbXoC5deRUB1afbW4HM7QDxZDppuJNSPtpapD1wQ3eUgaXJZ8jWvOP1PxQShcLcVQxpoxevTsKnoQgtHQKNcdDyAKsk5tFUJJECwu1KnssgFksnRHKd3Ha/5Ol6G6dVeYQRSS1RUyDN6Ik/kQJxU64AqwUiGuZnXf4FEmRUVNZCyiQ0p9xsxZmz0lvZI/TaiCS9KBTj2T3cpNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7be11e83-4854-1894-ee46-9ea23a66a5cc@suse.com>
Date: Fri, 8 Apr 2022 12:37:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86/irq: Skip unmap_domain_pirq XSM during destruction
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220407145150.18732-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220407145150.18732-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0114.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::29) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51687aa2-ff8d-4663-8682-08da194bbd5d
X-MS-TrafficTypeDiagnostic: AM0PR04MB4419:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB44196BB74D8A04D292359F5DB3E99@AM0PR04MB4419.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X4zJiwHbkf7c50m6PbyAEi9HVDrpY8lmheOvepr9ZW7EupfF2HeXIJH3rCxGsjWf1doGoL+VLmUVenrIDK41oJuRxL3JumfXNcUTrhqOujhQlRELwgMgCfhJjCaTTnOZY41x5r78/l4tKBuKOeTNkkgWMu3xr+qaSZhKC7EbT+It/YgVtmc2OLcTh9R0+uiIs9UFVrc9o2+TCtGKO5iS27ZI5ZyCvZ4VebjvNfuKiqBmGx+xO8aALSPEPteF1j6BKFHAflzsGSWWNHL/VvZKV6LTuynOpy9gsIeV+PMcMvq+78o4lKXjV5/TIYxWS1YQMCTPoSz/bQEJvSKC5ZFCFmM3HfV8uG28zjJbTln24DGwBn8GWlv9cYxEu/Qe5m+KRukgmvq9/cjAuI9w5zDGUG1m6n69NGb4I8qSr6qROASEpyOgReVoLcfI/+yFhtxXXhiNTi1UYHrDLsGUPKVIj0lPcT+SZBHS3ECRMK6NvdCUUm4qxhiJtZaFJ8LH9u/jA4syVFiNeG+Bp1VqhbMYgr1aYth6tDea8gXuS+VKF2632b7aZrAFZO0xElBSjDu5GrHJX2IUQRzz3OS3nt4PBvph2N6gmwyArJLpO+577bPw17Jjj8KeJJM1BQ6JS0oR+j9fVlmukHhaRGPmG4Akm3/zIVKn90HehGKRUbkWfouwiF3lbb6g4SoAzxpR44K9V+t3TPvbwlsUv/hkPsatn0m/zgSg+8MJdY2fNIH2J4tmanaHwfbg4f2edpawwLYO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(2616005)(6512007)(54906003)(6916009)(316002)(6486002)(508600001)(53546011)(6506007)(4744005)(31696002)(31686004)(186003)(86362001)(5660300002)(4326008)(8676002)(2906002)(8936002)(36756003)(66556008)(66946007)(66476007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BpWtpQ6GRn4TJW5kduU3zoolEW42GSC+1uuYQBazuwM4HVvwmO5pTwy1zzz6?=
 =?us-ascii?Q?IHdJgVGXHwyOYAAf5T4B9i6pEIDviAzP/sF/OQuPmXAbW1i2f+Hr8K+9+CpL?=
 =?us-ascii?Q?UDDiWmJKP2AseWnETpvLFYMrPyE0aLwMBCDR4hFzM5LBLTD7590G/doVIzpS?=
 =?us-ascii?Q?LkVkuDPShVq8MbXNOKfnY97QDEVMxJz3M7Eh62u+22aER4Rz/leavQQHCMgW?=
 =?us-ascii?Q?DUWw8fth7FWn5EY0Wazf+jjDyyQ4NB80WwI2xHch4X0i86+NKuGacmHBYWP+?=
 =?us-ascii?Q?IIs0+zcZLdMFNF4DTnRdfOvMeMqEewHulfFaiIxtspWbAEDthB8bmjXosH0R?=
 =?us-ascii?Q?FK+hvkg4TKZZRpgHh43Ab7u/kLhkWxMVFNZtLd+wFb/CXRE0XqttoYaizQho?=
 =?us-ascii?Q?66PtQc5hjf+jMhUTYQ9FKqCI4DDUpEjxUgu8/1hi+8ejCPQ3CnGUgJOT9KNd?=
 =?us-ascii?Q?UuQHC5rpTzNn7INDBMry8UjH1HHgBpzezZ2fyUIgcNwhfse2W8+acMYeGLpL?=
 =?us-ascii?Q?xq/t13Q8d+wEvXdYLYGXB3FdYZA32Fr3Xxqr81XKe8iANrqPjiyr1THVUKms?=
 =?us-ascii?Q?ev6CkWDkfeeSZRsZpdLNrDP4ezHanGavMoks12ZoYz4suzrCTInKRcqmoda7?=
 =?us-ascii?Q?m/K4JGTGlqK5c8ACodp3cuy9Al5bcjM+bdxdPIf2hRD8KonbKqFbCdV7SPEX?=
 =?us-ascii?Q?wq4GQmpg1NDOLJh483CWjsgmpQQw7xqUTvgWr7gJNp1hZ4Y+w1v7VerXxBSB?=
 =?us-ascii?Q?ixe8tDluQ8L50Kg4Pznrx1hcGsRN77kKcyH2McBJ3fH7uxBfCQzdukwQ4X1h?=
 =?us-ascii?Q?1pfqvvicTZxrzMHSPY9IZ+mmayPK9o6vkJOFfbcmfvPWsPUIvVPXpqUCNieC?=
 =?us-ascii?Q?Yj7FaRnQjg/fut/UV6ZGz+ERV5My+6BsUCnf/x/EWB0eJ8ECK1GxEAVI6BL7?=
 =?us-ascii?Q?8g3tJiedAWXbqFmWZ+/9avVt1tchj9fm/bFrAo2sU7ZY8XM2CYxN776HH/Yy?=
 =?us-ascii?Q?KZYfF2k1qrkBHyhuJXqJyLfigRHugp5X4Dzv34a4rg8Z0os/uaRvl8y8BLti?=
 =?us-ascii?Q?hSrZi+gZ5uIE0I+Ep4S3bBRFhOiu2konH1dD/44+ajPfSgTDhnw9DauFDn+J?=
 =?us-ascii?Q?DgPoxnOeso6qPESpYKGsDE0JetPZsxAW+12nl7I/+s2zW7b6GA0X1rg3DSV6?=
 =?us-ascii?Q?mh8wa3/eI/fyeqfxGw5tXN1Ie0ykYYh2MhJU3IWJ+O94Iq/GfG1zQne0xp5F?=
 =?us-ascii?Q?ZiiuwQ8po+vqU70Rr1A0OnKLGbl0VkE4ESwHGOaMrPxRL4+uB+IJwmCVrQCF?=
 =?us-ascii?Q?tgHMnmSvqQaRZhJNQawm/2t3zx8WvklmwNUJ9rZpCFf1GlsOzetqu5wAXvUx?=
 =?us-ascii?Q?L3pOYP9VXjQvsFWDL1A53SoRFhdhaUtNbR0zVv9qhUWfLgkJtD4i+kWH90D2?=
 =?us-ascii?Q?KbIvREweIuWidZ5fN8umb2gpGYj3PIU0riODSQcwHbk0SIMiCq3gMcS/5wnZ?=
 =?us-ascii?Q?0QNmUIwxQW983BmhW0hmvvhHPWVnBzg26oQ8KCj2sFBooe3CktXYrLnxeHDf?=
 =?us-ascii?Q?eHdcXjpdLWPd0/PHkYv6sWLoyk70ZsL7VBZ4K/BLDx+14mdX9vjfOXM9/fmU?=
 =?us-ascii?Q?9EjxWMhpjbuZQoqQyQNkW/fSZmd8ty6RPsXA3f+feoxETEbY748uu5MVg9Ys?=
 =?us-ascii?Q?r63P9XJDMjUGd8lObxkvtruCv4qlwPEC6arr7eRQGMheG4U0WHseHZ9gQkVg?=
 =?us-ascii?Q?YWooZpGbDA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51687aa2-ff8d-4663-8682-08da194bbd5d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:37:11.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31nuASMhJJGUEdud0D+g4qqZUFxjxO8wfaMQSMACXtMUlSODxji7ifkO1mh6fqJ+L2iPPmXiTgNw/NvdWJjjNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4419

On 07.04.2022 16:51, Jason Andryuk wrote:
> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> complete_domain_destroy as an RCU callback.  The source context was an
> unexpected, random domain.  Since this is a xen-internal operation,
> going through the XSM hook is inapproriate.
>=20
> Check d->is_dying and skip the XSM hook when set since this is a cleanup
> operation for a domain being destroyed.
>=20
> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


