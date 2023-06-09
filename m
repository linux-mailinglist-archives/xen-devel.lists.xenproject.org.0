Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5214C72958C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545766.852317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YaG-00076e-O7; Fri, 09 Jun 2023 09:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545766.852317; Fri, 09 Jun 2023 09:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YaG-00074x-L5; Fri, 09 Jun 2023 09:39:04 +0000
Received: by outflank-mailman (input) for mailman id 545766;
 Fri, 09 Jun 2023 09:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7YaF-00074n-CH
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:39:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 777c9fa4-06a9-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 11:39:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 09:38:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 09:38:59 +0000
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
X-Inumbo-ID: 777c9fa4-06a9-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQgtnPT8J6gFLjty228yQD3T7pbOxA0QF4kqfZ08+dpSTKCre0JvFUAbUTEL8Yj5pdmJEGt422Ofl90okd7fnferBmgciobn6+zfxRjU3gIRhIfKpKQLUOQokeRP5h7UXfsfK4IdYgqdohO4Lg/UKeNHngUXnP4FU7gAbl3TwPtQNo464IOU4fhj05jq0zWtglsaZpoMy47LmSqTTn3Ag144xYNufKmeAlQs05PvSBu8u4b7lUG4CR0rELSzI2fQ38MyaQ/+2mextLmJVeqQEJ6rM4PwJv7C3jMue2TVGiUuiqsLCrF5b4SyiPM6DfnP8kxvOz5EYgzDOydXddZaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Axb7SAVZHw9HP/uNPKJAVMsTCGxkkXt6pz1ZmizR2U=;
 b=dDx4L7AO6bkMaRcfXqC2Yt4xE2X7QbXTZwc+RU2tZAKFfVVEU5QX2gkWZVBml8gzr6qJ8xIZ+gCqj8yIFYNlP791JMNqzZGw0iJj6gu+6Fl3OVVmdBRunOIVXinpcco/WyhNBN3eMYuoLPij9zvNFDOzm0zkqOsUsCFPeaWqasxb2SsTCJpiW3I1HTNWqkx3EQyv/eDJemGZDNXc3QBUuHVH9rleHaQg1zS4y24mtBT54Gg/Rk8UE6UjflonhEunnek22pcFEnz6L4kaQtYsFWu9hzMdGryQdp5TNdD4NSlZ6OBPLcdeHi+ivIBRg5sG26ie/9g+VnFhLnTbR/oR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Axb7SAVZHw9HP/uNPKJAVMsTCGxkkXt6pz1ZmizR2U=;
 b=qFbARXjavjkpn/1y3xwpvtraYWYygCMZnOWUUStMez4/hU4jKOXc9xwW0j3LHFkiaugvVxkDMB7hr7nf+SubKfui3Fkl4FE0VaYashUIvL8r7AibhM2iNjlaSy/GtBDJBntiilth9oRUBmbTjsHmFkmXrFREg/BXUeXqpT7XQbztbcT38vgRILFmzTjInjAT+kUa0L9KK4UWx6tAy34B/+5lrz9eSwXk4Y2FRjQQRo/M/Lw/MOJLElrssqh9H/XD+CohlAX0zeCOmBvafPMQ5VcsiIi+mdVDtOAOyQTT2IL4VM3PhAKgcV0xT477yIQWCXHVICljHv39xjiutjkxkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
Date: Fri, 9 Jun 2023 11:38:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio
 <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org,
 Shawn Anastasio <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d5d49e-96f1-4461-3edd-08db68cd5a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eZuJS0LaAlr22AQT6x9ZeLwBdp3Tit25PWkKK9aJqlhJ5kBy309c0izMrHHKFx2zOiWvAQTRvAGr0yfiNnHF1bsBxKsffrNzYQSUBlMQ6VUmDKnOtUavF+mV1Z7bfvAon/PFULRtFPUF0kAfY4iU8RNZv/1VcmueGpYI2jp8K180kZ743iYqvKBDJjZtA85+bcv1jhTVCsSDcv9FEJVrN2ErY5+PRNq35yNo43RQy0jPMdMYBUelcf9ykBuojsdSPsMu5FRre0kmQeIf0ePf8lJ2XIV+zdaKeA2SBmZ0hPt8CYriijt1jI/iq8D+7wum7tDrkXFo+2Y/4yPMJEvicn6KDsOzYd8OD2qevrZMBiHteVnr2dqpgl9PTOs/Nizbv34OFuvKyJOj6NG9p8dW+L5EjqUEfR+eisVcrbUF13rmovHauBKWjChDhWsJtP8rEyt++Wfs24b6hUA5I9kfiiyWRsMNI9luxsbmx9AgpMTo6LYKJZwF0Qz/jajZeP4jnKAbVYZTb67c6m4wD2tZdReVsJfRB1zYIKj2vx7YZIt8SuCtjm56ERXj9re8kjQfQ1FAAqwQnde2DsgfxGAGIbQiGEmFpiGRkYD9oDc/YaX2U3ARoF80W4pnq6TQ2vpa7lGOY2zoNxN+fFpjRoq6Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(41300700001)(54906003)(31696002)(4744005)(2906002)(36756003)(478600001)(8936002)(38100700002)(86362001)(8676002)(5660300002)(4326008)(31686004)(6916009)(66946007)(66556008)(66476007)(6506007)(26005)(53546011)(6512007)(2616005)(316002)(186003)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekR0OHg1Z2xPRXhZQnB1Y3NsVFV1eXhsdGJuKzVnQldiSERZZC9DY2VkTEQ2?=
 =?utf-8?B?Y29zN2prU0VsR0h5bVJOU0ZDUS84eE91MVVNZjV3UTBIQmVrMTlKLyt2NzF2?=
 =?utf-8?B?N2lNNENOZ2FMaWV6eDdjdExrbXVIQVhJTXIwbW5OTHpYZkhJNXYyUXpYRGxE?=
 =?utf-8?B?WVcwckdseXBLMXRRdDFZV2lqQktJYkJOMHZLeS9uSkFQUWw4azB2cVVza0E5?=
 =?utf-8?B?SE5sYXJmdEkveGxiVTdSeE9ZR0plcllQVklNb2U4OFEyb2M2Z0JNWFpXRG1y?=
 =?utf-8?B?eVYrajdiUDd3aWhZMGsrc2J2T0NTYjI1bHNZN3NHNHVYY1dKeGN1UXZXZ21k?=
 =?utf-8?B?Sis5c3JReUc5bFpJaDU5RTYxdjJBcDVZMkt6WEVuYUpaOUVWSkoydk1CMTIx?=
 =?utf-8?B?WTZEVzV2MURPVWFsYktyRXVvMFlyN1ZXWlRJWEIzWjR4WFBZRm1xYnJKT0NB?=
 =?utf-8?B?TVZGcGFIaVRCRVYrblpqRFEzYk0xOVhGSEw2U1dpQkNUMUJjSE9oR0s0T1hw?=
 =?utf-8?B?a1F3dlArY1d1bXpIMVh6K2grYmtpK3hzaktqQU1malRoc2hUWWR0M09qdGV6?=
 =?utf-8?B?RzVPSzBoVlZRRHlHWHIwb2g0MFRXT0EydGkxZnVhQURwdjFSL3BtaStGTnQw?=
 =?utf-8?B?NHJmYkNibFo1ckIxNWdjMzBkcWlvNitTYkJUTjExZmkxRFdCd1ZzYTd4UDFm?=
 =?utf-8?B?K2ZEM2RORWk2eWtZRVNZcTdrc0lZQytFdzFHUm5RVkgrSmJkT0lXZDBIYXJO?=
 =?utf-8?B?Ui9sTVh3OTh4Z3FLMDdvZjhGcGp3K2VwcTBldU1TVTM3Rkh6MmMxZFZVcjJW?=
 =?utf-8?B?eXVaSTUzOXlwMjBscmV1VllYaTZLMlFrMkpwWmVnL3pTVDhVakp6WWF0aTF3?=
 =?utf-8?B?am9rVkxkbzdHT1VrTWR3SmFDaEMzcks3MkVWaHVRYytvMUNNL2VUckUrVmNM?=
 =?utf-8?B?cCtMMjdZcTVDcXZKS1hQa2I1OG9CeUN1MnNLVjJpdUJzeU1uZk05S2YzNHpq?=
 =?utf-8?B?SEVvbDZjRVBRb29LOUdDZmJJUTVXUUxBMlJOY3d4ZElqUVJ3M09pUHF0dktS?=
 =?utf-8?B?cHNXbEdxQkRDa2p0YzNlZ2E4ZnVicjdRWm1KdktwN2FyYkk3NVA3S201bUJY?=
 =?utf-8?B?bkJzRUQ4M2pFQ2VTUSttRXJyTm5WbGo0TDdqbHdkclVtaVVCTEFvd24wQVpv?=
 =?utf-8?B?NzJtWExhYlhKS29uQ3B5NWhxRWYzVEo1Wm96azNvOXNRRC9IbzB6QTdWb2h2?=
 =?utf-8?B?ZjFjZnRybW9kZnFSWFdTK3N6NW94TVh4SmhCbmI3a2NLWTZZVjBoaWUyQ0RC?=
 =?utf-8?B?dVJ6bDJ1ZE5tekhvdmlsUlh0NXlkeExVd0ZDNjJyYU9YNzRUay95STRkQnBm?=
 =?utf-8?B?bVBrT3JWeE9XN2s2OER2dXZoOC9IV3g0Z2lLMGJBa2JTQXdqY21Fa2dhKzFF?=
 =?utf-8?B?QXB6YzVFbmF3Z21JeldXYkZmZ1dkejd3MGpOODRzLzdkbFlUVVJNNisrNnFU?=
 =?utf-8?B?MXd1Unk3TnVTK0c2Y3g5bkR3ak4xZ0pjeUdYcGY3NDZxRGlNUUFNUDdpUHIr?=
 =?utf-8?B?MmNqN3FlVElLeFNCdjNxQk15YTVaYUtUYlFOdW5oMmd4R0JSYThMSDh4RXhm?=
 =?utf-8?B?bDhXNGN0MW04eTdXWVdva3o3UExrazhuVVFPZ3VZSENORFo0ZEZrSVFDNXo0?=
 =?utf-8?B?Qjg1WG93ZThYdk5mWERvUWx5OHZNTXE0NFBjbUlySW80RnhlVGVYYU1qVXZG?=
 =?utf-8?B?SXdoZmJlUVRrR08rV3VLS2IxUnlJZTFHU2FoT3BDTzFvREZ1SDNBWmxhKzhT?=
 =?utf-8?B?bnNSVUxHQUJpSHBaRm5wUjR6SGNZc0g2NnNOeGpwK2VJK1VVbXhSRUJmY2NG?=
 =?utf-8?B?SGVhdU5Nc2dUN3dCUGtiWVJyWjZmRjRYajhkdGIwUjMxWnNuT2E4bHZqcHBy?=
 =?utf-8?B?cVUyWWUzU2kvNDN0Yk9uUXFZczMraWxFTVBKU2Njc3B2UXUzekhkWmhBMG40?=
 =?utf-8?B?MkNjOVZxQVBSZWRhWWIrRzVIQ3V6RWxjS3djRmxxWkJGQzdLbnAycWhVYXBE?=
 =?utf-8?B?UkpHdzBlWFQyWkNFVm9VYWNJZTE1bEd4TmFCdTNYR01vbTBLVm9xamxHRDFm?=
 =?utf-8?Q?VBLB/JpeBhGRwAsXN5V9KfAwI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d5d49e-96f1-4461-3edd-08db68cd5a09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:38:59.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKp8BawsvX9lRkadzOax/5qYZTt9OURK0jaFB/qv3ysMikW/9m+YNAFDMTrGMusB8OoCWPXM7CxE78pnHKuvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790

On 09.06.2023 11:29, Andrew Cooper wrote:
> On 09/06/2023 10:22 am, Jan Beulich wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/boot_of.c
>>> @@ -0,0 +1,122 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> By default we mean to use ...
>>
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/early_printk.c
>>> @@ -0,0 +1,36 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>> ... the more modern form of this (GPL-2.0-only). Anything deviating from
>> that may want justifying in the description.
> 
> GPL-2.0-or-later is fine.

Hmm, I was merely following
https://lists.xen.org/archives/html/xen-devel/2023-06/msg00415.html.
The text at the top of ./COPYING looks to suggest -only, and I'm
unaware of any other place where our default is actually written down.

Jan

> It's only the un-qualified GPL-2.0 form which is deprecated, and should
> be replaced with an -or-later or -only suffix, as chosen by the
> copyright holder.
> 
> ~Andrew


