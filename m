Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EDD6E2ACE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 21:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521237.809684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnPVh-0001wk-Q0; Fri, 14 Apr 2023 19:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521237.809684; Fri, 14 Apr 2023 19:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnPVh-0001v2-N5; Fri, 14 Apr 2023 19:55:05 +0000
Received: by outflank-mailman (input) for mailman id 521237;
 Fri, 14 Apr 2023 19:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR8y=AF=citrix.com=prvs=4614ad092=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pnPVg-0001uw-3j
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 19:55:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cb03373-dafe-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 21:55:01 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 15:54:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6975.namprd03.prod.outlook.com (2603:10b6:8:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 19:54:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Fri, 14 Apr 2023
 19:54:47 +0000
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
X-Inumbo-ID: 3cb03373-dafe-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681502101;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HU4y5Ha3VG9lUue6H00gsQGFZ8wM4KASEAKmFuchASc=;
  b=d9OvXNJjbdg9Yhka0x5yVFTLCBkoQBET8fIQekjZBmUWoC6J+CU3Hrma
   Y4ymdEVEamStvtcITYhVTmUe8gHxszm+OjU4mjMQ4fwXZrNjtncO5sA5A
   lA+X+DzzyCRQfbQ/UIbJTWsLNF5AoRY16lKdKD+DHZ8FlI4j6AXOvGJJp
   k=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 104916228
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TqSPj6IQUKjQfAtZFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENSgzcCn
 GBKWm6AOK6CMzD3c4x/ati18RtUvp7RzoQ1TQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gViPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lWT131
 MEWLgxSMEGxm7KrkeqSFeVj05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunCdtMTufonhJsqFi6z2ZUMgAqbxz4+KTggHebdYxnF
 GVBr0LCqoB3riRHVOLVQx25uziFpVgVA95LFOsS5wSEy66S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHbylbSwIAuoHnuNtq1kuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:/HMDQqFpW808v/ZMpLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-Talos-CUID: =?us-ascii?q?9a23=3AwNmbZGlnvjqL/87RG9nqmtHgFWDXOW+FkE7xHkG?=
 =?us-ascii?q?+NTk3GY+JGULBoIo7n8U7zg=3D=3D?=
X-Talos-MUID: 9a23:nu7dFgi6LBPVdiNToAigP8MpMe5h6eOUFXw31tZf5pCODAleZQ+ipWHi
X-IronPort-AV: E=Sophos;i="5.99,197,1677560400"; 
   d="scan'208";a="104916228"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIGLXyDojC4rX/JGQNaeOeLzli6WyYyF3FhiTeAWcOh5pyAp12FD2+bGOurDyp1fnZ56QR5dLCXQbC9i3mtJItA2gKHBpx+1iznwxtGO26MjnxzNcUeqiDd7wUSoySOX9Oir2CDuSM5/CV8emJVbDvXb4lrQxxf4FXS1Qx5z3C5jOHU0gH/dTrTQfjLbXvqISaH8hy5BP8Uqh5muj7yYPVPv7Xgnk1dPwcqD6WOhsko0NpkPVuBZArTfwqRVnd8ouuuplLBr999lj2jY00Bi8GDswKRIOA3AP1mOYFRDLo9OZBv98Pho9B2WrwbDI6lcJRfROK/yHH0uyqJEEuVODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Quo075gM2E9iTDF5hDm7gU4UCvuyM8dFgPdI8ca8564=;
 b=k2VQSq5wjJrpykZVlYmBYJSxAK4B6BGlyDqF/wSK+Ep96Y0yeTo1aLMY51Vo5ye5KxSDiLVz2bbEE0YkdfjDmfvyIn7vAPLtFwf+QdcqgwMeg+vAZPzl7SPzlxwmRQWGbMPElu0eoam4I7izcG0ojBTr5TNHjj+BFaRN06Tr6jemvcUHePK6k2YU80Q7iKEOArrBdfiB0NPZMjNYxlhYAAm7SiUA2CuASAqxyoJKmJiHi5bEo4enUj3xAPSApfUB4SjDWSKoq8pzM4KOHFX2y6PFShJF4nkz0F9dHWqnDnOktBZrHu/qDgmktpRpDW0iVc6x9YxRKNYZSLYmi1nbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Quo075gM2E9iTDF5hDm7gU4UCvuyM8dFgPdI8ca8564=;
 b=K2/T2v5J8GbWD5iAmReZPawYO827K8DTza2Wc7PKnhpuPYS7t5stIGVeOGw/dntTkwd4vjVjaKaRnNv9yVVBnaayI35ma60xXp4Ag3CnlQxBAX9f3iiAGTFkfId0sXSPz1HRswD2DsH/pQ0X+7b7T0AnWSb28yFG4KFv+TyT22s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <850fc508-356b-3d12-f6c4-ac0a8dc9de8b@citrix.com>
Date: Fri, 14 Apr 2023 20:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: x86 instruction emulation backstory?
Content-Language: en-GB
To: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <56d02462173267603d7af1503d2e67cb88f2ad5a.camel@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <56d02462173267603d7af1503d2e67cb88f2ad5a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: cb196cd2-775c-474a-43f0-08db3d22190b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U95BEPbdCA2ZWHDHGBUG3ueCFfiuNYM5NIrAGlgJJn+86uZtbusn0joQ/fIrLVHrXSRZIBbtCtBOfjh7Ml2ZC83nevWw4DLbwbqXMBibr2DOkUFxEHgsBqT5H+fBYtLFtefVYNGcNOovMxbx2WKP/sNEN/WQiy6KNtzM+K1Mo8CcVDR9PA5dgwVCKip7CJC+FnFv/agB4Vrz6E+UNbinO8BBxbqCDvc5mb3KlR6u0dywYhCJnTioiqSpcS9fBKurL3qCBjJaCQVyBbEKHoQ55MyUYb4eNgh3uEFDSBmM3Z0M5QNEguxst9sOoLPx0aChnL+x05IbLI2Zl/RIm+mhS1zBpQ1Z0mhaEpSENcsZgYVHVJQSIo+xzZmGzwuJmoWSd5HAxlNjd9v6Tb1LCRD05/USIWQOvHcrR4MPdqjZ//smu5Zq/Ils8V7kiks2zBaRvh+yXASWjWSB1+Y/QTt8BW87PvR4elXgepyJVYENGrFZziC2wAnmDvHAK5GRS07m01lAAXkHKmhN6+OF1a5cGm8taVrd3fkDz5EdKuRVmApC+DZdpNS5Vcx8XnvfD+i8Pzy3PEaMEb1RyEqwT8ZrtqiD14jBsR9nDI1uEy3QBsmJaVOvWBC2Azmt3jVTtOhhqLsu5hUqrWZcaB7NwOxOzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(6666004)(5660300002)(6486002)(966005)(66556008)(2906002)(66476007)(36756003)(66946007)(86362001)(38100700002)(82960400001)(41300700001)(8676002)(316002)(8936002)(31696002)(478600001)(53546011)(26005)(6512007)(6506007)(31686004)(2616005)(186003)(83380400001)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjFFMmVpYmpOcFhSUFBaWjcvb1BibWM5TFdmUGFUTVVtdWNGRHlwVitudU5K?=
 =?utf-8?B?TXpoSWxjLy9Ec09rMUxLc3FyenpDSjFRcm5FUWJMRXUvdm5ERzZkSHNwVCsy?=
 =?utf-8?B?UXFoam1oM3JYQ0pFOStmSTM3Z1F5WW9FOGdCWUZvdERIa3ZDVkI2M3lRRHhG?=
 =?utf-8?B?aHA3Qnd5amZvU2JZcWUvMk1LM29pQ05rUFZPQXNjd1RXUjNUOThEYXdiVU9n?=
 =?utf-8?B?aDQzZ2YwWUorSTFlVlNTMVRVcHpCMmd1YWxTR1ZPazk0dEI3b05JODE5NTlN?=
 =?utf-8?B?Rk9EV3VSbnduWEZTMFdvSDlBME1pcHB0TU1HMGJyc21IdGtwc0NaeHQ3dE9C?=
 =?utf-8?B?YjdxcmtUNFc0ME5ub0c3VGVtSks3QWZ5UXdaYnE0NEpYWEw2MTFaeGhrUmsr?=
 =?utf-8?B?RFFLWS9rY1BDOHFrcEZBSDRVWi85VkNabjl4MTljbGpmcmYyVC9GbjFoNy9q?=
 =?utf-8?B?cG5NOWtPVFdGOFRnY3I4R3FtSUoxck1JTERtb2FSeXVHUjk3VS9xbmYrcExF?=
 =?utf-8?B?WUxXclZiNU5RT2JxS21iS2xBY3dlVWJsZ3RNUTJFUDBiaDF4LzZ2azNtcWVW?=
 =?utf-8?B?eWxkbGJlRjNXL0tRRDJ5eTdId2pSbXdMVnpRY3dvNnhvR3ZzcUwyZ1pJNWJH?=
 =?utf-8?B?MlpyK3hZVTQyb1dZcit6M3ZhWmdDVnZlY1Z4Uk95YlpTM3FVY3hxRkI1S1gv?=
 =?utf-8?B?YTVsTS9pWXh5UnVTdnJPN2IwYlRFNzhJSWNWaWRZYjBnaVJEQkxaNU9MWVkx?=
 =?utf-8?B?OUdDa044ek1hOFZTUVBlYmJxMWllSVZDRytWR200N1RvTEdlc3ZTeTY4K0tZ?=
 =?utf-8?B?TzhLWXprRlMvUkx2bklsc2FpSzJLR1ZLWitKNlpCTFdmaTBBYU53Tm55cm1t?=
 =?utf-8?B?Qk1JTnBSdG1BZ0ZaVDZGdmpvZERhYlNLa2dMRHZvZzZ4bFg2ZEFGdHRHbVVK?=
 =?utf-8?B?cVlkV0NxK2ExNWhlamRQYUNSdGp5UCtlaE00YW5DWjJlSHdNK3d4U2pDTWJu?=
 =?utf-8?B?ZUx5VXVWZHZOTDJuQWhrcnovUmJRVkVxNG5XUVhoK2JOWHYrejF6enFsMnJY?=
 =?utf-8?B?NTZBUFVPTGFVa1BBaUtVVVNEWkV1UFFXTU95MFFsRnJSUlhRVkhXZEZXb1NU?=
 =?utf-8?B?Tm9JeW9GQ1lnSGxTMjBESW9nbHdEWjRWRlAxSVZjN1MvVCs2Nk5QSnZzK1Yw?=
 =?utf-8?B?MTdtZlVoNjAwMTE1UDhKNmswenlpY2xNOXo5MmNZVVFxeUJqTklhb1IxMXY2?=
 =?utf-8?B?QlNlM0loSUhVWTFiaUZSRGNnSmphZ21kMWk3bjliUFVGZ0V1d0VlMXNhUFhE?=
 =?utf-8?B?VkpGRDl4ME5ZaHhDZnZDYTVMSEd5UGU1N3FieVNDSGI3OWFBWnpCRlJ4MDNs?=
 =?utf-8?B?MFdzN0hhMFdoUHlQZjR5ZUdYMk5oczhwa0hGYksxSXB1cHpOUDNWS0I0QkJ0?=
 =?utf-8?B?bWZJUnRJVHpZMGFEbHdhMUdBVkhkWW9xTUkwNjlWdWZQamcyallDOGFKR1Ar?=
 =?utf-8?B?bW1icmhzYjdTaVd5N2N4bzFGeHl2WVltSUhxSEZNWFZ5cjhNL25JQ0JFT3VX?=
 =?utf-8?B?QitKblVNTm8wWTNqRXZOenRMeU84TElvcE1LZjV4cEczOFJMdVFOei80SXJB?=
 =?utf-8?B?TlhwNkZzMjNoclR5ZTBHTXZKSEFHWjlMNURkVWtKRWdzNEd0aE9FVkMvck1y?=
 =?utf-8?B?VGJJdDdrNmNmdmpIUHNJSmxEeHBVMGRMZXVrRW5iRlJMaXF6elJUeXN3NUhY?=
 =?utf-8?B?aCttRDBhMjdMNlg1WWY3U0VjUzRPTEE5VW1NY21nY1FKRFhSSUsxUFVqaE5V?=
 =?utf-8?B?eCt2WXFqcTF5cENOUE9UWlowWFZqVDZXUDVLM0ZjWE9hUUdSdW91L3pmdTcy?=
 =?utf-8?B?MGNPNnhoVFEvZDM1WTJSZGh1UDVmRUlzRWRtR2g0MTd2dkVQeEJWWkhrMWN6?=
 =?utf-8?B?ZXBYcEI0NnR3ZlRtU1BHblBqbjJrVkdwOE9WYTBkZ0FnNGc5VmlTaVF0UnIx?=
 =?utf-8?B?SVFqbzVJN2JqcGsybHVKRkdVNHBnYm11Y3BEUHhOMWJJaUl5MkxCd1hDWVRu?=
 =?utf-8?B?TVpRbUM1enB2cm5FdVdnU21BZG40ZTFuRTdiMWRlcFppaDN3SUJPQjFNblMz?=
 =?utf-8?B?QVpIYUUxSW9MZDg0ZzJIZnFDSUNuK0p5WVplNXZDQlVlYlJRSVQvWDVDdld6?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Flvv74x3OSVXMvVVIvDGj3SaDc3MIGnQydO3FJITsZvBvLzNvE4xKttAJusOniTtRv97/1nL+oZBY2iK+G8mQXaFGPbSES6mv7OglOAMqgpv4ftEtOYTQhrWscw9o1ElzogbncKD5aCr+XRlNbNbjTwdd1QRbGo7mWCfZ/ZrBSRW+9n5xDDPb1aIeRjNyLyOub3TJDeZ+9TACo8bdZVkbEJXPWRQVDGlivFHJosEHSZz+imMcmwAjLRFV5lcmxPkzRcImqm6rhprRf61lr+ZWbBcGgbih5zJvW+Q9QLD/NJ/ymOXDKMCTQq9WCN4UVV8AGQvL8ngWb1uRGd2LhFR83itZKzmtogEBMnZPO6BcIEAhBEr1glP52zEPV3/DHiEOzKAxytaESsjRDptip0kTQ2ylRf7LAe7uEVtdRdapnwsEuRepHgDop+Hr5XyZU4/9bVaQ4as3jiHon10Y6o8NSvnF1mYtHOQgo3x2N8u7rNrU6njNMUG91Ok0835CllHja501Dk/I3XnlaePJEsc1+2G8dqrF5huiRe6e9Sz74qE2vdBtQF5D2+k5nx88IWlIcy/AEAv1jaLoHTpXDxAGbRu4CWeK/Myo+EeF60GDl6O/neI6XFpgrjAMges9Jx400DWCovr/EMj2iA7qQbKXLpDAY1uEyIRPie4wPV4A0K7mYfkcHWdPmocLicCfyaWHnPUhDqI2rvIqweJpfzdhQDjk6X+taHeb/pbRvsoFTWkqADQtXL/CMF8X/HvaFxifI45lwK3SZRmVrLgRMdovwqatCttWYN1jeymV0h9zfqo2jQla9FQUBN4uXhe4JDN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb196cd2-775c-474a-43f0-08db3d22190b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 19:54:46.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KfWLcpY+hLCffmSZFIjBa5ZJf1pMrwpc9TsuYbCsPFjWYC1YtPQnNgzVzveSC6z8Zl6uJGpeMhznhroRQAxBw1WNUfwVKxWvco0wrMroRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6975

On 14/04/2023 7:33 pm, Alex Olson wrote:
> I've been digging into VMX internals and I see why MMIO emulation pretty much
> requires x86 instruction emulation.  Even the Linux KVM code borrowed Xen's
> emulation...
>
> Thus, I'm trying to understand Xen's x86 emulation implementation...
>
> How was it developed? (x86 instruction handling is incredibly complex!) 
>
> Was it originally part of a general purpose x86 emulator?

Xen's emulator (in this form at least) is 18 years old - March 2005

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=4c5eeec983495e347c6ab3d40a4a70cdbdfce9af

and it was written from scratch, but you can even see in the context for
x86/traps.c that emulate_privileged_op() predates that.  (We decided to
consolidate down to a single instruction decoder/emulator at the point
that we were maintaining 4 different ad-hoc ones.)

As for development, it's all there in git log if you want to go looking :).

> It looks like it implements more instructions than just ones that can access
> memory, such as "AAM"?  (Why is this)?

All instructions have an implicit memory operand at %rip.  The CPU has
to fetch the opcode bytes from somewhere...  (See Introspection, later)


You've found MMIO, but emulating from a #GP fault was also an important
usecase even back then.  PV guest kernels execute in Ring1 (32bit) or
Ring3 (64bit), therefore cannot use CPL0 instructions.

While PV guests ought to use hypercalls for privileged operations, doing
so completely is very expensive in an existing codebase that you're
trying to port to Xen.  Therefore, Xen will emulate in a few faulting
conditions, so the guest can e.g. execute RDMSR and have it function
correctly (albeit painfully slowly).


More recently, Hypervisor Introspection as a technology opens up a whole
load of interesting cases which want emulation.  A lot of introspection
boils down to removing permissions behind the scenes (e.g. making code
no-execute, or making data read-only) so violations cause an exit to the
hypervisor, and an introspection agent can make a judgement call.  99%
of cases are fine, and should proceed.

But, how do you do this?  You could lift the permissions, but then
malware on other vCPUs now have a window of time where they are free to
make modifications.  So instead you could pause the VM, lift the perms,
singlestep the trapping vCPU, restore them perms, and unpause it.  But
this has terrible performance to start with, and is an O(N^2) perf hit
with then number of vCPUs the VM has.

In practice, it is *far* cheaper to have Xen emulate the instruction,
than it is to play with pausing, perms and singlestepping.

But consider the 1% other case where continuing isn't fine.  One of the
supported options is to "emulate / discard" to try and skip the
instruction without making a real state modification.  This cannot be
done with singlestepping, and has to be done by software somewhere.  As
Xen already has an emulator, it's very easy to use a set of
write_discard() hooks in place of the real ones.


As to the complexity, yes and in truth, Xen's emulator isn't fully an
emulator.

We pretty much emulate all the integer instructions, because most of
them are very simple, but we do not for the vector instructions.  What
we do for vector instructions is better described as decode and replay,
where we reconstruct a modified form of the instruction to operate on
local state, so we can piece together the overall reads and writes
without needing to implement the vector logic itself.

It's also worth saying that for any locked/atomic operations, we have to
issue a real instruction too, because that's the only way to get the
cache coherency behaviour correct.

It is also worth nothing that Xen's emulator isn't complete.  Notably,
noone has implemented IRET for protected mode yet, or inter-privilege
far transfers, and we've got known corner cases (e.g. interrupt shadow
with Mov SS) in need of some work.


We went through a spate of problems where Windows in particular kept
coming up with more and more inventive instructions to use to write into
the emulated VGA framebuffer, and we decided that the emulator should be
as complete as we can reasonably make it.  A consequence of this is that
we have some very interesting and powerful advanced security features.

I hope this helps, or was at least interesting.

~Andrew

