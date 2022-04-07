Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B304F7591
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300372.512296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLD0-0006Tm-UG; Thu, 07 Apr 2022 06:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300372.512296; Thu, 07 Apr 2022 06:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLD0-0006Qd-Q9; Thu, 07 Apr 2022 06:01:30 +0000
Received: by outflank-mailman (input) for mailman id 300372;
 Thu, 07 Apr 2022 06:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncLCz-0006QX-Cd
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:01:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29d39f87-b638-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 08:01:28 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-dryFybIHMtu0TrLTvtiKGQ-1; Thu, 07 Apr 2022 08:01:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5292.eurprd04.prod.outlook.com (2603:10a6:10:1f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 06:01:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 06:01:22 +0000
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
X-Inumbo-ID: 29d39f87-b638-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649311287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrYNGUzlWUG8eVswJNjylNqEWaClHkCSLOhcEYeBcIU=;
	b=j3CV3Yx3jZdAwKl8bsVC/F6MiZz0EP2sUErLjc83yrSVTd7CL1CITz7XeB0ZHDp0ZhLgyu
	HWwc/O1zI6Atx49rWiSIINZhhxeIBRd00sDBUx1RqE4eFwWCrHVURAi/5w01Arz/hvCWhC
	jGdKfIBauFE4MvdWsQmt/jOAnSCqmg4=
X-MC-Unique: dryFybIHMtu0TrLTvtiKGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op2b7HuAR8oCUDMJvyQyu/WcLbh2rfeRGR8wpIvce/GLHLCi2BxpYLLfMExlwcqRLQTEDHPahlZyeo7NvQJmI2hYibcVV96edhsJTNslwt/AuiXgJvfgjQKJCaYlHGTN2JA+VmmLW8rjgA1NVYniyBcL3u/UiWDZY4UqqhwfEfe430iV/RwT6J755JjQ9xPp+4fUwvgCZ4H3C0CYPug2/pwapBwR3qRkZjZaYvgiNK1p9HLMnH61jEe5uEfVrx1fZ8Hgjej6fc34hdEoTcb6i8tqMF8gQ8q+uIm45hx+SWU0OybpurTJi5uyb+6ozzLTXpMn16fCIppGsTtDpjx4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrYNGUzlWUG8eVswJNjylNqEWaClHkCSLOhcEYeBcIU=;
 b=FbQl50AGcN64SeVT+jqBBaIbrlIANNSEHGNpd2vrmpygFJQhNTz2N9DUfr74ib3UjSaIvRuTXHpvO7qobbmBaqpm73D4DX/harfAoUSYcss7AK4xspmx+seGDs1mmkpYtaMW8XFXqGyqHW6T9vrh7mrYOLaRI/ZcUYIe6tJ+JqUJo5zdNd9o+fiV2F9+7Cvl0256C/yDW0ZkjoG61KIiTG6BTeQeyduVwScqaUWQTaumYng1763LIYr6YUvXjEb88Ipafn1OewNGsuEUFeI1vhELIPNkD0hA4ghOvAD2nKd31N5pzKE7BW5dFrhB/f5pGpS3GXjq+/DeMdMmOYrTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <425d5e65-cf37-6098-074d-0dc1dadda8e2@suse.com>
Date: Thu, 7 Apr 2022 08:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] x86/monitor: Add new monitor event to catch all
 vmexits
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <d1a7a48fa2d46c6a6cbf8f93926a8839aaba92e3.1649256753.git.tamas.lengyel@intel.com>
 <73e6b45525e1be753d3e243d42ad632bbc5690b0.1649256753.git.tamas.lengyel@intel.com>
 <9f593bdb-d95a-4705-d24a-f8767d69a09f@suse.com>
 <CABfawhn=-avd30QieqJ9gWsJMegRYcOV23vGvYeQcaoA-Cu-VQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhn=-avd30QieqJ9gWsJMegRYcOV23vGvYeQcaoA-Cu-VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cf43a6d-89a1-42a3-4df5-08da185c0ad6
X-MS-TrafficTypeDiagnostic: DB7PR04MB5292:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB52923EB14B5A789C480016E5B3E69@DB7PR04MB5292.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AXzy1foky9/hg4WHfz4sS97n/eciDR8hVEXRzq5mXMAbUvTfLfGXnerfO6lONfZdBvEdGeNJa1oqlCuP4eoyJsblzUpESil+Rm8TldQCK9sYFDI1EP6bnhPzmE3uj8KH6PaQK7/IlOUSzI72kQhaQSdAKqgulAj8rt4PJAoXg4qYYyivnQxfeVs2EUOOLS/5TUk04ueNCDmofPEbTEABgD/uiCseDqiE3vXSklB3KNOXv6fV7asH/GT4kI1UbjMiFzoOoKoJkfvMcnHi5Ii98K3JpE9/UPFq59OVStVZ/OD0SI3e0Ju8boUDk3lhIBo/4gkFng8yCgBvqfPpDNFukjN6FT0L9wuozx39rQsGujWONisgiZ114vnRkPDB5BHe4Ri3ZBSqYKzQ+fAM3znoZHlRQLyerudQJcSTVu2BHdzdeZu8koEjoIvJc6L+ILXVsmw/IRrQTN/y/PYt5AXEUGrf4VFDkalKhoHAoyjIqRmVG8NIKsKBUs+zH8lx9rlgTGZTwE0+/v5YdmE5aBzf5YrPLCj2QRHFECGqVIM0YAU0HS/iTfLZB8HwyJqF74oPHvM3qsVZ9p8WKYH2V7M6OjI36VVFyW3JsVT9Lh0wgcwtWGO+bkHj3SaQizJc/jZ7tVVlqYf3X60SOlAHK4OB0YgD/HzLNoES6Fs0APZ5rOu49SQ1WT4zmex6PLpJWMyFzNUp6RB6f3eNJNkjq33UMlOONXJHQp7JSGUnEIeoBG5kq/+cvREDjMOAcDuPEHv1l9eVLfORJqVGcs9Mm2xxmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(7416002)(6512007)(2616005)(6486002)(508600001)(8936002)(86362001)(53546011)(6666004)(6506007)(31696002)(2906002)(38100700002)(186003)(26005)(83380400001)(4326008)(54906003)(66556008)(66946007)(316002)(6916009)(36756003)(31686004)(8676002)(66476007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlFiY29qMWJ3RExZVmNFWithQVA3eTdXTEt5OTFWYUZCY0NCKzlLZHdRZlV2?=
 =?utf-8?B?VTk0VHVRb1Z5UFVmSnJ3WWNUcUcyL2tiWUw3cm5ZbE9jM2FIN21wdUpPeThC?=
 =?utf-8?B?ZWI4V2huVFNUUVpkeFpGOTVnMWZNMTNkakNxakMwWWNTYkJUV3pTMHZaV0RB?=
 =?utf-8?B?UUsyY0c2eU9zaXZLNm5UTDJPNTFKRjVoZDd6ZHUveXhhelJUNlRoNXUwdENu?=
 =?utf-8?B?dlQ5a2lhM3NNdFZNNU1zaVhsZUw4ZHhLMGwvMVEvR2VNNUNUWSs1eDlYK3Zn?=
 =?utf-8?B?RzFFS1ZUalc0U0JMTUVYQVpXTmU4dmN3RGVpU1ZtMVpLRmFVTy9FbzVMa00w?=
 =?utf-8?B?a2RGVkhrRmZncEdjWEhCUTA5SHJIc0N2YXF6QlpuUE9MN2JrbVA3MzNBdFRN?=
 =?utf-8?B?dmMyWkJWRFpDTFRVT3QwTTdXWlA3Si9EaHB5MmRYbnBuVU1zSjdwRjFKTVEv?=
 =?utf-8?B?V2xHNGh4WERKUzA0WmZpeDdHcFcxSXRRcEhDRVpJTU9mNnI4aEN1TllQbWdG?=
 =?utf-8?B?SUZ5MG05ME1QaXdwRnZKUnB6RXJWSy9Ncm50MnlzdWZWblkrMjg0clEyTU96?=
 =?utf-8?B?N1pXVzV6ai9CZUljM2wxSFR4RTdqRjZrM2dFZTRmaEVrNkpWR0x2dlhEdWlR?=
 =?utf-8?B?Z2x1YkliaVY4bXc4Q1g3c2ZocHF2UmZOUnpmd3Jsa1NDQ1gveC9nRm55MCs2?=
 =?utf-8?B?QlJtc0dmbVZzeElkTzlyc3AycWJVT3YyQTU0aXkrc2ZEMlByNHJwbmY3WFJh?=
 =?utf-8?B?UnZSS1d4dDVGa2VsdGNYT0VEbnlZM1VqQUJ3aTdxdDNxcXpqdkc3WkhCczUx?=
 =?utf-8?B?YlJjdmMwZFI0SUc0ckphYUJpQkFrbEdFK1lBUDZXUU1YSEMvMUdvK2tYWThZ?=
 =?utf-8?B?bEdpVE42akNESE8xNkk5Y0dVeERYeUtGL1RVU3E1RmxRNGdMK3lObmhYdStU?=
 =?utf-8?B?RlVTMWFITDlkUlo3eDFEQWdQYWdmZ0hMMkthVjNYVFpXa2lKNW9jSEg4SHh1?=
 =?utf-8?B?NFZDbkhLTWwrRSt4SEg4aXVxNTM3azgrQjQ5Y3dLZXdOU3RsM291dHJBMG5j?=
 =?utf-8?B?K2dDQzNadWQwNVQ0WWVVbVAzMVFEWkVjeGMyOTI1aXhQVkhqRU1JYXJyVlE3?=
 =?utf-8?B?QllQa2pTOVAwVWt3aGpudmxRMzFrVTdxcGdNWnNJNnRONlVPbktUYVhaaDQ1?=
 =?utf-8?B?QmZTUUplZ0hIZC9NZGN1MkZ0emVXcnBFdWp1bGhQRU1aNk5pR21Gc2Q3UE9G?=
 =?utf-8?B?SUM4Um1kditPZWtSb2hnM1hNd2JZV28xcHNTSDhBa3U0WU1Pd0hvbWM0YVRw?=
 =?utf-8?B?WkIycm1lSmErR1lFcWJFRFVaRW5taWdxS3dNWXNCbllhS2N4NTZTYVdmMDBX?=
 =?utf-8?B?K1NzZzJ0TXc0OVJvdWlFMXR3eTBFcnkzOVE2RGU0K1NxOW1DV1ArTE5FenVX?=
 =?utf-8?B?bE9wdnpYbDU0Mzk2OFFaa3R0MzR1VUxUekxSUzF4Z25nejZ4UklncXFQWEpS?=
 =?utf-8?B?b3FGRmhXa2hlb0JMdFN0RU1OSkFKeHkvd3R2N0tVREtzTnk2V2NKUlU2RXRV?=
 =?utf-8?B?TE9pWFJ6eVh6cldNQXplaUU4cFczWm8ra05McmlhSXNKdldOUkx5STdEc2JR?=
 =?utf-8?B?VHhEYVNWUmI5ODdwbUMxcWozRko2L2xZQUtDcXE3Rk0xNFdhdXhQOE5LSHBy?=
 =?utf-8?B?MlcwQUltWVFraHhiSWNPMllEOXU1NGc5RzkvU0g1TWk0eTUrd09KeHRRa3Mx?=
 =?utf-8?B?YXJsRGQrcWVhcnNGeUlYRTRpZEFUSXJsZ1VZczRJYi9TYVNVZ3d5SDlwT1cy?=
 =?utf-8?B?b2pLcUkvYVBVcEY5TndjUWFOdGVObU5vcUtCMzJoQ1BGcEFZZ3VmOXM1QTRB?=
 =?utf-8?B?RmdpYUlLU1UwVlRqazgyZ3pJbVczREQxamFrZnNDZmlQQ2FqemFEWXFoL0JH?=
 =?utf-8?B?YklzNmZnTUR5UVVGMWVmYkVxaXlkcGRxTExlVWtqMFdiOWNYVTFuWmE2bFJD?=
 =?utf-8?B?bkJJaklabGdRL29QTWkycitLVmxYWlR5NDc1bXlrb04rSWw5TzNYWmVKNGxW?=
 =?utf-8?B?ejFrNUdkUnM1T28yRkt6bm94TGZRVS94R3lYbjlsUDIwQ2xSRlhONUZ1QXd4?=
 =?utf-8?B?VjVicGtRcTBjbnVMck1oT1lFRFFxRFpMTHorUjhQSHJzdXdHZ2VqREhUdGZx?=
 =?utf-8?B?T0FYNVpyUmRmUS82YkIzZUUzZklHNWdtSjhPNE5UTDVCVG9LR1ZhWE5tMUZm?=
 =?utf-8?B?TGw3UTRlVng1YkFlbGxMRUxUMzRaU2dpTWxWU2d5cGdmRGVqQklhWTJpYlk4?=
 =?utf-8?B?dVduK2RSWTZiVmJaWk92V09EWmlSVzBLOGhFdG9GMUt3ODJMRmRxdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf43a6d-89a1-42a3-4df5-08da185c0ad6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:01:22.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2+0SlB3ducm7dGGaT5C7lfKjYWdY7rjz55M81xhTZU97Nd/h4j/VuscEO5yzw97M/G+gjETI//LwTq9NveGMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5292

On 06.04.2022 20:02, Tamas K Lengyel wrote:
> On Wed, Apr 6, 2022 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.04.2022 16:58, Tamas K Lengyel wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>          }
>>>      }
>>>
>>> +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
>>> +    {
>>> +        int rc;
>>> +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
>>> +
>>> +        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
>>> +        if ( rc < 0 )
>>> +            goto exit_and_crash;
>>> +        else if ( rc )
>>> +            return;
>>> +    }
>>> +
>>>      /* XXX: This looks ugly, but we need a mechanism to ensure
>>>       * any pending vmresume has really happened
>>>       */
>>
>> A few lines down from here failed VM entry is being handled? Wouldn't
>> you want to place your code after that? And wouldn't you want to avoid
>> invoking the monitor for e.g. EXIT_REASON_EXTERNAL_INTERRUPT,
>> EXIT_REASON_MCE_DURING_VMENTRY, and at least the NMI sub-case of
>> EXIT_REASON_EXCEPTION_NMI?
> 
> No, the placement is necessary to be where it is to be able to collect
> information about all vmexits, no matter the root cause. Failed
> vmentry & mce during vmentry would be interesting exits to see if we
> can induce during fuzzing from within the guest (indicating some
> serious state corruption) while the external interrupt and nmi cases
> are for the most part just ignored and the fuzz-case restarted, but
> could be still interesting to collect their frequencies. So in effect,
> we want to avoid Xen hiding any of the events from the monitoring
> agent by handling it one way or another and just let the agent decide
> what to do next. We most certainly want to avoid Xen crashing the VM
> for us.

Okay, I can accept this reasoning. But then don't you need to move
your code _up_, ahead of an earlier "return" (i.e. immediately after
IRQ enabling)? Also may I ask that you transform your reasoning into
some form of a code comment?

Jan


