Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD14544DC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 11:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226712.391868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnI4U-0001t5-7Q; Wed, 17 Nov 2021 10:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226712.391868; Wed, 17 Nov 2021 10:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnI4U-0001qd-4B; Wed, 17 Nov 2021 10:21:42 +0000
Received: by outflank-mailman (input) for mailman id 226712;
 Wed, 17 Nov 2021 10:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnI4T-0001qX-3w
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 10:21:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27270fa6-4790-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 11:21:40 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-mnWt1ky-Nmu8TMNm9wXpxg-1; Wed, 17 Nov 2021 11:21:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 10:21:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 10:21:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0051.eurprd03.prod.outlook.com (2603:10a6:20b:469::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 10:21:36 +0000
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
X-Inumbo-ID: 27270fa6-4790-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637144499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+IkfjkCzUnC8KNynMjolizLgIjAorxKZeGoesin4bMk=;
	b=m4RM7StODs/oPAne+PSjFhcKVpr+pzoO9bgz/nmTQP+9V6Hb4O92zS4xLaL0//sqEEtOTO
	ClIPRg2w/DyACScuLT+UHR2Nbw4ytZQesAttndoyhWNLbdzNnAnqB7zvMyy0U/cTpqSekE
	q/oy9nV9vISRUzxmKafIJQ3w+G+r+uU=
X-MC-Unique: mnWt1ky-Nmu8TMNm9wXpxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4ILeQjZYp5f51m/J/OHKWP7vaNXRzkRfXUtz3QfBH9yqE7K2Qbir5+ydzyBuyCA/+STtsySMwSwipsCa8h+tKbUjgwXjIw9bs6FSJ2PCxIisQ2jaV8XnoNzfVm+0pv0GoiUPmTss1eSDt14govnMCuaSpqa3VkwvHtvs/DdH3K7ZrRA3cJzvFSs32rrKLLdIB9lf/Ll1vjQQLR+qaG8OJElPC71CpPKmwmfn4a0mwX6vWXN7nGOY7ZD2w0EL1lEMe70gK9CWVLcZzz0NSfzYfmilCyszVteS4sthRy8cmCIIkbQHVExl85CRc8io9XKcZ1UTkOEJlFkKPHp7HltFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wjtB97RtX2/c1qiZXzGTSawX168GUcaFVbcDTQC8UI=;
 b=P5QjH19TkBP4VzfcQXF4LUqE1Gq5H2CRL60nghFZOpWHypNh6W6iKUt/qQPVGYlzQG7j3Q1XdKzLjSKdr5ilt9ol8jMDW6f4sBlkh/Zi2/rhJsRKr5yqW9c6JwMyyIyvNqBmvLe/vyRZ4Cip7UucPMmcFCbrZpOY0GiYnFZAF104PeuoF3C+/IA4aUUDQcys7h8aCQf8XWeA31fOjxCNQn0u040Z1ub6HVb/Hr4uf655jWngo0Q1mqJ1tDQ4RoH1KW1oRo/bUlbFcT3QKFcbzTmv8RlVVdrScKRq9/+lcw/P7WKJGIK5zWbb1BtGB0ff6bWbmB9vj0o6HWVJqOGuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0994aad7-0e2b-a78c-5b23-422c93dea353@suse.com>
Date: Wed, 17 Nov 2021 11:21:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 1/2] CHANGELOG: set Xen 4.15 release date
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211117095338.14947-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0051.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84663645-a1a9-4ee2-4add-08d9a9b40932
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3534278442B1AB801F7C31F4B39A9@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/w48DhlTXprWSgHOWsMeMRJmQDLC0fs0o30vykEQXHGrBI0nQRAHePvVJcdU8DLr69RWrec3TBT8hMD2HPm0H3YRsGkp75GtfvWsulhIX2IcLQnNaJ4Xo/h73FjWAN9ocm8NF/nNkvB9eJEu0l+79qrPpcU7Sc2GUN68zQeV3GaM/K89yhdPm/bDeUu85qi+BcwJOCb3Ou42rXJkzuGcqFmxthDwPYu0/jg3bP0g2etm9mLIomUl8H7i87oekp5E600xh2PLsnOmh6VSUt9TmWnl/b58xzcOWtGSKC8L8lTjCrLFwDhdJSRjOLVywWh7FRyykSEL6pXvM9uqd+LIWoIyWYY3wJsNDfGBzbuG/7KRdu+dkZfE4fdosHAm9jaGZUAkSpAX9Skm2/yGOPLRkExIIdp/rgme4ZxGwi2uHa2T+kbrjF9FSLyUh+AR9v2s0vAamWfM8KskhkwtcwcHtnhOmbN5p5aEdqTPiAMYtW1oI4JTGHc5K0ib8LoyziOb52Azl8lheLfp+T86/PLlF2XAAPTk4OyuolTosD+VIIO954L9WGyCzo7iwGPsiftEhYh+W1V3ltGDXdSBUte2VpLgsh1qpwTw1YBbd8YPjHBqM53Aez0mvpJRjg+PrYLpc9h2oaoemHQL43/gQA2oh8hqzwsE+8XKhDPZ6n/IpBWLXcYCRK+NRhaLyFUBMSIl8w5dYCww1TWyASlHCKOI0YcYTMtUdROWOIGA1ZEw7yhD7Dxb6R3SnvGZZhy00sn8yWpke10SoESyV2ExrnfTKEy2qTgy0xMpD+xGzmP07zlhvqSAppj9/K6KVO7V6FbJ8Af9kV6h5WQahBuEA8Y/dH9WaLdbwbRCoLJA/frtqXXjxmf5JE47ymnL+pHzLm/Cm2a8KxKVkfvXqPOxn0r+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(26005)(8936002)(8676002)(6916009)(54906003)(5660300002)(2906002)(4744005)(186003)(316002)(36756003)(38100700002)(86362001)(956004)(6486002)(2616005)(66556008)(66476007)(508600001)(31696002)(66946007)(83380400001)(4326008)(53546011)(31686004)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rc/mqBt8CX5CqgfoiUWxmDCVNuzuVu42n1EtmPotGIav/c7obnlST2m+nUiF?=
 =?us-ascii?Q?67NqxFz6KZhV6OD7LrHWNmWlsf6mZ5YaZfMI9Vl3b5/XqsF3rWPDDIJyI2FC?=
 =?us-ascii?Q?PM/MfHts9y7QA9ORaNIvrmcLraf+jMd/+LU29jM+5Z6fl/LoxDTz6jmi0J0I?=
 =?us-ascii?Q?SxDcoQLBX60CgSWybGpoRPI/7pOnKWEWMh53SRQfxcxXTZ0lQeOyPGWAit7i?=
 =?us-ascii?Q?UtPz1h86oWr1ZYUexDzZcOD2Bf6URMl4IXaE9K4CZpTBloKaUmkhaXjflXl+?=
 =?us-ascii?Q?Zao3g/dd5t0NEqDB7vXQ5n3/9ZYjoHYvJVkjND/qXonpwpno7CLzUZLxTujg?=
 =?us-ascii?Q?B4IvH3RfyBotfQDsWsuN3cRHo92yOtv3lt3EA0LKKXM2X0GyZZMPwOuGPO0l?=
 =?us-ascii?Q?gH5ajLTwReLji+HqLiv+eswtIMB9Djz32kuR0HKVBEu+gT6jzeu+v3McFiLd?=
 =?us-ascii?Q?12AJEObJwFUgWGuqoY+vYFuxE51FDWKk/9SRn9Kj2URKw6Qp7bhHyN0zZdPF?=
 =?us-ascii?Q?/IVi5YPiNySo9sJn2G+H9iMpBhDyz87WsvRr4z1ygUVH3b89TRZJWfZ0u2Nq?=
 =?us-ascii?Q?VQQh89o+dToxo+qWhdU2oubT+AZ8Pt44D8u1Vjq0nDQ2Yfny73GMh3D11jDK?=
 =?us-ascii?Q?1HE2jG4wMySgdsGZA3ZKWOslMLjzmiiGlc9wtSZbSHJVbLw4AgVQuPZQF3F+?=
 =?us-ascii?Q?5uH9VUzDd0d+a9xt6h80/oKeCKESnxhpgTZjDkrxp5IXj7jCrZ0uKWGrKxWy?=
 =?us-ascii?Q?nQU/YOH8L+1xcJzDtiiK1uoXRxlq9KcE3nDCHLRrVclX0xs2G7iFF2T86UTw?=
 =?us-ascii?Q?IyyIzBHkrijjpxba4BeAMEukPZFH7NE9X23aIQcnQp8a5/pp+32swRirGn/b?=
 =?us-ascii?Q?ZAbOeAkXfpvubdNpl8TlkiExUlQuRYF9Nmk7w4p/8TussApBKbvRP0JzHwfK?=
 =?us-ascii?Q?+XxiyYjRc0Iro4Ud1EOzeSFFjf+cOJSBjDuC5cd6VypUs1gD1uYXnlKUAvT6?=
 =?us-ascii?Q?N0i5IyzxEXcyK0aOdrqSHdKjrYsDQLgeRPVIpD3oj9iPJdPoYs013cXQ0t5L?=
 =?us-ascii?Q?NWxthQfXQ7Gp6VA+2KsMqan22Zbt/kjDY4QzIZIX2EhEJif48ZLNIwhEcxvu?=
 =?us-ascii?Q?aAik0TBGsL8/cm9CXFpuA1SKd7+vocAx9FJLVnUIpIZZCZfaZJlo4OIoZ9e8?=
 =?us-ascii?Q?LSQLqXsMSOXIOrscVBQlDWfrMw/XlhqHLhD1zoUBXqQV1N9jaUPHGOkhJDiE?=
 =?us-ascii?Q?sPah0A0vTs8FVsVh+qx12/e3Qj7u3wRufvp4DrZkQPkAAj1O15D5olkvpW96?=
 =?us-ascii?Q?gkSOdrYyqq6F2+pk73Xh8ad2t6h6SSt5qSoc3mywgN5W5EoqqzCPOVmtle5n?=
 =?us-ascii?Q?9xc3fCzhGRTeEE1XkHtrnVN8smGOkf4OJ57O3wqEnCgRh4ORGzjitUy/zmL7?=
 =?us-ascii?Q?TTu6L3J2jfvMEXs24hgT+iDosQg5zUr7KrvblEgVnn7stjae6gYpui5Qx6sT?=
 =?us-ascii?Q?Tv8SGUDQLiJK16Wghe0ITTguivUGelc0bk9Wd+4YbX1cRJ+S/F1l0jgtNgn1?=
 =?us-ascii?Q?Ixy431wFDb3t1X5LE3ryAL6CXmC225Ufp5EaM68jql/IEAg6PRRaJuD53vID?=
 =?us-ascii?Q?T9XvcnRpgC6EDw/YNmI3r+g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84663645-a1a9-4ee2-4add-08d9a9b40932
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 10:21:36.4193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPqWeV+AQ+e/IhZWXC9b87HP9XgC17VKv4ODDLRBORqzGKMjM6GVub1+3zlDfAotvGYCRogncSWEc+ZLECJNEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

On 17.11.2021 10:53, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm puzzled how we managed to have missed that.

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,7 +22,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>     no longer be built per default. In order to be able to use those, con=
figure needs to
>     be called with "--enable-qemu-traditional" as parameter.
> =20
> -## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Ds=
hortlog;h=3DRELEASE-4.15.0) - TBD
> +## [4.15.0](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=
=3DRELEASE-4.15.0) - 2021-04-08

One day off is not really a problem, but I wonder how you ended up with the
8th. The tag was made on the 7th, and the commit that was tagged had been
made on the 6th.

Jan


