Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A276C4F26
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 16:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513512.794617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0B5-0001up-Ds; Wed, 22 Mar 2023 15:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513512.794617; Wed, 22 Mar 2023 15:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0B5-0001t6-Ac; Wed, 22 Mar 2023 15:15:03 +0000
Received: by outflank-mailman (input) for mailman id 513512;
 Wed, 22 Mar 2023 15:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pf0B2-0001t0-Tj
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 15:15:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f2f9f22-c8c4-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 16:14:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9748.eurprd04.prod.outlook.com (2603:10a6:10:4e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:14:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:14:56 +0000
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
X-Inumbo-ID: 4f2f9f22-c8c4-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLS16tGmJGAYIPYTYQjZ2a4Mkp2xUddKT0gcYSiCsj9UGFNj+ZG+JBdywFLMIKDY1Kvsj1BL9ORYEv2CEMyn4lRw9dT4931C8svFIJVedgl7rRm0XFgUaPz43J/6JjZY3KGKQzUFw0mrpxLxcuMoEHDpLFr4QtNAdtIj97mD8GSo0ljxEbVHyf1NegXCpsTp6sz56itDkwDheJ7ngCW1nPIIghfkNHaxluWHrKVZQqqiPK1r+xK/nk+irhD1Me4hCe+bvivPqmtRUoSUKBsu5nMQMkQM+YbxPsGKYLjo8uddY1YiCDTmp1yWw39gd7r9alM8uZBn+OJDosTesMg7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oOoc6GOlwSrWGbCnU9hAo7XnLCdXIRikZtBzrCOlIg=;
 b=XDAJn4pXVCM3Y8FUd2/Blye/PFfLde7fvzgVlAHl3A6zUUKAHX4XUFue7Pp3KNzFuLw8qRIH4OIqOmaAwnopMISWZcF8/MA+AikPUw5ynawarVjkMckkxzabiL7d57UOVSZ3M075RqTXV67yoFxktdHQE5drl8t0WvJPh+6cRp6kQPxWhWrBmD5MKVTZ7neBsY/uKZZwnDcr6xFEvl+sZKBro/3+XIDOLYal4FtPQ5l8H3JcdN4ImM+T/moMddvO0BygjlQ/wXlHkkrd9tT+tJu3YRKXf6bPKbW09FNGbZODWeObV2WOZfhKW1v7P1/Kmeo8InMyrjV6sMehrkI2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oOoc6GOlwSrWGbCnU9hAo7XnLCdXIRikZtBzrCOlIg=;
 b=fwIyinxhZWR97dHa0WJ9Jq5DfE2Uweo8639nswwnTH8EQj3518M3ouzxEGLpLh4pN0DqXpT41HCEA5o8WVa1JLmiYI3tsC2GuzWPB2yrjZLWxdFZpChWaQAcwAoRYZewAZFPdWzxh5Pr28TUPkYMAF8UIzeVanu/cBB492Tcb9/G6XC9zq7Xcltmmo1d9h2lOWA2t74JLfiq6EesvYR9K1yl1MZHXi+M2MqxwpTfS1QKLLjpZIO7U4tLMT0L1KUEmmdhh9zWOAppmoIRBAWrEuHzqsYmDJcmqG5IAFnBQfsdLNCO/yPU0Ihpy3ZOwkUYLFbbpRo00ZKMy6gstdR58Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
Date: Wed, 22 Mar 2023 16:14:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230322143001.66335-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230322143001.66335-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9748:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab450ed-2de6-4f1b-a3dd-08db2ae831e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fxL4zSJN12xl4SgtO5/hO/06O5wNQMWxtcbF6Q8roZzoS8TwO9vyPJoFSVQfmmS4pVTFFA9DCX6WfOUay6JJ65dGNQ5wK1G21O6Ho/26m7xOkmIipPWDkvdn3KbSrmy2QhKTtRHpqxNmRAD8uASH57uZuZqhI5lS40d+M1eu10Jvx0XRruqE/RZLZhcG7CU5BkU+zXuqzzTmgAablld0wxjJ32+Tq1asxEVfP+bU05ewCjDlrgqkuMsYqWZZ7Uo7wZhiRaBUmVsTv49XohiX9OkY66vFiHuo7/O8FpA7q8lnwo6fRN3k2Nmd0cAWDPCg4BA/OA21Q/ORmN4VgCoJ3R9EPh+1sQ+th+fCd04hL//7a1ahCJ/E3VLKgiBzMkAHDgWI16S75QV5nFscraMtkS6HcV1QpVsoHQsSfDEXzjdQV03WK9JF5xamULw0h5vvuslpfywZZvbeHcdFYLM8sEVwgQWnVu8pePEwTPZen0Exjfl7MGmeJZNwfqnvfQlb/kPI6EI+f3/aD9Ki8FXiG4Sqa75QdtFGuS5Za1+qxYrt2HVQz5go8yn7rnCySHyv+S2qJ+zYDLPcvMfVB7v+LPA+0flQxg1pGmDyC6btrncVbiCpqthgaCdWcTXk9XAhSOZ8hv4MmIdb8f9vTjrvtDbrL0yBka9lJRAA4Eq7CRdJ4mrM3ZHcjoZK2MfpL1Hg8/P9TI60Wiwrzpsr4p13MBNI/RJJNHRM1D10ID536WI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199018)(478600001)(2616005)(6486002)(83380400001)(316002)(8676002)(66946007)(66476007)(66556008)(53546011)(31686004)(6506007)(26005)(6512007)(186003)(6916009)(5660300002)(41300700001)(8936002)(4326008)(38100700002)(2906002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUxnWUsxQTduejJjU1NtSzdSU3YrbjVCMG1DOTA3amZwUEtzM1JJWVlFNzlM?=
 =?utf-8?B?VlVjSzhBeERsbFdlS281SnJndFgyMG1BY281c0ZnV0liRUthbmd6ZklrbXJE?=
 =?utf-8?B?cUFCZFB6bVo3WnFpaHNkMEtaZ0pCRjN3QzQ5S0dIaklEMHVIQk1BajR5NjVz?=
 =?utf-8?B?dkZxOWFzNVZYUStiNUZNQ0NpWkRkNEZ0NFBvVmZoQURMTWUrbkVZMnRSRnlD?=
 =?utf-8?B?MFNHT1ltZEtrVWxFRmJIR3Q4bkkzUXAwWGxrSTMzTGVtV2V5bGNZTFlsaVZ6?=
 =?utf-8?B?ditaVzF5aXdyZTFKbmZqUHI1dWU3enpmNjAxVzRrR1JUTEpkdTNkZHl4V2g0?=
 =?utf-8?B?OC92dEthSWhKaXJiM1J0bUoreTVwRE5Ra3lMRU5idURHekRLaUgvREFsd2Np?=
 =?utf-8?B?c1RHZmlvMVN6a1V4SFlzZVBDOFYrc1FEbDRDWEQyYVBJcC9Odm83WEN3NHhy?=
 =?utf-8?B?ejNBTGJlRE9KeWdDem92NG9iS0w4Zk9BUHM4SHVITEo2Vy9ZdS80bFpOd2M4?=
 =?utf-8?B?SHN0YmQvci9ENmg5Q2hWTGNiWEZaYVpmUHd6RDljQVBteEZpZFo1cEs3UXRQ?=
 =?utf-8?B?OHpuWFdBZjdyVjE3T3d2d2dWdkY0QUQ0OFl6ZW5hY3J2UEI1c2tuMS9Qc1pV?=
 =?utf-8?B?VW9CaHg1TDgzMWlGaWd3SWlEYnVTckR0N0NxS1JlL1M3MXEyVGdkOFJsaWNH?=
 =?utf-8?B?Sk1ZOTFlQUVXOXNZdlVIand4MUp4OXRhNmo0aWFoT3UxaXM0UzBwaFZpSE5z?=
 =?utf-8?B?YlBzQTdsaFQ2ZmxNNWhLbWp3Y0NKWVl4aTlBZHRaWnBHdHBzMUZ6c2dvQVBO?=
 =?utf-8?B?TjJ1cHhNdFRkSGlSTnNEWEZyWS9Hc3IzbEhSQTFOMG9CYjdJM00wWTcwa2li?=
 =?utf-8?B?eGJxY1NFY2xoUW1qMDlTQlkyTTBnbUxIRnU2Q1V3SUNxZUZFWEF0MllaWStO?=
 =?utf-8?B?MS9xMHI1SGZQVi9hdTNMVzE3a2JJVFFJdWFvUnN5RXdhVktNbFQwZmdKMEJG?=
 =?utf-8?B?NUttUmNUaVFabFBLckFYLzZ5aXgrdnFFb3R0OU5zbTV2Q2xXdVlkSGYwcXZD?=
 =?utf-8?B?Y0IxeU5zZ1R5Uk5ra01sR3lyeWcyWnBReTM4SjdnbXZ6VEh6VFFGVEd6VE5W?=
 =?utf-8?B?VGZWZWMwT2dNU1ZOaE5sR1JrNWkyaFc5NS9haFhSdldtYWc0ZmYvTElCQktZ?=
 =?utf-8?B?dkFacUloQjJ1Y0VGcWxQTm94bDBuVE9yMFM3emd1YXVlU2lvQVRMajJWNGxI?=
 =?utf-8?B?N3NqeTlIVjliUEhFV0daTkwrYnA0WTMrUUxBUHllT0ZPNlVuVk1qVmF1VDdJ?=
 =?utf-8?B?WUY5OWhWZGdIUVRobGhGWkhmWVhKYTVZcVlhRTJJam9ZK29MT1FlOU1NOHZW?=
 =?utf-8?B?NXBNNXhiY0ZnaWVpUGdERHFsckpHNHUrOHBYQTM4VG9zSHh0ektNekxIalVJ?=
 =?utf-8?B?VTdKd0ZRRmNyV0JFcEE3NlZTSzNYR0ZXY3A5UWpaYjJCelNZcE5vUHVxNHFk?=
 =?utf-8?B?a2hCS1IzNVRaRWJmR0F2UU1PTWorQ0R6K2ZROVdVcHRmcXpXby9URTJrOVBv?=
 =?utf-8?B?Vm00M2dySlB4c1pVaFkyTnVWTlgvUjVKaXE2WnVQUHcvUTFNMHE3MXl0U3Ix?=
 =?utf-8?B?bGJUS3VMZWVJZWdxbTlyNGJRellLK2FwcC9GeVZ6Ykd1VExQdDhoUHpoTDJn?=
 =?utf-8?B?TEN0anR2OXN4alhMZFhEdnVFZlB1MjIzbXAvMjRiNm9OVmVibXl3bWwwUWVQ?=
 =?utf-8?B?eDZUL3o4d2hkS0xIVlQvZXZLaHY4RGFoTVNXbUJ2N1g2Sm82RjdHekVyd1Rx?=
 =?utf-8?B?dmlYYndXQitIUnVrQ3BLTWthRzdYbWRsTnIwdm8yTU1STko2YlJiam1BcEpL?=
 =?utf-8?B?aWhZaTFvcUY0OVZ5Y1dVaThIdmhNK241dzdDblVmV1JMbko2dWVoS1R3RXVD?=
 =?utf-8?B?WE43K1k3OE1XOWsrR1pBc0phdHYyMitrNnF1aE84NUMyRjdBeWF4TWRScG1a?=
 =?utf-8?B?UDE4dXZ2UkRaYm5RVUk1RW1nRGRpWHF5OTBPY0JjbG9GdnRmam04bDQ4blJT?=
 =?utf-8?B?dDRzd01NbHk3OW9TbjBvYWxqNFNwY3RsR2JySWtIc1VEWFZpVVpyRTVNMGJ3?=
 =?utf-8?Q?INZcf3CGKzMF4gGS55S//snc7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab450ed-2de6-4f1b-a3dd-08db2ae831e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:14:56.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fI7a4JTXsEypNt/nTOKxVSL2ETZIppu86PJaXLf4c44/ACRogvN7xzG0c5VQKM4/NmzK6fdu6HTfQoHduxpYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9748

On 22.03.2023 15:30, Roger Pau Monne wrote:
> Changes since v2:
>  - Slightly adjust VMSIX_ADDR_SAME_PAGE().
>  - Use IS_ALIGNED and unlikely for the non-aligned access checking.
>  - Move the check for the page mapped before the aligned one.
>  - Remove cast of data to uint8_t and instead use a mask in order to
>    avoid undefined behaviour when shifting.
>  - Remove Xen maps of the MSIX related regions when memory decoding
>    for the device is enabled by dom0, in order to purge stale maps.

I'm glad you thought of this. The new code has issues, though:

> @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>  }
>  
> -static void __iomem *get_pba(struct vpci *vpci)
> +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
>  {
>      struct vpci_msix *msix = vpci->msix;
>      /*
> -     * PBA will only be unmapped when the device is deassigned, so access it
> -     * without holding the vpci lock.
> +     * Regions will only be unmapped when the device is deassigned, so access
> +     * them without holding the vpci lock.

The first part of the sentence is now stale, and the second part is in
conflict ...

> @@ -482,6 +641,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>          }
>      }
>  
> +    if ( is_hardware_domain(d) )
> +    {
> +        unsigned int i;
> +
> +        /*
> +         * For the hardware domain only remove any hypervisor mappings of the
> +         * MSIX or PBA related areas, as dom0 is capable of moving the position
> +         * of the BARs in the host address space.
> +         *
> +         * We rely on being called with the vPCI lock held in order to not race
> +         * with get_table().

... with what you say (and utilize) here. Furthermore this comment also wants
clarifying that apply_map() -> modify_decoding() not (afaics) holding the lock
when calling here is not a problem, as no mapping can exist yet that may need
tearing down. (I first wondered whether you wouldn't want to assert that the
lock is being held. You actually could, but only after finding a non-NULL
table entry.)

Jan

