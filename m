Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFB74722C9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 09:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245877.424146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwgrI-00067U-2A; Mon, 13 Dec 2021 08:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245877.424146; Mon, 13 Dec 2021 08:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwgrH-00065A-Tu; Mon, 13 Dec 2021 08:38:55 +0000
Received: by outflank-mailman (input) for mailman id 245877;
 Mon, 13 Dec 2021 08:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwgrG-000654-HH
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 08:38:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 195d162e-5bf0-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 09:38:52 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-WjCFY0fpM4i5Bx84zxbZtQ-1; Mon, 13 Dec 2021 09:38:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 08:38:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 08:38:49 +0000
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
X-Inumbo-ID: 195d162e-5bf0-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639384731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84A/1vkL4ov7So67BWwr0gB5ZeNVY92WcQ4KCBg0kEg=;
	b=cu0CyMsDzVCs9ZhDnBEp23AoirIYuL1vhtluQkp8H2JbpKklp+5KhsAhkT2uxUuBsCwhkW
	zM8i9UbulLVmndOSKRT2RWOhcFEf4/vYbTEsWbcnU3wvTTSNnUMmQJz5RKs+Nh4ChUXvwo
	G5nhtLlKz5pXrOJC9gMUGNza5xo9yrw=
X-MC-Unique: WjCFY0fpM4i5Bx84zxbZtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXAG7pw1d+yaz9qu2mgJ6vz1ndEMIiPgsOVrnOj/Rog4BmFiY6A87mX4YxJc6yNL1X3nG7GAJUcfol7tg6leTfbxxAHCxm4Xc2f+UheQIWqoiXWy2OpBUQHbcxIcLWtCebxENznqxYs5lYzwTAr8jWpr0fToM/QDFz+lyGaq4l5OuSUa76FA0P9O9HfZvAOc/ZEHL03d0jFH0Z5hZyk9hHiHdXzcxigutnmOHzaKkXcIp5gQ/dzpFDRc4qLyEZhKquoMtEX13nrCZTeuw12T0xvJQWWW5i+YRiLoEMHt4JImNzLDsIad6kfSTl8F6AmzyZ/ImvIxmbZxca0MgBgmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dxNM6d1NEHtjAWfElhcxBUJSpnLa6yE27FisM8KjQY=;
 b=MQF4++vyTFfpLRrmkHtwalerL8aTMljNPl3+uurw+ymKJPwLMwFITizAy5FB+KeHJXmUojcmSPbbB/jYfwIbZv97teF+3O1BkxQkAZeUtDl1IY1whG3nPIUtFiyPkNnacGZoX+GDVZTqlORM2WDavH9+pGTx5c8+c4oODvjpHuqtzaF4OkYBI4yT9xwTRShcdwlLBggjOSTGx40+gLnpE83a72g7rJbeOFkngP7ffTOTB7VpVDYDSaxy3DuPIYnDt0oHOtKyJS5moO8rf78YPxH8x6jJLRRYdm9RXLjqVQ4AvWrdji+lCS1/TABqZsQtAzRyGt/lnU2mhNZertN6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47786373-aa55-d572-3205-38513042cf88@suse.com>
Date: Mon, 13 Dec 2021 09:38:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
 <YbNbafZMMbRJxlzs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbNbafZMMbRJxlzs@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca7b970-2935-48f3-765c-08d9be13fc0b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600E7776190C69A06B0BCCDB3749@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ENY0MMZpYGTAl1wGCQRJlGWTP5IPKdwV3PrWyev2Ps//itiQwYwnRZZQO1LXPe6aYsz9Cd1623lzLSvZh1t9a88fTt8B8U4+q0jRoW1ausl5fzh2ykPa8RjShrTWAmkVso37b48mi590PfJSfRSzRAhUZXx7z6i5RPM5tKO+oMfqkSJxfwzHtEZAihJR7Qqb1dvQnJ2/5nA5kIWOoTGh6J1eogBQrogfzgnlqpis+ruB3MGDG+EL+0qE8feVTOQ6gMqlfNAk9O/UgAEaESjhG++eV+TPR9t5GPm8TK3IDMfGZn6PxZ3tQuj7knXGwzd8DIh+tYTyaoCtdWa9TcrXc0jRHkZ6TQLMhyYWPWehqdv4OVAo9KifDXrKOfSDEdwd3NXZSRRjYoptP57evFXwaEMaNcJghrSFa8zEIEVxhWmfKGokvSYmZewseGlpIvkPQf+y/ksJQ/VLRANMn3GwFYlFsGHOsZ746rSlMz6zlYVph9jk/GGDsdkLUwdwucT7cAmeQYPZAqds1IJS5NM2E3zFECB0CH/eGGjwD7M1A5F8P/xxNM1L+mfE9fq08Az0DsDn59VoRed7zvKT21S1TsMMy7OmoxiRcUgvoOYrm7NQOw1hl+Shk+QjvGJNblbh+txoey6kOPgs97Cb1HsngeyWX3EdhyGmJH0jOnx7zv9rCYcrV23FJnD7gnLPGT5Xq1EIR9aCpIL1RRHB6oFSwNNufLa9sYPH3t8ryR2iX0APdWrRgE4KNRLcDG4k3OYGPlNyHHds0/pB7V6LXG1+8w0KF++WbScGuImxnTOD3lNoLaiBVY8Zi5z/630tjqU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6666004)(2616005)(38100700002)(8936002)(186003)(86362001)(54906003)(4326008)(2906002)(66946007)(36756003)(5660300002)(66556008)(508600001)(31686004)(8676002)(316002)(6506007)(66476007)(26005)(6916009)(6486002)(53546011)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MZXfhZ4gWXZeECmy6WMawViODJ1hP66ptXM3dMqH9lrSn+JBBUmFvQpnzO7t?=
 =?us-ascii?Q?9dk5dr7LO8NTmKCGi4uCvwQ269QbO3OSUVUkhBJhZ8W53SB8fUy/a9nv9CYc?=
 =?us-ascii?Q?bLafPsvnPE4UHUInHQtmPNzcUG96fTVkfYSYe3OO5dMEvR+8GPqgoo2cW1uK?=
 =?us-ascii?Q?fcdEqmGn6Ak8Bh+5aNI5mbzhn+nAdrVdqSReY0BvcIQdbUQNmzTgMBCaqhem?=
 =?us-ascii?Q?xnsA1uz9ySjnXOVAPFOy37SkcTbjAY8rGzvJWwmeKvzyuiIAZAcfEN2P+FII?=
 =?us-ascii?Q?lLo0aDbXRF15sWJ0jf58CB4ErbazaZhjcKsV2CDwE1DILSHP1BNyvrXJfcS0?=
 =?us-ascii?Q?+hQTdQxv8qhcvb8Gojh0aoF8A3CbluswgKhx7SY8Jpr4wi4lw6Z5/YkYgmR1?=
 =?us-ascii?Q?7StpvJFhZrJugOovkkCOEoL2B0qT1M8VUGt2b82XY/nTSs7VxXT9JE38p4Wy?=
 =?us-ascii?Q?5AovbmLY0p0f3vQg8vs/yjHgVSS6ACGYSAsmOXyC/2J77sBs8AxVUCIFkySL?=
 =?us-ascii?Q?tx4t6nxMyvjZg+kvDIGHDiNUJlCSgOrbvuRmU5FfjxFOvBL9X+fAGPFQs+Yq?=
 =?us-ascii?Q?AwUW/Si0AKFfItKWEVu53BtVKLjwiV+efcUqdcTcm9+ydzQBnxN+c8YbiJwZ?=
 =?us-ascii?Q?6SK4OGzrsGxWSK1g33+0kcoM7QuBAq5FQ/kfqqrvqS9un2w/y6QXBw4IfCA+?=
 =?us-ascii?Q?TSUtvA0UR1VQIsyxMneGCB8tyPzURQWWQgj1xCoYqq7GRBySBSgPKfMgNOL9?=
 =?us-ascii?Q?YZytNy8yakxnA8greV+6vCrgZ317DbaL+v21JedPfWiNnqEazhw6xrt5v7/C?=
 =?us-ascii?Q?/dAjFZk/+dt5epfKOwyW3zSmaX9Qk1VtHsosUGnF4/zuzor1bdF0eR3/+4Ph?=
 =?us-ascii?Q?TSYopBwh+chak3KI947nqM+qopGdOwX1hAHzXcpBPuOT5l2qjSYFOdf4rugh?=
 =?us-ascii?Q?eat50JCxLpeoODesRbHVC0zX0yRI5Ke7dXtbRp7HIiCi7xT861Jr/emvG1V4?=
 =?us-ascii?Q?8X2GQB2ckBI5r7a7Jrcrl+YJCCQpMu444cmCrHz/D0+2kNTF1eWTZXp7PLEu?=
 =?us-ascii?Q?IgBbCRasuLSV5g9t/OTmsWDHUW3kyAHhb+BIZn4vNxe98QnYwbwbypGcME6E?=
 =?us-ascii?Q?3K5ougzrqocgL5NHyMVLkzXLDEHpOHJXCYA+JJ9bgU+LD3cqEua/iPwb+e1d?=
 =?us-ascii?Q?b9pRfehYNUJ4kiuRxGi3ipVDCAyWYWJDZya1nov/XOukDD3x0lGDPms4N60s?=
 =?us-ascii?Q?MB2LwXZb//qdr607Q+67XL3N8uB/20xuZpVYz2gYaDe3Jlu9iRk2mXNYc+bl?=
 =?us-ascii?Q?P2dLVgrd6axyluQ61QQhWiymUdLArZjAusoyhO013w7jOJQXOEqGwZjFy05b?=
 =?us-ascii?Q?aVFedSvauNnpXBrLW7NYcXdPvmnAl2a2/Zj+FsDBMXmDo51SNjw82fmwJVJy?=
 =?us-ascii?Q?GZbEdON8RmNSnKBnZe8HaTu7FuknkO1/09MKugdaj8PQJ1khzFldfvhxqBrF?=
 =?us-ascii?Q?qBbyn39hBc1QoUahbIGDa715JCCczGkf2YSmigns4LejtV57cwpisebLx8mn?=
 =?us-ascii?Q?Nt8udtFgoVpKtopCXQmGuRZSZO1EBCgS2Uhj5nv+LUoIzcpYVaottNzr5p9g?=
 =?us-ascii?Q?/Y7iizmQZ/MtbTCF40fztkU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca7b970-2935-48f3-765c-08d9be13fc0b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 08:38:49.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmbxY7i8INr1FG90L5PkUGZJMVzjCq3l+s9it18n//b/VtKzy8iDCmj9WtU3mGXN6tRZmLWPAJajasQmCpHsCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 10.12.2021 14:51, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
>> For vendor specific code to support superpages we need to be able to
>> deal with a superpage mapping replacing an intermediate page table (or
>> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
>> needed to free individual page tables while a domain is still alive.
>> Since the freeing needs to be deferred until after a suitable IOTLB
>> flush was performed, released page tables get queued for processing by a
>> tasklet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was considering whether to use a softirq-taklet instead. This would
>> have the benefit of avoiding extra scheduling operations, but come with
>> the risk of the freeing happening prematurely because of a
>> process_pending_softirqs() somewhere.
>=20
> The main one that comes to mind would be the debug keys and it's usage
> of process_pending_softirqs that could interfere with iommu unmaps, so
> I guess if only for that reason it's best to run in idle vcpu context.

IOW you support the choice made.

>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -12,6 +12,7 @@
>>   * this program; If not, see <http://www.gnu.org/licenses/>.
>>   */
>> =20
>> +#include <xen/cpu.h>
>>  #include <xen/sched.h>
>>  #include <xen/iommu.h>
>>  #include <xen/paging.h>
>> @@ -463,6 +464,85 @@ struct page_info *iommu_alloc_pgtable(st
>>      return pg;
>>  }
>> =20
>> +/*
>> + * Intermediate page tables which get replaced by large pages may only =
be
>> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
>> + * per-CPU list, with a per-CPU tasklet processing the list on the assu=
mption
>> + * that the necessary IOTLB flush will have occurred by the time taskle=
ts get
>> + * to run. (List and tasklet being per-CPU has the benefit of accesses =
not
>> + * requiring any locking.)
>> + */
>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
>> +
>> +static void free_queued_pgtables(void *arg)
>> +{
>> +    struct page_list_head *list =3D arg;
>> +    struct page_info *pg;
>> +
>> +    while ( (pg =3D page_list_remove_head(list)) )
>> +        free_domheap_page(pg);
>=20
> Should you add a preempt check here to yield and schedule the tasklet
> again, in order to be able to process any pending work?

I did ask myself this question, yes, but ...

> Maybe just calling process_pending_softirqs would be enough?

... I think I didn't consider this as a possible simpler variant (compared
to re-scheduling the tasklet). Let me add such - I agree that this should
be sufficient.

Jan


