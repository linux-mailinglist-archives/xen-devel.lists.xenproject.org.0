Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7923230DBC5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 14:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80935.148498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7IXc-0008ST-F5; Wed, 03 Feb 2021 13:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80935.148498; Wed, 03 Feb 2021 13:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7IXc-0008S4-BY; Wed, 03 Feb 2021 13:49:56 +0000
Received: by outflank-mailman (input) for mailman id 80935;
 Wed, 03 Feb 2021 13:49:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7IXZ-0008Rz-TC
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 13:49:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0945355-5cd7-47fa-9a63-74b7e697c97f;
 Wed, 03 Feb 2021 13:49:51 +0000 (UTC)
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
X-Inumbo-ID: c0945355-5cd7-47fa-9a63-74b7e697c97f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612360191;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BM5rbNDvpLAhzfHLtpQKarJS8b4zuYq0VYVVV7hIGls=;
  b=XUrb/shIP0Iiq5wXmHC4e921uKbTMqjBjFjPLvtEaF/1CsEJ3lJv5yDQ
   uCTFEZVLSVPTEZRx7pWgTFgK+xv9lB3GgL92ynh11X9Jl88HDvCNESyhX
   ZIn77UTv0kH1LYlkOrwU4Ph9Vf5FkENiB8ZneCybkxq3ER973aMfrzclG
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jTwGnrfMLhmo3u8KW/jVD4B6MpxjR7Q1T6hzpTDHf20yf/VKqZVNEn0yMVqmNGoDCKRnZ/4Je0
 Zg5BvYsWXVeYgAyfpvJjJF7UM7nOAet6Wi3Y2ZUucqnM1HS8VDEorXuHVcjOPcNSn0xu+i19lz
 bpxhyKPg/KU+TwtH/F4ahbziV7ISrqJa7jIeJhnXCDCvRp62cStKNRI9TBIJTD2499iKwLCrxW
 4ZdItRLh1jXf9uXIG/rZGpRmPDiWmwvX8eZ6Y9+SqlnxEmrLejWf+aOt7ZePQkXzvlyIMi1iin
 lx8=
X-SBRS: 5.2
X-MesageID: 36655966
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,398,1602561600"; 
   d="scan'208";a="36655966"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiQVfT9PRKyxTMPQwbxproldu81UC2uaeHwvGZrHv2FYhvCiMc3XVVDOVHm1qc/cuP9ga+s7XvsAU6UoFI06UYeN73IUmcSMFS2AkJBJ9fxIjKgPBi6fQ5J1YhallNSaBbz5rTYhjERKzg+GTGaO6UQ1qSz7ghgqPoXJ9oUsJ3lT7WbY9yZORvX+UsE9UQWFxWpMr4RvOmKn2V320yINyDi2xz3IIBT+tVharzyMcPi92OHkxz4ik41pNAosoHk+b9hugQSobFB5G8R+QXzsP3gtopOE2GYp2uJdDJOgZYvfgG84MKKGmCmMciWh3+erDYTOuWpEHH6vI4HiPQTXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BM5rbNDvpLAhzfHLtpQKarJS8b4zuYq0VYVVV7hIGls=;
 b=CIRGzGHSmFRwz20NdfTOTCnEZm1N1UZpUDU3c+dDkAZWH0tf2bvSMnRQYB4FHFzrtm5vXWmFIT2f7itikSlguijZ7rh9+N0ZwG6QIebEhJyC91y9YTZ/1xGzs5XzswbpuBvATSEeVk/fyMcy85SLResOzUaVVrPaw/NoGJ3+6r3gPxO27s/4JMRV+8Iitvws01/YvqzrmWGLxMmkTEZPobqsBZtnjxEUfawNISR++pC3I3QdEBFsw1u8qYptTFs48tUn1YR5HTbZpkXys6ulYsnZYeatXsgp7H4X2sny6dWG0trkxxdbQc9kp9Fv8x1s6t7o6ZRHWsmp0bS7C/QgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BM5rbNDvpLAhzfHLtpQKarJS8b4zuYq0VYVVV7hIGls=;
 b=so86SbCxf8mJ7GE+PwReO2yPLoZZh+aLIQ9d/WfAir3kJcORiD1jXFd34tcfJ4v5J8h4X9bGAae7HfYsy7vgv6O5+HHU/m0eGMnQfomeWb8nhU6L/HC+V1nsZPYn02hhdS5bMEyjO1mWPyj2lwdvmmeQhPmgZLBRXt0u/9Ck4uY=
Subject: Re: [PATCH] tools/libxl: only set viridian flags on new domains
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<tamas.k.lengyel@gmail.com>
References: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <968f9f91-72c6-2070-075a-308a2870d6ce@citrix.com>
Date: Wed, 3 Feb 2021 13:49:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::18) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c4e4a75-d2d3-473d-bb16-08d8c84a87e9
X-MS-TrafficTypeDiagnostic: BY5PR03MB5063:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5063885DB0E687104590ECC5BAB49@BY5PR03MB5063.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezbu2InLRJh/0czxtdE6r+ZYbhKeQ39FE64wMTNsfYnPXlSrp0h+SqwVyYVH/RZRDykCsQyt5EdCKi60isg85aXMjBofHlBiIZjtEPpZHnrMryzAf/5y+2he4CAK0TuMzhLhK/quzlvMJsUNiuCRt5x9eTWiWseh45M/95eT2MJkMTziquZysCGZ5odk8+rdh7+1xuqaV9OTC9PtMtihqFZ9FA3keVyUnBNNLf+gWLJq60huT0IPwX9HU3mU6W+gS/dBAKfslvZfj5VgoewCgmLtlw4YadmVMjqYkzfUoaERT6TltBs1t+ilsTTQJCer40zri7RRHYhYitp+fvg9PpSbqARJWtea2gPwy36//EWkCnNhkkqG/vP4AOTjTlbVpVL5NWebDPF13uUJSpxhVsB8gEB2jJlByLeXRucN+eLNRSBngBvFwTTYjIf6kBaVCPPAEB8jFWrJYoHxHvEz1a1FFrlsqs0xpWIS07obYFTtsdRFxohpq5G2R9e3iKsJd9fwPFPs2Noek6MUy+qlnzsmCrIX9hvcv/OEUxCKD6O/M99Miydm0WgwTI7G7F61jfRmBXLpS4Xxtsk7nF4fmRAfnNCq1BFgWx4cfE7RMcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(86362001)(8936002)(478600001)(2906002)(5660300002)(4326008)(66556008)(4744005)(8676002)(83380400001)(16576012)(53546011)(31696002)(2616005)(66476007)(26005)(66946007)(31686004)(6666004)(316002)(16526019)(36756003)(186003)(6486002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlRCa1hjT0FIVE5WNmczOGtmNlcvcE5mUE1mUWdwU2F0SlBCaGcwaFBOdWIv?=
 =?utf-8?B?TVBlZGF3bmVPTVdMQ3pUbXc4dERud1ZzTHJmbUFmL1JUZzJKV2xUZTRJZlFo?=
 =?utf-8?B?UkdJenJuM2pHWDM1bzdodDRUWStLZzdZUXZlZ05VOFhSOFRYcGNVL0NZQlBN?=
 =?utf-8?B?NU9OM2xCNTB4ZEhPZmJlcEZYOEhocHpYTjFRUjVTR0ZLVGJoRmlNVkJtQ3Zq?=
 =?utf-8?B?cjhkSXpsRitNZ0o2YWdZQURSRi82Q1JEc0RkMUFhN2VnelBmLytBWHc3NmNp?=
 =?utf-8?B?Y2VWU3ZybFY4Q2J1VU5pc0tpOTlMMDU2cWg5WkJiejFIdGszaU02ZWVRK0hj?=
 =?utf-8?B?T3FscFpXODhIdjkrWFc4cDV5VVJ2UDZRMERlclJtaUJQSmM2ckxWRDNudmlw?=
 =?utf-8?B?dGVMZm1JWkxicUhmNGZUNFZ4N1RrdE8raVBCbmpXLy9ObW9hdlo0bWxYOTND?=
 =?utf-8?B?UzU4MnREeGJyK2RvdGJibTdDNS8rbnlNL1YycFo0eUxKZW4yUzZCN3JHbzN0?=
 =?utf-8?B?STJBVXg1cml0WFdIejZ5bXZ3UFJXN0kzbWd1T1FnV0dtK2xZajluUjdaV3Bx?=
 =?utf-8?B?Yng4Ykd2RTdmRFVNK1pJeHhkMHpINGU5MVd2N2dGVkJtbkZiR3ErbDFYZ09p?=
 =?utf-8?B?emlhVDBPT0hNbWlCMHc3YkduRGZDY1hnemF5cEVsMGl3dVpDbHlKTnVmY3Uv?=
 =?utf-8?B?eU9aaTlsMC9KbkozRmxMZ0dTeW9odE9rM04wYTBvTkd3MHJXV0JNMTRSWlFU?=
 =?utf-8?B?NW5WcUhodGVmTjAySnJsTkhBN1dlZFYvanlFa0E5YmZydDhCb0ZpZjRIYURN?=
 =?utf-8?B?NDVaakxGVmxPNnRqN3A0U3NQcEx3aEZPaVBvSkttdUFaeFJUcDROd1NnelV4?=
 =?utf-8?B?eDEybDJJMWY0ZFFYai8wRnlRRXppcFNaYWFqbXFnMTg0U24xN3A2TzFadUVB?=
 =?utf-8?B?K21JYVMvY1pWWTdkUXY3M2ZpQXgxem9BdlpVNElsTUt6QVRPNWc1eG9RcGg5?=
 =?utf-8?B?MjByNjM2a0RVcXN6M2dJVGtFU1AwSFNNY01GbmhpQlZHc0ROMENOL05RT24w?=
 =?utf-8?B?VTFIanBYQTZQQ082ZUUzd21BVndPbEJLVWFUSEJhNXV3cWxQY2lTa2ZzQ3RN?=
 =?utf-8?B?WnhkWUFRdk1uSEFneXArQVF2TnZkbS9Sbjlzc3IzUnVzTi9jbUd5WFZhNVEy?=
 =?utf-8?B?aGpOMWVMOHdRTE1ZRXo1T1c4NWQ1aE13R0FNTy9aU2JwRWhBOC94NzVSNlda?=
 =?utf-8?B?V2s4eU40dTdOZ2gyMWRRaTNsVXVndUJRWFdJRy9jV3NwQ3VZYlNxOFF3dXFP?=
 =?utf-8?B?T2JXK1hoZ3p1cTZOSkVBelh4bWN2ZzhScnRuTEM3QkhadHI4Szc1c1gzdFhE?=
 =?utf-8?B?V0FQbTMvUzgyYlBHWHI5aUJjeEJ4SWcyYkk2Vnlra0dlUEpsVWVJeEIrQlc0?=
 =?utf-8?Q?ULruglJ3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4e4a75-d2d3-473d-bb16-08d8c84a87e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 13:49:30.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf/zmgaalofJ765Stft0ji34xTDupnlYXvwQ3f0sy8un+ncWqUZE7MuPwHVMoZhX/7d57FGRtTvRJiEKFEGKMNrHQ/2RtokInWDlrCqPpcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-OriginatorOrg: citrix.com

On 03/02/2021 04:01, Igor Druzhinin wrote:
> Domains migrating or restoring should have viridian HVM param key in
> the migration stream already and setting that twice results in Xen
> returing -EEXIST on the second attempt later (during migration stream parsing)
> in case the values don't match. That causes migration/restore operation
> to fail at destination side.
>
> That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
> extending default viridian feature set making the values from the previous
> migration streams and those set at domain construction different.
>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

