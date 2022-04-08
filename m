Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE44F9138
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 10:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301241.514058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckPe-0005bG-W4; Fri, 08 Apr 2022 08:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301241.514058; Fri, 08 Apr 2022 08:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckPe-0005YH-S3; Fri, 08 Apr 2022 08:56:14 +0000
Received: by outflank-mailman (input) for mailman id 301241;
 Fri, 08 Apr 2022 08:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nckPe-0005YB-3n
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 08:56:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9ceba5-b719-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 10:56:12 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-Y-IFFjv7OHKNO4HvPiNUJA-1; Fri, 08 Apr 2022 10:56:11 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM6PR04MB6215.eurprd04.prod.outlook.com (2603:10a6:20b:b6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 08:56:09 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 08:56:09 +0000
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
X-Inumbo-ID: bd9ceba5-b719-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649408172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJ83ZyX3Wfmhr25pSB1NdJuYUOMwju4ixDsWs41q++0=;
	b=gd0RwU13uZzM1U4hi0IrFFX2zovrb5+LbVLGs0AXlBY53dGGa+LLErx0ctCRPote/29y3J
	D2jZLurPOhZsMRbf/mofCn/HTwG6WliyAYbqInTAdt7+iszJQkhrBxnDjqL2VTbxTsWO1n
	ojsMWAva2+waOnwK2le3iCkDw5a2BDw=
X-MC-Unique: Y-IFFjv7OHKNO4HvPiNUJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LALNOTpLVcjh2JrS/KSmQ/wlwrfSN0ePZYvsOqbraZwCmYdM80GhqP8GG+wtpngJ/bmGuXzMpufsSRwjuI4ow1jC5XQttAqjhrFIDVysXAkGaoIrJmfeBoKqBMEEIceYCqK6FvAd82xITSmHcyaARqYw4QDtTpyyvXZQtIC1pHFjVn5fjViXkkIa+980R9IG9K3XBPQJqydj6WO+buQbDlWmfZF8H3d3G8pUWDAPRdfLbf4VZ/XmD0fWMCdKwOuE896TCGXaOhG6YtCRs5YAoePuFHby4fhgdunW+UiidwEyf8jQpT4yoGwBnGs2I3BJ7taYxeLBHgHlBTMehgIadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdlLG7gvpmaAmKuDr2i2R8fXtn802hh1Q5HlsBqTN+o=;
 b=JqDrPeb/6bMNrvhjuGaiMFq2mEHz8HuOy8imaFbYe7/eblXAZQLMcmzj5uSsC5GCydOe2mOdMWjYkc6BaUfSzUszIFOkKda3WQ+mVRIqBsx/XkvJHVTjNneJNI/5RyJUno/pveAb377MglMkwMv1C1SZpCXdu55QaaA65oKLdOkwWwC36vLKrNnjKXsIr5MwOlK37czafqsoXEnS6ne9egNycfp7jUplfgARWtfdxqKWlQYC/SmxHEmRNfQEn71T/smwMsKYLuJs7SoFmmGRWPR7yj2uXZJN2npkUJm0DVcMAF776dM23+GxU+wycM+DCcdxvLfENnUqiM8LoKHN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93f86ba7-79f5-614d-3cae-a265f3de9b86@suse.com>
Date: Fri, 8 Apr 2022 10:56:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220408084517.33082-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0058.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::35) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a49631e8-50b0-4513-8d7c-08da193da014
X-MS-TrafficTypeDiagnostic: AM6PR04MB6215:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB62159C6A9073EED7E7F45C34B3E99@AM6PR04MB6215.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DPbbyBUjiH12T7pxlWiS/KThSgWXvqj313ja7sWiEaM/M51p0p6LKaxBWJLOq8lRCh/NE7h9qYlYw293pp+GjxkJiINQV/mgZvqBIqXpjhiowTbAsx1qJamzKngNJquLI/JrvnKpgeBoLhvKs2tllYEwvSMGzwgp6Mo8MRMMxdJXXZelUHlGNrJD3MddqDbCEKlOqnYI1Em+4pnxN6xPocSpq8jDd+tiC1QRpn41CA0/8vVzTgQHOK2yc+ScssbDzQJ6jkjBmXwAHh7OvJeGS+Jc0lZR1GSFuehjpRkVZPTvq3DL9/O/IIp8UYo0n9K6bPglUwVn3BDmW6UcYKVNBXw4ge8U1Uf+7LAtBsmNIfUegOZVMfztfSGOHLUfcc9Q98wMbJNPlNeVBnieS4Gi5xMYUAcr3dhBEgaoFwT+Zn1P7Q/5HKTqnOj9kkcMULXPKIxEgwBbYA5lxJLWUQ1mKSbYSXXngdngwkIXOyHBNyfoOHhljOteN5yoJDZchL2iWw66FyqzlusZOvy1JsxnPiE56AViJEnTkxMqRY2R4CKPR100ZaxL3CJivQ1WySoXMKoI594ojzoLFFQLm2bUgFwbdYDh+IPKO0j/y6YITy0Kf/KKAQ2FJu/E8DqxRdnclStqz+au1GG/mnrcFoeAqSwhcdwBMV2F+OwfEkqmosGi8AdvRfi6A2J7OyyoWaxLxAzcj4CHRfUE1sWrA9Xm+Zm5hWiJYsHyqQECj/G2WJwn/Z+CJ/XTpg3w5Q8suBfV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(53546011)(6506007)(66574015)(31686004)(8936002)(6916009)(6512007)(38100700002)(2616005)(31696002)(2906002)(26005)(186003)(7416002)(5660300002)(54906003)(316002)(4326008)(508600001)(66476007)(8676002)(66946007)(6486002)(66556008)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dlMe5YEz7HYtWMweXRo+G56J2HhimC/gx6lFWu0yrch3AoOwUluvwkBBpasD?=
 =?us-ascii?Q?1RpVQbZg1HrUsOyjMooLjgrMFeMiovHtwoiiMa6mA1GghBAL4+n46rTgBQM8?=
 =?us-ascii?Q?Euoe+EU1iQDJMUFhVvwBV8r4BNJB158hg1qnkROzAhh2OboNcSU/rfQGWHG7?=
 =?us-ascii?Q?fyC3UFvEg7wlVc8lKdP2320nzPdwu1fdk5qmP5llvjjQ8jLCrWLOylL1iKQS?=
 =?us-ascii?Q?0BuU20f1QA9pR7rnEWB3+nR7wLeuUgE1v/DF2OlUqADH+KugIXuWHAA++ctZ?=
 =?us-ascii?Q?YvLobTtkK36+CS/tfScbnPmhlmI1KFDoK4yKJ5DYMhkYnHHDlxXGPR/jbsqX?=
 =?us-ascii?Q?j1BxpqxZnt8Vp4u3ZCEh3jEHjOgiIBgYir+NOwfDg7PqCsQFrZ40gxx87iqd?=
 =?us-ascii?Q?5QS4TXYwouAe5N9XZoETCmnybFTFZEjCPXPAm6xw55TOYgsMxP1gTVwgZmVJ?=
 =?us-ascii?Q?YGyHbDrxuHOmC51MYekihgLrn1GPuB094kQ6tsKu9L0DLCjfrokDO7y8BRp5?=
 =?us-ascii?Q?ZAVdCOEuon1MqPGnceFv6cNPSXahh+61p6rKIVPh4OIhzBUes319oT+tgHjM?=
 =?us-ascii?Q?IxTS8LwycEdPhBvcHn6wAd7pUbnuDmkcA9JDKNy1jNN0FlLBHbWL8bnJwhKi?=
 =?us-ascii?Q?B+0gqL0XfKvDQ9Z3ExEqWho0fEMX8EV2mFR3ZEUB22dopyTNdasluOPYG3ez?=
 =?us-ascii?Q?4f3YqCOcTfJ2qJCRCqSoFStnNXFve5MOFKVVGC0RoFALrREJpR2OTqmjlyM4?=
 =?us-ascii?Q?361GDromqfSn6gV7Ms7jxcTl+R0VoTVLEXgfuKdpGUWS4LaI33dVfZICicMu?=
 =?us-ascii?Q?BEk4jkF04w20/HkW2h7BP1yagsxFeOj+z5NPqpailnbRNjeNVGQY3RZg3AQb?=
 =?us-ascii?Q?q3UG5GJuXpFTDb19hvMWEUdEQz0XSP66XsEMuhuQgOuiZ6YEyCS22w7E4zRU?=
 =?us-ascii?Q?Pz04Lg/uzg9kj4AtrSDZ4qADdrYmF8nEKyGKq9vJ7IWzZcyUn4xL0C6BB3B2?=
 =?us-ascii?Q?52fhWTWSYVkH0PlwKXq141+tfxlX4W1AeDfwh9BHATutGvNmN31BIZCUdPVm?=
 =?us-ascii?Q?rj5X54okJ+1+DkHnIRPW2/soG9CBiPctW/ACdWw8cxHtgPSEy6l3vpi/Hdz5?=
 =?us-ascii?Q?779FIZIwmAMRYAscQPG6HeZo5qDuC9nl1wqjI+toJhJvzXihkO4Tg1GNYqY4?=
 =?us-ascii?Q?W4yL3D+6BO/Mkem4gTQ0k3VIYv/iLmZ49vmAJv+TDlD/2HqB1lUtLbXoPNGY?=
 =?us-ascii?Q?Z6las6/aLuE8KUvvLOeyJ2sWOqjCy54iN+SVLYU/pIAB0rl9ywDysgaTuxYD?=
 =?us-ascii?Q?lgD5rcGOOk/K7mq/5LRKuEj7Fv9/rE2D/1grFE1AqDFNN6BIPbzlcvHGnpyk?=
 =?us-ascii?Q?tAMTeu0VtjZq3EQ0NryKgfe2Z0XCpscXrvS/GYyejWhgu15yJtDuL6pdnmNB?=
 =?us-ascii?Q?9tPt5soqjiLQMAm/8pKa54P+I4IeY/YYgwqr81W1PkO0m9d21uTmaN/AcX4d?=
 =?us-ascii?Q?RofUuB/bnpRpqvWU3VzQg9/2lqEi8W7WUec7rUoxshzm1goQaBjQXHeXdRqh?=
 =?us-ascii?Q?NJ/eCgQhtDbtUWSeTy8QAr4BiU3qBED5QKrfokv2Xeu/aJgIGgnsycxrYQru?=
 =?us-ascii?Q?HnuBPxMOj1jCJMrkRuAKZh3c3PNs8RSpyjCAUDoxpLcvTwyL8JUeJYtIbccw?=
 =?us-ascii?Q?2i7PtTFpl822udN+mspypwFBdreZjNHBK0/rzBlKVOtXxbbgsp/8OUTYarKm?=
 =?us-ascii?Q?Z90HpTChOw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49631e8-50b0-4513-8d7c-08da193da014
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:56:09.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIPM2xTTcE21BAnVdhMwYUPpk0YHsWivmBr+9nLTN1RZkDKcvmJb5lHT4R6oSxZrmMqq+G3hAeEP6ZfEFOSEMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6215

On 08.04.2022 10:45, Luca Fancellu wrote:
> Introduce a way to create different cpupools at boot time, this is
> particularly useful on ARM big.LITTLE system where there might be the
> need to have different cpupools for each type of core, but also
> systems using NUMA can have different cpu pools for each node.
>=20
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.
>=20
> ACPI is not supported for this feature.
>=20
> Documentation is created to explain the feature.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

This looks to be not in line with ...

> ---
> Changes in v6:
> - Changed docs, return if booted with ACPI in btcpupools_dtb_parse,
>   panic if /chosen does not exists. Changed commit message (Julien)
> - Add Juergen R-by for the xen/common/sched part that didn't change

... what you say here. What's the scope of J=C3=BCrgen's R-b? If it has
restricted scope, you need to retain that restriction for committers
to know.

Jan


