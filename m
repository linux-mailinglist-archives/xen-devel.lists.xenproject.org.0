Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D5571239
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 08:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365488.595664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9Ml-0001bW-LJ; Tue, 12 Jul 2022 06:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365488.595664; Tue, 12 Jul 2022 06:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9Ml-0001Z4-IP; Tue, 12 Jul 2022 06:27:27 +0000
Received: by outflank-mailman (input) for mailman id 365488;
 Tue, 12 Jul 2022 06:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oB9Mk-0001Yy-9b
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 06:27:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20081.outbound.protection.outlook.com [40.107.2.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b15d4cc2-01ab-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 08:27:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB2998.eurprd04.prod.outlook.com (2603:10a6:6:4::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.25; Tue, 12 Jul 2022 06:27:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 06:27:22 +0000
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
X-Inumbo-ID: b15d4cc2-01ab-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC1D6UDHyGPHANCMl8UiXTwjHP+OvdlaKXhq52fJVWACfzGzUEEnZfLakBaoXMoA5JZs/+HFDBQjsZTAC0pNOqT0VV98ueKADfD9l1vvVd2We0IXbVWyy4A+b6xHg3rVabL8NKeapQIuqWpTchUrOHo7YWo5sdb43KuSxqO6I389qyqjImEWOO2w5SUUPQb1y4VNYaqpGqY7TRzte1QpmXX/BpVAQ5GbcgX7XB5cU4SoWCXI8d0GZXdf73V561TwNmSEQACCBuOgkz5RIAIsCHeIjkkAtExuteQdv+B4X/kigN7J69fAWvsKb3RNwHEWLe/4fBhlp9VHmICmlEDYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTM6Yuci/8dO9XMPQ/YUVd5RdN14qjz3f39xN0tMDxM=;
 b=A2rf6rp2Oc2BkmrlDmy1YHb8mznM/jKLkzD+lAjm6cw+nkGkhIt+2eSO+QZxQuMrpKnOsDfKzn63yfdzVh0fH0niWdYFK884QnS+LrJflbMxtIyDE6aRv3MGXSdfanrQvrrdWYqc6Jvhe5yy3h8ik1gM4ruU6aV3AYDaFyZEXdoDE9TqpdiV7u/rsO5oKbu7Mw+nSk872o0Y8OuPVX3oKqV5LVaZWjrnxGkDIF8G6OuvmnqZ/zIof/FIEaF3IUVxQe1e+/mDeccmTN/XTRRxI4BUlI1h5z4YdDJVJsBesfnKrdyxtlQlktZsanLG4BuAt8LPkjho6yC/SifotPRnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTM6Yuci/8dO9XMPQ/YUVd5RdN14qjz3f39xN0tMDxM=;
 b=vMVFTagueTK0EBkVL/oIZWRrwB7sEnJPTFOdaMPmIvP8hQ/XvH2N3rI7iixp4ruVk6m/HL19wcOPzRd2yloN2u/V9Hs6mJO97SGa0PD/IknzD+EhCbQIPPlnyGV+35UwRVxlgYAg/TnyBsRUW/vTe1cF2zSJ+RnCtH7856SEsRZqhhfQ16DxToC/BlA1rvkaFmtzuriHQedroM+a8NrG4gB4HcayHujLwHmpHYDc6iYlX+r9VOQREX3Z8hHmP4YGtFp/BJEL54Qbbt7DS2xImSOMiYhosErEYR9fn7Paty2xyZR104VykN9GtX0rXKNgJR/N1qe6fFW3SNzyFsGm0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46b6f5fb-92d6-336d-fe92-ba28a4ef5add@suse.com>
Date: Tue, 12 Jul 2022 08:27:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <5090ce79650583050b2245ee02d8987e65667c23.1657580511.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5090ce79650583050b2245ee02d8987e65667c23.1657580511.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc9652d-c7a6-43e8-5bbe-08da63cf9406
X-MS-TrafficTypeDiagnostic: DB6PR04MB2998:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L8v7l5dDJHsvIxyxAZ+tiX/ZtOjGxgX9rJuO6Fk8zBtsAVMHJacNzHs6+9BfhLbeO8k9daVTrgl2WlylXQw+DGUQlHUgiqllJeSN/7YtuGa+HBeR1xJ2wOhn18XsaWhSK1smCa/l36nJvU/GJ/3wCYpK3scuLjy2SrKdKH8Hz12M6iyiTT5qik2jDqV96fluErlG/Jc+ej52+18h17xAJn9KDnkB93jc4X6cFJ5323W26Tudm1ehfyFY7CThPRFmR0s8Mpm7P55Tz/nyte2b+nvVeHjZ9hrkL4IE+VriMOTZuTapPoC5zKYDSpea3zBW1KVIAm/Q3LGT8fRXT2ybc1dcK6PEG3vfgOQxy1gLcgEFwF2PFlnQHXbNkAVL4b+in9GOzJ57/0WqlhKZWNGadedSjTkBamJYb2Ptlx0q5B4+WCL8JWQXqNmrkDh48WDZ/ajLb2qo1Q6N0njwwKBOKCpqE6MLfcKsHs66CWe/Z1w1PKED1pW11Wz4psm8FWhEKA0ig2HUEz/5/XprLLpuwxPoqgpvXiYnGPRNxGDAUYSFmDtBOt0d89SbkE1srKckuvT0uckWnqErqChgDpRH/pJ33YSBLYL/LxJmkeH6mpXhmO2f8uWWkfMy/0n5nQzTvf8mPsWvB1UsN2XUBiHqqi7xLc+kAafBOcwfUHKWSSd/s0WoIYNgyZYN5tdFyZXA8ECoy9nD+1UPeIxR2vTS6XLkuyOQUD+inUto1upB3Pgf6Opb7NjzcUImkRaRa0tgxeK+YnrE+PFRePJWceD55ntaK42W7P1zXaeOfynxNFHeg4L1B35vQJh2+EzQPmIr/jy3r46mGfuhE6kVGs8ft6C/fTMeP+x66HcPKzUOoxFRUduliG1fxY0isuCWMQNR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(346002)(136003)(66476007)(4326008)(53546011)(66946007)(8676002)(6512007)(86362001)(478600001)(5660300002)(26005)(8936002)(31696002)(66556008)(41300700001)(2616005)(54906003)(316002)(6916009)(38100700002)(966005)(2906002)(31686004)(83380400001)(6506007)(186003)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1E4WS9VTEE4OEJDWFUxd3N4d0E1elhVQjJtenpLV2NCdDY0c1pUNGpqMk1N?=
 =?utf-8?B?RkNQUWlDZHoxSW1nczhWRTUxVHpUL2tVdHM3TjhlNDV3b05KRkxvQXNjQXoz?=
 =?utf-8?B?MDg2ZlNoZHVHdGNzWXpqN2FFTTJwQjg1UGJ6YWNkRkhuTU5FTXVRUjkwVk5V?=
 =?utf-8?B?WEExbGpQSG9hRkx2Ukg2Z0tZeGkwem5ueHVidGdTOXBlTEZ6ai9GanY3NGtL?=
 =?utf-8?B?TllSUHVIcytmUXdqbmlUWkkyS3V1RHVuQmVOOFhiVnUzczZodnl4R0swV3NI?=
 =?utf-8?B?U2ZsbGxUUXlpTCtHV25nRHRNYmlZc0h5Qi9iQWxZYVVzNlBYVE10MmNsa2RS?=
 =?utf-8?B?dUVqZFFndFlWQy9lOStaRW50bmhBNEJxUzhUT1hDM2x6NjVWamtuSmVyRlEw?=
 =?utf-8?B?YXltbkJLR3dacDBOYm94REJHYUFnT3k2ci9zeDU1Zmc3RXVpVThWMGNhNWtm?=
 =?utf-8?B?bGNMVldLQm5rR3YzQUpFa1cyZW5LWlFYSUdrbnVoT3FxWG9ZSHRta1YrZkJu?=
 =?utf-8?B?RjJ6anZ1dTQzZVVyTXkwNzg0OWlCWUZ6ZnkyeUlNTWdhUVpzdnV1QXd2RnVO?=
 =?utf-8?B?T3lLQlltN0dZNmFDckdvdGNLZC81cnE5N2NWMzMzY0RCZTFzNm05QkNxd0Nh?=
 =?utf-8?B?Njh3c0V0enI4SS9KN3FlNFc5R0xheG4vdlk0OEdXUlZTNHQxdmU3Y1ZIeFRH?=
 =?utf-8?B?ZUJYS2dtNy9OaHUyVDUrTmhiL0xNZjkxL0dnTjBwZXBxZitPdHhBY2F4eS9W?=
 =?utf-8?B?TlN0WVN6eFhPcVlhL3hSZ21jQlR1aEhCKy9QMkNoUkkzdTNISTZIZEJFVzR2?=
 =?utf-8?B?RjJKL1FyWWVQcWhpa0pObGlreHBSUkNhS05vRlZLUlV0L3BNUjlLcksyc0hM?=
 =?utf-8?B?eFY5RWM1VUZoeFdOaHZqb1pLKzF4UVh5NzliNG1FUzhYaGp0SUR2L1Ewd2lM?=
 =?utf-8?B?cWZocHAxQXBhOCtlSmxTWk05RmJIUkNoSGV1c3V2UGFjOTRncy9VTHdsY1pE?=
 =?utf-8?B?b3VFR3l3dHVKNSt1R3hLL1N4MUFwMzAwZ0kwcTl2RHZzYW1zZXM0S2ZrYXha?=
 =?utf-8?B?SndPZUh5bm9obkd2YUplT1E1bmJTL3JOUG1Demd1dTFPajVTTk52cXNlMXZC?=
 =?utf-8?B?ekVWK0xIRU5Lcy9hbld2VktldFdkRmx5KzZnM1U5RExiTjZFU1FuVTk4TlFU?=
 =?utf-8?B?WG5WdVRPSURaRllSbnFZeHpjeFY0QXpoV2dtTWNPNk1rc3JVbG51TzVycGJJ?=
 =?utf-8?B?ZlphUklEVDJ1SU10dURiUWdYbGgvcTRyUG1nNTJ1YjBSSVI2M0htOFVtTnhI?=
 =?utf-8?B?bUdEM3gyNG9vcHFpbkxDZElOalV3YmFoMEVoS3JnM2l3N1R3THhHbEJpOVl0?=
 =?utf-8?B?dUF4YmxsS1VpQmpaWTVpUEY0NExMbVd1V0IxNDdSY2ROSWd0WmVuVEprZEhl?=
 =?utf-8?B?cVdwWE5MNEJqUTkxNUl3UVFZaVp5ZFNxcHZid0prMDQ2c2xtUHJxb0UwTmxn?=
 =?utf-8?B?VGlEem85QU5SczdqWnBEbEk4UkhhampUbWcwc3J4TktyUEJZQzh0SFY1cTNI?=
 =?utf-8?B?OEdwTC9ac2hCSmNCeVdzRjgrQlRjWGIrMXFKTnFWZzN6eFFic3BPbmlOQllL?=
 =?utf-8?B?V3NzWXRRbGRtdktNUzd6d0FoeVdzMWxSTXJYOVBOcExZbGlmS0l4RmZJcUs1?=
 =?utf-8?B?VU1oQUFLcFBmNFUza3NIektWbE16QmJpMDNBWU5RVXcwOEJmT0lVQ3AwK0tx?=
 =?utf-8?B?eUpGcEFiam4zNmJQTkdyVWdEaVhnOFZZL0tJc1dHZm5hWmFnNlJHSThseEQ4?=
 =?utf-8?B?VGVrc0UzdndOOG1LVm94NSs3RzFnblU2RjlDNzMrRXg4eW8ybXpzSTJZamFH?=
 =?utf-8?B?NXpidk9ObjZsVVJnb3UxVk1ibEExOEJSQVdIOWlma0I1UnR3VTZnOWtNRW9T?=
 =?utf-8?B?T2Jqd1ErbGU5Tm1zRnU4VnBmeC9Rd1JCc1VWZlFzcUFOajZLbzhndWp5VHEr?=
 =?utf-8?B?OGprd3pIWnljZlhWMmFxcytlOW56WEVLNDBOVUUxdnBpZ3ZDTERKZE12T2Vx?=
 =?utf-8?B?cVVXVWZuVDZVb3FQSElYOUNLcTNkOTZzQUttRU9XdjQ4TUR1cXhYVmg2Wi9P?=
 =?utf-8?Q?yEsODoIMJH0fXF9saFebRTxGt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc9652d-c7a6-43e8-5bbe-08da63cf9406
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 06:27:22.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ciqk720FzWtiIzP8CEki46Z4m8DOlI/0G9d72OTNJhSGmvzs4SGdatoXHog8b3fdvE5V3CxK+ErB9KcTB0Cvcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2998

On 12.07.2022 01:14, Demi Marie Obenour wrote:
> The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> firmware updates to install.  According to the UEFI specification §23.4,
> the ESRT shall be stored in memory of type EfiBootServicesData.  However,
> memory of type EfiBootServicesData is considered general-purpose memory
> by Xen, so the ESRT needs to be moved somewhere where Xen will not
> overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
> which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
> in memory of type EfiRuntimeServicesData.
> 
> Earlier versions of this patch reserved the memory in which the ESRT was
> located.  This created awkward alignment problems, and required either
> splitting the E820 table or wasting memory.  It also would have required
> a new platform op for dom0 to use to indicate if the ESRT is reserved.
> By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
> does not need to be modified, and dom0 can just check the type of the
> memory region containing the ESRT.  The copy is only done if the ESRT is
> not already in EfiRuntimeServicesData memory, avoiding memory leaks on
> repeated kexec.
> 
> See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> for details.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


