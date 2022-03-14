Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E44D7D78
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 09:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290042.491879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfv5-0004qU-31; Mon, 14 Mar 2022 08:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290042.491879; Mon, 14 Mar 2022 08:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfv4-0004ny-V5; Mon, 14 Mar 2022 08:19:10 +0000
Received: by outflank-mailman (input) for mailman id 290042;
 Mon, 14 Mar 2022 08:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTfv3-0004ns-Kv
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 08:19:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b3673fe-a36f-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 09:19:08 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-AT1oR1vSMPyTL5xNMHZhbA-1; Mon, 14 Mar 2022 09:19:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8091.eurprd04.prod.outlook.com (2603:10a6:10:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 08:19:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 08:19:04 +0000
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
X-Inumbo-ID: 6b3673fe-a36f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647245947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVsBmFmdgSbFkdZvrhIfNVDVCeQ5KTbUoAktJq4DXWo=;
	b=W+G5lO2O6ewMplXy7JOWXtZllqFb7f7k7NL/GIXPWEvoq3nQIP2ztsh5CNquGaLL8iPQlT
	CVlIS5vXkJEaWtzM0MjT6Dt07YGpvLR3saC5jXE52yfkPyvMEHfxkBSeqp0IHilp6sctQK
	XdLdEAgUhpXN0jwAW1Lm+pXnro4eczc=
X-MC-Unique: AT1oR1vSMPyTL5xNMHZhbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Axi9sqgfuU3uBfpXBI5Qhsm2iKbGYeSnXVDtpcX/Ij4gYaKzA6a2HgC2uMLpflH9oBIRvzcRHo2E1mVLtrA5br9110wvyO6inHawN61UlHxDnIT9xumdGktMOTHREJnSp+OdqDVOW9RWYYwebMJIt0OkkVTNk+rEz5USV9s63bGMXwg/u/DNOTK6mpgaRUNHZzS5/ddW5DvHMAUEC6DlGfctwU+fx+wIc4NoJB52E8rF7T9IQp6Xz1AdRzqvhMhwS5ZVM8u3N7C1IY0Z4uUU7SLAfMlJe4TB6+cXSBphn+233GBgDWHBdZfk5CwTWPmAi/pg3+KUrWG6tXLeV1eN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcHUJUWBjb4wEBCuUAYWXA1O8KtGAoONnd+8DFGM3jw=;
 b=bPFpDltMNvZRdjj6AEORJMEJT4HijcSZxilnaDiEJSXkbPAs/0hRttmn8J+VtHK6qNLYViX2HWoRo5nvn+uqQlYFv5XrBkb6myw+kaWAR+m8zyP2gvaC04cpVXJF+X87iRMsd3Fqn+K57XBUbNxWNlkChQV4gkcu3K3N4FPHJRYHfsOJ/wRie7JL15T0jQzLQP0NtUDNfFvmAt1Y8uPuUkxrhjN/q8ebwUaRUeg9Zt4cKcDThfxWZNSmEZXNFL5WYlNt46D3TuRJ/DW6cagRCIHfVgsC9WNlQBmCkMjO8pzlPnhbLut/lIPUpUCcy26LUc1Uc/QyfSeuNXWHKvIA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ec77c15-7c98-edc1-2f6b-f1d62d15b2a1@suse.com>
Date: Mon, 14 Mar 2022 09:19:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/4] x86/APIC: make connections between seemingly
 arbitrary numbers
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <123a9ae8-caab-01ae-5bea-8c590bd8f9d9@suse.com>
 <YitbhmgGy4Yh8PoP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YitbhmgGy4Yh8PoP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6614f0-e3bf-4076-9261-08da05934d23
X-MS-TrafficTypeDiagnostic: DB9PR04MB8091:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8091AAB6356C5518A999588AB30F9@DB9PR04MB8091.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gWWM68iMxy5tiztbYK2wx1JT+v0a4cR6xwMybw9yTm4yN9txnTZp59SVaZ7ZmjKZISeI0StGqaZKlMz2+3dEeQ2r4e74jKL1Cq1HvhvaZYHa9oFpnqz3p46wC2nM3pHWo5oJrwhXD6/H43J2TQsJE8zuszEzIvUbFu57I6gAmpn24YeQbVlK+QnlgRogdBigyM4RBJkcjy3ZI33kigYwC74VgYryz/3yIc8JnxbGVFotGWZPGjH2NtMYcRSlpNHvC9VH823rFOHCEsb6T6ocKDve4qWxFa0USdgwbbVgI2m9ojVdV6VJyfZEfJC9YQeXMdT/dCnmgrVuZDkVfFYAAxT4zNAd5Gfo53riaU8d8yROQLJ/vh8uMd7YExqMwvLgzz5MwzgC+pjQVuqYbrYaJGxK4YqEdNIO6ZLA8WlpH9pprPyIJN9WXBy106RpKomZNvUFJF0HnerHJAhqR8n1F3nRkEC6jjEwSP6i0Nviec2yVmKemi6SgPZL6wqW51he0IqRZmYysvZ/gWwGH3b+8wObpUrhYspEQdyu7alUsxDp1LQjxbuMxeyp/aamX94o30WkmMx2uVa/ME+5mbIonZn3zltH9KbmNlpBUMyskenvaVyfcBxI2hsHUL8mz6G/F4jjJH83N/T+uqRi89jv0ByQ4Ice8I50HNOECSvluSITDDWAxw3LXPGzUYot0fgTPqpZYT/nJTdLiwkmiydaAeX/ao6RV7MH4/tPPublZmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(8936002)(6666004)(66476007)(66556008)(66946007)(508600001)(53546011)(6506007)(31686004)(26005)(5660300002)(186003)(6916009)(6512007)(6486002)(54906003)(36756003)(38100700002)(2906002)(31696002)(83380400001)(316002)(4326008)(8676002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oQA0fFtIWk/zRSszDFpSQ3Eixbxon+qwXfv8wmr6EWav17OPxyescW6JgN6J?=
 =?us-ascii?Q?u2gYkESmc3kLAk6Eu8QhaCk8JsyPxZdnqSiWJzOutPAahuu+fNXiHZtkLa9h?=
 =?us-ascii?Q?W7AycsZpaCc24PY7IPVhod2ImZTuRHoaKdpotycOqGNmih/ryENzwZJdGulw?=
 =?us-ascii?Q?2bIJe6/pb/PiKO0GvBPa8Bkh373OJeey+CSmBWX8BakmaPzPubo1v8/3MCas?=
 =?us-ascii?Q?KBsZuN0NFIudZQOVsv37H3a5KGpZdGH/JuJcQQIhkbbJ/CbwL3aNCYLWPx9A?=
 =?us-ascii?Q?GoQAk1DwUigVkgaLMrdhtaWK0no/0B6XOVcMrIDAysSL3rfKR305pds+1l+S?=
 =?us-ascii?Q?tdELhja5k7ihZdyIogd2UKDo92Pi/VxrKkYyaAwKYxyKReDpec4QHV1ERm7s?=
 =?us-ascii?Q?o08BWmzz4G9acgbsUEkMi3AICrri1fWi2g5jClfBeuAgvzXo2PawGdq01LH8?=
 =?us-ascii?Q?eGzjjvF2pfd0vIv+Lw2zxOc4E0eY6oQJdLZ5rl43lNbPlU2x3KE00HMKo8fC?=
 =?us-ascii?Q?H4dSPQpuYqXtW869Wj7v7RYJyUShwuXRGyQ1jOFhI/pyhhlI7qp8yPFbxvQ6?=
 =?us-ascii?Q?HJw46kMzhSc6oBGqNrPFfRQO7Fxm0tIi1o/kw0fRDACeZCHFSd0/SKNnN/YI?=
 =?us-ascii?Q?xTOc+129sAy/1zdqxid9t+RNN7iBbPehaWnrHZ1SST3/iDfrGbhN8ZuO7TTZ?=
 =?us-ascii?Q?LpCJw66gjH83DeA4giTtM0ItouelE6WwBhcaS2s8AePELDw7NEVMpfSngpur?=
 =?us-ascii?Q?ZChzTfmy27eY4+KwTbbb/jUlHt/fPP3zMrixRrQBkvl/kwyt9hx2N4mGGyg6?=
 =?us-ascii?Q?mxPAk4nUUoLEr2iyrdehxMMuPNIjl7P0TP+DB+BvMvxRS0jw1j4/N2WmtapQ?=
 =?us-ascii?Q?eihCweZR2YuDfsaVuL3KdZyMBy+h5ZCi++i6kDBrFE0oMxYiP4P0r7C871C0?=
 =?us-ascii?Q?y37Mpk33hl9MTZFCNv3FPW/HhC20FJklzantKyxLfOLDotQHmuMPeT6tX/lU?=
 =?us-ascii?Q?JC97mezbW1Gjkm5pQ67g7v28CIviLW/SF93ZEx8k/dGJidhajMd662EX+iax?=
 =?us-ascii?Q?Hxn/NAOQLzMrHhiUcGYVaFkGXqjjuvFcquNoYFJbIUD05ggGkuMvlwxsENpD?=
 =?us-ascii?Q?lZKNitYOz8VQdEuqahAWTbwV0GKLLf7pGhVbLUlce/oIBk61N3RDHHKo/nHh?=
 =?us-ascii?Q?ezULyHucJvjjOTTtbp247bTYHcpTUBn1SGFhxWGxsMnzS8UsK9bNMfnD25AO?=
 =?us-ascii?Q?dkBvHNC6jNd5osgNw1IFs5+tqfAmr7cNRBEsi8RHGEqPhHou6BXYos44/a8G?=
 =?us-ascii?Q?RAk5NtAo6+W6n2rdqhahGe1VGvYwM9dAuMrTL7UaRi/s3xgoIm3MX9wdQlP8?=
 =?us-ascii?Q?5vP0vkdLtn0f8OhYEsFthcVI6ggUq0GlAYcegs2quCyYaZ3htXc+2LKYEtE9?=
 =?us-ascii?Q?z8tPneuVfwi2WNNAMo2MUbZ6RAfLQhVP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6614f0-e3bf-4076-9261-08da05934d23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 08:19:04.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDo16VhM/cn7quBOKoDlbzPhCs7aSoBc878+5RVh7A67zZu3oPYltbtEBTaxSXHcvLBrA+SAdknpJ8mTQlZs2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8091

On 11.03.2022 15:24, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 10:25:57AM +0100, Jan Beulich wrote:
>> Making adjustments to arbitrarily chosen values shouldn't require
>> auditing the code for possible derived numbers - such a change should
>> be doable in a single place, having an effect on all code depending on
>> that choice.
>>
>> For one make the TDCR write actually use APIC_DIVISOR. With the
>> necessary mask constant introduced, also use that in vLAPIC code. While
>> introducing the constant, drop APIC_TDR_DIV_TMBASE: The bit has been
>> undefined in halfway recent SDM and PM versions.
>>
>> And then introduce a constant tying together the scale used when
>> converting nanoseconds to bus clocks.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> I thought we have a generic "glue" macro, but I couldn't find one. Hence
>> I'm (ab)using _AC().
>=20
> I would be fine if you want to introduce something right in this
> commit to cover those needs, using _AC is not overly nice (or
> clear) IMO.

Hmm, I was rather hoping that you (or someone else) would point me
at what I thought I'm overlooking. If anything I'd likely clone
Linux'es __PASTE() (avoiding the leading underscores), but their
placement in linux/compiler_types.h seems pretty arbitrary and
hence not a good guideline for placement in our tree. To be honest
the only thing that would seem halfway consistent to me would be a
separate header, yet that seems somewhat overkill ... Or wait -
maybe xen/lib.h could be viewed as kind of suitable. Of course
there's then the immediate question of whether to make _AC() use
the new macro instead of open-coding it.

Jan


