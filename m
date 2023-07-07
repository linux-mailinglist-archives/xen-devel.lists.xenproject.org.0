Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296474AB2A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560170.875860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHf23-0000kC-64; Fri, 07 Jul 2023 06:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560170.875860; Fri, 07 Jul 2023 06:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHf23-0000h2-3C; Fri, 07 Jul 2023 06:33:31 +0000
Received: by outflank-mailman (input) for mailman id 560170;
 Fri, 07 Jul 2023 06:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHf21-0000gw-IY
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:33:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e49b8cc-1c90-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 08:33:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7913.eurprd04.prod.outlook.com (2603:10a6:10:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 06:32:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:32:57 +0000
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
X-Inumbo-ID: 2e49b8cc-1c90-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVm6sU2tDJulPpjwo2GkZhPHpdSloum47QDVX6gUo6AGYmp7oIn1FSbYz3/SSnnurJoy+n/2tldsHkcj8MrQGQ2ykLqxVd/fOiM/gJDSnFylg0bX+/dZbF+M5T2U3mthOBFtV6SbYaiiJlqunL3ik43PUM0WjbweSQu91ei31S++L1xKOaPFej9cslehbdzyxLYTsf/P99e9X/NwK/NBWlMDC4iz0TBAAvxPkXHS7Z5zIfw2MHEzs3uw9sT16UzgeB8sGxdgKCjC4mwUKIQnH3o2bQ2yJW7fQ4nMoZTsS3HuNJEtcFTeBN2ibeCYFSz5KYEN0IM9foq2uG/LsBrw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5VxBTkIf+j4Tu2a5hY04lbMSs8PaSW52Z3IZ6PkoOs=;
 b=cO7xA3SwUVBpZ6EVGgFGA08br5dt0hno3fB5WmylnjtvN4SiTNo0ilXpNtQRovjte87nMi67dv5iiCWq6mcJacH7hUvLbo7MOgjd7HhGDXkhOKA2S+oqw1r7bsTdszcy61SO/rmYHqS5v/HR9uAGu1wsfTgnSVlX6jtENIuBrR05He4Ur2o/iJ5NOtyiTVqANKQ/nc7IWZ03hXoHyM+wKrfUlcYEo/jTRvHzRL+g70P/XXCyegxoFGyUy6ooIPdzgaI2nZB6R58NVQASllyQB7jSO8/6qST2XEhXxLEWXjljCa3HDhHEuOQx0jHYMcgwqHsQJFjrpIEipx+LAr0xZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5VxBTkIf+j4Tu2a5hY04lbMSs8PaSW52Z3IZ6PkoOs=;
 b=J4Y1O9pj8Dj8mWL0sPugBm/gtjD8RdVFXzzg4tTHSiwWGkjsYdmiQz/OthWQtEHtSd/R+k8QHqsoJlCssGSt2JREnP/igOGduTCAsUi3XXXvyHisu9RztUfGApt77MM872VszJW4ItoxxSW2NOXjN2YOaS1hpTYYwNAviwVgOBWK4OaDFzRdJeUrf7nLb7PuERUZeyxM4NlFWF/g8febe2lYNguUNN+FFSD+L2w4IujP0dVFdbOPWcntlSNUclVWphJGDWrq0w2orQzS9ezNAmKe7dR2ybGBM6l1z1bLrWO5u9LW3BdCHGbhnQyFgO+bGwiAVhOuMa2aq2CmVBn2PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0c60476-ac03-cc6d-59f4-d317f1b4a7e8@suse.com>
Date: Fri, 7 Jul 2023 08:32:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <87wmzfmltd.fsf@epam.com>
 <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
 <ZKUw2MPBhOSgG-Eg@MacBook-Air-de-Roger.local>
 <a964cffa-fb42-b0e0-e60a-1044d8794193@suse.com> <87mt08mqb9.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87mt08mqb9.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e392dd4-abf9-4f37-eaf4-08db7eb40097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sPUrOC6lb5QLidrmOElwrALsUFYyObBJCYmTFGuc7An0Taaazt8XKNLCeGdYLp4OTb8rHqxXaqlv79x7KwniwpNYrIyWZB6YBSqeyGMZt4eeIE5pfgkm2cfTQr17aVmn5GxhYSSZFevJO2Ld6PhwcO8CSanKKGX4mjYMgyikNmPxrHFghOh5Jjy2rMGkt8rt3AeqhmRTlYPf1/Sta0Cs9rdH939CBdhAGO5uvrz4h+0gbdi9XbZtaEy6vIFlZCRek+aMVbDSvJkmTQBoZSSenqL38MkdQIO6TMFLTsk6wyDEK/4YNsUTTN1sl66plgo/BZCuaQkS22Afz3U/lUuou3K0IajgNomztJigzFjds/Iag9dO/7Q3O1BTtV5ROhgRUkZEukEjPs+Nl1Q46r/G6crygLR6AEpMy0jcs1RSB+0b8bGH5TetOdR72UecD5vFn0vwenRX27+Z0bNYDyl9zxomBKrLP4YDpNMC5ZE11ODdaqJC1r7V/Jz5709Wade7lfTlk660bgZU9jTtoqYOwUiKNrAE4nKp9nX99Gs0tyBzZwgi8YJiTUqDrwTLvp19bJ6jSEpMkDQX5RthONva9wZrqW1v4xWvyqKyWsogmB0dSR0OdMndzbZTgmqu/aNjArW6IxzXSlA8kq3xy/G8wQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(316002)(36756003)(31686004)(86362001)(31696002)(7416002)(2906002)(5660300002)(6512007)(186003)(83380400001)(6506007)(53546011)(26005)(54906003)(66556008)(6486002)(66476007)(66946007)(4326008)(38100700002)(2616005)(6916009)(8936002)(478600001)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW93SVZBZnRnaC9kTWlRR3d3UVRHaGllU1B2UDBuOXorOXBNeTdHY0F3dkI3?=
 =?utf-8?B?clZvV0FDanpCOG1SdFJab1JWQTR5NldwVE9NV1ppM2N6QUZISzhwczFRR3Jo?=
 =?utf-8?B?S0JnUlJaUDdmZmkyUnpsekZZU2NGNm1FQUUrdVZRYW83S0t3MUFZNkp1Zmkv?=
 =?utf-8?B?c3RIdEdwWmVkeG5qZGwxR1ZtV0h6VEdXSC82eFIwbUV1S2hHdEtUMldyMDk1?=
 =?utf-8?B?ZGdUTk9ReE5NaCtMYnduOGdYT0pCQ2dkdUxaL0xUSklvWGhYS2llYWVLK2xl?=
 =?utf-8?B?ZEx0MTZQcmc4cG5ibFdhb3YvMmI3cnNzYmNlZWpiWmtOMTNGZ05wS2ZiTEYw?=
 =?utf-8?B?bkpIVm9KNm5xTkQzbnhLVlZlQzJ4cGtQU1JZQWxZOWNBblEyMlRVMHJ6L1JH?=
 =?utf-8?B?KzQ3Q2JQam5ZWUI4N3VnWEY4b21NUWhMaU5YVnBaSWI3bHJ0Z2JOdEI2SmR2?=
 =?utf-8?B?TEFFR3RBTEJ6Q0FwMkExMkUvN2xkcmVxR1lkVmwyWUM3Mkg0K1ZnRmRLaEdC?=
 =?utf-8?B?VGp0NkF2S1BscThJNW9PVE5QZEU3aXR5ZmpCL1JIM3BvNEZBSGp0VnUyZGZR?=
 =?utf-8?B?aWRNMnZzT1I2U0l3RE5PSnI2RVFqNVd3SU51ZTZqaTd1Uk1tSEJaVlVkUUFE?=
 =?utf-8?B?SFpSYStlNWVncmorVUNiQWQrakV5Z2FzSTA3RW1nc29GQm9IbkVVSWpqQ2Fw?=
 =?utf-8?B?Y3duUnpETkNSMW5Qak1teU1TMHVDYWZqbmNBMVExZzR3QmhIRi9GbFpDd0Fv?=
 =?utf-8?B?TCsrc1FsbHRuREJhMGMvVmo3UE4xalBOV2dkZklIK3VHUGdIeENPMHF2VTdt?=
 =?utf-8?B?d29mMm5GTWo3MHFuUm5maFlEM2JiWmQ5TnJYN2FaQUVGSzl3a0ZpM05pa2lk?=
 =?utf-8?B?TmNTN2MyZ1M1bmk3anM2T0hHL255OXhndDJPYjliY2pURHI3OE4vT3EzZU9G?=
 =?utf-8?B?eXBEQWFldmoxczZoYWtuWjZSS3o4WHRxS0JzMTAvbWxZdnhWTjhwcmdqYU9L?=
 =?utf-8?B?bFlhaFpCTENEWFZDT21jNHFUVGJpeVBDYk1uRmZSODErMGVaRktWZnpyeGF5?=
 =?utf-8?B?cHJkT1ZqeEZrakZMRjBIaXpIOWw0aEFOZFMrRDdZdXZPaFVwZExrUzFPNE9h?=
 =?utf-8?B?d3pLNm9lTU5xa05pdjU3dWZObXN3dUJ4Zzdaem12U0J4WTJtVzNHWW1SY0oy?=
 =?utf-8?B?VEx4Rkw0L2tmUGVtQk04bVJ1aU1xQXNmcW5qc2w4dWZHbktPSlJrU3hrSk5H?=
 =?utf-8?B?OHN1MzgwUmgxbUMyY1JGMDRRM1AzVkZDcXlwUDdKV2tDSFRQRTFna1ExeWZW?=
 =?utf-8?B?QVVPRTF3K3ZGMDIxWXFtd09GOHlTbFNIMWwwc0RGMENaZCtGUFRrT3diUW55?=
 =?utf-8?B?Ti9zMkFNeEhUR20wN1JXSVJKeFo0VXQ4TFZaamcxcmE1SUNmNDk4NnRDNnRh?=
 =?utf-8?B?ZC9ZckhTMmRvZ0RDU0NQdlN1RTM3YzVWa3h0MGdIczRWc2puYmVFeW56aXR4?=
 =?utf-8?B?c1AyWEVtR1RGZVBsUE5wWnk0a25LZG5xTWIwYnZITHlueExRSXRXMVZmWEpw?=
 =?utf-8?B?b3VPZTZGTFpEY1Y5MjJ4dVQ3aDVjNDFoQUtRT3FaWk5qemZ5WlJtd1Z0MEVT?=
 =?utf-8?B?RGs2SVRocWJPWDNpOXg1Mi9hTnhvSm9vQWg0OFBOaUxqZE81VUQ0dXg1WC80?=
 =?utf-8?B?NUE4ZldEZ2FDWjlJR09DSjREYkFidXhhV0NMTGtaNVVIQlpMSWZxL0Z0TExR?=
 =?utf-8?B?VTJzRk9wUWk3c0drRVZZK0haZ2xncDBJOUk4MmhmRE5hR3hEUS9YVEF5ZGIr?=
 =?utf-8?B?UkJuYmpmMlJwSU0wK2Nha0VaYnZjQXB6ajFHRmZuVFBMRmp6SGFFanF1SnVE?=
 =?utf-8?B?czE5MWIxVE9jS2FtMSt2U1ZWbnRCMmpPQlhXaG9tWmx6UjhkcGxzYnB2YU93?=
 =?utf-8?B?bmJUL2IzM2tiY2IwdkJEWHdLcy8vckJYZkl4aDlJTmpxR1JJNmN6bGVyZ0ww?=
 =?utf-8?B?TUxMdDhnRU5hREgrV1lTNnloSjRiaXlZY25hcVhEWktyTlZJampCSVpPOHVL?=
 =?utf-8?B?TjZoc0NDMExOYWVJWDV5dVBiUCtZWEhpc2x3TWZnR0hTcU5kZzJWanJoOXEx?=
 =?utf-8?Q?tP6tHe9UpdUZgWrIN3bSsiW6S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e392dd4-abf9-4f37-eaf4-08db7eb40097
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:32:57.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJkayOWvPzcPsO4KdhEYbbs08uIEIdeE9RFVksQS0mi7NPwN6OpZlkNqAPZYg5xLwn1WmApQa1xW4nXiro+sdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7913

On 07.07.2023 04:02, Volodymyr Babchuk wrote:
> 
> Hi Jan,
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 05.07.2023 10:59, Roger Pau Monné wrote:
>>> On Wed, Jul 05, 2023 at 09:11:10AM +0200, Jan Beulich wrote:
>>>> On 04.07.2023 23:03, Volodymyr Babchuk wrote:
>>>>> I am currently implementing your proposal (along with Jan's
>>>>> suggestions), but I am facing ABBA deadlock with IOMMU's
>>>>> reassign_device() call, which has this piece of code:
>>>>>
>>>>>         list_move(&pdev->domain_list, &target->pdev_list);
>>>>>
>>>>> My immediate change was:
>>>>>
>>>>>         write_lock(&pdev->domain->pci_lock);
>>>>>         list_del(&pdev->domain_list);
>>>>>         write_unlock(&pdev->domain->pci_lock);
>>>>>
>>>>>         write_lock(&target->pci_lock);
>>>>>         list_add(&pdev->domain_list, &target->pdev_list);
>>>>>         write_unlock(&target->pci_lock);
>>>>>
>>>>> But this will not work because reassign_device is called from
>>>>> pci_release_devices() which iterates over d->pdev_list, so we need to
>>>>> take a d->pci_lock early.
>>>>>
>>>>> Any suggestions on how to fix this? My idea is to remove a device from a
>>>>> list one at time:
>>>>>
>>>>> int pci_release_devices(struct domain *d)
>>>>> {
>>>>>     struct pci_dev *pdev;
>>>>>     u8 bus, devfn;
>>>>>     int ret;
>>>>>
>>>>>     pcidevs_lock();
>>>>>     write_lock(&d->pci_lock);
>>>>>     ret = arch_pci_clean_pirqs(d);
>>>>>     if ( ret )
>>>>>     {
>>>>>         pcidevs_unlock();
>>>>>         write_unlock(&d->pci_lock);
>>>>>         return ret;
>>>>>     }
>>>>>
>>>>>     while ( !list_empty(&d->pdev_list) )
>>>>>     {
>>>>>         pdev = list_entry(&d->pdev_list, struct pci_dev, domain_list);
>>>>>         bus = pdev->bus;
>>>>>         devfn = pdev->devfn;
>>>>>         list_del(&pdev->domain_list);
>>>>>         write_unlock(&d->pci_lock);
>>>>>         ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>>>>>         write_lock(&d->pci_lock);
>>>>
>>>> I think it needs doing almost like this, but with two more tweaks and
>>>> no list_del() right here (first and foremost to avoid needing to
>>>> figure whether removing early isn't going to subtly break anything;
>>>> see below for an error case that would end up with changed behavior):
>>>>
>>>>     while ( !list_empty(&d->pdev_list) )
>>>>     {
>>>>         const struct pci_dev *pdev = list_first_entry(&d->pdev_list, struct pci_dev, domain_list);
>>>>         uint16_t seg = pdev->seg;
>>>>         uint8_t bus = pdev->bus;
>>>>         uint8_t devfn = pdev->devfn;
>>>>
>>>>         write_unlock(&d->pci_lock);
>>>
>>> I think you need to remove the device from the pdev_list before
>>> dropping the lock, or else release could race with other operations.
>>>
>>> That's unlikely, but still if the lock is dropped and the routine
>>> needs to operate on the device it is better remove such device from
>>> the domain so other operations cannot get a reference to it.
>>>
>>> Otherwise you could modify reassign_device() implementations so they
>>> require the caller to hold the source->pci_lock when calling the
>>> routine, but that's ugly because the lock would need to be dropped in
>>> order to reassign the device from source to target domains.
>>>
>>> Another option would be to move the whole d->pdev_list to a local
>>> variable (so that d->pdev_list would be empty) and then iterate over
>>> it without the d->pci_lock.  On failure you would take the lock and
>>> add the failing device back into d->pdev_list.
>>
>> Conceptually I like this last variant, but like the individual list_del()
>> it requires auditing code for no dependency on the device still being on
>> that list. In fact deassign_device()'s use of pci_get_pdev() does. The
>> function would then need changing to have struct pci_dev * passed in.
>> Yet who knows where else there are uses of pci_get_pdev() lurking.
> 
> Okay, so I changed deassign_device() signature and reworked the loop
> in pci_release_devices() in a such way:
> 
>     INIT_LIST_HEAD(&tmp_list);
>     /* Move all entries to tmp_list, so we can drop d->pci_lock */
>     list_splice_init(&d->pdev_list, &tmp_list);
>     write_unlock(&d->pci_lock);
> 
>     list_for_each_entry_safe ( pdev, tmp, &tmp_list, domain_list )
>     {
>         pdev = list_entry(&d->pdev_list, struct pci_dev, domain_list);
>         rc = deassign_device(d, pdev);
>         if ( rc )
>         {
>             /* Return device back to the domain list */
>             write_lock(&d->pci_lock);
>             list_add(&pdev->domain_list, &d->pdev_list);
>             write_unlock(&d->pci_lock);
>             func_ret = rc;
>         }
>     }
> 
> 
> Also, I checked for all pci_get_pdev() calls and found that struct
> domain (the first parameter) is passed only in handful of places:
> 
> *** xen/drivers/vpci/vpci.c:
> vpci_read[504]                 pdev = pci_get_pdev(d, sbdf);
> vpci_read[506]                 pdev = pci_get_pdev(dom_xen, sbdf);
> vpci_write[621]                pdev = pci_get_pdev(d, sbdf);
> vpci_write[623]                pdev = pci_get_pdev(dom_xen, sbdf);
> 
> *** xen/arch/x86/irq.c:
> map_domain_pirq[2166]          pdev = pci_get_pdev(d, msi->sbdf);
> 
> *** xen/drivers/passthrough/pci.c:
> XEN_GUEST_HANDLE_PARAM[1712]   pdev = pci_get_pdev(d, machine_sbdf);
> 
> The last one is due to my change to deassign_device() signature.

And which is going to continue to return NULL when earlier on you've
emptied the list. The purpose of passing in struct pdev * was to
eliminate this call. (Yet there may be further reasons why eliminating
this call actually isn't correct.)

> ==============================
> 
> d->pdev_list can be accessed there:
> 
> *** xen/drivers/passthrough/amd/pci_amd_iommu.c:
> reassign_device[489]           list_add(&pdev->domain_list, &target->pdev_list);
> 
> *** xen/drivers/passthrough/pci.c:
> _pci_hide_device[463]          list_add(&pdev->domain_list, &dom_xen->pdev_list);
> pci_get_pdev[561]              list_for_each_entry ( pdev, &d->pdev_list, domain_list )
> pci_add_device[759]            list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> pci_release_devices[917]       list_splice_init(&d->pdev_list, &tmp_list);
> pci_release_devices[922]       pdev = list_entry(&d->pdev_list, struct pci_dev, domain_list);
> pci_release_devices[928]       list_add(&pdev->domain_list, &d->pdev_list);
> _setup_hwdom_pci_devices[1155] list_add(&pdev->domain_list, &ctxt->d->pdev_list);
> 
> *** xen/drivers/passthrough/vtd/iommu.c:
> reassign_device_ownership[2819] list_add(&pdev->domain_list, &target->pdev_list);
> 
> *** xen/include/xen/pci.h:
> for_each_pdev[149]             list_for_each_entry(pdev, &(domain)->pdev_list, domain_list)
> has_arch_pdevs[151]            #define has_arch_pdevs(d) (!list_empty(&(d)->pdev_list))
> 
> ==============================
> 
> And has_arch_pdevs() is used there:
> 
> *** xen/arch/x86/hvm/hvm.c:
> hvm_set_cr0[2388]              has_arch_pdevs(d)) )
> 
> *** xen/arch/x86/hvm/vmx/vmcs.c:
> vmx_do_resume[1892]            if ( has_arch_pdevs(v->domain) && !iommu_snoop
> 
> *** xen/arch/x86/mm.c:
> l1_disallow_mask[172]          !has_arch_pdevs(d) && \
> 
> *** xen/arch/x86/mm/p2m-pod.c:
> p2m_pod_set_mem_target[352]    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> guest_physmap_mark_populate_on_demand[1404] if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> 
> *** xen/arch/x86/mm/paging.c:
> paging_log_dirty_enable[208]   if ( has_arch_pdevs(d) )
> 
> *** xen/drivers/passthrough/vtd/iommu.c:
> reassign_device_ownership[2773] if ( !has_arch_pdevs(target) )
> reassign_device_ownership[2807] if ( !has_arch_pdevs(target) )
> reassign_device_ownership[2825] if ( !has_arch_pdevs(source) )
> 
> 
> has_arch_pdevs() bothers me most, actually, because it is not always
> obvious how to add locking for the callers. I am planning to rework it
> in the following way:

Locking is only one aspect. As above, another is whether the function
might wrongly return "false" when you prematurely empty the list of
devices.

> #define has_arch_pdevs_unlocked(d) (!list_empty(&(d)->pdev_list))
> 
> static inline bool has_arch_pdevs(struct domain *d)
> {
>     bool ret;
> 
>     read_lock(&d->pci_lock);
>     ret = has_arch_pdevs_unlocked(d);
>     read_unlock(&d->pci_lock);
> 
>     return ret;
> }

No, this follows a pattern that earlier was said isn't acceptable:
The result of such a check is meaningless to the caller without holding
the lock past actually consuming the result. It simply is stale by the
time you return to the caller. (There may be special cases where other
constraints eliminate the concern, like maybe during domain
construction or domain cleanup, but such need carefully considering in
each individual case. Which in particular means there shouldn't be any
common-use helper functions doing what is unsafe in the general case.)

Jan

