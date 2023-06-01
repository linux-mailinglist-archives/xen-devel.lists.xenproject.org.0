Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C987199E6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542374.846158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4feO-0006ZI-Th; Thu, 01 Jun 2023 10:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542374.846158; Thu, 01 Jun 2023 10:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4feO-0006W5-Pk; Thu, 01 Jun 2023 10:35:24 +0000
Received: by outflank-mailman (input) for mailman id 542374;
 Thu, 01 Jun 2023 10:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4feN-0006Vz-IY
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:35:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 024b9ab3-0068-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 12:35:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9819.eurprd04.prod.outlook.com (2603:10a6:10:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 10:35:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 10:35:18 +0000
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
X-Inumbo-ID: 024b9ab3-0068-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxw8QdmVdRVlxrYA6OYOL65OB4kKaGvegHBAdyZYOYSN/98I6acWHbTDrQdJhvKppNmtfKk4XCW8S14xHtVCGNHIOCRkMy7nHE9yFha6kDqcFlC2yJtD5tFJMv4MJAAJjD5a33Dd31NJMlhV5zVYI1i+GbhTOMCbaNHXw8xD5TBe8s1D1XIjpxAC873vjmnVnXjvNfpAqG+KdXLjzZodph7kcjrNrDIcL09lIXfnCZ59I4mmf6+XCHfWpfnESlnjqx1LwbcEve/6dmKlLzRj/mXM3VU78o4LW89h2GNzXdX5fh9o/oksgAb/PlERpbbfm/fsIpSzLz8FpKtjVRZxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffrw5v4J7yvFKFiJO2e4jw+fR9aRSKdWTfCUygVk6jk=;
 b=g0b39D8MVwnp296bhnXQk+Gxc5ggNbkJjTaQsOmmD2iCn4MVN+JL1wkt5MP24m2Ah7+SoWeYlHIFb/ShYpljjfWl3NtgVncVzHWBu17GJUN/qEutHYcTn7T6UqIzL1AI6YooyOcxQwPUFEcGiW9ayGWulsyIzFuQwmAsk5JbeJGzPGyUDRcVUw6PbNy1dIhsztXKCVv2KILZYGwhODLT9AyhfAJ7lWH+FX0kgnYfYCbx1/sakZqopYiKTCKIfvpp4byMPxx3AxKrmuAsECgcC9mAqkU0h42BEWlQtz7qvPR8K+Y7FSfciSTm2ZIKUwOq0M3HJ0ZUbD/KHUrTa6vX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffrw5v4J7yvFKFiJO2e4jw+fR9aRSKdWTfCUygVk6jk=;
 b=UwbjT3bBclbcawU0yG4g8CN7yBoez6iEt8WQ81lFmGCNCQ1GA/EmoBEMETncAa6WGzB/rbbe5zrQBV+vFGPDLw/tvDIIaj2w8uvbZdAndMhMxCD5/pu3JvwrcrLZMjAPV8TWbqkFc4a/UBW1OZtkpoB1u2t811uOpghkejD4R2RjanYg7AaCIMHSXCnhXsjUEgcfEwHxHZagq5fHdpYcclh6DsR8zQwVvidhQxojdFHtxMaYmLHOwuo8LMYaInUGZtTIaDqE9uzYAqxpsC7rfgXfhteWyvMD262mRAkw+4+rch1DmrPAVHgkN+G7QgapJF2b94zMYieteJaTvM13kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46c33f3f-7911-25d9-4236-cbee661e9242@suse.com>
Date: Thu, 1 Jun 2023 12:35:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] x86: Add support for AMD's Automatic IBRS
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230530135854.1517-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff3acf7-f00c-42e0-33f1-08db628be4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JMIW0jzPimrfL65RvSVxALCxLBD6NRto7dTZffavtbXkZ7E2lncGvmbFLDsE4MdPHc6AEoM+tTrUlLe0OcLrIrK/401VHTauyoGNk1md30S87ix6no5ZXT910ruCt8WJhZ0uiYFW/is5PZ6z3xYuRaDK6BSLabj7XkBcwiQBKcpggGn5XHrx1Al+1ZqSb9HOETTbJumxnavXctLS/hrYt6QR9antKjft4OndvZZyej+ATw6P/a8Q/XVLrqh+NcSVSITrdZe6WlIwwbf6ZNH17HvqWprLZvpZTb5UzvJPKAF9GEt4fVbRid7n1qopchrJRX8FiRfSg3NPasOpDbxEsYjX3QSnHJUQsMgzQf43jUXs+wal1TKcFz/T2LujFACAxc1BX56EAMBblMHAoeofJNklusQs+j4f2VHAiezoStjuP9yJ0DcHSPM2/J8Tzxy1Ark9b+VIyB2NL9VrEQrY8INatzmg+shX0ho1OJAaVVLEsDATr0AnvxLdB6fcFNowa2e3wknz9UnXrpTLmkf7A7iFVW4AaY8jktJN43cTsWoM8pjf+R1u/590HeI65R2fDx6jVThRiv16iE/Lb0QRxfA5hJS3KXfKUVwkCp3o/KpTxL0LbILB/W2OEzXfz8t8FRqpBcLpbzgjawRLLLqA6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(8936002)(2616005)(83380400001)(186003)(6916009)(4326008)(2906002)(66946007)(66556008)(66476007)(478600001)(54906003)(316002)(6506007)(53546011)(6512007)(5660300002)(26005)(8676002)(41300700001)(6486002)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFFudkhsWm9ad1Ayd3UwZml5cmZ5Yk9ZbE1OOUMvQUdvUGJHaHdKME1yL0lD?=
 =?utf-8?B?SVpHWCtYalh0K0tidk8yZFFjRU5YenhhRU9RbnN6eDYyWk5qRTVWRmZWM1VK?=
 =?utf-8?B?WjFCUW9Wci9CTmErYjlkTlI3MnA5TlBTR3dUbFV5MENyUFE1WFR4UjdyYkF2?=
 =?utf-8?B?QWxKM1lTaUVxNCt2bXB3b3gxSHF6QmlKQUdoV0p2dWltaVRxOEhhUUc5MmtQ?=
 =?utf-8?B?by9nMDIvVG1VNWRscjduendRQlVRQlJ2dGpHQ1VuZ3A5Y24rY0NEbWJJQ3ZT?=
 =?utf-8?B?eDRtYU5RWW9rY3ZFUVMyL1I1RGoxU0FENVJVYXVvRW1LTVBkVTYrL09WeVBJ?=
 =?utf-8?B?MFZMaGtNbDVLUjBuZTErbFpLaldId3N2VDI5TittVFNWdUpId3ZSSjBaQlE4?=
 =?utf-8?B?Q2ZLdDlvbVZLanUrVXNZQnl0Mll3ZWhZdzR2ZlM4cU1SSWVqV2RZN0c4cVFa?=
 =?utf-8?B?TzByb3A3RlBJVU42OGNSbmllOEFwS2xjQmV5ekYwdUpZMVcrcmJqV254dThr?=
 =?utf-8?B?aFhzNXB5YUdETi9YVWRmaFFVTW9oamFrVkF6QVNpMTcwRXFnZ0ZDaU50UjlD?=
 =?utf-8?B?NSszaCtESmltckVzR1p5cDliMms2dXlRUjB3SW10bXVhM0dNMXFJU3BWK3lD?=
 =?utf-8?B?MzJUaHlqMWErM01HN1pOYUtTd2xyd09WWHJDZys2RGxPNEJucU1VcW1EZEUw?=
 =?utf-8?B?S2NMdmszU0ZtcGxSejErVzM0SWRkeGhwakVFMTZ5N1lHNld4bUkzLzBKRnRU?=
 =?utf-8?B?dWl2dEYzOVFKb0hmYnBTWmlNYlc5SWszdTRGaTRyd05yTlhqMnV4SFZwWCt2?=
 =?utf-8?B?U2dzZG5HRE5nUUc2ck5QSTcrSURhK1BqcU5xTWUwUTgrQTdGVGd2c3NxeG1o?=
 =?utf-8?B?QmNQN2Q5UXNLdWhQU1c1TTE4V0FYS3Bab2FZb2RVMmpjWmRoVHVFRkM4ZDVs?=
 =?utf-8?B?TWRxSzk5MGpWVHVDcEJVQnkrOXBJOXNZTGplb05EZlU4VVRUUVBjQlZmbU9L?=
 =?utf-8?B?UzhOenNUSURRUWdZVFRTZ2FqN3BEMlA1TEtGUWdIaExLaGd2MmNoYndtV1Zq?=
 =?utf-8?B?SkY0MXhUT0tHdFhSakFyalp2bloxQmVmRngyTkN4eGFtbHQzZUVBTTMyVDBi?=
 =?utf-8?B?VlZ0VU5KblFhR09IVW95eUdNK0dYVTliK254ZldWa0UrYmcva0pEV2Yzb1BZ?=
 =?utf-8?B?bFpUYXR6cFh5c0xRZFh2SWFJRTFhOERaOTdVcGo5ZDlvOEVpMjF4NVA5dk9J?=
 =?utf-8?B?Z2hTMnN5WVRRMy9uRGxVVmRralN0aGwrNHozbGJRTU1kU2ZwaDZGd2hIZXZT?=
 =?utf-8?B?OWNkS3pXZVFzNG1Sb2M2NFJXRG13L2pZbHBDcVFDeG4xT25yTDBPYnFGWU8y?=
 =?utf-8?B?MW5TNVR1dVFsbU9zVnRLV09ERVNvTlFHYkUxRVVoWkhObVE4b2JvSGU4blEr?=
 =?utf-8?B?b1FFZmtIbVVWVk14aGt3SjBkQWhBaXVFZnZBck41aXd6QngrNndmUDZwU1ZN?=
 =?utf-8?B?QWZ5OFlaRlg3R0lRUlp4VlNWaGFJQzhDdjJqbTU0OGlSb3MxbFdadnlDc1JL?=
 =?utf-8?B?NTZxLzJybG9KSElKc3RKM2czdE5XWlVIK2pXcU9QWE9UMHBXMjJLVXRyRTV3?=
 =?utf-8?B?UXlqN29Pb2RVdEh5K29JVXBxTXVtME5SVFBMdWdWS2ZTTDB6YUF0ckk3U1Ir?=
 =?utf-8?B?TUIvcDlITGtNZENCQW1lQnB4SFl2bVRtbjhVdWhtRUdhcDBqUFBua0xYQmR1?=
 =?utf-8?B?VzdLQjIwcmxHVU01WXhLaHB1Nk1KVDh6RUdMVWthM21QSUcrYkNZUHdmbHhV?=
 =?utf-8?B?UzNkV1NXdWlIbUpPWWpIaFo0RlFqTWdKNkhZejZRZlBJMnE3cTZSSllhM2Jq?=
 =?utf-8?B?N2x5RkdQbzNwSHk1YytGbFdFSG1YUkNKOFlRWEdmM3JhUXJ0ZVhQb0VOYXBU?=
 =?utf-8?B?ZE8ramhiZXl6VjBpL3pqbWtiOWthcEdxMWUzRXo4VWdPaFByWHFrYzlsbCt0?=
 =?utf-8?B?S0c4R1JydVlrQm0yUE1hbEhoRGF4cE03RzNjdkVYRlFwTm9oTWIvd3J0UmVK?=
 =?utf-8?B?UWV6amFnZU9yWXdhaEtKQlpkdXU2SWdpWEkvMkVaU01vdG1uL1ZjMGRvMXFo?=
 =?utf-8?Q?mS5rDQWZn613YdifIFlQMZXlP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff3acf7-f00c-42e0-33f1-08db628be4c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:35:18.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPXrJkQX7Je5wcQCdrGGqt+5LVh2uPlH5iY+WIODoFWNLG1cgH0YLb/2KG9uenGViBY8ECplO8HKUDnRZB3Hug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9819

On 30.05.2023 15:58, Alejandro Vallejo wrote:
> @@ -1150,15 +1155,20 @@ void __init init_speculation_mitigations(void)
>      }
>      else
>      {
> -        /*
> -         * Evaluate the safest Branch Target Injection mitigations to use.
> -         * First, begin with compiler-aided mitigations.
> -         */

This is the only place where BTI is spelled out, so ...

> -        if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) )
> +        /* Evaluate the safest BTI mitigations with lowest overhead */

... I'd like to ask that you replace the acronym here. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -1357,7 +1367,9 @@ void __init init_speculation_mitigations(void)
>       */
>      if ( opt_rsb_hvm )
>      {
> -        setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
> +        /* Automatic IBRS wipes the RSB for us on VMEXIT */
> +        if ( !(ibrs && cpu_has_auto_ibrs) )
> +            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);

I'll need to remember to adjust "x86: limit issuing of IBPB during context
switch" once this change has gone in, as there's a use of the bit for
other than alternatives patching.

Jan

