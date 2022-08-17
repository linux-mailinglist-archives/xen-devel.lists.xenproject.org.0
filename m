Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EF596CE6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 12:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388831.625602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGRg-0001Je-I7; Wed, 17 Aug 2022 10:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388831.625602; Wed, 17 Aug 2022 10:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGRg-0001HY-Ew; Wed, 17 Aug 2022 10:38:44 +0000
Received: by outflank-mailman (input) for mailman id 388831;
 Wed, 17 Aug 2022 10:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOGRe-00011s-MZ
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 10:38:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c22f804c-1e18-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 12:38:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 10:38:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 10:38:38 +0000
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
X-Inumbo-ID: c22f804c-1e18-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EthBee6Y9CB38Lr+j4X9fb2Tn0e3BmCQUxaBRXzDor8rh/f4JLPFwd66nS3A4tSwCuOlu3r5vAuaBjcQcGNmX6rsdIWPTbPRIfjJc/Qt+3WSt8VQju8IspKU1O/8aLiwioFZ/haXOy2l88yUfZ45r1j5kdXk4kMEsnb2vZgf2nIPAPlOzkDPmW9jwi36b0M8updhuD2FE1Mc2bQhoN860omc/R0iTT6TwR5ffNWiV9r8+qxI+VybSxFvyIV+FA//p5GL8Lv5VX0y0sxgaOm+7TzEQtyEvQQGrs3JL4l6dZyHc6GJc+u+v9q+9bKlci747krfHZPQulrt751fVTjvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SReFO7fDnj7SzKY7MhJIBp/Ob2Kh5NHQE7Gvvp3ypIc=;
 b=abX2l6o4qcz7TdAbN3y1DPMKJAwGP4QPnbvtNkml7hBd5LxeyeUn8N3ny5AcCDl2RgaZNuW6bHqBOWq0XpkEIpgy1v2Wz9wa7czCc0r4w6lxyLVyz28fSNNPwLAk5zJeOgvhyfR7ifbNPotgIqVuTZmD8BlFulKjw2CL3UJHcDRFQHuLzjTP0ZyVkV62buXssegbPKerVfmjgws4lz0TWts4F7EJKJqEjpQN/E4G3q2eFyR7aMgiq05CJAKaOFOUw1eAIAREA7O5oScpft6arVL/DCEyopWpk40brtxzHmpFV2t7fOTYz/LjQ5eMYHcTAzmj4I8U88zTzZfYadR4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SReFO7fDnj7SzKY7MhJIBp/Ob2Kh5NHQE7Gvvp3ypIc=;
 b=4USy+waJ+gT17LOEs9z/riufTFrt8xf2Qt0177L5C6ZlTEFYnSqfxcUz0ZlNucLBuLFXPJwiZ9wShRE34YbXPFDyYGnOSQHvoJOq5KbFPwaHZqCIaHOO7QJ2rG3jRm0pWHHOfQOr08Aej5RFVZ3b88A6bWUFxVWNeQVvT0szovufdgwHh5idAf/bz2Dp6wl5xo1faR5Iqn6ZTJXzMdBBgNSOPl9S4A0RSmDA4BGxfrv5jWCLrJAwXhcURgpoOxUBcfKtuVgjDBhRkHYsxFbfyUciOEy1FB4XcMZGOXFMdoqOVTY9VS5fKvymBXDhQUm94tZY1vgNH8Lb9vAnIhOYQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2d3cc4d-4b5e-560a-53f1-380d260a66b6@suse.com>
Date: Wed, 17 Aug 2022 12:38:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <20220817091540.18949-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220817091540.18949-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb42227-ea6c-4883-5660-08da803ca527
X-MS-TrafficTypeDiagnostic: DB8PR04MB6985:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cz23riTRO9WxlIYiFRxHeu8vcGWGrvUZT0w7ItuVMhxemQ1dBTbcwgzz/mGHtmIbchMlN/Ojfvo7qFwZpYfxW6gEepr/tPGk4ot5XxH4zVVdGZirIaOiHQ2ChjwvhkVTVAeqUlMkuc79RU0am8KkGayncqwCADC3qdBpCrXIf1QQPfR9v+G31EIIJaVGmah19f3fd//uquV8wa5wUAgUYvJoavogLXMZssr4nzRcBwQnrEvXShd8bjRW8/E9cepKjkRjJFfWiDorSpFCUqWNomYScMhJ+UjmgUKNehpAu9W+mtLB25zn1QATztA5k13E88Zyd+3tVpZMCHQjVb8uO+UscgsyjtI5AJQvordfjia68yoSiZTZUW5hzT1jZOvNIz+RH1jXQVAQNa8zsvxq4tGpXRo034HUpRT2V7adSBsuV0YZZX7M/yU9ZJ0FMVIE71DGvxY+cYlLvScEUriZiVvsDcK7O8woRPiWIboAxWULrEcxRvVDtTH6hPnMaE756NgQY7KC97ZaYq2DsH2SF1LNE51E9pXgT08OdYPgG02CwTHrDja2A0zMp2HrMFpjWFdhIw192X4QN6A5nA9bFdWWHSQxv4DIjCZIxdynn6nPuCRjMzJxxjCUWV37yH2a4D+sYp5SIbOEQkQXWZ5Nivtq5MpIQR3tiaInNQ22WT/9athV7PvbeOz9TlQu2xheM6l0KMg54QbhjH1iOtdmfTvoue4E2tBsBv8BtWkhpgu2z6+sNrzDxRM+Qq9cNAAi9yILyqOM08iRIhujxcyGndfv5EEAr6pGnpYDqC3St4FFIXrWy6rh44smPNqFfKuJopqQ0WHh7U6pje0N0dzMIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(39860400002)(396003)(136003)(66476007)(36756003)(26005)(186003)(2616005)(6512007)(6506007)(41300700001)(53546011)(6486002)(478600001)(4326008)(31686004)(316002)(31696002)(83380400001)(4744005)(54906003)(6916009)(66556008)(7416002)(5660300002)(8676002)(38100700002)(8936002)(66946007)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUZMNTUwaGJGWEFOVjZZckhkeXRMQytYTmtDS1FIZkJQL25OaEhaSDJIcEFw?=
 =?utf-8?B?dUZJdHZVZGJVK21EMTZZVDYzZGtSRXFmSkpoVmlra1lWZ2lPMjlmWnhJYTNq?=
 =?utf-8?B?MTBRMWp6em5SVzd2QmE5SXR1dzdZZ2pZblFlbFhXL0xsb01sK2FFTlBHN3gx?=
 =?utf-8?B?UlptcG9NaEh4WEdVQy9rbkl6a3hZZnlhSHlNT1JmNmhhaFh5L2cvRW1wL0lM?=
 =?utf-8?B?RmNLWFRDY2xQRUNwWE1nZzNoQ1RJbUhQbnI0enZIK0VEaVJsRm1xbmFXZkxB?=
 =?utf-8?B?Qk0zcGUwSVpXN0M5WkVRei8rNGVWN0tTbUpxbkJoWHJOMStFSEtVSWJBdmE4?=
 =?utf-8?B?UmNOZGJHS2ZCV1lEdlFPQ1BtK0VCYitLbk9HWmF4N0F2VEN1c1lxajdTM3lV?=
 =?utf-8?B?bHQ0T2VtSUVQQnRZQlVTaTUrZ3dzZHhEYkcySkNLYVcvZE8rakg5cDlWcmhQ?=
 =?utf-8?B?NGNqZ0VYZmM1WlVPUFJyMk4vbndpajA5Wi8wTHNqZkRoNDJqdzRZbnFBMm9w?=
 =?utf-8?B?cjV4bE1YbnlSaWxMNWdGblova2lUc0t0VkQxRHNWR0RkVGZ3WHpkRTczMmF0?=
 =?utf-8?B?SmpVUGhha1QxN0MzWkVQOXEwVTlQSGhGb0puWm5DQnI1YVZkenFoR3QrTlhG?=
 =?utf-8?B?Sm9KU0lDSWtqRERnSW13T091WHJDUkxSOHBzT3NPbjBGTnlEUGI0Nmdkb3U5?=
 =?utf-8?B?ek5lRzdrT1RzTllScmhVOUdWQ2Y0dWE0QkJyd1dmT3JLdkRtYkZtY2pWTG9a?=
 =?utf-8?B?bXFTUDN5RkdQbWg4SjRuMEJwb01ZUUd0YmhoNHlGam9OWWl0b1dyUDVkOVlQ?=
 =?utf-8?B?TjlnL2VCSUQ2UmEyYkZ0ZnFQOHBoM1IzNUFyOGpqQ09MZGxrWm8zYURweEdQ?=
 =?utf-8?B?UFRLNnNPTWlBOTYwSmNoaiszWFRpN1VTcEJueURYcFJZdGxnNjJmam52UDhL?=
 =?utf-8?B?cEhGcXBMWmRWaWZlcnJpa3g3T082cjlMTmVHNCtwRi9HTHJwd240bk9jSnFM?=
 =?utf-8?B?b3ZCQm1PdzBTbm9HdkZHWHdITGNpK1krNGxpYTVKNlJPMyt0aGVXa3R4Uld2?=
 =?utf-8?B?VDBzbkZ2MVpxTm1qdnBKLy91UHpYTzFPSlZsdnY5UUxUSmt5Rk52N1VCMFNZ?=
 =?utf-8?B?Q3pQME40Vzg1aDJyd3VHQmJvbWV4WWNsWVZHdXhYbXRxNTZkbkk0Wk10Zlcy?=
 =?utf-8?B?a25aV3lDVTZXWk5VWHE1YlFPMFdmcWR6aWg2YlZqOFpiQ1huMzFlZ2IwZlho?=
 =?utf-8?B?VGFjUWxucU9mVGZTWllMV2luU2F5cS9kLzhSNGIrT3NodEJJbDlsaWJ6WjBO?=
 =?utf-8?B?bEVFWEtNRWw1ZmpCcFdYU2MvcWJaNzlzY1BOZlN6MjY2MkZvZm40ZmpldUV3?=
 =?utf-8?B?dll4K3BPL2ZmVFV4Z01YQkdTNkUwQm9RbmxkWlNac05mc1UrRlllcVFmdmMx?=
 =?utf-8?B?NDUzWHZUM3Q1SE0zNldZVWttRVJGaHNDbVlWYXBjd0UwTVlZbzZoaU9Rd1Aw?=
 =?utf-8?B?TU40VDdKblFXRTBoMGdvODZ5Tkd0SlY2c2JYbm1GZFNhRGFoWlJiTmE4ODlN?=
 =?utf-8?B?Y3lEalN2NmttOVJzbmF2bUhpdTRKT3YzTUlzRHo2anZwSmdGM2EwbzJJbkE3?=
 =?utf-8?B?YnlPdFBSNkNKZW9KMit6WnUyRWg0MGdrR1k1eGRhamlSbTNHdUZmZVZ0Qk5C?=
 =?utf-8?B?RzB5WXRsUVFNRnNJOFU5WHY3eEFRNHI3a3FoK1pYejBwOXVvWlNmakgvcFBL?=
 =?utf-8?B?YXZkSWJLNkN3MW5GTzNraVZkaS9YT2hOWjRoT1Y3Uzd3bkpERUdrLzRSRVhr?=
 =?utf-8?B?d1oyd0hRb2dENXNsc0tnM3podXNVNVN2dDVkVmFBQ3VWdmsvTmd6dG1OM2tp?=
 =?utf-8?B?eFNBa0VyVXNiVVRtZnZKNFFBK2liaGNCdkdxUHRSSHVmZ1pJdlo4cUlOampD?=
 =?utf-8?B?ZUFZMit0TENPK2FSS01FR3Iwb1ZqYnBKdkZ1b3JLWXZaUm1CNnc5NnkwQ3pi?=
 =?utf-8?B?VlREUmZ2alpYSkhtUVJGQTU2YUZDbnpKTWx6K1IzNWxwNG5TMmpNM05GOUxi?=
 =?utf-8?B?dEhRL3E2RGh1WkZ4MHkvMzJ6U2JHRlllT053K1dHZncxK3JMSzlyTmNWSFJw?=
 =?utf-8?Q?ugzmMn0S/ldyWM6humkGTo6jK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb42227-ea6c-4883-5660-08da803ca527
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 10:38:38.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFXrGflL+MDuCXgCua4/PDZHuQqgnz2VaLhP2uOvR6qtUDDN7jkcGDYk5vAsC6mfnfa4JoYRq5khrhSkOMr/nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

On 17.08.2022 11:15, Anthony PERARD wrote:
> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -9,9 +9,9 @@ CFLAGS-y += -iquote $(srcdir)
>  # e.g.: It transforms "dir/foo/bar" into successively
>  #       "dir foo bar", ".. .. ..", "../../.."
>  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> -	$(Q)test -f $@ || \
> -	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@

I'm afraid the commit message hasn't made clear to me why this part of
the change is (still) needed (or perhaps just wanted). The rest of this
lgtm now, thanks.

Jan

