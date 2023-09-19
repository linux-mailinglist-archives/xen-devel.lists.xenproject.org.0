Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D18D7A5BA6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 09:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604434.941808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiVW5-0001CB-EZ; Tue, 19 Sep 2023 07:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604434.941808; Tue, 19 Sep 2023 07:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiVW5-00019h-Bg; Tue, 19 Sep 2023 07:51:29 +0000
Received: by outflank-mailman (input) for mailman id 604434;
 Tue, 19 Sep 2023 07:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiVW3-00019b-EY
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 07:51:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54495b28-56c1-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 09:51:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8350.eurprd04.prod.outlook.com (2603:10a6:102:1ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 07:51:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 07:51:21 +0000
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
X-Inumbo-ID: 54495b28-56c1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5bs5oEw6q4+OsIHYmsHMIBbC9Re56Ik9E6gl5C1iFFwhjnjwsrSAqlqw2ZzUG3y1bUd70xWj6E3YbKIa2tLPdz1YPgnou7mSY+nBp3p34NK2iD8FFzmvgifwCXJAyHuwil9xSkErkr69tveQi7/WXxQUnMvoIhtvBrzZKaL9b170hMK66u8nB0ZDNplp9hg2OT6XKRCiBihqFODz1bqP4XdeZCI7mXLJ9tx1Yug0yxdNtJ361nFH4Ya9m2jtElQIdgYvquH+B5T+LKxG/b3AEudxtiO9sPe0vqFWOYKst3ObU540K5Y/EMD8jLGP7ouu6oDDJ/vz40NzesNHOH/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Cy0wZx4mmUTOS1vMY3Ywfz1Y0UFmqjfjaHz6fL+JV4=;
 b=YzNjR1u252BHV/L7PysG9B5N/EzMkl7pPmRMbci2A+XI6idPOMOrUOw/xgQuriVAYpEghg+JsxTzsQ8KUSMVpaQMWkPcJt6xn1xIjBTnpRqkbd0RTLEobTEItt9Yy/KxursLbCK2PLQ/F1ntRDeA7wbJr/bz6kkFqYyF8JSMuxfYnk6zQR6Qw8GZCXkw29J4S78u6Qrol1JUj6KTtD3la5aJmkUPKH2+Om2DU7/EVoHEDOQDN4LxZKe4gFA4K6A979JQgsW/9yun8/5wA/UBqprpO5b9pIgSeIyHGYbUGUGZhRozNIp/6tsJyQVDBX3e3ylz6lKtiAsAuOZVlSNxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Cy0wZx4mmUTOS1vMY3Ywfz1Y0UFmqjfjaHz6fL+JV4=;
 b=3dtGb+HZDtuUVsDkqn0NSSdNXdXxCoi59yrivWmS1sw5+21JUW/0KDL7BVkkERW/NAwdqGIhVM1e2uKUc6s74hbdYyOsVlgB32n2rwuUaDJVWSlPeHTyikY9ymY8h1jOi7rl1y4CmPXaH0/vuT8KGsJtM544h03U/YDxg2iF4UPRToWt7PWDw1SevPvbdmSkK2YQxsXvAbBc9j8vUwH9ETcBAdyDHfA+VhmTSxpJg/8RCM5N1WN/OVs6K06xsH4HlSccLpk/DLGp+i1MkOL7xMtrdwpev/j4W/dxnBHkt7pqK3gYa4nkZX19UUXXy81xLzR/O8wPSrCDq0fU7zLRkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <838211ca-2eb9-9e0d-243f-f8db6c1756d5@suse.com>
Date: Tue, 19 Sep 2023 09:51:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] x86/ACPI: Fix logging of MADT entries
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230913081335.28493-1-simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913081335.28493-1-simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bafc1b-0e37-4cc2-7897-08dbb8e53742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s4ZialoE6lzr3ngWUDRrTifTy4dWHQridwwedthoKNHNj6AT6aDnNFWm2DuZHc2iliY4a8v+qI3dIWyqL5B9NkL3LQBSx1YJOHwjhGrD3q2zUWXi6uIV+H3jucP9gxXPa/kedRen0OpCHGYAjOjcQKiVFI60rEikCgZWW78v5+w/z5EPi6Iep4zHt7il9TP/kH052IObFp2TlsR/s5SK0HXo4W6QqgHNEFDRArWqtjnUFW8NZo5OFtCcxwgC/AYrwkhbuHJVvAQzlHlVjnCMMSYTe6xMoA8H4U9OEVRc5RzRZa7/ovgvI/xMf8eJ5SuR6AH68b1kB+kGNpVJ40YxTNd3MumnFG9iWGfFxJx7icB6ukYU17DmwB/8EEVBAB93N2yd/cCVt8HtgAjyO3bHgSzUbWLUf/8ZLPcP0wM20ZF4FUF12RADVOqzh+CjziPGOeypaJL3GJRaJDI6Wf0WppCV0UzgByAGPLt42DPYn9+QlbFn6AcoZbzXIrlOPWtKYQC88gAlP8KU0voTVmtBXHYyqzYP8JzKE9G8odcwSxo1osEQbCvv0mPuDfKzHFSpJQuVQlLlZ6ShQsmQ2nabJ4N9anSbJUbnKeeIcms1eERFLABWGxkEFtBxT7N7dbnpoV6JecTr4XMNSVP4L8mmYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(1800799009)(186009)(451199024)(83380400001)(6512007)(53546011)(6506007)(6486002)(36756003)(41300700001)(2906002)(66946007)(110136005)(31696002)(66476007)(66556008)(316002)(54906003)(4744005)(5660300002)(8676002)(8936002)(4326008)(38100700002)(478600001)(966005)(86362001)(26005)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJpOHRiRmtQSVk2djhGaVdwUjNia0FJSFU1TVhpQzJpMEVZdzhtMWJwYjlI?=
 =?utf-8?B?T3htUG1yRmhFQml3ekNuOWw4NnpaK3BZM3BBSGdKOHRqQXFueWJMRnV0Z0g3?=
 =?utf-8?B?TEpaSExUOXNCT0FmT3hBTVdzRXFTZk1SSStZOEZZc3R0MG14UWRHN000S3VU?=
 =?utf-8?B?L0hQcHJWQUtob3NvUmNJZFNpVGpkdS8weDRSYUNqKy9vdFNDc2IwejlxR042?=
 =?utf-8?B?WkQxblkyNFBVc2UwbUJhVEptLytQRWp5ZnJtR3ZnRjhwVG9XUDFkaStOdi9o?=
 =?utf-8?B?TWQzYVhsSDQrQU9ERDJtR01lcTNDeEhJUE96VFU2NUlnSDVPc2E1SGFVRnUx?=
 =?utf-8?B?VFFmcDE2QmlaQTQ2UzRmbUVoNVhiSVFZeUNMNDFYZC81Q3hYNEprci9BVzdl?=
 =?utf-8?B?dXRNV045TmJ0Q3FQbDRWeHovTTI0clAxaEI3OVJnL1RiNWxtaTNPR3FJK29R?=
 =?utf-8?B?V200VUkrSCtienBLKzhMZTlNRk1RTEFWMTlhclFEYld1a2pSRmREUmdubWc1?=
 =?utf-8?B?VTJYcjBZeDlJeEJ2d0NCVkh1K1pNTnNmUHNmOVVTTHNoU210VmZIY21CWnND?=
 =?utf-8?B?SmQ0R3pleThDMlZYcXZMdlhlbUZvZXNIbjZNeFlMY3M3Q2VoNXkzVVhSaCtn?=
 =?utf-8?B?Z09mdnpJZFUxd01oZ3NZQW5HRkU0MUtBUnVrd2FSd1lGdExEcGpCSWdKckk4?=
 =?utf-8?B?blY1THpHVTNjODRNeXdqWHg5UkhEWjEzYmJRYnQwTnNpS2NoYjZCOE9iV2pw?=
 =?utf-8?B?ZnRmdTBWbjAyKzJHdmRwTXdsVUtCQ3U5bWV0YWFqUkVQYjlNWHF0cVlPMTJS?=
 =?utf-8?B?Y2Nva3lSckxpei9UdndxTVFQNWRMSU40T3FGaHNKQm1oTGpEVFMyMkVZN1pM?=
 =?utf-8?B?WW9IeUtzTVB5ZVdacFAxdVdpZDRza3dycnhqUGI3dFFUMEkycStmbW9VVWZS?=
 =?utf-8?B?and1TXlzVHJqVVQ4dzd1N2xCVGowTFdjbGsxdnVod1RVUkQ5TzFNTnJQVXFM?=
 =?utf-8?B?NmltS2JYd3J0OGpmYytiK25xS1FZYmxUSk5id2xwVnNZem92dW5JWCs3WU9j?=
 =?utf-8?B?OElKcVFQNEZrQnZxUHg1T2ZyUmpvQTJkdVBaRlBNVExTWXZQdjdrVTNaRlhQ?=
 =?utf-8?B?R1dHWW11K2ZySmpOWTlwMDU4dk9WeXB4WHZSL0g0SVM0bml4aDFIajRiRjNU?=
 =?utf-8?B?UGtnTlc0Ykd6QkFrc1FFbE9UdmlKQmpaVUFHejM2dmg4YUdDbXBYaTJZRzJj?=
 =?utf-8?B?dytvRnpPcGtHaThEa3dJQklQb0dBbFZxMUJZVXg3ZHh0T3ZKczZHV1dGa1pv?=
 =?utf-8?B?c2N4WlRRZFFudFAwZVRRVk42Z1VuNVdpcjVodEkrR3h2Vy9uWUhnVEJQMVp2?=
 =?utf-8?B?UGtqaEs3cDlEdkoySXhrRFRpamczelExdm53Mjc1NUhSRVlWRWpRV3E3MUhU?=
 =?utf-8?B?VnZJYjQyamkyQm53ZFlnbWVSd0hIczh3OUFQcCtJOUtPbUF5RjNPenNuak5Y?=
 =?utf-8?B?VE5oN1lndjNRQnAxMzNmQkpDSHRidE9LeFlGZk12blNCcUo2NVhGdGZtaHNi?=
 =?utf-8?B?M3A2RWdiRDhVbTlXM1BVaUFHaFRVYW56bS9QU21ocDRwdEtZL3pvak9mWHBI?=
 =?utf-8?B?STN6M3hmeXFDSUxsWnpYd0hLck9TRWtSN3BqVjF3b2dXQlZWMFZWeEc4eVNw?=
 =?utf-8?B?Mk1ZWU9UYU4zZ3orTjVRQXZLZFVnaVhJNitzOFNFSjhVdXRtMnJ1VSs4S1Y5?=
 =?utf-8?B?dGxuaEM3a3FsU3o4Z09aYnhqU05DZG9GRVdSNEhyM24zUEFJbm8vYlVzbHhp?=
 =?utf-8?B?NXVOd2c4Nk5rbVlJeVlvczJKNklmSkZYTktlTThtblEvSm04NHVBM1E4OHpD?=
 =?utf-8?B?V1o5dHlWYm5GWnVxcWtMU1NrRGticGx5bmt5MlFpZkdXTGk3THNiRWxDaWNL?=
 =?utf-8?B?THdtY2ZITVNtOU82dS9wQmtPMklRaEVmYmxjRHpqeE93aEVjbE96QVFraGJK?=
 =?utf-8?B?Y29QN282SE5Semp4anFhWW9Hczh2RFZ2a005cGh6OVloTFNRbWE3SEdRN29a?=
 =?utf-8?B?OENjRmM0Vmw4STMzMkFYdU90U3J2QzN2cGZMaGkwSE1FVzhnZGZPeHMxQXE2?=
 =?utf-8?Q?it3KwcIk+WXF7vK7dXOA/KjXH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bafc1b-0e37-4cc2-7897-08dbb8e53742
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 07:51:21.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m378/Od9f3OA7kxTS2uIUx9WLlPzGQd+dn/rfzGdp+4IN3ilsfG2m/knbLGTGzurFcrzCFB3YcYBJSPiBxf6aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8350

On 13.09.2023 10:13, Simon Gaiser wrote:
> The recent change to ignore MADT entries with invalid APIC IDs also
> affected logging of MADT entries. That's not desired [1] [2], so restore
> the old behavior.
> 
> Fixes: 47342d8f490c ("x86/ACPI: Ignore entries with invalid APIC IDs when parsing MADT")
> Link: https://lore.kernel.org/xen-devel/0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com/ # [1]
> Link: https://lore.kernel.org/xen-devel/f780d40e-c828-c57a-b19c-16ee15c1454a@suse.com/ # [2]
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with the implied ack assuming that the support status of physical hotplug
is going to be changed, and hence a revert of the earlier commit isn't
going to be necessary. Stefano - what's the status of your respective
patch to SUPPORT.md (which probably wants re-sending as the root of a new
thread anyway)?

Jan


