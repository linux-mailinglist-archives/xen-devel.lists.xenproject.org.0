Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF5C588A0E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379734.613451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBCO-00074Q-U3; Wed, 03 Aug 2022 10:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379734.613451; Wed, 03 Aug 2022 10:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBCO-00071n-Qw; Wed, 03 Aug 2022 10:01:56 +0000
Received: by outflank-mailman (input) for mailman id 379734;
 Wed, 03 Aug 2022 10:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJBCN-00071W-5x
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:01:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cfa81a7-1313-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 12:01:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 10:01:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:01:52 +0000
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
X-Inumbo-ID: 4cfa81a7-1313-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY7aFBFOPTVB6gzxkPGsUnnkVei2Wqmyrlq2sQhLy0CVWg/cGAYg3t+nH+k7Wvzh+/eiGFVNpi7Xz1JqMsrkWA3PrADu0SjL2HKq7AeHJvSEu8SYlxjmuBSqHWKvx+kooHI29HwIJtS2lOO/gJvBa5SUpoDpNTaZkW303nO7SuwvgHkvzMlgTQnIU5e/ctx4issn/nUyapbLc4IDFKhkJ0uxrcv4Sxdl7yS2v0ZwoJ4k/798Cop20+ie+8Dae5NDEYs5zsGmiZeHt/Sflg2NchfGJHA+5Me5L7FAm/m2NV9eVlocKbJGKjG6QMefiykwK7ZisIdF6nmZZYzUW3rq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dROUglfDBZORt+KogDq4qgwYbtxAQjuWmC0vUbuJtxc=;
 b=LNKxMnmLKFNLRmebtXE3KMPoN7LLdJXseBD5B5bCUEEwv5AITx1bXCIP3Z8PbNIgWUP7ZmnTAJeqZ2rCumMbWDPQOlAMX6WJtJcCZHCSEyzd4kgsJSVYb7i8rwHbnJbAs/RMJoUIw6sIf4UYwXJEmqW2mRf+/RQQSyNm9gUtmWT2UWQBh1qCb6yUk0I+Gi7RMjB6B+7Ij3NSsqZG2Hb4f3KvC8h+KWP+zjgpWOi1lLpuisUmuRBY15hOVpTpiPdLXTRnQUyFSTxYVMldp5I7pzxkmuHKyrZjGEOcHX3L3rVlwXyCgsIQKEBDA2vZFA3hML9y5CK6KKQcRJy25HrKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dROUglfDBZORt+KogDq4qgwYbtxAQjuWmC0vUbuJtxc=;
 b=I5QO2A3OtogLS2v67KCScuiAeXsJitKKLX1TxeGmpLGIrZmBsNhTCrSnLvJOjZeVLXs5i4afYK5ACF0iffjz2Mr0nVUVg+arx/zGJvcCIWlEovH3EZ7bUxJp2dVZw7es98jPH2il5eZD1EQfgcl9vad37Qyy4Ufgvyn1AeDWdDlKBfNFBBhXFQ6pvq66H8kFjhFuefO+G+NT7xpAcREuO8iN3Kw9c1qY0gAZR7rzR+mRc8FSGjP6EU+alo52dJKaxg0K9RdFiFtbAGdePFpy4VNTlxBUYGfgxlJ1Hn1PQXK0OzIT1HTTB8ChglSP7onsbT248raJuR867XRPPY0nnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e87567fd-20b9-f822-a739-7d5dc4c50f9d@suse.com>
Date: Wed, 3 Aug 2022 12:01:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] xen: credit2: fix boot hangs if dom0_nodes is used
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <ohering@suse.de>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <165952060175.13196.15449615309231718989.stgit@tumbleweed.Wayrath>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <165952060175.13196.15449615309231718989.stgit@tumbleweed.Wayrath>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6882b2e8-b6e6-4083-a589-08da7537303e
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4stoZahFKFl0JMBetlbpTWyjuazzhe4snZ0BtUeHoiW2QoKqAFnHNYOjXuOj0HksTND+rUl02lXsKyfWYvqgH9dJsX/znQpsstqVihSqlPHBf7eJkfS9hNzB+aANvoPk6CGNFFBfsGI99TnQMbmf5x/0D40ckAlUjMX03Ug/rOC6wk1TnBoc/52d4HxAaUHVIX4woKZUCiQmXDFuCqhq0OOKoI+RBMXldX91U2bQMmWizYABJ+pJdTigAfTjHGwM7OVeVtoH652/CkmMNxAGh269lnL5wt8bb+qBBjzjd3YQFVq8U4BcJ8FRubG+lWwDcsNdXXKdEm8XER2/Uk44teJmTO96OoYB52en+JCwjZljcaK0btWqIl6WyHKx8Aq9guvLyBqfkAUHHnRvJt355AwC1IySfsSYPoGKpo01nzVNTLCzZPhFQFTh/uvzfg2IONVE4OPE8tp44M9GyC/RCYEXkMzpfv6g5zm+k2i/+6lyiqCkr9kYtUxBu7x660jcMaup7NWWjHbaB1W7sekZ5/omtEiCzlgLdFWQnPiMxRMUS7qXzxwZfW6GYbf5WZlkWi7GJuMQah2/9juX12YMhEmfSLaeVAYp7gp1HIz+hEV7CfaZhd6xn0VUX9fJHGsb1IlF7O6QX+3XqolVCfVG06wqsUmiBwBCwjQ188I3zqkItnTLmGoGsOgHCCIS//82CZtT3eXLnrrf3BxtO1I2Azn6/73e6+E70oqP2QG/AwLuDlTl68ueXwYxgrwg5kF7CwMbYT3NvWKOIjRw14Hz3GaXK5kJmoINds510+e4N3vwg51XgYiMTxHkRHw150I4QnVSfQTINkDBk2cPnUc59u+N2EJvPF80Ad7J6GujoRmrSzDBMdFUTxojmZlGmHfE8zOVbQHZKqqdvnYNbr7DsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39860400002)(86362001)(31696002)(8936002)(110136005)(53546011)(31686004)(316002)(2616005)(5660300002)(36756003)(41300700001)(966005)(478600001)(6486002)(186003)(26005)(6512007)(83380400001)(2906002)(38100700002)(6506007)(66946007)(4326008)(8676002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emhERVNPM3VRR0F1S0F0a1Fvd2c3MXhVWnNZYnRVa1gzUHp0QlV0aTZDSjRm?=
 =?utf-8?B?WDBGSndvR3JIWktXaE5lY3JSS2ZuTXE4WWNkR3R6eW0vd25URnkwTFNIUlcx?=
 =?utf-8?B?OVA1RGhjWEIzd0ZGWWJWbjh5K0pJbjFtL09mYVRQT0pIR3lBcFUzQmhJZUhT?=
 =?utf-8?B?N2U2RmJvM1ViWG9abjRsYk5XNmlwcHE3RzFqMy90L1orT0xxT3FxSXNCcWdz?=
 =?utf-8?B?K3owN2VjbjRMZHoxSUE5OXFOK0NtRWVyaTNYQzZPTE5NaXVBUTMvdVZRanRP?=
 =?utf-8?B?TzFzMSsxVHg4TkpqZEtkOXhWMGFJUW9FYTlYNm8zaGZ1Skc3NVloT29XM3ZR?=
 =?utf-8?B?RTNnQmQ1V2xvVUpoSExlWFhQRi9mbU9jdTdJYnh6UW1Zc2RKN3R4a1psSEFE?=
 =?utf-8?B?KzkzN1lqdUxtR1F5eGVkemJ1SHlOK3ZWbXY4OEtqR3BWRU94T0ZUMXdYNVJB?=
 =?utf-8?B?N3IvZUFRWlhyOUJVVDVSeFZSREV1U3FJYXZkRWx2bzhlZlQ1WEI2RGhRdjJD?=
 =?utf-8?B?ZUs1YVRNdjErK2pab1JyU1pydmw5WkRPaG1QSk5JNUkxSG9nNmc3YzFpRlRr?=
 =?utf-8?B?bXRXNUdOaEo1Y2V3MlluMldxZk5ZR0lnQXF3eFJYb3BZUVpOSmhuS1U5Y0My?=
 =?utf-8?B?bGU5OEN3dXBlY3NSaU1UWXJVZDN0LzBZa0hRaW51elQzZVZmaGlLRWlpbWM2?=
 =?utf-8?B?RC9rdU5WeTNWVzN5VVNETW40UHdHS2UrY2NleFV6OGJETmQ5YXFNclh4NDRl?=
 =?utf-8?B?TityTzN2Znc0TlVkdjlxQXFRc0VpRytCeDNDZHdGTlFIenZYcVVSUkNHMUJl?=
 =?utf-8?B?c2ZNL2VXbEFqZ2ljbG1jVVlacFZxK01nZ3QxdnN4bThsQmpYRlowQ2Z2ejBI?=
 =?utf-8?B?YktaVTNGaTFqaTM3ZC9NdGp0TEVKaCs5Q1lkRUN0bzRTMXJtVU9mWEpxbFhl?=
 =?utf-8?B?K0JydkhGOU16SkVKclNwWFZLdVQ1N3ZSYzJnQkIzeTZMSU9oOEQ0SCtkbjRp?=
 =?utf-8?B?VnJGNzJwYzJiRVlTVTdnV1A0Sm5iL05GTDRobVl6MmYvWHMrQlhKNXIrQ0ta?=
 =?utf-8?B?d3BPOFdCeFBOTHRmSkQwNFNabCtkM29pT2VZZG9nK3JsTGtCQ01pYk5zK01D?=
 =?utf-8?B?NFVGamliUitqdHdVejZqeWE3UHYraTZ4blJLU04wOW9LNUdIRENQWjA3UG4y?=
 =?utf-8?B?VUVPSGNvNkh6SmtlU1dBcUJnSHlxc3J6N1FEcis0V05LMHpES0srcit5Ulc4?=
 =?utf-8?B?WWxaZldwWVZOQVAvbVo2SnQydnY3UnlEMWpTUHpsL1RIZ0FLQlp3SlNES2dB?=
 =?utf-8?B?V3lpQWhIY2s5bStaNTh6eVlYRVo0akRDYlVRQjBabTlSWVFmZ1J6dWdTTzdW?=
 =?utf-8?B?ZE1KTU5wU0dabWU4OStiNnBVVWZhaUNqNmVVZUZlK3laZG9qSldvT1VtTmRx?=
 =?utf-8?B?L2FQZlpkZHAzeENrTzlkL2s1TlVwSk9mQnhjR2hHNzh3K2YvamhmOWtHQUFs?=
 =?utf-8?B?OXFmM2srMlhCNVRjcFNnY0xFTnQ4eDRReVdrbTFXaGRNM3QwbHpWakx2Wk1a?=
 =?utf-8?B?UUZBdFJBd3NDT3VlYVNjN29yYjFmOVE0aWdCbkJ2UHp1dmFYN2Eza2NaT2hk?=
 =?utf-8?B?V25LTjZWbVpWYjlieWRGOWg5Y3IwdU1panNrVmFRQVczSjdyaFFDTmZER3FN?=
 =?utf-8?B?S1NVR0tLUHV0QTJvK2tlMFBVcEJWZ3R1SzNhZGV3Y2tNcjV0ZzZ4NHNVV0xO?=
 =?utf-8?B?WFRrQnRpUkpEdnk0bjFqQ1p3T0tnWkovRExQUUR5akpDT0ZSaXZsY2ZhVzB3?=
 =?utf-8?B?YWxVYXZwNis0WWZRUFNSK2lWWlgwU0tlQnlleitBSXVGRkRsT3RXSXpZZ3J2?=
 =?utf-8?B?ZVUzRVBQb3Rlc2g4NU5KckNlYWFEcHV4TE9BT2xoSXJaZTF2aUxXQjJKU3F1?=
 =?utf-8?B?LzlMZWYvcTlBZlFUZi9JMHJmK2QveTc3S0k4aHRrWk4zUm5TNWtnTk1WSk0x?=
 =?utf-8?B?TytrUmNRR0s2enk4R1diaFJoSjR3VXljUExWSURoQlhkWHAva1FabDJpeVAw?=
 =?utf-8?B?WjdRdTJGUW4wbVJmSmhIdWdEYW9IQUxBTStMNFhFTUVMZDFLakVmaFB0a2tR?=
 =?utf-8?Q?5N5G8Vo1MyzNwUJMfj7zywJm0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6882b2e8-b6e6-4083-a589-08da7537303e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 10:01:52.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvGVwZySrE1rhbA1SBu7xQdA1yQpgVPkfONpdd+3qXAZFWMl/4o9Gyd7w0QHi0rC6usSNAbRyExeD3aKPjU7mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

On 03.08.2022 11:58, Dario Faggioli wrote:
> Take 2 of this series. I think I've addressed Jan's comments. v1 was
> Message-id: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
> 
> Currently, if the dom0_nodes parameter is used, to limit the hard or
> soft affinity of dom0's vCPUs, the boot hangs. This is because the vCPU
> affinity is set in two steps, and is only correct after we've done both.
> Credit2, however, manages to see and use the result of the first one and
> vCPUs are put on pCPUs where they can't run.
> 
> This has been reported here:
> https://bugzilla.suse.com/show_bug.cgi?id=1197081
> 
> And a fix has been discussed in the thread of this message:
> https://lore.kernel.org/xen-devel/e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com/
> 
> The solution adopted in this series is to change the vCPU affinity
> setting code in such a way that it happens alltogether and in one place
> (patch 2).
> 
> While there, make the dom0_vcpus_pin boot parameter more precise, by
> making sure that it is applied only to actual dom0's vCPUs, and not to
> the vCPUs of the hardware domain, which may or may not be dom0 itself
> (patch 2).
> 
> Regards
> ---
> Dario Faggioli (2):
>       xen: sched: dom0_vcpus_pin should only affect dom0

I'll throw in this one, but ...

>       xen/sched: setup dom0 vCPUs affinity only once

... I'd like to give this a little for a Tested-by: Olaf to possibly
arrive.

Jan

