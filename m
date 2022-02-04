Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913F4A94C7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 08:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265119.458418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtOx-00073Z-Ch; Fri, 04 Feb 2022 07:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265119.458418; Fri, 04 Feb 2022 07:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtOx-00070g-9Y; Fri, 04 Feb 2022 07:53:03 +0000
Received: by outflank-mailman (input) for mailman id 265119;
 Fri, 04 Feb 2022 07:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFtOv-00070a-LQ
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 07:53:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 789cce1d-858f-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 08:52:59 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-iG4dhRilPvW1SLfQ1GZq9g-1; Fri, 04 Feb 2022 08:52:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3762.eurprd04.prod.outlook.com (2603:10a6:208:3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 07:52:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 07:52:55 +0000
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
X-Inumbo-ID: 789cce1d-858f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643961179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3e1pm3Fm1Vdpk8T3tYL0kSS63VDrtItiFu6xb5gSeQ=;
	b=LCEgGAD+w7B0thEvXcq/M31bjg+bIQO7G8/YKjWOqyqW8e3gP4GYDs5IiiU/aWlNxEWovp
	dFDEQ8FSmCmubjRm6/0Ms/O8b8b3BVd4P3eDi+rnajyDHHsSA2T2xG/eNPfiQN9ajofhPn
	PKhd3ZOoNOgSG9/9zNQIaywmR1QFQe8=
X-MC-Unique: iG4dhRilPvW1SLfQ1GZq9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgRpOfS9HxFZIBnGvtrWdgdG+tP7VkJh4MnipgIEEbedUIwYw+lR2Qc7gI89su5YjYeeBzrHCzpEHNHSSGcZG1bBjia4GC01BE6jTBen5bWmkQS/K7dxHiZqQ+abVGcQxu+mJ2qkH2jPqQmYlOTKExf5umud6PzFdSnddBowRSM6mKSPvJ+2enWii6VeIDOV8qDVJV0yGfk6OlCGT4dl6WNcgkh5vH9pi+S9+NYau2T1iU7pmMSHYPiZ7aRCOMVOxuwj17NvjZSDdAmEP9JDg12QLyGk9VYdlNjiokVz9vO/PXyhL9F5BXRAT25eA1KUAEqGUMKCbhFnGpR6yRgUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3e1pm3Fm1Vdpk8T3tYL0kSS63VDrtItiFu6xb5gSeQ=;
 b=CCt5nVWT158XTXRYfGZMPnoLWSIR7tsENi1k9yKp05BdIHOhERlJwdYj9TakRLLTLxJgEqxOmjtdiOiHn4OL3PskWO66GL+1mb+o5Wov/VxOEEgO7aca8jCF/PPSTQ8qkU4hlYm8+qRa962NdyE60wIXMtfMUQ/VO2yDV6Q5d3oU1pvze2gw3xUqh2cOLzIOlNNQZKEoD2xPZ1eByM2Y/kSqoIECPeR7bNahCEWKcP1M+nFzva/uT6HD3zMRAveg2ac8nWTmiNL+PZ9GGVp6BLXSYYkr4VTduamIb1F49W1rj6w+uHpzgbGAtmn9g10SNMM/tBDeWqx2Mv9tSWWY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
Date: Fri, 4 Feb 2022 08:52:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>, roger.pau@citrix.com
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-4-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0018.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61bde2eb-c408-4192-23da-08d9e7b35a4e
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3762:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB376239D3BB2418521578B8EFB3299@AM0PR0402MB3762.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qPcZXF3CYk8tjRGNkd5AhqYZ4p7mRvvf1zzeHJcsCvXXvyUJoFV8cck0cE1YWzaR36N4n3rOYbMMm+KSZRlfZ7oqxv+R0VoqpyuZdniZTCTu9J7Zg1PdoCfDqoXoPbXIparYoHthI1iHAko1+HZtPWTyysnFQOQZ/ndsTogB30f/ov8vY8uLTJ++A8cz29AvqCChFO6/ASMftOdPon7MvFRVD1QQrvnEncxPn9Ti3jibpgXhi4QgGnXdVhHh85PUvRbyAQDzNGS4c2UM4pi9L9iTHbHTUOFiIe4uNjQq88jYIRc9crLJOCPMuor3UNepIOUQ69F23WKHuotYmRmDTnxy12DWX8TWLF23LiRRoFhvTrpUhjdUSHVe0z/MQ3E6TJ58BS0uecHB+tJ4PHOCgd6I9YDEv8Ij2xJXcNxN0CLIVsmfkk6zPvOh+AolgxbbOzq9taoUtLz9qR53IDminVyXUfS6AMKFwgmpRjwmKVMCfR9uqONoDJdEY1JijlAhpx9oyCxFw66BL3S5bjd6SLWIUQ0ilQsPVV5gWxV5D5pi7BZob97IErVCgOiC0dOZ603Tt9tJUf+c30lWSSwH6SvKxs82D7QWwDiWBu9N07IPvb8TySZShV6F1yZl/cBTnQoHSzSMsfy7wwMLexNNf5QC700PUar5Ahf9Y2sWlUVvc6wdAGBmVCdJYgIEbU29ueKLIvKDmoGaRV+OD5jVj+/nSAo4ZNRHC9L+yj629Sj/n7C7ZmfnMGKs1DzY2zU8fw0+jpeT18BnWc97iObAPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(508600001)(38100700002)(316002)(6486002)(7416002)(5660300002)(66946007)(66556008)(4326008)(66476007)(83380400001)(2906002)(8676002)(8936002)(6512007)(6506007)(53546011)(6666004)(2616005)(26005)(186003)(36756003)(31686004)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVltQytxZ3IvakYveGF2aFB0eTYyTGJCeW5TUXlJQ3lWVHFRU2c2MkxUOHV0?=
 =?utf-8?B?UzhVZHJlZndabkkxNlh1YTFHWEdxeTFMcEdlSFlZdm03dnBFL1psaDgwbHN2?=
 =?utf-8?B?dEozbmYzR0ZVVkNIK284Q2FSQkVHNEswYmsyRWNEc2VqeUpHUHkyUnlsUDAz?=
 =?utf-8?B?U011bWhzaFl1cWd4S25VUVdWUEluL1EwVmcwb0tNNGl6eCt4NUFuUjJ1Uktz?=
 =?utf-8?B?MVROSUdzb0JObVhrdEp5V3BMZFFXS3RMSE9HZEw5MnQwYnFFcHZXeHY5Z29J?=
 =?utf-8?B?MWp5VG1rbmM3SHJybDlyV0lQNlhaK0hrRm5ub3RnMVRlOEhwY1V6N3h6b29D?=
 =?utf-8?B?QXNOekV3dWRmcDI4eGVKMWlSRldaa010THBaTU9oRURUbzBmd1ZGNW9jN1FK?=
 =?utf-8?B?Mml2bU4vRTNIbFRPZ1FzWVhpV21rWUR4QklPMktheWhwRHNHM2FZWjJVMnJV?=
 =?utf-8?B?QUs2dURkL092ZjJydlhTVFFwaEpuc0lvZ0FTWG40WFVGNk5LQmJncTBnd0Ji?=
 =?utf-8?B?UVg3ZVJpb3FoU1RsTjBSMUZNNnlOMGlDTk5kWkthai8xQjdlbktmc3ZSUU5q?=
 =?utf-8?B?T2hxTExUNU5qclAwcDJROHhnL1ErYmtaclBBSHRQZ2dobkpSOHkrSUxlVUox?=
 =?utf-8?B?c3M2T0JKK0VRSlRaSDhvNlhyVi9XQ2dYSnMwaWtEMXBaOEZuemIzaDRLRFls?=
 =?utf-8?B?d21FTGtJQ1VPNElOMC84Sm1scFMzdEMvTXBiM2kweXVLbTBLUU1DZzFmZ2VT?=
 =?utf-8?B?RERFNnlKVWdpanQ2ODZ5WXA2dDZxb0dWTll4dkR2czR6UGtTQ1R3dGNvc01D?=
 =?utf-8?B?djRES3RUTjhKTFV0S0wvNE9mWWVDb1hWNXVwRTdpNmJVVVE0RXVEd1JJQUc2?=
 =?utf-8?B?UlhPRng4VUVJUGthZ05jTTZFZ2MzNVozMDhMTTN6WnBRQWc2THR1LzhpMUVw?=
 =?utf-8?B?S2VDZGJqQlM0SVdEMzFGSWVDNzNhS1NmK2txNWI3UTB0M3ZZaFlMakkrSHFp?=
 =?utf-8?B?OVQ1eEY3T24yYzBBT2Vjd2tmSGgwOW0xRW54NVJxQ3hqbWtoNmg4NmJxbUxr?=
 =?utf-8?B?K3JMYzhRSGg1d0RiYi9VWFZldzNWVk94ajJZNDJLQWdMajBydEpJUkVPNzhO?=
 =?utf-8?B?ZkxIQmJvam5ZbU04cGMzSG0yaW5VU2VEek01bVRNKzlMc0xvT3Q2UXA3WE1l?=
 =?utf-8?B?OU1VelJYZktZTEJmQ2dnUXdrNUZya3dhYXIyVWN1NHFuNUZSSWZ4dFd1dWEz?=
 =?utf-8?B?M05ucDArNnk0Q3JjUU5vb09Vb25NbG5NdWNWZk9yL3RFQ2dIemdhVERJNzJZ?=
 =?utf-8?B?Skh4Vzcxc3J3eTRxdG5VTjByLzZjcldETFJuYW5WY3lUTWFVNFBGeFg5M2xl?=
 =?utf-8?B?MlhEUEZTUll5S2hJZEZDOHM1aGs2eXJiU3lGWStPUHY0Qk9GdDhkbWw4Snk3?=
 =?utf-8?B?djduL1VIMGFwVzlBMEgwRzRuaDM4Mm5oTUtHcnUzLzMyc01nZzFKOHhybmg5?=
 =?utf-8?B?eGJHc1JLMHVBdTFwTG9IcG93MkltaWlQME5pN09jVzNnVy9laUdOcmd1cDYy?=
 =?utf-8?B?a1VnYk9GUGVnRXZ4aHNqTjBRU1JtN05XaGZOV0wyNWNKKzVnN0RvUHFqbU9h?=
 =?utf-8?B?azJjOS9pNXdkQjlZaXZlTWxQUTYrTEp1dEpWMGIyaEVoTGNtMFBiR2JMRjRk?=
 =?utf-8?B?a0RVVHAzZ0s4UDFoV1MySE83WkZmY0FKamwxajViNFlxRC8ybXduYjhpUWMy?=
 =?utf-8?B?N3NYUzZEOVZld3YwdS9DdWpJSnpMVUgxeEpDZVNmY3VrSlVxOW84U1NtRENr?=
 =?utf-8?B?WEhVK3lyc1pSb1lJQTFPNFpVTHRSN0hhN25LZWFBa09CbVhYT0JSdGVwNHRy?=
 =?utf-8?B?M3RhRy9HTHRwVkdCK2pDdWZmbm9GZXFNWjVHbmVvSTFnNU1RRTBac3Uvb09y?=
 =?utf-8?B?M3VidHJqNm9HSXFXS3pWZU9DcUxKOEg0Y2pwMUplOW44dlRERnZaUjRXVTlU?=
 =?utf-8?B?Rm5YbEtCZ0NLczFKWWNrTDdkSlRhM3B5WFQ5WUdjWnFod3JYN21xT0prWGFz?=
 =?utf-8?B?R1NoSnErVDgxU281WkdkV05ZWTFmclo5R0tuMldYbzl5WlNldlM4VkhRZVRa?=
 =?utf-8?B?R0hPYTB2OHQ0RTdHZzhIN2pnY0hHODcvS1QyVGtudktPL0c4K1ZEc2laK2Vt?=
 =?utf-8?Q?/whsXk8Y0cISPoxWPMBEkzQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bde2eb-c408-4192-23da-08d9e7b35a4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 07:52:55.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeQk2yUG2aPsN4CASrEZrD5PC7HiWH94eN1Fc4bIGp9B4ydGFU5ANl7FFYvcMpQ1K8tAt1nFOQSZdINoR1zbiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3762

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  continue;
>          }
>  
> +        spin_lock(&tmp->vpci_lock);
> +        if ( !tmp->vpci )
> +        {
> +            spin_unlock(&tmp->vpci_lock);
> +            continue;
> +        }
>          for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>          {
>              const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              rc = rangeset_remove_range(mem, start, end);
>              if ( rc )
>              {
> +                spin_unlock(&tmp->vpci_lock);
>                  printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                         start, end, rc);
>                  rangeset_destroy(mem);
>                  return rc;
>              }
>          }
> +        spin_unlock(&tmp->vpci_lock);
>      }

At the first glance this simply looks like another unjustified (in the
description) change, as you're not converting anything here but you
actually add locking (and I realize this was there before, so I'm sorry
for not pointing this out earlier). But then I wonder whether you
actually tested this, since I can't help getting the impression that
you're introducing a live-lock: The function is called from cmd_write()
and rom_write(), which in turn are called out of vpci_write(). Yet that
function already holds the lock, and the lock is not (currently)
recursive. (For the 3rd caller of the function - init_bars() - otoh
the locking looks to be entirely unnecessary.)

Then again this was present already even in Roger's original patch, so
I guess I must be missing something ...

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -138,7 +138,7 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> -static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
> +static struct vpci_msix *msix_get(const struct domain *d, unsigned long addr)
>  {
>      struct vpci_msix *msix;
>  
> @@ -150,15 +150,29 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>          for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>              if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
>                   VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
> +            {
> +                spin_lock(&msix->pdev->vpci_lock);
>                  return msix;
> +            }

I think deliberately returning with a lock held requires a respective
comment ahead of the function.

>      }
>  
>      return NULL;
>  }
>  
> +static void msix_put(struct vpci_msix *msix)
> +{
> +    if ( !msix )
> +        return;
> +
> +    spin_unlock(&msix->pdev->vpci_lock);
> +}

Maybe shorter

    if ( msix )
        spin_unlock(&msix->pdev->vpci_lock);

? Yet there's only one case where you may pass NULL in here, so
maybe it's better anyway to move the conditional ...

>  static int msix_accept(struct vcpu *v, unsigned long addr)
>  {
> -    return !!msix_find(v->domain, addr);
> +    struct vpci_msix *msix = msix_get(v->domain, addr);
> +
> +    msix_put(msix);
> +    return !!msix;
>  }

... here?

> @@ -186,7 +200,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>                       unsigned long *data)
>  {
>      const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct vpci_msix *msix = msix_get(d, addr);
>      const struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
> @@ -196,7 +210,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>          return X86EMUL_RETRY;
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        msix_put(msix);
>          return X86EMUL_OKAY;
> +    }
>  
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> @@ -222,10 +239,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>              break;
>          }
>  
> +        msix_put(msix);
>          return X86EMUL_OKAY;
>      }
>  
> -    spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
>      offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);

You're increasing the locked region quite a bit here. If this is really
needed, it wants explaining. And if this is deemed acceptable as a
"side effect", it wants justifying or at least stating imo. Same for
msix_write() then, obviously. (I'm not sure Roger actually implied this
when suggesting to switch to the get/put pair.)

> @@ -327,7 +334,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      if ( !pdev )
>          return vpci_read_hw(sbdf, reg, size);
>  
> -    spin_lock(&pdev->vpci->lock);
> +    spin_lock(&pdev->vpci_lock);
> +    if ( !pdev->vpci )
> +    {
> +        spin_unlock(&pdev->vpci_lock);
> +        return vpci_read_hw(sbdf, reg, size);
> +    }

Didn't you say you would add justification of this part of the change
(and its vpci_write() counterpart) to the description?

Jan


