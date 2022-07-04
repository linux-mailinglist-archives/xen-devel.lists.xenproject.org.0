Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC245650C1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360058.589434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IMp-0000ZN-Q1; Mon, 04 Jul 2022 09:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360058.589434; Mon, 04 Jul 2022 09:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IMp-0000Wt-NO; Mon, 04 Jul 2022 09:27:43 +0000
Received: by outflank-mailman (input) for mailman id 360058;
 Mon, 04 Jul 2022 09:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8IMo-0000L3-1S
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 09:27:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d399a8e-fb7b-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 11:27:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8768.eurprd04.prod.outlook.com (2603:10a6:102:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 09:27:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 09:27:39 +0000
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
X-Inumbo-ID: 8d399a8e-fb7b-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNndCGeNFx5kF5PUiPnPw/z818UOQOc0yXeF0AyLBn49uaLylPLAUd96mra9jcsE/5P+7ciWVah/HYDfS6iq1jzla4TvbS7bHkldx34zIZ02AVRW5I2rSCZjIMP4IRTJJifZJFdePbiUGfexhxFLuX82+leohnUhXsvXbmkbhQac9fD0yTU68NrZGNWXt0AVZ0QUQUsbj5MBWe8Iwkp+p5m6VTeFr/vGT48L1tjzJ2FURgeD0qbLyFu8xyku6AsbPtWnYf9kdnkm7jHWhbD4vlTYd+sjslMFVJQp33mlHl9INbjtcNnS5zfagJyMVlN5ATL38aM2Q+n4qAxYuvzupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq+DUjNhHvZkSs3tU1NX+6HqejUfqZzVsyviXHcgIeo=;
 b=X+LQXenpeSgqc3Euhz91hJ7owRDHQZlj9XVDRA8qrAm+LLZxOZwOmmP6FlXbM/y5jKtJPP/rGnCG6F13zlYqApYWC2cZjOKf+OthYyl1qors+Zots4kDmzcXY4GB5abzf2f66kygYZdSghmuXNR01i2L8AnDUdOiLn7SAwnGLGj4e2tCnmhLJdyS7FA8LdfJk3QbpJAk5k6VcE4FSDREotJgZYCw11m7XsrgoqcPmLJN+5lpO7zW1abpGqvglO4DC1WJ1upwVFoBHbLl705gvWPHm4YGSUWlRCyMp+wkpZ5ZmOPYetmQAnpbixw0YX2nM/ACW2R+L86CrO5YHBHuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq+DUjNhHvZkSs3tU1NX+6HqejUfqZzVsyviXHcgIeo=;
 b=m/LMlTSytt/UlFvYXqWc/7qgPhLEAdLbqIgT95ftv5OIqRpZROcRdo3/m2rCHHu/9qTZP1AcSitqxcM6jJx9+z2ayIuHGtPZ9fUASdlyU8wRKvljQOlkbujr6b9J9dDWQxFBqYut2/VrrwN3Gy6moSzbkkLDKmG2CMFBuoIEml8yKRt9qpSVdV6y5yJ5HG+lks2dVURKc3ZAgEI9/mj2hmDKztvKFB98CUc9TxzgsnPLBHm4bXvByv9DxACqQCy7C8zK426VpV9UVEEAYewBXFl2onfCyg/m04/uvjxiUhwZi+2LLDHPfBjmK1ub6erUV6Uosgaj0WKiKQSiYKrDAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <325bbf52-3b56-4062-88b5-a04dc21404bc@suse.com>
Date: Mon, 4 Jul 2022 11:27:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220701131648.34292-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ee17069-d25d-4443-57bc-08da5d9f701e
X-MS-TrafficTypeDiagnostic: PAXPR04MB8768:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uu43rw2rM9gbtg2lNfkmH/nf+gX7nvptSE6LSB2z6n4WtQfnIQJDaoRu6aMFrBkZOD/RHkMddJIGCB8iiVFrInLPUdhyAXY+wd+bOVIfnh5c/DLwkXTCaCPxTXP/ZaKsP2uSpRF0r3X6xDePgi5KE2mjgTva/iCcQM6On+4jGxGGa8UVDjI89l3bNIFDoSNEyCvmYKC8HIItgiA9TmsgqkGjbYX7odaUpE7XbE/Hz7tIsRLm/H2hA4UFKpvqpFdbx8uB58+FOyenO+dNw8BrljHIz+fCeqoTbVOYQhank7tDCuEsTS3+XKcrcAuRYTtsJtDDV/vyvYz32g0/Pz7hef9vyv/D+yv45fzDub68yg5bGBuoZAzLKaKo57nnFddsrm3ai94BO+ZE3D6TPU30qqty3waIve7Bdkfoh89Ty2g24j9P/udyWDu8i2TBt5Ez2GqNMXNQOeyDo3kOOFwZlUFFd3/RTPVpbdRIPRmPDdDKbKpoAY+VneNCN1P2+l5vVk4i/jt3NmP2qTbMivbdu8GHV6ZDgAbRlyvB0ulcOagzjr1o4aGl2PrO194OAJ4+PMeBhnpFDbSkIktbVyrXtldSSpGslZtoLDbabTfCs1o0keMcFp616DtejzV8pUZrbnu+f3N9ZxTop0vswFt5EMOCJDVeuPbS5rUew4R54HsTB6F19IBvqDaQPnZ5YjWIhS79OqSEkTmdzfJb/JZvG35OqboZImSVDxNDxDpXCHE+v1mwK9gptJEd6WBb+dO03L78pYT/F/N/HMhEH7cKicofn9SiR8t/x+Bcl9qPP9ehvIEsgMSXgL9yws3aS6NYYcJUx43BzSORPP/5tboGEVM/DFb5c1z7+0AdSroLEtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(396003)(136003)(366004)(316002)(8676002)(4326008)(66946007)(6916009)(66476007)(478600001)(6506007)(54906003)(66556008)(41300700001)(6486002)(8936002)(31686004)(2906002)(4744005)(5660300002)(38100700002)(36756003)(31696002)(86362001)(2616005)(186003)(53546011)(83380400001)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmR6U1Nnc1owU0lMbnVZQldoSGRDRDVSa0I2NFcwbWNNVGlnNmJ6aGVTbFBQ?=
 =?utf-8?B?OGMxR05GcDVmaHFkOXR6MzlqcDZjQ01OSkI4NzBLNTVHa1B3emJtM1IwdWxx?=
 =?utf-8?B?VU41T3RTMXpLWW5ZZXV2UzBqQU5VWXpVdjZtTGtJZVB2MDUzbmNiRzROQ1RX?=
 =?utf-8?B?NkhiY05VTHhJaFRUNmhLZ0FIdXNZN0F2QWphb09DV0g3cE1HVWFiYmRKYTJy?=
 =?utf-8?B?d1FGLzUvNzRheERtc0xOYXJ5czNHL2xtUHJVVXcxTW9XS3l3Mkt0SVZIcndi?=
 =?utf-8?B?TjVDK3hFS2ozS2hoYUkwUEFBd0k5ZjliTnhvR240ZFhxWDBDSVpZTHJ5NUdq?=
 =?utf-8?B?R2tHMDN3SmdkeHFtU2RQUTF3N05XcEFPZ3NPL3Q1WFJZVU4rbGpLYkpuc3Bz?=
 =?utf-8?B?amJNVVEyN1FYTmtSR2svaUZMRXBQOWFHR3VKYmZyRFhJWnlCODdzTDI0VXVt?=
 =?utf-8?B?ZXQ4dDFrS1RFbVBMY05VdXNicXZtSlpFb1FJNjVRSWp5NDdPZmoySzkxaW5m?=
 =?utf-8?B?cHd5RU5DNms0YUVGZjZHVFUxNkdiVUVHRzhkbGVDbm9BZFJHNm10bER1b1c4?=
 =?utf-8?B?YnJjbG45K1U0L2drY3RhYVBYTTd3RFhlYVFxN0tsWTFZYitJMDViWVpTNHR3?=
 =?utf-8?B?RHZlcThvakNRemliL1lTallaQnRIT2RJNkZpa1ZuVXBUa0gwUjVxaWU5NlhH?=
 =?utf-8?B?TGxsYnZBc2lTc0F2S01oeUIvWTBUemZNOGNVSXBZUWVWS3ZKeW5BRXI5eEFx?=
 =?utf-8?B?WnpGcjV1cTJnN1FiNUJCTWgyY2daVzV6RjVrR0tMd3lyR2VBc3d3OHFwSW4r?=
 =?utf-8?B?OWg1MnFmTXRuSk5sOXpmNnFqQ2FXb2EzVmhOcDdCWm9xYkx0UGM0YlBlbUhS?=
 =?utf-8?B?b1RjN09vWkhRUnFVWjJITnZkTW9oNkRHbWdiNVBOWitOL0tNWFZyU1p1Q0sv?=
 =?utf-8?B?bDQxenZaYnlabk5kbmtERFFmWktNYUpVbDJJc1hhYmhEb1dMYzQvalZ1OWJl?=
 =?utf-8?B?RGdMSEpGakk2Ykl2NHBrSEt4ZjJnSi9ndVczN25vLzRxZWJRc2VwQU5TbHhL?=
 =?utf-8?B?ZjZLdkpYRG1HNk8wSXNIajFJdVIvRU9HalJxZHFBOEVja3NWa2pmR0Z6WHZ6?=
 =?utf-8?B?SnI2dS9uODJ5VXA3Z0dDRCsvMmpzcXQ0K0xBeFk5ODE4RVdXM1BsL2ZLeDdZ?=
 =?utf-8?B?NDNLZjB0bjM5ZmdMcnZlMGNqUFc2djZVMDJSTTVHaWxVRFlYYkhQY3diWGRh?=
 =?utf-8?B?a2ZVamVxdnUzeWovTXNjTmpzWWg3ZHZlQU5hWFZ2VWhHR1Bpc3VGKzd0R1ow?=
 =?utf-8?B?Nm9naWNYQURCYXQwb2NTTGc0dGpIQkdwejVtNmZBNUVOUDBNZlZidkNHTmlC?=
 =?utf-8?B?MlVBWVFHWk1mRjFqdDhlRWNKMTQvNkZsdTVlcnZPckVzRFdmbE9XQ3UrYkM3?=
 =?utf-8?B?MGlWVitkcGpta2pKUGcraEJSU1R4cDJqTjRTZllySzB5clVJRk9BK0hzVGhU?=
 =?utf-8?B?czFuek1WU1ZzOG9pbFFzcUpRa3ZjNjNvZXhaK3dXSUFsVFJmR2hHbXMwMVRV?=
 =?utf-8?B?bzlqek44aHdtNzFjSjYyRjBJZHZUVDUyUTFtMlpFOXZJWHhvMFo2bHE0cUpY?=
 =?utf-8?B?VHlPWWpMWjFmeStoNHB4U3Eza0NjOEViWHlZbkV4L3Z0RFRSRFNKcTZZcXlk?=
 =?utf-8?B?NVVZd2IxbEQ2QTQweUt3U1Q1ajUxb2VWUi9jdUVvY3pCSStIeHRVMERoaHF5?=
 =?utf-8?B?a1NaNzkyaGRpcGtzeVJQbWcxNWhtV1RjS2MwdlVUaGdlb3JTNEJoL1diajlH?=
 =?utf-8?B?NjNYQ2hOZTZyU01xZ2pldHVxZGlvKzFsZ0VoMkpmMUZ0d0ZYRGdzRDltM29h?=
 =?utf-8?B?RWlLbFpYUmpET0Z6TEtaT1VSeWN0bFFGVE0zZmRxNjFqMzN1TzVyS2FBZ3Nt?=
 =?utf-8?B?UVZEVGRsYlBPYTNsME5RSE5meGVIaWhjTGUzbkZhNGtpNE5TTnNPcnFSMHAr?=
 =?utf-8?B?dlYxRkZSNmYyR2xIS2lnM24zZU1QVFZHcXI5dnljOEJkWE1aTjBybEVxRGhH?=
 =?utf-8?B?TnF3S2dyRXNweGxWSGZkY0FVV2I3VlF6eHBieTkrM1RONzVxczRyVG1Kb2lI?=
 =?utf-8?Q?JQOSqSNlZN9w/ovWluMxukx88?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee17069-d25d-4443-57bc-08da5d9f701e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 09:27:38.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXtS9zdj5EuHMQDwhn39FbezJ5TaX8vyBnlNpKvr/qqXkExaFz/WgBmNNxX/cEAJmDsE1OHHl/jhUWryiBdXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8768

On 01.07.2022 15:16, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4065,6 +4065,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>  
>      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
>          return vmx_failed_vmentry(exit_reason, regs);
> +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
> +    {
> +        perfc_incr(buslock);
> +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
> +    }

To cover for the flag bit, don't you also need to mask it off in
nvmx_idtv_handling()? Or (didn't go into detail with checking whether
there aren't any counter indications) pass the exit reason there from
vmx_vmexit_handler(), instead of re-reading it from the VMCS?

Jan

