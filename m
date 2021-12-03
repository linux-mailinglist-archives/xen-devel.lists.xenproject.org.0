Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4B4676F4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237474.411867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Gs-0001uT-DF; Fri, 03 Dec 2021 12:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237474.411867; Fri, 03 Dec 2021 12:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Gs-0001sD-AB; Fri, 03 Dec 2021 12:02:34 +0000
Received: by outflank-mailman (input) for mailman id 237474;
 Fri, 03 Dec 2021 12:02:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7Gr-0001j7-94
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:02:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e54fe0ba-5430-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 13:02:32 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-7QzOhWvPPaqZ02oowxjW6A-1; Fri, 03 Dec 2021 13:02:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 12:02:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:02:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0057.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 12:02:29 +0000
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
X-Inumbo-ID: e54fe0ba-5430-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638532952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XwL1PPN+OeXKousOQd5DQY904fspE25C/YY29dKe/go=;
	b=C4Qyxrye/t1DMGdoYH2bb8rtP5u168gAYxer0u+MTwiZ+p9tMs3Yu/VdDQgDY1lIinIRJV
	F5wuGXi+QcMJe4AUOKB5/HdxE16/9TeMfD04+7dpC7+ZJiGyMSlhBZ8CWSpATUivVzgZJu
	KaP7R3xXzKKmA8j+2hv5BDDJv3ZaEEg=
X-MC-Unique: 7QzOhWvPPaqZ02oowxjW6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz6yOPcBJe7L9xsSS8sQTlyUWMLuFAk9t51j2B3e6LK0YcY2McQdxPIz7+xVnVGyga3pSSEiv/PspsT44gQLSqcvgdiMEArrw4sv5SN4bRFyrU1Nw5hTrXuNtGQ+mB65++SP1mrVX4GrmIHNe7sPI0OWiVpjtozUMDk/L+QyAOd4/1pP76A/GMIJhhy80vastLxru6iQ3Hdo2ZAbdEY6+LEaXVf1rlibvO0pBp2JDFjsO6Gyg2yNW9IoB528gFCJwv9d8qb7s50SHXknryVrcS31q+8oaakT49DiocAn3ZXSRZe4FihihMyqHeIf+oK5QA+DgufEOeDJ+uJsjSxxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZwSn5ClLjz4JbfN8SDAIvbVfOtrJs/h4s8ZhYOz1jQ=;
 b=BNJoUgpamKqzP5ZqTmYar/2Jw3reJSN6FzSGaQA+TIRGVTIm9WWfMT4bvMe63llzI25BF3nGPpW7kJm6vqLIqAZE9cElp9IJO3aSTuIt0GZXAA5L7nsJwmUQH3XLdH7yRmMdhFhNQ/zNVr6aVeiP2JnjwG+pp0gwmp8YKR3khZMm+2Ql9gqSwd7sY8N46riBN67G/q29dFbo9Sufz2P1cXZZEmVvMpY/6oA7KCdqehTmAAn4vCUpd4FcppewybOoTQfbYEUoVpVQ3kdt6xPuuqyBQKUWC8n8iOs/YNcPLy+kKti4q8AiOTSSMNXm3WvuyNoZKWhY2OoP8pgHYR/eWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
Date: Fri, 3 Dec 2021 13:02:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] perfc: assorted adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0057.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdf33a9-a14b-481e-6ac1-08d9b654c7e2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33898DBC7622AC9C15BB6301B36A9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o1Rqtmky/acIg6IFWVpC2i0SGS3xU2sGuPrdUTfSYYAO6CQUVgNYe0YTSrkHBdtGtUMM2Tv7K5Ft17P6uKwFf1yt4au9DI3ZN1ICvfAamrvpIQ0yQZVQVOKzNdCh3vCLzkmv+HAxxByQ7evZbs4M/l6bz8irXtjk/pGUSVBAC6aLG/ZVm4nywbDCgBNYulZ7aEaiN5SLWnduBPGAwFC5NluUamWmBbqQnLykKwDT7TbCX4eaW9P3Tu5mwHnkGs1NHJzkN7f3msMNfiVhfVaz9hMh6fa+QfYyjK0djIYl1mLryc0xyf/1IrrIZP3DERVK5ScEZfxCHVfza67ixWyPWHA1mGFYgT4e+/y5bdhQGkbiZ9bzMlwb9VRdDdQFNv7SBpr18W/q5e7QnxEI6M1AE8qURZYzH9PhjA+hQqdJLyRH7MECNKxOc3ErVx0TYSwiUY1HUSr6bA/eD42YmIO7+pqutjIvg8jFAbaKvPnxDdkMxCCl5KyT8xTKR8lLPdz4moR5hHlouNDJjgz8b7IIZgMNd97zJ7tDOmjx1hJCtYEkvZxnRutmCNJGG2yePqmBxqMprf69hN0VH2JKWbJQ40P5qEMuEnlbSZc5fZ3NbIIUZJPsqhTX9ybhi9L7ndZ8ILbto7N2V67ks5Ef3anqTEgmPuNJOVOyRw3yUWqYsxtFFUhyZt/KxvM5J+nX8YYJvVCVhyVBsxQWEv3rZqhyQwFJF+n6LGpoocdq8F02w1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66476007)(54906003)(66946007)(66556008)(8676002)(508600001)(316002)(38100700002)(5660300002)(186003)(16576012)(8936002)(26005)(2616005)(956004)(4744005)(31686004)(31696002)(4326008)(86362001)(2906002)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rSP6t1V4hTjqw5ieJE6hn5PGwtwmNw1YsNZuA7RHld2AtcjWEH1XaCxF0cyN?=
 =?us-ascii?Q?62D6jU/5unMFFKPuBjmmE3IMvxbLztDrRIAp0QhjdvTpiAZ+w2RWQWF4eA5A?=
 =?us-ascii?Q?E7lOptSVzA4p2evck6Cflsd0VaMXQ+Fi35Lwdmxpg/RLWE8h5J6kj7KC8+lA?=
 =?us-ascii?Q?/K8fGOplVApUPI0Wr2DgKd4t8Lfn+Qm77KMiU7TAaQIrXeG5Ko+v8otlL04V?=
 =?us-ascii?Q?q2dzjeQedmNgcloMCbH6UoolEQDhJk1nbxAi/SXh1L6jpdeq1gTZ+Bqgicj3?=
 =?us-ascii?Q?wtd9m7rrvtKxRwGn0RAoXFg+E8IlzOKEZHYJOSGoSKvqlL6WgoXuGFS4BArK?=
 =?us-ascii?Q?gY6wHEr0XUAMGMiO6wD3AkTfKXlsyxESj0Zx1960lJG+otjzd/l277dlROtB?=
 =?us-ascii?Q?3kQp3OLDoP8+apT+BPI+gqdZshqbId/7viQD3ef9ayxolS13eQVX80WdlN/a?=
 =?us-ascii?Q?Y08eLPlFN3z/Je0vWSzeAQouHtNpv0sG02vB6O++fOPeHHPphl7+H1eWfNm5?=
 =?us-ascii?Q?2oWf/K4I12Sb8jDFk9fFLaCjnNmBkdLlVpAofVfX8SszvtCqSgoAmAfQliI/?=
 =?us-ascii?Q?bWQcfwOJST3+W4hAMVj1AveiyxucW3aFxiFrSZzhlerSTJtYVtLOaHD/n1Q/?=
 =?us-ascii?Q?nDhj+DpViibM/XXMrvsS4/7V+VmH2a3c4zHpFJGohkmkgyhTQpdaDCg55frn?=
 =?us-ascii?Q?NY5GGzTMNd1QYTO3owZ3M5xTuYhjeHqDdhHHk5kFnRw1WPZqa4ul1YV53PER?=
 =?us-ascii?Q?s9STQWNoIjN2OiaTnRJ4/mTPz01EWOOpr77oGrOeN4btBUqb3n6qpUOBfS8n?=
 =?us-ascii?Q?weSFz717xkMkHOlilXRmjiKxZ+Fhpowv5uAlr1uAVT0tEla0/o4AoO2Yt96k?=
 =?us-ascii?Q?QSwBvaDhv35gabZEmQuOxnA5jjwkXRZvklT6njAEAoWbqLX6NjnTAob/Jerh?=
 =?us-ascii?Q?kS8+sLnGK/QrdKNRr74pkUtXJorZQt5zIeEHmDqfivoJAxm8uYDsWfGj2sQ2?=
 =?us-ascii?Q?nMBdtz7FkqGzzM4cvD8pWqzoROCe4uBaYnX+uEYm0834NFc+yjEnsB2tvOF6?=
 =?us-ascii?Q?R//sgQYNSlFK6dEH8i1DVo8+EAS+DgYY9pzlgNDq3bOkcPipcXxPHG+Tl/hU?=
 =?us-ascii?Q?VYi6s16Gg+KrAj0rq+j571UVuTHR3y/IFbAbZeSLQTwvEsZJuHlX0Ragdoe2?=
 =?us-ascii?Q?39aCIdA5jjbsMbL+JpCCeFM66hG09QpMNkcFbFRh1EMpSCkoJdBAVGu+2lCH?=
 =?us-ascii?Q?q4/7FxN9ksp5JgCKhs/Jcw/wBayJrMNEMWwKtkrMowix0E+9HqZAmK9Fc0qt?=
 =?us-ascii?Q?bbd7dys65QahbOU74vOuH4xsD90/AvguqIGju6QuaDTVRm/Ev2axGTdwoQPS?=
 =?us-ascii?Q?m3n60U5qz35hIWLr1YFFG1CCnawBacMAJAh7fI8LAtEvm1NoTAKhzHIvCtXX?=
 =?us-ascii?Q?WWIQSnOtGMv3RJqzseFxhJtmUmYNeuCNizeLu2DVBRiE5pd6HGYRnY3gMCIH?=
 =?us-ascii?Q?g2g5pCXVW/ofBWDFLWmGmr8x+Oy0LIN3P2nh3r218g9KE9bt/GvHRYaFlTc5?=
 =?us-ascii?Q?7250cgbvG20qzcgnr97REFUwrNrLNvSVgeragS5wFhCZPmiFFmfDdLe8Vset?=
 =?us-ascii?Q?bz5JMPvOku4yHbSdoVzThDs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdf33a9-a14b-481e-6ac1-08d9b654c7e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:02:29.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGmiJfl1IIdbg5BXYDWfI6e1uFLi6Ug6qLlOe95DZV7YG1Sp9lrX/gFXjB8ICVY8Iyc4yclG+OLxtQ0qWsOuzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

Addressing some observations made while reviewing other patches. I'm
including the last patch here despite it largely duplicating one that
J=C3=BCrgen did submit - there's one extra adjustment plus an open question
there.

1: perfc: conditionalize credit/credit2 counters
2: x86/perfc: conditionalize HVM and shadow counters
3: VMX: sync VM-exit perf counters with known VM-exit reasons
4: SVM: sync VM-exit perf counters with known VM-exit reasons
5: xenperf: name "newer" hypercalls

Jan


