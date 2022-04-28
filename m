Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA44751396F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 18:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316687.535671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk6kP-0001yJ-0C; Thu, 28 Apr 2022 16:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316687.535671; Thu, 28 Apr 2022 16:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk6kO-0001wG-TB; Thu, 28 Apr 2022 16:12:04 +0000
Received: by outflank-mailman (input) for mailman id 316687;
 Thu, 28 Apr 2022 16:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nk6kN-0001wA-68
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 16:12:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec4a1bd7-c70d-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 18:11:55 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-nHhje7pSOlCQmclBwrVyVg-1; Thu, 28 Apr 2022 18:12:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4753.eurprd04.prod.outlook.com (2603:10a6:208:c2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 16:11:58 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 16:11:58 +0000
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
X-Inumbo-ID: ec4a1bd7-c70d-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651162321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pWQ8sl50bGczjzwPUI2eQhwcUqWGZpu0wy1+0ahT7g=;
	b=hpW/KlzwpDsN9vZpDbd3cy3NTUQc9/7lSUgutKJ1w6VKZdncgySsm/qCCYRzYkMei0K25g
	I/La8aRE5xYkWleaxyrSkrWat2F03e436ai+crUfslsc6gobAr8yZliZp/MNNKpB6AbQjn
	SqyDIsEBZnAVFCbKDGR3fn2ttkewQ8Y=
X-MC-Unique: nHhje7pSOlCQmclBwrVyVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N85UBAU0JgoEh3IDXl2koyOVvqJcMVysMsiRL9iM6oGfZGZX9W+TktVViiSCs7BozrAbHNX1XyikJWVskuuo5FpPJLMRvqftZ80jEaia+Oe1zoEJcW1ruOOpjgsLNVluleNx6+xddWt9X1JMoVWChS+GysgYK+yDth46WOlbUDaSuCAzJX8eustAbh2TfO9P6jkN67BLOxWY9uGBPE4OrcddX0AWCyAT1w21btqxjQeZgMT7eYZ5xtNDwea/7HSAMTpWQg05StEUa8MJ2TgTbqtiWH9aK5H/shbW0HIn3VPM3GYg22MAFrOlRaMw0tHvHrvP7DDjhKTOC+sU/6th2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaPDVnSXappEMMzZTDMOrxrg6wKA8NC0+9iz9XAOuzc=;
 b=cfqGBAOwmcEYyRby48+jp6RPw1f8rt9a0Bmf7Qt/h3Qyup/FRAwAbMKGoWQt212Gz8x22SjjpTmfBdkqT+w0EXr7sc9uPWAMR9334fCqS9L6bq3QNWqfn1fUQbHrwEogV6JtEoSAus2ZMAD4Hu0SoIiyULK653RQ7z0FCqhnYa6e0QVm8wtx1Jco43Lqb0BvG1SFS78T6JKn1nOPsPgquQn6p5poSFgM3GMv1+XarL8jpsoz5GdiFBLBxgcNblIsz4OUC9/Buv8Q5xgOOWeJZIFk3gFumhA9PTnwLjgM9LRoNH/AeW6z1crvtj4OkFOHHncbqsd4Pe+AKX/ZzjpeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <228903dd-0878-ae24-33a7-228059c290ef@suse.com>
Date: Thu, 28 Apr 2022 18:11:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 on top of SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427104718.81342-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0105.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::46) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf4cc1b-65db-451c-6a0e-08da2931d252
X-MS-TrafficTypeDiagnostic: AM0PR04MB4753:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4753A3C8D4460E1F10630157B3FD9@AM0PR04MB4753.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tBzqd/Ldqcbwu3EymzwMCBAVIBb89vdnHF1jvn9j16X+zdn6YysqZydu/rkYfCZptDn2N/I0A3po3jsOvRDUAJht5ToZts9De8otb37/zmr7tJF7JC7UHbLwQYWCATk+XnX/mqETt2y1i2vxGAs5qQxGL6lYwKj4HoDQm30anI69ng8tDvZ6YfBoXfTLOG2UjF4zgXB5S88AeUV6aNtXVg+j1urOG06QQoS4o7kYyZ7etC1vXVCTLfEpF2Y8qNn8swK6LMvrJWEYPQyCGPQoUWgLduKiYTZnswNjIxojgMTT6cVnUB0GSrjhYYPJlMKZGtgRp36+MVvk0E64GV6vUYju7Gg+1dWRvXvmgGLv/2Fz/0fpot2O3926++QM1DcEHPQgBUqopPozO1+yINvmPFO00Rht2ZStA7Y7m67Cawx3gGViI7k8Xla3/XWd1KN70zDsmH+AcGjaaT12p4Y20vlZe5p9gSquPUTVXnVajNIoEG9lz0j2vm8+1Ufe6QipM543KcL8Ds5E4oIGm2c+NJDJ6kKIOJm+uTLo/gu/wpdvHE4QTnfvz6IfQHBRDhrvAWPEqXvFMNpzNe0pAjpjqVhLaf64LCrFb3wTZzEai5GwaibV+/yyAFlnd3q1vDN2iXxRns8uUeqMTXbPpecPwjhwxzNkgOlXkBWd96kCGOIwnrh6ylwScJgoengDvnA/rxBVhaL9yhV4vnhg26n01CUsHVchWq7ej237UcxxEug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(8676002)(83380400001)(66946007)(8936002)(54906003)(5660300002)(66556008)(66476007)(6916009)(316002)(4326008)(508600001)(6486002)(31686004)(6506007)(4744005)(186003)(2616005)(2906002)(53546011)(38100700002)(6512007)(26005)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ocwkW3kKCzNE2e5qWkKc+gVy8iF0OVEynMtMLYg/1vLmTNSQ3tK0hcpC/qLn?=
 =?us-ascii?Q?IZTdjUA66Cw/m6VCeJy6m96MR13PHV34c32SX46rJZSBdOKjCXHJ7UcC0xuz?=
 =?us-ascii?Q?z/bWkulq0UzDsib1DlG/fANKo/IF69SdaRyi2gf5CLy9H2BoMIa0utu0Dwt1?=
 =?us-ascii?Q?U8VPQaTJfTPj4nGLBLyMNdzKm8wlFlvGg4+01bw6jm5E2DTqQ2bgxr5q84a6?=
 =?us-ascii?Q?ZY5eAKZhfFPU4ZJLeZW0fhttn+ju/kwmfzElg0hZfpDFCHRhjZJu30mPqih7?=
 =?us-ascii?Q?AG4Le+c3QBZtlcs10stbXG2PaH9DRuYTXdHFyQAuuw1RVzMOqBDgFMMLbX98?=
 =?us-ascii?Q?mTgH2UY7IbOCL7GoCDyf6oFHORv0A58owPsc6ZQB7SzH3GTJno+6d1Hxfe3B?=
 =?us-ascii?Q?0J+SuM+GoVJwx5tzr8PRjxU4UthIXc6WW3MjPdjP3AiHrGtPsErZpSG9oj8o?=
 =?us-ascii?Q?7FKOcFyYxp0ta8WfhPui9VdDsuQLD026VP7+o/mF/3PzoN7HYnPdfjKM5nPB?=
 =?us-ascii?Q?cKT0GQKoXaF8wEk4foYIzw4BCLO2DZuupQKWqRn6nAJRk5JEblIvvgbm7Shf?=
 =?us-ascii?Q?itgOOJFzqfLnPFhxNzepDMUzvlTephD5Q1W38mevTukihXDV3klNB0IZHMrg?=
 =?us-ascii?Q?LsiemoEo7ukTrc8+zCBms/3M7wbwBa6xTCJ4KWXaRZ1QB7cheEPKYJmZIsP0?=
 =?us-ascii?Q?/GjiSS91UeKeEJPXzwXtlCaE4StgJdZ1HLDQO6QjQYEJkTYcOHwqTKcu4YGT?=
 =?us-ascii?Q?v3tB8qlupu0vDwq8RWIkk7txSOT9MKhf+n8aK9eAtYE1p04HaPe+A/P8V243?=
 =?us-ascii?Q?9CmK6pOkzhbeB/K+xc8kFxWpHyu2OnpF7aNe5QtxhXU2ChyNDRQHiIFTzvSx?=
 =?us-ascii?Q?JqCQMWhrib5CnnZi8YFghzyypOERTktqFOXh8qu3OxRAtOLTSQKVPXmuA1al?=
 =?us-ascii?Q?uokDA+7Hfz6sp2dT9GkUWPr5u+FzBo2cGXb5Sjpn60qZo85RzkO7b7TUvAaU?=
 =?us-ascii?Q?IhQQaJ8w+wBe+Cgzs5Atu3Ne6XjvjCHMUaki2MsM/ge4Wss0A2EkKnqwHw9Q?=
 =?us-ascii?Q?yaLKuPMzaOiYTHgcxFIiEpWYOnI/MmgMRXodPS49zefvvG8VrA5XqSukNzmW?=
 =?us-ascii?Q?SGotsOh5uvoOp0frosFZkIbKeOG5y4lBTqZGcRn2RApnk6O4onrRdoqTJxu4?=
 =?us-ascii?Q?75rKBL9GE+afTrwfgLDj/gcNM5lrGsLQGN3ry1g+2KMdhSfrBWg4psgiH9O1?=
 =?us-ascii?Q?LtRYnaZtxm/PyLcKHolpDWOFjUHvrWb4c1pGhpbz2J2v63KqsSuCfXtwGP8s?=
 =?us-ascii?Q?fMrJ5mRE7XYQ2ynni04bbKNh42R4gsmCF6gNRoTv+VXWMPxlJ/oqQCcsS+vi?=
 =?us-ascii?Q?P4hilkZRH5p/VRgotIWQ5BI+PSBWWF+Dnqh52ZOiSpUvNY2XZ/+wq9skt0dz?=
 =?us-ascii?Q?7DYG0CgAhjo45pAKFlL9Vrhfqqgkz5MN/JojHfBEeECjNE9G12vtjokUyeJd?=
 =?us-ascii?Q?7RUtY2IAXLKGCaH4glXlM5mxiu1nUdV0suDKKakvITkY6zTSiT0XQ/16xLHK?=
 =?us-ascii?Q?G45qjQUyrU26erPxltBLV60b0XWNH5S+vLRdahUH/y9+JPyzvrTy0CTK7l9Y?=
 =?us-ascii?Q?wRb8noSt4IT3PxYBDxpkCiOk7SLDuFgxx+BJ1bwV3YbUPSUN4RT6ZsQkjp9W?=
 =?us-ascii?Q?pVbSscSW50m7/CKVKhPmlcm7vOLT5uOMv3bDe8CnV1gLWfhVPlxXOD9G6PRF?=
 =?us-ascii?Q?HlCy9daZ2Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf4cc1b-65db-451c-6a0e-08da2931d252
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 16:11:58.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh+obhb77dnO8+a2zBsKXUHltZ2L3gLdGwFVtFpThoZV5FwslsmBaTh7o/DDBl4ZDwH8wu7RWV/NDdDV8Kp4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4753

On 27.04.2022 12:47, Roger Pau Monne wrote:
> Use the logic to set shadow SPEC_CTRL values in order to implement
> support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
> guests. This includes using the spec_ctrl vCPU MSR variable to store
> the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
> any SPEC_CTRL values being set by the guest.
>=20
> On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
> default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
> policy so it can be enabled for compatibility purposes.
>=20
> Use '!' to annotate the feature in order to express that the presence
> of the bit is not directly tied to its value in the host policy.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


