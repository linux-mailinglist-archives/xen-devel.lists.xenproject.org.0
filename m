Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAD44AC35
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 12:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223872.386811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOsw-0003cL-4q; Tue, 09 Nov 2021 11:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223872.386811; Tue, 09 Nov 2021 11:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOsw-0003aE-1R; Tue, 09 Nov 2021 11:01:50 +0000
Received: by outflank-mailman (input) for mailman id 223872;
 Tue, 09 Nov 2021 11:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkOsu-0003QX-Nj
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 11:01:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eff028d-414c-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 12:01:48 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-kRP7kVf3MgamlfQyCI3EQw-1;
 Tue, 09 Nov 2021 12:01:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 11:01:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:01:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 11:01:44 +0000
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
X-Inumbo-ID: 6eff028d-414c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636455707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdgfNnb3Smx9LHt5quUVXx0L8zg3aqMX1OXo4zdoNQE=;
	b=eTetHgTEYSmSdexfUnh6gdL6XLIQvH3pgl19/l4dGwzWYgs7zDrETt71Zlw4QaN33VIr+j
	V9SpX9BPUUaZbUFHLhU/VKNXl8V3m/IYnEBhvmu60MWgeJ2RZgYz6j2M2zL8gLsp8fhUoJ
	EyhNz2SGVKEVxMDC8DVglc5kWpt2GQc=
X-MC-Unique: kRP7kVf3MgamlfQyCI3EQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqlJBjffgS+N5YowK4KciUrJAx9HGGUxKAldfmg6YEI5D+jg2tpOhpv0QJm/oB+mkGYDwhICSWm4/+3GM78aY2qTHMOajSFpdy7z93piWf0AR/UCzt6tUzTEpvrmrWnISCfrKnVPoYFM8GkO736R7vsdMflfg3LXlaLiYJm8gQ7DQH/YgVQAKeaxDxIV1J50WV23Wk29iM3NRA65ciI4ZDbY6j4435WCXH5d8H8sMppCPskTVgFOIY218eRZgXaH9FdA1a6M7i+FxohYKbiAD8+F9Ajgo5PCSHVhv84MBpIM7vay4AWyoLZNkJ+aYBIceycueCGxujDqUZC+PffEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vYSdXkZ2VP3UIMwg6BJAG4QDos4abJLOQAtlXxfX3o=;
 b=Ajc6+yz7Zs5aS4tvXqtlNz9URWQ5H5pkIMyMlfJ3yi1cOSo8pxun+tkXcWshDcgIl6u1OkKMNSjKvXQBmw1um2TDoZU4D0oBbYAiDggzJZ76mEiRoQ1jJBzh6dcQAlHeSNhBiXN1Pdwvhem617sx/kr5nWIioH2HKW742baqldOfwLhaUDguh202+YG6mNNo0J/H8YoJFbOJjYOcnhiHYvNOrphgCCaZbctiuXvOkWwZAFaK0DkwMxt+dJASIds0RdrO3dMNfBt09AmBqauRs8YtqtdYrq8V6KuzxOBrOWRKhd3Qf2VnptatyaqYIj2ms0mBmi8RpmBIAzlcKk/3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cfc6090-92ab-0e29-21df-e8bf7771830b@suse.com>
Date: Tue, 9 Nov 2021 12:01:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <7A756250-0011-480C-B64B-C6FAF5008E12@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7A756250-0011-480C-B64B-C6FAF5008E12@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc507970-c928-49ac-9024-08d9a370515f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32966EE8B309B197EADD365CB3929@VI1PR04MB3296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8XLTOnSzs73RhJUX9Q49HM/w4cK5qin0bDkhXnaxm3dz4eauzuGdGmBhTQXBl8Ku4DwBHWUkNePa/TDefmnHgj/o90kHRy0JZBd0ZFDBjXJSUx+eckph2mOvPvwyen2K1sbL6IS3kbFkNvV0jQoedbrkq/Iqvt3Nt5ILEdPcibHj65uATnN6u/MdE5lfkXElAUlc8z8MmR4WJg+CSEbQZGDBY1dwgk1r3ns9KEjV0Gkgh9qbHPZd9G/dCfAX7jLfHDk6deYEru4G0uKQZWGPH5X9t8J59GWtG9PJlTRGNa86BNCfBr/ttxH0dWP3wHiYjKERhvGA9tMnBNo6ZWCNkPTPOVuQejU40ED9DHz2W9L2VMFjW+0pZPDvrn5r3dsXOwINFveqNbpR7nzjGmraRcNtms4fIUu/n+gjAS27OuglzDXVMFDlYuofNgGRI1Rebh5hjM1zOFqzczrlSXn4VrVc3j65MNBathZDO+3ll2wtR1YPW63gBIzfTzxX3KxO6ap8U9/kXSJcIptKA3e2Vls3zXvxmklMgKxgd+1CqSvKx1TJjTzKUXhmY/3oon+k0xsIph4pLArXo0LOEamFwDuzM5RC/vV6/uw8M+VylpZzNPUgspqv70TUvbjfTNf1pnRVHuiX/GRXMSsPV5ueM4o+VMrgVkVtw6yA3eXmqoZZ2e0vh/guv+BAs1kiWB32PmSkJwFBfQEBzcyKvbLIudAE9IRqyGb+jHBs/RDWgO2WbNrYnLh+ULKDPmra71jH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66556008)(6916009)(316002)(186003)(6486002)(956004)(4326008)(16576012)(54906003)(31696002)(66946007)(5660300002)(26005)(36756003)(6666004)(8936002)(53546011)(508600001)(38100700002)(66476007)(8676002)(31686004)(2906002)(4744005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mVYlQHgIk3Mci43m0qgt+J4VkycW35zX18rVg8CPMaxJVsqicjdk/FGuA8D8?=
 =?us-ascii?Q?E120FElEOypozUYuqC9f2CttWKJBWH1DGuorwsnbCL92gkTUms+yw5HoWJkt?=
 =?us-ascii?Q?TFYVs72WYZGdZtXJxGLSN5EUT5/KMmnZh3Mdc4tRB81xuBf9Z4qjXRYJMXm9?=
 =?us-ascii?Q?0uy/sFrg0tzQZ7LT8ggHeTOpUI60oejSF0nMSWI/q68IIUMQrsr4/c0yFqTp?=
 =?us-ascii?Q?0mzF82mMPV22exoq2LWB3JVefvtQswwmiqsCT1m00uioALXOB1pm1WtkfL8C?=
 =?us-ascii?Q?Y5ZCHKelRYjIcV4XKU8PyOQT5zvlHnS7mhwb+qKSclK99AUZg5bknSUKRCk7?=
 =?us-ascii?Q?fFsuOIpo0cmJYzapALlLxF3qzld2NMaOLsl0B/foXsyVAFeg9aTa+rQo8+98?=
 =?us-ascii?Q?fFSksxmk+ufEW+pGC5bi0NGrUlBAhxH25LnGBa6qumeD7AxrM/2mhgXdPhq7?=
 =?us-ascii?Q?mYcl+31S0pRdZE5T0khNE1tMq2R8JJvz/M7f9t5f4IVw81JXaT47yu9Ti5YI?=
 =?us-ascii?Q?l8eKfsYhOdHBfagGZuwYT2cabYQAc4nvEve6Ml1WMjK6OWiRqaMv676mcEeX?=
 =?us-ascii?Q?24WizcKDdfl+0/b8bJflopSDumZy7nWpetzIk87WwwsxQzlt4NmEy9OILmC9?=
 =?us-ascii?Q?z+yGrYA6VpQxcHfNoslpUp0BHYbWbwT2QRD9fmOcnVyyF0J/Ccpf00xjHcrg?=
 =?us-ascii?Q?GVApK4Ly7eBVZCP0mrf4vwqnxqwFFaoat3UxVvKTUQCtjH+WZQBf3n/H1SM3?=
 =?us-ascii?Q?XEDf38JfbOxar4E5Uy9pvC6EDEvOqds/WuJgUotcaiImrUjcuMAtCe/QbfYZ?=
 =?us-ascii?Q?fXT4Bbv1e79sCnaNeLK/z1wSFZ0rZ1oskp7GfGphewbNQ+7/j8MctOsVjtiX?=
 =?us-ascii?Q?GlwRCG4Q9eD9mOrrrPtESj2pZ8zBaSqcRJSeyjFHYCFpGOsUb4oXyDjNhXuL?=
 =?us-ascii?Q?uDdPyPBCU2lhCv5ihQMyeuaN5umoUrTnpbK0wH7NRiRUHtueEdcHCpJzw74x?=
 =?us-ascii?Q?+0jBE5XSHiTC/Ams/daQ7IE6YTw1/fdjt5M9PXIcTNwoTZqLlone5MEpYOWr?=
 =?us-ascii?Q?JjnhC+p+Y61ORQaB3u3N8Uw8wL9nLcBg8mi88OktSU2Ugl5ShRvqanDp0ixX?=
 =?us-ascii?Q?glor2MQ5s1kgGtyUvlz6m1DOyFu73KjXuA5bI+g/4gxztCuvEWXm43WNC4JZ?=
 =?us-ascii?Q?Q9P5XZgZ1QdJX6FeTexiw5NUK/sJZYPUcY43Bi8KaExroS5rGDv3eVt+ifZv?=
 =?us-ascii?Q?byn5TgLG5oU0kUO/Y5jr583+gv2wDPhoQexI2sVsaf4XqZvfAQj22Cwdbtnp?=
 =?us-ascii?Q?kOKnSKmFaE63/+J4nCebyVvXOywh3GGO+na6NeSuIfMj0/h6gsZdvDaBc1Uf?=
 =?us-ascii?Q?X7VXYyTPxxlFKz9rB1g49DqrYh6v0I0xn+FecZBIRtTfheDW0iiXAauMk/sW?=
 =?us-ascii?Q?YcbcZ4q66zN8c15dW3Czy+qZ3ErJH4OLanEzXJwh2KO8/3ET/nxX+vdOYB97?=
 =?us-ascii?Q?1Q8DtqzafLZ+Zx/BbHj/EoRWvg4GCyowYmFw6FFLp8n1ZaseboqQJPT1xQnr?=
 =?us-ascii?Q?to/4ia8kpuAw6l3enhQVbjBNbcfS3WyT7zXQUY2HbJlEUBN7vYzSbhQTiPcU?=
 =?us-ascii?Q?p0fBT9u48QFQijn1e3aHmVA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc507970-c928-49ac-9024-08d9a370515f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:01:44.8186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxZXGvpQzuTxerujJlNs1g4HEgooiV/IMbIUmuBjwgAnOzFQK17NgK+sxAY/j6p/t+p8Eue4fYPsNUFho3QgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 09.11.2021 10:23, Luca Fancellu wrote:
>> On 9 Nov 2021, at 02:11, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>> Should we have a global variable to keep the dir_handle open during
>> dom0less module loading?
>=20
> I thought about a solution for that, here the changes, please not that I=
=E2=80=99ve just built them, not tested,
> Would they be something acceptable to have loaded_image global?

Not without a very good reason, I'm afraid.

Jan


