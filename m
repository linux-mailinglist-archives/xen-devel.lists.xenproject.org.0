Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD9F46B67D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 09:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240745.417442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWGM-00050j-Fz; Tue, 07 Dec 2021 08:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240745.417442; Tue, 07 Dec 2021 08:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWGM-0004xN-Cn; Tue, 07 Dec 2021 08:55:50 +0000
Received: by outflank-mailman (input) for mailman id 240745;
 Tue, 07 Dec 2021 08:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muWGK-0004xH-NO
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 08:55:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c02bc5-573b-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 09:55:47 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-N3Dg35EiP4-P8AOXeCzMZg-1; Tue, 07 Dec 2021 09:55:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 08:55:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 08:55:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:48b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Tue, 7 Dec 2021 08:55:42 +0000
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
X-Inumbo-ID: 77c02bc5-573b-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638867346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sG7RaZ6A5RZ9DFxA9gRnmm0101p8XWqkOvL8Nx8AOoE=;
	b=XIH10GXhr8BwRVCc37ehnqcwJRIRoSHu9hZ1KTAFss+DSDgBcxXkO2A4OH9724lr0kdrOl
	4QToMaqguS1r2atJw5r4ZyAnOYR228urcFxZ7yCazPipg9Ya7jJJVuaVZO9AbuWvvt5fYu
	BWyPYh8SPW+abqqpSA7qyWwBfvS0GpI=
X-MC-Unique: N3Dg35EiP4-P8AOXeCzMZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0vYvspfsRNOf29ypPGlD1hGWHS2eXKJvtgZve3ddH3hFfwE1IR0XR2RcZ2pcdcyowsXZqI6LjMnJ2AcFS5mog15licAFxdsl7SCep42vLhizSewBXa9EUU9kmGLfm9Wyzo5WvZxO9nF+uti9zq/ZDXP9LDPO30faYbqzl+nIEL6uZVyLa/3H3vwmPtwwNhgV5JP/3Cduw2MpZ8KnYJWnUlabE9IBhA29786bENC39BXgA1v9Nlo/wl3zrGUg1EG/2Z31NXOvx/yTp+AeTR5hNh/xKrBu3cpTjt+4Zl42MTIjrXG6xivO/7q9ICfj0I2H8UG0yr9iNuDBeR0k38Lcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG7RaZ6A5RZ9DFxA9gRnmm0101p8XWqkOvL8Nx8AOoE=;
 b=nhveXZF6v9NFuHr/WcrlAJBuKYnGAjElqsAyEPVfaAhXCaNFR/ZxuBWte1xQqdbSTffM4E22q4bzaWs9vLqbJKFJqs8qVJp24FhWbKUEQ05d2ALrr3qao+Srk8nc9ZGKfoBmo5YjJ5rypuzymmk90nC6iqyB+F7f5HztafVU+F8ixMPiVoTo0PvDWpV9ZmL04xnKTExbF4zFzDYCD/V9ST9fm4CiusZYt2apwEsJFXpnlDAyZ9ciS3IqCvve7QWR8MwhJLN0dl4YqeaG93ESYjPlcfukpMZBCWYAFYTHW+F2roZqd5XalJZnEy5judawdbpLFjrQtVpEMVRVbgxUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <faf35da3-2b1f-cf36-21e2-69658be7181c@suse.com>
Date: Tue, 7 Dec 2021 09:55:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
 <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
 <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
 <25006.15894.801771.928097@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25006.15894.801771.928097@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fabaea3-112e-433f-dd81-08d9b95f59d2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744383225F30EE3262BB065B36E9@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	60sJaNUJrQOcfXTZLlhx750Z5gCHY5BEHlHBQiSONqPByH/2rS0oiEljPiwT9fgcFh8Fx7cZhcFwHfN694F2vNxGk/bC9hVzGAcTmdjdf8EOJ/i+1+Rbq0DZiDLUbbjp3JeeZcLSXPN1zWeuGvGlb6rvHxO06VCsTjV/XaFJTjtJOjMdbcRpO7bu2qraZPuAGyyyE6aHI+2Mbigi/9CPoI6CSMkJS0flyO2vixF6vGEz2gnYaP8KMicByLA4CysZCeydj8dNy3P8Cj/1n5CtM7tYAvstqNrH6jTh1k9ips2K8tjTw3rJEpivoJ2muge+3C+NR9kayhwNYhqRRx2EM5DascmWD7Rm2n6vuXFc+2pXyhzrKsKW+H6lAZNUUG8gR0i4bQ2lDg9X1fk55QX51IP7rMM++yBmLZUtolsqm59n0BMCpNeMBIibpddN9u5KSG1XrNz1blM7YLUkGPI9plgRKeaZuWZvdBhv7+WwI+JpmqzYmbfskBNryG8RPbNpNkyisy6oLU6J5magAl+dqwZVgqH7fxnvX41FFFVvYGrYJrXarTQPTjV27f6tQ/BSpbuYfnzCZGlGY+8pBoVc9SrYL61AAWdhBuX3BtY5mAl13a/gY2QhEYfF0aeFp0o6E8rNxg7tEVCnIOcHVO7IC3JsHI7nljV/q6buLGe3vptZWF1igcSHzheZQ6PjCFX9rKXsjiSb0abjD4X08BG2w1o0JM4cLTFN8FT0L6ANff0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(26005)(6916009)(8936002)(53546011)(2616005)(956004)(508600001)(83380400001)(54906003)(4326008)(6486002)(31686004)(8676002)(66556008)(2906002)(316002)(31696002)(36756003)(186003)(16576012)(38100700002)(66946007)(66476007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c29DR3lzUVJQOE15TlBTdDFMWm1uWHV3M3BEMjdQdmlLSm1oems5T3RqcGJQ?=
 =?utf-8?B?b0RwMVUzZUdSbG9ZQkZaQVpURzJTVDlzbjZZY3ZZdzl6MCtUaVhFc3lqSzJm?=
 =?utf-8?B?Tk5BTlQ5L0lVRVVwdjkrRy8wTFhCZzh2aUgreFVhQ21TdUxvRm9jc25WSWcx?=
 =?utf-8?B?bEhuRVZCNHBCd2dOTmtYeGt3dFd1c3NKdlFFbmpkbmJjbVFXTVVUSG4xMlY1?=
 =?utf-8?B?SDJoS3I3RDhGQkJiaVo2LzBpM3pzd0FQZE12S2pFcEU0ZHdtVmx6OExnN0py?=
 =?utf-8?B?SlJMNGhSWTEvZGFxYzFSbE5SbFFLWDFRaVZxY3I0MmpHenZMRUVtNlgwdjRu?=
 =?utf-8?B?YWRjNUlQdzFoWU80Y1Vhb01DTmt1WWs0SmRJcXlGNFhndnZJMTFvSCtyZktZ?=
 =?utf-8?B?WkF1amJndnJGY0ZWTnFId2I3elhRd2FFaHVkamFENDN2VldMejE3c2pOVVhG?=
 =?utf-8?B?YjR1YkQwa0tDYVZ1ZVlYT0g4SlU1djVUOWRDeUMvSGlIWmVqM2xPdHVQcHZy?=
 =?utf-8?B?WFpicUx3eFFkd1krZVNrdjVCRm91Yk9WT3BRd25KWjZlZmt4eHZVODZNTnVs?=
 =?utf-8?B?NHB1enl6UG5ZbVMxRUl5eGxzbFpnSmpqQnpreWJRVCtxZDk4bWlMaWVBVFhl?=
 =?utf-8?B?S3MxT29IYkhxWEdIUFZCc0l4Ukl3Q0pLeEJOZVJTaDdEZTZFWVN2allNL0NE?=
 =?utf-8?B?OGVXV1NFRVpXRWppcmJkTzBjWUJ2eTB4bms0K0IxSEtXbkdiSlRVaUZnVFZm?=
 =?utf-8?B?YWRSdmRROXBLMm1iYkpuNnRPWEZ5MEJBaTNBdXdqOHRjbmQrdkltYnczUzIr?=
 =?utf-8?B?cXdRUWxjVXVEVGJuZ2dheDkvYzJuY1hMU2tvSW44QnVXU0lsOUxOSEMxbXdS?=
 =?utf-8?B?V0hJTlRxVXpKTHhhVFJoSkZqOHpQMEd3d01jalIrKzE3V3N5NXdKdUtONVl1?=
 =?utf-8?B?T1N3TVh1TGZmRGRSaDRoQmwvZ1VscVlMWFAzeHErZDFJN2RITmFvZnlBR3ZW?=
 =?utf-8?B?cjNrQW9JN2Q5Y1BvTDNMcTNMMlJ3RUFhclUrV014ajBSS3Q5a2paQSt0WWlW?=
 =?utf-8?B?M0lVVWdCWEZvOGdUZG5ySDVuSzVHWTN3Ymg0TDZPcit1dU9vQnNCaWMxTlBT?=
 =?utf-8?B?cUExYVYwbUdtWkQzNWJ4cnMrUUpNbmVuaGFCYXpZNVV6a3R2S1FYcHV3aGdM?=
 =?utf-8?B?QzE1RkMvUi9XemhibHFvNFR5dFE1TU1KcTVPSWYwY28zMksxdEZLSG9yeVd1?=
 =?utf-8?B?Z3lnQ01VU2Q4T1lWV3Y4MDRJUWlza2lYSW9BZS9mU2x5cUJENll2TGhjbnF1?=
 =?utf-8?B?bVpJQWRsRSthNGF1MVdLb0V2b2dsKy9iZTVwYUJSRlZHRXNNYmtVRmRhdE9a?=
 =?utf-8?B?TGNzNEp5WWRxUlpkMldYbmowbXZrYU5FK1BKZmhKQ0Y1cjBlQXNSNmdSdXBX?=
 =?utf-8?B?cUdyWUFYaTdZaW9ZSkdyR1cwYlBpTmpwTTRXVDNaSkI0RXVlQjltSnp3OUZX?=
 =?utf-8?B?eFBTUFhMalY4bEVIdWhUdURraERYWENKYi9JNlVNRzF3S3J4anczUUgrWGkz?=
 =?utf-8?B?VW96Q01ocXBNY1lOME5INW1FZlprMUplZHJVMXlWL09TOWpOVVZJQllSblVE?=
 =?utf-8?B?YUdCT0hodmhEQ3NpSDQzMm5IbjhKS2ZlLzhlZEhqMnFwV3Bkb3hEUDVHY1JY?=
 =?utf-8?B?L3hzOWJNV0dvdERBRC9wN3NvMDlMVjVldHhIOWNCRkF3YjZ3QlNCMDJ1TFhU?=
 =?utf-8?B?NDVaNlhuK3NMNXRPYUxTcitZS3RiN1JQbnZSNGJqemx5c0Zzb3NNUXlwS3k3?=
 =?utf-8?B?UDFKeGozYjl6alZnNmhaRkE4ZXo2bXhic2I3S1V4NGFGR3A1eDdZRkYrSlBQ?=
 =?utf-8?B?bFhIeUs3THc4VUV1RHNnamNnWndBS3ltRE9sRTFYODFNbDlQbnVNUDFMUXI5?=
 =?utf-8?B?WlplMG8xVU05SC83QXRpeGtYbFdodFRkZFRiWmwwMG9BZWRJeDdDWUV5Ny9H?=
 =?utf-8?B?RzRSdHVjSGduL3MvcU5vMUx4K1JRSkxxazFOOHA2VTdlRmhvenlWZUxhWjVW?=
 =?utf-8?B?NHpYOFo0Z0FQUUlRQzZ1Mmtjd3BSbVBtamZqVmxpZzhvb0hRYVF2WVhJOW1I?=
 =?utf-8?B?aEpvc1RWNUszNndwMWRBaWJucXVoZ3NZeTN0RTlaTVJVOGpwWkpRdXpYb1gw?=
 =?utf-8?Q?BlH2zhCGS/Zb6OjkDp7IGqI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fabaea3-112e-433f-dd81-08d9b95f59d2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 08:55:43.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzCe3Unour7PCFWWPpTvaNYrFeaQYHjjmMubo0qDmWPqJXVOLIiiN+XuFq3ReZClOdYhjatoB4DwF3Li9fJMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 06.12.2021 17:45, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
>> On 06/12/2021 16:12, Jan Beulich wrote:
>>> Hmm, I did address both your and Ian's concerns in v2, admittedly by only
>>> going as far as minimally necessary. I therefore wouldn't call this an
>>> "open objection".
>>
>> I believe my objection is still open. I still have have no way to verify 
>> what you did is correct.
> 
> I can't believe this is still outstanding.

Same here, hardly surprising I suppose.

>  I think I understand
> Julien's position, and I agree with what I have understood.
> 
> In particular, I think I understand why Julien feels it necessary to
> make an issue of this.  The Signed-off-by lines are there to help
> provide assurance that we aren't making legal mistakes.  They need to
> be verifiable by a reviewer.  So that means that when a patch's own
> declaration of its origin is "this patch came from Linux commit XYZ"
> then all the S-o-b in that Linux git commit should be retained.
> 
> If the patch came from somewhere else, eg a mailing list post, I think
> it would be OK to say something like "this patch came from lmkl, [url
> to posting], and has since been committed to Linux as [commitid]~".
> In that case the S-o-b should match the mailing list posting, but the
> Xen patch being posted must then be identical to the mailing list
> posting.
> 
> IOW it should be a deterministic process to start with the patch's
> declaration of where it came from (or which sources it came from), and
> verify that 1. the patch really did come from there and 2. all of the
> approriate tags, especially S-o-b, are present.
> 
> By far the easiest way to achieve this is to take the patch from Linux
> git using (eg) git-cherry-pick.  git will automatically DTRT. [1]

It may be the easiest way, and I do understand Julien's replies in this
regard. This doesn't, however, mean that I agree the "easy" aspect
weighs higher than my view on stripping parts which aren't meaningful
in our tree (or, to be precise, which I think aren't meaningful; I will
leave it entirely open that I may be wrong with this).

As to git-cherry-pick: Just like I would have expected, even after
adding Linus'es tree as a remote this doesn't really work, due to the
different tree layouts:

$ git remote add --no-tags linus git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

$ git cherry-pick 83d3c4f22a
warning: inexact rename detection was skipped due to too many files.
warning: you may want to set your merge.renamelimit variable to at least 73569 and retry the command.
error: could not apply 83d3c4f22a36... lib/xz: Avoid overlapping memcpy() with invalid input with in-place decompression
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'

$ git status
On branch smoke
Your branch is up to date with 'origin/smoke'.

You are currently cherry-picking commit 83d3c4f22a36.
  (fix conflicts and run "git cherry-pick --continue")
  (use "git cherry-pick --abort" to cancel the cherry-pick operation)

Unmerged paths:
  (use "git add/rm <file>..." as appropriate to mark resolution)

        deleted by us:   lib/decompress_unxz.c
        deleted by us:   lib/xz/xz_dec_lzma2.c

no changes added to commit (use "git add" and/or "git commit -a")

To adjust for our tree layout, manual intervention is necessary anyway
(unless there's a way to get "inexact rename detection" to actually
recognize the differences). What I take as a basis (git-format-patch
output or anything else) should be entirely up to me, I would say.

> I don't have as strong an opinion about other tags, eg ones indicating
> approval in Linux.  However, I think the overwhelming majority of
> people would think it conventional to transfer all of the tags from
> the original commit even if they are irrelevant in the new context.

Well, clearly I'm not part of this overwhelming majority then: I continue
to think that irrelevant things would better be omitted for clarity.

> I don't understand Jan's position.
> 
> Jan, why are you fighting so hard to delete these tags ?

Counter question: Why are you and Julien fighting so hard for the
retaining of what I consider inapplicable information? But to answer
your question: Just like I consider missing information a problem, I do
also consider meaningless data a problem. Plus of course there's now
the psychological effect resulting from already having invested far
more time here than I think any one of us should have invested: I now
absolutely want to understand whether I have been doing things wrong for
years. As said, me doing what I have done here hasn't been a problem
before.

It's still not clear to me whether I'm doing anything wrong in the first
place - my question as to why these tags are relevant in our trees has
remained unanswered. I've actually taken the time to dig out "Developer's
Certificate of Origin 1.1" - from all I can tell my submission matches (b)
(and that's imo true even for v1, i.e. before re-adding some of the tags
to match the submissions according to mailing list archives, as far as
entries are available).

In this context I'd also like to point out that unlike Linux we don't
normally make use of (c).

> What practical harm does its presence do ?

I did answer this one earlier on as well as above: I consider their
presence inapplicable. There's no severe "harm", but there's also no
reason I know to keep them. Unless I'm told of a reason, I view it as
the submitter's choice to keep or strip such. In fact, if I saw an
import which had such seemingly stray tags, I probably wouldn't insist
on stripping them, but I might question their presence / applicability.

> [1] Jan, I know that you don't use git very much.  I think this is a
> great shame.  I find it perplexing to see how anyone can work without
> it.  The git command line UI is indeed terrible, but by now almost
> everyone has either bitten the bullet of learning it, or adopted one
> of the overlay UI packages that now exist.  (Personally I did learn
> the cli but am starting to forget git cli nonsence since now I do
> almost everything with magit inside emacs.)
> 
> I think the time has long passed when it is reasonable for a key Xen
> developer to ask others to do additional work, or deal with anomalies,
> in order to accomodate an unwillingness to use git.  Obviously we all
> have our own workflows, but git has heavily influenced our shared
> norms (and data formats).  If someone chooses not to use git, they
> must at least be able to pretend.

I appreciate (yet don't share) your view, but primarily I'm afraid I
don't view this rant as relevant in this context. Even if I had found
a way to do the import entirely via git commands, I likely would have
edited the description to strip tags alongside adding my S-o-b (the
latter I understand I could have git do for me). Since git-cherry-pick
didn't work for me here, I also can't tell whether the usual
"(cherry-picked from ...)" that git can be told to add would actually
have identified the different tree, or whether I would have had to add
that to make the referenced hash meaningful.

Jan


