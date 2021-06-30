Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA963B8500
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 16:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148194.273842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyb6P-0006JO-8F; Wed, 30 Jun 2021 14:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148194.273842; Wed, 30 Jun 2021 14:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyb6P-0006Gv-4e; Wed, 30 Jun 2021 14:22:09 +0000
Received: by outflank-mailman (input) for mailman id 148194;
 Wed, 30 Jun 2021 14:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9IgB=LY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lyb6M-0006Gp-Pd
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 14:22:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bb21d7d-276b-40d7-8f4f-703b3540f9cb;
 Wed, 30 Jun 2021 14:22:05 +0000 (UTC)
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
X-Inumbo-ID: 0bb21d7d-276b-40d7-8f4f-703b3540f9cb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625062925;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QhK/gCUXmNcRJ3VqqlI5E6tfI53oZenKrcTVvJ4/hG8=;
  b=DHNigzmnVppd/RQ/ko8yn9mOO1oQ4xu0sUYUjPNn16+ww8WFpwsorDmZ
   vWqKpnVHOgsvnKdm7aphxm1mvgAgODeuWlZQ68ADn8MW+xxDpoPZLqpWE
   LD6CaJbcICmO6+/ygZzmqpefWJA8ZsXOQWLecFmiGv0NhictlM0n/xOhN
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tp3ZoQtkCn8r4PsH8xbegdU1EP6E2tgeVpLOTKqeYUg5WnzgJETYYgAZhn/S8qyUUavLIcq617
 Oc9zwZSiJXUi1gnLJpTa3liJJmpjSkbNtwNYz3+eAn1iIbkoSHKsCswt4FaKkfxQYqpjCv9vqI
 b9/apX63T8117aXg/EwpfUZ75Fpd/7FgGJV9Xncfk5RVyoogJJjknXvX2Rx10dpSZBnAC2JsAw
 Xp5n/XTxG3jjOpRSeCwInPwtL/OdaGjkXP3KnGvVfs6O0hzWKRxektw7lQb+yhjq6TCFvoAolk
 k8o=
X-SBRS: 5.1
X-MesageID: 47283752
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PfYBmarAGKd6nfrblFJXutkaV5uwL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBfhHO1OkPcs1NCZLXbbUQqTXf1fBO7ZogEIdBeOjdK1uZ
 0QFZSWTeeAcGSS7vyKkjVQcexQuOVvmZrA7Yy1ogYPPGMaH52IrT0JbTpzencGNzWubqBJba
 Z0iPA3wgZINU5nFPhSURI+Lpj+TpDw5dPbiVlsPW9u1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVkza71eUUpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qs5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 Z29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQZo+a87bWTHAb0cYb
 BT5Jm23ocPTbraVQGagoBX+q3qYpxpdS32GXTr06euok1rdHMQ9TpV+CVQpAZbyHqRI6M0rN
 gsCZ4Y4o2mePVmIJ6VNN1xNvdfNVa9CC4kEFjibmgPR5t3dU4klfbMkf8IDbaRCe01Jd0J6c
 n8bG8=
X-IronPort-AV: E=Sophos;i="5.83,312,1616472000"; 
   d="scan'208";a="47283752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McPdQEPhJizuoknELcl8O6vEXeWfx2B3wzOP0UjAybf4f5/rvqkXdo4jmXPdpeBUksPXkKaVykGbkkg31KjnqA9j3T+tOXgh+ZcMTDs4NuLqREMLdqTU9LtjYuWxI7QNkrbcjkBrk1JsHDVSHwewIALYFZSR3uCnboFBFwb0jDgcBmMNtRlpCqesoL6BovS1p/9c53hoDRTTnJ4EAeRNwWJprEwR5drG7LrJonNOjLxKzi8e46O/SJUEE97+L0F69Wyogo+umOS9xZzCpE8ABla+ORDHIunUwrYMVfZTgDO1fx4PVDhvxN+zKGBt9RtVLYdI2TgyVu9qXjSqXAmDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhK/gCUXmNcRJ3VqqlI5E6tfI53oZenKrcTVvJ4/hG8=;
 b=HTARWc6W1251DrHZYjbt0Juob41Ch2uEN0Ow+DxFynMdy+8n19CeBkhiJ2hQiC2AlQEcDKC+bQK1K22ikg1TiS1iWDUSCId6SfGHh6JvJHi0CM7kB6z7TEopFIQv1dex5+tsPrGf1aVQXMVxGgF+/VuSrAMpQX79bkON2zTG/K0yZJq481vfn7zXMXw1/7MbQqsP6+ApkAdZFugf6P7/q68yxnGuXZCQDwMPFaCLu/mW7mKbhkHHKJsqIySH4uZ939UxtPOqx3hI477brb7f8cdCYyzGKNiqLUOcEah+rmH9G4v3YI0NG4GYC20+Z96o9tc64U8OmcO/QfNlpRFF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhK/gCUXmNcRJ3VqqlI5E6tfI53oZenKrcTVvJ4/hG8=;
 b=vPSumUGi/1+isfo7/QAmxwm/+VV8JjQPEv6AplsYmyDt8n+UE/zF4zW+ccwo7rju5gTBHnDnhRFmgPbE9pzOVAmjhSIC0V3wJKzNGU8pIUYchJBhqlSJ4pVp23vuZTQIVDm9SX0DNZ9K5vGWIKQClAYrxiDFc4c5L1r7i5I4GNs=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <b791d89f-5c9d-9c04-00ed-0cbaae68536a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: drop callback_mask pseudo-variables
Message-ID: <cea3493c-7794-c722-5255-f36d3869d2e9@citrix.com>
Date: Wed, 30 Jun 2021 15:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b791d89f-5c9d-9c04-00ed-0cbaae68536a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 691bd038-5901-4c9a-3c8c-08d93bd11630
X-MS-TrafficTypeDiagnostic: BYAPR03MB4357:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4357AC96202FAC9CA56F11CBBA019@BYAPR03MB4357.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U2ZFUzGbNMrxAab3kVcYow96rnOrNyWYhi/mQhF2P+XaFKqZ2UcwIJf6UqgLCkxXXj/I62XdLmvA81scDVFfcmh/UzY5VGRrwSEVQkRdP1Ls0DqwRkFqoNMrA8oV0pC+pw0zsKk9ogKTma6VjzTmrQaplXY9KL/9LpL8e92zmhvFQkwciLs/Y7mAUugTHUnmbuJeVL1X5y9BZpSso9VQ8zuY+/iOq7GvtxgGNdkacGZwzXFYJdoE1oXkgUd/EMh12PQ3OplZtZmPqdYgI1WOcxEHTgiZ7QiTyhneByZEz7idWY1d1A1Oz4njdan9b3/InmpD3BS5NyvnK8ppFcFaDoUB/iwFFhHGXb7aitav8BVsIDGGQ0NFS5vAMrNKWu868/evVO3mFnM8DFZJdUVy8XMLKKvJsQTsQCLzlqzvYHMUKmXYtsmsfN7oj/VmzJ7rnmkVSyoiqO1eEj/HOaQYg5R9364Ig/FdMjdb139K59ptojHDSi7ud8R/UVczsKJTyR/JF+DqQCmn+/OU/9E/uVfD2wnKBK7uGjj0O1JYaKDCnS3Fw1LysQcsPGofvsB04N/M9I5ed9q4NRTshQsv34/8Ocy/LjmXivKCJcorhyDYD3izHQFEIJAFG40HY9outfN2Mk19caAxlOgkFXVX55oiFaf1SVrnbiY04cG2V1+SWwRs0/usbDAByRiTmU4Q4RPfspbHJT4LcLoY7R05detcF4stIAAddWBo/ykg56c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(66946007)(31686004)(4326008)(8936002)(83380400001)(4744005)(2906002)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66556008)(66476007)(316002)(16576012)(31696002)(2616005)(53546011)(956004)(186003)(110136005)(54906003)(86362001)(26005)(6666004)(16526019)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUFyOVMwTkRKejlpc0ZmazNuMTlJOVpidXdZdWR0NjQ4SUxMSEpWbG1pV3o3?=
 =?utf-8?B?d2w3RmV3WTVaK2NZcVhjcTVYTFp1cVpsUTdGbjhBUTRodjhYczVlUE81U1lP?=
 =?utf-8?B?bTdlVVF4N3Z4UDZwSGZnbDQrWmthQUNnNHlaLzc4bGF5eDh0Zi9HNGxValFG?=
 =?utf-8?B?TjVWMUxQODV3OHdUN1RPdjJoWTFiTlNyQVEwTldNVUFlbFJaa1RlTHgvQ1R4?=
 =?utf-8?B?eVI3aUpyam5FMzh5QWg4K0NwUTBiL3Jzb1piZ29tVDRJdVR6QjY3OU5NckRa?=
 =?utf-8?B?ZDZ6eFJnWkxIaG8rZ09WUHh2SFRFQkJXRHFyNGsrcWFCK0h1UndvbFhJQUNS?=
 =?utf-8?B?dFZ6UUgrbXhCRnBtRkwzV2tPK1Z6VDBaSWZwTVdUdGNuQ09wODFOWHJmSGdo?=
 =?utf-8?B?TXVKSnJTd2NoT0w0T25ZREZWV2dGNmVqQTU2ZUc2d3F2SDZtZi9JRUVsRUtW?=
 =?utf-8?B?SE01eFQwckNHeW13NnhhK1BzZTlmZ21PSW5GSU5vYmlmakY2T3V0b3dxYVcv?=
 =?utf-8?B?aHdXenp5emR0UDhNM3hTZzh4OGR5SHRjOGVhZmN3SjZ5Tm1OUXNaMXVSTUZD?=
 =?utf-8?B?WkN3dkw4NXZvNEIwMUFmYkw4VXMvbWQrdzRaOGc1UWNLYkdob1gyaFJFd2pB?=
 =?utf-8?B?aG92RWJ6MXEvNnY0TjVLdk1OanV2Vldkd1NUTksydnczT042NjhGblJUYzlZ?=
 =?utf-8?B?Rmg0Q3V0eGlTQWZBQTNnekQzcnpCdXBhR211VGpUc1VkQW4yYVpZVXVmNFZZ?=
 =?utf-8?B?SnlwTDhxblhEWndVZmhqQkJDS0FzQS9IT21VS0ZVNk0wejdoVnlrdlkxeGZU?=
 =?utf-8?B?eTg3dmV2MEhVV3R6WjBCZFpIdzZZaE4vdWhpVkNuYVNPTm5oRjZsdkNCSlpO?=
 =?utf-8?B?WTVjdFRYN3FTVU5GTExIakxFbG12US9zSXVqQUdlSnJaZlpoeTVVMVBVZkJO?=
 =?utf-8?B?TWVFQWxjbzlLQnVOQ3poV2IrSTJxUTN0QUdZQUZlM0ZjREFHVHlBai9lMGhk?=
 =?utf-8?B?NW1ZRlNJSnM4cGc5L0J5TE1zbUFzV01tZXM2bDQwYk5SSVZPNU1VUXlRMEs5?=
 =?utf-8?B?L2NQdkVYZFgzZFRSZEpJb2lWWENpcmNNMXNEdWtXRTlOZDByNm1LZ09wKzlK?=
 =?utf-8?B?ZW5aUEx5K3VVQUZxZkJ1SVFnWWN5UnkxSU1hUGVDZnFSVVZ6WVlodjg2SWFo?=
 =?utf-8?B?cU0yeXBTVUlvdEszY0c1SGUwT3lsY2dxVWJOOXhGQ04wajFsaFVJSFlqSDZM?=
 =?utf-8?B?SUFFSTVaRG1aWTNpZUxDYk9kTzErMWhwWncrNGlxKzFlcCtxUkVyWkQ2RnZ3?=
 =?utf-8?B?MUlMeHpCUVBoRm5DNHhHSEJvNEVqdUwvZnNhTytqVGl0anVKNXlYOEpQRHZp?=
 =?utf-8?B?cDhGU2NlQXhLWTUyNktJdGRCdDdVWDhsZ0R6QVA1Tk9EM1VwMllQOFBCQi9q?=
 =?utf-8?B?bXN5OUk3a2MzamN6Q0ordjNGYTgzK1lWbnd6RC9oOEV5STUyb2JSODMvcWN2?=
 =?utf-8?B?R3dpMXFud0E1UURtS2Z6djUrOUp0V0hYVHZXTU5rT2U5YVdEdDFWemlkYWxM?=
 =?utf-8?B?Y1ZEZ1IyR2h1cWpQZ3o4OU9qT25GZUJBZHBDNzFFVmtUdVdUTEsrRlpteTRs?=
 =?utf-8?B?cGNaYjlUVWNaTnAyTkZJYlQwU1pSRnlZL2hBcUVnVTd2UENXTnR4Slp1T1Vy?=
 =?utf-8?B?ekJhWlo4Z2VqU29FcWtyNnAxdnhZRWRhT2pxN2F1cVorR2tCR0Y1QWNQVHRn?=
 =?utf-8?Q?OL34KPcycuFTUiRAie6ReNw7oFw9xLJuB8Hxznb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 691bd038-5901-4c9a-3c8c-08d93bd11630
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 14:12:26.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXxsJlSm4yUUBgM5L56wSlAmXAqR4LnKKwDM8FlQc/Pvw2dT0WiA7onTn2HcgXgqL08k6edP0/q9hw8hE/6jew6+K1Rc6ysUsqgbhLW86eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4357
X-OriginatorOrg: citrix.com

On 30/06/2021 07:42, Jan Beulich wrote:
> In commit 90629587e16e ("x86/shadow: replace stale literal numbers in
> hash_{vcpu,domain}_foreach()") I had to work around a clang shortcoming
> (if you like), leveraging that gcc tolerates static const variables in
> otherwise integer constant expressions. Roberto suggests that we'd
> better not rely on such behavior. Drop the involved static const-s,
> using their "expansions" in both of the prior use sites each. This then
> allows dropping the short-circuiting of the check for clang.
>
> Requested-by: Roberto Bagnara <roberto.bagnara@bugseng.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It is not fair to categorise this as a shortcoming in clang.=C2=A0 C mandat=
es
an ICE in _Static_assert().=C2=A0 You tried to used a GCC
extension/implementation detail which Clang doesn't implement.

With a suitable change to the commit message, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>


