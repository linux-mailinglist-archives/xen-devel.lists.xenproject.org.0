Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676F48E4EC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 08:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257555.442662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8HDK-0007jS-GT; Fri, 14 Jan 2022 07:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257555.442662; Fri, 14 Jan 2022 07:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8HDK-0007ga-DE; Fri, 14 Jan 2022 07:41:34 +0000
Received: by outflank-mailman (input) for mailman id 257555;
 Fri, 14 Jan 2022 07:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n8HDI-0007gU-Gw
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 07:41:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63df8dee-750d-11ec-a563-1748fde96b53;
 Fri, 14 Jan 2022 08:41:31 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-CalUdacnO-WIX580dZf5vg-1; Fri, 14 Jan 2022 08:41:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 07:41:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Fri, 14 Jan 2022
 07:41:27 +0000
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
X-Inumbo-ID: 63df8dee-750d-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642146091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hs33qj7qQ+TYRtu7Zjl1jDgRrZgrWZI3JPy7qelbQIw=;
	b=fx4d073wA6OsUEIhjOTX7KSd9dksBsQxTkjYCU1q9vlxU5+/ydaTuj3y9oHOM1vTuNbvn5
	+fCT76RaPbUUaefUBrVsmW5vj0OIsKMff39bmG8cI3OiXMmFiGQAA7Rfg167q2qVqWeX/L
	Uvzjq89tV1sxwF4N92UuLMinhyexp7g=
X-MC-Unique: CalUdacnO-WIX580dZf5vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq/V3DxprBFUol8WG+9FEko+JfDw6pfCk2g/0fSbXfsJNKdCouRuQFA2WU97M3wwrBo5O31wvg8sI/Qgr9kXEPYP9J6AXhugd6N0L8oYf8xJMC1yxSQHw2QFe5NK1l2BzsI+C9YDx+NbkWy6fsSvr892VNvEJqEji6Y6CNnnnT1lRT/SjtdtminqBJhGMx5H+F7xecg25wijlDQJ0cjBCrkVDvngEiHDYgR9KBAygzy1gYHajhXaiAureX5Y3BcJuJXLmgAjp3528YKAKacfPveSu3qKI6D/gsemYB5trhRXFqpx4QYXWjJiC7VQC9+y3iCRopLLZiwkzk1TJv8a2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs33qj7qQ+TYRtu7Zjl1jDgRrZgrWZI3JPy7qelbQIw=;
 b=GyJD9XkEHpo0nbLzTNestPFaX6j5VFzwrxpfB4bjsooYbqun723QwHFFuA0yBcSlAs3phwMqEbMYyp80sz1VrGmffH+g0tm4LdAkvuOT9oZC7kKT/5nOmD9VeWRkvtXb0a30f0wmgoiHnofkp1jPVjSCqMAb5UP3UCubqpMe0QBqmGfq+3pKHpLmcg1R+Oj1XhyoHuKVDFUmA7gMJPqbZDTxtNdBeR5WWWjwAVVPajf3c3AOABtLpVV1qzLDS9hejD+xhFmKruaOxZbApirxjkf21L2ji24yYMWjLitsyX+FycPq5vQBILOO9el+7qlulPB+ly5EoIs3qQ4P2GP18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d099b992-74c3-4057-abe2-52c5cc7ca7e7@suse.com>
Date: Fri, 14 Jan 2022 08:41:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/hvm: Drop .is_singlestep_supported() callback
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113184800.29456-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220113184800.29456-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf2aab4e-fd4d-430f-42eb-08d9d73145ad
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190831BCE90A510FCED4104B3549@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YZbIppglyBuXbs77sSjpD6kKjwLorqveulFlOpnZYtC+RFSKJubh4Nyk2qxp54l/fpTz/ULtHHDH/ORbyPsUe0HVPgkGOBumLT7wmyQc4c58UHgnPAzotBeveWBLKh1T5hHwikf51mC70LlCsC0qWAEhEfqDrBYLweHdYcC6uw4zSsPpeL/oo8Pe6oygZMvII1amEqh5Ve+afXJ0qZ0Mf72CIbCaWqyOg+ygSdjEOHX7eZu9Ay1TlwD6xLxemdcpCqtwXEu7ViUuCMTxI0mCElf3zIGw9/MM2uYbZK3s+zXOdB392XuicP15EOxYIBD978eil2zQVK3/r3zDoGfsVcmqlKMM8qFv/Xwl1eJ3jflUMD/8mCcyQtJyyWhFscQT3LXbf3aCkxPJkFDqJ6clvSvqwSp+QywCE7GKiwKY3HFuSNxqFRH37hU1dFAhCLLuj2HCCe48FBReK6zgFQS0A8InCzdBWuYF5bJ35IJo4YLWNVsVr6c9DwVYfLKMdr06k7KBDzYtkY6aWfX78/k0NjgZtWDnTiRjcLEiziAmvPtlptVsaO+wWk/V3zWmFV19834ZOeojAWW+phu08SNluB3KqM619YmyWIPp/X/6oE3JYV/yodqTdwBh4WBBuQR/fr/mOW/ajwxCni3bDnZpnlTVGD4r80gG7BXkN1SAIb2r+YLp+CclVCShBA3khOy0mUjVcwL+Wwz/VtdIvfvLUzTowojZBHIWcDOeC1buElXDvi5y1MQPIJ2mrYxlvR54SRDaVnxzJYMcN08F+1I1Fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(8676002)(26005)(53546011)(6506007)(66946007)(6666004)(8936002)(86362001)(66556008)(6512007)(66476007)(36756003)(31696002)(5660300002)(38100700002)(4326008)(6486002)(316002)(4744005)(6916009)(31686004)(508600001)(186003)(2906002)(2616005)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejg0WXk1Yk15b0JsalozR0FOdlFZd0ZOcXNkQWF2SWJCMXVKV2JSbmxjeEU1?=
 =?utf-8?B?QzkwVGowaGhrd1ppdDVpYlhWM0Myd0dWMS81OGpYMDVWT2JXTGh0b2ZXRWN5?=
 =?utf-8?B?dW5rSGFKVElnV2p3Z05mOFlYYnU3YWluYTRnZ05MK0J1dVJBVTVtT1lRZGZN?=
 =?utf-8?B?RmRmUzdlYkxGcFl0WUdYbXQrOWVjTndYSFhLaXF4alJVLzBFTHU3VTNURGZh?=
 =?utf-8?B?dlpUTk12UVJ3RlBnK3N3ZUJZNkNLTkpZK3ExREt2QiswN3dEU0FMZGhCampW?=
 =?utf-8?B?aDFRUkx6Q05za0hMS294MDBBb2JGVXMrNFRhTWI2cVlrU2VuTUtHWlhpRGFI?=
 =?utf-8?B?cS9XRksyTm9uWWtzZHIrS3pYRXpTWXdrcHhlZ09UNGZRZ1VlSlpuZTRCUWdr?=
 =?utf-8?B?NmxFSWpzRy9waHRjUU1xY3ZIQlR2TDZmYmR5d3NibW56emdKazZna21SaW5E?=
 =?utf-8?B?TWxYenVCbHJnKzNXYWZqRDVXQitQSW81bzRxNzVQQnJVVzRJTUZVMkVpbUp2?=
 =?utf-8?B?SE1aTXcwclhrUmdDZTBkYVVPcjhKYTAxUzBXYm9lR05jRW5rcmxZeUpjd2lC?=
 =?utf-8?B?N2NoeG5abEN1a2QxWTB3YzJ4SHNLZGlKdDJjN1gvQ0pkUjVpQmZXeWZRTTBu?=
 =?utf-8?B?UElzenorUEk4NVpuc1RPTzBhbll6TmRWdnJYd1luQWk5WnZrNkY3TklaTTA3?=
 =?utf-8?B?c2FwbW9jK3BQaU9BSVdEbDUrY1VVR1d1VER2NnRlaWpzSURtOS9Rb0RHRHg3?=
 =?utf-8?B?NzBaVjU2ZDdNU2sya2xVamhPdTNyWHlWa1Bxck45MWJlVG8rbnF3SzNtSFNs?=
 =?utf-8?B?amU0QW9FSWVEekRHQ01uYkN5SkR2T05Vd3Npb2NnZUFCOXhjMU00ZUtVeUFa?=
 =?utf-8?B?bVg4STNlRjk1Z2JqNk10MTVkeUxlN01QWWhvR0JEenZRbG9MWThURXp0djU5?=
 =?utf-8?B?NWZXRkk0QnBNR2tzU1owT0RUQlV6MExFTVZDNFJSRDZZMVBLZE5SREVtMkcy?=
 =?utf-8?B?aTB3a3RWT2EvK1dEaHM2RktHZGZMbGNDaCthL3JXQjZvTlg4UHdTejJjWVJ5?=
 =?utf-8?B?MStpWklabWZiaEJmd3FYaVdXRTRnNGpldVdqVTh2NmdEQ1AyRnd1dStxYjJw?=
 =?utf-8?B?MTcrS2NCNjd5MUdiNnRxRzlFZnJJQkFjd3N3b1V5REtlT25yUXVRMURDcVdW?=
 =?utf-8?B?ZEl6VDVmMmtsWml4TTdDZ2xxRXM4eFNrZThrbENkczNtam51cDZnOTYwNkg5?=
 =?utf-8?B?MjMwdmxDUTR6WnFvNEpCeEFveUJYcGRpZEg4WDJsaHNnTmdGbVY2ODZ5Ym4w?=
 =?utf-8?B?RE5pa2lkTktyWTl4YTNwa1dIWkl0Qm91KytXaVZSZ0Z3USs2ZTNhTVR4OTZi?=
 =?utf-8?B?N3krTjhza080eE5vREFoQkpLYTkvUGVid0pZTmdZOXZUZTBCRm82eVZxN2dN?=
 =?utf-8?B?d0pNMithTzlGaTNpNjhoZDUwV0V5Q2N5RkZ0OVprTzdzSExwMGU4OHJrQXZm?=
 =?utf-8?B?aG4venZ1YnVScW41YVkyQWlsL0YvcXhjUDNWaEJpQXphbmtnZnMyUS93T0ww?=
 =?utf-8?B?eUh2UHpUeU1tcUIvaktXOXZ6MWt0bzAyVVdvbTYzKzhKUDl2NU9QK21UNXQv?=
 =?utf-8?B?cExwTFphVHRJTUN4MzNaUVdPUjlUTkh4dU5rdzJ5d1NEVHJEeGtobkYxeFNW?=
 =?utf-8?B?MkYvZ1N1SUdCeUNTU1YrRlZMMkEwY21aY0F3Y1ZabW9UT1docVdJYlFnejZz?=
 =?utf-8?B?a1RwQUZnL2xBOC90Y1ZydWtOeWVEMGp0V3NoWkhzWVViaTlpVmZmZWxDUjFR?=
 =?utf-8?B?NnNYZGNqbkp3Qmo2dFJtVkZ3U2ExZmJLYWtISHZJbnl5QzZ1NGtVN1U2RVVl?=
 =?utf-8?B?QW12UnU1NnpQTlJjdFVUYlJhdkFSK2h5Uno3VW1HdGhGazlVVEd1RzJPeHpP?=
 =?utf-8?B?aDJUeXNrbENjZ0RPN1JxNjZ3Vlc0Z1BURzRHeU9yaWdZM1plUDlGVjVaRVht?=
 =?utf-8?B?LzE2VENBU0Q2OWVDazM4SDNMWnNpMm4vWnM0WDZjbG9xbXR1REVWNUVHellO?=
 =?utf-8?B?NlhIdGcyR05YQTVMVGVReWVmVGpuclVtellTeEVrWlZkTEVseTJQNU1FZFNv?=
 =?utf-8?B?OGtIZ2liZzFKVFhkdEUwTURyaU1RU2ZOalhmRHpBczFHSzRXalpXZzcya0RR?=
 =?utf-8?Q?6A7JSFn29kfAKuVlCpvieeA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2aab4e-fd4d-430f-42eb-08d9d73145ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 07:41:27.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuJYvZEYga+9efflkd/jS9nEwvydLP06gKi/EReoqE0vfq/v/OQE3nP06RW0NK5HsGP6RHcyThvYftV/kf2xrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 13.01.2022 19:48, Andrew Cooper wrote:
> There is absolutely no need for a function pointer call here.
> 
> Drop the hook, introduce a singlestep_supported boolean, and configure it in
> start_vmx() like all other optional functionality.
> 
> No functional change, but rather more efficient logic.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


