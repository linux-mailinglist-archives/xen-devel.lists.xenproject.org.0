Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3CB2F6ADD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 20:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67521.120589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l08Ey-0006WB-E2; Thu, 14 Jan 2021 19:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67521.120589; Thu, 14 Jan 2021 19:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l08Ey-0006Vk-AQ; Thu, 14 Jan 2021 19:25:04 +0000
Received: by outflank-mailman (input) for mailman id 67521;
 Thu, 14 Jan 2021 19:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l08Ex-0006Ve-5Z
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 19:25:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 158da656-9e3a-4a54-aa8f-aeac3bec528f;
 Thu, 14 Jan 2021 19:25:02 +0000 (UTC)
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
X-Inumbo-ID: 158da656-9e3a-4a54-aa8f-aeac3bec528f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610652301;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bDz4xiUlXuiHB+TEKsmn4uxiSrXCyE4MKCHUWoR8K7U=;
  b=hviZlDzXQIDoUqgvFk1rTZEm1+UR+PmAHxhuoG3WWO8ZikWJm80S5J/y
   /IrYfPeAo7gJHp6kHQXzVsIP4wiKWLdL+rNFh+Qhhjadjf3F/O0xYr2sz
   f+5t7yvUXpyXWhQyuGBHcY/Dsi7K6onFT9dj9ffdQl6c7lEHkNbfJIFv7
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6jhYuhaTrJFe7RqaG8YH+vSKperP+o0GzE8+EhYLIl6gfYgOrfioNQeBluD9glI9YYYzUQa/Xl
 6No8jLMhbrSBBLnhccDZbqFqI7ulki8az/MT4KDeuJ+H0zSaJHTblEszwgYLYyt02MsI3H7hwO
 44sMG6yCvVuR29VsN7IjyQ0Mf6SBjpO513B23QGGRufwkK+7q0+AIZ27i9RRL1XiI0Kia4zXfQ
 DWyORH/pft8EJvC0pHVmxjTCjQG33BU1rfaX49e51pYsy88NBhYQgQPjD84BPLhJJlSgzyUbK9
 POw=
X-SBRS: 5.2
X-MesageID: 35165733
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35165733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF7wxuC+Xk9o/U+0jaz96xYo3ZikCIwioZ6KrlP9RSGuWeIMxx5IO6OHFASve2jCQxxJ79rvs88uF8V+Qsnw/d6Q50KKFaCrUX9UUScvoCt6hV3ysTCbqvnIyGFy3bhG7TMsV9dW34jz7g/aTgzEOhab1w9qOnVIwDtzsoCK9+Fx/XSw705wCvmNAw38QwdZAvS9cE/XTde/vJRzJCZWE94sr3viyNpvezH5+bMTFeZ3we9Drxvu2kVQ74WEw4pThjRgjIB0nfj9jB3izYLBD6k5r//MLAEZBto+KO0cr9oeGjEMvKl+lUrHv/GdbLJH/UDe9CO+jJRVT5KNJGBYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDz4xiUlXuiHB+TEKsmn4uxiSrXCyE4MKCHUWoR8K7U=;
 b=f+izFOic2DrLqED3weOjhfGksI0PIZiZ4oxM2eW2QFpbE78A2zo85dC3+P8VHK2EoyLDdae8PizBGBhmMsAjEyfvBFd3Wg/CYWZt1a7XLuCCIkgGNHK2rH2Dk/B79s22U6DDV3mEEOz5pZASON58PzyzW6+A/77yotav/ANg2Cyy+RDEu+qeMD54Jq9qvMFOwYuCA1iuMDaNErJEkukUIXaL9V794VHJGIptltlPOJijbLt8xd/G9l58Sfl6/zYB06f+TtLDr2eMu6f5h8/vwX9CcQuQELRyt87yksXpXgZu/b3QEngdtgt3xu4yDRlEH9j2Xta9C/GGfIgBTbA2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDz4xiUlXuiHB+TEKsmn4uxiSrXCyE4MKCHUWoR8K7U=;
 b=jWFxyhqrO3sdG3n0Fbs9P51iLP7mXplBen1U0UPwmIsBj9eMAOkEWX+6JNzw3jDAPODuTSZ6FnOSiti+rMFs9FmHIqTjD5filXDkSc9Zpyx50IsjaknAom8Hw0WB6kJ4paWO2GBBkb2HNl0eDBJWQAc/7M3fri+eSXci06VQX/E=
Subject: Re: [PATCH v11 03/27] tools/libxenevtchn: check xenevtchn_open()
 flags for not supported bits
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-4-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fb70c415-3bb4-9420-d741-d621d5bb01f7@citrix.com>
Date: Thu, 14 Jan 2021 19:24:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114153803.2591-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0162.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 388bbd51-ed69-4dcb-156b-08d8b8c2142c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3783:
X-Microsoft-Antispam-PRVS: <BYAPR03MB378339B3CA489A3BB77D30CABAA80@BYAPR03MB3783.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VXyBar5w6QB4c9Qz7H3oyGrLG0upDjv5AJjiULohtrFHmwI4IwUDEkCkWocr1pGX+14C+ZABIGJyHtQgzw08eWSN82zETuBfdYCdkW/Q94jtcnBt1aHxkPhFT0E8sn6jmV9afipTAODXlBo2Set29QY/8K7Yca5Yi9d+yTQhNTQ111B3tg9md2a+BKL36zOvJprN7ifRAc7RPrAxpvtkwwxhv1KbNRZkJJUVu+sn/nPiViCYk+CSH90eE5kkD5ZnGPFtb9YoYWGXEbSnN6XraKjGHlWLOPKJIhi3ckbovGZmHXvLzZTPr/nOUDM1wynJXEFjgPRkhw8K++PNsO50e5yaeBF7gKVvLwzcNTSB3FBIdi33ZcneP+uXviA4WvNOTaw3wOhEIYEyLB8l5edFjNzrzuvra8ur15VCIYShn2SLdbQjEGyiRUXSCvmiuDORk2fsANWXlBrQvkHn2fY7VheHX+6ygE65hAlr2ltIRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(4326008)(2906002)(53546011)(66946007)(6486002)(2616005)(26005)(8936002)(86362001)(956004)(5660300002)(8676002)(16526019)(186003)(31696002)(54906003)(478600001)(31686004)(36756003)(6666004)(16576012)(66556008)(4744005)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVJkNkYvSEx4Q3JzOCtNSFlNczlSNUR4dlpVL1FJNU5tbWNEblNxUkE1TlQ5?=
 =?utf-8?B?V0hIOWh6N1JYRTIrLzRDVG5ZRkpsZXk2K3M3QWVUVmdHbWFWK3lRZkZRYTBL?=
 =?utf-8?B?Z2F6OUVFMm5lZFQ1cHRXdHVnZlJWNHluMzRHK1dwckFoU3ZrSVRmOGZFSTFl?=
 =?utf-8?B?VDM1dzhaMnFyR1BzRWNOR3hXT01GQkxOZmVzSVFVU3BOZ2QvQXRMRXBEQk4x?=
 =?utf-8?B?K2NNMTdNbHRZb1NCM2VKeXgyMHZMODFzUld1ekpDQ2tyU3hJRUI3WFhvNTJL?=
 =?utf-8?B?U0IwMGludWp0Q3lXazByTXJ4TkU5K2FXRnNvQ1dhczVKcXZVaTJlVEVYekpj?=
 =?utf-8?B?TlB0Mk9GMXNhS1BGNkI4bmhMdUNpb2tFVklBakdpeW5jRFVUWDd4ajhLbmJY?=
 =?utf-8?B?c3pXcWRWeDBTaUV2YmdvclRMU0U4R294N0V2em53d2pZeGZqOGZhOHZtdlNo?=
 =?utf-8?B?SmpMaGtxNXZJalYzR1FsRldVZDFyeno1eGlIS0NFV2JEVEJZWmxFQlIwMm5q?=
 =?utf-8?B?eG9nNE0rNU43bFpuSlQrNEs3TENFN3QycFNBZm5zcGUrVG9Sa0VoVG02Q0Fm?=
 =?utf-8?B?SFE4cWl5K05uRXJCZUtCWHJpb0l6K05iUk9JV0hQNXFxK3JQRFFQOFpaY3RL?=
 =?utf-8?B?Z1Rzb3ltd2lBUGcvQThFa0FUaExsYW1jdWt3UVc0U3J2K1VSZ1pLQ1RWVmZx?=
 =?utf-8?B?YzRteTRQTUpCRVJ4cGNkdTFuem5HSmdsdG5DbWwzd0hVcVp2RzBoZU1kSllQ?=
 =?utf-8?B?NDB0NUNzWElCVFFYVjJrT0Q4eG1pUW9Mdzc1NSt2YkNpdXJhQzhZRG04a0xu?=
 =?utf-8?B?RHd0Y04wWW04WUJRTTNVRS9lWVFtVWVTcTl1TjJRaGQxMWgyK1BIQkcyV1o0?=
 =?utf-8?B?VVNjT09hU2trTjdlYjlRbng1NnBxbGlmN291bnBjanlqZWJtMEdVekR1STkv?=
 =?utf-8?B?RG1kc1hnUWZDbGY0c0hNbzc5OGpiN0NhalkvQ2haaTZjR1VqQ1JrTzBmQTZs?=
 =?utf-8?B?NFdQdXJiWUhTMllmS2FjT2d6RTlYRmcxZlRtc1d3Y242N21GeDRldDdxdXpr?=
 =?utf-8?B?UW5LMk4rL1NVN3h2TFZoNmtoYitlQ3VaZjVjaExnQXcrQWk0cjdFcEM2VTl1?=
 =?utf-8?B?anY2emdUMnltcFhmZzZUVkl1cDMwTGJETk1XMHo4ZWIyNDRvRXJNVmNTWWcy?=
 =?utf-8?B?cm1qU3NHU0RVbTNTSUtXdkFIeG50allpOStQcnNhMTh3Z0JCMGFaaE9hRWxS?=
 =?utf-8?B?VDJmVFlhNUJWUk9RUFpGSTZrTkQ4cWZkNzFjSHVQLzBjTEx0WU0xTmsrUkw3?=
 =?utf-8?Q?rIcUBbm0xJgyh3NPWwLaswcuPxTt8YkJqb?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 19:24:57.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 388bbd51-ed69-4dcb-156b-08d8b8c2142c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzUO8BBipVBfJbiJX9wipbvzQV5rF09gdtgEe78MlRiOlJbjb3pRCriBWtMbhWZi5mJfRI7G3buXLa4FpbzR8rNujdDJpBSFNAR5+KOcuOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3783
X-OriginatorOrg: citrix.com

On 14/01/2021 15:37, Juergen Gross wrote:
> Refuse a call of xenevtchn_open() with unsupported bits in flags being
> set.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Possibly worth stating that this potentially going to cause problems for
callers who were already passing junk into the flags field, but this is
far cleaner than the fallout of slowly changing the meaning of said junk
slowly as we add new parameters.

~Andrew

