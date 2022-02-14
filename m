Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA44B4459
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 09:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271213.465562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJWpt-0002qt-FQ; Mon, 14 Feb 2022 08:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271213.465562; Mon, 14 Feb 2022 08:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJWpt-0002no-BE; Mon, 14 Feb 2022 08:35:53 +0000
Received: by outflank-mailman (input) for mailman id 271213;
 Mon, 14 Feb 2022 08:35:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJWpr-0002ni-RG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 08:35:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cac1751-8d71-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 09:35:49 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-rQL8-wCnM1inenlQ_GI8SA-1; Mon, 14 Feb 2022 09:35:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4250.eurprd04.prod.outlook.com (2603:10a6:5:27::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 08:35:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 08:35:46 +0000
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
X-Inumbo-ID: 1cac1751-8d71-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644827749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afKhXFrMDhUUQ7oYTlAQJHdkIdmbKvx8UuZLSRateHE=;
	b=KfWG6LNYR3X2HsBs6m0aghhq+5TRS7Q4Qj6ipSBAvNO15tG3unuAd+/3pJCg3Bn90DAMez
	TWHZAk1Psg1T3uwQnMAwe9C8zaWmNXzdAMCYUqKjy446qD9upJ8ja2h1hA8TVi5HbaUVX7
	DhlsCyaDGe12uQ/INGtvG2QMl/c8pSY=
X-MC-Unique: rQL8-wCnM1inenlQ_GI8SA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqVwa5LcUDNRiPXHA1UBvJaY+Qgp06SaAnXqeMF3FmzwyzS61ZWxpjK8LvdwBzOAqxwO12HsZUASNTvH4avC0jz8hDTzfCRRqWeLxeqptupTkQoH0tfAn3p31DSYvYwTwO8nnf2CWpp4UB32sU06nrAAxelKBPWGbzYwov1B8jbQ1whrl19fDFGVzxXjXIkVkZidRSpDI2L5GNc4l+lq4X8Vt5nDKyHQ5U0RWvxSKyLTucA9iIimMqk88WGATFRrFlq2xUjxNnaSxnVSxZW9Ytd4+j1vo3xrXDELyJyBOkSI95GyE595oQQYOhXzL/iOmjrxljVG6FgB/PsNwPjx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afKhXFrMDhUUQ7oYTlAQJHdkIdmbKvx8UuZLSRateHE=;
 b=grWtPw+7aKMlkEsMW9KuYhQ4/8Cr/C3me0eXmLPVzlQEkZXPtdmUYYsndcrXFPHSiLgMjIWjeDo1lALFfcy4FSGVkQdbt9TX9A7fKiME4p5/6koncZj7QoVqwQoFYhrc7s+9MxaW2DAUiIQqvIhs9sacPdN13PdzcMGqXseVg65iANvBETI58ZfgpG7DdYk0yxqiHTnOAZnfNnixsQqtdvXv3b47+2P6bN0l93EShg4HinpcF9g+ynx8bitj7Sh39JiOTKk8ZvJTSmv7K3gW13zPdWBn8pKGE08hvHJ/0qT1GR9JRu3NIk/4QwGLWQwCwee1IsPcg9XbGVp8aIpg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7c7eed8-eb12-5fef-ceb3-e4216aa0918c@suse.com>
Date: Mon, 14 Feb 2022 09:35:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH CPU v2] cpuid: initialize cpuinfo with boot_cpu_data
Content-Language: en-US
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220211152559.27862-1-nmanthey@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220211152559.27862-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:206:14::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7c7bcea-497a-4f8b-a0c9-08d9ef94fefc
X-MS-TrafficTypeDiagnostic: DB7PR04MB4250:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4250B804F81B5012CE53C80DB3339@DB7PR04MB4250.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ktWxbovZsX400bEHbZYe/VmAnTgcL15x+2KcCmLgBKiVdsFuA/JTC2kYoI+Wg1hi54sjMkM1Ssl8nyc6B6MabXEDK07TEwzV4mDLG/l0Yj3f18zbcGbkiytyUOc6QVeW5hOqWCPQFRIWNW4WuItEgqn5bLBly3k8dKWdUOiPXwATos9e4IduYvWHPAhBSQC16LODMrZmFl1rtT1uSCxy9vKZLgdJKjFWNSWwlsJRtqbV96eDDvKl2+lBfT4GOGON3yfxm+vgot2bT8dHAf1ibPBNH8mHAOChtgn3AVijrNbpyXxDpEK3H4COrMEBagaCpBNwythSA11p0Da51G+5Ndd5lXFeXmWJuCt3DB7u3wEM3WFHeGVa/MjvcPabxh+7/1Ty363XAH1hqlM1PEyvAe9W49oxkhVwfCz7o0Xd+L1KJVkBHfRHbe5sPMLWf6TMxBmFi9RwOkqVCw6cohHw0nHzuDq/qM+ziY0FalhO0ybanuZWMhhyLUtjDGv/EpNZihjI9Rll750knpZUtDnkjmqHbGm3drgH9cY/qRoORJUkf+lXPQmMdkhIJ/D9S5tDi3l73Y6msSdhpuXiLPg8se0RaYwN7SHqTlusANtlYqTYIcIp342lketse+tKw1xjJUW9ulyMzR2aBf/8Neyag5TgU71Y3l7oOOdt7GF9wp2FYT+z4TJh54zFSanW3QbslqpEiY12ckoIYZr+LhaoIif0+BQ5R1Xtmfwn5EKIWnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(5660300002)(186003)(83380400001)(4326008)(86362001)(316002)(6486002)(8676002)(66556008)(66476007)(66946007)(8936002)(2906002)(54906003)(36756003)(6916009)(38100700002)(31696002)(6512007)(508600001)(2616005)(31686004)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlM0TVBpOXV4K0VaWWJWZTdPNE5RMi8rci9PT2JnWUoySmd4UFNnRDFET0xY?=
 =?utf-8?B?MkQ0dzFKeW9vbjJXd3RoU3dRL2FiQ2Z3T3VCaW1kQTJJK0phSXZXSHVXMGRi?=
 =?utf-8?B?Zm5SeFcxSWI5bjVucEN4cG5Uek05S1NuNVNqVnhRRzBEN0ZIZTNqcXBtU0FF?=
 =?utf-8?B?TUN4T1JFK0FEazNHcU5GY0RnKzhVbkk3VEJUR0kveFZXY0VmUzRYS09IdzRT?=
 =?utf-8?B?Uk1UNTVOVlh1ajVDQURIRyt2TkErWkJSTmN0RXhrOEZJK0JqSWVFdklKaGY4?=
 =?utf-8?B?WWhUVmxrdWVFdGxFU3dYWm1WaXFrQ2IxdWFZUUVnTUZxd0RBNC9rRzE0a2hn?=
 =?utf-8?B?aitWNzBPSTNCNkpGdFFHODR6UmxiTFREQkUwNFREbUYrWFpsZ0ZZNkU3algr?=
 =?utf-8?B?VW9CTkt6aWFpZ0U2Mk1mdm5SYmVWOEExQ1NCckhMU1NMTzlwTUpiaVhkV0Ry?=
 =?utf-8?B?N3lwNmNsc05Mamt5SDhnKytBTDJVS1YwNXFDckIrNXA0NXF4bXp6YzNuak1N?=
 =?utf-8?B?eVRVQXVCNVAyMUZqaXdJS2lyUTdHUCsxbEFIUXJNS3M3ZzVlK1kzUVhKcWFT?=
 =?utf-8?B?U1NRKzdYVjRUVkxSVU5DVTNrN1BxK05qL3hJVE94R0w4TnJCdHRzS0s1aGNK?=
 =?utf-8?B?cXdTaE8vQmlqZnJmRlVwSkRWZ3JQN250T05zZUsvNVdBanJXMGR6SktXRSsw?=
 =?utf-8?B?dm03dSszQlBLSjR4cjhrbkZOS1Q0VE1HVnpXZTh5N2o0Y3pZVVRUdlNweHht?=
 =?utf-8?B?VnNRYnlzbnFxbjN5K3A1UWFrOGptWC9xSlJnZmdlUksyVGRwY3F6N1ZSc2ty?=
 =?utf-8?B?anJvN1JzSitMMHBIbWYvbXFBaFlGOGgwNnpQaGkvRmR1VkVBL2c5Znk2ZEdV?=
 =?utf-8?B?ME5GWjNZN1M3akZzd1FpS1pwaDRFWWlJL09PMWsxdTEramZhQXZKeXdpM2Ix?=
 =?utf-8?B?ZjliVHJpc3dBQkVTZGVYT0dhWVdNS0tSNndxVDEvd0RXMktidFlINGFRektu?=
 =?utf-8?B?RThvc1V0eFFhOFdmbm1ZbTNxSWo3Ri9aSjVDZ1VWRG5ORHhmd2NQeE4zNjA2?=
 =?utf-8?B?V1N2dTBSRWJXcTJHeWVBS0hiVzVRdzZFdzlwa1hYVUtQUUg2S1dWN2RKMS9m?=
 =?utf-8?B?NG52ZzBUMVBaMEVvVjk3UU94MkN1RFBUd1VBU0YyRmcxblpQN2FDcnF0NGJK?=
 =?utf-8?B?bTVzbGlJK2h2cVozMUx2YUNOQ1dEd2pZVndwNEhreGRTRStWYW9ZREs1TzNa?=
 =?utf-8?B?VW8zMkRYRzdkU3A3YXFpb1FGdzhNZ2N2TDNrSVpMWmVleUp2Q2hQZjBadzh6?=
 =?utf-8?B?U04zaURxRVMvNzlYdnNhZEVjenNvL0E2NU9RL2hzMEdhcVpQMkR6aG5kM0xO?=
 =?utf-8?B?MVgxRzZlVmhDamppbWpaTW12b3Z6b3JvQy96d3ZXOHRBMWNjQkRsYjBkQjBC?=
 =?utf-8?B?YjRkWUMrU2JOZWZrV0Y2dVNUbmxDN251eitZY2pwY2dSbzRMREdWcW0raUFB?=
 =?utf-8?B?b05nTHU0V1BpcHU2UzI5MFltZDVvRzhySkV5SXpUdUJlci8yY2JCbVA5VTFJ?=
 =?utf-8?B?S2Y2dWVSUFpOMGUzM3VOdnFGMS81byt5NEdFcDVMVmNydGt2NXh1cDN0bXEz?=
 =?utf-8?B?aExMQXZ6aUZ1YlQvd1hqWmRiVzU4M3ZtTFZaRWVmMitiWHRYQTNzOVZqU2lp?=
 =?utf-8?B?KzNHNnJkK096bFVrM1lKbU9aNGV4akQrMGdzK1RKK1c1YlY3RHJpVmtZcVdQ?=
 =?utf-8?B?M0VsWGJzSVZZdTVoNHM4Z0dWcnhuY2o4cXFNc3lIY0RJUVlhYkRzNUNSZmlV?=
 =?utf-8?B?dE9qZVJ0UlNvWlpTMXpRY2kvNTEyNE1nbmFOdHlUMmRxRi8zNG51M3RUNTZV?=
 =?utf-8?B?RWlXUHArWElrbmtxTnRVMkZ5KzBWUGM5cFcyamUyeFNoeWcrWWt2R2Jma3cx?=
 =?utf-8?B?c296VmVadEZnUGJhY3I4cGNZWDdBbytYQWFZNGpRaDJwVHFUVytvTzRMWlVS?=
 =?utf-8?B?SEZBVE9DYjFGR1orUzAvVEkvVVlNK1VPSCt1VnZreVkreE9aUmJkMkZ3REts?=
 =?utf-8?B?b1RDWk13TFprWFBTWllWTDI3S0JvZUlrYXZYSklQRUZlWi9ZOWpEcENacmVl?=
 =?utf-8?B?VUJXUy90MkQyc28ralpWS0xEcUJsRExSUGdPaUM3U3pzcksrVDBBNHQ4VDNp?=
 =?utf-8?Q?9vfOYF8q+mU+BefCLW4hdjw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c7bcea-497a-4f8b-a0c9-08d9ef94fefc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 08:35:46.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll2wAY2DiuxvlLKykeCAfjfq2EDHQA774GaPF2LOiBUq4qY+bZsZlNOB/vHxLhFTEGSaWwFGDa8MW7U8H0ZvWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4250

On 11.02.2022 16:25, Norbert Manthey wrote:
> When re-identifying CPU data, we might use uninitialized data when
> checking for the cache line property to adapt the cache
> alignment. The data that depends on this uninitialized read is
> currently not forwarded.
> 
> To avoid problems in the future, initialize the data cpuinfo
> structure before re-identifying the CPU again.
> 
> The trace to hit the uninitialized read reported by Coverity is:
> 
> bool recheck_cpu_features(unsigned int cpu)
> ...
>     struct cpuinfo_x86 c;
>     ...
>     identify_cpu(&c);
> 
> void identify_cpu(struct cpuinfo_x86 *c)
> ...
>     generic_identify(c)
> 
> static void generic_identify(struct cpuinfo_x86 *c)
> ...
>         if (this_cpu->c_early_init)
>                 this_cpu->c_early_init(c); // which is early_init_intel
> 
> static void early_init_intel(struct cpuinfo_x86 *c)
> ...
>     if (c->x86 == 15 && c->x86_cache_alignment == 64)
>         c->x86_cache_alignment = 128;
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>

Acked-by: Jan Beulich <jbeulich@suse.com>


