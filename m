Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2465FC0FF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 09:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420805.665837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVii-0003sb-RC; Wed, 12 Oct 2022 07:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420805.665837; Wed, 12 Oct 2022 07:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVii-0003qn-M9; Wed, 12 Oct 2022 07:00:00 +0000
Received: by outflank-mailman (input) for mailman id 420805;
 Wed, 12 Oct 2022 06:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiVig-0003qh-Lz
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:59:58 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2073.outbound.protection.outlook.com [40.107.249.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3014c0-49fb-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 08:59:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.39; Wed, 12 Oct
 2022 06:59:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:59:55 +0000
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
X-Inumbo-ID: 7b3014c0-49fb-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LULjrTgtBdW7nCUrUP+SVrwPYK+jFWflmRtPTtEX7lDc/JmQ1HrpdY0mqFoBNe02eAEobY5FWmVDw61fmRlRDdssRmMu3r8zk1973XS1SkcwN49ok2Pia2o5tCwNHO1cCA4GoFMho50D5gSk8859S5q4nX/yPF9avzIn8POBYdYssjRFhEQZWsA8l+x7pzvAUlpMJEhpzN0yuKMpM0bPWZaQjrDo7sGYG75RWNbfLvYVsV6ljHny4RcnMlrqpCkI6upT4B4vLjKvTzHPPBhnPfCbgpo14Z/Z3OyutocX553uekMBuF9jn0dd6F+YJpct+wfg9lkgMlFHWYzpTbQtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dv01eeo9+c6GDuIHwx7AmNms/V+0F4tcQVHqeVNHQdk=;
 b=iKrQIJX61OPsviqaxx3Js8Sv6U75Yj4LEKvaFtAHyPKFinl458gTaQ0WFVILWUwMiNf3TXg9NkF+6p0jXW6Z+uE1hnatvxXjlpt/0tKKZru/C/vja0VaoA2PdyI/zY5AxdE4crY+Uao+TMlfFLkh1KwMvSInk1DwPxZFAws1/Z4IDxfzKmrmriTsyg5WQ3mFc3ryNv1oXrPHVubzTaMs5q1zBXAHLDCeMK7hvUnXa9jFlYFN49RQl6CbE9dUXmx5uRtOPY2NOsUaqy4Wt/D0NCejeQSDS1pvrHkxLE4+ZzJ5d9b/quccrmSGQ91SwXCTWdSKLeLNaZgMomkzdyypiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv01eeo9+c6GDuIHwx7AmNms/V+0F4tcQVHqeVNHQdk=;
 b=IBaP+TfQ6NHGfLT7is5+Jl+CnQpbESjF4VF+vPxktk2NUy42NSfBRaKEjH7A3vPqW4Ew1Zf8FMqkReYmttKnL5JjyXERL97BROUJlZHQtw7lvsBzyUMifOQQKKnWY6Yd9CajLmDnMOLI+Py6KlpoZy9K+elbT6tff5uyLnOJdzEPnJ+pYQPGlBGUd8Z5lZC+gQYvn28ijMyCNs/Yoycp3ApGsjYHVc1CzxLHIWNZ9wStXDV8f1zHzFsQorTH+g1jZuwdD0l2TXZDiUQaf+jeNCGCN0vrQ5rclCuefelSRkKARkqvBi0iCNcDzCkZGBAkIdfpAJLIFrKf2tDH9pwlpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c438faa-5251-4fb1-f3d0-ef3d8533ef5d@suse.com>
Date: Wed, 12 Oct 2022 08:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/2] acpi: Add TPM2 interface definition.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20220915204029.1227112-1-jennifer.herbert@citrix.com>
 <20220915204029.1227112-2-jennifer.herbert@citrix.com>
 <DS7PR03MB5414DE39CD2F506EDD49D822EF239@DS7PR03MB5414.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DS7PR03MB5414DE39CD2F506EDD49D822EF239@DS7PR03MB5414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0457.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f7332d-61a2-4220-a0fb-08daac1f5e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yOgTFBcGMqPfOw1hyJail6m7L2YeCy6RBXJHzmt357fBqJ/UzzRCO8HLMfoR9vo5nT58wo4fWhvhGWN9E6kyvnV5UyVNtko3H37kl4mgWek8ijkrFXqEsD2iL1WWHIYzrFK2M10Q17emDWWx6jJSUeooh7J1aWTtBRQeZXgTe26P4Y29kXK1sjVJ4UbhW/9O99fTV0aZBV65E+DJ0pQW9TKELl0pO/ztP8j/dJea68lv+WSpSEGQqufSdDQjOXSGZ+eQJuXdVSvawG+rtIgzv1m9/9If7uenQk25eHOhszwfKUoSdx9T8gr7egCy99u5oVsAY8Bff15F8SPcNysNyzSku5t6rnXvKdcmWzZjeTmmIIjwMk+zDTjoQxyiPrKKIs3NtzEFTbYysPxn7D96Ttq//Ehk3TCjvzTkOEjFA1R5h2AQxxJRoUWhtp+SiCEc2x4zePKy1fkmTYKdSzoTUGt0xwMXLi0CaAOl+Qm+sajk8FcHRL6BKN4hVBFZeGu6CETnXPcGK8voQk6gDl3D++kvrfUrcjGrnJuIPiBe0/0jOyfnnh+zZKthlhfR+YzIZEqX8/u2/zjHo28RTeYYH1M2JQI/el8N9r9FZS0zFs7gDKY5oh/puOjF/BJ2tCVirhmSGZDZ+aDAqamkB+WuPcun58K9xBW/zGJtmY6J2V84U7gwnhOZYt4mHyD8Jg2KNPN6HRl0eMRNs3FBDk2eCMEVSMzI6Bmiux9GyGSSTniRdDI0gFiU3uzBJlubFFySwhR4TdBZuLWiVbQFtn8KlmmvkfTZx/19H8tXbi0Tjd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199015)(31686004)(8936002)(66556008)(4326008)(41300700001)(6512007)(66476007)(8676002)(66946007)(2616005)(558084003)(186003)(38100700002)(5660300002)(36756003)(2906002)(6916009)(478600001)(31696002)(86362001)(316002)(53546011)(6506007)(54906003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnN6Smpub1I4L2xZQlNQd3poMnJRbFQyeEd3UTgxNU9Bbk51Ly9rSUgyOStE?=
 =?utf-8?B?N28ycTBNRFRlY1k3MVlDWVo0SU1FcW5OQ1dkSmRMTjZuMnF2QUYvT2pzVjFt?=
 =?utf-8?B?UFhQSmxCWjIwSHpIc21nWHlyYmRCZ01LVjNjMnZYUm9aN2RlOTgrVDBwTURQ?=
 =?utf-8?B?YTNQWWhybGJmSkIwK04zR0IzQTQxOVpRSFNJcllwaFY5MFBUR0x5K0xXQThS?=
 =?utf-8?B?TUtyRDVSTzBqVGhWK2krZUwycDJ5L2dHZXVRSEVOTjlFSGxPK014UXVMVnJI?=
 =?utf-8?B?dlNkRzRtSFpuTnlkZXAwYzF3c3lnOGQwUDA3L25GcVdtTjRodXNWc1lMUlA4?=
 =?utf-8?B?Q213UTJ4ZnZpcTByTVo0QWlXeWFRbllwL0htUkpic0x6a01DRmZYMEtVWENH?=
 =?utf-8?B?cThzYXdrM1Rlci9ONUxSWFkrOGcvT2VKZ2N2YVRVNTF6c0NaSThsRzNXTjFP?=
 =?utf-8?B?bHh5WkNUTDRZT3hIZzgzeXJsQlo1UXdCQ0wwUHEzcTFsUTF6aU1PL1hBY1Fj?=
 =?utf-8?B?THZCeEtFNHZVRGRDY2J6cGhGdUdITnhUeUVBT0J0Q1FFS3R1WTNRd2ZtSDBj?=
 =?utf-8?B?TDhrYnFDdkdmaWY0OGp2UWpGZ1lKWkN4K2VuZUUzbWxzcGtBS2pGTFVBMXhD?=
 =?utf-8?B?NkhURTRTK2FsYktMSHhFQld6Vm1YK0RETThSbWk3cXJ4ekgwcEJQWVR4VXZJ?=
 =?utf-8?B?bG5od2JVQnlkdWVLd0MrZFlZTmx5amJiVG9Jd2tGYjMvbEt1RlQyeC9UbVVV?=
 =?utf-8?B?NE1FUmFjdjUzNDV2S2VpYjdCNXB2aWxpbG5meVdvSGFQa1RxbWhnSC9tclJV?=
 =?utf-8?B?Q0ZtSUMxQWY0VFAzZUIxUUlnL21TZlo0Y3UrUkZvZmlCV1huTTVnS1RMbGRD?=
 =?utf-8?B?b1p2Znk2ZU04WElmVGRubEtDMHhidDUrSExGWlhjMHh2dFJSYWRDSEM0S0FJ?=
 =?utf-8?B?VENESjhLUGF6TWdTNVdMVEZSWG9vQi9Odmprc2svdllnQnZRNzQxanNYZDFq?=
 =?utf-8?B?OGVac1ZSMW8xTW5TbE1wNzNpblJmcldTRHlidWdBOVh1NW5RTDJLU051bnpU?=
 =?utf-8?B?RldsM1hRVmpoaVc4aXdmekhlUHVKcWRMbjgyYlVFMk9VOWU2RllyL081aUQr?=
 =?utf-8?B?NnIyQzVLcjYvNkVmNENGL2laTCt5RC8wYnBvYUZ0cUlSd0xjYnJJbUxNa1Er?=
 =?utf-8?B?VHBUWWtVbHE3MmtqOHkzQk1rRGdpaS9IUDJscmtDLzRNMWh1Qm5aellwMzky?=
 =?utf-8?B?bmlWRGFKS2kzdHJYK2N2OVl4c0xQcGx6Q24zQ0ZMdTRpWHd1UFJjTGgyY1ZV?=
 =?utf-8?B?U3k4eCtzZ3E0WFg5d0RVaERIeHBUMWlMK2QyR3YvVUZyZDRpTHBzUldIU29q?=
 =?utf-8?B?YjNjaXdZYXlISHp2enYxMHVUMEVKS1owOVVXbTlPYkR6V1lBdFJoVldqcUEy?=
 =?utf-8?B?RytrRzNzVWtWS3g0dmt3YWRrSVhRV0tua3RIQnBIL3R1R0ZtdDRCVzhSNXFy?=
 =?utf-8?B?elg1cTNYTjBvWjEveDZxQUVxVnZmWWNSMFBvSEE4eS9oZFJSNTdwTTl1WTNo?=
 =?utf-8?B?QmpjZGlQQk01RjZtcmJBTmZCd0hSaEFzNitaTEhnYmp4c1lyQlh4cGlFR0pG?=
 =?utf-8?B?V3Rwc3RQQXFLNmZLMk0xbjNBQnJJcWhoNStndE4xby9HQUdzN1c4SzBXZENE?=
 =?utf-8?B?NE9oSHcrbldpblNmVFExN05FSHJCdU13ZGd4Sm5ubXZEOTA3dWlXeGprejZS?=
 =?utf-8?B?T0VoTXlVTVhEb1F6cUxDK2QyenZ1R0wrRjZWZFB5cjQ4OW9WTVZmemZTS1VM?=
 =?utf-8?B?K1V4aUl6RXY5aFZVdFRTam9VeUoybjZCeitYM3B5RUwyUXJFMVpyd010NUVo?=
 =?utf-8?B?VnBWd2FyRVlzRk43RzlSd1BvQUFZd2JBRU01byt5alYrVjJ1eDhOWjVQQk9S?=
 =?utf-8?B?Titqb25jc0wyOTRvbjdoSy9TTE80OFlselBvTytocDNjVTNjb0VkWk1Dc0Jh?=
 =?utf-8?B?eGduSEZEd3pIaGx2VEhHWDAxeUY1UHZmSnN0aDNpWHh3eGd0YzRhYzNxa2Qv?=
 =?utf-8?B?MXkrTEJEY08veG9RcTNwcGZBUXVZcG1xS0sxbTZ1QWNPLzNNMElnUTJ1blIz?=
 =?utf-8?B?d3F2aXVlT1dJT2dLd1hoa0FEM00rVVp5aGZDQVZZa09pQUltbmoyQ3RmeG1F?=
 =?utf-8?Q?CH3ls+v5D0f+cuw3NGU/PJexIUvkbDPr9YG4wUFZAbfq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f7332d-61a2-4220-a0fb-08daac1f5e73
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:59:55.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpwmSH5KQiIyGOo8xIyXnn74gAP4VNUv620PxW7m4+ny39an8ldT5hBd/NUrG0tcJCzo6jwG89yZuXhCku6AXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285

On 11.10.2022 17:53, Jennifer Herbert wrote:
> Are any further changes needed to upstream this patch series?

On Sept 19th Jason and I gave comments on the series, which will want
addressing one way or another (presumably in a v2).

Jan

