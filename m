Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02777D8B6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 04:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584176.914640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW6kI-00044z-9Y; Wed, 16 Aug 2023 02:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584176.914640; Wed, 16 Aug 2023 02:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW6kI-00043H-6s; Wed, 16 Aug 2023 02:58:54 +0000
Received: by outflank-mailman (input) for mailman id 584176;
 Wed, 16 Aug 2023 02:58:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzLC=EB=citrix.com=prvs=585ac1913=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW6kG-00043B-9W
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 02:58:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d215f1b6-3be0-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 04:58:49 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2023 22:58:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7468.namprd03.prod.outlook.com (2603:10b6:806:39b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 02:58:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 02:58:42 +0000
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
X-Inumbo-ID: d215f1b6-3be0-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692154729;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JOvtGOEQL5h2CIDs3DAForDG5q5woemTGKoZokM0LhM=;
  b=GK6WNSQx2ppfYnFZC5o6lZMfHdsLOiYCXFUUW4kuX88OAsyThXDvB2Jk
   x6TOnne6e9hXxK3rb6sAzQTypPRZarlXrsj4vaf9XoKLy/7pVjBM3jhuS
   gXEdQTFzRhFY3N2tyO8caL519bqm8vdLcCei/LsoBhqxqygt81A+EVTFf
   8=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 120028302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bwCDh6iYQ8lXRhLPNxKJRHL+X161yREKZh0ujC45NGQN5FlHY01je
 htvXWGCa6qPYWrxfo9wOYS/9kIA65bVnIRrQFRory8xQnkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AaDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQqFz1WMAGfvtutybGVa7crqJ8xC5PkadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuXgrK4x2Af7Kmo7BT9OWwGkmsmFi3WGRPJmG
 U4/+Qo+hP1nnKCsZpynN/Gim1afpQIVUddUF+w86SmOx7DS7gLfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESocK2MYdDIHZQQA6tjn5oo0i3rnbPxuDaq0hd3dAizrz
 naBqy1Wr6oXpd4G0eO851+vqzCxopnESCYl6wORWXiqhit1a4KoaJahwUTK5vZHaoCCRx+Ou
 2Zss8SG9+UPEZGlnTSAWvkQB6qu4+uZMTramhhkGJxJ3xSg/WSyO79Z5j5WLV1sdM0DfFfUj
 FT7vApQ4NpWIyGsZKouOYapUZx2lu7nCMjvUe3SYpxWeJ9teQSb/SZoI0mNw2Tql0tqmqY6U
 XuGTfuR4b8hIfwP5FKLqy01iNfHGghWKbvveK3G
IronPort-HdrOrdr: A9a23:v/uzW6sNc0dh6Cs4TvuJrANR7skDYdV00zEX/kB9WHVpm6uj9/
 xG/c576faQsl16ZJhOo6HjBED+ewK4yXcY2+Qs1NSZMjUO2lHYT72KhLGKqwEIcBeQygcy78
 tdmqFFebnNMWQ=
X-Talos-CUID: 9a23:zVIcs2FqNvgYg1HjqmJVy0NPRNE5S0TGxXT+AhH/Jz17b+eaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Az93I0Q9L2cWNaPQnnBYPFyeQf8pKu6r0F3s9rZQ?=
 =?us-ascii?q?9g9akDB5yEDS9nB3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="120028302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiro0QjK9kfA+b3kL+nJSHtZCIfoIthJGqcX+69f3PMNe26ArSA2Qm1+iSapNAHHehEz1L1G/hVT2zCtQ3mo0qKKh/IHzE6FFIn9TFgJHuNAnXI2ecfs8IhUxxIFvqMy4xCeZ21DC9b2oCAPA3iDpOUgl0bTNXWgDNnSAHlyIqtrH1mporQdXXZ0vzP50bYer2/XdleabowVA+eNKhQ4KeWPtpgnRZxxH5bqTyw3PwqP5kiS+WJl45ZExQaba5jfYGhjPfmOAl5d3snOFKOQA86CNPfda7hVNOEFUYLT4/FcajDEiKYZWEqtqs66iTmW3LEZ/HOnuLyYssdDRPp6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLN4c064N+ZTpBoU7886QaD5i8emmbyeKhiOTfG7/gg=;
 b=MSPEW26Qv/fCHk6H56UxmIIEKTwjqfbMb/L0gcqOrHLu4ePe2YQddcUAocyuGw5+8tjzC+7kKViy5e+6QRuadVnA5jxCQjaTA/0/lJrp6cnziZwtZv9NnMVfD1ETIOSDDfJPODqpXVuIO8fBR5ndVHqKyXQTXshi4hKXD4+Edx+g44eBtNNSqhy8XcZ6bx6XzSMQ/j4lZXjIOgz13hdGlqbQf4/XfUNZ4upbgD5vgYYnCG5A0xkwO2AEEGuDY0/dHn+ckRYvfEA2z1jlfYzgUsKxyfLZO/HlT9X04Jbrqq3ivmncKu7ZvFYdsh+XB7olp9XRI3b3gFjzYLgYf3j3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLN4c064N+ZTpBoU7886QaD5i8emmbyeKhiOTfG7/gg=;
 b=K1DrHbg7Yth7FxFODqcjWN1QuENQFGHvOsRAVdiRguGl3ZKA8S2dbd1pNKGTHo0ZodVA2VZOLE6ZsU4EUuU2QugVMkfsSCnTOfCkYjjpNBvghn/p2PkwCjzFEu9PZHVlN+R9GIRp/9o6KqGr9nA4XmlMRpolagSiSfCVMQB7//Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
Date: Wed, 16 Aug 2023 03:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>, Henry Wang <Henry.Wang@arm.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d35c73-6a31-42bd-aef0-08db9e04b2e3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ZcoJjE+VorSAGlH4j1+B1Xc9oOJfEZLbBO6Czvpc0VVDuYX6XlWOpVMmOoUPv61eA6wt/3xCIC5yNdQ33CDxcstVzXpBJeV6GeqZehtJ+L1vIYReNJ9Kf0lmV1onExIQ1hIvpIJufd0CdYwnfEs2nkuOFrz8sGKJbjNJQfus+xZshagtPkjwOXOnwSwdliqExjtJFhj2fgIPgEz2osY2eJ+ncqQtO+WHhqV9znJN6YJ0KYczwUpK7CoyS/aggIrwAUmMH712c+XuaoyFkkOOiq1mQ2mJ1sah0mafzLCenGRleTSfkABJrWmqUg4JscuLeI6hZRRJbSRv6SRgL2TdE9BsEOtJ3FFVA/NpFHZRXutZXnCHlJ3ztoLnhCjnc9twnOSM9iJi3e9JF08Xdyax3JWEdioL4/eOxWfe3F2AqT+EMVzC3QiOStyLL8WcJHsx5hu+IliHO+x+G2eg7AAUNb+8ABWowudApe9oXVKyiA8GxqsQr+rQ7VXSLG8GDyth5WKykL6WaTtldAc57KB/WPKTfhWPnQhmR5BwrTcEBXQyXajWIuDkHPO4/i6hkFwunR3PE4MtzweNFQ4DW7PBrTAQVyuxz9NkVDxOBtKosCF+4qeoTup7oiZY9kVTIyJXSjtRg82d1X675P0VGflpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(54906003)(31686004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(38100700002)(82960400001)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjNLYVJROC8vRWFxTVZvcXRHSUtDeENnc2tDaWJ6cEtNMzdDQUk4ZThQWmtV?=
 =?utf-8?B?cGk2dmpPQmZaYVpTU045N1h2VmtVVlZ6QlVmK3dpUUFPa3JhODdxeEJYS3Rx?=
 =?utf-8?B?S1lWY2g3SE8vTzJhbWJoOVM0VmtIN3ZVb2MrMHdtdzVpcXJnc1BkNXhoRGpp?=
 =?utf-8?B?SlByMWQwdXkraHI0Z1BLRHo5MkdENDA4QkRRQmFVTHF5dFRIM3lXRnhqZmQ1?=
 =?utf-8?B?VFhON25FdVE0Y2srcDZhZDVGSFZDT003Ym5iUFN6V08zWUFVd1BqNXZETGFr?=
 =?utf-8?B?QnI1NG5XdEZLcTdhT2o0SjlSR2pLVlYwdVB5dTlRRWFvTWowZTZmVXJrMnB3?=
 =?utf-8?B?RisxR3phS20vd1dMa3NVdzZSTDUrRGdoNGliNjB5NnJtTncwYmFhdEc2WGVx?=
 =?utf-8?B?djd1b0FvODU5ZWl1SDhiRVNwV3pDQVVhVWdaVGVYZlVES0JxWFRQdVNVTXBR?=
 =?utf-8?B?c0ZEVXJFdmxScTRHOThSR1dSRFo1amJ2diszelRLcldzVHVHN0FibVYzYjlN?=
 =?utf-8?B?K0w5cmthci9EMWtSdlpkMW9kZ1M1OVArekYyUDROcFpUelMydTdzMFoxMTQ1?=
 =?utf-8?B?M0tlWTNpQW9hMm9KRFcwbE1vb0Q5U0hjL1AyUmJRbUNlQTR6UE5pNmFTMkE4?=
 =?utf-8?B?YTg3bzNzdEJZempqZWNrcUhHZjBiRFFDbEpsV3RVUCtPL3kraXV0UGRkN0tz?=
 =?utf-8?B?Z1BUdmRkckozRjdtWjNOejFiTDltbFpiR1VSZG96UlhObHpIdWxYR1QxWkdG?=
 =?utf-8?B?cWFaa0pCeHRSdEZuUEYwR2pNZHZqY254dTk0T1NuSGxLbFUzb1NsV1JCNDh1?=
 =?utf-8?B?VWZrQ2s2QXIrZmkxR213L2xBWHJaTjBIVkJxcmxNZ3RxY1MxbElkcmtSbWYy?=
 =?utf-8?B?RWZyWTAxejh4N0FOdHMzMkQ1a2tZY2VSLyt0SFYzTmxwWk4vTWZ1YzdsRi94?=
 =?utf-8?B?WnlzNDBnTDhHblVQODI2bTlKa2RWMWlmaW04NlFFdU4wcndTMEwvK1JBUldh?=
 =?utf-8?B?Vi96VXQrNGllbXprWDdHZjNDQkREaGlGNXc0WVZIMHNWQ29tcGMzNy96dWxy?=
 =?utf-8?B?VkV4WEZ2RitxN3M1UExjWmJHNUZHM0FjcTA0Z0pjN0ZMR0N0bWgvaXJHKytM?=
 =?utf-8?B?Zjd2K09wR01SSXhTcHpSVTBKZUkzc2FMV0VLMENXSWZ1Tk5ndEdHNTBhQWQ2?=
 =?utf-8?B?OWRwNUJzRFFweG1tK0FMcjVISXZyRHc2K3V3S2E2WWZXdkVRSVRMeVVCZzN5?=
 =?utf-8?B?cTAvNXc1M1d6cmY4Y3dsWWJjQ3padFNvS0xrRDhCR01BbkVHMWcxUTZ3bFc4?=
 =?utf-8?B?aFhnR2UrUDhFcVZMVXRCMkMrYytHRkkrTkQrNU9QVElHYlcrbEVRZ281NWFt?=
 =?utf-8?B?cy9INE1PQ2dWKy9uTHR5aldubHo0VTV1UGsyUlNFZWZ3Q1kza0VLSkZ4V3N6?=
 =?utf-8?B?WGVUa2V4TkJwZDd2SjMyVzRnQlZQRkNaaWxCSWQwcXhCemNUWml4TGlQNjVk?=
 =?utf-8?B?QWJKQlJ1a2ZXRERhTVMrSExmWVhJUk5xbVVHdVIwN3RxOS83dWw0Unh2M0VS?=
 =?utf-8?B?eXlBVnBDVUx1SkxYaThzb2o1UGk1eUdEU3NxSFFMdUhDc0NhWVJtWTgzQ0hR?=
 =?utf-8?B?MzFEbUZvaGMwOVVCanlLVWo1WnJQdWpCeWdWQU5paXc3SmFTWDg3U0NqOE1l?=
 =?utf-8?B?QmVaY1lNVnRINVdNVTcxOWdLcVJ2TW8wUkFySS9kQVY0UjFadkZEQzZzYzhr?=
 =?utf-8?B?TzlDS0M0S2FQajdIa2xtYkJ4b3NZeW9obWpCa2ZxZ0RKYytCS1lZMWN0L29q?=
 =?utf-8?B?VmFtekluNGY4ZHBZNTBMNWdzbTlhOHBxVjZMcWQzcm5VeFFyYTlCV0I2aVA1?=
 =?utf-8?B?NUdONkpVcmtpeGxZNmsrYmY0ODJvSHN3RnRRUGlreXF5b1hZU090UE51Yndt?=
 =?utf-8?B?dGJ1cnVGWHZjSTg5SFhIYi9aSjdTL1hYZ3N1TVgzdEYzOFRzazArNU5kajd4?=
 =?utf-8?B?TVRnYmM3dVZrbU5TRmRJNGorRlZ4Tyt3d1ZjaDVJR3VmQm5lc0xQalo5eUZI?=
 =?utf-8?B?L1FpSHhFZXpQNDhyYWtlSmx1SkFPRjNWckw4UFFRMVIrQmh3Vmw3a1BpSU50?=
 =?utf-8?B?d00xVk1YREcrTS9xRGZsZ21RU2lXMk1uUHgrYWV6ZC9vZ21rdmpYalhYSGZV?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?dmwwVGdLSGdncjJaNFNlNVlzMGNjYWRaNnhDeUNIYlVleGxrWWN3bUZOYTdk?=
 =?utf-8?B?VDA3SE9ZVkdxajVId2NNT29aZmR1Q1RjSDRJdGRvWEdYVFFqMWxXUHNUK0ZV?=
 =?utf-8?B?ME1maC9xVkU2anFxYTR5L200cjJHZWZBV2g0K1E4SmpSODJ4THlRejgxUUpk?=
 =?utf-8?B?V0M1Yy96WVdxeEtlRzB3UHhSRXJZTXQvWndOTHU2ZVl5NGFpTy9rTGRuSDkw?=
 =?utf-8?B?TmUzc2tiMU9YVUFOb1E3QlhlQjF4SDBpRnMwbWVXNEJEeHhiOFZudm1xWFdN?=
 =?utf-8?B?SkN3K2Ezam02b0dCZUYrQURwQzR1d2FGZ1RDbTMrYlpyYWJFaldubit0anhH?=
 =?utf-8?B?WGZKMzFuQVZiZG5oaGpac2cybmlWSTZETXlhOHZmcFFMTHRKRHByS0dwYnNm?=
 =?utf-8?B?cGZNVStiUVVSaWdJSVpzck9QQ2J4c0VBdDMwSE1kL1Q3YkNGSUZKamZ3eXFJ?=
 =?utf-8?B?SUJMK3hlRnptU3VyZFo5RUdjSCtIZ3Zza293MjBzbTRMRWJpSFgyYUJTRVVq?=
 =?utf-8?B?bDBqN0FKTk9JNlNiR1Y1bU1ObjdsU0tlNk9xam45dlNHRFljUEhDVGxjVGl6?=
 =?utf-8?B?QkJFV29ISm1rZW9hZVNuS1pLZGR0aVlnUEp6dzBpT3JickR5L20xU0RsZGMz?=
 =?utf-8?B?N250ZHloNEVPY09FK0N5UTY0b3hSS1lLUmNJTFlzaFpTK29JV1U2a244ZDVp?=
 =?utf-8?B?Qm9kYzdkcm9qM0VoY0R3RW16SnE0MnB1SjArSmlvMlFINzllNlZoVU1CeGJh?=
 =?utf-8?B?ZC9SNFB1aWpYcG13WmZXV2RUSGxvNHFzMUdvT2tIWUFRTHQrY0VJRjlrTHo4?=
 =?utf-8?B?WlFjWDMxS0w3ZTlqVW82eDh3YzNDTmFsZStTcXFPR2FLbWdUNGszS0tPLzVL?=
 =?utf-8?B?WFlLOC92SXFuL1FYcnF3OUczYitOankwL01Ec0RJTWxYclhDOFFRUkY2RzdR?=
 =?utf-8?B?SmdLUFJhck5IV3ZnQVZ4U2dsT1U3cm9Zd3dRTGcxbW9QVjNEaW5HMCtobngx?=
 =?utf-8?B?Zm55WTlocTVCVXVTM2doamx3eFRMUXNEM0E4V3NmQ2hWMHpTV3BOcVp6SVFK?=
 =?utf-8?B?ZGFud2RNOWNjL2NRVEpMVmQ5WDhQYUx1ZWhBY01EYjVpd3F6a2Mrb1pUM3dE?=
 =?utf-8?B?SUh6b3VsTjZuWGw1S0NTR0Z4UXFCS1MrN2RjdnZxaFdOZFZtT0FWbS95K0M0?=
 =?utf-8?B?TUIyK3VSYW1CaDlSUzIxcEhDTHAzRmN1dEgvTjVUYnZVVFAwRlFzU1labnBy?=
 =?utf-8?B?TkN5YkxoM1FZVEg4L1VtUXJlcGdiMlBIazJkV1ZScTBTMUF0bk94M21XMlZT?=
 =?utf-8?Q?IWnDL3g2gQgzA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d35c73-6a31-42bd-aef0-08db9e04b2e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 02:58:42.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qypu9pEXPU02501GGeX/z21WW2V3+l416kTqMJgsZM5SDyK30HWxZeQPZcMq8afem3odTVuvg9no1Tybuh1pW1gAzlUWpJE9nFm48RgaTlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7468

On 16/08/2023 1:19 am, Stefano Stabellini wrote:
> On Tue, 15 Aug 2023, Andrew Cooper wrote:
>> @@ -498,6 +499,59 @@ static int __init cf_check param_init(void)
>>
>> +    sz = strlen(str);
>> +
>> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
>> +        return -E2BIG;
> Realistically do we want this buffer to cross page boundaries?

A 1-byte answer can cross a page boundary, even if the hypercall
argument is correctly aligned (and even that is unspecified in the Xen ABI).

But importantly, this series is also prep work to fixing the cmdline
limit.  1k is already causing problems, and 64k is a whole lot less bad
than 4k when we enter such corner cases.

>> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
>> index cbc4ef7a46e6..0dd6bbcb43cc 100644
>> --- a/xen/include/public/version.h
>> +++ b/xen/include/public/version.h
>> @@ -19,12 +19,20 @@
>>  /* arg == NULL; returns major:minor (16:16). */
>>  #define XENVER_version      0
>>  
>> -/* arg == xen_extraversion_t. */
>> +/*
>> + * arg == xen_extraversion_t.
>> + *
>> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
> Like Jan and Julien I also don't like the word "broken" especially
> without explanation of why it is broken next to it.

The word "broken" is an accurate and appropriate word in the English
language to describe the situation.  I'm sorry you don't like it, but
unless any of you can articulate why you think it is inappropriate
phraseology, the complaint is unactionable.

Specifically ...

> Instead, I would say:
>
> "XENVER_extraversion is deprecated. Please use XENVER_extraversion2."

... depreciated is misleading.

It would be acceptable for a case where we'd introduced a foo2 to add a
new feature to the interface, but we're being forced to make the new
interface to fix two bugs and a mis-feature in existing interface.

> If you want to convey the message that the API has problems, then I would
> say:
>
> "XENVER_extraversion might cause truncation. Please use XENVER_extraversion2."
>
> Or even:
>
> "XENVER_extraversion has problems. Please use XENVER_extraversion2."

If "broken" is too nondescript, then "might" is bad too and "has
problems" is out of the question.


There is a partial description of the ABI problems in the comment block
beside the new ops.  I could be persuaded to extend it to be a full list
of the ABI breakages.

These header files are a succinct technical reference for proficient
programmers to interact with Xen.  They are not a tutorial on writing C,
nor are they appropriate places to sentences of no useful value.

Through this series, I have done the hard work of updating the
commonly-used interfaces such that downstreams can stop working around
real problems caused by real errors in these APIs.  For everyone else
re-syncing the headers, it is important that the message come across as
an instruction and not a suggestion ...

... People will probably ignore it irrespective, but that's then firmly
on them, and not on Xen trying to downplay problems in the public interface.

>> + */
>>  #define XENVER_commandline 9
>>  typedef char xen_commandline_t[1024];
>>  
>> @@ -110,6 +133,42 @@ struct xen_build_id {
>>  };
>>  typedef struct xen_build_id xen_build_id_t;
>>  
>> +/*
>> + * Container for an arbitrary variable length buffer.
>> + */
>> +struct xen_varbuf {
>> +    uint32_t len;                          /* IN:  size of buf[] in bytes. */
>> +    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */
> I realize that you just copied struct xen_build_id

No - it was originally an ambiguously-signed char in v1.  It became
unsigned through review.

But being unsigned char is relevant to the non-ABI-changingness of later
patches in the series.

> but I recall from
> MISRA C training that we should use plain "char" for strings for good
> reasons, not "unsigned char"?

I don't recall anything to that effect, nor can I see anything obvious
when scanning through the standard.

MISRA can't plausibly prohibit the use of char for arbitrary data.  It's
the one and only thing the C spec states is safe for the task.

~Andrew

