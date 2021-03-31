Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740A350720
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 21:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104047.198574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRg7t-0002v4-Dk; Wed, 31 Mar 2021 19:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104047.198574; Wed, 31 Mar 2021 19:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRg7t-0002um-A2; Wed, 31 Mar 2021 19:03:37 +0000
Received: by outflank-mailman (input) for mailman id 104047;
 Wed, 31 Mar 2021 19:03:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRg7s-0002uh-0j
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 19:03:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0d6f1f8-655c-422a-b03d-8e5e21412f9d;
 Wed, 31 Mar 2021 19:03:34 +0000 (UTC)
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
X-Inumbo-ID: d0d6f1f8-655c-422a-b03d-8e5e21412f9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617217414;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V9/8qUbHBO+ZdA99CkSVK+Eec1ubi0kDdOElr3KCI7k=;
  b=XU27g+dZhfSWnim00iHj2kD2wk3Wowp3GC64hbdY5o3WaoSOMavQAJkC
   4oB/vmIOJMMzgsMSd9V8X2Vq+NrKLeaIQdTorRh6SsdaKXlJPTqQ0exj5
   Sb+1e+Tjn+7MufQMKe4fDKNHfU5mnmDXOJif3eTi2g2vkaunsG7EjliFx
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U/TDjeL2zJA8y8KG8y1PYOD8KYaQxCEWVbGp1ms7fKmqqN9iyVyCicNsbw1Wxwgd8GjuKs5qDe
 VX5NfNH5gtwdq7x1A/qLR5jGrBZvBIfFWpEnt6nJuRCrKFlHQhAVwh28Fn8JsZCRsjATPkkcBM
 a1VvbwpLY7AWGu4GLwISJk1qd+LRMbbLHCxFLPPzLBzaC4MjDPVLayjNjJUCCNoiRG1JxlBL8/
 6HJ2J+6i14R1JLFExzJmkxwQVjIbqQ+qyYXFujRjsQpQFE5yNiwulzIggOzPMNRVjM7wx/5znj
 Xes=
X-SBRS: 5.2
X-MesageID: 40602068
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Qu+6vqik3vXv0EIIFd4ayfc34nBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40602068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7rA/OhylL2GGYbbU4jjjfgVPvph+GN4z/5hS+cz6XHG3Mw5kyV3C7hfwDKjOVJIczmtXBKF3agGIIlNEdrWuyzkDHAznKrIID97Ggvs5yGZNWEwCzsvLP9S917qmb34t6pKj42M00azel9APp4j4JZJ5+8u0Rdu1F+MvzcUnNpEmY4MKePUYHlYkdiMz2D0XvUfjlbyFNiZuF8rNukwc8Lb7B0m1XrjvrabI+mTd/1VPmh5N2rFKS9mOuO7HJ1kV8KFJ/Qm2RUGXLrFFlHVOySL4f/3Xz2HUcQajPSrNroGU5vc1QE56FBjGOGnamaW12Yn+zmv72xvJMuhnLy6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9/8qUbHBO+ZdA99CkSVK+Eec1ubi0kDdOElr3KCI7k=;
 b=Cja+DgJh3Q3DU5H/dwqLbK32e3gqtbSpEsUiYOcFSnOJNWJ8BOBgYHA5cC4kLggPUZEW5/xvYiI45+Tgd0473GNLkDApX4FcfZge2y+ioEhwnUzSlPV3IXhynZj9pXGp/5+sf2j5BOTjyVhltCp+2KJAG3rSWRIpeeadtdw5MbeEu2AZKS6ldQwiXvz1aBlblcgzD1Y5QvyCEK69AGKUNdlxJ8P7aIhF3o0BMX8IPMdMGKy+53RLs4MRTm8hVqwmaxjyAqnkuFIed2FEEtHwcnnLQv6mak6+ZlqSCGrVj9g3zdD0p3iB88bk5KQolyEUOGfRsU2XBKG2FJZijTWN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9/8qUbHBO+ZdA99CkSVK+Eec1ubi0kDdOElr3KCI7k=;
 b=qUMyI3pc7Bykl3bpaucZFtQOeacON+rRloR0MtJuP2j2q5rhWwVDUbvNHwIi1oUiuGfOiLIfE1+jnYMxDOM1ZJ9ClWHiQoB1vjr08qmGRN1kiVj6EyGorKJZQ+BQTtMoDH/4RwKDxycBfjuKavDgN55Pza599VF1bnLIifeqRwI=
Subject: Re: [PATCH 02/21] libs/guest: rename xc_get_cpu_policy_size to
 xc_cpu_policy_get_size
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cdedfe67-0632-b40d-b1ab-206ded76a81f@citrix.com>
Date: Wed, 31 Mar 2021 20:03:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864c98a0-9031-4558-e5a5-08d8f477ac12
X-MS-TrafficTypeDiagnostic: BN7PR03MB4516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB451636076F30DC91AB1479C9BA7C9@BN7PR03MB4516.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LLThX1XH0kJ/ZGmpREqj0fRmYOZWWRiUPX8mifrxxy8HtIUrTFxyw8Olxm/swrixPSDhtVidr5QZVDxBF8ZULVs32js7cEFDe9klK+iTeYFACimpvtsPvKDAqnQ1PViK3dOuFt+vYgYh5FXahun1c+Q7AqqMgg4dxXUkFE7yktugpXO6uBHTcHUu8/TLcvtZA1ZcgEo2/5OdHPVCv9/XB5KKD0kpzHqexaNJo3cfESDa4Wt1+3pMcr8+WUXTT37+YuvX41m3tZFM1JuRkYJjwvVkH+6hu/zg5AacQF98lbjYVVlFAu8sH+7+B80/meg3IkwVJBwx9WqgUYS8Qo2gB2NlBw06HgndG3Av9HksOfJb9mpF252vv6lunSSR8gv78l78tckeSWCE5wuBfpeu+OYr9rmJUOkYdlKXjdhL87L4zuvBizyR2oJPJ+uT1kwo4xBEp3LZBrR3YgoqoruMa7F/Xp95Mzflawx6hFuRPrDGe+Fm80/5CWZtqhWYJR8EoHRtox58ZmMRXUXyYBYu0Ub27dT5BSVk2OtCYQN9sWnMZHujaE6QqJIxeUgWZNjUN+7sth9cCQa884uKZwT+B2F5vZykGqyFdJSshZ2az/8JQHQmspW9rws2AW2JkyRkPEXGta5UwbomxDFQD3hx/z1y/2jyOD7ptLrzp2yvXZIbXTLn55qPY+ilK4eygYOcYyr3EVbTIRX+NiQbO9KqQJOVTAfWw86MCBKYjcFZYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(66946007)(956004)(66556008)(4326008)(31686004)(86362001)(31696002)(54906003)(53546011)(16576012)(6666004)(26005)(8676002)(36756003)(316002)(66476007)(4744005)(6486002)(5660300002)(16526019)(2906002)(186003)(8936002)(38100700001)(478600001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWhPRnpGS3pzNDZOcFYrK1Zsd1F5U2l3Y2lLangxTGhFc0diaHFSVHdpdkty?=
 =?utf-8?B?L1BZdGVMRkV4RXE3cTQ1N3AvNHRjWjYvNng2UzRZTHM1TUFRQ011QWlZZEVj?=
 =?utf-8?B?dVJQMHl6T0t6MzBEbUxRc0tnbkpzc3ZVM2VrajMrZi80OTdLaEh2bkdkc3VP?=
 =?utf-8?B?M0N1bVFKWE9OTS96cUhqd1o5Yis1TE9kckJaOGdadHhrckRxUmFQS3FGcEZJ?=
 =?utf-8?B?WDBVTGJYWldnVFZ6UDU1VXdQVjZNVExpaHRQbjk0MU1ZNnErQXV6Smp0WFkx?=
 =?utf-8?B?RDBSQ3N5dHF6OUpMVEVqTkNIV1Z6ek5IdVk5VUFqQ1o0LytyNkh2OGRJdXZ0?=
 =?utf-8?B?UG1ERTVrUmF6VmV5eWpBdHI1MlkwcnhULzd1ZWxDN0JiUXNYblI5UXZCelhZ?=
 =?utf-8?B?eXhoVlBXWCtDY2hBb0J4ZEVZWDhrQlBvYlc0R21ZTGlaSkJ1SktFTW9qY2dE?=
 =?utf-8?B?MFlOMEI3ZmJoMWtpbHlxeVdSL1BielJML25nSTlsQnU4aXFCbTNhVFg1Vktu?=
 =?utf-8?B?cmVxSC9JNUIyc3l6ZThFRFI5SGJPNy82K2laWktibmZYbzhYbVRZRW9aT0ZV?=
 =?utf-8?B?ODRIMm1FZElnTkk5SUtxSVY3dXpyYnFQQk5hbENPWUcyZkd3NDZkdnlTL1Q4?=
 =?utf-8?B?TThaZ1pBSElTb3phWGFuR3hUQTljdTNRZ2NTUEhrM3gxQkFCUldPMnhCUnZS?=
 =?utf-8?B?ZEZYYjNKZVI3Z3R5aE5mYnJTakFKdEh6UCtTS0EzWkRkM3N5ZXFFUzhtUTIv?=
 =?utf-8?B?akpGVm1Ga2lGcEx0bVpxZ2w0bWdsc2dJMStJWmNOT1RYQnJBT2FrOTBwaldu?=
 =?utf-8?B?WHRrVGNYSE5VZTBBNll5R1B1cFZ0T1NWc1VZM3VkY0ZmNjNCZkZLWkNjNjFS?=
 =?utf-8?B?S3RLUXZNaTVGenRYcFh3NE15cGw1WVBRWnNZaHA2dlI3TXRvc0IyTVdsV0l3?=
 =?utf-8?B?Qnh0YnI5NlhTMmhVekNEZkNEOENYMSs5bnZvMVo0S0NjekprenNUR1c1ZTlN?=
 =?utf-8?B?aGlmNEVQQm0ycEJuNHFuQnlTUWE1enp5Y2V3QTVacktLSzlPRXo4UDhJQjJh?=
 =?utf-8?B?eW5zeTFOazBveU1uRVl3d1gzYW9nbmhzRXB3NDdjOFJ6dHo1NFhxdWRDQmgv?=
 =?utf-8?B?R09CMmxYUEFRUHZ0cEpyamRPQnMrUXpTRHJwNlVDcmZQeXBTa3NSdnRvcXEv?=
 =?utf-8?B?TzY5ay9UK1VRYm05VG5sWTZTMUtjY05qeEJPU1NCa25NVEZhWGhaL2ZicFN1?=
 =?utf-8?B?ZXA0WU5mSXJ6ZVlFK2Z0VGwwL3NhRVVXbkxrVmtEWjZUVzVFaHhWTWg5SVZH?=
 =?utf-8?B?aTE0VmhOVVNZQ1g5c3BtQlZ5d3c5VGk5eVQwVnFMUmh3RW4wNDlxdTF2Vkw3?=
 =?utf-8?B?cjBkdUFoU2hRRTFaOTFET0VDUFFPT1MwYXZWRm1TZGxBdnlTR2FiZUVSSW42?=
 =?utf-8?B?U1dET1F2VE9VbS9reXRBMEVHZG9GQ2gwaXdRUy9iY0d1aDdJSFlTcmZaU3VV?=
 =?utf-8?B?ZmU5S3ZlZG8wRlplUU1xQy9LdnV0Y0c5ZUhxOVBha3Q3d0RZbVNvbk8wKzhX?=
 =?utf-8?B?ZFZFUXR5cXNHZ2hsOHRrR04yUFhvZC9pTlhCMXZTOGpWcmVDN1FiYUZaRU9U?=
 =?utf-8?B?RVhKNnRSMTVLN09zUTUwemMwZlZpbC8ydzlnQ245ci9pVVc3aFZoWHZHWW5n?=
 =?utf-8?B?YjFVQzQrM1llazhXY1dMclBjYTEvT05sVnAwL2YxQ2E0alBubFVnK1pUcVR6?=
 =?utf-8?Q?VfXDd6XHYOiX3uLEhKZJJGQsvw2DvnhmKNtieaR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 864c98a0-9031-4558-e5a5-08d8f477ac12
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 19:03:30.0159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o6y9uJgSooMCcX8BGBHG9Ml7ujtkNvP4ttXzg3x7alLd58EDkMWP5YgZEYgBRcEhY137gmNVXNM5vRaZp6kPaqFfA2bE4uV1MpeNAIAdfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4516
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Preparatory change to introduce a new set of xc_cpu_policy_* functions
> that will replace the current CPUID/MSR helpers.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

