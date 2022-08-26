Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA55A2A03
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393953.633175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRafO-0002PJ-Re; Fri, 26 Aug 2022 14:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393953.633175; Fri, 26 Aug 2022 14:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRafO-0002NR-Or; Fri, 26 Aug 2022 14:50:38 +0000
Received: by outflank-mailman (input) for mailman id 393953;
 Fri, 26 Aug 2022 14:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRafN-0002NL-8V
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 14:50:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 717e535a-254e-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 16:50:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2248.eurprd04.prod.outlook.com (2603:10a6:4:48::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 14:50:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:50:34 +0000
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
X-Inumbo-ID: 717e535a-254e-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNBtdj5ZHWXSf0sepLm1glhkGjgrnxgTFsS5pmi5qwB28jQvBh3wDcK6buhdXx1L3z0vvBam+hLywvU6e4nuTfKWSzv75N8mhSpIeqkLCYdkM5d9bo9I+qpNYuPtA7bUuSeCcxU/5L5boquRg/LWCc+U6uZuTAMqp+Qh6wafreO4XH/VhSRv3RD3DFMRvCCCRo65apiBxjNfxP2pRAq8OERj27rvNMAKdTTNBIxOGRiRAEZyanfdJpbqFfuI2mtc/Kn+WOLr3lbsRyvlbsk12jX036hJ5NgF4K+nqrWjdzOPx2ySNplMWiYW/qil9bcv/1WLTh4415J3h+QhHi+B9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y+9qvpLZ+uq+TokBkXXxZhPz9jvRbgrRkHbxowYDoY=;
 b=b0tF4BUMl6dofdn1H/F5zbNHBxTs0A415+CCmVhx1vsG3KMl1V/n8+JJeyy2PFy9PSEjPL2SRkMqIKJCrhH6TDx0xvYMH4aNbJ04KmBbV7vh/24k1HQcMzVU6ycHjCxXIQeeNcrJh5rJl8kgLba/TnzoWciHU94hksmyHRuctrQPVqTVnEgVk1cNU2SpEIV2PRg0PDjQFC7s+r0G0nPK2SmfCRUut3bk4pKoQlM2Wu+8vCM7P2+L6RyIJi8I7firo7QbpNoo59W1Q1AqqYn8iXaOcOaphTonD/eJ2oVmFQxY+WzV2Ht7osiz2w2RsVv69JBpTpywD14N0K/qxWXwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y+9qvpLZ+uq+TokBkXXxZhPz9jvRbgrRkHbxowYDoY=;
 b=FI3q5ztisL2af9YxYNddruGxnt6tjDS1f2E7ls1i3KnjAuytQwnpH+ClKDCckYRLPxyJThtgQEFlD8kfDJgTyEkNMlstx24W4qhXtxCOEUZ06R7eI7RJZu429PDIZWgtKZYTJ7zlGjunD0VlXKzjMrkUaK0LHAjKcGze+eweJwTrDs/mmVt0QuXxEk5Lxx6zJ4aF9X5ZXyhDrhsRWJO82CkuhYYADeobrmQsSvjmdsK80klD/hSepd5reKjEFDetepR/SkGAqUf9c7cYkqih22lN41QPczmr8Eg0ezkZMadl2NYYhq2I1DShzDo1U5FC/5JRx4vqkhLt2C8fbTd+lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdbe1100-0a28-cb4d-6a89-5efc5838f4c4@suse.com>
Date: Fri, 26 Aug 2022 16:50:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 9/9] drivers/char: fix handling cable re-plug in XHCI
 console driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <bf26655295d0d85b1718d60f2e4390da7ec62b93.1661181584.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bf26655295d0d85b1718d60f2e4390da7ec62b93.1661181584.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0050.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc6e542f-561c-4372-154b-08da877254dc
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2248:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0xD53b7Mc0ao+P1XwiNsAyAqpGZSF2A3tCYoDVoHAf4yltZMi2ViycwX/6j9vz43ZdPUg3rE1n6PyHZifscKdxuBLDwLgTq3lxMilJXpVZ9E33vqFiib23Am3DtovQXYUtOEfUX4xq/IqbvgNcnVDN8yrta2sYecpvxuiXMphVw0ti7grEkjhyC5KgCHP/EpjqI3ZdsGqDOiFMZf7nt3thCNCnlpC0D/7v/OsqnXGsM28YcnQZmNxsvweSpcfBOqO84unW57RE++3Dzg+ShTnzmMGepgWqEKiI6hORG1aJrjHc+UEYCOXocLHNT3/3CDABuvTg68f0kcW0MwmSMZgXJG1gtpkMgamFiQyiaJ5N0IKYaz/hmzLYOGxWfgEVvSjgqVj2XWEYaC7UAEn0NqfaoHor8+785btJqkmRDHdBzJ7jJjM0SL4hAqiDK2jN9unxr5Tlm+TP63+VF+UxERP9lWpsup3mkWtfCrjL97YKit0j2QJAZAjkLoYOuGgSIHfrLvQYlYHF/JGHY5AToRTauzEPebxY+EdKEagizeLyRQ3y+mczvSYgI47+kkB0wrpxOknPOjwhWiiw4FLss1a7Uog6F3mpsKgUmZx59gNWJ0BzihdvlCcaYtCurCkTmOfGzBIVCqaduGcxuM9gfq9QHcZykvff8vrTZJmuZgx5B5ec/BWhcyPaYQX3faogV1X9o3LXX3Lahv7BuotwudSPwiEIrrIbUEpZWyqb8Lh6JlRHfS3pT4x1GCrJF3N8VxyQW0iE7Xe4fIfXpcF6q+4Qc4MX9nFlpNKh6VQpK04Ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(136003)(366004)(39860400002)(26005)(6512007)(186003)(53546011)(6506007)(31696002)(86362001)(2906002)(2616005)(38100700002)(6486002)(4326008)(478600001)(8676002)(31686004)(66946007)(66476007)(66556008)(41300700001)(8936002)(36756003)(54906003)(316002)(6916009)(4744005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzJVdzZTSGFTNFJSc0krWFNkZHpvNjFtNTJPRm9yUEZ4ZWVpMzVmUEliVTRt?=
 =?utf-8?B?ck9iQjNNZ2cxeVdLbVRUb29ZSGZWK3J3a2krbmFhYkk3SVY0NFZtOXM5Z0dC?=
 =?utf-8?B?OWppZncwb0plLy84dWk2MHd6UHJqL0oxazNGRWt5WUVDRXBEUFh5U2JSd25H?=
 =?utf-8?B?OWNteWtINEU1ckJMRW9TYy8zbnFFU0VZWi9Sako0MHpJM1FlZVFmNkRmVnZj?=
 =?utf-8?B?VVBNMURCRGp0eHREQjBSdVhDLzlMcHFmQmo5ZzZDU1Z0MG5iUVJkeWxDNFdi?=
 =?utf-8?B?K05GbUJrS1ZSMFV4aEMxSWZ0TUJWT3JxQ1gxTEZyVEk0aS9HaWJYeHU3ZEdE?=
 =?utf-8?B?czVpdWNMSHhxNnZIbU9wK0t0Z0hjWmNWdFN5NHBSQjVrdFVPejFNd2dKbVN2?=
 =?utf-8?B?WTFiSklVdWdBUXdnc3dLR25rMXZxRStPQXV4UzArazBGZWNHOTRUM1RZaGF6?=
 =?utf-8?B?bzBzVDFleFpSbmRXODFiWnA4bFBZRjJMNjZkWUZKTHlKenFXMzZkMkF5N2Np?=
 =?utf-8?B?TzV3bkVWNjRQNElnamUzSzc3MlhtWWo0am9vMXdlZFJJeCtsL2RNTXk4SzBX?=
 =?utf-8?B?dHROWGVjVzZOZ040MnVYcDhkL2haeTFmZS9TRi9pMjNIV3RqSEZrWGllbUJu?=
 =?utf-8?B?S1loS2N2WW1yNC9XMmlrUzVOTGtMeDBQN3RGV1BrYi9rUXA1dE1ZZEdTUldt?=
 =?utf-8?B?blZFZUVXU3ZrUzFTSE1ialdlamd4YUNyekg4L210K3ZKOEpXdVVhUzA2dHg2?=
 =?utf-8?B?aVhJRFJIWDluYlRVK0NWWTlFQU9WVEtaZ0NzUUtZN2FZM2wyWStuam9DdGNQ?=
 =?utf-8?B?U2kvSUtYaFFSNnZTRWVhSWJlQVQ0ZitVN0UvZUdVVTFXVHlMQzg1S2FWTnB6?=
 =?utf-8?B?dGFrbnNTQmg0REljRHVibjltSXJTc3p3TFRtOHh0Q2ttdEl2RzVOYVc1TzVE?=
 =?utf-8?B?TmxDV1dINW1UYjNNYlp3U2RZeGZvMGgzOUFGM3J3Zjl5Q21iLzh5RUZWbVJW?=
 =?utf-8?B?aEtZWnB2cVh6RTVHQ081NXdpQVYya1FpWUFRRTEvN3FTdE15OXMraWMyeTEr?=
 =?utf-8?B?LzVQWGRDT3N1WVlSa1lOTUhKRFBFSDZOTGdqWEhnQW9xK3NZczhwY210eXVn?=
 =?utf-8?B?ajlYcmhPTnpMakhTOXU4ZG9LUU01RWZibmZHZkdhT2kva29WczN3T2dDemhM?=
 =?utf-8?B?UFlYTmVucXl5WW01citUK1FYTC9UZFhaaVVrL2k0V1d3ZHF5eENXeGdTdmNy?=
 =?utf-8?B?OXd0YUVXa1I2am9oYWlRNXIxekZXbXRPQmd1NzE1bVNLOGF2MVFMWWtaa3Bu?=
 =?utf-8?B?eEEwT2lnM0hOUERXUFZ2cjB5RDErK2NEaUZxa1pHYURNOTBRTHNuYzFpUWVr?=
 =?utf-8?B?RUd0TFc3SW9SakxVTmVTbzl6TDNjempLNGFpMExPMlpIV1MyMWhEdldZdDU0?=
 =?utf-8?B?aUUwbUt4L3FKN2djK0J1WnZPV3Zlb1A3cXNBeVpBQ2FtVG1EekxYZlNqV0Iv?=
 =?utf-8?B?R1F1RjZSclUzejFLOWZIaDNUakZwNkNLSlh3eDN6UjhreFRQYms1V2FVeVdZ?=
 =?utf-8?B?SmdOTmRiVnJHeFYydzU1bWhCY0pvRHVDZHVLVmQ2T2grU0xMSytWQWhiWGdu?=
 =?utf-8?B?eEUvdDl6dHgwNVBESTRkOVdqeXd1Q0tWbnVKVzhiRUFhNSs4YmdxT2NIMVpu?=
 =?utf-8?B?TldHajlDWEZLSzlFYTVkNWRseUFlYnMzK1cvckMvZHVBYTAxY09wREJzUWda?=
 =?utf-8?B?WkFPRWN6K3ZqeVgxMGVHT1FOSGV1N1dYV0d3UGFpVWVKeUtKTldSWlE3bjBv?=
 =?utf-8?B?RThtMUZVWUFpTGV3a250MVJDMm50ZWRwY1J2MXF6N2Q3QVI1N0Q3eWxHMlJt?=
 =?utf-8?B?Q0k5b0lYNTJ2SjdVU3dDZ1pMNVBZZC9ZQURSMjVPM3cvQUNpdTUrd0I4a1ls?=
 =?utf-8?B?MEozTnhocnFOSjJHQkZ6ejhZc0NxMzJlU1k5Zjl1NkNoVkhxcGJ6ZEgvREtD?=
 =?utf-8?B?SkdHMm5qeWRYeDVJUUUvSUYxa2orWjJlcWNtNTExUEVwems0alZreW1mQW4x?=
 =?utf-8?B?N3pILzRMbVNHaXRvbURXc1pYc3hyalBYUU5wZjRtY0QyZXM4OWsxMThnUTRp?=
 =?utf-8?Q?YOghD82MwuB9tQK7Qh0/U0ndB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6e542f-561c-4372-154b-08da877254dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 14:50:34.7327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9vrSl6s6L/BwLLi3bg5ZFDgrocJd8rCpm1sB3lLiljQbBaAa9WKYu08l2lLCTElgVt5/6YgAckOPITCiCqj+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2248

On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
> @@ -1023,6 +1032,8 @@ static bool dbc_ensure_running(struct dbc *dbc)
>          writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
>          writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
>          wmb();
> +        dbc_ring_doorbell(dbc, dbc->dbc_iring.db);
> +        dbc_ring_doorbell(dbc, dbc->dbc_oring.db);
>      }

You retain the wmb() here, but ...

> @@ -1066,8 +1073,7 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
>          }
>      }
>  
> -    wmb();
> -    writel(db, &reg->db);
> +    dbc_ring_doorbell(dbc, trb->db);
>  }

... you drop it here. Why the difference?

Jan

