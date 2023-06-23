Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913473B1CD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554279.865388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbOR-00086n-4Y; Fri, 23 Jun 2023 07:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554279.865388; Fri, 23 Jun 2023 07:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbOR-00084E-1i; Fri, 23 Jun 2023 07:39:43 +0000
Received: by outflank-mailman (input) for mailman id 554279;
 Fri, 23 Jun 2023 07:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbOP-000848-DD
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:39:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bcf66a0-1199-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 09:39:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:39:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:39:37 +0000
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
X-Inumbo-ID: 1bcf66a0-1199-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8ht4qmRMBkdEVxpPg2ZOlSZrGPnkgZmcHtfwm6GNxcL7GToDt5hH+iNSPRTD1HFa7biJMxOs3OzP/W/VwNXLlTnuLu6AoEhtMs3H/3nPQZG8PMXV1628/Icj3L1dKARrilrbXCZ2/bQVfN47/wPJlDhe94MgE7LRl0lMXUJJ5soZ5NWVtv9voQFEpCWqOUbUHAq2T+T4UrdCfZ0l+j5nbLi/yHDEJpCK7NTF9q7cyqggJBZ4w2pS2IkKAP9RXVjM9WgGP9uep505H3YRsyNbPhPB9rbNffMCsvaUIsVGVkeJCvPcK19Wnzp52YeU8mDWlnj0XVlQ5MpC7r5ZxLrvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qhl3HFWr+gEHZXyBcIOFJ0ylgt9glriovY4XH+zjdt0=;
 b=Xs8tPR8a+UitaCDr7Hj54BeQrYZHFmrJF+F2ffsSxTwpfv37FiLNzjKBgPI2n89UpeJNz30xJM3EIFsyv13MclJORxFReaBKq9jR3tUAz9MFJiDTWHhMsn6pMKOD6oPBxEYnefEnTt61VmcR8/jYUY9H85e0Qc+tZb1GTKmmAFOew3t07pmhjI0ZjqnbVJgPy8zaDCbdsgaX+daAis39yuB0ywKZ5W71knLMJkFay2k3WTgSEHy/SV7mslmTW4MAEcrpvkeRpqtQ9Ez4misnogudn1rzxuCKw9ZxSlc5cqch3nFsQHuLxHqsRFq1ofwtgGSodqJxtVoHuXLG+4X6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qhl3HFWr+gEHZXyBcIOFJ0ylgt9glriovY4XH+zjdt0=;
 b=Tx8LYvqW0OrH+ZAnKebk3ks9x4QHtg/DASYycvY/wVWn+sF3T12uA7aA8Ig6sSiE1//l0XIt9nL+B7Q1gPRYo3bZ8lOEKY4OI5b4EXyvkgtvic07AKHODKyJTQN6/thbVEUoKbFXgC6fV48YnPZxIkxB+jayfhy4Kv8NtSg2J3G4Xq0ISr9HAqXhM9MlwXR26sQeM4qgH7XzxAbdzKJpAclOcZqit/BIALbJ+daGmKvgI7fwk4xK1xD7ujsG6+j5kCY4aRXQtso+pw68ObecVQj4AeWvVRU7cfXWuX6XgwfO/u3HZx3ix4kSV7SphIYwp3BWh6nlywT3nBJDOyRQFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24c54a17-b85a-bab5-4adb-f9dd589ad221@suse.com>
Date: Fri, 23 Jun 2023 09:39:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/4] x86/microcode: Disable microcode update handler if
 DIS_MCU_UPDATE is set
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
 <20230622174219.8871-5-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622174219.8871-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: c2646b99-e49a-474b-4b7f-08db73bcfef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NCG6d6BipmhRoixY9ss7wVQMwoQkGYd3rhXNb6W1H8gJTfVhypTPiIrnNIIad3/RI12syEOf3MkShqZcdDdBREexYpu8r1T1q0U0aym/COQfwfNyN+NtSPYeO/UarPi7obsLv2daLpB398ITFkiHVIGN9TE96F+hLJ+0MT+Q39Qj0pigpDE/5N+PW9ds4ZhTv95Kc8ASF30NVAIVEeuKELm0XHfDaHzsuwPCcfpsoIN1sBBtsXc/HShwlFmhXVoOIH2us7UuCdS0dJ0tvl0DMXLz1uMKpas564y/XIZ5tG5mOHoqKzB1XOSJbDMequNWLb3guiWdbYaZ37hp5n0nM1JMFObgzRLMp0wDRFLq+WgODnFFxTilQ3erGLUA5Oz4thUXCN7felkJ7scyxZ8cy5Vfpd3IuBvnp2526+zrzIrNXtbJTKG2cRq2pDwWrIF+kmvP1hTkVieTC8BHG5b07AVuP/WWJtukVeMQFOSndvEQejXqcslQnSo59SpvX4i3UYcf5QoSMC5enP7/g6gjKDSAkLs8Yj3waEaxyyanTZ5Z+wZSUTPxiCc8lNwlzZdUPQUd5owdZG6HONLJyGCxq2z8BbZki6WhjZJFiJJas4fn+4kA+ozdSP53Mbj5ltlbdglN8lMzf58lMUWoHiD7kQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(478600001)(4326008)(54906003)(53546011)(6506007)(186003)(26005)(66946007)(6512007)(15650500001)(2906002)(6486002)(8676002)(8936002)(41300700001)(6916009)(316002)(66556008)(66476007)(5660300002)(38100700002)(31696002)(36756003)(2616005)(83380400001)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c04zWmdvSFp1ZW05c3UvNURpcjNKbVVCQVg2dWtkUkRhRlBZZkY3M3M0b1Ra?=
 =?utf-8?B?L1dycmZmVW5ERlluRWNFeFVsMVFXMEZGREZUL1BpNTJRSWIra002SnNwSy9p?=
 =?utf-8?B?NU91ek9KMU9JM0ZzSm0zOGZqUjc5U0JIdlBTWmg2Q3dWbkFTeVBpZHplNnVi?=
 =?utf-8?B?c2tnU3liYmdJeTI3SnpZTjlEdXBqVGkxSHErczR5WTlXYWF5YlR1OFkwMmpG?=
 =?utf-8?B?WTloVGo1blhmMkVaNWw1RzYzTy9xdGJ4R1FkTnRxR0dsSHNzTSt6RG04MFlO?=
 =?utf-8?B?K3VVdFlrcjNST2dBTUlxdG1GOFZ6SkdmTmtQaEp0cGF4bm1zWUs3a2UxMkVo?=
 =?utf-8?B?RVlQYWlLMThnOWhVVVF5eHo5RU80QnJxRUpBSTVhY3pxSUIrakNJTnZqVU1B?=
 =?utf-8?B?TDFiZG1yRmdWMVNYQ3RmVkF0VFU1Y1A0NC9xTWF4NjdpZzNpTWxzYncrekU2?=
 =?utf-8?B?ZGVkbHhIdXdPVi9pM2QxMWhKeUJEMEg0QnQvY3lmc1hHekJwOEMrQzRSaFVZ?=
 =?utf-8?B?ZXZDTDhQRmM3TlhZOGw4U3RIV0dkTE5kMTJjbTFIYVA3WnBwM1FaT0lWL2d4?=
 =?utf-8?B?SFViVXgzSEV1aUs0M0l3SlF1NmcxNi82ek4vVDc4K29EN1orRXJ3cmhIa0d2?=
 =?utf-8?B?aS9VelQ1R1VOT3Q1RGlSdzRtemRpZ2JwdTNhTkxpRTN2clJmQ3Z1QzNuU0NQ?=
 =?utf-8?B?ejVnTjFxemJYL3Q1eU50UW4wa2ZEVDMwVG9jVU1ORFJ1T2VoZVFoaldpWFN3?=
 =?utf-8?B?S3FWUC82RG93R0dUZlNyODNWMUlBdDVkY0svQU9HMXNFdmlhYTJ0eEJnVTVw?=
 =?utf-8?B?QW1ycTk1MGhIOGR6S3d1QmhyaWJ2SHMzeFM1dHFyVTN3Vm42ck02R2Y4QUI0?=
 =?utf-8?B?WW5WZGxGWVR1OWhHZlVHRHlVWTJxdFB4MFpRREl4bTBXVXlha2Z3WDZaalo4?=
 =?utf-8?B?eUNXME5qZUJkTllQSUJEV0tPQkIrWkpYaGlxbldNTEY4Q3ROSjJ1cXRibmYy?=
 =?utf-8?B?MS9ydVZCbGZQN2YrbEd5S1pFUGRsU1FSUXVLY1JncGo4MmFOaFNLSDNYVXNM?=
 =?utf-8?B?T0EydzBvYW9IRVR1Z2R5b3FRRGVwYUFocHdHNXJITmJVNkhQeWNJdFJDRXRa?=
 =?utf-8?B?Qjd3WFNTa1IrVWFmTEF6ditNd3hneVFXTVNlRzBTTXJ6dE05Q2piU1g4WVNH?=
 =?utf-8?B?QjZQalNwUThxaHI1aEt0bXA1eTgwYUlFVm9QRG1aSlFsYU8wa0RVZmFOWmxv?=
 =?utf-8?B?NjBPTVljM1V6cW9zbFowMmw0eHc5UkVCTllBNW9VWVFLZ3VGRVlhYlp5K2ZG?=
 =?utf-8?B?LzFCRTBmRTZaVUtSQkNVUk8wOUhKdlhrbEdmNWJmZTRvNzVORmw2Q3l0MUVX?=
 =?utf-8?B?bVRhTVpqK1RKQ3diOVl4d0dhM2U2SVJWV21uYllma0ZOcUQ1MmNWbXBhTlRl?=
 =?utf-8?B?dGQ2NlpNNTZmaDNhdFhWam9hNTlnMzRHa3RBTmtDRkZqSi9lL1lqejNyS3I2?=
 =?utf-8?B?RHVqMFJIeXdBaXpoaXNwcVBsOGF4amJlSSt1RzZha2FkdWtwVmZFQmxqV0pN?=
 =?utf-8?B?RW1wL2dCN3o2M0lrNkQ3RVNpTGxycGk4ZnNNcEJRZExGaGhNWm5TQ0d4S2xM?=
 =?utf-8?B?dUw4aVEwUnZFSmhmeXZyNEFCc3lvRHY3UWNmdS9PWDVFRUphU3E0Y1F2SXRy?=
 =?utf-8?B?SkJ6WG83QVc1YkNORTZ1RWZuSlhKVDcvcER4M051ME5HYXJMZS9hZ0dOTU9R?=
 =?utf-8?B?Z0pOWFpLQnpHYzhKdTZ2ZnFhTHN0UWR3MDBBam9BYlRSVTdURVE3d3Flbmky?=
 =?utf-8?B?WkcxcVNKSTdWQllSdG4wVjEvUlZ2aVlDR0puTUhMVlhCeGVtcUFWNmRha3hC?=
 =?utf-8?B?aWpGeng0TXlnaks4MUR6NG4rdE5nWHB5aVZoQVo2MEgvUUhuSjJrUjcyUU1h?=
 =?utf-8?B?TE5VeGFrL3drS2xYM2lGMWxsVk8zdHIvbk1Nb0F5R3pzSkpWMENYcXV4TmhC?=
 =?utf-8?B?a0lIMlQ5Z25PanBiTzEyZ05aQitUOTR5WEp2OWdlaCt6Q09rQ3NncjJCc0Ri?=
 =?utf-8?B?Y0FPWmduMGk4RytpQ0RzT1JHcGpobkNwM2hGVGZ4K0ZKZWQ4aVA2RlB5R3k4?=
 =?utf-8?Q?72Cy7gmAlg3BAWUvJs/LFBKfh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2646b99-e49a-474b-4b7f-08db73bcfef2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:39:37.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTnA70GenQDMKa98/snXV0SYuusQ6GhBgOG6kuGDbw0BRFTd5NxR25U+v7QYu10DCay4DscT0ysSnYLyBLnMxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8465

On 22.06.2023 19:42, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -385,6 +385,19 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>      return patch;
>  }
>  
> +bool __init intel_can_load_microcode(void)
> +{
> +    uint64_t mcu_ctrl;
> +
> +    if ( !cpu_has_mcu_ctrl )
> +        return true;
> +
> +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> +
> +    /* If DIS_MCU_LOAD is set applying microcode updates won't work */
> +    return  !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);

And we have to honor this, i.e. we shouldn't make an attempt
at clearing the bit?

Also nit: One too many blank after "return".

> --- a/xen/arch/x86/cpu/microcode/private.h
> +++ b/xen/arch/x86/cpu/microcode/private.h
> @@ -60,6 +60,13 @@ struct microcode_ops {
>          const struct microcode_patch *new, const struct microcode_patch *old);
>  };
>  
> +/**
> + * Checks whether we can perform microcode updates on this Intel system
> + *
> + * @return True iff the microcode update facilities are enabled
> + */
> +bool __init intel_can_load_microcode(void);

No __init please on declarations; they only matter on definitions.

Jan

