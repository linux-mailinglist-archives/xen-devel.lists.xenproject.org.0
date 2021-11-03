Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E238F444011
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 11:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220754.382143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDbc-0004ss-UO; Wed, 03 Nov 2021 10:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220754.382143; Wed, 03 Nov 2021 10:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDbc-0004pd-Qi; Wed, 03 Nov 2021 10:34:56 +0000
Received: by outflank-mailman (input) for mailman id 220754;
 Wed, 03 Nov 2021 10:34:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miDbb-0004pD-6p
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 10:34:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae2d4c6c-3c91-11ec-8568-12813bfff9fa;
 Wed, 03 Nov 2021 10:34:53 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-rHhNr8pdPkiALXZ4V9pr6Q-1; Wed, 03 Nov 2021 11:34:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 10:34:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 10:34:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:20b:127::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 10:34:46 +0000
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
X-Inumbo-ID: ae2d4c6c-3c91-11ec-8568-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635935693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cevN+yG2c51sC3jvejAvDf861CAncGEf7ANdCxEgpik=;
	b=iV0GzyYVJ9x2+oWQLXCC3V2h/W9YeWFwgtcN8w0D9CQ8xO5/nQtO3UpNqRwch9uxW+pMIk
	4cCYKRSb+2SR614hK4CNP8+h89Od0fDLw5ciiqAeY46IpArKYDYCzfhte3VSZXTwJcBnmX
	55kMPUqANUuFgf43wV3rHVGCYwkszvs=
X-MC-Unique: rHhNr8pdPkiALXZ4V9pr6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNSUzLwMVRmgQgfSmZ+D63Qo2Ml/Xne+RCGqNksA1AZlcNeo1zi6aVP7E8aOR1vu0lTQHlIcFC5plY5jFRemTL33WMo1xVcJmqK8iSctOPYD7Go05IhxHdvmqufxtnQp73nvLybJdzchVpEZbr5leHtLDoIGhIxf9PptxLnxD+DvrNK2Y6IgPil+OUImSTqjmIH6OqU+IsX4NYYAFVKRITYpNE2MlXBv0ujMnpddqUhJlN6xlmAdVydYz8EcTy0Qxj0Roo9OTTtgXMszJv+dlck3wj29CPhHE2ausUeu9YvbfPg0LTvJljjr+BZvNA20xodMNf4sBMZz6zUyHEcL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbvy3+lKfyxPz1EZNGPRWx3Zx5KsZ8B+QhFeyEV/chc=;
 b=NBglv4+WDDm/oiouqCd/Pqnm3UZGeuwWyY5bMKibmqHjC3Dlo45qC7Bklj/3j3mWTWwe3FyQmiD/j1NgM4aCKt8SilaE6BzvncW8hMrDF3dTXQbZzSSjLbIpWj7yZqifaaq5V5YILD/6v1kpl/JeguXigoq6WrdJOzV8BVRVTZePIpa5b1Hg90Ow6H4Sp01a6W56tx9mCDWn34H757lBbkOdsGIaEEUep7KEOHygHpSQWIo0ury0Cg77olM2n1no9dXfcnw0yq1QtaHTqvn2ebhORoqJP8O1T6nMbDmEQbLnuwwioNq5l/Ni5GZN8Ol/ROqnipRPqXysRRjjZT0Guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
Date: Wed, 3 Nov 2021 11:34:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
 <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0140.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a8f9b3-66c5-41bb-686e-08d99eb58f42
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559788B6F39A00AAB955C2DBB38C9@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	01wDwostcoXdQoOFw+WBYm8BEk3XnSLn6FSjrF7rKjxRj8v4O0/iXdF5jLf7jGeyqyVwOn0GmK9Wkr+vcH1s1rPKu46Kjpya3U/qO0uNMj++j/0sSBaEo+FSWkrzfAKaSYyys4sQu0NTuPHZi63DyFE3FE7yJkn1P38AdHlhp7MXgWGA9haYW0GStI6X4Q7iIz351i9meBLfexs40SYMl8SQnZndBJaboSrTBt4p+1KjQRyofI5BDkPlK5IEJbZ/Nj5dCdZRk7SgLCcMIGPsrGyZAUD3eLDo8FzeK+qV+ynWI/trOof4wVOhpzdi92zGoE4IQgUYFW9RFv9VMy/aauXDdk5p83hwuP+9zEbvZw30od/Nm/zPwM7xFhERdRL4Om/mmj5Z4KTqc1KgH62QD+CwFZjagULcnD8F4bs3mCD26IMTGxYVCOQPi6MZR2JULgp+X9TJpe/88Zx9Ucz0w+ctyPVGJ2cU0EU20RiM1pI6UF1mud8QZGtWNWkl7b9HaPOWjgYPDs/jbjlfAzk6bVH3BLE5pnsEnd7Rin7Tgx2gxMrq4OnAt3MjgX9seSFnHcXHUtTROwrB7WclQj8SF9JvYS8DWG4YWggkdBqTAKBYmreLk2WNDxIyWFYmmfEaTLs3NDP82utXRtGzXUv4TovJkdlFMjccKMaqWzEI0VPu2O8eVw7d8P3hjgXHK4sRATilSuKY0Gzk4n7dHX76W8xV8PG18wCtTOhvp/PSiNIGYUw3+eQDRFGwhNsA5G5G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(186003)(38100700002)(2906002)(4744005)(26005)(31696002)(36756003)(66946007)(31686004)(7416002)(66556008)(66476007)(4326008)(8676002)(2616005)(54906003)(316002)(16576012)(6916009)(8936002)(5660300002)(956004)(6486002)(508600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?URMXFJKWhh3FlYEBcFMgN6IplqItUuO6yicuEUL3tUGZlsfsBCKtEvHzz0zV?=
 =?us-ascii?Q?nFPjtmO5gIZnveVJCldJevGu8sd/d3gJ2T2Q54pJH6ZoHc4dxwrzZHxMoHgG?=
 =?us-ascii?Q?aE3kajPsw25d3RLWY85i4AyIHlot1OEblmdukf/p8/7KlRjL8PaKXhyMUPyf?=
 =?us-ascii?Q?HDebbu8VkCnx8dPMoFfmvu+C9D9cgfcRuw6xXBpAHnQABg4nPTVJq6Dn3aHI?=
 =?us-ascii?Q?b1UWnjm4Fr4xIoRzb7YUb/L7EZHmfQEyi8Je+L3c8fLDDKMovuySBB0qavAa?=
 =?us-ascii?Q?7xGtYd8/TkXrlegh7IyVvlLSho9R8YVa7zt7SnyxDFHJYywgTeQkD9xUJSx9?=
 =?us-ascii?Q?86fGVSY1AZojFSK2YzNZ60HYiox5bCO5WIaCqdy915SZS53QY/2D3tv/4lRB?=
 =?us-ascii?Q?jc7DOjwzew+pgTOASo0LIWwm+DVJDOlOCLAbhpPa34fclaIzmc3sQnFjAUHd?=
 =?us-ascii?Q?Mnr9tBTHxEuKnza7icGbLdOIHM5fMb7k3VyO540y87kbkmwTdlqPlmyGjJAo?=
 =?us-ascii?Q?1YsbIg+HXZ5KWvwPfmJdU0FwD7k77Q3ByUzMwDhb38YxyxwD/DdEymhENQ12?=
 =?us-ascii?Q?+ZBhfzRPdkF8OMBrSDXuOmrk9Y9OJVhYZvuhE7MULiRY28dXiPQTElbDVRVC?=
 =?us-ascii?Q?o8vx39bayQgLX6CEThOoYk9aRRZqR3DEPTw/pC6lmO7QXrx+IylzOM1kcf+d?=
 =?us-ascii?Q?Bz7O4rRwds5NgEo04zoKasMwO0t4zv50vORmPJYzot35BP1euX5XtDZiQk1N?=
 =?us-ascii?Q?SybdmBCttGYts3tZKu7Plwq7H0R3buYrvpVSDEDmPvOF8a5G//6Prz40/Ymp?=
 =?us-ascii?Q?r3AZWCWAi3iJI16+BNel83Qv78BJJ6AXACB3TDUUSvOQZFcYeG/izG3wlrZz?=
 =?us-ascii?Q?InVqrapJeMuNWZkzAtUyl6JHwJOYN4OOsQgWW+vr058gVUrIKNvStr2zvGtW?=
 =?us-ascii?Q?YaZ08HLORjww13oEb3xShMi+64WrBC3Aa6nYbTgpSvtpdz6BEOj297V1rpRg?=
 =?us-ascii?Q?zpzxTEOSElQFW1t4wq5rNFoMaGouNF7cNKGsZA17klGZ2RHNzV88uMFC/5DS?=
 =?us-ascii?Q?/Uwz+wwKVvtHc+kx2JQbqcK0xf6KPVVQ5GWVDGrgiN0UzjzjUKwbDfa4f//3?=
 =?us-ascii?Q?uV13Q8OaMvG34ra4U/qYn1DpmjwDGsR/HVl7liXO3rBqdnewWXoyEtidVdV9?=
 =?us-ascii?Q?7k2c+1i85XUrOJtwLTv9DyqwOya0SQrJo+KH07UbSWGcyf9rx6cbPKUajXe/?=
 =?us-ascii?Q?KsBrimUtqCYa/qzlVr8cpi+4kmJncoKtlH5FkNZ9B85VaYhgneR+BMRxqrik?=
 =?us-ascii?Q?9M89n45Xz4RCNtdPEgRFe15+1/eiPfQPg+sUY4O0VWrhJigKVozrCpHvZZkK?=
 =?us-ascii?Q?oBEeFstwHzjuah9zNqVjieI1W/OsKLZRyB6m6ev7isf3lnt7Jo+ShA4bLAol?=
 =?us-ascii?Q?YmP222CkehCrqVGCS5MVcisunzPy4xEBKcSzDa/QjVUbHfknwYg8/pAvbdev?=
 =?us-ascii?Q?Qa7GvH+oZnCIr2sV3rctVtwH3wp4rQgGbtKC0xexATTHML97ITrnhnCWw1jc?=
 =?us-ascii?Q?73vBPDqNhMmycoHQIg2+FSvTxfmvsDbFNVVTvBfUkG3aM5EzAR/jZgqLGUXX?=
 =?us-ascii?Q?3b7B3YDqkLHkO8Ni/q0Co4I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a8f9b3-66c5-41bb-686e-08d99eb58f42
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 10:34:48.0368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMsbthOz0rJNtDBWm9Im82u9x5Ky+1OjkeUDWEi/kcP6S7pbfv8zYfuTNHu59AKIvBDqsS2CGaMTug8HTlmyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 03.11.2021 11:24, Oleksandr Andrushchenko wrote:
> On 03.11.21 11:49, Jan Beulich wrote:
>> Aiui you want to prevent the guest from clearing the bit if either
>> MSI or MSI-X are in use. Symmetrically, when the guest enables MSI
>> or MSI-X, you will want to force the bit set (which may well be in
>> a separate, future patch).
> static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
> {
>  =C2=A0=C2=A0=C2=A0 /* TODO: Add proper emulation for all bits of the com=
mand register. */
>=20
>  =C2=A0=C2=A0=C2=A0 if ( (cmd & PCI_COMMAND_INTX_DISABLE) =3D=3D 0 )
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Guest wants to enable INTx=
. It can't be enabled if MSI/MSI-X enabled. */
> #ifdef CONFIG_HAS_PCI_MSI
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pdev->vpci->msi->enabled=
 )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd |=
=3D PCI_COMMAND_INTX_DISABLE;
> #endif
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 return cmd;
> }
>=20
> Is this what you mean?

Something along these lines, yes. I'd omit the outer if() for clarity /
brevity.

Jan


