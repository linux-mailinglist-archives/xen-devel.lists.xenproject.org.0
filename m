Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29A9450177
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 10:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225698.389789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYLV-0006Pv-Pi; Mon, 15 Nov 2021 09:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225698.389789; Mon, 15 Nov 2021 09:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYLV-0006Mw-Ly; Mon, 15 Nov 2021 09:32:13 +0000
Received: by outflank-mailman (input) for mailman id 225698;
 Mon, 15 Nov 2021 09:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmYLT-0006Mq-S3
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 09:32:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e86bedc1-45f6-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 10:32:10 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-nIJuQeKmN8ClCi9y3mP1wQ-1; Mon, 15 Nov 2021 10:32:09 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6417.eurprd04.prod.outlook.com (2603:10a6:208:174::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 09:32:07 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 09:32:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:48b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 09:32:07 +0000
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
X-Inumbo-ID: e86bedc1-45f6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636968730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qb5tMLNBw7yJc+UeDXNAH+2+uB8J/VPthYz38XTBLo8=;
	b=TJPVs72U5Aw+YOooJkAu8fSpRrjGsXMpyHSV/jXZShsktqDynxRetkMhquGqlYzRjY+jvU
	mxv4ZXYBWw5Te38wHBKGBMu+JhMGFu8A3W9TsG6vetrinVJH/PbTGSwBZQYNW1k3ZAMW+6
	UIpHNu9p3h6IymogGvc588lIHhCnpZg=
X-MC-Unique: nIJuQeKmN8ClCi9y3mP1wQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQjEbW0lf4onZ93YvC/8TgxoHOpV9yFUrQ2BqgXP9uKX3RnHhURE6JRfqmKyDWSwXpx6ZhXJL0S4SIM8yg48Upm52w/toPvyJlDMrl2IPxtGvGsCIcWdrVQe2ww9vEzxL61aXkNi8n7TgEl6A6TBjZLI38Kvd9sseF2TmSV/JNShz44bHsvTj9s3nPLnpcoR6otEbvmwujbhAPg4N6h8a4EkEtqOzhssEkrfdc4FiC/QAJdnzANH/to+xKRb8N8GDU0JzMNr0MnIlnVZENWNWLnSP8yngmuQRy03esg8yWIZbYPJHzl7aqkjDG8Fem7oeMSSXQ7NDDiaIQ2C8EiDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Job7ieNgwvUwTm0m7c1aETh397WehAUR0ctQs735lJ4=;
 b=l+vRE+FWlU5JYSaFpFlkJQuk939sVG+jAsDqKwgmfXvvn+YZ+OgE9l7pUMug4fTxB5A5DZ4oLdaevtAqUn5SiPnV5tbx67X7o1XECsR5AsFnIdCKv9/u2e6MJvRM/Y/piucZ1I1K+VAdSAJ9ehurn0n1S+gdQp8bzIjnj9PM2iPRuINTu/x8hiNGMWvdoiNrv0inxJWLWQoFG/QSxlkTKvUFl71Wx8rCA9mvh7exn7r9HrAWmgQQ58RQRhmNyuFPp6vv3LLEB6/xRENShRPg+YPvi1q+VwZ9wu9xRElXVgW/PEbcc44lUIcs/2M3zziTyBZ171ep9E9Y55ja89g5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d34fe38-6fed-5665-18dc-8e0999b5af2c@suse.com>
Date: Mon, 15 Nov 2021 10:32:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
 <YY5vMYpmqVJhqyL1@Air-de-Roger>
 <b640505d-96cd-3306-ae16-eceb9e528995@suse.com>
 <YY57tg+oX/fN7FB3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YY57tg+oX/fN7FB3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::10) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb4fd6a-a842-49e0-b620-08d9a81acabf
X-MS-TrafficTypeDiagnostic: AM0PR04MB6417:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6417CF4BE0ACA3107DC807DCB3989@AM0PR04MB6417.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XfS+o6spGLDdwwZ0DfKvmRVaY7TXoZ9I0/Z7Al8XlLCDDE8qT7lFGr5ReGoYiLP7irhr5IgbK3Moy5lWQCs47eo0r0kejWCmvA7drJMPum+Q1GWSjFMK0R7qJfdYNqLfm/k6EKhvgovDYD6N6HDdF7vYiaRhrf+D75UGbrpTuErGoKeSVo0BlM0dILXZl3xSFDL+Y2ZpMHE8qLb9FqgGNeH0918aqD8k/pflc5YEW7ycjlSO/IexTMIijdGACBlseMrny9e1c6Mpz6fqeHVqX8hsVVYFFXjtlINuxMFjo5J1rl9jjD8PYQ5ksiWd3a3oGgPiFqvsiP2rxQ4D9YeLp/d9SoepB9n38TacGcJR3xYdj/06kqMhm5oBMYpI9MZDCC9Y2qKT2ZVI8XiB+YOSbEd7o3hVt7fBkOoNM89UgZeFDm6d6l6V/YBQ6qp9liMShfYGYLnCHaSMwS6eNxpYFushTPKMHlE2GH9N5Rstg6tBD0RHowDvz9RJ65KwK9yYST9+P6h2LJV4AFXS+rhDhP3AlwV8rik3VX/96/D1tlcLRsmwVLvKK70DS588siaTFb7tsTd48XBHV7DvFb2JCunZ+ByQgux2HGuP/6k1jgYHJ1Ya0eAFC+l+P2pyqrI3nlRq4OF8o/gV1jLqsxNCBjEYu5hOw9pD3zbK9EzLt2DXNCY51I8Du2zCTbUQTYUXKGX5FU+IfsKGMQOmqnWM3BNMeljGusYIcLSMRYZpjUylkkkSr6zgqCpFm3SGoGRo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66476007)(31686004)(6486002)(8936002)(956004)(31696002)(4326008)(66556008)(2906002)(6916009)(26005)(53546011)(186003)(2616005)(38100700002)(8676002)(86362001)(508600001)(83380400001)(36756003)(5660300002)(16576012)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S70d5cJMWmRuly364Fr9drNWVlDiPGO5NwhV0Msz4EYQkqDsxOX6u+VGuU3p?=
 =?us-ascii?Q?9z8ljeSx8tXMBbEmkIDdw549IHVRI2LOnuz+2LstgAnsJ8n+peJzRTRtfUKx?=
 =?us-ascii?Q?QMRsol8u96nCVzcvgu0gpsVkuTRgOVlNOMXrhLAJ0wT/kredLa0XNOU2Lpdm?=
 =?us-ascii?Q?uey+oSIffSLmpBSs1B4B4sSxCcYqmdyP4lwOsoaSbcUy2MXHveCHAorMd/OO?=
 =?us-ascii?Q?gyTLopMAJTJK+wbOpj0B9P3Cn+src8RrY8mXMfxBtJu8leTmTtpM3/uQ+cwV?=
 =?us-ascii?Q?DxMa6boJO0x3gXV+aZXe9LrLVFZhfc/VdYczLKDd93DGLGXVXBbnUsDurraz?=
 =?us-ascii?Q?69uXaqEABfK/zmc0swg/Aen0cI5gUOYSJ0JARQPOIEMwrbTmdU0SIu9Uh6c2?=
 =?us-ascii?Q?NHXGO1890ci/OMIaqwK8RsoCPshby4j7/rpg+fScCIEqAtk6ad6XV7lezVkc?=
 =?us-ascii?Q?LEsjkTJebUh3RMBhI7WbfLe9jy+yvCQy276PQddHldeZFBU9qNsQT3eUwxgv?=
 =?us-ascii?Q?hGk6AFuoHi30hm9mF3sM2Q6EcO57vHRyPaL+ix1NsqUfRNcw9MxTiMoOowjD?=
 =?us-ascii?Q?Ajx3llv73o9ykuYuKyj/SNYJGuOfYp4cK2gfM+XH/cCsduP4n9sauVY6sk3A?=
 =?us-ascii?Q?ESS1evsWEe0EqihTmdXqAKPgqPFqJ0zTTmdOne3a5rRU5i4NNXOslhUl/7mM?=
 =?us-ascii?Q?wgIKOBEUeSUCjd5X2SAcg8OTBhwWGDRrRX9X/+F/e3kxJ++/lSd5Z5ogIRCq?=
 =?us-ascii?Q?ABEhM+R+4ytIcsFDtbTgrjr38xFeXgG1y6FHZTrqoDn///onzokEkkRnjX+7?=
 =?us-ascii?Q?dPAJeMqq5l1RDmIducQBfI73DiiYP5YcXoqvSlCFNttFy2lzw5wHp47KMFRM?=
 =?us-ascii?Q?ZMNP2vYiAOTp8ZiCR0BZuuzy+8RYhp39paKZzL7xGtra5aaCphuE2hXzVgV1?=
 =?us-ascii?Q?cbi/EXRK3K+Lyogc6lE0ffy5WJRUB3u2nhTCODJ6BspI/JS4KOpv500OOxWu?=
 =?us-ascii?Q?kB0qxxzZvABcgZl5MIrirsIgydGMvXqm6Xr52uG3zADZ2DvQmna/iap+GyvH?=
 =?us-ascii?Q?w7F1SAQg6fn0eeOjJJIwSxjGn098XntB8tJ09gzIfnCcfxwDZUI5g3FNCAbK?=
 =?us-ascii?Q?spGxckQPpC24O64/ZFdt2fR/hfAy7Csz/r9QRov3AfVlH8LJN+opk0xnY8pX?=
 =?us-ascii?Q?i3MKSUkGQEusLg4hdSJUVKHxkKt00vFwZSpCM9BB56Hs9sNN2rLKwjntyjyw?=
 =?us-ascii?Q?ikZWiR2y7YNO/OWgyyt1EYHwAgpDume+Ebe2kzfxRUi+pdekknkw2/B25Fj/?=
 =?us-ascii?Q?vxG0bTwAaczESb7W2FvjKqOxxNHXLcl9QUGykbUQDYCDrn5E7MjAJwHxtjCZ?=
 =?us-ascii?Q?Iruq6vVtTpNz7yczHp8wn6o7TQBtaq4KvTm0kIZN4+e2JE6LORMomEmvfdUj?=
 =?us-ascii?Q?EKGalgtrjFV/QckHngP4ZXJUik1DSIITWdsDKedUWkb1SFjvw32E3ZaUWYHD?=
 =?us-ascii?Q?SIfCWuteAW77pDrZ5386sUI0MRLpwp3YxkQ2fPXte30+jBuE6P5BV0nhPI/e?=
 =?us-ascii?Q?/AFJ5XbToMVQYob9m1DAmUpU1tGWVlcgPQrAnuxGVr2Lz8CDCPcu6n78bG3c?=
 =?us-ascii?Q?A/qENyrfz4/G7d7G4L+Qdn8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb4fd6a-a842-49e0-b620-08d9a81acabf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:32:07.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8Jn+RonzERnUOp4v2hCQOS8MtEceFFOT1eIJiyPYOioQoXfKTM9Kjr8Mlpgf5z66i7DITb/AQQ1f+xU6Qi9aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6417

On 12.11.2021 15:35, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 12, 2021 at 02:45:14PM +0100, Jan Beulich wrote:
>> On 12.11.2021 14:42, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Nov 12, 2021 at 10:48:43AM +0100, Jan Beulich wrote:
>>>> While domain_context_mapping() invokes domain_context_unmap() in a sub=
-
>>>> case of handling DEV_TYPE_PCI when encountering an error, thus avoidin=
g
>>>> a leak, individual calls to domain_context_mapping_one() aren't
>>>> similarly covered. Such a leak might persist until domain destruction.
>>>> Leverage that these cases can be recognized by pdev being non-NULL.
>>>
>>> Would it help to place the domid cleanup in domain_context_unmap_one,
>>> as that would then cover calls from domain_context_unmap and the
>>> failure path in domain_context_mapping_one.
>>
>> I don't think that would work (without further convolution), because of
>> the up to 3 successive calls in DEV_TYPE_PCI handling. Cleanup may happe=
n
>> only on the first map's error path or after the last unmap.
>=20
> Hm, I see. And AFAICT that's because some devices that get assigned to
> a guest iommu context are not actually assigned to the guest (ie:
> pdev->domain doesn't get set, neither the device is added to the
> per-domain list), which makes them invisible to
> any_pdev_behind_iommu.
>=20
> I dislike that the domid is added in domain_context_mapping_one, while
> the cleanup is not done in domain_context_unmap_one, and that some
> devices context could be using the domain id without being assigned to
> the domain.

This all isn't really pretty, is it? As Andrew has been saying (I think
more than once), ideally we'd rewrite IOMMU code from scratch. But I
don't see anyone having enough spare time to actually do so ...

Jan


