Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AAC70EF33
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 09:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538782.839008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ikH-0003hB-HF; Wed, 24 May 2023 07:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538782.839008; Wed, 24 May 2023 07:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ikH-0003eZ-EG; Wed, 24 May 2023 07:17:17 +0000
Received: by outflank-mailman (input) for mailman id 538782;
 Wed, 24 May 2023 07:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1ikG-0003eT-86
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 07:17:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0255c00a-fa03-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 09:17:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 07:17:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 07:17:12 +0000
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
X-Inumbo-ID: 0255c00a-fa03-11ed-b22f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLRbmfC6SI5SUP2Sr34KmLEo90YVSvHrsAkzxyRDWXeNX0nuHyLjwRHsrLygJDpizA6ZTJQBINafseRFoSn9JXqTflz05l+UX83FueHjFmCenpEbdOLz3WW0NyXn3lUe+LTByfOhs91EjeIe4f1wzjSmMp9dEIrj+jz99a2DQNfmMR3FgOR7e6E6zXmuQb75s2kE1olUGWlqFMgPJxTypUjeiYxgufgKIC5L9zZye8xJJdUz9KsyHJRCtTtUXy0sfFhj8ewgpO6ClU1cY7ThsEMS9D+Djy1TixjwqYBBOlJkrG5r8Sw5T80n6MfTx3UmMxM1zuX3G9rrqhu35V6U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaYgCrM4BZ3oLejbA1usdbUF4x0f5gyf5/bJsjpPHUY=;
 b=M813DkbUcBxXq0GydeA2hdEeqRL1n6pJom6bCHy/zVV43SoOkXzd9ev334UsZifrKLRPqXBV1iVv+FgqbAiE71/4Seej4D7Sa5crV3rWWGlCHWB7Y0W5DcccOC0Leb5qOPJKuZ+wvmSRm+Zfty0Mr/ZJ3i2z01GSbYrrohTuYcgEcSlbwx/pr/1I92naIsMRhm5Xz6ubc0Q6TnGjYUNRJ85bkZdjlaBzrhK8E1oweU/AJbSZk3XVreGkNW6I32KOFbVqQ+TLafiYcPCakvaFkNbcQfbH4sIUJQWrHK2C89y+es7ts8kR9/1MmudQeFB+z19ePv5FEBxBpChGrfuZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaYgCrM4BZ3oLejbA1usdbUF4x0f5gyf5/bJsjpPHUY=;
 b=rm4Qt/cAEVriYjyEI/EuJk1LQHyR3YU9iyWdnsOS83uaeJjMZynXfly0rnC2GGPRnetzpk+wN/qkvXOcvwDg77rA95KjrWcY5sce5VeMUHPpKpDSJlRvg6wL4nAkprQLcHiQRYYrGtLN5q22oLL54pqynWkSW9XDF2xAAQd0tNZsdzcdTGnhYfKIQShqP3lyd06u6Z6cGDnELr46clXbs5oIhOE9RmEWk18zSJd7p0nGafmz1ZT0K71CjMGzLDmocz8rjG6P3FHPQiI/GMjprdCwMfjoS7kZV/OHTo+c4WUu9k6hBLebZMvLGFnNK6RJK3GQRWWV2u/ITBislsJLkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e8f44e5-7dbd-5369-2ac5-5cf171908648@suse.com>
Date: Wed, 24 May 2023 09:17:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 05/15] build: introduce a generic command for gzip
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-6-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a15ea8-955a-4dc1-4583-08db5c26e4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BT2T1NM2suSbchXRoMs1V5g6KDIRvngSImSaWhOSFUgttLMx/aJSR2bBDHKatPzC4m1Oj4wdgVD7nmzAhPw7DYpt/QEXKTlk3AKDhD/guvsslw3PThCKTBT8svoIhLN0hbVzn4EfHfCmiX12oLhx9ifHZe7oyimj4mchKFjAaqF1B/CzdzWzUpO/hXc0U2Tx+on+cCSTf4RcDI8bSf3vv8hihGkjCgfT+64Z89n4qNGi7sIWC1RP4J4vmGPAReDzlcGWaHRXOM2JHafAnYLD6YIKxJSB8c5NF6daxXieDkyaQiC5oDtxJQU0ws68lRuxSiyfLdIlsEeDMsZ0lMJa/Dwq7SnuonEQvA/hdVOlnihgRdi9aJBjkANhPP61U7Mc/RehjxSzpMDheNtwK6hRA8P8DJMgBOWh8v7FxQ5jHgaCAuGj7/D/LCER1FzxFxyWIIZARf/vs4oprXMFueTVToCpauBgzG+9fzq47rFbPUwm0Sw3CHBbawRWOujjGmqztXwe01IkmJ9DhVEheRQSS0iXPmxrr7aOrcDXZgaSKTW+AVD1+Q1P8a5DDKqfHLw9HvV/3kwcyG7y7jP2Wo1o0D5aWC1Y0xSv3K1rKc9qYDHZYI4jkNm7CQ/P/Q0arazkDSWyhIqTnle4Uma5uiSc1PQ3GnlKRGxmFr4o3g7dts0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(6512007)(6506007)(26005)(53546011)(38100700002)(2906002)(2616005)(36756003)(186003)(83380400001)(316002)(6666004)(66946007)(86362001)(66556008)(66476007)(6916009)(4326008)(41300700001)(6486002)(54906003)(31686004)(478600001)(31696002)(8936002)(8676002)(5660300002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0FjWDA2cmxhdG9qUWxmejk3YkVIc1lTU01EQytMVEVLUHJIMUx1VTh0Tnlq?=
 =?utf-8?B?U0dKWS92YWlTOCtqZmdWUzdkbStSUnhhRTllSUxnbkFKVTNPU05qcGRnVmt5?=
 =?utf-8?B?UDlxc3FWd0FXNmlaUksrMlRGTCtDKzQ0SWwxbjFrZ1J5eUtxVEJ3UGIraEdk?=
 =?utf-8?B?VjJGQU52K2NFZWEvVmsxTm5qNC9rdE1oNXRUeTdzeHhnMUFqTkFVbU14cXJP?=
 =?utf-8?B?dlhjdkNrbGtrRTZwRWVucHhkbHljWVMzaHI5azk0TTBUa2dUZ2FpUGppRWpl?=
 =?utf-8?B?aUhqODNXV2xybGNXOXBRNS9zcmMvZFNndlpaZnRKUXdobGFVWFNQWE9XRVB5?=
 =?utf-8?B?RTA0bW5DTFZYcklTV3RVU3R5NzNMUmpnSUd4Vk1UbUszZVRBeklxTytScm9X?=
 =?utf-8?B?SThqQTlEN3d6NWJKQUlnb3lBSzhsUlF2dTMrM0UxL1E1L29hUWZTSUVaVVB3?=
 =?utf-8?B?SXV6Mk9WRzJSOFpneUhTdjJ3a1ZhUGlQOWlnTUFOdEt6SmFpbFhtdVJTdThh?=
 =?utf-8?B?SFEwMlJJYmQ0ajJ5WWxZRklNYVYyVy9xRzBGK2xVT0lKRG1QdEJzK3ZzV3lx?=
 =?utf-8?B?ZUNTQ3lHZklRVjQ4aHpEd0ZRWjBIRW1wMFQyWXFLSHlJWkE0MElLS244NlE5?=
 =?utf-8?B?bVBUd2ZzUWVTelNIYU9nRWdDTE91Skl2S2p6UmxpV2NCYUR4U0IwYW9KUVFa?=
 =?utf-8?B?L2YwRStlYjFwZmlKNVMvU0g3cVFlQXJ4ZVZ0aUFBb2VRcUlxbUR4c0ROcjlp?=
 =?utf-8?B?UTFpWUVnYk4rTU81Nk96dUtYWG40VHpmbStXMnZLYzR5QnBBOW54ay9BcEJx?=
 =?utf-8?B?QWFoSUhrMlMvY0FUOVBjaTlYQUpJZ1BzNnA5YVVFdW1CQlNsSHZ2WDZCR3Rq?=
 =?utf-8?B?L0c5SXp1Uld6RnZ0aXYybmw2RzF1WkJCVDVNWmdEV2I2VFpJc0FSUGtZOW92?=
 =?utf-8?B?Um5zUlE2VkJYVElOMWlUK3Nqb3RQNWZmME5qWVRzRmdyd0dDVk4ra2owbGw1?=
 =?utf-8?B?ZUpPU3RqZ2s3ZnBEYUJSRXNjclJRZ05qQ0ZwdlZYd2c3WTdkTWZyNUg5VkZw?=
 =?utf-8?B?aE41dUR2MFgzSTNPWHZCeFQyRVMzSldNRHBFUWRQM0xQM1UyejNVYWZPWmcw?=
 =?utf-8?B?RmZyb2o3aDRyOFNLV3l6S2ZyTm5SSlRDN044ZUgvdHZqNmMxTXZmeDNTaUlD?=
 =?utf-8?B?dmJRdVFEMzIzUGdQWHlxTnNZeDRGbEpjZjRmZTBnZ1RrR2ZyelJGWFJaN0g2?=
 =?utf-8?B?eGgvVlEvRDEvMUUwK0hMbWhmOXMvMzM3VXdTb3MwQ2JXWTc3RmpiQWkweWU4?=
 =?utf-8?B?VExPdUgwN3BMTklVMmk0bUV3NFNDNGhJYXVLQjFSRHBJKzU5YXY4YlBuZEZ2?=
 =?utf-8?B?VzQvSWJld1dkRnpuSlpaYm5nZERVSFdpVjNGbVIzMFRKaGdYU3poUENueSs5?=
 =?utf-8?B?eXRuem9zWjN0Qy9KUXpITDhveklhL0ZYZjE0YkpjaVNVQ05YeDFLb3dIMkVa?=
 =?utf-8?B?UGRHMWxrc09JZXZ2b2xDbkdnUWNWWlg0ZVFBa29Odmp4cVIwczlSekJibHF5?=
 =?utf-8?B?TGVtMlRPNWt0R2I1eWRsaGZ5eE1kb1NLWUlIK2ZPS1dqTU5FS3ZLUXNTNFlZ?=
 =?utf-8?B?MS8yNVQzR1Z5b0JWemxDYno5Sm9EZWQvRGZTeFRJcTJwTTZ4aVIwNXVJSkZZ?=
 =?utf-8?B?M1ZER2tJT2REMVZSb29vOVZDbkdhdGFnSUw0UWlDbXhKeFlUbHVxYk81YmE0?=
 =?utf-8?B?S1lXNzFienF6aEhQa2xYS28rb2lOWU9vVjZGSDBZRURpbU1tTVJTdFRVSGRa?=
 =?utf-8?B?UGtBZklRYlBNUkxVdkVZdUorRGQrWEdRblIxbVRMY3d5bjZNaUtETkM0ZmRM?=
 =?utf-8?B?bURlaU5nMzROY0ZjRENHMC9YSEFRQ2gzb1djSS9wc29xTG9uTUxqdE9KL3NH?=
 =?utf-8?B?ajA5cnpWYU1TbUgrL1JnSkFFZ1ZxL1VPb3l6eGFMTkEySGx0bHNEM0pkUDBN?=
 =?utf-8?B?SHFyRFlYVElJdDJmRTVTZE1wRE1XMlRYNWtSYjJBbGdxSk9xZzhKWDRRYmRh?=
 =?utf-8?B?cDFleDE0aHg1OWUzVDRZdEROQWdBakVZOTdQc0VZeEhIS1pyVVVDVmowOEZv?=
 =?utf-8?Q?p7/DcwdBZhgvILpQO9NF4Qaci?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a15ea8-955a-4dc1-4583-08db5c26e4b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 07:17:12.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1lX/DWq+x9lEctvb9eNl+6j8CSdlLH8ey/unHJIojf5lsMHN29rcZ9lWo0PNzyCJzj+wwULHP2CQ6LHKscH7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8813

On 23.05.2023 18:38, Anthony PERARD wrote:
> Make the gzip command generic and use -9 which wasn't use for
> config.gz. (xen.gz does use -9)

You mention xen.gz here, but you don't make its rule use this new
construct. Is that intentional (and if so, why)? (There we also go
through $@.new, and being consistent in that regard would imo be
desirable as well.)

Jan

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/Rules.mk        | 5 +++++
>  xen/common/Makefile | 8 ++++----
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 59072ae8df..68b10ca5ef 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -63,6 +63,11 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
>  quiet_cmd_binfile = BINFILE $@
>  cmd_binfile = $(SHELL) $(srctree)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
>  
> +# gzip
> +quiet_cmd_gzip = GZIP    $@
> +cmd_gzip = \
> +    cat $(real-prereqs) | gzip -n -f -9 > $@
> +
>  # Figure out what we need to build from the various variables
>  # ===========================================================================
>  
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 46049eac35..f45f19c391 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -78,13 +78,13 @@ obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>  
>  CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
> -$(obj)/config.gz: $(CONF_FILE)
> -	gzip -n -c $< >$@
> +$(obj)/config.gz: $(CONF_FILE) FORCE
> +	$(call if_changed,gzip)
> +
> +targets += config.gz
>  
>  $(obj)/config_data.o: $(obj)/config.gz
>  
>  $(obj)/config_data.S: $(srctree)/tools/binfile FORCE
>  	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
>  targets += config_data.S
> -
> -clean-files := config.gz


