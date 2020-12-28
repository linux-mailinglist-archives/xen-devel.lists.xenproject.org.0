Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F552E69C8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 18:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59530.104497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwRN-0008Cj-T5; Mon, 28 Dec 2020 17:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59530.104497; Mon, 28 Dec 2020 17:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwRN-0008CK-Pk; Mon, 28 Dec 2020 17:36:17 +0000
Received: by outflank-mailman (input) for mailman id 59530;
 Mon, 28 Dec 2020 17:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktwRL-0008C9-PU
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 17:36:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22b03f45-0979-4986-a0cb-5a6d1e84551d;
 Mon, 28 Dec 2020 17:36:13 +0000 (UTC)
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
X-Inumbo-ID: 22b03f45-0979-4986-a0cb-5a6d1e84551d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609176973;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8uOgiiXTTvrza3X2P18o8bGzIV/qPqjBRyMNDzFvzsQ=;
  b=E/+buRQqXfothbsTW+mF1KdRhjUUDFkmXrze5Po0X+gJzJTYbFbDyssK
   GqNMEn2WhuhoWpj2riLKRvhdlzX6rIsqr738u+HitVgXFkdmL0r0l6z6E
   MZVAA045qaHqut37rHqLDLFqlGztk0TsDXy+4SNPhlJq3sjhJIgsyiCwT
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iZZMybsebBGpYj3it6sFUzmyytv5jgcV71DuVfLw4rV1tSW9qF6zCtQtx5aeGsj68OVa8jNfcQ
 sfHx3VTlYeuVjV9IskrRqXWjArzQWuqetjYomgKPevf3ZT462oQ8SgSonzN//ZpX1yhASsLWrj
 CqjPvzq0GAr6GUw3iEq21q8EhlKKR7AwPKs2fkK9ujC69mly643QBLskkEy5bI15zJ9hHuZxIs
 FDiUbeFgmuEFVAMk9+orbodwPSXwJ0csDWPEmhai+Y4D63d4sbn3UB9215U+4giAqL2UND7RfM
 QyU=
X-SBRS: 5.2
X-MesageID: 34276070
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34276070"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buTpgg4ljyIp9fQa9MgR+Ouj4eDut1LQw8ZeysLI4uRgIqNnN5pB4tQct5gDCuCH+tBGQyYXRTfuyPfo+x4xbD5UlLUvd+rbRsDUfrpKN1iCvoQtoXAEY4bKBQWYDwvxtpbrCdPrBJvQkWTsLEdzNDpTPYPLB/+Yji5AriuDfNXv1I/X5nTXh06Bu3x8Fdy7ZqnlQ5ljCqBy2V24Ye9q2hjsWwOnPvCCBnHDUyHppAC0Isd8NNECQNZfJDt3G5jjw5pO8dXoPcQPy/sk0xK/D5bFq6Dqth4s80PbIP+HDuhHhsJAg08IrhGFnYGiMSwLDXTiHroueH8FgwVoBuNr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB5KzQ/YTpz1EEGjQeYGZ8TPCf6ZJ/WJbLG95HlIKHo=;
 b=BsV82hAiE5L/44Cexb1b09N3YP+eZSvsgnVDA+GqYy2cp0KL0cLWUN1VDXkQMPFI11ARHzqMWl4jCYTQrsYxkWSUJxqZnn4o3DH3iVyQw0nCxhPkgTBOWRCDTWB0IZg5ilxTJEI2eMh6IFUalcsXYepOo7wdv6pDrCwDZka1hOw6u6hgfVG0r0t/+QfoN0yBQc8mInn5EIdOm1DiP1kYN7mgq/HZUbdqcDMbKmeIzGSZF7CmMIBNG4H5fzWm/InMGOEHNyRKjRYmbuk+BeaSkEdT1iDv/Ph6FHWf+I4GQn8qX221osWsdFtctTe+vRB3gl0Qbv5Q8AOZsccIcf/g5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB5KzQ/YTpz1EEGjQeYGZ8TPCf6ZJ/WJbLG95HlIKHo=;
 b=uquZC7wQDphFsVrtfG1/eJ22Cm5O69kySmWK7WjmsXqpo4OiT39Xa6JhHumzIBjwitPjtQxCSjyRvwk/36UASN03GLR0E0WIN+INSLqsbiNCkCDkvbIqTOzdS3umewxs8Mc4pCKE/zl1uE4148r25H3xlHJDAmDBYTm9PC2z6Gg=
Date: Mon, 28 Dec 2020 18:36:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/5] x86/vPCI: check address in vpci_msi_update()
Message-ID: <20201228173604.lggfeus2m7jsvekr@Air-de-Roger>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <c5bec6bd-b3cb-dc4c-0435-5154956cc4dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5bec6bd-b3cb-dc4c-0435-5154956cc4dd@suse.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc8ed423-773f-467f-30ce-08d8ab5710b9
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB30664E7082DB2B59059570FF8FD90@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0kPkQbzqJ4a9WK3aYf9s5O6nT9cYuOhQptw9+c/ZFArv7Q3sO83sFTe1WTnp6bNVRa3oXjWaT65aYsGhTNQndTJkSY5hEOYxsiOst9sOx87xHbTtLRhB12dzKWF986EulNdFOOOsUXmFBnL/GkSy48wF3otr9+7mhlyN1ngYoPw++Is/PzZg0w1dGyljOUU0xZwcBD/w4m2RQ7M9EEdFQY9gedV/0gPzrccXvFL1lJQ1/do/AiQ1MRemGFALqYYxsnBmePU6M3YhZU3xWOZbJDiqY7Fg7m/NhDjNrWHEBwAcGBXTVqcoCX5RxUCVru423Iq2M5ZCW8nHZotUH8oTw02FKvycdztBqT6j+JHsKQ3LTWvh+nm8Bfx2tQ2VB3HgEgaAmolLnxV9HKIPbc33g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(33716001)(66556008)(5660300002)(316002)(6916009)(2906002)(6486002)(8676002)(83380400001)(9686003)(186003)(8936002)(54906003)(26005)(6496006)(4326008)(86362001)(956004)(16526019)(4744005)(1076003)(6666004)(478600001)(85182001)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qzk1QkQrOVNreXRiaHVPaGhpaFFPWkxZVGh1SnlxeFhHNEJSM25lWHRETFBx?=
 =?utf-8?B?cHQ3a1NiSHJIV1BBbGdCMVA3YWVLc2x3V3prZjVsYllCc0ptbE9wVUZKRzN5?=
 =?utf-8?B?Z2pIcnB0MnZmamJ5dDB5Q0dKcVZKcjdzWTRBYzJ5WTJDSXpoVFdRTTRGVjZ0?=
 =?utf-8?B?MVBxVjZVQWNpUmw0ZFNEMUhIbWF4MnB6Q053SGp0akMrQkNSVHVOVDFxY05s?=
 =?utf-8?B?c0hjZFFPakFPc2RGdTBDU1JXbjdUM0ZlbHVoR05uejk5TG5uTGNtQWVsZDhB?=
 =?utf-8?B?VzhWVnpFZlNmSE50cFZjTlRJUFlDT0Z0NTN5REg0c3NMVFFFUDRuRE9hQTFa?=
 =?utf-8?B?a2JOSDBnNUdnMzVGYTYrM0tRcWVnVTYzQWNLVVNGMTBvTWl0aFRqUkx5K3VN?=
 =?utf-8?B?RTRQZUsvUjk5cFRVQXQ0R0xGZkR6ZmlaVTdHclNtSmpTNXhDUlBQWi94c0hR?=
 =?utf-8?B?WFhodGxHa2E2TDZLdHc4RmpHNkpxSVdZZHJUTXBMcHA4Z25MeStWdCtFVUdT?=
 =?utf-8?B?aURCL0ZYdGhjbVM3T3FzTUlPd202U2dMajRVMU9CQlFEYWx6aVhRZytzeUlL?=
 =?utf-8?B?NWpOV3lFTmFOcVRJYW8yTDAxMHV6aGRGYXZRY2kyUkdQcFpqWGNYZGdUcER1?=
 =?utf-8?B?c0VSMWJQZnk5cDJlVG4wSVVyUTVrak9lTDhWMGJjalhKaDVBZEhGS00wSDNq?=
 =?utf-8?B?eU5rVGs3YlZpc0hDUWsyV0lEanBkQy9kZjU0STl1Q2ZkaFZTdzVkTTJGYi9h?=
 =?utf-8?B?d2lEaWFZTXpRNzhEbDgzcDJMenNQdkZVdTJSVHRnZDJzQkgxaDNBK24ydlRY?=
 =?utf-8?B?ZVFLOXl5a25uZ1IxOVI3TUZSN2VlTmVycEN0TG55ZWJPS0QrdUplM0d3MC90?=
 =?utf-8?B?c2twcEZTQ2hyQWN5WXhsY2paK0JjVnVOQkhPcjRpaUhwN2htRk4xdVM2U1Zn?=
 =?utf-8?B?b1I5N3h4RlJqMGg1QXBDR0luQXJhcGh5bmFWdHRxOTVaRjNVb3ljcjVmTUt2?=
 =?utf-8?B?TnhmaWN1eDRUWWwyVkJyL05QcXIwVlNWbThWMzdMOUxrWG1wMkU1eHUxdW8r?=
 =?utf-8?B?cWxDMDhGKzNHRjN0QlA3R1JhdkZRUkQzdlh3Ym1TUGRDT1Fha2dxYXpjSXhB?=
 =?utf-8?B?NDA1c2pmQU95ZjIzM0xCc0txVU5MYWppT0cwelptV2dpU0IvMEFkVWMyMjJi?=
 =?utf-8?B?bUg4U3RubGFMcTg3cjdkRFpSSGs2SzM3NlVORU9XV3hIaFlPZGh5YnZpcFNt?=
 =?utf-8?B?a0FDNkc2QjBHNmdXcTlGSkR0ZnFLQ0N0L2labjBxL2lSOXFvQUhQeVdUS0tW?=
 =?utf-8?Q?zv5/Jxr+ZgrD+leSDAe2XuejCUZhRhheQ/?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 17:36:10.3464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8ed423-773f-467f-30ce-08d8ab5710b9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHMR0ka0jpGu40lR7R/YETPvVXBJTndpHHXLxq0QMwWDk7PMuKEkyuFcF0U0sRcKlQbBv5XGBB1RL3Bobf/ziA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

On Mon, Dec 07, 2020 at 11:37:22AM +0100, Jan Beulich wrote:
> If the upper address bits don't match the interrupt delivery address
> space window, entirely different behavior would need to be implemented.
> Refuse such requests for the time being.
> 
> Replace adjacent hard tabs while introducing MSI_ADDR_BASE_MASK.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

