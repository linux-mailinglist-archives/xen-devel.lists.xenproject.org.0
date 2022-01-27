Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7B349DC3A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261281.452205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzpk-0002ym-3C; Thu, 27 Jan 2022 08:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261281.452205; Thu, 27 Jan 2022 08:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzpj-0002wi-W1; Thu, 27 Jan 2022 08:08:43 +0000
Received: by outflank-mailman (input) for mailman id 261281;
 Thu, 27 Jan 2022 08:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCzpi-0002wa-CI
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:08:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542e6253-7f48-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:08:37 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-b_YqzRAQOIiaQN9Ti3E-YA-1; Thu, 27 Jan 2022 09:08:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:08:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 08:08:38 +0000
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
X-Inumbo-ID: 542e6253-7f48-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643270921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=keT4XrnRwdum1Kf1jtKAKPrf1bjboU7Fyz9NPQQTTzU=;
	b=V7mE6AY+VNs9dbPTgUGy+5oxvWGO24Hfkvd+k7YaKdlwMg7WdmmB+IieztGNror5pqURlT
	ovkfzHaRvbCDDZR74ZMGQWG4wz3B40s5KiIGVKLQCGIWNiC15ghFRIfp9BDjWik6pv2hlA
	3enMe+eGE6Pnfvf3cgdkFCJmGEVj1P4=
X-MC-Unique: b_YqzRAQOIiaQN9Ti3E-YA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVjthuX/wbdfasJeN8lafWq9XDU3M3ZO3IbxrJbSd55R2bNp0PJltUxFX6pangP6HsbSsA+AyhTJh6WG2BeHaLMPt6Qy+QowL2MlY2ef6TJYAgsC6KoyQa7BcYIytLFhCkiHuG7P0q9RyQjXlZ1qO0XpLeyW7d/Qgxzo9MadnTHzDbyiebhJjjaUU8zmXkhFQ0yF/WypcFUGnARXA3a+cbGvf2SYjH+M0KWHFQC8NmVHIqi0UT3vQRx7TjViwamfa3ETDrIC+1FKmMcl6t0pV4kqpyg2VPpgKDtckzST1w6B5PDKkC1pqXWd2t3JNrZnbkvqnVPo7DciX7a2MOlLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQe/dzEj1K/ID9RES+XuKb/Gq+hmTUITyTvoEVOB4z8=;
 b=LKgvzCBlvqBvtnsP6EoDs1fS+C6AVKvQFOmwQrN7aAGAfaHWUaqHI5GBzTo4HTHg6FPl5aWcNndvBjvc2sleq8FOGsuj7llJJdUvdJHUrMBm42AfFix9HMiaw2S5wykaGi89MBwzDebD98fHAKwvNJveHzrm85+jgHA1Cao5wwdUhzOUFg70z8qg4p8kxVYgqFEFrC0Eryyhu9MZ7Pp1ltf16YBG2JlH7v0OT6R4cNM3fHzkv+ed9u7+NoDipiz6F3V7f50YrYYq3ooHHJo/edVDmyfjVKNJcsclgiOo3Gn+cIhD1xsRsTa82FziZ6mUfn4Qus73SXNKb0zmjwmDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4bb30f9-92a4-47ef-05bd-0ae1dacb3642@suse.com>
Date: Thu, 27 Jan 2022 09:08:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-13-wei.chen@arm.com>
 <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
 <PAXPR08MB74209CAE2D594D22DFF14DDA9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74209CAE2D594D22DFF14DDA9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0115.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e48b2dc9-ae48-42fa-afe0-08d9e16c3905
X-MS-TrafficTypeDiagnostic: PAXPR04MB8304:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8304A657804A2958C21427EFB3219@PAXPR04MB8304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yffRsndUBh2oPXaOtZ26RegwCtGFrTeM5oE1wNUhuKqR/947dUQvxJLtQPNCtqxc+mTDY1tXFWYwUYVr2nNcZur58qlDjfzPJAlMCe05KfjPrV0n53ISb3V1maImFe4SCEQkKV7wkFeabKnCF1WFHVqSIX2L2x79tsORFw0Ul20C3AUZeRqH/cuEzMH5sO9A4pmIqujWvyEBMZfLGfo3o+6NV3dBrXB2fNTzjT9O6FkRpV2QBkknMkfVFKmsrwDY4MWxNCPxlp8nFLYoROqEC4j6NTPjlweyECc/zPYe3kzRF+d1Fy7CJzM1IiKWIOXJm/zW2TwdfrI4GK+iipRXZtcOqlt9RzQgOVtrxE4t3ditcDKk0/l4ENhEHl6D+uUQoKSN23V14QC37kEGSt0FERohQ40vgcWlhSfQm92YcJ+aEG4XCq9/oXT3V/X/W3DIhv7CjYCoX3a26oESCYDmmOL2lz07nK4tNqg8voVlJe+a2jUNjeQuh7FdFsKqUE+LKAR3Y4/U8xlW1GAEJ85p8um8xcz9hGYsdVBXvdvNL1APAL2RAGYhj4gMhI+i2Hy7ydPfCKbAHsY/A3Yg4FJsC++X2hgOHzwar2vaBG9ppG5IAcaFtB+f6WRURFDjS2fq/rcpXsIG4aH+rV9XUEN1bxUZLvj7DqbdX3GFk47W5UPu6K0wV3NIKKcfQUmX0THvHa+YnU+LBajDnBLrDXdIUgvJ7FWYZzyFVqywBxdNsmhgATp5LffSixsRhyARJKmA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(6506007)(6512007)(4744005)(8936002)(66946007)(66556008)(66476007)(5660300002)(8676002)(53546011)(4326008)(31696002)(2906002)(86362001)(38100700002)(83380400001)(6486002)(186003)(2616005)(26005)(36756003)(508600001)(6916009)(316002)(54906003)(31686004)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EtkXZrau5mxeKZWYC8XYRWVJbCVjiGAjmnCtvELChMmHllekj0ymiZlUIt7D?=
 =?us-ascii?Q?NA+YJMW47iVGrFcaYePXIOiJmWholG55OkeViTeAHqEzPAWSif3kxHxz7Jnr?=
 =?us-ascii?Q?budd/kuOWbhUqiM13XszqRzQgiCoqmzEYJbJOORO4WsFU3JcPwAuEsnn404g?=
 =?us-ascii?Q?7rIsD6Mvav6wLhOzEQ27z9eIQ5wituClX+1XtIJRMNGj66SDigcxf/pGH6g3?=
 =?us-ascii?Q?SbayjK3cHG2O2CX6vjXhG/TXI1Rb9AlnvZZhbeFvUbxe/Bw+AQ5POAz4dteR?=
 =?us-ascii?Q?5MVCo8RgPh9yjMG9DLJ6awqVCrVzptDGYAcGW3XPJBh/rbBZO4Z2Hsl2N/HN?=
 =?us-ascii?Q?sk7GkH6SynfQGX6rOj4ePeQRp2bKRWM38WvPF9buSfXuRMhkYinEGkk+cVi1?=
 =?us-ascii?Q?SyZ5yc1PNO5ipPBgL0eJ0C/Wy4itWpGNGDPzoDVbh7nvsg7FvA2oSdeF9sNi?=
 =?us-ascii?Q?vXeWBcnbf47HAOuj7Fu9ejXnV8C+4vcvwGNnYcoG0Q7ILnzQoQlizGD2sAUX?=
 =?us-ascii?Q?KqVVA8jJUqTmNLcW+ewTh4ESKiVwJc1OxorPOl1D0yJliyDRKpT43P8D/+Y9?=
 =?us-ascii?Q?nP8amo1ZqCqjyofBookfRiKVjvRfCooKOLpXTEYaI68E533tL5yH1ZzCLFUt?=
 =?us-ascii?Q?YwwHBOWyc228/J4attIqMJeBC/M5LjSl6FrAaGKuIHWT0M57AVKNgHtOZO5C?=
 =?us-ascii?Q?YnSu477ElNUw7RMtc/TM+dj+IvClfzke2xuVZUIVM5Sb4I6pdM59qElhWH7V?=
 =?us-ascii?Q?BXkTmf6DEE2WibP9vUhLi5JG0NAYYdTc3bnawlWEOKS2UXVo5b3HTAhuiaiW?=
 =?us-ascii?Q?t38UN9AHKIrnumi67pNr9Xji62lo6Mj9tqNm+Cu9EWWfV956UoXWZfWEEx53?=
 =?us-ascii?Q?O9yKQpSkfsGXIiFZApVtZQ8YzaeN2MaBFwhMlXBoWRC45s9w/ArOJBC+qThJ?=
 =?us-ascii?Q?cs5tUyahBUbnCiHFzKk50erUuvbzCCW6DlmzLA0tRn0nfGKpow+d30JBbjoN?=
 =?us-ascii?Q?91LyQ7OmutRa6/4UjgUwa6PK39tnkp9J5OoiABWnDTF6qnaqqvqie+YDARIW?=
 =?us-ascii?Q?85s01UbLQXg9mKtiA/hCBKfSfSgstvsx1ldZWorPx4XmGS2tCkA27xBDAz+V?=
 =?us-ascii?Q?zucRv+PlawmoFNJWabFdIWXMMMx2QYbdIhI6l6HM4wsTRqXg3EkGrnibcYPZ?=
 =?us-ascii?Q?Fflcm4ULbE10jsZSI19Fm/ktdSK60Ej9YvWvmqi5NdjV0YhfMiKm2Nq0K1FM?=
 =?us-ascii?Q?FsxfEl2Vgfsvereg/rod+K1r+WGmJkbD4q9yOYMXh7Y52GzEsath4yp+fEWa?=
 =?us-ascii?Q?LN+EXoPZZTxv6IWA4f93phH/Ffj4FYvqHu2wtitdKcH7gfv7n8B2ZO9dixXE?=
 =?us-ascii?Q?plhtNV+C7PIyKSB8OGqUd2mE8SFWZPFT6nLQCn8b3au0Ogh2Y5EWjg993sBE?=
 =?us-ascii?Q?DgJCWWCFYlAlu1lb2znKoHDBquFyE+Da394hDu14jtOzMPhYoTUX7PH3LWA+?=
 =?us-ascii?Q?M+wMwMqoV7cR3kIm/BeG+Y2X/ycShKZyo9hWjPrwW4ZMAybf7vPpPMwmh3df?=
 =?us-ascii?Q?BbtbBnzVsrY+ssKUKAdmO7LGY5TRaJ9v0XMpLY+VbsfiHvHX/ulnw6d5t/d7?=
 =?us-ascii?Q?SDWAzCKGJDkFyzC+xP/arIE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48b2dc9-ae48-42fa-afe0-08d9e16c3905
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:08:38.0277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7A+dzvfMiM9NTOdfzdO1W9tzCaq3FM1wdTZ81gV3SECTnOZUpjhksaEqt5wh9amYTJiy7rlUezP5/pb6neDpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8304

On 27.01.2022 09:03, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8825=E6=97=A5 0:59
>>
>> On 23.09.2021 14:02, Wei Chen wrote:
>>> We will reuse nodes_cover_memory for Arm to check its bootmem
>>> info. So we introduce two arch helpers to get memory map's
>>> entry number and specified entry's range:
>>>     arch_get_memory_bank_number
>>>     arch_get_memory_bank_range
>>
>> I'm sorry, but personally I see no way for you to introduce the term
>> "memory bank" into x86 code.
>=20
> In my latest changes, I have updated these two helpers to:
> uint32_t __init arch_meminfo_get_nr_bank(void)
> __init arch_meminfo_get_ram_bank_range(...)
> I am sorry, I forgot to change the commit log accordingly.
> I will update it in next version.

I'm sorry for the ambiguity of my earlier reply, but my objection was
against "bank", not "memory". As an aside, you also don't want the
function return "uint32_t" - see ./CODING_STYLE.

Jan


