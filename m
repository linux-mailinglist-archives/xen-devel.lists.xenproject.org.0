Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AC3FC7C2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175679.319944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3NF-0003fO-2d; Tue, 31 Aug 2021 13:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175679.319944; Tue, 31 Aug 2021 13:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3NE-0003cI-Ve; Tue, 31 Aug 2021 13:00:20 +0000
Received: by outflank-mailman (input) for mailman id 175679;
 Tue, 31 Aug 2021 13:00:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3ND-0003cC-Va
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:00:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 643a2fe8-0a5b-11ec-ad31-12813bfff9fa;
 Tue, 31 Aug 2021 13:00:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-GgCU3FXzNfqh-CwksFTeAg-1; Tue, 31 Aug 2021 15:00:16 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 13:00:15 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:00:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0180.eurprd02.prod.outlook.com (2603:10a6:20b:28e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Tue, 31 Aug 2021 13:00:14 +0000
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
X-Inumbo-ID: 643a2fe8-0a5b-11ec-ad31-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630414818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xau+888nki9nF4MdxiGoeb39e6wjiY4uHlMMMGW+7I4=;
	b=MzynJ8DUAdIRDHmd3GufKpqT99ahugPZ1ofSCT256v/kBFrFpUa1TCSawBEfReydjTNanp
	vMWAfacj9oHppBq9LJcMmt9aMvcwk3Edp7F1B/qCwfWDMvm87a/fUl/zgeA4bJ/oUwsgpJ
	JQyfiEDHK4oDHNccySYhIqe9nveHYtg=
X-MC-Unique: GgCU3FXzNfqh-CwksFTeAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naTwdCq6OIWjs5jIAJo88XwWN+0QYMVqVZXgtu7BYwUEczrs+i/M77widpv5MwWtkMD7XmvMtM7JstH6Q0HxORIm1+I6jjMfWYC1VEs6RuE3R3H0bFiNq6hPUgrNb6E4Y9hqDXX2GhemfLL2lGEpEm7J5UzOriMs0ArEeS855bgeoA59M/y3jvNRNUQggMOj0ARF/AYHgg8pML9uOdZ51sB56a+884ZzNe/r7yYbSQ5pr/ABB1316VCr4VmhuFNydvYFcFgTxWy1ULFDOSaX1+sIjoILOC4gQpiFR8Fs9sTmYZuFl4DCoJxlh4AnH6XJa8xriQj8C/u6ONIHLUe0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gBxnBGOD3fmp31ohyDZhmilBVF3HrbgIjJ+gG/L4Eyk=;
 b=RbVzuq7+akYMhphVAyX1xM3EqQqUZGgBGqe5L8f5oGwaSoANhNZt5O5Oi4UrkWqC+BEyPntysYNi/4C+iWvMT79ai//HEUiLZcQ5DorJxN67WIUq1l/JnPAJKTsB16vKVeDfCq/noke7mvLwYy1vShxxE2sdXETlHipxaczCCTCsT4FDer/RPCRNSaNyVo8R2H8EzY4fuzHGu50X22NbFVoCpZP/EW4Paq/0Hynqh3NKjw7q0MHlQ8L0FJrZPxjj2cN9P3WVUM5JvYZFei1qpACm6kATysgRTxtSzp2wQMByip/Gdx2t+G+Ew4DKDXJTA/Om+eW8bbz0B20iM7lVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
 <0d787e5d-9232-20ba-bb9f-6b14a15d9e64@suse.com>
 <8A59CEFF-6910-43F8-9F4B-EC923ADA80F9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd8334af-afc1-9207-3b17-b0f271a6bb36@suse.com>
Date: Tue, 31 Aug 2021 15:00:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8A59CEFF-6910-43F8-9F4B-EC923ADA80F9@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0180.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::17) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fc78f3d-fd09-4896-a2ba-08d96c7f4670
X-MS-TrafficTypeDiagnostic: AM8PR04MB7969:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7969BB3688F44CE04CB1904EB3CC9@AM8PR04MB7969.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oi0qnj7cdRZS8OBsBjKK5e7chRLe708D4nBmwuTZA91KVygbMQKm++wm3nxrtwkJWKkcvJ6gJpL9TuGBDhtDCj/g4MyX3GZfZ7WusmZL5Gl+5BGD1EFRX6JP0XFSCwAHqtPcD5Rn6goGYRkb7VWFVDZ2mstKLD92lOg1dYomrJ+/JvWqqSwOIMg5KJ2IYV1to2BLJW/O/n5r+M4/kFIytmh/7CObUXRue8NbewKjixuC97vQQbxBMBeWGDYJWIEeXpjF1A+HWp3jxM0/vdpXxN1NIF6tkJUJyM5CGJnU0Ee3i7wijo4TzaH3+TRYFEcs9ijrlWSXHg6qW3IrryBadxuKsDL00q7tCVy5byMTHvf8cUpJmU1Jc7w2haYfXaZh1WAphdhKy3CwqRk/LESl0A/lPr1Cq3qf6GcMNxtWlCQ4bkrnN2yXPQ5nuishx/bksX/LqGLqCPg3JdQrByfyQhQHxKYSEQAJzNEuPTU7oWih9QO9B3jXoGjuKl7a79bLrU+B3bUaV7P96HiRd9uxm0yHSDT9utbxLwfbx2RFzHZc2U7wSKZhE3cA/ODF9AnbZPeHc9faquJJW5JRWjhidFwyXnxv+LxLlZzwxCHltrfyNFtf8B1JkVwWsAsz7GR/xn9obNGZzJQFwEtwoDdgOKrEDqVDedJdrFJxV4xasmpQ53BxrugNjnB2LNeR+UwANflwbTOFmOPaTEOzdGWmCly3igLD4S/mr6Z5Mg6ZxRGiHjLgLZEGSChldozou3J/DPKHCFiAAMfZxdvp0DB4QsvYlJng9rLnywVR2cSCtUq/cefC89ynM2z8kl8OjsRaNWjtINYNa6+GzHapV5EuJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(7416002)(8676002)(83380400001)(86362001)(31696002)(5660300002)(8936002)(2906002)(316002)(16576012)(54906003)(6486002)(4326008)(6916009)(2616005)(956004)(66946007)(66556008)(36756003)(31686004)(186003)(53546011)(66476007)(478600001)(26005)(38100700002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3FtBSrB6khV2okqR6AJFmEwh7VK2QcbCiEN4ZA0eo+N600+G52fuyisKYQd?=
 =?us-ascii?Q?8ePA1WXfTZ+5bcnfhkOUM9aWtJP1fN0zN270Bpa8x8XwvoMsI6udbXcCbOzm?=
 =?us-ascii?Q?Mfc8L2Zt4VV1EG+Fg1mMLPLaX2xoqh5GCmVTZIYctYBQ7k2cah3kZQEQpLNr?=
 =?us-ascii?Q?n13LzV6Qm2xCtf21KaSkaO94N+a9nPL8+2qdqODRMncZa+VErAKM2lNzLiOI?=
 =?us-ascii?Q?eXSwyq3WeD3QbPYGPr/QvdJwJakhePpectoRVDJnezRRvsV7HkS0vyva3Q8x?=
 =?us-ascii?Q?8bDyAZy14Wp23FqYt2DunnR+g8fv2RObeqSL3LXvzp59YQFU/xP47sJ+Ii+v?=
 =?us-ascii?Q?6J916FsCF8GZv9+42pZq2tuHZhyHiEJVOpSj4Nhffi2yIAfTxbWkh0bMuMD7?=
 =?us-ascii?Q?au22nd5IUlIKjsxEnMJzDEoUl4OvYI9xaU87usRxLpQnmKlmSaf76tl/MvQo?=
 =?us-ascii?Q?6eBB3RrN+7/de7kgzZxUVGxLxNDIwalBGmK9ROrP7iC77jMKjE8EOg6Ad99E?=
 =?us-ascii?Q?gTpP0hDRllrMZaQde+WXm3U2RvGgxUUK2KmUVLMyXZ6WPW5dp6E903PjQHPh?=
 =?us-ascii?Q?EHrlPX1B8SulFeiuxSV+ZN6mw4vTejDM8mrshD3OClhjeurcOwwjEewqAYPt?=
 =?us-ascii?Q?rbf5bpuooIADjX4bodBUgmH4uNmcZ2XGkdRnyMHg06We0nOcELzpCoVC/JRL?=
 =?us-ascii?Q?IwIO5DJTknR9nN20rIpyLvkkiplAzaoQnJKQ8v0Urgs3BqlUquadKmcQ05YS?=
 =?us-ascii?Q?mNzF2YGrdlJO7rE2+qO9lVjxEoN+juU1SJFvAEapa92dJ3thFjDxmS6OF/q2?=
 =?us-ascii?Q?94VCAuip1ZHWQmJRI+Cknb8rDGKPtJJxpNtr3uUQtN5lPLVVY44HQt2qbjrs?=
 =?us-ascii?Q?TGqGMpotwZJfXkwiFH++yDlVeRxyrxsKd4oT04BrdxGWu4CJ6U2xrNlJ2yEK?=
 =?us-ascii?Q?SkuQxZcBx+9pSulDp2hBYi+6QPWtRYKLAG9B4Ag+nusTzzmC4cKadH4HUJ2w?=
 =?us-ascii?Q?4M20FRbgyPGMqFKdftt3OV/Ka051IexME1mG5bdldk1gimLWa9c47UNzIIRs?=
 =?us-ascii?Q?oqc3I8rq00w5SzvSdsCjNHX/XQpjnH7cGgKLFfjEQh29mx6zBaRO97Pt47GS?=
 =?us-ascii?Q?tupdwrP1WxEWlSZBegfXz/jfqIw4iOXDwZz0t1T7JdUUh6I4+ZIYaNX2ptO7?=
 =?us-ascii?Q?TbtvtEPgCWCTSB1KW+L/uYykv/C1DUnBNZ6q/5vfnLa9LMFPb4zKIBeo5+Cs?=
 =?us-ascii?Q?bXwXOIQWd+G4Fjim2zX0QdyWDMFoXVx7GPtfx8KBaqLLiIfOGaI7ds9AjaOT?=
 =?us-ascii?Q?c0XMwv1zMH5HtWQ9uHNAD6GF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc78f3d-fd09-4896-a2ba-08d96c7f4670
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:00:15.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNhsH+o/nk+odpTNgAeLTBbSMPnNmMYHL6h1zVeqPt6m1LzVTUhyhAgvad1R+Mshsko8LeMlgwwRqYziFuZXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On 31.08.2021 14:31, Rahul Singh wrote:
>> On 24 Aug 2021, at 4:53 pm, Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.08.2021 14:02, Rahul Singh wrote:
>>> --- /dev/null
>>> +++ b/xen/drivers/passthrough/msi.c
>>> @@ -0,0 +1,96 @@
>>> +/*
>>> + * Copyright (C) 2008,  Netronome Systems, Inc.
>>
>> While generally copying copyright statements when splitting source
>> files is probably wanted (or even necessary) I doubt this is
>> suitable here: None of the MSI code that you move was contributed
>> by them afaict.
>=20
> Let me remove the "Copyright Copyright (C) 2008,  Netronome Systems, Inc.=
=E2=80=9D .=20
> Can you please help me what copyright I will add for the next patch ?

None? If you look around, you will find that far from all source files
have such a line (or multiple of them).

>>> + * This program is free software; you can redistribute it and/or modif=
y it
>>> + * under the terms and conditions of the GNU General Public License,
>>> + * version 2, as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope it will be useful, but WITH=
OUT
>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
>>> + * more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License a=
long with
>>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include <xen/init.h>
>>> +#include <xen/pci.h>
>>> +#include <asm/msi.h>
>>
>> You surely mean xen/msi.h here: Headers like this one should always
>> be included by the producer, no matter that it builds fine without.
>> Else you risk declarations and definitions to go out of sync.
> Ok . Let me include here =E2=80=9Cxen/msi.h=E2=80=9D and move other requi=
red includes to =E2=80=9Cxen/msi.h"

Why move stuff? xen/msi.h is fins to include asm/msi.h. It's just that
including asm/msi.h here is not enough.

Jan


