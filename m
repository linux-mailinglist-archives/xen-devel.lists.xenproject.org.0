Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD617300090
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 11:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72676.130897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tvZ-0003xB-O5; Fri, 22 Jan 2021 10:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72676.130897; Fri, 22 Jan 2021 10:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tvZ-0003wm-Kv; Fri, 22 Jan 2021 10:44:29 +0000
Received: by outflank-mailman (input) for mailman id 72676;
 Fri, 22 Jan 2021 10:44:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2tvY-0003wh-HQ
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 10:44:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a26f552f-fe1e-47dc-83e4-bd14d4fe4b8d;
 Fri, 22 Jan 2021 10:44:26 +0000 (UTC)
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
X-Inumbo-ID: a26f552f-fe1e-47dc-83e4-bd14d4fe4b8d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611312266;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FVwJcBbnBsuQN4GmMUni60ZWH9LhewewoOnGSnt6BGs=;
  b=Hz1sTuEuowkqATfCbN2hB7plm2puEXKFmIWAoQXjjlZ3ipQ5qEPZgTMM
   J/XV+BGQpweO1sYhcteutzBVA8MVOVUtAbYO7kW7HdECSYAJu0tQPYmwb
   xblrSvKwY/kAVVQfctFNTYcdRkPF/ZVdaZ5QiHcd6Qut/8ykbi6FGrxia
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Jj7aBJ3abWnlsIGEc/3hyGPuXORYE7fCk0afdR51YWiIIoUazPgvcvQ/+TCeicxaaFIjaMswYB
 JBu1xIdpsu2aj7wuXpuj7BzieuDpWiwrRtM2DZBA0OHJbtHFI9HjGz0QunS+g0Lde4n45Zc6+G
 9+twC7ZN2IhnXmFGXtTWfnql71Ey1aHCBKPl7wYGq2tPrKhTSd1ZyywTCdcyX3XrD4gb8Ovniw
 M3Xes8UqMY8iOBn5VpJFXUi6rMJUSi6/EJ56xHz3IJ86G2AYN+lijN5T+2DsWve+sO5nyH3vE7
 beo=
X-SBRS: 5.2
X-MesageID: 35694173
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="35694173"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtEm+lIVAIoWPL9lDleKfhGZKdSlZH8CKhr7f+Q9yYnoKMe9DH9HX5YelwCMwdBjfyhJKYxipMul9wUQFAE3i/WhUnM0wblnkBPpzHD2W2M3CGlq0XXPuWmUzqyhIbqz+F4os1uVmNQ08kN6DF5CtWgE9sFYkAEnZ4DSDTfyYfKc09IFujW4voh2WOmDO5fVogm0FvmXP5gs9vlEcslVd7ShqlTVkMnxS9RygDrgUKgWVQ2/3OKiNMOBE5G1z6r5p7oorbVAiBdcESHVa6fHiniGHMl8/5+oSOWDxc3pEE6j1MNyOkBpaLTQHHjHcLtKV6ZZkEsP+XOWo5LK3CwEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVwJcBbnBsuQN4GmMUni60ZWH9LhewewoOnGSnt6BGs=;
 b=hr5wtk6jRL1uNCaedWZF4gckd01/TblxosoRG4IGZQDhPTV+uC6qLaeWGSSTgR12J1pkuQ2n4ONnZC3Jf19B+n5J8UTXoxJ/1Bd2mTlzHM92z/yd5foRDW0S3hvpqMhsWAo/+JlpXzO13+ox1si2QjpD9mx6UhSFs/cvM7LetmL+w6u04izVLqrr8gVlOYdYExjqonoRnK3outNGhaEKRcNjapVss15aPuCTjvYuAhGTExvTLELhbZVWPw5nQXMqhZuSYG3TXR+l3JrQJL8GN2GqybQ00ucDtlN9AFdTObarbR0n+UwyDdJ2xpyggGVQREgq8cvm8OLpwg84kt3jPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVwJcBbnBsuQN4GmMUni60ZWH9LhewewoOnGSnt6BGs=;
 b=PxIoZK4/9sH5JZpb2wgfl7V21e2rdiV2jgEf/HTDyDd8dVBj6EwKdIW617w+zjxbAfn8mIXWfu//ZyNyiqZJwS6Zu4VvMrw7T9UaJf5h1cdds5baNjdUgZizzbN0zmeU13A8gDVtbNLyzGvIwiqLZcaN3joqEn9qYGnWTx/RZak=
Subject: Re: [PATCH] tools/xenstore: fix unsigned < 0 compare in
 xenstore_control
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210122060857.30273-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c941ebba-887a-6a93-7bd1-ef6b60220981@citrix.com>
Date: Fri, 22 Jan 2021 10:44:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122060857.30273-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4166e044-7542-41e2-9ea3-08d8bec2ae70
X-MS-TrafficTypeDiagnostic: BYAPR03MB4277:
X-Microsoft-Antispam-PRVS: <BYAPR03MB42774A699C9DB28D91F6E66FBAA00@BYAPR03MB4277.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsWKod9xnF3Su68tMeGpwXjVp8vOh1WLsg6CzlzpgMPfnqopKV/8Mw9y2nUpQqA/Bf4oFp1yJEnsIlWxp4PTyR3JfICvy7stT/3lnPLrWFJav3A0gl6VbJZnYLUYUS9Ggb4Y9LEmQytM7dpEIQv0dol0vl9xNcOgt48S4URH5LdcYxqx/uImsiFAbRdS8mhOlu3FwI7eT8Ryf5lvha0uv6PEkOsAdc6tsVGTn7TCm69g+65pBpoDm8nGIHb9GJFTtVw8ujKcaXCKk2rsKzqwx6tbbxJAB4XBVkBi5J/9FLjpnjARMkfKkZHwMmVZaIyMEP9WlsP8eVDVWm7+UNnFS8V72iLlvnptJaIgoIOQtZOJOtxhNuFUoo8RBtVcKxaXFcy5oWx4OVX7/z+78w6KrZxgvM/K9lmC1+vPp0z7O29qLOCrGH3wsNqL0Ds91KsaH3PkxEZr0Zxn+Yopjpi/qgfT9fLGnR/MCaQeoWcO1tw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(36756003)(478600001)(16576012)(316002)(54906003)(31696002)(66556008)(26005)(5660300002)(31686004)(2906002)(8676002)(66946007)(4744005)(53546011)(8936002)(86362001)(956004)(66476007)(83380400001)(16526019)(6486002)(2616005)(6666004)(4326008)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1ZReDRiMzhJNzE3YkJOelJBd0FvRkU4eFZBUGZhQldZS2RkUzhISkpVQ2hj?=
 =?utf-8?B?VWhFNERoekJEK2o4VWlBc1VCZG9SZHlwTW51aTJEM1EyR1djeVRUdVcySEto?=
 =?utf-8?B?enU2bFpKUEgwczVJMmFrL0VjZjdwc3dTY1NjaWpqMFhWd0tmN0tvc0x5NTJU?=
 =?utf-8?B?RHNjTEZOR1hvVktwYUZQaW9zYnpmTjlwVUh5OVdNc0lIbC9vZ3VPakVVbTFW?=
 =?utf-8?B?WTlxcG9kVTdURmZNOEk4dGtuQlAyeFJmbXRQSmZ2ZllCcjdHT0pUcmJPYTND?=
 =?utf-8?B?c0tHalBUY09nb3JUelZYNFJkMlhnTGtaU1plVVY1R2lDWVNxc0UybytlYVRs?=
 =?utf-8?B?aXFUUllpU1ZCOUpBMVM3eFdtQVlhbkhuWWdxVTNPTkF2M2c3K0lTWFRMemN4?=
 =?utf-8?B?cmVpUnNVUmFibUhmTVRkQ0M2ekQ0aUpDa2NBSllyTkRTUzZMNDl1RVh4cUpu?=
 =?utf-8?B?cHg1dTJVVXJWdUQrUm1QRkZYUFRhOE40eEdQMGdSaDR0dlRxMmJ4bTUra2Nx?=
 =?utf-8?B?VDB0VHB0RzdTOW9vbE1pNDNFaGJvOW92VUFZamYwSVdlWi96RU1ORTVIbG5j?=
 =?utf-8?B?allpU3AyTnBsNjMvQk1wT0NzWUtMaVR5cG92ekk4aHFnRFdDalZpU2tEZldN?=
 =?utf-8?B?N2ZQK1ZLazI1bVJpR0hpY0dLRG5BWUVENnF5eWhxY2lEdndlRzdONHZ3VFFl?=
 =?utf-8?B?SXduYjNBSzRXd3h3elFKbnRWK08yN2dEOTFGSlV6QkZjb3pSRG9HWWJ4UzVs?=
 =?utf-8?B?cEV4b3JrUW9INEhQOWdKckd6U0JKbjF4NXVlQTI0cXpqMUFDUkdzMnBEVWtQ?=
 =?utf-8?B?Y3NXVyswVjVtYXlsaDhhdFN6V1pQMEF4VjFrcDd0Qlp1dHBIZlU0aktDbThV?=
 =?utf-8?B?SVpVYVdPSURrcE5iTFZSVnlqZFN2TjVFdDhkeDR5WHI1VitKVWV4SmZNSUZH?=
 =?utf-8?B?YU51OHFJd1AwN2lnaVFPY1BGSlhqTnhvdHdjU3dzRE50ek1CZkpaNGF1bG42?=
 =?utf-8?B?Mk02ck8zeWFnREhFZzdrYnJZTjI0djd5TjhZR1RKcm5nMTVrRkROV1orSXh6?=
 =?utf-8?B?czVEVWNqeVBaOU9tUWczRjVMUHJtUmowZXJwUm1nSWU0RDJzTWJXWkpWSnJu?=
 =?utf-8?B?QnkwcEtLMjByQ0xmSktkM2lHZW5kK25PcnRuY3V1aUhOakkvdzlLWmxReUhz?=
 =?utf-8?B?U3lnYlNLdXVwMGxCc2daYWczbWRGQ1JrL2hSTnlZU3NMVGFmMnQwV2JCRmsz?=
 =?utf-8?B?cWdvRndiSUVMaDhTa3lxbW0rdzBjWjBVaXJORUFUUFlBb2l5eDlxMlhLV0FJ?=
 =?utf-8?Q?u2bk+C7IDGQ27G7aK4mq9aXxK29qNAnKwD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4166e044-7542-41e2-9ea3-08d8bec2ae70
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 10:44:23.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYdEO7fOzDfYDd97OExc95RJzceoXkfbWJ/jCaBEO74IGfylxlRnozlKGR/zoxJ2Kv2YtCZD0W/XiC5eXhFZW9u/ehHqW0yZbr/mwSXiYmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4277
X-OriginatorOrg: citrix.com

On 22/01/2021 06:08, Juergen Gross wrote:
> Commit 7f97193e6aa858df ("tools/xenstore: add live update command to
> xenstore-control") introduced testing an unsigned value to be less
> than 0. Fix that.
>
> Fixes: 7f97193e6aa858df ("tools/xenstore: add live update command to
> xenstore-control")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks - I'll get this committed momentarily.

