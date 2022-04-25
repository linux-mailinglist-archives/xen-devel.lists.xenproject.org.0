Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E524850DE70
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312770.530134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwWO-0008U2-62; Mon, 25 Apr 2022 11:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312770.530134; Mon, 25 Apr 2022 11:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwWO-0008RR-2G; Mon, 25 Apr 2022 11:04:48 +0000
Received: by outflank-mailman (input) for mailman id 312770;
 Mon, 25 Apr 2022 11:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niwWM-0008RH-OI
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:04:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83f78bfa-c487-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 13:04:45 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-asRGIZ0pMSGpyw3vOiQZyQ-1; Mon, 25 Apr 2022 13:04:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4034.eurprd04.prod.outlook.com (2603:10a6:208:63::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 11:04:39 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:04:39 +0000
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
X-Inumbo-ID: 83f78bfa-c487-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650884685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8LqPUEqPTc5d5HzZHn/6C/8BcpKRavIT4XXO9jbtj4=;
	b=lWBdtO23DkYiqpg0uQgQ0N4PaA3CfdvHHQK9A65jLyTl0UEQbzt89edFKMsR1TOVAxTmmj
	eZmt0luG+yI6M2tbYV5hSgLVn+lnQ82mF37kZC2oUl3lWd49Ty2DbhpSmlddGTSUfUtlJ4
	tDrC0tt7RDbkk0r2FFmZqDgZLuqetmM=
X-MC-Unique: asRGIZ0pMSGpyw3vOiQZyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZMP1F0C9KG46MI1Ol5lIrNA/sRRdRhHWVgmI78pUYcNeu8zfBg89OCH833vhRs+cMMn68UdanuvMajycZLD8vvGz5SRdHA9kWuX5Xq8A/AA36TNn97PpR5aSqvSrTWQsA3tPr8awetZHr70oUwC4JeDirgiHqKCktvD6uvS+OrAfOZeGgKMHUr9+sW4cUQRNSHzCtrdpvhChkm7SC3I6k9Ya7d8nFPxGVo2If6QLI4oTzXGWoS+Ve27H/scCHMa4GZpFZaOia/h6rTMhev9qbAMPugDkQg9jGwWym62WAzdjKllHxPIvsrMnM2Ibkf+4cJFBt7LM3T3Fy+Rvbbe4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8LqPUEqPTc5d5HzZHn/6C/8BcpKRavIT4XXO9jbtj4=;
 b=EDMr+bLHOG0bu1eTFH3ELTMj6N6Mm12B2yr6xvNFw1RlSyHjNQ3cqyb5VLMh/cIYthA9SWuWS7M/x0Cy74+x/7ec65ittqQVClxylVBtoVbhd4EZzdouRO34l+A41jTxUifEGWYHYDllHG6ll/eOUDLa6Z8jxgXbiJCIC1ioli/EP32NWw/kfQLfamu+a5JGHbOoXZGhgXp+3IbVLbxz7BDhFFUQd+t3SW013O2duHiVyHKoEWMlACkJLUekwXogU/mknZJI0vUmQ/BD1O3rVXB2Ei7+J2lij6mvczL+tmsTXuZI2oBfqn5CpCvYwHTsz53P0R/Z2cLcRvLcKYR8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <169f4023-db5f-45ab-b310-2bacb7683ac7@suse.com>
Date: Mon, 25 Apr 2022 13:04:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220425100642.14383-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425100642.14383-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0077.eurprd06.prod.outlook.com
 (2603:10a6:206::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f339e71b-76f1-4e42-30f7-08da26ab646c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4034:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB40344A4598149F53BE1CA82EB3F89@AM0PR04MB4034.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SaDgXrQC+KSLliRmGFokW6ZrPubTETByNCL8KgpNhIJN2jW5EZESe0v23DunJnMsYCs5YzwOPAbVEDhvER3l2JTP80giWhLpTqVhAW45Nb73uTd/dYqyka2SDNPQYzVNkGrKH2l0+Fw0uH1NuQxBJwYRxe/CGIxO/AXynoo6151Xv3FH/mOhJ4jagwW3+YcNU+7FGRXecYIgoQEQ+YBgDBDralD8CahNVg8amMR9A5GGYdrLeWH0r8Xb8/Vrrd+Rth1zz92tqgHsHIdWXJi/2zQUTPcDbl4VKl0h/vsXPWJ4w5Mq153HaQa+mbDktxzW0PhkpK98d6mzrrO4h6JkFjCZqmX5wycsWm1X2p9VU758+EaN/i73YriJjfufDCCBaQzdaReaV0zaOHEfl5qW4Rm81tXST8cjycanbiTp4VDkUoegK8WYiQ57tJzCGzBgl05peYoLMylpg/5ChKJWBbJhRwArv81x1PQGI10P8e7am7e9JjDsLPxPWBzGP58ds5W7uZs+Olq9p9Rd7ocDdAvIsSBsIauHzwB69dfgfsafvo8KHcd7PJ1C/rlU9tffqhr1AYNunNSjU5f21RUREbpugbLXonKBDDelW+hBJDIjJTTCWFLHeLl6kYX+gxVdqR8bZNSJl2cTb11jaYqa7jjkDdeKapoS0Y5f29B6wEyjR9ND47T+2y1eEA+3V842RugyKhxiwhz5EkszxENBRDOfHcZib2KmROmnSruKw6g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(83380400001)(6666004)(6506007)(6512007)(31686004)(26005)(2616005)(31696002)(186003)(8936002)(66476007)(4326008)(66556008)(8676002)(2906002)(5660300002)(53546011)(38100700002)(36756003)(66946007)(6486002)(508600001)(6916009)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0VxYlpVN05pVVJ0Z1VoRWI0MEJiMjNiaUk0RURZeEV2V05OSllua0tLRGk0?=
 =?utf-8?B?cE5hZ3VJN05iNzl1aXRlYmhndWtqcjlROGZtTTU3S2s3WFpNMkxwamhvdUtQ?=
 =?utf-8?B?cXVSSW5EUHFDRERZZW1kNFhaWjVIZ2JKclkreGIzTVRUa0hBb3h1dTN2TmFl?=
 =?utf-8?B?ZlpRQlRpajN3bVZhUXpBRCt3MFowWVIxR01vYU43UnFQQmZBVmIwUzFFM3J4?=
 =?utf-8?B?TXliZWR3aElaa1Nab0J2eDBBM2F6aHJSc1QvUUc2aytNYmFBUm5TNkFFVyts?=
 =?utf-8?B?cjU4cjUyMVBIVWVXMmJuVWRlRjdUcUI0b2hmS3lxQUtVK3Y0U0VBL09YWnVw?=
 =?utf-8?B?OUJEOTVaS3lFbEkwY3U2K3dqV0h4RzhOT0ptMXJkbjgxaURNcFduQnl5bEUz?=
 =?utf-8?B?MFJGZkFJSlpFQ2JFbDlnSmZvV1B0eHJqeGVJbmp6VzlieERYa2o5RkdhRWR5?=
 =?utf-8?B?SFBhd3NSUFp4SjdZN3ZIcWJsaHc0MTVxbTBPVzI4bFJyZ0pBT3pxcms0bTA1?=
 =?utf-8?B?Z1VhdnVuVkh1bTVKbjAvL2IrZEZWdE9LYTI4STl0WE5wZnZ2M0xLbnpCMUw2?=
 =?utf-8?B?ZDlkNEh0WmVNc2FWSlNLdTNNUFVFN1h0TUMvNnNXa0NaVUFjdlQ1SDdBS25G?=
 =?utf-8?B?QWN1eEJNUjVrbHVJL1NWV0FYZmRBRW1vMHBSNUMzSmU4eEFIM3hjcGpDVDly?=
 =?utf-8?B?UlBxaFAwL0M4MVVueUhNMVNyM2h5UFl6YW4wbVI4Z29XbGd1aWZlbU5kSHNn?=
 =?utf-8?B?WUx2Yll2dmNGYWMyWk10WnZMYVdXOE1pWTlRVkZULzdXUTdrQnBPSGtVL2FY?=
 =?utf-8?B?MGdkU2RPVXlNd2NQZDkrZENWOXFBVGNIR2VBa2ttM3N0aVdXOGUwcy9oTCtU?=
 =?utf-8?B?SXRWWnhPc1BWQnYvdHVkdUwrZ3d6MGwvWE9ERjVOV3hUSFpsUEJrVkhKVzZm?=
 =?utf-8?B?cmlZbFNHekJwSlNUQjJKOGNQeDVoQi8wQVY1SUJscVZxSkZwMXpmSjBmMTFC?=
 =?utf-8?B?cDVKVTlKSGtxQlFWLzVKZ3p6S3B6QUExdk9Zb0M0NVQ2VlRSRzRVNWtQSE1J?=
 =?utf-8?B?SUd6MHlBOC9Ibzh0ZmhEbHd3em9BM0Jwam5PWWxqVitVd2x5TGxZZlNIYVdD?=
 =?utf-8?B?MnJWbGh4TW1ld0NrUy9zV0xDUHRhbUJqR2pVcHNmbWs3SjhGc0gxZHY1T2ts?=
 =?utf-8?B?S2tXTndyQkZkQU1NSXlzMjdpeVNwN0RZWUR4TVpNVllnRys5N2ZnK045aTUv?=
 =?utf-8?B?STBNQ3ZubWMwUmxmQ0ZZSFVQY2crdFZjY2tjVjJxOWRDZzZWMmhORWJ1VTZm?=
 =?utf-8?B?TkhVVjhhUmNMUU9RUjRxRUdUc3RUN1liWCt1OE5vOEo2b1o4cEd6b3J2RGZm?=
 =?utf-8?B?cFBoT3pTQUVoVGI0L0dsa3ozR29naTVsNmdjTkQxVEtCczc0QUlqS3l2MDMz?=
 =?utf-8?B?akdCcEhjZlQrSDRBcm9ZSTEwSFdFS2ZzUlNzV0NtNlkvTWhxazZ0eHdGMFJY?=
 =?utf-8?B?d3lWWjNWMWNzOGxwdEYxVE9zQUFCK2VVY1dnNk43RlJYa3Z6ZDg2YUtZWjd0?=
 =?utf-8?B?N3FNOEJDQ0ZOQjJiMmhwY3hkTlY3azk4a0ZLOTMwajB0b1cyR2VsQlZienFh?=
 =?utf-8?B?eTh6UFRGV1RHOGpLY2ZjZGhmaFBCU0NzRTVxV25GWUtKcWFxZVpBZ21pNjl4?=
 =?utf-8?B?VWE0SmhKd2lIMHB2UFU1SXB2eU1NVTA5RTVibXN4bW5PdXJkb3B5VkJoRGhO?=
 =?utf-8?B?RHkzT25hcm5KdmF6UDd4bUxyTENsMStzQTVucWluNFplZXl1TGhTcVRXSDI5?=
 =?utf-8?B?RGpsL1ZqNytUOEVDWjRzRTVtODQ0U0xHTlhNOHc2ZWk4Q1lrYXN4WXZseTZR?=
 =?utf-8?B?Q0lkbVFOZDB2WU9JTlJ5WitKOFREUmxBUFhDbzlWTXIrVnJuUTl4NFNlZWR3?=
 =?utf-8?B?MWpUTEFFajlqcTdLZUp3Q3o3Lzl0Z25iNzFBaFdQc3Jld210U3U2SHllNHl3?=
 =?utf-8?B?YWFGZmFnSmVqU0RVUzNObW9lMDg2NzUyQXNteEx1VXM3bTN4SWdxQ0hvK0Yr?=
 =?utf-8?B?ZXJjS1JxU25HMlF2SDBRNjRWMnB3b3NVNTZKOTlUZjB6YksyTWZyR0E2ZTFv?=
 =?utf-8?B?QWF4S1hmc05MU2FENGlWZzhFZVNwb2c5VHZNYzBhb09jd2hlOFRDMExOZXJP?=
 =?utf-8?B?Nkhad004dmo1VERxbnYyaE1ieHI2QXI5NnR3TGt2eTM2b3llS3NSZlYrQVNk?=
 =?utf-8?B?bXhCcVVZcTJveFpHM2VRbExUK3RQenlKaWFkUW9IY1lLQkhqUW5TTjZvZVQ1?=
 =?utf-8?B?dDQzZkFOQ1FNM3NCclkvUXA5d2V2SnhKV29VS2Rscm1jS1BJeDZhZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f339e71b-76f1-4e42-30f7-08da26ab646c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:04:39.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsPmB9rFG3uAZTOsW/xxIPneFZzizN0Bax4Ye3fXM0wNfg7vocOnXlcU8KijcZWulLhTJI0iE2R/KFlCrJq8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4034

On 25.04.2022 12:06, Andrew Cooper wrote:
> @@ -178,6 +179,71 @@ void domain_pause_for_debugger(void)
>          send_global_virq(VIRQ_DEBUGGER);
>  }
>  
> +long gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)

Is there anything that requires "long" (and not just "int") here and ...

> +{
> +    struct vcpu *v;
> +    long ret = 0;

... here?

> +    switch ( domctl->cmd )
> +    {
> +    case XEN_DOMCTL_gdbsx_guestmemio:
> +        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
> +        if ( !ret )
> +            *copyback = true;
> +        break;
> +
> +    case XEN_DOMCTL_gdbsx_pausevcpu:
> +        ret = -EBUSY;
> +        if ( !d->controller_pause_count )
> +            break;
> +        ret = -EINVAL;
> +        if ( (v = domain_vcpu(d, domctl->u.gdbsx_pauseunp_vcpu.vcpu)) == NULL )
> +            break;
> +        ret = vcpu_pause_by_systemcontroller(v);
> +        break;
> +
> +    case XEN_DOMCTL_gdbsx_unpausevcpu:
> +        ret = -EBUSY;
> +        if ( !d->controller_pause_count )
> +            break;
> +        ret = -EINVAL;
> +        if ( (v = domain_vcpu(d, domctl->u.gdbsx_pauseunp_vcpu.vcpu)) == NULL )
> +            break;
> +        ret = vcpu_unpause_by_systemcontroller(v);
> +        if ( ret == -EINVAL )
> +            printk(XENLOG_G_WARNING
> +                   "WARN: %pd attempting to unpause %pv which is not paused\n",
> +                   current->domain, v);
> +        break;
> +
> +    case XEN_DOMCTL_gdbsx_domstatus:
> +        domctl->u.gdbsx_domstatus.vcpu_id = -1;
> +        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count > 0;
> +        if ( domctl->u.gdbsx_domstatus.paused )
> +        {
> +            for_each_vcpu ( d, v )
> +            {
> +                if ( v->arch.gdbsx_vcpu_event )
> +                {
> +                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
> +                    domctl->u.gdbsx_domstatus.vcpu_ev =
> +                        v->arch.gdbsx_vcpu_event;
> +                    v->arch.gdbsx_vcpu_event = 0;
> +                    break;
> +                }
> +            }
> +        }
> +        *copyback = true;
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        ret = -ENOSYS;
> +    }

Just as a remark: It's never really clear to me whether we actually want
to permit omitting "break" in cases like this one. It always feels
slightly risky towards someone subsequently adding another case label
below here without adding the suddenly necessary "break". While for
sentinel code like this doing so may be okay, it would seem to me that
we might be better off not allowing omission of "break" anywhere.

> --- a/xen/arch/x86/include/asm/gdbsx.h
> +++ b/xen/arch/x86/include/asm/gdbsx.h
> @@ -2,18 +2,27 @@
>  #ifndef __X86_GDBX_H__
>  #define __X86_GDBX_H__
>  
> -#ifdef CONFIG_GDBSX
> +#include <xen/stdbool.h>
>  
>  struct domain;
> -struct xen_domctl_gdbsx_memio;
> +struct xen_domctl;
>  
> -int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop);
> +#ifdef CONFIG_GDBSX
>  
>  void domain_pause_for_debugger(void);
>  
> +long gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback);
> +
>  #else
>  
> +#include <xen/errno.h>
> +
>  static inline void domain_pause_for_debugger(void) {}
>  
> +long gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)

static inline?

Jan


