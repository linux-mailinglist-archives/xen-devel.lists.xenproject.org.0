Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2941C050
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198782.352459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUfE-00058x-Kd; Wed, 29 Sep 2021 08:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198782.352459; Wed, 29 Sep 2021 08:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUfE-00055Y-H9; Wed, 29 Sep 2021 08:10:04 +0000
Received: by outflank-mailman (input) for mailman id 198782;
 Wed, 29 Sep 2021 08:10:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUfC-0004rK-Gf
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:10:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abacd0eb-063f-4697-85e0-86b4d5fce817;
 Wed, 29 Sep 2021 08:10:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-oB5jKPakP2Ovu2tTxMdYzA-1; Wed, 29 Sep 2021 10:09:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Wed, 29 Sep
 2021 08:09:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:09:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0192.eurprd02.prod.outlook.com (2603:10a6:20b:28e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.22 via Frontend
 Transport; Wed, 29 Sep 2021 08:09:55 +0000
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
X-Inumbo-ID: abacd0eb-063f-4697-85e0-86b4d5fce817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632903000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dof4yb1LmJn8mR4Z9d27TQQYfPB6VwuVKCZ4rJkEVaU=;
	b=ff6cAT3LCQbUOTSDNavZBoDBnsz7+qSiGz6aMIzYA4SWy/zOOo2RB/TcoD9nslZmt4p2ub
	6mzqjEep4Jwino2tsgwIe3G0JIfsqpXALtwKiTPHn6MT9BAYgZhoABs6qVa+XvrGKFSuH3
	O7+v6V0BVM7GbDJngD6k+06ucDex6sA=
X-MC-Unique: oB5jKPakP2Ovu2tTxMdYzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoPL0wZU7mLL6cE51dt9lIm8MQSH4yj6zqIzgkpG5GEXh22wfKDYSRCSSaSu/NT+Kmx+i94u1JsXnBhuoXxcw+iS5QN9XdmgfbTg9yOZFpf8QJLd+xqURVTVVFSEam4VkscKCSrV4wlV8zmp9itOlHzodivq9dwgYNfO2TC5MryHlVvaGAju255XFvu14IWmgZB0Y2tvAp9xaP9kiAqJ4l9YUytq/UvC22L2v1+dQ7bDMWnCgUF5TzAkyckaZbp829V6qdD6Q3h1YPk81spO+jZvwZqMKXwOllcAAzy8pt80UAausBlPD7BV201WSKoonJis0sjSLtNlAQH7wFAN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=27xD78VhI9s2N/437ueyYiX2G7LUxR9hoJJ4q60h99g=;
 b=RSLTBTBnv5eUl51blbd3jw/uNNZv/OJgtsjrdOwsj9Jlyr7iLO4AOOzqZjtAZVd2yum7FxjM8K7ecuuTCdrxELdRbrpKREViihwz5vsD3yojZw+iUCeUeoe218G63ebbjMsimL0IDEYS/1xjMTmMWpIhZq79QQpDKskpcTUyHus0yjJaQjvXntRbL/S0uE3cWq5IaGXAekHioOu45RIGatkdnvPSry8CTHhjuitMUSM+2CkGFbP+g+DB71bTrLxlRy5umf981EutXrG2q+HONjqLN2uUBmrRGBPgChyC4CaLA5LYNZXCgLmHypuWnXNrhzJjFCGonnskQ8j+KmVwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 3/6] arch/x86: rename debug.c to gdbsx.c
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <389ae979063a4afc38d8dbadaf539e7f411a24ba.1632860589.git.bobby.eshleman@gmail.com>
 <a094d614-2296-bcc9-1c7a-084ef88b05ad@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a578a18a-ef43-c257-bbf7-cf29b81533c2@suse.com>
Date: Wed, 29 Sep 2021 10:09:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a094d614-2296-bcc9-1c7a-084ef88b05ad@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0192.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ec70415-dc7b-4fcc-c185-08d98320861a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703C0EF0930D337A88CE2E7B3A99@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eph23FYTL4s3T9FZ7H/zCj53NmYzaUeX9wzT2kKgHOGcOlEPHCgFUKPmJFvzH1wXiVCM9WOdurVwk5HK3vvFkg7gltsIHeTx0U8csGQJd60rUhJ2uD+mCGdlHMz/qdTBJt9tOqHaFflVvpV7TbPe7q7QM6ii9ijTWx8QZWbEkzHYhGDn1wCBlw8hdf3Q1kBrTMeqNpqgtAIyx1AkjBSIyLzaNXUr8yiSD5CyrB1eEaXb872hYD+byW5xAkmoLWIAKAFMMgMuCcElvJWoro+bj+6FN1+6zjjDqN2g58o3nObYP3U36MLA7A/6JCqrJsRdWOIFlKYZ8JL5jAFkOiXSho6vPvAlcrVyujVbK+zZLPMJiE79C1G2XIGwo+SgdAJP5aNzxcqZofW3cIf0aghBuvUB84nol66cU3cR0hYSLrciBGQspKmEa73ulM6tnBxLYTClc7oqhFEOI2gS3Qyh3LV2ZUigSolmK98Uixb9GcTHov1G4gf1uxh2MibEECGEIHZFZ4wSKaW+feB55g9Px5lfXYt5ZKP7t4QB3WiZg/kf8avxO9RuYsh/IqMXW0BDey8ox4cmBHVwN3V6QKI03ztqjtqkq091vNhTK0c93qrYZYt6aZISHSzzAm932QDBoZF9lyxqgo/lngcYmMJWynL1v/J8rdw00ZlvayZuE5KKPWpOYAlN4dljmH2HDb9arK0KBRmOusXhX1UiRImJysyDfU9ZgckpJeYR5UdT+TQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(2906002)(16576012)(4326008)(36756003)(8676002)(66556008)(38100700002)(66946007)(66476007)(83380400001)(316002)(54906003)(508600001)(8936002)(7416002)(5660300002)(86362001)(110136005)(31696002)(53546011)(956004)(2616005)(31686004)(186003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EZWCsdIyXUQtaRmpx4j1Rdk0jFWkQ1EdzTX6Xx1j+mwFVbHRkxGCB4bOqdvi?=
 =?us-ascii?Q?En1ngSMzolS/Ls8wWHMKhSaj5qPrkqfdOBe9rNe2Ov/6LZsOnGvBO0ldVNjm?=
 =?us-ascii?Q?UG3jdkGP+kVsO/QnQSMlsbr+WA9xuDmiLwQyNC3aWMlLpEpMKW2D7S5YPQQ0?=
 =?us-ascii?Q?r52zHyXnQMsu+V4QZxQovZsImyoJE43Af6cI2cXOxvt/+xJ6DLsjnqlJCmbn?=
 =?us-ascii?Q?g4d1lO9SRY2DL70T1cgODbQ2J97Zp7o2n8WkNn/bl6CH+ykfpDYkaE5C5wpT?=
 =?us-ascii?Q?7aG+pHdrJCjjZ4EnaxMpxSxPw2wDs91UMZRGztHJTajZsYQn/Ef0Y0QAiU6t?=
 =?us-ascii?Q?f6R1h+Ct4Z1hdcrX6gfRvSTz9P2Jz0o5oGR+EVchlKGWET9yrxxy34jt/A5r?=
 =?us-ascii?Q?3i7mycW5yyesHmnlyoYyj8P9VV8OOps1a9lYb3OK2RG0BMIdmdrc42EwpwrX?=
 =?us-ascii?Q?wIF0AiXK74VrarA6d+koLUPz/vur1GhQx6uzg0m8Oyszz8Lfh4QdpX/Dz1XK?=
 =?us-ascii?Q?eRXVaUjamvRl4MtkHbk7uMofVJGHhwnx0eHcjRzdED2uD+eFZErkc+Vnm8kx?=
 =?us-ascii?Q?kN1YOn0zr5byceaBW7kwmtnTeCBqyjQvW0xJ3RqoSesB4vOn3G81il+jqhLw?=
 =?us-ascii?Q?IlQZbi2dY08su4DSGJBBzTBITTgYlFNUVlrJQeFDJEfmWxFslKOn9xKpc6Xj?=
 =?us-ascii?Q?n1lzKvZQ9ja84skaW4lqllZP+cD0wK7IlVSlagVttU31X2UH4StrDhRnQCB7?=
 =?us-ascii?Q?YW3RlUk6YjF1iUjkhBIhpA7XaG/FrZIjD49lS2LW206xTkA4isHH5jllHUuG?=
 =?us-ascii?Q?Uhr2a44pR7qeRfeF4A/3Tv0VBN8Ctxex5MfljtG6byRMWLCuJCoOytqzVi0w?=
 =?us-ascii?Q?NVRbsBqSMx2/imqnm9M52HbQ5k17J90ailfi52g3j765LYPwgQwYlHJMlezR?=
 =?us-ascii?Q?cXCujIGB18rQwP0nIlaSA4BVAxXL7NrjQuMnVk1EVvkAqlJ3L6bt3odO2uXt?=
 =?us-ascii?Q?QoqCQtQXRVygtlv+EEyWnvJDIds/gDqFxrzy5syGcK14uQzmD3xqtsb92QiU?=
 =?us-ascii?Q?cIYwSyu7agNQxnHWfIxonCJnVfcPcjvlFXwEjNHq2XUfZG0q65oeXJ5ndA6l?=
 =?us-ascii?Q?8TxWQMlM38Dyvn94CaCCmh9AeRCdnXVQ3QIa8MjohxU16uGRv19JvgPeko3W?=
 =?us-ascii?Q?+K0d+RXcsE3CQw31/wXoULljV/vJDmoM/odlISUD/EsU5gLYJjmZxCJYfQRT?=
 =?us-ascii?Q?ljPmK9qpOi1pAJA/tRGIXZuiz4QMuFlRwh7VspVe+T/yOJ6IerVmJUDIfBpe?=
 =?us-ascii?Q?hqq5y+d9kmchmTFMTKn71GEt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec70415-dc7b-4fcc-c185-08d98320861a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:09:56.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaJE7tfq09zwDTdqAWRbj+Sj7KTMpqfW2F4De5pzu1VwgTqJGUfAJtIxM7gHTrhIbaBdLB4arh9lofxkNHeMuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 28.09.2021 23:09, Andrew Cooper wrote:
> On 28/09/2021 21:30, Bobby Eshleman wrote:
>> diff --git a/xen/include/asm-x86/gdbsx.h b/xen/include/asm-x86/gdbsx.h
>> new file mode 100644
>> index 0000000000..473229a7fb
>> --- /dev/null
>> +++ b/xen/include/asm-x86/gdbsx.h
>> @@ -0,0 +1,19 @@
>> +#ifndef __X86_GDBX_H__
>> +#define __X86_GDBX_H__
>> +
>> +#include <xen/errno.h>
>=20
> The errno include wants to move below....
>=20
> However, you need to avoid latent build errors based on the order of
> includes.=C2=A0 I'd include public/domctl.h which will get you both domid=
_t
> and struct xen_domctl_gdbsx_memio.

public/xen.h should suffice as ...

>> +#ifdef CONFIG_GDBSX
>> +
>> +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *io=
p);
>> +
>> +#else
>> +
>=20
> ... specifically here.
>=20
> ~Andrew
>=20
>> +static inline int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_g=
dbsx_memio *iop)
>> +{
>> +    return -EOPNOTSUPP;
>> +}

... for struct xen_domctl_gdbsx_memio a forward declaration is all that's
needed here.

Jan


