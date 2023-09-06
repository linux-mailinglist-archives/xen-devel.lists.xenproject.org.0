Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A879374A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596355.930220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdo8M-0004vR-Fe; Wed, 06 Sep 2023 08:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596355.930220; Wed, 06 Sep 2023 08:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdo8M-0004tu-Cv; Wed, 06 Sep 2023 08:43:34 +0000
Received: by outflank-mailman (input) for mailman id 596355;
 Wed, 06 Sep 2023 08:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdo8L-0004tl-5K
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:43:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75933492-4c91-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:43:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 08:43:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 08:42:59 +0000
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
X-Inumbo-ID: 75933492-4c91-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3pnbfk89S2w6jrKwkt3lziEyqrUjwGu/vodG91o/RVjznbDSm70BquTy5cE+a/AwcgFFvzDPbqr8GlHZVvyEj/axkBmt1NMV+T6Lx8vAQgATa2umhFmCjfLRbP2rmNRJdfodErwnZCFjJnLnRrRSmpg/lBEChLiPjlo2+D96/4gkmje+7+tXpdn6ZyYymgSxjLn/MluzzHCcl5tGddtQeuEBZMk4M4JqfxgPbKZKXawwb50JcozAlDzcS+3Asz/BrV9xwSLqk8U0HBvKP+vnxZpBlCJ3HJ897XEdhAx2DYZbjqX5fsINnXASSsiQ53x9habfKyVPiod6PhkWtFfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m66DQlzf2OSwC8Hx2KkbPczMJLaxP7cV8n+9xN/rQRw=;
 b=T+XwVvAENSCK4bhXRNyRfs9Rp8mFBcgfD2ZHtet2o5/hZjhGcnvRMSjmqjBYblEsZx57EPbRpoETayfIow69MaKprDGlUyLq8vb8JYPnaFQUafC6I2RMrEgQF5ZPBxPYK/3pGygdokRQsshuXHEq/rDlCRVQRbmP3mh4ewQYq7mLSAB6INPf3rHxZalJuTTkDBHU5Dpcu78zie3FrNkWxh9nKfxYhPUbwFSguXq/wk1cZA1+IFwGxAf1Zg3h39gmj5wX/2jQk82IHn3QPWQFBj4B/7q8VNeXWF92gM+4w4qh/XfVF31Un11wxj3S2+3McJzy4kepPNf3PRMTitd31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m66DQlzf2OSwC8Hx2KkbPczMJLaxP7cV8n+9xN/rQRw=;
 b=P3PpSo537i7pWMJ3hl0Yj4MP1ksD0oG8dkdCA31+Ed2QV0sib7kryWYdncHDrsaXcjMbhzCA1FcGU+X+MI8FMDFUZLsonOoFrO96X28BJIzfXVB2Lmpf6aqZ7qh/JR0L/Fq1CTQxqiN6Oq3tnlXA8Nv4S2RanM/8ma4Z9HS0XLgPxvlcn5lOozToyeI4S+FDTR3U0LaLlKSSTOjpd96crXpfqKWfwZpZGsD3eeM+pUhISQKIn3tkxHMVQgm6Qe4Ia1uunLEXO/gyZaGo6KsT8JzaS6+m5HbtcQQ24CN82hXgbTRnvFKkReAnMpYsU+m97Nak9IRpiYLaEcWjdvYZXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bc7937c-e051-ceac-d9a8-2c6afb1196c2@suse.com>
Date: Wed, 6 Sep 2023 10:42:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] tools/xl: Guard main_dt_overlay() with
 LIBXL_HAVE_DT_OVERLAY
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 stefano.stabellini@amd.com, vikram.garhwal@amd.com,
 xen-devel@lists.xenproject.org
References: <20230906083614.25315-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230906083614.25315-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 859c6d23-f5ae-4d78-b5ba-08dbaeb54675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MRwFXgJ+oh3W6qUYPVaiPxRw2XK8vaiB6mEbgHagexhg0io5pbltLza5G7m8FNLSoPDk0esZsv5NGWyfM+2NLXckKAM0WWdUNQM1H67jNmnH0yBLMGxU2sPS5IrJoqyfeQia15A0EX5Vc/76Cdvui35j9+Wl3KhfIkV7RfYaZoyW1fxlaYSv+eFWs4Ub/CIJtqSjZ3/7iEfeKvbwxs7nwps+XgCqrqqyHRyqae9W+sMqMSvUeFNh9FVsrhTa8cbdd+DfzARguJKydEUSSViWDfgt392Ys4bSkhGyAvWrgfZM3ZN0pCSncWVdf1hYmWgtWx6bGp0eitk8HTBaSQzBdwTQxwpFSC1rAFDCxa1nx7d290RXfjATxqyWBhCRRkXSgHC2IysiKKae8Sn4mN6z/O2Dw7oWLkRCjAYTOudNl2rPNxtnT400vLLCIcrBJtqWVP0yM8nb1xduI86A1uFhM+P5bUXhOqT5Me6BsejxQZcudCgCQWCfdA/ecr30b+dky1IUZI/uUIFmR7XEWa5Re+WNZ+AlPropbhGkm0hOlKv0Rq6xw21lkAxMiZHqCB5Dzet7HNP2qgEm9FxW7Ren9FnqHS/M98ZoiOGYgh8K7hElnxk+hF19TNgylCpyfUEgeFLcQMJiapV2gqcqfO2OFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(186009)(1800799009)(451199024)(2616005)(38100700002)(26005)(53546011)(6506007)(6486002)(6512007)(36756003)(83380400001)(86362001)(31696002)(5660300002)(41300700001)(54906003)(66476007)(6916009)(66556008)(66946007)(316002)(4326008)(8676002)(8936002)(31686004)(478600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJ3aGF2Um5JSXhLZ2tMUzhmcmRIVzk0VVlaRmtGZ0NWM3I1ajBRbFUyZm5a?=
 =?utf-8?B?ZzNEdHNuOXQrUk9PYkUrWlVySVhDSExlTW03amkzM2p2UUtoRnhhWEgxaUFV?=
 =?utf-8?B?TkdmeFhVTmdscFpoSWoyZnZtMXJCMlZDd2prczJCRW5mOW9CV0JtbWVWOWx1?=
 =?utf-8?B?NDVmSm9KK3RLbDdNdG5ZenU0TThvb3dKdUlWUWh3c1c1K2ZIYXJTaHJyRUls?=
 =?utf-8?B?emhoQ1BtNVVBN2M5NTFIWnRPNHF3U1VIek1NOEtZU0trSU5PaXVUdTIwK0Nw?=
 =?utf-8?B?eWtUc2NscDJCU2tSMlRLbzhEZ1hONFhXa2g5S296VXRGTk1wNHRkV0ZrMU92?=
 =?utf-8?B?WFJZdVNBVE9vaUcwNnBOWmRxMmJpK3gzNEtlSWxjUCs0V3A4NmdVd0tvR1h2?=
 =?utf-8?B?cU9NWEtJdnE5UE10OTh2ajkzZVo0bHoxcHNNT0UzcThYejQybGw4Y1Z0ZVRO?=
 =?utf-8?B?MndwalF3RytQNzdqMzFaQzlBMkVDaFRIV09IaFYyWGZsa2M5eDg1LzNTUWhx?=
 =?utf-8?B?WDBHVWhUSmI3VllLZUZuMW9COHVOd3pTN3h0YmdXdmRNUEN5alA3UEpIMVV0?=
 =?utf-8?B?blQ3Znp0OU1xU0dsK1UwcWR2R0gzcTJGcFJpQWlrK3B5RDNpZzhTWkZTWEpj?=
 =?utf-8?B?bFVmZkFob0x3VC9zVTBBdlpzTVlGVXdOQUpYRGQvMno0Z2dtb2VMbzJzWE4v?=
 =?utf-8?B?eGRab2x3dUhMK0duUFhCaldjZ3JoTDJHTUFnVlJ4SGJFZUV1RmRmS0VVZzl0?=
 =?utf-8?B?ZmtnQmVMZWJzcG9rR09PMFdLdHdJbmlCc3dpOHZrRm9wd0xyWE0raGNaYmZM?=
 =?utf-8?B?RW1mcHN2a2tZeEhOVUVIQXVSNXBmL0RyNXdMb3JUL1BOTmNNcEZqUTI5SmZo?=
 =?utf-8?B?K20vL1psNFNiQnNvWGhua0V1SGJvaHd3MkpJWUpPVmcxNkdKTUVaVUg1ajIy?=
 =?utf-8?B?b0xXWVRvQ3QzU0ZTdVF0bWVYbGM0bU9STitPV0hIempUS1NkTWJDNStRSjU5?=
 =?utf-8?B?WHNIamc2WnZVZjFpT1JyMk96M0dTQ21tK3VqSDVyNFNudTlZc2xPYy9ONDJJ?=
 =?utf-8?B?U0wweitaZndObnNJbDZXUEN2bG9ZK1lEZk1Zd1hSQ0JuemV2VFlnMDkvQ2dj?=
 =?utf-8?B?anduMlZhK2VMWXVhMkRMZ1B3eUgrbVk3SzlwTTcvdHpjeHdiMXRCc28rRUtN?=
 =?utf-8?B?RVRrcVFTVFpnM3hQK29tV0RvcVA5bVdvWHdvSktnbmNsMlo5cW9DaGtnMmI3?=
 =?utf-8?B?OEUyamdMVHZCMk9KdjM4bi92K1VhQ2pSQUV6aDJSWUJkR0dLTm5lYkZLTWVY?=
 =?utf-8?B?UW1scGtxbUhsZW5JSm5jeVo5bGRmS3FDd0kyM1VXWkFyTUx3QTNLZm1xaVZ1?=
 =?utf-8?B?ZFkxeERlMkpkMWJiZHlSL1Baak5UYStZNHN6YW1GZkNCc2FjN2R3enMrbXdt?=
 =?utf-8?B?akVMQURqWWt3UTRmQXpGTFJGeUh1enVEekFWVlR0MGpRY3didXBjcC8wK0pG?=
 =?utf-8?B?TkMvNXFwTFFGTkJKZVBCSkJTV3dQZTBFakI4bXg0VExmZ3pXQ0duNXppbXNz?=
 =?utf-8?B?eHBIRXNEbTErNUpidGltblVaS0VzVnZNOW11bUxScEpvUEN4bU1zNTdGYms2?=
 =?utf-8?B?c3dzYkN3NXkyZnhmY3lyeTVndXZCSFNwOG93LzNwVGNObW9jTEVmYXZiVVRN?=
 =?utf-8?B?aGJMclpmVzc2eExIOFp1K3I5a0pmUU5vNzZpZGM0SzVqSWt0SUwxUFRTcGVw?=
 =?utf-8?B?ell4cGtSNkNEWk5jVmVVb0VweENuSEJidUxvcHJ5WWVaRkJRUUJqaEl0N01R?=
 =?utf-8?B?bi9pNUlTV3hzS2Q0WEVwY05CSU9XN2l0Q0tiUGZnVmh5MlVZN0UycktPT1dN?=
 =?utf-8?B?cW1RL0tkTFpzcGlkc2wrd0RITllkbkRsaTdSdVEwa3BBUW1tV0ltYXpybnpH?=
 =?utf-8?B?YXdCOTlnZTkyYVdqN0psek5tdzcxUzF0Q3FNTzFIUlZZQkJMOHpLZkZSdFFn?=
 =?utf-8?B?S082WEoyb0x2Sk4vMWlMc1ZWWWpmOWpNczVBUldFdFROYTQ5cGI1ck9xMDhl?=
 =?utf-8?B?aWR0Kzl3SDMxZG4xRHdVMXRWYmJqZklJajBQWUFnMVFBYzZ4cURHK0E1NEhE?=
 =?utf-8?Q?YXzKxfg1E/JUDDgh6bsRNAgOj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859c6d23-f5ae-4d78-b5ba-08dbaeb54675
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:42:59.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BihKDp3CTeMA8CTR9MmFF4b/QWO6BGbMMRxp8KRf72JeGJNwOOtW+yM1xBBbyplubdlkgWvR4ElF3PTG8KW10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

On 06.09.2023 10:36, Michal Orzel wrote:
> main_dt_overlay() makes a call to libxl_dt_overlay() which is for now
> only compiled for Arm. This causes the build failure as reported by
> gitlab CI and OSSTEST. Fix it by guarding the function, prototype and
> entry in cmd_table[] using LIBXL_HAVE_DT_OVERLAY. This has an advantage
> over regular Arm guard so that the code will not need to be modified again
> if other architecture gain support for this feature.
> 
> Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> There are still other parts of dt overlay support in toolstack that would
> want to be revisited in order to use guards suitable to be used by other
> arches.

Since from all I can tell this will do
Reviewed-by: Jan Beulich <jbeulich@suse.com>

But I still wonder: We agreed to leave libxc alone for now, but was it
really intentional that you didn't adjust libxl.h right here, but instead
...

> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -138,7 +138,9 @@ int main_shutdown(int argc, char **argv);
>  int main_reboot(int argc, char **argv);
>  int main_list(int argc, char **argv);
>  int main_vm_list(int argc, char **argv);
> +#ifdef LIBXL_HAVE_DT_OVERLAY
>  int main_dt_overlay(int argc, char **argv);
> +#endif
>  int main_create(int argc, char **argv);
>  int main_config_update(int argc, char **argv);
>  int main_button_press(int argc, char **argv);

... made this adjustment, which imo isn't strictly necessary.

Jan

