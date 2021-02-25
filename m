Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C232549A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89888.169771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKbb-0005JB-0F; Thu, 25 Feb 2021 17:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89888.169771; Thu, 25 Feb 2021 17:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKba-0005Im-TI; Thu, 25 Feb 2021 17:39:14 +0000
Received: by outflank-mailman (input) for mailman id 89888;
 Thu, 25 Feb 2021 17:39:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFKbZ-0005Ih-Fn
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:39:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f15114b8-37f3-46e7-a75a-4735bbc69b2a;
 Thu, 25 Feb 2021 17:39:12 +0000 (UTC)
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
X-Inumbo-ID: f15114b8-37f3-46e7-a75a-4735bbc69b2a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614274752;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2KwKUd9T9DQaJi0yqu56bFBZny4mvCci2SiKDYl5bfo=;
  b=W9o1c9lMSGcW3100Y9/OMTCU6n3y1kzKLrCxta8mqEj7AMDf1TNoju9F
   bvrW1Nv7LgjKZjVTsJ2WmMaWjkddHmPKICcqYSZ6CsL4Poh430Czow02T
   oDXBLmI2G3IJjM5n/199MzG4Jt4UzY73iCkzbatQ0P0Fe3c2fol8iMNDh
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bMtk4e9rOrZT0xBDxAVYQ5yzeccnbxIcFTU90AV684VSp5F0tTsn/jYF60YvA/+7PDZlND68KR
 DY5iEZV1ZtMxBuxUe0ruGa+N3qOIZmH5Xs66l0B76dVpJxJdrw+qPclWmcp/qeOZDv+ojOhB4Z
 lf8gPD+72+cTJXWQ2aNpjjaLHuG4nR+OuKAMljJmTw/CtXOUSsXBUcX+KPBzjDwIsOmrtyEIZT
 zWXNS6PjuHVwI58Ei2KDh120WpEeHwft8ZtXO8mt/5u7c7toeG0Pz+XrMKyXx03RVhFMw1eAtU
 Lz8=
X-SBRS: 5.2
X-MesageID: 38232735
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,206,1610427600"; 
   d="scan'208";a="38232735"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CupvdXhC/dUBbsRN6mZ4v63KH875YGIWBoSEg37CNxtFCOX0A06Bp9qDDe83emrdvnhSmDcVytQ/TlO9xUY6+voXFjNF3Z0fgUieATcF4O5kJ8rlWIwc9OqBVm9kEgdbW+/yW67VYWrbSw90WlZHJf2aNYz78sMCG9kOzn1Plxx8VMS2i1lFMvB8YRLAJDboHJSNE4MU6+ip7TGnnjEQODmdYOK0AP7PWE6U4r5ijkYdyNHlV29PnqfE6QT6YzyHn5WwA5oTaBC0DnrcJ1SkHDk/hZBYhubjyPOiORKugQ4nL1ps104GkW7tEIGdCPJVNbmfsvx70eTOf88oDtYWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rzm2ZUwCo5v9VUZDH4J5k9fXJhtts7Pxz9WMJAjKWuw=;
 b=mgUmtF62APfw/qzUsIJs6ixaVsi3dttgMb8aqvYnArfLOvCHmaex5mzibTGO+8v4eF1W6KEe44+Wg2QKMrsNcqnNPJtoaOHrBDUsaWVftGIY8B3LLc+2mlMT1cdbF2uRTjwiEc2xgsvc2a/PpWv3xN5UFrrGuMjVoaj7zH10aQjHMba4FjGv/y/L2WpU41WVKoZfEcvldN/f7wjOuqIEJohfHdN8ko8qPK7kYTbmAAAffPJCCtnu7kavPpqtNMeSesWNKwwJAllWNx0ES9joJIX+7idiNxQbk3ShcFEJ8B1NkJMoVVEuNs/GLkJFNOt0hfcXV1ZZmBzhoRlCkxXYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rzm2ZUwCo5v9VUZDH4J5k9fXJhtts7Pxz9WMJAjKWuw=;
 b=iYCMAEdarKb4I/+uCrJ7nR1tUcVzh80vNUSpDnD1kNB8xHF9Vetv3NvunPrl5FxBFMyEDvHzNjaEVJg3HUSpI+ijGkUtjzXHJrri2M3hzY1rQ2zk4U68+3HU8TGxivdQzDeRBHqq5K/xNPFawcMNOjtFjUJ5q3uqLyBczB4fmAk=
Subject: Re: [PATCH for-4.15] x86/dmop: Properly fail for PV guests
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20210225170936.3008-1-andrew.cooper3@citrix.com>
 <24631.56533.776930.841094@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a7ccd364-ce64-0784-150a-91e558da2aba@citrix.com>
Date: Thu, 25 Feb 2021 17:39:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <24631.56533.776930.841094@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0374.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50587421-8be2-4ab8-4c82-08d8d9b4415a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5727ED4F52E12E4B91596BC5BA9E9@SJ0PR03MB5727.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7nbJthVWr3dgj+jD3eieFdsVj0MO2aqxitpyXBA5i9GOn2p4UZ+6o6ltkFk+nYNu5D2O1kGGl3+JPm3G/xYxDZByLc2XhohCiURq4tNvKNEwYfndhIKQcKZGX62Omfl/QDb+XwkYoRBqRdB19MHFJ7tJ2doz0lBq9qMQV1Jm75Uzg2X1FCBVNGJTAuxWnKL2rRCv/7No1lUFp4nUrAebnqIcHoSNVgB8jwL3xXfqCIdTYI2EVeF+1b8e3v1zBKpGK0pPK6PDGttge+8vbZS1OxtjwMoEHS3283SaKfTC6cadZmfVFkAC8B1Yd6cnF0/mza4f6RTsjJGIsfYXq+Lu562ocI3SJ075U4HYFgqFbq7e3aLQhSdF9/HgQCVuU3y5hCwblKL03NhCH607LWD33ZsGosRMMuPnDFi/qIHBQeLNE40l/6jiHMG4hyclW818qrRbpezbIcGqQiLra34XxM+U1lwYtKyMnPi1jmgqQkaIX5Kzi6qxsWgsCsuOvScuYoZFsuxdWaZhKpZFy+8zj5kenyxYAtTca8hGcove9uWkIvtR+cCauQzKR3mR6e8xHnRFCW0MpdQqFl0Xq0rfm7EoJKi0HKyibNWYHsrHnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(66476007)(54906003)(66556008)(16576012)(316002)(31696002)(6916009)(26005)(8676002)(186003)(16526019)(956004)(4326008)(2616005)(6486002)(53546011)(6666004)(86362001)(36756003)(4744005)(478600001)(8936002)(31686004)(5660300002)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1gra3ExZS80b3I4aEx0T3J1T2lJUTVpNkRNZlNCd0tkalU4blAwZkVBWEVT?=
 =?utf-8?B?TzRHM1dYbHZGMHgrVGJQM0FvUzdkOUV0aU1QODZMak5GY2REdmlHSmQ2WW4v?=
 =?utf-8?B?Kzl5WmtRNmVlYkF5TCtzakZzRk9SNE1jUGVQWFJQdWthTGpmRzJ5OGhCeUYr?=
 =?utf-8?B?R09FWmxLSmNPeWxBMS9XVG80N2VQZU5QcytjN3hzUFBXb2lYcHRsdFRoRzl6?=
 =?utf-8?B?UWxsVHpnUHlubEF1OGlSUVA1ckVSK2MzYlN6YTR4RDNMTElxcUxKTXFuZGUx?=
 =?utf-8?B?U2lvZGN4dEw3Z3J3UjNETUNzUzluSHVDZlVsNlRaN0dOMVhsaTVmUFNKUmdO?=
 =?utf-8?B?TDRtek9ra2tiL1lSeFZzWU12dU85MnFXVGxUcDBTZVB1a2FTSk9PTGpJQVFk?=
 =?utf-8?B?VlpCSHBpcnFuN1dsS1hiTEdVTyt6VVdGOVBMdTlyaUNSOVNRaW1iZERtbnJi?=
 =?utf-8?B?cEZkL3VDWGZzRDVreWF4Yml3QzBqRkIzWEdPS1hTMU5mUlZHQitEUmo1SDRq?=
 =?utf-8?B?VHJhS0tXVkt1bDJreEVBRnpINTFCTEJ5TlA2d2ZkbGRoTmdtdm0zOHU4U0I5?=
 =?utf-8?B?cWJMajZwOXNaUmpWZHlwcDFuTlZqWFlOSm0wSDZaVVl1M0hTSWV1OHo3eGlG?=
 =?utf-8?B?d2l5VG40L0M2THBoV3JzbXhZMlpFUDYwU0FZTnNVVjA2VXZCT09RU1hwQWdw?=
 =?utf-8?B?YWJMbytVR0E0ZTZvL1VNQ2xUVjZzY1NpeXRvNHgvYkU5WmUwS0o2aVJVNzdY?=
 =?utf-8?B?QUJUL3E0Mzg5U0N0dWVYdVp3L01mOEJUbkNoN0p2bVRxN3RLUTJDbmVKR1Zj?=
 =?utf-8?B?UHZaUTJQZHpUdjRnQ2E3YkYwQXdFUFgxalp1anVMUXVJVXY0eTMxQlhtMGxm?=
 =?utf-8?B?SmxWT1JLaFZMMUVFalR5dTh6SWQxZUlFQnNwMEtUb0Z2cU9qWlVadkd3dXVn?=
 =?utf-8?B?aDNRb1NDSkZ2RnpJQ3libWRBM3RLYkdLNnNQeTN5dkZEeWpNUkx0R0loTHlI?=
 =?utf-8?B?NmNMWVgxeFlQZVZZUWZZbTRra0ZnbDFQZHd3bXJmTHZwQjhEY2tyTWhXdDdY?=
 =?utf-8?B?Q1gxb0JRTGROaTN1cnBCSS9UVGs2cUN1bzNnY2J4UlZ5V1l2UzN0MHltbHZi?=
 =?utf-8?B?V0prQ0xOOEpMcWVac0wvMGZCTGxoNGdzUEp2aHhjd2p6S3U4RUJ3bVBYQmJ4?=
 =?utf-8?B?U2xNZkVjWC95bWp4SkM1dStXanpCSWI5aHRGd2NnYlg0QTEzVUcyOEpXUVhM?=
 =?utf-8?B?dUtkc2VtOEk3SWl4SXBiWGdZOElWeUk1ZUJPeWhRZ2hNLzNZODJDQStkdk9M?=
 =?utf-8?B?akVoc0t0SERaZ0hUUHo2RWo5dlBxSG1qMzc0YVMwbi9xWndmcnZzYlhQRkJ1?=
 =?utf-8?B?UHpiS2Q4MGw4ZTBiQ0ZxazZBa0FwREQwT1JnZkszN2lHMDlrQU1ZMEFQSHI3?=
 =?utf-8?B?bldzV0lBQlNseTRnK2NTdndhc2lMYStLbFp5Sm5PY1MzYzB5L3lPbDYyZEFS?=
 =?utf-8?B?Y01CZVFtNDJZSW53S3Rtd1AwMllmNUJlaTkraVNQOFMwdjRYOGIvVUx6OHZn?=
 =?utf-8?B?Z1NHdW1HSTAwTjRWcVRFaFdNYXIrZjd3cWJ2S2ZDTnZ3cHJINVVBM0JnSGxo?=
 =?utf-8?B?Vk03UUhNaEJUUzBHdUdhWmhWU00zYWgyWjBwdXVOUmlydGlUZlh4SHZrUVVN?=
 =?utf-8?B?c1hwWDl5T3l5TzA2K1lESXE3N1ZQSkhiZjhheFFvUHlleU9mcjB6Ymd4a08v?=
 =?utf-8?Q?loGStvlS2X0HXglLtYsN88UcvQM+6Wz3OMp+80Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50587421-8be2-4ab8-4c82-08d8d9b4415a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 17:39:08.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ND9APoyhkXD34poY/RTJFOjVe77/5lt0EVNKKl6ed7gSbWNIEI45FIG7Kb5TAgx9cQQdCijSKDjbIEd1Kiy7gMqskNS+7Qo++Nz0nXX0Gp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-OriginatorOrg: citrix.com

On 25/02/2021 17:22, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH for-4.15] x86/dmop: Properly fail for PV guests"):
>> The current code has an early exit for PV guests, but it returns 0 having done
>> nothing.
> Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks.

>
>> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
>> index 5bc172a5d4..612749442e 100644
>> --- a/xen/arch/x86/hvm/dm.c
>> +++ b/xen/arch/x86/hvm/dm.c
>> @@ -365,6 +365,7 @@ int dm_op(const struct dmop_args *op_args)
>>      if ( rc )
>>          return rc;
>>  
>> +    rc = -EINVAL;
>>      if ( !is_hvm_domain(d) )
>>          goto out;
> Is this style, of setting rc outside the if, the standard hypervisor
> style ?

If you think the cyclomatic complexity is bad in libxl...

This is the prevailing style in this function.  Its common, but not
universal style.

~Andrew

