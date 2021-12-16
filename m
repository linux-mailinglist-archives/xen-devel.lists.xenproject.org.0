Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B762476C20
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 09:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247761.427238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxmNW-0002ut-LZ; Thu, 16 Dec 2021 08:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247761.427238; Thu, 16 Dec 2021 08:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxmNW-0002sz-Gh; Thu, 16 Dec 2021 08:44:42 +0000
Received: by outflank-mailman (input) for mailman id 247761;
 Thu, 16 Dec 2021 08:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxmNV-0002st-3M
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 08:44:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 677f7a22-5e4c-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 09:44:39 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-nP_8vMQQP1uVV5yc7_wOnA-2; Thu, 16 Dec 2021 09:44:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 08:44:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 08:44:33 +0000
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
X-Inumbo-ID: 677f7a22-5e4c-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639644279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDUb8ehC0Gnq0bpbJxJyV3kjbUYoINg1gHPuM/ErDoU=;
	b=l4ltGMJb4wkbfj30r5w6fVxWRTFyMVs+Ei2FvO+O31CXBP+sH7btjF2D0EXlAeQjXE7eM4
	C8OYVC0hTEYgqOWsbfVV/ekRVMmLQTBsykKid5+PrTrEZoCt1OvTpiWLkmw4ZxFzsSCd9q
	8PVcF7aEhU8SoUWJk82NTjOgrqiy96s=
X-MC-Unique: nP_8vMQQP1uVV5yc7_wOnA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEpdXKP1nOJOsC98+sGtmlZ7lYdEiChgypPoQkppTMGHSVeTv1ckzTCXgo4mpRosFGOdKDLUaKW1k8KsQ7XCSsAUFfFkJKENbacFd416rcvAolrfTfFClSgg5WymccfIQIp3i0HzlWMEbv2PI2mAXIpZL4KBd4iZ4Rh/G/zaIiHpnRJu8joW3f0wmx9d9ZVCuYk1HJLDrAUlo94YYm6usORPH33kxITFgrsW1VCXHO/GMNVGzrNN/5VB298ee1Kh9ZRvaTXdYZfnmNFyfJx5vB7Op3uQSFhlprOwbx2BkgMSdpS/PENlA7EkgY4JxOiTodMJozq5S+SIFlJNTdPJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDUb8ehC0Gnq0bpbJxJyV3kjbUYoINg1gHPuM/ErDoU=;
 b=eb0DSvlghldXTx0HkL+jPBn64C6YV3mYkujsDFQX403CshTQcYFI9sW7EslmszPYR9iZquoZRbgHnafB7CX9eXONDwHq30lfF4SK0lBI4jkUrF0z0DlA+JeWYgLXwe2v9sgwjwSZ7iaQhEu/H/KIsOScqzp1VTpL9GcC1VVLia7DiUv0ON/1tjI1DemTm0w9kLsVAjMLK1JLQnk0M4ESjhjEBEAwwOb/fAFFPtw6pZ9ZSjRiNgYK6oypnP8I8zYBE0BdS3zDxOrFcmWijy8vBZuZEjghqwjGY0soDFuzu508g7/Ul0dB/VPbtwIQxGY0gdKSTC1mrxNOr6VjuS65ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91fabc88-f4d5-aa0d-be8d-1f1ebf465360@suse.com>
Date: Thu, 16 Dec 2021 09:44:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen: make some per-scheduler performance counters sched
 global ones
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211216054502.14085-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216054502.14085-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0f00638-17e3-4c35-96c0-08d9c07048a5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41902BC6F7B5A7B8B13EE938B3779@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MOwgZ3vy9RvEXQqEhGMOstMOVNYAeSngV7yy9999D7ennfC7hsxBX2LPB6YdlflxgdSY+esD3ZRhC1V32cDZ+lQiH3Xaiqi8F9Ix/Zt/4MRI3ZAdprCX/b+Mhwdgyrin3ws04v++wER/81kSt3Bbf4ytOGfpmLAyYkwLX4tzOcwb/QEgb0aatBzEN1Ddu12wC34654CG/TphD6W+p8OCZpTQtRdzcCkbr+TYU7UQpED80PgaZxkl50UiTMZS6SEj/WcJtAIiS0gY6UjobKPgdK2Zv+NDzcIQv1ynYwvJKF6GNcPuyDHIwdaSW/B7bIP0fNwvfDTdmSLuO7RXEvpohTOnosutaYHlG08Y0EpUJY/cOgDh/XTVM4rZtkdVGo3jpX9tcLOyg0zMJ7qxmOaP5uChVJTFPpNFaW9ekfI6fxZmydLHaM+KW+pmLTGVv547b8ERF8Ywz6+Tjd2m8BwKLCrCLbGH/OzPAQn5bdiIaXeQ1UOK82Ebvl3V22VxGxaTZgib/yoTa7JgDGn/YpmEg1BrRR3Gz0Y79QXAeDHszOSOLNp22qyeGfIFMZjg01K6ufk5dBVbyvpvSpi+rt08ht0X3PIG7gCoau5PFKLQn7W1IDXbGY1AcEzyUIjoE1M+4x8ZeeXGDhTKBckLDx/alCUMKH/+M16vPx9Cp7H0isnTN4gFPrZnWBnhlYn/+1kR+46u6IZfD82PNB2wDYJqFevJ59+vvz8fGO9Ve3oP157ZOZkL+5hWfQLXyDKgWKoA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(38100700002)(66476007)(66556008)(86362001)(31696002)(2906002)(37006003)(4326008)(83380400001)(316002)(6862004)(36756003)(6506007)(31686004)(508600001)(6486002)(53546011)(2616005)(186003)(6512007)(5660300002)(26005)(54906003)(8676002)(8936002)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm5GcWFVV2ZKTllNUi9BUUxlOTF5eHFlNkZhNHAyLzlLaHVBYVBhSmYycFZl?=
 =?utf-8?B?SEJRY3BHZldPMU82M2VOcHBqN0s2VFQ0cUNWb1JxL2I1ZkhYTzNiNVZOZ1Zv?=
 =?utf-8?B?SUltMXdNa2RDWVZ0aE1VaTZ0aG1mZno0TGcxOEV1QUZody9JY1dLVUtGTzdy?=
 =?utf-8?B?amEzcnl2ZGVmSUp4OS9nejU3dFhGVkdTcFU5RzBSSUJXY1k2eXhTZW0xODAr?=
 =?utf-8?B?ZG1xUXdDOEZYWmJJclRkZU9CbjBqOFUySW4zUlNrRWtISEViRUFrZ3BkOG1i?=
 =?utf-8?B?Mk00aXBmQjZDV0NxREpodGNkd0xURTRHWHdRZEZKOFBGRDFwVjRpblVzNGw2?=
 =?utf-8?B?eFV4MUJSMk1UNjRvcmErNUwvMUR4b1N5TTJYQ2Q2RDcxRHFTcUlWd2IwV1g5?=
 =?utf-8?B?eGc0R2oySWtCY2FtMDQ0Y3hpc0J3am1NdmdRN3VSUDJUYUhLbGZ2aU5CZkJm?=
 =?utf-8?B?TlNkU0NsOE11VTFzK0EwbUNSa1YweFB2OFB0QmROM0tUZUxHU2RjQ21KZko2?=
 =?utf-8?B?ZlRHSkplUGtPK203Zy9JbGdCUnNBOFJKaWdMQzJwQ3FyRHVQa1hJS3lOanBv?=
 =?utf-8?B?MVZjdzFSV0NYZjIrenR0UmdOamFlOFdaaEVRK1JKck5wWDZpNUpqa3AzWmJH?=
 =?utf-8?B?NnhLVjJzcWxjK2NlL3QyL0FpczNLUDJ3aEV0VFo4ZitQUUQ0L1lKVythVFBm?=
 =?utf-8?B?N1JBU3B5Q1NYckQ4cXJGNzIxaGpmSU9vdnZQUEg5WmNSQ3BTRXIvS25ZeUJh?=
 =?utf-8?B?NHZzanlrSW5wUEJJQzhERUhva2xyTVpVWFhKbWpnU1JaVlp5R0cvR0s5M3pm?=
 =?utf-8?B?cnZaNTJIYno1TG92Yjh1U2gzOXF2VHdEb2ZrdDdnK0xYWkV4ZEw5bzZWUUNm?=
 =?utf-8?B?bzRFVW14b25OcU1lTkV1L3hwUXVoV3FqRVFiSUpESHNIRTdlYXVXSlNSYjR2?=
 =?utf-8?B?dnlJeEJFTFFvQjZ1bzAxTzVJMUc0Ni9EbVEzaGhnUXBuYXllN0IrTllwRUZi?=
 =?utf-8?B?YXdiNDZNenFiUXR6WXZsTnI4VGtnZTJyMWpYRUh0OXhZY3hGSVAwakJVNFJi?=
 =?utf-8?B?eStOc3ZlL3RLcVZ2WncrY1VLS1AzRTBWck5QSC9JaTlSUXQvWTlpeVlaSHd0?=
 =?utf-8?B?Mkg5THl5ZUtxQ3ZYUEQxSlNtdTNLVG9LYysyWUdUSnFBUkJHa0duSHR4Ym1a?=
 =?utf-8?B?d3RxS2dFTlduamovT0hERmNTYjhRaWJvNllWWTNtZGpLNk9ZeWkvL3M4Z1Rk?=
 =?utf-8?B?d3F3ZlJ4eG5LVnRSdkdPdE1QQ1Q5cXNyNHl1aFFTVU04eVNvanpoTzJ6WjdZ?=
 =?utf-8?B?RzU1NHI2Q1FneG5DMHBBN3U2QzF5N0ZsckhaTG1XUFpqeThSUFV4WUZmT0tF?=
 =?utf-8?B?bnN1YTJUdGZQN3FKZXA2cXhFMndiK0NmSDBMMEl3dnNQdHF1c1FKMWZlUFNw?=
 =?utf-8?B?NFZBOFJjNWR5WHhFMlZOWXJ3NmhzekIwVVdLcW13ZTdMMEt2bXdWL3dQSm5B?=
 =?utf-8?B?VWJ3WUdQa2szYk5GRUV4bTJ2RkluN3ovRE1BY3NRcWs4TVdaK1BpNHlIY1Rq?=
 =?utf-8?B?NEd1d3lTTlBneEZwZHdsc2RqVVhkcWRHNUppOGVZUlIveittUjlyTCtFbWUw?=
 =?utf-8?B?VFRTY3FRcXA2ellZeXo2KytuMnE5MzMzRGhvaVJuTTlqeVk0WVBkYWZlUXBS?=
 =?utf-8?B?ZFczRjlaVlJ4KzlVSXFJM1R3bjZMbml5Ky81R2JqV3hjZzZjTHFTL05DWml6?=
 =?utf-8?B?NFQ0WkR6TTF6Nzd6Y2RRZ3QydzZSdU4yZDVJYnlHLzVzOFZDeFRSaHVmSWJn?=
 =?utf-8?B?WjFZd005RnEyUFh3ZmpuNU02OSs5bFdNZDEzNENwQUE3UHN1VWx4c1dTQW1q?=
 =?utf-8?B?VUZyeDRVenJTOVhnU2wwdFA0enBDKzRZbmNaQ3hacjhMcUZ5NllhbC9RNHVw?=
 =?utf-8?B?Ym1HN2w4OFlKcmt6UjR6RUhJZzBSRTluSmxNSG84UGtCSWtQTitnQ3c3MTM0?=
 =?utf-8?B?ZXAvS2UrZVBvNXUwUHVFTWhlM0N6UVZjNjduTVErRDY1UXNwNUtRUU1GOCtR?=
 =?utf-8?B?V3JjVXlSeHZMb2hoS0FEYW5VQmZjaEZzeU1pRFN6WS9oTkVOcGdMWS9sNVdM?=
 =?utf-8?B?Yllka2t2NkdFZjZqYnZYTG04SGRjS0NPRnRxTmJFTld4NXZ2VDFWT1ZrNnFw?=
 =?utf-8?Q?YYt8tHYAlfdUxueWOoi5z4k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f00638-17e3-4c35-96c0-08d9c07048a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:44:33.9006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7+sQvIahQzQPbFcQoQl4IH5TzGUoxRNt4c9gqjVb0boMuNoKXdHvhb7GngWciIYIfb039HuzaCcOXbImy20/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 16.12.2021 06:45, Juergen Gross wrote:
> Some performance counters listed to be credit or credit2 specific are
> being used by the null scheduler, too.
> 
> Make those sched global ones.
> 
> Fixes: ab6ba8c6753fa76 ("perfc: conditionalize credit/credit2 counters")
> Signed-off-by: Juergen Gross <jgross@suse.com>

As an immediate fix
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks for doing this so quickly.

However, ...

> @@ -55,7 +58,6 @@ PERFCOUNTER(steal_trylock,          "csched: steal_trylock")
>  PERFCOUNTER(steal_trylock_failed,   "csched: steal_trylock_failed")
>  PERFCOUNTER(steal_peer_idle,        "csched: steal_peer_idle")
>  PERFCOUNTER(migrate_queued,         "csched: migrate_queued")
> -PERFCOUNTER(migrate_running,        "csched: migrate_running")
>  PERFCOUNTER(migrate_kicked_away,    "csched: migrate_kicked_away")
>  PERFCOUNTER(unit_hot,               "csched: unit_hot")
>  #endif
> @@ -67,13 +69,11 @@ PERFCOUNTER(acct_load_balance,      "csched2: acct_load_balance")
>  PERFCOUNTER(upd_max_weight_quick,   "csched2: update_max_weight_quick")
>  PERFCOUNTER(upd_max_weight_full,    "csched2: update_max_weight_full")
>  PERFCOUNTER(migrate_requested,      "csched2: migrate_requested")
> -PERFCOUNTER(migrate_on_runq,        "csched2: migrate_on_runq")
>  PERFCOUNTER(migrate_no_runq,        "csched2: migrate_no_runq")
>  PERFCOUNTER(runtime_min_timer,      "csched2: runtime_min_timer")
>  PERFCOUNTER(runtime_max_timer,      "csched2: runtime_max_timer")
>  PERFCOUNTER(pick_resource,          "csched2: pick_resource")
>  PERFCOUNTER(need_fallback_cpu,      "csched2: need_fallback_cpu")
> -PERFCOUNTER(migrated,               "csched2: migrated")

... at least for this one I question the use in the null scheduler:
At the very least I'd expect it shouldn't count what's being counted
by the other two already (i.e. there would be an "else" missing).
But then I'm confused by the the use of these three anyway: Why do
things migrate under null in the first place? This looks to be
contrary to the comment at the top of the file:

 * The 'null' scheduler always choose to run, on each pCPU, either nothing
 * (i.e., the pCPU stays idle) or always the same unit.

Jan


