Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A089253F778
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342974.568095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTsD-0001oY-1X; Tue, 07 Jun 2022 07:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342974.568095; Tue, 07 Jun 2022 07:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTsC-0001mn-Uh; Tue, 07 Jun 2022 07:43:32 +0000
Received: by outflank-mailman (input) for mailman id 342974;
 Tue, 07 Jun 2022 07:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyTsB-0001mh-1U
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:43:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85925ac3-e635-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 09:43:29 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-46-3RJYIxp5PACP9e7h-z-wPA-1; Tue, 07 Jun 2022 09:43:25 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5379.eurprd04.prod.outlook.com (2603:10a6:208:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:43:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:43:23 +0000
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
X-Inumbo-ID: 85925ac3-e635-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654587808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGHtsX/cKQU7nfUoHcg7u3J2RRyrOFGlV+M8PFZp9OU=;
	b=Qdf5djK0Ry3Bso4WRzj4IDJIAC4Uw7d4l1l4XZk24C8hPEIEnLnWakKFMcutv0Xo9jmgeM
	l/RX2EXqgwexEgYFVdr0WkeFDCb6AWkBhspNw0vnY+PQCz9HetRmBsYF+PZBMpf/XGGWVI
	sZC48I8SpLI9DIPtsZsfvUQxRuyWuPU=
X-MC-Unique: 3RJYIxp5PACP9e7h-z-wPA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+3mZgcvmyrVA3yzNmb+qdgWy8oB3t/1a7mAvbuD9/Quc+vG5rjzSsdXuGd5Uf8ciUGPlCKVaBR3zbS0nMik0lvodoIhJqajh2PvNgIKdHxgMFhWpsu/RKAXpytgbGN3lv/AXVig1gslxXjm8Yb/STPz7Od03LB4dEUmm4vm2n6agLMz/IkSdfHuTETf66xGpsxSJfTf22zM/AwyJq09eWba+XyKA2s7jh0QCWCALTvclKIdmhsw9YFtpVOuOVAc2QimtBKOoyyYNuJvjE3y1O9wBaTPVzS8hZPKalHraC7iSV0zVL+kPQ1FFrQOYszP0RpA/ERwSK9+Gq8fVAWXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmJNePRXgjIKvdu5abJi5FPixN7IoQ968WzPPUigfiI=;
 b=L5AHJBu3cP02z9Y+BXIliAtww2yDAvxRhEQVSRmeICXUCTjOqoMYmCZvQFl5AUVLDlxzUhgwcyhQ7hU967eTGj1lxg7b8q3nTxAx+wXZa00U56gBdsHUrkOkyJO1Ww1PurA+yqh1vwoz8uSv+FdjARhd2HRDKH3hSjt8/EHMwAUPvWvD28NlEMLb/Jt62LtjsRcNj7FqypdonJboIDNvaykncGICSFTUyYP2fg3s2P8ZnUoyhdwODSTjHa5wzTsYzXbJ1YXhGnwGER5688XmivRG+cL4uSR2n3I0NVXOm0Dd0UcAjGXY7sADxlrEZlqCpVoodlkEaR26bb2vgfalkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmJNePRXgjIKvdu5abJi5FPixN7IoQ968WzPPUigfiI=;
 b=BCYLEXmC0vQXIYu9dtb6Z0YHcWUiIoSdDCUZqPvZfv/uvykdkfi/+i+/y7xTXNYQZqxJT2cGqHMdXqbL8NeIAu3Df37Uk5kC+wPj/0ZfUh4PreAM5jazKcb28Yw/n6p4/jb9AXB1UaSjRZYZeBDIHkmlqEHVron3uEhkvb8Po92QFOBHjxqzFLryRoFHjNY6Lw8NTxfJdWMX+rENXZoZIlfKfSteDrN9xT1e29SJzlN5DccAzW/NUm6lV5EJMAZa2K06IVnQ5xKcK0xwtdfi9qi+An3IRISA10KnT1lnj1F/VaTzmZ/l9i98hZAd6oTombJ/gxwNHf7obgWo1UBMFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8f22652-abd5-76f8-75d3-ed581d1c4752@suse.com>
Date: Tue, 7 Jun 2022 09:43:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <6fa93f8c-9336-331a-75c1-7e815d96ff49@suse.com>
 <YpoeuOJPS0gobz5u@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpoeuOJPS0gobz5u@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223bc18a-df1a-4840-0bd6-08da48596667
X-MS-TrafficTypeDiagnostic: AM0PR04MB5379:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB537910BAFF71D5A3CD295C8DB3A59@AM0PR04MB5379.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4G4PxRHVNVjH9yhJZzqvNqE76pOP+0azJJ33d2RwXLuJWXJ3u9h4yEIFYxRQtCyaxSREjxcliCql7qPT6ymI9a/38qQE2M8UJXJb3UuQsvWSQpXvrPtKu7bSMf3I8DePdT6drHxn/nEiaGjfwn6cUohsas7FhOSimqQQeJLFXbu2YOSh0iDK+yHmPtsb7gsvbZKdiLahYCmIamg7aOgSffxzFsbGzmTEAPNvYQXEWlPsbG1EyR0cMIou4PaZabXrumztD2KZL7Khno2UoxYWCcyYyYfB7+fdkKBKMRZ5Iu8CDbBgR2rFNe3ySp4zfr2cOQm2OBhyXQSl5+JS5AgbBpepnJ5qY6TP+TxY6Svln+NAzBNeErJ2ehScyZWMcvt0glc/8pfO50qvb12kNjV5RVgPgqxJJfwhhWKXOIMO6kPgkWCL66P42413OqXdoyGOc5AQIl2DnBc3UK1hB0gH0FTEal3KBtXIk1XtfCekDhHy349QUxwyK7qP64ZkJTbn5fSVwe2/rNxzZxO1LgeisLdQRUCtJVF4EQGVXG6u5NdTyjDa/g62Z3+hAE+eP95rVmXjMtvNHqLwRykZQLgK+b6UmXGOZXCGxmgY9xUu0tiyKmxdZ/jSoGo3C+QFSAfbAHEH2eNJr/PRvJRq1nezKNdOVKG9+sqiJWY3Ezq3d+DkWs5GxWdYL/gI3A++VKYUuTkasCdQnhkLIrLKI5avTg5QZEp6drfGuAe+fCUhm2u0i2rhm8k483VXDTISAcX6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8936002)(26005)(38100700002)(4326008)(31686004)(8676002)(66946007)(66476007)(66556008)(5660300002)(6506007)(54906003)(6916009)(2616005)(83380400001)(53546011)(6486002)(186003)(498600001)(36756003)(2906002)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+zGKITPDeebhFzTM4fQalPnM0WwHthRBMEiiuKi/MWs+Qwa6THBkWO1PBwnI?=
 =?us-ascii?Q?/ABI55tXlQ08U3jUBBcCq4eLTMi0J0Nc90QaqUR7/qbHMxDytAenRm3ll89R?=
 =?us-ascii?Q?A1SPiiO//ot3MeXI9EMjk9PXm2Hmx86rGzKPY/RLyLIXr4GuGz1JnCwJ04GS?=
 =?us-ascii?Q?3yhEUMbEmgNjRXqTjdG8/baH4qREDBNrq8lt9635UFAyBbNrWoBtJLsgQX0h?=
 =?us-ascii?Q?buFmiYIOVI91ZhC2WzV1iUun/W/Pt0SSIE4F8+wQUNlCC4LLtkUoEa34V2x1?=
 =?us-ascii?Q?E07/LWnfUAUCD/m0QBnx24jNrA8DESbymMasQ/o6bT0GormlPRw7iYVFk3RZ?=
 =?us-ascii?Q?aiEazmJO/iRL5m0xXuDxcyUhTV+TpOPrjIJqTi1IRL0ua9j/knFRVJXwsup0?=
 =?us-ascii?Q?Mo/7Isme5DRGPmGGt9ZfC2MIoIZEofL7gppQCBRIcbvWmqQ9eIuraoK0QZLi?=
 =?us-ascii?Q?jWrcNmeY3dUfz6/U7JthVbpC9CzQGclEBWtpQeuLmQAPQK2GENlXRPhOtzpM?=
 =?us-ascii?Q?vRmaAvip1/5oPUgTxKP3OhkL1ulrnhgl001usrKCkR0ED1n10uEC5mubeo/9?=
 =?us-ascii?Q?T9U0U5dUFTS2nkqeOKHBB9taHw4qjytVOwiVXhZ/tLlnTZNtRxru50ULl5If?=
 =?us-ascii?Q?hZqsaPOA+m9Zu3ZVUlasgPVQY2ASBhtD34uSw6B5iLXYwcCpcMWVHLHrWWwA?=
 =?us-ascii?Q?nzzQ+sLLRjYo1YBiBuNBFQF6D71Afq19gjYt+bqTLc8GhvQfqgaRX/hMvmt6?=
 =?us-ascii?Q?ogfCeHUwaMGChMSHC7glc6+BYIelwFoSpm8fKBmQlWjjI+gtWFZyr1XEZQS9?=
 =?us-ascii?Q?lAEv9AzfLczlmEHzmFGWVA2PMg0Xvkucu1P4QKDgn7qe0yuRByKIxbCyewcx?=
 =?us-ascii?Q?IL3D3H0D6y4DApKZcd8V9qn+2m5vOIUJaXYOpLsUem9elGNxvEIrm5ccfMKi?=
 =?us-ascii?Q?3t7d32BLcS/GiHGBC6Dzbow4u+z6DYvZ6a8CsaAFoSnRj4eo47atBaFWIyuU?=
 =?us-ascii?Q?hL9XCotMIIfnA9eroekM3K4IIb3sEC1pE1Jjdvi+K0ejueFgOQgFc4MTvRf3?=
 =?us-ascii?Q?0uNzy+Zk5T2GavbnK3ApI7ofmWeQOEdqK4v9C0V18Wd0LY4dnErWBd1xF/JE?=
 =?us-ascii?Q?rkgQL0MuFGNQ9Phsf6VI+B9vetX5HFBVzoG8FhVZOG42uPXn9C6w+YFTlY6b?=
 =?us-ascii?Q?woGuWRICiLadrLokv0s7ebkxycMOZGqUMepXksx2rATBnvPR+D7Tvb1A4t1T?=
 =?us-ascii?Q?w9MLGwdveH7jFiw5nqQwInqhntdvXz9S9P9mIErkwPdKJS8bOy2IQOSQy7mY?=
 =?us-ascii?Q?B7I101Xduhfe+VYKMJirrhG1FiEzVWgSMT/5tZN7O9j41h/QdOGg5FbLNZNu?=
 =?us-ascii?Q?LA7VLB6w/7SFSbanZb1k58Gf29PzwEMIxvNNTUw6CG1h/moK3ntiiPA/F/Py?=
 =?us-ascii?Q?f/mh8ybH5LBp7GvDiqhqiemG/5+dep7Hc9bkmGaK8boiQHICMMCz+KaEVTUk?=
 =?us-ascii?Q?++cZNHlIuT1gl9xxCjwH3djYm88Sgt8IE6R8aMMfxNsohbKoPFLNUN+uc0uo?=
 =?us-ascii?Q?VXQana9/fqTjpShmYiW2lkcSDIfTRcVPGkuCgMXUn3jH99lGIdQBV06nwrdn?=
 =?us-ascii?Q?7SZ64OHkJnTUHNX5sz/5iDTKNS/V7vz+NJBcWC/g3kWNOPA7K4ltAIm1kNnG?=
 =?us-ascii?Q?b0wmNrTwr2rUchpPu6glKY9Gq54c40fUxH6r2/0/DErQ/oKDCL01eBzEf/f1?=
 =?us-ascii?Q?T/kmeGFJpw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223bc18a-df1a-4840-0bd6-08da48596667
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:43:23.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5l5QTwgW/epuQrdb0YZcKv0bS01JcccNDZhA2oNnugxgj6Xi1gcQdsQbTfRyPW3gafONkxQbFI40ybsdcSZ12w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5379

On 03.06.2022 16:46, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 03, 2022 at 02:49:54PM +0200, Jan Beulich wrote:
>> On 26.05.2022 13:11, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -1419,10 +1419,19 @@ static void cf_check vmx_update_host_cr3(struct=
 vcpu *v)
>>> =20
>>>  void vmx_update_debug_state(struct vcpu *v)
>>>  {
>>> +    unsigned int mask =3D 1u << TRAP_int3;
>>> +
>>> +    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
>>
>> I'm puzzled by the lack of symmetry between this and ...
>>
>>> +        /*
>>> +         * Only allow toggling TRAP_debug if notify VM exit is enabled=
, as
>>> +         * unconditionally setting TRAP_debug is part of the XSA-156 f=
ix.
>>> +         */
>>> +        mask |=3D 1u << TRAP_debug;
>>> +
>>>      if ( v->arch.hvm.debug_state_latch )
>>> -        v->arch.hvm.vmx.exception_bitmap |=3D 1U << TRAP_int3;
>>> +        v->arch.hvm.vmx.exception_bitmap |=3D mask;
>>>      else
>>> -        v->arch.hvm.vmx.exception_bitmap &=3D ~(1U << TRAP_int3);
>>> +        v->arch.hvm.vmx.exception_bitmap &=3D ~mask;
>>> =20
>>>      vmx_vmcs_enter(v);
>>>      vmx_update_exception_bitmap(v);
>>> @@ -4155,6 +4164,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *reg=
s)
>>>          switch ( vector )
>>>          {
>>>          case TRAP_debug:
>>> +            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_ex=
iting )
>>> +                goto exit_and_crash;
>>
>> ... this condition. Shouldn't one be the inverse of the other (and
>> then it's the one down here which wants adjusting)?
>=20
> The condition in vmx_update_debug_state() sets the mask so that
> TRAP_debug will only be added or removed from the bitmap if
> !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting (note that
> otherwise TRAP_debug is unconditionally set if
> !cpu_has_vmx_notify_vm_exiting).
>=20
> Hence it's impossible to get a VMExit TRAP_debug with
> cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting because
> TRAP_debug will never be set by vmx_update_debug_state() in that
> case.

Hmm, yes, I've been misguided by you not altering the existing setting
of v->arch.hvm.vmx.exception_bitmap in construct_vmcs(). Instead you
add an entirely new block of code near the bottom of the function. Is
there any chance you could move up that adjustment, perhaps along the
lines of

    v->arch.hvm.vmx.exception_bitmap =3D HVM_TRAP_MASK
              | (paging_mode_hap(d) ? 0 : (1U << TRAP_page_fault))
              | (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
    if ( cpu_has_vmx_notify_vm_exiting )
    {
        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
        /*
         * Disable #AC and #DB interception: by using VM Notify Xen is
         * guaranteed to get a VM exit even if the guest manages to lock th=
e
         * CPU.
         */
        v->arch.hvm.vmx.exception_bitmap &=3D ~((1U << TRAP_debug) |
                                              (1U << TRAP_alignment_check))=
;
    }
    vmx_update_exception_bitmap(v);

Jan


