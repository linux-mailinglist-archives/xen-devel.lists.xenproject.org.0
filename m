Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769A5544BE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353581.580523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wDN-0007KG-Bd; Wed, 22 Jun 2022 08:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353581.580523; Wed, 22 Jun 2022 08:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wDN-0007Gw-8n; Wed, 22 Jun 2022 08:59:57 +0000
Received: by outflank-mailman (input) for mailman id 353581;
 Wed, 22 Jun 2022 08:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3wDL-0007Gq-Sj
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 08:59:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad46ea0d-f209-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 10:59:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8851.eurprd04.prod.outlook.com (2603:10a6:20b:42e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 08:59:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:59:48 +0000
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
X-Inumbo-ID: ad46ea0d-f209-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dlg7K0R+NqwjEUa0jik9ZZ7vz9vsWoOWKLI336HZnwbeGLiWCvdJS/6xySRu9T/uWIrKXu0HACV+IGQ7Cb0OGpf4zUh6SccrSML4G3Oi0vBhne0pOYoMq4e8imUsAYLRQVpQvjDLSoIrk/WDDJmvFm584B4lVPRuKVNf5U0EaU1HvHwuKpHaP7+uAggjxda/4VD9VS++0GnHGbCjN/k1+GXwVHmTZ5Sz2KOkTwgO5WwA3C7VSLYAOUbnoemvav0exaX6cOflgMB/+hKo++K9QYGP+jqpLRcWwIxzJCCfXHSphpn5iXDofPy43AhPHvJnZTsEEtH16K4DGWK2/m70qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wUJM8J/QKOFelvYOIxKZZT3Bd4+jlhw35Xmbg0vNTU=;
 b=eAbVCJlColhfC7GbQ0bzXma+BUwTJ8IOUM2djmXhl1v6+mz+mv1UqEmNpucEFPpIHhpck307vCLh+4GnnSXvBAlnDEdpVYRVtlhLoNbe03XYAJA1IIQIEJIPdQ/RCBWdj7ES16UekZBmIKyD83AvJ2s6Y/BdvlPzbVmEop4t7jdskI/KoJ3+kS0EZMfQS0Bqjn2QXZDXi4z7y4rlRCFXuegSq8Wz5114jCbtCQhWkSshPGRzlQa2bsGxvUSRtqWOL9H+K6PxUkvnsskzYjKLMk1GzIIPXGho0p3zk2EnVzruzZL8ct3oglY/wiVehXVChKula1QVc1xYwS+5YGQN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wUJM8J/QKOFelvYOIxKZZT3Bd4+jlhw35Xmbg0vNTU=;
 b=vGe9pcQoec8ZVacPydpI4W71JDF2QpNPUXxOJ8eilgKW1ryS9LynCtfLU+QW1fyO/6fqpjUZrqxwtxZdVFMPY9HboQ33rBizTH/IWnDFqUp04vI8/z+/4GuBJcyLtb6XHHb4a4hyyGNR1gqy6NLyL0WO2BgXgEVJuei85n6ZXxrzsdFyr3mL65tqlDE4VPnH/NN4O2cdxc8kgw9KSp8pfPt9CB49vO/sS18u9/1h7YArjlUVZlaO4DLhy8Egepa9kHv/cODm98tO58XsDLv62Wzm934+UTEZzIOxTVJuctlnACbpdfz0RCzhB1S4gpp8aH0+A5yYk8SNpHUHi+rPSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b788e1a-d872-e318-1be5-8640fe887b9d@suse.com>
Date: Wed, 22 Jun 2022 10:59:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1652797713.git.matias.vara@vates.fr>
 <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0362.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7b09417-6db9-4261-057e-08da542d8f99
X-MS-TrafficTypeDiagnostic: AS8PR04MB8851:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB885101606C6B5DEDADE865AAB3B29@AS8PR04MB8851.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rGEuA7kBHJ33uuEosQXjw9xhtrTE2/JB/NTXQ1j7sqii8NnaMP27fcNPz903x2y4H3FIFDUIWiP+lw2EzbfSxax8nI4+a4WuKXg1LXVZxlFUZ0FyN38lVodrHNSsZVaRqdiecutGIt5TiwcFb+SKYjdCxXICZ/OIftI8e/n/B+aHCx4J9HvNApRBtOloHCjXfwYzDzR/oJYQx5By15WB/4Avk+KVwCV1lgZYuNe5yf6lOXonbfxxB8p+XJjjKdjRcb+xY98vgIBCu8pPW7Z4VAhH1OkPYCzYNM1pZBW+Qbny5DZ7keMCe2KdNrX3yakTP/jkRxpHriJPWt4loay2SoDhuC2AU51X8j//YdSjCdmUvJQ5WY6LCmBRjIJOTDngu1HhGkZj6ysMxkONLQA1vKpn1NsRkKVH5lrYXOS5JI2M6mGCi/3N12upcrybWQwUdQFuGc5qfLX69Gy7r9m7jvmw+Ckr/yq1AcSL4yt4FOXRLcIcDVZlql5EVtz84dnZm9wNxn2oSBjoynPmrOmphcDNrKsiHxZFZfgfAQEKpCMNhyZdzFajl3L0nQbX2293owGLRcBZE6ozIvoffOV7dYSogoM/E91XWW/v0/Ho80mpCADtgIxZ634VxJa9qvfZHvOZrtTLzknEFz+zvz2MuskZc9e+/3hwHaNPZSnkkd/6unBIxbn1MqB/MjeLA3ArY2UktX3azyqEWLFLBMjIvbDxGcVqwOL/Iq4hyAjvmhVwRCWTFtSFOumg21vAB+qefVKQYZ6Qp1ayd9O/AaETyfrFJ6zzLtnqoa0dq02KvRIJzsHkbwLm+jLz+hZWH/o7qrnK+oPGxqmkbvJQapUzag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(366004)(376002)(136003)(53546011)(26005)(6506007)(66476007)(6512007)(2906002)(2616005)(36756003)(6666004)(38100700002)(41300700001)(5660300002)(8936002)(66556008)(31696002)(6486002)(66946007)(31686004)(83380400001)(478600001)(186003)(8676002)(54906003)(6916009)(316002)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUx6bjVveVczbFN0eUVNSWpla2RjQTVodFpMUlBXRUlOczVBSmhwTWtpcUwy?=
 =?utf-8?B?TE9vZlNpaHZGdEgrZERKRmpCM09GQTBJQWdkNHE0eUdhOE9JOS9NVjdSSDJv?=
 =?utf-8?B?eEROb2J1b3lZam1zNTdRV3pwb29BcTNGUmFHZU8vZlhiZ3VaK1ptMGkyY1Fn?=
 =?utf-8?B?bkJpc1lydDN4dCtQbWRGZzRqVDUzODZmdW45dFBPdm9DZUlRekZLZUxQSjlY?=
 =?utf-8?B?a29wemNCNUZpYWdkOFFzN0s5cjJwcmZyNDVDa24yNWdUMUIrdkZyK1dJUW9p?=
 =?utf-8?B?d1FoSUJCbGVIeG1EWHRaTml4ZmFYUldZdW9hQWxYbWZ4SlR4QmY4V2IzVmFF?=
 =?utf-8?B?SFJNQU1FOHRodFFmTWtiblFpcGVTVjFPZHk3T0p0aG1yM2Y3SEllR0N4QVF0?=
 =?utf-8?B?dUFERjZMUE9teHM1Wm9FNFZ0SHZ2VVdyN25tRGJvVTBWRk13YXFuQWRkbkt6?=
 =?utf-8?B?bGc0eHFGTnRadlVia1lLWStlc3R2QnZtUEVzOGs3a3ZteE9RdHlTNE95UXk5?=
 =?utf-8?B?Q1EzMXFhdCtDd0FjSkhubnQ4Q0p0VWZaWm5qcUNxQ0pQUDltWWlBdng5UDh5?=
 =?utf-8?B?Rk9TOENqdkp5WXNpeVNCRTN0QUczRjNLajRMd2pKaHNNbTlZZjNpcThnQkxB?=
 =?utf-8?B?MjBMOWFCSkMvdnV6SEc5emdSUjJPb2k0VGNaZ2QxVHd3UFlYRGR5NlQ3QVRX?=
 =?utf-8?B?citZTXdGWms5WlFrVCt2djJ0QWdSOW54aUVzQ3BqYXlEQjFLN2RnRGxScGhD?=
 =?utf-8?B?YWV5b1hSa0VBZzJVREg3MWwzVG43VHVrUEdhcGNPaFlrUGFaL0lFWm5SaVg3?=
 =?utf-8?B?YTR0UklNUEF0SG4xK2tSRjdJcUtHcHJsVFpFdlkwWDNXbldPR1FpTnVJdDMy?=
 =?utf-8?B?VittQmEzUkgrZlNHOHhZWE01cEJ6a3J5SFhjbDFDUmhlb1IrWnJvcndSaDBm?=
 =?utf-8?B?L0Npc2tkZ3ptR2s1QzllWU1XWkprUURFWmR5cFhkeGJVaFptNE1SYnJqMkhY?=
 =?utf-8?B?Zk5UMUhpZTZBMVM0TFh4QmFhSjd5cnp3Zjg1RlFWU1NKT3pobzlsWjJ0MGxV?=
 =?utf-8?B?a0JFaXlMTWdDSHM2Z0ZycEpLZk8ySlVJaXA4Um4wRkliTEkrbUJCK0dxVnFu?=
 =?utf-8?B?MHRhQUtKODZIODREM1pJbzFlTmVtTzJmM3JnaFR4cjA0eGxxRENYY29STlcw?=
 =?utf-8?B?a3g5M1V0WXhsR0lPSHMxMk9KdDhKemwwbVZtNVdqWXNxdXoyVW11UGRZQ3RQ?=
 =?utf-8?B?ZXQ3QUd2TUNJV0tCK3FDMWxQVUhnUzRqMG9DTG1xUk1obkpNM1FvajFQRTY0?=
 =?utf-8?B?VEVlYWc4NFhBdHF3QkE0VktLZjZ5OU5FYjE3NXV5R2l4MTkzYWRZaEhtcmt1?=
 =?utf-8?B?R28yM2oyNjQ2U0h2dGwyeE40MDNIV00zTUNjaG5hQzRUb0svLy94Y0NIanhO?=
 =?utf-8?B?K3FSVWFHdGgyZ0N2a2NvS0Y0OXk5WFRicmJhU1hTa21BRHlJaWdjaURXYktU?=
 =?utf-8?B?Zm1na1Q3OU91MnJ4RVk2S2poYk9ieVpwbThhcW1aUEJXbG5UUnB1T3JCTnRX?=
 =?utf-8?B?UmR2bTNtQkxlcEZoekNMTU0yWitkYlVIZnV2NWJHbjN1MnRvV0k4bWVqM2FB?=
 =?utf-8?B?eHdxZFBlZ3RzUCtFZ3hJa0QxV1poOUtnU2JpNDdDUGEreVNQc3dWZGxCaGY5?=
 =?utf-8?B?bVhjOTZ1NFd1a1h3ZWFxTk5VemxXNDdHUHhGRVRKcTBPZk9HUldzS3lsbU9W?=
 =?utf-8?B?dFg5WWRtYUVFWldNdTdIRnluUm1kRTkyd29OTUdrZCs2S3JIdmx6aHBveTNW?=
 =?utf-8?B?NG1uWGNHL1BnalQ3Z2VaMXNodHZBZDFPN252UGVCSEVpTWtCT0pkc3pMVjNT?=
 =?utf-8?B?SjEwaTFadHZUNVhYZG9MalJuT0Vib0VmcGovdzdPNW9uck1YNytCL3JzbGp0?=
 =?utf-8?B?R0Q0ZC9CSnFhR09xSDNScG9kc2ZuV2l3dXhDVXRzRUcxVzkvWkFleXhIUDl3?=
 =?utf-8?B?T3FUWFl6ek9JSGpkZVU0R1RTbllvOGlyeUgwbEdFV0lmSWphSDh1ajc3VkFm?=
 =?utf-8?B?T2VMampId2VVQkIvZENocm05L0poVkVYeG1STDY4YmkrVXdTYVR4TThoTkpy?=
 =?utf-8?B?TDFqY0sraE9yM2poTHVNNDhBNTEySWdUcmdkcnluRXZoaFYwcDNmOVo2aFBZ?=
 =?utf-8?B?cGtHM201d3NTQmQxWitUR3dRakpPRzR0YkJhcWJ1bEowYnBaNnZ5a0wwamd3?=
 =?utf-8?B?T0plMVl4K0lTcEEyR1JFR2xZdUxNbFFQN1I5RHFWZWdTY2dMUnNGOFU2ektQ?=
 =?utf-8?B?M1pjbW5IWHhUTFh3SjNZb0FpUmw4UWROOEYrRlVxNWVIUkQrRDQzdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b09417-6db9-4261-057e-08da542d8f99
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 08:59:48.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UlmdXPGlKeJXwokXCIOGjILTA4xh0lEMZU+OJa6FoVUVyxuIfIV9CYzcy9bg0HPAM+uoXXg0Sg1ynWxIGVmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8851

On 17.05.2022 16:33, Matias Ezequiel Vara Larsen wrote:
> @@ -287,6 +288,10 @@ static inline void vcpu_runstate_change(
>      }
>  
>      v->runstate.state = new_state;
> +
> +    // WIP: use a different interface
> +    runstate = (uint64_t*)v->stats.va;
> +    memcpy(runstate, &v->runstate.time[0], sizeof(v->runstate.time[0]));
>  }

One remark on top of what George has said: By exposing this information the
way you do, you allow updating and reading of it to be fully asynchronous.
That way a consumer may fetch inconsistent (partially updated) state (and
this would be even more so when further fields would be added). For the
data to be useful, you need to add a mechanism for consumers to know when
an update is in progress, so they can wait and then retry. You'll find a
number of instances of such in the code base.

In general I also have to admit that I'm not sure the exposed data really
qualifies as a "resource", and hence I'm not really convinced of your use
of the resource mapping interface as a vehicle.

Jan

