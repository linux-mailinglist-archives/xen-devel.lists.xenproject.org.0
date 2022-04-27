Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE65118A0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 16:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315129.533517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiKR-00087v-7T; Wed, 27 Apr 2022 14:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315129.533517; Wed, 27 Apr 2022 14:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiKR-000850-3z; Wed, 27 Apr 2022 14:07:39 +0000
Received: by outflank-mailman (input) for mailman id 315129;
 Wed, 27 Apr 2022 14:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njiKP-00084o-E9
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 14:07:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63dcdb45-c633-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 16:07:36 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-3-qGGpmIM-uAlm0DW8e1bw-1; Wed, 27 Apr 2022 16:07:35 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8088.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 14:07:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 14:07:34 +0000
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
X-Inumbo-ID: 63dcdb45-c633-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651068456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fX2xapSIVLDWhfvYjgjQun4HG5R7CMqz5MySb6Y3TuU=;
	b=kAelnM7+rTVdLx2r2Ri8auwksjR308iG/uRzDJwHSrp3Wt9NE7/4wEGAZuG98l5NuBS92F
	vqJFo3QFohR92MYujOSI4w8BQOZ8vI9pu2t8D7qBuaXp92DqMD/ah1hOzVXZ+V7Wqdr3GW
	hDenwC6xe+E3H8He7N2kj+GTdjppJ2o=
X-MC-Unique: 3-qGGpmIM-uAlm0DW8e1bw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dymR0FWMzrUT+DN+tB4lO76A/UurR9ETi1Ey9+LaupAk/EJVRRVbImGl74Ggh2PScdRXZn6EE9Kx5mXXA0qnFC8zmqdmIjj/inINY2AcxjTBAQ9oNbG6R5VkyxkO7SXqSTS5mvsVQuWswTKwFwn3qyEfp3xIgj/jU5IOixNnEnsU/u1Fb6S3TCD3DjMLxs2nEMduHjGPgqt046xjkA9x03jwESY/dyDSgfLmdtax4HsM45E+IUcoB8/DOLf8eNJAJy/f7qFuXaJHQ+ojeXxT8EDmN3MNVJh/CV4r4qkEsQ/OpfW7FjhLUMTR3U1/vV+yPpQsIdLZWhKSERq23vvN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX2xapSIVLDWhfvYjgjQun4HG5R7CMqz5MySb6Y3TuU=;
 b=QUjA8SbnCszI9dSifgF4PykwGmEt0zZKoa08OiV4ZlGy/droR6uPXhxQjwBQ1R5HdDlP5uT19hMYPbdt2tfd44CAX8TF72S3knP2XvFE9BmmP5FLU+TMAfiJ8+5W79J3bXVVTx3F0rU2Tp4coMsxd5gggxXlAcZ2XeKxorjZinAQp4LuYXZ7KmrpleAbdhWoNcppm1C3o7Jrq71NYSKhlawYZWbzTLTaUNEbj1/SaN/CxZGn/8pu6lbsXkbsv+BeXq4JVSoyxyVQ6mLD3ki4A+9FAQwByrQy689I0BNWgvDYFJxi2NwZcB9+6dLUxA75A4KjWtG+yqNrS3D2ijVQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a3b482d-0ad2-bdf6-ccd9-176317cf8742@suse.com>
Date: Wed, 27 Apr 2022 16:07:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/mm: Remove unnecessary mfn_valid() call from
 get_page_from_l1e()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220427140400.20152-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427140400.20152-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c9cefa7-1412-470b-423a-08da28574690
X-MS-TrafficTypeDiagnostic: AS8PR04MB8088:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB80884D686739706C869E3F81B3FA9@AS8PR04MB8088.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	syM+9lEdJcCJjJ+MeefEuJT95QAab4ZzY/fg6qJEQO4AO1s0X1LgfBM3QR2qb2LgOgzgs7wnd8bRWfa2LeeYx8/mvzY3DChTqma0Vg0Sj1IsaHogff62qUMZN+biZrZh9ybJ6SPpvSD5jH6hMEtowFjaj15gKM/1/KdaxabhzY8IKpfoaHc3SpxdGKqXrjR+PJOSigPXvMXXdLW4qi+dRp0+yDZusRUHo1naEoZ8ZxSMLvwX63qw7wKdZ4zJIL1eg+IIaIQ54D/87hhygf7Paqw0b4mMdMVNmrZ/hleZPcMbySMfvOmDw9qRIeqHMzdtJmW1IPxMYDPgMcPDW2hJ1u1prdkrvh+KeUVH6y1uByptGtkJe75/65pYqrfROxqnGpcusUcN15jk6evGwhG9bgmvkDLoafpHD0TLYRayMFtr1gjMDpxXjhZUrROBNbEVPds30RE5UHbEEagfKeNlH13EMvKVslUyc1jfeUrwloPBdk5fj6tkS08nQkiuiW3MtTFtQZrAYiZBJExHHFQ8GTmDm6pFGx4Kx61BaTAc0VlJxbhD5FMvU5/Z6jr5q7pZ558+gIlk6012FhywhzsxEdPv35H21dXcTafKTja4O4iTfN4XfksSeKEmLMenxI6QYPyabzgwouWmD8zQkd21IuD4iv4WjUejwmAVc3BBiFViQ8r9ex/eLqwvHXP/85cCM0yBfwNHrainT8gdVqGLGGbJP8rJL0I5LYklQa1m3kA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(316002)(5660300002)(8936002)(186003)(38100700002)(4744005)(53546011)(6506007)(31686004)(66476007)(6486002)(6512007)(2616005)(31696002)(66556008)(6916009)(66946007)(8676002)(4326008)(86362001)(54906003)(26005)(508600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N21EMzl0NWYvZ1JxWEp0Z2c4T0tKNWJqTWdKdzV1TVkzc2F0cWU0UkFTVDB4?=
 =?utf-8?B?VVRsVU1sK2E1YmdKSjVCcWkwWW9VMUZaTTU2MHdNNVlqNC9vaVJWQVdRamdY?=
 =?utf-8?B?aHIzaGhSUzlKRDE5cXRiTDViTUFSRkJjazJyY2VUMW9qaFhrNVU5RDJrcFFS?=
 =?utf-8?B?ZVVPbi9SaG1NUC9aWUFXaTBNNE9xb0gyYjUwOEwvVWZaQXd5MXBKd0RheG92?=
 =?utf-8?B?SVpHV0JBKzJyR3F6OUdOcE5LUW5aQnBjd0VaNG4yay9LVEFubitLV24zNk5S?=
 =?utf-8?B?RDN2TmhnUTNIUUY1ZUxMZE9Ud1BYNnBiT3VSS0VSUDdWS21makFJN3UxZXBm?=
 =?utf-8?B?M1RzWlh4MTlJWW5jM2tJVDBvT3lmbUV4UzQ1QkNrL1NIMjgrMXcxbCs1aU1H?=
 =?utf-8?B?aEpXdHJEYUdBbFFROVdEVnBsUmp2Um8rejQzM2Q4WlI2RW14NitZck1yaE5k?=
 =?utf-8?B?cnArVGNpZHo4R3JOSFJ5QzhWMnduUDFkQ3BpZUhLOVB2SlB6cTlXaTFWM2lE?=
 =?utf-8?B?NUdKdVhBWXVqYVhCeTVTZjkvQnFmVEd3S3dYNHFFMDNtV1dMai9tUjExRnc1?=
 =?utf-8?B?YzB0Y0lBS2Y3c0g3SUhYQXRvR1FIYnI0akNqdUlHSWhFVmFYdkdkV3g5YXRF?=
 =?utf-8?B?dS91VFF6d3FYWHdkcW9iblhFcjBUdVdBTXErYk4xUUloNktjbmpDeU40NDc1?=
 =?utf-8?B?NUNuRlpscU5XNkFkcjJoa1Q5ZlkvU1NvVzIzZ3dzd21OTXIyR0NTOWRmZkZS?=
 =?utf-8?B?d282T2pZaVoyWWQ4Vjh0UDR5Q1plbFluSTBTRzd1aXplMkQ1MWNBM0xuVWg1?=
 =?utf-8?B?NldneHpOa2FiNjJrWS9uQ3RvSDF2SC9DTHBEUU12Mmk3ZktWMEZXS1NLbTln?=
 =?utf-8?B?bHhLZnRONmlXckU3eGVvcWlXeUI4U00zSERrYk83aGQ1bjhmSXk0WElnYlla?=
 =?utf-8?B?eXBiQjZmUHYzcGlBb1JVNTEzUnBjSTJPdkRDZHpabi85RWxqUlN1V29sUEtq?=
 =?utf-8?B?SnpLVzYxUFZnZnBNcVRsWUd2S3BELzBSRkFRR1ZMYytTYVMxOTMzaFZ5Ylpn?=
 =?utf-8?B?R2pxa2VqU3pWQ2ppUVV2bUUzWENGeFl1UjRtcXRJZmxWRmlxZFdWNGdqcmNU?=
 =?utf-8?B?TG5sUSt1ZFlMS094RGpqSUtaQkJ1WitGd2NtV2FMWXhTVkoyWUNLYVo5QzVz?=
 =?utf-8?B?WXJFelJYdGxpSm5PY2Y2YkRja1MvRENTZzBhRzR1Vlp3cVZhWFFYc1ZQWVR6?=
 =?utf-8?B?bmxnS0dPVE4xRE5WVlFuRXlBSTQwbzY0Yjh0THBNODN2ZURYbmp3MlkrOVVj?=
 =?utf-8?B?QWxDRGNGT3I5OTdqVGdKcWdqMmh3NXEwZy8rckJvZ2Zvbk56bUhMeGFxWGJU?=
 =?utf-8?B?eFNKNEhjdWx5VEFRVytyQ1doWWJ3dUk2dzF3azVrV2lFejZmcG1HR252eGpZ?=
 =?utf-8?B?RnE0VDdDMGFad1dydytYWlMzZXlnN1BxRDBINVE5ZkxYN0MyWGZzbzcwQ2Np?=
 =?utf-8?B?VWZJTWZ4OHVDV1l0Y3U0VU5VWUx4b0ljQTh6SDB6MFV4TnVkaGdlK2lvNlk5?=
 =?utf-8?B?RWFGeXRxd1NZM2lhWDhJRUlOeloxcnBrQjJwcjNRUzJpN0ZjVzFBNnBNcXNw?=
 =?utf-8?B?c1RNMm5KZGp2TU1TRlo2cEllbCsxeExKTjhWMm4wMS9ZZGhwbEVCOHIzOWVi?=
 =?utf-8?B?Y3dWU0JLYldNS0lkUVJ2d3hwSzd1U0hoenY0WW0vaWt2ZU90QXlnNExiRjBF?=
 =?utf-8?B?VW5IaDVSNnpDekFyT0tnQXFBVER3R0tIUk5RQldqRWw4R0xFV0lQWUhseFMz?=
 =?utf-8?B?Wi9xemd2c3NsZXM0dmx0Y2d3NWROOUIyNi9tcHZSVDkvSm1IR2kwZkNaNVps?=
 =?utf-8?B?QlBXVmRXUU5Qc3U1YTVFUFZ1TFhZRm82REhSM1ZDNUIyTmRpdkdkKzlpa09H?=
 =?utf-8?B?SjBOVE5ua04yak05L004N1BTaEltd1JlaDRCUDVrTU5hUzZuYm15SURqeU1l?=
 =?utf-8?B?djJ6T1FRL2dua1NpbitxV2g5akVlcGRldlBpcGVMVWRSUGRJazFNbDlDWUdI?=
 =?utf-8?B?Sks0NTQ5bmplQXo5SFdYSXlxMFVielNmS0xrcHpKN3M3bW9UQzhUYUdacUFx?=
 =?utf-8?B?RldsdTlxUDdqVXRyaFJReWk1WlIybHlvcG50TU02OUsrRWE2cWozZFozcC9T?=
 =?utf-8?B?Z2l1SHdyRW1WeDhlSlpoUVFnL1FHQisveTZ4RjUyamp0YXlpSExoVWdFY1BM?=
 =?utf-8?B?N3RHMm5DK0ZhSFVtbWhucTNnbkFVa2ZVRXZWWEhWVjduRlNHdUZjRDdKUGZt?=
 =?utf-8?B?blhhMkJmY0tvU0psTHZzS04rUHRyeGZ3aWE4dlVCUHBLZ3RLejNOZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9cefa7-1412-470b-423a-08da28574690
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 14:07:33.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eF0V7gBYmoeHyLBtUcwlS5N4aU0tratf6eLvQQVkKWNGkXFDvdUzOz9CLzhd65Q8FPmIHPJbrxxUY0QfSbJxzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8088

On 27.04.2022 16:04, Andrew Cooper wrote:
> mfn_valid() is not a trivially simple, and contains an evaluate_nospec() for
> speculative defence.  Avoid calling it redundantly, and just store the result
> of the first call.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


