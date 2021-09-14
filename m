Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96240AB76
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 12:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186394.335125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ5QK-0001tW-0B; Tue, 14 Sep 2021 10:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186394.335125; Tue, 14 Sep 2021 10:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ5QJ-0001r6-T6; Tue, 14 Sep 2021 10:12:19 +0000
Received: by outflank-mailman (input) for mailman id 186394;
 Tue, 14 Sep 2021 10:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ5QJ-0001r0-AP
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 10:12:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5d31518-03ec-4631-9705-0a1817a4bd98;
 Tue, 14 Sep 2021 10:12:18 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-VW3AQTw4M9ihvmoOn2TSnw-1; Tue, 14 Sep 2021 12:12:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 10:12:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:12:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:12:13 +0000
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
X-Inumbo-ID: a5d31518-03ec-4631-9705-0a1817a4bd98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631614337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWRvUAxYIVKLmt3Hj6rF4ecxp2VuTUJBR8ODHqBGIPE=;
	b=VOhKnUc+emKMNVuXv5jE8hXhi4OMXSwi3CMwFR7WLNEXh260ABkahkR0yFC07nNs0Bb20D
	GBA1RNlBm57cBClNHtu8LUf7bWvdP4oAJZv+kEDa/KV9gGKvQzIkPQj2NlqhL4S+RVzZsy
	8/1wKQ+D7GXJwvgNwogCg4v1qin8x/c=
X-MC-Unique: VW3AQTw4M9ihvmoOn2TSnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGGtxP4zvItdyzcIOrIYSts2nMULKasb6YJLUOyKmDzwzpcVVG1ILwq0QytFjjG4oKOU1CgFHrdx9SCDoNGXIpT0jB/AUe5LP26f+bQRXeuWE7QEufvQ8235Sz+wbB1b4v+cILpdhb4Ww6m2vWfQwObcX67iNjruOcawhsK+9630RUIhYe32h89RzQhG40zjGVN7AUMKK3UzMj6f9ilsv5+d1Q2ZIVA9JKUamtGR87QOgDbWzUmMvZf4T0PglmL2PcHMKPJ3YhGo5/vX1+EsPnMlEAk0ns7530w0k2lc7p9ECisMHYA2VgTqjuvzeE0eRgejSGQR4rxy1lcp1AaCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ByWGbETjwnvuTkWHHaztDcj1odn98swWY3HS7XHbdmg=;
 b=QYgUEZH/gCFaVTmMhVGvCASuZDfTnpngQWvXeIGjedh+E5dbdRE0ts/uNVK45s9XJqSI6h4GjeAup9jKyEjVJha0MlcjGvDphHMJmIEnmrwmGehIp6XTN7y/K+b4GQDZQxaGgOwMAN1AesrnJ+HcSxuhDqAyDybrqKbOwT1NXciY2L3Kdu718WkbLblYMXnNDLX8jqbeMLzdaHRC/jqhiZ2YBbMLT7WpSTRQ4U6EBJ+WAhwtxkRzeOWczaupHg9tMkRDxU44ejEUGxUHqW4gC5TUxaehvongLGk6cVc3V2S7NlbtjLBvGFamGlwJ5WZNkZ8hNinbUj2lq5C6gfgwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
Date: Tue, 14 Sep 2021 12:12:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1741f2ff-b045-4ddc-129d-08d977681f53
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333407FB17A95846FA8DC48B3DA9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q+q10zAIFVyNALzLimufK+8uVwVgKrezRZD6iTFjC4VZUl8UL2y1udlTqDL2Psxo32jPT36uAjkMiTW4sSAM3CYigAYdnn6TBVyuf6Umm/Z39Y/RfThp5MJkI2UmNKQF8+XDF0SkGTefc8eZayB8mJ8m5V9xfLNI1nvvSfLt4v2s/9j/n9t5senxXuSRAT3VZiPzLYR9G/E+mhRio395ccMoCHw4Jr2nDCC7QhaQMG+jmrEhRa/ZUaTXlFmQPjQCPl/JM9cw39opwu13VKs7fRTHoEKqIam4H+ZM5ZoZhSFWS2Jb78yYJTZ/D+X5smVmx0IWj0ByMcwubrOnisEKiZcYnkiBDxsI2N2heyMgOXfwMC0s8gPiJHx5zYH+ZP11aKc8d5rBflOrZfAkrf74xVCATC4cGT7/C6GIMzVgIqnE8461Vl/qOpj2r4iUX5son6QU2+Lso62It3KSX5x7RjdNqJfB1Qv7du0ghklHuFVP+LWZJ0/YcIbMaDlVLTZEJAFDWVkJW6OqozfPpOeZTbcnUPlQDaM5pcELi1zUxLzq75J8qm64AEbIYUSua8rNTxP3pi5/HJS7aci3x6pJGJdZLomuOH0berpzpgP/rVejByhi2t8NOzV3d/8FyfllfjFB+zSSRZlG15hhCENr/SJ0U00xDaPMGu8RlQRW0uzKrgk9AHwEYetAc04tkkZXknooopAOYV+0OKC/K+awKgB8bay0kOb5iQ+8mtHyD1TEPXbiqVMcl4twk0Y573M+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(396003)(346002)(366004)(478600001)(6916009)(2906002)(36756003)(66946007)(5660300002)(16576012)(316002)(38100700002)(6486002)(15650500001)(66556008)(956004)(66476007)(86362001)(4326008)(186003)(2616005)(31686004)(26005)(8676002)(8936002)(53546011)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/5JybJXbeRMq+d8d70wbLDN4/fQHYdqandxvH7b+T0HiLCS852R6PkYAmhrq?=
 =?us-ascii?Q?n1XP54zqCAvjNfIRCXbvoD4iozH/G7xux3kfsrJCwurDefrf6PHQCHrrf7BP?=
 =?us-ascii?Q?IRU+086ZBoWZOTD4X92KxFdPwz1n8DDh7HyYmDXLwSJjb9SSANevi2lD2Ntk?=
 =?us-ascii?Q?rDIVKITxXpOIgC5NT3sYYd4xzS2+LxWrUp6kVq+7ZEpa4Qe2HKzndkJthTkP?=
 =?us-ascii?Q?fJZF5PFKBfhzXUVNKZsxP+534R3W7cuRryxbxWDmwnOHtVXifAMtghD1RUOA?=
 =?us-ascii?Q?MrxxHb4Vn0adM77xey33p+Eq+xk8xoH3G3eJhVd5Pr4lXYS+Gh8Vi1mgjV5Z?=
 =?us-ascii?Q?pOornRDKcvtsE/zi4OdBm/+Yz1OqfAhCRN659bwg34LqcNa/fzB31II+Q5A3?=
 =?us-ascii?Q?FioqtN+V9x8Eth3ZiBp2uS7Pd/VtOmlko9GW4VowFmxw7H3HSjD7vFyzVCc7?=
 =?us-ascii?Q?Lj6jTz33X4bLqIt21EnPSDfsSEwUZl9oVFFHKjMqFmKDdoGSSaTxDsdzI2BP?=
 =?us-ascii?Q?dcx66MeWPRjAzNwAqa2up6/dCecggvHduETx7fnnJbBHUItY/T4LVWdhgcBn?=
 =?us-ascii?Q?kWEyK8wbl336jg7/ay1g2jDgqBzmJWBEGIrZ1IN9gktB9RJhQh2VEd7u3Mn9?=
 =?us-ascii?Q?pBzkN/RdRRIFP0JKmEU0uSPx9lTa4pBHoD+ckY+Qzl/kK6T1Jh3g+nTClzBk?=
 =?us-ascii?Q?cCVoEW+lyi6QyeBRel3gWQwVnNyHrt3O4wwEIMIlPTjr/kH5ltFUcHnBNV5i?=
 =?us-ascii?Q?7dHE4xgzFzcA1i1/VKjN6f61dFvATkiSLKYpAUDRKF703wZHMm1eHN5jnq3v?=
 =?us-ascii?Q?LKUFonPztLMMQ61KVLWnf4qVh5nkawtUVvvYPm4tbnz128VpO5uB1gEgr+um?=
 =?us-ascii?Q?8RbqhVsxaBg41tYxYvwpgxI+fQOsO/qLVnZtqZBSKDswCaDlyhSpDTrIFE19?=
 =?us-ascii?Q?VjG1E/itHHqjKxUA3oKRMtcBJWFKk6PZDjVxjqms0bkvNCD8Y/mOUEwOn3u0?=
 =?us-ascii?Q?CnmY7ePrIJh91c3Wy2zNEsovzuqWqmHOTFQCzdENjhig0+ReVSjmMgWaE/a0?=
 =?us-ascii?Q?G8d8q6skEA3mWhWhJsYpO6S+yZao17kfZQL4smJOA69kGZsAzqZOPbXLMLON?=
 =?us-ascii?Q?WZxOeuI/JgSdLQIOFxTVDR9JCPVr+f4WhzVm5o5NuMQl42QW+lep11NeY0pg?=
 =?us-ascii?Q?wmHlbT4VATay8+hT5j3kP6y7MPl7TV/3xZ8I1s4HYwVIUSRyKssxsTmOYeYd?=
 =?us-ascii?Q?zCo+VlIPL4WmiwiQOo19KoE+fWF8BKtOiw+gt1CfEsJ/rJKWltZAux+/H7rL?=
 =?us-ascii?Q?5ziiCzdccEr2MaLRjaV6Q+Ii?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1741f2ff-b045-4ddc-129d-08d977681f53
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:12:13.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri9BO19Fz4Affk9Lut/YYDCPYd88DlP+KsjlqxV0FFGg3hY5/D0s/7nC1q5cpDLSnmSeVSQ4xUN44YzhmNcbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 14.09.2021 12:00, Roger Pau Monn=C3=A9 wrote:
> On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>> console) are associated with DomXEN, not Dom0. This means that while
>> looking for overlapping BARs such devices cannot be found on Dom0's
>> list of devices; DomXEN's list also needs to be scanned.
>=20
> Thanks for looking into this, I certainly didn't take hidden devices
> into account for vPCI dom0.
>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>>      would make the diff difficult to read. At this point I'd merely
>>      like to gather input towards possible better approaches to solve
>>      the issue (not the least because quite possibly there are further
>>      places needing changing).
>=20
> I have a couple of questions, AFAICT we currently hide the serial
> console and/or the VGA adapter if it's in use by Xen.
>=20
> I wonder whether we need to add vPCI handlers for those:
> setup_one_hwdom_device will attempt to add vPCI handlers to the hidden
> device because of the temporary override of pdev->domain done in
> _setup_hwdom_pci_devices, but I think that for hidden devices we
> shouldn't add vPCI handlers. We should instead block PCI config space
> access from dom0 to the device so that it doesn't mess with Xen usage.

The answer to this follows (I think) from the one below.

> It's also not clear why does Xen want to have those hidden devices
> partly controlled by dom0, as it would seem to me that dom0 interfering
> with hidden devices in use by Xen can only lead to trouble.

Dom0 can't interfere as long as it can only read from the device.
Restricting accesses to reads is one of the purposes of "hiding"
(the other is to make it impossible to assign these to a DomU). Not
allowing Dom0 to read from such devices would lead to wrong PCI
device discovery - some devices would be missing (which may or may
not be merely a cosmetic issue). If the missing device is a multi-
function one at function 0, other devices in the same slot may also
not be found by Dom0 (depending on whether it looks at non-zero
function numbers in this case).

Jan


