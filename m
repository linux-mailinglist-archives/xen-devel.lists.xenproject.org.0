Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F762D633
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 10:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444806.699877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovaxN-0005Ti-Hs; Thu, 17 Nov 2022 09:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444806.699877; Thu, 17 Nov 2022 09:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovaxN-0005RS-Ez; Thu, 17 Nov 2022 09:13:13 +0000
Received: by outflank-mailman (input) for mailman id 444806;
 Thu, 17 Nov 2022 09:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovaxL-0005RM-R0
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 09:13:11 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe12::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e11b4ea-6658-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 10:13:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Thu, 17 Nov
 2022 09:13:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 09:13:06 +0000
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
X-Inumbo-ID: 0e11b4ea-6658-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg7Uhtdk5SQMnBSaqv5ku6ZYEbmg3GKqL2kyKbcTjoBermrXMXr1PP1lj9kkEJlE4JJqkaPl5ZRZMEKcfUufBHR+7S07hRWd5eqGU5pLBC6dlsk1Gih+cuMe1u8GkPVVbhQZWzoWoOd0QJ3Wt2SpTcJx0iVoWGALtG9bPDKVscEEv+/AL25sk7CYvNIWTiZViuHerBhgzG01xfcNROuNQ2EJd29B34ysDmBM0rR0BKEAgnDaViW0dwsAFwz+okgAfhI3+rzPeuxGm5Kw+FngQ+gJizAjA/Z8+SXplRMVsMw2pLrTfu78PSKc0v3gwNtGabuXhmVg4b96RmZljQOVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUSfZFcPU8crlb93Lfga+nPUB1wmyzPdS0J2wO3SQFE=;
 b=WcLu6jvvl/U0Ti6YGU9VcB6szuClJ7BJJbb8dMKrJ5OQ2ZGPoAfvEam7i1/JFevMP9ozD/4cllVtJTuvadQwOc7XUUOtubEkn0mltQEc9MCuxNVuFHskcuc/twVQK8+EevtynbnErGKw1DOpP9rv9PuxL5GgAGKNAqoe2f0+LZfaf3k2Na/5vyTVgnoqSWlRIEg3Fld3mV37g/3MVrAmaeP/HjSVJezF8+QMyKfoKICXKta12D++mHvxXjYrjsf+0swWeuob1f1NPGGxNsVAPZ+2UMZ6Oc0N866lXScoaVLnXMYdzN8PQijQu+wPv/sws63/cdDEhtbFSU/zTNOXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUSfZFcPU8crlb93Lfga+nPUB1wmyzPdS0J2wO3SQFE=;
 b=OQeKomEAgR2UaMedty4R4VsU/jZRU76vRVeZ1K9u/w4SWihxWCEsmMxZ5/hKqy9uTXXCY3Go+0D4Dtiqu85oQaT9HIAHYEZdzEAVqfl3jrSmcq8I8Tp2Er8OO6/228/HTGn+2HhWDpe6OumiLImbOMy2VmU7bSd3I66Y8i9ftYgtOfeJHdO2YwK1QjQHKk3+HzlU4RQCmd51K+e4MEuqb50HFQf4L3m7ptbbEV4x0ndva8/apAQmRMF+rkMxngV3VcgbG21lXPIPOM3dKUb0+hYe43Wb2befyhM3sQy1DvIFzCwR0xq+kVTomXV16WvcA2s/Vr8N5C1RGaO2kbPdCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21476683-445f-fcb0-7a01-46d454039519@suse.com>
Date: Thu, 17 Nov 2022 10:13:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] x86/irq: do not release irq until all cleanup is done
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221116122114.5260-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221116122114.5260-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: f474a74c-904a-4e1c-fea6-08dac87bf03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AKNhP7L8gW4JM9ueNCqWKpPQ7YQJu4gE0+OBHSvFM5pt7oK/IkGzrQd+Dm2Fts9B33FnWGhMDBqeTRUsH5Zb02NQK0EE/mn2SzFBCUSmTrHrVo+m/bpGhDVPGfY6Rl6rHMhe6RO4NRGHMZS0pcmde5AXlf04+LNMGBjOSSzGr0ciqtwsJFBIbMobNcQLnemZXfknrtfw71wItltcnQNkWfZUDAMRVJpAG6yXlL9s9CJlJI6aYQGwRDbIR+IJUvduq+DKd8p6WZDVcOXTUXUL/E7nPJWt72LMJgo5HUoUMQLa0YOt8FutnQ39YHfaSadLMeB3YbMauOA+9Zw0gZ9jUZA42+q9+dH55L1QjIPuRuFL5Hn4fFe8IcxXyQpZPYJdHl1KJmb/zCFx0J9+8NH4jt4APoYBouw8+ud0wcy3gI1/sdhNqNN30f4LVpa47XHA8Dhx/fmbIgSlenqMIOz4e1R2g158AGYfieOEYpMLN5I6otRrQ0Ysb4rtIb+0ddCNlIUVNOU6N8a49qmXJOee5uOuGspfhhmqxJqnZ4FrDCH2GwX9HhPIOoVPKH8miop6IQuWI9Aa1iOiscEjLzJhrtWKmsiq2PvSIHZoxwkJ5IJGKOUd0870wVgQqhWHicPGWul2HHkZR6+Bk9JsljQi+DvDhHXpQwjxffOtdVxBnXy+1oLnmWtfG/NO+3M42nqF41ugKVPGN5Mi4xe+L8NSzH7eQjVsv9D5TDTpKc4cpcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(66476007)(316002)(54906003)(2616005)(478600001)(36756003)(186003)(53546011)(26005)(6506007)(6486002)(6512007)(38100700002)(6916009)(83380400001)(31696002)(86362001)(66946007)(4326008)(8936002)(5660300002)(2906002)(8676002)(41300700001)(31686004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1NLbzFwKzZVUTBidng1TVZ1TXNGOFBRQUNOL0Z2bmNMYThZRVdZYVR4WmZm?=
 =?utf-8?B?R0VkcC9yOFR1WGRHZVpwazJyTmpXdjgyNGZPcFF4aDA1VnpQZEdNTERpd1Vi?=
 =?utf-8?B?UjhiUFArQ2NxMDhyME1QOFZzMm9ZcW9LNTBubFNIVkZDZlBMMzhDdzVadFgz?=
 =?utf-8?B?elVMVkQrb0hoSnptQ0lxZFcvVVZ5OFBEWjBIMEV2YTJKZXg4QkJ3TC9ERlZw?=
 =?utf-8?B?RlNNZ0xOMjZoL242aDRxZnNTS0VwK0g0alRTRExqcWJjRFdaMjFBZWFoYUdK?=
 =?utf-8?B?RzNrcVpvQUJaTmp6TUZnTWQ3bHZxNDRBcCs3WkFtUkphb3JmUUdvcDVvNDhN?=
 =?utf-8?B?VEZubVpxNTFHaUxhbFpHL0Z1WWVVcHVGZGU2OFZZVlgrVFBHdUorQ0tmdjNa?=
 =?utf-8?B?ZEljTkV5MDRXOWpQUnpiby85c3ptdXEreXYxb3Fqb0RmZGJ5ZUZmZVNCejZP?=
 =?utf-8?B?WEk4dnZWL1ZGK2FkdStzc2hPcXVZU1lPUi9hRmEzQjFoZ2l6WFVuRmNxWWhS?=
 =?utf-8?B?TVR1ak9WQlhESy9yYzJ4ZEZmK3c1bHdsQitJaTBhdnNMNmZWcFdtWXdJYXNI?=
 =?utf-8?B?S0xyYWdRTnhWdWJHUm9ZbTBrZm5TVWhWR2R4enMrR0dKS2huK0hqS0Flc25P?=
 =?utf-8?B?TC9uVUtIdlpxZ01vRmxUMkRpNlpiV2dLM1BiMUk3bjhjaXlWb2RucHZFSUhM?=
 =?utf-8?B?eHZPelN4a09CWDc1VUdEcExBTXZzSWRCTXNDSGlmV0MvQjRCM3ZDZzlvSEx6?=
 =?utf-8?B?RU5aeko2aWQ5aWV3bGRVbDFXbmVMSDhiREExZmx6a0ZNdmg1a2pYd1B2UmJL?=
 =?utf-8?B?MjFQMjc5V0xoYmE2TnIxRk1YbE1DT09OcERLbnZzckVUcTdISHIrcE16bHl1?=
 =?utf-8?B?NEtHVXhldHhUN2RtVEJHQ3A4QmJJVlVBcTRMQ1lsUHVudnRiVGdHRkxOaWc3?=
 =?utf-8?B?NFBTQVUvbG9kNzJrUTVmQlZCMzI4S1lPNXRhTklUVmxXUUtYdk1KdEhuZTh1?=
 =?utf-8?B?dkRRL2ZlU0YxZnJ6cHljc1JFQzZSamdkUGFYdXRDOUluRXhod0V1K1VISU5w?=
 =?utf-8?B?NEo5L2dlcUZJRXo5anFKZUgwVEtrS1FkellwUzByQ2hOd2hIRDd4M1RtVmJY?=
 =?utf-8?B?REs4WFd4ell0anhvTnhVeVltRHlWd3ZuUER1b3JjZmlEcnlHRUErTml4Wisw?=
 =?utf-8?B?RG9ZSFFDUTAyZ3grQnh5cC9qbEFTQmtpSkt4U2dMV29ydU9vdXAvTEVPRTJH?=
 =?utf-8?B?dTc4S1Z1cmJ6WVdXdWVBeWlUOUNxS1hQOG9ZZEIxVVBEeEc4SkU2cy9WWHJB?=
 =?utf-8?B?ZmZtVDFtVXVoZVpobUtYbTVqZ2VnZXN6TlpBNHdtYTZIN0lJaGZuZlV0T2lR?=
 =?utf-8?B?bVZEZmkwMjJqdGZPblZJRWpNd0QvSUErTGI5bjV6ZjZsa2hCRGNIUEpNVTdq?=
 =?utf-8?B?MHRudlhjZWI1ckFtblYrRW1rTnYyM1FFVUdZYTl0VmZvdW1oV2VCYUtDaUpo?=
 =?utf-8?B?bVhCdkl0ZnBPQlo3a0ViTnYwdy9lUlorMG11d2R4bXNhQjVpYU5HUkRjVzIy?=
 =?utf-8?B?T2tocHlKWHlydi81YVI0TWNJSmVoemNldWxPWkFML3JmM1pNbUJEWW4zZmVF?=
 =?utf-8?B?UTBhWVU5SXJjQkxjOGl6VHNZeEwrVzNIZ1E0WkNKTWJzZkp3dS9tNXp4UGMw?=
 =?utf-8?B?emkxa2puTy9kSFhtRzZrRFdPT1EyU2tLWmp3ZWE1RXQ5emg3SzMyMUh2QVVs?=
 =?utf-8?B?WnVHQTJSY2dJTTQ1eEcyZmdIb0Ivbk8zNDlWZmtCMENidW53RktXQmRBUXdU?=
 =?utf-8?B?K2wwcHNYOHN6eW9KdkVna3Awb2MwNVNVNlpERGJ2eU9kNnB2ZjRwTEd5eXpI?=
 =?utf-8?B?dGNiRTFtNXZCV28ram5iL1VFcisydDA3c3BzS1F3eXdwV0sxLzlORnpteUh2?=
 =?utf-8?B?dWJ3cm1OWUNFV1paMys4VUtjOWE0cW1vdlV6eVlEck0zSE00anBlZEdnd2Nk?=
 =?utf-8?B?OWYxWlFNOTVCN3NsUkdpT0ZvRmRtTHplbkhYNWNvOE5QMHBvU1FYQXBuTnFt?=
 =?utf-8?B?ZG5uRWlOWTQwVTBtNlhpN2t1NERQZ0ZzZHNmSER4YkJFanVGVDVsRkU1ZWJ4?=
 =?utf-8?Q?OVIHCVhEbKKBjgPUZHno8goh8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f474a74c-904a-4e1c-fea6-08dac87bf03b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:13:06.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7Skeb2LucvbL+ideVw/4lgHoa97N3mDj0jzCt9q1JK4VCf3uzdCpDU6jd/TEscMvD0y+5qMIMLlrqhZOtckPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

On 16.11.2022 13:21, Roger Pau Monne wrote:
> Current code in _clear_irq_vector() will mark the irq as unused before
> doing the cleanup required when move_in_progress is true.
> 
> This can lead to races in create_irq() if the function picks an irq
> desc that's been marked as unused but has move_in_progress set, as the
> call to assign_irq_vector() in that function can then fail with
> -EAGAIN.
> 
> Prevent that by only marking irq descs as unused when all the cleanup
> has been done.  While there also use write_atomic() when setting
> IRQ_UNUSED in _clear_irq_vector() and add a barrier in order to
> prevent the setting of IRQ_UNUSED getting reordered by the compiler.
> 
> The check for move_in_progress cannot be removed from
> _assign_irq_vector(), as other users (io_apic_set_pci_routing() and
> ioapic_guest_write()) can still pass active irq descs to
> assign_irq_vector().
> 
> Note the trace point is not moved and is now set before the irq is
> marked as unused.  This is done so that the CPU mask provided in the
> trace point is the one belonging to the current vector, not the old
> one.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



