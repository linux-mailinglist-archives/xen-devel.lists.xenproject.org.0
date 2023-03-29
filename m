Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F376CD742
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516145.799801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSfy-0005bc-Jl; Wed, 29 Mar 2023 10:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516145.799801; Wed, 29 Mar 2023 10:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSfy-0005a0-GC; Wed, 29 Mar 2023 10:05:06 +0000
Received: by outflank-mailman (input) for mailman id 516145;
 Wed, 29 Mar 2023 10:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phSfw-0005Zs-Ik
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:05:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bdc6805-ce19-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 12:05:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:05:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:05:00 +0000
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
X-Inumbo-ID: 2bdc6805-ce19-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUfiVXuGWDqMI4/gqIDUN1xHkCqqUsHxSNgTVqX8jGU57vJePszSu5IsAPNd5xdNJThr0VUJt/BtZGQkOM3MWyL6Oi1iWqv3VOVuT6VEkcqdG5FGP3k7IcwU64lHTmMIb6nFwvHwFCGMxdnJgQlSLXZ48jYJm16tlf5e6xGpyGmbJW8gBNr/RbhPG4Z2Xyz9vRkOcYz5kkLvtj0QtRy7Y6cynW8INqg3KbuUw16zye6zeZbTZHI71wXfvttR0sI/pKb36NhHq5erhWR3r6ro9eoBFPyQsetAojFoi7yAXQ/Ff8oLuk3FnmrF7f3G65wOfawDYPGEmDGRA/J/cFXkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9N7Kb9ZDYD6IGrvpuY9ZA50iPcP5rEl0mPeo9OWl/4=;
 b=PDVzd7p+ApbnqsOz+S2TLAbziwOF8m0lUdVIrukY5kUq3PO9AxOXaB+B15Q+fCpyB/nsOqKhz2ItumWzOstf1cC03RioLEqzVWgUV6iBVvpdckVE/5Ew7jjeFF/mIPt71JOMPkYnZRoBCUtx6ky0lzitGkve9U3uMsq+kLjnXJ9O7nN23KHDbvtqs4ImpMeEiC5CkPmSUTbnPlWp36Ro8jBxYzeWWiYSu4ByoRz6oa6XaNv1uzVD/R6tRyxPtReJRqOqT1ED3GvxL4LoIz5Xf650/fnKG4DL9Z5kS0ByVU4A88CvycaM5iOaRa00vEi+E3r7fTCd17IgGw+lxOgeSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9N7Kb9ZDYD6IGrvpuY9ZA50iPcP5rEl0mPeo9OWl/4=;
 b=weJ+swLv0IdiKTDbgfMsCow6hWfgrighidOonxf4p/Xf5/pBumoF4t4XGW8T+ixTeGFOIhj1gSeRWF4EMNh6uyxD9qKxRLbO/8FoeGTDKqm8Ns6ysZpFM5ie0ux1x7gcp8j6G+9Is+kYWaOXHvZSxrmxNxw2f1YtZcvyC9aAX4lxr87G+7RmrCuyVhrCNMrws9HGXEGD6G8G7wAn1VBHmZF0vIXIr5lvnxG0LdXPCBHLiS4JPtwsBtBHwB/g1AYBaFDt4Mw1IW9M2B3W+eswIJARaZR6zrVvr2sFFSC7kg6XbLojE8RI8ccq4DqTJHGfAfn1Qw45Bx/NVjX3jlEItA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89c52f60-5978-acec-c3c5-606942f419d4@suse.com>
Date: Wed, 29 Mar 2023 12:04:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b09f301-f933-45e0-db6b-08db303d0ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KOvL3/qbq1W+vmdKSXtv5pEDxWgp5gzqeSDZUbitDqZUqp+a0g92+K9ehGnY3wvl1osazhP2iJYMoQEDmSKCXpcPzJmaSEbwkX2/q1X0LGe0D9y79MN7V+9AMZxPtsZLehRp2T/knDMKG5/5+od8mRFsBAWEllZKj6Tja3eIbzF2HoDO8IsBYvtRr7DWtQMEziHsJ4CYZmh2SHyN/6X4+5BttR20R/6NJvhr9RDnZMuhLv2SmkSPHbYK9CQWgdRs4pw1LK2sfZv6JsL86zbjsp7B9KcR9sBqdzoCpc7pPaLCE2Yupf1pXBHm0/4TnQyzMgi191goqbEJyN49WhFeS9RZTteC4DzusT4SQ/ZiEeOCqzTwI4aEuq2FEFHdxrdokFIuFW0Qc6DeA8c0xR5nX0fx1uuD/1D+3jEv6mgmyss/13OVuWDBxaNlZvfDr5mS+vuDg4qKJLKmwqZfHP53ebMAb2n3TMrbA6rRoTumDb43e1OEWVd2MG7vNJz7K0l127iVJmX4RRnwK3UsxJw2KefsoaNyOXyCpHGYEAS/JdkYZDlnWXMOyUOkya4bkYFULPSqzW/vEtQyf4cw2hOIIgXl2yIOPZplUUCQQbMQQSTJcIUZpIBCLRgCowCiGOB9HU60pBYpVLpmZDFbimE5BQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(54906003)(6512007)(6506007)(2616005)(53546011)(26005)(478600001)(31686004)(186003)(4326008)(6916009)(316002)(66556008)(66946007)(66476007)(6486002)(8676002)(83380400001)(7416002)(38100700002)(41300700001)(5660300002)(8936002)(2906002)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SytBdHR5RTZiL0NoaWFmbG5taHArRlFPZEZKV3pNTTc0MXg1aC83QmFQSFNj?=
 =?utf-8?B?MlNMTXlZVlBuZHFqN0lmQzV1ZGVUSzErTmROYXl6cnNNem5ZWHVWNExsRytk?=
 =?utf-8?B?bVdqb0l0b2N4M2dOeTZNTDlSSVNLRzQyN3JIbXVoc3BiaWcrSG9CZmZLcnBi?=
 =?utf-8?B?TWM4SlZ5blc3a1gyRTVhQmJuTWZ5cVBjMG93RGtySUpOVmQyTzJ1Yi9VSXdy?=
 =?utf-8?B?OU40N2pYc1J0dWFTajFQMWlNR3NFZjE1NTV6dXprSUtpZlFWYlBPMitYSmZE?=
 =?utf-8?B?SXdpSG16TDlpVis5dUtGOFVMQ1FrN2lUaE1taEZXRHN4V3NMMG1kT0dKNXRs?=
 =?utf-8?B?eEtZdXVTYXF6ZStjZ0RJbFg1d2lwSzVMRmp5U2NTa1RXUW4zanJPb1NEMXNh?=
 =?utf-8?B?U3ZQWUN1akRyNDd0SWpRNWNUS0c0UlRLNEJEdmV5MzY3VXhvTW9FTTRCamk2?=
 =?utf-8?B?SW1XNjhOTUNnV0ROV3BGamRwSUgvb3ZSQTZ4K0tYdmdmMy93Wkc3OUs2azJo?=
 =?utf-8?B?UjErZnk0blFGYmJoR0U3cmowZXkrRXRVeDB2amZhclNnT0hKREcreUQvWE5H?=
 =?utf-8?B?dC9ub2ZESEkzZHM0MHhkMUFHVXpNT2J1VmI0RXhLeUt6V3RUNzlYY2gzZGhJ?=
 =?utf-8?B?dDdiSC9ocmtNTHN6MzgxY1BkOFhGejZ3bnZjSnlPWEdUMjBURmtiNUF5T1FP?=
 =?utf-8?B?ZC9HYS95aU9uVnd1WVRWN0Y3bU1rcWVlYW02Wm85djZGQk9VeGhqZmVPRXo1?=
 =?utf-8?B?V3lCN2NzUTg5Q2JxRURmelFDMzN0QXVKem5tNDF3b0pvbmFyVVZkcUJtYTE2?=
 =?utf-8?B?SVVBMFl4QkJmckhFYml6UlJ3T1V3QU54RUtMZXN2MXdONU8rV3VwWGFja2Yy?=
 =?utf-8?B?ZlJxbVJvb1NDU1NHSm1pNnFPbUxxV0NJWE1xZWN0eDZBVU5pQ3J4dmt6Witv?=
 =?utf-8?B?YWJpSUNwZkh3TmhrOXdKVlBnaHlLbXplYnZNb0tHSGkxT3gvVkxxRjJPSDVm?=
 =?utf-8?B?TFRTQWUrRTRpNmhleFk5YXB5UmVZY3VwaXNDYXA1WGdXYU9pVjFhQXRjbXc2?=
 =?utf-8?B?TXRUc2RsYTdxSWJsN2c3amZmWHRDZ1ZhVUJRTmdhZmpIdmNPRzNxMFhGdThT?=
 =?utf-8?B?dGxPNlI2eWQvNkRaY3JEcmUvVmhTVEx3NGV5VmhqTGRhSTNuQlhCWWtvRWhp?=
 =?utf-8?B?T2d6UlNVSEhxSUhnSjlwWk9qdFJHMC9leTZScnR2dkwxb2hQYmpqdUxVNEI3?=
 =?utf-8?B?b0NpSmdIaGFDYVlKTFhpRVRlY2JadUk2YmoyRUI0Vk40U1dld0JVYTFZMTN2?=
 =?utf-8?B?OUxjMVFmd2RmYXNrRUJIY0ZCR1RSY2o4MEZPdVY0N2dRU0w4bHF3OG80elV6?=
 =?utf-8?B?ZHdKQlFHbVduOXZVYzZGVm5pUkEyLy9ic2RWSXdobmRGYWxzdDdMRlJFUjdo?=
 =?utf-8?B?QlVoaGxxcjRrT2dhSFVuc2g3cnpKaGM0dTAxcTBIYm1uYmowK05KR0ZzUGdT?=
 =?utf-8?B?S0VvbEZKREhqUjBHTzRpcGZORm16NkxoNEFqYTBLVG45d1JKVG9YRTd2OVNE?=
 =?utf-8?B?NlZYa0xLMkRGTjUyUU16UjdWZkJPVjQ5TDVORVFPODF5bnRBRG8xdHh2OHpa?=
 =?utf-8?B?WVRtRlBmZUQxdnoyYWxvTm9ocDZ0Q01wU0g2dlVGbXlPUC9VYk5LR0NoNndY?=
 =?utf-8?B?QWYyTkJmR0FLcTZhbHIzTzFtVHFBeVhMd2ZFcS9YWHl4Q0JGMFU1WDBKNDEy?=
 =?utf-8?B?ejc1YVhQN0J3L1NMM3dQM2FJWXMxRW92U2xXSlJRcENtZ25ZWnJvUDhJWENB?=
 =?utf-8?B?SW1ycy9HWllwMFA3a0ZGZGRNUFBESnlMMWRzQ2xRM2t5NGdhdVR4WGI5LzhJ?=
 =?utf-8?B?R2Q4ckJvRDZVVEtXNEE5MW9ldTEyKzlBSXhuWXk2Z292N05PMUdSOW1vOUlG?=
 =?utf-8?B?OXFLSkFJRVNtTlh5eHZoTWhmbU5mZG9lUWNacWNYYzlKK0RvQVZOUms3SnFs?=
 =?utf-8?B?SlY2VEhldStiZENGU0VuaXFaRjNjTVNlYy9EY3JqQXJiRCtMU2c3TGpCa0Za?=
 =?utf-8?B?cUlwRGlVa292T29QalJZZkRkMyt3bktpdFNoSFh3eXhuSVVoRk5HU2c0aHRn?=
 =?utf-8?Q?vbOK6oJg94ovqfyjghdPNa/qh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b09f301-f933-45e0-db6b-08db303d0ea9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:05:00.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhIR2qN5iIzOAVcxhkDrtshKP2wIfkW1aNLc6AQYsW3is6FYeh22VQKzrbFRGLcHGn70G4Ma+botqwqiOpayfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655

On 14.03.2023 21:56, Volodymyr Babchuk wrote:
> @@ -422,33 +423,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      return pdev;
>  }
>  
> -static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
> -{
> -    /* update bus2bridge */
> -    switch ( pdev->type )
> -    {
> -        unsigned int sec_bus, sub_bus;
> -
> -        case DEV_TYPE_PCIe2PCI_BRIDGE:
> -        case DEV_TYPE_LEGACY_PCI_BRIDGE:
> -            sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> -            sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
> -
> -            spin_lock(&pseg->bus2bridge_lock);
> -            for ( ; sec_bus <= sub_bus; sec_bus++ )
> -                pseg->bus2bridge[sec_bus] = pseg->bus2bridge[pdev->bus];
> -            spin_unlock(&pseg->bus2bridge_lock);
> -            break;
> -
> -        default:
> -            break;
> -    }
> -
> -    list_del(&pdev->alldevs_list);
> -    pdev_msi_deinit(pdev);
> -    xfree(pdev);
> -}

No matter what cleanup model we choose in the end, I think it would be helpful
if this function wasn't effectively moved to the end of the file, but adjusted
in place. Then it'll be much easier to see what actually is moved out of here.
pcidev_{get,put}() could be added right after this function. They're important
enough anyway to warrant them not living at the bottom of the
file.

Jan

