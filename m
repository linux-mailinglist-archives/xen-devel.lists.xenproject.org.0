Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287267DED0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 09:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485353.752516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJfy-0005vV-UA; Fri, 27 Jan 2023 08:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485353.752516; Fri, 27 Jan 2023 08:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJfy-0005su-R5; Fri, 27 Jan 2023 08:01:34 +0000
Received: by outflank-mailman (input) for mailman id 485353;
 Fri, 27 Jan 2023 08:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLJfx-0005so-OD
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 08:01:33 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf53fcab-9e18-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 09:01:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9406.eurprd04.prod.outlook.com (2603:10a6:20b:4da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 08:01:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 08:01:28 +0000
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
X-Inumbo-ID: cf53fcab-9e18-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW0OGY1D87CM8jgZm0mLxPeowJ3CtaXPwRD/DlByNkch1mr3PZ6rI9otkp1zAaX9WQedOPip7oF5ecQ3HMqBVO7jnM5YvIyXuS1Ki6pKWm5z6T2JpDHHdnnl2JaXzGgzV/TQ9O4QIzAEHvrMIjUV+ASVX+6Tjlv8GMl5Jh6Ouwzgo5JxmFSk1MUtuor3TtbMTei09DAbwfmnPqoLwXtJxSnLkk3gkkJ8lDGS24dfP+V7ZnrTLIFFYUQZbhw+wPEaganRTiVOx0yhwqchetOWpm9SUPHuL6zyK1MRL4cfOyHAVFQ6PhdaQ4jrmKWeGHymYM+QQoFPsa1yFMWyOVM5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YnwN72aDMnVZqr5t87pf8kep0aqn1v1Av6qUJI9B34=;
 b=RyaddUlONyHCWP34F9N0glczzX18E1GhAVl5zfelWZuCrRag1lje5xBNAghIBkqqALTGF2tCMjUWumarBdxrc5oSOROPZBYhN+MzkRtpmjnzpRQPgPgtQz52TEddJJdHOLSkGsZHFb6kBqMv9xYqEFjcqBkkd/Z4Pp7Qu43GOuE86moEOivD8hOj7BIfhAvuIUkeR9mflQzkcO8LLD+otYbD9GmhsIBlheOrcTYOPMcd8PQxaj1P50mBRAhYjYxq1CTWgD3rv4OWp8eh6EhEsOOfWBTDVEOsAUk5jojoYUsfQnvuFHZI2qeVW6bLW1uppOFxTdkiHBBWTUgRVKPzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YnwN72aDMnVZqr5t87pf8kep0aqn1v1Av6qUJI9B34=;
 b=bq8HmN0Pf4zHDmQUrwFy0Ywn229xzD4+UotWSZdOUdzX6tGjd2Q36N0/5VhTF935HKoXMUafLLKhXMjy2qu2GwmqChY4Dp4/YwB+37CgHU5cO6G9QNkYNY5zqqhciR1SeXFzjoAS/TtuUAZeJqUMWKxcz6QgIU7nyprOLAuc978xa6R/+7CFbC2vTn1lUSQzGl62tDe7f4jewDdK5MVAjzhuP6M8uJcsKcOfTsYmo0jkINoFaupuPcv/hMafHTQKxQH4IkYaY02xKojFAr+7ABaHNahyCghUJltjKVdqbW3Lv9OLxx3m2HeW0caZIBzBKHiFTudujbGlWqZ/gi6w5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2579d8d6-acc1-8a03-098c-87c8247016f5@suse.com>
Date: Fri, 27 Jan 2023 09:01:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Stewart.Hildebrand@amd.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-2-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261435230.1978264@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2301261435230.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 232ff92d-f126-4143-5112-08db003cb1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMmxM6QvP7G2F517dkuMAqANTTEJEfl59a0MsIO3BboqfX5b1mmZjrvDQNeV1THwniKY29XYqdgWDuOe+2W2s1DFWEao03bkLUMOvwY9WpHzRkJ5EF/72nUFUl8XlLCBp/hj3pQovbCdWKKbh3kJ61yC3BR7l2BB/752wyuvaRiv6ak09oRtL8ENtxS7KDYhEBxjnR9hQP2PKog+z02OBW7kNpNRPfzN63dAYoKpJtuHM6u0ZKY1fGVed2nTewCvcHa2mW9mb0MHCnxGW/YwKt7kApoiklbKdtEN3oeHow+IbdOwGvYOeGEh9rXgpixFCzauzhRXwiJDMl4Hse5TdAYLMWYN/VDdQzNfWdnRGTb//NhrzUSoWJgpmdbxtDuP1p/pwbDwVmmQy8cZYUEo2VCX7x9r6dIHaDgkDhQu8cUctcPb7KFeOAbqOAUYnLyEyTNUVODkN2M+RYPvbep1z/Xa/bZzNe69mUQwDa1d9Tj4kvLQtHGSWMpxiTL0IlNRsnCQhVBzd+Oslp0gimYvSpMMx16tNPV5jQEZtrhU+90bTGZIgVdZiqQ5PMG30nKVeEkWCbanPbMpOAGPL7G9cBH64LY4g52vdZK4CumqU4em1jD2npbZZOS8QKqb4cuPu5OIYo2oP35YrfkpDAPT0Y27Zs5rQmGB09DWlSCLly2nZHFKfR8gT5LiNrsXFuJ8Nh7ZOyQgfdf9Tir9ZJKPjL7ojCOlN6WnRMrVcJt/USk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199018)(6506007)(6512007)(83380400001)(53546011)(316002)(26005)(2616005)(186003)(6486002)(8676002)(478600001)(4326008)(31696002)(66946007)(54906003)(86362001)(38100700002)(66556008)(5660300002)(7416002)(2906002)(36756003)(41300700001)(6916009)(8936002)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnJHKytCbk10L0tjcG8rS2xQV1NweHVPa0JpM0lpSEloVHphOURMbkY5cjB1?=
 =?utf-8?B?VjJ3VEZyNW5NeWY5Ylh2QkJ5UzcyYXhqVjlCNE04Uzd6WWhETnphenU4ajc2?=
 =?utf-8?B?NmtYN1FmNzlaZ1E1cjM2Sm40dFdTMm1YcUpYenVuTjNwck5DSkJtOVdJR284?=
 =?utf-8?B?cmFxSERDTjNNUTl1TVFsQ3p3a1VIYldTNStCLzNJTy8rS252Z1pYWVJlVnRt?=
 =?utf-8?B?V0tzSnhHb21LQ3F3Z1g1azhSVXNHTGZJc3RiMFV6NUFvSnFXVE1qRjZNa1FG?=
 =?utf-8?B?UE8xQW0zZDczVXAyL1hPRHJTeUxpQWxLeU9IeFpjaHBRaEltUGxlTlFnYTMr?=
 =?utf-8?B?UWhkcElhMjFjcSszaVlzVnE2MEw5Wm1PZURoa1czbjVwYWhyWkcweGYzM2wx?=
 =?utf-8?B?dXlySk1TZGtUM2hncWFMN0RmcmxjOEZYVkhFUlVNNVdaVVFUc3lqN2Vnc0tm?=
 =?utf-8?B?V1ZrL2xCTlQrWnVORGZIcFJVdVJ1U3d5RHJBZExLL1dNZjhnTkV0WlBhNFo2?=
 =?utf-8?B?bDFsNXpsSy9mVTZ3ek4yV29LM1lYandOb1NYY2lFay8vcmRaSGtIVVgvSHZN?=
 =?utf-8?B?WVp3U1U3bCsvYWV5R2t5ZXlZZVNyOFBudWNLcW9IT042a2JlUFFhQStPSHpZ?=
 =?utf-8?B?d1ZWNUk4akowYjYvM3BrejJQRDA4ZkhXak9yUitKdmQzdEV3QWxiMzBQc1pT?=
 =?utf-8?B?aVdIUlBmOERkVmFqTEtXQW9kUk5oMVRGRGxSc2V6VzBSS1B0bGxpWHBhZFdQ?=
 =?utf-8?B?T3dMYnpoN2ppYmVkUFZuZE9PaTdsZm9QdHFlYVl2US9oN3V3NWFlcGpCcU1R?=
 =?utf-8?B?VmhHd0NCLzU1TFVFZzhqS2xzN1cwL21zZUpYa1R3WC95UTF6b0V3c2FBWG1B?=
 =?utf-8?B?KzM2WGZzUTZ1T2FleUtzblRJQkxWRnZ5am9VOWtTUitJZDJqV3N1SGRiOHVR?=
 =?utf-8?B?b0N6RXVJbzFRM2pQbTBtdEVuNnAvMWJnSVBjaTFsb04wbmtaSlJ3Y05NRGds?=
 =?utf-8?B?bWt1MzdnYXRQcEZ5YnFiZ2pVVXlhVFNDdjBIeEhFZDc2c3M0bVhuRHg5Vnpw?=
 =?utf-8?B?eVQvTlUyOGZlQm9Xay9iempZTWR4UGhkOEJhdUxLczd1NTN0SGdvbmJBWDhL?=
 =?utf-8?B?aVJ0SzMxTlkwanJ0YlpQVEhiS3JoT3pqcHF4NjU3RVBLUjFKNUd0a2lIQXI2?=
 =?utf-8?B?SWk5Z2hQKzBiS2tyNXUyOVN6QUlYemF0SUpkUXR6bVk0N2lRak8wWGxTUDhu?=
 =?utf-8?B?ZUo0NFJyY2dGZXk4ZHIrR3MyVzhpQ2FwL0JncnJnUk4yVkVzZkliWWs1b0Zm?=
 =?utf-8?B?eWU3dytISlcrQXROV3ZTa3g3WW9LMEdLSkNOcDhWUWxzakNNSEhndzdFZDJL?=
 =?utf-8?B?Qm82R0M2ZlBEVncvcXY1MDFNQlpnQmhUVkxhckFIK2YvUlJKci9aV0c2Mndi?=
 =?utf-8?B?UFZZM29ZQ29uN21oNmxBWkZsd20zQWtyYlEvbUdHSjBzVVQzd3ZxdE94R2NM?=
 =?utf-8?B?eGJoZldJOWJhYmM1S28wU2tPcTk4dUJGakFyQUlYRFZlWCtza1daUVh6aU9E?=
 =?utf-8?B?cmxzUWhGNXRNVnJUai9WRVdzU2tIRk5PTGV5ZmZxVFlaUmxJLzk2bGlHRVI1?=
 =?utf-8?B?KzI4T3VpS04zRFB5NXVxcTUzUENqQzI2cVVCTWQxUXdjOVlxSmhiYUFnWTZ3?=
 =?utf-8?B?elJKLzVWR1JSS1p2QnY3ejdybm5rT0ZJMUl3aEU0UmkxbTB1SGIrRlNPdTRy?=
 =?utf-8?B?S2c5QXZaa3N4eFJGYmErZCtObE9FNEpOTTRPeUtBQmZkdDlIb05rSnJEaGZs?=
 =?utf-8?B?NzVtUXpMU1FDOEdxU0RuZTdhTk5KdjRydlZEbTg4WkNXZ0pVUDBUNCtzT1VD?=
 =?utf-8?B?WjdwSGxiU3orWVFNUjhGWGtXamNxcFBPc2pTd3JTTlhhcEY5OU9aR1NnRldS?=
 =?utf-8?B?MlBUbnVrYnJPT3NRcjNWbkZBSHhyT21SWm1MdUhxd3BDdGFueWNWZ25MWVlD?=
 =?utf-8?B?VTNQd3p6S3RRSnlaeFkzaVBOR3U0eVRncjFqMCt3VWNFN3dNRmw2b2JFTlRn?=
 =?utf-8?B?amxpOU5RTzR0cjRNcWlyT2FENEJLejJBM0lPTTBTNG42ZmxHRENRVDl5U0ZN?=
 =?utf-8?Q?kyYsyZPoI5pNMf98DaMHVVj6q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232ff92d-f126-4143-5112-08db003cb1d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 08:01:28.5957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XouGEt59OZah5fayniz8PQKr51ZBIAnc9cWKi0RDdSbUUj258fFQqM44EYlBK9p6/768EnoBxDqCdSbzxV5ecw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9406

On 27.01.2023 00:18, Stefano Stabellini wrote:
> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> @@ -1571,6 +1595,7 @@ static int iommu_get_device_group(
>>          if ( sdev_id < 0 )
>>          {
>>              pcidevs_unlock();
>> +            spin_unlock(&d->pdevs_lock);
> 
> lock inversion
> 
> 
>>              return sdev_id;
>>          }
>>  
>> @@ -1581,6 +1606,7 @@ static int iommu_get_device_group(
>>              if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
>>              {
>>                  pcidevs_unlock();
>> +                spin_unlock(&d->pdevs_lock);
> 
> lock inversion
> 
> 
>>                  return -EFAULT;
>>              }
>>              i++;
>> @@ -1588,6 +1614,7 @@ static int iommu_get_device_group(
>>      }
>>  
>>      pcidevs_unlock();
>> +    spin_unlock(&d->pdevs_lock);
> 
> lock inversion

While from a cosmetic perspective I of course agree that releasing locks
would better be done the opposite order of acquiring whenever possible,
I'd like to point out that lock release alone is never subject to "lock
order" issues. We do have a couple of cases (I think) where we actually
do so because otherwise respective code would end up uglier, or because
we want to limit locking regions as much as possible (I'm sorry, I don't
have an example to hand).

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -457,6 +457,7 @@ struct domain
>>  
>>  #ifdef CONFIG_HAS_PCI
>>      struct list_head pdev_list;
>> +    spinlock_t pdevs_lock;
> 
> I think it would be better called "pdev_lock" but OK either way

I'm of two minds here: On one hand the lock is to guard all devices, so
plural looks applicable. Otoh the list head field uses singular as well.

Jan

