Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF971FDCE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543036.847608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q513U-0005o6-6y; Fri, 02 Jun 2023 09:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543036.847608; Fri, 02 Jun 2023 09:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q513U-0005ll-4A; Fri, 02 Jun 2023 09:26:44 +0000
Received: by outflank-mailman (input) for mailman id 543036;
 Fri, 02 Jun 2023 09:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q513S-0005le-RJ
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:26:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955a47b0-0127-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 11:26:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 09:26:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:26:39 +0000
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
X-Inumbo-ID: 955a47b0-0127-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buzhwDsh7HBweNm2oxxIpaUZIOkQlmsJZd+jgk5MjdWhJl70ePM4R6gP2PKPJhEdrv9vAPA4v0Ovf6sliPwULKGYfXIfG0ekqeYthgfo7qGeerGHsYtQjHtznXx+n7f1oyrhL8iDYJD8Gidp0I0FGqXUJROYNwjXLd3NO81SHwEAq3grhNEjYAViJxtVSBHdiFwvwO9kTvAiMLmBUKm9p8C4fPLn9jgE/lhBz2fY4yUU2FTk0sjbEiBVcj60j3CYTge6dq4+YHlcGwUhO3uLEqBILjb4cVrBI+5IV4huBCTe4LaYZFI8d09huOdfwEkTwOvCfgVa4c5S4MxtrwDETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJC+j20+upZ8guhVSSISPs9l+WOlDyFTKlOyL3xjr4Y=;
 b=ibV31ygcny+W8q7NFlA9V62L9aISFdGR0jkljBUolknadcRhN2g14pZyPYfEm7885A47aINGYkF4xFn3CULHbro2eJcibPNoMZ+pwvJ61S3GbFKQ+XDluMwFtqt8rH44XGqn/PGdWgK+IZntI3j3TaEJybll5WvflTj7hrvOu83bJTIoOU5CdgGN311FQ0f6n20MdsPA9AMjNBh3CVGh3GEXjSo19pcYICEPN0hLkfkQnM9UDED4k3Yb4ApSfdXt+rX9TmhpvxHD6dXhyBrcoHymHKC3hr5k4B2YLkaPeU50y4sGFcFF91Bi+Pf/CcztKzRNtlFvADQaoQQ8nv/fTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJC+j20+upZ8guhVSSISPs9l+WOlDyFTKlOyL3xjr4Y=;
 b=irPePBjtGWcUjp18qNW83Ts65J14/j6WEJbd1WvIe1HDPe/HfCdWw+BmgrZ5vvxIXE+yNOJ/vxZSszI/Ew4vb38GlJ4Vgy9/3AEcaX0UazM/HCfJdWW/HBld5F++EYovy3Ezq9sDiX6t8AfG+O/veP+sY7f9g3Of6abQKwLt10G8zCyHxf2XNDzBbS/Tm4+c3tAtdhX9Dm5ciqUgLyzWcGL6cD7hfIeEAEFcb6MSP22Mgm4rz4a8FcP7WtAc0mHPgsbZLMVGNZTTrQsANx1V8Fstoil1b9cYCjJwchWejZGfMG7F4zSBD0JcM8UdOW62F0g+W+WWm/urGlIbSkW+rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b0e40dd-6db5-baaa-bd80-a162ce578a37@suse.com>
Date: Fri, 2 Jun 2023 11:26:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
 <a7cfe479-9650-0e12-9491-55118c4af70a@suse.com>
In-Reply-To: <a7cfe479-9650-0e12-9491-55118c4af70a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: ade83efd-218e-4826-f899-08db634b77f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gx1hHamnbCG3QBQnVnspXixQ5ZHTqR92z9cmKjZOO2nLpXQM3VolvWe4LitvJjDvYDa2A2I32acYsn13JYn5D5u6tUJlTpcLKkfVL98OdtreOffsKoHZoIui3d0sHHKdUHCMhWw8AaL9PBIbdhVm8h+DpAjOKzvSaXPu3DtQSYEiXvg5sckVs5p8aPApcRPjLOuZWjJBgHPESX4tJ+vMSemLFFeFw+VJUyx96PKGmKwI2PLGWqI1t1xmQnNwkiscnfGbOmkacs0UTaWFTqsB1NwHqiK9ln1tZsRMrAFBwfEad7cCz/SsAEsh57Ibgp/sWzgoUFQuFEUTWjVZqP5sLAe6deoeWtCao66XDZXaPA3uBYlBk1GuGgm1WQFNI44Evp6D94eHhU1eJq3ca9TM9DRezqPdrBoP4tL7zE4mlq2ZQQgAGOB689POAAoGg8wZUuKJrr+ZHX66/gYptT/4fb2IpCD6Y5z4XutM4IKgQuekTq21R3KiXYQVL1z4iCUkx+vZnipjNSVrWsN34x1d6XhB/IffpqIYgNDH8cc7VCzxnk3CrCkcvmeNcChIL9SNUpznEuEHPaJ29eImoDEyFtXlyTpLxWH48zxM2t24+qxamQtD/AICCu32fR52pmZyLU3yuxg+01E6WtEJfhPbsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(36756003)(38100700002)(86362001)(31696002)(31686004)(41300700001)(8676002)(8936002)(2906002)(53546011)(6506007)(5660300002)(6512007)(26005)(186003)(2616005)(83380400001)(66476007)(6486002)(478600001)(66556008)(66946007)(54906003)(316002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElPamVUeW5rTVEzK2lvcnJXYzhFaXlMMHN1bFRXWGFndDRWWUZzK2RYYUZM?=
 =?utf-8?B?ZmVEUUM5QVJPOXd4ZldxYXBQa3ZGbDk0YkFRZ3hjNnlMRFo0d29XbGZUK2lM?=
 =?utf-8?B?b3o4Y1hvYmtoTlRUYU5pQ1E3VS9TcDJvMW5DeXcxYXgvNS9lVXRqVHBCOTBB?=
 =?utf-8?B?TlBFNVNlUGE0dWZYaWw0Wkc1U3pSajVJU3k0Qk9QZG5CVUU1VE1HWVFCZFA5?=
 =?utf-8?B?Z3Q4anVVQjRSOFN1bm9KSDY0dG0zR1VDbWRpajlYZDlMaHJrNHFZaUN2R0FU?=
 =?utf-8?B?V3ArQXZQdUlrSFJxei9uM3VteVZKUVE0WS82cHJhdGdTYWI1MzBHNWlYT1pu?=
 =?utf-8?B?TkZPQmh1amkvOFZmL1l3eVlsQ21FWmVaY2N1NDFvdnRTZVlBTFJzU1VNQkpp?=
 =?utf-8?B?a2xRL1hHSllMNC8zVVV0ejlMemlTSVVUc2ZoQnY5VmJmWUh0ZWhiOE43N1pV?=
 =?utf-8?B?T0VxQm92QysvU05wZmEvajRuR0N0bDlLM0VhZnFHVmYvVVBpVU9ndnU3d3hx?=
 =?utf-8?B?UENJbFdHeEFlbFN0d3pEc25MWXhJQ2xHb1BhbnF5T3lPYUhTdW15WGFqbXpT?=
 =?utf-8?B?NjhYUXZaQUdmeVBFdXBOYlZOempOSEhMZ0VKb1VUbThwcDdORFZjNTNUK05z?=
 =?utf-8?B?VVd0YWw5cnRKamZIcEx1citSQnBPeDlsb25sVk9PZVZ0U3NzcWQ3aTRPMTc0?=
 =?utf-8?B?WUFWU2YvaFJrOGYwRGpBckpjMlk3dnBJbnFKcWZsTXFiVXd1cFhKcFZQbXRZ?=
 =?utf-8?B?V3Jucm5mdGZEeWtSQWFpWVpsTTl1Qjd0NDBmbmdpYm1rRmptNkRQMm90ZjVy?=
 =?utf-8?B?ZDRxd2UrVWxSUEM0aVdxZHRWemtDVDlXYlVlTUwycUhXeGh1WjRkenc5dmFE?=
 =?utf-8?B?dHkyS2JJbDVkNGJVODdrNDZjL1pySVNoaEJmc1lJdndxbVk1UVhTQmpnbGdt?=
 =?utf-8?B?aHZ0eFRsWkttY2gxY2pEK3lvUjZPTUZmVEFOa1U5OVQva1VZVXdJVHVJVEwz?=
 =?utf-8?B?SGduWUp0ZWtVOVgwc2NOaHhielQvOVpNYzlmL21MY3VLVmZpNzh2QVBoZ1VQ?=
 =?utf-8?B?ZEptNDBJaUFkWXpkcTlHTHZMVXkwTzFvT1RzNHlMbXJtVXpHN0hlT3duYVU1?=
 =?utf-8?B?dERKWlM4NERZbnFYSHpzWUNhOUhtVVdkM0MwZXVuaEFtanFvdFI2NWg2cmo4?=
 =?utf-8?B?aW1qejJWUzVhM2lMOHp0Qi8yeGQ1a0krbFUwVVVMZmUxTUNRTXVyMjNxaUVo?=
 =?utf-8?B?bE50WEkzQ04zN0lsb1llS1ZWWlVrVkFTRkNnbmp2VS9OeURCSXRHOGd5ZWtm?=
 =?utf-8?B?ckFiTmZWRVFFQzdacHNBdFBCQWJzOENLUXVkUDJLWWUzQmVhUVMvYUFGSnhu?=
 =?utf-8?B?d0liczA0TXlYZ3NZSDRVL0JHTXUxb2hSWGVTUDZCL1kwRDlPYkprM0J4TmVV?=
 =?utf-8?B?andIL1EwL1dCS1k4L2o4MkNPQmRJdWQvV1NDR2k3V1EzbHBTNzNwR2lwN3Nu?=
 =?utf-8?B?OXFvVURjQ3FSQzNhbnF6UVBUV1hCL0diTVdzdVB3MmdQOTZLcjl3SmhCSHBP?=
 =?utf-8?B?R0JYMXp2QkdlTWMwMkVoVFJzK2N0MnRmb2FHelViZmFhZ20rekg5M3dLN3ln?=
 =?utf-8?B?cFJFMVB4QW5HV0lSUlBhRGdTUTdYQlFOMll2SjU4RXMrYk13YlZDRVYySmNI?=
 =?utf-8?B?R3lwYWlZQzFTUGFKN2ZGUDlVaHNPck83NHVXSElGTFdxa2E4cE9mZXZ0Mnk2?=
 =?utf-8?B?SGRpa0xZVWJlWHF4dWFCQU1BV3AwLy9YaEZTMXovMlZKMWtXY1JZaVFBbTBY?=
 =?utf-8?B?TXZIVTBvUk1vUHFIZzVsaXJFVERFQko0T0YrUFRUa2ltVlc3cVc4TlJPNmFp?=
 =?utf-8?B?S0R2WlhhbzVRRzRjZlFjcE1uOUVsck8ySGdUWVp2TTZlMmNwSFI0VXdET25n?=
 =?utf-8?B?aExUZVRrb2FQbXpDdjVXNXkvaWpkdnFpemV6eElpNGFpVVVNTnFEOHNJdFJ6?=
 =?utf-8?B?dnFPcC9XZ3RNTWZBQW04emlUSTFtN1VBc1VNOUN1WkdpbUlpTVc4bktUK0Nn?=
 =?utf-8?B?aUpaU0pzRWtBZDVqcXd4aUtRLzROZitNcmlDWXJLWWRBbHRTYnkxK29QbzFh?=
 =?utf-8?Q?GgBKPPIezc/QpFK03pNFk5Nzn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade83efd-218e-4826-f899-08db634b77f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:26:39.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzMkrGzSr2Euiu09TsipLdO+g+9zWbXAiwkye+P+TZ9QGkt7DvrA0fP1gYKCmSqWHWY9KBFqPzU5oWl2JSoqoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180

On 02.06.2023 11:19, Jan Beulich wrote:
> On 02.06.2023 02:48, Vikram Garhwal wrote:
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -18,6 +18,7 @@
>>  #include <xen/device_tree.h>
>>  #include <xen/guest_access.h>
>>  #include <xen/iommu.h>
>> +#include <xen/iommu-private.h>
>>  #include <xen/lib.h>
>>  #include <xen/sched.h>
>>  #include <xsm/xsm.h>
>> @@ -83,16 +84,14 @@ fail:
>>      return rc;
>>  }
>>  
>> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
>> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
>>  {
>>      bool_t assigned = 0;
>>  
>>      if ( !dt_device_is_protected(dev) )
>>          return 0;
>>  
>> -    spin_lock(&dtdevs_lock);
>>      assigned = !list_empty(&dev->domain_list);
>> -    spin_unlock(&dtdevs_lock);
>>  
>>      return assigned;
>>  }
>> @@ -213,27 +212,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>          if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>>              break;
>>  
>> +        spin_lock(&dtdevs_lock);
>> +
>>          ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>>                                      domctl->u.assign_device.u.dt.size,
>>                                      &dev);
>>          if ( ret )
>> +        {
>> +            spin_unlock(&dtdevs_lock);
>>              break;
>> +        }
>>  
>>          ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
>>          if ( ret )
>> +        {
>> +            spin_unlock(&dtdevs_lock);
>>              break;
>> +        }
>>  
>>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>>          {
>> -            if ( iommu_dt_device_is_assigned(dev) )
>> +
>> +            if ( iommu_dt_device_is_assigned_locked(dev) )
>>              {
>>                  printk(XENLOG_G_ERR "%s already assigned.\n",
>>                         dt_node_full_name(dev));
>>                  ret = -EINVAL;
>>              }
>> +
>> +            spin_unlock(&dtdevs_lock);
>>              break;
>>          }
>>  
>> +        spin_unlock(&dtdevs_lock);
>> +
>>          if ( d == dom_io )
>>              return -EINVAL;
>>  
> 
> I'm having trouble seeing how this patch can be correct: How do present
> callers of iommu_dt_device_is_assigned() continue to build? I can only
> guess that a new wrapper of this name is introduced in an earlier or
> later patch, but thus breaking bisectability (either here or, if the
> wrapper is added in an earlier patch, there).

Oh, I'm sorry - looks like I overlooked that the 2nd hunk alters the
(sole) caller. Somehow I was under the (wrong) impression that both
hunks fiddle with the same function.

Jan

