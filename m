Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECD51D80E
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323076.544615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxGo-0001v6-Qo; Fri, 06 May 2022 12:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323076.544615; Fri, 06 May 2022 12:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxGo-0001t0-Nr; Fri, 06 May 2022 12:41:18 +0000
Received: by outflank-mailman (input) for mailman id 323076;
 Fri, 06 May 2022 12:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmxGn-0001ru-Fl
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:41:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d23d1ad4-cd39-11ec-a406-831a346695d4;
 Fri, 06 May 2022 14:41:16 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2173.outbound.protection.outlook.com [104.47.51.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-65kvHPxANMm4lXE-arKfhw-1; Fri, 06 May 2022 14:41:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5133.eurprd04.prod.outlook.com (2603:10a6:803:5a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 12:41:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 12:41:10 +0000
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
X-Inumbo-ID: d23d1ad4-cd39-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651840876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqPRCmpTyAOOuUj8jQCEonRiqgbSakYPd+qQkcSn6Wk=;
	b=TGwWEbvLpFWmN633Sjal0NQGjnwratBIQmh5xi/RsBCjBydS0nMn78impmcAJQt2TSU5k6
	Hat+mYB9ddfsNH7tMf2gXMaohvEIEdeW45r2Dh+FgpcZTL+Jo8d1oWk5nT/vP99vM38C6w
	qSvXjiHfHD/QHtUfoGA1EW10a67LyxA=
X-MC-Unique: 65kvHPxANMm4lXE-arKfhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVRMXn4jSz0OgNBY5Gsu/5EvVUv6bxlaWf6lgOl3ZHlB2r94bQ5x9+YlZzykR+TqDxLxf1+Q+1M9L6SfHe3PQICFNIlo6oCiz3O9HnwdXCgs7TyiJRmFQc4ehXfIKlH5Yfl7EsPNZ+zKF2oCQEbhtjfOlL7dCj1bdHdfvKtTL2sz//xMcb6m0fVh/slyQXsiIME9oRxOnhYLLLr7nNfgQILafMiDSp2TCTHSMwXdV1n2FTNICQMynUmmriqEd1Zimmivuoak4lxxHUFK+8JKBG0V6gG35ea3sxS3I3RDwF1J83x0D/qc+RMz2lfPS4v8inf0/6fxmK6nQjelt3VfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEDhe/YcaFNWtFa5mlIhtq1tl7msIAasVJli4k2Qn0g=;
 b=DpuR/xNKynR3Rq/zcKfuKYvcVvWVMiUsdKTigmPFBZRT18TmDa/y6O9z+vYjlEn71u/Yc2vX5Yby6P167AifIwulwq5yy89jQm1HVbhD7VZvGBw24c/tWK80bSK5Fl4DgiddkhV5QBWV4aXJyJfDvy+YZxJ7b1CECZddN2EugUG1IWwycAJ5qgqzs+sqMle1QwLM+gm+eha28qg3euy86PILeSPZ5FHottHJeg2x3VyClRAcAH7zaSrC/IJ27Kz3FAvFupn0f3dgARe0ZVK9VxN1IBbqg1F56S+kJVrqaYSUhPR6lORMbx6SzECU90cthpWR21f+4PoSobo5ez35hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c73385e0-6845-5485-0011-15d56912eacf@suse.com>
Date: Fri, 6 May 2022 14:41:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220503082650.23049-1-roger.pau@citrix.com>
 <20220503082650.23049-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220503082650.23049-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0407.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99161919-ee3d-4559-8e9d-08da2f5db2f2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5133:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5133C3C2F83F329C104A0678B3C59@VI1PR04MB5133.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M49zq6c3NbYiSsamUOK5Ti22kcD1FDEjkdualovYWDi4H6DqemrbP8bzmES4CQ9X9nJoBWqIKENwEhaogt2vW8WJcugzjx9VBy8b+LeOseYshK+Ihsy1W8Jtg5K4uIvFFOcTja0JybadHzOdZfHZyLth30s0g7GreqKNAT6I/Q9PRh3yJQqjuCewS6xvQphBEnoZ9wu6NteKI2TkGVexL+bN4MaZ8hP8u32MRnaW2kl2ukeI4+Uz9sug4fi9Iq2b/XWpCy3fo+GEEQVIuNJCJBV9cmcGScY+1pZoK7aEX/J659HtEHxaTa6y8N9/gSI9vAJylAAPbSGOKBO9+S9CQ3mHg2YXP7oohzuz2NSDQCIO5qt/1StwHm/O6VLOp/Ox+2F+5J3MwVtY1zCVQDczDcIgoMXHzm04sqmIbEKsIQ8sTwxlVc1De7YnO06hyJ7npq0hpJKYkqmaDE0yEJ6ghxXNEqfRzzZM7xMzqW+04rmAyNT0xUyR4WSTXtuqFIz4ppIut/oMfwOWMUVI/nF1hio5bA916UU7wJYQA4KRoKzHJ3S8h25PSWjBJ09pBWKLkAQjOhZloWBY+hsnu7gVO13ju252as+f07RcdGra3Y3e5AP7q42ckr4ncvHP5PWVeUCsmKDkOFSh1TZN5+WChGC7U54nKA0ucxrXM3D4nCSBqpDKxDzVAiPktW5WV1B+jocqUg8kY3+SLcVaKSuyhRcTJ1wvT+2T/vdclX6efqk7i5W2F23YmilTyznsXe8E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(31696002)(53546011)(86362001)(2906002)(8936002)(83380400001)(38100700002)(26005)(6486002)(508600001)(6512007)(54906003)(5660300002)(6916009)(2616005)(186003)(31686004)(36756003)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMGGfb8Pa8Z5mDlQ7EKG3jIlEZeMXh2J+GRmSPkzP0EeFrjbtUjQtqsj2ivc?=
 =?us-ascii?Q?A9Ugxb3RXKe3NegQN0hOBQFZPYVC1YtHFnaS6eA8Yu3d7kQXuPJMKhE85P/Q?=
 =?us-ascii?Q?hCwVHiifnyVH5sNNtD1o92hRyePpiADWvzaIfyXx6jl8TxxmjoYCyefc3lCQ?=
 =?us-ascii?Q?MLPO9E5WGpdfFRlLXabUtkGhKUE3hSz0ZvtLxAlBBau6H5d0oxWkcN8VbYmU?=
 =?us-ascii?Q?dVdhlxrwa1WDl+K4uyGfPTADllJRd5jTZU7PxHDJFcp2U/SbuvPlLe/EngD/?=
 =?us-ascii?Q?0A7GoZdL4NkZJUARxEbqZ4fC2WYoCESPwaoYZV4OKKNzGP0YKVjOiP5WaOsU?=
 =?us-ascii?Q?LU7Pfst37TWRjhBmJY4KuWYZygdD5UezDS1bAT/ZdrPLSHMRjnwGGkPnANEH?=
 =?us-ascii?Q?e9XmFNPATWWvdXNU4ARwhJwPFKni3FgQ3vmWF07Lvs3D8K3YLdUtwWeRsFk4?=
 =?us-ascii?Q?FiqZHNekw0mRMnRRkcYFhMhOH3onQ2VXibXZBCz4xKObDKqvyMdVAAO2kL9J?=
 =?us-ascii?Q?94cf+MCDx5Pt+LEHFczS6Hvp2pdBpyXE7jskf2gJvCXXTyBWQ7dY18SC7kFM?=
 =?us-ascii?Q?ksF82pP414FzsJZK8BboLayhEcENDkU3tb7D5l3HagM5H7V3IC67/C8KNg6A?=
 =?us-ascii?Q?xj+LonHT52ze+99IdC7ad/S09a8GDBt8XhKN8cAqzqxcLbfJfgji8jhfxnWJ?=
 =?us-ascii?Q?HJjuRbwl5eTm5sUmE0qj7hndiQaxWXSaYOe4gkaKogEJN7IdQjMTMYft20Uh?=
 =?us-ascii?Q?kiiERwVUWSpJeHMJRS0VOsN6ts9LZQhT/Zo8cH0ulq7hqF+4xyGyciu6Niwf?=
 =?us-ascii?Q?mpzuu11UaPhZmfwcVJL3IVD27XXwhQQRDfmySXH+MhiTU8Nfl+w9oF77q8Bd?=
 =?us-ascii?Q?ncWd36PLS2yHu4uWqA8yIOYkCJ59JMNpJXZtel7Dd+d02PaHGYq6g0lYmDWw?=
 =?us-ascii?Q?i0WDE/k0dHJaqq2sClMsEwGfu661ZIN0N8GOlEGcAxHxLXQ02sV7R8laxnu3?=
 =?us-ascii?Q?1ZesNAcpIBvgQ8I+LnckZi8TDgev7bHz0BGsPGw28vWVH0xxHktz0p6+YZMY?=
 =?us-ascii?Q?gvx98RePTqz+EKaNmaeeLAu1pd+uB3RLQ2dz7CXVk+8dfHo2mXfWSySXz1w/?=
 =?us-ascii?Q?sUU0dyTCNIJwIhZfgPQi5WMaybL+uBpwWSfYIT5Xarvch3Z11aC+rR7PmwTg?=
 =?us-ascii?Q?kNApyVs/WYdGNa4ofWEqPwTW2ROmAM2Ndz/XEg9cD4QpcxnkpHqzxqiVhuDZ?=
 =?us-ascii?Q?N7UnVZ31td4T3tw5ArNnLA+xEz/wspXGRe/2B/NuoWlt+7WPzmaNwnyy+7y7?=
 =?us-ascii?Q?evNu6vPDc5YibLtsUZdctzicPhVQqwQ1GrCUiOXJk5fjFDC90M69JrbCIrXh?=
 =?us-ascii?Q?r8n9eKL2zl+uMPGQwJa0/qbZmvcfAlX2M8Fu6FPN3Dg92QGW5Pm8bgJP7fac?=
 =?us-ascii?Q?NvCSbQGOJFNoP37jkYwWYpepjLlD2qrImiD73LWO9LdQwpO7xuE/ONx3cOvY?=
 =?us-ascii?Q?B9hv0xUkEAnDw4PN4X6Uf6kN8EMO7unTBOKqmsNF2ZMPVmbIh0kE7a4DrQwO?=
 =?us-ascii?Q?sU4p/SvKciIHEJdS1jFPscPOx1xkXOL+ZW7IjVOhyIZS9xXyNVxGeyEwhSZR?=
 =?us-ascii?Q?htEy/aoi2b1Hwqm+DYMY80Ie7ITOVbwqSl0XeS6b+Ao5GSObDo9bP6kI74j1?=
 =?us-ascii?Q?lYV9yS7V8vvxIXwdaGRg+jBgeQC5xWWylNTWBZstkfygBK4NcrTX0yMwDk5d?=
 =?us-ascii?Q?dDFwbTZ1sA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99161919-ee3d-4559-8e9d-08da2f5db2f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:41:10.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAj5TgQmZLo30cyb1MtEe/wXa+n/TdN5tOGr2PpF2w6LXwzVDL503m7ViOlzVj3RYrh8wUIOjdAozSjxxxDYrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5133

On 03.05.2022 10:26, Roger Pau Monne wrote:
> Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
> the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
> families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
> allows for an unified way of exposing SSBD support to guests on AMD
> hardware that's compatible migration wise, regardless of what
> underlying mechanism is used to set SSBD.
>=20
> Note that on AMD Family 17h and Hygon Family 18h processors the value
> of SSBD in LS_CFG is shared between threads on the same core, so
> there's extra logic in order to synchronize the value and have SSBD
> set as long as one of the threads in the core requires it to be set.
> Such logic also requires extra storage for each thread state, which is
> allocated at initialization time.
>=20
> Do the context switching of the SSBD selection in LS_CFG between
> hypervisor and guest in the same handler that's already used to switch
> the value of VIRT_SPEC_CTRL.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> +void amd_set_legacy_ssbd(bool enable)
> +{
> +	const struct cpuinfo_x86 *c =3D &current_cpu_data;
> +	struct ssbd_ls_cfg *status;
> +
> +	if ((c->x86 !=3D 0x17 && c->x86 !=3D 0x18) || c->x86_num_siblings <=3D =
1) {
> +		set_legacy_ssbd(c, enable);
> +		return;
> +	}
> +
> +	status =3D &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
> +	                      c->cpu_core_id];
> +
> +	/*
> +	 * Open code a very simple spinlock: this function is used with GIF=3D=
=3D0
> +	 * and different IF values, so would trigger the checklock detector.
> +	 * Instead of trying to workaround the detector, use a very simple lock
> +	 * implementation: it's better to reduce the amount of code executed
> +	 * with GIF=3D=3D0.
> +	 */
> +	while ( test_and_set_bool(status->locked) )

Nit: A bit of Xen style slipped into here.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -3126,6 +3126,8 @@ void vmexit_virt_spec_ctrl(void)
> =20
>      if ( cpu_has_virt_ssbd )
>          wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
> +    else
> +        amd_set_legacy_ssbd(val);
>  }
> =20
>  /* Called with GIF=3D0. */
> @@ -3138,6 +3140,8 @@ void vmentry_virt_spec_ctrl(void)
> =20
>      if ( cpu_has_virt_ssbd )
>          wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw=
, 0);
> +    else
> +        amd_set_legacy_ssbd(!val);
>  }

Aiui the adjustment suggested for patch 2 will not really get in the way
of this, by only requiring to drop the ! .

Jan


