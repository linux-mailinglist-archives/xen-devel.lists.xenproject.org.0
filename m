Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A733073D0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76866.138886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54df-0004HO-Jy; Thu, 28 Jan 2021 10:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76866.138886; Thu, 28 Jan 2021 10:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54df-0004H2-Gq; Thu, 28 Jan 2021 10:34:59 +0000
Received: by outflank-mailman (input) for mailman id 76866;
 Thu, 28 Jan 2021 10:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l54dd-0004Gt-VG
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:34:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71bf8d54-372b-489d-a637-6443d32a6dd1;
 Thu, 28 Jan 2021 10:34:56 +0000 (UTC)
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
X-Inumbo-ID: 71bf8d54-372b-489d-a637-6443d32a6dd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611830096;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=r/8P/pyHel9FelEYH4Js4LWA3fvG23v+xYb5LDtRcCs=;
  b=fCryxGNKBvi5VU1K+nG8KrVjxCKC5pSp0yzxfIz7p66g5hwV5GD5BDYg
   oLscfWhC627Xvr07juW0sVgLRjewVXxzaHBnUZG9fdtuNd7qxmXNkbXEH
   pFGUQjI+sQVZ8oRiUnq6nf99neN3YgFhImYrtqwK4DU40d88fi7Ck2vI+
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kjZ+DcNsdfPWQN4imUu3+1u9pkUOw3z3ORHVtmrIaPmyYufe1OsDM6Hn3VeLVQSsO79CfIdMnn
 ryPCI9GmlmarUP8AWin4HQ78jRHB0g38BUkXp+iAb+fNgsFFmriiVXbTFgahz0FTYf5USidbAo
 BDK7s+Wty4nqJR0zEF5qcjN+siox1J942gLnMt75hdxivgkttev+kv4YAfqtDwXM85ebTX3OxO
 rN+BWUa76Dk62TQtBb5iYQ/0WQsTaVjtkC+a76oVMq+l07ktd2Wjl9SYQNKklUWdOiwT38eYnY
 9lw=
X-SBRS: 5.2
X-MesageID: 36423692
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36423692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loveNT0ggeCInRjgB8uH6uuElwdWTG9fkyd7xNA9Gz0MvmoCA3ORKf1hI8oUPKFS/66FAIDCoNQrWK8V6OkFnZKcRLEBSQ1R88kcHkXgoii8FcDQnqlEfVEWUrzBhY/WL8bu0IHtpzCsS8C2VZ8FE86fhUSZKtkOa+zs8m4+jieB0icJ6tffky4hUGZe/UrXXywBdUH8nNPDzAY/8V9xRh0H5cCOj1IjMaCvqZfO914wwMyqH9M7kzhRsXTA8SX6Y/+ZCjMFS9xw+cKX2zcE9CaDihEWRxbk+htZJ6DiGvPE9RjI9nhOqxPnCAh2eyisonJFkXPlM5i6k7AS9cVsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ApVa2gPEP02ELtrZLXf8BbgkeoFTgW1xAUpaGC0WTY=;
 b=gtNocsI3sVIqFzqfkleW6J4RfqOgcfXJkvHnUzKEcXNs2tDB2u2B3q4m1vDEkIimmlJwvgL9uosrkdSiffSOFleVJymaHGHegu8OKjuEu/3Rcm4M084pOIwDRIuXLzD8Ph8QDFKi2GguxOFO/uQUp2ed0NREgQvs7EnVtBkLJwAVMb5YFufF7+svgKtqG/2B/unkHrVLUWSWmdfDEltIIvORlGxxbDiS/dy+6MkVpJPKTxxwzyIZOHZyQ05hzKPtNcycSWvhpdlXIuGnwC4A+pEz8tQ8pt00F62vqTeV7BI84sgr7sz8KXh63OL53PRyys7Hc1sRtFZJzHn119yvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ApVa2gPEP02ELtrZLXf8BbgkeoFTgW1xAUpaGC0WTY=;
 b=TBUM5iDzoDxPtzhNvkarjnP4mEjElUj8AeyUDSn3pqGOtm2r7HuCiulsJ5yofu/jgYzP9qAzSVKWTc3bnsgiM7llXnfPe32lBM9odYJIdq90C8pzfDB6er5tQJvxOlfk6DdD+cVmvHx+z5hJ2nR0+ogSCS17cRcjOvga11cxWCU=
Date: Thu, 28 Jan 2021 11:34:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] xenpmd.c: use dynamic allocation
Message-ID: <YBKTRCTc+m468zyE@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-14-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126224800.1246-14-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3e50ad0-5956-4d1d-cb5d-08d8c3785848
X-MS-TrafficTypeDiagnostic: DM5PR03MB2714:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27141FE8A0780D3C7B630D468FBA9@DM5PR03MB2714.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ttfn9nvoJU6QJ+JjJWFXGjcdGCsWx2V6VAteA5lXIsu+MBVZunFsg/ig8sAESG6A/acCogB7Y5N24/IvJjFAR31RdCYHFPwIRsXeM7zj2RYTsoOwu3t2p0B8f+hHGECcpMlWkF2DCfRr0F1xL6rtu7+822DYWjXRh8Lkaov4lciHfwY0Ne0075xbYgp7zcgEiGpLXaij16Q46eeQayG6bhAkciGQoVQe5wTOW54z0p6TUuFQmrGrBtwkxkQT+YSoQUh27v4hjn84/ItxeurwnxKlm9sEKIVz2gWO5ejhKn5G9Td7S7sPEtaAb0mjOGo9BR5TgzSkBJI5plb1iPJ0REOpX8pYAmpSgyCcxCR8XajDC7+zCKnZgll0gEEg7cwJgMy4AL4YBMbb/MlocPAzrqAs0q+DAiiePKba1E9Bz9CMQqwyx0ygY9eVkTQPbwdZ/Gsfnsi2JyO0LkeeDDDUX46mpSZtGRiLIf/G+r6Z9IXuDXkKJsjJCECW2twanVCxAFv7SYBP76vMnRj7gmRUf5HbRPVGgjQKjpP4wJYwTyFIq36INuqn4pm39jepFM2r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(86362001)(186003)(16526019)(8676002)(6486002)(26005)(5660300002)(33716001)(478600001)(85182001)(83380400001)(2906002)(54906003)(316002)(8936002)(4326008)(66946007)(6666004)(66556008)(66476007)(956004)(6916009)(6496006)(9686003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U1dzeXBWWjBML0FuMG11WTFpSlJUWm8yTlFkcWVodE5yQXh5Mktsc3Q0Vyta?=
 =?utf-8?B?ZjJoTWpMT3k5R3Jlc0RyQU95Lyt5SGgvRGN6ZlJpYmtVSVRxTTRxdVNqa1hU?=
 =?utf-8?B?UFg5enFWU1Q1SW9mN2xlSEVYSGJ4Ui9OUnp3Yk81MlZmYkFLNFJXeGxreFFr?=
 =?utf-8?B?dWN0VlpjN1dsTG1janNKaW1GeHYxL0JZcEFrdW1xbXA3UnpEUkRoMEdVcXR4?=
 =?utf-8?B?RnZFSTVrd0FKbnBEdk90emlHdzZtMWVSNHlqZG1jZVZmelhBNlU0aTJuVGZ0?=
 =?utf-8?B?UEVUejdubTVibE9qbDBURFFSb05UKzJEYWMyckNTUkpTd0dsUExwaWswRE4w?=
 =?utf-8?B?NVlRR0cwanpqMkVXT01SVFltRTRVKzhEc2FnV1hMNGhQOUNmbkU4SFFOcG1n?=
 =?utf-8?B?amxsNlVidll1UHgwQkRGcENZVmo1dWdwbDdSd3RiN1RGQS9mSDBjc0RKRU1U?=
 =?utf-8?B?S3NTNHhPZThmQXFlZVZtWW1vNDdpbHZBNVlwemJlUDVkQVBtN0pGbzJXa2tr?=
 =?utf-8?B?anBXc2xoQUFRUE9jTUVtMjQybE80Rk03ckZuRHk0S3NRRHJFL1dUVGx5MHpX?=
 =?utf-8?B?QlZkeUtLbjZrTC9wNDFkUkkyZjU0RSs3K05PVXVVSllobkhmbFVqVlNNamVo?=
 =?utf-8?B?YXpEaU5pZVhxeFRpc2owdVhleVZRV2VYaUMyWHhBam1VVjRrVUhNS3hGS21J?=
 =?utf-8?B?U1FmWjdMTUw5UFBDaU9MWjJyZmlwZEd2eDJmcGRQUnBmRnlrZDdDaWx3TENk?=
 =?utf-8?B?NnRIZHNqSVV3Syt6UzZKdkpoRFBtMGNYdWN2aGxBYUs3YjFTK25oSlA4bmFO?=
 =?utf-8?B?WDg5Z2l6alQyOGs4dWJVQ2VYc1F5Rnp1M1UvbFJrRHNKYWkzS1J1Y2dOQ0JZ?=
 =?utf-8?B?Nk9lb3kzcHBCaWVTUzROUmpmdlZnR3IvWHltSGxWZGVaNDlLSzR2SW5zTWdx?=
 =?utf-8?B?dStOcmRqOGVXcjI3OE1nVVZsaHc2bHVTV2NYVTZtTkVJaVFneGtIbWlmU0t3?=
 =?utf-8?B?UHpsU21jdGliREtjbTZSVDIycnBRR0RMcU1LcS80R0tuT2hkdFVEeTB3Mkpk?=
 =?utf-8?B?TWNRMUcrWHVxMVVBc1liUmFDMloxZmRVWjhSbzRBbUlrN2J3OTNjZXFlOS9J?=
 =?utf-8?B?U2V6OGtsQkN4Q1l3c1dpZFpLRGg4L0FxVlVvd2FXVkxDcFVLMW9qWlovMVpN?=
 =?utf-8?B?b1p5Z1JCR0tqd3JrQlh2Q3hlT0w5N1d3azRXTWNJWFdFbFZKZm1jRDkvaXBK?=
 =?utf-8?B?ZjU3b3Q5TkNUVk5nb0p4T0xabmVIVkx1T3hrWnQ4STZ5TkxTamdZZmhRUG15?=
 =?utf-8?B?NFZqRjZGaFZ1MlcrdmxBT2VrV1JoYmFpTmZVS2FBTHhXQVZxNE0zK2JBZjQz?=
 =?utf-8?B?aURvaXhrRHh2UGNzWXZWUGVPbVlMaHpsU2xTLzVJK0dFM3RZekVaUnhwNHBz?=
 =?utf-8?Q?Qu8IdF6w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e50ad0-5956-4d1d-cb5d-08d8c3785848
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:34:51.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNGLs7gwYIaODnXH+8bewDbq31OwKdzoNx+6XjzR3fp9Iilk/LYBfSmRA0SpkomFXAxsTww1RE6C6Wa3v0Z4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2714
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:48:00PM +0100, Manuel Bouyer wrote:
> On NetBSD, d_name is larger than 256, so file_name[284] may not be large
> enough (and gcc emits a format-truncation error).
> Use asprintf() instead of snprintf() on a static on-stack buffer.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  tools/xenpmd/xenpmd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> index 12b82cf43e..e432aad856 100644
> --- a/tools/xenpmd/xenpmd.c
> +++ b/tools/xenpmd/xenpmd.c
> @@ -101,7 +101,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
>  {
>      FILE *file = 0;
>      struct dirent *dir_entries;
> -    char file_name[284];
> +    char *file_name;
>      int ret;
>      
>      do 
> @@ -112,16 +112,16 @@ FILE *get_next_battery_file(DIR *battery_dir,
>          if ( strlen(dir_entries->d_name) < 4 )
>              continue;
>          if ( battery_info_type == BIF ) 
> -            ret = snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
> +            ret = asprintf(&file_name, BATTERY_INFO_FILE_PATH,
>                       dir_entries->d_name);
>          else 
> -            ret = snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
> +            ret = asprintf(&file_name, BATTERY_STATE_FILE_PATH,
>                       dir_entries->d_name);
>          /* This should not happen but is needed to pass gcc checks */
>          if (ret < 0)
>              continue;
> -        file_name[sizeof(file_name) - 1] = '\0';
>          file = fopen(file_name, "r");
> +	free(file_name);

Hard tab. May I ask whether this can be fixed on commit so that
there's no need to resend a new version?

Thanks, Roger.

