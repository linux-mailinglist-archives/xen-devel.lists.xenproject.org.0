Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA5852EC78
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334105.558079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1zy-0005UW-LS; Fri, 20 May 2022 12:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334105.558079; Fri, 20 May 2022 12:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1zy-0005Si-HM; Fri, 20 May 2022 12:44:54 +0000
Received: by outflank-mailman (input) for mailman id 334105;
 Fri, 20 May 2022 12:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns1zw-0005Sc-Fd
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:44:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d75733-d83a-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 14:44:51 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-DCDIeMV0MYqPUcGkQQbvJQ-1; Fri, 20 May 2022 14:44:49 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3939.eurprd04.prod.outlook.com (2603:10a6:208:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 12:44:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 12:44:47 +0000
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
X-Inumbo-ID: a3d75733-d83a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653050690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vOAws/wsV/QYxvOOqHizxZvbK5vPT37ezCSxJrWLu8o=;
	b=VlBVtw+l4OqJi69zh067H6Gk+kK+4Nar537FliLzwkl8lMWqohc0H8FucXk4wEwERaKTsG
	1B6uo1jRv+Hl7CCmHsXReOdYUnzt7qO3OS4vUcsssu2assNOLBtIgVfn9yaLSKA9SdUDAA
	DN5gPHtTfFYxg9wajl7bsAJwFE8FaPE=
X-MC-Unique: DCDIeMV0MYqPUcGkQQbvJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SovPfNRLfZvgDo4Oye7nLSy3au27lWEsvpmC+U0jKxcVc4/ePl8e9QoBvsxd0pXlLc9DPmFZnZWXYfEUis0C4o9HkS8jaYCyyYGzdRaqy38b4nIgybPF7JaHxSGimmyJELoxbImfHVYSMeAO7GpwdOEbh3e5/mvMRAtHOW+XxZAo0qb4KyxYgEKQ4gaHcUPwhOLbd5lWeV2Nt0OyUiV9nU2I0I6iD+kIoyHCvXhuw8Se8DkDgT6HHW3EDNym5XJ3+fJTuAGs2gWqC8JlVldN56N2LQhy9UWzWYyU1v18OAr83hOhk5VwDq3vD4OxVZ+C/Url6c+o61DxH45FRhrhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHuxhy7yweiZSN67XVLHur0kY5HDi7JRRSlgZscP/k4=;
 b=Tr3bRj52O7m4xvos3dOlRVZalqcaPddYT3lu/k28KCp675EuSihrjL7jA6yrDfg1Zp8i2lWSIYRk+f487sI08yulCHmzReU/dwWruAhAsKkds55Tegwu+MVzKZY9V/3vLDI5pK+O94G3mpTAmz2NrQnx6s+ckWDmypby5LignEFKti4QYDYFeYoWZm/PCsbpwErXJZd5TBPVHx1cSWCaYFisZLw6TfuP6FE8qjuyrHJCca93udmiLPwl6KJ2CfCU9qH01iefxuU4C+/mXKnbt6hPYrQC+jzbdtlYr4Lg9a54XfeWR8xOWFeW+cYbhQJb/HXVOcnOmA2vadBHeCwlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29616926-abcb-1fea-740e-a7b938c8befc@suse.com>
Date: Fri, 20 May 2022 14:44:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Grant operation batching
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>
References: <YobRWXY/xVli4UUf@itl-email>
 <dcf54bdb-e588-430d-e2db-30b6fd4280b7@suse.com> <YoeLhszyuyhM9Rus@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoeLhszyuyhM9Rus@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7d731db-2c37-4f03-dda5-08da3a5e861d
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3939:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3939AB3C8F954571F781283FB3D39@AM0PR0402MB3939.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y208dbip6asa6fR+5roHgk5q+SKcNv/hvNGQTNToa5ojtlZAu/3sjT8lnP1niZtHjL8H/5NGpFW/gpJ+JL2fN8v/erPKEyTdPwmlGaWE6rAI1rHlQmq9Y/hf18Y2i87Jy281eCBDmrY7YIg6sSYcWi0+H8LeYZF9wBGg19PMgqQh0KCDSbvBK6RfdG0xFstIoeU5OyTJaYNqZ7vTLKXIxRbrWWkz1/fjAfoaVGJGgt0U+eBjwBRTsSuYd+jZO70idHhUgLEP/MhIITYd0a8KmR7m7edjXJHpGIMLqfjX55KJEy8z56H2ZOJpLSowpWEbzmRqkDs4MgEXlg+aJPIGUK4+bG3n2BB+PPdbRSqW4I+SxWZQY/jw85cWIK9f6ltMN93uOziLd9eFe/PNSgfSIt3hqTJCgMiXLzcR1s/wYT+L8oW3Uh2s+T1bXO0zFmubeWDDlzIvTeHD88yuYJ6w//vrdvsBWx45y/8EnLPys35JQo/woVEpIt92P/JTE5m7P0456wKofPcUEFmRkv58pUDTWL5mjvSJbjZq1MRr/8Ubz76yVF6sIh5SmwAS+tNxQPweW5DYFFO/munf5SnBUAifBDrFjbPbbWjRx+N1cyAR40vs1XMeYs20BHbDxHP6YxcU8SETSeLph7xA4swUFYrlnngDL2mo3UkKp2wsEk2QWVNaxp4YnR5vrUjeY4oZ7hExt46xMYo4S25tv8xe8aPexgxnDHJAvPYKOPNw76FXXPfoGfIwwFWqrp1/66ha
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(186003)(316002)(6916009)(2906002)(6486002)(36756003)(31686004)(38100700002)(26005)(7116003)(8676002)(4326008)(2616005)(66946007)(86362001)(6512007)(31696002)(66556008)(5660300002)(8936002)(6506007)(3480700007)(508600001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bB5fmBqx25Tc0Ex/1ywyVSkxTyljvbsgOSIrLHntVS97NN2KIsCL5tpUNdem?=
 =?us-ascii?Q?ulm6gsn0daU7a8Br+d+AIIi3zDQOFgmo6FmrT/Vhr0xM30qRURh5zBdQL7nA?=
 =?us-ascii?Q?z2YfuVo6UFnIaADCkNjQXl70G9ugbKnBHE/LQa98ZDLcwxGOXp+QtW3qCSpM?=
 =?us-ascii?Q?afngHo+LnjsDJ8TexEvwEwLVQQ4VrAXb+sc27FyTf3OyhqRtMRU+9OWjfQbN?=
 =?us-ascii?Q?5dFdTlRg4aW8WtV7oGihh0lo4hTH2mjne6jmBFCFXJ1NQVP+gxbgZU6JpJ3s?=
 =?us-ascii?Q?305z05rx94J+xtlyp+hZBYZk79iT6AAYmM3lRW716KLBHaY6NThTs84Pgjla?=
 =?us-ascii?Q?y/zvNzK88rldIGcRFEWjvDDrtPR8EL6nju4H31l9+nM0QaPEq6tRNhqmSJCG?=
 =?us-ascii?Q?PGLoLqHTGyNuD9QPcfj8x9CwFy4PNRYSjwd+7ePTNT7VdidWKG/lRe76tZ92?=
 =?us-ascii?Q?P6vtojSC0CdG7jycSt3IQGY94+0XdLYEpbNzMtO4VvFwEyTNI7kYkIeSNHww?=
 =?us-ascii?Q?/EPM4ivFaWMRSk4NNd2wQGSwlX8unZ+SPLZhw9k/8spQLiYvagGHU0rvKa0E?=
 =?us-ascii?Q?KPmXRBcILJb0FRastUXhcRekcZaoOtXjvNBtG2D6Xx9/ScLpfqlV++tjM0aC?=
 =?us-ascii?Q?kPiplrZMHA/t7v4ryo61tuRA767SGshe+e7LYnDyz40jHUva9EmhrO+bHEnK?=
 =?us-ascii?Q?LA03+3ISEvmFy4qCwhGCQi5KoACyWu4tkZo8n7O9P225IobmRUrDhugxqNWp?=
 =?us-ascii?Q?tG/Ab+BvBLXWdgIezVhafhHVBAEQzzN/YFIahipUeYwWAQD2Mc2NhEq75W/E?=
 =?us-ascii?Q?+qsHbe7rJo06ghp0C/1FSvy4UYOasuOvfPmeMq4uF7+TF7Bk6mtRTkMh4/up?=
 =?us-ascii?Q?fWjIYsbAmEpx+D3Om1PXHkJx30+f+3Y50z7lLXuka1HbiN1qHoaQPA8jrnnk?=
 =?us-ascii?Q?cfPexupQ8JOPRXAQ2mxLSJ+aD+60asY5gDGbXbWovSACWj4i365/kjqnnON5?=
 =?us-ascii?Q?0WykxeLTqO42qnxDSsxyuts+tSbEMBSkXzvC6wKyAME4A6llIXVPY9yGN674?=
 =?us-ascii?Q?aP1tyCFlPTLGfVg6o2/x8uBjTk/iobQcsIzrnDpzK6Mnp++oyt+0VyYdoDtC?=
 =?us-ascii?Q?lMJEgcKRGeewtfGcFnnqNa4ADsrljxy+CDK+0pCn9TjPHcaFRl5dkdJWo3Kb?=
 =?us-ascii?Q?JRIb1//jk9V1kZ9OtpBFZgQB0nE2By8Lc3Q35O7vWvQScUPGehCejtgnOQF+?=
 =?us-ascii?Q?UFEik673gvnVL/QEkkFN6aSdSMNg0kRplSX8pTNLrfReB21CWwyhNQdSpPeR?=
 =?us-ascii?Q?PTisDSpjc7MkSqyLJXDdtM+zJ25OpM2czbcOoasuI2S21MWTTsHg3os7ohKF?=
 =?us-ascii?Q?jkhNb6JOcXFPeOjeECJtGFsT+OmEKEcz7B7EpE3rKcvjms/v4kyjsd9ffpeM?=
 =?us-ascii?Q?SIcNLQoLn1qZV5QL8+rssFaetpzCQpKcP8LPjrfbJ1+fsdIRXbnPsb7TCEuf?=
 =?us-ascii?Q?7JPUp8/J1fvU9WHO4sWdXaOSPjpvthjcWhH5Xlm6L+jSNvq0ft/6RpTQT9Ad?=
 =?us-ascii?Q?Mnb05r7vp28KVlbVn9r2LIzw6bV8034kTCEEazf2oHdKxt44dLPUIGrvsBil?=
 =?us-ascii?Q?rPjCzl2Wm/++/Z6PFD9BTuOT4VzDxSDij7y81XshfpnJG8Cl163zWJe1mFP0?=
 =?us-ascii?Q?FO0QGCW0OppJlHji9VKgwH78v33mqLlUdTuLqEm4mzcS1HKNRZIf8++h+nSJ?=
 =?us-ascii?Q?0PcznRVpLg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d731db-2c37-4f03-dda5-08da3a5e861d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:44:47.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcenXoNDNp0ywAS485SypeKnb3WBRbttZGJVt6wiXsNfzMLY4uK3n4Z0qNH9kZOkj7F3tf11chUchhWDgJPnDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3939

On 20.05.2022 14:37, Demi Marie Obenour wrote:
> On Fri, May 20, 2022 at 08:24:48AM +0200, Jan Beulich wrote:
>> On 20.05.2022 01:22, Demi Marie Obenour wrote:
>>> It is well known that mapping and unmapping grants is expensive, which
>>> is why blkback has persistent grants.  Could this cost be mitigated by
>>> batching, and if it was, would it affect the tradeoff of memcpy() vs
>>> grant table operations?
>>
>> Which backend driver are you thinking about? The in-kernel Linux
>> xen-blkback already batches grant operations, afaics. Such
>> batching is helpful, but the main cost is assumed (known?) to be
>> with the (installing and) tearing down of the actual mappings of
>> the guest pages (into/)from backend address space.
>=20
> My thought was that the expensive part of this is TLB flushes, which are
> only needed once per batch.

Correct, but as said - such batching is already being made use of by
the in-kernel Linux backend. Of course "once per batch" is not entirely
precise - very large batches would be split internally into smaller
chunks, each of which would be followed by a TLB flush.

>  Also, what do you think about the =E2=80=9Cunsafe=E2=80=9D
> mode?  It would only be unsafe if the backend is untrusted, but it is
> quite common for the backend to be trusted.

Well, I didn't put much thought into that (and hence intentionally
didn't comment on it), so for now it's only "Why not?"

Jan


