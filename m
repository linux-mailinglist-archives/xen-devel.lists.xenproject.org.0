Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F6ADFF53
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 10:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019782.1396285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSACm-000436-L1; Thu, 19 Jun 2025 08:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019782.1396285; Thu, 19 Jun 2025 08:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSACm-00041A-IL; Thu, 19 Jun 2025 08:01:04 +0000
Received: by outflank-mailman (input) for mailman id 1019782;
 Thu, 19 Jun 2025 08:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xoG=ZC=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uSACl-000414-4j
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 08:01:03 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2405::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a8c050e-4ce3-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 10:01:01 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:00:57 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 08:00:57 +0000
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
X-Inumbo-ID: 8a8c050e-4ce3-11f0-a30c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taZgPzP7Y9O/tuEIrke3Xk7usHtYChTnc5EZjx/vmWv5FXwpHwV87z1tef7vv4/JmsDW4CUixpcdvXV+pDJSAj+G0mHxXJa1In3R5qZIAOOeO+i9erx88H07aUUndpVkKA/OMqQbgFDUdft6z8qnQIGEy2h5jz7wCAP72Dt4olUO7FZAvwzxbcLmMj6t8lX2OrnXH904kS9HkzUXYXX3OlXSo/KSTS2XO/sRe7wNdZAZeXj0efjZyjUC11+HxwqdlhD+Xr8B2Vc9uCd4dGJjWPK2c/revjQcgPeqayUnosIZ3wLXi4LhmeIkP+5rYRdb/+f8FLubCY95urSyN9hKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FEjwGJzYrfEAklclyCSkxTAP/bUHEyPFdkZtY9WdDI=;
 b=XXveS277N4oY9BqtvC21ZvYskuBcgs3ou4Si/N4EuXsGwhbS92bMNseu9vvChjs0PQzJg4gUrN/4Iz4pTd3V8d4sHeFKSphANsuIa4Q+a+HSifY39slYj0y+TYnMdzRXqH9fJNrPlSbbPBab7BozGLWYP18QY5CyEpc25+TUu/dXQhaLiKVES9dw3/271gdfXF3W+mLZCrzKzs3sch83cbfpvtl6DnTr7ROtVmz6c0Uo/5fIcbee6SyhjQcRJLBKGreRM+RTLfo4MCticEjkpMzTNFO5KXChsQ8ZJvMk7avMB1AX/FiXellMNImlsCtR9RgR4nSd9E+tm3oneYIuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FEjwGJzYrfEAklclyCSkxTAP/bUHEyPFdkZtY9WdDI=;
 b=W8U4VxmRsuWmMwhLfwVGHPE6PgV9IFOQ8yO6qowHMGeC34i/QCFxNw6MnAEcyp2+ybtDP/E+PRJG3Dh4xvegb2oxO3f+AqGeQooSh2AV7/wfF5ctksr02tRFNe1QG0aJRISMWjBQd1zy7v2hZ4SDg+oaEw0RRIRRnRQmFZg+Lso=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbrRCkbAdH8T2kS0OlR5huTdSxQbQKgmtQgAADmcA=
Date: Thu, 19 Jun 2025 08:00:57 +0000
Message-ID:
 <DM4PR12MB8451666DB7993CD84A76BB8FE17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
 <DM4PR12MB8451E8D3F2D8E055679A2AEEE17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
In-Reply-To:
 <DM4PR12MB8451E8D3F2D8E055679A2AEEE17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-19T07:51:58.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8510:EE_
x-ms-office365-filtering-correlation-id: d743af1d-1311-4b9d-7a41-08ddaf076c84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?16NWqRR+1XK/B8+xQurh6VHKsLNVADqyHTkx36EaMGa9OFSvWgx4xnp5Pyna?=
 =?us-ascii?Q?aqYK9+dOjeB64bV0ZEPjPT+/g/MWAOar3w2cMKruZq1q1q8kCwYKwcx4NG1W?=
 =?us-ascii?Q?Mmg/lG0TELwWZtqU0GwpvlMgyfrJSmvO/MEabbBIZd9jZTwIU0m6SJtP6xKI?=
 =?us-ascii?Q?Hl7LVo3ambIrTTJY+EUXwua0HjFwmdjWnC0sB57Q3wndonPSgLl0y8t8+QTo?=
 =?us-ascii?Q?Jm0NgzMj3rYkcEigQigvpc3ElPSWPud6Y/20W1ZI5SYAY96vi/hB2sMF/heC?=
 =?us-ascii?Q?uHLnpyx7wkq2SA7fTEgHb5Ljk0AOX99bq/nfuOV3s4T41r96Oc9CBwqw0UMI?=
 =?us-ascii?Q?is5qV9mFrAA3A7J5JXex6ol7k1gE1K9bXRQGp5hDxptRg8pv8KG0S6fSN8Ok?=
 =?us-ascii?Q?yPnfuA2OGX+p4TQw89uNWtviNNqvhQgBkLTq6vWdCT/h/EpoifovAEz7rfFu?=
 =?us-ascii?Q?p2DY7U8lXBSQTns7J8zOt+kbZHzaf1ldzmBM7r3xXb77YwXHwsYhBtwdSQXy?=
 =?us-ascii?Q?EiLj2MIJoKIfoDDzPHL/ec91W1uWTesHCBj9guQ6y1RVD4j0Z+9BpD//hfKq?=
 =?us-ascii?Q?U+jJucfiO2+xJn0ibOds+wnjA0+o4R+7uLPudFEmJo5IstU7cBfwrHleB5bc?=
 =?us-ascii?Q?VwLuu0dOYO+7hhJaY8TtuQfNFB3iK4tTt31p2ancsDDNosUWbpNm8kgcEDqj?=
 =?us-ascii?Q?SvIZR+wd6FUuAw/HRxupj5PPrz0wnxCxFtJcorBC/zBMGuYnVBDceJlVVxXr?=
 =?us-ascii?Q?CQsV4CEylT+yDKBmTZUxC0lExoCBCqRRqrS+TOT1wCuTcgj7Lb7hgysERfiE?=
 =?us-ascii?Q?ZJ15BH108KcTW2u5Qw5UVeyah0Gv2GJUmEueCdAfiuy5zGdg2r2j8UdFOri3?=
 =?us-ascii?Q?DFYT6NvrSHSrSI1pAoAutUmAMeiWQABfibmF+PfL05wT1JvNq4Eejf0bJjaO?=
 =?us-ascii?Q?RgkqbpUrXBcGGv2RxN+dI7d7fkNRwYrg1mvXxshqynh2xR6noC7foxYIommG?=
 =?us-ascii?Q?QB0PmKKxN3NDALfGi8Bx9KZ1sUaPwwkZ8tefvCdvnew5vvlgu1LjA+5od/fs?=
 =?us-ascii?Q?+G+JFXaE8jxBmxVOc+DH/8Cc0n0XOfFrYLZxrglSCZ5dEIG25DbZKvGkT+OF?=
 =?us-ascii?Q?swwTU6sP81U90B4HkdlXguLNYaLRGt27xWlhR3MU/4mQVF5S0inIDEVfBPag?=
 =?us-ascii?Q?PlED3yQ3IeykhSWQlS08jrG9CWUfLLAvJKCJtRi/CneMhqGG78oxnmDnmZzp?=
 =?us-ascii?Q?ag/fRnZNRV14jkpc/QiBP8dpDX7A5BarSMFukwREyPjy9xuuOCgnV0lJr+4B?=
 =?us-ascii?Q?89hovbvtQtqOV0SdhGt/XSIehNIlVJgUhysug8Z9Ka1pbOvkG6XxTdepJfRJ?=
 =?us-ascii?Q?y/KMRDwMvK5CMdIsaQhKHo5qOt7737CMtaDrPnbW/w8/bRJZstqeNw2sc+Oj?=
 =?us-ascii?Q?d12ifOmcJ5IEOfBfBCK713lzhU/F1GBjkkfIz+HKqanh3nRdYwviYRBEV4Y0?=
 =?us-ascii?Q?tT+dFgySTnUbHNs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bQizx2GgXE+ny44fKLHpMbEFaC5Bz0J/rr7UM3oXKE8ZRUUY6DSaLV5VhSlI?=
 =?us-ascii?Q?oROrS8RoP/zztnw7zxEopTEh+n9TzdDq4+xqoYCqm03W+lwM4Exfk37cf+Sw?=
 =?us-ascii?Q?D5uKNv3Ytlq6Zb7O/stOdsapRUbHlhB7X55KjXJSS0fLR3UKU8zL859Uim3Q?=
 =?us-ascii?Q?SLzB5QkF2e+mx4Q14I4t3JqU/QxWSf5k2rAmnxF6xIBpbIQsqit1tE5gl+SH?=
 =?us-ascii?Q?Ls7gF8YatZ0vLErgcldx7r6gQOKJfL50fww6DVyI+WhbWP8ZeuHbjr9ep1pM?=
 =?us-ascii?Q?yhGwVsDf0IlICRF7YbsAg4Knyy+3d9HK8By4T4ccvxU1+/3iso+F2y1nxwCm?=
 =?us-ascii?Q?ppJRLdN2Ql5k9WC949ruj0dOfScxtW/6lAMGHmf99+L/JN8Ch/ZZNK3qNGU5?=
 =?us-ascii?Q?ClTWNGGwkvyFdxqiRS8qnRfMZ7K/ArPGcRMweX/UzGHPw36opKPmKkzElrP4?=
 =?us-ascii?Q?iZJFv+wY2p2MV7YqlFjjSVBXHs6TN6L0sCpBXx7MM16kROMd83e4QoTAKgdL?=
 =?us-ascii?Q?tQ7bvAh9OLv3P8WObpP7f22kOFIIKaAscfnbR8xlcA6ANE7+TNr1qpKJ/vsK?=
 =?us-ascii?Q?kdHUE+N6M5lX7J76QI5ngYxsbM/53EdBPJ11KTBMpthuox/klnx2D720noBh?=
 =?us-ascii?Q?9FVFriiVdvDqoIWX4288hLiajacD4XTXbk9rJV/RXZGYPBrdLdW5OiK3/TiS?=
 =?us-ascii?Q?evgaPJN6dUXbl+fy5lczSKWu3gmzy5ky2c7SR7j3zzo54QfqoOFucQ6GF62z?=
 =?us-ascii?Q?+8aT+vAPg2pHX0yUUjctcZj/HJa1dKynuNFpJzK5fITWhDkkaL5xNyqJuEvw?=
 =?us-ascii?Q?TPjM/uMOY+hA3ufotQRC0kjHY0RoaG30M3fpmZ2VMhKcQZWCOchTFLENOxsp?=
 =?us-ascii?Q?tYaPoXlbTNW2nvUcdLSb3+5MHiHkkaBILSkshmL3slqX6XgisVXmsOocHA5a?=
 =?us-ascii?Q?eWuor3L2k3NNH+sJ/UYfAbntnYEaaE/u7FaRKEonQlAOCnkvCOExCFWBYIhY?=
 =?us-ascii?Q?VLR3cSWM2EauO9AalSls+cZk2/Uoc/3QLlGAPr3PT8aYAsp4HHxp3n6uzHgl?=
 =?us-ascii?Q?b90gD0e86MbOgqq0QDY7lBPOK2al5KqaGDR7L3Sh2Wb8T99MVknVXTBnxqFh?=
 =?us-ascii?Q?P309oMsujENgeVzMPffkjZA7NzavVvwXkfaad/z0I7a0j4l7nO35BHVi44Vd?=
 =?us-ascii?Q?uZu7xAWYu1IvCcPdnCMV93rucbTuMbdqNXe2U7amvYF4IW5xcYQzm6MWRvav?=
 =?us-ascii?Q?k7lHjCaAnFcEaePb5yrwnMSL4UAVZtWafL7cuISw3+ZFsHFIVorBcWz6xoLr?=
 =?us-ascii?Q?cHSSs01EN7BY9WqodMabbWxGYrj8c7GRnig5I1+AYxS3Gq4Wobvh7du/1MWB?=
 =?us-ascii?Q?UIa8YiQ9U1WXWcRQ2INRjrFxTkxXbPAy8reWjLA52Tn9tZW6nLhGYv2TPyNs?=
 =?us-ascii?Q?FJTXkT50LsWgNeUoYUVtr33a7NH8lpfffxS+36KirqHyA4huWVvtgsmfdjFR?=
 =?us-ascii?Q?Us+HZbumoeAqqVDhnE7EznhLxlWrmFnp/Z9X1H0nx+FdugPV7I2w+mQuuQs0?=
 =?us-ascii?Q?EJtpEBZmIY1mJlzd1A8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d743af1d-1311-4b9d-7a41-08ddaf076c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 08:00:57.6103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBzferEV9wuFlQFlhGxY/tDAJVCUNN2GjEq6Uaz4t7LJ6PybVnY5ai17V0pm9dBG4uNehOKP/6c2R/A/ifqyrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510

[Public]

> -----Original Message-----
> From: Penny, Zheng
> Sent: Thursday, June 19, 2025 3:52 PM
> To: xen-devel@lists.xenproject.org; Jan Beulich <jbeulich@suse.com>; Andr=
yuk,
> Jason <Jason.Andryuk@amd.com>
> Cc: Huang, Ray <Ray.Huang@amd.com>; Jan Beulich <jbeulich@suse.com>
> Subject: RE: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=3Dxx=
x"
>
>
>
> > -----Original Message-----
> > From: Penny, Zheng <penny.zheng@amd.com>
> > Sent: Monday, April 14, 2025 3:41 PM
> > To: xen-devel@lists.xenproject.org
> > Cc: Huang, Ray <Ray.Huang@amd.com>; Penny, Zheng
> > <penny.zheng@amd.com>; Jan Beulich <jbeulich@suse.com>
> > Subject: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=3Dxxx"
> >
> > A helper function handle_cpufreq_cmdline() is introduced to tidy
> > different handling pathes.
> > We also add a new helper cpufreq_opts_contain() to ignore and warn
> > user redundant setting, like "cpufreq=3Dhwp;hwp;xen"
> >
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> > ---
> > v2 -> v3:
> > - new commit
> > ---
> > v3 -> v4:
> > - add one single helper to do the tidy work
> > - ignore and warn user redundant setting
> > ---
> >  xen/drivers/cpufreq/cpufreq.c | 53
> > +++++++++++++++++++++++++++++------
> >  1 file changed, 45 insertions(+), 8 deletions(-)
> >
> > diff --git a/xen/drivers/cpufreq/cpufreq.c
> > b/xen/drivers/cpufreq/cpufreq.c index
> > e01acc0c2d..79c6444116 100644
> > --- a/xen/drivers/cpufreq/cpufreq.c
> > +++ b/xen/drivers/cpufreq/cpufreq.c
> > @@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt =3D 1;
> >
> >  static int __init cpufreq_cmdline_parse(const char *s, const char
> > *e);
> >
> > +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option) {
> > +    unsigned int count =3D cpufreq_xen_cnt;
> > +
> > +    while ( count )
> > +    {
> > +        if ( cpufreq_xen_opts[--count] =3D=3D option )
> > +            return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option) =
{
> > +    int ret =3D 0;
> > +
> > +    if ( cpufreq_opts_contain(option) )
> > +    {
> > +        const char *cpufreq_opts_str[] =3D { "CPUFREQ_xen", "CPUFREQ_h=
wp"
> > + };
> > +
> > +        printk(XENLOG_WARNING
> > +               "Duplicate cpufreq driver option: %s",
> > +               cpufreq_opts_str[option - 1]);
> > +        return 0;
> > +    }
> > +
> > +    cpufreq_controller =3D FREQCTL_xen;
> > +    cpufreq_xen_opts[cpufreq_xen_cnt++] =3D option;
> > +    switch ( option )
> > +    {
> > +    case CPUFREQ_hwp:
> > +    case CPUFREQ_xen:
> > +        xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > +        break;
> > +    default:
> > +        ret =3D -EINVAL;
>
> I'm thinking since handle_cpufreq_cmdline() is totally internal and has v=
ery few
> caller, maybe  ASSERT_UNREACHABLE() is more suitable. Then the function i=
tself
> could become void return.

Sorry, forgot the release build. I'll add assert and stays with non-void re=
turn

>
> > +        break;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  static int __init cf_check setup_cpufreq_option(const char *str)  {
> >      const char *arg =3D strpbrk(str, ",:;"); @@ -114,20 +157,14 @@
> > static int __init cf_check setup_cpufreq_option(const char *str)
> >
> >          if ( choice > 0 || !cmdline_strcmp(str, "xen") )
> >          {
> > -            xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > -            cpufreq_controller =3D FREQCTL_xen;
> > -            cpufreq_xen_opts[cpufreq_xen_cnt++] =3D CPUFREQ_xen;
> > -            ret =3D 0;
> > +            ret =3D handle_cpufreq_cmdline(CPUFREQ_xen);
> >              if ( arg[0] && arg[1] )
> >                  ret =3D cpufreq_cmdline_parse(arg + 1, end);
> >          }
> >          else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
> >                    !cmdline_strcmp(str, "hwp") )
> >          {
> > -            xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > -            cpufreq_controller =3D FREQCTL_xen;
> > -            cpufreq_xen_opts[cpufreq_xen_cnt++] =3D CPUFREQ_hwp;
> > -            ret =3D 0;
> > +            ret =3D handle_cpufreq_cmdline(CPUFREQ_hwp);
> >              if ( arg[0] && arg[1] )
> >                  ret =3D hwp_cmdline_parse(arg + 1, end);
> >          }
> > --
> > 2.34.1


