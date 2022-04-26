Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7D50F512
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313533.531100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGiX-00005x-7D; Tue, 26 Apr 2022 08:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313533.531100; Tue, 26 Apr 2022 08:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGiX-0008VG-3u; Tue, 26 Apr 2022 08:38:41 +0000
Received: by outflank-mailman (input) for mailman id 313533;
 Tue, 26 Apr 2022 08:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njGiV-0008VA-Oh
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:38:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4448cc15-c53c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 10:38:38 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-W7UOOZBiORi6oRTKcpaLXA-1; Tue, 26 Apr 2022 10:38:35 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5840.eurprd04.prod.outlook.com (2603:10a6:803:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 08:38:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:38:33 +0000
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
X-Inumbo-ID: 4448cc15-c53c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650962317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBkE7eTF7d8RIZyk7nlXKHsUIrYN4gx/wA2E5Wwapdo=;
	b=k4pDhH99WEWbBULT9NLmtzfdInFkD9Id8DIeFKYUZYz3mxmHfuOBx4AcoPAWsdqCIzKuMI
	+wK+dKNgjmPSYjtpwGQjooY0O/1nYJEKX4KAuvfTfKHVAKA7oUb1YZbPv9nUckVKnjO8lp
	b02018vPsdxsxBAW0PvvgYnyFaqYbAw=
X-MC-Unique: W7UOOZBiORi6oRTKcpaLXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxuVTCMIxQr1ZNkyg6Dl21wBDHaYWv9ESKkNtFGerNwtYT2YA/+oXuK6hNo/K8eWTqEsEFm6lkF3ZDH21yfLdbe0xacrM+sny+k3hdoRmC2h9zol16xxqXU70m8urQ5Tuk3us8y8AiCRfKI+N44Z7BmYmbePF5zzwvDpXySLQEu0s3clS+mFBS907VL1Vg1l7MFrpUaFzHspBthiq/PrGXFJy/EzjzZ9e4fCz/jkznqG3t/fesYy9s92dH66zfnUMWox3bZDLSV+RJNqg1bYaHBHh+20c1qqELDP9uHcy+/bfwrQJ5Efy9BUfdOIxS6idh+afMxkIUwFg7n+hNSxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39gSxaZarIGiWvuuRq88Gim1WO3liOaPHyJBScEprdk=;
 b=E6ZooCZ3gOfhKb05PtCxPCj/oVTHfBCLz38bBecFzAU77G7ja6Ue2m7QIdsM82XzSSrvDKCxZrtkt7BGtqVgftirFfXOkmhczslMC/54cHPSjNvvU8oMHMekRtaZ6GJYLUm9yoW/kzF6NcvlyUWTCovZA34fap9nkSuBI7HexheBx6BgvnsagR7RT4O6nZO2XVpvI0WT7x6afY5E9tMmytbS82dDh89dfqJ7ei8xpF+Cj1CHqhFrvcqh5h4qtBFLmGHBgiOq/VryayWeV8Eb7AWuiCSIQwXJrh/fynQBrGO1NP7Sw7u8gzhZ3aGm0kRVV/gOXhluyPwCcjxG031R5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e2724dc-bde8-a477-24aa-4bec5da55548@suse.com>
Date: Tue, 26 Apr 2022 10:38:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xsm/flask: code style formatting
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220422194344.9318-1-dpsmith@apertussolutions.com>
 <5b199cfb-98c8-c382-82b3-a60819a0e977@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5b199cfb-98c8-c382-82b3-a60819a0e977@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0162.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d566740-9ce9-424d-2bd1-08da276025f2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5840:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB58403F3579ABAF2B3992F20CB3FB9@VI1PR04MB5840.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y7LpAismS6zmSaLITx6ln13QzpnYBX9+jY1ghn1wbMaqEBCZgdTz9KJFuF04SZYsB2rJ/AilQBLKEx1pAXPmNtZXOPaEaUJ7tjW04R0nCleMFn2W5/49rQMpXRNhrYyQq0UJ62Via6jYjkWsDw+3bKajDgJxw72IlocZe0Cks5cLceed9PTqoazO/moBC2yYuXwa8vhuHutOyv17WoSfmQjLoZhCC9Ng4DdqSuRMhmAIsK2AD2bmcY/I6GoLW40XyZgiP9aE1ZF54x92Uk7NZoyClfUvhZyGJe8VlsPsQ2loJo2Hn9i8buAZUabTtfNMsDSzCXkpplF5yX7EzQt9y4mBFevkHyJec423CpSK/CXQb/TgwF7bfgCRow/qotb6BXb0lkS1SN6RoqdSiYWmDYwHPUiT1byHx5FByapvYD5PpgvM8edwEqyIP+xYhjpZKPfRzYnIEeRly1SkzsuiZdMXCU9MeIuH+dol7GJH4VyN2XFT2YZB6MtcqSviKGp6206B7n4IhO+OzqXmX3EHPuvgYLMbGiimplHRyir/1hLAETQq5fwYQDLmK9EW8c7leodbIEQmG8fr1nr/A2xrQNlyaoj3+T3pFPLZdDZ3CXUzBIRYu+X8VsaiarbyOsnsUKWzwI37uwkk4MhxjFppaTPq/dtYWJWFgCWAmTX9ubWXn5Tn2wjn4Q5wzF2i8f/r95tY5nd5HZR8Gqb0owrXp5JYaPA+GHDO2gk3w7yHS+OwIpLZIOiBFRlgQPrRVUhV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(26005)(6916009)(6486002)(6512007)(4326008)(53546011)(66946007)(6506007)(508600001)(66556008)(8676002)(316002)(38100700002)(54906003)(36756003)(2906002)(8936002)(2616005)(5660300002)(186003)(31686004)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kxGkzjW7VrNTywFdIgZvgI79AOVXphx8MrZpp/C2RTbDJMMpPTQm6UmA9bmY?=
 =?us-ascii?Q?j7nLOAxXLeEz2KJWjhGPtUi8bQkUb30EYy+PXcCUEG5B280+wLAlht22+Mpq?=
 =?us-ascii?Q?aiQs7iOVaeCTCGT5K6FDbXFbRyas616Ouve65ZVRt4I90+1e88SsmUXHntED?=
 =?us-ascii?Q?UYDGRx6wDiypBZ2v6HCMJJS0QOqL5vfog9khe4U+vTcGADnI6mevS+zVG88S?=
 =?us-ascii?Q?mhIiTCnvcY7II30tzJC0e3w86cGUrlc3IAzjebhIOP3NJgkAMJPnvOSuQHQw?=
 =?us-ascii?Q?T3m8kJnj7NeTLbRSIn7vOz3eiagRA0DLBy4NiMnBtf2SsL2auHiJhcHHW0a/?=
 =?us-ascii?Q?SIN8cvuLFFHqliGqwMGtk2g9NVi14apncS7xqVhKmFRbrfESBwBQ1iY04YXt?=
 =?us-ascii?Q?nwL6p7dSvMVMn3X6vSmw0krLvVNAHxSdrSz/NqwgWFE6AX9JKKWuN+pEU39w?=
 =?us-ascii?Q?pdGWrVe/QRX0Ch5jlzEz3yq4XdwNOFhosiDA/PGVpIHK8LignI90tBtybM85?=
 =?us-ascii?Q?Mf+v0JwYZQ7WeD8sYjc5DgG+uFPVV7GuJOt6NWQ8K266VZMoEl1JnLb7ta6G?=
 =?us-ascii?Q?rp/Gd8TWKDSBoM9SulQMJKJmsrOJSl6uQ7uFNX3dre/G8BlYSdaO/KvgQnzm?=
 =?us-ascii?Q?dsJjiBnwxlMsq4gdWCFO33iGF1QwJPX3/WEkbd+1KeY9Gx0nfzqTHfW6VrTl?=
 =?us-ascii?Q?sBEfQpeZcnsRdbmO9hoqkHNIUnS44l6CmAUQBxwmVI3QGa3IzqfpGFQ79G4m?=
 =?us-ascii?Q?UyFLsBx3FEoiDeS1cNaejkvhwppi4lCjnmyyrGGsOOUkNNGXsM7l3GE5m6Gy?=
 =?us-ascii?Q?WkIZv278y34J0/IC4MCYWf5m2yJ9SSq0mqkbYQ8t2mn+O9igrMYUHT4KmKt9?=
 =?us-ascii?Q?lW4dzvUenbraM2Bhn4kY7o0TxHFkb4jG+jsYDUBWuLw8Ojs2j2pzOkkn2AhN?=
 =?us-ascii?Q?uxFHdxWd0pMDOMkL7X00+QTHHRjcVIqwH9DUJdYm+WLryMTf2Nz833iUK6uh?=
 =?us-ascii?Q?jY9t9tWeuiqRvE4mY0lf6cCgqaUCb1u9OEP7/uggn4ufLFn7hxBdotGMzTc4?=
 =?us-ascii?Q?5mPwTkk4SOiVvlkiiX+JbbzvLs89wq482D+82jqlS0mW5esDanawTN08muEU?=
 =?us-ascii?Q?ra3zrCc9PucPo/HA5hTC8fpO6eFBfz6Qx/Q4JTtiOxJq2uM840qUms41segh?=
 =?us-ascii?Q?5nkReMYLRc5CPPm3Q7Rm9jkCRJp7flZI8e1zrRsxMvAMJi3pB7e7Kqi14nz9?=
 =?us-ascii?Q?Ei72UyzlfuVAwnEEb7F/+hNhsG1UA5/t0aEIxJtxD6Rbx0vu6bj4yStfoh3M?=
 =?us-ascii?Q?u066d+seHSfrhwI3kST3EYJ8j+N01F6ttSXtpHM62uUsXvJvyETj+M/CK2Cy?=
 =?us-ascii?Q?BsOQ6CTSlMcfZ/6rIO8ZQUH5BqY+YFeGiLcV246RCQwZy6Dx1UIU8ryBzpMD?=
 =?us-ascii?Q?X0T8loL3bh+ct3rZ8hNgTTlOCOvI+gjBKOsEusaUmMJxKxfrD3c4gHsrlSPN?=
 =?us-ascii?Q?JJd0btoqNRHdkddpbaEHvQZaR/cl0BjIU42RLYweQ+5z+sBOkBtfNv4cAsW0?=
 =?us-ascii?Q?yMu0kdAtq4QhO7D0T3Iz7n+wlBa46QmdOdjflL0eTQurOGdo9aQ24K0gheCK?=
 =?us-ascii?Q?JaPMmM/Dpz1tiOQVUl6eedEbtkE8/M+2OYTwOGCbWMpLO0VXMQiRVkEqHILt?=
 =?us-ascii?Q?RiChrQA7DpP6/m5L5/GQqaswU6+G6NLZBVV/ya1iHYCHRqHSJVAwrpvxl3v1?=
 =?us-ascii?Q?NXPwA41Icg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d566740-9ce9-424d-2bd1-08da276025f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:38:33.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fqkhybcIlHAZ6yqUjVHAkyDpzGfBmBsSXC5FPw399wWtER0OLkpOCJRVAA+TDIzgWWbKbHvM4qplbBQtgkfYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5840

On 23.04.2022 01:07, Andrew Cooper wrote:
> On 22/04/2022 20:43, Daniel P. Smith wrote:
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 0bf63ffa84..e2ebbc7716 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -120,8 +121,8 @@ static int get_irq_sid(int irq, u32 *sid, struct avc=
_audit_data *ad)
>>          struct irq_desc *desc =3D irq_to_desc(irq);
>>          if ( desc->msi_desc && desc->msi_desc->dev ) {

I've elected to also fix this misplaced brace while committing.

>>              struct pci_dev *dev =3D desc->msi_desc->dev;
>> -            u32 sbdf =3D (dev->seg << 16) | (dev->bus << 8) | dev->devf=
n;
>> -            if (ad) {
>> +            uint32_t sbdf =3D (dev->seg << 16) | (dev->bus << 8) | dev-=
>devfn;
>> +            if ( ad ) {
>=20
> Brace on newline, and in the subsequent hunk.=C2=A0 Can be fixed on commi=
t.
>=20
> Otherwise, LGTM.=C2=A0 Acked-by: Andrew Cooper <andrew.cooper3@citrix.com=
>

Strictly speaking the u32 -> uint32_t conversion was getting us only
half the mileage, but I've committed the change as is (in this regard)
nevertheless. In many of the cases "unsigned int" or alike should be
used instead.

Jan


