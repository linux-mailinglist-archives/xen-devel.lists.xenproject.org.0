Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB66FF00B
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533225.829693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3je-0006nw-Ve; Thu, 11 May 2023 10:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533225.829693; Thu, 11 May 2023 10:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3je-0006lN-Si; Thu, 11 May 2023 10:41:22 +0000
Received: by outflank-mailman (input) for mailman id 533225;
 Thu, 11 May 2023 10:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px3jd-0006lH-7P
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:41:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d3971e5-efe8-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 12:41:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9222.eurprd04.prod.outlook.com (2603:10a6:102:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 10:41:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 10:41:15 +0000
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
X-Inumbo-ID: 5d3971e5-efe8-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE7MxBRNVnR+RXSbUWUiAz4kFNqqSFKZYqwpXA2jUjar8LzjkrqgYmBzrju2+6Vrk6c68TAxert/1q2tK6hTDuCazO+dv6R+dLcMtF+zePmRvqINzTVb/2lE+vhX9UrXZliGPJ0UwXK4snxOsBHsX3hHx/fq3lP4FuR0Q4e7Q32WP6fuwKdRrPC3G3mHxnE4Y2J19otEXQfHxz7OP0zqyJpHUK9nkcZuoGw0hWUy5N/CvMRoRULsHn25THTHCQtGZ8OnewI/j98PmWsVEg4hvV7krk7dBQub0/IooJ89BU3ob2hmWaUFSRghOMMO9kM14PwTNB/jQhaJYip0O2MAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYxnSEia4BAcz+5c5a5TbHBD4e9yV/qA5+E+R0E+xeg=;
 b=Msag0d6jcZSlNAQAZzU6ZCWkaL5nTIQEyFx4AKunGxj6/FNEBolaG1HgcfdzOr0zreESpmkwOJgepx38NirkW5MptXnPcdwbxvJtTJp7dom9b5sMMysKPwAt4zMd8wTlOl6YsIh4boHRDd8YV6mL2Q/i3N4tOrgLf3/fDhtMB4DZilQAg0CyeHFmJzj5ARmxeEh4Sd0EMJi48bJASnC/xurIAfSrhQUUSGtDuyD3/3dYvxraWEnb7Mz5OVB8PT13eg9qOYdL6VM/AeeXcuTNFatYDDbPGkyga3c1ISy+BhQy14BHhZ9/qq1bw7ucrww/ZIC4r9LQrPztjXZIIAnPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYxnSEia4BAcz+5c5a5TbHBD4e9yV/qA5+E+R0E+xeg=;
 b=RiiwnysADnZOafrem3KDIBKwrnu3rL8GqxYH2pocs/Yd/J5hHSWSxKeEw6YS5pm4jYH+X9BhcONUzbMNx2KCS/HWIOoBmJem+iTs3Mk4uDFJVZeqsuvCkcHjI/xE5svobCwh1EsmqrKcKQz2wgiS7VIDLGHTdqf04xe/P1Z1IPUTQDqUjJ1+t44M4QfYUpULXKMvSDPvt2OfPybrg1rjmFGcy5tQJyl9EAAKAXRAMVO4WcFYCxbyZXFQHo9kqpXT+DI+ZhxHgMsSB1oqgkbT8dFiABo1m1dB0qOizJOdz1LUkonrjuhqXZzGDz70JGW6zDShj6RtSXix4ZEv/ONgRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5676f943-d35b-3989-c2de-4c0a46b307fa@suse.com>
Date: Thu, 11 May 2023 12:41:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 3/3] domctl: Modify XEN_DOMCTL_getdomaininfo to fail if
 domid is not found
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
 <20230509160712.11685-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509160712.11685-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: a861448d-b56d-401f-8700-08db520c3f0e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	anfwTergMSN2k95nD9sWutKXV3H9fJ7EzegbqIXCsmF6M1ToCWMThUFMHaQnlV8Lbr37nV+nHagk99w/zXEGcwVFFWQ8nBAQbSNrY9aA8Tzd8YVT5mPKsxErPnvdft5tLxMyK9xt2uQ74QAg/Q0+/Slu0rEQKHozvQcSxkk8A890AtOvfy0axIr4zYmN3br28+F2xUJ9dEbBOuQWuLQgAjIYZ/KVtd+KiHxU3oUM2LyHQAmL+jfTKRrCE7oQKSuOU+Em5WfvDo5yaeFyJm611q4ywQmqAQpRZkaySdBM2GZkmcZFCM7KIPGc76FyAaKPXM/MkrMmQLyL4zLgU4/oxkUvW15yEzdqV/i7m/qbPIEP4nvbZlx1KMzl12aLXQ+UI/LCpFC0wo8STqgeJd4BQD1BNKuSG+TYwuxhi+Nb7FuFfcY5zTi7vbff0IlGIuD9WR67VaIYlX6Be3/akDzpoSL9m43UwTZSA9iGFBHdVAAhiTANQvmCjYXTu/OdghsNrAd/LB6ijnebpEvzHnYSQZhgWVW92HuCe4OFFxyVBtL9oF3olp4S8JYpxrr04wuC/OwkAEWBmIQjOocaE/kmnSy5EHwut68ksR1R5LTrZcIBkOdoKtfbkg0mJHtC0QvmY2vvolCHZq/rq64mhyKB0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(31686004)(66476007)(4326008)(6486002)(66946007)(66556008)(478600001)(6916009)(316002)(54906003)(41300700001)(86362001)(31696002)(36756003)(83380400001)(186003)(6506007)(53546011)(6512007)(26005)(2616005)(5660300002)(8936002)(8676002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGxpMVFHZ1hlcGRFclhjd1NhUERqWHhIUjhGQjRWVzlIMjgwNUpRajlNY2NW?=
 =?utf-8?B?VkdDSVozUllTTDg2YzhxQktDMGFLTXNBRHF3M2h3djFLRVJXa0pHcUw4ZXcz?=
 =?utf-8?B?ZWc5d1ZWRG8zNWg0czJKaFIvWGhEeldCajUyOU1rMVhlRWdsWGVBMk1TOUFC?=
 =?utf-8?B?YjJtMUE3VkY5Yldqd2NUTlkwaENnbHQyTTdtTlV3elFpd1hqaDIvTXFtRi90?=
 =?utf-8?B?WWpDYkJ2NW9Sc3hqV0svUitBWkpIK1dnUFJnMGNabENqdmxJcTNLanVlc3hK?=
 =?utf-8?B?N2Qzb2kxSnJjZUs4YUM1WVB1QVhoUXd3Q0VXNm0vSU1SVUJCaTlscWY0eXNq?=
 =?utf-8?B?azBHY2V1OWtOWW1QbC9oTHoxL2Q0aEc2REsxQmdFZi9XSDVBbUNuRW5WL2t4?=
 =?utf-8?B?SlBtOVpveVpyTVJ2TVR5R0Q1NmVGbEhEWi9QUk9XdHgxQ1dEOHZNOFpoMUxM?=
 =?utf-8?B?RVd2NE12RFE1K3E5NEEwM2JqTjFtczBQdExQdXl2WlZtK0RRdmYxTWloU1pC?=
 =?utf-8?B?emFENi9Udnp2VkpaeXpjVXhJSWpRaENMWXJJT2hwNzkxR3VaSUxvZHRFak5E?=
 =?utf-8?B?YXk2bE90TzBzVFdUU21xLzRmbEZSNVJpNitmSVdMOWN5WFNYWjdmMStqejVO?=
 =?utf-8?B?aXo0blo3RnRVMzRqYldCYmwrUTVKckJVdStMRGNteDlCOFZibThrWEh2R3Zk?=
 =?utf-8?B?ZkwyTzJvZFZPUG1oK2x6ZVY1UDFZV1c3RFpXcE5mNC90eEhGdUlzRzhxaUI4?=
 =?utf-8?B?dlhUbUN6Zi9WZm55VWVMdGUzUkpxS3pCUU15TFBKUUM2OXptWlA0L291V3Zz?=
 =?utf-8?B?b3hwR1VyQzlpNHlJUFJETFcydFBBMzl6RHFMRjhtZFB4OFRBMEMva1dMNzVy?=
 =?utf-8?B?VC9RZW5wbS8rSjJtMDZPUTl2bXQ2S01VK3pmTkd6N2lpRUhaN1VqSXlnOXRD?=
 =?utf-8?B?OG5McU93Tk0zTldzQjE3RUVPcVBOT01OMWxVd2FBcU0wclQ4QklocFFpZDcw?=
 =?utf-8?B?WGtQbTNYcjJlQUc2TEpWREE5SjZFSDdjQUZSUHdFekt5czBseEdQZWdwamxo?=
 =?utf-8?B?RlRkaXhESUhNa29rL2dFRnNYUlZrQTFMc05ZT1IrUTVWMHREc3lGT200Ymw2?=
 =?utf-8?B?eEUwYWp0RWlsa0VXOU9Dd0I5bGRvSEEyRmlRM1h5b2pmeXlmSGQwTUY3aXZ1?=
 =?utf-8?B?NExLckYxbTNPWTVjQ1J5ZDY4bmRTN1hmNVhkYm1vSUtoVCtHRnl1cEd4RHdE?=
 =?utf-8?B?cWcyQkptOG1kNk5JRFNFcHQ3cHh1NUJ6bDR3bXVTT3o3NERtZ0JlRkFzZXdo?=
 =?utf-8?B?T2J6K1hINk9tOFNxcUZKbUUzMlp4TEVSMFBDTkdtbHdYMnhxUnphOHR2QXhX?=
 =?utf-8?B?UlBub2pzbU1rWlZJVHllOGh6akpCTlZBcjZHeHY0SU4zNFVhRFBLYnVSbnpJ?=
 =?utf-8?B?MlJSa3NLRGh6UTc2djhtNlhZR3ptL0xmNmZpQ2FRUzFPUjl0YWZ5Ymk2RkdH?=
 =?utf-8?B?TzJNNXRtbmR1QktEWXZOTGl6SVNVOXlqM2hhR0g1aUJrdzFYbDBNNTBKQThE?=
 =?utf-8?B?c3JHN0MzeXVEdWIwZGcvckhPbW9BMU5qQ3VoWmd2bjdHdHJkbzJsMDUvNmhN?=
 =?utf-8?B?OEFlbmJ4UVd3MWI0UWttU2grOU9rWjRGanhJc0cyL3hsUHV3YnFWaUJBOUR4?=
 =?utf-8?B?aHYvQkVmb2JELzkwY3BOSVVUMTZOcFIvd1NyS0JRYjhEWVdvZWE0Nk52dTFY?=
 =?utf-8?B?dWs0S1lLb2srYlAxRXNQV2c0TlB0U3c1Q2MxNE40eHFzMjVCUFhvTWdPYVFI?=
 =?utf-8?B?U05rcTlvaUdBOFNheEZJYVJmRVNTOVo0a3dnVzczaWMwS1JyM2taYlBqUlZx?=
 =?utf-8?B?UkdNVkRHMUNQSFBPTDk3MjJTR2JocnQ5b0IwYUlaZ0N0aEh0MmRURk10Tkl1?=
 =?utf-8?B?L1ZFZk9DN2lOVk4reXdPNDdFWk1jdDRSTWk4N3Fvei9KZ1ZJVlhXWGZHWFA4?=
 =?utf-8?B?K0pYQjdaS3c2NmdORGo4SWd3UzhyODIyMlkyR29MaEZzWFJJRzd0cU5jdUFk?=
 =?utf-8?B?SDhlSnJ6V2xJNW5PUDdZUE85a1ErMlJ2ZTZtbGRmOE1CVFVUNkJ4cTJSU0Ji?=
 =?utf-8?Q?JZXDSeBs5Uzy9q+VNFGl7QqYE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a861448d-b56d-401f-8700-08db520c3f0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:41:15.5709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: um3Z8FkSz8t8EzcC/0cayJ96OUDn9SzVv341Q0ecinEDJY9sumiLZPZxhO8kqsrOFQPYF9yi8Jit+BR68SueLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9222

On 09.05.2023 18:07, Alejandro Vallejo wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -314,7 +314,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          /* fall through */
>      default:
>          d = rcu_lock_domain_by_id(op->domain);
> -        if ( !d && op->cmd != XEN_DOMCTL_getdomaininfo )
> +        if ( !d )
>              return -ESRCH;
>      }
>  
> @@ -534,42 +534,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  
>      case XEN_DOMCTL_getdomaininfo:
>      {
> -        domid_t dom = DOMID_INVALID;
> -
> -        if ( !d )
> -        {
> -            ret = -EINVAL;
> -            if ( op->domain >= DOMID_FIRST_RESERVED )
> -                break;
> -
> -            rcu_read_lock(&domlist_read_lock);
> -
> -            dom = op->domain;
> -            for_each_domain ( d )
> -                if ( d->domain_id >= dom )
> -                    break;
> -        }
> -
> -        ret = -ESRCH;
> -        if ( d == NULL )
> -            goto getdomaininfo_out;
> -
>          ret = xsm_getdomaininfo(XSM_HOOK, d);
>          if ( ret )
> -            goto getdomaininfo_out;
> +            break;
>  
>          getdomaininfo(d, &op->u.getdomaininfo);
>  
>          op->domain = op->u.getdomaininfo.domain;
>          copyback = 1;
> -
> -    getdomaininfo_out:
> -        /* When d was non-NULL upon entry, no cleanup is needed. */
> -        if ( dom == DOMID_INVALID )
> -            break;
> -
> -        rcu_read_unlock(&domlist_read_lock);
> -        d = NULL;
>          break;
>      }
>  

I realize it's a little late that this occurs to me, but this being a binary
incompatible change it should imo have been accompanied by a bump of
XEN_DOMCTL_INTERFACE_VERSION (which we haven't bumped yet in this release
cycle).

Jan

