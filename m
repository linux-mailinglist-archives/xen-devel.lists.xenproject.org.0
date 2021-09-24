Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF04171A2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 14:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195357.348025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTkA7-0005wJ-88; Fri, 24 Sep 2021 12:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195357.348025; Fri, 24 Sep 2021 12:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTkA7-0005uW-4n; Fri, 24 Sep 2021 12:18:43 +0000
Received: by outflank-mailman (input) for mailman id 195357;
 Fri, 24 Sep 2021 12:18:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTkA4-0005uQ-Vq
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 12:18:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e866ae-532c-482c-a1e1-67ac0b533209;
 Fri, 24 Sep 2021 12:18:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-hgUXlle2P_CVRsO8_m7p1A-1; Fri, 24 Sep 2021 14:18:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 12:18:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 12:18:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:101:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 12:18:35 +0000
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
X-Inumbo-ID: 70e866ae-532c-482c-a1e1-67ac0b533209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632485919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4svGse+imCW3XeBYeXhFLL5vLox02qw2i6TxB/lCOk=;
	b=L1vDqf6iVlMRqdbtr1iWxLQ03C/HfmnohbvSXZvDbezf9/aklpQ9V9hAob4rro+ZXvu1OD
	anmQNszLvvNwo5d6cC//KIftnSg3ZuP40WQ73EqG8B/g/ZTBNERUdaptHESK2TVASb4SG0
	yeQlRFWZu1jxzRrzVRHIcJ2Bjyln65o=
X-MC-Unique: hgUXlle2P_CVRsO8_m7p1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ4KGtpoVPVH1m7pem8BsA0O7iEkwqwdarLRBwPpJ3jq6kcK7GAZM9tV30saBe8lRymZD/8jAvYhUmwESvcNN2IlRWvHu2QDZlPpuJAf3VwxSN/YPmKwDVfDQ++Fb4gMgwHdFJvZ+/4P7oTFsayUJpKH51ahI5/EGa2PHzx1AnIabvOpjdB15pMkxUn7o++bKjSui0MqH7yxgvw4oBezMyRElIYq7T+boIv/Peo7W0wDaK0Yidgm0pyWo23U3eFB1vP3zgOQaWM0YaCk69c61ndWyy/hZYy1uPhVyZ0031/Q3fokEbP17fMwSCnmCS+YmaIztOTbdQOFvh1f+V33/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nU9oC7z5BXKFkeO02V59+X3J20q93nT+VQB78TQv6mg=;
 b=OHS8bvKC8HYIRUbaidkdtcY0fX3OoBfsB6dpI9Yjy0p6exg6D2RbJoTA9FSOQ43ccaR+kC2VjHyJOIfs0JckvoLVQxmT6jnwI3Jw8lAmEC9CbBqCY/Cd5orARTTkuUW2nahRXJpoS+zcOtnLwc8pDzrBnDVuh5GJ97hPkJSHwxGK2SXRlmN8a7GOz2nzZQLk6JK4TncqUVY/9/l+O24yBTgb9vxxbPZvqJSa49EOEQDxCUuYTcezbbmgVz97r+61OfpcKR+uqzyxNgUeN7/9Xtw4+3i+lWEdHkPgxVz/qrfsRSs5Xh0k1K6EbH846lA9UaWzjtPFhWcQlb7uz4dGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 3/9] x86/PVH: permit more physdevop-s to be used by
 Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <78c84053-3d79-b36d-be03-08b3b3a3d26c@suse.com>
 <YUs8Jq4mei9+DDCU@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <986cba30-f920-854a-2ac7-70d3e16de5ab@suse.com>
Date: Fri, 24 Sep 2021 14:18:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUs8Jq4mei9+DDCU@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2PR09CA0020.eurprd09.prod.outlook.com
 (2603:10a6:101:16::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a96b52a-3d85-4695-f579-08d97f556ecf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26060C9412569283901EB940B3A49@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hR/dG76/AB+ntvhlfdSSy6EIZboiDmUN0/nad8HvKhHwqMgLMQ7Egpi//ApAh5EIwItDae1T/zBbmwRPeKDnlLGyVtJL0Z2i6Bc/kuoFslGxo9FiehstM0iP+/3ZcBLVdf0+Z3jHGVa9XT5ynGr/jQwgiK10do4ksZ8oHNtf4XFOLLWrm+T3Je6yHjnAH4RKIzhpEKk26eOZocRyixiR10Jdjc72mn82W7QL5Lu3As7NZVPG+VAUGTwFHgN/nnyAvlFWs+P2Mnuu3O1gVA9lE/PinRrlsUwcxN0w8OzT19t5tvU8HvgYG0C+CB61Xn0+Yx9cl9+Yw/3id2ulJ0obkELNCer1Dx94JhrG5ZkPY4qDGInz8UlPHlCB24dLAW1TZSTucRKgArSf203Veit6ueuh8GixDPVE7aMtIeWSeMxqZ+vSEvZSDdRwMS1SK+LdVjZafXYdy4rpCqlhwFMPGUEwPClw63Jlug9q6CIPIrbaJKeA7roLlgXugLKnqmrkcZWWOoCUiYqGhHfYim3SnKkxvptSdG+QdAneAwrZJJeTbcIOVYE8pMxS2WANTRMXtPXjlaAuMF2IE5kTZtvlbYgJKLU0oSCxqw4RTKU6IdFoIbJY6dUs5QYVNPJVAdOp/LWAGou7KyoA8eVclr5lZqwM1DzClB1o6bU1qTILHw7YxH1rHTdLo17DgpMAm81ovC9+bXHyzsTds9K9AdsRP2C+Or2jwAOxcvK7LQveuSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66946007)(36756003)(5660300002)(2906002)(4326008)(83380400001)(316002)(31686004)(16576012)(53546011)(54906003)(66556008)(66476007)(186003)(6486002)(8676002)(86362001)(31696002)(2616005)(508600001)(6916009)(956004)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LzbkYhB4pIkwIuKRu/gyP6ceajrgdlAXcoNUAZfT9g6TZvmu7xif37qU82uD?=
 =?us-ascii?Q?LZWEBH3m4osRtuI+E/iyORQn8c/FTNMpLgld4owZLfBmS6L1SYtq5rdKlWcH?=
 =?us-ascii?Q?0RuqIWBcnevV1jrhqdGUwvOsk1Kg9CJOuisS5QB9AeNIyIGxPH4eRwY4hiG9?=
 =?us-ascii?Q?CFUi2FpdMSkJohEIDCMCNYGkqxMimS4MSENeUs/500rfQ+fCGzPUl8kNxIHn?=
 =?us-ascii?Q?Tb8SErkVj4t5C1mgN4Ei7Jju1BOEDorn/yrxKPKkf/T3Iv+fR8VC1YlY/gzK?=
 =?us-ascii?Q?WIowlUCJ2Qm+oIVYVU+tRcnZ3yDtjPeMpHJoaN/dG3Tl64QGST8BEU+Qzh9B?=
 =?us-ascii?Q?alBghjE3xTqoAZ4GoMuZW3ZfPi7Ypw4zzhKqLNMntqZKY4cF+XCc/HMc2lIV?=
 =?us-ascii?Q?0YtucLmUhqYeGBFTo99Ta11tTtMOjzlaeJeltQ6v86A4U7CA7CsIcwE5O8n8?=
 =?us-ascii?Q?Lf0HjnpciN0RlvkUs3WT6M2lAKZv8EtxSfECHywb9PpZI9HDZtGaTODFfMu0?=
 =?us-ascii?Q?2WDuqOI+XQ09ah4KAjaot69GTnpqIztBBr6VFTMT7q053l5IxnnzPH1/tu2p?=
 =?us-ascii?Q?q31YmUw+dCMxLzYoz+z9iBlB7y6eQxpvDgisvRBKS1UDVJQhP7yfy1Il9P8x?=
 =?us-ascii?Q?9HcbGo6rduMhR92A7PMfOBfDlv+5fabw0Hy7h9wQNgjfPPHcuK8cAuQdRC+T?=
 =?us-ascii?Q?I5PNclrCTu3QHNTd5NFFojVYgg/z2ycrjA/5/xy0rHjDw/2StXNn6nFiUYTq?=
 =?us-ascii?Q?fieKOj/dCspUJRikq1ggQwtHhkv8z+Rrv0LTT1gUW5hHuts1uovLXIk+D+r0?=
 =?us-ascii?Q?wseYY47OtWn5uxhwX+gaHZrFLMHbvvMPgB5pBUUI6UPMD9rDotY2Fka/hnvM?=
 =?us-ascii?Q?9WrEJE77el/e2NDu6OPXvfshP65gSRHDKEvuuA1qzux0BOey7ImSyAcy5DVQ?=
 =?us-ascii?Q?lYcpHmlJwNxGcpriqe8gbwM7Z0B0BQm/d75XaVyf65EOhULPbcb68JcLgNwk?=
 =?us-ascii?Q?WrSu4fqilZKd6rVO8Ik6+1ltrjYd38wajnu2nqQ+ugXlUgoBNW144myic7SU?=
 =?us-ascii?Q?lAWJewgD3OTUJLPnPwfdp5bCqDTo+RkU2pc4a5PC7kKJbA03UQc8CFBXo6Nt?=
 =?us-ascii?Q?P6AZSpVIEFL1SXznYtCKTGTdZ+X0PvknbB0RvKjt4Esmu//YlZ/gVYU3ZNo6?=
 =?us-ascii?Q?LC7PCAA0n+RGQLlBEa9SzvLC+mKSmtlNBNPJWe6NaDCkjscvkAn7XLpM+yoK?=
 =?us-ascii?Q?xxguRmNtpAQoA/o7ttRy/b2m55kYPcSiMkMm3al4TJ0+LpbjZwwbHwDsflGx?=
 =?us-ascii?Q?d+gj6WOwEWHxlrWC/J68UEW+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a96b52a-3d85-4695-f579-08d97f556ecf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 12:18:35.8925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyZN+C+Zvtjy8NW7tBdcirT7E/0b+f6daMhINnJrsIfg7wcegTCtpvdb+UFK3WvqxeUPuYcvM+39M1QZ4lfnLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 22.09.2021 16:22, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:17:37AM +0200, Jan Beulich wrote:
>> Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
>> running in. Permit further PCI related ones (only their modern forms).
>> Also include the USB2 debug port operation at this occasion.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'm uncertain about the has_vpci() part of the check: I would think
>> is_hardware_domain() is both sufficient and concise. Without vPCI a PVH
>> Dom0 won't see any PCI devices in the first place (and hence would
>> effectively be non-functioning). Dropping this would in particular make
>> PHYSDEVOP_dbgp_op better fit in the mix.
>> ---
>> v3: New.
>>
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -94,6 +94,12 @@ static long hvm_physdev_op(int cmd, XEN_
>>          break;
>> =20
>>      case PHYSDEVOP_pci_mmcfg_reserved:
>> +    case PHYSDEVOP_pci_device_add:
>> +    case PHYSDEVOP_pci_device_remove:
>> +    case PHYSDEVOP_restore_msi_ext:
>=20
> Hm, I'm slightly unsure we need the restore operation. Wouldn't it be
> better to just reset all device state on suspend and then let dom0
> restore it's state as it does on native?

Hmm - Linux (even after my patch separating XEN_DOM0 from XEN_PV)
only issues this call when running in PV mode, so from that
perspective leaving it out would be okay. (Otherwise, i.e. if we
decide to permit its use, I guess we would better also permit
PHYSDEVOP_restore_msi. Somehow I had managed to not spot that.)
However, ...

> Maybe there's some wrinkle that prevents that from working properly.

... Xen might be using MSI for the serial console, and I'm not sure
this interrupt would get properly re-setup.

>> +    case PHYSDEVOP_dbgp_op:
>> +    case PHYSDEVOP_prepare_msix:
>> +    case PHYSDEVOP_release_msix:
>=20
> Albeit I think those two operations won't strictly conflict with vPCI
> usage (as they require no MSIX entries to be activ) I still wonder
> whether we will end up needing them on a PVH dom0. They are used by
> pciback and it's not yet clear how we will end up using pciback on a
> PVH dom0, hence I would prefer if we could leave them out until
> strictly required.

Even without a clear plan towards pciback, do you have any idea how
their function could sensibly be replaced in the PVH case? If there
is at least a rough idea, I'd be fine leaving them out here.

Jan


