Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851207EACAC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:11:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632254.986459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pRx-0001Yt-S4; Tue, 14 Nov 2023 09:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632254.986459; Tue, 14 Nov 2023 09:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pRx-0001WI-OD; Tue, 14 Nov 2023 09:11:13 +0000
Received: by outflank-mailman (input) for mailman id 632254;
 Tue, 14 Nov 2023 09:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2pRv-0001WA-M9
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:11:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c093c1e4-82cd-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 10:11:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 09:11:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 09:11:07 +0000
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
X-Inumbo-ID: c093c1e4-82cd-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoynVOKWSRt/5cvxWZqTYVswfXNhHU6Q2IVR9uAHIvinLJzkZco6HRNaleOs2vd5NdVVX65ux3sjv5GlYzS5X7cY4zYZwLZuKhEfC3GFNcbXLSHsJkyIyJQ+jSJLgCBUP8jnvesDWruerKkNSwQlLFMsN2w48TWtoLeUDmn7hwuBQKOnWCdzN0hCBj/TFRkIcPFxSQfSAO4XKxUD9moLnqFsSiGLt61lnPzJkxU0cHzoFFC1zxENmCF9vH7Su8d6EdofvmPh3yBNsaVHpaw+DCZ1bqHjtNwZv/WD+YnukGJfctGw+oleZr1kjH5WQ7DjO2z6qhJvGoLCgsMVbwR23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZe+pBlpqM/1HxUXGZOVGlnMmOyvfFXOv6FF9BVVD0E=;
 b=NVmgQy9dPQwfMlPiz/9XCdh1Zu0GME51jWksPOWJ+JwyobOpqrAeRzPbOkj0BS2DRMcQK3efagj5YShRSNMhTTw84KIitL68IQHC5Jx1VLZqy6Bp6O5bakFoxlQIMqr1bXAqcn7WtvqsB5jJ9CfXEhrF76DYRNgrRH+ACI0xt3rpAhd+hkMCF7YuoTSU7ysHPVjjqf0mlx8qV5AbXS0fNUbKbUaPHFzUx2b6Eim1wwex/xa/kgo21iRMqNSMi2fROs2ivjwxzfUo5MFXuATH76TifMBNYfjdvxwY9ZInI7iisxNfXWJgXFsfHtw+9spVerEkHpd8nqwz2g1uxIYFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZe+pBlpqM/1HxUXGZOVGlnMmOyvfFXOv6FF9BVVD0E=;
 b=hj5BNe2+OdfKQn0br+39r0nkZRiB6CyBM6Tb+GdI4L1yzmRHEGCwYRx5eCGe0qXNJxtvO9djXxaTqMWMIXR1Ce/YWXN/8iT7XNLxnjpQQuJpZDbMc2EJIZ/7DCpMTPV+IFSmUwlGQ9+pMq6YMVAclQM1lupT/+Ozob23udJmISyeXqtSqW9s435wNK9SX0d3bh5yuv2mMSEvfSRfm43s62ZD57u39H3PZ0S6tgfgJiG0wsB1EUaBmts8fjxAzH7VrQxSNMqpF2WEn9QVhbF/mLRRHMHC0sASAYqlxl6MgNKXGJP6hK8DpHpNhrQLujBvmmSKgTsArETCofFZZoWUUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da9eb6fe-3eaf-de9a-2790-79165ecfd917@suse.com>
Date: Tue, 14 Nov 2023 10:11:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Christian Lindig <christian.lindig@cloud.com>, xen-devel@lists.xenproject.org
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231113222118.825758-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f8ae6f-b4d7-41f4-7d68-08dbe4f1a300
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	myG7a722w63IsKcswPpK4pMet+tj8xDG6BTcqFxP5b0NfJSeV/TYfHu3r5VF5f8YPQ4ryQHa9KNKM/m+3Xe/7mCYT5G2ffnBqxajdlDq79YWxWFK5uVC1IFieQHM1Vvput/RyY6ug/tGsp0ML2vJ+A7p/dLQpJ2rN0l1w/N6XW85JzDqANMsmV3g7wS6wtBAfT4lXOk9RCJY3Aqko4SBay82CEw1zETak1ArjlTMCD7BtclVeBu/A4Y5i8hJ4G/gnS1VOIj5I1K7YZCSFLw5uWpbIHnso7mRkSsmzrNqthR7VG46mFnqsY0ssSbDV3rZPkeMbOHeUsML0l0zZR/rX6vzadwbJ3Bk1aGyVyuc291kvUidGvezrif447jag4hi5cVrfj/kunVsdt4zRzEZZlgQhWaIjzJ/djYwv4hrDuhxVP80VbPCmxAuh8GhX4OybVUlpOejTST0PFBCncZKWjNNFnPGLsmQWxmlz+tJOn8XP9j+Uk49Il1DXOUm6w3eT4o1+r6zahFXUszUPb2x62Jnk4fWhNyLdincx5FjTfK5fYruVBin8/OEYxeHAfewYZi4HsyEyA3kzaYRz7PTPTFGKNQ3/cFUdetEbdnKPQx8qpt5er39IQqGSvKqFKi0jcrEvNlCl0Bc04ynZu82HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(6486002)(6512007)(316002)(6916009)(66476007)(66946007)(66556008)(36756003)(8676002)(4326008)(8936002)(86362001)(2906002)(41300700001)(38100700002)(54906003)(31696002)(7416002)(5660300002)(83380400001)(26005)(2616005)(478600001)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5ORjkwRzhTTng1NWtmOHg5WlR4dEhTVTZ5eS9qeVFDRDFIUFFnWEM5em5Q?=
 =?utf-8?B?OU95QlpCWnRwZDY5djR2VjRScjluN01SMkQvWFRPQ0JMVHAzanNqYUMyWHVG?=
 =?utf-8?B?Z1BaTHpYZmNkeitkWnFrTXAvcXFiYlNQUlQ5VzFqTkUzVHpsWDBEL2E3OHk3?=
 =?utf-8?B?alFPTXZPbTdnYTVzKzQvaEVsbEdodTZVNzhKb0grOHNxbU5HaE15OU10WGxm?=
 =?utf-8?B?TkMvNVUrQ09JeXB0RFdYbVJZVllpS2RkMEFlNHZvL3ovRFZ6YkZOVG1XM1hz?=
 =?utf-8?B?UldTeGtTbEErN0hXZFM3RDVPaUhaR1ljNlZXczd3dU1HQTltd0laNHFRNkdM?=
 =?utf-8?B?eE5GZGNFdUV4eU5VcFZvYU1kM0lVZUxYMjZYQkxScElHbDZXUzNEVkhBM1Uz?=
 =?utf-8?B?eVdVVzh6Slhpc0FvSmkxNURpd3VSTWt6SGVZdEJ5STQ5M25Yc0ZxRytHdkRC?=
 =?utf-8?B?WVAyY0RSR2FYcU8rSllCUG5Xb2VJYjNISjVVWjRDVEZ6UkhCQjdtZU1Odnc3?=
 =?utf-8?B?QU02a1o1MVk0c24xSjZYYTAyc2F0Q1lQemV0K1QvNWRzU2NHSFFqcEp0Uk8r?=
 =?utf-8?B?RVZjNUQ5M3FoazRmemdUU3pqUExJNlFsVmNOZGV4UU1YYWpCV1kySEFwdWl4?=
 =?utf-8?B?ZnZJcVRkbzVyS3hYUlFNWjhyd29RNjhkQjFPMzR5VFZ4OWNOdFhPNHpOVFBS?=
 =?utf-8?B?Y1JmdkJJUUZpQys4UDFJdmVicUZqb2JkUklvRDZJcUkxVXZpT3lvaGlUci9h?=
 =?utf-8?B?NTBKc3c5ZkJka3RjTEliNWFUYmJnaTh6VW81UVp2UG1VWUc3a1ZYU2JKR1pX?=
 =?utf-8?B?WitvUndKR3NrYjA2SEpJZlBHY04zSlNMOUtlYmpjb0lzVEduR2hJMlNzWEQv?=
 =?utf-8?B?ejRidzNWeUtpMDg0bUozYjV1ZkpCak9ZSmJhWTZPZUw2UFlFaUh3MFNncGNr?=
 =?utf-8?B?U1N0K1B4MTZFcXRyVnBoZmVReERSd3dLVXJDVmJ1RzNmS09ZY2FwbFNXeUhi?=
 =?utf-8?B?eWIrRXRnSDNOZEhDeFBzTWJyV3BrdnJKNDNWSEptd0kvS21oUWdVVjhuSDl0?=
 =?utf-8?B?bFNOWkpONkVaanl4enduRCtGbHNRdkNSRXBjZ0ZXa29FU0Juc3ZpTCs3TjE4?=
 =?utf-8?B?bnh5N3lSZWxIWXVINWlZanJ3YkFia3pBR3JlT2JSbGJFZWJPYUJkV2JPK0pL?=
 =?utf-8?B?a0U5U0NRL2plc003U2tQMkg0VWwrN1c0NXAzMkM5amFpTFVzQnhPS3kzc3pq?=
 =?utf-8?B?aGhoUUdST29oWWhVbHNiclZuMTRRWEdEemNwYXBtZVNFSUIvZXN0aElHMjk4?=
 =?utf-8?B?ckxqQUZsc2xYWGNNbTJqUkNYVUhINnJGclQ0cFp4UlJOcm8vaFgxN3d1VzBF?=
 =?utf-8?B?b2MyZTZ2aVdob2pqMmx2UThYVHArbmVsLzlaMlVvcUdhckJGcU1sYlQ0Z1NR?=
 =?utf-8?B?cGxsUDAxd2tBOGVyYndiMHovb0ZYWUJ1NGNWU3FvSzVjaHQ1Q0s3YU9lNFJV?=
 =?utf-8?B?ZzQ0NEkzSDFqV2ZQNzdjUW5zcm5WakN0SXdTN3oxbzA2RzF6Z09YSmZCQjJt?=
 =?utf-8?B?dG1qTmZUbFZSaE45NCtLeUdkcFBQOElEaElDSzNCanZ0bytlYWUybHQ3U3BP?=
 =?utf-8?B?SklKdGNuMUliWkgyQ1RCdnpncnZuVEtZWEVTMGM4UmZNWXlzTTVPN1ZYK1J6?=
 =?utf-8?B?UERIRmxteDlZcTNUSWdjUXNPb052TS80MU1BMUdOVDJtUFd4N2JsN0wxV2dx?=
 =?utf-8?B?KzcxS0FtTFlNaGZ0cGRmRTkvQWNxdUdQcjYzelJPalp4WVZac2FtV0lLR09M?=
 =?utf-8?B?TGhWbVNFZFMwaXYwemJ6NWRmaUdJQmU5TG9YNlg3bW5LQlhLV2Z3WWNUNWJD?=
 =?utf-8?B?QW9SMUpPWEhBQlk1eWpnSVZuUGlOQTBrQUxlb1lJQzBsU1Y5VFMrTnNIWURZ?=
 =?utf-8?B?QjJkNEI5RmI2dDhNWXlMVm1tWXd5RzN6anZEUjh6dGl3MWY3a1VBM3czcTEw?=
 =?utf-8?B?U3N1ZnRuLzNhTmJKU3NRQjA5TCs5QXFLL21KZ2t1OHRqK1RtQkRZRkc4VmFr?=
 =?utf-8?B?UWM3ZXdzOHVLQW1qMjY5Y1JpRUxoKzJHcG0ra085eGFwaGVYWldhejFkWmwr?=
 =?utf-8?Q?GINlArZ+dpa1TCI0MXR1Ey1Nm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f8ae6f-b4d7-41f4-7d68-08dbe4f1a300
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 09:11:07.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNOlZmRK4qYiXJ4uoyww5+qdWym7F6c6tSdac2woz0O4gOwTeASia72aZkn236UR9dGS64z4cAMVOu2S0vuHsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

On 13.11.2023 23:21, Stewart Hildebrand wrote:
> @@ -709,10 +710,17 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( vpci && !hvm )
> +    {
> +        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
> +        return -EINVAL;
> +    }
> +
>      return 0;
>  }

As said on the v5 thread, I think my comment was misguided (I'm sorry)
and this wants keeping in common code as you had it.

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -283,15 +283,16 @@ struct xen_arch_domainconfig {
>  #define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
>  #define _XEN_X86_EMU_USE_PIRQ       9
>  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
> -#define _XEN_X86_EMU_VPCI           10
> -#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
> +/*
> + * Note: bit 10 was previously used for a XEN_X86_EMU_VPCI flag. This bit should
> + * not be re-used without careful consideration.
> + */

I think a multi-line comment is drawing overly much attention to this.
How about "Note: Bit 10 was previously used for XEN_X86_EMU_VPCI. Re-use
with care." which I think fits in a single line comment.

Jan

