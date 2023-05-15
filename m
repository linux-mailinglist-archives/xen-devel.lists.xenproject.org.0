Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EE702619
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 09:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534572.831698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySfX-0000mM-1l; Mon, 15 May 2023 07:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534572.831698; Mon, 15 May 2023 07:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySfW-0000kK-UZ; Mon, 15 May 2023 07:30:54 +0000
Received: by outflank-mailman (input) for mailman id 534572;
 Mon, 15 May 2023 07:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pySfV-0000k9-DL
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 07:30:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b17a0f1-f2f2-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 09:30:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:30:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 07:30:49 +0000
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
X-Inumbo-ID: 6b17a0f1-f2f2-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqhEiCFq5Oh8XbIZJDMqhTG6C2SgTf8avbI83U8uVCnW9r+cdXiNPTPeylQAFx4wioRY37t2JfkaoWzZcmfo6yjn8bSn4kWdREieln8EeLZZgYwvAOYbTnB/E9G7wFRlCWYR8ukwrM4HkKznuB+G43zR5Eq7zl3j+eduzEEwZlh7N8MPaBNcoX+LqQJ2TNlXfDM0/3+VIRxgEc6BoKY9j80MDp5F6Gb7fZe8Ytaze4/d9Fx/vytOl0ntsN9cFbiJaE5GnlQDNKx+HHyuSHVfJQMXKixEZGU3IlL3wBmNqoA7dtLRjnW2ymEWbCUpLq9mJihmDE3+MP+MvGmJzH5kSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDofIGobZV3ZfZtNUodE5fycUG4IC6S48IzkCYA1KAY=;
 b=AhPxECmQ0mo0tk6DXIwadx2UaoNhhyV8HKHt35bBRISH/XLxi8kTG/bZptB+Rxe9+UDmfOOk20Zc4EsX4PteHdR38/VJLvGfWT6hYvta0OAObCMhBjxmjyzf5A5grccJmtRwQkMqn960NnUrbeuvsWowAKxbyy3qlCiWQ0A3zG3Cg/LcDDqrcJ5goUrnQt9dM9zkASlQDYrmDByM+EIDyDUmHQohGUNmye8xObR2PAtNcbYiH17qqS0zqBj4P6DL6s7gNlQS3jPmZt5y/lB0hw+NHQrYyEoYhDf1fABLuWXNoyWDv8JWmTuB6UOuCEAAlEsbUlWxD/mlRFXCN91X2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDofIGobZV3ZfZtNUodE5fycUG4IC6S48IzkCYA1KAY=;
 b=w356QRrWqhvYfW6uVrUXFECdemdl0fHyjNJd34aKG2vAA9AnWPh9AJXABRxwcWn6zmPttV2SHfVS0Zs1Kvc9cg0YyQMKEJWcdI6g4v/mM+BTOhR0JxLVzZuYBRSUiiksXPGA70orAG+EKYatgldT1xGMf204L5zrbC7gzW56IFzlasdFmdRkB4Oz5oFixPbXO770qO7qtira2fspu8D4DWkB0WzRMX+eBZfhX24B8Nqn4z7+JkYyPq4Pr78RD0PpDk/F2V93TBxWCQ00ogOnE5VCeO+WN1TEt/fjCZ7xlJEhLnfk//NKgnHe/F/18Nwkz72mI3Egusw6jESYwMiQKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <100b0a85-e138-b4a3-c70d-38581c44c04d@suse.com>
Date: Mon, 15 May 2023 09:30:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/8] pci/arm: Use iommu_add_dt_pci_device()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-6-stewart.hildebrand@amd.com>
 <61ae93e8-ac8f-b373-4fa7-0a8aeb61ef4f@suse.com>
 <f7d78b4e-3a16-d342-59d2-caa4d2b75b9c@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f7d78b4e-3a16-d342-59d2-caa4d2b75b9c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4399c8-cdb1-463c-fa33-08db55164e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6RLnnc2M9IfSRUqNjugFzYBIk/FRsdlrv4Xl76fbZUT0yVzo7k0dJ9qbRvsq2j17DxR1BUeN75/rSpliclLH4PlrOnXgJWU0kQGDTBD5otmdOFuUXhr8ePXCNfB4I2cuoeqnvONs3bYY7ADKHpqc1n4pkwIqBFINLk8BiK7BYSt4oouAwpqrQSQRsugXGSFzePg8I2EMpw0LYsqtnaHQhordugY+v7H6qQNcYGE4+krlSAzGSOfj878uN01F0ik/lFcTLoMi2ev61kKppX6b22N8zvclII5nKJS8wnkJxL3fy2Sp4BGxwYth8ecB4d9QQqJHtCY0aSspn/zoHoFwPOxqpYefEcnECru7vqDVO128EjFEQw6D3IO9Ryr9N3z49NOLv4iXd9WCxYU+fb7BF50pPeaYOUk8wC1vXFaVKKQLW4w6UT+Uv0MHM0VIHRZDqhgfGzbkEvhj/eMNXtjo+7WYOk8lsVSr+MfoykdLvZZAoi8OAKxvZMPIrJx6M+DO+LxyKCI+lMYmDiv7g/N7G/TqpcjBBZ9HzThGjPXxN0Pgeu6sR7kUfG05u2fzC77kLVAO6gNYJzyf6yjZ4CGY80hNg3C/UhFKqzDu3kB9jyBAeeXLM6GGslA/NzPLDASwN++RVpj6ebprfXmei45Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(31686004)(66556008)(6916009)(4326008)(66476007)(478600001)(66946007)(54906003)(6506007)(186003)(53546011)(6512007)(38100700002)(2616005)(36756003)(8936002)(8676002)(2906002)(6486002)(316002)(31696002)(86362001)(5660300002)(41300700001)(7416002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDFIbGo1b0c5ZnZSblVValZHK2EvUVg4K2pwZUhKU3orNy9KOHk2bFV2a09J?=
 =?utf-8?B?SmlVNTcrTmFyaG9WVXQzTUR4WWhaL28yWC94dG5QZERlMUUyeEpPL3NxS1Mr?=
 =?utf-8?B?ZmZONjRFemJFbFNrWnZycGJocU9mam1VZGZwRGp5cXdkenUydHplanZEWTJY?=
 =?utf-8?B?VVhFbXFHbXlaMHk3MzkyM1IxbHNEbWRJV0FIbzJHTUJkVFYrdW04cDBhTnRi?=
 =?utf-8?B?dXlvbU9Idi9hc0FqbWdvNDNZeWRXa1VQdjZ5MjFhMHpmRWorYUFJc0pPeksy?=
 =?utf-8?B?eS9Pd0NGRHhTRVh0cjQ0KzYwYkFMcGp3S09FMkpTZUhLVXpGTDBJRzhWWENW?=
 =?utf-8?B?YmFwYm1Bc0FpNWRWSmVhTkJnb2tKZnhYRzN5dWRmK3ZWc2RLWXRYYVBCY0xB?=
 =?utf-8?B?YzI4YS8wbXo4YllsU2JvSUFoOTFmNzhMZCtVWklEN0hoL1hmVFYrbVhqRjdi?=
 =?utf-8?B?Mld5SjdQNUpwUnNvazdzejZONUZRVXJjTjNqVVZOWHlmaXZkZm13cW9iWWRt?=
 =?utf-8?B?TXMxN3h1dEpGL1hyRlJOYXJsd3VnZlJha1J0M0ZiaS9xem1BUFZ2enI2TGVk?=
 =?utf-8?B?aUtPNnMxRnpyblhXMlBWQTM5b0hZM2x2K2xDcnNJNy9TbVNNNld2QXBRQkZW?=
 =?utf-8?B?UEJSVmZVbXl1TFE4U0dBb3JCYkJBMEU3N3dFSFFwY2lubjVxWkFYWkx6bzRB?=
 =?utf-8?B?L0JoanZhanNVaXlDRzU0b0t2U1JUOHNpMWgvczhyNDlCelFEaENuMDBOanpa?=
 =?utf-8?B?NnJPNzdLdmhkSlozdEJqWFFzSXFHaWdZdEs0bExFTG8wY2NNU1M4cXFKUUxQ?=
 =?utf-8?B?Vkt3VlRtTjFUd0djSHJqZjhhUVZhaVJIS2hsWXcrSlN0Vzh3UG5hVkNScUhr?=
 =?utf-8?B?NEhxRHJPUWVjUDJZaUJBZDd4T05CM2NUR1FzdVBUa2h1Z1BMditQeFg0SWw0?=
 =?utf-8?B?V3VZQmlBYVFjMEhtdXpYK014QXdURCt0SnZCMVR4OUdMTjZzYUpkRjVMRHNu?=
 =?utf-8?B?L000UGhBY2c1bnEwaG4wU2tVcExNSzVSQk10bTlCQ3R6Ymxpa0dZLy9yMmtM?=
 =?utf-8?B?U1BQN2k1aDdvQWpia1B4Q1d6K3JuZWo2V3c5VndjSWVGbWxrS0FyOC9hdkVC?=
 =?utf-8?B?TGp6MFVoc2pvN0xaMzZzQmlSRXJ2Q0pHRlBYV1VnQXVpVzQ0N2R5U2dkbTd0?=
 =?utf-8?B?anlUYWtSRWxCOUxTbFVtcm1SYm5yV3FkM2JuL2lNOVljcWxPZW8zWVVrbDdu?=
 =?utf-8?B?N1hONkk5Z0ZaRW4zOFdEbW81U2ppY3NMOUJaOFpyUWtWRGEyb2t2Z1ZTV1U5?=
 =?utf-8?B?KzNoN1JjajlLRnZuUG1RSmZhNUU2bDZ2TDZmcDBvdFpsSDdYaXNOK2wvSmpY?=
 =?utf-8?B?NjN0QWNGV2JraFNQM2xROXdKajRud3RoaFlzNCs3RkFicXd5WFo2MU1HTTZZ?=
 =?utf-8?B?M0Z6MUZwWllwUGYrN2ZxeEU2amFMK01OWHE5N1B5TlNSUzhPV3plb1BYRFRu?=
 =?utf-8?B?VXN1NzVpdXpUT3VybVQvOXZMSWQxNmtGbGdqWnoyQkJjS1lvL1JwSTdiMW14?=
 =?utf-8?B?dEp4Y0dVTFdNbkJ5SGJmWUtJQnZsR3BYOFZBYS80U2ZYRlROYUJyQU5VZkha?=
 =?utf-8?B?TFRURW1iSTNDbkZkdU5kQm5CVU5Jc1RTTnNXVURkUmhJdTBTQXRJWG5NaGQ0?=
 =?utf-8?B?WEF1dEVVQWFpalo1SVZkTVE3SGxZeWNKRDk2d0VoQ2J0S0NJR2dqSXZTQ1l6?=
 =?utf-8?B?TEVFMXgxSUNaMC9qUmdEZWJCWThsVG1PRFRnd3YzaW4rMk41UUxRb0oyZVM1?=
 =?utf-8?B?Qm5Hdkc1VWlNL0UvL0ROMHg4a2dHWlhXS3BLMzhxV1RrVThrcndXTk15dFM1?=
 =?utf-8?B?WEw3OHdQUzdSNWw3Y21xNG1CU25FTC9vcEJnWVYxUURVY2szUkF2UXhCelRp?=
 =?utf-8?B?UkI4SWFhZ1ExSzFlaHl5UEM2K0VWYm0yZ1FybnZTdGtjS3VhMEhIOWhvM0tj?=
 =?utf-8?B?SUY4WUZvamk0bk90UlYzQVpyTjdIajhwT3AzU1UvdG1INTVqYWNIRTJQd08y?=
 =?utf-8?B?Wjd3dXBhTkVPY3lFMCtJNHBFS3F3Y3lvMkkrdlVhTTkyVWxqMENJYVl5WG9k?=
 =?utf-8?Q?Ner5984+pB01/R4hT9sDciFl/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4399c8-cdb1-463c-fa33-08db55164e41
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 07:30:49.5406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVWy/m9wtaYRMiUia9zCumDUcnzAK1IyITUlXFdMKEz/dON+P5RvRR6lVuP1VLMZ/NvvyezqIKPn9c7TLkD2Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068

On 12.05.2023 23:03, Stewart Hildebrand wrote:
> On 5/12/23 03:25, Jan Beulich wrote:
>> On 11.05.2023 21:16, Stewart Hildebrand wrote:
>>> @@ -762,9 +767,20 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>              pdev->domain = NULL;
>>>              goto out;
>>>          }
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +        ret = iommu_add_dt_pci_device(pdev);
>>> +        if ( ret < 0 )
>>> +        {
>>> +            printk(XENLOG_ERR "pci-iommu translation failed: %d\n", ret);
>>> +            goto out;
>>> +        }
>>> +#endif
>>>          ret = iommu_add_device(pdev);
>>
>> Hmm, am I misremembering that in the earlier patch you had #else to
>> invoke the alternative behavior?
> 
> You are remembering correctly. v1 had an #else, v2 does not.
> 
>> Now you end up calling both functions;
>> if that's indeed intended,
> 
> Yes, this is intentional.
> 
>> this may still want doing differently.
>> Looking at the earlier patch introducing the function, I can't infer
>> though whether that's intended: iommu_add_dt_pci_device() checks that
>> the add_device hook is present, but then I didn't find any use of this
>> hook. The revlog there suggests the check might be stale.
> 
> Ah, right, the ops->add_device check is stale in the other patch. Good catch, I'll remove it there.
> 
>> If indeed the function does only preparatory work, I don't see why it
>> would need naming "iommu_..."; I'd rather consider pci_add_dt_device()
>> then.
> 
> The function has now been reduced to reading SMMU configuration data from DT and mapping RID/BDF -> AXI stream ID. However, it is still SMMU related, and it is still invoking another iommu_ops hook function, dt_xlate (which is yet another AXI stream ID translation, separate from what is being discussed here). Does this justify keeping "iommu_..." in the name? I'm not convinced pci_add_dt_device() is a good name for it either (more on this below).

The function being SMMU-related pretty strongly suggests it wants to be
invoked via a hook. If the add_device() one isn't suitable, perhaps we
need a new (optional) prepare_device() one? With pci_add_device() then
calling iommu_prepare_device(), wrapping the hook invocation?

But just to be clear: A new hook would need enough justification as to
the existing one being unsuitable.

Jan

