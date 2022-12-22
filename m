Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E9653DF3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 11:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468419.727520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8ITd-0008Td-Nv; Thu, 22 Dec 2022 10:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468419.727520; Thu, 22 Dec 2022 10:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8ITd-0008Rp-KE; Thu, 22 Dec 2022 10:07:01 +0000
Received: by outflank-mailman (input) for mailman id 468419;
 Thu, 22 Dec 2022 10:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8ITd-0008Rj-21
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 10:07:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f4e3396-81e0-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 11:06:59 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.12; Thu, 22 Dec
 2022 10:06:58 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 10:06:58 +0000
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
X-Inumbo-ID: 5f4e3396-81e0-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi5S2MMnMsaLftgpsDFAkyOB0Oflllp4PwB41kPKTIf4Dl25CR6ywlBcBJT4UBK40/XqK+zn25yXgLFOlNmSBdMtytIjZuLnxqsauzL9clr42k9x9291TronEn1F/5NCScmwYT5IQTJXOcHcVKej3h+UwnLat087Z3Jlm2kSDg/wpaIW6wXNMFVLQEf55pBfBXBCnNsj64HsknWG9uxcuki510m9zLUfKCbqo8xD2F0QRpJciARq2N1OqvcLUVTQYtSCIGy74MIcL6W/cMOBP/9h3nl8cKRyFb4XNqgh3Kjoz5T+62MQPhfly238UD9E5N+wY+jeqe7c6Y0SMXw4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHb+wIfCyyIQstZPl7j3VKlivTPMvRbEm1OPJTbXpS8=;
 b=WKpkU0WQhzWRp5NmyIa8g8ZhFBi/aQThKQ4xyrooX7WKOGYct4x551KYOSg6FWlbAfN+hvQz/HCTN3W4oJF3Kl0d9Ul9rvY16NTWcLS7vpaIiQhtWbQkmRi9AVsJyd1rIhq4AT2pFp9CL8H+OKDStua7jrN3AlNw0RDOg+NHuI4KngSSJIF39slR0AsPvLGOYUSzsqgmr41Q7MS5qykmADuOb3s6jzlWhpL3mWhhaT+yCsQ5zQ0dXQiNmtuAs3K+G6QuVp1tlUD7d2N9RR6Qj9aJqWesSOA7d4uThIv/M9fV3I0e0+B7fYcmSFrWWw2ICHKr2Moc1OuT4hs7wyDWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHb+wIfCyyIQstZPl7j3VKlivTPMvRbEm1OPJTbXpS8=;
 b=FoLeVR0rQOMCpx5eHXL+Ki0vjo7FGVAxmM1Rl2Jp1A0eSmD6EpjXWqGXhvHCYP9W4A46D1GoJOt1iwSgPKVxERrM2/bEyfs6P8eQcx0XVlvV3e3WmYQnKH1R7dlDnnNgZ1XZ2UqmKLIyNBHUndD0IYWAIMttBejUzyZtclmXscDmlLNd2YPJPqF9ayKXqNkTRtH40DFhWUtpB3+2ADDUlKJcAfDbD4GCDtgSI64J6opeKULEAHW0QeYFl9L1jN2XRc1j2nQ9coctqkgf0MIv0Kr95mLVmqCk7srSSHfHi6G2wxAa62P0Qn9fxpgtKxhowYIa0pqUFtrDnv+xeoy7EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3762a997-743e-8aae-b183-5b99d49fe957@suse.com>
Date: Thu, 22 Dec 2022 11:06:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 09/10] x86/mm: Reject invalid cacheability in PV guests
 by default
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <64d81a49e5e00527ae01b707080f6f0e14ee667c.1671497984.git.demi@invisiblethingslab.com>
 <a73a6829-5924-a98a-704b-c0111c16a3f1@suse.com> <Y6QppKYFkKqyo3cS@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y6QppKYFkKqyo3cS@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 84297049-0fb1-4523-9cf2-08dae4044340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PWpI/oSNv/veU0ijouHG3MYJU7bFVXJcHKc8DoRoaFwGC3qUqPJjSxuy3f9KNKFHpOWI7SuxVwE1m6XslKzp57HbC2YFnlTHW5CAEmC6oiQF5/XpS3gPBM7Vnf9HZj4FnIt06QHZZDsosznwvPe120kamTzktcR+oVJ8QXY8i/AkVMFt4ICW1LhP0ausaj4yKGnAg22qS13gNv3Pwo8QOcsoV6zA3zxzZ+b3p9bX8NgouWfXnADGfLmuTalvy/2Rlc7DBrm9bvDNssmL24cSmrx9zPQtOvB68+SkCjWz4vSDPJa5criZ3j0I+ee3KRuw13uiLf5L2sx69wt1Kl2gfzh7XiR0bW8XKRGPSDRmC6xBNv8u5dub9Y7gmaPrsjEBhXpQP8HXHJ7x71ZZC1wl4ltW1CFSil0ih6IlOpQvRTYRDOEx+RM0mQCxnog+mOPNh64zmJvIhcw8UfvuBxoS3tPB9dhoDxoIeuY4rNVmMcyOWczo4lF5E+ovQGuQC1ciWEbvmfgyYZZppHZxQgPnUf7KJlUjdjM4Q3scoyJW2sukOpkFd9NLUzaXwHtBGfI27Xl0UrTBdcRz/qqbqMrWrV//eKSoa1SDYsE+XeUweJhK4FapINabSAgocBKXUnqo3b+Vr0xVN0iNrI8Qn/OLW58pFx9gPXZNRnqVDu6VWUsscxhI2XRaZzN1mtWPbvoEP2BhbiVBPnXExfAcVGVNcIZiRnjS++P+WJT/QPQuvKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(86362001)(316002)(31696002)(66946007)(8676002)(66556008)(4326008)(66476007)(38100700002)(2616005)(36756003)(54906003)(6916009)(2906002)(8936002)(4744005)(5660300002)(7416002)(41300700001)(31686004)(6506007)(53546011)(6512007)(478600001)(6486002)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2xZZHVwVVVZWGZ5Tlh4TTZBRDU5M2lCbHArbXJOVkdEYmRvNHRaQWRiTjFW?=
 =?utf-8?B?RkZ4UXF0MzU3MVVHejdHMzNGcVpNejdHSXRkTy9GTS9HdUhUY1pldkY2QmtE?=
 =?utf-8?B?SEl5RVBTMkdzNTVvR2t2dVU3bmQ1V01WTmJZOC83Ym40cGN4eUJYWFRIV2c2?=
 =?utf-8?B?elZOZHRmbGNtZnZhVmZnZHAxT1o0Wm0rdTR3U3JFaGM3dUFtODZTSGw4aWRu?=
 =?utf-8?B?Y2tSbTlGYUF0eXp4eFNkeEtyY1Z6NkNqUERiR2RZNVlrUGVTMkdndHJZTjB4?=
 =?utf-8?B?Q3IrUXQxL1ZsaVRkazZoZkRDcFhxK3R4K05qd1BGekw3S1JpTTlZYldNTW9m?=
 =?utf-8?B?TVI3V1BJcVBnL1NYUDlFT1dZb1VRV2tzUmd0eFo0Vzk0SUE0YW5NME1oeGU5?=
 =?utf-8?B?Y1lkK0xrTHRCZko0eWovVksyVW45U2owN284Um5FUVZ0UFRwR2UxVDdzdThu?=
 =?utf-8?B?bW41SGxGa1pOVWRDeUMvS2oyNTVlMW13Z2FYUG1Qbkt0WFNlRnJoQXYwdTkz?=
 =?utf-8?B?TTdQV1l3dzA0RXVSWmtHbGRPNVRaa1lKcFhLUm9icW9LS1BzQXVWQmV1RFFx?=
 =?utf-8?B?TzRHYjR4OXNTdVFhR3IxYVpHcEk2b1dic1BURFlFeUVrazg0L2UvSWtueitU?=
 =?utf-8?B?Zkd4N28wS3VZUUdJQ0FWTXdHWjQ4cFloOHpZMkd1RVQxNWp1OHBTQzU0SWFC?=
 =?utf-8?B?NXdiL2FHbElLc1FVNEsrM1JURGdwbkJzUzNuZWtrMDhJL1M1V2k1RGIvY3Mr?=
 =?utf-8?B?Ymh2ZGRqM05vVDR0aFNwVW1JYi9IcDBkN1lLdFdpWEYxUnVHTUZmU2NSTkhi?=
 =?utf-8?B?bUxXOGptdzNJM2U5Z2d5TGt2SUQxdkswZnIzWUVheVUvZEt6UEYrZHFSSGQz?=
 =?utf-8?B?cldHNjBINHJVWnhReVJaODZVV0IveVRmWG1FQzk0dGVpTTFoU1lhbFNSZWhq?=
 =?utf-8?B?bVJlZ0VjNWFmTnpJVFVNUVNMY3d1RWN1MmJxZk5Zd0E5K09QQkkzSzBIdXNs?=
 =?utf-8?B?NEc5R2RGMHFCeW5DeEJ4QnlCTHYwSzllRWRjM1ViYTdadEpadlpINmpkVTdF?=
 =?utf-8?B?RzA1czVHaThuM1hDdHhLVXo1YzZQQWVFWEYvTC9KdXI2YmtvY1cyd3BEVTR5?=
 =?utf-8?B?MU0wVFpqeWwwTEpqdEswVlZ1ZjcwOVJWRWdPeHdpSWhRRUNOQnB5ZlJHbElv?=
 =?utf-8?B?R0V6VXY4N1hMeGdwcHY4ZDlxZm9lMXFteElkS2ZQOC9YU3pEdHcyeE1SbDFG?=
 =?utf-8?B?SGRScVFQTlo5eXdnVkpLVHNWTVB1Yy83dVluUTR5WGZwbzdLbXNpbzZKM2Q0?=
 =?utf-8?B?UkhhYURpcG1DSDF5Tld3a051VGdYekg1aUZ4YjRXbHZjOVhMY1UvYnBPTHRs?=
 =?utf-8?B?ZmZiYzhOeXJPNXJaVUVpRXVtZks0ZmRSd3lHakZrejl4cVlPZFErNEhnUWtv?=
 =?utf-8?B?NjJBdEtNbDFJZnhDazd6VDBzTUNpZXN0MGswS2VjWDFxY00vQTJIZjVldDhI?=
 =?utf-8?B?Ky9OOXN1d09acmR4WCtDZE1QTmplZ0FFVUxFVVBpdnpZbGM2YTRoWGljazVw?=
 =?utf-8?B?R3pPWnYvZ2U2KzNGZHBKVHhQbTQ4Q2NtQjhKcWluZkszb3pRVW9aMExCMk9t?=
 =?utf-8?B?bjU2ZUNQZ1JDSk9IamFnK09PaU11bWpMOFFlUGZSdkdnZUZBQjdOSTBCRmxS?=
 =?utf-8?B?QmFia0VYWXArT2M0LzZHWGZvSlBuNGc1dlQ0SWFySTYxOTMwNWVOeUVmQWRa?=
 =?utf-8?B?YzRMeUpwaWV1ekJHUjVNVFVLb0ZBVzJrZGtNWmNSOEhmQ2oycEs2S21ndWs2?=
 =?utf-8?B?Um9sdTczTUVJQXdMQ3grZEEwNkRubzIrby85amFMb0IzdmhhVElvaVNIc2R5?=
 =?utf-8?B?Mi9nUmowYXBBTFZFM2lsRlZMMnBaYUQ1SVhuTTlQZVkvMHV0bzF0MTZvZThS?=
 =?utf-8?B?a2NtMVhTUGZoUE5UUnhhbFZId3g4R0ZtWm9xbXZPWk1nZDJ0K3diSVd3bjkw?=
 =?utf-8?B?N3BSdEc4c1pUVlg3TmNXWUVZNkYrVDJDNEFHV1hWSVhiUitSdnBMZ3lUQVFC?=
 =?utf-8?B?S2RMUVRtVnU1U2dIOFNTdmlEL1V4YWNYc25SbkRlZVorWHpuNWMrSU5QTlV5?=
 =?utf-8?Q?rk5kg9D3YitMPn1p4Gu9TLIIB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84297049-0fb1-4523-9cf2-08dae4044340
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 10:06:58.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCLA67/AWW7lvGFdyfqVdWojPd6cLmj3bl3DhGdCo7rSiiReja38pqyeFvIKbQ8N9DNe+ML3rTB7grUGsNr4kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8820

On 22.12.2022 10:55, Demi Marie Obenour wrote:
> On Thu, Dec 22, 2022 at 10:48:02AM +0100, Jan Beulich wrote:
>> Also wasn't there talk of having this behavior in debug hypervisors
>> only? Without that restriction I'm yet less happy with the change ...
> 
> My understanding was that Andrew preferred the behavior to be turned on
> in release hypervisors too.  I am inclined to agree with Andrew, if for
> no other reason than that those working on guest OSs do not generally
> use debug hypervisors if they are not also working on Xen itself.

That's likely a mistake then, at least for work on PV guest OSes. In
particular PV memory management code is sprinkled with gdprintk(),
in an attempt to help those people understand why some operation has
failed.

Jan

